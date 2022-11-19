;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Copyright Jacques Deschênes 2019,2022  
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;----------------------------------
;    file system 
; file header:
;   sign field:  2 bytes .ascii "TB" 
;   program size: 1 word 
;   data: n*BLOCK_SIZE 
;   BLOCK_SIZE is 128 bytes depend 
;   on MCU block erase size. 
;----------------------------------

.if SEPARATE 
    .module FILES
    .include "config.inc"

	.area CODE 
.endif 


NO_LABEL: .asciz "Can't save, program not labeled."
SIGNATURE: .ascii "TB"
ERASED: .ascii "XX" ; erased file, replace signature. 


;-------------------------------
; search a program in flash 
; memory.
; The file name is identified 
; by a label on first line 
; of program.  
; input:
;    x      *name 
; output: 
;    X     prog_data_addr|0
;-------------------------------
	WLKPTR=1 
	PNAME=3
	LIMIT=5
	YSAVE=7
	VSIZE=6 
search_program:
	pushw y 
	_vars VSIZE 
	ldw (PNAME,sp),x 
	ldw x,#0xFFFF  
	ldw (LIMIT,sp),x ; search end address 
	ldw x,#app_space ; search start address 
1$:	ldw (WLKPTR,sp),x  
    ldw x,(x)
    jreq 8$ ; end of search 
    ldw x,(WLKPTR,sp)  
	_qsign ; query signature  
    jrne 4$
	ld a,(FILE_DATA+LINE_HEADER_SIZE,x)
	cp a,#LABEL_IDX 
	jrne 4$ 
	addw x,#FILE_DATA+LINE_HEADER_SIZE+1 ; label string  
	ldw y,(PNAME,sp)
	call strcmp
	jreq 6$
4$: ; erased file ignore it. 
	call skip_to_next
	cpw x,(LIMIT,sp)
	jrult 1$
	clrw x 
	jra 8$
6$: ; found label 
	ldw x,(WLKPTR,sp)
8$:	
	_drop VSIZE  
	popw y 
	ret 

;-----------------------------------
; erase program file
; keep signature and size fields. 
; signature replaced by "XX"
; input:
;    X    *address, point to signature  
;-----------------------------------
	ADDR=1    ; program address
	PRG_SIZE=3    ; program size 
	BLOCKS=5 ; blocks to erase 
	VSIZE=6
erase_file:
	call move_erase_to_ram
	_clrz farptr 
	_vars VSIZE 
1$:	 
	ldw (ADDR,sp),x
	ldw x,(FILE_SIZE_FIELD,x)
	ldw (PRG_SIZE,sp),x
	ld a,#BLOCK_SIZE 
	div x,a 
	tnz a ; test for remainder 
	jreq 2$ 
	incw x ; 1 more block to erase 
2$:	ldw (BLOCKS,sp),x 
	ldw x,(ADDR,sp)
	ldw ptr16,x 
3$:	ld a,#'E 
	call putc 
	call block_erase
	ldw x,#BLOCK_SIZE 
	call incr_farptr
	ldw x,(BLOCKS,sp)
	decw x 
	ldw (BLOCKS,sp),x 
	jrne 3$ 
; write XX and size at addr 
	ldw x,(ADDR,sp)
	ldw ptr16,x 
	ld a,#'X 
	clrw x 
	call write_byte 
	call write_byte 
	ld a,(PRG_SIZE,sp)
	call write_byte 
	ld a,(PRG_SIZE+1,sp)
	call write_byte 
	_drop VSIZE 
9$:	
	ret 

;--------------------------------------
;  fill write buffer 
;  input:
;    y  point to output buffer 
;    x  point to source 
;    a  bytes to write in buffer 
;  output:
;    y   += A 
;    X   += A 
;    A   0 
;---------------------------------------
fill_write_buffer:
	push a 
	tnz a 
	jreq 9$ 
1$: ld a,(x)
	incw x 
	ld (y),a 
	incw y 
	dec (1,sp) 
	jrne 1$ 
9$:	pop a 
    ret 	

;--------------------------------------
;  fill pad buffer with zero 
;  input:
;	none 
;  output:
;    y     buffer address  
;--------------------------------------
clear_block_buffer:
	push a 
	ldw y,#block_buffer 
	pushw y
	ld a,#BLOCK_SIZE   
1$:	clr (y)
	incw y
	dec a  
	jrne 1$ 	
9$: popw y 
	pop a 			
	ret 


;----------------------------------
;  search  a free space space that 
;  fit program size 
; input:
;    X    program data size 
; output:
;    X    address | 0 
;------------------------------------
	PG_SIZE=1 
	VSIZE=2 
search_fit:
    addw x,#FILE_HEADER_SIZE 
	pushw x; PG_SIZE 
	ldw x,#app_space 
1$:	_is_erased 
	jreq 4$
	ld a,(x)
	or a,(1,x)
	jreq 5$ ; free space, end of search 
2$:	call skip_to_next
	tnzw x  ; 
	jreq 9$ ; end of memory
    jra 1$
4$: ; erased program 
    ; does it fit? 
	ldw acc16,x 
	ldw x,(FILE_SIZE_FIELD,x) ; size erased program
; top multiple of BLOCK_SIZE 
	addw x,#FILE_HEADER_SIZE 
	addw x,#BLOCK_SIZE-1 
	ld a,xl 
	and a,#BLOCK_SIZE 
	ld xl,a  
	cpw x,(PG_SIZE,sp) ; size program to save 
	jruge 8$   ; fit 
	_ldxz acc16 
	jra 2$
; is free space large enough?
5$: ldw acc16,x  
    ldw x,#0xFFFF
    subw x,acc16 
    incw x ; because limit is 0x10000 not 0xffff 
    cpw x,(PG_SIZE,sp)
    jruge 8$
    clrw x 
    jra 9$
8$: _ldxz acc16 ; fit in this one 	
9$:	_drop VSIZE 
	ret  

;-------------------------
; erase header and 
; size fields 
; input: 
;    X    program address 
; output:
;    X    unchanged 
;-------------------------
	COUNT=1 
erase_header:
	pushw x 
	push #FILE_HEADER_SIZE ; COUNT 
	_clrz farptr 
	ldw ptr16,x 
	clr a 
	clrw x 
1$:	call write_byte 
	dec (COUNT,sp)
	jrne 1$
	_drop 1 
	popw x 
	ldw ptr16,x 
	ret 

;----------------------------
;  skip to next program
;  block 
; input:
;    X   actual file program addr
; output:
;    X   next block 
;        after program 
;----------------------------
skip_to_next:
	ldw acc16, x  
	ldw x,(FILE_SIZE_FIELD,x) ; data size 
	addw x,#FILE_HEADER_SIZE  
	addw x,acc16 
; align to next block 
	addw x,#BLOCK_SIZE-1 
	ld a,xl 
	and a,#BLOCK_SIZE 
	ld xl,a 
	ret 


