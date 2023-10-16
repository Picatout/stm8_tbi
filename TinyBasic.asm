;;
; Copyright Jacques Deschênes 2019,2022,2023  
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
;
; *  register Y is used as basicptr    
; 
;    IMPORTANT: when a routine use Y it must preserve 
;               its content and restore it at exit.
;               This hold only when BASIC is running  
;               
; *  BASIC function return their value registers 
;    A for character 
;	 X for address 
;	 A:X for integer 
; 
;  * variables return their value in A:X 
;
;--------------------------------------------------- 

SEPARATE=0 

.if SEPARATE 
    .module TINY_BASIC 
    .include "config.inc"

	.area CODE 
.endif 



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
;   Z flag 	0 != | 1 ==  
;-------------------------------------
strcmp:
	ld a,(x)
	jreq 5$ 
	cp a,(y) 
	jrne 9$ 
	incw x 
	incw y 
	jra strcmp 
5$: ; end of first string 
	cp a,(y)
9$:	ret 

;---------------------------------------
;  copy src string to dest 
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
    _ldaz acc16 
	or a, acc8
	jreq move_exit 
	addw x,(INCR,sp)
	addw y,(INCR,sp) 
	ld a,(y)
	ld (x),a 
	pushw x 
	_ldxz acc16 
	decw x 
	ldw acc16,x 
	popw x 
	jra move_loop
move_exit:
	_drop VSIZE
	pop a 
	ret 	

;-----------------------
;  display system 
;  information 
;-----------------------
	MAJOR=5
	MINOR=0
	REV=7 
		
software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022,2023\nversion "
board:
.if NUCLEO_8S208RB 
	.asciz "NUCLEO-8S208RB"
.else 
	.asciz "NUCLEO-8S207K8"
.endif 

system_information:
	push base 
	ldw x,#software 
	call puts 
	mov base, #10 
	ld a,#MAJOR 
	callr prt_i8 
	ld a,#'.
	call putc 
	ld a,#MINOR 
	callr prt_i8   
	ld a,#'R 
	call putc 
	ld a,#REV 
	callr prt_i8
	ld a,#CR 
	call putc
	ldw x,#board 
	call puts 
;call test 
	pop base 
	ret

;------------------------
; print int8 
; input:
;    A    int8 
; output:
;    none 
;-----------------------
prt_i8:
	clrw x 
	rlwa x 
	call prt_i16 
	ret 

warm_init:
	ldw x,#uart_putc 
	ldw out,x ; standard output   
	_clrz flags 
	mov base,#10 
	ldw x,#free_ram  
	ldw x,#tib 
	ldw end_free_ram,x
	subw x,dvar_end 
	ld a,#INT_SIZE 
	div x,a 
	_strxz array_size 
	ret 

;-------------------------
; erase app_sign 
;-------------------------
clear_autorun:
	ld a,#'X 
	clr farptr 
	ldw x,#app_sign 
	_strxz ptr16 
	clrw x
	call write_byte 
	call write_byte 
	ret 


;------------------------------------
;  set all variables to zero 
; input:
;   none 
; output:free_ram
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

;---------------------------
; reset BASIC text variables 
; and clear variables 
;---------------------------
clear_basic:
	pushw x 
	ldw x,#free_ram 
	ldw txtbgn,x 
	ldw txtend,x 
	ldw dvar_bgn,x 
	ldw dvar_end,x 
	call clear_vars 
	_clrz chain_level
	popw x
	ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   Tiny BASIC error messages 
;;   addresses indexed table 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	; macro to create err_msg table 
	.macro _err_entry msg_addr, error_code 
	.word msg_addr  
	error_code==ERR_IDX 
	ERR_IDX=ERR_IDX+1
	.endm 

	ERR_IDX=0

; array of pointers to 
; error_messages strings table.	
err_msg_idx:  	
	_err_entry 0,ERR_NONE  
	_err_entry err_mem_full,ERR_MEM_FULL
	_err_entry err_syntax,ERR_SYNTAX
	_err_entry err_math_ovf,ERR_MATH_OVF
	_err_entry err_div0,ERR_DIV0
	_err_entry err_no_line,ERR_NO_LINE 
	_err_entry err_run_only,ERR_RUN_ONLY
	_err_entry err_cmd_only,ERR_CMD_ONLY
	_err_entry err_duplicate,ERR_DUPLICATE
	_err_entry err_not_file,ERR_NOT_FILE
	_err_entry err_bad_value,ERR_BAD_VALUE
	_err_entry err_no_access,ERR_NO_ACCESS
	_err_entry err_no_data,ERR_NO_DATA 
	_err_entry err_no_prog,ERR_NO_PROG
	_err_entry err_no_fspace,ERR_NO_FSPACE
	_err_entry err_buf_full,ERR_BUF_FULL
	_err_entry err_read_only,ERR_READ_ONLY
	_err_entry err_not_program,ERR_NOT_PROGRAM 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; error messages strngs table 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
error_messages: 
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
err_read_only: .asciz "constant can't be modified\n"
err_not_program: .asciz "no program at this address\n"

;-------------------------------------
rt_msg: .asciz "\nrun time error, "
comp_msg: .asciz "\ncompile error, "

syntax_error::
	ld a,#ERR_SYNTAX 
tb_error::
	btjt flags,#FCOMP,1$
	push a 
.if 0 ; DEBUG 	
	call dump_prog
.endif 
	ldw x, #rt_msg 
	call puts 
0$:	pop a 
	callr print_err_msg
	subw y, line.addr 
	ld a,yl 
	sub a,#LINE_HEADER_SIZE 
	_ldxz line.addr 
	call prt_basic_line
	jra 6$
1$:	
	push a 
	ldw x,#comp_msg
	call puts 
	pop a 
	callr print_err_msg
	ldw x,#tib
	call puts 
	ld a,#CR 
	call putc
	_ldxz in.w
	call spaces
	ld a,#'^
	call putc 
6$: ldw x,#STACK_EMPTY 
    ldw sp,x
	jra warm_start 
	
;------------------------
; print error message 
; input:
;    A   error code 
; output:
;	 none 
;------------------------
print_err_msg:
	clrw x 
	ld xl,a 
	sllw x 
	addw x,#err_msg_idx 
	ldw x,(x)
	call puts 
	ret 

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
	tnz a 
	jreq cmd_line ; not direct command 
;; direct command 
;; interpret 
;;;;;;;;;;;;;;;;;;;;;;
;; dump compiled BASIC 	
.if 0 ; DEBUG 
	ldw x,#pad
	_clrz farptr 
	ldw ptr16,x 
	clrw x 
	_ldaz count 
	ld xl,a 
	call hex_dump  
.endif 
;;;;;;;;;;;;;;;;;;;;;;
;	jra interp_loop 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This is the interpreter loop
;; for each BASIC code line.
;; 12 cycles  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
do_nothing: 
interp_loop:   
    _next_cmd ; command bytecode, 2 cy  
.if 0;  DEBUG 
	_tp 'I 
	_jp_code 
.else 
	_jp_code ; 8 cy + 2 cy for jump back to interp_loop  
.endif 	 

;---------------------
; BASIC: REM | ' 
; skip comment to end of line 
;---------------------- 
kword_remark::
	ldw y,line.addr 
	ld a,(2,y) ; line length 
	_straz in  
	addw y,in.w   

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; move basicptr to first token 
; of next line 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
next_line:
	btjf flags,#FRUN,0$
	cpw y,txtend 
	jrmi 1$
0$:
	jp kword_end 
1$:	
	_stryz line.addr 
	addw y,#LINE_HEADER_SIZE
	btjf flags,#FTRACE,2$
	call prt_line_no 
2$:	
  _next 

;------------------------
; when TRACE is active 
; print line number to 
; be executed by VM
;------------------------
prt_line_no:
	ldw x,[line.addr] 
	call prt_i16 
	ld a,#CR 
	call putc 
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
	ld a,(y)
	jreq 8$
1$:	incw y
	ld a,(y)
	jrne 1$  
8$: incw y
	ret 


;--------------------
; skip label name 
;--------------------
skip_label:
	ld a,(y) ; label length 
	add a,#2 ; skip count and 0 terminal 
	push a 
	push #0
	addw y,(1,sp)
	_drop 2
	ret 

;-------------------
; needed for new 
; model using 
; _jp_code instead 
; of _call_code 
;--------------------
jump_label:
	ldw x,y 
	call skip_label 
	ld a,(y)
	cp a,#REL_EQU_IDX
	jrne 9$
	ldw y,x
	jp do_dvar 
9$:
	_next 

;--------------------
; extract int24_t  
; value from BASIC 
; code 
; input:
;    Y   *integer 
; output:
;    A:X   int24  
;--------------------
get_int24:
	ld a,(2,y)   ; 1 cy 
	ld xl,a      ; 1 cy 
	ld a,(1,y)   ; 1 cy 
	ld xh,a      ; 1 cy 
	ld a,(y)     ; 1 cy 
	addw y,#INT_SIZE  ; 2 cy 
	ret ; 4cy = 11cy   

;-------------------------------
; called when an intger token 
; is expected. can be LIT_IDX 
; or LITW_IDX 
; program fail if not integer 
;------------------------------
expect_integer:
	_next_token 
	cp a,#LIT_IDX 
	jreq get_int24
	cp a,#LITW_IDX 
	jreq 0$
	jp syntax_error
0$:	_get_word 
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
	_clrz acc24 
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
	SIGN=1  ; 1 byte, integer sign 
	LEN=2   ; 1 byte, string length 
	VSIZE=2 ;locals size
itoa::
	_vars VSIZE
	clr (LEN,sp) ; string length  
	clr (SIGN,sp)    ; sign
	tnz A
	jreq 1$ ; unsigned conversion  
	_ldaz base 
	cp a,#10
	jrne 1$
	; base 10 string display with negative sign if bit 23==1
	btjf acc24,#7,1$
	cpl (SIGN,sp)
	call neg_acc24
1$:
; initialize string pointer 
; build string at end of pad  
	ldw x,#pad 
	addw x,#PAD_SIZE 
	decw x 
	clr (x)
itoa_loop:
    _ldaz base
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
	_ldaz acc24
	or a,acc16
	or a,acc8
    jrne itoa_loop
	;conversion done, next add '$' or '-' as required
	_ldaz base 
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
;    A:X        int24_t 
;    acc24      int24_t 
;------------------------------------
	; local variables
	N=1 ; 3 bytes 
	SIGN=N+INT_SIZE ; 1 byte, 
	BASE=SIGN+1 ; 1 byte, numeric base used in conversion
	DIGIT=BASE+1 ; 1 byte, temporary storage
	PSTR=DIGIT+1 ; 2 bytes, preserve X 
	VSIZE=8 ; bytes reserved for local storage
atoi24::
	_vars VSIZE
	ldw (PSTR,sp),x ; pointer to string 
; conversion made on stack 
	clr a 
	clrw x 
	_i24_store N   
	clr (SIGN,sp)
	ld a,#10
	ld (BASE,sp),a ; default base decimal
	ldw x,(PSTR,sp)
	ld a,(x)
	jreq 9$  ; completed if 0
	cp a,#'-
	jrne 1$
	cpl (SIGN,sp)
	jra 2$
1$: 
	cp a,#'$
	jrne 3$
	ld a,#16
	ld (BASE,sp),a
2$:	incw x
	ldw (PSTR,sp),x 
	ld a,(x)
3$:	; char to digit 
	call to_upper 
	sub a,#'0
	jrmi 9$ 
	cp a,#10
	jrmi 5$
	cp a,#17  
	jrmi 9$ 
	sub a,#7
	cp a,(BASE,sp)
	jrpl 9$
5$:	ld (DIGIT,sp),a
	ld a,(BASE,sp)
	call mulu24_8
	rrwa x 
	add a,(DIGIT,SP)
	jrnc 6$
	incw x 
6$: rlwa x 
	_i24_store N  
	ldw x,(PSTR,sp)
	jra 2$
9$:	tnz (SIGN,sp)
    jreq 10$
    call neg24
10$:
	_i24_fetch N 
	ldw y,(PSTR,sp)
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
;  A		TOKEN_IDX  
;---------------------------------
	NLEN=1 ; cmd length 
	XSAVE=NLEN+2
	YSAVE=XSAVE+2
	VSIZE=YSAVE+1
search_dict::
	_vars VSIZE 
	clr (NLEN,sp)
	ldw (YSAVE,sp),y 
search_next:
	ldw (XSAVE,sp),x 
; get name length in dictionary	
	ld a,(x)
	ld (NLEN+1,sp),a  
	ldw y,(YSAVE,sp) ; name pointer 
	incw x 
	call strcmp 
	jreq str_match 
no_match:
	ldw x,(XSAVE,sp) 
	subw x,#2 ; move X to link field
	ld a,#NONE_IDX   
	ldw x,(x) ; next word link 
	jreq search_exit  ; not found  
;try next 
	jra search_next
str_match:
	ldw x,(XSAVE,sp)
	addw x,(NLEN,sp)
; move x to token field 	
	addw x,#2 ; to skip length byte and 0 at end  
	ld a,(x) ; token index
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
	_next_token 
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
	_next_token 
	cp a,#LPAREN_IDX 
	jreq arg_list 
	jp syntax_error 

; expected to continue in arg_list 
; caller must check for RPAREN_IDX 

;-------------------------------
; parse embedded BASIC routines 
; arguments list.
; arg_list::=  expr[','expr]*
; all arguments are of int24_t type
; and pushed on stack 
; input:
;   none
; output:
;   stack{n}   arguments pushed on stack
;   A  	number of arguments pushed on stack  
;--------------------------------
	ARGN=4 
	ARG_SIZE=INT_SIZE 
arg_list:
	push #0 ; arguments counter
