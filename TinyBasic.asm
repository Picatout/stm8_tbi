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
acc24:: .blkb 1 ; 24 bit accumulator upper-byte 
acc16:: .blkb 1 ; 16 bit accumulator, acc24 high-byte
acc8::  .blkb 1 ;  8 bit accumulator, acc24 low-byte  
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
rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
rx1_head:  .blkb 1 ; rx1_queue head pointer
rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
free_eeprom: .blkw 1 ; start address of free eeprom 


vars:: .blkw 26 ; BASIC variables A-Z, keep it as but last .
	.area BTXT (ABS)
	.org 0x7C  
; keep 'free_ram' as last variable 
; basic code compiled here. 
rsign: .blkw 1 ; "BC" 
rsize: .blkw 1 ; code size 	 
free_ram: ; from here RAM free for BASIC text 

	.area CODE 

;----------------------
; print token id && value
; input:
;   A     token id 
;   X     token value 
;---------------------
	BSAVE=1
	AREG=2
	XREG=3
	VSIZE=4
prt_tok:
	_vars VSIZE 
	ld (AREG,sp),a 
	ldw (XREG,sp),x 
	ld a, base
	ld (BSAVE,sp),a 
	mov base,#16  
	ldw x,#token_msg
	call puts 
	clrw x 
	ld a,(AREG,sp)
	ld xl,a 
	call print_int 
	ld a,#SPACE
	call putc 
	ldw x,(XREG,sp)
	call print_int 
	ld a,#CR 
	call putc 
	ld a,(BSAVE,sp)
	ld base,a 
	ld a,(AREG,sp)
	ldw x,(XREG,sp)
	_drop VSIZE 
	ret 
token_msg: .asciz "token: "


;---------------------
; display n bytes row 
; from memory.
; input:
;   A   bytes to print 
;	X   start address 
; output:
;   X   address after last shown  
;---------------------
	CNT=1 
	ADR=2 
	VSIZE=3 
show_row:
	tnz a 
	jrne 1$
	ret 
1$:	
	pushw x  
	push a 
	mov tab_width,#4 
	call print_int 
	ld a,#SPACE  
	call putc
row_loop:
	ldw x,(ADR,sp)
	ld a,(x)
	clrw x 
	ld xl,a 
	call print_int 
	ldw x,(ADR,sp)
	incw x 
	ldw (ADR,sp),x 
	dec (CNT,sp)
	jrne row_loop
	_drop VSIZE  		
	mov tab_width,#4
	ld a,#CR 
	call putc 
	ret 

;--------------------------
; print memory content 
; in hexadecimal format
;  input:
;    X    start address 
;    Y    count 
;--------------------------
	BCNT=1
	BASE=3
	TABW=4
	VSIZE=4   
hex_dump:
	push a 
	_vars VSIZE
	ld a,base
	ld (BASE,sp),a 
	mov base,#16
	ld a,tab_width 
	ld (TABW,sp),a
	ld a,#CR 
	call putc 
1$: ldw (BCNT,sp),y
	ld a,#16
	cpw y,#16
	jrpl 2$
	ld a,yl
2$: 	
	call show_row 
	ldw y,(BCNT,sp) 
	subw y,#16 
	cpw y,#1
	jrpl 1$
	ld a,(BASE,sp)
	ld base,a
	ld a,(TABW,sp)
	ld tab_width,a 
	_drop VSIZE
	pop a 
	ret 

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
;   A 		0|1 
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
	pushw y 
	ldw x,#vars 
	ldw y,#2*26 
1$:	clr (x)
	incw x 
	decw y 
	jrne 1$
	popw y 
	popw x 
	ret 

;-------------------------------------
;  program initialization entry point 
;-------------------------------------
	MAJOR=2
	MINOR=0 
software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
cold_start:
;set stack 
	ldw x,#STACK_EMPTY
	ldw sp,x   
; clear all ram 
0$: clr (x)
	decw x 
	jrne 0$
; activate pull up on all inputs 
	ld a,#255 
	ld PA_CR1,a 
	ld PB_CR1,a 
	ld PC_CR1,a 
	ld PD_CR1,a 
	ld PE_CR1,a 
	ld PF_CR1,a 
	ld PG_CR1,a 
	ld PI_CR1,a
; set LD2 pin as output 
    bset PC_CR1,#LED2_BIT
    bset PC_CR2,#LED2_BIT
    bset PC_DDR,#LED2_BIT
	bres PC_ODR,#LED2_BIT 
; disable schmitt triggers on Arduino CN4 analog inputs
	mov ADC_TDRL,0x3f
; disable peripherals clocks
;	clr CLK_PCKENR1 
;	clr CLK_PCKENR2
	clr AWU_TBR 
	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
; select internal clock no divisor: 16 Mhz 	
	ld a,#CLK_SWR_HSI 
	clrw x  
    call clock_init 
	call timer4_init
	call timer2_init
; UART1 at 115200 BAUD
	call uart1_init
; activate PE_4 (user button interrupt)
    bset PE_CR2,#USR_BTN_BIT 
; display system information
	ldw x,#software 
	call puts 
	ld a,#MAJOR 
	ld acc8,a 
	clrw x 
	ldw acc24,x
	clr tab_width  
	mov base, #10 
	call prti24 
	ld a,#'.
	call putc 
	ld a,#MINOR 
	ld acc8,a 
	clrw x 
	ldw acc24,x 
	call prti24
	ld a,#CR 
	call putc
	rim 
	inc seedy+1 
	inc seedx+1 
	call clear_basic
	call ubound 
	call beep_1khz  
2$:	
	call warm_init
; check for application in flash memory 
	ldw x,app_sign 
	cpw x,SIGNATURE 
	jreq run_app
	jp cmd_line
