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
; print TK_QSTR
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
1$:	jrmi 2$
	jp 6$
2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
	cp a,#TK_VAR 
	jrne 3$
;; TK_VAR 
	call space
	_get_addr 
	dec count 
	dec count   
	call var_name
	call putc  
	jra decomp_loop
3$:
	cp a,#TK_INTGR
	jrne 4$
;; TK_INTGR
	call get_int24
	dec count 
	dec count 
	dec count  
	ld acc24,a 
	ldw acc16,x
	call prt_acc24
	jra decomp_loop
4$: ; dictionary keyword
	cp a,#TK_NOT 
	jruge 50$ 
	_get_addr
	dec count 
	dec count 
	cpw x,#remark 
	jrne 5$
; print comment
	ld a,#''
	call putc
	ldw x,basicptr
	call puts 
	jp decomp_exit 
50$:
	clrw x 
	ld xl,a 	
5$: ; insert command name 
	call space  
	pushw y 
	call cmd_name
	popw y 
	call print_word  
	jp decomp_loop 
6$:
; label?
	cp a,#TK_LABEL 
	jrne 64$
; print label   	
	ldw x,basicptr 
	subw x,line.addr 
	cpw x,#4 
	jreq 62$
	call space 
62$:
	pushw x 
	call skip_string
	popw x 
	call puts 
	call space 
	jp decomp_loop
64$:
	cp a,#TK_COLON 
	jrne 66$
	ld a,#': 
	call putc 
	jp decomp_loop 
66$:	
	cp a,#TK_QSTR 
	jrne 7$
;; TK_QSTR
	call space
	call prt_quote  
	jp decomp_loop
7$:
	cp a,#TK_CHAR 
	jrne 9$
;; TK_CHAR
	call space 
	ld a,#'\ 
	call putc 
	_get_char 
	dec count   
8$:
	call putc  
82$:
	jp decomp_loop
9$: 
	cp a,#TK_SHARP 
	jrugt 10$ 
	sub a,#TK_ARRAY 
	clrw x 
	ld xl,a
	addw x,#single_char 
	ld a,(x)
	jra 8$ 
10$: 
	cp a,#TK_MINUS 
	jrugt 11$
	sub a,#TK_PLUS 
	clrw x 
	ld xl,a 
	addw x,#add_char 
	ld a,(x)
	jra 8$
11$:
    cp a,#TK_MOD 
	jrugt 12$
	sub a,#TK_MULT
	clrw x 
	ld xl,a 
	addw x,#mul_char
	ld a,(x)
	jra 8$
12$:
	sub a,#TK_GT  
	sll a 
	clrw x 
	ld xl,a 
	addw x,#relop_str 
	ldw x,(x)
	ld a,(x)
	incw x 
	call putc 
	ld a,(x)
	jrne 8$
	jp decomp_loop 
decomp_exit: 
	ld a,(BASE_SAV,sp)
	ld base,a 
	_drop VSIZE 
	ret 


single_char: .byte '@','(',')',',',';'
add_char: .byte '+','-'
mul_char: .byte '*','/','%'
relop_str: .word gt,equal,ge,lt,ne,le 
gt: .asciz ">"
equal: .asciz "="
ge: .asciz ">="
lt: .asciz "<"
le: .asciz "<="
ne:  .asciz "<>"

;----------------------------------
; search in kword_dict name
; from its execution address 
; input:
;   X       	routine_address  
; output:
;   X 			cstr*  | 0 
;--------------------------------
	CODE_ADDR=1 
	LINK=3 
	VSIZE=4
cmd_name:
	_vars VSIZE 
	clr acc16 
	ldw (CODE_ADDR,sp),x  
	ldw x,#kword_dict	
1$:	ldw (LINK,sp),x
	ld a,(2,x)
	and a,#15 
	ld acc8,a 
	addw x,#3
	addw x,acc16
	ldw x,(x) ; code address   
	cpw x,(CODE_ADDR,sp)
	jreq 2$
	ldw x,(LINK,sp)
	ldw x,(x) 
	subw x,#2  
	jrne 1$
	clr a 
	clrw x 
	jra 9$
2$: ldw x,(LINK,sp)
	addw x,#2 	
9$:	_drop VSIZE
	ret