1$:	 
	pop a 
	popw x 
	sub sp, #ARG_SIZE
	pushw x 
	inc a 
	push a
	call expression 
	_i24_store ARGN   
	_next_token 
	cp a,#COMMA_IDX 
	jreq 1$ 
	cp a,#RPAREN_IDX 
	jreq 7$ 
	_unget_token 
7$:	
	pop a
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
;   A 		ARRAY_IDX
; output:
;	X 		element address 
;----------------------
get_array_element:
	call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error
1$: _i24_pop 
    ; ignore A, index < 65536 in any case 
	; check for bounds 
	cpw x,array_size 
	jrule 3$
; bounds {1..array_size}	
2$: ld a,#ERR_BAD_VALUE 
	jp tb_error 
3$: 
	tnzw  x
	jreq 2$ 
	ld a,#INT_SIZE   
	mul x,a 
	ldw acc16,x   
	ldw x,end_free_ram ; array start at this point  
	subw x,acc16
	ret 


;***********************************
;   expression parse,execute 
;***********************************

;-----------------------------------
; factor ::= ['+'|'-'|e]  var | @ |
;			 integer | function |
;			 '('expression')' 
; output:
;   A:X     factr  
; ---------------------------------
	NEG=1
	VSIZE=1
factor:
	_vars VSIZE 
	clr (NEG,sp)
	_next_token
	cp a,#CMD_END
	jrugt 1$ 
	jp syntax_error
1$:
	cp a,#ADD_IDX 
	jreq 2$
	cp a,#SUB_IDX 
	jrne 4$ 
	cpl (NEG,sp)
2$:	
	_next_token
4$:
	cp a,#LITW_IDX 
	jrne 5$
	_get_word 
	jra 18$
5$:
	cp a,#LIT_IDX 
	jrne 6$
	call get_int24 
	jra 18$
6$:
	cp a,#VAR_IDX 
	jrne 7$
	_get_addr 
    jra 71$
7$:
	cp a,#ARRAY_IDX 
	jrne 8$
	call get_array_element
71$: ; put value in A:X
	ld a,(x)
	ldw x,(1,x)
	jra 18$
8$:
	cp a,#LABEL_IDX  
	jrne 9$
	ldw x,y 
	call skip_label
	ld a,(x)
	incw x  
	call search_name
	tnzw x 
	jrne 82$ 
	jp syntax_error
82$:
	call get_value ; in A:X 
	jra 18$
9$: 
	cp a,#LPAREN_IDX
	jrne 10$
	call expression
	_i24_push 
	ld a,#RPAREN_IDX 
	call expect
	_i24_pop 
	jra 18$ 
10$: ; must be a function 
	_call_code
18$: 
	tnz (NEG,sp)
	jreq 20$
	call neg_ax   
20$:
	_drop VSIZE
	ret


;-----------------------------------
; term ::= factor ['*'|'/'|'%' factor]* 
; output:
;   A:X    	term  
;-----------------------------------
	N1=1 ; 3 bytes 
	N2=N1+INT_SIZE ; 3 bytes  
	MULOP=N2+INT_SIZE ;1 bytes 
	VSIZE=7   
term:
	_vars VSIZE
; first factor 	
	call factor
	_i24_store N1 
term01:	 ; check for  operator '*'|'/'|'%' 
	_next_token
	ld (MULOP,sp),a
	cp a,#DIV_IDX 
	jrmi 0$ 
	cp a,#OP_ARITHM_LAST 
	jrule 1$ 
0$:	_unget_token 
	jra term_exit 
1$:	; got *|/|%
;second factor
	call factor
	_i24_store N2 
; select operation 	
	ld a,(MULOP,sp) 
	cp a,#MULT_IDX 
	jrne 3$
; '*' operator
	call mul24 
	jra 5$
3$: cp a,#DIV_IDX 
	jrne 4$ 
; '/' operator	
	call div24 
	jra 5$ 
4$: ; '%' operator
	call div24 
	_i24_fetch N2 
5$: 
	_i24_store N1 
	jra term01 
term_exit:
	_i24_fetch N1 
	_drop VSIZE 
	ret 

;-------------------------------
;  expr ::= term [['+'|'-'] term]*
;  result range {-16777215..16777215}
;  output:
;   A:X   expression    
;-------------------------------
	N1=1 ; 3 bytes 
	N2=N1+INT_SIZE ; 3 bytes  
	OP=N2+INT_SIZE ; 1 byte
	VSIZE=7 
expression:
	_vars VSIZE 
; first term 	
	call term
	_i24_store N1 
1$:	; operator '+'|'-'
	_next_token
	ld (OP,sp),a 
	cp a,#ADD_IDX 
	jreq 2$
	cp a,#SUB_IDX 
	jreq 2$ 
	_unget_token 
	jra 9$ 
2$: ; second term 
	call term
	_i24_store N2 
	ld a,(OP,sp)
	cp a,#ADD_IDX 
	jrne 4$
; '+' operator
	LD A,(N2,SP)
	ADDW X,(N1+1,SP)
	ADC A,(N1,SP)
	jra 5$ 
4$:	; '-' operator 
	LD A,(N1,SP)
	LDW X,(N1+1,SP)
	SUBW X,(N2+1,SP)
	SBC A,(N2,SP)
5$:
	_i24_store N1
	jra 1$
9$:
	_i24_fetch N1 
	_drop VSIZE 
	ret 

;---------------------------------------------
; rel ::= expr [rel_op expr]
; rel_op ::=  '=','<','>','>=','<=','<>','><'
;  relation return  integer , zero is false 
;  output:
;	 A:X		relation result   
;---------------------------------------------
  ; local variables
	N1=1 ; 3 bytes 
	N2=N1+INT_SIZE ; 3 bytes  
	REL_OP=N2+INT_SIZE  ; 1 byte  relational operator 
	VSIZE=7 ; bytes  
relation: 
	_vars VSIZE
	call expression
	_i24_store N1 
; expect rel_op or leave 
	_next_token 
	ld (REL_OP,sp),a 
	cp a,#REL_LE_IDX
	jrmi 1$
	cp a,#OP_REL_LAST 
	jrule 2$ 
1$:	_unget_token 
	jra 8$ 
2$:	; expect another expression
	call expression
	_i24_store N2 
	call cp24 
	tnz a 
	jrmi 4$
	jrne 5$
; i1==i2 
	ld a,(REL_OP,sp)
	cp a,#REL_LT_IDX 
	jrpl 7$ ; relation false 
	jra 6$  ; relation true 
4$: ; i1<i2
	ld a,(REL_OP,sp)
	cp a,#REL_LT_IDX 
	jreq 6$ ; relation true 
	cp a,#REL_LE_IDX 
	jreq 6$  ; relation true
	jra 54$
5$: ; i1>i2
	ld a,(REL_OP,sp)
	cp a,#REL_GT_IDX 
	jreq 6$ ; relation true 
	cp a,#REL_GE_IDX 
	jreq 6$ ; relation true 
54$:
	cp a,#REL_NE_IDX 
	jrne 7$ ; relation false 
6$: ; TRUE  ; relation true 
	LD A,#255
	LDW X,#0XFFFF
	JRA 9$ 
7$:	; FALSE 
	CLR A  ; A:X  result  
	JRA 9$ 
8$:
	_i24_fetch N1 
9$: 

	_drop VSIZE
	ret 

;-------------------------------------------
;  AND factor:  [NOT] relation
;  output:
;     A:X      boolean 
;-------------------------------------------
	NOT_OP=1
and_factor:
	push #0 
0$:	_next_token  
	cp a,#CMD_END 
	jrugt 1$
	jp syntax_error
1$:	cp a,#NOT_IDX  
	jrne 2$ 
	cpl (NOT_OP,sp)
	_next_token
	jra 4$ 
2$:	
	_unget_token 
4$:
	call relation 	
5$:	
	tnz (NOT_OP,sp)
	jreq 8$ 
	CPL A 
	CPLW X 
8$:
	_drop 1  
    ret 


;--------------------------------------------
;  AND operator as priority over OR||XOR 
;  format: and_factor [AND and_factor]*
;          
;  output:
;    A:X   result  
;--------------------------------------------
	B1=1 
	VSIZE=INT_SIZE 
and_cond:
	_vars VSIZE 
	call and_factor
	_i24_store B1 
1$: _next_token 
	cp a,#AND_IDX  
	jreq 3$  
	_unget_token 
	jra 9$ 
3$:	call and_factor  
	AND A,(B1,SP)
	RLWA X 
	AND A,(B1+1,SP)
	RLWA X 
	AND A,(B1+2,SP)
	RLWA X 
	_i24_store B1 
	jra 1$  
9$:	
	_i24_fetch B1 
	_drop VSIZE 
	ret 	 


;--------------------------------------------
; condition for IF and UNTIL 
; operators: OR,XOR 
; format:  and_cond [ OP and_cond ]* 
; output:
;    stack   value 
;--------------------------------------------
	B1=1 ; 3 bytes 
	B2=B1+INT_SIZE ; 3 bytes 
	OP=B2+INT_SIZE ; 1 bytes 
	VSIZE=7 
condition:
	_vars VSIZE 
	call and_cond
	_i24_store B1
1$:	_next_token 
	cp a,#OR_IDX  
	jreq 2$
	cp a,#XOR_IDX 
	jreq 2$ 
	_unget_token 
	jra 9$ 
2$:	ld (OP,sp),a ; boolean operator  
	call and_cond
	_i24_store B2
	ld a,(OP,sp)
	cp a,#XOR_IDX  
	jreq 5$ 
4$: ; B1 = B1 OR B2   
	ld a,(B1,sp)
	LDW X,(B1+1,SP)
	or a,(B2,SP)
	rlwa x 
	or a,(B2+1,SP)
	rlwa x 
	or a,(B2+2,SP) 
	rlwa x 
	jra 6$  
5$: ; B1 = B1 XOR B2 
	LD A,(B1,SP)
	LDW X,(B1+1,SP)
	XOR A,(B2,SP)
	RLWA X 
	XOR A,(B2+1,SP)
	RLWA X 
	XOR A,(B2+2,SP)
	RLWA X 
6$: 
	_i24_store B1 
	jra 1$ 
9$:	 
	_i24_fetch B1 ; result in A:X 
	_drop VSIZE
	ret 


;--------------------------------------------
; BASIC: HEX 
; select hexadecimal base for integer print
;---------------------------------------------
cmd_hex_base:
	mov base,#16 
	_next  

;--------------------------------------------
; BASIC: DEC 
; select decimal base for integer print
;---------------------------------------------
cmd_dec_base:
	mov base,#10
	_next 


;------------------------
; BASIC: FREE 
; return free size in RAM 
; output:
;   A:x		size 
;--------------------------
free: 
func_free:
	clr a 
	_ldxz end_free_ram
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
	_ldxz txtbgn     
	mov base,#16 
	call prt_i16
	ldw x,#PROG_SIZE 
	call puts 
	_ldxz txtend 
	subw x,txtbgn 
	mov base,#10 
	call prt_i16
	ldw x,#STR_BYTES 
	call puts  
	pop base 
	_next 




;------------------------
; BASIC: UBOUND  
; return array variable size 
; and set 'array_size' variable 
; output:
;   A:X 	array_size
;--------------------------
ubound: 
func_ubound:
	call free 
	ld a,#INT_SIZE 
	div x,a 
	ldw array_size,x
	clr a 
	ret 

;----------------------
; assign to a symbolic variable
;----------------------
	VAR_NAME=1  ; 2 bytes 
	NAME_LEN=VAR_NAME+2 ; 2 bytes 
	VALUE=NAME_LEN+2 ;3 bytes 
	YSAVE=VALUE+INT_SIZE ; 2 bytes 
	VSIZE=YSAVE+1 
let_dvar:
	_vars VSIZE 
	clr (NAME_LEN,sp)
	ldw x,y 
	call skip_label 
	ld a,(x)
	ld (NAME_LEN+1,sp),a 
	incw x 
	ldw (VAR_NAME,sp),x
	ld a,#REL_EQU_IDX 
	call expect 
dvar_assign: 	 
; dvar assignment 
	call condition
	_i24_store VALUE 
	ldw x,(VAR_NAME,sp) ; pointer to var name 
	ld a,(NAME_LEN+1,sp) ; name length 
	call search_name 
	tnzw x 
	jrne 2$
	jp syntax_error 
2$:	ld a,(x)
	jrpl 4$
	ld a,#ERR_READ_ONLY 
	jp tb_error 
4$:
	addw x,(NAME_LEN,sp)
	addw x,#2 
	ldw (YSAVE,sp),y 
	ldw y,x
	_i24_fetch VALUE
	ld (y),a 
	incw y 
	ldw (y),x
	ldw y,(YSAVE,sp)
9$: _drop VSIZE 	
	ret 

;-----------------------------
; BASIC: LET var=expr 
; variable assignement 
; output:
;-----------------------------
kword_let::
	_next_token 
	cp a,#VAR_IDX 
	jreq let_var
	cp a,#ARRAY_IDX 
	jreq  let_array
	cp a,#LABEL_IDX 
	jreq do_dvar
	jp syntax_error
do_dvar:
	call let_dvar 
	jra let_next_item
let_array:
	call get_array_element
	jra do_eval 
let_var:
	_get_addr	
do_eval:
	call let_eval 
let_next_item:	
	_next_token 
	cp a,#COMMA_IDX 
	jreq kword_let
	_unget_token 
	_next 

let_eval:
	pushw x 
	ld a,#REL_EQU_IDX
	call expect 
	call condition 
	pop ptr16 
	pop ptr8 
	ld [ptr16],a 
	inc ptr8 ; never overflow 
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
	and a,#NAME_MAX_LEN
	add a,#2 
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
eefree:
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
;  field | size 
;-------------------
;  rec_len | 1 
;  name | {2..15} string length 
;  zero | 1 end of name marker  
;  value | INT_SIZE  
;   .byte record length 
;         = strlen(name)+5 
;   .asciz name (variable length)
;   .int24 value (3 bytes )
; a constant record use 7+ bytes
; constants are saved in EEPROM  
; input:
;    A     label_length  
;    X     *name
; output:
;    X     address|0
; use:
;   A,Y, acc16 
;-------------------------
	NAMEPTR=1 ; target name pointer 
	WLKPTR=3   ; walking pointer in EEPROM||RAM 
	NLEN=5  ;  length of target name 
	VSIZE=6 