run_app:
; run application in FLASH|EEPROM 
	ldw x,app_size  
	pushw x 
	ldw x,#app 
	ldw txtbgn,x
	ldw basicptr,x 
	addw x,(1,sp) ; x+size 
	_drop 2 
	ldw txtend,x 
	ldw x,#RUNNING 
	call puts
	ldw x,basicptr    
	mov base,#16 
	call print_int
	mov base,#10  
	ldw x, basicptr 
	ld a,(2,x)
	ld count,a 
	mov in,#3 
	bset flags,#FRUN
	call ubound   
	jp interpreter  
    jra .  

RUNNING: .asciz "\nrunning application at address: " 

warm_init:
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
	call print_int
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
;;; test 
; ldw x,txtbgn 
; ldw y,#16 
; call hex_dump
;;; end test

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
	jrne 5$
	call skip_label
	jra interp_loop 
5$:	jp syntax_error 

; skip label at beginning of line 
skip_label:
	ld a,#4 
	add a,in 
	ld in,a 
	ret 
		
;--------------------------
; extract next token from
; token list 
; basicptr -> base address 
; in  -> offset in list array 
; output:
;   A 		token attribute
;   X 		token value if there is one
;----------------------------------------
next_token::
	clrw x 
	ld a,in 
; don't replace sub by "cp a,count" 
; if end of line must return with A=0   	
	sub a,count 
	jreq 9$ ; end of line 
0$: 
	mov in.saved,in ; in case "_unget_token" needed 
	ldw y,basicptr 
	addw y,in.w 
	ld a,(y)
	incw y   
	tnz a 
	jrmi 4$
	cp a,#TK_ARRAY
	jrpl 7$  ; no attribute for these
1$: ; 
	cp a,#TK_CHAR
	jrne 2$
	exg a,xl
	ld a,(y)
	exg a,xl  
	jra 6$ 
2$:	cp a,#TK_QSTR 
	jrne 7$
	ldw x,y 
; move pointer after string 
3$:	tnz (y)
	jreq 6$
	incw y 
	jra 3$
4$: 
	ldw x,y 
	ldw x,(x)
	cp a,#TK_INTGR
	jrpl 5$
	ldw x,(code_addr,x) 
5$:	incw y 
6$:	incw y 
7$:	subw y,basicptr 
	ldw in.w,y 
9$: 
	ret	

;-----------------------------------
; print a 16 bit integer 
; using variable 'base' as conversion
; format.
; input:
;   X       integer to print 
;   'base'    conversion base 
; output:
;   none 
;-----------------------------------
print_int:
	clr acc24 
	ldw acc16,x 
	btjf acc16,#7,prti24
	cpl acc24 
	
;------------------------------------
; print integer in acc24 
; input:
;	acc24 		integer to print 
;	'base' 		numerical base for conversion 
;   'tab_width' field width 
;  output:
;    A          string length
;------------------------------------
prti24:
    call itoa  ; conversion entier en  .asciz
	call right_align  
	push a 
	call puts
	pop a 
    ret	

;------------------------------------
; convert integer in acc24 to string
; input:
;   'base'	conversion base 
;	acc24	integer to convert
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
	decw x 
	ld a,#32
	ld (x),a
	inc (LEN,sp)
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

;-------------------------------------
; divide uint24_t by uint8_t
; used to convert uint24_t to string
; input:
;	acc24	dividend
;   A 		divisor
; output:
;   acc24	quotient
;   A		remainder
;------------------------------------- 
; offset  on sp of arguments and locals
	U8   = 1   ; divisor on stack
	VSIZE =1
divu24_8:
	pushw x ; save x
	push a 
	; ld dividend UU:MM bytes in X
	ld a, acc24
	ld xh,a
	ld a,acc24+1
	ld xl,a
	ld a,(U8,SP) ; divisor
	div x,a ; UU:MM/U8
	push a  ;save remainder
	ld a,xh
	ld acc24,a
	ld a,xl
	ld acc24+1,a
	pop a
	ld xh,a
	ld a,acc24+2
	ld xl,a
	ld a,(U8,sp) ; divisor
	div x,a  ; R:LL/U8
	ld (U8,sp),a ; save remainder
	ld a,xl
	ld acc24+2,a
	pop a
	popw x
	ret

;--------------------------------------
; unsigned multiply uint24_t by uint8_t
; use to convert numerical string to uint24_t
; input:
;	acc24	uint24_t 
;   A		uint8_t
; output:
;   acc24   A*acc24
;-------------------------------------
; local variables offset  on sp
	U8   = 3   ; A pushed on stack
	OVFL = 2  ; multiplicaton overflow low byte
	OVFH = 1  ; multiplication overflow high byte
	VSIZE = 3
mulu24_8:
	pushw x    ; save X
	; local variables
	push a     ; U8
	clrw x     ; initialize overflow to 0
	pushw x    ; multiplication overflow
; multiply low byte.
	ld a,acc24+2
	ld xl,a
	ld a,(U8,sp)
	mul x,a
	ld a,xl
	ld acc24+2,a
	ld a, xh
	ld (OVFL,sp),a
; multipy middle byte
	ld a,acc24+1
	ld xl,a
	ld a, (U8,sp)
	mul x,a
; add overflow to this partial product
	addw x,(OVFH,sp)
	ld a,xl
	ld acc24+1,a
	clr a
	adc a,#0
	ld (OVFH,sp),a
	ld a,xh
	ld (OVFL,sp),a
; multiply most signficant byte	
	ld a, acc24
	ld xl, a
	ld a, (U8,sp)
	mul x,a
	addw x, (OVFH,sp)
	ld a, xl
	ld acc24,a
    addw sp,#VSIZE
	popw x
	ret

