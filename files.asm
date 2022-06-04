;;;;;;;;;;;;;;;;;;;;;;;;;
;  file system routines
;  MCU flash memory from
;  0x10000-0x27fff is 
;  used to store BASIC 
;  program files. 
;  use 128 bytes sectors
;  because this is the MCU 
;  row size.
;  file entry aligned to row
;  	name  variable length
;  	size  2 bytes  
; 	data  variable length 
;;;;;;;;;;;;;;;;;;;;;;;;;

;---------------------------
; fill pad with zeros 
;--------------------------
zero_pad:
	ldw x,#pad 
	ld a,#PAD_SIZE 
1$:	clr (x)
	incw x 
	dec a 
	jrne 1$
	ret 

;--------------------------
; align farptr to BLOCK_SIZE 
;---------------------------
row_align:
	ld a,#0x7f 
	and a,farptr+2 
	jreq 1$ 
	ldw x,farptr+1 
	addw x,#BLOCK_SIZE 
	jrnc 0$
	inc farptr 
0$: ld a,xl 
	and a,#0x80
	ld xl,a
	ldw farptr+1,x  	
1$:	ret

;--------------------
; input:
;   X     increment 
; output:
;   farptr  incremented 
;---------------------
incr_farptr:
	addw x,farptr+1 
	jrnc 1$
	inc farptr 
1$:	ldw farptr+1,x  
	ret 

;------------------------------
; extended flash memory used as FLASH_DRIVE 
; seek end of used flash drive   
; starting at 0x10000 address.
; 4 consecutives 0 bytes signal free space. 
; input:
;	none
; output:
;   ffree     free_addr| 0 if memory full.
;------------------------------
seek_fdrive:
; start scan at 0x10000 address 
	ld a,#1
	ld farptr,a 
	clrw x 
	ldw farptr+1,x 
1$:
	ldw x,#3  
2$:	ldf a,([farptr],x) 
	jrne 3$
	decw x
	jrpl 2$
	jra 4$ 
3$:	ldw x,#BLOCK_SIZE 
	call incr_farptr
	ldw x,#0x280  
	cpw x,farptr
	jrugt 1$
4$: ; copy farptr to ffree	 
	ldw x,farptr 
	ld a,farptr+2 
	ldw ffree,x 
	ld ffree+2,a  
	ret 

;-----------------------
; return amount of free 
; space on flash drive
; input:
;   none
; output:
;   acc24   free space 
;-----------------------
disk_free:
	ldw x,#0x8000
	subw x,ffree+1
	ld a,#2
	sbc a,ffree 
	ld acc24,a 
	ldw acc16,x 
	ret 

;-----------------------
; compare file name 
; with name pointed by Y  
; input:
;   farptr   file name 
;   Y        target name 
; output:
;   farptr 	 at file_name
;   X 		 farptr[x] point at size field  
;   Carry    0|1 no match|match  
;----------------------
cmp_name:
	clrw x
1$:	ldf a,([farptr],x)
	cp a,(y)
	jrne 4$
	tnz a 
	jreq 9$ 
    incw x 
	incw y 
	jra 1$
4$: ;no match 
	tnz a 
	jreq 5$
	incw x 
	ldf a,([farptr],x)
	jra 4$  
5$:	incw x ; farptr[x] point at 'size' field 
	rcf 
	ret
9$: ; match  
	incw x  ; farptr[x] at 'size' field 
	scf 
	ret 

;-----------------------
; search file in 
; flash memory 
; input:
;   Y       file name  
; output:
;   farptr  addr at name|0
;   X       offset to size field
;   Carray   0 not found, 1 found 
;-----------------------
	FSIZE=1
	YSAVE=3
	VSIZE=4 
search_file: 
	_vars VSIZE
	ldw (YSAVE,sp),y  
	clrw x 
	ldw farptr+1,x 
	mov farptr,#1
1$:	
; check if farptr is after any file 
; if  0 then so.
	ldf a,[farptr]
	jreq 6$
