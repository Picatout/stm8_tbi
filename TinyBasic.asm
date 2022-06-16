;;
; Copyright Jacques Deschênes 2019,2022  
; This file is part of stm8_tbi 
;
;     stm8_tbi is free software: you can redistribute it and/or modify
;     it under the terms of the GNU General Public License as published by
;     the Free Software Foundation, either version 3 of the License, or
;     (at your option) any later version.
;
;     stm8_tbi is distributed in the hope that it will be useful,
;     but WITHOUT ANY WARRANTY; without even the implied warranty of
;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;     GNU General Public License for more details.
;
;     You should have received a copy of the GNU General Public License
;     along with stm8_tbi.  If not, see <http://www.gnu.org/licenses/>.
;;

;--------------------------------------
;   Implementation of Tiny BASIC
;   REF: https://en.wikipedia.org/wiki/Li-Chen_Wang#Palo_Alto_Tiny_BASIC
;   Palo Alto BASIC is 4th version of TinyBasic
;   DATE: 2019-12-17
;
;--------------------------------------------------
;     implementation information
;
; *  integer are 24 bits in registers they are 
;    kept as A:X   (A being most signifant byte)
; *  an expression stack is used *xstack* 
;    register Y is used as xstack pointer 
; 
;    IMPORTANT: when a routine use Y it must preserve 
;               its content and restore it at exit.
;               This hold only wheb BASIC is running  
;
; *  BASIC function return their value registers 
;    A for character 
;	 X for address 
;	 A:X for integer 
; 
;  * variables return their value in A:X 
;
;  * relation, expression return value on xstack 
;    and A=TK_INTGR or else if no expression.
;--------------------------------------------------- 

    .module STM8_TBI

    .include "config.inc"

.if SEPARATE
	.include "inc/nucleo_8s208.inc"
	.include "inc/stm8s208.inc"
	.include "inc/ascii.inc"
	.include "inc/gen_macros.inc" 
	.include "tbi_macros.inc" 
.endif 

;--------------------------------------
    .area DATA 
;--------------------------------------	

; keep the following 3 variables in this order 
in.w::  .blkb 1 ; parser position in text line high-byte 
in::    .blkb 1 ; low byte of in.w 
count:: .blkb 1 ; current BASIC line length and tib text length  
in.saved:: .blkb 1 ; set by get_token before parsing next token, used by unget_token
basicptr::  .blkb 2  ; point to current BASIC line address.
data_ptr:  .blkw 1  ; point to DATA address
data_ofs:  .blkb 1  ; index to next data item 
data_len:  .blkb 1  ; length of data line 
base::  .blkb 1 ; nemeric base used to print integer 
acc32:: .blkb 1 ; 32 bit accumalator upper-byte 
acc24:: .blkb 1 ; 24 bits accumulator upper-byte 
acc16:: .blkb 1 ; 16 bits accumulator, acc24 high-byte
acc8::  .blkb 1 ;  8 bits accumulator, acc24 low-byte  
ticks: .blkb 3 ; milliseconds ticks counter (see Timer4UpdateHandler)
timer:: .blkw 1 ;  milliseconds count down timer 
seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
ptr16::  .blkb 1 ; 16 bits pointer , farptr high-byte 
ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
txtbgn:: .blkw 1 ; tokenized BASIC text beginning address 
txtend:: .blkw 1 ; tokenized BASIC text end address 
loop_depth: .blkb 1 ; level of nested loop. Conformity check   
array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
flags:: .blkb 1 ; various boolean flags
free_eeprom: .blkw 1 ; start address of free eeprom 
rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
rx1_head:  .blkb 1 ; rx1_queue head pointer
rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
dvar_bgn:: .blkw 1 ; DIM variables start address 
dvar_end:: .blkw 1 ; DIM variables end address 
chain_level: .blkb 1 ; increment for each CHAIN command 
out: .blkw 1 ; output char routine address 
i2c_buf: .blkw 1 ; i2c buffer address 
i2c_cnt: .blkb 1 ; buffer size 
i2c_status: .blkb 1 ; error status 

; 24 bits integer variables 
vars:: .blkb 3*26 ; BASIC variables A-Z,

	.area BTXT (ABS)
	.org 0x8C  
; keep 'free_ram' as last variable 
; basic code compiled here. 
rsign: .blkw 1 ; "TB" 
rsize: .blkw 1 ; code size 	 
free_ram: ; from here RAM free for BASIC text 

	.area CODE 


;-------------------------------------
; retrun string length
; input:
;   X         .asciz  pointer 
; output:
;   X         not affected 
;   A         length 
;-------------------------------------
strlen::
	pushw x 
	clr a
1$:	tnz (x) 
	jreq 9$ 
	inc a 
	incw x 
	jra 1$ 
9$:	popw x 
	ret 

;------------------------------------
; compare 2 strings
; input:
;   X 		char* first string 
;   Y       char* second string 
; output:
;   A 		0 not == |1 ==  
;-------------------------------------
strcmp:
	ld a,(x)
	jreq 5$ 
	cp a,(y) 
	jrne 9$ 
	incw x 
	incw y 
	jra strcmp 
5$: ; same
	cp a,(y)
9$:	ret 


;---------------------------------------
;  copy src to dest 
; input:
;   X 		dest 
;   Y 		src 
; output: 
;   X 		dest 
;----------------------------------
strcpy::
	push a 
	pushw x 
1$: ld a,(y)
	jreq 9$ 
	ld (x),a 
	incw x 
	incw y 
	jra 1$ 
9$:	clr (x)
	popw x 
	pop a 
	ret 

;---------------------------------------
; move memory block 
; input:
;   X 		destination 
;   Y 	    source 
;   acc16	bytes count 
; output:
;   none 
;--------------------------------------
	INCR=1 ; incrament high byte 
	LB=2 ; increment low byte 
	VSIZE=2
move::
	push a 
	_vars VSIZE 
	clr (INCR,sp)
	clr (LB,sp)
	pushw y 
	cpw x,(1,sp) ; compare DEST to SRC 
	popw y 
	jreq move_exit ; x==y 
	jrmi move_down
move_up: ; start from top address with incr=-1
	addw x,acc16
	addw y,acc16
	cpl (INCR,sp)
	cpl (LB,sp)   ; increment = -1 
	jra move_loop  
move_down: ; start from bottom address with incr=1 
    decw x 
	decw y
	inc (LB,sp) ; incr=1 
move_loop:	
    ld a, acc16 
	or a, acc8
	jreq move_exit 
	addw x,(INCR,sp)
	addw y,(INCR,sp) 
	ld a,(y)
	ld (x),a 
	pushw x 
	ldw x,acc16 
	decw x 
	ldw acc16,x 
	popw x 
	jra move_loop
move_exit:
	_drop VSIZE
	pop a 
	ret 	

;------------------------------------
;  set all variables to zero 
; input:
;   none 
; output:
;	none
;------------------------------------
clear_vars:
	pushw x 
	push a  
	ldw x,#vars 
	ld a,#CELL_SIZE*26 
1$:	clr (x)
	incw x 
	dec a 
	jrne 1$
	pop a 
	popw x 
	ret 


;-----------------------
;  display system 
;  information 
;-----------------------
	MAJOR=2
	MINOR=0 
software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "

system_information:
	ldw x,#software 
	call puts 
	ld a,#MAJOR 
	ld acc8,a 
	clrw x 
	ldw acc24,x
	mov base, #10 
	call prt_acc24 
	ld a,#'.
	call putc 
	ld a,#MINOR 
	ld acc8,a 
	clrw x 
	ldw acc24,x 
	call prt_acc24
	ld a,#CR 
	call putc
;call test 
	ret

warm_init:
	ldw y,#XSTACK_EMPTY
	ldw x,#uart1_putc 
	ldw out,x ; standard output   
	clr flags 
	clr loop_depth 
	mov base,#10 
	ldw x,#0 
	ldw basicptr,x 
	ldw in.w,x 
	clr count
	ret 

;---------------------------
; reset BASIC text variables 
; and clear variables 
;---------------------------
clear_basic:
	pushw x 
	clr count
	clr in  
	ldw x,#free_ram 
	ldw txtbgn,x 
	ldw txtend,x 
	ldw dvar_bgn,x 
	ldw dvar_end,x 
	call clear_vars 
	clr chain_level
	popw x
	ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   Tiny BASIC error messages     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
err_msg:
	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
	.word err_overflow,err_read_only,err_not_program  

err_mem_full: .asciz "Rejected, memory full\n" 
err_syntax: .asciz "syntax error\n" 
err_math_ovf: .asciz "math operation overflow\n"
err_div0: .asciz "division by 0\n" 
err_no_line: .asciz "invalid line number.\n"
err_run_only: .asciz "run time only usage.\n" 
err_cmd_only: .asciz "command line only usage.\n"
err_duplicate: .asciz "duplicate name.\n"
err_not_file: .asciz "File not found.\n"
err_bad_value: .asciz "bad value.\n"
err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
err_no_data: .asciz "No data found.\n"
err_no_prog: .asciz "No program in RAM!\n"
err_no_fspace: .asciz "File system full.\n" 
err_buf_full: .asciz "Buffer full\n"
err_overflow: .asciz "overflow\n" 
err_read_only: .asciz "constant can't be modified\n"
err_not_program: .asciz "no program at this address\n"

;-------------------------------------
rt_msg: .asciz "\nrun time error, "
comp_msg: .asciz "\ncompile error, "
tk_id: .asciz "last token id: "

syntax_error::
	ld a,#ERR_SYNTAX 

tb_error::
	btjt flags,#FCOMP,1$
	push a 
	btjf flags,#FRUN,0$ 
	ldw x, #rt_msg 
	call puts 
0$:	pop a 
	ldw x, #err_msg 
	clr acc16 
	sll a
	rlc acc16  
	ld acc8, a 
	addw x,acc16 
	ldw x,(x)
	call puts
	ldw x,basicptr 
	ld a,in 
	call prt_basic_line
	ldw x,#tk_id 
	call puts 
	ld a,in.saved 
	clrw x 
	ld xl,a 
	addw x,basicptr 
	ld a,(x)
	clrw x 
	ld xl,a 
	call prt_i16
	jra 6$
1$:	
	push a 
	ldw x,#comp_msg
	call puts 
	pop a 
	ldw x, #err_msg 
	clr acc16 
	sll a
	rlc acc16  
	ld acc8, a 
	addw x,acc16 
	ldw x,(x)
	call puts
	ldw x,#tib
	call puts 
	ld a,#CR 
	call putc
	ldw x,in.w
	call spaces
	ld a,#'^
	call putc 
6$: ldw x,#STACK_EMPTY 
    ldw sp,x

warm_start:
	call warm_init
;----------------------------
;   BASIC interpreter
;----------------------------
cmd_line: ; user interface 
	ld a,#CR 
	call putc 
	ld a,#'> 
	call putc
	call readln
	tnz count 
	jreq cmd_line
	call compile
;;;;;;;;;;;;;;;;;;;;;;	
;pushw y 
;ldw x,txtbgn  
;ldw y,txtend
;ldw acc16,x   
;subw y,acc16 
;call hex_dump
;popw y 
;;;;;;;;;;;;;;;;;;;;;;

; if text begin with a line number
; the compiler set count to zero    
; so code is not interpreted
	tnz count 
	jreq cmd_line
	
; if direct command 
; it's ready to interpret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This is the interpreter loop
;; for each BASIC code line. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
interpreter: 
	ld a,in 
	cp a,count 
	jrmi interp_loop
next_line:
	btjf flags, #FRUN, cmd_line
	ldw x,basicptr
	addw x,in.w 
	cpw x,txtend 
	jrmi 0$
	call cmd_end ; end program 
0$:	ldw basicptr,x ; start of next line  
	ld a,(2,x)
	ld count,a 
	mov in,#3 ; skip first 3 bytes of line 
	btjf flags,#FTRACE,interp_loop 
	ldw x,(x)
	call prt_i16
interp_loop:
	call next_token
	cp a,#TK_NONE 
	jreq next_line 
	cp a,#TK_CMD
	jrne 1$
	_get_code_addr
	call(x)
	jra interp_loop 
1$:	 
	cp a,#TK_VAR
	jrne 2$
	call let_var  
	jra interp_loop 
2$:	
	cp a,#TK_ARRAY 
	jrne 3$
	call let_array 
	jra interp_loop
3$:	
	cp a,#TK_LABEL
	jrne 4$
	call let_dvar  
	jra interp_loop 
4$: 
	cp a,#TK_COLON 
	jreq interp_loop
5$:	jp syntax_error 


;----------------------
; when a label is met 
; at interp_loop
; it may be a variable 
; assignement to DIM 
; variable 
;----------------------
	VAR_NAME=1 
	REC_LEN=3
	VSIZE=4 
let_dvar:
	_vars VSIZE 
	ldw (VAR_NAME,sp),x
	clr (REC_LEN,sp) 
	call skip_string 
	ldw x,basicptr 
	addw x,in.w 
	ld a,(x)
	cp a,#TK_EQUAL 
	jreq dvar_assign
	btjt flags,#FRUN,1$
	jp syntax_error
1$: _drop VSIZE 
	ret 
dvar_assign: 	 
; dvar assignment 
	inc in  
	call condition  
	cp a,#TK_INTGR 
	jreq 1$ 
0$:	jp syntax_error 
1$: 
	ldw x,(VAR_NAME,sp) ; pointer to var name 
	call strlen 
	add a,#REC_XTRA_BYTES
	ld (REC_LEN+1,sp),a 
	call search_name 
	tnzw x 
	jreq 0$ 
	ld a,(x)
	jrpl 2$
	ld a,#ERR_RD_ONLY 
	jp tb_error 
2$:
	addw x,(REC_LEN,sp)
	subw x,#CELL_SIZE 
	ldw ptr16,x
	_xpop 
	ld [ptr16],a 
	inc ptr8 
	ldw [ptr16],x 
9$: _drop VSIZE 	
	ret 


;--------------------------
; extract next token from
; token list 
; basicptr -> base address 
; in  -> offset in list array 
; output:
;   A 		token attribute
;   X 		*token_value 
;----------------------------------------
next_token::
;	clrw x 
	ld a,in 
	ld in.saved,a ; in case "_unget_token" needed 
; don't replace sub by "cp a,count" 
; if end of line must return with A=0   	
	sub a,count 
	jreq 9$ ; end of line 
0$: 
	ldw x,basicptr 
	addw x,in.w 
	ld a,(x)
	incw x
	inc in   
9$: ret 

;-------------------------
;  skip .asciz in BASIC line 
;  name 
;  input:
;     x		* string 
;  output:
;     none 
;-------------------------
skip_string:
	ld a,(x)
	jreq 1$
	incw x 
	jra skip_string 
1$: incw x 	
	subw x,basicptr 
	ldw in.w,x 
	ret 

;---------------------
; extract 16 bits  
; address from BASIC
; code 
; input:
;    X    *address
; output:
;    X    address 
;-------------------- 
get_addr:
	ldw x,(x)
	inc in 
	inc in 
	ret 

;--------------------
; extract int24_t  
; value from BASIC 
; code 
; input:
;    X   *integer 
; output:
;    A:X   int24  
;--------------------
get_int24:
	ld a,(x)
	ldw x,(1,x)
; skip 3 bytes 
	inc in 
	inc in 
	inc in 
	ret 

;-------------------------
; get character from 
; BASIC code 
; input:
;    X   *char 
; output:
;    A    char 
;-------------------------
get_char:
	ld a,(x)
	inc in  
    ret 

;-----------------------------------
; print a 16 bit integer 
; using variable 'base' as conversion
; format.
; input:
;    X       integer to print 
;   'base'    conversion base 
; output:
;   terminal  
;-----------------------------------
prt_i16:
	clr acc24 
	ldw acc16,x 
	ld a,#16
	cp a,base
	jreq prt_acc24  
	btjf acc16,#7,prt_acc24
	cpl acc24 ; sign extend 
	
