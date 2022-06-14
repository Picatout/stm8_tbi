;;
; Copyright Jacques Deschênes 2019 
; This file is part of STM8_NUCLEO 
;
;     STM8_NUCLEO is free software: you can redistribute it and/or modify
;     it under the terms of the GNU General Public License as published by
;     the Free Software Foundation, either version 3 of the License, or
;     (at your option) any later version.
;
;     STM8_NUCLEO is distributed in the hope that it will be useful,
;     but WITHOUT ANY WARRANTY; without even the implied warranty of
;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;     GNU General Public License for more details.
;
;     You should have received a copy of the GNU General Public License
;     along with STM8_NUCLEO.  If not, see <http://www.gnu.org/licenses/>.
;;
;--------------------------------------
        TAB_WIDTH=4 ; default tabulation width 
        EOF=0xff ; end of file marker 
        ; keyword types 
        F_CMD=0     ; command keyword
        F_IFUNC=(1<<4) ; integer function keyword
        F_CFUNC=(2<<4) ; character function keyword
        F_CONST=(3<<4) ; function keyword that return a constant
        F_NOT=(7<<4)   ; TK_NOT 
        F_AND=(8<<4)   ; TK_AND
        F_OR=(9<<4)    ; TK_OR
        F_XOR=(10<<4)   ; TK_XOR   
        NLEN_MASK=0xf  ; mask to extract name len 
        KW_TYPE_MASK=0xf0 ; mask to extract keyword type 


	STACK_SIZE=140
	STACK_EMPTY=RAM_SIZE-1  
        CELL_SIZE=3
        XSTACK_SIZE=20 ; 20 * int24
        XSTACK_EMPTY=STACK_EMPTY-STACK_SIZE 
	FRUN=0 ; flags run code in variable flags
	FTRAP=1 ; inside trap handler 
	FLOOP=2 ; FOR loop in preparation 
	FSLEEP=3 ; halt produit par la commande SLEEP 
	FBREAK=4 ; break point flag 
	FCOMP=5  ; compiling flags 
        FLN_REJECTED=6 ; a memory full error occured while in *insert_line*. 
        FTRACE=7 ; trace flag 

        FIRST_DATA_ITEM=6 ; first DATA item offset on line.

	MAX_LINENO=0x7fff; BASIC maximum line number 

	RX_QUEUE_SIZE=8 

        TIM2_CLK_FREQ=62500

	TIB_SIZE=80
        PAD_SIZE=BLOCK_SIZE 

        NAME_MAX_LEN=15  ; CONST and DIM variables maximum length 
        REC_XTRA_BYTES=5 
        REC_LEN_MASK=31

        STDOUT=1 ; output to uart1 
        BUFOUT=3 ; buffered output  

;--------------------------------------
;   constantes related to Arduino 
;   API mapping 
;-------------------------------------
        INP=0
        OUTP=1 