search_name:
	pushw y 
	_clrz acc16 
	_vars VSIZE
	clr (NLEN,sp)
	ld (NLEN+1,sp),a    
	ldw (NAMEPTR,sp),x
	ldw y,dvar_bgn
1$:	ldw (WLKPTR,sp),y
	cpw y, dvar_end
	jruge 7$ ; no match found 
	ld a,(y)
	and a,#NAME_MAX_LEN 
	cp a,(NLEN+1,sp)
	jrne 2$ 
	incw y 
	ldw x,(NAMEPTR,sp)
	call strcmp
	jreq 8$ ; match found 
2$: ; skip this one 	
	ldW Y,(WLKPTR,sp)
	ld a,(y)
	and a,#NAME_MAX_LEN
	_straz acc8 
	addw y,acc16 
	addw y,#REC_XTRA_BYTES
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
; share most of his code with kword_dim 
;--------------------------------------------
	VAR_NAME=1 
	LBL_LEN=VAR_NAME+2
	RONLY=LBL_LEN+2
	VALUE=RONLY+1
	YTEMP=VALUE+INT_SIZE 
	VSIZE=YTEMP+1 
kword_const:
	_vars VSIZE 
	ld a,#128 
	ld (RONLY,sp),a 
	clr (LBL_LEN,sp)
	jra kword_dim2 ; shared code with kword_dim  

;---------------------------------
; BASIC: DIM var_name [var_name]* 
; create named variables at end 
; of BASIC program. 
; These variables are initialized 
; to 0. 
; record format same ast CONST 
; but r/w because stored in RAM 
;---------------------------------
kword_dim:
kword_dim1:	
	_vars VSIZE
	clr (LBL_LEN,sp )
	clr (RONLY,sp)
kword_dim2: 
0$:	_next_token 
	cp a,#LABEL_IDX  
	jreq 1$ 
	jp syntax_error 
1$: 
	ldw x,y 
	ld a,(x)
	ld (LBL_LEN+1,sp),a 
	incw x 
	ldw (VAR_NAME,sp),x ; name pointer 
	call skip_label  
	ld a,(LBL_LEN+1,sp)
	ldw x,(VAR_NAME,sp) 
	call search_name  
	tnzw x 
	jreq 2$
	ld a,#ERR_DUPLICATE
	jp tb_error
2$:	
;check if enough space 
	call free 
	subw x,#REC_XTRA_BYTES
	cpw x,(LBL_LEN,sp)
	jruge 3$
	ld a,#ERR_MEM_FULL
	jp tb_error
3$:
	_ldxz dvar_end 
	ld a,(LBL_LEN+1,sp)
	or a,(RONLY,sp)
	ld (x),a 
	incw x 
	ldw (YTEMP,sp),y 
	ldw y,(VAR_NAME,sp)
	call strcpy
	addw x,(LBL_LEN,sp)
	incw x 
	clr (x)
	clr (1,x)
	clr (2,x)
	addw x,#INT_SIZE 
	_strxz dvar_end 
4$: ldw y,(YTEMP,sp)
	_next_token 
	cp a,#COMMA_IDX 
	jreq 0$ 
	cp a,#REL_EQU_IDX 
	jrne 8$
; initialize variable 
	call condition
	_i24_store VALUE  
5$: _ldxz dvar_end 
	subw x,#INT_SIZE 
	ldw (YTEMP,sp),y   
	ldw y,x 
	_i24_fetch VALUE 
	ld (y),a 
	incw y  
	ldw (y),x
	ldw y,(YTEMP,sp)   
	_next_token 
	cp a,#COMMA_IDX 
	jrne 8$ 
	jp kword_dim2 
8$:	
	_unget_token 	
	_drop VSIZE 
	call ubound 
	_next 


;;;;;;;;;;;;;;;;;;;;;;;;;;
; return program size 
;;;;;;;;;;;;;;;;;;;;;;;;;;
prog_size:
	_ldxz txtend 
	subw x,txtbgn 
	ret 

;----------------------------
; print program information 
;---------------------------
program_info: 
	push base 
	ldw x,#PROG_ADDR 
	call puts 
	_ldxz txtbgn 
	mov base,#16 
	call prt_i16
	mov base,#10  
	ldw x,#PROG_SIZE
	call puts 
	call prog_size 
	call prt_i16 
	ldw x,#STR_BYTES 
	call puts
	_ldxz txtbgn
	cpw x,#app 
	jrult 2$
	ldw x,#FLASH_MEM 
	jra 3$
2$: ldw x,#RAM_MEM 	 
3$:	call puts 
	ld a,#CR 
	call putc
	pop base 
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
	jrugt 1$
	jp cmd_line 
1$:
	 _vars VSIZE
	_ldxz txtbgn 
	ldw (LN_PTR,sp),x 
	ldw x,(x) 
	ldw (FIRST,sp),x ; list from first line 
	ldw x,#MAX_LINENO ; biggest line number 
	ldw (LAST,sp),x 
	_next_token
	tnz a 
	jreq print_listing 
	cp a,#SUB_IDX 
	jreq list_to
	decw y    
	call expect_integer 
	ldw (FIRST,sp),x	
	_next_token
	tnz a 
	jrne 2$ 
	ldw (LAST,sp),x  
	jra  print_listing 
2$: 
	cp a,#SUB_IDX  
	jreq 3$ 
	jp syntax_error
3$: _next_token 
	tnz a 
	jreq print_listing
	decw y	 
list_to: ; listing will stop at this line
    call expect_integer 
	ldw (LAST,sp),x
print_listing:
; skip lines smaller than FIRST 
	ldw y,(LN_PTR,sp)
	 _clrz acc16 
1$:	ldw x,y 
	ldw x,(x)
	cpw x,(FIRST,sp)
	jrpl 2$
	ld a,(2,y)
	_straz acc8
	addw y,acc16
	cpw y,txtend 
	jrpl list_exit 
	jra 1$
2$: ldw (LN_PTR,sp),y 	
list_loop:
	ldw x,(LN_PTR,sp)
	ldw line.addr,x 
	ld a,(2,x) 
	sub a,#LINE_HEADER_SIZE
	call prt_basic_line
	ldw x,(LN_PTR,sp)
	ld a,(2,x)
	_straz acc8
	_clrz acc16 
	addw x,acc16
	cpw x,txtend 
	jrpl list_exit
	ldw (LN_PTR,sp),x
	ldw x,(x)
	cpw x,(LAST,sp)  
	jrsle list_loop
list_exit:
	_drop VSIZE 
	call program_info
	jp cmd_line 


LINES_REJECTED: .asciz "WARNING: lines missing in this program.\n"

;--------------------------
; BASIC: EDIT label 
;  copy program in FLASH 
;  to RAM for edition 
;-------------------------
cmd_edit:
	call cmd_line_only
	ld a,#LABEL_IDX 
	call expect  
	pushw y
	call skip_label 
	popw x 
	pushw y 
	incw x 
	call search_program 
    jrne 1$ 
	ldw x,#ERR_NOT_FILE 
	jp tb_error 
1$: 
	ldw y,x ; file address 
	ldw x,(2,x) ; program size 
	addw x,#FILE_HEADER_SIZE  
	ldw acc16,x  ; bytes to copy 
	ldw x,#rsign ; destination address 
	call move  
	ldw x,#free_ram 
	ldw txtbgn,x 
	addw x,rsize  
	ldw txtend,x
	popw y  
	_next 

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
	_straz count 
	addw x,#LINE_HEADER_SIZE  
	ldw basicptr,x
    ldw y,x 
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
	_next_token	
.if 0 ; DEBUG
trap
.endif 
	cp a,#CMD_END 
	jrugt 0$
	_unget_token
	jra 8$
0$:	
	cp a,#QUOTE_IDX
	jreq 1$
	cp a,#BSLASH_IDX 
	jreq 2$ 
	cp a,#SCOL_IDX  
	jreq 4$
	cp a,#COMMA_IDX
	jreq 5$
	cp a,#CHAR_IDX 
	jreq 6$
	jra 7$ 
1$:	; print string 
	ldw x,y 
	call puts
	ldw y,x  
	jra reset_semicol
2$:	; print character 
	_get_char 
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
6$: ; appelle la foncton CHAR()
	_call_code 
	rrwa x 
	call putc 
	jra reset_semicol	 	    
7$:	
	_unget_token 
	call condition
	ld acc24,a 
	ldw acc16,x 
	call prt_acc24
	call space
	jp reset_semicol 
8$:
	tnz (SEMICOL,sp)
	jrne 9$
	ld a,#CR 
    call putc 
9$:	
	_drop VSIZE 
	_next

;----------------------
; 'save_context' and
; 'rest_context' must be 
; called at the same 
; call stack depth 
; i.e. SP must have the 
; same value at  
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
	_arg LNADR 1 
	_arg BPTR 3
save_context:
	ldw (BPTR,sp),y 
	_ldxz line.addr
	ldw (LNADR,sp),x 
	ret

;-----------------------
; restore previously saved 
; BASIC interpreter context 
; from stack 
;-------------------------
rest_context:
	ldw x,(LNADR,sp)
	ldw line.addr,x 
	ldw y,(BPTR,sp)
	ret



;------------------------------------------
; BASIC: INPUT [string]var[,[string]var]
; input value in variables 
; [string] optionally can be used as prompt 
;-----------------------------------------
	CX_LNADR=1
	CX_BPTR=3
	SKIP=5
	VSIZE=5
cmd_input_var:
;_tp 'I 
	_vars VSIZE 
input_loop:
	clr (SKIP,sp)
	_next_token 
	cp a,#QUOTE_IDX 
	jrne 1$
	ldw x,y  
	call puts 
	ldw y,x 
	cpl (SKIP,sp)
	_next_token 
1$: cp a,#VAR_IDX  
	jreq 2$ 
	jp syntax_error
2$:	_get_addr
	ldw ptr16,x 
	tnz (SKIP,sp)
	jrne 21$ 
	call var_name 
	call putc   
21$:
	ld a,#':
	call putc 
	call save_context 
;	_clrz count  
	call readln 
	ldw y,#tib 
	ld a,#SPACE 
	call skip 
	ldw x,y 
	call atoi24 
	ld [ptr16],a 
	_incz ptr8 
	ldw [ptr16],x 
	call rest_context
	_next_token 
	cp a,#COMMA_IDX
	jreq input_loop 
	_unget_token
	_drop VSIZE 
;_tp 'X 
	_next  

;---------------------
; BASIC: WAIT addr,mask[,xor_mask]
; read in loop 'addr'  
; apply & 'mask' to value 
; loop while result==0.  
; 'xor_mask' is used to 
; invert the wait logic.
; i.e. loop while not 0.
;---------------------
	XMASK=1 ; INT_SIZE  
	MASK=XMASK+INT_SIZE  
	ADDR=MASK+INT_SIZE 
	VSIZE= 3*INT_SIZE 
cmd_wait: 
	call arg_list 
	cp a,#2
	jruge 0$
	jp syntax_error 
0$:	cp a,#3
	jreq 1$
	push #0 ; XMASK=0 
	push #0 
	push #0 
1$: 
	ldw x,(ADDR+1,sp) ; 16 bits address
2$:	ld a,(x)
	and a,(MASK+2,sp)
	xor a,(XMASK+2,sp)
	jreq 2$ 
	_drop VSIZE 
	_next 

; table of power of 2 for {0..7}
power2: .byte 1,2,4,8,16,32,64,128

;---------------------
; BASIC: BSET addr,#bit
; set bit at 'addr' corresponding 
; correspond to macchine with same name 
; 2^^bit or [addr]
; arguments:
; 	addr 	memory address RAM|PERIPHERAL 
;   bit		{0..7}
; output:
;	none 
;--------------------------
	BIT=1 
	ADDR=BIT+INT_SIZE 
cmd_bit_set:
	call arg_list 
	cp a,#2	 
	jreq 1$ 
	jp syntax_error
1$: 
	ldw x,#power2
	addw x,(BIT+1,sp) 
	ld a,(x)
	ldw x,(ADDR+1,sp)
    or a,(x)
	ld (x),a 
	_drop 2*INT_SIZE 
	_next 

;---------------------
; BASIC: BRES addr,#bit 
; reset a bit at 'addr'  
; correspond to macchine with same name 
; ~2^^bit and [addr]
; arguments:
; 	addr 	memory address RAM|PERIPHERAL 
;   bit 	{0..7}  
; output:
;	none 
;--------------------------
	BIT=1 
	ADDR=BIT+INT_SIZE 
cmd_bit_reset:
	call arg_list 
	cp a,#2  
	jreq 1$ 
	jp syntax_error
1$:  
	ldw x,#power2
	addw x,(BIT+1,sp) 
	ld a,(x)
	cpl a 
	ldw x,(ADDR+1,sp)
	and a,(x)
	ld (x),a 
	_drop 2*INT_SIZE 
	_next 

;---------------------
; BASIC: BTOGL addr,bit 
; toggle bit at 'addr' corresponding 
; 2^^bit xor [addr]
; arguments:
; 	addr 	memory address RAM|PERIPHERAL 
;   bit	    bit to invert      
; output:
;	none 
;--------------------------
	BIT=1 
	ADDR=BIT+INT_SIZE 
cmd_bit_toggle:
	call arg_list 
	cp a,#2 
	jreq 1$ 
	jp syntax_error
1$: 
	ldw x,#power2
	addw x,(BIT+1,sp) 
	ld a,(x)
	ldw x,(ADDR+1,sp) 
	xor a,(x)
	ld (x),a 
	_drop 2*INT_SIZE 
	_next 

