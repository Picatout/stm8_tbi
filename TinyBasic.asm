;;
; Copyright Jacques Deschênes 2019,2020 
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
;   Implementation of Tiny BASIC
;   REF: https://en.wikipedia.org/wiki/Li-Chen_Wang#Palo_Alto_Tiny_BASIC
;   Palo Alto BASIC is 4th version of TinyBasic
;   DATE: 2019-12-17
;
;--------------------------------------------------

    .module STM8_TBI

    .nlist
	.include "inc/nucleo_8s208.inc"
	.include "inc/stm8s208.inc"
	.include "inc/ascii.inc"
	.include "inc/gen_macros.inc" 
	.include "tbi_macros.inc" 
    .list 

;_dbg 

;--------------------------------------
    .area DATA 
;--------------------------------------	

	TIB_SIZE=80
    PAD_SIZE=128
	STACK_SIZE=160
	STACK_EMPTY=RAM_SIZE-1  
	FRUN=0 ; flags run code in variable flags
	FTRAP=1 ; inside trap handler 
	FLOOP=2 ; FOR loop in preparation 
	FSLEEP=3 ; halt produit par la commande SLEEP 
	FBREAK=4 ; break point flag 
	FCOMP=5  ; compiling flags 
	FAUTORUN=6; auto start program running 

	AUTORUN_NAME=0x4000 ; address in EEPROM where auto run file name is saved 

    FIRST_DATA_ITEM=6 ; first DATA item offset on line.

	MAX_LINENO=0x7fff; BASIC maximum line number 

in.w:  .blkb 1 ; parser position in text line high-byte 
in:    .blkb 1 ; low byte of in.w 
in.saved: .blkb 1 ; set by get_token before parsing next token, used by unget_token
count: .blkb 1 ; current BASIC line length and tib text length  
basicptr:  .blkb 2  ; point to current BASIC line address.
data_ptr:  .blkw 1  ; point to DATA address
data_ofs:  .blkb 1  ; index to next data item 
data_len:  .blkb 1  ; length of data line 
base:  .blkb 1 ; nemeric base used to print integer 
acc24: .blkb 1 ; 24 bit accumulator upper-byte 
acc16: .blkb 1 ; 16 bit accumulator, acc24 high-byte
acc8:  .blkb 1 ;  8 bit accumulator, acc24 low-byte  
ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
timer: .blkw 1 ;  milliseconds count down timer 
seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
ptr16:  .blkb 1 ; 16 bits pointer , farptr high-byte 
ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
ffree: .blkb 3 ; flash free address ; file system free space pointer
txtbgn: .blkw 1 ; tokenized BASIC text beginning address 
txtend: .blkw 1 ; tokenized BASIC text end address 
loop_depth: .blkb 1 ; level of nested loop. Conformity check   
array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
flags: .blkb 1 ; various boolean flags
tab_width: .blkb 1 ; print colon width (default 4)
rx_char: .blkb 1 ; last received character from UART1 
vars: .blkw 26 ; BASIC variables A-Z, keep it as but last .
; keep 'free_ram' as last variable 
free_ram: ; from here RAM free for BASIC text 

;;-----------------------------------
    .area SSEG (ABS)
;; working buffers and stack at end of RAM. 	
;;-----------------------------------
    .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
tib: .ds TIB_SIZE             ; transaction input buffer
pad: .ds PAD_SIZE             ; working buffer
stack_full: .ds STACK_SIZE   ; control stack 
stack_unf: ; stack underflow ; control_stack bottom 

;;--------------------------------------
    .area HOME 
;; interrupt vector table at 0x8000
;;--------------------------------------
    int cold_start			; RESET vector 
.if DEBUG
	int TrapHandler 		;TRAP  software interrupt
.else
	int NonHandledInterrupt ;TRAP  software interrupt
.endif
	int NonHandledInterrupt ;int0 TLI   external top level interrupt
	int AWUHandler          ;int1 AWU   auto wake up from halt
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
	int Uart1RxHandler		;int18 UART1 RX full ; user communication channel.
	int NonHandledInterrupt ;int19 I2C 
	int NonHandledInterrupt ;int20 UART1 TX completed
	int NonHandledInterrupt ;int21 UART1 RX full
	int NonHandledInterrupt ;int22 ADC2 end of conversion
	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
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
.asciz "STM8_TBI" ; I like to put module name here.
.endif 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; non handled interrupt 
; reset MCU
;;;;;;;;;;;;;;;;;;;;;;;;;;;
NonHandledInterrupt:
    .byte 0x71  ; invalid opcode reinitialize MCU

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; auto wakeup from halt
; at iret, program continue 
; after hatl instruction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
AWUHandler:
	bres AWU_CSR,#AWU_CSR_AWUEN
	mov AWU_APR,0x3F
	clr AWU_TBR 
	iret

;--------------------------
; UART1 receive character
; CTRL-C (ASCII 3)
; cancel program execution
; and fall back to command line
;--------------------------
Uart1RxHandler:
	btjf UART1_SR,#UART_SR_RXNE,.
	ld a,UART1_DR 
	cp a,#CTRL_C 
	jrne 1$
	clr rx_char 
	jp user_interrupted
1$:
	cp a,#CAN ; CTRL_X 
	jrne 2$
	jp cold_start 	
2$: 
	cp a,#CTRL_Z
	jrne 3$
	call cancel_autorun 
	jp cold_start 
3$:	ld rx_char,a 	
	iret 

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

;------------------------------
; TIMER 4 is used to maintain 
; a milliseconds 'ticks' counter
; and decrement 'timer' varaiable
;--------------------------------
Timer4UpdateHandler:
	clr TIM4_SR 
	ldw x,ticks
	incw x
	ldw ticks,x 
	ldw x,timer
	tnzw x 
	jreq 1$
	decw x 
	ldw timer,x 
1$:	
	iret 


;------------------------------------
; Triggered by pressing USER UserButton 
; on NUCLEO card.
; This is used to abort a progam lock 
; in infinite loop. 
;------------------------------------
UserButtonHandler:
; wait button release
	clrw x
1$: decw x 
	jrne 1$
	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
; if MCU suspended by SLEEP resume program
    btjf flags,#FSLEEP,2$
	bres flags,#FSLEEP 
	iret
2$:	
user_interrupted:
    btjt flags,#FRUN,4$
	jra UBTN_Handler_exit 
4$:	; program interrupted by user 
	bres flags,#FRUN 
	ldw x,#USER_ABORT
	call puts 
	ldw x,basicptr 
	ld a,in 
	call prt_basic_line
UBTN_Handler_exit:
    ldw x,#STACK_EMPTY 
    ldw sp,x
	rim 
	jp warm_start

USER_ABORT: .asciz "\nProgram aborted by user.\n"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    peripherals initialization
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;----------------------------------
; TIMER2 used as audio tone output 
; on port D:5.
; channel 1 configured as PWM mode 1 
;-----------------------------------  
TIM2_CLK_FREQ=62500
timer2_init:
	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
 	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
	ret 

;---------------------------------
; TIM4 is configured to generate an 
; interrupt every millisecond 
;----------------------------------
timer4_init:
	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
	mov TIM4_PSCR,#7 ; prescale 128  
	mov TIM4_ARR,#125 ; set for 1msec.
	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
	bset TIM4_IER,#TIM4_IER_UIE
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  routines to write to FLASH, EEPROM 
;  and OPTION 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;----------------------------------
; unlock EEPROM/OPT for writing/erasing
; wait endlessly for FLASH_IAPSR_DUL bit.
; input:
;  none
; output:
;  none 
;----------------------------------
unlock_eeprom:
	mov FLASH_CR2,#0 
	mov FLASH_NCR2,#0xFF 
	mov FLASH_DUKR,#FLASH_DUKR_KEY1
    mov FLASH_DUKR,#FLASH_DUKR_KEY2
	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
	ret

;----------------------------------
; unlock FLASH for writing/erasing
; wait endlessly for FLASH_IAPSR_PUL bit.
; input:
;  none
; output:
;  none
;----------------------------------
unlock_flash:
	mov FLASH_CR2,#0 
	mov FLASH_NCR2,#0xFF 
	mov FLASH_PUKR,#FLASH_PUKR_KEY1
	mov FLASH_PUKR,#FLASH_PUKR_KEY2
	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
	ret

;----------------------------
; erase block code must be 
; executed from RAM
; input:
;-----------------------------
row_erase:
	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
	clr a 
	clrw y 
	ldf ([farptr],y),a
    incw y
	ldf ([farptr],y),a
    incw y
	ldf ([farptr],y),a
    incw y
	ldf ([farptr],y),a
	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
	ret
row_erase_end:

; copy erase_start in RAM 
move_erase_to_ram:
	ldw x,#row_erase_end 
	subw x,#row_erase
	ldw acc16,x 
	ldw x,#tib 
	ldw y,#row_erase 
	call move 
	ret 

;-----------------------------------
; block programming must be 
; executed from RAM 
; initial contidions: 
; 	memory unlocked
;   bit PRG set in 
; input:
;   x        128 bytes row to program 
;   farptr   row address 
; output:
;   none 
;----------------------------------
	BCNT=1 
program_row:
	push #BLOCK_SIZE  
;enable block programming 
	bset FLASH_CR2,#FLASH_CR2_PRG 
	bres FLASH_NCR2,#FLASH_CR2_PRG
	clrw y 
1$:	ld a,(x)
	ldf ([farptr],y),a
	incw x 
	incw y 
	dec (BCNT,sp)
	jrne 1$
; wait EOP bit 
	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
	_drop 1 
	ret 
program_row_end:

;-------------------------
; move program_row to RAM 
; at txtubound address 
;------------------------
move_prg_to_ram:
	ldw x,#program_row_end 
	subw x,#program_row 
	ldw acc16,x 
	ldw x,#tib 
	ldw y,#program_row 
	call move 
	ret 


;-----------------------------
; write a row in FLASH/EEPROM 
; input:
;    farptr   destination address 
;    x        source address 
;-----------------------------
write_row:
	pushw x 
	tnz farptr 
	jrne to_flash 
	ldw x,#FLASH_BASE 
	cpw x,farptr+1 
	jruge to_flash 
to_eeprom:
	ldw x,#EEPROM_BASE 
	cpw x,farptr+1 
	jruge 1$
	ret ; bad address 
1$: ldw x,#EEPROM_END 
	jrule 2$ 
	ret ; bad address 
2$:	call unlock_eeprom
	jra do_programming
to_flash:
	call unlock_flash 
do_programming:
	popw x 
	call tib
	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
	ret 


;-----------------------------------
; erase flash or EEPROM block
; a blow is 128 bytes 
; input:
;   farptr  address row begin
; output:
;   none
;--------------------------------------
block_erase:
	ldw x,farptr+1
	cpw x,#user_space 
	jrpl erase_flash 
; erase eeprom block
	cpw x,#EEPROM_BASE 
	jruge 1$
	ret ; bad address 
1$: ldw x,#EEPROM_END 
	jrule 2$ 
	ret ; bad address 
2$:	call unlock_eeprom 
	call tib 
	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
	ret 
; erase flash block:
erase_flash:
	call unlock_flash 
	call tib 
    bres FLASH_IAPSR,#FLASH_IAPSR_PUL
	ret 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; write a byte to FLASH or EEPROM/OPTION  
; input:
;    a  		byte to write
;    farptr  	address
;    x          farptr[x]
; output:
;    none
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; variables locales
	BTW = 1   ; byte to write offset on stack
	OPT = 2   ; OPTION flag offset on stack
	VSIZE = 2
write_byte:
	pushw y
	_vars VSIZE
	ld (BTW,sp),a ; byte to write 
	clr (OPT,sp)  ; OPTION flag
; put addr[15:0] in Y, for bounds check.
	ldw y,farptr+1   ; Y=addr15:0
; check addr[23:16], if <> 0 then it is extened flash memory
	tnz farptr 
	jrne write_flash
    cpw y,#user_space
    jruge write_flash
	cpw y,#EEPROM_BASE  
    jrult write_exit
	cpw y,#OPTION_END 
	jrugt write_exit
	jra write_eeprom 
; write program memory
write_flash:
	call unlock_flash 
1$:	sim 
	ld a,(BTW,sp)
	ldf ([farptr],x),a ; farptr[x]=A
	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
    rim 
    bres FLASH_IAPSR,#FLASH_IAPSR_PUL
    jra write_exit
; write eeprom and option
write_eeprom:
	call unlock_eeprom
	; check for data eeprom or option eeprom
	cpw y,#OPTION_BASE
	jrmi 1$
	cpw y,#OPTION_END+1
	jrpl 1$
	cpl (OPT,sp)
1$: 
    tnz (OPT,sp)
    jreq 2$
	; pour modifier une option il faut modifier ces 2 bits
    bset FLASH_CR2,#FLASH_CR2_OPT
    bres FLASH_NCR2,#FLASH_CR2_OPT 
2$: 
    ld a,(BTW,sp)
    ldf ([farptr],x),a
    tnz (OPT,sp)
    jreq 3$
    incw x
    ld a,(BTW,sp)
    cpl a
    ldf ([farptr],x),a
3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
write_exit:
	_drop VSIZE 
	popw y
    ret

;--------------------------------------------
; write a data block to eeprom or flash 
; input:
;   Y        source address   
;   X        array index  destination  farptr[x]
;   BSIZE    block size bytes 
;   farptr   write address , byte* 
; output:
;	X 		after last byte written 
;   Y 		after last byte read 
;  farptr   point after block
;---------------------------------------------
	_argofs 2 
	_arg BSIZE 1  ; block size
	; local var 
	XSAVE=1 
	VSIZE=2 
write_block:
	_vars VSIZE
	ldw (XSAVE,sp),x 
	ldw x,(BSIZE,sp) 
	jreq 9$
1$:	ldw x,(XSAVE,sp)
	ld a,(y)
	call write_byte 
	incw x 
	incw y 
	ldw (XSAVE,sp),x
	ldw x,(BSIZE,sp)
	decw x
	ldw (BSIZE,sp),x 
	jrne 1$
9$:
	ldw x,(XSAVE,sp)
	call incr_farptr
	_drop VSIZE
	ret 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   UART1 subroutines
;;   used for user interface 
;;   communication channel.
;;   settings: 
;;		115200 8N1 no flow control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;---------------------------------------------
; initialize UART1, 115200 8N1
; input:
;	none
; output:
;   none
;---------------------------------------------
uart1_init:
    bset PA_DDR,#UART1_TX_PIN
    bset PA_CR1,#UART1_TX_PIN 
    bset PA_CR2,#UART1_TX_PIN 
; enable UART1 clock
	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
uart1_set_baud: 
; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
	ld a,#CLK_SWR_HSI
	cp a,CLK_CMSR 
	jreq 2$ 
1$: ; 8 Mhz 	
	mov UART1_BRR2,#0x05 ; must be loaded first
	mov UART1_BRR1,#0x4
	jra 3$
2$: ; 16 Mhz 	
	mov UART1_BRR2,#0x0b ; must be loaded first
	mov UART1_BRR1,#0x08
3$:
    clr UART1_DR
	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
	bset UART1_CR2,#UART_CR2_SBK
    btjf UART1_SR,#UART_SR_TC,.
    ret

;---------------------------------
; send character to UART1 
; input:
;   A 
; output:
;   none 
;--------------------------------	
putc:
	btjf UART1_SR,#UART_SR_TXE,.
	ld UART1_DR,a 
	ret 

;---------------------------------
; wait character from UART1 
; input:
;   none
; output:
;   A 			char  
;--------------------------------	
getc:
	ld a,rx_char 
	jreq getc 
	clr rx_char 
	ret 

;-----------------------------
; send an ASCIZ string to UART1 
; input: 
;   x 		char * 
; output:
;   none 
;-------------------------------
puts:
    ld a,(x)
	jreq 1$
	call putc 
	incw x 
	jra puts 
1$:	ret 


;---------------------------
; delete character at left 
; of cursor on terminal 
; input:
;   none 
; output:
;	none 
;---------------------------
bksp:
	ld a,#BS 
	call putc 
	ld a,#SPACE 
	call putc 
	ld a,#BS 
	call putc 
	ret 