;--------------------------------------
;       token attribute
;--------------------------------------
        ; bits 4:5 identify token group 
        ; 0x0n -> miscelinous 
        ; 0x1n -> +|- operators 
        ; 0x2n -> *|/|% operators
        ; 0x3n -> relational operators 
        TK_CMD=128      ; BASIC command   
        TK_IFUNC=129    ; BASIC integer function
        TK_CFUNC=130    ; BASIC character function
        TK_CONST=131    ; BASIC constant 
        TK_INTGR=132    ; 16 bits integer 
        TK_VAR=133
        TK_FLOAT=134    ; float32 
        TK_NOT=135
        TK_AND=136      ;
        TK_OR=137       ;
        TK_XOR=138      ; 
        TK_NONE=0       ; not a token 
        TK_QSTR=2       ; quoted string  
        TK_LABEL=3      ; used for defined, constants, variables
        TK_CHAR=4       ; ASCII character 
        TK_ARRAY=5      ; array variable '@' 
        TK_LPAREN=6     ; left parenthesis '('
        TK_RPAREN=7     ; right parenthesis ')'
        TK_COMMA=8      ; item separator ',' 
        TK_COLON=9      ; command separator ':' 
        TK_SEMIC=10     ; used in PRINT command.  ';' 

        TK_PLUS=0x10    ; addition operator '+'
        TK_MINUS=0x11   ; subtraction operator '-'
        TK_MULT=0x20    ; multiplication operator '*'
        TK_DIV=0x21     ; division operator '/'
        TK_MOD=0x22     ; modulo operator '%'

        ; don't change these token values 
        ; values chosen to be used as a mask.
        ; bit 7   1 for dictionary words else 0 
        ; bits 6  always 0 
        ; bits 5:4 identify group 
        ; bits 3:0 token identifier inside group  
        TK_GT=0x31      ; relation operator '>'
        TK_EQUAL=0x32   ; assignment or relation operator '='
        TK_GE=0x33      ; relation operator '>='
        TK_LT=0x34      ; relation operator '<'
        TK_LE=0x36      ; relation operator '<='
        TK_NE=0x35      ; relation operator '<>' not equal 
        ; token groups 
        TK_GRP_MASK=0x30 ; groups bits selector 
        TK_GRP_MISC=0x00 ; miscelinous group 
        TK_GRP_ADD=0x10  ; additive operators
        TK_GRP_MULT=0x20 ; multiplicative operators
        TK_GRP_RELOP=0x30 ;relational operators. 
        CMD_END=2 

;--------------------------------------
;   error codes 
;--------------------------------------
    ERR_NONE=0
    ERR_MEM_FULL=1 
    ERR_SYNTAX=2
    ERR_MATH_OVF=3
    ERR_DIV0=4 
    ERR_NO_LINE=5
    ERR_RUN_ONLY=6
    ERR_CMD_ONLY=7
    ERR_DUPLICATE=8
    ERR_NOT_FILE=9
    ERR_BAD_VALUE=10
    ERR_NO_ACCESS=11
    ERR_NO_DATA=12 
    ERR_NO_PROG=13
    ERR_NO_FSPACE=14
    ERR_BUF_FULL=15
    ERR_OVERFLOW=16 
    ERR_RD_ONLY=17
    ERR_NO_PROGRAM=18

;--------------------------------------
;   assembler flags 
;-------------------------------------
;    MATH_OVF=0 ; if 1 the stop on math overflow 

     .macro _usec_dly n 
    ldw x,#(16*n-2)/4
    decw x
    nop 
    jrne .-4
    .endm 
    
    ; load X register with 
    ; entry point of dictionary
    ; before calling 'search_dict'
    .macro _ldx_dict dict_name
    ldw x,#dict_name+2
    .endm 

    ; reset BASIC pointer
    ; to beginning of last token
    ; extracted except if it was end of line 
    .macro _unget_token 
     mov in,in.saved  
    .endm


    ; extract code address for 
    ; TK_CMD|TK_FUNC|TK_IFUNC|TK_CFUNC 
    .macro _get_code_addr
        ldw x,(x)
        inc in 
        inc in 
    .endm 



;---------------------------------------
;    xtack manipulation macros 
;    Y is used as xstack pointer  
;----------------------------------------
    ; pop in A:X from XSTACK 
    .macro _xpop 
    ld a,(y)
    ldw x,y 
    ldw x,(1,x)
    addw y,#CELL_SIZE 
    .endm 

    ; push A:X  to XSTACK 
    .macro _xpush 
    subw y,#CELL_SIZE
    ld (y),a 
    ldw (1,y),x 
    .endm 

    ; drop from XSTACK 
    .macro _xdrop 
    addw y,#CELL_SIZE 
    .endm 

    ; @T fetch top xstack 
    .macro _at_top
    ld a,(y)
    ldw x,y 
    ldw x,(1,x)
    .endm 

    ; @N  fetch next on xstack 
    .macro _at_next 
    ld a,(3,y)
    ldw x,y 
    ldw x,(4,x)
    .endm 

    ; !T put on top of xtack 
    .macro _store_top 
    ld (y),a 
    ldw (1,y),x     
    .endm 

    ; !N put next on xstack 
    .macro _store_next 
    ld (3,y),a 
    ldw (4,y),x 
    .endm 