;------------------------------------
; print integer in acc24 
; input:
;	acc24 		integer to print 
;	'base' 		numerical base for conversion 
;    A 			signed||unsigned conversion
;  output:
;    A          string length
;------------------------------------
prt_acc24:
	ld a,#255  ; signed conversion  
    call itoa  ; conversion entier en  .asciz
	push a 
	call puts
	pop a 
    ret	

;---------------------------------------
;  print value at xstack top 
;---------------------------------------
print_top: 
	_xpop 
	ld acc24,a 
	ldw acc16,x 
	call prt_acc24 
	ret 

;------------------------------------
; convert integer in acc24 to string
; input:
;   'base'	conversion base 
;	acc24	integer to convert
;   A       0=unsigned, else signed 
; output:
;   X  		pointer to first char of string
;   A       string length
;------------------------------------
	SIGN=1  ; integer sign 
	LEN=2 
	PSTR=3
	VSIZE=4 ;locals size
itoa::
	_vars VSIZE
	clr (LEN,sp) ; string length  
	clr (SIGN,sp)    ; sign
	tnz A
	jreq 1$ ; unsigned conversion  
	ld a,base 
	cp a,#10
	jrne 1$
	; base 10 string display with negative sign if bit 23==1
	btjf acc24,#7,1$
	cpl (SIGN,sp)
	call neg_acc24
1$:
; initialize string pointer 
	ldw x,#tib 
	addw x,#TIB_SIZE
	decw x 
	clr (x)
itoa_loop:
    ld a,base
    call divu24_8 ; acc24/A 
    add a,#'0  ; remainder of division
    cp a,#'9+1
    jrmi 2$
    add a,#7 
2$:	
	decw x
    ld (x),a
	inc (LEN,sp)
	; if acc24==0 conversion done
	ld a,acc24
	or a,acc16
	or a,acc8
    jrne itoa_loop
	;conversion done, next add '$' or '-' as required
	ld a,base 
	cp a,#16
	jreq 8$
	ld a,(SIGN,sp)
    jreq 10$
    ld a,#'-
	jra 9$ 
8$:	
	ld a,#'$ 
9$: decw x
    ld (x),a
	inc (LEN,sp)
10$:
; add a space
	decw x 
	ld a,#SPACE 
	ld (x),a
	ld a,(LEN,sp)
	inc a 
	_drop VSIZE
	ret

;------------------------------------
; convert alpha to uppercase
; input:
;    a  character to convert
; output:
;    a  uppercase character
;------------------------------------
to_upper::
	cp a,#'a
	jrpl 1$
0$:	ret
1$: cp a,#'z	
	jrugt 0$
	sub a,#32
	ret
	
;------------------------------------
; convert pad content in integer
; input:
;    x		* .asciz to convert
; output:
;    A:X        int24_t 
;    acc24      int24_t
;------------------------------------
	; local variables
	SIGN=1 ; 1 byte, 
	BASE=2 ; 1 byte, numeric base used in conversion
	TEMP=3 ; 1 byte, temporary storage
	XTEMP=4 ; 2 bytes, preserve X 
	VSIZE=5 ; 5 bytes reserved for local storage
atoi24::
	_vars VSIZE
	ldw (XTEMP,sp),x 
; conversion made on xstack 
	clr a 
	clrw x 
	_xpush 
	clr (SIGN,sp)
	ld a,#10
	ld (BASE,sp),a ; default base decimal
	ldw x,(XTEMP,sp)
	ld a,(x)
	jreq 9$  ; completed if 0
	cp a,#'-
	jrne 1$
	cpl (SIGN,sp)
	jra 2$
1$: cp a,#'$
	jrne 3$
	ld a,#16
	ld (BASE,sp),a
2$:	incw x
	ldw (XTEMP,sp),x 
	ld a,(x)
3$:	; char to digit 
	cp a,#'a
	jrmi 4$
	sub a,#32
4$:	cp a,#'0
	jrmi 9$
	sub a,#'0
	cp a,#10
	jrmi 5$
	sub a,#7
	cp a,(BASE,sp)
	jrpl 9$
5$:	ld (TEMP,sp),a
	ld a,(BASE,sp)
	call mulu24_8
	_xpush 
	clrw x 
	ld a,(TEMP,sp)
	rlwa x 
	_xpush 
	call add24 
	ldw x,(XTEMP,sp)
	jra 2$
9$:	tnz (SIGN,sp)
    jreq atoi_exit
    call neg24
atoi_exit:
	_xpop 
	ld acc24,a 
	ldw acc16,x  
	_drop VSIZE
	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   TINY BASIC  operators,
;;   commands and functions 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;---------------------------------
; dictionary search 
; input:
;	X 		dictionary entry point, name field  
;   y		.asciz name to search 
; output:
;  A 		TK_CMD|TK_IFUNC|TK_NONE 
;  X		routine address|TK_OP 
;---------------------------------
	NLEN=1 ; cmd length 
	XSAVE=2
	YSAVE=4
	VSIZE=5 
search_dict::
	_vars VSIZE 
	ldw (YSAVE,sp),y 
search_next:
	ldw (XSAVE,sp),x 
; get name length in dictionary	
	ld a,(x)
	and a,#0xf 
	ld (NLEN,sp),a  
	ldw y,(YSAVE,sp) ; name pointer 
	incw x 
cp_loop:
	ld a,(y)
	jreq str_match 
	tnz (NLEN,sp)
	jreq no_match  
	cp a,(x)
	jrne no_match 
	incw y 
	incw x
	dec (NLEN,sp)
	jra cp_loop 
no_match:
	ldw x,(XSAVE,sp) 
	subw x,#2 ; move X to link field
	push #TK_NONE 
	ldw x,(x) ; next word link 
	pop a ; TK_NONE 
	jreq search_exit  ; not found  
;try next 
	jra search_next
str_match:
	tnz (NLEN,sp)
	jrne no_match
	ldw x,(XSAVE,sp)
	ld a,(X)
	ld (NLEN,sp),a ; needed to test keyword type  
	and a,#NLEN_MASK 
; move x to procedure address field 	
	inc a 
	ld acc8,a 
	clr acc16 
	addw x,acc16 
	ldw x,(x) ; routine address  
;determine keyword type bits 7:4 
	ld a,(NLEN,sp)
	and a,#KW_TYPE_MASK 
	swap a 
	add a,#128
search_exit: 
	_drop VSIZE 
	ret 

;--------------------------------
;  called by command that should 
;  be invoked only from command 
;  line.
;  Display an error if 
;  invoked from program.
;---------------------------------
cmd_line_only:
	btjf flags,#FRUN,0$
	ld a,#ERR_CMD_ONLY
	jp tb_error 
0$: ret 

;--------------------------------
; called by command/function that 
; should be invoked only at run time
; Display an error if invoked from 
; command line. 
;---------------------------------
runtime_only:
	btjt flags,#FRUN,0$ 
	ld a,#ERR_RUN_ONLY
	jp tb_error 
0$:	ret 

;---------------------
; check if next token
;  is of expected type 
; input:
;   A 		 expected token attribute
;  ouput:
;   none     if fail call syntax_error 
;--------------------
expect:
	push a 
	call next_token 
	cp a,(1,sp)
	jreq 1$
	jp syntax_error
1$: pop a 
	ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;
; parse arguments list 
; between ()
;;;;;;;;;;;;;;;;;;;;;;;;;;
func_args:
	ld a,#TK_LPAREN 
	call expect 
; expected to continue in arg_list 
; caller must check for TK_RPAREN 

;-------------------------------
; parse embedded BASIC routines 
; arguments list.
; arg_list::=  expr[','expr]*
; all arguments are of int24_t type
; and pushed on stack 
; input:
;   none
; output:
;   xstack{n}   arguments pushed on xstack
;   A 	number of arguments pushed on xstack  
;--------------------------------
arg_list:
	push #0
1$:	call condition 
	tnz a 
	jreq 7$  
	inc (1,sp)
	call next_token 
	cp a,#TK_COMMA 
	jreq 1$ 
	cp a,#TK_RPAREN
	jreq 7$
	_unget_token 
7$:	pop a  
	ret 

;--------------------------------
;   BASIC commnands 
;--------------------------------

;--------------------------------
;  arithmetic and relational 
;  routines
;  operators precedence
;  highest to lowest
;  operators on same row have 
;  same precedence and are executed
;  from left to right.
;	'*','/','%'
;   '-','+'
;   '=','>','<','>=','<=','<>','><'
;   '<>' and '><' are equivalent for not equal.
;--------------------------------

;---------------------
; return array element
; address from @(expr)
; input:
;   A 		TK_ARRAY
; output:
;	X 		element address 
;----------------------
get_array_element:
	call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error
1$: _xpop 
    ; ignore A, index < 65536 in any case 
	; check for bounds 
	cpw x,array_size 
	jrule 3$
; bounds {1..array_size}	
2$: ld a,#ERR_BAD_VALUE 
	jp tb_error 
3$: tnzw  x
	jreq 2$ 
	ld a,#CELL_SIZE  
	mul x,a 
	ldw acc16,x   
	ldw x,#tib ; array is below tib 
	subw x,acc16 
	ret 


;***********************************
;   expression parse,execute 
;***********************************
;-----------------------------------
; factor ::= ['+'|'-'|e]  var | @ |
;			 integer | function |
;			 '('relation')' 
; output:
;   A       token attribute 
;   xstack  value  
; ---------------------------------
	NEG=1
	VSIZE=1
factor:
	_vars VSIZE 
	clr (NEG,sp)
	call next_token
	tnz a 
	jrne 1$ 
	jp 22$ 
1$:	cp a,#TK_PLUS 
	jreq 2$
	cp a,#TK_MINUS 
	jrne 4$ 
	cpl (NEG,sp)
2$:	
	call next_token
4$:
	tnz a 
	jrne 41$ 
	jp syntax_error  
41$:	
	cp a,#TK_IFUNC 
	jrne 5$ 
	_get_code_addr 
	call (x); result in A:X  
	jra 18$ 
5$:
	cp a,#TK_INTGR
	jrne 6$
	call get_int24 ; A:X
	jra 18$
6$:
	cp a,#TK_ARRAY
	jrne 7$
	call get_array_element
    jra 71$
7$:
	cp a,#TK_VAR 
	jrne 8$
	call get_addr 
71$: ; put value in A:X
	ld a,(x)
	ldw x,(1,x)
	jra 18$
8$:
	cp a,#TK_LABEL 
	jrne 9$
	pushw y  
	pushw x 
	call skip_string
	popw x  
	call strlen 
	add a,#REC_XTRA_BYTES
	call search_name
	tnzw x 
	jrne 82$ 
	popw y 
	jra 16$
82$:
	popw y   
	call get_value ; in A:X 
	jra 18$
9$: 
	cp a,#TK_CFUNC 
	jrne 12$
	_get_code_addr 
	call(x)
	clrw x 
	rlwa x  ; char>int24 in A:X 
	jra 18$ 	 
12$:			
	cp a,#TK_LPAREN
	jrne 16$
	call expression
	ld a,#TK_RPAREN 
	call expect
	_xpop 
	jra 18$	
16$:
	_unget_token 
	clr a 
	jra 22$ 
18$: 
	tnz (NEG,sp)
	jreq 20$
	call neg_ax   
20$:
	_xpush 
	ld a,#TK_INTGR
22$:
	_drop VSIZE
	ret


;-----------------------------------
; term ::= factor [['*'|'/'|'%'] factor]* 
; output:
;   A    	token attribute 
;	xstack		value 
;-----------------------------------
	MULOP=1
	VSIZE=1
term:
	_vars VSIZE
; first factor 	
	call factor
	tnz a 
	jreq term_exit  
term01:	 ; check for  operator '*'|'/'|'%' 
	call next_token
	ld (MULOP,sp),a
	and a,#TK_GRP_MASK
	cp a,#TK_GRP_MULT
	jreq 1$
	ld a,#TK_INTGR
	_unget_token 
	jra term_exit 
1$:	; got *|/|%
;second factor
	call factor
	tnz a 
	jrne 2$ 
	jp syntax_error 
2$: ; select operation 	
	ld a,(MULOP,sp) 
	cp a,#TK_MULT 
	jrne 3$
; '*' operator
	call mul24 
	jra term01
3$: cp a,#TK_DIV 
	jrne 4$ 
; '/' operator	
	call div24 
	jra term01 
4$: ; '%' operator
	call mod24
	jra term01 
9$: 
	ld a,#TK_INTGR
term_exit:
	_drop VSIZE 
	ret 

;-------------------------------
;  expr ::= term [['+'|'-'] term]*
;  result range {-32768..32767}
;  output:
;   A    token attribute 
;   xstack	 result    
;-------------------------------
	OP=1 
	VSIZE=1 
expression:
	_vars VSIZE 
; first term 	
	call term
	tnz a 
	jreq 9$
1$:	; operator '+'|'-'
	call next_token
	ld (OP,sp),a 
	and a,#TK_GRP_MASK
	cp a,#TK_GRP_ADD 
	jreq 2$ 
	_unget_token 
	ld a,#TK_INTGR
	jra 9$ 
2$: ; second term 
	call term
	tnz a 
	jrne 3$
	jp syntax_error
3$:
	ld a,(OP,sp)
	cp a,#TK_PLUS 
	jrne 4$
; '+' operator	
	call add24
	jra 1$ 
4$:	; '-' operator 
	call sub24
	jra 1$
9$:
	_drop VSIZE 
	ret 

;---------------------------------------------
; rel ::= expr rel_op expr
; rel_op ::=  '=','<','>','>=','<=','<>','><'
;  relation return  integer , zero is false 
;  output:
;	 xstack		value  
;---------------------------------------------
	RELOP=1
	VSIZE=1 
relation: 
	_vars VSIZE
	call expression
	tnz a 
	jreq 9$ 
; expect rel_op or leave 
	call next_token 
	ld (RELOP,sp),a 
	and a,#TK_GRP_MASK
	cp a,#TK_GRP_RELOP 
	jreq 2$
	ld a,#TK_INTGR 
	_unget_token 
	jra 9$ 
2$:	; expect another expression
	call expression
	tnz a 
	jrne 3$
	jp syntax_error 
3$: 
	call cp24 
	_xpop  
	tnz a 
	jrmi 4$
	jrne 5$
	mov acc8,#2 ; i1==i2
	jra 6$ 
4$: ; i1<i2
	mov acc8,#4 
	jra 6$
5$: ; i1>i2
	mov acc8,#1  
6$: ; 0=false, -1=true 
	clrw x 
	ld a, acc8  
	and a,(RELOP,sp)
	jreq 7$
	cplw x 
	ld a,#255 
7$:	_xpush 
	ld a,#TK_INTGR
9$: 
	_drop VSIZE
	ret 

;-------------------------------------------
;  AND factor:  [NOT] relation | (condition)
;  output:
;     A      TK_INTGR|0
;-------------------------------------------
	NOT_OP=1
and_factor:
	push #0 
0$:	call next_token  
	tnz a 
	jreq 8$ 
	cp a,#TK_NOT 
	jrne 1$ 
	cpl (NOT_OP,sp)
	jra 0$ 
1$:	
	cp a,#TK_LPAREN 
	jrne 2$
	call condition
	ld a,#TK_RPAREN 
	call expect
	jra 3$
2$: _unget_token 
	call relation
3$:
	tnz (NOT_OP,sp)
	jreq 8$ 
	call cpl24
8$:
	_drop 1  
    ret 


;--------------------------------------------
;  AND operator as priority over OR||XOR 
;  format: relation | (condition) [AND relation|(condition)]*
;          
;  output:
;     A     TK_INTGR|0
;    xtack   value 
;--------------------------------------------
and_cond:
	call and_factor
	tnz a 
	jreq 9$  
1$: call next_token 
	tnz a 
	jreq 6$ 
	cp a,#TK_AND 
	jreq 3$
	_unget_token 
	jra 6$ 
3$:	call and_factor  
	tnz a 
	jrne 4$
	jp syntax_error 
4$:	
	_xpop 
	ld acc24,a 
	ldw acc16,x
	_xpop 
	and a,acc24 
	rlwa x 
	and a,acc16 
	rlwa x 
	and a,acc8 
	rlwa x
	_xpush
	jra 1$  
