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

    .module HW_INIT 

    .include "config.inc"

	.include "inc/stm8s208.inc"
  	.include "inc/nucleo_8s208.inc"
	.include "inc/ascii.inc"
	.include "inc/gen_macros.inc" 
	.include "config.inc" 
	.include "tbi_macros.inc" 
  
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
	int SysCall ; TRAP  BASIC sys() calls 
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
	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
	int NonHandledInterrupt ;int19 I2C 
	int NonHandledInterrupt ;int20 UART3 TX completed
	int NonHandledInterrupt ;int21 UART3 RX full
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
	mov AWU_APR,0x3F
	clr AWU_TBR 
	iret

;------------------------------------
; system call handler  
;------------------------------------
SysCall:

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
	ld a,ticks 
	ldw x,ticks+1
	addw x,#1 
	adc a,#0 
	jrpl 0$
; reset to 0 when negatif 
	clr a 
	clrw x 
0$:	ld ticks,a 
	ldw ticks+1,x 
	ldw x,timer
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
UBTN_Handler_exit:
    ldw x,#STACK_EMPTY 
    ldw sp,x
	rim 
5$:	jp warm_start

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
; set LD2 pin as output 
    bset PC_CR1,#LED2_BIT
    bset PC_CR2,#LED2_BIT
    bset PC_DDR,#LED2_BIT
	bres PC_ODR,#LED2_BIT ; turn off LD2 
; disable schmitt triggers on Arduino CN4 analog inputs
	mov ADC_TDRL,0x3f
; initialize auto wakeup with LSI clock
	clr AWU_TBR 
	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
; select internal clock no divisor: 16 Mhz 	
	ld a,#CLK_SWR_HSI 
	clrw x  
    call clock_init 
	call timer4_init
	call timer2_init	
; UART1 at 115200 BAUD
; used for user interface 
; via USB emulation through STLINK programmer.
	call uart1_init
; activate PE_4 (user button interrupt)
    bset PE_CR2,#USR_BTN_BIT 
; display system information
	rim ; enable interrupts 
; RND function seed 
; must be initialized 
; to value other than 0.
	inc seedy+1 
	inc seedx+1 
	call func_eefree ; eeprom free address 
	call ubound ; @() size 
	call clear_basic
	call beep_1khz  ; 
	call system_information ; display system information 
2$:	
; check for autorun application
	ldw x,EEPROM_BASE 
	cpw x,AR_SIGN 
	jreq run_app
	jp warm_start 
run_app:
	clr a 
	ldw x,EEPROM_BASE+2
	call is_program_addr 
	jreq 1$
	jp warm_start ; no autorun application.
1$:	
; run application in FLASH|EEPROM 
	ldw y,XSTACK_EMPTY
	call warm_init
	ldw x,EEPROM_BASE+2 
	ldw txtbgn,x
	subw x,#2 
	ldw x,(x)
	addw x,txtbgn 
	ldw txtend,x 
	ldw x,#AUTO_RUN 
	call puts 
	call program_info 
	jp run_it_02  
    jra .  

AUTO_RUN: .asciz " auto run program\n"