;---------------------------
; delete n character left of cursor 
; at terminal.
; input: 
;   A   number of characters to delete.
; output:
;    none 
;--------------------------	
delete:
	push a 
0$:	tnz (1,sp)
	jreq 1$
	call bksp 
	dec (1,sp)
	jra 0$
1$:	pop a 
	ret

;--------------------------
; print n spaces on terminal
; input:
;  X 		number of spaces 
; output:
;	none 
;---------------------------
spaces:
	ld a,#SPACE 
1$:	tnzw x
	jreq 9$
	call putc 
	decw x
	jra 1$
9$: 
	ret 

;----------------------
; print token id && value
; input:
;   A     token id 
;   X     token value 
;---------------------
	BSAVE=1
	AREG=2
	XREG=3
	VSIZE=4
prt_tok:
	_vars VSIZE 
	ld (AREG,sp),a 
	ldw (XREG,sp),x 
	ld a, base
	ld (BSAVE,sp),a 
	mov base,#16  
	ldw x,#token_msg
	call puts 
	clrw x 
	ld a,(AREG,sp)
	ld xl,a 
	call print_int 
	ld a,#SPACE
	call putc 
	ldw x,(XREG,sp)
	call print_int 
	ld a,#CR 
	call putc 
	ld a,(BSAVE,sp)
	ld base,a 
	ld a,(AREG,sp)
	ldw x,(XREG,sp)
	_drop VSIZE 
	ret 
token_msg: .asciz "token: "


;---------------------
; display n bytes row 
; from memory.
; input:
;   A   bytes to print 
;	X   start address 
; output:
;   X   address after last shown  
;---------------------
	CNT=1 
	ADR=2 
	VSIZE=3 
show_row:
	tnz a 
	jrne 1$
	ret 
1$:	
	pushw x  
	push a 
	mov tab_width,#4 
	call print_int 
	ld a,#SPACE  
	call putc
row_loop:
	ldw x,(ADR,sp)
	ld a,(x)
	clrw x 
	ld xl,a 
	call print_int 
	ldw x,(ADR,sp)
	incw x 
	ldw (ADR,sp),x 
	dec (CNT,sp)
	jrne row_loop
	_drop VSIZE  		
	mov tab_width,#4
	ld a,#CR 
	call putc 
	ret 

;--------------------------
; print memory content 
; in hexadecimal format
;  input:
;    X    start address 
;    Y    count 
;--------------------------
	BCNT=1
	BASE=3
	TABW=4
	VSIZE=4   
hex_dump:
	_vars VSIZE
	ld a,base
	ld (BASE,sp),a 
	mov base,#16
	ld a,tab_width 
	ld (TABW,sp),a
	ld a,#CR 
	call putc 
1$: ldw (BCNT,sp),y
	ld a,#16
	cpw y,#16
	jrpl 2$
	ld a,yl
2$: 	
	call show_row 
	ldw y,(BCNT,sp) 
	subw y,#16 
	cpw y,#1
	jrpl 1$
	ld a,(BASE,sp)
	ld base,a
	ld a,(TABW,sp)
	ld tab_width,a 
	_drop VSIZE
	ret 

;-------------------------------------
; retrun string length
; input:
;   X         .asciz  pointer 
; output:
;   X         length 
;-------------------------------------
strlen:
	ldw y,x 
	clrw x 
1$:	tnz (y) 
	jreq 9$ 
	incw x
	incw y 
	jra 1$ 
9$: ret 

;------------------------------------
; compare 2 strings
; input:
;   X 		char* first string 
;   Y       char* second string 
; output:
;   A 		0|1 
;-------------------------------------
strcmp:
	ld a,(x)
	jreq 5$ 
	cp a,(y) 
	jrne 4$ 
	incw x 
	incw y 
	jra strcmp 
4$: ; not same  
	clr a 
	ret 
5$: ; same 
	ld a,#1 
	ret 


;---------------------------------------
;  copy src to dest 
; input:
;   X 		dest 
;   Y 		src 
; output: 
;   X 		dest 
;----------------------------------
strcpy:
	pushw x 
1$: ld a,(y)
	jreq 9$ 
	ld (x),a 
	incw x 
	incw y 
	jra 1$ 
9$:	clr (x)
	popw x 
	ret 

;---------------------------------------
; move memory block 
; input:
;   X 		destination 
;   Y 	    source 
;   acc16	bytes count 
; output:
;   none 
;--------------------------------------
	INCR=1 ; increament high byte 
	LB=2 ; increament low byte 
	VSIZE=2
move:
	_vars VSIZE 
	clr (INCR,sp)
	clr (LB,sp)
	pushw y 
	cpw x,(1,sp) ; compare DEST to SRC 
	popw y 
	jreq move_exit ; x==y 
	jrmi move_down
move_up: ; start from top address with incr=-1
	addw x,acc16
	addw y,acc16
	cpl (INCR,sp)
	cpl (LB,sp)   ; increment = -1 
	jra move_loop  
move_down: ; start from bottom address with incr=1 
    decw x 
	decw y
	inc (LB,sp) ; incr=1 
move_loop:	
    ld a, acc16 
	or a, acc8
	jreq move_exit 
	addw x,(INCR,sp)
	addw y,(INCR,sp) 
	ld a,(y)
	ld (x),a 
	pushw x 
	ldw x,acc16 
	decw x 
	ldw acc16,x 
	popw x 
	jra move_loop
move_exit:
	_drop VSIZE
	ret 	

;-------------------------------------
; search text area for a line#
; input:
;	X 			line# 
; output:
;   X 			addr of line | 0 
;   Y           line#|insert address if not found  
;-------------------------------------
	LL=1 ; line length 
	LB=2 ; line length low byte 
	VSIZE=2 
search_lineno:
	_vars VSIZE
	clr (LL,sp)
	ldw y,txtbgn
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
	_drop VSIZE     
	ret 

;---------------------------------------------
; create a gap in text area to 
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
create_gap:
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
9$:	_drop VSIZE 
	ret 

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
	ldw x,txtend  
	cpw x,txtbgn 
	jrne 0$
;first text line 
	ldw x,#2 
	ld a,([ptr16],x)
	clrw x 
	ld xl,a
	ldw (LLEN,sp),x 
	ldw x,txtbgn
	ldw (DEST,sp),x 
	ldw x,txtend 
	jra 4$
0$:	ldw x,[ptr16]
; line number
	ldw (LINENO,sp),x 
	ldw x,#2 
	ld a,([ptr16],x)
	ld xl,a
; line length
	ldw (LLEN,sp),x
; check if that line number already exit 	
	ldw x,(LINENO,sp)
	call search_lineno 
	tnzw x 
	jrne 2$
; line doesn't exit
; it will be inserted at this point.  	
	ldw (DEST,sp),y 
	jra 3$
; line exit delete it.
; it will be replaced by new one 	
2$: ldw (DEST,sp),x 
	call del_line
3$: 
; insert new line or leave if LLEN==3
; LLEN==3 means empty line 
	ld a,#3
	cp a,(LLEN+1,sp)
	jreq insert_ln_exit ; empty line exit.
; if insertion point at txtend 
; move no need to create a gap 
	ldw x,(DEST,sp)
	cpw x,txtend 
	jreq 4$ 
; must create a gap
; at insertion point  
	ldw x,(DEST,sp)
	ldw y,(LLEN,sp)
	call create_gap
	jra 5$
4$: 
	addw x,(LLEN,sp)
	ldw txtend,x 	 
; move new line in gap 
5$:	ldw x,(LLEN,sp)
	ldw acc16,x 
	ldw y,#pad ;SRC 
	ldw x,(DEST,sp) ; dest address 
	call move 
insert_ln_exit:	
	_drop VSIZE
	ret

;-----------------------------------
; create token list fromm text line 
; save this list in pad buffer 
;  compiled line format: 
;    line_no  2 bytes {0...32767}
;    count    1 byte  
;    tokens   variable length 
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
compile:
	_vars VSIZE 
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
1$:	ldw pad,x 
	ldw y,#pad+3 
2$:	cpw y,#stack_full 
	jrult 3$
	ld a,#ERR_BUF_FULL 
	jp tb_error 
3$:	
	ldw x,y 
	call get_token 
	cp a,#TK_NONE 
	jrne 2$ 
; compilation completed  
	subw y,#pad
    ld a,yl
	ldw x,#pad 
	ldw ptr16,x 
	ld (2,x),a 
	ldw x,(x)
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
	ret 

;------------------------------------
;  set all variables to zero 
; input:
;   none 
; output:
;	none
;------------------------------------
clear_vars:
	ldw x,#vars 
	ldw y,#2*26 
1$:	clr (x)
	incw x 
	decw y 
	jrne 1$
	ret 

;-------------------------------------
; check if A is a letter 
; input:
;   A 			character to test 
; output:
;   C flag      1 true, 0 false 
;-------------------------------------
is_alpha:
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
is_digit:
	cp a,#'0
	jrc 1$
    cp a,#'9+1
	ccf 
1$:	ccf 
    ret

;-------------------------------------
;  program initialization entry point 
;-------------------------------------
	MAJOR=1
	MINOR=0
software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
cold_start:
;set stack 
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
; set LD2 pin as output and turn it on
    bset PC_CR1,#LED2_BIT
    bset PC_CR2,#LED2_BIT
    bset PC_DDR,#LED2_BIT
	bset PC_ODR,#LED2_BIT 
; disable schmitt triggers on Arduino CN4 analog inputs
	mov ADC_TDRL,0x3f
; disable peripherals clocks
;	clr CLK_PCKENR1 
;	clr CLK_PCKENR2
	clr AWU_TBR 
	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
; select internal clock no divisor: 16 Mhz 	
	ld a,#CLK_SWR_HSI 
	clrw x  
    call clock_init 
	call timer4_init
	call timer2_init
; UART1 at 115200 BAUD
	call uart1_init
; activate PE_4 (user button interrupt)
    bset PE_CR2,#USR_BTN_BIT 
; display system information
	ldw x,#software 
	call puts 
	ld a,#MAJOR 
	ld acc8,a 
	clrw x 
	ldw acc24,x
	clr tab_width  
	mov base, #10 
	call prti24 
	ld a,#'.
	call putc 
	ld a,#MINOR 
	ld acc8,a 
	clrw x 
	ldw acc24,x 
	call prti24
	ld a,#CR 
	call putc
	call seek_fdrive 
	rim 
	inc seedy+1 
	inc seedx+1 
	call clear_basic
	call ubound 
;	jra 2$	
; 150 msec beep 
	ldw x,#150 
	ldw y,#998 
	call beep  
2$:	bres PC_ODR,#LED2_BIT	
	call warm_init
	call load_autorun
    jp cmd_line  

warm_init:
	clr flags 
	clr loop_depth 
	mov tab_width,#TAB_WIDTH 
	mov base,#10 
	ldw x,#0 
	ldw basicptr,x 
	ldw in.w,x 
	clr count
	ret 

;--------------------------
; called by tb_error when
; flag FAUTORUN is set.
; There is a bug in autorun 
; program so cancel it.
;---------------------------
cancel_autorun:
	ldw x,#AUTORUN_NAME 
	ldw farptr+1,x 
	clr a
	clrw x  
	ld farptr,a 
	call write_byte 
	ret 


;--------------------------
; if autorun file defined 
; in eeprom address AUTORUN_NAME 
; load and run it.
;-------------------------
load_autorun:
	ldw y,#AUTORUN_NAME
	ld a,(y)
	jreq 9$
	call search_file
	jrc 2$ 
; if file doesn't exit
	call cancel_autorun
	jra 9$ 
2$:	call load_file
	ldw x,#AUTORUN_NAME 
	call puts
	ldw x,#autorun_msg 
	call puts 
	bset flags,#FAUTORUN 
	jp run_it    
9$: ret 	

autorun_msg: .asciz " loaded and running\n"
;---------------------------
; reset BASIC text variables 
; and clear variables 
;---------------------------
clear_basic:
	clr count
	clr in  
	ldw x,#free_ram 
	ldw txtbgn,x 
	ldw txtend,x 
	call clear_vars 
	ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   Tiny BASIC error messages     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
err_msg:
	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    

err_mem_full: .asciz "Memory full\n" 
err_syntax: .asciz "syntax error\n" 
err_math_ovf: .asciz "math operation overflow\n"
err_div0: .asciz "division by 0\n" 
err_no_line: .asciz "invalid line number.\n"
err_run_only: .asciz "run time only usage.\n" 
err_cmd_only: .asciz "command line only usage.\n"
err_duplicate: .asciz "duplicate name.\n"
err_not_file: .asciz "File not found.\n"
err_bad_value: .asciz "bad value.\n"
err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
err_no_data: .asciz "No data found.\n"
err_no_prog: .asciz "No program in RAM!\n"
err_no_fspace: .asciz "File system full.\n" 
err_buf_full: .asciz "Buffer full\n"

rt_msg: .asciz "run time error, "
comp_msg: .asciz "compile error, "
tk_id: .asciz "last token id: "

syntax_error:
	ld a,#ERR_SYNTAX 

tb_error:
	btjt flags,#FCOMP,1$
	push a 
	ldw x, #rt_msg 
	call puts 
	pop a 
	ldw x, #err_msg 
	clr acc16 
	sll a
	rlc acc16  
	ld acc8, a 
	addw x,acc16 
	ldw x,(x)
	call puts
	ldw x,basicptr
	ld a,in 
	call prt_basic_line
	ldw x,#tk_id 
	call puts 
	ld a,in.saved 
	clrw x 
	ld xl,a 
	addw x,basicptr 
	ld a,(x)
	clrw x 
	ld xl,a 
	call print_int
	btjf flags,#FAUTORUN ,6$
	call cancel_autorun  
	jra 6$
1$:	
	push a 
	ldw x,#comp_msg
	call puts 
	pop a 
	ldw x, #err_msg 
	clr acc16 
	sll a
	rlc acc16  
	ld acc8, a 
	addw x,acc16 
	ldw x,(x)
	call puts
	ldw x,#tib
	call puts 
	ld a,#CR 
	call putc
	ldw x,in.w
	call spaces
	ld a,#'^
	call putc 
6$: ldw x,#STACK_EMPTY 
    ldw sp,x
warm_start:
	call warm_init
;----------------------------
;   BASIC interpreter
;----------------------------
cmd_line: ; user interface 
	ld a,#CR 
	call putc 
	ld a,#'> 
	call putc
	call readln
	tnz count 
	jreq cmd_line
	call compile
; if text begin with a line number
; the compiler set count to zero    
; so code is not interpreted
	tnz count 
	jreq cmd_line

; if direct command 
; it's ready to interpret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This is the interpreter loop
;; for each BASIC code line. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
interpreter: 
	ld a,in 
	cp a,count 
	jrmi interp_loop
next_line:
	btjf flags, #FRUN, cmd_line
	ldw x,basicptr
	addw x,in.w 
	cpw x,txtend 
	jrpl warm_start
	ldw basicptr,x ; start of next line  
	ld a,(2,x)
	ld count,a 
	mov in,#3 ; skip first 3 bytes of line 
interp_loop: 
	call next_token
	cp a,#TK_NONE 
	jreq next_line 
	cp a,#TK_CMD
	jrne 1$
	call (x) 
	jra interp_loop 
1$:	 
	cp a,#TK_VAR
	jrne 2$
	call let_var  
	jra interp_loop 
2$:	
	cp a,#TK_ARRAY 
	jrne 3$
	call let_array 
	jra interp_loop
3$:	
	cp a,#TK_COLON 
	jreq interp_loop 
	jp syntax_error 

		
;--------------------------
; extract next token from
; token list 
; basicptr -> base address 
; in  -> offset in list array 
; output:
;   A 		token attribute
;   X 		token value if there is one
;----------------------------------------
next_token:
	clrw x 
	ld a,in 
	sub a,count ; don't replace sub by cp!  
	jrmi 0$
	ret  ; end of BASIC line 
0$: 
	mov in.saved,in 
	ldw y,basicptr 
	ld a,([in.w],y)
	inc in  
	tnz a 
	jrmi 6$
	cp a,#TK_ARRAY
	jrpl 9$  ; no attribute for these
	cp a,#TK_COLON
	jreq 9$  
