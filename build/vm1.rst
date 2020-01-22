ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 1.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019 
                                      3 ; This file is part of PABasic 
                                      4 ;
                                      5 ;     PABasic is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     PABasic is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with PABasic.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 ;--------------------------------------
                                     19 ;   Implementation of Tiny BASIC
                                     20 ;   REF: https://en.wikipedia.org/wiki/Li-Chen_Wang#Palo_Alto_Tiny_BASIC
                                     21 ;   Palo Alto BASIC is 4th version of TinyBasic
                                     22 ;   DATE: 2019-12-17
                                     23 ;
                                     24 ;--------------------------------------------------
                                     25 
                                     26     .module VM1 
                                     27 
                                        	.include "inc/nucleo_8s208.inc"
                                        ;;
                                        ; Copyright Jacques Deschênes 2019 
                                        ; This file is part of MONA 
                                        ;
                                        ;     MONA is free software: you can redistribute it and/or modify
                                        ;     it under the terms of the GNU General Public License as published by
                                        ;     the Free Software Foundation, either version 3 of the License, or
                                        ;     (at your option) any later version.
                                        ;
                                        ;     MONA is distributed in the hope that it will be useful,
                                        ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                        ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;     GNU General Public License for more details.
                                        ;
                                        ;     You should have received a copy of the GNU General Public License
                                        ;     along with MONA.  If not, see <http://www.gnu.org/licenses/>.
                                        ;;
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ; NUCLEO-8S208RB board specific definitions
                                        ; Date: 2019/10/29
                                        ; author: Jacques Deschênes, copyright 2018,2019
                                        ; licence: GPLv3
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        
                                        ; mcu on board is stm8s208rbt6
                                        
                                        ; crystal on board is 8Mhz
                                 
                                        
                                        ; LED2 is user LED
                                        ; connected to PC5 via Q2 -> 2N7002 MOSFET
                                 
                                 
                                 
                                        
                                        ; B1 on schematic is user button
                                        ; connected to PE4
                                        ; external pullup resistor R6 4k7 and debounce capacitor C5 100nF
                                 
                                 
                                 
                                        
                                        
                                        	.include "inc/stm8s208.inc"
                                        ;;
                                        ; Copyright Jacques Deschênes 2019 
                                        ; This file is part of MONA 
                                        ;
                                        ;     MONA is free software: you can redistribute it and/or modify
                                        ;     it under the terms of the GNU General Public License as published by
                                        ;     the Free Software Foundation, either version 3 of the License, or
                                        ;     (at your option) any later version.
                                        ;
                                        ;     MONA is distributed in the hope that it will be useful,
                                        ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                        ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;     GNU General Public License for more details.
                                        ;
                                        ;     You should have received a copy of the GNU General Public License
                                        ;     along with MONA.  If not, see <http://www.gnu.org/licenses/>.
                                        ;;
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ; 2019/10/18
                                        ; STM8S208RB µC registers map
                                        ; sdas source file
                                        ; author: Jacques Deschênes, copyright 2018,2019
                                        ; licence: GPLv3
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        	.module stm8s208rb
                                        
                                        ;;;;;;;;;;;;
                                        ; bits
                                        ;;;;;;;;;;;;
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                         	
                                        ;;;;;;;;;;;;
                                        ; bits masks
                                        ;;;;;;;;;;;;
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; HSI oscillator frequency 16Mhz
                                 
                                        ; LSI oscillator frequency 128Khz
                                 
                                        
                                        ; controller memory regions
                                 
                                 
                                        ; STM8S208RB have 128K flash
                                 
                                        ; erase block size 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; options bytes
                                        ; this one can be programmed only from SWIM  (ICP)
                                 
                                        ; these can be programmed at runtime (IAP)
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; option registers usage
                                        ; read out protection, value 0xAA enable ROP
                                 
                                        ; user boot code, {0..0x3e} 512 bytes row
                                 
                                 
                                        ; alternate function register
                                 
                                 
                                        ; miscelinous options
                                 
                                 
                                        ; clock options
                                 
                                 
                                        ; HSE clock startup delay
                                 
                                 
                                        ; flash wait state
                                 
                                 
                                        
                                        ; watchdog options bits
                                 
                                 
                                 
                                 
                                        ; NWDGOPT bits
                                 
                                 
                                 
                                 
                                        
                                        ; CLKOPT bits
                                 
                                 
                                 
                                 
                                        
                                        ; AFR option, remapable functions
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; device ID = (read only)
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        
                                 
                                 
                                        ; PORTS SFR OFFSET
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; GPIO
                                        ; gpio register offset to base
                                 
                                 
                                 
                                 
                                 
                                 
                                         
                                        ; port A
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port B
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port C
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port D
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port E
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port F
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port G
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port H not present on LQFP48/LQFP64 package
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; port I ; only bit 0 on LQFP64 package, not present on LQFP48
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; input modes CR1
                                 
                                 
                                        ; output mode CR1
                                 
                                 
                                        ; input modes CR2
                                 
                                 
                                        ; output speed CR2
                                 
                                 
                                        
                                        
                                        ; Flash memory
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; data memory unlock keys
                                 
                                 
                                        ; flash memory unlock keys
                                 
                                 
                                        ; FLASH_CR1 bits
                                 
                                 
                                 
                                 
                                        ; FLASH_CR2 bits
                                 
                                 
                                 
                                 
                                 
                                        ; FLASH_FPR bits
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; FLASH_NFPR bits
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; FLASH_IAPSR bits
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Interrupt control
                                 
                                 
                                        
                                        ; Reset Status
                                 
                                        
                                        ; Clock Registers
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Peripherals clock gating
                                        ; CLK_PCKENR1 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; CLK_PCKENR2
                                 
                                 
                                 
                                        
                                        ; Clock bits
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                        ; clock source
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Watchdog
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Beeper
                                        ; beeper output is alternate function AFR7 on PD4
                                        ; connected to CN9-6
                                 
                                 
                                 
                                 
                                        
                                        ; SPI
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; I2C
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                        
                                        ; Precalculated values, all in KHz
                                 
                                 
                                        ;
                                        ; Fast I2C mode max rise time = 300ns
                                        ; I2C_FREQR = 16 = (MHz) => tMASTER = 1/16 = 62.5 ns
                                        ; TRISER = = (300/62.5) + 1 = floor(4.8) + 1 = 5.
                                        
                                 
                                        
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                        
                                 
                                 
                                        ;
                                        ; Standard I2C mode max rise time = 1000ns
                                        ; I2C_FREQR = 16 = (MHz) => tMASTER = 1/16 = 62.5 ns
                                        ; TRISER = = (1000/62.5) + 1 = floor(16) + 1 = 17.
                                        
                                 
                                        
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                        
                                 
                                 
                                        
                                        ; baudrate constant for brr_value table access
                                        ; to be used by uart_init 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; UART registers offset from
                                        ; base address 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; uart identifier
                                        ; to be used by uart_init
                                 
                                 
                                        
                                        ; pins used by uart 
                                 
                                 
                                 
                                 
                                        ; uart port base address 
                                 
                                 
                                        
                                        ; UART1 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; UART3
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; UART Status Register bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Uart Control Register bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        ; LIN mode config register
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; TIMERS
                                        ; Timer 1 - 16-bit timer with complementary PWM outputs
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Timer Control Register bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Timer Slave Mode Control bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Timer External Trigger Enable bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Timer Interrupt Enable bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Timer Status Register bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                        
                                        ; Timer Event Generation Register bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Capture/Compare Mode Register 1 - channel configured in output
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Capture/Compare Mode Register 1 - channel configured in input
                                 
                                 
                                 
                                 
                                 
                                 
                                        ;  TIM1_CCMR1_CC1S1 = (1)
                                 
                                        
                                        ; Capture/Compare Mode Register 2 - channel configured in output
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Capture/Compare Mode Register 2 - channel configured in input
                                 
                                 
                                 
                                 
                                 
                                 
                                        ;  TIM1_CCMR2_CC2S1 = (1)
                                 
                                        
                                        ; Capture/Compare Mode Register 3 - channel configured in output
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Capture/Compare Mode Register 3 - channel configured in input
                                 
                                 
                                 
                                 
                                 
                                 
                                        ;  TIM1_CCMR3_CC3S1 = (1)
                                 
                                        
                                        ; Capture/Compare Mode Register 4 - channel configured in output
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Capture/Compare Mode Register 4 - channel configured in input
                                 
                                 
                                 
                                 
                                 
                                 
                                        ;  TIM1_CCMR4_CC4S1 = (1)
                                 
                                        
                                        ; Timer 2 - 16-bit timer
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Timer 3
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; TIM3_CR1  fields
                                 
                                 
                                 
                                 
                                 
                                        ; TIM3_CCR2  fields
                                 
                                 
                                 
                                        ; TIM3_CCER1 fields
                                 
                                 
                                 
                                 
                                        ; TIM3_CCER2 fields
                                 
                                 
                                        
                                        ; Timer 4
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Timer 4 bitmasks
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                        
                                 
                                        
                                 
                                        
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; ADC2
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                         
                                        ; ADC bitmasks
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                        
                                        ; beCAN
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        
                                        ; CPU
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; global configuration register
                                 
                                 
                                 
                                        
                                        ; interrupt control registers
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; SWIM, control and status register
                                 
                                        ; debug registers
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Interrupt Numbers
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Interrupt Vectors
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; Condition code register bits
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        	.include "inc/ascii.inc"
                                        ;;
                                        ; Copyright Jacques Deschênes 2019 
                                        ; This file is part of MONA 
                                        ;
                                        ;     MONA is free software: you can redistribute it and/or modify
                                        ;     it under the terms of the GNU General Public License as published by
                                        ;     the Free Software Foundation, either version 3 of the License, or
                                        ;     (at your option) any later version.
                                        ;
                                        ;     MONA is distributed in the hope that it will be useful,
                                        ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                        ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;     GNU General Public License for more details.
                                        ;
                                        ;     You should have received a copy of the GNU General Public License
                                        ;     along with MONA.  If not, see <http://www.gnu.org/licenses/>.
                                        ;;
                                        
                                        ;-------------------------------------------------------
                                        ;     ASCII control  values
                                        ;     CTRL_x   are VT100 keyboard values  
                                        ;-------------------------------------------------------
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        ;	.include "inc/gen_macros.inc" 
                                        ;	.include "pab_macros.inc" 
                                            .include "bytecode.inc"
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
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                            
                                     35     .list 
                                     36 
                                     37 ;_dbg 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                                     38 
                                     39 ;--------------------------------------
                                     40     .area DATA 
                                     41 ;--------------------------------------	
                                     42 
                           000050    43 	TIB_SIZE=80
                           000028    44     PAD_SIZE=40
                                     45 ;	DSTACK_SIZE=64 
                           0000C0    46 	STACK_SIZE= 192 ;128
                           0017FF    47 	STACK_EMPTY=RAM_SIZE-1  
                           000000    48 	FRUN=0 ; flags run code in variable flags
                           000001    49 	FTRAP=1 ; inside trap handler 
                           000002    50 	FFOR=2 ; FOR loop in preparation 
                           000003    51 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    52 	FBREAK=4 ; break point flag 
                           000005    53 	FCOMP=5  ; compiling flags 
                                     54 
      000001                         55 in.w:  .blkb 1 ; parser position in text line
      000002                         56 in:    .blkb 1 ; low byte of in.w
      000003                         57 count: .blkb 1 ; length of string in text line  
      000004                         58 basicptr:  .blkb 2  ; point to text buffer 
      000006                         59 lineno: .blkb 2  ; BASIC line number 
      000008                         60 base:  .blkb 1 ; nemeric base used to print integer 
      000009                         61 acc24: .blkb 1 ; 24 accumulator
      00000A                         62 acc16: .blkb 1
      00000B                         63 acc8:  .blkb 1
      00000C                         64 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      00000E                         65 seedx: .blkw 1  ; xorshift 16 seed x 
      000010                         66 seedy: .blkw 1  ; xorshift 16 seed y 
      000012                         67 in.w.saved: .blkw 1 ; set by get_token before parsing next token, used by unget_token
      000014                         68 farptr: .blkb 1 ; far pointer used by file system
      000015                         69 ptr16:  .blkb 1 ; middle byte of farptr
      000016                         70 ptr8:   .blkb 1 ; least byte of farptr 
      000017                         71 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001A                         72 dstkptr: .blkw 1  ; data stack pointer 
      00001C                         73 txtbgn: .ds 2 ; BASIC text beginning address 
      00001E                         74 txtend: .ds 2 ; BASIC text end address 
      000020                         75 loop_depth: .ds 1 ; FOR loop depth, level of nested loop.  
      000021                         76 array_addr: .ds 2 ; address of @ array 
      000023                         77 array_size: .ds 2 ; array size 
      000025                         78 flags: .ds 1 ; boolean flags
      000026                         79 tab_width: .ds 1 ; print colon width (4)
      000027                         80 vars: .ds 2*26 ; BASIC variables A-Z, keep it as but last .
                                     81 ; keep as last variable 
      00005B                         82 free_ram: ; from here RAM free for BASIC text 
                                     83 
                                     84 ;-----------------------------------
                                     85     .area SSEG (ABS)
                                     86 ;-----------------------------------	
      0016C8                         87     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE ;-DSTACK_SIZE 
      0016C8                         88 tib: .ds TIB_SIZE             ; transaction input buffer
      001718                         89 pad: .ds PAD_SIZE             ; working buffer
                                     90 ;dstack: .ds DSTACK_SIZE 	  ; data stack used by FOR...NEXT 
                                     91 ;dstack_unf: ; dstack underflow ; data stack bottom 
      001740                         92 stack_full: .ds STACK_SIZE   ; control stack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      001800                         93 stack_unf: ; stack underflow ; control_stack bottom 
                                     94 
                                     95 
                                     96 ;--------------------------------------
                                     97     .area HOME 
                                     98 ;--------------------------------------
                           000000    99     DEBUG=0
      008000 82 00 81 D5            100     int cold_start
                           000000   101 .if DEBUG
                                    102 	int TrapHandler 		;TRAP  software interrupt
                           000001   103 .else
      008004 82 00 80 80            104 	int NonHandledInterrupt ;TRAP  software interrupt
                                    105 .endif
      008008 82 00 80 80            106 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 80            107 	int NonHandledInterrupt ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            108 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            109 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80            110 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80            111 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            112 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 8D            113 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80            114 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80            115 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80            116 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80            117 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80            118 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80            119 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80            120 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80            121 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80            122 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80            123 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 80            124 	int NonHandledInterrupt ;int18 UART1 RX full
      008054 82 00 80 80            125 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80            126 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 80            127 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80            128 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 81            129 	int Timer4UpdateHandler	;int23 TIM4 update/overflow used as msec ticks counter
      008068 82 00 80 80            130 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80            131 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80            132 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80            133 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80            134 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80            135 	int NonHandledInterrupt ;int29  not used
                                    136 
                                    137 ;---------------------------------------
                                    138     .area CODE
                                    139 ;---------------------------------------
                           000000   140 .if DEBUG
                                    141 .asciz "VM1" ; I like to put module name here.
                                    142 .endif 
                                    143 
      008080                        144 NonHandledInterrupt:
      008080 71                     145     .byte 0x71  ; reinitialize MCU
                                    146 
                                    147 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    148 ;------------------------------------
                                    149 ; software interrupt handler  
                                    150 ;------------------------------------
                           000000   151 .if DEBUG 
                                    152 TrapHandler:
                                    153 	bset flags,#FTRAP 
                                    154 	call print_registers
                                    155 	call cmd_itf
                                    156 	bres flags,#FTRAP 	
                                    157 	iret
                                    158 .endif 
                                    159 
      008081                        160 Timer4UpdateHandler:
      008081 72 5F 53 42      [ 1]  161 	clr TIM4_SR 
      008085 CE 00 0C         [ 2]  162 	ldw x,ticks
      008088 5C               [ 1]  163 	incw x
      008089 CF 00 0C         [ 2]  164 	ldw ticks,x 
      00808C 80               [11]  165 	iret 
                                    166 
                                    167 
                                    168 ;------------------------------------
                                    169 ; Triggered by pressing USER UserButton 
                                    170 ; on NUCLEO card.
                                    171 ;------------------------------------
      00808D                        172 UserButtonHandler:
                           000000   173 .if DEBUG
                                    174 ; wait button release
                                    175 	clrw x
                                    176 1$: decw x 
                                    177 	jrne 1$
                                    178 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    179 ; if MCU suspended by SLEEP resume program
                                    180     btjf flags,#FSLEEP,2$
                                    181 	bres flags,#FSLEEP 
                                    182 	iret
                                    183 2$:	btjt flags,#FRUN,4$
                                    184 	jp 9$ 
                                    185 4$:	; program interrupted by user 
                                    186 	bres flags,#FRUN 
                                    187 	ldw x,#USER_ABORT
                                    188 	call puts 
                                    189 	ldw x,basicptr
                                    190 	ldw x,(x)
                                    191 ; print line number 
                                    192 	mov base,#10 
                                    193 	mov tab_width,#6
                                    194 	call print_int  	
                                    195 	ldw x,basicptr 
                                    196 	addw x,#3  
                                    197 	call puts 
                                    198 	ld a,#CR 
                                    199 	call putc
                                    200 	clrw x  
                                    201 	ld a,in 
                                    202 	add a,#3 ; adjustment for line number display 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    203 	ld xl,a 
                                    204 	call spaces 
                                    205 	ld a,#'^
                                    206 	call putc 
                                    207 9$:
                                    208     ldw x,#STACK_EMPTY 
                                    209     ldw sp,x
                                    210 	rim 
                                    211 	jp warm_start
                           000001   212 .else
      00808D 80               [11]  213     iret 
                                    214 .endif 
                                    215 
      00808E 0A 50 72 6F 67 72 61   216 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    217 
                                    218 
                                    219 ;----------------------------------------
                                    220 ; inialize MCU clock 
                                    221 ; input:
                                    222 ;   A 		source  HSI | 1 HSE 
                                    223 ;   XL      CLK_CKDIVR , clock divisor 
                                    224 ; output:
                                    225 ;   none 
                                    226 ;----------------------------------------
      0080A9                        227 clock_init:	
      0080A9 C1 50 C3         [ 1]  228 	cp a,CLK_CMSR 
      0080AC 27 0C            [ 1]  229 	jreq 2$ ; no switching required 
                                    230 ; select clock source 
      0080AE 72 12 50 C5      [ 1]  231 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080B2 C7 50 C4         [ 1]  232 	ld CLK_SWR,a
      0080B5 C1 50 C3         [ 1]  233 1$:	cp a,CLK_CMSR
      0080B8 26 FB            [ 1]  234 	jrne 1$
      0080BA                        235 2$: 	
                                    236 ; HSI and cpu clock divisor 
      0080BA 9F               [ 1]  237 	ld a,xl 
      0080BB C7 50 C6         [ 1]  238 	ld CLK_CKDIVR,a  
      0080BE 81               [ 4]  239 	ret
                                    240 
                                    241 ;---------------------------------
                                    242 ; TIM4 is configured to generate an 
                                    243 ; interrupt every millisecond 
                                    244 ;----------------------------------
      0080BF                        245 timer4_init:
      0080BF 35 07 53 45      [ 1]  246 	mov TIM4_PSCR,#7 ; prescale 128  
      0080C3 35 7D 53 46      [ 1]  247 	mov TIM4_ARR,#125 ; set for 1msec.
      0080C7 35 05 53 40      [ 1]  248 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      0080CB 72 10 53 41      [ 1]  249 	bset TIM4_IER,#TIM4_IER_UIE 
      0080CF 81               [ 4]  250 	ret
                                    251 
                                    252 ;---------------------------------------------
                                    253 ;   UART3 subroutines
                                    254 ;---------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    255 
                                    256 ;---------------------------------------------
                                    257 ; initialize UART3, 115200 8N1
                                    258 ; input:
                                    259 ;	none
                                    260 ; output:
                                    261 ;   none
                                    262 ;---------------------------------------------
      0080D0                        263 uart3_init:
                                    264 	; configure tx pin
      0080D0 72 1A 50 11      [ 1]  265 	bset PD_DDR,#BIT5 ; tx pin
      0080D4 72 1A 50 12      [ 1]  266 	bset PD_CR1,#BIT5 ; push-pull output
      0080D8 72 1A 50 13      [ 1]  267 	bset PD_CR2,#BIT5 ; fast output
      0080DC                        268 uart3_set_baud: 
                                    269 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    270 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      0080DC A6 E1            [ 1]  271 	ld a,#CLK_SWR_HSI
      0080DE C1 50 C3         [ 1]  272 	cp a,CLK_CMSR 
      0080E1 27 0A            [ 1]  273 	jreq hsi_clock 
      0080E3                        274 hse_clock: ; 8 Mhz 	
      0080E3 35 05 52 43      [ 1]  275 	mov UART3_BRR2,#0x05 ; must be loaded first
      0080E7 35 04 52 42      [ 1]  276 	mov UART3_BRR1,#0x4
      0080EB 20 08            [ 2]  277 	jra uart_enable
      0080ED                        278 hsi_clock: ; 16 Mhz 	
      0080ED 35 0B 52 43      [ 1]  279 	mov UART3_BRR2,#0x0b ; must be loaded first
      0080F1 35 08 52 42      [ 1]  280 	mov UART3_BRR1,#0x08
      0080F5                        281 uart_enable:
      0080F5 72 5F 52 41      [ 1]  282     clr UART3_DR
      0080F9 35 0C 52 45      [ 1]  283 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
      0080FD 72 10 52 45      [ 1]  284 	bset UART3_CR2,#UART_CR2_SBK
      008101 72 0D 52 40 FB   [ 2]  285     btjf UART3_SR,#UART_SR_TC,.
      008106 81               [ 4]  286     ret
                                    287 	
                                    288 ;---------------------------------
                                    289 ; send character to UART3 
                                    290 ; input:
                                    291 ;   A 
                                    292 ; output:
                                    293 ;   none 
                                    294 ;--------------------------------	
      008107                        295 putc:
      008107 90 85            [ 2]  296     popw y 
      008109 90 9F            [ 1]  297     ld a,yl 
      00810B 72 0F 52 40 FB   [ 2]  298     btjf UART3_SR,#UART_SR_TXE,.
      008110 C7 52 41         [ 1]  299 	ld UART3_DR,a 
      008113 CC 81 6D         [ 2]  300 	jp next  
                                    301 
                                    302 ;---------------------------------
                                    303 ; wait character from UART3 
                                    304 ; input:
                                    305 ;   none
                                    306 ; output:
                                    307 ;   A 			char  
                                    308 ;--------------------------------	
      008116                        309 getc:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      008116 72 0B 52 40 FB   [ 2]  310 	btjf UART3_SR,#UART_SR_RXNE,.
      00811B C6 52 41         [ 1]  311 	ld a,UART3_DR 
      00811E 90 5F            [ 1]  312 	clrw y 
      008120 90 97            [ 1]  313     ld yl,a 
      008122 CC 81 6D         [ 2]  314     jp next 
                                    315 
                                    316 ;-----------------------------
                                    317 ; send an ASCIZ string to UART3 
                                    318 ; input: 
                                    319 ;   x 		char * 
                                    320 ; output:
                                    321 ;   none 
                                    322 ;-------------------------------
      008125                        323 puts:
      008125 F6               [ 1]  324     ld a,(x)
      008126 27 06            [ 1]  325 	jreq 1$
      008128 CD 81 07         [ 4]  326 	call putc 
      00812B 5C               [ 1]  327 	incw x 
      00812C 20 F7            [ 2]  328 	jra puts 
      00812E 81               [ 4]  329 1$:	ret 
                                    330 
                                    331 
                                    332 ;---------------------------
                                    333 ; delete character at left 
                                    334 ; of cursor on terminal 
                                    335 ; input:
                                    336 ;   none 
                                    337 ; output:
                                    338 ;	none 
                                    339 ;---------------------------
      00812F                        340 bksp:
      00812F A6 08            [ 1]  341 	ld a,#BSP 
      008131 CD 81 07         [ 4]  342 	call putc 
      008134 A6 20            [ 1]  343 	ld a,#SPACE 
      008136 CD 81 07         [ 4]  344 	call putc 
      008139 A6 08            [ 1]  345 	ld a,#BSP 
      00813B CD 81 07         [ 4]  346 	call putc 
      00813E 81               [ 4]  347 	ret 
                                    348 ;---------------------------
                                    349 ; delete n character left of cursor 
                                    350 ; at terminal.
                                    351 ; input: 
                                    352 ;   A   	number of characters to delete.
                                    353 ; output:
                                    354 ;    none 
                                    355 ;--------------------------	
      00813F                        356 delete:
      00813F 88               [ 1]  357 	push a 
      008140 0D 01            [ 1]  358 0$:	tnz (1,sp)
      008142 27 07            [ 1]  359 	jreq 1$
      008144 CD 81 2F         [ 4]  360 	call bksp 
      008147 0A 01            [ 1]  361 	dec (1,sp)
      008149 20 F5            [ 2]  362 	jra 0$
      00814B 84               [ 1]  363 1$:	pop a 
      00814C 81               [ 4]  364 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    365 
                                    366 ;--------------------------
                                    367 ; print n spaces on terminal
                                    368 ; input:
                                    369 ;  X 		number of spaces 
                                    370 ; output:
                                    371 ;	none 
                                    372 ;---------------------------
      00814D                        373 spaces:
      00814D A6 20            [ 1]  374 	ld a,#SPACE 
      00814F 5D               [ 2]  375 1$:	tnzw x
      008150 27 06            [ 1]  376 	jreq 9$
      008152 CD 81 07         [ 4]  377 	call putc 
      008155 5A               [ 2]  378 	decw x
      008156 20 F7            [ 2]  379 	jra 1$
      008158                        380 9$: 
      008158 81               [ 4]  381 	ret 
                                    382 
                                    383 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    384 ; machine code routine address
                                    385 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008159 81 7C 81 07 81 16 81   386 bytecode: .word bye,putc,getc,lit,litc,add,sub,divide,modulo,multiply  
             85 81 92 81 9D 81 AE
             81 BF 81 D5 81 D5
                                    387 
                                    388 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    389 ;  bytecode interpreter 
                                    390 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00816D                        391 next:
      00816D F6               [ 1]  392     ld a,(x)
      00816E 5C               [ 1]  393     incw x 
      00816F 48               [ 1]  394     sll a 
      008170 90 5F            [ 1]  395     clrw y 
      008172 90 97            [ 1]  396     ld yl,a 
      008174 72 A9 81 59      [ 2]  397     addw y,#bytecode 
      008178 90 FE            [ 2]  398     ldw y,(y)
      00817A 90 FC            [ 2]  399     jp (y)
                                    400 
                                    401 
      00817C                        402 bye:
      00817C 72 0D 52 40 FB   [ 2]  403     btjf UART3_SR,#UART_SR_TC,.
      008181 8E               [10]  404     halt 
      008182 CC 81 D5         [ 2]  405     jp cold_start 
                                    406 
                                    407 
      008185                        408 lit:
      008185 F6               [ 1]  409     ld a,(x)
      008186 5C               [ 1]  410     incw x 
      008187 90 95            [ 1]  411     ld yh,a 
      008189 F6               [ 1]  412     ld a,(x)
      00818A 5C               [ 1]  413     incw x 
      00818B 90 97            [ 1]  414     ld yl,a 
      00818D 90 89            [ 2]  415     pushw y  
      00818F CC 81 6D         [ 2]  416     jp next
                                    417 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      008192                        418 litc:
      008192 F6               [ 1]  419     ld a,(x)
      008193 5C               [ 1]  420     incw x 
      008194 90 5F            [ 1]  421     clrw y 
      008196 90 97            [ 1]  422     ld yl,a 
      008198 90 89            [ 2]  423     pushw y 
      00819A CC 81 6D         [ 2]  424     jp next 
                                    425 
                                    426 
      00819D                        427 add:
      00819D 90 85            [ 2]  428     popw y
      00819F 90 CF 00 0A      [ 2]  429     ldw acc16, y
      0081A3 90 85            [ 2]  430     popw y
      0081A5 72 B9 00 0A      [ 2]  431     addw y,acc16 
      0081A9 90 89            [ 2]  432     pushw y
      0081AB CC 81 6D         [ 2]  433     jp next
                                    434 
      0081AE                        435 sub:
      0081AE 90 85            [ 2]  436     popw y 
      0081B0 90 CF 00 0A      [ 2]  437     ldw acc16,y 
      0081B4 90 85            [ 2]  438     popw y 
      0081B6 72 B2 00 0A      [ 2]  439     subw y,acc16 
      0081BA 90 89            [ 2]  440     pushw y 
      0081BC CC 81 6D         [ 2]  441     jp next
                                    442 
      0081BF                        443 divide:
      0081BF 90 85            [ 2]  444     popw y 
      0081C1 90 CF 00 0A      [ 2]  445     ldw acc16,y 
      0081C5 90 85            [ 2]  446     popw y 
      0081C7 89               [ 2]  447     pushw x 
      0081C8 51               [ 1]  448     exgw x,y 
      0081C9 90 CE 00 0A      [ 2]  449     ldw y,acc16 
      0081CD 65               [ 2]  450     divw x,y 
      0081CE 51               [ 1]  451     exgw x,y 
      0081CF 85               [ 2]  452     popw x 
      0081D0 90 89            [ 2]  453     pushw y 
      0081D2 CC 81 6D         [ 2]  454     jp next 
                                    455 
      0081D5                        456 modulo:
                                    457 
                                    458 
      0081D5                        459 multiply:
                                    460 
                                    461 ;-----------------------------
                                    462 ;  STARTUP CODE
                                    463 ;-----------------------------
                                    464 
      0081D5                        465 cold_start:
      0081D5 AE 17 FF         [ 2]  466     ldw x,#STACK_EMPTY
      0081D8 94               [ 1]  467     ldw sp,x
                                    468 ; clear all ram 
      0081D9 7F               [ 1]  469 0$: clr (x)
      0081DA 5A               [ 2]  470 	decw x 
      0081DB 26 FC            [ 1]  471 	jrne 0$
                                    472 ; activate pull up on all inputs 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081DD A6 FF            [ 1]  473 	ld a,#255 
      0081DF C7 50 03         [ 1]  474 	ld PA_CR1,a 
      0081E2 C7 50 08         [ 1]  475 	ld PB_CR1,a 
      0081E5 C7 50 0D         [ 1]  476 	ld PC_CR1,a 
      0081E8 C7 50 12         [ 1]  477 	ld PD_CR1,a 
      0081EB C7 50 17         [ 1]  478 	ld PE_CR1,a 
      0081EE C7 50 1C         [ 1]  479 	ld PF_CR1,a 
      0081F1 C7 50 21         [ 1]  480 	ld PG_CR1,a 
      0081F4 C7 50 2B         [ 1]  481 	ld PI_CR1,a 
                                    482 ; configure LD2 pin 
      0081F7 72 1A 50 0D      [ 1]  483     bset PC_CR1,#LED2_BIT
      0081FB 72 1A 50 0E      [ 1]  484     bset PC_CR2,#LED2_BIT
      0081FF 72 1A 50 0C      [ 1]  485     bset PC_DDR,#LED2_BIT
      008203 72 1A 50 0A      [ 1]  486     bset PC_ODR,#LED2_BIT 
                                    487 ; select internal clock no divisor: 16 Mhz 	
      008207 A6 E1            [ 1]  488 	ld a,#CLK_SWR_HSI 
      008209 5F               [ 1]  489 	clrw x  
      00820A CD 80 A9         [ 4]  490     call clock_init 
                                    491 ;    call timer4_init 
                                    492 ; UART3 at 115200 BAUD
      00820D CD 80 D0         [ 4]  493     call uart3_init
      008210 9A               [ 1]  494     rim 
      008211 72 1B 50 0A      [ 1]  495     bres PC_ODR,#LED2_BIT 
      008215 AE 82 2A         [ 2]  496     ldw x,#test 
      008218 CC 81 6D         [ 2]  497     jp next 
      00821B                        498 warm_start: 
      00821B 63 65 63 69 20 65 73   499 .asciz "ceci est test\n"
             74 20 74 65 73 74 0A
             00
      00822A                        500 test:
      00822A 04 4F 01 04 4B 01 04   501     .byte LITC,'O',PUTC,LITC,'K',PUTC,LITC,10,PUTC,BYE 
             0A 01 00
                                    502 
                                    503     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |     ADD     =  000005 
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BSP     =  000008     |     BYE     =  000000 
    CAN_DGR =  005426     |     CAN_FPSR=  005427     |     CAN_IER =  005425 
    CAN_MCR =  005420     |     CAN_MSR =  005421     |     CAN_P0  =  005428 
    CAN_P1  =  005429     |     CAN_P2  =  00542A     |     CAN_P3  =  00542B 
    CAN_P4  =  00542C     |     CAN_P5  =  00542D     |     CAN_P6  =  00542E 
    CAN_P7  =  00542F     |     CAN_P8  =  005430     |     CAN_P9  =  005431 
    CAN_PA  =  005432     |     CAN_PB  =  005433     |     CAN_PC  =  005434 
    CAN_PD  =  005435     |     CAN_PE  =  005436     |     CAN_PF  =  005437 
    CAN_RFR =  005424     |     CAN_TPR =  005423     |     CAN_TSR =  005422 
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
    CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0     |     CLK_ICKR=  000002 
    CLK_ICKR=  000000     |     CLK_ICKR=  000001     |     CLK_ICKR=  000003 
    CLK_ICKR=  000004     |     CLK_ICKR=  000005     |     CLK_PCKE=  0050C7 
    CLK_PCKE=  000000     |     CLK_PCKE=  000001     |     CLK_PCKE=  000007 
    CLK_PCKE=  000005     |     CLK_PCKE=  000006     |     CLK_PCKE=  000004 
    CLK_PCKE=  000002     |     CLK_PCKE=  000003     |     CLK_PCKE=  0050CA 
    CLK_PCKE=  000003     |     CLK_PCKE=  000002     |     CLK_PCKE=  000007 
    CLK_SWCR=  0050C5     |     CLK_SWCR=  000000     |     CLK_SWCR=  000001 
    CLK_SWCR=  000002     |     CLK_SWCR=  000003     |     CLK_SWIM=  0050CD 
    CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1 
    CLK_SWR_=  0000D2     |     COMMA   =  00002C     |     CPU_A   =  007F00 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]

