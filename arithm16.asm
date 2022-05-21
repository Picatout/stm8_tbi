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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Arithmetic operators
;;  16/32 bits integers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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

