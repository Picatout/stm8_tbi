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


.if SEPARATE 
    .module COMPILER  
    .include "config.inc"

    .area CODE 
.endif 


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
	ldw y,line.addr  
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
	_ldxz txtend 
	subw x,(SRC,sp)
	ldw acc16,x ; size to move
	ldw x,(DEST,sp) 
	call move
	_ldxz txtend
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
	_ldxz ptr16 
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
1$: ld a,#4 
	cp a,(LLEN+1,sp)
	jreq 9$
; check for space 
	_ldxz txtend 
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
	_incz in 
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
	ld a,#QUOTE_IDX  
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
;   X      *output buffer (&pad[n])
;   Y 		point to tib 
;   in.w    offset in tib 
;   A 	    first digit|'$' 
; output:  
;   A:X 	int24   
;   acc24   24 bits integer
;   in.w    updated 
;   Y       &pad[n] 
;-------------------------
	; local variables 
	XSAVE=1
	VSIZE=2 
parse_integer: ; { -- n }
	pushw x ; XSAVE 
	ldw x,#tib 
	addw x,in.w
	decw x   
1$:	call atoi24 
	subw y,#tib 
	ldw in.w,y
	ldw y,(XSAVE,SP)  
	_drop VSIZE 
	ret

;-------------------------
; binary integer parser
; build integer in acc24  
; input:
;   Y 		point to tib 
;   in.w 	offset in tib  
; output:  
;   A:X 	int24 
;   in.w    updated 
;-------------------------
	BINARY=1 ; 24 bits integer 
	VSIZE=3
parse_binary: ; { -- n }
	push #0
	push #0
	push #0
2$:	
	ld a,([in.w],y)
	_incz in 
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
	_decz in 
	ldw y,x
; load 24 bits integer in A:X 
	ld a,(BINARY,sp)
	ldw x,(BINARY+1,sp)
	_drop VSIZE 
	ret

;-------------------------------------
; input:
;   A:X  24 bits integer 
;   Y    &pad[n]
; output:
;    pad   LIT_IDX,int24|LITC_IDX,int8 
;    y   &pad[n+4]|&pad[n+2]
;------------------------------------
compile_integer:
; 24 bits integer in A:X 
	rrwa x ; X:A format 
	tnzw x 
	jrne 1$ 
; integer <256 compile as 8 bits integer 
; compiled as .byte LITC_IDX,int8 
	ld (1,y),a 
	ld  a,#LITC_IDX 
	push a 
	ld (y),a
	addw y,#2 
	jra 9$ 
1$: ; compile as 24 bits integer
	; compiled as .byte LIT_IDX,most,middle,least (big indian)
	rlwa x ; restore to initial A:X format 
	ld (1,y),a 
	ld a,#LIT_IDX
	push a 
	ld (y),a 
	addw y,#2 
	LDW (Y),x 
	addw y,#2
9$:	pop a 
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

;------------------------------------
; check if character in {'0'..'9','A'..'F'}
; input:
;    A  character to test
; output:
;    Carry  0 not hex_digit | 1 hex_digit
;------------------------------------
is_hex_digit:
	call is_digit 
	jrc 9$
	cp a,#'A 
	jrc 1$
	cp a,#'G 
	ccf 
1$: ccf 
9$: ret 


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
	incw x ; keep space for token identifier
symb_loop: 
; symbol are converted to upper case 
	call to_upper  
	ld (x), a 
	incw x
	ld a,([in.w],y)
	_incz in 
	call is_symbol_char 
	jrc symb_loop 
	clr (x)
	_decz in  
	ret 

;---------------------------
;  token begin with a letter,
;  is keyword or variable. 	
; input:
;   X 		point to pad 
;   Y 		point to text
;   A 	    first letter  
; output:
;   Y		point in pad after token  
;   A 		token identifier
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
; one letter symbol is variable name 
	ld a,(1,x) 
	sub a,#'A 
	ldw x,#3 
	mul x,a 
	addw x,#vars ; variable address 
	ldw y,(XFIRST,sp)
	ldw (1,y),x 
	ld a,#VAR_IDX 
	ld (y),a
	addw y,#3
	jra 6$ 