1$: ; 
	cp a,#TK_CHAR
	jrne 2$
	ld a,([in.w],y)
	inc in 
	exg a,xl  
	ld a,#TK_CHAR
	ret
2$:	cp a,#TK_QSTR 
	jrne 9$
	ldw x,y 
	addw x,in.w ; pointer to string 
; move pointer after string 
3$:	tnz ([in.w],y)
	jreq 8$
	inc in 
	jra 3$
6$: 
	ldw y,([in.w],y)
	exgw x,y 
	inc in
8$:	inc in 
9$: 
	ret	

;-----------------------------------
; print a 16 bit integer 
; using variable 'base' as conversion
; format.
; input:
;   X       integer to print 
;   'base'    conversion base 
; output:
;   none 
;-----------------------------------
print_int:
	clr acc24 
	ldw acc16,x 
	btjf acc16,#7,prti24
	cpl acc24 

;------------------------------------
; print integer in acc24 
; input:
;	acc24 		integer to print 
;	'base' 		numerical base for conversion 
;   'tab_width' field width 
;  output:
;    none 
;------------------------------------
	BUFF_LEN=16
	SPCNT=1
	BUFFER=2
	VSIZE=17 
prti24:
	ldw x,sp 
	_vars VSIZE 
    call itoa  ; conversion entier en  .asciz
	ld (SPCNT,sp),a 
	ld a,#15 
	and a,tab_width 
	ld tab_width,a 
1$: ld a,(SPCNT,sp)
	cp a,tab_width
	jruge 4$
	ld  a,#SPACE
	decw x
    ld (x),a 
	inc (SPCNT,sp)
	jra 1$ 
4$: 
	call puts 
5$: _drop VSIZE 
    ret	

;------------------------------------
; convert integer in acc24 to string
; input:
;   'base'	conversion base 
;	acc24	integer to convert
;   X       pointer to end of convertion buffer 
; output:
;   X  		pointer to first char of string
;   A       string length
;------------------------------------
	SIGN=1  ; integer sign 
	LEN=2 
	XSAVE=3
	VSIZE=4 ;locals size
itoa:
	_vars VSIZE
	clr (LEN,sp) ; string length  
	clr (SIGN,sp)    ; sign
	ld a,base 
	cp a,#10
	jrne 1$
	; base 10 string display with negative sign if bit 23==1
	btjf acc24,#7,1$
	cpl (SIGN,sp)
	call neg_acc24
1$:
; initialize string pointer 
	clr (x)
itoa_loop:
    ld a,base
	ldw (XSAVE,sp),x 
    call divu24_8 ; acc24/A 
	ldw x,(XSAVE,sp)
    add a,#'0  ; remainder of division
    cp a,#'9+1
    jrmi 2$
    add a,#7 
2$:	
	decw x
    ld (x),a
	inc (LEN,sp)
	; if acc24==0 conversion done
	ld a,acc24
	or a,acc16
	or a,acc8
    jrne itoa_loop
	;conversion done, next add '$' or '-' as required
	ld a,base 
	cp a,#16
	jreq 8$
	ld a,(SIGN,sp)
    jreq 10$
    ld a,#'-
	jra 9$ 
8$: ld a,#'$ 
9$: decw x
    ld (x),a
	inc (LEN,sp)
10$:
	ld a,(LEN,sp)
	_drop VSIZE
	ret

;-------------------------------------
; divide uint24_t by uint8_t
; used to convert uint24_t to string
; input:
;	acc24	dividend
;   A 		divisor
; output:
;   acc24	quotient
;   A		remainder
;------------------------------------- 
; offset  on sp of arguments and locals
	U8   = 1   ; divisor on stack
	VSIZE =1
divu24_8:
	pushw x ; save x
	push a 
	; ld dividend UU:MM bytes in X
	ld a, acc24
	ld xh,a
	ld a,acc24+1
	ld xl,a
	ld a,(U8,SP) ; divisor
	div x,a ; UU:MM/U8
	push a  ;save remainder
	ld a,xh
	ld acc24,a
	ld a,xl
	ld acc24+1,a
	pop a
	ld xh,a
	ld a,acc24+2
	ld xl,a
	ld a,(U8,sp) ; divisor
	div x,a  ; R:LL/U8
	ld (U8,sp),a ; save remainder
	ld a,xl
	ld acc24+2,a
	pop a
	popw x
	ret

;--------------------------------------
; unsigned multiply uint24_t by uint8_t
; use to convert numerical string to uint24_t
; input:
;	acc24	uint24_t 
;   A		uint8_t
; output:
;   acc24   A*acc24
;-------------------------------------
; local variables offset  on sp
	U8   = 3   ; A pushed on stack
	OVFL = 2  ; multiplicaton overflow low byte
	OVFH = 1  ; multiplication overflow high byte
	VSIZE = 3
mulu24_8:
	pushw x    ; save X
	; local variables
	push a     ; U8
	clrw x     ; initialize overflow to 0
	pushw x    ; multiplication overflow
; multiply low byte.
	ld a,acc24+2
	ld xl,a
	ld a,(U8,sp)
	mul x,a
	ld a,xl
	ld acc24+2,a
	ld a, xh
	ld (OVFL,sp),a
; multipy middle byte
	ld a,acc24+1
	ld xl,a
	ld a, (U8,sp)
	mul x,a
; add overflow to this partial product
	addw x,(OVFH,sp)
	ld a,xl
	ld acc24+1,a
	clr a
	adc a,#0
	ld (OVFH,sp),a
	ld a,xh
	ld (OVFL,sp),a
; multiply most signficant byte	
	ld a, acc24
	ld xl, a
	ld a, (U8,sp)
	mul x,a
	addw x, (OVFH,sp)
	ld a, xl
	ld acc24,a
    addw sp,#VSIZE
	popw x
	ret

;------------------------------------
;  two's complement acc24
;  input:
;		acc24 variable
;  output:
;		acc24 variable
;-------------------------------------
neg_acc24:
	cpl acc24+2
	cpl acc24+1
	cpl acc24
	ld a,#1
	add a,acc24+2
	ld acc24+2,a
	clr a
	adc a,acc24+1
	ld acc24+1,a 
	clr a 
	adc a,acc24 
	ld acc24,a 
	ret


;------------------------------------
; read a line of text from terminal
; input:
;	none
; local variable on stack:
;	LL  line length
;   RXCHAR last received character 
; output:
;   text in tib  buffer
;   count  line length 
;------------------------------------
	; local variables
	LL_HB=1
	RXCHAR = 1 ; last char received
	LL = 2  ; accepted line length
	VSIZE=2 
readln:
	push #0
	push #0  
 	ldw y,#tib ; input buffer
readln_loop:
	call getc
	ld (RXCHAR,sp),a
	cp a,#CR
	jrne 1$
	jp readln_quit
1$:	cp a,#LF 
	jreq readln_quit
	cp a,#BS
	jreq del_back
	cp a,#CTRL_D
	jreq del_ln
	cp a,#CTRL_R 
	jreq reprint 
;	cp a,#'[
;	jreq ansi_seq
final_test:
	cp a,#SPACE
	jrpl accept_char
	jra readln_loop
ansi_seq:
;	call getc
;	cp a,#'C 
;	jreq rigth_arrow
;	cp a,#'D 
;	jreq left_arrow 
;	jra final_test
right_arrow:
;	ld a,#BSP 
;	call putc 
;	jra realn_loop 
left_arrow:
;	jra readln_loop
reprint: 
	tnz (LL,sp)
	jrne readln_loop
	ldw x,#tib 
	call strlen 
	ldw y,#tib 
	ld a,xl
	jreq readln_loop
	ld (LL,sp),a 
	ldw x,#tib 
	call puts
	clr (LL_HB,sp)
	addw y,(LL_HB,sp)
	jra readln_loop 
del_ln:
	ld a,(LL,sp)
	call delete
	ldw y,#tib
	clr (y)
	clr (LL,sp)
	jra readln_loop
del_back:
    tnz (LL,sp)
    jreq readln_loop
    dec (LL,sp)
    decw y
    clr  (y)
    call bksp 
    jra readln_loop	
accept_char:
	ld a,#TIB_SIZE-1
	cp a, (LL,sp)
	jreq readln_loop
	ld a,(RXCHAR,sp)
	ld (y),a
	inc (LL,sp)
	incw y
	clr (y)
	call putc 
	jra readln_loop
readln_quit:
	clr (y)
	ld a,(LL,sp)
	ld count,a 
	ld a,#CR
	call putc
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

escaped: .asciz "abtnvfr"

;-------------------------
; integer parser 
; input:
;   X 		point to output buffer  
;   Y 		point to tib 
;   A 	    first digit|'$' 
; output:  
;   X 		integer 
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
	call atoi24
	ldw y,x 
	ldw x,acc16 
	ld a,#TK_INTGR
	ldw (y),x 
	addw y,#2
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
	ld acc24,a 
	ldw x,(BINARY+1,sp)
	ldw acc16,x
	ldw (y),x 
	addw y,#2  
	ld a,#TK_INTGR 	
	_drop VSIZE 
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
;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
;   pad 	keyword|var_name  
;--------------------------  
	XFIRST=1
	VSIZE=2
parse_keyword: 
	pushw x 
kw_loop:	
	call to_upper 
	ld (x),a 
	incw x 
	ld a,([in.w],y)
	inc in 
	call is_alpha 
	jrc kw_loop
	dec in   
1$: clr (x)
	ldw x,(XFIRST,sp) 
	ld a,(1,x)
	jrne 2$
; one letter variable name 
	ld a,(x) 
	sub a,#'A 
	sll a 
	push a 
	push #0
	ldw x,#vars 
	addw x,(1,sp) ; X=var address 
	_drop 2 
	ld a,#TK_VAR 
	jra 4$ 
2$: ; check for keyword, otherwise syntax error.
	_ldx_dict kword_dict ; dictionary entry point
	ldw y,(XFIRST,sp) ; name to search for
	call search_dict
	tnz a
	jrne 4$ 
	jp syntax_error
4$:	
	ldw y,(XFIRST,sp)
	ld (y),a 
	incw y 
	ldw (y),x
	addw y,#2  
	_drop VSIZE 
	ret  	


;------------------------------------
; scan text for next token
; input: 
;	X 		pointer to buffer where 
;	        token id and value are copied 
; use:
;	Y   pointer to text in tib 
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
get_token: 
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
	_case COMMA sharp_tst 
	ld a,#TK_COMMA
	jp token_char
sharp_tst:
	_case SHARP dash_tst 
	ld a,#TK_SHARP
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
	ldw x,#print 
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
	ld a,yl 
	add a,in
	ld in,a 
	ldw (1,sp),x
	addw y,(1,sp)
	incw y 
	_drop 2 
	ldw x,#remark 
	ld a,#TK_CMD 
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
	inc in 
	ld a,([in.w],y)
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
	inc in 
	ld a,([in.w],y)
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
	ldw y,x 
	jp copy_comment 
token_char:
	ld (x),a 
	incw x
	ldw y,x 
token_exit:
	_drop VSIZE 
	ret


;------------------------------------
; convert alpha to uppercase
; input:
;    a  character to convert
; output:
;    a  uppercase character
;------------------------------------
to_upper::
	cp a,#'a
	jrpl 1$
0$:	ret
1$: cp a,#'z	
	jrugt 0$
	sub a,#32
	ret
	
;------------------------------------
; convert pad content in integer
; input:
;    x		.asciz to convert
; output:
;    acc24      int24_t
;------------------------------------
	; local variables
	SIGN=1 ; 1 byte, 
	BASE=2 ; 1 byte, numeric base used in conversion
	TEMP=3 ; 1 byte, temporary storage
	VSIZE=3 ; 3 bytes reserved for local storage
atoi24:
	pushw x 
	_vars VSIZE
	; acc24=0 
	clr acc24    
	clr acc16
	clr acc8 
	clr (SIGN,sp)
	ld a,#10
	ld (BASE,sp),a ; default base decimal
	ld a,(x)
	jreq 9$  ; completed if 0
	cp a,#'-
	jrne 1$
	cpl (SIGN,sp)
	jra 2$
1$: cp a,#'$
	jrne 3$
	ld a,#16
	ld (BASE,sp),a
2$:	incw x
	ld a,(x)
3$:	
	cp a,#'a
	jrmi 4$
	sub a,#32
4$:	cp a,#'0
	jrmi 9$
	sub a,#'0
	cp a,#10
	jrmi 5$
	sub a,#7
	cp a,(BASE,sp)
	jrpl 9$
5$:	ld (TEMP,sp),a
	ld a,(BASE,sp)
	call mulu24_8
	ld a,(TEMP,sp)
	add a,acc24+2
	ld acc24+2,a
	clr a
	adc a,acc24+1
	ld acc24+1,a
	clr a
	adc a,acc24
	ld acc24,a
	jra 2$
9$:	tnz (SIGN,sp)
    jreq atoi_exit
    call neg_acc24
atoi_exit: 
	_drop VSIZE
	popw x ; restore x
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
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   TINY BASIC  operators,
;;   commands and functions 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Arithmetic operators
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;--------------------------------------
;  multiply 2 uint16_t return uint32_t
;  input:
;     x       uint16_t 
;     y       uint16_t 
;  output:
;     x       product bits 15..0
;     y       product bits 31..16 
;---------------------------------------
		U1=1  ; uint16_t 
		DBL=3 ; uint32_t
		VSIZE=6
umstar:
	_vars VSIZE 
	ldw (U1,sp),x 
;initialize bits 31..16 of 
;product to zero 
	clr (DBL,sp)
	clr (DBL+1,sp)
; produc U1L*U2L 
	ld a,yl 
	mul x,a 
	ldw (DBL+2,sp),x
; product U1H*U2L 
	ld a,(U1,sp) ; xh 
	ldw x,y
	mul x,a 
	clr a 
	addw x,(DBL+1,sp) 
	clr a 
	adc a,(DBL,sp) 
	ld (DBL,sp),a ; bits 23..17 
	ldw (DBL+1,sp),x ; bits 15..0 
; product U1L*U2H
	swapw y 
	ldw x,y
	ld a,(U1+1,sp)
	mul x,a
	addw x,(DBL+1,sp)
	clr a 
	adc a,(DBL,sp)
	ld (DBL,sp),a 
	ldw (DBL+1,sp),x 
; product U1H*U2H 	
	ld a,(U1,sp)
	ldw x,y  
	mul x,a 
	addw x,(DBL,sp)
	ldw y,x 
	ldw x,(DBL+2,sp)
	_drop VSIZE 
	ret


;-------------------------------------
; multiply 2 integers
; input:
;  	x       n1 
;   y 		n2 
; output:
;	X        N1*N2 bits 15..0
;   Y        N1*N2 bits 31..16 
;-------------------------------------
	SIGN=1
	VSIZE=1
multiply:
	_vars VSIZE 
	clr (SIGN,sp)
	ld a,xh 
	jrpl 1$
	cpl (SIGN,sp)
	negw x 
1$:	
	ld a,yh 
	jrpl 2$ 
	cpl (SIGN,sp)
	negw y 
2$:	
	call umstar
	ld a,(SIGN,sp)
	jreq 3$
	cplw x 
	cplw y 
	addw x,#1
	jrnc 3$
	incw y
3$:	
	_drop VSIZE 
	ret

;--------------------------------------
; divide uint32_t/uint16_t
; return:  quotient and remainder 
; quotient expected to be uint16_t 
; input:
;   DBLDIVDND    on stack 
;   X            divisor 
; output:
;   X            quotient 
;   Y            remainder 
;---------------------------------------
	VSIZE=3
	_argofs VSIZE 
	_arg DBLDIVDND 1
	; local variables 
	DIVISOR=1 
	CNTR=3 
udiv32_16:
	_vars VSIZE 
	ldw (DIVISOR,sp),x	; save divisor 
	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
	ldw y,(DBLDIVDND,sp) ; bits 31..16
	tnzw y
	jrne long_division 
	ldw y,(DIVISOR,sp)
	divw x,y
	_drop VSIZE 
	ret
long_division:
	exgw x,y ; hi in x, lo in y 
	ld a,#17 
	ld (CNTR,sp),a
1$:
	cpw x,(DIVISOR,sp)
	jrmi 2$
	subw x,(DIVISOR,sp)
