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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  debug support
;;  set DEBUG=1 in config.inc 
;;  to enable it.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.macro _dbg_prt_regs
	.if DEBUG 
		call print_registers  
	.endif 
	.endm 

	.macro _dbg_cmd_itf 
	.if DEBUG 
		call cmd_itf 
	.endif 
	.endm 

.if DEBUG 

    .area CODE

;--------------------
; print content at address in hex.
; input:
;   X 	address to peek 
; output:
;	none 
;--------------------	
prt_peek::
	pushw x 
	mov base,#16 
	call prt_i16  
	ld a,#': 
	call putc 
	ld a,#SPACE 
	call putc 
	popw x 
	ld a,(x)
	clrw x 
	ld xl,a 
	mov base,#10 
	call prt_i16 
	ret 

;----------------------------------------
;   DEBUG support functions
;----------------------------------------

; turn LED on 
ledon:
    bset PC_ODR,#LED2_BIT
    ret 

; turn LED off 
ledoff:
    bres PC_ODR,#LED2_BIT 
    ret 

; invert LED status 
ledtoggle:
    ld a,#LED2_MASK
    xor a,PC_ODR
    ld PC_ODR,a
    ret 

left_paren:
	ld a,#SPACE 
	call putc
	ld a,#'( 
	call putc 	
	ret 

;------------------------------
; print 8 bit register 
; input:
;   X  point to register name 
;   A  register value to print 
; output:
;   none
;------------------------------- 
prt_reg8:
	push a 
	call puts 
	ld a,(1,sp) 
	clrw x 
	ld xl,a 
	mov base,#16
	call prt_i16  
	call left_paren 
	pop a 
	clrw x 
	ld xl,a 
	mov base,#10 
	call prt_i16  
	ld a,#') 
	call putc
	ret

;--------------------------------
; print 16 bits register 
; input:
;   X   point register name 
;   Y   register value to print 
; output:
;  none
;--------------------------------
prt_reg16: 
	pushw y 
	call puts 
	ldw x,(1,sp) 
	mov base,#16 
	call prt_i16  
	call left_paren 
	popw x 
	mov base,#10 
	call prt_i16  
	ld a,#') 
	call putc
	ret 

;------------------------------------
; print registers contents saved on
; stack by trap interrupt.
;------------------------------------
	R_PC=10 
	R_CC=9
	SAV_ACC24=8
	SAV_ACC16=6
	R_Y=4
	R_X=2
	R_A=1
	VSIZE=8 
print_registers:
	push cc 
	_vars VSIZE 
	ld (R_A,sp),a 
	ldw (R_X,sp),x 
	ldw (R_Y,sp),y
	ld a,acc24 
	ldw x,acc16 
	ld (SAV_ACC24,sp),a 
	ldw (SAV_ACC16,sp),x 
	ldw x,#STATES
	call puts
; print PC 
	ldw x, #REG_PC
	ldw y, (R_PC,sp)
	subw y,#3
	call prt_reg16 
; print x
	ldw x,#REG_X
	ldw y,(R_X,sp)
	call prt_reg16  
; print Y 
	ldw x,#REG_Y
	ldw y, (R_Y,sp)
	call prt_reg16  
; print A 
	ldw x,#REG_A
	ld a, (R_A,sp) 
	call prt_reg8
; print CC 
	ldw x,#REG_CC 
	ld a, (R_CC,sp) 
	call prt_reg8 
; print SP 
	ldw x,#REG_SP
	ldw y,sp 
	addw y,#(VSIZE+3)
	call prt_reg16  
	ld a,#'\n' 
	call putc
	ld a,(SAV_ACC24,sp)
	ldw x,(SAV_ACC16,sp)
	ld acc24,a 
	ldw acc16,x 
	ld a,(R_A,sp)
	ldw x,(R_X,sp)
	ldw y,(R_Y,sp)
	_drop VSIZE
	pop cc   	
	ret

STATES:  .asciz "\nRegisters state at break point.\n--------------------------\n"
REG_PC: .asciz "PC:"
REG_Y:   .asciz "\nY:" 
REG_X:   .asciz "\nX:"
REG_A:   .asciz "\nA:" 
REG_CC:  .asciz "\nCC:"
REG_SP:  .asciz "\nSP:"

