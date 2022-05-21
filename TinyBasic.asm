;;
; Copyright Jacques Deschênes 2019,2020,2021,2022  
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

in.w::  .blkb 1 ; parser position in text line high-byte 
in::    .blkb 1 ; low byte of in.w 
in.saved:: .blkb 1 ; set by get_token before parsing next token, used by unget_token
count:: .blkb 1 ; current BASIC line length and tib text length  
basicptr::  .blkb 2  ; point to current BASIC line address.
data_ptr:  .blkw 1  ; point to DATA address
data_ofs:  .blkb 1  ; index to next data item 
data_len:  .blkb 1  ; length of data line 
base::  .blkb 1 ; nemeric base used to print integer 
acc32:: .blkb 1 ; 32 bit accumalator upper-byte 
acc24:: .blkb 1 ; 24 bits accumulator upper-byte 
acc16:: .blkb 1 ; 16 bits accumulator, acc24 high-byte
acc8::  .blkb 1 ;  8 bits accumulator, acc24 low-byte  
ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
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
tab_width:: .blkb 1 ; print colon width (default 6)
free_eeprom: .blkw 1 ; start address of free eeprom 
rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
rx1_head:  .blkb 1 ; rx1_queue head pointer
rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
; 24 bits integer variables 
vars:: .blkb 3*26 ; BASIC variables A-Z,

	.area BTXT (ABS)
	.org 0x7C  
; keep 'free_ram' as last variable 
; basic code compiled here. 
rsign: .blkw 1 ; "BC" 
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
	jrne 4$ 
	incw x 
	incw y 
	jra strcmp 
4$: ; not same  
	clr a 
	ret 
5$: ; same 
	ld a,#1 
	ret 


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
	INCR=1 ; increament high byte 
	LB=2 ; increament low byte 
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
	clr tab_width  
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
	clr flags 
	clr loop_depth 
	mov tab_width,#TAB_WIDTH 
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
	call clear_vars 
	popw x
	ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   Tiny BASIC error messages     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
err_msg:
	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
	.word err_overflow 

err_mem_full: .asciz "Memory full\n" 
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

rt_msg: .asciz "\nrun time error, "
comp_msg: .asciz "\ncompile error, "
tk_id: .asciz "last token id: "

syntax_error::
	ld a,#ERR_SYNTAX 

tb_error::
	btjt flags,#FCOMP,1$
	push a 
	ldw x, #rt_msg 
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
	btjf flags,#FAUTORUN ,6$
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
	jrpl warm_start
	ldw basicptr,x ; start of next line  
	ld a,(2,x)
	ld count,a 
	mov in,#3 ; skip first 3 bytes of line 
interp_loop: 
	call next_token
	cp a,#TK_NONE 
	jreq next_line 
	cp a,#TK_CMD
	jrne 1$
	call get_code_addr
	call (x) 
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
	cp a,#TK_COLON 
	jreq interp_loop
4$: cp a,#TK_LABEL
	call skip_string 
	jreq interp_loop 
5$:	jp syntax_error 

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
	clrw x 
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

;------------------------
; get cmd and function 
; code address 
; input:
;    X   * cmd|func index 
;        in code_addr table 
;------------------------
get_code_addr:
	ldw x,(x)
	ldw x,(code_addr,x)
skip_2_bytes:
	ld a,#2 ; *_IDX size 
	add a,in  
	ld in,a 
	ret

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
	incw x 
	jrne skip_string
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
	jra skip_2_bytes ; adjust in.w index 


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
	btjf acc16,#7,prt_acc24
	cpl acc24 ; sign extend 
	
;------------------------------------
; print integer in acc24 
; input:
;	acc24 		integer to print 
;	'base' 		numerical base for conversion 
;   'tab_width' field width 
;    A 			signed||unsigned conversion
;  output:
;    A          string length
;------------------------------------
prt_acc24:
	ld a,#255  ; signed conversion  
    call itoa  ; conversion entier en  .asciz
	call right_align  
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
	jra prt_acc24 


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
	ldw (PSTR,sp),x 
    call divu24_8 ; acc24/A 
	ldw x,(PSTR,sp)
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
; don't print more than 4 digits
; in hexadecimal to avoid '-' sign 
; extend display 	
8$: ld a,(LEN,sp) 
	cp a,#6 
	jrmi 81$
	incw x
	dec (LEN,sp)
	jra 8$
81$:	
	ld a,#'$ 
9$: decw x
    ld (x),a
	inc (LEN,sp)
10$:
	ld a,(LEN,sp)
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
;    acc24      int24_t
;------------------------------------
	; local variables
	SIGN=1 ; 1 byte, 
	BASE=2 ; 1 byte, numeric base used in conversion
	TEMP=3 ; 1 byte, temporary storage
	VSIZE=3 ; 3 bytes reserved for local storage
atoi24::
	pushw x 
	_vars VSIZE
	; acc24=0 
	clr acc24    
	clr acc16
	clr acc8 
	clr (SIGN,sp)
	ld a,#10
	ld (BASE,sp),a ; default base decimal
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
	ld a,(x)
3$:	
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
	ld a,(TEMP,sp)
	add a,acc24+2
	ld acc24+2,a
	clr a
	adc a,acc24+1
	ld acc24+1,a
	clr a
	adc a,acc24
	ld acc24,a
	jra 2$
9$:	tnz (SIGN,sp)
    jreq atoi_exit
    call neg_acc24
atoi_exit: 
	_drop VSIZE
	popw x ; restore x
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
;  X		cmd_index
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
	ldw x,(XSAVE,sp)
	ld a,(X)
	ld (NLEN,sp),a ; needed to test keyword type  
	and a,#0xf 
; move x to procedure address field 	
	inc a 
	ld acc8,a 
	clr acc16 
	addw x,acc16 
	ldw x,(x) ; routine index  
;determine keyword type bits 7:6 
	ld a,(NLEN,sp)
	swap a 
	and a,#0xc
	srl a
	srl a 
	add a,#128
search_exit: 
	_drop VSIZE 
	ret 

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
1$: call expression
	cp a,#TK_NONE 
	jreq 5$
	cp a,#TK_INTGR
	jrne 4$
3$: 
	inc (1,sp)
	call next_token 
	cp a,#TK_COMMA 
	jreq 1$ 
	cp a,#TK_NONE 
	jreq 5$ 