;------------------------------------
;  two's complement acc24
;  input:
;		acc24 variable
;  output:
;		acc24 variable
;-------------------------------------
neg_acc24:
	cpl acc24+2
	cpl acc24+1
	cpl acc24
	ld a,#1
	add a,acc24+2
	ld acc24+2,a
	clr a
	adc a,acc24+1
	ld acc24+1,a 
	clr a 
	adc a,acc24 
	ld acc24,a 
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
;    x		.asciz to convert
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Arithmetic operators
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;debug support
DEBUG_PRT=1
.if DEBUG_PRT 
	REGA=1
	SAVEB=2
	REGX=3
	REGY=5
	ACC24=7
	VSIZE=9 
printxy:
	_vars VSIZE 
	ld (REGA,sp),a 
	ld a,base 
	ld (SAVEB,sp),a
	ldw (REGX,sp),x
	ldw (REGY,sp),y
	ldw x,acc24 
	ld a,acc8 
	ldw (ACC24,sp),x 
	ld (ACC24+2,sp),a 
	mov base,#16 
	clrw x 
	ld a,(REGA,sp)
	ld xl,a 
	call print_int
	ld a,#SPACE 
	call putc  
	ldw x,(REGX,sp)
	call print_int 
	ld a,#SPACE 
	call putc  
	ldw x,(REGY,sp)
	call print_int 
	ld a,#CR 
	call putc 
	ld a,(ACC24+2,sp)
	ldw x,(ACC24,sp)
	ldw acc24,x 
	ld acc8,a
	ld a,(SAVEB,sp)
	ld base,a 
	ld a,(REGA,sp)
	ldw x,(REGX,sp)
	ldw y,(REGY,sp)
	_drop VSIZE 
	ret 
.endif 


;--------------------------------------
;  multiply 2 uint16_t return uint32_t
;  input:
;     x       uint16_t 
;     y       uint16_t 
;  output:
;     x       product bits 15..0
;     y       product bits 31..16 
;---------------------------------------
		U1=1  ; uint16_t 
		DBL=3 ; uint32_t
		VSIZE=6
umstar:
	_vars VSIZE 
	ldw (U1,sp),x 
;initialize bits 31..16 of 
;product to zero 
	clr (DBL,sp)
	clr (DBL+1,sp)
; produc U1L*U2L 
	ld a,yl 
	mul x,a 
	ldw (DBL+2,sp),x
; product U1H*U2L 
	ld a,(U1,sp) ; xh 
	ldw x,y
	mul x,a 
	clr a 
	addw x,(DBL+1,sp) 
	clr a 
	adc a,(DBL,sp) 
	ld (DBL,sp),a ; bits 23..17 
	ldw (DBL+1,sp),x ; bits 15..0 
; product U1L*U2H
	swapw y 
	ldw x,y
	ld a,(U1+1,sp)
	mul x,a
	addw x,(DBL+1,sp)
	clr a 
	adc a,(DBL,sp)
	ld (DBL,sp),a 
	ldw (DBL+1,sp),x 
; product U1H*U2H 	
	ld a,(U1,sp)
	ldw x,y  
	mul x,a 
	addw x,(DBL,sp)
	ldw y,x 
	ldw x,(DBL+2,sp)
	_drop VSIZE 
	ret


;-------------------------------------
; multiply 2 integers
; input:
;  	x       n1 
;   y 		n2 
; output:
;	X        N1*N2 bits 15..0
;   Y        N1*N2 bits 31..16 
;-------------------------------------
	SIGN=1
	VSIZE=1
multiply:
	_vars VSIZE 
	clr (SIGN,sp)
	ld a,xh 
	and a,#0x80
	jrpl 1$
	cpl (SIGN,sp)
	negw x 
1$:	
	ld a,yh
	and a,#0x80  
	jrpl 2$ 
	cpl (SIGN,sp)
	negw y 
2$:	
	call umstar
	ld a,(SIGN,sp)
	jreq 3$
	call dneg 
3$:	
	_drop VSIZE 
	ret

;--------------------------------------
; divide uint32_t/uint16_t
; return:  quotient and remainder 
; quotient expected to be uint16_t 
; input:
;   DBLDIVDND    on stack 
;   X            divisor 
; output:
;   X            quotient 
;   Y            remainder 
;---------------------------------------
	VSIZE=3
	_argofs VSIZE 
	_arg DBLDIVDND 1
	; local variables 
	DIVISOR=1 
	CNTR=3 
udiv32_16:
	_vars VSIZE 
	ldw (DIVISOR,sp),x	; save divisor 
	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
	ldw y,(DBLDIVDND,sp) ; bits 31..16
	tnzw y
	jrne long_division 
	ldw y,(DIVISOR,sp)
	divw x,y
	_drop VSIZE 
	ret
long_division:
	exgw x,y ; hi in x, lo in y 
	ld a,#17 
	ld (CNTR,sp),a
1$:
	cpw x,(DIVISOR,sp)
	jrmi 2$
	subw x,(DIVISOR,sp)
2$:	ccf 
	rlcw y 
	rlcw x 
	dec (CNTR,sp)
	jrne 1$
	exgw x,y 
	_drop VSIZE 
	ret

;-----------------------------
; negate double int.
; input:
;   x     bits 15..0
;   y     bits 31..16
; output: 
;   x     bits 15..0
;   y     bits 31..16
;-----------------------------
dneg:
	cplw x 
	cplw y 
	addw x,#1 
	jrnc 1$
	incw y 
1$: ret 