6$: ld a,#TK_INTGR 
9$:	ret 	 


;--------------------------------------------
; condition for IF and UNTIL 
; operators: OR,XOR 
; format:  and_cond [ OP and_cond ]* 
; output:
;    A        INTGR|0 
;    xstack   value 
;--------------------------------------------
	ATMP=1
	OP=2
	VSIZE=2 
condition:
	_vars VSIZE 
	call and_cond
	tnz a 
	jreq 9$ 
1$:	call next_token 
	cp a,#TK_OR 
	jreq 2$
	cp a,#TK_XOR
	jreq 2$ 
	_unget_token 
	jra 8$ 
2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
	call and_cond
	cp a,#TK_INTGR 
	jreq 3$
	jp syntax_error 
3$:	 
	_xpop  ; rigth arg 
	ld acc24,a 
	ldw acc16,x 
	_xpop  ; left arg  
	ld (ATMP,sp),a 
	ld a,(OP,sp)
	cp a,#TK_XOR 
	jreq 5$ 
4$: ; A:X OR acc24   
	ld a,(ATMP,sp)
	or a,acc24 
	rlwa x 
	or a,acc16 
	rlwa x 
	or a,acc8 
	rlwa x 
	jra 6$  
5$: ; A:X XOR acc24 
	ld a,(ATMP,sp)
	xor a,acc24 
	rlwa x 
	xor a,acc16 
	rlwa x 
	xor a,acc8 
	rlwa x 
6$: _xpush
	jra 1$ 
8$:	ld a,#TK_INTGR 
9$:	_drop VSIZE 
	ret 


;--------------------------------------------
; BASIC: HEX 
; select hexadecimal base for integer print
;---------------------------------------------
hex_base:
	mov base,#16 
	ret 

;--------------------------------------------
; BASIC: DEC 
; select decimal base for integer print
;---------------------------------------------
dec_base:
	mov base,#10
	ret 

;------------------------
; BASIC: FREE 
; return free size in RAM 
; output:
;   A:x		size 
;--------------------------
free:
	clr a 
	ldw x,#tib 
	subw x,dvar_end 
	ret 

;------------------------------
; BASIC: SIZE 
; command that print 
; program start addres and size 
;------------------------------
cmd_size:
	push base 
	ldw x,#PROG_ADDR 
	call puts 
	ldw x,txtbgn     
	mov base,#16 
	call prt_i16
	pop base 
	ldw x,#PROG_SIZE 
	call puts 
	ldw x,txtend 
	subw x,txtbgn 
	call prt_i16
	ldw x,#STR_BYTES 
	call puts  
	ret 


;------------------------
; BASIC: UBOUND  
; return array variable size 
; and set 'array_size' variable 
; output:
;   A:X 	array_size
;--------------------------
ubound:
	call free 
	ld a,#CELL_SIZE 
	div x,a 
	ldw array_size,x
	clr a 
	ret 

;-----------------------------
; BASIC: LET var=expr 
; variable assignement 
; output:
;   A 		TK_NONE 
;-----------------------------
let::
	call next_token 
	cp a,#TK_VAR 
	jreq let_var
	cp a,#TK_ARRAY 
	jreq  let_array
	jp syntax_error
let_array:
	call get_array_element
	jra let_eval 
let_var:
	call get_addr
let_eval:
	ldw ptr16,x  ; variable address 
	call next_token 
	cp a,#TK_EQUAL
	jreq 1$
	jp syntax_error
1$:	
	call condition   
	cp a,#TK_INTGR 
	jreq 2$
	jp syntax_error
2$:	
	_xpop ; value 
3$:
	ld [ptr16],a
	inc ptr8  
	ldw [ptr16],x 
	ret 


;--------------------------
; return constant/dvar value 
; from it's record address
; input:
;	X	*record 
; output:
;   A:X   value
;--------------------------
get_value: ; -- i 
	ld a,(x) ; record size 
	and a,#REC_LEN_MASK 
	sub a,#CELL_SIZE ; * value 
	push a 
	push #0 
	addw x,(1,sp)
	ld a,(x)
	ldw x,(1,x)
	_drop 2
	ret 


;--------------------------
; BASIC: EEFREE 
; eeprom_free 
; search end of data  
; in EEPROM 
; input:
;    none 
; output:
;    A:X     address free
;-------------------------
func_eefree:
	ldw x,#EEPROM_BASE 
1$:	mov acc8,#8 ; count 8 consecutive zeros
    cpw x,#EEPROM_BASE+EEPROM_SIZE-8
	jruge 8$ ; no free space 
2$: ld a,(x)
	jrne 3$
	incw x 
	dec acc8 
	jrne 2$
	subw x,#8 
	jra 9$  
3$: ld a,(x)
	incw x
	tnz a  
	jrne 3$
	decw x   
	jra 1$ 
8$: clrw x ; no free space 
9$: clr a 
	ldw free_eeprom,x ; save in system variable 
	ret 

 
;--------------------------
; search constant/dim_var name 
; format of record  
;   .byte record length 
;         = strlen(name)+5 
;   .asciz name (variable length)
;   .int24 value (3 bytes )
; a constant record use 7+ bytes
; constants are saved in EEPROM  
; input:
;    A     name_len+REC_XTRA_BYTES 
;    X     *name
; output:
;    X     address|0
; use:
;   A,Y, acc16 
;-------------------------
	NAMEPTR=1 ; target name pointer 
	WLKPTR=3   ; walking pointer in EEPROM||RAM 
	NLEN=5  ;  length of target name 
	LIMIT=7   ; search area limit 
	VSIZE=8  
search_name:
	pushw y 
	_vars VSIZE
	clr acc16 
	ld (NLEN,sp),a    
	ldw (NAMEPTR,sp),x
	ldw x,dvar_end 
	ldw (LIMIT,sp),x 
	ldw y,dvar_bgn
1$:	ldw (WLKPTR,sp),y
	ldw x,y 
	cpw x, (LIMIT,sp) 
	jruge 7$ ; no match found 
	ld a,(y)
	and a,#REC_LEN_MASK
	cp a,(NLEN,sp)
	jrne 2$ 
	incw y 
	ldw x,(NAMEPTR,sp)
	call strcmp
	jreq 8$ ; match found 
2$: ; skip this one 	
	ldW Y,(WLKPTR,sp)
	ld a,(y)
	and a,#REC_LEN_MASK  
	ld acc8,a 
	addw y,acc16 
	jra 1$  
7$: ; no match found 
	clr (WLKPTR,sp)
	clr (WLKPTR+1,sp)
8$: ; match found 
	ldw x,(WLKPTR,sp) ; record address 
9$:	_DROP VSIZE
	popw y 
	 ret 

;--------------------------------------------
; BASIC: CONST name=value [, name=value]*
; define constant(s) saved in EEPROM
; share most of his code with cmd_dim 
;--------------------------------------------
	VAR_NAME=1 
	REC_LEN=3
	RONLY=5
	VSIZE=5
cmd_const:
	call runtime_only
	_vars VSIZE 
	ld a,#128 
	ld (RONLY,sp),a 
	clr (REC_LEN,sp)
	jra cmd_dim2 ; shared code with cmd_dim  

;---------------------------------
; BASIC: DIM var_name [var_name]* 
; create named variables at end 
; of BASIC program. 
; These variables are initialized 
; to 0. 
; record format same ast CONST 
; but r/w because stored in RAM 
;---------------------------------
cmd_dim:
	call runtime_only
cmd_dim1:	
	_vars VSIZE
	clr (REC_LEN,sp )
	clr (RONLY,sp)
cmd_dim2: 
0$:	call next_token 
	cp a,#TK_LABEL  
	jreq 1$ 
	jp syntax_error 
1$: ldw (VAR_NAME,sp),x ; name pointer 
	call strlen
	add a,#REC_XTRA_BYTES
	ld (REC_LEN+1,sp),a
	call skip_string 
	ld a,(REC_LEN+1,sp)
	ldw x,(VAR_NAME,sp) 
	call search_name  
	tnzw x 
	jreq 2$
	ld a,#ERR_DUPLICATE
	jp tb_error  
2$:	ldw x,dvar_end 
	ld a,(REC_LEN+1,sp)
	or a,(RONLY,sp)
	ld (x),a 
	incw x 
	pushw y 
	ldw y,(VAR_NAME+2,sp)
	call strcpy
	popw y 
	decw x
	addw x,(REC_LEN,sp)
	ldw dvar_end,x 
	subw x,#CELL_SIZE  
	clr (x)
	clr (1,x)  
	clr (2,x)
4$: call next_token 
	cp a,#TK_COMMA 
	jreq 0$ 
	cp a,#TK_EQUAL 
	jrne 8$
; initialize variable 
	call condition 
	cp a,#TK_INTGR
	jreq 5$
	jp syntax_error
5$: ldw x,dvar_end 
	subw x,#CELL_SIZE 
	ldw ptr16,x 
	_xpop 
	ld [ptr16],a 
	inc ptr8 
	ldw [ptr16],x 
	jra 4$ 
8$:	
	_unget_token 	
	_drop VSIZE 
	call ubound 
	ret 


;;;;;;;;;;;;;;;;;;;;;;;;;;
; return program size 
;;;;;;;;;;;;;;;;;;;;;;;;;;
prog_size:
	ldw x,txtend 
	subw x,txtbgn 
	ret 

;----------------------------
; print program information 
;---------------------------
program_info: 
	ldw x,#PROG_ADDR 
	call puts 
	ldw x,txtbgn 
	mov base,#16 
	call prt_i16
	mov base,#10  
	ldw x,#PROG_SIZE
	call puts 
	call prog_size 
	call prt_i16 
	ldw x,#STR_BYTES 
	call puts
	ldw x,txtbgn
	cpw x,#app 
	jrult 2$
	ldw x,#FLASH_MEM 
	jra 3$
2$: ldw x,#RAM_MEM 	 
3$:	call puts 
	ld a,#CR 
	call putc
	ret 

PROG_ADDR: .asciz "program address: "
PROG_SIZE: .asciz ", program size: "
STR_BYTES: .asciz " bytes" 
FLASH_MEM: .asciz " in FLASH memory" 
RAM_MEM:   .asciz " in RAM memory" 


;----------------------------
; BASIC: LIST [[start][-end]]
; list program lines 
; form start to end 
; if empty argument list then 
; list all.
;----------------------------
	FIRST=1
	LAST=3 
	LN_PTR=5
	VSIZE=6 
cmd_list:
	call cmd_line_only
	call prog_size 
	jrugt 3$
	ret 
3$: _vars VSIZE
	ldw x,txtbgn 
	ldw (LN_PTR,sp),x 
	ldw x,(x) 
	ldw (FIRST,sp),x ; list from first line 
	ldw x,#MAX_LINENO ; biggest line number 
	ldw (LAST,sp),x 
	call next_token 
	cp a,#TK_INTGR
	jreq start_from 
is_minus: 	
	cp a,#TK_MINUS 
	jreq end_at_line
	cp a,#TK_NONE
	jreq list_loop
	cp a,#TK_COLON 
	jreq list_loop
	jp syntax_error
start_from:	 
	call get_int24
	ldw (FIRST,sp),x	
lines_skip:
	pushw y 
	clr a 
	call search_lineno 
	tnzw x 
	jrne 1$
	ldw x,y 
1$:	popw y 
	ldw (LN_PTR,sp),x 
	call next_token 
	cp a,#TK_MINUS 
	jreq end_at_line 
	cp a,#TK_NONE 
	jreq 2$
	cp a,#TK_COLON 
	jreq 2$
	jp syntax_error 
2$:
	ldw x,(FIRST,sp)
	ldw (LAST,sp),x 
	jra list_loop 
end_at_line:
; expect ending line# 
    call next_token 
	cp a,#TK_INTGR
	jreq 1$
	cp a,#TK_NONE 
	jreq list_loop 
	cp a,#TK_COLON 
	jreq list_loop 
	jp syntax_error 
1$:
	call get_int24 
	ldw (LAST,sp),x 
; print loop
list_loop:
	ldw x,(LN_PTR,sp)
	ld a,(2,x) 
	call prt_basic_line
	ldw x,(LN_PTR,sp)
	ld a,(2,x)
	ld acc8,a 
	clr acc16 
	addw x,acc16
	cpw x,txtend 
	jrpl list_exit
	ldw (LN_PTR,sp),x
	ldw x,(x)
	cpw x,(LAST,sp)  
	jrsle list_loop
list_exit:
	mov in,count 
	ldw x,#pad 
	ldw basicptr,x 
	_drop VSIZE 
	call program_info
	btjf flags,#FLN_REJECTED,9$
	ldw x,#LINES_REJECTED
	call puts
9$: 
	ret
LINES_REJECTED: .asciz "WARNING: lines missing in this program.\n"

;--------------------------
; BASIC: EDIT label 
;  copy program in FLASH 
;  to RAM for edition 
;-------------------------
cmd_edit:
	call cmd_line_only
	ld a,#TK_LABEL 
	call expect  
	pushw x 
	call skip_string
	popw x 
	call search_program 
    jrne 1$ 
	ldw x,#ERR_NO_PROGRAM
	jp tb_error 
1$: pushw y 
	ldw y,x ; source address 
	subw x,#4
	ldw x,(2,x) ; program size 
	addw x,#4 
	ldw acc16,x  ; bytes to copy 
	ldw x,#rsign ; destination address 
	subw y,#4 
	call move  
	ldw x,#free_ram 
	ldw txtbgn,x 
	addw x,rsize  
	ldw txtend,x
	popw y  
	ret 

;---------------------------------
; decompile line from token list
; and print it. 
; input:
;   A       stop at this position 
;   X 		pointer at line
; output:
;   none 
;----------------------------------	
prt_basic_line:
	ldw basicptr,x
	ld count,a 
    mov in,#3 
	call decompile
	ld a,#CR 
	call putc 
	ret 


;---------------------------------
; BASIC: PRINT|? arg_list 
; print values from argument list
;----------------------------------
	SEMICOL=1
	VSIZE=1
cmd_print:
	_vars VSIZE 
reset_semicol:
	clr (SEMICOL,sp)
prt_loop:
	call next_token
	cp a,#CMD_END 
	jrult 0$
	cp a,#TK_COLON 
	jreq 0$
	cp a,#TK_CMD
	jrne 10$
0$:
	_unget_token 
	jra 8$ 
10$:	
	cp a,#TK_QSTR
	jreq 1$
	cp a,#TK_CHAR 
	jreq 2$ 
	cp a,#TK_CFUNC 
	jreq 3$
	cp a,#TK_SEMIC  
	jreq 4$
	cp a,#TK_COMMA
	jreq 5$
	jra 7$ 
1$:	; print string 
	call puts
	incw x
	subw x,basicptr 
	ldw in.w,x  
	jra reset_semicol
2$:	; print character 
	call get_char 
	call putc 
	jra reset_semicol 
3$: ; print character function value  	
	_get_code_addr 
	call (x)
	call putc
	jra reset_semicol 
4$: ; set semi-colon  state 
	cpl (SEMICOL,sp)
	jra prt_loop 
5$: ; skip to next terminal tabulation
     ; terminal TAB are 8 colons 
     ld a,#9 
	 call putc 
	 jra reset_semicol	    
7$:	
	_unget_token 
	call condition
	tnz a 
	jreq 8$    
    call print_top
	jp reset_semicol 
8$:
	tnz (SEMICOL,sp)
	jrne 9$
	ld a,#CR 
    call putc 
9$:	_drop VSIZE 
	ret 

;----------------------
; 'save_context' and
; 'rest_context' must be 
; called at the same 
; call stack depth 
; i.e. SP must have the 
; save value at  
; entry point of both 
; routine. 
;---------------------
	CTXT_SIZE=4 ; size of saved data 
;--------------------
; save current BASIC
; interpreter context 
; on stack 
;--------------------
	_argofs 0 
	_arg BPTR 1
	_arg IN 3
	_arg CNT 4