4$:	cp a,#TK_RPAREN 
	jreq 5$
	_unget_token 
5$:	pop a  
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
	pushw x 
	sllw x 
	addw x,(1,sp) ; index*size_of(int24)
	ldw (1,sp),x  
	ldw x,#tib ; array is below tib 
	subw x,(1,sp)
	_drop 2   
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
	cp a,#CMD_END  
	jrult 16$
1$:	cp a,#TK_PLUS 
	jreq 2$
	cp a,#TK_MINUS 
	jrne 4$ 
	cpl (NEG,sp)
	jra 4$  
2$:	
	call next_token 
4$:	
	cp a,#TK_IFUNC 
	jrne 5$ 
	call get_code_addr 
	call (x); result in A:X  
	jra 18$ 
5$:
	cp a,#TK_INTGR
	jrne 6$
	call get_int24 
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
71$:
	ld a,(x)
	ldw x,(1,x)
	jra 18$
8$:
	cp a,#TK_LABEL 
	jrne 9$ 
	call search_const 
	clr a 
	tnzw x 
	jreq 16$
	call get_const_value 
	jra 18$
9$: 
	cp a,#TK_CFUNC 
	jrne 12$
	call get_code_addr 
	call(x)
	clrw x 
	rlwa x 
	jra 18$ 	 
12$:			
	cp a,#TK_LPAREN
	jrne 16$
	call expression
	_xpush  
	ld a,#TK_RPAREN 
	call expect
	_xpop 
	jra 18$	
16$:
	tnz a 
	jreq 20$ 
	_unget_token
	clr a 
	jra 20$ 
18$: 
	tnz (NEG,sp)
	jreq 19$
	call neg_ax   
19$: _xpush 
     ld a,#TK_INTGR
20$:
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
	call factor
	tnz a 
	jreq term_exit 
term01:	 ; check for  operator 
	call next_token
	ld (MULOP,sp),a
	cp a,#CMD_END
	jrult 8$
	and a,#TK_GRP_MASK
	cp a,#TK_GRP_MULT
	jreq 1$
	jra 8$
1$:	; got *|/|%
	call factor
	cp a,#TK_INTGR
	jreq 2$
	jp syntax_error
2$:	
	ld a,(MULOP,sp) 
	cp a,#TK_MULT 
	jrne 3$
	call mul24 
	jra term01
3$: cp a,#TK_DIV 
	jrne 4$ 
	call div24 
	jra term01 
4$: call mod24
	jra term01 
8$: ld a,(MULOP,sp)
	jreq 9$ 
	_unget_token
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
	call term
	tnz a 
	jreq expr_exit 
1$:	
	call next_token
	ld (OP,sp),a 
	cp a,#CMD_END 
	jrult 8$ 
	and a,#TK_GRP_MASK
	cp a,#TK_GRP_ADD 
	jreq 2$ 
	jra 8$
2$: 
	call term
	cp a,#TK_INTGR
	jreq 3$
	jp syntax_error
3$:	
	ld a,(OP,sp)
	cp a,#TK_PLUS 
	jrne 4$
	call add24
	jra 1$ 
4$:	
	call sub24
	jra 1$
8$: ld a,(OP,sp)
	jreq 9$ 
	_unget_token	
9$: 
	ld a,#TK_INTGR	
expr_exit:
	_drop VSIZE 
	ret 

;---------------------------------------------
; rel ::= expr rel_op expr
; rel_op ::=  '=','<','>','>=','<=','<>','><'
;  relation return  integer , zero is false 
;  output:
;    A 		token attribute  
;	 xstack		value  
;---------------------------------------------
	RELOP=1
	VSIZE=1 
relation: 
	_vars VSIZE
	call expression
	tnz a 
	jrne 1$
	jp rel_exit
1$:	
; expect rel_op or leave 
	call next_token 
	ld (RELOP,sp),a 
	and a,#TK_GRP_MASK
	cp a,#TK_GRP_RELOP 
	jrne 8$
2$:	; expect another expression
	call expression
	cp a,#TK_INTGR
	jreq 3$
	jp syntax_error 
3$:	
	call sub24 
	jrne 4$
	mov acc8,#2 ; n1==n2
	jra 6$ 
4$: 
	jrsgt 5$  
	mov acc8,#4 ; n1<2 
	jra 6$
5$:
	mov acc8,#1 ; n1>n2 
6$:
	clrw x 
	ld a, acc8  
	and a,(RELOP,sp)
	jreq 7$
	incw x
7$:	_store_top   
	jra 10$  	
8$: ld a,(RELOP,sp)
	jreq 10$
	_unget_token
10$:
	ld a,#TK_INTGR
rel_exit:
	_drop VSIZE
	ret 

;--------------------------------
; BASIC: SHOW 
; print stack content in hexadecimal bytes 
; 16 bytes per row 
;--------------------------------
	DEPTH=1
	CNTR=2
	VSIZE=2
show:
	_vars VSIZE 
	clr (CNTR,sp)
	ldw x,#cstk_prompt
	call puts 
	pushw y 
	ldw x,#XSTACK_EMPTY
	subw x,(1,sp)
	_drop 2
	ld a,#CELL_SIZE 
	div x,a  
	ld a,xl  
    ld (DEPTH,sp),a 
	ldw ptr16,y 
1$: 
	ld a,[ptr16]
	inc ptr8 
	ldw x,[ptr16]
	inc ptr8 
	inc ptr8 
	ld acc24,a 
	ldw acc16,x 
	call prt_acc24
	ld a,#SPACE 
	call putc 
	inc (CNTR,sp)
	ld a,(CNTR,sp)
	cp a,(DEPTH,sp)
	jrmi 1$
	ld a,#CR 
	call putc  
	_drop VSIZE 
	ret

cstk_prompt: .asciz "\ncontent of expression stack from top to bottom:\n"


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
	pushw y 
	clr a 
	ldw x,#tib 
	ldw y,txtbgn 
	cpw y,#app_space
	jrult 1$
	subw x,#free_ram 
	jra 2$ 
1$:	
	subw x,txtend