;--------------------------------
; sign extend single to double
; input:
;   x    int16_t
; output:
;   x    int32_t bits 15..0
;   y    int32_t bits 31..16
;--------------------------------
dbl_sign_extend:
	clrw y
	ld a,xh 
	and a,#0x80 
	jreq 1$
	cplw y
1$: ret 	


;----------------------------------
;  euclidian divide dbl/n1 
;  ref: https://en.wikipedia.org/wiki/Euclidean_division
; input:
;    dbl    int32_t on stack 
;    x 		n1   int16_t  disivor  
; output:
;    X      dbl/x  int16_t 
;    Y      remainder int16_t 
;----------------------------------
	VSIZE=8
	_argofs VSIZE 
	_arg DIVDNDHI 1 
	_arg DIVDNDLO 3
	; local variables
	DBLHI=1
	DBLLO=3 
	SDIVSR=5 ; sign divisor
	SQUOT=6 ; sign dividend 
	DIVISR=7 ; divisor 
div32_16:
	_vars VSIZE 
	clr (SDIVSR,sp)
	clr (SQUOT,sp)
; copy arguments 
	ldw y,(DIVDNDHI,sp)
	ldw (DBLHI,sp),y
	ldw y,(DIVDNDLO,sp)
	ldw (DBLLO,sp),y 
; check for 0 divisor
	tnzw x 
    jrne 0$
	ld a,#ERR_DIV0 
	jp tb_error 
; check divisor sign 	
0$:	ld a,xh 
	and a,#0x80 
	jreq 1$
	cpl (SDIVSR,sp)
	cpl (SQUOT,sp)
	negw x
1$:	ldw (DIVISR,sp),x
; check dividend sign 	 
 	ld a,(DBLHI,sp) 
	and a,#0x80 
	jreq 2$ 
	cpl (SQUOT,sp)
	ldw x,(DBLLO,sp)
	ldw y,(DBLHI,sp)
	call dneg 
	ldw (DBLLO,sp),x 
	ldw (DBLHI,sp),y 
2$:	ldw x,(DIVISR,sp)
	call udiv32_16
	tnzw y 
	jreq 3$ 
; x=quotient 
; y=remainder 
; if SDIVSR XOR SQUOT increment quotient and remainder.
	ld a,(SQUOT,sp)
	xor a,(SDIVSR,sp)
	jreq 3$
	incw x 
	ldw acc16,y 
	ldw y,(DIVISR,sp)
	subw y,acc16
; sign quotient
3$:	ld a,(SQUOT,sp)
	jreq 4$
	negw x 
4$:	
	_drop VSIZE 
	ret 



;----------------------------------
; division x/y 
; input:
;    X       dividend
;    Y       divisor 
; output:
;    X       quotient
;    Y       remainder 
;-----------------------------------
	VSIZE=4 
	; local variables 
	DBLHI=1
	DBLLO=3
divide: 
	_vars VSIZE 
	ldw acc16,y
	call dbl_sign_extend
	ldw (DBLLO,sp),x 
	ldw (DBLHI,sp),y 
	ldw x,acc16 
	call div32_16 
	_drop VSIZE 
	ret


;----------------------------------
;  remainder resulting from euclidian 
;  division of x/y 
; input:
;   x   	dividend int16_t 
;   y 		divisor int16_t
; output:
;   X       n1%n2 
;----------------------------------
modulo:
	call divide
	ldw x,y 
	ret 

;----------------------------------
; BASIC: MULDIV(expr1,expr2,expr3)
; return expr1*expr2/expr3 
; product result is int32_t and 
; divisiont is int32_t/int16_t
;----------------------------------
	DBL_SIZE=4 
muldiv:
	call func_args 
	cp a,#3 
	jreq 1$
	jp syntax_error
1$: 
	ldw x,(5,sp) ; expr1
	ldw y,(3,sp) ; expr2
	call multiply 
	ldw (5,sp),x  ;int32_t 15..0
	ldw (3,sp),y  ;int32_t 31..16
	popw x        ; expr3 
	call div32_16 ; int32_t/expr3 
	_drop DBL_SIZE
	ret 


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
; arg_list::=  rel[','rel]*
; all arguments are of integer type
; and pushed on stack 
; input:
;   none
; output:
;   stack{n}   arguments pushed on stack
;   A 	number of arguments pushed on stack  
;--------------------------------
arg_list:
	push #0  
1$: call relation
	cp a,#TK_NONE 
	jreq 5$
	cp a,#TK_INTGR
	jrne 4$
3$: 
; swap return address with argument
	pop a ; arg_count
	popw y ; return address 
	pushw x ; new argument 
	pushw y 
    inc a
	push a 
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
;   A 		TK_INTGR
;	X 		element address 
;----------------------
get_array_element:
	call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error
1$: popw x 
	; check for bounds 
	cpw x,array_size 
	jrule 3$
; bounds {1..array_size}	
2$: ld a,#ERR_BAD_VALUE 
	jp tb_error 
3$: tnzw  x
	jreq 2$ 
	sllw x 
	pushw x 
	ldw x,#tib
	subw x,(1,sp)
	_drop 2   
	ld a,#TK_INTGR
	ret 


;***********************************
;   expression parse,execute 
;***********************************
;-----------------------------------
; factor ::= ['+'|'-'|e]  var | @ |
;			 integer | function |
;			 '('relation')' 
; output:
;   A    token attribute 
;   X 	 integer
; ---------------------------------
	NEG=1
	VSIZE=1
factor:
	_vars VSIZE 
	call next_token
	cp a,#CMD_END  
	jrult 16$
1$:	ld (NEG,sp),a 
	and a,#TK_GRP_MASK
	cp a,#TK_GRP_ADD 
	jreq 2$
	ld a,(NEG,sp)
	jra 4$  
2$:	
	call next_token 
