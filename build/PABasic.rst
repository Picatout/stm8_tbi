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
                                     26     .module TBI_STM8
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
                                        
                                            ; software reset 
                                            .macro _swreset
                                     34     .list 
                                     35 
      000001                         36 _dbg 
                           000001     1     DEBUG=1
                                     37 
                                     38 	
                                     39 ;--------------------------------------
                                     40     .area DATA 
                                     41 ;--------------------------------------	
                                     42 
                           000050    43 	TIB_SIZE=80
                           000028    44     PAD_SIZE=40
                           000020    45 	DSTACK_SIZE=32 
                           000080    46 	STACK_SIZE=128
                           0017FF    47 	STACK_EMPTY=RAM_SIZE-1  
                           000000    48 	FRUN=0 ; flags run code in variable flags
                           000001    49 	FTRAP=1 ; inside trap handler 
                           000002    50 	FLOOP=2 ; FOR loop in preparation 
                           000003    51 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    52 	FBREAK=4 ; break point flag 
                           000005    53 	FCOMP=5  ; compiling flags 
                                     54 
                           004000    55 	AUTORUN_NAME=0x4000 ; address in EEPROM where auto run file name is saved 
                                     56 
                           000006    57     FIRST_DATA_ITEM=6 ; first DATA item offset on line.
                                     58 
      000002                         59 in.w:  .blkb 1 ; parser position in text line
      000003                         60 in:    .blkb 1 ; low byte of in.w
      000004                         61 in.saved: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000005                         62 count: .blkb 1 ; current BASIC line length and tib text length  
      000007                         63 basicptr:  .blkb 2  ; point to current BASIC line address.
      000009                         64 data_ptr:  .blkw 1  ; point to DATA address
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      00000A                         65 data_ofs:  .blkb 1  ; index to next data item 
      00000B                         66 data_len:  .blkb 1  ; length of data line 
      00000C                         67 base:  .blkb 1 ; nemeric base used to print integer 
      00000D                         68 acc24: .blkb 1 ; 24 bit accumulator
      00000E                         69 acc16: .blkb 1 ; 16 bit accumulator, middle byte of acc24
      00000F                         70 acc8:  .blkb 1 ;  8 bit accumulator, least byte of acc24 
      000011                         71 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000013                         72 timer: .blkw 1 ;  milliseconds count down timer 
      000015                         73 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000017                         74 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000018                         75 farptr: .blkb 1 ; 24 bits pointer used by file system
      000019                         76 ptr16:  .blkb 1 ; 16 bits pointer ,  middle byte of farptr
      00001A                         77 ptr8:   .blkb 1 ; 8 bits pointer, least byte of farptr 
      00001D                         78 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001F                         79 dstkptr: .blkw 1  ; data stack pointer 
      000021                         80 txtbgn: .blkw 1 ; tokenized BASIC text beginning address 
      000023                         81 txtend: .blkw 1 ; tokenized BASIC text end address 
      000024                         82 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000026                         83 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000027                         84 flags: .blkb 1 ; various boolean flags
      000028                         85 tab_width: .blkb 1 ; print colon width (4)
      000029                         86 rx_char: .blkb 1 ; last received character 
      00005D                         87 vars: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     88 ; keep as last variable 
      0016E8                         89 free_ram: ; from here RAM free for BASIC text 
                                     90 
                                     91 ;-----------------------------------
                                     92     .area SSEG (ABS)
                                     93 ;-----------------------------------
                                     94 ;;;; working buffers and stacks at end of RAM. 	
      0016E8                         95     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE-DSTACK_SIZE 
      001738                         96 tib: .ds TIB_SIZE             ; transaction input buffer
      001760                         97 pad: .ds PAD_SIZE             ; working buffer
      001780                         98 dstack: .ds DSTACK_SIZE 	  ; data stack used by FOR...NEXT, and func/proc arguments  
      001780                         99 dstack_empty: ; dstack underflow ; data stack bottom 
      001800                        100 stack_full: .ds STACK_SIZE   ; control stack 
      001800                        101 stack_unf: ; stack underflow ; control_stack bottom 
                                    102 
                                    103 ;--------------------------------------
                                    104     .area HOME 
                                    105 ;--------------------------------------
      008000 82 00 85 FA            106     int cold_start			; RESET vector 
                           000001   107 .if DEBUG
      008004 82 00 80 AF            108 	int TrapHandler 		;TRAP  software interrupt
                           000000   109 .else
                                    110 	int NonHandledInterrupt ;TRAP  software interrupt
                                    111 .endif
      008008 82 00 80 89            112 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 8A            113 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 89            114 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 89            115 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 89            116 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 89            117 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 89            118 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 D4            119 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008028 82 00 80 89            120 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 89            121 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 89            122 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 89            123 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 89            124 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 89            125 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 89            126 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 89            127 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 89            128 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 89            129 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 98            130 	int Uart1RxHandler		;int18 UART1 RX full ; user communication channel.
      008054 82 00 80 89            131 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 89            132 	int NonHandledInterrupt ;int20 UART1 TX completed
      00805C 82 00 80 89            133 	int NonHandledInterrupt ;int21 UART1 RX full
      008060 82 00 80 89            134 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 BE            135 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 89            136 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 89            137 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 89            138 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 89            139 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 89            140 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 89            141 	int NonHandledInterrupt ;int29  not used
                                    142 
                                    143 ;---------------------------------------
                                    144     .area CODE
                                    145 ;---------------------------------------
                           000001   146 .if DEBUG
      008080 53 54 4D 38 5F 54 42   147 .asciz "STM8_TBI" ; I like to put module name here.
             49 00
                                    148 .endif 
                                    149 
                                    150 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    151 ; non handled interrupt 
                                    152 ; reset MCU
                                    153 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008089                        154 NonHandledInterrupt:
      008089 71                     155     .byte 0x71  ; invalid opcode reinitialize MCU
                                    156 
                                    157 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    158 ; auto wakeup from halt
                                    159 ; at iret, program continue 
                                    160 ; after hatl instruction
                                    161 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00808A                        162 AWUHandler:
      00808A 72 19 50 F0      [ 1]  163 	bres AWU_CSR,#AWU_CSR_AWUEN
      00808E 55 00 3F 50 F1   [ 1]  164 	mov AWU_APR,0x3F
      008093 72 5F 50 F2      [ 1]  165 	clr AWU_TBR 
      008097 80               [11]  166 	iret
                                    167 
                                    168 ;--------------------------
                                    169 ; UART1 receive character
                                    170 ; CTRL-C (ASCII 3)
                                    171 ; cancel program execution
                                    172 ; and fall back to command line
                                    173 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      008098                        174 Uart1RxHandler:
      008098 72 0B 52 30 FB   [ 2]  175 	btjf UART1_SR,#UART_SR_RXNE,.
      00809D C6 52 31         [ 1]  176 	ld a,UART1_DR 
      0080A0 A1 03            [ 1]  177 	cp a,#CTRL_C 
      0080A2 26 07            [ 1]  178 	jrne 1$
      0080A4 72 5F 00 28      [ 1]  179 	clr rx_char 
      0080A8 CC 80 E7         [ 2]  180 	jp user_interrupted
      0080AB                        181 1$:
      0080AB C7 00 28         [ 1]  182 	ld rx_char,a 	
      0080AE 80               [11]  183 	iret 
                                    184 
                                    185 ;------------------------------------
                                    186 ; software interrupt handler  
                                    187 ;------------------------------------
                           000001   188 .if DEBUG 
      0080AF                        189 TrapHandler:
      0080AF 72 12 00 26      [ 1]  190 	bset flags,#FTRAP 
      0080B3 CD 89 A3         [ 4]  191 	call print_registers
      0080B6 CD 8C 10         [ 4]  192 	call cmd_itf
      0080B9 72 13 00 26      [ 1]  193 	bres flags,#FTRAP 	
      0080BD 80               [11]  194 	iret
                                    195 .endif 
                                    196 
                                    197 ;------------------------------
                                    198 ; TIMER 4 is used to maintain 
                                    199 ; a milliseconds 'ticks' counter
                                    200 ; and decrement 'timer' varaiable
                                    201 ;--------------------------------
      0080BE                        202 Timer4UpdateHandler:
      0080BE 72 5F 53 42      [ 1]  203 	clr TIM4_SR 
      0080C2 CE 00 0F         [ 2]  204 	ldw x,ticks
      0080C5 5C               [ 2]  205 	incw x
      0080C6 CF 00 0F         [ 2]  206 	ldw ticks,x 
      0080C9 CE 00 11         [ 2]  207 	ldw x,timer
      0080CC 5D               [ 2]  208 	tnzw x 
      0080CD 27 04            [ 1]  209 	jreq 1$
      0080CF 5A               [ 2]  210 	decw x 
      0080D0 CF 00 11         [ 2]  211 	ldw timer,x 
      0080D3                        212 1$:	
      0080D3 80               [11]  213 	iret 
                                    214 
                                    215 
                                    216 ;------------------------------------
                                    217 ; Triggered by pressing USER UserButton 
                                    218 ; on NUCLEO card.
                                    219 ; This is used to abort a progam lock 
                                    220 ; in infinite loop. 
                                    221 ;------------------------------------
      0080D4                        222 UserButtonHandler:
                                    223 ; wait button release
      0080D4 5F               [ 1]  224 	clrw x
      0080D5 5A               [ 2]  225 1$: decw x 
      0080D6 26 FD            [ 1]  226 	jrne 1$
      0080D8 72 09 50 15 F8   [ 2]  227 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    228 ; if MCU suspended by SLEEP resume program
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080DD 72 07 00 26 05   [ 2]  229     btjf flags,#FSLEEP,2$
      0080E2 72 17 00 26      [ 1]  230 	bres flags,#FSLEEP 
      0080E6 80               [11]  231 	iret
      0080E7                        232 2$:	
      0080E7                        233 user_interrupted:
      0080E7 72 00 00 26 02   [ 2]  234     btjt flags,#FRUN,4$
      0080EC 20 13            [ 2]  235 	jra UBTN_Handler_exit 
      0080EE                        236 4$:	; program interrupted by user 
      0080EE 72 11 00 26      [ 1]  237 	bres flags,#FRUN 
      0080F2 AE 81 09         [ 2]  238 	ldw x,#USER_ABORT
      0080F5 CD 82 5E         [ 4]  239 	call puts 
      0080F8 CE 00 05         [ 2]  240 	ldw x,basicptr 
      0080FB C6 00 02         [ 1]  241 	ld a,in 
      0080FE CD 95 73         [ 4]  242 	call prt_basic_line
      008101                        243 UBTN_Handler_exit:
      008101 AE 17 FF         [ 2]  244     ldw x,#STACK_EMPTY 
      008104 94               [ 1]  245     ldw sp,x
      008105 9A               [ 1]  246 	rim 
      008106 CC 88 7B         [ 2]  247 	jp warm_start
                                    248 
      008109 0A 50 72 6F 67 72 61   249 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    250 
                                    251 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    252 ;    peripherals initialization
                                    253 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    254 
                                    255 ;----------------------------------------
                                    256 ; inialize MCU clock 
                                    257 ; input:
                                    258 ;   A 		source  HSI | 1 HSE 
                                    259 ;   XL      CLK_CKDIVR , clock divisor 
                                    260 ; output:
                                    261 ;   none 
                                    262 ;----------------------------------------
      008124                        263 clock_init:	
      008124 C1 50 C3         [ 1]  264 	cp a,CLK_CMSR 
      008127 27 0C            [ 1]  265 	jreq 2$ ; no switching required 
                                    266 ; select clock source 
      008129 72 12 50 C5      [ 1]  267 	bset CLK_SWCR,#CLK_SWCR_SWEN
      00812D C7 50 C4         [ 1]  268 	ld CLK_SWR,a
      008130 C1 50 C3         [ 1]  269 1$:	cp a,CLK_CMSR
      008133 26 FB            [ 1]  270 	jrne 1$
      008135                        271 2$: 	
                                    272 ; HSI and cpu clock divisor 
      008135 9F               [ 1]  273 	ld a,xl 
      008136 C7 50 C6         [ 1]  274 	ld CLK_CKDIVR,a  
      008139 81               [ 4]  275 	ret
                                    276 
                                    277 ;----------------------------------
                                    278 ; TIMER2 used as audio tone output 
                                    279 ; on port D:5.
                                    280 ; channel 1 configured as PWM mode 1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    281 ;-----------------------------------  
                           00F424   282 TIM2_CLK_FREQ=62500
      00813A                        283 timer2_init:
      00813A 72 1A 50 C7      [ 1]  284 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      00813E 35 60 53 05      [ 1]  285  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008142 35 08 53 0C      [ 1]  286 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008146 81               [ 4]  287 	ret 
                                    288 
                                    289 ;---------------------------------
                                    290 ; TIM4 is configured to generate an 
                                    291 ; interrupt every millisecond 
                                    292 ;----------------------------------
      008147                        293 timer4_init:
      008147 72 18 50 C7      [ 1]  294 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00814B 35 07 53 45      [ 1]  295 	mov TIM4_PSCR,#7 ; prescale 128  
      00814F 35 7D 53 46      [ 1]  296 	mov TIM4_ARR,#125 ; set for 1msec.
      008153 35 05 53 40      [ 1]  297 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008157 72 10 53 41      [ 1]  298 	bset TIM4_IER,#TIM4_IER_UIE
      00815B 81               [ 4]  299 	ret
                                    300 
                                    301 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    302 ;  routines to write to FLASH, EEPROM 
                                    303 ;  and OPTION 
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    305 
                                    306 ;----------------------------------
                                    307 ; unlock EEPROM/OPT for writing/erasing
                                    308 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    309 ; input:
                                    310 ;  none
                                    311 ; output:
                                    312 ;  none 
                                    313 ;----------------------------------
      00815C                        314 unlock_eeprom:
      00815C 35 AE 50 64      [ 1]  315 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008160 35 56 50 64      [ 1]  316     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008164 72 07 50 5F FB   [ 2]  317 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008169 81               [ 4]  318 	ret
                                    319 
                                    320 ;----------------------------------
                                    321 ; unlock FLASH for writing/erasing
                                    322 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    323 ; input:
                                    324 ;  none
                                    325 ; output:
                                    326 ;  none
                                    327 ;----------------------------------
      00816A                        328 unlock_flash:
      00816A 35 56 50 62      [ 1]  329 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00816E 35 AE 50 62      [ 1]  330 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008172 72 03 50 5F FB   [ 2]  331 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008177 81               [ 4]  332 	ret
                                    333 
                           000000   334 USE_BLOCK_ERASE=0 
                           000000   335 .if USE_BLOCK_ERASE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    336 ; this code is copied to RAM 
                                    337 
                                    338 ;----------------------------
                                    339 ; erase block code must be 
                                    340 ; executed from RAM
                                    341 ;-----------------------------
                                    342 erase_start:
                                    343 	clr a 
                                    344     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    345     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    346 	ldf [farptr],a
                                    347     inc farptr+2 
                                    348     ldf [farptr],a
                                    349     inc farptr+2 
                                    350     ldf [farptr],a
                                    351     inc farptr+2 
                                    352     ldf [farptr],a
                                    353 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    354 	ret
                                    355 erase_end:
                                    356 
                                    357 ; copy erase_start in RAM 
                                    358 move_code_in_ram:
                                    359 	ldw x,#erase_end 
                                    360 	subw x,#erase_start
                                    361 	ldw acc16,x 
                                    362 	ldw x,#pad 
                                    363 	ldw y,#erase_start 
                                    364 	call move 
                                    365 	ret 
                                    366 
                                    367 ;-----------------------------------
                                    368 ; erase flash or EEPROM block 
                                    369 ; a block is 128 bytes 
                                    370 ; input:
                                    371 ;   farptr  address block begin
                                    372 ; output:
                                    373 ;   none
                                    374 ;--------------------------------------
                                    375 erase_block:
                                    376 	ldw x,farptr+1 
                                    377 	pushw x 
                                    378 	call move_code_in_ram 
                                    379 	popw x 
                                    380 	ldw farptr+1,x 
                                    381 	tnz farptr
                                    382 	jrne erase_flash 
                                    383 	ldw x,#FLASH_BASE 
                                    384 	cpw x,farptr+1 
                                    385 	jrpl erase_flash 
                                    386 ; erase eeprom block
                                    387 	call unlock_eeprom 
                                    388 	sim 
                                    389 	call pad   
                                    390 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    391 	rim 
                                    392 	ret 
                                    393 ; erase flash block:
                                    394 erase_flash:
                                    395 	call unlock_flash 
                                    396 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    397 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    398 	clr a 
                                    399 	sim 
                                    400 	call pad 
                                    401     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    402 	rim 
                                    403 	ret 
                                    404 .endif ;;;; USE_BLOCK_ERASE ;;;;
                                    405 
                                    406 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    407 ; write a byte to FLASH or EEPROM/OPTION  
                                    408 ; input:
                                    409 ;    a  		byte to write
                                    410 ;    farptr  	address
                                    411 ;    x          farptr[x]
                                    412 ; output:
                                    413 ;    none
                                    414 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    415 	; variables locales
                           000001   416 	BTW = 1   ; byte to write offset on stack
                           000002   417 	OPT = 2   ; OPTION flag offset on stack
                           000002   418 	VSIZE = 2
      008178                        419 write_byte:
      008178 90 89            [ 2]  420 	pushw y
      0000FA                        421 	_vars VSIZE
      00817A 52 02            [ 2]    1     sub sp,#VSIZE 
      00817C 6B 01            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      00817E 0F 02            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
                                    424 ; put addr[15:0] in Y, for bounds check.
      008180 90 CE 00 18      [ 2]  425 	ldw y,farptr+1   ; Y=addr15:0
                                    426 ; check addr[23:16], if <> 0 then it is extened flash memory
      008184 72 5D 00 17      [ 1]  427 	tnz farptr 
      008188 26 14            [ 1]  428 	jrne write_flash
      00818A 90 A3 A8 00      [ 2]  429     cpw y,#user_space
      00818E 24 0E            [ 1]  430     jruge write_flash
      008190 90 A3 40 00      [ 2]  431 	cpw y,#EEPROM_BASE  
      008194 25 52            [ 1]  432     jrult write_exit
      008196 90 A3 48 7F      [ 2]  433 	cpw y,#OPTION_END 
      00819A 22 4C            [ 1]  434 	jrugt write_exit
      00819C 20 16            [ 2]  435 	jra write_eeprom 
                                    436 ; write program memory
      00819E                        437 write_flash:
      00819E CD 81 6A         [ 4]  438 	call unlock_flash 
      0081A1 9B               [ 1]  439 1$:	sim 
      0081A2 7B 01            [ 1]  440 	ld a,(BTW,sp)
      0081A4 92 A7 00 17      [ 4]  441 	ldf ([farptr],x),a ; farptr[x]=A
      0081A8 72 05 50 5F FB   [ 2]  442 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081AD 9A               [ 1]  443     rim 
      0081AE 72 13 50 5F      [ 1]  444     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0081B2 20 34            [ 2]  445     jra write_exit
                                    446 ; write eeprom and option
      0081B4                        447 write_eeprom:
      0081B4 CD 81 5C         [ 4]  448 	call unlock_eeprom
                                    449 	; check for data eeprom or option eeprom
      0081B7 90 A3 48 00      [ 2]  450 	cpw y,#OPTION_BASE
      0081BB 2B 08            [ 1]  451 	jrmi 1$
      0081BD 90 A3 48 80      [ 2]  452 	cpw y,#OPTION_END+1
      0081C1 2A 02            [ 1]  453 	jrpl 1$
      0081C3 03 02            [ 1]  454 	cpl (OPT,sp)
      0081C5                        455 1$: 
      0081C5 0D 02            [ 1]  456     tnz (OPT,sp)
      0081C7 27 08            [ 1]  457     jreq 2$
                                    458 	; pour modifier une option il faut modifier ces 2 bits
      0081C9 72 1E 50 5B      [ 1]  459     bset FLASH_CR2,#FLASH_CR2_OPT
      0081CD 72 1F 50 5C      [ 1]  460     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081D1                        461 2$: 
      0081D1 7B 01            [ 1]  462     ld a,(BTW,sp)
      0081D3 92 A7 00 17      [ 4]  463     ldf ([farptr],x),a
      0081D7 0D 02            [ 1]  464     tnz (OPT,sp)
      0081D9 27 08            [ 1]  465     jreq 3$
      0081DB 5C               [ 2]  466     incw x
      0081DC 7B 01            [ 1]  467     ld a,(BTW,sp)
      0081DE 43               [ 1]  468     cpl a
      0081DF 92 A7 00 17      [ 4]  469     ldf ([farptr],x),a
      0081E3 72 05 50 5F FB   [ 2]  470 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081E8                        471 write_exit:
      000168                        472 	_drop VSIZE 
      0081E8 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081EA 90 85            [ 2]  473 	popw y
      0081EC 81               [ 4]  474     ret
                                    475 
                                    476 ;--------------------------------------------
                                    477 ; write a data block to eeprom or flash 
                                    478 ; input:
                                    479 ;   Y        source address   
                                    480 ;   X        array index  destination  farptr[x]
                                    481 ;   BSIZE    block size bytes 
                                    482 ;   farptr   write address , byte* 
                                    483 ; output:
                                    484 ;	X 		after last byte written 
                                    485 ;   Y 		after last byte read 
                                    486 ;  farptr   point after block
                                    487 ;---------------------------------------------
      0081ED                        488 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      00016D                        489 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    490 	; local var 
                           000001   491 	XSAVE=1 
                           000002   492 	VSIZE=2 
      00016D                        493 write_block:
      00016D                        494 	_vars VSIZE
      0081ED 52 02            [ 2]    1     sub sp,#VSIZE 
      0081EF 1F 01            [ 2]  495 	ldw (XSAVE,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081F1 1E 05            [ 2]  496 	ldw x,(BSIZE,sp) 
      0081F3 27 13            [ 1]  497 	jreq 9$
      0081F5 1E 01            [ 2]  498 1$:	ldw x,(XSAVE,sp)
      0081F7 90 F6            [ 1]  499 	ld a,(y)
      0081F9 CD 81 78         [ 4]  500 	call write_byte 
      0081FC 5C               [ 2]  501 	incw x 
      0081FD 90 5C            [ 2]  502 	incw y 
      0081FF 1F 01            [ 2]  503 	ldw (XSAVE,sp),x
      008201 1E 05            [ 2]  504 	ldw x,(BSIZE,sp)
      008203 5A               [ 2]  505 	decw x
      008204 1F 05            [ 2]  506 	ldw (BSIZE,sp),x 
      008206 26 ED            [ 1]  507 	jrne 1$
      008208                        508 9$:
      008208 1E 01            [ 2]  509 	ldw x,(XSAVE,sp)
      00820A CD 9C 16         [ 4]  510 	call incr_farptr
      00018D                        511 	_drop VSIZE
      00820D 5B 02            [ 2]    1     addw sp,#VSIZE 
      00820F 81               [ 4]  512 	ret 
                                    513 
                                    514 
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    516 ;;   UART1 subroutines
                                    517 ;;   used for user interface 
                                    518 ;;   communication channel.
                                    519 ;;   settings: 
                                    520 ;;		115200 8N1 no flow control
                                    521 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    522 
                                    523 ;---------------------------------------------
                                    524 ; initialize UART1, 115200 8N1
                                    525 ; input:
                                    526 ;	none
                                    527 ; output:
                                    528 ;   none
                                    529 ;---------------------------------------------
      008210                        530 uart1_init:
      008210 72 1A 50 02      [ 1]  531     bset PA_DDR,#UART1_TX_PIN
      008214 72 1A 50 03      [ 1]  532     bset PA_CR1,#UART1_TX_PIN 
      008218 72 1A 50 04      [ 1]  533     bset PA_CR2,#UART1_TX_PIN 
                                    534 ; enable UART1 clock
      00821C 72 14 50 C7      [ 1]  535 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008220                        536 uart1_set_baud: 
                                    537 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    538 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008220 A6 E1            [ 1]  539 	ld a,#CLK_SWR_HSI
      008222 C1 50 C3         [ 1]  540 	cp a,CLK_CMSR 
      008225 27 0A            [ 1]  541 	jreq 2$ 
      008227                        542 1$: ; 8 Mhz 	
      008227 35 05 52 33      [ 1]  543 	mov UART1_BRR2,#0x05 ; must be loaded first
      00822B 35 04 52 32      [ 1]  544 	mov UART1_BRR1,#0x4
      00822F 20 08            [ 2]  545 	jra 3$
      008231                        546 2$: ; 16 Mhz 	
      008231 35 0B 52 33      [ 1]  547 	mov UART1_BRR2,#0x0b ; must be loaded first
      008235 35 08 52 32      [ 1]  548 	mov UART1_BRR1,#0x08
      008239                        549 3$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008239 72 5F 52 31      [ 1]  550     clr UART1_DR
      00823D 35 2C 52 35      [ 1]  551 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008241 72 10 52 35      [ 1]  552 	bset UART1_CR2,#UART_CR2_SBK
      008245 72 0D 52 30 FB   [ 2]  553     btjf UART1_SR,#UART_SR_TC,.
      00824A 81               [ 4]  554     ret
                                    555 
                                    556 ;---------------------------------
                                    557 ; send character to UART1 
                                    558 ; input:
                                    559 ;   A 
                                    560 ; output:
                                    561 ;   none 
                                    562 ;--------------------------------	
      00824B                        563 putc:
      00824B 72 0F 52 30 FB   [ 2]  564 	btjf UART1_SR,#UART_SR_TXE,.
      008250 C7 52 31         [ 1]  565 	ld UART1_DR,a 
      008253 81               [ 4]  566 	ret 
                                    567 
                                    568 ;---------------------------------
                                    569 ; wait character from UART1 
                                    570 ; input:
                                    571 ;   none
                                    572 ; output:
                                    573 ;   A 			char  
                                    574 ;--------------------------------	
      008254                        575 getc:
      008254 C6 00 28         [ 1]  576 	ld a,rx_char 
      008257 27 FB            [ 1]  577 	jreq getc 
      008259 72 5F 00 28      [ 1]  578 	clr rx_char 
      00825D 81               [ 4]  579 	ret 
                                    580 
                                    581 ;-----------------------------
                                    582 ; send an ASCIZ string to UART1 
                                    583 ; input: 
                                    584 ;   x 		char * 
                                    585 ; output:
                                    586 ;   none 
                                    587 ;-------------------------------
      00825E                        588 puts:
      00825E F6               [ 1]  589     ld a,(x)
      00825F 27 06            [ 1]  590 	jreq 1$
      008261 CD 82 4B         [ 4]  591 	call putc 
      008264 5C               [ 2]  592 	incw x 
      008265 20 F7            [ 2]  593 	jra puts 
      008267 81               [ 4]  594 1$:	ret 
                                    595 
                                    596 
                                    597 ;---------------------------
                                    598 ; delete character at left 
                                    599 ; of cursor on terminal 
                                    600 ; input:
                                    601 ;   none 
                                    602 ; output:
                                    603 ;	none 
                                    604 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008268                        605 bksp:
      008268 A6 08            [ 1]  606 	ld a,#BSP 
      00826A CD 82 4B         [ 4]  607 	call putc 
      00826D A6 20            [ 1]  608 	ld a,#SPACE 
      00826F CD 82 4B         [ 4]  609 	call putc 
      008272 A6 08            [ 1]  610 	ld a,#BSP 
      008274 CD 82 4B         [ 4]  611 	call putc 
      008277 81               [ 4]  612 	ret 
                                    613 ;---------------------------
                                    614 ; delete n character left of cursor 
                                    615 ; at terminal.
                                    616 ; input: 
                                    617 ;   A   number of characters to delete.
                                    618 ; output:
                                    619 ;    none 
                                    620 ;--------------------------	
      008278                        621 delete:
      008278 88               [ 1]  622 	push a 
      008279 0D 01            [ 1]  623 0$:	tnz (1,sp)
      00827B 27 07            [ 1]  624 	jreq 1$
      00827D CD 82 68         [ 4]  625 	call bksp 
      008280 0A 01            [ 1]  626 	dec (1,sp)
      008282 20 F5            [ 2]  627 	jra 0$
      008284 84               [ 1]  628 1$:	pop a 
      008285 81               [ 4]  629 	ret
                                    630 
                                    631 ;--------------------------
                                    632 ; print n spaces on terminal
                                    633 ; input:
                                    634 ;  X 		number of spaces 
                                    635 ; output:
                                    636 ;	none 
                                    637 ;---------------------------
      008286                        638 spaces:
      008286 A6 20            [ 1]  639 	ld a,#SPACE 
      008288 5D               [ 2]  640 1$:	tnzw x
      008289 27 06            [ 1]  641 	jreq 9$
      00828B CD 82 4B         [ 4]  642 	call putc 
      00828E 5A               [ 2]  643 	decw x
      00828F 20 F7            [ 2]  644 	jra 1$
      008291                        645 9$: 
      008291 81               [ 4]  646 	ret 
                                    647 
                           000001   648 .if DEBUG 
                                    649 ;---------------------------------
                                    650 ;; print actual registers states 
                                    651 ;; as pushed on stack 
                                    652 ;; {Y,X,CC,A}
                                    653 ;---------------------------------
      008292                        654 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      000212                        655 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      000212                        656 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      000212                        657 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      000212                        658 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      000212                        659 prt_regs:
      008292 AE 82 D5         [ 2]  660 	ldw x,#regs_state 
      008295 CD 82 5E         [ 4]  661 	call puts
                                    662 ; register PC
      008298 16 01            [ 2]  663 	ldw y,(1,sp)
      00829A AE 8A 33         [ 2]  664 	ldw x,#REG_EPC 
      00829D CD 89 84         [ 4]  665 	call prt_reg16 
                                    666 ; register CC 
      0082A0 7B 08            [ 1]  667 	ld a,(R_CC,sp)
      0082A2 AE 8A 44         [ 2]  668 	ldw x,#REG_CC 
      0082A5 CD 89 5F         [ 4]  669 	call prt_reg8 
                                    670 ; register A 
      0082A8 7B 07            [ 1]  671 	ld a,(R_A,sp)
      0082AA AE 8A 40         [ 2]  672 	ldw x,#REG_A 
      0082AD CD 89 5F         [ 4]  673 	call prt_reg8 
                                    674 ; register X 
      0082B0 16 05            [ 2]  675 	ldw y,(R_X,sp)
      0082B2 AE 8A 3C         [ 2]  676 	ldw x,#REG_X 
      0082B5 CD 89 84         [ 4]  677 	call prt_reg16 
                                    678 ; register Y 
      0082B8 16 03            [ 2]  679 	ldw y,(R_Y,sp)
      0082BA AE 8A 38         [ 2]  680 	ldw x,#REG_Y 
      0082BD CD 89 84         [ 4]  681 	call prt_reg16 
                                    682 ; register SP 
      0082C0 90 96            [ 1]  683 	ldw y,sp
      0082C2 72 A9 00 08      [ 2]  684 	addw y,#6+ARG_OFS  
      0082C6 AE 8A 49         [ 2]  685 	ldw x,#REG_SP
      0082C9 CD 89 84         [ 4]  686 	call prt_reg16
      0082CC A6 0D            [ 1]  687 	ld a,#CR 
      0082CE CD 82 4B         [ 4]  688 	call putc
      0082D1 CD 82 4B         [ 4]  689 	call putc   
      0082D4 81               [ 4]  690 	ret 
                                    691 
      0082D5 0A 72 65 67 69 73 74   692 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    693 
                                    694 
                                    695 ;--------------------
                                    696 ; print content at address in hex.
                                    697 ; input:
                                    698 ;   X 	address to peek 
                                    699 ; output:
                                    700 ;	none 
                                    701 ;--------------------	
      0082FC                        702 prt_peek:
      0082FC 89               [ 2]  703 	pushw x 
      0082FD CF 00 0D         [ 2]  704 	ldw acc16,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008300 72 5F 00 0C      [ 1]  705 	clr acc24 
      008304 5F               [ 1]  706 	clrw x 
      008305 A6 10            [ 1]  707 	ld a,#16 
      008307 CD 8A 4E         [ 4]  708 	call prti24 
      00830A A6 3A            [ 1]  709 	ld a,#': 
      00830C CD 82 4B         [ 4]  710 	call putc 
      00830F A6 20            [ 1]  711 	ld a,#SPACE 
      008311 CD 82 4B         [ 4]  712 	call putc 
      008314 85               [ 2]  713 	popw x 
      008315 F6               [ 1]  714 	ld a,(x)
      008316 C7 00 0E         [ 1]  715 	ld acc8,a 
      008319 5F               [ 1]  716 	clrw x 
      00831A A6 10            [ 1]  717 	ld a,#16 
      00831C CD 8A 4E         [ 4]  718 	call prti24
      00831F 81               [ 4]  719 	ret 
                                    720 .endif ; DEBUG  
                                    721 
                                    722 ;-------------------------------------
                                    723 ; retrun string length
                                    724 ; input:
                                    725 ;   X         .asciz  pointer 
                                    726 ; output:
                                    727 ;   X         length 
                                    728 ;-------------------------------------
      008320                        729 strlen:
      008320 90 93            [ 1]  730 	ldw y,x 
      008322 5F               [ 1]  731 	clrw x 
      008323 90 7D            [ 1]  732 1$:	tnz (y) 
      008325 27 05            [ 1]  733 	jreq 9$ 
      008327 5C               [ 2]  734 	incw x
      008328 90 5C            [ 2]  735 	incw y 
      00832A 20 F7            [ 2]  736 	jra 1$ 
      00832C 81               [ 4]  737 9$: ret 
                                    738 
                                    739 ;------------------------------------
                                    740 ; compare 2 strings
                                    741 ; input:
                                    742 ;   X 		char* first string 
                                    743 ;   Y       char* second string 
                                    744 ; output:
                                    745 ;   A 		0|1 
                                    746 ;-------------------------------------
      00832D                        747 strcmp:
      00832D F6               [ 1]  748 	ld a,(x)
      00832E 27 0B            [ 1]  749 	jreq 5$ 
      008330 90 F1            [ 1]  750 	cp a,(y) 
      008332 26 05            [ 1]  751 	jrne 4$ 
      008334 5C               [ 2]  752 	incw x 
      008335 90 5C            [ 2]  753 	incw y 
      008337 20 F4            [ 2]  754 	jra strcmp 
      008339                        755 4$: ; not same  
      008339 4F               [ 1]  756 	clr a 
      00833A 81               [ 4]  757 	ret 
      00833B                        758 5$: ; same 
      00833B A6 01            [ 1]  759 	ld a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      00833D 81               [ 4]  760 	ret 
                                    761 
                                    762 
                                    763 ;---------------------------------------
                                    764 ;  copy src to dest 
                                    765 ; input:
                                    766 ;   X 		dest 
                                    767 ;   Y 		src 
                                    768 ; output: 
                                    769 ;   X 		dest 
                                    770 ;----------------------------------
      00833E                        771 strcpy:
      00833E 89               [ 2]  772 	pushw x 
      00833F 90 F6            [ 1]  773 1$: ld a,(y)
      008341 27 06            [ 1]  774 	jreq 9$ 
      008343 F7               [ 1]  775 	ld (x),a 
      008344 5C               [ 2]  776 	incw x 
      008345 90 5C            [ 2]  777 	incw y 
      008347 20 F6            [ 2]  778 	jra 1$ 
      008349 7F               [ 1]  779 9$:	clr (x)
      00834A 85               [ 2]  780 	popw x 
      00834B 81               [ 4]  781 	ret 
                                    782 
                                    783 ;---------------------------------------
                                    784 ; move memory block 
                                    785 ; input:
                                    786 ;   X 		destination 
                                    787 ;   Y 	    source 
                                    788 ;   acc16	bytes count 
                                    789 ; output:
                                    790 ;   none 
                                    791 ;--------------------------------------
                           000001   792 	INCR=1 ; increament high byte 
                           000002   793 	LB=2 ; increament low byte 
                           000002   794 	VSIZE=2
      00834C                        795 move:
      0002CC                        796 	_vars VSIZE 
      00834C 52 02            [ 2]    1     sub sp,#VSIZE 
      00834E 0F 01            [ 1]  797 	clr (INCR,sp)
      008350 0F 02            [ 1]  798 	clr (LB,sp)
      008352 90 89            [ 2]  799 	pushw y 
      008354 13 01            [ 2]  800 	cpw x,(1,sp) ; compare DEST to SRC 
      008356 90 85            [ 2]  801 	popw y 
      008358 27 31            [ 1]  802 	jreq move_exit ; x==y 
      00835A 2B 0E            [ 1]  803 	jrmi move_down
      00835C                        804 move_up: ; start from top address with incr=-1
      00835C 72 BB 00 0D      [ 2]  805 	addw x,acc16
      008360 72 B9 00 0D      [ 2]  806 	addw y,acc16
      008364 03 01            [ 1]  807 	cpl (INCR,sp)
      008366 03 02            [ 1]  808 	cpl (LB,sp)   ; increment = -1 
      008368 20 05            [ 2]  809 	jra move_loop  
      00836A                        810 move_down: ; start from bottom address with incr=1 
      00836A 5A               [ 2]  811     decw x 
      00836B 90 5A            [ 2]  812 	decw y
      00836D 0C 02            [ 1]  813 	inc (LB,sp) ; incr=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00836F                        814 move_loop:	
      00836F C6 00 0D         [ 1]  815     ld a, acc16 
      008372 CA 00 0E         [ 1]  816 	or a, acc8
      008375 27 14            [ 1]  817 	jreq move_exit 
      008377 72 FB 01         [ 2]  818 	addw x,(INCR,sp)
      00837A 72 F9 01         [ 2]  819 	addw y,(INCR,sp) 
      00837D 90 F6            [ 1]  820 	ld a,(y)
      00837F F7               [ 1]  821 	ld (x),a 
      008380 89               [ 2]  822 	pushw x 
      008381 CE 00 0D         [ 2]  823 	ldw x,acc16 
      008384 5A               [ 2]  824 	decw x 
      008385 CF 00 0D         [ 2]  825 	ldw acc16,x 
      008388 85               [ 2]  826 	popw x 
      008389 20 E4            [ 2]  827 	jra move_loop
      00838B                        828 move_exit:
      00030B                        829 	_drop VSIZE
      00838B 5B 02            [ 2]    1     addw sp,#VSIZE 
      00838D 81               [ 4]  830 	ret 	
                                    831 
                                    832 ;-------------------------------------
                                    833 ; search text area for a line with 
                                    834 ; same number as line#  
                                    835 ; input:
                                    836 ;	X 			line# 
                                    837 ; output:
                                    838 ;   X 			addr of line | 0 
                                    839 ;   Y           line#|insert address if not found  
                                    840 ;-------------------------------------
                           000001   841 	LL=1 ; line length 
                           000002   842 	LB=2 ; line length low byte 
                           000002   843 	VSIZE=2 
      00838E                        844 search_lineno:
      00030E                        845 	_vars VSIZE
      00838E 52 02            [ 2]    1     sub sp,#VSIZE 
      008390 0F 01            [ 1]  846 	clr (LL,sp)
      008392 90 CE 00 1F      [ 2]  847 	ldw y,txtbgn
      008396                        848 search_ln_loop:
      008396 90 C3 00 21      [ 2]  849 	cpw y,txtend 
      00839A 2A 10            [ 1]  850 	jrpl 8$
      00839C 90 F3            [ 1]  851 	cpw x,(y)
      00839E 27 0E            [ 1]  852 	jreq 9$
      0083A0 2B 0A            [ 1]  853 	jrmi 8$ 
      0083A2 90 E6 02         [ 1]  854 	ld a,(2,y)
      0083A5 6B 02            [ 1]  855 	ld (LB,sp),a 
      0083A7 72 F9 01         [ 2]  856 	addw y,(LL,sp)
      0083AA 20 EA            [ 2]  857 	jra search_ln_loop 
      0083AC                        858 8$: 
      0083AC 5F               [ 1]  859 	clrw x 	
      0083AD 51               [ 1]  860 	exgw x,y 
      00032E                        861 9$: _drop VSIZE
      0083AE 5B 02            [ 2]    1     addw sp,#VSIZE 
      0083B0 51               [ 1]  862 	exgw x,y   
      0083B1 81               [ 4]  863 	ret 
                                    864 
                                    865 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    866 ; delete line at addr
                                    867 ; move new line to insert with end of text 
                                    868 ; otherwise it would be overwritten.
                                    869 ; input:
                                    870 ;   X 		addr of line i.e DEST for move 
                                    871 ;-------------------------------------
                           000001   872 	LLEN=1
                           000003   873 	SRC=3
                           000004   874 	VSIZE=4
      0083B2                        875 del_line: 
      000332                        876 	_vars VSIZE 
      0083B2 52 04            [ 2]    1     sub sp,#VSIZE 
      0083B4 E6 02            [ 1]  877 	ld a,(2,x) ; line length
      0083B6 6B 02            [ 1]  878 	ld (LLEN+1,sp),a 
      0083B8 0F 01            [ 1]  879 	clr (LLEN,sp)
      0083BA 90 93            [ 1]  880 	ldw y,x  
      0083BC 72 F9 01         [ 2]  881 	addw y,(LLEN,sp) ;SRC  
      0083BF 17 03            [ 2]  882 	ldw (SRC,sp),y  ;save source 
      0083C1 90 CE 00 21      [ 2]  883 	ldw y,txtend 
      0083C5 90 E6 02         [ 1]  884 	ld a,(2,y)
      0083C8 90 5F            [ 1]  885 	clrw y 
      0083CA 90 97            [ 1]  886 	ld yl,a  
      0083CC 72 B9 00 21      [ 2]  887 	addw y,txtend
      0083D0 72 F2 03         [ 2]  888 	subw y,(SRC,sp) ; y=count 
      0083D3 90 CF 00 0D      [ 2]  889 	ldw acc16,y 
      0083D7 16 03            [ 2]  890 	ldw y,(SRC,sp)    ; source
      0083D9 CD 83 4C         [ 4]  891 	call move
      0083DC 90 CE 00 21      [ 2]  892 	ldw y,txtend 
      0083E0 72 F2 01         [ 2]  893 	subw y,(LLEN,sp)
      0083E3 90 CF 00 21      [ 2]  894 	ldw txtend,y  
      000367                        895 	_drop VSIZE     
      0083E7 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083E9 81               [ 4]  896 	ret 
                                    897 
                                    898 ;---------------------------------------------
                                    899 ; create a gap in text area 
                                    900 ; move new line to insert in gap with end of text
                                    901 ; otherwise it would be overwritten.
                                    902 ; input:
                                    903 ;    X 			addr gap start 
                                    904 ;    Y 			gap length 
                                    905 ; output:
                                    906 ;    X 			addr gap start 
                                    907 ;--------------------------------------------
                           000001   908 	DEST=1
                           000003   909 	SRC=3
                           000005   910 	LEN=5
                           000006   911 	VSIZE=6 
      0083EA                        912 create_gap:
      00036A                        913 	_vars VSIZE
      0083EA 52 06            [ 2]    1     sub sp,#VSIZE 
      0083EC 1F 03            [ 2]  914 	ldw (SRC,sp),x 
      0083EE 17 05            [ 2]  915 	ldw (LEN,sp),y 
      0083F0 90 CF 00 0D      [ 2]  916 	ldw acc16,y 
      0083F4 90 93            [ 1]  917 	ldw y,x ; SRC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0083F6 72 BB 00 0D      [ 2]  918 	addw x,acc16  
      0083FA 1F 01            [ 2]  919 	ldw (DEST,sp),x 
                                    920 ;compute size to move 	
      0083FC CE 00 21         [ 2]  921 	ldw x,txtend 
      0083FF E6 02            [ 1]  922 	ld a,(2,x) ; pending line length 
      008401 C7 00 0E         [ 1]  923 	ld acc8,a 
      008404 72 5F 00 0D      [ 1]  924 	clr acc16 
      008408 72 BB 00 0D      [ 2]  925 	addw x,acc16 
      00840C 72 F0 03         [ 2]  926 	subw x,(SRC,sp)
      00840F CF 00 0D         [ 2]  927 	ldw acc16,x ; size to move
      008412 1E 01            [ 2]  928 	ldw x,(DEST,sp) 
      008414 CD 83 4C         [ 4]  929 	call move
      008417 CE 00 21         [ 2]  930 	ldw x,txtend
      00841A 72 FB 05         [ 2]  931 	addw x,(LEN,sp)
      00841D CF 00 21         [ 2]  932 	ldw txtend,x
      0003A0                        933 9$:	_drop VSIZE 
      008420 5B 06            [ 2]    1     addw sp,#VSIZE 
      008422 81               [ 4]  934 	ret 
                                    935 
                                    936 
                                    937 ;--------------------------------------------
                                    938 ; insert line in tib into text area 
                                    939 ; first search for already existing 
                                    940 ; replace existing 
                                    941 ; if strlen(tib)==0 delete existing line
                                    942 ; input:
                                    943 ;   ptr16 				pointer to tokenized line  
                                    944 ; output:
                                    945 ;   none
                                    946 ;---------------------------------------------
                           000001   947 	DEST=1  ; text area insertion address 
                           000003   948 	SRC=3   ; str to insert address 
                           000005   949 	LINENO=5 ; line number 
                           000007   950 	LLEN=7 ; line length 
                           000008   951 	VSIZE=8  
      008423                        952 insert_line:
      0003A3                        953 	_vars VSIZE 
      008423 52 08            [ 2]    1     sub sp,#VSIZE 
      008425 CE 00 18         [ 2]  954 	ldw x,ptr16  
      008428 C3 00 1F         [ 2]  955 	cpw x,txtbgn 
      00842B 26 0D            [ 1]  956 	jrne 0$
                                    957 ;first text line 
      00842D AE 00 02         [ 2]  958 	ldw x,#2 
      008430 72 D6 00 18      [ 4]  959 	ld a,([ptr16],x)
      008434 5F               [ 1]  960 	clrw x 
      008435 97               [ 1]  961 	ld xl,a
      008436 1F 07            [ 2]  962 	ldw (LLEN,sp),x  
      008438 20 45            [ 2]  963 	jra 5$
      00843A 72 CE 00 18      [ 5]  964 0$:	ldw x,[ptr16]
                                    965 ; new line number
      00843E 1F 05            [ 2]  966 	ldw (LINENO,sp),x 
      008440 AE 00 02         [ 2]  967 	ldw x,#2 
      008443 72 D6 00 18      [ 4]  968 	ld a,([ptr16],x)
      008447 97               [ 1]  969 	ld xl,a
                                    970 ; new line length
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008448 1F 07            [ 2]  971 	ldw (LLEN,sp),x
                                    972 ; check if that line number already exit 	
      00844A 1E 05            [ 2]  973 	ldw x,(LINENO,sp)
      00844C CD 83 8E         [ 4]  974 	call search_lineno 
      00844F 5D               [ 2]  975 	tnzw x 
      008450 26 04            [ 1]  976 	jrne 2$
                                    977 ; line doesn't exit
                                    978 ; it will be inserted at this point.  	
      008452 17 01            [ 2]  979 	ldw (DEST,sp),y 
      008454 20 05            [ 2]  980 	jra 3$
                                    981 ; line exit delete it.
                                    982 ; it will be replaced by new one 	
      008456 1F 01            [ 2]  983 2$: ldw (DEST,sp),x 
      008458 CD 83 B2         [ 4]  984 	call del_line
      00845B                        985 3$: 
                                    986 ; insert new line or leave if LLEN==3
                                    987 ; LLEN==3 means empty line 
      00845B A6 03            [ 1]  988 	ld a,#3
      00845D 11 08            [ 1]  989 	cp a,(LLEN+1,sp)
      00845F 27 27            [ 1]  990 	jreq insert_ln_exit ; empty line exit.
                                    991 ; if insertion point at txtend 
                                    992 ; no move required 
      008461 1E 01            [ 2]  993 	ldw x,(DEST,sp)
      008463 C3 00 21         [ 2]  994 	cpw x,txtend 
      008466 2A 17            [ 1]  995 	jrpl 5$ 
                                    996 ; must create a gap
                                    997 ; at insertion point  
      008468 1E 01            [ 2]  998 	ldw x,(DEST,sp)
      00846A 16 07            [ 2]  999 	ldw y,(LLEN,sp)
      00846C CD 83 EA         [ 4] 1000 	call create_gap 
                                   1001 ; move new line in gap 
      00846F 1E 07            [ 2] 1002 	ldw x,(LLEN,sp)
      008471 CF 00 0D         [ 2] 1003 	ldw acc16,x 
      008474 90 CE 00 21      [ 2] 1004 	ldw y,txtend ;SRC 
      008478 1E 01            [ 2] 1005 	ldw x,(DEST,sp) ; dest address 
      00847A CD 83 4C         [ 4] 1006 	call move 
      00847D 20 09            [ 2] 1007 	jra insert_ln_exit  
      00847F                       1008 5$: ; no move required 
      00847F 1E 07            [ 2] 1009 	ldw x,(LLEN,sp) 
      008481 72 BB 00 21      [ 2] 1010 	addw x,txtend 
      008485 CF 00 21         [ 2] 1011 	ldw txtend,x 
      008488                       1012 insert_ln_exit:	
      000408                       1013 	_drop VSIZE
      008488 5B 08            [ 2]    1     addw sp,#VSIZE 
      00848A 81               [ 4] 1014 	ret
                                   1015 
                                   1016 
                                   1017 ;-----------------------------
                                   1018 ; check if text buffer full
                                   1019 ; input:
                                   1020 ;   ptr16     addr start tokenize line 
                                   1021 ;   X         buffer index 
                                   1022 ; output:
                                   1023 ;   none 
                                   1024 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      00848B                       1025 check_full:
      00848B 72 BB 00 18      [ 2] 1026 	addw x,ptr16 
      00848F A3 16 E8         [ 2] 1027 	cpw x,#tib 
      008492 25 05            [ 1] 1028 	jrult 1$
      008494 A6 01            [ 1] 1029 	ld a,#ERR_MEM_FULL
      008496 CC 88 3A         [ 2] 1030 	jp tb_error 
      008499 81               [ 4] 1031 1$: ret 
                                   1032 
                                   1033 
                                   1034 ;-----------------------------------
                                   1035 ; create token list form text line 
                                   1036 ; save this list in text area
                                   1037 ;  compiled line format: 
                                   1038 ;    line_no  2 bytes {0...32767}
                                   1039 ;    count    1 byte 
                                   1040 ;    tokens   variable 
                                   1041 ;   
                                   1042 ; input:
                                   1043 ;   none
                                   1044 ; output:
                                   1045 ;   basicptr     token list buffer address 
                                   1046 ;   in.w  		 cleared, index in buffer 
                                   1047 ;-----------------------------------
                           000001  1048 	XSAVE=1
                           000003  1049 	BUFIDX=3
                           000004  1050 	VSIZE=4
      00849A                       1051 compile:
      00041A                       1052 	_vars VSIZE 
      00849A 52 04            [ 2]    1     sub sp,#VSIZE 
      00849C 72 1A 00 26      [ 1] 1053 	bset flags,#FCOMP 
      0084A0 CE 00 21         [ 2] 1054 	ldw x,txtend
      0084A3 CF 00 18         [ 2] 1055 	ldw ptr16,x ; code buffer start address 
      0084A6 5F               [ 1] 1056 	clrw x 
      0084A7 AE 00 03         [ 2] 1057 	ldw x,#3
      0084AA 1F 03            [ 2] 1058 	ldw (BUFIDX,sp),X  
      0084AC CD 84 8B         [ 4] 1059 	call check_full
      0084AF 5F               [ 1] 1060 	clrw x 
      0084B0 72 CF 00 18      [ 5] 1061 	ldw [ptr16],x ; initialize line# to zero 
      0084B4 CD 8D FF         [ 4] 1062 	call get_token
      0084B7 1F 01            [ 2] 1063 	ldw (XSAVE,sp),x 
      0084B9 A1 04            [ 1] 1064 	cp a,#TK_INTGR 
      0084BB 26 13            [ 1] 1065 	jrne 3$
      0084BD A3 00 00         [ 2] 1066 	cpw x,#0 
      0084C0 2C 05            [ 1] 1067 	jrsgt 1$
      0084C2 A6 0A            [ 1] 1068 	ld a,#ERR_BAD_VALUE 
      0084C4 CC 88 3A         [ 2] 1069 	jp tb_error ; line number must be in range {1..32767}
      0084C7 72 CF 00 18      [ 5] 1070 1$:	ldw [ptr16],x; line number
      0084CB CD 8D FF         [ 4] 1071 2$:	call get_token
      0084CE 1F 01            [ 2] 1072 	ldw (XSAVE,sp),x 
      0084D0 A1 00            [ 1] 1073 3$:	cp a,#TK_NONE 
      0084D2 26 03            [ 1] 1074 	jrne 30$
      0084D4 CC 85 65         [ 2] 1075 	jp 9$ ; end of line. 
      0084D7                       1076 30$: 	 
      0084D7 1E 03            [ 2] 1077 	ldw x,(BUFIDX,sp)
      0084D9 CD 84 8B         [ 4] 1078 	call check_full 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      0084DC 16 03            [ 2] 1079 	ldw y,(BUFIDX,sp) 
      0084DE 91 D7 18         [ 4] 1080 	ld ([ptr16],y),a ; token attribute 
      0084E1 90 5C            [ 2] 1081 	incw y
      0084E3 17 03            [ 2] 1082 	ldw (BUFIDX,sp),y
      0084E5 A1 01            [ 1] 1083 	cp a,#TK_COLON 
      0084E7 26 02            [ 1] 1084 	jrne 31$
      0084E9 20 E0            [ 2] 1085 	jra 2$ ; loop for next token 
      0084EB                       1086 31$: ; check for token type 
                                   1087 ; character token have 1 byte attribute, i.e. ASCII character 
      0084EB A1 03            [ 1] 1088 	cp a,#TK_CHAR
      0084ED 26 0C            [ 1] 1089 	jrne 32$ 
      0084EF 1E 01            [ 2] 1090 	ldw x,(XSAVE,sp)
      0084F1 9F               [ 1] 1091 	ld a,xl 
      0084F2 91 D7 18         [ 4] 1092 	ld ([ptr16],y),a
      0084F5 90 5C            [ 2] 1093 	incw y 
      0084F7 17 03            [ 2] 1094 	ldw (BUFIDX,sp),y 
      0084F9 20 D0            [ 2] 1095 	jra 2$ 
      0084FB                       1096 32$:
      0084FB A1 02            [ 1] 1097 	cp a,#TK_ARRAY 
                                   1098 ; this token have not attribute. 
      0084FD 27 CC            [ 1] 1099 	jreq 2$ 
      0084FF A1 0A            [ 1] 1100 	cp a,#TK_QSTR 
      008501 26 25            [ 1] 1101 	jrne 4$
                                   1102 ; copy string as C string.	
      008503 AE 17 38         [ 2] 1103 	ldw x,#pad 
      008506 CD 83 20         [ 4] 1104 	call strlen
      008509 5C               [ 2] 1105 	incw x  
      00850A CD 84 8B         [ 4] 1106 	call check_full 
      00850D 90 AE 17 38      [ 2] 1107 	ldw y,#pad 
      008511 CE 00 18         [ 2] 1108 	ldw x,ptr16
      008514 72 FB 03         [ 2] 1109 	addw x,(BUFIDX,sp)	
      008517 CD 83 3E         [ 4] 1110 	call strcpy 
      00851A AE 17 38         [ 2] 1111 	ldw x,#pad 
      00851D CD 83 20         [ 4] 1112 	call strlen 
      008520 5C               [ 2] 1113 	incw x
      008521 72 FB 03         [ 2] 1114 	addw x,(BUFIDX,sp) 
      008524 1F 03            [ 2] 1115 	ldw (BUFIDX,sp),x
      008526 20 A3            [ 2] 1116 	jra 2$  
      008528 A1 04            [ 1] 1117 4$: cp a,#TK_INTGR
      00852A 25 9F            [ 1] 1118 	jrult 2$ ; 
      00852C A1 08            [ 1] 1119 	cp a,#TK_CFUNC 
      00852E 22 9B            [ 1] 1120 	Jrugt 2$ ; those tokens have no attributes 
      008530 1E 01            [ 2] 1121 	ldw x,(XSAVE,sp) 
      008532 16 03            [ 2] 1122 	ldw y,(BUFIDX,sp)
      008534 91 DF 18         [ 5] 1123 	ldw ([ptr16],y),x ; the attribute is an address or integer. 
      008537 A3 97 C9         [ 2] 1124 	cpw x,#rem ; is this a comment? 
      00853A 27 09            [ 1] 1125 	jreq 5$	
      00853C 72 A9 00 02      [ 2] 1126 	addw y,#2 
      008540 17 03            [ 2] 1127 	ldw (BUFIDX,sp),y 
      008542 CC 84 CB         [ 2] 1128 	jp 2$
      008545                       1129 5$:
                                   1130 ; copy commment in code buffer and
                                   1131 ; skip to end of line.  
      008545 72 A9 00 02      [ 2] 1132 	addw y,#2 ; skip exec address 
      008549 17 03            [ 2] 1133 	ldw (BUFIDX,sp),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00854B CE 00 18         [ 2] 1134 	ldw x,ptr16 
      00854E 72 FB 03         [ 2] 1135 	addw x,(BUFIDX,sp)
      008551 90 CE 00 01      [ 2] 1136 	ldw y,in.w 
      008555 72 A9 16 E8      [ 2] 1137 	addw y,#tib 
      008559 CD 83 3E         [ 4] 1138 	call strcpy 	
      00855C CD 83 20         [ 4] 1139 	call strlen 
      00855F 5C               [ 2] 1140 	incw x ; skip string 0. 
      008560 72 FB 03         [ 2] 1141 	addw x,(BUFIDX,sp)
      008563 1F 03            [ 2] 1142 	ldw (BUFIDX,sp),x 
      008565                       1143 9$: 
      008565 AE 00 02         [ 2] 1144 	ldw x,#2
      008568 16 03            [ 2] 1145 	ldw y,(BUFIDX,sp)
      00856A 90 9F            [ 1] 1146 	ld a,yl 
      00856C 72 D7 00 18      [ 4] 1147 	ld ([ptr16],x),a ; code byte count   	
      008570 72 CE 00 18      [ 5] 1148 	ldw x,[ptr16]
      008574 27 09            [ 1] 1149 	jreq 10$
      008576 CD 84 23         [ 4] 1150 	call insert_line
      008579 72 5F 00 04      [ 1] 1151 	clr  count 
      00857D 20 0F            [ 2] 1152 	jra  11$ 
      00857F                       1153 10$: ; line# is zero 
      00857F CE 00 18         [ 2] 1154 	ldw x,ptr16 
      008582 CF 00 05         [ 2] 1155 	ldw basicptr,x 
      008585 E6 02            [ 1] 1156 	ld a,(2,x)
      008587 C7 00 04         [ 1] 1157 	ld count,a 
      00858A 35 03 00 02      [ 1] 1158 	mov in,#3 
      00858E                       1159 11$:
      00050E                       1160 	_drop VSIZE 
      00858E 5B 04            [ 2]    1     addw sp,#VSIZE 
      008590 72 1B 00 26      [ 1] 1161 	bres flags,#FCOMP 
      008594 81               [ 4] 1162 	ret 
                                   1163 
                                   1164 
                                   1165 ;------------------------------------
                                   1166 ;  set all variables to zero 
                                   1167 ; input:
                                   1168 ;   none 
                                   1169 ; output:
                                   1170 ;	none
                                   1171 ;------------------------------------
      008595                       1172 clear_vars:
      008595 AE 00 29         [ 2] 1173 	ldw x,#vars 
      008598 90 AE 00 34      [ 2] 1174 	ldw y,#2*26 
      00859C 7F               [ 1] 1175 1$:	clr (x)
      00859D 5C               [ 2] 1176 	incw x 
      00859E 90 5A            [ 2] 1177 	decw y 
      0085A0 26 FA            [ 1] 1178 	jrne 1$
      0085A2 81               [ 4] 1179 	ret 
                                   1180 
                                   1181 ;-------------------------------------
                                   1182 ; check if A is a letter 
                                   1183 ; input:
                                   1184 ;   A 			character to test 
                                   1185 ; output:
                                   1186 ;   C flag      1 true, 0 false 
                                   1187 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0085A3                       1188 is_alpha:
      0085A3 A1 41            [ 1] 1189 	cp a,#'A 
      0085A5 8C               [ 1] 1190 	ccf
      0085A6 24 0B            [ 1] 1191 	jrnc 9$ 
      0085A8 A1 5B            [ 1] 1192 	cp a,#'Z+1 
      0085AA 25 07            [ 1] 1193 	jrc 9$ 
      0085AC A1 61            [ 1] 1194 	cp a,#'a 
      0085AE 8C               [ 1] 1195 	ccf 
      0085AF 24 02            [ 1] 1196 	jrnc 9$
      0085B1 A1 7B            [ 1] 1197 	cp a,#'z+1   
      0085B3 81               [ 4] 1198 9$: ret 	
                                   1199 
                                   1200 ;-------------------------------------
                                   1201 ;  program initialization entry point 
                                   1202 ;-------------------------------------
                           000001  1203 	MAJOR=1
                           000000  1204 	MINOR=0
      0085B4 0A 0A 54 69 6E 79 20  1205 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0085FA                       1206 cold_start:
                                   1207 ;set stack 
      0085FA AE 17 FF         [ 2] 1208 	ldw x,#STACK_EMPTY
      0085FD 94               [ 1] 1209 	ldw sp,x   
                                   1210 ; clear all ram 
      0085FE 7F               [ 1] 1211 0$: clr (x)
      0085FF 5A               [ 2] 1212 	decw x 
      008600 26 FC            [ 1] 1213 	jrne 0$
                                   1214 ; activate pull up on all inputs 
      008602 A6 FF            [ 1] 1215 	ld a,#255 
      008604 C7 50 03         [ 1] 1216 	ld PA_CR1,a 
      008607 C7 50 08         [ 1] 1217 	ld PB_CR1,a 
      00860A C7 50 0D         [ 1] 1218 	ld PC_CR1,a 
      00860D C7 50 12         [ 1] 1219 	ld PD_CR1,a 
      008610 C7 50 17         [ 1] 1220 	ld PE_CR1,a 
      008613 C7 50 1C         [ 1] 1221 	ld PF_CR1,a 
      008616 C7 50 21         [ 1] 1222 	ld PG_CR1,a 
      008619 C7 50 2B         [ 1] 1223 	ld PI_CR1,a
                                   1224 ; set LD2 pin as output and turn on LD2 
      00861C 72 1A 50 0D      [ 1] 1225     bset PC_CR1,#LED2_BIT
      008620 72 1A 50 0E      [ 1] 1226     bset PC_CR2,#LED2_BIT
      008624 72 1A 50 0C      [ 1] 1227     bset PC_DDR,#LED2_BIT
      008628 72 1A 50 0A      [ 1] 1228 	bset PC_ODR,#LED2_BIT 
                                   1229 ; disable schmitt triggers on Arduino CN4 analog inputs
      00862C 55 00 3F 54 07   [ 1] 1230 	mov ADC_TDRL,0x3f
                                   1231 ; disable peripherals clocks
                                   1232 ;	clr CLK_PCKENR1 
                                   1233 ;	clr CLK_PCKENR2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008631 72 5F 50 F2      [ 1] 1234 	clr AWU_TBR 
      008635 72 14 50 CA      [ 1] 1235 	bset CLK_PCKENR2,#2 ; enable LSI for beeper
                                   1236 ; select internal clock no divisor: 16 Mhz 	
      008639 A6 E1            [ 1] 1237 	ld a,#CLK_SWR_HSI 
      00863B 5F               [ 1] 1238 	clrw x  
      00863C CD 81 24         [ 4] 1239     call clock_init 
      00863F CD 81 47         [ 4] 1240 	call timer4_init
      008642 CD 81 3A         [ 4] 1241 	call timer2_init
                                   1242 ; UART1 at 115200 BAUD
      008645 CD 82 10         [ 4] 1243 	call uart1_init
                                   1244 ; activate PE_4 (user button interrupt)
      008648 72 18 50 18      [ 1] 1245     bset PE_CR2,#USR_BTN_BIT 
                                   1246 ; display system information
      00864C AE 85 B4         [ 2] 1247 	ldw x,#software 
      00864F CD 82 5E         [ 4] 1248 	call puts 
      008652 A6 01            [ 1] 1249 	ld a,#MAJOR 
      008654 C7 00 0E         [ 1] 1250 	ld acc8,a 
      008657 5F               [ 1] 1251 	clrw x 
      008658 CF 00 0C         [ 2] 1252 	ldw acc24,x 
      00865B A6 0A            [ 1] 1253 	ld a,#10 
      00865D CD 8A 4E         [ 4] 1254 	call prti24 
      008660 A6 2E            [ 1] 1255 	ld a,#'.
      008662 CD 82 4B         [ 4] 1256 	call putc 
      008665 A6 00            [ 1] 1257 	ld a,#MINOR 
      008667 C7 00 0E         [ 1] 1258 	ld acc8,a 
      00866A 5F               [ 1] 1259 	clrw x 
      00866B CF 00 0C         [ 2] 1260 	ldw acc24,x 
      00866E A6 0A            [ 1] 1261 	ld a,#10 
      008670 CD 8A 4E         [ 4] 1262 	call prti24 
      008673 A6 0D            [ 1] 1263 	ld a,#CR 
      008675 CD 82 4B         [ 4] 1264 	call putc 
      008678 CD 9C 24         [ 4] 1265 	call seek_fdrive 
      00867B 9A               [ 1] 1266 	rim 
      00867C 72 5C 00 16      [ 1] 1267 	inc seedy+1 
      008680 72 5C 00 14      [ 1] 1268 	inc seedx+1 
      008684 CD 87 02         [ 4] 1269 	call clear_basic
      008687 CD 94 54         [ 4] 1270 	call ubound 
      00868A CD 90 9E         [ 4] 1271 	call dpop 
      00868D CF 00 24         [ 2] 1272 	ldw array_size,x
                                   1273 ; 200 msec beep
      008690 AE 03 DC         [ 2] 1274 	ldw x,#988 
      008693 CD 90 91         [ 4] 1275 	call dpush 
      008696 AE 00 96         [ 2] 1276 	ldw x,#150 
      008699 CD 90 91         [ 4] 1277 	call dpush 
      00869C CD 9A 87         [ 4] 1278 	call beep 
      00869F 72 1B 50 0A      [ 1] 1279 	bres PC_ODR,#LED2_BIT	
      0086A3 CD 86 AC         [ 4] 1280 	call warm_init
      0086A6 CD 86 C9         [ 4] 1281 	call load_autorun
      0086A9 CC 88 7E         [ 2] 1282     jp interp 
                                   1283 
      0086AC                       1284 warm_init:
      0086AC 72 5F 00 26      [ 1] 1285 	clr flags 
      0086B0 72 5F 00 23      [ 1] 1286 	clr loop_depth 
      0086B4 AE 17 80         [ 2] 1287 	ldw x,#dstack_empty 
      0086B7 CF 00 1D         [ 2] 1288 	ldw dstkptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0086BA 35 04 00 27      [ 1] 1289 	mov tab_width,#TAB_WIDTH 
      0086BE 35 0A 00 0B      [ 1] 1290 	mov base,#10 
      0086C2 AE 16 E8         [ 2] 1291 	ldw x,#tib 
      0086C5 CF 00 05         [ 2] 1292 	ldw basicptr,x 
      0086C8 81               [ 4] 1293 	ret 
                                   1294 
                                   1295 ;--------------------------
                                   1296 ; if autorun file defined 
                                   1297 ; in eeprom address AUTORUN_NAME 
                                   1298 ; load and run it.
                                   1299 ;-------------------------
      0086C9                       1300 load_autorun:
      0086C9 AE 40 00         [ 2] 1301 	ldw x,#AUTORUN_NAME
      0086CC F6               [ 1] 1302 	ld a,(x)
      0086CD 27 1D            [ 1] 1303 	jreq 9$
      0086CF 90 AE 40 00      [ 2] 1304 	ldw y,#AUTORUN_NAME
      0086D3 CD 9C 82         [ 4] 1305 	call search_file
      0086D6 25 02            [ 1] 1306 	jrc 2$ 
      0086D8 20 12            [ 2] 1307 	jra 9$ 
      0086DA CD 9D 91         [ 4] 1308 2$:	call load_file
      0086DD AE 40 00         [ 2] 1309 	ldw x,#AUTORUN_NAME 
      0086E0 CD 82 5E         [ 4] 1310 	call puts
      0086E3 AE 86 ED         [ 2] 1311 	ldw x,#autorun_msg 
      0086E6 CD 82 5E         [ 4] 1312 	call puts 
      0086E9 CC 9A 47         [ 2] 1313 	jp run_it    
      0086EC 81               [ 4] 1314 9$: ret 	
                                   1315 
      0086ED 20 6C 6F 61 64 65 64  1316 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1317 ;---------------------------
                                   1318 ; reset BASIC text variables 
                                   1319 ; and clear variables 
                                   1320 ;---------------------------
      008702                       1321 clear_basic:
      008702 72 5F 00 04      [ 1] 1322 	clr count 
      008706 AE 00 5D         [ 2] 1323 	ldw x,#free_ram 
      008709 CF 00 1F         [ 2] 1324 	ldw txtbgn,x 
      00870C CF 00 21         [ 2] 1325 	ldw txtend,x 
      00870F CD 85 95         [ 4] 1326 	call clear_vars 
      008712 81               [ 4] 1327 	ret 
                                   1328 
                                   1329 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1330 ;;   Tiny BASIC error messages     ;;
                                   1331 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008713                       1332 err_msg:
      008713 00 00 87 2D 87 3B 87  1333 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             4A 87 64 87 74
      00871F 87 8B 87 A2 87 BD 87  1334 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             CF 87 E1
      008729 87 EE 88 22           1335 	.word err_no_access,err_no_data  
                                   1336 
      00872D 0A 4D 65 6D 6F 72 79  1337 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      00873B 0A 73 79 6E 74 61 78  1338 err_syntax: .asciz "\nsyntax error\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal  20-Bits]



             20 65 72 72 6F 72 0A
             00
      008743 65 72 72 6F 72 0A 00  1339 err_math_ovf: .asciz "\nmath operation overflow\n"
             0A 6D 61 74 68 20 6F
             70 65 72 61 74 69 6F
             6E 20 6F 76 65
      00875D 72 66 6C 6F 77 0A 00  1340 err_div0: .asciz "\ndivision by 0\n" 
             0A 64 69 76 69 73 69
             6F 6E
      00876D 20 62 79 20 30 0A 00  1341 err_no_line: .asciz "\ninvalid line number.\n"
             0A 69 6E 76 61 6C 69
             64 20 6C 69 6E 65 20
             6E 75
      008784 6D 62 65 72 2E 0A 00  1342 err_run_only: .asciz "\nrun time only usage.\n" 
             0A 72 75 6E 20 74 69
             6D 65 20 6F 6E 6C 79
             20 75
      00879B 73 61 67 65 2E 0A 00  1343 err_cmd_only: .asciz "\ncommand line only usage.\n"
             0A 63 6F 6D 6D 61 6E
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75
      0087B6 73 61 67 65 2E 0A 00  1344 err_duplicate: .asciz "\nduplicate name.\n"
             0A 64 75 70 6C 69 63
             61 74 65 20
      0087C8 6E 61 6D 65 2E 0A 00  1345 err_not_file: .asciz "\nFile not found.\n"
             0A 46 69 6C 65 20 6E
             6F 74 20 66
      0087DA 6F 75 6E 64 2E 0A 00  1346 err_bad_value: .asciz "\nbad value.\n"
             0A 62 61 64 20 76
      0087E7 61 6C 75 65 2E 0A 00  1347 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             0A 46 69 6C 65 20 69
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74
      00881B 68 65 72 65 2E 0A 00  1348 err_no_data: .asciz "\nNo data line found.\n"
             0A 4E 6F 20 64 61 74
             61 20 6C 69 6E 65 20
             66
                                   1349 
                                   1350 ;rt_msg: .asciz "last token id: "
                                   1351 
      0007B8                       1352 syntax_error:
      008831 6F 75            [ 1] 1353 	ld a,#ERR_SYNTAX 
                                   1354 
      0007BA                       1355 tb_error:
      008833 6E 64 2E         [ 2] 1356 	ldw x, #err_msg 
      008836 0A 00 00 0C      [ 1] 1357 	clr acc16 
      008838 48               [ 1] 1358 	sll a
      008838 A6 02 00 0C      [ 1] 1359 	rlc acc16  
      00883A C7 00 0D         [ 1] 1360 	ld acc8, a 
      00883A AE 87 13 72      [ 2] 1361 	addw x,acc16 
      00883E 5F               [ 2] 1362 	ldw x,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      00883F 00 0D 48         [ 4] 1363 	call puts
      008842 72 59 00 0D C7   [ 2] 1364 	btjf flags,#FCOMP, 1$
      008847 00 0E 72         [ 2] 1365 	ldw x,#tib
      00884A BB 00 0D         [ 4] 1366 	call puts 
      00884D FE CD            [ 1] 1367 	ld a,#CR 
      00884F 82 5E 72         [ 4] 1368 	call putc
      008852 0B 00 26         [ 2] 1369 	ldw x,in.w
      008855 18 AE 16         [ 4] 1370 	call spaces
      008858 E8 CD            [ 1] 1371 	ld a,#'^
      00885A 82 5E A6         [ 4] 1372 	call putc 
      00885D 0D CD            [ 2] 1373 	jra 6$
      00885F 82 4B CE         [ 2] 1374 1$:	ldw x,basicptr
      008862 00 01 CD         [ 1] 1375 	ld a,in 
      008865 82 86 A6         [ 4] 1376 	call prt_basic_line
                                   1377 ;	ldw x,#rt_msg 
                                   1378 ;	call puts 
                                   1379 ;	clrw x 
                                   1380 ;	ld a,in.saved 
                                   1381 ;	ld xl,a 
                                   1382 ;	ld a,([basicptr],x)
                                   1383 ;	clrw x 
                                   1384 ;	ld xl,a 
                                   1385 ;	call print_int 
      008868 5E CD 82         [ 2] 1386 6$: ldw x,#STACK_EMPTY 
      00886B 4B               [ 1] 1387     ldw sp,x
      0007FB                       1388 warm_start:
      00886C 20 09 CE         [ 4] 1389 	call warm_init
                                   1390 ;----------------------------
                                   1391 ;   BASIC interpreter
                                   1392 ;----------------------------
      0007FE                       1393 interp:
      00886F 00 05 C6 00      [ 1] 1394 	clr in.w
      008873 02 CD 95 73 AE   [ 2] 1395 	btjf flags,#FRUN,cmd_line
                                   1396 ; flag FRUN is set 
                                   1397 ; running program
                                   1398 ; goto next basic line 
      008878 17 FF 94         [ 2] 1399 	ldw x,basicptr
      00887B E6 02            [ 1] 1400 	ld a,(2,x) ; line length 
      00887B CD 86 AC         [ 1] 1401 	ld acc8,a 
      00887E 72 5F 00 0C      [ 1] 1402 	clr acc16 
      00887E 72 5F 00 01      [ 2] 1403 	addw x,acc16
      008882 72 01 00         [ 2] 1404 	cpw x,txtend 
      008885 26 23            [ 1] 1405 	jrpl warm_start
      008887 CE 00 05         [ 2] 1406 	ldw basicptr,x ; start of next line  
      00888A E6 02            [ 1] 1407 	ld a,(2,x)
      00888C C7 00 0E         [ 1] 1408 	ld count,a 
      00888F 72 5F 00 0D      [ 1] 1409 	mov in,#3 ; skip first 3 bytes of line 
      008893 72 BB            [ 2] 1410 	jra interp_loop 
      00082A                       1411 cmd_line: ; commande line interface  	
      008895 00 0D C3 00      [ 1] 1412 	clr in
      008899 21 2A            [ 1] 1413 	ld a,#CR 
      00889B DF CF 00         [ 4] 1414 	call putc 
      00889E 05 E6            [ 1] 1415 	ld a,#'> 
      0088A0 02 C7 00         [ 4] 1416 	call putc 
      0088A3 04 35 03         [ 4] 1417 	call readln
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0088A6 00 02 20         [ 4] 1418 	call compile
                                   1419 ; if text begin with a line number
                                   1420 ; the compile set count=0   
                                   1421 ; so code is not interpreted
                                   1422 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1423 ;; This is the interpreter loop
                                   1424 ;; for each BASIC code line. 
                                   1425 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00083E                       1426 interp_loop:  
      0088A9 14 00 01         [ 1] 1427 	ld a,in 
      0088AA C1 00 03         [ 1] 1428 	cp a,count  
      0088AA 72 5F            [ 1] 1429 	jrpl interp
      0088AC 00 02 A6         [ 4] 1430 	call next_token
      0088AF 0D CD            [ 1] 1431 	cp a,#TK_COLON 
      0088B1 82 4B            [ 1] 1432 	jreq interp_loop 
      00084D                       1433 1$:
      0088B3 A6 3E            [ 1] 1434 	cp a,#TK_VAR
      0088B5 CD 82            [ 1] 1435 	jrne 2$
      0088B7 4B CD 8B         [ 4] 1436 	call let02  
      0088BA 86 CD            [ 2] 1437 	jra interp_loop 
      000856                       1438 2$:	
      0088BC 84 9A            [ 1] 1439 	cp a,#TK_ARRAY 
      0088BE 26 08            [ 1] 1440 	jrne 3$
      0088BE C6 00 02         [ 4] 1441 	call get_array_element
      0088C1 C1 00 04         [ 4] 1442 	call let02 
      0088C4 2A B8            [ 2] 1443 	jra interp_loop 
      000862                       1444 3$:
      0088C6 CD 88            [ 1] 1445 	cp a,#TK_CMD
      0088C8 EC A1            [ 1] 1446 	jrne 4$
      0088CA 01               [ 4] 1447 	call (x) 
      0088CB 27 F1            [ 2] 1448 	jra interp_loop 
      0088CD                       1449 4$:	
      0088CD A1 05 26         [ 2] 1450 	jp syntax_error 
                                   1451 
                                   1452 ;--------------------------
                                   1453 ; extract next token from
                                   1454 ; token list 
                                   1455 ; basicptr -> base address 
                                   1456 ; in  -> offset in list array 
                                   1457 ; output:
                                   1458 ;   A 		token attribute
                                   1459 ;   X 		token value if there is one
                                   1460 ;----------------------------------------
      00086C                       1461 next_token:
      0088D0 05 CD 94         [ 1] 1462 	ld a,in 
      0088D3 80 20 E8         [ 1] 1463 	sub a,count ; don't replace sub by cp.  
      0088D6 27 4C            [ 1] 1464 	jreq 9$
      0088D6 A1 02 26 08 CD   [ 1] 1465 	mov in.saved,in 
      0088DB 92 C9 CD         [ 2] 1466 	ldw x,basicptr 
      0088DE 94 80 20 DC      [ 4] 1467 	ld a,([in.w],x)
      0088E2 72 5C 00 01      [ 1] 1468 	inc in 
      0088E2 A1 06            [ 1] 1469 	cp a,#TK_ARRAY  
      0088E4 26 03            [ 2] 1470 	jrule 9$
      0088E6 FD 20            [ 1] 1471 	cp a,#TK_CHAR
      0088E8 D5 0D            [ 1] 1472 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0088E9 72 D6 00 00      [ 4] 1473 	ld a,([in.w],x)
      0088E9 CC 88 38 01      [ 1] 1474 	inc in
      0088EC 5F               [ 1] 1475 	clrw x 
      0088EC C6               [ 1] 1476 	ld xl,a 
      0088ED 00 02            [ 1] 1477 	ld a,#TK_CHAR
      0088EF C0               [ 4] 1478 	ret 
      0088F0 00 04            [ 1] 1479 1$:	cp a,#TK_QSTR 
      0088F2 27 4C            [ 1] 1480 	jrult 4$
      0088F4 55 00            [ 1] 1481 	jrne 9$
      0088F6 02 00 03 CE      [ 2] 1482 	addw x,in.w 
      0088FA 00               [ 2] 1483 	pushw x 
      0088FB 05               [ 1] 1484 2$:	tnz (x)
      0088FC 72 D6            [ 1] 1485 	jreq 3$
      0088FE 00               [ 2] 1486 	incw x 
      0088FF 01 72            [ 2] 1487 	jra 2$ 
      008901 5C               [ 2] 1488 3$:	incw x 
      008902 00 02 A1 02      [ 2] 1489     subw x,basicptr 
      008906 23 38 A1         [ 2] 1490 	ldw in.w,x 
      008909 03               [ 2] 1491 	popw x 
      00890A 26               [ 4] 1492 	ret 
      00890B 0D 72 D6 00      [ 5] 1493 4$: ldw x,([in.w],x)
      00890F 01 72 5C 00      [ 1] 1494 	inc in 
      008913 02 5F 97 A6      [ 1] 1495 	inc in
      0008C0                       1496 9$: 
      008917 03               [ 4] 1497 	ret	
                                   1498 
                                   1499 
                                   1500 ;----------------------------------------
                                   1501 ;   DEBUG support functions
                                   1502 ;----------------------------------------
                           000001  1503 .if DEBUG 
                                   1504 
                                   1505 ; turn LED on 
      0008C1                       1506 ledon:
      008918 81 A1 0A 25      [ 1] 1507     bset PC_ODR,#LED2_BIT
      00891C 17               [ 4] 1508     ret 
                                   1509 
                                   1510 ; turn LED off 
      0008C6                       1511 ledoff:
      00891D 26 21 72 BB      [ 1] 1512     bres PC_ODR,#LED2_BIT 
      008921 00               [ 4] 1513     ret 
                                   1514 
                                   1515 ; invert LED status 
      0008CB                       1516 ledtoggle:
      008922 01 89            [ 1] 1517     ld a,#LED2_MASK
      008924 7D 27 03         [ 1] 1518     xor a,PC_ODR
      008927 5C 20 FA         [ 1] 1519     ld PC_ODR,a
      00892A 5C               [ 4] 1520     ret 
                                   1521 
      0008D4                       1522 left_paren:
      00892B 72 B0            [ 1] 1523 	ld a,#SPACE 
      00892D 00 05 CF         [ 4] 1524 	call putc
      008930 00 01            [ 1] 1525 	ld a,#'( 
      008932 85 81 72         [ 4] 1526 	call putc 	
      008935 DE               [ 4] 1527 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1528 
                                   1529 ;------------------------------
                                   1530 ; print 8 bit register 
                                   1531 ; input:
                                   1532 ;   X  point to register name 
                                   1533 ;   A  register value to print 
                                   1534 ; output:
                                   1535 ;   none
                                   1536 ;------------------------------- 
      0008DF                       1537 prt_reg8:
      008936 00               [ 1] 1538 	push a 
      008937 01 72 5C         [ 4] 1539 	call puts 
      00893A 00 02            [ 1] 1540 	ld a,(1,sp) 
      00893C 72 5C 00         [ 1] 1541 	ld acc8,a 
      00893F 02               [ 1] 1542 	clrw x 
      008940 97               [ 1] 1543 	ld xl,a 
      008940 81 10 00 0A      [ 1] 1544 	mov base,#16
      008941 CD 0A 16         [ 4] 1545 	call print_int 
      008941 72 1A 50         [ 4] 1546 	call left_paren 
      008944 0A               [ 1] 1547 	pop a 
      008945 81               [ 1] 1548 	clrw x 
      008946 97               [ 1] 1549 	ld xl,a 
      008946 72 1B 50 0A      [ 1] 1550 	mov base,#10 
      00894A 81 0A 16         [ 4] 1551 	call print_int  
      00894B A6 29            [ 1] 1552 	ld a,#') 
      00894B A6 20 C8         [ 4] 1553 	call putc
      00894E 50               [ 4] 1554 	ret
                                   1555 
                                   1556 ;--------------------------------
                                   1557 ; print 16 bits register 
                                   1558 ; input:
                                   1559 ;   X   point register name 
                                   1560 ;   Y   register value to print 
                                   1561 ; output:
                                   1562 ;  none
                                   1563 ;--------------------------------
      000904                       1564 prt_reg16: 
      00894F 0A C7            [ 2] 1565 	pushw y 
      008951 50 0A 81         [ 4] 1566 	call puts 
      008954 1E 01            [ 2] 1567 	ldw x,(1,sp) 
      008954 A6 20 CD 82      [ 1] 1568 	mov base,#16 
      008958 4B A6 28         [ 4] 1569 	call print_int  
      00895B CD 82 4B         [ 4] 1570 	call left_paren 
      00895E 81               [ 2] 1571 	popw x 
      00895F 35 0A 00 0A      [ 1] 1572 	mov base,#10 
      00895F 88 CD 82         [ 4] 1573 	call print_int  
      008962 5E 7B            [ 1] 1574 	ld a,#') 
      008964 01 C7 00         [ 4] 1575 	call putc
      008967 0E               [ 4] 1576 	ret 
                                   1577 
                                   1578 ;------------------------------------
                                   1579 ; print registers contents saved on
                                   1580 ; stack by trap interrupt.
                                   1581 ;------------------------------------
      000923                       1582 print_registers:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008968 5F 97 35         [ 2] 1583 	ldw x,#STATES
      00896B 10 00 0B         [ 4] 1584 	call puts
                                   1585 ; print EPC 
      00896E CD 8A 96         [ 2] 1586 	ldw x, #REG_EPC
      008971 CD 89 54         [ 4] 1587 	call puts 
      008974 84 5F            [ 1] 1588 	ld a, (11,sp)
      008976 97 35 0A         [ 1] 1589 	ld acc8,a 
      008979 00 0B            [ 1] 1590 	ld a, (10,sp) 
      00897B CD 8A 96         [ 1] 1591 	ld acc16,a 
      00897E A6 29            [ 1] 1592 	ld a,(9,sp) 
      008980 CD 82 4B         [ 1] 1593 	ld acc24,a
      008983 81               [ 1] 1594 	clrw x  
      008984 A6 10            [ 1] 1595 	ld a,#16
      008984 90 89 CD         [ 4] 1596 	call prti24  
                                   1597 ; print X
      008987 82 5E 1E         [ 2] 1598 	ldw x,#REG_X
      00898A 01 35            [ 2] 1599 	ldw y,(5,sp)
      00898C 10 00 0B         [ 4] 1600 	call prt_reg16  
                                   1601 ; print Y 
      00898F CD 8A 96         [ 2] 1602 	ldw x,#REG_Y
      008992 CD 89            [ 2] 1603 	ldw y, (7,sp)
      008994 54 85 35         [ 4] 1604 	call prt_reg16  
                                   1605 ; print A 
      008997 0A 00 0B         [ 2] 1606 	ldw x,#REG_A
      00899A CD 8A            [ 1] 1607 	ld a, (4,sp) 
      00899C 96 A6 29         [ 4] 1608 	call prt_reg8
                                   1609 ; print CC 
      00899F CD 82 4B         [ 2] 1610 	ldw x,#REG_CC 
      0089A2 81 03            [ 1] 1611 	ld a, (3,sp) 
      0089A3 CD 08 DF         [ 4] 1612 	call prt_reg8 
                                   1613 ; print SP 
      0089A3 AE 89 F6         [ 2] 1614 	ldw x,#REG_SP
      0089A6 CD 82            [ 1] 1615 	ldw y,sp 
      0089A8 5E AE 8A 33      [ 2] 1616 	addw y,#12
      0089AC CD 82 5E         [ 4] 1617 	call prt_reg16  
      0089AF 7B 0B            [ 1] 1618 	ld a,#'\n' 
      0089B1 C7 00 0E         [ 4] 1619 	call putc
      0089B4 7B               [ 4] 1620 	ret
                                   1621 
      0089B5 0A C7 00 0D 7B 09 C7  1622 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             00 0C 5F A6 10 CD 8A
             4E AE 8A 3C 16 05 CD
             89 84 AE 8A 38 16 07
             CD 89 84 AE 8A 40 7B
             04 CD 89 5F AE 8A 44
             7B 03 CD 89 5F AE 8A
             49 90 96 72 A9 00 0C
             CD 89 84 A6 0A
      0089F2 CD 82 4B 81 0A        1623 REG_EPC: .asciz "EPC:"
      0089F7 52 65 67 69           1624 REG_Y:   .asciz "\nY:" 
      0089FB 73 74 65 72           1625 REG_X:   .asciz "\nX:"
      0089FF 73 20 73 74           1626 REG_A:   .asciz "\nA:" 
      008A03 61 74 65 20 61        1627 REG_CC:  .asciz "\nCC:"
      008A08 74 20 61 62 6F        1628 REG_SP:  .asciz "\nSP:"
                                   1629 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1630 .endif ; DEBUG 
                                   1631 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1632 
                                   1633 
                                   1634 ;------------------------------------
                                   1635 ; print integer in acc24 
                                   1636 ; input:
                                   1637 ;	acc24 		integer to print 
                                   1638 ;	A 			numerical base for conversion 
                                   1639 ;               if bit 7 is set add a space at print end.
                                   1640 ;   XL 			field width, 0 -> no fill.
                                   1641 ;  output:
                                   1642 ;    none 
                                   1643 ;------------------------------------
                           000001  1644 	WIDTH = 1
                           000002  1645 	BASE = 2
                           000003  1646 	ADD_SPACE=3 ; add a space after number 
                           000003  1647 	VSIZE = 3
      0009CE                       1648 prti24:
      0009CE                       1649 	_vars VSIZE 
      008A0D 72 74            [ 2]    1     sub sp,#VSIZE 
      008A0F 20 70            [ 1] 1650 	clr (ADD_SPACE,sp)
      008A11 6F 69            [ 1] 1651 	bcp a,#0x80 
      008A13 6E 74            [ 1] 1652 	jreq 0$ 
      008A15 2E 0A            [ 1] 1653 	cpl (ADD_SPACE,sp)
      008A17 2D 2D            [ 1] 1654 0$:	and a,#31 
      008A19 2D 2D            [ 1] 1655 	ld (BASE,sp),a
      008A1B 2D               [ 1] 1656 	ld a,xl
      008A1C 2D 2D            [ 1] 1657 	ld (WIDTH,sp),a 
      008A1E 2D 2D            [ 1] 1658 	ld a, (BASE,sp)  
      008A20 2D 2D 2D         [ 4] 1659     call itoa  ; conversion entier en  .asciz
      008A23 2D 2D            [ 1] 1660 1$: ld a,(WIDTH,sp)
      008A25 2D 2D            [ 1] 1661 	jreq 4$
      008A27 2D 2D 2D         [ 1] 1662 	ld acc8,a 
      008A2A 2D               [ 2] 1663 	pushw x 
      008A2B 2D 2D 2D         [ 4] 1664 	call strlen 
      008A2E 2D               [ 1] 1665 	ld a,xl 
      008A2F 2D               [ 2] 1666 	popw x 
      008A30 2D 0A 00         [ 3] 1667 	exg a,acc8 
      008A33 45 50 43         [ 1] 1668 	sub a,acc8 
      008A36 3A 00            [ 1] 1669 	jrmi 4$
      008A38 0A 59            [ 1] 1670 	ld (WIDTH,sp),a 
      008A3A 3A 00            [ 1] 1671 	ld  a,#SPACE
      008A3C 0A 58            [ 1] 1672 3$: tnz (WIDTH,sp)
      008A3E 3A 00            [ 1] 1673 	jreq 4$
      008A40 0A               [ 2] 1674 	decw x 
      008A41 41               [ 1] 1675 	ld (x),a 
      008A42 3A 00            [ 1] 1676 	dec (WIDTH,sp) 
      008A44 0A 43            [ 2] 1677 	jra 3$
      000A07                       1678 4$: 
      008A46 43 3A 00         [ 4] 1679 	call puts 
      008A49 0A 53            [ 1] 1680 	tnz (ADD_SPACE,sp)
      008A4B 50 3A            [ 1] 1681 	jreq 5$
      008A4D 00 20            [ 1] 1682     ld a,#SPACE 
      008A4E CD 01 CB         [ 4] 1683 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      000A13                       1684 5$: _drop VSIZE 
      008A4E 52 03            [ 2]    1     addw sp,#VSIZE 
      008A50 0F               [ 4] 1685     ret	
                                   1686 
                                   1687 ;-----------------------------------
                                   1688 ; print a 16 bit integer 
                                   1689 ; using variable 'base' as conversion
                                   1690 ; format.
                                   1691 ; input:
                                   1692 ;   X       integer to print 
                                   1693 ;   base    conversion base 
                                   1694 ; output:
                                   1695 ;   none 
                                   1696 ;-----------------------------------
                           000001  1697 	SIGN=1
                           000001  1698 	VSIZE=1
      000A16                       1699 print_int: 
      000A16                       1700 	_vars VSIZE 
      008A51 03 A5            [ 2]    1     sub sp,#VSIZE 
      008A53 80 27            [ 1] 1701 	clr (SIGN,sp)
      008A55 02 03 03 A4      [ 2] 1702 	ldw y,#pad+PAD_SIZE-1 
      008A59 1F 6B            [ 1] 1703 	clr (y)
      008A5B 02 9F 6B         [ 1] 1704 	ld a,base  
      008A5E 01 7B            [ 1] 1705 	cp a,#10 
      008A60 02 CD            [ 1] 1706 	jrne 1$ 
      008A62 8A               [ 2] 1707 	tnzw x 
      008A63 F4 7B            [ 1] 1708 	jrpl 1$ 
      008A65 01 27            [ 1] 1709 	cpl (SIGN,sp)
      008A67 1F               [ 2] 1710 	negw x 	 
      000A2D                       1711 1$:	
      008A68 C7 00 0E         [ 1] 1712 	ld a,base 
      008A6B 89               [ 2] 1713 	div x,a 
      008A6C CD 83            [ 1] 1714 	add a,#'0 
      008A6E 20 9F            [ 1] 1715 	cp a,#'9+1 
      008A70 85 31            [ 1] 1716 	jrmi 2$ 
      008A72 00 0E            [ 1] 1717 	add a,#7 
      008A74 C0 00            [ 2] 1718 2$: decw y 
      008A76 0E 2B            [ 1] 1719 	ld (y),a 
      008A78 0E               [ 2] 1720 	tnzw x 
      008A79 6B 01            [ 1] 1721 	jrne 1$ 
      008A7B A6 20            [ 1] 1722 	ld a,#16 
      008A7D 0D 01 27         [ 1] 1723 	cp a,base 
      008A80 06 5A            [ 1] 1724 	jrne 3$
      008A82 F7 0A            [ 1] 1725 	ld a,#'$
      008A84 01 20            [ 2] 1726 	decw y  
      008A86 F6 F7            [ 1] 1727 	ld (y),a
      008A87 20 0A            [ 2] 1728 	jra 9$ 
      008A87 CD 82            [ 1] 1729 3$: tnz (SIGN,sp)
      008A89 5E 0D            [ 1] 1730 	jreq 9$ 
      008A8B 03 27            [ 1] 1731 	ld a,#'-
      008A8D 05 A6            [ 2] 1732 	decw y  
      008A8F 20 CD            [ 1] 1733 	ld (y),a
      000A59                       1734 9$:	
      008A91 82               [ 1] 1735 	ldw x,y 
      008A92 4B 5B 03         [ 2] 1736 	subw x,#pad+PAD_SIZE-1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008A95 81               [ 2] 1737 	negw x  
      008A96                       1738 10$:
      008A96 52               [ 1] 1739 	ld a,xl 
      008A97 01 0F 01         [ 1] 1740 	cp a,tab_width
      008A9A 90 AE            [ 1] 1741 	jruge 12$
      008A9C 17 5F            [ 2] 1742 	decw y 
      008A9E 90 7F            [ 1] 1743 	ld a,#SPACE 
      008AA0 C6 00            [ 1] 1744 	ld (y),a
      008AA2 0B               [ 2] 1745 	incw x 
      008AA3 A1 0A            [ 2] 1746 	jra 10$ 
      000A6D                       1747 12$:
      008AA5 26               [ 1] 1748     ldw x,y 
      008AA6 06 5D 2A         [ 4] 1749 	call puts  
      000A71                       1750 	_drop VSIZE 
      008AA9 03 03            [ 2]    1     addw sp,#VSIZE 
      008AAB 01               [ 4] 1751 	ret 
                                   1752 
                                   1753 ;------------------------------------
                                   1754 ; convert integer in acc24 to string
                                   1755 ; input:
                                   1756 ;   A	  	base
                                   1757 ;	acc24	integer to convert
                                   1758 ; output:
                                   1759 ;   X  		pointer to string
                                   1760 ;------------------------------------
                           000001  1761 	SIGN=1  ; integer sign 
                           000002  1762 	BASE=2  ; numeric base 
                           000002  1763 	VSIZE=2  ;locals size
      000A74                       1764 itoa:
      008AAC 50 02            [ 2] 1765 	sub sp,#VSIZE
      008AAD 6B 02            [ 1] 1766 	ld (BASE,sp), a  ; base
      008AAD C6 00            [ 1] 1767 	clr (SIGN,sp)    ; sign
      008AAF 0B 62            [ 1] 1768 	cp a,#10
      008AB1 AB 30            [ 1] 1769 	jrne 1$
                                   1770 	; base 10 string display with negative sign if bit 23==1
      008AB3 A1 3A 2B 02 AB   [ 2] 1771 	btjf acc24,#7,1$
      008AB8 07 90            [ 1] 1772 	cpl (SIGN,sp)
      008ABA 5A 90 F7         [ 4] 1773 	call neg_acc24
      000A88                       1774 1$:
                                   1775 ; initialize string pointer 
      008ABD 5D 26 ED         [ 2] 1776 	ldw x,#pad+PAD_SIZE-1
      008AC0 A6               [ 1] 1777 	clr (x)
      000A8C                       1778 itoa_loop:
      008AC1 10 C1            [ 1] 1779     ld a,(BASE,sp)
      008AC3 00 0B 26         [ 4] 1780     call divu24_8 ; acc24/A 
      008AC6 08 A6            [ 1] 1781     add a,#'0  ; remainder of division
      008AC8 24 90            [ 1] 1782     cp a,#'9+1
      008ACA 5A 90            [ 1] 1783     jrmi 2$
      008ACC F7 20            [ 1] 1784     add a,#7 
      008ACE 0A               [ 2] 1785 2$: decw x
      008ACF 0D               [ 1] 1786     ld (x),a
                                   1787 	; if acc24==0 conversion done
      008AD0 01 27 06         [ 1] 1788 	ld a,acc24
      008AD3 A6 2D 90         [ 1] 1789 	or a,acc16
      008AD6 5A 90 F7         [ 1] 1790 	or a,acc8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008AD9 26 E6            [ 1] 1791     jrne itoa_loop
                                   1792 	;conversion done, next add '$' or '-' as required
      008AD9 93 1D            [ 1] 1793 	ld a,(BASE,sp)
      008ADB 17 5F            [ 1] 1794 	cp a,#16
      008ADD 50 08            [ 1] 1795 	jreq 8$
      008ADE 7B 01            [ 1] 1796 	ld a,(SIGN,sp)
      008ADE 9F C1            [ 1] 1797     jreq 10$
      008AE0 00 27            [ 1] 1798     ld a,#'-
      008AE2 24 09            [ 2] 1799 	jra 9$ 
      008AE4 90 5A            [ 1] 1800 8$: ld a,#'$ 
      008AE6 A6               [ 2] 1801 9$: decw x
      008AE7 20               [ 1] 1802     ld (x),a
      000AB8                       1803 10$:
      008AE8 90 F7            [ 2] 1804 	addw sp,#VSIZE
      008AEA 5C               [ 4] 1805 	ret
                                   1806 
                                   1807 ;-------------------------------------
                                   1808 ; divide uint24_t by uint8_t
                                   1809 ; used to convert uint24_t to string
                                   1810 ; input:
                                   1811 ;	acc24	dividend
                                   1812 ;   A 		divisor
                                   1813 ; output:
                                   1814 ;   acc24	quotient
                                   1815 ;   A		remainder
                                   1816 ;------------------------------------- 
                                   1817 ; offset  on sp of arguments and locals
                           000001  1818 	U8   = 1   ; divisor on stack
                           000001  1819 	VSIZE =1
      000ABB                       1820 divu24_8:
      008AEB 20               [ 2] 1821 	pushw x ; save x
      008AEC F1               [ 1] 1822 	push a 
                                   1823 	; ld dividend UU:MM bytes in X
      008AED C6 00 0B         [ 1] 1824 	ld a, acc24
      008AED 93               [ 1] 1825 	ld xh,a
      008AEE CD 82 5E         [ 1] 1826 	ld a,acc24+1
      008AF1 5B               [ 1] 1827 	ld xl,a
      008AF2 01 81            [ 1] 1828 	ld a,(U8,SP) ; divisor
      008AF4 62               [ 2] 1829 	div x,a ; UU:MM/U8
      008AF4 52               [ 1] 1830 	push a  ;save remainder
      008AF5 02               [ 1] 1831 	ld a,xh
      008AF6 6B 02 0F         [ 1] 1832 	ld acc24,a
      008AF9 01               [ 1] 1833 	ld a,xl
      008AFA A1 0A 26         [ 1] 1834 	ld acc24+1,a
      008AFD 0A               [ 1] 1835 	pop a
      008AFE 72               [ 1] 1836 	ld xh,a
      008AFF 0F 00 0C         [ 1] 1837 	ld a,acc24+2
      008B02 05               [ 1] 1838 	ld xl,a
      008B03 03 01            [ 1] 1839 	ld a,(U8,sp) ; divisor
      008B05 CD               [ 2] 1840 	div x,a  ; R:LL/U8
      008B06 8B 63            [ 1] 1841 	ld (U8,sp),a ; save remainder
      008B08 9F               [ 1] 1842 	ld a,xl
      008B08 AE 17 5F         [ 1] 1843 	ld acc24+2,a
      008B0B 7F               [ 1] 1844 	pop a
      008B0C 85               [ 2] 1845 	popw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B0C 7B               [ 4] 1846 	ret
                                   1847 
                                   1848 ;------------------------------------
                                   1849 ;  two's complement acc24
                                   1850 ;  input:
                                   1851 ;		acc24 variable
                                   1852 ;  output:
                                   1853 ;		acc24 variable
                                   1854 ;-------------------------------------
      000AE3                       1855 neg_acc24:
      008B0D 02 CD 8B 3B      [ 1] 1856 	cpl acc24+2
      008B11 AB 30 A1 3A      [ 1] 1857 	cpl acc24+1
      008B15 2B 02 AB 07      [ 1] 1858 	cpl acc24
      008B19 5A F7            [ 1] 1859 	ld a,#1
      008B1B C6 00 0C         [ 1] 1860 	add a,acc24+2
      008B1E CA 00 0D         [ 1] 1861 	ld acc24+2,a
      008B21 CA               [ 1] 1862 	clr a
      008B22 00 0E 26         [ 1] 1863 	adc a,acc24+1
      008B25 E6 7B 02         [ 1] 1864 	ld acc24+1,a 
      008B28 A1               [ 1] 1865 	clr a 
      008B29 10 27 08         [ 1] 1866 	adc a,acc24 
      008B2C 7B 01 27         [ 1] 1867 	ld acc24,a 
      008B2F 08               [ 4] 1868 	ret
                                   1869 
                                   1870 
                                   1871 ;------------------------------------
                                   1872 ; read a line of text from terminal
                                   1873 ; input:
                                   1874 ;	none
                                   1875 ; local variable on stack:
                                   1876 ;	LL  line length
                                   1877 ;   RXCHAR last received chaaracte 
                                   1878 ; output:
                                   1879 ;   text in tib  buffer
                                   1880 ;------------------------------------
                                   1881 	; local variables
                           000001  1882 	LL_HB=1
                           000001  1883 	RXCHAR = 1 ; last char received
                           000002  1884 	LL = 2  ; accepted line length
                           000002  1885 	VSIZE=2 
      000B06                       1886 readln:
      008B30 A6               [ 1] 1887 	clrw x 
      008B31 2D               [ 2] 1888 	pushw x 
      008B32 20 02 A6 24      [ 2] 1889  	ldw y,#tib ; input buffer
      000B0C                       1890 readln_loop:
      008B36 5A F7 D4         [ 4] 1891 	call getc
      008B38 6B 01            [ 1] 1892 	ld (RXCHAR,sp),a
      008B38 5B 02            [ 1] 1893 	cp a,#CR
      008B3A 81 03            [ 1] 1894 	jrne 1$
      008B3B CC 0B 81         [ 2] 1895 	jp readln_quit
      008B3B 89 88            [ 1] 1896 1$:	cp a,#NL
      008B3D C6 00            [ 1] 1897 	jreq readln_quit
      008B3F 0C 95            [ 1] 1898 	cp a,#BSP
      008B41 C6 00            [ 1] 1899 	jreq del_back
      008B43 0D 97            [ 1] 1900 	cp a,#CTRL_D
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B45 7B 01            [ 1] 1901 	jreq del_ln
      008B47 62 88            [ 1] 1902 	cp a,#CTRL_R 
      008B49 9E C7            [ 1] 1903 	jreq reprint 
                                   1904 ;	cp a,#'[
                                   1905 ;	jreq ansi_seq
      000B28                       1906 final_test:
      008B4B 00 0C            [ 1] 1907 	cp a,#SPACE
      008B4D 9F C7            [ 1] 1908 	jrpl accept_char
      008B4F 00 0D            [ 2] 1909 	jra readln_loop
      000B2E                       1910 ansi_seq:
                                   1911 ;	call getc
                                   1912 ;	cp a,#'C 
                                   1913 ;	jreq rigth_arrow
                                   1914 ;	cp a,#'D 
                                   1915 ;	jreq left_arrow 
                                   1916 ;	jra final_test
      000B2E                       1917 right_arrow:
                                   1918 ;	ld a,#BSP 
                                   1919 ;	call putc 
                                   1920 ;	jra realn_loop 
      000B2E                       1921 left_arrow:
                                   1922 
                                   1923 ;	jra readln_loop
      000B2E                       1924 reprint: 
      008B51 84 95            [ 1] 1925 	tnz (LL,sp)
      008B53 C6 00            [ 1] 1926 	jrne readln_loop
      008B55 0E 97 7B         [ 2] 1927 	ldw x,#tib 
      008B58 01 62 6B         [ 4] 1928 	call strlen 
      008B5B 01 9F C7 00      [ 2] 1929 	ldw y,#tib 
      008B5F 0E               [ 1] 1930 	ld a,xl
      008B60 84 85            [ 1] 1931 	jreq readln_loop
      008B62 81 02            [ 1] 1932 	ld (LL,sp),a 
      008B63 AE 16 E8         [ 2] 1933 	ldw x,#tib 
      008B63 72 53 00         [ 4] 1934 	call puts
      008B66 0E 72            [ 1] 1935 	clr (LL_HB,sp)
      008B68 53 00 0D         [ 2] 1936 	addw y,(LL_HB,sp)
      008B6B 72 53            [ 2] 1937 	jra readln_loop 
      000B4E                       1938 del_ln:
      008B6D 00 0C            [ 1] 1939 	ld a,(LL,sp)
      008B6F A6 01 CB         [ 4] 1940 	call delete
      008B72 00 0E C7 00      [ 2] 1941 	ldw y,#tib
      008B76 0E 4F            [ 1] 1942 	clr (y)
      008B78 C9 00            [ 1] 1943 	clr (LL,sp)
      008B7A 0D C7            [ 2] 1944 	jra readln_loop
      000B5D                       1945 del_back:
      008B7C 00 0D            [ 1] 1946     tnz (LL,sp)
      008B7E 4F C9            [ 1] 1947     jreq readln_loop
      008B80 00 0C            [ 1] 1948     dec (LL,sp)
      008B82 C7 00            [ 2] 1949     decw y
      008B84 0C 81            [ 1] 1950     clr  (y)
      008B86 CD 01 E8         [ 4] 1951     call bksp 
      008B86 5F 89            [ 2] 1952     jra readln_loop	
      000B6C                       1953 accept_char:
      008B88 90 AE            [ 1] 1954 	ld a,#TIB_SIZE-1
      008B8A 16 E8            [ 1] 1955 	cp a, (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008B8C 27 9A            [ 1] 1956 	jreq readln_loop
      008B8C CD 82            [ 1] 1957 	ld a,(RXCHAR,sp)
      008B8E 54 6B            [ 1] 1958 	ld (y),a
      008B90 01 A1            [ 1] 1959 	inc (LL,sp)
      008B92 0D 26            [ 2] 1960 	incw y
      008B94 03 CC            [ 1] 1961 	clr (y)
      008B96 8C 01 A1         [ 4] 1962 	call putc 
      008B99 0A 27            [ 2] 1963 	jra readln_loop
      000B81                       1964 readln_quit:
      008B9B 65 A1            [ 1] 1965 	clr (y)
      008B9D 08 27            [ 1] 1966 	ld a,(LL,sp)
      008B9F 3D A1 04         [ 1] 1967 	ld count,a 
      000B88                       1968 	_drop VSIZE 
      008BA2 27 2A            [ 2]    1     addw sp,#VSIZE 
      008BA4 A1 12            [ 1] 1969 	ld a,#CR
      008BA6 27 06 CB         [ 4] 1970 	call putc
      008BA8 81               [ 4] 1971 	ret
                                   1972 
                           000001  1973 .if DEBUG 	
                                   1974 ;----------------------------
                                   1975 ; command interface
                                   1976 ; only 3 commands:
                                   1977 ;  'q' to resume application
                                   1978 ;  'p [addr]' to print memory values 
                                   1979 ;  's addr' to print string 
                                   1980 ;----------------------------
                                   1981 ;local variable 
                           000001  1982 	PSIZE=1
                           000001  1983 	VSIZE=1 
      000B90                       1984 cmd_itf:
      008BA8 A1 20            [ 2] 1985 	sub sp,#VSIZE 
      008BAA 2A 40 20 DE      [ 1] 1986 	clr farptr 
      008BAE 72 5F 00 17      [ 1] 1987 	clr farptr+1 
      008BAE 72 5F 00 18      [ 1] 1988 	clr farptr+2  
      008BAE                       1989 repl:
      008BAE A6 0D            [ 1] 1990 	ld a,#CR 
      008BAE 0D 02 26         [ 4] 1991 	call putc 
      008BB1 DA AE            [ 1] 1992 	ld a,#'? 
      008BB3 16 E8 CD         [ 4] 1993 	call putc
      008BB6 83 20 90 AE      [ 1] 1994 	clr in.w 
      008BBA 16 E8 9F 27      [ 1] 1995 	clr in 
      008BBE CD 6B 02         [ 4] 1996 	call readln
      008BC1 AE 16 E8 CD      [ 2] 1997 	ldw y,#tib  
      008BC5 82 5E            [ 1] 1998 	ld a,(y)
      008BC7 0F 01            [ 1] 1999 	jreq repl  
      008BC9 72 F9 01 20      [ 1] 2000 	inc in 
      008BCD BE 0F 40         [ 4] 2001 	call to_upper 
      008BCE A1 51            [ 1] 2002 	cp a,#'Q 
      008BCE 7B 02            [ 1] 2003 	jrne test_p
      000BC6                       2004 repl_exit:
      008BD0 CD 82 78 90      [ 1] 2005 	clr tib 
      008BD4 AE 16 E8 90      [ 1] 2006 	clr count 
      008BD8 7F 0F 02 20      [ 1] 2007 	clr in 
      000BD2                       2008 	_drop #VSIZE 	
      008BDC AF 01            [ 2]    1     addw sp,##VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BDD 81               [ 4] 2009 	ret  
      000BD5                       2010 invalid:
      008BDD 0D 02 27         [ 2] 2011 	ldw x,#invalid_cmd 
      008BE0 AB 0A 02         [ 4] 2012 	call puts 
      008BE3 90 5A            [ 2] 2013 	jra repl 
      000BDD                       2014 test_p:	
      008BE5 90 7F            [ 1] 2015     cp a,#'P 
      008BE7 CD 82            [ 1] 2016 	jreq mem_peek
      008BE9 68 20            [ 1] 2017     cp a,#'S 
      008BEB A0 F0            [ 1] 2018 	jrne invalid 
      008BEC                       2019 print_string:	
      008BEC A6 4F 11         [ 4] 2020 	call get_token
      008BEF 02 27            [ 1] 2021 	cp a,#TK_INTGR 
      008BF1 9A 7B            [ 1] 2022 	jrne invalid 
      008BF3 01 90 F7         [ 4] 2023 	call puts
      008BF6 0C 02 90         [ 2] 2024 	jp repl 	
      000BF2                       2025 mem_peek:
      008BF9 5C 90            [ 1] 2026 	ld a,#SPACE 
      008BFB 7F CD 82         [ 4] 2027 	call skip  	 
      008BFE 4B 20 8B 00      [ 2] 2028 	addw y,in.w 
      008C01 AE 17 38         [ 2] 2029 	ldw x,#pad 
      008C01 90 7F 7B         [ 4] 2030 	call strcpy
      008C04 02 C7 00         [ 4] 2031 	call atoi24 	
      008C07 04 5B 02         [ 1] 2032 	ld a, acc24 
      008C0A A6 0D CD         [ 1] 2033 	or a,acc16 
      008C0D 82 4B 81         [ 1] 2034 	or a,acc8 
      008C10 26 02            [ 1] 2035 	jrne 1$ 
      008C10 52 01            [ 2] 2036 	jra peek_byte  
      008C12 72 5F 00         [ 2] 2037 1$:	ldw x,acc24 
      008C15 17 72 5F         [ 2] 2038 	ldw farptr,x 
      008C18 00 18 72         [ 1] 2039 	ld a,acc8 
      008C1B 5F 00 19         [ 1] 2040 	ld farptr+2,a 
      008C1E                       2041 peek_byte:
      008C1E A6 0D CD         [ 4] 2042 	call print_farptr 
      008C21 82 4B            [ 1] 2043 	ld a,#8 
      008C23 A6 3F            [ 1] 2044 	ld (PSIZE,sp),a 
      008C25 CD               [ 1] 2045 	clrw x 
      008C26 82 4B 72         [ 4] 2046 1$:	call fetchc  
      008C29 5F               [ 2] 2047 	pushw x 
      008C2A 00 01 72         [ 1] 2048 	ld acc8,a 
      008C2D 5F               [ 1] 2049 	clrw x 
      008C2E 00 02 CD         [ 2] 2050 	ldw acc24,x 
      008C31 8B 86            [ 1] 2051 	ld a,#16+128
      008C33 90 AE 16         [ 4] 2052 	call prti24
      008C36 E8               [ 2] 2053 	popw x 
      008C37 90 F6            [ 1] 2054 	dec (PSIZE,sp)
      008C39 27 E3            [ 1] 2055 	jrne 1$ 
      008C3B 72 5C            [ 1] 2056 	ld a,#8 
      008C3D 00 02 CD         [ 1] 2057 	add a,farptr+2 
      008C40 8F C0 A1         [ 1] 2058 	ld farptr+2,a
      008C43 51               [ 1] 2059 	clr a 
      008C44 26 17 17         [ 1] 2060 	adc a,farptr+1 
      008C46 C7 00 17         [ 1] 2061 	ld farptr+1,a 
      008C46 72               [ 1] 2062 	clr a 
      008C47 5F 16 E8         [ 1] 2063 	adc a,farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C4A 72 5F 00         [ 1] 2064 	ld farptr,a 
      008C4D 04 72 5F         [ 2] 2065 	jp repl  
                                   2066 
      008C50 00 02 5B 01 81 20 63  2067 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   2068 
                                   2069 ;----------------------------
                                   2070 ; display farptr address
                                   2071 ;----------------------------
      008C55                       2072 print_farptr:
      008C55 AE 8C D3         [ 1] 2073 	ld a ,farptr+2 
      008C58 CD 82 5E         [ 1] 2074 	ld acc8,a 
      008C5B 20 C1 16         [ 2] 2075 	ldw x,farptr 
      008C5D CF 00 0B         [ 2] 2076 	ldw acc24,x 
      008C5D A1               [ 1] 2077 	clrw x 
      008C5E 50 27            [ 1] 2078 	ld a,#16 
      008C60 11 A1 53         [ 4] 2079 	call prti24
      008C63 26 F0            [ 1] 2080 	ld a,#SPACE 
      008C65 CD 01 CB         [ 4] 2081 	call putc 
      008C65 CD 8D FF         [ 4] 2082 	call putc 
      008C68 A1               [ 4] 2083 	ret
                                   2084 
                                   2085 ;------------------------------------
                                   2086 ; get byte at address farptr[X]
                                   2087 ; input:
                                   2088 ;	 farptr   address to peek
                                   2089 ;    X		  farptr index 	
                                   2090 ; output:
                                   2091 ;	 A 		  byte from memory  
                                   2092 ;    x		  incremented by 1
                                   2093 ;------------------------------------
      000C7D                       2094 fetchc: ; @C
      008C69 04 26 E9 CD      [ 5] 2095 	ldf a,([farptr],x)
      008C6D 82               [ 2] 2096 	incw x
      008C6E 5E               [ 4] 2097 	ret
                                   2098 
                                   2099 
                                   2100 ;------------------------------------
                                   2101 ; expect a number from command line 
                                   2102 ; next argument
                                   2103 ;  input:
                                   2104 ;	  none
                                   2105 ;  output:
                                   2106 ;    acc24   int24_t 
                                   2107 ;------------------------------------
      000C83                       2108 number::
      008C6F CC 8C 1E         [ 4] 2109 	call get_token
      008C72 CD 0F 4C         [ 4] 2110 	call atoi24
      008C72 A6               [ 4] 2111 	ret
                                   2112 .endif ; DEBUG 
                                   2113 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2114 
                                   2115 
                                   2116 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2117 ;; compiler routines        ;;
                                   2118 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2119 ;------------------------------------
                                   2120 ; parse quoted string 
                                   2121 ; input:
                                   2122 ;   Y 	pointer to tib 
                                   2123 ;   X   pointer to pad
                                   2124 ; output:
                                   2125 ;	pad   parsed string
                                   2126 ;   TOS  char* to pad  
                                   2127 ;------------------------------------
                           000001  2128 	PREV = 1
                           000002  2129 	CURR =2 
                           000002  2130 	VSIZE=2 
      000C8A                       2131 parse_quote: ; { -- addr }
      000C8A                       2132 	_vars VSIZE 
      008C73 20 CD            [ 2]    1     sub sp,#VSIZE 
      008C75 90               [ 1] 2133 	clr a
      008C76 78 72            [ 1] 2134 1$:	ld (PREV,sp),a 
      008C78 B9 00 01 AE      [ 1] 2135 2$:	inc in
      008C7C 17 38 CD         [ 4] 2136 	ld a,([in.w],y)
      008C7F 83 3E            [ 1] 2137 	jreq 6$
      008C81 CD 8F            [ 1] 2138 	ld (CURR,sp),a 
      008C83 CC C6            [ 1] 2139 	ld a,#'\
      008C85 00 0C            [ 1] 2140 	cp a, (PREV,sp)
      008C87 CA 00            [ 1] 2141 	jrne 3$
      008C89 0D CA            [ 1] 2142 	clr (PREV,sp)
      008C8B 00 0E            [ 1] 2143 	ld a,(CURR,sp)
      008C8D 26 02            [ 4] 2144 	callr convert_escape
      008C8F 20               [ 1] 2145 	ld (x),a 
      008C90 0C               [ 2] 2146 	incw x 
      008C91 CE 00            [ 2] 2147 	jra 2$
      000CAA                       2148 3$:
      008C93 0C CF            [ 1] 2149 	ld a,(CURR,sp)
      008C95 00 17            [ 1] 2150 	cp a,#'\'
      008C97 C6 00            [ 1] 2151 	jreq 1$
      008C99 0E C7            [ 1] 2152 	cp a,#'"
      008C9B 00 19            [ 1] 2153 	jreq 5$ 
      008C9D F7               [ 1] 2154 	ld (x),a 
      008C9D CD               [ 2] 2155 	incw x 
      008C9E 8C E2            [ 2] 2156 	jra 2$
      008CA0 A6 08 6B 01      [ 1] 2157 5$:	inc in 
      008CA4 5F               [ 1] 2158 6$: clr (x)
      008CA5 CD 8C FD         [ 2] 2159 	ldw x,#pad 
      000CC0                       2160 	_drop VSIZE
      008CA8 89 C7            [ 2]    1     addw sp,#VSIZE 
      008CAA 00 0E            [ 1] 2161 	ld a,#TK_QSTR  
      008CAC 5F               [ 4] 2162 	ret 
                                   2163 
                                   2164 ;---------------------------------------
                                   2165 ; called by parse_quote
                                   2166 ; subtitute escaped character 
                                   2167 ; by their ASCII value .
                                   2168 ; input:
                                   2169 ;   A  character following '\'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2170 ; output:
                                   2171 ;   A  substitued char or same if not valid.
                                   2172 ;---------------------------------------
      000CC5                       2173 convert_escape:
      008CAD CF               [ 2] 2174 	pushw x 
      008CAE 00 0C A6         [ 2] 2175 	ldw x,#escaped 
      008CB1 90               [ 1] 2176 1$:	cp a,(x)
      008CB2 CD 8A            [ 1] 2177 	jreq 2$
      008CB4 4E               [ 1] 2178 	tnz (x)
      008CB5 85 0A            [ 1] 2179 	jreq 3$
      008CB7 01               [ 2] 2180 	incw x 
      008CB8 26 EB            [ 2] 2181 	jra 1$
      008CBA A6 08 CB         [ 2] 2182 2$: subw x,#escaped 
      008CBD 00               [ 1] 2183 	ld a,xl 
      008CBE 19 C7            [ 1] 2184 	add a,#7
      008CC0 00               [ 2] 2185 3$:	popw x 
      008CC1 19               [ 4] 2186 	ret 
                                   2187 
      008CC2 4F C9 00 18 C7 00 18  2188 escaped: .asciz "abtnvfr"
             4F
                                   2189 
                                   2190 ;-------------------------
                                   2191 ; integer parser 
                                   2192 ; input:
                                   2193 ;   X 		point to pad 
                                   2194 ;   Y 		point to tib 
                                   2195 ;   A 	    first digit|'$' 
                                   2196 ; output:  
                                   2197 ;   pad     number string 
                                   2198 ;   X 		integer 
                                   2199 ;   A 		TK_INTGR
                                   2200 ;-------------------------
                           000001  2201 	BASE=1
                           000002  2202 	TCHAR=2 
                           000002  2203 	VSIZE=2 
      000CE2                       2204 parse_integer: ; { -- n }
      008CCA C9 00            [ 1] 2205 	push #0 ; TCHAR 
      008CCC 17 C7            [ 1] 2206 	cp a,#'$
      008CCE 00 17            [ 1] 2207 	jreq 1$ 
      008CD0 CC 8C            [ 1] 2208 	push #10 ; BASE=10 
      008CD2 1E 6E            [ 2] 2209 	jra 2$ 
      008CD4 6F 74            [ 1] 2210 1$: push #16  ; BASE=16
      008CD6 20               [ 1] 2211 2$:	ld (x),a 
      008CD7 61               [ 2] 2212 	incw x 
      008CD8 20 63 6F 6D      [ 1] 2213 	inc in 
      008CDC 6D 61 6E         [ 4] 2214 	ld a,([in.w],y)
      008CDF 64 0A 00         [ 4] 2215 	call to_upper 
      008CE2 6B 02            [ 1] 2216 	ld (TCHAR,sp),a 
      008CE2 C6 00 19         [ 4] 2217 	call is_digit 
      008CE5 C7 00            [ 1] 2218 	jrc 2$
      008CE7 0E CE            [ 1] 2219 	ld a,#16 
      008CE9 00 17            [ 1] 2220 	cp a,(BASE,sp)
      008CEB CF 00            [ 1] 2221 	jrne 3$ 
      008CED 0C 5F            [ 1] 2222 	ld a,(TCHAR,sp)
      008CEF A6 10            [ 1] 2223 	cp a,#'A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008CF1 CD 8A            [ 1] 2224 	jrmi 3$ 
      008CF3 4E A6            [ 1] 2225 	cp a,#'G 
      008CF5 20 CD            [ 1] 2226 	jrmi 2$ 
      008CF7 82               [ 1] 2227 3$:	clr (x)
      008CF8 4B CD 82         [ 4] 2228 	call atoi24
      008CFB 4B 81 0C         [ 2] 2229 	ldw x,acc16 
      008CFD A6 04            [ 1] 2230 	ld a,#TK_INTGR
      000D1A                       2231 	_drop VSIZE  
      008CFD 92 AF            [ 2]    1     addw sp,#VSIZE 
      008CFF 00               [ 4] 2232 	ret 	
                                   2233 
                                   2234 ;-------------------------
                                   2235 ; binary integer parser 
                                   2236 ; input:
                                   2237 ;   X 		point to pad 
                                   2238 ;   Y 		point to tib 
                                   2239 ;   A 	    '%' 
                                   2240 ; output:  
                                   2241 ;   pad     number string 
                                   2242 ;   X 		integer 
                                   2243 ;   A 		TK_INTGR
                                   2244 ;   TOS     integer 
                                   2245 ;-------------------------
                           000001  2246 	BINARY=1
                           000002  2247 	VSIZE=2
      000D1D                       2248 parse_binary: ; { -- n }
      008D00 17 5C            [ 1] 2249 	push #0
      008D02 81 00            [ 1] 2250 	push #0
      008D03 F7               [ 1] 2251 1$: ld (x),a 
      008D03 CD               [ 2] 2252 	incw x 
      008D04 8D FF CD 8F      [ 1] 2253 	inc in 
      008D08 CC 81 00         [ 4] 2254 	ld a,([in.w],y)
      008D0A A1 30            [ 1] 2255 	cp a,#'0 
      008D0A 52 02            [ 1] 2256 	jreq 2$
      008D0C 4F 6B            [ 1] 2257 	cp a,#'1 
      008D0E 01 72            [ 1] 2258 	jreq 2$ 
      008D10 5C 00            [ 2] 2259 	jra bin_exit 
      008D12 02 91            [ 1] 2260 2$: sub a,#'0	
      008D14 D6               [ 1] 2261 	rrc a 
      008D15 01 27            [ 1] 2262 	rlc (BINARY+1,sp)
      008D17 24 6B            [ 1] 2263 	rlc (BINARY,sp)
      008D19 02 A6            [ 2] 2264 	jra 1$  
      000D3D                       2265 bin_exit:
      008D1B 5C               [ 1] 2266 	clr (x)
      008D1C 11 01            [ 2] 2267 	ldw x,(BINARY,sp)
      008D1E 26 0A            [ 1] 2268 	ld a,#TK_INTGR 	
      000D42                       2269 	_drop VSIZE 
      008D20 0F 01            [ 2]    1     addw sp,#VSIZE 
      008D22 7B               [ 4] 2270 	ret
                                   2271 
                                   2272 ;---------------------------
                                   2273 ;  token begin with a letter,
                                   2274 ;  is keyword or variable. 	
                                   2275 ; input:
                                   2276 ;   X 		point to pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2277 ;   Y 		point to text
                                   2278 ;   A 	    first letter  
                                   2279 ; output:
                                   2280 ;   X		exec_addr|var_addr 
                                   2281 ;   A 		TK_CMD 
                                   2282 ;   pad 	keyword|var_name  
                                   2283 ;   TOS     exec_addr|var_addr 
                                   2284 ;--------------------------  
      000D45                       2285 parse_keyword: ; { -- exec_addr|var_addr}
      008D23 02 AD 1F         [ 4] 2286 	call to_upper 
      008D26 F7               [ 1] 2287 	ld (x),a 
      008D27 5C               [ 2] 2288 	incw x 
      008D28 20 E5 00 01      [ 1] 2289 	inc in 
      008D2A 91 D6 00         [ 4] 2290 	ld a,([in.w],y)
      008D2A 7B 02 A1         [ 4] 2291 	call is_alpha 
      008D2D 5C 27            [ 1] 2292 	jrc parse_keyword 
      008D2F DD               [ 1] 2293 1$: clr (x)
      008D30 A1 22 27 04      [ 1] 2294 	tnz pad+1 
      008D34 F7 5C            [ 1] 2295 	jrne 2$
                                   2296 ; one letter variable name 
      008D36 20 D7 72         [ 1] 2297 	ld a,pad 
      008D39 5C 00            [ 1] 2298 	sub a,#'A 
      008D3B 02               [ 1] 2299 	sll a 
      008D3C 7F               [ 1] 2300 	push a 
      008D3D AE 17            [ 1] 2301 	push #0
      008D3F 38 5B 02         [ 2] 2302 	ldw x,#vars 
      008D42 A6 0A 81         [ 2] 2303 	addw x,(1,sp) ; X=var address 
      008D45                       2304 	_drop 2 
      008D45 89 AE            [ 2]    1     addw sp,#2 
      008D47 8D 5A            [ 1] 2305 	ld a,#TK_VAR 
      008D49 F1 27            [ 2] 2306 	jra 4$ 
      000D72                       2307 2$: ; check for keyword, otherwise syntax error.
      000D72                       2308 	_ldx_dict kword_dict
      008D4B 06 7D 27         [ 2]    1     ldw x,#kword_dict+2
      008D4E 09 5C 20         [ 4] 2309 	call search_dict
      008D51 F7               [ 1] 2310 	tnz a
      008D52 1D 8D            [ 1] 2311 	jrne 4$ 
      008D54 5A 9F AB         [ 2] 2312 	jp syntax_error
      008D57 07               [ 4] 2313 4$:	ret  	
                                   2314 
                                   2315 
                                   2316 ;------------------------------------
                                   2317 ; scan text for next token
                                   2318 ; move token in 'pad'
                                   2319 ; input: 
      000D7F                       2320 	none: 
                                   2321 ; use:
                                   2322 ;	Y   pointer to text
                                   2323 ;   X	pointer to pad 
                                   2324 ;   in.w   index in text buffer
                                   2325 ; output:
                                   2326 ;   A       token attribute 
                                   2327 ;   pad 	token as .asciz
                                   2328 ;   X 		token value   
                                   2329 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2330 	; use to check special character 
                                   2331 	.macro _case c t  
                                   2332 	ld a,#c 
                                   2333 	cp a,(TCHAR,sp) 
                                   2334 	jrne t
                                   2335 	.endm 
                                   2336 
                           000001  2337 	TCHAR=1
                           000002  2338 	ATTRIB=2 
                           000002  2339 	VSIZE=2
      000D7F                       2340 get_token: 
      008D58 85 81 61 62      [ 2] 2341 	ldw y,#tib    	
      008D5C 74 6E 76         [ 1] 2342 	ld a,in 
      008D5F 66 72 00         [ 1] 2343 	cp a,count 
      008D62 2B 03            [ 1] 2344 	jrmi 1$
      008D62 4B 00            [ 1] 2345 	ld a,#TK_NONE 
      008D64 A1               [ 4] 2346 	ret 
      000D8E                       2347 1$:	
      000D8E                       2348 	_vars VSIZE
      008D65 24 27            [ 2]    1     sub sp,#VSIZE 
      008D67 04 4B 0A         [ 2] 2349 	ldw x, #pad
      008D6A 20 02            [ 1] 2350 	ld a,#SPACE
      008D6C 4B 10 F7         [ 4] 2351 	call skip
      008D6F 5C 72 5C 00 02   [ 1] 2352 	mov in.saved,in 
      008D74 91 D6 01         [ 4] 2353 	ld a,([in.w],y)
      008D77 CD 8F            [ 1] 2354 	jrne str_tst
      008D79 C0 6B 02 CD      [ 1] 2355 	clr pad 
      008D7D 8F B7 25         [ 2] 2356 	jp token_exit ; end of line 
                                   2357 
      000DA9                       2358 str_tst: ; check for quoted string  	
      008D80 ED A6 10         [ 4] 2359 	call to_upper 
      008D83 11 01            [ 1] 2360 	ld (TCHAR,sp),a 
      000DAE                       2361 	_case '"' nbr_tst
      008D85 26 0A            [ 1]    1 	ld a,#'"' 
      008D87 7B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D89 A1 41            [ 1]    3 	jrne nbr_tst
      008D8B 2B 04 A1         [ 4] 2362 	call parse_quote
      008D8E 47 2B DD         [ 2] 2363 	jp token_exit
      000DBA                       2364 nbr_tst: ; check for number 
      008D91 7F CD            [ 1] 2365 	ld a,#'$'
      008D93 8F CC            [ 1] 2366 	cp a,(TCHAR,sp) 
      008D95 CE 00            [ 1] 2367 	jreq 1$
      008D97 0D A6            [ 1] 2368 	ld a,#'&
      008D99 04 5B            [ 1] 2369 	cp a,(TCHAR,sp)
      008D9B 02 81            [ 1] 2370 	jrne 0$
      008D9D CD 0D 1D         [ 4] 2371 	call parse_binary ; expect binary integer 
      008D9D 4B 00 4B         [ 2] 2372 	jp token_exit 
      008DA0 00 F7            [ 1] 2373 0$:	ld a,(TCHAR,sp)
      008DA2 5C 72 5C         [ 4] 2374 	call is_digit
      008DA5 00 02            [ 1] 2375 	jrnc 3$
      008DA7 91 D6 01         [ 4] 2376 1$:	call parse_integer 
      008DAA A1 30 27         [ 2] 2377 	jp token_exit 
      000DD9                       2378 3$: 
      000DD9                       2379 	_case '(' bkslsh_tst 
      008DAD 06 A1            [ 1]    1 	ld a,#'(' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DAF 31 27            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB1 02 20            [ 1]    3 	jrne bkslsh_tst
      008DB3 09 A0            [ 1] 2380 	ld a,#TK_LPAREN
      008DB5 30 46 09         [ 2] 2381 	jp token_char   	
      000DE4                       2382 bkslsh_tst: ; character token 
      000DE4                       2383 	_case '\',rparnt_tst
      008DB8 02 09            [ 1]    1 	ld a,#'\' 
      008DBA 01 20            [ 1]    2 	cp a,(TCHAR,sp) 
      008DBC E4 18            [ 1]    3 	jrne rparnt_tst
      008DBD 7B 01            [ 1] 2384 	ld a,(TCHAR,sp)
      008DBD 7F               [ 1] 2385 	ld (x),a 
      008DBE 1E               [ 2] 2386 	incw x 
      008DBF 01 A6 04 5B      [ 1] 2387 	inc in 
      008DC3 02 81 00         [ 4] 2388 	ld a,([in.w],y)
      008DC5 F7               [ 1] 2389 	ld (x),a 
      008DC5 CD               [ 2] 2390 	incw x 
      008DC6 8F C0 F7 5C      [ 1] 2391 	inc in  
      008DCA 72               [ 1] 2392 	clr (x) 
      008DCB 5C               [ 1] 2393 	ld xl,a 
      008DCC 00 02            [ 1] 2394 	ld a,#TK_CHAR 
      008DCE 91 D6 01         [ 2] 2395 	jp token_exit 
      000E02                       2396 rparnt_tst:		
      000E02                       2397 	_case ')' colon_tst 
      008DD1 CD 85            [ 1]    1 	ld a,#')' 
      008DD3 A3 25            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD5 EF 7F            [ 1]    3 	jrne colon_tst
      008DD7 72 5D            [ 1] 2398 	ld a,#TK_RPAREN 
      008DD9 17 39 26         [ 2] 2399 	jp token_char 
      000E0D                       2400 colon_tst:
      000E0D                       2401 	_case ':' comma_tst 
      008DDC 15 C6            [ 1]    1 	ld a,#':' 
      008DDE 17 38            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE0 A0 41            [ 1]    3 	jrne comma_tst
      008DE2 48 88            [ 1] 2402 	ld a,#TK_COLON 
      008DE4 4B 00 AE         [ 2] 2403 	jp token_char 
      000E18                       2404 comma_tst:
      000E18                       2405 	_case COMMA sharp_tst 
      008DE7 00 29            [ 1]    1 	ld a,#COMMA 
      008DE9 72 FB            [ 1]    2 	cp a,(TCHAR,sp) 
      008DEB 01 5B            [ 1]    3 	jrne sharp_tst
      008DED 02 A6            [ 1] 2406 	ld a,#TK_COMMA
      008DEF 05 20 0C         [ 2] 2407 	jp token_char
      008DF2                       2408 sharp_tst:
      000E23                       2409 	_case SHARP dash_tst 
      008DF2 AE A7            [ 1]    1 	ld a,#SHARP 
      008DF4 BF CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF6 92 33            [ 1]    3 	jrne dash_tst
      008DF8 4D 26            [ 1] 2410 	ld a,#TK_SHARP
      008DFA 03 CC 88         [ 2] 2411 	jp token_char  	 	 
      000E2E                       2412 dash_tst: 	
      000E2E                       2413 	_case '-' at_tst 
      008DFD 38 81            [ 1]    1 	ld a,#'-' 
      008DFF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DFF 26 05            [ 1]    3 	jrne at_tst
      008DFF 90 AE            [ 1] 2414 	ld a,#TK_MINUS  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E01 16 E8 C6         [ 2] 2415 	jp token_char 
      000E39                       2416 at_tst:
      000E39                       2417 	_case '@' qmark_tst 
      008E04 00 02            [ 1]    1 	ld a,#'@' 
      008E06 C1 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008E08 04 2B            [ 1]    3 	jrne qmark_tst
      008E0A 03 A6            [ 1] 2418 	ld a,#TK_ARRAY 
      008E0C 00 81 24         [ 2] 2419 	jp token_char
      008E0E                       2420 qmark_tst:
      000E44                       2421 	_case '?' tick_tst 
      008E0E 52 02            [ 1]    1 	ld a,#'?' 
      008E10 AE 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008E12 38 A6            [ 1]    3 	jrne tick_tst
      008E14 20 CD            [ 1] 2422 	ld a,(TCHAR,sp)
      008E16 90               [ 1] 2423 	ld (x),a 
      008E17 78               [ 2] 2424 	incw x 
      008E18 55               [ 1] 2425 	clr (x)
      008E19 00 02 00 03      [ 1] 2426 	inc in 
      008E1D 91 D6            [ 1] 2427 	ld a,#TK_CMD 
      008E1F 01 26 07         [ 2] 2428 	ldw x,#print 
      008E22 72 5F 17         [ 2] 2429 	jp token_exit
      000E5B                       2430 tick_tst: ; ignore comment 
      000E5B                       2431 	_case TICK plus_tst 
      008E25 38 CC            [ 1]    1 	ld a,#TICK 
      008E27 8F B4            [ 1]    2 	cp a,(TCHAR,sp) 
      008E29 26 0C            [ 1]    3 	jrne plus_tst
      008E29 CD 8F C0 6B      [ 1] 2432 	inc in 
      008E2D 01 A6            [ 1] 2433 	ld a,#TK_CMD 
      008E2F 22 11 01         [ 2] 2434 	ldw x,#rem 
      008E32 26 06 CD         [ 2] 2435 	jp token_exit 
      000E6D                       2436 plus_tst:
      000E6D                       2437 	_case '+' star_tst 
      008E35 8D 0A            [ 1]    1 	ld a,#'+' 
      008E37 CC 8F            [ 1]    2 	cp a,(TCHAR,sp) 
      008E39 B4 05            [ 1]    3 	jrne star_tst
      008E3A A6 10            [ 1] 2438 	ld a,#TK_PLUS  
      008E3A A6 24 11         [ 2] 2439 	jp token_char 
      000E78                       2440 star_tst:
      000E78                       2441 	_case '*' slash_tst 
      008E3D 01 27            [ 1]    1 	ld a,#'*' 
      008E3F 13 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008E41 26 11            [ 1]    3 	jrne slash_tst
      008E43 01 26            [ 1] 2442 	ld a,#TK_MULT 
      008E45 06 CD 8D         [ 2] 2443 	jp token_char 
      000E83                       2444 slash_tst: 
      000E83                       2445 	_case '/' prcnt_tst 
      008E48 9D CC            [ 1]    1 	ld a,#'/' 
      008E4A 8F B4            [ 1]    2 	cp a,(TCHAR,sp) 
      008E4C 7B 01            [ 1]    3 	jrne prcnt_tst
      008E4E CD 8F            [ 1] 2446 	ld a,#TK_DIV 
      008E50 B7 24 06         [ 2] 2447 	jp token_char 
      000E8E                       2448 prcnt_tst:
      000E8E                       2449 	_case '%' eql_tst 
      008E53 CD 8D            [ 1]    1 	ld a,#'%' 
      008E55 62 CC            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E57 8F B4            [ 1]    3 	jrne eql_tst
      008E59 A6 22            [ 1] 2450 	ld a,#TK_MOD
      008E59 A6 28 11         [ 2] 2451 	jp token_char  
                                   2452 ; 1 or 2 character tokens 	
      000E99                       2453 eql_tst:
      000E99                       2454 	_case '=' gt_tst 		
      008E5C 01 26            [ 1]    1 	ld a,#'=' 
      008E5E 05 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008E60 0B CC            [ 1]    3 	jrne gt_tst
      008E62 8F A4            [ 1] 2455 	ld a,#TK_EQUAL
      008E64 CC 0F 24         [ 2] 2456 	jp token_char 
      000EA4                       2457 gt_tst:
      000EA4                       2458 	_case '>' lt_tst 
      008E64 A6 5C            [ 1]    1 	ld a,#'>' 
      008E66 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E68 26 18            [ 1]    3 	jrne lt_tst
      008E6A 7B 01            [ 1] 2459 	ld a,#TK_GT 
      008E6C F7 5C            [ 1] 2460 	ld (ATTRIB,sp),a 
      008E6E 72 5C 00 02      [ 1] 2461 	inc in 
      008E72 91 D6 01         [ 4] 2462 	ld a,([in.w],y)
      008E75 F7 5C            [ 1] 2463 	cp a,#'=
      008E77 72 5C            [ 1] 2464 	jrne 1$
      008E79 00 02            [ 1] 2465 	ld a,(TCHAR,sp)
      008E7B 7F               [ 1] 2466 	ld (x),a
      008E7C 97               [ 2] 2467 	incw x 
      008E7D A6 03            [ 1] 2468 	ld a,#'=
      008E7F CC 8F            [ 1] 2469 	ld (TCHAR,sp),a 
      008E81 B4 33            [ 1] 2470 	ld a,#TK_GE 
      008E82 20 5F            [ 2] 2471 	jra token_char  
      008E82 A6 29            [ 1] 2472 1$: cp a,#'<
      008E84 11 01            [ 1] 2473 	jrne 2$
      008E86 26 05            [ 1] 2474 	ld a,(TCHAR,sp)
      008E88 A6               [ 1] 2475 	ld (x),a
      008E89 0C               [ 2] 2476 	incw x 
      008E8A CC 8F            [ 1] 2477 	ld a,#'<	
      008E8C A4 01            [ 1] 2478 	ld (TCHAR,sp),a 
      008E8D A6 35            [ 1] 2479 	ld a,#TK_NE 
      008E8D A6 3A            [ 2] 2480 	jra token_char 
      008E8F 11 01 26 05      [ 1] 2481 2$: dec in
      008E93 A6 01            [ 1] 2482 	ld a,(ATTRIB,sp)
      008E95 CC 8F            [ 2] 2483 	jra token_char 
      000EDD                       2484 lt_tst:
      000EDD                       2485 	_case '<' other
      008E97 A4 3C            [ 1]    1 	ld a,#'<' 
      008E98 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E98 A6 2C            [ 1]    3 	jrne other
      008E9A 11 01            [ 1] 2486 	ld a,#TK_LT 
      008E9C 26 05            [ 1] 2487 	ld (ATTRIB,sp),a 
      008E9E A6 0D CC 8F      [ 1] 2488 	inc in 
      008EA2 A4 D6 00         [ 4] 2489 	ld a,([in.w],y)
      008EA3 A1 3D            [ 1] 2490 	cp a,#'=
      008EA3 A6 23            [ 1] 2491 	jrne 1$
      008EA5 11 01            [ 1] 2492 	ld a,(TCHAR,sp)
      008EA7 26               [ 1] 2493 	ld (x),a 
      008EA8 05 A6            [ 1] 2494 	ld a,#'=
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008EAA 0E CC            [ 1] 2495 	ld (TCHAR,sp),a 
      008EAC 8F A4            [ 1] 2496 	ld a,#TK_LE 
      008EAE 20 27            [ 2] 2497 	jra token_char 
      008EAE A6 2D            [ 1] 2498 1$: cp a,#'>
      008EB0 11 01            [ 1] 2499 	jrne 2$
      008EB2 26 05            [ 1] 2500 	ld a,(TCHAR,sp)
      008EB4 A6               [ 1] 2501 	ld (x),a 
      008EB5 11               [ 2] 2502 	incw x 
      008EB6 CC 8F            [ 1] 2503 	ld a,#'>
      008EB8 A4 01            [ 1] 2504 	ld (TCHAR,sp),a 
      008EB9 A6 35            [ 1] 2505 	ld a,#TK_NE 
      008EB9 A6 40            [ 2] 2506 	jra token_char 
      008EBB 11 01 26 05      [ 1] 2507 2$: dec in 
      008EBF A6 02            [ 1] 2508 	ld a,(ATTRIB,sp)
      008EC1 CC 8F            [ 2] 2509 	jra token_char 	
      000F15                       2510 other: ; not a special character 	 
      008EC3 A4 01            [ 1] 2511 	ld a,(TCHAR,sp)
      008EC4 CD 05 23         [ 4] 2512 	call is_alpha 
      008EC4 A6 3F            [ 1] 2513 	jrc 30$ 
      008EC6 11 01 26         [ 2] 2514 	jp syntax_error 
      000F1F                       2515 30$: 
      008EC9 11 7B 01         [ 4] 2516 	call parse_keyword
      008ECC F7 5C            [ 2] 2517 	jra token_exit 
      000F24                       2518 token_char:
      008ECE 7F 72            [ 1] 2519 	ld (ATTRIB,sp),a 
      008ED0 5C 00            [ 1] 2520 	ld a,(TCHAR,sp)
      008ED2 02               [ 1] 2521 	ld (x),a 
      008ED3 A6               [ 2] 2522 	incw x 
      008ED4 06               [ 1] 2523 	clr(x)
      008ED5 AE 96 DA CC      [ 1] 2524 	inc in 
      008ED9 8F B4            [ 1] 2525 	ld a,(ATTRIB,sp)
      008EDB AE 17 38         [ 2] 2526 	ldw x,#pad 
      000F34                       2527 token_exit:
      000F34                       2528 	_drop VSIZE 
      008EDB A6 27            [ 2]    1     addw sp,#VSIZE 
      008EDD 11               [ 4] 2529 	ret
                                   2530 
                                   2531 ;------------------------------------
                                   2532 ; check if character in {'0'..'9'}
                                   2533 ; input:
                                   2534 ;    A  character to test
                                   2535 ; output:
                                   2536 ;    Carry  0 not digit | 1 digit
                                   2537 ;------------------------------------
      000F37                       2538 is_digit:
      008EDE 01 26            [ 1] 2539 	cp a,#'0
      008EE0 0C 72            [ 1] 2540 	jrc 1$
      008EE2 5C 00            [ 1] 2541     cp a,#'9+1
      008EE4 02               [ 1] 2542 	ccf 
      008EE5 A6               [ 1] 2543 1$:	ccf 
      008EE6 06               [ 4] 2544     ret
                                   2545 
                                   2546 ;------------------------------------
                                   2547 ; convert alpha to uppercase
                                   2548 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2549 ;    a  character to convert
                                   2550 ; output:
                                   2551 ;    a  uppercase character
                                   2552 ;------------------------------------
      000F40                       2553 to_upper::
      008EE7 AE 97            [ 1] 2554 	cp a,#'a
      008EE9 C9 CC            [ 1] 2555 	jrpl 1$
      008EEB 8F               [ 4] 2556 0$:	ret
      008EEC B4 7A            [ 1] 2557 1$: cp a,#'z	
      008EED 22 FB            [ 1] 2558 	jrugt 0$
      008EED A6 2B            [ 1] 2559 	sub a,#32
      008EEF 11               [ 4] 2560 	ret
                                   2561 	
                                   2562 ;------------------------------------
                                   2563 ; convert pad content in integer
                                   2564 ; input:
                                   2565 ;    pad		.asciz to convert
                                   2566 ; output:
                                   2567 ;    acc24      int24_t
                                   2568 ;------------------------------------
                                   2569 	; local variables
                           000001  2570 	SIGN=1 ; 1 byte, 
                           000002  2571 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2572 	TEMP=3 ; 1 byte, temporary storage
                           000003  2573 	VSIZE=3 ; 3 bytes reserved for local storage
      000F4C                       2574 atoi24:
      008EF0 01               [ 2] 2575 	pushw x ;save x
      008EF1 26 05            [ 2] 2576 	sub sp,#VSIZE
                                   2577 	; acc24=0 
      008EF3 A6 10 CC 8F      [ 1] 2578 	clr acc24    
      008EF7 A4 5F 00 0C      [ 1] 2579 	clr acc16
      008EF8 72 5F 00 0D      [ 1] 2580 	clr acc8 
      008EF8 A6 2A 11         [ 1] 2581 	ld a, pad 
      008EFB 01 26            [ 1] 2582 	jreq atoi_exit
      008EFD 05 A6            [ 1] 2583 	clr (SIGN,sp)
      008EFF 20 CC            [ 1] 2584 	ld a,#10
      008F01 8F A4            [ 1] 2585 	ld (BASE,sp),a ; default base decimal
      008F03 AE 17 38         [ 2] 2586 	ldw x,#pad ; pointer to string to convert
      008F03 A6               [ 1] 2587 	ld a,(x)
      008F04 2F 11            [ 1] 2588 	jreq 9$  ; completed if 0
      008F06 01 26            [ 1] 2589 	cp a,#'-
      008F08 05 A6            [ 1] 2590 	jrne 1$
      008F0A 21 CC            [ 1] 2591 	cpl (SIGN,sp)
      008F0C 8F A4            [ 2] 2592 	jra 2$
      008F0E A1 24            [ 1] 2593 1$: cp a,#'$
      008F0E A6 25            [ 1] 2594 	jrne 3$
      008F10 11 01            [ 1] 2595 	ld a,#16
      008F12 26 05            [ 1] 2596 	ld (BASE,sp),a
      008F14 A6               [ 2] 2597 2$:	incw x
      008F15 22               [ 1] 2598 	ld a,(x)
      000F7E                       2599 3$:	
      008F16 CC 8F            [ 1] 2600 	cp a,#'a
      008F18 A4 02            [ 1] 2601 	jrmi 4$
      008F19 A0 20            [ 1] 2602 	sub a,#32
      008F19 A6 3D            [ 1] 2603 4$:	cp a,#'0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008F1B 11 01            [ 1] 2604 	jrmi 9$
      008F1D 26 05            [ 1] 2605 	sub a,#'0
      008F1F A6 32            [ 1] 2606 	cp a,#10
      008F21 CC 8F            [ 1] 2607 	jrmi 5$
      008F23 A4 07            [ 1] 2608 	sub a,#7
      008F24 11 02            [ 1] 2609 	cp a,(BASE,sp)
      008F24 A6 3E            [ 1] 2610 	jrpl 9$
      008F26 11 01            [ 1] 2611 5$:	ld (TEMP,sp),a
      008F28 26 33            [ 1] 2612 	ld a,(BASE,sp)
      008F2A A6 31 6B         [ 4] 2613 	call mulu24_8
      008F2D 02 72            [ 1] 2614 	ld a,(TEMP,sp)
      008F2F 5C 00 02         [ 1] 2615 	add a,acc24+2
      008F32 91 D6 01         [ 1] 2616 	ld acc24+2,a
      008F35 A1               [ 1] 2617 	clr a
      008F36 3D 26 0C         [ 1] 2618 	adc a,acc24+1
      008F39 7B 01 F7         [ 1] 2619 	ld acc24+1,a
      008F3C 5C               [ 1] 2620 	clr a
      008F3D A6 3D 6B         [ 1] 2621 	adc a,acc24
      008F40 01 A6 33         [ 1] 2622 	ld acc24,a
      008F43 20 5F            [ 2] 2623 	jra 2$
      008F45 A1 3C            [ 1] 2624 9$:	tnz (SIGN,sp)
      008F47 26 0C            [ 1] 2625     jreq atoi_exit
      008F49 7B 01 F7         [ 4] 2626     call neg_acc24
      000FBA                       2627 atoi_exit: 
      008F4C 5C A6            [ 2] 2628 	addw sp,#VSIZE
      008F4E 3C               [ 2] 2629 	popw x ; restore x
      008F4F 6B               [ 4] 2630 	ret
                                   2631 
                                   2632 ;--------------------------------------
                                   2633 ; unsigned multiply uint24_t by uint8_t
                                   2634 ; use to convert numerical string to uint24_t
                                   2635 ; input:
                                   2636 ;	acc24	uint24_t 
                                   2637 ;   A		uint8_t
                                   2638 ; output:
                                   2639 ;   acc24   A*acc24
                                   2640 ;-------------------------------------
                                   2641 ; local variables offset  on sp
                           000003  2642 	U8   = 3   ; A pushed on stack
                           000002  2643 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2644 	OVFH = 1  ; multiplication overflow high byte
                           000003  2645 	VSIZE = 3
      000FBE                       2646 mulu24_8:
      008F50 01               [ 2] 2647 	pushw x    ; save X
                                   2648 	; local variables
      008F51 A6               [ 1] 2649 	push a     ; U8
      008F52 35               [ 1] 2650 	clrw x     ; initialize overflow to 0
      008F53 20               [ 2] 2651 	pushw x    ; multiplication overflow
                                   2652 ; multiply low byte.
      008F54 4F 72 5A         [ 1] 2653 	ld a,acc24+2
      008F57 00               [ 1] 2654 	ld xl,a
      008F58 02 7B            [ 1] 2655 	ld a,(U8,sp)
      008F5A 02               [ 4] 2656 	mul x,a
      008F5B 20               [ 1] 2657 	ld a,xl
      008F5C 47 00 0D         [ 1] 2658 	ld acc24+2,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008F5D 9E               [ 1] 2659 	ld a, xh
      008F5D A6 3C            [ 1] 2660 	ld (OVFL,sp),a
                                   2661 ; multipy middle byte
      008F5F 11 01 26         [ 1] 2662 	ld a,acc24+1
      008F62 32               [ 1] 2663 	ld xl,a
      008F63 A6 34            [ 1] 2664 	ld a, (U8,sp)
      008F65 6B               [ 4] 2665 	mul x,a
                                   2666 ; add overflow to this partial product
      008F66 02 72 5C         [ 2] 2667 	addw x,(OVFH,sp)
      008F69 00               [ 1] 2668 	ld a,xl
      008F6A 02 91 D6         [ 1] 2669 	ld acc24+1,a
      008F6D 01               [ 1] 2670 	clr a
      008F6E A1 3D            [ 1] 2671 	adc a,#0
      008F70 26 0B            [ 1] 2672 	ld (OVFH,sp),a
      008F72 7B               [ 1] 2673 	ld a,xh
      008F73 01 F7            [ 1] 2674 	ld (OVFL,sp),a
                                   2675 ; multiply most signficant byte	
      008F75 A6 3D 6B         [ 1] 2676 	ld a, acc24
      008F78 01               [ 1] 2677 	ld xl, a
      008F79 A6 36            [ 1] 2678 	ld a, (U8,sp)
      008F7B 20               [ 4] 2679 	mul x,a
      008F7C 27 A1 3E         [ 2] 2680 	addw x, (OVFH,sp)
      008F7F 26               [ 1] 2681 	ld a, xl
      008F80 0C 7B 01         [ 1] 2682 	ld acc24,a
      008F83 F7 5C            [ 2] 2683     addw sp,#VSIZE
      008F85 A6               [ 2] 2684 	popw x
      008F86 3E               [ 4] 2685 	ret
                                   2686 
                                   2687 ;------------------------------------
                                   2688 ; skip character c in text starting from 'in'
                                   2689 ; input:
                                   2690 ;	 y 		point to text buffer
                                   2691 ;    a 		character to skip
                                   2692 ; output:  
                                   2693 ;	'in' ajusted to new position
                                   2694 ;------------------------------------
                           000001  2695 	C = 1 ; local var
      000FF8                       2696 skip:
      008F87 6B               [ 1] 2697 	push a
      008F88 01 A6 35         [ 4] 2698 1$:	ld a,([in.w],y)
      008F8B 20 17            [ 1] 2699 	jreq 2$
      008F8D 72 5A            [ 1] 2700 	cp a,(C,sp)
      008F8F 00 02            [ 1] 2701 	jrne 2$
      008F91 7B 02 20 0F      [ 1] 2702 	inc in
      008F95 20 F1            [ 2] 2703 	jra 1$
      001008                       2704 2$: _drop 1 
      008F95 7B 01            [ 2]    1     addw sp,#1 
      008F97 CD               [ 4] 2705 	ret
                                   2706 	
                                   2707 ;------------------------------
                                   2708 ; restore 'in.w' variable to 
                                   2709 ; its value before last call
                                   2710 ; to get_token.
                                   2711 ;------------------------------
      00100B                       2712 unget_token:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F98 85 A3 25 03 CC   [ 1] 2713 	mov in,in.saved
      008F9D 88               [ 4] 2714 	ret 
                                   2715 
                                   2716 
                                   2717 ;******************************
                                   2718 ;  data stack manipulation
                                   2719 ;*****************************
                                   2720 ;----------------------	
                                   2721 ; push X on data stack 
                                   2722 ; input:
                                   2723 ;	X 
                                   2724 ; output:
                                   2725 ;	none 
                                   2726 ;----------------------	
      001011                       2727 dpush:
      001011                       2728     _dp_down
      008F9E 38 5A 00 1D      [ 1]    1     dec dstkptr+1 
      008F9F 72 5A 00 1D      [ 1]    2     dec dstkptr+1
      008F9F CD 8D C5 20      [ 5] 2729     ldw [dstkptr],x  
      008FA3 10               [ 4] 2730 	ret 
                                   2731 
                                   2732 
                                   2733 ;----------------------	
                                   2734 ; pop data stack in X 
                                   2735 ; input:
                                   2736 ;	none
                                   2737 ; output:
                                   2738 ;	X   
                                   2739 ;----------------------	
      008FA4                       2740 dpop: 
      008FA4 6B 02 7B 01      [ 5] 2741     ldw x, [dstkptr]
      001022                       2742 	_dp_up
      008FA8 F7 5C 7F 72      [ 1]    1     inc dstkptr+1
      008FAC 5C 00 02 7B      [ 1]    2     inc dstkptr+1
      008FB0 02               [ 4] 2743 	ret 
                                   2744 
                                   2745 ;-----------------------------
                                   2746 ; swap top 2 elements of dstack
                                   2747 ;  {n1 n2 -- n2 n1 }
                                   2748 ;-----------------------------
      00102B                       2749 dswap:
      008FB1 AE 17 38 1C      [ 5] 2750 	ldw x,[dstkptr]
      008FB4 89               [ 2] 2751 	pushw x 
      008FB4 5B 02 81         [ 2] 2752 	ldw x,#2 
      008FB7 72 DE 00 1C      [ 5] 2753 	ldw x,([dstkptr],x) 
      008FB7 A1 30 25 03      [ 5] 2754 	ldw [dstkptr],x 
      008FBB A1 3A 8C         [ 2] 2755 	ldw x,#2
      008FBE 8C 81            [ 2] 2756 	popw y 
      008FC0 72 DF 00 1C      [ 5] 2757 	ldw ([dstkptr],x),y 
      008FC0 A1               [ 4] 2758 	ret
                                   2759 
                                   2760 ;-----------------------------
                                   2761 ; drop TOS 
                                   2762 ;-----------------------------
      001045                       2763 ddrop: ; { n -- }
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      001045                       2764 	_dp_up 
      008FC1 61 2A 01 81      [ 1]    1     inc dstkptr+1
      008FC5 A1 7A 22 FB      [ 1]    2     inc dstkptr+1
      008FC9 A0               [ 4] 2765 	ret
                                   2766 	
                                   2767 ;-----------------------------
                                   2768 ; duplicate TOS 
                                   2769 ;  dstack: { ix...n -- ix...n n }
                                   2770 ;-----------------------------
      00104E                       2771 ddup:
                                   2772 ;	ldw x,[dstkptr]
                                   2773 ;	_dp_down
                                   2774 ;   ldw [dstkptr],x  
                                   2775 ;	ret 
                                   2776 
                                   2777 
                                   2778 ;----------------------------------
                                   2779 ; pick value n from dstack 
                                   2780 ; put it on TOS
                                   2781 ; dstack: {ix,..,p -- ix,...,np }
                                   2782 ;-----------------------------------
      00104E                       2783 dpick:
                                   2784 ;	ldw x,[dstkptr]
                                   2785 ;	sllw x 
                                   2786 ;	addw x,dstkptr 
                                   2787 ;	ldw x,(x)
                                   2788 ;	ldw [dstkptr],x 
                                   2789 ;	ret
                                   2790 
                                   2791 ;---------------------------
                                   2792 ;  fetch variable in X 
                                   2793 ;  dstack:{ addr -- value }
                                   2794 ;---------------------------
      00104E                       2795 fetch:
      008FCA 20 81 00 1C      [ 5] 2796 	ldw x,[dstkptr]
      008FCC FE               [ 2] 2797 	ldw x,(x)
      008FCC 89 52 03 72      [ 5] 2798 	ldw [dstkptr],x
      008FD0 5F               [ 4] 2799 	ret 
                                   2800 
                                   2801 ;----------------------------
                                   2802 ; store variable 
                                   2803 ; dstack: {addr value -- }
                                   2804 ;----------------------------
      001058                       2805 store:
      008FD1 00 0C 72         [ 4] 2806 	call dpop 
      008FD4 5F 00            [ 1] 2807 	ldw y,x   ; y=value 
      008FD6 0D 72 5F         [ 4] 2808 	call dpop 
      008FD9 00               [ 2] 2809 	ldw (x),y 
      008FDA 0E               [ 4] 2810 	ret 
                                   2811 
                                   2812 ;---------------------------------
                                   2813 ; drop n elements from data stack 
                                   2814 ; input: 
                                   2815 ;   X 		n 
                                   2816 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2817 ;   none 
                                   2818 ;-------------------------------------
      001062                       2819 ddrop_n:
      008FDB C6               [ 2] 2820 	sllw x
      008FDC 17 38 27 5A      [ 2] 2821 	addw x,dstkptr 
      008FE0 0F 01 A6         [ 2] 2822 	ldw dstkptr,x  
      008FE3 0A               [ 4] 2823 	ret 
                                   2824 
      008FE4 6B 02 AE 17 38 F6 27  2825 dstk_prompt: .asciz "\ndstack: " 
             47 A1 2D
                                   2826 ;----------------------------
                                   2827 ; print dstack content 
                                   2828 ;---------------------------
                           000001  2829 	XSAVE=1
                           000002  2830 	VSIZE=2
      001075                       2831 dots:
      001075                       2832 	_vars VSIZE 
      008FEE 26 04            [ 2]    1     sub sp,#VSIZE 
      008FF0 03 01 20         [ 2] 2833 	ldw x,#dstk_prompt 
      008FF3 08 A1 24         [ 4] 2834 	call puts
      008FF6 26 06 A6         [ 2] 2835 	ldw x,#dstack_empty-CELL_SIZE
      008FF9 10 6B 02 5C      [ 1] 2836 	mov base,#10 
      008FFD F6 00 1C         [ 2] 2837 1$:	cpw x,dstkptr 
      008FFE 25 0D            [ 1] 2838 	jrult 4$ 
      008FFE A1 61            [ 2] 2839 	ldw (XSAVE,sp),x
      009000 2B               [ 2] 2840 	ldw  x,(x)
      009001 02 A0 20         [ 4] 2841 	call print_int 
      009004 A1 30            [ 2] 2842 	ldw x,(XSAVE,sp)
      009006 2B 2B A0         [ 2] 2843 	subw x,#CELL_SIZE 
      009009 30 A1            [ 2] 2844 	jra 1$ 
      00900B 0A 2B            [ 1] 2845 4$: ld a,#CR 
      00900D 06 A0 07         [ 4] 2846 	call putc 
      00109B                       2847 	_drop VSIZE
      009010 11 02            [ 2]    1     addw sp,#VSIZE 
      009012 2A               [ 1] 2848 	clr a 
      009013 1F               [ 4] 2849 	ret
                                   2850 
      009014 6B 03 7B 02 CD 90 3E  2851 cstk_prompt: .asciz "\ncstack: "
             7B 03 CB
                                   2852 ;--------------------------------
                                   2853 ; print cstack content
                                   2854 ;--------------------------------
                           000001  2855 	XSAVE=1
                           000002  2856 	VSIZE=2 
      0010A9                       2857 dotr:
      0010A9                       2858 	_vars VSIZE 
      00901E 00 0E            [ 2]    1     sub sp,#VSIZE 
      009020 C7 00 0E         [ 2] 2859 	ldw x,#cstk_prompt
      009023 4F C9 00         [ 4] 2860 	call puts 
      009026 0D               [ 1] 2861 	ldw x,sp 
      009027 C7 00 0D         [ 2] 2862 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      00902A 4F C9            [ 2] 2863 	ldw (XSAVE,sp),x  
      00902C 00 0C C7         [ 2] 2864 	ldw x,#RAM_SIZE-2
      00902F 00 0C 20 C9      [ 1] 2865 	mov base,#16
      0010BE                       2866 dotr_loop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009033 0D 01            [ 2] 2867 	cpw x,(XSAVE,sp)
      009035 27 03            [ 1] 2868 	jrmi 9$
      009037 CD               [ 2] 2869 	pushw x  
      009038 8B               [ 2] 2870 	ldw x,(x)
      009039 63 0A 16         [ 4] 2871 	call print_int 
      00903A 85               [ 2] 2872 	popw x  
      00903A 5B 03 85         [ 2] 2873 	subw x,#CELL_SIZE
      00903D 81 F1            [ 2] 2874 	jra dotr_loop 
      00903E A6 0D            [ 1] 2875 9$:	ld a,#CR 
      00903E 89 88 5F         [ 4] 2876 	call putc 
      0010D2                       2877 	_drop VSIZE 
      009041 89 C6            [ 2]    1     addw sp,#VSIZE 
      009043 00               [ 1] 2878 	clr a 
      009044 0E               [ 4] 2879 	ret
                                   2880 
                                   2881 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2882 ;;   TINY BASIC  operators,
                                   2883 ;;   commands and functions 
                                   2884 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2885 
                                   2886 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2887 ;;  Arithmetic operators
                                   2888 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2889 
                                   2890 ;--------------------------------
                                   2891 ;  add 2 integers
                                   2892 ;  input:
                                   2893 ;    N1     on cstack 
                                   2894 ;    N2     on cstack 
                                   2895 ;  output:
                                   2896 ;    X 		n2+n1 
                                   2897 ;--------------------------------
                                   2898 	;arugments on cstack 
      0010D6                       2899 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0010D6                       2900 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      0010D6                       2901 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      0010D6                       2902 add:
      009045 97 7B            [ 2] 2903 	ldw x ,(N2,sp)
      009047 03 42 9F         [ 2] 2904 	addw x,(N1,sp)
      00904A C7 00            [ 2] 2905 	ldw (N1,sp),x 
      00904C 0E               [ 4] 2906 	ret 
                                   2907 
                                   2908 ;--------------------------------
                                   2909 ;  substract 2 ntegers
                                   2910 ;  input:
                                   2911 ;    N1     on cstack 
                                   2912 ;    N2     on cstack 
                                   2913 ;  output:
                                   2914 ;    X 		n2+n1 
                                   2915 ;--------------------------------
      0010DE                       2916 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0010DE                       2917 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      0010DE                       2918 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      0010DE                       2919 substract:
      00904D 9E 6B            [ 2] 2920 	ldw x,(N2,sp)
      00904F 02 C6 00         [ 2] 2921 	subw x,(N1,sp)
      009052 0D               [ 4] 2922 	ret 
                                   2923 
                                   2924 ;-------------------------------------
                                   2925 ; multiply 2 integers
                                   2926 ; product overflow is ignored unless
                                   2927 ; MATH_OVF assembler flag is set to 1
                                   2928 ; input:
                                   2929 ;  	N1      on cstack
                                   2930 ;   N2 		on cstack 
                                   2931 ; output:
                                   2932 ;	X        N1*N2 
                                   2933 ;-------------------------------------
                                   2934 	;arguments 
      0010E4                       2935 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      0010E4                       2936 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      0010E4                       2937 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      0010E4                       2938 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      0010E4                       2939 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2940    ; local variables 
                           000001  2941 	SIGN=1
                           000002  2942 	PROD=2
                           000003  2943 	VSIZE=3
      0010E4                       2944 multiply:
      0010E4                       2945 	_vars VSIZE 
      009053 97 7B            [ 2]    1     sub sp,#VSIZE 
      009055 03 42            [ 1] 2946 	clr (SIGN,sp)
      009057 72 FB            [ 2] 2947 	ldw x,(N1_HB,sp)
      009059 01               [ 1] 2948 	ld a,xh  
      00905A 9F C7            [ 1] 2949 	bcp a,#0x80 
      00905C 00 0D            [ 1] 2950 	jreq 2$
      00905E 4F A9            [ 1] 2951 	cpl (SIGN,sp)
      009060 00               [ 2] 2952 	negw x 
      009061 6B 01            [ 2] 2953 	ldw (N1_HB,sp),x 
      009063 9E 6B            [ 2] 2954 2$: ldw x,(N2_HB,sp)
      009065 02               [ 1] 2955 	ld a,xh  
      009066 C6 00            [ 1] 2956 	bcp a,#0x80 
      009068 0C 97            [ 1] 2957 	jreq 3$
      00906A 7B 03            [ 1] 2958 	cpl (SIGN,sp)
      00906C 42               [ 2] 2959 	negw x 
      00906D 72 FB            [ 2] 2960 	ldw (N2_HB,sp),x 
                                   2961 ; N1_LB * N2_LB 	
      00906F 01 9F            [ 1] 2962 3$:	ld a,(N1_LB,sp)
      009071 C7               [ 1] 2963 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009072 00 0C            [ 1] 2964 	ld a,(N2_LB,sp) 
      009074 5B               [ 4] 2965 	mul x,a 
                           000000  2966 .if MATH_OVF 	
                                   2967 	ld a,xh 
                                   2968 	bcp a,#0x80 
                                   2969 	jreq 4$ 
                                   2970 	ld a,#ERR_MATH_OVF 
                                   2971 	jp tb_error
                                   2972 .endif 	 
      009075 03 85            [ 2] 2973 4$:	ldw (PROD,sp),x
                                   2974 ; N1_LB * N2_HB	 
      009077 81 07            [ 1] 2975 	ld a,(N1_LB,sp) 
      009078 97               [ 1] 2976 	ld xl,a 
      009078 88 91            [ 1] 2977 	ld a,(N2_HB,sp)
      00907A D6               [ 4] 2978 	mul x,a
      00907B 01               [ 1] 2979 	ld a,xl 
      00907C 27 0A            [ 1] 2980 	add a,(PROD,sp)
                           000000  2981 .if MATH_OVF 	
                                   2982 	bcp a,#0x80 
                                   2983 	jreq 5$ 
                                   2984 	ld a,#ERR_MATH_OVF 
                                   2985 	jp tb_error
                                   2986 .endif 	 
      00907E 11 01            [ 1] 2987 5$:	ld (PROD,sp),a 
                                   2988 ; N1_HB * N2_LB 
      009080 26 06            [ 1] 2989 	ld a,(N1_HB,sp)
      009082 72               [ 1] 2990 	ld xl,a 
      009083 5C 00            [ 1] 2991 	ld a,(N2_LB,sp)
      009085 02               [ 4] 2992 	mul x,a 
      009086 20               [ 1] 2993 	ld a,xl 
      009087 F1 5B            [ 1] 2994 	add a,(PROD,sp)
                           000000  2995 .if MATH_OVF 	
                                   2996 	bcp a,#0x80 
                                   2997 	jreq 6$ 
                                   2998 	ld a,#ERR_MATH_OVF 
                                   2999 	jp tb_error
                                   3000 .endif 	 
      009089 01 81            [ 1] 3001 6$:	ld (PROD,sp),a 
                                   3002 ; N1_HB * N2_HB 	
                                   3003 ; it is pointless to multiply N1_HB*N2_HB 
                                   3004 ; as this product is over 65535 or 0 
                                   3005 ;
                                   3006 ; sign adjust product
      00908B 0D 01            [ 1] 3007 	tnz (SIGN,sp)
      00908B 55 00            [ 1] 3008 	jreq 7$
      00908D 03 00            [ 2] 3009 	ldw x, (PROD,sp)
      00908F 02               [ 2] 3010 	negw x
      009090 81 02            [ 2] 3011 	ldw (PROD,sp),x  
      009091                       3012 7$: 
      009091 72 5A            [ 2] 3013 	ldw x,(PROD,sp) 
      001129                       3014 	_drop VSIZE 
      009093 00 1E            [ 2]    1     addw sp,#VSIZE 
      009095 72               [ 4] 3015 	ret
                                   3016 
                                   3017 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3018 ;  euclidian divide n2/n1 
                                   3019 ; input:
                                   3020 ;    N2 	on cstack
                                   3021 ;    N1 	on cstack
                                   3022 ; output:
                                   3023 ;    X      n2/n1 
                                   3024 ;    Y      remainder 
                                   3025 ;----------------------------------
      00112C                       3026 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      00112C                       3027 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      00112C                       3028 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   3029 	; local variables
                           000001  3030 	SQUOT=1 ; sign quotient
                           000002  3031 	SDIVD=2 ; sign dividend  
                           000002  3032 	VSIZE=2
      00112C                       3033 divide:
      00112C                       3034 	_vars VSIZE 
      009096 5A 00            [ 2]    1     sub sp,#VSIZE 
      009098 1E 72            [ 1] 3035 	clr (SQUOT,sp)
      00909A CF 00            [ 1] 3036 	clr (SDIVD,sp)
                                   3037 ; check for 0 divisor
      00909C 1D 81            [ 2] 3038 	ldw x,(DIVISR,sp)
      00909E 5D               [ 2] 3039 	tnzw x 
      00909E 72 CE            [ 1] 3040     jrne 0$
      0090A0 00 1D            [ 1] 3041 	ld a,#ERR_DIV0 
      0090A2 72 5C 00         [ 2] 3042 	jp tb_error 
                                   3043 ; check divisor sign 	
      0090A5 1E               [ 1] 3044 0$:	ld a,xh 
      0090A6 72 5C            [ 1] 3045 	bcp a,#0x80 
      0090A8 00 1E            [ 1] 3046 	jreq 1$
      0090AA 81 01            [ 1] 3047 	cpl (SQUOT,sp)
      0090AB 50               [ 2] 3048 	negw x 
      0090AB 72 CE            [ 2] 3049 1$:	ldw (DIVISR,sp),x
                                   3050 ; check dividend sign 	 
      0090AD 00 1D            [ 2] 3051     ldw x,(DIVIDND,sp)
      0090AF 89               [ 1] 3052 	ld a,xh 
      0090B0 AE 00            [ 1] 3053 	bcp a,#0x80 
      0090B2 02 72            [ 1] 3054 	jreq 2$ 
      0090B4 DE 00            [ 1] 3055 	cpl (SQUOT,sp)
      0090B6 1D 72            [ 1] 3056 	cpl (SDIVD,sp)
      0090B8 CF               [ 2] 3057 	negw x 
      0090B9 00 1D            [ 2] 3058 2$:	ldw y,(DIVISR,sp)
      0090BB AE               [ 2] 3059 	divw x,y
      0090BC 00 02 90 85      [ 2] 3060 	ldw acc16,y 
                                   3061 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      0090C0 72 DF            [ 1] 3062 	tnz (SDIVD,sp)
      0090C2 00 1D            [ 1] 3063 	jreq 7$
      0090C4 81 5D            [ 2] 3064 	tnzw y 
      0090C5 27 07            [ 1] 3065 	jreq 7$
      0090C5 72               [ 2] 3066 	incw x
      0090C6 5C 00            [ 2] 3067 	ldw y,(DIVISR,sp)
      0090C8 1E 72 5C 00      [ 2] 3068 	subw y,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0090CC 1E 81            [ 1] 3069 7$: tnz (SQUOT,sp)
      0090CE 27 01            [ 1] 3070 	jreq 9$ 	 
      0090CE 50               [ 2] 3071 8$:	negw x 
      0090CE                       3072 9$: 
      00116D                       3073 	_drop VSIZE 
      0090CE 72 CE            [ 2]    1     addw sp,#VSIZE 
      0090D0 00               [ 4] 3074 	ret 
                                   3075 
                                   3076 
                                   3077 ;----------------------------------
                                   3078 ;  remainder resulting from euclidian 
                                   3079 ;  division of n2/n1 
                                   3080 ; input:
                                   3081 ;   N1 		cstack 
                                   3082 ;   N2      cstack
                                   3083 ; output:
                                   3084 ;   X       N2%N1 
                                   3085 ;----------------------------------
                           000003  3086 	N1=3
                           000005  3087 	N2=5
                           000004  3088 	VSIZE=4
      001170                       3089 modulo:
      0090D1 1D FE            [ 2] 3090 	Ldw x,(N1,sp)
      0090D3 72 CF            [ 2] 3091 	ldw y,(N2,sp)
      001174                       3092 	_vars VSIZE 
      0090D5 00 1D            [ 2]    1     sub sp,#VSIZE 
      0090D7 81 01            [ 2] 3093 	ldw (1,sp),x 
      0090D8 17 03            [ 2] 3094 	ldw (3,sp),y 
      0090D8 CD 90 9E         [ 4] 3095 	call divide 
      0090DB 90               [ 1] 3096 	ldw x,y
      00117E                       3097 	_drop VSIZE 
      0090DC 93 CD            [ 2]    1     addw sp,#VSIZE 
      0090DE 90               [ 4] 3098 	ret 
                                   3099 
                                   3100 
                                   3101 ;----------------------------------
                                   3102 ; search in kword_dict name
                                   3103 ; from its execution address 
                                   3104 ; input:
                                   3105 ;   X       	execution address 
                                   3106 ; output:
                                   3107 ;   X 			cstr*  | 0 
                                   3108 ;--------------------------------
                           000001  3109 	XADR=1 
                           000003  3110 	LINK=3 
                           000004  3111 	VSIZE=4
      001181                       3112 cmd_name:
      001181                       3113 	_vars VSIZE 
      0090DF 9E FF            [ 2]    1     sub sp,#VSIZE 
      0090E1 81 5F 00 0C      [ 1] 3114 	clr acc16 
      0090E2 1F 01            [ 2] 3115 	ldw (XADR,sp),x  
      0090E2 58 72 BB         [ 2] 3116 	ldw x,#kword_dict	
      0090E5 00 1D            [ 2] 3117 1$:	ldw (LINK,sp),x
      0090E7 CF 00            [ 1] 3118 	ld a,(2,x)
      0090E9 1D 81            [ 1] 3119 	and a,#15 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0090EB 0A 64 73         [ 1] 3120 	ld acc8,a 
      0090EE 74 61 63         [ 2] 3121 	addw x,#3
      0090F1 6B 3A 20 00      [ 2] 3122 	addw x,acc16
      0090F5 FE               [ 2] 3123 	ldw x,(x) ; execution address 
      0090F5 52 02            [ 2] 3124 	cpw x,(XADR,sp)
      0090F7 AE 90            [ 1] 3125 	jreq 2$
      0090F9 EB CD            [ 2] 3126 	ldw x,(LINK,sp)
      0090FB 82               [ 2] 3127 	ldw x,(x) 
      0090FC 5E AE 17         [ 2] 3128 	subw x,#2  
      0090FF 7E 35            [ 1] 3129 	jrne 1$
      009101 0A 00            [ 2] 3130 	jra 9$
      009103 0B C3            [ 2] 3131 2$: ldw x,(LINK,sp)
      009105 00 1D 25         [ 2] 3132 	addw x,#2 	
      0011B0                       3133 9$:	_drop VSIZE
      009108 0D 1F            [ 2]    1     addw sp,#VSIZE 
      00910A 01               [ 4] 3134 	ret
                                   3135 
                                   3136 
                                   3137 ;---------------------------------
                                   3138 ; dictionary search 
                                   3139 ; input:
                                   3140 ;	X 		dictionary entry point 
                                   3141 ;  pad		.asciz name to search 
                                   3142 ; output:
                                   3143 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3144 ;  X		execution address | 0 
                                   3145 ;---------------------------------
                           000001  3146 	NLEN=1 ; cmd length 
                           000002  3147 	YSAVE=2
                           000003  3148 	VSIZE=3 
      0011B3                       3149 search_dict:
      0011B3                       3150 	_vars VSIZE 
      00910B FE CD            [ 2]    1     sub sp,#VSIZE 
      00910D 8A 96            [ 1] 3151 	ldw y,x 
      0011B7                       3152 search_next:	
      00910F 1E 01            [ 1] 3153 	ld a,(y)
      009111 1D 00            [ 1] 3154 	and a,#0xf 
      009113 02 20            [ 1] 3155 	ld (NLEN,sp),a  
      009115 EE A6 0D         [ 2] 3156 	ldw x,#pad 
      009118 CD 82            [ 2] 3157 	ldw (YSAVE,sp),y
      00911A 4B 5B            [ 2] 3158 	incw y  
      0011C4                       3159 cp_loop:
      00911C 02               [ 1] 3160 	ld a,(x)
      00911D 4F 81            [ 1] 3161 	jreq str_match 
      00911F 0A 63            [ 1] 3162 	tnz (NLEN,sp)
      009121 73 74            [ 1] 3163 	jreq no_match  
      009123 61 63            [ 1] 3164 	cp a,(y)
      009125 6B 3A            [ 1] 3165 	jrne no_match 
      009127 20 00            [ 2] 3166 	incw y 
      009129 5C               [ 2] 3167 	incw x
      009129 52 02            [ 1] 3168 	dec (NLEN,sp)
      00912B AE 91            [ 2] 3169 	jra cp_loop 
      0011D6                       3170 no_match:
      00912D 1F CD            [ 2] 3171 	ldw y,(YSAVE,sp) 
      00912F 82 5E 96 1C      [ 2] 3172 	subw y,#2 ; move Y to link field
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009133 00 07            [ 1] 3173 	push #TK_NONE 
      009135 1F 01            [ 2] 3174 	ldw y,(y) ; next word link 
      009137 AE               [ 1] 3175 	pop a ; TK_NONE 
      009138 17 FE            [ 1] 3176 	jreq search_exit  ; not found  
                                   3177 ;try next 
      00913A 35 10            [ 2] 3178 	jra search_next
      0011E5                       3179 str_match:
      00913C 00 0B            [ 2] 3180 	ldw y,(YSAVE,sp)
      00913E 90 F6            [ 1] 3181 	ld a,(y)
      00913E 13 01            [ 1] 3182 	ld (NLEN,sp),a ; needed to test keyword type  
      009140 2B 0B            [ 1] 3183 	and a,#0xf 
                                   3184 ; move y to procedure address field 	
      009142 89               [ 1] 3185 	inc a 
      009143 FE CD 8A         [ 1] 3186 	ld acc8,a 
      009146 96 85 1D 00      [ 1] 3187 	clr acc16 
      00914A 02 20 F1 A6      [ 2] 3188 	addw y,acc16 
      00914E 0D CD            [ 2] 3189 	ldw y,(y) ; routine entry point 
                                   3190 ;determine keyword type bits 7:6 
      009150 82 4B            [ 1] 3191 	ld a,(NLEN,sp)
      009152 5B               [ 1] 3192 	swap a 
      009153 02 4F            [ 1] 3193 	and a,#0xc
      009155 81               [ 1] 3194 	srl a
      009156 44               [ 1] 3195 	srl a 
      009156 1E 05            [ 1] 3196 	add a,#6
      001204                       3197 search_exit: 
      009158 72               [ 1] 3198 	ldw x,y ; x=routine address 
      001205                       3199 	_drop VSIZE 	 
      009159 FB 03            [ 2]    1     addw sp,#VSIZE 
      00915B 1F               [ 4] 3200 	ret 
                                   3201 
                                   3202 ;---------------------
                                   3203 ; check if next token
                                   3204 ;  is of expected type 
                                   3205 ; input:
                                   3206 ;   A 		 expected token attribute
                                   3207 ;  ouput:
                                   3208 ;   none     if fail call syntax_error 
                                   3209 ;--------------------
      001208                       3210 expect:
      00915C 03               [ 1] 3211 	push a 
      00915D 81 08 6C         [ 4] 3212 	call next_token 
      00915E 11 01            [ 1] 3213 	cp a,(1,sp)
      00915E 1E 05            [ 1] 3214 	jreq 1$
      009160 72 F0 03         [ 2] 3215 	jp syntax_error
      009163 81               [ 1] 3216 1$: pop a 
      009164 81               [ 4] 3217 	ret 
                                   3218 
                                   3219 
                                   3220 ;-------------------------------
                                   3221 ; parse embedded BASIC routines 
                                   3222 ; arguments list.
                                   3223 ; arg_list::=  rel[','rel]*
                                   3224 ; all arguments are of integer type
                                   3225 ; and pushed on dstack 
                                   3226 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3227 ;   none
                                   3228 ; output:
                                   3229 ;   A 	number of arguments pushed on dstack  
                                   3230 ;--------------------------------
                           000001  3231 	ARG_CNT=1 
      001215                       3232 arg_list:
      009164 52 03            [ 1] 3233 	push #0  
      009166 0F 01 1E         [ 4] 3234 1$: call relation
      009169 06 9E            [ 1] 3235 	cp a,#TK_NONE 
      00916B A5 80            [ 1] 3236 	jreq 5$
      00916D 27 05            [ 1] 3237 	cp a,#TK_INTGR
      00916F 03 01            [ 1] 3238 	jrne 4$
      009171 50 1F 06         [ 4] 3239 3$: call dpush 
      009174 1E 08            [ 1] 3240     inc (ARG_CNT,sp)
      009176 9E A5 80         [ 4] 3241 	call next_token 
      009179 27 05            [ 1] 3242 	cp a,#TK_NONE 
      00917B 03 01            [ 1] 3243 	jreq 5$ 
      00917D 50 1F            [ 1] 3244 	cp a,#TK_COMMA 
      00917F 08 7B            [ 1] 3245 	jrne 4$
      009181 07 97            [ 2] 3246 	jra 1$ 
      009183 7B 09 42         [ 4] 3247 4$:	call unget_token 
      009186 1F               [ 1] 3248 5$:	pop a 
      009187 02               [ 4] 3249 	ret 
                                   3250 
                                   3251 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3252 ; parse arguments list 
                                   3253 ; between ()
                                   3254 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001239                       3255 func_args:
      009188 7B 07            [ 1] 3256 	ld a,#TK_LPAREN 
      00918A 97 7B 08         [ 4] 3257 	call expect 
      00918D 42 9F 1B         [ 4] 3258 	call arg_list 
      009190 02               [ 1] 3259 	push a 
      009191 6B 02            [ 1] 3260 	ld a,#TK_RPAREN 
      009193 7B 06 97         [ 4] 3261 	call expect 
      009196 7B               [ 1] 3262 	pop a 
      009197 09               [ 4] 3263 	ret 
                                   3264 
                                   3265 
                                   3266 ;--------------------------------
                                   3267 ;   BASIC commnands 
                                   3268 ;--------------------------------
                                   3269 
                                   3270 ;--------------------------------
                                   3271 ;  arithmetic and relational 
                                   3272 ;  routines
                                   3273 ;  operators precedence
                                   3274 ;  highest to lowest
                                   3275 ;  operators on same row have 
                                   3276 ;  same precedence and are executed
                                   3277 ;  from left to right.
                                   3278 ;	'*','/','%'
                                   3279 ;   '-','+'
                                   3280 ;   '=','>','<','>=','<=','<>','><'
                                   3281 ;   '<>' and '><' are equivalent for not equal.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3282 ;--------------------------------
                                   3283 
                                   3284 ;---------------------
                                   3285 ; return array element
                                   3286 ; address from @(expr)
                                   3287 ; input:
                                   3288 ;   A 		TK_ARRAY
                                   3289 ; output:
                                   3290 ;   A 		TK_INTGR
                                   3291 ;	X 		element address 
                                   3292 ;----------------------
      001249                       3293 get_array_element:
      009198 42 9F 1B         [ 4] 3294 	call func_args 
      00919B 02 6B            [ 1] 3295 	cp a,#1
      00919D 02 0D            [ 1] 3296 	jreq 1$
      00919F 01 27 05         [ 2] 3297 	jp syntax_error
      0091A2 1E 02 50         [ 4] 3298 1$: call dpop  
                                   3299 	; check for bounds 
      0091A5 1F 02 23         [ 2] 3300 	cpw x,array_size 
      0091A7 23 05            [ 2] 3301 	jrule 3$
                                   3302 ; bounds {1..array_size}	
      0091A7 1E 02            [ 1] 3303 2$: ld a,#ERR_BAD_VALUE 
      0091A9 5B 03 81         [ 2] 3304 	jp tb_error 
      0091AC 5D               [ 2] 3305 3$: tnzw  x
      0091AC 52 02            [ 1] 3306 	jreq 2$ 
      0091AE 0F               [ 2] 3307 	sllw x 
      0091AF 01               [ 2] 3308 	pushw x 
      0091B0 0F 02 1E         [ 2] 3309 	ldw x,#tib
      0091B3 05 5D 26         [ 2] 3310 	subw x,(1,sp)
      00126B                       3311 	_drop 2   
      0091B6 05 A6            [ 2]    1     addw sp,#2 
      0091B8 04 CC            [ 1] 3312 	ld a,#TK_INTGR
      0091BA 88               [ 4] 3313 	ret 
                                   3314 
                                   3315 ;***********************************
                                   3316 ;   expression parse,execute 
                                   3317 ;***********************************
                                   3318 ;-----------------------------------
                                   3319 ; factor ::= ['+'|'-'|e] var | @ |
                                   3320 ;			 integer | function |
                                   3321 ;			 '('relation')' 
                                   3322 ; output:
                                   3323 ;   A    token attribute 
                                   3324 ;   X 	 integer
                                   3325 ; ---------------------------------
                           000001  3326 	NEG=1
                           000001  3327 	VSIZE=1
      001270                       3328 factor:
      001270                       3329 	_vars VSIZE 
      0091BB 3A 9E            [ 2]    1     sub sp,#VSIZE 
      0091BD A5 80 27         [ 4] 3330 	call next_token
      0091C0 03 03            [ 1] 3331 	cp a,#CMD_END 
      0091C2 01 50            [ 1] 3332 	jrmi 20$
      0091C4 1F 05            [ 1] 3333 1$:	ld (NEG,sp),a 
      0091C6 1E 07            [ 1] 3334 	and a,#TK_GRP_MASK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0091C8 9E A5            [ 1] 3335 	cp a,#TK_GRP_ADD 
      0091CA 80 27            [ 1] 3336 	jreq 2$
      0091CC 05 03            [ 1] 3337 	ld a,(NEG,sp)
      0091CE 01 03            [ 2] 3338 	jra 4$  
      001285                       3339 2$:	
      0091D0 02 50 16         [ 4] 3340 	call next_token 
      001288                       3341 4$:	
      0091D3 05 65            [ 1] 3342 	cp a,#TK_IFUNC 
      0091D5 90 CF            [ 1] 3343 	jrne 5$ 
      0091D7 00               [ 4] 3344 	call (x) 
      0091D8 0D 0D            [ 2] 3345 	jra 18$ 
      00128F                       3346 5$:
      0091DA 02 27            [ 1] 3347 	cp a,#TK_INTGR
      0091DC 0B 90            [ 1] 3348 	jrne 6$
      0091DE 5D 27            [ 2] 3349 	jra 18$
      001295                       3350 6$:
      0091E0 07 5C            [ 1] 3351 	cp a,#TK_ARRAY
      0091E2 16 05            [ 1] 3352 	jrne 10$
      0091E4 72 B2 00         [ 4] 3353 	call get_array_element
      0091E7 0D               [ 2] 3354 	ldw x,(x)
      0091E8 0D 01            [ 2] 3355 	jra 18$ 
      00129F                       3356 10$:
      0091EA 27 01            [ 1] 3357 	cp a,#TK_VAR 
      0091EC 50 03            [ 1] 3358 	jrne 12$
      0091ED FE               [ 2] 3359 	ldw x,(x)
      0091ED 5B 02            [ 2] 3360 	jra 18$
      0012A6                       3361 12$:			
      0091EF 81 0B            [ 1] 3362 	cp a,#TK_LPAREN
      0091F0 26 0C            [ 1] 3363 	jrne 16$
      0091F0 1E 03 16         [ 4] 3364 	call relation
      0091F3 05               [ 2] 3365 	pushw x 
      0091F4 52 04            [ 1] 3366 	ld a,#TK_RPAREN 
      0091F6 1F 01 17         [ 4] 3367 	call expect
      0091F9 03               [ 2] 3368 	popw x 
      0091FA CD 91            [ 2] 3369 	jra 18$	
      0012B6                       3370 16$:
      0091FC AC 93 5B         [ 4] 3371 	call unget_token
      0091FF 04               [ 1] 3372 	clr a 
      009200 81 09            [ 2] 3373 	jra 20$ 
      009201                       3374 18$: 
      009201 52 04            [ 1] 3375 	ld a,#TK_MINUS 
      009203 72 5F            [ 1] 3376 	cp a,(NEG,sp)
      009205 00 0D            [ 1] 3377 	jrne 19$
      009207 1F               [ 2] 3378 	negw x
      0012C3                       3379 19$:
      009208 01 AE            [ 1] 3380 	ld a,#TK_INTGR
      0012C5                       3381 20$:
      0012C5                       3382 	_drop VSIZE
      00920A A7 BD            [ 2]    1     addw sp,#VSIZE 
      00920C 1F               [ 4] 3383 	ret
                                   3384 
                                   3385 ;-----------------------------------
                                   3386 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3387 ; output:
                                   3388 ;   A    	token attribute 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3389 ;	X		integer
                                   3390 ;-----------------------------------
                           000001  3391 	N1=1
                           000003  3392 	N2=3
                           000005  3393 	MULOP=5
                           000005  3394 	VSIZE=5
      0012C8                       3395 term:
      0012C8                       3396 	_vars VSIZE
      00920D 03 E6            [ 2]    1     sub sp,#VSIZE 
      00920F 02 A4 0F         [ 4] 3397 	call factor
      009212 C7 00            [ 1] 3398 	cp a,#CMD_END
      009214 0E 1C            [ 1] 3399 	jrmi term_exit
      0012D1                       3400 term01:	 ; check for  operator 
      009216 00 03            [ 2] 3401 	ldw (N2,sp),x  ; save first factor 
      009218 72 BB 00         [ 4] 3402 	call next_token
      00921B 0D FE            [ 1] 3403 	cp a,#2
      00921D 13 01            [ 1] 3404 	jrmi 9$
      00921F 27 0A            [ 1] 3405 0$:	ld (MULOP,sp),a
      009221 1E 03            [ 1] 3406 	and a,#TK_GRP_MASK
      009223 FE 1D            [ 1] 3407 	cp a,#TK_GRP_MULT
      009225 00 02            [ 1] 3408 	jreq 1$
      009227 26 E3            [ 1] 3409 	ld a,(MULOP,sp) 
      009229 20 05 1E         [ 4] 3410 	call unget_token 
      00922C 03 1C            [ 2] 3411 	jra 9$
      0012E9                       3412 1$:	; got *|/|%
      00922E 00 02 5B         [ 4] 3413 	call factor
      009231 04 81            [ 1] 3414 	cp a,#TK_INTGR
      009233 27 03            [ 1] 3415 	jreq 2$ 
      009233 52 03 90         [ 2] 3416 	jp syntax_error
      009236 93 01            [ 2] 3417 2$:	ldw (N1,sp),x  
      009237 7B 05            [ 1] 3418 	ld a,(MULOP,sp) 
      009237 90 F6            [ 1] 3419 	cp a,#TK_MULT 
      009239 A4 0F            [ 1] 3420 	jrne 3$
      00923B 6B 01 AE         [ 4] 3421 	call multiply 
      00923E 17 38            [ 2] 3422 	jra term01
      009240 17 02            [ 1] 3423 3$: cp a,#TK_DIV 
      009242 90 5C            [ 1] 3424 	jrne 4$ 
      009244 CD 11 2C         [ 4] 3425 	call divide 
      009244 F6 27            [ 2] 3426 	jra term01 
      009246 1E 0D 01         [ 4] 3427 4$: call modulo
      009249 27 0B            [ 2] 3428 	jra term01 
      00924B 90 F1            [ 2] 3429 9$: ldw x,(N2,sp)  
      00924D 26 07            [ 1] 3430 	ld a,#TK_INTGR 	
      001312                       3431 term_exit:
      001312                       3432 	_drop VSIZE 
      00924F 90 5C            [ 2]    1     addw sp,#VSIZE 
      009251 5C               [ 4] 3433 	ret 
                                   3434 
                                   3435 ;-------------------------------
                                   3436 ;  expr ::= term [['+'|'-'] term]*
                                   3437 ;  result range {-32768..32767}
                                   3438 ;  output:
                                   3439 ;   A    token attribute 
                                   3440 ;   X	 integer   
                                   3441 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                           000001  3442 	N1=1 
                           000003  3443 	N2=3
                           000005  3444 	OP=5 
                           000005  3445 	VSIZE=5 
      001315                       3446 expression:
      001315                       3447 	_vars VSIZE 
      009252 0A 01            [ 2]    1     sub sp,#VSIZE 
      009254 20 EE C8         [ 4] 3448 	call term
      009256 A1 02            [ 1] 3449 	cp a,#CMD_END 
      009256 16 02            [ 1] 3450 	jrmi expr_exit 
      009258 72 A2            [ 2] 3451 0$:	ldw (N2,sp),x 
      00925A 00 02 4B         [ 4] 3452 	call next_token
      00925D 00 90            [ 1] 3453 	cp a,#2
      00925F FE 84            [ 1] 3454 	jrmi 9$ 
      009261 27 21            [ 1] 3455 1$:	ld (OP,sp),a  
      009263 20 D2            [ 1] 3456 	and a,#TK_GRP_MASK
      009265 A1 10            [ 1] 3457 	cp a,#TK_GRP_ADD 
      009265 16 02            [ 1] 3458 	jreq 2$ 
      009267 90 F6            [ 1] 3459 	ld a,(OP,sp)
      009269 6B 01 A4         [ 4] 3460 	call unget_token
      00926C 0F 4C            [ 2] 3461 	jra 9$
      001336                       3462 2$: 
      00926E C7 00 0E         [ 4] 3463 	call term
      009271 72 5F            [ 1] 3464 	cp a,#TK_INTGR 
      009273 00 0D            [ 1] 3465 	jreq 3$
      009275 72 B9 00         [ 2] 3466 	jp syntax_error
      009278 0D 90            [ 2] 3467 3$:	ldw (N1,sp),x 
      00927A FE 7B            [ 1] 3468 	ld a,(OP,sp)
      00927C 01 4E            [ 1] 3469 	cp a,#TK_PLUS 
      00927E A4 0C            [ 1] 3470 	jrne 4$
      009280 44 44 AB         [ 4] 3471 	call add 
      009283 06 D1            [ 2] 3472 	jra 0$ 
      009284 CD 10 DE         [ 4] 3473 4$:	call substract
      009284 93 5B            [ 2] 3474 	jra 0$
      009286 03 81            [ 2] 3475 9$: ldw x,(N2,sp)
      009288 A6 04            [ 1] 3476 	ld a,#TK_INTGR	
      001356                       3477 expr_exit:
      001356                       3478 	_drop VSIZE 
      009288 88 CD            [ 2]    1     addw sp,#VSIZE 
      00928A 88               [ 4] 3479 	ret 
                                   3480 
                                   3481 ;---------------------------------------------
                                   3482 ; rel ::= expr rel_op expr
                                   3483 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3484 ;  relation return 1 | 0  for true | false 
                                   3485 ;  output:
                                   3486 ;    A 		token attribute  
                                   3487 ;	 X		1|0
                                   3488 ;---------------------------------------------
                           000001  3489 	N1=1
                           000003  3490 	N2=3
                           000005  3491 	RELOP=5
                           000005  3492 	VSIZE=5 
      001359                       3493 relation: 
      001359                       3494 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      00928B EC 11            [ 2]    1     sub sp,#VSIZE 
      00928D 01 27 03         [ 4] 3495 	call expression
      009290 CC 88            [ 1] 3496 	cp a,#CMD_END  
      009292 38 84            [ 1] 3497 	jrmi rel_exit 
                                   3498 	; expect rel_op or leave 
      009294 81 03            [ 2] 3499 	ldw (N2,sp),x 
      009295 CD 08 6C         [ 4] 3500 	call next_token 
      009295 4B 00            [ 1] 3501 	cp a,#2
      009297 CD 93            [ 1] 3502 	jrmi 9$
      00136B                       3503 1$:	
      009299 D9 A1            [ 1] 3504 	ld (RELOP,sp),a 
      00929B 00 27            [ 1] 3505 	and a,#TK_GRP_MASK
      00929D 19 A1            [ 1] 3506 	cp a,#TK_GRP_RELOP 
      00929F 04 26            [ 1] 3507 	jreq 2$
      0092A1 12 CD            [ 1] 3508 	ld a,(RELOP,sp)
      0092A3 90 91 0C         [ 4] 3509 	call unget_token  
      0092A6 01 CD            [ 2] 3510 	jra 9$
      00137A                       3511 2$:	; expect another expression or error 
      0092A8 88 EC A1         [ 4] 3512 	call expression
      0092AB 00 27            [ 1] 3513 	cp a,#TK_INTGR 
      0092AD 09 A1            [ 1] 3514 	jreq 3$
      0092AF 0D 26 02         [ 2] 3515 	jp syntax_error 
      0092B2 20 E3            [ 2] 3516 3$:	ldw (N1,sp),x 
      0092B4 CD 90 8B         [ 4] 3517 	call substract
      0092B7 84 81            [ 1] 3518 	jrne 4$
      0092B9 35 02 00 0D      [ 1] 3519 	mov acc8,#2 ; n1==n2
      0092B9 A6 0B            [ 2] 3520 	jra 6$ 
      001391                       3521 4$: 
      0092BB CD 92            [ 1] 3522 	jrsgt 5$  
      0092BD 88 CD 92 95      [ 1] 3523 	mov acc8,#4 ; n1<2 
      0092C1 88 A6            [ 2] 3524 	jra 6$
      001399                       3525 5$:
      0092C3 0C CD 92 88      [ 1] 3526 	mov acc8,#1 ; n1>n2 
      00139D                       3527 6$:
      0092C7 84               [ 1] 3528 	clrw x 
      0092C8 81 00 0D         [ 1] 3529 	ld a, acc8  
      0092C9 14 05            [ 1] 3530 	and a,(RELOP,sp)
      0092C9 CD               [ 1] 3531 	tnz a 
      0092CA 92 B9            [ 1] 3532 	jreq 10$
      0092CC A1               [ 2] 3533 	incw x 
      0013A7                       3534 7$:	 
      0092CD 01 27            [ 2] 3535 	jra 10$  	
      0092CF 03 CC            [ 2] 3536 9$: ldw x,(N2,sp)
      0013AB                       3537 10$:
      0092D1 88 38            [ 1] 3538 	ld a,#TK_INTGR
      0013AD                       3539 rel_exit: 	 
      0013AD                       3540 	_drop VSIZE
      0092D3 CD 90            [ 2]    1     addw sp,#VSIZE 
      0092D5 9E               [ 4] 3541 	ret 
                                   3542 
                                   3543 ;--------------------------------
                                   3544 ; BASIC: SHOW 
                                   3545 ;  show content of dstack,cstack
                                   3546 ;--------------------------------
      0013B0                       3547 show:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0092D6 C3 00 24         [ 1] 3548 	ld a,base 
      0092D9 23               [ 1] 3549 	push a 
      0092DA 05 A6 0A         [ 4] 3550 	call dots
      0092DD CC 88 3A         [ 4] 3551 	call dotr 
      0092E0 5D               [ 1] 3552 	pop a 
      0092E1 27 F8 58         [ 1] 3553 	ld base,a 
      0092E4 89               [ 1] 3554 	clr a 
      0092E5 AE               [ 4] 3555 	ret
                                   3556 
                                   3557 ;--------------------------------------------
                                   3558 ; BASIC: HEX 
                                   3559 ; select hexadecimal base for integer print
                                   3560 ;---------------------------------------------
      0013C0                       3561 hex_base:
      0092E6 16 E8 72 F0      [ 1] 3562 	mov base,#16 
      0092EA 01               [ 4] 3563 	ret 
                                   3564 
                                   3565 ;--------------------------------------------
                                   3566 ; BASIC: DEC 
                                   3567 ; select decimal base for integer print
                                   3568 ;---------------------------------------------
      0013C5                       3569 dec_base:
      0092EB 5B 02 A6 04      [ 1] 3570 	mov base,#10
      0092EF 81               [ 4] 3571 	ret 
                                   3572 
                                   3573 ;------------------------
                                   3574 ; BASIC: SIZE 
                                   3575 ; return free size in text area
                                   3576 ; output:
                                   3577 ;   A 		TK_INTGR
                                   3578 ;   X 	    size integer
                                   3579 ;--------------------------
      0092F0                       3580 size:
      0092F0 52 01 CD         [ 2] 3581 	ldw x,#tib 
      0092F3 88 EC A1 02      [ 2] 3582 	subw x,txtend 
      0092F7 2B 4C            [ 1] 3583 	ld a,#TK_INTGR
      0092F9 6B               [ 4] 3584 	ret 
                                   3585 
                                   3586 
                                   3587 ;------------------------
                                   3588 ; BASIC: UBOUND  
                                   3589 ; return array variable size 
                                   3590 ; output:
                                   3591 ;   A 		TK_INTGR
                                   3592 ;   X 	    array size 
                                   3593 ;--------------------------
      0013D4                       3594 ubound:
      0092FA 01 A4 30         [ 2] 3595 	ldw x,#tib
      0092FD A1 10 27 04      [ 2] 3596 	subw x,txtend 
      009301 7B 01 20 03      [ 2] 3597 	ldw y,basicptr 
      009305 90 C3 00 20      [ 2] 3598 	cpw y,txtend 
      009305 CD 88            [ 1] 3599 	jrult 1$
      009307 EC 00 03         [ 1] 3600 	push count 
      009308 4B 00            [ 1] 3601 	push #0 
      009308 A1 07 26         [ 2] 3602 	subw x,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0013ED                       3603 	_drop 2 
      00930B 03 FD            [ 2]    1     addw sp,#2 
      00930D 20               [ 2] 3604 1$:	srlw x 
      00930E 2D 00 23         [ 2] 3605 	ldw array_size,x
      00930F A6 04            [ 1] 3606 	ld a,#TK_INTGR
      00930F A1               [ 4] 3607 	ret 
                                   3608 
                                   3609 ;-----------------------------
                                   3610 ; BASIC: LET var=expr 
                                   3611 ; variable assignement 
                                   3612 ; output:
                                   3613 ;   A 		TK_NONE 
                                   3614 ;-----------------------------
      0013F6                       3615 let:
      009310 04 26 02         [ 4] 3616 	call next_token 
      009313 20 27            [ 1] 3617 	cp a,#TK_VAR 
      009315 27 03            [ 1] 3618 	jreq let02
      009315 A1 02 26         [ 2] 3619 	jp syntax_error
      001400                       3620 let02:
      009318 06 CD 92         [ 4] 3621 	call dpush 
      00931B C9 FE 20         [ 4] 3622 	call next_token 
      00931E 1D 32            [ 1] 3623 	cp a,#TK_EQUAL
      00931F 27 03            [ 1] 3624 	jreq 1$
      00931F A1 05 26         [ 2] 3625 	jp syntax_error
      00140D                       3626 1$:	
      009322 03 FE 20         [ 4] 3627 	call relation   
      009325 16 04            [ 1] 3628 	cp a,#TK_INTGR 
      009326 27 03            [ 1] 3629 	jreq 2$
      009326 A1 0B 26         [ 2] 3630 	jp syntax_error
      001417                       3631 2$:	
      009329 0C CD            [ 1] 3632 	ldw y,x 
      00932B 93 D9 89         [ 4] 3633 	call dpop  
      00932E A6               [ 2] 3634 	ldw (x),y   
      00932F 0C               [ 4] 3635 	ret 
                                   3636 
                                   3637 ;----------------------------
                                   3638 ; BASIC: LIST [[start][,end]]
                                   3639 ; list program lines 
                                   3640 ; form start to end 
                                   3641 ; if empty argument list then 
                                   3642 ; list all.
                                   3643 ;----------------------------
                           000001  3644 	FIRST=1
                           000003  3645 	LAST=3 
                           000005  3646 	LN_PTR=5
                           000006  3647 	VSIZE=6 
      00141E                       3648 list:
      00141E                       3649 	_vars VSIZE
      009330 CD 92            [ 2]    1     sub sp,#VSIZE 
      009332 88 85 20         [ 2] 3650 	ldw x,txtbgn 
      009335 06 00 20         [ 2] 3651 	cpw x,txtend 
      009336 2B 03            [ 1] 3652 	jrmi 1$
      009336 CD 90 8B         [ 2] 3653 	jp list_exit ; nothing to list 
      009339 4F 20            [ 2] 3654 1$:	ldw (LN_PTR,sp),x 
      00933B 09               [ 2] 3655 	ldw x,(x) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00933C 1F 01            [ 2] 3656 	ldw (FIRST,sp),x ; list from first line 
      00933C A6 11 11         [ 2] 3657 	ldw x,#0x7fff ; biggest line number 
      00933F 01 26            [ 2] 3658 	ldw (LAST,sp),x 
      009341 01 50 15         [ 4] 3659 	call arg_list
      009343 4D               [ 1] 3660 	tnz a
      009343 A6 04            [ 1] 3661 	jreq list_start 
      009345 A1 02            [ 1] 3662 	cp a,#2 
      009345 5B 01            [ 1] 3663 	jreq 4$
      009347 81 01            [ 1] 3664 	cp a,#1 
      009348 27 06            [ 1] 3665 	jreq first_line 
      009348 52 05 CD         [ 2] 3666 	jp syntax_error 
      00934B 92 F0 A1         [ 4] 3667 4$:	call dswap
      001449                       3668 first_line:
      00934E 02 2B 41         [ 4] 3669 	call dpop 
      009351 1F 01            [ 2] 3670 	ldw (FIRST,sp),x 
      009351 1F 03            [ 1] 3671 	cp a,#1 
      009353 CD 88            [ 1] 3672 	jreq lines_skip 	
      001452                       3673 last_line:
      009355 EC A1 02         [ 4] 3674 	call dpop 
      009358 2B 34            [ 2] 3675 	ldw (LAST,sp),x 
      001457                       3676 lines_skip:
      00935A 6B 05 A4         [ 2] 3677 	ldw x,txtbgn
      00935D 30 A1            [ 2] 3678 2$:	ldw (LN_PTR,sp),x 
      00935F 20 27 07         [ 2] 3679 	cpw x,txtend 
      009362 7B 05            [ 1] 3680 	jrpl list_exit 
      009364 CD               [ 2] 3681 	ldw x,(x) ;line# 
      009365 90 8B            [ 2] 3682 	cpw x,(FIRST,sp)
      009367 20 25            [ 1] 3683 	jrpl list_start 
      009369 1E 05            [ 2] 3684 	ldw x,(LN_PTR,sp) 
      009369 CD 92 F0         [ 2] 3685 	addw x,#2 
      00936C A1               [ 1] 3686 	ld a,(x)
      00936D 04               [ 2] 3687 	incw x 
      00936E 27 03 CC         [ 1] 3688 	ld acc8,a 
      009371 88 38 1F 01      [ 1] 3689 	clr acc16 
      009375 7B 05 A1 20      [ 2] 3690 	addw x,acc16
      009379 26 05            [ 2] 3691 	jra 2$ 
                                   3692 ; print loop
      00147A                       3693 list_start:
      00937B CD 91            [ 2] 3694 	ldw x,(LN_PTR,sp)
      00937D 64 20            [ 1] 3695 3$:	ld a,(2,x) 
      00937F D1 A1 21         [ 4] 3696 	call prt_basic_line
      009382 26 05            [ 2] 3697 	ldw x,(LN_PTR,sp)
      009384 CD 91            [ 1] 3698 	ld a,(2,x)
      009386 AC 20 C8         [ 1] 3699 	ld acc8,a 
      009389 CD 91 F0 20      [ 1] 3700 	clr acc16 
      00938D C3 1E 03 A6      [ 2] 3701 	addw x,acc16
      009391 04 00 20         [ 2] 3702 	cpw x,txtend 
      009392 2A 0B            [ 1] 3703 	jrpl list_exit
      009392 5B 05            [ 2] 3704 	ldw (LN_PTR,sp),x
      009394 81               [ 2] 3705 	ldw x,(x)
      009395 13 03            [ 2] 3706 	cpw x,(LAST,sp)  
      009395 52 05            [ 1] 3707 	jrsgt list_exit 
      009397 CD 93            [ 2] 3708 	ldw x,(LN_PTR,sp)
      009399 48 A1            [ 2] 3709 	jra 3$
      0014A0                       3710 list_exit:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0014A0                       3711 	_drop VSIZE 
      00939B 02 2B            [ 2]    1     addw sp,#VSIZE 
      00939D 38               [ 4] 3712 	ret
                                   3713 
                                   3714 ;-------------------------
                                   3715 ; print counted string 
                                   3716 ; input:
                                   3717 ;   X 	address of string
                                   3718 ;--------------------------
      0014A3                       3719 prt_cmd_name:
      00939E 1F               [ 1] 3720 	ld a,(x)
      00939F 03               [ 2] 3721 	incw x
      0093A0 CD 88            [ 1] 3722 	and a,#15  
      0093A2 EC               [ 1] 3723 	push a 
      0093A3 A1 02            [ 1] 3724 1$: tnz (1,sp) 
      0093A5 2B 2B            [ 1] 3725 	jreq 9$
      0093A7 6B               [ 1] 3726 	ld a,(x)
      0093A8 05 A4 30         [ 4] 3727 	call putc 
      0093AB A1               [ 2] 3728 	incw x
      0093AC 10 27            [ 1] 3729 	dec (1,sp)	 
      0093AE 07 7B            [ 2] 3730 	jra 1$
      0093B0 05               [ 1] 3731 9$: pop a 
      0093B1 CD               [ 4] 3732 	ret	
                                   3733 
                                   3734 ;--------------------------
                                   3735 ; print TK_QSTR
                                   3736 ; converting control character
                                   3737 ; to backslash sequence
                                   3738 ; input:
                                   3739 ;   X        char *
                                   3740 ;-----------------------------
      0014B7                       3741 prt_quote:
      0093B2 90 8B            [ 1] 3742 	ld a,#'"
      0093B4 20 1C CB         [ 4] 3743 	call putc 
      0093B6 F6               [ 1] 3744 1$:	ld a,(x)
      0093B6 CD 93            [ 1] 3745 	jreq 9$
      0093B8 48               [ 2] 3746 	incw x 
      0093B9 A1 04            [ 1] 3747 	cp a,#SPACE 
      0093BB 27 03            [ 1] 3748 	jrult 3$
      0093BD CC 88 38         [ 4] 3749 	call putc
      0093C0 1F 01            [ 1] 3750 	cp a,#'\ 
      0093C2 7B 05            [ 1] 3751 	jrne 1$ 
      0014CB                       3752 2$:
      0093C4 A1 10 26         [ 4] 3753 	call putc 
      0093C7 05 CD            [ 2] 3754 	jra 1$
      0093C9 91               [ 1] 3755 3$: push a 
      0093CA 56 20            [ 1] 3756 	ld a,#'\
      0093CC D1 CD 91         [ 4] 3757 	call putc 
      0093CF 5E               [ 1] 3758 	pop a 
      0093D0 20 CC            [ 1] 3759 	sub a,#7
      0093D2 1E 03 A6         [ 1] 3760 	ld acc8,a 
      0093D5 04 5F 00 0C      [ 1] 3761 	clr acc16
      0093D6 90 AE 0C DA      [ 2] 3762 	ldw y,#escaped 
      0093D6 5B 05 81 0C      [ 2] 3763 	addw y,acc16 
      0093D9 90 F6            [ 1] 3764 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0093D9 52 05            [ 2] 3765 	jra 2$
      0093DB CD 93            [ 1] 3766 9$: ld a,#'"
      0093DD 95 A1 02         [ 4] 3767 	call putc 
      0093E0 2B               [ 2] 3768 	incw x 
      0093E1 4B               [ 4] 3769 	ret
                                   3770 
                                   3771 
                                   3772 ;--------------------------
                                   3773 ; decompile line from token list 
                                   3774 ; input:
                                   3775 ;   A       stop at this position 
                                   3776 ;   X 		pointer at line
                                   3777 ; output:
                                   3778 ;   none 
                                   3779 ;--------------------------	
                           000001  3780 	BASE_SAV=1
                           000002  3781 	WIDTH_SAV=2
                           000003  3782 	XSAVE=3
                           000005  3783 	LLEN=5
                           000005  3784 	VSIZE=5 
      0014F3                       3785 prt_basic_line:
      0014F3                       3786 	_vars VSIZE
      0093E2 1F 03            [ 2]    1     sub sp,#VSIZE 
      0093E4 CD 88            [ 1] 3787 	ld (LLEN,sp),a  
      0093E6 EC A1 02         [ 1] 3788 	ld a,base
      0093E9 2B 3E            [ 1] 3789 	ld (BASE_SAV,sp),a  
      0093EB C6 00 26         [ 1] 3790 	ld a,tab_width 
      0093EB 6B 05            [ 1] 3791 	ld (WIDTH_SAV,sp),a 
      0093ED A4 30 A1         [ 2] 3792 	ldw ptr16,x
      0093F0 30               [ 2] 3793 	ldw x,(x)
      0093F1 27 07 7B 05      [ 1] 3794 	mov base,#10
      0093F5 CD 90 8B 20      [ 1] 3795 	mov tab_width,#5
      0093F9 2F 0A 16         [ 4] 3796 	call print_int ; print line number 
      0093FA A6 20            [ 1] 3797 	ld a,#SPACE 
      0093FA CD 93 95         [ 4] 3798 	call putc 
      0093FD A1 04 27 03      [ 1] 3799 	clr tab_width
      009401 CC 88 38         [ 2] 3800 	ldw x,#3
      009404 1F               [ 1] 3801 1$:	ld a,xl 
      009405 01 CD            [ 1] 3802 	cp a,(LLEN,sp)
      009407 91 5E            [ 1] 3803 	jrmi 20$
      009409 26 06 35         [ 2] 3804 	jp 90$
      001524                       3805 20$:	 
      00940C 02 00 0E 20      [ 4] 3806 	ld a,([ptr16],x)
      009410 0C               [ 2] 3807 	incw x 
      009411 1F 03            [ 2] 3808 	ldw (XSAVE,sp),x 
      009411 2C 06            [ 1] 3809 	cp a,#TK_CMD 
      009413 35 04            [ 1] 3810 	jrult 5$
      009415 00 0E            [ 1] 3811 	cp a,#TK_CFUNC 
      009417 20 04            [ 1] 3812 	jrugt 4$
      009419                       3813 2$:	
      009419 35 01 00 0E      [ 5] 3814 	ldw x,([ptr16],x)
      00941D A3 17 49         [ 2] 3815 	cpw x,#rem 
      00941D 5F C6            [ 1] 3816 	jrne 3$
      00941F 00 0E            [ 1] 3817 	ld a,#''
      009421 14 05 4D         [ 4] 3818 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009424 27 05            [ 2] 3819 	ldw x,(XSAVE,sp)
      009426 5C 00 02         [ 2] 3820 	addw x,#2
      009427 72 BB 00 17      [ 2] 3821 	addw x,ptr16  
      009427 20 02 1E         [ 4] 3822 	call puts 
      00942A 03 16 26         [ 2] 3823 	jp 90$ 
      00942B CD 11 81         [ 4] 3824 3$:	call cmd_name
      00942B A6 04 A3         [ 4] 3825 	call prt_cmd_name
      00942D A6 20            [ 1] 3826 	ld a,#SPACE 
      00942D 5B 05 81         [ 4] 3827 	call putc 
      009430 1E 03            [ 2] 3828 	ldw x,(XSAVE,sp)
      009430 C6 00 0B         [ 2] 3829 	addw x,#2
      009433 88 CD            [ 2] 3830 	jra 1$
      009435 90 F5            [ 1] 3831 4$: cp a,#TK_QSTR 
      009437 CD 91            [ 1] 3832 	jrne 5$
      009439 29 84 C7 00      [ 2] 3833 	addw x,ptr16
      00943D 0B 4F 81         [ 4] 3834 	call prt_quote 
      009440 72 B0 00 17      [ 2] 3835 	subw x,ptr16  
      009440 35 10            [ 2] 3836 	jra 1$
      009442 00 0B            [ 1] 3837 5$:	cp a,#TK_VAR
      009444 81 1A            [ 1] 3838 	jrne 6$ 
      009445 72 DE 00 17      [ 5] 3839 	ldw x,([ptr16],x)
      009445 35 0A 00         [ 2] 3840 	subw x,#vars 
      009448 0B               [ 1] 3841 	ld a,xl
      009449 81               [ 1] 3842 	srl a 
      00944A AB 41            [ 1] 3843 	add a,#'A 
      00944A AE 16 E8         [ 4] 3844 	call putc 
      00944D 72 B0            [ 1] 3845 	ld a,#SPACE 
      00944F 00 21 A6         [ 4] 3846 	call putc 
      009452 04 81            [ 2] 3847 	ldw x,(XSAVE,sp)
      009454 1C 00 02         [ 2] 3848 	addw x,#2 
      009454 AE 16            [ 2] 3849 	jra 1$ 
      009456 E8 72            [ 1] 3850 6$: cp a,#TK_ARRAY 
      009458 B0 00            [ 1] 3851 	jrne 7$
      00945A 21 90            [ 1] 3852 	ld a,#'@ 
      00945C CE 00 05         [ 4] 3853 	call putc 
      00945F 90 C3            [ 2] 3854 	ldw x,(XSAVE,sp)
      009461 00 21 25         [ 2] 3855 	jp 1$ 
      009464 0A 3B            [ 1] 3856 7$: cp a,#TK_INTGR 
      009466 00 04            [ 1] 3857 	jrne 8$
      009468 4B 00 72 F0      [ 5] 3858 	ldw x,([ptr16],x)
      00946C 01 5B 02         [ 4] 3859 	call print_int
                                   3860 ;	ld a,#SPACE 
                                   3861 ;	call putc 
      00946F 54 CF            [ 2] 3862 	ldw x,(XSAVE,sp)
      009471 00 24 A6         [ 2] 3863 	addw x,#2 
      009474 04 81 1C         [ 2] 3864 	jp 1$
      009476 A1 31            [ 1] 3865 8$: cp a,#TK_GT 
      009476 CD 88            [ 1] 3866 	jrmi 9$
      009478 EC A1            [ 1] 3867 	cp a,#TK_NE 
      00947A 05 27            [ 1] 3868 	jrugt 9$
      00947C 03 CC            [ 1] 3869 	sub a,#TK_GT  
      00947E 88               [ 1] 3870 	sll a 
      00947F 38 5F            [ 1] 3871 	clrw y 
      009480 90 97            [ 1] 3872 	ld yl,a 
      009480 CD 90 91 CD      [ 2] 3873 	addw y,#relop_str 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009484 88 EC            [ 2] 3874 	ldw y,(y)
      009486 A1               [ 1] 3875 	ldw x,y 
      009487 32 27 03         [ 4] 3876 	call puts 
      00948A CC 88            [ 2] 3877 	ldw x,(XSAVE,sp)
      00948C 38 15 1C         [ 2] 3878 	jp 1$
      00948D A1 10            [ 1] 3879 9$: cp a,#TK_PLUS 
      00948D CD 93            [ 1] 3880 	jrne 10$
      00948F D9 A1            [ 1] 3881 	ld a,#'+
      009491 04 27            [ 2] 3882 	jra 80$ 
      009493 03 CC            [ 1] 3883 10$: cp a,#TK_MINUS
      009495 88 38            [ 1] 3884 	jrne 11$
      009497 A6 2D            [ 1] 3885 	ld a,#'-
      009497 90 93            [ 2] 3886 	jra 80$
      009499 CD 90            [ 1] 3887 11$: cp a,#TK_MULT 
      00949B 9E FF            [ 1] 3888 	jrmi 12$
      00949D 81 22            [ 1] 3889 	cp a,#TK_MOD 
      00949E 22 0A            [ 1] 3890 	jrugt 12$
      00949E 52 06            [ 1] 3891 	sub a,#0x20
      0094A0 CE               [ 1] 3892 	clrw x 
      0094A1 00               [ 1] 3893 	ld xl,a 
      0094A2 1F C3 00         [ 2] 3894 	addw x,#mul_char 
      0094A5 21               [ 1] 3895 	ld a,(x)
      0094A6 2B 03            [ 2] 3896 	jra 80$ 
      0094A8 CC 95            [ 1] 3897 12$: cp a,#TK_LPAREN 
      0094AA 20 1F            [ 1] 3898 	jrmi 13$
      0094AC 05 FE            [ 1] 3899 	cp a,#TK_SHARP 
      0094AE 1F 01            [ 1] 3900 	jrugt 13$
      0094B0 AE 7F            [ 1] 3901 	sub a,#TK_LPAREN
      0094B2 FF               [ 1] 3902 	clrw x 
      0094B3 1F               [ 1] 3903 	ld xl,a 
      0094B4 03 CD 92         [ 2] 3904 	addw x,#single_char 
      0094B7 95               [ 1] 3905 	ld a,(x)
      0094B8 4D 27            [ 2] 3906 	jra 80$
      0094BA 3F A1            [ 1] 3907 13$: cp a,#TK_CHAR 
      0094BC 02 27            [ 1] 3908 	jrne 14$
      0094BE 07 A1            [ 1] 3909 	ld a,#'\
      0094C0 01 27 06         [ 4] 3910 	call putc 
      0094C3 CC 88            [ 2] 3911 	ldw x,(XSAVE,sp)
      0094C5 38 CD 90 AB      [ 4] 3912 	ld a,([ptr16],x)
      0094C9 5C               [ 2] 3913 	incw x 
      0094C9 CD 90            [ 2] 3914 	ldw (XSAVE,sp),x 
      0094CB 9E 1F 01         [ 4] 3915 	call putc 
      0094CE A1 01 27         [ 2] 3916 	jp 1$ 
      0094D1 05 3A            [ 1] 3917 14$: ld a,#':
      0094D2 CD 01 CB         [ 4] 3918 80$: call putc 
      0094D2 CD 90            [ 2] 3919 	ldw x,(XSAVE,sp)
      0094D4 9E 1F 03         [ 2] 3920 	jp 1$ 
      0094D7                       3921 90$: 
      0094D7 CE 00            [ 1] 3922 	ld a,#CR 
      0094D9 1F 1F 05         [ 4] 3923 	call putc
      0094DC C3 00            [ 1] 3924 	ld a,(WIDTH_SAV,sp) 
      0094DE 21 2A 3F         [ 1] 3925 	ld tab_width,a 
      0094E1 FE 13            [ 1] 3926 	ld a,(BASE_SAV,sp) 
      0094E3 01 2A 14         [ 1] 3927 	ld base,a
      001635                       3928 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0094E6 1E 05            [ 2]    1     addw sp,#VSIZE 
      0094E8 1C               [ 4] 3929 	ret 	
      0094E9 00 02 F6 5C           3930 single_char: .byte '(',')',',','#'
      0094ED C7 00 0E              3931 mul_char: .byte '*','/','%'
      0094F0 72 5F 00 0D 72 BB 00  3932 relop_str: .word gt,equal,ge,lt,le,ne 
             0D 20 E0 16 57
      0094FA 3E 00                 3933 gt: .asciz ">"
      0094FA 1E 05                 3934 equal: .asciz "="
      0094FC E6 02 CD              3935 ge: .asciz ">="
      0094FF 95 73                 3936 lt: .asciz "<"
      009501 1E 05 E6              3937 le: .asciz "<="
      009504 02 C7 00              3938 ne:  .asciz "<>"
                                   3939 
                                   3940 
                                   3941 ;---------------------------------
                                   3942 ; BASIC: PRINT|? arg_list 
                                   3943 ; print values from argument list
                                   3944 ;----------------------------------
                           000001  3945 	COMMA=1
                           000001  3946 	VSIZE=1
      00165A                       3947 print:
      009507 0E 72            [ 1] 3948 push #0 ; local variable COMMA 
      00165C                       3949 reset_comma:
      009509 5F 00            [ 1] 3950 	clr (COMMA,sp)
      00165E                       3951 prt_loop:
      00950B 0D 72 BB         [ 4] 3952 	call relation 
      00950E 00 0D            [ 1] 3953 	cp a,#TK_COLON 
      009510 C3 00            [ 1] 3954 	jreq print_exit   
      009512 21 2A            [ 1] 3955 	cp a,#TK_INTGR 
      009514 0B 1F            [ 1] 3956 	jrne 0$ 
      009516 05 FE 13         [ 4] 3957 	call print_int 
      009519 03 2C            [ 2] 3958 	jra reset_comma
      00166E                       3959 0$: 	
      00951B 04 1E 05         [ 4] 3960 	call next_token
      00951E 20 DC            [ 1] 3961 	cp a,#TK_NONE 
      009520 27 41            [ 1] 3962 	jreq print_exit 
      009520 5B 06            [ 1] 3963 1$:	cp a,#TK_QSTR
      009522 81 05            [ 1] 3964 	jrne 2$   
      009523 CD 01 DE         [ 4] 3965 	call puts
      009523 F6 5C            [ 2] 3966 	jra reset_comma
      009525 A4 0F            [ 1] 3967 2$: cp a,#TK_CHAR 
      009527 88 0D            [ 1] 3968 	jrne 3$
      009529 01               [ 1] 3969 	ld a,xl 
      00952A 27 09 F6         [ 4] 3970 	call putc 
      00952D CD 82            [ 2] 3971 	jra reset_comma 
      001688                       3972 3$: 	
      00952F 4B 5C            [ 1] 3973 	cp a,#TK_CFUNC 
      009531 0A 01            [ 1] 3974 	jrne 4$ 
      009533 20               [ 4] 3975 	call (x)
      009534 F3               [ 1] 3976 	ld a,xl 
      009535 84 81 CB         [ 4] 3977 	call putc
      009537 20 C9            [ 2] 3978 	jra reset_comma 
      001693                       3979 4$: 
      009537 A6 22            [ 1] 3980 	cp a,#TK_COMMA 
      009539 CD 82            [ 1] 3981 	jrne 5$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      00953B 4B F6            [ 1] 3982 	cpl (COMMA,sp) 
      00953D 27 2D 5C         [ 2] 3983 	jp prt_loop   
      00169C                       3984 5$: 
      009540 A1 20            [ 1] 3985 	cp a,#TK_SHARP
      009542 25 0C            [ 1] 3986 	jrne 7$
      009544 CD 82 4B         [ 4] 3987 	call next_token
      009547 A1 5C            [ 1] 3988 	cp a,#TK_INTGR 
      009549 26 F1            [ 1] 3989 	jreq 6$
      00954B CC 07 B8         [ 2] 3990 	jp syntax_error 
      0016AA                       3991 6$:
      00954B CD               [ 1] 3992 	ld a,xl 
      00954C 82 4B            [ 1] 3993 	and a,#15 
      00954E 20 EC 88         [ 1] 3994 	ld tab_width,a 
      009551 A6 5C CD         [ 2] 3995 	jp reset_comma 
      0016B3                       3996 7$:	
      009554 82 4B 84         [ 4] 3997 	call unget_token
      0016B6                       3998 print_exit:
      009557 A0 07            [ 1] 3999 	tnz (COMMA,sp)
      009559 C7 00            [ 1] 4000 	jrne 9$
      00955B 0E 72            [ 1] 4001 	ld a,#CR 
      00955D 5F 00 0D         [ 4] 4002     call putc 
      0016BF                       4003 9$:	_drop VSIZE 
      009560 90 AE            [ 2]    1     addw sp,#VSIZE 
      009562 8D               [ 4] 4004 	ret 
                                   4005 
                                   4006 ;----------------------
                                   4007 ; 'save_context' and
                                   4008 ; 'rest_context' must be 
                                   4009 ; called at the same 
                                   4010 ; call stack depth 
                                   4011 ; i.e. SP must have the 
                                   4012 ; save value at  
                                   4013 ; entry point of both 
                                   4014 ; routine. 
                                   4015 ;---------------------
                           000004  4016 	CTXT_SIZE=4 ; size of saved data 
                                   4017 ;--------------------
                                   4018 ; save current BASIC
                                   4019 ; interpreter context 
                                   4020 ; on cstack 
                                   4021 ;--------------------
      0016C2                       4022 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0016C2                       4023 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      0016C2                       4024 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      0016C2                       4025 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      0016C2                       4026 save_context:
      009563 5A 72 B9         [ 2] 4027 	ldw x,basicptr 
      009566 00 0D            [ 2] 4028 	ldw (BPTR,sp),x
      009568 90 F6 20         [ 1] 4029 	ld a,in 
      00956B DF A6            [ 1] 4030 	ld (IN,sp),a
      00956D 22 CD 82         [ 1] 4031 	ld a,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009570 4B 5C            [ 1] 4032 	ld (CNT,sp),a  
      009572 81               [ 4] 4033 	ret
                                   4034 
                                   4035 ;-----------------------
                                   4036 ; restore previously saved 
                                   4037 ; BASIC interpreter context 
                                   4038 ; from cstack 
                                   4039 ;-------------------------
      009573                       4040 rest_context:
      009573 52 05            [ 2] 4041 	ldw x,(BPTR,sp)
      009575 6B 05 C6         [ 2] 4042 	ldw basicptr,x 
      009578 00 0B            [ 1] 4043 	ld a,(IN,sp)
      00957A 6B 01 C6         [ 1] 4044 	ld in,a
      00957D 00 27            [ 1] 4045 	ld a,(CNT,sp)
      00957F 6B 02 CF         [ 1] 4046 	ld count,a  
      009582 00               [ 4] 4047 	ret
                                   4048 
                                   4049 ;------------------------------------------
                                   4050 ; BASIC: INPUT [string],var[,[string],var]
                                   4051 ; input value in variables 
                                   4052 ; [string] optionally can be used as prompt 
                                   4053 ;-----------------------------------------
                           000001  4054 	CX_BPTR=1
                           000003  4055 	CX_IN=3
                           000004  4056 	CX_CNT=4
                           000005  4057 	SKIP=5
                           000005  4058 	VSIZE=5
      0016E2                       4059 input_var:
      0016E2                       4060 	_vars VSIZE 
      009583 18 FE            [ 2]    1     sub sp,#VSIZE 
      0016E4                       4061 input_loop:
      009585 35 0A            [ 1] 4062 	clr (SKIP,sp)
      009587 00 0B 35         [ 4] 4063 	call next_token 
      00958A 05 00            [ 1] 4064 	cp a,#TK_QSTR 
      00958C 27 CD            [ 1] 4065 	jrne 1$ 
      00958E 8A 96 A6         [ 4] 4066 	call puts 
      009591 20 CD            [ 1] 4067 	cpl (SKIP,sp)
      009593 82 4B 72         [ 4] 4068 	call next_token 
      009596 5F 00            [ 1] 4069 1$: cp a,#TK_VAR  
      009598 27 AE            [ 1] 4070 	jreq 2$ 
      00959A 00 03 9F         [ 2] 4071 	jp syntax_error
      00959D 11 05 2B         [ 4] 4072 2$:	call dpush 
      0095A0 03 CC            [ 1] 4073 	tnz (SKIP,sp)
      0095A2 96 A6            [ 1] 4074 	jrne 21$ 
                                   4075 ;	clr pad+2
      0095A4 AE 17 38         [ 2] 4076 	ldw x,#pad 
      0095A4 72 D6 00         [ 4] 4077 	call puts   
      001709                       4078 21$:
      0095A7 18 5C            [ 1] 4079 	ld a,#':
      0095A9 1F 03 A1         [ 4] 4080 	call putc 
      0095AC 06 25 44         [ 4] 4081 	call save_context 
      0095AF A1 08 22 2F      [ 1] 4082 	clr count  
      0095B3 CD 0B 06         [ 4] 4083 	call readln 
      0095B3 72 DE 00         [ 2] 4084 	ldw x,#tib 
      0095B6 18 A3 97         [ 2] 4085 	ldw basicptr,x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0095B9 C9 26 14 A6      [ 1] 4086 	clr in 
      0095BD 27 CD 82         [ 4] 4087 	call get_token
      0095C0 4B 1E            [ 1] 4088 	cp a,#TK_INTGR
      0095C2 03 1C            [ 1] 4089 	jreq 3$ 
      0095C4 00 02 72         [ 4] 4090 	call rest_context 
      0095C7 BB 00 18         [ 2] 4091 	jp syntax_error
      0095CA CD 82 5E         [ 4] 4092 3$: call dpush 
      0095CD CC 96 A6         [ 4] 4093 	call store 
      0095D0 CD 92 01         [ 4] 4094 	call rest_context
      0095D3 CD 95 23         [ 4] 4095 	call next_token 
      0095D6 A6 20            [ 1] 4096 	cp a,#TK_COMMA 
      0095D8 CD 82            [ 1] 4097 	jreq input_loop 
      0095DA 4B 1E            [ 1] 4098 	cp a,#TK_COLON 
      0095DC 03 1C            [ 2] 4099     jrule input_exit 
      0095DE 00 02 20         [ 2] 4100 	jp syntax_error 
      001746                       4101 input_exit:
      001746                       4102 	_drop VSIZE 
      0095E1 BA A1            [ 2]    1     addw sp,#VSIZE 
      0095E3 0A               [ 4] 4103 	ret 
                                   4104 
                                   4105 
                                   4106 ;---------------------
                                   4107 ; BASIC: REMARK | ' 
                                   4108 ; skip comment to end of line 
                                   4109 ;---------------------- 
      001749                       4110 rem:
      0095E4 26 0D 72 BB 00   [ 1] 4111  	mov count,in 
      0095E9 18               [ 4] 4112 	ret 
                                   4113 
                                   4114 ;---------------------
                                   4115 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   4116 ; read in loop 'addr'  
                                   4117 ; apply & 'mask' to value 
                                   4118 ; loop while result==0.  
                                   4119 ; if 'xor_mask' given 
                                   4120 ; apply ^ in second  
                                   4121 ; loop while result==0 
                                   4122 ;---------------------
                           000001  4123 	XMASK=1 
                           000002  4124 	MASK=2
                           000003  4125 	ADDR=3
                           000004  4126 	VSIZE=4
      00174F                       4127 wait: 
      00174F                       4128 	_vars VSIZE
      0095EA CD 95            [ 2]    1     sub sp,#VSIZE 
      0095EC 37 72            [ 1] 4129 	clr (XMASK,sp) 
      0095EE B0 00 18         [ 4] 4130 	call arg_list 
      0095F1 20 A9            [ 1] 4131 	cp a,#2
      0095F3 A1 05            [ 1] 4132 	jruge 0$
      0095F5 26 1A 72         [ 2] 4133 	jp syntax_error 
      0095F8 DE 00            [ 1] 4134 0$:	cp a,#3
      0095FA 18 1D            [ 1] 4135 	jrult 1$
      0095FC 00 29 9F         [ 4] 4136 	call dpop 
      0095FF 44               [ 1] 4137 	ld a,xl
      009600 AB 41            [ 1] 4138 	ld (XMASK,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009602 CD 82 4B         [ 4] 4139 1$: call dpop ; mask 
      009605 A6               [ 1] 4140 	ld a,xl 
      009606 20 CD            [ 1] 4141 	ld (MASK,sp),a 
      009608 82 4B 1E         [ 4] 4142 	call dpop ; address 
      00960B 03               [ 1] 4143 2$:	ld a,(x)
      00960C 1C 00            [ 1] 4144 	and a,(MASK,sp)
      00960E 02 20            [ 1] 4145 	xor a,(XMASK,sp)
      009610 8B A1            [ 1] 4146 	jreq 2$ 
      001777                       4147 	_drop VSIZE 
      009612 02 26            [ 2]    1     addw sp,#VSIZE 
      009614 0A               [ 4] 4148 	ret 
                                   4149 
                                   4150 ;---------------------
                                   4151 ; BASIC: BSET addr,mask
                                   4152 ; set bits at 'addr' corresponding 
                                   4153 ; to those of 'mask' that are at 1.
                                   4154 ; arguments:
                                   4155 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4156 ;   mask        mask|addr
                                   4157 ; output:
                                   4158 ;	none 
                                   4159 ;--------------------------
      00177A                       4160 bit_set:
      009615 A6 40 CD         [ 4] 4161 	call arg_list 
      009618 82 4B            [ 1] 4162 	cp a,#2	 
      00961A 1E 03            [ 1] 4163 	jreq 1$ 
      00961C CC 95 9C         [ 2] 4164 	jp syntax_error
      001784                       4165 1$: 
      00961F A1 04 26         [ 4] 4166 	call dpop ; mask 
      009622 0F               [ 1] 4167 	ld a,xl 
      009623 72 DE 00         [ 4] 4168 	call dpop ; addr  
      009626 18               [ 1] 4169 	or a,(x)
      009627 CD               [ 1] 4170 	ld (x),a
      009628 8A               [ 4] 4171 	ret 
                                   4172 
                                   4173 ;---------------------
                                   4174 ; BASIC: BRES addr,mask
                                   4175 ; reset bits at 'addr' corresponding 
                                   4176 ; to those of 'mask' that are at 1.
                                   4177 ; arguments:
                                   4178 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4179 ;   mask	    ~mask&*addr  
                                   4180 ; output:
                                   4181 ;	none 
                                   4182 ;--------------------------
      00178E                       4183 bit_reset:
      009629 96 1E 03         [ 4] 4184 	call arg_list 
      00962C 1C 00            [ 1] 4185 	cp a,#2  
      00962E 02 CC            [ 1] 4186 	jreq 1$ 
      009630 95 9C A1         [ 2] 4187 	jp syntax_error
      001798                       4188 1$: 
      009633 31 2B 1A         [ 4] 4189 	call dpop ; mask 
      009636 A1               [ 1] 4190 	ld a,xl 
      009637 35               [ 1] 4191 	cpl a 
      009638 22 16 A0         [ 4] 4192 	call dpop ; addr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00963B 31               [ 1] 4193 	and a,(x)
      00963C 48               [ 1] 4194 	ld (x),a 
      00963D 90               [ 4] 4195 	ret 
                                   4196 
                                   4197 ;---------------------
                                   4198 ; BASIC: BTOGL addr,mask
                                   4199 ; toggle bits at 'addr' corresponding 
                                   4200 ; to those of 'mask' that are at 1.
                                   4201 ; arguments:
                                   4202 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4203 ;   mask	    mask^*addr  
                                   4204 ; output:
                                   4205 ;	none 
                                   4206 ;--------------------------
      0017A3                       4207 bit_toggle:
      00963E 5F 90 97         [ 4] 4208 	call arg_list 
      009641 72 A9            [ 1] 4209 	cp a,#2 
      009643 96 BF            [ 1] 4210 	jreq 1$ 
      009645 90 FE 93         [ 2] 4211 	jp syntax_error
      009648 CD 82 5E         [ 4] 4212 1$: call dpop ; mask 
      00964B 1E               [ 1] 4213 	ld a,xl 
      00964C 03 CC 95         [ 4] 4214 	call dpop ; addr  
      00964F 9C               [ 1] 4215 	xor a,(x)
      009650 A1               [ 1] 4216 	ld (x),a 
      009651 10               [ 4] 4217 	ret 
                                   4218 
                                   4219 
                                   4220 ;---------------------
                                   4221 ; BASIC: BTEST(addr,bit)
                                   4222 ; return bit value at 'addr' 
                                   4223 ; bit is in range {0..7}.
                                   4224 ; arguments:
                                   4225 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4226 ;   bit 	    bit position {0..7}  
                                   4227 ; output:
                                   4228 ;	none 
                                   4229 ;--------------------------
      0017B7                       4230 bit_test:
      009652 26 04 A6         [ 4] 4231 	call func_args 
      009655 2B 20            [ 1] 4232 	cp a,#2
      009657 46 A1            [ 1] 4233 	jreq 0$
      009659 11 26 04         [ 2] 4234 	jp syntax_error
      0017C1                       4235 0$:	
      00965C A6 2D 20         [ 4] 4236 	call dpop 
      00965F 3E               [ 1] 4237 	ld a,xl 
      009660 A1 20            [ 1] 4238 	and a,#7
      009662 2B               [ 1] 4239 	push a 
      009663 0E A1            [ 1] 4240 	ld a,#1 
      009665 22 22            [ 1] 4241 1$: tnz (1,sp)
      009667 0A A0            [ 1] 4242 	jreq 2$
      009669 20               [ 1] 4243 	sll a 
      00966A 5F 97            [ 1] 4244 	dec (1,sp)
      00966C 1C 96            [ 2] 4245 	jra 1$
      00966E BC F6 20         [ 4] 4246 2$: call dpop 
      009671 2C               [ 1] 4247 	and a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009672 A1 0B            [ 1] 4248 	jreq 3$
      009674 2B 0E            [ 1] 4249 	ld a,#1 
      009676 A1               [ 1] 4250 3$:	clrw x 
      009677 0E               [ 1] 4251 	ld xl,a 
      009678 22 0A            [ 1] 4252 	ld a,#TK_INTGR
      0017DF                       4253 	_drop 1 
      00967A A0 0B            [ 2]    1     addw sp,#1 
      00967C 5F               [ 4] 4254 	ret
                                   4255 
                                   4256 
                                   4257 ;--------------------
                                   4258 ; BASIC: POKE addr,byte
                                   4259 ; put a byte at addr 
                                   4260 ;--------------------
      0017E2                       4261 poke:
      00967D 97 1C 96         [ 4] 4262 	call arg_list 
      009680 B8 F6            [ 1] 4263 	cp a,#2
      009682 20 1A            [ 1] 4264 	jreq 1$
      009684 A1 03 26         [ 2] 4265 	jp syntax_error
      0017EC                       4266 1$:	
      009687 14 A6 5C         [ 4] 4267 	call dpop 
      00968A CD               [ 1] 4268     ld a,xl 
      00968B 82 4B 1E         [ 4] 4269 	call dpop 
      00968E 03               [ 1] 4270 	ld (x),a 
      00968F 72               [ 4] 4271 	ret 
                                   4272 
                                   4273 ;-----------------------
                                   4274 ; BASIC: PEEK(addr)
                                   4275 ; get the byte at addr 
                                   4276 ; input:
                                   4277 ;	none 
                                   4278 ; output:
                                   4279 ;	X 		value 
                                   4280 ;-----------------------
      0017F5                       4281 peek:
      009690 D6 00 18         [ 4] 4282 	call func_args
      009693 5C 1F            [ 1] 4283 	cp a,#1
      009695 03 CD            [ 1] 4284 	jreq 1$
      009697 82 4B CC         [ 2] 4285 	jp syntax_error
      00969A 95 9C A6         [ 4] 4286 1$:	call dpop 
      00969D 3A               [ 1] 4287 	ld a,(x)
      00969E CD               [ 1] 4288 	clrw x 
      00969F 82               [ 1] 4289 	ld xl,a 
      0096A0 4B 1E            [ 1] 4290 	ld a,#TK_INTGR
      0096A2 03               [ 4] 4291 	ret 
                                   4292 
                                   4293 ;----------------------------
                                   4294 ; BASIC: XPEEK(page,addr)
                                   4295 ; read extended memory byte
                                   4296 ; page in range {0,1,2}
                                   4297 ;----------------------------
      001808                       4298 xpeek:
      0096A3 CC 95 9C         [ 4] 4299 	call func_args 
      0096A6 A1 02            [ 1] 4300 	cp a,#2 
      0096A6 A6 0D            [ 1] 4301 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0096A8 CD 82 4B         [ 2] 4302 	jp syntax_error
      001812                       4303 1$: 
      0096AB 7B 02 C7         [ 4] 4304 	call dpop 
      0096AE 00 27 7B         [ 2] 4305 	ldw farptr+1,x 
      0096B1 01 C7 00         [ 4] 4306 	call dpop 
      0096B4 0B               [ 1] 4307 	ld a,xl 
      0096B5 5B 05 81         [ 1] 4308 	ld farptr,a 
      0096B8 28               [ 1] 4309 	clrw x
      0096B9 29 2C 23 2A      [ 5] 4310 	ldf a,[farptr]
      0096BD 2F               [ 1] 4311 	ld xl,a 
      0096BE 25 96            [ 1] 4312 	ld a,#TK_INTGR 
      0096C0 CB               [ 4] 4313 	ret 
                                   4314 
                                   4315 ;---------------------------
                                   4316 ; BASIC IF expr : instructions
                                   4317 ; evaluate expr and if true 
                                   4318 ; execute instructions on same line. 
                                   4319 ;----------------------------
      001828                       4320 if: 
      0096C1 96 CD 96         [ 4] 4321 	call relation 
      0096C4 CF 96            [ 1] 4322 	cp a,#TK_INTGR
      0096C6 D2 96            [ 1] 4323 	jreq 1$ 
      0096C8 D4 96 D7         [ 2] 4324 	jp syntax_error
      0096CB 3E               [ 1] 4325 1$:	clr a 
      0096CC 00               [ 2] 4326 	tnzw x 
      0096CD 3D 00            [ 1] 4327 	jrne 9$  
                                   4328 ;skip to next line
      0096CF 3E 3D 00 3C 00   [ 1] 4329 	mov in,count
      0096D4 3C               [ 4] 4330 9$:	ret 
                                   4331 
                                   4332 ;------------------------
                                   4333 ; BASIC: FOR var=expr 
                                   4334 ; set variable to expression 
                                   4335 ; leave variable address 
                                   4336 ; on dstack and set
                                   4337 ; FLOOP bit in 'flags'
                                   4338 ;-----------------
                           000001  4339 	RETL1=1
                           000003  4340 	INW=3
                           000005  4341 	BPTR=5
      00183C                       4342 for: ; { -- var_addr }
      0096D5 3D 00            [ 1] 4343 	ld a,#TK_VAR 
      0096D7 3C 3E 00         [ 4] 4344 	call expect
      0096DA CD 10 11         [ 4] 4345 	call dpush 
      0096DA 4B 00 00         [ 4] 4346 	call let02 
      0096DC 72 14 00 25      [ 1] 4347 	bset flags,#FLOOP 
                                   4348 ; open space on cstack for BPTR and INW 
      0096DC 0F               [ 2] 4349 	popw x ; call return address 
      00184C                       4350 	_vars 4
      0096DD 01 04            [ 2]    1     sub sp,#4 
      0096DE 89               [ 2] 4351 	pushw x  ; RETL1 
      0096DE CD               [ 1] 4352 	clrw x 
      0096DF 93 D9            [ 2] 4353 	ldw (BPTR,sp),x 
      0096E1 A1 01            [ 2] 4354 	ldw (INW,sp),x 
      0096E3 27 51 A1         [ 4] 4355 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0096E6 04 26            [ 1] 4356 	cp a,#TK_CMD 
      0096E8 05 CD            [ 1] 4357 	jreq 1$
      0096EA 8A 96 20         [ 2] 4358 	jp syntax_error
      00185E                       4359 1$:  
      0096ED EE 18 66         [ 2] 4360 	cpw x,#to 
      0096EE 27 03            [ 1] 4361 	jreq to
      0096EE CD 88 EC         [ 2] 4362 	jp syntax_error 
                                   4363 
                                   4364 ;-----------------------------------
                                   4365 ; BASIC: TO expr 
                                   4366 ; second part of FOR loop initilization
                                   4367 ; leave limit on dstack and set 
                                   4368 ; FTO bit in 'flags'
                                   4369 ;-----------------------------------
      001866                       4370 to: ; { var_addr -- var_addr limit step }
      0096F1 A1 00 27 41 A1   [ 2] 4371 	btjt flags,#FLOOP,1$
      0096F6 0A 26 05         [ 2] 4372 	jp syntax_error
      0096F9 CD 82 5E         [ 4] 4373 1$: call relation  
      0096FC 20 DE            [ 1] 4374 	cp a,#TK_INTGR 
      0096FE A1 03            [ 1] 4375 	jreq 2$ 
      009700 26 06 9F         [ 2] 4376 	jp syntax_error
      001878                       4377 2$: 
      009703 CD 82 4B         [ 4] 4378     call dpush ; limit
      009706 20 D4 00         [ 2] 4379 	ldw x,in.w 
      009708 CD 08 6C         [ 4] 4380 	call next_token
      009708 A1 08            [ 1] 4381 	cp a,#TK_NONE  
      00970A 26 07            [ 1] 4382 	jreq 4$ 
      00970C FD 9F            [ 1] 4383 	cp a,#TK_CMD
      00970E CD 82            [ 1] 4384 	jrne 3$
      009710 4B 20 C9         [ 2] 4385 	cpw x,#step 
      009713 27 0B            [ 1] 4386 	jreq step
      00188E                       4387 3$:	
      009713 A1 0D 26         [ 4] 4388 	call unget_token   	 
      001891                       4389 4$:	
      009716 05 03 01         [ 2] 4390 	ldw x,#1   ; default step  
      009719 CC 96 DE         [ 4] 4391 	call dpush
      00971C 20 15            [ 2] 4392 	jra store_loop_addr 
                                   4393 
                                   4394 
                                   4395 ;----------------------------------
                                   4396 ; BASIC: STEP expr 
                                   4397 ; optional third par of FOR loop
                                   4398 ; initialization. 	
                                   4399 ;------------------------------------
      001899                       4400 step: ; {var limit -- var limit step}
      00971C A1 0E 26 13 CD   [ 2] 4401 	btjt flags,#FLOOP,1$
      009721 88 EC A1         [ 2] 4402 	jp syntax_error
      009724 04 27 03         [ 4] 4403 1$: call relation
      009727 CC 88            [ 1] 4404 	cp a,#TK_INTGR
      009729 38 03            [ 1] 4405 	jreq 2$
      00972A CC 07 B8         [ 2] 4406 	jp syntax_error
      00972A 9F A4 0F         [ 4] 4407 2$:	call dpush
                                   4408 ; leave loop back entry point on cstack 
                                   4409 ; cstack is 2 call deep from interp_loop
      0018AE                       4410 store_loop_addr:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00972D C7 00 27         [ 2] 4411 	ldw x,basicptr  
      009730 CC 96            [ 2] 4412 	ldw (BPTR,sp),x 
      009732 DC 00 00         [ 2] 4413 	ldw x,in.w 
      009733 1F 03            [ 2] 4414 	ldw (INW,sp),x   
      009733 CD 90 8B 25      [ 1] 4415 	bres flags,#FLOOP 
      009736 72 5C 00 22      [ 1] 4416 	inc loop_depth  
      009736 0D               [ 4] 4417 	ret 
                                   4418 
                                   4419 ;--------------------------------
                                   4420 ; BASIC: NEXT var 
                                   4421 ; FOR loop control 
                                   4422 ; increment variable with step 
                                   4423 ; and compare with limit 
                                   4424 ; loop if threshold not crossed.
                                   4425 ; else clean both stacks. 
                                   4426 ; and decrement 'loop_depth' 
                                   4427 ;--------------------------------
      0018C1                       4428 next: ; {var limit step -- [var limit step ] }
      009737 01 26 05 A6      [ 1] 4429 	tnz loop_depth 
      00973B 0D CD            [ 1] 4430 	jrne 1$ 
      00973D 82 4B 5B         [ 2] 4431 	jp syntax_error 
      0018CA                       4432 1$: 
      009740 01 81            [ 1] 4433 	ld a,#TK_VAR 
      009742 CD 12 08         [ 4] 4434 	call expect
                                   4435 ; check for good variable after NEXT 	 
      009742 CE 00            [ 1] 4436 	ldw y,x 
      009744 05 1F 03         [ 2] 4437 	ldw x,#4  
      009747 C6 00 02 6B      [ 4] 4438 	cpw y,([dstkptr],x) ; compare variables address 
      00974B 05 C6            [ 1] 4439 	jreq 2$  
      00974D 00 04 6B         [ 2] 4440 	jp syntax_error ; not the good one 
      0018DD                       4441 2$: ; increment variable 
      009750 06               [ 1] 4442 	ldw x,y
      009751 81               [ 2] 4443 	ldw x,(x)  ; get var value 
      009752 CF 00 0C         [ 2] 4444 	ldw acc16,x 
      009752 1E 03 CF 00      [ 5] 4445 	ldw x,[dstkptr] ; step
      009756 05 7B 05 C7      [ 2] 4446 	addw x,acc16 ; var+step 
      00975A 00 02            [ 2] 4447 	ldw (y),x ; save var new value 
                                   4448 ; compare with limit 
      00975C 7B 06            [ 1] 4449 	ldw y,x 
      00975E C7 00 04 81      [ 5] 4450 	ldw x,[dstkptr] ; step in x 
      009762 5D               [ 2] 4451 	tnzw x  
      009762 52 05            [ 1] 4452 	jrpl 4$ ; positive step 
                                   4453 ;negative step 
      009764 AE 00 02         [ 2] 4454 	ldw x,#2
      009764 0F 05 CD 88      [ 4] 4455 	cpw y,([dstkptr],x)
      009768 EC A1            [ 1] 4456 	jrslt loop_done
      00976A 0A 26            [ 2] 4457 	jra loop_back 
      001900                       4458 4$: ; positive step
      00976C 08 CD 82         [ 2] 4459 	ldw x,#2 
      00976F 5E 03 05 CD      [ 4] 4460 	cpw y,([dstkptr],x)
      009773 88 EC            [ 1] 4461 	jrsgt loop_done
      001909                       4462 loop_back:
      009775 A1 05            [ 2] 4463 	ldw x,(BPTR,sp)
      009777 27 03 CC         [ 2] 4464 	ldw basicptr,x 
      00977A 88 38 CD 90 91   [ 2] 4465 	btjf flags,#FRUN,1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00977F 0D 05            [ 1] 4466 	ld a,(2,x)
      009781 26 06 AE         [ 1] 4467 	ld count,a
      009784 17 38            [ 2] 4468 1$:	ldw x,(INW,sp)
      009786 CD 82 5E         [ 2] 4469 	ldw in.w,x 
      009789 81               [ 4] 4470 	ret 
      00191E                       4471 loop_done:
                                   4472 	; remove var limit step on dstack 
      009789 A6 3A CD         [ 2] 4473 	ldw x,dstkptr 
      00978C 82 4B CD         [ 2] 4474 	addw x,#3*CELL_SIZE
      00978F 97 42 72         [ 2] 4475 	ldw dstkptr,x 
                                   4476 	; remove 2 return address on cstack 
      009792 5F               [ 2] 4477 	popw x
      001928                       4478 	_drop 4
      009793 00 04            [ 2]    1     addw sp,#4 
      009795 CD               [ 2] 4479 	pushw x 
      009796 8B 86 AE 16      [ 1] 4480 	dec loop_depth 
      00979A E8               [ 4] 4481 	ret 
                                   4482 
                                   4483 ;----------------------------
                                   4484 ; called by goto/gosub
                                   4485 ; to get target line number 
                                   4486 ;---------------------------
      001930                       4487 get_target_line:
      00979B CF 00 05         [ 4] 4488 	call relation 
      00979E 72 5F            [ 1] 4489 	cp a,#TK_INTGR
      0097A0 00 02            [ 1] 4490 	jreq 1$
      0097A2 CD 8D FF         [ 2] 4491 	jp syntax_error
      0097A5 A1 04 27         [ 4] 4492 1$:	call search_lineno  
      0097A8 06               [ 2] 4493 	tnzw x 
      0097A9 CD 97            [ 1] 4494 	jrne 2$ 
      0097AB 52 CC            [ 1] 4495 	ld a,#ERR_NO_LINE 
      0097AD 88 38 CD         [ 2] 4496 	jp tb_error 
      0097B0 90               [ 4] 4497 2$:	ret 
                                   4498 
                                   4499 ;------------------------
                                   4500 ; BASIC: GOTO line# 
                                   4501 ; jump to line# 
                                   4502 ; here cstack is 2 call deep from interp_loop 
                                   4503 ;------------------------
      001946                       4504 goto:
      0097B1 91 CD 90 D8 CD   [ 2] 4505 	btjt flags,#FRUN,0$ 
      0097B6 97 52            [ 1] 4506 	ld a,#ERR_RUN_ONLY
      0097B8 CD 88 EC         [ 2] 4507 	jp tb_error 
      0097BB A1               [ 4] 4508 	ret 
      0097BC 0D 27 A5         [ 4] 4509 0$:	call get_target_line
      001954                       4510 jp_to_target:
      0097BF A1 01 23         [ 2] 4511 	ldw basicptr,x 
      0097C2 03 CC            [ 1] 4512 	ld a,(2,x)
      0097C4 88 38 03         [ 1] 4513 	ld count,a 
      0097C6 35 03 00 01      [ 1] 4514 	mov in,#3 
      0097C6 5B               [ 4] 4515 	ret 
                                   4516 
                                   4517 
                                   4518 ;--------------------
                                   4519 ; BASIC: GOSUB line#
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4520 ; basic subroutine call
                                   4521 ; actual line# and basicptr 
                                   4522 ; are saved on cstack
                                   4523 ; here cstack is 2 call deep from interp_loop 
                                   4524 ;--------------------
                           000003  4525 	RET_ADDR=3
                           000005  4526 	RET_INW=5
                           000004  4527 	VSIZE=4  
      001961                       4528 gosub:
      0097C7 05 81 00 25 06   [ 2] 4529 	btjt flags,#FRUN,0$ 
      0097C9 A6 06            [ 1] 4530 	ld a,#ERR_RUN_ONLY
      0097C9 55 00 02         [ 2] 4531 	jp tb_error 
      0097CC 00               [ 4] 4532 	ret 
      0097CD 04               [ 2] 4533 0$:	popw x 
      00196D                       4534 	_vars VSIZE  
      0097CE 81 04            [ 2]    1     sub sp,#VSIZE 
      0097CF 89               [ 2] 4535 	pushw x 
      0097CF 52 04 0F         [ 2] 4536 	ldw x,basicptr
      0097D2 01 CD            [ 2] 4537 	ldw (RET_ADDR,sp),x 
      0097D4 92 95 A1         [ 4] 4538 	call get_target_line  
      0097D7 02               [ 2] 4539 	pushw x 
      0097D8 24 03 CC         [ 2] 4540 	ldw x,in.w 
      0097DB 88 38            [ 2] 4541 	ldw (RET_INW+2,sp),x
      0097DD A1               [ 2] 4542 	popw x 
      0097DE 03 25            [ 2] 4543 	jra jp_to_target
                                   4544 
                                   4545 ;------------------------
                                   4546 ; BASIC: RETURN 
                                   4547 ; exit from a subroutine 
                                   4548 ; 
                                   4549 ;------------------------
      001981                       4550 return:
      0097E0 06 CD 90 9E 9F   [ 2] 4551 	btjt flags,#FRUN,0$ 
      0097E5 6B 01            [ 1] 4552 	ld a,#ERR_RUN_ONLY
      0097E7 CD 90 9E         [ 2] 4553 	jp tb_error 
      00198B                       4554 0$:	
      0097EA 9F 6B            [ 2] 4555 	ldw x,(RET_ADDR,sp) 
      0097EC 02 CD 90         [ 2] 4556 	ldw basicptr,x
      0097EF 9E F6            [ 1] 4557 	ld a,(2,x)
      0097F1 14 02 18         [ 1] 4558 	ld count,a  
      0097F4 01 27            [ 2] 4559 	ldw x,(RET_INW,sp)
      0097F6 F9 5B 04         [ 2] 4560 	ldw in.w,x 
      0097F9 81               [ 2] 4561 	popw x 
      0097FA                       4562 	_drop VSIZE 
      0097FA CD 92            [ 2]    1     addw sp,#VSIZE 
      0097FC 95               [ 2] 4563 	pushw x
      0097FD A1               [ 4] 4564 	ret  
                                   4565 
                                   4566 
                                   4567 ;----------------------------------
                                   4568 ; BASIC: RUN
                                   4569 ; run BASIC program in RAM
                                   4570 ;----------------------------------- 
      00199F                       4571 run: 
      0097FE 02 27 03 CC 88   [ 2] 4572 	btjf flags,#FRUN,0$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009803 38               [ 1] 4573 	clr a 
      009804 81               [ 4] 4574 	ret
      0019A6                       4575 0$: 
      009804 CD 90 9E 9F CD   [ 2] 4576 	btjf flags,#FBREAK,1$
      0019AB                       4577 	_drop 2 
      009809 90 9E            [ 2]    1     addw sp,#2 
      00980B FA F7 81         [ 4] 4578 	call rest_context
      00980E                       4579 	_drop CTXT_SIZE 
      00980E CD 92            [ 2]    1     addw sp,#CTXT_SIZE 
      009810 95 A1 02 27      [ 1] 4580 	bres flags,#FBREAK 
      009814 03 CC 88 38      [ 1] 4581 	bset flags,#FRUN 
      009818 CC 08 3E         [ 2] 4582 	jp interp_loop 
      009818 CD 90 9E         [ 2] 4583 1$:	ldw x,txtbgn
      00981B 9F 43 CD         [ 2] 4584 	cpw x,txtend 
      00981E 90 9E            [ 1] 4585 	jrmi run_it 
      009820 F4               [ 1] 4586 	clr a 
      009821 F7               [ 4] 4587 	ret
                                   4588 
      0019C7                       4589 run_it:	 
      009822 81 13 D4         [ 4] 4590     call ubound 
      009823                       4591 	_drop 2 ; drop return address 
      009823 CD 92            [ 2]    1     addw sp,#2 
                                   4592 ; clear data pointer 
      009825 95               [ 1] 4593 	clrw x 
      009826 A1 02 27         [ 2] 4594 	ldw data_ptr,x 
      009829 03 CC 88 38      [ 1] 4595 	clr data_ofs 
      00982D CD 90 9E 9F      [ 1] 4596 	clr data_len 
                                   4597 ; initialize BASIC pointer 
      009831 CD 90 9E         [ 2] 4598 	ldw x,txtbgn 
      009834 F8 F7 81         [ 2] 4599 	ldw basicptr,x 
      009837 E6 02            [ 1] 4600 	ld a,(2,x)
      009837 CD 92 B9         [ 1] 4601 	ld count,a
      00983A A1 02 27 03      [ 1] 4602 	mov in,#3	
      00983E CC 88 38 25      [ 1] 4603 	bset flags,#FRUN 
      009841 CC 08 3E         [ 2] 4604 	jp interp_loop 
                                   4605 
                                   4606 
                                   4607 ;----------------------
                                   4608 ; BASIC: STOP 
                                   4609 ; stop running program
                                   4610 ;---------------------- 
      0019EE                       4611 stop: 
                                   4612 ; clean dstack and cstack 
      009841 CD 90 9E         [ 2] 4613 	ldw x,#STACK_EMPTY 
      009844 9F               [ 1] 4614 	ldw sp,x 
      009845 A4 07 88 A6      [ 1] 4615 	bres flags,#FRUN 
      009849 01 0D 01 27      [ 1] 4616 	bres flags,#FBREAK
      00984D 05 48 0A         [ 2] 4617 	jp warm_start
                                   4618 
                                   4619 
                                   4620 ;-----------------------
                                   4621 ; BASIC: TONE expr1,expr2
                                   4622 ; used TIMER2 channel 1
                                   4623 ; to produce a tone 
                                   4624 ; arguments:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4625 ;    expr1   frequency 
                                   4626 ;    expr2   duration msec.
                                   4627 ;---------------------------
      0019FD                       4628 tone:
      009850 01 20 F7         [ 4] 4629 	call arg_list 
      009853 CD 90            [ 1] 4630 	cp a,#2 
      009855 9E F4            [ 1] 4631 	jreq 1$
      009857 27 02 A6         [ 2] 4632 	jp syntax_error 
      001A07                       4633 1$: 
      001A07                       4634 beep:
      00985A 01 5F 97         [ 4] 4635 	call dpop ; duration
      00985D A6               [ 2] 4636 	pushw x 
      00985E 04 5B 01         [ 4] 4637 	call dpop ; frequency
      009861 81 93            [ 1] 4638 	ldw y,x 
      009862 AE F4 24         [ 2] 4639 	ldw x,#TIM2_CLK_FREQ
      009862 CD               [ 2] 4640 	divw x,y 
                                   4641 ; round to nearest integer 
      009863 92 95 A1 02      [ 2] 4642 	cpw y,#TIM2_CLK_FREQ/2
      009867 27 03            [ 1] 4643 	jrmi 2$
      009869 CC               [ 2] 4644 	incw x 
      001A1B                       4645 2$:	 
      00986A 88               [ 1] 4646 	ld a,xh 
      00986B 38 53 0D         [ 1] 4647 	ld TIM2_ARRH,a 
      00986C 9F               [ 1] 4648 	ld a,xl 
      00986C CD 90 9E         [ 1] 4649 	ld TIM2_ARRL,a 
                                   4650 ; 50% duty cycle 
      00986F 9F               [ 1] 4651 	ccf 
      009870 CD               [ 2] 4652 	rrcw x 
      009871 90               [ 1] 4653 	ld a,xh 
      009872 9E F7 81         [ 1] 4654 	ld TIM2_CCR1H,a 
      009875 9F               [ 1] 4655 	ld a,xl
      009875 CD 92 B9         [ 1] 4656 	ld TIM2_CCR1L,a
      009878 A1 01 27 03      [ 1] 4657 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00987C CC 88 38 CD      [ 1] 4658 	bset TIM2_CR1,#TIM2_CR1_CEN
      009880 90 9E F6 5F      [ 1] 4659 	bset TIM2_EGR,#TIM2_EGR_UG
      009884 97               [ 2] 4660 	popw x 
      009885 A6 04 81         [ 2] 4661 	ldw timer,x 
      009888 CE 00 10         [ 2] 4662 3$: ldw x,timer 	
      009888 CD 92            [ 1] 4663 	jrne 3$ 
      00988A B9 A1 02 27      [ 1] 4664 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00988E 03 CC 88 38      [ 1] 4665 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009892 81               [ 4] 4666 	ret 
                                   4667 
                                   4668 ;-------------------------------
                                   4669 ; BASIC: ADCON 0|1 [,divisor]  
                                   4670 ; disable/enanble ADC 
                                   4671 ;-------------------------------
      001A4B                       4672 power_adc:
      009892 CD 90 9E         [ 4] 4673 	call arg_list 
      009895 CF 00            [ 1] 4674 	cp a,#2	
      009897 18 CD            [ 1] 4675 	jreq 1$
      009899 90 9E            [ 1] 4676 	cp a,#1 
      00989B 9F C7            [ 1] 4677 	jreq 0$ 
      00989D 00 17 5F         [ 2] 4678 	jp syntax_error 
      0098A0 92 BC 00         [ 2] 4679 0$: ldw x,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0098A3 17 97 A6         [ 4] 4680 	call dpush 
      0098A6 04 81 02         [ 2] 4681 1$: ldw x,#2
      0098A8 72 DE 00 1C      [ 5] 4682 	ldw x,([dstkptr],x) ; on|off
      0098A8 CD               [ 2] 4683 	tnzw x 
      0098A9 93 D9            [ 1] 4684 	jreq 2$ 
      0098AB A1 04 27 03      [ 5] 4685 	ldw x,[dstkptr] ; divisor 
      0098AF CC               [ 1] 4686 	ld a,xl
      0098B0 88 38            [ 1] 4687 	and a,#7
      0098B2 4F               [ 1] 4688 	swap a 
      0098B3 5D 26 05         [ 1] 4689 	ld ADC_CR1,a
      0098B6 55 00 04 00      [ 1] 4690 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0098BA 02 81 54 01      [ 1] 4691 	bset ADC_CR1,#ADC_CR1_ADON 
      0098BC                       4692 	_usec_dly 7 
      0098BC A6 05 CD         [ 2]    1     ldw x,#(16*7-2)/4
      0098BF 92               [ 2]    2     decw x
      0098C0 88               [ 1]    3     nop 
      0098C1 CD 90            [ 1]    4     jrne .-4
      0098C3 91 CD            [ 2] 4693 	jra 3$
      0098C5 94 80 72 14      [ 1] 4694 2$: bres ADC_CR1,#ADC_CR1_ADON
      0098C9 00 26 85 52      [ 1] 4695 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0098CD 04 89 5F         [ 2] 4696 3$:	ldw x,#4 ; drop 2 elements on dstack 
      0098D0 1F 05 1F 03      [ 2] 4697 	addw x,dstkptr
      0098D4 CD 88 EC         [ 2] 4698 	ldw dstkptr,x 
      0098D7 A1               [ 4] 4699 	ret
                                   4700 
                                   4701 ;-----------------------------
                                   4702 ; BASIC: ADCREAD (channel)
                                   4703 ; read adc channel {0..5}
                                   4704 ; output:
                                   4705 ;   A 		TK_INTGR 
                                   4706 ;   X 		value 
                                   4707 ;-----------------------------
      001A98                       4708 analog_read:
      0098D8 06 27 03         [ 4] 4709 	call func_args 
      0098DB CC 88            [ 1] 4710 	cp a,#1 
      0098DD 38 03            [ 1] 4711 	jreq 1$
      0098DE CC 07 B8         [ 2] 4712 	jp syntax_error
      0098DE A3 98 E6         [ 4] 4713 1$: call dpop 
      0098E1 27 03 CC         [ 2] 4714 	cpw x,#5 
      0098E4 88 38            [ 2] 4715 	jrule 2$
      0098E6 A6 0A            [ 1] 4716 	ld a,#ERR_BAD_VALUE
      0098E6 72 04 00         [ 2] 4717 	jp tb_error 
      0098E9 26               [ 1] 4718 2$: ld a,xl
      0098EA 03 CC 88         [ 1] 4719 	ld acc8,a 
      0098ED 38 CD            [ 1] 4720 	ld a,#5
      0098EF 93 D9 A1         [ 1] 4721 	sub a,acc8 
      0098F2 04 27 03         [ 1] 4722 	ld ADC_CSR,a
      0098F5 CC 88 38 02      [ 1] 4723 	bset ADC_CR2,#ADC_CR2_ALIGN
      0098F8 72 10 54 01      [ 1] 4724 	bset ADC_CR1,#ADC_CR1_ADON
      0098F8 CD 90 91 CE 00   [ 2] 4725 	btjf ADC_CSR,#ADC_CSR_EOC,.
      0098FD 01 CD 88         [ 2] 4726 	ldw x,ADC_DRH
      009900 EC A1            [ 1] 4727 	ld a,#TK_INTGR
      009902 00               [ 4] 4728 	ret 
                                   4729 
                                   4730 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4731 ; BASIC: DREAD(pin)
                                   4732 ; Arduino pins 
                                   4733 ; read state of a digital pin 
                                   4734 ; pin# {0..15}
                                   4735 ; output:
                                   4736 ;    A 		TK_INTGR
                                   4737 ;    X      0|1 
                                   4738 ;-------------------------
                           000001  4739 	PINNO=1
                           000001  4740 	VSIZE=1
      001ACE                       4741 digital_read:
      001ACE                       4742 	_vars VSIZE 
      009903 27 0C            [ 2]    1     sub sp,#VSIZE 
      009905 A1 06 26         [ 4] 4743 	call func_args
      009908 05 A3            [ 1] 4744 	cp a,#1
      00990A 99 19            [ 1] 4745 	jreq 1$
      00990C 27 0B B8         [ 2] 4746 	jp syntax_error
      00990E CD 10 1E         [ 4] 4747 1$: call dpop 
      00990E CD 90 8B         [ 2] 4748 	cpw x,#15 
      009911 23 05            [ 2] 4749 	jrule 2$
      009911 AE 00            [ 1] 4750 	ld a,#ERR_BAD_VALUE
      009913 01 CD 90         [ 2] 4751 	jp tb_error 
      009916 91 20 15         [ 4] 4752 2$:	call select_pin 
      009919 6B 01            [ 1] 4753 	ld (PINNO,sp),a
      009919 72 04            [ 1] 4754 	ld a,(GPIO_IDR,x)
      00991B 00 26            [ 1] 4755 	tnz (PINNO,sp)
      00991D 03 CC            [ 1] 4756 	jreq 8$
      00991F 88               [ 1] 4757 3$: srl a 
      009920 38 CD            [ 1] 4758 	dec (PINNO,sp)
      009922 93 D9            [ 1] 4759 	jrne 3$ 
      009924 A1 04            [ 1] 4760 8$: and a,#1 
      009926 27               [ 1] 4761 	clrw x 
      009927 03               [ 1] 4762 	ld xl,a 
      009928 CC 88            [ 1] 4763 	ld a,#TK_INTGR
      001AFD                       4764 	_drop VSIZE
      00992A 38 CD            [ 2]    1     addw sp,#VSIZE 
      00992C 90               [ 4] 4765 	ret
                                   4766 
                                   4767 ;-----------------------
                                   4768 ; BASIC: DWRITE pin,0|1
                                   4769 ; Arduino pins 
                                   4770 ; write to a digital pin 
                                   4771 ; pin# {0..15}
                                   4772 ; output:
                                   4773 ;    A 		TK_INTGR
                                   4774 ;    X      0|1 
                                   4775 ;-------------------------
                           000001  4776 	PINNO=1
                           000002  4777 	PINVAL=2
                           000002  4778 	VSIZE=2
      001B00                       4779 digital_write:
      001B00                       4780 	_vars VSIZE 
      00992D 91 02            [ 2]    1     sub sp,#VSIZE 
      00992E CD 12 15         [ 4] 4781 	call arg_list  
      00992E CE 00            [ 1] 4782 	cp a,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009930 05 1F            [ 1] 4783 	jreq 1$
      009932 05 CE 00         [ 2] 4784 	jp syntax_error
      009935 01 1F 03         [ 4] 4785 1$: call dpop 
      009938 72               [ 1] 4786 	ld a,xl 
      009939 15 00            [ 1] 4787 	ld (PINVAL,sp),a
      00993B 26 72 5C         [ 4] 4788 	call dpop
      00993E 00 23 81         [ 2] 4789 	cpw x,#15 
      009941 23 05            [ 2] 4790 	jrule 2$
      009941 72 5D            [ 1] 4791 	ld a,#ERR_BAD_VALUE
      009943 00 23 26         [ 2] 4792 	jp tb_error 
      009946 03 CC 88         [ 4] 4793 2$:	call select_pin 
      009949 38 01            [ 1] 4794 	ld (PINNO,sp),a 
      00994A A6 01            [ 1] 4795 	ld a,#1
      00994A A6 05            [ 1] 4796 	tnz (PINNO,sp)
      00994C CD 92            [ 1] 4797 	jreq 4$
      00994E 88               [ 1] 4798 3$: sll a
      00994F 90 93            [ 1] 4799 	dec (PINNO,sp)
      009951 AE 00            [ 1] 4800 	jrne 3$
      009953 04 72            [ 1] 4801 4$: tnz (PINVAL,sp)
      009955 D3 00            [ 1] 4802 	jrne 5$
      009957 1D               [ 1] 4803 	cpl a 
      009958 27 03            [ 1] 4804 	and a,(GPIO_ODR,x)
      00995A CC 88            [ 2] 4805 	jra 8$
      00995C 38 00            [ 1] 4806 5$: or a,(GPIO_ODR,x)
      00995D E7 00            [ 1] 4807 8$: ld (GPIO_ODR,x),a 
      001B3C                       4808 	_drop VSIZE 
      00995D 93 FE            [ 2]    1     addw sp,#VSIZE 
      00995F CF               [ 4] 4809 	ret
                                   4810 
                                   4811 
                                   4812 ;-----------------------
                                   4813 ; BASIC: BREAK 
                                   4814 ; insert a breakpoint 
                                   4815 ; in pogram. 
                                   4816 ; the program is resumed
                                   4817 ; with RUN 
                                   4818 ;-------------------------
      001B3F                       4819 break:
      009960 00 0D 72 CE 00   [ 2] 4820 	btjt flags,#FRUN,2$
      009965 1D               [ 1] 4821 	clr a
      009966 72               [ 4] 4822 	ret 
      001B46                       4823 2$:	 
                                   4824 ; create space on cstack to save context 
      009967 BB 00 0D         [ 2] 4825 	ldw x,#break_point 
      00996A 90 FF 90         [ 4] 4826 	call puts 
      001B4C                       4827 	_drop 2 ;drop return address 
      00996D 93 72            [ 2]    1     addw sp,#2 
      001B4E                       4828 	_vars CTXT_SIZE ; context size 
      00996F CE 00            [ 2]    1     sub sp,#CTXT_SIZE 
      009971 1D 5D 2A         [ 4] 4829 	call save_context 
      009974 0B AE 00         [ 2] 4830 	ldw x,#tib 
      009977 02 72 D3         [ 2] 4831 	ldw basicptr,x
      00997A 00               [ 1] 4832 	clr (x)
      00997B 1D 2F 20 20      [ 1] 4833 	clr count  
      00997F 09               [ 1] 4834 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009980 CF 00 00         [ 2] 4835 	ldw in.w,x
      009980 AE 00 02 72      [ 1] 4836 	bres flags,#FRUN 
      009984 D3 00 1D 2C      [ 1] 4837 	bset flags,#FBREAK
      009988 15 08 3E         [ 2] 4838 	jp interp_loop 
      009989 0A 62 72 65 61 6B 20  4839 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4840 
                                   4841 ;-----------------------
                                   4842 ; BASIC: NEW
                                   4843 ; from command line only 
                                   4844 ; free program memory
                                   4845 ; and clear variables 
                                   4846 ;------------------------
      001B8B                       4847 new: 
      009989 1E 05 CF 00 05   [ 2] 4848 	btjf flags,#FRUN,0$ 
      00998E 72               [ 1] 4849 	clr a 
      00998F 01               [ 4] 4850 	ret 
      001B92                       4851 0$:	
      009990 00 26 05         [ 4] 4852 	call clear_basic 
      009993 E6               [ 4] 4853 	ret 
                                   4854 	 
                                   4855 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4856 ;  file system routines
                                   4857 ;  MCU flash memory from
                                   4858 ;  0x10000-0x27fff is 
                                   4859 ;  used to store BASIC 
                                   4860 ;  program files. 
                                   4861 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4862 
                                   4863 ;--------------------
                                   4864 ; input:
                                   4865 ;   X     increment 
                                   4866 ; output:
                                   4867 ;   farptr  incremented 
                                   4868 ;---------------------
      001B96                       4869 incr_farptr:
      009994 02 C7 00 04      [ 2] 4870 	addw x,farptr+1 
      009998 1E 03            [ 1] 4871 	jrnc 1$
      00999A CF 00 01 81      [ 1] 4872 	inc farptr 
      00999E CF 00 17         [ 2] 4873 1$:	ldw farptr+1,x  
      00999E CE               [ 4] 4874 	ret 
                                   4875 
                                   4876 ;------------------------------
                                   4877 ; extended flash memory used as FLASH_DRIVE 
                                   4878 ; seek end of used flash drive   
                                   4879 ; starting at 0x10000 address.
                                   4880 ; 4 consecutives 0 bytes signal free space. 
                                   4881 ; input:
                                   4882 ;	none
                                   4883 ; output:
                                   4884 ;   ffree     free_addr| 0 if memory full.
                                   4885 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      001BA4                       4886 seek_fdrive:
                                   4887 ; start scan at 0x10000 address 
      00999F 00 1D            [ 1] 4888 	ld a,#1
      0099A1 1C 00 06         [ 1] 4889 	ld farptr,a 
      0099A4 CF               [ 1] 4890 	clrw x 
      0099A5 00 1D 85         [ 2] 4891 	ldw farptr+1,x 
      001BAD                       4892 1$:
      0099A8 5B 04 89         [ 2] 4893 	ldw x,#3  
      0099AB 72 5A 00 23      [ 5] 4894 2$:	ldf a,([farptr],x) 
      0099AF 81 05            [ 1] 4895 	jrne 3$
      0099B0 5A               [ 2] 4896 	decw x
      0099B0 CD 93            [ 1] 4897 	jrpl 2$
      0099B2 D9 A1            [ 2] 4898 	jra 4$ 
      0099B4 04               [ 2] 4899 3$:	incw x 
      0099B5 27 03 CC         [ 4] 4900 	call incr_farptr
      0099B8 88 38 CD         [ 2] 4901 	ldw x,#0x27f 
      0099BB 83 8E 5D         [ 2] 4902 	cpw x,farptr
      0099BE 26 05            [ 1] 4903 	jrpl 1$
                                   4904 ; drive full 
      0099C0 A6 05 CC 88      [ 1] 4905 	clr ffree 
      0099C4 3A 81 00 1A      [ 1] 4906 	clr ffree+1 
      0099C6 72 5F 00 1B      [ 1] 4907 	clr ffree+2 
      0099C6 72               [ 4] 4908 	ret
      001BD4                       4909 4$: ; copy farptr to ffree	 
      0099C7 00 00 26         [ 2] 4910 	ldw x,farptr 
      0099CA 06 A6 06         [ 1] 4911 	ld a,farptr+2 
      0099CD CC 88 3A         [ 2] 4912 	ldw ffree,x 
      0099D0 81 CD 99         [ 1] 4913 	ld ffree+2,a  
      0099D3 B0               [ 4] 4914 	ret 
                                   4915 
                                   4916 ;-----------------------
                                   4917 ; compare file name 
                                   4918 ; with name pointed by Y  
                                   4919 ; input:
                                   4920 ;   farptr   file name 
                                   4921 ;   Y        target name 
                                   4922 ; output:
                                   4923 ;   farptr 	 at file_name
                                   4924 ;   X 		 farptr[x] point at size field  
                                   4925 ;   Carry    0|1 no match|match  
                                   4926 ;----------------------
      0099D4                       4927 cmp_name:
      0099D4 CF               [ 1] 4928 	clrw x
      0099D5 00 05 E6 02      [ 5] 4929 1$:	ldf a,([farptr],x)
      0099D9 C7 00            [ 1] 4930 	cp a,(y)
      0099DB 04 35            [ 1] 4931 	jrne 4$
      0099DD 03               [ 1] 4932 	tnz a 
      0099DE 00 02            [ 1] 4933 	jreq 9$ 
      0099E0 81               [ 2] 4934     incw x 
      0099E1 90 5C            [ 2] 4935 	incw y 
      0099E1 72 00            [ 2] 4936 	jra 1$
      001BF2                       4937 4$: ;no match 
      0099E3 00               [ 1] 4938 	tnz a 
      0099E4 26 06            [ 1] 4939 	jreq 5$
      0099E6 A6               [ 2] 4940 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      0099E7 06 CC 88 3A      [ 5] 4941 	ldf a,([farptr],x)
      0099EB 81 85            [ 2] 4942 	jra 4$  
      0099ED 52               [ 2] 4943 5$:	incw x ; farptr[x] point at 'size' field 
      0099EE 04               [ 1] 4944 	rcf 
      0099EF 89               [ 4] 4945 	ret
      001BFF                       4946 9$: ; match  
      0099F0 CE               [ 2] 4947 	incw x  ; farptr[x] at 'size' field 
      0099F1 00               [ 1] 4948 	scf 
      0099F2 05               [ 4] 4949 	ret 
                                   4950 
                                   4951 ;-----------------------
                                   4952 ; search file in 
                                   4953 ; flash memory 
                                   4954 ; input:
                                   4955 ;   Y       file name  
                                   4956 ; output:
                                   4957 ;   farptr  addr at name|0
                                   4958 ;-----------------------
                           000001  4959 	FSIZE=1
                           000003  4960 	YSAVE=3
                           000004  4961 	VSIZE=4 
      001C02                       4962 search_file: 
      001C02                       4963 	_vars VSIZE
      0099F3 1F 03            [ 2]    1     sub sp,#VSIZE 
      0099F5 CD 99            [ 2] 4964 	ldw (YSAVE,sp),y  
      0099F7 B0               [ 1] 4965 	clrw x 
      0099F8 89 CE 00         [ 2] 4966 	ldw farptr+1,x 
      0099FB 01 1F 07 85      [ 1] 4967 	mov farptr,#1
      001C0E                       4968 1$:	
                                   4969 ; check if farptr is after any file 
                                   4970 ; if  0 then so.
      0099FF 20 D3 00 16      [ 5] 4971 	ldf a,[farptr]
      009A01 27 25            [ 1] 4972 	jreq 6$
      009A01 72               [ 1] 4973 2$: clrw x 	
      009A02 00 00            [ 2] 4974 	ldw y,(YSAVE,sp) 
      009A04 26 05 A6         [ 4] 4975 	call cmp_name
      009A07 06 CC            [ 1] 4976 	jrc 9$
      009A09 88 3A 00 16      [ 5] 4977 	ldf a,([farptr],x)
      009A0B 6B 01            [ 1] 4978 	ld (FSIZE,sp),a 
      009A0B 1E               [ 2] 4979 	incw x 
      009A0C 03 CF 00 05      [ 5] 4980 	ldf a,([farptr],x)
      009A10 E6 02            [ 1] 4981 	ld (FSIZE+1,sp),a 
      009A12 C7               [ 2] 4982 	incw x 
      009A13 00 04 1E         [ 2] 4983 	addw x,(FSIZE,sp) ; count to skip 
      009A16 05               [ 2] 4984 	incw x ; skip over EOF marker 
      009A17 CF 00 01         [ 4] 4985 	call incr_farptr ; now at next file 'name_field'
      009A1A 85 5B 04         [ 2] 4986 	ldw x,#0x280
      009A1D 89 81 16         [ 2] 4987 	cpw x,farptr 
      009A1F 2A D5            [ 1] 4988 	jrpl 1$
      001C39                       4989 6$: ; file not found 
      009A1F 72 01 00 26      [ 1] 4990 	clr farptr
      009A23 02 4F 81 17      [ 1] 4991 	clr farptr+1 
      009A26 72 5F 00 18      [ 1] 4992 	clr farptr+2 
      001C45                       4993 	_drop VSIZE 
      009A26 72 09            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009A28 00               [ 1] 4994 	rcf
      009A29 26               [ 4] 4995 	ret
      001C49                       4996 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001C49                       4997 	_drop VSIZE 
      009A2A 12 5B            [ 2]    1     addw sp,#VSIZE 
      009A2C 02               [ 1] 4998 	scf 	
      009A2D CD               [ 4] 4999 	ret
                                   5000 
                                   5001 ;--------------------------------
                                   5002 ; BASIC: SAVE "name" 
                                   5003 ; save text program in 
                                   5004 ; flash memory used as 
                                   5005 ;--------------------------------
                           000001  5006 	BSIZE=1
                           000003  5007 	NAMEPTR=3
                           000004  5008 	VSIZE=4
      001C4D                       5009 save:
      009A2E 97 52 5B 04 72   [ 2] 5010 	btjf flags,#FRUN,0$ 
      009A33 19 00            [ 1] 5011 	ld a,#ERR_CMD_ONLY 
      009A35 26 72 10         [ 2] 5012 	jp tb_error
      001C57                       5013 0$:	 
      009A38 00 26 CC         [ 2] 5014 	ldw x,txtend 
      009A3B 88 BE CE 00      [ 2] 5015 	subw x,txtbgn
      009A3F 1F C3            [ 1] 5016 	jrne 1$
                                   5017 ; nothing to save 
      009A41 00               [ 4] 5018 	ret 
      001C61                       5019 1$:	
      001C61                       5020 	_vars VSIZE 
      009A42 21 2B            [ 2]    1     sub sp,#VSIZE 
      009A44 02 4F            [ 2] 5021 	ldw (BSIZE,sp),x 
      009A46 81 08 6C         [ 4] 5022 	call next_token	
      009A47 A1 0A            [ 1] 5023 	cp a,#TK_QSTR
      009A47 CD 94            [ 1] 5024 	jreq 2$
      009A49 54 5B 02         [ 2] 5025 	jp syntax_error
      001C6F                       5026 2$: 
      009A4C 5F CF 00 07      [ 2] 5027 	ldw y,basicptr 
      009A50 72 5F 00 09      [ 2] 5028 	addw y,in.w
      009A54 72 5F            [ 2] 5029 	ldw (NAMEPTR,sp),y  
      009A56 00 0A CE 00 1F   [ 1] 5030 	mov in,count 
                                   5031 ; check if enough free space 
      009A5B CF               [ 1] 5032 	ldw x,y 
      009A5C 00 05 E6         [ 4] 5033 	call strlen 
      009A5F 02 C7 00         [ 2] 5034 	addw x,#3 
      009A62 04 35 03         [ 2] 5035 	addw x,(BSIZE,sp)
      009A65 00 02 72 10      [ 1] 5036 	tnz ffree 
      009A69 00 26            [ 1] 5037 	jrne 21$
      009A6B CC 88 BE 1A      [ 2] 5038 	subw x,ffree+1 
      009A6E 23 05            [ 2] 5039 	jrule 21$
      009A6E AE 17            [ 1] 5040 	ld a,#ERR_MEM_FULL 
      009A70 FF 94 72         [ 2] 5041 	jp tb_error
      001C99                       5042 21$: 
                                   5043 ; check for existing file of that name 
      009A73 11 00            [ 2] 5044 	ldw y,(NAMEPTR,sp)	
      009A75 26 72 19         [ 4] 5045 	call search_file 
      009A78 00 26            [ 1] 5046 	jrnc 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A7A CC 88            [ 1] 5047 	ld a,#ERR_DUPLICATE 
      009A7C 7B 07 BA         [ 2] 5048 	jp tb_error 
      009A7D                       5049 3$:	;** write file name to flash **
      009A7D CD 92 95         [ 2] 5050 	ldw x,ffree 
      009A80 A1 02 27         [ 1] 5051 	ld a,ffree+2 
      009A83 03 CC 88         [ 2] 5052 	ldw farptr,x 
      009A86 38 00 18         [ 1] 5053 	ld farptr+2,a 
      009A87 1E 03            [ 2] 5054 	ldw x,(NAMEPTR,sp)  
      009A87 CD 02 A0         [ 4] 5055 	call strlen 
      009A87 CD               [ 2] 5056 	incw  x
      009A88 90 9E            [ 2] 5057 	ldw (BSIZE,sp),x  
      009A8A 89               [ 1] 5058 	clrw x   
      009A8B CD 90            [ 2] 5059 	ldw y,(NAMEPTR,sp)
      009A8D 9E 90 93         [ 4] 5060 	call write_block  
                                   5061 ;** write file length after name **
      009A90 AE F4 24         [ 2] 5062 	ldw x,txtend 
      009A93 65 90 A3 7A      [ 2] 5063 	subw x,txtbgn
      009A97 12 2B            [ 2] 5064 	ldw (BSIZE,sp),x 
      009A99 01               [ 1] 5065 	clrw x 
      009A9A 5C 01            [ 1] 5066 	ld a,(1,sp)
      009A9B CD 00 F8         [ 4] 5067 	call write_byte 
      009A9B 9E               [ 2] 5068 	incw x 
      009A9C C7 53            [ 1] 5069 	ld a,(2,sp)
      009A9E 0D 9F C7         [ 4] 5070 	call write_byte
      009AA1 53               [ 2] 5071 	incw x  
      009AA2 0E 8C 56         [ 4] 5072 	call incr_farptr ; move farptr after SIZE field 
                                   5073 ;** write BASIC text **
                                   5074 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009AA5 9E C7            [ 2] 5075 	ldw x,(BSIZE,sp)
      009AA7 53               [ 2] 5076 	pushw x ; write_block argument 
      009AA8 0F               [ 1] 5077 	clrw x 
      009AA9 9F C7 53 10      [ 2] 5078 	ldw y,txtbgn  ; BASIC text to save 
      009AAD 72 10 53         [ 4] 5079 	call write_block 
      001CE3                       5080 	_drop 2 ;  drop write_block argument  
      009AB0 08 72            [ 2]    1     addw sp,#2 
                                   5081 ; write en end of file marker 
      009AB2 10 53 00         [ 2] 5082 	ldw x,#1
      009AB5 72 10            [ 1] 5083 	ld a,#EOF  
      009AB7 53 04 85         [ 4] 5084 	call write_byte 
      009ABA CF 00 11         [ 4] 5085 	call incr_farptr
                                   5086 ; save farptr in ffree
      009ABD CE 00 11         [ 2] 5087 	ldw x,farptr 
      009AC0 26 FB 72         [ 1] 5088 	ld a,farptr+2 
      009AC3 11 53 08         [ 2] 5089 	ldw ffree,x 
      009AC6 72 11 53         [ 1] 5090 	ld ffree+2,a
                                   5091 ;write 4 zero bytes as an end of all files marker 
      009AC9 00               [ 1] 5092     clrw x 
      009ACA 81 04            [ 1] 5093 	push #4 
      009ACB                       5094 4$:
      009ACB CD               [ 1] 5095 	clr a 
      009ACC 92 95 A1         [ 4] 5096 	call write_byte 
      009ACF 02               [ 2] 5097 	incw x 
      009AD0 27 0D            [ 1] 5098 	dec (1,sp)
      009AD2 A1 01            [ 1] 5099 	jrne 4$
      009AD4 27               [ 1] 5100 5$: pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   5101 ; display saved size  
      009AD5 03 CC            [ 2] 5102 	ldw x,(BSIZE,sp) 
      009AD7 88 38 AE         [ 4] 5103 	call print_int 
      001D0E                       5104 	_drop VSIZE 
      009ADA 00 00            [ 2]    1     addw sp,#VSIZE 
      009ADC CD               [ 4] 5105 	ret 
                                   5106 
                                   5107 ;----------------------
                                   5108 ; load file in RAM memory
                                   5109 ; input:
                                   5110 ;    farptr point at file size 
                                   5111 ; output:
                                   5112 ;   y point after BASIC program in RAM.
                                   5113 ;------------------------
      001D11                       5114 load_file:
      009ADD 90 91 AE         [ 4] 5115 	call incr_farptr  
      009AE0 00 02 72         [ 4] 5116 	call clear_basic  
      009AE3 DE               [ 1] 5117 	clrw x
      009AE4 00 1D 5D 27      [ 5] 5118 	ldf a,([farptr],x)
      009AE8 1C 72            [ 1] 5119 	ld yh,a 
      009AEA CE               [ 2] 5120 	incw x  
      009AEB 00 1D 9F A4      [ 5] 5121 	ldf a,([farptr],x)
      009AEF 07               [ 2] 5122 	incw x 
      009AF0 4E C7            [ 1] 5123 	ld yl,a 
      009AF2 54 01 72 16      [ 2] 5124 	addw y,txtbgn
      009AF6 50 CA 72 10      [ 2] 5125 	ldw txtend,y
      009AFA 54 01 AE 00      [ 2] 5126 	ldw y,txtbgn
      001D32                       5127 3$:	; load BASIC text 	
      009AFE 1B 5A 9D 26      [ 5] 5128 	ldf a,([farptr],x)
      009B02 FA 20            [ 1] 5129 	ld (y),a 
      009B04 08               [ 2] 5130 	incw x 
      009B05 72 11            [ 2] 5131 	incw y 
      009B07 54 01 72 17      [ 2] 5132 	cpw y,txtend 
      009B0B 50 CA            [ 1] 5133 	jrmi 3$
      009B0D AE               [ 4] 5134 	ret 
                                   5135 
                                   5136 ;------------------------
                                   5137 ; BASIC: LOAD "file" 
                                   5138 ; load file to RAM 
                                   5139 ; for execution 
                                   5140 ;------------------------
      001D42                       5141 load:
      009B0E 00 04 72 BB 00   [ 2] 5142 	btjf flags,#FRUN,0$ 
      009B13 1D CF            [ 1] 5143 	jreq 0$ 
      009B15 00 1D            [ 1] 5144 	ld a,#ERR_CMD_ONLY 
      009B17 81 07 BA         [ 2] 5145 	jp tb_error 
      009B18                       5146 0$:	
      009B18 CD 92 B9         [ 4] 5147 	call next_token 
      009B1B A1 01            [ 1] 5148 	cp a,#TK_QSTR
      009B1D 27 03            [ 1] 5149 	jreq 1$
      009B1F CC 88 38         [ 2] 5150 	jp syntax_error 
      001D58                       5151 1$:	
      009B22 CD 90 9E A3      [ 2] 5152 	ldw y,basicptr
      009B26 00 05 23 05      [ 2] 5153 	addw y,in.w 
      009B2A A6 0A CC 88 3A   [ 1] 5154 	mov in,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009B2F 9F C7 00         [ 4] 5155 	call search_file 
      009B32 0E A6            [ 1] 5156 	jrc 2$ 
      009B34 05 C0            [ 1] 5157 	ld a,#ERR_NOT_FILE
      009B36 00 0E C7         [ 2] 5158 	jp tb_error  
      001D6F                       5159 2$:
      009B39 54 00 72         [ 4] 5160 	call load_file
                                   5161 ; print loaded size 	 
      009B3C 16 54 02         [ 2] 5162 	ldw x,txtend 
      009B3F 72 10 54 01      [ 2] 5163 	subw x,txtbgn
      009B43 72 0F 54         [ 4] 5164 	call print_int 
      009B46 00               [ 4] 5165 	ret 
                                   5166 
                                   5167 ;-----------------------------------
                                   5168 ; BASIC: FORGET ["file_name"] 
                                   5169 ; erase file_name and all others 
                                   5170 ; after it. 
                                   5171 ; without argument erase all files 
                                   5172 ;-----------------------------------
      001D7D                       5173 forget:
      009B47 FB CE 54         [ 4] 5174 	call next_token 
      009B4A 04 A6            [ 1] 5175 	cp a,#TK_NONE 
      009B4C 04 81            [ 1] 5176 	jreq 3$ 
      009B4E A1 0A            [ 1] 5177 	cp a,#TK_QSTR
      009B4E 52 01            [ 1] 5178 	jreq 1$
      009B50 CD 92 B9         [ 2] 5179 	jp syntax_error
      009B53 A1 01 27 03      [ 2] 5180 1$: ldw y,basicptr
      009B57 CC 88 38 CD      [ 2] 5181 	addw y,in.w
      009B5B 90 9E A3 00 0F   [ 1] 5182 	mov in,count 
      009B60 23 05 A6         [ 4] 5183 	call search_file
      009B63 0A CC            [ 1] 5184 	jrc 2$
      009B65 88 3A            [ 1] 5185 	ld a,#ERR_NOT_FILE 
      009B67 CD A1 65         [ 2] 5186 	jp tb_error 
      001DA2                       5187 2$: 
      009B6A 6B 01 E6         [ 2] 5188 	ldw x,farptr
      009B6D 01 0D 01         [ 1] 5189 	ld a,farptr+2
      009B70 27 05            [ 2] 5190 	jra 4$ 
      001DAA                       5191 3$: ; forget all files 
      009B72 44 0A 01         [ 2] 5192 	ldw x,#0x100
      009B75 26               [ 1] 5193 	clr a 
      009B76 FB A4 01         [ 2] 5194 	ldw farptr,x 
      009B79 5F 97 A6         [ 1] 5195 	ld farptr+2,a 
      001DB4                       5196 4$:
      009B7C 04 5B 01         [ 2] 5197 	ldw ffree,x 
      009B7F 81 00 1B         [ 1] 5198 	ld ffree+2,a 
      009B80 4B 04            [ 1] 5199 	push #4
      009B80 52               [ 1] 5200 	clrw x 
      001DBD                       5201 5$: 
      009B81 02               [ 1] 5202 	clr a  
      009B82 CD 92 95         [ 4] 5203 	call write_byte 
      009B85 A1               [ 2] 5204 	incw x 
      009B86 02 27            [ 1] 5205 	dec (1,sp)
      009B88 03 CC            [ 1] 5206 	jrne 5$	
      009B8A 88               [ 1] 5207 6$: pop a 
      009B8B 38               [ 4] 5208 	ret 
                                   5209 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5210 ;----------------------
                                   5211 ; BASIC: DIR 
                                   5212 ; list saved files 
                                   5213 ;----------------------
                           000001  5214 	COUNT=1 ; files counter 
                           000002  5215 	VSIZE=2 
      001DC8                       5216 directory:
      001DC8                       5217 	_vars VSIZE 
      009B8C CD 90            [ 2]    1     sub sp,#VSIZE 
      009B8E 9E               [ 1] 5218 	clrw x 
      009B8F 9F 6B            [ 2] 5219 	ldw (COUNT,sp),x 
      009B91 02 CD 90         [ 2] 5220 	ldw farptr+1,x 
      009B94 9E A3 00 0F      [ 1] 5221 	mov farptr,#1 
      001DD4                       5222 dir_loop:
      009B98 23               [ 1] 5223 	clrw x 
      009B99 05 A6 0A CC      [ 5] 5224 	ldf a,([farptr],x)
      009B9D 88 3A            [ 1] 5225 	jreq 8$ 
      001DDB                       5226 1$: ;name loop 	
      009B9F CD A1 65 6B      [ 5] 5227 	ldf a,([farptr],x)
      009BA3 01 A6            [ 1] 5228 	jreq 2$ 
      009BA5 01 0D 01         [ 4] 5229 	call putc 
      009BA8 27               [ 2] 5230 	incw x 
      009BA9 05 48            [ 2] 5231 	jra 1$
      009BAB 0A               [ 2] 5232 2$: incw x ; skip ending 0. 
      009BAC 01 26            [ 1] 5233 	ld a,#SPACE 
      009BAE FB 0D 02         [ 4] 5234 	call putc 
                                   5235 ; get file size 	
      009BB1 26 05 43 E4      [ 5] 5236 	ldf a,([farptr],x)
      009BB5 00 20            [ 1] 5237 	ld yh,a 
      009BB7 02               [ 2] 5238 	incw x 
      009BB8 EA 00 E7 00      [ 5] 5239 	ldf a,([farptr],x)
      009BBC 5B               [ 2] 5240 	incw x 
      009BBD 02 81            [ 1] 5241 	ld yl,a 
      009BBF 90 89            [ 2] 5242 	pushw y 
      009BBF 72 00 00         [ 2] 5243 	addw x,(1,sp)
      009BC2 26               [ 2] 5244 	incw x ; skip EOF marker 
                                   5245 ; skip to next file 
      009BC3 02 4F 81         [ 4] 5246 	call incr_farptr 
                                   5247 ; print file size 
      009BC6 85               [ 2] 5248 	popw x ; file size 
      009BC6 AE 9B ED         [ 4] 5249 	call print_int 
      009BC9 CD 82            [ 1] 5250 	ld a,#CR 
      009BCB 5E 5B 02         [ 4] 5251 	call putc
      009BCE 52 04            [ 2] 5252 	ldw x,(COUNT,sp)
      009BD0 CD               [ 2] 5253 	incw x
      009BD1 97 42            [ 2] 5254 	ldw (COUNT,sp),x  
      009BD3 AE 16            [ 2] 5255 	jra dir_loop 
      001E14                       5256 8$: ; print number of files 
      009BD5 E8 CF            [ 2] 5257 	ldw x,(COUNT,sp)
      009BD7 00 05 7F         [ 4] 5258 	call print_int 
      009BDA 72 5F 00         [ 2] 5259 	ldw x,#file_count 
      009BDD 04 5F CF         [ 4] 5260 	call puts  
                                   5261 ; print drive free space 	
      009BE0 00 01            [ 1] 5262 	ld a,#0xff 
      009BE2 72 11 00         [ 1] 5263 	sub a,ffree+2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009BE5 26 72 18         [ 1] 5264 	ld acc8,a 
      009BE8 00 26            [ 1] 5265 	ld a,#0x7f 
      009BEA CC 88 BE         [ 1] 5266 	sbc a,ffree+1 
      009BED 0A 62 72         [ 1] 5267 	ld acc16,a 
      009BF0 65 61            [ 1] 5268 	ld a,#2 
      009BF2 6B 20 70         [ 1] 5269 	sbc a,ffree 
      009BF5 6F 69 6E         [ 1] 5270 	ld acc24,a 
      009BF8 74               [ 1] 5271 	clrw x  
      009BF9 2C 20            [ 1] 5272 	ld a,#6 
      009BFB 52               [ 1] 5273 	ld xl,a 
      009BFC 55 4E            [ 1] 5274 	ld a,#10 
      009BFE 20 74 6F         [ 4] 5275 	call prti24 
      009C01 20 72 65         [ 2] 5276 	ldw x,#drive_free
      009C04 73 75 6D         [ 4] 5277 	call puts 
      001E46                       5278 	_drop VSIZE 
      009C07 65 2E            [ 2]    1     addw sp,#VSIZE 
      009C09 0A               [ 4] 5279 	ret
      009C0A 00 66 69 6C 65 73 0A  5280 file_count: .asciz " files\n"
             00
      009C0B 20 62 79 74 65 73 20  5281 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5282 
                                   5283 ;---------------------
                                   5284 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5285 ; write 1 or more byte to FLASH or EEPROM
                                   5286 ; starting at address  
                                   5287 ; input:
                                   5288 ;   expr1  	is address 
                                   5289 ;   expr2,...,exprn   are bytes to write
                                   5290 ; output:
                                   5291 ;   none 
                                   5292 ;---------------------
                           000001  5293 	ADDR=1
                           000002  5294 	VSIZ=2 
      001E5E                       5295 write:
      001E5E                       5296 	_vars VSIZE 
      009C0B 72 01            [ 2]    1     sub sp,#VSIZE 
      009C0D 00 26 02 4F      [ 1] 5297 	clr farptr ; expect 16 bits address 
      009C11 81 13 15         [ 4] 5298 	call expression
      009C12 A1 04            [ 1] 5299 	cp a,#TK_INTGR 
      009C12 CD 87            [ 1] 5300 	jreq 0$
      009C14 02 81 B8         [ 2] 5301 	jp syntax_error
      009C16 1F 01            [ 2] 5302 0$: ldw (ADDR,sp),x 
      009C16 72 BB 00         [ 4] 5303 	call next_token 
      009C19 18 24            [ 1] 5304 	cp a,#TK_COMMA 
      009C1B 04 72            [ 1] 5305 	jreq 1$ 
      009C1D 5C 00            [ 2] 5306 	jra 9$ 
      009C1F 17 CF 00         [ 4] 5307 1$:	call expression
      009C22 18 81            [ 1] 5308 	cp a,#TK_INTGR
      009C24 27 03            [ 1] 5309 	jreq 2$
      009C24 A6 01 C7         [ 2] 5310 	jp syntax_error
      009C27 00               [ 1] 5311 2$:	ld a,xl 
      009C28 17 5F            [ 2] 5312 	ldw x,(ADDR,sp) 
      009C2A CF 00 18         [ 2] 5313 	ldw farptr+1,x 
      009C2D 5F               [ 1] 5314 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009C2D AE 00 03         [ 4] 5315 	call write_byte
      009C30 92 AF            [ 2] 5316 	ldw x,(ADDR,sp)
      009C32 00               [ 2] 5317 	incw x 
      009C33 17 26            [ 2] 5318 	jra 0$ 
      001E92                       5319 9$:
      001E92                       5320 	_drop VSIZE
      009C35 05 5A            [ 2]    1     addw sp,#VSIZE 
      009C37 2A               [ 4] 5321 	ret 
                                   5322 
                                   5323 
                                   5324 ;---------------------
                                   5325 ;BASIC: CHAR(expr)
                                   5326 ; évaluate expression 
                                   5327 ; and take the 7 least 
                                   5328 ; bits as ASCII character
                                   5329 ;---------------------
      001E95                       5330 char:
      009C38 F7 20 19         [ 4] 5331 	call func_args 
      009C3B 5C CD            [ 1] 5332 	cp a,#1
      009C3D 9C 16            [ 1] 5333 	jreq 1$
      009C3F AE 02 7F         [ 2] 5334 	jp syntax_error
      009C42 C3 00 17         [ 4] 5335 1$:	call dpop 
      009C45 2A               [ 1] 5336 	ld a,xl 
      009C46 E6 72            [ 1] 5337 	and a,#0x7f 
      009C48 5F               [ 1] 5338 	ld xl,a
      009C49 00 1A            [ 1] 5339 	ld a,#TK_CHAR
      009C4B 72               [ 4] 5340 	ret
                                   5341 
                                   5342 ;---------------------
                                   5343 ; BASIC: ASC(string|char)
                                   5344 ; extract first character 
                                   5345 ; of string argument 
                                   5346 ; return it as TK_INTGR 
                                   5347 ;---------------------
      001EA9                       5348 ascii:
      009C4C 5F 00            [ 1] 5349 	ld a,#TK_LPAREN
      009C4E 1B 72 5F         [ 4] 5350 	call expect 
      009C51 00 1C 81         [ 4] 5351 	call next_token 
      009C54 A1 0A            [ 1] 5352 	cp a,#TK_QSTR 
      009C54 CE 00            [ 1] 5353 	jreq 1$
      009C56 17 C6            [ 1] 5354 	cp a,#TK_CHAR 
      009C58 00 19            [ 1] 5355 	jreq 2$ 
      009C5A CF 00 1A         [ 2] 5356 	jp syntax_error
      001EBC                       5357 1$: 
      009C5D C7               [ 1] 5358 	ld a,(x) 
      009C5E 00               [ 1] 5359 	clrw x
      009C5F 1C               [ 1] 5360 	ld xl,a 
      001EBF                       5361 2$: 
      009C60 81               [ 2] 5362 	pushw x 
      009C61 A6 0C            [ 1] 5363 	ld a,#TK_RPAREN 
      009C61 5F 92 AF         [ 4] 5364 	call expect
      009C64 00               [ 2] 5365 	popw x 
      009C65 17 90            [ 1] 5366 	ld a,#TK_INTGR 
      009C67 F1               [ 4] 5367 	ret 
                                   5368 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5369 ;---------------------
                                   5370 ;BASIC: KEY
                                   5371 ; wait for a character 
                                   5372 ; received from STDIN 
                                   5373 ; input:
                                   5374 ;	none 
                                   5375 ; output:
                                   5376 ;	X 		ASCII character 
                                   5377 ;---------------------
      001EC9                       5378 key:
      009C68 26 08 4D         [ 4] 5379 	call getc 
      009C6B 27               [ 1] 5380 	clrw x 
      009C6C 12               [ 1] 5381 	ld xl,a 
      009C6D 5C 90            [ 1] 5382 	ld a,#TK_INTGR
      009C6F 5C               [ 4] 5383 	ret
                                   5384 
                                   5385 ;----------------------
                                   5386 ; BASIC: QKEY
                                   5387 ; Return true if there 
                                   5388 ; is a character in 
                                   5389 ; waiting in STDIN 
                                   5390 ; input:
                                   5391 ;  none 
                                   5392 ; output:
                                   5393 ;   X 		0|-1 
                                   5394 ;-----------------------
      001ED1                       5395 qkey: 
      009C70 20               [ 1] 5396 	clrw x 
      009C71 F0 5D 00 27      [ 1] 5397 	tnz rx_char
      009C72 27 01            [ 1] 5398 	jreq 9$ 
      009C72 4D               [ 2] 5399 	cplw x 
      009C73 27 07            [ 1] 5400 9$: ld a,#TK_INTGR
      009C75 5C               [ 4] 5401 	ret 
                                   5402 
                                   5403 ;---------------------
                                   5404 ; BASIC: GPIO(expr,reg)
                                   5405 ; return gpio address 
                                   5406 ; expr {0..8}
                                   5407 ; input:
                                   5408 ;   none 
                                   5409 ; output:
                                   5410 ;   X 		gpio register address
                                   5411 ;----------------------------
      001EDC                       5412 gpio:
      009C76 92 AF 00         [ 4] 5413 	call func_args 
      009C79 17 20            [ 1] 5414 	cp a,#2
      009C7B F6 5C            [ 1] 5415 	jreq 1$
      009C7D 98 81 B8         [ 2] 5416 	jp syntax_error  
      009C7F                       5417 1$:	
      009C7F 5C 99 81         [ 2] 5418 	ldw x,#2
      009C82 72 DE 00 1C      [ 5] 5419 	ldw x,([dstkptr],x) ; port 
      009C82 52 04            [ 1] 5420 	jrmi bad_port
      009C84 17 03 5F         [ 2] 5421 	cpw x,#9
      009C87 CF 00            [ 1] 5422 	jrpl bad_port
      009C89 18 35            [ 1] 5423 	ld a,#5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009C8B 01               [ 4] 5424 	mul x,a
      009C8C 00 17 00         [ 2] 5425 	addw x,#GPIO_BASE 
      009C8E 89               [ 2] 5426 	pushw x 
      009C8E 92 BC 00         [ 4] 5427 	call dpop 
      009C91 17 27 25         [ 2] 5428 	addw x,(1,sp)
      009C94 5F 16            [ 2] 5429 	ldw (1,sp),x  
      009C96 03 CD 9C         [ 4] 5430 	call ddrop  
      009C99 61               [ 2] 5431 	popw x 
      009C9A 25 2D            [ 1] 5432 	ld a,#TK_INTGR
      009C9C 92               [ 4] 5433 	ret
      001F0A                       5434 bad_port:
      009C9D AF 00            [ 1] 5435 	ld a,#ERR_BAD_VALUE
      009C9F 17 6B 01         [ 2] 5436 	jp tb_error
                                   5437 
                                   5438 
                                   5439 ;-------------------------
                                   5440 ; BASIC: UFLASH 
                                   5441 ; return user flash address
                                   5442 ; input:
                                   5443 ;  none 
                                   5444 ; output:
                                   5445 ;	A		TK_INTGR
                                   5446 ;   X 		user address 
                                   5447 ;---------------------------
      001F0F                       5448 uflash:
      009CA2 5C 92 AF         [ 2] 5449 	ldw x,#user_space 
      009CA5 00 17            [ 1] 5450 	ld a,#TK_INTGR 
      009CA7 6B               [ 4] 5451 	ret 
                                   5452 
                                   5453 
                                   5454 ;---------------------
                                   5455 ; BASIC: USR(addr[,arg])
                                   5456 ; execute a function written 
                                   5457 ; in binary code.
                                   5458 ; binary fonction should 
                                   5459 ; return token attribute in A 
                                   5460 ; and value in X. 
                                   5461 ; input:
                                   5462 ;   addr	routine address 
                                   5463 ;   arg 	is an optional argument 
                                   5464 ; output:
                                   5465 ;   A 		token attribute 
                                   5466 ;   X       returned value 
                                   5467 ;---------------------
      001F15                       5468 usr:
      009CA8 02 5C            [ 2] 5469 	pushw y 	
      009CAA 72 FB 01         [ 4] 5470 	call func_args 
      009CAD 5C CD            [ 1] 5471 	cp a,#1 
      009CAF 9C 16            [ 1] 5472 	jrpl 2$ 
      009CB1 AE 02 80         [ 2] 5473 	jp syntax_error 
      001F21                       5474 2$: 
      009CB4 C3 00 17         [ 4] 5475 	call dpop 
      009CB7 2A D5            [ 1] 5476 	cp a,#2 
      009CB9 2B 05            [ 1] 5477 	jrmi 4$
      009CB9 72 5F            [ 1] 5478 	ldw y,x ; y=arg 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009CBB 00 17 72         [ 4] 5479 	call dpop ;x=addr 
      009CBE 5F               [ 1] 5480 4$:	exgw y,x ; y=addr,x=arg 
      009CBF 00 18            [ 4] 5481 	call (y)
      009CC1 72 5F            [ 2] 5482 	popw y 
      009CC3 00               [ 4] 5483 	ret 
                                   5484 
                                   5485 ;------------------------------
                                   5486 ; BASIC: BYE 
                                   5487 ; halt mcu in its lowest power mode 
                                   5488 ; wait for reset or external interrupt
                                   5489 ; do a cold start on wakeup.
                                   5490 ;------------------------------
      001F33                       5491 bye:
      009CC4 19 5B 04 98 81   [ 2] 5492 	btjf UART1_SR,#UART_SR_TC,.
      009CC9 8E               [10] 5493 	halt
      009CC9 5B 04 99         [ 2] 5494 	jp cold_start  
                                   5495 
                                   5496 ;----------------------------------
                                   5497 ; BASIC: AUTORUN "file_name" 
                                   5498 ; record in eeprom at adrress AUTORUN_NAME
                                   5499 ; the name of file to load and execute
                                   5500 ; at startup 
                                   5501 ; input:
                                   5502 ;   file_name   file to execute 
                                   5503 ; output:
                                   5504 ;   none
                                   5505 ;-----------------------------------
      001F3C                       5506 autorun: 
      009CCC 81 01 00 25 07   [ 2] 5507 	btjf flags,#FRUN,0$ 
      009CCD 27 05            [ 1] 5508 	jreq 0$ 
      009CCD 72 01            [ 1] 5509 	ld a,#ERR_CMD_ONLY 
      009CCF 00 26 05         [ 2] 5510 	jp tb_error 
      001F48                       5511 0$:	
      009CD2 A6 07 CC         [ 4] 5512 	call next_token 
      009CD5 88 3A            [ 1] 5513 	cp a,#TK_QSTR
      009CD7 27 03            [ 1] 5514 	jreq 1$
      009CD7 CE 00 21         [ 2] 5515 	jp syntax_error 
      001F52                       5516 1$:	
      009CDA 72               [ 2] 5517 	pushw x ; file name char*
      009CDB B0 00            [ 1] 5518 	ldw y,x  
      009CDD 1F 26 01         [ 4] 5519 	call search_file 
      009CE0 81 05            [ 1] 5520 	jrc 2$ 
      009CE1 A6 09            [ 1] 5521 	ld a,#ERR_NOT_FILE
      009CE1 52 04 1F         [ 2] 5522 	jp tb_error  
      001F5F                       5523 2$: 
      009CE4 01 CD 88 EC A1   [ 1] 5524 	mov in,count 
      009CE9 0A 27 03 CC      [ 1] 5525 	clr farptr 
      009CED 88 38 00         [ 2] 5526 	ldw x,#AUTORUN_NAME
      009CEF CF 00 17         [ 2] 5527 	ldw farptr+1,x 
      009CEF 90 CE            [ 2] 5528 	ldw x,(1,sp)  
      009CF1 00 05 72         [ 4] 5529 	call strlen  ; return length in X 
      009CF4 B9 00            [ 2] 5530 	popw y 
      009CF6 01               [ 2] 5531 	pushw x 
      009CF7 17               [ 1] 5532 	clrw x 
      009CF8 03 55 00         [ 4] 5533 	call write_block 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      001F7A                       5534 	_drop 2 
      009CFB 04 00            [ 2]    1     addw sp,#2 
      009CFD 02               [ 4] 5535 	ret 
                                   5536 
                                   5537 ;----------------------------------
                                   5538 ; BASIC: SLEEP 
                                   5539 ; halt mcu until reset or external
                                   5540 ; interrupt.
                                   5541 ; Resume progam after SLEEP command
                                   5542 ;----------------------------------
      001F7D                       5543 sleep:
      009CFE 93 CD 83 20 1C   [ 2] 5544 	btjf UART1_SR,#UART_SR_TC,.
      009D03 00 03 72 FB      [ 1] 5545 	bset flags,#FSLEEP
      009D07 01               [10] 5546 	halt 
      009D08 72               [ 4] 5547 	ret 
                                   5548 
                                   5549 ;-------------------------------
                                   5550 ; BASIC: PAUSE expr 
                                   5551 ; suspend execution for n msec.
                                   5552 ; input:
                                   5553 ;	none
                                   5554 ; output:
                                   5555 ;	none 
                                   5556 ;------------------------------
      001F88                       5557 pause:
      009D09 5D 00 1A         [ 4] 5558 	call expression
      009D0C 26 0B            [ 1] 5559 	cp a,#TK_INTGR
      009D0E 72 B0            [ 1] 5560 	jreq pause02 
      009D10 00 1B 23         [ 2] 5561 	jp syntax_error
      001F92                       5562 pause02: 
      009D13 05               [ 2] 5563 1$: tnzw x 
      009D14 A6 01            [ 1] 5564 	jreq 2$
      009D16 CC               [10] 5565 	wfi 
      009D17 88               [ 2] 5566 	decw x 
      009D18 3A F9            [ 1] 5567 	jrne 1$
      009D19 4F               [ 1] 5568 2$:	clr a 
      009D19 16               [ 4] 5569 	ret 
                                   5570 
                                   5571 ;------------------------------
                                   5572 ; BASIC: AWU expr
                                   5573 ; halt mcu for 'expr' milliseconds
                                   5574 ; use Auto wakeup peripheral
                                   5575 ; all oscillators stopped except LSI
                                   5576 ; range: 1ms - 511ms
                                   5577 ; input:
                                   5578 ;  none
                                   5579 ; output:
                                   5580 ;  none:
                                   5581 ;------------------------------
      001F9B                       5582 awu:
      009D1A 03 CD 9C         [ 4] 5583   call expression
      009D1D 82 24            [ 1] 5584   cp a,#TK_INTGR
      009D1F 05 A6            [ 1] 5585   jreq awu02
      009D21 08 CC 88         [ 2] 5586   jp syntax_error
      001FA5                       5587 awu02:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009D24 3A 14 00         [ 2] 5588   cpw x,#5120
      009D25 2B 0C            [ 1] 5589   jrmi 1$ 
      009D25 CE 00 1A C6      [ 1] 5590   mov AWU_TBR,#15 
      009D29 00 1C            [ 1] 5591   ld a,#30
      009D2B CF               [ 2] 5592   div x,a
      009D2C 00 17            [ 1] 5593   ld a,#16
      009D2E C7               [ 2] 5594   div x,a 
      009D2F 00 19            [ 2] 5595   jra 4$
      001FB6                       5596 1$: 
      009D31 1E 03 CD         [ 2] 5597   cpw x,#2048
      009D34 83 20            [ 1] 5598   jrmi 2$ 
      009D36 5C 1F 01 5F      [ 1] 5599   mov AWU_TBR,#14
      009D3A 16 03            [ 1] 5600   ld a,#80
      009D3C CD               [ 2] 5601   div x,a 
      009D3D 81 ED            [ 2] 5602   jra 4$   
      001FC4                       5603 2$:
      009D3F CE 00 21 72      [ 1] 5604   mov AWU_TBR,#7
      001FC8                       5605 3$:  
                                   5606 ; while X > 64  divide by 2 and increment AWU_TBR 
      009D43 B0 00 1F         [ 2] 5607   cpw x,#64 
      009D46 1F 01            [ 2] 5608   jrule 4$ 
      009D48 5F 7B 01 CD      [ 1] 5609   inc AWU_TBR 
      009D4C 81               [ 2] 5610   srlw x 
      009D4D 78 5C            [ 2] 5611   jra 3$ 
      001FD4                       5612 4$:
      009D4F 7B               [ 1] 5613   ld a, xl
      009D50 02               [ 1] 5614   dec a 
      009D51 CD 81            [ 1] 5615   jreq 5$
      009D53 78               [ 1] 5616   dec a 	
      001FD9                       5617 5$: 
      009D54 5C CD            [ 1] 5618   and a,#0x3e 
      009D56 9C 16 1E         [ 1] 5619   ld AWU_APR,a 
      009D59 01 89 5F 90      [ 1] 5620   bset AWU_CSR,#AWU_CSR_AWUEN
      009D5D CE               [10] 5621   halt 
                                   5622 
      009D5E 00               [ 4] 5623   ret 
                                   5624 
                                   5625 ;------------------------------
                                   5626 ; BASIC: TICKS
                                   5627 ; return msec ticks counter value 
                                   5628 ; input:
                                   5629 ; 	none 
                                   5630 ; output:
                                   5631 ;	X 		TK_INTGR
                                   5632 ;-------------------------------
      001FE4                       5633 get_ticks:
      009D5F 1F CD 81         [ 2] 5634 	ldw x,ticks 
      009D62 ED 5B            [ 1] 5635 	ld a,#TK_INTGR
      009D64 02               [ 4] 5636 	ret 
                                   5637 
                                   5638 
                                   5639 
                                   5640 ;------------------------------
                                   5641 ; BASIC: ABS(expr)
                                   5642 ; return absolute value of expr.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   5643 ; input:
                                   5644 ;   none
                                   5645 ; output:
                                   5646 ;   X     	positive integer
                                   5647 ;-------------------------------
      001FEA                       5648 abs:
      009D65 AE 00 01         [ 4] 5649 	call func_args 
      009D68 A6 FF            [ 1] 5650 	cp a,#1 
      009D6A CD 81            [ 1] 5651 	jreq 0$ 
      009D6C 78 CD 9C         [ 2] 5652 	jp syntax_error
      001FF4                       5653 0$:  
      009D6F 16 CE 00         [ 4] 5654     call dpop   
      009D72 17               [ 1] 5655 	ld a,xh 
      009D73 C6 00            [ 1] 5656 	bcp a,#0x80 
      009D75 19 CF            [ 1] 5657 	jreq 2$ 
      009D77 00               [ 2] 5658 	negw x 
      009D78 1A C7            [ 1] 5659 2$: ld a,#TK_INTGR 
      009D7A 00               [ 4] 5660 	ret 
                                   5661 
                                   5662 ;------------------------------
                                   5663 ; BASIC: AND(expr1,expr2)
                                   5664 ; Apply bit AND relation between
                                   5665 ; the 2 arguments, i.e expr1 & expr2 
                                   5666 ; output:
                                   5667 ; 	A 		TK_INTGR
                                   5668 ;   X 		result 
                                   5669 ;------------------------------
      002000                       5670 bit_and:
      009D7B 1C 5F 4B         [ 4] 5671 	call func_args 
      009D7E 04 02            [ 1] 5672 	cp a,#2
      009D7F 27 03            [ 1] 5673 	jreq 1$
      009D7F 4F CD 81         [ 2] 5674 	jp syntax_error 
      009D82 78 5C 0A         [ 4] 5675 1$:	call dpop 
      009D85 01               [ 2] 5676 	pushw x 
      009D86 26 F7 84         [ 4] 5677 	call dpop 
      009D89 1E               [ 1] 5678 	ld a,xh 
      009D8A 01 CD            [ 1] 5679 	and a,(1,sp)
      009D8C 8A               [ 1] 5680 	ld xh,a 
      009D8D 96               [ 1] 5681 	ld a,xl
      009D8E 5B 04            [ 1] 5682 	and a,(2,sp)
      009D90 81               [ 1] 5683 	ld xl,a 
      009D91                       5684 	_drop 2 
      009D91 CD 9C            [ 2]    1     addw sp,#2 
      009D93 16 CD            [ 1] 5685 	ld a,#TK_INTGR
      009D95 87               [ 4] 5686 	ret
                                   5687 
                                   5688 ;------------------------------
                                   5689 ; BASIC: OR(expr1,expr2)
                                   5690 ; Apply bit OR relation between
                                   5691 ; the 2 arguments, i.e expr1 | expr2 
                                   5692 ; output:
                                   5693 ; 	A 		TK_INTGR
                                   5694 ;   X 		result 
                                   5695 ;------------------------------
      00201E                       5696 bit_or:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009D96 02 5F 92         [ 4] 5697 	call func_args 
      009D99 AF 00            [ 1] 5698 	cp a,#2
      009D9B 17 90            [ 1] 5699 	jreq 1$
      009D9D 95 5C 92         [ 2] 5700 	jp syntax_error 
      002028                       5701 1$: 
      009DA0 AF 00 17         [ 4] 5702 	call dpop 
      009DA3 5C               [ 2] 5703 	pushw x 
      009DA4 90 97 72         [ 4] 5704 	call dpop 
      009DA7 B9               [ 1] 5705 	ld a,xh 
      009DA8 00 1F            [ 1] 5706 	or a,(1,sp)
      009DAA 90               [ 1] 5707 	ld xh,a 
      009DAB CF               [ 1] 5708 	ld a,xl 
      009DAC 00 21            [ 1] 5709 	or a,(2,sp)
      009DAE 90               [ 1] 5710 	ld xl,a 
      002037                       5711 	_drop 2 
      009DAF CE 00            [ 2]    1     addw sp,#2 
      009DB1 1F 04            [ 1] 5712 	ld a,#TK_INTGR 
      009DB2 81               [ 4] 5713 	ret
                                   5714 
                                   5715 ;------------------------------
                                   5716 ; BASIC: XOR(expr1,expr2)
                                   5717 ; Apply bit XOR relation between
                                   5718 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5719 ; output:
                                   5720 ; 	A 		TK_INTGR
                                   5721 ;   X 		result 
                                   5722 ;------------------------------
      00203C                       5723 bit_xor:
      009DB2 92 AF 00         [ 4] 5724 	call func_args 
      009DB5 17 90            [ 1] 5725 	cp a,#2
      009DB7 F7 5C            [ 1] 5726 	jreq 1$
      009DB9 90 5C 90         [ 2] 5727 	jp syntax_error 
      002046                       5728 1$: 
      009DBC C3 00 21         [ 4] 5729 	call dpop 
      009DBF 2B               [ 2] 5730 	pushw x 
      009DC0 F1 81 1E         [ 4] 5731 	call dpop 
      009DC2 9E               [ 1] 5732 	ld a,xh 
      009DC2 72 01            [ 1] 5733 	xor a,(1,sp)
      009DC4 00               [ 1] 5734 	ld xh,a 
      009DC5 26               [ 1] 5735 	ld a,xl 
      009DC6 07 27            [ 1] 5736 	xor a,(2,sp)
      009DC8 05               [ 1] 5737 	ld xl,a 
      002055                       5738 	_drop 2 
      009DC9 A6 07            [ 2]    1     addw sp,#2 
      009DCB CC 88            [ 1] 5739 	ld a,#TK_INTGR 
      009DCD 3A               [ 4] 5740 	ret 
                                   5741 
                                   5742 ;------------------------------
                                   5743 ; BASIC: LSHIFT(expr1,expr2)
                                   5744 ; logical shift left expr1 by 
                                   5745 ; expr2 bits 
                                   5746 ; output:
                                   5747 ; 	A 		TK_INTGR
                                   5748 ;   X 		result 
                                   5749 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009DCE                       5750 lshift:
      009DCE CD 88 EC         [ 4] 5751 	call func_args
      009DD1 A1 0A            [ 1] 5752 	cp a,#2 
      009DD3 27 03            [ 1] 5753 	jreq 1$
      009DD5 CC 88 38         [ 2] 5754 	jp syntax_error
      009DD8 CD 10 1E         [ 4] 5755 1$: call dpop  
      009DD8 90               [ 1] 5756 	exgw x,y 
      009DD9 CE 00 05         [ 4] 5757 	call dpop
      009DDC 72 B9            [ 2] 5758 	tnzw y 
      009DDE 00 01            [ 1] 5759 	jreq 4$
      009DE0 55               [ 2] 5760 2$:	sllw x 
      009DE1 00 04            [ 2] 5761 	decw y 
      009DE3 00 02            [ 1] 5762 	jrne 2$
      002074                       5763 4$:  
      009DE5 CD 9C            [ 1] 5764 	ld a,#TK_INTGR
      009DE7 82               [ 4] 5765 	ret
                                   5766 
                                   5767 ;------------------------------
                                   5768 ; BASIC: RSHIFT(expr1,expr2)
                                   5769 ; logical shift right expr1 by 
                                   5770 ; expr2 bits.
                                   5771 ; output:
                                   5772 ; 	A 		TK_INTGR
                                   5773 ;   X 		result 
                                   5774 ;------------------------------
      002077                       5775 rshift:
      009DE8 25 05 A6         [ 4] 5776 	call func_args
      009DEB 09 CC            [ 1] 5777 	cp a,#2 
      009DED 88 3A            [ 1] 5778 	jreq 1$
      009DEF CC 07 B8         [ 2] 5779 	jp syntax_error
      009DEF CD 9D 91         [ 4] 5780 1$: call dpop  
      009DF2 CE               [ 1] 5781 	exgw x,y 
      009DF3 00 21 72         [ 4] 5782 	call dpop
      009DF6 B0 00            [ 2] 5783 	tnzw y 
      009DF8 1F CD            [ 1] 5784 	jreq 4$
      009DFA 8A               [ 2] 5785 2$:	srlw x 
      009DFB 96 81            [ 2] 5786 	decw y 
      009DFD 26 FB            [ 1] 5787 	jrne 2$
      002091                       5788 4$:  
      009DFD CD 88            [ 1] 5789 	ld a,#TK_INTGR
      009DFF EC               [ 4] 5790 	ret
                                   5791 
                                   5792 ;--------------------------
                                   5793 ; BASIC: FCPU integer
                                   5794 ; set CPU frequency 
                                   5795 ;-------------------------- 
                                   5796 
      002094                       5797 fcpu:
      009E00 A1 00            [ 1] 5798 	ld a,#TK_INTGR
      009E02 27 26 A1         [ 4] 5799 	call expect 
      009E05 0A               [ 1] 5800 	ld a,xl 
      009E06 27 03            [ 1] 5801 	and a,#7 
      009E08 CC 88 38         [ 1] 5802 	ld CLK_CKDIVR,a 
      009E0B 90               [ 4] 5803 	ret 
                                   5804 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   5805 ;------------------------------
                                   5806 ; BASIC: PMODE pin#, mode 
                                   5807 ; Arduino pin. 
                                   5808 ; define pin as input or output
                                   5809 ; pin#: {0..15}
                                   5810 ; mode: INPUT|OUTPUT  
                                   5811 ;------------------------------
                           000001  5812 	PINNO=1
                           000001  5813 	VSIZE=1
      0020A0                       5814 pin_mode:
      0020A0                       5815 	_vars VSIZE 
      009E0C CE 00            [ 2]    1     sub sp,#VSIZE 
      009E0E 05 72 B9         [ 4] 5816 	call arg_list 
      009E11 00 01            [ 1] 5817 	cp a,#2 
      009E13 55 00            [ 1] 5818 	jreq 1$
      009E15 04 00 02         [ 2] 5819 	jp syntax_error 
      009E18 CD 9C 82         [ 4] 5820 1$: call dpop ; mode 
      009E1B 25               [ 1] 5821 	exgw x,y 
      009E1C 05 A6 09         [ 4] 5822 	call dpop ; Dx pin 
      009E1F CC 88 3A         [ 4] 5823 	call select_pin 
      009E22 6B 01            [ 1] 5824 	ld (PINNO,sp),a  
      009E22 CE 00            [ 1] 5825 	ld a,#1 
      009E24 17 C6            [ 1] 5826 	tnz (PINNO,sp)
      009E26 00 19            [ 1] 5827 	jreq 4$
      009E28 20               [ 1] 5828 2$:	sll a 
      009E29 0A 01            [ 1] 5829 	dec (PINNO,sp)
      009E2A 26 FB            [ 1] 5830 	jrne 2$ 
      009E2A AE 01            [ 1] 5831 	ld (PINNO,sp),a
      009E2C 00 4F            [ 1] 5832 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009E2E CF 00            [ 1] 5833 	ld (GPIO_CR1,x),a 
      009E30 17 C7 00 19      [ 2] 5834 4$:	cpw y,#OUTP 
      009E34 27 07            [ 1] 5835 	jreq 6$
                                   5836 ; input mode
      009E34 CF 00            [ 1] 5837 	ld a,(PINNO,sp)
      009E36 1A               [ 1] 5838 	cpl a 
      009E37 C7 00            [ 1] 5839 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009E39 1C 4B            [ 2] 5840 	jra 9$
      0020D6                       5841 6$: ;output mode  
      009E3B 04 5F            [ 1] 5842 	ld a,(PINNO,sp)
      009E3D EA 04            [ 1] 5843 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009E3D 4F CD            [ 1] 5844 	ld (GPIO_CR2,x),a 
      009E3F 81 78            [ 1] 5845 	ld a,(PINNO,sp)
      009E41 5C 0A            [ 1] 5846 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009E43 01 26            [ 1] 5847 9$:	ld (GPIO_DDR,x),a 
      0020E2                       5848 	_drop VSIZE 
      009E45 F7 84            [ 2]    1     addw sp,#VSIZE 
      009E47 81               [ 4] 5849 	ret
                                   5850 
                                   5851 ;------------------------
                                   5852 ; select Arduino pin 
                                   5853 ; input:
                                   5854 ;   X 	 {0..15} Arduino Dx 
                                   5855 ; output:
                                   5856 ;   A     stm8s208 pin 
                                   5857 ;   X     base address s208 GPIO port 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   5858 ;---------------------------
      009E48                       5859 select_pin:
      009E48 52               [ 2] 5860 	sllw x 
      009E49 02 5F 1F         [ 2] 5861 	addw x,#arduino_to_8s208 
      009E4C 01               [ 2] 5862 	ldw x,(x)
      009E4D CF               [ 1] 5863 	ld a,xl 
      009E4E 00               [ 1] 5864 	push a 
      009E4F 18               [ 1] 5865 	swapw x 
      009E50 35 01            [ 1] 5866 	ld a,#5 
      009E52 00               [ 4] 5867 	mul x,a 
      009E53 17 50 00         [ 2] 5868 	addw x,#GPIO_BASE 
      009E54 84               [ 1] 5869 	pop a 
      009E54 5F               [ 4] 5870 	ret 
                                   5871 ; translation from Arduino D0..D15 to stm8s208rb 
      0020F5                       5872 arduino_to_8s208:
      009E55 92 AF                 5873 .byte 3,6 ; D0 
      009E57 00 17                 5874 .byte 3,5 ; D1 
      009E59 27 39                 5875 .byte 4,0 ; D2 
      009E5B 02 01                 5876 .byte 2,1 ; D3
      009E5B 92 AF                 5877 .byte 6,0 ; D4
      009E5D 00 17                 5878 .byte 2,2 ; D5
      009E5F 27 06                 5879 .byte 2,3 ; D6
      009E61 CD 82                 5880 .byte 3,1 ; D7
      009E63 4B 5C                 5881 .byte 3,3 ; D8
      009E65 20 F4                 5882 .byte 2,4 ; D9
      009E67 5C A6                 5883 .byte 4,5 ; D10
      009E69 20 CD                 5884 .byte 2,6 ; D11
      009E6B 82 4B                 5885 .byte 2,7 ; D12
      009E6D 92 AF                 5886 .byte 2,5 ; D13
      009E6F 00 17                 5887 .byte 4,2 ; D14
      009E71 90 95                 5888 .byte 4,1 ; D15
                                   5889 
                                   5890 
                                   5891 ;------------------------------
                                   5892 ; BASIC: RND(expr)
                                   5893 ; return random number 
                                   5894 ; between 1 and expr inclusive
                                   5895 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5896 ; input:
                                   5897 ; 	none 
                                   5898 ; output:
                                   5899 ;	X 		random positive integer 
                                   5900 ;------------------------------
      002115                       5901 random:
      009E73 5C 92 AF         [ 4] 5902 	call func_args 
      009E76 00 17            [ 1] 5903 	cp a,#1
      009E78 5C 90            [ 1] 5904 	jreq 1$
      009E7A 97 90 89         [ 2] 5905 	jp syntax_error
      00211F                       5906 1$: 
      009E7D 72 FB 01         [ 4] 5907 	call dpop 
      009E80 5C               [ 2] 5908 	pushw x 
      009E81 CD               [ 1] 5909 	ld a,xh 
      009E82 9C 16            [ 1] 5910 	bcp a,#0x80 
      009E84 85 CD            [ 1] 5911 	jreq 2$
      009E86 8A 96            [ 1] 5912 	ld a,#ERR_BAD_VALUE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009E88 A6 0D CD         [ 2] 5913 	jp tb_error
      00212D                       5914 2$: 
                                   5915 ; acc16=(x<<5)^x 
      009E8B 82 4B 1E         [ 2] 5916 	ldw x,seedx 
      009E8E 01               [ 2] 5917 	sllw x 
      009E8F 5C               [ 2] 5918 	sllw x 
      009E90 1F               [ 2] 5919 	sllw x 
      009E91 01               [ 2] 5920 	sllw x 
      009E92 20               [ 2] 5921 	sllw x 
      009E93 C0               [ 1] 5922 	ld a,xh 
      009E94 C8 00 12         [ 1] 5923 	xor a,seedx 
      009E94 1E 01 CD         [ 1] 5924 	ld acc16,a 
      009E97 8A               [ 1] 5925 	ld a,xl 
      009E98 96 AE 9E         [ 1] 5926 	xor a,seedx+1 
      009E9B C9 CD 82         [ 1] 5927 	ld acc8,a 
                                   5928 ; seedx=seedy 
      009E9E 5E A6 FF         [ 2] 5929 	ldw x,seedy 
      009EA1 C0 00 1C         [ 2] 5930 	ldw seedx,x  
                                   5931 ; seedy=seedy^(seedy>>1)
      009EA4 C7 00            [ 2] 5932 	srlw y 
      009EA6 0E A6            [ 1] 5933 	ld a,yh 
      009EA8 7F C2 00         [ 1] 5934 	xor a,seedy 
      009EAB 1B C7 00         [ 1] 5935 	ld seedy,a  
      009EAE 0D A6            [ 1] 5936 	ld a,yl 
      009EB0 02 C2 00         [ 1] 5937 	xor a,seedy+1 
      009EB3 1A C7 00         [ 1] 5938 	ld seedy+1,a 
                                   5939 ; acc16>>3 
      009EB6 0C 5F A6         [ 2] 5940 	ldw x,acc16 
      009EB9 06               [ 2] 5941 	srlw x 
      009EBA 97               [ 2] 5942 	srlw x 
      009EBB A6               [ 2] 5943 	srlw x 
                                   5944 ; x=acc16^x 
      009EBC 0A               [ 1] 5945 	ld a,xh 
      009EBD CD 8A 4E         [ 1] 5946 	xor a,acc16 
      009EC0 AE               [ 1] 5947 	ld xh,a 
      009EC1 9E               [ 1] 5948 	ld a,xl 
      009EC2 D1 CD 82         [ 1] 5949 	xor a,acc8 
      009EC5 5E               [ 1] 5950 	ld xl,a 
                                   5951 ; seedy=x^seedy 
      009EC6 5B 02 81         [ 1] 5952 	xor a,seedy+1
      009EC9 20               [ 1] 5953 	ld xl,a 
      009ECA 66               [ 1] 5954 	ld a,xh 
      009ECB 69 6C 65         [ 1] 5955 	xor a,seedy
      009ECE 73               [ 1] 5956 	ld xh,a 
      009ECF 0A 00 20         [ 2] 5957 	ldw seedy,x 
                                   5958 ; return seedy modulo expr + 1 
      009ED2 62 79            [ 2] 5959 	popw y 
      009ED4 74               [ 2] 5960 	divw x,y 
      009ED5 65               [ 1] 5961 	ldw x,y 
      009ED6 73               [ 2] 5962 	incw x 
      009ED7 20 66            [ 1] 5963 	ld a,#TK_INTGR
      009ED9 72               [ 4] 5964 	ret 
                                   5965 
                                   5966 ;---------------------------------
                                   5967 ; BASIC: WORDS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                   5968 ; affiche la listes des mots du
                                   5969 ; dictionnaire.
                                   5970 ;---------------------------------
                           000001  5971 	WLEN=1
                           000002  5972 	LLEN=2  
                           000002  5973 	VSIZE=2 
      00217F                       5974 words:
      00217F                       5975 	_vars VSIZE
      009EDA 65 65            [ 2]    1     sub sp,#VSIZE 
      009EDC 0A 00            [ 1] 5976 	clr (LLEN,sp)
      009EDE 90 AE 27 3F      [ 2] 5977 	ldw y,#kword_dict+2
      009EDE 52               [ 1] 5978 0$:	ldw x,y
      009EDF 02               [ 1] 5979 	ld a,(x)
      009EE0 72 5F            [ 1] 5980 	and a,#15 
      009EE2 00 17            [ 1] 5981 	ld (WLEN,sp),a 
      009EE4 CD               [ 2] 5982 1$:	incw x 
      009EE5 93               [ 1] 5983 	ld a,(x)
      009EE6 95 A1 04         [ 4] 5984 	call putc 
      009EE9 27 03            [ 1] 5985 	inc (LLEN,sp)
      009EEB CC 88            [ 1] 5986 	dec (WLEN,sp)
      009EED 38 1F            [ 1] 5987 	jrne 1$
      009EEF 01 CD            [ 1] 5988 	ld a,#70
      009EF1 88 EC            [ 1] 5989 	cp a,(LLEN,sp)
      009EF3 A1 0D            [ 1] 5990 	jrmi 2$   
      009EF5 27 02            [ 1] 5991 	ld a,#SPACE 
      009EF7 20 19 CD         [ 4] 5992 	call putc 
      009EFA 93 95            [ 1] 5993 	inc (LLEN,sp) 
      009EFC A1 04            [ 2] 5994 	jra 3$
      009EFE 27 03            [ 1] 5995 2$: ld a,#CR 
      009F00 CC 88 38         [ 4] 5996 	call putc 
      009F03 9F 1E            [ 1] 5997 	clr (LLEN,sp)
      009F05 01 CF 00 18      [ 2] 5998 3$:	subw y,#2 
      009F09 5F CD            [ 2] 5999 	ldw y,(y)
      009F0B 81 78            [ 1] 6000 	jrne 0$  
      0021B6                       6001 	_drop VSIZE 
      009F0D 1E 01            [ 2]    1     addw sp,#VSIZE 
      009F0F 5C               [ 4] 6002 	ret 
                                   6003 
                                   6004 
                                   6005 ;-----------------------------
                                   6006 ; BASIC: TIMER expr 
                                   6007 ; initialize count down timer 
                                   6008 ;-----------------------------
      0021B9                       6009 set_timer:
      009F10 20 DC 15         [ 4] 6010 	call arg_list
      009F12 A1 01            [ 1] 6011 	cp a,#1 
      009F12 5B 02            [ 1] 6012 	jreq 1$
      009F14 81 07 B8         [ 2] 6013 	jp syntax_error
      009F15                       6014 1$: 
      009F15 CD 92 B9         [ 4] 6015 	call dpop 
      009F18 A1 01 27         [ 2] 6016 	ldw timer,x 
      009F1B 03               [ 4] 6017 	ret 
                                   6018 
                                   6019 ;------------------------------
                                   6020 ; BASIC: TIMEOUT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                   6021 ; return state of timer 
                                   6022 ;------------------------------
      0021CA                       6023 timeout:
      009F1C CC 88 38         [ 2] 6024 	ldw x,timer 
      0021CD                       6025 logical_complement:
      009F1F CD               [ 2] 6026 	cplw x 
      009F20 90 9E 9F         [ 2] 6027 	cpw x,#-1
      009F23 A4 7F            [ 1] 6028 	jreq 2$
      009F25 97               [ 1] 6029 	clrw x 
      009F26 A6 03            [ 1] 6030 2$:	ld a,#TK_INTGR
      009F28 81               [ 4] 6031 	ret 
                                   6032 
                                   6033 ;--------------------------------
                                   6034 ; BASIC NOT(expr) 
                                   6035 ; return logical complement of expr
                                   6036 ;--------------------------------
      009F29                       6037 func_not:
      009F29 A6 0B CD         [ 4] 6038 	call func_args  
      009F2C 92 88            [ 1] 6039 	cp a,#1
      009F2E CD 88            [ 1] 6040 	jreq 1$
      009F30 EC A1 0A         [ 2] 6041 	jp syntax_error
      009F33 27 07 A1         [ 4] 6042 1$:	call dpop 
      009F36 03 27            [ 2] 6043 	jra logical_complement
                                   6044 
                                   6045 
                                   6046 
                                   6047 ;-----------------------------------
                                   6048 ; BASIC: IWDGEN expr1 
                                   6049 ; enable independant watchdog timer
                                   6050 ; expr1 is delay in multiple of 62.5µsec
                                   6051 ; expr1 -> {1..16383}
                                   6052 ;-----------------------------------
      0021E6                       6053 enable_iwdg:
      009F38 06 CC 88         [ 4] 6054 	call arg_list
      009F3B 38 01            [ 1] 6055 	cp a,#1 
      009F3C 27 03            [ 1] 6056 	jreq 1$
      009F3C F6 5F 97         [ 2] 6057 	jp syntax_error 
      009F3F 4B 00            [ 1] 6058 1$: push #0
      009F3F 89 A6 0C CD      [ 1] 6059 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009F43 92 88 85         [ 4] 6060 	call dpop
      009F46 A6               [ 1] 6061 	ld a,xh 
      009F47 04 81            [ 1] 6062 	and a,#0x3f
      009F49 95               [ 1] 6063 	ld xh,a  
      009F49 CD 82 54         [ 2] 6064 2$:	cpw x,#255
      009F4C 5F 97            [ 2] 6065 	jrule 3$
      009F4E A6 04            [ 1] 6066 	inc (1,sp)
      009F50 81               [ 1] 6067 	rcf 
      009F51 56               [ 2] 6068 	rrcw x 
      009F51 5F 72            [ 2] 6069 	jra 2$
      009F53 5D 00 28 27      [ 1] 6070 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009F57 01               [ 1] 6071 	pop a  
      009F58 53 A6 04         [ 1] 6072 	ld IWDG_PR,a 
      009F5B 81               [ 1] 6073 	ld a,xl
      009F5C 4A               [ 1] 6074 	dec a 
      009F5C CD 92 B9 A1      [ 1] 6075 	mov IWDG_KR,#IWDG_KEY_ACCESS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009F60 02 27 03         [ 1] 6076 	ld IWDG_RLR,a 
      009F63 CC 88 38 E0      [ 1] 6077 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009F66 81               [ 4] 6078 	ret 
                                   6079 
                                   6080 
                                   6081 ;-----------------------------------
                                   6082 ; BASIC: IWDGREF  
                                   6083 ; refresh independant watchdog count down 
                                   6084 ; timer before it reset MCU. 
                                   6085 ;-----------------------------------
      00221E                       6086 refresh_iwdg:
      009F66 AE 00 02 72      [ 1] 6087 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009F6A DE               [ 4] 6088 	ret 
                                   6089 
                                   6090 
                                   6091 ;-------------------------------------
                                   6092 ; BASIC: LOG(expr)
                                   6093 ; return logarithm base 2 of expr 
                                   6094 ; this is the position of most significant
                                   6095 ; bit set. 
                                   6096 ; input: 
                                   6097 ; output:
                                   6098 ;   X     log2 
                                   6099 ;   A     TK_INTGR 
                                   6100 ;*********************************
      002223                       6101 log2:
      009F6B 00 1D 2B         [ 4] 6102 	call func_args 
      009F6E 1B A3            [ 1] 6103 	cp a,#1 
      009F70 00 09            [ 1] 6104 	jreq 1$
      009F72 2A 16 A6         [ 2] 6105 	jp syntax_error 
      009F75 05 42 1C         [ 4] 6106 1$: call dpop
      002230                       6107 leading_one:
      009F78 50               [ 2] 6108 	tnzw x 
      009F79 00 89            [ 1] 6109 	jreq 4$
      009F7B CD 90            [ 1] 6110 	ld a,#15 
      009F7D 9E               [ 2] 6111 2$: rlcw x 
      009F7E 72 FB            [ 1] 6112     jrc 3$
      009F80 01               [ 1] 6113 	dec a 
      009F81 1F 01            [ 2] 6114 	jra 2$
      009F83 CD               [ 1] 6115 3$: clrw x 
      009F84 90               [ 1] 6116     ld xl,a
      009F85 C5 85            [ 1] 6117 4$:	ld a,#TK_INTGR
      009F87 A6               [ 4] 6118 	ret 
                                   6119 
                                   6120 ;-----------------------------------
                                   6121 ; BASIC: BIT(expr) 
                                   6122 ; expr ->{0..15}
                                   6123 ; return 2^expr 
                                   6124 ; output:
                                   6125 ;    x    2^expr 
                                   6126 ;-----------------------------------
      002240                       6127 bitmask:
      009F88 04 81 39         [ 4] 6128     call func_args 
      009F8A A1 01            [ 1] 6129 	cp a,#1
      009F8A A6 0A            [ 1] 6130 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009F8C CC 88 3A         [ 2] 6131 	jp syntax_error 
      009F8F CD 10 1E         [ 4] 6132 1$: call dpop 
      009F8F AE               [ 1] 6133 	ld a,xl 
      009F90 A8 00            [ 1] 6134 	and a,#15
      009F92 A6               [ 1] 6135 	clrw x 
      009F93 04               [ 2] 6136 	incw x 
      009F94 81               [ 1] 6137 2$: tnz a 
      009F95 27 04            [ 1] 6138 	jreq 3$
      009F95 90               [ 2] 6139 	slaw x 
      009F96 89               [ 1] 6140 	dec a 
      009F97 CD 92            [ 2] 6141 	jra 2$ 
      009F99 B9 A1            [ 1] 6142 3$: ld a,#TK_INTGR
      009F9B 01               [ 4] 6143 	ret 
                                   6144 
                                   6145 ;------------------------------
                                   6146 ; BASIC: INVERT(expr)
                                   6147 ; 1's complement 
                                   6148 ;--------------------------------
      00225C                       6149 invert:
      009F9C 2A 03 CC         [ 4] 6150 	call func_args
      009F9F 88 38            [ 1] 6151 	cp a,#1 
      009FA1 27 03            [ 1] 6152 	jreq 1$
      009FA1 CD 90 9E         [ 2] 6153 	jp syntax_error
      009FA4 A1 02 2B         [ 4] 6154 1$: call dpop 
      009FA7 05               [ 2] 6155 	cplw x 
      009FA8 90 93            [ 1] 6156 	ld a,#TK_INTGR 
      009FAA CD               [ 4] 6157 	ret 
                                   6158 
                                   6159 ;------------------------------
                                   6160 ; BASIC: DO 
                                   6161 ; initiate a DO ... UNTIL loop 
                                   6162 ;------------------------------
      00226D                       6163 do_loop:
      009FAB 90               [ 2] 6164 	popw x 
      00226E                       6165 	_vars 4 
      009FAC 9E 51            [ 2]    1     sub sp,#4 
      009FAE 90               [ 2] 6166 	pushw x 
      009FAF FD 90 85         [ 2] 6167 	jp store_loop_addr
                                   6168 
                                   6169 ;--------------------------------
                                   6170 ; BASIC: UNTIL expr 
                                   6171 ; loop if exprssion is false 
                                   6172 ; else terminate loop
                                   6173 ;--------------------------------
      002274                       6174 until: 
      009FB2 81 5D 00 22      [ 1] 6175 	tnz loop_depth 
      009FB3 26 03            [ 1] 6176 	jrne 1$ 
      009FB3 72 0D 52         [ 2] 6177 	jp syntax_error 
      00227D                       6178 1$: 
      009FB6 30 FB 8E         [ 4] 6179 	call relation 
      009FB9 CC 85            [ 1] 6180 	cp a,#TK_INTGR
      009FBB FA 03            [ 1] 6181 	jreq 2$
      009FBC CC 07 B8         [ 2] 6182 	jp syntax_error
      002287                       6183 2$: 
      009FBC 72               [ 2] 6184 	tnzw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009FBD 01 00            [ 1] 6185 	jrne 9$
      009FBF 26 07 27         [ 2] 6186 	jp loop_back 
      00228D                       6187 9$:	; remove loop info cstack  
      009FC2 05               [ 2] 6188 	popw x
      00228E                       6189 	_drop 4
      009FC3 A6 07            [ 2]    1     addw sp,#4 
      009FC5 CC               [ 2] 6190 	pushw x 
      009FC6 88 3A 00 22      [ 1] 6191 	dec loop_depth 
      009FC8 81               [ 4] 6192 	ret 
                                   6193 
                                   6194 ;--------------------------
                                   6195 ; BASIC: PRTA...PRTI  
                                   6196 ;  return constant value 
                                   6197 ;  PORT  offset in GPIO
                                   6198 ;  array
                                   6199 ;---------------------------
      002296                       6200 const_porta:
      009FC8 CD 88 EC         [ 2] 6201 	ldw x,#0
      009FCB A1 0A            [ 1] 6202 	ld a,#TK_INTGR 
      009FCD 27               [ 4] 6203 	ret 
      00229C                       6204 const_portb:
      009FCE 03 CC 88         [ 2] 6205 	ldw x,#1
      009FD1 38 04            [ 1] 6206 	ld a,#TK_INTGR 
      009FD2 81               [ 4] 6207 	ret 
      0022A2                       6208 const_portc:
      009FD2 89 90 93         [ 2] 6209 	ldw x,#2
      009FD5 CD 9C            [ 1] 6210 	ld a,#TK_INTGR 
      009FD7 82               [ 4] 6211 	ret 
      0022A8                       6212 const_portd:
      009FD8 25 05 A6         [ 2] 6213 	ldw x,#3
      009FDB 09 CC            [ 1] 6214 	ld a,#TK_INTGR 
      009FDD 88               [ 4] 6215 	ret 
      0022AE                       6216 const_porte:
      009FDE 3A 00 04         [ 2] 6217 	ldw x,#4
      009FDF A6 04            [ 1] 6218 	ld a,#TK_INTGR 
      009FDF 55               [ 4] 6219 	ret 
      0022B4                       6220 const_portf:
      009FE0 00 04 00         [ 2] 6221 	ldw x,#5
      009FE3 02 72            [ 1] 6222 	ld a,#TK_INTGR 
      009FE5 5F               [ 4] 6223 	ret 
      0022BA                       6224 const_portg:
      009FE6 00 17 AE         [ 2] 6225 	ldw x,#6
      009FE9 40 00            [ 1] 6226 	ld a,#TK_INTGR 
      009FEB CF               [ 4] 6227 	ret 
      0022C0                       6228 const_porth:
      009FEC 00 18 1E         [ 2] 6229 	ldw x,#7
      009FEF 01 CD            [ 1] 6230 	ld a,#TK_INTGR 
      009FF1 83               [ 4] 6231 	ret 
      0022C6                       6232 const_porti:
      009FF2 20 90 85         [ 2] 6233 	ldw x,#8
      009FF5 89 5F            [ 1] 6234 	ld a,#TK_INTGR 
      009FF7 CD               [ 4] 6235 	ret 
                                   6236 
                                   6237 ;-------------------------------
                                   6238 ; following return constant 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                   6239 ; related to GPIO register offset 
                                   6240 ;---------------------------------
      0022CC                       6241 const_odr:
      009FF8 81 ED            [ 1] 6242 	ld a,#TK_INTGR 
      009FFA 5B 02 81         [ 2] 6243 	ldw x,#GPIO_ODR
      009FFD 81               [ 4] 6244 	ret 
      0022D2                       6245 const_idr:
      009FFD 72 0D            [ 1] 6246 	ld a,#TK_INTGR 
      009FFF 52 30 FB         [ 2] 6247 	ldw x,#GPIO_IDR
      00A002 72               [ 4] 6248 	ret 
      0022D8                       6249 const_ddr:
      00A003 16 00            [ 1] 6250 	ld a,#TK_INTGR 
      00A005 26 8E 81         [ 2] 6251 	ldw x,#GPIO_DDR
      00A008 81               [ 4] 6252 	ret 
      0022DE                       6253 const_cr1:
      00A008 CD 93            [ 1] 6254 	ld a,#TK_INTGR 
      00A00A 95 A1 04         [ 2] 6255 	ldw x,#GPIO_CR1
      00A00D 27               [ 4] 6256 	ret 
      0022E4                       6257 const_cr2:
      00A00E 03 CC            [ 1] 6258 	ld a,#TK_INTGR 
      00A010 88 38 04         [ 2] 6259 	ldw x,#GPIO_CR2
      00A012 81               [ 4] 6260 	ret 
                                   6261 ;-------------------------
                                   6262 ;  constant for port mode
                                   6263 ;  used by PMODE 
                                   6264 ;  input or output
                                   6265 ;------------------------
      0022EA                       6266 const_output:
      00A012 5D 27            [ 1] 6267 	ld a,#TK_INTGR 
      00A014 04 8F 5A         [ 2] 6268 	ldw x,#OUTP
      00A017 26               [ 4] 6269 	ret 
      0022F0                       6270 const_input:
      00A018 F9 4F            [ 1] 6271 	ld a,#TK_INTGR 
      00A01A 81 00 00         [ 2] 6272 	ldw x,#INP 
      00A01B 81               [ 4] 6273 	ret 
                                   6274 ;-----------------------
                                   6275 ; memory area constants
                                   6276 ;-----------------------
      0022F6                       6277 const_eeprom_base:
      00A01B CD 93            [ 1] 6278 	ld a,#TK_INTGR 
      00A01D 95 A1 04         [ 2] 6279 	ldw x,#EEPROM_BASE 
      00A020 27               [ 4] 6280 	ret 
                                   6281 
                                   6282 ;---------------------------
                                   6283 ; BASIC: DATA 
                                   6284 ; when the interpreter find 
                                   6285 ; a DATA line it skip it.
                                   6286 ;---------------------------
      0022FC                       6287 data:
      00A021 03 CC 88 38 01   [ 1] 6288 	mov in,count
      00A025 81               [ 4] 6289 	ret 
                                   6290 
                                   6291 ;---------------------------
                                   6292 ; BASIC: DATLN  *expr*
                                   6293 ; set DATA pointer at line# 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   6294 ; specified by *expr* 
                                   6295 ;---------------------------
      002302                       6296 data_line:
      00A025 A3 14 00         [ 4] 6297 	call expression
      00A028 2B 0C            [ 1] 6298 	cp a,#TK_INTGR
      00A02A 35 0F            [ 1] 6299 	jreq 1$
      00A02C 50 F2 A6         [ 2] 6300 	jp syntax_error 
      00A02F 1E 62 A6         [ 4] 6301 1$: call search_lineno
      00A032 10               [ 2] 6302 	tnzw x 
      00A033 62 20            [ 1] 6303 	jrne 3$
      00A035 1E 05            [ 1] 6304 2$:	ld a,#ERR_NO_LINE 
      00A036 CC 07 BA         [ 2] 6305 	jp tb_error
      002317                       6306 3$: ; check if valid data line 
      00A036 A3 08            [ 1] 6307     ldw y,x 
      00A038 00 2B            [ 2] 6308 	ldw x,(4,x)
      00A03A 09 35 0E         [ 2] 6309 	cpw x,#data 
      00A03D 50 F2            [ 1] 6310 	jrne 2$ 
      00A03F A6 50 62 20      [ 2] 6311 	ldw data_ptr,y
      00A043 10 E6 02         [ 1] 6312 	ld a,(2,y)
      00A044 C7 00 09         [ 1] 6313 	ld data_len,a 
      00A044 35 07 50 F2      [ 1] 6314 	mov data_ofs,#FIRST_DATA_ITEM 
      00A048 81               [ 4] 6315 	ret
                                   6316 
                                   6317 ;---------------------------------
                                   6318 ; BASIC: RESTORE 
                                   6319 ; set data_ptr to first data line
                                   6320 ; if not DATA found pointer set to
                                   6321 ; zero 
                                   6322 ;---------------------------------
      00232F                       6323 restore:
      00A048 A3 00 40 23      [ 1] 6324 	clr data_ptr 
      00A04C 07 72 5C 50      [ 1] 6325 	clr data_ptr+1
      00A050 F2 54 20 F4      [ 1] 6326 	clr data_ofs 
      00A054 72 5F 00 09      [ 1] 6327 	clr data_len
      00A054 9F 4A 27         [ 2] 6328 	ldw x,txtbgn
      002342                       6329 data_search_loop: 	
      00A057 01 4A 20         [ 2] 6330 	cpw x,txtend
      00A059 24 17            [ 1] 6331 	jruge 9$
      00A059 A4 3E            [ 1] 6332 	ldw y,x 
      00A05B C7 50            [ 2] 6333 	ldw x,(4,x)
      00A05D F1 72 18         [ 2] 6334 	cpw x,#data 
      00A060 50 F0            [ 1] 6335 	jrne try_next_line 
      00A062 8E 81 00 06      [ 2] 6336 	ldw data_ptr,y 
      00A064 90 E6 02         [ 1] 6337 	ld a,(2,y)
      00A064 CE 00 0F         [ 1] 6338 	ld data_len,a 
      00A067 A6 04 81 08      [ 1] 6339 	mov data_ofs,#FIRST_DATA_ITEM
      00A06A 72 5D 00 09      [ 1] 6340 9$:	tnz data_len 
      00A06A CD 92            [ 1] 6341     jrne 10$
      00A06C B9 A1            [ 1] 6342 	ld a,#ERR_NO_DATA 
      00A06E 01 27 03         [ 2] 6343 	jp tb_error 
      00A071 CC               [ 4] 6344 10$:ret
      00236A                       6345 try_next_line:
      00A072 88               [ 1] 6346 	ldw x,y 
      00A073 38 02            [ 1] 6347 	ld a,(2,x)
      00A074 C7 00 0D         [ 1] 6348 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A074 CD 90 9E 9E      [ 1] 6349 	clr acc16 
      00A078 A5 80 27 01      [ 2] 6350 	addw x,acc16 
      00A07C 50 A6            [ 2] 6351 	jra data_search_loop
                                   6352 
                                   6353 
                                   6354 ;---------------------------------
                                   6355 ; BASIC: READ 
                                   6356 ; return next data item | 0 
                                   6357 ;---------------------------------
                           000001  6358 	CTX_BPTR=1 
                           000003  6359 	CTX_IN=3 
                           000004  6360 	CTX_COUNT=4 
                           000005  6361 	XSAVE=5
                           000006  6362 	VSIZE=6
      00237A                       6363 read:
      00237A                       6364 	_vars  VSIZE 
      00A07E 04 81            [ 2]    1     sub sp,#VSIZE 
      00A080                       6365 read01:	
      00A080 CD 92 B9         [ 1] 6366 	ld a,data_ofs
      00A083 A1 02 27         [ 1] 6367 	cp a,data_len 
      00A086 03 CC            [ 1] 6368 	jreq 2$ ; end of line  
      00A088 88 38 CD         [ 4] 6369 	call save_context
      00A08B 90 9E 89         [ 2] 6370 	ldw x,data_ptr 
      00A08E CD 90 9E         [ 2] 6371 	ldw basicptr,x 
      00A091 9E 14 01 95 9F   [ 1] 6372 	mov in,data_ofs 
      00A096 14 02 97 5B 02   [ 1] 6373 	mov count,data_len  
      00A09B A6 04 81         [ 4] 6374 	call expression 
      00A09E A1 04            [ 1] 6375 	cp a,#TK_INTGR 
      00A09E CD 92            [ 1] 6376 	jreq 1$ 
      00A0A0 B9 A1 02         [ 2] 6377 	jp syntax_error 
      0023A1                       6378 1$:
      00A0A3 27 03            [ 2] 6379 	ldw (XSAVE,SP),x
      00A0A5 CC 88 38         [ 4] 6380 	call next_token ; skip comma
      00A0A8 CE 00 04         [ 2] 6381 	ldw x,basicptr 
      00A0A8 CD 90 9E         [ 2] 6382 	ldw data_ptr,x 
      00A0AB 89 CD 90 9E 9E   [ 1] 6383 	mov data_ofs,in 
      00A0B0 1A 01 95         [ 4] 6384 	call rest_context
      00A0B3 9F 1A            [ 2] 6385 	ldw x,(XSAVE,sp)
      00A0B5 02 97            [ 1] 6386 	ld a,#TK_INTGR
      0023B8                       6387 	_drop VSIZE 
      00A0B7 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A0B9 A6               [ 4] 6388 	ret 
      0023BB                       6389 2$: ; end of line reached 
      00A0BA 04 81 00 06      [ 2] 6390 	ldw y, data_ptr 
      00A0BC 72 5F 00 06      [ 1] 6391 	clr data_ptr
      00A0BC CD 92 B9 A1      [ 1] 6392 	clr data_ptr+1   
      00A0C0 02 27 03 CC      [ 1] 6393 	clr data_ofs 
      00A0C4 88 38 00 09      [ 1] 6394 	clr data_len 
      00A0C6 CD 23 6A         [ 4] 6395 	call try_next_line 
      00A0C6 CD 90            [ 2] 6396 	jra read01
                                   6397 
                                   6398 
                                   6399 ;------------------------------
                                   6400 ;      dictionary 
                                   6401 ; format:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                                   6402 ;   link:   2 bytes 
                                   6403 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6404 ;   cmd_name: 16 byte max 
                                   6405 ;   code_address: 2 bytes 
                                   6406 ;------------------------------
                                   6407 	.macro _dict_entry len,name,cmd 
                                   6408 	.word LINK 
                                   6409 	LINK=.
                                   6410 name:
                                   6411 	.byte len 	
                                   6412 	.ascii "name"
                                   6413 	.word cmd 
                                   6414 	.endm 
                                   6415 
                           000000  6416 	LINK=0
                                   6417 ; respect alphabetic order for BASIC names from Z-A
                                   6418 ; this sort order is for a cleaner WORDS cmd output. 	
      0023D4                       6419 kword_end:
      0023D4                       6420 	_dict_entry,5+F_IFUNC,XPEEK,xpeek 
      00A0C8 9E 89                    1 	.word LINK 
                           0023D6     2 	LINK=.
      0023D6                          3 XPEEK:
      00A0CA CD                       4 	.byte 5+F_IFUNC 	
      00A0CB 90 9E 9E 18 01           5 	.ascii "XPEEK"
      00A0D0 95 9F                    6 	.word xpeek 
      0023DE                       6421 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      00A0D2 18 02                    1 	.word LINK 
                           0023E0     2 	LINK=.
      0023E0                          3 XOR:
      00A0D4 97                       4 	.byte 3+F_IFUNC 	
      00A0D5 5B 02 A6                 5 	.ascii "XOR"
      00A0D8 04 81                    6 	.word bit_xor 
      00A0DA                       6422 	_dict_entry,5,WRITE,write  
      00A0DA CD 92                    1 	.word LINK 
                           0023E8     2 	LINK=.
      0023E8                          3 WRITE:
      00A0DC B9                       4 	.byte 5 	
      00A0DD A1 02 27 03 CC           5 	.ascii "WRITE"
      00A0E2 88 38                    6 	.word write 
      0023F0                       6423 	_dict_entry,5,WORDS,words 
      00A0E4 CD 90                    1 	.word LINK 
                           0023F2     2 	LINK=.
      0023F2                          3 WORDS:
      00A0E6 9E                       4 	.byte 5 	
      00A0E7 51 CD 90 9E 90           5 	.ascii "WORDS"
      00A0EC 5D 27                    6 	.word words 
      0023FA                       6424 	_dict_entry 4,WAIT,wait 
      00A0EE 05 58                    1 	.word LINK 
                           0023FC     2 	LINK=.
      0023FC                          3 WAIT:
      00A0F0 90                       4 	.byte 4 	
      00A0F1 5A 26 FB 54              5 	.ascii "WAIT"
      00A0F4 17 4F                    6 	.word wait 
      002403                       6425 	_dict_entry,3+F_IFUNC,USR,usr
      00A0F4 A6 04                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                           002405     2 	LINK=.
      002405                          3 USR:
      00A0F6 81                       4 	.byte 3+F_IFUNC 	
      00A0F7 55 53 52                 5 	.ascii "USR"
      00A0F7 CD 92                    6 	.word usr 
      00240B                       6426 	_dict_entry,5,UNTIL,until 
      00A0F9 B9 A1                    1 	.word LINK 
                           00240D     2 	LINK=.
      00240D                          3 UNTIL:
      00A0FB 02                       4 	.byte 5 	
      00A0FC 27 03 CC 88 38           5 	.ascii "UNTIL"
      00A101 CD 90                    6 	.word until 
      002415                       6427 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00A103 9E 51                    1 	.word LINK 
                           002417     2 	LINK=.
      002417                          3 UFLASH:
      00A105 CD                       4 	.byte 6+F_IFUNC 	
      00A106 90 9E 90 5D 27 05        5 	.ascii "UFLASH"
      00A10C 54 90                    6 	.word uflash 
      002420                       6428 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      00A10E 5A 26                    1 	.word LINK 
                           002422     2 	LINK=.
      002422                          3 UBOUND:
      00A110 FB                       4 	.byte 6+F_IFUNC 	
      00A111 55 42 4F 55 4E 44        5 	.ascii "UBOUND"
      00A111 A6 04                    6 	.word ubound 
      00242B                       6429 	_dict_entry,4,TONE,tone  
      00A113 81 22                    1 	.word LINK 
                           00242D     2 	LINK=.
      00A114                          3 TONE:
      00A114 A6                       4 	.byte 4 	
      00A115 04 CD 92 88              5 	.ascii "TONE"
      00A119 9F A4                    6 	.word tone 
      002434                       6430 	_dict_entry,2,TO,to
      00A11B 07 C7                    1 	.word LINK 
                           002436     2 	LINK=.
      002436                          3 TO:
      00A11D 50                       4 	.byte 2 	
      00A11E C6 81                    5 	.ascii "TO"
      00A120 18 66                    6 	.word to 
      00243B                       6431 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A120 52 01                    1 	.word LINK 
                           00243D     2 	LINK=.
      00243D                          3 TIMEOUT:
      00A122 CD                       4 	.byte 7+F_IFUNC 	
      00A123 92 95 A1 02 27 03 CC     5 	.ascii "TIMEOUT"
      00A12A 88 38                    6 	.word timeout 
      002447                       6432 	_dict_entry,5,TIMER,set_timer
      00A12C CD 90                    1 	.word LINK 
                           002449     2 	LINK=.
      002449                          3 TIMER:
      00A12E 9E                       4 	.byte 5 	
      00A12F 51 CD 90 9E CD           5 	.ascii "TIMER"
      00A134 A1 65                    6 	.word set_timer 
      002451                       6433 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A136 6B 01                    1 	.word LINK 
                           002453     2 	LINK=.
      002453                          3 TICKS:
      00A138 A6                       4 	.byte 5+F_IFUNC 	
      00A139 01 0D 01 27 0B           5 	.ascii "TICKS"
      00A13E 48 0A                    6 	.word get_ticks 
      00245B                       6434 	_dict_entry,4,STOP,stop 
      00A140 01 26                    1 	.word LINK 
                           00245D     2 	LINK=.
      00245D                          3 STOP:
      00A142 FB                       4 	.byte 4 	
      00A143 6B 01 EA 03              5 	.ascii "STOP"
      00A147 E7 03                    6 	.word stop 
      002464                       6435 	_dict_entry,4,STEP,step 
      00A149 90 A3                    1 	.word LINK 
                           002466     2 	LINK=.
      002466                          3 STEP:
      00A14B 00                       4 	.byte 4 	
      00A14C 01 27 07 7B              5 	.ascii "STEP"
      00A150 01 43                    6 	.word step 
      00246D                       6436 	_dict_entry,5,SLEEP,sleep 
      00A152 E4 02                    1 	.word LINK 
                           00246F     2 	LINK=.
      00246F                          3 SLEEP:
      00A154 20                       4 	.byte 5 	
      00A155 0A 4C 45 45 50           5 	.ascii "SLEEP"
      00A156 1F 7D                    6 	.word sleep 
      002477                       6437 	_dict_entry,4+F_IFUNC,SIZE,size
      00A156 7B 01                    1 	.word LINK 
                           002479     2 	LINK=.
      002479                          3 SIZE:
      00A158 EA                       4 	.byte 4+F_IFUNC 	
      00A159 04 E7 04 7B              5 	.ascii "SIZE"
      00A15D 01 EA                    6 	.word size 
      002480                       6438     _dict_entry,4,SHOW,show 
      00A15F 02 E7                    1 	.word LINK 
                           002482     2 	LINK=.
      002482                          3 SHOW:
      00A161 02                       4 	.byte 4 	
      00A162 5B 01 81 57              5 	.ascii "SHOW"
      00A165 13 B0                    6 	.word show 
      002489                       6439 	_dict_entry,4,SAVE,save
      00A165 58 1C                    1 	.word LINK 
                           00248B     2 	LINK=.
      00248B                          3 SAVE:
      00A167 A1                       4 	.byte 4 	
      00A168 75 FE 9F 88              5 	.ascii "SAVE"
      00A16C 5E A6                    6 	.word save 
      002492                       6440 	_dict_entry 3,RUN,run
      00A16E 05 42                    1 	.word LINK 
                           002494     2 	LINK=.
      002494                          3 RUN:
      00A170 1C                       4 	.byte 3 	
      00A171 50 00 84                 5 	.ascii "RUN"
      00A174 81 9F                    6 	.word run 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A175                       6441 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A175 03 06                    1 	.word LINK 
                           00249C     2 	LINK=.
      00249C                          3 RSHIFT:
      00A177 03                       4 	.byte 6+F_IFUNC 	
      00A178 05 04 00 02 01 06        5 	.ascii "RSHIFT"
      00A17E 00 02                    6 	.word rshift 
      0024A5                       6442 	_dict_entry,3+F_IFUNC,RND,random 
      00A180 02 02                    1 	.word LINK 
                           0024A7     2 	LINK=.
      0024A7                          3 RND:
      00A182 03                       4 	.byte 3+F_IFUNC 	
      00A183 03 01 03                 5 	.ascii "RND"
      00A186 03 02                    6 	.word random 
      0024AD                       6443 	_dict_entry,6,RETURN,return 
      00A188 04 04                    1 	.word LINK 
                           0024AF     2 	LINK=.
      0024AF                          3 RETURN:
      00A18A 05                       4 	.byte 6 	
      00A18B 02 06 02 07 02 05        5 	.ascii "RETURN"
      00A191 04 02                    6 	.word return 
      0024B8                       6444 	_dict_entry,7,RESTORE,restore 
      00A193 04 01                    1 	.word LINK 
                           0024BA     2 	LINK=.
      00A195                          3 RESTORE:
      00A195 CD                       4 	.byte 7 	
      00A196 92 B9 A1 01 27 03 CC     5 	.ascii "RESTORE"
      00A19D 88 38                    6 	.word restore 
      00A19F                       6445 	_dict_entry 6,REMARK,rem 
      00A19F CD 90                    1 	.word LINK 
                           0024C6     2 	LINK=.
      0024C6                          3 REMARK:
      00A1A1 9E                       4 	.byte 6 	
      00A1A2 89 9E A5 80 27 05        5 	.ascii "REMARK"
      00A1A8 A6 0A                    6 	.word rem 
      0024CF                       6446 	_dict_entry,6,REBOOT,cold_start
      00A1AA CC 88                    1 	.word LINK 
                           0024D1     2 	LINK=.
      0024D1                          3 REBOOT:
      00A1AC 3A                       4 	.byte 6 	
      00A1AD 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      00A1AD CE 00                    6 	.word cold_start 
      0024DA                       6447 	_dict_entry,4+F_IFUNC,READ,read  
      00A1AF 13 58                    1 	.word LINK 
                           0024DC     2 	LINK=.
      0024DC                          3 READ:
      00A1B1 58                       4 	.byte 4+F_IFUNC 	
      00A1B2 58 58 58 9E              5 	.ascii "READ"
      00A1B6 C8 00                    6 	.word read 
      0024E3                       6448 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A1B8 13 C7                    1 	.word LINK 
                           0024E5     2 	LINK=.
      0024E5                          3 QKEY:
      00A1BA 00                       4 	.byte 4+F_IFUNC 	
      00A1BB 0D 9F C8 00              5 	.ascii "QKEY"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A1BF 14 C7                    6 	.word qkey 
      0024EC                       6449 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      00A1C1 00 0E                    1 	.word LINK 
                           0024EE     2 	LINK=.
      0024EE                          3 PRTI:
      00A1C3 CE                       4 	.byte 4+F_IFUNC 	
      00A1C4 00 15 CF 00              5 	.ascii "PRTI"
      00A1C8 13 90                    6 	.word const_porti 
      0024F5                       6450 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      00A1CA 54 90                    1 	.word LINK 
                           0024F7     2 	LINK=.
      0024F7                          3 PRTH:
      00A1CC 9E                       4 	.byte 4+F_IFUNC 	
      00A1CD C8 00 15 C7              5 	.ascii "PRTH"
      00A1D1 00 15                    6 	.word const_porth 
      0024FE                       6451 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      00A1D3 90 9F                    1 	.word LINK 
                           002500     2 	LINK=.
      002500                          3 PRTG:
      00A1D5 C8                       4 	.byte 4+F_IFUNC 	
      00A1D6 00 16 C7 00              5 	.ascii "PRTG"
      00A1DA 16 CE                    6 	.word const_portg 
      002507                       6452 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      00A1DC 00 0D                    1 	.word LINK 
                           002509     2 	LINK=.
      002509                          3 PRTF:
      00A1DE 54                       4 	.byte 4+F_IFUNC 	
      00A1DF 54 54 9E C8              5 	.ascii "PRTF"
      00A1E3 00 0D                    6 	.word const_portf 
      002510                       6453 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      00A1E5 95 9F                    1 	.word LINK 
                           002512     2 	LINK=.
      002512                          3 PRTE:
      00A1E7 C8                       4 	.byte 4+F_IFUNC 	
      00A1E8 00 0E 97 C8              5 	.ascii "PRTE"
      00A1EC 00 16                    6 	.word const_porte 
      002519                       6454 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A1EE 97 9E                    1 	.word LINK 
                           00251B     2 	LINK=.
      00251B                          3 PRTD:
      00A1F0 C8                       4 	.byte 4+F_IFUNC 	
      00A1F1 00 15 95 CF              5 	.ascii "PRTD"
      00A1F5 00 15                    6 	.word const_portd 
      002522                       6455 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A1F7 90 85                    1 	.word LINK 
                           002524     2 	LINK=.
      002524                          3 PRTC:
      00A1F9 65                       4 	.byte 4+F_IFUNC 	
      00A1FA 93 5C A6 04              5 	.ascii "PRTC"
      00A1FE 81 A2                    6 	.word const_portc 
      00A1FF                       6456 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A1FF 52 02                    1 	.word LINK 
                           00252D     2 	LINK=.
      00252D                          3 PRTB:
      00A201 0F                       4 	.byte 4+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A202 02 90 AE A7              5 	.ascii "PRTB"
      00A206 BF 93                    6 	.word const_portb 
      002534                       6457 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A208 F6 A4                    1 	.word LINK 
                           002536     2 	LINK=.
      002536                          3 PRTA:
      00A20A 0F                       4 	.byte 4+F_IFUNC 	
      00A20B 6B 01 5C F6              5 	.ascii "PRTA"
      00A20F CD 82                    6 	.word const_porta 
      00253D                       6458 	_dict_entry 5,PRINT,print 
      00A211 4B 0C                    1 	.word LINK 
                           00253F     2 	LINK=.
      00253F                          3 PRINT:
      00A213 02                       4 	.byte 5 	
      00A214 0A 01 26 F5 A6           5 	.ascii "PRINT"
      00A219 46 11                    6 	.word print 
      002547                       6459 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A21B 02 2B                    1 	.word LINK 
                           002549     2 	LINK=.
      002549                          3 POUT:
      00A21D 09                       4 	.byte 4+F_IFUNC 	
      00A21E A6 20 CD 82              5 	.ascii "POUT"
      00A222 4B 0C                    6 	.word const_output 
      002550                       6460 	_dict_entry,4,POKE,poke 
      00A224 02 20                    1 	.word LINK 
                           002552     2 	LINK=.
      002552                          3 POKE:
      00A226 07                       4 	.byte 4 	
      00A227 A6 0D CD 82              5 	.ascii "POKE"
      00A22B 4B 0F                    6 	.word poke 
      002559                       6461 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A22D 02 72                    1 	.word LINK 
                           00255B     2 	LINK=.
      00255B                          3 PINP:
      00A22F A2                       4 	.byte 4+F_IFUNC 	
      00A230 00 02 90 FE              5 	.ascii "PINP"
      00A234 26 D1                    6 	.word const_input 
      002562                       6462 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A236 5B 02                    1 	.word LINK 
                           002564     2 	LINK=.
      002564                          3 PEEK:
      00A238 81                       4 	.byte 4+F_IFUNC 	
      00A239 50 45 45 4B              5 	.ascii "PEEK"
      00A239 CD 92                    6 	.word peek 
      00256B                       6463 	_dict_entry,5,PMODE,pin_mode 
      00A23B 95 A1                    1 	.word LINK 
                           00256D     2 	LINK=.
      00256D                          3 PMODE:
      00A23D 01                       4 	.byte 5 	
      00A23E 27 03 CC 88 38           5 	.ascii "PMODE"
      00A243 20 A0                    6 	.word pin_mode 
      002575                       6464 	_dict_entry,5,PAUSE,pause 
      00A243 CD 90                    1 	.word LINK 
                           002577     2 	LINK=.
      002577                          3 PAUSE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A245 9E                       4 	.byte 5 	
      00A246 CF 00 11 81 45           5 	.ascii "PAUSE"
      00A24A 1F 88                    6 	.word pause 
      00257F                       6465 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A24A CE 00                    1 	.word LINK 
                           002581     2 	LINK=.
      002581                          3 OR:
      00A24C 11                       4 	.byte 2+F_IFUNC 	
      00A24D 4F 52                    5 	.ascii "OR"
      00A24D 53 A3                    6 	.word bit_or 
      002586                       6466 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A24F FF FF                    1 	.word LINK 
                           002588     2 	LINK=.
      002588                          3 ODR:
      00A251 27                       4 	.byte 3+F_IFUNC 	
      00A252 01 5F A6                 5 	.ascii "ODR"
      00A255 04 81                    6 	.word const_odr 
      00A257                       6467 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A257 CD 92                    1 	.word LINK 
                           002590     2 	LINK=.
      002590                          3 NOT:
      00A259 B9                       4 	.byte 3+F_IFUNC 	
      00A25A A1 01 27                 5 	.ascii "NOT"
      00A25D 03 CC                    6 	.word func_not 
      002596                       6468 	_dict_entry,3,NEW,new
      00A25F 88 38                    1 	.word LINK 
                           002598     2 	LINK=.
      002598                          3 NEW:
      00A261 CD                       4 	.byte 3 	
      00A262 90 9E 20                 5 	.ascii "NEW"
      00A265 E7 8B                    6 	.word new 
      00A266                       6469 	_dict_entry,4,NEXT,next 
      00A266 CD 92                    1 	.word LINK 
                           0025A0     2 	LINK=.
      0025A0                          3 NEXT:
      00A268 95                       4 	.byte 4 	
      00A269 A1 01 27 03              5 	.ascii "NEXT"
      00A26D CC 88                    6 	.word next 
      0025A7                       6470 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A26F 38 4B                    1 	.word LINK 
                           0025A9     2 	LINK=.
      0025A9                          3 LSHIFT:
      00A271 00                       4 	.byte 6+F_IFUNC 	
      00A272 35 CC 50 E0 CD 90        5 	.ascii "LSHIFT"
      00A278 9E 9E                    6 	.word lshift 
      0025B2                       6471 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A27A A4 3F                    1 	.word LINK 
                           0025B4     2 	LINK=.
      0025B4                          3 LOG:
      00A27C 95                       4 	.byte 3+F_IFUNC 	
      00A27D A3 00 FF                 5 	.ascii "LOG"
      00A280 23 06                    6 	.word log2 
      0025BA                       6472 	_dict_entry,4,LOAD,load 
      00A282 0C 01                    1 	.word LINK 
                           0025BC     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      0025BC                          3 LOAD:
      00A284 98                       4 	.byte 4 	
      00A285 56 20 F5 35              5 	.ascii "LOAD"
      00A289 55 50                    6 	.word load 
      0025C3                       6473 	_dict_entry 4,LIST,list
      00A28B E0 84                    1 	.word LINK 
                           0025C5     2 	LINK=.
      0025C5                          3 LIST:
      00A28D C7                       4 	.byte 4 	
      00A28E 50 E1 9F 4A              5 	.ascii "LIST"
      00A292 35 55                    6 	.word list 
      0025CC                       6474 	_dict_entry 3,LET,let 
      00A294 50 E0                    1 	.word LINK 
                           0025CE     2 	LINK=.
      0025CE                          3 LET:
      00A296 C7                       4 	.byte 3 	
      00A297 50 E2 35                 5 	.ascii "LET"
      00A29A AA 50                    6 	.word let 
      0025D4                       6475 	_dict_entry,3+F_IFUNC,KEY,key 
      00A29C E0 81                    1 	.word LINK 
                           0025D6     2 	LINK=.
      00A29E                          3 KEY:
      00A29E 35                       4 	.byte 3+F_IFUNC 	
      00A29F AA 50 E0                 5 	.ascii "KEY"
      00A2A2 81 C9                    6 	.word key 
      00A2A3                       6476 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A2A3 CD 92                    1 	.word LINK 
                           0025DE     2 	LINK=.
      0025DE                          3 IWDGREF:
      00A2A5 B9                       4 	.byte 7 	
      00A2A6 A1 01 27 03 CC 88 38     5 	.ascii "IWDGREF"
      00A2AD CD 90                    6 	.word refresh_iwdg 
      0025E8                       6477 	_dict_entry,6,IWDGEN,enable_iwdg
      00A2AF 9E DE                    1 	.word LINK 
                           0025EA     2 	LINK=.
      00A2B0                          3 IWDGEN:
      00A2B0 5D                       4 	.byte 6 	
      00A2B1 27 0A A6 0F 59 25        5 	.ascii "IWDGEN"
      00A2B7 03 4A                    6 	.word enable_iwdg 
      0025F3                       6478 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A2B9 20 FA                    1 	.word LINK 
                           0025F5     2 	LINK=.
      0025F5                          3 INVERT:
      00A2BB 5F                       4 	.byte 6+F_IFUNC 	
      00A2BC 97 A6 04 81 52 54        5 	.ascii "INVERT"
      00A2C0 22 5C                    6 	.word invert 
      0025FE                       6479 	_dict_entry,5,INPUT,input_var  
      00A2C0 CD 92                    1 	.word LINK 
                           002600     2 	LINK=.
      002600                          3 INPUT:
      00A2C2 B9                       4 	.byte 5 	
      00A2C3 A1 01 27 03 CC           5 	.ascii "INPUT"
      00A2C8 88 38                    6 	.word input_var 
      002608                       6480 	_dict_entry,2,IF,if 
      00A2CA CD 90                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                           00260A     2 	LINK=.
      00260A                          3 IF:
      00A2CC 9E                       4 	.byte 2 	
      00A2CD 9F A4                    5 	.ascii "IF"
      00A2CF 0F 5F                    6 	.word if 
      00260F                       6481 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A2D1 5C 4D                    1 	.word LINK 
                           002611     2 	LINK=.
      002611                          3 IDR:
      00A2D3 27                       4 	.byte 3+F_IFUNC 	
      00A2D4 04 58 4A                 5 	.ascii "IDR"
      00A2D7 20 F9                    6 	.word const_idr 
      002617                       6482 	_dict_entry,3,HEX,hex_base
      00A2D9 A6 04                    1 	.word LINK 
                           002619     2 	LINK=.
      002619                          3 HEX:
      00A2DB 81                       4 	.byte 3 	
      00A2DC 48 45 58                 5 	.ascii "HEX"
      00A2DC CD 92                    6 	.word hex_base 
      00261F                       6483 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A2DE B9 A1                    1 	.word LINK 
                           002621     2 	LINK=.
      002621                          3 GPIO:
      00A2E0 01                       4 	.byte 4+F_IFUNC 	
      00A2E1 27 03 CC 88              5 	.ascii "GPIO"
      00A2E5 38 CD                    6 	.word gpio 
      002628                       6484 	_dict_entry,4,GOTO,goto 
      00A2E7 90 9E                    1 	.word LINK 
                           00262A     2 	LINK=.
      00262A                          3 GOTO:
      00A2E9 53                       4 	.byte 4 	
      00A2EA A6 04 81 4F              5 	.ascii "GOTO"
      00A2ED 19 46                    6 	.word goto 
      002631                       6485 	_dict_entry,5,GOSUB,gosub 
      00A2ED 85 52                    1 	.word LINK 
                           002633     2 	LINK=.
      002633                          3 GOSUB:
      00A2EF 04                       4 	.byte 5 	
      00A2F0 89 CC 99 2E 42           5 	.ascii "GOSUB"
      00A2F4 19 61                    6 	.word gosub 
      00263B                       6486 	_dict_entry,6,FORGET,forget 
      00A2F4 72 5D                    1 	.word LINK 
                           00263D     2 	LINK=.
      00263D                          3 FORGET:
      00A2F6 00                       4 	.byte 6 	
      00A2F7 23 26 03 CC 88 38        5 	.ascii "FORGET"
      00A2FD 1D 7D                    6 	.word forget 
      002646                       6487 	_dict_entry,3,FOR,for 
      00A2FD CD 93                    1 	.word LINK 
                           002648     2 	LINK=.
      002648                          3 FOR:
      00A2FF D9                       4 	.byte 3 	
      00A300 A1 04 27                 5 	.ascii "FOR"
      00A303 03 CC                    6 	.word for 
      00264E                       6488 	_dict_entry,4,FCPU,fcpu 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A305 88 38                    1 	.word LINK 
                           002650     2 	LINK=.
      00A307                          3 FCPU:
      00A307 5D                       4 	.byte 4 	
      00A308 26 03 CC 99              5 	.ascii "FCPU"
      00A30C 89 94                    6 	.word fcpu 
      00A30D                       6489 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A30D 85 5B                    1 	.word LINK 
                           002659     2 	LINK=.
      002659                          3 EEPROM:
      00A30F 04                       4 	.byte 6+F_IFUNC 	
      00A310 89 72 5A 00 23 81        5 	.ascii "EEPROM"
      00A316 22 F6                    6 	.word const_eeprom_base 
      002662                       6490 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A316 AE 00                    1 	.word LINK 
                           002664     2 	LINK=.
      002664                          3 DWRITE:
      00A318 00                       4 	.byte 6+F_CMD 	
      00A319 A6 04 81 49 54 45        5 	.ascii "DWRITE"
      00A31C 1B 00                    6 	.word digital_write 
      00266D                       6491 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A31C AE 00                    1 	.word LINK 
                           00266F     2 	LINK=.
      00266F                          3 DREAD:
      00A31E 01                       4 	.byte 5+F_IFUNC 	
      00A31F A6 04 81 41 44           5 	.ascii "DREAD"
      00A322 1A CE                    6 	.word digital_read 
      002677                       6492 	_dict_entry,2,DO,do_loop
      00A322 AE 00                    1 	.word LINK 
                           002679     2 	LINK=.
      002679                          3 DO:
      00A324 02                       4 	.byte 2 	
      00A325 A6 04                    5 	.ascii "DO"
      00A327 81 6D                    6 	.word do_loop 
      00A328                       6493 	_dict_entry,3,DIR,directory 
      00A328 AE 00                    1 	.word LINK 
                           002680     2 	LINK=.
      002680                          3 DIR:
      00A32A 03                       4 	.byte 3 	
      00A32B A6 04 81                 5 	.ascii "DIR"
      00A32E 1D C8                    6 	.word directory 
      002686                       6494 	_dict_entry,3,DEC,dec_base
      00A32E AE 00                    1 	.word LINK 
                           002688     2 	LINK=.
      002688                          3 DEC:
      00A330 04                       4 	.byte 3 	
      00A331 A6 04 81                 5 	.ascii "DEC"
      00A334 13 C5                    6 	.word dec_base 
      00268E                       6495 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A334 AE 00                    1 	.word LINK 
                           002690     2 	LINK=.
      002690                          3 DDR:
      00A336 05                       4 	.byte 3+F_IFUNC 	
      00A337 A6 04 81                 5 	.ascii "DDR"
      00A33A 22 D8                    6 	.word const_ddr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      002696                       6496 	_dict_entry,6,DATALN,data_line  
      00A33A AE 00                    1 	.word LINK 
                           002698     2 	LINK=.
      002698                          3 DATALN:
      00A33C 06                       4 	.byte 6 	
      00A33D A6 04 81 41 4C 4E        5 	.ascii "DATALN"
      00A340 23 02                    6 	.word data_line 
      0026A1                       6497 	_dict_entry,4,DATA,data  
      00A340 AE 00                    1 	.word LINK 
                           0026A3     2 	LINK=.
      0026A3                          3 DATA:
      00A342 07                       4 	.byte 4 	
      00A343 A6 04 81 41              5 	.ascii "DATA"
      00A346 22 FC                    6 	.word data 
      0026AA                       6498 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A346 AE 00                    1 	.word LINK 
                           0026AC     2 	LINK=.
      0026AC                          3 CRL:
      00A348 08                       4 	.byte 3+F_IFUNC 	
      00A349 A6 04 81                 5 	.ascii "CRL"
      00A34C 22 DE                    6 	.word const_cr1 
      0026B2                       6499 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A34C A6 04                    1 	.word LINK 
                           0026B4     2 	LINK=.
      0026B4                          3 CRH:
      00A34E AE                       4 	.byte 3+F_IFUNC 	
      00A34F 00 00 81                 5 	.ascii "CRH"
      00A352 22 E4                    6 	.word const_cr2 
      0026BA                       6500 	_dict_entry,4+F_CFUNC,CHAR,char
      00A352 A6 04                    1 	.word LINK 
                           0026BC     2 	LINK=.
      0026BC                          3 CHAR:
      00A354 AE                       4 	.byte 4+F_CFUNC 	
      00A355 00 01 81 52              5 	.ascii "CHAR"
      00A358 1E 95                    6 	.word char 
      0026C3                       6501 	_dict_entry,3,BYE,bye 
      00A358 A6 04                    1 	.word LINK 
                           0026C5     2 	LINK=.
      0026C5                          3 BYE:
      00A35A AE                       4 	.byte 3 	
      00A35B 00 02 81                 5 	.ascii "BYE"
      00A35E 1F 33                    6 	.word bye 
      0026CB                       6502 	_dict_entry,5,BTOGL,bit_toggle
      00A35E A6 04                    1 	.word LINK 
                           0026CD     2 	LINK=.
      0026CD                          3 BTOGL:
      00A360 AE                       4 	.byte 5 	
      00A361 00 03 81 47 4C           5 	.ascii "BTOGL"
      00A364 17 A3                    6 	.word bit_toggle 
      0026D5                       6503 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A364 A6 04                    1 	.word LINK 
                           0026D7     2 	LINK=.
      0026D7                          3 BTEST:
      00A366 AE                       4 	.byte 5+F_IFUNC 	
      00A367 00 04 81 53 54           5 	.ascii "BTEST"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A36A 17 B7                    6 	.word bit_test 
      0026DF                       6504 	_dict_entry,4,BSET,bit_set 
      00A36A A6 04                    1 	.word LINK 
                           0026E1     2 	LINK=.
      0026E1                          3 BSET:
      00A36C AE                       4 	.byte 4 	
      00A36D 00 01 81 54              5 	.ascii "BSET"
      00A370 17 7A                    6 	.word bit_set 
      0026E8                       6505 	_dict_entry,4,BRES,bit_reset
      00A370 A6 04                    1 	.word LINK 
                           0026EA     2 	LINK=.
      0026EA                          3 BRES:
      00A372 AE                       4 	.byte 4 	
      00A373 00 00 81 53              5 	.ascii "BRES"
      00A376 17 8E                    6 	.word bit_reset 
      0026F1                       6506 	_dict_entry,5,BREAK,break 
      00A376 A6 04                    1 	.word LINK 
                           0026F3     2 	LINK=.
      0026F3                          3 BREAK:
      00A378 AE                       4 	.byte 5 	
      00A379 40 00 81 41 4B           5 	.ascii "BREAK"
      00A37C 1B 3F                    6 	.word break 
      0026FB                       6507 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A37C 55 00                    1 	.word LINK 
                           0026FD     2 	LINK=.
      0026FD                          3 BIT:
      00A37E 04                       4 	.byte 3+F_IFUNC 	
      00A37F 00 02 81                 5 	.ascii "BIT"
      00A382 22 40                    6 	.word bitmask 
      002703                       6508 	_dict_entry,3,AWU,awu 
      00A382 CD 93                    1 	.word LINK 
                           002705     2 	LINK=.
      002705                          3 AWU:
      00A384 95                       4 	.byte 3 	
      00A385 A1 04 27                 5 	.ascii "AWU"
      00A388 03 CC                    6 	.word awu 
      00270B                       6509 	_dict_entry,7,AUTORUN,autorun
      00A38A 88 38                    1 	.word LINK 
                           00270D     2 	LINK=.
      00270D                          3 AUTORUN:
      00A38C CD                       4 	.byte 7 	
      00A38D 83 8E 5D 26 05 A6 05     5 	.ascii "AUTORUN"
      00A394 CC 88                    6 	.word autorun 
      002717                       6510 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A396 3A 0D                    1 	.word LINK 
                           002719     2 	LINK=.
      00A397                          3 ASC:
      00A397 90                       4 	.byte 3+F_IFUNC 	
      00A398 93 EE 04                 5 	.ascii "ASC"
      00A39B A3 A3                    6 	.word ascii 
      00271F                       6511 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A39D 7C 26                    1 	.word LINK 
                           002721     2 	LINK=.
      002721                          3 AND:
      00A39F F2                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A3A0 90 CF 00                 5 	.ascii "AND"
      00A3A3 07 90                    6 	.word bit_and 
      002727                       6512 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A3A5 E6 02                    1 	.word LINK 
                           002729     2 	LINK=.
      002729                          3 ADCREAD:
      00A3A7 C7                       4 	.byte 7+F_IFUNC 	
      00A3A8 00 0A 35 06 00 09 81     5 	.ascii "ADCREAD"
      00A3AF 1A 98                    6 	.word analog_read 
      002733                       6513 	_dict_entry,5,ADCON,power_adc 
      00A3AF 72 5F                    1 	.word LINK 
                           002735     2 	LINK=.
      002735                          3 ADCON:
      00A3B1 00                       4 	.byte 5 	
      00A3B2 07 72 5F 00 08           5 	.ascii "ADCON"
      00A3B7 72 5F                    6 	.word power_adc 
      00273D                       6514 kword_dict:
      00273D                       6515 	_dict_entry,3+F_IFUNC,ABS,abs
      00A3B9 00 09                    1 	.word LINK 
                           00273F     2 	LINK=.
      00273F                          3 ABS:
      00A3BB 72                       4 	.byte 3+F_IFUNC 	
      00A3BC 5F 00 0A                 5 	.ascii "ABS"
      00A3BF CE 00                    6 	.word abs 
                                   6516 	
                                   6517 
      002780                       6518 	.bndry 128 ; align on FLASH block.
                                   6519 ; free space for user application  
      002780                       6520 user_space:
                                   6521 ; USR() function test
      00A3C1 1F               [ 2] 6522 	pushw x 
      00A3C2 72 1A 50 0A      [ 1] 6523 	bset PC_ODR,#5 
      00A3C2 C3               [ 2] 6524 	popw x 
      00A3C3 00 21 24         [ 4] 6525 	call pause02 
      00A3C6 17 90 93 EE      [ 1] 6526 	bres PC_ODR,#5 
      00A3CA 04               [ 4] 6527 	ret
                                   6528 
                                   6529 	.area FLASH_DRIVE (ABS)
      010000                       6530 	.org 0x10000
      010000                       6531 fdrive:
                                   6532 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        00273F R   |   5 ADCON      002735 R
  5 ADCREAD    002729 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
    AFR7_BEE=  000007     |   5 AND        002721 R   |     ARG_CNT =  000001 
    ARG_OFS =  000002     |   5 ASC        002719 R   |     ATTRIB  =  000002 
  5 AUTORUN    00270D R   |     AUTORUN_=  004000     |   5 AWU        002705 R
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
    BINARY  =  000001     |   5 BIT        0026FD R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  000005     |   5 BREAK      0026F3 R
  5 BRES       0026EA R   |   5 BSET       0026E1 R   |     BSIZE   =  000001 
    BSP     =  000008     |   5 BTEST      0026D7 R   |   5 BTOGL      0026CD R
    BTW     =  000001     |     BUFIDX  =  000003     |   5 BYE        0026C5 R
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
  5 CHAR       0026BC R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
    CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0     |     CLK_ICKR=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
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
    CLK_SWR_=  0000D2     |     CMD_END =  000002     |     CNT     =  000006 
    COMMA   =  000001     |     COUNT   =  000001     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        0026B4 R
  5 CRL        0026AC R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
    CTRL_C  =  000003     |     CTRL_D  =  000004     |     CTRL_E  =  000005 
    CTRL_F  =  000006     |     CTRL_G  =  000007     |     CTRL_H  =  000008 
    CTRL_I  =  000009     |     CTRL_J  =  00000A     |     CTRL_K  =  00000B 
    CTRL_L  =  00000C     |     CTRL_M  =  00000D     |     CTRL_N  =  00000E 
    CTRL_O  =  00000F     |     CTRL_P  =  000010     |     CTRL_Q  =  000011 
    CTRL_R  =  000012     |     CTRL_S  =  000013     |     CTRL_T  =  000014 
    CTRL_U  =  000015     |     CTRL_V  =  000016     |     CTRL_W  =  000017 
    CTRL_X  =  000018     |     CTRL_Y  =  000019     |     CTRL_Z  =  00001A 
    CTXT_SIZ=  000004     |     CTX_BPTR=  000001     |     CTX_COUN=  000004 
    CTX_IN  =  000003     |     CURR    =  000002     |     CX_BPTR =  000001 
    CX_CNT  =  000004     |     CX_IN   =  000003     |   5 DATA       0026A3 R
  5 DATALN     002698 R   |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        002690 R
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        002688 R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        002680 R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DO         002679 R   |   5 DREAD      00266F R   |     DSTACK_S=  000020 
  5 DWRITE     002664 R   |   5 EEPROM     002659 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |     EOF     =  0000FF 
    ERR_BAD_=  00000A     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_L=  000005     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  5 FCPU       002650 R   |     FF      =  00000C     |     FHSE    =  7A1200 
    FHSI    =  F42400     |     FIRST   =  000001     |     FIRST_DA=  000006 
    FLASH_BA=  008000     |     FLASH_CR=  00505A     |     FLASH_CR=  000002 
    FLASH_CR=  000000     |     FLASH_CR=  000003     |     FLASH_CR=  000001 
    FLASH_CR=  00505B     |     FLASH_CR=  000005     |     FLASH_CR=  000004 
    FLASH_CR=  000007     |     FLASH_CR=  000000     |     FLASH_CR=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

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
    FLOOP   =  000002     |     FLSI    =  01F400     |   5 FOR        002648 R
  5 FORGET     00263D R   |     FRUN    =  000000     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FTRAP   =  000001     |     F_CFUNC =  000080 
    F_CMD   =  000000     |     F_CONST =  0000C0     |     F_IFUNC =  000040 
  5 GOSUB      002633 R   |   5 GOTO       00262A R   |   5 GPIO       002621 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   5 HEX        002619 R   |     HSECNT  =  004809 
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
  5 IDR        002611 R   |   5 IF         00260A R   |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   5 INPUT      002600 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  00801C     |     INT_VECT=  008020     |     INT_VECT=  008024 
    INT_VECT=  008068     |     INT_VECT=  008054     |     INT_VECT=  008000 
    INT_VECT=  008030     |     INT_VECT=  008038     |     INT_VECT=  008034 
    INT_VECT=  008040     |     INT_VECT=  00803C     |     INT_VECT=  008048 
    INT_VECT=  008044     |     INT_VECT=  008064     |     INT_VECT=  008008 
    INT_VECT=  008004     |     INT_VECT=  008050     |     INT_VECT=  00804C 
    INT_VECT=  00805C     |     INT_VECT=  008058     |   5 INVERT     0025F5 R
    INW     =  000003     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
  5 IWDGEN     0025EA R   |   5 IWDGREF    0025DE R   |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        0025D6 R
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  5 LET        0025CE R   |     LINENO  =  000005     |   5 LINK    =  00273F R
  5 LIST       0025C5 R   |     LL      =  000002     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   5 LOAD       0025BC R
  5 LOG        0025B4 R   |   5 LSHIFT     0025A9 R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        002598 R
  5 NEXT       0025A0 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NL      =  00000A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   5 NOT        002590 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R
  5 ODR        002588 R   |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         002581 R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
    PAD_SIZE=  000028     |   5 PAUSE      002577 R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       002564 R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       00255B R   |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      00256D R
  5 POKE       002552 R   |   5 POUT       002549 R   |     PREV    =  000001 
  5 PRINT      00253F R   |     PROD    =  000002     |   5 PRTA       002536 R
  5 PRTB       00252D R   |   5 PRTC       002524 R   |   5 PRTD       00251B R
  5 PRTE       002512 R   |   5 PRTF       002509 R   |   5 PRTG       002500 R
  5 PRTH       0024F7 R   |   5 PRTI       0024EE R   |     PSIZE   =  000001 
  5 QKEY       0024E5 R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 READ       0024DC R   |   5 REBOOT     0024D1 R
  5 REG_A      0009C0 R   |   5 REG_CC     0009C4 R   |   5 REG_EPC    0009B3 R
  5 REG_SP     0009C9 R   |   5 REG_X      0009BC R   |   5 REG_Y      0009B8 R
    RELOP   =  000005     |   5 REMARK     0024C6 R   |   5 RESTORE    0024BA R
    RETL1   =  000001     |   5 RETURN     0024AF R   |     RET_ADDR=  000003 
    RET_INW =  000005     |   5 RND        0024A7 R   |     ROP     =  004800 
  5 RSHIFT     00249C R   |     RST_SR  =  0050B3     |   5 RUN        002494 R
    RXCHAR  =  000001     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   5 SAVE       00248B R
    SDIVD   =  000002     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       002482 R   |     SIGN    =  000001 
  5 SIZE       002479 R   |     SKIP    =  000005     |   5 SLEEP      00246F R
    SPACE   =  000020     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  000080     |   5 STATES     000976 R   |   5 STEP       002466 R
  5 STOP       00245D R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      002453 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_CCR=  005266     |     TIM1_CCR=  005267     |     TIM1_CCR=  005268 
    TIM1_CCR=  005269     |     TIM1_CCR=  00526A     |     TIM1_CCR=  00526B 
    TIM1_CCR=  00526C     |     TIM1_CNT=  00525E     |     TIM1_CNT=  00525F 
    TIM1_CR1=  005250     |     TIM1_CR2=  005251     |     TIM1_CR2=  000000 
    TIM1_CR2=  000002     |     TIM1_CR2=  000004     |     TIM1_CR2=  000005 
    TIM1_CR2=  000006     |     TIM1_DTR=  00526E     |     TIM1_EGR=  005257 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_SR_=  000000     |   5 TIMEOUT    00243D R   |   5 TIMER      002449 R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_ARRAY=  000002 
    TK_CFUNC=  000008     |     TK_CHAR =  000003     |     TK_CMD  =  000006 
    TK_COLON=  000001     |     TK_COMMA=  00000D     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000007 
    TK_INTGR=  000004     |     TK_LE   =  000036     |     TK_LPARE=  00000B 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  00000A     |     TK_RPARE=  00000C 
    TK_SHARP=  00000E     |     TK_VAR  =  000005     |   5 TO         002436 R
  5 TONE       00242D R   |   5 Timer4Up   00003E R   |   5 TrapHand   00002F R
    U8      =  000003     |     UART1   =  000000     |     UART1_BA=  005230 
    UART1_BR=  005232     |     UART1_BR=  005233     |     UART1_CR=  005234 
    UART1_CR=  005235     |     UART1_CR=  005236     |     UART1_CR=  005237 
    UART1_CR=  005238     |     UART1_DR=  005231     |     UART1_GT=  005239 
    UART1_PO=  000000     |     UART1_PS=  00523A     |     UART1_RX=  000004 
    UART1_SR=  005230     |     UART1_TX=  000005     |     UART3   =  000001 
    UART3_BA=  005240     |     UART3_BR=  005242     |     UART3_BR=  005243 
    UART3_CR=  005244     |     UART3_CR=  005245     |     UART3_CR=  005246 
    UART3_CR=  005247     |     UART3_CR=  004249     |     UART3_DR=  005241 
    UART3_PO=  00000F     |     UART3_RX=  000006     |     UART3_SR=  005240 
    UART3_TX=  000005     |     UART_BRR=  000002     |     UART_BRR=  000003 
    UART_CR1=  000004     |     UART_CR1=  000004     |     UART_CR1=  000002 
    UART_CR1=  000000     |     UART_CR1=  000001     |     UART_CR1=  000007 
    UART_CR1=  000006     |     UART_CR1=  000005     |     UART_CR1=  000003 
    UART_CR2=  000005     |     UART_CR2=  000004     |     UART_CR2=  000002 
    UART_CR2=  000005     |     UART_CR2=  000001     |     UART_CR2=  000000 
    UART_CR2=  000006     |     UART_CR2=  000003     |     UART_CR2=  000007 
    UART_CR3=  000006     |     UART_CR3=  000003     |     UART_CR3=  000001 
    UART_CR3=  000002     |     UART_CR3=  000000     |     UART_CR3=  000006 
    UART_CR3=  000004     |     UART_CR3=  000005     |     UART_CR4=  000007 
    UART_CR4=  000000     |     UART_CR4=  000001     |     UART_CR4=  000002 
    UART_CR4=  000003     |     UART_CR4=  000004     |     UART_CR4=  000006 
    UART_CR4=  000005     |     UART_CR5=  000008     |     UART_CR5=  000003 
    UART_CR5=  000001     |     UART_CR5=  000002     |     UART_CR5=  000004 
    UART_CR5=  000005     |     UART_CR6=  000009     |     UART_CR6=  000004 
    UART_CR6=  000007     |     UART_CR6=  000001     |     UART_CR6=  000002 
    UART_CR6=  000000     |     UART_CR6=  000005     |     UART_DR =  000001 
    UART_GTR=  000009     |     UART_PSC=  00000A     |     UART_SR =  000000 
    UART_SR_=  000001     |     UART_SR_=  000004     |     UART_SR_=  000002 
    UART_SR_=  000003     |     UART_SR_=  000000     |     UART_SR_=  000005 
    UART_SR_=  000006     |     UART_SR_=  000007     |     UBC     =  004801 
  5 UBOUND     002422 R   |   5 UBTN_Han   000081 R   |   5 UFLASH     002417 R
  5 UNTIL      00240D R   |   5 USER_ABO   000089 R   |     USE_BLOC=  000000 
  5 USR        002405 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |   5 Uart1RxH   000018 R   |   5 UserButt   000054 R
    VSIZ    =  000002     |     VSIZE   =  000006     |     VT      =  00000B 
  5 WAIT       0023FC R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      0023F2 R   |   5 WRITE      0023E8 R   |     WWDG_CR =  0050D1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

    WWDG_WR =  0050D2     |     XADR    =  000001     |     XMASK   =  000001 
  5 XOR        0023E0 R   |   5 XPEEK      0023D6 R   |     XSAVE   =  000005 
    YSAVE   =  000003     |   5 abs        001FEA R   |   1 acc16      00000C R
  1 acc24      00000B R   |   1 acc8       00000D R   |   5 accept_c   000B6C R
  5 add        0010D6 R   |   5 analog_r   001A98 R   |   5 ansi_seq   000B2E R
  5 arduino_   0020F5 R   |   5 arg_list   001215 R   |   1 array_si   000023 R
  5 ascii      001EA9 R   |   5 at_tst     000E39 R   |   5 atoi24     000F4C R
  5 atoi_exi   000FBA R   |   5 autorun    001F3C R   |   5 autorun_   00066D R
  5 awu        001F9B R   |   5 awu02      001FA5 R   |   5 bad_port   001F0A R
  1 base       00000A R   |   1 basicptr   000004 R   |   5 beep       001A07 R
  5 bin_exit   000D3D R   |   5 bit_and    002000 R   |   5 bit_or     00201E R
  5 bit_rese   00178E R   |   5 bit_set    00177A R   |   5 bit_test   0017B7 R
  5 bit_togg   0017A3 R   |   5 bit_xor    00203C R   |   5 bitmask    002240 R
  5 bkslsh_t   000DE4 R   |   5 bksp       0001E8 R   |   5 break      001B3F R
  5 break_po   001B6D R   |   5 bye        001F33 R   |   5 char       001E95 R
  5 check_fu   00040B R   |   5 clear_ba   000682 R   |   5 clear_va   000515 R
  5 clock_in   0000A4 R   |   5 cmd_itf    000B90 R   |   5 cmd_line   00082A R
  5 cmd_name   001181 R   |   5 cmp_name   001BE1 R   |   5 cold_sta   00057A R
  5 colon_ts   000E0D R   |   5 comma_ts   000E18 R   |   5 compile    00041A R
  5 const_cr   0022DE R   |   5 const_cr   0022E4 R   |   5 const_dd   0022D8 R
  5 const_ee   0022F6 R   |   5 const_id   0022D2 R   |   5 const_in   0022F0 R
  5 const_od   0022CC R   |   5 const_ou   0022EA R   |   5 const_po   002296 R
  5 const_po   00229C R   |   5 const_po   0022A2 R   |   5 const_po   0022A8 R
  5 const_po   0022AE R   |   5 const_po   0022B4 R   |   5 const_po   0022BA R
  5 const_po   0022C0 R   |   5 const_po   0022C6 R   |   5 convert_   000CC5 R
  1 count      000003 R   |   5 cp_loop    0011C4 R   |   5 create_g   00036A R
  5 cstk_pro   00109F R   |   5 dash_tst   000E2E R   |   5 data       0022FC R
  1 data_len   000009 R   |   5 data_lin   002302 R   |   1 data_ofs   000008 R
  1 data_ptr   000006 R   |   5 data_sea   002342 R   |   5 ddrop      001045 R
  5 ddrop_n    001062 R   |   5 ddup       00104E R   |   5 dec_base   0013C5 R
  5 del_back   000B5D R   |   5 del_line   000332 R   |   5 del_ln     000B4E R
  5 delete     0001F8 R   |   5 digital_   001ACE R   |   5 digital_   001B00 R
  5 dir_loop   001DD4 R   |   5 director   001DC8 R   |   5 divide     00112C R
  5 divu24_8   000ABB R   |   5 do_loop    00226D R   |   5 dotr       0010A9 R
  5 dotr_loo   0010BE R   |   5 dots       001075 R   |   5 dpick      00104E R
  5 dpop       00101E R   |   5 dpush      001011 R   |   5 drive_fr   001E51 R
  3 dstack     001760 R   |   3 dstack_e   001780 R   |   5 dstk_pro   00106B R
  1 dstkptr    00001C R   |   5 dswap      00102B R   |   5 enable_i   0021E6 R
  5 eql_tst    000E99 R   |   5 equal      00164D R   |   5 err_bad_   000761 R
  5 err_cmd_   000722 R   |   5 err_div0   0006E4 R   |   5 err_dupl   00073D R
  5 err_math   0006CA R   |   5 err_mem_   0006AD R   |   5 err_msg    000693 R
  5 err_no_a   00076E R   |   5 err_no_d   0007A2 R   |   5 err_no_l   0006F4 R
  5 err_not_   00074F R   |   5 err_run_   00070B R   |   5 err_synt   0006BB R
  5 escaped    000CDA R   |   5 expect     001208 R   |   5 expr_exi   001356 R
  5 expressi   001315 R   |   5 factor     001270 R   |   1 farptr     000016 R
  5 fcpu       002094 R   |   7 fdrive     010000 R   |   5 fetch      00104E R
  5 fetchc     000C7D R   |   1 ffree      000019 R   |   5 file_cou   001E49 R
  5 final_te   000B28 R   |   5 first_li   001449 R   |   1 flags      000025 R
  5 for        00183C R   |   5 forget     001D7D R   |   1 free_ram   00005C R
  5 func_arg   001239 R   |   5 func_not   0021D7 R   |   5 ge         00164F R
  5 get_arra   001249 R   |   5 get_targ   001930 R   |   5 get_tick   001FE4 R
  5 get_toke   000D7F R   |   5 getc       0001D4 R   |   5 gosub      001961 R
  5 goto       001946 R   |   5 gpio       001EDC R   |   5 gt         00164B R
  5 gt_tst     000EA4 R   |   5 hex_base   0013C0 R   |   5 if         001828 R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

  5 incr_far   001B96 R   |   5 input_ex   001746 R   |   5 input_lo   0016E4 R
  5 input_va   0016E2 R   |   5 insert_l   0003A3 R   |   5 insert_l   000408 R
  5 interp     0007FE R   |   5 interp_l   00083E R   |   5 invalid    000BD5 R
  5 invalid_   000C53 R   |   5 invert     00225C R   |   5 is_alpha   000523 R
  5 is_digit   000F37 R   |   5 itoa       000A74 R   |   5 itoa_loo   000A8C R
  5 jp_to_ta   001954 R   |   5 key        001EC9 R   |   5 kword_di   00273D R
  5 kword_en   0023D4 R   |   5 last_lin   001452 R   |   5 le         001654 R
  5 leading_   002230 R   |   5 ledoff     0008C6 R   |   5 ledon      0008C1 R
  5 ledtoggl   0008CB R   |   5 left_arr   000B2E R   |   5 left_par   0008D4 R
  5 let        0013F6 R   |   5 let02      001400 R   |   5 lines_sk   001457 R
  5 list       00141E R   |   5 list_exi   0014A0 R   |   5 list_sta   00147A R
  5 load       001D42 R   |   5 load_aut   000649 R   |   5 load_fil   001D11 R
  5 log2       002223 R   |   5 logical_   0021CD R   |   5 loop_bac   001909 R
  1 loop_dep   000022 R   |   5 loop_don   00191E R   |   5 lshift     00205A R
  5 lt         001652 R   |   5 lt_tst     000EDD R   |   5 mem_peek   000BF2 R
  5 modulo     001170 R   |   5 move       0002CC R   |   5 move_dow   0002EA R
  5 move_exi   00030B R   |   5 move_loo   0002EF R   |   5 move_up    0002DC R
  5 mul_char   00163C R   |   5 multiply   0010E4 R   |   5 mulu24_8   000FBE R
  5 nbr_tst    000DBA R   |   5 ne         001657 R   |   5 neg_acc2   000AE3 R
  5 new        001B8B R   |   5 next       0018C1 R   |   5 next_tok   00086C R
  5 no_match   0011D6 R   |   5 none       000D7F R   |   5 number     000C83 GR
  5 other      000F15 R   |   3 pad        001738 R   |   5 parse_bi   000D1D R
  5 parse_in   000CE2 R   |   5 parse_ke   000D45 R   |   5 parse_qu   000C8A R
  5 pause      001F88 R   |   5 pause02    001F92 R   |   5 peek       0017F5 R
  5 peek_byt   000C1D R   |   5 pin_mode   0020A0 R   |   5 plus_tst   000E6D R
  5 poke       0017E2 R   |   5 power_ad   001A4B R   |   5 prcnt_ts   000E8E R
  5 print      00165A R   |   5 print_ex   0016B6 R   |   5 print_fa   000C62 R
  5 print_in   000A16 R   |   5 print_re   000923 R   |   5 print_st   000BE5 R
  5 prt_basi   0014F3 R   |   5 prt_cmd_   0014A3 R   |   5 prt_loop   00165E R
  5 prt_peek   00027C R   |   5 prt_quot   0014B7 R   |   5 prt_reg1   000904 R
  5 prt_reg8   0008DF R   |   5 prt_regs   000212 R   |   5 prti24     0009CE R
  1 ptr16      000017 R   |   1 ptr8       000018 R   |   5 putc       0001CB R
  5 puts       0001DE R   |   5 qkey       001ED1 R   |   5 qmark_ts   000E44 R
  5 random     002115 R   |   5 read       00237A R   |   5 read01     00237C R
  5 readln     000B06 R   |   5 readln_l   000B0C R   |   5 readln_q   000B81 R
  5 refresh_   00221E R   |   5 regs_sta   000255 R   |   5 rel_exit   0013AD R
  5 relation   001359 R   |   5 relop_st   00163F R   |   5 rem        001749 R
  5 repl       000B9E R   |   5 repl_exi   000BC6 R   |   5 reprint    000B2E R
  5 reset_co   00165C R   |   5 rest_con   0016D2 R   |   5 restore    00232F R
  5 return     001981 R   |   5 right_ar   000B2E R   |   5 rparnt_t   000E02 R
  5 rshift     002077 R   |   5 run        00199F R   |   5 run_it     0019C7 R
  1 rx_char    000027 R   |   5 save       001C4D R   |   5 save_con   0016C2 R
  5 search_d   0011B3 R   |   5 search_e   001204 R   |   5 search_f   001C02 R
  5 search_l   00030E R   |   5 search_l   000316 R   |   5 search_n   0011B7 R
  1 seedx      000012 R   |   1 seedy      000014 R   |   5 seek_fdr   001BA4 R
  5 select_p   0020E5 R   |   5 set_time   0021B9 R   |   5 sharp_ts   000E23 R
  5 show       0013B0 R   |   5 single_c   001638 R   |   5 size       0013CA R
  5 skip       000FF8 R   |   5 slash_ts   000E83 R   |   5 sleep      001F7D R
  5 software   000534 R   |   5 spaces     000206 R   |   3 stack_fu   001780 R
  3 stack_un   001800 R   |   5 star_tst   000E78 R   |   5 step       001899 R
  5 stop       0019EE R   |   5 store      001058 R   |   5 store_lo   0018AE R
  5 str_matc   0011E5 R   |   5 str_tst    000DA9 R   |   5 strcmp     0002AD R
  5 strcpy     0002BE R   |   5 strlen     0002A0 R   |   5 substrac   0010DE R
  5 syntax_e   0007B8 R   |   1 tab_widt   000026 R   |   5 tb_error   0007BA R
  5 term       0012C8 R   |   5 term01     0012D1 R   |   5 term_exi   001312 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

  5 test_p     000BDD R   |   3 tib        0016E8 R   |   5 tick_tst   000E5B R
  1 ticks      00000E R   |   5 timeout    0021CA R   |   1 timer      000010 R
  5 timer2_i   0000BA R   |   5 timer4_i   0000C7 R   |   5 to         001866 R
  5 to_upper   000F40 GR  |   5 token_ch   000F24 R   |   5 token_ex   000F34 R
  5 tone       0019FD R   |   5 try_next   00236A R   |   1 txtbgn     00001E R
  1 txtend     000020 R   |   5 uart1_in   000190 R   |   5 uart1_se   0001A0 R
  5 ubound     0013D4 R   |   5 uflash     001F0F R   |   5 unget_to   00100B R
  5 unlock_e   0000DC R   |   5 unlock_f   0000EA R   |   5 until      002274 R
  5 user_int   000067 R   |   5 user_spa   002780 R   |   5 usr        001F15 R
  1 vars       000028 R   |   5 wait       00174F R   |   5 warm_ini   00062C R
  5 warm_sta   0007FB R   |   5 words      00217F R   |   5 write      001E5E R
  5 write_bl   00016D R   |   5 write_by   0000F8 R   |   5 write_ee   000134 R
  5 write_ex   000168 R   |   5 write_fl   00011E R   |   5 xpeek      001808 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5C   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    118   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   278E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