2$:	popw y 
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
	mul x,a 
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
	call expression    
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
; return constant value 
; from it's record address
; input:
;	X	*const record 
; output:
;   A:X   const  value
;--------------------------
get_const_value: ; -- i 
	ld a,(x) ; record size 
	sub a,#3 ; * value 
	push a 
	push #0 
	addw x,(1,sp)
	ld a,(x)
	ldw x,(1,x)
	_drop 2
	ret 


;--------------------------
; list constants in EEPROM 
; call when using LIST \C 
;-------------------------
	COUNT=1
	YTEMP=3
	VSIZE=4 
list_const:
	pushw y 
	_vars 4 
	clrw x 
	ldw (COUNT,sp),x  
	ldw Y,#EEPROM_BASE 
1$:	cpw y,free_eeprom 
	jruge 9$
    ldw (YTEMP,sp),y 
	ldw x,y
	incw x 
	call puts  
	ld a,#'= 
	call putc 
	ldw x,(YTEMP,sp)
	call get_const_value 
	ld acc24,a 
	ldw acc16,x 
	call prt_acc24
	ldw x,(COUNT,sp)
	incw x 
	ldw (COUNT,sp),x 
	clr acc16 
	ldw y,(YTEMP,sp)
	ld a,(y)
	ld acc8,a
	addw y,acc16 
	jra 1$ 
9$:	
	ldw x,(COUNT,sp)
	call prt_i16 
	ldw x,#CONST_COUNT 
	call puts 
	_drop VSIZE 
	popw y 
	ret 

CONST_COUNT: .asciz "constants in EEPROM\n"


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

CONST_REC_MIN_BYTES=5 
;--------------------------
; search constant name 
; format of constant record  
;   .byte record length 
;         = strlen(name)+5 
;   .asciz name (variable length)
;   .int24 value (3 bytes )
; a constant record use 7+ bytes
; constants are saved in EEPROM  
; input:
;    X     *name
; output:
;    X     address|0
; use:
;   A,Y, acc16 
;-------------------------
	NAMEPTR=1 ; target name pointer 
	EEPTR=3   ; walking pointer in EEPROM
	RECLEN=5  ; record length of target
	VSIZE=5
search_const:
	pushw y 
	_vars VSIZE
	clr acc16 
	call strlen 
	add a,#CONST_REC_MIN_BYTES 
	ld (RECLEN,sp),a    
	ldw (NAMEPTR,sp),x
	ldw y,#EEPROM_BASE 
1$:	ldw x,(NAMEPTR,sp)
	ldw (EEPTR,sp),y
	cpw y, free_eeprom 
	jruge 7$ ; no match found 
	ld a,(y)
	cp a,(RECLEN,sp)
	jrne 2$ 
	incw y 
	call strcmp
	jrne 8$ ; match found 
2$: ; skip this one 	
	ldW Y,(EEPTR,sp)
	ld a,(y)
	ld acc8,a 
	addw y,acc16 
	jra 1$  
7$: ; no match found 
	clr (EEPTR,sp)
	clr (EEPTR+1,sp)
8$: ; match found 
	ldw x,(EEPTR,sp) ; record address 
9$:	_DROP VSIZE
	 popw y 
	 ret 


;--------------------------------------------
; BASIC: CONST name=value [, name=value]*
; define constant(s) saved in EEPROM
;--------------------------------------------
	CNAME=1 
	BUFPTR=3
	RECLEN=5
	VSIZE=5
cmd_const:
	pushw y 
	_vars VSIZE 
	bres flags,#FUPDATE 
	call next_token 
	cp a,#TK_CHAR 
	jrne 1$
	ld a,xl
	and a,#0xDF 
	cp a,#'U 
	jrne 2$
	bset flags,#FUPDATE 
0$:
	call next_token 
1$:	
	cp a,#TK_LABEL 
	jreq 3$
2$:	 
	jp syntax_error 
3$: 
	ldw (CNAME,sp),x ; *const_name
	ldw x,(CNAME,sp)
	call strlen 
	add a,#CONST_REC_MIN_BYTES 
	ld (RECLEN,sp),a 
; copy name in buffer  
	ldw y,(CNAME,sp) 
	ldw x,#tib  
	ld a,(RECLEN,sp)
	ld (x),a 
	incw x  
	call strcpy 
	ldw (BUFPTR,sp),x 
; x not updated by strcpy 
; BUFPTR must be incremented 
; to point after name 
	ld a,(RECLEN,sp)
	sub a,#CONST_REC_MIN_BYTES-1
	add a,(BUFPTR+1,sp) ; 
	ld (BUFPTR+1,sp),a 
	jrnc 4$
    inc (BUFPTR,sp) 
4$:
	ld a,#TK_EQUAL 
	call expect 
	call expression 
	cp a,#TK_INTGR 
	jreq 5$ 
	jp syntax_error 
5$:	ldw y,(BUFPTR,sp)
	_xpop ; get value from xstack 
	ld (y),a 
	ldw (1,y),x 
; record completed in buffer 
; check if constant already exist 
; if so update value if \U option set 
	clr farptr 
	ldw x,(CNAME,sp)
	call search_const 
	tnzw x 
	jreq 6$ ; new constant  
	btjf flags,#FUPDATE,8$
	jra 7$	
6$:	
	ldw x,free_eeprom  
7$:	
	ldw farptr+1,x 
	ldw x,#tib 
	ld a,(RECLEN,sp)
	call write_nbytes
; update free_eeprom 
	clrw x 
	ld a,(RECLEN,sp)
	ld xl,a 
	addw x,free_eeprom 
	ldw free_eeprom,x
8$:
	call next_token 
	cp a,#TK_COMMA 
	jrne 9$
	jp 0$ 
9$: 
	_unget_token    
10$: 
	_drop VSIZE 
	popw y 
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
STR_BYTES: .asciz "bytes" 
FLASH_MEM: .asciz " in FLASH memory" 
RAM_MEM:   .asciz " in RAM memory" 


;----------------------------
; BASIC: LIST [[start][,end]]
; list program lines 
; form start to end 
; if empty argument list then 
; list all.
;----------------------------
	FIRST=1
	LAST=3 
	LN_PTR=5
	VSIZE=6 
list:
	btjf flags,#FRUN,0$
	ld a,#ERR_CMD_ONLY
	jp tb_error
0$:	 
	call next_token 
	cp a,#TK_CHAR 
	jrne 2$
	call get_char 
	and a,#0xDF 
	cp a,#'C 
	jrne 1$
	call list_const
	ret 