4$:	
	cp a,#TK_IFUNC 
	jrne 5$ 
	call (x) 
	jra 18$ 
5$:
	cp a,#TK_INTGR
	jrne 6$
	jra 18$
6$:
	cp a,#TK_ARRAY
	jrne 10$
	call get_array_element
	ldw x,(x)
	jra 18$ 
10$:
	cp a,#TK_VAR 
	jrne 12$
	ldw x,(x)
	jra 18$
12$:			
	cp a,#TK_LPAREN
	jrne 16$
	call relation
	pushw x 
	ld a,#TK_RPAREN 
	call expect
	popw x 
	jra 18$	
16$:
	tnz a 
	jreq 20$ 
	_unget_token
	clr a 
	jra 20$ 
18$: 
	ld a,#TK_MINUS 
	cp a,(NEG,sp)
	jrne 19$
	negw x
19$:
	ld a,#TK_INTGR
20$:
	_drop VSIZE
	ret

;-----------------------------------
; term ::= factor [['*'|'/'|'%'] factor]* 
; output:
;   A    	token attribute 
;	X		integer
;-----------------------------------
	N1=1   ; int16_t
	MULOP=3
	VSIZE=3
term:
	_vars VSIZE
	call factor
	tnz a 
	jreq term_exit 
term01:	 ; check for  operator 
	ldw (N1,sp),x  ; save first factor 
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
2$:	ldw y,x 
	ldw x,(N1,sp)
	ld a,(MULOP,sp) 
	cp a,#TK_MULT 
	jrne 3$
	call multiply 
	jra term01
3$: cp a,#TK_DIV 
	jrne 4$ 
	call divide 
	jra term01 
4$: call modulo
	jra term01 
8$: ld a,(MULOP,sp)
	jreq 9$ 
	_unget_token
9$: ldw x,(N1,sp)
	ld a,#TK_INTGR 	
term_exit:
	_drop VSIZE 
	ret 

;-------------------------------
;  expr ::= term [['+'|'-'] term]*
;  result range {-32768..32767}
;  output:
;   A    token attribute 
;   X	 integer   
;-------------------------------
	N1=1
	N2=3 
	OP=5 
	VSIZE=5 
expression:
	_vars VSIZE 
	call term
	tnz a 
	jreq expr_exit 
1$:	ldw (N1,sp),x 
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
3$:	ldw (N2,sp),x 
	ldw x,(N1,sp)
	ld a,(OP,sp)
	cp a,#TK_PLUS 
	jrne 4$
	addw x,(N2,sp)
	jra 1$ 
4$:	subw x,(N2,sp)
	jra 1$
8$: ld a,(OP,sp)
	jreq 9$ 
	_unget_token	
9$: ldw x,(N1,sp)
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
;	 X		integer 
;---------------------------------------------
	N1=1
	RELOP=3
	VSIZE=3 
relation: 
	_vars VSIZE
	call expression
	tnz a 
	jreq rel_exit
	ldw (N1,sp),x 
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
3$:	ldw acc16,x 
	ldw x,(N1,sp) 
	subw x,acc16
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
	tnz a 
	jreq 10$
	incw x 
	jra 10$  	
8$: ld a,(RELOP,sp)
	jreq 9$
	_unget_token
9$: 
	ldw x,(N1,sp)
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
show:
	ldw x,#cstk_prompt
	call puts 
	ldw x,sp 
	addw x,#3 ; ignore return address
	ldw y,#RAM_SIZE  
	ldw acc16,x 
	subw y,acc16
	call hex_dump
	clr a 
	ret

cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"


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
;   A 		TK_INTGR
;   X 	    size integer
;--------------------------
free:
	ldw x,#tib 
	ldw y,txtbgn 
	cpw y,#app_space
	jrult 1$
	subw x,#free_ram 
	jra 2$ 
1$:	
	subw x,txtend 
2$:	ld a,#TK_INTGR
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
	call print_int
	pop base 
	ldw x,#PROG_SIZE 
	call puts 
	ldw x,txtend 
	subw x,txtbgn 
	call print_int
	ldw x,#STR_BYTES 
	call puts  
	ret 


PROG_ADDR: .asciz "program address: "
PROG_SIZE: .asciz "program size: "
STR_BYTES: .asciz "bytes\n" 

;------------------------
; BASIC: UBOUND  
; return array variable size 
; output:
;   A 		TK_INTGR
;   X 	    array size 
;--------------------------
ubound:
	call free 
	srlw x 
	ldw array_size,x
	ld a,#TK_INTGR
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
let_var:
	pushw x  
	call next_token 
	cp a,#TK_EQUAL
	jreq 1$
	jp syntax_error
1$:	
	call relation   
	cp a,#TK_INTGR 
	jreq 2$
	jp syntax_error
2$:	
	ldw y,x 
	popw x   
	ldw (x),y   
	ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;
; return program size 
;;;;;;;;;;;;;;;;;;;;;;;;;;
prog_size:
	ldw x,txtend 
	subw x,txtbgn 
	ret 

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
	ldw x,txtbgn 
	cpw x,txtend 
	jrmi 1$
	ret 
1$:	
	ldw x,#PROG_SIZE
	call puts 
	ldw x,txtend 
	subw x,txtbgn 
	call print_int 
	ldw x,#STR_BYTES 
	call puts 
	_vars VSIZE
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
	ret


;--------------------------
; BASIC: EDIT \E | \F
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
	jra reset_comma
2$:	; print character 
	ld a,xl 
	call putc 
	jra reset_comma 
3$: ; print character function value  	
	call (x)
	ld a,xl 
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
	ld a,xl 
	and a,#15 
	ld tab_width,a 
	jra reset_comma 