2$: ; check in dictionary, if not found is label.
	_ldx_dict kword_dict ; dictionary entry point
	ldw y,(XFIRST,sp) ; name to search for
	incw y 
	call search_dict
	cp a,#NONE_IDX 
	jrne 4$
; not in dictionary
; compile it as LABEL
	ld a,#LABEL_IDX 
	ldw y,(XFIRST,sp)
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
	ld a,#LABEL_IDX  
	jra 6$ 
4$:	; word in dictionary 
	ldw y,(XFIRST,sp)
	ld (y),a ; compile token 
	incw y 
6$:	_drop VSIZE 
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
	_incz in
	jra 1$
2$: _drop 1 
	ret
	

;------------------------------------
; scan text for next lexeme
; compile its TOKEN_IDX and value
; in output buffer.  
; update input and output pointers 
; input: 
;	X 		pointer to buffer where 
;	        token idx and value are compiled 
; use:
;	Y       pointer to text in tib 
;   in.w    offset in tib, i.e. tib[in.w]
; output:
;   A       token index  
;   Y       updated position in output buffer   
;------------------------------------
	; use to check special character 
	.macro _case c t  
	ld a,#c 
	cp a,(TCHAR,sp) 
	jrne t
	.endm 
; local variables 
	TCHAR=1 ; parsed character 
	ATTRIB=2 ; token value  
	VSIZE=2
parse_lexeme:: 
	_vars VSIZE
	ldw y,#tib    	
	ld a,#SPACE
	call skip
	ld a,([in.w],y)
	jrne 1$
	ldw y,x 
	jp token_exit ; end of line 
1$:	_incz in 
	call to_upper 
	ld (TCHAR,sp),a ; first char of lexeme 
; check for quoted string
str_tst:  	
	_case '"' nbr_tst
	ld a,#QUOTE_IDX
	push a 
	ld (x),a ; compile TOKEN INDEX 
	incw x 
	call parse_quote ; compile quoted string 
	pop a 
	jp token_exit
; check for hexadecimal number 
nbr_tst:
	_case '$' bin_test 
	jra integer 
;check for binary number 
bin_test: 
	_case '&' digit_test 
	call parse_binary ; expect binary integer 
	call compile_integer
	jp token_exit 
; check for decimal number 	
digit_test: 
	ld a,(TCHAR,sp)
	call is_digit
	jrnc other_tests
integer: 
	ld a,(TCHAR,sp)
	call parse_integer 
	call compile_integer
	jp token_exit 
other_tests: 
	_case '(' bkslsh_tst 
	ld a,#LPAREN_IDX 
	jp token_char   	
bkslsh_tst: ; character token 
	_case '\',rparnt_tst
	ld a,#BSLASH_IDX 
	ld (x),a 
	push a 
	incw x 
	ld a,([in.w],y)
	_incz in  
	ld (x),a 
	incw x
	ldw y,x 
	pop a 	 
	jp token_exit 
rparnt_tst:		
	_case ')' colon_tst 
	ld a,#RPAREN_IDX  
	jp token_char
colon_tst:
	_case ':' comma_tst 
	ld a,#COLON_IDX  
	jp token_char  
comma_tst:
	_case COMMA semic_tst 
	ld a,#COMMA_IDX 
	jp token_char
semic_tst:
	_case SEMIC dash_tst
	ld a,#SCOL_IDX  
	jp token_char 	
dash_tst: 	
	_case '-' at_tst 
	ld a,#SUB_IDX  
	jp token_char 
at_tst:
	_case '@' qmark_tst 
	ld a,#ARRAY_IDX  
	jp token_char
qmark_tst:
	_case '?' tick_tst 
	ld a,#PRINT_IDX   
	ld (x),a 
	incw x 
	ldw y,x 
	jp token_exit