1$: jp syntax_error 
2$:	_unget_token 
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
	call arg_list
	tnz a
	jreq list_loop 
	cp a,#2 
	jreq 4$
	cp a,#1 
	jreq first_line 
	jp syntax_error 
4$:	popw x 
	ldw (LAST+2,sp),x 
first_line:
	popw x
	ldw (FIRST,sp),x 
lines_skip:
	ldw x,txtbgn
2$:	ldw (LN_PTR,sp),x 
	cpw x,txtend 
	jrpl list_exit 
	ldw x,(x) ;line# 
	cpw x,(FIRST,sp)
	jrpl list_loop 
	ldw x,(LN_PTR,sp) 
	ld a,(2,x)
	ld acc8,a 
	clr acc16 
	addw x,acc16
	jra 2$ 
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
	jrslt list_loop
list_exit:
	mov in,count 
	ldw x,#pad 
	ldw basicptr,x 
	_drop VSIZE 
	call program_info 
	ret


;--------------------------
; BASIC: EDIT 
;  copy program in FLASH 
;  to RAM for edition 
;-------------------------
edit:
	call qsign 
	jreq 1$ 
	ldw x,#NOT_SAVED 
	call puts 
	ret 
1$: 
	ldw y,#app_sign ; source address 
    ldw x,app_size  
	addw x,#4 
	ldw acc16,x  ; bytes to copy 
	ldw x,#rsign ; destination address 
	call move  
	ldw x,#free_ram 
	ldw txtbgn,x 
	addw x,rsize  
	ldw txtend,x 
	ret 

NOT_SAVED: .asciz "No application saved.\n"


;--------------------------
; decompile line from token list
; and print it. 
; input:
;   A       stop at this position 
;   X 		pointer at line
; output:
;   none 
;--------------------------	
prt_basic_line:
	pushw y 
	ld count,a 
	ld a,(2,x)
	cp a,count 
	jrpl 1$ 
	ld count,a 
1$:	ldw basicptr,x 
	ldw y,#tib  
	call decompile 
	call puts 
	ld a,#CR 
	call putc 
	popw y 
	ret 



;---------------------------------
; BASIC: PRINT|? arg_list 
; print values from argument list
;----------------------------------
	CCOMMA=1
	VSIZE=1
print:
	_vars VSIZE 
reset_comma:
	clr (CCOMMA,sp)
prt_loop:
	call next_token
	cp a,#CMD_END 
	jrult print_exit ; colon or end of line 
	cp a,#TK_QSTR
	jreq 1$
	cp a,#TK_CHAR 
	jreq 2$ 
	cp a,#TK_CFUNC 
	jreq 3$
	cp a,#TK_COMMA 
	jreq 4$
	cp a,#TK_SHARP 
	jreq 5$
	jra 7$ 
1$:	; print string 
	call puts
	incw x
	subw x,basicptr 
	ldw in.w,x  
	jra reset_comma
2$:	; print character 
	call get_char 
	call putc 
	jra reset_comma 
3$: ; print character function value  	
	call get_code_addr 
	call (x)
	call putc
	jra reset_comma 
4$: ; set comma state 
	cpl (CCOMMA,sp)
	jra prt_loop   
5$: ; # character must be followed by an integer   
	call next_token
	cp a,#TK_INTGR 
	jreq 6$
	jp syntax_error 
6$: ; set tab width
	call get_int24 
	ld a,xl 
	and a,#15 
	ld tab_width,a 
	jra reset_comma 
7$:	
	_unget_token 
	call expression  
	cp a,#TK_INTGR 
	jrne print_exit 
    call print_top 
	jra reset_comma 
print_exit:
	tnz (CCOMMA,sp)
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
	VAR_ADDR=6
	VSIZE=7
input_var:
	pushw y 
	_vars VSIZE 
input_loop:
	clr (SKIP,sp)
	call next_token 
	cp a,#TK_QSTR 
	jrne 1$ 
	call puts 
	cpl (SKIP,sp)
	call next_token 
1$: cp a,#TK_VAR  
	jreq 2$ 
	jp syntax_error
2$:	ldw (VAR_ADDR,sp),x 
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
	call get_token 
	cp a,#TK_INTGR 
	jreq 22$
	call rest_context 
	jp syntax_error
22$:
	call neg_acc24	
3$: ldw y,(VAR_ADDR,sp) 
	ld a,acc24 
	ldw x,acc16 
	ld (y),a 
	ldw (1,y),x 
	call rest_context
	call next_token 
	cp a,#TK_COMMA 
	jreq input_loop
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
	XMASK=1 
	MASK=2
	ADDR=3
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
	ld a,(x)
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
	call relation 
	cp a,#TK_INTGR
	jreq 1$ 
	jp syntax_error
1$:	_xpop 
	tnzw x 
	jrne 9$ 
;skip to next line
	mov in,count
9$:	ret 

;------------------------
; BASIC: FOR var=expr 
; set variable to expression 
; leave variable address 
; on stack and set
; FLOOP bit in 'flags'
;-----------------
	RETL1=1 ; return address  
	FSTEP=3  ; variable increment
	LIMIT=5 ; loop limit 
	CVAR=8   ; control variable 
	INW=10   ;  in.w saved
	BPTR=12 ; baseptr saved
	VSIZE=12  
for: ; { -- var_addr }
	popw x ; call return address 
	_vars VSIZE 
	pushw x  ; RETL1 
	ld a,#TK_VAR 
	call expect
	pushw x 
	call get_addr
	ldw (CVAR,sp),x  ; control variable 
	popw x 
	call let_var 
	bset flags,#FLOOP 
	call next_token 
	cp a,#TK_CMD 
	jreq 1$
	jp syntax_error
1$:  
	call get_code_addr
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
	call get_code_addr
	cpw x,#step 
	jreq step
3$:	
	_unget_token   	 
4$:	
	ldw x,#1   ; default step  
	ldw (FSTEP,sp),x 
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
	ldw (FSTEP,sp),x ; step
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
	addw x,(FSTEP,sp) ; var+step 
	adc a,#0  
	ld [ptr16],a
	inc ptr8  
	ldw [ptr16],x 
	ld acc24,a 
	ldw acc16,x 
