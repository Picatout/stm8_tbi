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

;---------------------------------------
;  decompiler
;  decompile bytecode to text source
;  used by command LIST
;---------------------------------------

    .module DECOMPILER 

    .include "config.inc"

.if SEPARATE
	.include "inc/nucleo_8s208.inc"
	.include "inc/stm8s208.inc"
	.include "inc/ascii.inc"
	.include "inc/gen_macros.inc" 
	.include "tbi_macros.inc" 
.endif 


;    .area  CODE 

;--------------------------
;  align text in buffer 
;  by  padding left  
;  with  SPACE 
; input:
;   X      str*
;   A      width  
; output:
;   A      strlen
;   X      ajusted
;--------------------------
	WIDTH=1 ; column width 
	SLEN=2  ; string length 
	VSIZE=2 
right_align::
	_vars VSIZE 
	ld (WIDTH,sp),a 
	call strlen 
0$:	ld (SLEN,sp),a  
	cp a,(WIDTH,sp) 
	jrpl 1$
	decw x
	ld a,#SPACE 
	ld (x),a  
	ld a,(SLEN,sp)
	inc a 
	jra 0$ 
1$: ld a,(SLEN,sp)	
	_drop VSIZE 
	ret 

;--------------------------
; print quoted string 
; converting control character
; to backslash sequence
; input:
;   X        char *
;-----------------------------
prt_quote:
	ld a,#'"
	call putc 
	pushw x 
	call skip_string 
	popw x 
1$:	ld a,(x)
	jreq 9$
	incw x 
	cp a,#SPACE 
	jrult 3$
	call putc 
	cp a,#'\ 
	jrne 1$ 
2$:
	call putc 
	jra 1$
3$: push a 
	ld a,#'\
	call putc  
	pop a 
	sub a,#7
	ld acc8,a 
	clr acc16
	pushw x
	ldw x,#escaped 
	addw x,acc16 
	ld a,(x)
	call putc 
	popw x
	jra 1$
9$:
	ld a,#'"
	call putc  
	ret

;--------------------------
; return variable name 
; from its address.
; input:
;   X    variable address
; output:
;   A     variable letter
;--------------------------
var_name::
		subw x,#vars 
		ld a,#3
		div x,a 
		ld a,xl 
		add a,#'A 
		ret 


;-------------------------------------
; decompile tokens list 
; to original text line 
; input:
;   line.addr start of line 
;   basicptr  at first token 
;   count     stop position.
;------------------------------------
	BASE_SAV=1 ; 1 byte 
	PSTR=2     ;  1 word 
	VSIZE=3
decompile::
	_vars VSIZE
	ld a,base
	ld (BASE_SAV,sp),a  
	ldw x,line.addr
	ldw x,(x)
	mov base,#10
	clr acc24 
	ldw acc16,x
	clr a ; unsigned conversion  
	call itoa  
	ld a,#5 
	call right_align 
	call puts 
	ld a,#SPACE 
	call putc
decomp_loop:
	ld a,count 
	jrne 0$
	jp decomp_exit 
0$:	dec count 
	call next_token
	tnz a 
	jrne 1$ 
	jp decomp_exit   
1$:	cp a,#QUOTE_IDX 
	jrne 2$
	jp quoted_string 
2$:	cp a,#VAR_IDX 
	jrne 3$
	jp variable 
3$:	cp a,#REM_IDX 
	jrne 4$
	jra comment 
4$:	cp a,#LABEL_IDX 
	jrne 5$
	jp label 
5$:	cp a,#LIT_IDX 
	jrne 6$
	jp literal 
6$:	cp a,#LITC_IDX 
	jrne 7$
	jra lit_char 
7$:	cp a,#BSLASH_IDX
	jrne 8$
	jp letter 
; print command,funcion or operator 	 
8$:	
	call tok_to_name 
	tnz a 
	jrne 9$
	jp decomp_exit
9$:	call puts
	call space 
	jra decomp_loop
; print variable name 	
variable: ; VAR_IDX 
	call space
	_get_addr 
	dec count 
	dec count   
	call var_name
	call putc  
	jra decomp_loop
; print int24 
literal: ; LIT_IDX 
	call get_int24
	dec count 
	dec count 
	dec count  
	ld acc24,a 
	ldw acc16,x
	call prt_acc24
	jp decomp_loop
; print int8 	
lit_char: ; LITC_IDX 
	_get_char 
	dec count 
	clrw x 
	ld xl,a 
	call prt_i16 
	jp decomp_loop 
; print comment	
comment: ; REM_IDX 
	ld a,#''
	call putc
	call space 
	ldw x,basicptr
	call puts 
	jp decomp_exit 
; print label   	
label: ; LABLE_IDX 
	ldw x,basicptr 
	subw x,line.addr 
	cpw x,#4 
	jreq 1$
	call space 
1$:
	ldw x,basicptr 
	pushw x 
	call skip_string
	popw x 
	call puts 
	call space 
	jp decomp_loop
; print quoted string 	
quoted_string:	
	call space
	call prt_quote  
	jp decomp_loop
; print \letter 	
letter: 
	call space 
	ld a,#'\ 
	call putc 
	_get_char 
	dec count   
	call putc  
	jp decomp_loop
decomp_exit: 
	ld a,(BASE_SAV,sp)
	ld base,a 
	_drop VSIZE 
	ret 

;----------------------------------
; search name in dictionary
; from its token index  
; input:
;   a       	token index   
; output:
;   A           token index | 0 
;   X 			*name  | 0 
;--------------------------------
	TOKEN=1  ; TOK_IDX 
	NFIELD=2 ; NAME FIELD 
	VSIZE=3
tok_to_name:
	_vars VSIZE 
	clr acc16 
	ld (TOKEN,sp),a 
	ldw x, #all_words+2 ; name field 	
1$:	ldw (NFIELD,sp),x
	ld a,(x)
	add a,#2 
	ld acc8,a 
	addw x,acc16
	ld a,(x) ; TOK_IDX     
	cp a,(TOKEN,sp)
	jreq 2$
	ldw x,(NFIELD,sp) ; name field 
	subw x,#2 ; link field 
	ldw x,(x) 
	jrne 1$
	clr a 
	jra 9$
2$: ldw x,(NFIELD,sp)
	incw x 
9$:	_drop VSIZE
	ret

