;;
; Copyright Jacques Deschênes 2019,2020 
; This file is part of PABasic 
;
;     PABasic is free software: you can redistribute it and/or modify
;     it under the terms of the GNU General Public License as published by
;     the Free Software Foundation, either version 3 of the License, or
;     (at your option) any later version.
;
;     PABasic is distributed in the hope that it will be useful,
;     but WITHOUT ANY WARRANTY; without even the implied warranty of
;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;     GNU General Public License for more details.
;
;     You should have received a copy of the GNU General Public License
;     along with PABasic.  If not, see <http://www.gnu.org/licenses/>.
;;
;--------------------------------------
;;;;;;;;;;;;;;;;;;;;
;;  debug support
;;;;;;;;;;;;;;;;;;;;

	.include "inc/nucleo_8s208.inc"
	.include "inc/stm8s208.inc"
	.include "inc/ascii.inc"
	.include "inc/gen_macros.inc" 
    .include tbi_macros.inc

    .area CODE

;;;;;;;;;;;;;
.if DEBUG 
;---------------------------------
;; print actual registers states 
;; as pushed on stack 
;; {Y,X,CC,A}
;---------------------------------
	_argofs 0  
	_arg R_Y 1 
	_arg R_X 3
	_arg R_A 5
	_arg R_CC 6
prt_regs::
	ldw x,#regs_state 
	call puts
; register PC
	ldw y,(1,sp)
	ldw x,#REG_EPC 
	call prt_reg16 
; register CC 
	ld a,(R_CC,sp)
	ldw x,#REG_CC 
	call prt_reg8 
; register A 
	ld a,(R_A,sp)
	ldw x,#REG_A 
	call prt_reg8 
; register X 
	ldw y,(R_X,sp)
	ldw x,#REG_X 
	call prt_reg16 
; register Y 
	ldw y,(R_Y,sp)
	ldw x,#REG_Y 
	call prt_reg16 
; register SP 
	ldw y,sp
	addw y,#6+ARG_OFS  
	ldw x,#REG_SP
	call prt_reg16
	ld a,#CR 
	call putc
	call putc   
	ret 


regs_state: .asciz "\nregisters state\n--------------------\n"


;--------------------
; print content at address in hex.
; input:
;   X 	address to peek 
; output:
;	none 
;--------------------	
prt_peek::
	pushw x 
	ldw acc16,x 
	clr acc24 
	clrw x 
	ld a,#16 
	call prti24 
	ld a,#': 
	call putc 
	ld a,#SPACE 
	call putc 
	popw x 
	ld a,(x)
	ld acc8,a 
	clrw x 
	ld a,#16 
	call prti24
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
	ld acc8,a 
	clrw x 
	ld xl,a 
	mov base,#16
	call print_int 
	call left_paren 
	pop a 
	clrw x 
	ld xl,a 
	mov base,#10 
	call print_int  
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
	call print_int  
	call left_paren 
	popw x 
	mov base,#10 
	call print_int  
	ld a,#') 
	call putc
	ret 

;------------------------------------
; print registers contents saved on
; stack by trap interrupt.
;------------------------------------
print_registers:
	ldw x,#STATES
	call puts
; print EPC 
	ldw x, #REG_EPC
	call puts 
	ld a, (11,sp)
	ld acc8,a 
	ld a, (10,sp) 
	ld acc16,a 
	ld a,(9,sp) 
	ld acc24,a
	clrw x  
	ld a,#16
	call prti24  
; print X
	ldw x,#REG_X
	ldw y,(5,sp)
	call prt_reg16  
; print Y 
	ldw x,#REG_Y
	ldw y, (7,sp)
	call prt_reg16  
; print A 
	ldw x,#REG_A
	ld a, (4,sp) 
	call prt_reg8
; print CC 
	ldw x,#REG_CC 
	ld a, (3,sp) 
	call prt_reg8 
; print SP 
	ldw x,#REG_SP
	ldw y,sp 
	addw y,#12
	call prt_reg16  
	ld a,#'\n' 
	call putc
	ret

STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
REG_EPC: .asciz "EPC:"
REG_Y:   .asciz "\nY:" 
REG_X:   .asciz "\nX:"
REG_A:   .asciz "\nA:" 
REG_CC:  .asciz "\nCC:"
REG_SP:  .asciz "\nSP:"

;----------------------------
; command interface
; only 3 commands:
;  'q' to resume application
;  'p [addr]' to print memory values 
;  's addr' to print string 
;----------------------------
;local variable 
	PSIZE=1
	VSIZE=1 
cmd_itf:
	sub sp,#VSIZE 
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
	clr tib 
	clr count 
	clr in 
	_drop #VSIZE 	
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
	call get_token
	cp a,#TK_INTGR 
	jrne invalid 
	call puts
	jp repl 	
mem_peek:
	ld a,#SPACE 
	call skip  	 
	addw y,in.w 
	ldw x,#pad 
	call strcpy
	ldw x,#pad
	call atoi24 	
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
	call prti24
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
	call prti24
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

.endif ; DEBUG 