; check sign of STEP  
	ld a,#0x80
	bcp a,(FSTEP,sp)
	jrpl 4$
;negative step
	ld a,(LIMIT,sp)
	ldw x,(LIMIT+1,sp)
	call cp24 
	jrslt loop_done
	jra loop_back 
4$: ; positive step
	ld a,(LIMIT,sp)
	ldw x,(LIMIT+1,sp)
	call cp24
	jrsgt loop_done
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
;---------------------------
get_target_line:
	call next_token  
	cp a,#TK_INTGR
	jreq get_target_line_2 
	cp a,#TK_LABEL 
	jreq look_target_symbol 
	jp syntax_error
get_target_line_2:
	pushw y 
	call get_int24 
	clr a
	ldw y,basicptr 
	ldw y,(y)
	pushw y 
	cpw x,(1,sp)
	_drop 2  
	jrult 11$
	inc a 
11$:	
	call search_lineno  
	tnzw x 
	jrne 2$ 
	ld a,#ERR_NO_LINE 
	jp tb_error 
2$:	popw y 
	ret 

; the GOTO|GOSUB target is a symbol.
look_target_symbol:
	pushw y 
	pushw x 
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
	jrne 4$
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
	RET_ADDR=3
	RET_INW=5
	VSIZE=4  
cmd_on:
	pushw y 
	btjt flags,#FRUN,0$ 
	ld a,#ERR_RUN_ONLY
	jp tb_error 
0$:	call expression 
	cp a,#TK_INTGR
	jreq 1$
	jp syntax_error
1$: _xpop 
	cpw x,#1 
	jrsge 11$
	jp 9$ 
11$:	
	cpw x,#16 ; no more than 16 arguments 
	jrugt 9$
	ld a,xl 
	push a  ; selector  
	call next_token ; should be GOTO|GOSUB 
	cp a,#TK_CMD 
	jreq 2$ 
	jp syntax_error 
2$: call get_code_addr
	cpw x,#goto 
	jreq 4$
	cpw x,#gosub 
	jreq 4$ 
	jp syntax_error 
4$: pop a 
	pushw x ; save routine address 	
	push a  ; -- code_addr selector  
5$: call next_token 
	cp a,#TK_INTGR 
	jreq 52$
	jp syntax_error 
52$: ; got a line number 
	call get_int24  
	dec (1,sp) ; decrement selector 
	jreq 58$ ; this is the selected one 
	call next_token ; try for the next one 
	cp a,#TK_COMMA 
	jreq 5$ 
; arg list exhausted, selector to big 
; continue execution on next line 
	_drop 3 ; drop selector and GOTO|GOSUB address 
	jra 9$
58$: ;found line# in list 
	_drop 1 ; discard selector 
	mov in,count ; skip to end of this line. 
; here only the routine address of GOTO|GOSUB is on stack 
;   X contain target line number 
8$:	call get_target_line_2
	popw y ; routine address GOTO|GOSUB  
	cpw y,#goto 
	jreq jp_to_target 
	popw y 
	_vars VSIZE 
	pushw y 
	ldw y,basicptr 
	mov in,count 
	addw y,in.w 
	ldw (RET_ADDR,sp),y 
	ldw y,#3 
	ldw (RET_INW,sp),y
	popw y 
	jra jp_to_target
9$: ; expr out of range skip to next line 
	mov in,count
	clr a 
	popw y  
	ret 

;------------------------
; BASIC: GOTO line# 
; jump to line# 
; here cstack is 2 call deep from interpreter 
;------------------------
goto:
	btjt flags,#FRUN,0$ 
	ld a,#ERR_RUN_ONLY
	jp tb_error 
0$:	call get_target_line
jp_to_target:
	ldw basicptr,x 
	ld a,(2,x)
	ld count,a 
	mov in,#3 
	ret 


;--------------------
; BASIC: GOSUB line#
; basic subroutine call
; actual line# and basicptr 
; are saved on cstack
; here cstack is 2 call deep from interpreter 
;--------------------
	RET_ADDR=3
	RET_INW=5
	VSIZE=4  
gosub:
	btjt flags,#FRUN,0$ 
	ld a,#ERR_RUN_ONLY
	jp tb_error 
	ret 
0$:	popw x 
	_vars VSIZE  
	pushw x 
	ldw x,basicptr
	ldw (RET_ADDR,sp),x 
	call get_target_line  
	pushw x 
	ldw x,in.w 
	ldw (RET_INW+2,sp),x
	popw x 
	jra jp_to_target

;------------------------
; BASIC: RETURN 
; exit from a subroutine 
; 
;------------------------
return:
	btjt flags,#FRUN,0$ 
	ld a,#ERR_RUN_ONLY
	jp tb_error 
0$:	
	ldw x,(RET_ADDR,sp) 
	ldw basicptr,x
	ld a,(2,x)
	ld count,a  
	ldw x,(RET_INW,sp)
	ldw in.w,x 
	popw x 
	_drop VSIZE 
	pushw x
	ret  


;----------------------------------
; BASIC: RUN
; run BASIC program in RAM
;----------------------------------- 
run: 
	btjf flags,#FRUN,0$  
	clr a 
	ret
0$: 
	btjf flags,#FBREAK,1$
	_drop 2 
	call rest_context
	_drop CTXT_SIZE 
	bres flags,#FBREAK 
	bset flags,#FRUN 
	jp interpreter 
1$:	ldw x,txtbgn
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
cmd_end: 
; clean stack 
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
	ld a,#TK_INTGR
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
	clr a
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
	btjf flags,#FRUN,0$ 
	ret 
0$:	
	call clear_basic 
	ret 

;-----------------------------------
; BASIC: ERASE \E | \F 
; erase all block in range from 
;  'app_space' to FLASH end (0x20000)
;  or all EEPROM 
; that contains a non zero byte.  
;-----------------------------------
	LIMIT=1 
	VSIZE = 3 
erase:
	clr farptr 
	_vars VSIZE 
	call next_token 
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
	ldw x,#app_sign 
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
; output:
;   Carry    0 app present 
;            1 no app installed  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
qsign: 
	ldw x,app_sign 
	cpw x,SIGNATURE ; "BC" 
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


;---------------------------------------
; BASIC: SAVE
; write application from RAM to FLASH
;--------------------------------------
	XTEMP=1
	COUNT=3  ; last count bytes written 
	CNT_LO=4 ; count low byte 
	TOWRITE=5 ; how bytes left to write  
	VSIZE=6 