2$:	ccf 
	rlcw y 
	rlcw x 
	dec (CNTR,sp)
	jrne 1$
	exgw x,y 
	_drop VSIZE 
	ret

;-----------------------------
; negate double int.
; input:
;   x     bits 15..0
;   y     bits 31..16
; output: 
;   x     bits 15..0
;   y     bits 31..16
;-----------------------------
dneg:
	cplw x 
	cplw y 
	addw x,#1 
	jrnc 1$
	incw y 
1$: ret 


;--------------------------------
; sign extend single to double
; input:
;   x    int16_t
; output:
;   x    int32_t bits 15..0
;   y    int32_t bits 31..16
;--------------------------------
dbl_sign_extend:
	clrw y
	ld a,xh 
	and a,#0x80 
	jreq 1$
	cplw y
1$: ret 	


;----------------------------------
;  euclidian divide dbl/n1 
;  ref: https://en.wikipedia.org/wiki/Euclidean_division
; input:
;    dbl    int32_t on stack 
;    x 		n1   int16_t  disivor  
; output:
;    X      dbl/n2  int16_t 
;    Y      remainder int16_t 
;----------------------------------
	VSIZE=8
	_argofs VSIZE 
	_arg DIVDNDHI 1 
	_arg DIVDNDLO 3
	; local variables
	DBLHI=1
	DBLLO=3 
	SDIVSR=5 ; sign divisor
	SQUOT=6 ; sign dividend 
	DIVISR=7 ; divisor 
div32_16:
	_vars VSIZE 
	clr (SDIVSR,sp)
	clr (SQUOT,sp)
; copy arguments 
	ldw y,(DIVDNDHI,sp)
	ldw (DBLHI,sp),y
	ldw y,(DIVDNDLO,sp)
	ldw (DBLLO,sp),y 
; check for 0 divisor
	tnzw x 
    jrne 0$
	ld a,#ERR_DIV0 
	jp tb_error 
; check divisor sign 	
0$:	ld a,xh 
	and a,#0x80 
	jreq 1$
	cpl (SDIVSR,sp)
	cpl (SQUOT,sp)
	negw x
1$:	ldw (DIVISR,sp),x
; check dividend sign 	 
 	ld a,(DBLHI,sp) 
	and a,#0x80 
	jreq 2$ 
	cpl (SQUOT,sp)
	ldw x,(DBLLO,sp)
	ldw y,(DBLHI,sp)
	call dneg 
	ldw (DBLLO,sp),x 
	ldw (DBLHI,sp),y 
2$:	ldw x,(DIVISR,sp)
	call udiv32_16
	tnzw y 
	jreq 3$ 
; x=quotient 
; y=remainder 
; if SDIVSR XOR SQUOT increment quotient and remainder.
	ld a,(SQUOT,sp)
	xor a,(SDIVSR,sp)
	jreq 3$
	incw x 
	ldw acc16,y 
	ldw y,(DIVISR,sp)
	subw y,acc16
; sign quotient
3$:	ld a,(SQUOT,sp)
	jreq 4$
	negw x 
4$:	
	_drop VSIZE 
	ret 



;----------------------------------
; division x/y 
; input:
;    X       dividend
;    Y       divisor 
; output:
;    X       quotient
;    Y       remainder 
;-----------------------------------
	VSIZE=4 
	; local variables 
	DBLHI=1
	DBLLO=3
divide: 
	_vars VSIZE 
	ldw acc16,y
	call dbl_sign_extend
	ldw (DBLLO,sp),x 
	ldw (DBLHI,sp),y 
	ldw x,acc16 
	call div32_16 
	_drop VSIZE 
	ret


;----------------------------------
;  remainder resulting from euclidian 
;  division of x/y 
; input:
;   x   	dividend int16_t 
;   y 		divisor int16_t
; output:
;   X       n1%n2 
;----------------------------------
modulo:
	call divide
	ldw x,y 
	ret 

;----------------------------------
; BASIC: MULDIV(expr1,expr2,expr3)
; return expr1*expr2/expr3 
; product result is int32_t and 
; divisiont is int32_t/int16_t
;----------------------------------
	DBL_SIZE=4 
muldiv:
	call func_args 
	cp a,#3 
	jreq 1$
	jp syntax_error
1$: 
	ldw x,(5,sp) ; expr1
	ldw y,(3,sp) ; expr2
	call multiply 
	ldw (5,sp),x  ;int32_t 15..0
	ldw (3,sp),y  ;int32_t 31..16
	popw x        ; expr3 
	call div32_16 ; int32_t/expr3 
	_drop DBL_SIZE
	ret 


;----------------------------------
; search in kword_dict name
; from its execution address 
; input:
;   X       	execution address 
; output:
;   X 			cstr*  | 0 
;--------------------------------
	XADR=1 
	LINK=3 
	VSIZE=4
cmd_name:
	_vars VSIZE 
	clr acc16 
	ldw (XADR,sp),x  
	ldw x,#kword_dict	
1$:	ldw (LINK,sp),x
	ld a,(2,x)
	and a,#15 
	ld acc8,a 
	addw x,#3
	addw x,acc16
	ldw x,(x) ; execution address 
	cpw x,(XADR,sp)
	jreq 2$
	ldw x,(LINK,sp)
	ldw x,(x) 
	subw x,#2  
	jrne 1$
	jra 9$
2$: ldw x,(LINK,sp)
	addw x,#2 	
9$:	_drop VSIZE
	ret


;---------------------------------
; dictionary search 
; input:
;	X 		dictionary entry point, name field  
;   y		.asciz name to search 
; output:
;  A 		TK_CMD|TK_IFUNC|TK_NONE 
;  X		execution address | 0 
;---------------------------------
	NLEN=1 ; cmd length 
	XSAVE=2
	YSAVE=4
	VSIZE=5 
search_dict:
	_vars VSIZE 

	ldw (YSAVE,sp),y 
search_next:
	ldw (XSAVE,sp),x 
; get name length in dictionary	
	ld a,(x)
	and a,#0xf 
	ld (NLEN,sp),a  
	ldw y,(YSAVE,sp) ; name pointer 
	incw x 
cp_loop:
	ld a,(y)
	jreq str_match 
	tnz (NLEN,sp)
	jreq no_match  
	cp a,(x)
	jrne no_match 
	incw y 
	incw x
	dec (NLEN,sp)
	jra cp_loop 
no_match:
	ldw x,(XSAVE,sp) 
	subw x,#2 ; move X to link field
	push #TK_NONE 
	ldw x,(x) ; next word link 
	pop a ; TK_NONE 
	jreq search_exit  ; not found  
;try next 
	jra search_next
str_match:
	ldw x,(XSAVE,sp)
	ld a,(X)
	ld (NLEN,sp),a ; needed to test keyword type  
	and a,#0xf 
; move x to procedure address field 	
	inc a 
	ld acc8,a 
	clr acc16 
	addw x,acc16 
	ldw x,(x) ; routine entry point 
;determine keyword type bits 7:6 
	ld a,(NLEN,sp)
	swap a 
	and a,#0xc
	srl a
	srl a 
	add a,#128
search_exit: 
	_drop VSIZE 	 
	ret 

;---------------------
; check if next token
;  is of expected type 
; input:
;   A 		 expected token attribute
;  ouput:
;   none     if fail call syntax_error 
;--------------------
expect:
	push a 
	call next_token 
	cp a,(1,sp)
	jreq 1$
	jp syntax_error
1$: pop a 
	ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;
; parse arguments list 
; between ()
;;;;;;;;;;;;;;;;;;;;;;;;;;
func_args:
	ld a,#TK_LPAREN 
	call expect 
; expected to continue in arg_list 
; caller must check for TK_RPAREN 

;-------------------------------
; parse embedded BASIC routines 
; arguments list.
; arg_list::=  rel[','rel]*
; all arguments are of integer type
; and pushed on stack 
; input:
;   none
; output:
;   stack{n}   arguments pushed on stack
;   A 	number of arguments pushed on stack  
;--------------------------------
arg_list:
	push #0  
1$: call relation
	cp a,#TK_NONE 
	jreq 5$
	cp a,#TK_INTGR
	jrne 4$
3$: 
; swap return address with argument
	pop a ; arg_count
	popw y ; return address 
	pushw x ; new argument 
	pushw y 
    inc a
	push a 
	call next_token 
	cp a,#TK_COMMA 
	jreq 1$ 
	cp a,#TK_NONE 
	jreq 5$ 
4$:	cp a,#TK_RPAREN 
	jreq 5$
	_unget_token 
5$:	pop a  
	ret 

;--------------------------------
;   BASIC commnands 
;--------------------------------

;--------------------------------
;  arithmetic and relational 
;  routines
;  operators precedence
;  highest to lowest
;  operators on same row have 
;  same precedence and are executed
;  from left to right.
;	'*','/','%'
;   '-','+'
;   '=','>','<','>=','<=','<>','><'
;   '<>' and '><' are equivalent for not equal.
;--------------------------------

;---------------------
; return array element
; address from @(expr)
; input:
;   A 		TK_ARRAY
; output:
;   A 		TK_INTGR
;	X 		element address 
;----------------------
get_array_element:
	call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error
1$: popw x 
	; check for bounds 
	cpw x,array_size 
	jrule 3$
; bounds {1..array_size}	
2$: ld a,#ERR_BAD_VALUE 
	jp tb_error 
3$: tnzw  x
	jreq 2$ 
	sllw x 
	pushw x 
	ldw x,#tib
	subw x,(1,sp)
	_drop 2   
	ld a,#TK_INTGR
	ret 


;***********************************
;   expression parse,execute 
;***********************************
;-----------------------------------
; factor ::= ['+'|'-'|e]  var | @ |
;			 integer | function |
;			 '('relation')' 
; output:
;   A    token attribute 
;   X 	 integer
; ---------------------------------
	NEG=1
	VSIZE=1
factor:
	_vars VSIZE 
	call next_token
	cp a,#CMD_END 
	jrult 20$
1$:	ld (NEG,sp),a 
	and a,#TK_GRP_MASK
	cp a,#TK_GRP_ADD 
	jreq 2$
	ld a,(NEG,sp)
	jra 4$  
2$:	
	call next_token 
4$:	
	cp a,#TK_IFUNC 
	jrne 5$ 
	call (x) 
	jra 18$ 
5$:
	cp a,#TK_INTGR
	jrne 6$
	jra 18$
6$:
	cp a,#TK_ARRAY
	jrne 10$
	call get_array_element
	ldw x,(x)
	jra 18$ 
10$:
	cp a,#TK_VAR 
	jrne 12$
	ldw x,(x)
	jra 18$
12$:			
	cp a,#TK_LPAREN
	jrne 16$
	call relation
	pushw x 
	ld a,#TK_RPAREN 
	call expect
	popw x 
	jra 18$	
16$:
	_unget_token
	clr a 
	jra 20$ 
18$: 
	ld a,#TK_MINUS 
	cp a,(NEG,sp)
	jrne 19$
	negw x
19$:
	ld a,#TK_INTGR
20$:
	_drop VSIZE
	ret

;-----------------------------------
; term ::= factor [['*'|'/'|'%'] factor]* 
; output:
;   A    	token attribute 
;	X		integer
;-----------------------------------
	N1=1   ; int16_t
	MULOP=3
	VSIZE=3
term:
	_vars VSIZE
	call factor
	cp a,#CMD_END
	jrult term_exit
term01:	 ; check for  operator 
	ldw (N1,sp),x  ; save first factor 
	call next_token
	cp a,#CMD_END
	jrult 9$
0$:	ld (MULOP,sp),a
	and a,#TK_GRP_MASK
	cp a,#TK_GRP_MULT
	jreq 1$
	_unget_token 
	jra 9$
1$:	; got *|/|%
	call factor
	cp a,#TK_INTGR
	jreq 2$ 
	jp syntax_error
2$:	ldw y,x 
	ldw x,(N1,sp)
	ld a,(MULOP,sp) 
	cp a,#TK_MULT 
	jrne 3$
	call multiply 
	jra term01
3$: cp a,#TK_DIV 
	jrne 4$ 
	call divide 
	jra term01 
4$: call modulo
	jra term01 
9$: ldw x,(N1,sp)
	ld a,#TK_INTGR 	
term_exit:
	_drop VSIZE 
	ret 

;-------------------------------
;  expr ::= term [['+'|'-'] term]*
;  result range {-32768..32767}
;  output:
;   A    token attribute 
;   X	 integer   
;-------------------------------
	N1=1 
	OP=3 
	VSIZE=3 
expression:
	_vars VSIZE 
	call term
	cp a,#CMD_END 
	jrult expr_exit 
0$:	ldw (N1,sp),x 
	call next_token
	cp a,#CMD_END 
	jrult 9$ 
1$:	ld (OP,sp),a  
	and a,#TK_GRP_MASK
	cp a,#TK_GRP_ADD 
	jreq 2$ 
	_unget_token
	jra 9$
2$: 
	call term
	cp a,#TK_INTGR 
	jreq 3$
	jp syntax_error
3$:	ldw acc16,x 
	ldw x,(N1,sp)
	ld a,(OP,sp)
	cp a,#TK_PLUS 
	jrne 4$
	addw x,acc16
	jra 0$ 
4$:	subw x,acc16
	jra 0$
9$: ldw x,(N1,sp)
	ld a,#TK_INTGR	
expr_exit:
	_drop VSIZE 
	ret 

;---------------------------------------------
; rel ::= expr rel_op expr
; rel_op ::=  '=','<','>','>=','<=','<>','><'
;  relation return  integer , zero is false 
;  output:
;    A 		token attribute  
;	 X		integer 
;---------------------------------------------
	N1=1
	RELOP=3
	VSIZE=3 
relation: 
	_vars VSIZE
	call expression
	cp a,#CMD_END  
	jrult rel_exit 
	; expect rel_op or leave 
	ldw (N1,sp),x 
	call next_token 
	cp a,#CMD_END 
	jrult 9$
1$:	
	ld (RELOP,sp),a 
	and a,#TK_GRP_MASK
	cp a,#TK_GRP_RELOP 
	jreq 2$
	_unget_token  
	jra 9$
2$:	; expect another expression or error 
	call expression
	cp a,#TK_INTGR 
	jreq 3$
	jp syntax_error 
3$:	ldw acc16,x 
	ldw x,(N1,sp) 
	subw x,acc16
	jrne 4$
	mov acc8,#2 ; n1==n2
	jra 6$ 
4$: 
	jrsgt 5$  
	mov acc8,#4 ; n1<2 
	jra 6$
5$:
	mov acc8,#1 ; n1>n2 
6$:
	clrw x 
	ld a, acc8  
	and a,(RELOP,sp)
	tnz a 
	jreq 10$
	incw x 
7$:	 
	jra 10$  	
9$: ldw x,(N1,sp)
10$:
	ld a,#TK_INTGR
rel_exit: 	 
	_drop VSIZE
	ret 

;--------------------------------
; BASIC: SHOW 
; print stack content in hexadecimal bytes 
; 16 bytes per row 
;--------------------------------
show:
	ldw x,#cstk_prompt
	call puts 
	ldw x,sp 
	addw x,#3 ; ignore return address
	ldw y,#RAM_SIZE  
	ldw acc16,x 
	subw y,acc16
	call hex_dump
	clr a 
	ret

cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"


;--------------------------------------------
; BASIC: HEX 
; select hexadecimal base for integer print
;---------------------------------------------
hex_base:
	mov base,#16 
	ret 

;--------------------------------------------
; BASIC: DEC 
; select decimal base for integer print
;---------------------------------------------
dec_base:
	mov base,#10
	ret 

;------------------------
; BASIC: SIZE 
; return free size in text area
; output:
;   A 		TK_INTGR
;   X 	    size integer
;--------------------------
size:
	ldw x,#tib 
	subw x,txtend 
	ld a,#TK_INTGR
	ret 


;------------------------
; BASIC: UBOUND  
; return array variable size 
; output:
;   A 		TK_INTGR
;   X 	    array size 
;--------------------------
ubound:
	ldw x,#tib
	subw x,txtend 
	ldw y,basicptr 
	cpw y,txtend 
	jrult 1$
	push count 
	push #0 
	subw x,(1,sp)
	_drop 2 
