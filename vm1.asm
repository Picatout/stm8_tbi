;;
; Copyright Jacques Deschênes 2019 
; This file is part of PABasic 
;
;     PABasic is free software: you can redistribute it and/or modify
;     it under the terms of the GNU General Public License as published by
;     the Free Software Foundation, either version 3 of the License, or
;     (at your option) any later version.
;
;     PABasic is distributed in the hope that it will be useful,
;     but WITHOUT ANY WARRANTY; without even the implied warranty of
;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;     GNU General Public License for more details.
;
;     You should have received a copy of the GNU General Public License
;     along with PABasic.  If not, see <http://www.gnu.org/licenses/>.
;;
;--------------------------------------
;   Implementation of virtual machine for Tiny BASIC
;   REF: https://en.wikipedia.org/wiki/Li-Chen_Wang#Palo_Alto_Tiny_BASIC
;   Palo Alto BASIC is 4th version of TinyBasic
;   DATE: 2019-12-17
;
;--------------------------------------------------
;  X registre de travail
;  Y compteur ordinal de la VM 
;  A registre de travail
;  acc16  accumulateur 
;  ptr16  pointeur 16 bits 
;--------------------------------------------------

    .module VM1 

    .nlist
	.include "inc/nucleo_8s208.inc"
	.include "inc/stm8s208.inc"
	.include "inc/ascii.inc"
	.include "inc/gen_macros.inc" 
;	.include "pab_macros.inc" 
    .include "bytecode.inc"
    .list 

;_dbg 

;--------------------------------------
    .area DATA 
;--------------------------------------	
    TOS=1 ; offset top of stack 
    N=3 ; offset second element on stack
    CELLL=2 ; cell length  2 bytes 

	TIB_SIZE=80
    PAD_SIZE=40
;	DSTACK_SIZE=64 
	STACK_SIZE= 192 ;128
	STACK_EMPTY=RAM_SIZE-1  
	FRUN=0 ; flags run code in variable flags
	FTRAP=1 ; inside trap handler 
	FFOR=2 ; FOR loop in preparation 
	FSLEEP=3 ; halt produit par la commande SLEEP 
	FBREAK=4 ; break point flag 
	FCOMP=5  ; compiling flags 

in.w:  .blkb 1 ; parser position in text line
in:    .blkb 1 ; low byte of in.w
count: .blkb 1 ; length of string in text line  
basicptr:  .blkb 2  ; point to text buffer 
lineno: .blkb 2  ; BASIC line number 
base:  .blkb 1 ; nemeric base used to print integer 
acc24: .blkb 1 ; 24 accumulator
acc16: .blkb 1
acc8:  .blkb 1
ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
seedx: .blkw 1  ; xorshift 16 seed x 
seedy: .blkw 1  ; xorshift 16 seed y 
in.w.saved: .blkw 1 ; set by get_token before parsing next token, used by unget_token
farptr: .blkb 1 ; far pointer used by file system
ptr16:  .blkb 1 ; middle byte of farptr
ptr8:   .blkb 1 ; least byte of farptr 
ffree: .blkb 3 ; flash free address ; file system free space pointer
dstkptr: .blkw 1  ; data stack pointer 
txtbgn: .ds 2 ; BASIC text beginning address 
txtend: .ds 2 ; BASIC text end address 
loop_depth: .ds 1 ; FOR loop depth, level of nested loop.  
array_addr: .ds 2 ; address of @ array 
array_size: .ds 2 ; array size 
flags: .ds 1 ; boolean flags
tab_width: .ds 1 ; print colon width (4)
vars: .ds 2*26 ; BASIC variables A-Z, keep it as but last .
; keep as last variable 
free_ram: ; from here RAM free for BASIC text 

;-----------------------------------
    .area SSEG (ABS)
;-----------------------------------	
    .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE ;-DSTACK_SIZE 
tib: .ds TIB_SIZE             ; transaction input buffer
pad: .ds PAD_SIZE             ; working buffer
;dstack: .ds DSTACK_SIZE 	  ; data stack used by FOR...NEXT 
;dstack_unf: ; dstack underflow ; data stack bottom 
stack_full: .ds STACK_SIZE   ; control stack 
stack_unf: ; stack underflow ; control_stack bottom 


;--------------------------------------
    .area HOME 
;--------------------------------------
    DEBUG=0
    int cold_start
.if DEBUG
	int TrapHandler 		;TRAP  software interrupt