;---------------------
; BASIC: BTEST(addr,bit)
; return bit value at 'addr' 
; bit is in range {0..7}.
; arguments:
; 	addr 		memory address RAM|PERIPHERAL 
;   bit 	    bit position {0..7}  
; output:
;	A:X       0|1 bit value  
;--------------------------
	BIT=1 
	ADDR=BIT+INT_SIZE 
func_bit_test:
	call func_args 
	cp a,#2
	jreq 0$
	jp syntax_error
0$:	
	ldw x,#power2 
	addw x,(BIT+1,sp)
	ld a,(x)
	ldw x,(ADDR+1,sp)   
    and a,(x) 
	jreq 1$
	ld a,#1
1$:	 
	clrw x 
	rlwa x 
	_drop 2*INT_SIZE 
	ret 

;--------------------
; BASIC: POKE addr,byte
; put a byte at addr 
;--------------------
cmd_poke:
	call arg_list 
	cp a,#2
	jreq 1$
	jp syntax_error
1$:	
	_i24_fetch 4 ; address   
	ld a,(3,sp) ; byte to poke  
	ld (x),a 
	_drop 2*INT_SIZE 
	_next 

;-----------------------
; BASIC: PEEK(addr)
; get the byte at addr 
; input:
;	none 
; output:
;	X 		value 
;-----------------------
func_peek:
	call func_args
	cp a,#1 
	jreq 1$
	jp syntax_error
1$: _i24_pop ; address  
	_straz farptr 
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
kword_if: 
	call condition  
	tnz  a  
	jrne 9$
	tnzw x 
	jrne 9$
	jp kword_remark
9$:	_next 

;------------------------
; BASIC: FOR var=expr 
; set variable to expression 
; leave variable address 
; on stack and set
; FLOOP bit in 'flags'
;-----------------
	FSTEP=1  ; variable increment int24
	LIMIT=FSTEP+INT_SIZE ; loop limit, int24  
	CVAR=LIMIT+INT_SIZE   ; control variable 
	LN_ADDR=CVAR+2   ;  line.addr saved
	BPTR=LN_ADDR+2 ; basicptr saved
	VSIZE=BPTR+1  
kword_for: ; { -- var_addr }
	_vars VSIZE
	clr (FSTEP,sp)
	ldw x,#1 
	ldw (FSTEP+1,sp),x  
	ld a,#VAR_IDX 
	call expect
	_get_addr
	ldw (CVAR,sp),x  ; control variable 
	call let_eval 
	ld a,#TO_IDX 
	call expect 
;-----------------------------------
; BASIC: TO expr 
; second part of FOR loop initilization
; leave limit on stack and set 
; FTO bit in 'flags'
;-----------------------------------
kword_to: ; { var_addr -- var_addr limit step }
    call expression   
2$:
	ld (LIMIT,sp),a 
	ldw (LIMIT+1,sp),x
	_next_token 
	cp a,#STEP_IDX 
	jreq kword_step
	_unget_token
	jra store_loop_addr 

;----------------------------------
; BASIC: STEP expr 
; optional third par of FOR loop
; initialization. 	
;------------------------------------
kword_step: ; {var limit -- var limit step}
    call expression 
2$:	
	ld (FSTEP,sp),a 
	ldw (FSTEP+1,sp),x ; step
; leave loop back entry point on stack 
store_loop_addr:
	ldw (BPTR,sp),y 
	_ldxz line.addr 
	ldw (LN_ADDR,sp),x   
	_next 

;--------------------------------
; BASIC: NEXT var 
; FOR loop control 
; increment variable with step 
; and compare with limit 
; loop if threshold not crossed.
; else stack. 
;--------------------------------
	OFS=2 ; offset added by pushw y 
kword_next: ; {var limit step retl1 -- [var limit step ] }
; skip over variable address 
	addw y,#3 
	ldw x,(CVAR,sp)
	; increment variable 
	ld a,(x)
	ldw x,(1,x)  ; get var value 
	addw x,(FSTEP+1,sp) ; var+step 
	adc a,(FSTEP,sp)
	pushw y
	ldw y,(OFS+CVAR,sp)
	ld (y),a
	incw y 
	ldw (y),x
	popw y 
	subw x,(LIMIT+1,sp) 
	_strxz acc16 
	sbc a,(LIMIT,sp) 
	_straz acc24 
	or a,acc16 
	or a,acc8 
	jreq loop_back
	_ldaz acc16 
	xor a,(FSTEP,sp)
	jrpl loop_done 
loop_back:
	ldw y,(BPTR,sp)
	ldw x,(LN_ADDR,sp)
	ldw line.addr,x 
1$:	_next 
loop_done:
	; remove loop data from stack  
	_drop VSIZE 
	_next 

;----------------------------
; called by goto/gosub
; to get target line number 
; output:
;    x    line address 
;---------------------------
get_target_line:
	_next_token  
	cp a,#LITW_IDX
	jrne 1$
	_get_word 
	jra target01
1$:
	cp a,#LABEL_IDX 
	jreq search_target_symbol
	jp syntax_error
; the target is a line number 
; search it. 
target01: 
	tnzw x 
	jrpl 0$ 
	subw x,#0x8000
	addw x,txtbgn 
	ret
0$:	cpw x,[line.addr] 
	jrult 2$ ; search from txtbgn 
	jrugt 1$
	ldw x,line.addr
	ret   
1$:	cpl a  ; search from this line#
2$: 	
	call search_lineno 
	tnz a ; 0 if not found  
	jrne 3$ 
	ld a,#ERR_NO_LINE 
	jp tb_error 
3$:	; modify bytecode
	; replace line# by line.addr-txtbgn+0x8000
	pushw y
	pushw x   
	ldw x,y 
	subw x,#2 
	ldw y,(1,sp)
	subw y,txtbgn
	addw y,#0x8000
	ldw (x),y 
	popw x
	popw y  	
	ret 

;-----------------------------------
; the GOTO|GOSUB target is a symbol.
; output:
;    X    line address|0 
;------------------------------------
	; local variables 
	LBL_LEN=5
	LBL_PTR=3
	LN_ADDR=1
	VSIZE=5  
search_target_symbol:
	_vars VSIZE  
	ldw x,y 
	ld a,(x)
	ld (LBL_LEN,sp),a 
	incw x 
	ldw (LBL_PTR,sp), x
	call skip_label  
	ldw basicptr,y 
	_clrz acc16 
	ldw x,txtbgn
1$:
	ldw (LN_ADDR,sp),x 
	ld a,(LINE_HEADER_SIZE,x) ; first token on line 
	cp a,#LABEL_IDX 
	jreq 3$ 
2$:	
	ld a,(2,x); line length 
	_straz acc8 
	addw x,acc16 ;point to next line 
	cpw x,txtend 
	jrult 1$
	ld a,#ERR_BAD_VALUE
	jp tb_error 
3$: ; found a LABEL_IDX  
	ld a,(4,x) ; label length byte 
	cp a,(LBL_LEN,sp)
	jrne 2$ 
4$: ; same length compare with LBL_PTR
	addw x,#5 ; skip over label length byte 
	ldw y,(LBL_PTR,sp) ; target string 
	call strcmp
	jreq 5$
	ldw x,(LN_ADDR,sp)
	jra 2$ 
5$: ; target found 
	ldw x,(LN_ADDR,sp)
	_ldyz basicptr  
	_drop VSIZE  ; target string 
	ret


;--------------------------------
; BASIC: ON expr GOTO|GOSUB line# [,line#]*
; selective goto or gosub 
;--------------------------------
kword_on:
	call expression 
