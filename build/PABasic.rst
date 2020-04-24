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
      000002                         57 in.w:  .blkb 1 ; parser position in text line
      000003                         58 in:    .blkb 1 ; low byte of in.w
      000004                         59 in.saved: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000005                         60 count: .blkb 1 ; current BASIC line length and tib text length  
      000007                         61 basicptr:  .blkb 2  ; point to current BASIC line address.
      000008                         62 base:  .blkb 1 ; nemeric base used to print integer 
      000009                         63 acc24: .blkb 1 ; 24 bit accumulator
      00000A                         64 acc16: .blkb 1 ; 16 bit accumulator, middle byte of acc24
      00000B                         65 acc8:  .blkb 1 ;  8 bit accumulator, least byte of acc24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      00000D                         66 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      00000F                         67 timer: .blkw 1 ;  milliseconds count down timer 
      000011                         68 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000013                         69 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000014                         70 farptr: .blkb 1 ; 24 bits pointer used by file system
      000015                         71 ptr16:  .blkb 1 ; 16 bits pointer ,  middle byte of farptr
      000016                         72 ptr8:   .blkb 1 ; 8 bits pointer, least byte of farptr 
      000019                         73 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001B                         74 dstkptr: .blkw 1  ; data stack pointer 
      00001D                         75 txtbgn: .blkw 1 ; tokenized BASIC text beginning address 
      00001F                         76 txtend: .blkw 1 ; tokenized BASIC text end address 
      000020                         77 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000022                         78 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000023                         79 flags: .blkb 1 ; various boolean flags
      000024                         80 tab_width: .blkb 1 ; print colon width (4)
      000025                         81 rx_char: .blkb 1 ; last received character 
      000059                         82 vars: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     83 ; keep as last variable 
      0016E8                         84 free_ram: ; from here RAM free for BASIC text 
                                     85 
                                     86 ;-----------------------------------
                                     87     .area SSEG (ABS)
                                     88 ;-----------------------------------
                                     89 ;;;; working buffers and stacks at end of RAM. 	
      0016E8                         90     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE-DSTACK_SIZE 
      001738                         91 tib: .ds TIB_SIZE             ; transaction input buffer
      001760                         92 pad: .ds PAD_SIZE             ; working buffer
      001780                         93 dstack: .ds DSTACK_SIZE 	  ; data stack used by FOR...NEXT, and func/proc arguments  
      001780                         94 dstack_empty: ; dstack underflow ; data stack bottom 
      001800                         95 stack_full: .ds STACK_SIZE   ; control stack 
      001800                         96 stack_unf: ; stack underflow ; control_stack bottom 
                                     97 
                                     98 ;--------------------------------------
                                     99     .area HOME 
                                    100 ;--------------------------------------
      008000 82 00 85 FA            101     int cold_start			; RESET vector 
                           000001   102 .if DEBUG
      008004 82 00 80 AF            103 	int TrapHandler 		;TRAP  software interrupt
                           000000   104 .else
                                    105 	int NonHandledInterrupt ;TRAP  software interrupt
                                    106 .endif
      008008 82 00 80 89            107 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 8A            108 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 89            109 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 89            110 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 89            111 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 89            112 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 89            113 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 D4            114 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 89            115 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 89            116 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 89            117 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 89            118 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 89            119 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 89            120 	int NonHandledInterrupt ;int13 TIM2 update /overflow
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008040 82 00 80 89            121 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 89            122 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 89            123 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 89            124 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 98            125 	int Uart1RxHandler		;int18 UART1 RX full ; user communication channel.
      008054 82 00 80 89            126 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 89            127 	int NonHandledInterrupt ;int20 UART1 TX completed
      00805C 82 00 80 89            128 	int NonHandledInterrupt ;int21 UART1 RX full
      008060 82 00 80 89            129 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 BE            130 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 89            131 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 89            132 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 89            133 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 89            134 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 89            135 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 89            136 	int NonHandledInterrupt ;int29  not used
                                    137 
                                    138 ;---------------------------------------
                                    139     .area CODE
                                    140 ;---------------------------------------
                           000001   141 .if DEBUG
      008080 53 54 4D 38 5F 54 42   142 .asciz "STM8_TBI" ; I like to put module name here.
             49 00
                                    143 .endif 
                                    144 
                                    145 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    146 ; non handled interrupt 
                                    147 ; reset MCU
                                    148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008089                        149 NonHandledInterrupt:
      008089 71                     150     .byte 0x71  ; invalid opcode reinitialize MCU
                                    151 
                                    152 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    153 ; auto wakeup from halt
                                    154 ; at iret, program continue 
                                    155 ; after hatl instruction
                                    156 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00808A                        157 AWUHandler:
      00808A 72 19 50 F0      [ 1]  158 	bres AWU_CSR,#AWU_CSR_AWUEN
      00808E 55 00 3F 50 F1   [ 1]  159 	mov AWU_APR,0x3F
      008093 72 5F 50 F2      [ 1]  160 	clr AWU_TBR 
      008097 80               [11]  161 	iret
                                    162 
                                    163 ;--------------------------
                                    164 ; UART1 receive character
                                    165 ; CTRL-C (ASCII 3)
                                    166 ; cancel program execution
                                    167 ; and fall back to command line
                                    168 ;--------------------------
      008098                        169 Uart1RxHandler:
      008098 72 0B 52 30 FB   [ 2]  170 	btjf UART1_SR,#UART_SR_RXNE,.
      00809D C6 52 31         [ 1]  171 	ld a,UART1_DR 
      0080A0 A1 03            [ 1]  172 	cp a,#CTRL_C 
      0080A2 26 07            [ 1]  173 	jrne 1$
      0080A4 72 5F 00 24      [ 1]  174 	clr rx_char 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      0080A8 CC 80 E7         [ 2]  175 	jp user_interrupted
      0080AB                        176 1$:
      0080AB C7 00 24         [ 1]  177 	ld rx_char,a 	
      0080AE 80               [11]  178 	iret 
                                    179 
                                    180 ;------------------------------------
                                    181 ; software interrupt handler  
                                    182 ;------------------------------------
                           000001   183 .if DEBUG 
      0080AF                        184 TrapHandler:
      0080AF 72 12 00 22      [ 1]  185 	bset flags,#FTRAP 
      0080B3 CD 89 74         [ 4]  186 	call print_registers
      0080B6 CD 8B DF         [ 4]  187 	call cmd_itf
      0080B9 72 13 00 22      [ 1]  188 	bres flags,#FTRAP 	
      0080BD 80               [11]  189 	iret
                                    190 .endif 
                                    191 
                                    192 ;------------------------------
                                    193 ; TIMER 4 is used to maintain 
                                    194 ; a milliseconds 'ticks' counter
                                    195 ; and decrement 'timer' varaiable
                                    196 ;--------------------------------
      0080BE                        197 Timer4UpdateHandler:
      0080BE 72 5F 53 42      [ 1]  198 	clr TIM4_SR 
      0080C2 CE 00 0B         [ 2]  199 	ldw x,ticks
      0080C5 5C               [ 2]  200 	incw x
      0080C6 CF 00 0B         [ 2]  201 	ldw ticks,x 
      0080C9 CE 00 0D         [ 2]  202 	ldw x,timer
      0080CC 5D               [ 2]  203 	tnzw x 
      0080CD 27 04            [ 1]  204 	jreq 1$
      0080CF 5A               [ 2]  205 	decw x 
      0080D0 CF 00 0D         [ 2]  206 	ldw timer,x 
      0080D3                        207 1$:	
      0080D3 80               [11]  208 	iret 
                                    209 
                                    210 
                                    211 ;------------------------------------
                                    212 ; Triggered by pressing USER UserButton 
                                    213 ; on NUCLEO card.
                                    214 ; This is used to abort a progam lock 
                                    215 ; in infinite loop. 
                                    216 ;------------------------------------
      0080D4                        217 UserButtonHandler:
                                    218 ; wait button release
      0080D4 5F               [ 1]  219 	clrw x
      0080D5 5A               [ 2]  220 1$: decw x 
      0080D6 26 FD            [ 1]  221 	jrne 1$
      0080D8 72 09 50 15 F8   [ 2]  222 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    223 ; if MCU suspended by SLEEP resume program
      0080DD 72 07 00 22 05   [ 2]  224     btjf flags,#FSLEEP,2$
      0080E2 72 17 00 22      [ 1]  225 	bres flags,#FSLEEP 
      0080E6 80               [11]  226 	iret
      0080E7                        227 2$:	
      0080E7                        228 user_interrupted:
      0080E7 72 00 00 22 02   [ 2]  229     btjt flags,#FRUN,4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080EC 20 13            [ 2]  230 	jra UBTN_Handler_exit 
      0080EE                        231 4$:	; program interrupted by user 
      0080EE 72 11 00 22      [ 1]  232 	bres flags,#FRUN 
      0080F2 AE 81 09         [ 2]  233 	ldw x,#USER_ABORT
      0080F5 CD 82 5E         [ 4]  234 	call puts 
      0080F8 CE 00 05         [ 2]  235 	ldw x,basicptr 
      0080FB C6 00 02         [ 1]  236 	ld a,in 
      0080FE CD 95 42         [ 4]  237 	call prt_basic_line
      008101                        238 UBTN_Handler_exit:
      008101 AE 17 FF         [ 2]  239     ldw x,#STACK_EMPTY 
      008104 94               [ 1]  240     ldw sp,x
      008105 9A               [ 1]  241 	rim 
      008106 CC 88 4C         [ 2]  242 	jp warm_start
                                    243 
      008109 0A 50 72 6F 67 72 61   244 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    245 
                                    246 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    247 ;    peripherals initialization
                                    248 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    249 
                                    250 ;----------------------------------------
                                    251 ; inialize MCU clock 
                                    252 ; input:
                                    253 ;   A 		source  HSI | 1 HSE 
                                    254 ;   XL      CLK_CKDIVR , clock divisor 
                                    255 ; output:
                                    256 ;   none 
                                    257 ;----------------------------------------
      008124                        258 clock_init:	
      008124 C1 50 C3         [ 1]  259 	cp a,CLK_CMSR 
      008127 27 0C            [ 1]  260 	jreq 2$ ; no switching required 
                                    261 ; select clock source 
      008129 72 12 50 C5      [ 1]  262 	bset CLK_SWCR,#CLK_SWCR_SWEN
      00812D C7 50 C4         [ 1]  263 	ld CLK_SWR,a
      008130 C1 50 C3         [ 1]  264 1$:	cp a,CLK_CMSR
      008133 26 FB            [ 1]  265 	jrne 1$
      008135                        266 2$: 	
                                    267 ; HSI and cpu clock divisor 
      008135 9F               [ 1]  268 	ld a,xl 
      008136 C7 50 C6         [ 1]  269 	ld CLK_CKDIVR,a  
      008139 81               [ 4]  270 	ret
                                    271 
                                    272 ;----------------------------------
                                    273 ; TIMER2 used as audio tone output 
                                    274 ; on port D:5.
                                    275 ; channel 1 configured as PWM mode 1 
                                    276 ;-----------------------------------  
                           00F424   277 TIM2_CLK_FREQ=62500
      00813A                        278 timer2_init:
      00813A 72 1A 50 C7      [ 1]  279 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      00813E 35 60 53 05      [ 1]  280  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008142 35 08 53 0C      [ 1]  281 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      008146 81               [ 4]  282 	ret 
                                    283 
                                    284 ;---------------------------------
                                    285 ; TIM4 is configured to generate an 
                                    286 ; interrupt every millisecond 
                                    287 ;----------------------------------
      008147                        288 timer4_init:
      008147 72 18 50 C7      [ 1]  289 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00814B 35 07 53 45      [ 1]  290 	mov TIM4_PSCR,#7 ; prescale 128  
      00814F 35 7D 53 46      [ 1]  291 	mov TIM4_ARR,#125 ; set for 1msec.
      008153 35 05 53 40      [ 1]  292 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008157 72 10 53 41      [ 1]  293 	bset TIM4_IER,#TIM4_IER_UIE 
      00815B 81               [ 4]  294 	ret
                                    295 
                                    296 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    297 ;  routines to write to FLASH, EEPROM 
                                    298 ;  and OPTION 
                                    299 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    300 
                                    301 ;----------------------------------
                                    302 ; unlock EEPROM/OPT for writing/erasing
                                    303 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    304 ; input:
                                    305 ;  none
                                    306 ; output:
                                    307 ;  none 
                                    308 ;----------------------------------
      00815C                        309 unlock_eeprom:
      00815C 35 AE 50 64      [ 1]  310 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008160 35 56 50 64      [ 1]  311     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008164 72 07 50 5F FB   [ 2]  312 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008169 81               [ 4]  313 	ret
                                    314 
                                    315 ;----------------------------------
                                    316 ; unlock FLASH for writing/erasing
                                    317 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    318 ; input:
                                    319 ;  none
                                    320 ; output:
                                    321 ;  none
                                    322 ;----------------------------------
      00816A                        323 unlock_flash:
      00816A 35 56 50 62      [ 1]  324 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00816E 35 AE 50 62      [ 1]  325 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008172 72 03 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008177 81               [ 4]  327 	ret
                                    328 
                           000000   329 USE_BLOCK_ERASE=0 
                           000000   330 .if USE_BLOCK_ERASE 
                                    331 ; this code is copied to RAM 
                                    332 
                                    333 ;----------------------------
                                    334 ; erase block code must be 
                                    335 ; executed from RAM
                                    336 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    337 erase_start:
                                    338 	clr a 
                                    339     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    340     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    341 	ldf [farptr],a
                                    342     inc farptr+2 
                                    343     ldf [farptr],a
                                    344     inc farptr+2 
                                    345     ldf [farptr],a
                                    346     inc farptr+2 
                                    347     ldf [farptr],a
                                    348 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    349 	ret
                                    350 erase_end:
                                    351 
                                    352 ; copy erase_start in RAM 
                                    353 move_code_in_ram:
                                    354 	ldw x,#erase_end 
                                    355 	subw x,#erase_start
                                    356 	ldw acc16,x 
                                    357 	ldw x,#pad 
                                    358 	ldw y,#erase_start 
                                    359 	call move 
                                    360 	ret 
                                    361 
                                    362 ;-----------------------------------
                                    363 ; erase flash or EEPROM block 
                                    364 ; a block is 128 bytes 
                                    365 ; input:
                                    366 ;   farptr  address block begin
                                    367 ; output:
                                    368 ;   none
                                    369 ;--------------------------------------
                                    370 erase_block:
                                    371 	ldw x,farptr+1 
                                    372 	pushw x 
                                    373 	call move_code_in_ram 
                                    374 	popw x 
                                    375 	ldw farptr+1,x 
                                    376 	tnz farptr
                                    377 	jrne erase_flash 
                                    378 	ldw x,#FLASH_BASE 
                                    379 	cpw x,farptr+1 
                                    380 	jrpl erase_flash 
                                    381 ; erase eeprom block
                                    382 	call unlock_eeprom 
                                    383 	sim 
                                    384 	call pad   
                                    385 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    386 	rim 
                                    387 	ret 
                                    388 ; erase flash block:
                                    389 erase_flash:
                                    390 	call unlock_flash 
                                    391 	bset FLASH_CR2,#FLASH_CR2_ERASE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    392 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    393 	clr a 
                                    394 	sim 
                                    395 	call pad 
                                    396     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    397 	rim 
                                    398 	ret 
                                    399 .endif ;;;; USE_BLOCK_ERASE ;;;;
                                    400 
                                    401 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    402 ; write a byte to FLASH or EEPROM/OPTION  
                                    403 ; input:
                                    404 ;    a  		byte to write
                                    405 ;    farptr  	address
                                    406 ;    x          farptr[x]
                                    407 ; output:
                                    408 ;    none
                                    409 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    410 	; variables locales
                           000001   411 	BTW = 1   ; byte to write offset on stack
                           000002   412 	OPT = 2   ; OPTION flag offset on stack
                           000002   413 	VSIZE = 2
      008178                        414 write_byte:
      008178 90 89            [ 2]  415 	pushw y
      0000FA                        416 	_vars VSIZE
      00817A 52 02            [ 2]    1     sub sp,#VSIZE 
      00817C 6B 01            [ 1]  417 	ld (BTW,sp),a ; byte to write 
      00817E 0F 02            [ 1]  418 	clr (OPT,sp)  ; OPTION flag
                                    419 ; put addr[15:0] in Y, for bounds check.
      008180 90 CE 00 14      [ 2]  420 	ldw y,farptr+1   ; Y=addr15:0
                                    421 ; check addr[23:16], if <> 0 then it is extened flash memory
      008184 72 5D 00 13      [ 1]  422 	tnz farptr 
      008188 26 14            [ 1]  423 	jrne write_flash
      00818A 90 A3 A7 00      [ 2]  424     cpw y,#user_space
      00818E 24 0E            [ 1]  425     jruge write_flash
      008190 90 A3 40 00      [ 2]  426 	cpw y,#EEPROM_BASE  
      008194 25 52            [ 1]  427     jrult write_exit
      008196 90 A3 48 7F      [ 2]  428 	cpw y,#OPTION_END 
      00819A 22 4C            [ 1]  429 	jrugt write_exit
      00819C 20 16            [ 2]  430 	jra write_eeprom 
                                    431 ; write program memory
      00819E                        432 write_flash:
      00819E CD 81 6A         [ 4]  433 	call unlock_flash 
      0081A1 9B               [ 1]  434 1$:	sim 
      0081A2 7B 01            [ 1]  435 	ld a,(BTW,sp)
      0081A4 92 A7 00 13      [ 4]  436 	ldf ([farptr],x),a ; farptr[x]=A
      0081A8 72 05 50 5F FB   [ 2]  437 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081AD 9A               [ 1]  438     rim 
      0081AE 72 13 50 5F      [ 1]  439     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0081B2 20 34            [ 2]  440     jra write_exit
                                    441 ; write eeprom and option
      0081B4                        442 write_eeprom:
      0081B4 CD 81 5C         [ 4]  443 	call unlock_eeprom
                                    444 	; check for data eeprom or option eeprom
      0081B7 90 A3 48 00      [ 2]  445 	cpw y,#OPTION_BASE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0081BB 2B 08            [ 1]  446 	jrmi 1$
      0081BD 90 A3 48 80      [ 2]  447 	cpw y,#OPTION_END+1
      0081C1 2A 02            [ 1]  448 	jrpl 1$
      0081C3 03 02            [ 1]  449 	cpl (OPT,sp)
      0081C5                        450 1$: 
      0081C5 0D 02            [ 1]  451     tnz (OPT,sp)
      0081C7 27 08            [ 1]  452     jreq 2$
                                    453 	; pour modifier une option il faut modifier ces 2 bits
      0081C9 72 1E 50 5B      [ 1]  454     bset FLASH_CR2,#FLASH_CR2_OPT
      0081CD 72 1F 50 5C      [ 1]  455     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081D1                        456 2$: 
      0081D1 7B 01            [ 1]  457     ld a,(BTW,sp)
      0081D3 92 A7 00 13      [ 4]  458     ldf ([farptr],x),a
      0081D7 0D 02            [ 1]  459     tnz (OPT,sp)
      0081D9 27 08            [ 1]  460     jreq 3$
      0081DB 5C               [ 2]  461     incw x
      0081DC 7B 01            [ 1]  462     ld a,(BTW,sp)
      0081DE 43               [ 1]  463     cpl a
      0081DF 92 A7 00 13      [ 4]  464     ldf ([farptr],x),a
      0081E3 72 05 50 5F FB   [ 2]  465 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081E8                        466 write_exit:
      000168                        467 	_drop VSIZE 
      0081E8 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081EA 90 85            [ 2]  468 	popw y
      0081EC 81               [ 4]  469     ret
                                    470 
                                    471 ;--------------------------------------------
                                    472 ; write a data block to eeprom or flash 
                                    473 ; input:
                                    474 ;   Y        source address   
                                    475 ;   X        array index  destination  farptr[x]
                                    476 ;   BSIZE    block size bytes 
                                    477 ;   farptr   write address , byte* 
                                    478 ; output:
                                    479 ;	X 		after last byte written 
                                    480 ;   Y 		after last byte read 
                                    481 ;  farptr   point after block
                                    482 ;---------------------------------------------
      0081ED                        483 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      00016D                        484 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    485 	; local var 
                           000001   486 	XSAVE=1 
                           000002   487 	VSIZE=2 
      00016D                        488 write_block:
      00016D                        489 	_vars VSIZE
      0081ED 52 02            [ 2]    1     sub sp,#VSIZE 
      0081EF 1F 01            [ 2]  490 	ldw (XSAVE,sp),x 
      0081F1 1E 05            [ 2]  491 	ldw x,(BSIZE,sp) 
      0081F3 27 13            [ 1]  492 	jreq 9$
      0081F5 1E 01            [ 2]  493 1$:	ldw x,(XSAVE,sp)
      0081F7 90 F6            [ 1]  494 	ld a,(y)
      0081F9 CD 81 78         [ 4]  495 	call write_byte 
      0081FC 5C               [ 2]  496 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081FD 90 5C            [ 2]  497 	incw y 
      0081FF 1F 01            [ 2]  498 	ldw (XSAVE,sp),x
      008201 1E 05            [ 2]  499 	ldw x,(BSIZE,sp)
      008203 5A               [ 2]  500 	decw x
      008204 1F 05            [ 2]  501 	ldw (BSIZE,sp),x 
      008206 26 ED            [ 1]  502 	jrne 1$
      008208                        503 9$:
      008208 1E 01            [ 2]  504 	ldw x,(XSAVE,sp)
      00820A CD 9B EB         [ 4]  505 	call incr_farptr
      00018D                        506 	_drop VSIZE
      00820D 5B 02            [ 2]    1     addw sp,#VSIZE 
      00820F 81               [ 4]  507 	ret 
                                    508 
                                    509 
                                    510 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    511 ;;   UART1 subroutines
                                    512 ;;   used for user interface 
                                    513 ;;   communication channel.
                                    514 ;;   settings: 
                                    515 ;;		115200 8N1 no flow control
                                    516 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    517 
                                    518 ;---------------------------------------------
                                    519 ; initialize UART1, 115200 8N1
                                    520 ; input:
                                    521 ;	none
                                    522 ; output:
                                    523 ;   none
                                    524 ;---------------------------------------------
      008210                        525 uart1_init:
      008210 72 1A 50 02      [ 1]  526     bset PA_DDR,#UART1_TX_PIN
      008214 72 1A 50 03      [ 1]  527     bset PA_CR1,#UART1_TX_PIN 
      008218 72 1A 50 04      [ 1]  528     bset PA_CR2,#UART1_TX_PIN 
                                    529 ; enable UART1 clock
      00821C 72 14 50 C7      [ 1]  530 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008220                        531 uart1_set_baud: 
                                    532 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    533 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008220 A6 E1            [ 1]  534 	ld a,#CLK_SWR_HSI
      008222 C1 50 C3         [ 1]  535 	cp a,CLK_CMSR 
      008225 27 0A            [ 1]  536 	jreq 2$ 
      008227                        537 1$: ; 8 Mhz 	
      008227 35 05 52 33      [ 1]  538 	mov UART1_BRR2,#0x05 ; must be loaded first
      00822B 35 04 52 32      [ 1]  539 	mov UART1_BRR1,#0x4
      00822F 20 08            [ 2]  540 	jra 3$
      008231                        541 2$: ; 16 Mhz 	
      008231 35 0B 52 33      [ 1]  542 	mov UART1_BRR2,#0x0b ; must be loaded first
      008235 35 08 52 32      [ 1]  543 	mov UART1_BRR1,#0x08
      008239                        544 3$:
      008239 72 5F 52 31      [ 1]  545     clr UART1_DR
      00823D 35 2C 52 35      [ 1]  546 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008241 72 10 52 35      [ 1]  547 	bset UART1_CR2,#UART_CR2_SBK
      008245 72 0D 52 30 FB   [ 2]  548     btjf UART1_SR,#UART_SR_TC,.
      00824A 81               [ 4]  549     ret
                                    550 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    551 ;---------------------------------
                                    552 ; send character to UART1 
                                    553 ; input:
                                    554 ;   A 
                                    555 ; output:
                                    556 ;   none 
                                    557 ;--------------------------------	
      00824B                        558 putc:
      00824B 72 0F 52 30 FB   [ 2]  559 	btjf UART1_SR,#UART_SR_TXE,.
      008250 C7 52 31         [ 1]  560 	ld UART1_DR,a 
      008253 81               [ 4]  561 	ret 
                                    562 
                                    563 ;---------------------------------
                                    564 ; wait character from UART1 
                                    565 ; input:
                                    566 ;   none
                                    567 ; output:
                                    568 ;   A 			char  
                                    569 ;--------------------------------	
      008254                        570 getc:
      008254 C6 00 24         [ 1]  571 	ld a,rx_char 
      008257 27 FB            [ 1]  572 	jreq getc 
      008259 72 5F 00 24      [ 1]  573 	clr rx_char 
      00825D 81               [ 4]  574 	ret 
                                    575 
                                    576 ;-----------------------------
                                    577 ; send an ASCIZ string to UART1 
                                    578 ; input: 
                                    579 ;   x 		char * 
                                    580 ; output:
                                    581 ;   none 
                                    582 ;-------------------------------
      00825E                        583 puts:
      00825E F6               [ 1]  584     ld a,(x)
      00825F 27 06            [ 1]  585 	jreq 1$
      008261 CD 82 4B         [ 4]  586 	call putc 
      008264 5C               [ 2]  587 	incw x 
      008265 20 F7            [ 2]  588 	jra puts 
      008267 81               [ 4]  589 1$:	ret 
                                    590 
                                    591 
                                    592 ;---------------------------
                                    593 ; delete character at left 
                                    594 ; of cursor on terminal 
                                    595 ; input:
                                    596 ;   none 
                                    597 ; output:
                                    598 ;	none 
                                    599 ;---------------------------
      008268                        600 bksp:
      008268 A6 08            [ 1]  601 	ld a,#BSP 
      00826A CD 82 4B         [ 4]  602 	call putc 
      00826D A6 20            [ 1]  603 	ld a,#SPACE 
      00826F CD 82 4B         [ 4]  604 	call putc 
      008272 A6 08            [ 1]  605 	ld a,#BSP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008274 CD 82 4B         [ 4]  606 	call putc 
      008277 81               [ 4]  607 	ret 
                                    608 ;---------------------------
                                    609 ; delete n character left of cursor 
                                    610 ; at terminal.
                                    611 ; input: 
                                    612 ;   A   number of characters to delete.
                                    613 ; output:
                                    614 ;    none 
                                    615 ;--------------------------	
      008278                        616 delete:
      008278 88               [ 1]  617 	push a 
      008279 0D 01            [ 1]  618 0$:	tnz (1,sp)
      00827B 27 07            [ 1]  619 	jreq 1$
      00827D CD 82 68         [ 4]  620 	call bksp 
      008280 0A 01            [ 1]  621 	dec (1,sp)
      008282 20 F5            [ 2]  622 	jra 0$
      008284 84               [ 1]  623 1$:	pop a 
      008285 81               [ 4]  624 	ret
                                    625 
                                    626 ;--------------------------
                                    627 ; print n spaces on terminal
                                    628 ; input:
                                    629 ;  X 		number of spaces 
                                    630 ; output:
                                    631 ;	none 
                                    632 ;---------------------------
      008286                        633 spaces:
      008286 A6 20            [ 1]  634 	ld a,#SPACE 
      008288 5D               [ 2]  635 1$:	tnzw x
      008289 27 06            [ 1]  636 	jreq 9$
      00828B CD 82 4B         [ 4]  637 	call putc 
      00828E 5A               [ 2]  638 	decw x
      00828F 20 F7            [ 2]  639 	jra 1$
      008291                        640 9$: 
      008291 81               [ 4]  641 	ret 
                                    642 
                           000001   643 .if DEBUG 
                                    644 ;---------------------------------
                                    645 ;; print actual registers states 
                                    646 ;; as pushed on stack 
                                    647 ;; {Y,X,CC,A}
                                    648 ;---------------------------------
      008292                        649 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      000212                        650 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      000212                        651 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      000212                        652 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      000212                        653 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      000212                        654 prt_regs:
      008292 AE 82 D5         [ 2]  655 	ldw x,#regs_state 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008295 CD 82 5E         [ 4]  656 	call puts
                                    657 ; register PC
      008298 16 01            [ 2]  658 	ldw y,(1,sp)
      00829A AE 8A 04         [ 2]  659 	ldw x,#REG_EPC 
      00829D CD 89 55         [ 4]  660 	call prt_reg16 
                                    661 ; register CC 
      0082A0 7B 08            [ 1]  662 	ld a,(R_CC,sp)
      0082A2 AE 8A 15         [ 2]  663 	ldw x,#REG_CC 
      0082A5 CD 89 30         [ 4]  664 	call prt_reg8 
                                    665 ; register A 
      0082A8 7B 07            [ 1]  666 	ld a,(R_A,sp)
      0082AA AE 8A 11         [ 2]  667 	ldw x,#REG_A 
      0082AD CD 89 30         [ 4]  668 	call prt_reg8 
                                    669 ; register X 
      0082B0 16 05            [ 2]  670 	ldw y,(R_X,sp)
      0082B2 AE 8A 0D         [ 2]  671 	ldw x,#REG_X 
      0082B5 CD 89 55         [ 4]  672 	call prt_reg16 
                                    673 ; register Y 
      0082B8 16 03            [ 2]  674 	ldw y,(R_Y,sp)
      0082BA AE 8A 09         [ 2]  675 	ldw x,#REG_Y 
      0082BD CD 89 55         [ 4]  676 	call prt_reg16 
                                    677 ; register SP 
      0082C0 90 96            [ 1]  678 	ldw y,sp
      0082C2 72 A9 00 08      [ 2]  679 	addw y,#6+ARG_OFS  
      0082C6 AE 8A 1A         [ 2]  680 	ldw x,#REG_SP
      0082C9 CD 89 55         [ 4]  681 	call prt_reg16
      0082CC A6 0D            [ 1]  682 	ld a,#CR 
      0082CE CD 82 4B         [ 4]  683 	call putc
      0082D1 CD 82 4B         [ 4]  684 	call putc   
      0082D4 81               [ 4]  685 	ret 
                                    686 
      0082D5 0A 72 65 67 69 73 74   687 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    688 
                                    689 
                                    690 ;--------------------
                                    691 ; print content at address in hex.
                                    692 ; input:
                                    693 ;   X 	address to peek 
                                    694 ; output:
                                    695 ;	none 
                                    696 ;--------------------	
      0082FC                        697 prt_peek:
      0082FC 89               [ 2]  698 	pushw x 
      0082FD CF 00 09         [ 2]  699 	ldw acc16,x 
      008300 72 5F 00 08      [ 1]  700 	clr acc24 
      008304 5F               [ 1]  701 	clrw x 
      008305 A6 10            [ 1]  702 	ld a,#16 
      008307 CD 8A 1F         [ 4]  703 	call prti24 
      00830A A6 3A            [ 1]  704 	ld a,#': 
      00830C CD 82 4B         [ 4]  705 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00830F A6 20            [ 1]  706 	ld a,#SPACE 
      008311 CD 82 4B         [ 4]  707 	call putc 
      008314 85               [ 2]  708 	popw x 
      008315 F6               [ 1]  709 	ld a,(x)
      008316 C7 00 0A         [ 1]  710 	ld acc8,a 
      008319 5F               [ 1]  711 	clrw x 
      00831A A6 10            [ 1]  712 	ld a,#16 
      00831C CD 8A 1F         [ 4]  713 	call prti24
      00831F 81               [ 4]  714 	ret 
                                    715 .endif ; DEBUG  
                                    716 
                                    717 ;-------------------------------------
                                    718 ; retrun string length
                                    719 ; input:
                                    720 ;   X         .asciz  pointer 
                                    721 ; output:
                                    722 ;   X         length 
                                    723 ;-------------------------------------
      008320                        724 strlen:
      008320 90 93            [ 1]  725 	ldw y,x 
      008322 5F               [ 1]  726 	clrw x 
      008323 90 7D            [ 1]  727 1$:	tnz (y) 
      008325 27 05            [ 1]  728 	jreq 9$ 
      008327 5C               [ 2]  729 	incw x
      008328 90 5C            [ 2]  730 	incw y 
      00832A 20 F7            [ 2]  731 	jra 1$ 
      00832C 81               [ 4]  732 9$: ret 
                                    733 
                                    734 ;------------------------------------
                                    735 ; compare 2 strings
                                    736 ; input:
                                    737 ;   X 		char* first string 
                                    738 ;   Y       char* second string 
                                    739 ; output:
                                    740 ;   A 		0|1 
                                    741 ;-------------------------------------
      00832D                        742 strcmp:
      00832D F6               [ 1]  743 	ld a,(x)
      00832E 27 0B            [ 1]  744 	jreq 5$ 
      008330 90 F1            [ 1]  745 	cp a,(y) 
      008332 26 05            [ 1]  746 	jrne 4$ 
      008334 5C               [ 2]  747 	incw x 
      008335 90 5C            [ 2]  748 	incw y 
      008337 20 F4            [ 2]  749 	jra strcmp 
      008339                        750 4$: ; not same  
      008339 4F               [ 1]  751 	clr a 
      00833A 81               [ 4]  752 	ret 
      00833B                        753 5$: ; same 
      00833B A6 01            [ 1]  754 	ld a,#1 
      00833D 81               [ 4]  755 	ret 
                                    756 
                                    757 
                                    758 ;---------------------------------------
                                    759 ;  copy src to dest 
                                    760 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                                    761 ;   X 		dest 
                                    762 ;   Y 		src 
                                    763 ; output: 
                                    764 ;   X 		dest 
                                    765 ;----------------------------------
      00833E                        766 strcpy:
      00833E 89               [ 2]  767 	pushw x 
      00833F 90 F6            [ 1]  768 1$: ld a,(y)
      008341 27 06            [ 1]  769 	jreq 9$ 
      008343 F7               [ 1]  770 	ld (x),a 
      008344 5C               [ 2]  771 	incw x 
      008345 90 5C            [ 2]  772 	incw y 
      008347 20 F6            [ 2]  773 	jra 1$ 
      008349 7F               [ 1]  774 9$:	clr (x)
      00834A 85               [ 2]  775 	popw x 
      00834B 81               [ 4]  776 	ret 
                                    777 
                                    778 ;---------------------------------------
                                    779 ; move memory block 
                                    780 ; input:
                                    781 ;   X 		destination 
                                    782 ;   Y 	    source 
                                    783 ;   acc16	bytes count 
                                    784 ; output:
                                    785 ;   none 
                                    786 ;--------------------------------------
                           000001   787 	INCR=1 ; increament high byte 
                           000002   788 	LB=2 ; increament low byte 
                           000002   789 	VSIZE=2
      00834C                        790 move:
      0002CC                        791 	_vars VSIZE 
      00834C 52 02            [ 2]    1     sub sp,#VSIZE 
      00834E 0F 01            [ 1]  792 	clr (INCR,sp)
      008350 0F 02            [ 1]  793 	clr (LB,sp)
      008352 90 89            [ 2]  794 	pushw y 
      008354 13 01            [ 2]  795 	cpw x,(1,sp) ; compare DEST to SRC 
      008356 90 85            [ 2]  796 	popw y 
      008358 27 31            [ 1]  797 	jreq move_exit ; x==y 
      00835A 2B 0E            [ 1]  798 	jrmi move_down
      00835C                        799 move_up: ; start from top address with incr=-1
      00835C 72 BB 00 09      [ 2]  800 	addw x,acc16
      008360 72 B9 00 09      [ 2]  801 	addw y,acc16
      008364 03 01            [ 1]  802 	cpl (INCR,sp)
      008366 03 02            [ 1]  803 	cpl (LB,sp)   ; increment = -1 
      008368 20 05            [ 2]  804 	jra move_loop  
      00836A                        805 move_down: ; start from bottom address with incr=1 
      00836A 5A               [ 2]  806     decw x 
      00836B 90 5A            [ 2]  807 	decw y
      00836D 0C 02            [ 1]  808 	inc (LB,sp) ; incr=1 
      00836F                        809 move_loop:	
      00836F C6 00 09         [ 1]  810     ld a, acc16 
      008372 CA 00 0A         [ 1]  811 	or a, acc8
      008375 27 14            [ 1]  812 	jreq move_exit 
      008377 72 FB 01         [ 2]  813 	addw x,(INCR,sp)
      00837A 72 F9 01         [ 2]  814 	addw y,(INCR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00837D 90 F6            [ 1]  815 	ld a,(y)
      00837F F7               [ 1]  816 	ld (x),a 
      008380 89               [ 2]  817 	pushw x 
      008381 CE 00 09         [ 2]  818 	ldw x,acc16 
      008384 5A               [ 2]  819 	decw x 
      008385 CF 00 09         [ 2]  820 	ldw acc16,x 
      008388 85               [ 2]  821 	popw x 
      008389 20 E4            [ 2]  822 	jra move_loop
      00838B                        823 move_exit:
      00030B                        824 	_drop VSIZE
      00838B 5B 02            [ 2]    1     addw sp,#VSIZE 
      00838D 81               [ 4]  825 	ret 	
                                    826 
                                    827 ;-------------------------------------
                                    828 ; search text area for a line with 
                                    829 ; same number as line#  
                                    830 ; input:
                                    831 ;	X 			line# 
                                    832 ; output:
                                    833 ;   X 			addr of line | 0 
                                    834 ;   Y           line#|insert address if not found  
                                    835 ;-------------------------------------
                           000001   836 	LL=1 ; line length 
                           000002   837 	LB=2 ; line length low byte 
                           000002   838 	VSIZE=2 
      00838E                        839 search_lineno:
      00030E                        840 	_vars VSIZE
      00838E 52 02            [ 2]    1     sub sp,#VSIZE 
      008390 0F 01            [ 1]  841 	clr (LL,sp)
      008392 90 CE 00 1B      [ 2]  842 	ldw y,txtbgn
      008396                        843 search_ln_loop:
      008396 90 C3 00 1D      [ 2]  844 	cpw y,txtend 
      00839A 2A 10            [ 1]  845 	jrpl 8$
      00839C 90 F3            [ 1]  846 	cpw x,(y)
      00839E 27 0E            [ 1]  847 	jreq 9$
      0083A0 2B 0A            [ 1]  848 	jrmi 8$ 
      0083A2 90 E6 02         [ 1]  849 	ld a,(2,y)
      0083A5 6B 02            [ 1]  850 	ld (LB,sp),a 
      0083A7 72 F9 01         [ 2]  851 	addw y,(LL,sp)
      0083AA 20 EA            [ 2]  852 	jra search_ln_loop 
      0083AC                        853 8$: 
      0083AC 5F               [ 1]  854 	clrw x 	
      0083AD 51               [ 1]  855 	exgw x,y 
      00032E                        856 9$: _drop VSIZE
      0083AE 5B 02            [ 2]    1     addw sp,#VSIZE 
      0083B0 51               [ 1]  857 	exgw x,y   
      0083B1 81               [ 4]  858 	ret 
                                    859 
                                    860 ;-------------------------------------
                                    861 ; delete line at addr
                                    862 ; move new line to insert with end of text 
                                    863 ; otherwise it would be overwritten.
                                    864 ; input:
                                    865 ;   X 		addr of line i.e DEST for move 
                                    866 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                           000001   867 	LLEN=1
                           000003   868 	SRC=3
                           000004   869 	VSIZE=4
      0083B2                        870 del_line: 
      000332                        871 	_vars VSIZE 
      0083B2 52 04            [ 2]    1     sub sp,#VSIZE 
      0083B4 E6 02            [ 1]  872 	ld a,(2,x) ; line length
      0083B6 6B 02            [ 1]  873 	ld (LLEN+1,sp),a 
      0083B8 0F 01            [ 1]  874 	clr (LLEN,sp)
      0083BA 90 93            [ 1]  875 	ldw y,x  
      0083BC 72 F9 01         [ 2]  876 	addw y,(LLEN,sp) ;SRC  
      0083BF 17 03            [ 2]  877 	ldw (SRC,sp),y  ;save source 
      0083C1 90 CE 00 1D      [ 2]  878 	ldw y,txtend 
      0083C5 90 E6 02         [ 1]  879 	ld a,(2,y)
      0083C8 90 5F            [ 1]  880 	clrw y 
      0083CA 90 97            [ 1]  881 	ld yl,a  
      0083CC 72 B9 00 1D      [ 2]  882 	addw y,txtend
      0083D0 72 F2 03         [ 2]  883 	subw y,(SRC,sp) ; y=count 
      0083D3 90 CF 00 09      [ 2]  884 	ldw acc16,y 
      0083D7 16 03            [ 2]  885 	ldw y,(SRC,sp)    ; source
      0083D9 CD 83 4C         [ 4]  886 	call move
      0083DC 90 CE 00 1D      [ 2]  887 	ldw y,txtend 
      0083E0 72 F2 01         [ 2]  888 	subw y,(LLEN,sp)
      0083E3 90 CF 00 1D      [ 2]  889 	ldw txtend,y  
      000367                        890 	_drop VSIZE     
      0083E7 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083E9 81               [ 4]  891 	ret 
                                    892 
                                    893 ;---------------------------------------------
                                    894 ; create a gap in text area 
                                    895 ; move new line to insert in gap with end of text
                                    896 ; otherwise it would be overwritten.
                                    897 ; input:
                                    898 ;    X 			addr gap start 
                                    899 ;    Y 			gap length 
                                    900 ; output:
                                    901 ;    X 			addr gap start 
                                    902 ;--------------------------------------------
                           000001   903 	DEST=1
                           000003   904 	SRC=3
                           000005   905 	LEN=5
                           000006   906 	VSIZE=6 
      0083EA                        907 create_gap:
      00036A                        908 	_vars VSIZE
      0083EA 52 06            [ 2]    1     sub sp,#VSIZE 
      0083EC 1F 03            [ 2]  909 	ldw (SRC,sp),x 
      0083EE 17 05            [ 2]  910 	ldw (LEN,sp),y 
      0083F0 90 CF 00 09      [ 2]  911 	ldw acc16,y 
      0083F4 90 93            [ 1]  912 	ldw y,x ; SRC
      0083F6 72 BB 00 09      [ 2]  913 	addw x,acc16  
      0083FA 1F 01            [ 2]  914 	ldw (DEST,sp),x 
                                    915 ;compute size to move 	
      0083FC CE 00 1D         [ 2]  916 	ldw x,txtend 
      0083FF E6 02            [ 1]  917 	ld a,(2,x) ; pending line length 
      008401 C7 00 0A         [ 1]  918 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008404 72 5F 00 09      [ 1]  919 	clr acc16 
      008408 72 BB 00 09      [ 2]  920 	addw x,acc16 
      00840C 72 F0 03         [ 2]  921 	subw x,(SRC,sp)
      00840F CF 00 09         [ 2]  922 	ldw acc16,x ; size to move
      008412 1E 01            [ 2]  923 	ldw x,(DEST,sp) 
      008414 CD 83 4C         [ 4]  924 	call move
      008417 CE 00 1D         [ 2]  925 	ldw x,txtend
      00841A 72 FB 05         [ 2]  926 	addw x,(LEN,sp)
      00841D CF 00 1D         [ 2]  927 	ldw txtend,x
      0003A0                        928 9$:	_drop VSIZE 
      008420 5B 06            [ 2]    1     addw sp,#VSIZE 
      008422 81               [ 4]  929 	ret 
                                    930 
                                    931 
                                    932 ;--------------------------------------------
                                    933 ; insert line in tib into text area 
                                    934 ; first search for already existing 
                                    935 ; replace existing 
                                    936 ; if strlen(tib)==0 delete existing line
                                    937 ; input:
                                    938 ;   ptr16 				pointer to tokenized line  
                                    939 ; output:
                                    940 ;   none
                                    941 ;---------------------------------------------
                           000001   942 	DEST=1  ; text area insertion address 
                           000003   943 	SRC=3   ; str to insert address 
                           000005   944 	LINENO=5 ; line number 
                           000007   945 	LLEN=7 ; line length 
                           000008   946 	VSIZE=8  
      008423                        947 insert_line:
      0003A3                        948 	_vars VSIZE 
      008423 52 08            [ 2]    1     sub sp,#VSIZE 
      008425 CE 00 14         [ 2]  949 	ldw x,ptr16  
      008428 C3 00 1B         [ 2]  950 	cpw x,txtbgn 
      00842B 26 0D            [ 1]  951 	jrne 0$
                                    952 ;first text line 
      00842D AE 00 02         [ 2]  953 	ldw x,#2 
      008430 72 D6 00 14      [ 4]  954 	ld a,([ptr16],x)
      008434 5F               [ 1]  955 	clrw x 
      008435 97               [ 1]  956 	ld xl,a
      008436 1F 07            [ 2]  957 	ldw (LLEN,sp),x  
      008438 20 45            [ 2]  958 	jra 5$
      00843A 72 CE 00 14      [ 5]  959 0$:	ldw x,[ptr16]
                                    960 ; new line number
      00843E 1F 05            [ 2]  961 	ldw (LINENO,sp),x 
      008440 AE 00 02         [ 2]  962 	ldw x,#2 
      008443 72 D6 00 14      [ 4]  963 	ld a,([ptr16],x)
      008447 97               [ 1]  964 	ld xl,a
                                    965 ; new line length
      008448 1F 07            [ 2]  966 	ldw (LLEN,sp),x
                                    967 ; check if that line number already exit 	
      00844A 1E 05            [ 2]  968 	ldw x,(LINENO,sp)
      00844C CD 83 8E         [ 4]  969 	call search_lineno 
      00844F 5D               [ 2]  970 	tnzw x 
      008450 26 04            [ 1]  971 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    972 ; line doesn't exit
                                    973 ; it will be inserted at this point.  	
      008452 17 01            [ 2]  974 	ldw (DEST,sp),y 
      008454 20 05            [ 2]  975 	jra 3$
                                    976 ; line exit delete it.
                                    977 ; it will be replaced by new one 	
      008456 1F 01            [ 2]  978 2$: ldw (DEST,sp),x 
      008458 CD 83 B2         [ 4]  979 	call del_line
      00845B                        980 3$: 
                                    981 ; insert new line or leave if LLEN==3
                                    982 ; LLEN==3 means empty line 
      00845B A6 03            [ 1]  983 	ld a,#3
      00845D 11 08            [ 1]  984 	cp a,(LLEN+1,sp)
      00845F 27 27            [ 1]  985 	jreq insert_ln_exit ; empty line exit.
                                    986 ; if insertion point at txtend 
                                    987 ; no move required 
      008461 1E 01            [ 2]  988 	ldw x,(DEST,sp)
      008463 C3 00 1D         [ 2]  989 	cpw x,txtend 
      008466 2A 17            [ 1]  990 	jrpl 5$ 
                                    991 ; must create a gap
                                    992 ; at insertion point  
      008468 1E 01            [ 2]  993 	ldw x,(DEST,sp)
      00846A 16 07            [ 2]  994 	ldw y,(LLEN,sp)
      00846C CD 83 EA         [ 4]  995 	call create_gap 
                                    996 ; move new line in gap 
      00846F 1E 07            [ 2]  997 	ldw x,(LLEN,sp)
      008471 CF 00 09         [ 2]  998 	ldw acc16,x 
      008474 90 CE 00 1D      [ 2]  999 	ldw y,txtend ;SRC 
      008478 1E 01            [ 2] 1000 	ldw x,(DEST,sp) ; dest address 
      00847A CD 83 4C         [ 4] 1001 	call move 
      00847D 20 09            [ 2] 1002 	jra insert_ln_exit  
      00847F                       1003 5$: ; no move required 
      00847F 1E 07            [ 2] 1004 	ldw x,(LLEN,sp) 
      008481 72 BB 00 1D      [ 2] 1005 	addw x,txtend 
      008485 CF 00 1D         [ 2] 1006 	ldw txtend,x 
      008488                       1007 insert_ln_exit:	
      000408                       1008 	_drop VSIZE
      008488 5B 08            [ 2]    1     addw sp,#VSIZE 
      00848A 81               [ 4] 1009 	ret
                                   1010 
                                   1011 
                                   1012 ;-----------------------------
                                   1013 ; check if text buffer full
                                   1014 ; input:
                                   1015 ;   ptr16     addr start tokenize line 
                                   1016 ;   X         buffer index 
                                   1017 ; output:
                                   1018 ;   none 
                                   1019 ;-----------------------------------
      00848B                       1020 check_full:
      00848B 72 BB 00 14      [ 2] 1021 	addw x,ptr16 
      00848F A3 16 E8         [ 2] 1022 	cpw x,#tib 
      008492 25 05            [ 1] 1023 	jrult 1$
      008494 A6 01            [ 1] 1024 	ld a,#ERR_MEM_FULL
      008496 CC 88 0B         [ 2] 1025 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008499 81               [ 4] 1026 1$: ret 
                                   1027 
                                   1028 
                                   1029 ;-----------------------------------
                                   1030 ; create token list form text line 
                                   1031 ; save this list in text area
                                   1032 ;  compiled line format: 
                                   1033 ;    line_no  2 bytes {0...32767}
                                   1034 ;    count    1 byte 
                                   1035 ;    tokens   variable 
                                   1036 ;   
                                   1037 ; input:
                                   1038 ;   none
                                   1039 ; output:
                                   1040 ;   basicptr     token list buffer address 
                                   1041 ;   in.w  		 cleared, index in buffer 
                                   1042 ;-----------------------------------
                           000001  1043 	XSAVE=1
                           000003  1044 	BUFIDX=3
                           000004  1045 	VSIZE=4
      00849A                       1046 compile:
      00041A                       1047 	_vars VSIZE 
      00849A 52 04            [ 2]    1     sub sp,#VSIZE 
      00849C 72 1A 00 22      [ 1] 1048 	bset flags,#FCOMP 
      0084A0 CE 00 1D         [ 2] 1049 	ldw x,txtend
      0084A3 CF 00 14         [ 2] 1050 	ldw ptr16,x ; code buffer start address 
      0084A6 5F               [ 1] 1051 	clrw x 
      0084A7 AE 00 03         [ 2] 1052 	ldw x,#3
      0084AA 1F 03            [ 2] 1053 	ldw (BUFIDX,sp),X  
      0084AC CD 84 8B         [ 4] 1054 	call check_full
      0084AF 5F               [ 1] 1055 	clrw x 
      0084B0 72 CF 00 14      [ 5] 1056 	ldw [ptr16],x ; initialize line# to zero 
      0084B4 CD 8D CE         [ 4] 1057 	call get_token
      0084B7 1F 01            [ 2] 1058 	ldw (XSAVE,sp),x 
      0084B9 A1 04            [ 1] 1059 	cp a,#TK_INTGR 
      0084BB 26 13            [ 1] 1060 	jrne 3$
      0084BD A3 00 00         [ 2] 1061 	cpw x,#0 
      0084C0 2C 05            [ 1] 1062 	jrsgt 1$
      0084C2 A6 0A            [ 1] 1063 	ld a,#ERR_BAD_VALUE 
      0084C4 CC 88 0B         [ 2] 1064 	jp tb_error ; line number must be in range {1..32767}
      0084C7 72 CF 00 14      [ 5] 1065 1$:	ldw [ptr16],x; line number
      0084CB CD 8D CE         [ 4] 1066 2$:	call get_token
      0084CE 1F 01            [ 2] 1067 	ldw (XSAVE,sp),x 
      0084D0 A1 00            [ 1] 1068 3$:	cp a,#TK_NONE 
      0084D2 26 03            [ 1] 1069 	jrne 30$
      0084D4 CC 85 65         [ 2] 1070 	jp 9$ ; end of line. 
      0084D7                       1071 30$: 	 
      0084D7 1E 03            [ 2] 1072 	ldw x,(BUFIDX,sp)
      0084D9 CD 84 8B         [ 4] 1073 	call check_full 
      0084DC 16 03            [ 2] 1074 	ldw y,(BUFIDX,sp) 
      0084DE 91 D7 14         [ 4] 1075 	ld ([ptr16],y),a ; token attribute 
      0084E1 90 5C            [ 2] 1076 	incw y
      0084E3 17 03            [ 2] 1077 	ldw (BUFIDX,sp),y
      0084E5 A1 01            [ 1] 1078 	cp a,#TK_COLON 
      0084E7 26 02            [ 1] 1079 	jrne 31$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      0084E9 20 E0            [ 2] 1080 	jra 2$ ; loop for next token 
      0084EB                       1081 31$: ; check for token type 
                                   1082 ; character token have 1 byte attribute, i.e. ASCII character 
      0084EB A1 03            [ 1] 1083 	cp a,#TK_CHAR
      0084ED 26 0C            [ 1] 1084 	jrne 32$ 
      0084EF 1E 01            [ 2] 1085 	ldw x,(XSAVE,sp)
      0084F1 9F               [ 1] 1086 	ld a,xl 
      0084F2 91 D7 14         [ 4] 1087 	ld ([ptr16],y),a
      0084F5 90 5C            [ 2] 1088 	incw y 
      0084F7 17 03            [ 2] 1089 	ldw (BUFIDX,sp),y 
      0084F9 20 D0            [ 2] 1090 	jra 2$ 
      0084FB                       1091 32$:
      0084FB A1 02            [ 1] 1092 	cp a,#TK_ARRAY 
                                   1093 ; this token have not attribute. 
      0084FD 27 CC            [ 1] 1094 	jreq 2$ 
      0084FF A1 0A            [ 1] 1095 	cp a,#TK_QSTR 
      008501 26 25            [ 1] 1096 	jrne 4$
                                   1097 ; copy string as C string.	
      008503 AE 17 38         [ 2] 1098 	ldw x,#pad 
      008506 CD 83 20         [ 4] 1099 	call strlen
      008509 5C               [ 2] 1100 	incw x  
      00850A CD 84 8B         [ 4] 1101 	call check_full 
      00850D 90 AE 17 38      [ 2] 1102 	ldw y,#pad 
      008511 CE 00 14         [ 2] 1103 	ldw x,ptr16
      008514 72 FB 03         [ 2] 1104 	addw x,(BUFIDX,sp)	
      008517 CD 83 3E         [ 4] 1105 	call strcpy 
      00851A AE 17 38         [ 2] 1106 	ldw x,#pad 
      00851D CD 83 20         [ 4] 1107 	call strlen 
      008520 5C               [ 2] 1108 	incw x
      008521 72 FB 03         [ 2] 1109 	addw x,(BUFIDX,sp) 
      008524 1F 03            [ 2] 1110 	ldw (BUFIDX,sp),x
      008526 20 A3            [ 2] 1111 	jra 2$  
      008528 A1 04            [ 1] 1112 4$: cp a,#TK_INTGR
      00852A 25 9F            [ 1] 1113 	jrult 2$ ; 
      00852C A1 08            [ 1] 1114 	cp a,#TK_CFUNC 
      00852E 22 9B            [ 1] 1115 	Jrugt 2$ ; those tokens have no attributes 
      008530 1E 01            [ 2] 1116 	ldw x,(XSAVE,sp) 
      008532 16 03            [ 2] 1117 	ldw y,(BUFIDX,sp)
      008534 91 DF 14         [ 5] 1118 	ldw ([ptr16],y),x ; the attribute is an address or integer. 
      008537 A3 97 AA         [ 2] 1119 	cpw x,#rem ; is this a comment? 
      00853A 27 09            [ 1] 1120 	jreq 5$	
      00853C 72 A9 00 02      [ 2] 1121 	addw y,#2 
      008540 17 03            [ 2] 1122 	ldw (BUFIDX,sp),y 
      008542 CC 84 CB         [ 2] 1123 	jp 2$
      008545                       1124 5$:
                                   1125 ; copy commment in code buffer and
                                   1126 ; skip to end of line.  
      008545 72 A9 00 02      [ 2] 1127 	addw y,#2 ; skip exec address 
      008549 17 03            [ 2] 1128 	ldw (BUFIDX,sp),y 
      00854B CE 00 14         [ 2] 1129 	ldw x,ptr16 
      00854E 72 FB 03         [ 2] 1130 	addw x,(BUFIDX,sp)
      008551 90 CE 00 01      [ 2] 1131 	ldw y,in.w 
      008555 72 A9 16 E8      [ 2] 1132 	addw y,#tib 
      008559 CD 83 3E         [ 4] 1133 	call strcpy 	
      00855C CD 83 20         [ 4] 1134 	call strlen 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00855F 5C               [ 2] 1135 	incw x ; skip string 0. 
      008560 72 FB 03         [ 2] 1136 	addw x,(BUFIDX,sp)
      008563 1F 03            [ 2] 1137 	ldw (BUFIDX,sp),x 
      008565                       1138 9$: 
      008565 AE 00 02         [ 2] 1139 	ldw x,#2
      008568 16 03            [ 2] 1140 	ldw y,(BUFIDX,sp)
      00856A 90 9F            [ 1] 1141 	ld a,yl 
      00856C 72 D7 00 14      [ 4] 1142 	ld ([ptr16],x),a ; code byte count   	
      008570 72 CE 00 14      [ 5] 1143 	ldw x,[ptr16]
      008574 27 09            [ 1] 1144 	jreq 10$
      008576 CD 84 23         [ 4] 1145 	call insert_line
      008579 72 5F 00 04      [ 1] 1146 	clr  count 
      00857D 20 0F            [ 2] 1147 	jra  11$ 
      00857F                       1148 10$: ; line# is zero 
      00857F CE 00 14         [ 2] 1149 	ldw x,ptr16 
      008582 CF 00 05         [ 2] 1150 	ldw basicptr,x 
      008585 E6 02            [ 1] 1151 	ld a,(2,x)
      008587 C7 00 04         [ 1] 1152 	ld count,a 
      00858A 35 03 00 02      [ 1] 1153 	mov in,#3 
      00858E                       1154 11$:
      00050E                       1155 	_drop VSIZE 
      00858E 5B 04            [ 2]    1     addw sp,#VSIZE 
      008590 72 1B 00 22      [ 1] 1156 	bres flags,#FCOMP 
      008594 81               [ 4] 1157 	ret 
                                   1158 
                                   1159 
                                   1160 ;------------------------------------
                                   1161 ;  set all variables to zero 
                                   1162 ; input:
                                   1163 ;   none 
                                   1164 ; output:
                                   1165 ;	none
                                   1166 ;------------------------------------
      008595                       1167 clear_vars:
      008595 AE 00 25         [ 2] 1168 	ldw x,#vars 
      008598 90 AE 00 34      [ 2] 1169 	ldw y,#2*26 
      00859C 7F               [ 1] 1170 1$:	clr (x)
      00859D 5C               [ 2] 1171 	incw x 
      00859E 90 5A            [ 2] 1172 	decw y 
      0085A0 26 FA            [ 1] 1173 	jrne 1$
      0085A2 81               [ 4] 1174 	ret 
                                   1175 
                                   1176 ;-------------------------------------
                                   1177 ; check if A is a letter 
                                   1178 ; input:
                                   1179 ;   A 			character to test 
                                   1180 ; output:
                                   1181 ;   C flag      1 true, 0 false 
                                   1182 ;-------------------------------------
      0085A3                       1183 is_alpha:
      0085A3 A1 41            [ 1] 1184 	cp a,#'A 
      0085A5 8C               [ 1] 1185 	ccf
      0085A6 24 0B            [ 1] 1186 	jrnc 9$ 
      0085A8 A1 5B            [ 1] 1187 	cp a,#'Z+1 
      0085AA 25 07            [ 1] 1188 	jrc 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0085AC A1 61            [ 1] 1189 	cp a,#'a 
      0085AE 8C               [ 1] 1190 	ccf 
      0085AF 24 02            [ 1] 1191 	jrnc 9$
      0085B1 A1 7B            [ 1] 1192 	cp a,#'z+1   
      0085B3 81               [ 4] 1193 9$: ret 	
                                   1194 
                                   1195 ;-------------------------------------
                                   1196 ;  program initialization entry point 
                                   1197 ;-------------------------------------
                           000001  1198 	MAJOR=1
                           000000  1199 	MINOR=0
      0085B4 0A 0A 54 69 6E 79 20  1200 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0085FA                       1201 cold_start:
                                   1202 ;set stack 
      0085FA AE 17 FF         [ 2] 1203 	ldw x,#STACK_EMPTY
      0085FD 94               [ 1] 1204 	ldw sp,x   
                                   1205 ; clear all ram 
      0085FE 7F               [ 1] 1206 0$: clr (x)
      0085FF 5A               [ 2] 1207 	decw x 
      008600 26 FC            [ 1] 1208 	jrne 0$
                                   1209 ; activate pull up on all inputs 
      008602 A6 FF            [ 1] 1210 	ld a,#255 
      008604 C7 50 03         [ 1] 1211 	ld PA_CR1,a 
      008607 C7 50 08         [ 1] 1212 	ld PB_CR1,a 
      00860A C7 50 0D         [ 1] 1213 	ld PC_CR1,a 
      00860D C7 50 12         [ 1] 1214 	ld PD_CR1,a 
      008610 C7 50 17         [ 1] 1215 	ld PE_CR1,a 
      008613 C7 50 1C         [ 1] 1216 	ld PF_CR1,a 
      008616 C7 50 21         [ 1] 1217 	ld PG_CR1,a 
      008619 C7 50 2B         [ 1] 1218 	ld PI_CR1,a 
                                   1219 ; disable schmitt triggers on Arduino CN4 analog inputs
      00861C 55 00 3F 54 07   [ 1] 1220 	mov ADC_TDRL,0x3f
                                   1221 ; disable peripherals clocks
                                   1222 ;	clr CLK_PCKENR1 
                                   1223 ;	clr CLK_PCKENR2
      008621 72 5F 50 F2      [ 1] 1224 	clr AWU_TBR 
      008625 72 14 50 CA      [ 1] 1225 	bset CLK_PCKENR2,#2 ; enable LSI for beeper
                                   1226 ; select internal clock no divisor: 16 Mhz 	
      008629 A6 E1            [ 1] 1227 	ld a,#CLK_SWR_HSI 
      00862B 5F               [ 1] 1228 	clrw x  
      00862C CD 81 24         [ 4] 1229     call clock_init 
      00862F CD 81 47         [ 4] 1230 	call timer4_init
      008632 CD 81 3A         [ 4] 1231 	call timer2_init
                                   1232 ; UART1 at 115200 BAUD
      008635 CD 82 10         [ 4] 1233 	call uart1_init
                                   1234 ; activate PE_4 (user button interrupt)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008638 72 18 50 18      [ 1] 1235     bset PE_CR2,#USR_BTN_BIT 
                                   1236 ; display system information
      00863C AE 85 B4         [ 2] 1237 	ldw x,#software 
      00863F CD 82 5E         [ 4] 1238 	call puts 
      008642 A6 01            [ 1] 1239 	ld a,#MAJOR 
      008644 C7 00 0A         [ 1] 1240 	ld acc8,a 
      008647 5F               [ 1] 1241 	clrw x 
      008648 CF 00 08         [ 2] 1242 	ldw acc24,x 
      00864B A6 0A            [ 1] 1243 	ld a,#10 
      00864D CD 8A 1F         [ 4] 1244 	call prti24 
      008650 A6 2E            [ 1] 1245 	ld a,#'.
      008652 CD 82 4B         [ 4] 1246 	call putc 
      008655 A6 00            [ 1] 1247 	ld a,#MINOR 
      008657 C7 00 0A         [ 1] 1248 	ld acc8,a 
      00865A 5F               [ 1] 1249 	clrw x 
      00865B CF 00 08         [ 2] 1250 	ldw acc24,x 
      00865E A6 0A            [ 1] 1251 	ld a,#10 
      008660 CD 8A 1F         [ 4] 1252 	call prti24 
      008663 A6 0D            [ 1] 1253 	ld a,#CR 
      008665 CD 82 4B         [ 4] 1254 	call putc 
      008668 CD 9B F9         [ 4] 1255 	call seek_fdrive 
                                   1256 ; configure LD2 pin 
      00866B 72 1A 50 0D      [ 1] 1257     bset PC_CR1,#LED2_BIT
      00866F 72 1A 50 0E      [ 1] 1258     bset PC_CR2,#LED2_BIT
      008673 72 1A 50 0C      [ 1] 1259     bset PC_DDR,#LED2_BIT
      008677 9A               [ 1] 1260 	rim 
      008678 72 5C 00 12      [ 1] 1261 	inc seedy+1 
      00867C 72 5C 00 10      [ 1] 1262 	inc seedx+1 
      008680 CD 86 EB         [ 4] 1263 	call clear_basic
      008683 CD 94 23         [ 4] 1264 	call ubound 
      008686 CD 90 6D         [ 4] 1265 	call dpop 
      008689 CF 00 20         [ 2] 1266 	ldw array_size,x
      00868C CD 86 95         [ 4] 1267 	call warm_init
      00868F CD 86 B2         [ 4] 1268 	call load_autorun
      008692 CC 88 4F         [ 2] 1269     jp interp 
                                   1270 
      008695                       1271 warm_init:
      008695 72 5F 00 22      [ 1] 1272 	clr flags 
      008699 72 5F 00 1F      [ 1] 1273 	clr loop_depth 
      00869D AE 17 80         [ 2] 1274 	ldw x,#dstack_empty 
      0086A0 CF 00 19         [ 2] 1275 	ldw dstkptr,x 
      0086A3 35 04 00 23      [ 1] 1276 	mov tab_width,#TAB_WIDTH 
      0086A7 35 0A 00 07      [ 1] 1277 	mov base,#10 
      0086AB AE 16 E8         [ 2] 1278 	ldw x,#tib 
      0086AE CF 00 05         [ 2] 1279 	ldw basicptr,x 
      0086B1 81               [ 4] 1280 	ret 
                                   1281 
                                   1282 ;--------------------------
                                   1283 ; if autorun file defined 
                                   1284 ; in eeprom address AUTORUN_NAME 
                                   1285 ; load and run it.
                                   1286 ;-------------------------
      0086B2                       1287 load_autorun:
      0086B2 AE 40 00         [ 2] 1288 	ldw x,#AUTORUN_NAME
      0086B5 F6               [ 1] 1289 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0086B6 27 1D            [ 1] 1290 	jreq 9$
      0086B8 90 AE 40 00      [ 2] 1291 	ldw y,#AUTORUN_NAME
      0086BC CD 9C 57         [ 4] 1292 	call search_file
      0086BF 25 02            [ 1] 1293 	jrc 2$ 
      0086C1 20 12            [ 2] 1294 	jra 9$ 
      0086C3 CD 9D 66         [ 4] 1295 2$:	call load_file
      0086C6 AE 40 00         [ 2] 1296 	ldw x,#AUTORUN_NAME 
      0086C9 CD 82 5E         [ 4] 1297 	call puts
      0086CC AE 86 D6         [ 2] 1298 	ldw x,#autorun_msg 
      0086CF CD 82 5E         [ 4] 1299 	call puts 
      0086D2 CC 9A 28         [ 2] 1300 	jp run_it    
      0086D5 81               [ 4] 1301 9$: ret 	
                                   1302 
      0086D6 20 6C 6F 61 64 65 64  1303 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1304 ;---------------------------
                                   1305 ; reset BASIC text variables 
                                   1306 ; and clear variables 
                                   1307 ;---------------------------
      0086EB                       1308 clear_basic:
      0086EB 72 5F 00 04      [ 1] 1309 	clr count 
      0086EF AE 00 59         [ 2] 1310 	ldw x,#free_ram 
      0086F2 CF 00 1B         [ 2] 1311 	ldw txtbgn,x 
      0086F5 CF 00 1D         [ 2] 1312 	ldw txtend,x 
      0086F8 CD 85 95         [ 4] 1313 	call clear_vars 
      0086FB 81               [ 4] 1314 	ret 
                                   1315 
                                   1316 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1317 ;;   Tiny BASIC error messages     ;;
                                   1318 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0086FC                       1319 err_msg:
      0086FC 00 00 87 14 87 22 87  1320 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             31 87 4B 87 5B
      008708 87 72 87 89 87 A4 87  1321 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             B6 87 C8
      008712 87 D5                 1322 	.word err_no_access 
                                   1323 
      008714 0A 4D 65 6D 6F 72 79  1324 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      008722 0A 73 79 6E 74 61 78  1325 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      008731 0A 6D 61 74 68 20 6F  1326 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      00874B 0A 64 69 76 69 73 69  1327 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      00875B 0A 69 6E 76 61 6C 69  1328 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      008772 0A 72 75 6E 20 74 69  1329 err_run_only: .asciz "\nrun time only usage.\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal  6D-Bits]



             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      00877A 65 20 6F 6E 6C 79 20  1330 err_cmd_only: .asciz "\ncommand line only usage.\n"
             75 73 61 67 65 2E 0A
             00 0A 63 6F 6D 6D 61
             6E 64 20 6C 69 6E
      008795 65 20 6F 6E 6C 79 20  1331 err_duplicate: .asciz "\nduplicate name.\n"
             75 73 61 67 65 2E 0A
             00 0A 64 75
      0087A7 70 6C 69 63 61 74 65  1332 err_not_file: .asciz "\nFile not found.\n"
             20 6E 61 6D 65 2E 0A
             00 0A 46 69
      0087B9 6C 65 20 6E 6F 74 20  1333 err_bad_value: .asciz "\nbad value.\n"
             66 6F 75 6E 64 2E
      0087C6 0A 00 0A 62 61 64 20  1334 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             76 61 6C 75 65 2E 0A
             00 0A 46 69 6C 65 20
             69 6E 20 65 78 74 65
             6E 64 65 64 20 6D 65
             6D 6F 72 79 2C 20 63
             61 6E 27 74 20 62 65
             20 72 75
                                   1335 
                                   1336 ;rt_msg: .asciz "last token id: "
                                   1337 
      000789                       1338 syntax_error:
      0087FA 6E 20            [ 1] 1339 	ld a,#ERR_SYNTAX 
                                   1340 
      00078B                       1341 tb_error:
      0087FC 66 72 6F         [ 2] 1342 	ldw x, #err_msg 
      0087FF 6D 20 74 68      [ 1] 1343 	clr acc16 
      008803 65               [ 1] 1344 	sll a
      008804 72 65 2E 0A      [ 1] 1345 	rlc acc16  
      008808 00 00 09         [ 1] 1346 	ld acc8, a 
      008809 72 BB 00 08      [ 2] 1347 	addw x,acc16 
      008809 A6               [ 2] 1348 	ldw x,(x)
      00880A 02 01 DE         [ 4] 1349 	call puts
      00880B 72 0B 00 21 18   [ 2] 1350 	btjf flags,#FCOMP, 1$
      00880B AE 86 FC         [ 2] 1351 	ldw x,#tib
      00880E 72 5F 00         [ 4] 1352 	call puts 
      008811 09 48            [ 1] 1353 	ld a,#CR 
      008813 72 59 00         [ 4] 1354 	call putc
      008816 09 C7 00         [ 2] 1355 	ldw x,in.w
      008819 0A 72 BB         [ 4] 1356 	call spaces
      00881C 00 09            [ 1] 1357 	ld a,#'^
      00881E FE CD 82         [ 4] 1358 	call putc 
      008821 5E 72            [ 2] 1359 	jra 6$
      008823 0B 00 22         [ 2] 1360 1$:	ldw x,basicptr
      008826 18 AE 16         [ 1] 1361 	ld a,in 
      008829 E8 CD 82         [ 4] 1362 	call prt_basic_line
                                   1363 ;	ldw x,#rt_msg 
                                   1364 ;	call puts 
                                   1365 ;	clrw x 
                                   1366 ;	ld a,in.saved 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1367 ;	ld xl,a 
                                   1368 ;	ld a,([basicptr],x)
                                   1369 ;	clrw x 
                                   1370 ;	ld xl,a 
                                   1371 ;	call print_int 
      00882C 5E A6 0D         [ 2] 1372 6$: ldw x,#STACK_EMPTY 
      00882F CD               [ 1] 1373     ldw sp,x
      0007CC                       1374 warm_start:
      008830 82 4B CE         [ 4] 1375 	call warm_init
                                   1376 ;----------------------------
                                   1377 ;   BASIC interpreter
                                   1378 ;----------------------------
      0007CF                       1379 interp:
      008833 00 01 CD 82      [ 1] 1380 	clr in.w
      008837 86 A6 5E CD 82   [ 2] 1381 	btjf flags,#FRUN,cmd_line
                                   1382 ; flag FRUN is set 
                                   1383 ; running program
                                   1384 ; goto next basic line 
      00883C 4B 20 09         [ 2] 1385 	ldw x,basicptr
      00883F CE 00            [ 1] 1386 	ld a,(2,x) ; line length 
      008841 05 C6 00         [ 1] 1387 	ld acc8,a 
      008844 02 CD 95 42      [ 1] 1388 	clr acc16 
      008848 AE 17 FF 94      [ 2] 1389 	addw x,acc16
      00884C C3 00 1C         [ 2] 1390 	cpw x,txtend 
      00884C CD 86            [ 1] 1391 	jrpl warm_start
      00884E 95 00 04         [ 2] 1392 	ldw basicptr,x ; start of next line  
      00884F E6 02            [ 1] 1393 	ld a,(2,x)
      00884F 72 5F 00         [ 1] 1394 	ld count,a 
      008852 01 72 01 00      [ 1] 1395 	mov in,#3 ; skip first 3 bytes of line 
      008856 22 23            [ 2] 1396 	jra interp_loop 
      0007FB                       1397 cmd_line: ; commande line interface  	
      008858 CE 00 05 E6      [ 1] 1398 	clr in
      00885C 02 C7            [ 1] 1399 	ld a,#CR 
      00885E 00 0A 72         [ 4] 1400 	call putc 
      008861 5F 00            [ 1] 1401 	ld a,#'> 
      008863 09 72 BB         [ 4] 1402 	call putc 
      008866 00 09 C3         [ 4] 1403 	call readln
      008869 00 1D 2A         [ 4] 1404 	call compile
                                   1405 ; if text begin with a line number
                                   1406 ; the compile set count=0   
                                   1407 ; so code is not interpreted
                                   1408 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1409 ;; This is the interpreter loop
                                   1410 ;; for each BASIC code line. 
                                   1411 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00080F                       1412 interp_loop:  
      00886C DF CF 00         [ 1] 1413 	ld a,in 
      00886F 05 E6 02         [ 1] 1414 	cp a,count  
      008872 C7 00            [ 1] 1415 	jrpl interp
      008874 04 35 03         [ 4] 1416 	call next_token
      008877 00 02            [ 1] 1417 	cp a,#TK_COLON 
      008879 20 14            [ 1] 1418 	jreq interp_loop 
      00887B                       1419 1$:
      00887B 72 5F            [ 1] 1420 	cp a,#TK_VAR
      00887D 00 02            [ 1] 1421 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      00887F A6 0D CD         [ 4] 1422 	call let02  
      008882 82 4B            [ 2] 1423 	jra interp_loop 
      000827                       1424 2$:	
      008884 A6 3E            [ 1] 1425 	cp a,#TK_ARRAY 
      008886 CD 82            [ 1] 1426 	jrne 3$
      008888 4B CD 8B         [ 4] 1427 	call get_array_element
      00888B 55 CD 84         [ 4] 1428 	call let02 
      00888E 9A DC            [ 2] 1429 	jra interp_loop 
      00888F                       1430 3$:
      00888F C6 00            [ 1] 1431 	cp a,#TK_CMD
      008891 02 C1            [ 1] 1432 	jrne 4$
      008893 00               [ 4] 1433 	call (x) 
      008894 04 2A            [ 2] 1434 	jra interp_loop 
      00083A                       1435 4$:	
      008896 B8 CD 88         [ 2] 1436 	jp syntax_error 
                                   1437 
                                   1438 ;--------------------------
                                   1439 ; extract next token from
                                   1440 ; token list 
                                   1441 ; basicptr -> base address 
                                   1442 ; in  -> offset in list array 
                                   1443 ; output:
                                   1444 ;   A 		token attribute
                                   1445 ;   X 		token value if there is one
                                   1446 ;----------------------------------------
      00083D                       1447 next_token:
      008899 BD A1 01         [ 1] 1448 	ld a,in 
      00889C 27 F1 03         [ 1] 1449 	sub a,count ; don't replace sub by cp.  
      00889E 27 4C            [ 1] 1450 	jreq 9$
      00889E A1 05 26 05 CD   [ 1] 1451 	mov in.saved,in 
      0088A3 94 4F 20         [ 2] 1452 	ldw x,basicptr 
      0088A6 E8 D6 00 00      [ 4] 1453 	ld a,([in.w],x)
      0088A7 72 5C 00 01      [ 1] 1454 	inc in 
      0088A7 A1 02            [ 1] 1455 	cp a,#TK_ARRAY  
      0088A9 26 08            [ 2] 1456 	jrule 9$
      0088AB CD 92            [ 1] 1457 	cp a,#TK_CHAR
      0088AD 98 CD            [ 1] 1458 	jrne 1$
      0088AF 94 4F 20 DC      [ 4] 1459 	ld a,([in.w],x)
      0088B3 72 5C 00 01      [ 1] 1460 	inc in
      0088B3 A1               [ 1] 1461 	clrw x 
      0088B4 06               [ 1] 1462 	ld xl,a 
      0088B5 26 03            [ 1] 1463 	ld a,#TK_CHAR
      0088B7 FD               [ 4] 1464 	ret 
      0088B8 20 D5            [ 1] 1465 1$:	cp a,#TK_QSTR 
      0088BA 25 17            [ 1] 1466 	jrult 4$
      0088BA CC 88            [ 1] 1467 	jrne 9$
      0088BC 09 BB 00 00      [ 2] 1468 	addw x,in.w 
      0088BD 89               [ 2] 1469 	pushw x 
      0088BD C6               [ 1] 1470 2$:	tnz (x)
      0088BE 00 02            [ 1] 1471 	jreq 3$
      0088C0 C0               [ 2] 1472 	incw x 
      0088C1 00 04            [ 2] 1473 	jra 2$ 
      0088C3 27               [ 2] 1474 3$:	incw x 
      0088C4 4C 55 00 02      [ 2] 1475     subw x,basicptr 
      0088C8 00 03 CE         [ 2] 1476 	ldw in.w,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0088CB 00               [ 2] 1477 	popw x 
      0088CC 05               [ 4] 1478 	ret 
      0088CD 72 D6 00 01      [ 5] 1479 4$: ldw x,([in.w],x)
      0088D1 72 5C 00 02      [ 1] 1480 	inc in 
      0088D5 A1 02 23 38      [ 1] 1481 	inc in
      000891                       1482 9$: 
      0088D9 A1               [ 4] 1483 	ret	
                                   1484 
                                   1485 
                                   1486 ;----------------------------------------
                                   1487 ;   DEBUG support functions
                                   1488 ;----------------------------------------
                           000001  1489 .if DEBUG 
                                   1490 
                                   1491 ; turn LED on 
      000892                       1492 ledon:
      0088DA 03 26 0D 72      [ 1] 1493     bset PC_ODR,#LED2_BIT
      0088DE D6               [ 4] 1494     ret 
                                   1495 
                                   1496 ; turn LED off 
      000897                       1497 ledoff:
      0088DF 00 01 72 5C      [ 1] 1498     bres PC_ODR,#LED2_BIT 
      0088E3 00               [ 4] 1499     ret 
                                   1500 
                                   1501 ; invert LED status 
      00089C                       1502 ledtoggle:
      0088E4 02 5F            [ 1] 1503     ld a,#LED2_MASK
      0088E6 97 A6 03         [ 1] 1504     xor a,PC_ODR
      0088E9 81 A1 0A         [ 1] 1505     ld PC_ODR,a
      0088EC 25               [ 4] 1506     ret 
                                   1507 
      0008A5                       1508 left_paren:
      0088ED 17 26            [ 1] 1509 	ld a,#SPACE 
      0088EF 21 72 BB         [ 4] 1510 	call putc
      0088F2 00 01            [ 1] 1511 	ld a,#'( 
      0088F4 89 7D 27         [ 4] 1512 	call putc 	
      0088F7 03               [ 4] 1513 	ret 
                                   1514 
                                   1515 ;------------------------------
                                   1516 ; print 8 bit register 
                                   1517 ; input:
                                   1518 ;   X  point to register name 
                                   1519 ;   A  register value to print 
                                   1520 ; output:
                                   1521 ;   none
                                   1522 ;------------------------------- 
      0008B0                       1523 prt_reg8:
      0088F8 5C               [ 1] 1524 	push a 
      0088F9 20 FA 5C         [ 4] 1525 	call puts 
      0088FC 72 B0            [ 1] 1526 	ld a,(1,sp) 
      0088FE 00 05 CF         [ 1] 1527 	ld acc8,a 
      008901 00               [ 1] 1528 	clrw x 
      008902 01               [ 1] 1529 	ld xl,a 
      008903 85 81 72 DE      [ 1] 1530 	mov base,#16
      008907 00 01 72         [ 4] 1531 	call print_int 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00890A 5C 00 02         [ 4] 1532 	call left_paren 
      00890D 72               [ 1] 1533 	pop a 
      00890E 5C               [ 1] 1534 	clrw x 
      00890F 00               [ 1] 1535 	ld xl,a 
      008910 02 0A 00 06      [ 1] 1536 	mov base,#10 
      008911 CD 09 E7         [ 4] 1537 	call print_int  
      008911 81 29            [ 1] 1538 	ld a,#') 
      008912 CD 01 CB         [ 4] 1539 	call putc
      008912 72               [ 4] 1540 	ret
                                   1541 
                                   1542 ;--------------------------------
                                   1543 ; print 16 bits register 
                                   1544 ; input:
                                   1545 ;   X   point register name 
                                   1546 ;   Y   register value to print 
                                   1547 ; output:
                                   1548 ;  none
                                   1549 ;--------------------------------
      0008D5                       1550 prt_reg16: 
      008913 1A 50            [ 2] 1551 	pushw y 
      008915 0A 81 DE         [ 4] 1552 	call puts 
      008917 1E 01            [ 2] 1553 	ldw x,(1,sp) 
      008917 72 1B 50 0A      [ 1] 1554 	mov base,#16 
      00891B 81 09 E7         [ 4] 1555 	call print_int  
      00891C CD 08 A5         [ 4] 1556 	call left_paren 
      00891C A6               [ 2] 1557 	popw x 
      00891D 20 C8 50 0A      [ 1] 1558 	mov base,#10 
      008921 C7 50 0A         [ 4] 1559 	call print_int  
      008924 81 29            [ 1] 1560 	ld a,#') 
      008925 CD 01 CB         [ 4] 1561 	call putc
      008925 A6               [ 4] 1562 	ret 
                                   1563 
                                   1564 ;------------------------------------
                                   1565 ; print registers contents saved on
                                   1566 ; stack by trap interrupt.
                                   1567 ;------------------------------------
      0008F4                       1568 print_registers:
      008926 20 CD 82         [ 2] 1569 	ldw x,#STATES
      008929 4B A6 28         [ 4] 1570 	call puts
                                   1571 ; print EPC 
      00892C CD 82 4B         [ 2] 1572 	ldw x, #REG_EPC
      00892F 81 01 DE         [ 4] 1573 	call puts 
      008930 7B 0B            [ 1] 1574 	ld a, (11,sp)
      008930 88 CD 82         [ 1] 1575 	ld acc8,a 
      008933 5E 7B            [ 1] 1576 	ld a, (10,sp) 
      008935 01 C7 00         [ 1] 1577 	ld acc16,a 
      008938 0A 5F            [ 1] 1578 	ld a,(9,sp) 
      00893A 97 35 10         [ 1] 1579 	ld acc24,a
      00893D 00               [ 1] 1580 	clrw x  
      00893E 07 CD            [ 1] 1581 	ld a,#16
      008940 8A 67 CD         [ 4] 1582 	call prti24  
                                   1583 ; print X
      008943 89 25 84         [ 2] 1584 	ldw x,#REG_X
      008946 5F 97            [ 2] 1585 	ldw y,(5,sp)
      008948 35 0A 00         [ 4] 1586 	call prt_reg16  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1587 ; print Y 
      00894B 07 CD 8A         [ 2] 1588 	ldw x,#REG_Y
      00894E 67 A6            [ 2] 1589 	ldw y, (7,sp)
      008950 29 CD 82         [ 4] 1590 	call prt_reg16  
                                   1591 ; print A 
      008953 4B 81 91         [ 2] 1592 	ldw x,#REG_A
      008955 7B 04            [ 1] 1593 	ld a, (4,sp) 
      008955 90 89 CD         [ 4] 1594 	call prt_reg8
                                   1595 ; print CC 
      008958 82 5E 1E         [ 2] 1596 	ldw x,#REG_CC 
      00895B 01 35            [ 1] 1597 	ld a, (3,sp) 
      00895D 10 00 07         [ 4] 1598 	call prt_reg8 
                                   1599 ; print SP 
      008960 CD 8A 67         [ 2] 1600 	ldw x,#REG_SP
      008963 CD 89            [ 1] 1601 	ldw y,sp 
      008965 25 85 35 0A      [ 2] 1602 	addw y,#12
      008969 00 07 CD         [ 4] 1603 	call prt_reg16  
      00896C 8A 67            [ 1] 1604 	ld a,#'\n' 
      00896E A6 29 CD         [ 4] 1605 	call putc
      008971 82               [ 4] 1606 	ret
                                   1607 
      008972 4B 81 65 67 69 73 74  1608 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      008974 45 50 43 3A 00        1609 REG_EPC: .asciz "EPC:"
      008974 AE 89 C7 CD           1610 REG_Y:   .asciz "\nY:" 
      008978 82 5E AE 8A           1611 REG_X:   .asciz "\nX:"
      00897C 04 CD 82 5E           1612 REG_A:   .asciz "\nA:" 
      008980 7B 0B C7 00 0A        1613 REG_CC:  .asciz "\nCC:"
      008985 7B 0A C7 00 09        1614 REG_SP:  .asciz "\nSP:"
                                   1615 
                                   1616 .endif ; DEBUG 
                                   1617 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1618 
                                   1619 
                                   1620 ;------------------------------------
                                   1621 ; print integer in acc24 
                                   1622 ; input:
                                   1623 ;	acc24 		integer to print 
                                   1624 ;	A 			numerical base for conversion 
                                   1625 ;               if bit 7 is set add a space at print end.
                                   1626 ;   XL 			field width, 0 -> no fill.
                                   1627 ;  output:
                                   1628 ;    none 
                                   1629 ;------------------------------------
                           000001  1630 	WIDTH = 1
                           000002  1631 	BASE = 2
                           000003  1632 	ADD_SPACE=3 ; add a space after number 
                           000003  1633 	VSIZE = 3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      00099F                       1634 prti24:
      00099F                       1635 	_vars VSIZE 
      00898A 7B 09            [ 2]    1     sub sp,#VSIZE 
      00898C C7 00            [ 1] 1636 	clr (ADD_SPACE,sp)
      00898E 08 5F            [ 1] 1637 	bcp a,#0x80 
      008990 A6 10            [ 1] 1638 	jreq 0$ 
      008992 CD 8A            [ 1] 1639 	cpl (ADD_SPACE,sp)
      008994 1F AE            [ 1] 1640 0$:	and a,#31 
      008996 8A 0D            [ 1] 1641 	ld (BASE,sp),a
      008998 16               [ 1] 1642 	ld a,xl
      008999 05 CD            [ 1] 1643 	ld (WIDTH,sp),a 
      00899B 89 55            [ 1] 1644 	ld a, (BASE,sp)  
      00899D AE 8A 09         [ 4] 1645     call itoa  ; conversion entier en  .asciz
      0089A0 16 07            [ 1] 1646 1$: ld a,(WIDTH,sp)
      0089A2 CD 89            [ 1] 1647 	jreq 4$
      0089A4 55 AE 8A         [ 1] 1648 	ld acc8,a 
      0089A7 11               [ 2] 1649 	pushw x 
      0089A8 7B 04 CD         [ 4] 1650 	call strlen 
      0089AB 89               [ 1] 1651 	ld a,xl 
      0089AC 30               [ 2] 1652 	popw x 
      0089AD AE 8A 15         [ 3] 1653 	exg a,acc8 
      0089B0 7B 03 CD         [ 1] 1654 	sub a,acc8 
      0089B3 89 30            [ 1] 1655 	jrmi 4$
      0089B5 AE 8A            [ 1] 1656 	ld (WIDTH,sp),a 
      0089B7 1A 90            [ 1] 1657 	ld  a,#SPACE
      0089B9 96 72            [ 1] 1658 3$: tnz (WIDTH,sp)
      0089BB A9 00            [ 1] 1659 	jreq 4$
      0089BD 0C               [ 2] 1660 	decw x 
      0089BE CD               [ 1] 1661 	ld (x),a 
      0089BF 89 55            [ 1] 1662 	dec (WIDTH,sp) 
      0089C1 A6 0A            [ 2] 1663 	jra 3$
      0009D8                       1664 4$: 
      0089C3 CD 82 4B         [ 4] 1665 	call puts 
      0089C6 81 0A            [ 1] 1666 	tnz (ADD_SPACE,sp)
      0089C8 52 65            [ 1] 1667 	jreq 5$
      0089CA 67 69            [ 1] 1668     ld a,#SPACE 
      0089CC 73 74 65         [ 4] 1669 	call putc 
      0009E4                       1670 5$: _drop VSIZE 
      0089CF 72 73            [ 2]    1     addw sp,#VSIZE 
      0089D1 20               [ 4] 1671     ret	
                                   1672 
                                   1673 ;-----------------------------------
                                   1674 ; print a 16 bit integer 
                                   1675 ; using variable 'base' as conversion
                                   1676 ; format.
                                   1677 ; input:
                                   1678 ;   X       integer to print 
                                   1679 ;   base    conversion base 
                                   1680 ; output:
                                   1681 ;   none 
                                   1682 ;-----------------------------------
                           000001  1683 	SIGN=1
                           000001  1684 	VSIZE=1
      0009E7                       1685 print_int: 
      0009E7                       1686 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0089D2 73 74            [ 2]    1     sub sp,#VSIZE 
      0089D4 61 74            [ 1] 1687 	clr (SIGN,sp)
      0089D6 65 20 61 74      [ 2] 1688 	ldw y,#pad+PAD_SIZE-1 
      0089DA 20 61            [ 1] 1689 	clr (y)
      0089DC 62 6F 72         [ 1] 1690 	ld a,base  
      0089DF 74 20            [ 1] 1691 	cp a,#10 
      0089E1 70 6F            [ 1] 1692 	jrne 1$ 
      0089E3 69               [ 2] 1693 	tnzw x 
      0089E4 6E 74            [ 1] 1694 	jrpl 1$ 
      0089E6 2E 0A            [ 1] 1695 	cpl (SIGN,sp)
      0089E8 2D               [ 2] 1696 	negw x 	 
      0009FE                       1697 1$:	
      0089E9 2D 2D 2D         [ 1] 1698 	ld a,base 
      0089EC 2D               [ 2] 1699 	div x,a 
      0089ED 2D 2D            [ 1] 1700 	add a,#'0 
      0089EF 2D 2D            [ 1] 1701 	cp a,#'9+1 
      0089F1 2D 2D            [ 1] 1702 	jrmi 2$ 
      0089F3 2D 2D            [ 1] 1703 	add a,#7 
      0089F5 2D 2D            [ 2] 1704 2$: decw y 
      0089F7 2D 2D            [ 1] 1705 	ld (y),a 
      0089F9 2D               [ 2] 1706 	tnzw x 
      0089FA 2D 2D            [ 1] 1707 	jrne 1$ 
      0089FC 2D 2D            [ 1] 1708 	ld a,#16 
      0089FE 2D 2D 2D         [ 1] 1709 	cp a,base 
      008A01 2D 0A            [ 1] 1710 	jrne 3$
      008A03 00 45            [ 1] 1711 	ld a,#'$
      008A05 50 43            [ 2] 1712 	decw y  
      008A07 3A 00            [ 1] 1713 	ld (y),a
      008A09 0A 59            [ 2] 1714 	jra 9$ 
      008A0B 3A 00            [ 1] 1715 3$: tnz (SIGN,sp)
      008A0D 0A 58            [ 1] 1716 	jreq 9$ 
      008A0F 3A 00            [ 1] 1717 	ld a,#'-
      008A11 0A 41            [ 2] 1718 	decw y  
      008A13 3A 00            [ 1] 1719 	ld (y),a
      000A2A                       1720 9$:	
      008A15 0A               [ 1] 1721 	ldw x,y 
      008A16 43 43 3A         [ 2] 1722 	subw x,#pad+PAD_SIZE-1 
      008A19 00               [ 2] 1723 	negw x  
      000A2F                       1724 10$:
      008A1A 0A 53            [ 2] 1725 	decw y 
      008A1C 50 3A            [ 1] 1726 	ld a,#SPACE 
      008A1E 00 F7            [ 1] 1727 	ld (y),a
      008A1F 5C               [ 2] 1728 	incw x 
      008A1F 52               [ 1] 1729 	ld a,xl 
      008A20 03 0F 03         [ 1] 1730 	cp a,tab_width
      008A23 A5 80            [ 1] 1731 	jrmi 10$ 
      000A3C                       1732 12$:
      008A25 27               [ 1] 1733     ldw x,y 
      008A26 02 03 03         [ 4] 1734 	call puts  
      000A40                       1735 	_drop VSIZE 
      008A29 A4 1F            [ 2]    1     addw sp,#VSIZE 
      008A2B 6B               [ 4] 1736 	ret 
                                   1737 
                                   1738 ;------------------------------------
                                   1739 ; convert integer in acc24 to string
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1740 ; input:
                                   1741 ;   A	  	base
                                   1742 ;	acc24	integer to convert
                                   1743 ; output:
                                   1744 ;   X  		pointer to string
                                   1745 ;------------------------------------
                           000001  1746 	SIGN=1  ; integer sign 
                           000002  1747 	BASE=2  ; numeric base 
                           000002  1748 	VSIZE=2  ;locals size
      000A43                       1749 itoa:
      008A2C 02 9F            [ 2] 1750 	sub sp,#VSIZE
      008A2E 6B 01            [ 1] 1751 	ld (BASE,sp), a  ; base
      008A30 7B 02            [ 1] 1752 	clr (SIGN,sp)    ; sign
      008A32 CD 8A            [ 1] 1753 	cp a,#10
      008A34 C3 7B            [ 1] 1754 	jrne 1$
                                   1755 	; base 10 string display with negative sign if bit 23==1
      008A36 01 27 1F C7 00   [ 2] 1756 	btjf acc24,#7,1$
      008A3B 0A 89            [ 1] 1757 	cpl (SIGN,sp)
      008A3D CD 83 20         [ 4] 1758 	call neg_acc24
      000A57                       1759 1$:
                                   1760 ; initialize string pointer 
      008A40 9F 85 31         [ 2] 1761 	ldw x,#pad+PAD_SIZE-1
      008A43 00               [ 1] 1762 	clr (x)
      000A5B                       1763 itoa_loop:
      008A44 0A C0            [ 1] 1764     ld a,(BASE,sp)
      008A46 00 0A 2B         [ 4] 1765     call divu24_8 ; acc24/A 
      008A49 0E 6B            [ 1] 1766     add a,#'0  ; remainder of division
      008A4B 01 A6            [ 1] 1767     cp a,#'9+1
      008A4D 20 0D            [ 1] 1768     jrmi 2$
      008A4F 01 27            [ 1] 1769     add a,#7 
      008A51 06               [ 2] 1770 2$: decw x
      008A52 5A               [ 1] 1771     ld (x),a
                                   1772 	; if acc24==0 conversion done
      008A53 F7 0A 01         [ 1] 1773 	ld a,acc24
      008A56 20 F6 08         [ 1] 1774 	or a,acc16
      008A58 CA 00 09         [ 1] 1775 	or a,acc8
      008A58 CD 82            [ 1] 1776     jrne itoa_loop
                                   1777 	;conversion done, next add '$' or '-' as required
      008A5A 5E 0D            [ 1] 1778 	ld a,(BASE,sp)
      008A5C 03 27            [ 1] 1779 	cp a,#16
      008A5E 05 A6            [ 1] 1780 	jreq 8$
      008A60 20 CD            [ 1] 1781 	ld a,(SIGN,sp)
      008A62 82 4B            [ 1] 1782     jreq 10$
      008A64 5B 03            [ 1] 1783     ld a,#'-
      008A66 81 02            [ 2] 1784 	jra 9$ 
      008A67 A6 24            [ 1] 1785 8$: ld a,#'$ 
      008A67 52               [ 2] 1786 9$: decw x
      008A68 01               [ 1] 1787     ld (x),a
      000A87                       1788 10$:
      008A69 0F 01            [ 2] 1789 	addw sp,#VSIZE
      008A6B 90               [ 4] 1790 	ret
                                   1791 
                                   1792 ;-------------------------------------
                                   1793 ; divide uint24_t by uint8_t
                                   1794 ; used to convert uint24_t to string
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1795 ; input:
                                   1796 ;	acc24	dividend
                                   1797 ;   A 		divisor
                                   1798 ; output:
                                   1799 ;   acc24	quotient
                                   1800 ;   A		remainder
                                   1801 ;------------------------------------- 
                                   1802 ; offset  on sp of arguments and locals
                           000001  1803 	U8   = 1   ; divisor on stack
                           000001  1804 	VSIZE =1
      000A8A                       1805 divu24_8:
      008A6C AE               [ 2] 1806 	pushw x ; save x
      008A6D 17               [ 1] 1807 	push a 
                                   1808 	; ld dividend UU:MM bytes in X
      008A6E 5F 90 7F         [ 1] 1809 	ld a, acc24
      008A71 C6               [ 1] 1810 	ld xh,a
      008A72 00 07 A1         [ 1] 1811 	ld a,acc24+1
      008A75 0A               [ 1] 1812 	ld xl,a
      008A76 26 06            [ 1] 1813 	ld a,(U8,SP) ; divisor
      008A78 5D               [ 2] 1814 	div x,a ; UU:MM/U8
      008A79 2A               [ 1] 1815 	push a  ;save remainder
      008A7A 03               [ 1] 1816 	ld a,xh
      008A7B 03 01 50         [ 1] 1817 	ld acc24,a
      008A7E 9F               [ 1] 1818 	ld a,xl
      008A7E C6 00 07         [ 1] 1819 	ld acc24+1,a
      008A81 62               [ 1] 1820 	pop a
      008A82 AB               [ 1] 1821 	ld xh,a
      008A83 30 A1 3A         [ 1] 1822 	ld a,acc24+2
      008A86 2B               [ 1] 1823 	ld xl,a
      008A87 02 AB            [ 1] 1824 	ld a,(U8,sp) ; divisor
      008A89 07               [ 2] 1825 	div x,a  ; R:LL/U8
      008A8A 90 5A            [ 1] 1826 	ld (U8,sp),a ; save remainder
      008A8C 90               [ 1] 1827 	ld a,xl
      008A8D F7 5D 26         [ 1] 1828 	ld acc24+2,a
      008A90 ED               [ 1] 1829 	pop a
      008A91 A6               [ 2] 1830 	popw x
      008A92 10               [ 4] 1831 	ret
                                   1832 
                                   1833 ;------------------------------------
                                   1834 ;  two's complement acc24
                                   1835 ;  input:
                                   1836 ;		acc24 variable
                                   1837 ;  output:
                                   1838 ;		acc24 variable
                                   1839 ;-------------------------------------
      000AB2                       1840 neg_acc24:
      008A93 C1 00 07 26      [ 1] 1841 	cpl acc24+2
      008A97 08 A6 24 90      [ 1] 1842 	cpl acc24+1
      008A9B 5A 90 F7 20      [ 1] 1843 	cpl acc24
      008A9F 0A 0D            [ 1] 1844 	ld a,#1
      008AA1 01 27 06         [ 1] 1845 	add a,acc24+2
      008AA4 A6 2D 90         [ 1] 1846 	ld acc24+2,a
      008AA7 5A               [ 1] 1847 	clr a
      008AA8 90 F7 08         [ 1] 1848 	adc a,acc24+1
      008AAA C7 00 08         [ 1] 1849 	ld acc24+1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008AAA 93               [ 1] 1850 	clr a 
      008AAB 1D 17 5F         [ 1] 1851 	adc a,acc24 
      008AAE 50 00 07         [ 1] 1852 	ld acc24,a 
      008AAF 81               [ 4] 1853 	ret
                                   1854 
                                   1855 
                                   1856 ;------------------------------------
                                   1857 ; read a line of text from terminal
                                   1858 ; input:
                                   1859 ;	none
                                   1860 ; local variable on stack:
                                   1861 ;	LL  line length
                                   1862 ;   RXCHAR last received chaaracte 
                                   1863 ; output:
                                   1864 ;   text in tib  buffer
                                   1865 ;------------------------------------
                                   1866 	; local variables
                           000001  1867 	LL_HB=1
                           000001  1868 	RXCHAR = 1 ; last char received
                           000002  1869 	LL = 2  ; accepted line length
                           000002  1870 	VSIZE=2 
      000AD5                       1871 readln:
      008AAF 90               [ 1] 1872 	clrw x 
      008AB0 5A               [ 2] 1873 	pushw x 
      008AB1 A6 20 90 F7      [ 2] 1874  	ldw y,#tib ; input buffer
      000ADB                       1875 readln_loop:
      008AB5 5C 9F C1         [ 4] 1876 	call getc
      008AB8 00 23            [ 1] 1877 	ld (RXCHAR,sp),a
      008ABA 2B F3            [ 1] 1878 	cp a,#CR
      008ABC 26 03            [ 1] 1879 	jrne 1$
      008ABC 93 CD 82         [ 2] 1880 	jp readln_quit
      008ABF 5E 5B            [ 1] 1881 1$:	cp a,#NL
      008AC1 01 81            [ 1] 1882 	jreq readln_quit
      008AC3 A1 08            [ 1] 1883 	cp a,#BSP
      008AC3 52 02            [ 1] 1884 	jreq del_back
      008AC5 6B 02            [ 1] 1885 	cp a,#CTRL_D
      008AC7 0F 01            [ 1] 1886 	jreq del_ln
      008AC9 A1 0A            [ 1] 1887 	cp a,#CTRL_R 
      008ACB 26 0A            [ 1] 1888 	jreq reprint 
                                   1889 ;	cp a,#'[
                                   1890 ;	jreq ansi_seq
      000AF7                       1891 final_test:
      008ACD 72 0F            [ 1] 1892 	cp a,#SPACE
      008ACF 00 08            [ 1] 1893 	jrpl accept_char
      008AD1 05 03            [ 2] 1894 	jra readln_loop
      000AFD                       1895 ansi_seq:
                                   1896 ;	call getc
                                   1897 ;	cp a,#'C 
                                   1898 ;	jreq rigth_arrow
                                   1899 ;	cp a,#'D 
                                   1900 ;	jreq left_arrow 
                                   1901 ;	jra final_test
      000AFD                       1902 right_arrow:
                                   1903 ;	ld a,#BSP 
                                   1904 ;	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1905 ;	jra realn_loop 
      000AFD                       1906 left_arrow:
                                   1907 
                                   1908 ;	jra readln_loop
      000AFD                       1909 reprint: 
      008AD3 01 CD            [ 1] 1910 	tnz (LL,sp)
      008AD5 8B 32            [ 1] 1911 	jrne readln_loop
      008AD7 AE 16 E8         [ 2] 1912 	ldw x,#tib 
      008AD7 AE 17 5F         [ 4] 1913 	call strlen 
      008ADA 7F AE 16 E8      [ 2] 1914 	ldw y,#tib 
      008ADB 9F               [ 1] 1915 	ld a,xl
      008ADB 7B 02            [ 1] 1916 	jreq readln_loop
      008ADD CD 8B            [ 1] 1917 	ld (LL,sp),a 
      008ADF 0A AB 30         [ 2] 1918 	ldw x,#tib 
      008AE2 A1 3A 2B         [ 4] 1919 	call puts
      008AE5 02 AB            [ 1] 1920 	clr (LL_HB,sp)
      008AE7 07 5A F7         [ 2] 1921 	addw y,(LL_HB,sp)
      008AEA C6 00            [ 2] 1922 	jra readln_loop 
      000B1D                       1923 del_ln:
      008AEC 08 CA            [ 1] 1924 	ld a,(LL,sp)
      008AEE 00 09 CA         [ 4] 1925 	call delete
      008AF1 00 0A 26 E6      [ 2] 1926 	ldw y,#tib
      008AF5 7B 02            [ 1] 1927 	clr (y)
      008AF7 A1 10            [ 1] 1928 	clr (LL,sp)
      008AF9 27 08            [ 2] 1929 	jra readln_loop
      000B2C                       1930 del_back:
      008AFB 7B 01            [ 1] 1931     tnz (LL,sp)
      008AFD 27 08            [ 1] 1932     jreq readln_loop
      008AFF A6 2D            [ 1] 1933     dec (LL,sp)
      008B01 20 02            [ 2] 1934     decw y
      008B03 A6 24            [ 1] 1935     clr  (y)
      008B05 5A F7 E8         [ 4] 1936     call bksp 
      008B07 20 A0            [ 2] 1937     jra readln_loop	
      000B3B                       1938 accept_char:
      008B07 5B 02            [ 1] 1939 	ld a,#TIB_SIZE-1
      008B09 81 02            [ 1] 1940 	cp a, (LL,sp)
      008B0A 27 9A            [ 1] 1941 	jreq readln_loop
      008B0A 89 88            [ 1] 1942 	ld a,(RXCHAR,sp)
      008B0C C6 00            [ 1] 1943 	ld (y),a
      008B0E 08 95            [ 1] 1944 	inc (LL,sp)
      008B10 C6 00            [ 2] 1945 	incw y
      008B12 09 97            [ 1] 1946 	clr (y)
      008B14 7B 01 62         [ 4] 1947 	call putc 
      008B17 88 9E            [ 2] 1948 	jra readln_loop
      000B50                       1949 readln_quit:
      008B19 C7 00            [ 1] 1950 	clr (y)
      008B1B 08 9F            [ 1] 1951 	ld a,(LL,sp)
      008B1D C7 00 09         [ 1] 1952 	ld count,a 
      000B57                       1953 	_drop VSIZE 
      008B20 84 95            [ 2]    1     addw sp,#VSIZE 
      008B22 C6 00            [ 1] 1954 	ld a,#CR
      008B24 0A 97 7B         [ 4] 1955 	call putc
      008B27 01               [ 4] 1956 	ret
                                   1957 
                           000001  1958 .if DEBUG 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1959 ;----------------------------
                                   1960 ; command interface
                                   1961 ; only 3 commands:
                                   1962 ;  'q' to resume application
                                   1963 ;  'p [addr]' to print memory values 
                                   1964 ;  's addr' to print string 
                                   1965 ;----------------------------
                                   1966 ;local variable 
                           000001  1967 	PSIZE=1
                           000001  1968 	VSIZE=1 
      000B5F                       1969 cmd_itf:
      008B28 62 6B            [ 2] 1970 	sub sp,#VSIZE 
      008B2A 01 9F C7 00      [ 1] 1971 	clr farptr 
      008B2E 0A 84 85 81      [ 1] 1972 	clr farptr+1 
      008B32 72 5F 00 14      [ 1] 1973 	clr farptr+2  
      000B6D                       1974 repl:
      008B32 72 53            [ 1] 1975 	ld a,#CR 
      008B34 00 0A 72         [ 4] 1976 	call putc 
      008B37 53 00            [ 1] 1977 	ld a,#'? 
      008B39 09 72 53         [ 4] 1978 	call putc
      008B3C 00 08 A6 01      [ 1] 1979 	clr in.w 
      008B40 CB 00 0A C7      [ 1] 1980 	clr in 
      008B44 00 0A 4F         [ 4] 1981 	call readln
      008B47 C9 00 09 C7      [ 2] 1982 	ldw y,#tib  
      008B4B 00 09            [ 1] 1983 	ld a,(y)
      008B4D 4F C9            [ 1] 1984 	jreq repl  
      008B4F 00 08 C7 00      [ 1] 1985 	inc in 
      008B53 08 81 0F         [ 4] 1986 	call to_upper 
      008B55 A1 51            [ 1] 1987 	cp a,#'Q 
      008B55 5F 89            [ 1] 1988 	jrne test_p
      000B95                       1989 repl_exit:
      008B57 90 AE 16 E8      [ 1] 1990 	clr tib 
      008B5B 72 5F 00 03      [ 1] 1991 	clr count 
      008B5B CD 82 54 6B      [ 1] 1992 	clr in 
      000BA1                       1993 	_drop #VSIZE 	
      008B5F 01 A1            [ 2]    1     addw sp,##VSIZE 
      008B61 0D               [ 4] 1994 	ret  
      000BA4                       1995 invalid:
      008B62 26 03 CC         [ 2] 1996 	ldw x,#invalid_cmd 
      008B65 8B D0 A1         [ 4] 1997 	call puts 
      008B68 0A 27            [ 2] 1998 	jra repl 
      000BAC                       1999 test_p:	
      008B6A 65 A1            [ 1] 2000     cp a,#'P 
      008B6C 08 27            [ 1] 2001 	jreq mem_peek
      008B6E 3D A1            [ 1] 2002     cp a,#'S 
      008B70 04 27            [ 1] 2003 	jrne invalid 
      000BB4                       2004 print_string:	
      008B72 2A A1 12         [ 4] 2005 	call get_token
      008B75 27 06            [ 1] 2006 	cp a,#TK_INTGR 
      008B77 26 E9            [ 1] 2007 	jrne invalid 
      008B77 A1 20 2A         [ 4] 2008 	call puts
      008B7A 40 20 DE         [ 2] 2009 	jp repl 	
      008B7D                       2010 mem_peek:
      008B7D A6 20            [ 1] 2011 	ld a,#SPACE 
      008B7D CD 0F C7         [ 4] 2012 	call skip  	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008B7D 72 B9 00 00      [ 2] 2013 	addw y,in.w 
      008B7D 0D 02 26         [ 2] 2014 	ldw x,#pad 
      008B80 DA AE 16         [ 4] 2015 	call strcpy
      008B83 E8 CD 83         [ 4] 2016 	call atoi24 	
      008B86 20 90 AE         [ 1] 2017 	ld a, acc24 
      008B89 16 E8 9F         [ 1] 2018 	or a,acc16 
      008B8C 27 CD 6B         [ 1] 2019 	or a,acc8 
      008B8F 02 AE            [ 1] 2020 	jrne 1$ 
      008B91 16 E8            [ 2] 2021 	jra peek_byte  
      008B93 CD 82 5E         [ 2] 2022 1$:	ldw x,acc24 
      008B96 0F 01 72         [ 2] 2023 	ldw farptr,x 
      008B99 F9 01 20         [ 1] 2024 	ld a,acc8 
      008B9C BE 00 14         [ 1] 2025 	ld farptr+2,a 
      008B9D                       2026 peek_byte:
      008B9D 7B 02 CD         [ 4] 2027 	call print_farptr 
      008BA0 82 78            [ 1] 2028 	ld a,#8 
      008BA2 90 AE            [ 1] 2029 	ld (PSIZE,sp),a 
      008BA4 16               [ 1] 2030 	clrw x 
      008BA5 E8 90 7F         [ 4] 2031 1$:	call fetchc  
      008BA8 0F               [ 2] 2032 	pushw x 
      008BA9 02 20 AF         [ 1] 2033 	ld acc8,a 
      008BAC 5F               [ 1] 2034 	clrw x 
      008BAC 0D 02 27         [ 2] 2035 	ldw acc24,x 
      008BAF AB 0A            [ 1] 2036 	ld a,#16+128
      008BB1 02 90 5A         [ 4] 2037 	call prti24
      008BB4 90               [ 2] 2038 	popw x 
      008BB5 7F CD            [ 1] 2039 	dec (PSIZE,sp)
      008BB7 82 68            [ 1] 2040 	jrne 1$ 
      008BB9 20 A0            [ 1] 2041 	ld a,#8 
      008BBB CB 00 14         [ 1] 2042 	add a,farptr+2 
      008BBB A6 4F 11         [ 1] 2043 	ld farptr+2,a
      008BBE 02               [ 1] 2044 	clr a 
      008BBF 27 9A 7B         [ 1] 2045 	adc a,farptr+1 
      008BC2 01 90 F7         [ 1] 2046 	ld farptr+1,a 
      008BC5 0C               [ 1] 2047 	clr a 
      008BC6 02 90 5C         [ 1] 2048 	adc a,farptr 
      008BC9 90 7F CD         [ 1] 2049 	ld farptr,a 
      008BCC 82 4B 20         [ 2] 2050 	jp repl  
                                   2051 
      008BCF 8B 6F 74 20 61 20 63  2052 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   2053 
                                   2054 ;----------------------------
                                   2055 ; display farptr address
                                   2056 ;----------------------------
      008BD0                       2057 print_farptr:
      008BD0 90 7F 7B         [ 1] 2058 	ld a ,farptr+2 
      008BD3 02 C7 00         [ 1] 2059 	ld acc8,a 
      008BD6 04 5B 02         [ 2] 2060 	ldw x,farptr 
      008BD9 A6 0D CD         [ 2] 2061 	ldw acc24,x 
      008BDC 82               [ 1] 2062 	clrw x 
      008BDD 4B 81            [ 1] 2063 	ld a,#16 
      008BDF CD 09 9F         [ 4] 2064 	call prti24
      008BDF 52 01            [ 1] 2065 	ld a,#SPACE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008BE1 72 5F 00         [ 4] 2066 	call putc 
      008BE4 13 72 5F         [ 4] 2067 	call putc 
      008BE7 00               [ 4] 2068 	ret
                                   2069 
                                   2070 ;------------------------------------
                                   2071 ; get byte at address farptr[X]
                                   2072 ; input:
                                   2073 ;	 farptr   address to peek
                                   2074 ;    X		  farptr index 	
                                   2075 ; output:
                                   2076 ;	 A 		  byte from memory  
                                   2077 ;    x		  incremented by 1
                                   2078 ;------------------------------------
      000C4C                       2079 fetchc: ; @C
      008BE8 14 72 5F 00      [ 5] 2080 	ldf a,([farptr],x)
      008BEC 15               [ 2] 2081 	incw x
      008BED 81               [ 4] 2082 	ret
                                   2083 
                                   2084 
                                   2085 ;------------------------------------
                                   2086 ; expect a number from command line 
                                   2087 ; next argument
                                   2088 ;  input:
                                   2089 ;	  none
                                   2090 ;  output:
                                   2091 ;    acc24   int24_t 
                                   2092 ;------------------------------------
      000C52                       2093 number::
      008BED A6 0D CD         [ 4] 2094 	call get_token
      008BF0 82 4B A6         [ 4] 2095 	call atoi24
      008BF3 3F               [ 4] 2096 	ret
                                   2097 .endif ; DEBUG 
                                   2098 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2099 
                                   2100 
                                   2101 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2102 ;; compiler routines        ;;
                                   2103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2104 ;------------------------------------
                                   2105 ; parse quoted string 
                                   2106 ; input:
                                   2107 ;   Y 	pointer to tib 
                                   2108 ;   X   pointer to pad
                                   2109 ; output:
                                   2110 ;	pad   parsed string
                                   2111 ;   TOS  char* to pad  
                                   2112 ;------------------------------------
                           000001  2113 	PREV = 1
                           000002  2114 	CURR =2 
                           000002  2115 	VSIZE=2 
      000C59                       2116 parse_quote: ; { -- addr }
      000C59                       2117 	_vars VSIZE 
      008BF4 CD 82            [ 2]    1     sub sp,#VSIZE 
      008BF6 4B               [ 1] 2118 	clr a
      008BF7 72 5F            [ 1] 2119 1$:	ld (PREV,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008BF9 00 01 72 5F      [ 1] 2120 2$:	inc in
      008BFD 00 02 CD         [ 4] 2121 	ld a,([in.w],y)
      008C00 8B 55            [ 1] 2122 	jreq 6$
      008C02 90 AE            [ 1] 2123 	ld (CURR,sp),a 
      008C04 16 E8            [ 1] 2124 	ld a,#'\
      008C06 90 F6            [ 1] 2125 	cp a, (PREV,sp)
      008C08 27 E3            [ 1] 2126 	jrne 3$
      008C0A 72 5C            [ 1] 2127 	clr (PREV,sp)
      008C0C 00 02            [ 1] 2128 	ld a,(CURR,sp)
      008C0E CD 8F            [ 4] 2129 	callr convert_escape
      008C10 8F               [ 1] 2130 	ld (x),a 
      008C11 A1               [ 2] 2131 	incw x 
      008C12 51 26            [ 2] 2132 	jra 2$
      000C79                       2133 3$:
      008C14 17 02            [ 1] 2134 	ld a,(CURR,sp)
      008C15 A1 5C            [ 1] 2135 	cp a,#'\'
      008C15 72 5F            [ 1] 2136 	jreq 1$
      008C17 16 E8            [ 1] 2137 	cp a,#'"
      008C19 72 5F            [ 1] 2138 	jreq 5$ 
      008C1B 00               [ 1] 2139 	ld (x),a 
      008C1C 04               [ 2] 2140 	incw x 
      008C1D 72 5F            [ 2] 2141 	jra 2$
      008C1F 00 02 5B 01      [ 1] 2142 5$:	inc in 
      008C23 81               [ 1] 2143 6$: clr (x)
      008C24 AE 17 38         [ 2] 2144 	ldw x,#pad 
      000C8F                       2145 	_drop VSIZE
      008C24 AE 8C            [ 2]    1     addw sp,#VSIZE 
      008C26 A2 CD            [ 1] 2146 	ld a,#TK_QSTR  
      008C28 82               [ 4] 2147 	ret 
                                   2148 
                                   2149 ;---------------------------------------
                                   2150 ; called by parse_quote
                                   2151 ; subtitute escaped character 
                                   2152 ; by their ASCII value .
                                   2153 ; input:
                                   2154 ;   A  character following '\'
                                   2155 ; output:
                                   2156 ;   A  substitued char or same if not valid.
                                   2157 ;---------------------------------------
      000C94                       2158 convert_escape:
      008C29 5E               [ 2] 2159 	pushw x 
      008C2A 20 C1 A9         [ 2] 2160 	ldw x,#escaped 
      008C2C F1               [ 1] 2161 1$:	cp a,(x)
      008C2C A1 50            [ 1] 2162 	jreq 2$
      008C2E 27               [ 1] 2163 	tnz (x)
      008C2F 11 A1            [ 1] 2164 	jreq 3$
      008C31 53               [ 2] 2165 	incw x 
      008C32 26 F0            [ 2] 2166 	jra 1$
      008C34 1D 0C A9         [ 2] 2167 2$: subw x,#escaped 
      008C34 CD               [ 1] 2168 	ld a,xl 
      008C35 8D CE            [ 1] 2169 	add a,#7
      008C37 A1               [ 2] 2170 3$:	popw x 
      008C38 04               [ 4] 2171 	ret 
                                   2172 
      008C39 26 E9 CD 82 5E CC 8B  2173 escaped: .asciz "abtnvfr"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal  ED-Bits]



             00
                                   2174 
                                   2175 ;-------------------------
                                   2176 ; integer parser 
                                   2177 ; input:
                                   2178 ;   X 		point to pad 
                                   2179 ;   Y 		point to tib 
                                   2180 ;   A 	    first digit|'$' 
                                   2181 ; output:  
                                   2182 ;   pad     number string 
                                   2183 ;   X 		integer 
                                   2184 ;   A 		TK_INTGR
                                   2185 ;-------------------------
                           000001  2186 	BASE=1
                           000002  2187 	TCHAR=2 
                           000002  2188 	VSIZE=2 
      008C41                       2189 parse_integer: ; { -- n }
      008C41 A6 20            [ 1] 2190 	push #0 ; TCHAR 
      008C43 CD 90            [ 1] 2191 	cp a,#'$
      008C45 47 72            [ 1] 2192 	jreq 1$ 
      008C47 B9 00            [ 1] 2193 	push #10 ; BASE=10 
      008C49 01 AE            [ 2] 2194 	jra 2$ 
      008C4B 17 38            [ 1] 2195 1$: push #16  ; BASE=16
      008C4D CD               [ 1] 2196 2$:	ld (x),a 
      008C4E 83               [ 2] 2197 	incw x 
      008C4F 3E CD 8F 9B      [ 1] 2198 	inc in 
      008C53 C6 00 08         [ 4] 2199 	ld a,([in.w],y)
      008C56 CA 00 09         [ 4] 2200 	call to_upper 
      008C59 CA 00            [ 1] 2201 	ld (TCHAR,sp),a 
      008C5B 0A 26 02         [ 4] 2202 	call is_digit 
      008C5E 20 0C            [ 1] 2203 	jrc 2$
      008C60 CE 00            [ 1] 2204 	ld a,#16 
      008C62 08 CF            [ 1] 2205 	cp a,(BASE,sp)
      008C64 00 13            [ 1] 2206 	jrne 3$ 
      008C66 C6 00            [ 1] 2207 	ld a,(TCHAR,sp)
      008C68 0A C7            [ 1] 2208 	cp a,#'A 
      008C6A 00 15            [ 1] 2209 	jrmi 3$ 
      008C6C A1 47            [ 1] 2210 	cp a,#'G 
      008C6C CD 8C            [ 1] 2211 	jrmi 2$ 
      008C6E B1               [ 1] 2212 3$:	clr (x)
      008C6F A6 08 6B         [ 4] 2213 	call atoi24
      008C72 01 5F CD         [ 2] 2214 	ldw x,acc16 
      008C75 8C CC            [ 1] 2215 	ld a,#TK_INTGR
      000CE9                       2216 	_drop VSIZE  
      008C77 89 C7            [ 2]    1     addw sp,#VSIZE 
      008C79 00               [ 4] 2217 	ret 	
                                   2218 
                                   2219 ;-------------------------
                                   2220 ; binary integer parser 
                                   2221 ; input:
                                   2222 ;   X 		point to pad 
                                   2223 ;   Y 		point to tib 
                                   2224 ;   A 	    '%' 
                                   2225 ; output:  
                                   2226 ;   pad     number string 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2227 ;   X 		integer 
                                   2228 ;   A 		TK_INTGR
                                   2229 ;   TOS     integer 
                                   2230 ;-------------------------
                           000001  2231 	BINARY=1
                           000002  2232 	VSIZE=2
      000CEC                       2233 parse_binary: ; { -- n }
      008C7A 0A 5F            [ 1] 2234 	push #0
      008C7C CF 00            [ 1] 2235 	push #0
      008C7E 08               [ 1] 2236 1$: ld (x),a 
      008C7F A6               [ 2] 2237 	incw x 
      008C80 90 CD 8A 1F      [ 1] 2238 	inc in 
      008C84 85 0A 01         [ 4] 2239 	ld a,([in.w],y)
      008C87 26 EB            [ 1] 2240 	cp a,#'0 
      008C89 A6 08            [ 1] 2241 	jreq 2$
      008C8B CB 00            [ 1] 2242 	cp a,#'1 
      008C8D 15 C7            [ 1] 2243 	jreq 2$ 
      008C8F 00 15            [ 2] 2244 	jra bin_exit 
      008C91 4F C9            [ 1] 2245 2$: sub a,#'0	
      008C93 00               [ 1] 2246 	rrc a 
      008C94 14 C7            [ 1] 2247 	rlc (BINARY+1,sp)
      008C96 00 14            [ 1] 2248 	rlc (BINARY,sp)
      008C98 4F C9            [ 2] 2249 	jra 1$  
      000D0C                       2250 bin_exit:
      008C9A 00               [ 1] 2251 	clr (x)
      008C9B 13 C7            [ 2] 2252 	ldw x,(BINARY,sp)
      008C9D 00 13            [ 1] 2253 	ld a,#TK_INTGR 	
      000D11                       2254 	_drop VSIZE 
      008C9F CC 8B            [ 2]    1     addw sp,#VSIZE 
      008CA1 ED               [ 4] 2255 	ret
                                   2256 
                                   2257 ;---------------------------
                                   2258 ;  token begin with a letter,
                                   2259 ;  is keyword or variable. 	
                                   2260 ; input:
                                   2261 ;   X 		point to pad 
                                   2262 ;   Y 		point to text
                                   2263 ;   A 	    first letter  
                                   2264 ; output:
                                   2265 ;   X		exec_addr|var_addr 
                                   2266 ;   A 		TK_CMD 
                                   2267 ;   pad 	keyword|var_name  
                                   2268 ;   TOS     exec_addr|var_addr 
                                   2269 ;--------------------------  
      000D14                       2270 parse_keyword: ; { -- exec_addr|var_addr}
      008CA2 6E 6F 74         [ 4] 2271 	call to_upper 
      008CA5 20               [ 1] 2272 	ld (x),a 
      008CA6 61               [ 2] 2273 	incw x 
      008CA7 20 63 6F 6D      [ 1] 2274 	inc in 
      008CAB 6D 61 6E         [ 4] 2275 	ld a,([in.w],y)
      008CAE 64 0A 00         [ 4] 2276 	call is_alpha 
      008CB1 25 EF            [ 1] 2277 	jrc parse_keyword 
      008CB1 C6               [ 1] 2278 1$: clr (x)
      008CB2 00 15 C7 00      [ 1] 2279 	tnz pad+1 
      008CB6 0A CE            [ 1] 2280 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2281 ; one letter variable name 
      008CB8 00 13 CF         [ 1] 2282 	ld a,pad 
      008CBB 00 08            [ 1] 2283 	sub a,#'A 
      008CBD 5F               [ 1] 2284 	sll a 
      008CBE A6               [ 1] 2285 	push a 
      008CBF 10 CD            [ 1] 2286 	push #0
      008CC1 8A 1F A6         [ 2] 2287 	ldw x,#vars 
      008CC4 20 CD 82         [ 2] 2288 	addw x,(1,sp) ; X=var address 
      000D3B                       2289 	_drop 2 
      008CC7 4B CD            [ 2]    1     addw sp,#2 
      008CC9 82 4B            [ 1] 2290 	ld a,#TK_VAR 
      008CCB 81 0C            [ 2] 2291 	jra 4$ 
      008CCC                       2292 2$: ; check for keyword, otherwise syntax error.
      000D41                       2293 	_ldx_dict kword_dict
      008CCC 92 AF 00         [ 2]    1     ldw x,#kword_dict+2
      008CCF 13 5C 81         [ 4] 2294 	call search_dict
      008CD2 4D               [ 1] 2295 	tnz a
      008CD2 CD 8D            [ 1] 2296 	jrne 4$ 
      008CD4 CE CD 8F         [ 2] 2297 	jp syntax_error
      008CD7 9B               [ 4] 2298 4$:	ret  	
                                   2299 
                                   2300 
                                   2301 ;------------------------------------
                                   2302 ; scan text for next token
                                   2303 ; move token in 'pad'
                                   2304 ; input: 
      000D4E                       2305 	none: 
                                   2306 ; use:
                                   2307 ;	Y   pointer to text
                                   2308 ;   X	pointer to pad 
                                   2309 ;   in.w   index in text buffer
                                   2310 ; output:
                                   2311 ;   A       token attribute 
                                   2312 ;   pad 	token as .asciz
                                   2313 ;   X 		token value   
                                   2314 ;------------------------------------
                                   2315 	; use to check special character 
                                   2316 	.macro _case c t  
                                   2317 	ld a,#c 
                                   2318 	cp a,(TCHAR,sp) 
                                   2319 	jrne t
                                   2320 	.endm 
                                   2321 
                           000001  2322 	TCHAR=1
                           000002  2323 	ATTRIB=2 
                           000002  2324 	VSIZE=2
      000D4E                       2325 get_token: 
      008CD8 81 AE 16 E8      [ 2] 2326 	ldw y,#tib    	
      008CD9 C6 00 01         [ 1] 2327 	ld a,in 
      008CD9 52 02 4F         [ 1] 2328 	cp a,count 
      008CDC 6B 01            [ 1] 2329 	jrmi 1$
      008CDE 72 5C            [ 1] 2330 	ld a,#TK_NONE 
      008CE0 00               [ 4] 2331 	ret 
      000D5D                       2332 1$:	
      000D5D                       2333 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008CE1 02 91            [ 2]    1     sub sp,#VSIZE 
      008CE3 D6 01 27         [ 2] 2334 	ldw x, #pad
      008CE6 24 6B            [ 1] 2335 	ld a,#SPACE
      008CE8 02 A6 5C         [ 4] 2336 	call skip
      008CEB 11 01 26 0A 0F   [ 1] 2337 	mov in.saved,in 
      008CF0 01 7B 02         [ 4] 2338 	ld a,([in.w],y)
      008CF3 AD 1F            [ 1] 2339 	jrne str_tst
      008CF5 F7 5C 20 E5      [ 1] 2340 	clr pad 
      008CF9 CC 0F 03         [ 2] 2341 	jp token_exit ; end of line 
                                   2342 
      000D78                       2343 str_tst: ; check for quoted string  	
      008CF9 7B 02 A1         [ 4] 2344 	call to_upper 
      008CFC 5C 27            [ 1] 2345 	ld (TCHAR,sp),a 
      000D7D                       2346 	_case '"' nbr_tst
      008CFE DD A1            [ 1]    1 	ld a,#'"' 
      008D00 22 27            [ 1]    2 	cp a,(TCHAR,sp) 
      008D02 04 F7            [ 1]    3 	jrne nbr_tst
      008D04 5C 20 D7         [ 4] 2347 	call parse_quote
      008D07 72 5C 00         [ 2] 2348 	jp token_exit
      000D89                       2349 nbr_tst: ; check for number 
      008D0A 02 7F            [ 1] 2350 	ld a,#'$'
      008D0C AE 17            [ 1] 2351 	cp a,(TCHAR,sp) 
      008D0E 38 5B            [ 1] 2352 	jreq 1$
      008D10 02 A6            [ 1] 2353 	ld a,#'&
      008D12 0A 81            [ 1] 2354 	cp a,(TCHAR,sp)
      008D14 26 06            [ 1] 2355 	jrne 0$
      008D14 89 AE 8D         [ 4] 2356 	call parse_binary ; expect binary integer 
      008D17 29 F1 27         [ 2] 2357 	jp token_exit 
      008D1A 06 7D            [ 1] 2358 0$:	ld a,(TCHAR,sp)
      008D1C 27 09 5C         [ 4] 2359 	call is_digit
      008D1F 20 F7            [ 1] 2360 	jrnc 3$
      008D21 1D 8D 29         [ 4] 2361 1$:	call parse_integer 
      008D24 9F AB 07         [ 2] 2362 	jp token_exit 
      000DA8                       2363 3$: 
      000DA8                       2364 	_case '(' bkslsh_tst 
      008D27 85 81            [ 1]    1 	ld a,#'(' 
      008D29 61 62            [ 1]    2 	cp a,(TCHAR,sp) 
      008D2B 74 6E            [ 1]    3 	jrne bkslsh_tst
      008D2D 76 66            [ 1] 2365 	ld a,#TK_LPAREN
      008D2F 72 00 F3         [ 2] 2366 	jp token_char   	
      008D31                       2367 bkslsh_tst: ; character token 
      000DB3                       2368 	_case '\',rparnt_tst
      008D31 4B 00            [ 1]    1 	ld a,#'\' 
      008D33 A1 24            [ 1]    2 	cp a,(TCHAR,sp) 
      008D35 27 04            [ 1]    3 	jrne rparnt_tst
      008D37 4B 0A            [ 1] 2369 	ld a,(TCHAR,sp)
      008D39 20               [ 1] 2370 	ld (x),a 
      008D3A 02               [ 2] 2371 	incw x 
      008D3B 4B 10 F7 5C      [ 1] 2372 	inc in 
      008D3F 72 5C 00         [ 4] 2373 	ld a,([in.w],y)
      008D42 02               [ 1] 2374 	ld (x),a 
      008D43 91               [ 2] 2375 	incw x 
      008D44 D6 01 CD 8F      [ 1] 2376 	inc in  
      008D48 8F               [ 1] 2377 	clr (x) 
      008D49 6B               [ 1] 2378 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008D4A 02 CD            [ 1] 2379 	ld a,#TK_CHAR 
      008D4C 8F 86 25         [ 2] 2380 	jp token_exit 
      000DD1                       2381 rparnt_tst:		
      000DD1                       2382 	_case ')' colon_tst 
      008D4F ED A6            [ 1]    1 	ld a,#')' 
      008D51 10 11            [ 1]    2 	cp a,(TCHAR,sp) 
      008D53 01 26            [ 1]    3 	jrne colon_tst
      008D55 0A 7B            [ 1] 2383 	ld a,#TK_RPAREN 
      008D57 02 A1 41         [ 2] 2384 	jp token_char 
      000DDC                       2385 colon_tst:
      000DDC                       2386 	_case ':' comma_tst 
      008D5A 2B 04            [ 1]    1 	ld a,#':' 
      008D5C A1 47            [ 1]    2 	cp a,(TCHAR,sp) 
      008D5E 2B DD            [ 1]    3 	jrne comma_tst
      008D60 7F CD            [ 1] 2387 	ld a,#TK_COLON 
      008D62 8F 9B CE         [ 2] 2388 	jp token_char 
      000DE7                       2389 comma_tst:
      000DE7                       2390 	_case COMMA sharp_tst 
      008D65 00 09            [ 1]    1 	ld a,#COMMA 
      008D67 A6 04            [ 1]    2 	cp a,(TCHAR,sp) 
      008D69 5B 02            [ 1]    3 	jrne sharp_tst
      008D6B 81 0D            [ 1] 2391 	ld a,#TK_COMMA
      008D6C CC 0E F3         [ 2] 2392 	jp token_char
      000DF2                       2393 sharp_tst:
      000DF2                       2394 	_case SHARP dash_tst 
      008D6C 4B 00            [ 1]    1 	ld a,#SHARP 
      008D6E 4B 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008D70 F7 5C            [ 1]    3 	jrne dash_tst
      008D72 72 5C            [ 1] 2395 	ld a,#TK_SHARP
      008D74 00 02 91         [ 2] 2396 	jp token_char  	 	 
      000DFD                       2397 dash_tst: 	
      000DFD                       2398 	_case '-' at_tst 
      008D77 D6 01            [ 1]    1 	ld a,#'-' 
      008D79 A1 30            [ 1]    2 	cp a,(TCHAR,sp) 
      008D7B 27 06            [ 1]    3 	jrne at_tst
      008D7D A1 31            [ 1] 2399 	ld a,#TK_MINUS  
      008D7F 27 02 20         [ 2] 2400 	jp token_char 
      000E08                       2401 at_tst:
      000E08                       2402 	_case '@' qmark_tst 
      008D82 09 A0            [ 1]    1 	ld a,#'@' 
      008D84 30 46            [ 1]    2 	cp a,(TCHAR,sp) 
      008D86 09 02            [ 1]    3 	jrne qmark_tst
      008D88 09 01            [ 1] 2403 	ld a,#TK_ARRAY 
      008D8A 20 E4 F3         [ 2] 2404 	jp token_char
      008D8C                       2405 qmark_tst:
      000E13                       2406 	_case '?' tick_tst 
      008D8C 7F 1E            [ 1]    1 	ld a,#'?' 
      008D8E 01 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D90 04 5B            [ 1]    3 	jrne tick_tst
      008D92 02 81            [ 1] 2407 	ld a,(TCHAR,sp)
      008D94 F7               [ 1] 2408 	ld (x),a 
      008D94 CD               [ 2] 2409 	incw x 
      008D95 8F               [ 1] 2410 	clr (x)
      008D96 8F F7 5C 72      [ 1] 2411 	inc in 
      008D9A 5C 00            [ 1] 2412 	ld a,#TK_CMD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D9C 02 91 D6         [ 2] 2413 	ldw x,#print 
      008D9F 01 CD 85         [ 2] 2414 	jp token_exit
      000E2A                       2415 tick_tst: ; ignore comment 
      000E2A                       2416 	_case TICK plus_tst 
      008DA2 A3 25            [ 1]    1 	ld a,#TICK 
      008DA4 EF 7F            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA6 72 5D            [ 1]    3 	jrne plus_tst
      008DA8 17 39 26 15      [ 1] 2417 	inc in 
      008DAC C6 17            [ 1] 2418 	ld a,#TK_CMD 
      008DAE 38 A0 41         [ 2] 2419 	ldw x,#rem 
      008DB1 48 88 4B         [ 2] 2420 	jp token_exit 
      000E3C                       2421 plus_tst:
      000E3C                       2422 	_case '+' star_tst 
      008DB4 00 AE            [ 1]    1 	ld a,#'+' 
      008DB6 00 25            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB8 72 FB            [ 1]    3 	jrne star_tst
      008DBA 01 5B            [ 1] 2423 	ld a,#TK_PLUS  
      008DBC 02 A6 05         [ 2] 2424 	jp token_char 
      000E47                       2425 star_tst:
      000E47                       2426 	_case '*' slash_tst 
      008DBF 20 0C            [ 1]    1 	ld a,#'*' 
      008DC1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC1 AE A6            [ 1]    3 	jrne slash_tst
      008DC3 93 CD            [ 1] 2427 	ld a,#TK_MULT 
      008DC5 92 02 4D         [ 2] 2428 	jp token_char 
      000E52                       2429 slash_tst: 
      000E52                       2430 	_case '/' prcnt_tst 
      008DC8 26 03            [ 1]    1 	ld a,#'/' 
      008DCA CC 88            [ 1]    2 	cp a,(TCHAR,sp) 
      008DCC 09 81            [ 1]    3 	jrne prcnt_tst
      008DCE A6 21            [ 1] 2431 	ld a,#TK_DIV 
      008DCE CC 0E F3         [ 2] 2432 	jp token_char 
      000E5D                       2433 prcnt_tst:
      000E5D                       2434 	_case '%' eql_tst 
      008DCE 90 AE            [ 1]    1 	ld a,#'%' 
      008DD0 16 E8            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD2 C6 00            [ 1]    3 	jrne eql_tst
      008DD4 02 C1            [ 1] 2435 	ld a,#TK_MOD
      008DD6 00 04 2B         [ 2] 2436 	jp token_char  
                                   2437 ; 1 or 2 character tokens 	
      000E68                       2438 eql_tst:
      000E68                       2439 	_case '=' gt_tst 		
      008DD9 03 A6            [ 1]    1 	ld a,#'=' 
      008DDB 00 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008DDD 26 05            [ 1]    3 	jrne gt_tst
      008DDD 52 02            [ 1] 2440 	ld a,#TK_EQUAL
      008DDF AE 17 38         [ 2] 2441 	jp token_char 
      000E73                       2442 gt_tst:
      000E73                       2443 	_case '>' lt_tst 
      008DE2 A6 20            [ 1]    1 	ld a,#'>' 
      008DE4 CD 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE6 47 55            [ 1]    3 	jrne lt_tst
      008DE8 00 02            [ 1] 2444 	ld a,#TK_GT 
      008DEA 00 03            [ 1] 2445 	ld (ATTRIB,sp),a 
      008DEC 91 D6 01 26      [ 1] 2446 	inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008DF0 07 72 5F         [ 4] 2447 	ld a,([in.w],y)
      008DF3 17 38            [ 1] 2448 	cp a,#'=
      008DF5 CC 8F            [ 1] 2449 	jrne 1$
      008DF7 83 01            [ 1] 2450 	ld a,(TCHAR,sp)
      008DF8 F7               [ 1] 2451 	ld (x),a
      008DF8 CD               [ 2] 2452 	incw x 
      008DF9 8F 8F            [ 1] 2453 	ld a,#'=
      008DFB 6B 01            [ 1] 2454 	ld (TCHAR,sp),a 
      008DFD A6 22            [ 1] 2455 	ld a,#TK_GE 
      008DFF 11 01            [ 2] 2456 	jra token_char  
      008E01 26 06            [ 1] 2457 1$: cp a,#'<
      008E03 CD 8C            [ 1] 2458 	jrne 2$
      008E05 D9 CC            [ 1] 2459 	ld a,(TCHAR,sp)
      008E07 8F               [ 1] 2460 	ld (x),a
      008E08 83               [ 2] 2461 	incw x 
      008E09 A6 3C            [ 1] 2462 	ld a,#'<	
      008E09 A6 24            [ 1] 2463 	ld (TCHAR,sp),a 
      008E0B 11 01            [ 1] 2464 	ld a,#TK_NE 
      008E0D 27 13            [ 2] 2465 	jra token_char 
      008E0F A6 26 11 01      [ 1] 2466 2$: dec in
      008E13 26 06            [ 1] 2467 	ld a,(ATTRIB,sp)
      008E15 CD 8D            [ 2] 2468 	jra token_char 
      000EAC                       2469 lt_tst:
      000EAC                       2470 	_case '<' other
      008E17 6C CC            [ 1]    1 	ld a,#'<' 
      008E19 8F 83            [ 1]    2 	cp a,(TCHAR,sp) 
      008E1B 7B 01            [ 1]    3 	jrne other
      008E1D CD 8F            [ 1] 2471 	ld a,#TK_LT 
      008E1F 86 24            [ 1] 2472 	ld (ATTRIB,sp),a 
      008E21 06 CD 8D 31      [ 1] 2473 	inc in 
      008E25 CC 8F 83         [ 4] 2474 	ld a,([in.w],y)
      008E28 A1 3D            [ 1] 2475 	cp a,#'=
      008E28 A6 28            [ 1] 2476 	jrne 1$
      008E2A 11 01            [ 1] 2477 	ld a,(TCHAR,sp)
      008E2C 26               [ 1] 2478 	ld (x),a 
      008E2D 05 A6            [ 1] 2479 	ld a,#'=
      008E2F 0B CC            [ 1] 2480 	ld (TCHAR,sp),a 
      008E31 8F 73            [ 1] 2481 	ld a,#TK_LE 
      008E33 20 27            [ 2] 2482 	jra token_char 
      008E33 A6 5C            [ 1] 2483 1$: cp a,#'>
      008E35 11 01            [ 1] 2484 	jrne 2$
      008E37 26 18            [ 1] 2485 	ld a,(TCHAR,sp)
      008E39 7B               [ 1] 2486 	ld (x),a 
      008E3A 01               [ 2] 2487 	incw x 
      008E3B F7 5C            [ 1] 2488 	ld a,#'>
      008E3D 72 5C            [ 1] 2489 	ld (TCHAR,sp),a 
      008E3F 00 02            [ 1] 2490 	ld a,#TK_NE 
      008E41 91 D6            [ 2] 2491 	jra token_char 
      008E43 01 F7 5C 72      [ 1] 2492 2$: dec in 
      008E47 5C 00            [ 1] 2493 	ld a,(ATTRIB,sp)
      008E49 02 7F            [ 2] 2494 	jra token_char 	
      000EE4                       2495 other: ; not a special character 	 
      008E4B 97 A6            [ 1] 2496 	ld a,(TCHAR,sp)
      008E4D 03 CC 8F         [ 4] 2497 	call is_alpha 
      008E50 83 03            [ 1] 2498 	jrc 30$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008E51 CC 07 89         [ 2] 2499 	jp syntax_error 
      000EEE                       2500 30$: 
      008E51 A6 29 11         [ 4] 2501 	call parse_keyword
      008E54 01 26            [ 2] 2502 	jra token_exit 
      000EF3                       2503 token_char:
      008E56 05 A6            [ 1] 2504 	ld (ATTRIB,sp),a 
      008E58 0C CC            [ 1] 2505 	ld a,(TCHAR,sp)
      008E5A 8F               [ 1] 2506 	ld (x),a 
      008E5B 73               [ 2] 2507 	incw x 
      008E5C 7F               [ 1] 2508 	clr(x)
      008E5C A6 3A 11 01      [ 1] 2509 	inc in 
      008E60 26 05            [ 1] 2510 	ld a,(ATTRIB,sp)
      008E62 A6 01 CC         [ 2] 2511 	ldw x,#pad 
      000F03                       2512 token_exit:
      000F03                       2513 	_drop VSIZE 
      008E65 8F 73            [ 2]    1     addw sp,#VSIZE 
      008E67 81               [ 4] 2514 	ret
                                   2515 
                                   2516 ;------------------------------------
                                   2517 ; check if character in {'0'..'9'}
                                   2518 ; input:
                                   2519 ;    A  character to test
                                   2520 ; output:
                                   2521 ;    Carry  0 not digit | 1 digit
                                   2522 ;------------------------------------
      000F06                       2523 is_digit:
      008E67 A6 2C            [ 1] 2524 	cp a,#'0
      008E69 11 01            [ 1] 2525 	jrc 1$
      008E6B 26 05            [ 1] 2526     cp a,#'9+1
      008E6D A6               [ 1] 2527 	ccf 
      008E6E 0D               [ 1] 2528 1$:	ccf 
      008E6F CC               [ 4] 2529     ret
                                   2530 
                                   2531 ;------------------------------------
                                   2532 ; convert alpha to uppercase
                                   2533 ; input:
                                   2534 ;    a  character to convert
                                   2535 ; output:
                                   2536 ;    a  uppercase character
                                   2537 ;------------------------------------
      000F0F                       2538 to_upper::
      008E70 8F 73            [ 1] 2539 	cp a,#'a
      008E72 2A 01            [ 1] 2540 	jrpl 1$
      008E72 A6               [ 4] 2541 0$:	ret
      008E73 23 11            [ 1] 2542 1$: cp a,#'z	
      008E75 01 26            [ 1] 2543 	jrugt 0$
      008E77 05 A6            [ 1] 2544 	sub a,#32
      008E79 0E               [ 4] 2545 	ret
                                   2546 	
                                   2547 ;------------------------------------
                                   2548 ; convert pad content in integer
                                   2549 ; input:
                                   2550 ;    pad		.asciz to convert
                                   2551 ; output:
                                   2552 ;    acc24      int24_t
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2553 ;------------------------------------
                                   2554 	; local variables
                           000001  2555 	SIGN=1 ; 1 byte, 
                           000002  2556 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2557 	TEMP=3 ; 1 byte, temporary storage
                           000003  2558 	VSIZE=3 ; 3 bytes reserved for local storage
      000F1B                       2559 atoi24:
      008E7A CC               [ 2] 2560 	pushw x ;save x
      008E7B 8F 73            [ 2] 2561 	sub sp,#VSIZE
                                   2562 	; acc24=0 
      008E7D 72 5F 00 07      [ 1] 2563 	clr acc24    
      008E7D A6 2D 11 01      [ 1] 2564 	clr acc16
      008E81 26 05 A6 11      [ 1] 2565 	clr acc8 
      008E85 CC 8F 73         [ 1] 2566 	ld a, pad 
      008E88 27 5A            [ 1] 2567 	jreq atoi_exit
      008E88 A6 40            [ 1] 2568 	clr (SIGN,sp)
      008E8A 11 01            [ 1] 2569 	ld a,#10
      008E8C 26 05            [ 1] 2570 	ld (BASE,sp),a ; default base decimal
      008E8E A6 02 CC         [ 2] 2571 	ldw x,#pad ; pointer to string to convert
      008E91 8F               [ 1] 2572 	ld a,(x)
      008E92 73 47            [ 1] 2573 	jreq 9$  ; completed if 0
      008E93 A1 2D            [ 1] 2574 	cp a,#'-
      008E93 A6 3F            [ 1] 2575 	jrne 1$
      008E95 11 01            [ 1] 2576 	cpl (SIGN,sp)
      008E97 26 11            [ 2] 2577 	jra 2$
      008E99 7B 01            [ 1] 2578 1$: cp a,#'$
      008E9B F7 5C            [ 1] 2579 	jrne 3$
      008E9D 7F 72            [ 1] 2580 	ld a,#16
      008E9F 5C 00            [ 1] 2581 	ld (BASE,sp),a
      008EA1 02               [ 2] 2582 2$:	incw x
      008EA2 A6               [ 1] 2583 	ld a,(x)
      000F4D                       2584 3$:	
      008EA3 06 AE            [ 1] 2585 	cp a,#'a
      008EA5 96 AE            [ 1] 2586 	jrmi 4$
      008EA7 CC 8F            [ 1] 2587 	sub a,#32
      008EA9 83 30            [ 1] 2588 4$:	cp a,#'0
      008EAA 2B 2B            [ 1] 2589 	jrmi 9$
      008EAA A6 27            [ 1] 2590 	sub a,#'0
      008EAC 11 01            [ 1] 2591 	cp a,#10
      008EAE 26 0C            [ 1] 2592 	jrmi 5$
      008EB0 72 5C            [ 1] 2593 	sub a,#7
      008EB2 00 02            [ 1] 2594 	cp a,(BASE,sp)
      008EB4 A6 06            [ 1] 2595 	jrpl 9$
      008EB6 AE 97            [ 1] 2596 5$:	ld (TEMP,sp),a
      008EB8 AA CC            [ 1] 2597 	ld a,(BASE,sp)
      008EBA 8F 83 8D         [ 4] 2598 	call mulu24_8
      008EBC 7B 03            [ 1] 2599 	ld a,(TEMP,sp)
      008EBC A6 2B 11         [ 1] 2600 	add a,acc24+2
      008EBF 01 26 05         [ 1] 2601 	ld acc24+2,a
      008EC2 A6               [ 1] 2602 	clr a
      008EC3 10 CC 8F         [ 1] 2603 	adc a,acc24+1
      008EC6 73 00 08         [ 1] 2604 	ld acc24+1,a
      008EC7 4F               [ 1] 2605 	clr a
      008EC7 A6 2A 11         [ 1] 2606 	adc a,acc24
      008ECA 01 26 05         [ 1] 2607 	ld acc24,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008ECD A6 20            [ 2] 2608 	jra 2$
      008ECF CC 8F            [ 1] 2609 9$:	tnz (SIGN,sp)
      008ED1 73 03            [ 1] 2610     jreq atoi_exit
      008ED2 CD 0A B2         [ 4] 2611     call neg_acc24
      000F89                       2612 atoi_exit: 
      008ED2 A6 2F            [ 2] 2613 	addw sp,#VSIZE
      008ED4 11               [ 2] 2614 	popw x ; restore x
      008ED5 01               [ 4] 2615 	ret
                                   2616 
                                   2617 ;--------------------------------------
                                   2618 ; unsigned multiply uint24_t by uint8_t
                                   2619 ; use to convert numerical string to uint24_t
                                   2620 ; input:
                                   2621 ;	acc24	uint24_t 
                                   2622 ;   A		uint8_t
                                   2623 ; output:
                                   2624 ;   acc24   A*acc24
                                   2625 ;-------------------------------------
                                   2626 ; local variables offset  on sp
                           000003  2627 	U8   = 3   ; A pushed on stack
                           000002  2628 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2629 	OVFH = 1  ; multiplication overflow high byte
                           000003  2630 	VSIZE = 3
      000F8D                       2631 mulu24_8:
      008ED6 26               [ 2] 2632 	pushw x    ; save X
                                   2633 	; local variables
      008ED7 05               [ 1] 2634 	push a     ; U8
      008ED8 A6               [ 1] 2635 	clrw x     ; initialize overflow to 0
      008ED9 21               [ 2] 2636 	pushw x    ; multiplication overflow
                                   2637 ; multiply low byte.
      008EDA CC 8F 73         [ 1] 2638 	ld a,acc24+2
      008EDD 97               [ 1] 2639 	ld xl,a
      008EDD A6 25            [ 1] 2640 	ld a,(U8,sp)
      008EDF 11               [ 4] 2641 	mul x,a
      008EE0 01               [ 1] 2642 	ld a,xl
      008EE1 26 05 A6         [ 1] 2643 	ld acc24+2,a
      008EE4 22               [ 1] 2644 	ld a, xh
      008EE5 CC 8F            [ 1] 2645 	ld (OVFL,sp),a
                                   2646 ; multipy middle byte
      008EE7 73 00 08         [ 1] 2647 	ld a,acc24+1
      008EE8 97               [ 1] 2648 	ld xl,a
      008EE8 A6 3D            [ 1] 2649 	ld a, (U8,sp)
      008EEA 11               [ 4] 2650 	mul x,a
                                   2651 ; add overflow to this partial product
      008EEB 01 26 05         [ 2] 2652 	addw x,(OVFH,sp)
      008EEE A6               [ 1] 2653 	ld a,xl
      008EEF 32 CC 8F         [ 1] 2654 	ld acc24+1,a
      008EF2 73               [ 1] 2655 	clr a
      008EF3 A9 00            [ 1] 2656 	adc a,#0
      008EF3 A6 3E            [ 1] 2657 	ld (OVFH,sp),a
      008EF5 11               [ 1] 2658 	ld a,xh
      008EF6 01 26            [ 1] 2659 	ld (OVFL,sp),a
                                   2660 ; multiply most signficant byte	
      008EF8 33 A6 31         [ 1] 2661 	ld a, acc24
      008EFB 6B               [ 1] 2662 	ld xl, a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008EFC 02 72            [ 1] 2663 	ld a, (U8,sp)
      008EFE 5C               [ 4] 2664 	mul x,a
      008EFF 00 02 91         [ 2] 2665 	addw x, (OVFH,sp)
      008F02 D6               [ 1] 2666 	ld a, xl
      008F03 01 A1 3D         [ 1] 2667 	ld acc24,a
      008F06 26 0C            [ 2] 2668     addw sp,#VSIZE
      008F08 7B               [ 2] 2669 	popw x
      008F09 01               [ 4] 2670 	ret
                                   2671 
                                   2672 ;------------------------------------
                                   2673 ; skip character c in text starting from 'in'
                                   2674 ; input:
                                   2675 ;	 y 		point to text buffer
                                   2676 ;    a 		character to skip
                                   2677 ; output:  
                                   2678 ;	'in' ajusted to new position
                                   2679 ;------------------------------------
                           000001  2680 	C = 1 ; local var
      000FC7                       2681 skip:
      008F0A F7               [ 1] 2682 	push a
      008F0B 5C A6 3D         [ 4] 2683 1$:	ld a,([in.w],y)
      008F0E 6B 01            [ 1] 2684 	jreq 2$
      008F10 A6 33            [ 1] 2685 	cp a,(C,sp)
      008F12 20 5F            [ 1] 2686 	jrne 2$
      008F14 A1 3C 26 0C      [ 1] 2687 	inc in
      008F18 7B 01            [ 2] 2688 	jra 1$
      000FD7                       2689 2$: _drop 1 
      008F1A F7 5C            [ 2]    1     addw sp,#1 
      008F1C A6               [ 4] 2690 	ret
                                   2691 	
                                   2692 ;------------------------------
                                   2693 ; restore 'in.w' variable to 
                                   2694 ; its value before last call
                                   2695 ; to get_token.
                                   2696 ;------------------------------
      000FDA                       2697 unget_token:
      008F1D 3C 6B 01 A6 35   [ 1] 2698 	mov in,in.saved
      008F22 20               [ 4] 2699 	ret 
                                   2700 
                                   2701 
                                   2702 ;******************************
                                   2703 ;  data stack manipulation
                                   2704 ;*****************************
                                   2705 ;----------------------	
                                   2706 ; push X on data stack 
                                   2707 ; input:
                                   2708 ;	X 
                                   2709 ; output:
                                   2710 ;	none 
                                   2711 ;----------------------	
      000FE0                       2712 dpush:
      000FE0                       2713     _dp_down
      008F23 4F 72 5A 00      [ 1]    1     dec dstkptr+1 
      008F27 02 7B 02 20      [ 1]    2     dec dstkptr+1
      008F2B 47 CF 00 18      [ 5] 2714     ldw [dstkptr],x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F2C 81               [ 4] 2715 	ret 
                                   2716 
                                   2717 
                                   2718 ;----------------------	
                                   2719 ; pop data stack in X 
                                   2720 ; input:
                                   2721 ;	none
                                   2722 ; output:
                                   2723 ;	X   
                                   2724 ;----------------------	
      000FED                       2725 dpop: 
      008F2C A6 3C 11 01      [ 5] 2726     ldw x, [dstkptr]
      000FF1                       2727 	_dp_up
      008F30 26 32 A6 34      [ 1]    1     inc dstkptr+1
      008F34 6B 02 72 5C      [ 1]    2     inc dstkptr+1
      008F38 00               [ 4] 2728 	ret 
                                   2729 
                                   2730 ;-----------------------------
                                   2731 ; swap top 2 elements of dstack
                                   2732 ;  {n1 n2 -- n2 n1 }
                                   2733 ;-----------------------------
      000FFA                       2734 dswap:
      008F39 02 91 D6 01      [ 5] 2735 	ldw x,[dstkptr]
      008F3D A1               [ 2] 2736 	pushw x 
      008F3E 3D 26 0B         [ 2] 2737 	ldw x,#2 
      008F41 7B 01 F7 A6      [ 5] 2738 	ldw x,([dstkptr],x) 
      008F45 3D 6B 01 A6      [ 5] 2739 	ldw [dstkptr],x 
      008F49 36 20 27         [ 2] 2740 	ldw x,#2
      008F4C A1 3E            [ 2] 2741 	popw y 
      008F4E 26 0C 7B 01      [ 5] 2742 	ldw ([dstkptr],x),y 
      008F52 F7               [ 4] 2743 	ret
                                   2744 
                                   2745 ;-----------------------------
                                   2746 ; drop TOS 
                                   2747 ;-----------------------------
      001014                       2748 ddrop: ; { n -- }
      001014                       2749 	_dp_up 
      008F53 5C A6 3E 6B      [ 1]    1     inc dstkptr+1
      008F57 01 A6 35 20      [ 1]    2     inc dstkptr+1
      008F5B 17               [ 4] 2750 	ret
                                   2751 	
                                   2752 ;-----------------------------
                                   2753 ; duplicate TOS 
                                   2754 ;  dstack: { ix...n -- ix...n n }
                                   2755 ;-----------------------------
      00101D                       2756 ddup:
                                   2757 ;	ldw x,[dstkptr]
                                   2758 ;	_dp_down
                                   2759 ;   ldw [dstkptr],x  
                                   2760 ;	ret 
                                   2761 
                                   2762 
                                   2763 ;----------------------------------
                                   2764 ; pick value n from dstack 
                                   2765 ; put it on TOS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2766 ; dstack: {ix,..,p -- ix,...,np }
                                   2767 ;-----------------------------------
      00101D                       2768 dpick:
                                   2769 ;	ldw x,[dstkptr]
                                   2770 ;	sllw x 
                                   2771 ;	addw x,dstkptr 
                                   2772 ;	ldw x,(x)
                                   2773 ;	ldw [dstkptr],x 
                                   2774 ;	ret
                                   2775 
                                   2776 ;---------------------------
                                   2777 ;  fetch variable in X 
                                   2778 ;  dstack:{ addr -- value }
                                   2779 ;---------------------------
      00101D                       2780 fetch:
      008F5C 72 5A 00 02      [ 5] 2781 	ldw x,[dstkptr]
      008F60 7B               [ 2] 2782 	ldw x,(x)
      008F61 02 20 0F 18      [ 5] 2783 	ldw [dstkptr],x
      008F64 81               [ 4] 2784 	ret 
                                   2785 
                                   2786 ;----------------------------
                                   2787 ; store variable 
                                   2788 ; dstack: {addr value -- }
                                   2789 ;----------------------------
      001027                       2790 store:
      008F64 7B 01 CD         [ 4] 2791 	call dpop 
      008F67 85 A3            [ 1] 2792 	ldw y,x   ; y=value 
      008F69 25 03 CC         [ 4] 2793 	call dpop 
      008F6C 88               [ 2] 2794 	ldw (x),y 
      008F6D 09               [ 4] 2795 	ret 
                                   2796 
                                   2797 ;---------------------------------
                                   2798 ; drop n elements from data stack 
                                   2799 ; input: 
                                   2800 ;   X 		n 
                                   2801 ; output:
                                   2802 ;   none 
                                   2803 ;-------------------------------------
      008F6E                       2804 ddrop_n:
      008F6E CD               [ 2] 2805 	sllw x
      008F6F 8D 94 20 10      [ 2] 2806 	addw x,dstkptr 
      008F73 CF 00 18         [ 2] 2807 	ldw dstkptr,x  
      008F73 6B               [ 4] 2808 	ret 
                                   2809 
      008F74 02 7B 01 F7 5C 7F 72  2810 dstk_prompt: .asciz "\ndstack: " 
             5C 00 02
                                   2811 ;----------------------------
                                   2812 ; print dstack content 
                                   2813 ;---------------------------
                           000001  2814 	XSAVE=1
                           000002  2815 	VSIZE=2
      001044                       2816 dots:
      001044                       2817 	_vars VSIZE 
      008F7E 7B 02            [ 2]    1     sub sp,#VSIZE 
      008F80 AE 17 38         [ 2] 2818 	ldw x,#dstk_prompt 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008F83 CD 01 DE         [ 4] 2819 	call puts
      008F83 5B 02 81         [ 2] 2820 	ldw x,#dstack_empty-CELL_SIZE
      008F86 35 0A 00 06      [ 1] 2821 	mov base,#10 
      008F86 A1 30 25         [ 2] 2822 1$:	cpw x,dstkptr 
      008F89 03 A1            [ 1] 2823 	jrult 4$ 
      008F8B 3A 8C            [ 2] 2824 	ldw (XSAVE,sp),x
      008F8D 8C               [ 2] 2825 	ldw  x,(x)
      008F8E 81 09 E7         [ 4] 2826 	call print_int 
      008F8F 1E 01            [ 2] 2827 	ldw x,(XSAVE,sp)
      008F8F A1 61 2A         [ 2] 2828 	subw x,#CELL_SIZE 
      008F92 01 81            [ 2] 2829 	jra 1$ 
      008F94 A1 7A            [ 1] 2830 4$: ld a,#CR 
      008F96 22 FB A0         [ 4] 2831 	call putc 
      00106A                       2832 	_drop VSIZE
      008F99 20 81            [ 2]    1     addw sp,#VSIZE 
      008F9B 4F               [ 1] 2833 	clr a 
      008F9B 89               [ 4] 2834 	ret
                                   2835 
      008F9C 52 03 72 5F 00 08 72  2836 cstk_prompt: .asciz "\ncstack: "
             5F 00 09
                                   2837 ;--------------------------------
                                   2838 ; print cstack content
                                   2839 ;--------------------------------
                           000001  2840 	XSAVE=1
                           000002  2841 	VSIZE=2 
      001078                       2842 dotr:
      001078                       2843 	_vars VSIZE 
      008FA6 72 5F            [ 2]    1     sub sp,#VSIZE 
      008FA8 00 0A C6         [ 2] 2844 	ldw x,#cstk_prompt
      008FAB 17 38 27         [ 4] 2845 	call puts 
      008FAE 5A               [ 1] 2846 	ldw x,sp 
      008FAF 0F 01 A6         [ 2] 2847 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008FB2 0A 6B            [ 2] 2848 	ldw (XSAVE,sp),x  
      008FB4 02 AE 17         [ 2] 2849 	ldw x,#RAM_SIZE-2
      008FB7 38 F6 27 47      [ 1] 2850 	mov base,#16
      00108D                       2851 dotr_loop:
      008FBB A1 2D            [ 2] 2852 	cpw x,(XSAVE,sp)
      008FBD 26 04            [ 1] 2853 	jrmi 9$
      008FBF 03               [ 2] 2854 	pushw x  
      008FC0 01               [ 2] 2855 	ldw x,(x)
      008FC1 20 08 A1         [ 4] 2856 	call print_int 
      008FC4 24               [ 2] 2857 	popw x  
      008FC5 26 06 A6         [ 2] 2858 	subw x,#CELL_SIZE
      008FC8 10 6B            [ 2] 2859 	jra dotr_loop 
      008FCA 02 5C            [ 1] 2860 9$:	ld a,#CR 
      008FCC F6 01 CB         [ 4] 2861 	call putc 
      008FCD                       2862 	_drop VSIZE 
      008FCD A1 61            [ 2]    1     addw sp,#VSIZE 
      008FCF 2B               [ 1] 2863 	clr a 
      008FD0 02               [ 4] 2864 	ret
                                   2865 
                                   2866 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2867 ;;   TINY BASIC  operators,
                                   2868 ;;   commands and functions 
                                   2869 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2870 
                                   2871 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2872 ;;  Arithmetic operators
                                   2873 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2874 
                                   2875 ;--------------------------------
                                   2876 ;  add 2 integers
                                   2877 ;  input:
                                   2878 ;    N1     on cstack 
                                   2879 ;    N2     on cstack 
                                   2880 ;  output:
                                   2881 ;    X 		n2+n1 
                                   2882 ;--------------------------------
                                   2883 	;arugments on cstack 
      0010A5                       2884 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0010A5                       2885 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      0010A5                       2886 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      0010A5                       2887 add:
      008FD1 A0 20            [ 2] 2888 	ldw x ,(N2,sp)
      008FD3 A1 30 2B         [ 2] 2889 	addw x,(N1,sp)
      008FD6 2B A0            [ 2] 2890 	ldw (N1,sp),x 
      008FD8 30               [ 4] 2891 	ret 
                                   2892 
                                   2893 ;--------------------------------
                                   2894 ;  substract 2 ntegers
                                   2895 ;  input:
                                   2896 ;    N1     on cstack 
                                   2897 ;    N2     on cstack 
                                   2898 ;  output:
                                   2899 ;    X 		n2+n1 
                                   2900 ;--------------------------------
      0010AD                       2901 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0010AD                       2902 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      0010AD                       2903 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      0010AD                       2904 substract:
      008FD9 A1 0A            [ 2] 2905 	ldw x,(N2,sp)
      008FDB 2B 06 A0         [ 2] 2906 	subw x,(N1,sp)
      008FDE 07               [ 4] 2907 	ret 
                                   2908 
                                   2909 ;-------------------------------------
                                   2910 ; multiply 2 integers
                                   2911 ; product overflow is ignored unless
                                   2912 ; MATH_OVF assembler flag is set to 1
                                   2913 ; input:
                                   2914 ;  	N1      on cstack
                                   2915 ;   N2 		on cstack 
                                   2916 ; output:
                                   2917 ;	X        N1*N2 
                                   2918 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2919 	;arguments 
      0010B3                       2920 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      0010B3                       2921 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      0010B3                       2922 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      0010B3                       2923 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      0010B3                       2924 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2925    ; local variables 
                           000001  2926 	SIGN=1
                           000002  2927 	PROD=2
                           000003  2928 	VSIZE=3
      0010B3                       2929 multiply:
      0010B3                       2930 	_vars VSIZE 
      008FDF 11 02            [ 2]    1     sub sp,#VSIZE 
      008FE1 2A 1F            [ 1] 2931 	clr (SIGN,sp)
      008FE3 6B 03            [ 2] 2932 	ldw x,(N1_HB,sp)
      008FE5 7B               [ 1] 2933 	ld a,xh  
      008FE6 02 CD            [ 1] 2934 	bcp a,#0x80 
      008FE8 90 0D            [ 1] 2935 	jreq 2$
      008FEA 7B 03            [ 1] 2936 	cpl (SIGN,sp)
      008FEC CB               [ 2] 2937 	negw x 
      008FED 00 0A            [ 2] 2938 	ldw (N1_HB,sp),x 
      008FEF C7 00            [ 2] 2939 2$: ldw x,(N2_HB,sp)
      008FF1 0A               [ 1] 2940 	ld a,xh  
      008FF2 4F C9            [ 1] 2941 	bcp a,#0x80 
      008FF4 00 09            [ 1] 2942 	jreq 3$
      008FF6 C7 00            [ 1] 2943 	cpl (SIGN,sp)
      008FF8 09               [ 2] 2944 	negw x 
      008FF9 4F C9            [ 2] 2945 	ldw (N2_HB,sp),x 
                                   2946 ; N1_LB * N2_LB 	
      008FFB 00 08            [ 1] 2947 3$:	ld a,(N1_LB,sp)
      008FFD C7               [ 1] 2948 	ld xl,a 
      008FFE 00 08            [ 1] 2949 	ld a,(N2_LB,sp) 
      009000 20               [ 4] 2950 	mul x,a 
                           000000  2951 .if MATH_OVF 	
                                   2952 	ld a,xh 
                                   2953 	bcp a,#0x80 
                                   2954 	jreq 4$ 
                                   2955 	ld a,#ERR_MATH_OVF 
                                   2956 	jp tb_error
                                   2957 .endif 	 
      009001 C9 0D            [ 2] 2958 4$:	ldw (PROD,sp),x
                                   2959 ; N1_LB * N2_HB	 
      009003 01 27            [ 1] 2960 	ld a,(N1_LB,sp) 
      009005 03               [ 1] 2961 	ld xl,a 
      009006 CD 8B            [ 1] 2962 	ld a,(N2_HB,sp)
      009008 32               [ 4] 2963 	mul x,a
      009009 9F               [ 1] 2964 	ld a,xl 
      009009 5B 03            [ 1] 2965 	add a,(PROD,sp)
                           000000  2966 .if MATH_OVF 	
                                   2967 	bcp a,#0x80 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2968 	jreq 5$ 
                                   2969 	ld a,#ERR_MATH_OVF 
                                   2970 	jp tb_error
                                   2971 .endif 	 
      00900B 85 81            [ 1] 2972 5$:	ld (PROD,sp),a 
                                   2973 ; N1_HB * N2_LB 
      00900D 7B 06            [ 1] 2974 	ld a,(N1_HB,sp)
      00900D 89               [ 1] 2975 	ld xl,a 
      00900E 88 5F            [ 1] 2976 	ld a,(N2_LB,sp)
      009010 89               [ 4] 2977 	mul x,a 
      009011 C6               [ 1] 2978 	ld a,xl 
      009012 00 0A            [ 1] 2979 	add a,(PROD,sp)
                           000000  2980 .if MATH_OVF 	
                                   2981 	bcp a,#0x80 
                                   2982 	jreq 6$ 
                                   2983 	ld a,#ERR_MATH_OVF 
                                   2984 	jp tb_error
                                   2985 .endif 	 
      009014 97 7B            [ 1] 2986 6$:	ld (PROD,sp),a 
                                   2987 ; N1_HB * N2_HB 	
                                   2988 ; it is pointless to multiply N1_HB*N2_HB 
                                   2989 ; as this product is over 65535 or 0 
                                   2990 ;
                                   2991 ; sign adjust product
      009016 03 42            [ 1] 2992 	tnz (SIGN,sp)
      009018 9F C7            [ 1] 2993 	jreq 7$
      00901A 00 0A            [ 2] 2994 	ldw x, (PROD,sp)
      00901C 9E               [ 2] 2995 	negw x
      00901D 6B 02            [ 2] 2996 	ldw (PROD,sp),x  
      0010F6                       2997 7$: 
      00901F C6 00            [ 2] 2998 	ldw x,(PROD,sp) 
      0010F8                       2999 	_drop VSIZE 
      009021 09 97            [ 2]    1     addw sp,#VSIZE 
      009023 7B               [ 4] 3000 	ret
                                   3001 
                                   3002 ;----------------------------------
                                   3003 ;  euclidian divide n2/n1 
                                   3004 ; input:
                                   3005 ;    N2 	on cstack
                                   3006 ;    N1 	on cstack
                                   3007 ; output:
                                   3008 ;    X      n2/n1 
                                   3009 ;    Y      remainder 
                                   3010 ;----------------------------------
      0010FB                       3011 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      0010FB                       3012 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      0010FB                       3013 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   3014 	; local variables
                           000001  3015 	SQUOT=1 ; sign quotient
                           000002  3016 	SDIVD=2 ; sign dividend  
                           000002  3017 	VSIZE=2
      0010FB                       3018 divide:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0010FB                       3019 	_vars VSIZE 
      009024 03 42            [ 2]    1     sub sp,#VSIZE 
      009026 72 FB            [ 1] 3020 	clr (SQUOT,sp)
      009028 01 9F            [ 1] 3021 	clr (SDIVD,sp)
                                   3022 ; check for 0 divisor
      00902A C7 00            [ 2] 3023 	ldw x,(DIVISR,sp)
      00902C 09               [ 2] 3024 	tnzw x 
      00902D 4F A9            [ 1] 3025     jrne 0$
      00902F 00 6B            [ 1] 3026 	ld a,#ERR_DIV0 
      009031 01 9E 6B         [ 2] 3027 	jp tb_error 
                                   3028 ; check divisor sign 	
      009034 02               [ 1] 3029 0$:	ld a,xh 
      009035 C6 00            [ 1] 3030 	bcp a,#0x80 
      009037 08 97            [ 1] 3031 	jreq 1$
      009039 7B 03            [ 1] 3032 	cpl (SQUOT,sp)
      00903B 42               [ 2] 3033 	negw x 
      00903C 72 FB            [ 2] 3034 1$:	ldw (DIVISR,sp),x
                                   3035 ; check dividend sign 	 
      00903E 01 9F            [ 2] 3036     ldw x,(DIVIDND,sp)
      009040 C7               [ 1] 3037 	ld a,xh 
      009041 00 08            [ 1] 3038 	bcp a,#0x80 
      009043 5B 03            [ 1] 3039 	jreq 2$ 
      009045 85 81            [ 1] 3040 	cpl (SQUOT,sp)
      009047 03 02            [ 1] 3041 	cpl (SDIVD,sp)
      009047 88               [ 2] 3042 	negw x 
      009048 91 D6            [ 2] 3043 2$:	ldw y,(DIVISR,sp)
      00904A 01               [ 2] 3044 	divw x,y
      00904B 27 0A 11 01      [ 2] 3045 	ldw acc16,y 
                                   3046 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      00904F 26 06            [ 1] 3047 	tnz (SDIVD,sp)
      009051 72 5C            [ 1] 3048 	jreq 7$
      009053 00 02            [ 2] 3049 	tnzw y 
      009055 20 F1            [ 1] 3050 	jreq 7$
      009057 5B               [ 2] 3051 	incw x
      009058 01 81            [ 2] 3052 	ldw y,(DIVISR,sp)
      00905A 72 B2 00 08      [ 2] 3053 	subw y,acc16
      00905A 55 00            [ 1] 3054 7$: tnz (SQUOT,sp)
      00905C 03 00            [ 1] 3055 	jreq 9$ 	 
      00905E 02               [ 2] 3056 8$:	negw x 
      00113C                       3057 9$: 
      00113C                       3058 	_drop VSIZE 
      00905F 81 02            [ 2]    1     addw sp,#VSIZE 
      009060 81               [ 4] 3059 	ret 
                                   3060 
                                   3061 
                                   3062 ;----------------------------------
                                   3063 ;  remainder resulting from euclidian 
                                   3064 ;  division of n2/n1 
                                   3065 ; input:
                                   3066 ;   N1 		cstack 
                                   3067 ;   N2      cstack
                                   3068 ; output:
                                   3069 ;   X       N2%N1 
                                   3070 ;----------------------------------
                           000003  3071 	N1=3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                           000005  3072 	N2=5
                           000004  3073 	VSIZE=4
      00113F                       3074 modulo:
      009060 72 5A            [ 2] 3075 	Ldw x,(N1,sp)
      009062 00 1A            [ 2] 3076 	ldw y,(N2,sp)
      001143                       3077 	_vars VSIZE 
      009064 72 5A            [ 2]    1     sub sp,#VSIZE 
      009066 00 1A            [ 2] 3078 	ldw (1,sp),x 
      009068 72 CF            [ 2] 3079 	ldw (3,sp),y 
      00906A 00 19 81         [ 4] 3080 	call divide 
      00906D 93               [ 1] 3081 	ldw x,y
      00114D                       3082 	_drop VSIZE 
      00906D 72 CE            [ 2]    1     addw sp,#VSIZE 
      00906F 00               [ 4] 3083 	ret 
                                   3084 
                                   3085 
                                   3086 ;----------------------------------
                                   3087 ; search in kword_dict name
                                   3088 ; from its execution address 
                                   3089 ; input:
                                   3090 ;   X       	execution address 
                                   3091 ; output:
                                   3092 ;   X 			cstr*  | 0 
                                   3093 ;--------------------------------
                           000001  3094 	XADR=1 
                           000003  3095 	LINK=3 
                           000004  3096 	VSIZE=4
      001150                       3097 cmd_name:
      001150                       3098 	_vars VSIZE 
      009070 19 72            [ 2]    1     sub sp,#VSIZE 
      009072 5C 00 1A 72      [ 1] 3099 	clr acc16 
      009076 5C 00            [ 2] 3100 	ldw (XADR,sp),x  
      009078 1A 81 11         [ 2] 3101 	ldw x,#kword_dict	
      00907A 1F 03            [ 2] 3102 1$:	ldw (LINK,sp),x
      00907A 72 CE            [ 1] 3103 	ld a,(2,x)
      00907C 00 19            [ 1] 3104 	and a,#15 
      00907E 89 AE 00         [ 1] 3105 	ld acc8,a 
      009081 02 72 DE         [ 2] 3106 	addw x,#3
      009084 00 19 72 CF      [ 2] 3107 	addw x,acc16
      009088 00               [ 2] 3108 	ldw x,(x) ; execution address 
      009089 19 AE            [ 2] 3109 	cpw x,(XADR,sp)
      00908B 00 02            [ 1] 3110 	jreq 2$
      00908D 90 85            [ 2] 3111 	ldw x,(LINK,sp)
      00908F 72               [ 2] 3112 	ldw x,(x) 
      009090 DF 00 19         [ 2] 3113 	subw x,#2  
      009093 81 E3            [ 1] 3114 	jrne 1$
      009094 20 05            [ 2] 3115 	jra 9$
      009094 72 5C            [ 2] 3116 2$: ldw x,(LINK,sp)
      009096 00 1A 72         [ 2] 3117 	addw x,#2 	
      00117F                       3118 9$:	_drop VSIZE
      009099 5C 00            [ 2]    1     addw sp,#VSIZE 
      00909B 1A               [ 4] 3119 	ret
                                   3120 
                                   3121 
                                   3122 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3123 ; dictionary search 
                                   3124 ; input:
                                   3125 ;	X 		dictionary entry point 
                                   3126 ;  pad		.asciz name to search 
                                   3127 ; output:
                                   3128 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3129 ;  X		execution address | 0 
                                   3130 ;---------------------------------
                           000001  3131 	NLEN=1 ; cmd length 
                           000002  3132 	YSAVE=2
                           000003  3133 	VSIZE=3 
      001182                       3134 search_dict:
      001182                       3135 	_vars VSIZE 
      00909C 81 03            [ 2]    1     sub sp,#VSIZE 
      00909D 90 93            [ 1] 3136 	ldw y,x 
      00909D                       3137 search_next:	
      00909D 90 F6            [ 1] 3138 	ld a,(y)
      00909D 72 CE            [ 1] 3139 	and a,#0xf 
      00909F 00 19            [ 1] 3140 	ld (NLEN,sp),a  
      0090A1 FE 72 CF         [ 2] 3141 	ldw x,#pad 
      0090A4 00 19            [ 2] 3142 	ldw (YSAVE,sp),y
      0090A6 81 5C            [ 2] 3143 	incw y  
      0090A7                       3144 cp_loop:
      0090A7 CD               [ 1] 3145 	ld a,(x)
      0090A8 90 6D            [ 1] 3146 	jreq str_match 
      0090AA 90 93            [ 1] 3147 	tnz (NLEN,sp)
      0090AC CD 90            [ 1] 3148 	jreq no_match  
      0090AE 6D FF            [ 1] 3149 	cp a,(y)
      0090B0 81 07            [ 1] 3150 	jrne no_match 
      0090B1 90 5C            [ 2] 3151 	incw y 
      0090B1 58               [ 2] 3152 	incw x
      0090B2 72 BB            [ 1] 3153 	dec (NLEN,sp)
      0090B4 00 19            [ 2] 3154 	jra cp_loop 
      0011A5                       3155 no_match:
      0090B6 CF 00            [ 2] 3156 	ldw y,(YSAVE,sp) 
      0090B8 19 81 0A 64      [ 2] 3157 	subw y,#2 ; move Y to link field
      0090BC 73 74            [ 1] 3158 	push #TK_NONE 
      0090BE 61 63            [ 2] 3159 	ldw y,(y) ; next word link 
      0090C0 6B               [ 1] 3160 	pop a ; TK_NONE 
      0090C1 3A 20            [ 1] 3161 	jreq search_exit  ; not found  
                                   3162 ;try next 
      0090C3 00 D2            [ 2] 3163 	jra search_next
      0090C4                       3164 str_match:
      0090C4 52 02            [ 2] 3165 	ldw y,(YSAVE,sp)
      0090C6 AE 90            [ 1] 3166 	ld a,(y)
      0090C8 BA CD            [ 1] 3167 	ld (NLEN,sp),a ; needed to test keyword type  
      0090CA 82 5E            [ 1] 3168 	and a,#0xf 
                                   3169 ; move y to procedure address field 	
      0090CC AE               [ 1] 3170 	inc a 
      0090CD 17 7E 35         [ 1] 3171 	ld acc8,a 
      0090D0 0A 00 07 C3      [ 1] 3172 	clr acc16 
      0090D4 00 19 25 0D      [ 2] 3173 	addw y,acc16 
      0090D8 1F 01            [ 2] 3174 	ldw y,(y) ; routine entry point 
                                   3175 ;determine keyword type bits 7:6 
      0090DA FE CD            [ 1] 3176 	ld a,(NLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0090DC 8A               [ 1] 3177 	swap a 
      0090DD 67 1E            [ 1] 3178 	and a,#0xc
      0090DF 01               [ 1] 3179 	srl a
      0090E0 1D               [ 1] 3180 	srl a 
      0090E1 00 02            [ 1] 3181 	add a,#6
      0011D3                       3182 search_exit: 
      0090E3 20               [ 1] 3183 	ldw x,y ; x=routine address 
      0011D4                       3184 	_drop VSIZE 	 
      0090E4 EE A6            [ 2]    1     addw sp,#VSIZE 
      0090E6 0D               [ 4] 3185 	ret 
                                   3186 
                                   3187 ;---------------------
                                   3188 ; check if next token
                                   3189 ;  is of expected type 
                                   3190 ; input:
                                   3191 ;   A 		 expected token attribute
                                   3192 ;  ouput:
                                   3193 ;   none     if fail call syntax_error 
                                   3194 ;--------------------
      0011D7                       3195 expect:
      0090E7 CD               [ 1] 3196 	push a 
      0090E8 82 4B 5B         [ 4] 3197 	call next_token 
      0090EB 02 4F            [ 1] 3198 	cp a,(1,sp)
      0090ED 81 0A            [ 1] 3199 	jreq 1$
      0090EF 63 73 74         [ 2] 3200 	jp syntax_error
      0090F2 61               [ 1] 3201 1$: pop a 
      0090F3 63               [ 4] 3202 	ret 
                                   3203 
                                   3204 
                                   3205 ;-------------------------------
                                   3206 ; parse embedded BASIC routines 
                                   3207 ; arguments list.
                                   3208 ; arg_list::=  rel[','rel]*
                                   3209 ; all arguments are of integer type
                                   3210 ; and pushed on dstack 
                                   3211 ; input:
                                   3212 ;   none
                                   3213 ; output:
                                   3214 ;   A 	number of arguments pushed on dstack  
                                   3215 ;--------------------------------
                           000001  3216 	ARG_CNT=1 
      0011E4                       3217 arg_list:
      0090F4 6B 3A            [ 1] 3218 	push #0  
      0090F6 20 00 28         [ 4] 3219 1$: call relation
      0090F8 A1 00            [ 1] 3220 	cp a,#TK_NONE 
      0090F8 52 02            [ 1] 3221 	jreq 5$
      0090FA AE 90            [ 1] 3222 	cp a,#TK_INTGR
      0090FC EE CD            [ 1] 3223 	jrne 4$
      0090FE 82 5E 96         [ 4] 3224 3$: call dpush 
      009101 1C 00            [ 1] 3225     inc (ARG_CNT,sp)
      009103 07 1F 01         [ 4] 3226 	call next_token 
      009106 AE 17            [ 1] 3227 	cp a,#TK_NONE 
      009108 FE 35            [ 1] 3228 	jreq 5$ 
      00910A 10 00            [ 1] 3229 	cp a,#TK_COMMA 
      00910C 07 02            [ 1] 3230 	jrne 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00910D 20 E3            [ 2] 3231 	jra 1$ 
      00910D 13 01 2B         [ 4] 3232 4$:	call unget_token 
      009110 0B               [ 1] 3233 5$:	pop a 
      009111 89               [ 4] 3234 	ret 
                                   3235 
                                   3236 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3237 ; parse arguments list 
                                   3238 ; between ()
                                   3239 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001208                       3240 func_args:
      009112 FE CD            [ 1] 3241 	ld a,#TK_LPAREN 
      009114 8A 67 85         [ 4] 3242 	call expect 
      009117 1D 00 02         [ 4] 3243 	call arg_list 
      00911A 20               [ 1] 3244 	push a 
      00911B F1 A6            [ 1] 3245 	ld a,#TK_RPAREN 
      00911D 0D CD 82         [ 4] 3246 	call expect 
      009120 4B               [ 1] 3247 	pop a 
      009121 5B               [ 4] 3248 	ret 
                                   3249 
                                   3250 
                                   3251 ;--------------------------------
                                   3252 ;   BASIC commnands 
                                   3253 ;--------------------------------
                                   3254 
                                   3255 ;--------------------------------
                                   3256 ;  arithmetic and relational 
                                   3257 ;  routines
                                   3258 ;  operators precedence
                                   3259 ;  highest to lowest
                                   3260 ;  operators on same row have 
                                   3261 ;  same precedence and are executed
                                   3262 ;  from left to right.
                                   3263 ;	'*','/','%'
                                   3264 ;   '-','+'
                                   3265 ;   '=','>','<','>=','<=','<>','><'
                                   3266 ;   '<>' and '><' are equivalent for not equal.
                                   3267 ;--------------------------------
                                   3268 
                                   3269 ;---------------------
                                   3270 ; return array element
                                   3271 ; address from @(expr)
                                   3272 ; input:
                                   3273 ;   A 		TK_ARRAY
                                   3274 ; output:
                                   3275 ;   A 		TK_INTGR
                                   3276 ;	X 		element address 
                                   3277 ;----------------------
      001218                       3278 get_array_element:
      009122 02 4F 81         [ 4] 3279 	call func_args 
      009125 A1 01            [ 1] 3280 	cp a,#1
      009125 1E 05            [ 1] 3281 	jreq 1$
      009127 72 FB 03         [ 2] 3282 	jp syntax_error
      00912A 1F 03 81         [ 4] 3283 1$: call dpop  
                                   3284 	; check for bounds 
      00912D C3 00 1F         [ 2] 3285 	cpw x,array_size 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      00912D 1E 05            [ 2] 3286 	jrule 3$
                                   3287 ; bounds {1..array_size}	
      00912F 72 F0            [ 1] 3288 2$: ld a,#ERR_BAD_VALUE 
      009131 03 81 8B         [ 2] 3289 	jp tb_error 
      009133 5D               [ 2] 3290 3$: tnzw  x
      009133 52 03            [ 1] 3291 	jreq 2$ 
      009135 0F               [ 2] 3292 	sllw x 
      009136 01               [ 2] 3293 	pushw x 
      009137 1E 06 9E         [ 2] 3294 	ldw x,#tib
      00913A A5 80 27         [ 2] 3295 	subw x,(1,sp)
      00123A                       3296 	_drop 2   
      00913D 05 03            [ 2]    1     addw sp,#2 
      00913F 01 50            [ 1] 3297 	ld a,#TK_INTGR
      009141 1F               [ 4] 3298 	ret 
                                   3299 
                                   3300 ;***********************************
                                   3301 ;   expression parse,execute 
                                   3302 ;***********************************
                                   3303 ;-----------------------------------
                                   3304 ; factor ::= ['+'|'-'|e] var | @ |
                                   3305 ;			 integer | function |
                                   3306 ;			 '('relation')' 
                                   3307 ; output:
                                   3308 ;   A    token attribute 
                                   3309 ;   X 	 integer
                                   3310 ; ---------------------------------
                           000001  3311 	NEG=1
                           000001  3312 	VSIZE=1
      00123F                       3313 factor:
      00123F                       3314 	_vars VSIZE 
      009142 06 1E            [ 2]    1     sub sp,#VSIZE 
      009144 08 9E A5         [ 4] 3315 	call next_token
      009147 80 27            [ 1] 3316 	cp a,#CMD_END 
      009149 05 03            [ 1] 3317 	jrmi 20$
      00914B 01 50            [ 1] 3318 1$:	ld (NEG,sp),a 
      00914D 1F 08            [ 1] 3319 	and a,#TK_GRP_MASK
      00914F 7B 07            [ 1] 3320 	cp a,#TK_GRP_ADD 
      009151 97 7B            [ 1] 3321 	jreq 2$
      009153 09 42            [ 1] 3322 	ld a,(NEG,sp)
      009155 1F 02            [ 2] 3323 	jra 4$  
      001254                       3324 2$:	
      009157 7B 07 97         [ 4] 3325 	call next_token 
      001257                       3326 4$:	
      00915A 7B 08            [ 1] 3327 	cp a,#TK_IFUNC 
      00915C 42 9F            [ 1] 3328 	jrne 5$ 
      00915E 1B               [ 4] 3329 	call (x) 
      00915F 02 6B            [ 2] 3330 	jra 18$ 
      00125E                       3331 5$:
      009161 02 7B            [ 1] 3332 	cp a,#TK_INTGR
      009163 06 97            [ 1] 3333 	jrne 6$
      009165 7B 09            [ 2] 3334 	jra 18$
      001264                       3335 6$:
      009167 42 9F            [ 1] 3336 	cp a,#TK_ARRAY
      009169 1B 02            [ 1] 3337 	jrne 10$
      00916B 6B 02 0D         [ 4] 3338 	call get_array_element
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00916E 01               [ 2] 3339 	ldw x,(x)
      00916F 27 05            [ 2] 3340 	jra 18$ 
      00126E                       3341 10$:
      009171 1E 02            [ 1] 3342 	cp a,#TK_VAR 
      009173 50 1F            [ 1] 3343 	jrne 12$
      009175 02               [ 2] 3344 	ldw x,(x)
      009176 20 16            [ 2] 3345 	jra 18$
      001275                       3346 12$:			
      009176 1E 02            [ 1] 3347 	cp a,#TK_LPAREN
      009178 5B 03            [ 1] 3348 	jrne 16$
      00917A 81 13 28         [ 4] 3349 	call relation
      00917B 89               [ 2] 3350 	pushw x 
      00917B 52 02            [ 1] 3351 	ld a,#TK_RPAREN 
      00917D 0F 01 0F         [ 4] 3352 	call expect
      009180 02               [ 2] 3353 	popw x 
      009181 1E 05            [ 2] 3354 	jra 18$	
      001285                       3355 16$:
      009183 5D 26 05         [ 4] 3356 	call unget_token
      009186 A6               [ 1] 3357 	clr a 
      009187 04 CC            [ 2] 3358 	jra 20$ 
      00128B                       3359 18$: 
      009189 88 0B            [ 1] 3360 	ld a,#TK_MINUS 
      00918B 9E A5            [ 1] 3361 	cp a,(NEG,sp)
      00918D 80 27            [ 1] 3362 	jrne 19$
      00918F 03               [ 2] 3363 	negw x
      001292                       3364 19$:
      009190 03 01            [ 1] 3365 	ld a,#TK_INTGR
      001294                       3366 20$:
      001294                       3367 	_drop VSIZE
      009192 50 1F            [ 2]    1     addw sp,#VSIZE 
      009194 05               [ 4] 3368 	ret
                                   3369 
                                   3370 ;-----------------------------------
                                   3371 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3372 ; output:
                                   3373 ;   A    	token attribute 
                                   3374 ;	X		integer
                                   3375 ;-----------------------------------
                           000001  3376 	N1=1
                           000003  3377 	N2=3
                           000005  3378 	MULOP=5
                           000005  3379 	VSIZE=5
      001297                       3380 term:
      001297                       3381 	_vars VSIZE
      009195 1E 07            [ 2]    1     sub sp,#VSIZE 
      009197 9E A5 80         [ 4] 3382 	call factor
      00919A 27 05            [ 1] 3383 	cp a,#CMD_END
      00919C 03 01            [ 1] 3384 	jrmi term_exit
      0012A0                       3385 term01:	 ; check for  operator 
      00919E 03 02            [ 2] 3386 	ldw (N2,sp),x  ; save first factor 
      0091A0 50 16 05         [ 4] 3387 	call next_token
      0091A3 65 90            [ 1] 3388 	cp a,#2
      0091A5 CF 00            [ 1] 3389 	jrmi 9$
      0091A7 09 0D            [ 1] 3390 0$:	ld (MULOP,sp),a
      0091A9 02 27            [ 1] 3391 	and a,#TK_GRP_MASK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0091AB 0B 90            [ 1] 3392 	cp a,#TK_GRP_MULT
      0091AD 5D 27            [ 1] 3393 	jreq 1$
      0091AF 07 5C            [ 1] 3394 	ld a,(MULOP,sp) 
      0091B1 16 05 72         [ 4] 3395 	call unget_token 
      0091B4 B2 00            [ 2] 3396 	jra 9$
      0012B8                       3397 1$:	; got *|/|%
      0091B6 09 0D 01         [ 4] 3398 	call factor
      0091B9 27 01            [ 1] 3399 	cp a,#TK_INTGR
      0091BB 50 03            [ 1] 3400 	jreq 2$ 
      0091BC CC 07 89         [ 2] 3401 	jp syntax_error
      0091BC 5B 02            [ 2] 3402 2$:	ldw (N1,sp),x  
      0091BE 81 05            [ 1] 3403 	ld a,(MULOP,sp) 
      0091BF A1 20            [ 1] 3404 	cp a,#TK_MULT 
      0091BF 1E 03            [ 1] 3405 	jrne 3$
      0091C1 16 05 52         [ 4] 3406 	call multiply 
      0091C4 04 1F            [ 2] 3407 	jra term01
      0091C6 01 17            [ 1] 3408 3$: cp a,#TK_DIV 
      0091C8 03 CD            [ 1] 3409 	jrne 4$ 
      0091CA 91 7B 93         [ 4] 3410 	call divide 
      0091CD 5B 04            [ 2] 3411 	jra term01 
      0091CF 81 11 3F         [ 4] 3412 4$: call modulo
      0091D0 20 C3            [ 2] 3413 	jra term01 
      0091D0 52 04            [ 2] 3414 9$: ldw x,(N2,sp)  
      0091D2 72 5F            [ 1] 3415 	ld a,#TK_INTGR 	
      0012E1                       3416 term_exit:
      0012E1                       3417 	_drop VSIZE 
      0091D4 00 09            [ 2]    1     addw sp,#VSIZE 
      0091D6 1F               [ 4] 3418 	ret 
                                   3419 
                                   3420 ;-------------------------------
                                   3421 ;  expr ::= term [['+'|'-'] term]*
                                   3422 ;  result range {-32768..32767}
                                   3423 ;  output:
                                   3424 ;   A    token attribute 
                                   3425 ;   X	 integer   
                                   3426 ;-------------------------------
                           000001  3427 	N1=1 
                           000003  3428 	N2=3
                           000005  3429 	OP=5 
                           000005  3430 	VSIZE=5 
      0012E4                       3431 expression:
      0012E4                       3432 	_vars VSIZE 
      0091D7 01 AE            [ 2]    1     sub sp,#VSIZE 
      0091D9 A6 91 1F         [ 4] 3433 	call term
      0091DC 03 E6            [ 1] 3434 	cp a,#CMD_END 
      0091DE 02 A4            [ 1] 3435 	jrmi expr_exit 
      0091E0 0F C7            [ 2] 3436 0$:	ldw (N2,sp),x 
      0091E2 00 0A 1C         [ 4] 3437 	call next_token
      0091E5 00 03            [ 1] 3438 	cp a,#2
      0091E7 72 BB            [ 1] 3439 	jrmi 9$ 
      0091E9 00 09            [ 1] 3440 1$:	ld (OP,sp),a  
      0091EB FE 13            [ 1] 3441 	and a,#TK_GRP_MASK
      0091ED 01 27            [ 1] 3442 	cp a,#TK_GRP_ADD 
      0091EF 0A 1E            [ 1] 3443 	jreq 2$ 
      0091F1 03 FE            [ 1] 3444 	ld a,(OP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0091F3 1D 00 02         [ 4] 3445 	call unget_token
      0091F6 26 E3            [ 2] 3446 	jra 9$
      001305                       3447 2$: 
      0091F8 20 05 1E         [ 4] 3448 	call term
      0091FB 03 1C            [ 1] 3449 	cp a,#TK_INTGR 
      0091FD 00 02            [ 1] 3450 	jreq 3$
      0091FF 5B 04 81         [ 2] 3451 	jp syntax_error
      009202 1F 01            [ 2] 3452 3$:	ldw (N1,sp),x 
      009202 52 03            [ 1] 3453 	ld a,(OP,sp)
      009204 90 93            [ 1] 3454 	cp a,#TK_PLUS 
      009206 26 05            [ 1] 3455 	jrne 4$
      009206 90 F6 A4         [ 4] 3456 	call add 
      009209 0F 6B            [ 2] 3457 	jra 0$ 
      00920B 01 AE 17         [ 4] 3458 4$:	call substract
      00920E 38 17            [ 2] 3459 	jra 0$
      009210 02 90            [ 2] 3460 9$: ldw x,(N2,sp)
      009212 5C 04            [ 1] 3461 	ld a,#TK_INTGR	
      009213                       3462 expr_exit:
      001325                       3463 	_drop VSIZE 
      009213 F6 27            [ 2]    1     addw sp,#VSIZE 
      009215 1E               [ 4] 3464 	ret 
                                   3465 
                                   3466 ;---------------------------------------------
                                   3467 ; rel ::= expr rel_op expr
                                   3468 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3469 ;  relation return 1 | 0  for true | false 
                                   3470 ;  output:
                                   3471 ;    A 		token attribute  
                                   3472 ;	 X		1|0
                                   3473 ;---------------------------------------------
                           000001  3474 	N1=1
                           000003  3475 	N2=3
                           000005  3476 	RELOP=5
                           000005  3477 	VSIZE=5 
      001328                       3478 relation: 
      001328                       3479 	_vars VSIZE
      009216 0D 01            [ 2]    1     sub sp,#VSIZE 
      009218 27 0B 90         [ 4] 3480 	call expression
      00921B F1 26            [ 1] 3481 	cp a,#CMD_END  
      00921D 07 90            [ 1] 3482 	jrmi rel_exit 
                                   3483 	; expect rel_op or leave 
      00921F 5C 5C            [ 2] 3484 	ldw (N2,sp),x 
      009221 0A 01 20         [ 4] 3485 	call next_token 
      009224 EE 02            [ 1] 3486 	cp a,#2
      009225 2B 3E            [ 1] 3487 	jrmi 9$
      00133A                       3488 1$:	
      009225 16 02            [ 1] 3489 	ld (RELOP,sp),a 
      009227 72 A2            [ 1] 3490 	and a,#TK_GRP_MASK
      009229 00 02            [ 1] 3491 	cp a,#TK_GRP_RELOP 
      00922B 4B 00            [ 1] 3492 	jreq 2$
      00922D 90 FE            [ 1] 3493 	ld a,(RELOP,sp)
      00922F 84 27 21         [ 4] 3494 	call unget_token  
      009232 20 D2            [ 2] 3495 	jra 9$
      009234                       3496 2$:	; expect another expression or error 
      009234 16 02 90         [ 4] 3497 	call expression
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009237 F6 6B            [ 1] 3498 	cp a,#TK_INTGR 
      009239 01 A4            [ 1] 3499 	jreq 3$
      00923B 0F 4C C7         [ 2] 3500 	jp syntax_error 
      00923E 00 0A            [ 2] 3501 3$:	ldw (N1,sp),x 
      009240 72 5F 00         [ 4] 3502 	call substract
      009243 09 72            [ 1] 3503 	jrne 4$
      009245 B9 00 09 90      [ 1] 3504 	mov acc8,#2 ; n1==n2
      009249 FE 7B            [ 2] 3505 	jra 6$ 
      001360                       3506 4$: 
      00924B 01 4E            [ 1] 3507 	jrsgt 5$  
      00924D A4 0C 44 44      [ 1] 3508 	mov acc8,#4 ; n1<2 
      009251 AB 06            [ 2] 3509 	jra 6$
      009253                       3510 5$:
      009253 93 5B 03 81      [ 1] 3511 	mov acc8,#1 ; n1>n2 
      009257                       3512 6$:
      009257 88               [ 1] 3513 	clrw x 
      009258 CD 88 BD         [ 1] 3514 	ld a, acc8  
      00925B 11 01            [ 1] 3515 	and a,(RELOP,sp)
      00925D 27               [ 1] 3516 	tnz a 
      00925E 03 CC            [ 1] 3517 	jreq 10$
      009260 88               [ 2] 3518 	incw x 
      001376                       3519 7$:	 
      009261 09 84            [ 2] 3520 	jra 10$  	
      009263 81 03            [ 2] 3521 9$: ldw x,(N2,sp)
      009264                       3522 10$:
      009264 4B 00            [ 1] 3523 	ld a,#TK_INTGR
      00137C                       3524 rel_exit: 	 
      00137C                       3525 	_drop VSIZE
      009266 CD 93            [ 2]    1     addw sp,#VSIZE 
      009268 A8               [ 4] 3526 	ret 
                                   3527 
                                   3528 ;--------------------------------
                                   3529 ; BASIC: SHOW 
                                   3530 ;  show content of dstack,cstack
                                   3531 ;--------------------------------
      00137F                       3532 show:
      009269 A1 00 27         [ 1] 3533 	ld a,base 
      00926C 19               [ 1] 3534 	push a 
      00926D A1 04 26         [ 4] 3535 	call dots
      009270 12 CD 90         [ 4] 3536 	call dotr 
      009273 60               [ 1] 3537 	pop a 
      009274 0C 01 CD         [ 1] 3538 	ld base,a 
      009277 88               [ 1] 3539 	clr a 
      009278 BD               [ 4] 3540 	ret
                                   3541 
                                   3542 ;--------------------------------------------
                                   3543 ; BASIC: HEX 
                                   3544 ; select hexadecimal base for integer print
                                   3545 ;---------------------------------------------
      00138F                       3546 hex_base:
      009279 A1 00 27 09      [ 1] 3547 	mov base,#16 
      00927D A1               [ 4] 3548 	ret 
                                   3549 
                                   3550 ;--------------------------------------------
                                   3551 ; BASIC: DEC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3552 ; select decimal base for integer print
                                   3553 ;---------------------------------------------
      001394                       3554 dec_base:
      00927E 0D 26 02 20      [ 1] 3555 	mov base,#10
      009282 E3               [ 4] 3556 	ret 
                                   3557 
                                   3558 ;------------------------
                                   3559 ; BASIC: SIZE 
                                   3560 ; return free size in text area
                                   3561 ; output:
                                   3562 ;   A 		TK_INTGR
                                   3563 ;   X 	    size integer
                                   3564 ;--------------------------
      001399                       3565 size:
      009283 CD 90 5A         [ 2] 3566 	ldw x,#tib 
      009286 84 81 00 1C      [ 2] 3567 	subw x,txtend 
      009288 A6 04            [ 1] 3568 	ld a,#TK_INTGR
      009288 A6               [ 4] 3569 	ret 
                                   3570 
                                   3571 
                                   3572 ;------------------------
                                   3573 ; BASIC: UBOUND  
                                   3574 ; return array variable size 
                                   3575 ; output:
                                   3576 ;   A 		TK_INTGR
                                   3577 ;   X 	    array size 
                                   3578 ;--------------------------
      0013A3                       3579 ubound:
      009289 0B CD 92         [ 2] 3580 	ldw x,#tib
      00928C 57 CD 92 64      [ 2] 3581 	subw x,txtend 
      009290 88 A6 0C CD      [ 2] 3582 	ldw y,basicptr 
      009294 92 57 84 81      [ 2] 3583 	cpw y,txtend 
      009298 25 0A            [ 1] 3584 	jrult 1$
      009298 CD 92 88         [ 1] 3585 	push count 
      00929B A1 01            [ 1] 3586 	push #0 
      00929D 27 03 CC         [ 2] 3587 	subw x,(1,sp)
      0013BC                       3588 	_drop 2 
      0092A0 88 09            [ 2]    1     addw sp,#2 
      0092A2 CD               [ 2] 3589 1$:	srlw x 
      0092A3 90 6D C3         [ 2] 3590 	ldw array_size,x
      0092A6 00 20            [ 1] 3591 	ld a,#TK_INTGR
      0092A8 23               [ 4] 3592 	ret 
                                   3593 
                                   3594 ;-----------------------------
                                   3595 ; BASIC: LET var=expr 
                                   3596 ; variable assignement 
                                   3597 ; output:
                                   3598 ;   A 		TK_NONE 
                                   3599 ;-----------------------------
      0013C5                       3600 let:
      0092A9 05 A6 0A         [ 4] 3601 	call next_token 
      0092AC CC 88            [ 1] 3602 	cp a,#TK_VAR 
      0092AE 0B 5D            [ 1] 3603 	jreq let02
      0092B0 27 F8 58         [ 2] 3604 	jp syntax_error
      0013CF                       3605 let02:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0092B3 89 AE 16         [ 4] 3606 	call dpush 
      0092B6 E8 72 F0         [ 4] 3607 	call next_token 
      0092B9 01 5B            [ 1] 3608 	cp a,#TK_EQUAL
      0092BB 02 A6            [ 1] 3609 	jreq 1$
      0092BD 04 81 89         [ 2] 3610 	jp syntax_error
      0092BF                       3611 1$:	
      0092BF 52 01 CD         [ 4] 3612 	call relation   
      0092C2 88 BD            [ 1] 3613 	cp a,#TK_INTGR 
      0092C4 A1 02            [ 1] 3614 	jreq 2$
      0092C6 2B 4C 6B         [ 2] 3615 	jp syntax_error
      0013E6                       3616 2$:	
      0092C9 01 A4            [ 1] 3617 	ldw y,x 
      0092CB 30 A1 10         [ 4] 3618 	call dpop  
      0092CE 27               [ 2] 3619 	ldw (x),y   
      0092CF 04               [ 4] 3620 	ret 
                                   3621 
                                   3622 ;----------------------------
                                   3623 ; BASIC: LIST [[start][,end]]
                                   3624 ; list program lines 
                                   3625 ; form start to end 
                                   3626 ; if empty argument list then 
                                   3627 ; list all.
                                   3628 ;----------------------------
                           000001  3629 	FIRST=1
                           000003  3630 	LAST=3 
                           000005  3631 	LN_PTR=5
                           000006  3632 	VSIZE=6 
      0013ED                       3633 list:
      0013ED                       3634 	_vars VSIZE
      0092D0 7B 01            [ 2]    1     sub sp,#VSIZE 
      0092D2 20 03 1A         [ 2] 3635 	ldw x,txtbgn 
      0092D4 C3 00 1C         [ 2] 3636 	cpw x,txtend 
      0092D4 CD 88            [ 1] 3637 	jrmi 1$
      0092D6 BD 14 6F         [ 2] 3638 	jp list_exit ; nothing to list 
      0092D7 1F 05            [ 2] 3639 1$:	ldw (LN_PTR,sp),x 
      0092D7 A1               [ 2] 3640 	ldw x,(x) 
      0092D8 07 26            [ 2] 3641 	ldw (FIRST,sp),x ; list from first line 
      0092DA 03 FD 20         [ 2] 3642 	ldw x,#0x7fff ; biggest line number 
      0092DD 2D 03            [ 2] 3643 	ldw (LAST,sp),x 
      0092DE CD 11 E4         [ 4] 3644 	call arg_list
      0092DE A1               [ 1] 3645 	tnz a
      0092DF 04 26            [ 1] 3646 	jreq list_start 
      0092E1 02 20            [ 1] 3647 	cp a,#2 
      0092E3 27 07            [ 1] 3648 	jreq 4$
      0092E4 A1 01            [ 1] 3649 	cp a,#1 
      0092E4 A1 02            [ 1] 3650 	jreq first_line 
      0092E6 26 06 CD         [ 2] 3651 	jp syntax_error 
      0092E9 92 98 FE         [ 4] 3652 4$:	call dswap
      001418                       3653 first_line:
      0092EC 20 1D ED         [ 4] 3654 	call dpop 
      0092EE 1F 01            [ 2] 3655 	ldw (FIRST,sp),x 
      0092EE A1 05            [ 1] 3656 	cp a,#1 
      0092F0 26 03            [ 1] 3657 	jreq lines_skip 	
      001421                       3658 last_line:
      0092F2 FE 20 16         [ 4] 3659 	call dpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0092F5 1F 03            [ 2] 3660 	ldw (LAST,sp),x 
      001426                       3661 lines_skip:
      0092F5 A1 0B 26         [ 2] 3662 	ldw x,txtbgn
      0092F8 0C CD            [ 2] 3663 2$:	ldw (LN_PTR,sp),x 
      0092FA 93 A8 89         [ 2] 3664 	cpw x,txtend 
      0092FD A6 0C            [ 1] 3665 	jrpl list_exit 
      0092FF CD               [ 2] 3666 	ldw x,(x) ;line# 
      009300 92 57            [ 2] 3667 	cpw x,(FIRST,sp)
      009302 85 20            [ 1] 3668 	jrpl list_start 
      009304 06 05            [ 2] 3669 	ldw x,(LN_PTR,sp) 
      009305 1C 00 02         [ 2] 3670 	addw x,#2 
      009305 CD               [ 1] 3671 	ld a,(x)
      009306 90               [ 2] 3672 	incw x 
      009307 5A 4F 20         [ 1] 3673 	ld acc8,a 
      00930A 09 5F 00 08      [ 1] 3674 	clr acc16 
      00930B 72 BB 00 08      [ 2] 3675 	addw x,acc16
      00930B A6 11            [ 2] 3676 	jra 2$ 
                                   3677 ; print loop
      001449                       3678 list_start:
      00930D 11 01            [ 2] 3679 	ldw x,(LN_PTR,sp)
      00930F 26 01            [ 1] 3680 3$:	ld a,(2,x) 
      009311 50 14 C2         [ 4] 3681 	call prt_basic_line
      009312 1E 05            [ 2] 3682 	ldw x,(LN_PTR,sp)
      009312 A6 04            [ 1] 3683 	ld a,(2,x)
      009314 C7 00 09         [ 1] 3684 	ld acc8,a 
      009314 5B 01 81 08      [ 1] 3685 	clr acc16 
      009317 72 BB 00 08      [ 2] 3686 	addw x,acc16
      009317 52 05 CD         [ 2] 3687 	cpw x,txtend 
      00931A 92 BF            [ 1] 3688 	jrpl list_exit
      00931C A1 02            [ 2] 3689 	ldw (LN_PTR,sp),x
      00931E 2B               [ 2] 3690 	ldw x,(x)
      00931F 41 03            [ 2] 3691 	cpw x,(LAST,sp)  
      009320 2C 04            [ 1] 3692 	jrsgt list_exit 
      009320 1F 03            [ 2] 3693 	ldw x,(LN_PTR,sp)
      009322 CD 88            [ 2] 3694 	jra 3$
      00146F                       3695 list_exit:
      00146F                       3696 	_drop VSIZE 
      009324 BD A1            [ 2]    1     addw sp,#VSIZE 
      009326 02               [ 4] 3697 	ret
                                   3698 
                                   3699 ;-------------------------
                                   3700 ; print counted string 
                                   3701 ; input:
                                   3702 ;   X 	address of string
                                   3703 ;--------------------------
      001472                       3704 prt_cmd_name:
      009327 2B               [ 1] 3705 	ld a,(x)
      009328 34               [ 2] 3706 	incw x
      009329 6B 05            [ 1] 3707 	and a,#15  
      00932B A4               [ 1] 3708 	push a 
      00932C 30 A1            [ 1] 3709 1$: tnz (1,sp) 
      00932E 20 27            [ 1] 3710 	jreq 9$
      009330 07               [ 1] 3711 	ld a,(x)
      009331 7B 05 CD         [ 4] 3712 	call putc 
      009334 90               [ 2] 3713 	incw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009335 5A 20            [ 1] 3714 	dec (1,sp)	 
      009337 25 F3            [ 2] 3715 	jra 1$
      009338 84               [ 1] 3716 9$: pop a 
      009338 CD               [ 4] 3717 	ret	
                                   3718 
                                   3719 ;--------------------------
                                   3720 ; print TK_QSTR
                                   3721 ; converting control character
                                   3722 ; to backslash sequence
                                   3723 ; input:
                                   3724 ;   X        char *
                                   3725 ;-----------------------------
      001486                       3726 prt_quote:
      009339 92 BF            [ 1] 3727 	ld a,#'"
      00933B A1 04 27         [ 4] 3728 	call putc 
      00933E 03               [ 1] 3729 1$:	ld a,(x)
      00933F CC 88            [ 1] 3730 	jreq 9$
      009341 09               [ 2] 3731 	incw x 
      009342 1F 01            [ 1] 3732 	cp a,#SPACE 
      009344 7B 05            [ 1] 3733 	jrult 3$
      009346 A1 20 26         [ 4] 3734 	call putc
      009349 05 CD            [ 1] 3735 	cp a,#'\ 
      00934B 91 33            [ 1] 3736 	jrne 1$ 
      00149A                       3737 2$:
      00934D 20 D1 A1         [ 4] 3738 	call putc 
      009350 21 26            [ 2] 3739 	jra 1$
      009352 05               [ 1] 3740 3$: push a 
      009353 CD 91            [ 1] 3741 	ld a,#'\
      009355 7B 20 C8         [ 4] 3742 	call putc 
      009358 CD               [ 1] 3743 	pop a 
      009359 91 BF            [ 1] 3744 	sub a,#7
      00935B 20 C3 1E         [ 1] 3745 	ld acc8,a 
      00935E 03 A6 04 08      [ 1] 3746 	clr acc16
      009361 90 AE 0C A9      [ 2] 3747 	ldw y,#escaped 
      009361 5B 05 81 08      [ 2] 3748 	addw y,acc16 
      009364 90 F6            [ 1] 3749 	ld a,(y)
      009364 52 05            [ 2] 3750 	jra 2$
      009366 CD 93            [ 1] 3751 9$: ld a,#'"
      009368 17 A1 02         [ 4] 3752 	call putc 
      00936B 2B               [ 2] 3753 	incw x 
      00936C 38               [ 4] 3754 	ret
                                   3755 
                                   3756 
                                   3757 ;--------------------------
                                   3758 ; decompile line from token list 
                                   3759 ; input:
                                   3760 ;   A       stop at this position 
                                   3761 ;   X 		pointer at line
                                   3762 ; output:
                                   3763 ;   none 
                                   3764 ;--------------------------	
                           000001  3765 	BASE_SAV=1
                           000002  3766 	WIDTH_SAV=2
                           000003  3767 	XSAVE=3
                           000005  3768 	LLEN=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                           000005  3769 	VSIZE=5 
      0014C2                       3770 prt_basic_line:
      0014C2                       3771 	_vars VSIZE
      00936D 1F 03            [ 2]    1     sub sp,#VSIZE 
      00936F CD 88            [ 1] 3772 	ld (LLEN,sp),a  
      009371 BD A1 02         [ 1] 3773 	ld a,base
      009374 2B 2B            [ 1] 3774 	ld (BASE_SAV,sp),a  
      009376 6B 05 A4         [ 1] 3775 	ld a,tab_width 
      009379 30 A1            [ 1] 3776 	ld (WIDTH_SAV,sp),a 
      00937B 10 27 07         [ 2] 3777 	ldw ptr16,x
      00937E 7B               [ 2] 3778 	ldw x,(x)
      00937F 05 CD 90 5A      [ 1] 3779 	mov base,#10
      009383 20 1C 00 22      [ 1] 3780 	mov tab_width,#5
      009385 CD 09 E7         [ 4] 3781 	call print_int ; print line number 
      009385 CD 93            [ 1] 3782 	ld a,#SPACE 
      009387 17 A1 04         [ 4] 3783 	call putc 
      00938A 27 03 CC 88      [ 1] 3784 	clr tab_width
      00938E 09 1F 01         [ 2] 3785 	ldw x,#3
      009391 7B               [ 1] 3786 1$:	ld a,xl 
      009392 05 A1            [ 1] 3787 	cp a,(LLEN,sp)
      009394 10 26            [ 1] 3788 	jrmi 20$
      009396 05 CD 91         [ 2] 3789 	jp 90$
      0014F3                       3790 20$:	 
      009399 25 20 D1 CD      [ 4] 3791 	ld a,([ptr16],x)
      00939D 91               [ 2] 3792 	incw x 
      00939E 2D 20            [ 2] 3793 	ldw (XSAVE,sp),x 
      0093A0 CC 1E            [ 1] 3794 	cp a,#TK_CMD 
      0093A2 03 A6            [ 1] 3795 	jrult 5$
      0093A4 04 08            [ 1] 3796 	cp a,#TK_CFUNC 
      0093A5 22 2F            [ 1] 3797 	jrugt 4$
      001502                       3798 2$:	
      0093A5 5B 05 81 13      [ 5] 3799 	ldw x,([ptr16],x)
      0093A8 A3 17 2A         [ 2] 3800 	cpw x,#rem 
      0093A8 52 05            [ 1] 3801 	jrne 3$
      0093AA CD 93            [ 1] 3802 	ld a,#''
      0093AC 64 A1 02         [ 4] 3803 	call putc 
      0093AF 2B 4B            [ 2] 3804 	ldw x,(XSAVE,sp)
      0093B1 1F 03 CD         [ 2] 3805 	addw x,#2
      0093B4 88 BD A1 02      [ 2] 3806 	addw x,ptr16  
      0093B8 2B 3E DE         [ 4] 3807 	call puts 
      0093BA CC 15 FA         [ 2] 3808 	jp 90$ 
      0093BA 6B 05 A4         [ 4] 3809 3$:	call cmd_name
      0093BD 30 A1 30         [ 4] 3810 	call prt_cmd_name
      0093C0 27 07            [ 1] 3811 	ld a,#SPACE 
      0093C2 7B 05 CD         [ 4] 3812 	call putc 
      0093C5 90 5A            [ 2] 3813 	ldw x,(XSAVE,sp)
      0093C7 20 2F 02         [ 2] 3814 	addw x,#2
      0093C9 20 BA            [ 2] 3815 	jra 1$
      0093C9 CD 93            [ 1] 3816 4$: cp a,#TK_QSTR 
      0093CB 64 A1            [ 1] 3817 	jrne 5$
      0093CD 04 27 03 CC      [ 2] 3818 	addw x,ptr16
      0093D1 88 09 1F         [ 4] 3819 	call prt_quote 
      0093D4 01 CD 91 2D      [ 2] 3820 	subw x,ptr16  
      0093D8 26 06            [ 2] 3821 	jra 1$
      0093DA 35 02            [ 1] 3822 5$:	cp a,#TK_VAR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0093DC 00 0A            [ 1] 3823 	jrne 6$ 
      0093DE 20 0C 00 13      [ 5] 3824 	ldw x,([ptr16],x)
      0093E0 1D 00 24         [ 2] 3825 	subw x,#vars 
      0093E0 2C               [ 1] 3826 	ld a,xl
      0093E1 06               [ 1] 3827 	srl a 
      0093E2 35 04            [ 1] 3828 	add a,#'A 
      0093E4 00 0A 20         [ 4] 3829 	call putc 
      0093E7 04 20            [ 1] 3830 	ld a,#SPACE 
      0093E8 CD 01 CB         [ 4] 3831 	call putc 
      0093E8 35 01            [ 2] 3832 	ldw x,(XSAVE,sp)
      0093EA 00 0A 02         [ 2] 3833 	addw x,#2 
      0093EC 20 8B            [ 2] 3834 	jra 1$ 
      0093EC 5F C6            [ 1] 3835 6$: cp a,#TK_ARRAY 
      0093EE 00 0A            [ 1] 3836 	jrne 7$
      0093F0 14 05            [ 1] 3837 	ld a,#'@ 
      0093F2 4D 27 05         [ 4] 3838 	call putc 
      0093F5 5C 03            [ 2] 3839 	ldw x,(XSAVE,sp)
      0093F6 CC 14 EB         [ 2] 3840 	jp 1$ 
      0093F6 20 02            [ 1] 3841 7$: cp a,#TK_INTGR 
      0093F8 1E 03            [ 1] 3842 	jrne 8$
      0093FA 72 DE 00 13      [ 5] 3843 	ldw x,([ptr16],x)
      0093FA A6 04 E7         [ 4] 3844 	call print_int
      0093FC A6 20            [ 1] 3845 	ld a,#SPACE 
      0093FC 5B 05 81         [ 4] 3846 	call putc 
      0093FF 1E 03            [ 2] 3847 	ldw x,(XSAVE,sp)
      0093FF C6 00 07         [ 2] 3848 	addw x,#2 
      009402 88 CD 90         [ 2] 3849 	jp 1$
      009405 C4 CD            [ 1] 3850 8$: cp a,#TK_GT 
      009407 90 F8            [ 1] 3851 	jrmi 9$
      009409 84 C7            [ 1] 3852 	cp a,#TK_NE 
      00940B 00 07            [ 1] 3853 	jrugt 9$
      00940D 4F 81            [ 1] 3854 	sub a,#TK_GT  
      00940F 48               [ 1] 3855 	sll a 
      00940F 35 10            [ 1] 3856 	clrw y 
      009411 00 07            [ 1] 3857 	ld yl,a 
      009413 81 A9 16 13      [ 2] 3858 	addw y,#relop_str 
      009414 90 FE            [ 2] 3859 	ldw y,(y)
      009414 35               [ 1] 3860 	ldw x,y 
      009415 0A 00 07         [ 4] 3861 	call puts 
      009418 81 03            [ 2] 3862 	ldw x,(XSAVE,sp)
      009419 CC 14 EB         [ 2] 3863 	jp 1$
      009419 AE 16            [ 1] 3864 9$: cp a,#TK_PLUS 
      00941B E8 72            [ 1] 3865 	jrne 10$
      00941D B0 00            [ 1] 3866 	ld a,#'+
      00941F 1D A6            [ 2] 3867 	jra 80$ 
      009421 04 81            [ 1] 3868 10$: cp a,#TK_MINUS
      009423 26 04            [ 1] 3869 	jrne 11$
      009423 AE 16            [ 1] 3870 	ld a,#'-
      009425 E8 72            [ 2] 3871 	jra 80$
      009427 B0 00            [ 1] 3872 11$: cp a,#TK_MULT 
      009429 1D 90            [ 1] 3873 	jrmi 12$
      00942B CE 00            [ 1] 3874 	cp a,#TK_MOD 
      00942D 05 90            [ 1] 3875 	jrugt 12$
      00942F C3 00            [ 1] 3876 	sub a,#0x20
      009431 1D               [ 1] 3877 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009432 25               [ 1] 3878 	ld xl,a 
      009433 0A 3B 00         [ 2] 3879 	addw x,#mul_char 
      009436 04               [ 1] 3880 	ld a,(x)
      009437 4B 00            [ 2] 3881 	jra 80$ 
      009439 72 F0            [ 1] 3882 12$: cp a,#TK_LPAREN 
      00943B 01 5B            [ 1] 3883 	jrmi 13$
      00943D 02 54            [ 1] 3884 	cp a,#TK_SHARP 
      00943F CF 00            [ 1] 3885 	jrugt 13$
      009441 20 A6            [ 1] 3886 	sub a,#TK_LPAREN
      009443 04               [ 1] 3887 	clrw x 
      009444 81               [ 1] 3888 	ld xl,a 
      009445 1C 16 0C         [ 2] 3889 	addw x,#single_char 
      009445 CD               [ 1] 3890 	ld a,(x)
      009446 88 BD            [ 2] 3891 	jra 80$
      009448 A1 05            [ 1] 3892 13$: cp a,#TK_CHAR 
      00944A 27 03            [ 1] 3893 	jrne 14$
      00944C CC 88            [ 1] 3894 	ld a,#'\
      00944E 09 01 CB         [ 4] 3895 	call putc 
      00944F 1E 03            [ 2] 3896 	ldw x,(XSAVE,sp)
      00944F CD 90 60 CD      [ 4] 3897 	ld a,([ptr16],x)
      009453 88               [ 2] 3898 	incw x 
      009454 BD A1            [ 2] 3899 	ldw (XSAVE,sp),x 
      009456 32 27 03         [ 4] 3900 	call putc 
      009459 CC 88 09         [ 2] 3901 	jp 1$ 
      00945C A6 3A            [ 1] 3902 14$: ld a,#':
      00945C CD 93 A8         [ 4] 3903 80$: call putc 
      00945F A1 04            [ 2] 3904 	ldw x,(XSAVE,sp)
      009461 27 03 CC         [ 2] 3905 	jp 1$ 
      0015FA                       3906 90$: 
      009464 88 09            [ 1] 3907 	ld a,#CR 
      009466 CD 01 CB         [ 4] 3908 	call putc
      009466 90 93            [ 1] 3909 	ld a,(WIDTH_SAV,sp) 
      009468 CD 90 6D         [ 1] 3910 	ld tab_width,a 
      00946B FF 81            [ 1] 3911 	ld a,(BASE_SAV,sp) 
      00946D C7 00 06         [ 1] 3912 	ld base,a
      001609                       3913 	_drop VSIZE 
      00946D 52 06            [ 2]    1     addw sp,#VSIZE 
      00946F CE               [ 4] 3914 	ret 	
      009470 00 1B C3 00           3915 single_char: .byte '(',')',',','#'
      009474 1D 2B 03              3916 mul_char: .byte '*','/','%'
      009477 CC 94 EF 1F 05 FE 1F  3917 relop_str: .word gt,equal,ge,lt,le,ne 
             01 AE 7F FF 1F
      009483 03 CD                 3918 gt: .asciz ">"
      009485 92 64                 3919 equal: .asciz "="
      009487 4D 27 3F              3920 ge: .asciz ">="
      00948A A1 02                 3921 lt: .asciz "<"
      00948C 27 07 A1              3922 le: .asciz "<="
      00948F 01 27 06              3923 ne:  .asciz "<>"
                                   3924 
                                   3925 
                                   3926 ;---------------------------------
                                   3927 ; BASIC: PRINT|? arg_list 
                                   3928 ; print values from argument list
                                   3929 ;----------------------------------
                           000001  3930 	COMMA=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                           000001  3931 	VSIZE=1
      00162E                       3932 print:
      009492 CC 88            [ 1] 3933 push #0 ; local variable COMMA 
      001630                       3934 reset_comma:
      009494 09 CD            [ 1] 3935 	clr (COMMA,sp)
      001632                       3936 prt_loop:
      009496 90 7A 28         [ 4] 3937 	call relation 
      009498 A1 01            [ 1] 3938 	cp a,#TK_COLON 
      009498 CD 90            [ 1] 3939 	jreq print_exit   
      00949A 6D 1F            [ 1] 3940 	cp a,#TK_INTGR 
      00949C 01 A1            [ 1] 3941 	jrne 0$ 
      00949E 01 27 05         [ 4] 3942 	call print_int 
      0094A1 20 EE            [ 2] 3943 	jra reset_comma
      001642                       3944 0$: 	
      0094A1 CD 90 6D         [ 4] 3945 	call next_token
      0094A4 1F 03            [ 1] 3946 	cp a,#TK_NONE 
      0094A6 27 41            [ 1] 3947 	jreq print_exit 
      0094A6 CE 00            [ 1] 3948 1$:	cp a,#TK_QSTR
      0094A8 1B 1F            [ 1] 3949 	jrne 2$   
      0094AA 05 C3 00         [ 4] 3950 	call puts
      0094AD 1D 2A            [ 2] 3951 	jra reset_comma
      0094AF 3F FE            [ 1] 3952 2$: cp a,#TK_CHAR 
      0094B1 13 01            [ 1] 3953 	jrne 3$
      0094B3 2A               [ 1] 3954 	ld a,xl 
      0094B4 14 1E 05         [ 4] 3955 	call putc 
      0094B7 1C 00            [ 2] 3956 	jra reset_comma 
      00165C                       3957 3$: 	
      0094B9 02 F6            [ 1] 3958 	cp a,#TK_CFUNC 
      0094BB 5C C7            [ 1] 3959 	jrne 4$ 
      0094BD 00               [ 4] 3960 	call (x)
      0094BE 0A               [ 1] 3961 	ld a,xl 
      0094BF 72 5F 00         [ 4] 3962 	call putc
      0094C2 09 72            [ 2] 3963 	jra reset_comma 
      001667                       3964 4$: 
      0094C4 BB 00            [ 1] 3965 	cp a,#TK_COMMA 
      0094C6 09 20            [ 1] 3966 	jrne 5$
      0094C8 E0 01            [ 1] 3967 	cpl (COMMA,sp) 
      0094C9 CC 16 32         [ 2] 3968 	jp prt_loop   
      001670                       3969 5$: 
      0094C9 1E 05            [ 1] 3970 	cp a,#TK_SHARP
      0094CB E6 02            [ 1] 3971 	jrne 7$
      0094CD CD 95 42         [ 4] 3972 	call next_token
      0094D0 1E 05            [ 1] 3973 	cp a,#TK_INTGR 
      0094D2 E6 02            [ 1] 3974 	jreq 6$
      0094D4 C7 00 0A         [ 2] 3975 	jp syntax_error 
      00167E                       3976 6$:
      0094D7 72               [ 1] 3977 	ld a,xl 
      0094D8 5F 00            [ 1] 3978 	and a,#15 
      0094DA 09 72 BB         [ 1] 3979 	ld tab_width,a 
      0094DD 00 09 C3         [ 2] 3980 	jp reset_comma 
      001687                       3981 7$:	
      0094E0 00 1D 2A         [ 4] 3982 	call unget_token
      00168A                       3983 print_exit:
      0094E3 0B 1F            [ 1] 3984 	tnz (COMMA,sp)
      0094E5 05 FE            [ 1] 3985 	jrne 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0094E7 13 03            [ 1] 3986 	ld a,#CR 
      0094E9 2C 04 1E         [ 4] 3987     call putc 
      001693                       3988 9$:	_drop VSIZE 
      0094EC 05 20            [ 2]    1     addw sp,#VSIZE 
      0094EE DC               [ 4] 3989 	ret 
                                   3990 
                                   3991 ;----------------------
                                   3992 ; 'save_context' and
                                   3993 ; 'rest_context' must be 
                                   3994 ; called at the same 
                                   3995 ; call stack depth 
                                   3996 ; i.e. SP must have the 
                                   3997 ; save value at  
                                   3998 ; entry point of both 
                                   3999 ; routine. 
                                   4000 ;---------------------
                           000006  4001 	CTXT_SIZE=6 ; size of saved data 
                                   4002 ;--------------------
                                   4003 ; save current BASIC
                                   4004 ; interpreter context 
                                   4005 ; on cstack 
                                   4006 ;--------------------
      0094EF                       4007 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001696                       4008 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001696                       4009 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001696                       4010 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001696                       4011 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      001696                       4012 save_context:
      0094EF 5B 06 81         [ 2] 4013 	ldw x,basicptr 
      0094F2 1F 03            [ 2] 4014 	ldw (BPTR,sp),x
      0094F2 F6 5C A4         [ 1] 4015 	ld a,in 
      0094F5 0F 88            [ 1] 4016 	ld (IN,sp),a
      0094F7 0D 01 27         [ 1] 4017 	ld a,count 
      0094FA 09 F6            [ 1] 4018 	ld (CNT,sp),a  
      0094FC CD               [ 4] 4019 	ret
                                   4020 
                                   4021 ;-----------------------
                                   4022 ; restore previously saved 
                                   4023 ; BASIC interpreter context 
                                   4024 ; from cstack 
                                   4025 ;-------------------------
      0016A6                       4026 rest_context:
      0094FD 82 4B            [ 2] 4027 	ldw x,(BPTR,sp)
      0094FF 5C 0A 01         [ 2] 4028 	ldw basicptr,x 
      009502 20 F3            [ 1] 4029 	ld a,(IN,sp)
      009504 84 81 01         [ 1] 4030 	ld in,a
      009506 7B 08            [ 1] 4031 	ld a,(CNT,sp)
      009506 A6 22 CD         [ 1] 4032 	ld count,a  
      009509 82               [ 4] 4033 	ret
                                   4034 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4035 ;------------------------------------------
                                   4036 ; BASIC: INPUT [string],var[,[string],var]
                                   4037 ; input value in variables 
                                   4038 ; [string] optionally can be used as prompt 
                                   4039 ;-----------------------------------------
                           000001  4040 	CX_BPTR=1
                           000003  4041 	CX_LNO=3
                           000004  4042 	CX_IN=4
                           000005  4043 	CX_CNT=5
                           000006  4044 	SKIP=6
                           000007  4045 	VSIZE=7
      0016B6                       4046 input_var:
      00950A 4B F6 27 2D 5C   [ 2] 4047 	btjt flags,#FRUN,1$ 
      00950F A1 20            [ 1] 4048 	ld a,#ERR_RUN_ONLY 
      009511 25 0C CD         [ 2] 4049 	jp tb_error 
      0016C0                       4050 1$:	_vars VSIZE 
      009514 82 4B            [ 2]    1     sub sp,#VSIZE 
      0016C2                       4051 input_loop:
      009516 A1 5C            [ 1] 4052 	clr (SKIP,sp)
      009518 26 F1 3D         [ 4] 4053 	call next_token 
      00951A A1 00            [ 1] 4054 	cp a,#TK_NONE 
      00951A CD 82            [ 1] 4055 	jreq input_exit 
      00951C 4B 20            [ 1] 4056 	cp a,#TK_QSTR 
      00951E EC 88            [ 1] 4057 	jrne 1$ 
      009520 A6 5C CD         [ 4] 4058 	call puts 
      009523 82 4B            [ 1] 4059 	cpl (SKIP,sp)
      009525 84 A0 07         [ 4] 4060 	call next_token 
      009528 C7 00            [ 1] 4061 1$: cp a,#TK_VAR  
      00952A 0A 72            [ 1] 4062 	jreq 2$ 
      00952C 5F 00 09         [ 2] 4063 	jp syntax_error
      00952F 90 AE 8D         [ 4] 4064 2$:	call dpush 
      009532 29 72            [ 1] 4065 	tnz (SKIP,sp)
      009534 B9 00            [ 1] 4066 	jrne 21$ 
      009536 09 90            [ 1] 4067 	ld a,#':
      009538 F6 20 DF         [ 1] 4068 	ld pad+1,a 
      00953B A6 22 CD 82      [ 1] 4069 	clr pad+2
      00953F 4B 5C 81         [ 2] 4070 	ldw x,#pad 
      009542 CD 01 DE         [ 4] 4071 	call puts   
      0016F4                       4072 21$:
      009542 52 05 6B         [ 4] 4073 	call save_context 
      009545 05 C6 00         [ 2] 4074 	ldw x,#tib 
      009548 07 6B 01         [ 2] 4075 	ldw basicptr,x  
      00954B C6 00 23 6B      [ 1] 4076 	clr count  
      00954F 02 CF 00         [ 4] 4077 	call readln 
      009552 14 FE 35 0A      [ 1] 4078 	clr in 
      009556 00 07 35         [ 4] 4079 	call relation 
      009559 05 00            [ 1] 4080 	cp a,#TK_INTGR
      00955B 23 CD            [ 1] 4081 	jreq 3$ 
      00955D 8A 67 A6         [ 2] 4082 	jp syntax_error
      009560 20 CD 82         [ 4] 4083 3$: call dpush 
      009563 4B 72 5F         [ 4] 4084 	call store 
      009566 00 23 AE         [ 4] 4085 	call rest_context
      009569 00 03 9F         [ 4] 4086 	call next_token 
      00956C 11 05            [ 1] 4087 	cp a,#TK_COMMA 
      00956E 2B 03            [ 1] 4088 	jrne 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009570 CC 96            [ 2] 4089 	jra input_loop 
      009572 7A 0F DA         [ 4] 4090 4$:	call unget_token 
      009573                       4091 input_exit:
      001727                       4092 	_drop VSIZE 
      009573 72 D6            [ 2]    1     addw sp,#VSIZE 
      009575 00               [ 4] 4093 	ret 
                                   4094 
                                   4095 
                                   4096 ;---------------------
                                   4097 ; BASIC: REMARK | ' 
                                   4098 ; skip comment to end of line 
                                   4099 ;---------------------- 
      00172A                       4100 rem:
      009576 14 5C 1F 03 A1   [ 1] 4101  	mov count,in 
      00957B 06               [ 4] 4102 	ret 
                                   4103 
                                   4104 ;---------------------
                                   4105 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   4106 ; read in loop 'addr'  
                                   4107 ; apply & 'mask' to value 
                                   4108 ; loop while result==0.  
                                   4109 ; if 'xor_mask' given 
                                   4110 ; apply ^ in second  
                                   4111 ; loop while result==0 
                                   4112 ;---------------------
                           000001  4113 	XMASK=1 
                           000002  4114 	MASK=2
                           000003  4115 	ADDR=3
                           000004  4116 	VSIZE=4
      001730                       4117 wait: 
      001730                       4118 	_vars VSIZE
      00957C 25 44            [ 2]    1     sub sp,#VSIZE 
      00957E A1 08            [ 1] 4119 	clr (XMASK,sp) 
      009580 22 2F E4         [ 4] 4120 	call arg_list 
      009582 A1 02            [ 1] 4121 	cp a,#2
      009582 72 DE            [ 1] 4122 	jruge 0$
      009584 00 14 A3         [ 2] 4123 	jp syntax_error 
      009587 97 AA            [ 1] 4124 0$:	cp a,#3
      009589 26 14            [ 1] 4125 	jrult 1$
      00958B A6 27 CD         [ 4] 4126 	call dpop 
      00958E 82               [ 1] 4127 	ld a,xl
      00958F 4B 1E            [ 1] 4128 	ld (XMASK,sp),a 
      009591 03 1C 00         [ 4] 4129 1$: call dpop ; mask 
      009594 02               [ 1] 4130 	ld a,xl 
      009595 72 BB            [ 1] 4131 	ld (MASK,sp),a 
      009597 00 14 CD         [ 4] 4132 	call dpop ; address 
      00959A 82               [ 1] 4133 2$:	ld a,(x)
      00959B 5E CC            [ 1] 4134 	and a,(MASK,sp)
      00959D 96 7A            [ 1] 4135 	xor a,(XMASK,sp)
      00959F CD 91            [ 1] 4136 	jreq 2$ 
      001758                       4137 	_drop VSIZE 
      0095A1 D0 CD            [ 2]    1     addw sp,#VSIZE 
      0095A3 94               [ 4] 4138 	ret 
                                   4139 
                                   4140 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4141 ; BASIC: BSET addr,mask
                                   4142 ; set bits at 'addr' corresponding 
                                   4143 ; to those of 'mask' that are at 1.
                                   4144 ; arguments:
                                   4145 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4146 ;   mask        mask|addr
                                   4147 ; output:
                                   4148 ;	none 
                                   4149 ;--------------------------
      00175B                       4150 bit_set:
      0095A4 F2 A6 20         [ 4] 4151 	call arg_list 
      0095A7 CD 82            [ 1] 4152 	cp a,#2	 
      0095A9 4B 1E            [ 1] 4153 	jreq 1$ 
      0095AB 03 1C 00         [ 2] 4154 	jp syntax_error
      001765                       4155 1$: 
      0095AE 02 20 BA         [ 4] 4156 	call dpop ; mask 
      0095B1 A1               [ 1] 4157 	ld a,xl 
      0095B2 0A 26 0D         [ 4] 4158 	call dpop ; addr  
      0095B5 72               [ 1] 4159 	or a,(x)
      0095B6 BB               [ 1] 4160 	ld (x),a
      0095B7 00               [ 4] 4161 	ret 
                                   4162 
                                   4163 ;---------------------
                                   4164 ; BASIC: BRES addr,mask
                                   4165 ; reset bits at 'addr' corresponding 
                                   4166 ; to those of 'mask' that are at 1.
                                   4167 ; arguments:
                                   4168 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4169 ;   mask	    ~mask&*addr  
                                   4170 ; output:
                                   4171 ;	none 
                                   4172 ;--------------------------
      00176F                       4173 bit_reset:
      0095B8 14 CD 95         [ 4] 4174 	call arg_list 
      0095BB 06 72            [ 1] 4175 	cp a,#2  
      0095BD B0 00            [ 1] 4176 	jreq 1$ 
      0095BF 14 20 A9         [ 2] 4177 	jp syntax_error
      001779                       4178 1$: 
      0095C2 A1 05 26         [ 4] 4179 	call dpop ; mask 
      0095C5 1A               [ 1] 4180 	ld a,xl 
      0095C6 72               [ 1] 4181 	cpl a 
      0095C7 DE 00 14         [ 4] 4182 	call dpop ; addr  
      0095CA 1D               [ 1] 4183 	and a,(x)
      0095CB 00               [ 1] 4184 	ld (x),a 
      0095CC 25               [ 4] 4185 	ret 
                                   4186 
                                   4187 ;---------------------
                                   4188 ; BASIC: BTOGL addr,mask
                                   4189 ; toggle bits at 'addr' corresponding 
                                   4190 ; to those of 'mask' that are at 1.
                                   4191 ; arguments:
                                   4192 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4193 ;   mask	    mask^*addr  
                                   4194 ; output:
                                   4195 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4196 ;--------------------------
      001784                       4197 bit_toggle:
      0095CD 9F 44 AB         [ 4] 4198 	call arg_list 
      0095D0 41 CD            [ 1] 4199 	cp a,#2 
      0095D2 82 4B            [ 1] 4200 	jreq 1$ 
      0095D4 A6 20 CD         [ 2] 4201 	jp syntax_error
      0095D7 82 4B 1E         [ 4] 4202 1$: call dpop ; mask 
      0095DA 03               [ 1] 4203 	ld a,xl 
      0095DB 1C 00 02         [ 4] 4204 	call dpop ; addr  
      0095DE 20               [ 1] 4205 	xor a,(x)
      0095DF 8B               [ 1] 4206 	ld (x),a 
      0095E0 A1               [ 4] 4207 	ret 
                                   4208 
                                   4209 
                                   4210 ;---------------------
                                   4211 ; BASIC: BTEST(addr,bit)
                                   4212 ; return bit value at 'addr' 
                                   4213 ; bit is in range {0..7}.
                                   4214 ; arguments:
                                   4215 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4216 ;   bit 	    bit position {0..7}  
                                   4217 ; output:
                                   4218 ;	none 
                                   4219 ;--------------------------
      001798                       4220 bit_test:
      0095E1 02 26 0A         [ 4] 4221 	call func_args 
      0095E4 A6 40            [ 1] 4222 	cp a,#2
      0095E6 CD 82            [ 1] 4223 	jreq 0$
      0095E8 4B 1E 03         [ 2] 4224 	jp syntax_error
      0017A2                       4225 0$:	
      0095EB CC 95 6B         [ 4] 4226 	call dpop 
      0095EE A1               [ 1] 4227 	ld a,xl 
      0095EF 04 26            [ 1] 4228 	and a,#7
      0095F1 14               [ 1] 4229 	push a 
      0095F2 72 DE            [ 1] 4230 	ld a,#1 
      0095F4 00 14            [ 1] 4231 1$: tnz (1,sp)
      0095F6 CD 8A            [ 1] 4232 	jreq 2$
      0095F8 67               [ 1] 4233 	sll a 
      0095F9 A6 20            [ 1] 4234 	dec (1,sp)
      0095FB CD 82            [ 2] 4235 	jra 1$
      0095FD 4B 1E 03         [ 4] 4236 2$: call dpop 
      009600 1C               [ 1] 4237 	and a,(x)
      009601 00 02            [ 1] 4238 	jreq 3$
      009603 CC 95            [ 1] 4239 	ld a,#1 
      009605 6B               [ 1] 4240 3$:	clrw x 
      009606 A1               [ 1] 4241 	ld xl,a 
      009607 31 2B            [ 1] 4242 	ld a,#TK_INTGR
      0017C0                       4243 	_drop 1 
      009609 1A A1            [ 2]    1     addw sp,#1 
      00960B 35               [ 4] 4244 	ret
                                   4245 
                                   4246 
                                   4247 ;--------------------
                                   4248 ; BASIC: POKE addr,byte
                                   4249 ; put a byte at addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4250 ;--------------------
      0017C3                       4251 poke:
      00960C 22 16 A0         [ 4] 4252 	call arg_list 
      00960F 31 48            [ 1] 4253 	cp a,#2
      009611 90 5F            [ 1] 4254 	jreq 1$
      009613 90 97 72         [ 2] 4255 	jp syntax_error
      0017CD                       4256 1$:	
      009616 A9 96 93         [ 4] 4257 	call dpop 
      009619 90               [ 1] 4258     ld a,xl 
      00961A FE 93 CD         [ 4] 4259 	call dpop 
      00961D 82               [ 1] 4260 	ld (x),a 
      00961E 5E               [ 4] 4261 	ret 
                                   4262 
                                   4263 ;-----------------------
                                   4264 ; BASIC: PEEK(addr)
                                   4265 ; get the byte at addr 
                                   4266 ; input:
                                   4267 ;	none 
                                   4268 ; output:
                                   4269 ;	X 		value 
                                   4270 ;-----------------------
      0017D6                       4271 peek:
      00961F 1E 03 CC         [ 4] 4272 	call func_args
      009622 95 6B            [ 1] 4273 	cp a,#1
      009624 A1 10            [ 1] 4274 	jreq 1$
      009626 26 04 A6         [ 2] 4275 	jp syntax_error
      009629 2B 20 46         [ 4] 4276 1$:	call dpop 
      00962C A1               [ 1] 4277 	ld a,(x)
      00962D 11               [ 1] 4278 	clrw x 
      00962E 26               [ 1] 4279 	ld xl,a 
      00962F 04 A6            [ 1] 4280 	ld a,#TK_INTGR
      009631 2D               [ 4] 4281 	ret 
                                   4282 
                                   4283 ;----------------------------
                                   4284 ; BASIC: XPEEK(page,addr)
                                   4285 ; read extended memory byte
                                   4286 ; page in range {0,1,2}
                                   4287 ;----------------------------
      0017E9                       4288 xpeek:
      009632 20 3E A1         [ 4] 4289 	call func_args 
      009635 20 2B            [ 1] 4290 	cp a,#2 
      009637 0E A1            [ 1] 4291 	jreq 1$
      009639 22 22 0A         [ 2] 4292 	jp syntax_error
      0017F3                       4293 1$: 
      00963C A0 20 5F         [ 4] 4294 	call dpop 
      00963F 97 1C 96         [ 2] 4295 	ldw farptr+1,x 
      009642 90 F6 20         [ 4] 4296 	call dpop 
      009645 2C               [ 1] 4297 	ld a,xl 
      009646 A1 0B 2B         [ 1] 4298 	ld farptr,a 
      009649 0E               [ 1] 4299 	clrw x
      00964A A1 0E 22 0A      [ 5] 4300 	ldf a,[farptr]
      00964E A0               [ 1] 4301 	ld xl,a 
      00964F 0B 5F            [ 1] 4302 	ld a,#TK_INTGR 
      009651 97               [ 4] 4303 	ret 
                                   4304 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4305 ;---------------------------
                                   4306 ; BASIC IF expr : instructions
                                   4307 ; evaluate expr and if true 
                                   4308 ; execute instructions on same line. 
                                   4309 ;----------------------------
      001809                       4310 if: 
      009652 1C 96 8C         [ 4] 4311 	call relation 
      009655 F6 20            [ 1] 4312 	cp a,#TK_INTGR
      009657 1A A1            [ 1] 4313 	jreq 1$ 
      009659 03 26 14         [ 2] 4314 	jp syntax_error
      00965C A6               [ 1] 4315 1$:	clr a 
      00965D 5C               [ 2] 4316 	tnzw x 
      00965E CD 82            [ 1] 4317 	jrne 9$  
                                   4318 ;skip to next line
      009660 4B 1E 03 72 D6   [ 1] 4319 	mov in,count
      009665 00               [ 4] 4320 9$:	ret 
                                   4321 
                                   4322 ;------------------------
                                   4323 ; BASIC: FOR var=expr 
                                   4324 ; set variable to expression 
                                   4325 ; leave variable address 
                                   4326 ; on dstack and set
                                   4327 ; FLOOP bit in 'flags'
                                   4328 ;-----------------
                           000001  4329 	RETL1=1
                           000003  4330 	INW=3
                           000005  4331 	BPTR=5
      00181D                       4332 for: ; { -- var_addr }
      009666 14 5C            [ 1] 4333 	ld a,#TK_VAR 
      009668 1F 03 CD         [ 4] 4334 	call expect
      00966B 82 4B CC         [ 4] 4335 	call dpush 
      00966E 95 6B A6         [ 4] 4336 	call let02 
      009671 3A CD 82 4B      [ 1] 4337 	bset flags,#FLOOP 
                                   4338 ; open space on cstack for BPTR and INW 
      009675 1E               [ 2] 4339 	popw x ; call return address 
      00182D                       4340 	_vars 4
      009676 03 CC            [ 2]    1     sub sp,#4 
      009678 95               [ 2] 4341 	pushw x  ; RETL1 
      009679 6B               [ 1] 4342 	clrw x 
      00967A 1F 05            [ 2] 4343 	ldw (BPTR,sp),x 
      00967A A6 0D            [ 2] 4344 	ldw (INW,sp),x 
      00967C CD 82 4B         [ 4] 4345 	call next_token 
      00967F 7B 02            [ 1] 4346 	cp a,#TK_CMD 
      009681 C7 00            [ 1] 4347 	jreq 1$
      009683 23 7B 01         [ 2] 4348 	jp syntax_error
      00183F                       4349 1$:  
      009686 C7 00 07         [ 2] 4350 	cpw x,#to 
      009689 5B 05            [ 1] 4351 	jreq to
      00968B 81 28 29         [ 2] 4352 	jp syntax_error 
                                   4353 
                                   4354 ;-----------------------------------
                                   4355 ; BASIC: TO expr 
                                   4356 ; second part of FOR loop initilization
                                   4357 ; leave limit on dstack and set 
                                   4358 ; FTO bit in 'flags'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4359 ;-----------------------------------
      001847                       4360 to: ; { var_addr -- var_addr limit step }
      00968E 2C 23 2A 2F 25   [ 2] 4361 	btjt flags,#FLOOP,1$
      009693 96 9F 96         [ 2] 4362 	jp syntax_error
      009696 A1 96 A3         [ 4] 4363 1$: call relation  
      009699 96 A6            [ 1] 4364 	cp a,#TK_INTGR 
      00969B 96 A8            [ 1] 4365 	jreq 2$ 
      00969D 96 AB 3E         [ 2] 4366 	jp syntax_error
      001859                       4367 2$: 
      0096A0 00 3D 00         [ 4] 4368     call dpush ; limit
      0096A3 3E 3D 00         [ 2] 4369 	ldw x,in.w 
      0096A6 3C 00 3C         [ 4] 4370 	call next_token
      0096A9 3D 00            [ 1] 4371 	cp a,#TK_NONE  
      0096AB 3C 3E            [ 1] 4372 	jreq 4$ 
      0096AD 00 06            [ 1] 4373 	cp a,#TK_CMD
      0096AE 26 05            [ 1] 4374 	jrne 3$
      0096AE 4B 00 7A         [ 2] 4375 	cpw x,#step 
      0096B0 27 0B            [ 1] 4376 	jreq step
      00186F                       4377 3$:	
      0096B0 0F 01 DA         [ 4] 4378 	call unget_token   	 
      0096B2                       4379 4$:	
      0096B2 CD 93 A8         [ 2] 4380 	ldw x,#1   ; default step  
      0096B5 A1 01 27         [ 4] 4381 	call dpush
      0096B8 51 A1            [ 2] 4382 	jra store_loop_addr 
                                   4383 
                                   4384 
                                   4385 ;----------------------------------
                                   4386 ; BASIC: STEP expr 
                                   4387 ; optional third par of FOR loop
                                   4388 ; initialization. 	
                                   4389 ;------------------------------------
      00187A                       4390 step: ; {var limit -- var limit step}
      0096BA 04 26 05 CD 8A   [ 2] 4391 	btjt flags,#FLOOP,1$
      0096BF 67 20 EE         [ 2] 4392 	jp syntax_error
      0096C2 CD 13 28         [ 4] 4393 1$: call relation
      0096C2 CD 88            [ 1] 4394 	cp a,#TK_INTGR
      0096C4 BD A1            [ 1] 4395 	jreq 2$
      0096C6 00 27 41         [ 2] 4396 	jp syntax_error
      0096C9 A1 0A 26         [ 4] 4397 2$:	call dpush
                                   4398 ; leave loop back entry point on cstack 
                                   4399 ; cstack is 2 call deep from interp_loop
      00188F                       4400 store_loop_addr:
      0096CC 05 CD 82         [ 2] 4401 	ldw x,basicptr  
      0096CF 5E 20            [ 2] 4402 	ldw (BPTR,sp),x 
      0096D1 DE A1 03         [ 2] 4403 	ldw x,in.w 
      0096D4 26 06            [ 2] 4404 	ldw (INW,sp),x   
      0096D6 9F CD 82 4B      [ 1] 4405 	bres flags,#FLOOP 
      0096DA 20 D4 00 1E      [ 1] 4406 	inc loop_depth  
      0096DC 81               [ 4] 4407 	ret 
                                   4408 
                                   4409 ;--------------------------------
                                   4410 ; BASIC: NEXT var 
                                   4411 ; FOR loop control 
                                   4412 ; increment variable with step 
                                   4413 ; and compare with limit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4414 ; loop if threshold not crossed.
                                   4415 ; else clean both stacks. 
                                   4416 ; and decrement 'loop_depth' 
                                   4417 ;--------------------------------
      0018A2                       4418 next: ; {var limit step -- [var limit step ] }
      0096DC A1 08 26 07      [ 1] 4419 	tnz loop_depth 
      0096E0 FD 9F            [ 1] 4420 	jrne 1$ 
      0096E2 CD 82 4B         [ 2] 4421 	jp syntax_error 
      0018AB                       4422 1$: 
      0096E5 20 C9            [ 1] 4423 	ld a,#TK_VAR 
      0096E7 CD 11 D7         [ 4] 4424 	call expect
                                   4425 ; check for good variable after NEXT 	 
      0096E7 A1 0D            [ 1] 4426 	ldw y,x 
      0096E9 26 05 03         [ 2] 4427 	ldw x,#4  
      0096EC 01 CC 96 B2      [ 4] 4428 	cpw y,([dstkptr],x) ; compare variables address 
      0096F0 27 03            [ 1] 4429 	jreq 2$  
      0096F0 A1 0E 26         [ 2] 4430 	jp syntax_error ; not the good one 
      0018BE                       4431 2$: ; increment variable 
      0096F3 13               [ 1] 4432 	ldw x,y
      0096F4 CD               [ 2] 4433 	ldw x,(x)  ; get var value 
      0096F5 88 BD A1         [ 2] 4434 	ldw acc16,x 
      0096F8 04 27 03 CC      [ 5] 4435 	ldw x,[dstkptr] ; step
      0096FC 88 09 00 08      [ 2] 4436 	addw x,acc16 ; var+step 
      0096FE 90 FF            [ 2] 4437 	ldw (y),x ; save var new value 
                                   4438 ; compare with limit 
      0096FE 9F A4            [ 1] 4439 	ldw y,x 
      009700 0F C7 00 23      [ 5] 4440 	ldw x,[dstkptr] ; step in x 
      009704 CC               [ 2] 4441 	tnzw x  
      009705 96 B0            [ 1] 4442 	jrpl 4$ ; positive step 
                                   4443 ;negative step 
      009707 AE 00 02         [ 2] 4444 	ldw x,#2
      009707 CD 90 5A 18      [ 4] 4445 	cpw y,([dstkptr],x)
      00970A 2F 20            [ 1] 4446 	jrslt loop_done
      00970A 0D 01            [ 2] 4447 	jra loop_back 
      0018E1                       4448 4$: ; positive step
      00970C 26 05 A6         [ 2] 4449 	ldw x,#2 
      00970F 0D CD 82 4B      [ 4] 4450 	cpw y,([dstkptr],x)
      009713 5B 01            [ 1] 4451 	jrsgt loop_done
      0018EA                       4452 loop_back:
      009715 81 05            [ 2] 4453 	ldw x,(BPTR,sp)
      009716 CF 00 04         [ 2] 4454 	ldw basicptr,x 
      009716 CE 00 05 1F 03   [ 2] 4455 	btjf flags,#FRUN,1$ 
      00971B C6 00            [ 1] 4456 	ld a,(2,x)
      00971D 02 6B 07         [ 1] 4457 	ld count,a
      009720 C6 00            [ 2] 4458 1$:	ldw x,(INW,sp)
      009722 04 6B 08         [ 2] 4459 	ldw in.w,x 
      009725 81               [ 4] 4460 	ret 
      009726                       4461 loop_done:
                                   4462 	; remove var limit step on dstack 
      009726 1E 03 CF         [ 2] 4463 	ldw x,dstkptr 
      009729 00 05 7B         [ 2] 4464 	addw x,#3*CELL_SIZE
      00972C 07 C7 00         [ 2] 4465 	ldw dstkptr,x 
                                   4466 	; remove 2 return address on cstack 
      00972F 02               [ 2] 4467 	popw x
      001909                       4468 	_drop 4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009730 7B 08            [ 2]    1     addw sp,#4 
      009732 C7               [ 2] 4469 	pushw x 
      009733 00 04 81 1E      [ 1] 4470 	dec loop_depth 
      009736 81               [ 4] 4471 	ret 
                                   4472 
                                   4473 ;----------------------------
                                   4474 ; called by goto/gosub
                                   4475 ; to get target line number 
                                   4476 ;---------------------------
      001911                       4477 get_target_line:
      009736 72 00 00         [ 4] 4478 	call relation 
      009739 22 05            [ 1] 4479 	cp a,#TK_INTGR
      00973B A6 06            [ 1] 4480 	jreq 1$
      00973D CC 88 0B         [ 2] 4481 	jp syntax_error
      009740 52 07 0E         [ 4] 4482 1$:	call search_lineno  
      009742 5D               [ 2] 4483 	tnzw x 
      009742 0F 06            [ 1] 4484 	jrne 2$ 
      009744 CD 88            [ 1] 4485 	ld a,#ERR_NO_LINE 
      009746 BD A1 00         [ 2] 4486 	jp tb_error 
      009749 27               [ 4] 4487 2$:	ret 
                                   4488 
                                   4489 ;------------------------
                                   4490 ; BASIC: GOTO line# 
                                   4491 ; jump to line# 
                                   4492 ; here cstack is 2 call deep from interp_loop 
                                   4493 ;------------------------
      001927                       4494 goto:
      00974A 5C A1 0A 26 08   [ 2] 4495 	btjt flags,#FRUN,0$ 
      00974F CD 82            [ 1] 4496 	ld a,#ERR_RUN_ONLY
      009751 5E 03 06         [ 2] 4497 	jp tb_error 
      009754 CD               [ 4] 4498 	ret 
      009755 88 BD A1         [ 4] 4499 0$:	call get_target_line
      001935                       4500 jp_to_target:
      009758 05 27 03         [ 2] 4501 	ldw basicptr,x 
      00975B CC 88            [ 1] 4502 	ld a,(2,x)
      00975D 09 CD 90         [ 1] 4503 	ld count,a 
      009760 60 0D 06 26      [ 1] 4504 	mov in,#3 
      009764 0F               [ 4] 4505 	ret 
                                   4506 
                                   4507 
                                   4508 ;--------------------
                                   4509 ; BASIC: GOSUB line#
                                   4510 ; basic subroutine call
                                   4511 ; actual line# and basicptr 
                                   4512 ; are saved on cstack
                                   4513 ; here cstack is 2 call deep from interp_loop 
                                   4514 ;--------------------
                           000003  4515 	RET_ADDR=3
                           000005  4516 	RET_INW=5
                           000004  4517 	VSIZE=4  
      001942                       4518 gosub:
      009765 A6 3A C7 17 39   [ 2] 4519 	btjt flags,#FRUN,0$ 
      00976A 72 5F            [ 1] 4520 	ld a,#ERR_RUN_ONLY
      00976C 17 3A AE         [ 2] 4521 	jp tb_error 
      00976F 17               [ 4] 4522 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009770 38               [ 2] 4523 0$:	popw x 
      00194E                       4524 	_vars VSIZE  
      009771 CD 82            [ 2]    1     sub sp,#VSIZE 
      009773 5E               [ 2] 4525 	pushw x 
      009774 CE 00 04         [ 2] 4526 	ldw x,basicptr
      009774 CD 97            [ 2] 4527 	ldw (RET_ADDR,sp),x 
      009776 16 AE 16         [ 4] 4528 	call get_target_line  
      009779 E8               [ 2] 4529 	pushw x 
      00977A CF 00 05         [ 2] 4530 	ldw x,in.w 
      00977D 72 5F            [ 2] 4531 	ldw (RET_INW+2,sp),x
      00977F 00               [ 2] 4532 	popw x 
      009780 04 CD            [ 2] 4533 	jra jp_to_target
                                   4534 
                                   4535 ;------------------------
                                   4536 ; BASIC: RETURN 
                                   4537 ; exit from a subroutine 
                                   4538 ; 
                                   4539 ;------------------------
      001962                       4540 return:
      009782 8B 55 72 5F 00   [ 2] 4541 	btjt flags,#FRUN,0$ 
      009787 02 CD            [ 1] 4542 	ld a,#ERR_RUN_ONLY
      009789 93 A8 A1         [ 2] 4543 	jp tb_error 
      00196C                       4544 0$:	
      00978C 04 27            [ 2] 4545 	ldw x,(RET_ADDR,sp) 
      00978E 03 CC 88         [ 2] 4546 	ldw basicptr,x
      009791 09 CD            [ 1] 4547 	ld a,(2,x)
      009793 90 60 CD         [ 1] 4548 	ld count,a  
      009796 90 A7            [ 2] 4549 	ldw x,(RET_INW,sp)
      009798 CD 97 26         [ 2] 4550 	ldw in.w,x 
      00979B CD               [ 2] 4551 	popw x 
      00197C                       4552 	_drop VSIZE 
      00979C 88 BD            [ 2]    1     addw sp,#VSIZE 
      00979E A1               [ 2] 4553 	pushw x
      00979F 0D               [ 4] 4554 	ret  
                                   4555 
                                   4556 
                                   4557 ;----------------------------------
                                   4558 ; BASIC: RUN
                                   4559 ; run BASIC program in RAM
                                   4560 ;----------------------------------- 
      001980                       4561 run: 
      0097A0 26 02 20 9E CD   [ 2] 4562 	btjf flags,#FRUN,0$  
      0097A5 90               [ 1] 4563 	clr a 
      0097A6 5A               [ 4] 4564 	ret
      0097A7                       4565 0$: 
      0097A7 5B 07 81 21 12   [ 2] 4566 	btjf flags,#FBREAK,1$
      0097AA                       4567 	_drop 2 
      0097AA 55 00            [ 2]    1     addw sp,#2 
      0097AC 02 00 04         [ 4] 4568 	call rest_context
      001991                       4569 	_drop CTXT_SIZE 
      0097AF 81 06            [ 2]    1     addw sp,#CTXT_SIZE 
      0097B0 72 19 00 21      [ 1] 4570 	bres flags,#FBREAK 
      0097B0 52 04 0F 01      [ 1] 4571 	bset flags,#FRUN 
      0097B4 CD 92 64         [ 2] 4572 	jp interp_loop 
      0097B7 A1 02 24         [ 2] 4573 1$:	ldw x,txtbgn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0097BA 03 CC 88         [ 2] 4574 	cpw x,txtend 
      0097BD 09 A1            [ 1] 4575 	jrmi run_it 
      0097BF 03               [ 1] 4576 	clr a 
      0097C0 25               [ 4] 4577 	ret
                                   4578 
      0019A8                       4579 run_it:	 
      0097C1 06 CD 90         [ 4] 4580     call ubound 
      0019AB                       4581 	_drop 2 ; drop return address 
      0097C4 6D 9F            [ 2]    1     addw sp,#2 
      0097C6 6B 01 CD         [ 2] 4582 	ldw x,txtbgn 
      0097C9 90 6D 9F         [ 2] 4583 	ldw basicptr,x 
      0097CC 6B 02            [ 1] 4584 	ld a,(2,x)
      0097CE CD 90 6D         [ 1] 4585 	ld count,a
      0097D1 F6 14 02 18      [ 1] 4586 	mov in,#3	
      0097D5 01 27 F9 5B      [ 1] 4587 	bset flags,#FRUN 
      0097D9 04 81 0F         [ 2] 4588 	jp interp_loop 
                                   4589 
                                   4590 
                                   4591 ;----------------------
                                   4592 ; BASIC: STOP 
                                   4593 ; stop running program
                                   4594 ;---------------------- 
      0097DB                       4595 stop: 
                                   4596 ; clean dstack and cstack 
      0097DB CD 92 64         [ 2] 4597 	ldw x,#STACK_EMPTY 
      0097DE A1               [ 1] 4598 	ldw sp,x 
      0097DF 02 27 03 CC      [ 1] 4599 	bres flags,#FRUN 
      0097E3 88 09 00 21      [ 1] 4600 	bres flags,#FBREAK
      0097E5 CC 07 CC         [ 2] 4601 	jp warm_start
                                   4602 
                                   4603 
                                   4604 ;-----------------------
                                   4605 ; BASIC: TONE expr1,expr2
                                   4606 ; used TIMER2 channel 1
                                   4607 ; to produce a tone 
                                   4608 ; arguments:
                                   4609 ;    expr1   frequency 
                                   4610 ;    expr2   duration msec.
                                   4611 ;---------------------------
      0019D2                       4612 tone:
      0097E5 CD 90 6D         [ 4] 4613 	call arg_list 
      0097E8 9F CD            [ 1] 4614 	cp a,#2 
      0097EA 90 6D            [ 1] 4615 	jreq 1$
      0097EC FA F7 81         [ 2] 4616 	jp syntax_error 
      0097EF                       4617 1$: 
      0097EF CD 92 64         [ 4] 4618 	call dpop ; duration
      0097F2 A1               [ 2] 4619 	pushw x 
      0097F3 02 27 03         [ 4] 4620 	call dpop ; frequency
      0097F6 CC 88            [ 1] 4621 	ldw y,x 
      0097F8 09 F4 24         [ 2] 4622 	ldw x,#TIM2_CLK_FREQ
      0097F9 65               [ 2] 4623 	divw x,y 
                                   4624 ; round to nearest integer 
      0097F9 CD 90 6D 9F      [ 2] 4625 	cpw y,#TIM2_CLK_FREQ/2
      0097FD 43 CD            [ 1] 4626 	jrmi 2$
      0097FF 90               [ 2] 4627 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0019F0                       4628 2$:	 
      009800 6D               [ 1] 4629 	ld a,xh 
      009801 F4 F7 81         [ 1] 4630 	ld TIM2_ARRH,a 
      009804 9F               [ 1] 4631 	ld a,xl 
      009804 CD 92 64         [ 1] 4632 	ld TIM2_ARRL,a 
                                   4633 ; 50% duty cycle 
      009807 A1               [ 1] 4634 	ccf 
      009808 02               [ 2] 4635 	rrcw x 
      009809 27               [ 1] 4636 	ld a,xh 
      00980A 03 CC 88         [ 1] 4637 	ld TIM2_CCR1H,a 
      00980D 09               [ 1] 4638 	ld a,xl
      00980E CD 90 6D         [ 1] 4639 	ld TIM2_CCR1L,a
      009811 9F CD 90 6D      [ 1] 4640 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009815 F8 F7 81 00      [ 1] 4641 	bset TIM2_CR1,#TIM2_CR1_CEN
      009818 72 10 53 04      [ 1] 4642 	bset TIM2_EGR,#TIM2_EGR_UG
      009818 CD               [ 2] 4643 	popw x 
      009819 92 88 A1         [ 2] 4644 	ldw timer,x 
      00981C 02 27 03         [ 2] 4645 3$: ldw x,timer 	
      00981F CC 88            [ 1] 4646 	jrne 3$ 
      009821 09 11 53 08      [ 1] 4647 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009822 72 11 53 00      [ 1] 4648 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009822 CD               [ 4] 4649 	ret 
                                   4650 
                                   4651 ;-------------------------------
                                   4652 ; BASIC: ADCON 0|1 [,divisor]  
                                   4653 ; disable/enanble ADC 
                                   4654 ;-------------------------------
      001A20                       4655 power_adc:
      009823 90 6D 9F         [ 4] 4656 	call arg_list 
      009826 A4 07            [ 1] 4657 	cp a,#2	
      009828 88 A6            [ 1] 4658 	jreq 1$
      00982A 01 0D            [ 1] 4659 	cp a,#1 
      00982C 01 27            [ 1] 4660 	jreq 0$ 
      00982E 05 48 0A         [ 2] 4661 	jp syntax_error 
      009831 01 20 F7         [ 2] 4662 0$: ldw x,#0
      009834 CD 90 6D         [ 4] 4663 	call dpush 
      009837 F4 27 02         [ 2] 4664 1$: ldw x,#2
      00983A A6 01 5F 97      [ 5] 4665 	ldw x,([dstkptr],x) ; on|off
      00983E A6               [ 2] 4666 	tnzw x 
      00983F 04 5B            [ 1] 4667 	jreq 2$ 
      009841 01 81 00 18      [ 5] 4668 	ldw x,[dstkptr] ; divisor 
      009843 9F               [ 1] 4669 	ld a,xl
      009843 CD 92            [ 1] 4670 	and a,#7
      009845 64               [ 1] 4671 	swap a 
      009846 A1 02 27         [ 1] 4672 	ld ADC_CR1,a
      009849 03 CC 88 09      [ 1] 4673 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00984D 72 10 54 01      [ 1] 4674 	bset ADC_CR1,#ADC_CR1_ADON 
      001A51                       4675 	_usec_dly 7 
      00984D CD 90 6D         [ 2]    1     ldw x,#(16*7-2)/4
      009850 9F               [ 2]    2     decw x
      009851 CD               [ 1]    3     nop 
      009852 90 6D            [ 1]    4     jrne .-4
      009854 F7 81            [ 2] 4676 	jra 3$
      009856 72 11 54 01      [ 1] 4677 2$: bres ADC_CR1,#ADC_CR1_ADON
      009856 CD 92 88 A1      [ 1] 4678 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      00985A 01 27 03         [ 2] 4679 3$:	ldw x,#4 ; drop 2 elements on dstack 
      00985D CC 88 09 CD      [ 2] 4680 	addw x,dstkptr
      009861 90 6D F6         [ 2] 4681 	ldw dstkptr,x 
      009864 5F               [ 4] 4682 	ret
                                   4683 
                                   4684 ;-----------------------------
                                   4685 ; BASIC: ADCREAD (channel)
                                   4686 ; read adc channel {0..5}
                                   4687 ; output:
                                   4688 ;   A 		TK_INTGR 
                                   4689 ;   X 		value 
                                   4690 ;-----------------------------
      001A6D                       4691 analog_read:
      009865 97 A6 04         [ 4] 4692 	call func_args 
      009868 81 01            [ 1] 4693 	cp a,#1 
      009869 27 03            [ 1] 4694 	jreq 1$
      009869 CD 92 88         [ 2] 4695 	jp syntax_error
      00986C A1 02 27         [ 4] 4696 1$: call dpop 
      00986F 03 CC 88         [ 2] 4697 	cpw x,#5 
      009872 09 05            [ 2] 4698 	jrule 2$
      009873 A6 0A            [ 1] 4699 	ld a,#ERR_BAD_VALUE
      009873 CD 90 6D         [ 2] 4700 	jp tb_error 
      009876 CF               [ 1] 4701 2$: ld a,xl
      009877 00 14 CD         [ 1] 4702 	ld acc8,a 
      00987A 90 6D            [ 1] 4703 	ld a,#5
      00987C 9F C7 00         [ 1] 4704 	sub a,acc8 
      00987F 13 5F 92         [ 1] 4705 	ld ADC_CSR,a
      009882 BC 00 13 97      [ 1] 4706 	bset ADC_CR2,#ADC_CR2_ALIGN
      009886 A6 04 81 01      [ 1] 4707 	bset ADC_CR1,#ADC_CR1_ADON
      009889 72 0F 54 00 FB   [ 2] 4708 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009889 CD 93 A8         [ 2] 4709 	ldw x,ADC_DRH
      00988C A1 04            [ 1] 4710 	ld a,#TK_INTGR
      00988E 27               [ 4] 4711 	ret 
                                   4712 
                                   4713 ;-----------------------
                                   4714 ; BASIC: DREAD(pin)
                                   4715 ; Arduino pins 
                                   4716 ; read state of a digital pin 
                                   4717 ; pin# {0..15}
                                   4718 ; output:
                                   4719 ;    A 		TK_INTGR
                                   4720 ;    X      0|1 
                                   4721 ;-------------------------
                           000001  4722 	PINNO=1
                           000001  4723 	VSIZE=1
      001AA3                       4724 digital_read:
      001AA3                       4725 	_vars VSIZE 
      00988F 03 CC            [ 2]    1     sub sp,#VSIZE 
      009891 88 09 4F         [ 4] 4726 	call func_args
      009894 5D 26            [ 1] 4727 	cp a,#1
      009896 05 55            [ 1] 4728 	jreq 1$
      009898 00 04 00         [ 2] 4729 	jp syntax_error
      00989B 02 81 ED         [ 4] 4730 1$: call dpop 
      00989D A3 00 0F         [ 2] 4731 	cpw x,#15 
      00989D A6 05            [ 2] 4732 	jrule 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      00989F CD 92            [ 1] 4733 	ld a,#ERR_BAD_VALUE
      0098A1 57 CD 90         [ 2] 4734 	jp tb_error 
      0098A4 60 CD 94         [ 4] 4735 2$:	call select_pin 
      0098A7 4F 72            [ 1] 4736 	ld (PINNO,sp),a
      0098A9 14 00            [ 1] 4737 	ld a,(GPIO_IDR,x)
      0098AB 22 85            [ 1] 4738 	tnz (PINNO,sp)
      0098AD 52 04            [ 1] 4739 	jreq 8$
      0098AF 89               [ 1] 4740 3$: srl a 
      0098B0 5F 1F            [ 1] 4741 	dec (PINNO,sp)
      0098B2 05 1F            [ 1] 4742 	jrne 3$ 
      0098B4 03 CD            [ 1] 4743 8$: and a,#1 
      0098B6 88               [ 1] 4744 	clrw x 
      0098B7 BD               [ 1] 4745 	ld xl,a 
      0098B8 A1 06            [ 1] 4746 	ld a,#TK_INTGR
      001AD2                       4747 	_drop VSIZE
      0098BA 27 03            [ 2]    1     addw sp,#VSIZE 
      0098BC CC               [ 4] 4748 	ret
                                   4749 
                                   4750 ;-----------------------
                                   4751 ; BASIC: DWRITE pin,0|1
                                   4752 ; Arduino pins 
                                   4753 ; write to a digital pin 
                                   4754 ; pin# {0..15}
                                   4755 ; output:
                                   4756 ;    A 		TK_INTGR
                                   4757 ;    X      0|1 
                                   4758 ;-------------------------
                           000001  4759 	PINNO=1
                           000002  4760 	PINVAL=2
                           000002  4761 	VSIZE=2
      001AD5                       4762 digital_write:
      001AD5                       4763 	_vars VSIZE 
      0098BD 88 09            [ 2]    1     sub sp,#VSIZE 
      0098BF CD 11 E4         [ 4] 4764 	call arg_list  
      0098BF A3 98            [ 1] 4765 	cp a,#2 
      0098C1 C7 27            [ 1] 4766 	jreq 1$
      0098C3 03 CC 88         [ 2] 4767 	jp syntax_error
      0098C6 09 0F ED         [ 4] 4768 1$: call dpop 
      0098C7 9F               [ 1] 4769 	ld a,xl 
      0098C7 72 04            [ 1] 4770 	ld (PINVAL,sp),a
      0098C9 00 22 03         [ 4] 4771 	call dpop
      0098CC CC 88 09         [ 2] 4772 	cpw x,#15 
      0098CF CD 93            [ 2] 4773 	jrule 2$
      0098D1 A8 A1            [ 1] 4774 	ld a,#ERR_BAD_VALUE
      0098D3 04 27 03         [ 2] 4775 	jp tb_error 
      0098D6 CC 88 09         [ 4] 4776 2$:	call select_pin 
      0098D9 6B 01            [ 1] 4777 	ld (PINNO,sp),a 
      0098D9 CD 90            [ 1] 4778 	ld a,#1
      0098DB 60 CE            [ 1] 4779 	tnz (PINNO,sp)
      0098DD 00 01            [ 1] 4780 	jreq 4$
      0098DF CD               [ 1] 4781 3$: sll a
      0098E0 88 BD            [ 1] 4782 	dec (PINNO,sp)
      0098E2 A1 00            [ 1] 4783 	jrne 3$
      0098E4 27 0C            [ 1] 4784 4$: tnz (PINVAL,sp)
      0098E6 A1 06            [ 1] 4785 	jrne 5$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0098E8 26               [ 1] 4786 	cpl a 
      0098E9 05 A3            [ 1] 4787 	and a,(GPIO_ODR,x)
      0098EB 98 FA            [ 2] 4788 	jra 8$
      0098ED 27 0B            [ 1] 4789 5$: or a,(GPIO_ODR,x)
      0098EF E7 00            [ 1] 4790 8$: ld (GPIO_ODR,x),a 
      001B11                       4791 	_drop VSIZE 
      0098EF CD 90            [ 2]    1     addw sp,#VSIZE 
      0098F1 5A               [ 4] 4792 	ret
                                   4793 
                                   4794 
                                   4795 ;-----------------------
                                   4796 ; BASIC: BREAK 
                                   4797 ; insert a breakpoint 
                                   4798 ; in pogram. 
                                   4799 ; the program is resumed
                                   4800 ; with RUN 
                                   4801 ;-------------------------
      0098F2                       4802 break:
      0098F2 AE 00 01 CD 90   [ 2] 4803 	btjt flags,#FRUN,2$
      0098F7 60               [ 1] 4804 	clr a
      0098F8 20               [ 4] 4805 	ret 
      001B1B                       4806 2$:	 
                                   4807 ; create space on cstack to save context 
      0098F9 15 1B 42         [ 2] 4808 	ldw x,#break_point 
      0098FA CD 01 DE         [ 4] 4809 	call puts 
      001B21                       4810 	_drop 2 ;drop return address 
      0098FA 72 04            [ 2]    1     addw sp,#2 
      001B23                       4811 	_vars CTXT_SIZE ; context size 
      0098FC 00 22            [ 2]    1     sub sp,#CTXT_SIZE 
      0098FE 03 CC 88         [ 4] 4812 	call save_context 
      009901 09 CD 93         [ 2] 4813 	ldw x,#tib 
      009904 A8 A1 04         [ 2] 4814 	ldw basicptr,x
      009907 27               [ 1] 4815 	clr (x)
      009908 03 CC 88 09      [ 1] 4816 	clr count  
      00990C CD               [ 1] 4817 	clrw x 
      00990D 90 60 00         [ 2] 4818 	ldw in.w,x
      00990F 72 11 00 21      [ 1] 4819 	bres flags,#FRUN 
      00990F CE 00 05 1F      [ 1] 4820 	bset flags,#FBREAK
      009913 05 CE 00         [ 2] 4821 	jp interp_loop 
      009916 01 1F 03 72 15 00 22  4822 break_point: .asciz "\nbreak point, RUN to resume.\n"
             72 5C 00 1F 81 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4823 
                                   4824 ;-----------------------
                                   4825 ; BASIC: NEW
                                   4826 ; from command line only 
                                   4827 ; free program memory
                                   4828 ; and clear variables 
                                   4829 ;------------------------
      009922                       4830 new: 
      009922 72 5D 00 1F 26   [ 2] 4831 	btjf flags,#FRUN,0$ 
      009927 03               [ 1] 4832 	clr a 
      009928 CC               [ 4] 4833 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      001B67                       4834 0$:	
      009929 88 09 6B         [ 4] 4835 	call clear_basic 
      00992B 81               [ 4] 4836 	ret 
                                   4837 	 
                                   4838 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4839 ;  file system routines
                                   4840 ;  MCU flash memory from
                                   4841 ;  0x10000-0x27fff is 
                                   4842 ;  used to store BASIC 
                                   4843 ;  program files. 
                                   4844 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4845 
                                   4846 ;--------------------
                                   4847 ; input:
                                   4848 ;   X     increment 
                                   4849 ; output:
                                   4850 ;   farptr  incremented 
                                   4851 ;---------------------
      001B6B                       4852 incr_farptr:
      00992B A6 05 CD 92      [ 2] 4853 	addw x,farptr+1 
      00992F 57 90            [ 1] 4854 	jrnc 1$
      009931 93 AE 00 04      [ 1] 4855 	inc farptr 
      009935 72 D3 00         [ 2] 4856 1$:	ldw farptr+1,x  
      009938 19               [ 4] 4857 	ret 
                                   4858 
                                   4859 ;------------------------------
                                   4860 ; extended flash memory used as FLASH_DRIVE 
                                   4861 ; seek end of used flash drive   
                                   4862 ; starting at 0x10000 address.
                                   4863 ; 4 consecutives 0 bytes signal free space. 
                                   4864 ; input:
                                   4865 ;	none
                                   4866 ; output:
                                   4867 ;   ffree     free_addr| 0 if memory full.
                                   4868 ;------------------------------
      001B79                       4869 seek_fdrive:
                                   4870 ; start scan at 0x10000 address 
      009939 27 03            [ 1] 4871 	ld a,#1
      00993B CC 88 09         [ 1] 4872 	ld farptr,a 
      00993E 5F               [ 1] 4873 	clrw x 
      00993E 93 FE CF         [ 2] 4874 	ldw farptr+1,x 
      001B82                       4875 1$:
      009941 00 09 72         [ 2] 4876 	ldw x,#3  
      009944 CE 00 19 72      [ 5] 4877 2$:	ldf a,([farptr],x) 
      009948 BB 00            [ 1] 4878 	jrne 3$
      00994A 09               [ 2] 4879 	decw x
      00994B 90 FF            [ 1] 4880 	jrpl 2$
      00994D 90 93            [ 2] 4881 	jra 4$ 
      00994F 72               [ 2] 4882 3$:	incw x 
      009950 CE 00 19         [ 4] 4883 	call incr_farptr
      009953 5D 2A 0B         [ 2] 4884 	ldw x,#0x27f 
      009956 AE 00 02         [ 2] 4885 	cpw x,farptr
      009959 72 D3            [ 1] 4886 	jrpl 1$
                                   4887 ; drive full 
      00995B 00 19 2F 20      [ 1] 4888 	clr ffree 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      00995F 20 09 00 16      [ 1] 4889 	clr ffree+1 
      009961 72 5F 00 17      [ 1] 4890 	clr ffree+2 
      009961 AE               [ 4] 4891 	ret
      001BA9                       4892 4$: ; copy farptr to ffree	 
      009962 00 02 72         [ 2] 4893 	ldw x,farptr 
      009965 D3 00 19         [ 1] 4894 	ld a,farptr+2 
      009968 2C 15 15         [ 2] 4895 	ldw ffree,x 
      00996A C7 00 17         [ 1] 4896 	ld ffree+2,a  
      00996A 1E               [ 4] 4897 	ret 
                                   4898 
                                   4899 ;-----------------------
                                   4900 ; compare file name 
                                   4901 ; with name pointed by Y  
                                   4902 ; input:
                                   4903 ;   farptr   file name 
                                   4904 ;   Y        target name 
                                   4905 ; output:
                                   4906 ;   farptr 	 at file_name
                                   4907 ;   X 		 farptr[x] point at size field  
                                   4908 ;   Carry    0|1 no match|match  
                                   4909 ;----------------------
      001BB6                       4910 cmp_name:
      00996B 05               [ 1] 4911 	clrw x
      00996C CF 00 05 72      [ 5] 4912 1$:	ldf a,([farptr],x)
      009970 01 00            [ 1] 4913 	cp a,(y)
      009972 22 05            [ 1] 4914 	jrne 4$
      009974 E6               [ 1] 4915 	tnz a 
      009975 02 C7            [ 1] 4916 	jreq 9$ 
      009977 00               [ 2] 4917     incw x 
      009978 04 1E            [ 2] 4918 	incw y 
      00997A 03 CF            [ 2] 4919 	jra 1$
      001BC7                       4920 4$: ;no match 
      00997C 00               [ 1] 4921 	tnz a 
      00997D 01 81            [ 1] 4922 	jreq 5$
      00997F 5C               [ 2] 4923 	incw x 
      00997F CE 00 19 1C      [ 5] 4924 	ldf a,([farptr],x)
      009983 00 06            [ 2] 4925 	jra 4$  
      009985 CF               [ 2] 4926 5$:	incw x ; farptr[x] point at 'size' field 
      009986 00               [ 1] 4927 	rcf 
      009987 19               [ 4] 4928 	ret
      001BD4                       4929 9$: ; match  
      009988 85               [ 2] 4930 	incw x  ; farptr[x] at 'size' field 
      009989 5B               [ 1] 4931 	scf 
      00998A 04               [ 4] 4932 	ret 
                                   4933 
                                   4934 ;-----------------------
                                   4935 ; search file in 
                                   4936 ; flash memory 
                                   4937 ; input:
                                   4938 ;   Y       file name  
                                   4939 ; output:
                                   4940 ;   farptr  addr at name|0
                                   4941 ;-----------------------
                           000001  4942 	FSIZE=1
                           000003  4943 	YSAVE=3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                           000004  4944 	VSIZE=4 
      001BD7                       4945 search_file: 
      001BD7                       4946 	_vars VSIZE
      00998B 89 72            [ 2]    1     sub sp,#VSIZE 
      00998D 5A 00            [ 2] 4947 	ldw (YSAVE,sp),y  
      00998F 1F               [ 1] 4948 	clrw x 
      009990 81 00 13         [ 2] 4949 	ldw farptr+1,x 
      009991 35 01 00 12      [ 1] 4950 	mov farptr,#1
      001BE3                       4951 1$:	
                                   4952 ; check if farptr is after any file 
                                   4953 ; if  0 then so.
      009991 CD 93 A8 A1      [ 5] 4954 	ldf a,[farptr]
      009995 04 27            [ 1] 4955 	jreq 6$
      009997 03               [ 1] 4956 2$: clrw x 	
      009998 CC 88            [ 2] 4957 	ldw y,(YSAVE,sp) 
      00999A 09 CD 83         [ 4] 4958 	call cmp_name
      00999D 8E 5D            [ 1] 4959 	jrc 9$
      00999F 26 05 A6 05      [ 5] 4960 	ldf a,([farptr],x)
      0099A3 CC 88            [ 1] 4961 	ld (FSIZE,sp),a 
      0099A5 0B               [ 2] 4962 	incw x 
      0099A6 81 AF 00 12      [ 5] 4963 	ldf a,([farptr],x)
      0099A7 6B 02            [ 1] 4964 	ld (FSIZE+1,sp),a 
      0099A7 72               [ 2] 4965 	incw x 
      0099A8 00 00 22         [ 2] 4966 	addw x,(FSIZE,sp) ; count to skip 
      0099AB 06               [ 2] 4967 	incw x ; skip over EOF marker 
      0099AC A6 06 CC         [ 4] 4968 	call incr_farptr ; now at next file 'name_field'
      0099AF 88 0B 81         [ 2] 4969 	ldw x,#0x280
      0099B2 CD 99 91         [ 2] 4970 	cpw x,farptr 
      0099B5 2A D5            [ 1] 4971 	jrpl 1$
      001C0E                       4972 6$: ; file not found 
      0099B5 CF 00 05 E6      [ 1] 4973 	clr farptr
      0099B9 02 C7 00 04      [ 1] 4974 	clr farptr+1 
      0099BD 35 03 00 02      [ 1] 4975 	clr farptr+2 
      001C1A                       4976 	_drop VSIZE 
      0099C1 81 04            [ 2]    1     addw sp,#VSIZE 
      0099C2 98               [ 1] 4977 	rcf
      0099C2 72               [ 4] 4978 	ret
      001C1E                       4979 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001C1E                       4980 	_drop VSIZE 
      0099C3 00 00            [ 2]    1     addw sp,#VSIZE 
      0099C5 22               [ 1] 4981 	scf 	
      0099C6 06               [ 4] 4982 	ret
                                   4983 
                                   4984 ;--------------------------------
                                   4985 ; BASIC: SAVE "name" 
                                   4986 ; save text program in 
                                   4987 ; flash memory used as 
                                   4988 ;--------------------------------
                           000001  4989 	BSIZE=1
                           000003  4990 	NAMEPTR=3
                           000004  4991 	VSIZE=4
      001C22                       4992 save:
      0099C7 A6 06 CC 88 0B   [ 2] 4993 	btjf flags,#FRUN,0$ 
      0099CC 81 85            [ 1] 4994 	ld a,#ERR_CMD_ONLY 
      0099CE 52 04 89         [ 2] 4995 	jp tb_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      001C2C                       4996 0$:	 
      0099D1 CE 00 05         [ 2] 4997 	ldw x,txtend 
      0099D4 1F 03 CD 99      [ 2] 4998 	subw x,txtbgn
      0099D8 91 89            [ 1] 4999 	jrne 1$
                                   5000 ; nothing to save 
      0099DA CE               [ 4] 5001 	ret 
      001C36                       5002 1$:	
      001C36                       5003 	_vars VSIZE 
      0099DB 00 01            [ 2]    1     sub sp,#VSIZE 
      0099DD 1F 07            [ 2] 5004 	ldw (BSIZE,sp),x 
      0099DF 85 20 D3         [ 4] 5005 	call next_token	
      0099E2 A1 0A            [ 1] 5006 	cp a,#TK_QSTR
      0099E2 72 00            [ 1] 5007 	jreq 2$
      0099E4 00 22 05         [ 2] 5008 	jp syntax_error
      001C44                       5009 2$: 
      0099E7 A6 06 CC 88      [ 2] 5010 	ldw y,basicptr 
      0099EB 0B B9 00 00      [ 2] 5011 	addw y,in.w
      0099EC 17 03            [ 2] 5012 	ldw (NAMEPTR,sp),y  
      0099EC 1E 03 CF 00 05   [ 1] 5013 	mov in,count 
                                   5014 ; check if enough free space 
      0099F1 E6               [ 1] 5015 	ldw x,y 
      0099F2 02 C7 00         [ 4] 5016 	call strlen 
      0099F5 04 1E 05         [ 2] 5017 	addw x,#3 
      0099F8 CF 00 01         [ 2] 5018 	addw x,(BSIZE,sp)
      0099FB 85 5B 04 89      [ 1] 5019 	tnz ffree 
      0099FF 81 0B            [ 1] 5020 	jrne 21$
      009A00 72 B0 00 16      [ 2] 5021 	subw x,ffree+1 
      009A00 72 01            [ 2] 5022 	jrule 21$
      009A02 00 22            [ 1] 5023 	ld a,#ERR_MEM_FULL 
      009A04 02 4F 81         [ 2] 5024 	jp tb_error
      009A07                       5025 21$: 
                                   5026 ; check for existing file of that name 
      009A07 72 09            [ 2] 5027 	ldw y,(NAMEPTR,sp)	
      009A09 00 22 12         [ 4] 5028 	call search_file 
      009A0C 5B 02            [ 1] 5029 	jrnc 3$ 
      009A0E CD 97            [ 1] 5030 	ld a,#ERR_DUPLICATE 
      009A10 26 5B 06         [ 2] 5031 	jp tb_error 
      001C7A                       5032 3$:	;** write file name to flash **
      009A13 72 19 00         [ 2] 5033 	ldw x,ffree 
      009A16 22 72 10         [ 1] 5034 	ld a,ffree+2 
      009A19 00 22 CC         [ 2] 5035 	ldw farptr,x 
      009A1C 88 8F CE         [ 1] 5036 	ld farptr+2,a 
      009A1F 00 1B            [ 2] 5037 	ldw x,(NAMEPTR,sp)  
      009A21 C3 00 1D         [ 4] 5038 	call strlen 
      009A24 2B               [ 2] 5039 	incw  x
      009A25 02 4F            [ 2] 5040 	ldw (BSIZE,sp),x  
      009A27 81               [ 1] 5041 	clrw x   
      009A28 16 03            [ 2] 5042 	ldw y,(NAMEPTR,sp)
      009A28 CD 94 23         [ 4] 5043 	call write_block  
                                   5044 ;** write file length after name **
      009A2B 5B 02 CE         [ 2] 5045 	ldw x,txtend 
      009A2E 00 1B CF 00      [ 2] 5046 	subw x,txtbgn
      009A32 05 E6            [ 2] 5047 	ldw (BSIZE,sp),x 
      009A34 02               [ 1] 5048 	clrw x 
      009A35 C7 00            [ 1] 5049 	ld a,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A37 04 35 03         [ 4] 5050 	call write_byte 
      009A3A 00               [ 2] 5051 	incw x 
      009A3B 02 72            [ 1] 5052 	ld a,(2,sp)
      009A3D 10 00 22         [ 4] 5053 	call write_byte
      009A40 CC               [ 2] 5054 	incw x  
      009A41 88 8F 6B         [ 4] 5055 	call incr_farptr ; move farptr after SIZE field 
                                   5056 ;** write BASIC text **
                                   5057 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009A43 1E 01            [ 2] 5058 	ldw x,(BSIZE,sp)
      009A43 AE               [ 2] 5059 	pushw x ; write_block argument 
      009A44 17               [ 1] 5060 	clrw x 
      009A45 FF 94 72 11      [ 2] 5061 	ldw y,txtbgn  ; BASIC text to save 
      009A49 00 22 72         [ 4] 5062 	call write_block 
      001CB8                       5063 	_drop 2 ;  drop write_block argument  
      009A4C 19 00            [ 2]    1     addw sp,#2 
                                   5064 ; write en end of file marker 
      009A4E 22 CC 88         [ 2] 5065 	ldw x,#1
      009A51 4C FF            [ 1] 5066 	ld a,#EOF  
      009A52 CD 00 F8         [ 4] 5067 	call write_byte 
      009A52 CD 92 64         [ 4] 5068 	call incr_farptr
                                   5069 ; save farptr in ffree
      009A55 A1 02 27         [ 2] 5070 	ldw x,farptr 
      009A58 03 CC 88         [ 1] 5071 	ld a,farptr+2 
      009A5B 09 00 15         [ 2] 5072 	ldw ffree,x 
      009A5C C7 00 17         [ 1] 5073 	ld ffree+2,a
                                   5074 ;write 4 zero bytes as an end of all files marker 
      009A5C CD               [ 1] 5075     clrw x 
      009A5D 90 6D            [ 1] 5076 	push #4 
      001CD4                       5077 4$:
      009A5F 89               [ 1] 5078 	clr a 
      009A60 CD 90 6D         [ 4] 5079 	call write_byte 
      009A63 90               [ 2] 5080 	incw x 
      009A64 93 AE            [ 1] 5081 	dec (1,sp)
      009A66 F4 24            [ 1] 5082 	jrne 4$
      009A68 65               [ 1] 5083 5$: pop a 
                                   5084 ; display saved size  
      009A69 90 A3            [ 2] 5085 	ldw x,(BSIZE,sp) 
      009A6B 7A 12 2B         [ 4] 5086 	call print_int 
      001CE3                       5087 	_drop VSIZE 
      009A6E 01 5C            [ 2]    1     addw sp,#VSIZE 
      009A70 81               [ 4] 5088 	ret 
                                   5089 
                                   5090 ;----------------------
                                   5091 ; load file in RAM memory
                                   5092 ; input:
                                   5093 ;    farptr point at file size 
                                   5094 ; output:
                                   5095 ;   y point after BASIC program in RAM.
                                   5096 ;------------------------
      001CE6                       5097 load_file:
      009A70 9E C7 53         [ 4] 5098 	call incr_farptr  
      009A73 0D 9F C7         [ 4] 5099 	call clear_basic  
      009A76 53               [ 1] 5100 	clrw x
      009A77 0E 8C 56 9E      [ 5] 5101 	ldf a,([farptr],x)
      009A7B C7 53            [ 1] 5102 	ld yh,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A7D 0F               [ 2] 5103 	incw x  
      009A7E 9F C7 53 10      [ 5] 5104 	ldf a,([farptr],x)
      009A82 72               [ 2] 5105 	incw x 
      009A83 10 53            [ 1] 5106 	ld yl,a 
      009A85 08 72 10 53      [ 2] 5107 	addw y,txtbgn
      009A89 00 72 10 53      [ 2] 5108 	ldw txtend,y
      009A8D 04 85 CF 00      [ 2] 5109 	ldw y,txtbgn
      001D07                       5110 3$:	; load BASIC text 	
      009A91 0D CE 00 0D      [ 5] 5111 	ldf a,([farptr],x)
      009A95 26 FB            [ 1] 5112 	ld (y),a 
      009A97 72               [ 2] 5113 	incw x 
      009A98 11 53            [ 2] 5114 	incw y 
      009A9A 08 72 11 53      [ 2] 5115 	cpw y,txtend 
      009A9E 00 81            [ 1] 5116 	jrmi 3$
      009AA0 81               [ 4] 5117 	ret 
                                   5118 
                                   5119 ;------------------------
                                   5120 ; BASIC: LOAD "file" 
                                   5121 ; load file to RAM 
                                   5122 ; for execution 
                                   5123 ;------------------------
      001D17                       5124 load:
      009AA0 CD 92 64 A1 02   [ 2] 5125 	btjf flags,#FRUN,0$ 
      009AA5 27 0D            [ 1] 5126 	jreq 0$ 
      009AA7 A1 01            [ 1] 5127 	ld a,#ERR_CMD_ONLY 
      009AA9 27 03 CC         [ 2] 5128 	jp tb_error 
      001D23                       5129 0$:	
      009AAC 88 09 AE         [ 4] 5130 	call next_token 
      009AAF 00 00            [ 1] 5131 	cp a,#TK_QSTR
      009AB1 CD 90            [ 1] 5132 	jreq 1$
      009AB3 60 AE 00         [ 2] 5133 	jp syntax_error 
      001D2D                       5134 1$:	
      009AB6 02 72 DE 00      [ 2] 5135 	ldw y,basicptr
      009ABA 19 5D 27 1C      [ 2] 5136 	addw y,in.w 
      009ABE 72 CE 00 19 9F   [ 1] 5137 	mov in,count 
      009AC3 A4 07 4E         [ 4] 5138 	call search_file 
      009AC6 C7 54            [ 1] 5139 	jrc 2$ 
      009AC8 01 72            [ 1] 5140 	ld a,#ERR_NOT_FILE
      009ACA 16 50 CA         [ 2] 5141 	jp tb_error  
      001D44                       5142 2$:
      009ACD 72 10 54         [ 4] 5143 	call load_file
                                   5144 ; print loaded size 	 
      009AD0 01 AE 00         [ 2] 5145 	ldw x,txtend 
      009AD3 1B 5A 9D 26      [ 2] 5146 	subw x,txtbgn
      009AD7 FA 20 08         [ 4] 5147 	call print_int 
      009ADA 72               [ 4] 5148 	ret 
                                   5149 
                                   5150 ;-----------------------------------
                                   5151 ; BASIC: FORGET ["file_name"] 
                                   5152 ; erase file_name and all others 
                                   5153 ; after it. 
                                   5154 ; without argument erase all files 
                                   5155 ;-----------------------------------
      001D52                       5156 forget:
      009ADB 11 54 01         [ 4] 5157 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009ADE 72 17            [ 1] 5158 	cp a,#TK_NONE 
      009AE0 50 CA            [ 1] 5159 	jreq 3$ 
      009AE2 AE 00            [ 1] 5160 	cp a,#TK_QSTR
      009AE4 04 72            [ 1] 5161 	jreq 1$
      009AE6 BB 00 19         [ 2] 5162 	jp syntax_error
      009AE9 CF 00 19 81      [ 2] 5163 1$: ldw y,basicptr
      009AED 72 B9 00 00      [ 2] 5164 	addw y,in.w
      009AED CD 92 88 A1 01   [ 1] 5165 	mov in,count 
      009AF2 27 03 CC         [ 4] 5166 	call search_file
      009AF5 88 09            [ 1] 5167 	jrc 2$
      009AF7 CD 90            [ 1] 5168 	ld a,#ERR_NOT_FILE 
      009AF9 6D A3 00         [ 2] 5169 	jp tb_error 
      001D77                       5170 2$: 
      009AFC 05 23 05         [ 2] 5171 	ldw x,farptr
      009AFF A6 0A CC         [ 1] 5172 	ld a,farptr+2
      009B02 88 0B            [ 2] 5173 	jra 4$ 
      001D7F                       5174 3$: ; forget all files 
      009B04 9F C7 00         [ 2] 5175 	ldw x,#0x100
      009B07 0A               [ 1] 5176 	clr a 
      009B08 A6 05 C0         [ 2] 5177 	ldw farptr,x 
      009B0B 00 0A C7         [ 1] 5178 	ld farptr+2,a 
      001D89                       5179 4$:
      009B0E 54 00 72         [ 2] 5180 	ldw ffree,x 
      009B11 16 54 02         [ 1] 5181 	ld ffree+2,a 
      009B14 72 10            [ 1] 5182 	push #4
      009B16 54               [ 1] 5183 	clrw x 
      001D92                       5184 5$: 
      009B17 01               [ 1] 5185 	clr a  
      009B18 72 0F 54         [ 4] 5186 	call write_byte 
      009B1B 00               [ 2] 5187 	incw x 
      009B1C FB CE            [ 1] 5188 	dec (1,sp)
      009B1E 54 04            [ 1] 5189 	jrne 5$	
      009B20 A6               [ 1] 5190 6$: pop a 
      009B21 04               [ 4] 5191 	ret 
                                   5192 
                                   5193 ;----------------------
                                   5194 ; BASIC: DIR 
                                   5195 ; list saved files 
                                   5196 ;----------------------
                           000001  5197 	COUNT=1 ; files counter 
                           000002  5198 	VSIZE=2 
      001D9D                       5199 directory:
      001D9D                       5200 	_vars VSIZE 
      009B22 81 02            [ 2]    1     sub sp,#VSIZE 
      009B23 5F               [ 1] 5201 	clrw x 
      009B23 52 01            [ 2] 5202 	ldw (COUNT,sp),x 
      009B25 CD 92 88         [ 2] 5203 	ldw farptr+1,x 
      009B28 A1 01 27 03      [ 1] 5204 	mov farptr,#1 
      001DA9                       5205 dir_loop:
      009B2C CC               [ 1] 5206 	clrw x 
      009B2D 88 09 CD 90      [ 5] 5207 	ldf a,([farptr],x)
      009B31 6D A3            [ 1] 5208 	jreq 8$ 
      001DB0                       5209 1$: ;name loop 	
      009B33 00 0F 23 05      [ 5] 5210 	ldf a,([farptr],x)
      009B37 A6 0A            [ 1] 5211 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009B39 CC 88 0B         [ 4] 5212 	call putc 
      009B3C CD               [ 2] 5213 	incw x 
      009B3D A1 3A            [ 2] 5214 	jra 1$
      009B3F 6B               [ 2] 5215 2$: incw x ; skip ending 0. 
      009B40 01 E6            [ 1] 5216 	ld a,#SPACE 
      009B42 01 0D 01         [ 4] 5217 	call putc 
                                   5218 ; get file size 	
      009B45 27 05 44 0A      [ 5] 5219 	ldf a,([farptr],x)
      009B49 01 26            [ 1] 5220 	ld yh,a 
      009B4B FB               [ 2] 5221 	incw x 
      009B4C A4 01 5F 97      [ 5] 5222 	ldf a,([farptr],x)
      009B50 A6               [ 2] 5223 	incw x 
      009B51 04 5B            [ 1] 5224 	ld yl,a 
      009B53 01 81            [ 2] 5225 	pushw y 
      009B55 72 FB 01         [ 2] 5226 	addw x,(1,sp)
      009B55 52               [ 2] 5227 	incw x ; skip EOF marker 
                                   5228 ; skip to next file 
      009B56 02 CD 92         [ 4] 5229 	call incr_farptr 
                                   5230 ; print file size 
      009B59 64               [ 2] 5231 	popw x ; file size 
      009B5A A1 02 27         [ 4] 5232 	call print_int 
      009B5D 03 CC            [ 1] 5233 	ld a,#CR 
      009B5F 88 09 CD         [ 4] 5234 	call putc
      009B62 90 6D            [ 2] 5235 	ldw x,(COUNT,sp)
      009B64 9F               [ 2] 5236 	incw x
      009B65 6B 02            [ 2] 5237 	ldw (COUNT,sp),x  
      009B67 CD 90            [ 2] 5238 	jra dir_loop 
      001DE9                       5239 8$: ; print number of files 
      009B69 6D A3            [ 2] 5240 	ldw x,(COUNT,sp)
      009B6B 00 0F 23         [ 4] 5241 	call print_int 
      009B6E 05 A6 0A         [ 2] 5242 	ldw x,#file_count 
      009B71 CC 88 0B         [ 4] 5243 	call puts  
                                   5244 ; print drive free space 	
      009B74 CD A1            [ 1] 5245 	ld a,#0xff 
      009B76 3A 6B 01         [ 1] 5246 	sub a,ffree+2 
      009B79 A6 01 0D         [ 1] 5247 	ld acc8,a 
      009B7C 01 27            [ 1] 5248 	ld a,#0x7f 
      009B7E 05 48 0A         [ 1] 5249 	sbc a,ffree+1 
      009B81 01 26 FB         [ 1] 5250 	ld acc16,a 
      009B84 0D 02            [ 1] 5251 	ld a,#2 
      009B86 26 05 43         [ 1] 5252 	sbc a,ffree 
      009B89 E4 00 20         [ 1] 5253 	ld acc24,a 
      009B8C 02               [ 1] 5254 	clrw x  
      009B8D EA 00            [ 1] 5255 	ld a,#6 
      009B8F E7               [ 1] 5256 	ld xl,a 
      009B90 00 5B            [ 1] 5257 	ld a,#10 
      009B92 02 81 9F         [ 4] 5258 	call prti24 
      009B94 AE 1E 26         [ 2] 5259 	ldw x,#drive_free
      009B94 72 00 00         [ 4] 5260 	call puts 
      001E1B                       5261 	_drop VSIZE 
      009B97 22 02            [ 2]    1     addw sp,#VSIZE 
      009B99 4F               [ 4] 5262 	ret
      009B9A 81 66 69 6C 65 73 0A  5263 file_count: .asciz " files\n"
             00
      009B9B 20 62 79 74 65 73 20  5264 drive_free: .asciz " bytes free\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



             66 72 65 65 0A 00
                                   5265 
                                   5266 ;---------------------
                                   5267 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5268 ; write 1 or more byte to FLASH or EEPROM
                                   5269 ; starting at address  
                                   5270 ; input:
                                   5271 ;   expr1  	is address 
                                   5272 ;   expr2,...,exprn   are bytes to write
                                   5273 ; output:
                                   5274 ;   none 
                                   5275 ;---------------------
                           000001  5276 	ADDR=1
                           000002  5277 	VSIZ=2 
      001E33                       5278 write:
      001E33                       5279 	_vars VSIZE 
      009B9B AE 9B            [ 2]    1     sub sp,#VSIZE 
      009B9D C2 CD 82 5E      [ 1] 5280 	clr farptr ; expect 16 bits address 
      009BA1 5B 02 52         [ 4] 5281 	call expression
      009BA4 06 CD            [ 1] 5282 	cp a,#TK_INTGR 
      009BA6 97 16            [ 1] 5283 	jreq 0$
      009BA8 AE 16 E8         [ 2] 5284 	jp syntax_error
      009BAB CF 00            [ 2] 5285 0$: ldw (ADDR,sp),x 
      009BAD 05 7F 72         [ 4] 5286 	call next_token 
      009BB0 5F 00            [ 1] 5287 	cp a,#TK_COMMA 
      009BB2 04 5F            [ 1] 5288 	jreq 1$ 
      009BB4 CF 00            [ 2] 5289 	jra 9$ 
      009BB6 01 72 11         [ 4] 5290 1$:	call expression
      009BB9 00 22            [ 1] 5291 	cp a,#TK_INTGR
      009BBB 72 18            [ 1] 5292 	jreq 2$
      009BBD 00 22 CC         [ 2] 5293 	jp syntax_error
      009BC0 88               [ 1] 5294 2$:	ld a,xl 
      009BC1 8F 0A            [ 2] 5295 	ldw x,(ADDR,sp) 
      009BC3 62 72 65         [ 2] 5296 	ldw farptr+1,x 
      009BC6 61               [ 1] 5297 	clrw x 
      009BC7 6B 20 70         [ 4] 5298 	call write_byte
      009BCA 6F 69            [ 2] 5299 	ldw x,(ADDR,sp)
      009BCC 6E               [ 2] 5300 	incw x 
      009BCD 74 2C            [ 2] 5301 	jra 0$ 
      001E67                       5302 9$:
      001E67                       5303 	_drop VSIZE
      009BCF 20 52            [ 2]    1     addw sp,#VSIZE 
      009BD1 55               [ 4] 5304 	ret 
                                   5305 
                                   5306 
                                   5307 ;---------------------
                                   5308 ;BASIC: CHAR(expr)
                                   5309 ; évaluate expression 
                                   5310 ; and take the 7 least 
                                   5311 ; bits as ASCII character
                                   5312 ;---------------------
      001E6A                       5313 char:
      009BD2 4E 20 74         [ 4] 5314 	call func_args 
      009BD5 6F 20            [ 1] 5315 	cp a,#1
      009BD7 72 65            [ 1] 5316 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009BD9 73 75 6D         [ 2] 5317 	jp syntax_error
      009BDC 65 2E 0A         [ 4] 5318 1$:	call dpop 
      009BDF 00               [ 1] 5319 	ld a,xl 
      009BE0 A4 7F            [ 1] 5320 	and a,#0x7f 
      009BE0 72               [ 1] 5321 	ld xl,a
      009BE1 01 00            [ 1] 5322 	ld a,#TK_CHAR
      009BE3 22               [ 4] 5323 	ret
                                   5324 
                                   5325 ;---------------------
                                   5326 ; BASIC: ASC(string|char)
                                   5327 ; extract first character 
                                   5328 ; of string argument 
                                   5329 ; return it as TK_INTGR 
                                   5330 ;---------------------
      001E7E                       5331 ascii:
      009BE4 02 4F            [ 1] 5332 	ld a,#TK_LPAREN
      009BE6 81 11 D7         [ 4] 5333 	call expect 
      009BE7 CD 08 3D         [ 4] 5334 	call next_token 
      009BE7 CD 86            [ 1] 5335 	cp a,#TK_QSTR 
      009BE9 EB 81            [ 1] 5336 	jreq 1$
      009BEB A1 03            [ 1] 5337 	cp a,#TK_CHAR 
      009BEB 72 BB            [ 1] 5338 	jreq 2$ 
      009BED 00 14 24         [ 2] 5339 	jp syntax_error
      001E91                       5340 1$: 
      009BF0 04               [ 1] 5341 	ld a,(x) 
      009BF1 72               [ 1] 5342 	clrw x
      009BF2 5C               [ 1] 5343 	ld xl,a 
      001E94                       5344 2$: 
      009BF3 00               [ 2] 5345 	pushw x 
      009BF4 13 CF            [ 1] 5346 	ld a,#TK_RPAREN 
      009BF6 00 14 81         [ 4] 5347 	call expect
      009BF9 85               [ 2] 5348 	popw x 
      009BF9 A6 01            [ 1] 5349 	ld a,#TK_INTGR 
      009BFB C7               [ 4] 5350 	ret 
                                   5351 
                                   5352 ;---------------------
                                   5353 ;BASIC: KEY
                                   5354 ; wait for a character 
                                   5355 ; received from STDIN 
                                   5356 ; input:
                                   5357 ;	none 
                                   5358 ; output:
                                   5359 ;	X 		ASCII character 
                                   5360 ;---------------------
      001E9E                       5361 key:
      009BFC 00 13 5F         [ 4] 5362 	call getc 
      009BFF CF               [ 1] 5363 	clrw x 
      009C00 00               [ 1] 5364 	ld xl,a 
      009C01 14 04            [ 1] 5365 	ld a,#TK_INTGR
      009C02 81               [ 4] 5366 	ret
                                   5367 
                                   5368 ;----------------------
                                   5369 ; BASIC: QKEY
                                   5370 ; Return true if there 
                                   5371 ; is a character in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5372 ; waiting in STDIN 
                                   5373 ; input:
                                   5374 ;  none 
                                   5375 ; output:
                                   5376 ;   X 		0|-1 
                                   5377 ;-----------------------
      001EA6                       5378 qkey: 
      009C02 AE               [ 1] 5379 	clrw x 
      009C03 00 03 92 AF      [ 1] 5380 	tnz rx_char
      009C07 00 13            [ 1] 5381 	jreq 9$ 
      009C09 26               [ 2] 5382 	cplw x 
      009C0A 05 5A            [ 1] 5383 9$: ld a,#TK_INTGR
      009C0C 2A               [ 4] 5384 	ret 
                                   5385 
                                   5386 ;---------------------
                                   5387 ; BASIC: GPIO(expr,reg)
                                   5388 ; return gpio address 
                                   5389 ; expr {0..8}
                                   5390 ; input:
                                   5391 ;   none 
                                   5392 ; output:
                                   5393 ;   X 		gpio register address
                                   5394 ;----------------------------
      001EB1                       5395 gpio:
      009C0D F7 20 19         [ 4] 5396 	call func_args 
      009C10 5C CD            [ 1] 5397 	cp a,#2
      009C12 9B EB            [ 1] 5398 	jreq 1$
      009C14 AE 02 7F         [ 2] 5399 	jp syntax_error  
      001EBB                       5400 1$:	
      009C17 C3 00 13         [ 2] 5401 	ldw x,#2
      009C1A 2A E6 72 5F      [ 5] 5402 	ldw x,([dstkptr],x) ; port 
      009C1E 00 16            [ 1] 5403 	jrmi bad_port
      009C20 72 5F 00         [ 2] 5404 	cpw x,#9
      009C23 17 72            [ 1] 5405 	jrpl bad_port
      009C25 5F 00            [ 1] 5406 	ld a,#5
      009C27 18               [ 4] 5407 	mul x,a
      009C28 81 50 00         [ 2] 5408 	addw x,#GPIO_BASE 
      009C29 89               [ 2] 5409 	pushw x 
      009C29 CE 00 13         [ 4] 5410 	call dpop 
      009C2C C6 00 15         [ 2] 5411 	addw x,(1,sp)
      009C2F CF 00            [ 2] 5412 	ldw (1,sp),x  
      009C31 16 C7 00         [ 4] 5413 	call ddrop  
      009C34 18               [ 2] 5414 	popw x 
      009C35 81 04            [ 1] 5415 	ld a,#TK_INTGR
      009C36 81               [ 4] 5416 	ret
      001EDF                       5417 bad_port:
      009C36 5F 92            [ 1] 5418 	ld a,#ERR_BAD_VALUE
      009C38 AF 00 13         [ 2] 5419 	jp tb_error
                                   5420 
                                   5421 
                                   5422 ;-------------------------
                                   5423 ; BASIC: UFLASH 
                                   5424 ; return user flash address
                                   5425 ; input:
                                   5426 ;  none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   5427 ; output:
                                   5428 ;	A		TK_INTGR
                                   5429 ;   X 		user address 
                                   5430 ;---------------------------
      001EE4                       5431 uflash:
      009C3B 90 F1 26         [ 2] 5432 	ldw x,#user_space 
      009C3E 08 4D            [ 1] 5433 	ld a,#TK_INTGR 
      009C40 27               [ 4] 5434 	ret 
                                   5435 
                                   5436 
                                   5437 ;---------------------
                                   5438 ; BASIC: USR(addr[,arg])
                                   5439 ; execute a function written 
                                   5440 ; in binary code.
                                   5441 ; binary fonction should 
                                   5442 ; return token attribute in A 
                                   5443 ; and value in X. 
                                   5444 ; input:
                                   5445 ;   addr	routine address 
                                   5446 ;   arg 	is an optional argument 
                                   5447 ; output:
                                   5448 ;   A 		token attribute 
                                   5449 ;   X       returned value 
                                   5450 ;---------------------
      001EEA                       5451 usr:
      009C41 12 5C            [ 2] 5452 	pushw y 	
      009C43 90 5C 20         [ 4] 5453 	call func_args 
      009C46 F0 01            [ 1] 5454 	cp a,#1 
      009C47 2A 03            [ 1] 5455 	jrpl 2$ 
      009C47 4D 27 07         [ 2] 5456 	jp syntax_error 
      001EF6                       5457 2$: 
      009C4A 5C 92 AF         [ 4] 5458 	call dpop 
      009C4D 00 13            [ 1] 5459 	cp a,#2 
      009C4F 20 F6            [ 1] 5460 	jrmi 4$
      009C51 5C 98            [ 1] 5461 	ldw y,x ; y=arg 
      009C53 81 0F ED         [ 4] 5462 	call dpop ;x=addr 
      009C54 51               [ 1] 5463 4$:	exgw y,x ; y=addr,x=arg 
      009C54 5C 99            [ 4] 5464 	call (y)
      009C56 81 85            [ 2] 5465 	popw y 
      009C57 81               [ 4] 5466 	ret 
                                   5467 
                                   5468 ;------------------------------
                                   5469 ; BASIC: BYE 
                                   5470 ; halt mcu in its lowest power mode 
                                   5471 ; wait for reset or external interrupt
                                   5472 ; do a cold start on wakeup.
                                   5473 ;------------------------------
      001F08                       5474 bye:
      009C57 52 04 17 03 5F   [ 2] 5475 	btjf UART1_SR,#UART_SR_TC,.
      009C5C CF               [10] 5476 	halt
      009C5D 00 14 35         [ 2] 5477 	jp cold_start  
                                   5478 
                                   5479 ;----------------------------------
                                   5480 ; BASIC: AUTORUN "file_name" 
                                   5481 ; record in eeprom at adrress AUTORUN_NAME
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   5482 ; the name of file to load and execute
                                   5483 ; at startup 
                                   5484 ; input:
                                   5485 ;   file_name   file to execute 
                                   5486 ; output:
                                   5487 ;   none
                                   5488 ;-----------------------------------
      001F11                       5489 autorun: 
      009C60 01 00 13 21 07   [ 2] 5490 	btjf flags,#FRUN,0$ 
      009C63 27 05            [ 1] 5491 	jreq 0$ 
      009C63 92 BC            [ 1] 5492 	ld a,#ERR_CMD_ONLY 
      009C65 00 13 27         [ 2] 5493 	jp tb_error 
      001F1D                       5494 0$:	
      009C68 25 5F 16         [ 4] 5495 	call next_token 
      009C6B 03 CD            [ 1] 5496 	cp a,#TK_QSTR
      009C6D 9C 36            [ 1] 5497 	jreq 1$
      009C6F 25 2D 92         [ 2] 5498 	jp syntax_error 
      001F27                       5499 1$:	
      009C72 AF               [ 2] 5500 	pushw x ; file name char*
      009C73 00 13            [ 1] 5501 	ldw y,x  
      009C75 6B 01 5C         [ 4] 5502 	call search_file 
      009C78 92 AF            [ 1] 5503 	jrc 2$ 
      009C7A 00 13            [ 1] 5504 	ld a,#ERR_NOT_FILE
      009C7C 6B 02 5C         [ 2] 5505 	jp tb_error  
      001F34                       5506 2$: 
      009C7F 72 FB 01 5C CD   [ 1] 5507 	mov in,count 
      009C84 9B EB AE 02      [ 1] 5508 	clr farptr 
      009C88 80 C3 00         [ 2] 5509 	ldw x,#AUTORUN_NAME
      009C8B 13 2A D5         [ 2] 5510 	ldw farptr+1,x 
      009C8E 1E 01            [ 2] 5511 	ldw x,(1,sp)  
      009C8E 72 5F 00         [ 4] 5512 	call strlen  ; return length in X 
      009C91 13 72            [ 2] 5513 	popw y 
      009C93 5F               [ 2] 5514 	pushw x 
      009C94 00               [ 1] 5515 	clrw x 
      009C95 14 72 5F         [ 4] 5516 	call write_block 
      001F4F                       5517 	_drop 2 
      009C98 00 15            [ 2]    1     addw sp,#2 
      009C9A 5B               [ 4] 5518 	ret 
                                   5519 
                                   5520 ;----------------------------------
                                   5521 ; BASIC: SLEEP 
                                   5522 ; halt mcu until reset or external
                                   5523 ; interrupt.
                                   5524 ; Resume progam after SLEEP command
                                   5525 ;----------------------------------
      001F52                       5526 sleep:
      009C9B 04 98 81 30 FB   [ 2] 5527 	btjf UART1_SR,#UART_SR_TC,.
      009C9E 72 16 00 21      [ 1] 5528 	bset flags,#FSLEEP
      009C9E 5B               [10] 5529 	halt 
      009C9F 04               [ 4] 5530 	ret 
                                   5531 
                                   5532 ;-------------------------------
                                   5533 ; BASIC: PAUSE expr 
                                   5534 ; suspend execution for n msec.
                                   5535 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   5536 ;	none
                                   5537 ; output:
                                   5538 ;	none 
                                   5539 ;------------------------------
      001F5D                       5540 pause:
      009CA0 99 81 E4         [ 4] 5541 	call expression
      009CA2 A1 04            [ 1] 5542 	cp a,#TK_INTGR
      009CA2 72 01            [ 1] 5543 	jreq pause02 
      009CA4 00 22 05         [ 2] 5544 	jp syntax_error
      001F67                       5545 pause02: 
      009CA7 A6               [ 2] 5546 1$: tnzw x 
      009CA8 07 CC            [ 1] 5547 	jreq 2$
      009CAA 88               [10] 5548 	wfi 
      009CAB 0B               [ 2] 5549 	decw x 
      009CAC 26 F9            [ 1] 5550 	jrne 1$
      009CAC CE               [ 1] 5551 2$:	clr a 
      009CAD 00               [ 4] 5552 	ret 
                                   5553 
                                   5554 ;------------------------------
                                   5555 ; BASIC: AWU expr
                                   5556 ; halt mcu for 'expr' milliseconds
                                   5557 ; use Auto wakeup peripheral
                                   5558 ; all oscillators stopped except LSI
                                   5559 ; range: 1ms - 511ms
                                   5560 ; input:
                                   5561 ;  none
                                   5562 ; output:
                                   5563 ;  none:
                                   5564 ;------------------------------
      001F70                       5565 awu:
      009CAE 1D 72 B0         [ 4] 5566   call expression
      009CB1 00 1B            [ 1] 5567   cp a,#TK_INTGR
      009CB3 26 01            [ 1] 5568   jreq awu02
      009CB5 81 07 89         [ 2] 5569   jp syntax_error
      009CB6                       5570 awu02:
      009CB6 52 04 1F         [ 2] 5571   cpw x,#5120
      009CB9 01 CD            [ 1] 5572   jrmi 1$ 
      009CBB 88 BD A1 0A      [ 1] 5573   mov AWU_TBR,#15 
      009CBF 27 03            [ 1] 5574   ld a,#30
      009CC1 CC               [ 2] 5575   div x,a
      009CC2 88 09            [ 1] 5576   ld a,#16
      009CC4 62               [ 2] 5577   div x,a 
      009CC4 90 CE            [ 2] 5578   jra 4$
      001F8B                       5579 1$: 
      009CC6 00 05 72         [ 2] 5580   cpw x,#2048
      009CC9 B9 00            [ 1] 5581   jrmi 2$ 
      009CCB 01 17 03 55      [ 1] 5582   mov AWU_TBR,#14
      009CCF 00 04            [ 1] 5583   ld a,#80
      009CD1 00               [ 2] 5584   div x,a 
      009CD2 02 93            [ 2] 5585   jra 4$   
      001F99                       5586 2$:
      009CD4 CD 83 20 1C      [ 1] 5587   mov AWU_TBR,#7
      001F9D                       5588 3$:  
                                   5589 ; while X > 64  divide by 2 and increment AWU_TBR 
      009CD8 00 03 72         [ 2] 5590   cpw x,#64 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009CDB FB 01            [ 2] 5591   jrule 4$ 
      009CDD 72 5D 00 16      [ 1] 5592   inc AWU_TBR 
      009CE1 26               [ 2] 5593   srlw x 
      009CE2 0B 72            [ 2] 5594   jra 3$ 
      001FA9                       5595 4$:
      009CE4 B0               [ 1] 5596   ld a, xl
      009CE5 00               [ 1] 5597   dec a 
      009CE6 17 23            [ 1] 5598   jreq 5$
      009CE8 05               [ 1] 5599   dec a 	
      001FAE                       5600 5$: 
      009CE9 A6 01            [ 1] 5601   and a,#0x3e 
      009CEB CC 88 0B         [ 1] 5602   ld AWU_APR,a 
      009CEE 72 18 50 F0      [ 1] 5603   bset AWU_CSR,#AWU_CSR_AWUEN
      009CEE 16               [10] 5604   halt 
                                   5605 
      009CEF 03               [ 4] 5606   ret 
                                   5607 
                                   5608 ;------------------------------
                                   5609 ; BASIC: TICKS
                                   5610 ; return msec ticks counter value 
                                   5611 ; input:
                                   5612 ; 	none 
                                   5613 ; output:
                                   5614 ;	X 		TK_INTGR
                                   5615 ;-------------------------------
      001FB9                       5616 get_ticks:
      009CF0 CD 9C 57         [ 2] 5617 	ldw x,ticks 
      009CF3 24 05            [ 1] 5618 	ld a,#TK_INTGR
      009CF5 A6               [ 4] 5619 	ret 
                                   5620 
                                   5621 
                                   5622 
                                   5623 ;------------------------------
                                   5624 ; BASIC: ABS(expr)
                                   5625 ; return absolute value of expr.
                                   5626 ; input:
                                   5627 ;   none
                                   5628 ; output:
                                   5629 ;   X     	positive integer
                                   5630 ;-------------------------------
      001FBF                       5631 abs:
      009CF6 08 CC 88         [ 4] 5632 	call func_args 
      009CF9 0B 01            [ 1] 5633 	cp a,#1 
      009CFA 27 03            [ 1] 5634 	jreq 0$ 
      009CFA CE 00 16         [ 2] 5635 	jp syntax_error
      001FC9                       5636 0$:  
      009CFD C6 00 18         [ 4] 5637     call dpop   
      009D00 CF               [ 1] 5638 	ld a,xh 
      009D01 00 13            [ 1] 5639 	bcp a,#0x80 
      009D03 C7 00            [ 1] 5640 	jreq 2$ 
      009D05 15               [ 2] 5641 	negw x 
      009D06 1E 03            [ 1] 5642 2$: ld a,#TK_INTGR 
      009D08 CD               [ 4] 5643 	ret 
                                   5644 
                                   5645 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   5646 ; BASIC: AND(expr1,expr2)
                                   5647 ; Apply bit AND relation between
                                   5648 ; the 2 arguments, i.e expr1 & expr2 
                                   5649 ; output:
                                   5650 ; 	A 		TK_INTGR
                                   5651 ;   X 		result 
                                   5652 ;------------------------------
      001FD5                       5653 bit_and:
      009D09 83 20 5C         [ 4] 5654 	call func_args 
      009D0C 1F 01            [ 1] 5655 	cp a,#2
      009D0E 5F 16            [ 1] 5656 	jreq 1$
      009D10 03 CD 81         [ 2] 5657 	jp syntax_error 
      009D13 ED CE 00         [ 4] 5658 1$:	call dpop 
      009D16 1D               [ 2] 5659 	pushw x 
      009D17 72 B0 00         [ 4] 5660 	call dpop 
      009D1A 1B               [ 1] 5661 	ld a,xh 
      009D1B 1F 01            [ 1] 5662 	and a,(1,sp)
      009D1D 5F               [ 1] 5663 	ld xh,a 
      009D1E 7B               [ 1] 5664 	ld a,xl
      009D1F 01 CD            [ 1] 5665 	and a,(2,sp)
      009D21 81               [ 1] 5666 	ld xl,a 
      001FEE                       5667 	_drop 2 
      009D22 78 5C            [ 2]    1     addw sp,#2 
      009D24 7B 02            [ 1] 5668 	ld a,#TK_INTGR
      009D26 CD               [ 4] 5669 	ret
                                   5670 
                                   5671 ;------------------------------
                                   5672 ; BASIC: OR(expr1,expr2)
                                   5673 ; Apply bit OR relation between
                                   5674 ; the 2 arguments, i.e expr1 | expr2 
                                   5675 ; output:
                                   5676 ; 	A 		TK_INTGR
                                   5677 ;   X 		result 
                                   5678 ;------------------------------
      001FF3                       5679 bit_or:
      009D27 81 78 5C         [ 4] 5680 	call func_args 
      009D2A CD 9B            [ 1] 5681 	cp a,#2
      009D2C EB 1E            [ 1] 5682 	jreq 1$
      009D2E 01 89 5F         [ 2] 5683 	jp syntax_error 
      001FFD                       5684 1$: 
      009D31 90 CE 00         [ 4] 5685 	call dpop 
      009D34 1B               [ 2] 5686 	pushw x 
      009D35 CD 81 ED         [ 4] 5687 	call dpop 
      009D38 5B               [ 1] 5688 	ld a,xh 
      009D39 02 AE            [ 1] 5689 	or a,(1,sp)
      009D3B 00               [ 1] 5690 	ld xh,a 
      009D3C 01               [ 1] 5691 	ld a,xl 
      009D3D A6 FF            [ 1] 5692 	or a,(2,sp)
      009D3F CD               [ 1] 5693 	ld xl,a 
      00200C                       5694 	_drop 2 
      009D40 81 78            [ 2]    1     addw sp,#2 
      009D42 CD 9B            [ 1] 5695 	ld a,#TK_INTGR 
      009D44 EB               [ 4] 5696 	ret
                                   5697 
                                   5698 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                   5699 ; BASIC: XOR(expr1,expr2)
                                   5700 ; Apply bit XOR relation between
                                   5701 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5702 ; output:
                                   5703 ; 	A 		TK_INTGR
                                   5704 ;   X 		result 
                                   5705 ;------------------------------
      002011                       5706 bit_xor:
      009D45 CE 00 13         [ 4] 5707 	call func_args 
      009D48 C6 00            [ 1] 5708 	cp a,#2
      009D4A 15 CF            [ 1] 5709 	jreq 1$
      009D4C 00 16 C7         [ 2] 5710 	jp syntax_error 
      00201B                       5711 1$: 
      009D4F 00 18 5F         [ 4] 5712 	call dpop 
      009D52 4B               [ 2] 5713 	pushw x 
      009D53 04 0F ED         [ 4] 5714 	call dpop 
      009D54 9E               [ 1] 5715 	ld a,xh 
      009D54 4F CD            [ 1] 5716 	xor a,(1,sp)
      009D56 81               [ 1] 5717 	ld xh,a 
      009D57 78               [ 1] 5718 	ld a,xl 
      009D58 5C 0A            [ 1] 5719 	xor a,(2,sp)
      009D5A 01               [ 1] 5720 	ld xl,a 
      00202A                       5721 	_drop 2 
      009D5B 26 F7            [ 2]    1     addw sp,#2 
      009D5D 84 1E            [ 1] 5722 	ld a,#TK_INTGR 
      009D5F 01               [ 4] 5723 	ret 
                                   5724 
                                   5725 ;------------------------------
                                   5726 ; BASIC: LSHIFT(expr1,expr2)
                                   5727 ; logical shift left expr1 by 
                                   5728 ; expr2 bits 
                                   5729 ; output:
                                   5730 ; 	A 		TK_INTGR
                                   5731 ;   X 		result 
                                   5732 ;------------------------------
      00202F                       5733 lshift:
      009D60 CD 8A 67         [ 4] 5734 	call func_args
      009D63 5B 04            [ 1] 5735 	cp a,#2 
      009D65 81 03            [ 1] 5736 	jreq 1$
      009D66 CC 07 89         [ 2] 5737 	jp syntax_error
      009D66 CD 9B EB         [ 4] 5738 1$: call dpop  
      009D69 CD               [ 1] 5739 	exgw x,y 
      009D6A 86 EB 5F         [ 4] 5740 	call dpop
      009D6D 92 AF            [ 2] 5741 	tnzw y 
      009D6F 00 13            [ 1] 5742 	jreq 4$
      009D71 90               [ 2] 5743 2$:	sllw x 
      009D72 95 5C            [ 2] 5744 	decw y 
      009D74 92 AF            [ 1] 5745 	jrne 2$
      002049                       5746 4$:  
      009D76 00 13            [ 1] 5747 	ld a,#TK_INTGR
      009D78 5C               [ 4] 5748 	ret
                                   5749 
                                   5750 ;------------------------------
                                   5751 ; BASIC: RSHIFT(expr1,expr2)
                                   5752 ; logical shift right expr1 by 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                   5753 ; expr2 bits.
                                   5754 ; output:
                                   5755 ; 	A 		TK_INTGR
                                   5756 ;   X 		result 
                                   5757 ;------------------------------
      00204C                       5758 rshift:
      009D79 90 97 72         [ 4] 5759 	call func_args
      009D7C B9 00            [ 1] 5760 	cp a,#2 
      009D7E 1B 90            [ 1] 5761 	jreq 1$
      009D80 CF 00 1D         [ 2] 5762 	jp syntax_error
      009D83 90 CE 00         [ 4] 5763 1$: call dpop  
      009D86 1B               [ 1] 5764 	exgw x,y 
      009D87 CD 0F ED         [ 4] 5765 	call dpop
      009D87 92 AF            [ 2] 5766 	tnzw y 
      009D89 00 13            [ 1] 5767 	jreq 4$
      009D8B 90               [ 2] 5768 2$:	srlw x 
      009D8C F7 5C            [ 2] 5769 	decw y 
      009D8E 90 5C            [ 1] 5770 	jrne 2$
      002066                       5771 4$:  
      009D90 90 C3            [ 1] 5772 	ld a,#TK_INTGR
      009D92 00               [ 4] 5773 	ret
                                   5774 
                                   5775 ;--------------------------
                                   5776 ; BASIC: FCPU integer
                                   5777 ; set CPU frequency 
                                   5778 ;-------------------------- 
                                   5779 
      002069                       5780 fcpu:
      009D93 1D 2B            [ 1] 5781 	ld a,#TK_INTGR
      009D95 F1 81 D7         [ 4] 5782 	call expect 
      009D97 9F               [ 1] 5783 	ld a,xl 
      009D97 72 01            [ 1] 5784 	and a,#7 
      009D99 00 22 07         [ 1] 5785 	ld CLK_CKDIVR,a 
      009D9C 27               [ 4] 5786 	ret 
                                   5787 
                                   5788 ;------------------------------
                                   5789 ; BASIC: PMODE pin#, mode 
                                   5790 ; Arduino pin. 
                                   5791 ; define pin as input or output
                                   5792 ; pin#: {0..15}
                                   5793 ; mode: INPUT|OUTPUT  
                                   5794 ;------------------------------
                           000001  5795 	PINNO=1
                           000001  5796 	VSIZE=1
      002075                       5797 pin_mode:
      002075                       5798 	_vars VSIZE 
      009D9D 05 A6            [ 2]    1     sub sp,#VSIZE 
      009D9F 07 CC 88         [ 4] 5799 	call arg_list 
      009DA2 0B 02            [ 1] 5800 	cp a,#2 
      009DA3 27 03            [ 1] 5801 	jreq 1$
      009DA3 CD 88 BD         [ 2] 5802 	jp syntax_error 
      009DA6 A1 0A 27         [ 4] 5803 1$: call dpop ; mode 
      009DA9 03               [ 1] 5804 	exgw x,y 
      009DAA CC 88 09         [ 4] 5805 	call dpop ; Dx pin 
      009DAD CD 20 BA         [ 4] 5806 	call select_pin 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009DAD 90 CE            [ 1] 5807 	ld (PINNO,sp),a  
      009DAF 00 05            [ 1] 5808 	ld a,#1 
      009DB1 72 B9            [ 1] 5809 	tnz (PINNO,sp)
      009DB3 00 01            [ 1] 5810 	jreq 4$
      009DB5 55               [ 1] 5811 2$:	sll a 
      009DB6 00 04            [ 1] 5812 	dec (PINNO,sp)
      009DB8 00 02            [ 1] 5813 	jrne 2$ 
      009DBA CD 9C            [ 1] 5814 	ld (PINNO,sp),a
      009DBC 57 25            [ 1] 5815 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009DBE 05 A6            [ 1] 5816 	ld (GPIO_CR1,x),a 
      009DC0 09 CC 88 0B      [ 2] 5817 4$:	cpw y,#OUTP 
      009DC4 27 07            [ 1] 5818 	jreq 6$
                                   5819 ; input mode
      009DC4 CD 9D            [ 1] 5820 	ld a,(PINNO,sp)
      009DC6 66               [ 1] 5821 	cpl a 
      009DC7 CE 00            [ 1] 5822 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009DC9 1D 72            [ 2] 5823 	jra 9$
      0020AB                       5824 6$: ;output mode  
      009DCB B0 00            [ 1] 5825 	ld a,(PINNO,sp)
      009DCD 1B CD            [ 1] 5826 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009DCF 8A 67            [ 1] 5827 	ld (GPIO_CR2,x),a 
      009DD1 81 01            [ 1] 5828 	ld a,(PINNO,sp)
      009DD2 EA 02            [ 1] 5829 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009DD2 CD 88            [ 1] 5830 9$:	ld (GPIO_DDR,x),a 
      0020B7                       5831 	_drop VSIZE 
      009DD4 BD A1            [ 2]    1     addw sp,#VSIZE 
      009DD6 00               [ 4] 5832 	ret
                                   5833 
                                   5834 ;------------------------
                                   5835 ; select Arduino pin 
                                   5836 ; input:
                                   5837 ;   X 	 {0..15} Arduino Dx 
                                   5838 ; output:
                                   5839 ;   A     stm8s208 pin 
                                   5840 ;   X     base address s208 GPIO port 
                                   5841 ;---------------------------
      0020BA                       5842 select_pin:
      009DD7 27               [ 2] 5843 	sllw x 
      009DD8 26 A1 0A         [ 2] 5844 	addw x,#arduino_to_8s208 
      009DDB 27               [ 2] 5845 	ldw x,(x)
      009DDC 03               [ 1] 5846 	ld a,xl 
      009DDD CC               [ 1] 5847 	push a 
      009DDE 88               [ 1] 5848 	swapw x 
      009DDF 09 90            [ 1] 5849 	ld a,#5 
      009DE1 CE               [ 4] 5850 	mul x,a 
      009DE2 00 05 72         [ 2] 5851 	addw x,#GPIO_BASE 
      009DE5 B9               [ 1] 5852 	pop a 
      009DE6 00               [ 4] 5853 	ret 
                                   5854 ; translation from Arduino D0..D15 to stm8s208rb 
      0020CA                       5855 arduino_to_8s208:
      009DE7 01 55                 5856 .byte 3,6 ; D0 
      009DE9 00 04                 5857 .byte 3,5 ; D1 
      009DEB 00 02                 5858 .byte 4,0 ; D2 
      009DED CD 9C                 5859 .byte 2,1 ; D3
      009DEF 57 25                 5860 .byte 6,0 ; D4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009DF1 05 A6                 5861 .byte 2,2 ; D5
      009DF3 09 CC                 5862 .byte 2,3 ; D6
      009DF5 88 0B                 5863 .byte 3,1 ; D7
      009DF7 03 03                 5864 .byte 3,3 ; D8
      009DF7 CE 00                 5865 .byte 2,4 ; D9
      009DF9 13 C6                 5866 .byte 4,5 ; D10
      009DFB 00 15                 5867 .byte 2,6 ; D11
      009DFD 20 0A                 5868 .byte 2,7 ; D12
      009DFF 02 05                 5869 .byte 2,5 ; D13
      009DFF AE 01                 5870 .byte 4,2 ; D14
      009E01 00 4F                 5871 .byte 4,1 ; D15
                                   5872 
                                   5873 
                                   5874 ;------------------------------
                                   5875 ; BASIC: RND(expr)
                                   5876 ; return random number 
                                   5877 ; between 1 and expr inclusive
                                   5878 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5879 ; input:
                                   5880 ; 	none 
                                   5881 ; output:
                                   5882 ;	X 		random positive integer 
                                   5883 ;------------------------------
      0020EA                       5884 random:
      009E03 CF 00 13         [ 4] 5885 	call func_args 
      009E06 C7 00            [ 1] 5886 	cp a,#1
      009E08 15 03            [ 1] 5887 	jreq 1$
      009E09 CC 07 89         [ 2] 5888 	jp syntax_error
      0020F4                       5889 1$: 
      009E09 CF 00 16         [ 4] 5890 	call dpop 
      009E0C C7               [ 2] 5891 	pushw x 
      009E0D 00               [ 1] 5892 	ld a,xh 
      009E0E 18 4B            [ 1] 5893 	bcp a,#0x80 
      009E10 04 5F            [ 1] 5894 	jreq 2$
      009E12 A6 0A            [ 1] 5895 	ld a,#ERR_BAD_VALUE
      009E12 4F CD 81         [ 2] 5896 	jp tb_error
      002102                       5897 2$: 
                                   5898 ; acc16=(x<<5)^x 
      009E15 78 5C 0A         [ 2] 5899 	ldw x,seedx 
      009E18 01               [ 2] 5900 	sllw x 
      009E19 26               [ 2] 5901 	sllw x 
      009E1A F7               [ 2] 5902 	sllw x 
      009E1B 84               [ 2] 5903 	sllw x 
      009E1C 81               [ 2] 5904 	sllw x 
      009E1D 9E               [ 1] 5905 	ld a,xh 
      009E1D 52 02 5F         [ 1] 5906 	xor a,seedx 
      009E20 1F 01 CF         [ 1] 5907 	ld acc16,a 
      009E23 00               [ 1] 5908 	ld a,xl 
      009E24 14 35 01         [ 1] 5909 	xor a,seedx+1 
      009E27 00 13 09         [ 1] 5910 	ld acc8,a 
                                   5911 ; seedx=seedy 
      009E29 CE 00 10         [ 2] 5912 	ldw x,seedy 
      009E29 5F 92 AF         [ 2] 5913 	ldw seedx,x  
                                   5914 ; seedy=seedy^(seedy>>1)
      009E2C 00 13            [ 2] 5915 	srlw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009E2E 27 39            [ 1] 5916 	ld a,yh 
      009E30 C8 00 10         [ 1] 5917 	xor a,seedy 
      009E30 92 AF 00         [ 1] 5918 	ld seedy,a  
      009E33 13 27            [ 1] 5919 	ld a,yl 
      009E35 06 CD 82         [ 1] 5920 	xor a,seedy+1 
      009E38 4B 5C 20         [ 1] 5921 	ld seedy+1,a 
                                   5922 ; acc16>>3 
      009E3B F4 5C A6         [ 2] 5923 	ldw x,acc16 
      009E3E 20               [ 2] 5924 	srlw x 
      009E3F CD               [ 2] 5925 	srlw x 
      009E40 82               [ 2] 5926 	srlw x 
                                   5927 ; x=acc16^x 
      009E41 4B               [ 1] 5928 	ld a,xh 
      009E42 92 AF 00         [ 1] 5929 	xor a,acc16 
      009E45 13               [ 1] 5930 	ld xh,a 
      009E46 90               [ 1] 5931 	ld a,xl 
      009E47 95 5C 92         [ 1] 5932 	xor a,acc8 
      009E4A AF               [ 1] 5933 	ld xl,a 
                                   5934 ; seedy=x^seedy 
      009E4B 00 13 5C         [ 1] 5935 	xor a,seedy+1
      009E4E 90               [ 1] 5936 	ld xl,a 
      009E4F 97               [ 1] 5937 	ld a,xh 
      009E50 90 89 72         [ 1] 5938 	xor a,seedy
      009E53 FB               [ 1] 5939 	ld xh,a 
      009E54 01 5C CD         [ 2] 5940 	ldw seedy,x 
                                   5941 ; return seedy modulo expr + 1 
      009E57 9B EB            [ 2] 5942 	popw y 
      009E59 85               [ 2] 5943 	divw x,y 
      009E5A CD               [ 1] 5944 	ldw x,y 
      009E5B 8A               [ 2] 5945 	incw x 
      009E5C 67 A6            [ 1] 5946 	ld a,#TK_INTGR
      009E5E 0D               [ 4] 5947 	ret 
                                   5948 
                                   5949 ;---------------------------------
                                   5950 ; BASIC: WORDS 
                                   5951 ; affiche la listes des mots du
                                   5952 ; dictionnaire.
                                   5953 ;---------------------------------
                           000001  5954 	WLEN=1
                           000002  5955 	LLEN=2  
                           000002  5956 	VSIZE=2 
      002154                       5957 words:
      002154                       5958 	_vars VSIZE
      009E5F CD 82            [ 2]    1     sub sp,#VSIZE 
      009E61 4B 1E            [ 1] 5959 	clr (LLEN,sp)
      009E63 01 5C 1F 01      [ 2] 5960 	ldw y,#kword_dict+2
      009E67 20               [ 1] 5961 0$:	ldw x,y
      009E68 C0               [ 1] 5962 	ld a,(x)
      009E69 A4 0F            [ 1] 5963 	and a,#15 
      009E69 1E 01            [ 1] 5964 	ld (WLEN,sp),a 
      009E6B CD               [ 2] 5965 1$:	incw x 
      009E6C 8A               [ 1] 5966 	ld a,(x)
      009E6D 67 AE 9E         [ 4] 5967 	call putc 
      009E70 9E CD            [ 1] 5968 	inc (LLEN,sp)
      009E72 82 5E            [ 1] 5969 	dec (WLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009E74 A6 FF            [ 1] 5970 	jrne 1$
      009E76 C0 00            [ 1] 5971 	ld a,#70
      009E78 18 C7            [ 1] 5972 	cp a,(LLEN,sp)
      009E7A 00 0A            [ 1] 5973 	jrmi 2$   
      009E7C A6 7F            [ 1] 5974 	ld a,#SPACE 
      009E7E C2 00 17         [ 4] 5975 	call putc 
      009E81 C7 00            [ 1] 5976 	inc (LLEN,sp) 
      009E83 09 A6            [ 2] 5977 	jra 3$
      009E85 02 C2            [ 1] 5978 2$: ld a,#CR 
      009E87 00 16 C7         [ 4] 5979 	call putc 
      009E8A 00 08            [ 1] 5980 	clr (LLEN,sp)
      009E8C 5F A6 06 97      [ 2] 5981 3$:	subw y,#2 
      009E90 A6 0A            [ 2] 5982 	ldw y,(y)
      009E92 CD 8A            [ 1] 5983 	jrne 0$  
      00218B                       5984 	_drop VSIZE 
      009E94 1F AE            [ 2]    1     addw sp,#VSIZE 
      009E96 9E               [ 4] 5985 	ret 
                                   5986 
                                   5987 
                                   5988 ;-----------------------------
                                   5989 ; BASIC: TIMER expr 
                                   5990 ; initialize count down timer 
                                   5991 ;-----------------------------
      00218E                       5992 set_timer:
      009E97 A6 CD 82         [ 4] 5993 	call arg_list
      009E9A 5E 5B            [ 1] 5994 	cp a,#1 
      009E9C 02 81            [ 1] 5995 	jreq 1$
      009E9E 20 66 69         [ 2] 5996 	jp syntax_error
      002198                       5997 1$: 
      009EA1 6C 65 73         [ 4] 5998 	call dpop 
      009EA4 0A 00 20         [ 2] 5999 	ldw timer,x 
      009EA7 62               [ 4] 6000 	ret 
                                   6001 
                                   6002 ;------------------------------
                                   6003 ; BASIC: TIMEOUT 
                                   6004 ; return state of timer 
                                   6005 ;------------------------------
      00219F                       6006 timeout:
      009EA8 79 74 65         [ 2] 6007 	ldw x,timer 
      0021A2                       6008 logical_complement:
      009EAB 73               [ 2] 6009 	cplw x 
      009EAC 20 66 72         [ 2] 6010 	cpw x,#-1
      009EAF 65 65            [ 1] 6011 	jreq 2$
      009EB1 0A               [ 1] 6012 	clrw x 
      009EB2 00 04            [ 1] 6013 2$:	ld a,#TK_INTGR
      009EB3 81               [ 4] 6014 	ret 
                                   6015 
                                   6016 ;--------------------------------
                                   6017 ; BASIC NOT(expr) 
                                   6018 ; return logical complement of expr
                                   6019 ;--------------------------------
      0021AC                       6020 func_not:
      009EB3 52 02 72         [ 4] 6021 	call func_args  
      009EB6 5F 00            [ 1] 6022 	cp a,#1
      009EB8 13 CD            [ 1] 6023 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009EBA 93 64 A1         [ 2] 6024 	jp syntax_error
      009EBD 04 27 03         [ 4] 6025 1$:	call dpop 
      009EC0 CC 88            [ 2] 6026 	jra logical_complement
                                   6027 
                                   6028 
                                   6029 
                                   6030 ;-----------------------------------
                                   6031 ; BASIC: IWDGEN expr1 
                                   6032 ; enable independant watchdog timer
                                   6033 ; expr1 is delay in multiple of 62.5µsec
                                   6034 ; expr1 -> {1..16383}
                                   6035 ;-----------------------------------
      0021BB                       6036 enable_iwdg:
      009EC2 09 1F 01         [ 4] 6037 	call arg_list
      009EC5 CD 88            [ 1] 6038 	cp a,#1 
      009EC7 BD A1            [ 1] 6039 	jreq 1$
      009EC9 0D 27 02         [ 2] 6040 	jp syntax_error 
      009ECC 20 19            [ 1] 6041 1$: push #0
      009ECE CD 93 64 A1      [ 1] 6042 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009ED2 04 27 03         [ 4] 6043 	call dpop
      009ED5 CC               [ 1] 6044 	ld a,xh 
      009ED6 88 09            [ 1] 6045 	and a,#0x3f
      009ED8 9F               [ 1] 6046 	ld xh,a  
      009ED9 1E 01 CF         [ 2] 6047 2$:	cpw x,#255
      009EDC 00 14            [ 2] 6048 	jrule 3$
      009EDE 5F CD            [ 1] 6049 	inc (1,sp)
      009EE0 81               [ 1] 6050 	rcf 
      009EE1 78               [ 2] 6051 	rrcw x 
      009EE2 1E 01            [ 2] 6052 	jra 2$
      009EE4 5C 20 DC E0      [ 1] 6053 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009EE7 84               [ 1] 6054 	pop a  
      009EE7 5B 02 81         [ 1] 6055 	ld IWDG_PR,a 
      009EEA 9F               [ 1] 6056 	ld a,xl
      009EEA CD               [ 1] 6057 	dec a 
      009EEB 92 88 A1 01      [ 1] 6058 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009EEF 27 03 CC         [ 1] 6059 	ld IWDG_RLR,a 
      009EF2 88 09 CD 90      [ 1] 6060 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009EF6 6D               [ 4] 6061 	ret 
                                   6062 
                                   6063 
                                   6064 ;-----------------------------------
                                   6065 ; BASIC: IWDGREF  
                                   6066 ; refresh independant watchdog count down 
                                   6067 ; timer before it reset MCU. 
                                   6068 ;-----------------------------------
      0021F3                       6069 refresh_iwdg:
      009EF7 9F A4 7F 97      [ 1] 6070 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009EFB A6               [ 4] 6071 	ret 
                                   6072 
                                   6073 
                                   6074 ;-------------------------------------
                                   6075 ; BASIC: LOG(expr)
                                   6076 ; return logarithm base 2 of expr 
                                   6077 ; this is the position of most significant
                                   6078 ; bit set. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                   6079 ; input: 
                                   6080 ; output:
                                   6081 ;   X     log2 
                                   6082 ;   A     TK_INTGR 
                                   6083 ;*********************************
      0021F8                       6084 log2:
      009EFC 03 81 08         [ 4] 6085 	call func_args 
      009EFE A1 01            [ 1] 6086 	cp a,#1 
      009EFE A6 0B            [ 1] 6087 	jreq 1$
      009F00 CD 92 57         [ 2] 6088 	jp syntax_error 
      009F03 CD 88 BD         [ 4] 6089 1$: call dpop
      002205                       6090 leading_one:
      009F06 A1               [ 2] 6091 	tnzw x 
      009F07 0A 27            [ 1] 6092 	jreq 4$
      009F09 07 A1            [ 1] 6093 	ld a,#15 
      009F0B 03               [ 2] 6094 2$: rlcw x 
      009F0C 27 06            [ 1] 6095     jrc 3$
      009F0E CC               [ 1] 6096 	dec a 
      009F0F 88 09            [ 2] 6097 	jra 2$
      009F11 5F               [ 1] 6098 3$: clrw x 
      009F11 F6               [ 1] 6099     ld xl,a
      009F12 5F 97            [ 1] 6100 4$:	ld a,#TK_INTGR
      009F14 81               [ 4] 6101 	ret 
                                   6102 
                                   6103 ;-----------------------------------
                                   6104 ; BASIC: BIT(expr) 
                                   6105 ; expr ->{0..15}
                                   6106 ; return 2^expr 
                                   6107 ; output:
                                   6108 ;    x    2^expr 
                                   6109 ;-----------------------------------
      002215                       6110 bitmask:
      009F14 89 A6 0C         [ 4] 6111     call func_args 
      009F17 CD 92            [ 1] 6112 	cp a,#1
      009F19 57 85            [ 1] 6113 	jreq 1$
      009F1B A6 04 81         [ 2] 6114 	jp syntax_error 
      009F1E CD 0F ED         [ 4] 6115 1$: call dpop 
      009F1E CD               [ 1] 6116 	ld a,xl 
      009F1F 82 54            [ 1] 6117 	and a,#15
      009F21 5F               [ 1] 6118 	clrw x 
      009F22 97               [ 2] 6119 	incw x 
      009F23 A6               [ 1] 6120 2$: tnz a 
      009F24 04 81            [ 1] 6121 	jreq 3$
      009F26 58               [ 2] 6122 	slaw x 
      009F26 5F               [ 1] 6123 	dec a 
      009F27 72 5D            [ 2] 6124 	jra 2$ 
      009F29 00 24            [ 1] 6125 3$: ld a,#TK_INTGR
      009F2B 27               [ 4] 6126 	ret 
                                   6127 
                                   6128 ;------------------------------
                                   6129 ; BASIC: INVERT(expr)
                                   6130 ; 1's complement 
                                   6131 ;--------------------------------
      002231                       6132 invert:
      009F2C 01 53 A6         [ 4] 6133 	call func_args
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009F2F 04 81            [ 1] 6134 	cp a,#1 
      009F31 27 03            [ 1] 6135 	jreq 1$
      009F31 CD 92 88         [ 2] 6136 	jp syntax_error
      009F34 A1 02 27         [ 4] 6137 1$: call dpop 
      009F37 03               [ 2] 6138 	cplw x 
      009F38 CC 88            [ 1] 6139 	ld a,#TK_INTGR 
      009F3A 09               [ 4] 6140 	ret 
                                   6141 
                                   6142 ;------------------------------
                                   6143 ; BASIC: DO 
                                   6144 ; initiate a DO ... UNTIL loop 
                                   6145 ;------------------------------
      009F3B                       6146 do_loop:
      009F3B AE               [ 2] 6147 	popw x 
      002243                       6148 	_vars 4 
      009F3C 00 02            [ 2]    1     sub sp,#4 
      009F3E 72               [ 2] 6149 	pushw x 
      009F3F DE 00 19         [ 2] 6150 	jp store_loop_addr
                                   6151 
                                   6152 ;--------------------------------
                                   6153 ; BASIC: UNTIL expr 
                                   6154 ; loop if exprssion is false 
                                   6155 ; else terminate loop
                                   6156 ;--------------------------------
      002249                       6157 until: 
      009F42 2B 1B A3 00      [ 1] 6158 	tnz loop_depth 
      009F46 09 2A            [ 1] 6159 	jrne 1$ 
      009F48 16 A6 05         [ 2] 6160 	jp syntax_error 
      002252                       6161 1$: 
      009F4B 42 1C 50         [ 4] 6162 	call relation 
      009F4E 00 89            [ 1] 6163 	cp a,#TK_INTGR
      009F50 CD 90            [ 1] 6164 	jreq 2$
      009F52 6D 72 FB         [ 2] 6165 	jp syntax_error
      00225C                       6166 2$: 
      009F55 01               [ 2] 6167 	tnzw x 
      009F56 1F 01            [ 1] 6168 	jrne 9$
      009F58 CD 90 94         [ 2] 6169 	jp loop_back 
      002262                       6170 9$:	; remove loop info cstack  
      009F5B 85               [ 2] 6171 	popw x
      002263                       6172 	_drop 4
      009F5C A6 04            [ 2]    1     addw sp,#4 
      009F5E 81               [ 2] 6173 	pushw x 
      009F5F 72 5A 00 1E      [ 1] 6174 	dec loop_depth 
      009F5F A6               [ 4] 6175 	ret 
                                   6176 
                                   6177 ;--------------------------
                                   6178 ; BASIC: PRTA...PRTI  
                                   6179 ;  return constant value 
                                   6180 ;  PORT  offset in GPIO
                                   6181 ;  array
                                   6182 ;---------------------------
      00226B                       6183 const_porta:
      009F60 0A CC 88         [ 2] 6184 	ldw x,#0
      009F63 0B 04            [ 1] 6185 	ld a,#TK_INTGR 
      009F64 81               [ 4] 6186 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      002271                       6187 const_portb:
      009F64 AE A7 00         [ 2] 6188 	ldw x,#1
      009F67 A6 04            [ 1] 6189 	ld a,#TK_INTGR 
      009F69 81               [ 4] 6190 	ret 
      009F6A                       6191 const_portc:
      009F6A 90 89 CD         [ 2] 6192 	ldw x,#2
      009F6D 92 88            [ 1] 6193 	ld a,#TK_INTGR 
      009F6F A1               [ 4] 6194 	ret 
      00227D                       6195 const_portd:
      009F70 01 2A 03         [ 2] 6196 	ldw x,#3
      009F73 CC 88            [ 1] 6197 	ld a,#TK_INTGR 
      009F75 09               [ 4] 6198 	ret 
      009F76                       6199 const_porte:
      009F76 CD 90 6D         [ 2] 6200 	ldw x,#4
      009F79 A1 02            [ 1] 6201 	ld a,#TK_INTGR 
      009F7B 2B               [ 4] 6202 	ret 
      002289                       6203 const_portf:
      009F7C 05 90 93         [ 2] 6204 	ldw x,#5
      009F7F CD 90            [ 1] 6205 	ld a,#TK_INTGR 
      009F81 6D               [ 4] 6206 	ret 
      00228F                       6207 const_portg:
      009F82 51 90 FD         [ 2] 6208 	ldw x,#6
      009F85 90 85            [ 1] 6209 	ld a,#TK_INTGR 
      009F87 81               [ 4] 6210 	ret 
      009F88                       6211 const_porth:
      009F88 72 0D 52         [ 2] 6212 	ldw x,#7
      009F8B 30 FB            [ 1] 6213 	ld a,#TK_INTGR 
      009F8D 8E               [ 4] 6214 	ret 
      00229B                       6215 const_porti:
      009F8E CC 85 FA         [ 2] 6216 	ldw x,#8
      009F91 A6 04            [ 1] 6217 	ld a,#TK_INTGR 
      009F91 72               [ 4] 6218 	ret 
                                   6219 
                                   6220 ;-------------------------------
                                   6221 ; following return constant 
                                   6222 ; related to GPIO register offset 
                                   6223 ;---------------------------------
      0022A1                       6224 const_odr:
      009F92 01 00            [ 1] 6225 	ld a,#TK_INTGR 
      009F94 22 07 27         [ 2] 6226 	ldw x,#GPIO_ODR
      009F97 05               [ 4] 6227 	ret 
      0022A7                       6228 const_idr:
      009F98 A6 07            [ 1] 6229 	ld a,#TK_INTGR 
      009F9A CC 88 0B         [ 2] 6230 	ldw x,#GPIO_IDR
      009F9D 81               [ 4] 6231 	ret 
      0022AD                       6232 const_ddr:
      009F9D CD 88            [ 1] 6233 	ld a,#TK_INTGR 
      009F9F BD A1 0A         [ 2] 6234 	ldw x,#GPIO_DDR
      009FA2 27               [ 4] 6235 	ret 
      0022B3                       6236 const_cr1:
      009FA3 03 CC            [ 1] 6237 	ld a,#TK_INTGR 
      009FA5 88 09 03         [ 2] 6238 	ldw x,#GPIO_CR1
      009FA7 81               [ 4] 6239 	ret 
      0022B9                       6240 const_cr2:
      009FA7 89 90            [ 1] 6241 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009FA9 93 CD 9C         [ 2] 6242 	ldw x,#GPIO_CR2
      009FAC 57               [ 4] 6243 	ret 
                                   6244 ;-------------------------
                                   6245 ;  constant for port mode
                                   6246 ;  used by PMODE 
                                   6247 ;  input or output
                                   6248 ;------------------------
      0022BF                       6249 const_output:
      009FAD 25 05            [ 1] 6250 	ld a,#TK_INTGR 
      009FAF A6 09 CC         [ 2] 6251 	ldw x,#OUTP
      009FB2 88               [ 4] 6252 	ret 
      0022C5                       6253 const_input:
      009FB3 0B 04            [ 1] 6254 	ld a,#TK_INTGR 
      009FB4 AE 00 00         [ 2] 6255 	ldw x,#INP 
      009FB4 55               [ 4] 6256 	ret 
                                   6257 ;-----------------------
                                   6258 ; memory area constants
                                   6259 ;-----------------------
      0022CB                       6260 const_eeprom_base:
      009FB5 00 04            [ 1] 6261 	ld a,#TK_INTGR 
      009FB7 00 02 72         [ 2] 6262 	ldw x,#EEPROM_BASE 
      009FBA 5F               [ 4] 6263 	ret 
                                   6264 
                                   6265 
                                   6266 ;------------------------------
                                   6267 ;      dictionary 
                                   6268 ; format:
                                   6269 ;   link:   2 bytes 
                                   6270 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6271 ;   cmd_name: 16 byte max 
                                   6272 ;   code_address: 2 bytes 
                                   6273 ;------------------------------
                                   6274 	.macro _dict_entry len,name,cmd 
                                   6275 	.word LINK 
                                   6276 	LINK=.
                                   6277 name:
                                   6278 	.byte len 	
                                   6279 	.ascii "name"
                                   6280 	.word cmd 
                                   6281 	.endm 
                                   6282 
                           000000  6283 	LINK=0
                                   6284 ; respect alphabetic order for BASIC names from Z-A
                                   6285 ; this sort order is for a cleaner WORDS cmd output. 	
      0022D1                       6286 kword_end:
      0022D1                       6287 	_dict_entry,5+F_IFUNC,XPEEK,xpeek 
      009FBB 00 13                    1 	.word LINK 
                           0022D3     2 	LINK=.
      0022D3                          3 XPEEK:
      009FBD AE                       4 	.byte 5+F_IFUNC 	
      009FBE 40 00 CF 00 14           5 	.ascii "XPEEK"
      009FC3 1E 01                    6 	.word xpeek 
      0022DB                       6288 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009FC5 CD 83                    1 	.word LINK 
                           0022DD     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      0022DD                          3 XOR:
      009FC7 20                       4 	.byte 3+F_IFUNC 	
      009FC8 90 85 89                 5 	.ascii "XOR"
      009FCB 5F CD                    6 	.word bit_xor 
      0022E3                       6289 	_dict_entry,5,WRITE,write  
      009FCD 81 ED                    1 	.word LINK 
                           0022E5     2 	LINK=.
      0022E5                          3 WRITE:
      009FCF 5B                       4 	.byte 5 	
      009FD0 02 81 49 54 45           5 	.ascii "WRITE"
      009FD2 1E 33                    6 	.word write 
      0022ED                       6290 	_dict_entry,5,WORDS,words 
      009FD2 72 0D                    1 	.word LINK 
                           0022EF     2 	LINK=.
      0022EF                          3 WORDS:
      009FD4 52                       4 	.byte 5 	
      009FD5 30 FB 72 16 00           5 	.ascii "WORDS"
      009FDA 22 8E                    6 	.word words 
      0022F7                       6291 	_dict_entry 4,WAIT,wait 
      009FDC 81 EF                    1 	.word LINK 
                           0022F9     2 	LINK=.
      009FDD                          3 WAIT:
      009FDD CD                       4 	.byte 4 	
      009FDE 93 64 A1 04              5 	.ascii "WAIT"
      009FE2 27 03                    6 	.word wait 
      002300                       6292 	_dict_entry,3+F_IFUNC,USR,usr
      009FE4 CC 88                    1 	.word LINK 
                           002302     2 	LINK=.
      002302                          3 USR:
      009FE6 09                       4 	.byte 3+F_IFUNC 	
      009FE7 55 53 52                 5 	.ascii "USR"
      009FE7 5D 27                    6 	.word usr 
      002308                       6293 	_dict_entry,5,UNTIL,until 
      009FE9 04 8F                    1 	.word LINK 
                           00230A     2 	LINK=.
      00230A                          3 UNTIL:
      009FEB 5A                       4 	.byte 5 	
      009FEC 26 F9 4F 81 4C           5 	.ascii "UNTIL"
      009FF0 22 49                    6 	.word until 
      002312                       6294 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009FF0 CD 93                    1 	.word LINK 
                           002314     2 	LINK=.
      002314                          3 UFLASH:
      009FF2 64                       4 	.byte 6+F_IFUNC 	
      009FF3 A1 04 27 03 CC 88        5 	.ascii "UFLASH"
      009FF9 09 E4                    6 	.word uflash 
      009FFA                       6295 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009FFA A3 14                    1 	.word LINK 
                           00231F     2 	LINK=.
      00231F                          3 UBOUND:
      009FFC 00                       4 	.byte 6+F_IFUNC 	
      009FFD 2B 0C 35 0F 50 F2        5 	.ascii "UBOUND"
      00A003 A6 1E                    6 	.word ubound 
      002328                       6296 	_dict_entry,4,TONE,tone  
      00A005 62 A6                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                           00232A     2 	LINK=.
      00232A                          3 TONE:
      00A007 10                       4 	.byte 4 	
      00A008 62 20 1E 45              5 	.ascii "TONE"
      00A00B 19 D2                    6 	.word tone 
      002331                       6297 	_dict_entry,2,TO,to
      00A00B A3 08                    1 	.word LINK 
                           002333     2 	LINK=.
      002333                          3 TO:
      00A00D 00                       4 	.byte 2 	
      00A00E 2B 09                    5 	.ascii "TO"
      00A010 35 0E                    6 	.word to 
      002338                       6298 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A012 50 F2                    1 	.word LINK 
                           00233A     2 	LINK=.
      00233A                          3 TIMEOUT:
      00A014 A6                       4 	.byte 7+F_IFUNC 	
      00A015 50 62 20 10 4F 55 54     5 	.ascii "TIMEOUT"
      00A019 21 9F                    6 	.word timeout 
      002344                       6299 	_dict_entry,5,TIMER,set_timer
      00A019 35 07                    1 	.word LINK 
                           002346     2 	LINK=.
      002346                          3 TIMER:
      00A01B 50                       4 	.byte 5 	
      00A01C F2 49 4D 45 52           5 	.ascii "TIMER"
      00A01D 21 8E                    6 	.word set_timer 
      00234E                       6300 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A01D A3 00                    1 	.word LINK 
                           002350     2 	LINK=.
      002350                          3 TICKS:
      00A01F 40                       4 	.byte 5+F_IFUNC 	
      00A020 23 07 72 5C 50           5 	.ascii "TICKS"
      00A025 F2 54                    6 	.word get_ticks 
      002358                       6301 	_dict_entry,4,STOP,stop 
      00A027 20 F4                    1 	.word LINK 
                           00235A     2 	LINK=.
      00A029                          3 STOP:
      00A029 9F                       4 	.byte 4 	
      00A02A 4A 27 01 4A              5 	.ascii "STOP"
      00A02E 19 C3                    6 	.word stop 
      002361                       6302 	_dict_entry,4,STEP,step 
      00A02E A4 3E                    1 	.word LINK 
                           002363     2 	LINK=.
      002363                          3 STEP:
      00A030 C7                       4 	.byte 4 	
      00A031 50 F1 72 18              5 	.ascii "STEP"
      00A035 50 F0                    6 	.word step 
      00236A                       6303 	_dict_entry,5,SLEEP,sleep 
      00A037 8E 81                    1 	.word LINK 
                           00236C     2 	LINK=.
      00A039                          3 SLEEP:
      00A039 CE                       4 	.byte 5 	
      00A03A 00 0B A6 04 81           5 	.ascii "SLEEP"
      00A03F 1F 52                    6 	.word sleep 
      002374                       6304 	_dict_entry,4+F_IFUNC,SIZE,size
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A03F CD 92                    1 	.word LINK 
                           002376     2 	LINK=.
      002376                          3 SIZE:
      00A041 88                       4 	.byte 4+F_IFUNC 	
      00A042 A1 01 27 03              5 	.ascii "SIZE"
      00A046 CC 88                    6 	.word size 
      00237D                       6305     _dict_entry,4,SHOW,show 
      00A048 09 76                    1 	.word LINK 
                           00237F     2 	LINK=.
      00A049                          3 SHOW:
      00A049 CD                       4 	.byte 4 	
      00A04A 90 6D 9E A5              5 	.ascii "SHOW"
      00A04E 80 27                    6 	.word show 
      002386                       6306 	_dict_entry,4,SAVE,save
      00A050 01 50                    1 	.word LINK 
                           002388     2 	LINK=.
      002388                          3 SAVE:
      00A052 A6                       4 	.byte 4 	
      00A053 04 81 56 45              5 	.ascii "SAVE"
      00A055 1C 22                    6 	.word save 
      00238F                       6307 	_dict_entry 3,RUN,run
      00A055 CD 92                    1 	.word LINK 
                           002391     2 	LINK=.
      002391                          3 RUN:
      00A057 88                       4 	.byte 3 	
      00A058 A1 02 27                 5 	.ascii "RUN"
      00A05B 03 CC                    6 	.word run 
      002397                       6308 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A05D 88 09                    1 	.word LINK 
                           002399     2 	LINK=.
      002399                          3 RSHIFT:
      00A05F CD                       4 	.byte 6+F_IFUNC 	
      00A060 90 6D 89 CD 90 6D        5 	.ascii "RSHIFT"
      00A066 9E 14                    6 	.word rshift 
      0023A2                       6309 	_dict_entry,3+F_IFUNC,RND,random 
      00A068 01 95                    1 	.word LINK 
                           0023A4     2 	LINK=.
      0023A4                          3 RND:
      00A06A 9F                       4 	.byte 3+F_IFUNC 	
      00A06B 14 02 97                 5 	.ascii "RND"
      00A06E 5B 02                    6 	.word random 
      0023AA                       6310 	_dict_entry,6,RETURN,return 
      00A070 A6 04                    1 	.word LINK 
                           0023AC     2 	LINK=.
      0023AC                          3 RETURN:
      00A072 81                       4 	.byte 6 	
      00A073 52 45 54 55 52 4E        5 	.ascii "RETURN"
      00A073 CD 92                    6 	.word return 
      0023B5                       6311 	_dict_entry 6,REMARK,rem 
      00A075 88 A1                    1 	.word LINK 
                           0023B7     2 	LINK=.
      0023B7                          3 REMARK:
      00A077 02                       4 	.byte 6 	
      00A078 27 03 CC 88 09 4B        5 	.ascii "REMARK"
      00A07D 17 2A                    6 	.word rem 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      0023C0                       6312 	_dict_entry,6,REBOOT,cold_start 
      00A07D CD 90                    1 	.word LINK 
                           0023C2     2 	LINK=.
      0023C2                          3 REBOOT:
      00A07F 6D                       4 	.byte 6 	
      00A080 89 CD 90 6D 9E 1A        5 	.ascii "REBOOT"
      00A086 01 95                    6 	.word cold_start 
      0023CB                       6313 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A088 9F 1A                    1 	.word LINK 
                           0023CD     2 	LINK=.
      0023CD                          3 QKEY:
      00A08A 02                       4 	.byte 4+F_IFUNC 	
      00A08B 97 5B 02 A6              5 	.ascii "QKEY"
      00A08F 04 81                    6 	.word qkey 
      00A091                       6314 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      00A091 CD 92                    1 	.word LINK 
                           0023D6     2 	LINK=.
      0023D6                          3 PRTI:
      00A093 88                       4 	.byte 4+F_IFUNC 	
      00A094 A1 02 27 03              5 	.ascii "PRTI"
      00A098 CC 88                    6 	.word const_porti 
      0023DD                       6315 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      00A09A 09 D6                    1 	.word LINK 
                           0023DF     2 	LINK=.
      00A09B                          3 PRTH:
      00A09B CD                       4 	.byte 4+F_IFUNC 	
      00A09C 90 6D 89 CD              5 	.ascii "PRTH"
      00A0A0 90 6D                    6 	.word const_porth 
      0023E6                       6316 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      00A0A2 9E 18                    1 	.word LINK 
                           0023E8     2 	LINK=.
      0023E8                          3 PRTG:
      00A0A4 01                       4 	.byte 4+F_IFUNC 	
      00A0A5 95 9F 18 02              5 	.ascii "PRTG"
      00A0A9 97 5B                    6 	.word const_portg 
      0023EF                       6317 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      00A0AB 02 A6                    1 	.word LINK 
                           0023F1     2 	LINK=.
      0023F1                          3 PRTF:
      00A0AD 04                       4 	.byte 4+F_IFUNC 	
      00A0AE 81 52 54 46              5 	.ascii "PRTF"
      00A0AF 22 89                    6 	.word const_portf 
      0023F8                       6318 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      00A0AF CD 92                    1 	.word LINK 
                           0023FA     2 	LINK=.
      0023FA                          3 PRTE:
      00A0B1 88                       4 	.byte 4+F_IFUNC 	
      00A0B2 A1 02 27 03              5 	.ascii "PRTE"
      00A0B6 CC 88                    6 	.word const_porte 
      002401                       6319 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A0B8 09 CD                    1 	.word LINK 
                           002403     2 	LINK=.
      002403                          3 PRTD:
      00A0BA 90                       4 	.byte 4+F_IFUNC 	
      00A0BB 6D 51 CD 90              5 	.ascii "PRTD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A0BF 6D 90                    6 	.word const_portd 
      00240A                       6320 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A0C1 5D 27                    1 	.word LINK 
                           00240C     2 	LINK=.
      00240C                          3 PRTC:
      00A0C3 05                       4 	.byte 4+F_IFUNC 	
      00A0C4 58 90 5A 26              5 	.ascii "PRTC"
      00A0C8 FB 77                    6 	.word const_portc 
      00A0C9                       6321 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A0C9 A6 04                    1 	.word LINK 
                           002415     2 	LINK=.
      002415                          3 PRTB:
      00A0CB 81                       4 	.byte 4+F_IFUNC 	
      00A0CC 50 52 54 42              5 	.ascii "PRTB"
      00A0CC CD 92                    6 	.word const_portb 
      00241C                       6322 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A0CE 88 A1                    1 	.word LINK 
                           00241E     2 	LINK=.
      00241E                          3 PRTA:
      00A0D0 02                       4 	.byte 4+F_IFUNC 	
      00A0D1 27 03 CC 88              5 	.ascii "PRTA"
      00A0D5 09 CD                    6 	.word const_porta 
      002425                       6323 	_dict_entry 5,PRINT,print 
      00A0D7 90 6D                    1 	.word LINK 
                           002427     2 	LINK=.
      002427                          3 PRINT:
      00A0D9 51                       4 	.byte 5 	
      00A0DA CD 90 6D 90 5D           5 	.ascii "PRINT"
      00A0DF 27 05                    6 	.word print 
      00242F                       6324 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A0E1 54 90                    1 	.word LINK 
                           002431     2 	LINK=.
      002431                          3 POUT:
      00A0E3 5A                       4 	.byte 4+F_IFUNC 	
      00A0E4 26 FB 55 54              5 	.ascii "POUT"
      00A0E6 22 BF                    6 	.word const_output 
      002438                       6325 	_dict_entry,4,POKE,poke 
      00A0E6 A6 04                    1 	.word LINK 
                           00243A     2 	LINK=.
      00243A                          3 POKE:
      00A0E8 81                       4 	.byte 4 	
      00A0E9 50 4F 4B 45              5 	.ascii "POKE"
      00A0E9 A6 04                    6 	.word poke 
      002441                       6326 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A0EB CD 92                    1 	.word LINK 
                           002443     2 	LINK=.
      002443                          3 PINP:
      00A0ED 57                       4 	.byte 4+F_IFUNC 	
      00A0EE 9F A4 07 C7              5 	.ascii "PINP"
      00A0F2 50 C6                    6 	.word const_input 
      00244A                       6327 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A0F4 81 43                    1 	.word LINK 
                           00244C     2 	LINK=.
      00A0F5                          3 PEEK:
      00A0F5 52                       4 	.byte 4+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A0F6 01 CD 92 64              5 	.ascii "PEEK"
      00A0FA A1 02                    6 	.word peek 
      002453                       6328 	_dict_entry,5,PMODE,pin_mode 
      00A0FC 27 03                    1 	.word LINK 
                           002455     2 	LINK=.
      002455                          3 PMODE:
      00A0FE CC                       4 	.byte 5 	
      00A0FF 88 09 CD 90 6D           5 	.ascii "PMODE"
      00A104 51 CD                    6 	.word pin_mode 
      00245D                       6329 	_dict_entry,5,PAUSE,pause 
      00A106 90 6D                    1 	.word LINK 
                           00245F     2 	LINK=.
      00245F                          3 PAUSE:
      00A108 CD                       4 	.byte 5 	
      00A109 A1 3A 6B 01 A6           5 	.ascii "PAUSE"
      00A10E 01 0D                    6 	.word pause 
      002467                       6330 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A110 01 27                    1 	.word LINK 
                           002469     2 	LINK=.
      002469                          3 OR:
      00A112 0B                       4 	.byte 2+F_IFUNC 	
      00A113 48 0A                    5 	.ascii "OR"
      00A115 01 26                    6 	.word bit_or 
      00246E                       6331 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A117 FB 6B                    1 	.word LINK 
                           002470     2 	LINK=.
      002470                          3 ODR:
      00A119 01                       4 	.byte 3+F_IFUNC 	
      00A11A EA 03 E7                 5 	.ascii "ODR"
      00A11D 03 90                    6 	.word const_odr 
      002476                       6332 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A11F A3 00                    1 	.word LINK 
                           002478     2 	LINK=.
      002478                          3 NOT:
      00A121 01                       4 	.byte 3+F_IFUNC 	
      00A122 27 07 7B                 5 	.ascii "NOT"
      00A125 01 43                    6 	.word func_not 
      00247E                       6333 	_dict_entry,3,NEW,new
      00A127 E4 02                    1 	.word LINK 
                           002480     2 	LINK=.
      002480                          3 NEW:
      00A129 20                       4 	.byte 3 	
      00A12A 0A 45 57                 5 	.ascii "NEW"
      00A12B 1B 60                    6 	.word new 
      002486                       6334 	_dict_entry,4,NEXT,next 
      00A12B 7B 01                    1 	.word LINK 
                           002488     2 	LINK=.
      002488                          3 NEXT:
      00A12D EA                       4 	.byte 4 	
      00A12E 04 E7 04 7B              5 	.ascii "NEXT"
      00A132 01 EA                    6 	.word next 
      00248F                       6335 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A134 02 E7                    1 	.word LINK 
                           002491     2 	LINK=.
      002491                          3 LSHIFT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A136 02                       4 	.byte 6+F_IFUNC 	
      00A137 5B 01 81 49 46 54        5 	.ascii "LSHIFT"
      00A13A 20 2F                    6 	.word lshift 
      00249A                       6336 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A13A 58 1C                    1 	.word LINK 
                           00249C     2 	LINK=.
      00249C                          3 LOG:
      00A13C A1                       4 	.byte 3+F_IFUNC 	
      00A13D 4A FE 9F                 5 	.ascii "LOG"
      00A140 88 5E                    6 	.word log2 
      0024A2                       6337 	_dict_entry,4,LOAD,load 
      00A142 A6 05                    1 	.word LINK 
                           0024A4     2 	LINK=.
      0024A4                          3 LOAD:
      00A144 42                       4 	.byte 4 	
      00A145 1C 50 00 84              5 	.ascii "LOAD"
      00A149 81 17                    6 	.word load 
      00A14A                       6338 	_dict_entry 4,LIST,list
      00A14A 03 06                    1 	.word LINK 
                           0024AD     2 	LINK=.
      0024AD                          3 LIST:
      00A14C 03                       4 	.byte 4 	
      00A14D 05 04 00 02              5 	.ascii "LIST"
      00A151 01 06                    6 	.word list 
      0024B4                       6339 	_dict_entry 3,LET,let 
      00A153 00 02                    1 	.word LINK 
                           0024B6     2 	LINK=.
      0024B6                          3 LET:
      00A155 02                       4 	.byte 3 	
      00A156 02 03 03                 5 	.ascii "LET"
      00A159 01 03                    6 	.word let 
      0024BC                       6340 	_dict_entry,3+F_IFUNC,KEY,key 
      00A15B 03 02                    1 	.word LINK 
                           0024BE     2 	LINK=.
      0024BE                          3 KEY:
      00A15D 04                       4 	.byte 3+F_IFUNC 	
      00A15E 04 05 02                 5 	.ascii "KEY"
      00A161 06 02                    6 	.word key 
      0024C4                       6341 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A163 07 02                    1 	.word LINK 
                           0024C6     2 	LINK=.
      0024C6                          3 IWDGREF:
      00A165 05                       4 	.byte 7 	
      00A166 04 02 04 01 52 45 46     5 	.ascii "IWDGREF"
      00A16A 21 F3                    6 	.word refresh_iwdg 
      0024D0                       6342 	_dict_entry,6,IWDGEN,enable_iwdg
      00A16A CD 92                    1 	.word LINK 
                           0024D2     2 	LINK=.
      0024D2                          3 IWDGEN:
      00A16C 88                       4 	.byte 6 	
      00A16D A1 01 27 03 CC 88        5 	.ascii "IWDGEN"
      00A173 09 BB                    6 	.word enable_iwdg 
      00A174                       6343 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A174 CD 90                    1 	.word LINK 
                           0024DD     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0024DD                          3 INVERT:
      00A176 6D                       4 	.byte 6+F_IFUNC 	
      00A177 89 9E A5 80 27 05        5 	.ascii "INVERT"
      00A17D A6 0A                    6 	.word invert 
      0024E6                       6344 	_dict_entry,5,INPUT,input_var  
      00A17F CC 88                    1 	.word LINK 
                           0024E8     2 	LINK=.
      0024E8                          3 INPUT:
      00A181 0B                       4 	.byte 5 	
      00A182 49 4E 50 55 54           5 	.ascii "INPUT"
      00A182 CE 00                    6 	.word input_var 
      0024F0                       6345 	_dict_entry,2,IF,if 
      00A184 0F 58                    1 	.word LINK 
                           0024F2     2 	LINK=.
      0024F2                          3 IF:
      00A186 58                       4 	.byte 2 	
      00A187 58 58                    5 	.ascii "IF"
      00A189 58 9E                    6 	.word if 
      0024F7                       6346 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A18B C8 00                    1 	.word LINK 
                           0024F9     2 	LINK=.
      0024F9                          3 IDR:
      00A18D 0F                       4 	.byte 3+F_IFUNC 	
      00A18E C7 00 09                 5 	.ascii "IDR"
      00A191 9F C8                    6 	.word const_idr 
      0024FF                       6347 	_dict_entry,3,HEX,hex_base
      00A193 00 10                    1 	.word LINK 
                           002501     2 	LINK=.
      002501                          3 HEX:
      00A195 C7                       4 	.byte 3 	
      00A196 00 0A CE                 5 	.ascii "HEX"
      00A199 00 11                    6 	.word hex_base 
      002507                       6348 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A19B CF 00                    1 	.word LINK 
                           002509     2 	LINK=.
      002509                          3 GPIO:
      00A19D 0F                       4 	.byte 4+F_IFUNC 	
      00A19E 90 54 90 9E              5 	.ascii "GPIO"
      00A1A2 C8 00                    6 	.word gpio 
      002510                       6349 	_dict_entry,4,GOTO,goto 
      00A1A4 11 C7                    1 	.word LINK 
                           002512     2 	LINK=.
      002512                          3 GOTO:
      00A1A6 00                       4 	.byte 4 	
      00A1A7 11 90 9F C8              5 	.ascii "GOTO"
      00A1AB 00 12                    6 	.word goto 
      002519                       6350 	_dict_entry,5,GOSUB,gosub 
      00A1AD C7 00                    1 	.word LINK 
                           00251B     2 	LINK=.
      00251B                          3 GOSUB:
      00A1AF 12                       4 	.byte 5 	
      00A1B0 CE 00 09 54 54           5 	.ascii "GOSUB"
      00A1B5 54 9E                    6 	.word gosub 
      002523                       6351 	_dict_entry,6,FORGET,forget 
      00A1B7 C8 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                           002525     2 	LINK=.
      002525                          3 FORGET:
      00A1B9 09                       4 	.byte 6 	
      00A1BA 95 9F C8 00 0A 97        5 	.ascii "FORGET"
      00A1C0 C8 00                    6 	.word forget 
      00252E                       6352 	_dict_entry,3,FOR,for 
      00A1C2 12 97                    1 	.word LINK 
                           002530     2 	LINK=.
      002530                          3 FOR:
      00A1C4 9E                       4 	.byte 3 	
      00A1C5 C8 00 11                 5 	.ascii "FOR"
      00A1C8 95 CF                    6 	.word for 
      002536                       6353 	_dict_entry,4,FCPU,fcpu 
      00A1CA 00 11                    1 	.word LINK 
                           002538     2 	LINK=.
      002538                          3 FCPU:
      00A1CC 90                       4 	.byte 4 	
      00A1CD 85 65 93 5C              5 	.ascii "FCPU"
      00A1D1 A6 04                    6 	.word fcpu 
      00253F                       6354 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A1D3 81 38                    1 	.word LINK 
                           002541     2 	LINK=.
      00A1D4                          3 EEPROM:
      00A1D4 52                       4 	.byte 6+F_IFUNC 	
      00A1D5 02 0F 02 90 AE A6        5 	.ascii "EEPROM"
      00A1DB 93 93                    6 	.word const_eeprom_base 
      00254A                       6355 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A1DD F6 A4                    1 	.word LINK 
                           00254C     2 	LINK=.
      00254C                          3 DWRITE:
      00A1DF 0F                       4 	.byte 6+F_CMD 	
      00A1E0 6B 01 5C F6 CD 82        5 	.ascii "DWRITE"
      00A1E6 4B 0C                    6 	.word digital_write 
      002555                       6356 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A1E8 02 0A                    1 	.word LINK 
                           002557     2 	LINK=.
      002557                          3 DREAD:
      00A1EA 01                       4 	.byte 5+F_IFUNC 	
      00A1EB 26 F5 A6 46 11           5 	.ascii "DREAD"
      00A1F0 02 2B                    6 	.word digital_read 
      00255F                       6357 	_dict_entry,2,DO,do_loop
      00A1F2 09 A6                    1 	.word LINK 
                           002561     2 	LINK=.
      002561                          3 DO:
      00A1F4 20                       4 	.byte 2 	
      00A1F5 CD 82                    5 	.ascii "DO"
      00A1F7 4B 0C                    6 	.word do_loop 
      002566                       6358 	_dict_entry,3,DIR,directory 
      00A1F9 02 20                    1 	.word LINK 
                           002568     2 	LINK=.
      002568                          3 DIR:
      00A1FB 07                       4 	.byte 3 	
      00A1FC A6 0D CD                 5 	.ascii "DIR"
      00A1FF 82 4B                    6 	.word directory 
      00256E                       6359 	_dict_entry,3,DEC,dec_base
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A201 0F 02                    1 	.word LINK 
                           002570     2 	LINK=.
      002570                          3 DEC:
      00A203 72                       4 	.byte 3 	
      00A204 A2 00 02                 5 	.ascii "DEC"
      00A207 90 FE                    6 	.word dec_base 
      002576                       6360 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A209 26 D1                    1 	.word LINK 
                           002578     2 	LINK=.
      002578                          3 DDR:
      00A20B 5B                       4 	.byte 3+F_IFUNC 	
      00A20C 02 81 52                 5 	.ascii "DDR"
      00A20E 22 AD                    6 	.word const_ddr 
      00257E                       6361 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A20E CD 92                    1 	.word LINK 
                           002580     2 	LINK=.
      002580                          3 CRL:
      00A210 64                       4 	.byte 3+F_IFUNC 	
      00A211 A1 01 27                 5 	.ascii "CRL"
      00A214 03 CC                    6 	.word const_cr1 
      002586                       6362 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A216 88 09                    1 	.word LINK 
                           002588     2 	LINK=.
      00A218                          3 CRH:
      00A218 CD                       4 	.byte 3+F_IFUNC 	
      00A219 90 6D CF                 5 	.ascii "CRH"
      00A21C 00 0D                    6 	.word const_cr2 
      00258E                       6363 	_dict_entry,4+F_CFUNC,CHAR,char
      00A21E 81 88                    1 	.word LINK 
                           002590     2 	LINK=.
      00A21F                          3 CHAR:
      00A21F CE                       4 	.byte 4+F_CFUNC 	
      00A220 00 0D 41 52              5 	.ascii "CHAR"
      00A222 1E 6A                    6 	.word char 
      002597                       6364 	_dict_entry,3,BYE,bye 
      00A222 53 A3                    1 	.word LINK 
                           002599     2 	LINK=.
      002599                          3 BYE:
      00A224 FF                       4 	.byte 3 	
      00A225 FF 27 01                 5 	.ascii "BYE"
      00A228 5F A6                    6 	.word bye 
      00259F                       6365 	_dict_entry,5,BTOGL,bit_toggle
      00A22A 04 81                    1 	.word LINK 
                           0025A1     2 	LINK=.
      00A22C                          3 BTOGL:
      00A22C CD                       4 	.byte 5 	
      00A22D 92 88 A1 01 27           5 	.ascii "BTOGL"
      00A232 03 CC                    6 	.word bit_toggle 
      0025A9                       6366 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A234 88 09                    1 	.word LINK 
                           0025AB     2 	LINK=.
      0025AB                          3 BTEST:
      00A236 CD                       4 	.byte 5+F_IFUNC 	
      00A237 90 6D 20 E7 54           5 	.ascii "BTEST"
      00A23B 17 98                    6 	.word bit_test 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      0025B3                       6367 	_dict_entry,4,BSET,bit_set 
      00A23B CD 92                    1 	.word LINK 
                           0025B5     2 	LINK=.
      0025B5                          3 BSET:
      00A23D 64                       4 	.byte 4 	
      00A23E A1 01 27 03              5 	.ascii "BSET"
      00A242 CC 88                    6 	.word bit_set 
      0025BC                       6368 	_dict_entry,4,BRES,bit_reset
      00A244 09 4B                    1 	.word LINK 
                           0025BE     2 	LINK=.
      0025BE                          3 BRES:
      00A246 00                       4 	.byte 4 	
      00A247 35 CC 50 E0              5 	.ascii "BRES"
      00A24B CD 90                    6 	.word bit_reset 
      0025C5                       6369 	_dict_entry,5,BREAK,break 
      00A24D 6D 9E                    1 	.word LINK 
                           0025C7     2 	LINK=.
      0025C7                          3 BREAK:
      00A24F A4                       4 	.byte 5 	
      00A250 3F 95 A3 00 FF           5 	.ascii "BREAK"
      00A255 23 06                    6 	.word break 
      0025CF                       6370 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A257 0C 01                    1 	.word LINK 
                           0025D1     2 	LINK=.
      0025D1                          3 BIT:
      00A259 98                       4 	.byte 3+F_IFUNC 	
      00A25A 56 20 F5                 5 	.ascii "BIT"
      00A25D 35 55                    6 	.word bitmask 
      0025D7                       6371 	_dict_entry,3,AWU,awu 
      00A25F 50 E0                    1 	.word LINK 
                           0025D9     2 	LINK=.
      0025D9                          3 AWU:
      00A261 84                       4 	.byte 3 	
      00A262 C7 50 E1                 5 	.ascii "AWU"
      00A265 9F 4A                    6 	.word awu 
      0025DF                       6372 	_dict_entry,7,AUTORUN,autorun
      00A267 35 55                    1 	.word LINK 
                           0025E1     2 	LINK=.
      0025E1                          3 AUTORUN:
      00A269 50                       4 	.byte 7 	
      00A26A E0 C7 50 E2 35 AA 50     5 	.ascii "AUTORUN"
      00A271 E0 81                    6 	.word autorun 
      00A273                       6373 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A273 35 AA                    1 	.word LINK 
                           0025ED     2 	LINK=.
      0025ED                          3 ASC:
      00A275 50                       4 	.byte 3+F_IFUNC 	
      00A276 E0 81 43                 5 	.ascii "ASC"
      00A278 1E 7E                    6 	.word ascii 
      0025F3                       6374 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A278 CD 92                    1 	.word LINK 
                           0025F5     2 	LINK=.
      0025F5                          3 AND:
      00A27A 88                       4 	.byte 3+F_IFUNC 	
      00A27B A1 01 27                 5 	.ascii "AND"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A27E 03 CC                    6 	.word bit_and 
      0025FB                       6375 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A280 88 09                    1 	.word LINK 
                           0025FD     2 	LINK=.
      0025FD                          3 ADCREAD:
      00A282 CD                       4 	.byte 7+F_IFUNC 	
      00A283 90 6D 43 52 45 41 44     5 	.ascii "ADCREAD"
      00A285 1A 6D                    6 	.word analog_read 
      002607                       6376 	_dict_entry,5,ADCON,power_adc 
      00A285 5D 27                    1 	.word LINK 
                           002609     2 	LINK=.
      002609                          3 ADCON:
      00A287 0A                       4 	.byte 5 	
      00A288 A6 0F 59 25 03           5 	.ascii "ADCON"
      00A28D 4A 20                    6 	.word power_adc 
      002611                       6377 kword_dict:
      002611                       6378 	_dict_entry,3+F_IFUNC,ABS,abs
      00A28F FA 5F                    1 	.word LINK 
                           002613     2 	LINK=.
      002613                          3 ABS:
      00A291 97                       4 	.byte 3+F_IFUNC 	
      00A292 A6 04 81                 5 	.ascii "ABS"
      00A295 1F BF                    6 	.word abs 
                                   6379 	
                                   6380 
      002680                       6381 	.bndry 128 ; align on FLASH block.
                                   6382 ; free space for user application  
      002680                       6383 user_space:
                                   6384 ; USR() function test
      00A295 CD               [ 2] 6385 	pushw x 
      00A296 92 88 A1 01      [ 1] 6386 	bset PC_ODR,#5 
      00A29A 27               [ 2] 6387 	popw x 
      00A29B 03 CC 88         [ 4] 6388 	call pause02 
      00A29E 09 CD 90 6D      [ 1] 6389 	bres PC_ODR,#5 
      00A2A2 9F               [ 4] 6390 	ret
                                   6391 
                                   6392 	.area FLASH_DRIVE (ABS)
      010000                       6393 	.org 0x10000
      010000                       6394 fdrive:
                                   6395 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002613 R   |   5 ADCON      002609 R
  5 ADCREAD    0025FD R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
    AFR7_BEE=  000007     |   5 AND        0025F5 R   |     ARG_CNT =  000001 
    ARG_OFS =  000002     |   5 ASC        0025ED R   |     ATTRIB  =  000002 
  5 AUTORUN    0025E1 R   |     AUTORUN_=  004000     |   5 AWU        0025D9 R
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
    BINARY  =  000001     |   5 BIT        0025D1 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  000005     |   5 BREAK      0025C7 R
  5 BRES       0025BE R   |   5 BSET       0025B5 R   |     BSIZE   =  000001 
    BSP     =  000008     |   5 BTEST      0025AB R   |   5 BTOGL      0025A1 R
    BTW     =  000001     |     BUFIDX  =  000003     |   5 BYE        002599 R
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
  5 CHAR       002590 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
    CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0     |     CLK_ICKR=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
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
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        002588 R
  5 CRL        002580 R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
    DBG_Y   =  000001     |   5 DDR        002578 R   |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   5 DEC        002570 R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        002568 R   |     DIVIDND =  000007     |     DIVISR  =  000005 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   5 DO         002561 R
  5 DREAD      002557 R   |     DSTACK_S=  000020     |   5 DWRITE     00254C R
  5 EEPROM     002541 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |     EOF     =  0000FF     |     ERR_BAD_=  00000A 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_L=  000005 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |   5 FCPU       002538 R   |     FF      =  00000C 
    FHSE    =  7A1200     |     FHSI    =  F42400     |     FIRST   =  000001 
    FLASH_BA=  008000     |     FLASH_CR=  00505A     |     FLASH_CR=  000002 
    FLASH_CR=  000000     |     FLASH_CR=  000003     |     FLASH_CR=  000001 
    FLASH_CR=  00505B     |     FLASH_CR=  000005     |     FLASH_CR=  000004 
    FLASH_CR=  000007     |     FLASH_CR=  000000     |     FLASH_CR=  000006 
    FLASH_DU=  005064     |     FLASH_DU=  0000AE     |     FLASH_DU=  000056 
    FLASH_EN=  027FFF     |     FLASH_FP=  00505D     |     FLASH_FP=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
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
    FLOOP   =  000002     |     FLSI    =  01F400     |   5 FOR        002530 R
  5 FORGET     002525 R   |     FRUN    =  000000     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FTRAP   =  000001     |     F_CFUNC =  000080 
    F_CMD   =  000000     |     F_CONST =  0000C0     |     F_IFUNC =  000040 
  5 GOSUB      00251B R   |   5 GOTO       002512 R   |   5 GPIO       002509 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   5 HEX        002501 R   |     HSECNT  =  004809 
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
  5 IDR        0024F9 R   |   5 IF         0024F2 R   |     IN      =  000007 
    INCR    =  000001     |     INP     =  000000     |   5 INPUT      0024E8 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008030     |     INT_VECT=  008038     |     INT_VECT=  008034 
    INT_VECT=  008040     |     INT_VECT=  00803C     |     INT_VECT=  008048 
    INT_VECT=  008044     |     INT_VECT=  008064     |     INT_VECT=  008008 
    INT_VECT=  008004     |     INT_VECT=  008050     |     INT_VECT=  00804C 
    INT_VECT=  00805C     |     INT_VECT=  008058     |   5 INVERT     0024DD R
    INW     =  000003     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
  5 IWDGEN     0024D2 R   |   5 IWDGREF    0024C6 R   |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        0024BE R
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  5 LET        0024B6 R   |     LINENO  =  000005     |   5 LINK    =  002613 R
  5 LIST       0024AD R   |     LL      =  000002     |     LLEN    =  000002 
    LL_HB   =  000001     |     LNO     =  000005     |     LN_PTR  =  000005 
  5 LOAD       0024A4 R   |   5 LOG        00249C R   |   5 LSHIFT     002491 R
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MINOR   =  000000     |     MULOP   =  000005     |     N1      =  000001 
    N1_HB   =  000006     |     N1_LB   =  000007     |     N2      =  000003 
    N2_HB   =  000008     |     N2_LB   =  000009     |     NAFR    =  004804 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        002480 R   |   5 NEXT       002488 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NL      =  00000A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   5 NOT        002478 R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000009 R   |   5 ODR        002470 R   |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   5 OR         002469 R   |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |     PAD_SIZE=  000028     |   5 PAUSE      00245F R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       00244C R   |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]

Symbol Table

    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   5 PINP       002443 R   |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  5 PMODE      002455 R   |   5 POKE       00243A R   |   5 POUT       002431 R
    PREV    =  000001     |   5 PRINT      002427 R   |     PROD    =  000002 
  5 PRTA       00241E R   |   5 PRTB       002415 R   |   5 PRTC       00240C R
  5 PRTD       002403 R   |   5 PRTE       0023FA R   |   5 PRTF       0023F1 R
  5 PRTG       0023E8 R   |   5 PRTH       0023DF R   |   5 PRTI       0023D6 R
    PSIZE   =  000001     |   5 QKEY       0023CD R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 REBOOT     0023C2 R
  5 REG_A      000991 R   |   5 REG_CC     000995 R   |   5 REG_EPC    000984 R
  5 REG_SP     00099A R   |   5 REG_X      00098D R   |   5 REG_Y      000989 R
    RELOP   =  000005     |   5 REMARK     0023B7 R   |     RETL1   =  000001 
  5 RETURN     0023AC R   |     RET_ADDR=  000003     |     RET_INW =  000005 
  5 RND        0023A4 R   |     ROP     =  004800     |   5 RSHIFT     002399 R
    RST_SR  =  0050B3     |   5 RUN        002391 R   |     RXCHAR  =  000001 
    R_A     =  000007     |     R_CC    =  000008     |     R_X     =  000005 
    R_Y     =  000003     |   5 SAVE       002388 R   |     SDIVD   =  000002 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       00237F R   |     SIGN    =  000001     |   5 SIZE       002376 R
    SKIP    =  000006     |   5 SLEEP      00236C R   |     SPACE   =  000020 
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SQUOT   =  000001 
    SRC     =  000003     |     STACK_EM=  0017FF     |     STACK_SI=  000080 
  5 STATES     000947 R   |   5 STEP       002363 R   |   5 STOP       00235A R
    SWIM_CSR=  007F80     |     TAB     =  000009     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      002350 R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_CNT=  00525E     |     TIM1_CNT=  00525F     |     TIM1_CR1=  005250 
    TIM1_CR2=  005251     |     TIM1_CR2=  000000     |     TIM1_CR2=  000002 
    TIM1_CR2=  000004     |     TIM1_CR2=  000005     |     TIM1_CR2=  000006 
    TIM1_DTR=  00526E     |     TIM1_EGR=  005257     |     TIM1_EGR=  000007 
    TIM1_EGR=  000001     |     TIM1_EGR=  000002     |     TIM1_EGR=  000003 
    TIM1_EGR=  000004     |     TIM1_EGR=  000005     |     TIM1_EGR=  000006 
    TIM1_EGR=  000000     |     TIM1_ETR=  005253     |     TIM1_ETR=  000006 
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
    TIM2_CCE=  000000     |     TIM2_CCE=  000001     |     TIM2_CCE=  000004 
    TIM2_CCE=  000005     |     TIM2_CCE=  005309     |     TIM2_CCM=  005305 
    TIM2_CCM=  005306     |     TIM2_CCM=  005307     |     TIM2_CCM=  000000 
    TIM2_CCM=  000004     |     TIM2_CCM=  000003     |     TIM2_CCR=  00530F 
    TIM2_CCR=  005310     |     TIM2_CCR=  005311     |     TIM2_CCR=  005312 
    TIM2_CCR=  005313     |     TIM2_CCR=  005314     |     TIM2_CLK=  00F424 
    TIM2_CNT=  00530A     |     TIM2_CNT=  00530B     |     TIM2_CR1=  005300 
    TIM2_CR1=  000007     |     TIM2_CR1=  000000     |     TIM2_CR1=  000003 
    TIM2_CR1=  000001     |     TIM2_CR1=  000002     |     TIM2_EGR=  005304 
    TIM2_EGR=  000001     |     TIM2_EGR=  000002     |     TIM2_EGR=  000003 
    TIM2_EGR=  000006     |     TIM2_EGR=  000000     |     TIM2_IER=  005301 
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
  5 TIMEOUT    00233A R   |   5 TIMER      002346 R   |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_ARRAY=  000002     |     TK_CFUNC=  000008 
    TK_CHAR =  000003     |     TK_CMD  =  000006     |     TK_COLON=  000001 
    TK_COMMA=  00000D     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_IFUNC=  000007     |     TK_INTGR=  000004 
    TK_LE   =  000036     |     TK_LPARE=  00000B     |     TK_LT   =  000034 
    TK_MINUS=  000011     |     TK_MOD  =  000022     |     TK_MULT =  000020 
    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_PLUS =  000010 
    TK_QSTR =  00000A     |     TK_RPARE=  00000C     |     TK_SHARP=  00000E 
    TK_VAR  =  000005     |   5 TO         002333 R   |   5 TONE       00232A R
  5 Timer4Up   00003E R   |   5 TrapHand   00002F R   |     U8      =  000003 
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
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     00231F R
  5 UBTN_Han   000081 R   |   5 UFLASH     002314 R   |   5 UNTIL      00230A R
  5 USER_ABO   000089 R   |     USE_BLOC=  000000     |   5 USR        002302 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 Uart1RxH   000018 R   |   5 UserButt   000054 R   |     VSIZ    =  000002 
    VSIZE   =  000002     |     VT      =  00000B     |   5 WAIT       0022F9 R
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH   =  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   5 WORDS      0022EF R
  5 WRITE      0022E5 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XADR    =  000001     |     XMASK   =  000001     |   5 XOR        0022DD R
  5 XPEEK      0022D3 R   |     XSAVE   =  000003     |     YSAVE   =  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

  5 abs        001FBF R   |   1 acc16      000008 R   |   1 acc24      000007 R
  1 acc8       000009 R   |   5 accept_c   000B3B R   |   5 add        0010A5 R
  5 analog_r   001A6D R   |   5 ansi_seq   000AFD R   |   5 arduino_   0020CA R
  5 arg_list   0011E4 R   |   1 array_si   00001F R   |   5 ascii      001E7E R
  5 at_tst     000E08 R   |   5 atoi24     000F1B R   |   5 atoi_exi   000F89 R
  5 autorun    001F11 R   |   5 autorun_   000656 R   |   5 awu        001F70 R
  5 awu02      001F7A R   |   5 bad_port   001EDF R   |   1 base       000006 R
  1 basicptr   000004 R   |   5 bin_exit   000D0C R   |   5 bit_and    001FD5 R
  5 bit_or     001FF3 R   |   5 bit_rese   00176F R   |   5 bit_set    00175B R
  5 bit_test   001798 R   |   5 bit_togg   001784 R   |   5 bit_xor    002011 R
  5 bitmask    002215 R   |   5 bkslsh_t   000DB3 R   |   5 bksp       0001E8 R
  5 break      001B14 R   |   5 break_po   001B42 R   |   5 bye        001F08 R
  5 char       001E6A R   |   5 check_fu   00040B R   |   5 clear_ba   00066B R
  5 clear_va   000515 R   |   5 clock_in   0000A4 R   |   5 cmd_itf    000B5F R
  5 cmd_line   0007FB R   |   5 cmd_name   001150 R   |   5 cmp_name   001BB6 R
  5 cold_sta   00057A R   |   5 colon_ts   000DDC R   |   5 comma_ts   000DE7 R
  5 compile    00041A R   |   5 const_cr   0022B3 R   |   5 const_cr   0022B9 R
  5 const_dd   0022AD R   |   5 const_ee   0022CB R   |   5 const_id   0022A7 R
  5 const_in   0022C5 R   |   5 const_od   0022A1 R   |   5 const_ou   0022BF R
  5 const_po   00226B R   |   5 const_po   002271 R   |   5 const_po   002277 R
  5 const_po   00227D R   |   5 const_po   002283 R   |   5 const_po   002289 R
  5 const_po   00228F R   |   5 const_po   002295 R   |   5 const_po   00229B R
  5 convert_   000C94 R   |   1 count      000003 R   |   5 cp_loop    001193 R
  5 create_g   00036A R   |   5 cstk_pro   00106E R   |   5 dash_tst   000DFD R
  5 ddrop      001014 R   |   5 ddrop_n    001031 R   |   5 ddup       00101D R
  5 dec_base   001394 R   |   5 del_back   000B2C R   |   5 del_line   000332 R
  5 del_ln     000B1D R   |   5 delete     0001F8 R   |   5 digital_   001AA3 R
  5 digital_   001AD5 R   |   5 dir_loop   001DA9 R   |   5 director   001D9D R
  5 divide     0010FB R   |   5 divu24_8   000A8A R   |   5 do_loop    002242 R
  5 dotr       001078 R   |   5 dotr_loo   00108D R   |   5 dots       001044 R
  5 dpick      00101D R   |   5 dpop       000FED R   |   5 dpush      000FE0 R
  5 drive_fr   001E26 R   |   3 dstack     001760 R   |   3 dstack_e   001780 R
  5 dstk_pro   00103A R   |   1 dstkptr    000018 R   |   5 dswap      000FFA R
  5 enable_i   0021BB R   |   5 eql_tst    000E68 R   |   5 equal      001621 R
  5 err_bad_   000748 R   |   5 err_cmd_   000709 R   |   5 err_div0   0006CB R
  5 err_dupl   000724 R   |   5 err_math   0006B1 R   |   5 err_mem_   000694 R
  5 err_msg    00067C R   |   5 err_no_a   000755 R   |   5 err_no_l   0006DB R
  5 err_not_   000736 R   |   5 err_run_   0006F2 R   |   5 err_synt   0006A2 R
  5 escaped    000CA9 R   |   5 expect     0011D7 R   |   5 expr_exi   001325 R
  5 expressi   0012E4 R   |   5 factor     00123F R   |   1 farptr     000012 R
  5 fcpu       002069 R   |   7 fdrive     010000 R   |   5 fetch      00101D R
  5 fetchc     000C4C R   |   1 ffree      000015 R   |   5 file_cou   001E1E R
  5 final_te   000AF7 R   |   5 first_li   001418 R   |   1 flags      000021 R
  5 for        00181D R   |   5 forget     001D52 R   |   1 free_ram   000058 R
  5 func_arg   001208 R   |   5 func_not   0021AC R   |   5 ge         001623 R
  5 get_arra   001218 R   |   5 get_targ   001911 R   |   5 get_tick   001FB9 R
  5 get_toke   000D4E R   |   5 getc       0001D4 R   |   5 gosub      001942 R
  5 goto       001927 R   |   5 gpio       001EB1 R   |   5 gt         00161F R
  5 gt_tst     000E73 R   |   5 hex_base   00138F R   |   5 if         001809 R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
  5 incr_far   001B6B R   |   5 input_ex   001727 R   |   5 input_lo   0016C2 R
  5 input_va   0016B6 R   |   5 insert_l   0003A3 R   |   5 insert_l   000408 R
  5 interp     0007CF R   |   5 interp_l   00080F R   |   5 invalid    000BA4 R
  5 invalid_   000C22 R   |   5 invert     002231 R   |   5 is_alpha   000523 R
  5 is_digit   000F06 R   |   5 itoa       000A43 R   |   5 itoa_loo   000A5B R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

  5 jp_to_ta   001935 R   |   5 key        001E9E R   |   5 kword_di   002611 R
  5 kword_en   0022D1 R   |   5 last_lin   001421 R   |   5 le         001628 R
  5 leading_   002205 R   |   5 ledoff     000897 R   |   5 ledon      000892 R
  5 ledtoggl   00089C R   |   5 left_arr   000AFD R   |   5 left_par   0008A5 R
  5 let        0013C5 R   |   5 let02      0013CF R   |   5 lines_sk   001426 R
  5 list       0013ED R   |   5 list_exi   00146F R   |   5 list_sta   001449 R
  5 load       001D17 R   |   5 load_aut   000632 R   |   5 load_fil   001CE6 R
  5 log2       0021F8 R   |   5 logical_   0021A2 R   |   5 loop_bac   0018EA R
  1 loop_dep   00001E R   |   5 loop_don   0018FF R   |   5 lshift     00202F R
  5 lt         001626 R   |   5 lt_tst     000EAC R   |   5 mem_peek   000BC1 R
  5 modulo     00113F R   |   5 move       0002CC R   |   5 move_dow   0002EA R
  5 move_exi   00030B R   |   5 move_loo   0002EF R   |   5 move_up    0002DC R
  5 mul_char   001610 R   |   5 multiply   0010B3 R   |   5 mulu24_8   000F8D R
  5 nbr_tst    000D89 R   |   5 ne         00162B R   |   5 neg_acc2   000AB2 R
  5 new        001B60 R   |   5 next       0018A2 R   |   5 next_tok   00083D R
  5 no_match   0011A5 R   |   5 none       000D4E R   |   5 number     000C52 GR
  5 other      000EE4 R   |   3 pad        001738 R   |   5 parse_bi   000CEC R
  5 parse_in   000CB1 R   |   5 parse_ke   000D14 R   |   5 parse_qu   000C59 R
  5 pause      001F5D R   |   5 pause02    001F67 R   |   5 peek       0017D6 R
  5 peek_byt   000BEC R   |   5 pin_mode   002075 R   |   5 plus_tst   000E3C R
  5 poke       0017C3 R   |   5 power_ad   001A20 R   |   5 prcnt_ts   000E5D R
  5 print      00162E R   |   5 print_ex   00168A R   |   5 print_fa   000C31 R
  5 print_in   0009E7 R   |   5 print_re   0008F4 R   |   5 print_st   000BB4 R
  5 prt_basi   0014C2 R   |   5 prt_cmd_   001472 R   |   5 prt_loop   001632 R
  5 prt_peek   00027C R   |   5 prt_quot   001486 R   |   5 prt_reg1   0008D5 R
  5 prt_reg8   0008B0 R   |   5 prt_regs   000212 R   |   5 prti24     00099F R
  1 ptr16      000013 R   |   1 ptr8       000014 R   |   5 putc       0001CB R
  5 puts       0001DE R   |   5 qkey       001EA6 R   |   5 qmark_ts   000E13 R
  5 random     0020EA R   |   5 readln     000AD5 R   |   5 readln_l   000ADB R
  5 readln_q   000B50 R   |   5 refresh_   0021F3 R   |   5 regs_sta   000255 R
  5 rel_exit   00137C R   |   5 relation   001328 R   |   5 relop_st   001613 R
  5 rem        00172A R   |   5 repl       000B6D R   |   5 repl_exi   000B95 R
  5 reprint    000AFD R   |   5 reset_co   001630 R   |   5 rest_con   0016A6 R
  5 return     001962 R   |   5 right_ar   000AFD R   |   5 rparnt_t   000DD1 R
  5 rshift     00204C R   |   5 run        001980 R   |   5 run_it     0019A8 R
  1 rx_char    000023 R   |   5 save       001C22 R   |   5 save_con   001696 R
  5 search_d   001182 R   |   5 search_e   0011D3 R   |   5 search_f   001BD7 R
  5 search_l   00030E R   |   5 search_l   000316 R   |   5 search_n   001186 R
  1 seedx      00000E R   |   1 seedy      000010 R   |   5 seek_fdr   001B79 R
  5 select_p   0020BA R   |   5 set_time   00218E R   |   5 sharp_ts   000DF2 R
  5 show       00137F R   |   5 single_c   00160C R   |   5 size       001399 R
  5 skip       000FC7 R   |   5 slash_ts   000E52 R   |   5 sleep      001F52 R
  5 software   000534 R   |   5 spaces     000206 R   |   3 stack_fu   001780 R
  3 stack_un   001800 R   |   5 star_tst   000E47 R   |   5 step       00187A R
  5 stop       0019C3 R   |   5 store      001027 R   |   5 store_lo   00188F R
  5 str_matc   0011B4 R   |   5 str_tst    000D78 R   |   5 strcmp     0002AD R
  5 strcpy     0002BE R   |   5 strlen     0002A0 R   |   5 substrac   0010AD R
  5 syntax_e   000789 R   |   1 tab_widt   000022 R   |   5 tb_error   00078B R
  5 term       001297 R   |   5 term01     0012A0 R   |   5 term_exi   0012E1 R
  5 test_p     000BAC R   |   3 tib        0016E8 R   |   5 tick_tst   000E2A R
  1 ticks      00000A R   |   5 timeout    00219F R   |   1 timer      00000C R
  5 timer2_i   0000BA R   |   5 timer4_i   0000C7 R   |   5 to         001847 R
  5 to_upper   000F0F GR  |   5 token_ch   000EF3 R   |   5 token_ex   000F03 R
  5 tone       0019D2 R   |   1 txtbgn     00001A R   |   1 txtend     00001C R
  5 uart1_in   000190 R   |   5 uart1_se   0001A0 R   |   5 ubound     0013A3 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

  5 uflash     001EE4 R   |   5 unget_to   000FDA R   |   5 unlock_e   0000DC R
  5 unlock_f   0000EA R   |   5 until      002249 R   |   5 user_int   000067 R
  5 user_spa   002680 R   |   5 usr        001EEA R   |   1 vars       000024 R
  5 wait       001730 R   |   5 warm_ini   000615 R   |   5 warm_sta   0007CC R
  5 words      002154 R   |   5 write      001E33 R   |   5 write_bl   00016D R
  5 write_by   0000F8 R   |   5 write_ee   000134 R   |   5 write_ex   000168 R
  5 write_fl   00011E R   |   5 xpeek      0017E9 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     58   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    118   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   268E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