save_app:
	pushw x 
	pushw y 
	_vars VSIZE
	call qsign 
	jrne 1$
	ldw x,#CANT_DO 
	call puts 
	jp 9$
1$: 
	ldw x,txtbgn
	cpw x,txtend 
	jrult 2$ 
	ldw x,#NO_APP
	call puts 
	jp 9$
2$: 
; block programming flash
; must be done from RAM
; moved in tib  
	call move_prg_to_ram
; initialize farptr 
; to app_sign address 
	clr farptr 
	ldw x,#app_sign 
	ldw farptr+1,x
; initialize local variables 
	call prog_size
	ldw (TOWRITE,sp),x
	clr (COUNT,sp)
; first bock 
; containt signature 2 bytes 
; and size 	2 bytes 
; use Y as pointer to block_buffer
	call clear_block_buffer ; -- y=*block_buffer	
; write signature
	ldw x,SIGNATURE ; "BC" 
	ldw (y),x 
	addw y,#2
	ldw x,(TOWRITE,sp)
	ldw (y),x
	addw y,#2   
	ld a,#(BLOCK_SIZE-4)
	ld (CNT_LO,sp),a 
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


SIGNATURE: .ascii "BC"
CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
NO_APP: .asciz "No application in RAM"

;---------------------
; BASIC: WRITE expr1,expr2[,expr]* 
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
2$:	call expression
	cp a,#TK_INTGR
	jreq 3$
	jp syntax_error
3$:	_xpop 
	ld a,xl 
	clrw x 
	call write_byte
	ldw x,#1 
	call incr_farptr 
	jra 1$ 
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
char:
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

;---------------------
; BASIC: GPIO(expr,reg)
; return gpio address 
; expr {0..8}
; input:
;   none 
; output:
;   X 		gpio register address
;----------------------------
;	N=PORT
;	T=REG 
gpio:
	call func_args 
	cp a,#2
	jreq 1$
	jp syntax_error  
1$:	_at_next 
	tnzw x 
	jrmi bad_port
	cpw x,#9
	jrpl bad_port
	ld a,#5
	mul x,a
	addw x,#GPIO_BASE 
	pushw x 
	_xpop
	addw x,(1,sp)
	_drop 2 
	clr a 
	_store_top 	
	ld a,#TK_INTGR
	ret
bad_port:
	ld a,#ERR_BAD_VALUE
	jp tb_error


;-------------------------
; BASIC: UFLASH 
; return free flash address
; input:
;  none 
; output:
;	A		TK_INTGR
;   xstack	free address 
;---------------------------
uflash:
	ldw x,app_sign
	cpw x,#4243 ; signature "BC" 
	jreq 1$
	ldw x,app_size 
	addw x,#app
	jra 2$
1$:	ldw x,#app_space 
2$:	clr a 
	ret 


;---------------------
; BASIC: USR(addr[,arg])
; execute a function written 
; in binary code.
; binary fonction should 
; return token attribute in A 
; and value in YL:X. 
; input:
;   addr	routine address 
;   arg 	is an optional argument 
; output:
;   A 		token attribute 
;   xstack  returned value 
;---------------------
usr:
	pushw x 
	pushw y 	
	call func_args 
	cp a,#1 
	jreq 1$
	cp a,#2
	jreq 1$  
	jp syntax_error 
1$: push a 
	_xpop 
	ldw y,x  ; arg|addr 
    pop a 
	cp a,#1 
	jreq 3$
	_xpop  ; x=code addr  
	exgw x,y ; y=code addr, x=arg 
3$: call (y)
	push a 
	ld a,yl  
	_xpush 
	pop a 
	popw y 
	popw x 
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
2$:	clr a 
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
	ldw x,ticks 
	clr a 
	_xpush 
	ld a,#TK_INTGR
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
    ld a,#TK_INTGR 
	ret 

;------------------------------
; BASIC: AND(expr1,expr2)
; Apply bit AND relation between
; the 2 arguments, i.e expr1 & expr2 
; output:
; 	A 		TK_INTGR
;   X 		result 
;------------------------------
bit_and: ; i1 i2 -- i1 & i2 
	call func_args 
	cp a,#2
	jreq 1$
	jp syntax_error 
1$:	_xpop 
    pushw x 
	push  a 
	_at_top 
	and a,(1,sp)
	rlwa x 
	and a,(2,sp)
	rlwa x 
	and a,(3,sp)
	rlwa x 
	_drop 3 
	_store_top 
	ld a,#TK_INTGR
	ret

;------------------------------
; BASIC: OR(expr1,expr2)
; Apply bit OR relation between
; the 2 arguments, i.e expr1 | expr2 
; output:
; 	A 		TK_INTGR
;   X 		result 
;------------------------------
bit_or:
	call func_args 
	cp a,#2
	jreq 1$
	jp syntax_error 
1$:	_xpop 
    pushw x 
	push  a 
	_at_top 
	or a,(1,sp)
	ld yl,a 
	ld a,xh 
	or a,(2,sp)
	ld xh,a 
	ld a,xl 
	or a,(3,sp)
	ld xl,a 
	ld a,yl 
	_drop 3 
	_store_top 
	ld a,#TK_INTGR
	ret

;------------------------------
; BASIC: XOR(expr1,expr2)
; Apply bit XOR relation between
; the 2 arguments, i.e expr1 ^ expr2 
; output:
; 	A 		TK_INTGR
;   X 		result 
;------------------------------
bit_xor:
	call func_args 
	cp a,#2
	jreq 1$
	jp syntax_error 
1$:	_xpop 
    pushw x 
	push  a 
	_at_top 
	xor a,(1,sp)
	ld yl,a 
	ld a,xh 
	xor a,(2,sp)
	ld xh,a 
	ld a,xl 
	xor a,(3,sp)
	ld xl,a 
	ld a,yl 
	_drop 3 
	_store_top 
	ld a,#TK_INTGR
	ret

;------------------------------
; BASIC: LSHIFT(expr1,expr2)
; logical shift left expr1 by 
; expr2 bits 
; output:
; 	A 		TK_INTGR
;   X 		result 
;------------------------------
lshift:
	call func_args
	cp a,#2 
	jreq 1$
	jp syntax_error