;_tp '9 	
; the selector is the element indice 
; in the list of arguments. {1..#elements} 
	ld a,xl ; keep only least byte 
	jrne 0$
	jp 9$ ; element # begin at 1. 
0$:	push a  ; selector  
	_next_token
	cp a,#GOTO_IDX 
	jreq 1$ 
	cp a,#GOSUB_IDX 
	jreq 1$ 
	jp syntax_error 
1$: 
	_code_addr 
	pop a   ; pop selector 
	pushw x ; save routine address 	
	push a  ; push selector  
2$: ; skip elements in list until selector==0 
	dec (1,sp)
	jreq 7$ 
; can be a line# or a label 
	_next_token 
	cp a,#LITW_IDX 
	jreq 3$
	cp a,#LABEL_IDX 
	jreq 5$
	jp syntax_error 
3$: ; got a line number 
	addw y,#2  ; skip word  
	jra 6$
5$: call skip_label ; skip over label 	
6$: ; if another element comma present 
	_next_token
; _tp 'B
	cp a,#COMMA_IDX 
	jreq 2$ 
; arg list exhausted, selector to big 
; continue execution on next line 
	_drop 3 ; drop selector and GOTO|GOSUB address 
	jra 9$
7$: ;at selected position  
; _tp 'C 
;trap 	
	_drop 1 ; discard selector
; here only the routine address 
; of GOTO|GOSUB is on stack 
; _tp 'D 
    call get_target_line
;_tp 'E 
	ldw ptr16,x 	
	popw x ; code address, GOTO||GOSUB 
	cpw x,#kword_goto 
	jrne 8$ 
;_tp 'F 
	_ldxz ptr16 
	jra jp_to_target
8$: 
; move to end of line, then gosub 
;_tp 'G 
	_ldyz line.addr 
	_clrz acc16 
	ld a,(2,y)
	_straz acc8 
	addw y,acc16 
	decw y ; point at EOL_IDX 
;_tp 'H 
	jra kword_gosub_2 ; target in ptr16 
9$: ; expr out of range skip to next line
	jp kword_remark 


;------------------------
; BASIC: GOTO line# 
; jump to line# 
; here cstack is 2 call deep from interpreter 
;------------------------
kword_goto:
kword_goto_1:
	call get_target_line
jp_to_target:
	ldw line.addr,x 
	addw x,#LINE_HEADER_SIZE
	ldw y,x   
	btjf flags,#FTRACE,9$ 
	call prt_line_no 
9$:	_next


;--------------------
; BASIC: GOSUB line#
; basic subroutine call
; actual line# and basicptr 
; are saved on stack
;--------------------
	RET_BPTR=1 ; basicptr return point 
	RET_LN_ADDR=3  ; line.addr return point 
	VSIZE=4 
kword_gosub:
kword_gosub_1:
	call get_target_line 
	ldw ptr16,x ; target line address 
kword_gosub_2: 
	_vars VSIZE  
; save BASIC subroutine return point.   
	ldw (RET_BPTR,sp),y 
	_ldxz line.addr 
	ldw (RET_LN_ADDR,sp),x
	_ldxz ptr16  
	jra jp_to_target

;------------------------
; BASIC: RETURN 
; exit from BASIC subroutine 
;------------------------
kword_return:
	ldw y,(RET_BPTR,sp) 
	ldw x,(RET_LN_ADDR,sp)
	ldw line.addr,x 
	_drop VSIZE 
	_next 

;----------------------------------
; BASIC: RUN [label]
; run BASIC program in RAM
;----------------------------------- 
cmd_run: 
.if 0 ; DEBUG 
call dump_prog
.endif 
	btjf flags,#FRUN,0$  
	clr a 
	_next 
0$: ; check for STOP condition 
	btjf flags,#FBREAK,1$
	call rest_context
	_drop CTXT_SIZE 
	bres flags,#FBREAK 
	bset flags,#FRUN 
	_next  
1$:	; check for label option 
	_next_token 
	cp a,#LABEL_IDX 
	jrne 3$
	pushw y
	call skip_label  
	popw x
	incw x 
	call search_program
	jrne 2$
	ld a,#ERR_NOT_FILE 
	jp tb_error 
2$: addw x,#FILE_HEADER_SIZE 
	ldw txtbgn,x 
	subw x,#2 
	ldw x,(x) ; program size 
	addw x,txtbgn 
	ldw txtend,x 
	jra run_it 	
3$: _unget_token 
	_ldxz txtbgn
	cpw x,txtend 
	jrmi run_it 
	ldw x,#err_no_prog
	call puts 
	_next 
run_it:	 
; initialize DIM variables pointers 
	_ldxz txtend 
	cpw x,#app_space
	jrult 1$
; program in FLASH 	
	ldw x,#free_ram
	ldw dvar_bgn,x
	ldw dvar_end,x 
	jra 2$  
1$: ; program in RAM 
	ldw dvar_bgn,x 	
	ldw dvar_end,x 	 
2$: call ubound 
	call clear_vars
; clear data pointer 
	clrw x 
	ldw data_ptr,x 
	ldw data_ptr,x 
; initialize BASIC pointer 
	_ldyz txtbgn 
	_stryz line.addr 
	addw y,#LINE_HEADER_SIZE
	bset flags,#FRUN 
	_next  


;----------------------
; BASIC: END
; end running program
;---------------------- 
	CHAIN_LN=1 
	CHAIN_BP=3
	CHAIN_TXTBGN=5
	CHAIN_TXTEND=7
	CHAIN_CNTX_SIZE=8  
kword_end: 
; check for chained program 
	tnz chain_level
	jreq 8$
; restore chain context 
	dec chain_level 
	ldw x,(CHAIN_LN,sp) ; chain saved in and count  
	ldw line.addr,x 
;	ld a,(2,x)
;	_straz count 
	ldw Y,(CHAIN_BP,sp) ; chain saved basicptr 
;	ldw basicptr,Y 
	ldw x,(CHAIN_TXTBGN,sp)
	ldw txtbgn,x 
	ldw x,(CHAIN_TXTEND,sp)
	ldw txtend,x 
	_drop CHAIN_CNTX_SIZE ; CHAIN saved data size  
	_next   
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
	_next_token 
	cp a,#VAR_IDX 
	jreq 0$
	jp syntax_error 
0$: _get_addr 
	ldw ptr16,x 
	call qgetc 
	jreq 2$
	call getc  
2$: clr [ptr16]
	_incz ptr8 
	clr [ptr16]
	_incz ptr8 
	ld [ptr16],a 
	_next 

;-----------------
; 1 Khz beep 
;-----------------
beep_1khz::
	pushw y 
	ldw x,#100
	ldw y,#1000
	call tone
	popw y
	ret 

;-----------------------
; BASIC: TONE expr1,expr2
; use TIMER2 channel 1
; to produce a tone 
; arguments:
;    expr1   frequency 
;    expr2   duration msec.
;---------------------------
	DURATION=1 
	FREQ=DURATION+INT_SIZE
	YSAVE=FREQ+INT_SIZE 
	VSIZE=2*INT_SIZE+2    
cmd_tone:
	pushw y
	call arg_list 
	cp a,#2 
	jreq 0$ 
	jp syntax_error
0$:  
	ldw (YSAVE,sp),y 
	_i24_fetch  FREQ 
	ldw y,x 
	_i24_fetch  DURATION 
	call tone  
	ldw y,(YSAVE,sp)
	_drop VSIZE 
	_next 

;---------------------
; input:
;   Y   frequency 
;   x   duration 
;---------------------
	N1=1
	N2=N1+INT_SIZE 
	VSIZE=2*INT_SIZE  
tone: 
	_vars VSIZE 
	_strxz timer
	bres flags,#FTIMER   
	clrw x 
	ld a,fmstr 
	rlwa x 
	_i24_store N1 
	clr a 
	ldw x,#15625 ; ftimer=fmstr*1e6/64
	_i24_store N2 
	call mul24
	_i24_store N1 
	clr a 
	ldw x,y 
	_i24_store N2 
	call div24 
	ld a,xh 
	ld TIM2_ARRH,a 
	ld a,xl 
	ld TIM2_ARRL,a 
; 50% duty cycle 
	srlw x  
	ld a,xh 
	ld TIM2_CCR1H,a 
	ld a,xl
	ld TIM2_CCR1L,a
	bset TIM2_CCER1,#TIM2_CCER1_CC1E
	bset TIM2_CR1,#TIM2_CR1_CEN
	bset TIM2_EGR,#TIM2_EGR_UG 	
1$: wfi 
	btjf flags,#FTIMER,1$
	bres TIM2_CCER1,#TIM2_CCER1_CC1E
	bres TIM2_CR1,#TIM2_CR1_CEN 
	_drop VSIZE 
	ret 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   TIMER1 low level routines  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;---------------------------
; TIMER setup 
; input:
;   X    period 
;   Y    clock divisor
;----------------------------
timer1_setup:
; enable TIMER1 peripheral clock 
	bset CLK_PCKENR1,#CLK_PCKENR1_TIM1
; set prescale value Ftmr=Fmaster/(psc+1)
	ld a,yh 
	ld TIM1_PSCRH,a 
	ld a,yl 
	ld TIM1_PSCRL,a 
; set timer period 
	ld a,xh 
	ld TIM1_ARRH,a 
	ld a,xl 
	ld TIM1_ARRL,a
; set all 4 channels as PWM mode 1
	ld a,#(6<<4)|(1<<3) ; OCxM=6|OCxPE=1   
	ldw x,#TIM1_CCMR1 
	ld (x),a ; channel 1 
	ld (1,x),a ; channel 2
	ld (2,x),a ; channel 3
	ld (3,x),a ; channel 4 
	ldw x,#TIM1_CCR1H 
; clear all CCRx registers
; no output pulses
	ld a,#8 
1$: clr (x)
	incw x 
	dec a 
	jrne 1$ 
; enable counter  
	bset TIM1_CR1,#TIM_CR1_CEN
	bset TIM1_EGR,#0
	bset TIM1_BKR,#7 ; master output enable   		
	ret 

;-------------------------
; set timer pwm channel 
; duty cycle value 
; input:
;   a    channel {1..4} 
;   x     value 
;------------------------ 
pwm_set_duty_cycle:
	pushw y 
	dec a 
	clrw y 
	ld yl,a 
	sllw y 	
	addw y,#TIM1_CCR1H
	ld a,xh 
	ld (y),a 
	ld a,xl 
	ld (1,y),a 
	popw y 
	ret 

;-----------------------------
; pwm_enable_channel 
; enable or disable channel 
; input:
;   a    channel # {1..4}
;   x    0 disable else enable 
;-----------------------------
pwm_enable_channel:
	pushw y 
	push #1 
	ldw y,#TIM1_CCER1 
	dec a 
	cp a,#2
	jrmi 1$ 
	incw y 
	sub a,#2
1$: tnz a 
	jreq 2$ 
	swap (1,sp)
2$: pop a 
	tnzw x 
	jrne 4$ 
	cpl a
	and a,(y)
	jra 9$ 
4$: 
	or a,(y)
9$:	
	ld (y),a
	popw y   
	ret 

;-----------------------------
; TIMER1 pwm cc interrupt 
; enable|disable
; input:
;    a   ch# {1..4}
;    x   0 disable else enable 
;-----------------------------
pwm_cc_ie::
	pushw y
	ldw y,#TIM1_IER
	push a 
	ld a,#1 
1$: sll a 
	dec (1,sp)
	jrne 1$ 
	_drop 1 
	tnzw x 
	jreq 2$ 
;enable 
	or a,(y)
	jra 9$ 
2$: ; disable 
	cpl a 
	and a,(y)
9$:
	ld (y),a 
	popw y 
	ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   servo motor control
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------
; BASIC: SERVO.CH.EN ch#,1|0
; enable 1 of 4 channel
; parameters:
;    ch#    channel number {1..4}
;    1|0    1 to enable | 0 to disable
;-----------------------
	ONOFF=1
	SERVO_CHAN=ONOFF+INT_SIZE 
	VSIZE=2*INT_SIZE 
cmd_servo_chan_enable:
	call arg_list 
	cp a,#2 
	jreq 1$
	jp syntax_error 
1$: ; enable|disable parameter 
	_i24_fetch ONOFF ; A:X = 1|0
	ld a,(SERVO_CHAN+2,SP) ;chan#
	_drop VSIZE 
	call pwm_enable_channel
	_next 

;------------------------
; BASIC: SERVO.EN 0|1 
; enable disable TIMER1 
; for servo-motor control 
; parameter:
;    0|1    0 disable | 1 enable 
;------------------------
cmd_servo_enable:
	ld a,#LITW_IDX 
	call expect 
	_get_word 
	tnzw x 
	jreq timer1_disable
; set TIMER1 pre-divisor to 8
; Ftimer=2Mhz 
	pushw y 
	ldw y,#7 
; Period=(x+1)/2e6=20msec
	ldw x,#39999 ; period 
	call timer1_setup
	popw y 
	_next 
timer1_disable:
; disable TIMER1 
	clr TIM1_CR1
	clr TIM1_IER  
	bres CLK_PCKENR1,#CLK_PCKENR1_TIM1 
	_next 


;------------------------
; BASIC: SERVO.POS ch#,pos 
; set servo-motor position
; parameters:
;    ch#    channel number {1..4}
;    pos    pulse width in usec. 
;-------------------------
	POS=1
	SERVO_CHAN=POS+INT_SIZE 
	VSIZE=2*INT_SIZE 
cmd_servo_position:
	call arg_list 
	cp a,#2
	jreq 1$
	jp syntax_error 
1$: 
	ld a,(SERVO_CHAN+2,sp)  ; ch# 
	ldw x,(POS+1,sp)
	call pwm_set_duty_cycle
; drop command parameters
	_drop VSIZE 
	_next 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  PWM control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;----------------------------
; BASIC: PWM.EN 0|[1,resolution] 
; parameters 
;   resolution   {8..16} bits 
;   0|1    0 disable, 1 enable 
;-------------------------------
	RESOL=1 
	ONOFF=RESOL+INT_SIZE  
	VSIZE=2*INT_SIZE 
cmd_pwm_enable:
	call arg_list 
	cp a,#1
	jrne 0$
	_i24_push ; to compensate missing RESOL.
	jra 3$ 
0$: 	 
	cp a,#2 
	jreq 2$ 
	jp syntax_error
1$: ld a,#ERR_BAD_VALUE
	jp tb_error
2$:
	_i24_fetch ONOFF 
	tnzw x 
	jrne 4$
3$:
	_drop VSIZE 
	jra timer1_disable 
4$:
	_i24_fetch RESOL 
	rrwa x ; a= resolition in bits 
	cp a,#8 
	jrmi 1$ 
	cp a,#17 
	jrpl 1$ 
	ldw x,#65535 ; longest period 
	push a 
	ld a,#16 
	sub a,(1,sp)
	_drop 1   
5$: ; X>>=A
	jreq 8$
	srlw x 
	dec a	
	jra 5$ 
8$:	pushw y 
	clrw y 
	call timer1_setup
	popw y  	
9$:	_drop VSIZE 
	_next 

;----------------------------------
; BASIC: PWM.CH.EN ch# , 1 | 0 
; parameters:
;   ch#     channel to enable {1..4}
;   0|1     0 disable, 1 enable 
;----------------------------------
	ONOFF=1 
	CH_NBR=ONOFF+INT_SIZE 
	VSIZE=2*INT_SIZE 
cmd_pwm_chan_enable:
	call arg_list 
	cp a,#2 
	jreq 1$ 
	jp syntax_error 
1$: ld a,(CH_NBR+2,SP)
	ldw x,(ONOFF+1,SP)
	_drop VSIZE
	call pwm_enable_channel 
	_next 

;----------------------------------
; BASIC:  PWM.OUT ch#,value 
; parameters:
;   ch#     channel number 
;   count    count of value to output {1..255} 
;----------------------------------
	VALUE=1
	CHANNEL=VALUE+INT_SIZE 	 
cmd_pwm_out: 
	call arg_list 
	cp a,#2
	jreq 1$  
	jp syntax_error 
1$: ; single value output 
	ld a,(CHANNEL+2,SP)
	ldw x,(VALUE+1,SP)
	call pwm_set_duty_cycle ; A=ch#, X=value 
	_drop 2*INT_SIZE 
	_next 


;---------------------------------
; BASIC: PWW.DONE ch# 
; check if PWM.OUT is completed 
; for this channel.
; parameter:
;   ch#    channel to check 
; return:
;    0|-1   FALSE|TRUE 
;--------------------------------
.if 0
func_pwm_done:
	call expect_int 
	pushw y 
	decw x 
	ld a,#3 
	mul x,a 
	addw x,#pwm_ch1_count
	clr a  
	clrw y 
	tnz (x)
	jreq 1$
	cpl a 
	cplw y 
1$: ldw x,y
	popw y 
	_next 
.endif 

;-------------------------------
; BASIC: ADCON 0|1 [,divisor]  
; disable/enanble ADC 
;-------------------------------
	DIVISOR=1
	ONOFF=DIVISOR+INT_SIZE  
	VSIZE=6  
cmd_power_adc:
	call arg_list 
	cp a,#2	
	jreq 1$
	cp a,#1 
	jreq 0$
	jp syntax_error
0$:	clr a 
	clrw x
	_i24_push   ; divisor  
1$: _i24_fetch ONOFF  
	tnzw x 
	jreq 2$ 
	_i24_fetch DIVISOR 
	ld a,xl
	and a,#7
	swap a 
	ld ADC_CR1,a
	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
	bset ADC_CR1,#ADC_CR1_ADON 
	_usec_dly 7 
	jra 3$
2$: ; turn off ADC 
	bres ADC_CR1,#ADC_CR1_ADON
	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
3$:	_drop VSIZE 
	_next 

;-----------------------------
; BASIC: ADCREAD (channel)
; read adc channel {0..5}
; output:
;   A:X  value 
;-----------------------------
func_analog_read:
	call func_args 
	cp a,#1 
	jreq 1$
	jp syntax_error
1$: _i24_pop 
	cpw x,#6 
	jrule 2$
	ld a,#ERR_BAD_VALUE
	jp tb_error 
2$: ld a,xl  
	ld ADC_CSR,a
	bset ADC_CR2,#ADC_CR2_ALIGN
	bset ADC_CR1,#ADC_CR1_ADON
	btjf ADC_CSR,#ADC_CSR_EOC,.
	ldw x,ADC_DRH 
	clr a 
	ret 

;-----------------------
; BASIC: DREAD(pin)
; Arduino pins 
; read state of a digital pin 
; pin# {0..15}
; output:
;    A:X      0|1 
;-------------------------
	PINNO=2
func_digital_read:
	call func_args
	cp a,#1
	jreq 1$
	jp syntax_error
1$: ldw x,(PINNO,sp) 
.if NUCLEO_8S208RB
	cpw x,#15 
.endif 	
.if NUCLEO_8S207K8 
	cpw x,#13 
.endif 	
	jrule 2$	
	ld a,#ERR_BAD_VALUE
	jp tb_error 
2$:
	call select_pin 
	ld (PINNO,sp),a
	ld a,(GPIO_IDR,x)
	clrw x 
	and a,(PINNO,sp)
	jreq 9$ 
	ld a,#1
	rlwa x 
9$:
	_drop INT_SIZE 
	ret 


;-----------------------
; BASIC: DWRITE pin,0|1
; Arduino pins 
; write to a digital pin 
; pin# {0..15}
;-------------------------
	PINVAL=1
	PINNO=PINVAL+INT_SIZE 
	VSIZE=2*INT_SIZE 
cmd_digital_write:
	call arg_list  
	cp a,#2 
	jreq 1$
	jp syntax_error
1$:
	ldw x,(PINNO+1,sp) 
.if NUCLEO_8S208RB	
	cpw x,#15 
.endif 
.if NUCLEO_8S207K8
	cpw x,#13
.endif 	
	jrule 2$
	ld a,#ERR_BAD_VALUE
	jp tb_error 
2$:	call select_pin 
    tnz (PINVAL+2,sp)
	jrne 5$
	cpl a 
	and a,(GPIO_ODR,x)
	jra 8$
5$: or a,(GPIO_ODR,x)
8$: ld (GPIO_ODR,x),a 
	_drop VSIZE 
	_next 


;-----------------------
; BASIC: STOP
; stop progam execution  
; without resetting pointers 
; the program is resumed
; with RUN 
;-------------------------
kword_stop:
	btjt flags,#FRUN,2$
	_next 
2$:	 
; create space on cstack to save context 
	ldw x,#break_point 
	call puts 
	_vars CTXT_SIZE ; context size 
	call save_context 
	bres flags,#FRUN 
	bset flags,#FBREAK
	jp cmd_line  
break_point: .asciz "\nbreak point, RUN to resume.\n"

;-----------------------
; BASIC: NEW
; from command line only 
; free program memory
; and clear variables 
;------------------------
cmd_new: 
	call cmd_line_only
0$:	_clrz flags 
	call clear_basic 
	_next 

;-----------------------------------
; BASIC: ERASE \E | \F | name 
;  options:
;     \E    erase EEPROM 
;     \F    erase all block in range from 
;  			'app_space' to FLASH end (0x27fff)
;   name    erase that program only  
;-----------------------------------
	LIMIT=1  ; 24 bits address 
	VSIZE = 3 
cmd_erase:
	call cmd_line_only
	_clrz farptr 
	_next_token
	cp a,#LABEL_IDX 
	jrne not_file
erase_program: 
	pushw y
	call skip_label 
	popw x 
	incw x 
	call search_program
	tnzw x 
	jreq 9$  ; not found 
	call erase_file  
9$:	_next 
not_file: 
	_vars VSIZE 
	cp a,#BSLASH_IDX 
	jreq 0$ 
	jp syntax_error
0$: _get_char 
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
	ld a,#FLASH_END>>16 
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
	jra 6$   
; this block is clean, next  
5$:	
	ld a,#'. 
	call putc 
6$:	ldw x,#BLOCK_SIZE
	call incr_farptr
; check limit, 24 bit substraction  	
	ld a,(LIMIT,sp)
	ldw x,(LIMIT+1,sp)
	subw x,farptr+1
	sbc a,farptr 	 
	jrsge 4$ 
9$: call clear_basic
	ldw x,(LIMIT+1,sp)
	cpw x,#EEPROM_END
	jrne 10$
	call eefree 
10$:
	_drop VSIZE 
	_next 
	
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
	pushw y 
	_vars VSIZE
	clr (COUNT,sp)
	call prog_size 
	jrne 0$
	_ldxz #NO_PROG 
	call puts  
	jp 9$ ; no program to save 
0$:	addw x,#FILE_HEADER_SIZE
	ldw (TOWRITE,sp),x ; program size
; to save it first line must be a label 
	_ldxz txtbgn
	ld a,(3,x) ; first bytecode on line 
	cp a,#LABEL_IDX 
	jreq 1$
	jp 8$ ; can't be saved, not labeled 	
1$:	; check if file already exist 
	addw x,#LINE_HEADER_SIZE+1 ; *label 
	call search_program 
	jreq 11$
	call erase_file 
11$:
	_clrz farptr 
	ldw x,(TOWRITE,sp)
	call search_fit
	tnzw x 
	jrne 2$
	ld a,#ERR_MEM_FULL
	jp tb_error 
2$: ; check if header bytes are zero's 
	ldw ptr16,x  
	ld a,(x)
	or a,(1,x)
	or a,(2,x)
	or a,(3,x)
	jreq 3$
	call erase_header ; preserve X and farptr 
3$: 
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
	subw x,#FILE_HEADER_SIZE 
	ldw (y),x
	addw y,#2   
	ld a,#(BLOCK_SIZE-4)
	cpw x,#(BLOCK_SIZE-4) 
	jrugt 4$
	ld a,xl 
4$:	ld (CNT_LO,sp),a   
	_ldxz txtbgn 
	ldw (XTEMP,sp),x 
5$: 
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
	jruge 6$ 
	ld a,xl 
6$:	ld (CNT_LO,sp),a 
	call clear_block_buffer 
	jra 5$ 
8$: ; no label can't save
	ldw x,#NO_LABEL 
	call puts 	
9$:	
	_drop VSIZE 
    popw y 
	clr(y)
	_next 

NO_PROG: .asciz "No program in RAM."

;---------------------
; BASIC: DIR 
; list programs saved 
; in flash 
;--------------------
	XTEMP=1 
cmd_dir:
	push base 
	call cmd_line_only
	ldw x,#app_space 
	pushw x 
1$: 
	_qsign 
	jrne 4$
	addw x,#4
	mov base,#16
	call prt_i16
	ld a,#SPACE 
	call putc 
	ldw x,(XTEMP,sp)
	ldw x,(2,x) ; program size 
	mov base,#10  
	call prt_i16 
	ldw x,#STR_BYTES
	call puts
	ld a,#', 
	call putc
	ldw x,(XTEMP,sp)
	addw x,#8 ; first token of program 
	call puts 
	ld a,#CR 
	call putc
	ldw x,(1,sp)
3$:	call skip_to_next
	ldw (1,sp),x 
	jra 1$
4$: ; check if it is an erased program 
	_is_erased 
	jreq 3$ 
8$: ; done 
	_drop 2 
	pop base 
	_next 

;;;;;;;;;;;;;;;;;;;;;;;;;
; check if farptr address 
; read only zone 
;;;;;;;;;;;;;;;;;;;;;;;;;
check_forbidden: 
	tnz farptr 
	jrne rw_zone 
; memory 0x8000..0xffff	
	_ldxz ptr16 
	cpw x,#app_space
	jruge rw_zone 
	cpw x,#OPTION_END  
	jrugt forbidden  
	cpw x,#OPTION_BASE  
	jruge rw_zone 
1$:	cpw x,#EEPROM_END 
	jrugt forbidden 
	cpw x,#EEPROM_BASE 
	jrult forbidden
	ret 
forbidden:
	ld a,#ERR_BAD_VALUE
	jp tb_error 
rw_zone:	
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
cmd_write:
	call expression
	_straz farptr 
	_strxz ptr16
	call check_forbidden 
1$:	
	_next_token 
	cp a,#COMMA_IDX 
	jreq 2$ 
	_unget_token
	jra 9$ ; no more data 
2$:	_next_token 
	cp a,#BSLASH_IDX 
	jreq 4$ 
	cp a,#QUOTE_IDX
	jreq 6$
	_unget_token 
	call expression
3$:
	ld a,xl 
	clrw x 
	call write_byte
	jra 1$ 
4$: ; write character 
	_get_char 
	clrw x 
	call write_byte 
	jra 1$ 
6$: ; write string 
	clrw x 
7$:	ld a,(y)
	jreq 8$ 
	incw y 
	call write_byte 
	jra 7$ 
8$:	incw y 
	jra 1$ 	
9$:
	_next 

;---------------------
; BASIC: \letter 
;---------------------
func_back_slash:
	_get_char 
	clrw x 
	rlwa x 
	ret   

;----------------------------
;BASIC: CHAR(expr)
; évaluate expression 
; and take the 7 least 
; bits as ASCII character
; output: 
; 	A:X ASCII code {0..127}
;-----------------------------
func_char:
	call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error
1$:	_i24_pop
	rrwa x 
	and a,#0x7f 
	rlwa x  
	ret 

;---------------------
; BASIC: ASC(string|char|char function)
; extract first character 
; of string argument 
; output:
;    A:X    int24 
;---------------------
func_ascii:
	ld a,#LPAREN_IDX
	call expect 
	_next_token 
	cp a,#QUOTE_IDX 
	jreq 1$
	cp a,#BSLASH_IDX 
	jreq 2$ 
	cp a,#CHAR_IDX  
	jreq 0$
	jp syntax_error
0$: ; 
	_call_code 
	jra 4$
1$: ; quoted string 
	ld a,(y)
	push a  
	call skip_string
	pop a  	
	jra 3$ 
2$: ; character 
	_get_char 
3$:	clrw x 
	rlwa x   
4$:	_i24_push  
5$:	ld a,#RPAREN_IDX 
	call expect
9$:	
	_i24_pop  
	ret 

;---------------------
;BASIC: KEY
; wait for a character 
; received from STDIN 
; input:
;	none 
; output:
;	a:x  character 
;---------------------
func_key:
	call getc 
	clrw x 
	rlwa x  
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
func_qkey:: 
	clrw x 
	_ldaz rx1_head
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
func_uflash:
	_clrz farptr 
	ldw x,#app_space  
	pushw x 
1$:	ldw ptr16,x 
	call scan_block
	tnz a  
	jreq 8$
	ldw x,(1,sp)
	addw x,#BLOCK_SIZE 
	ldw (1,sp),x 
	jrne 1$  
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
	F_ARG=1 
	F_ADR=F_ARG+INT_SIZE 
	VSIZE=2*INT_SIZE 
func_usr:
	call func_args 
	cp a,#2
	jreq 1$  
	jp syntax_error 
1$: 
	_i24_fetch F_ADR ; A:X addr 
	ldw ptr16,X 
	_i24_pop  ; arg 
    _drop INT_SIZE 
	call [ptr16]
	ret 


;------------------------------
; BASIC: BYE 
; halt mcu in its lowest power mode 
; wait for reset or external interrupt
; do a cold start on wakeup.
;------------------------------
cmd_bye:
	btjf UART_SR,#UART_SR_TC,.
	halt
	jp cold_start  

;----------------------------------
; BASIC: SLEEP 
; halt mcu until reset or external
; interrupt.
; Resume progam after SLEEP command
;----------------------------------
cmd_sleep:
	btjf UART_SR,#UART_SR_TC,.
	bset flags,#FSLEEP
	halt 
	_next  

;-------------------------------
; BASIC: PAUSE expr 
; suspend execution for n msec.
; input:
;	none
; output:
;	none 
;------------------------------
cmd_pause:
	call expression
	bres flags,#FTIMER 
	ldw timer,x
1$:	wfi 
	ldw x,timer 
	jrne 1$
	_next 

;------------------------------
; BASIC: AWU expr
; halt mcu for 'expr' milliseconds
; use Auto wakeup peripheral
; all oscillators stopped except LSI
; range: 1msec - 30.7 sec 
; input:
;  none
; output:
;  none:
;------------------------------
cmd_awu:
  btjf UART_SR,#UART_SR_TC,.
  btjt UART_SR,#UART_SR_RXNE,.
  call expression 
awu02:
  mov acc8,#1 
  cpw x,#30720
  jrule 0$ 
  ld a,#ERR_BAD_VALUE
  jp tb_error
0$:
  cpw x,#5120
  jrmi 1$ 
  mov acc8,#15 
; divisor is x/480
  ld a,#30
  div x,a
  ld a,#16
  div x,a 
  jra 4$
1$: 
  cpw x,#2048
  jrmi 2$ 
  mov acc8,#14
; divisor is x/80 
  ld a,#80
  div x,a 
  jra 4$   
2$:
  mov acc8,#7
3$:  
; while X > 64  divide by 2 and increment AWU_TBR 
  cpw x,#64 
  jrule 4$ 
  inc acc8  
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
  mov AWU_TBR,acc8 
  bset AWU_CSR,#AWU_CSR_AWUEN
  halt ; oscillator stopped 
.if HSI 
	btjf CLK_ICKR,#CLK_ICKR_HSIRDY,. 
.else 
	btjf CLK_ECKR,#CLK_ECKR_HSERDY,. 
.endif  
  _next  

;------------------------------
; BASIC: TICKS
; return msec ticks counter value 
; input:
; 	none 
; output:
;	A:X 	msec since reset 
;-------------------------------
func_ticks:
	_ldaz ticks 
	_ldxz ticks+1 
	ret 

;------------------------------
; BASIC: ABS(expr)
; return absolute value of expr.
; input:
;   none
; output:
;   A:X   positive int24 
;-------------------------------
func_abs:
	call func_args 
	cp a,#1 
	jreq 0$ 
	jp syntax_error
0$: 
	_i24_pop 
	tnz a 
	call neg_ax
1$:	ret 

;------------------------------
; BASIC: LSHIFT(expr1,expr2)
; logical shift left expr1 by 
; expr2 bits 
; output:
; 	A:x 	result 
;------------------------------
	SHIFT=1
	VALUE=SHIFT+INT_SIZE 
	YSAVE=VALUE+INT_SIZE
	VSIZE=YSAVE+1 
func_lshift:
	pushw y 
	call func_args
	cp a,#2 
	jreq 1$
	jp syntax_error
1$: ldw (YSAVE,sp),y
	_i24_fetch SHIFT 
	ldw y,x 
	_i24_fetch VALUE  
	tnzw Y 
	jreq 4$
2$:	rcf 
	rlcw x 
	rlc a 
	decw y 
	jrne 2$
4$: ldw y,(YSAVE,sp)
	_drop VSIZE 
	ret  

;------------------------------
; BASIC: RSHIFT(expr1,expr2)
; logical shift right expr1 by 
; expr2 bits.
; output:
;   A:X 		result 
;------------------------------
func_rshift:
	pushw y
	call func_args
	cp a,#2 
	jreq 1$
	jp syntax_error
1$: ldw (YSAVE,sp),y 
	_i24_fetch SHIFT  
    ldw y,x 
	_i24_fetch VALUE
	tnzw y
	jreq 4$
2$:	rcf 
	rrc a 
	rrcw x 
	decw y 
	jrne 2$
4$: ldw y,(YSAVE,sp)
	_drop VSIZE 
	ret 

;--------------------------
; BASIC: FCPU integer
; set CPU frequency 
;-------------------------- 
cmd_fcpu:
	ld a,#LITW_IDX 
	call expect 
    _get_word
	ld a,xl 
	and a,#7 
	ld CLK_CKDIVR,a 
	_next  

;-------------------------
; BASIC: CLOCK HSE|HSI [,Fmhz]
; Switch master clock to 
; internal or external oscillator 
; and specify frequency
; for HSI default to 16Mhz 
; for HSE frequency must be 
; specified in Mhz 
;--------------------------
	FMHZ=1
	CLK_SRC=FMHZ+INT_SIZE
cmd_clock: 
	call arg_list 
	tnz a 
	jrne 1$ 
	jp syntax_error 
1$: cp a,#2  
	jrmi 3$ 
	jreq 2$ 
	jp syntax_error 
2$: 
; frequency specified
	_i24_pop
	ld a,xl 
	ld (1,sp),a 
	_i24_pop
	cpw x,#CLK_SWR_HSE
	jreq 4$ 
3$:
	ld a,#16 ;always 16 for HSI 
4$: 
	swapw x ; A=fmstr, XH=HSI|HSE, XL=0  
	call clock_init 
	call uart_init
	call timer4_init
	_next 

;------------------------------
; BASIC: PMODE pin#, mode 
; Arduino pin. 
; define pin as input or output
; pin#: {0..15}
; mode: INPUT|OUTPUT  
;------------------------------
	PMODE=1
	PINNO=PMODE+INT_SIZE 
	VSIZE=2*INT_SIZE 
cmd_pin_mode:
	call arg_list 
	cp a,#2 
	jreq 0$
	jp syntax_error 
0$: 
	_i24_fetch PINNO ; Dx pin 
.if NUCLEO_8S208RB	
	cpw x,#15 
.endif 
.if NUCLEO_8S207K8
	cpw x,#13
.endif 	
	jrule 1$
	ld a,#ERR_BAD_VALUE
	jp tb_error 
1$:	call select_pin ; x=PORT base address, A=pin_mask speed
4$:	ld (PINNO,sp),a ; bit mask 
	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
	ld (GPIO_CR1,x),a 
	ld a,(PMODE+2,SP) 
	jrne 6$
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
	_next 

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
.if NUCLEO_8S208RB
	addw x,#arduino_to_8s208
.endif 
.if NUCLEO_8S207K8
addw x,#arduino_to_8s207
.endif 
	ldw x,(x)
	ld a,xl 
	push a 
	swapw x 
	ld a,#5 
	mul x,a 
	addw x,#GPIO_BASE 
	pop a 
	ret 
.if NUCLEO_8S208RB	
; translation from Arduino D0..D15 to NUCLEO_8S208RB 
arduino_to_8s208:
.byte 3,1<<6 ; D0 
.byte 3,1<<5 ; D1 
.byte 4,1<<0 ; D2 
.byte 2,1<<1 ; D3
.byte 6,1<<0 ; D4
.byte 2,1<<2 ; D5
.byte 2,1<<3 ; D6
.byte 3,1<<1 ; D7
.byte 3,1<<3 ; D8
.byte 2,1<<4 ; D9
.byte 4,1<<5 ; D10
.byte 2,1<<6 ; D11
.byte 2,1<<7 ; D12
.byte 2,1<<5 ; D13
.byte 4,1<<2 ; D14
.byte 4,1<<1 ; D15
.endif 

.if NUCLEO_8S207K8	
; translation from Arduino D0..D12 to NUCLEO_8S207K8
arduino_to_8s207:
.byte 3,1<<5 ; D0 
.byte 3,1<<6 ; D1 
.byte 3,1<<0 ; D2 
.byte 2,1<<1 ; D3
.byte 3,1<<2 ; D4
.byte 2,1<<2 ; D5
.byte 2,1<<3 ; D6
.byte 0,1<<1 ; D7
.byte 0,1<<2 ; D8
.byte 2,1<<4 ; D9
.byte 3,1<<4 ; D10
.byte 3,1<<3 ; D11
.byte 2,1<<7 ; D12
.byte 2,1<<5 ; D13 
.endif 


;---------------------------------
;  seedx:seedy= x:y ^ seedx:seedy
;  X:Y = seedx:seedy  
;---------------------------------
xor_seed32:
    ld a,xh 
    _xorz seedx 
    _straz seedx
    ld a,xl 
    _xorz seedx+1 
    _straz seedx+1 
    ld a,yh 
    _xorz seedy
    _straz seedy 
    ld a,yl 
    _xorz seedy+1 
    _straz seedy+1 
    _ldxz seedx  
    _ldyz seedy 
    ret 

;-----------------------------------
;   x:y= x:y << a 
;-----------------------------------
sll_xy_32: 
    sllw y 
    rlcw x
    dec a 
    jrne sll_xy_32 
    ret 

;-----------------------------------
;   x:y= x:y >> a 
;-----------------------------------
srl_xy_32: 
    srlw x 
    rrcw y 
    dec a 
    jrne srl_xy_32 
    ret 

;---------------------------------
; BASIC: RND(n)
; return integer [0..n-1] 
; ref: https://en.wikipedia.org/wiki/Xorshift
;
; 	x ^= x << 13;
;	x ^= x >> 17;
;	x ^= x << 5;
;
;---------------------------------
	N1=1
	N2=N1+INT_SIZE
	VSIZE=6
func_random:
	_vars INT_SIZE    
	call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error
1$:  
	TNZ (N1,SP) 
	JRPL 2$  
	ld a,#ERR_BAD_VALUE
	jp tb_error
2$:  
	_i24_fetch N1 
	_i24_store N2
	pushw y   
    _ldxz seedx
	_ldyz seedy  
	ld a,#13
    call sll_xy_32 
    call xor_seed32
    ld a,#17 
    call srl_xy_32
    call xor_seed32 
    ld a,#5 
    call sll_xy_32
    call xor_seed32
	popw y 
; return seedy_lo&0x7f:seedx modulo expr + 1 
	_ldaz seedy+1   
    and a,#0x7f 
	ld (N1,sp),a 
	_ldxz seedx 
	ldw (N1+1,sp),x 
	call div24 
	LD A,(N2,SP)
	LDW X,(N2+1,SP) ; remainder 
	addw x,#1 
	adc a,#0  
	_drop VSIZE 
	ret 

;---------------------------------
; BASIC: RANDOMIZE expr 
; intialize PRGN seed with expr 
; or with ticks variable value 
; if expr==0
;---------------------------------
cmd_randomize:
	call expression 
	pushw x 
	push a 
	or a,(2,sp)
	or a,(3,sp) 
	pop a 
	_drop 2 
	jrne 2$
	ld a,ticks 
	ldw x,ticks+1
2$:
	clr seedy 
	ld seedy+1,a 
	ldw seedx,x 
	_next 

;---------------------------------
; BASIC: WORDS 
; affiche la listes des mots du
; dictionnaire ainsi que le nombre
; de mots.
;---------------------------------
	COL_CNT=1 ; column counter 
	WCNT=2 ; count words printed 
	VSIZE=2 
cmd_words:
	call cmd_line_only
	pushw y
	_vars VSIZE
	ld a,#5 
	ld (COL_CNT,sp),a 
	clr (WCNT,sp)
.if DEBUG 	
	ldw y,#all_words+2
.else 
	ldw y,#kword_dict+2
.endif 
	clr acc16  
0$:	ldw x,y
	ld a,(x)
	incw x  	
	and a,#NAME_MAX_LEN
	ld acc8,a
.if DEBUG 	 	
	inc acc8 
	ld a,#'$
	call putc 
	ld a,([acc16],x)
	callr print_hex  
.endif 
	call puts 
	inc (WCNT,sp)
	dec (COL_CNT,sp)
	jreq 2$
	ld a,acc8
.if DEBUG 
	add a,#3
.endif 	  
	cp a,#8 
	jruge 1$    
	ld a,#TAB  
	call putc
1$:	ld a,#TAB 
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
	_next 
words_count_msg: .asciz " words in dictionary\n"

;------------------------------
; print byte  in hexadecimal 
; on console
; input:
;    A		byte to print
;------------------------------
print_hex::
	push a 
	swap a 
	call to_hex_char 
	call putc 
    ld a,(1,sp) 
	call to_hex_char
	call putc
	ld a,#SPACE 
	call putc 
	pop a 
	ret 

;-----------------------------
; BASIC: TIMER expr 
; initialize count down timer 
;-----------------------------
cmd_set_timer:
	call arg_list
	cp a,#1 
	jreq 1$
	jp syntax_error
1$: 
	_i24_pop  
	bres flags,#FTIMER  
	ldw timer,x
	_next 

;------------------------------
; BASIC: TIMEOUT 
; return state of timer 
; output:
;   A:X     0 not timeout 
;   A:X     -1 timeout 
;------------------------------
func_timeout:
	clr a 
	clrw x 
	btjf flags,#FTIMER,1$ 
	cpl a 
	cplw x 
1$:	ret 
 	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.if WANT_IWDG 
;-----------------------------------
; BASIC: IWDGEN expr1 
; enable independant watchdog timer
; expr1 is delay in multiple of 62.5µsec
; expr1 -> {1..16383}
;-----------------------------------
cmd_iwdg_enable:
	call arg_list
	cp a,#1 
	jreq 1$
	jp syntax_error 
1$: _i24_pop  
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
	_next 


;-----------------------------------
; BASIC: IWDGREF  
; refresh independant watchdog count down 
; timer before it reset MCU. 
;-----------------------------------
cmd_iwdg_refresh:
	mov IWDG_KR,#IWDG_KEY_REFRESH 
	_next 

.endif ; WANT_IWDG 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;-------------------------------------
; BASIC: LOG2(expr)
; return logarithm base 2 of expr 
; this is the position of most significant
; bit set. 
; input: 
; output:
;   A:X     int24 
;*********************************
func_log2:
	call func_args 
	cp a,#1 
	jreq 1$
	jp syntax_error 
1$: 
	_i24_pop    
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


;------------------------------
; BASIC: DO 
; initiate a DO ... UNTIL loop 
;------------------------------
	DOLP_ADR=1 
	DOLP_LN_ADDR=3
	VSIZE=4 
kword_do:
	_vars VSIZE 
	ldw (DOLP_ADR,sp),y
	_ldxz line.addr  
	ldw (DOLP_LN_ADDR,sp),x
	_next 

;--------------------------------
; BASIC: UNTIL expr 
; loop if exprssion is false 
; else terminate loop
;--------------------------------
kword_until: 
	call condition  
	tnz a 
	jrne 9$ 
	tnzw x 
	jrne 9$ 
	ldw y,(DOLP_ADR,sp)
;	ldw basicptr,y 
	ldw x,(DOLP_LN_ADDR,sp)
	ldw line.addr,x
	btjf flags,#FRUN,8$ 
;	ld a,(2,x)
;	_straz count  
8$:	_next 
9$:	; remove loop data from stack  
	_drop VSIZE
	_next 

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
const_hse:
	ldw x,#CLK_SWR_HSE
	clr a 
	ret 
const_hsi:
	ldw x,#CLK_SWR_HSI
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
const_pmode_output:
	clr a 
	ldw x,#OUTP
	ret 

;-------------------------
; BASIC: PINP 
;  constant for port mode
;  used by PMODE 
;  to set pin as input
;------------------------
const_pmode_input:
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
; a DATA line it skip over 
;---------------------------
kword_data:
	jp kword_remark

;------------------------------
; check if line is data line 
; if so set data_pointers 
; and return true 
; else move X to next line 
; and return false 
; input:
;    X     line addr 
; outpu:
;    A     0 not data 
;          1 data pointers set 
;    X     updated to next line addr 
;          if not data line 
;--------------------------------
is_data_line:
	ld a,(LINE_HEADER_SIZE,x)
	cp a,#DATA_IDX 
	jrne 1$
	_strxz data_line 
	addw x,#FIRST_DATA_ITEM
	_strxz data_ptr  
	ld a,#1 
	ret 
1$: clr acc16 
	ld a,(2,x)
	ld acc8,a 
	addw x,acc16
	clr a 
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
cmd_restore:
	clrw x 
	ldw data_line,x 
	ldw data_ptr,x 
	_next_token 
	cp a,#CMD_END 
	jrugt 0$ 
	_unget_token 
	_ldxz txtbgn 
	jra 4$ 
0$:	cp a,#LITW_IDX
	jreq 2$
1$: jp syntax_error 	 
2$:	_get_word 
	call search_lineno  
	tnz a  
	jreq data_error 
	call is_data_line
	tnz a 
	jrne 9$ 
	jreq data_error
4$:
; search first DATA line 	
5$:	
	cpw x,txtend
	jruge data_error 
	call is_data_line 
	tnz a 
	jreq 5$ 
9$:	_next  

data_error:	
    ld a,#ERR_NO_DATA 
	jp tb_error 


;---------------------------------
; BASIC: READ 
; return next data item | data error
; output:
;    A:X int24  
;---------------------------------
func_read_data:
read01:	
	ldw x,data_ptr
	ld a,(x)
	incw x 
	tnz a 
	jreq 4$ ; end of line
	cp a,#REM_IDX
	jreq 4$  
	cp a,#COMMA_IDX 
	jrne 1$ 
	ld a,(x)
	incw x 
1$: decw x 
	pushw y 
	ldw y,x
	call expression 
	_stryz data_ptr 
	popw y 
	ret 
	cp a,#LIT_IDX 
	jreq 2$
	cp a,#LITW_IDX 
	jreq 14$
	cp a,#LABEL_IDX
	jreq 12$
	jra data_error 
12$: ; LABEL should be symbolic constant  
	pushw y 
	decw x 
	ldw y,x 
	call factor
	_stryz data_ptr
	popw y 
	ret  
14$: ; word 
	clr a 
	_strxz data_ptr 	
	ldw x,(x)
	jra 24$
2$:	; int24  
	ld a,(x)
	incw x 
	_strxz data_ptr 
	ldw x,(x)
24$:
	pushw x 
	_ldxz data_ptr 
	addw x,#2 
	_strxz data_ptr
	popw x 
3$:
	ret 
4$: ; check if next line is DATA  
	_ldxz data_line
	ld a,(2,x)
	ld acc8,a
	clr acc16  
	addw x,acc16 
	call is_data_line 
	tnz a 
	jrne read01  
	jra data_error 


;-------------------------------
; BASIC: PAD 
; Return pad buffer address.
;------------------------------
const_pad_ref:
	ldw x,#pad 
	clr a
	ret 

;-------------------------------
; BASIC: CHAIN label
; Execute another program like it 
; is a sub-routine. When the 
; called program terminate 
; execution continue at caller 
; after CHAIN command. 
; if a line# is given, the 
; chained program start execution 
; at this line#.
;---------------------------------
	CHAIN_ADDR=1 
	CHAIN_LNADR=3
	CHAIN_BP=5
	CHAIN_TXTBGN=7 
	CHAIN_TXTEND=9 
	VSIZE=10
	DISCARD=2
cmd_chain:
	_vars VSIZE 
	clr (CHAIN_LN,sp) 
	clr (CHAIN_LN+1,sp)  
	ld a,#LABEL_IDX 
	call expect 
	pushw y 
	call skip_label
	popw x 
	incw x
	call search_program 
	tnzw x  
	jrne 1$ 
0$:	ld a,#ERR_BAD_VALUE
	jp tb_error 
1$: addw x,#FILE_HEADER_SIZE 
	ldw (CHAIN_ADDR,sp), x ; program addr 
; save chain context 
	_ldxz line.addr 
	ldw (CHAIN_LNADR,sp),x 
	ldw (CHAIN_BP,sp),y
	_ldxz txtbgn 
	ldw (CHAIN_TXTBGN,sp),x
	_ldxz txtend 
	ldw (CHAIN_TXTEND,sp),x  
; set chained program context 	
	ldw x,(CHAIN_ADDR,sp)
	ldw line.addr,x 
	ldw txtbgn,x 
	subw x,#2
	ldw x,(x)
	addw x,(CHAIN_ADDR,sp)
	ldw txtend,x  
	ldw y,(CHAIN_ADDR,sp)
	addw y,#LINE_HEADER_SIZE 
    _incz chain_level
	_drop DISCARD
	_next 


;-----------------------------
; BASIC TRACE 0|1 
; disable|enable line# trace 
;-----------------------------
cmd_trace:
	_next_token
	cp a,#LITW_IDX
	jreq 1$ 
	jp syntax_error 
1$: _get_word 
    tnzw x 
	jrne 2$ 
	bres flags,#FTRACE 
	_next 
2$: bset flags,#FTRACE 
	_next 

;------------------------------
; BASIC: REBOOT 
; reinitialize MCU 
;------------------------------
cmd_reboot:
	_swreset
	
;---------------------------------
; BASIC: BUFFER name, size 
; Create a byte buffer in 
; free RAM 
; 
; name: buffer name 
;
; size: in bytes 
;---------------------------------
	BNAME=1
	NLEN=BNAME+2
	BSIZE=NLEN+2 
	YSAVE=BSIZE+2
	VSIZE=YSAVE+1
cmd_alloc_buffer:
	_vars VSIZE
	clr (NLEN,sp)
	ld a,#LABEL_IDX 
	call expect  
	ldw x,y 
	call skip_label 
	ld a,(x)
	ld (NLEN+1,sp),a 
	incw x 
	ldw (BNAME,sp),x
	ld a,#COMMA_IDX 
	call expect 
	call expression 
1$: 
	ldw (BSIZE,sp),x 
	call free
	subw x,#REC_XTRA_BYTES
	subw x,(NLEN,sp)  
	cpw x,(BSIZE,sp)
	jruge 3$ 
	ld a,#ERR_MEM_FULL
	jp tb_error 
3$: ldw x,(NLEN,sp)
	ld a,xl
	or a,#128 ; this is a CONST that content buffer address  
	_ldxz dvar_end 
	ld (x),a 
	incw x 
	ldw (YSAVE,sp),y 
	ldw y,(BNAME,sp) ; +2 because we have pushed Y 
	call strcpy
	addw x,(NLEN,sp)
	incw x 
	_strxz ptr16 
	ldw y,(YSAVE,sp) 
; allocate buffer space at end of 
; free RAM  
	_ldxz end_free_ram 
	subw x,(BSIZE,sp)
	_strxz end_free_ram 
	clr [ptr16]
	_ldaz ptr8 
	add a,#1 
	_straz ptr8 
	jrnc 4$ 
	_incz ptr16 
4$:  
	ldw [ptr16],x 
5$: ; zero buffer 
	clr (x)
	incw x 
	dec (BSIZE,sp)
	jrne 5$
	_ldxz ptr16
	addw x,#2 
	ldw dvar_end,x 
	_drop VSIZE
	_next 


;------------------------------
;      dictionary 
; format:
;   link:   2 bytes 
;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
;   cmd_name: 16 byte max 
;   code_addr: 2 bytes 
;------------------------------
	.macro _dict_entry len,name,token_id 
	.word LINK  ; point to next name field 
	LINK=.  ; name field 
	.byte len  ; name length 
	.asciz name  ; name 
	.byte token_id   ; TOK_IDX 
	.endm 

	LINK=0
; respect alphabetic order for BASIC names from Z-A
; this sort order is for a cleaner WORDS cmd output. 	
dict_end:
	_dict_entry,3,"XOR",XOR_IDX ; xor operator
	_dict_entry,5,"WRITE",WRITE_IDX  
	_dict_entry,5,"WORDS",WORDS_IDX 
	_dict_entry 4,"WAIT",WAIT_IDX
	_dict_entry,3,"USR",USR_IDX
	_dict_entry,5,"UNTIL",UNTIL_IDX 
	_dict_entry,6,"UFLASH",UFLASH_IDX 
	_dict_entry,6,"UBOUND",UBOUND_IDX
	_dict_entry,5,"TRACE",TRACE_IDX
	_dict_entry,4,"TONE",TONE_IDX  
	_dict_entry,2,"TO",TO_IDX
	_dict_entry,5,"TIMER",TIMER_IDX
	_dict_entry,7,"TIMEOUT",TIMEOUT_IDX 
	_dict_entry,5,"TICKS",TICKS_IDX
	_dict_entry,4,"STOP",STOP_IDX
	_dict_entry,4,"STEP",STEP_IDX
	_dict_entry,6,"SPI.WR",SPIWR_IDX
	_dict_entry,7,"SPI.SEL",SPISEL_IDX
	_dict_entry,6,"SPI.RD",SPIRD_IDX 
	_dict_entry,6,"SPI.EN",SPIEN_IDX
	_dict_entry,5,"SLEEP",SLEEP_IDX
    _dict_entry,4,"SIZE",SIZE_IDX
	_dict_entry,9,"SERVO.POS",SERVO_POS_IDX
	_dict_entry,8,"SERVO.EN",SERVO_EN_IDX
	_dict_entry,11,"SERVO.CH.EN",SERVO_CHAN_EN_IDX
	_dict_entry,4,"SAVE",SAVE_IDX 
	_dict_entry 3,"RUN",RUN_IDX
	_dict_entry,6,"RSHIFT",RSHIFT_IDX
	_dict_entry,3,"RND",RND_IDX
	_dict_entry,6,"RETURN",RET_IDX
	_dict_entry,7,"RESTORE",REST_IDX 
	_dict_entry 3,"REM",REM_IDX
	_dict_entry,6,"REBOOT",RBT_IDX 
	_dict_entry,4,"READ",READ_IDX  
	_dict_entry,9,"RANDOMIZE",RNDMZ_IDX
	_dict_entry,7,"PWM.OUT",PWM_OUT_IDX 
	_dict_entry,6,"PWM.EN",PWM_EN_IDX
;	_dict_entry,8,"PWM.DONE",PWM_DONE_IDX 
	_dict_entry,9,"PWM.CH.EN",PWM_CHAN_EN_IDX 
	_dict_entry,5,"PORTI",PORTI_IDX 
	_dict_entry,5,"PORTG",PORTG_IDX 
	_dict_entry,5,"PORTF",PORTF_IDX
	_dict_entry,5,"PORTE",PORTE_IDX
	_dict_entry,5,"PORTD",PORTD_IDX
	_dict_entry,5,"PORTC",PORTC_IDX
	_dict_entry,5,"PORTB",PORTB_IDX
	_dict_entry,5,"PORTA",PORTA_IDX 
	_dict_entry 5,"PRINT",PRINT_IDX 
	_dict_entry,4,"POUT",POUT_IDX
	_dict_entry,4,"POKE",POKE_IDX 
	_dict_entry,5,"PMODE",PIN_MODE_IDX 
	_dict_entry,4,"PINP",PINP_IDX
	_dict_entry,4,"PEEK",PEEK_IDX 
	_dict_entry,5,"PAUSE",PAUSE_IDX 
	_dict_entry,3,"PAD",PAD_IDX 
	_dict_entry,2,"OR",OR_IDX ; OR operator 
	_dict_entry,2,"ON",ON_IDX
	_dict_entry,3,"ODR",ODR_IDX 
	_dict_entry,3,"NOT",NOT_IDX;NOT operator
	_dict_entry,4,"NEXT",NEXT_IDX 
	_dict_entry,3,"NEW",NEW_IDX
	_dict_entry,6,"LSHIFT",LSHIFT_IDX
	_dict_entry,4,"LOG2",LOG2_IDX
	_dict_entry 4,"LIST",LIST_IDX
	_dict_entry 3,"LET",LET_IDX
	_dict_entry,4,"KEY?",QKEY_IDX
	_dict_entry,3,"KEY",KEY_IDX
.if WANT_IWDG	
	_dict_entry,7,"IWDGREF",IWDGREF_IDX
	_dict_entry,6,"IWDGEN",IWDGEN_IDX
.endif 
	_dict_entry,5,"INPUT",INPUT_IDX 
	_dict_entry,2,"IF",IF_IDX 
	_dict_entry,3,"IDR",IDR_IDX 
	_dict_entry,9,"I2C.WRITE",I2C_WRITE_IDX
	_dict_entry,8,"I2C.READ",I2C_READ_IDX
	_dict_entry,8,"I2C.OPEN",I2C_OPEN_IDX
	_dict_entry,9,"I2C.CLOSE",I2C_CLOSE_IDX 
	_dict_entry,3,"HSI",HSI_IDX 
	_dict_entry,3,"HSE",HSE_IDX
	_dict_entry,3,"HEX",HEX_IDX 
	_dict_entry,4,"GOTO",GOTO_IDX  
	_dict_entry,5,"GOSUB",GOSUB_IDX 
	_dict_entry,3,"GET",GET_IDX 
	_dict_entry,4,"FREE",FREE_IDX 
	_dict_entry,3,"FOR",FOR_IDX 
	_dict_entry,4,"FCPU",FCPU_IDX 
	_dict_entry,5,"ERASE",ERASE_IDX  
	_dict_entry,3,"END",END_IDX 
	_dict_entry,6,"EEPROM",EEPROM_IDX   
	_dict_entry,6,"EEFREE",EEFREE_IDX 
	_dict_entry,4,"EDIT",EDIT_IDX 
	_dict_entry,6,"DWRITE",DWRITE_IDX
	_dict_entry,5,"DREAD",DREAD_IDX
	_dict_entry,2,"DO",DO_IDX
	_dict_entry,3,"DIR",DIR_IDX
	_dict_entry,3,"DIM",DIM_IDX  
	_dict_entry,3,"DEC",DEC_IDX
	_dict_entry,3,"DDR",DDR_IDX 
	_dict_entry,4,"DATA",DATA_IDX 
	_dict_entry,3,"CR2",CR2_IDX 
	_dict_entry,3,"CR1",CR1_IDX  
	_dict_entry,5,"CONST",CONST_IDX
.if NUCLEO_8S208RB+SB5_SHORT 
	_dict_entry,5,"CLOCK",CLOCK_IDX 
.endif 	
	_dict_entry,4,"CHAR",CHAR_IDX
	_dict_entry,5,"CHAIN",CHAIN_IDX 
	_dict_entry,3,"BYE",BYE_IDX 
	_dict_entry,6,"BUFFER",BUFFER_IDX 
	_dict_entry,5,"BTOGL",BTOGL_IDX
	_dict_entry,5,"BTEST",BTEST_IDX 
	_dict_entry,4,"BSET",BSET_IDX
	_dict_entry,4,"BRES",BRES_IDX
	_dict_entry,3,"AWU",AWU_IDX 
	_dict_entry,3,"ASC",ASC_IDX
	_dict_entry,3,"AND",AND_IDX ; AND operator 
	_dict_entry,7,"ADCREAD",ADCREAD_IDX
	_dict_entry,5,"ADCON",ADCON_IDX 
kword_dict::
	_dict_entry,3,"ABS",ABS_IDX 
; the following are not searched
; by compiler
	_dict_entry,1,"'",REM_IDX 
	_dict_entry,1,"?",PRINT_IDX 
	_dict_entry,2,"><",REL_NE_IDX
	_dict_entry,2,"<>",REL_NE_IDX
	_dict_entry,1,">",REL_GT_IDX
	_dict_entry,1,"<",REL_LT_IDX
	_dict_entry,2,">=",REL_GE_IDX
	_dict_entry,1,"=",REL_EQU_IDX 
	_dict_entry,2,"<=",REL_LE_IDX 
	_dict_entry,1,"*",MULT_IDX 
	_dict_entry,1,"%",MOD_IDX 
	_dict_entry,1,"/",DIV_IDX 
	_dict_entry,1,"-",SUB_IDX 
	_dict_entry,1,"+",ADD_IDX
	_dict_entry,1,"@",ARRAY_IDX 
	_dict_entry,1,'"',QUOTE_IDX
	_dict_entry,1,")",RPAREN_IDX 
	_dict_entry,1,"(",LPAREN_IDX 
	_dict_entry,1,^/";"/,SCOL_IDX
	_dict_entry,1,^/","/,COMMA_IDX 
all_words:
	_dict_entry,1,":",COLON_IDX 