.else
	int NonHandledInterrupt ;TRAP  software interrupt
.endif
	int NonHandledInterrupt ;int0 TLI   external top level interrupt
	int NonHandledInterrupt ;int1 AWU   auto wake up from halt
	int NonHandledInterrupt ;int2 CLK   clock controller
	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
	int NonHandledInterrupt ;int8 beCAN RX interrupt
	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
	int NonHandledInterrupt ;int10 SPI End of transfer
	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
	int NonHandledInterrupt ;int12 TIM1 capture/compare
	int NonHandledInterrupt ;int13 TIM2 update /overflow
	int NonHandledInterrupt ;int14 TIM2 capture/compare
	int NonHandledInterrupt ;int15 TIM3 Update/overflow
	int NonHandledInterrupt ;int16 TIM3 Capture/compare
	int NonHandledInterrupt ;int17 UART1 TX completed
	int NonHandledInterrupt ;int18 UART1 RX full
	int NonHandledInterrupt ;int19 I2C 
	int NonHandledInterrupt ;int20 UART3 TX completed
	int NonHandledInterrupt ;int21 UART3 RX full
	int NonHandledInterrupt ;int22 ADC2 end of conversion
	int Timer4UpdateHandler	;int23 TIM4 update/overflow used as msec ticks counter
	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
	int NonHandledInterrupt ;int25  not used
	int NonHandledInterrupt ;int26  not used
	int NonHandledInterrupt ;int27  not used
	int NonHandledInterrupt ;int28  not used
	int NonHandledInterrupt ;int29  not used

;---------------------------------------
    .area CODE
;---------------------------------------
.if DEBUG
.asciz "VM1" ; I like to put module name here.
.endif 

NonHandledInterrupt:
    .byte 0x71  ; reinitialize MCU


;------------------------------------
; software interrupt handler  
;------------------------------------
.if DEBUG 
TrapHandler:
	bset flags,#FTRAP 
	call print_registers
	call cmd_itf
	bres flags,#FTRAP 	
	iret
.endif 

Timer4UpdateHandler:
	clr TIM4_SR 
	ldw x,ticks
	incw x
	ldw ticks,x 
	iret 


;------------------------------------
; Triggered by pressing USER UserButton 
; on NUCLEO card.
;------------------------------------
UserButtonHandler:
.if DEBUG
; wait button release
	clrw x
1$: decw x 
	jrne 1$
	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
; if MCU suspended by SLEEP resume program
    btjf flags,#FSLEEP,2$
	bres flags,#FSLEEP 
	iret
2$:	btjt flags,#FRUN,4$
	jp 9$ 
4$:	; program interrupted by user 
	bres flags,#FRUN 
	ldw x,#USER_ABORT
	call puts 
	ldw x,basicptr
	ldw x,(x)
; print line number 
	mov base,#10 
	mov tab_width,#6
	call print_int  	
	ldw x,basicptr 
	addw x,#3  
	call puts 
	ld a,#CR 
	call putc
	clrw x  
	ld a,in 
	add a,#3 ; adjustment for line number display 
	ld xl,a 
	call spaces 
	ld a,#'^
	call putc 
9$:
    ldw x,#STACK_EMPTY 
    ldw sp,x
	rim 
	jp warm_start
.else
    iret 
.endif 

USER_ABORT: .asciz "\nProgram aborted by user.\n"


;----------------------------------------
; inialize MCU clock 
; input:
;   A 		source  HSI | 1 HSE 
;   XL      CLK_CKDIVR , clock divisor 
; output:
;   none 
;----------------------------------------
clock_init:	
	cp a,CLK_CMSR 
	jreq 2$ ; no switching required 
; select clock source 
	bset CLK_SWCR,#CLK_SWCR_SWEN
	ld CLK_SWR,a
1$:	cp a,CLK_CMSR
	jrne 1$
2$: 	
; HSI and cpu clock divisor 
	ld a,xl 
	ld CLK_CKDIVR,a  
	ret

;---------------------------------
; TIM4 is configured to generate an 
; interrupt every millisecond 
;----------------------------------
timer4_init:
	mov TIM4_PSCR,#7 ; prescale 128  
	mov TIM4_ARR,#125 ; set for 1msec.
	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
	bset TIM4_IER,#TIM4_IER_UIE 
	ret

;---------------------------------------------
;   UART3 subroutines
;---------------------------------------------

