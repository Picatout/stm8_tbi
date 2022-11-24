;;
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
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; hardware initialisation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

;------------------------
; if unified compilation 
; must be first in list 
;-----------------------

    .module HW_INIT 

    .include "config.inc"

  
;;-----------------------------------
    .area SSEG (ABS)
;; working buffers and stack at end of RAM. 	
;;-----------------------------------
    .org RAM_SIZE-STACK_SIZE-XSTACK_SIZE*CELL_SIZE-TIB_SIZE-PAD_SIZE 
tib:: .ds TIB_SIZE             ; terminal input buffer
block_buffer::                 ; use to write FLASH block (alias for pad )
pad:: .ds PAD_SIZE             ; working buffer
xstack_full:: .ds XSTACK_SIZE*CELL_SIZE   ; expression stack 
xstack_unf:: ; xstack underflow 
stack_full:: .ds STACK_SIZE   ; control stack 
stack_unf: ; stack underflow ; control_stack bottom 

;;--------------------------------------
    .area HOME 
;; interrupt vector table at 0x8000
;;--------------------------------------

    int cold_start			; RESET vector 
	int TrapHandler         ; trap instruction 
	int NonHandledInterrupt ;int0 TLI   external top level interrupt
	int AWUHandler          ;int1 AWU   auto wake up from halt
	int NonHandledInterrupt ;int2 CLK   clock controller
	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
.if NUCLEO_8S208RB
	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
.else 
	int NonHandledInterrupt
.endif 
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
.if NUCLEO_8S208RB  
	int UartRxHandler		;int18 UART1 RX full 
.else 
	int NonHandledInterrupt ;int18 UART1 RX full 
.endif 
	int I2cIntHandler       ;int19 I2C 
	int NonHandledInterrupt ;int20 UART3 TX completed
.if NUCLEO_8S207K8  
	int UartRxHandler 		;int21 UART3 RX full
.else 
	int NonHandledInterrupt ;int21 UART3 RX full
.endif 
	int NonHandledInterrupt ;int22 ADC2 end of conversion
	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
	int NonHandledInterrupt ;int25  not used
	int NonHandledInterrupt ;int26  not used
	int NonHandledInterrupt ;int27  not used
	int NonHandledInterrupt ;int28  not used
	int NonHandledInterrupt ;int29  not used


;--------------------------------------
    .area DATA (ABS)
	.org 0 
;--------------------------------------	

; keep the following 3 variables in this order 
bp.saved: ; saved value of basicptr, overlay in.w  
in.w::  .blkb 1 ; used by compiler 
in::    .blkb 1 ; low byte of in.w 
count:: .blkb 1 ; current BASIC line length and tib text length  
line.addr:: .blkw 1 ; BASIC line start at this address. 
basicptr::  .blkw 1  ; BASIC interperter program pointer.
data_line:: .blkw 1  ; data line address 
data_ptr:  .blkw 1  ; point to DATA in line 
base::  .blkb 1 ; nemeric base used to print integer 
acc32:: .blkb 1 ; 32 bit accumalator upper-byte 
acc24:: .blkb 1 ; 24 bits accumulator upper-byte 
acc16:: .blkb 1 ; 16 bits accumulator, acc24 high-byte
acc8::  .blkb 1 ;  8 bits accumulator, acc24 low-byte  
ticks: .blkb 3 ; milliseconds ticks counter (see Timer4UpdateHandler)
timer:: .blkw 1 ;  milliseconds count down timer 
seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
ptr16::  .blkb 1 ; 16 bits pointer , farptr high-byte 
ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
txtbgn:: .blkw 1 ; tokenized BASIC text beginning address 
txtend:: .blkw 1 ; tokenized BASIC text end address 
loop_depth: .blkb 1 ; level of nested loop. Conformity check   
array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
flags:: .blkb 1 ; various boolean flags
free_eeprom: .blkw 1 ; start address of free eeprom 
end_free_ram: .blkw 1 ; where free RAM end 
rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
rx1_head:  .blkb 1 ; rx1_queue head pointer
rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
dvar_bgn:: .blkw 1 ; DIM variables start address 
dvar_end:: .blkw 1 ; DIM variables end address 
chain_level: .blkb 1 ; increment for each CHAIN command 
out: .blkw 1 ; output char routine address 
i2c_buf: .blkw 1 ; i2c buffer address 
i2c_count: .blkb 1 ; bytes to transmit 
i2c_idx: .blkb 1 ; index in buffer
i2c_status: .blkb 1 ; error status 
i2c_devid: .blkb 1 ; device identifier  

; 24 bits integer variables 
vars:: .blkb 3*26 ; BASIC variables A-Z,
;	.area BTXT (ABS)
;	.org 0x8C  
; keep 'free_ram' as last variable 
; basic code compiled here. 
rsign: .blkw 1 ; "TB" 
rsize: .blkw 1 ; code size 	 
free_ram: ; from here RAM free for BASIC text 

	.area CODE 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; non handled interrupt 
; reset MCU
;;;;;;;;;;;;;;;;;;;;;;;;;;;
NonHandledInterrupt:
	_swreset ; see "inc/gen_macros.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; auto wakeup from halt
; at iret, program continue 
; after halt instruction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
AWUHandler:
	bres AWU_CSR,#AWU_CSR_AWUEN
	mov AWU_APR,#0x3F
	clr AWU_TBR 
	iret

;------------------------------------
; sofware interrupt handler  
;------------------------------------
TrapHandler:
	.if DEBUG 
	call print_registers
	;call cmd_itf  
	.endif 
	iret 

