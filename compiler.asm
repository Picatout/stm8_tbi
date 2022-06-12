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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   compile BASIC source code to byte code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    .module COMPILER 

    .include "config.inc"

.if SEPARATE
	.include "inc/nucleo_8s208.inc"
	.include "inc/stm8s208.inc"
	.include "inc/ascii.inc"
	.include "inc/gen_macros.inc" 
	.include "tbi_macros.inc" 
.endif 

    .area  CODE 

;-------------------------------------
; search text area for a line#
; input:
;   A           0 search from txbgn 
;			    1 search from basicptr 
;	X 			line# 
; output:
;   X 			addr of line | 0 
;   Y           line#|insert address if not found  
;-------------------------------------
	LL=1 ; line length 
	LB=2 ; line length low byte 
	VSIZE=2 
search_lineno::
	_vars VSIZE
	clr (LL,sp)
	ldw y,txtbgn
	tnz a 
	jreq search_ln_loop
	ldw y,basicptr 
search_ln_loop:
	cpw y,txtend 
	jrpl 8$
	cpw x,(y)
	jreq 9$
	jrmi 8$ 
	ld a,(2,y)
	ld (LB,sp),a 
	addw y,(LL,sp)
	jra search_ln_loop 
8$: 
	clrw x 	
	exgw x,y 
9$: _drop VSIZE
	exgw x,y   
	ret 

;-------------------------------------
; delete line at addr
; input:
;   X 		addr of line i.e DEST for move 
;-------------------------------------
	LLEN=1
	SRC=3
	VSIZE=4
del_line: 
	_vars VSIZE 
	ld a,(2,x) ; line length
	ld (LLEN+1,sp),a 
	clr (LLEN,sp)
	ldw y,x  
	addw y,(LLEN,sp) ;SRC  
	ldw (SRC,sp),y  ;save source 
	ldw y,txtend 
	subw y,(SRC,sp) ; y=count 
	ldw acc16,y 
	ldw y,(SRC,sp)    ; source
	call move
	ldw y,txtend 
	subw y,(LLEN,sp)
	ldw txtend,y
	ldw dvar_bgn,y 
	ldw dvar_end,y   
	_drop VSIZE     
	ret 

;---------------------------------------------
; open a gap in text area to 
; move new line in this gap
; input:
;    X 			addr gap start 
;    Y 			gap length 
; output:
;    X 			addr gap start 
;--------------------------------------------
	DEST=1
	SRC=3
	LEN=5
	VSIZE=6 
open_gap:
	cpw x,txtend 
	jruge 9$
	_vars VSIZE
	ldw (SRC,sp),x 
	ldw (LEN,sp),y 
	ldw acc16,y 
	ldw y,x ; SRC
	addw x,acc16  
	ldw (DEST,sp),x 
;compute size to move 	
	ldw x,txtend 
	subw x,(SRC,sp)
	ldw acc16,x ; size to move
	ldw x,(DEST,sp) 
	call move
	ldw x,txtend
	addw x,(LEN,sp)
	ldw txtend,x
	ldw dvar_bgn,x 
	ldw dvar_end,x 
	_drop VSIZE 
9$:	ret 

;--------------------------------------------
; insert line in pad into text area 
; first search for already existing 
; replace existing 
; if new line empty delete existing one. 
; input:
;   ptr16		pointer to tokenized line  
; output:
;   none
;---------------------------------------------
	DEST=1  ; text area insertion address 
	SRC=3   ; str to insert address 
	LINENO=5 ; line number 
	LLEN=7 ; line length 
	VSIZE=8  
insert_line:
	_vars VSIZE 
	ldw x,[ptr16]
	ldw (LINENO,sp),x 
	clr (LLEN,sp)
	ldw x,ptr16 
	ld a,(2,x)
	ld (LLEN+1,sp),a 
	clr a 
	ldw x,(LINENO,sp)
	call search_lineno
	tnzw x 
	jreq 0$ 
	ldw (DEST,sp),x 
	call del_line 
	jra 1$
0$: ldw (DEST,sp),y
1$: ld a,#3 
	cp a,(LLEN+1,sp)
	jreq 9$