;---------------------------------------------
; initialize UART3, 115200 8N1
; input:
;	none
; output:
;   none
;---------------------------------------------
uart3_init:
	; configure tx pin
	bset PD_DDR,#BIT5 ; tx pin
	bset PD_CR1,#BIT5 ; push-pull output
	bset PD_CR2,#BIT5 ; fast output
uart3_set_baud: 
; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
	ld a,#CLK_SWR_HSI
	cp a,CLK_CMSR 
	jreq hsi_clock 
hse_clock: ; 8 Mhz 	
	mov UART3_BRR2,#0x05 ; must be loaded first
	mov UART3_BRR1,#0x4
	jra uart_enable
hsi_clock: ; 16 Mhz 	
	mov UART3_BRR2,#0x0b ; must be loaded first
	mov UART3_BRR1,#0x08
uart_enable:
    clr UART3_DR
	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
	bset UART3_CR2,#UART_CR2_SBK
    btjf UART3_SR,#UART_SR_TC,.
    ret
	
;---------------------------------
; send character to UART3 
; input:
;   A 
; output:
;   none 
;--------------------------------	
putchar:
    btjf UART3_SR,#UART_SR_TXE,.
	ld UART3_DR,a 
	ret  

;---------------------------------
; wait character from UART3 
; input:
;   none
; output:
;   A 			char  
;--------------------------------	
getchar:
	btjf UART3_SR,#UART_SR_RXNE,.
	ld a,UART3_DR 
    ret 

;---------------------------
; delete character at left 
; of cursor on terminal 
; input:
;   none 
; output:
;	none 
;---------------------------
bksp:
	ld a,#BSP 
	call putchar 
	ld a,#SPACE 
	call putchar 
	ld a,#BSP 
	call putchar 
	ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; machine code routine address
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bytecode: .word bye,putc,getc,puts,delete,spaces,lit,litc,plus,minus,slash
          .word mod,star  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  bytecode interpreter 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
next:
    ld a,(y)
    incw y 
    sll a 
    clrw x 
    ld xl,a
    jp ([bytecode],x) 

; put mcu in lowest power mode 
; until reset 
bye:
    btjf UART3_SR,#UART_SR_TC,.
    sim 
    halt 
    jp cold_start 

; vm subroutine call 
subr: ; { -- }
    ld a,(y)
    incw y 
    ld xh,a 
    ld a,(y)
    incw y 
    ld xl,a 
    pushw y ;save return address 
    exgw x,y ; x become new vm_pc 
    jp next 


; return from vm subroutine
exit: ; { addr -- }
    popw y ; restore vm_pc
    jp next 

; execute routine from stack 
exec: ; { addr_sub -- addr_ret }
    popw x 
    pushw y 
    exgw x,y 
    jp next 

; unconditional jump 
branch: ; { -- }
    ld a,(y)
    incw y 
    ld xh,a 
    ld a,(y)
    ld xl,a 
    exgw x,y 
    jp next 

; branch if TOS==0
zbranch: ; { f -- }
    popw x 
    tnzw 
    jreq branch
    addw y,#2 
    jp next 


;-----------------------------
; send an ASCIZ string to UART3 
; input: 
;   TOS 		char * 
; output:
;   none 
;-------------------------------
puts: ; { .asciz -- }
    popw x 
1$: ld a,(x)
	jreq 2$
    call putchar 
	incw x 
	jra 1$ 
2$:	jp next  


;---------------------------
; delete n character left of cursor 
; at terminal.
; input: 
;   TOS   	number of characters to delete.
; output:
;    none 
;--------------------------	
delete: ; { n -- }
    popw x 
	tnzw x
	jreq 1$
0$:	call bksp 
	decw x
	jrne 0$
1$:	jp next 


;--------------------------
; print n spaces on terminal
; input:
;   TOS 	number of spaces 
; output:
;	none 
;---------------------------
spaces: ; { n -- }
    popw x 
	ld a,#SPACE 
	tnzw x
	jreq 9$
1$:	call putchar  
	decw x
	jrne 1$
9$: 
	jp next 

; print top of stack
; variables 'base' and 'tab_width'
; are used 
prtos: ; { n -- }
    ldw x,(TOS,sp) 
    ldw (TOS,sp),y 
    push #0 
    ld a,xh 
    bcp a,#0x80
    jreq 2$ 
    cpl (1,sp)
    negw x 
2$: ldw y,#pad+PAD_SIZE-1
    clr(y)