Symbol Table

    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |     CTRL_A  =  000001 
    CTRL_B  =  000002     |     CTRL_C  =  000003     |     CTRL_D  =  000004 
    CTRL_E  =  000005     |     CTRL_F  =  000006     |     CTRL_G  =  000007 
    CTRL_H  =  000008     |     CTRL_I  =  000009     |     CTRL_J  =  00000A 
    CTRL_K  =  00000B     |     CTRL_L  =  00000C     |     CTRL_M  =  00000D 
    CTRL_N  =  00000E     |     CTRL_O  =  00000F     |     CTRL_P  =  000010 
    CTRL_Q  =  000011     |     CTRL_R  =  000012     |     CTRL_S  =  000013 
    CTRL_T  =  000014     |     CTRL_U  =  000015     |     CTRL_V  =  000016 
    CTRL_W  =  000017     |     CTRL_X  =  000018     |     CTRL_Y  =  000019 
    CTRL_Z  =  00001A     |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
    DIVIDE  =  000007     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
    ESC     =  00001B     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |     FF      =  00000C 
    FFOR    =  000002     |     FHSE    =  7A1200     |     FHSI    =  F42400 
    FLASH_BA=  008000     |     FLASH_CR=  00505A     |     FLASH_CR=  000002 
    FLASH_CR=  000000     |     FLASH_CR=  000003     |     FLASH_CR=  000001 
    FLASH_CR=  00505B     |     FLASH_CR=  000005     |     FLASH_CR=  000004 
    FLASH_CR=  000007     |     FLASH_CR=  000000     |     FLASH_CR=  000006 
    FLASH_DU=  005064     |     FLASH_DU=  0000AE     |     FLASH_DU=  000056 
    FLASH_EN=  027FFF     |     FLASH_FP=  00505D     |     FLASH_FP=  000000 
    FLASH_FP=  000001     |     FLASH_FP=  000002     |     FLASH_FP=  000003 
    FLASH_FP=  000004     |     FLASH_FP=  000005     |     FLASH_IA=  00505F 
    FLASH_IA=  000003     |     FLASH_IA=  000002     |     FLASH_IA=  000006 
    FLASH_IA=  000001     |     FLASH_IA=  000000     |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLSI    =  01F400     |     FRUN    =  000000     |     FSLEEP  =  000003 
    FTRAP   =  000001     |     GETC    =  000002     |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    HSECNT  =  004809     |     I2C_CCRH=  00521C     |     I2C_CCRH=  000080 
    I2C_CCRH=  0000C0     |     I2C_CCRH=  000080     |     I2C_CCRH=  000000 
    I2C_CCRH=  000001     |     I2C_CCRH=  000000     |     I2C_CCRL=  00521B 
    I2C_CCRL=  00001A     |     I2C_CCRL=  000002     |     I2C_CCRL=  00000D 
    I2C_CCRL=  000050     |     I2C_CCRL=  000090     |     I2C_CCRL=  0000A0 
    I2C_CR1 =  005210     |     I2C_CR1_=  000006     |     I2C_CR1_=  000007 
    I2C_CR1_=  000000     |     I2C_CR2 =  005211     |     I2C_CR2_=  000002 
    I2C_CR2_=  000003     |     I2C_CR2_=  000000     |     I2C_CR2_=  000001 
    I2C_CR2_=  000007     |     I2C_DR  =  005216     |     I2C_FREQ=  005212 
    I2C_ITR =  00521A     |     I2C_ITR_=  000002     |     I2C_ITR_=  000000 
    I2C_ITR_=  000001     |     I2C_OARH=  005214     |     I2C_OARH=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]