; check for space 
	ldw x,txtend 
	addw x,(LLEN,sp)
	cpw x,#tib-10*CELL_SIZE ; keep 10 slots space for @() array.  
	jrult 3$
	bset flags,#FLN_REJECTED
	ldw x,#err_mem_full 
	call puts 
	jra 9$  
3$: ; create gap to insert line 
	ldw x,(DEST,sp) 
	ldw y,(LLEN,sp)
	call open_gap 
; move new line in gap 
	ldw x,(LLEN,sp)
	ldw acc16,x 
	ldw y,#pad ;SRC 
	ldw x,(DEST,sp) ; dest address 
	call move
	ldw x,(DEST,sp)
	cpw x,txtend 
	jrult 9$ 
	ldw x,(LLEN,sp)
	addw x,txtend 
	ldw txtend,x 
	ldw dvar_bgn,x 
	ldw dvar_end,x 
9$:	
	_drop VSIZE
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; compiler routines        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------
; parse quoted string 
; input:
;   Y 	pointer to tib 
;   X   pointer to output buffer 
; output:
;	buffer   parsed string
;------------------------------------
	PREV = 1
	CURR =2
	VSIZE=2
parse_quote: 
	_vars VSIZE 
	clr a
1$:	ld (PREV,sp),a 
2$:	
	ld a,([in.w],y)
	jreq 6$
	inc in 
	ld (CURR,sp),a 
	ld a,#'\
	cp a, (PREV,sp)
	jrne 3$
	clr (PREV,sp)
	ld a,(CURR,sp)
	callr convert_escape
	ld (x),a 
	incw x 
	jra 2$
3$:
	ld a,(CURR,sp)
	cp a,#'\'
	jreq 1$
	cp a,#'"
	jreq 6$ 
	ld (x),a 
	incw x 
	jra 2$
6$:
	clr (x)
	incw x 
	ldw y,x 
	clrw x 
	ld a,#TK_QSTR  
	_drop VSIZE
	ret 

;---------------------------------------
; called by parse_quote
; subtitute escaped character 
; by their ASCII value .
; input:
;   A  character following '\'
; output:
;   A  substitued char or same if not valid.
;---------------------------------------
convert_escape:
	pushw x 
	ldw x,#escaped 
1$:	cp a,(x)
	jreq 2$
	tnz (x)
	jreq 3$
	incw x 
	jra 1$
2$: subw x,#escaped 
	ld a,xl 
	add a,#7
3$:	popw x 
	ret 

escaped:: .asciz "abtnvfr"

;-------------------------
; integer parser 
; input:
;   X 		point to output buffer  
;   Y 		point to tib 
;   A 	    first digit|'$' 
; output:  
;   X 		integer bits 15..0 
;   A 		TK_INTGR
;   acc24   24 bits integer 
;-------------------------
	BASE=1
	TCHAR=2 
	XSAVE=3
	VSIZE=4 
parse_integer: ; { -- n }
	pushw x 	
	push #0 ; TCHAR
	push #10 ; BASE=10
	cp a,#'$
	jrne 2$ 
    _drop #1
	push #16  ; BASE=16
2$:	ld (x),a 
	incw x 
	ld a,([in.w],y)
	inc in 
	call to_upper 
	ld (TCHAR,sp),a 
	call is_digit 
	jrc 2$
	ld a,#16 
	cp a,(BASE,sp)
	jrne 3$ 
	ld a,(TCHAR,sp)
	cp a,#'A 
	jrmi 3$ 
	cp a,#'G 
	jrmi 2$ 
3$: dec in 	
    clr (x)
	ldw x,(XSAVE,sp)
	ldw y,#XSTACK_EMPTY 
	call atoi24
	ldw y,(XSAVE,sp)
	ld a,acc24 
	ld (y),a 
	incw y  
	ldw x,acc16 
	ldw (y),x 
	addw y,#2
	ld a,#TK_INTGR
	_drop VSIZE  
	ret 	

;-------------------------
; binary integer parser
; build integer in acc24  
; input:
;   X 		point to output buffer  
;   Y 		point to tib 
;   A 	    '&' 
; output:  
;   buffer  TK_INTGR integer  
;   X 		int16 
;   A 		TK_INTGR
;   acc24    int24 
;-------------------------
	BINARY=1 ; 24 bits integer 
	VSIZE=3