1$:	srlw x 
	ldw array_size,x
	ld a,#TK_INTGR
	ret 

;-----------------------------
; BASIC: LET var=expr 
; variable assignement 
; output:
;   A 		TK_NONE 
;-----------------------------
let:
	call next_token 
	cp a,#TK_VAR 
	jreq let_var
	cp a,#TK_ARRAY 
	jreq  let_array
	jp syntax_error
let_array:
	call get_array_element
let_var:
	pushw x  
	call next_token 
	cp a,#TK_EQUAL
	jreq 1$
	jp syntax_error
1$:	
	call relation   
	cp a,#TK_INTGR 
	jreq 2$
	jp syntax_error
2$:	
	ldw y,x 
	popw x   
	ldw (x),y   
	ret 

;----------------------------
; BASIC: LIST [[start][,end]]
; list program lines 
; form start to end 
; if empty argument list then 
; list all.
;----------------------------
	FIRST=1
	LAST=3 
	LN_PTR=5
	VSIZE=6 
list:
	ldw x,txtbgn 
	cpw x,txtend 
	jrmi 1$
	ret 
1$:	
	_vars VSIZE
	ldw (LN_PTR,sp),x 
	ldw x,(x) 
	ldw (FIRST,sp),x ; list from first line 
	ldw x,#MAX_LINENO ; biggest line number 
	ldw (LAST,sp),x 
	call arg_list
	tnz a
	jreq list_start 
	cp a,#2 
	jreq 4$
	cp a,#1 
	jreq first_line 
	jp syntax_error 
4$:	popw x 
	ldw (LAST+2,sp),x 
first_line:
	popw x
	ldw (FIRST,sp),x 
lines_skip:
	ldw x,txtbgn
2$:	ldw (LN_PTR,sp),x 
	cpw x,txtend 
	jrpl list_exit 
	ldw x,(x) ;line# 
	cpw x,(FIRST,sp)
	jrpl list_start 
	ldw x,(LN_PTR,sp) 
	ld a,(2,x)
	ld acc8,a 
	clr acc16 
	addw x,acc16
	jra 2$ 
; print loop
list_start:
	ldw x,(LN_PTR,sp)
3$:	ld a,(2,x) 
	call prt_basic_line
	ldw x,(LN_PTR,sp)
	ld a,(2,x)
	ld acc8,a 
	clr acc16 
	addw x,acc16
	cpw x,txtend 
	jrpl list_exit
	ldw (LN_PTR,sp),x
	ldw x,(x)
	cpw x,(LAST,sp)  
	jrsgt list_exit 
	ldw x,(LN_PTR,sp)
	jra 3$
list_exit:
	_drop VSIZE 
	ret

;-------------------------
; print counted string 
; input:
;   X 	address of string
;--------------------------
prt_cmd_name:
	ld a,(x)
	incw x
	and a,#15  
	push a 
1$: tnz (1,sp) 
	jreq 9$
	ld a,(x)
	call putc 
	incw x
	dec (1,sp)	 
	jra 1$
9$: pop a 
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
	ldw y,#escaped 
	addw y,acc16 
	ld a,(y)
	jra 2$
9$: ld a,#'"
	call putc 
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
var_name:
		subw x,#vars 
		ld a,xl 
		srl a 
		add a,#'A 
		ret 


;--------------------------
; decompile line from token list 
; input:
;   A       stop at this position 
;   X 		pointer at line
; output:
;   none 
;--------------------------	
	BASE_SAV=1
	WIDTH_SAV=2
	XSAVE=3
	LLEN=5
	VSIZE=5 
prt_basic_line:
	_vars VSIZE
	ld (LLEN,sp),a  
	ld a,base
	ld (BASE_SAV,sp),a  
	ld a,tab_width 
	ld (WIDTH_SAV,sp),a 
	ldw ptr16,x
	ldw x,(x)
	mov base,#10
	mov tab_width,#5
	call print_int ; print line number 
	ld a,#SPACE 
	call putc 
	clr tab_width
	ldw x,#3
1$:	ld a,xl 
	cp a,(LLEN,sp)
	jrmi 2$
	jp 20$
2$:	 
	ld a,([ptr16],x)
	incw x 
	ldw (XSAVE,sp),x 
	ldw x,([ptr16],x)
	tnz a 
	jrmi 3$
	cp a,#TK_QSTR 
	jreq 6$
	cp a,#TK_CHAR 
	jreq 7$
	jra 8$
;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST
3$:	
	cp a,#TK_VAR 
	jreq 4$
	cp a,#TK_INTGR
	jreq 5$
	cpw x,#remark 
	jrne 30$
	ld a,#''
	call putc 
	ldw x,(XSAVE,sp)
	addw x,#2
	addw x,ptr16  
	call puts 
	jp 20$ 
30$:
	ld a,#SPACE 
	call putc 
	call cmd_name
	call prt_cmd_name
	ld a,#SPACE 
	call putc 
31$:
	ldw x,(XSAVE,sp)
	addw x,#2
	jra 1$
;; TK_VAR 
4$:
;	ld a,#SPACE 
;	call putc 
	call var_name
	call putc 
	jra 31$
;; TK_INTGR
5$:
;	ld a,#SPACE 
;	call putc
	call print_int 
	jra 31$
;; TK_QSTR
6$:
	ldw x,(XSAVE,sp)
	addw x,ptr16 
	call prt_quote  
	subw x,ptr16  
	jp 1$
;; TK_CHAR 
7$:
	ld a,#'\ 
	call putc 
	ld a,xh 
	call putc 
	ldw x,(XSAVE,sp)
	incw x 
	jp 1$ 
8$: cp a,#TK_COLON 
	jrne 9$
	ld a,#':
81$:
	call putc
82$:
	ldw x,(XSAVE,sp)
	jp 1$ 
9$: 
	cp a,#TK_SHARP
	jrugt 10$ 
	sub a,#TK_ARRAY 
	clrw y 
	ld yl,a
	addw y,#single_char 
	ld a,(y)
	jra 81$ 
10$: 
	cp a,#TK_MINUS 
	jrugt 11$
	sub a,#TK_PLUS 
	clrw y 
	ld yl,a 
	addw y,#add_char 
	ld a,(y)
	jra 81$
11$:
    cp a,#TK_MOD 
	jrugt 12$
	sub a,#TK_MULT
	clrw y 
	ld yl,a 
	addw y,#mul_char
	ld a,(y)
	jra 81$
12$:
	sub a,#TK_GT  
	sll a 
	clrw x 
	ld xl,a 
	addw x,#relop_str 
	ldw x,(x)
	call puts 
	jra 82$
20$: 
	ld a,#CR 
	call putc
	ld a,(WIDTH_SAV,sp) 
	ld tab_width,a 
	ld a,(BASE_SAV,sp) 
	ld base,a
	_drop VSIZE 
	ret 

single_char: .byte '@','(',')',',','#'
add_char: .byte '+','-'
mul_char: .byte '*','/','%'
relop_str: .word gt,equal,ge,lt,le,ne 
gt: .asciz ">"
equal: .asciz "="
ge: .asciz ">="
lt: .asciz "<"
le: .asciz "<="
ne:  .asciz "<>"


;---------------------------------
; BASIC: PRINT|? arg_list 
; print values from argument list
;----------------------------------
	COMMA=1
	VSIZE=1
print:
push #0 ; local variable COMMA 
reset_comma:
	clr (COMMA,sp)
prt_loop:
	call next_token
	cp a,#CMD_END 
	jrult print_exit ; colon or end of line 
	cp a,#TK_QSTR
	jreq 1$
	cp a,#TK_CHAR 
	jreq 2$ 
	cp a,#TK_CFUNC 
	jreq 3$
	cp a,#TK_COMMA 
	jreq 4$
	cp a,#TK_SHARP 
	jreq 5$
	jra 7$ 
1$:	; print string 
	call puts
	jra reset_comma
2$:	; print character 
	ld a,xl 
	call putc 
	jra reset_comma 
3$: ; print character function value  	
	call (x)
	ld a,xl 
	call putc
	jra reset_comma 
4$: ; set comma state 
	ld a,#255 
	ld (COMMA,sp),a  
	jp prt_loop   
5$: ; # character must be followed by an integer   
	call next_token
	cp a,#TK_INTGR 
	jreq 6$
	jp syntax_error 
6$: ; set tab width
	ld a,xl 
	and a,#15 
	ld tab_width,a 
	jra reset_comma 
7$:	
	_unget_token
	call relation 
	cp a,#TK_INTGR
	jreq 8$
	_unget_token
	jp print_exit 
8$: call print_int 
	jra reset_comma 
print_exit:
	tnz (COMMA,sp)
	jrne 9$
	ld a,#CR 
    call putc 
9$:	_drop VSIZE 
	ret 

print_type: 

;----------------------
; 'save_context' and
; 'rest_context' must be 
; called at the same 
; call stack depth 
; i.e. SP must have the 
; save value at  
; entry point of both 
; routine. 
;---------------------
	CTXT_SIZE=4 ; size of saved data 
;--------------------
; save current BASIC
; interpreter context 
; on stack 
;--------------------
	_argofs 0 
	_arg BPTR 1
	_arg IN 3
	_arg CNT 4
save_context:
	ldw x,basicptr 
	ldw (BPTR,sp),x
	ld a,in 
	ld (IN,sp),a
	ld a,count 
	ld (CNT,sp),a  
	ret

;-----------------------
; restore previously saved 
; BASIC interpreter context 
; from stack 
;-------------------------
rest_context:
	ldw x,(BPTR,sp)
	ldw basicptr,x 
	ld a,(IN,sp)
	ld in,a
	ld a,(CNT,sp)
	ld count,a  
	ret



;------------------------------------------
; BASIC: INPUT [string]var[,[string]var]
; input value in variables 
; [string] optionally can be used as prompt 
;-----------------------------------------
	CX_BPTR=1
	CX_IN=3
	CX_CNT=4
	SKIP=5
	VAR_ADDR=6
	VSIZE=7
input_var:
	_vars VSIZE 
input_loop:
	clr (SKIP,sp)
	call next_token 
	cp a,#TK_QSTR 
	jrne 1$ 
	call puts 
	cpl (SKIP,sp)
	call next_token 
1$: cp a,#TK_VAR  
	jreq 2$ 
	jp syntax_error
2$:	ldw (VAR_ADDR,sp),x 
	tnz (SKIP,sp)
	jrne 21$ 
	call var_name 
	call putc   
21$:
	ld a,#':
	call putc 
	call save_context 
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
	call rest_context 
	jp syntax_error
3$: ldw y,(VAR_ADDR,sp) 
	ldw (y),x 
	call rest_context
	call next_token 
	cp a,#TK_COMMA 
	jreq input_loop 
	cp a,#TK_COLON 
    jrule input_exit 
	jp syntax_error 
input_exit:
	_drop VSIZE 
	ret 


;---------------------
; BASIC: REMARK | ' 
; skip comment to end of line 
;---------------------- 
remark:
	mov in,count 
 	ret 


;---------------------
; BASIC: WAIT addr,mask[,xor_mask] 
; read in loop 'addr'  
; apply & 'mask' to value 
; loop while result==0.  
; 'xor_mask' is used to 
; invert the wait logic.
; i.e. loop while not 0.
;---------------------
	XMASK=1 
	MASK=2
	ADDR=3
	VSIZE=4
wait: 
	_vars VSIZE
	clr (XMASK,sp) 
	call arg_list 
	cp a,#2
	jruge 0$
	jp syntax_error 
0$:	cp a,#3
	jrult 1$
	popw x 
	ld a,xl
	ld (XMASK,sp),a 
1$: popw x ; mask 
	ld a,xl 
	ld (MASK,sp),a 
	popw x ; address 
2$:	ld a,(x)
	and a,(MASK,sp)
	xor a,(XMASK,sp)
	jreq 2$ 
	_drop VSIZE 
	ret 

;---------------------
; BASIC: BSET addr,mask
; set bits at 'addr' corresponding 
; to those of 'mask' that are at 1.
; arguments:
; 	addr 		memory address RAM|PERIPHERAL 
;   mask        mask|addr
; output:
;	none 
;--------------------------
bit_set:
	call arg_list 
	cp a,#2	 
	jreq 1$ 
	jp syntax_error
1$: 
	popw x ; mask 
	ld a,xl 
	popw x ; addr  
	or a,(x)
	ld (x),a
	ret 

;---------------------
; BASIC: BRES addr,mask
; reset bits at 'addr' corresponding 
; to those of 'mask' that are at 1.
; arguments:
; 	addr 		memory address RAM|PERIPHERAL 
;   mask	    ~mask&*addr  
; output:
;	none 
;--------------------------
bit_reset:
	call arg_list 
	cp a,#2  
	jreq 1$ 
	jp syntax_error
1$: 
	popw x ; mask 
	ld a,xl 
	cpl a 
	popw x ; addr  
	and a,(x)
	ld (x),a 
	ret 

;---------------------
; BASIC: BTOGL addr,mask
; toggle bits at 'addr' corresponding 
; to those of 'mask' that are at 1.
; arguments:
; 	addr 		memory address RAM|PERIPHERAL 
;   mask	    mask^*addr  
; output:
;	none 
;--------------------------
bit_toggle:
	call arg_list 
	cp a,#2 
	jreq 1$ 
	jp syntax_error
1$: popw x ; mask 
	ld a,xl 
	popw x ; addr  
	xor a,(x)
	ld (x),a 
	ret 


;---------------------
; BASIC: BTEST(addr,bit)
; return bit value at 'addr' 
; bit is in range {0..7}.
; arguments:
; 	addr 		memory address RAM|PERIPHERAL 
;   bit 	    bit position {0..7}  
; output:
;	none 
;--------------------------
bit_test:
	call func_args 
	cp a,#2
	jreq 0$
	jp syntax_error
0$:	
	popw x 
	ld a,xl 
	and a,#7
	push a   
	ld a,#1 
1$: tnz (1,sp)
	jreq 2$
	sll a 
	dec (1,sp)
	jra 1$
2$: _drop 1 
	popw x 
	and a,(x)
	jreq 3$
	ld a,#1 
3$:	clrw x 
	ld xl,a 
	ld a,#TK_INTGR
	ret


;--------------------
; BASIC: POKE addr,byte
; put a byte at addr 
;--------------------
poke:
	call arg_list 
	cp a,#2
	jreq 1$
	jp syntax_error
1$:	
	popw x  
    ld a,xl 
	popw x 
	ld (x),a 
	ret 

;-----------------------
; BASIC: PEEK(addr)
; get the byte at addr 
; input:
;	none 
; output:
;	X 		value 
;-----------------------
peek:
	call func_args
	cp a,#1 
	jreq 1$
	jp syntax_error
1$: popw x 
	ld a,(x)
	clrw x 
	ld xl,a 
	ld a,#TK_INTGR
	ret 

;---------------------------
; BASIC IF expr : instructions
; evaluate expr and if true 
; execute instructions on same line. 
;----------------------------
if: 
	call relation 
	cp a,#TK_INTGR
	jreq 1$ 
	jp syntax_error
1$:	clr a 
	tnzw x 
	jrne 9$  
;skip to next line
	mov in,count
9$:	ret 

;------------------------
; BASIC: FOR var=expr 
; set variable to expression 
; leave variable address 
; on stack and set
; FLOOP bit in 'flags'
;-----------------
	RETL1=1 ; return address  
	FSTEP=3  ; variable increment
	LIMIT=5 ; loop limit 
	CVAR=7   ; control variable 
	INW=9   ;  in.w saved
	BPTR=11 ; baseptr saved
	VSIZE=10  
for: ; { -- var_addr }
	popw x ; call return address 
	_vars VSIZE 
	pushw x  ; RETL1 
	ld a,#TK_VAR 
	call expect
	ldw (CVAR,sp),x  ; control variable 
	call let_var 
	bset flags,#FLOOP 
; open space on stack for loop data 
	clrw x 
	ldw (BPTR,sp),x 
	ldw (INW,sp),x 
	call next_token 
	cp a,#TK_CMD 
	jreq 1$
	jp syntax_error
1$:  
	cpw x,#to 
	jreq to
	jp syntax_error 

