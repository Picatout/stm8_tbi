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


    .area  CODE 

;-------------------------
; copy command name to buffer  
; input:
;   X 	name address 
;   Y   destination buffer 
; output:
;   Y   point after name  
;--------------------------
cpy_cmd_name:
	tnzw x 
	jreq 10$
	ld a,(x)
	incw x
	and a,#15  
	push a 
    tnz (1,sp) 
	jreq 9$
1$:	ld a,(x)
	ld (y),a  
	incw x
	incw y 
	dec (1,sp)	 
	jrne 1$
9$: pop a 
10$: 
	ret	

;--------------------------
; add a space after letter or 
; digit.
; input:
;   Y     pointer to buffer 
; output:
;   Y    moved to end 
;--------------------------
add_space:
	decw y 
	ld a,(y)
	incw y
	cp a,#') 
	jreq 0$
	call is_alnum 
	jrnc 1$
0$: 
	ld a,#SPACE 
	ld (y),a 
	incw y 
1$: ret 

;--------------------------
;  align text in buffer 
;  to tab_width padding 
;  left with  SPACE 
; input:
;   X      str*
;   A      str_length 
; output:
;   X      ajusted
;--------------------------
right_align::
	push a 
0$: ld a,(1,sp)
	cp a,tab_width 
	jrpl 1$
	ld a,#SPACE 
	decw x
	ld (x),a  
	inc (1,sp)
	jra 0$ 
1$: pop a 	
	ret 

;--------------------------
; print TK_QSTR
; converting control character
; to backslash sequence
; input:
;   X        char *
;   Y        dest. buffer 
; output:
;   X        moved forward 
;   Y        moved forward 
;-----------------------------
cpy_quote:
	ld a,#'"
	ld (y),a 
	incw y 
	pushw x 
	call skip_string 
	popw x 
1$:	ld a,(x)
	jreq 9$
	incw x 
	cp a,#SPACE 
	jrult 3$
	ld (y),a
	incw y 
	cp a,#'\ 
	jrne 1$ 
2$:
	ld (y),a
	incw y  
	jra 1$
3$: push a 
	ld a,#'\
	ld (y),a 
	incw y  
	pop a 
	sub a,#7
	ld acc8,a 
	clr acc16
	pushw x
	ldw x,#escaped 
	addw x,acc16 
	ld a,(x)
	popw x
	jra 2$
9$: ld a,#'"
	ld (y),a 
	incw y  
	incw x 
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

;-----------------------------
; return cmd  idx from its 
; code address 
; input:
;   X      code address 
; output:
;   X      cmd_idx
;-----------------------------
get_cmd_idx:
	pushw y
	ldw y,#code_addr 
	ldw ptr16,y 
	clrw y 
1$:	cpw x,([ptr16],y)
	jreq 3$ 
	incw y 
	ld a,([ptr16],y)
	incw y
	or a,([ptr16],y)	
	jrne 1$
3$: ldw x,y 
	popw y 
	ret


;-------------------------------------
; decompile tokens list 
; to original text line 
; input:
;   [basicptr]  pointer at line 
;   Y           output buffer
; output:
;   A           length 
;   Y           after string  
;------------------------------------
	BASE_SAV=1
	WIDTH_SAV=2
	STR=3
	VSIZE=4 
decompile::
	_vars VSIZE
	ld a,base
	ld (BASE_SAV,sp),a  
	ld a,tab_width 
	ld (WIDTH_SAV,sp),a 
	ldw (STR,sp),y   
	ldw x,[basicptr] ; line number 
	mov base,#10
	mov tab_width,#5
	clr acc24 
	ldw acc16,x
	clr a ; unsigned conversion 
	call itoa  
	call right_align 
	push a 
1$:	ldw y,x ; source
	ldw x,(STR+1,sp) ; destination
	call strcpy 
	clrw y 
	pop a 
	ld yl,a 
	addw y,(STR,sp)
	ld a,#SPACE 
	ld (y),a 
	incw y 
	clr tab_width
	ldw x,#3
	ldw in.w,x 
decomp_loop:
	pushw y
	call next_token 
	popw y 
	tnz a  
	jrne 1$
	jp 20$
1$:	jrmi 2$
	jp 6$
