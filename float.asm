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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   floating point arithmetic implementation
;   format IEEE-754 32 bits 
;   format:
;      bit   |   meaning 
;--------------------------------------------------
;      31    |   mantissa sign 
;   30:23    |   binary exponent offseted by 127 
;   22:0     |   unsigned mantissa 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    .module FLOAT_NBR 

    .area CODE 

; power of ten constant in IEEE-754 format 
power_ten:
    .word  0x4120,0x0000 ; 10.0 
    .word  0x42C8,0x0000 ; 100.0 
    .word  0x461C,0x4000 ; 1e4 
    .word  0x4CBE,0xBC20 ; 1e8
    .word  0x5A0E,0x1BCA ; 1e16 
    .word  0x749D,0xC5AE ; 1e16


;----------------------------------
; funpack  
; split float in its components 
; msign, mantissa, exponent 
; input:
;   acc32    float 
; output:
;   YH       mantissa sign 
;   YL       signed binary exponent 
;   A:X      unsigned mantissa 
;----------------------------------
funpack:
    clr a 
    btjf acc32,#7,2$ 
    cpl a 
2$: ld yh,a 
    ; extract exponent 
    ld a,acc32 ; mantissa sign + exp bits 7:1 
    sll a 
    btjf acc24,#7,4$ ; least bit of exponent 
    or a,#1 ; least bit of exponent 
    sub a,#127 ; exponent offset 
    ld xl,a 
4$: ; extract mantissa 
    clr acc32 
    bset acc24,#7 ; implicit 1 as mantissa MSB 
    ld a,acc24   ; mantissa bits 23..16 
    ldw x,acc16  ; mantissa bits 15..0 
    ret 


;-------------------------------------
;  fpack  
;  merge float component 
;  input:
;    msign   mantissa sign 
;    exp     signed binary exponent 
;    acc24   unsigned mantissa 
;  output: 
;    X:Y     float
;-------------------------------------
fpack:
    ld a,exp 
    add a,#127
    ld exp,a   
    bres acc24,#7 
    btjf exp,#0,2$ 
    bset acc24,#7 ; least bit of exponent 
2$: srl exp  
    ld a,exp 
    ld acc32,a 
    tnz msign 
    jreq 4$ 
    bset acc32,#7
    ldw x,acc32 ; float bits 31..16 
    ldw y,acc16 ; float bits 15..0  
4$:
    ret 





;-----------------------------------
;  fadd 
;  float sum 
;  input:
;    acc32    f1
;    A:X:Y    f2 
;  output:
;     X:Y   f1+f2  
;     A     TK_FLOAT 
;-----------------------------------
fadd:

    ret 

;-----------------------------------
; fsub 
; float subtraction 
; input:
;    acc32   f1 
;    X:Y     f2 
; output:
;    X:Y     f1-f2 
;    A       TK_FLOAT 
;------------------------------------
fsub:

    ret 

;------------------------------------
;  fprod 
;  float product 
;  input:
;    acc32   f1 
;    X:Y     f2 
;  output:
;    X:Y     f1*f2 
;    A       TK_FLOAT
;--------------------------------------
fprod:

    ret 

;--------------------------------------
; fdiv 
; float division 
; input:
;   acc32   f1 
;   X:Y     f2 
; output:
;    X:Y     f1/f2 
;    A       TK_FLOAT 
;---------------------------------------
fdiv:

    ret 


;---------------------------------------
; int 
; extrait la partie entière d'un float 
; les décimales sont tronquées.
; input:
;    X:Y    float 
; output:
;    X      int16 
;    A      TK_INTGR
;---------------------------------------
;  umstar 
;  2 24 bits mantissa product 
;  input:
;    acc24    m1 
;    A:X:Y    M2 
;  output:
;---------------------------------------



;---------------------------------------
;  parse_float 
;  parse a float string 
;  input:
;    Y    *char 
;  output:
;    acc32   float 
;---------------------------------------
parse_float:

    ret 


;---------------------------------------
; m_shift_right
; shift mantissa right unitl bit0 is 1.
; input:
;   acc24    mantissa 
; output:
;   acc24:   shifted mantissa 
;     A      shift count 
;---------------------------------------
m_shift_right:
    pushw x 
    push #0 
    ld a,acc24 
    ldw x,acc16 
1$: srl a 
    rrcw x 
    inc (1,sp)
    jrnc 1$
    rlcw x 
    rlc a 
    ld acc24,a 
    ldw acc16,x 
    pop a
    dec a 
    popw x 
    ret 


;---------------------------------------
; int 
; convert float to integer 
; input:
;   X:Y     float 
; output:
;   A:X     24 bits integer 
;---------------------------------------
int:
    ld a,xh 
    sll a 
    ldw acc16,x 
    btjf acc8,#7,2$
    bset a,#0 
2$: sub a,127 
    jreq  4$
    jrmi  6$
    push a 
    clr a 
    ld xh,a 
    ld a,xl 
    or a,#0x80 
    ld xl,a 
    pop a 
    cp a,#24
    jrmi 8$ 
    ld a,xl 
    ldw x,y 
    jra 9$ 
4$: clr a 
    ldw x,#1
    jra 9$
6$: clr a 
    clrw x 
    jra 9$ 
8$: push a 
    clr a 
    ld xh,a 
    ld a,xl 
    or a,#0x80 
    ld xl,a 
9$:         
    ret 


;---------------------------------------
;  ftoa 
;  convet float to string 
;  input:
;    acc32    float 
;  output: 
;    X        *asciz 
;---------------------------------------
    MSIGN=1 
    EXP=2
    MANT=3
    VSIZE=5  
ftoa: 
    _vars VSIZE 
    call fsplit 
    ldw (MSIGN,sp),y 
    ld (MANT,sp),a 
    ldw (MANT+1,sp),x 
    pushw y    ; (1,sp)=msign, (2,sp)=exp 
    pu 
    ldw acc16,x 
    tnz acc8 
    jrne 4$
    mov acc8,acc16 
    mov acc16,acc24 
    clr acc24 
    ld a,#8 
    add a,(EXP,sp)
    ld (EXP,sp),a ; incr exponent 
    tnz acc8 
    jrne 4$ 
    mov acc8,acc16 
    clr acc16
    ld a,#8 
    add a,(EXP,sp)
    ld (EXP,sp),a 
4$: call m_shift_right
    add a,(EXP,sp)
    ld (EXP,sp),a 
    call get_int_part ; A=exp -- 

9$: _drop VSIZE 
    ret 


;---------------------------------------
; print_float 
; convert flat to string 
; the print it 
;---------------------------------------
print_float:
    push base 
    mov base,#10
    call ftoa 
    call puts 
    pop base 
    ret 