2$: clrw x 	
	ldw y,(YSAVE,sp) 
	call cmp_name
	jrc 9$
	ldf a,([farptr],x)
	ld (FSIZE,sp),a 
	incw x 
	ldf a,([farptr],x)
	ld (FSIZE+1,sp),a 
	incw x 
	addw x,(FSIZE,sp) ; skip over file data
	call incr_farptr
	call row_align  
	ldw x,#0x280
	cpw x,farptr 
	jrpl 1$
6$: ; file not found 
	clr farptr
	clr farptr+1 
	clr farptr+2 
	_drop VSIZE 
	rcf
	ret
9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
	_drop VSIZE 
	scf 	
	ret

;--------------------------------
; BASIC: SAVE "name" 
; save text program in 
; flash memory used as permanent
; storage from address 0x10000-0x27fff 
;--------------------------------
	BSIZE=1
	NAMEPTR=3
	XSAVE=5
	YSAVE=7
	VSIZE=8 
save:
	btjf flags,#FRUN,0$ 
	ld a,#ERR_CMD_ONLY 
	jp tb_error
0$:	 
	ldw x,txtend 
	subw x,txtbgn
	jrne 1$
; nothing to save 
	ldw x,#err_no_prog 
	call puts 
	mov in,count 
	ret  	
1$:	
	_vars VSIZE 
	ldw (BSIZE,sp),x 
	call next_token	
	cp a,#TK_QSTR
	jreq 2$
	jp syntax_error
2$: 
	ldw (NAMEPTR,sp),x  
	call move_prg_to_ram ; move flashing program to 'tib' buffer 
; check if enough free space 
	ldw x,(NAMEPTR,sp)
	call strlen 
	add a,#3
	clrw x 
	ld xl,a 
	addw x,(BSIZE,sp)
	clr a 
	addw x,ffree+1 
	adc a,ffree 
	cp a,#2
	jrmi 21$
	cpw x,#0x8000
	jrmi 21$
	ld a,#ERR_NO_FSPACE  
	jp tb_error
21$: 
; check for existing file of that name 
	ldw y,(NAMEPTR,sp)	
	call search_file 
	jrnc 3$ 
	ld a,#ERR_DUPLICATE 
	jp tb_error 
3$:	; initialize farptr 
	ldw x,ffree 
	ld a,ffree+2 
	ldw farptr,x 
	ld farptr+2,a 
;** write file name to row buffer **	
	ldw y,(NAMEPTR,sp)  
	ldw x,#pad 
	call strcpy
	call strlen 
	clrw x 
	ld xl,a 
	incw  x
	addw x,#pad 
; ** write file size to row buffer 
	ldw y,(BSIZE,sp)
	ldw (x),y 
	addw x,#2 
; ** write file data to row buffer 
	ldw y,txtbgn 
6$:	ld a,(y)
	incw y
	ld (x),a 
	incw x
	cpw y,txtend 
	jreq 12$
	cpw x,#stack_full 
	jrmi 6$
12$:
	ldw (YSAVE,sp),y 
14$: ; zero buffer end 
	cpw x,#stack_full
	jreq 16$
	clr (x)
	incw x 
	jra 14$
16$:
	ldw x,#pad 
	call write_row 
	ldw x,#BLOCK_SIZE 
	call incr_farptr
	ldw x,#pad 
	ldw y,(YSAVE,sp)
	cpw y,txtend 
	jrmi 6$
; save farptr in ffree
	ldw x,farptr 
	ld a,farptr+2 
	ldw ffree,x 
	ld ffree+2,a
; print file size 	
	ldw x,(BSIZE,sp) 
	call print_int 
	_drop VSIZE 
	ret 

;----------------------
; load file in RAM memory
; input:
;    farptr point at file size 
; output:
;   y point after BASIC program in RAM.
;------------------------
load_file:
	call incr_farptr  
	call clear_basic  
	clrw x
	ldf a,([farptr],x)
	ld yh,a 
	incw x  
	ldf a,([farptr],x)
	incw x 
	ld yl,a 
	addw y,txtbgn
	ldw txtend,y
	ldw y,txtbgn