2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
	cp a,#TK_VAR 
	jrne 3$
;; TK_VAR 
	call add_space
	call get_addr   
	call var_name
	ld (y),a 
	incw y  
	jra decomp_loop
3$:
	cp a,#TK_INTGR
	jrne 4$
;; TK_INTGR
	call get_int24 
	ld acc24,a 
	ldw acc16,x 
	call add_space
	pushw y 
	ld a,#255 ; signed conversion 
	call itoa  
	ldw y,(1,sp) 
	push a 
	exgw x,y 
	call strcpy 
	clrw y
	pop a  
	ld yl,a 
	addw y,(1,sp)
	_drop 2 
	jra decomp_loop
4$: ; dictionary keyword
	cp a,#TK_AND 
	jruge 50$ 
	ldw x,(x)
	inc in 
	inc in 
	cpw x,#REM_IDX
	jrne 5$
	ldw x,basicptr 
; copy comment to buffer 
	call add_space
	ld a,#''
	ld (y),a 
	incw y 
46$:
	ld a,([in.w],x)
	inc in  
	ld (y),a 
	incw y 
	ld a,in 
	cp a,count 
	jrmi 46$
	jp 20$  
5$: cpw x,#LET_IDX 
	jrne 54$
	jp decomp_loop ; down display LET 	
50$:
	clrw x 
	sub a,#TK_AND 
	sll a 
	ld xl,a 
	addw x,#AND_IDX
54$: ; insert command name 
	call add_space  
	pushw y
	call cmd_name
	popw y 
	call cpy_cmd_name
	jp decomp_loop 
6$:
; label?
	cp a,#TK_LABEL 
	jrne 64$
; copy label string to output buffer   	
	ld a,#32 
	ld (y),a 
	incw y 
61$:
	pushw x 
	call skip_string 
	popw x 
62$:	
	ld a,(x)
	jreq 63$ 
	incw x  
	ld (y),a 
	incw y 
	jra 62$ 
63$: 
	ld a,#32 
	ld (y),a 
	incw y 
	jp decomp_loop
64$:
	cp a,#TK_QSTR 
	jrne 7$
;; TK_QSTR
	call add_space
	call cpy_quote  
	jp decomp_loop
7$:
	cp a,#TK_CHAR 
	jrne 8$
;; TK_CHAR
	call add_space 
	ld a,#'\ 
	ld (y),a 
	incw y
	ld a,(x)
	inc in  
	jra 81$
8$: cp a,#TK_COLON 
	jrne 9$
	ld a,#':
81$:
	ld (y),a 
	incw y 
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
	jra 81$ 
10$: 
	cp a,#TK_MINUS 
	jrugt 11$
	sub a,#TK_PLUS 
	clrw x 
	ld xl,a 
	addw x,#add_char 
	ld a,(x)
	jra 81$
11$:
    cp a,#TK_MOD 
	jrugt 12$
	sub a,#TK_MULT
	clrw x 
	ld xl,a 
	addw x,#mul_char
	ld a,(x)
	jra 81$
12$:
	sub a,#TK_GT  
	sll a 
	clrw x 
	ld xl,a 
	addw x,#relop_str 
	ldw x,(x)
	ld a,(x)
	incw x 
	ld (y),a
	incw y 
	ld a,(x)
	jrne 81$
	jp decomp_loop 
20$: 
	clr (y)
	ldw x,(STR,sp)
	ld a,(BASE_SAV,sp)
	ld base,a 
	ld a,(WIDTH_SAV,sp)
	ld tab_width,a
	subw y,(STR,sp) 
	ld a,yl 
	_drop VSIZE 
	ret 

single_char: .byte '@','(',')',',','#'
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
;   X       	cmd_index 
; output:
;   X 			cstr*  | 0 
;--------------------------------
	CMDX=1 
	LINK=3 
	VSIZE=4
cmd_name:
	_vars VSIZE 
	clr acc16 
	ldw (CMDX,sp),x  
	ldw x,#kword_dict	
1$:	ldw (LINK,sp),x
	ld a,(2,x)
	and a,#15 
	ld acc8,a 
	addw x,#3
	addw x,acc16
	ldw x,(x) ; command index  
	cpw x,(CMDX,sp)
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

