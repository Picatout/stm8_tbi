ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 1.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020 
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
                                     26 
                                     27 
                                     28 
                                     29     .module TBI_STM8
                                     30 
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
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; TIM2_CR1 bitfields
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; TIMER2_CCMR bitfields 
                                 
                                 
                                 
                                        
                                        ; TIMER2_CCER1 bitfields
                                 
                                 
                                 
                                 
                                        
                                        ; TIMER2_EGR bitfields
                                 
                                 
                                 
                                 
                                 
                                        
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
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        	.include "inc/gen_macros.inc" 
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
                                        ;   console Input/Output module
                                        ;   DATE: 2019-12-11
                                        ;    
                                        ;   General usage macros.   
                                        ;
                                        ;--------------------------------------
                                        
                                            ; reserve space on stack
                                            ; for local variabls
                                            .macro _vars n 
                                            
                                            ; free space on stack
                                            .macro _drop n 
                                        
                                            ; declare ARG_OFS for arguments 
                                            ; displacement on stack. This 
                                            ; value depend on local variables 
                                            ; size.
                                            .macro _argofs n 
                                        
                                            ; declare a function argument 
                                            ; position relative to stack pointer 
                                            ; _argofs must be called before it.
                                            .macro _arg name ofs 
                                        	.include "pab_macros.inc" 
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
                                 
                                 
                                                ; keyword types 
                                 
                                 
                                 
                                 
                                        
                                        ;--------------------------------------
                                        ;   constantes related to Arduino 
                                        ;   API mapping 
                                        ;-------------------------------------
                                 
                                 
                                        
                                        ;--------------------------------------
                                        ;       token attribute
                                        ;--------------------------------------
                                                ; bits 4:5 identify token group 
                                                ; 0x0n -> miscelinous 
                                                ; 0x1n -> +|- operators 
                                                ; 0x2n -> *|/|% operators
                                                ; 0x3n -> relational operators 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                                ; don't change these token values 
                                                ; values chosen to be used as a mask.
                                                ; bits 7:6  always 0 
                                                ; bits 5:4 identify group 
                                                ; bits 3:0 token identifier inside group  
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ;--------------------------------------
                                        ;   error codes 
                                        ;--------------------------------------
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                            
                                        ;--------------------------------------
                                        ;   assembler flags 
                                        ;-------------------------------------
                                 
                                        
                                        
                                            .macro _usec_dly n 
                                            
                                        ;---------------------------------------
                                        ;  data stack macros 
                                        ;---------------------------------------
                                 
                                        
                                            ; move dp up 1 element 
                                            .macro _dp_up 
                                        
                                            ;move dp down 1 element
                                            .macro _dp_down 
                                        
                                            ; load X register with 
                                            ; entry point of dictionary
                                            ; before calling 'search_dict'
                                            .macro _ldx_dict dict_name
                                        
                                        ;-------------------------------
                                        ;  macros used to help debugging
                                        ;-------------------------------
                                 
                                            .macro _dbg 
                                        
                                            .macro _nodbg
                                        
                                 
                                 
                                 
                                 
                                            .macro _dbg_save_regs 
                                        
                                            .macro _dbg_restore_regs 
                                        
                                            .macro _dbg_getc 
                                        
                                            .macro _dbg_putc 
                                        
                                            .macro _dbg_puts 
                                        
                                            .macro _dbg_prti24 
                                        
                                            .macro _dbg_prt_regs
                                        
                                            .macro _dbg_peek addr 
                                        
                                            .macro _dbg_parser_init 
                                        
                                            .macro _dbg_readln
                                        
                                            .macro _dbg_number
                                        
                                            .macro _dbg_nextword
                                        
                                            .macro _dbg_dots 
                                        
                                            .macro _dbg_trap
                                        
                                            .macro _dbg_mark n  
                                            
                                            .macro _dbg_prt_var var 
                                        
                                            .macro _dbg_show 
                                        
                                     37     .list 
                                     38 
      000001                         39 _dbg 
                           000001     1     DEBUG=1
                                     40 
                                     41 	
                                     42 ;--------------------------------------
                                     43     .area DATA 
                                     44 ;--------------------------------------	
                                     45 
                           000050    46 	TIB_SIZE=80
                           000028    47     PAD_SIZE=40
                           000040    48 	DSTACK_SIZE=64 
                           000080    49 	STACK_SIZE=128
                           0017FF    50 	STACK_EMPTY=RAM_SIZE-1  
                           000000    51 	FRUN=0 ; flags run code in variable flags
                           000001    52 	FTRAP=1 ; inside trap handler 
                           000002    53 	FFOR=2 ; FOR loop in preparation 
                           000003    54 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    55 	FBREAK=4 ; break point flag 
                           000005    56 	FCOMP=5  ; compiling flags 
                                     57 
                           004000    58 	AUTORUN_NAME=0x4000 ; address in EEPROM where auto run file name is saved 
                                     59 
      000002                         60 in.w:  .blkb 1 ; parser position in text line
      000003                         61 in:    .blkb 1 ; low byte of in.w
      000004                         62 in.saved: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000005                         63 count: .blkb 1 ; current BASIC line length and tib text length  
      000007                         64 basicptr:  .blkb 2  ; point to current BASIC line 
      000008                         65 base:  .blkb 1 ; nemeric base used to print integer 
      000009                         66 acc24: .blkb 1 ; 24 bit accumulator
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      00000A                         67 acc16: .blkb 1 ; 16 bit accumulator, middle byte of acc24
      00000B                         68 acc8:  .blkb 1 ;  8 bit accumulator, least byte of acc24 
      00000D                         69 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      00000F                         70 timer: .blkw 1 ;  milliseconds count down timer 
      000011                         71 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000013                         72 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000014                         73 farptr: .blkb 1 ; 24 bits pointer used by file system
      000015                         74 ptr16:  .blkb 1 ; 16 bits pointer ,  middle byte of farptr
      000016                         75 ptr8:   .blkb 1 ; 8 bits pointer, least byte of farptr 
      000019                         76 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001B                         77 dstkptr: .blkw 1  ; data stack pointer 
      00001D                         78 txtbgn: .ds 2 ; tokenized BASIC text beginning address 
      00001F                         79 txtend: .ds 2 ; tokenized BASIC text end address 
      000020                         80 loop_depth: .ds 1 ; FOR loop depth, level of nested loop. Conformity check   
      000022                         81 array_size: .ds 2 ; array size 
      000023                         82 flags: .ds 1 ; various boolean flags
      000024                         83 tab_width: .ds 1 ; print colon width (4)
      000058                         84 vars: .ds 2*26 ; BASIC variables A-Z, keep it as but last .
                                     85 ; keep as last variable 
      0016C8                         86 free_ram: ; from here RAM free for BASIC text 
                                     87 
                                     88 ;-----------------------------------
                                     89     .area SSEG (ABS)
                                     90 ;-----------------------------------	
      0016C8                         91     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE-DSTACK_SIZE 
      001718                         92 tib: .ds TIB_SIZE             ; transaction input buffer
      001740                         93 pad: .ds PAD_SIZE             ; working buffer
      001780                         94 dstack: .ds DSTACK_SIZE 	  ; data stack used by FOR...NEXT 
      001780                         95 dstack_empty: ; dstack underflow ; data stack bottom 
      001800                         96 stack_full: .ds STACK_SIZE   ; control stack 
      001800                         97 stack_unf: ; stack underflow ; control_stack bottom 
                                     98 
                                     99 
                                    100 ;--------------------------------------
                                    101     .area HOME 
                                    102 ;--------------------------------------
      008000 82 00 85 E0            103     int cold_start
                           000001   104 .if DEBUG
      008004 82 00 80 98            105 	int TrapHandler 		;TRAP  software interrupt
                           000000   106 .else
                                    107 	int NonHandledInterrupt ;TRAP  software interrupt
                                    108 .endif
      008008 82 00 80 89            109 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 8A            110 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 89            111 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 89            112 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 89            113 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 89            114 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 89            115 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 BD            116 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 89            117 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 89            118 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 89            119 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 89            120 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 89            121 	int NonHandledInterrupt ;int12 TIM1 capture/compare
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      00803C 82 00 80 89            122 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 89            123 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 89            124 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 89            125 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 89            126 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 89            127 	int NonHandledInterrupt ;int18 UART1 RX full
      008054 82 00 80 89            128 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 89            129 	int NonHandledInterrupt ;int20 UART1 TX completed
      00805C 82 00 80 89            130 	int NonHandledInterrupt ;int21 UART1 RX full
      008060 82 00 80 89            131 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 A7            132 	int Timer4UpdateHandler	;int23 TIM4 update/overflow used as msec ticks counter
      008068 82 00 80 89            133 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 89            134 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 89            135 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 89            136 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 89            137 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 89            138 	int NonHandledInterrupt ;int29  not used
                                    139 
                                    140 ;---------------------------------------
                                    141     .area CODE
                                    142 ;---------------------------------------
                           000001   143 .if DEBUG
      008080 53 54 4D 38 5F 54 42   144 .asciz "STM8_TBI" ; I like to put module name here.
             49 00
                                    145 .endif 
                                    146 
      008089                        147 NonHandledInterrupt:
      008089 71                     148     .byte 0x71  ; reinitialize MCU
                                    149 
                                    150 ; auto wakeup from halt
      00808A                        151 AWUHandler:
      00808A 72 19 50 F0      [ 1]  152 	bres AWU_CSR,#AWU_CSR_AWUEN
      00808E 55 00 3F 50 F1   [ 1]  153 	mov AWU_APR,0x3F
      008093 72 5F 50 F2      [ 1]  154 	clr AWU_TBR 
      008097 80               [11]  155 	iret
                                    156 
                                    157 ;------------------------------------
                                    158 ; software interrupt handler  
                                    159 ;------------------------------------
                           000001   160 .if DEBUG 
      008098                        161 TrapHandler:
      008098 72 12 00 22      [ 1]  162 	bset flags,#FTRAP 
      00809C CD 89 6C         [ 4]  163 	call print_registers
      00809F CD 8B D7         [ 4]  164 	call cmd_itf
      0080A2 72 13 00 22      [ 1]  165 	bres flags,#FTRAP 	
      0080A6 80               [11]  166 	iret
                                    167 .endif 
                                    168 
      0080A7                        169 Timer4UpdateHandler:
      0080A7 72 5F 53 42      [ 1]  170 	clr TIM4_SR 
      0080AB CE 00 0B         [ 2]  171 	ldw x,ticks
      0080AE 5C               [ 2]  172 	incw x
      0080AF CF 00 0B         [ 2]  173 	ldw ticks,x 
      0080B2 CE 00 0D         [ 2]  174 	ldw x,timer
      0080B5 5D               [ 2]  175 	tnzw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      0080B6 27 04            [ 1]  176 	jreq 1$
      0080B8 5A               [ 2]  177 	decw x 
      0080B9 CF 00 0D         [ 2]  178 	ldw timer,x 
      0080BC                        179 1$:	
      0080BC 80               [11]  180 	iret 
                                    181 
                                    182 
                                    183 ;------------------------------------
                                    184 ; Triggered by pressing USER UserButton 
                                    185 ; on NUCLEO card.
                                    186 ;------------------------------------
      0080BD                        187 UserButtonHandler:
                                    188 ; wait button release
      0080BD 5F               [ 1]  189 	clrw x
      0080BE 5A               [ 2]  190 1$: decw x 
      0080BF 26 FD            [ 1]  191 	jrne 1$
      0080C1 72 09 50 15 F8   [ 2]  192 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    193 ; if MCU suspended by SLEEP resume program
      0080C6 72 07 00 22 05   [ 2]  194     btjf flags,#FSLEEP,2$
      0080CB 72 17 00 22      [ 1]  195 	bres flags,#FSLEEP 
      0080CF 80               [11]  196 	iret
      0080D0 72 00 00 22 03   [ 2]  197 2$:	btjt flags,#FRUN,4$
      0080D5 CC 80 E8         [ 2]  198 	jp 9$ 
      0080D8                        199 4$:	; program interrupted by user 
      0080D8 72 11 00 22      [ 1]  200 	bres flags,#FRUN 
      0080DC AE 80 F0         [ 2]  201 	ldw x,#USER_ABORT
      0080DF CD 82 44         [ 4]  202 	call puts 
      0080E2 CE 00 05         [ 2]  203 	ldw x,basicptr 
      0080E5 CD 95 65         [ 4]  204 	call prt_basic_line
      0080E8                        205 9$:
      0080E8 AE 17 FF         [ 2]  206     ldw x,#STACK_EMPTY 
      0080EB 94               [ 1]  207     ldw sp,x
      0080EC 9A               [ 1]  208 	rim 
      0080ED CC 88 53         [ 2]  209 	jp warm_start
                                    210 
      0080F0 0A 50 72 6F 67 72 61   211 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    212 
                                    213 ;----------------------------------------
                                    214 ; inialize MCU clock 
                                    215 ; input:
                                    216 ;   A 		source  HSI | 1 HSE 
                                    217 ;   XL      CLK_CKDIVR , clock divisor 
                                    218 ; output:
                                    219 ;   none 
                                    220 ;----------------------------------------
      00810B                        221 clock_init:	
      00810B C1 50 C3         [ 1]  222 	cp a,CLK_CMSR 
      00810E 27 0C            [ 1]  223 	jreq 2$ ; no switching required 
                                    224 ; select clock source 
      008110 72 12 50 C5      [ 1]  225 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008114 C7 50 C4         [ 1]  226 	ld CLK_SWR,a
      008117 C1 50 C3         [ 1]  227 1$:	cp a,CLK_CMSR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      00811A 26 FB            [ 1]  228 	jrne 1$
      00811C                        229 2$: 	
                                    230 ; HSI and cpu clock divisor 
      00811C 9F               [ 1]  231 	ld a,xl 
      00811D C7 50 C6         [ 1]  232 	ld CLK_CKDIVR,a  
      008120 81               [ 4]  233 	ret
                                    234 
                                    235 ;----------------------------------
                                    236 ; TIMER4 used as audio tone output 
                                    237 ; on port D:5.
                                    238 ; channel 1 configured as PWM mode 1 
                                    239 ;-----------------------------------  
                           00F424   240 TIM2_CLK_FREQ=62500
      008121                        241 timer2_init:
      008121 72 1A 50 C7      [ 1]  242 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008125 35 60 53 05      [ 1]  243  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008129 35 08 53 0C      [ 1]  244 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      00812D 81               [ 4]  245 	ret 
                                    246 
                                    247 ;---------------------------------
                                    248 ; TIM4 is configured to generate an 
                                    249 ; interrupt every millisecond 
                                    250 ;----------------------------------
      00812E                        251 timer4_init:
      00812E 72 18 50 C7      [ 1]  252 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008132 35 07 53 45      [ 1]  253 	mov TIM4_PSCR,#7 ; prescale 128  
      008136 35 7D 53 46      [ 1]  254 	mov TIM4_ARR,#125 ; set for 1msec.
      00813A 35 05 53 40      [ 1]  255 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00813E 72 10 53 41      [ 1]  256 	bset TIM4_IER,#TIM4_IER_UIE 
      008142 81               [ 4]  257 	ret
                                    258 
                                    259 
                                    260 ;----------------------------------
                                    261 ; unlock EEPROM for writing/erasing
                                    262 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    263 ; input:
                                    264 ;  none
                                    265 ; output:
                                    266 ;  none 
                                    267 ;----------------------------------
      008143                        268 unlock_eeprom:
      008143 35 AE 50 64      [ 1]  269 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008147 35 56 50 64      [ 1]  270     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00814B 72 07 50 5F FB   [ 2]  271 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008150 81               [ 4]  272 	ret
                                    273 
                                    274 ;----------------------------------
                                    275 ; unlock FLASH for writing/erasing
                                    276 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    277 ; input:
                                    278 ;  none
                                    279 ; output:
                                    280 ;  none
                                    281 ;----------------------------------
      008151                        282 unlock_flash:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      008151 35 56 50 62      [ 1]  283 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008155 35 AE 50 62      [ 1]  284 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008159 72 03 50 5F FB   [ 2]  285 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00815E 81               [ 4]  286 	ret
                                    287 
                           000000   288 	BLOCK_ERASE=0
                                    289 ;----------------------------
                                    290 ; erase block code must be 
                                    291 ;executed from RAM
                                    292 ;-----------------------------
                           000000   293 .if BLOCK_ERASE 
                                    294 ; this code is copied to RAM 
                                    295 erase_start:
                                    296 	clr a 
                                    297     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    298     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    299 	ldf [farptr],a
                                    300     inc farptr+2 
                                    301     ldf [farptr],a
                                    302     inc farptr+2 
                                    303     ldf [farptr],a
                                    304     inc farptr+2 
                                    305     ldf [farptr],a
                                    306 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    307 	ret
                                    308 erase_end:
                                    309 
                                    310 ; copy erase_start in RAM 
                                    311 move_code_in_ram:
                                    312 	ldw x,#erase_end 
                                    313 	subw x,#erase_start
                                    314 	ldw acc16,x 
                                    315 	ldw x,#pad 
                                    316 	ldw y,#erase_start 
                                    317 	call move 
                                    318 	ret 
                                    319 
                                    320 ;-----------------------------------
                                    321 ; erase flash or EEPROM block 
                                    322 ; a block is 128 bytes 
                                    323 ; input:
                                    324 ;   farptr  address block begin
                                    325 ; output:
                                    326 ;   none
                                    327 ;--------------------------------------
                                    328 erase_block:
                                    329 	ldw x,farptr+1 
                                    330 	pushw x 
                                    331 	call move_code_in_ram 
                                    332 	popw x 
                                    333 	ldw farptr+1,x 
                                    334 	tnz farptr
                                    335 	jrne erase_flash 
                                    336 	ldw x,#FLASH_BASE 
                                    337 	cpw x,farptr+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    338 	jrpl erase_flash 
                                    339 ; erase eeprom block
                                    340 	call unlock_eeprom 
                                    341 	sim 
                                    342 	call pad   
                                    343 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    344 	rim 
                                    345 	ret 
                                    346 ; erase flash block:
                                    347 erase_flash:
                                    348 	call unlock_flash 
                                    349 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    350 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    351 	clr a 
                                    352 	sim 
                                    353 	call pad 
                                    354     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    355 	rim 
                                    356 	ret 
                                    357 .endif ; BLOCK_ERASE 
                                    358 
                                    359 
                                    360 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    361 ; write a byte to FLASH or EEPROM 
                                    362 ; input:
                                    363 ;    a  		byte to write
                                    364 ;    farptr  	address
                                    365 ;    x          farptr[x]
                                    366 ; output:
                                    367 ;    none
                                    368 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    369 	; variables locales
                           000001   370 	BTW = 1   ; byte to write offset on stack
                           000002   371 	OPT = 2   ; OPTION flag offset on stack
                           000002   372 	VSIZE = 2
      00815F                        373 write_byte:
      00815F 90 89            [ 2]  374 	pushw y
      0000E1                        375 	_vars VSIZE
      008161 52 02            [ 2]    1     sub sp,#VSIZE 
      008163 6B 01            [ 1]  376 	ld (BTW,sp),a ; byte to write 
      008165 0F 02            [ 1]  377 	clr (OPT,sp)  ; OPTION flag
                                    378 ; put addr[15:0] in Y, for bounds check.
      008167 90 CE 00 14      [ 2]  379 	ldw y,farptr+1   ; Y=addr15:0
                                    380 ; check addr[23:16], if <> 0 then it is extened flash memory
      00816B 72 5D 00 13      [ 1]  381 	tnz farptr 
      00816F 26 14            [ 1]  382 	jrne write_flash
      008171 90 A3 A6 00      [ 2]  383     cpw y,#user_space
      008175 24 0E            [ 1]  384     jruge write_flash
      008177 90 A3 40 00      [ 2]  385 	cpw y,#EEPROM_BASE  
      00817B 25 52            [ 1]  386     jrult write_exit
      00817D 90 A3 48 7F      [ 2]  387 	cpw y,#OPTION_END 
      008181 22 4C            [ 1]  388 	jrugt write_exit
      008183 20 16            [ 2]  389 	jra write_eeprom 
                                    390 ; write program memory
      008185                        391 write_flash:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008185 CD 81 51         [ 4]  392 	call unlock_flash 
      008188 9B               [ 1]  393 1$:	sim 
      008189 7B 01            [ 1]  394 	ld a,(BTW,sp)
      00818B 92 A7 00 13      [ 4]  395 	ldf ([farptr],x),a ; farptr[x]=A
      00818F 72 05 50 5F FB   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008194 9A               [ 1]  397     rim 
      008195 72 13 50 5F      [ 1]  398     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008199 20 34            [ 2]  399     jra write_exit
                                    400 ; write eeprom and option
      00819B                        401 write_eeprom:
      00819B CD 81 43         [ 4]  402 	call unlock_eeprom
                                    403 	; check for data eeprom or option eeprom
      00819E 90 A3 48 00      [ 2]  404 	cpw y,#OPTION_BASE
      0081A2 2B 08            [ 1]  405 	jrmi 1$
      0081A4 90 A3 48 80      [ 2]  406 	cpw y,#OPTION_END+1
      0081A8 2A 02            [ 1]  407 	jrpl 1$
      0081AA 03 02            [ 1]  408 	cpl (OPT,sp)
      0081AC                        409 1$: 
      0081AC 0D 02            [ 1]  410     tnz (OPT,sp)
      0081AE 27 08            [ 1]  411     jreq 2$
                                    412 	; pour modifier une option il faut modifier ces 2 bits
      0081B0 72 1E 50 5B      [ 1]  413     bset FLASH_CR2,#FLASH_CR2_OPT
      0081B4 72 1F 50 5C      [ 1]  414     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081B8                        415 2$: 
      0081B8 7B 01            [ 1]  416     ld a,(BTW,sp)
      0081BA 92 A7 00 13      [ 4]  417     ldf ([farptr],x),a
      0081BE 0D 02            [ 1]  418     tnz (OPT,sp)
      0081C0 27 08            [ 1]  419     jreq 3$
      0081C2 5C               [ 2]  420     incw x
      0081C3 7B 01            [ 1]  421     ld a,(BTW,sp)
      0081C5 43               [ 1]  422     cpl a
      0081C6 92 A7 00 13      [ 4]  423     ldf ([farptr],x),a
      0081CA 72 05 50 5F FB   [ 2]  424 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081CF                        425 write_exit:
      00014F                        426 	_drop VSIZE 
      0081CF 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081D1 90 85            [ 2]  427 	popw y
      0081D3 81               [ 4]  428     ret
                                    429 
                                    430 ;--------------------------------------------
                                    431 ; write a data block to eeprom or flash 
                                    432 ; input:
                                    433 ;   Y        source address   
                                    434 ;   X        array index  destination  farptr[x]
                                    435 ;   BSIZE    block size bytes 
                                    436 ;   farptr   write address , byte* 
                                    437 ; output:
                                    438 ;	X 		after last byte written 
                                    439 ;   Y 		after last byte read 
                                    440 ;  farptr   point after block
                                    441 ;---------------------------------------------
      0081D4                        442 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000154                        443 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    444 	; local var 
                           000001   445 	XSAVE=1 
                           000002   446 	VSIZE=2 
      000154                        447 write_block:
      000154                        448 	_vars VSIZE
      0081D4 52 02            [ 2]    1     sub sp,#VSIZE 
      0081D6 1F 01            [ 2]  449 	ldw (XSAVE,sp),x 
      0081D8 1E 05            [ 2]  450 	ldw x,(BSIZE,sp) 
      0081DA 27 13            [ 1]  451 	jreq 9$
      0081DC 1E 01            [ 2]  452 1$:	ldw x,(XSAVE,sp)
      0081DE 90 F6            [ 1]  453 	ld a,(y)
      0081E0 CD 81 5F         [ 4]  454 	call write_byte 
      0081E3 5C               [ 2]  455 	incw x 
      0081E4 90 5C            [ 2]  456 	incw y 
      0081E6 1F 01            [ 2]  457 	ldw (XSAVE,sp),x
      0081E8 1E 05            [ 2]  458 	ldw x,(BSIZE,sp)
      0081EA 5A               [ 2]  459 	decw x
      0081EB 1F 05            [ 2]  460 	ldw (BSIZE,sp),x 
      0081ED 26 ED            [ 1]  461 	jrne 1$
      0081EF                        462 9$:
      0081EF 1E 01            [ 2]  463 	ldw x,(XSAVE,sp)
      0081F1 CD 9C 18         [ 4]  464 	call incr_farptr
      000174                        465 	_drop VSIZE
      0081F4 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081F6 81               [ 4]  466 	ret 
                                    467 
                                    468 
                                    469 ;---------------------------------------------
                                    470 ;   UART1 subroutines
                                    471 ;---------------------------------------------
                                    472 
                                    473 ;---------------------------------------------
                                    474 ; initialize UART1, 115200 8N1
                                    475 ; input:
                                    476 ;	none
                                    477 ; output:
                                    478 ;   none
                                    479 ;---------------------------------------------
      0081F7                        480 uart1_init:
      0081F7 72 1A 50 02      [ 1]  481     bset PA_DDR,#UART1_TX_PIN
      0081FB 72 1A 50 03      [ 1]  482     bset PA_CR1,#UART1_TX_PIN 
      0081FF 72 1A 50 04      [ 1]  483     bset PA_CR2,#UART1_TX_PIN 
                                    484 ; enable UART1 clock
      008203 72 14 50 C7      [ 1]  485 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008207                        486 uart1_set_baud: 
                                    487 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    488 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008207 A6 E1            [ 1]  489 	ld a,#CLK_SWR_HSI
      008209 C1 50 C3         [ 1]  490 	cp a,CLK_CMSR 
      00820C 27 0A            [ 1]  491 	jreq 2$ 
      00820E                        492 1$: ; 8 Mhz 	
      00820E 35 05 52 33      [ 1]  493 	mov UART1_BRR2,#0x05 ; must be loaded first
      008212 35 04 52 32      [ 1]  494 	mov UART1_BRR1,#0x4
      008216 20 08            [ 2]  495 	jra 3$
      008218                        496 2$: ; 16 Mhz 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      008218 35 0B 52 33      [ 1]  497 	mov UART1_BRR2,#0x0b ; must be loaded first
      00821C 35 08 52 32      [ 1]  498 	mov UART1_BRR1,#0x08
      008220                        499 3$:
      008220 72 5F 52 31      [ 1]  500     clr UART1_DR
      008224 35 0C 52 35      [ 1]  501 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
      008228 72 10 52 35      [ 1]  502 	bset UART1_CR2,#UART_CR2_SBK
      00822C 72 0D 52 30 FB   [ 2]  503     btjf UART1_SR,#UART_SR_TC,.
      008231 81               [ 4]  504     ret
                                    505 
                                    506 ;---------------------------------
                                    507 ; send character to UART1 
                                    508 ; input:
                                    509 ;   A 
                                    510 ; output:
                                    511 ;   none 
                                    512 ;--------------------------------	
      008232                        513 putc:
      008232 72 0F 52 30 FB   [ 2]  514 	btjf UART1_SR,#UART_SR_TXE,.
      008237 C7 52 31         [ 1]  515 	ld UART1_DR,a 
      00823A 81               [ 4]  516 	ret 
                                    517 
                                    518 ;---------------------------------
                                    519 ; wait character from UART1 
                                    520 ; input:
                                    521 ;   none
                                    522 ; output:
                                    523 ;   A 			char  
                                    524 ;--------------------------------	
      00823B                        525 getc:
      00823B 72 0B 52 30 FB   [ 2]  526 	btjf UART1_SR,#UART_SR_RXNE,.
      008240 C6 52 31         [ 1]  527 	ld a,UART1_DR 
      008243 81               [ 4]  528 	ret 
                                    529 
                                    530 ;-----------------------------
                                    531 ; send an ASCIZ string to UART1 
                                    532 ; input: 
                                    533 ;   x 		char * 
                                    534 ; output:
                                    535 ;   none 
                                    536 ;-------------------------------
      008244                        537 puts:
      008244 F6               [ 1]  538     ld a,(x)
      008245 27 06            [ 1]  539 	jreq 1$
      008247 CD 82 32         [ 4]  540 	call putc 
      00824A 5C               [ 2]  541 	incw x 
      00824B 20 F7            [ 2]  542 	jra puts 
      00824D 81               [ 4]  543 1$:	ret 
                                    544 
                                    545 
                                    546 ;---------------------------
                                    547 ; delete character at left 
                                    548 ; of cursor on terminal 
                                    549 ; input:
                                    550 ;   none 
                                    551 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    552 ;	none 
                                    553 ;---------------------------
      00824E                        554 bksp:
      00824E A6 08            [ 1]  555 	ld a,#BSP 
      008250 CD 82 32         [ 4]  556 	call putc 
      008253 A6 20            [ 1]  557 	ld a,#SPACE 
      008255 CD 82 32         [ 4]  558 	call putc 
      008258 A6 08            [ 1]  559 	ld a,#BSP 
      00825A CD 82 32         [ 4]  560 	call putc 
      00825D 81               [ 4]  561 	ret 
                                    562 ;---------------------------
                                    563 ; delete n character left of cursor 
                                    564 ; at terminal.
                                    565 ; input: 
                                    566 ;   A   	number of characters to delete.
                                    567 ; output:
                                    568 ;    none 
                                    569 ;--------------------------	
      00825E                        570 delete:
      00825E 88               [ 1]  571 	push a 
      00825F 0D 01            [ 1]  572 0$:	tnz (1,sp)
      008261 27 07            [ 1]  573 	jreq 1$
      008263 CD 82 4E         [ 4]  574 	call bksp 
      008266 0A 01            [ 1]  575 	dec (1,sp)
      008268 20 F5            [ 2]  576 	jra 0$
      00826A 84               [ 1]  577 1$:	pop a 
      00826B 81               [ 4]  578 	ret
                                    579 
                                    580 ;--------------------------
                                    581 ; print n spaces on terminal
                                    582 ; input:
                                    583 ;  X 		number of spaces 
                                    584 ; output:
                                    585 ;	none 
                                    586 ;---------------------------
      00826C                        587 spaces:
      00826C A6 20            [ 1]  588 	ld a,#SPACE 
      00826E 5D               [ 2]  589 1$:	tnzw x
      00826F 27 06            [ 1]  590 	jreq 9$
      008271 CD 82 32         [ 4]  591 	call putc 
      008274 5A               [ 2]  592 	decw x
      008275 20 F7            [ 2]  593 	jra 1$
      008277                        594 9$: 
      008277 81               [ 4]  595 	ret 
                                    596 
                           000001   597 .if DEBUG 
                                    598 ;---------------------------------
                                    599 ;; print actual registers states 
                                    600 ;; as pushed on stack 
                                    601 ;; {Y,X,CC,A}
                                    602 ;---------------------------------
      008278                        603 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0001F8                        604 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0001F8                        605 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0001F8                        606 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0001F8                        607 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0001F8                        608 prt_regs:
      008278 AE 82 BB         [ 2]  609 	ldw x,#regs_state 
      00827B CD 82 44         [ 4]  610 	call puts
                                    611 ; register PC
      00827E 16 01            [ 2]  612 	ldw y,(1,sp)
      008280 AE 89 FC         [ 2]  613 	ldw x,#REG_EPC 
      008283 CD 89 4D         [ 4]  614 	call prt_reg16 
                                    615 ; register CC 
      008286 7B 08            [ 1]  616 	ld a,(R_CC,sp)
      008288 AE 8A 0D         [ 2]  617 	ldw x,#REG_CC 
      00828B CD 89 28         [ 4]  618 	call prt_reg8 
                                    619 ; register A 
      00828E 7B 07            [ 1]  620 	ld a,(R_A,sp)
      008290 AE 8A 09         [ 2]  621 	ldw x,#REG_A 
      008293 CD 89 28         [ 4]  622 	call prt_reg8 
                                    623 ; register X 
      008296 16 05            [ 2]  624 	ldw y,(R_X,sp)
      008298 AE 8A 05         [ 2]  625 	ldw x,#REG_X 
      00829B CD 89 4D         [ 4]  626 	call prt_reg16 
                                    627 ; register Y 
      00829E 16 03            [ 2]  628 	ldw y,(R_Y,sp)
      0082A0 AE 8A 01         [ 2]  629 	ldw x,#REG_Y 
      0082A3 CD 89 4D         [ 4]  630 	call prt_reg16 
                                    631 ; register SP 
      0082A6 90 96            [ 1]  632 	ldw y,sp
      0082A8 72 A9 00 08      [ 2]  633 	addw y,#6+ARG_OFS  
      0082AC AE 8A 12         [ 2]  634 	ldw x,#REG_SP
      0082AF CD 89 4D         [ 4]  635 	call prt_reg16
      0082B2 A6 0D            [ 1]  636 	ld a,#CR 
      0082B4 CD 82 32         [ 4]  637 	call putc
      0082B7 CD 82 32         [ 4]  638 	call putc   
      0082BA 81               [ 4]  639 	ret 
                                    640 
      0082BB 0A 72 65 67 69 73 74   641 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    642 
                                    643 
                                    644 ;--------------------
                                    645 ; print content at address in hex.
                                    646 ; input:
                                    647 ;   X 	address to peek 
                                    648 ; output:
                                    649 ;	none 
                                    650 ;--------------------	
      0082E2                        651 prt_peek:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082E2 89               [ 2]  652 	pushw x 
      0082E3 CF 00 09         [ 2]  653 	ldw acc16,x 
      0082E6 72 5F 00 08      [ 1]  654 	clr acc24 
      0082EA 5F               [ 1]  655 	clrw x 
      0082EB A6 10            [ 1]  656 	ld a,#16 
      0082ED CD 8A 17         [ 4]  657 	call prti24 
      0082F0 A6 3A            [ 1]  658 	ld a,#': 
      0082F2 CD 82 32         [ 4]  659 	call putc 
      0082F5 A6 20            [ 1]  660 	ld a,#SPACE 
      0082F7 CD 82 32         [ 4]  661 	call putc 
      0082FA 85               [ 2]  662 	popw x 
      0082FB F6               [ 1]  663 	ld a,(x)
      0082FC C7 00 0A         [ 1]  664 	ld acc8,a 
      0082FF 5F               [ 1]  665 	clrw x 
      008300 A6 10            [ 1]  666 	ld a,#16 
      008302 CD 8A 17         [ 4]  667 	call prti24
      008305 81               [ 4]  668 	ret 
                                    669 .endif ; DEBUG  
                                    670 
                                    671 ;-------------------------------------
                                    672 ; retrun string length
                                    673 ; input:
                                    674 ;   X         .asciz  
                                    675 ; output:
                                    676 ;   X         length 
                                    677 ;-------------------------------------
      008306                        678 strlen:
      008306 90 93            [ 1]  679 	ldw y,x 
      008308 5F               [ 1]  680 	clrw x 
      008309 90 7D            [ 1]  681 1$:	tnz (y) 
      00830B 27 05            [ 1]  682 	jreq 9$ 
      00830D 5C               [ 2]  683 	incw x
      00830E 90 5C            [ 2]  684 	incw y 
      008310 20 F7            [ 2]  685 	jra 1$ 
      008312 81               [ 4]  686 9$: ret 
                                    687 
                                    688 ;------------------------------------
                                    689 ; compare 2 strings
                                    690 ; input:
                                    691 ;   X 		char* first string 
                                    692 ;   Y       char* second string 
                                    693 ; output:
                                    694 ;   A 		0|1 
                                    695 ;-------------------------------------
      008313                        696 strcmp:
      008313 F6               [ 1]  697 	ld a,(x)
      008314 27 0B            [ 1]  698 	jreq 5$ 
      008316 90 F1            [ 1]  699 	cp a,(y) 
      008318 26 05            [ 1]  700 	jrne 4$ 
      00831A 5C               [ 2]  701 	incw x 
      00831B 90 5C            [ 2]  702 	incw y 
      00831D 20 F4            [ 2]  703 	jra strcmp 
      00831F                        704 4$: ; not same  
      00831F 4F               [ 1]  705 	clr a 
      008320 81               [ 4]  706 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008321                        707 5$: ; same 
      008321 A6 01            [ 1]  708 	ld a,#1 
      008323 81               [ 4]  709 	ret 
                                    710 
                                    711 
                                    712 ;---------------------------------------
                                    713 ;  copy src to dest 
                                    714 ; input:
                                    715 ;   X 		dest 
                                    716 ;   Y 		src 
                                    717 ; output: 
                                    718 ;   X 		dest 
                                    719 ;----------------------------------
      008324                        720 strcpy:
      008324 89               [ 2]  721 	pushw x 
      008325 90 F6            [ 1]  722 1$: ld a,(y)
      008327 27 06            [ 1]  723 	jreq 9$ 
      008329 F7               [ 1]  724 	ld (x),a 
      00832A 5C               [ 2]  725 	incw x 
      00832B 90 5C            [ 2]  726 	incw y 
      00832D 20 F6            [ 2]  727 	jra 1$ 
      00832F 7F               [ 1]  728 9$:	clr (x)
      008330 85               [ 2]  729 	popw x 
      008331 81               [ 4]  730 	ret 
                                    731 
                                    732 ;---------------------------------------
                                    733 ; move memory block 
                                    734 ; input:
                                    735 ;   X 		destination 
                                    736 ;   Y 	    source 
                                    737 ;   acc16	size 
                                    738 ; output:
                                    739 ;   none 
                                    740 ;--------------------------------------
                           000001   741 	INCR=1 ; increament high byte 
                           000002   742 	LB=2 ; increament low byte 
                           000002   743 	VSIZE=2
      008332                        744 move:
      0002B2                        745 	_vars VSIZE 
      008332 52 02            [ 2]    1     sub sp,#VSIZE 
      008334 0F 01            [ 1]  746 	clr (INCR,sp)
      008336 0F 02            [ 1]  747 	clr (LB,sp)
      008338 90 89            [ 2]  748 	pushw y 
      00833A 13 01            [ 2]  749 	cpw x,(1,sp) ; compare DEST to SRC 
      00833C 90 85            [ 2]  750 	popw y 
      00833E 27 31            [ 1]  751 	jreq move_exit ; x==y 
      008340 2B 0E            [ 1]  752 	jrmi move_down
      008342                        753 move_up: ; start from top address with incr=-1
      008342 72 BB 00 09      [ 2]  754 	addw x,acc16
      008346 72 B9 00 09      [ 2]  755 	addw y,acc16
      00834A 03 01            [ 1]  756 	cpl (INCR,sp)
      00834C 03 02            [ 1]  757 	cpl (LB,sp)   ; increment = -1 
      00834E 20 05            [ 2]  758 	jra move_loop  
      008350                        759 move_down: ; start from bottom address with incr=1 
      008350 5A               [ 2]  760     decw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008351 90 5A            [ 2]  761 	decw y
      008353 0C 02            [ 1]  762 	inc (LB,sp) ; incr=1 
      008355                        763 move_loop:	
      008355 C6 00 09         [ 1]  764     ld a, acc16 
      008358 CA 00 0A         [ 1]  765 	or a, acc8
      00835B 27 14            [ 1]  766 	jreq move_exit 
      00835D 72 FB 01         [ 2]  767 	addw x,(INCR,sp)
      008360 72 F9 01         [ 2]  768 	addw y,(INCR,sp) 
      008363 90 F6            [ 1]  769 	ld a,(y)
      008365 F7               [ 1]  770 	ld (x),a 
      008366 89               [ 2]  771 	pushw x 
      008367 CE 00 09         [ 2]  772 	ldw x,acc16 
      00836A 5A               [ 2]  773 	decw x 
      00836B CF 00 09         [ 2]  774 	ldw acc16,x 
      00836E 85               [ 2]  775 	popw x 
      00836F 20 E4            [ 2]  776 	jra move_loop
      008371                        777 move_exit:
      0002F1                        778 	_drop VSIZE
      008371 5B 02            [ 2]    1     addw sp,#VSIZE 
      008373 81               [ 4]  779 	ret 	
                                    780 
                                    781 ;-------------------------------------
                                    782 ; search text area for a line with 
                                    783 ; same number as line#  
                                    784 ; input:
                                    785 ;	X 			line# 
                                    786 ; output:
                                    787 ;   X 			addr of line | 0 
                                    788 ;   Y           line#|insert address if not found  
                                    789 ;-------------------------------------
                           000001   790 	LL=1 ; line length 
                           000002   791 	LB=2 ; line length low byte 
                           000002   792 	VSIZE=2 
      008374                        793 search_lineno:
      0002F4                        794 	_vars VSIZE
      008374 52 02            [ 2]    1     sub sp,#VSIZE 
      008376 0F 01            [ 1]  795 	clr (LL,sp)
      008378 90 CE 00 1B      [ 2]  796 	ldw y,txtbgn
      00837C                        797 search_ln_loop:
      00837C 90 C3 00 1D      [ 2]  798 	cpw y,txtend 
      008380 2A 10            [ 1]  799 	jrpl 8$
      008382 90 F3            [ 1]  800 	cpw x,(y)
      008384 27 0E            [ 1]  801 	jreq 9$
      008386 2B 0A            [ 1]  802 	jrmi 8$ 
      008388 90 E6 02         [ 1]  803 	ld a,(2,y)
      00838B 6B 02            [ 1]  804 	ld (LB,sp),a 
      00838D 72 F9 01         [ 2]  805 	addw y,(LL,sp)
      008390 20 EA            [ 2]  806 	jra search_ln_loop 
      008392                        807 8$: 
      008392 5F               [ 1]  808 	clrw x 	
      008393 51               [ 1]  809 	exgw x,y 
      000314                        810 9$: _drop VSIZE
      008394 5B 02            [ 2]    1     addw sp,#VSIZE 
      008396 51               [ 1]  811 	exgw x,y   
      008397 81               [ 4]  812 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    813 
                                    814 ;-------------------------------------
                                    815 ; delete line at addr
                                    816 ; move new line to insert with end of text 
                                    817 ; otherwise it would be overwritten.
                                    818 ; input:
                                    819 ;   X 		addr of line i.e DEST for move 
                                    820 ;-------------------------------------
                           000001   821 	LLEN=1
                           000003   822 	SRC=3
                           000004   823 	VSIZE=4
      008398                        824 del_line: 
      000318                        825 	_vars VSIZE 
      008398 52 04            [ 2]    1     sub sp,#VSIZE 
      00839A E6 02            [ 1]  826 	ld a,(2,x) ; line length
      00839C 6B 02            [ 1]  827 	ld (LLEN+1,sp),a 
      00839E 0F 01            [ 1]  828 	clr (LLEN,sp)
      0083A0 90 93            [ 1]  829 	ldw y,x  
      0083A2 72 F9 01         [ 2]  830 	addw y,(LLEN,sp) ;SRC  
      0083A5 17 03            [ 2]  831 	ldw (SRC,sp),y  ;save source 
      0083A7 90 CE 00 1D      [ 2]  832 	ldw y,txtend 
      0083AB 90 E6 02         [ 1]  833 	ld a,(2,y)
      0083AE 90 5F            [ 1]  834 	clrw y 
      0083B0 90 97            [ 1]  835 	ld yl,a  
      0083B2 72 B9 00 1D      [ 2]  836 	addw y,txtend
      0083B6 72 F2 03         [ 2]  837 	subw y,(SRC,sp) ; y=count 
      0083B9 90 CF 00 09      [ 2]  838 	ldw acc16,y 
      0083BD 16 03            [ 2]  839 	ldw y,(SRC,sp)    ; source
      0083BF CD 83 32         [ 4]  840 	call move
      0083C2 90 CE 00 1D      [ 2]  841 	ldw y,txtend 
      0083C6 72 F2 01         [ 2]  842 	subw y,(LLEN,sp)
      0083C9 90 CF 00 1D      [ 2]  843 	ldw txtend,y  
      00034D                        844 	_drop VSIZE     
      0083CD 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083CF 81               [ 4]  845 	ret 
                                    846 
                                    847 ;---------------------------------------------
                                    848 ; create a gap in text area 
                                    849 ; move new line to insert in gap with end of text
                                    850 ; otherwise it would be overwritten.
                                    851 ; input:
                                    852 ;    X 			addr gap start 
                                    853 ;    Y 			gap length 
                                    854 ; output:
                                    855 ;    X 			addr gap start 
                                    856 ;--------------------------------------------
                           000001   857 	DEST=1
                           000003   858 	SRC=3
                           000005   859 	LEN=5
                           000006   860 	VSIZE=6 
      0083D0                        861 create_gap:
      000350                        862 	_vars VSIZE
      0083D0 52 06            [ 2]    1     sub sp,#VSIZE 
      0083D2 1F 03            [ 2]  863 	ldw (SRC,sp),x 
      0083D4 17 05            [ 2]  864 	ldw (LEN,sp),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0083D6 90 CF 00 09      [ 2]  865 	ldw acc16,y 
      0083DA 90 93            [ 1]  866 	ldw y,x ; SRC
      0083DC 72 BB 00 09      [ 2]  867 	addw x,acc16  
      0083E0 1F 01            [ 2]  868 	ldw (DEST,sp),x 
                                    869 ;compute size to move 	
      0083E2 CE 00 1D         [ 2]  870 	ldw x,txtend 
      0083E5 E6 02            [ 1]  871 	ld a,(2,x) ; pending line length 
      0083E7 C7 00 0A         [ 1]  872 	ld acc8,a 
      0083EA 72 5F 00 09      [ 1]  873 	clr acc16 
      0083EE 72 BB 00 09      [ 2]  874 	addw x,acc16 
      0083F2 72 F0 03         [ 2]  875 	subw x,(SRC,sp)
      0083F5 CF 00 09         [ 2]  876 	ldw acc16,x ; size to move
      0083F8 1E 01            [ 2]  877 	ldw x,(DEST,sp) 
      0083FA CD 83 32         [ 4]  878 	call move
      0083FD CE 00 1D         [ 2]  879 	ldw x,txtend
      008400 72 FB 05         [ 2]  880 	addw x,(LEN,sp)
      008403 CF 00 1D         [ 2]  881 	ldw txtend,x
      000386                        882 9$:	_drop VSIZE 
      008406 5B 06            [ 2]    1     addw sp,#VSIZE 
      008408 81               [ 4]  883 	ret 
                                    884 
                                    885 
                                    886 ;--------------------------------------------
                                    887 ; insert line in tib into text area 
                                    888 ; first search for already existing 
                                    889 ; replace existing 
                                    890 ; if strlen(tib)==0 delete existing 
                                    891 ; input:
                                    892 ;   ptr16 				pointer to tokenized line  
                                    893 ; output:
                                    894 ;   none
                                    895 ;---------------------------------------------
                           000001   896 	DEST=1  ; text area insertion address 
                           000003   897 	SRC=3   ; str to insert address 
                           000005   898 	LINENO=5 ; line number 
                           000007   899 	LLEN=7 ; line length 
                           000008   900 	VSIZE=8  
      008409                        901 insert_line:
      000389                        902 	_vars VSIZE 
      008409 52 08            [ 2]    1     sub sp,#VSIZE 
      00840B CE 00 14         [ 2]  903 	ldw x,ptr16  
      00840E C3 00 1B         [ 2]  904 	cpw x,txtbgn 
      008411 26 0D            [ 1]  905 	jrne 0$
                                    906 ;first text line 
      008413 AE 00 02         [ 2]  907 	ldw x,#2 
      008416 72 D6 00 14      [ 4]  908 	ld a,([ptr16],x)
      00841A 5F               [ 1]  909 	clrw x 
      00841B 97               [ 1]  910 	ld xl,a
      00841C 1F 07            [ 2]  911 	ldw (LLEN,sp),x  
      00841E 20 45            [ 2]  912 	jra 5$
      008420 72 CE 00 14      [ 5]  913 0$:	ldw x,[ptr16]
                                    914 ; new line number
      008424 1F 05            [ 2]  915 	ldw (LINENO,sp),x 
      008426 AE 00 02         [ 2]  916 	ldw x,#2 
      008429 72 D6 00 14      [ 4]  917 	ld a,([ptr16],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      00842D 97               [ 1]  918 	ld xl,a
                                    919 ; new line length
      00842E 1F 07            [ 2]  920 	ldw (LLEN,sp),x
                                    921 ; check if that line number already exit 	
      008430 1E 05            [ 2]  922 	ldw x,(LINENO,sp)
      008432 CD 83 74         [ 4]  923 	call search_lineno 
      008435 5D               [ 2]  924 	tnzw x 
      008436 26 04            [ 1]  925 	jrne 2$
                                    926 ; line doesn't exit
                                    927 ; it will be inserted at this point.  	
      008438 17 01            [ 2]  928 	ldw (DEST,sp),y 
      00843A 20 05            [ 2]  929 	jra 3$
                                    930 ; line exit delete it.
                                    931 ; it will be replaced by new one 	
      00843C 1F 01            [ 2]  932 2$: ldw (DEST,sp),x 
      00843E CD 83 98         [ 4]  933 	call del_line
      008441                        934 3$: 
                                    935 ; insert new line or leave if LLEN==3
                                    936 ; LLEN==3 means empty line 
      008441 A6 03            [ 1]  937 	ld a,#3
      008443 11 08            [ 1]  938 	cp a,(LLEN+1,sp)
      008445 27 27            [ 1]  939 	jreq insert_ln_exit ; empty line exit.
                                    940 ; if insertion point at txtend 
                                    941 ; no move required 
      008447 1E 01            [ 2]  942 	ldw x,(DEST,sp)
      008449 C3 00 1D         [ 2]  943 	cpw x,txtend 
      00844C 2A 17            [ 1]  944 	jrpl 5$ 
                                    945 ; must create a gap
                                    946 ; at insertion point  
      00844E 1E 01            [ 2]  947 	ldw x,(DEST,sp)
      008450 16 07            [ 2]  948 	ldw y,(LLEN,sp)
      008452 CD 83 D0         [ 4]  949 	call create_gap 
                                    950 ; move new line in gap 
      008455 1E 07            [ 2]  951 	ldw x,(LLEN,sp)
      008457 CF 00 09         [ 2]  952 	ldw acc16,x 
      00845A 90 CE 00 1D      [ 2]  953 	ldw y,txtend ;SRC 
      00845E 1E 01            [ 2]  954 	ldw x,(DEST,sp) ; dest address 
      008460 CD 83 32         [ 4]  955 	call move 
      008463 20 09            [ 2]  956 	jra insert_ln_exit  
      008465                        957 5$: ; no move required 
      008465 1E 07            [ 2]  958 	ldw x,(LLEN,sp) 
      008467 72 BB 00 1D      [ 2]  959 	addw x,txtend 
      00846B CF 00 1D         [ 2]  960 	ldw txtend,x 
      00846E                        961 insert_ln_exit:	
      0003EE                        962 	_drop VSIZE
      00846E 5B 08            [ 2]    1     addw sp,#VSIZE 
      008470 81               [ 4]  963 	ret
                                    964 
                                    965 
                                    966 ;-----------------------------
                                    967 ; check if text buffer full
                                    968 ; input:
                                    969 ;   ptr16     addr start tokenize line 
                                    970 ;   X         buffer index 
                                    971 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    972 ;   none 
                                    973 ;-----------------------------------
      008471                        974 check_full:
      008471 72 BB 00 14      [ 2]  975 	addw x,ptr16 
      008475 A3 16 C8         [ 2]  976 	cpw x,#tib 
      008478 25 05            [ 1]  977 	jrult 1$
      00847A A6 01            [ 1]  978 	ld a,#ERR_MEM_FULL
      00847C CC 88 01         [ 2]  979 	jp tb_error 
      00847F 81               [ 4]  980 1$: ret 
                                    981 
                                    982 
                                    983 ;-----------------------------------
                                    984 ; create token list form text line 
                                    985 ; save this list in text area
                                    986 ; input:
                                    987 ;   none
                                    988 ; output:
                                    989 ;   basicptr     token list buffer
                                    990 ;   line# 		 BASIC line number 
                                    991 ;   in.w  		 cleared 
                                    992 ;-----------------------------------
                                    993 	.macro _incr_ptr16 n 
                                    994 	ldw x,#n 
                                    995 	addw x,ptr16 
                                    996 	ldw ptr16,x 
                                    997 	.endm 
                                    998 
                           000001   999 	XSAVE=1
                           000003  1000 	BUFIDX=3
                           000004  1001 	VSIZE=4
      008480                       1002 compile:
      000400                       1003 	_vars VSIZE 
      008480 52 04            [ 2]    1     sub sp,#VSIZE 
      008482 72 1A 00 22      [ 1] 1004 	bset flags,#FCOMP 
      008486 CE 00 1D         [ 2] 1005 	ldw x,txtend
      008489 CF 00 14         [ 2] 1006 	ldw ptr16,x 
      00848C 5F               [ 1] 1007 	clrw x 
      00848D AE 00 03         [ 2] 1008 	ldw x,#3
      008490 1F 03            [ 2] 1009 	ldw (BUFIDX,sp),X  
      008492 CD 84 71         [ 4] 1010 	call check_full
      008495 5F               [ 1] 1011 	clrw x 
      008496 72 CF 00 14      [ 5] 1012 	ldw [ptr16],x 
      00849A CD 8D C6         [ 4] 1013 	call get_token
      00849D 1F 01            [ 2] 1014 	ldw (XSAVE,sp),x 
      00849F A1 04            [ 1] 1015 	cp a,#TK_INTGR 
      0084A1 26 11            [ 1] 1016 	jrne 3$
      0084A3 A3 00 00         [ 2] 1017 	cpw x,#0  
      0084A6 22 03            [ 1] 1018 	jrugt 1$
      0084A8 CC 87 FF         [ 2] 1019 	jp syntax_error 
      0084AB 72 CF 00 14      [ 5] 1020 1$:	ldw [ptr16],x; line number
      0084AF CD 8D C6         [ 4] 1021 2$:	call get_token
      0084B2 1F 01            [ 2] 1022 	ldw (XSAVE,sp),x 
      0084B4 A1 00            [ 1] 1023 3$:	cp a,#TK_NONE 
      0084B6 26 03            [ 1] 1024 	jrne 30$
      0084B8 CC 85 4B         [ 2] 1025 	jp 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084BB                       1026 30$: 	 
      0084BB 1E 03            [ 2] 1027 	ldw x,(BUFIDX,sp)
      0084BD CD 84 71         [ 4] 1028 	call check_full 
      0084C0 16 03            [ 2] 1029 	ldw y,(BUFIDX,sp) 
      0084C2 91 D7 14         [ 4] 1030 	ld ([ptr16],y),a ; token attribute 
      0084C5 90 5C            [ 2] 1031 	incw y
      0084C7 17 03            [ 2] 1032 	ldw (BUFIDX,sp),y
      0084C9 A1 01            [ 1] 1033 	cp a,#TK_COLON 
      0084CB 26 02            [ 1] 1034 	jrne 31$
      0084CD 20 E0            [ 2] 1035 	jra 2$ 
      0084CF                       1036 31$:
      0084CF A1 03            [ 1] 1037 	cp a,#TK_CHAR
      0084D1 26 0C            [ 1] 1038 	jrne 32$ 
      0084D3 1E 01            [ 2] 1039 	ldw x,(XSAVE,sp)
      0084D5 9F               [ 1] 1040 	ld a,xl 
      0084D6 91 D7 14         [ 4] 1041 	ld ([ptr16],y),a
      0084D9 90 5C            [ 2] 1042 	incw y 
      0084DB 17 03            [ 2] 1043 	ldw (BUFIDX,sp),y 
      0084DD 20 D0            [ 2] 1044 	jra 2$ 
      0084DF                       1045 32$:
      0084DF A1 02            [ 1] 1046 	cp a,#TK_ARRAY 
      0084E1 27 CC            [ 1] 1047 	jreq 2$ 
      0084E3 A1 0A            [ 1] 1048 	cp a,#TK_QSTR 
      0084E5 26 25            [ 1] 1049 	jrne 4$
      0084E7 AE 17 18         [ 2] 1050 	ldw x,#pad 
      0084EA CD 83 06         [ 4] 1051 	call strlen
      0084ED 5C               [ 2] 1052 	incw x  
      0084EE CD 84 71         [ 4] 1053 	call check_full 
      0084F1 90 AE 17 18      [ 2] 1054 	ldw y,#pad 
      0084F5 CE 00 14         [ 2] 1055 	ldw x,ptr16
      0084F8 72 FB 03         [ 2] 1056 	addw x,(BUFIDX,sp)	
      0084FB CD 83 24         [ 4] 1057 	call strcpy 
      0084FE AE 17 18         [ 2] 1058 	ldw x,#pad 
      008501 CD 83 06         [ 4] 1059 	call strlen 
      008504 5C               [ 2] 1060 	incw x
      008505 72 FB 03         [ 2] 1061 	addw x,(BUFIDX,sp) 
      008508 1F 03            [ 2] 1062 	ldw (BUFIDX,sp),x
      00850A 20 A3            [ 2] 1063 	jra 2$  
      00850C A1 04            [ 1] 1064 4$: cp a,#TK_INTGR
      00850E 25 9F            [ 1] 1065 	jrult 2$
      008510 A1 09            [ 1] 1066 	cp a,#TK_CONST 
      008512 22 9B            [ 1] 1067 	Jrugt 2$
      008514 1E 01            [ 2] 1068 	ldw x,(XSAVE,sp) 
      008516 16 03            [ 2] 1069 	ldw y,(BUFIDX,sp)
      008518 91 DF 14         [ 5] 1070 	ldw ([ptr16],y),x
      00851B A3 97 DB         [ 2] 1071 	cpw x,#rem 
      00851E 26 22            [ 1] 1072 	jrne 5$	
                                   1073 ; comment advance in.w to eol 
      008520 72 A9 00 02      [ 2] 1074 	addw y,#2 ; skip exec address 
      008524 17 03            [ 2] 1075 	ldw (BUFIDX,sp),y 
      008526 CE 00 14         [ 2] 1076 	ldw x,ptr16 
      008529 72 FB 03         [ 2] 1077 	addw x,(BUFIDX,sp)
      00852C 90 CE 00 01      [ 2] 1078 	ldw y,in.w 
      008530 72 A9 16 C8      [ 2] 1079 	addw y,#tib 
      008534 CD 83 24         [ 4] 1080 	call strcpy 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008537 CD 83 06         [ 4] 1081 	call strlen 
      00853A 5C               [ 2] 1082 	incw x ; skip string 0. 
      00853B 72 FB 03         [ 2] 1083 	addw x,(BUFIDX,sp)
      00853E 1F 03            [ 2] 1084 	ldw (BUFIDX,sp),x 
      008540 20 09            [ 2] 1085 	jra 9$
      008542 72 A9 00 02      [ 2] 1086 5$:	addw y,#2 
      008546 17 03            [ 2] 1087 	ldw (BUFIDX,sp),y 
      008548 CC 84 AF         [ 2] 1088 	jp 2$
      00854B                       1089 9$: 
      00854B AE 00 02         [ 2] 1090 	ldw x,#2
      00854E 16 03            [ 2] 1091 	ldw y,(BUFIDX,sp)
      008550 90 9F            [ 1] 1092 	ld a,yl 
      008552 72 D7 00 14      [ 4] 1093 	ld ([ptr16],x),a  	
      008556 72 CE 00 14      [ 5] 1094 	ldw x,[ptr16]
      00855A 27 09            [ 1] 1095 	jreq 10$
      00855C CD 84 09         [ 4] 1096 	call insert_line
      00855F 72 5F 00 04      [ 1] 1097 	clr  count 
      008563 20 0F            [ 2] 1098 	jra  11$ 
      008565                       1099 10$: 
      008565 CE 00 14         [ 2] 1100 	ldw x,ptr16 
      008568 CF 00 05         [ 2] 1101 	ldw basicptr,x 
      00856B E6 02            [ 1] 1102 	ld a,(2,x)
      00856D C7 00 04         [ 1] 1103 	ld count,a 
      008570 35 03 00 02      [ 1] 1104 	mov in,#3 
      008574                       1105 11$:
      0004F4                       1106 	_drop VSIZE 
      008574 5B 04            [ 2]    1     addw sp,#VSIZE 
      008576 72 1B 00 22      [ 1] 1107 	bres flags,#FCOMP 
      00857A 81               [ 4] 1108 	ret 
                                   1109 
                                   1110 
                                   1111 ;------------------------------------
                                   1112 ;  set all variables to zero 
                                   1113 ; input:
                                   1114 ;   none 
                                   1115 ; output:
                                   1116 ;	none
                                   1117 ;------------------------------------
      00857B                       1118 clear_vars:
      00857B AE 00 24         [ 2] 1119 	ldw x,#vars 
      00857E 90 AE 00 34      [ 2] 1120 	ldw y,#2*26 
      008582 7F               [ 1] 1121 1$:	clr (x)
      008583 5C               [ 2] 1122 	incw x 
      008584 90 5A            [ 2] 1123 	decw y 
      008586 26 FA            [ 1] 1124 	jrne 1$
      008588 81               [ 4] 1125 	ret 
                                   1126 
                                   1127 ;-------------------------------------
                                   1128 ; check if A is a letter
                                   1129 ; input:
                                   1130 ;   A 			character to test 
                                   1131 ; output:
                                   1132 ;   C flag      1 true, 0 false 
                                   1133 ;-------------------------------------
      008589                       1134 is_alpha:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      008589 A1 41            [ 1] 1135 	cp a,#'A 
      00858B 8C               [ 1] 1136 	ccf
      00858C 24 0B            [ 1] 1137 	jrnc 9$ 
      00858E A1 5B            [ 1] 1138 	cp a,#'Z+1 
      008590 25 07            [ 1] 1139 	jrc 9$ 
      008592 A1 61            [ 1] 1140 	cp a,#'a 
      008594 8C               [ 1] 1141 	ccf 
      008595 24 02            [ 1] 1142 	jrnc 9$
      008597 A1 7B            [ 1] 1143 	cp a,#'z+1   
      008599 81               [ 4] 1144 9$: ret 	
                                   1145 
                                   1146 ;-------------------------------------
                                   1147 ;  program initialization entry point 
                                   1148 ;-------------------------------------
                           000001  1149 	MAJOR=1
                           000000  1150 	MINOR=0
      00859A 0A 0A 54 69 6E 79 20  1151 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0085E0                       1152 cold_start:
                                   1153 ;set stack 
      0085E0 AE 17 FF         [ 2] 1154 	ldw x,#STACK_EMPTY
      0085E3 94               [ 1] 1155 	ldw sp,x   
                                   1156 ; clear all ram 
      0085E4 7F               [ 1] 1157 0$: clr (x)
      0085E5 5A               [ 2] 1158 	decw x 
      0085E6 26 FC            [ 1] 1159 	jrne 0$
                                   1160 ; activate pull up on all inputs 
      0085E8 A6 FF            [ 1] 1161 	ld a,#255 
      0085EA C7 50 03         [ 1] 1162 	ld PA_CR1,a 
      0085ED C7 50 08         [ 1] 1163 	ld PB_CR1,a 
      0085F0 C7 50 0D         [ 1] 1164 	ld PC_CR1,a 
      0085F3 C7 50 12         [ 1] 1165 	ld PD_CR1,a 
      0085F6 C7 50 17         [ 1] 1166 	ld PE_CR1,a 
      0085F9 C7 50 1C         [ 1] 1167 	ld PF_CR1,a 
      0085FC C7 50 21         [ 1] 1168 	ld PG_CR1,a 
      0085FF C7 50 2B         [ 1] 1169 	ld PI_CR1,a 
                                   1170 ; disable schmitt triggers on Arduino CN4 analog inputs
      008602 55 00 3F 54 07   [ 1] 1171 	mov ADC_TDRL,0x3f
                                   1172 ; disable peripherals clocks
                                   1173 ;	clr CLK_PCKENR1 
                                   1174 ;	clr CLK_PCKENR2
      008607 72 5F 50 F2      [ 1] 1175 	clr AWU_TBR 
      00860B 72 14 50 CA      [ 1] 1176 	bset CLK_PCKENR2,#2 ; enable LSI for beeper
                                   1177 ; select internal clock no divisor: 16 Mhz 	
      00860F A6 E1            [ 1] 1178 	ld a,#CLK_SWR_HSI 
      008611 5F               [ 1] 1179 	clrw x  
      008612 CD 81 0B         [ 4] 1180     call clock_init 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008615 CD 81 2E         [ 4] 1181 	call timer4_init
      008618 CD 81 21         [ 4] 1182 	call timer2_init
                                   1183 ; UART1 at 115200 BAUD
      00861B CD 81 F7         [ 4] 1184 	call uart1_init
                                   1185 ; activate PE_4 (user button interrupt)
      00861E 72 18 50 18      [ 1] 1186     bset PE_CR2,#USR_BTN_BIT 
                                   1187 ; display system information
      008622 AE 85 9A         [ 2] 1188 	ldw x,#software 
      008625 CD 82 44         [ 4] 1189 	call puts 
      008628 A6 01            [ 1] 1190 	ld a,#MAJOR 
      00862A C7 00 0A         [ 1] 1191 	ld acc8,a 
      00862D 5F               [ 1] 1192 	clrw x 
      00862E CF 00 08         [ 2] 1193 	ldw acc24,x 
      008631 A6 0A            [ 1] 1194 	ld a,#10 
      008633 CD 8A 17         [ 4] 1195 	call prti24 
      008636 A6 2E            [ 1] 1196 	ld a,#'.
      008638 CD 82 32         [ 4] 1197 	call putc 
      00863B A6 00            [ 1] 1198 	ld a,#MINOR 
      00863D C7 00 0A         [ 1] 1199 	ld acc8,a 
      008640 5F               [ 1] 1200 	clrw x 
      008641 CF 00 08         [ 2] 1201 	ldw acc24,x 
      008644 A6 0A            [ 1] 1202 	ld a,#10 
      008646 CD 8A 17         [ 4] 1203 	call prti24 
      008649 A6 0D            [ 1] 1204 	ld a,#CR 
      00864B CD 82 32         [ 4] 1205 	call putc 
      00864E CD 9C 26         [ 4] 1206 	call seek_fdrive 
                                   1207 ; configure LD2 pin 
      008651 72 1A 50 0D      [ 1] 1208     bset PC_CR1,#LED2_BIT
      008655 72 1A 50 0E      [ 1] 1209     bset PC_CR2,#LED2_BIT
      008659 72 1A 50 0C      [ 1] 1210     bset PC_DDR,#LED2_BIT
      00865D 9A               [ 1] 1211 	rim 
      00865E 72 5C 00 12      [ 1] 1212 	inc seedy+1 
      008662 72 5C 00 10      [ 1] 1213 	inc seedx+1 
      008666 CD 86 D1         [ 4] 1214 	call clear_basic
      008669 CD 94 48         [ 4] 1215 	call ubound 
      00866C CD 90 65         [ 4] 1216 	call dpop 
      00866F CF 00 20         [ 2] 1217 	ldw array_size,x
      008672 CD 86 7B         [ 4] 1218 	call warm_init
      008675 CD 86 98         [ 4] 1219 	call load_autorun
      008678 CC 88 56         [ 2] 1220     jp interp 
                                   1221 
      00867B                       1222 warm_init:
      00867B 72 5F 00 22      [ 1] 1223 	clr flags 
      00867F 72 5F 00 1F      [ 1] 1224 	clr loop_depth 
      008683 AE 17 80         [ 2] 1225 	ldw x,#dstack_empty 
      008686 CF 00 19         [ 2] 1226 	ldw dstkptr,x 
      008689 35 04 00 23      [ 1] 1227 	mov tab_width,#TAB_WIDTH 
      00868D 35 0A 00 07      [ 1] 1228 	mov base,#10 
      008691 AE 16 C8         [ 2] 1229 	ldw x,#tib 
      008694 CF 00 05         [ 2] 1230 	ldw basicptr,x 
      008697 81               [ 4] 1231 	ret 
                                   1232 
                                   1233 ;--------------------------
                                   1234 ; if autorun file defined 
                                   1235 ; in eeprom address AUTORUN_NAME 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1236 ; load and run it.
                                   1237 ;-------------------------
      008698                       1238 load_autorun:
      008698 AE 40 00         [ 2] 1239 	ldw x,#AUTORUN_NAME
      00869B F6               [ 1] 1240 	ld a,(x)
      00869C 27 1D            [ 1] 1241 	jreq 9$
      00869E 90 AE 40 00      [ 2] 1242 	ldw y,#AUTORUN_NAME
      0086A2 CD 9C 84         [ 4] 1243 	call search_file
      0086A5 25 02            [ 1] 1244 	jrc 2$ 
      0086A7 20 12            [ 2] 1245 	jra 9$ 
      0086A9 CD 9D 93         [ 4] 1246 2$:	call load_file
      0086AC AE 40 00         [ 2] 1247 	ldw x,#AUTORUN_NAME 
      0086AF CD 82 44         [ 4] 1248 	call puts
      0086B2 AE 86 BC         [ 2] 1249 	ldw x,#autorun_msg 
      0086B5 CD 82 44         [ 4] 1250 	call puts 
      0086B8 CC 9A 59         [ 2] 1251 	jp run_it    
      0086BB 81               [ 4] 1252 9$: ret 	
                                   1253 
      0086BC 20 6C 6F 61 64 65 64  1254 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1255 ;---------------------------
                                   1256 ; reset BASIC text variables 
                                   1257 ; and clear variables 
                                   1258 ;---------------------------
      0086D1                       1259 clear_basic:
      0086D1 72 5F 00 04      [ 1] 1260 	clr count 
      0086D5 AE 00 58         [ 2] 1261 	ldw x,#free_ram 
      0086D8 CF 00 1B         [ 2] 1262 	ldw txtbgn,x 
      0086DB CF 00 1D         [ 2] 1263 	ldw txtend,x 
      0086DE CD 85 7B         [ 4] 1264 	call clear_vars 
      0086E1 81               [ 4] 1265 	ret 
                                   1266 
                                   1267 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1268 ;;   Tiny BASIC error messages     ;;
                                   1269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0086E2                       1270 err_msg:
      0086E2 00 00 86 FA 87 08 87  1271 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             17 87 31 87 41
      0086EE 87 58 87 6F 87 8A 87  1272 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             9C 87 AE
      0086F8 87 BB                 1273 	.word err_no_access 
                                   1274 
      0086FA 0A 4D 65 6D 6F 72 79  1275 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      008708 0A 73 79 6E 74 61 78  1276 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      008717 0A 6D 61 74 68 20 6F  1277 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      008731 0A 64 69 76 69 73 69  1278 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008741 0A 69 6E 76 61 6C 69  1279 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      008758 0A 72 75 6E 20 74 69  1280 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      00876F 0A 63 6F 6D 6D 61 6E  1281 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      00878A 0A 64 75 70 6C 69 63  1282 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      00879C 0A 46 69 6C 65 20 6E  1283 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      0087AE 0A 62 61 64 20 76 61  1284 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      0087BB 0A 46 69 6C 65 20 69  1285 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
                                   1286 
      0087EF 6C 61 73 74 20 74 6F  1287 rt_msg: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                   1288 
      0087FF                       1289 syntax_error:
      0087FF A6 02            [ 1] 1290 	ld a,#ERR_SYNTAX 
                                   1291 
      008801                       1292 tb_error:
      008801 AE 86 E2         [ 2] 1293 	ldw x, #err_msg 
      008804 72 5F 00 09      [ 1] 1294 	clr acc16 
      008808 48               [ 1] 1295 	sll a
      008809 72 59 00 09      [ 1] 1296 	rlc acc16  
      00880D C7 00 0A         [ 1] 1297 	ld acc8, a 
      008810 72 BB 00 09      [ 2] 1298 	addw x,acc16 
      008814 FE               [ 2] 1299 	ldw x,(x)
      008815 CD 82 44         [ 4] 1300 	call puts
      008818 72 0B 00 22 18   [ 2] 1301 	btjf flags,#FCOMP, 1$
      00881D AE 16 C8         [ 2] 1302 	ldw x,#tib
      008820 CD 82 44         [ 4] 1303 	call puts 
      008823 A6 0D            [ 1] 1304 	ld a,#CR 
      008825 CD 82 32         [ 4] 1305 	call putc
      008828 CE 00 01         [ 2] 1306 	ldw x,in.w
      00882B CD 82 6C         [ 4] 1307 	call spaces
      00882E A6 5E            [ 1] 1308 	ld a,#'^
      008830 CD 82 32         [ 4] 1309 	call putc 
      008833 20 1A            [ 2] 1310 	jra 6$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008835 CE 00 05         [ 2] 1311 1$:	ldw x,basicptr
      008838 CD 95 65         [ 4] 1312 	call prt_basic_line
      00883B AE 87 EF         [ 2] 1313 	ldw x,#rt_msg 
      00883E CD 82 44         [ 4] 1314 	call puts 
      008841 5F               [ 1] 1315 	clrw x 
      008842 C6 00 03         [ 1] 1316 	ld a,in.saved 
      008845 97               [ 1] 1317 	ld xl,a 
      008846 72 D6 00 05      [ 4] 1318 	ld a,([basicptr],x)
      00884A 5F               [ 1] 1319 	clrw x 
      00884B 97               [ 1] 1320 	ld xl,a 
      00884C CD 8A 5F         [ 4] 1321 	call print_int 
      00884F AE 17 FF         [ 2] 1322 6$: ldw x,#STACK_EMPTY 
      008852 94               [ 1] 1323     ldw sp,x
      008853                       1324 warm_start:
      008853 CD 86 7B         [ 4] 1325 	call warm_init
                                   1326 ;----------------------------
                                   1327 ;   BASIC interpreter
                                   1328 ;----------------------------
      008856                       1329 interp:
      008856 72 5F 00 01      [ 1] 1330 	clr in.w
      00885A 72 01 00 22 23   [ 2] 1331 	btjf flags,#FRUN,4$ 
                                   1332 ; running program
                                   1333 ; goto next basic line 
      00885F CE 00 05         [ 2] 1334 	ldw x,basicptr
      008862 E6 02            [ 1] 1335 	ld a,(2,x) ; line length 
      008864 C7 00 0A         [ 1] 1336 	ld acc8,a 
      008867 72 5F 00 09      [ 1] 1337 	clr acc16 
      00886B 72 BB 00 09      [ 2] 1338 	addw x,acc16
      00886F C3 00 1D         [ 2] 1339 	cpw x,txtend 
      008872 2A DF            [ 1] 1340 	jrpl warm_start
      008874 CF 00 05         [ 2] 1341 	ldw basicptr,x ; start of next line  
      008877 E6 02            [ 1] 1342 	ld a,(2,x)
      008879 C7 00 04         [ 1] 1343 	ld count,a 
      00887C 35 03 00 02      [ 1] 1344 	mov in,#3 ; skip first 3 bytes of line 
      008880 20 14            [ 2] 1345 	jra interp_loop 
      008882                       1346 4$: ; commande line mode 	
      008882 72 5F 00 02      [ 1] 1347 	clr in
      008886 A6 0D            [ 1] 1348 	ld a,#CR 
      008888 CD 82 32         [ 4] 1349 	call putc 
      00888B A6 3E            [ 1] 1350 	ld a,#'> 
      00888D CD 82 32         [ 4] 1351 	call putc 
      008890 CD 8B 4D         [ 4] 1352 	call readln
      008893 CD 84 80         [ 4] 1353 	call compile
      008896                       1354 interp_loop:  
      008896 C6 00 02         [ 1] 1355 	ld a,in 
      008899 C1 00 04         [ 1] 1356 	cp a,count  
      00889C 2A B8            [ 1] 1357 	jrpl interp
      00889E CD 88 C6         [ 4] 1358 	call next_token
      0088A1 A1 01            [ 1] 1359 	cp a,#TK_COLON 
      0088A3 27 F1            [ 1] 1360 	jreq interp_loop 
      0088A5 A1 00            [ 1] 1361 	cp a,#TK_NONE 
                                   1362 ;	jreq interp 
      0088A7                       1363 1$:
      0088A7 A1 05            [ 1] 1364 	cp a,#TK_VAR
      0088A9 26 05            [ 1] 1365 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0088AB CD 94 74         [ 4] 1366 	call let02  
      0088AE 20 E6            [ 2] 1367 	jra interp_loop 
      0088B0                       1368 2$:	
      0088B0 A1 02            [ 1] 1369 	cp a,#TK_ARRAY 
      0088B2 26 08            [ 1] 1370 	jrne 3$
      0088B4 CD 92 B9         [ 4] 1371 	call get_array_element
      0088B7 CD 94 74         [ 4] 1372 	call let02 
      0088BA 20 DA            [ 2] 1373 	jra interp_loop 
      0088BC                       1374 3$:
      0088BC A1 06            [ 1] 1375 	cp a,#TK_CMD
      0088BE 26 03            [ 1] 1376 	jrne 4$
      0088C0 FD               [ 4] 1377 	call (x) 
      0088C1 20 D3            [ 2] 1378 	jra interp_loop 
      0088C3                       1379 4$:	
      0088C3 CC 87 FF         [ 2] 1380 	jp syntax_error 
                                   1381 
                                   1382 ;--------------------------
                                   1383 ; extract next token from
                                   1384 ; token list 
                                   1385 ; basicptr -> base address 
                                   1386 ; in  -> offset in list array 
                                   1387 ; output:
                                   1388 ;   A 		token attribute
                                   1389 ;   X 		token value if there is one
                                   1390 ;----------------------------------------
      0088C6                       1391 next_token:
      0088C6 C6 00 02         [ 1] 1392 	ld a,in 
      0088C9 C0 00 04         [ 1] 1393 	sub a,count 
      0088CC 27 3B            [ 1] 1394 	jreq 9$
      0088CE 55 00 02 00 03   [ 1] 1395 	mov in.saved,in
      0088D3 CE 00 05         [ 2] 1396 	ldw x,basicptr 
      0088D6 72 D6 00 01      [ 4] 1397 	ld a,([in.w],x)
      0088DA 72 5C 00 02      [ 1] 1398 	inc in 
      0088DE A1 02            [ 1] 1399 	cp a,#TK_ARRAY  
      0088E0 23 27            [ 2] 1400 	jrule 9$
      0088E2 A1 03            [ 1] 1401 	cp a,#TK_CHAR
      0088E4 26 0D            [ 1] 1402 	jrne 1$
      0088E6 72 D6 00 01      [ 4] 1403 	ld a,([in.w],x)
      0088EA 72 5C 00 02      [ 1] 1404 	inc in
      0088EE 5F               [ 1] 1405 	clrw x 
      0088EF 97               [ 1] 1406 	ld xl,a 
      0088F0 A6 03            [ 1] 1407 	ld a,#TK_CHAR
      0088F2 81               [ 4] 1408 	ret 
      0088F3 A1 0A            [ 1] 1409 1$:	cp a,#TK_QSTR 
      0088F5 25 06            [ 1] 1410 	jrult 2$
      0088F7 72 BB 00 01      [ 2] 1411 	addw x,in.w 
      0088FB 20 0C            [ 2] 1412 	jra 9$
      0088FD 72 DE 00 01      [ 5] 1413 2$: ldw x,([in.w],x)
      008901 72 5C 00 02      [ 1] 1414 	inc in 
      008905 72 5C 00 02      [ 1] 1415 	inc in
      008909 81               [ 4] 1416 9$: ret	
                                   1417 
                                   1418 
                                   1419 ;----------------------------------------
                                   1420 ;   DEBUG support functions
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1421 ;----------------------------------------
                           000001  1422 .if DEBUG 
                                   1423 ; turn LED on 
      00890A                       1424 ledon:
      00890A 72 1A 50 0A      [ 1] 1425     bset PC_ODR,#LED2_BIT
      00890E 81               [ 4] 1426     ret 
                                   1427 
                                   1428 ; turn LED off 
      00890F                       1429 ledoff:
      00890F 72 1B 50 0A      [ 1] 1430     bres PC_ODR,#LED2_BIT 
      008913 81               [ 4] 1431     ret 
                                   1432 
                                   1433 ; invert LED status 
      008914                       1434 ledtoggle:
      008914 A6 20            [ 1] 1435     ld a,#LED2_MASK
      008916 C8 50 0A         [ 1] 1436     xor a,PC_ODR
      008919 C7 50 0A         [ 1] 1437     ld PC_ODR,a
      00891C 81               [ 4] 1438     ret 
                                   1439 
      00891D                       1440 left_paren:
      00891D A6 20            [ 1] 1441 	ld a,#SPACE 
      00891F CD 82 32         [ 4] 1442 	call putc
      008922 A6 28            [ 1] 1443 	ld a,#'( 
      008924 CD 82 32         [ 4] 1444 	call putc 	
      008927 81               [ 4] 1445 	ret 
                                   1446 
                                   1447 ;------------------------------
                                   1448 ; print 8 bit register 
                                   1449 ; input:
                                   1450 ;   X  point to register name 
                                   1451 ;   A  register value to print 
                                   1452 ; output:
                                   1453 ;   none
                                   1454 ;------------------------------- 
      008928                       1455 prt_reg8:
      008928 88               [ 1] 1456 	push a 
      008929 CD 82 44         [ 4] 1457 	call puts 
      00892C 7B 01            [ 1] 1458 	ld a,(1,sp) 
      00892E C7 00 0A         [ 1] 1459 	ld acc8,a 
      008931 5F               [ 1] 1460 	clrw x 
      008932 97               [ 1] 1461 	ld xl,a 
      008933 35 10 00 07      [ 1] 1462 	mov base,#16
      008937 CD 8A 5F         [ 4] 1463 	call print_int 
      00893A CD 89 1D         [ 4] 1464 	call left_paren 
      00893D 84               [ 1] 1465 	pop a 
      00893E 5F               [ 1] 1466 	clrw x 
      00893F 97               [ 1] 1467 	ld xl,a 
      008940 35 0A 00 07      [ 1] 1468 	mov base,#10 
      008944 CD 8A 5F         [ 4] 1469 	call print_int  
      008947 A6 29            [ 1] 1470 	ld a,#') 
      008949 CD 82 32         [ 4] 1471 	call putc
      00894C 81               [ 4] 1472 	ret
                                   1473 
                                   1474 ;--------------------------------
                                   1475 ; print 16 bits register 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1476 ; input:
                                   1477 ;   X   point register name 
                                   1478 ;   Y   register value to print 
                                   1479 ; output:
                                   1480 ;  none
                                   1481 ;--------------------------------
      00894D                       1482 prt_reg16: 
      00894D 90 89            [ 2] 1483 	pushw y 
      00894F CD 82 44         [ 4] 1484 	call puts 
      008952 1E 01            [ 2] 1485 	ldw x,(1,sp) 
      008954 35 10 00 07      [ 1] 1486 	mov base,#16 
      008958 CD 8A 5F         [ 4] 1487 	call print_int  
      00895B CD 89 1D         [ 4] 1488 	call left_paren 
      00895E 85               [ 2] 1489 	popw x 
      00895F 35 0A 00 07      [ 1] 1490 	mov base,#10 
      008963 CD 8A 5F         [ 4] 1491 	call print_int  
      008966 A6 29            [ 1] 1492 	ld a,#') 
      008968 CD 82 32         [ 4] 1493 	call putc
      00896B 81               [ 4] 1494 	ret 
                                   1495 
                                   1496 ;------------------------------------
                                   1497 ; print registers contents saved on
                                   1498 ; stack by trap interrupt.
                                   1499 ;------------------------------------
      00896C                       1500 print_registers:
      00896C AE 89 BF         [ 2] 1501 	ldw x,#STATES
      00896F CD 82 44         [ 4] 1502 	call puts
                                   1503 ; print EPC 
      008972 AE 89 FC         [ 2] 1504 	ldw x, #REG_EPC
      008975 CD 82 44         [ 4] 1505 	call puts 
      008978 7B 0B            [ 1] 1506 	ld a, (11,sp)
      00897A C7 00 0A         [ 1] 1507 	ld acc8,a 
      00897D 7B 0A            [ 1] 1508 	ld a, (10,sp) 
      00897F C7 00 09         [ 1] 1509 	ld acc16,a 
      008982 7B 09            [ 1] 1510 	ld a,(9,sp) 
      008984 C7 00 08         [ 1] 1511 	ld acc24,a
      008987 5F               [ 1] 1512 	clrw x  
      008988 A6 10            [ 1] 1513 	ld a,#16
      00898A CD 8A 17         [ 4] 1514 	call prti24  
                                   1515 ; print X
      00898D AE 8A 05         [ 2] 1516 	ldw x,#REG_X
      008990 16 05            [ 2] 1517 	ldw y,(5,sp)
      008992 CD 89 4D         [ 4] 1518 	call prt_reg16  
                                   1519 ; print Y 
      008995 AE 8A 01         [ 2] 1520 	ldw x,#REG_Y
      008998 16 07            [ 2] 1521 	ldw y, (7,sp)
      00899A CD 89 4D         [ 4] 1522 	call prt_reg16  
                                   1523 ; print A 
      00899D AE 8A 09         [ 2] 1524 	ldw x,#REG_A
      0089A0 7B 04            [ 1] 1525 	ld a, (4,sp) 
      0089A2 CD 89 28         [ 4] 1526 	call prt_reg8
                                   1527 ; print CC 
      0089A5 AE 8A 0D         [ 2] 1528 	ldw x,#REG_CC 
      0089A8 7B 03            [ 1] 1529 	ld a, (3,sp) 
      0089AA CD 89 28         [ 4] 1530 	call prt_reg8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1531 ; print SP 
      0089AD AE 8A 12         [ 2] 1532 	ldw x,#REG_SP
      0089B0 90 96            [ 1] 1533 	ldw y,sp 
      0089B2 72 A9 00 0C      [ 2] 1534 	addw y,#12
      0089B6 CD 89 4D         [ 4] 1535 	call prt_reg16  
      0089B9 A6 0A            [ 1] 1536 	ld a,#'\n' 
      0089BB CD 82 32         [ 4] 1537 	call putc
      0089BE 81               [ 4] 1538 	ret
                                   1539 
      0089BF 0A 52 65 67 69 73 74  1540 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      0089FC 45 50 43 3A 00        1541 REG_EPC: .asciz "EPC:"
      008A01 0A 59 3A 00           1542 REG_Y:   .asciz "\nY:" 
      008A05 0A 58 3A 00           1543 REG_X:   .asciz "\nX:"
      008A09 0A 41 3A 00           1544 REG_A:   .asciz "\nA:" 
      008A0D 0A 43 43 3A 00        1545 REG_CC:  .asciz "\nCC:"
      008A12 0A 53 50 3A 00        1546 REG_SP:  .asciz "\nSP:"
                                   1547 .endif ; DEBUG 
                                   1548 
                                   1549 ;------------------------------------
                                   1550 ; print integer in acc24 
                                   1551 ; input:
                                   1552 ;	acc24 		integer to print 
                                   1553 ;	A 			numerical base for conversion 
                                   1554 ;               if bit 7 is set add a space at print end.
                                   1555 ;   XL 			field width, 0 -> no fill.
                                   1556 ;  output:
                                   1557 ;    none 
                                   1558 ;------------------------------------
                           000001  1559 	WIDTH = 1
                           000002  1560 	BASE = 2
                           000003  1561 	ADD_SPACE=3 ; add a space after number 
                           000003  1562 	VSIZE = 3
      008A17                       1563 prti24:
      000997                       1564 	_vars VSIZE 
      008A17 52 03            [ 2]    1     sub sp,#VSIZE 
      008A19 0F 03            [ 1] 1565 	clr (ADD_SPACE,sp)
      008A1B A5 80            [ 1] 1566 	bcp a,#0x80 
      008A1D 27 02            [ 1] 1567 	jreq 0$ 
      008A1F 03 03            [ 1] 1568 	cpl (ADD_SPACE,sp)
      008A21 A4 1F            [ 1] 1569 0$:	and a,#31 
      008A23 6B 02            [ 1] 1570 	ld (BASE,sp),a
      008A25 9F               [ 1] 1571 	ld a,xl
      008A26 6B 01            [ 1] 1572 	ld (WIDTH,sp),a 
      008A28 7B 02            [ 1] 1573 	ld a, (BASE,sp)  
      008A2A CD 8A BB         [ 4] 1574     call itoa  ; conversion entier en  .asciz
      008A2D 7B 01            [ 1] 1575 1$: ld a,(WIDTH,sp)
      008A2F 27 1F            [ 1] 1576 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008A31 C7 00 0A         [ 1] 1577 	ld acc8,a 
      008A34 89               [ 2] 1578 	pushw x 
      008A35 CD 83 06         [ 4] 1579 	call strlen 
      008A38 9F               [ 1] 1580 	ld a,xl 
      008A39 85               [ 2] 1581 	popw x 
      008A3A 31 00 0A         [ 3] 1582 	exg a,acc8 
      008A3D C0 00 0A         [ 1] 1583 	sub a,acc8 
      008A40 2B 0E            [ 1] 1584 	jrmi 4$
      008A42 6B 01            [ 1] 1585 	ld (WIDTH,sp),a 
      008A44 A6 20            [ 1] 1586 	ld  a,#SPACE
      008A46 0D 01            [ 1] 1587 3$: tnz (WIDTH,sp)
      008A48 27 06            [ 1] 1588 	jreq 4$
      008A4A 5A               [ 2] 1589 	decw x 
      008A4B F7               [ 1] 1590 	ld (x),a 
      008A4C 0A 01            [ 1] 1591 	dec (WIDTH,sp) 
      008A4E 20 F6            [ 2] 1592 	jra 3$
      008A50                       1593 4$: 
      008A50 CD 82 44         [ 4] 1594 	call puts 
      008A53 0D 03            [ 1] 1595 	tnz (ADD_SPACE,sp)
      008A55 27 05            [ 1] 1596 	jreq 5$
      008A57 A6 20            [ 1] 1597     ld a,#SPACE 
      008A59 CD 82 32         [ 4] 1598 	call putc 
      0009DC                       1599 5$: _drop VSIZE 
      008A5C 5B 03            [ 2]    1     addw sp,#VSIZE 
      008A5E 81               [ 4] 1600     ret	
                                   1601 
                                   1602 ;-----------------------------------
                                   1603 ; print a 16 bit integer 
                                   1604 ; using variable 'base' as conversion
                                   1605 ; format.
                                   1606 ; input:
                                   1607 ;   X       integer to print 
                                   1608 ;   base    conversion base 
                                   1609 ; output:
                                   1610 ;   none 
                                   1611 ;-----------------------------------
                           000001  1612 	SIGN=1
                           000001  1613 	VSIZE=1
      008A5F                       1614 print_int: 
      0009DF                       1615 	_vars VSIZE 
      008A5F 52 01            [ 2]    1     sub sp,#VSIZE 
      008A61 0F 01            [ 1] 1616 	clr (SIGN,sp)
      008A63 90 AE 17 3F      [ 2] 1617 	ldw y,#pad+PAD_SIZE-1 
      008A67 90 7F            [ 1] 1618 	clr (y)
      008A69 C6 00 07         [ 1] 1619 	ld a,base  
      008A6C A1 0A            [ 1] 1620 	cp a,#10 
      008A6E 26 06            [ 1] 1621 	jrne 1$ 
      008A70 5D               [ 2] 1622 	tnzw x 
      008A71 2A 03            [ 1] 1623 	jrpl 1$ 
      008A73 03 01            [ 1] 1624 	cpl (SIGN,sp)
      008A75 50               [ 2] 1625 	negw x 	 
      008A76                       1626 1$:	
      008A76 C6 00 07         [ 1] 1627 	ld a,base 
      008A79 62               [ 2] 1628 	div x,a 
      008A7A AB 30            [ 1] 1629 	add a,#'0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A7C A1 3A            [ 1] 1630 	cp a,#'9+1 
      008A7E 2B 02            [ 1] 1631 	jrmi 2$ 
      008A80 AB 07            [ 1] 1632 	add a,#7 
      008A82 90 5A            [ 2] 1633 2$: decw y 
      008A84 90 F7            [ 1] 1634 	ld (y),a 
      008A86 5D               [ 2] 1635 	tnzw x 
      008A87 26 ED            [ 1] 1636 	jrne 1$ 
      008A89 A6 10            [ 1] 1637 	ld a,#16 
      008A8B C1 00 07         [ 1] 1638 	cp a,base 
      008A8E 26 08            [ 1] 1639 	jrne 3$
      008A90 A6 24            [ 1] 1640 	ld a,#'$
      008A92 90 5A            [ 2] 1641 	decw y  
      008A94 90 F7            [ 1] 1642 	ld (y),a
      008A96 20 0A            [ 2] 1643 	jra 9$ 
      008A98 0D 01            [ 1] 1644 3$: tnz (SIGN,sp)
      008A9A 27 06            [ 1] 1645 	jreq 9$ 
      008A9C A6 2D            [ 1] 1646 	ld a,#'-
      008A9E 90 5A            [ 2] 1647 	decw y  
      008AA0 90 F7            [ 1] 1648 	ld (y),a
      008AA2                       1649 9$:	
      008AA2 93               [ 1] 1650 	ldw x,y 
      008AA3 1D 17 3F         [ 2] 1651 	subw x,#pad+PAD_SIZE-1 
      008AA6 50               [ 2] 1652 	negw x  
      008AA7                       1653 10$:
      008AA7 90 5A            [ 2] 1654 	decw y 
      008AA9 A6 20            [ 1] 1655 	ld a,#SPACE 
      008AAB 90 F7            [ 1] 1656 	ld (y),a
      008AAD 5C               [ 2] 1657 	incw x 
      008AAE 9F               [ 1] 1658 	ld a,xl 
      008AAF C1 00 23         [ 1] 1659 	cp a,tab_width
      008AB2 2B F3            [ 1] 1660 	jrmi 10$ 
      008AB4                       1661 12$:
      008AB4 93               [ 1] 1662     ldw x,y 
      008AB5 CD 82 44         [ 4] 1663 	call puts  
      000A38                       1664 	_drop VSIZE 
      008AB8 5B 01            [ 2]    1     addw sp,#VSIZE 
      008ABA 81               [ 4] 1665 	ret 
                                   1666 
                                   1667 ;------------------------------------
                                   1668 ; convert integer in acc24 to string
                                   1669 ; input:
                                   1670 ;   A	  	base
                                   1671 ;	acc24	integer to convert
                                   1672 ; output:
                                   1673 ;   X  		pointer to string
                                   1674 ;------------------------------------
                           000001  1675 	SIGN=1  ; integer sign 
                           000002  1676 	BASE=2  ; numeric base 
                           000002  1677 	VSIZE=2  ;locals size
      008ABB                       1678 itoa:
      008ABB 52 02            [ 2] 1679 	sub sp,#VSIZE
      008ABD 6B 02            [ 1] 1680 	ld (BASE,sp), a  ; base
      008ABF 0F 01            [ 1] 1681 	clr (SIGN,sp)    ; sign
      008AC1 A1 0A            [ 1] 1682 	cp a,#10
      008AC3 26 0A            [ 1] 1683 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1684 	; base 10 string display with negative sign if bit 23==1
      008AC5 72 0F 00 08 05   [ 2] 1685 	btjf acc24,#7,1$
      008ACA 03 01            [ 1] 1686 	cpl (SIGN,sp)
      008ACC CD 8B 2A         [ 4] 1687 	call neg_acc24
      008ACF                       1688 1$:
                                   1689 ; initialize string pointer 
      008ACF AE 17 3F         [ 2] 1690 	ldw x,#pad+PAD_SIZE-1
      008AD2 7F               [ 1] 1691 	clr (x)
      008AD3                       1692 itoa_loop:
      008AD3 7B 02            [ 1] 1693     ld a,(BASE,sp)
      008AD5 CD 8B 02         [ 4] 1694     call divu24_8 ; acc24/A 
      008AD8 AB 30            [ 1] 1695     add a,#'0  ; remainder of division
      008ADA A1 3A            [ 1] 1696     cp a,#'9+1
      008ADC 2B 02            [ 1] 1697     jrmi 2$
      008ADE AB 07            [ 1] 1698     add a,#7 
      008AE0 5A               [ 2] 1699 2$: decw x
      008AE1 F7               [ 1] 1700     ld (x),a
                                   1701 	; if acc24==0 conversion done
      008AE2 C6 00 08         [ 1] 1702 	ld a,acc24
      008AE5 CA 00 09         [ 1] 1703 	or a,acc16
      008AE8 CA 00 0A         [ 1] 1704 	or a,acc8
      008AEB 26 E6            [ 1] 1705     jrne itoa_loop
                                   1706 	;conversion done, next add '$' or '-' as required
      008AED 7B 02            [ 1] 1707 	ld a,(BASE,sp)
      008AEF A1 10            [ 1] 1708 	cp a,#16
      008AF1 27 08            [ 1] 1709 	jreq 8$
      008AF3 7B 01            [ 1] 1710 	ld a,(SIGN,sp)
      008AF5 27 08            [ 1] 1711     jreq 10$
      008AF7 A6 2D            [ 1] 1712     ld a,#'-
      008AF9 20 02            [ 2] 1713 	jra 9$ 
      008AFB A6 24            [ 1] 1714 8$: ld a,#'$ 
      008AFD 5A               [ 2] 1715 9$: decw x
      008AFE F7               [ 1] 1716     ld (x),a
      008AFF                       1717 10$:
      008AFF 5B 02            [ 2] 1718 	addw sp,#VSIZE
      008B01 81               [ 4] 1719 	ret
                                   1720 
                                   1721 ;-------------------------------------
                                   1722 ; divide uint24_t by uint8_t
                                   1723 ; used to convert uint24_t to string
                                   1724 ; input:
                                   1725 ;	acc24	dividend
                                   1726 ;   A 		divisor
                                   1727 ; output:
                                   1728 ;   acc24	quotient
                                   1729 ;   A		remainder
                                   1730 ;------------------------------------- 
                                   1731 ; offset  on sp of arguments and locals
                           000001  1732 	U8   = 1   ; divisor on stack
                           000001  1733 	VSIZE =1
      008B02                       1734 divu24_8:
      008B02 89               [ 2] 1735 	pushw x ; save x
      008B03 88               [ 1] 1736 	push a 
                                   1737 	; ld dividend UU:MM bytes in X
      008B04 C6 00 08         [ 1] 1738 	ld a, acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008B07 95               [ 1] 1739 	ld xh,a
      008B08 C6 00 09         [ 1] 1740 	ld a,acc24+1
      008B0B 97               [ 1] 1741 	ld xl,a
      008B0C 7B 01            [ 1] 1742 	ld a,(U8,SP) ; divisor
      008B0E 62               [ 2] 1743 	div x,a ; UU:MM/U8
      008B0F 88               [ 1] 1744 	push a  ;save remainder
      008B10 9E               [ 1] 1745 	ld a,xh
      008B11 C7 00 08         [ 1] 1746 	ld acc24,a
      008B14 9F               [ 1] 1747 	ld a,xl
      008B15 C7 00 09         [ 1] 1748 	ld acc24+1,a
      008B18 84               [ 1] 1749 	pop a
      008B19 95               [ 1] 1750 	ld xh,a
      008B1A C6 00 0A         [ 1] 1751 	ld a,acc24+2
      008B1D 97               [ 1] 1752 	ld xl,a
      008B1E 7B 01            [ 1] 1753 	ld a,(U8,sp) ; divisor
      008B20 62               [ 2] 1754 	div x,a  ; R:LL/U8
      008B21 6B 01            [ 1] 1755 	ld (U8,sp),a ; save remainder
      008B23 9F               [ 1] 1756 	ld a,xl
      008B24 C7 00 0A         [ 1] 1757 	ld acc24+2,a
      008B27 84               [ 1] 1758 	pop a
      008B28 85               [ 2] 1759 	popw x
      008B29 81               [ 4] 1760 	ret
                                   1761 
                                   1762 ;------------------------------------
                                   1763 ;  two's complement acc24
                                   1764 ;  input:
                                   1765 ;		acc24 variable
                                   1766 ;  output:
                                   1767 ;		acc24 variable
                                   1768 ;-------------------------------------
      008B2A                       1769 neg_acc24:
      008B2A 72 53 00 0A      [ 1] 1770 	cpl acc24+2
      008B2E 72 53 00 09      [ 1] 1771 	cpl acc24+1
      008B32 72 53 00 08      [ 1] 1772 	cpl acc24
      008B36 A6 01            [ 1] 1773 	ld a,#1
      008B38 CB 00 0A         [ 1] 1774 	add a,acc24+2
      008B3B C7 00 0A         [ 1] 1775 	ld acc24+2,a
      008B3E 4F               [ 1] 1776 	clr a
      008B3F C9 00 09         [ 1] 1777 	adc a,acc24+1
      008B42 C7 00 09         [ 1] 1778 	ld acc24+1,a 
      008B45 4F               [ 1] 1779 	clr a 
      008B46 C9 00 08         [ 1] 1780 	adc a,acc24 
      008B49 C7 00 08         [ 1] 1781 	ld acc24,a 
      008B4C 81               [ 4] 1782 	ret
                                   1783 
                                   1784 
                                   1785 ;------------------------------------
                                   1786 ; read a line of text from terminal
                                   1787 ; input:
                                   1788 ;	none
                                   1789 ; local variable on stack:
                                   1790 ;	LL  line length
                                   1791 ;   RXCHAR last received chaaracte 
                                   1792 ; output:
                                   1793 ;   text in tib  buffer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1794 ;------------------------------------
                                   1795 	; local variables
                           000001  1796 	LL_HB=1
                           000001  1797 	RXCHAR = 1 ; last char received
                           000002  1798 	LL = 2  ; accepted line length
                           000002  1799 	VSIZE=2 
      008B4D                       1800 readln:
      008B4D 5F               [ 1] 1801 	clrw x 
      008B4E 89               [ 2] 1802 	pushw x 
      008B4F 90 AE 16 C8      [ 2] 1803  	ldw y,#tib ; input buffer
      008B53                       1804 readln_loop:
      008B53 CD 82 3B         [ 4] 1805 	call getc
      008B56 6B 01            [ 1] 1806 	ld (RXCHAR,sp),a
      008B58 A1 0D            [ 1] 1807 	cp a,#CR
      008B5A 26 03            [ 1] 1808 	jrne 1$
      008B5C CC 8B C8         [ 2] 1809 	jp readln_quit
      008B5F A1 0A            [ 1] 1810 1$:	cp a,#NL
      008B61 27 65            [ 1] 1811 	jreq readln_quit
      008B63 A1 08            [ 1] 1812 	cp a,#BSP
      008B65 27 3D            [ 1] 1813 	jreq del_back
      008B67 A1 04            [ 1] 1814 	cp a,#CTRL_D
      008B69 27 2A            [ 1] 1815 	jreq del_ln
      008B6B A1 12            [ 1] 1816 	cp a,#CTRL_R 
      008B6D 27 06            [ 1] 1817 	jreq reprint 
                                   1818 ;	cp a,#'[
                                   1819 ;	jreq ansi_seq
      008B6F                       1820 final_test:
      008B6F A1 20            [ 1] 1821 	cp a,#SPACE
      008B71 2A 40            [ 1] 1822 	jrpl accept_char
      008B73 20 DE            [ 2] 1823 	jra readln_loop
      008B75                       1824 ansi_seq:
                                   1825 ;	call getc
                                   1826 ;	cp a,#'C 
                                   1827 ;	jreq rigth_arrow
                                   1828 ;	cp a,#'D 
                                   1829 ;	jreq left_arrow 
                                   1830 ;	jra final_test
      008B75                       1831 right_arrow:
                                   1832 ;	ld a,#BSP 
                                   1833 ;	call putc 
                                   1834 ;	jra realn_loop 
      008B75                       1835 left_arrow:
                                   1836 
                                   1837 ;	jra readln_loop
      008B75                       1838 reprint: 
      008B75 0D 02            [ 1] 1839 	tnz (LL,sp)
      008B77 26 DA            [ 1] 1840 	jrne readln_loop
      008B79 AE 16 C8         [ 2] 1841 	ldw x,#tib 
      008B7C CD 83 06         [ 4] 1842 	call strlen 
      008B7F 90 AE 16 C8      [ 2] 1843 	ldw y,#tib 
      008B83 9F               [ 1] 1844 	ld a,xl
      008B84 27 CD            [ 1] 1845 	jreq readln_loop
      008B86 6B 02            [ 1] 1846 	ld (LL,sp),a 
      008B88 AE 16 C8         [ 2] 1847 	ldw x,#tib 
      008B8B CD 82 44         [ 4] 1848 	call puts
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B8E 0F 01            [ 1] 1849 	clr (LL_HB,sp)
      008B90 72 F9 01         [ 2] 1850 	addw y,(LL_HB,sp)
      008B93 20 BE            [ 2] 1851 	jra readln_loop 
      008B95                       1852 del_ln:
      008B95 7B 02            [ 1] 1853 	ld a,(LL,sp)
      008B97 CD 82 5E         [ 4] 1854 	call delete
      008B9A 90 AE 16 C8      [ 2] 1855 	ldw y,#tib
      008B9E 90 7F            [ 1] 1856 	clr (y)
      008BA0 0F 02            [ 1] 1857 	clr (LL,sp)
      008BA2 20 AF            [ 2] 1858 	jra readln_loop
      008BA4                       1859 del_back:
      008BA4 0D 02            [ 1] 1860     tnz (LL,sp)
      008BA6 27 AB            [ 1] 1861     jreq readln_loop
      008BA8 0A 02            [ 1] 1862     dec (LL,sp)
      008BAA 90 5A            [ 2] 1863     decw y
      008BAC 90 7F            [ 1] 1864     clr  (y)
      008BAE CD 82 4E         [ 4] 1865     call bksp 
      008BB1 20 A0            [ 2] 1866     jra readln_loop	
      008BB3                       1867 accept_char:
      008BB3 A6 4F            [ 1] 1868 	ld a,#TIB_SIZE-1
      008BB5 11 02            [ 1] 1869 	cp a, (LL,sp)
      008BB7 27 9A            [ 1] 1870 	jreq readln_loop
      008BB9 7B 01            [ 1] 1871 	ld a,(RXCHAR,sp)
      008BBB 90 F7            [ 1] 1872 	ld (y),a
      008BBD 0C 02            [ 1] 1873 	inc (LL,sp)
      008BBF 90 5C            [ 2] 1874 	incw y
      008BC1 90 7F            [ 1] 1875 	clr (y)
      008BC3 CD 82 32         [ 4] 1876 	call putc 
      008BC6 20 8B            [ 2] 1877 	jra readln_loop
      008BC8                       1878 readln_quit:
      008BC8 90 7F            [ 1] 1879 	clr (y)
      008BCA 7B 02            [ 1] 1880 	ld a,(LL,sp)
      008BCC C7 00 04         [ 1] 1881 	ld count,a 
      000B4F                       1882 	_drop VSIZE 
      008BCF 5B 02            [ 2]    1     addw sp,#VSIZE 
      008BD1 A6 0D            [ 1] 1883 	ld a,#CR
      008BD3 CD 82 32         [ 4] 1884 	call putc
      008BD6 81               [ 4] 1885 	ret
                                   1886 
                           000001  1887 .if DEBUG 	
                                   1888 ;----------------------------
                                   1889 ; command interface
                                   1890 ; only 3 commands:
                                   1891 ;  'q' to resume application
                                   1892 ;  'p [addr]' to print memory values 
                                   1893 ;  's addr' to print string 
                                   1894 ;----------------------------
                                   1895 ;local variable 
                           000001  1896 	PSIZE=1
                           000001  1897 	VSIZE=1 
      008BD7                       1898 cmd_itf:
      008BD7 52 01            [ 2] 1899 	sub sp,#VSIZE 
      008BD9 72 5F 00 13      [ 1] 1900 	clr farptr 
      008BDD 72 5F 00 14      [ 1] 1901 	clr farptr+1 
      008BE1 72 5F 00 15      [ 1] 1902 	clr farptr+2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008BE5                       1903 repl:
      008BE5 A6 0D            [ 1] 1904 	ld a,#CR 
      008BE7 CD 82 32         [ 4] 1905 	call putc 
      008BEA A6 3F            [ 1] 1906 	ld a,#'? 
      008BEC CD 82 32         [ 4] 1907 	call putc
      008BEF 72 5F 00 01      [ 1] 1908 	clr in.w 
      008BF3 72 5F 00 02      [ 1] 1909 	clr in 
      008BF7 CD 8B 4D         [ 4] 1910 	call readln
      008BFA 90 AE 16 C8      [ 2] 1911 	ldw y,#tib  
      008BFE 90 F6            [ 1] 1912 	ld a,(y)
      008C00 27 E3            [ 1] 1913 	jreq repl  
      008C02 72 5C 00 02      [ 1] 1914 	inc in 
      008C06 CD 8F 87         [ 4] 1915 	call to_upper 
      008C09 A1 51            [ 1] 1916 	cp a,#'Q 
      008C0B 26 17            [ 1] 1917 	jrne test_p
      008C0D                       1918 repl_exit:
      008C0D 72 5F 16 C8      [ 1] 1919 	clr tib 
      008C11 72 5F 00 04      [ 1] 1920 	clr count 
      008C15 72 5F 00 02      [ 1] 1921 	clr in 
      000B99                       1922 	_drop #VSIZE 	
      008C19 5B 01            [ 2]    1     addw sp,##VSIZE 
      008C1B 81               [ 4] 1923 	ret  
      008C1C                       1924 invalid:
      008C1C AE 8C 9A         [ 2] 1925 	ldw x,#invalid_cmd 
      008C1F CD 82 44         [ 4] 1926 	call puts 
      008C22 20 C1            [ 2] 1927 	jra repl 
      008C24                       1928 test_p:	
      008C24 A1 50            [ 1] 1929     cp a,#'P 
      008C26 27 11            [ 1] 1930 	jreq mem_peek
      008C28 A1 53            [ 1] 1931     cp a,#'S 
      008C2A 26 F0            [ 1] 1932 	jrne invalid 
      008C2C                       1933 print_string:	
      008C2C CD 8D C6         [ 4] 1934 	call get_token
      008C2F A1 04            [ 1] 1935 	cp a,#TK_INTGR 
      008C31 26 E9            [ 1] 1936 	jrne invalid 
      008C33 CD 82 44         [ 4] 1937 	call puts
      008C36 CC 8B E5         [ 2] 1938 	jp repl 	
      008C39                       1939 mem_peek:
      008C39 A6 20            [ 1] 1940 	ld a,#SPACE 
      008C3B CD 90 3F         [ 4] 1941 	call skip  	 
      008C3E 72 B9 00 01      [ 2] 1942 	addw y,in.w 
      008C42 AE 17 18         [ 2] 1943 	ldw x,#pad 
      008C45 CD 83 24         [ 4] 1944 	call strcpy
      008C48 CD 8F 93         [ 4] 1945 	call atoi24 	
      008C4B C6 00 08         [ 1] 1946 	ld a, acc24 
      008C4E CA 00 09         [ 1] 1947 	or a,acc16 
      008C51 CA 00 0A         [ 1] 1948 	or a,acc8 
      008C54 26 02            [ 1] 1949 	jrne 1$ 
      008C56 20 0C            [ 2] 1950 	jra peek_byte  
      008C58 CE 00 08         [ 2] 1951 1$:	ldw x,acc24 
      008C5B CF 00 13         [ 2] 1952 	ldw farptr,x 
      008C5E C6 00 0A         [ 1] 1953 	ld a,acc8 
      008C61 C7 00 15         [ 1] 1954 	ld farptr+2,a 
      008C64                       1955 peek_byte:
      008C64 CD 8C A9         [ 4] 1956 	call print_farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008C67 A6 08            [ 1] 1957 	ld a,#8 
      008C69 6B 01            [ 1] 1958 	ld (PSIZE,sp),a 
      008C6B 5F               [ 1] 1959 	clrw x 
      008C6C CD 8C C4         [ 4] 1960 1$:	call fetchc  
      008C6F 89               [ 2] 1961 	pushw x 
      008C70 C7 00 0A         [ 1] 1962 	ld acc8,a 
      008C73 5F               [ 1] 1963 	clrw x 
      008C74 CF 00 08         [ 2] 1964 	ldw acc24,x 
      008C77 A6 90            [ 1] 1965 	ld a,#16+128
      008C79 CD 8A 17         [ 4] 1966 	call prti24
      008C7C 85               [ 2] 1967 	popw x 
      008C7D 0A 01            [ 1] 1968 	dec (PSIZE,sp)
      008C7F 26 EB            [ 1] 1969 	jrne 1$ 
      008C81 A6 08            [ 1] 1970 	ld a,#8 
      008C83 CB 00 15         [ 1] 1971 	add a,farptr+2 
      008C86 C7 00 15         [ 1] 1972 	ld farptr+2,a
      008C89 4F               [ 1] 1973 	clr a 
      008C8A C9 00 14         [ 1] 1974 	adc a,farptr+1 
      008C8D C7 00 14         [ 1] 1975 	ld farptr+1,a 
      008C90 4F               [ 1] 1976 	clr a 
      008C91 C9 00 13         [ 1] 1977 	adc a,farptr 
      008C94 C7 00 13         [ 1] 1978 	ld farptr,a 
      008C97 CC 8B E5         [ 2] 1979 	jp repl  
                                   1980 
      008C9A 6E 6F 74 20 61 20 63  1981 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1982 
                                   1983 ;----------------------------
                                   1984 ; display farptr address
                                   1985 ;----------------------------
      008CA9                       1986 print_farptr:
      008CA9 C6 00 15         [ 1] 1987 	ld a ,farptr+2 
      008CAC C7 00 0A         [ 1] 1988 	ld acc8,a 
      008CAF CE 00 13         [ 2] 1989 	ldw x,farptr 
      008CB2 CF 00 08         [ 2] 1990 	ldw acc24,x 
      008CB5 5F               [ 1] 1991 	clrw x 
      008CB6 A6 10            [ 1] 1992 	ld a,#16 
      008CB8 CD 8A 17         [ 4] 1993 	call prti24
      008CBB A6 20            [ 1] 1994 	ld a,#SPACE 
      008CBD CD 82 32         [ 4] 1995 	call putc 
      008CC0 CD 82 32         [ 4] 1996 	call putc 
      008CC3 81               [ 4] 1997 	ret
                                   1998 
                                   1999 ;------------------------------------
                                   2000 ; get byte at address farptr[X]
                                   2001 ; input:
                                   2002 ;	 farptr   address to peek
                                   2003 ;    X		  farptr index 	
                                   2004 ; output:
                                   2005 ;	 A 		  byte from memory  
                                   2006 ;    x		  incremented by 1
                                   2007 ;------------------------------------
      008CC4                       2008 fetchc: ; @C
      008CC4 92 AF 00 13      [ 5] 2009 	ldf a,([farptr],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008CC8 5C               [ 2] 2010 	incw x
      008CC9 81               [ 4] 2011 	ret
                                   2012 
                                   2013 
                                   2014 ;------------------------------------
                                   2015 ; expect a number from command line 
                                   2016 ; next argument
                                   2017 ;  input:
                                   2018 ;	  none
                                   2019 ;  output:
                                   2020 ;    acc24   int24_t 
                                   2021 ;------------------------------------
      008CCA                       2022 number::
      008CCA CD 8D C6         [ 4] 2023 	call get_token
      008CCD CD 8F 93         [ 4] 2024 	call atoi24
      008CD0 81               [ 4] 2025 	ret
                                   2026 .endif ; DEBUG 
                                   2027 
                                   2028 ;------------------------------------
                                   2029 ; parse quoted string 
                                   2030 ; input:
                                   2031 ;   Y 	pointer to tib 
                                   2032 ;   X   pointer to pad
                                   2033 ; output:
                                   2034 ;	pad   parsed string
                                   2035 ;   TOS  char* to pad  
                                   2036 ;------------------------------------
                           000001  2037 	PREV = 1
                           000002  2038 	CURR =2 
                           000002  2039 	VSIZE=2 
      008CD1                       2040 parse_quote: ; { -- addr }
      000C51                       2041 	_vars VSIZE 
      008CD1 52 02            [ 2]    1     sub sp,#VSIZE 
      008CD3 4F               [ 1] 2042 	clr a
      008CD4 6B 01            [ 1] 2043 1$:	ld (PREV,sp),a 
      008CD6 72 5C 00 02      [ 1] 2044 2$:	inc in
      008CDA 91 D6 01         [ 4] 2045 	ld a,([in.w],y)
      008CDD 27 24            [ 1] 2046 	jreq 6$
      008CDF 6B 02            [ 1] 2047 	ld (CURR,sp),a 
      008CE1 A6 5C            [ 1] 2048 	ld a,#'\
      008CE3 11 01            [ 1] 2049 	cp a, (PREV,sp)
      008CE5 26 0A            [ 1] 2050 	jrne 3$
      008CE7 0F 01            [ 1] 2051 	clr (PREV,sp)
      008CE9 7B 02            [ 1] 2052 	ld a,(CURR,sp)
      008CEB AD 1F            [ 4] 2053 	callr convert_escape
      008CED F7               [ 1] 2054 	ld (x),a 
      008CEE 5C               [ 2] 2055 	incw x 
      008CEF 20 E5            [ 2] 2056 	jra 2$
      008CF1                       2057 3$:
      008CF1 7B 02            [ 1] 2058 	ld a,(CURR,sp)
      008CF3 A1 5C            [ 1] 2059 	cp a,#'\'
      008CF5 27 DD            [ 1] 2060 	jreq 1$
      008CF7 A1 22            [ 1] 2061 	cp a,#'"
      008CF9 27 04            [ 1] 2062 	jreq 5$ 
      008CFB F7               [ 1] 2063 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008CFC 5C               [ 2] 2064 	incw x 
      008CFD 20 D7            [ 2] 2065 	jra 2$
      008CFF 72 5C 00 02      [ 1] 2066 5$:	inc in 
      008D03 7F               [ 1] 2067 6$: clr (x)
      008D04 AE 17 18         [ 2] 2068 	ldw x,#pad 
      000C87                       2069 	_drop VSIZE
      008D07 5B 02            [ 2]    1     addw sp,#VSIZE 
      008D09 A6 0A            [ 1] 2070 	ld a,#TK_QSTR  
      008D0B 81               [ 4] 2071 	ret 
                                   2072 
                                   2073 ;---------------------------------------
                                   2074 ; called by parse_quote
                                   2075 ; subtitute escaped character 
                                   2076 ; by their ASCII value .
                                   2077 ; input:
                                   2078 ;   A  character following '\'
                                   2079 ; output:
                                   2080 ;   A  substitued char or same if not valid.
                                   2081 ;---------------------------------------
      008D0C                       2082 convert_escape:
      008D0C 89               [ 2] 2083 	pushw x 
      008D0D AE 8D 21         [ 2] 2084 	ldw x,#escaped 
      008D10 F1               [ 1] 2085 1$:	cp a,(x)
      008D11 27 06            [ 1] 2086 	jreq 2$
      008D13 7D               [ 1] 2087 	tnz (x)
      008D14 27 09            [ 1] 2088 	jreq 3$
      008D16 5C               [ 2] 2089 	incw x 
      008D17 20 F7            [ 2] 2090 	jra 1$
      008D19 1D 8D 21         [ 2] 2091 2$: subw x,#escaped 
      008D1C 9F               [ 1] 2092 	ld a,xl 
      008D1D AB 07            [ 1] 2093 	add a,#7
      008D1F 85               [ 2] 2094 3$:	popw x 
      008D20 81               [ 4] 2095 	ret 
                                   2096 
      008D21 61 62 74 6E 76 66 72  2097 escaped: .asciz "abtnvfr"
             00
                                   2098 
                                   2099 ;-------------------------
                                   2100 ; integer parser 
                                   2101 ; input:
                                   2102 ;   X 		point to pad 
                                   2103 ;   Y 		point to tib 
                                   2104 ;   A 	    first digit|'$' 
                                   2105 ; output:  
                                   2106 ;   pad     number string 
                                   2107 ;   X 		integer 
                                   2108 ;   A 		TK_INTGR
                                   2109 ;-------------------------
                           000001  2110 	BASE=1
                           000002  2111 	TCHAR=2 
                           000002  2112 	VSIZE=2 
      008D29                       2113 parse_integer: ; { -- n }
      008D29 4B 00            [ 1] 2114 	push #0 ; TCHAR 
      008D2B A1 24            [ 1] 2115 	cp a,#'$
      008D2D 27 04            [ 1] 2116 	jreq 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008D2F 4B 0A            [ 1] 2117 	push #10 ; BASE=10 
      008D31 20 02            [ 2] 2118 	jra 2$ 
      008D33 4B 10            [ 1] 2119 1$: push #16  ; BASE=16
      008D35 F7               [ 1] 2120 2$:	ld (x),a 
      008D36 5C               [ 2] 2121 	incw x 
      008D37 72 5C 00 02      [ 1] 2122 	inc in 
      008D3B 91 D6 01         [ 4] 2123 	ld a,([in.w],y)
      008D3E CD 8F 87         [ 4] 2124 	call to_upper 
      008D41 6B 02            [ 1] 2125 	ld (TCHAR,sp),a 
      008D43 CD 8F 7E         [ 4] 2126 	call is_digit 
      008D46 25 ED            [ 1] 2127 	jrc 2$
      008D48 A6 10            [ 1] 2128 	ld a,#16 
      008D4A 11 01            [ 1] 2129 	cp a,(BASE,sp)
      008D4C 26 0A            [ 1] 2130 	jrne 3$ 
      008D4E 7B 02            [ 1] 2131 	ld a,(TCHAR,sp)
      008D50 A1 41            [ 1] 2132 	cp a,#'A 
      008D52 2B 04            [ 1] 2133 	jrmi 3$ 
      008D54 A1 47            [ 1] 2134 	cp a,#'G 
      008D56 2B DD            [ 1] 2135 	jrmi 2$ 
      008D58 7F               [ 1] 2136 3$:	clr (x)
      008D59 CD 8F 93         [ 4] 2137 	call atoi24
      008D5C CE 00 09         [ 2] 2138 	ldw x,acc16 
      008D5F A6 04            [ 1] 2139 	ld a,#TK_INTGR
      000CE1                       2140 	_drop VSIZE  
      008D61 5B 02            [ 2]    1     addw sp,#VSIZE 
      008D63 81               [ 4] 2141 	ret 	
                                   2142 
                                   2143 ;-------------------------
                                   2144 ; binary integer parser 
                                   2145 ; input:
                                   2146 ;   X 		point to pad 
                                   2147 ;   Y 		point to tib 
                                   2148 ;   A 	    '%' 
                                   2149 ; output:  
                                   2150 ;   pad     number string 
                                   2151 ;   X 		integer 
                                   2152 ;   A 		TK_INTGR
                                   2153 ;   TOS     integer 
                                   2154 ;-------------------------
                           000001  2155 	BINARY=1
                           000002  2156 	VSIZE=2
      008D64                       2157 parse_binary: ; { -- n }
      008D64 4B 00            [ 1] 2158 	push #0
      008D66 4B 00            [ 1] 2159 	push #0
      008D68 F7               [ 1] 2160 1$: ld (x),a 
      008D69 5C               [ 2] 2161 	incw x 
      008D6A 72 5C 00 02      [ 1] 2162 	inc in 
      008D6E 91 D6 01         [ 4] 2163 	ld a,([in.w],y)
      008D71 A1 30            [ 1] 2164 	cp a,#'0 
      008D73 27 06            [ 1] 2165 	jreq 2$
      008D75 A1 31            [ 1] 2166 	cp a,#'1 
      008D77 27 02            [ 1] 2167 	jreq 2$ 
      008D79 20 09            [ 2] 2168 	jra bin_exit 
      008D7B A0 30            [ 1] 2169 2$: sub a,#'0	
      008D7D 46               [ 1] 2170 	rrc a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008D7E 09 02            [ 1] 2171 	rlc (BINARY+1,sp)
      008D80 09 01            [ 1] 2172 	rlc (BINARY,sp)
      008D82 20 E4            [ 2] 2173 	jra 1$  
      008D84                       2174 bin_exit:
      008D84 7F               [ 1] 2175 	clr (x)
      008D85 1E 01            [ 2] 2176 	ldw x,(BINARY,sp)
      008D87 A6 04            [ 1] 2177 	ld a,#TK_INTGR 	
      000D09                       2178 	_drop VSIZE 
      008D89 5B 02            [ 2]    1     addw sp,#VSIZE 
      008D8B 81               [ 4] 2179 	ret
                                   2180 
                                   2181 ;---------------------------
                                   2182 ;  token begin with a letter,
                                   2183 ;  is keyword or variable. 	
                                   2184 ; input:
                                   2185 ;   X 		point to pad 
                                   2186 ;   Y 		point to text
                                   2187 ;   A 	    first letter  
                                   2188 ; output:
                                   2189 ;   X		exec_addr|var_addr 
                                   2190 ;   A 		TK_CMD 
                                   2191 ;   pad 	keyword|var_name  
                                   2192 ;   TOS     exec_addr|var_addr 
                                   2193 ;--------------------------  
      008D8C                       2194 parse_keyword: ; { -- exec_addr|var_addr}
      008D8C CD 8F 87         [ 4] 2195 	call to_upper 
      008D8F F7               [ 1] 2196 	ld (x),a 
      008D90 5C               [ 2] 2197 	incw x 
      008D91 72 5C 00 02      [ 1] 2198 	inc in 
      008D95 91 D6 01         [ 4] 2199 	ld a,([in.w],y)
      008D98 CD 85 89         [ 4] 2200 	call is_alpha 
      008D9B 25 EF            [ 1] 2201 	jrc parse_keyword 
      008D9D 7F               [ 1] 2202 1$: clr (x)
      008D9E 72 5D 17 19      [ 1] 2203 	tnz pad+1 
      008DA2 26 15            [ 1] 2204 	jrne 2$
                                   2205 ; one letter variable name 
      008DA4 C6 17 18         [ 1] 2206 	ld a,pad 
      008DA7 A0 41            [ 1] 2207 	sub a,#'A 
      008DA9 48               [ 1] 2208 	sll a 
      008DAA 88               [ 1] 2209 	push a 
      008DAB 4B 00            [ 1] 2210 	push #0
      008DAD AE 00 24         [ 2] 2211 	ldw x,#vars 
      008DB0 72 FB 01         [ 2] 2212 	addw x,(1,sp) ; X=var address 
      000D33                       2213 	_drop 2 
      008DB3 5B 02            [ 2]    1     addw sp,#2 
      008DB5 A6 05            [ 1] 2214 	ld a,#TK_VAR 
      008DB7 20 0C            [ 2] 2215 	jra 4$ 
      008DB9                       2216 2$: ; check for keyword, otherwise syntax error.
      000D39                       2217 	_ldx_dict kword_dict
      008DB9 AE A5 AD         [ 2]    1     ldw x,#kword_dict+2
      008DBC CD 92 23         [ 4] 2218 	call search_dict
      008DBF 4D               [ 1] 2219 	tnz a
      008DC0 26 03            [ 1] 2220 	jrne 4$ 
      008DC2 CC 87 FF         [ 2] 2221 	jp syntax_error
      008DC5 81               [ 4] 2222 4$:	ret  	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2223 
                                   2224 
                                   2225 ;------------------------------------
                                   2226 ; Command line tokenizer
                                   2227 ; scan text for next token
                                   2228 ; move token in 'pad'
                                   2229 ; input: 
      008DC6                       2230 	none: 
                                   2231 ; use:
                                   2232 ;	Y   pointer to text
                                   2233 ;   X	pointer to pad 
                                   2234 ;   in.w   index in text buffer
                                   2235 ; output:
                                   2236 ;   A       token attribute 
                                   2237 ;   pad 	token as .asciz
                                   2238 ;   X 		token value   
                                   2239 ;------------------------------------
                                   2240 	; use to check special character 
                                   2241 	.macro _case c t  
                                   2242 	ld a,#c 
                                   2243 	cp a,(TCHAR,sp) 
                                   2244 	jrne t
                                   2245 	.endm 
                                   2246 
                           000001  2247 	TCHAR=1
                           000002  2248 	ATTRIB=2 
                           000002  2249 	VSIZE=2
      008DC6                       2250 get_token: 
      008DC6 90 AE 16 C8      [ 2] 2251 	ldw y,#tib    	
      008DCA C6 00 02         [ 1] 2252 	ld a,in 
      008DCD C1 00 04         [ 1] 2253 	cp a,count 
      008DD0 2B 03            [ 1] 2254 	jrmi 1$
      008DD2 A6 00            [ 1] 2255 	ld a,#TK_NONE 
      008DD4 81               [ 4] 2256 	ret 
      008DD5                       2257 1$:	
      000D55                       2258 	_vars VSIZE
      008DD5 52 02            [ 2]    1     sub sp,#VSIZE 
      008DD7 AE 17 18         [ 2] 2259 	ldw x, #pad
      008DDA A6 20            [ 1] 2260 	ld a,#SPACE
      008DDC CD 90 3F         [ 4] 2261 	call skip
      008DDF 55 00 02 00 03   [ 1] 2262 	mov in.saved,in 
      008DE4 91 D6 01         [ 4] 2263 	ld a,([in.w],y)
      008DE7 26 07            [ 1] 2264 	jrne str_tst
      008DE9 72 5F 17 18      [ 1] 2265 	clr pad 
      008DED CC 8F 7B         [ 2] 2266 	jp token_exit ; end of line 
                                   2267 
      008DF0                       2268 str_tst: ; check for quoted string  	
      008DF0 CD 8F 87         [ 4] 2269 	call to_upper 
      008DF3 6B 01            [ 1] 2270 	ld (TCHAR,sp),a 
      000D75                       2271 	_case '"' nbr_tst
      008DF5 A6 22            [ 1]    1 	ld a,#'"' 
      008DF7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF9 26 06            [ 1]    3 	jrne nbr_tst
      008DFB CD 8C D1         [ 4] 2272 	call parse_quote
      008DFE CC 8F 7B         [ 2] 2273 	jp token_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008E01                       2274 nbr_tst: ; check for number 
      008E01 A6 24            [ 1] 2275 	ld a,#'$'
      008E03 11 01            [ 1] 2276 	cp a,(TCHAR,sp) 
      008E05 27 13            [ 1] 2277 	jreq 1$
      008E07 A6 26            [ 1] 2278 	ld a,#'&
      008E09 11 01            [ 1] 2279 	cp a,(TCHAR,sp)
      008E0B 26 06            [ 1] 2280 	jrne 0$
      008E0D CD 8D 64         [ 4] 2281 	call parse_binary ; expect binary integer 
      008E10 CC 8F 7B         [ 2] 2282 	jp token_exit 
      008E13 7B 01            [ 1] 2283 0$:	ld a,(TCHAR,sp)
      008E15 CD 8F 7E         [ 4] 2284 	call is_digit
      008E18 24 06            [ 1] 2285 	jrnc 3$
      008E1A CD 8D 29         [ 4] 2286 1$:	call parse_integer 
      008E1D CC 8F 7B         [ 2] 2287 	jp token_exit 
      008E20                       2288 3$: 
      000DA0                       2289 	_case '(' bkslsh_tst 
      008E20 A6 28            [ 1]    1 	ld a,#'(' 
      008E22 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E24 26 05            [ 1]    3 	jrne bkslsh_tst
      008E26 A6 0B            [ 1] 2290 	ld a,#TK_LPAREN
      008E28 CC 8F 6B         [ 2] 2291 	jp token_char   	
      008E2B                       2292 bkslsh_tst:
      000DAB                       2293 	_case '\',rparnt_tst
      008E2B A6 5C            [ 1]    1 	ld a,#'\' 
      008E2D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E2F 26 18            [ 1]    3 	jrne rparnt_tst
      008E31 7B 01            [ 1] 2294 	ld a,(TCHAR,sp)
      008E33 F7               [ 1] 2295 	ld (x),a 
      008E34 5C               [ 2] 2296 	incw x 
      008E35 72 5C 00 02      [ 1] 2297 	inc in 
      008E39 91 D6 01         [ 4] 2298 	ld a,([in.w],y)
      008E3C F7               [ 1] 2299 	ld (x),a 
      008E3D 5C               [ 2] 2300 	incw x 
      008E3E 72 5C 00 02      [ 1] 2301 	inc in  
      008E42 7F               [ 1] 2302 	clr (x) 
      008E43 97               [ 1] 2303 	ld xl,a 
      008E44 A6 03            [ 1] 2304 	ld a,#TK_CHAR 
      008E46 CC 8F 7B         [ 2] 2305 	jp token_exit 
      008E49                       2306 rparnt_tst:		
      000DC9                       2307 	_case ')' colon_tst 
      008E49 A6 29            [ 1]    1 	ld a,#')' 
      008E4B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E4D 26 05            [ 1]    3 	jrne colon_tst
      008E4F A6 0C            [ 1] 2308 	ld a,#TK_RPAREN 
      008E51 CC 8F 6B         [ 2] 2309 	jp token_char 
      008E54                       2310 colon_tst:
      000DD4                       2311 	_case ':' comma_tst 
      008E54 A6 3A            [ 1]    1 	ld a,#':' 
      008E56 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E58 26 05            [ 1]    3 	jrne comma_tst
      008E5A A6 01            [ 1] 2312 	ld a,#TK_COLON 
      008E5C CC 8F 6B         [ 2] 2313 	jp token_char 
      008E5F                       2314 comma_tst:
      000DDF                       2315 	_case COMMA sharp_tst 
      008E5F A6 2C            [ 1]    1 	ld a,#COMMA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008E61 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E63 26 05            [ 1]    3 	jrne sharp_tst
      008E65 A6 0D            [ 1] 2316 	ld a,#TK_COMMA
      008E67 CC 8F 6B         [ 2] 2317 	jp token_char
      008E6A                       2318 sharp_tst:
      000DEA                       2319 	_case SHARP dash_tst 
      008E6A A6 23            [ 1]    1 	ld a,#SHARP 
      008E6C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E6E 26 05            [ 1]    3 	jrne dash_tst
      008E70 A6 0E            [ 1] 2320 	ld a,#TK_SHARP
      008E72 CC 8F 6B         [ 2] 2321 	jp token_char  	 	 
      008E75                       2322 dash_tst: 	
      000DF5                       2323 	_case '-' at_tst 
      008E75 A6 2D            [ 1]    1 	ld a,#'-' 
      008E77 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E79 26 05            [ 1]    3 	jrne at_tst
      008E7B A6 11            [ 1] 2324 	ld a,#TK_MINUS  
      008E7D CC 8F 6B         [ 2] 2325 	jp token_char 
      008E80                       2326 at_tst:
      000E00                       2327 	_case '@' qmark_tst 
      008E80 A6 40            [ 1]    1 	ld a,#'@' 
      008E82 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E84 26 05            [ 1]    3 	jrne qmark_tst
      008E86 A6 02            [ 1] 2328 	ld a,#TK_ARRAY 
      008E88 CC 8F 6B         [ 2] 2329 	jp token_char
      008E8B                       2330 qmark_tst:
      000E0B                       2331 	_case '?' tick_tst 
      008E8B A6 3F            [ 1]    1 	ld a,#'?' 
      008E8D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E8F 26 11            [ 1]    3 	jrne tick_tst
      008E91 7B 01            [ 1] 2332 	ld a,(TCHAR,sp)
      008E93 F7               [ 1] 2333 	ld (x),a 
      008E94 5C               [ 2] 2334 	incw x 
      008E95 7F               [ 1] 2335 	clr (x)
      008E96 72 5C 00 02      [ 1] 2336 	inc in 
      008E9A A6 06            [ 1] 2337 	ld a,#TK_CMD 
      008E9C AE 96 D6         [ 2] 2338 	ldw x,#print 
      008E9F CC 8F 7B         [ 2] 2339 	jp token_exit
      008EA2                       2340 tick_tst: ; ignore comment 
      000E22                       2341 	_case TICK plus_tst 
      008EA2 A6 27            [ 1]    1 	ld a,#TICK 
      008EA4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EA6 26 0C            [ 1]    3 	jrne plus_tst
      008EA8 72 5C 00 02      [ 1] 2342 	inc in 
      008EAC A6 06            [ 1] 2343 	ld a,#TK_CMD 
      008EAE AE 97 DB         [ 2] 2344 	ldw x,#rem 
      008EB1 CC 8F 7B         [ 2] 2345 	jp token_exit 
      008EB4                       2346 plus_tst:
      000E34                       2347 	_case '+' star_tst 
      008EB4 A6 2B            [ 1]    1 	ld a,#'+' 
      008EB6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EB8 26 05            [ 1]    3 	jrne star_tst
      008EBA A6 10            [ 1] 2348 	ld a,#TK_PLUS  
      008EBC CC 8F 6B         [ 2] 2349 	jp token_char 
      008EBF                       2350 star_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      000E3F                       2351 	_case '*' slash_tst 
      008EBF A6 2A            [ 1]    1 	ld a,#'*' 
      008EC1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EC3 26 05            [ 1]    3 	jrne slash_tst
      008EC5 A6 20            [ 1] 2352 	ld a,#TK_MULT 
      008EC7 CC 8F 6B         [ 2] 2353 	jp token_char 
      008ECA                       2354 slash_tst: 
      000E4A                       2355 	_case '/' prcnt_tst 
      008ECA A6 2F            [ 1]    1 	ld a,#'/' 
      008ECC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008ECE 26 05            [ 1]    3 	jrne prcnt_tst
      008ED0 A6 21            [ 1] 2356 	ld a,#TK_DIV 
      008ED2 CC 8F 6B         [ 2] 2357 	jp token_char 
      008ED5                       2358 prcnt_tst:
      000E55                       2359 	_case '%' eql_tst 
      008ED5 A6 25            [ 1]    1 	ld a,#'%' 
      008ED7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008ED9 26 05            [ 1]    3 	jrne eql_tst
      008EDB A6 22            [ 1] 2360 	ld a,#TK_MOD
      008EDD CC 8F 6B         [ 2] 2361 	jp token_char  
                                   2362 ; 1 or 2 character tokens 	
      008EE0                       2363 eql_tst:
      000E60                       2364 	_case '=' gt_tst 		
      008EE0 A6 3D            [ 1]    1 	ld a,#'=' 
      008EE2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EE4 26 05            [ 1]    3 	jrne gt_tst
      008EE6 A6 32            [ 1] 2365 	ld a,#TK_EQUAL
      008EE8 CC 8F 6B         [ 2] 2366 	jp token_char 
      008EEB                       2367 gt_tst:
      000E6B                       2368 	_case '>' lt_tst 
      008EEB A6 3E            [ 1]    1 	ld a,#'>' 
      008EED 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EEF 26 33            [ 1]    3 	jrne lt_tst
      008EF1 A6 31            [ 1] 2369 	ld a,#TK_GT 
      008EF3 6B 02            [ 1] 2370 	ld (ATTRIB,sp),a 
      008EF5 72 5C 00 02      [ 1] 2371 	inc in 
      008EF9 91 D6 01         [ 4] 2372 	ld a,([in.w],y)
      008EFC A1 3D            [ 1] 2373 	cp a,#'=
      008EFE 26 0C            [ 1] 2374 	jrne 1$
      008F00 7B 01            [ 1] 2375 	ld a,(TCHAR,sp)
      008F02 F7               [ 1] 2376 	ld (x),a
      008F03 5C               [ 2] 2377 	incw x 
      008F04 A6 3D            [ 1] 2378 	ld a,#'=
      008F06 6B 01            [ 1] 2379 	ld (TCHAR,sp),a 
      008F08 A6 33            [ 1] 2380 	ld a,#TK_GE 
      008F0A 20 5F            [ 2] 2381 	jra token_char  
      008F0C A1 3C            [ 1] 2382 1$: cp a,#'<
      008F0E 26 0C            [ 1] 2383 	jrne 2$
      008F10 7B 01            [ 1] 2384 	ld a,(TCHAR,sp)
      008F12 F7               [ 1] 2385 	ld (x),a
      008F13 5C               [ 2] 2386 	incw x 
      008F14 A6 3C            [ 1] 2387 	ld a,#'<	
      008F16 6B 01            [ 1] 2388 	ld (TCHAR,sp),a 
      008F18 A6 35            [ 1] 2389 	ld a,#TK_NE 
      008F1A 20 4F            [ 2] 2390 	jra token_char 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008F1C 72 5A 00 02      [ 1] 2391 2$: dec in
      008F20 7B 02            [ 1] 2392 	ld a,(ATTRIB,sp)
      008F22 20 47            [ 2] 2393 	jra token_char 
      008F24                       2394 lt_tst:
      000EA4                       2395 	_case '<' other
      008F24 A6 3C            [ 1]    1 	ld a,#'<' 
      008F26 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F28 26 32            [ 1]    3 	jrne other
      008F2A A6 34            [ 1] 2396 	ld a,#TK_LT 
      008F2C 6B 02            [ 1] 2397 	ld (ATTRIB,sp),a 
      008F2E 72 5C 00 02      [ 1] 2398 	inc in 
      008F32 91 D6 01         [ 4] 2399 	ld a,([in.w],y)
      008F35 A1 3D            [ 1] 2400 	cp a,#'=
      008F37 26 0B            [ 1] 2401 	jrne 1$
      008F39 7B 01            [ 1] 2402 	ld a,(TCHAR,sp)
      008F3B F7               [ 1] 2403 	ld (x),a 
      008F3C A6 3D            [ 1] 2404 	ld a,#'=
      008F3E 6B 01            [ 1] 2405 	ld (TCHAR,sp),a 
      008F40 A6 36            [ 1] 2406 	ld a,#TK_LE 
      008F42 20 27            [ 2] 2407 	jra token_char 
      008F44 A1 3E            [ 1] 2408 1$: cp a,#'>
      008F46 26 0C            [ 1] 2409 	jrne 2$
      008F48 7B 01            [ 1] 2410 	ld a,(TCHAR,sp)
      008F4A F7               [ 1] 2411 	ld (x),a 
      008F4B 5C               [ 2] 2412 	incw x 
      008F4C A6 3E            [ 1] 2413 	ld a,#'>
      008F4E 6B 01            [ 1] 2414 	ld (TCHAR,sp),a 
      008F50 A6 35            [ 1] 2415 	ld a,#TK_NE 
      008F52 20 17            [ 2] 2416 	jra token_char 
      008F54 72 5A 00 02      [ 1] 2417 2$: dec in 
      008F58 7B 02            [ 1] 2418 	ld a,(ATTRIB,sp)
      008F5A 20 0F            [ 2] 2419 	jra token_char 	
      008F5C                       2420 other: ; not a special character 	 
      008F5C 7B 01            [ 1] 2421 	ld a,(TCHAR,sp)
      008F5E CD 85 89         [ 4] 2422 	call is_alpha 
      008F61 25 03            [ 1] 2423 	jrc 30$ 
      008F63 CC 87 FF         [ 2] 2424 	jp syntax_error 
      008F66                       2425 30$: 
      008F66 CD 8D 8C         [ 4] 2426 	call parse_keyword
      008F69 20 10            [ 2] 2427 	jra token_exit 
      008F6B                       2428 token_char:
      008F6B 6B 02            [ 1] 2429 	ld (ATTRIB,sp),a 
      008F6D 7B 01            [ 1] 2430 	ld a,(TCHAR,sp)
      008F6F F7               [ 1] 2431 	ld (x),a 
      008F70 5C               [ 2] 2432 	incw x 
      008F71 7F               [ 1] 2433 	clr(x)
      008F72 72 5C 00 02      [ 1] 2434 	inc in 
      008F76 7B 02            [ 1] 2435 	ld a,(ATTRIB,sp)
      008F78 AE 17 18         [ 2] 2436 	ldw x,#pad 
      008F7B                       2437 token_exit:
      000EFB                       2438 	_drop VSIZE 
      008F7B 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F7D 81               [ 4] 2439 	ret
                                   2440 
                                   2441 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2442 
                                   2443 ;------------------------------------
                                   2444 ; check if character in {'0'..'9'}
                                   2445 ; input:
                                   2446 ;    A  character to test
                                   2447 ; output:
                                   2448 ;    Carry  0 not digit | 1 digit
                                   2449 ;------------------------------------
      008F7E                       2450 is_digit:
      008F7E A1 30            [ 1] 2451 	cp a,#'0
      008F80 25 03            [ 1] 2452 	jrc 1$
      008F82 A1 3A            [ 1] 2453     cp a,#'9+1
      008F84 8C               [ 1] 2454 	ccf 
      008F85 8C               [ 1] 2455 1$:	ccf 
      008F86 81               [ 4] 2456     ret
                                   2457 
                                   2458 ;------------------------------------
                                   2459 ; convert alpha to uppercase
                                   2460 ; input:
                                   2461 ;    a  character to convert
                                   2462 ; output:
                                   2463 ;    a  uppercase character
                                   2464 ;------------------------------------
      008F87                       2465 to_upper::
      008F87 A1 61            [ 1] 2466 	cp a,#'a
      008F89 2A 01            [ 1] 2467 	jrpl 1$
      008F8B 81               [ 4] 2468 0$:	ret
      008F8C A1 7A            [ 1] 2469 1$: cp a,#'z	
      008F8E 22 FB            [ 1] 2470 	jrugt 0$
      008F90 A0 20            [ 1] 2471 	sub a,#32
      008F92 81               [ 4] 2472 	ret
                                   2473 	
                                   2474 ;------------------------------------
                                   2475 ; convert pad content in integer
                                   2476 ; input:
                                   2477 ;    pad		.asciz to convert
                                   2478 ; output:
                                   2479 ;    acc24      int24_t
                                   2480 ;------------------------------------
                                   2481 	; local variables
                           000001  2482 	SIGN=1 ; 1 byte, 
                           000002  2483 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2484 	TEMP=3 ; 1 byte, temporary storage
                           000003  2485 	VSIZE=3 ; 3 bytes reserved for local storage
      008F93                       2486 atoi24:
      008F93 89               [ 2] 2487 	pushw x ;save x
      008F94 52 03            [ 2] 2488 	sub sp,#VSIZE
                                   2489 	; acc24=0 
      008F96 72 5F 00 08      [ 1] 2490 	clr acc24    
      008F9A 72 5F 00 09      [ 1] 2491 	clr acc16
      008F9E 72 5F 00 0A      [ 1] 2492 	clr acc8 
      008FA2 C6 17 18         [ 1] 2493 	ld a, pad 
      008FA5 27 5A            [ 1] 2494 	jreq atoi_exit
      008FA7 0F 01            [ 1] 2495 	clr (SIGN,sp)
      008FA9 A6 0A            [ 1] 2496 	ld a,#10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008FAB 6B 02            [ 1] 2497 	ld (BASE,sp),a ; default base decimal
      008FAD AE 17 18         [ 2] 2498 	ldw x,#pad ; pointer to string to convert
      008FB0 F6               [ 1] 2499 	ld a,(x)
      008FB1 27 47            [ 1] 2500 	jreq 9$  ; completed if 0
      008FB3 A1 2D            [ 1] 2501 	cp a,#'-
      008FB5 26 04            [ 1] 2502 	jrne 1$
      008FB7 03 01            [ 1] 2503 	cpl (SIGN,sp)
      008FB9 20 08            [ 2] 2504 	jra 2$
      008FBB A1 24            [ 1] 2505 1$: cp a,#'$
      008FBD 26 06            [ 1] 2506 	jrne 3$
      008FBF A6 10            [ 1] 2507 	ld a,#16
      008FC1 6B 02            [ 1] 2508 	ld (BASE,sp),a
      008FC3 5C               [ 2] 2509 2$:	incw x
      008FC4 F6               [ 1] 2510 	ld a,(x)
      008FC5                       2511 3$:	
      008FC5 A1 61            [ 1] 2512 	cp a,#'a
      008FC7 2B 02            [ 1] 2513 	jrmi 4$
      008FC9 A0 20            [ 1] 2514 	sub a,#32
      008FCB A1 30            [ 1] 2515 4$:	cp a,#'0
      008FCD 2B 2B            [ 1] 2516 	jrmi 9$
      008FCF A0 30            [ 1] 2517 	sub a,#'0
      008FD1 A1 0A            [ 1] 2518 	cp a,#10
      008FD3 2B 06            [ 1] 2519 	jrmi 5$
      008FD5 A0 07            [ 1] 2520 	sub a,#7
      008FD7 11 02            [ 1] 2521 	cp a,(BASE,sp)
      008FD9 2A 1F            [ 1] 2522 	jrpl 9$
      008FDB 6B 03            [ 1] 2523 5$:	ld (TEMP,sp),a
      008FDD 7B 02            [ 1] 2524 	ld a,(BASE,sp)
      008FDF CD 90 05         [ 4] 2525 	call mulu24_8
      008FE2 7B 03            [ 1] 2526 	ld a,(TEMP,sp)
      008FE4 CB 00 0A         [ 1] 2527 	add a,acc24+2
      008FE7 C7 00 0A         [ 1] 2528 	ld acc24+2,a
      008FEA 4F               [ 1] 2529 	clr a
      008FEB C9 00 09         [ 1] 2530 	adc a,acc24+1
      008FEE C7 00 09         [ 1] 2531 	ld acc24+1,a
      008FF1 4F               [ 1] 2532 	clr a
      008FF2 C9 00 08         [ 1] 2533 	adc a,acc24
      008FF5 C7 00 08         [ 1] 2534 	ld acc24,a
      008FF8 20 C9            [ 2] 2535 	jra 2$
      008FFA 0D 01            [ 1] 2536 9$:	tnz (SIGN,sp)
      008FFC 27 03            [ 1] 2537     jreq atoi_exit
      008FFE CD 8B 2A         [ 4] 2538     call neg_acc24
      009001                       2539 atoi_exit: 
      009001 5B 03            [ 2] 2540 	addw sp,#VSIZE
      009003 85               [ 2] 2541 	popw x ; restore x
      009004 81               [ 4] 2542 	ret
                                   2543 
                                   2544 ;--------------------------------------
                                   2545 ; unsigned multiply uint24_t by uint8_t
                                   2546 ; use to convert numerical string to uint24_t
                                   2547 ; input:
                                   2548 ;	acc24	uint24_t 
                                   2549 ;   A		uint8_t
                                   2550 ; output:
                                   2551 ;   acc24   A*acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2552 ;-------------------------------------
                                   2553 ; local variables offset  on sp
                           000003  2554 	U8   = 3   ; A pushed on stack
                           000002  2555 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2556 	OVFH = 1  ; multiplication overflow high byte
                           000003  2557 	VSIZE = 3
      009005                       2558 mulu24_8:
      009005 89               [ 2] 2559 	pushw x    ; save X
                                   2560 	; local variables
      009006 88               [ 1] 2561 	push a     ; U8
      009007 5F               [ 1] 2562 	clrw x     ; initialize overflow to 0
      009008 89               [ 2] 2563 	pushw x    ; multiplication overflow
                                   2564 ; multiply low byte.
      009009 C6 00 0A         [ 1] 2565 	ld a,acc24+2
      00900C 97               [ 1] 2566 	ld xl,a
      00900D 7B 03            [ 1] 2567 	ld a,(U8,sp)
      00900F 42               [ 4] 2568 	mul x,a
      009010 9F               [ 1] 2569 	ld a,xl
      009011 C7 00 0A         [ 1] 2570 	ld acc24+2,a
      009014 9E               [ 1] 2571 	ld a, xh
      009015 6B 02            [ 1] 2572 	ld (OVFL,sp),a
                                   2573 ; multipy middle byte
      009017 C6 00 09         [ 1] 2574 	ld a,acc24+1
      00901A 97               [ 1] 2575 	ld xl,a
      00901B 7B 03            [ 1] 2576 	ld a, (U8,sp)
      00901D 42               [ 4] 2577 	mul x,a
                                   2578 ; add overflow to this partial product
      00901E 72 FB 01         [ 2] 2579 	addw x,(OVFH,sp)
      009021 9F               [ 1] 2580 	ld a,xl
      009022 C7 00 09         [ 1] 2581 	ld acc24+1,a
      009025 4F               [ 1] 2582 	clr a
      009026 A9 00            [ 1] 2583 	adc a,#0
      009028 6B 01            [ 1] 2584 	ld (OVFH,sp),a
      00902A 9E               [ 1] 2585 	ld a,xh
      00902B 6B 02            [ 1] 2586 	ld (OVFL,sp),a
                                   2587 ; multiply most signficant byte	
      00902D C6 00 08         [ 1] 2588 	ld a, acc24
      009030 97               [ 1] 2589 	ld xl, a
      009031 7B 03            [ 1] 2590 	ld a, (U8,sp)
      009033 42               [ 4] 2591 	mul x,a
      009034 72 FB 01         [ 2] 2592 	addw x, (OVFH,sp)
      009037 9F               [ 1] 2593 	ld a, xl
      009038 C7 00 08         [ 1] 2594 	ld acc24,a
      00903B 5B 03            [ 2] 2595     addw sp,#VSIZE
      00903D 85               [ 2] 2596 	popw x
      00903E 81               [ 4] 2597 	ret
                                   2598 
                                   2599 ;------------------------------------
                                   2600 ; skip character c in text starting from 'in'
                                   2601 ; input:
                                   2602 ;	 y 		point to text buffer
                                   2603 ;    a 		character to skip
                                   2604 ; output:  
                                   2605 ;	'in' ajusted to new position
                                   2606 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                           000001  2607 	C = 1 ; local var
      00903F                       2608 skip:
      00903F 88               [ 1] 2609 	push a
      009040 91 D6 01         [ 4] 2610 1$:	ld a,([in.w],y)
      009043 27 0A            [ 1] 2611 	jreq 2$
      009045 11 01            [ 1] 2612 	cp a,(C,sp)
      009047 26 06            [ 1] 2613 	jrne 2$
      009049 72 5C 00 02      [ 1] 2614 	inc in
      00904D 20 F1            [ 2] 2615 	jra 1$
      000FCF                       2616 2$: _drop 1 
      00904F 5B 01            [ 2]    1     addw sp,#1 
      009051 81               [ 4] 2617 	ret
                                   2618 	
                                   2619 ;------------------------------
                                   2620 ; restore 'in.w' variable to 
                                   2621 ; its value before last call
                                   2622 ; to get_token.
                                   2623 ;------------------------------
      009052                       2624 unget_token:
      009052 55 00 03 00 02   [ 1] 2625 	mov in,in.saved
      009057 81               [ 4] 2626 	ret 
                                   2627 
                                   2628 
                                   2629 ;******************************
                                   2630 ;  data stack manipulation
                                   2631 ;*****************************
                                   2632 ;----------------------	
                                   2633 ; push X on data stack 
                                   2634 ; input:
                                   2635 ;	X 
                                   2636 ; output:
                                   2637 ;	none 
                                   2638 ;----------------------	
      009058                       2639 dpush:
      000FD8                       2640     _dp_down
      009058 72 5A 00 1A      [ 1]    1     dec dstkptr+1 
      00905C 72 5A 00 1A      [ 1]    2     dec dstkptr+1
      009060 72 CF 00 19      [ 5] 2641     ldw [dstkptr],x  
      009064 81               [ 4] 2642 	ret 
                                   2643 
                                   2644 
                                   2645 ;----------------------	
                                   2646 ; pop data stack in X 
                                   2647 ; input:
                                   2648 ;	none
                                   2649 ; output:
                                   2650 ;	X   
                                   2651 ;----------------------	
      009065                       2652 dpop: 
      009065 72 CE 00 19      [ 5] 2653     ldw x, [dstkptr]
      000FE9                       2654 	_dp_up
      009069 72 5C 00 1A      [ 1]    1     inc dstkptr+1
      00906D 72 5C 00 1A      [ 1]    2     inc dstkptr+1
      009071 81               [ 4] 2655 	ret 
                                   2656 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2657 ;-----------------------------
                                   2658 ; swap top 2 elements of dstack
                                   2659 ;  {n1 n2 -- n2 n1 }
                                   2660 ;-----------------------------
      009072                       2661 dswap:
      009072 72 CE 00 19      [ 5] 2662 	ldw x,[dstkptr]
      009076 89               [ 2] 2663 	pushw x 
      009077 AE 00 02         [ 2] 2664 	ldw x,#2 
      00907A 72 DE 00 19      [ 5] 2665 	ldw x,([dstkptr],x) 
      00907E 72 CF 00 19      [ 5] 2666 	ldw [dstkptr],x 
      009082 AE 00 02         [ 2] 2667 	ldw x,#2
      009085 90 85            [ 2] 2668 	popw y 
      009087 72 DF 00 19      [ 5] 2669 	ldw ([dstkptr],x),y 
      00908B 81               [ 4] 2670 	ret
                                   2671 
                                   2672 ;-----------------------------
                                   2673 ; drop TOS 
                                   2674 ;-----------------------------
      00908C                       2675 ddrop: ; { n -- }
      00100C                       2676 	_dp_up 
      00908C 72 5C 00 1A      [ 1]    1     inc dstkptr+1
      009090 72 5C 00 1A      [ 1]    2     inc dstkptr+1
      009094 81               [ 4] 2677 	ret
                                   2678 	
                                   2679 ;-----------------------------
                                   2680 ; duplicate TOS 
                                   2681 ;  dstack: { ix...n -- ix...n n }
                                   2682 ;-----------------------------
      009095                       2683 ddup:
      009095 72 CE 00 19      [ 5] 2684 	ldw x,[dstkptr]
      001019                       2685 	_dp_down
      009099 72 5A 00 1A      [ 1]    1     dec dstkptr+1 
      00909D 72 5A 00 1A      [ 1]    2     dec dstkptr+1
      0090A1 72 CF 00 19      [ 5] 2686     ldw [dstkptr],x  
      0090A5 81               [ 4] 2687 	ret 
                                   2688 
                                   2689 
                                   2690 ;----------------------------------
                                   2691 ; pick value n from dstack 
                                   2692 ; put it on TOS
                                   2693 ; dstack: {ix,..,p -- ix,...,np }
                                   2694 ;-----------------------------------
      0090A6                       2695 dpick:
      0090A6 72 CE 00 19      [ 5] 2696 	ldw x,[dstkptr]
      0090AA 58               [ 2] 2697 	sllw x 
      0090AB 72 BB 00 19      [ 2] 2698 	addw x,dstkptr 
      0090AF FE               [ 2] 2699 	ldw x,(x)
      0090B0 72 CF 00 19      [ 5] 2700 	ldw [dstkptr],x 
      0090B4 81               [ 4] 2701 	ret
                                   2702 
                                   2703 ;---------------------------
                                   2704 ;  fetch variable in X 
                                   2705 ;  dstack:{ addr -- value }
                                   2706 ;---------------------------
      0090B5                       2707 fetch:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      0090B5 72 CE 00 19      [ 5] 2708 	ldw x,[dstkptr]
      0090B9 FE               [ 2] 2709 	ldw x,(x)
      0090BA 72 CF 00 19      [ 5] 2710 	ldw [dstkptr],x
      0090BE 81               [ 4] 2711 	ret 
                                   2712 
                                   2713 ;----------------------------
                                   2714 ; store variable 
                                   2715 ; dstack: {addr value -- }
                                   2716 ;----------------------------
      0090BF                       2717 store:
      0090BF CD 90 65         [ 4] 2718 	call dpop 
      0090C2 90 93            [ 1] 2719 	ldw y,x   ; y=value 
      0090C4 CD 90 65         [ 4] 2720 	call dpop 
      0090C7 FF               [ 2] 2721 	ldw (x),y 
      0090C8 81               [ 4] 2722 	ret 
                                   2723 
                                   2724 ;---------------------------------
                                   2725 ; drop n elements from data stack 
                                   2726 ; input: 
                                   2727 ;   X 		n 
                                   2728 ; output:
                                   2729 ;   none 
                                   2730 ;-------------------------------------
      0090C9                       2731 ddrop_n:
      0090C9 90 89            [ 2] 2732 	pushw y 
      0090CB 90 CE 00 19      [ 2] 2733 	ldw y,dstkptr 
      0090CF 58               [ 2] 2734 	sllw x 
      0090D0 89               [ 2] 2735 	pushw x 
      0090D1 72 F9 01         [ 2] 2736 	addw y,(1,sp)
      0090D4 90 CF 00 19      [ 2] 2737 	ldw dstkptr,y 
      0090D8 85               [ 2] 2738 	popw x 
      0090D9 90 85            [ 2] 2739 	popw y
      0090DB 81               [ 4] 2740 	ret 
                                   2741 
      0090DC 0A 64 73 74 61 63 6B  2742 dstk_prompt: .asciz "\ndstack: " 
             3A 20 00
                                   2743 ;----------------------------
                                   2744 ; print dstack content 
                                   2745 ;---------------------------
                           000001  2746 	XSAVE=1
                           000002  2747 	VSIZE=2
      0090E6                       2748 dots:
      001066                       2749 	_vars VSIZE 
      0090E6 52 02            [ 2]    1     sub sp,#VSIZE 
      0090E8 AE 90 DC         [ 2] 2750 	ldw x,#dstk_prompt 
      0090EB CD 82 44         [ 4] 2751 	call puts
      0090EE AE 17 7E         [ 2] 2752 	ldw x,#dstack_empty-CELL_SIZE
      0090F1 35 0A 00 07      [ 1] 2753 	mov base,#10 
      0090F5 C3 00 19         [ 2] 2754 1$:	cpw x,dstkptr 
      0090F8 25 0D            [ 1] 2755 	jrult 4$ 
      0090FA 1F 01            [ 2] 2756 	ldw (XSAVE,sp),x
      0090FC FE               [ 2] 2757 	ldw  x,(x)
      0090FD CD 8A 5F         [ 4] 2758 	call print_int 
      009100 1E 01            [ 2] 2759 	ldw x,(XSAVE,sp)
      009102 1D 00 02         [ 2] 2760 	subw x,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      009105 20 EE            [ 2] 2761 	jra 1$ 
      009107 A6 0D            [ 1] 2762 4$: ld a,#CR 
      009109 CD 82 32         [ 4] 2763 	call putc 
      00108C                       2764 	_drop VSIZE
      00910C 5B 02            [ 2]    1     addw sp,#VSIZE 
      00910E 4F               [ 1] 2765 	clr a 
      00910F 81               [ 4] 2766 	ret
                                   2767 
      009110 0A 63 74 61 63 6B 3A  2768 cstk_prompt: .asciz "\nctack: "
             20 00
                                   2769 ;--------------------------------
                                   2770 ; print cstack content
                                   2771 ;--------------------------------
                           000001  2772 	XSAVE=1
                           000002  2773 	VSIZE=2 
      009119                       2774 dotr:
      001099                       2775 	_vars VSIZE 
      009119 52 02            [ 2]    1     sub sp,#VSIZE 
      00911B AE 91 10         [ 2] 2776 	ldw x,#cstk_prompt
      00911E CD 82 44         [ 4] 2777 	call puts 
      009121 96               [ 1] 2778 	ldw x,sp 
      009122 1C 00 07         [ 2] 2779 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      009125 1F 01            [ 2] 2780 	ldw (XSAVE,sp),x  
      009127 AE 17 FE         [ 2] 2781 	ldw x,#RAM_SIZE-2
      00912A 35 10 00 07      [ 1] 2782 	mov base,#16
      00912E                       2783 dotr_loop:
      00912E 13 01            [ 2] 2784 	cpw x,(XSAVE,sp)
      009130 2B 0B            [ 1] 2785 	jrmi 9$
      009132 89               [ 2] 2786 	pushw x  
      009133 FE               [ 2] 2787 	ldw x,(x)
      009134 CD 8A 5F         [ 4] 2788 	call print_int 
      009137 85               [ 2] 2789 	popw x  
      009138 1D 00 02         [ 2] 2790 	subw x,#CELL_SIZE
      00913B 20 F1            [ 2] 2791 	jra dotr_loop 
      00913D A6 0D            [ 1] 2792 9$:	ld a,#CR 
      00913F CD 82 32         [ 4] 2793 	call putc 
      0010C2                       2794 	_drop VSIZE 
      009142 5B 02            [ 2]    1     addw sp,#VSIZE 
      009144 4F               [ 1] 2795 	clr a 
      009145 81               [ 4] 2796 	ret
                                   2797 
                                   2798 
                                   2799 ;--------------------------------
                                   2800 ;  add 2 integers
                                   2801 ;  input:
                                   2802 ;    N1     on cstack 
                                   2803 ;    N2     on cstack 
                                   2804 ;  output:
                                   2805 ;    X 		n2+n1 
                                   2806 ;--------------------------------
                                   2807 	;arugments on cstack 
      009146                       2808 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0010C6                       2809 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      0010C6                       2810 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      0010C6                       2811 add:
      009146 1E 05            [ 2] 2812 	ldw x ,(N2,sp)
      009148 72 FB 03         [ 2] 2813 	addw x,(N1,sp)
      00914B 1F 03            [ 2] 2814 	ldw (N1,sp),x 
      00914D 81               [ 4] 2815 	ret 
                                   2816 
                                   2817 ;--------------------------------
                                   2818 ;  substract 2 ntegers
                                   2819 ;  input:
                                   2820 ;    N1     on cstack 
                                   2821 ;    N2     on cstack 
                                   2822 ;  output:
                                   2823 ;    X 		n2+n1 
                                   2824 ;--------------------------------
      00914E                       2825 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0010CE                       2826 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      0010CE                       2827 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      0010CE                       2828 substract:
      00914E 1E 05            [ 2] 2829 	ldw x,(N2,sp)
      009150 72 F0 03         [ 2] 2830 	subw x,(N1,sp)
      009153 81               [ 4] 2831 	ret 
                                   2832 
                                   2833 ;-------------------------------------
                                   2834 ; multiply 2 integers
                                   2835 ; product overflow is ignored unless
                                   2836 ; MATH_OVF assembler flag is set to 1
                                   2837 ; input:
                                   2838 ;  	N1      on cstack
                                   2839 ;   N2 		on cstack 
                                   2840 ; output:
                                   2841 ;	X        N1*N2 
                                   2842 ;-------------------------------------
                                   2843 	;arguments 
      009154                       2844 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      0010D4                       2845 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      0010D4                       2846 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      0010D4                       2847 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      0010D4                       2848 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2849    ; local variables 
                           000001  2850 	SIGN=1
                           000002  2851 	PROD=2
                           000003  2852 	VSIZE=3
      0010D4                       2853 multiply:
      0010D4                       2854 	_vars VSIZE 
      009154 52 03            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009156 0F 01            [ 1] 2855 	clr (SIGN,sp)
      009158 1E 06            [ 2] 2856 	ldw x,(N1_HB,sp)
      00915A 9E               [ 1] 2857 	ld a,xh  
      00915B A5 80            [ 1] 2858 	bcp a,#0x80 
      00915D 27 05            [ 1] 2859 	jreq 2$
      00915F 03 01            [ 1] 2860 	cpl (SIGN,sp)
      009161 50               [ 2] 2861 	negw x 
      009162 1F 06            [ 2] 2862 	ldw (N1_HB,sp),x 
      009164 1E 08            [ 2] 2863 2$: ldw x,(N2_HB,sp)
      009166 9E               [ 1] 2864 	ld a,xh  
      009167 A5 80            [ 1] 2865 	bcp a,#0x80 
      009169 27 05            [ 1] 2866 	jreq 3$
      00916B 03 01            [ 1] 2867 	cpl (SIGN,sp)
      00916D 50               [ 2] 2868 	negw x 
      00916E 1F 08            [ 2] 2869 	ldw (N2_HB,sp),x 
                                   2870 ; N1_LB * N2_LB 	
      009170 7B 07            [ 1] 2871 3$:	ld a,(N1_LB,sp)
      009172 97               [ 1] 2872 	ld xl,a 
      009173 7B 09            [ 1] 2873 	ld a,(N2_LB,sp) 
      009175 42               [ 4] 2874 	mul x,a 
                           000000  2875 .if MATH_OVF 	
                                   2876 	ld a,xh 
                                   2877 	bcp a,#0x80 
                                   2878 	jreq 4$ 
                                   2879 	ld a,#ERR_MATH_OVF 
                                   2880 	jp tb_error
                                   2881 .endif 	 
      009176 1F 02            [ 2] 2882 4$:	ldw (PROD,sp),x
                                   2883 ; N1_LB * N2_HB	 
      009178 7B 07            [ 1] 2884 	ld a,(N1_LB,sp) 
      00917A 97               [ 1] 2885 	ld xl,a 
      00917B 7B 08            [ 1] 2886 	ld a,(N2_HB,sp)
      00917D 42               [ 4] 2887 	mul x,a
      00917E 9F               [ 1] 2888 	ld a,xl 
      00917F 1B 02            [ 1] 2889 	add a,(PROD,sp)
                           000000  2890 .if MATH_OVF 	
                                   2891 	bcp a,#0x80 
                                   2892 	jreq 5$ 
                                   2893 	ld a,#ERR_MATH_OVF 
                                   2894 	jp tb_error
                                   2895 .endif 	 
      009181 6B 02            [ 1] 2896 5$:	ld (PROD,sp),a 
                                   2897 ; N1_HB * N2_LB 
      009183 7B 06            [ 1] 2898 	ld a,(N1_HB,sp)
      009185 97               [ 1] 2899 	ld xl,a 
      009186 7B 09            [ 1] 2900 	ld a,(N2_LB,sp)
      009188 42               [ 4] 2901 	mul x,a 
      009189 9F               [ 1] 2902 	ld a,xl 
      00918A 1B 02            [ 1] 2903 	add a,(PROD,sp)
                           000000  2904 .if MATH_OVF 	
                                   2905 	bcp a,#0x80 
                                   2906 	jreq 6$ 
                                   2907 	ld a,#ERR_MATH_OVF 
                                   2908 	jp tb_error
                                   2909 .endif 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00918C 6B 02            [ 1] 2910 6$:	ld (PROD,sp),a 
                                   2911 ; N1_HB * N2_HB 	
                                   2912 ; it is pointless to multiply N1_HB*N2_HB 
                                   2913 ; as this product is over 65535 or 0 
                                   2914 ;
                                   2915 ; sign adjust product
      00918E 0D 01            [ 1] 2916 	tnz (SIGN,sp)
      009190 27 05            [ 1] 2917 	jreq 7$
      009192 1E 02            [ 2] 2918 	ldw x, (PROD,sp)
      009194 50               [ 2] 2919 	negw x
      009195 1F 02            [ 2] 2920 	ldw (PROD,sp),x  
      009197                       2921 7$: 
      009197 1E 02            [ 2] 2922 	ldw x,(PROD,sp) 
      001119                       2923 	_drop VSIZE 
      009199 5B 03            [ 2]    1     addw sp,#VSIZE 
      00919B 81               [ 4] 2924 	ret
                                   2925 
                                   2926 ;----------------------------------
                                   2927 ;  euclidian divide n2/n1 
                                   2928 ; input:
                                   2929 ;    N2 	on cstack
                                   2930 ;    N1 	on cstack
                                   2931 ; output:
                                   2932 ;    X      n2/n1 
                                   2933 ;    Y      remainder 
                                   2934 ;----------------------------------
      00919C                       2935 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      00111C                       2936 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      00111C                       2937 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2938 	; local variables
                           000001  2939 	SQUOT=1 ; sign quotient
                           000002  2940 	SDIVD=2 ; sign dividend  
                           000002  2941 	VSIZE=2
      00111C                       2942 divide:
      00111C                       2943 	_vars VSIZE 
      00919C 52 02            [ 2]    1     sub sp,#VSIZE 
      00919E 0F 01            [ 1] 2944 	clr (SQUOT,sp)
      0091A0 0F 02            [ 1] 2945 	clr (SDIVD,sp)
                                   2946 ; check for 0 divisor
      0091A2 1E 05            [ 2] 2947 	ldw x,(DIVISR,sp)
      0091A4 5D               [ 2] 2948 	tnzw x 
      0091A5 26 05            [ 1] 2949     jrne 0$
      0091A7 A6 04            [ 1] 2950 	ld a,#ERR_DIV0 
      0091A9 CC 88 01         [ 2] 2951 	jp tb_error 
                                   2952 ; check divisor sign 	
      0091AC 9E               [ 1] 2953 0$:	ld a,xh 
      0091AD A5 80            [ 1] 2954 	bcp a,#0x80 
      0091AF 27 03            [ 1] 2955 	jreq 1$
      0091B1 03 01            [ 1] 2956 	cpl (SQUOT,sp)
      0091B3 50               [ 2] 2957 	negw x 
      0091B4 1F 05            [ 2] 2958 1$:	ldw (DIVISR,sp),x
                                   2959 ; check dividend sign 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      0091B6 1E 07            [ 2] 2960     ldw x,(DIVIDND,sp)
      0091B8 9E               [ 1] 2961 	ld a,xh 
      0091B9 A5 80            [ 1] 2962 	bcp a,#0x80 
      0091BB 27 05            [ 1] 2963 	jreq 2$ 
      0091BD 03 01            [ 1] 2964 	cpl (SQUOT,sp)
      0091BF 03 02            [ 1] 2965 	cpl (SDIVD,sp)
      0091C1 50               [ 2] 2966 	negw x 
      0091C2 16 05            [ 2] 2967 2$:	ldw y,(DIVISR,sp)
      0091C4 65               [ 2] 2968 	divw x,y
      0091C5 90 CF 00 09      [ 2] 2969 	ldw acc16,y 
                                   2970 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      0091C9 0D 02            [ 1] 2971 	tnz (SDIVD,sp)
      0091CB 27 0B            [ 1] 2972 	jreq 7$
      0091CD 90 5D            [ 2] 2973 	tnzw y 
      0091CF 27 07            [ 1] 2974 	jreq 7$
      0091D1 5C               [ 2] 2975 	incw x
      0091D2 16 05            [ 2] 2976 	ldw y,(DIVISR,sp)
      0091D4 72 B2 00 09      [ 2] 2977 	subw y,acc16
      0091D8 0D 01            [ 1] 2978 7$: tnz (SQUOT,sp)
      0091DA 27 01            [ 1] 2979 	jreq 9$ 	 
      0091DC 50               [ 2] 2980 8$:	negw x 
      0091DD                       2981 9$: 
      00115D                       2982 	_drop VSIZE 
      0091DD 5B 02            [ 2]    1     addw sp,#VSIZE 
      0091DF 81               [ 4] 2983 	ret 
                                   2984 
                                   2985 
                                   2986 ;----------------------------------
                                   2987 ;  remainder resulting from euclidian 
                                   2988 ;  division of n2/n1 
                                   2989 ; input:
                                   2990 ;   N1 		cstack 
                                   2991 ;   N2      cstack
                                   2992 ; output:
                                   2993 ;   X       N2%N1 
                                   2994 ;----------------------------------
                           000003  2995 	N1=3
                           000005  2996 	N2=5
                           000004  2997 	VSIZE=4
      0091E0                       2998 modulo:
      0091E0 1E 03            [ 2] 2999 	Ldw x,(N1,sp)
      0091E2 16 05            [ 2] 3000 	ldw y,(N2,sp)
      001164                       3001 	_vars VSIZE 
      0091E4 52 04            [ 2]    1     sub sp,#VSIZE 
      0091E6 1F 01            [ 2] 3002 	ldw (1,sp),x 
      0091E8 17 03            [ 2] 3003 	ldw (3,sp),y 
      0091EA CD 91 9C         [ 4] 3004 	call divide 
      0091ED 93               [ 1] 3005 	ldw x,y
      00116E                       3006 	_drop VSIZE 
      0091EE 5B 04            [ 2]    1     addw sp,#VSIZE 
      0091F0 81               [ 4] 3007 	ret 
                                   3008 
                                   3009 
                                   3010 ;----------------------------------
                                   3011 ; search in kword_dict command name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3012 ;  from its execution address 
                                   3013 ; input:
                                   3014 ;   X       	execution address 
                                   3015 ; output:
                                   3016 ;   X 			cstr*  | 0 
                                   3017 ;--------------------------------
                           000001  3018 	XADR=1 
                           000003  3019 	LINK=3 
                           000004  3020 	VSIZE=4
      0091F1                       3021 cmd_name:
      001171                       3022 	_vars VSIZE 
      0091F1 52 04            [ 2]    1     sub sp,#VSIZE 
      0091F3 72 5F 00 09      [ 1] 3023 	clr acc16 
      0091F7 1F 01            [ 2] 3024 	ldw (XADR,sp),x  
      0091F9 AE A5 AB         [ 2] 3025 	ldw x,#kword_dict	
      0091FC 1F 03            [ 2] 3026 1$:	ldw (LINK,sp),x
      0091FE E6 02            [ 1] 3027 	ld a,(2,x)
      009200 A4 0F            [ 1] 3028 	and a,#15 
      009202 C7 00 0A         [ 1] 3029 	ld acc8,a 
      009205 1C 00 03         [ 2] 3030 	addw x,#3
      009208 72 BB 00 09      [ 2] 3031 	addw x,acc16
      00920C FE               [ 2] 3032 	ldw x,(x) ; execution address 
      00920D 13 01            [ 2] 3033 	cpw x,(XADR,sp)
      00920F 27 0A            [ 1] 3034 	jreq 2$
      009211 1E 03            [ 2] 3035 	ldw x,(LINK,sp)
      009213 FE               [ 2] 3036 	ldw x,(x) 
      009214 1D 00 02         [ 2] 3037 	subw x,#2  
      009217 26 E3            [ 1] 3038 	jrne 1$
      009219 20 05            [ 2] 3039 	jra 9$
      00921B 1E 03            [ 2] 3040 2$: ldw x,(LINK,sp)
      00921D 1C 00 02         [ 2] 3041 	addw x,#2 	
      0011A0                       3042 9$:	_drop VSIZE
      009220 5B 04            [ 2]    1     addw sp,#VSIZE 
      009222 81               [ 4] 3043 	ret
                                   3044 
                                   3045 
                                   3046 ;---------------------------------
                                   3047 ; input:
                                   3048 ;	X 		dictionary entry point 
                                   3049 ;  pad		.asciz name to search 
                                   3050 ; output:
                                   3051 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3052 ;  X		execution address | 0 
                                   3053 ;---------------------------------
                           000001  3054 	NLEN=1 ; cmd length 
                           000002  3055 	YSAVE=2
                           000003  3056 	VSIZE=3 
      009223                       3057 search_dict:
      0011A3                       3058 	_vars VSIZE 
      009223 52 03            [ 2]    1     sub sp,#VSIZE 
      009225 90 93            [ 1] 3059 	ldw y,x 
      009227                       3060 search_next:	
      009227 90 F6            [ 1] 3061 	ld a,(y)
      009229 A4 0F            [ 1] 3062 	and a,#0xf 
      00922B 6B 01            [ 1] 3063 	ld (NLEN,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      00922D AE 17 18         [ 2] 3064 	ldw x,#pad 
      009230 17 02            [ 2] 3065 	ldw (YSAVE,sp),y
      009232 90 5C            [ 2] 3066 	incw y  
      009234                       3067 cp_loop:
      009234 F6               [ 1] 3068 	ld a,(x)
      009235 27 1E            [ 1] 3069 	jreq str_match 
      009237 0D 01            [ 1] 3070 	tnz (NLEN,sp)
      009239 27 0B            [ 1] 3071 	jreq no_match  
      00923B 90 F1            [ 1] 3072 	cp a,(y)
      00923D 26 07            [ 1] 3073 	jrne no_match 
      00923F 90 5C            [ 2] 3074 	incw y 
      009241 5C               [ 2] 3075 	incw x
      009242 0A 01            [ 1] 3076 	dec (NLEN,sp)
      009244 20 EE            [ 2] 3077 	jra cp_loop 
      009246                       3078 no_match:
      009246 16 02            [ 2] 3079 	ldw y,(YSAVE,sp) 
      009248 72 A2 00 02      [ 2] 3080 	subw y,#2 ; move Y to link field
      00924C 4B 00            [ 1] 3081 	push #TK_NONE 
      00924E 90 FE            [ 2] 3082 	ldw y,(y) ; next word link 
      009250 84               [ 1] 3083 	pop a ; TK_NONE 
      009251 27 21            [ 1] 3084 	jreq search_exit  ; not found  
                                   3085 ;try next 
      009253 20 D2            [ 2] 3086 	jra search_next
      009255                       3087 str_match:
      009255 16 02            [ 2] 3088 	ldw y,(YSAVE,sp)
      009257 90 F6            [ 1] 3089 	ld a,(y)
      009259 6B 01            [ 1] 3090 	ld (NLEN,sp),a ; needed to test keyword type  
      00925B A4 0F            [ 1] 3091 	and a,#0xf 
                                   3092 ; move y to procedure address field 	
      00925D 4C               [ 1] 3093 	inc a 
      00925E C7 00 0A         [ 1] 3094 	ld acc8,a 
      009261 72 5F 00 09      [ 1] 3095 	clr acc16 
      009265 72 B9 00 09      [ 2] 3096 	addw y,acc16 
      009269 90 FE            [ 2] 3097 	ldw y,(y) ; routine entry point 
                                   3098 ;determine keyword type bits 7:6 
      00926B 7B 01            [ 1] 3099 	ld a,(NLEN,sp)
      00926D 4E               [ 1] 3100 	swap a 
      00926E A4 0C            [ 1] 3101 	and a,#0xc
      009270 44               [ 1] 3102 	srl a
      009271 44               [ 1] 3103 	srl a 
      009272 AB 06            [ 1] 3104 	add a,#6
      009274                       3105 search_exit: 
      009274 93               [ 1] 3106 	ldw x,y ; x=routine address 
      0011F5                       3107 	_drop VSIZE 	 
      009275 5B 03            [ 2]    1     addw sp,#VSIZE 
      009277 81               [ 4] 3108 	ret 
                                   3109 
                                   3110 ;---------------------
                                   3111 ; check if next token
                                   3112 ;  is of expected type 
                                   3113 ; input:
                                   3114 ;   A 		 expected token attribute
                                   3115 ;  ouput:
                                   3116 ;   none     if fail call tb_error 
                                   3117 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009278                       3118 expect:
      009278 88               [ 1] 3119 	push a 
      009279 CD 88 C6         [ 4] 3120 	call next_token 
      00927C 11 01            [ 1] 3121 	cp a,(1,sp)
      00927E 27 03            [ 1] 3122 	jreq 1$
      009280 CC 87 FF         [ 2] 3123 	jp syntax_error
      009283 84               [ 1] 3124 1$: pop a 
      009284 81               [ 4] 3125 	ret 
                                   3126 
                                   3127 
                                   3128 ;-------------------------------
                                   3129 ; parse embedded BASIC routines 
                                   3130 ; arguments list.
                                   3131 ; arg_list::=  rel[','rel]*
                                   3132 ; all arguments are of integer type
                                   3133 ; input:
                                   3134 ;   none
                                   3135 ; output:
                                   3136 ;   A 			number of arguments pushed on dstack  
                                   3137 ;--------------------------------
                           000001  3138 	ARG_CNT=1 
      009285                       3139 arg_list:
      009285 4B 00            [ 1] 3140 	push #0  
      009287 CD 93 CD         [ 4] 3141 1$: call relation
      00928A A1 00            [ 1] 3142 	cp a,#TK_NONE 
      00928C 27 19            [ 1] 3143 	jreq 5$
      00928E A1 04            [ 1] 3144 	cp a,#TK_INTGR
      009290 26 12            [ 1] 3145 	jrne 4$
      009292 CD 90 58         [ 4] 3146 3$: call dpush 
      009295 0C 01            [ 1] 3147     inc (ARG_CNT,sp)
      009297 CD 88 C6         [ 4] 3148 	call next_token 
      00929A A1 00            [ 1] 3149 	cp a,#TK_NONE 
      00929C 27 09            [ 1] 3150 	jreq 5$ 
      00929E A1 0D            [ 1] 3151 	cp a,#TK_COMMA 
      0092A0 26 02            [ 1] 3152 	jrne 4$
      0092A2 20 E3            [ 2] 3153 	jra 1$ 
      0092A4 CD 90 52         [ 4] 3154 4$:	call unget_token 
      0092A7 84               [ 1] 3155 5$:	pop a 
      0092A8 81               [ 4] 3156 	ret 
                                   3157 
                                   3158 
      0092A9                       3159 func_args:
      0092A9 A6 0B            [ 1] 3160 	ld a,#TK_LPAREN 
      0092AB CD 92 78         [ 4] 3161 	call expect 
      0092AE CD 92 85         [ 4] 3162 	call arg_list 
      0092B1 88               [ 1] 3163 	push a 
      0092B2 A6 0C            [ 1] 3164 	ld a,#TK_RPAREN 
      0092B4 CD 92 78         [ 4] 3165 	call expect 
      0092B7 84               [ 1] 3166 	pop a 
      0092B8 81               [ 4] 3167 	ret 
                                   3168 
                                   3169 
                                   3170 ;--------------------------------
                                   3171 ;   BASIC commnands 
                                   3172 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3173 
                                   3174 ;--------------------------------
                                   3175 ;  arithmetic and relational 
                                   3176 ;  routines
                                   3177 ;  operators precedence
                                   3178 ;  highest to lowest
                                   3179 ;  operators on same row have 
                                   3180 ;  same precedence and are executed
                                   3181 ;  from left to right.
                                   3182 ;	'*','/','%'
                                   3183 ;   '-','+'
                                   3184 ;   '=','>','<','>=','<=','<>','><'
                                   3185 ;   '<>' and '><' are equivalent for not equal.
                                   3186 ;--------------------------------
                                   3187 
                                   3188 ;---------------------
                                   3189 ; return array element
                                   3190 ; address from @(expr)
                                   3191 ; input:
                                   3192 ;   A 		TK_ARRAY
                                   3193 ; output:
                                   3194 ;   A 		TK_INTGR
                                   3195 ;	X 		element address 
                                   3196 ;----------------------
      0092B9                       3197 get_array_element:
      0092B9 CD 92 A9         [ 4] 3198 	call func_args 
      0092BC A1 01            [ 1] 3199 	cp a,#1
      0092BE 27 03            [ 1] 3200 	jreq 1$
      0092C0 CC 87 FF         [ 2] 3201 	jp syntax_error
      0092C3 CD 90 65         [ 4] 3202 1$: call dpop  
                                   3203 	; check for bounds 
      0092C6 C3 00 20         [ 2] 3204 	cpw x,array_size 
      0092C9 23 05            [ 2] 3205 	jrule 3$
                                   3206 ; bounds {1..array_size}	
      0092CB A6 0A            [ 1] 3207 2$: ld a,#ERR_BAD_VALUE 
      0092CD CC 88 01         [ 2] 3208 	jp tb_error 
      0092D0 5D               [ 2] 3209 3$: tnzw  x
      0092D1 27 F8            [ 1] 3210 	jreq 2$ 
      0092D3 58               [ 2] 3211 	sllw x 
      0092D4 89               [ 2] 3212 	pushw x 
      0092D5 AE 16 C8         [ 2] 3213 	ldw x,#tib
      0092D8 72 F0 01         [ 2] 3214 	subw x,(1,sp)
      00125B                       3215 	_drop 2   
      0092DB 5B 02            [ 2]    1     addw sp,#2 
      0092DD A6 04            [ 1] 3216 	ld a,#TK_INTGR
      0092DF 81               [ 4] 3217 	ret 
                                   3218 
                                   3219 ;***********************************
                                   3220 ;   expression parse,execute 
                                   3221 ;***********************************
                                   3222 ;-----------------------------------
                                   3223 ; factor ::= ['+'|'-'|e] var | @ |
                                   3224 ;			 integer | function |
                                   3225 ;			 '('relation')' 
                                   3226 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3227 ;   A    token attribute 
                                   3228 ;   X 	 integer
                                   3229 ; ---------------------------------
                           000001  3230 	NEG=1
                           000001  3231 	VSIZE=1
      0092E0                       3232 factor:
      001260                       3233 	_vars VSIZE 
      0092E0 52 01            [ 2]    1     sub sp,#VSIZE 
      0092E2 CD 88 C6         [ 4] 3234 	call next_token
      0092E5 A1 02            [ 1] 3235 	cp a,#CMD_END 
      0092E7 2B 50            [ 1] 3236 	jrmi 20$
      0092E9 6B 01            [ 1] 3237 1$:	ld (NEG,sp),a 
      0092EB A4 30            [ 1] 3238 	and a,#TK_GRP_MASK
      0092ED A1 10            [ 1] 3239 	cp a,#TK_GRP_ADD 
      0092EF 27 04            [ 1] 3240 	jreq 2$
      0092F1 7B 01            [ 1] 3241 	ld a,(NEG,sp)
      0092F3 20 03            [ 2] 3242 	jra 4$  
      0092F5                       3243 2$:	
      0092F5 CD 88 C6         [ 4] 3244 	call next_token 
      0092F8                       3245 4$:	
      0092F8 A1 07            [ 1] 3246 	cp a,#TK_IFUNC 
      0092FA 26 03            [ 1] 3247 	jrne 5$ 
      0092FC FD               [ 4] 3248 	call (x) 
      0092FD 20 31            [ 2] 3249 	jra 18$ 
      0092FF                       3250 5$:
      0092FF A1 04            [ 1] 3251 	cp a,#TK_INTGR
      009301 26 02            [ 1] 3252 	jrne 6$
      009303 20 2B            [ 2] 3253 	jra 18$
      009305                       3254 6$:
      009305 A1 02            [ 1] 3255 	cp a,#TK_ARRAY
      009307 26 06            [ 1] 3256 	jrne 10$
      009309 CD 92 B9         [ 4] 3257 	call get_array_element
      00930C FE               [ 2] 3258 	ldw x,(x)
      00930D 20 21            [ 2] 3259 	jra 18$ 
      00930F                       3260 10$:
      00930F A1 05            [ 1] 3261 	cp a,#TK_VAR 
      009311 26 03            [ 1] 3262 	jrne 11$
      009313 FE               [ 2] 3263 	ldw x,(x)
      009314 20 1A            [ 2] 3264 	jra 18$
      009316                       3265 11$: 
      009316 A1 09            [ 1] 3266 	cp a,#TK_CONST 
      009318 27 16            [ 1] 3267 	jreq 18$
      00931A                       3268 12$:			
      00931A A1 0B            [ 1] 3269 	cp a,#TK_LPAREN
      00931C 26 0C            [ 1] 3270 	jrne 16$
      00931E CD 93 CD         [ 4] 3271 	call relation
      009321 89               [ 2] 3272 	pushw x 
      009322 A6 0C            [ 1] 3273 	ld a,#TK_RPAREN 
      009324 CD 92 78         [ 4] 3274 	call expect
      009327 85               [ 2] 3275 	popw x 
      009328 20 06            [ 2] 3276 	jra 18$	
      00932A                       3277 16$:
      00932A CD 90 52         [ 4] 3278 	call unget_token
      00932D 4F               [ 1] 3279 	clr a 
      00932E 20 09            [ 2] 3280 	jra 20$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009330                       3281 18$: 
      009330 A6 11            [ 1] 3282 	ld a,#TK_MINUS 
      009332 11 01            [ 1] 3283 	cp a,(NEG,sp)
      009334 26 01            [ 1] 3284 	jrne 19$
      009336 50               [ 2] 3285 	negw x
      009337                       3286 19$:
      009337 A6 04            [ 1] 3287 	ld a,#TK_INTGR
      009339                       3288 20$:
      0012B9                       3289 	_drop VSIZE
      009339 5B 01            [ 2]    1     addw sp,#VSIZE 
      00933B 81               [ 4] 3290 	ret
                                   3291 
                                   3292 ;-----------------------------------
                                   3293 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3294 ; output:
                                   3295 ;   A    	token attribute 
                                   3296 ;	X		integer
                                   3297 ;-----------------------------------
                           000001  3298 	N1=1
                           000003  3299 	N2=3
                           000005  3300 	MULOP=5
                           000005  3301 	VSIZE=5
      00933C                       3302 term:
      0012BC                       3303 	_vars VSIZE
      00933C 52 05            [ 2]    1     sub sp,#VSIZE 
      00933E CD 92 E0         [ 4] 3304 	call factor
      009341 A1 02            [ 1] 3305 	cp a,#CMD_END
      009343 2B 41            [ 1] 3306 	jrmi term_exit
      009345                       3307 term01:	 ; check for  operator 
      009345 1F 03            [ 2] 3308 	ldw (N2,sp),x  ; save first factor 
      009347 CD 88 C6         [ 4] 3309 	call next_token
      00934A A1 02            [ 1] 3310 	cp a,#2
      00934C 2B 34            [ 1] 3311 	jrmi 9$
      00934E 6B 05            [ 1] 3312 0$:	ld (MULOP,sp),a
      009350 A4 30            [ 1] 3313 	and a,#TK_GRP_MASK
      009352 A1 20            [ 1] 3314 	cp a,#TK_GRP_MULT
      009354 27 07            [ 1] 3315 	jreq 1$
      009356 7B 05            [ 1] 3316 	ld a,(MULOP,sp) 
      009358 CD 90 52         [ 4] 3317 	call unget_token 
      00935B 20 25            [ 2] 3318 	jra 9$
      00935D                       3319 1$:	; got *|/|%
      00935D CD 92 E0         [ 4] 3320 	call factor
      009360 A1 04            [ 1] 3321 	cp a,#TK_INTGR
      009362 27 03            [ 1] 3322 	jreq 2$ 
      009364 CC 87 FF         [ 2] 3323 	jp syntax_error
      009367 1F 01            [ 2] 3324 2$:	ldw (N1,sp),x  
      009369 7B 05            [ 1] 3325 	ld a,(MULOP,sp) 
      00936B A1 20            [ 1] 3326 	cp a,#TK_MULT 
      00936D 26 05            [ 1] 3327 	jrne 3$
      00936F CD 91 54         [ 4] 3328 	call multiply 
      009372 20 D1            [ 2] 3329 	jra term01
      009374 A1 21            [ 1] 3330 3$: cp a,#TK_DIV 
      009376 26 05            [ 1] 3331 	jrne 4$ 
      009378 CD 91 9C         [ 4] 3332 	call divide 
      00937B 20 C8            [ 2] 3333 	jra term01 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00937D CD 91 E0         [ 4] 3334 4$: call modulo
      009380 20 C3            [ 2] 3335 	jra term01 
      009382 1E 03            [ 2] 3336 9$: ldw x,(N2,sp)  
      009384 A6 04            [ 1] 3337 	ld a,#TK_INTGR 	
      009386                       3338 term_exit:
      001306                       3339 	_drop VSIZE 
      009386 5B 05            [ 2]    1     addw sp,#VSIZE 
      009388 81               [ 4] 3340 	ret 
                                   3341 
                                   3342 ;-------------------------------
                                   3343 ;  expr ::= term [['+'|'-'] term]*
                                   3344 ;  result range {-32768..32767}
                                   3345 ;  output:
                                   3346 ;   A    token attribute 
                                   3347 ;   X	 integer   
                                   3348 ;-------------------------------
                           000001  3349 	N1=1 
                           000003  3350 	N2=3
                           000005  3351 	OP=5 
                           000005  3352 	VSIZE=5 
      009389                       3353 expression:
      001309                       3354 	_vars VSIZE 
      009389 52 05            [ 2]    1     sub sp,#VSIZE 
      00938B CD 93 3C         [ 4] 3355 	call term
      00938E A1 02            [ 1] 3356 	cp a,#CMD_END 
      009390 2B 38            [ 1] 3357 	jrmi expr_exit 
      009392 1F 03            [ 2] 3358 0$:	ldw (N2,sp),x 
      009394 CD 88 C6         [ 4] 3359 	call next_token
      009397 A1 02            [ 1] 3360 	cp a,#2
      009399 2B 2B            [ 1] 3361 	jrmi 9$ 
      00939B 6B 05            [ 1] 3362 1$:	ld (OP,sp),a  
      00939D A4 30            [ 1] 3363 	and a,#TK_GRP_MASK
      00939F A1 10            [ 1] 3364 	cp a,#TK_GRP_ADD 
      0093A1 27 07            [ 1] 3365 	jreq 2$ 
      0093A3 7B 05            [ 1] 3366 	ld a,(OP,sp)
      0093A5 CD 90 52         [ 4] 3367 	call unget_token
      0093A8 20 1C            [ 2] 3368 	jra 9$
      0093AA                       3369 2$: 
      0093AA CD 93 3C         [ 4] 3370 	call term
      0093AD A1 04            [ 1] 3371 	cp a,#TK_INTGR 
      0093AF 27 03            [ 1] 3372 	jreq 3$
      0093B1 CC 87 FF         [ 2] 3373 	jp syntax_error
      0093B4 1F 01            [ 2] 3374 3$:	ldw (N1,sp),x 
      0093B6 7B 05            [ 1] 3375 	ld a,(OP,sp)
      0093B8 A1 10            [ 1] 3376 	cp a,#TK_PLUS 
      0093BA 26 05            [ 1] 3377 	jrne 4$
      0093BC CD 91 46         [ 4] 3378 	call add 
      0093BF 20 D1            [ 2] 3379 	jra 0$ 
      0093C1 CD 91 4E         [ 4] 3380 4$:	call substract
      0093C4 20 CC            [ 2] 3381 	jra 0$
      0093C6 1E 03            [ 2] 3382 9$: ldw x,(N2,sp)
      0093C8 A6 04            [ 1] 3383 	ld a,#TK_INTGR	
      0093CA                       3384 expr_exit:
      00134A                       3385 	_drop VSIZE 
      0093CA 5B 05            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0093CC 81               [ 4] 3386 	ret 
                                   3387 
                                   3388 ;---------------------------------------------
                                   3389 ; rel ::= expr rel_op expr
                                   3390 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3391 ;  relation return 1 | 0  for true | false 
                                   3392 ;  output:
                                   3393 ;    A 		token attribute  
                                   3394 ;	 X		1|0
                                   3395 ;---------------------------------------------
                           000001  3396 	N1=1
                           000003  3397 	N2=3
                           000005  3398 	RELOP=5
                           000005  3399 	VSIZE=5 
      0093CD                       3400 relation: 
      00134D                       3401 	_vars VSIZE
      0093CD 52 05            [ 2]    1     sub sp,#VSIZE 
      0093CF CD 93 89         [ 4] 3402 	call expression
      0093D2 A1 02            [ 1] 3403 	cp a,#CMD_END  
      0093D4 2B 4B            [ 1] 3404 	jrmi rel_exit 
                                   3405 	; expect rel_op or leave 
      0093D6 1F 03            [ 2] 3406 	ldw (N2,sp),x 
      0093D8 CD 88 C6         [ 4] 3407 	call next_token 
      0093DB A1 02            [ 1] 3408 	cp a,#2
      0093DD 2B 3E            [ 1] 3409 	jrmi 9$
      0093DF                       3410 1$:	
      0093DF 6B 05            [ 1] 3411 	ld (RELOP,sp),a 
      0093E1 A4 30            [ 1] 3412 	and a,#TK_GRP_MASK
      0093E3 A1 30            [ 1] 3413 	cp a,#TK_GRP_RELOP 
      0093E5 27 07            [ 1] 3414 	jreq 2$
      0093E7 7B 05            [ 1] 3415 	ld a,(RELOP,sp)
      0093E9 CD 90 52         [ 4] 3416 	call unget_token  
      0093EC 20 2F            [ 2] 3417 	jra 9$
      0093EE                       3418 2$:	; expect another expression or error 
      0093EE CD 93 89         [ 4] 3419 	call expression
      0093F1 A1 04            [ 1] 3420 	cp a,#TK_INTGR 
      0093F3 27 03            [ 1] 3421 	jreq 3$
      0093F5 CC 87 FF         [ 2] 3422 	jp syntax_error 
      0093F8 1F 01            [ 2] 3423 3$:	ldw (N1,sp),x 
      0093FA CD 91 4E         [ 4] 3424 	call substract
      0093FD 26 06            [ 1] 3425 	jrne 4$
      0093FF 35 02 00 0A      [ 1] 3426 	mov acc8,#2 ; n1==n2
      009403 20 0C            [ 2] 3427 	jra 6$ 
      009405                       3428 4$: 
      009405 2C 06            [ 1] 3429 	jrsgt 5$  
      009407 35 04 00 0A      [ 1] 3430 	mov acc8,#4 ; n1<2 
      00940B 20 04            [ 2] 3431 	jra 6$
      00940D                       3432 5$:
      00940D 35 01 00 0A      [ 1] 3433 	mov acc8,#1 ; n1>n2 
      009411                       3434 6$:
      009411 5F               [ 1] 3435 	clrw x 
      009412 C6 00 0A         [ 1] 3436 	ld a, acc8  
      009415 14 05            [ 1] 3437 	and a,(RELOP,sp)
      009417 4D               [ 1] 3438 	tnz a 
      009418 27 05            [ 1] 3439 	jreq 10$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00941A 5C               [ 2] 3440 	incw x 
      00941B                       3441 7$:	 
      00941B 20 02            [ 2] 3442 	jra 10$  	
      00941D 1E 03            [ 2] 3443 9$: ldw x,(N2,sp)
      00941F                       3444 10$:
      00941F A6 04            [ 1] 3445 	ld a,#TK_INTGR
      009421                       3446 rel_exit: 	 
      0013A1                       3447 	_drop VSIZE
      009421 5B 05            [ 2]    1     addw sp,#VSIZE 
      009423 81               [ 4] 3448 	ret 
                                   3449 
                                   3450 ;--------------------------------
                                   3451 ; BASIC: SHOW 
                                   3452 ;  show content of dstack,cstack
                                   3453 ;--------------------------------
      009424                       3454 show:
      009424 C6 00 07         [ 1] 3455 	ld a,base 
      009427 88               [ 1] 3456 	push a 
      009428 CD 90 E6         [ 4] 3457 	call dots
      00942B CD 91 19         [ 4] 3458 	call dotr 
      00942E 84               [ 1] 3459 	pop a 
      00942F C7 00 07         [ 1] 3460 	ld base,a 
      009432 4F               [ 1] 3461 	clr a 
      009433 81               [ 4] 3462 	ret
                                   3463 
                                   3464 ;--------------------------------------------
                                   3465 ; BASIC: HEX 
                                   3466 ; select hexadecimal base for integer print
                                   3467 ;---------------------------------------------
      009434                       3468 hex_base:
      009434 35 10 00 07      [ 1] 3469 	mov base,#16 
      009438 81               [ 4] 3470 	ret 
                                   3471 
                                   3472 ;--------------------------------------------
                                   3473 ; BASIC: DEC 
                                   3474 ; select decimal base for integer print
                                   3475 ;---------------------------------------------
      009439                       3476 dec_base:
      009439 35 0A 00 07      [ 1] 3477 	mov base,#10
      00943D 81               [ 4] 3478 	ret 
                                   3479 
                                   3480 ;------------------------
                                   3481 ; BASIC: SIZE 
                                   3482 ; return free size in text area
                                   3483 ; output:
                                   3484 ;   A 		TK_INTGR
                                   3485 ;   X 	    size integer
                                   3486 ;--------------------------
      00943E                       3487 size:
      00943E AE 16 C8         [ 2] 3488 	ldw x,#tib 
      009441 72 B0 00 1D      [ 2] 3489 	subw x,txtend 
      009445 A6 04            [ 1] 3490 	ld a,#TK_INTGR
      009447 81               [ 4] 3491 	ret 
                                   3492 
                                   3493 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3494 ;------------------------
                                   3495 ; BASIC: UBOUND  
                                   3496 ; return array variable size 
                                   3497 ; output:
                                   3498 ;   A 		TK_INTGR
                                   3499 ;   X 	    array size 
                                   3500 ;--------------------------
      009448                       3501 ubound:
      009448 AE 16 C8         [ 2] 3502 	ldw x,#tib
      00944B 72 B0 00 1D      [ 2] 3503 	subw x,txtend 
      00944F 90 CE 00 05      [ 2] 3504 	ldw y,basicptr 
      009453 90 C3 00 1D      [ 2] 3505 	cpw y,txtend 
      009457 25 0A            [ 1] 3506 	jrult 1$
      009459 3B 00 04         [ 1] 3507 	push count 
      00945C 4B 00            [ 1] 3508 	push #0 
      00945E 72 F0 01         [ 2] 3509 	subw x,(1,sp)
      0013E1                       3510 	_drop 2 
      009461 5B 02            [ 2]    1     addw sp,#2 
      009463 54               [ 2] 3511 1$:	srlw x 
      009464 CF 00 20         [ 2] 3512 	ldw array_size,x
      009467 A6 04            [ 1] 3513 	ld a,#TK_INTGR
      009469 81               [ 4] 3514 	ret 
                                   3515 
                                   3516 ;-----------------------------
                                   3517 ; BASIC: LET var=expr 
                                   3518 ; variable assignement 
                                   3519 ; output:
                                   3520 ;   A 		TK_NONE 
                                   3521 ;-----------------------------
      00946A                       3522 let:
      00946A CD 88 C6         [ 4] 3523 	call next_token 
      00946D A1 05            [ 1] 3524 	cp a,#TK_VAR 
      00946F 27 03            [ 1] 3525 	jreq let02
      009471 CC 87 FF         [ 2] 3526 	jp syntax_error
      009474                       3527 let02:
      009474 CD 90 58         [ 4] 3528 	call dpush 
      009477 CD 88 C6         [ 4] 3529 	call next_token 
      00947A A1 32            [ 1] 3530 	cp a,#TK_EQUAL
      00947C 27 03            [ 1] 3531 	jreq 1$
      00947E CC 87 FF         [ 2] 3532 	jp syntax_error
      009481                       3533 1$:	
      009481 CD 93 CD         [ 4] 3534 	call relation   
      009484 A1 04            [ 1] 3535 	cp a,#TK_INTGR 
      009486 27 03            [ 1] 3536 	jreq 2$
      009488 CC 87 FF         [ 2] 3537 	jp syntax_error
      00948B                       3538 2$:	
      00948B 90 93            [ 1] 3539 	ldw y,x 
      00948D CD 90 65         [ 4] 3540 	call dpop  
      009490 FF               [ 2] 3541 	ldw (x),y   
      009491 81               [ 4] 3542 	ret 
                                   3543 
                                   3544 ;----------------------------
                                   3545 ; BASIC: LIST [[start][,end]]
                                   3546 ; list program lines 
                                   3547 ; form start to end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3548 ; if empty argument list then 
                                   3549 ; list all.
                                   3550 ;----------------------------
                           000001  3551 	FIRST=1
                           000003  3552 	LAST=3 
                           000005  3553 	LN_PTR=5
                           000006  3554 	VSIZE=6 
      009492                       3555 list:
      001412                       3556 	_vars VSIZE
      009492 52 06            [ 2]    1     sub sp,#VSIZE 
      009494 CE 00 1B         [ 2] 3557 	ldw x,txtbgn 
      009497 C3 00 1D         [ 2] 3558 	cpw x,txtend 
      00949A 2B 03            [ 1] 3559 	jrmi 1$
      00949C CC 95 12         [ 2] 3560 	jp list_exit ; nothing to list 
      00949F 1F 05            [ 2] 3561 1$:	ldw (LN_PTR,sp),x 
      0094A1 FE               [ 2] 3562 	ldw x,(x) 
      0094A2 1F 01            [ 2] 3563 	ldw (FIRST,sp),x ; list from first line 
      0094A4 AE 7F FF         [ 2] 3564 	ldw x,#0x7fff ; biggest line number 
      0094A7 1F 03            [ 2] 3565 	ldw (LAST,sp),x 
      0094A9 CD 92 85         [ 4] 3566 	call arg_list
      0094AC 4D               [ 1] 3567 	tnz a
      0094AD 27 3F            [ 1] 3568 	jreq list_start 
      0094AF A1 02            [ 1] 3569 	cp a,#2 
      0094B1 27 07            [ 1] 3570 	jreq 4$
      0094B3 A1 01            [ 1] 3571 	cp a,#1 
      0094B5 27 06            [ 1] 3572 	jreq first_line 
      0094B7 CC 87 FF         [ 2] 3573 	jp syntax_error 
      0094BA CD 90 72         [ 4] 3574 4$:	call dswap
      0094BD                       3575 first_line:
      0094BD CD 90 65         [ 4] 3576 	call dpop 
      0094C0 1F 01            [ 2] 3577 	ldw (FIRST,sp),x 
      0094C2 A1 01            [ 1] 3578 	cp a,#1 
      0094C4 27 05            [ 1] 3579 	jreq lines_skip 	
      0094C6                       3580 last_line:
      0094C6 CD 90 65         [ 4] 3581 	call dpop 
      0094C9 1F 03            [ 2] 3582 	ldw (LAST,sp),x 
      0094CB                       3583 lines_skip:
      0094CB CE 00 1B         [ 2] 3584 	ldw x,txtbgn
      0094CE 1F 05            [ 2] 3585 2$:	ldw (LN_PTR,sp),x 
      0094D0 C3 00 1D         [ 2] 3586 	cpw x,txtend 
      0094D3 2A 3D            [ 1] 3587 	jrpl list_exit 
      0094D5 FE               [ 2] 3588 	ldw x,(x) ;line# 
      0094D6 13 01            [ 2] 3589 	cpw x,(FIRST,sp)
      0094D8 2A 14            [ 1] 3590 	jrpl list_start 
      0094DA 1E 05            [ 2] 3591 	ldw x,(LN_PTR,sp) 
      0094DC 1C 00 02         [ 2] 3592 	addw x,#2 
      0094DF F6               [ 1] 3593 	ld a,(x)
      0094E0 5C               [ 2] 3594 	incw x 
      0094E1 C7 00 0A         [ 1] 3595 	ld acc8,a 
      0094E4 72 5F 00 09      [ 1] 3596 	clr acc16 
      0094E8 72 BB 00 09      [ 2] 3597 	addw x,acc16
      0094EC 20 E0            [ 2] 3598 	jra 2$ 
                                   3599 ; print loop
      0094EE                       3600 list_start:
      0094EE 1E 05            [ 2] 3601 	ldw x,(LN_PTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0094F0                       3602 3$:	
      0094F0 CD 95 65         [ 4] 3603 	call prt_basic_line
      0094F3 1E 05            [ 2] 3604 	ldw x,(LN_PTR,sp)
      0094F5 E6 02            [ 1] 3605 	ld a,(2,x)
      0094F7 C7 00 0A         [ 1] 3606 	ld acc8,a 
      0094FA 72 5F 00 09      [ 1] 3607 	clr acc16 
      0094FE 72 BB 00 09      [ 2] 3608 	addw x,acc16
      009502 C3 00 1D         [ 2] 3609 	cpw x,txtend 
      009505 2A 0B            [ 1] 3610 	jrpl list_exit
      009507 1F 05            [ 2] 3611 	ldw (LN_PTR,sp),x
      009509 FE               [ 2] 3612 	ldw x,(x)
      00950A 13 03            [ 2] 3613 	cpw x,(LAST,sp)  
      00950C 2C 04            [ 1] 3614 	jrsgt list_exit 
      00950E 1E 05            [ 2] 3615 	ldw x,(LN_PTR,sp)
      009510 20 DE            [ 2] 3616 	jra 3$
      009512                       3617 list_exit:
      001492                       3618 	_drop VSIZE 
      009512 5B 06            [ 2]    1     addw sp,#VSIZE 
      009514 81               [ 4] 3619 	ret
                                   3620 
                                   3621 ;-------------------------
                                   3622 ; print counted string 
                                   3623 ; input:
                                   3624 ;   X 		address of string
                                   3625 ;--------------------------
      009515                       3626 prt_cmd_name:
      009515 F6               [ 1] 3627 	ld a,(x)
      009516 5C               [ 2] 3628 	incw x
      009517 A4 0F            [ 1] 3629 	and a,#15  
      009519 88               [ 1] 3630 	push a 
      00951A 0D 01            [ 1] 3631 1$: tnz (1,sp) 
      00951C 27 09            [ 1] 3632 	jreq 9$
      00951E F6               [ 1] 3633 	ld a,(x)
      00951F CD 82 32         [ 4] 3634 	call putc 
      009522 5C               [ 2] 3635 	incw x
      009523 0A 01            [ 1] 3636 	dec (1,sp)	 
      009525 20 F3            [ 2] 3637 	jra 1$
      009527 84               [ 1] 3638 9$: pop a 
      009528 81               [ 4] 3639 	ret	
                                   3640 
                                   3641 ;--------------------------
                                   3642 ; print TK_QSTR
                                   3643 ; converting control character
                                   3644 ; to backslash sequence
                                   3645 ; input:
                                   3646 ;   X        char *
                                   3647 ;-----------------------------
      009529                       3648 prt_quote:
      009529 A6 22            [ 1] 3649 	ld a,#'"
      00952B CD 82 32         [ 4] 3650 	call putc 
      00952E F6               [ 1] 3651 1$:	ld a,(x)
      00952F 27 2D            [ 1] 3652 	jreq 9$
      009531 5C               [ 2] 3653 	incw x 
      009532 A1 20            [ 1] 3654 	cp a,#SPACE 
      009534 25 0C            [ 1] 3655 	jrult 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009536 CD 82 32         [ 4] 3656 	call putc
      009539 A1 5C            [ 1] 3657 	cp a,#'\ 
      00953B 26 F1            [ 1] 3658 	jrne 1$ 
      00953D                       3659 2$:
      00953D CD 82 32         [ 4] 3660 	call putc 
      009540 20 EC            [ 2] 3661 	jra 1$
      009542 88               [ 1] 3662 3$: push a 
      009543 A6 5C            [ 1] 3663 	ld a,#'\
      009545 CD 82 32         [ 4] 3664 	call putc 
      009548 84               [ 1] 3665 	pop a 
      009549 A0 07            [ 1] 3666 	sub a,#7
      00954B C7 00 0A         [ 1] 3667 	ld acc8,a 
      00954E 72 5F 00 09      [ 1] 3668 	clr acc16
      009552 90 AE 8D 21      [ 2] 3669 	ldw y,#escaped 
      009556 72 B9 00 09      [ 2] 3670 	addw y,acc16 
      00955A 90 F6            [ 1] 3671 	ld a,(y)
      00955C 20 DF            [ 2] 3672 	jra 2$
      00955E A6 22            [ 1] 3673 9$: ld a,#'"
      009560 CD 82 32         [ 4] 3674 	call putc 
      009563 5C               [ 2] 3675 	incw x 
      009564 81               [ 4] 3676 	ret
                                   3677 
                                   3678 
                                   3679 ;--------------------------
                                   3680 ; decompile line from token list 
                                   3681 ; input:
                                   3682 ;   X 		pointer at line
                                   3683 ; output:
                                   3684 ;   none 
                                   3685 ;--------------------------	
                           000001  3686 	BASE_SAV=1
                           000002  3687 	WIDTH_SAV=2
                           000003  3688 	XSAVE=3
                           000005  3689 	LLEN=5
                           000005  3690 	VSIZE=5 
      009565                       3691 prt_basic_line:
      0014E5                       3692 	_vars VSIZE 
      009565 52 05            [ 2]    1     sub sp,#VSIZE 
      009567 C6 00 07         [ 1] 3693 	ld a,base
      00956A 6B 01            [ 1] 3694 	ld (BASE_SAV,sp),a  
      00956C C6 00 23         [ 1] 3695 	ld a,tab_width 
      00956F 6B 02            [ 1] 3696 	ld (WIDTH_SAV,sp),a 
      009571 CF 00 14         [ 2] 3697 	ldw ptr16,x
      009574 FE               [ 2] 3698 	ldw x,(x)
      009575 35 0A 00 07      [ 1] 3699 	mov base,#10
      009579 35 05 00 23      [ 1] 3700 	mov tab_width,#5
      00957D CD 8A 5F         [ 4] 3701 	call print_int ; print line number 
      009580 A6 20            [ 1] 3702 	ld a,#SPACE 
      009582 CD 82 32         [ 4] 3703 	call putc 
      009585 72 5F 00 23      [ 1] 3704 	clr tab_width
      009589 AE 00 02         [ 2] 3705 	ldw x,#2
      00958C 72 D6 00 14      [ 4] 3706 	ld a,([ptr16],x)
      009590 6B 05            [ 1] 3707 	ld (LLEN,sp),a 
      009592 5C               [ 2] 3708 	incw x
      009593 9F               [ 1] 3709 1$:	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009594 11 05            [ 1] 3710 	cp a,(LLEN,sp)
      009596 2B 03            [ 1] 3711 	jrmi 20$
      009598 CC 96 A2         [ 2] 3712 	jp 90$
      00959B                       3713 20$:	 
      00959B 72 D6 00 14      [ 4] 3714 	ld a,([ptr16],x)
      00959F 5C               [ 2] 3715 	incw x 
      0095A0 1F 03            [ 2] 3716 	ldw (XSAVE,sp),x 
      0095A2 A1 06            [ 1] 3717 	cp a,#TK_CMD 
      0095A4 25 44            [ 1] 3718 	jrult 5$
      0095A6 A1 09            [ 1] 3719 	cp a,#TK_CONST 
      0095A8 22 2F            [ 1] 3720 	jrugt 4$
      0095AA                       3721 2$:	
      0095AA 72 DE 00 14      [ 5] 3722 	ldw x,([ptr16],x)
      0095AE A3 97 DB         [ 2] 3723 	cpw x,#rem 
      0095B1 26 14            [ 1] 3724 	jrne 3$
      0095B3 A6 27            [ 1] 3725 	ld a,#''
      0095B5 CD 82 32         [ 4] 3726 	call putc 
      0095B8 1E 03            [ 2] 3727 	ldw x,(XSAVE,sp)
      0095BA 1C 00 02         [ 2] 3728 	addw x,#2
      0095BD 72 BB 00 14      [ 2] 3729 	addw x,ptr16  
      0095C1 CD 82 44         [ 4] 3730 	call puts 
      0095C4 CC 96 A2         [ 2] 3731 	jp 90$ 
      0095C7 CD 91 F1         [ 4] 3732 3$:	call cmd_name
      0095CA CD 95 15         [ 4] 3733 	call prt_cmd_name
      0095CD A6 20            [ 1] 3734 	ld a,#SPACE 
      0095CF CD 82 32         [ 4] 3735 	call putc 
      0095D2 1E 03            [ 2] 3736 	ldw x,(XSAVE,sp)
      0095D4 1C 00 02         [ 2] 3737 	addw x,#2
      0095D7 20 BA            [ 2] 3738 	jra 1$
      0095D9 A1 0A            [ 1] 3739 4$: cp a,#TK_QSTR 
      0095DB 26 0D            [ 1] 3740 	jrne 5$
      0095DD 72 BB 00 14      [ 2] 3741 	addw x,ptr16
      0095E1 CD 95 29         [ 4] 3742 	call prt_quote 
      0095E4 72 B0 00 14      [ 2] 3743 	subw x,ptr16  
      0095E8 20 A9            [ 2] 3744 	jra 1$
      0095EA A1 05            [ 1] 3745 5$:	cp a,#TK_VAR
      0095EC 26 1A            [ 1] 3746 	jrne 6$ 
      0095EE 72 DE 00 14      [ 5] 3747 	ldw x,([ptr16],x)
      0095F2 1D 00 24         [ 2] 3748 	subw x,#vars 
      0095F5 9F               [ 1] 3749 	ld a,xl
      0095F6 44               [ 1] 3750 	srl a 
      0095F7 AB 41            [ 1] 3751 	add a,#'A 
      0095F9 CD 82 32         [ 4] 3752 	call putc 
      0095FC A6 20            [ 1] 3753 	ld a,#SPACE 
      0095FE CD 82 32         [ 4] 3754 	call putc 
      009601 1E 03            [ 2] 3755 	ldw x,(XSAVE,sp)
      009603 1C 00 02         [ 2] 3756 	addw x,#2 
      009606 20 8B            [ 2] 3757 	jra 1$ 
      009608 A1 02            [ 1] 3758 6$: cp a,#TK_ARRAY 
      00960A 26 0A            [ 1] 3759 	jrne 7$
      00960C A6 40            [ 1] 3760 	ld a,#'@ 
      00960E CD 82 32         [ 4] 3761 	call putc 
      009611 1E 03            [ 2] 3762 	ldw x,(XSAVE,sp)
      009613 CC 95 93         [ 2] 3763 	jp 1$ 
      009616 A1 04            [ 1] 3764 7$: cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009618 26 14            [ 1] 3765 	jrne 8$
      00961A 72 DE 00 14      [ 5] 3766 	ldw x,([ptr16],x)
      00961E CD 8A 5F         [ 4] 3767 	call print_int
      009621 A6 20            [ 1] 3768 	ld a,#SPACE 
      009623 CD 82 32         [ 4] 3769 	call putc 
      009626 1E 03            [ 2] 3770 	ldw x,(XSAVE,sp)
      009628 1C 00 02         [ 2] 3771 	addw x,#2 
      00962B CC 95 93         [ 2] 3772 	jp 1$
      00962E A1 31            [ 1] 3773 8$: cp a,#TK_GT 
      009630 2B 1A            [ 1] 3774 	jrmi 9$
      009632 A1 35            [ 1] 3775 	cp a,#TK_NE 
      009634 22 16            [ 1] 3776 	jrugt 9$
      009636 A0 31            [ 1] 3777 	sub a,#TK_GT  
      009638 48               [ 1] 3778 	sll a 
      009639 90 5F            [ 1] 3779 	clrw y 
      00963B 90 97            [ 1] 3780 	ld yl,a 
      00963D 72 A9 96 BB      [ 2] 3781 	addw y,#relop_str 
      009641 90 FE            [ 2] 3782 	ldw y,(y)
      009643 93               [ 1] 3783 	ldw x,y 
      009644 CD 82 44         [ 4] 3784 	call puts 
      009647 1E 03            [ 2] 3785 	ldw x,(XSAVE,sp)
      009649 CC 95 93         [ 2] 3786 	jp 1$
      00964C A1 10            [ 1] 3787 9$: cp a,#TK_PLUS 
      00964E 26 04            [ 1] 3788 	jrne 10$
      009650 A6 2B            [ 1] 3789 	ld a,#'+
      009652 20 46            [ 2] 3790 	jra 80$ 
      009654 A1 11            [ 1] 3791 10$: cp a,#TK_MINUS
      009656 26 04            [ 1] 3792 	jrne 11$
      009658 A6 2D            [ 1] 3793 	ld a,#'-
      00965A 20 3E            [ 2] 3794 	jra 80$
      00965C A1 20            [ 1] 3795 11$: cp a,#TK_MULT 
      00965E 2B 0E            [ 1] 3796 	jrmi 12$
      009660 A1 22            [ 1] 3797 	cp a,#TK_MOD 
      009662 22 0A            [ 1] 3798 	jrugt 12$
      009664 A0 20            [ 1] 3799 	sub a,#0x20
      009666 5F               [ 1] 3800 	clrw x 
      009667 97               [ 1] 3801 	ld xl,a 
      009668 1C 96 B8         [ 2] 3802 	addw x,#mul_char 
      00966B F6               [ 1] 3803 	ld a,(x)
      00966C 20 2C            [ 2] 3804 	jra 80$ 
      00966E A1 0B            [ 1] 3805 12$: cp a,#TK_LPAREN 
      009670 2B 0E            [ 1] 3806 	jrmi 13$
      009672 A1 0E            [ 1] 3807 	cp a,#TK_SHARP 
      009674 22 0A            [ 1] 3808 	jrugt 13$
      009676 A0 0B            [ 1] 3809 	sub a,#TK_LPAREN
      009678 5F               [ 1] 3810 	clrw x 
      009679 97               [ 1] 3811 	ld xl,a 
      00967A 1C 96 B4         [ 2] 3812 	addw x,#single_char 
      00967D F6               [ 1] 3813 	ld a,(x)
      00967E 20 1A            [ 2] 3814 	jra 80$
      009680 A1 03            [ 1] 3815 13$: cp a,#TK_CHAR 
      009682 26 14            [ 1] 3816 	jrne 14$
      009684 A6 5C            [ 1] 3817 	ld a,#'\
      009686 CD 82 32         [ 4] 3818 	call putc 
      009689 1E 03            [ 2] 3819 	ldw x,(XSAVE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00968B 72 D6 00 14      [ 4] 3820 	ld a,([ptr16],x)
      00968F 5C               [ 2] 3821 	incw x 
      009690 1F 03            [ 2] 3822 	ldw (XSAVE,sp),x 
      009692 CD 82 32         [ 4] 3823 	call putc 
      009695 CC 95 93         [ 2] 3824 	jp 1$ 
      009698 A6 3A            [ 1] 3825 14$: ld a,#':
      00969A CD 82 32         [ 4] 3826 80$: call putc 
      00969D 1E 03            [ 2] 3827 	ldw x,(XSAVE,sp)
      00969F CC 95 93         [ 2] 3828 	jp 1$ 
      0096A2                       3829 90$: 
      0096A2 A6 0D            [ 1] 3830 	ld a,#CR 
      0096A4 CD 82 32         [ 4] 3831 	call putc
      0096A7 7B 02            [ 1] 3832 	ld a,(WIDTH_SAV,sp) 
      0096A9 C7 00 23         [ 1] 3833 	ld tab_width,a 
      0096AC 7B 01            [ 1] 3834 	ld a,(BASE_SAV,sp) 
      0096AE C7 00 07         [ 1] 3835 	ld base,a
      001631                       3836 	_drop VSIZE 
      0096B1 5B 05            [ 2]    1     addw sp,#VSIZE 
      0096B3 81               [ 4] 3837 	ret 	
      0096B4 28 29 2C 23           3838 single_char: .byte '(',')',',','#'
      0096B8 2A 2F 25              3839 mul_char: .byte '*','/','%'
      0096BB 96 C7 96 C9 96 CB 96  3840 relop_str: .word gt,equal,ge,lt,le,ne 
             CE 96 D0 96 D3
      0096C7 3E 00                 3841 gt: .asciz ">"
      0096C9 3D 00                 3842 equal: .asciz "="
      0096CB 3E 3D 00              3843 ge: .asciz ">="
      0096CE 3C 00                 3844 lt: .asciz "<"
      0096D0 3C 3D 00              3845 le: .asciz "<="
      0096D3 3C 3E 00              3846 ne:  .asciz "<>"
                                   3847 
                                   3848 
                                   3849 ;---------------------------------
                                   3850 ; BASIC: PRINT|? arg_list 
                                   3851 ; print values from argument list
                                   3852 ;----------------------------------
                           000001  3853 	COMMA=1
                           000001  3854 	VSIZE=1
      0096D6                       3855 print:
      0096D6 4B 00            [ 1] 3856 push #0 ; local variable COMMA 
      0096D8                       3857 reset_comma:
      0096D8 0F 01            [ 1] 3858 	clr (COMMA,sp)
      0096DA                       3859 prt_loop:
      0096DA CD 93 CD         [ 4] 3860 	call relation 
      0096DD A1 01            [ 1] 3861 	cp a,#TK_COLON 
      0096DF 27 5A            [ 1] 3862 	jreq print_exit   
      0096E1 A1 04            [ 1] 3863 	cp a,#TK_INTGR 
      0096E3 26 05            [ 1] 3864 	jrne 0$ 
      0096E5 CD 8A 5F         [ 4] 3865 	call print_int 
      0096E8 20 EE            [ 2] 3866 	jra reset_comma
      0096EA                       3867 0$: 	
      0096EA CD 88 C6         [ 4] 3868 	call next_token
      0096ED A1 00            [ 1] 3869 	cp a,#TK_NONE 
      0096EF 27 4A            [ 1] 3870 	jreq print_exit 
      0096F1 A1 0A            [ 1] 3871 1$:	cp a,#TK_QSTR
      0096F3 26 0E            [ 1] 3872 	jrne 2$   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0096F5 CD 82 44         [ 4] 3873 	call puts
      0096F8 5C               [ 2] 3874 	incw x 
      0096F9 72 B0 00 05      [ 2] 3875 	subw x,basicptr 
      0096FD 9F               [ 1] 3876 	ld a,xl 
      0096FE C7 00 02         [ 1] 3877 	ld in,a  
      009701 20 D5            [ 2] 3878 	jra reset_comma
      009703 A1 03            [ 1] 3879 2$: cp a,#TK_CHAR 
      009705 26 06            [ 1] 3880 	jrne 3$
      009707 9F               [ 1] 3881 	ld a,xl 
      009708 CD 82 32         [ 4] 3882 	call putc 
      00970B 20 CB            [ 2] 3883 	jra reset_comma 
      00970D                       3884 3$: 	
      00970D A1 08            [ 1] 3885 	cp a,#TK_CFUNC 
      00970F 26 07            [ 1] 3886 	jrne 4$ 
      009711 FD               [ 4] 3887 	call (x)
      009712 9F               [ 1] 3888 	ld a,xl 
      009713 CD 82 32         [ 4] 3889 	call putc
      009716 20 C0            [ 2] 3890 	jra reset_comma 
      009718                       3891 4$: 
      009718 A1 0D            [ 1] 3892 	cp a,#TK_COMMA 
      00971A 26 05            [ 1] 3893 	jrne 5$
      00971C 03 01            [ 1] 3894 	cpl (COMMA,sp) 
      00971E CC 96 DA         [ 2] 3895 	jp prt_loop   
      009721                       3896 5$: 
      009721 A1 0E            [ 1] 3897 	cp a,#TK_SHARP
      009723 26 13            [ 1] 3898 	jrne 7$
      009725 CD 88 C6         [ 4] 3899 	call next_token
      009728 A1 04            [ 1] 3900 	cp a,#TK_INTGR 
      00972A 27 03            [ 1] 3901 	jreq 6$
      00972C CC 87 FF         [ 2] 3902 	jp syntax_error 
      00972F                       3903 6$:
      00972F 9F               [ 1] 3904 	ld a,xl 
      009730 A4 0F            [ 1] 3905 	and a,#15 
      009732 C7 00 23         [ 1] 3906 	ld tab_width,a 
      009735 CC 96 D8         [ 2] 3907 	jp reset_comma 
      009738                       3908 7$:	
      009738 CD 90 52         [ 4] 3909 	call unget_token
      00973B                       3910 print_exit:
      00973B 0D 01            [ 1] 3911 	tnz (COMMA,sp)
      00973D 26 05            [ 1] 3912 	jrne 9$
      00973F A6 0D            [ 1] 3913 	ld a,#CR 
      009741 CD 82 32         [ 4] 3914     call putc 
      0016C4                       3915 9$:	_drop VSIZE 
      009744 5B 01            [ 2]    1     addw sp,#VSIZE 
      009746 81               [ 4] 3916 	ret 
                                   3917 
                                   3918 ;----------------------
                                   3919 ; 'save_context' and
                                   3920 ; 'rest_context' must be 
                                   3921 ; called at the same 
                                   3922 ; call stack depth 
                                   3923 ; i.e. SP must have the 
                                   3924 ; save value at  
                                   3925 ; entry point of both 
                                   3926 ; routine. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3927 ;---------------------
                           000006  3928 	CTXT_SIZE=6 ; size of saved data 
                                   3929 ;--------------------
                                   3930 ; save current BASIC
                                   3931 ; interpreter context 
                                   3932 ; on cstack 
                                   3933 ;--------------------
      009747                       3934 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0016C7                       3935 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      0016C7                       3936 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      0016C7                       3937 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      0016C7                       3938 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      0016C7                       3939 save_context:
      009747 CE 00 05         [ 2] 3940 	ldw x,basicptr 
      00974A 1F 03            [ 2] 3941 	ldw (BPTR,sp),x
      00974C C6 00 02         [ 1] 3942 	ld a,in 
      00974F 6B 07            [ 1] 3943 	ld (IN,sp),a
      009751 C6 00 04         [ 1] 3944 	ld a,count 
      009754 6B 08            [ 1] 3945 	ld (CNT,sp),a  
      009756 81               [ 4] 3946 	ret
                                   3947 
                                   3948 ;-----------------------
                                   3949 ; restore previously saved 
                                   3950 ; BASIC interpreter context 
                                   3951 ; from cstack 
                                   3952 ;-------------------------
      009757                       3953 rest_context:
      009757 1E 03            [ 2] 3954 	ldw x,(BPTR,sp)
      009759 CF 00 05         [ 2] 3955 	ldw basicptr,x 
      00975C 7B 07            [ 1] 3956 	ld a,(IN,sp)
      00975E C7 00 02         [ 1] 3957 	ld in,a
      009761 7B 08            [ 1] 3958 	ld a,(CNT,sp)
      009763 C7 00 04         [ 1] 3959 	ld count,a  
      009766 81               [ 4] 3960 	ret
                                   3961 
                                   3962 ;------------------------------------------
                                   3963 ; BASIC: INPUT [string],var[,[string],var]
                                   3964 ; input value in variables 
                                   3965 ; [string] optionally can be used as prompt 
                                   3966 ;-----------------------------------------
                           000001  3967 	CX_BPTR=1
                           000003  3968 	CX_LNO=3
                           000004  3969 	CX_IN=4
                           000005  3970 	CX_CNT=5
                           000006  3971 	SKIP=6
                           000007  3972 	VSIZE=7
      009767                       3973 input_var:
      009767 72 00 00 22 05   [ 2] 3974 	btjt flags,#FRUN,1$ 
      00976C A6 06            [ 1] 3975 	ld a,#ERR_RUN_ONLY 
      00976E CC 88 01         [ 2] 3976 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0016F1                       3977 1$:	_vars VSIZE 
      009771 52 07            [ 2]    1     sub sp,#VSIZE 
      009773                       3978 input_loop:
      009773 0F 06            [ 1] 3979 	clr (SKIP,sp)
      009775 CD 88 C6         [ 4] 3980 	call next_token 
      009778 A1 00            [ 1] 3981 	cp a,#TK_NONE 
      00977A 27 5C            [ 1] 3982 	jreq input_exit 
      00977C A1 0A            [ 1] 3983 	cp a,#TK_QSTR 
      00977E 26 08            [ 1] 3984 	jrne 1$ 
      009780 CD 82 44         [ 4] 3985 	call puts 
      009783 03 06            [ 1] 3986 	cpl (SKIP,sp)
      009785 CD 88 C6         [ 4] 3987 	call next_token 
      009788 A1 05            [ 1] 3988 1$: cp a,#TK_VAR  
      00978A 27 03            [ 1] 3989 	jreq 2$ 
      00978C CC 87 FF         [ 2] 3990 	jp syntax_error
      00978F CD 90 58         [ 4] 3991 2$:	call dpush 
      009792 0D 06            [ 1] 3992 	tnz (SKIP,sp)
      009794 26 0F            [ 1] 3993 	jrne 21$ 
      009796 A6 3A            [ 1] 3994 	ld a,#':
      009798 C7 17 19         [ 1] 3995 	ld pad+1,a 
      00979B 72 5F 17 1A      [ 1] 3996 	clr pad+2
      00979F AE 17 18         [ 2] 3997 	ldw x,#pad 
      0097A2 CD 82 44         [ 4] 3998 	call puts   
      0097A5                       3999 21$:
      0097A5 CD 97 47         [ 4] 4000 	call save_context 
      0097A8 AE 16 C8         [ 2] 4001 	ldw x,#tib 
      0097AB CF 00 05         [ 2] 4002 	ldw basicptr,x  
      0097AE 72 5F 00 04      [ 1] 4003 	clr count  
      0097B2 CD 8B 4D         [ 4] 4004 	call readln 
      0097B5 72 5F 00 02      [ 1] 4005 	clr in 
      0097B9 CD 93 CD         [ 4] 4006 	call relation 
      0097BC A1 04            [ 1] 4007 	cp a,#TK_INTGR
      0097BE 27 03            [ 1] 4008 	jreq 3$ 
      0097C0 CC 87 FF         [ 2] 4009 	jp syntax_error
      0097C3 CD 90 58         [ 4] 4010 3$: call dpush 
      0097C6 CD 90 BF         [ 4] 4011 	call store 
      0097C9 CD 97 57         [ 4] 4012 	call rest_context
      0097CC CD 88 C6         [ 4] 4013 	call next_token 
      0097CF A1 0D            [ 1] 4014 	cp a,#TK_COMMA 
      0097D1 26 02            [ 1] 4015 	jrne 4$
      0097D3 20 9E            [ 2] 4016 	jra input_loop 
      0097D5 CD 90 52         [ 4] 4017 4$:	call unget_token 
      0097D8                       4018 input_exit:
      001758                       4019 	_drop VSIZE 
      0097D8 5B 07            [ 2]    1     addw sp,#VSIZE 
      0097DA 81               [ 4] 4020 	ret 
                                   4021 
                                   4022 
                                   4023 ;---------------------
                                   4024 ; BASIC: REMARK | ' 
                                   4025 ; skip comment to end of line 
                                   4026 ;---------------------- 
      0097DB                       4027 rem:
      0097DB 55 00 02 00 04   [ 1] 4028  	mov count,in 
      0097E0 81               [ 4] 4029 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4030 
                                   4031 ;---------------------
                                   4032 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   4033 ; read in loop 'addr'  
                                   4034 ; apply & 'mask' to value 
                                   4035 ; loop while result==0.  
                                   4036 ; if 'xor_mask' given 
                                   4037 ; apply ^ in second  
                                   4038 ; loop while result==0 
                                   4039 ;---------------------
                           000001  4040 	XMASK=1 
                           000002  4041 	MASK=2
                           000003  4042 	ADDR=3
                           000004  4043 	VSIZE=4
      0097E1                       4044 wait: 
      001761                       4045 	_vars VSIZE
      0097E1 52 04            [ 2]    1     sub sp,#VSIZE 
      0097E3 0F 01            [ 1] 4046 	clr (XMASK,sp) 
      0097E5 CD 92 85         [ 4] 4047 	call arg_list 
      0097E8 A1 02            [ 1] 4048 	cp a,#2
      0097EA 24 03            [ 1] 4049 	jruge 0$
      0097EC CC 87 FF         [ 2] 4050 	jp syntax_error 
      0097EF A1 03            [ 1] 4051 0$:	cp a,#3
      0097F1 25 06            [ 1] 4052 	jrult 1$
      0097F3 CD 90 65         [ 4] 4053 	call dpop 
      0097F6 9F               [ 1] 4054 	ld a,xl
      0097F7 6B 01            [ 1] 4055 	ld (XMASK,sp),a 
      0097F9 CD 90 65         [ 4] 4056 1$: call dpop ; mask 
      0097FC 9F               [ 1] 4057 	ld a,xl 
      0097FD 6B 02            [ 1] 4058 	ld (MASK,sp),a 
      0097FF CD 90 65         [ 4] 4059 	call dpop ; address 
      009802 F6               [ 1] 4060 2$:	ld a,(x)
      009803 14 02            [ 1] 4061 	and a,(MASK,sp)
      009805 18 01            [ 1] 4062 	xor a,(XMASK,sp)
      009807 27 F9            [ 1] 4063 	jreq 2$ 
      001789                       4064 	_drop VSIZE 
      009809 5B 04            [ 2]    1     addw sp,#VSIZE 
      00980B 81               [ 4] 4065 	ret 
                                   4066 
                                   4067 ;---------------------
                                   4068 ; BASIC: BSET addr,mask
                                   4069 ; set bits at 'addr' corresponding 
                                   4070 ; to those of 'mask' that are at 1.
                                   4071 ; arguments:
                                   4072 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4073 ;   mask        mask|addr
                                   4074 ; output:
                                   4075 ;	none 
                                   4076 ;--------------------------
      00980C                       4077 bit_set:
      00980C CD 92 85         [ 4] 4078 	call arg_list 
      00980F A1 02            [ 1] 4079 	cp a,#2	 
      009811 27 03            [ 1] 4080 	jreq 1$ 
      009813 CC 87 FF         [ 2] 4081 	jp syntax_error
      009816                       4082 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009816 CD 90 65         [ 4] 4083 	call dpop ; mask 
      009819 9F               [ 1] 4084 	ld a,xl 
      00981A CD 90 65         [ 4] 4085 	call dpop ; addr  
      00981D FA               [ 1] 4086 	or a,(x)
      00981E F7               [ 1] 4087 	ld (x),a
      00981F 81               [ 4] 4088 	ret 
                                   4089 
                                   4090 ;---------------------
                                   4091 ; BASIC: BRES addr,mask
                                   4092 ; reset bits at 'addr' corresponding 
                                   4093 ; to those of 'mask' that are at 1.
                                   4094 ; arguments:
                                   4095 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4096 ;   mask	    ~mask&*addr  
                                   4097 ; output:
                                   4098 ;	none 
                                   4099 ;--------------------------
      009820                       4100 bit_reset:
      009820 CD 92 85         [ 4] 4101 	call arg_list 
      009823 A1 02            [ 1] 4102 	cp a,#2  
      009825 27 03            [ 1] 4103 	jreq 1$ 
      009827 CC 87 FF         [ 2] 4104 	jp syntax_error
      00982A                       4105 1$: 
      00982A CD 90 65         [ 4] 4106 	call dpop ; mask 
      00982D 9F               [ 1] 4107 	ld a,xl 
      00982E 43               [ 1] 4108 	cpl a 
      00982F CD 90 65         [ 4] 4109 	call dpop ; addr  
      009832 F4               [ 1] 4110 	and a,(x)
      009833 F7               [ 1] 4111 	ld (x),a 
      009834 81               [ 4] 4112 	ret 
                                   4113 
                                   4114 ;---------------------
                                   4115 ; BASIC: BRES addr,mask
                                   4116 ; toggle bits at 'addr' corresponding 
                                   4117 ; to those of 'mask' that are at 1.
                                   4118 ; arguments:
                                   4119 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4120 ;   mask	    mask^*addr  
                                   4121 ; output:
                                   4122 ;	none 
                                   4123 ;--------------------------
      009835                       4124 bit_toggle:
      009835 CD 92 85         [ 4] 4125 	call arg_list 
      009838 A1 02            [ 1] 4126 	cp a,#2 
      00983A 27 03            [ 1] 4127 	jreq 1$ 
      00983C CC 87 FF         [ 2] 4128 	jp syntax_error
      00983F CD 90 65         [ 4] 4129 1$: call dpop ; mask 
      009842 9F               [ 1] 4130 	ld a,xl 
      009843 CD 90 65         [ 4] 4131 	call dpop ; addr  
      009846 F8               [ 1] 4132 	xor a,(x)
      009847 F7               [ 1] 4133 	ld (x),a 
      009848 81               [ 4] 4134 	ret 
                                   4135 
                                   4136 
                                   4137 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4138 ; BASIC: BTEST(addr,bit)
                                   4139 ; return bit value at 'addr' 
                                   4140 ; bit is in range {0..7}.
                                   4141 ; arguments:
                                   4142 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4143 ;   bit 	    bit position {0..7}  
                                   4144 ; output:
                                   4145 ;	none 
                                   4146 ;--------------------------
      009849                       4147 bit_test:
      009849 CD 92 A9         [ 4] 4148 	call func_args 
      00984C A1 02            [ 1] 4149 	cp a,#2
      00984E 27 03            [ 1] 4150 	jreq 0$
      009850 CC 87 FF         [ 2] 4151 	jp syntax_error
      009853                       4152 0$:	
      009853 CD 90 65         [ 4] 4153 	call dpop 
      009856 9F               [ 1] 4154 	ld a,xl 
      009857 A4 07            [ 1] 4155 	and a,#7
      009859 88               [ 1] 4156 	push a 
      00985A A6 01            [ 1] 4157 	ld a,#1 
      00985C 0D 01            [ 1] 4158 1$: tnz (1,sp)
      00985E 27 05            [ 1] 4159 	jreq 2$
      009860 48               [ 1] 4160 	sll a 
      009861 0A 01            [ 1] 4161 	dec (1,sp)
      009863 20 F7            [ 2] 4162 	jra 1$
      009865 CD 90 65         [ 4] 4163 2$: call dpop 
      009868 F4               [ 1] 4164 	and a,(x)
      009869 27 02            [ 1] 4165 	jreq 3$
      00986B A6 01            [ 1] 4166 	ld a,#1 
      00986D 5F               [ 1] 4167 3$:	clrw x 
      00986E 97               [ 1] 4168 	ld xl,a 
      00986F A6 04            [ 1] 4169 	ld a,#TK_INTGR
      0017F1                       4170 	_drop 1 
      009871 5B 01            [ 2]    1     addw sp,#1 
      009873 81               [ 4] 4171 	ret
                                   4172 
                                   4173 
                                   4174 ;--------------------
                                   4175 ; BASIC: POKE addr,byte
                                   4176 ; put a byte at addr 
                                   4177 ;--------------------
      009874                       4178 poke:
      009874 CD 92 85         [ 4] 4179 	call arg_list 
      009877 A1 02            [ 1] 4180 	cp a,#2
      009879 27 03            [ 1] 4181 	jreq 1$
      00987B CC 87 FF         [ 2] 4182 	jp syntax_error
      00987E                       4183 1$:	
      00987E CD 90 65         [ 4] 4184 	call dpop 
      009881 9F               [ 1] 4185     ld a,xl 
      009882 CD 90 65         [ 4] 4186 	call dpop 
      009885 F7               [ 1] 4187 	ld (x),a 
      009886 81               [ 4] 4188 	ret 
                                   4189 
                                   4190 ;-----------------------
                                   4191 ; BASIC: PEEK(addr)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4192 ; get the byte at addr 
                                   4193 ; input:
                                   4194 ;	none 
                                   4195 ; output:
                                   4196 ;	X 		value 
                                   4197 ;-----------------------
      009887                       4198 peek:
      009887 CD 92 A9         [ 4] 4199 	call func_args
      00988A A1 01            [ 1] 4200 	cp a,#1
      00988C 27 03            [ 1] 4201 	jreq 1$
      00988E CC 87 FF         [ 2] 4202 	jp syntax_error
      009891 CD 90 65         [ 4] 4203 1$:	call dpop 
      009894 F6               [ 1] 4204 	ld a,(x)
      009895 5F               [ 1] 4205 	clrw x 
      009896 97               [ 1] 4206 	ld xl,a 
      009897 A6 04            [ 1] 4207 	ld a,#TK_INTGR
      009899 81               [ 4] 4208 	ret 
                                   4209 
                                   4210 ;----------------------------
                                   4211 ; BASIC: XPEEK(page,addr)
                                   4212 ; read extended memory byte
                                   4213 ; page in range {0,1,2}
                                   4214 ;----------------------------
      00989A                       4215 xpeek:
      00989A CD 92 A9         [ 4] 4216 	call func_args 
      00989D A1 02            [ 1] 4217 	cp a,#2 
      00989F 27 03            [ 1] 4218 	jreq 1$
      0098A1 CC 87 FF         [ 2] 4219 	jp syntax_error
      0098A4                       4220 1$: 
      0098A4 CD 90 65         [ 4] 4221 	call dpop 
      0098A7 CF 00 14         [ 2] 4222 	ldw farptr+1,x 
      0098AA CD 90 65         [ 4] 4223 	call dpop 
      0098AD 9F               [ 1] 4224 	ld a,xl 
      0098AE C7 00 13         [ 1] 4225 	ld farptr,a 
      0098B1 5F               [ 1] 4226 	clrw x
      0098B2 92 BC 00 13      [ 5] 4227 	ldf a,[farptr]
      0098B6 97               [ 1] 4228 	ld xl,a 
      0098B7 A6 04            [ 1] 4229 	ld a,#TK_INTGR 
      0098B9 81               [ 4] 4230 	ret 
                                   4231 
                                   4232 ;---------------------------
                                   4233 ; BASIC IF expr : instructions
                                   4234 ; evaluate expr and if true 
                                   4235 ; execute instructions on same line. 
                                   4236 ;----------------------------
      0098BA                       4237 if: 
      0098BA CD 93 CD         [ 4] 4238 	call relation 
      0098BD A1 04            [ 1] 4239 	cp a,#TK_INTGR
      0098BF 27 03            [ 1] 4240 	jreq 1$ 
      0098C1 CC 87 FF         [ 2] 4241 	jp syntax_error
      0098C4 4F               [ 1] 4242 1$:	clr a 
      0098C5 5D               [ 2] 4243 	tnzw x 
      0098C6 26 05            [ 1] 4244 	jrne 9$  
                                   4245 ;skip to next line
      0098C8 55 00 04 00 02   [ 1] 4246 	mov in,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0098CD 81               [ 4] 4247 9$:	ret 
                                   4248 
                                   4249 ;------------------------
                                   4250 ; BASIC: FOR var=expr 
                                   4251 ; set variable to expression 
                                   4252 ; leave variable address 
                                   4253 ; on dstack and set
                                   4254 ; FFOR bit in 'flags'
                                   4255 ;-----------------
                           000001  4256 	RETL1=1
                           000003  4257 	INW=3
                           000005  4258 	BPTR=5
      0098CE                       4259 for: ; { -- var_addr }
      0098CE A6 05            [ 1] 4260 	ld a,#TK_VAR 
      0098D0 CD 92 78         [ 4] 4261 	call expect
      0098D3 CD 90 58         [ 4] 4262 	call dpush 
      0098D6 CD 94 74         [ 4] 4263 	call let02 
      0098D9 72 14 00 22      [ 1] 4264 	bset flags,#FFOR 
                                   4265 ; open space on cstack for BPTR and INW 
      0098DD 85               [ 2] 4266 	popw x ; call return address 
      00185E                       4267 	_vars 4
      0098DE 52 04            [ 2]    1     sub sp,#4 
      0098E0 89               [ 2] 4268 	pushw x  ; RETL1 
      0098E1 5F               [ 1] 4269 	clrw x 
      0098E2 1F 05            [ 2] 4270 	ldw (BPTR,sp),x 
      0098E4 1F 03            [ 2] 4271 	ldw (INW,sp),x 
      0098E6 CD 88 C6         [ 4] 4272 	call next_token 
      0098E9 A1 06            [ 1] 4273 	cp a,#TK_CMD 
      0098EB 27 03            [ 1] 4274 	jreq 1$
      0098ED CC 87 FF         [ 2] 4275 	jp syntax_error
      0098F0                       4276 1$:  
      0098F0 A3 98 F8         [ 2] 4277 	cpw x,#to 
      0098F3 27 03            [ 1] 4278 	jreq to
      0098F5 CC 87 FF         [ 2] 4279 	jp syntax_error 
                                   4280 
                                   4281 ;-----------------------------------
                                   4282 ; BASIC: TO expr 
                                   4283 ; second part of FOR loop initilization
                                   4284 ; leave limit on dstack and set 
                                   4285 ; FTO bit in 'flags'
                                   4286 ;-----------------------------------
      0098F8                       4287 to: ; { var_addr -- var_addr limit step }
      0098F8 72 04 00 22 03   [ 2] 4288 	btjt flags,#FFOR,1$
      0098FD CC 87 FF         [ 2] 4289 	jp syntax_error
      009900 CD 93 CD         [ 4] 4290 1$: call relation  
      009903 A1 04            [ 1] 4291 	cp a,#TK_INTGR 
      009905 27 03            [ 1] 4292 	jreq 2$ 
      009907 CC 87 FF         [ 2] 4293 	jp syntax_error
      00990A                       4294 2$: 
      00990A CD 90 58         [ 4] 4295     call dpush ; limit
      00990D CE 00 01         [ 2] 4296 	ldw x,in.w 
      009910 CD 88 C6         [ 4] 4297 	call next_token
      009913 A1 00            [ 1] 4298 	cp a,#TK_NONE  
      009915 27 0C            [ 1] 4299 	jreq 4$ 
      009917 A1 06            [ 1] 4300 	cp a,#TK_CMD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009919 26 05            [ 1] 4301 	jrne 3$
      00991B A3 99 28         [ 2] 4302 	cpw x,#step 
      00991E 27 08            [ 1] 4303 	jreq step
      009920                       4304 3$:	
      009920 CD 90 52         [ 4] 4305 	call unget_token   	 
      009923                       4306 4$:	
      009923 AE 00 01         [ 2] 4307 	ldw x,#1   ; default step  
      009926 20 12            [ 2] 4308 	jra store_loop_addr 
                                   4309 
                                   4310 
                                   4311 ;----------------------------------
                                   4312 ; BASIC: STEP expr 
                                   4313 ; optional third par of FOR loop
                                   4314 ; initialization. 	
                                   4315 ;------------------------------------
      009928                       4316 step: ; {var limit -- var limit step}
      009928 72 04 00 22 03   [ 2] 4317 	btjt flags,#FFOR,1$
      00992D CC 87 FF         [ 2] 4318 	jp syntax_error
      009930 CD 93 CD         [ 4] 4319 1$: call relation
      009933 A1 04            [ 1] 4320 	cp a,#TK_INTGR
      009935 27 03            [ 1] 4321 	jreq store_loop_addr  
      009937 CC 87 FF         [ 2] 4322 	jp syntax_error
                                   4323 ; leave loop back entry point on cstack 
                                   4324 ; cstack is 2 call deep from interp_loop
      00993A                       4325 store_loop_addr:
      00993A CD 90 58         [ 4] 4326 	call dpush 
      00993D CE 00 05         [ 2] 4327 	ldw x,basicptr  
      009940 1F 05            [ 2] 4328 	ldw (BPTR,sp),x 
      009942 CE 00 01         [ 2] 4329 	ldw x,in.w 
      009945 1F 03            [ 2] 4330 	ldw (INW,sp),x   
      009947 72 15 00 22      [ 1] 4331 	bres flags,#FFOR 
      00994B 72 5C 00 1F      [ 1] 4332 	inc loop_depth  
      00994F 81               [ 4] 4333 	ret 
                                   4334 
                                   4335 ;--------------------------------
                                   4336 ; BASIC: NEXT var 
                                   4337 ; FOR loop control 
                                   4338 ; increment variable with step 
                                   4339 ; and compare with limit 
                                   4340 ; loop if threshold not crossed.
                                   4341 ; else clean both stacks. 
                                   4342 ; and decrement 'loop_depth' 
                                   4343 ;--------------------------------
      009950                       4344 next: ; {var limit step -- [var limit step ] }
      009950 72 5D 00 1F      [ 1] 4345 	tnz loop_depth 
      009954 26 03            [ 1] 4346 	jrne 1$ 
      009956 CC 87 FF         [ 2] 4347 	jp syntax_error 
      009959                       4348 1$: 
      009959 A6 05            [ 1] 4349 	ld a,#TK_VAR 
      00995B CD 92 78         [ 4] 4350 	call expect
                                   4351 ; check for good variable after NEXT 	 
      00995E 90 93            [ 1] 4352 	ldw y,x 
      009960 AE 00 04         [ 2] 4353 	ldw x,#4  
      009963 72 D3 00 19      [ 4] 4354 	cpw y,([dstkptr],x) ; compare variables address 
      009967 27 03            [ 1] 4355 	jreq 2$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009969 CC 87 FF         [ 2] 4356 	jp syntax_error ; not the good one 
      00996C                       4357 2$: ; increment variable 
      00996C 93               [ 1] 4358 	ldw x,y
      00996D FE               [ 2] 4359 	ldw x,(x)  ; get var value 
      00996E CF 00 09         [ 2] 4360 	ldw acc16,x 
      009971 72 CE 00 19      [ 5] 4361 	ldw x,[dstkptr] ; step
      009975 72 BB 00 09      [ 2] 4362 	addw x,acc16 ; var+step 
      009979 90 FF            [ 2] 4363 	ldw (y),x ; save var new value 
                                   4364 ; compare with limit 
      00997B 90 93            [ 1] 4365 	ldw y,x 
      00997D 72 CE 00 19      [ 5] 4366 	ldw x,[dstkptr] ; step in x 
      009981 5D               [ 2] 4367 	tnzw x  
      009982 2A 0B            [ 1] 4368 	jrpl 4$ ; positive step 
                                   4369 ;negative step 
      009984 AE 00 02         [ 2] 4370 	ldw x,#2
      009987 72 D3 00 19      [ 4] 4371 	cpw y,([dstkptr],x)
      00998B 2F 20            [ 1] 4372 	jrslt loop_done
      00998D 20 09            [ 2] 4373 	jra loop_back 
      00998F                       4374 4$: ; positive step
      00998F AE 00 02         [ 2] 4375 	ldw x,#2 
      009992 72 D3 00 19      [ 4] 4376 	cpw y,([dstkptr],x)
      009996 2C 15            [ 1] 4377 	jrsgt loop_done
      009998                       4378 loop_back:
      009998 1E 05            [ 2] 4379 	ldw x,(BPTR,sp)
      00999A CF 00 05         [ 2] 4380 	ldw basicptr,x 
      00999D 72 01 00 22 05   [ 2] 4381 	btjf flags,#FRUN,1$ 
      0099A2 E6 02            [ 1] 4382 	ld a,(2,x)
      0099A4 C7 00 04         [ 1] 4383 	ld count,a
      0099A7 1E 03            [ 2] 4384 1$:	ldw x,(INW,sp)
      0099A9 CF 00 01         [ 2] 4385 	ldw in.w,x 
      0099AC 81               [ 4] 4386 	ret 
      0099AD                       4387 loop_done:
                                   4388 	; remove var limit step on dstack 
      0099AD CE 00 19         [ 2] 4389 	ldw x,dstkptr 
      0099B0 1C 00 06         [ 2] 4390 	addw x,#3*CELL_SIZE
      0099B3 CF 00 19         [ 2] 4391 	ldw dstkptr,x 
                                   4392 	; remove 2 return address on cstack 
      0099B6 85               [ 2] 4393 	popw x
      001937                       4394 	_drop 4
      0099B7 5B 04            [ 2]    1     addw sp,#4 
      0099B9 89               [ 2] 4395 	pushw x 
      0099BA 72 5A 00 1F      [ 1] 4396 	dec loop_depth 
      0099BE 81               [ 4] 4397 	ret 
                                   4398 
                                   4399 
                                   4400 ;------------------------
                                   4401 ; BASIC: GOTO line# 
                                   4402 ; jump to line# 
                                   4403 ; here cstack is 2 call deep from interp_loop 
                                   4404 ;------------------------
      0099BF                       4405 goto:
      0099BF 72 00 00 22 06   [ 2] 4406 	btjt flags,#FRUN,0$ 
      0099C4 A6 06            [ 1] 4407 	ld a,#ERR_RUN_ONLY
      0099C6 CC 88 01         [ 2] 4408 	jp tb_error 
      0099C9 81               [ 4] 4409 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0099CA 20 23            [ 2] 4410 0$:	jra go_common
                                   4411 
                                   4412 ;--------------------
                                   4413 ; BASIC: GOSUB line#
                                   4414 ; basic subroutine call
                                   4415 ; actual line# and basicptr 
                                   4416 ; are saved on cstack
                                   4417 ; here cstack is 2 call deep from interp_loop 
                                   4418 ;--------------------
                           000003  4419 	GOS_RET=3
      0099CC                       4420 gosub:
      0099CC 72 00 00 22 06   [ 2] 4421 	btjt flags,#FRUN,0$ 
      0099D1 A6 06            [ 1] 4422 	ld a,#ERR_RUN_ONLY
      0099D3 CC 88 01         [ 2] 4423 	jp tb_error 
      0099D6 81               [ 4] 4424 	ret 
      0099D7 85               [ 2] 4425 0$:	popw x 
      0099D8 52 02            [ 2] 4426 	sub sp,#2 
      0099DA 89               [ 2] 4427 	pushw x 
      0099DB CE 00 05         [ 2] 4428 	ldw x,basicptr
      0099DE E6 02            [ 1] 4429 	ld a,(2,x)
      0099E0 AB 03            [ 1] 4430 	add a,#3 
      0099E2 C7 00 0A         [ 1] 4431 	ld acc8,a 
      0099E5 72 5F 00 09      [ 1] 4432 	clr acc16 
      0099E9 72 BB 00 09      [ 2] 4433 	addw x,acc16
      0099ED 1F 03            [ 2] 4434 	ldw (GOS_RET,sp),x 
      0099EF                       4435 go_common: 
      0099EF CD 93 CD         [ 4] 4436 	call relation 
      0099F2 A1 04            [ 1] 4437 	cp a,#TK_INTGR
      0099F4 27 03            [ 1] 4438 	jreq 1$ 
      0099F6 CC 87 FF         [ 2] 4439 	jp syntax_error
      0099F9                       4440 1$: 
      0099F9 CD 83 74         [ 4] 4441 	call search_lineno  
      0099FC 5D               [ 2] 4442 	tnzw x 
      0099FD 26 05            [ 1] 4443 	jrne 2$ 
      0099FF A6 05            [ 1] 4444 	ld a,#ERR_NO_LINE 
      009A01 CC 88 01         [ 2] 4445 	jp tb_error 
      009A04                       4446 2$: 
      009A04 CF 00 05         [ 2] 4447 	ldw basicptr,x 
      009A07 E6 02            [ 1] 4448 	ld a,(2,x)
      009A09 C7 00 04         [ 1] 4449 	ld count,a 
      009A0C 35 03 00 02      [ 1] 4450 	mov in,#3 
      009A10 81               [ 4] 4451 	ret 
                                   4452 
                                   4453 ;------------------------
                                   4454 ; BASIC: RETURN 
                                   4455 ; exit from a subroutine 
                                   4456 ; cstack is 2 level deep from interp_loop 
                                   4457 ;------------------------
      009A11                       4458 return:
      009A11 72 00 00 22 05   [ 2] 4459 	btjt flags,#FRUN,0$ 
      009A16 A6 06            [ 1] 4460 	ld a,#ERR_RUN_ONLY
      009A18 CC 88 01         [ 2] 4461 	jp tb_error 
      009A1B                       4462 0$:	
      009A1B 1E 03            [ 2] 4463 	ldw x,(GOS_RET,sp) 
      009A1D CF 00 05         [ 2] 4464 	ldw basicptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009A20 E6 02            [ 1] 4465 	ld a,(2,x)
      009A22 AB 03            [ 1] 4466 	add a,#3 
      009A24 C7 00 04         [ 1] 4467 	ld count,a 
      009A27 35 03 00 02      [ 1] 4468 	mov in,#3
      009A2B 4F               [ 1] 4469 	clr a 
      009A2C 85               [ 2] 4470 	popw x 
      0019AD                       4471 	_drop 2
      009A2D 5B 02            [ 2]    1     addw sp,#2 
      009A2F 89               [ 2] 4472 	pushw x
      009A30 81               [ 4] 4473 	ret  
                                   4474 
                                   4475 
                                   4476 ;----------------------------------
                                   4477 ; BASIC: RUN
                                   4478 ; run BASIC program in RAM
                                   4479 ;----------------------------------- 
      009A31                       4480 run: 
      009A31 72 01 00 22 02   [ 2] 4481 	btjf flags,#FRUN,0$  
      009A36 4F               [ 1] 4482 	clr a 
      009A37 81               [ 4] 4483 	ret
      009A38                       4484 0$: 
      009A38 72 09 00 22 12   [ 2] 4485 	btjf flags,#FBREAK,1$
      0019BD                       4486 	_drop 2 
      009A3D 5B 02            [ 2]    1     addw sp,#2 
      009A3F CD 97 57         [ 4] 4487 	call rest_context
      0019C2                       4488 	_drop CTXT_SIZE 
      009A42 5B 06            [ 2]    1     addw sp,#CTXT_SIZE 
      009A44 72 19 00 22      [ 1] 4489 	bres flags,#FBREAK 
      009A48 72 10 00 22      [ 1] 4490 	bset flags,#FRUN 
      009A4C CC 88 96         [ 2] 4491 	jp interp_loop 
      009A4F CE 00 1B         [ 2] 4492 1$:	ldw x,txtbgn
      009A52 C3 00 1D         [ 2] 4493 	cpw x,txtend 
      009A55 2B 02            [ 1] 4494 	jrmi run_it 
      009A57 4F               [ 1] 4495 	clr a 
      009A58 81               [ 4] 4496 	ret
                                   4497 
      009A59                       4498 run_it:	 
      009A59 CD 94 48         [ 4] 4499     call ubound 
      0019DC                       4500 	_drop 2 
      009A5C 5B 02            [ 2]    1     addw sp,#2 
      009A5E CE 00 1B         [ 2] 4501 	ldw x,txtbgn 
      009A61 CF 00 05         [ 2] 4502 	ldw basicptr,x 
      009A64 E6 02            [ 1] 4503 	ld a,(2,x)
      009A66 C7 00 04         [ 1] 4504 	ld count,a
      009A69 35 03 00 02      [ 1] 4505 	mov in,#3	
      009A6D 72 10 00 22      [ 1] 4506 	bset flags,#FRUN 
      009A71 CC 88 96         [ 2] 4507 	jp interp_loop 
                                   4508 
                                   4509 
                                   4510 ;----------------------
                                   4511 ; BASIC: STOP 
                                   4512 ; stop running program
                                   4513 ;---------------------- 
      009A74                       4514 stop: 
                                   4515 ; clean dstack and cstack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009A74 AE 17 FF         [ 2] 4516 	ldw x,#STACK_EMPTY 
      009A77 94               [ 1] 4517 	ldw sp,x 
      009A78 72 11 00 22      [ 1] 4518 	bres flags,#FRUN 
      009A7C 72 19 00 22      [ 1] 4519 	bres flags,#FBREAK
      009A80 CC 88 53         [ 2] 4520 	jp warm_start
                                   4521 
                                   4522 
                                   4523 ;-----------------------
                                   4524 ; BASIC BEEP expr1,expr2
                                   4525 ; used MCU internal beeper 
                                   4526 ; to produce a sound
                                   4527 ; arguments:
                                   4528 ;    expr1   frequency  (expr1%32)
                                   4529 ;    expr2   duration msec.
                                   4530 ;---------------------------
      009A83                       4531 tone:
      009A83 CD 92 85         [ 4] 4532 	call arg_list 
      009A86 A1 02            [ 1] 4533 	cp a,#2 
      009A88 27 03            [ 1] 4534 	jreq 1$
      009A8A CC 87 FF         [ 2] 4535 	jp syntax_error 
      009A8D                       4536 1$: 
      009A8D CD 90 65         [ 4] 4537 	call dpop ; duration
      009A90 89               [ 2] 4538 	pushw x 
      009A91 CD 90 65         [ 4] 4539 	call dpop ; frequency
      009A94 90 93            [ 1] 4540 	ldw y,x 
      009A96 AE F4 24         [ 2] 4541 	ldw x,#TIM2_CLK_FREQ
      009A99 65               [ 2] 4542 	divw x,y 
                                   4543 ; round to nearest integer 
      009A9A 90 A3 7A 12      [ 2] 4544 	cpw y,#TIM2_CLK_FREQ/2
      009A9E 2B 01            [ 1] 4545 	jrmi 2$
      009AA0 5C               [ 2] 4546 	incw x 
      009AA1                       4547 2$:	 
      009AA1 9E               [ 1] 4548 	ld a,xh 
      009AA2 C7 53 0D         [ 1] 4549 	ld TIM2_ARRH,a 
      009AA5 9F               [ 1] 4550 	ld a,xl 
      009AA6 C7 53 0E         [ 1] 4551 	ld TIM2_ARRL,a 
                                   4552 ; 50% duty cycle 
      009AA9 8C               [ 1] 4553 	ccf 
      009AAA 56               [ 2] 4554 	rrcw x 
      009AAB 9E               [ 1] 4555 	ld a,xh 
      009AAC C7 53 0F         [ 1] 4556 	ld TIM2_CCR1H,a 
      009AAF 9F               [ 1] 4557 	ld a,xl
      009AB0 C7 53 10         [ 1] 4558 	ld TIM2_CCR1L,a
      009AB3 72 10 53 08      [ 1] 4559 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009AB7 72 10 53 00      [ 1] 4560 	bset TIM2_CR1,#TIM2_CR1_CEN
      009ABB 72 10 53 04      [ 1] 4561 	bset TIM2_EGR,#TIM2_EGR_UG
      009ABF 85               [ 2] 4562 	popw x 
      009AC0 CF 00 0D         [ 2] 4563 	ldw timer,x 
      009AC3 CE 00 0D         [ 2] 4564 3$: ldw x,timer 	
      009AC6 26 FB            [ 1] 4565 	jrne 3$ 
      009AC8 72 11 53 08      [ 1] 4566 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009ACC 72 11 53 00      [ 1] 4567 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009AD0 81               [ 4] 4568 	ret 
                                   4569 
                                   4570 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4571 ; BASIC: PWRADC 0|1 [,divisor]  
                                   4572 ; disable/enanble ADC 
                                   4573 ;-------------------------------
      009AD1                       4574 power_adc:
      009AD1 CD 92 85         [ 4] 4575 	call arg_list 
      009AD4 A1 02            [ 1] 4576 	cp a,#2	
      009AD6 27 0D            [ 1] 4577 	jreq 1$
      009AD8 A1 01            [ 1] 4578 	cp a,#1 
      009ADA 27 03            [ 1] 4579 	jreq 0$ 
      009ADC CC 87 FF         [ 2] 4580 	jp syntax_error 
      009ADF AE 00 00         [ 2] 4581 0$: ldw x,#0
      009AE2 CD 90 58         [ 4] 4582 	call dpush 
      009AE5 AE 00 02         [ 2] 4583 1$: ldw x,#2
      009AE8 72 DE 00 19      [ 5] 4584 	ldw x,([dstkptr],x) ; on|off
      009AEC 5D               [ 2] 4585 	tnzw x 
      009AED 27 1C            [ 1] 4586 	jreq 2$ 
      009AEF 72 CE 00 19      [ 5] 4587 	ldw x,[dstkptr] ; divisor 
      009AF3 9F               [ 1] 4588 	ld a,xl
      009AF4 A4 07            [ 1] 4589 	and a,#7
      009AF6 4E               [ 1] 4590 	swap a 
      009AF7 C7 54 01         [ 1] 4591 	ld ADC_CR1,a
      009AFA 72 16 50 CA      [ 1] 4592 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009AFE 72 10 54 01      [ 1] 4593 	bset ADC_CR1,#ADC_CR1_ADON 
      001A82                       4594 	_usec_dly 7 
      009B02 AE 00 1B         [ 2]    1     ldw x,#(16*7-2)/4
      009B05 5A               [ 2]    2     decw x
      009B06 9D               [ 1]    3     nop 
      009B07 26 FA            [ 1]    4     jrne .-4
      009B09 20 08            [ 2] 4595 	jra 3$
      009B0B 72 11 54 01      [ 1] 4596 2$: bres ADC_CR1,#ADC_CR1_ADON
      009B0F 72 17 50 CA      [ 1] 4597 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      009B13 AE 00 02         [ 2] 4598 3$:	ldw x,#2
      009B16 CD 90 C9         [ 4] 4599 	call ddrop_n 
      009B19 81               [ 4] 4600 	ret
                                   4601 
                                   4602 ;-----------------------------
                                   4603 ; BASIC: RDADC(channel)
                                   4604 ; read adc channel {0..5}
                                   4605 ; output:
                                   4606 ;   A 		TK_INTGR 
                                   4607 ;   X 		value 
                                   4608 ;-----------------------------
      009B1A                       4609 analog_read:
      009B1A CD 92 A9         [ 4] 4610 	call func_args 
      009B1D A1 01            [ 1] 4611 	cp a,#1 
      009B1F 27 03            [ 1] 4612 	jreq 1$
      009B21 CC 87 FF         [ 2] 4613 	jp syntax_error
      009B24 CD 90 65         [ 4] 4614 1$: call dpop 
      009B27 A3 00 05         [ 2] 4615 	cpw x,#5 
      009B2A 23 05            [ 2] 4616 	jrule 2$
      009B2C A6 0A            [ 1] 4617 	ld a,#ERR_BAD_VALUE
      009B2E CC 88 01         [ 2] 4618 	jp tb_error 
      009B31 9F               [ 1] 4619 2$: ld a,xl
      009B32 C7 00 0A         [ 1] 4620 	ld acc8,a 
      009B35 A6 05            [ 1] 4621 	ld a,#5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009B37 C0 00 0A         [ 1] 4622 	sub a,acc8 
      009B3A C7 54 00         [ 1] 4623 	ld ADC_CSR,a
      009B3D 72 16 54 02      [ 1] 4624 	bset ADC_CR2,#ADC_CR2_ALIGN
      009B41 72 10 54 01      [ 1] 4625 	bset ADC_CR1,#ADC_CR1_ADON
      009B45 72 0F 54 00 FB   [ 2] 4626 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009B4A CE 54 04         [ 2] 4627 	ldw x,ADC_DRH
      009B4D A6 04            [ 1] 4628 	ld a,#TK_INTGR
      009B4F 81               [ 4] 4629 	ret 
                                   4630 
                                   4631 ;-----------------------
                                   4632 ; BASIC: DREAD(pin)
                                   4633 ; read state of a digital pin 
                                   4634 ; pin# {0..15}
                                   4635 ; output:
                                   4636 ;    A 		TK_INTGR
                                   4637 ;    X      0|1 
                                   4638 ;-------------------------
                           000001  4639 	PINNO=1
                           000001  4640 	VSIZE=1
      009B50                       4641 digital_read:
      001AD0                       4642 	_vars VSIZE 
      009B50 52 01            [ 2]    1     sub sp,#VSIZE 
      009B52 CD 92 A9         [ 4] 4643 	call func_args
      009B55 A1 01            [ 1] 4644 	cp a,#1
      009B57 27 03            [ 1] 4645 	jreq 1$
      009B59 CC 87 FF         [ 2] 4646 	jp syntax_error
      009B5C CD 90 65         [ 4] 4647 1$: call dpop 
      009B5F A3 00 0F         [ 2] 4648 	cpw x,#15 
      009B62 23 05            [ 2] 4649 	jrule 2$
      009B64 A6 0A            [ 1] 4650 	ld a,#ERR_BAD_VALUE
      009B66 CC 88 01         [ 2] 4651 	jp tb_error 
      009B69 CD A1 61         [ 4] 4652 2$:	call select_pin 
      009B6C 6B 01            [ 1] 4653 	ld (PINNO,sp),a
      009B6E E6 01            [ 1] 4654 	ld a,(GPIO_IDR,x)
      009B70 0D 01            [ 1] 4655 	tnz (PINNO,sp)
      009B72 27 05            [ 1] 4656 	jreq 8$
      009B74 44               [ 1] 4657 3$: srl a 
      009B75 0A 01            [ 1] 4658 	dec (PINNO,sp)
      009B77 26 FB            [ 1] 4659 	jrne 3$ 
      009B79 A4 01            [ 1] 4660 8$: and a,#1 
      009B7B 5F               [ 1] 4661 	clrw x 
      009B7C 97               [ 1] 4662 	ld xl,a 
      009B7D A6 04            [ 1] 4663 	ld a,#TK_INTGR
      001AFF                       4664 	_drop VSIZE
      009B7F 5B 01            [ 2]    1     addw sp,#VSIZE 
      009B81 81               [ 4] 4665 	ret
                                   4666 
                                   4667 ;-----------------------
                                   4668 ; BASIC: DWRITE pin,0|1
                                   4669 ; write to a digital pin 
                                   4670 ; pin# {0..15}
                                   4671 ; output:
                                   4672 ;    A 		TK_INTGR
                                   4673 ;    X      0|1 
                                   4674 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                           000001  4675 	PINNO=1
                           000002  4676 	PINVAL=2
                           000002  4677 	VSIZE=2
      009B82                       4678 digital_write:
      001B02                       4679 	_vars VSIZE 
      009B82 52 02            [ 2]    1     sub sp,#VSIZE 
      009B84 CD 92 85         [ 4] 4680 	call arg_list  
      009B87 A1 02            [ 1] 4681 	cp a,#2 
      009B89 27 03            [ 1] 4682 	jreq 1$
      009B8B CC 87 FF         [ 2] 4683 	jp syntax_error
      009B8E CD 90 65         [ 4] 4684 1$: call dpop 
      009B91 9F               [ 1] 4685 	ld a,xl 
      009B92 6B 02            [ 1] 4686 	ld (PINVAL,sp),a
      009B94 CD 90 65         [ 4] 4687 	call dpop
      009B97 A3 00 0F         [ 2] 4688 	cpw x,#15 
      009B9A 23 05            [ 2] 4689 	jrule 2$
      009B9C A6 0A            [ 1] 4690 	ld a,#ERR_BAD_VALUE
      009B9E CC 88 01         [ 2] 4691 	jp tb_error 
      009BA1 CD A1 61         [ 4] 4692 2$:	call select_pin 
      009BA4 6B 01            [ 1] 4693 	ld (PINNO,sp),a 
      009BA6 A6 01            [ 1] 4694 	ld a,#1
      009BA8 0D 01            [ 1] 4695 	tnz (PINNO,sp)
      009BAA 27 05            [ 1] 4696 	jreq 4$
      009BAC 48               [ 1] 4697 3$: sll a
      009BAD 0A 01            [ 1] 4698 	dec (PINNO,sp)
      009BAF 26 FB            [ 1] 4699 	jrne 3$
      009BB1 0D 02            [ 1] 4700 4$: tnz (PINVAL,sp)
      009BB3 26 05            [ 1] 4701 	jrne 5$
      009BB5 43               [ 1] 4702 	cpl a 
      009BB6 E4 00            [ 1] 4703 	and a,(GPIO_ODR,x)
      009BB8 20 02            [ 2] 4704 	jra 8$
      009BBA EA 00            [ 1] 4705 5$: or a,(GPIO_ODR,x)
      009BBC E7 00            [ 1] 4706 8$: ld (GPIO_ODR,x),a 
      001B3E                       4707 	_drop VSIZE 
      009BBE 5B 02            [ 2]    1     addw sp,#VSIZE 
      009BC0 81               [ 4] 4708 	ret
                                   4709 
                                   4710 
                                   4711 ;-----------------------
                                   4712 ; BASIC: BREAK 
                                   4713 ; insert a breakpoint 
                                   4714 ; in pogram. 
                                   4715 ; the program is resumed
                                   4716 ; with RUN 
                                   4717 ;-------------------------
      009BC1                       4718 break:
      009BC1 72 00 00 22 02   [ 2] 4719 	btjt flags,#FRUN,2$
      009BC6 4F               [ 1] 4720 	clr a
      009BC7 81               [ 4] 4721 	ret 
      009BC8                       4722 2$:	 
                                   4723 ; create space on cstack to save context 
      009BC8 AE 9B EF         [ 2] 4724 	ldw x,#break_point 
      009BCB CD 82 44         [ 4] 4725 	call puts 
      001B4E                       4726 	_drop 2 ;drop return address 
      009BCE 5B 02            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      001B50                       4727 	_vars CTXT_SIZE ; context size 
      009BD0 52 06            [ 2]    1     sub sp,#CTXT_SIZE 
      009BD2 CD 97 47         [ 4] 4728 	call save_context 
      009BD5 AE 16 C8         [ 2] 4729 	ldw x,#tib 
      009BD8 CF 00 05         [ 2] 4730 	ldw basicptr,x
      009BDB 7F               [ 1] 4731 	clr (x)
      009BDC 72 5F 00 04      [ 1] 4732 	clr count  
      009BE0 5F               [ 1] 4733 	clrw x 
      009BE1 CF 00 01         [ 2] 4734 	ldw in.w,x
      009BE4 72 11 00 22      [ 1] 4735 	bres flags,#FRUN 
      009BE8 72 18 00 22      [ 1] 4736 	bset flags,#FBREAK
      009BEC CC 88 96         [ 2] 4737 	jp interp_loop 
      009BEF 0A 62 72 65 61 6B 20  4738 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4739 
                                   4740 ;-----------------------
                                   4741 ; BASIC: NEW
                                   4742 ; from command line only 
                                   4743 ; free program memory
                                   4744 ; and clear variables 
                                   4745 ;------------------------
      009C0D                       4746 new: 
      009C0D 72 01 00 22 02   [ 2] 4747 	btjf flags,#FRUN,0$ 
      009C12 4F               [ 1] 4748 	clr a 
      009C13 81               [ 4] 4749 	ret 
      009C14                       4750 0$:	
      009C14 CD 86 D1         [ 4] 4751 	call clear_basic 
      009C17 81               [ 4] 4752 	ret 
                                   4753 	 
                                   4754 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4755 ;   file system routines
                                   4756 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4757 
                                   4758 ;--------------------
                                   4759 ; input:
                                   4760 ;   X     increment 
                                   4761 ; output:
                                   4762 ;   farptr  incremented 
                                   4763 ;---------------------
      009C18                       4764 incr_farptr:
      009C18 72 BB 00 14      [ 2] 4765 	addw x,farptr+1 
      009C1C 24 04            [ 1] 4766 	jrnc 1$
      009C1E 72 5C 00 13      [ 1] 4767 	inc farptr 
      009C22 CF 00 14         [ 2] 4768 1$:	ldw farptr+1,x  
      009C25 81               [ 4] 4769 	ret 
                                   4770 
                                   4771 ;------------------------------
                                   4772 ; extended flash memory used as FLASH_DRIVE 
                                   4773 ; seek end of used flash drive   
                                   4774 ; starting at 0x10000 address.
                                   4775 ; 4 consecutives 0 bytes signal free space. 
                                   4776 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4777 ;	none
                                   4778 ; output:
                                   4779 ;   ffree     free_addr| 0 if memory full.
                                   4780 ;------------------------------
      009C26                       4781 seek_fdrive:
                                   4782 ; start scan at 0x10000 address 
      009C26 A6 01            [ 1] 4783 	ld a,#1
      009C28 C7 00 13         [ 1] 4784 	ld farptr,a 
      009C2B 5F               [ 1] 4785 	clrw x 
      009C2C CF 00 14         [ 2] 4786 	ldw farptr+1,x 
      009C2F                       4787 1$:
      009C2F AE 00 03         [ 2] 4788 	ldw x,#3  
      009C32 92 AF 00 13      [ 5] 4789 2$:	ldf a,([farptr],x) 
      009C36 26 05            [ 1] 4790 	jrne 3$
      009C38 5A               [ 2] 4791 	decw x
      009C39 2A F7            [ 1] 4792 	jrpl 2$
      009C3B 20 19            [ 2] 4793 	jra 4$ 
      009C3D 5C               [ 2] 4794 3$:	incw x 
      009C3E CD 9C 18         [ 4] 4795 	call incr_farptr
      009C41 AE 02 7F         [ 2] 4796 	ldw x,#0x27f 
      009C44 C3 00 13         [ 2] 4797 	cpw x,farptr
      009C47 2A E6            [ 1] 4798 	jrpl 1$
                                   4799 ; drive full 
      009C49 72 5F 00 16      [ 1] 4800 	clr ffree 
      009C4D 72 5F 00 17      [ 1] 4801 	clr ffree+1 
      009C51 72 5F 00 18      [ 1] 4802 	clr ffree+2 
      009C55 81               [ 4] 4803 	ret
      009C56                       4804 4$: ; copy farptr to ffree	 
      009C56 CE 00 13         [ 2] 4805 	ldw x,farptr 
      009C59 C6 00 15         [ 1] 4806 	ld a,farptr+2 
      009C5C CF 00 16         [ 2] 4807 	ldw ffree,x 
      009C5F C7 00 18         [ 1] 4808 	ld ffree+2,a  
      009C62 81               [ 4] 4809 	ret 
                                   4810 
                                   4811 ;-----------------------
                                   4812 ; compare file name 
                                   4813 ; with name pointed by Y  
                                   4814 ; input:
                                   4815 ;   farptr   file name 
                                   4816 ;   Y        target name 
                                   4817 ; output:
                                   4818 ;   farptr 	 at file_name
                                   4819 ;   X 		 farptr[x] point at size field  
                                   4820 ;   Carry    0|1 no match|match  
                                   4821 ;----------------------
      009C63                       4822 cmp_name:
      009C63 5F               [ 1] 4823 	clrw x
      009C64 92 AF 00 13      [ 5] 4824 1$:	ldf a,([farptr],x)
      009C68 90 F1            [ 1] 4825 	cp a,(y)
      009C6A 26 08            [ 1] 4826 	jrne 4$
      009C6C 4D               [ 1] 4827 	tnz a 
      009C6D 27 12            [ 1] 4828 	jreq 9$ 
      009C6F 5C               [ 2] 4829     incw x 
      009C70 90 5C            [ 2] 4830 	incw y 
      009C72 20 F0            [ 2] 4831 	jra 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009C74                       4832 4$: ;no match 
      009C74 4D               [ 1] 4833 	tnz a 
      009C75 27 07            [ 1] 4834 	jreq 5$
      009C77 5C               [ 2] 4835 	incw x 
      009C78 92 AF 00 13      [ 5] 4836 	ldf a,([farptr],x)
      009C7C 20 F6            [ 2] 4837 	jra 4$  
      009C7E 5C               [ 2] 4838 5$:	incw x ; farptr[x] point at 'size' field 
      009C7F 98               [ 1] 4839 	rcf 
      009C80 81               [ 4] 4840 	ret
      009C81                       4841 9$: ; match  
      009C81 5C               [ 2] 4842 	incw x  ; farptr[x] at 'size' field 
      009C82 99               [ 1] 4843 	scf 
      009C83 81               [ 4] 4844 	ret 
                                   4845 
                                   4846 ;-----------------------
                                   4847 ; search file in 
                                   4848 ; flash memory 
                                   4849 ; input:
                                   4850 ;   Y       file name  
                                   4851 ; output:
                                   4852 ;   farptr  addr at name|0
                                   4853 ;-----------------------
                           000001  4854 	FSIZE=1
                           000003  4855 	YSAVE=3
                           000004  4856 	VSIZE=4 
      009C84                       4857 search_file: 
      001C04                       4858 	_vars VSIZE
      009C84 52 04            [ 2]    1     sub sp,#VSIZE 
      009C86 17 03            [ 2] 4859 	ldw (YSAVE,sp),y  
      009C88 5F               [ 1] 4860 	clrw x 
      009C89 CF 00 14         [ 2] 4861 	ldw farptr+1,x 
      009C8C 35 01 00 13      [ 1] 4862 	mov farptr,#1
      009C90                       4863 1$:	
                                   4864 ; check if farptr is after any file 
                                   4865 ; if  0 then so.
      009C90 92 BC 00 13      [ 5] 4866 	ldf a,[farptr]
      009C94 27 25            [ 1] 4867 	jreq 6$
      009C96 5F               [ 1] 4868 2$: clrw x 	
      009C97 16 03            [ 2] 4869 	ldw y,(YSAVE,sp) 
      009C99 CD 9C 63         [ 4] 4870 	call cmp_name
      009C9C 25 2D            [ 1] 4871 	jrc 9$
      009C9E 92 AF 00 13      [ 5] 4872 	ldf a,([farptr],x)
      009CA2 6B 01            [ 1] 4873 	ld (FSIZE,sp),a 
      009CA4 5C               [ 2] 4874 	incw x 
      009CA5 92 AF 00 13      [ 5] 4875 	ldf a,([farptr],x)
      009CA9 6B 02            [ 1] 4876 	ld (FSIZE+1,sp),a 
      009CAB 5C               [ 2] 4877 	incw x 
      009CAC 72 FB 01         [ 2] 4878 	addw x,(FSIZE,sp) ; count to skip 
      009CAF 5C               [ 2] 4879 	incw x ; skip over EOF marker 
      009CB0 CD 9C 18         [ 4] 4880 	call incr_farptr ; now at next file 'name_field'
      009CB3 AE 02 80         [ 2] 4881 	ldw x,#0x280
      009CB6 C3 00 13         [ 2] 4882 	cpw x,farptr 
      009CB9 2A D5            [ 1] 4883 	jrpl 1$
      009CBB                       4884 6$: ; file not found 
      009CBB 72 5F 00 13      [ 1] 4885 	clr farptr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009CBF 72 5F 00 14      [ 1] 4886 	clr farptr+1 
      009CC3 72 5F 00 15      [ 1] 4887 	clr farptr+2 
      001C47                       4888 	_drop VSIZE 
      009CC7 5B 04            [ 2]    1     addw sp,#VSIZE 
      009CC9 98               [ 1] 4889 	rcf
      009CCA 81               [ 4] 4890 	ret
      009CCB                       4891 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001C4B                       4892 	_drop VSIZE 
      009CCB 5B 04            [ 2]    1     addw sp,#VSIZE 
      009CCD 99               [ 1] 4893 	scf 	
      009CCE 81               [ 4] 4894 	ret
                                   4895 
                                   4896 ;--------------------------------
                                   4897 ; BASIC: SAVE "name" 
                                   4898 ; save text program in 
                                   4899 ; flash memory used as 
                                   4900 ;--------------------------------
                           000001  4901 	BSIZE=1
                           000003  4902 	NAMEPTR=3
                           000004  4903 	VSIZE=4
      009CCF                       4904 save:
      009CCF 72 01 00 22 05   [ 2] 4905 	btjf flags,#FRUN,0$ 
      009CD4 A6 07            [ 1] 4906 	ld a,#ERR_CMD_ONLY 
      009CD6 CC 88 01         [ 2] 4907 	jp tb_error
      009CD9                       4908 0$:	 
      009CD9 CE 00 1D         [ 2] 4909 	ldw x,txtend 
      009CDC 72 B0 00 1B      [ 2] 4910 	subw x,txtbgn
      009CE0 26 01            [ 1] 4911 	jrne 1$
                                   4912 ; nothing to save 
      009CE2 81               [ 4] 4913 	ret 
      009CE3                       4914 1$:	
      001C63                       4915 	_vars VSIZE 
      009CE3 52 04            [ 2]    1     sub sp,#VSIZE 
      009CE5 1F 01            [ 2] 4916 	ldw (BSIZE,sp),x 
      009CE7 CD 88 C6         [ 4] 4917 	call next_token	
      009CEA A1 0A            [ 1] 4918 	cp a,#TK_QSTR
      009CEC 27 03            [ 1] 4919 	jreq 2$
      009CEE CC 87 FF         [ 2] 4920 	jp syntax_error
      009CF1                       4921 2$: 
      009CF1 90 CE 00 05      [ 2] 4922 	ldw y,basicptr 
      009CF5 72 B9 00 01      [ 2] 4923 	addw y,in.w
      009CF9 17 03            [ 2] 4924 	ldw (NAMEPTR,sp),y  
      009CFB 55 00 04 00 02   [ 1] 4925 	mov in,count 
                                   4926 ; check if enough free space 
      009D00 93               [ 1] 4927 	ldw x,y 
      009D01 CD 83 06         [ 4] 4928 	call strlen 
      009D04 1C 00 03         [ 2] 4929 	addw x,#3 
      009D07 72 FB 01         [ 2] 4930 	addw x,(BSIZE,sp)
      009D0A 72 5D 00 16      [ 1] 4931 	tnz ffree 
      009D0E 26 0B            [ 1] 4932 	jrne 21$
      009D10 72 B0 00 17      [ 2] 4933 	subw x,ffree+1 
      009D14 23 05            [ 2] 4934 	jrule 21$
      009D16 A6 01            [ 1] 4935 	ld a,#ERR_MEM_FULL 
      009D18 CC 88 01         [ 2] 4936 	jp tb_error
      009D1B                       4937 21$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4938 ; check for existing file of that name 
      009D1B 16 03            [ 2] 4939 	ldw y,(NAMEPTR,sp)	
      009D1D CD 9C 84         [ 4] 4940 	call search_file 
      009D20 24 05            [ 1] 4941 	jrnc 3$ 
      009D22 A6 08            [ 1] 4942 	ld a,#ERR_DUPLICATE 
      009D24 CC 88 01         [ 2] 4943 	jp tb_error 
      009D27                       4944 3$:	;** write file name to flash **
      009D27 CE 00 16         [ 2] 4945 	ldw x,ffree 
      009D2A C6 00 18         [ 1] 4946 	ld a,ffree+2 
      009D2D CF 00 13         [ 2] 4947 	ldw farptr,x 
      009D30 C7 00 15         [ 1] 4948 	ld farptr+2,a 
      009D33 1E 03            [ 2] 4949 	ldw x,(NAMEPTR,sp)  
      009D35 CD 83 06         [ 4] 4950 	call strlen 
      009D38 5C               [ 2] 4951 	incw  x
      009D39 1F 01            [ 2] 4952 	ldw (BSIZE,sp),x  
      009D3B 5F               [ 1] 4953 	clrw x   
      009D3C 16 03            [ 2] 4954 	ldw y,(NAMEPTR,sp)
      009D3E CD 81 D4         [ 4] 4955 	call write_block  
                                   4956 ;** write file length after name **
      009D41 CE 00 1D         [ 2] 4957 	ldw x,txtend 
      009D44 72 B0 00 1B      [ 2] 4958 	subw x,txtbgn
      009D48 1F 01            [ 2] 4959 	ldw (BSIZE,sp),x 
      009D4A 5F               [ 1] 4960 	clrw x 
      009D4B 7B 01            [ 1] 4961 	ld a,(1,sp)
      009D4D CD 81 5F         [ 4] 4962 	call write_byte 
      009D50 5C               [ 2] 4963 	incw x 
      009D51 7B 02            [ 1] 4964 	ld a,(2,sp)
      009D53 CD 81 5F         [ 4] 4965 	call write_byte
      009D56 5C               [ 2] 4966 	incw x  
      009D57 CD 9C 18         [ 4] 4967 	call incr_farptr ; move farptr after SIZE field 
                                   4968 ;** write BASIC text **
                                   4969 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009D5A 1E 01            [ 2] 4970 	ldw x,(BSIZE,sp)
      009D5C 89               [ 2] 4971 	pushw x ; write_block argument 
      009D5D 5F               [ 1] 4972 	clrw x 
      009D5E 90 CE 00 1B      [ 2] 4973 	ldw y,txtbgn  ; BASIC text to save 
      009D62 CD 81 D4         [ 4] 4974 	call write_block 
      001CE5                       4975 	_drop 2 ;  drop write_block argument  
      009D65 5B 02            [ 2]    1     addw sp,#2 
                                   4976 ; write en end of file marker 
      009D67 AE 00 01         [ 2] 4977 	ldw x,#1
      009D6A A6 FF            [ 1] 4978 	ld a,#EOF  
      009D6C CD 81 5F         [ 4] 4979 	call write_byte 
      009D6F CD 9C 18         [ 4] 4980 	call incr_farptr
                                   4981 ; save farptr in ffree
      009D72 CE 00 13         [ 2] 4982 	ldw x,farptr 
      009D75 C6 00 15         [ 1] 4983 	ld a,farptr+2 
      009D78 CF 00 16         [ 2] 4984 	ldw ffree,x 
      009D7B C7 00 18         [ 1] 4985 	ld ffree+2,a
                                   4986 ;write 4 zero bytes as an end of all files marker 
      009D7E 5F               [ 1] 4987     clrw x 
      009D7F 4B 04            [ 1] 4988 	push #4 
      009D81                       4989 4$:
      009D81 4F               [ 1] 4990 	clr a 
      009D82 CD 81 5F         [ 4] 4991 	call write_byte 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009D85 5C               [ 2] 4992 	incw x 
      009D86 0A 01            [ 1] 4993 	dec (1,sp)
      009D88 26 F7            [ 1] 4994 	jrne 4$
      009D8A 84               [ 1] 4995 5$: pop a 
                                   4996 ; display saved size  
      009D8B 1E 01            [ 2] 4997 	ldw x,(BSIZE,sp) 
      009D8D CD 8A 5F         [ 4] 4998 	call print_int 
      001D10                       4999 	_drop VSIZE 
      009D90 5B 04            [ 2]    1     addw sp,#VSIZE 
      009D92 81               [ 4] 5000 	ret 
                                   5001 
                                   5002 ;----------------------
                                   5003 ; load file in RAM memory
                                   5004 ; input:
                                   5005 ;    farptr point at file size 
                                   5006 ; output:
                                   5007 ;   y point after BASIC program in RAM.
                                   5008 ;------------------------
      009D93                       5009 load_file:
      009D93 CD 9C 18         [ 4] 5010 	call incr_farptr  
      009D96 CD 86 D1         [ 4] 5011 	call clear_basic  
      009D99 5F               [ 1] 5012 	clrw x
      009D9A 92 AF 00 13      [ 5] 5013 	ldf a,([farptr],x)
      009D9E 90 95            [ 1] 5014 	ld yh,a 
      009DA0 5C               [ 2] 5015 	incw x  
      009DA1 92 AF 00 13      [ 5] 5016 	ldf a,([farptr],x)
      009DA5 5C               [ 2] 5017 	incw x 
      009DA6 90 97            [ 1] 5018 	ld yl,a 
      009DA8 72 B9 00 1B      [ 2] 5019 	addw y,txtbgn
      009DAC 90 CF 00 1D      [ 2] 5020 	ldw txtend,y
      009DB0 90 CE 00 1B      [ 2] 5021 	ldw y,txtbgn
      009DB4                       5022 3$:	; load BASIC text 	
      009DB4 92 AF 00 13      [ 5] 5023 	ldf a,([farptr],x)
      009DB8 90 F7            [ 1] 5024 	ld (y),a 
      009DBA 5C               [ 2] 5025 	incw x 
      009DBB 90 5C            [ 2] 5026 	incw y 
      009DBD 90 C3 00 1D      [ 2] 5027 	cpw y,txtend 
      009DC1 2B F1            [ 1] 5028 	jrmi 3$
      009DC3 81               [ 4] 5029 	ret 
                                   5030 
                                   5031 ;------------------------
                                   5032 ; BASIC: LOAD "file" 
                                   5033 ; load file to RAM 
                                   5034 ; for execution 
                                   5035 ;------------------------
      009DC4                       5036 load:
      009DC4 72 01 00 22 07   [ 2] 5037 	btjf flags,#FRUN,0$ 
      009DC9 27 05            [ 1] 5038 	jreq 0$ 
      009DCB A6 07            [ 1] 5039 	ld a,#ERR_CMD_ONLY 
      009DCD CC 88 01         [ 2] 5040 	jp tb_error 
      009DD0                       5041 0$:	
      009DD0 CD 88 C6         [ 4] 5042 	call next_token 
      009DD3 A1 0A            [ 1] 5043 	cp a,#TK_QSTR
      009DD5 27 03            [ 1] 5044 	jreq 1$
      009DD7 CC 87 FF         [ 2] 5045 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009DDA                       5046 1$:	
      009DDA 90 CE 00 05      [ 2] 5047 	ldw y,basicptr
      009DDE 72 B9 00 01      [ 2] 5048 	addw y,in.w 
      009DE2 55 00 04 00 02   [ 1] 5049 	mov in,count 
      009DE7 CD 9C 84         [ 4] 5050 	call search_file 
      009DEA 25 05            [ 1] 5051 	jrc 2$ 
      009DEC A6 09            [ 1] 5052 	ld a,#ERR_NOT_FILE
      009DEE CC 88 01         [ 2] 5053 	jp tb_error  
      009DF1                       5054 2$:
      009DF1 CD 9D 93         [ 4] 5055 	call load_file
                                   5056 ; print loaded size 	 
      009DF4 CE 00 1D         [ 2] 5057 	ldw x,txtend 
      009DF7 72 B0 00 1B      [ 2] 5058 	subw x,txtbgn
      009DFB CD 8A 5F         [ 4] 5059 	call print_int 
      009DFE 81               [ 4] 5060 	ret 
                                   5061 
                                   5062 ;-----------------------------------
                                   5063 ; BASIC: FORGET ["file_name"] 
                                   5064 ; erase file_name and all others 
                                   5065 ; after it. 
                                   5066 ; without argument erase all files 
                                   5067 ;-----------------------------------
      009DFF                       5068 forget:
      009DFF CD 88 C6         [ 4] 5069 	call next_token 
      009E02 A1 00            [ 1] 5070 	cp a,#TK_NONE 
      009E04 27 26            [ 1] 5071 	jreq 3$ 
      009E06 A1 0A            [ 1] 5072 	cp a,#TK_QSTR
      009E08 27 03            [ 1] 5073 	jreq 1$
      009E0A CC 87 FF         [ 2] 5074 	jp syntax_error
      009E0D 90 CE 00 05      [ 2] 5075 1$: ldw y,basicptr
      009E11 72 B9 00 01      [ 2] 5076 	addw y,in.w
      009E15 55 00 04 00 02   [ 1] 5077 	mov in,count 
      009E1A CD 9C 84         [ 4] 5078 	call search_file
      009E1D 25 05            [ 1] 5079 	jrc 2$
      009E1F A6 09            [ 1] 5080 	ld a,#ERR_NOT_FILE 
      009E21 CC 88 01         [ 2] 5081 	jp tb_error 
      009E24                       5082 2$: 
      009E24 CE 00 13         [ 2] 5083 	ldw x,farptr
      009E27 C6 00 15         [ 1] 5084 	ld a,farptr+2
      009E2A 20 0A            [ 2] 5085 	jra 4$ 
      009E2C                       5086 3$: ; forget all files 
      009E2C AE 01 00         [ 2] 5087 	ldw x,#0x100
      009E2F 4F               [ 1] 5088 	clr a 
      009E30 CF 00 13         [ 2] 5089 	ldw farptr,x 
      009E33 C7 00 15         [ 1] 5090 	ld farptr+2,a 
      009E36                       5091 4$:
      009E36 CF 00 16         [ 2] 5092 	ldw ffree,x 
      009E39 C7 00 18         [ 1] 5093 	ld ffree+2,a 
      009E3C 4B 04            [ 1] 5094 	push #4
      009E3E 5F               [ 1] 5095 	clrw x 
      009E3F                       5096 5$: 
      009E3F 4F               [ 1] 5097 	clr a  
      009E40 CD 81 5F         [ 4] 5098 	call write_byte 
      009E43 5C               [ 2] 5099 	incw x 
      009E44 0A 01            [ 1] 5100 	dec (1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009E46 26 F7            [ 1] 5101 	jrne 5$	
      009E48 84               [ 1] 5102 6$: pop a 
      009E49 81               [ 4] 5103 	ret 
                                   5104 
                                   5105 ;----------------------
                                   5106 ; BASIC: DIR 
                                   5107 ; list saved files 
                                   5108 ;----------------------
                           000001  5109 	COUNT=1 ; files counter 
                           000002  5110 	VSIZE=2 
      009E4A                       5111 directory:
      001DCA                       5112 	_vars VSIZE 
      009E4A 52 02            [ 2]    1     sub sp,#VSIZE 
      009E4C 5F               [ 1] 5113 	clrw x 
      009E4D 1F 01            [ 2] 5114 	ldw (COUNT,sp),x 
      009E4F CF 00 14         [ 2] 5115 	ldw farptr+1,x 
      009E52 35 01 00 13      [ 1] 5116 	mov farptr,#1 
      009E56                       5117 dir_loop:
      009E56 5F               [ 1] 5118 	clrw x 
      009E57 92 AF 00 13      [ 5] 5119 	ldf a,([farptr],x)
      009E5B 27 39            [ 1] 5120 	jreq 8$ 
      009E5D                       5121 1$: ;name loop 	
      009E5D 92 AF 00 13      [ 5] 5122 	ldf a,([farptr],x)
      009E61 27 06            [ 1] 5123 	jreq 2$ 
      009E63 CD 82 32         [ 4] 5124 	call putc 
      009E66 5C               [ 2] 5125 	incw x 
      009E67 20 F4            [ 2] 5126 	jra 1$
      009E69 5C               [ 2] 5127 2$: incw x ; skip ending 0. 
      009E6A A6 20            [ 1] 5128 	ld a,#SPACE 
      009E6C CD 82 32         [ 4] 5129 	call putc 
                                   5130 ; get file size 	
      009E6F 92 AF 00 13      [ 5] 5131 	ldf a,([farptr],x)
      009E73 90 95            [ 1] 5132 	ld yh,a 
      009E75 5C               [ 2] 5133 	incw x 
      009E76 92 AF 00 13      [ 5] 5134 	ldf a,([farptr],x)
      009E7A 5C               [ 2] 5135 	incw x 
      009E7B 90 97            [ 1] 5136 	ld yl,a 
      009E7D 90 89            [ 2] 5137 	pushw y 
      009E7F 72 FB 01         [ 2] 5138 	addw x,(1,sp)
      009E82 5C               [ 2] 5139 	incw x ; skip EOF marker 
                                   5140 ; skip to next file 
      009E83 CD 9C 18         [ 4] 5141 	call incr_farptr 
                                   5142 ; print file size 
      009E86 85               [ 2] 5143 	popw x ; file size 
      009E87 CD 8A 5F         [ 4] 5144 	call print_int 
      009E8A A6 0D            [ 1] 5145 	ld a,#CR 
      009E8C CD 82 32         [ 4] 5146 	call putc
      009E8F 1E 01            [ 2] 5147 	ldw x,(COUNT,sp)
      009E91 5C               [ 2] 5148 	incw x
      009E92 1F 01            [ 2] 5149 	ldw (COUNT,sp),x  
      009E94 20 C0            [ 2] 5150 	jra dir_loop 
      009E96                       5151 8$: ; print number of files 
      009E96 1E 01            [ 2] 5152 	ldw x,(COUNT,sp)
      009E98 CD 8A 5F         [ 4] 5153 	call print_int 
      009E9B AE 9E CB         [ 2] 5154 	ldw x,#file_count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009E9E CD 82 44         [ 4] 5155 	call puts  
                                   5156 ; print drive free space 	
      009EA1 A6 FF            [ 1] 5157 	ld a,#0xff 
      009EA3 C0 00 18         [ 1] 5158 	sub a,ffree+2 
      009EA6 C7 00 0A         [ 1] 5159 	ld acc8,a 
      009EA9 A6 7F            [ 1] 5160 	ld a,#0x7f 
      009EAB C2 00 17         [ 1] 5161 	sbc a,ffree+1 
      009EAE C7 00 09         [ 1] 5162 	ld acc16,a 
      009EB1 A6 02            [ 1] 5163 	ld a,#2 
      009EB3 C2 00 16         [ 1] 5164 	sbc a,ffree 
      009EB6 C7 00 08         [ 1] 5165 	ld acc24,a 
      009EB9 5F               [ 1] 5166 	clrw x  
      009EBA A6 06            [ 1] 5167 	ld a,#6 
      009EBC 97               [ 1] 5168 	ld xl,a 
      009EBD A6 0A            [ 1] 5169 	ld a,#10 
      009EBF CD 8A 17         [ 4] 5170 	call prti24 
      009EC2 AE 9E D3         [ 2] 5171 	ldw x,#drive_free
      009EC5 CD 82 44         [ 4] 5172 	call puts 
      001E48                       5173 	_drop VSIZE 
      009EC8 5B 02            [ 2]    1     addw sp,#VSIZE 
      009ECA 81               [ 4] 5174 	ret
      009ECB 20 66 69 6C 65 73 0A  5175 file_count: .asciz " files\n"
             00
      009ED3 20 62 79 74 65 73 20  5176 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5177 
                                   5178 ;---------------------
                                   5179 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5180 ; write 1 or more byte to FLASH or EEPROM
                                   5181 ; starting at address  
                                   5182 ; input:
                                   5183 ;   expr1  	is address 
                                   5184 ;   expr2,...,exprn   are bytes to write
                                   5185 ; output:
                                   5186 ;   none 
                                   5187 ;---------------------
                           000001  5188 	ADDR=1
                           000002  5189 	VSIZ=2 
      009EE0                       5190 write:
      001E60                       5191 	_vars VSIZE 
      009EE0 52 02            [ 2]    1     sub sp,#VSIZE 
      009EE2 72 5F 00 13      [ 1] 5192 	clr farptr ; expect 16 bits address 
      009EE6 CD 93 89         [ 4] 5193 	call expression
      009EE9 A1 04            [ 1] 5194 	cp a,#TK_INTGR 
      009EEB 27 03            [ 1] 5195 	jreq 0$
      009EED CC 87 FF         [ 2] 5196 	jp syntax_error
      009EF0 1F 01            [ 2] 5197 0$: ldw (ADDR,sp),x 
      009EF2 CD 88 C6         [ 4] 5198 	call next_token 
      009EF5 A1 0D            [ 1] 5199 	cp a,#TK_COMMA 
      009EF7 27 02            [ 1] 5200 	jreq 1$ 
      009EF9 20 19            [ 2] 5201 	jra 9$ 
      009EFB CD 93 89         [ 4] 5202 1$:	call expression
      009EFE A1 04            [ 1] 5203 	cp a,#TK_INTGR
      009F00 27 03            [ 1] 5204 	jreq 2$
      009F02 CC 87 FF         [ 2] 5205 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009F05 9F               [ 1] 5206 2$:	ld a,xl 
      009F06 1E 01            [ 2] 5207 	ldw x,(ADDR,sp) 
      009F08 CF 00 14         [ 2] 5208 	ldw farptr+1,x 
      009F0B 5F               [ 1] 5209 	clrw x 
      009F0C CD 81 5F         [ 4] 5210 	call write_byte
      009F0F 1E 01            [ 2] 5211 	ldw x,(ADDR,sp)
      009F11 5C               [ 2] 5212 	incw x 
      009F12 20 DC            [ 2] 5213 	jra 0$ 
      009F14                       5214 9$:
      001E94                       5215 	_drop VSIZE
      009F14 5B 02            [ 2]    1     addw sp,#VSIZE 
      009F16 81               [ 4] 5216 	ret 
                                   5217 
                                   5218 
                                   5219 ;---------------------
                                   5220 ;BASIC: CHAR(expr)
                                   5221 ; évaluate expression 
                                   5222 ; and take the 7 least 
                                   5223 ; bits as ASCII character
                                   5224 ;---------------------
      009F17                       5225 char:
      009F17 CD 92 A9         [ 4] 5226 	call func_args 
      009F1A A1 01            [ 1] 5227 	cp a,#1
      009F1C 27 03            [ 1] 5228 	jreq 1$
      009F1E CC 87 FF         [ 2] 5229 	jp syntax_error
      009F21 CD 90 65         [ 4] 5230 1$:	call dpop 
      009F24 9F               [ 1] 5231 	ld a,xl 
      009F25 A4 7F            [ 1] 5232 	and a,#0x7f 
      009F27 97               [ 1] 5233 	ld xl,a
      009F28 A6 03            [ 1] 5234 	ld a,#TK_CHAR
      009F2A 81               [ 4] 5235 	ret
                                   5236 
                                   5237 ;---------------------
                                   5238 ; BASIC: ASC(string|char)
                                   5239 ; extract first character 
                                   5240 ; of string argument 
                                   5241 ; return it as TK_INTGR 
                                   5242 ;---------------------
      009F2B                       5243 ascii:
      009F2B CD 92 A9         [ 4] 5244 	call func_args 
      009F2E CD 88 C6         [ 4] 5245 	call next_token 
      009F31 A1 0A            [ 1] 5246 	cp a,#TK_QSTR 
      009F33 27 07            [ 1] 5247 	jreq 1$
      009F35 A1 03            [ 1] 5248 	cp a,#TK_CHAR 
      009F37 27 06            [ 1] 5249 	jreq 2$ 
      009F39 CC 87 FF         [ 2] 5250 	jp syntax_error
      009F3C                       5251 1$: 
      009F3C F6               [ 1] 5252 	ld a,(x)
      009F3D 20 01            [ 2] 5253 	jra 3$
      009F3F                       5254 2$: 
      009F3F 9F               [ 1] 5255 	ld a,xl 
      009F40 97               [ 1] 5256 3$:	ld xl,a 
      009F41 4F               [ 1] 5257 	clr a  
      009F42 95               [ 1] 5258 	ld xh,a 
      009F43 A6 04            [ 1] 5259 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009F45 81               [ 4] 5260 	ret 
                                   5261 
                                   5262 ;---------------------
                                   5263 ;BASIC: KEY
                                   5264 ; wait for a character 
                                   5265 ; received from STDIN 
                                   5266 ; input:
                                   5267 ;	none 
                                   5268 ; output:
                                   5269 ;	X 		ASCII character 
                                   5270 ;---------------------
      009F46                       5271 key:
      009F46 CD 82 3B         [ 4] 5272 	call getc 
      009F49 5F               [ 1] 5273 	clrw x 
      009F4A 97               [ 1] 5274 	ld xl,a 
      009F4B A6 04            [ 1] 5275 	ld a,#TK_INTGR
      009F4D 81               [ 4] 5276 	ret
                                   5277 
                                   5278 ;----------------------
                                   5279 ; BASIC: QKEY
                                   5280 ; Return true if there 
                                   5281 ; is a character in 
                                   5282 ; waiting in STDIN 
                                   5283 ; input:
                                   5284 ;  none 
                                   5285 ; output:
                                   5286 ;   X 		0|1 
                                   5287 ;-----------------------
      009F4E                       5288 qkey: 
      009F4E 5F               [ 1] 5289 	clrw x 
      009F4F 72 0B 52 30 01   [ 2] 5290 	btjf UART1_SR,#UART_SR_RXNE,9$ 
      009F54 5C               [ 2] 5291 	incw x 
      009F55 A6 04            [ 1] 5292 9$: ld a,#TK_INTGR
      009F57 81               [ 4] 5293 	ret 
                                   5294 
                                   5295 ;---------------------
                                   5296 ; BASIC: GPIO(expr,reg)
                                   5297 ; return gpio address 
                                   5298 ; expr {0..8}
                                   5299 ; input:
                                   5300 ;   none 
                                   5301 ; output:
                                   5302 ;   X 		gpio register address
                                   5303 ;----------------------------
      009F58                       5304 gpio:
      009F58 CD 92 A9         [ 4] 5305 	call func_args 
      009F5B A1 02            [ 1] 5306 	cp a,#2
      009F5D 27 03            [ 1] 5307 	jreq 1$
      009F5F CC 87 FF         [ 2] 5308 	jp syntax_error  
      009F62                       5309 1$:	
      009F62 AE 00 02         [ 2] 5310 	ldw x,#2
      009F65 72 DE 00 19      [ 5] 5311 	ldw x,([dstkptr],x) ; port 
      009F69 2B 1B            [ 1] 5312 	jrmi bad_port
      009F6B A3 00 09         [ 2] 5313 	cpw x,#9
      009F6E 2A 16            [ 1] 5314 	jrpl bad_port
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009F70 A6 05            [ 1] 5315 	ld a,#5
      009F72 42               [ 4] 5316 	mul x,a
      009F73 1C 50 00         [ 2] 5317 	addw x,#GPIO_BASE 
      009F76 89               [ 2] 5318 	pushw x 
      009F77 CD 90 65         [ 4] 5319 	call dpop 
      009F7A 72 FB 01         [ 2] 5320 	addw x,(1,sp)
      009F7D 1F 01            [ 2] 5321 	ldw (1,sp),x  
      009F7F CD 90 8C         [ 4] 5322 	call ddrop  
      009F82 85               [ 2] 5323 	popw x 
      009F83 A6 04            [ 1] 5324 	ld a,#TK_INTGR
      009F85 81               [ 4] 5325 	ret
      009F86                       5326 bad_port:
      009F86 A6 0A            [ 1] 5327 	ld a,#ERR_BAD_VALUE
      009F88 CC 88 01         [ 2] 5328 	jp tb_error
                                   5329 
                                   5330 
                                   5331 ;-------------------------
                                   5332 ; BASIC: UFLASH 
                                   5333 ; return user flash address
                                   5334 ; input:
                                   5335 ;  none 
                                   5336 ; output:
                                   5337 ;	A		TK_INTGR
                                   5338 ;   X 		user address 
                                   5339 ;---------------------------
      009F8B                       5340 uflash:
      009F8B AE A6 00         [ 2] 5341 	ldw x,#user_space 
      009F8E A6 04            [ 1] 5342 	ld a,#TK_INTGR 
      009F90 81               [ 4] 5343 	ret 
                                   5344 
                                   5345 
                                   5346 ;---------------------
                                   5347 ; BASIC: USR(addr[,arg])
                                   5348 ; execute a function written 
                                   5349 ; in binary code.
                                   5350 ; binary fonction should 
                                   5351 ; return token attribute in A 
                                   5352 ; and value in X. 
                                   5353 ; input:
                                   5354 ;   addr	routine address 
                                   5355 ;   arg 	is an optional argument 
                                   5356 ; output:
                                   5357 ;   A 		token attribute 
                                   5358 ;   X       returned value 
                                   5359 ;---------------------
      009F91                       5360 usr:
      009F91 90 89            [ 2] 5361 	pushw y 	
      009F93 CD 92 A9         [ 4] 5362 	call func_args 
      009F96 A1 01            [ 1] 5363 	cp a,#1 
      009F98 2A 03            [ 1] 5364 	jrpl 2$ 
      009F9A CC 87 FF         [ 2] 5365 	jp syntax_error 
      009F9D                       5366 2$: 
      009F9D CD 90 65         [ 4] 5367 	call dpop 
      009FA0 A1 02            [ 1] 5368 	cp a,#2 
      009FA2 2B 05            [ 1] 5369 	jrmi 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009FA4 90 93            [ 1] 5370 	ldw y,x ; y=arg 
      009FA6 CD 90 65         [ 4] 5371 	call dpop ;x=addr 
      009FA9 51               [ 1] 5372 4$:	exgw y,x ; y=addr,x=arg 
      009FAA 90 FD            [ 4] 5373 	call (y)
      009FAC 90 85            [ 2] 5374 	popw y 
      009FAE 81               [ 4] 5375 	ret 
                                   5376 
                                   5377 ;------------------------------
                                   5378 ; BASIC: BYE 
                                   5379 ; halt mcu in its lowest power mode 
                                   5380 ; wait for reset or external interrupt
                                   5381 ; do a cold start on wakeup.
                                   5382 ;------------------------------
      009FAF                       5383 bye:
      009FAF 72 0D 52 30 FB   [ 2] 5384 	btjf UART1_SR,#UART_SR_TC,.
      009FB4 8E               [10] 5385 	halt
      009FB5 CC 85 E0         [ 2] 5386 	jp cold_start  
                                   5387 
                                   5388 ;----------------------------------
                                   5389 ; BASIC: AUTORUN "file_name" 
                                   5390 ; record in eeprom at adrress AUTORUN_NAME
                                   5391 ; the name of file to load and execute
                                   5392 ; at startup 
                                   5393 ; input:
                                   5394 ;   file_name   file to execute 
                                   5395 ; output:
                                   5396 ;   none
                                   5397 ;-----------------------------------
      009FB8                       5398 autorun: 
      009FB8 72 01 00 22 07   [ 2] 5399 	btjf flags,#FRUN,0$ 
      009FBD 27 05            [ 1] 5400 	jreq 0$ 
      009FBF A6 07            [ 1] 5401 	ld a,#ERR_CMD_ONLY 
      009FC1 CC 88 01         [ 2] 5402 	jp tb_error 
      009FC4                       5403 0$:	
      009FC4 CD 88 C6         [ 4] 5404 	call next_token 
      009FC7 A1 0A            [ 1] 5405 	cp a,#TK_QSTR
      009FC9 27 03            [ 1] 5406 	jreq 1$
      009FCB CC 87 FF         [ 2] 5407 	jp syntax_error 
      009FCE                       5408 1$:	
      009FCE 89               [ 2] 5409 	pushw x ; file name char*
      009FCF 90 93            [ 1] 5410 	ldw y,x  
      009FD1 CD 9C 84         [ 4] 5411 	call search_file 
      009FD4 25 05            [ 1] 5412 	jrc 2$ 
      009FD6 A6 09            [ 1] 5413 	ld a,#ERR_NOT_FILE
      009FD8 CC 88 01         [ 2] 5414 	jp tb_error  
      009FDB                       5415 2$: 
      009FDB 55 00 04 00 02   [ 1] 5416 	mov in,count 
      009FE0 72 5F 00 13      [ 1] 5417 	clr farptr 
      009FE4 AE 40 00         [ 2] 5418 	ldw x,#AUTORUN_NAME
      009FE7 CF 00 14         [ 2] 5419 	ldw farptr+1,x 
      009FEA 1E 01            [ 2] 5420 	ldw x,(1,sp)  
      009FEC CD 83 06         [ 4] 5421 	call strlen  ; return length in X 
      009FEF 90 85            [ 2] 5422 	popw y 
      009FF1 89               [ 2] 5423 	pushw x 
      009FF2 5F               [ 1] 5424 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009FF3 CD 81 D4         [ 4] 5425 	call write_block 
      001F76                       5426 	_drop 2 
      009FF6 5B 02            [ 2]    1     addw sp,#2 
      009FF8 81               [ 4] 5427 	ret 
                                   5428 
                                   5429 ;----------------------------------
                                   5430 ; BASIC: SLEEP 
                                   5431 ; halt mcu until reset or external
                                   5432 ; interrupt.
                                   5433 ; Resume progam after SLEEP command
                                   5434 ;----------------------------------
      009FF9                       5435 sleep:
      009FF9 72 0D 52 30 FB   [ 2] 5436 	btjf UART1_SR,#UART_SR_TC,.
      009FFE 72 16 00 22      [ 1] 5437 	bset flags,#FSLEEP
      00A002 8E               [10] 5438 	halt 
      00A003 81               [ 4] 5439 	ret 
                                   5440 
                                   5441 ;-------------------------------
                                   5442 ; BASIC: PAUSE expr 
                                   5443 ; suspend execution for n msec.
                                   5444 ; input:
                                   5445 ;	none
                                   5446 ; output:
                                   5447 ;	none 
                                   5448 ;------------------------------
      00A004                       5449 pause:
      00A004 CD 93 89         [ 4] 5450 	call expression
      00A007 A1 04            [ 1] 5451 	cp a,#TK_INTGR
      00A009 27 03            [ 1] 5452 	jreq pause02 
      00A00B CC 87 FF         [ 2] 5453 	jp syntax_error
      00A00E                       5454 pause02: 
      00A00E 5D               [ 2] 5455 1$: tnzw x 
      00A00F 27 04            [ 1] 5456 	jreq 2$
      00A011 8F               [10] 5457 	wfi 
      00A012 5A               [ 2] 5458 	decw x 
      00A013 26 F9            [ 1] 5459 	jrne 1$
      00A015 4F               [ 1] 5460 2$:	clr a 
      00A016 81               [ 4] 5461 	ret 
                                   5462 
                                   5463 ;------------------------------
                                   5464 ; BASIC: AWU expr
                                   5465 ; halt mcu for 'expr' milliseconds
                                   5466 ; use Auto wakeup peripheral
                                   5467 ; all oscillators stopped except LSI
                                   5468 ; range: 1ms - 511ms
                                   5469 ; input:
                                   5470 ;  none
                                   5471 ; output:
                                   5472 ;  none:
                                   5473 ;------------------------------
      00A017                       5474 awu:
      00A017 CD 93 89         [ 4] 5475   call expression
      00A01A A1 04            [ 1] 5476   cp a,#TK_INTGR
      00A01C 27 03            [ 1] 5477   jreq awu02
      00A01E CC 87 FF         [ 2] 5478   jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A021                       5479 awu02:
      00A021 A3 14 00         [ 2] 5480   cpw x,#5120
      00A024 2B 0C            [ 1] 5481   jrmi 1$ 
      00A026 35 0F 50 F2      [ 1] 5482   mov AWU_TBR,#15 
      00A02A A6 1E            [ 1] 5483   ld a,#30
      00A02C 62               [ 2] 5484   div x,a
      00A02D A6 10            [ 1] 5485   ld a,#16
      00A02F 62               [ 2] 5486   div x,a 
      00A030 20 1E            [ 2] 5487   jra 4$
      00A032                       5488 1$: 
      00A032 A3 08 00         [ 2] 5489   cpw x,#2048
      00A035 2B 09            [ 1] 5490   jrmi 2$ 
      00A037 35 0E 50 F2      [ 1] 5491   mov AWU_TBR,#14
      00A03B A6 50            [ 1] 5492   ld a,#80
      00A03D 62               [ 2] 5493   div x,a 
      00A03E 20 10            [ 2] 5494   jra 4$   
      00A040                       5495 2$:
      00A040 35 07 50 F2      [ 1] 5496   mov AWU_TBR,#7
      00A044                       5497 3$:  
                                   5498 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A044 A3 00 40         [ 2] 5499   cpw x,#64 
      00A047 23 07            [ 2] 5500   jrule 4$ 
      00A049 72 5C 50 F2      [ 1] 5501   inc AWU_TBR 
      00A04D 54               [ 2] 5502   srlw x 
      00A04E 20 F4            [ 2] 5503   jra 3$ 
      00A050                       5504 4$:
      00A050 9F               [ 1] 5505   ld a, xl
      00A051 4A               [ 1] 5506   dec a 
      00A052 27 01            [ 1] 5507   jreq 5$
      00A054 4A               [ 1] 5508   dec a 	
      00A055                       5509 5$: 
      00A055 A4 3E            [ 1] 5510   and a,#0x3e 
      00A057 C7 50 F1         [ 1] 5511   ld AWU_APR,a 
      00A05A 72 18 50 F0      [ 1] 5512   bset AWU_CSR,#AWU_CSR_AWUEN
      00A05E 8E               [10] 5513   halt 
                                   5514 
      00A05F 81               [ 4] 5515   ret 
                                   5516 
                                   5517 ;------------------------------
                                   5518 ; BASIC: TICKS
                                   5519 ; return msec ticks counter value 
                                   5520 ; input:
                                   5521 ; 	none 
                                   5522 ; output:
                                   5523 ;	X 		TK_INTGR
                                   5524 ;-------------------------------
      00A060                       5525 get_ticks:
      00A060 CE 00 0B         [ 2] 5526 	ldw x,ticks 
      00A063 A6 04            [ 1] 5527 	ld a,#TK_INTGR
      00A065 81               [ 4] 5528 	ret 
                                   5529 
                                   5530 
                                   5531 
                                   5532 ;------------------------------
                                   5533 ; BASIC: ABS(expr)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   5534 ; return absolute value of expr.
                                   5535 ; input:
                                   5536 ;   none
                                   5537 ; output:
                                   5538 ;   X     	positive integer
                                   5539 ;-------------------------------
      00A066                       5540 abs:
      00A066 CD 92 A9         [ 4] 5541 	call func_args 
      00A069 A1 01            [ 1] 5542 	cp a,#1 
      00A06B 27 03            [ 1] 5543 	jreq 0$ 
      00A06D CC 87 FF         [ 2] 5544 	jp syntax_error
      00A070                       5545 0$:  
      00A070 CD 90 65         [ 4] 5546     call dpop   
      00A073 9E               [ 1] 5547 	ld a,xh 
      00A074 A5 80            [ 1] 5548 	bcp a,#0x80 
      00A076 27 01            [ 1] 5549 	jreq 2$ 
      00A078 50               [ 2] 5550 	negw x 
      00A079 A6 04            [ 1] 5551 2$: ld a,#TK_INTGR 
      00A07B 81               [ 4] 5552 	ret 
                                   5553 
                                   5554 ;------------------------------
                                   5555 ; BASIC: AND(expr1,expr2)
                                   5556 ; Apply bit AND relation between
                                   5557 ; the 2 arguments, i.e expr1 & expr2 
                                   5558 ; output:
                                   5559 ; 	A 		TK_INTGR
                                   5560 ;   X 		result 
                                   5561 ;------------------------------
      00A07C                       5562 bit_and:
      00A07C CD 92 A9         [ 4] 5563 	call func_args 
      00A07F A1 02            [ 1] 5564 	cp a,#2
      00A081 27 03            [ 1] 5565 	jreq 1$
      00A083 CC 87 FF         [ 2] 5566 	jp syntax_error 
      00A086 CD 90 65         [ 4] 5567 1$:	call dpop 
      00A089 89               [ 2] 5568 	pushw x 
      00A08A CD 90 65         [ 4] 5569 	call dpop 
      00A08D 9E               [ 1] 5570 	ld a,xh 
      00A08E 14 01            [ 1] 5571 	and a,(1,sp)
      00A090 95               [ 1] 5572 	ld xh,a 
      00A091 9F               [ 1] 5573 	ld a,xl
      00A092 14 02            [ 1] 5574 	and a,(2,sp)
      00A094 97               [ 1] 5575 	ld xl,a 
      002015                       5576 	_drop 2 
      00A095 5B 02            [ 2]    1     addw sp,#2 
      00A097 A6 04            [ 1] 5577 	ld a,#TK_INTGR
      00A099 81               [ 4] 5578 	ret
                                   5579 
                                   5580 ;------------------------------
                                   5581 ; BASIC: OR(expr1,expr2)
                                   5582 ; Apply bit OR relation between
                                   5583 ; the 2 arguments, i.e expr1 | expr2 
                                   5584 ; output:
                                   5585 ; 	A 		TK_INTGR
                                   5586 ;   X 		result 
                                   5587 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      00A09A                       5588 bit_or:
      00A09A CD 92 A9         [ 4] 5589 	call func_args 
      00A09D A1 02            [ 1] 5590 	cp a,#2
      00A09F 27 03            [ 1] 5591 	jreq 1$
      00A0A1 CC 87 FF         [ 2] 5592 	jp syntax_error 
      00A0A4                       5593 1$: 
      00A0A4 CD 90 65         [ 4] 5594 	call dpop 
      00A0A7 89               [ 2] 5595 	pushw x 
      00A0A8 CD 90 65         [ 4] 5596 	call dpop 
      00A0AB 9E               [ 1] 5597 	ld a,xh 
      00A0AC 1A 01            [ 1] 5598 	or a,(1,sp)
      00A0AE 95               [ 1] 5599 	ld xh,a 
      00A0AF 9F               [ 1] 5600 	ld a,xl 
      00A0B0 1A 02            [ 1] 5601 	or a,(2,sp)
      00A0B2 97               [ 1] 5602 	ld xl,a 
      002033                       5603 	_drop 2 
      00A0B3 5B 02            [ 2]    1     addw sp,#2 
      00A0B5 A6 04            [ 1] 5604 	ld a,#TK_INTGR 
      00A0B7 81               [ 4] 5605 	ret
                                   5606 
                                   5607 ;------------------------------
                                   5608 ; BASIC: XOR(expr1,expr2)
                                   5609 ; Apply bit XOR relation between
                                   5610 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5611 ; output:
                                   5612 ; 	A 		TK_INTGR
                                   5613 ;   X 		result 
                                   5614 ;------------------------------
      00A0B8                       5615 bit_xor:
      00A0B8 CD 92 A9         [ 4] 5616 	call func_args 
      00A0BB A1 02            [ 1] 5617 	cp a,#2
      00A0BD 27 03            [ 1] 5618 	jreq 1$
      00A0BF CC 87 FF         [ 2] 5619 	jp syntax_error 
      00A0C2                       5620 1$: 
      00A0C2 CD 90 65         [ 4] 5621 	call dpop 
      00A0C5 89               [ 2] 5622 	pushw x 
      00A0C6 CD 90 65         [ 4] 5623 	call dpop 
      00A0C9 9E               [ 1] 5624 	ld a,xh 
      00A0CA 18 01            [ 1] 5625 	xor a,(1,sp)
      00A0CC 95               [ 1] 5626 	ld xh,a 
      00A0CD 9F               [ 1] 5627 	ld a,xl 
      00A0CE 18 02            [ 1] 5628 	xor a,(2,sp)
      00A0D0 97               [ 1] 5629 	ld xl,a 
      002051                       5630 	_drop 2 
      00A0D1 5B 02            [ 2]    1     addw sp,#2 
      00A0D3 A6 04            [ 1] 5631 	ld a,#TK_INTGR 
      00A0D5 81               [ 4] 5632 	ret 
                                   5633 
                                   5634 ;------------------------------
                                   5635 ; BASIC: LSHIFT(expr1,expr2)
                                   5636 ; logical shift left expr1 by 
                                   5637 ; expr2 bits 
                                   5638 ; output:
                                   5639 ; 	A 		TK_INTGR
                                   5640 ;   X 		result 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   5641 ;------------------------------
      00A0D6                       5642 lshift:
      00A0D6 CD 92 A9         [ 4] 5643 	call func_args
      00A0D9 A1 02            [ 1] 5644 	cp a,#2 
      00A0DB 27 03            [ 1] 5645 	jreq 1$
      00A0DD CC 87 FF         [ 2] 5646 	jp syntax_error
      00A0E0 CD 90 65         [ 4] 5647 1$: call dpop  
      00A0E3 51               [ 1] 5648 	exgw x,y 
      00A0E4 CD 90 65         [ 4] 5649 	call dpop
      00A0E7 90 5D            [ 2] 5650 	tnzw y 
      00A0E9 27 05            [ 1] 5651 	jreq 4$
      00A0EB 58               [ 2] 5652 2$:	sllw x 
      00A0EC 90 5A            [ 2] 5653 	decw y 
      00A0EE 26 FB            [ 1] 5654 	jrne 2$
      00A0F0                       5655 4$:  
      00A0F0 A6 04            [ 1] 5656 	ld a,#TK_INTGR
      00A0F2 81               [ 4] 5657 	ret
                                   5658 
                                   5659 ;------------------------------
                                   5660 ; BASIC: RSHIFT(expr1,expr2)
                                   5661 ; logical shift right expr1 by 
                                   5662 ; expr2 bits.
                                   5663 ; output:
                                   5664 ; 	A 		TK_INTGR
                                   5665 ;   X 		result 
                                   5666 ;------------------------------
      00A0F3                       5667 rshift:
      00A0F3 CD 92 A9         [ 4] 5668 	call func_args
      00A0F6 A1 02            [ 1] 5669 	cp a,#2 
      00A0F8 27 03            [ 1] 5670 	jreq 1$
      00A0FA CC 87 FF         [ 2] 5671 	jp syntax_error
      00A0FD CD 90 65         [ 4] 5672 1$: call dpop  
      00A100 51               [ 1] 5673 	exgw x,y 
      00A101 CD 90 65         [ 4] 5674 	call dpop
      00A104 90 5D            [ 2] 5675 	tnzw y 
      00A106 27 05            [ 1] 5676 	jreq 4$
      00A108 54               [ 2] 5677 2$:	srlw x 
      00A109 90 5A            [ 2] 5678 	decw y 
      00A10B 26 FB            [ 1] 5679 	jrne 2$
      00A10D                       5680 4$:  
      00A10D A6 04            [ 1] 5681 	ld a,#TK_INTGR
      00A10F 81               [ 4] 5682 	ret
                                   5683 
                                   5684 ;--------------------------
                                   5685 ; BASIC: FCPU integer
                                   5686 ; set CPU frequency 
                                   5687 ;-------------------------- 
                                   5688 
      00A110                       5689 fcpu:
      00A110 A6 04            [ 1] 5690 	ld a,#TK_INTGR
      00A112 CD 92 78         [ 4] 5691 	call expect 
      00A115 9F               [ 1] 5692 	ld a,xl 
      00A116 A4 07            [ 1] 5693 	and a,#7 
      00A118 C7 50 C6         [ 1] 5694 	ld CLK_CKDIVR,a 
      00A11B 81               [ 4] 5695 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                   5696 
                                   5697 ;------------------------------
                                   5698 ; BASIC: PMODE pin#, mode 
                                   5699 ; define pin as input or output
                                   5700 ; pin#: {0..15}
                                   5701 ; mode: INPUT|OUTPUT  
                                   5702 ;------------------------------
                           000001  5703 	PINNO=1
                           000001  5704 	VSIZE=1
      00A11C                       5705 pin_mode:
      00209C                       5706 	_vars VSIZE 
      00A11C 52 01            [ 2]    1     sub sp,#VSIZE 
      00A11E CD 92 85         [ 4] 5707 	call arg_list 
      00A121 A1 02            [ 1] 5708 	cp a,#2 
      00A123 27 03            [ 1] 5709 	jreq 1$
      00A125 CC 87 FF         [ 2] 5710 	jp syntax_error 
      00A128 CD 90 65         [ 4] 5711 1$: call dpop ; mode 
      00A12B 51               [ 1] 5712 	exgw x,y 
      00A12C CD 90 65         [ 4] 5713 	call dpop ; Dx pin 
      00A12F CD A1 61         [ 4] 5714 	call select_pin 
      00A132 6B 01            [ 1] 5715 	ld (PINNO,sp),a  
      00A134 A6 01            [ 1] 5716 	ld a,#1 
      00A136 0D 01            [ 1] 5717 	tnz (PINNO,sp)
      00A138 27 0B            [ 1] 5718 	jreq 4$
      00A13A 48               [ 1] 5719 2$:	sll a 
      00A13B 0A 01            [ 1] 5720 	dec (PINNO,sp)
      00A13D 26 FB            [ 1] 5721 	jrne 2$ 
      00A13F 6B 01            [ 1] 5722 	ld (PINNO,sp),a
      00A141 EA 03            [ 1] 5723 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A143 E7 03            [ 1] 5724 	ld (GPIO_CR1,x),a 
      00A145 90 A3 00 01      [ 2] 5725 4$:	cpw y,#OUTP 
      00A149 27 07            [ 1] 5726 	jreq 6$
                                   5727 ; input mode
      00A14B 7B 01            [ 1] 5728 	ld a,(PINNO,sp)
      00A14D 43               [ 1] 5729 	cpl a 
      00A14E E4 02            [ 1] 5730 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A150 20 0A            [ 2] 5731 	jra 9$
      00A152                       5732 6$: ;output mode  
      00A152 7B 01            [ 1] 5733 	ld a,(PINNO,sp)
      00A154 EA 04            [ 1] 5734 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A156 E7 04            [ 1] 5735 	ld (GPIO_CR2,x),a 
      00A158 7B 01            [ 1] 5736 	ld a,(PINNO,sp)
      00A15A EA 02            [ 1] 5737 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A15C E7 02            [ 1] 5738 9$:	ld (GPIO_DDR,x),a 
      0020DE                       5739 	_drop VSIZE 
      00A15E 5B 01            [ 2]    1     addw sp,#VSIZE 
      00A160 81               [ 4] 5740 	ret
                                   5741 
                                   5742 ;------------------------
                                   5743 ; select pin 
                                   5744 ; input:
                                   5745 ;   X 	 {0..15} Arduino Dx 
                                   5746 ; output:
                                   5747 ;   A     stm8s208 pin 
                                   5748 ;   X     base address s208 GPIO port 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                   5749 ;---------------------------
      00A161                       5750 select_pin:
      00A161 58               [ 2] 5751 	sllw x 
      00A162 1C A1 71         [ 2] 5752 	addw x,#arduino_to_8s208 
      00A165 FE               [ 2] 5753 	ldw x,(x)
      00A166 9F               [ 1] 5754 	ld a,xl 
      00A167 88               [ 1] 5755 	push a 
      00A168 5E               [ 1] 5756 	swapw x 
      00A169 A6 05            [ 1] 5757 	ld a,#5 
      00A16B 42               [ 4] 5758 	mul x,a 
      00A16C 1C 50 00         [ 2] 5759 	addw x,#GPIO_BASE 
      00A16F 84               [ 1] 5760 	pop a 
      00A170 81               [ 4] 5761 	ret 
                                   5762 ; translation from Arduino D0..D15 to stm8s208rb 
      00A171                       5763 arduino_to_8s208:
      00A171 03 06                 5764 .byte 3,6 ; D0 
      00A173 03 05                 5765 .byte 3,5 ; D1 
      00A175 04 00                 5766 .byte 4,0 ; D2 
      00A177 02 01                 5767 .byte 2,1 ; D3
      00A179 06 00                 5768 .byte 6,0 ; D4
      00A17B 02 02                 5769 .byte 2,2 ; D5
      00A17D 02 03                 5770 .byte 2,3 ; D6
      00A17F 03 01                 5771 .byte 3,1 ; D7
      00A181 03 03                 5772 .byte 3,3 ; D8
      00A183 02 04                 5773 .byte 2,4 ; D9
      00A185 04 05                 5774 .byte 4,5 ; D10
      00A187 02 06                 5775 .byte 2,6 ; D11
      00A189 02 07                 5776 .byte 2,7 ; D12
      00A18B 02 05                 5777 .byte 2,5 ; D13
      00A18D 04 02                 5778 .byte 4,2 ; D14
      00A18F 04 01                 5779 .byte 4,1 ; D15
                                   5780 
                                   5781 
                                   5782 ;------------------------------
                                   5783 ; BASIC: RND(expr)
                                   5784 ; return random number 
                                   5785 ; between 1 and expr inclusive
                                   5786 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5787 ; input:
                                   5788 ; 	none 
                                   5789 ; output:
                                   5790 ;	X 		random positive integer 
                                   5791 ;------------------------------
      00A191                       5792 random:
      00A191 CD 92 A9         [ 4] 5793 	call func_args 
      00A194 A1 01            [ 1] 5794 	cp a,#1
      00A196 27 03            [ 1] 5795 	jreq 1$
      00A198 CC 87 FF         [ 2] 5796 	jp syntax_error
      00A19B                       5797 1$: 
      00A19B CD 90 65         [ 4] 5798 	call dpop 
      00A19E 89               [ 2] 5799 	pushw x 
      00A19F 9E               [ 1] 5800 	ld a,xh 
      00A1A0 A5 80            [ 1] 5801 	bcp a,#0x80 
      00A1A2 27 05            [ 1] 5802 	jreq 2$
      00A1A4 A6 0A            [ 1] 5803 	ld a,#ERR_BAD_VALUE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      00A1A6 CC 88 01         [ 2] 5804 	jp tb_error
      00A1A9                       5805 2$: 
                                   5806 ; acc16=(x<<5)^x 
      00A1A9 CE 00 0F         [ 2] 5807 	ldw x,seedx 
      00A1AC 58               [ 2] 5808 	sllw x 
      00A1AD 58               [ 2] 5809 	sllw x 
      00A1AE 58               [ 2] 5810 	sllw x 
      00A1AF 58               [ 2] 5811 	sllw x 
      00A1B0 58               [ 2] 5812 	sllw x 
      00A1B1 9E               [ 1] 5813 	ld a,xh 
      00A1B2 C8 00 0F         [ 1] 5814 	xor a,seedx 
      00A1B5 C7 00 09         [ 1] 5815 	ld acc16,a 
      00A1B8 9F               [ 1] 5816 	ld a,xl 
      00A1B9 C8 00 10         [ 1] 5817 	xor a,seedx+1 
      00A1BC C7 00 0A         [ 1] 5818 	ld acc8,a 
                                   5819 ; seedx=seedy 
      00A1BF CE 00 11         [ 2] 5820 	ldw x,seedy 
      00A1C2 CF 00 0F         [ 2] 5821 	ldw seedx,x  
                                   5822 ; seedy=seedy^(seedy>>1)
      00A1C5 90 54            [ 2] 5823 	srlw y 
      00A1C7 90 9E            [ 1] 5824 	ld a,yh 
      00A1C9 C8 00 11         [ 1] 5825 	xor a,seedy 
      00A1CC C7 00 11         [ 1] 5826 	ld seedy,a  
      00A1CF 90 9F            [ 1] 5827 	ld a,yl 
      00A1D1 C8 00 12         [ 1] 5828 	xor a,seedy+1 
      00A1D4 C7 00 12         [ 1] 5829 	ld seedy+1,a 
                                   5830 ; acc16>>3 
      00A1D7 CE 00 09         [ 2] 5831 	ldw x,acc16 
      00A1DA 54               [ 2] 5832 	srlw x 
      00A1DB 54               [ 2] 5833 	srlw x 
      00A1DC 54               [ 2] 5834 	srlw x 
                                   5835 ; x=acc16^x 
      00A1DD 9E               [ 1] 5836 	ld a,xh 
      00A1DE C8 00 09         [ 1] 5837 	xor a,acc16 
      00A1E1 95               [ 1] 5838 	ld xh,a 
      00A1E2 9F               [ 1] 5839 	ld a,xl 
      00A1E3 C8 00 0A         [ 1] 5840 	xor a,acc8 
      00A1E6 97               [ 1] 5841 	ld xl,a 
                                   5842 ; seedy=x^seedy 
      00A1E7 C8 00 12         [ 1] 5843 	xor a,seedy+1
      00A1EA 97               [ 1] 5844 	ld xl,a 
      00A1EB 9E               [ 1] 5845 	ld a,xh 
      00A1EC C8 00 11         [ 1] 5846 	xor a,seedy
      00A1EF 95               [ 1] 5847 	ld xh,a 
      00A1F0 CF 00 11         [ 2] 5848 	ldw seedy,x 
                                   5849 ; return seedy modulo expr + 1 
      00A1F3 90 85            [ 2] 5850 	popw y 
      00A1F5 65               [ 2] 5851 	divw x,y 
      00A1F6 93               [ 1] 5852 	ldw x,y 
      00A1F7 5C               [ 2] 5853 	incw x 
      00A1F8 A6 04            [ 1] 5854 	ld a,#TK_INTGR
      00A1FA 81               [ 4] 5855 	ret 
                                   5856 
                                   5857 ;---------------------------------
                                   5858 ; BASIC: WORDS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   5859 ; affiche la listes des mots du
                                   5860 ; dictionnaire.
                                   5861 ;---------------------------------
                           000001  5862 	WLEN=1
                           000002  5863 	LLEN=2  
                           000002  5864 	VSIZE=2 
      00A1FB                       5865 words:
      00217B                       5866 	_vars VSIZE
      00A1FB 52 02            [ 2]    1     sub sp,#VSIZE 
      00A1FD 0F 02            [ 1] 5867 	clr (LLEN,sp)
      00A1FF 90 AE A5 AD      [ 2] 5868 	ldw y,#kword_dict+2
      00A203 93               [ 1] 5869 0$:	ldw x,y
      00A204 F6               [ 1] 5870 	ld a,(x)
      00A205 A4 0F            [ 1] 5871 	and a,#15 
      00A207 6B 01            [ 1] 5872 	ld (WLEN,sp),a 
      00A209 5C               [ 2] 5873 1$:	incw x 
      00A20A F6               [ 1] 5874 	ld a,(x)
      00A20B CD 82 32         [ 4] 5875 	call putc 
      00A20E 0C 02            [ 1] 5876 	inc (LLEN,sp)
      00A210 0A 01            [ 1] 5877 	dec (WLEN,sp)
      00A212 26 F5            [ 1] 5878 	jrne 1$
      00A214 A6 46            [ 1] 5879 	ld a,#70
      00A216 11 02            [ 1] 5880 	cp a,(LLEN,sp)
      00A218 2B 09            [ 1] 5881 	jrmi 2$   
      00A21A A6 20            [ 1] 5882 	ld a,#SPACE 
      00A21C CD 82 32         [ 4] 5883 	call putc 
      00A21F 0C 02            [ 1] 5884 	inc (LLEN,sp) 
      00A221 20 07            [ 2] 5885 	jra 3$
      00A223 A6 0D            [ 1] 5886 2$: ld a,#CR 
      00A225 CD 82 32         [ 4] 5887 	call putc 
      00A228 0F 02            [ 1] 5888 	clr (LLEN,sp)
      00A22A 72 A2 00 02      [ 2] 5889 3$:	subw y,#2 
      00A22E 90 FE            [ 2] 5890 	ldw y,(y)
      00A230 26 D1            [ 1] 5891 	jrne 0$  
      0021B2                       5892 	_drop VSIZE 
      00A232 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A234 81               [ 4] 5893 	ret 
                                   5894 
                                   5895 
                                   5896 ;-----------------------------
                                   5897 ; BASIC: TIMER expr 
                                   5898 ; initialize count down timer 
                                   5899 ;-----------------------------
      00A235                       5900 set_timer:
      00A235 CD 92 85         [ 4] 5901 	call arg_list
      00A238 A1 01            [ 1] 5902 	cp a,#1 
      00A23A 27 03            [ 1] 5903 	jreq 1$
      00A23C CC 87 FF         [ 2] 5904 	jp syntax_error
      00A23F                       5905 1$: 
      00A23F CD 90 65         [ 4] 5906 	call dpop 
      00A242 CF 00 0D         [ 2] 5907 	ldw timer,x 
      00A245 81               [ 4] 5908 	ret 
                                   5909 
                                   5910 ;------------------------------
                                   5911 ; BASIC: TIMEOUT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   5912 ; return state of timer 
                                   5913 ;------------------------------
      00A246                       5914 timeout:
      00A246 CE 00 0D         [ 2] 5915 	ldw x,timer 
      00A249                       5916 logical_complement:
      00A249 53               [ 2] 5917 	cplw x 
      00A24A A3 FF FF         [ 2] 5918 	cpw x,#-1
      00A24D 27 01            [ 1] 5919 	jreq 2$
      00A24F 5F               [ 1] 5920 	clrw x 
      00A250 A6 04            [ 1] 5921 2$:	ld a,#TK_INTGR
      00A252 81               [ 4] 5922 	ret 
                                   5923 
                                   5924 ;--------------------------------
                                   5925 ; BASIC NOT(expr) 
                                   5926 ; return logical complement of expr
                                   5927 ;--------------------------------
      00A253                       5928 func_not:
      00A253 CD 92 A9         [ 4] 5929 	call func_args  
      00A256 A1 01            [ 1] 5930 	cp a,#1
      00A258 27 03            [ 1] 5931 	jreq 1$
      00A25A CC 87 FF         [ 2] 5932 	jp syntax_error
      00A25D CD 90 65         [ 4] 5933 1$:	call dpop 
      00A260 20 E7            [ 2] 5934 	jra logical_complement
                                   5935 
                                   5936 
                                   5937 
                                   5938 ;-----------------------------------
                                   5939 ; BASIC: IWDGEN expr1 
                                   5940 ; enable independant watchdog timer
                                   5941 ; expr1 is delay in multiple of 62.5µsec
                                   5942 ; expr1 -> {1..16383}
                                   5943 ;-----------------------------------
      00A262                       5944 enable_iwdg:
      00A262 CD 92 85         [ 4] 5945 	call arg_list
      00A265 A1 01            [ 1] 5946 	cp a,#1 
      00A267 27 03            [ 1] 5947 	jreq 1$
      00A269 CC 87 FF         [ 2] 5948 	jp syntax_error 
      00A26C 4B 00            [ 1] 5949 1$: push #0
      00A26E 35 CC 50 E0      [ 1] 5950 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A272 CD 90 65         [ 4] 5951 	call dpop
      00A275 9E               [ 1] 5952 	ld a,xh 
      00A276 A4 3F            [ 1] 5953 	and a,#0x3f
      00A278 95               [ 1] 5954 	ld xh,a  
      00A279 A3 00 FF         [ 2] 5955 2$:	cpw x,#255
      00A27C 23 06            [ 2] 5956 	jrule 3$
      00A27E 0C 01            [ 1] 5957 	inc (1,sp)
      00A280 98               [ 1] 5958 	rcf 
      00A281 56               [ 2] 5959 	rrcw x 
      00A282 20 F5            [ 2] 5960 	jra 2$
      00A284 35 55 50 E0      [ 1] 5961 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A288 84               [ 1] 5962 	pop a  
      00A289 C7 50 E1         [ 1] 5963 	ld IWDG_PR,a 
      00A28C 9F               [ 1] 5964 	ld a,xl
      00A28D 4A               [ 1] 5965 	dec a 
      00A28E 35 55 50 E0      [ 1] 5966 	mov IWDG_KR,#IWDG_KEY_ACCESS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00A292 C7 50 E2         [ 1] 5967 	ld IWDG_RLR,a 
      00A295 35 AA 50 E0      [ 1] 5968 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A299 81               [ 4] 5969 	ret 
                                   5970 
                                   5971 
                                   5972 ;-----------------------------------
                                   5973 ; BASIC: IWDGREF  
                                   5974 ; refresh independant watchdog count down 
                                   5975 ; timer before it reset MCU. 
                                   5976 ;-----------------------------------
      00A29A                       5977 refresh_iwdg:
      00A29A 35 AA 50 E0      [ 1] 5978 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A29E 81               [ 4] 5979 	ret 
                                   5980 
                                   5981 
                                   5982 ;-------------------------------------
                                   5983 ; BASIC: LOG(expr)
                                   5984 ; return logarithm base 2 of expr 
                                   5985 ; this is the position of most significant
                                   5986 ; bit set. 
                                   5987 ; input: 
                                   5988 ; output:
                                   5989 ;   X     log2 
                                   5990 ;   A     TK_INTGR 
                                   5991 ;*********************************
      00A29F                       5992 log2:
      00A29F CD 92 A9         [ 4] 5993 	call func_args 
      00A2A2 A1 01            [ 1] 5994 	cp a,#1 
      00A2A4 27 03            [ 1] 5995 	jreq 1$
      00A2A6 CC 87 FF         [ 2] 5996 	jp syntax_error 
      00A2A9 CD 90 65         [ 4] 5997 1$: call dpop
      00A2AC                       5998 leading_one:
      00A2AC 5D               [ 2] 5999 	tnzw x 
      00A2AD 27 0A            [ 1] 6000 	jreq 4$
      00A2AF A6 0F            [ 1] 6001 	ld a,#15 
      00A2B1 59               [ 2] 6002 2$: rlcw x 
      00A2B2 25 03            [ 1] 6003     jrc 3$
      00A2B4 4A               [ 1] 6004 	dec a 
      00A2B5 20 FA            [ 2] 6005 	jra 2$
      00A2B7 5F               [ 1] 6006 3$: clrw x 
      00A2B8 97               [ 1] 6007     ld xl,a
      00A2B9 A6 04            [ 1] 6008 4$:	ld a,#TK_INTGR
      00A2BB 81               [ 4] 6009 	ret 
                                   6010 
                                   6011 ;-----------------------------------
                                   6012 ; BASIC: PWR(expr) 
                                   6013 ; expr ->{0..15}
                                   6014 ; return 2^expr 
                                   6015 ; output:
                                   6016 ;    x    2^expr 
                                   6017 ;-----------------------------------
      00A2BC                       6018 pwr2:
      00A2BC CD 92 A9         [ 4] 6019     call func_args 
      00A2BF A1 01            [ 1] 6020 	cp a,#1
      00A2C1 27 03            [ 1] 6021 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      00A2C3 CC 87 FF         [ 2] 6022 	jp syntax_error 
      00A2C6 CD 90 65         [ 4] 6023 1$: call dpop 
      00A2C9 9F               [ 1] 6024 	ld a,xl 
      00A2CA A4 0F            [ 1] 6025 	and a,#15
      00A2CC 5F               [ 1] 6026 	clrw x 
      00A2CD 5C               [ 2] 6027 	incw x 
      00A2CE 4D               [ 1] 6028 2$: tnz a 
      00A2CF 27 04            [ 1] 6029 	jreq 3$
      00A2D1 58               [ 2] 6030 	slaw x 
      00A2D2 4A               [ 1] 6031 	dec a 
      00A2D3 20 F9            [ 2] 6032 	jra 2$ 
      00A2D5 A6 04            [ 1] 6033 3$: ld a,#TK_INTGR
      00A2D7 81               [ 4] 6034 	ret 
                                   6035 
                                   6036 
                                   6037 ;------------------------------
                                   6038 ;      dictionary 
                                   6039 ; format:
                                   6040 ;   link:   2 bytes 
                                   6041 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6042 ;   cmd_name: 16 byte max 
                                   6043 ;   code_address: 2 bytes 
                                   6044 ;------------------------------
                                   6045 	.macro _dict_entry len,name,cmd 
                                   6046 	.word LINK 
                                   6047 	LINK=.
                                   6048 name:
                                   6049 	.byte len 	
                                   6050 	.ascii "name"
                                   6051 	.word cmd 
                                   6052 	.endm 
                                   6053 
                           000000  6054 	LINK=0
      00A2D8                       6055 kword_end:
      002258                       6056 	_dict_entry,5+F_IFUNC,XPEEK,xpeek 
      00A2D8 00 00                    1 	.word LINK 
                           00225A     2 	LINK=.
      00A2DA                          3 XPEEK:
      00A2DA 45                       4 	.byte 5+F_IFUNC 	
      00A2DB 58 50 45 45 4B           5 	.ascii "XPEEK"
      00A2E0 98 9A                    6 	.word xpeek 
      002262                       6057 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      00A2E2 A2 DA                    1 	.word LINK 
                           002264     2 	LINK=.
      00A2E4                          3 XOR:
      00A2E4 43                       4 	.byte 3+F_IFUNC 	
      00A2E5 58 4F 52                 5 	.ascii "XOR"
      00A2E8 A0 B8                    6 	.word bit_xor 
      00226A                       6058 	_dict_entry,5,WRITE,write  
      00A2EA A2 E4                    1 	.word LINK 
                           00226C     2 	LINK=.
      00A2EC                          3 WRITE:
      00A2EC 05                       4 	.byte 5 	
      00A2ED 57 52 49 54 45           5 	.ascii "WRITE"
      00A2F2 9E E0                    6 	.word write 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      002274                       6059 	_dict_entry,5,WORDS,words 
      00A2F4 A2 EC                    1 	.word LINK 
                           002276     2 	LINK=.
      00A2F6                          3 WORDS:
      00A2F6 05                       4 	.byte 5 	
      00A2F7 57 4F 52 44 53           5 	.ascii "WORDS"
      00A2FC A1 FB                    6 	.word words 
      00227E                       6060 	_dict_entry 4,WAIT,wait 
      00A2FE A2 F6                    1 	.word LINK 
                           002280     2 	LINK=.
      00A300                          3 WAIT:
      00A300 04                       4 	.byte 4 	
      00A301 57 41 49 54              5 	.ascii "WAIT"
      00A305 97 E1                    6 	.word wait 
      002287                       6061 	_dict_entry,3+F_IFUNC,USR,usr
      00A307 A3 00                    1 	.word LINK 
                           002289     2 	LINK=.
      00A309                          3 USR:
      00A309 43                       4 	.byte 3+F_IFUNC 	
      00A30A 55 53 52                 5 	.ascii "USR"
      00A30D 9F 91                    6 	.word usr 
      00228F                       6062 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00A30F A3 09                    1 	.word LINK 
                           002291     2 	LINK=.
      00A311                          3 UFLASH:
      00A311 46                       4 	.byte 6+F_IFUNC 	
      00A312 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      00A318 9F 8B                    6 	.word uflash 
      00229A                       6063 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      00A31A A3 11                    1 	.word LINK 
                           00229C     2 	LINK=.
      00A31C                          3 UBOUND:
      00A31C 46                       4 	.byte 6+F_IFUNC 	
      00A31D 55 42 4F 55 4E 44        5 	.ascii "UBOUND"
      00A323 94 48                    6 	.word ubound 
      0022A5                       6064 	_dict_entry,4,TONE,tone  
      00A325 A3 1C                    1 	.word LINK 
                           0022A7     2 	LINK=.
      00A327                          3 TONE:
      00A327 04                       4 	.byte 4 	
      00A328 54 4F 4E 45              5 	.ascii "TONE"
      00A32C 9A 83                    6 	.word tone 
      0022AE                       6065 	_dict_entry,2,TO,to
      00A32E A3 27                    1 	.word LINK 
                           0022B0     2 	LINK=.
      00A330                          3 TO:
      00A330 02                       4 	.byte 2 	
      00A331 54 4F                    5 	.ascii "TO"
      00A333 98 F8                    6 	.word to 
      0022B5                       6066 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A335 A3 30                    1 	.word LINK 
                           0022B7     2 	LINK=.
      00A337                          3 TIMEOUT:
      00A337 47                       4 	.byte 7+F_IFUNC 	
      00A338 54 49 4D 45 4F 55 54     5 	.ascii "TIMEOUT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal  A2-Bits]



      00A340 46 A3                    6 	.word timeout 
      0022C1                       6067 	_dict_entry,5,TIMER,set_timer
      00A342 37 B7                    1 	.word LINK 
                           0022C3     2 	LINK=.
      00A343                          3 TIMER:
      00A343 05                       4 	.byte 5 	
      00A344 54 49 4D 45 52           5 	.ascii "TIMER"
      00A349 A2 35                    6 	.word set_timer 
      0022CB                       6068 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A34B A3 43                    1 	.word LINK 
                           0022CD     2 	LINK=.
      00A34D                          3 TICKS:
      00A34D 45                       4 	.byte 5+F_IFUNC 	
      00A34E 54 49 43 4B 53           5 	.ascii "TICKS"
      00A353 A0 60                    6 	.word get_ticks 
      0022D5                       6069 	_dict_entry,4,STOP,stop 
      00A355 A3 4D                    1 	.word LINK 
                           0022D7     2 	LINK=.
      00A357                          3 STOP:
      00A357 04                       4 	.byte 4 	
      00A358 53 54 4F 50              5 	.ascii "STOP"
      00A35C 9A 74                    6 	.word stop 
      0022DE                       6070 	_dict_entry,4,STEP,step 
      00A35E A3 57                    1 	.word LINK 
                           0022E0     2 	LINK=.
      00A360                          3 STEP:
      00A360 04                       4 	.byte 4 	
      00A361 53 54 45 50              5 	.ascii "STEP"
      00A365 99 28                    6 	.word step 
      0022E7                       6071 	_dict_entry,5,SLEEP,sleep 
      00A367 A3 60                    1 	.word LINK 
                           0022E9     2 	LINK=.
      00A369                          3 SLEEP:
      00A369 05                       4 	.byte 5 	
      00A36A 53 4C 45 45 50           5 	.ascii "SLEEP"
      00A36F 9F F9                    6 	.word sleep 
      0022F1                       6072 	_dict_entry,4+F_IFUNC,SIZE,size
      00A371 A3 69                    1 	.word LINK 
                           0022F3     2 	LINK=.
      00A373                          3 SIZE:
      00A373 44                       4 	.byte 4+F_IFUNC 	
      00A374 53 49 5A 45              5 	.ascii "SIZE"
      00A378 94 3E                    6 	.word size 
      0022FA                       6073     _dict_entry,4,SHOW,show 
      00A37A A3 73                    1 	.word LINK 
                           0022FC     2 	LINK=.
      00A37C                          3 SHOW:
      00A37C 04                       4 	.byte 4 	
      00A37D 53 48 4F 57              5 	.ascii "SHOW"
      00A381 94 24                    6 	.word show 
      002303                       6074 	_dict_entry,4,SAVE,save
      00A383 A3 7C                    1 	.word LINK 
                           002305     2 	LINK=.
      00A385                          3 SAVE:
      00A385 04                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00A386 53 41 56 45              5 	.ascii "SAVE"
      00A38A 9C CF                    6 	.word save 
      00230C                       6075 	_dict_entry 3,RUN,run
      00A38C A3 85                    1 	.word LINK 
                           00230E     2 	LINK=.
      00A38E                          3 RUN:
      00A38E 03                       4 	.byte 3 	
      00A38F 52 55 4E                 5 	.ascii "RUN"
      00A392 9A 31                    6 	.word run 
      002314                       6076 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A394 A3 8E                    1 	.word LINK 
                           002316     2 	LINK=.
      00A396                          3 RSHIFT:
      00A396 46                       4 	.byte 6+F_IFUNC 	
      00A397 52 53 48 49 46 54        5 	.ascii "RSHIFT"
      00A39D A0 F3                    6 	.word rshift 
      00231F                       6077 	_dict_entry,3+F_IFUNC,RND,random 
      00A39F A3 96                    1 	.word LINK 
                           002321     2 	LINK=.
      00A3A1                          3 RND:
      00A3A1 43                       4 	.byte 3+F_IFUNC 	
      00A3A2 52 4E 44                 5 	.ascii "RND"
      00A3A5 A1 91                    6 	.word random 
      002327                       6078 	_dict_entry,6,RETURN,return 
      00A3A7 A3 A1                    1 	.word LINK 
                           002329     2 	LINK=.
      00A3A9                          3 RETURN:
      00A3A9 06                       4 	.byte 6 	
      00A3AA 52 45 54 55 52 4E        5 	.ascii "RETURN"
      00A3B0 9A 11                    6 	.word return 
      002332                       6079 	_dict_entry 6,REMARK,rem 
      00A3B2 A3 A9                    1 	.word LINK 
                           002334     2 	LINK=.
      00A3B4                          3 REMARK:
      00A3B4 06                       4 	.byte 6 	
      00A3B5 52 45 4D 41 52 4B        5 	.ascii "REMARK"
      00A3BB 97 DB                    6 	.word rem 
      00233D                       6080 	_dict_entry,6,REBOOT,cold_start 
      00A3BD A3 B4                    1 	.word LINK 
                           00233F     2 	LINK=.
      00A3BF                          3 REBOOT:
      00A3BF 06                       4 	.byte 6 	
      00A3C0 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      00A3C6 85 E0                    6 	.word cold_start 
      002348                       6081 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A3C8 A3 BF                    1 	.word LINK 
                           00234A     2 	LINK=.
      00A3CA                          3 QKEY:
      00A3CA 44                       4 	.byte 4+F_IFUNC 	
      00A3CB 51 4B 45 59              5 	.ascii "QKEY"
      00A3CF 9F 4E                    6 	.word qkey 
      002351                       6082 	_dict_entry,3+F_IFUNC,PWR,pwr2
      00A3D1 A3 CA                    1 	.word LINK 
                           002353     2 	LINK=.
      00A3D3                          3 PWR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00A3D3 43                       4 	.byte 3+F_IFUNC 	
      00A3D4 50 57 52                 5 	.ascii "PWR"
      00A3D7 A2 BC                    6 	.word pwr2 
      002359                       6083 	_dict_entry 5,PRINT,print 
      00A3D9 A3 D3                    1 	.word LINK 
                           00235B     2 	LINK=.
      00A3DB                          3 PRINT:
      00A3DB 05                       4 	.byte 5 	
      00A3DC 50 52 49 4E 54           5 	.ascii "PRINT"
      00A3E1 96 D6                    6 	.word print 
      002363                       6084 	_dict_entry,4+F_CONST,POUT,OUTP 
      00A3E3 A3 DB                    1 	.word LINK 
                           002365     2 	LINK=.
      00A3E5                          3 POUT:
      00A3E5 C4                       4 	.byte 4+F_CONST 	
      00A3E6 50 4F 55 54              5 	.ascii "POUT"
      00A3EA 00 01                    6 	.word OUTP 
      00236C                       6085 	_dict_entry,4,POKE,poke 
      00A3EC A3 E5                    1 	.word LINK 
                           00236E     2 	LINK=.
      00A3EE                          3 POKE:
      00A3EE 04                       4 	.byte 4 	
      00A3EF 50 4F 4B 45              5 	.ascii "POKE"
      00A3F3 98 74                    6 	.word poke 
      002375                       6086 	_dict_entry,4+F_CONST,PINP,INP 
      00A3F5 A3 EE                    1 	.word LINK 
                           002377     2 	LINK=.
      00A3F7                          3 PINP:
      00A3F7 C4                       4 	.byte 4+F_CONST 	
      00A3F8 50 49 4E 50              5 	.ascii "PINP"
      00A3FC 00 00                    6 	.word INP 
      00237E                       6087 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A3FE A3 F7                    1 	.word LINK 
                           002380     2 	LINK=.
      00A400                          3 PEEK:
      00A400 44                       4 	.byte 4+F_IFUNC 	
      00A401 50 45 45 4B              5 	.ascii "PEEK"
      00A405 98 87                    6 	.word peek 
      002387                       6088 	_dict_entry,5,PMODE,pin_mode 
      00A407 A4 00                    1 	.word LINK 
                           002389     2 	LINK=.
      00A409                          3 PMODE:
      00A409 05                       4 	.byte 5 	
      00A40A 50 4D 4F 44 45           5 	.ascii "PMODE"
      00A40F A1 1C                    6 	.word pin_mode 
      002391                       6089 	_dict_entry,5,PAUSE,pause 
      00A411 A4 09                    1 	.word LINK 
                           002393     2 	LINK=.
      00A413                          3 PAUSE:
      00A413 05                       4 	.byte 5 	
      00A414 50 41 55 53 45           5 	.ascii "PAUSE"
      00A419 A0 04                    6 	.word pause 
      00239B                       6090 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A41B A4 13                    1 	.word LINK 
                           00239D     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      00A41D                          3 OR:
      00A41D 42                       4 	.byte 2+F_IFUNC 	
      00A41E 4F 52                    5 	.ascii "OR"
      00A420 A0 9A                    6 	.word bit_or 
      0023A2                       6091 	_dict_entry,3+F_CONST,ODR,GPIO_ODR
      00A422 A4 1D                    1 	.word LINK 
                           0023A4     2 	LINK=.
      00A424                          3 ODR:
      00A424 C3                       4 	.byte 3+F_CONST 	
      00A425 4F 44 52                 5 	.ascii "ODR"
      00A428 00 00                    6 	.word GPIO_ODR 
      0023AA                       6092 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A42A A4 24                    1 	.word LINK 
                           0023AC     2 	LINK=.
      00A42C                          3 NOT:
      00A42C 43                       4 	.byte 3+F_IFUNC 	
      00A42D 4E 4F 54                 5 	.ascii "NOT"
      00A430 A2 53                    6 	.word func_not 
      0023B2                       6093 	_dict_entry,3,NEW,new
      00A432 A4 2C                    1 	.word LINK 
                           0023B4     2 	LINK=.
      00A434                          3 NEW:
      00A434 03                       4 	.byte 3 	
      00A435 4E 45 57                 5 	.ascii "NEW"
      00A438 9C 0D                    6 	.word new 
      0023BA                       6094 	_dict_entry,4,NEXT,next 
      00A43A A4 34                    1 	.word LINK 
                           0023BC     2 	LINK=.
      00A43C                          3 NEXT:
      00A43C 04                       4 	.byte 4 	
      00A43D 4E 45 58 54              5 	.ascii "NEXT"
      00A441 99 50                    6 	.word next 
      0023C3                       6095 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A443 A4 3C                    1 	.word LINK 
                           0023C5     2 	LINK=.
      00A445                          3 LSHIFT:
      00A445 46                       4 	.byte 6+F_IFUNC 	
      00A446 4C 53 48 49 46 54        5 	.ascii "LSHIFT"
      00A44C A0 D6                    6 	.word lshift 
      0023CE                       6096 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A44E A4 45                    1 	.word LINK 
                           0023D0     2 	LINK=.
      00A450                          3 LOG:
      00A450 43                       4 	.byte 3+F_IFUNC 	
      00A451 4C 4F 47                 5 	.ascii "LOG"
      00A454 A2 9F                    6 	.word log2 
      0023D6                       6097 	_dict_entry,4,LOAD,load 
      00A456 A4 50                    1 	.word LINK 
                           0023D8     2 	LINK=.
      00A458                          3 LOAD:
      00A458 04                       4 	.byte 4 	
      00A459 4C 4F 41 44              5 	.ascii "LOAD"
      00A45D 9D C4                    6 	.word load 
      0023DF                       6098 	_dict_entry 4,LIST,list
      00A45F A4 58                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                           0023E1     2 	LINK=.
      00A461                          3 LIST:
      00A461 04                       4 	.byte 4 	
      00A462 4C 49 53 54              5 	.ascii "LIST"
      00A466 94 92                    6 	.word list 
      0023E8                       6099 	_dict_entry 3,LET,let 
      00A468 A4 61                    1 	.word LINK 
                           0023EA     2 	LINK=.
      00A46A                          3 LET:
      00A46A 03                       4 	.byte 3 	
      00A46B 4C 45 54                 5 	.ascii "LET"
      00A46E 94 6A                    6 	.word let 
      0023F0                       6100 	_dict_entry,3+F_IFUNC,KEY,key 
      00A470 A4 6A                    1 	.word LINK 
                           0023F2     2 	LINK=.
      00A472                          3 KEY:
      00A472 43                       4 	.byte 3+F_IFUNC 	
      00A473 4B 45 59                 5 	.ascii "KEY"
      00A476 9F 46                    6 	.word key 
      0023F8                       6101 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A478 A4 72                    1 	.word LINK 
                           0023FA     2 	LINK=.
      00A47A                          3 IWDGREF:
      00A47A 07                       4 	.byte 7 	
      00A47B 49 57 44 47 52 45 46     5 	.ascii "IWDGREF"
      00A482 A2 9A                    6 	.word refresh_iwdg 
      002404                       6102 	_dict_entry,6,IWDGEN,enable_iwdg
      00A484 A4 7A                    1 	.word LINK 
                           002406     2 	LINK=.
      00A486                          3 IWDGEN:
      00A486 06                       4 	.byte 6 	
      00A487 49 57 44 47 45 4E        5 	.ascii "IWDGEN"
      00A48D A2 62                    6 	.word enable_iwdg 
      00240F                       6103 	_dict_entry,5,INPUT,input_var  
      00A48F A4 86                    1 	.word LINK 
                           002411     2 	LINK=.
      00A491                          3 INPUT:
      00A491 05                       4 	.byte 5 	
      00A492 49 4E 50 55 54           5 	.ascii "INPUT"
      00A497 97 67                    6 	.word input_var 
      002419                       6104 	_dict_entry,2,IF,if 
      00A499 A4 91                    1 	.word LINK 
                           00241B     2 	LINK=.
      00A49B                          3 IF:
      00A49B 02                       4 	.byte 2 	
      00A49C 49 46                    5 	.ascii "IF"
      00A49E 98 BA                    6 	.word if 
      002420                       6105 	_dict_entry,3+F_CONST,IDR,GPIO_IDR
      00A4A0 A4 9B                    1 	.word LINK 
                           002422     2 	LINK=.
      00A4A2                          3 IDR:
      00A4A2 C3                       4 	.byte 3+F_CONST 	
      00A4A3 49 44 52                 5 	.ascii "IDR"
      00A4A6 00 01                    6 	.word GPIO_IDR 
      002428                       6106 	_dict_entry,3,HEX,hex_base
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A4A8 A4 A2                    1 	.word LINK 
                           00242A     2 	LINK=.
      00A4AA                          3 HEX:
      00A4AA 03                       4 	.byte 3 	
      00A4AB 48 45 58                 5 	.ascii "HEX"
      00A4AE 94 34                    6 	.word hex_base 
      002430                       6107 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A4B0 A4 AA                    1 	.word LINK 
                           002432     2 	LINK=.
      00A4B2                          3 GPIO:
      00A4B2 44                       4 	.byte 4+F_IFUNC 	
      00A4B3 47 50 49 4F              5 	.ascii "GPIO"
      00A4B7 9F 58                    6 	.word gpio 
      002439                       6108 	_dict_entry,4,GOTO,goto 
      00A4B9 A4 B2                    1 	.word LINK 
                           00243B     2 	LINK=.
      00A4BB                          3 GOTO:
      00A4BB 04                       4 	.byte 4 	
      00A4BC 47 4F 54 4F              5 	.ascii "GOTO"
      00A4C0 99 BF                    6 	.word goto 
      002442                       6109 	_dict_entry,5,GOSUB,gosub 
      00A4C2 A4 BB                    1 	.word LINK 
                           002444     2 	LINK=.
      00A4C4                          3 GOSUB:
      00A4C4 05                       4 	.byte 5 	
      00A4C5 47 4F 53 55 42           5 	.ascii "GOSUB"
      00A4CA 99 CC                    6 	.word gosub 
      00244C                       6110 	_dict_entry,6,FORGET,forget 
      00A4CC A4 C4                    1 	.word LINK 
                           00244E     2 	LINK=.
      00A4CE                          3 FORGET:
      00A4CE 06                       4 	.byte 6 	
      00A4CF 46 4F 52 47 45 54        5 	.ascii "FORGET"
      00A4D5 9D FF                    6 	.word forget 
      002457                       6111 	_dict_entry,3,FOR,for 
      00A4D7 A4 CE                    1 	.word LINK 
                           002459     2 	LINK=.
      00A4D9                          3 FOR:
      00A4D9 03                       4 	.byte 3 	
      00A4DA 46 4F 52                 5 	.ascii "FOR"
      00A4DD 98 CE                    6 	.word for 
      00245F                       6112 	_dict_entry,4,FCPU,fcpu 
      00A4DF A4 D9                    1 	.word LINK 
                           002461     2 	LINK=.
      00A4E1                          3 FCPU:
      00A4E1 04                       4 	.byte 4 	
      00A4E2 46 43 50 55              5 	.ascii "FCPU"
      00A4E6 A1 10                    6 	.word fcpu 
      002468                       6113 	_dict_entry,6+F_CONST,EEPROM,EEPROM_BASE  
      00A4E8 A4 E1                    1 	.word LINK 
                           00246A     2 	LINK=.
      00A4EA                          3 EEPROM:
      00A4EA C6                       4 	.byte 6+F_CONST 	
      00A4EB 45 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00A4F1 40 00                    6 	.word EEPROM_BASE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      002473                       6114 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A4F3 A4 EA                    1 	.word LINK 
                           002475     2 	LINK=.
      00A4F5                          3 DWRITE:
      00A4F5 06                       4 	.byte 6+F_CMD 	
      00A4F6 44 57 52 49 54 45        5 	.ascii "DWRITE"
      00A4FC 9B 82                    6 	.word digital_write 
      00247E                       6115 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A4FE A4 F5                    1 	.word LINK 
                           002480     2 	LINK=.
      00A500                          3 DREAD:
      00A500 45                       4 	.byte 5+F_IFUNC 	
      00A501 44 52 45 41 44           5 	.ascii "DREAD"
      00A506 9B 50                    6 	.word digital_read 
      002488                       6116 	_dict_entry,3,DIR,directory 
      00A508 A5 00                    1 	.word LINK 
                           00248A     2 	LINK=.
      00A50A                          3 DIR:
      00A50A 03                       4 	.byte 3 	
      00A50B 44 49 52                 5 	.ascii "DIR"
      00A50E 9E 4A                    6 	.word directory 
      002490                       6117 	_dict_entry,3,DEC,dec_base
      00A510 A5 0A                    1 	.word LINK 
                           002492     2 	LINK=.
      00A512                          3 DEC:
      00A512 03                       4 	.byte 3 	
      00A513 44 45 43                 5 	.ascii "DEC"
      00A516 94 39                    6 	.word dec_base 
      002498                       6118 	_dict_entry,3+F_CONST,DDR,GPIO_DDR
      00A518 A5 12                    1 	.word LINK 
                           00249A     2 	LINK=.
      00A51A                          3 DDR:
      00A51A C3                       4 	.byte 3+F_CONST 	
      00A51B 44 44 52                 5 	.ascii "DDR"
      00A51E 00 02                    6 	.word GPIO_DDR 
      0024A0                       6119 	_dict_entry,3+F_CONST,CRL,GPIO_CR1
      00A520 A5 1A                    1 	.word LINK 
                           0024A2     2 	LINK=.
      00A522                          3 CRL:
      00A522 C3                       4 	.byte 3+F_CONST 	
      00A523 43 52 4C                 5 	.ascii "CRL"
      00A526 00 03                    6 	.word GPIO_CR1 
      0024A8                       6120 	_dict_entry,3+F_CONST,CRH,GPIO_CR2
      00A528 A5 22                    1 	.word LINK 
                           0024AA     2 	LINK=.
      00A52A                          3 CRH:
      00A52A C3                       4 	.byte 3+F_CONST 	
      00A52B 43 52 48                 5 	.ascii "CRH"
      00A52E 00 04                    6 	.word GPIO_CR2 
      0024B0                       6121 	_dict_entry,4+F_CFUNC,CHAR,char
      00A530 A5 2A                    1 	.word LINK 
                           0024B2     2 	LINK=.
      00A532                          3 CHAR:
      00A532 84                       4 	.byte 4+F_CFUNC 	
      00A533 43 48 41 52              5 	.ascii "CHAR"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A537 9F 17                    6 	.word char 
      0024B9                       6122 	_dict_entry,3,BYE,bye 
      00A539 A5 32                    1 	.word LINK 
                           0024BB     2 	LINK=.
      00A53B                          3 BYE:
      00A53B 03                       4 	.byte 3 	
      00A53C 42 59 45                 5 	.ascii "BYE"
      00A53F 9F AF                    6 	.word bye 
      0024C1                       6123 	_dict_entry,5,BTOGL,bit_toggle
      00A541 A5 3B                    1 	.word LINK 
                           0024C3     2 	LINK=.
      00A543                          3 BTOGL:
      00A543 05                       4 	.byte 5 	
      00A544 42 54 4F 47 4C           5 	.ascii "BTOGL"
      00A549 98 35                    6 	.word bit_toggle 
      0024CB                       6124 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A54B A5 43                    1 	.word LINK 
                           0024CD     2 	LINK=.
      00A54D                          3 BTEST:
      00A54D 45                       4 	.byte 5+F_IFUNC 	
      00A54E 42 54 45 53 54           5 	.ascii "BTEST"
      00A553 98 49                    6 	.word bit_test 
      0024D5                       6125 	_dict_entry,4,BSET,bit_set 
      00A555 A5 4D                    1 	.word LINK 
                           0024D7     2 	LINK=.
      00A557                          3 BSET:
      00A557 04                       4 	.byte 4 	
      00A558 42 53 45 54              5 	.ascii "BSET"
      00A55C 98 0C                    6 	.word bit_set 
      0024DE                       6126 	_dict_entry,4,BRES,bit_reset
      00A55E A5 57                    1 	.word LINK 
                           0024E0     2 	LINK=.
      00A560                          3 BRES:
      00A560 04                       4 	.byte 4 	
      00A561 42 52 45 53              5 	.ascii "BRES"
      00A565 98 20                    6 	.word bit_reset 
      0024E7                       6127 	_dict_entry,5,BREAK,break 
      00A567 A5 60                    1 	.word LINK 
                           0024E9     2 	LINK=.
      00A569                          3 BREAK:
      00A569 05                       4 	.byte 5 	
      00A56A 42 52 45 41 4B           5 	.ascii "BREAK"
      00A56F 9B C1                    6 	.word break 
      0024F1                       6128 	_dict_entry,3,AWU,awu 
      00A571 A5 69                    1 	.word LINK 
                           0024F3     2 	LINK=.
      00A573                          3 AWU:
      00A573 03                       4 	.byte 3 	
      00A574 41 57 55                 5 	.ascii "AWU"
      00A577 A0 17                    6 	.word awu 
      0024F9                       6129 	_dict_entry,7,AUTORUN,autorun
      00A579 A5 73                    1 	.word LINK 
                           0024FB     2 	LINK=.
      00A57B                          3 AUTORUN:
      00A57B 07                       4 	.byte 7 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A57C 41 55 54 4F 52 55 4E     5 	.ascii "AUTORUN"
      00A583 9F B8                    6 	.word autorun 
      002505                       6130 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A585 A5 7B                    1 	.word LINK 
                           002507     2 	LINK=.
      00A587                          3 ASC:
      00A587 43                       4 	.byte 3+F_IFUNC 	
      00A588 41 53 43                 5 	.ascii "ASC"
      00A58B 9F 2B                    6 	.word ascii 
      00250D                       6131 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A58D A5 87                    1 	.word LINK 
                           00250F     2 	LINK=.
      00A58F                          3 AND:
      00A58F 43                       4 	.byte 3+F_IFUNC 	
      00A590 41 4E 44                 5 	.ascii "AND"
      00A593 A0 7C                    6 	.word bit_and 
      002515                       6132 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A595 A5 8F                    1 	.word LINK 
                           002517     2 	LINK=.
      00A597                          3 ADCREAD:
      00A597 47                       4 	.byte 7+F_IFUNC 	
      00A598 41 44 43 52 45 41 44     5 	.ascii "ADCREAD"
      00A59F 9B 1A                    6 	.word analog_read 
      002521                       6133 	_dict_entry,5,ADCON,power_adc 
      00A5A1 A5 97                    1 	.word LINK 
                           002523     2 	LINK=.
      00A5A3                          3 ADCON:
      00A5A3 05                       4 	.byte 5 	
      00A5A4 41 44 43 4F 4E           5 	.ascii "ADCON"
      00A5A9 9A D1                    6 	.word power_adc 
      00A5AB                       6134 kword_dict:
      00252B                       6135 	_dict_entry,3+F_IFUNC,ABS,abs
      00A5AB A5 A3                    1 	.word LINK 
                           00252D     2 	LINK=.
      00A5AD                          3 ABS:
      00A5AD 43                       4 	.byte 3+F_IFUNC 	
      00A5AE 41 42 53                 5 	.ascii "ABS"
      00A5B1 A0 66                    6 	.word abs 
                                   6136 	
                                   6137 
      00A600                       6138 	.bndry 128 ; align on FLASH block.
                                   6139 ; free space for user application  
      00A600                       6140 user_space:
                                   6141 ; USR() function test
      00A600 89               [ 2] 6142 	pushw x 
      00A601 72 1A 50 0A      [ 1] 6143 	bset PC_ODR,#5 
      00A605 85               [ 2] 6144 	popw x 
      00A606 CD A0 0E         [ 4] 6145 	call pause02 
      00A609 72 1B 50 0A      [ 1] 6146 	bres PC_ODR,#5 
      00A60D 81               [ 4] 6147 	ret
                                   6148 
                                   6149 	.area FLASH_DRIVE (ABS)
      010000                       6150 	.org 0x10000
      010000                       6151 fdrive:
      010000 00 00 00 00           6152 .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        00252D R   |   5 ADCON      002523 R
  5 ADCREAD    002517 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |     ADDR    =  000001 
    ADD_SPAC=  000003     |     AFR     =  004803     |     AFR0_ADC=  000000 
    AFR1_TIM=  000001     |     AFR2_CCO=  000002     |     AFR3_TIM=  000003 
    AFR4_TIM=  000004     |     AFR5_TIM=  000005     |     AFR6_I2C=  000006 
    AFR7_BEE=  000007     |   5 AND        00250F R   |     ARG_CNT =  000001 
    ARG_OFS =  000002     |   5 ASC        002507 R   |     ATTRIB  =  000002 
  5 AUTORUN    0024FB R   |     AUTORUN_=  004000     |   5 AWU        0024F3 R
  5 AWUHandl   00000A R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_CSR_=  000004     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |     BASE    =  000002 
    BASE_SAV=  000001     |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |     BELL    =  000007 
    BINARY  =  000001     |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BLOCK_ER=  000000     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  000005     |   5 BREAK      0024E9 R
  5 BRES       0024E0 R   |   5 BSET       0024D7 R   |     BSIZE   =  000001 
    BSP     =  000008     |   5 BTEST      0024CD R   |   5 BTOGL      0024C3 R
    BTW     =  000001     |     BUFIDX  =  000003     |   5 BYE        0024BB R
    C       =  000001     |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CC_C    =  000000     |     CC_H    =  000004 
    CC_I0   =  000003     |     CC_I1   =  000005     |     CC_N    =  000002 
    CC_V    =  000007     |     CC_Z    =  000001     |     CELL_SIZ=  000002 
    CFG_GCR =  007F60     |     CFG_GCR_=  000001     |     CFG_GCR_=  000000 
  5 CHAR       0024B2 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
    CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0     |     CLK_ICKR=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]

Symbol Table

    CLK_ICKR=  000000     |     CLK_ICKR=  000001     |     CLK_ICKR=  000003 
    CLK_ICKR=  000004     |     CLK_ICKR=  000005     |     CLK_PCKE=  0050C7 
    CLK_PCKE=  000000     |     CLK_PCKE=  000001     |     CLK_PCKE=  000007 
    CLK_PCKE=  000005     |     CLK_PCKE=  000006     |     CLK_PCKE=  000004 
    CLK_PCKE=  000002     |     CLK_PCKE=  000003     |     CLK_PCKE=  0050CA 
    CLK_PCKE=  000003     |     CLK_PCKE=  000002     |     CLK_PCKE=  000007 
    CLK_SWCR=  0050C5     |     CLK_SWCR=  000000     |     CLK_SWCR=  000001 
    CLK_SWCR=  000002     |     CLK_SWCR=  000003     |     CLK_SWIM=  0050CD 
    CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1 
    CLK_SWR_=  0000D2     |     CMD_END =  000002     |     CNT     =  000008 
    COMMA   =  000001     |     COUNT   =  000001     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        0024AA R
  5 CRL        0024A2 R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
    CTRL_C  =  000003     |     CTRL_D  =  000004     |     CTRL_E  =  000005 
    CTRL_F  =  000006     |     CTRL_G  =  000007     |     CTRL_H  =  000008 
    CTRL_I  =  000009     |     CTRL_J  =  00000A     |     CTRL_K  =  00000B 
    CTRL_L  =  00000C     |     CTRL_M  =  00000D     |     CTRL_N  =  00000E 
    CTRL_O  =  00000F     |     CTRL_P  =  000010     |     CTRL_Q  =  000011 
    CTRL_R  =  000012     |     CTRL_S  =  000013     |     CTRL_T  =  000014 
    CTRL_U  =  000015     |     CTRL_V  =  000016     |     CTRL_W  =  000017 
    CTRL_X  =  000018     |     CTRL_Y  =  000019     |     CTRL_Z  =  00001A 
    CTXT_SIZ=  000006     |     CURR    =  000002     |     CX_BPTR =  000001 
    CX_CNT  =  000005     |     CX_IN   =  000004     |     CX_LNO  =  000003 
    DBG_A   =  000005     |     DBG_CC  =  000006     |     DBG_X   =  000003 
    DBG_Y   =  000001     |   5 DDR        00249A R   |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   5 DEC        002492 R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        00248A R   |     DIVIDND =  000007     |     DIVISR  =  000005 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   5 DREAD      002480 R
    DSTACK_S=  000040     |   5 DWRITE     002475 R   |   5 EEPROM     00246A R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
    EOF     =  0000FF     |     ERR_BAD_=  00000A     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_L=  000005     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  5 FCPU       002461 R   |     FF      =  00000C     |     FFOR    =  000002 
    FHSE    =  7A1200     |     FHSI    =  F42400     |     FIRST   =  000001 
    FLASH_BA=  008000     |     FLASH_CR=  00505A     |     FLASH_CR=  000002 
    FLASH_CR=  000000     |     FLASH_CR=  000003     |     FLASH_CR=  000001 
    FLASH_CR=  00505B     |     FLASH_CR=  000005     |     FLASH_CR=  000004 
    FLASH_CR=  000007     |     FLASH_CR=  000000     |     FLASH_CR=  000006 
    FLASH_DU=  005064     |     FLASH_DU=  0000AE     |     FLASH_DU=  000056 
    FLASH_EN=  027FFF     |     FLASH_FP=  00505D     |     FLASH_FP=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_FP=  000001     |     FLASH_FP=  000002     |     FLASH_FP=  000003 
    FLASH_FP=  000004     |     FLASH_FP=  000005     |     FLASH_IA=  00505F 
    FLASH_IA=  000003     |     FLASH_IA=  000002     |     FLASH_IA=  000006 
    FLASH_IA=  000001     |     FLASH_IA=  000000     |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLSI    =  01F400     |   5 FOR        002459 R   |   5 FORGET     00244E R
    FRUN    =  000000     |     FSIZE   =  000001     |     FSLEEP  =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   5 GOSUB      002444 R
    GOS_RET =  000003     |   5 GOTO       00243B R   |   5 GPIO       002432 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   5 HEX        00242A R   |     HSECNT  =  004809 
    I2C_CCRH=  00521C     |     I2C_CCRH=  000080     |     I2C_CCRH=  0000C0 
    I2C_CCRH=  000080     |     I2C_CCRH=  000000     |     I2C_CCRH=  000001 
    I2C_CCRH=  000000     |     I2C_CCRL=  00521B     |     I2C_CCRL=  00001A 
    I2C_CCRL=  000002     |     I2C_CCRL=  00000D     |     I2C_CCRL=  000050 
    I2C_CCRL=  000090     |     I2C_CCRL=  0000A0     |     I2C_CR1 =  005210 
    I2C_CR1_=  000006     |     I2C_CR1_=  000007     |     I2C_CR1_=  000000 
    I2C_CR2 =  005211     |     I2C_CR2_=  000002     |     I2C_CR2_=  000003 
    I2C_CR2_=  000000     |     I2C_CR2_=  000001     |     I2C_CR2_=  000007 
    I2C_DR  =  005216     |     I2C_FREQ=  005212     |     I2C_ITR =  00521A 
    I2C_ITR_=  000002     |     I2C_ITR_=  000000     |     I2C_ITR_=  000001 
    I2C_OARH=  005214     |     I2C_OARH=  000001     |     I2C_OARH=  000002 
    I2C_OARH=  000006     |     I2C_OARH=  000007     |     I2C_OARL=  005213 
    I2C_OARL=  000000     |     I2C_OAR_=  000813     |     I2C_OAR_=  000009 
    I2C_PECR=  00521E     |     I2C_READ=  000001     |     I2C_SR1 =  005217 
    I2C_SR1_=  000003     |     I2C_SR1_=  000001     |     I2C_SR1_=  000002 
    I2C_SR1_=  000006     |     I2C_SR1_=  000000     |     I2C_SR1_=  000004 
    I2C_SR1_=  000007     |     I2C_SR2 =  005218     |     I2C_SR2_=  000002 
    I2C_SR2_=  000001     |     I2C_SR2_=  000000     |     I2C_SR2_=  000003 
    I2C_SR2_=  000005     |     I2C_SR3 =  005219     |     I2C_SR3_=  000001 
    I2C_SR3_=  000007     |     I2C_SR3_=  000004     |     I2C_SR3_=  000000 
    I2C_SR3_=  000002     |     I2C_TRIS=  00521D     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_WRIT=  000000 
  5 IDR        002422 R   |   5 IF         00241B R   |     IN      =  000007 
    INCR    =  000001     |     INP     =  000000     |   5 INPUT      002411 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_PU=  000001     |     INT_ADC2=  000016     |     INT_AUAR=  000012 
    INT_AWU =  000001     |     INT_CAN_=  000008     |     INT_CAN_=  000009 
    INT_CLK =  000002     |     INT_EXTI=  000003     |     INT_EXTI=  000004 
    INT_EXTI=  000005     |     INT_EXTI=  000006     |     INT_EXTI=  000007 
    INT_FLAS=  000018     |     INT_I2C =  000013     |     INT_SPI =  00000A 
    INT_TIM1=  00000C     |     INT_TIM1=  00000B     |     INT_TIM2=  00000E 
    INT_TIM2=  00000D     |     INT_TIM3=  000010     |     INT_TIM3=  00000F 
    INT_TIM4=  000017     |     INT_TLI =  000000     |     INT_UART=  000011 
    INT_UART=  000015     |     INT_UART=  000014     |     INT_VECT=  008060 
    INT_VECT=  00800C     |     INT_VECT=  008028     |     INT_VECT=  00802C 
    INT_VECT=  008010     |     INT_VECT=  008014     |     INT_VECT=  008018 
    INT_VECT=  00801C     |     INT_VECT=  008020     |     INT_VECT=  008024 
    INT_VECT=  008068     |     INT_VECT=  008054     |     INT_VECT=  008000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008030     |     INT_VECT=  008038     |     INT_VECT=  008034 
    INT_VECT=  008040     |     INT_VECT=  00803C     |     INT_VECT=  008048 
    INT_VECT=  008044     |     INT_VECT=  008064     |     INT_VECT=  008008 
    INT_VECT=  008004     |     INT_VECT=  008050     |     INT_VECT=  00804C 
    INT_VECT=  00805C     |     INT_VECT=  008058     |     INW     =  000003 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     002406 R
  5 IWDGREF    0023FA R   |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   5 KEY        0023F2 R   |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000005     |   5 LET        0023EA R
    LINENO  =  000005     |   5 LINK    =  00252D R   |   5 LIST       0023E1 R
    LL      =  000002     |     LLEN    =  000002     |     LL_HB   =  000001 
    LNO     =  000005     |     LN_PTR  =  000005     |   5 LOAD       0023D8 R
  5 LOG        0023D0 R   |   5 LSHIFT     0023C5 R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        0023B4 R
  5 NEXT       0023BC R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NL      =  00000A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   5 NOT        0023AC R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R
  5 ODR        0023A4 R   |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         00239D R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
    PAD_SIZE=  000028     |   5 PAUSE      002393 R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       002380 R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]

Symbol Table

    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       002377 R   |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      002389 R
  5 POKE       00236E R   |   5 POUT       002365 R   |     PREV    =  000001 
  5 PRINT      00235B R   |     PROD    =  000002     |     PSIZE   =  000001 
  5 PWR        002353 R   |   5 QKEY       00234A R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 REBOOT     00233F R
  5 REG_A      000989 R   |   5 REG_CC     00098D R   |   5 REG_EPC    00097C R
  5 REG_SP     000992 R   |   5 REG_X      000985 R   |   5 REG_Y      000981 R
    RELOP   =  000005     |   5 REMARK     002334 R   |     RETL1   =  000001 
  5 RETURN     002329 R   |   5 RND        002321 R   |     ROP     =  004800 
  5 RSHIFT     002316 R   |     RST_SR  =  0050B3     |   5 RUN        00230E R
    RXCHAR  =  000001     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   5 SAVE       002305 R
    SDIVD   =  000002     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       0022FC R   |     SIGN    =  000001 
  5 SIZE       0022F3 R   |     SKIP    =  000006     |   5 SLEEP      0022E9 R
    SPACE   =  000020     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  000080     |   5 STATES     00093F R   |   5 STEP       0022E0 R
  5 STOP       0022D7 R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      0022CD R
    TIM1_ARR=  005262     |     TIM1_ARR=  005263     |     TIM1_BKR=  00526D 
    TIM1_CCE=  00525C     |     TIM1_CCE=  00525D     |     TIM1_CCM=  005258 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000003     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000003     |     TIM1_CCM=  005259 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000003     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000003     |     TIM1_CCM=  00525A 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000003     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000003     |     TIM1_CCM=  00525B 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000003     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000003     |     TIM1_CCR=  005265 
    TIM1_CCR=  005266     |     TIM1_CCR=  005267     |     TIM1_CCR=  005268 
    TIM1_CCR=  005269     |     TIM1_CCR=  00526A     |     TIM1_CCR=  00526B 
    TIM1_CCR=  00526C     |     TIM1_CNT=  00525E     |     TIM1_CNT=  00525F 
    TIM1_CR1=  005250     |     TIM1_CR2=  005251     |     TIM1_CR2=  000000 
    TIM1_CR2=  000002     |     TIM1_CR2=  000004     |     TIM1_CR2=  000005 
    TIM1_CR2=  000006     |     TIM1_DTR=  00526E     |     TIM1_EGR=  005257 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_EGR=  000007     |     TIM1_EGR=  000001     |     TIM1_EGR=  000002 
    TIM1_EGR=  000003     |     TIM1_EGR=  000004     |     TIM1_EGR=  000005 
    TIM1_EGR=  000006     |     TIM1_EGR=  000000     |     TIM1_ETR=  005253 
    TIM1_ETR=  000006     |     TIM1_ETR=  000000     |     TIM1_ETR=  000001 
    TIM1_ETR=  000002     |     TIM1_ETR=  000003     |     TIM1_ETR=  000007 
    TIM1_ETR=  000004     |     TIM1_ETR=  000005     |     TIM1_IER=  005254 
    TIM1_IER=  000007     |     TIM1_IER=  000001     |     TIM1_IER=  000002 
    TIM1_IER=  000003     |     TIM1_IER=  000004     |     TIM1_IER=  000005 
    TIM1_IER=  000006     |     TIM1_IER=  000000     |     TIM1_OIS=  00526F 
    TIM1_PSC=  005260     |     TIM1_PSC=  005261     |     TIM1_RCR=  005264 
    TIM1_SMC=  005252     |     TIM1_SMC=  000007     |     TIM1_SMC=  000000 
    TIM1_SMC=  000001     |     TIM1_SMC=  000002     |     TIM1_SMC=  000004 
    TIM1_SMC=  000005     |     TIM1_SMC=  000006     |     TIM1_SR1=  005255 
    TIM1_SR1=  000007     |     TIM1_SR1=  000001     |     TIM1_SR1=  000002 
    TIM1_SR1=  000003     |     TIM1_SR1=  000004     |     TIM1_SR1=  000005 
    TIM1_SR1=  000006     |     TIM1_SR1=  000000     |     TIM1_SR2=  005256 
    TIM1_SR2=  000001     |     TIM1_SR2=  000002     |     TIM1_SR2=  000003 
    TIM1_SR2=  000004     |     TIM2_ARR=  00530D     |     TIM2_ARR=  00530E 
    TIM2_CCE=  005308     |     TIM2_CCE=  000000     |     TIM2_CCE=  000001 
    TIM2_CCE=  000004     |     TIM2_CCE=  000005     |     TIM2_CCE=  005309 
    TIM2_CCM=  005305     |     TIM2_CCM=  005306     |     TIM2_CCM=  005307 
    TIM2_CCM=  000000     |     TIM2_CCM=  000004     |     TIM2_CCM=  000003 
    TIM2_CCR=  00530F     |     TIM2_CCR=  005310     |     TIM2_CCR=  005311 
    TIM2_CCR=  005312     |     TIM2_CCR=  005313     |     TIM2_CCR=  005314 
    TIM2_CLK=  00F424     |     TIM2_CNT=  00530A     |     TIM2_CNT=  00530B 
    TIM2_CR1=  005300     |     TIM2_CR1=  000007     |     TIM2_CR1=  000000 
    TIM2_CR1=  000003     |     TIM2_CR1=  000001     |     TIM2_CR1=  000002 
    TIM2_EGR=  005304     |     TIM2_EGR=  000001     |     TIM2_EGR=  000002 
    TIM2_EGR=  000003     |     TIM2_EGR=  000006     |     TIM2_EGR=  000000 
    TIM2_IER=  005301     |     TIM2_PSC=  00530C     |     TIM2_SR1=  005302 
    TIM2_SR2=  005303     |     TIM3_ARR=  00532B     |     TIM3_ARR=  00532C 
    TIM3_CCE=  005327     |     TIM3_CCE=  000000     |     TIM3_CCE=  000001 
    TIM3_CCE=  000004     |     TIM3_CCE=  000005     |     TIM3_CCE=  000000 
    TIM3_CCE=  000001     |     TIM3_CCM=  005325     |     TIM3_CCM=  005326 
    TIM3_CCM=  000000     |     TIM3_CCM=  000004     |     TIM3_CCM=  000003 
    TIM3_CCR=  00532D     |     TIM3_CCR=  00532E     |     TIM3_CCR=  00532F 
    TIM3_CCR=  005330     |     TIM3_CNT=  005328     |     TIM3_CNT=  005329 
    TIM3_CR1=  005320     |     TIM3_CR1=  000007     |     TIM3_CR1=  000000 
    TIM3_CR1=  000003     |     TIM3_CR1=  000001     |     TIM3_CR1=  000002 
    TIM3_EGR=  005324     |     TIM3_IER=  005321     |     TIM3_PSC=  00532A 
    TIM3_SR1=  005322     |     TIM3_SR2=  005323     |     TIM4_ARR=  005346 
    TIM4_CNT=  005344     |     TIM4_CR1=  005340     |     TIM4_CR1=  000007 
    TIM4_CR1=  000000     |     TIM4_CR1=  000003     |     TIM4_CR1=  000001 
    TIM4_CR1=  000002     |     TIM4_EGR=  005343     |     TIM4_EGR=  000000 
    TIM4_IER=  005341     |     TIM4_IER=  000000     |     TIM4_PSC=  005345 
    TIM4_PSC=  000000     |     TIM4_PSC=  000007     |     TIM4_PSC=  000004 
    TIM4_PSC=  000001     |     TIM4_PSC=  000005     |     TIM4_PSC=  000002 
    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |   5 TIMEOUT    0022B7 R   |   5 TIMER      0022C3 R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_ARRAY=  000002 
    TK_CFUNC=  000008     |     TK_CHAR =  000003     |     TK_CMD  =  000006 
    TK_COLON=  000001     |     TK_COMMA=  00000D     |     TK_CONST=  000009 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]

Symbol Table

    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_IFUNC=  000007     |     TK_INTGR=  000004     |     TK_LE   =  000036 
    TK_LPARE=  00000B     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_PLUS =  000010     |     TK_QSTR =  00000A 
    TK_RPARE=  00000C     |     TK_SHARP=  00000E     |     TK_VAR  =  000005 
  5 TO         0022B0 R   |   5 TONE       0022A7 R   |   5 Timer4Up   000027 R
  5 TrapHand   000018 R   |     U8      =  000003     |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
    UART1_RX=  000004     |     UART1_SR=  005230     |     UART1_TX=  000005 
    UART3   =  000001     |     UART3_BA=  005240     |     UART3_BR=  005242 
    UART3_BR=  005243     |     UART3_CR=  005244     |     UART3_CR=  005245 
    UART3_CR=  005246     |     UART3_CR=  005247     |     UART3_CR=  004249 
    UART3_DR=  005241     |     UART3_PO=  00000F     |     UART3_RX=  000006 
    UART3_SR=  005240     |     UART3_TX=  000005     |     UART_BRR=  000002 
    UART_BRR=  000003     |     UART_CR1=  000004     |     UART_CR1=  000004 
    UART_CR1=  000002     |     UART_CR1=  000000     |     UART_CR1=  000001 
    UART_CR1=  000007     |     UART_CR1=  000006     |     UART_CR1=  000005 
    UART_CR1=  000003     |     UART_CR2=  000005     |     UART_CR2=  000004 
    UART_CR2=  000002     |     UART_CR2=  000005     |     UART_CR2=  000001 
    UART_CR2=  000000     |     UART_CR2=  000006     |     UART_CR2=  000003 
    UART_CR2=  000007     |     UART_CR3=  000006     |     UART_CR3=  000003 
    UART_CR3=  000001     |     UART_CR3=  000002     |     UART_CR3=  000000 
    UART_CR3=  000006     |     UART_CR3=  000004     |     UART_CR3=  000005 
    UART_CR4=  000007     |     UART_CR4=  000000     |     UART_CR4=  000001 
    UART_CR4=  000002     |     UART_CR4=  000003     |     UART_CR4=  000004 
    UART_CR4=  000006     |     UART_CR4=  000005     |     UART_CR5=  000008 
    UART_CR5=  000003     |     UART_CR5=  000001     |     UART_CR5=  000002 
    UART_CR5=  000004     |     UART_CR5=  000005     |     UART_CR6=  000009 
    UART_CR6=  000004     |     UART_CR6=  000007     |     UART_CR6=  000001 
    UART_CR6=  000002     |     UART_CR6=  000000     |     UART_CR6=  000005 
    UART_DR =  000001     |     UART_GTR=  000009     |     UART_PSC=  00000A 
    UART_SR =  000000     |     UART_SR_=  000001     |     UART_SR_=  000004 
    UART_SR_=  000002     |     UART_SR_=  000003     |     UART_SR_=  000000 
    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBC     =  004801     |   5 UBOUND     00229C R   |   5 UFLASH     002291 R
  5 USER_ABO   000070 R   |   5 USR        002289 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 UserButt   00003D R
    VSIZ    =  000002     |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       002280 R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      002276 R   |   5 WRITE      00226C R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XADR    =  000001     |     XMASK   =  000001 
  5 XOR        002264 R   |   5 XPEEK      00225A R   |     XSAVE   =  000003 
    YSAVE   =  000003     |   5 abs        001FE6 R   |   1 acc16      000008 R
  1 acc24      000007 R   |   1 acc8       000009 R   |   5 accept_c   000B33 R
  5 add        0010C6 R   |   5 analog_r   001A9A R   |   5 ansi_seq   000AF5 R
  5 arduino_   0020F1 R   |   5 arg_list   001205 R   |   1 array_si   00001F R
  5 ascii      001EAB R   |   5 at_tst     000E00 R   |   5 atoi24     000F13 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]

Symbol Table

  5 atoi_exi   000F81 R   |   5 autorun    001F38 R   |   5 autorun_   00063C R
  5 awu        001F97 R   |   5 awu02      001FA1 R   |   5 bad_port   001F06 R
  1 base       000006 R   |   1 basicptr   000004 R   |   5 bin_exit   000D04 R
  5 bit_and    001FFC R   |   5 bit_or     00201A R   |   5 bit_rese   0017A0 R
  5 bit_set    00178C R   |   5 bit_test   0017C9 R   |   5 bit_togg   0017B5 R
  5 bit_xor    002038 R   |   5 bkslsh_t   000DAB R   |   5 bksp       0001CE R
  5 break      001B41 R   |   5 break_po   001B6F R   |   5 bye        001F2F R
  5 char       001E97 R   |   5 check_fu   0003F1 R   |   5 clear_ba   000651 R
  5 clear_va   0004FB R   |   5 clock_in   00008B R   |   5 cmd_itf    000B57 R
  5 cmd_name   001171 R   |   5 cmp_name   001BE3 R   |   5 cold_sta   000560 R
  5 colon_ts   000DD4 R   |   5 comma_ts   000DDF R   |   5 compile    000400 R
  5 convert_   000C8C R   |   1 count      000003 R   |   5 cp_loop    0011B4 R
  5 create_g   000350 R   |   5 cstk_pro   001090 R   |   5 dash_tst   000DF5 R
  5 ddrop      00100C R   |   5 ddrop_n    001049 R   |   5 ddup       001015 R
  5 dec_base   0013B9 R   |   5 del_back   000B24 R   |   5 del_line   000318 R
  5 del_ln     000B15 R   |   5 delete     0001DE R   |   5 digital_   001AD0 R
  5 digital_   001B02 R   |   5 dir_loop   001DD6 R   |   5 director   001DCA R
  5 divide     00111C R   |   5 divu24_8   000A82 R   |   5 dotr       001099 R
  5 dotr_loo   0010AE R   |   5 dots       001066 R   |   5 dpick      001026 R
  5 dpop       000FE5 R   |   5 dpush      000FD8 R   |   5 drive_fr   001E53 R
  3 dstack     001740 R   |   3 dstack_e   001780 R   |   5 dstk_pro   00105C R
  1 dstkptr    000018 R   |   5 dswap      000FF2 R   |   5 enable_i   0021E2 R
  5 eql_tst    000E60 R   |   5 equal      001649 R   |   5 err_bad_   00072E R
  5 err_cmd_   0006EF R   |   5 err_div0   0006B1 R   |   5 err_dupl   00070A R
  5 err_math   000697 R   |   5 err_mem_   00067A R   |   5 err_msg    000662 R
  5 err_no_a   00073B R   |   5 err_no_l   0006C1 R   |   5 err_not_   00071C R
  5 err_run_   0006D8 R   |   5 err_synt   000688 R   |   5 escaped    000CA1 R
  5 expect     0011F8 R   |   5 expr_exi   00134A R   |   5 expressi   001309 R
  5 factor     001260 R   |   1 farptr     000012 R   |   5 fcpu       002090 R
  7 fdrive     010000 R   |   5 fetch      001035 R   |   5 fetchc     000C44 R
  1 ffree      000015 R   |   5 file_cou   001E4B R   |   5 final_te   000AEF R
  5 first_li   00143D R   |   1 flags      000021 R   |   5 for        00184E R
  5 forget     001D7F R   |   1 free_ram   000057 R   |   5 func_arg   001229 R
  5 func_not   0021D3 R   |   5 ge         00164B R   |   5 get_arra   001239 R
  5 get_tick   001FE0 R   |   5 get_toke   000D46 R   |   5 getc       0001BB R
  5 go_commo   00196F R   |   5 gosub      00194C R   |   5 goto       00193F R
  5 gpio       001ED8 R   |   5 gt         001647 R   |   5 gt_tst     000E6B R
  5 hex_base   0013B4 R   |   5 if         00183A R   |   1 in         000001 R
  1 in.saved   000002 R   |   1 in.w       000000 R   |   5 incr_far   001B98 R
  5 input_ex   001758 R   |   5 input_lo   0016F3 R   |   5 input_va   0016E7 R
  5 insert_l   000389 R   |   5 insert_l   0003EE R   |   5 interp     0007D6 R
  5 interp_l   000816 R   |   5 invalid    000B9C R   |   5 invalid_   000C1A R
  5 is_alpha   000509 R   |   5 is_digit   000EFE R   |   5 itoa       000A3B R
  5 itoa_loo   000A53 R   |   5 key        001EC6 R   |   5 kword_di   00252B R
  5 kword_en   002258 R   |   5 last_lin   001446 R   |   5 le         001650 R
  5 leading_   00222C R   |   5 ledoff     00088F R   |   5 ledon      00088A R
  5 ledtoggl   000894 R   |   5 left_arr   000AF5 R   |   5 left_par   00089D R
  5 let        0013EA R   |   5 let02      0013F4 R   |   5 lines_sk   00144B R
  5 list       001412 R   |   5 list_exi   001492 R   |   5 list_sta   00146E R
  5 load       001D44 R   |   5 load_aut   000618 R   |   5 load_fil   001D13 R
  5 log2       00221F R   |   5 logical_   0021C9 R   |   5 loop_bac   001918 R
  1 loop_dep   00001E R   |   5 loop_don   00192D R   |   5 lshift     002056 R
  5 lt         00164E R   |   5 lt_tst     000EA4 R   |   5 mem_peek   000BB9 R
  5 modulo     001160 R   |   5 move       0002B2 R   |   5 move_dow   0002D0 R
  5 move_exi   0002F1 R   |   5 move_loo   0002D5 R   |   5 move_up    0002C2 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]

Symbol Table

  5 mul_char   001638 R   |   5 multiply   0010D4 R   |   5 mulu24_8   000F85 R
  5 nbr_tst    000D81 R   |   5 ne         001653 R   |   5 neg_acc2   000AAA R
  5 new        001B8D R   |   5 next       0018D0 R   |   5 next_tok   000846 R
  5 no_match   0011C6 R   |   5 none       000D46 R   |   5 number     000C4A GR
  5 other      000EDC R   |   3 pad        001718 R   |   5 parse_bi   000CE4 R
  5 parse_in   000CA9 R   |   5 parse_ke   000D0C R   |   5 parse_qu   000C51 R
  5 pause      001F84 R   |   5 pause02    001F8E R   |   5 peek       001807 R
  5 peek_byt   000BE4 R   |   5 pin_mode   00209C R   |   5 plus_tst   000E34 R
  5 poke       0017F4 R   |   5 power_ad   001A51 R   |   5 prcnt_ts   000E55 R
  5 print      001656 R   |   5 print_ex   0016BB R   |   5 print_fa   000C29 R
  5 print_in   0009DF R   |   5 print_re   0008EC R   |   5 print_st   000BAC R
  5 prt_basi   0014E5 R   |   5 prt_cmd_   001495 R   |   5 prt_loop   00165A R
  5 prt_peek   000262 R   |   5 prt_quot   0014A9 R   |   5 prt_reg1   0008CD R
  5 prt_reg8   0008A8 R   |   5 prt_regs   0001F8 R   |   5 prti24     000997 R
  1 ptr16      000013 R   |   1 ptr8       000014 R   |   5 putc       0001B2 R
  5 puts       0001C4 R   |   5 pwr2       00223C R   |   5 qkey       001ECE R
  5 qmark_ts   000E0B R   |   5 random     002111 R   |   5 readln     000ACD R
  5 readln_l   000AD3 R   |   5 readln_q   000B48 R   |   5 refresh_   00221A R
  5 regs_sta   00023B R   |   5 rel_exit   0013A1 R   |   5 relation   00134D R
  5 relop_st   00163B R   |   5 rem        00175B R   |   5 repl       000B65 R
  5 repl_exi   000B8D R   |   5 reprint    000AF5 R   |   5 reset_co   001658 R
  5 rest_con   0016D7 R   |   5 return     001991 R   |   5 right_ar   000AF5 R
  5 rparnt_t   000DC9 R   |   5 rshift     002073 R   |   5 rt_msg     00076F R
  5 run        0019B1 R   |   5 run_it     0019D9 R   |   5 save       001C4F R
  5 save_con   0016C7 R   |   5 search_d   0011A3 R   |   5 search_e   0011F4 R
  5 search_f   001C04 R   |   5 search_l   0002F4 R   |   5 search_l   0002FC R
  5 search_n   0011A7 R   |   1 seedx      00000E R   |   1 seedy      000010 R
  5 seek_fdr   001BA6 R   |   5 select_p   0020E1 R   |   5 set_time   0021B5 R
  5 sharp_ts   000DEA R   |   5 show       0013A4 R   |   5 single_c   001634 R
  5 size       0013BE R   |   5 skip       000FBF R   |   5 slash_ts   000E4A R
  5 sleep      001F79 R   |   5 software   00051A R   |   5 spaces     0001EC R
  3 stack_fu   001780 R   |   3 stack_un   001800 R   |   5 star_tst   000E3F R
  5 step       0018A8 R   |   5 stop       0019F4 R   |   5 store      00103F R
  5 store_lo   0018BA R   |   5 str_matc   0011D5 R   |   5 str_tst    000D70 R
  5 strcmp     000293 R   |   5 strcpy     0002A4 R   |   5 strlen     000286 R
  5 substrac   0010CE R   |   5 syntax_e   00077F R   |   1 tab_widt   000022 R
  5 tb_error   000781 R   |   5 term       0012BC R   |   5 term01     0012C5 R
  5 term_exi   001306 R   |   5 test_p     000BA4 R   |   3 tib        0016C8 R
  5 tick_tst   000E22 R   |   1 ticks      00000A R   |   5 timeout    0021C6 R
  1 timer      00000C R   |   5 timer2_i   0000A1 R   |   5 timer4_i   0000AE R
  5 to         001878 R   |   5 to_upper   000F07 GR  |   5 token_ch   000EEB R
  5 token_ex   000EFB R   |   5 tone       001A03 R   |   1 txtbgn     00001A R
  1 txtend     00001C R   |   5 uart1_in   000177 R   |   5 uart1_se   000187 R
  5 ubound     0013C8 R   |   5 uflash     001F0B R   |   5 unget_to   000FD2 R
  5 unlock_e   0000C3 R   |   5 unlock_f   0000D1 R   |   5 user_spa   002580 R
  5 usr        001F11 R   |   1 vars       000023 R   |   5 wait       001761 R
  5 warm_ini   0005FB R   |   5 warm_sta   0007D3 R   |   5 words      00217B R
  5 write      001E60 R   |   5 write_bl   000154 R   |   5 write_by   0000DF R
  5 write_ee   00011B R   |   5 write_ex   00014F R   |   5 write_fl   000105 R
  5 xpeek      00181A R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     57   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   258E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      4   flags    8