Symbol Table

    I2C_OARH=  000002     |     I2C_OARH=  000006     |     I2C_OARH=  000007 
    I2C_OARL=  005213     |     I2C_OARL=  000000     |     I2C_OAR_=  000813 
    I2C_OAR_=  000009     |     I2C_PECR=  00521E     |     I2C_READ=  000001 
    I2C_SR1 =  005217     |     I2C_SR1_=  000003     |     I2C_SR1_=  000001 
    I2C_SR1_=  000002     |     I2C_SR1_=  000006     |     I2C_SR1_=  000000 
    I2C_SR1_=  000004     |     I2C_SR1_=  000007     |     I2C_SR2 =  005218 
    I2C_SR2_=  000002     |     I2C_SR2_=  000001     |     I2C_SR2_=  000000 
    I2C_SR2_=  000003     |     I2C_SR2_=  000005     |     I2C_SR3 =  005219 
    I2C_SR3_=  000001     |     I2C_SR3_=  000007     |     I2C_SR3_=  000004 
    I2C_SR3_=  000000     |     I2C_SR3_=  000002     |     I2C_TRIS=  00521D 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_WRIT=  000000     |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |     INT_ADC2=  000016 
    INT_AUAR=  000012     |     INT_AWU =  000001     |     INT_CAN_=  000008 
    INT_CAN_=  000009     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
    INT_EXTI=  000007     |     INT_FLAS=  000018     |     INT_I2C =  000013 
    INT_SPI =  00000A     |     INT_TIM1=  00000C     |     INT_TIM1=  00000B 
    INT_TIM2=  00000E     |     INT_TIM2=  00000D     |     INT_TIM3=  000010 
    INT_TIM3=  00000F     |     INT_TIM4=  000017     |     INT_TLI =  000000 
    INT_UART=  000011     |     INT_UART=  000015     |     INT_UART=  000014 
    INT_VECT=  008060     |     INT_VECT=  00800C     |     INT_VECT=  008028 
    INT_VECT=  00802C     |     INT_VECT=  008010     |     INT_VECT=  008014 
    INT_VECT=  008018     |     INT_VECT=  00801C     |     INT_VECT=  008020 
    INT_VECT=  008024     |     INT_VECT=  008068     |     INT_VECT=  008054 
    INT_VECT=  008000     |     INT_VECT=  008030     |     INT_VECT=  008038 
    INT_VECT=  008034     |     INT_VECT=  008040     |     INT_VECT=  00803C 
    INT_VECT=  008048     |     INT_VECT=  008044     |     INT_VECT=  008064 
    INT_VECT=  008008     |     INT_VECT=  008004     |     INT_VECT=  008050 
    INT_VECT=  00804C     |     INT_VECT=  00805C     |     INT_VECT=  008058 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LIT     =  000003 
    LITC    =  000004     |     MODULO  =  000008     |     MULTIPLY=  000009 
    NAFR    =  004804     |     NCLKOPT =  004808     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NL      =  00000A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R   |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    PA      =  000000     |     PAD_SIZE=  000028     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]