3$:	; load BASIC text 	
	ldf a,([farptr],x)
	ld (y),a 
	incw x 
	incw y 
	cpw y,txtend 
	jrmi 3$
	ret 

;------------------------
; BASIC: LOAD "file" 
; load file to RAM 
; for execution 
;------------------------
load:
	btjf flags,#FRUN,0$ 
	jreq 0$ 
	ld a,#ERR_CMD_ONLY 
	jp tb_error 
0$:	
	call next_token 
	cp a,#TK_QSTR
	jreq 1$
	jp syntax_error 
1$:	ldw y,x 
	call search_file 
	jrc 2$ 
	ld a,#ERR_NOT_FILE
	jp tb_error  
2$:
	call load_file
; print loaded size 	 
	ldw x,txtend 
	subw x,txtbgn
	call print_int 
	ret 

;-----------------------------------
; BASIC: FORGET ["file_name"] 
; erase file_name and all others 
; after it. 
; without argument erase all files 
;-----------------------------------
	NEW_FREE=1   ; free address after file delete
	BLOCK_COUNT=4  ; how many rows to delete
	VSIZE=5 
forget:
	_vars VSIZE 
	call next_token 
	cp a,#TK_NONE 
	jreq 2$ 
	cp a,#TK_QSTR
	jreq 1$
	jp syntax_error
1$: ldw y,x 
	mov in,count 
	call search_file
	jrc 3$
	ld a,#ERR_NOT_FILE 
	jp tb_error 
2$: 
	ldw x,#0x100
	clr a 
	ldw farptr,x 
	ld farptr+2,a 
3$:	ld a,farptr+2 
	ldw x,farptr 
; save new free address 
	ldw (NEW_FREE,sp),x
	ld (NEW_FREE+2,sp),a 
; count blocks to erase 
	ld a,ffree+2 
	ldw x,ffree 
	sub a,farptr+2 
	jrnc 4$
	decw x 
4$:	subw x,farptr 
; X= X:A/BLOCK_SIZE 
	sll a 
	rlcw x 
	ldw (BLOCK_COUNT,sp),x
	call move_erase_to_ram
5$: ldw x,(BLOCK_COUNT,sp)
	tnzw x
	jreq 6$
	call block_erase 
	ldw x,#BLOCK_SIZE 
	call incr_farptr 
	ldw x,(BLOCK_COUNT,sp)
	decw x 
	ldw (BLOCK_COUNT,sp),x
	jra 5$  
; save new free address
6$:	ld a,(NEW_FREE+2,sp)
	ldw x,(NEW_FREE,sp)
	ld ffree+2,a 
	ldw ffree,x 
	_drop VSIZE 
	ret 

;----------------------
; BASIC: DIR 
; list saved files 
;----------------------
	COUNT=1 ; files counter 
	VSIZE=2 
directory:
	_vars VSIZE 
	clrw x 
	ldw (COUNT,sp),x 
	ldw farptr+1,x 
	mov farptr,#1 
dir_loop:
	clrw x 
	ldf a,([farptr],x)
	jreq 8$ 
1$: ;name loop 	
	ldf a,([farptr],x)
	jreq 2$ 
	call putc 
	incw x 
	jra 1$
2$: incw x ; skip ending 0. 
	ld a,#SPACE 
	call putc 
; get file size 	
	ldf a,([farptr],x)
	ld yh,a 
	incw x 
	ldf a,([farptr],x)
	incw x 
	ld yl,a 
	pushw y 
	addw x,(1,sp)
; skip to next file 
	call incr_farptr
	call row_align
; print file size 
	popw x ; file size 
	call print_int 
	ld a,#CR 
	call putc
	ldw x,(COUNT,sp)
	incw x
	ldw (COUNT,sp),x  
	jra dir_loop
8$: ; print number of files 
	ldw x,(COUNT,sp)
	call print_int 
	ldw x,#file_count 
	call puts  
; print drive free space 	
	call disk_free
	clrw x  
	mov base,#10 
	call prti24 
	ldw x,#drive_free
	call puts 
	_drop VSIZE 
	ret
file_count: .asciz " files\n"
drive_free: .asciz " bytes free\n" 
