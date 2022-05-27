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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    24 bits arithmetic 
;;  format in registers: A:X 
;;      A  bits 23..16 
;;      X  bits 15..0 
;;  acc24 variable used for 
;;  computation 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    .area CODE 

;-------------------------------
; add24 A:X+acc24 
; add 24 bits integers 
;------------------------------
add24: ; ( i1 i2 -- i1 + i2 )
    _xpop 
    pushw x  
    push a  
    _at_top  
    addw x,(2,sp)
    adc a, (1,sp)
    _store_top 
    _drop 3 
    ret 

;-------------------------------
; sub24 A:X-acc24 
; subtract 24 bits integers 
;------------------------------
sub24: ; (i1 i2 -- i1-i2 ) 
    _xpop 
    pushw x 
    push  a
    _at_top  
    subw x,(2,sp) 
    sbc a, (1,sp)
    _store_top  
    _drop 3 
    ret 

;------------------------------
; cp24  i1 i2 -- 0x800000|0|0x010000
;------------------------------
cp24:
    _xpop 
    ld acc24,a 
    ldw acc16,x
    _at_top 
    subw x,acc16
    sbc a,acc24
    jrslt 1$
    jrne 2$
    tnzw x 
    jrne 2$
    clr a 
    jra 9$ 
1$: ; i1 < i2 
    ld a,#255
    jra 9$ 
2$: ; i1 > i2 
    ld a,#1 
9$: clrw x
     _store_top 
    ret 

;-------------------------------
; cp24_ax 
; compare acc24 with A:X 
;-------------------------------
cp24_ax:
    push a 
    cpw x,acc16 
    sbc a,acc24
    pop a 
    ret 


;-------------------------------
; abs24 
; abolute value of top  
;-------------------------------
abs24: ; ( i -- u )
    ld a,(y)
    cp a,#0x80 
    jrpl neg24 ; negative integer
    ret  

;----------------------------
;  one's compleement 
;----------------------------
cpl24:  ; i -- ~i 
    cpl (y) 
    cpl (1,y)
    cpl (2,y)
    ret 

;----------------------------    
; two'2 complement of top  
;---------------------------
neg24: ; (i -- -i )
    _at_top
    cpl  a  
    cplw x 
    addw x,#1
    adc a,#0
    _store_top  
9$: ret 

;-----------------------------
; negate integer in A:X 
;----------------------------
neg_ax:
    cpl  a  
    cplw x 
    addw x,#1
    adc a,#0
    ret 

;------------------------------------
;  two's complement of acc24 
;-------------------------------------
neg_acc24: ; 
    cpl acc24 
    cpl acc16 
    cpl acc8
    inc acc8 
    jrne 9$
    inc acc16 
    jrne 9$
    inc acc24 
9$: ret 


;--------------------------------------
; unsigned multiply uint24_t by uint8_t
; input:
;	acc24	uint24_t 
;   A		uint8_t
; output:
;   acc24   A*acc24
;      A    overflow, bits 31..24 
;-------------------------------------
; local variables offset  on sp
	U8   = 1   ; A pushed on stack
	VSIZE = 1 
mulu24_8:
	pushw x    ; save X
	; local variable
	push a     ; U8
	clr acc32 
; multiply bits 7..0 * U8   	
	ld xl,a 
	ld a,acc8 
	mul x,a 
	ld a, acc16 
	ldw acc16,x
; multiply middle byte, bits 15..8 * U8  	
	ld xl,a 
	ld a,(U8,sp)
	mul x,a 
	ld a,acc24
	clr acc24  
	addw x,acc24
	ldw acc24,x 
; multiply  MSB, bits 23..16 * U8 
	ld xl,a 
	ld a,(U8,sp)
	mul x,a
	addw x,acc32  
	ldw acc32,x 
	ld a,xh 
	_drop VSIZE  
	popw x 
	ret 


;-------------------------------
; mul24 i1 i2 -- i1*i2  
; multiply 24 bits integers 
;------------------------------
    PROD=1 
    N1=4
    N2=7
    PROD_SIGN=10
    VSIZE=10 
mul24:
    _vars VSIZE
    clr (PROD_SIGN,sp)
    clr (PROD,sp)
    clrw x 
    ldw (PROD+1,sp),x
    _xpop 
    tnz a 
    jrpl 0$
    cpl (PROD_SIGN,sp)
    call neg_ax 
0$:    
    ld (N1,sp),a 
    ldw (N1+1,sp),x
    _at_top 
    tnz a 
    jrpl 2$ 
    cpl (PROD_SIGN,sp) 
    call neg_ax
    ld (N2,sp),a 
    ldw (N2+1,sp),x   
2$: 
    ld acc24,a 
    ldw acc16,x 
    ld a,(N1+2,sp); least byte     
    jreq 4$
    call mulu24_8
    tnz a 
    jrne 8$ ; overflow 
    ldw x,acc16  
    ld a,acc24
    jrmi 8$ ; overflow  
    ld (PROD,sp),a
    ldw (PROD+1,sp),x 