1$: _xpop 
    ldw y,x    
	_at_top  ; T@ 
	tnzw y 
	jreq 4$
2$:	rcf 
	rlcw x 
	rlc a 
	decw y 
	jrne 2$
4$: _store_top  ; T! 
	ld a,#TK_INTGR
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
1$: _xpop 
    ldw y,x   
	_at_top  ; T@  
	tnzw y 
	jreq 4$
2$:	rcf 
	rrcw x
	rrc a  
	decw y 
	jrne 2$
4$: _store_top  ; T! 
	ld a,#TK_INTGR
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
	ldw y,x ; mode 
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
4$:	cpw y,#OUTP 
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
; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
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
	srlw y 
	ld a,yh 
	xor a,seedy 
	ld seedy,a  
	ld a,yl 
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
	ld xh,a 
	ld a,xl 
	xor a,acc8 
	ld xl,a 
; seedy=x^seedy 
	xor a,seedy+1
	ld xl,a 
	ld a,xh 
	xor a,seedy
	ld xh,a 
	ldw seedy,x 
; return seedy modulo expr + 1 
	ld a,seedx+1 
	_xpush 
	pop a 
	popw x 
	_xpush 
	call div24 
10$:
	ld a,#TK_INTGR
	ret 

;---------------------------------
; BASIC: WORDS 
; affiche la listes des mots du
; dictionnaire ainsi que le nombre
; de mots.
;---------------------------------
	WLEN=1 ; word length
	LLEN=2 ; character sent to console
	WCNT=3 ; count words printed 
	VSIZE=3 
words:
	_vars VSIZE
	clr (LLEN,sp)
	clr (WCNT,sp)
	ldw y,#kword_dict+2
0$:	ldw x,y
	ld a,(x)
	and a,#15 
	ld (WLEN,sp),a 
	inc (WCNT,sp)
1$:	incw x 
	ld a,(x)
	call putc 
	inc (LLEN,sp)
	dec (WLEN,sp)
	jrne 1$
	ld a,#70
	cp a,(LLEN,sp)
	jrmi 2$   
	ld a,#SPACE 
	call putc 
	inc (LLEN,sp) 
	jra 3$
2$: ld a,#CR 
	call putc 
	clr (LLEN,sp)
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
	ret 
words_count_msg: .asciz " words in dictionary\n"


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
;------------------------------
timeout:
	ldw x,timer 
logical_complement:
	ld a,#255 
	cplw x 
	cpw x,#-1
	jreq 2$
	clrw x
	clr a 
2$:	_xpush  
	ld a,#TK_INTGR
	ret 

;--------------------------------
; BASIC NOT(expr) 
; return logical complement of expr
;--------------------------------
func_not:
	call func_args  
	cp a,#1
	jreq 1$
	jp syntax_error
1$:  
	call cpl24 
	ld a,#TK_INTGR
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
; BASIC: LOG(expr)
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
1$: _at_top   
leading_one:
	tnz a
	jrne 2$ 
	tnzw x 
	jrne 2$
	inc a  
	jra 9$
2$:	push #24  
3$: rlcw x 
    rlc a 
	jrc 4$
	dec (1,sp) 
	jrne 3$
4$: clrw x 
    pop a 
	ld xl,a 
	clr a 
9$:	_store_top 
	ld a,#TK_INTGR
	ret 

;-----------------------------------
; BASIC: BIT(expr) 
; expr ->{0..15}
; return 2^expr 
; output:
;    x    2^expr 
;-----------------------------------
bitmask:
    call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error 
1$: popw x 
	ld a,xl 
	and a,#15
	clrw x 
	incw x 
2$: tnz a 
	jreq 3$
	slaw x 
	dec a 
	jra 2$ 
3$: ld a,#TK_INTGR
	ret 

;------------------------------
; BASIC: INVERT(expr)
; 1's complement 
;--------------------------------
invert:
	call func_args
	cp a,#1 
	jreq 1$
	jp syntax_error
1$: popw x  
	cplw x 
	ld a,#TK_INTGR 
	ret 

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
	ldw y,basicptr 
	ldw (DOLP_ADR,sp),y
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
	call relation 
	cp a,#TK_INTGR
	jreq 2$
	jp syntax_error
2$: 
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
; BASIC: PRTA...PRTI  
;  return constant value 
;  PORT  offset in GPIO
;  array
;---------------------------
const_porta:
	ldw x,#0
	ld a,#TK_INTGR 
	ret 
const_portb:
	ldw x,#1
	ld a,#TK_INTGR 
	ret 
const_portc:
	ldw x,#2
	ld a,#TK_INTGR 
	ret 
const_portd:
	ldw x,#3
	ld a,#TK_INTGR 
	ret 
const_porte:
	ldw x,#4
	ld a,#TK_INTGR 
	ret 
const_portf:
	ldw x,#5
	ld a,#TK_INTGR 
	ret 
const_portg:
	ldw x,#6
	ld a,#TK_INTGR 
	ret 
const_porth:
	ldw x,#7
	ld a,#TK_INTGR 
	ret 
const_porti:
	ldw x,#8
	ld a,#TK_INTGR 
	ret 

;-------------------------------
; following return constant 
; related to GPIO register offset 
;---------------------------------
const_odr:
	ld a,#TK_INTGR 
	ldw x,#GPIO_ODR
	ret 
const_idr:
	ld a,#TK_INTGR 
	ldw x,#GPIO_IDR
	ret 
const_ddr:
	ld a,#TK_INTGR 
	ldw x,#GPIO_DDR
	ret 
const_cr1:
	ld a,#TK_INTGR 
	ldw x,#GPIO_CR1
	ret 
const_cr2:
	ld a,#TK_INTGR 
	ldw x,#GPIO_CR2
	ret 
;-------------------------
; BASIC: POUT 
;  constant for port mode
;  used by PMODE 
;  to set pin as output
;------------------------
const_output:
	ld a,#TK_INTGR 
	ldw x,#OUTP
	ret 

;-------------------------
; BASIC: PINP 
;  constant for port mode
;  used by PMODE 
;  to set pin as input
;------------------------
const_input:
	ld a,#TK_INTGR 
	ldw x,#INP 
	ret 
	