Symbol Table

    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |     PUTC    =  000001     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |     ROP     =  004800 
    RST_SR  =  0050B3     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |     SPACE   =  000020     |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     STACK_EM=  0017FF     |     STACK_SI=  0000C0 
    SUB     =  000006     |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TIB_SIZE=  000050     |     TICK    =  000027     |     TIM1_ARR=  005262 
    TIM1_ARR=  005263     |     TIM1_BKR=  00526D     |     TIM1_CCE=  00525C 
    TIM1_CCE=  00525D     |     TIM1_CCM=  005258     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000003     |     TIM1_CCM=  005259     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000003     |     TIM1_CCM=  00525A     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000003     |     TIM1_CCM=  00525B     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000003     |     TIM1_CCR=  005265     |     TIM1_CCR=  005266 
    TIM1_CCR=  005267     |     TIM1_CCR=  005268     |     TIM1_CCR=  005269 
    TIM1_CCR=  00526A     |     TIM1_CCR=  00526B     |     TIM1_CCR=  00526C 
    TIM1_CNT=  00525E     |     TIM1_CNT=  00525F     |     TIM1_CR1=  005250 
    TIM1_CR2=  005251     |     TIM1_CR2=  000000     |     TIM1_CR2=  000002 
    TIM1_CR2=  000004     |     TIM1_CR2=  000005     |     TIM1_CR2=  000006 
    TIM1_DTR=  00526E     |     TIM1_EGR=  005257     |     TIM1_EGR=  000007 
    TIM1_EGR=  000001     |     TIM1_EGR=  000002     |     TIM1_EGR=  000003 
    TIM1_EGR=  000004     |     TIM1_EGR=  000005     |     TIM1_EGR=  000006 
    TIM1_EGR=  000000     |     TIM1_ETR=  005253     |     TIM1_ETR=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_ETR=  000000     |     TIM1_ETR=  000001     |     TIM1_ETR=  000002 
    TIM1_ETR=  000003     |     TIM1_ETR=  000007     |     TIM1_ETR=  000004 
    TIM1_ETR=  000005     |     TIM1_IER=  005254     |     TIM1_IER=  000007 
    TIM1_IER=  000001     |     TIM1_IER=  000002     |     TIM1_IER=  000003 
    TIM1_IER=  000004     |     TIM1_IER=  000005     |     TIM1_IER=  000006 
    TIM1_IER=  000000     |     TIM1_OIS=  00526F     |     TIM1_PSC=  005260 
    TIM1_PSC=  005261     |     TIM1_RCR=  005264     |     TIM1_SMC=  005252 
    TIM1_SMC=  000007     |     TIM1_SMC=  000000     |     TIM1_SMC=  000001 
    TIM1_SMC=  000002     |     TIM1_SMC=  000004     |     TIM1_SMC=  000005 
    TIM1_SMC=  000006     |     TIM1_SR1=  005255     |     TIM1_SR1=  000007 
    TIM1_SR1=  000001     |     TIM1_SR1=  000002     |     TIM1_SR1=  000003 
    TIM1_SR1=  000004     |     TIM1_SR1=  000005     |     TIM1_SR1=  000006 
    TIM1_SR1=  000000     |     TIM1_SR2=  005256     |     TIM1_SR2=  000001 
    TIM1_SR2=  000002     |     TIM1_SR2=  000003     |     TIM1_SR2=  000004 
    TIM2_ARR=  00530D     |     TIM2_ARR=  00530E     |     TIM2_CCE=  005308 
    TIM2_CCE=  005309     |     TIM2_CCM=  005305     |     TIM2_CCM=  005306 
    TIM2_CCM=  005307     |     TIM2_CCR=  00530F     |     TIM2_CCR=  005310 
    TIM2_CCR=  005311     |     TIM2_CCR=  005312     |     TIM2_CCR=  005313 
    TIM2_CCR=  005314     |     TIM2_CNT=  00530A     |     TIM2_CNT=  00530B 
    TIM2_CR1=  005300     |     TIM2_EGR=  005304     |     TIM2_IER=  005301 
    TIM2_PSC=  00530C     |     TIM2_SR1=  005302     |     TIM2_SR2=  005303 
    TIM3_ARR=  00532B     |     TIM3_ARR=  00532C     |     TIM3_CCE=  005327 
    TIM3_CCE=  000000     |     TIM3_CCE=  000001     |     TIM3_CCE=  000004 
    TIM3_CCE=  000005     |     TIM3_CCE=  000000     |     TIM3_CCE=  000001 
    TIM3_CCM=  005325     |     TIM3_CCM=  005326     |     TIM3_CCM=  000000 
    TIM3_CCM=  000004     |     TIM3_CCM=  000003     |     TIM3_CCR=  00532D 
    TIM3_CCR=  00532E     |     TIM3_CCR=  00532F     |     TIM3_CCR=  005330 
    TIM3_CNT=  005328     |     TIM3_CNT=  005329     |     TIM3_CR1=  005320 
    TIM3_CR1=  000007     |     TIM3_CR1=  000000     |     TIM3_CR1=  000003 
    TIM3_CR1=  000001     |     TIM3_CR1=  000002     |     TIM3_EGR=  005324 
    TIM3_IER=  005321     |     TIM3_PSC=  00532A     |     TIM3_SR1=  005322 
    TIM3_SR2=  005323     |     TIM4_ARR=  005346     |     TIM4_CNT=  005344 
    TIM4_CR1=  005340     |     TIM4_CR1=  000007     |     TIM4_CR1=  000000 
    TIM4_CR1=  000003     |     TIM4_CR1=  000001     |     TIM4_CR1=  000002 
    TIM4_EGR=  005343     |     TIM4_EGR=  000000     |     TIM4_IER=  005341 
    TIM4_IER=  000000     |     TIM4_PSC=  005345     |     TIM4_PSC=  000000 
    TIM4_PSC=  000007     |     TIM4_PSC=  000004     |     TIM4_PSC=  000001 
    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   5 Timer4Up   000001 R
    UART1   =  000000     |     UART1_BA=  005230     |     UART1_BR=  005232 
    UART1_BR=  005233     |     UART1_CR=  005234     |     UART1_CR=  005235 
    UART1_CR=  005236     |     UART1_CR=  005237     |     UART1_CR=  005238 
    UART1_DR=  005231     |     UART1_GT=  005239     |     UART1_PO=  000000 
    UART1_PS=  00523A     |     UART1_RX=  000004     |     UART1_SR=  005230 
    UART1_TX=  000005     |     UART3   =  000001     |     UART3_BA=  005240 
    UART3_BR=  005242     |     UART3_BR=  005243     |     UART3_CR=  005244 
    UART3_CR=  005245     |     UART3_CR=  005246     |     UART3_CR=  005247 
    UART3_CR=  004249     |     UART3_DR=  005241     |     UART3_PO=  00000F 
    UART3_RX=  000006     |     UART3_SR=  005240     |     UART3_TX=  000005 
    UART_BRR=  000002     |     UART_BRR=  000003     |     UART_CR1=  000004 
    UART_CR1=  000004     |     UART_CR1=  000002     |     UART_CR1=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]