save_context:
	ldw x,basicptr 
	ldw (BPTR,sp),x
	ld a,in 
	ld (IN,sp),a
	ld a,count 
	ld (CNT,sp),a  
	ret

;-----------------------
; restore previously saved 
; BASIC interpreter context 
; from stack 
;-------------------------
rest_context:
	ldw x,(BPTR,sp)
	ldw basicptr,x 
	ld a,(IN,sp)
	ld in,a
	ld a,(CNT,sp)
	ld count,a  
	ret



;------------------------------------------
; BASIC: INPUT [string]var[,[string]var]
; input value in variables 
; [string] optionally can be used as prompt 
;-----------------------------------------
	CX_BPTR=1
	CX_IN=3
	CX_CNT=4
	SKIP=5
	VSIZE=5
input_var:
	pushw y 
	_vars VSIZE 
input_loop:
	clr (SKIP,sp)
	call next_token 
	cp a,#TK_QSTR 
	jrne 1$ 
	call puts 
	incw x 
	subw x,basicptr 
	ldw in.w,x 
	cpl (SKIP,sp)
	call next_token 
1$: cp a,#TK_VAR  
	jreq 2$ 
	jp syntax_error
2$:	call get_addr
	ldw ptr16,x 
	tnz (SKIP,sp)
	jrne 21$ 
	call var_name 
	call putc   
21$:
	ld a,#':
	call putc 
	call save_context 
	clr count  
	call readln 
	ldw x,#tib 
	push count
	push #0 
	addw x,(1,sp)
	incw x 
	_drop 2 
	clr in 
	call get_token
	cp a,#TK_INTGR
	jreq 3$ 
	cp a,#TK_MINUS
	jrne 22$
	call get_token 
	cp a,#TK_INTGR 
	jreq 23$
22$:
	call rest_context 
	jp syntax_error
23$:
	call neg_acc24	
3$: 
	ld a,acc24 
	ldw x,acc16 
	ld [ptr16],a
	inc ptr8  
	ldw [ptr16],x 
	call rest_context
	call next_token 
	cp a,#TK_COMMA
	jrne 4$ 
	jp input_loop
4$:
	cp a,#TK_NONE 
	jreq input_exit  
	cp a,#TK_COLON 
    jreq input_exit 
	jp syntax_error 
input_exit:
	_drop VSIZE 
	popw y 
	ret 


;---------------------
; BASIC: REM | ' 
; skip comment to end of line 
;---------------------- 
remark::
	mov in,count 
 	ret 


;---------------------
; BASIC: WAIT addr,mask[,xor_mask]
; read in loop 'addr'  
; apply & 'mask' to value 
; loop while result==0.  
; 'xor_mask' is used to 
; invert the wait logic.
; i.e. loop while not 0.
;---------------------
	XMASK=1 ; 1 byte 
	MASK=2  ; 1 byte 
	ADDR=3  ; 1 word 
	VSIZE=4 
wait: 
	_vars VSIZE
	clr (XMASK,sp) 
	call arg_list 
	cp a,#2
	jruge 0$
	jp syntax_error 
0$:	cp a,#3
	jrult 1$
	_xpop  ; xor mask 
	ld a,xl 
	ld (XMASK,sp),a 
1$: _xpop ; mask
    ld a,xl  
	ld (MASK,sp),a 
	_xpop ; address
2$:	ld a,(x)
	and a,(MASK,sp)
	xor a,(XMASK,sp)
	jreq 2$ 
	_drop VSIZE 
	ret 

;---------------------
; BASIC: BSET addr,mask
; set bits at 'addr' corresponding 
; to those of 'mask' that are at 1.
; arguments:
; 	addr 		memory address RAM|PERIPHERAL 
;   mask        mask|addr
; output:
;	none 
;--------------------------
bit_set:
	call arg_list 
	cp a,#2	 
	jreq 1$ 
	jp syntax_error
1$: 
	_xpop ; mask 
	ld a,xl
	push a  
	_xpop ; addr  
	pop a 
	or a,(x)
	ld (x),a
	ret 

;---------------------
; BASIC: BRES addr,mask
; reset bits at 'addr' corresponding 
; to those of 'mask' that are at 1.
; arguments:
; 	addr 		memory address RAM|PERIPHERAL 
;   mask	    ~mask&*addr  
; output:
;	none 
;--------------------------
bit_reset:
	call arg_list 
	cp a,#2  
	jreq 1$ 
	jp syntax_error
1$: 
	_xpop ; mask 
	ld a,xl 
	cpl a
	push a  
	_xpop ; addr  
	pop a 
	and a,(x)
	ld (x),a 
	ret 

;---------------------
; BASIC: BTOGL addr,mask
; toggle bits at 'addr' corresponding 
; to those of 'mask' that are at 1.
; arguments:
; 	addr 		memory address RAM|PERIPHERAL 
;   mask	    mask^*addr  
; output:
;	none 
;--------------------------
bit_toggle:
	call arg_list 
	cp a,#2 
	jreq 1$ 
	jp syntax_error
1$: _xpop ; mask 
	ld a,xl
	push a 
	_xpop  ; addr  
	pop a 
	xor a,(x)
	ld (x),a 
	ret 


;---------------------
; BASIC: BTEST(addr,bit)
; return bit value at 'addr' 
; bit is in range {0..7}.
; arguments:
; 	addr 		memory address RAM|PERIPHERAL 
;   bit 	    bit position {0..7}  
; output:
;	A:X       bit value  
;--------------------------
bit_test:
	call func_args 
	cp a,#2
	jreq 0$
	jp syntax_error
0$:	
	_xpop 
	ld a,xl 
	and a,#7
	push a   
	ld a,#1 
1$: tnz (1,sp)
	jreq 2$
	sll a 
	dec (1,sp)
	jra 1$
2$: ld (1,sp),a  
	_xpop ; address  
	pop a 
	and a,(x)
	jreq 3$
	ld a,#1 
3$:	clrw x 
	ld xl,a
	clr a  
	ret

;--------------------
; BASIC: POKE addr,byte
; put a byte at addr 
;--------------------
poke:
	call arg_list 
	cp a,#2
	jreq 1$
	jp syntax_error
1$:	
	_xpop ; byte   
    ld a,xl 
	push a 
	_xpop ; address 
	pop a 
	ld (x),a 
	ret 

;-----------------------
; BASIC: PEEK(addr)
; get the byte at addr 
; input:
;	none 
; output:
;	X 		value 
;-----------------------
peek:
	call func_args
	cp a,#1 
	jreq 1$
	jp syntax_error
1$: _xpop ; address  
	ld farptr,a 
	ldw ptr16,x 
	ldf a,[farptr]
	clrw x 
	ld xl,a 
	clr a 
	ret 

;---------------------------
; BASIC IF expr : instructions
; evaluate expr and if true 
; execute instructions on same line. 
;----------------------------
if: 
	call condition  
	_xpop 
	tnz  a  
	jrne 9$
	tnzw x 
	jrne 9$  
;skip to next line
	mov in,count
	_drop 2 
	jp next_line
9$:	ret 

;------------------------
; BASIC: FOR var=expr 
; set variable to expression 
; leave variable address 
; on stack and set
; FLOOP bit in 'flags'
;-----------------
	RETL1=1 ; return address  
	FSTEP=3  ; variable increment int24
	LIMIT=6 ; loop limit, int24  
	CVAR=9   ; control variable 
	INW=11   ;  in.w saved
	BPTR=13 ; baseptr saved
	VSIZE=13  
for: ; { -- var_addr }
	popw x ; call return address 
	_vars VSIZE 
	pushw x  ; RETL1 
	ld a,#TK_VAR 
	call expect
	call get_addr
	ldw (CVAR,sp),x  ; control variable 
	call let_eval 
	bset flags,#FLOOP 
	call next_token 
	cp a,#TK_CMD 
	jreq 1$
	jp syntax_error
1$:  
	_get_code_addr
	cpw x,#to   
	jreq to
	jp syntax_error 

;-----------------------------------
; BASIC: TO expr 
; second part of FOR loop initilization
; leave limit on stack and set 
; FTO bit in 'flags'
;-----------------------------------
to: ; { var_addr -- var_addr limit step }
	btjt flags,#FLOOP,1$
	jp syntax_error
1$: call expression   
	cp a,#TK_INTGR 
	jreq 2$ 
	jp syntax_error
2$: _xpop
	ld (LIMIT,sp),a 
	ldw (LIMIT+1,sp),x
	call next_token
	cp a,#TK_NONE  
	jreq 4$ 
	cp a,#TK_CMD
	jrne 3$
	_get_code_addr
	cpw x,#step 
	jreq step
3$:	
	_unget_token   	 
4$:	
	clr (FSTEP,sp) 
	ldw x,#1   ; default step  
	ldw (FSTEP+1,sp),x 
	jra store_loop_addr 


;----------------------------------
; BASIC: STEP expr 
; optional third par of FOR loop
; initialization. 	
;------------------------------------
step: ; {var limit -- var limit step}
	btjt flags,#FLOOP,1$
	jp syntax_error
1$: call expression 
	cp a,#TK_INTGR
	jreq 2$
	jp syntax_error
2$:	
	_xpop 
	ld (FSTEP,sp),a 
	ldw (FSTEP+1,sp),x ; step
; if step < 0 decrement LIMIT 
	tnz a
	jrpl store_loop_addr 
	ld a,(LIMIT,sp)
	ldw x,(LIMIT+1,sp)
	subw x,#1 
	sbc a,#0 
	ld (LIMIT,sp),a 
	ldw (LIMIT+1,sp),x 
; leave loop back entry point on cstack 
; cstack is 1 call deep from interpreter
store_loop_addr:
	ldw x,basicptr
	ldw (BPTR,sp),x 
	ldw x,in.w 
	ldw (INW,sp),x   
	bres flags,#FLOOP 
	inc loop_depth  
	ret 

;--------------------------------
; BASIC: NEXT var 
; FOR loop control 
; increment variable with step 
; and compare with limit 
; loop if threshold not crossed.
; else stack. 
; and decrement 'loop_depth' 
;--------------------------------
next: ; {var limit step retl1 -- [var limit step ] }
	tnz loop_depth 
	jrne 1$ 
	jp syntax_error 
1$: 
	ld a,#TK_VAR 
	call expect
	call get_addr 
; check for good variable after NEXT 	 
	cpw x,(CVAR,sp)
	jreq 2$  
	jp syntax_error ; not the good one 
2$: 
	ldw ptr16,x 
	; increment variable 
	ld a,(x)
	ldw x,(1,x)  ; get var value 
	addw x,(FSTEP+1,sp) ; var+step 
	adc a,(FSTEP,sp)
	ld [ptr16],a
	inc ptr8  
	ldw [ptr16],x 
	ld acc24,a 
	ldw acc16,x 
	ld a,(LIMIT,sp)
	ldw x,(LIMIT+1,sp)
	subw x,acc16 
	sbc a,acc24
	xor a,(FSTEP,sp)
	xor a,#0x80
	jrmi loop_back  
	jra loop_done   
; check sign of STEP  
	ld a,(FSTEP,sp)
	jrpl 4$
;negative step
    ld a,acc8 
	jrslt loop_back   
	jra loop_done  
4$: ; positive step
	btjt acc8,#7,loop_done 
loop_back:
	ldw x,(BPTR,sp)
	ldw basicptr,x 
	btjf flags,#FRUN,1$ 
	ld a,(2,x)
	ld count,a
1$:	ldw x,(INW,sp)
	ldw in.w,x 
	ret 
loop_done:
	; remove loop data from stack  
	popw x
	_drop VSIZE 
	dec loop_depth 
	jp (x)

;----------------------------
; called by goto/gosub
; to get target line number 
; output:
;    x    line address 
;---------------------------
get_target_line:
	call next_token  
	cp a,#TK_INTGR
	jreq get_target_line_addr 
	cp a,#TK_LABEL 
	jreq look_target_symbol 
	jp syntax_error
; the target is a line number 
; search it. 
get_target_line_addr:
	pushw y 
	call get_int24 ; line # 
	clr a
	ldw y,basicptr 
	ldw y,(y)
	pushw y 
	cpw x,(1,sp)
	_drop 2  
	jrult 11$
	inc a 
11$: ; scan program for this line# 	
	call search_lineno  
	tnzw x ; 0| line# address 
	jrne 2$ 
	ld a,#ERR_NO_LINE 
	jp tb_error 
2$:	popw y  
	ret 

; the GOTO|GOSUB target is a symbol.
; output:
;    X    line address|0 
look_target_symbol:
	pushw y 
	pushw x 
	call skip_string 
	clr acc16 
	ldw y,txtbgn 
1$:	ld a,(3,y) ; first TK_ID on line 
	cp a,#TK_LABEL 
	jreq 3$ 
2$:	ld a,(2,y); line length 
	ld acc8,a 
	addw y,acc16 ;point to next line 
	cpw y,txtend 
	jrult 1$
	ld a,#ERR_BAD_VALUE
	jp tb_error 
3$: ; found a TK_LABEL 
	; compare with GOTO|GOSUB target 
	pushw y ; line address 
	addw y,#4 ; label string 
	ldw x,(3,sp) ; target string 
	call strcmp
	jreq 4$
	popw y 
	jra 2$ 
4$: ; target found 
	popw x ;  address line target  
	_drop 2 ; target string 
	popw y 
	ret


;--------------------------------
; BASIC: ON expr GOTO|GOSUB line# [,line#]*
; selective goto or gosub 
;--------------------------------
cmd_on:
	call runtime_only
0$:	call expression 
	cp a,#TK_INTGR
	jreq 1$
	jp syntax_error