;-----------------------
; memory area constants
;-----------------------
const_eeprom_base:
	ld a,#TK_INTGR 
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
	ldw x,(4,x)
	ldw x,(code_addr,x)
	cpw x,#data 
	ret 

;---------------------------
; set DATA pointer at line# 
; specified by X 
;---------------------------
data_line:
    clr a 
	call search_lineno
	tnzw x 
	jrne 3$
2$:	ld a,#ERR_NO_LINE 
	jp tb_error
3$: ; check if valid data line 
    ldw y,x 
	call is_data_line 
	jrne 2$ 
set_data_ptr: 	
	ldw data_ptr,y
	ld a,(2,y)
	ld data_len,a 
	mov data_ofs,#FIRST_DATA_ITEM 
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
	clr data_ptr 
	clr data_ptr+1
	clr data_ofs 
	clr data_len
	call next_token 
	cp a,#TK_INTGR
	jreq data_line
	_unget_token 
	ldw x,txtbgn
; search first DATA line 
data_search_loop: 	
	cpw x,txtend
	jruge restore_error 
	ldw y,x 
	call is_data_line 
	jreq set_data_ptr
try_next_line: 
	ldw x,y 
	ld a,(2,x)
	ld acc8,a 
	clr acc16 
	addw x,acc16 
	jra data_search_loop
restore_error:	
    ld a,#ERR_NO_DATA 
	jp tb_error 


;---------------------------------
; BASIC: READ 
; return next data item | 0 
;---------------------------------
	CTX_BPTR=1 
	CTX_IN=3 
	CTX_COUNT=4 
	XSAVE=5
	VSIZE=6
read:
	_vars  VSIZE 
read01:	
	ld a,data_ofs
	cp a,data_len 
	jreq 2$ ; end of line  
	call save_context
	ldw x,data_ptr 
	ldw basicptr,x 
	mov in,data_ofs 
	mov count,data_len  
	call expression 
	cp a,#TK_INTGR 
	jreq 1$ 
	jp syntax_error 
1$:
	ldw (XSAVE,SP),x
	call next_token ; skip comma
	ldw x,basicptr 
	ldw data_ptr,x 
	mov data_ofs,in 
	call rest_context
	ldw x,(XSAVE,sp)
	ld a,#TK_INTGR
	_drop VSIZE 
	ret 
2$: ; end of line reached 
	ldw y, data_ptr 
	clr data_ptr
	clr data_ptr+1   
	clr data_ofs 
	clr data_len 
	call try_next_line 
	jra read01


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
	ld a,#TK_INTGR 
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
	ld a,TK_INTGR
	ret 


;------------------------------
;      dictionary 
; format:
;   link:   2 bytes 
;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
;   cmd_name: 16 byte max 
;   cmd_index: 2 bytes 
;------------------------------
	.macro _dict_entry len,name,cmd_idx 
	.word LINK 
	LINK=.
name:
	.byte len 	
	.ascii "name"
	.word cmd_idx 
	.endm 

	LINK=0
; respect alphabetic order for BASIC names from Z-A
; this sort order is for a cleaner WORDS cmd output. 	
kword_end:
	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
	_dict_entry,5,WRITE,WRITE_IDX;write  
	_dict_entry,5,WORDS,WORDS_IDX;words 
	_dict_entry 4,WAIT,WAIT_IDX;wait 
	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
	_dict_entry,5,UNTIL,UNTIL_IDX;until 
	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
	_dict_entry,4,TONE,TONE_IDX;tone  
	_dict_entry,2,TO,TO_IDX;to
	_dict_entry,5,TIMER,TIMER_IDX;set_timer
	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
	_dict_entry,4,STOP,STOP_IDX;stop 
	_dict_entry,4,STEP,STEP_IDX;step 
	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
    _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
	_dict_entry,4,SHOW,SHOW_IDX;show 
	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
	_dict_entry 3,RUN,RUN_IDX;run
	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
	_dict_entry,6,RETURN,RET_IDX;return 
	_dict_entry,7,RESTORE,REST_IDX;restore 
	_dict_entry 3,REM,REM_IDX;remark 
	_dict_entry,6,REBOOT,RBT_IDX;cold_start
	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
	_dict_entry 5,PRINT,PRT_IDX;print 
	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
	_dict_entry,4,POKE,POKE_IDX;poke 
	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
	_dict_entry,2,ON,ON_IDX; cmd_on 
	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
	_dict_entry,4,NEXT,NEXT_IDX;next 
	_dict_entry,3,NEW,NEW_IDX;new
;	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
	_dict_entry 4,LIST,LIST_IDX;list
	_dict_entry 3,LET,LET_IDX;let 
	_dict_entry,3+F_CFUNC,KEY,KEY_IDX;key 
	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
	_dict_entry,5,INPUT,INPUT_IDX;input_var  
	_dict_entry,2,IF,IF_IDX;if 
	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
	_dict_entry,3,HEX,HEX_IDX;hex_base
	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
	_dict_entry,4,GOTO,GOTO_IDX;goto 
	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
	_dict_entry,3,GET,GET_IDX; cmd_get 
	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
	_dict_entry,3,FOR,FOR_IDX;for 
	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
	_dict_entry,5,ERASE,ERASE_IDX; erase 
	_dict_entry,3,END,END_IDX;cmd_end  
	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
	_dict_entry,6+F_IFUNC,EEFREE,EEFREE_IDX; func_eefree 
	_dict_entry,4,EDIT,EDIT_IDX ; edit 
	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
	_dict_entry,2,DO,DO_IDX;do_loop
	_dict_entry,3,DEC,DEC_IDX;dec_base
	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
	_dict_entry,4,DATA,DATA_IDX;data  
	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
	_dict_entry,5,CONST,CONST_IDX; cmd_const 
	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
	_dict_entry,3,BYE,BYE_IDX;bye 
	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
	_dict_entry,4,BSET,BSET_IDX;bit_set 
	_dict_entry,4,BRES,BRES_IDX;bit_reset
	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
	_dict_entry,3,AWU,AWU_IDX;awu 
	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
kword_dict::
	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs

;comands and fonctions address table 	
code_addr::
	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
	.word let,list,log2,lshift,next,new ; 40..47
	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
	.word restore,return, random,rshift,run,show,free ; 72..79
	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
	.word wait,words,write,bit_xor,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
	.word func_eefree,0 