tick_tst: ; comment 
	_case TICK plus_tst 
	ld a,#REM_IDX 
	ld (x),a 
	incw x
copy_comment:
	ldw y,#tib 
	addw y,in.w
	pushw y 
	call strcpy
	subw y,(1,sp)
	incw y ; strlen+1
	pushw y  
	addw x,(1,sp) 
	ldw y,x 
	popw x 
	addw x,(1,sp)
	decw x 
	subw x,#tib 
	ldw in.w,x 
	_drop 2 
	ld a,#REM_IDX
	jp token_exit 
plus_tst:
	_case '+' star_tst 
	ld a,#ADD_IDX  
	jp token_char 
star_tst:
	_case '*' slash_tst 
	ld a,#MULT_IDX  
	jp token_char 
slash_tst: 
	_case '/' prcnt_tst 
	ld a,#DIV_IDX  
	jp token_char 
prcnt_tst:
	_case '%' eql_tst 
	ld a,#MOD_IDX 
	jp token_char  
; 1 or 2 character tokens 	
eql_tst:
	_case '=' gt_tst 		
	ld a,#REL_EQU_IDX 
	jp token_char 
gt_tst:
	_case '>' lt_tst 
	ld a,#REL_GT_IDX 
	ld (ATTRIB,sp),a 
	ld a,([in.w],y)
	_incz in 
	cp a,#'=
	jrne 1$
	ld a,#REL_GE_IDX  
	jra token_char  
1$: cp a,#'<
	jrne 2$
	ld a,#REL_NE_IDX  
	jra token_char 
2$: dec in
	ld a,(ATTRIB,sp)
	jra token_char 	 
lt_tst:
	_case '<' other
	ld a,#REL_LT_IDX  
	ld (ATTRIB,sp),a 
	ld a,([in.w],y)
	_incz in 
	cp a,#'=
	jrne 1$
	ld a,#REL_LE_IDX 
	jra token_char 
1$: cp a,#'>
	jrne 2$
	ld a,#REL_NE_IDX  
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
	cp a,#REM_IDX  
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
; used variables:
;   in.w  		 3|count, i.e. index in buffer
;   count        length of line | 0  
;   basicptr    
;   pad buffer   compiled BASIC line  
;
; If there is a line number copy pad 
; in program space. 
;-----------------------------------
	XSAVE=1
	VSIZE=2
compile::
	pushw y 
	_vars VSIZE 
	mov basicptr,txtbgn
	bset flags,#FCOMP 
	clr a 
	clrw x
	ldw pad,x ; line# in destination buffer 
	ld pad+2,a ; line length  
	_clrz in.w 
	_clrz in  ; offset in input text buffer 
	ld a,tib 
	call is_digit
	jrnc 1$ 
	_incz in 
	ldw x,#pad+3
	ldw y,#tib   
	call parse_integer 
	tnz a 
	jrne 0$
	cpw x,#1
	jrslt 0$
	ldw pad,x 
	jra 1$ 
0$:	ld a,#ERR_BAD_VALUE
	jp tb_error
1$:	 
	ldw y,#pad+3 
2$:	cpw y,#xstack_full 
	jrult 3$
	ld a,#ERR_BUF_FULL 
	jp tb_error 
3$:	
	ldw x,y 
	call parse_lexeme 
	tnz a 
	jrne 2$ 
; compilation completed  
	clr (y)
	incw y 
	subw y,#pad ; compiled line length 
    ld a,yl
	ldw x,#pad 
	ldw ptr16,x 
	ld (2,x),a 
	ldw x,(x)  ; line# 
	jreq 10$
	call insert_line ; in program space 
	_clrz  count
	clr  a ; not immediate command  
	jra  11$ 
10$: ; line# is zero 
; for immediate execution from pad buffer.
	_ldxz ptr16  
	ld a,(2,x)
	_straz count
	ldw line.addr,x
	addw x,#3
	ldw basicptr,x 	
11$:
	_drop VSIZE 
	bres flags,#FCOMP 
	popw y
	ret 