parse_binary: ; { -- n }
	push #0
	push #0
	push #0
2$:	
	ld a,([in.w],y)
	inc in 
	cp a,#'0 
	jreq 3$
	cp a,#'1 
	jreq 3$ 
	jra bin_exit 
3$: sub a,#'0 
	rrc a
	rlc (BINARY+2,sp) 
	rlc (BINARY+1,sp)
	rlc (BINARY,sp) 
	jra 2$  
bin_exit:
	dec in 
	ldw y,x
	ld a,(BINARY,sp)
	ld (y),a 
	incw y 
	ldw x,(BINARY+1,sp)
	ldw (y),x 
	addw y,#2  
	ld a,#TK_INTGR 	
	_drop VSIZE 
	ret

;-------------------------------------
; check if A is a letter 
; input:
;   A 			character to test 
; output:
;   C flag      1 true, 0 false 
;-------------------------------------
is_alpha::
	cp a,#'A 
	ccf 
	jrnc 9$ 
	cp a,#'Z+1 
	jrc 9$ 
	cp a,#'a 
	ccf 
	jrnc 9$
	cp a,#'z+1
9$: ret 	

;------------------------------------
; check if character in {'0'..'9'}
; input:
;    A  character to test
; output:
;    Carry  0 not digit | 1 digit
;------------------------------------
is_digit::
	cp a,#'0
	jrc 1$
    cp a,#'9+1
	ccf 
1$:	ccf 
    ret

;-------------------------------------
; return true if character in  A 
; is letter or digit.
; input:
;   A     ASCII character 
; output:
;   A     no change 
;   Carry    0 false| 1 true 
;--------------------------------------
is_alnum::
	call is_digit
	jrc 1$ 
	call is_alpha
1$:	ret 

;-----------------------------
; check if character in A 
; is a valid symbol character 
; valid: Upper case LETTER,DIGIT,'_','.','?' 
; input:
;    A   character to validate
; output:
;    Carry   set if valid 
;----------------------------
is_symbol_char: 
	cp a,#'_ 
	jrne 1$
0$:	scf 
	jra 9$ 
1$:	cp a,#'.
	jreq 0$
	cp a,#'? 
	jreq 0$ 
	call is_alnum 
9$: ret 

;---------------------------
;  when lexical unit begin 
;  with a letter a symbol 
;  is expected.
; input:
;   A   first character of symbol 
;	X   point to output buffer 
;   Y   point to input text 
; output:
;	X   after symbol 
;   Y   point after lexical unit 
;---------------------------
parse_symbol:
	incw x ; keep space for TK_ID 
symb_loop: 
; symbol are converted to upper case 
	call to_upper  
	ld (x), a 
	incw x
	ld a,([in.w],y)
	inc in 
	call is_symbol_char 
	jrc symb_loop 
	clr (x)
	dec in  
	ret 

;---------------------------
;  token begin with a letter,
;  is keyword or variable. 	
; input:
;   X 		point to pad 
;   Y 		point to text
;   A 	    first letter  
; output:
;   X		exec_addr|var_addr 
;   A 		TK_CMD|TK_IFUNC|TK_CFUNC|TK_AND|TK_OR|TK_XOR   
;   pad 	keyword|var_name  
;--------------------------  
	XFIRST=1
	VSIZE=2
parse_keyword: 
	pushw x ; preserve *symbol 
	call parse_symbol
	ldw x,(XFIRST,sp) 
	ld a,(2,x)
	jrne 2$
; one letter variable name 
	ld a,(1,x) 
	sub a,#'A 
	ldw x,#3 
	mul x,a 
	addw x,#vars 
	ld a,#TK_VAR 
	jra 4$ 
2$: ; check for keyword, otherwise syntax error.
	_ldx_dict kword_dict ; dictionary entry point
	ldw y,(XFIRST,sp) ; name to search for
	incw y 
	call search_dict
	tnz a
	jrne 4$
; not in dictionary
; compile it as TK_LABEL
	ldw y,(XFIRST,sp)
	ld a,#TK_LABEL 
	ld (y),a 
	incw y
	ldw x,y 
	call strlen
	cp a,#NAME_MAX_LEN 
	jrule 22$ 
	ld a,#NAME_MAX_LEN 
22$:	
	push a 