;-----------------------------------
; BASIC: TO expr 
; second part of FOR loop initilization
; leave limit on stack and set 
; FTO bit in 'flags'
;-----------------------------------
to: ; { var_addr -- var_addr limit step }
	btjt flags,#FLOOP,1$
	jp syntax_error
1$: call relation  
	cp a,#TK_INTGR 
	jreq 2$ 
	jp syntax_error
2$: ldw (LIMIT,sp),x
;	ldw x,in.w 
	call next_token
	cp a,#TK_NONE  
	jreq 4$ 
	cp a,#TK_CMD
	jrne 3$
	cpw x,#step 
	jreq step
3$:	
	_unget_token   	 
4$:	
	ldw x,#1   ; default step  
	ldw (FSTEP,sp),x 
	jra store_loop_addr 


;----------------------------------
; BASIC: STEP expr 
; optional third par of FOR loop
; initialization. 	
;------------------------------------
step: ; {var limit -- var limit step}
	btjt flags,#FLOOP,1$
	jp syntax_error
1$: call relation
	cp a,#TK_INTGR
	jreq 2$
	jp syntax_error
2$:	ldw (FSTEP,sp),x ; step
; leave loop back entry point on cstack 
; cstack is 1 call deep from interpreter
store_loop_addr:
	ldw x,basicptr  
	ldw (BPTR,sp),x 
	ldw x,in.w 
	ldw (INW,sp),x   
	bres flags,#FLOOP 
	inc loop_depth  
	ret 

;--------------------------------
; BASIC: NEXT var 
; FOR loop control 
; increment variable with step 
; and compare with limit 
; loop if threshold not crossed.
; else stack. 
; and decrement 'loop_depth' 
;--------------------------------
next: ; {var limit step retl1 -- [var limit step ] }
	tnz loop_depth 
	jrne 1$ 
	jp syntax_error 
1$: 
	ld a,#TK_VAR 
	call expect
; check for good variable after NEXT 	 
	cpw x,(CVAR,sp)
	jreq 2$  
	jp syntax_error ; not the good one 
2$: ; increment variable 
	ldw x,(x)  ; get var value 
	addw x,(FSTEP,sp) ; var+step 
	ldw y,(CVAR,sp)
	ldw (y),x ; save var new value 
; check sign of STEP  
	ld a,#0x80
	bcp a,(FSTEP,sp)
	jrpl 4$
;negative step 
	cpw x,(LIMIT,sp)
	jrslt loop_done
	jra loop_back 
4$: ; positive step
	cpw x,(LIMIT,sp)
	jrsgt loop_done
loop_back:
	ldw x,(BPTR,sp)
	ldw basicptr,x 
	btjf flags,#FRUN,1$ 
	ld a,(2,x)
	ld count,a
1$:	ldw x,(INW,sp)
	ldw in.w,x 
	ret 
loop_done:
	; remove loop data from stack  
	popw x
	_drop VSIZE 
	dec loop_depth 
;	pushw x 
;	ret 
	jp (x)

;----------------------------
; called by goto/gosub
; to get target line number 
;---------------------------
get_target_line:
	call relation 
	cp a,#TK_INTGR
	jreq 1$
	jp syntax_error
1$:	call search_lineno  
	tnzw x 
	jrne 2$ 
	ld a,#ERR_NO_LINE 
	jp tb_error 
2$:	ret 

;------------------------
; BASIC: GOTO line# 
; jump to line# 
; here cstack is 2 call deep from interpreter 
;------------------------
goto:
	btjt flags,#FRUN,0$ 
	ld a,#ERR_RUN_ONLY
	jp tb_error 
	ret 
0$:	call get_target_line
jp_to_target:
	ldw basicptr,x 
	ld a,(2,x)
	ld count,a 
	mov in,#3 
	ret 


;--------------------
; BASIC: GOSUB line#
; basic subroutine call
; actual line# and basicptr 
; are saved on cstack
; here cstack is 2 call deep from interpreter 
;--------------------
	RET_ADDR=3
	RET_INW=5
	VSIZE=4  
gosub:
	btjt flags,#FRUN,0$ 
	ld a,#ERR_RUN_ONLY
	jp tb_error 
	ret 
0$:	popw x 
	_vars VSIZE  
	pushw x 
	ldw x,basicptr
	ldw (RET_ADDR,sp),x 
	call get_target_line  
	pushw x 
	ldw x,in.w 
	ldw (RET_INW+2,sp),x
	popw x 
	jra jp_to_target

;------------------------
; BASIC: RETURN 
; exit from a subroutine 
; 
;------------------------
return:
	btjt flags,#FRUN,0$ 
	ld a,#ERR_RUN_ONLY
	jp tb_error 
0$:	
	ldw x,(RET_ADDR,sp) 
	ldw basicptr,x
	ld a,(2,x)
	ld count,a  
	ldw x,(RET_INW,sp)
	ldw in.w,x 
	popw x 
	_drop VSIZE 
	pushw x
	ret  


;----------------------------------
; BASIC: RUN
; run BASIC program in RAM
;----------------------------------- 
run: 
	btjf flags,#FRUN,0$  
	clr a 
	ret
0$: 
	btjf flags,#FBREAK,1$
	_drop 2 
	call rest_context
	_drop CTXT_SIZE 
	bres flags,#FBREAK 
	bset flags,#FRUN 
	jp interpreter 
1$:	ldw x,txtbgn
	cpw x,txtend 
	jrmi run_it 
	ldw x,#err_no_prog
	call puts 
	mov in,count
	ret 
run_it:	 
    call ubound 
	_drop 2 ; drop return address 
; clear data pointer 
	clrw x 
	ldw data_ptr,x 
	clr data_ofs 
	clr data_len 
; initialize BASIC pointer 
	ldw x,txtbgn 
	ldw basicptr,x 
	ld a,(2,x)
	ld count,a
	mov in,#3	
	bset flags,#FRUN 
	jp interpreter 


;----------------------
; BASIC: END
; end running program
;---------------------- 
cmd_end: 
; clean stack 
	ldw x,#STACK_EMPTY
	ldw sp,x 
	jp warm_start


;-----------------------
; BASIC: TONE expr1,expr2
; used TIMER2 channel 1
; to produce a tone 
; arguments:
;    expr1   frequency 
;    expr2   duration msec.
;---------------------------
tone:
	call arg_list 
	cp a,#2 
	jreq 1$
	jp syntax_error 
1$: 
	popw x ; duration
	popw y ; frequency 
beep:  
	pushw x 
	ldw x,#TIM2_CLK_FREQ
	divw x,y 
; round to nearest integer 
	cpw y,#TIM2_CLK_FREQ/2
	jrmi 2$
	incw x 
2$:	 
	ld a,xh 
	ld TIM2_ARRH,a 
	ld a,xl 
	ld TIM2_ARRL,a 
; 50% duty cycle 
	ccf 
	rrcw x 
	ld a,xh 
	ld TIM2_CCR1H,a 
	ld a,xl
	ld TIM2_CCR1L,a
	bset TIM2_CCER1,#TIM2_CCER1_CC1E
	bset TIM2_CR1,#TIM2_CR1_CEN
	bset TIM2_EGR,#TIM2_EGR_UG
	popw x 
	call pause02
	bres TIM2_CCER1,#TIM2_CCER1_CC1E
	bres TIM2_CR1,#TIM2_CR1_CEN 
	ret 

;-------------------------------
; BASIC: ADCON 0|1 [,divisor]  
; disable/enanble ADC 
;-------------------------------
	ONOFF=3 
	DIVSOR=1
	VSIZE=4 
power_adc:
	call arg_list 
	cp a,#2	
	jreq 1$
	cp a,#1 
	jreq 0$ 
	jp syntax_error 
0$: ldw x,#0
	pushw x  ; divisor 
1$: ldw x,(ONOFF,sp)
	tnzw x 
	jreq 2$ 
	ldw x,(DIVSOR,sp) ; divisor 
	ld a,xl
	and a,#7
	swap a 
	ld ADC_CR1,a
	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
	bset ADC_CR1,#ADC_CR1_ADON 
	_usec_dly 7 
	jra 3$
2$: bres ADC_CR1,#ADC_CR1_ADON
	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
3$:	_drop VSIZE 
	ret

;-----------------------------
; BASIC: ADCREAD (channel)
; read adc channel {0..5}
; output:
;   A 		TK_INTGR 
;   X 		value 
;-----------------------------
analog_read:
	call func_args 
	cp a,#1 
	jreq 1$
	jp syntax_error
1$: popw x 
	cpw x,#5 
	jrule 2$
	ld a,#ERR_BAD_VALUE
	jp tb_error 
2$: ld a,xl
	ld acc8,a 
	ld a,#5
	sub a,acc8 
	ld ADC_CSR,a
	bset ADC_CR2,#ADC_CR2_ALIGN
	bset ADC_CR1,#ADC_CR1_ADON
	btjf ADC_CSR,#ADC_CSR_EOC,.
	ldw x,ADC_DRH
	ld a,#TK_INTGR
	ret 

;-----------------------
; BASIC: DREAD(pin)
; Arduino pins 
; read state of a digital pin 
; pin# {0..15}
; output:
;    A 		TK_INTGR
;    X      0|1 
;-------------------------
	PINNO=1
	VSIZE=1
digital_read:
	_vars VSIZE 
	call func_args
	cp a,#1
	jreq 1$
	jp syntax_error
1$: popw x 
	cpw x,#15 
	jrule 2$
	ld a,#ERR_BAD_VALUE
	jp tb_error 
2$:	call select_pin 
	ld (PINNO,sp),a
	ld a,(GPIO_IDR,x)
	tnz (PINNO,sp)
	jreq 8$
3$: srl a 
	dec (PINNO,sp)
	jrne 3$ 
8$: and a,#1 
	clrw x 
	ld xl,a 
	ld a,#TK_INTGR
	_drop VSIZE
	ret

;-----------------------
; BASIC: DWRITE pin,0|1
; Arduino pins 
; write to a digital pin 
; pin# {0..15}
; output:
;    A 		TK_INTGR
;    X      0|1 
;-------------------------
	PINNO=1
	PINVAL=2
	VSIZE=2
digital_write:
	_vars VSIZE 
	call arg_list  
	cp a,#2 
	jreq 1$
	jp syntax_error
1$: popw x 
	ld a,xl 
	ld (PINVAL,sp),a
	popw x 
	cpw x,#15 
	jrule 2$
	ld a,#ERR_BAD_VALUE
	jp tb_error 
2$:	call select_pin 
	ld (PINNO,sp),a 
	ld a,#1
	tnz (PINNO,sp)
	jreq 4$
3$: sll a
	dec (PINNO,sp)
	jrne 3$
4$: tnz (PINVAL,sp)
	jrne 5$
	cpl a 
	and a,(GPIO_ODR,x)
	jra 8$
5$: or a,(GPIO_ODR,x)
8$: ld (GPIO_ODR,x),a 
	_drop VSIZE 
	ret


;-----------------------
; BASIC: STOP
; stop progam execution  
; without resetting pointers 
; the program is resumed
; with RUN 
;-------------------------
stop:
	btjt flags,#FRUN,2$
	clr a
	ret 
2$:	 
; create space on cstack to save context 
	ldw x,#break_point 
	call puts 
	_drop 2 ;drop return address 
	_vars CTXT_SIZE ; context size 
	call save_context 
	ldw x,#tib 
	ldw basicptr,x
	clr (x)
	clr count  
	clrw x 
	ldw in.w,x
	bres flags,#FRUN 
	bset flags,#FBREAK
	jp interpreter 
break_point: .asciz "\nbreak point, RUN to resume.\n"

;-----------------------
; BASIC: NEW
; from command line only 
; free program memory
; and clear variables 
;------------------------
new: 
	btjf flags,#FRUN,0$ 
	ret 
0$:	
	call clear_basic 
	ret 
	 
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
	jrmi 1$
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
	call strlen 
	addw x,#3 
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
	NEW_FREE=1 
	VSIZE=3 
forget:
	_vars VSIZE 
	call next_token 
	cp a,#TK_NONE 
	jreq 3$ 
	cp a,#TK_QSTR
	jreq 1$
	jp syntax_error
1$: ldw y,x 
	mov in,count 
	call search_file
	jrc 2$
	ld a,#ERR_NOT_FILE 
	jp tb_error 
2$: 
	ldw x,farptr
	ld a,farptr+2
	jra 4$ 
3$: ; forget all files 
	ldw x,#0x100
	clr a 
	ldw farptr,x 
	ld farptr+2,a 
4$:	; save new free address 
	ldw (NEW_FREE,sp),x
	ld (NEW_FREE+2,sp),a 
	call move_erase_to_ram
5$: call block_erase 
	ldw x,#BLOCK_SIZE 
	call incr_farptr 
	call row_align 
; check if all blocks erased
	ld a,farptr+2  
	sub a,ffree+2
	ld a,farptr+1 
	sbc a,ffree+1 
	ld a,farptr 
	sbc a,ffree 
	jrmi 5$ 
	ld a,(NEW_FREE+2,sp)
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

;---------------------
; BASIC: WRITE expr1,expr2[,expr]* 
; write 1 or more byte to FLASH or EEPROM
; starting at address  
; input:
;   expr1  	is address 
;   expr2,...,exprn   are bytes to write
; output:
;   none 
;---------------------
	ADDR=1
	VSIZ=2 
write:
	_vars VSIZE 
	clr farptr ; expect 16 bits address 
	call expression
	cp a,#TK_INTGR 
	jreq 0$
	jp syntax_error
0$: ldw (ADDR,sp),x 
	call next_token 
	cp a,#TK_COMMA 
	jreq 1$ 
	jra 9$ 
1$:	call expression
	cp a,#TK_INTGR
	jreq 2$
	jp syntax_error
2$:	ld a,xl 
	ldw x,(ADDR,sp) 
	ldw farptr+1,x 
	clrw x 
	call write_byte
	ldw x,(ADDR,sp)
	incw x 
	jra 0$ 
9$:
	_drop VSIZE
	ret 


;---------------------
;BASIC: CHAR(expr)
; évaluate expression 
; and take the 7 least 
; bits as ASCII character
;---------------------
char:
	call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error
1$:	popw x 
	ld a,xl 
	and a,#0x7f 
	ld xl,a
	ld a,#TK_CHAR
	ret

;---------------------
; BASIC: ASC(string|char)
; extract first character 
; of string argument 
; return it as TK_INTGR 
;---------------------
ascii:
	ld a,#TK_LPAREN
	call expect 
	call next_token 
	cp a,#TK_QSTR 
	jreq 1$
	cp a,#TK_CHAR 
	jreq 2$ 
	jp syntax_error
1$: 
	ld a,(x) 
	clrw x
	ld xl,a 
2$: 
	pushw x 
	ld a,#TK_RPAREN 
	call expect
	popw x 
	ld a,#TK_INTGR 
	ret 

;---------------------
;BASIC: KEY
; wait for a character 
; received from STDIN 
; input:
;	none 
; output:
;	X 		ASCII character 
;---------------------
key:
	call getc 
	clrw x 
	ld xl,a 
	ld a,#TK_INTGR
	ret

;----------------------
; BASIC: QKEY
; Return true if there 
; is a character in 
; waiting in STDIN 
; input:
;  none 
; output:
;   X 		0|-1 
;-----------------------
qkey:: 
	clrw x 
	tnz rx_char
	jreq 9$ 
	cplw x 
9$: ld a,#TK_INTGR
	ret 

;---------------------
; BASIC: GPIO(expr,reg)
; return gpio address 
; expr {0..8}
; input:
;   none 
; output:
;   X 		gpio register address
;----------------------------
	PORT=3
	REG=1 
	VSIZE=4 
gpio:
	call func_args 
	cp a,#2
	jreq 1$
	jp syntax_error  
1$:	
	ldw x,(PORT,sp)
	jrmi bad_port
	cpw x,#9
	jrpl bad_port
	ld a,#5
	mul x,a
	addw x,#GPIO_BASE 
	ldw (PORT,sp),x  
	ldw x,(REG,sp) 
	addw x,(PORT,sp)
	ld a,#TK_INTGR
	_drop VSIZE 
	ret
bad_port:
	ld a,#ERR_BAD_VALUE
	jp tb_error