Symbol Table

    UART_CR1=  000001     |     UART_CR1=  000007     |     UART_CR1=  000006 
    UART_CR1=  000005     |     UART_CR1=  000003     |     UART_CR2=  000005 
    UART_CR2=  000004     |     UART_CR2=  000002     |     UART_CR2=  000005 
    UART_CR2=  000001     |     UART_CR2=  000000     |     UART_CR2=  000006 
    UART_CR2=  000003     |     UART_CR2=  000007     |     UART_CR3=  000006 
    UART_CR3=  000003     |     UART_CR3=  000001     |     UART_CR3=  000002 
    UART_CR3=  000000     |     UART_CR3=  000006     |     UART_CR3=  000004 
    UART_CR3=  000005     |     UART_CR4=  000007     |     UART_CR4=  000000 
    UART_CR4=  000001     |     UART_CR4=  000002     |     UART_CR4=  000003 
    UART_CR4=  000004     |     UART_CR4=  000006     |     UART_CR4=  000005 
    UART_CR5=  000008     |     UART_CR5=  000003     |     UART_CR5=  000001 
    UART_CR5=  000002     |     UART_CR5=  000004     |     UART_CR5=  000005 
    UART_CR6=  000009     |     UART_CR6=  000004     |     UART_CR6=  000007 
    UART_CR6=  000001     |     UART_CR6=  000002     |     UART_CR6=  000000 
    UART_CR6=  000005     |     UART_DR =  000001     |     UART_GTR=  000009 
    UART_PSC=  00000A     |     UART_SR =  000000     |     UART_SR_=  000001 
    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBC     =  004801     |   5 USER_ABO   00000E R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 UserButt   00000D R   |     VT      =  00000B     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
  1 acc16      000009 R   |   1 acc24      000008 R   |   1 acc8       00000A R
  5 add        00011D R   |   1 array_ad   000020 R   |   1 array_si   000022 R
  1 base       000007 R   |   1 basicptr   000003 R   |   5 bksp       0000AF R
  5 bye        0000FC R   |   5 bytecode   0000D9 R   |   5 clock_in   000029 R
  5 cold_sta   000155 R   |   1 count      000002 R   |   5 delete     0000BF R
  5 divide     00013F R   |   1 dstkptr    000019 R   |   1 farptr     000013 R
  1 ffree      000016 R   |   1 flags      000024 R   |   1 free_ram   00005A R
  5 getc       000096 R   |   5 hse_cloc   000063 R   |   5 hsi_cloc   00006D R
  1 in         000001 R   |   1 in.w       000000 R   |   1 in.w.sav   000011 R
  1 lineno     000005 R   |   5 lit        000105 R   |   5 litc       000112 R
  1 loop_dep   00001F R   |   5 modulo     000155 R   |   5 multiply   000155 R
  5 next       0000ED R   |   3 pad        001718 R   |   1 ptr16      000014 R
  1 ptr8       000015 R   |   5 putc       000087 R   |   5 puts       0000A5 R
  1 seedx      00000D R   |   1 seedy      00000F R   |   5 spaces     0000CD R
  3 stack_fu   001740 R   |   3 stack_un   001800 R   |   5 sub        00012E R
  1 tab_widt   000025 R   |   5 test       0001AA R   |   3 tib        0016C8 R
  1 ticks      00000B R   |   5 timer4_i   00003F R   |   1 txtbgn     00001B R
  1 txtend     00001D R   |   5 uart3_in   000050 R   |   5 uart3_se   00005C R
  5 uart_ena   000075 R   |   1 vars       000026 R   |   5 warm_sta   00019B R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5A   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size    1B4   flags    0