24$:
    ld a,(y)
	jreq 3$
	incw y
	dec (1,sp) 
	jrne 24$
	clr a 
	ld (y),a 
3$: incw y 
	_drop 1 
	ld a,#TK_LABEL 
	clrw x 
	jra 5$ 
4$:	
	ldw y,(XFIRST,sp)
	cp a,#TK_NOT 
	jrmi 41$
	ld (y),a 
	incw y 
	jra 5$ 
41$:	
	cpw x,#let  
	jreq 5$  ; don't compile LET command 
	ld (y),a 
	incw y 
	ldw (y),x
	addw y,#2  
5$:	_drop VSIZE 
	ret  	

;------------------------------------
; skip character c in text starting from 'in'
; input:
;	 y 		point to text buffer
;    a 		character to skip
; output:  
;	'in' ajusted to new position
;------------------------------------
	C = 1 ; local var
skip:
	push a
1$:	ld a,([in.w],y)
	jreq 2$
	cp a,(C,sp)
	jrne 2$
	inc in
	jra 1$
2$: _drop 1 
	ret
	

;------------------------------------
; scan text for next token
; input: 
;	X 		pointer to buffer where 
;	        token id and value are copied 
; use:
;	Y       pointer to text in tib 
; output:
;   A       token attribute 
;   X 		token value
;   Y       updated position in output buffer   
;------------------------------------
	; use to check special character 
	.macro _case c t  
	ld a,#c 
	cp a,(TCHAR,sp) 
	jrne t
	.endm 

	TCHAR=1
	ATTRIB=2
	VSIZE=2
get_token:: 
	_vars VSIZE
;	ld a,in 
;	sub a,count
;   jrmi 0$
;	clr a 
;	ret 
0$: 
	ldw y,#tib    	
	ld a,#SPACE
	call skip
	mov in.saved,in 
	ld a,([in.w],y)
	jrne 1$
	ldw y,x 
	jp token_exit ; end of line 
1$:	inc in 
	call to_upper 
	ld (TCHAR,sp),a 
; check for quoted string
str_tst:  	
	_case '"' nbr_tst
	ld a,#TK_QSTR
	ld (x),a 
	incw x 
	call parse_quote
	jp token_exit
nbr_tst:
; check for hexadecimal number 
	ld a,#'$'
	cp a,(TCHAR,sp) 
	jreq 1$
;check for binary number 
	ld a,#'&
	cp a,(TCHAR,sp)
	jrne 0$
	ld a,#TK_INTGR
	ld (x),a 
	incw x 
	call parse_binary ; expect binary integer 
	jp token_exit 
; check for decimal number 	
0$:	ld a,(TCHAR,sp)
	call is_digit
	jrnc 3$
1$:	ld a,#TK_INTGR 
	ld (x),a 
	incw x 
	ld a,(TCHAR,sp)
	call parse_integer 
	jp token_exit 
3$: 
	_case '(' bkslsh_tst 
	ld a,#TK_LPAREN
	jp token_char   	
bkslsh_tst: ; character token 
	_case '\',rparnt_tst
	ld a,#TK_CHAR 
	ld (x),a 
	incw x 
	ld a,([in.w],y)
	ld (x),a 
	incw x
	ldw y,x 	 
	inc in  
	clrw x 
	ld xl,a 
	ld a,#TK_CHAR 
	jp token_exit 
rparnt_tst:		
	_case ')' colon_tst 
	ld a,#TK_RPAREN 
	jp token_char
colon_tst:
	_case ':' comma_tst 
	ld a,#TK_COLON 
	jp token_char  
comma_tst:
	_case COMMA semic_tst 
	ld a,#TK_COMMA
	jp token_char
semic_tst:
	_case SEMIC dash_tst
	ld a,#TK_SEMIC 
	jp token_char 	
dash_tst: 	
	_case '-' at_tst 
	ld a,#TK_MINUS  
	jp token_char 
at_tst:
	_case '@' qmark_tst 
	ld a,#TK_ARRAY 
	jp token_char
qmark_tst:
	_case '?' tick_tst 
	ld a,#TK_CMD  
	ld (x),a 
	incw x 
	ldw y,x 
	ldw x,#cmd_print
	ldw (y),x 
	addw y,#2
	jp token_exit