7$:	
	_unget_token 
	call relation 
	cp a,#TK_INTGR 
	jrne print_exit 
    call print_int 
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
	negw x 	
3$: ldw y,(VAR_ADDR,sp) 
	ldw (y),x 
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
	ret 


;---------------------
; BASIC: REMARK | ' 
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
	popw x 
	ld a,xl
	ld (XMASK,sp),a 
1$: popw x ; mask 
	ld a,xl 
	ld (MASK,sp),a 
	popw x ; address 
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
	popw x ; mask 
	ld a,xl 
	popw x ; addr  
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
	popw x ; mask 
	ld a,xl 
	cpl a 
	popw x ; addr  
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
1$: popw x ; mask 
	ld a,xl 
	popw x ; addr  
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
;	none 
;--------------------------
bit_test:
	call func_args 
	cp a,#2
	jreq 0$
	jp syntax_error
0$:	
	popw x 
	ld a,xl 
	and a,#7
	push a   
	ld a,#1 
1$: tnz (1,sp)
	jreq 2$
	sll a 
	dec (1,sp)
	jra 1$
2$: _drop 1 
	popw x 
	and a,(x)
	jreq 3$
	ld a,#1 
3$:	clrw x 
	ld xl,a 
	ld a,#TK_INTGR
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
	popw x  
    ld a,xl 
	popw x 
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
1$: popw x 
	ld a,(x)
	clrw x 
	ld xl,a 
	ld a,#TK_INTGR
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
1$:	clr a 
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
	CVAR=7   ; control variable 
	INW=9   ;  in.w saved
	BPTR=11 ; baseptr saved
	VSIZE=10  
for: ; { -- var_addr }
	popw x ; call return address 
	_vars VSIZE 
	pushw x  ; RETL1 
	ld a,#TK_VAR 
	call expect
	ldw (CVAR,sp),x  ; control variable 
	call let_var 
	bset flags,#FLOOP 
; open space on stack for loop data 
	clrw x 
	ldw (BPTR,sp),x 
	ldw (INW,sp),x 
	call next_token 
	cp a,#TK_CMD 
	jreq 1$
	jp syntax_error
1$:  
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
1$: call relation  
	cp a,#TK_INTGR 
	jreq 2$ 
	jp syntax_error
2$: ldw (LIMIT,sp),x
;	ldw x,in.w 
	call next_token
	cp a,#TK_NONE  
	jreq 4$ 
	cp a,#TK_CMD
	jrne 3$
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
1$: call relation
	cp a,#TK_INTGR
	jreq 2$
	jp syntax_error
2$:	ldw (FSTEP,sp),x ; step
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
; check for good variable after NEXT 	 
	cpw x,(CVAR,sp)
	jreq 2$  
	jp syntax_error ; not the good one 
2$: ; increment variable 
	ldw x,(x)  ; get var value 
	addw x,(FSTEP,sp) ; var+step 
	ldw y,(CVAR,sp)
	ldw (y),x ; save var new value 
; check sign of STEP  
	ld a,#0x80
	bcp a,(FSTEP,sp)
	jrpl 4$
;negative step 
	cpw x,(LIMIT,sp)
	jrslt loop_done
	jra loop_back 
4$: ; positive step
	cpw x,(LIMIT,sp)
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
;	pushw x 
;	ret 
	jp (x)

;----------------------------
; called by goto/gosub
; to get target line number 
;---------------------------
get_target_line:
	call relation 
	cp a,#TK_INTGR
	jreq get_target_line_2 
	jp syntax_error
get_target_line_2:
	clr a
	ldw y,basicptr 
	ldw y,(y)
	pushw y 
	cpw x,(1,sp)
	addw sp,#2 
	jrult 11$
	inc a 
11$:	
	call search_lineno  
	tnzw x 
	jrne 2$ 
	ld a,#ERR_NO_LINE 
	jp tb_error 
2$:	ret 

;--------------------------------
; BASIC: ON expr GOTO|GOSUB line# [,line#]*
; selective goto or gosub 
;--------------------------------
	RET_ADDR=3
	RET_INW=5
	VSIZE=4  
cmd_on:
	btjt flags,#FRUN,0$ 
	ld a,#ERR_RUN_ONLY
	jp tb_error 
0$:	call expression 
	cp a,#TK_INTGR
	jreq 1$
	jp syntax_error
1$: cpw x,#1 
	jrslt 9$
	cpw x,#16 ; no more than 16 arguments 
	jrugt 9$
	ld a,xl 
	push a  ; selector  
	call next_token ; should be GOTO|GOSUB 
	cp a,#TK_CMD 
	jreq 2$ 
	jp syntax_error 
2$: cpw x,#goto 
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
	jra jp_to_target
9$: ; expr out of range skip to next line 
	mov in,count
	clr a  
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
    call ubound 
	_drop 2 ; drop return address 
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
	popw x ; duration
	popw y ; frequency 
beep:  
	pushw x 
	ldw x,#TIM2_CLK_FREQ
	divw x,y 
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
0$: ldw x,#0
	pushw x  ; divisor 
1$: ldw x,(ONOFF,sp)
	tnzw x 
	jreq 2$ 
	ldw x,(DIVSOR,sp) ; divisor 
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
3$:	_drop VSIZE 
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
1$: popw x 
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
1$: popw x 
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
1$: popw x 
	ld a,xl 
	ld (PINVAL,sp),a
	popw x 
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  flash memory operations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;--------------------------
; align farptr to BLOCK_SIZE 
;---------------------------
row_align:
	ld a,#0x7f 
	and a,farptr+2 
	jreq 1$ 
	ldw x,farptr+1 
	addw x,#BLOCK_SIZE 
	jrnc 0$
	inc farptr 
