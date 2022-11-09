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

    EOF=0xff ; end of file marker
    
    TYPE_MASK=0xf0 ; mask to extract data type, i.e. DIM variable symbol  or CONST symbol 
    TYPE_DVAR=(1<<4); DIM variable type 
    TYPE_CONST=(2<<4); CONST data 
    NLEN_MASK=0xf  ; mask to extract name len 
    NONE_IDX = 255 ; not a token 


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
    jrne .-2
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
    .byte 0x45,bp.saved, basicptr ; mov basicptr,bp.saved ; 1 cy, 3 bytes 
    .byte 0x45,bp.saved+1,basicptr+1 ; mov basicptr+1,bp.saved+1 
    .endm

    ;  increment variable in page 0 
    .macro _inc v 
        .byte 0x3c, v 
    .endm 

    ;  increment 16 bits variable 
    .macro _incw  v 
        inc v+1 
        jrne .+4 
        inc v 
    .endm 

    ; extract 16 bits address from BASIC code  
    .macro _get_addr
        pushw y 
        ldw y,x 
        ldw x,(x)
        addw y,#2 
        ldw basicptr,y
        popw y 
    .endm 

    ; extract character from BASIC code 
    .macro _get_char 
        ld a,(x)
        incw x 
        ldw basicptr,x  
    .endm 
    
    ; get code address from index in a 
    .macro _code_addr
    sll a 
    clrw x 
    ld xl,a 
    ldw x,(code_addr,x)
    .endm 

;---------------------------------------
;    xtack manipulation macros 
;    Y is used as xstack pointer  
;----------------------------------------
    ; pop in A:X from XSTACK 
    .macro _xpop 
    ld a,(y)
    ldw x,y 
    addw y,#CELL_SIZE 
; last op in macro 
; so no need to do a tnzw x 
; after macro invocation
    ldw x,(1,x) 
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

    ; !T put on top of xtack 
    .macro _store_top 
    ld (y),a 
    ldw (1,y),x     
    .endm 

    ; @N  fetch next on xstack 
    .macro _at_next 
    ld a,(3,y)
    ldw x,y 
    ldw x,(4,x)
    .endm 

    ; !N put next on xstack 
    .macro _store_next 
    ld (3,y),a 
    ldw (4,y),x 
    .endm 