tick_tst: ; comment 
	_case TICK plus_tst 
	ld a,#TK_CMD
	ld (x),a 
	incw x
	ldw y,#remark 
	ldw (x),y 
	addw x,#2  
copy_comment:
	ldw y,#tib 
	addw y,in.w
	pushw y 
	call strcpy
	subw y,(1,sp)
	incw y ; strlen+1 
	ldw (1,sp),y 
	addw x,(1,sp) 
	_drop 2 
	clr a 
	ldw y,x 
	jp token_exit 
plus_tst:
	_case '+' star_tst 
	ld a,#TK_PLUS  
	jp token_char 
star_tst:
	_case '*' slash_tst 
	ld a,#TK_MULT 
	jp token_char 
slash_tst: 
	_case '/' prcnt_tst 
	ld a,#TK_DIV 
	jp token_char 
prcnt_tst:
	_case '%' eql_tst 
	ld a,#TK_MOD
	jp token_char  
; 1 or 2 character tokens 	
eql_tst:
	_case '=' gt_tst 		
	ld a,#TK_EQUAL
	jp token_char 
gt_tst:
	_case '>' lt_tst 
	ld a,#TK_GT 
	ld (ATTRIB,sp),a 
	ld a,([in.w],y)
	inc in 
	cp a,#'=
	jrne 1$
	ld a,#TK_GE 
	jra token_char  
1$: cp a,#'<
	jrne 2$
	ld a,#TK_NE 
	jra token_char 
2$: dec in
	ld a,(ATTRIB,sp)
	jra token_char 	 
lt_tst:
	_case '<' other
	ld a,#TK_LT 
	ld (ATTRIB,sp),a 
	ld a,([in.w],y)
	inc in 
	cp a,#'=
	jrne 1$
	ld a,#TK_LE 
	jra token_char 
1$: cp a,#'>
	jrne 2$
	ld a,#TK_NE 
	jra token_char 
2$: dec in 
	ld a,(ATTRIB,sp)
	jra token_char 	
other: ; not a special character 	 
	ld a,(TCHAR,sp)
	call is_alpha 
	jrc 30$ 
	jp syntax_error 
30$: 
	call parse_keyword
	cpw x,#remark 
	jrne token_exit 
	ldw x,y 
	jp copy_comment 
token_char:
	ld (x),a 
	incw x
	ldw y,x 
token_exit:
	_drop VSIZE 
	ret


;-----------------------------------
; create token list fromm text line 
; save this list in pad buffer 
;  compiled line format: 
;    line_no  2 bytes {0...32767}
;    line length    1 byte  
;    tokens list  variable length 
;   
; input:
;   none
; modified variables:
;   basicptr     token list buffer address 
;   in.w  		 3|count, i.e. index in buffer
;   count        length of line | 0  
;-----------------------------------
	XSAVE=1
	VSIZE=2
compile::
	pushw y ; preserve xstack pointer 
	_vars VSIZE 
	mov basicptr,txtbgn
	bset flags,#FCOMP 
	ld a,#0
	ldw x,#0
	ldw pad,x ; destination buffer 
	ld pad+2,a ; count 
	ldw x,#pad+3
	clr in 
	call get_token
	cp a,#TK_INTGR
	jrne 2$
	cpw x,#1 
	jrpl 1$
	ld a,#ERR_BAD_VALUE
	jp tb_error
1$:	ldw pad,x ; line# 
	ldw y,#pad+3 
2$:	cpw y,#xstack_full 
	jrult 3$
	ld a,#ERR_BUF_FULL 
	jp tb_error 
3$:	
	ldw x,y 
	call get_token 
	cp a,#TK_NONE 
	jrne 2$ 
; compilation completed  
	subw y,#pad ; compiled line length 
    ld a,yl
	ldw x,#pad 
	ldw ptr16,x 
	ld (2,x),a 
	ldw x,(x)  ; line# 
	jreq 10$
	call insert_line
	clr  count 
	jra  11$ 
10$: ; line# is zero 
	ldw x,ptr16  
	ldw basicptr,x 
	ld a,(2,x)
	ld count,a 
	mov in,#3 
11$:
	_drop VSIZE 
	bres flags,#FCOMP 
	popw y 
	ret 