;----------------------
; input:
;	Y    *input buffer 
; output:
;   acc24  integer 
;----------------------
parse_addr:
	ld a,#SPACE 
	call skip  	 
	addw y,in.w 
	ldw x,#pad 
	call strcpy
	ldw x,#pad
	call atoi24 	
	ret 

;----------------------------
; command interface
; only 3 commands:
;  'q' to resume application
;  'p [addr]' to print memory values 
;  's addr' to print string 
;----------------------------
;local variable
	PSIZE=11
	SAV_COUNT=10
	SAV_IN=9
	SAV_ACC24=8
	SAV_ACC16=6
	R_Y=4
	R_X=2
	R_A=1
	VSIZE=11
cmd_itf:
	push cc 
	_vars VSIZE
	ld (R_A,sp),a
	ld a,count 
	ld (SAV_COUNT,sp),a 
	ld a,in 
	ld (SAV_IN,sp),a  
	ldw (R_X,sp),x 
	ldw (R_Y,sp),y
	ld a,acc24 
	ldw x,acc16 
	ld (SAV_ACC24,sp),a 
	ldw (SAV_ACC16,sp),x 
	clr farptr 
	clr farptr+1 
	clr farptr+2  
repl:
	ld a,#CR 
	call putc 
	ld a,#'? 
	call putc
	clr in.w 
	clr in 
	call readln
	ldw y,#tib  
	ld a,(y)
	jreq repl  
	inc in 
	call to_upper 
	cp a,#'Q 
	jrne test_p
repl_exit:
; restore original context 
	ld a,(SAV_ACC24,sp)
	ldw x,(SAV_ACC16,sp)
	ld acc24,a 
	ldw acc16,x
	ld a,(SAV_COUNT,sp)
	ld count,a 
	ld a,(SAV_IN,sp)
	ld in,a 
	ldw y,(R_Y,sp)
	ldw x,(R_X,sp)
	ld a,(R_A,sp)
	_drop VSIZE
	pop cc 
	ret  
invalid:
	ldw x,#invalid_cmd 
	call puts 
	jra repl 
test_p:	
    cp a,#'P 
	jreq mem_peek
    cp a,#'S 
	jrne invalid 
print_string:
	call parse_addr 	
	ldw x,acc16
	call puts
	jp repl 	
mem_peek:
	call parse_addr 
	ld a, acc24 
	or a,acc16 
	or a,acc8 
	jrne 1$ 
	jra peek_byte  
1$:	ldw x,acc24 
	ldw farptr,x 
	ld a,acc8 
	ld farptr+2,a 
peek_byte:
	call print_farptr 
	ld a,#8 
	ld (PSIZE,sp),a 
	clrw x 
1$:	call fetchc  
	pushw x 
	ld acc8,a 
	clrw x 
	ldw acc24,x 
	ld a,#16+128
	call prt_acc24
	popw x 
	dec (PSIZE,sp)
	jrne 1$ 
	ld a,#8 
	add a,farptr+2 
	ld farptr+2,a
	clr a 
	adc a,farptr+1 
	ld farptr+1,a 
	clr a 
	adc a,farptr 
	ld farptr,a 
	jp repl  

invalid_cmd: .asciz "not a command\n" 

;----------------------------
; display farptr address
;----------------------------
print_farptr:
	ld a ,farptr+2 
	ld acc8,a 
	ldw x,farptr 
	ldw acc24,x 
	clrw x 
	ld a,#16 
	call prt_acc24
	ld a,#SPACE 
	call putc 
	call putc 
	ret

;------------------------------------
; get byte at address farptr[X]
; input:
;	 farptr   address to peek
;    X		  farptr index 	
; output:
;	 A 		  byte from memory  
;    x		  incremented by 1
;------------------------------------
fetchc: ; @C
	ldf a,([farptr],x)
	incw x
	ret


;------------------------------------
; expect a number from command line 
; next argument
;  input:
;	  none
;  output:
;    acc24   int24_t 
;------------------------------------
number:
	call get_token
	cp a,#TK_INTGR
	jreq 1$
	jp syntax_error
1$:	ret


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
	call prt_i16 
	ld a,#SPACE  
	call putc
row_loop:
	ldw x,(ADR,sp)
	ld a,(x)
	clrw x 
	ld xl,a 
	call prt_i16 
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

.endif ; DEBUG 