4$:
    ld a,(N2,sp) 
    ldw x,(N2+1,sp)
    ld acc24,a 
    ldw acc16,x 
    ld a,(N1+1,sp); middle byte     
    jreq 5$
    call mulu24_8
    tnz a 
    jrne 8$ ; overflow 
    ld a,acc24 
    jrne 8$  ; overflow 
    ldw x,acc16  
    addw x,(PROD,sp)
    jrv 8$ ; overflow
    ldw (PROD,sp),x 
    ld a,(N2,sp)
    ldw x,(N2+1,sp)
    ld acc24,a 
    ldw acc16,x 
5$:
    ld a,(N1,sp) ; high byte 
    jreq 6$
    call mulu24_8
    tnz a 
    jrne 8$ ; overflow 
    ldw x,acc24 
    jrne 8$ ; overflow 
    ld a,acc8 
    jrmi 8$ ; overflow 
    add a,(PROD,sp)
    ld (PROD,sp),a 
    jrv 8$ ; overflow 
6$:
    ld a,(PROD,sp)
    ldw x,(PROD+1,sp)
    tnz (PROD_SIGN,sp)
    jreq 9$
    call neg_ax 
    jra 9$ 
8$: ; overflow
    ld a,#ERR_OVERFLOW
    jp tb_error 
9$:    
    _store_top 
    _drop VSIZE 
    ret 

;-------------------------------------
; divide uint24_t by uint8_t
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
	ldw x,acc24
	ld a,(U8,SP) ; divisor
	div x,a ; UU:MM/U8
	push a  ;save remainder
    ldw acc24,x ; quotient 
	pop a
	ld xh,a
	ld a,acc8
	ld xl,a
	ld a,(U8,sp) ; divisor
	div x,a  ; R:LL/U8
	ld (U8,sp),a ; save remainder
	ld a,xl
	ld acc8,a
	pop a
	popw x
	ret


;-------------------------------
; div24 N/T   
; divide 24 bits integers
;  i1 i2 -- i1/i2 
;------------------------------
    DIVISOR=1
    CNTR=4
    QSIGN=5
    RSIGN=6 
    VSIZE=6 
div24:
    _vars VSIZE 
    clr (RSIGN,sp)
    clr (QSIGN,sp)
    _xpop 
    tnz a 
    jrpl 0$ 
    cpl (QSIGN,sp)
    call neg_ax
0$:
    ld  (DIVISOR,sp),a
    ldw (DIVISOR+1,sp),x
    or a,(DIVISOR+1,sp)
    or a,(DIVISOR+2,sp)
    jrne 1$ 
    ld a,#ERR_DIV0 
    jp tb_error 
1$: 
    _at_top
    tnz a 
    jrpl 2$
    call neg_ax
    cpl (QSIGN,sp)
    cpl (RSIGN,sp)
2$: 
    ld acc24,a 
    ldw acc16,x 
    ld a,#24 
    ld (CNTR,sp),a
    ld a,(DIVISOR,sp)
    ldw x,(DIVISOR+1,sp)
    call cp24_ax ; A:X-acc24 ?
    jrule 22$ 
; quotient=0, remainder=divisor      
    ld a,acc24 
    ldw x,acc16 
    clr acc24 
    clr acc16 
    clr acc8 
    jra 6$
22$:     
    clr a 
    clrw x 
    rcf  
3$: 
    rlc acc8 
    rlc acc16
    rlc acc24 
    rlcw x  
    rlc a
4$: subw x,(DIVISOR+1,sp) 
    sbc a,(DIVISOR,sp)
    jrnc 5$
    addw x,(DIVISOR+1,sp)
    adc a,(DIVISOR,sp)
5$: ; shift carry in QUOTIENT 
    ccf
    dec (CNTR,sp)
    jrne 3$ 
    rlc acc8 
    rlc acc16 
    rlc acc32 
6$:    
    ld (DIVISOR,sp),a 
    ldw (DIVISOR+1,sp),x 
    ld a,acc24 
    ldw x,acc16 
    tnz (QSIGN,sp)
    jreq 8$
    call neg_ax 
8$: 
    _store_top 
    ld a,(DIVISOR,sp)
    ldw x,(DIVSOR+1,sp)
81$:
    tnz (RSIGN,sp)
    jreq 9$
    call neg_ax       
9$: _drop VSIZE 
    ret 


;-------------------------------
; mod24 A:X % acc24 
; remainder 24 bits integers 
; input:
;    acc24   dividend 
;    A:X     divisor 
; output:
;    acc24   acc24 % A:X 
;------------------------------
mod24:
    call div24 
    _store_top  ; replace quotient by remainder 
    ret 