;-------------------------
; BASIC: UFLASH 
; return user flash address
; input:
;  none 
; output:
;	A		TK_INTGR
;   X 		user address 
;---------------------------
uflash:
	ldw x,#user_space 
	ld a,#TK_INTGR 
	ret 


;---------------------
; BASIC: USR(addr[,arg])
; execute a function written 
; in binary code.
; binary fonction should 
; return token attribute in A 
; and value in X. 
; input:
;   addr	routine address 
;   arg 	is an optional argument 
; output:
;   A 		token attribute 
;   X       returned value 
;---------------------
usr:
	pushw y 	
	call func_args 
	cp a,#1 
	jreq 2$
	cp a,#2
	jreq 2$  
	jp syntax_error 
2$: popw y  ; arg|addr 
	cp a,#1
	jreq 3$
	popw x ; addr
	exgw x,y 
3$: call (y)
	popw y 
	ret 

;------------------------------
; BASIC: BYE 
; halt mcu in its lowest power mode 
; wait for reset or external interrupt
; do a cold start on wakeup.
;------------------------------
bye:
	btjf UART1_SR,#UART_SR_TC,.
	halt
	jp cold_start  

;----------------------------------
; BASIC: AUTORUN ["file_name"] 
; record in eeprom at adrress AUTORUN_NAME
; the name of file to load and execute
; at startup. 
; empty string delete autorun name 
; no argument display autorun name  
; input:
;   file_name   file to execute 
; output:
;   none
;-----------------------------------
autorun: 
	btjf flags,#FRUN,0$ 
	jreq 0$ 
	ld a,#ERR_CMD_ONLY 
	jp tb_error 
0$:	
	call next_token
	jrne 1$
	ldw x,#AUTORUN_NAME
	call puts 
	clr a 
	ret 
1$:
	cp a,#TK_QSTR
	jreq 2$
	jp syntax_error 
2$:	
	tnz (x) 
	jrne 3$
; empty string, delete autorun 	
	call cancel_autorun
	mov in,count 
	ret 
3$:	pushw x 
	ldw y,x  
	call search_file 
	jrc 4$ 
	ld a,#ERR_NOT_FILE
	jp tb_error  
4$: 
	mov in,count 
	clr farptr 
	ldw x,#AUTORUN_NAME
	ldw farptr+1,x 
	ldw x,(1,sp)  
	call strlen  ; return length in X 
	incw x 
	popw y 
	pushw x 
	clrw x 
	call write_block 
	_drop 2 
	ret 

;----------------------------------
; BASIC: SLEEP 
; halt mcu until reset or external
; interrupt.
; Resume progam after SLEEP command
;----------------------------------
sleep:
	btjf UART1_SR,#UART_SR_TC,.
	bset flags,#FSLEEP
	halt 
	ret 

;-------------------------------
; BASIC: PAUSE expr 
; suspend execution for n msec.
; input:
;	none
; output:
;	none 
;------------------------------
pause:
	call expression
	cp a,#TK_INTGR
	jreq pause02 
	jp syntax_error
pause02: 
1$: tnzw x 
	jreq 2$
	wfi 
	decw x 
	jrne 1$
2$:	clr a 
	ret 

;------------------------------
; BASIC: AWU expr
; halt mcu for 'expr' milliseconds
; use Auto wakeup peripheral
; all oscillators stopped except LSI
; range: 1ms - 511ms
; input:
;  none
; output:
;  none:
;------------------------------
awu:
  call expression
  cp a,#TK_INTGR
  jreq awu02
  jp syntax_error
awu02:
  cpw x,#5120
  jrmi 1$ 
  mov AWU_TBR,#15 
  ld a,#30
  div x,a
  ld a,#16
  div x,a 
  jra 4$
1$: 
  cpw x,#2048
  jrmi 2$ 
  mov AWU_TBR,#14
  ld a,#80
  div x,a 
  jra 4$   
2$:
  mov AWU_TBR,#7
3$:  
; while X > 64  divide by 2 and increment AWU_TBR 
  cpw x,#64 
  jrule 4$ 
  inc AWU_TBR 
  srlw x 
  jra 3$ 
4$:
  ld a, xl
  dec a 
  jreq 5$
  dec a 	
5$: 
  and a,#0x3e 
  ld AWU_APR,a 
  bset AWU_CSR,#AWU_CSR_AWUEN
  halt 

  ret 

;------------------------------
; BASIC: TICKS
; return msec ticks counter value 
; input:
; 	none 
; output:
;	X 		TK_INTGR
;-------------------------------
get_ticks:
	ldw x,ticks 
	ld a,#TK_INTGR
	ret 



;------------------------------
; BASIC: ABS(expr)
; return absolute value of expr.
; input:
;   none
; output:
;   X     	positive integer
;-------------------------------
abs:
	call func_args 
	cp a,#1 
	jreq 0$ 
	jp syntax_error
0$:  
    popw x   
	ld a,xh 
	bcp a,#0x80 
	jreq 2$ 
	negw x 
2$: ld a,#TK_INTGR 
	ret 

;------------------------------
; BASIC: AND(expr1,expr2)
; Apply bit AND relation between
; the 2 arguments, i.e expr1 & expr2 
; output:
; 	A 		TK_INTGR
;   X 		result 
;------------------------------
bit_and:
	call func_args 
	cp a,#2
	jreq 1$
	jp syntax_error 
1$:	popw x 
	ld a,xh 
	and a,(1,sp)
	ld xh,a 
	ld a,xl
	and a,(2,sp)
	ld xl,a 
	_drop 2 
	ld a,#TK_INTGR
	ret

;------------------------------
; BASIC: OR(expr1,expr2)
; Apply bit OR relation between
; the 2 arguments, i.e expr1 | expr2 
; output:
; 	A 		TK_INTGR
;   X 		result 
;------------------------------
bit_or:
	call func_args 
	cp a,#2
	jreq 1$
	jp syntax_error 
1$: 
	popw x 
	ld a,xh 
	or a,(1,sp)
	ld xh,a 
	ld a,xl 
	or a,(2,sp)
	ld xl,a 
	_drop 2 
	ld a,#TK_INTGR 
	ret

;------------------------------
; BASIC: XOR(expr1,expr2)
; Apply bit XOR relation between
; the 2 arguments, i.e expr1 ^ expr2 
; output:
; 	A 		TK_INTGR
;   X 		result 
;------------------------------
bit_xor:
	call func_args 
	cp a,#2
	jreq 1$
	jp syntax_error 
1$: 
	popw x 
	ld a,xh 
	xor a,(1,sp)
	ld xh,a 
	ld a,xl 
	xor a,(2,sp)
	ld xl,a 
	_drop 2 
	ld a,#TK_INTGR 
	ret 

;------------------------------
; BASIC: LSHIFT(expr1,expr2)
; logical shift left expr1 by 
; expr2 bits 
; output:
; 	A 		TK_INTGR
;   X 		result 
;------------------------------
lshift:
	call func_args
	cp a,#2 
	jreq 1$
	jp syntax_error
1$: popw y   
	popw x 
	tnzw y 
	jreq 4$
2$:	sllw x 
	decw y 
	jrne 2$
4$:  
	ld a,#TK_INTGR
	ret

;------------------------------
; BASIC: RSHIFT(expr1,expr2)
; logical shift right expr1 by 
; expr2 bits.
; output:
; 	A 		TK_INTGR
;   X 		result 
;------------------------------
rshift:
	call func_args
	cp a,#2 
	jreq 1$
	jp syntax_error
1$: popw y  
	popw x
	tnzw y 
	jreq 4$
2$:	srlw x 
	decw y 
	jrne 2$
4$:  
	ld a,#TK_INTGR
	ret

;--------------------------
; BASIC: FCPU integer
; set CPU frequency 
;-------------------------- 

fcpu:
	ld a,#TK_INTGR
	call expect 
	ld a,xl 
	and a,#7 
	ld CLK_CKDIVR,a 
	ret 

;------------------------------
; BASIC: PMODE pin#, mode 
; Arduino pin. 
; define pin as input or output
; pin#: {0..15}
; mode: INPUT|OUTPUT  
;------------------------------
	PINNO=1
	VSIZE=1
pin_mode:
	_vars VSIZE 
	call arg_list 
	cp a,#2 
	jreq 1$
	jp syntax_error 
1$: popw y ; mode 
	popw x ; Dx pin 
	call select_pin 
	ld (PINNO,sp),a  
	ld a,#1 
	tnz (PINNO,sp)
	jreq 4$
2$:	sll a 
	dec (PINNO,sp)
	jrne 2$ 
	ld (PINNO,sp),a
	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
	ld (GPIO_CR1,x),a 
4$:	cpw y,#OUTP 
	jreq 6$
; input mode
	ld a,(PINNO,sp)
	cpl a 
	and a,(GPIO_DDR,x)	; bit==0 for input. 
	jra 9$
6$: ;output mode  
	ld a,(PINNO,sp)
	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
	ld (GPIO_CR2,x),a 
	ld a,(PINNO,sp)
	or a,(GPIO_DDR,x) ; bit==1 for output 
9$:	ld (GPIO_DDR,x),a 
	_drop VSIZE 
	ret

;------------------------
; select Arduino pin 
; input:
;   X 	 {0..15} Arduino Dx 
; output:
;   A     stm8s208 pin 
;   X     base address s208 GPIO port 
;---------------------------
select_pin:
	sllw x 
	addw x,#arduino_to_8s208 
	ldw x,(x)
	ld a,xl 
	push a 
	swapw x 
	ld a,#5 
	mul x,a 
	addw x,#GPIO_BASE 
	pop a 
	ret 
; translation from Arduino D0..D15 to stm8s208rb 
arduino_to_8s208:
.byte 3,6 ; D0 
.byte 3,5 ; D1 
.byte 4,0 ; D2 
.byte 2,1 ; D3
.byte 6,0 ; D4
.byte 2,2 ; D5
.byte 2,3 ; D6
.byte 3,1 ; D7
.byte 3,3 ; D8
.byte 2,4 ; D9
.byte 4,5 ; D10
.byte 2,6 ; D11
.byte 2,7 ; D12
.byte 2,5 ; D13
.byte 4,2 ; D14
.byte 4,1 ; D15


;------------------------------
; BASIC: RND(expr)
; return random number 
; between 1 and expr inclusive
; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
; input:
; 	none 
; output:
;	X 		random positive integer 
;------------------------------
random:
	call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error
1$:  
	ld a,#0x80 
	bcp a,(1,sp)
	jreq 2$
	ld a,#ERR_BAD_VALUE
	jp tb_error
2$: 
; acc16=(x<<5)^x 
	ldw x,seedx 
	sllw x 
	sllw x 
	sllw x 
	sllw x 
	sllw x 
	ld a,xh 
	xor a,seedx 
	ld acc16,a 
	ld a,xl 
	xor a,seedx+1 
	ld acc8,a 
; seedx=seedy 
	ldw x,seedy 
	ldw seedx,x  
; seedy=seedy^(seedy>>1)
	srlw y 
	ld a,yh 
	xor a,seedy 
	ld seedy,a  
	ld a,yl 
	xor a,seedy+1 
	ld seedy+1,a 
; acc16>>3 
	ldw x,acc16 
	srlw x 
	srlw x 
	srlw x 
; x=acc16^x 
	ld a,xh 
	xor a,acc16 
	ld xh,a 
	ld a,xl 
	xor a,acc8 
	ld xl,a 
; seedy=x^seedy 
	xor a,seedy+1
	ld xl,a 
	ld a,xh 
	xor a,seedy
	ld xh,a 
	ldw seedy,x 
; return seedy modulo expr + 1 
	popw y 
	divw x,y 
	ldw x,y 
	incw x 
10$:
	ld a,#TK_INTGR
	ret 

;---------------------------------
; BASIC: WORDS 
; affiche la listes des mots du
; dictionnaire ainsi que le nombre
; de mots.
;---------------------------------
	WLEN=1 ; word length
	LLEN=2 ; character sent to console
	WCNT=3 ; count words printed 
	VSIZE=3 
words:
	_vars VSIZE
	clr (LLEN,sp)
	clr (WCNT,sp)
	ldw y,#kword_dict+2
0$:	ldw x,y
	ld a,(x)
	and a,#15 
	ld (WLEN,sp),a 
	inc (WCNT,sp)
1$:	incw x 
	ld a,(x)
	call putc 
	inc (LLEN,sp)
	dec (WLEN,sp)
	jrne 1$
	ld a,#70
	cp a,(LLEN,sp)
	jrmi 2$   
	ld a,#SPACE 
	call putc 
	inc (LLEN,sp) 
	jra 3$
2$: ld a,#CR 
	call putc 
	clr (LLEN,sp)
3$:	subw y,#2 
	ldw y,(y)
	jrne 0$ 
	ld a,#CR 
	call putc  
	clrw x 
	ld a,(WCNT,sp)
	ld xl,a 
	call print_int 
	ldw x,#words_count_msg
	call puts 
	_drop VSIZE 
	ret 
words_count_msg: .asciz " words in dictionary\n"


;-----------------------------
; BASIC: TIMER expr 
; initialize count down timer 
;-----------------------------
set_timer:
	call arg_list
	cp a,#1 
	jreq 1$
	jp syntax_error
1$: 
	popw x 
	ldw timer,x 
	ret 

;------------------------------
; BASIC: TIMEOUT 
; return state of timer 
;------------------------------
timeout:
	ldw x,timer 
logical_complement:
	cplw x 
	cpw x,#-1
	jreq 2$
	clrw x 
2$:	ld a,#TK_INTGR
	ret 

;--------------------------------
; BASIC NOT(expr) 
; return logical complement of expr
;--------------------------------
func_not:
	call func_args  
	cp a,#1
	jreq 1$
	jp syntax_error
1$:	popw x 
	jra logical_complement



;-----------------------------------
; BASIC: IWDGEN expr1 
; enable independant watchdog timer
; expr1 is delay in multiple of 62.5µsec
; expr1 -> {1..16383}
;-----------------------------------
enable_iwdg:
	call arg_list
	cp a,#1 
	jreq 1$
	jp syntax_error 
1$: popw x 
	push #0
	mov IWDG_KR,#IWDG_KEY_ENABLE
	ld a,xh 
	and a,#0x3f
	ld xh,a  
2$:	cpw x,#255
	jrule 3$
	inc (1,sp)
	rcf 
	rrcw x 
	jra 2$
3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
	pop a  
	ld IWDG_PR,a 
	ld a,xl
	dec a 
	mov IWDG_KR,#IWDG_KEY_ACCESS 
	ld IWDG_RLR,a 
	mov IWDG_KR,#IWDG_KEY_REFRESH
	ret 


;-----------------------------------
; BASIC: IWDGREF  
; refresh independant watchdog count down 
; timer before it reset MCU. 
;-----------------------------------
refresh_iwdg:
	mov IWDG_KR,#IWDG_KEY_REFRESH 
	ret 


;-------------------------------------
; BASIC: LOG(expr)
; return logarithm base 2 of expr 
; this is the position of most significant
; bit set. 
; input: 
; output:
;   X     log2 
;   A     TK_INTGR 
;*********************************
log2:
	call func_args 
	cp a,#1 
	jreq 1$
	jp syntax_error 
1$: popw x 
leading_one:
	tnzw x 
	jreq 4$
	ld a,#15 
2$: rlcw x 
    jrc 3$
	dec a 
	jra 2$
3$: clrw x 
    ld xl,a
4$:	ld a,#TK_INTGR
	ret 

;-----------------------------------
; BASIC: BIT(expr) 
; expr ->{0..15}
; return 2^expr 
; output:
;    x    2^expr 
;-----------------------------------
bitmask:
    call func_args 
	cp a,#1
	jreq 1$
	jp syntax_error 
1$: popw x 
	ld a,xl 
	and a,#15
	clrw x 
	incw x 
2$: tnz a 
	jreq 3$
	slaw x 
	dec a 
	jra 2$ 
3$: ld a,#TK_INTGR
	ret 

;------------------------------
; BASIC: INVERT(expr)
; 1's complement 
;--------------------------------
invert:
	call func_args
	cp a,#1 
	jreq 1$
	jp syntax_error
1$: popw x  
	cplw x 
	ld a,#TK_INTGR 
	ret 