0$: ld a,xl 
	and a,#0x80
	ld xl,a
	ldw farptr+1,x  	
1$:	ret

;--------------------
; input:
;   X     increment 
; output:
;   farptr  incremented 
;---------------------
incr_farptr:
	addw x,farptr+1 
	jrnc 1$
	inc farptr 
1$:	ldw farptr+1,x  
	ret 

;-----------------------------------
; scan block for non zero byte 
; block are 128 bytes 
; input:
;    farptr     address block  
; output:
;     A     0 cleared, other not cleared  
;-----------------------------------
scan_block:
	clrw x 
1$: ldf a,([farptr],x) 
	jrne 2$
	incw x 
	cpw x,#BLOCK_SIZE 
	jrult 1$ 
2$:	ret 



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
0$: ld a,xl 
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

;---------------------------------------
; BASIC: SAVE
; write application in RAM to FLASH
;--------------------------------------
save_app:
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
	jra 9$
2$: 
; block programming flash
; must be done from RAM 
	call move_prg_to_ram
; initialize farptr 
	clr farptr 
	ldw x,#app_sign 
	ldw farptr+1,x 
; write signature
	ldw x,SIGNATURE ; "BC" 
	ldw rsign,x 
	ldw x,txtend 
	subw x,txtbgn 
	ldw rsize,x   
;copy block to flash
	ldw x,#rsign  
	ldw (1,sp),x   
3$:	ldw x,(1,sp)
	call write_row 
    ld a,#'. 
    call putc 
	ldw x,(1,sp)
	addw x,#BLOCK_SIZE
	ldw (1,sp),x  
	cpw x,txtend 
	jruge 8$
	ldw x,#BLOCK_SIZE 
	call incr_farptr
	jra 3$ 
8$:	
	_drop 2   
9$: ret 

SIGNATURE: .ascii "BC"
CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE before"
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
	ADDR=1
	VSIZ=2 
write:
	_vars VSIZE 
	clr farptr ; expect 16 bits address 
	call expression
	cp a,#TK_INTGR 
	jreq 0$
	jp syntax_error
0$: ldw (ADDR,sp),x 
	call next_token 
	cp a,#TK_COMMA 
	jreq 1$ 
	jra 9$ 
1$:	call expression
	cp a,#TK_INTGR
	jreq 2$
	jp syntax_error
2$:	ld a,xl 
	ldw x,(ADDR,sp) 
	ldw farptr+1,x 
	clrw x 
	call write_byte
	ldw x,(ADDR,sp)
	incw x 
	jra 0$ 
9$:
	_drop VSIZE
	ret 


;---------------------
;BASIC: CHAR(expr)
; évaluate expression 
; and take the 7 least 
; bits as ASCII character
; return a TK_CHAR 
;---------------------
char:
	call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error
1$:	popw x 
	ld a,xl 
	and a,#0x7f 
	ld xl,a
	ld a,#TK_CHAR
	ret

;---------------------
; BASIC: ASC(string|char|TK_CFUNC)
; extract first character 
; of string argument 
; return it as TK_INTGR 
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
0$: call (x)
	jra 2$
1$: 
	ld a,(x) 
	clrw x
	ld xl,a 
2$: 
	pushw x 
	ld a,#TK_RPAREN 
	call expect
	popw x 
	ld a,#TK_INTGR 
	ret 

;---------------------
;BASIC: KEY
; wait for a character 
; received from STDIN 
; input:
;	none 
; output:
;	X 		ASCII character 
;---------------------
key:
	call getc 
	clrw x 
	ld xl,a 
	ld a,#TK_INTGR
	ret

;----------------------
; BASIC: QKEY
; Return true if there 
; is a character in 
; waiting in STDIN 
; input:
;  none 
; output:
;   X 		0|-1 
;-----------------------
qkey:: 
	clrw x 
	ld a,rx1_head
	cp a,rx1_tail 
	jreq 9$ 
	cplw x 
9$: ld a,#TK_INTGR
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
	PORT=3
	REG=1 
	VSIZE=4 
gpio:
	call func_args 
	cp a,#2
	jreq 1$
	jp syntax_error  
1$:	
	ldw x,(PORT,sp)
	jrmi bad_port
	cpw x,#9
	jrpl bad_port
	ld a,#5
	mul x,a
	addw x,#GPIO_BASE 
	ldw (PORT,sp),x  
	ldw x,(REG,sp) 
	addw x,(PORT,sp)
	ld a,#TK_INTGR
	_drop VSIZE 
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
;   X 		free address 
;---------------------------
uflash:
	ldw x,app_sign
	cpw x,#4243 ; signature "BC" 
	jreq 1$
	ldw x,app_size 
	addw x,#app
	jra 2$
1$:	ldw x,#app_space 
2$:	ld a,#TK_INTGR 
	ret 


;---------------------
; BASIC: USR(addr[,arg])
; execute a function written 
; in binary code.
; binary fonction should 
; return token attribute in A 
; and value in X. 
; input:
;   addr	routine address 
;   arg 	is an optional argument 
; output:
;   A 		token attribute 
;   X       returned value 
;---------------------
usr:
	pushw y 	
	call func_args 
	cp a,#1 
	jreq 2$
	cp a,#2
	jreq 2$  
	jp syntax_error 
2$: popw y  ; arg|addr 
	cp a,#1
	jreq 3$
	popw x ; addr
	exgw x,y 
3$: call (y)
	popw y 
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
	jreq pause02 
	jp syntax_error
pause02: 
1$: tnzw x 
	jreq 2$
	wfi 
	decw x 
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
  jreq awu02
  jp syntax_error
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
	ld a,#TK_INTGR
	ret 