3$: ld a,base 
    div x,a 
    add a,#'0 
    cp a,#'9
    jrule 4$
    add a,#7 
4$: decw y 
    ld (y),a 
    tnzw x 
    jrne 3$
    ld a,#16 
    cp a,base 
    jrne 6$
    ld a,#'$ 
    decw y 
    ld a,(y)
    jra 8$ 
6$: tnz (1,sp)
    jreq 8$
    ld a,#'-
    decw y 
    ld (y),a 
8$: ldw x,#pad+PAD_SIZE-1
    subw x,y 
    ld a,xl 
    cp a,tab_width 
    jruge 9$
    ld a,#SPACE 
    decw y 
    ld (y),a  
    jra 8$ 
9$: exgw x,y     
    popw y 
    pushw x 
    jp puts  

lit: ; { -- n }
    ld a,(y)
    incw y 
    ld xh,a 
    ld a,(y)
    incw y 
    ld xl,a 
    pushw x  
    jp next

litc: ; { -- c }
    ld a,(y)
    incw y 
    clrw x 
    ld xl,a 
    pushw x 
    jp next 

plus: ; { n1 n2 -- n1+n2 }
    popw x
    addw x,(TOS,sp)
    ldw (TOS,sp),x 
    jp next

minus: ; {n1 n2 -- n1-n2 }
    ldw x,(N,sp) 
    subw x,(TOS,sp) 
    ldw (N,sp),x 
    _drop 2 
    jp next

slash: ; {n1 n2 -- n1/n2}
    ldw x,(TOS,sp) ; n2 
    ldw (TOS,sp),y 
    exgw x,y 
    ldw x,(N,sp) ; n1 
    divw x,y 
    ldw (N,sp),x ; quotient
    popw y 
    jp next 

mod: ; { n1 n2 -- n1%n2}
    ldw x,(TOS,sp) ; n2 
    ldw (TOS,sp),y 
    exgw x,y 
    ldw x,(N,sp) ; n1 
    divw x,y 
    ldw (N,sp),y ; reste
    popw y 
    jp next 

; unsigned multiply 
; overflow is discarded 
staru: ; {n1 n2 -- n1*n2 }
    ldw x,(TOS,sp) 
    ldw (TOS,sp),y ; 
    ldw acc16,x 
    ld a (N+1,sp)
    mul x,a 
    ldw y,x 
    ld a,acc16 
    ld xl,a 
    ld a,(N+1,sp)
    mul 
    swapw x 
    clr a 
    ld xl,a 
    addw y,x 
    ld a,acc8
    ld xl,a 
    ld a,(N,sp)
    mul 
    swapw x 
    clr a 
    ld xl,a 
    addw y,x 
    ldw (N,sp),y 
    popw y
    jp next 

swap: ; { n1 n2 -- n2 n1 }
    ldw x,(TOS,sp)
    ldw acc16,x 
    ldw x,(N,sp)
    ldw (TOS,sp),x
    ldw x,acc16 
    ldw (N,sp),x 
    jp next 

rot: ;{ n1 n2 n3 -- n3 n1 n2 }


nrot: ; {n1 n2 n3 -- n2 n3 n1 }

;-----------------------------
;  STARTUP CODE
;-----------------------------

cold_start:
    ldw x,#STACK_EMPTY
    ldw sp,x
; clear all ram 
0$: clr (x)
	decw x 
	jrne 0$
; activate pull up on all inputs 
	ld a,#255 
	ld PA_CR1,a 
	ld PB_CR1,a 
	ld PC_CR1,a 
	ld PD_CR1,a 
	ld PE_CR1,a 
	ld PF_CR1,a 
	ld PG_CR1,a 
	ld PI_CR1,a 
; configure LD2 pin 
    bset PC_CR1,#LED2_BIT
    bset PC_CR2,#LED2_BIT
    bset PC_DDR,#LED2_BIT
    bset PC_ODR,#LED2_BIT 
; select internal clock no divisor: 16 Mhz 	
	ld a,#CLK_SWR_HSI 
	clrw x  
    call clock_init 
;    call timer4_init 
; UART3 at 115200 BAUD
    call uart3_init
    rim 
    bres PC_ODR,#LED2_BIT 
    ldw x,#test 
    jp next 
warm_start: 
.asciz "ceci est test\n"
test:
    .byte LITC,'O',PUTC,LITC,'K',PUTC,LITC,10,PUTC,BYE 

    