1$: _xpop
; the selector is the element indice 
; in the list of arguments. {1..#elements} 
	ld a,xl ; keep only bits 7..0
	jreq 9$ ; element # begin at 1. 
	push a  ; selector  
	call next_token
	cp a,#TK_CMD 
	jreq 2$ 
	jp syntax_error 
2$: _get_code_addr
;; must be a GOTO or GOSUB 
	cpw x,#goto 
	jreq 4$
	cpw x,#gosub 
	jreq 4$ 
	jp syntax_error 
4$: 
	pop a 
	pushw x ; save routine address 	
	push a  ; selector  
5$: ; skip elements in list until selector==0 
	dec (1,sp)
	jreq 6$ 
; can be a line# or a label 
	call next_token 
	cp a,#TK_INTGR 
	jreq 52$
	cp a,#TK_LABEL 
	jreq 54$
	jp syntax_error 
52$: ; got a line number 
	ld a,in ; skip over int24 value 
	add a,#CELL_SIZE ; integer size  
	ld in,a 
	jra 56$
54$: call skip_string ; skip over label 	
56$: ; if another element comma present 
	call next_token
	cp a,#TK_COMMA 
	jreq 5$ 
; arg list exhausted, selector to big 
; continue execution on next line 
	_drop 3 ; drop selector and GOTO|GOSUB address 
	jra 9$
6$: ;at selected position  
	_drop 1 ; discard selector
; here only the routine address 
; of GOTO|GOSUB is on stack 
    call get_target_line
	ldw ptr16,x 	
	mov in,count ; move to end of line  
	popw x ; cmd address, GOTO||GOSUB 
	cpw x,#goto 
	jrne 7$ 
	ldw x,ptr16 
	jra jp_to_target
7$: 
	jra gosub_2 ; target in ptr16 
9$: ; expr out of range skip to end of line
    ; this will force a fall to next line  
	mov in,count
	_drop 2
	jp next_line  


;------------------------
; BASIC: GOTO line# 
; jump to line# 
; here cstack is 2 call deep from interpreter 
;------------------------
goto:
	call runtime_only
goto_1:
	call get_target_line
jp_to_target:
	ldw basicptr,x 
	ld a,(2,x)
	ld count,a 
	mov in,#3 
	btjf flags,#FTRACE,9$ 
	ldw x,(x)
	call prt_i16 
9$:	ret 


;--------------------
; BASIC: GOSUB line#
; basic subroutine call
; actual line# and basicptr 
; are saved on cstack
; here cstack is 2 call deep from interpreter 
;--------------------
	RET_ADDR=1 ; subroutine return address 
	RET_BPTR=3 ; basicptr return point 
	RET_INW=5  ; in.w return point 
	VSIZE=4 
gosub:
	call runtime_only
gosub_1:
	call get_target_line 
	ldw ptr16,x
gosub_2: 
	popw x 
	_vars VSIZE  
	pushw x ; RET_ADDR 
; save BASIC subroutine return point.   
	ldw x,basicptr
	ldw (RET_BPTR,sp),x 
	ldw x,in.w 
	ldw (RET_INW,sp),x
	ldw x,ptr16  
	jra jp_to_target

;------------------------
; BASIC: RETURN 
; exit from BASIC subroutine 
;------------------------
return:
	call runtime_only
	ldw x,(RET_BPTR,sp) 
	ldw basicptr,x
	ld a,(2,x)
	ld count,a  
	ldw x,(RET_INW,sp)
	ldw in.w,x 
	popw x 
	_drop VSIZE 
	jp (x)

;---------------------------------
; check if A:X contain the address 
; of a program in FLASH 
; output:
;     Z    set is progam 
;----------------------------------
is_program_addr:
	tnz a 
	jrne 9$
	cpw x,#app_space 
	jrult 8$
	pushw x 
	call qsign 
	popw x 
	jreq 9$ 
8$:	cpl a ; clr Z bit  
9$:	ret 

;----------------------------------
; BASIC: RUN [label]
; run BASIC program in RAM
;----------------------------------- 
cmd_run: 
	btjf flags,#FRUN,0$  
	clr a 
	ret
0$: ; check for STOP condition 
	btjf flags,#FBREAK,1$
	_drop 2 
	call rest_context
	_drop CTXT_SIZE 
	bres flags,#FBREAK 
	bset flags,#FRUN 
	jp interpreter 
1$:	; check for label option 
	call next_token 
	cp a,#TK_LABEL 
	jrne 3$
	pushw x 
	call skip_string 
	popw x  
	call search_program
	jrne 2$
	ld a,#ERR_NO_PROGRAM
	jp tb_error 
2$: ldw txtbgn,x 
	subw x,#2 
	ldw x,(x)
	addw x,txtbgn 
	ldw txtend,x 
	jra run_it 	
3$:	_unget_token 
	ldw x,txtbgn
	cpw x,txtend 
	jrmi run_it 
	ldw x,#err_no_prog
	call puts 
	mov in,count
	ret 
run_it:	 
	_drop 2 ; drop return address 
run_it_02: 
    call ubound 
	call clear_vars
; initialize DIM variables pointers 
	ldw x,txtend 
	ldw dvar_bgn,x 
	ldw dvar_end,x 	 
; clear data pointer 
	clrw x 
	ldw data_ptr,x 
	clr data_ofs 
	clr data_len 
; initialize BASIC pointer 
	ldw x,txtbgn 
	ldw basicptr,x 
	ld a,(2,x)
	ld count,a
	mov in,#3	
	bset flags,#FRUN 
	jp interpreter 


;----------------------
; BASIC: END
; end running program
;---------------------- 
	CHAIN_BP=1 
	CHAIN_IN=3
	CHAIN_TXTBGN=5
	CHAIN_TXTEND=7
	CHAIN_CNTX_SIZE=8  
cmd_end: 
	_drop 2 ; no need for return address 
; check for chained program 
	tnz chain_level
	jreq 8$
; restore chain context 
	dec chain_level 
	ldw x,(CHAIN_BP,sp) ; chain saved basicptr 
	ldw basicptr,x 
	ldw x,(CHAIN_IN,sp) ; chain saved in and count  
	ldw in,x 
	ldw x,(CHAIN_TXTBGN,sp)
	ldw txtbgn,x 
	ldw x,(CHAIN_TXTEND,sp)
	ldw txtend,x 
	_drop CHAIN_CNTX_SIZE ; CHAIN saved data size  
	jp interpreter 
8$: ; clean stack 
	ldw x,#STACK_EMPTY
	ldw sp,x 
	jp warm_start

;---------------------------
; BASIC: GET var 
; receive a key in variable 
; don't wait 
;---------------------------
cmd_get:
	call next_token 
	cp a,#TK_VAR 
	jreq 0$
	jp syntax_error 
0$: call get_addr 
	ldw ptr16,x 
	call qgetc 
	jreq 2$
	call getc  
2$: clr [ptr16]
	inc ptr8 
	clr [ptr16]
	inc ptr8 
	ld [ptr16],a 
	ret 


;-----------------
; 1 Khz beep 
;-----------------
beep_1khz:: 
	pushw y 
	ldw x,#100
	ldw y,#1000
	jra beep

;-----------------------
; BASIC: TONE expr1,expr2
; used TIMER2 channel 1
; to produce a tone 
; arguments:
;    expr1   frequency 
;    expr2   duration msec.
;---------------------------
tone:
	pushw y 
	call arg_list 
	cp a,#2 
	jreq 1$
	jp syntax_error 
1$: 
	_xpop 
	pushw x ; duration 
	_xpop ; frequency
	ldw y,x ; frequency 
	popw x  ; duration 
beep:  
	pushw x 
	ldw x,#TIM2_CLK_FREQ
	divw x,y ; cntr=Fclk/freq 
; round to nearest integer 
	cpw y,#TIM2_CLK_FREQ/2
	jrmi 2$
	incw x 
2$:	 
	ld a,xh 
	ld TIM2_ARRH,a 
	ld a,xl 
	ld TIM2_ARRL,a 
; 50% duty cycle 
	ccf 
	rrcw x 
	ld a,xh 
	ld TIM2_CCR1H,a 
	ld a,xl
	ld TIM2_CCR1L,a
	bset TIM2_CCER1,#TIM2_CCER1_CC1E
	bset TIM2_CR1,#TIM2_CR1_CEN
	bset TIM2_EGR,#TIM2_EGR_UG
	popw x 
	call pause02
	bres TIM2_CCER1,#TIM2_CCER1_CC1E
	bres TIM2_CR1,#TIM2_CR1_CEN 
	popw y 
	ret 

;-------------------------------
; BASIC: ADCON 0|1 [,divisor]  
; disable/enanble ADC 
;-------------------------------
	ONOFF=3 
	DIVSOR=1
	VSIZE=4 
power_adc:
	call arg_list 
	cp a,#2	
	jreq 1$
	cp a,#1 
	jreq 0$ 
	jp syntax_error 
0$:	clr a 
	clrw x
	_xpush   ; divisor  
1$: _at_next 
	tnzw x 
	jreq 2$ 
	_xpop
	_xdrop  
	ld a,xl
	and a,#7
	swap a 
	ld ADC_CR1,a
	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
	bset ADC_CR1,#ADC_CR1_ADON 
	_usec_dly 7 
	jra 3$
2$: bres ADC_CR1,#ADC_CR1_ADON
	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
3$:	
	ret

;-----------------------------
; BASIC: ADCREAD (channel)
; read adc channel {0..5}
; output:
;   A 		TK_INTGR 
;   X 		value 
;-----------------------------
analog_read:
	call func_args 
	cp a,#1 
	jreq 1$
	jp syntax_error
1$: _xpop 
	cpw x,#5 
	jrule 2$
	ld a,#ERR_BAD_VALUE
	jp tb_error 
2$: ld a,xl
	ld acc8,a 
	ld a,#5
	sub a,acc8 
	ld ADC_CSR,a
	bset ADC_CR2,#ADC_CR2_ALIGN
	bset ADC_CR1,#ADC_CR1_ADON
	btjf ADC_CSR,#ADC_CSR_EOC,.
	ldw x,ADC_DRH
	ld a,#TK_INTGR
	ret 

;-----------------------
; BASIC: DREAD(pin)
; Arduino pins 
; read state of a digital pin 
; pin# {0..15}
; output:
;    A 		TK_INTGR
;    X      0|1 
;-------------------------
	PINNO=1
	VSIZE=1
digital_read:
	_vars VSIZE 
	call func_args
	cp a,#1
	jreq 1$
	jp syntax_error
1$: _xpop 
	cpw x,#15 
	jrule 2$
	ld a,#ERR_BAD_VALUE
	jp tb_error 
2$:	call select_pin 
	ld (PINNO,sp),a
	ld a,(GPIO_IDR,x)
	tnz (PINNO,sp)
	jreq 8$
3$: srl a 
	dec (PINNO,sp)
	jrne 3$ 
8$: and a,#1 
	clrw x 
	ld xl,a 
	clr a 
	_drop VSIZE
	ret


;-----------------------
; BASIC: DWRITE pin,0|1
; Arduino pins 
; write to a digital pin 
; pin# {0..15}
; output:
;    A 		TK_INTGR
;    X      0|1 
;-------------------------
	PINNO=1
	PINVAL=2
	VSIZE=2
digital_write:
	_vars VSIZE 
	call arg_list  
	cp a,#2 
	jreq 1$
	jp syntax_error
1$: _xpop 
	ld a,xl 
	ld (PINVAL,sp),a
	_xpop 
	cpw x,#15 
	jrule 2$
	ld a,#ERR_BAD_VALUE
	jp tb_error 
2$:	call select_pin 
	ld (PINNO,sp),a 
	ld a,#1
	tnz (PINNO,sp)
	jreq 4$
3$: sll a
	dec (PINNO,sp)
	jrne 3$
4$: tnz (PINVAL,sp)
	jrne 5$
	cpl a 
	and a,(GPIO_ODR,x)
	jra 8$
5$: or a,(GPIO_ODR,x)
8$: ld (GPIO_ODR,x),a 
	_drop VSIZE 
	ret


;-----------------------
; BASIC: STOP
; stop progam execution  
; without resetting pointers 
; the program is resumed
; with RUN 
;-------------------------
stop:
	btjt flags,#FRUN,2$
	ret 
2$:	 
; create space on cstack to save context 
	ldw x,#break_point 
	call puts 
	_drop 2 ;drop return address 
	_vars CTXT_SIZE ; context size 
	call save_context 
	ldw x,#tib 
	ldw basicptr,x
	clr (x)
	clr count  
	clrw x 
	ldw in.w,x
	bres flags,#FRUN 
	bset flags,#FBREAK
	jp interpreter 
break_point: .asciz "\nbreak point, RUN to resume.\n"

;-----------------------
; BASIC: NEW
; from command line only 
; free program memory
; and clear variables 
;------------------------
new: 
	call cmd_line_only
0$:	clr flags 
	call clear_basic 
	ret 

;-----------------------------------
; erase program at specified address
; keep signature and size fields. 
; signature replaced by "XX"
; input:
;    X    address 
;-----------------------------------
	ADDR=1    ; program address
	PRG_SIZE=3    ; program size 
	BLOCKS=5 ; blocks to erase 
	VSIZE=6
erase_program:
	pushw x 
	call skip_string 
	popw x 
	call search_program 
	jreq 9$
	call move_erase_to_ram
	clr farptr 
	_vars VSIZE 
1$:	subw x,#4 
	ldw (ADDR,sp),x
	ldw x,(2,x)
	ldw (PRG_SIZE,sp),x
	ld a,#BLOCK_SIZE 
	div x,a 
	tnz a 
	jreq 2$ 
	incw x 
2$:	ldw (BLOCKS,sp),x 
	ldw x,(ADDR,sp)
	ldw ptr16,x 
3$:	call block_erase
	ldw x,#BLOCK_SIZE 
	call incr_farptr
	ldw x,(BLOCKS,sp)
	decw x 
	ldw (BLOCKS,sp),x 
	jrne 3$ 
; write XX and size at addr 
	ldw x,(ADDR,sp)
	ldw ptr16,x 
	ld a,#'X 
	clrw x 
	call write_byte 
	call write_byte 
	ld a,(PRG_SIZE,sp)
	call write_byte 
	ld a,(PRG_SIZE+1,sp)
	call write_byte 
	_drop VSIZE 
9$:	
	ret 

;-----------------------------------
; BASIC: ERASE \E | \F || address
; erase all block in range from 
;  'app_space' to FLASH end (0x27fff)
;  or all EEPROM 
; that contains a non zero byte. 
; if the argument is an address  
; mark the program at this address 
; as erased. Erase the blocks 
; replace signature by 'XX' and 
; keep size field.  
;-----------------------------------
	LIMIT=1 
	VSIZE = 3 
cmd_erase:
	call cmd_line_only
	clr farptr 
	call next_token
	cp a,#TK_LABEL 
	jreq erase_program  
	_vars VSIZE 
	cp a,#TK_CHAR 
	jreq 0$ 
	jp syntax_error
0$: call get_char 
	and a,#0XDF 
	cp a,#'E
	jrne 1$
	ldw x,#EEPROM_BASE 
	ldw farptr+1,x 
	ldw x,#EEPROM_END
	clr a 
	jra 3$ 
1$: cp a,#'F 
	jreq 2$
	ldw x,#err_bad_value
	jp tb_error
2$:
	ldw x,#app_space  
	ldw farptr+1,x 
	ld a,#(FLASH_END>>16)&0XFF 
	ldw x,#FLASH_END&0xffff
3$:
	ld (LIMIT,sp),a 
	ldw (LIMIT+1,sp),x 
; operation done from RAM
; copy code to RAM in tib   
	call move_erase_to_ram
4$:	 
    call scan_block 
	jreq 5$  ; block already erased 
    ld a,#'E 
    call putc 
	call block_erase   
; this block is clean, next  
5$:	ldw x,#BLOCK_SIZE
	call incr_farptr
; check limit, 24 bit substraction  	
	ld a,(LIMIT,sp)
	ldw x,(LIMIT+1,sp)
	subw x,farptr+1
	sbc a,farptr 
	jrugt 4$ 
9$: call clear_basic
	ldw x,(LIMIT+1,sp)
	cpw x,#EEPROM_END
	jrne 10$
	call func_eefree 
10$:
	_drop VSIZE 
	ret 
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  check for application signature 
; input:
;	x       address to check 
; output:
;   Z      1  signature present 
;          0 not app signature  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
qsign: 
	pushw x 
; align to block 
	ld a,xl 
	and a,#BLOCK_SIZE 
	ld xl,a 
	ldw x,(x)
	cpw x,SIGNATURE ; "TB" 
	popw x 
	ret 

;--------------------------------------
;  fill write buffer 
;  input:
;    y  point to output buffer 
;    x  point to source 
;    a  bytes to write in buffer 
;  output:
;    y   += A 
;    X   += A 
;    A   0 
;---------------------------------------
fill_write_buffer:
	push a 
	tnz a 
	jreq 9$ 
1$: ld a,(x)
	incw x 
	ld (y),a 
	incw y 
	dec (1,sp) 
	jrne 1$ 
9$:	pop a 
    ret 	

;--------------------------------------
;  fill pad buffer with zero 
;  input:
;	none 
;  output:
;    y     buffer address  
;--------------------------------------
clear_block_buffer:
	push a 
	ldw y,#block_buffer 
	pushw y
	ld a,#BLOCK_SIZE   
1$:	clr (y)
	incw y
	dec a  
	jrne 1$ 	
9$: popw y 
	pop a 			
	ret 


;----------------------------------
;  search  a free space space that 
;  fit program size 
; input:
;    X    program size 
; output:
;    X    address | 0 
;------------------------------------
	PG_SIZE=1 
	VSIZE=2 
search_fit:
	pushw x; PG_SIZE 
	ldw x,#app_space 
1$:	call is_erased 
	jreq 4$
	ld a,(x)
	or a,(1,x)
	jreq 9$ ; free space 
2$:	call skip_to_next
	tnzw x 
	jrne 1$
	jra 9$
4$: ; erased program 
    ; does it fit? 
	ldw acc16,x 
	ldw x,(2,x) ; size erased program
; top multiple of BLOCK_SIZE 
	addw x,#4 
	addw x,#BLOCK_SIZE-1 
	ld a,xl 
	and a,#BLOCK_SIZE 
	ld xl,a  
	cpw x,(1,sp) ; size program to save 
	jruge 8$   ; fit 
	ldw x,acc16 
	jra 2$ 
8$: ldw x,acc16 ; fit in this one 	
9$:	_drop VSIZE 
	ret  

;-------------------------
; erase header and 
; size fields 
; input: 
;    X    program address 
; output:
;    X    unchanged 
;-------------------------
	COUNT=1 
erase_header:
	pushw x 
	push #4 ; COUNT 
	clr farptr 
	ldw ptr16,x 
	clr a 
	clrw x 
1$:	call write_byte 
	dec (COUNT,sp)
	jrne 1$
	_drop 1 
	popw x 
	ldw ptr16,x 
	ret 

;---------------------------------------
; BASIC: SAVE
; write application from RAM to FLASH
; at UFLASH address
;--------------------------------------
	XTEMP=1
	COUNT=3  ; last count bytes written 
	CNT_LO=4 ; count low byte 
	TOWRITE=5 ; how bytes left to write  
	VSIZE=6 
cmd_save:
	call cmd_line_only
	pushw x 
	pushw y 
	_vars VSIZE
	call prog_size 
	jrne 0$ 
	jp 9$ ; no program to save 
0$:	ldw (TOWRITE,sp),x ; program size
	clr farptr 
	call search_fit
	ldw ptr16,x 
	ldw x,#0xFFFF
	subw x,ptr16 ; free flash 
	subw x,#4 ; signature and size field 
	cpw x,(TOWRITE,sp)
	jruge 1$
	ld a,#ERR_MEM_FULL
	jp tb_error 
1$: ; check if header bytes are zero's 
	ldw x,ptr16 
	ld a,(x)
	or a,(1,x)
	or a,(2,x)
	or a,(3,x)
	jreq 2$
	call erase_header ; preserve X and farptr 
2$: 
; block programming flash
; must be done from RAM
; moved in tib  
	call move_prg_to_ram
; initialize written bytes count  
	clr (COUNT,sp)
; first bock 
; containt signature 2 bytes 
; and size 	2 bytes 
; use Y as pointer to block_buffer
	call clear_block_buffer ; -- y=*block_buffer	
; write signature
	ldw x,SIGNATURE ; "TB" 
	ldw (y),x 
	addw y,#2
	ldw x,(TOWRITE,sp)
	ldw (y),x
	addw y,#2   
	ld a,#(BLOCK_SIZE-4)
	cpw x,#(BLOCK_SIZE-4) 
	jrugt 3$
	ld a,xl 
3$:	ld (CNT_LO,sp),a   
	ldw x,txtbgn 
	ldw (XTEMP,sp),x 
32$: 
	ldw x,(XTEMP,sp)
	ld a,(CNT_LO,sp)
	call fill_write_buffer 
	ldw (XTEMP,sp),x 
	ldw x,#block_buffer
	call write_buffer
	ldw x,#BLOCK_SIZE 
	call incr_farptr  
; following blocks 
	ldw x,(XTEMP,sp)
	cpw x,txtend 
	jruge 9$ 
	ldw x,(TOWRITE,sp)
	subw x,(COUNT,sp)
	ldw (TOWRITE,sp),x 
	ld a,#BLOCK_SIZE 
	cpw x,#BLOCK_SIZE 
	jruge 4$ 
	ld a,xl 
4$:	ld (CNT_LO,sp),a 
	call clear_block_buffer 
	jra 32$ 
9$:	_drop VSIZE 
    popw y 
	popw x 
	ret 

SIGNATURE: .ascii "TB"
ERASED: .ascii "XX" 

;---------------------
; check if there is 
; an erased program 
; at this address 
; input:
;    X    address 
; output:
;    Z    Set=erased program 
;--------------------
is_erased:
	pushw x 
; align to BLOCK 
	ld a,xl 
	and a,#BLOCK_SIZE 
	ld xl,a 
	ldw x,(x)
	cpw x,ERASED 
	popw x 
	ret 

;----------------------------
;  skip to next program
;  block 
; input:
;    X   actual program addr
; output:
;    X   next block 
;        after program 
;----------------------------
skip_to_next:
; align to block 
	ld a,xl 
	and a,#BLOCK_SIZE 
	ld xl,a 
	ldw acc16,x 
	ldw x,(2,x)
	addw x,acc16 ; blk_addr+prg_size 
	addw x,#4 ; +header fields 
; align to next block 
	addw x,#BLOCK_SIZE-1 
	ld a,xl 
	and a,#0x80 
	ld xl,a  
	ret 


;---------------------
; BASIC: DIR 
; list programs saved 
; in flash 
;--------------------
	XTEMP=1 
cmd_dir:
	call cmd_line_only
	ldw x,#app_space 
	pushw x 
1$: 
	call qsign 
	jrne 4$
	addw x,#4
	mov base,#16
	call prt_i16
	ld a,#SPACE 
	call putc 
	ldw x,(1,sp)
	ldw x,(2,x)
	mov base,#10  
	call prt_i16 
	ldw x,#STR_BYTES
	call puts
	ld a,#', 
	call putc
	ldw x,(1,sp)
	addw x,#8
	call puts 
	ld a,#CR 
	call putc
	ldw x,(1,sp)
3$:	call skip_to_next
	ldw (1,sp),x 
	jra 1$
4$: ; check if it is an erased program 
	call is_erased 
	jreq 3$ 
8$: ; done 
	_drop 2 
	ret 

;---------------------
; BASIC: WRITE expr1,expr2|char|string[,expr|char|string]* 
; write 1 or more byte to FLASH or EEPROM
; starting at address  
; input:
;   expr1  	is address 
;   expr2,...,exprn   are bytes to write
; output:
;   none 
;---------------------
write:
	call expression
	cp a,#TK_INTGR 
	jreq 0$
	jp syntax_error
0$: _xpop 
	ld farptr,a 
	ldw ptr16,x 
1$:	
	call next_token 
	cp a,#TK_COMMA 
	jreq 2$ 
	jra 9$ ; no more data 
2$:	call next_token 
	cp a,#TK_CHAR 
	jreq 4$ 
	cp a,#TK_QSTR
	jreq 6$
	_unget_token 
	call expression
	cp a,#TK_INTGR
	jreq 3$
	jp syntax_error
3$:	_xpop 
	ld a,xl 
	clrw x 
	call write_byte
	jra 1$ 
4$: ; write character 
	ld a,(x)
	inc in 
	clrw x 
	call write_byte 
	jra 1$ 
6$: ; write string 
	pushw x 
	ld a,(x)
	inc in 
	clrw x 
	call write_byte 
	popw x 
	ld a,(x)
	jreq 1$
	incw x 
	jra 6$ 	
9$:
	ret 


;---------------------
;BASIC: CHAR(expr)
; évaluate expression 
; and take the 7 least 
; bits as ASCII character
; output: 
; 	A char 
;---------------------
func_char:
	call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error
1$:	_xpop
	ld a,xl
	and a,#0x7f 
	ret

;---------------------
; BASIC: ASC(string|char|TK_CFUNC)
; extract first character 
; of string argument 
; output:
;    A:X    int24 
;---------------------
ascii:
	ld a,#TK_LPAREN
	call expect 
	call next_token 
	cp a,#TK_QSTR 
	jreq 1$
	cp a,#TK_CHAR 
	jreq 2$ 
	cp a,#TK_CFUNC 
	jreq 0$
	jp syntax_error
0$: ; cfunc 
	call (x)
	jra 3$
1$: ; quoted string 
	ld a,(x)
	push a  
	call skip_string
	pop a  	
	jra 3$ 
2$: ; character 
	call get_char 
3$:	clrw x 
	rlwa x   
4$:	_xpush  
	ld a,#TK_RPAREN 
	call expect
9$:	
	_xpop  
	ret 

;---------------------
;BASIC: KEY
; wait for a character 
; received from STDIN 
; input:
;	none 
; output:
;	a	 character 
;---------------------
key:
	call getc 
	ret

;----------------------
; BASIC: QKEY
; Return true if there 
; is a character in 
; waiting in STDIN 
; input:
;  none 
; output:
;   A     0|-1
;-----------------------
qkey:: 
	clrw x 
	ld a,rx1_head
	sub a,rx1_tail 
	jreq 9$ 
	cplw x
	ld a,#255    
9$: 
	ret 

;-------------------------
; BASIC: UFLASH 
; return free flash address
; scan all block starting at 
; app_space and return 
; address of first free block 
; below extended memory.  
; return 0 if no free block 
; input:
;  none 
; output:
;	A:X		FLASH free address
;---------------------------
uflash:
	clr farptr 
	ldw x,#app_space 
	pushw x 
1$:	ldw ptr16,x 
	call scan_block 
	jreq 8$
	ldw x,(1,sp)
	addw x,#BLOCK_SIZE 
	jreq 7$ 
	ldw (1,sp),x 
	jra 1$ 
7$: ; no free block 
	clr (1,sp) 
	clr (2,sp)
8$: popw x 
	clr a 
	ret 


;---------------------
; BASIC: USR(addr,arg)
; execute a function written 
; in binary code.
; input:
;   addr	routine address 
;   arg 	is an argument
;           it can be ignore 
;           by cally. 
; output:
;   xstack 	value returned by cally  
;---------------------
usr:
	call func_args 
	cp a,#2
	jreq 1$  
	jp syntax_error 
1$: 
	_at_next ; A:X addr 
	ldw ptr16,X 
	_xpop  ; arg 
	_store_top ; overwrite addr 
    call [ptr16]
	ret 


;------------------------------
; BASIC: BYE 
; halt mcu in its lowest power mode 
; wait for reset or external interrupt
; do a cold start on wakeup.
;------------------------------
bye:
	btjf UART1_SR,#UART_SR_TC,.
	halt
	jp cold_start  

;----------------------------------
; BASIC: SLEEP 
; halt mcu until reset or external
; interrupt.
; Resume progam after SLEEP command
;----------------------------------
sleep:
	btjf UART1_SR,#UART_SR_TC,.
	bset flags,#FSLEEP
	halt 
	ret 

;-------------------------------
; BASIC: PAUSE expr 
; suspend execution for n msec.
; input:
;	none
; output:
;	none 
;------------------------------
pause:
	call expression
	cp a,#TK_INTGR
	jreq 1$ 
	jp syntax_error
1$: _xpop 
pause02:
	ldw timer,x 
1$: ldw x,timer 
	tnzw x 
	jreq 2$
	wfi 
	jrne 1$
2$:	
	ret 

;------------------------------
; BASIC: AWU expr
; halt mcu for 'expr' milliseconds
; use Auto wakeup peripheral
; all oscillators stopped except LSI
; range: 1ms - 511ms
; input:
;  none
; output:
;  none:
;------------------------------
awu:
  call expression
  cp a,#TK_INTGR
  jreq 1$
  jp syntax_error
1$: _xpop 
awu02:
  cpw x,#5120
  jrmi 1$ 
  mov AWU_TBR,#15 
  ld a,#30
  div x,a
  ld a,#16
  div x,a 
  jra 4$
1$: 
  cpw x,#2048
  jrmi 2$ 
  mov AWU_TBR,#14
  ld a,#80
  div x,a 
  jra 4$   
2$:
  mov AWU_TBR,#7
3$:  
; while X > 64  divide by 2 and increment AWU_TBR 
  cpw x,#64 
  jrule 4$ 
  inc AWU_TBR 
  srlw x 
  jra 3$ 
4$:
  ld a, xl
  dec a 
  jreq 5$
  dec a 	
5$: 
  and a,#0x3e 
  ld AWU_APR,a 
  bset AWU_CSR,#AWU_CSR_AWUEN
  halt 

  ret 

;------------------------------
; BASIC: TICKS
; return msec ticks counter value 
; input:
; 	none 
; output:
;	X 		TK_INTGR
;-------------------------------
get_ticks:
	ld a,ticks 
	ldw x,ticks+1 
	ret 

;------------------------------
; BASIC: ABS(expr)
; return absolute value of expr.
; input:
;   none
; output:
;   xstack    positive int24 
;-------------------------------
abs:
	call func_args 
	cp a,#1 
	jreq 0$ 
	jp syntax_error
0$:  
	call abs24 
	_xpop 
	ret 

;------------------------------
; BASIC: LSHIFT(expr1,expr2)
; logical shift left expr1 by 
; expr2 bits 
; output:
; 	A:x 	result 
;------------------------------
lshift:
	call func_args
	cp a,#2 
	jreq 1$
	jp syntax_error
1$: _xpop 
	ld a,xl 
	push a      
	_xpop  ; T>A:X 
	tnz (1,sp) 
	jreq 4$
2$:	rcf 
	rlcw x 
	rlc a 
	dec (1,sp) 
	jrne 2$
4$: _drop 1 
	ret

;------------------------------
; BASIC: RSHIFT(expr1,expr2)
; logical shift right expr1 by 
; expr2 bits.
; output:
; 	A 		TK_INTGR
;   X 		result 
;------------------------------
rshift:
	call func_args
	cp a,#2 
	jreq 1$
	jp syntax_error
1$: _xpop ; T>A:X
    ld a,xl 
	push a    
	_xpop  
	tnz (1,sp)
	jreq 4$
2$:	rcf 
	rrc a 
	rrcw x 
	dec (1,sp) 
	jrne 2$
4$: _drop 1 
	ret

;--------------------------
; BASIC: FCPU integer
; set CPU frequency 
;-------------------------- 

fcpu:
	ld a,#TK_INTGR
	call expect 
	call get_int24 
	ld a,xl 
	and a,#7 
	ld CLK_CKDIVR,a 
	ret 

;------------------------------
; BASIC: PMODE pin#, mode 
; Arduino pin. 
; define pin as input or output
; pin#: {0..15}
; mode: INPUT|OUTPUT  
;------------------------------
	PINNO=1
	VSIZE=1
pin_mode:
	_vars VSIZE 
	call arg_list 
	cp a,#2 
	jreq 1$
	jp syntax_error 
1$: _xpop 
	ldw ptr16,x ; mode 
	_xpop ; Dx pin 
	call select_pin 
	ld (PINNO,sp),a  
	ld a,#1 
	tnz (PINNO,sp)
	jreq 4$
2$:	sll a 
	dec (PINNO,sp)
	jrne 2$ 
	ld (PINNO,sp),a
	ld a,(PINNO,sp)
	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
	ld (GPIO_CR1,x),a 
4$:	ld a,#OUTP
	cp a,acc8 
	jreq 6$
; input mode
; disable external interrupt 
	ld a,(PINNO,sp)
	cpl a 
	and a,(GPIO_CR2,x)
	ld (GPIO_CR2,x),a 
;clear bit in DDR for input mode 
	ld a,(PINNO,sp)
	cpl a 
	and a,(GPIO_DDR,x)	; bit==0 for input. 
	ld (GPIO_DDR,x),a 
	jra 9$
6$: ;output mode  
	ld a,(PINNO,sp)
	or a,(GPIO_DDR,x) ; bit==1 for output 
	ld (GPIO_DDR,x),a 
	ld a,(PINNO,sp)
	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
	ld (GPIO_CR2,x),a 
9$:	
	_drop VSIZE 
	ret

;------------------------
; select Arduino pin 
; input:
;   X 	 {0..15} Arduino Dx 
; output:
;   A     stm8s208 pin 
;   X     base address s208 GPIO port 
;---------------------------
select_pin:
	sllw x 
	addw x,#arduino_to_8s208 
	ldw x,(x)
	ld a,xl 
	push a 
	swapw x 
	ld a,#5 
	mul x,a 
	addw x,#GPIO_BASE 
	pop a 
	ret 
; translation from Arduino D0..D15 to stm8s208rb 
arduino_to_8s208:
.byte 3,6 ; D0 
.byte 3,5 ; D1 
.byte 4,0 ; D2 
.byte 2,1 ; D3
.byte 6,0 ; D4
.byte 2,2 ; D5
.byte 2,3 ; D6
.byte 3,1 ; D7
.byte 3,3 ; D8
.byte 2,4 ; D9
.byte 4,5 ; D10
.byte 2,6 ; D11
.byte 2,7 ; D12
.byte 2,5 ; D13
.byte 4,2 ; D14
.byte 4,1 ; D15


;------------------------------
; BASIC: RND(expr)
; return random number 
; between 1 and expr inclusive
; xorshift16 
; ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
; input:
; 	none 
; output:
;	xstack 	random positive integer 
;------------------------------
random:
	call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error
1$:  
	_xpop   
	pushw x 
	push a  
	ld a,#0x80 
	bcp a,(1,sp)
	jreq 2$
	ld a,#ERR_BAD_VALUE
	jp tb_error
2$: 
; acc16=(x<<5)^x 
	ldw x,seedx 
	sllw x 
	sllw x 
	sllw x 
	sllw x 
	sllw x 
	ld a,xh 
	xor a,seedx 
	ld acc16,a 
	ld a,xl 
	xor a,seedx+1 
	ld acc8,a 
; seedx=seedy 
	ldw x,seedy 
	ldw seedx,x  
; seedy=seedy^(seedy>>1)
	ldw x,seedy 
	srlw x 
	ld a,xh 
	xor a,seedy 
	ld seedy,a  
	ld a,xl 
	xor a,seedy+1 
	ld seedy+1,a 
; acc16>>3 
	ldw x,acc16 
	srlw x 
	srlw x 
	srlw x 
; x=acc16^x 
	ld a,xh 
	xor a,acc16 
	ld acc16,a 
	ld a,xl 
	xor a,acc8 
	ld acc8,a 
; seedy=acc16^seedy 
	xor a,seedy+1
	ld xl,a 
	ld a,acc16 
	xor a,seedy
	ld xh,a 
	ldw seedy,x 
; return seedx_lo&0x7f:seedy modulo expr + 1 
	ld a,seedx+1
	and a,#127
	_xpush 
	pop a 
	popw x 
	_xpush 
	call mod24 
	_xpop
	addw x,#1 
	adc a,#0  
	ret 

;---------------------------------
; BASIC: WORDS 
; affiche la listes des mots du
; dictionnaire ainsi que le nombre
; de mots.
;---------------------------------
	COL_CNT=1 ; column counter 
	WCNT=2 ; count words printed 
	VSIZE=2 
words:
	call cmd_line_only
	pushw y
	_vars VSIZE
	ld a,#5 
	ld (COL_CNT,sp),a 
	clr (WCNT,sp)
	ldw y,#kword_dict+2
0$:	ldw x,y
	call print_word 
	inc (WCNT,sp)
	dec (COL_CNT,sp)
	jreq 2$    
	ld a,#TAB  
	call putc
	call putc 
	jra 3$
2$: ld a,#CR 
	call putc 
	ld a,#5 
	ld (COL_CNT,sp),a 
3$:	subw y,#2 
	ldw y,(y)
	jrne 0$ 
	ld a,#CR 
	call putc  
	clrw x 
	ld a,(WCNT,sp)
	ld xl,a 
	call prt_i16 
	ldw x,#words_count_msg
	call puts 
	_drop VSIZE 
	popw y 
	ret 
words_count_msg: .asciz " words in dictionary\n"

;---------------------------
;  print counted string 
;  input:
;    X     *ctring 
;--------------------------
	WLEN=1 ;1 byte 
print_word: 
	ld a,(x)
	and a,#NAME_MAX_LEN
	push a 
1$: incw x 
	ld a,(x)
	call putc 
	dec (WLEN,sp)
	jrne 1$ 
	pop a 		
	ret 



;-----------------------------
; BASIC: TIMER expr 
; initialize count down timer 
;-----------------------------
set_timer:
	call arg_list
	cp a,#1 
	jreq 1$
	jp syntax_error
1$: 
	_xpop  
	ldw timer,x 
	ret 

;------------------------------
; BASIC: TIMEOUT 
; return state of timer 
; output:
;   A:X     0 not timeout 
;   A:X     -1 timeout 
;------------------------------
timeout:
	clr a 
	ldw x,timer 
	jreq 1$
	clrw x
	ret  
1$:	cpl a
	cplw x 
	ret 
 	



;-----------------------------------
; BASIC: IWDGEN expr1 
; enable independant watchdog timer
; expr1 is delay in multiple of 62.5µsec
; expr1 -> {1..16383}
;-----------------------------------
enable_iwdg:
	call arg_list
	cp a,#1 
	jreq 1$
	jp syntax_error 
1$: _xpop  
	push #0
	mov IWDG_KR,#IWDG_KEY_ENABLE
	ld a,xh 
	and a,#0x3f
	ld xh,a  
2$:	cpw x,#255
	jrule 3$
	inc (1,sp)
	rcf 
	rrcw x 
	jra 2$
3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
	pop a  
	ld IWDG_PR,a 
	ld a,xl
	dec a 
	mov IWDG_KR,#IWDG_KEY_ACCESS 
	ld IWDG_RLR,a 
	mov IWDG_KR,#IWDG_KEY_REFRESH
	ret 


;-----------------------------------
; BASIC: IWDGREF  
; refresh independant watchdog count down 
; timer before it reset MCU. 
;-----------------------------------
refresh_iwdg:
	mov IWDG_KR,#IWDG_KEY_REFRESH 
	ret 


;-------------------------------------
; BASIC: LOG2(expr)
; return logarithm base 2 of expr 
; this is the position of most significant
; bit set. 
; input: 
; output:
;   A     TK_INTGR 
;   xstack log2 
;*********************************
log2:
	call func_args 
	cp a,#1 
	jreq 1$
	jp syntax_error 
1$: 
	_xpop    
	tnz a
	jrne 2$ 
	tnzw x 
	jrne 2$
	ld a,#ERR_BAD_VALUE
	jp tb_error 
2$: push #24 
3$: rlcw x 
    rlc a 
	jrc 4$
	dec (1,sp) 
	jrne 3$
4$: clrw x 
    pop a 
	dec a
	rlwa x  
9$:	
	ret 

;-----------------------------------
; BASIC: BIT(expr) 
; expr ->{0..23}
; return 2^expr 
; output:
;    A:X    2^expr 
;-----------------------------------
bitmask:
    call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error 
1$: _xpop 
	ld a,xl 
	ldw x,#1 
	and a,#23
	jreq 9$
	push a 
	clr a 
2$: 
	slaw x 
	rlc a 	
	dec (1,sp)
	jrne 2$ 
4$:
    _drop 1 
9$:	ret 

;------------------------------
; BASIC: DO 
; initiate a DO ... UNTIL loop 
;------------------------------
	DOLP_ADR=3 
	DOLP_INW=5
	VSIZE=4 
do_loop:
	popw x 
	_vars VSIZE 
	pushw x 
	ldw x,basicptr 
	ldw (DOLP_ADR,sp),x
	ldw x,in.w 
	ldw (DOLP_INW,sp),x
	inc loop_depth 
	ret 

;--------------------------------
; BASIC: UNTIL expr 
; loop if exprssion is false 
; else terminate loop
;--------------------------------
until: 
	tnz loop_depth 
	jrne 1$ 
	jp syntax_error 
1$: 
	call condition  
	_xpop 
	tnz a 
	jrne 9$ 
	tnzw x 
	jrne 9$ 
	ldw x,(DOLP_ADR,sp)
	ldw basicptr,x 
	ld a,(2,x)
	ld count,a 
	ldw x,(DOLP_INW,sp)
	ldw in.w,x 
	ret 
9$:	; remove loop data from stack  
	popw x
	_drop VSIZE
	dec loop_depth 
	jp (x)

;--------------------------
; BASIC: PORTA...PORTI  
;  return constant value 
;  PORT  base address 
;---------------------------
const_porta:
	ldw x,#PA_BASE 
	clr a 
	ret 
const_portb:
	ldw x,#PB_BASE 
	clr a 
	ret 
const_portc:
	ldw x,#PC_BASE 
	clr a 
	ret 
const_portd:
	ldw x,#PD_BASE 
	clr a 
	ret 
const_porte:
	ldw x,#PE_BASE 
	clr a 
	ret 
const_portf:
	ldw x,#PF_BASE 
	clr a 
	ret 
const_portg:
	ldw x,#PG_BASE 
	clr a 
	ret 
const_porti:
	ldw x,#PI_BASE 
	clr a 
	ret 

;-------------------------------
; following return constant 
; related to GPIO register offset 
;---------------------------------
const_odr:
	clr a 
	ldw x,#GPIO_ODR
	ret 
const_idr:
	clr a 
	ldw x,#GPIO_IDR
	ret 
const_ddr:
	clr a
	ldw x,#GPIO_DDR
	ret 
const_cr1:
	clr a 
	ldw x,#GPIO_CR1
	ret 
const_cr2:
	clr a
	ldw x,#GPIO_CR2
	ret 
;-------------------------
; BASIC: POUT 
;  constant for port mode
;  used by PMODE 
;  to set pin as output
;------------------------
const_output:
	clr a 
	ldw x,#OUTP
	ret 

;-------------------------
; BASIC: PINP 
;  constant for port mode
;  used by PMODE 
;  to set pin as input
;------------------------
const_input:
	clr a  
	ldw x,#INP 
	ret 
	
;-----------------------
; memory area constants
;-----------------------
const_eeprom_base:
	clr a  
	ldw x,#EEPROM_BASE 
	ret 

;---------------------------
; BASIC: DATA 
; when the interpreter find 
; a DATA line it skip it.
;---------------------------
data:
	mov in,count 
	ret 

;------------------------------
; check if it is a DATA line 
; input: 
;    X    line address 
; output:
;    Z    set if DATA line 
;----------------------------
is_data_line:
	pushw x 
	ld a,(3,x)
	cp a,#TK_CMD 
	jrne 9$
	ldw x,(4,x)
	cpw x,#data  
9$: popw x 
	ret 

;---------------------------------
; BASIC: RESTORE [line#]
; set data_ptr to first data line
; if no DATA found pointer set to
; zero.
; if a line# is given as argument 
; a data line with that number 
; is searched and the data pointer 
; is set to it. If there is no 
; data line with that number 
; the program is interrupted. 
;---------------------------------
restore:
	call runtime_only
	clrw x 
	ldw data_ptr,x 
	ldw data_ofs,x 
	ldw x,txtbgn 
	call next_token 
	cp a,#TK_INTGR
	jrne 0$
	call get_int24
	pushw y 
	clr a 
	call search_lineno  
	popw y 
	tnzw x 
	jrne set_data_pointer 
	jra data_error 
0$:
	_unget_token  
; search first DATA line 	
1$:	cpw x,txtend
	jruge data_error 
2$:	
	call is_data_line 
	jrne 4$
4$:	call try_next_line 
	jrne 4$ 
	ret 

;---------------------
; set data pointer 
; variables at new line 
; input:
;    X    line address 
;----------------------
set_data_pointer:
	ldw data_ptr,x
	ld a,(2,x)
	ld data_len,a 
	mov data_ofs,#FIRST_DATA_ITEM
	ret 


;--------------------
; at end of data line 
; check if next line 
; is a data line 
; input:
;    X   actual line address 
;  
;-------------------
try_next_line: 
	ld a,(2,x)
	ld acc8,a 
	clr acc16 
	addw x,acc16 
	cpw x,txtend 
	jrult 1$
	jra data_error 
1$:	
	call is_data_line 
	jreq 2$
	ld a,#1  
	jra 9$
2$:	call set_data_pointer
	clr a  
9$:	ret 
data_error:	
    ld a,#ERR_NO_DATA 
	jp tb_error 


;---------------------------------
; BASIC: READ 
; return next data item | 0 
;---------------------------------
	CTX_BPTR=1 
	CTX_IN=3 
	CTX_COUNT=4 
	INT24=5
	VSIZE=7 
read:
	call runtime_only
	_vars  VSIZE 
	call save_context
read01:	
	ld a,data_ofs
	cp a,data_len 
	jreq 2$ ; end of line  
0$:
	ldw x,data_ptr 
	ldw basicptr,x 
	mov in,data_ofs 
	mov count,data_len  
	call expression 
	cp a,#TK_INTGR 
	jreq 1$ 
	jp syntax_error 
1$:
	call next_token ; skip comma
	ldw x,basicptr 
	ldw data_ptr,x 
	mov data_ofs,in 
	call rest_context
	_xpop 
	_drop VSIZE 
	ret 
2$: ; end of line reached 
	; try next line 
	ldw x,data_ptr  
	call try_next_line
	jreq 0$ 
	jra data_error 

;---------------------------------
; BASIC: SPIEN clkdiv, 0|1  
; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
; if clkdiv==-1 disable SPI
; 0|1 -> disable|enable  
;--------------------------------- 
SPI_CS_BIT=5
spi_enable:
	call arg_list 
	cp a,#2
	jreq 1$
	jp syntax_error 
1$: 
	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
	popw x  
	tnzw x 
	jreq spi_disable 
	popw x 
	ld a,#(1<<SPI_CR1_BR)
	mul x,a 
	ld a,xl 
	ld SPI_CR1,a 
; configure ~CS on PE5 (D10 on CN8) as output. 
	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
; configure SPI as master mode 0.	
	bset SPI_CR1,#SPI_CR1_MSTR
; ~CS line controlled by sofware 	
	bset SPI_CR2,#SPI_CR2_SSM 
    bset SPI_CR2,#SPI_CR2_SSI 
; enable SPI
	bset SPI_CR1,#SPI_CR1_SPE 	
	ret 
spi_disable:
	_drop #2; throw first argument.
; wait spi idle 
1$:	ld a,#0x82 
	and a,SPI_SR
	cp a,#2 
	jrne 1$
	bres SPI_CR1,#SPI_CR1_SPE
	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
	bres PE_DDR,#SPI_CS_BIT 
	ret 

spi_clear_error:
	ld a,#0x78 
	bcp a,SPI_SR 
	jreq 1$
	clr SPI_SR 
1$: ret 

spi_send_byte:
	push a 
	call spi_clear_error
	pop a 
	btjf SPI_SR,#SPI_SR_TXE,.
	ld SPI_DR,a
	btjf SPI_SR,#SPI_SR_RXNE,.  
	ld a,SPI_DR 
	ret 

spi_rcv_byte:
	ld a,#255
	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
	ld a,SPI_DR 
	ret

;------------------------------
; BASIC: SPIWR byte [,byte]
; write 1 or more byte
;------------------------------
spi_write:
	call expression
	cp a,#TK_INTGR 
	jreq 1$
	jp syntax_error 
1$:	
	ld a,xl 
	call spi_send_byte 
	call next_token 
	cp a,#TK_COMMA 
	jrne 2$ 
	jra spi_write 
2$:	tnz a 
	jreq 3$
	_unget_token  
3$:	ret 


;-------------------------------
; BASIC: SPIRD 	
; read one byte from SPI 
;-------------------------------
spi_read:
	call spi_rcv_byte 
	clrw x 
	ld xl,a 
	clr a  
	ret 

;------------------------------
; BASIC: SPISEL 0|1 
; set state of ~CS line
; 0|1 deselect|select  
;------------------------------
spi_select:
	call next_token 
	cp a,#TK_INTGR 
	jreq 1$
	jp syntax_error 
1$: tnzw x  
	jreq cs_high 
	bres PE_ODR,#SPI_CS_BIT
	ret 
cs_high: 
	bset PE_ODR,#SPI_CS_BIT
	ret 

;-------------------------------
; BASIC: PAD 
; Return pad buffer address.
;------------------------------
pad_ref:
	ldw x,#pad 
	clr a
	ret 

;****************************
; expression stack 
; manipulation routines
;****************************

;-----------------------------
; BASIC: PUSH expr|rel|cond 
; push the result on xtack
;-----------------------------
xpush:
	call condition 
	ret 

;------------------------------
; BASIC: POP 
; pop top of xstack 
;------------------------------
xpop:
	_xpop 
	ret 


;------------------------------
; BASIC: ALLOC expr 
; allocate expr element on xtack 
;-------------------------------
xalloc: 
	call expression 
	cp a,#TK_INTGR
	jreq 1$ 
	jp syntax_error
1$: _xpop 
	tnz a 
	jreq 3$ 
2$:	ld a,#ERR_BAD_VALUE
	jp tb_error 
3$: cpw x,#XSTACK_SIZE 
	jrugt 2$
	ld a,#CELL_SIZE 
	mul x,a 
	ldw acc16,x 
	subw y,acc16 
	cpw y,#xstack_full
	jrugt 9$
	ld a,#ERR_MEM_FULL
	jp tb_error 
9$:	 
	ret 


;------------------------------
;  BASIC DROP expr 
;  expr in range {0..XSTACK_SIZE}
;  discard n elements from xtack
;------------------------------
xdrop:
	call expression 
	cp a,#TK_INTGR
	jreq 1$ 
	jp syntax_error 
1$:	_xpop 
	ld a,xl 
	and a,#0x1f 
	clrw x 
	ld xl,a 
	ld a,#CELL_SIZE 
	mul x,a 
	ldw acc16,x  
	addw y,acc16 
	cpw y,#XSTACK_EMPTY 
	jrule 9$
	ldw y,#XSTACK_EMPTY 
9$:	ret 

;-----------------------
; check if value in A:X 
; is inside xstack bound
; output:
;    X     slot address  
;-----------------------
xstack_bound:
	tnz a 
	jrne 8$ 
1$: cpw x,#XSTACK_SIZE 
	jrugt 8$
	ld a,#CELL_SIZE 
	mul x,a
	ldw acc16,x 
	ldw x,y 
	addw x,acc16 
	cpw x,#XSTACK_EMPTY 
	jruge 8$  
	ret 
8$: ld a,#ERR_BAD_VALUE
	jp tb_error 

;-------------------------
; BASIC: PUT expr, cond 
; expr -> slot 
; cond -> valut to put 
; on xstack 
;-------------------------
xput:
	call arg_list 
	cp a,#2 
	jreq 1$ 
0$:	jp syntax_error
1$: _xpop   ; value to put 
	pushw x 
	push a 
	_xpop    ; slot 
	call xstack_bound
    ldw ptr16,x 
	pop a 
	popw x 
	ld [ptr16],a 
	inc ptr8 
	ldw [ptr16],x 
	ret 

;------------------------
; BASIC: PICK expr 
; get nième element on 
; xtack. 
;-----------------------
xpick:
	call func_args 
	cp a,#1 
	jreq 1$
	jp syntax_error 
1$: _xpop 
	call xstack_bound
    ld a,(x)
	ldw x,(1,x)				
	ret 


;----------------------------
; BASIC: AUTORUN \C | label  
;  \C -> cancel autorun 
;  addr -> register an 
;    autorun program 
;    this program execute at 
;     reset/boot 
;----------------------------
cmd_auto_run:
	call cmd_line_only
	call next_token 
	cp a,#TK_LABEL 
	jreq 1$ 
	cp a,#TK_CHAR 
	jrne 0$ 
	ld a,(x)
	inc in 
	and a,#0xDF 
	cp a,#'C 
	jrne 0$ 
	ldw x,#EEPROM_BASE 
	call erase_header
	ret 
0$:	jp syntax_error
1$:	pushw x 
	call skip_string
	popw x 
	call search_program
	jrne 2$ 
	ld a,#ERR_BAD_VALUE
	jp tb_error 
2$: pushw x 
	clr farptr 
	ldw x,#EEPROM_BASE
	ldw ptr16,x 
	ld a,AR_SIGN 
	clrw x 	 
	call write_byte
	ld a,AR_SIGN+1
	call write_byte 
	ld a,(1,sp)
	call write_byte 
	ld a,(2,sp)
	call write_byte 
	_drop 2 
	ret 

AR_SIGN: .ascii "AR" ; autorun signature 

;-------------------------------
; search a program in flash 
; memory with a label at first 
; that correspond to name 
; pointed by X 
; input:
;    x      *name 
; output: 
;    X     prog_addr|0
;-------------------------------
	WLKPTR=1 
	PNAME=3
	LIMIT=5
	YSAVE=7
	VSIZE=6 
search_program:
	pushw y 
	_vars VSIZE 
	ldw (PNAME,sp),x 
	call uflash 
	ldw (LIMIT,sp),x 
	ldw x,#app_space 
1$:	ldw (WLKPTR,sp),x  
	clr a 
	call is_program_addr
	jrne 4$
	addw x,#7 
	ld a,(x)
	cp a,#TK_LABEL 
	jrne 4$ 
	incw x 
	ldw y,(PNAME,sp)
	call strcmp
	jreq 6$
4$: 
	call skip_to_next
	cpw x,(LIMIT,sp)
	jrult 1$
	clrw x 
	jra 8$
6$: ; found label 
	ldw x,(WLKPTR,sp)
	addw x,#4 	
8$:	
	_drop VSIZE  
	popw y 
	ret 


;-------------------------------
; BASIC: CHAIN label [, line#]
; Execute another program like it 
; is a sub-routine. When the 
; called program terminate 
; execution continue at caller 
; after CHAIN command. 
; if a line# is given, the 
; chained program start execution 
; at this line#.
;---------------------------------
	CHAIN_LN=3 
	CHAIN_ADDR=5 
	CHAIN_BP=7
	CHAIN_IN=9
	CHAIN_COUNT=10 
	CHAIN_TXTBGN=11 
	CHAIN_TXTEND=13 
	VSIZE=12 
	DISCARD=4 
cmd_chain:
	popw x 
	_vars VSIZE 
	pushw x
	clr (CHAIN_LN,sp) 
	clr (CHAIN_LN+1,sp)  
	ld a,#TK_LABEL 
	call expect 
	pushw x 
	call skip_string
	popw x 
	call search_program 
	tnzw x  
	jrne 1$ 
0$:	ld a,#ERR_BAD_VALUE
	jp tb_error 
1$: ldw (CHAIN_ADDR,sp), x ; program addr 
    call next_token 
	cp a,#TK_COMMA 
	jrne 4$
	ld a,#TK_INTGR
	call expect 
	call get_int24 
	ldw (CHAIN_LN,sp),x
	jra 6$ 
4$: _unget_token 
6$: ; save chain context 
	ldw x,basicptr 
	ldw (CHAIN_BP,sp),x 
	ldw x,in
	ldw (CHAIN_IN,sp),x
	ldw x,txtbgn 
	ldw (CHAIN_TXTBGN,sp),x
	ldw x,txtend 
	ldw (CHAIN_TXTEND,sp),x  
; set chained program context 	
	ldw x,(CHAIN_ADDR,sp)
	ldw basicptr,x 
	ldw txtbgn,x 
	subw x,#2
	ldw x,(x)
	addw x,(CHAIN_ADDR,sp)
	ldw txtend,x  
	ldw x,(CHAIN_ADDR,sp)
	ld a,(2,x)
	ld count,a 
	mov in,#3 
	ldw x,(CHAIN_LN,sp)
	tnzw x 
	jreq 8$ 
	pushw y
	clr a  
	call search_lineno
	popw y 
	tnzw x 
	jreq 0$ 
	ldw basicptr,x 
	ld a,(2,x)
	ld count,a 
8$: inc chain_level
	popw x 
	_drop DISCARD
	jp (x)


;-----------------------------
; BASIC TRACE 0|1 
; disable|enable line# trace 
;-----------------------------
cmd_trace:
	call runtime_only
	call next_token
	cp a,#TK_INTGR
	jreq 1$ 
	jp syntax_error 
1$: call get_int24 
    tnzw x 
	jrne 2$ 
	bres flags,#FTRACE 
	ret 
2$: bset flags,#FTRACE 
	ret 

;------------------------------
; BASIC: REBOOT 
; reinitialize MCU 
;------------------------------
cmd_reboot:
	_swreset
	
;---------------------------------
; BASIC: BUFFER(name, size) 
; name: buffer name 
; size: in bytes 
;  253-length(name) bytes maximum 
;---------------------------------
	BNAME=1
	NLEN=3 
	BSIZE=5
	VSIZE=6 
alloc_buffer:
	call runtime_only
	_vars VSIZE
	clr (NLEN,sp)
	ld a,#TK_LPAREN 
	call expect 
	ld a,#TK_LABEL 
	call expect  
	ldw (BNAME,sp),x 
	call strlen 
	ld (NLEN+1,sp),a 
	call skip_string 
	ld a,#TK_COMMA 
	call expect 
	call expression 
	cp a,#TK_INTGR
	jreq 1$
	jp syntax_error 
1$: ld a,#TK_RPAREN 
	call expect 
	_xpop
	cpw x,#252
	jrult 2$
	ld a,#ERR_BAD_VALUE
	jp tb_error 
2$:
	ldw (BSIZE,sp),x 
	call free
	subw x,#2
	subw x,(NLEN,sp)  
	cpw x,(BSIZE,sp)
	jruge 3$ 
	ld a,#ERR_MEM_FULL
	jp tb_error 
3$: ldw x,(NLEN,sp)
	addw x,#2 
	addw x,(BSIZE,sp)
	ld a,xl 
	ldw x,dvar_end 
	ld (x),a 
	incw x 
	pushw y 
	ldw y,(BNAME,sp)
	call strcpy
	popw y 
	addw x,(NLEN,sp)
	incw x 
	pushw x 
4$: ; zero buffer 
	clr (x)
	dec (BSIZE,sp)
	jrne 4$
	popw x 
	clr a  
	_drop VSIZE
	ret 

;-----------------------------------
; BASIC: #tb_var|#dim_var|#const_name|#@(expr) 
; return the data field address 
;-----------------------------------
dereference:
	call next_token 
	cp a,#TK_LABEL 
	jreq 4$ 
	cp a,#TK_VAR
	jreq 1$
	cp a,#TK_ARRAY 
	jreq 2$
	jp syntax_error 
1$:	call get_addr 
	jra 9$ 
2$: call get_array_element
	jra 9$
4$: ; label 
	pushw x 
	call skip_string 
	popw x 
	call strlen 
	add a,#REC_XTRA_BYTES
	call search_name 
	tnzw x
	jrne 9$ 
	ld a,#ERR_BAD_VALUE
	jp tb_error 
9$: clr a
	incw x 
	call strlen 
	inc a 
	push a 
	push #0 
	addw x,(1,sp)
	clr a 
	_drop 2
	ret 


;------------------------------
;      dictionary 
; format:
;   link:   2 bytes 
;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
;   cmd_name: 16 byte max 
;   code_addr: 2 bytes 
;------------------------------
	.macro _dict_entry len,name,code_addr 
	.word LINK 
	LINK=.
	.byte len   	
	.ascii "name"
	.word code_addr  
	.endm 

	LINK=0
; respect alphabetic order for BASIC names from Z-A
; this sort order is for a cleaner WORDS cmd output. 	
kword_end:
	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
	_dict_entry,5,WRITE,write  
	_dict_entry,5,WORDS,words 
	_dict_entry 4,WAIT,wait 
	_dict_entry,3+F_IFUNC,USR,usr
	_dict_entry,5,UNTIL,until 
	_dict_entry,6+F_IFUNC,UFLASH,uflash 
	_dict_entry,6+F_IFUNC,UBOUND,ubound
	_dict_entry,5,TRACE,cmd_trace 
	_dict_entry,4,TONE,tone  
	_dict_entry,2,TO,to
	_dict_entry,5,TIMER,set_timer
	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
	_dict_entry,5+F_IFUNC,TICKS,get_ticks
	_dict_entry,4,STOP,stop 
	_dict_entry,4,STEP,step 
	_dict_entry,5,SPIWR,spi_write
	_dict_entry,6,SPISEL,spi_select
	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
	_dict_entry,5,SPIEN,spi_enable 
	_dict_entry,5,SLEEP,sleep 
    _dict_entry,4,SIZE,cmd_size 
	_dict_entry,4,SAVE,cmd_save 
	_dict_entry 3,RUN,cmd_run
	_dict_entry,6+F_IFUNC,RSHIFT,rshift
	_dict_entry,3+F_IFUNC,RND,random 
	_dict_entry,6,RETURN,return 
	_dict_entry,7,RESTORE,restore 
	_dict_entry 3,REM,remark 
	_dict_entry,6,REBOOT,cmd_reboot 
	_dict_entry,4+F_IFUNC,READ,read  
	_dict_entry,3,PUT,xput 
	_dict_entry,4,PUSH,xpush   
	_dict_entry,5+F_IFUNC,PORTI,const_porti 
	_dict_entry,5+F_IFUNC,PORTG,const_portg 
	_dict_entry,5+F_IFUNC,PORTF,const_portf
	_dict_entry,5+F_IFUNC,PORTE,const_porte
	_dict_entry,5+F_IFUNC,PORTD,const_portd
	_dict_entry,5+F_IFUNC,PORTC,const_portc
	_dict_entry,5+F_IFUNC,PORTB,const_portb
	_dict_entry,5+F_IFUNC,PORTA,const_porta 
	_dict_entry 5,PRINT,cmd_print 
	_dict_entry,4+F_IFUNC,POUT,const_output
	_dict_entry,3+F_IFUNC,POP,xpop 
	_dict_entry,4,POKE,poke 
	_dict_entry,5,PMODE,pin_mode 
	_dict_entry,4+F_IFUNC,PINP,const_input
	_dict_entry,4+F_IFUNC,PICK,xpick 
	_dict_entry,4+F_IFUNC,PEEK,peek 
	_dict_entry,5,PAUSE,pause 
	_dict_entry,3+F_IFUNC,PAD,pad_ref 
	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
	_dict_entry,2,ON,cmd_on 
	_dict_entry,3+F_IFUNC,ODR,const_odr 
	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
	_dict_entry,4,NEXT,next 
	_dict_entry,3,NEW,new
	_dict_entry,6+F_IFUNC,LSHIFT,lshift
	_dict_entry,4+F_IFUNC,LOG2,log2 
	_dict_entry 4,LIST,cmd_list
	_dict_entry 3,LET,let 
	_dict_entry,4+F_IFUNC,KEY?,qkey
	_dict_entry,3+F_CFUNC,KEY,key 
	_dict_entry,7,IWDGREF,refresh_iwdg
	_dict_entry,6,IWDGEN,enable_iwdg
	_dict_entry,5,INPUT,input_var  
	_dict_entry,2,IF,if 
	_dict_entry,3+F_IFUNC,IDR,const_idr 
	_dict_entry,3,HEX,hex_base
	_dict_entry,4,GOTO,goto 
	_dict_entry,5,GOSUB,gosub 
	_dict_entry,3,GET,cmd_get 
	_dict_entry,4+F_IFUNC,FREE,free
	_dict_entry,3,FOR,for 
	_dict_entry,4,FCPU,fcpu 
	_dict_entry,5,ERASE,cmd_erase 
	_dict_entry,3,END,cmd_end  
	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
	_dict_entry,4,EDIT,cmd_edit 
	_dict_entry,6+F_CMD,DWRITE,digital_write
	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
	_dict_entry,5+F_IFUNC,DREAD,digital_read
	_dict_entry,2,DO,do_loop
	_dict_entry,3,DIR,cmd_dir
	_dict_entry,3,DIM,cmd_dim 
	_dict_entry,3,DEC,dec_base
	_dict_entry,3+F_IFUNC,DDR,const_ddr 
	_dict_entry,4,DATA,data  
	_dict_entry,3+F_IFUNC,CR2,const_cr2 
	_dict_entry,3+F_IFUNC,CR1,const_cr1 
	_dict_entry,5,CONST,cmd_const 
	_dict_entry,4+F_CFUNC,CHAR,func_char
	_dict_entry,5,CHAIN,cmd_chain
	_dict_entry,3,BYE,bye 
	_dict_entry,6+F_IFUNC,BUFFER,alloc_buffer 
	_dict_entry,5,BTOGL,bit_toggle
	_dict_entry,5+F_IFUNC,BTEST,bit_test 
	_dict_entry,4,BSET,bit_set 
	_dict_entry,4,BRES,bit_reset
	_dict_entry,3+F_IFUNC,BIT,bitmask
	_dict_entry,3,AWU,awu 
	_dict_entry,7,AUTORUN,cmd_auto_run
	_dict_entry,3+F_IFUNC,ASC,ascii
	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
	_dict_entry,5,ADCON,power_adc 
kword_dict::
	_dict_entry,3+F_IFUNC,ABS,abs