;------------------------------
; BASIC: ABS(expr)
; return absolute value of expr.
; input:
;   none
; output:
;   X     	positive integer
;-------------------------------
abs:
	call func_args 
	cp a,#1 
	jreq 0$ 
	jp syntax_error
0$:  
    popw x   
	ld a,xh 
	bcp a,#0x80 
	jreq 2$ 
	negw x 
2$: ld a,#TK_INTGR 
	ret 

;------------------------------
; BASIC: AND(expr1,expr2)
; Apply bit AND relation between
; the 2 arguments, i.e expr1 & expr2 
; output:
; 	A 		TK_INTGR
;   X 		result 
;------------------------------
bit_and:
	call func_args 
	cp a,#2
	jreq 1$
	jp syntax_error 
1$:	popw x 
	ld a,xh 
	and a,(1,sp)
	ld xh,a 
	ld a,xl
	and a,(2,sp)
	ld xl,a 
	_drop 2 
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
1$: 
	popw x 
	ld a,xh 
	or a,(1,sp)
	ld xh,a 
	ld a,xl 
	or a,(2,sp)
	ld xl,a 
	_drop 2 
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
1$: 
	popw x 
	ld a,xh 
	xor a,(1,sp)
	ld xh,a 
	ld a,xl 
	xor a,(2,sp)
	ld xl,a 
	_drop 2 
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
1$: popw y   
	popw x 
	tnzw y 
	jreq 4$
2$:	sllw x 
	decw y 
	jrne 2$
4$:  
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
1$: popw y  
	popw x
	tnzw y 
	jreq 4$
2$:	srlw x 
	decw y 
	jrne 2$
4$:  
	ld a,#TK_INTGR
	ret

;--------------------------
; BASIC: FCPU integer
; set CPU frequency 
;-------------------------- 

fcpu:
	ld a,#TK_INTGR
	call expect 
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
1$: popw y ; mode 
	popw x ; Dx pin 
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
;	X 		random positive integer 
;------------------------------
random:
	call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error
1$:  
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
	popw y 
	divw x,y 
	ldw x,y 
	incw x 
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
	call print_int 
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
	popw x 
	ldw timer,x 
	ret 

;------------------------------
; BASIC: TIMEOUT 
; return state of timer 
;------------------------------
timeout:
	ldw x,timer 
logical_complement:
	cplw x 
	cpw x,#-1
	jreq 2$
	clrw x 
2$:	ld a,#TK_INTGR
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
1$:	popw x 
	jra logical_complement



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
1$: popw x 
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
;   X     log2 
;   A     TK_INTGR 
;*********************************
log2:
	call func_args 
	cp a,#1 
	jreq 1$
	jp syntax_error 
1$: popw x 
leading_one:
	tnzw x 
	jreq 4$
	ld a,#15 
2$: rlcw x 
    jrc 3$
	dec a 
	jra 2$
3$: clrw x 
    ld xl,a
4$:	ld a,#TK_INTGR
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
	ldw y,in.w 
	ldw (DOLP_INW,sp),y
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

;---------------------------
; BASIC: DATLN  *expr*
; set DATA pointer at line# 
; specified by *expr* 
;---------------------------
data_line:
	call expression
	cp a,#TK_INTGR
	jreq 1$
	jp syntax_error  
1$: clr a 
	call search_lineno
	tnzw x 
	jrne 3$
2$:	ld a,#ERR_NO_LINE 
	jp tb_error
3$: ; check if valid data line 
    ldw y,x 
	ldw x,(4,x)
	cpw x,#data 
	jrne 2$ 
	ldw data_ptr,y
	ld a,(2,y)
	ld data_len,a 
	mov data_ofs,#FIRST_DATA_ITEM 
	ret

;---------------------------------
; BASIC: RESTORE 
; set data_ptr to first data line
; if not DATA found pointer set to
; zero 
;---------------------------------
restore:
	clr data_ptr 
	clr data_ptr+1
	clr data_ofs 
	clr data_len
	ldw x,txtbgn
data_search_loop: 	
	cpw x,txtend
	jruge 9$
	ldw y,x 
	ldw x,(4,x)
	addw x,#code_addr
	ldw x,(x)
	cpw x,#data 
	jrne try_next_line 
	ldw data_ptr,y 
	ld a,(2,y)
	ld data_len,a 
	mov data_ofs,#FIRST_DATA_ITEM
9$:	tnz data_len 
    jrne 10$
	ld a,#ERR_NO_DATA 
	jp tb_error 
10$:ret
try_next_line:
	ldw x,y 
	ld a,(2,x)
	ld acc8,a 
	clr acc16 
	addw x,acc16 
	jra data_search_loop


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
	_dict_entry 6,REMARK,REM_IDX;remark 
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
	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
	_dict_entry 4,LIST,LIST_IDX;list
	_dict_entry 3,LET,LET_IDX;let 
	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
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
	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
	_dict_entry,3,FOR,FOR_IDX;for 
	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
	_dict_entry,5,ERASE,ERASE_IDX; erase 
	_dict_entry,3,END,END_IDX;cmd_end  
	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
	_dict_entry,4,EDIT,EDIT_IDX ; edit 
	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
	_dict_entry,2,DO,DO_IDX;do_loop
	_dict_entry,3,DEC,DEC_IDX;dec_base
	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
	_dict_entry,6,DATALN,DATALN_IDX;data_line  
	_dict_entry,4,DATA,DATA_IDX;data  
	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
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
	.word const_cr1,data,data_line,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
	.word let,list,log2,lshift,muldiv,next,new ; 40..47
	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
	.word restore,return, random,rshift,run,show,free ; 72..79
	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
	.word wait,words,write,bit_xor,cmd_size,cmd_on ; 96..99
	.word 0 