;------------------------------
; BASIC: DO 
; initiate a DO ... UNTIL loop 
;------------------------------
	DOLP_ADR=3 
	DOLP_INW=5
	VSIZE=4 
do_loop:
	popw x 
	_vars VSIZE 
	pushw x 
	ldw y,basicptr 
	ldw (DOLP_ADR,sp),y
	ldw y,in.w 
	ldw (DOLP_INW,sp),y
	inc loop_depth 
	ret 

;--------------------------------
; BASIC: UNTIL expr 
; loop if exprssion is false 
; else terminate loop
;--------------------------------
until: 
	tnz loop_depth 
	jrne 1$ 
	jp syntax_error 
1$: 
	call relation 
	cp a,#TK_INTGR
	jreq 2$
	jp syntax_error
2$: 
	tnzw x 
	jrne 9$
	ldw x,(DOLP_ADR,sp)
	ldw basicptr,x 
	ld a,(2,x)
	ld count,a 
	ldw x,(DOLP_INW,sp)
	ldw in.w,x 
	ret 
9$:	; remove loop data from stack  
	popw x
	_drop VSIZE
	dec loop_depth 
	jp (x)

;--------------------------
; BASIC: PRTA...PRTI  
;  return constant value 
;  PORT  offset in GPIO
;  array
;---------------------------
const_porta:
	ldw x,#0
	ld a,#TK_INTGR 
	ret 
const_portb:
	ldw x,#1
	ld a,#TK_INTGR 
	ret 
const_portc:
	ldw x,#2
	ld a,#TK_INTGR 
	ret 
const_portd:
	ldw x,#3
	ld a,#TK_INTGR 
	ret 
const_porte:
	ldw x,#4
	ld a,#TK_INTGR 
	ret 
const_portf:
	ldw x,#5
	ld a,#TK_INTGR 
	ret 
const_portg:
	ldw x,#6
	ld a,#TK_INTGR 
	ret 
const_porth:
	ldw x,#7
	ld a,#TK_INTGR 
	ret 
const_porti:
	ldw x,#8
	ld a,#TK_INTGR 
	ret 

;-------------------------------
; following return constant 
; related to GPIO register offset 
;---------------------------------
const_odr:
	ld a,#TK_INTGR 
	ldw x,#GPIO_ODR
	ret 
const_idr:
	ld a,#TK_INTGR 
	ldw x,#GPIO_IDR
	ret 
const_ddr:
	ld a,#TK_INTGR 
	ldw x,#GPIO_DDR
	ret 
const_cr1:
	ld a,#TK_INTGR 
	ldw x,#GPIO_CR1
	ret 
const_cr2:
	ld a,#TK_INTGR 
	ldw x,#GPIO_CR2
	ret 
;-------------------------
;  constant for port mode
;  used by PMODE 
;  input or output
;------------------------
const_output:
	ld a,#TK_INTGR 
	ldw x,#OUTP
	ret 
const_input:
	ld a,#TK_INTGR 
	ldw x,#INP 
	ret 
;-----------------------
; memory area constants
;-----------------------
const_eeprom_base:
	ld a,#TK_INTGR 
	ldw x,#EEPROM_BASE 
	ret 

;---------------------------
; BASIC: DATA 
; when the interpreter find 
; a DATA line it skip it.
;---------------------------
data:
	mov in,count 
	ret 

;---------------------------
; BASIC: DATLN  *expr*
; set DATA pointer at line# 
; specified by *expr* 
;---------------------------
data_line:
	call expression
	cp a,#TK_INTGR
	jreq 1$
	jp syntax_error 
1$: call search_lineno
	tnzw x 
	jrne 3$
2$:	ld a,#ERR_NO_LINE 
	jp tb_error
3$: ; check if valid data line 
    ldw y,x 
	ldw x,(4,x)
	cpw x,#data 
	jrne 2$ 
	ldw data_ptr,y
	ld a,(2,y)
	ld data_len,a 
	mov data_ofs,#FIRST_DATA_ITEM 
	ret

;---------------------------------
; BASIC: RESTORE 
; set data_ptr to first data line
; if not DATA found pointer set to
; zero 
;---------------------------------
restore:
	clr data_ptr 
	clr data_ptr+1
	clr data_ofs 
	clr data_len
	ldw x,txtbgn
data_search_loop: 	
	cpw x,txtend
	jruge 9$
	ldw y,x 
	ldw x,(4,x)
	cpw x,#data 
	jrne try_next_line 
	ldw data_ptr,y 
	ld a,(2,y)
	ld data_len,a 
	mov data_ofs,#FIRST_DATA_ITEM
9$:	tnz data_len 
    jrne 10$
	ld a,#ERR_NO_DATA 
	jp tb_error 
10$:ret
try_next_line:
	ldw x,y 
	ld a,(2,x)
	ld acc8,a 
	clr acc16 
	addw x,acc16 
	jra data_search_loop


;---------------------------------
; BASIC: READ 
; return next data item | 0 
;---------------------------------
	CTX_BPTR=1 
	CTX_IN=3 
	CTX_COUNT=4 
	XSAVE=5
	VSIZE=6
read:
	_vars  VSIZE 
read01:	
	ld a,data_ofs
	cp a,data_len 
	jreq 2$ ; end of line  
	call save_context
	ldw x,data_ptr 
	ldw basicptr,x 
	mov in,data_ofs 
	mov count,data_len  
	call expression 
	cp a,#TK_INTGR 
	jreq 1$ 
	jp syntax_error 
1$:
	ldw (XSAVE,SP),x
	call next_token ; skip comma
	ldw x,basicptr 
	ldw data_ptr,x 
	mov data_ofs,in 
	call rest_context
	ldw x,(XSAVE,sp)
	ld a,#TK_INTGR
	_drop VSIZE 
	ret 
2$: ; end of line reached 
	ldw y, data_ptr 
	clr data_ptr
	clr data_ptr+1   
	clr data_ofs 
	clr data_len 
	call try_next_line 
	jra read01


;---------------------------------
; BASIC: SPIEN clkdiv, 0|1  
; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
; if clkdiv==-1 disable SPI
; 0|1 -> disable|enable  
;--------------------------------- 
SPI_CS_BIT=5
spi_enable:
	call arg_list 
	cp a,#2
	jreq 1$
	jp syntax_error 
1$: 
	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
	popw x  
	tnzw x 
	jreq spi_disable 
	popw x 
	ld a,#(1<<SPI_CR1_BR)
	mul x,a 
	ld a,xl 
	ld SPI_CR1,a 
; configure ~CS on PE5 (D10 on CN8) as output. 
	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
; configure SPI as master mode 0.	
	bset SPI_CR1,#SPI_CR1_MSTR
; ~CS line controlled by sofware 	
	bset SPI_CR2,#SPI_CR2_SSM 
    bset SPI_CR2,#SPI_CR2_SSI 
; enable SPI
	bset SPI_CR1,#SPI_CR1_SPE 	
	ret 
spi_disable:
	_drop #2; throw first argument.
; wait spi idle 
1$:	ld a,#0x82 
	and a,SPI_SR
	cp a,#2 
	jrne 1$
	bres SPI_CR1,#SPI_CR1_SPE
	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
	bres PE_DDR,#SPI_CS_BIT 
	ret 

spi_clear_error:
	ld a,#0x78 
	bcp a,SPI_SR 
	jreq 1$
	clr SPI_SR 
1$: ret 

spi_send_byte:
	push a 
	call spi_clear_error
	pop a 
	btjf SPI_SR,#SPI_SR_TXE,.
	ld SPI_DR,a
	btjf SPI_SR,#SPI_SR_RXNE,.  
	ld a,SPI_DR 
	ret 

spi_rcv_byte:
	ld a,#255
	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
	ld a,SPI_DR 
	ret

;------------------------------
; BASIC: SPIWR byte [,byte]
; write 1 or more byte
;------------------------------
spi_write:
	call expression
	cp a,#TK_INTGR 
	jreq 1$
	jp syntax_error 
1$:	
	ld a,xl 
	call spi_send_byte 
	call next_token 
	cp a,#TK_COMMA 
	jrne 2$ 
	jra spi_write 
2$:	tnz a 
	jreq 3$
	_unget_token  
3$:	ret 


;-------------------------------
; BASIC: SPIRD 	
; read one byte from SPI 
;-------------------------------
spi_read:
	call spi_rcv_byte 
	clrw x 
	ld xl,a 
	ld a,#TK_INTGR 
	ret 

;------------------------------
; BASIC: SPISEL 0|1 
; set state of ~CS line
; 0|1 deselect|select  
;------------------------------
spi_select:
	call next_token 
	cp a,#TK_INTGR 
	jreq 1$
	jp syntax_error 
1$: tnzw x  
	jreq cs_high 
	bres PE_ODR,#SPI_CS_BIT
	ret 
cs_high: 
	bset PE_ODR,#SPI_CS_BIT
	ret 


;------------------------------
; BASIC: FILERX
; Use to receive a BASIC program
; from the PC using XMODEM 
; protocol. The file is store in
; Each line received is compiled
; then stored in RAM. When reception 
; is completed with success  the 
; program is ready to be executed 
; or save as local file.
;--------------------------------
file_receive:
	btjf flags,#FRUN,1$
	ld a,#ERR_CMD_ONLY
	jp tb_error 
1$:	
	call clear_basic
	ldw x, txtbgn
	call xreceive 
	addw x,txtbgn 
	ldw txtend,x 
	call print_int 
	ldw x,#fsize_msg 
	call puts 
	ret 
fsize_msg: .asciz " bytes received\n"

;------------------------------
; BASIC: FILETX "file_name" 
; Transmit the program in RAM 
; To the PC using XMODEM protocol.
; The file transmitted as source 
; file not tokenized. 
;-------------------------------
file_transmit:

	ret 

;-------------------------------
; BASIC: PAD 
; Return pad buffer address.
;------------------------------
pad_ref:
	ldw x,#pad 
	ld a,TK_INTGR
	ret 

;------------------------------
;      dictionary 
; format:
;   link:   2 bytes 
;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
;   cmd_name: 16 byte max 
;   code_address: 2 bytes 
;------------------------------
	.macro _dict_entry len,name,cmd 
	.word LINK 
	LINK=.
name:
	.byte len 	
	.ascii "name"
	.word cmd 
	.endm 

	LINK=0
; respect alphabetic order for BASIC names from Z-A
; this sort order is for a cleaner WORDS cmd output. 	
kword_end:
	_dict_entry,3+F_IFUNC,XOR,bit_xor
	_dict_entry,5,WRITE,write  
	_dict_entry,5,WORDS,words 
	_dict_entry 4,WAIT,wait 
	_dict_entry,3+F_IFUNC,USR,usr
	_dict_entry,5,UNTIL,until 
	_dict_entry,6+F_IFUNC,UFLASH,uflash 
	_dict_entry,6+F_IFUNC,UBOUND,ubound 
	_dict_entry,4,TONE,tone  
	_dict_entry,2,TO,to
	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
	_dict_entry,5,TIMER,set_timer
	_dict_entry,5+F_IFUNC,TICKS,get_ticks
	_dict_entry,4,STOP,stop 
	_dict_entry,4,STEP,step 
	_dict_entry,5,SPIWR,spi_write
	_dict_entry,6,SPISEL,spi_select
	_dict_entry,5,SPIEN,spi_enable 
	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
	_dict_entry,5,SLEEP,sleep 
	_dict_entry,4+F_IFUNC,SIZE,size
    _dict_entry,4,SHOW,show 
	_dict_entry,4,SAVE,save
	_dict_entry 3,RUN,run
	_dict_entry,6+F_IFUNC,RSHIFT,rshift
	_dict_entry,3+F_IFUNC,RND,random 
	_dict_entry,6,RETURN,return 
	_dict_entry,7,RESTORE,restore 
	_dict_entry 6,REMARK,remark 
	_dict_entry,6,REBOOT,cold_start
	_dict_entry,4+F_IFUNC,READ,read  
	_dict_entry,4+F_IFUNC,QKEY,qkey  
	_dict_entry,4+F_IFUNC,PRTI,const_porti 
	_dict_entry,4+F_IFUNC,PRTH,const_porth 
	_dict_entry,4+F_IFUNC,PRTG,const_portg 
	_dict_entry,4+F_IFUNC,PRTF,const_portf
	_dict_entry,4+F_IFUNC,PRTE,const_porte
	_dict_entry,4+F_IFUNC,PRTD,const_portd
	_dict_entry,4+F_IFUNC,PRTC,const_portc
	_dict_entry,4+F_IFUNC,PRTB,const_portb
	_dict_entry,4+F_IFUNC,PRTA,const_porta 
	_dict_entry 5,PRINT,print 
	_dict_entry,4+F_IFUNC,POUT,const_output
	_dict_entry,4,POKE,poke 
	_dict_entry,4+F_IFUNC,PINP,const_input
	_dict_entry,4+F_IFUNC,PEEK,peek 
	_dict_entry,5,PMODE,pin_mode 
	_dict_entry,5,PAUSE,pause 
	_dict_entry,3+F_IFUNC,PAD,pad_ref 
	_dict_entry,2+F_IFUNC,OR,bit_or
	_dict_entry,3+F_IFUNC,ODR,const_odr 
	_dict_entry,3+F_IFUNC,NOT,func_not 
	_dict_entry,3,NEW,new
	_dict_entry,4,NEXT,next 
	_dict_entry,6+F_IFUNC,MULDIV,muldiv 
	_dict_entry,6+F_IFUNC,LSHIFT,lshift
	_dict_entry,3+F_IFUNC,LOG,log2 
	_dict_entry,4,LOAD,load 
	_dict_entry 4,LIST,list
	_dict_entry 3,LET,let 
	_dict_entry,3+F_IFUNC,KEY,key 
	_dict_entry,7,IWDGREF,refresh_iwdg
	_dict_entry,6,IWDGEN,enable_iwdg
	_dict_entry,6+F_IFUNC,INVERT,invert 
	_dict_entry,5,INPUT,input_var  
	_dict_entry,2,IF,if 
	_dict_entry,3+F_IFUNC,IDR,const_idr 
	_dict_entry,3,HEX,hex_base
	_dict_entry,4+F_IFUNC,GPIO,gpio 
	_dict_entry,4,GOTO,goto 
	_dict_entry,5,GOSUB,gosub 
	_dict_entry,6,FORGET,forget 
	_dict_entry,3,FOR,for 
	_dict_entry,6,FILETX,file_transmit
	_dict_entry,6,FILERX,file_receive 
	_dict_entry,4,FCPU,fcpu 
	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
	_dict_entry,3,END,cmd_end  
	_dict_entry,6+F_CMD,DWRITE,digital_write
	_dict_entry,5+F_IFUNC,DREAD,digital_read
	_dict_entry,2,DO,do_loop
	_dict_entry,3,DIR,directory 
	_dict_entry,3,DEC,dec_base
	_dict_entry,3+F_IFUNC,DDR,const_ddr 
	_dict_entry,6,DATALN,data_line  
	_dict_entry,4,DATA,data  
	_dict_entry,3+F_IFUNC,CRL,const_cr1 
	_dict_entry,3+F_IFUNC,CRH,const_cr2 
	_dict_entry,4+F_CFUNC,CHAR,char
	_dict_entry,3,BYE,bye 
	_dict_entry,5,BTOGL,bit_toggle
	_dict_entry,5+F_IFUNC,BTEST,bit_test 
	_dict_entry,4,BSET,bit_set 
	_dict_entry,4,BRES,bit_reset
	_dict_entry,3+F_IFUNC,BIT,bitmask
	_dict_entry,3,AWU,awu 
	_dict_entry,7,AUTORUN,autorun
	_dict_entry,3+F_IFUNC,ASC,ascii
	_dict_entry,3+F_IFUNC,AND,bit_and
	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
	_dict_entry,5,ADCON,power_adc 
kword_dict:
	_dict_entry,3+F_IFUNC,ABS,abs
	

	.bndry 128 ; align on FLASH block.
; free space for user application  
user_space:
; USR() function test
	pushw x 
	bset PC_ODR,#5 
	popw x 
	call pause02 
	bres PC_ODR,#5 
	ret

	.area FLASH_DRIVE (ABS)
	.org 0x10000
fdrive:
; .byte 0,0,0,0
