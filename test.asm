;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   24 bits integers arithmetic 
;  format in registers A:X 
;    A   bits 31..24  
;    X   bits 23..0 
;  acc24  24 bits accumulator 
;  used in computation 
;  unless otherwise mentionned 
;  hold result. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .area CODE 

.if DEBUG 
;;;;;;;;;;;;;;;;;;;;;;;;
;;;    TEST  CODE   ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;

LOOP_CNT=10000
VAL1=0x2ffff ; 196607
VAL2=0x2a    ; 42  
VAL3=3 
VAL4=0X5FF   ; 1535 
VAL5=-3 
; test code
    T=1    ; .word 
    CNTR=3 ; .word 
    A32=5  ; .blkw 2
    VSIZE= 8 
test:
    _vars VSIZE 
    ldw x,#LOOP_CNT
    ldw (CNTR,sp),x  
    ldw x,ticks 
    ldw (T,sp),x
1$: ; test add24 
    ld a,#(VAL1>>16)&0XFF
    ldw x,#VAL1&0XFFFF
    ld acc24,a 
    ldw acc24+1,x  
    ld a,#(VAL4>>16)&0XFF
    ldw x,#(VAL4&0XFFFF)
    call add24 
    ldw x,(CNTR,sp)
    subw x,#1
    ldw (CNTR,sp),x 
    jrne 1$
    call prt_acc24
    ld a,#SPACE 
    call putc 
    ldw x,ticks 
    subw x,(T,sp)
    call prt_i16  
    ld a,#CR 
    call putc

; test mul24     
    ldw x,LOOP_CNT
    ldw (CNTR,sp),x 
    ldw x,ticks 
    ldw (T,sp),x 
2$: 
    ld a,#(VAL1>>16)&0XFF
    ldw x,#VAL1&0XFFFF
    ld acc24,a 
    ldw acc24+1,x  
    ld a,#(VAL2>>16)&0XFF
    ldw x,#(VAL2&0XFFFF)
    call mul24 
    ldw x,(CNTR,sp)
    subw x,#1
    ldw (CNTR,sp),x 
    jrne 2$ 
   call prt_acc24 
   ld a,#SPACE 
   call putc 
    ldw x,ticks 
    subw x,(T,sp)
    call prt_i16 
    ld a,#CR 
    call putc 
; test mul24 with overflow     
    ldw x,LOOP_CNT
    ldw (CNTR,sp),x 
    ldw x,ticks 
    ldw (T,sp),x 
3$: 
    ld a,#(VAL1>>16)&0XFF
    ldw x,#VAL1&0XFFFF
    ld acc24,a 
    ldw acc24+1,x  
    ld a,#(VAL4>>16)&0XFF
    ldw x,#(VAL4&0XFFFF)
    call mul24 
    ldw x,(CNTR,sp)
    subw x,#1
    ldw (CNTR,sp),x 
    jrne 3$ 
    call prt_acc24    
    ld a,#SPACE 
    call putc 
    ldw x,ticks 
    subw x,(T,sp)
    call prt_i16 
    ld a,#CR 
    call putc 
; test mul24  with negative result   
    ldw x,LOOP_CNT
    ldw (CNTR,sp),x 
    ldw x,ticks 
    ldw (T,sp),x 
4$:
    ld a,#(VAL1>>16)&0XFF
    ldw x,#VAL1&0XFFFF
    ld acc24,a 
    ldw acc24+1,x  
    ld a,#(VAL5>>16)&0XFF
    ldw x,#(VAL5&0XFFFF)
    call mul24 
    ldw x,(CNTR,sp)
    subw x,#1
    ldw (CNTR,sp),x 
    jrne 4$ 
    call prt_acc24 
    ld a,#SPACE 
    call putc 
    ldw x,ticks 
    subw x,(T,sp)
    call prt_i16 
    ld a,#CR 
    call putc 
; test abs24 
    ldw x,LOOP_CNT
    ldw (CNTR,sp),x 
    ldw x,ticks 
    ldw (T,sp),x 
5$: 
    ld a,#0xff
    ldw x,#0xffff
    call abs24 
    ld acc24,a 
    ldw acc24+1,x
    ldw x,(CNTR,sp)
    subw x,#1
    ldw (CNTR,sp),x 
    jrne 5$ 
    call prt_acc24 
    ld a,#SPACE 
    call putc 
    ldw x,ticks 
    subw x,(T,sp)
    call prt_i16 
6$:
    ld a,#CR 
    call putc 
    call read_integer 
    mov farptr,acc24 
    mov farptr+1,acc16 
    mov farptr+2,acc8 
    call read_integer 
    ld a,acc24 
    ldw x,acc16 
    mov acc24,farptr 
    mov acc16,farptr+1
    mov acc8,farptr+2 
    call div24 
    push a 
    pushw x 
    call prt_acc24 
    ld a,#SPACE 
    call putc 
    popw x
    ldw acc16,x  
    pop acc24 
    call prt_acc24
    jra 6$
    _drop VSIZE 
    ret 


read_integer:
    ld a,#'? 
    call putc  
	clr count  
	call readln 
	ldw x,#tib 
	push count
	push #0 
	addw x,(1,sp)
	incw x 
	_drop 2 
	clr in 
	call get_token
	cp a,#TK_INTGR
	jreq 3$ 
	cp a,#TK_MINUS
	call get_token 
	cp a,#TK_INTGR 
	jreq 2$
	jp syntax_error
2$:
	call neg_acc24  	
3$: 
    ret 

.endif ; DEBUG  