;------------------------------
; TIMER 4 is used to maintain 
; a milliseconds 'ticks' counter
; and decrement 'timer' varaiable
; ticks range {0..2^23-1}
; timer range {0..65535}
;--------------------------------
Timer4UpdateHandler:
	clr TIM4_SR 
	_ldaz ticks 
	_ldxz ticks+1
	addw x,#1 
	adc a,#0 
	jrpl 0$
; reset to 0 when negatif 
	clr a 
	clrw x 
0$:	_straz ticks 
	ldw ticks+1,x 
	_ldxz timer
	jreq 1$
	decw x 
	ldw timer,x 
1$:	
	iret 

.if NUCLEO_8S208RB
;------------------------------------
; Triggered by pressing USER UserButton 
; on NUCLEO card.
; This is used to abort a progam lock 
; in infinite loop. 
;------------------------------------
UserButtonHandler:
; wait button release
	clrw x ; debounce counter 
1$: btjt PE_IDR,#USR_BTN_BIT,2$
	tnzw x 
	jreq 1$
	decw x 
	jra 1$
2$: incw x 
	cpw x,#0xffff ; ~ 16 msec delay 
	jrult 1$ 
; if MCU suspended by SLEEP resume program
    btjf flags,#FSLEEP,3$
	bres flags,#FSLEEP 
	iret
3$:	
.endif 

user_interrupted:
; in case system infinite
; loop in i2cIntHandler 
	bset I2C_CR2,#I2C_CR2_SWRST
    btjt flags,#FRUN,4$
	jra UBTN_Handler_exit 
4$:	; program interrupted by user 
	bres flags,#FRUN 
;	ldw x,#USER_ABORT
;	call puts 
UBTN_Handler_exit:
    ldw x,#STACK_EMPTY 
    ldw sp,x
	rim 
5$:	jp warm_start

;USER_ABORT: .asciz "\nProgram aborted by user.\n"

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
; on port D:5. CN9-6
; channel 1 configured as PWM mode 1 
;-----------------------------------  

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
; set int level to 1 
	ld a,#ITC_SPR_LEVEL1 
	ldw x,#INT_TIM4_OVF 
	call set_int_priority
	ret

;--------------------------
; set software interrupt 
; priority 
; input:
;   A    priority 1,2,3 
;   X    vector 
;---------------------------
	SPR_ADDR=1 
	PRIORITY=3
	SLOT=4
	MASKED=5  
	VSIZE=5
set_int_priority::
	_vars VSIZE
	and a,#3  
	ld (PRIORITY,sp),a 
	ld a,#4 
	div x,a 
	sll a  ; slot*2 
	ld (SLOT,sp),a
	addw x,#ITC_SPR1 
	ldw (SPR_ADDR,sp),x 
; build mask
	ldw x,#0xfffc 	
	ld a,(SLOT,sp)
	jreq 2$ 
	scf 
1$:	rlcw x 
	dec a 
	jrne 1$
2$:	ld a,xl 
; apply mask to slot 
	ldw x,(SPR_ADDR,sp)
	and a,(x)
	ld (MASKED,sp),a 
; shift priority to slot 
	ld a,(PRIORITY,sp)
	ld xl,a 
	ld a,(SLOT,sp)
	jreq 4$
3$:	sllw x 
	dec a 
	jrne 3$
4$:	ld a,xl 
	or a,(MASKED,sp)
	ldw x,(SPR_ADDR,sp)
	ld (x),a 
	_drop VSIZE 
	ret 

;-------------------------------------
;  initialization entry point 
;-------------------------------------
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
; set user LED pin as output 
    bset LED_PORT+GPIO_CR1,#LED_BIT
    bset LED_PORT+GPIO_CR2,#LED_BIT
    bset LED_PORT+ GPIO_DDR,#LED_BIT
	bres LED_PORT+GPIO_ODR,#LED_BIT ; turn on user LED  

; disable schmitt triggers on Arduino CN4 analog inputs
	mov ADC_TDRL,0x3f
; initialize auto wakeup with LSI clock
	clr AWU_TBR 
	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
; select internal clock no divisor: 16 Mhz 	
	ld a,#CLK_SWR_HSI 
	clrw x  
    call clock_init 
	call timer2_init	
; UART at 115200 BAUD
; used for user interface 
; via USB emulation through STLINK programmer.
	ldw x,#uart_putc 
	ldw out,x 
	call uart_init
.if NUCLEO_8S208RB	
; activate PE_4 (user button interrupt)
    bset PE_CR2,#USR_BTN_BIT 
.endif 
; initialize TICKS timer 
	call timer4_init
	rim ; enable interrupts 
; RND function seed 
; must be initialized 
; to value other than 0.
; take values from ROM space 
	ldw x,0x6000
	ldw seedy,x  
	ldw x,0x6006 
	ldw seedx,x  
	call func_eefree ; eeprom free address 
	call func_ubound ; @() size 
	call clear_basic
2$:	
; check for autorun application
	ldw x,EEPROM_BASE 
	cpw x,AR_SIGN 
	jreq run_app
	call beep_1khz  ; 
	call system_information ; display system information
	jp warm_start 
run_app:
	clr a 
	ldw x,EEPROM_BASE+2
	_qsign 
	jreq 1$
	jp warm_start ; no autorun application.
1$:	
; run application in FLASH|EEPROM 
	ldw y,XSTACK_EMPTY
	call warm_init
	ldw x,EEPROM_BASE+2 
	addw x,#FILE_HEADER_SIZE
	ldw txtbgn,x
	subw x,#2 
	ldw x,(x)
	addw x,txtbgn 
	ldw txtend,x 
	ldw x,#AUTO_RUN
	call puts  
	jp run_it_02  
    jra .  

AUTO_RUN: .asciz " auto run program\n"

