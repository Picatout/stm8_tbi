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
                           000002    53 	FLOOP=2 ; FOR loop in preparation 
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
      00001D                         78 txtbgn: .blkw 1 ; tokenized BASIC text beginning address 
      00001F                         79 txtend: .blkw 1 ; tokenized BASIC text end address 
      000020                         80 loop_depth: .blkb 1 ; FOR loop depth, level of nested loop. Conformity check   
      000022                         81 array_size: .blkw 1 ; array size 
      000023                         82 flags: .blkb 1 ; various boolean flags
      000024                         83 tab_width: .blkb 1 ; print colon width (4)
      000025                         84 rx_char: .blkb 1 ; last received character 
      000059                         85 vars: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     86 ; keep as last variable 
      0016C8                         87 free_ram: ; from here RAM free for BASIC text 
                                     88 
                                     89 ;-----------------------------------
                                     90     .area SSEG (ABS)
                                     91 ;-----------------------------------	
      0016C8                         92     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE-DSTACK_SIZE 
      001718                         93 tib: .ds TIB_SIZE             ; transaction input buffer
      001740                         94 pad: .ds PAD_SIZE             ; working buffer
      001780                         95 dstack: .ds DSTACK_SIZE 	  ; data stack used by FOR...NEXT 
      001780                         96 dstack_empty: ; dstack underflow ; data stack bottom 
      001800                         97 stack_full: .ds STACK_SIZE   ; control stack 
      001800                         98 stack_unf: ; stack underflow ; control_stack bottom 
                                     99 
                                    100 
                                    101 ;--------------------------------------
                                    102     .area HOME 
                                    103 ;--------------------------------------
      008000 82 00 85 FA            104     int cold_start
                           000001   105 .if DEBUG
      008004 82 00 80 AF            106 	int TrapHandler 		;TRAP  software interrupt
                           000000   107 .else
                                    108 	int NonHandledInterrupt ;TRAP  software interrupt
                                    109 .endif
      008008 82 00 80 89            110 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 8A            111 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 89            112 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 89            113 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 89            114 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 89            115 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 89            116 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 D4            117 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 89            118 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 89            119 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 89            120 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 89            121 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008038 82 00 80 89            122 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 89            123 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 89            124 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 89            125 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 89            126 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 89            127 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 98            128 	int Uart1RxHandler		;int18 UART1 RX full
      008054 82 00 80 89            129 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 89            130 	int NonHandledInterrupt ;int20 UART1 TX completed
      00805C 82 00 80 89            131 	int NonHandledInterrupt ;int21 UART1 RX full
      008060 82 00 80 89            132 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 BE            133 	int Timer4UpdateHandler	;int23 TIM4 update/overflow used as msec ticks counter
      008068 82 00 80 89            134 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 89            135 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 89            136 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 89            137 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 89            138 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 89            139 	int NonHandledInterrupt ;int29  not used
                                    140 
                                    141 ;---------------------------------------
                                    142     .area CODE
                                    143 ;---------------------------------------
                           000001   144 .if DEBUG
      008080 53 54 4D 38 5F 54 42   145 .asciz "STM8_TBI" ; I like to put module name here.
             49 00
                                    146 .endif 
                                    147 
      008089                        148 NonHandledInterrupt:
      008089 71                     149     .byte 0x71  ; reinitialize MCU
                                    150 
                                    151 ; auto wakeup from halt
      00808A                        152 AWUHandler:
      00808A 72 19 50 F0      [ 1]  153 	bres AWU_CSR,#AWU_CSR_AWUEN
      00808E 55 00 3F 50 F1   [ 1]  154 	mov AWU_APR,0x3F
      008093 72 5F 50 F2      [ 1]  155 	clr AWU_TBR 
      008097 80               [11]  156 	iret
                                    157 
                                    158 ;--------------------------
                                    159 ; UART1 receive character
                                    160 ; CTRL-C (ASCII 3)
                                    161 ; cancel program execution
                                    162 ;--------------------------
      008098                        163 Uart1RxHandler:
      008098 72 0B 52 30 FB   [ 2]  164 	btjf UART1_SR,#UART_SR_RXNE,.
      00809D C6 52 31         [ 1]  165 	ld a,UART1_DR 
      0080A0 A1 03            [ 1]  166 	cp a,#CTRL_C 
      0080A2 26 07            [ 1]  167 	jrne 1$
      0080A4 72 5F 00 24      [ 1]  168 	clr rx_char 
      0080A8 CC 80 E7         [ 2]  169 	jp user_interrupted
      0080AB                        170 1$:
      0080AB C7 00 24         [ 1]  171 	ld rx_char,a 	
      0080AE 80               [11]  172 	iret 
                                    173 
                                    174 ;------------------------------------
                                    175 ; software interrupt handler  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    176 ;------------------------------------
                           000001   177 .if DEBUG 
      0080AF                        178 TrapHandler:
      0080AF 72 12 00 22      [ 1]  179 	bset flags,#FTRAP 
      0080B3 CD 8A 0B         [ 4]  180 	call print_registers
      0080B6 CD 8C 76         [ 4]  181 	call cmd_itf
      0080B9 72 13 00 22      [ 1]  182 	bres flags,#FTRAP 	
      0080BD 80               [11]  183 	iret
                                    184 .endif 
                                    185 
      0080BE                        186 Timer4UpdateHandler:
      0080BE 72 5F 53 42      [ 1]  187 	clr TIM4_SR 
      0080C2 CE 00 0B         [ 2]  188 	ldw x,ticks
      0080C5 5C               [ 2]  189 	incw x
      0080C6 CF 00 0B         [ 2]  190 	ldw ticks,x 
      0080C9 CE 00 0D         [ 2]  191 	ldw x,timer
      0080CC 5D               [ 2]  192 	tnzw x 
      0080CD 27 04            [ 1]  193 	jreq 1$
      0080CF 5A               [ 2]  194 	decw x 
      0080D0 CF 00 0D         [ 2]  195 	ldw timer,x 
      0080D3                        196 1$:	
      0080D3 80               [11]  197 	iret 
                                    198 
                                    199 
                                    200 ;------------------------------------
                                    201 ; Triggered by pressing USER UserButton 
                                    202 ; on NUCLEO card.
                                    203 ;------------------------------------
      0080D4                        204 UserButtonHandler:
                                    205 ; wait button release
      0080D4 5F               [ 1]  206 	clrw x
      0080D5 5A               [ 2]  207 1$: decw x 
      0080D6 26 FD            [ 1]  208 	jrne 1$
      0080D8 72 09 50 15 F8   [ 2]  209 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    210 ; if MCU suspended by SLEEP resume program
      0080DD 72 07 00 22 05   [ 2]  211     btjf flags,#FSLEEP,2$
      0080E2 72 17 00 22      [ 1]  212 	bres flags,#FSLEEP 
      0080E6 80               [11]  213 	iret
      0080E7                        214 2$:	
      0080E7                        215 user_interrupted:
      0080E7 72 00 00 22 02   [ 2]  216     btjt flags,#FRUN,4$
      0080EC 20 13            [ 2]  217 	jra UBTN_Handler_exit 
      0080EE                        218 4$:	; program interrupted by user 
      0080EE 72 11 00 22      [ 1]  219 	bres flags,#FRUN 
      0080F2 AE 81 09         [ 2]  220 	ldw x,#USER_ABORT
      0080F5 CD 82 5E         [ 4]  221 	call puts 
      0080F8 CE 00 05         [ 2]  222 	ldw x,basicptr 
      0080FB C6 00 02         [ 1]  223 	ld a,in 
      0080FE CD 96 07         [ 4]  224 	call prt_basic_line
      008101                        225 UBTN_Handler_exit:
      008101 AE 17 FF         [ 2]  226     ldw x,#STACK_EMPTY 
      008104 94               [ 1]  227     ldw sp,x
      008105 9A               [ 1]  228 	rim 
      008106 CC 88 4C         [ 2]  229 	jp warm_start
                                    230 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      008109 0A 50 72 6F 67 72 61   231 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    232 
                                    233 ;----------------------------------------
                                    234 ; inialize MCU clock 
                                    235 ; input:
                                    236 ;   A 		source  HSI | 1 HSE 
                                    237 ;   XL      CLK_CKDIVR , clock divisor 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;----------------------------------------
      008124                        241 clock_init:	
      008124 C1 50 C3         [ 1]  242 	cp a,CLK_CMSR 
      008127 27 0C            [ 1]  243 	jreq 2$ ; no switching required 
                                    244 ; select clock source 
      008129 72 12 50 C5      [ 1]  245 	bset CLK_SWCR,#CLK_SWCR_SWEN
      00812D C7 50 C4         [ 1]  246 	ld CLK_SWR,a
      008130 C1 50 C3         [ 1]  247 1$:	cp a,CLK_CMSR
      008133 26 FB            [ 1]  248 	jrne 1$
      008135                        249 2$: 	
                                    250 ; HSI and cpu clock divisor 
      008135 9F               [ 1]  251 	ld a,xl 
      008136 C7 50 C6         [ 1]  252 	ld CLK_CKDIVR,a  
      008139 81               [ 4]  253 	ret
                                    254 
                                    255 ;----------------------------------
                                    256 ; TIMER4 used as audio tone output 
                                    257 ; on port D:5.
                                    258 ; channel 1 configured as PWM mode 1 
                                    259 ;-----------------------------------  
                           00F424   260 TIM2_CLK_FREQ=62500
      00813A                        261 timer2_init:
      00813A 72 1A 50 C7      [ 1]  262 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      00813E 35 60 53 05      [ 1]  263  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008142 35 08 53 0C      [ 1]  264 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008146 81               [ 4]  265 	ret 
                                    266 
                                    267 ;---------------------------------
                                    268 ; TIM4 is configured to generate an 
                                    269 ; interrupt every millisecond 
                                    270 ;----------------------------------
      008147                        271 timer4_init:
      008147 72 18 50 C7      [ 1]  272 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00814B 35 07 53 45      [ 1]  273 	mov TIM4_PSCR,#7 ; prescale 128  
      00814F 35 7D 53 46      [ 1]  274 	mov TIM4_ARR,#125 ; set for 1msec.
      008153 35 05 53 40      [ 1]  275 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008157 72 10 53 41      [ 1]  276 	bset TIM4_IER,#TIM4_IER_UIE 
      00815B 81               [ 4]  277 	ret
                                    278 
                                    279 
                                    280 ;----------------------------------
                                    281 ; unlock EEPROM for writing/erasing
                                    282 ; wait endlessly for FLASH_IAPSR_DUL bit.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    283 ; input:
                                    284 ;  none
                                    285 ; output:
                                    286 ;  none 
                                    287 ;----------------------------------
      00815C                        288 unlock_eeprom:
      00815C 35 AE 50 64      [ 1]  289 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008160 35 56 50 64      [ 1]  290     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008164 72 07 50 5F FB   [ 2]  291 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008169 81               [ 4]  292 	ret
                                    293 
                                    294 ;----------------------------------
                                    295 ; unlock FLASH for writing/erasing
                                    296 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    297 ; input:
                                    298 ;  none
                                    299 ; output:
                                    300 ;  none
                                    301 ;----------------------------------
      00816A                        302 unlock_flash:
      00816A 35 56 50 62      [ 1]  303 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00816E 35 AE 50 62      [ 1]  304 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008172 72 03 50 5F FB   [ 2]  305 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008177 81               [ 4]  306 	ret
                                    307 
                           000000   308 	BLOCK_ERASE=0
                                    309 ;----------------------------
                                    310 ; erase block code must be 
                                    311 ;executed from RAM
                                    312 ;-----------------------------
                           000000   313 .if BLOCK_ERASE 
                                    314 ; this code is copied to RAM 
                                    315 erase_start:
                                    316 	clr a 
                                    317     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    318     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    319 	ldf [farptr],a
                                    320     inc farptr+2 
                                    321     ldf [farptr],a
                                    322     inc farptr+2 
                                    323     ldf [farptr],a
                                    324     inc farptr+2 
                                    325     ldf [farptr],a
                                    326 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    327 	ret
                                    328 erase_end:
                                    329 
                                    330 ; copy erase_start in RAM 
                                    331 move_code_in_ram:
                                    332 	ldw x,#erase_end 
                                    333 	subw x,#erase_start
                                    334 	ldw acc16,x 
                                    335 	ldw x,#pad 
                                    336 	ldw y,#erase_start 
                                    337 	call move 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    338 	ret 
                                    339 
                                    340 ;-----------------------------------
                                    341 ; erase flash or EEPROM block 
                                    342 ; a block is 128 bytes 
                                    343 ; input:
                                    344 ;   farptr  address block begin
                                    345 ; output:
                                    346 ;   none
                                    347 ;--------------------------------------
                                    348 erase_block:
                                    349 	ldw x,farptr+1 
                                    350 	pushw x 
                                    351 	call move_code_in_ram 
                                    352 	popw x 
                                    353 	ldw farptr+1,x 
                                    354 	tnz farptr
                                    355 	jrne erase_flash 
                                    356 	ldw x,#FLASH_BASE 
                                    357 	cpw x,farptr+1 
                                    358 	jrpl erase_flash 
                                    359 ; erase eeprom block
                                    360 	call unlock_eeprom 
                                    361 	sim 
                                    362 	call pad   
                                    363 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    364 	rim 
                                    365 	ret 
                                    366 ; erase flash block:
                                    367 erase_flash:
                                    368 	call unlock_flash 
                                    369 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    370 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    371 	clr a 
                                    372 	sim 
                                    373 	call pad 
                                    374     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    375 	rim 
                                    376 	ret 
                                    377 .endif ; BLOCK_ERASE 
                                    378 
                                    379 
                                    380 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    381 ; write a byte to FLASH or EEPROM 
                                    382 ; input:
                                    383 ;    a  		byte to write
                                    384 ;    farptr  	address
                                    385 ;    x          farptr[x]
                                    386 ; output:
                                    387 ;    none
                                    388 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    389 	; variables locales
                           000001   390 	BTW = 1   ; byte to write offset on stack
                           000002   391 	OPT = 2   ; OPTION flag offset on stack
                           000002   392 	VSIZE = 2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008178                        393 write_byte:
      008178 90 89            [ 2]  394 	pushw y
      0000FA                        395 	_vars VSIZE
      00817A 52 02            [ 2]    1     sub sp,#VSIZE 
      00817C 6B 01            [ 1]  396 	ld (BTW,sp),a ; byte to write 
      00817E 0F 02            [ 1]  397 	clr (OPT,sp)  ; OPTION flag
                                    398 ; put addr[15:0] in Y, for bounds check.
      008180 90 CE 00 14      [ 2]  399 	ldw y,farptr+1   ; Y=addr15:0
                                    400 ; check addr[23:16], if <> 0 then it is extened flash memory
      008184 72 5D 00 13      [ 1]  401 	tnz farptr 
      008188 26 14            [ 1]  402 	jrne write_flash
      00818A 90 A3 A7 00      [ 2]  403     cpw y,#user_space
      00818E 24 0E            [ 1]  404     jruge write_flash
      008190 90 A3 40 00      [ 2]  405 	cpw y,#EEPROM_BASE  
      008194 25 52            [ 1]  406     jrult write_exit
      008196 90 A3 48 7F      [ 2]  407 	cpw y,#OPTION_END 
      00819A 22 4C            [ 1]  408 	jrugt write_exit
      00819C 20 16            [ 2]  409 	jra write_eeprom 
                                    410 ; write program memory
      00819E                        411 write_flash:
      00819E CD 81 6A         [ 4]  412 	call unlock_flash 
      0081A1 9B               [ 1]  413 1$:	sim 
      0081A2 7B 01            [ 1]  414 	ld a,(BTW,sp)
      0081A4 92 A7 00 13      [ 4]  415 	ldf ([farptr],x),a ; farptr[x]=A
      0081A8 72 05 50 5F FB   [ 2]  416 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081AD 9A               [ 1]  417     rim 
      0081AE 72 13 50 5F      [ 1]  418     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0081B2 20 34            [ 2]  419     jra write_exit
                                    420 ; write eeprom and option
      0081B4                        421 write_eeprom:
      0081B4 CD 81 5C         [ 4]  422 	call unlock_eeprom
                                    423 	; check for data eeprom or option eeprom
      0081B7 90 A3 48 00      [ 2]  424 	cpw y,#OPTION_BASE
      0081BB 2B 08            [ 1]  425 	jrmi 1$
      0081BD 90 A3 48 80      [ 2]  426 	cpw y,#OPTION_END+1
      0081C1 2A 02            [ 1]  427 	jrpl 1$
      0081C3 03 02            [ 1]  428 	cpl (OPT,sp)
      0081C5                        429 1$: 
      0081C5 0D 02            [ 1]  430     tnz (OPT,sp)
      0081C7 27 08            [ 1]  431     jreq 2$
                                    432 	; pour modifier une option il faut modifier ces 2 bits
      0081C9 72 1E 50 5B      [ 1]  433     bset FLASH_CR2,#FLASH_CR2_OPT
      0081CD 72 1F 50 5C      [ 1]  434     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081D1                        435 2$: 
      0081D1 7B 01            [ 1]  436     ld a,(BTW,sp)
      0081D3 92 A7 00 13      [ 4]  437     ldf ([farptr],x),a
      0081D7 0D 02            [ 1]  438     tnz (OPT,sp)
      0081D9 27 08            [ 1]  439     jreq 3$
      0081DB 5C               [ 2]  440     incw x
      0081DC 7B 01            [ 1]  441     ld a,(BTW,sp)
      0081DE 43               [ 1]  442     cpl a
      0081DF 92 A7 00 13      [ 4]  443     ldf ([farptr],x),a
      0081E3 72 05 50 5F FB   [ 2]  444 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081E8                        445 write_exit:
      000168                        446 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0081E8 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081EA 90 85            [ 2]  447 	popw y
      0081EC 81               [ 4]  448     ret
                                    449 
                                    450 ;--------------------------------------------
                                    451 ; write a data block to eeprom or flash 
                                    452 ; input:
                                    453 ;   Y        source address   
                                    454 ;   X        array index  destination  farptr[x]
                                    455 ;   BSIZE    block size bytes 
                                    456 ;   farptr   write address , byte* 
                                    457 ; output:
                                    458 ;	X 		after last byte written 
                                    459 ;   Y 		after last byte read 
                                    460 ;  farptr   point after block
                                    461 ;---------------------------------------------
      0081ED                        462 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      00016D                        463 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    464 	; local var 
                           000001   465 	XSAVE=1 
                           000002   466 	VSIZE=2 
      00016D                        467 write_block:
      00016D                        468 	_vars VSIZE
      0081ED 52 02            [ 2]    1     sub sp,#VSIZE 
      0081EF 1F 01            [ 2]  469 	ldw (XSAVE,sp),x 
      0081F1 1E 05            [ 2]  470 	ldw x,(BSIZE,sp) 
      0081F3 27 13            [ 1]  471 	jreq 9$
      0081F5 1E 01            [ 2]  472 1$:	ldw x,(XSAVE,sp)
      0081F7 90 F6            [ 1]  473 	ld a,(y)
      0081F9 CD 81 78         [ 4]  474 	call write_byte 
      0081FC 5C               [ 2]  475 	incw x 
      0081FD 90 5C            [ 2]  476 	incw y 
      0081FF 1F 01            [ 2]  477 	ldw (XSAVE,sp),x
      008201 1E 05            [ 2]  478 	ldw x,(BSIZE,sp)
      008203 5A               [ 2]  479 	decw x
      008204 1F 05            [ 2]  480 	ldw (BSIZE,sp),x 
      008206 26 ED            [ 1]  481 	jrne 1$
      008208                        482 9$:
      008208 1E 01            [ 2]  483 	ldw x,(XSAVE,sp)
      00820A CD 9C AF         [ 4]  484 	call incr_farptr
      00018D                        485 	_drop VSIZE
      00820D 5B 02            [ 2]    1     addw sp,#VSIZE 
      00820F 81               [ 4]  486 	ret 
                                    487 
                                    488 
                                    489 ;---------------------------------------------
                                    490 ;   UART1 subroutines
                                    491 ;---------------------------------------------
                                    492 
                                    493 ;---------------------------------------------
                                    494 ; initialize UART1, 115200 8N1
                                    495 ; input:
                                    496 ;	none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    497 ; output:
                                    498 ;   none
                                    499 ;---------------------------------------------
      008210                        500 uart1_init:
      008210 72 1A 50 02      [ 1]  501     bset PA_DDR,#UART1_TX_PIN
      008214 72 1A 50 03      [ 1]  502     bset PA_CR1,#UART1_TX_PIN 
      008218 72 1A 50 04      [ 1]  503     bset PA_CR2,#UART1_TX_PIN 
                                    504 ; enable UART1 clock
      00821C 72 14 50 C7      [ 1]  505 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008220                        506 uart1_set_baud: 
                                    507 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    508 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008220 A6 E1            [ 1]  509 	ld a,#CLK_SWR_HSI
      008222 C1 50 C3         [ 1]  510 	cp a,CLK_CMSR 
      008225 27 0A            [ 1]  511 	jreq 2$ 
      008227                        512 1$: ; 8 Mhz 	
      008227 35 05 52 33      [ 1]  513 	mov UART1_BRR2,#0x05 ; must be loaded first
      00822B 35 04 52 32      [ 1]  514 	mov UART1_BRR1,#0x4
      00822F 20 08            [ 2]  515 	jra 3$
      008231                        516 2$: ; 16 Mhz 	
      008231 35 0B 52 33      [ 1]  517 	mov UART1_BRR2,#0x0b ; must be loaded first
      008235 35 08 52 32      [ 1]  518 	mov UART1_BRR1,#0x08
      008239                        519 3$:
      008239 72 5F 52 31      [ 1]  520     clr UART1_DR
      00823D 35 2C 52 35      [ 1]  521 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008241 72 10 52 35      [ 1]  522 	bset UART1_CR2,#UART_CR2_SBK
      008245 72 0D 52 30 FB   [ 2]  523     btjf UART1_SR,#UART_SR_TC,.
      00824A 81               [ 4]  524     ret
                                    525 
                                    526 ;---------------------------------
                                    527 ; send character to UART1 
                                    528 ; input:
                                    529 ;   A 
                                    530 ; output:
                                    531 ;   none 
                                    532 ;--------------------------------	
      00824B                        533 putc:
      00824B 72 0F 52 30 FB   [ 2]  534 	btjf UART1_SR,#UART_SR_TXE,.
      008250 C7 52 31         [ 1]  535 	ld UART1_DR,a 
      008253 81               [ 4]  536 	ret 
                                    537 
                                    538 ;---------------------------------
                                    539 ; wait character from UART1 
                                    540 ; input:
                                    541 ;   none
                                    542 ; output:
                                    543 ;   A 			char  
                                    544 ;--------------------------------	
      008254                        545 getc:
      008254 C6 00 24         [ 1]  546 	ld a,rx_char 
      008257 27 FB            [ 1]  547 	jreq getc 
      008259 72 5F 00 24      [ 1]  548 	clr rx_char 
      00825D 81               [ 4]  549 	ret 
                                    550 
                                    551 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    552 ; send an ASCIZ string to UART1 
                                    553 ; input: 
                                    554 ;   x 		char * 
                                    555 ; output:
                                    556 ;   none 
                                    557 ;-------------------------------
      00825E                        558 puts:
      00825E F6               [ 1]  559     ld a,(x)
      00825F 27 06            [ 1]  560 	jreq 1$
      008261 CD 82 4B         [ 4]  561 	call putc 
      008264 5C               [ 2]  562 	incw x 
      008265 20 F7            [ 2]  563 	jra puts 
      008267 81               [ 4]  564 1$:	ret 
                                    565 
                                    566 
                                    567 ;---------------------------
                                    568 ; delete character at left 
                                    569 ; of cursor on terminal 
                                    570 ; input:
                                    571 ;   none 
                                    572 ; output:
                                    573 ;	none 
                                    574 ;---------------------------
      008268                        575 bksp:
      008268 A6 08            [ 1]  576 	ld a,#BSP 
      00826A CD 82 4B         [ 4]  577 	call putc 
      00826D A6 20            [ 1]  578 	ld a,#SPACE 
      00826F CD 82 4B         [ 4]  579 	call putc 
      008272 A6 08            [ 1]  580 	ld a,#BSP 
      008274 CD 82 4B         [ 4]  581 	call putc 
      008277 81               [ 4]  582 	ret 
                                    583 ;---------------------------
                                    584 ; delete n character left of cursor 
                                    585 ; at terminal.
                                    586 ; input: 
                                    587 ;   A   	number of characters to delete.
                                    588 ; output:
                                    589 ;    none 
                                    590 ;--------------------------	
      008278                        591 delete:
      008278 88               [ 1]  592 	push a 
      008279 0D 01            [ 1]  593 0$:	tnz (1,sp)
      00827B 27 07            [ 1]  594 	jreq 1$
      00827D CD 82 68         [ 4]  595 	call bksp 
      008280 0A 01            [ 1]  596 	dec (1,sp)
      008282 20 F5            [ 2]  597 	jra 0$
      008284 84               [ 1]  598 1$:	pop a 
      008285 81               [ 4]  599 	ret
                                    600 
                                    601 ;--------------------------
                                    602 ; print n spaces on terminal
                                    603 ; input:
                                    604 ;  X 		number of spaces 
                                    605 ; output:
                                    606 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    607 ;---------------------------
      008286                        608 spaces:
      008286 A6 20            [ 1]  609 	ld a,#SPACE 
      008288 5D               [ 2]  610 1$:	tnzw x
      008289 27 06            [ 1]  611 	jreq 9$
      00828B CD 82 4B         [ 4]  612 	call putc 
      00828E 5A               [ 2]  613 	decw x
      00828F 20 F7            [ 2]  614 	jra 1$
      008291                        615 9$: 
      008291 81               [ 4]  616 	ret 
                                    617 
                           000001   618 .if DEBUG 
                                    619 ;---------------------------------
                                    620 ;; print actual registers states 
                                    621 ;; as pushed on stack 
                                    622 ;; {Y,X,CC,A}
                                    623 ;---------------------------------
      008292                        624 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      000212                        625 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      000212                        626 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      000212                        627 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      000212                        628 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      000212                        629 prt_regs:
      008292 AE 82 D5         [ 2]  630 	ldw x,#regs_state 
      008295 CD 82 5E         [ 4]  631 	call puts
                                    632 ; register PC
      008298 16 01            [ 2]  633 	ldw y,(1,sp)
      00829A AE 8A 9B         [ 2]  634 	ldw x,#REG_EPC 
      00829D CD 89 EC         [ 4]  635 	call prt_reg16 
                                    636 ; register CC 
      0082A0 7B 08            [ 1]  637 	ld a,(R_CC,sp)
      0082A2 AE 8A AC         [ 2]  638 	ldw x,#REG_CC 
      0082A5 CD 89 C7         [ 4]  639 	call prt_reg8 
                                    640 ; register A 
      0082A8 7B 07            [ 1]  641 	ld a,(R_A,sp)
      0082AA AE 8A A8         [ 2]  642 	ldw x,#REG_A 
      0082AD CD 89 C7         [ 4]  643 	call prt_reg8 
                                    644 ; register X 
      0082B0 16 05            [ 2]  645 	ldw y,(R_X,sp)
      0082B2 AE 8A A4         [ 2]  646 	ldw x,#REG_X 
      0082B5 CD 89 EC         [ 4]  647 	call prt_reg16 
                                    648 ; register Y 
      0082B8 16 03            [ 2]  649 	ldw y,(R_Y,sp)
      0082BA AE 8A A0         [ 2]  650 	ldw x,#REG_Y 
      0082BD CD 89 EC         [ 4]  651 	call prt_reg16 
                                    652 ; register SP 
      0082C0 90 96            [ 1]  653 	ldw y,sp
      0082C2 72 A9 00 08      [ 2]  654 	addw y,#6+ARG_OFS  
      0082C6 AE 8A B1         [ 2]  655 	ldw x,#REG_SP
      0082C9 CD 89 EC         [ 4]  656 	call prt_reg16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082CC A6 0D            [ 1]  657 	ld a,#CR 
      0082CE CD 82 4B         [ 4]  658 	call putc
      0082D1 CD 82 4B         [ 4]  659 	call putc   
      0082D4 81               [ 4]  660 	ret 
                                    661 
      0082D5 0A 72 65 67 69 73 74   662 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    663 
                                    664 
                                    665 ;--------------------
                                    666 ; print content at address in hex.
                                    667 ; input:
                                    668 ;   X 	address to peek 
                                    669 ; output:
                                    670 ;	none 
                                    671 ;--------------------	
      0082FC                        672 prt_peek:
      0082FC 89               [ 2]  673 	pushw x 
      0082FD CF 00 09         [ 2]  674 	ldw acc16,x 
      008300 72 5F 00 08      [ 1]  675 	clr acc24 
      008304 5F               [ 1]  676 	clrw x 
      008305 A6 10            [ 1]  677 	ld a,#16 
      008307 CD 8A B6         [ 4]  678 	call prti24 
      00830A A6 3A            [ 1]  679 	ld a,#': 
      00830C CD 82 4B         [ 4]  680 	call putc 
      00830F A6 20            [ 1]  681 	ld a,#SPACE 
      008311 CD 82 4B         [ 4]  682 	call putc 
      008314 85               [ 2]  683 	popw x 
      008315 F6               [ 1]  684 	ld a,(x)
      008316 C7 00 0A         [ 1]  685 	ld acc8,a 
      008319 5F               [ 1]  686 	clrw x 
      00831A A6 10            [ 1]  687 	ld a,#16 
      00831C CD 8A B6         [ 4]  688 	call prti24
      00831F 81               [ 4]  689 	ret 
                                    690 .endif ; DEBUG  
                                    691 
                                    692 ;-------------------------------------
                                    693 ; retrun string length
                                    694 ; input:
                                    695 ;   X         .asciz  
                                    696 ; output:
                                    697 ;   X         length 
                                    698 ;-------------------------------------
      008320                        699 strlen:
      008320 90 93            [ 1]  700 	ldw y,x 
      008322 5F               [ 1]  701 	clrw x 
      008323 90 7D            [ 1]  702 1$:	tnz (y) 
      008325 27 05            [ 1]  703 	jreq 9$ 
      008327 5C               [ 2]  704 	incw x
      008328 90 5C            [ 2]  705 	incw y 
      00832A 20 F7            [ 2]  706 	jra 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00832C 81               [ 4]  707 9$: ret 
                                    708 
                                    709 ;------------------------------------
                                    710 ; compare 2 strings
                                    711 ; input:
                                    712 ;   X 		char* first string 
                                    713 ;   Y       char* second string 
                                    714 ; output:
                                    715 ;   A 		0|1 
                                    716 ;-------------------------------------
      00832D                        717 strcmp:
      00832D F6               [ 1]  718 	ld a,(x)
      00832E 27 0B            [ 1]  719 	jreq 5$ 
      008330 90 F1            [ 1]  720 	cp a,(y) 
      008332 26 05            [ 1]  721 	jrne 4$ 
      008334 5C               [ 2]  722 	incw x 
      008335 90 5C            [ 2]  723 	incw y 
      008337 20 F4            [ 2]  724 	jra strcmp 
      008339                        725 4$: ; not same  
      008339 4F               [ 1]  726 	clr a 
      00833A 81               [ 4]  727 	ret 
      00833B                        728 5$: ; same 
      00833B A6 01            [ 1]  729 	ld a,#1 
      00833D 81               [ 4]  730 	ret 
                                    731 
                                    732 
                                    733 ;---------------------------------------
                                    734 ;  copy src to dest 
                                    735 ; input:
                                    736 ;   X 		dest 
                                    737 ;   Y 		src 
                                    738 ; output: 
                                    739 ;   X 		dest 
                                    740 ;----------------------------------
      00833E                        741 strcpy:
      00833E 89               [ 2]  742 	pushw x 
      00833F 90 F6            [ 1]  743 1$: ld a,(y)
      008341 27 06            [ 1]  744 	jreq 9$ 
      008343 F7               [ 1]  745 	ld (x),a 
      008344 5C               [ 2]  746 	incw x 
      008345 90 5C            [ 2]  747 	incw y 
      008347 20 F6            [ 2]  748 	jra 1$ 
      008349 7F               [ 1]  749 9$:	clr (x)
      00834A 85               [ 2]  750 	popw x 
      00834B 81               [ 4]  751 	ret 
                                    752 
                                    753 ;---------------------------------------
                                    754 ; move memory block 
                                    755 ; input:
                                    756 ;   X 		destination 
                                    757 ;   Y 	    source 
                                    758 ;   acc16	size 
                                    759 ; output:
                                    760 ;   none 
                                    761 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                           000001   762 	INCR=1 ; increament high byte 
                           000002   763 	LB=2 ; increament low byte 
                           000002   764 	VSIZE=2
      00834C                        765 move:
      0002CC                        766 	_vars VSIZE 
      00834C 52 02            [ 2]    1     sub sp,#VSIZE 
      00834E 0F 01            [ 1]  767 	clr (INCR,sp)
      008350 0F 02            [ 1]  768 	clr (LB,sp)
      008352 90 89            [ 2]  769 	pushw y 
      008354 13 01            [ 2]  770 	cpw x,(1,sp) ; compare DEST to SRC 
      008356 90 85            [ 2]  771 	popw y 
      008358 27 31            [ 1]  772 	jreq move_exit ; x==y 
      00835A 2B 0E            [ 1]  773 	jrmi move_down
      00835C                        774 move_up: ; start from top address with incr=-1
      00835C 72 BB 00 09      [ 2]  775 	addw x,acc16
      008360 72 B9 00 09      [ 2]  776 	addw y,acc16
      008364 03 01            [ 1]  777 	cpl (INCR,sp)
      008366 03 02            [ 1]  778 	cpl (LB,sp)   ; increment = -1 
      008368 20 05            [ 2]  779 	jra move_loop  
      00836A                        780 move_down: ; start from bottom address with incr=1 
      00836A 5A               [ 2]  781     decw x 
      00836B 90 5A            [ 2]  782 	decw y
      00836D 0C 02            [ 1]  783 	inc (LB,sp) ; incr=1 
      00836F                        784 move_loop:	
      00836F C6 00 09         [ 1]  785     ld a, acc16 
      008372 CA 00 0A         [ 1]  786 	or a, acc8
      008375 27 14            [ 1]  787 	jreq move_exit 
      008377 72 FB 01         [ 2]  788 	addw x,(INCR,sp)
      00837A 72 F9 01         [ 2]  789 	addw y,(INCR,sp) 
      00837D 90 F6            [ 1]  790 	ld a,(y)
      00837F F7               [ 1]  791 	ld (x),a 
      008380 89               [ 2]  792 	pushw x 
      008381 CE 00 09         [ 2]  793 	ldw x,acc16 
      008384 5A               [ 2]  794 	decw x 
      008385 CF 00 09         [ 2]  795 	ldw acc16,x 
      008388 85               [ 2]  796 	popw x 
      008389 20 E4            [ 2]  797 	jra move_loop
      00838B                        798 move_exit:
      00030B                        799 	_drop VSIZE
      00838B 5B 02            [ 2]    1     addw sp,#VSIZE 
      00838D 81               [ 4]  800 	ret 	
                                    801 
                                    802 ;-------------------------------------
                                    803 ; search text area for a line with 
                                    804 ; same number as line#  
                                    805 ; input:
                                    806 ;	X 			line# 
                                    807 ; output:
                                    808 ;   X 			addr of line | 0 
                                    809 ;   Y           line#|insert address if not found  
                                    810 ;-------------------------------------
                           000001   811 	LL=1 ; line length 
                           000002   812 	LB=2 ; line length low byte 
                           000002   813 	VSIZE=2 
      00838E                        814 search_lineno:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00030E                        815 	_vars VSIZE
      00838E 52 02            [ 2]    1     sub sp,#VSIZE 
      008390 0F 01            [ 1]  816 	clr (LL,sp)
      008392 90 CE 00 1B      [ 2]  817 	ldw y,txtbgn
      008396                        818 search_ln_loop:
      008396 90 C3 00 1D      [ 2]  819 	cpw y,txtend 
      00839A 2A 10            [ 1]  820 	jrpl 8$
      00839C 90 F3            [ 1]  821 	cpw x,(y)
      00839E 27 0E            [ 1]  822 	jreq 9$
      0083A0 2B 0A            [ 1]  823 	jrmi 8$ 
      0083A2 90 E6 02         [ 1]  824 	ld a,(2,y)
      0083A5 6B 02            [ 1]  825 	ld (LB,sp),a 
      0083A7 72 F9 01         [ 2]  826 	addw y,(LL,sp)
      0083AA 20 EA            [ 2]  827 	jra search_ln_loop 
      0083AC                        828 8$: 
      0083AC 5F               [ 1]  829 	clrw x 	
      0083AD 51               [ 1]  830 	exgw x,y 
      00032E                        831 9$: _drop VSIZE
      0083AE 5B 02            [ 2]    1     addw sp,#VSIZE 
      0083B0 51               [ 1]  832 	exgw x,y   
      0083B1 81               [ 4]  833 	ret 
                                    834 
                                    835 ;-------------------------------------
                                    836 ; delete line at addr
                                    837 ; move new line to insert with end of text 
                                    838 ; otherwise it would be overwritten.
                                    839 ; input:
                                    840 ;   X 		addr of line i.e DEST for move 
                                    841 ;-------------------------------------
                           000001   842 	LLEN=1
                           000003   843 	SRC=3
                           000004   844 	VSIZE=4
      0083B2                        845 del_line: 
      000332                        846 	_vars VSIZE 
      0083B2 52 04            [ 2]    1     sub sp,#VSIZE 
      0083B4 E6 02            [ 1]  847 	ld a,(2,x) ; line length
      0083B6 6B 02            [ 1]  848 	ld (LLEN+1,sp),a 
      0083B8 0F 01            [ 1]  849 	clr (LLEN,sp)
      0083BA 90 93            [ 1]  850 	ldw y,x  
      0083BC 72 F9 01         [ 2]  851 	addw y,(LLEN,sp) ;SRC  
      0083BF 17 03            [ 2]  852 	ldw (SRC,sp),y  ;save source 
      0083C1 90 CE 00 1D      [ 2]  853 	ldw y,txtend 
      0083C5 90 E6 02         [ 1]  854 	ld a,(2,y)
      0083C8 90 5F            [ 1]  855 	clrw y 
      0083CA 90 97            [ 1]  856 	ld yl,a  
      0083CC 72 B9 00 1D      [ 2]  857 	addw y,txtend
      0083D0 72 F2 03         [ 2]  858 	subw y,(SRC,sp) ; y=count 
      0083D3 90 CF 00 09      [ 2]  859 	ldw acc16,y 
      0083D7 16 03            [ 2]  860 	ldw y,(SRC,sp)    ; source
      0083D9 CD 83 4C         [ 4]  861 	call move
      0083DC 90 CE 00 1D      [ 2]  862 	ldw y,txtend 
      0083E0 72 F2 01         [ 2]  863 	subw y,(LLEN,sp)
      0083E3 90 CF 00 1D      [ 2]  864 	ldw txtend,y  
      000367                        865 	_drop VSIZE     
      0083E7 5B 04            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0083E9 81               [ 4]  866 	ret 
                                    867 
                                    868 ;---------------------------------------------
                                    869 ; create a gap in text area 
                                    870 ; move new line to insert in gap with end of text
                                    871 ; otherwise it would be overwritten.
                                    872 ; input:
                                    873 ;    X 			addr gap start 
                                    874 ;    Y 			gap length 
                                    875 ; output:
                                    876 ;    X 			addr gap start 
                                    877 ;--------------------------------------------
                           000001   878 	DEST=1
                           000003   879 	SRC=3
                           000005   880 	LEN=5
                           000006   881 	VSIZE=6 
      0083EA                        882 create_gap:
      00036A                        883 	_vars VSIZE
      0083EA 52 06            [ 2]    1     sub sp,#VSIZE 
      0083EC 1F 03            [ 2]  884 	ldw (SRC,sp),x 
      0083EE 17 05            [ 2]  885 	ldw (LEN,sp),y 
      0083F0 90 CF 00 09      [ 2]  886 	ldw acc16,y 
      0083F4 90 93            [ 1]  887 	ldw y,x ; SRC
      0083F6 72 BB 00 09      [ 2]  888 	addw x,acc16  
      0083FA 1F 01            [ 2]  889 	ldw (DEST,sp),x 
                                    890 ;compute size to move 	
      0083FC CE 00 1D         [ 2]  891 	ldw x,txtend 
      0083FF E6 02            [ 1]  892 	ld a,(2,x) ; pending line length 
      008401 C7 00 0A         [ 1]  893 	ld acc8,a 
      008404 72 5F 00 09      [ 1]  894 	clr acc16 
      008408 72 BB 00 09      [ 2]  895 	addw x,acc16 
      00840C 72 F0 03         [ 2]  896 	subw x,(SRC,sp)
      00840F CF 00 09         [ 2]  897 	ldw acc16,x ; size to move
      008412 1E 01            [ 2]  898 	ldw x,(DEST,sp) 
      008414 CD 83 4C         [ 4]  899 	call move
      008417 CE 00 1D         [ 2]  900 	ldw x,txtend
      00841A 72 FB 05         [ 2]  901 	addw x,(LEN,sp)
      00841D CF 00 1D         [ 2]  902 	ldw txtend,x
      0003A0                        903 9$:	_drop VSIZE 
      008420 5B 06            [ 2]    1     addw sp,#VSIZE 
      008422 81               [ 4]  904 	ret 
                                    905 
                                    906 
                                    907 ;--------------------------------------------
                                    908 ; insert line in tib into text area 
                                    909 ; first search for already existing 
                                    910 ; replace existing 
                                    911 ; if strlen(tib)==0 delete existing 
                                    912 ; input:
                                    913 ;   ptr16 				pointer to tokenized line  
                                    914 ; output:
                                    915 ;   none
                                    916 ;---------------------------------------------
                           000001   917 	DEST=1  ; text area insertion address 
                           000003   918 	SRC=3   ; str to insert address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                           000005   919 	LINENO=5 ; line number 
                           000007   920 	LLEN=7 ; line length 
                           000008   921 	VSIZE=8  
      008423                        922 insert_line:
      0003A3                        923 	_vars VSIZE 
      008423 52 08            [ 2]    1     sub sp,#VSIZE 
      008425 CE 00 14         [ 2]  924 	ldw x,ptr16  
      008428 C3 00 1B         [ 2]  925 	cpw x,txtbgn 
      00842B 26 0D            [ 1]  926 	jrne 0$
                                    927 ;first text line 
      00842D AE 00 02         [ 2]  928 	ldw x,#2 
      008430 72 D6 00 14      [ 4]  929 	ld a,([ptr16],x)
      008434 5F               [ 1]  930 	clrw x 
      008435 97               [ 1]  931 	ld xl,a
      008436 1F 07            [ 2]  932 	ldw (LLEN,sp),x  
      008438 20 45            [ 2]  933 	jra 5$
      00843A 72 CE 00 14      [ 5]  934 0$:	ldw x,[ptr16]
                                    935 ; new line number
      00843E 1F 05            [ 2]  936 	ldw (LINENO,sp),x 
      008440 AE 00 02         [ 2]  937 	ldw x,#2 
      008443 72 D6 00 14      [ 4]  938 	ld a,([ptr16],x)
      008447 97               [ 1]  939 	ld xl,a
                                    940 ; new line length
      008448 1F 07            [ 2]  941 	ldw (LLEN,sp),x
                                    942 ; check if that line number already exit 	
      00844A 1E 05            [ 2]  943 	ldw x,(LINENO,sp)
      00844C CD 83 8E         [ 4]  944 	call search_lineno 
      00844F 5D               [ 2]  945 	tnzw x 
      008450 26 04            [ 1]  946 	jrne 2$
                                    947 ; line doesn't exit
                                    948 ; it will be inserted at this point.  	
      008452 17 01            [ 2]  949 	ldw (DEST,sp),y 
      008454 20 05            [ 2]  950 	jra 3$
                                    951 ; line exit delete it.
                                    952 ; it will be replaced by new one 	
      008456 1F 01            [ 2]  953 2$: ldw (DEST,sp),x 
      008458 CD 83 B2         [ 4]  954 	call del_line
      00845B                        955 3$: 
                                    956 ; insert new line or leave if LLEN==3
                                    957 ; LLEN==3 means empty line 
      00845B A6 03            [ 1]  958 	ld a,#3
      00845D 11 08            [ 1]  959 	cp a,(LLEN+1,sp)
      00845F 27 27            [ 1]  960 	jreq insert_ln_exit ; empty line exit.
                                    961 ; if insertion point at txtend 
                                    962 ; no move required 
      008461 1E 01            [ 2]  963 	ldw x,(DEST,sp)
      008463 C3 00 1D         [ 2]  964 	cpw x,txtend 
      008466 2A 17            [ 1]  965 	jrpl 5$ 
                                    966 ; must create a gap
                                    967 ; at insertion point  
      008468 1E 01            [ 2]  968 	ldw x,(DEST,sp)
      00846A 16 07            [ 2]  969 	ldw y,(LLEN,sp)
      00846C CD 83 EA         [ 4]  970 	call create_gap 
                                    971 ; move new line in gap 
      00846F 1E 07            [ 2]  972 	ldw x,(LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008471 CF 00 09         [ 2]  973 	ldw acc16,x 
      008474 90 CE 00 1D      [ 2]  974 	ldw y,txtend ;SRC 
      008478 1E 01            [ 2]  975 	ldw x,(DEST,sp) ; dest address 
      00847A CD 83 4C         [ 4]  976 	call move 
      00847D 20 09            [ 2]  977 	jra insert_ln_exit  
      00847F                        978 5$: ; no move required 
      00847F 1E 07            [ 2]  979 	ldw x,(LLEN,sp) 
      008481 72 BB 00 1D      [ 2]  980 	addw x,txtend 
      008485 CF 00 1D         [ 2]  981 	ldw txtend,x 
      008488                        982 insert_ln_exit:	
      000408                        983 	_drop VSIZE
      008488 5B 08            [ 2]    1     addw sp,#VSIZE 
      00848A 81               [ 4]  984 	ret
                                    985 
                                    986 
                                    987 ;-----------------------------
                                    988 ; check if text buffer full
                                    989 ; input:
                                    990 ;   ptr16     addr start tokenize line 
                                    991 ;   X         buffer index 
                                    992 ; output:
                                    993 ;   none 
                                    994 ;-----------------------------------
      00848B                        995 check_full:
      00848B 72 BB 00 14      [ 2]  996 	addw x,ptr16 
      00848F A3 16 C8         [ 2]  997 	cpw x,#tib 
      008492 25 05            [ 1]  998 	jrult 1$
      008494 A6 01            [ 1]  999 	ld a,#ERR_MEM_FULL
      008496 CC 88 0B         [ 2] 1000 	jp tb_error 
      008499 81               [ 4] 1001 1$: ret 
                                   1002 
                                   1003 
                                   1004 ;-----------------------------------
                                   1005 ; create token list form text line 
                                   1006 ; save this list in text area
                                   1007 ; input:
                                   1008 ;   none
                                   1009 ; output:
                                   1010 ;   basicptr     token list buffer
                                   1011 ;   line# 		 BASIC line number 
                                   1012 ;   in.w  		 cleared 
                                   1013 ;-----------------------------------
                                   1014 	.macro _incr_ptr16 n 
                                   1015 	ldw x,#n 
                                   1016 	addw x,ptr16 
                                   1017 	ldw ptr16,x 
                                   1018 	.endm 
                                   1019 
                           000001  1020 	XSAVE=1
                           000003  1021 	BUFIDX=3
                           000004  1022 	VSIZE=4
      00849A                       1023 compile:
      00041A                       1024 	_vars VSIZE 
      00849A 52 04            [ 2]    1     sub sp,#VSIZE 
      00849C 72 1A 00 22      [ 1] 1025 	bset flags,#FCOMP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084A0 CE 00 1D         [ 2] 1026 	ldw x,txtend
      0084A3 CF 00 14         [ 2] 1027 	ldw ptr16,x 
      0084A6 5F               [ 1] 1028 	clrw x 
      0084A7 AE 00 03         [ 2] 1029 	ldw x,#3
      0084AA 1F 03            [ 2] 1030 	ldw (BUFIDX,sp),X  
      0084AC CD 84 8B         [ 4] 1031 	call check_full
      0084AF 5F               [ 1] 1032 	clrw x 
      0084B0 72 CF 00 14      [ 5] 1033 	ldw [ptr16],x 
      0084B4 CD 8E 65         [ 4] 1034 	call get_token
      0084B7 1F 01            [ 2] 1035 	ldw (XSAVE,sp),x 
      0084B9 A1 04            [ 1] 1036 	cp a,#TK_INTGR 
      0084BB 26 11            [ 1] 1037 	jrne 3$
      0084BD A3 00 00         [ 2] 1038 	cpw x,#0  
      0084C0 22 03            [ 1] 1039 	jrugt 1$
      0084C2 CC 88 09         [ 2] 1040 	jp syntax_error 
      0084C5 72 CF 00 14      [ 5] 1041 1$:	ldw [ptr16],x; line number
      0084C9 CD 8E 65         [ 4] 1042 2$:	call get_token
      0084CC 1F 01            [ 2] 1043 	ldw (XSAVE,sp),x 
      0084CE A1 00            [ 1] 1044 3$:	cp a,#TK_NONE 
      0084D0 26 03            [ 1] 1045 	jrne 30$
      0084D2 CC 85 65         [ 2] 1046 	jp 9$
      0084D5                       1047 30$: 	 
      0084D5 1E 03            [ 2] 1048 	ldw x,(BUFIDX,sp)
      0084D7 CD 84 8B         [ 4] 1049 	call check_full 
      0084DA 16 03            [ 2] 1050 	ldw y,(BUFIDX,sp) 
      0084DC 91 D7 14         [ 4] 1051 	ld ([ptr16],y),a ; token attribute 
      0084DF 90 5C            [ 2] 1052 	incw y
      0084E1 17 03            [ 2] 1053 	ldw (BUFIDX,sp),y
      0084E3 A1 01            [ 1] 1054 	cp a,#TK_COLON 
      0084E5 26 02            [ 1] 1055 	jrne 31$
      0084E7 20 E0            [ 2] 1056 	jra 2$ 
      0084E9                       1057 31$:
      0084E9 A1 03            [ 1] 1058 	cp a,#TK_CHAR
      0084EB 26 0C            [ 1] 1059 	jrne 32$ 
      0084ED 1E 01            [ 2] 1060 	ldw x,(XSAVE,sp)
      0084EF 9F               [ 1] 1061 	ld a,xl 
      0084F0 91 D7 14         [ 4] 1062 	ld ([ptr16],y),a
      0084F3 90 5C            [ 2] 1063 	incw y 
      0084F5 17 03            [ 2] 1064 	ldw (BUFIDX,sp),y 
      0084F7 20 D0            [ 2] 1065 	jra 2$ 
      0084F9                       1066 32$:
      0084F9 A1 02            [ 1] 1067 	cp a,#TK_ARRAY 
      0084FB 27 CC            [ 1] 1068 	jreq 2$ 
      0084FD A1 0A            [ 1] 1069 	cp a,#TK_QSTR 
      0084FF 26 25            [ 1] 1070 	jrne 4$
      008501 AE 17 18         [ 2] 1071 	ldw x,#pad 
      008504 CD 83 20         [ 4] 1072 	call strlen
      008507 5C               [ 2] 1073 	incw x  
      008508 CD 84 8B         [ 4] 1074 	call check_full 
      00850B 90 AE 17 18      [ 2] 1075 	ldw y,#pad 
      00850F CE 00 14         [ 2] 1076 	ldw x,ptr16
      008512 72 FB 03         [ 2] 1077 	addw x,(BUFIDX,sp)	
      008515 CD 83 3E         [ 4] 1078 	call strcpy 
      008518 AE 17 18         [ 2] 1079 	ldw x,#pad 
      00851B CD 83 20         [ 4] 1080 	call strlen 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00851E 5C               [ 2] 1081 	incw x
      00851F 72 FB 03         [ 2] 1082 	addw x,(BUFIDX,sp) 
      008522 1F 03            [ 2] 1083 	ldw (BUFIDX,sp),x
      008524 20 A3            [ 2] 1084 	jra 2$  
      008526 A1 04            [ 1] 1085 4$: cp a,#TK_INTGR
      008528 25 9F            [ 1] 1086 	jrult 2$
      00852A A1 09            [ 1] 1087 	cp a,#TK_CONST 
      00852C 22 9B            [ 1] 1088 	Jrugt 2$
      00852E 1E 01            [ 2] 1089 	ldw x,(XSAVE,sp) 
      008530 16 03            [ 2] 1090 	ldw y,(BUFIDX,sp)
      008532 91 DF 14         [ 5] 1091 	ldw ([ptr16],y),x
      008535 A3 98 6F         [ 2] 1092 	cpw x,#rem 
      008538 26 22            [ 1] 1093 	jrne 5$	
                                   1094 ; comment advance in.w to eol 
      00853A 72 A9 00 02      [ 2] 1095 	addw y,#2 ; skip exec address 
      00853E 17 03            [ 2] 1096 	ldw (BUFIDX,sp),y 
      008540 CE 00 14         [ 2] 1097 	ldw x,ptr16 
      008543 72 FB 03         [ 2] 1098 	addw x,(BUFIDX,sp)
      008546 90 CE 00 01      [ 2] 1099 	ldw y,in.w 
      00854A 72 A9 16 C8      [ 2] 1100 	addw y,#tib 
      00854E CD 83 3E         [ 4] 1101 	call strcpy 	
      008551 CD 83 20         [ 4] 1102 	call strlen 
      008554 5C               [ 2] 1103 	incw x ; skip string 0. 
      008555 72 FB 03         [ 2] 1104 	addw x,(BUFIDX,sp)
      008558 1F 03            [ 2] 1105 	ldw (BUFIDX,sp),x 
      00855A 20 09            [ 2] 1106 	jra 9$
      00855C 72 A9 00 02      [ 2] 1107 5$:	addw y,#2 
      008560 17 03            [ 2] 1108 	ldw (BUFIDX,sp),y 
      008562 CC 84 C9         [ 2] 1109 	jp 2$
      008565                       1110 9$: 
      008565 AE 00 02         [ 2] 1111 	ldw x,#2
      008568 16 03            [ 2] 1112 	ldw y,(BUFIDX,sp)
      00856A 90 9F            [ 1] 1113 	ld a,yl 
      00856C 72 D7 00 14      [ 4] 1114 	ld ([ptr16],x),a  	
      008570 72 CE 00 14      [ 5] 1115 	ldw x,[ptr16]
      008574 27 09            [ 1] 1116 	jreq 10$
      008576 CD 84 23         [ 4] 1117 	call insert_line
      008579 72 5F 00 04      [ 1] 1118 	clr  count 
      00857D 20 0F            [ 2] 1119 	jra  11$ 
      00857F                       1120 10$: 
      00857F CE 00 14         [ 2] 1121 	ldw x,ptr16 
      008582 CF 00 05         [ 2] 1122 	ldw basicptr,x 
      008585 E6 02            [ 1] 1123 	ld a,(2,x)
      008587 C7 00 04         [ 1] 1124 	ld count,a 
      00858A 35 03 00 02      [ 1] 1125 	mov in,#3 
      00858E                       1126 11$:
      00050E                       1127 	_drop VSIZE 
      00858E 5B 04            [ 2]    1     addw sp,#VSIZE 
      008590 72 1B 00 22      [ 1] 1128 	bres flags,#FCOMP 
      008594 81               [ 4] 1129 	ret 
                                   1130 
                                   1131 
                                   1132 ;------------------------------------
                                   1133 ;  set all variables to zero 
                                   1134 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1135 ;   none 
                                   1136 ; output:
                                   1137 ;	none
                                   1138 ;------------------------------------
      008595                       1139 clear_vars:
      008595 AE 00 25         [ 2] 1140 	ldw x,#vars 
      008598 90 AE 00 34      [ 2] 1141 	ldw y,#2*26 
      00859C 7F               [ 1] 1142 1$:	clr (x)
      00859D 5C               [ 2] 1143 	incw x 
      00859E 90 5A            [ 2] 1144 	decw y 
      0085A0 26 FA            [ 1] 1145 	jrne 1$
      0085A2 81               [ 4] 1146 	ret 
                                   1147 
                                   1148 ;-------------------------------------
                                   1149 ; check if A is a letter 
                                   1150 ; input:
                                   1151 ;   A 			character to test 
                                   1152 ; output:
                                   1153 ;   C flag      1 true, 0 false 
                                   1154 ;-------------------------------------
      0085A3                       1155 is_alpha:
      0085A3 A1 41            [ 1] 1156 	cp a,#'A 
      0085A5 8C               [ 1] 1157 	ccf
      0085A6 24 0B            [ 1] 1158 	jrnc 9$ 
      0085A8 A1 5B            [ 1] 1159 	cp a,#'Z+1 
      0085AA 25 07            [ 1] 1160 	jrc 9$ 
      0085AC A1 61            [ 1] 1161 	cp a,#'a 
      0085AE 8C               [ 1] 1162 	ccf 
      0085AF 24 02            [ 1] 1163 	jrnc 9$
      0085B1 A1 7B            [ 1] 1164 	cp a,#'z+1   
      0085B3 81               [ 4] 1165 9$: ret 	
                                   1166 
                                   1167 ;-------------------------------------
                                   1168 ;  program initialization entry point 
                                   1169 ;-------------------------------------
                           000001  1170 	MAJOR=1
                           000000  1171 	MINOR=0
      0085B4 0A 0A 54 69 6E 79 20  1172 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0085FA                       1173 cold_start:
                                   1174 ;set stack 
      0085FA AE 17 FF         [ 2] 1175 	ldw x,#STACK_EMPTY
      0085FD 94               [ 1] 1176 	ldw sp,x   
                                   1177 ; clear all ram 
      0085FE 7F               [ 1] 1178 0$: clr (x)
      0085FF 5A               [ 2] 1179 	decw x 
      008600 26 FC            [ 1] 1180 	jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1181 ; activate pull up on all inputs 
      008602 A6 FF            [ 1] 1182 	ld a,#255 
      008604 C7 50 03         [ 1] 1183 	ld PA_CR1,a 
      008607 C7 50 08         [ 1] 1184 	ld PB_CR1,a 
      00860A C7 50 0D         [ 1] 1185 	ld PC_CR1,a 
      00860D C7 50 12         [ 1] 1186 	ld PD_CR1,a 
      008610 C7 50 17         [ 1] 1187 	ld PE_CR1,a 
      008613 C7 50 1C         [ 1] 1188 	ld PF_CR1,a 
      008616 C7 50 21         [ 1] 1189 	ld PG_CR1,a 
      008619 C7 50 2B         [ 1] 1190 	ld PI_CR1,a 
                                   1191 ; disable schmitt triggers on Arduino CN4 analog inputs
      00861C 55 00 3F 54 07   [ 1] 1192 	mov ADC_TDRL,0x3f
                                   1193 ; disable peripherals clocks
                                   1194 ;	clr CLK_PCKENR1 
                                   1195 ;	clr CLK_PCKENR2
      008621 72 5F 50 F2      [ 1] 1196 	clr AWU_TBR 
      008625 72 14 50 CA      [ 1] 1197 	bset CLK_PCKENR2,#2 ; enable LSI for beeper
                                   1198 ; select internal clock no divisor: 16 Mhz 	
      008629 A6 E1            [ 1] 1199 	ld a,#CLK_SWR_HSI 
      00862B 5F               [ 1] 1200 	clrw x  
      00862C CD 81 24         [ 4] 1201     call clock_init 
      00862F CD 81 47         [ 4] 1202 	call timer4_init
      008632 CD 81 3A         [ 4] 1203 	call timer2_init
                                   1204 ; UART1 at 115200 BAUD
      008635 CD 82 10         [ 4] 1205 	call uart1_init
                                   1206 ; activate PE_4 (user button interrupt)
      008638 72 18 50 18      [ 1] 1207     bset PE_CR2,#USR_BTN_BIT 
                                   1208 ; display system information
      00863C AE 85 B4         [ 2] 1209 	ldw x,#software 
      00863F CD 82 5E         [ 4] 1210 	call puts 
      008642 A6 01            [ 1] 1211 	ld a,#MAJOR 
      008644 C7 00 0A         [ 1] 1212 	ld acc8,a 
      008647 5F               [ 1] 1213 	clrw x 
      008648 CF 00 08         [ 2] 1214 	ldw acc24,x 
      00864B A6 0A            [ 1] 1215 	ld a,#10 
      00864D CD 8A B6         [ 4] 1216 	call prti24 
      008650 A6 2E            [ 1] 1217 	ld a,#'.
      008652 CD 82 4B         [ 4] 1218 	call putc 
      008655 A6 00            [ 1] 1219 	ld a,#MINOR 
      008657 C7 00 0A         [ 1] 1220 	ld acc8,a 
      00865A 5F               [ 1] 1221 	clrw x 
      00865B CF 00 08         [ 2] 1222 	ldw acc24,x 
      00865E A6 0A            [ 1] 1223 	ld a,#10 
      008660 CD 8A B6         [ 4] 1224 	call prti24 
      008663 A6 0D            [ 1] 1225 	ld a,#CR 
      008665 CD 82 4B         [ 4] 1226 	call putc 
      008668 CD 9C BD         [ 4] 1227 	call seek_fdrive 
                                   1228 ; configure LD2 pin 
      00866B 72 1A 50 0D      [ 1] 1229     bset PC_CR1,#LED2_BIT
      00866F 72 1A 50 0E      [ 1] 1230     bset PC_CR2,#LED2_BIT
      008673 72 1A 50 0C      [ 1] 1231     bset PC_DDR,#LED2_BIT
      008677 9A               [ 1] 1232 	rim 
      008678 72 5C 00 12      [ 1] 1233 	inc seedy+1 
      00867C 72 5C 00 10      [ 1] 1234 	inc seedx+1 
      008680 CD 86 EB         [ 4] 1235 	call clear_basic
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008683 CD 94 E8         [ 4] 1236 	call ubound 
      008686 CD 91 04         [ 4] 1237 	call dpop 
      008689 CF 00 20         [ 2] 1238 	ldw array_size,x
      00868C CD 86 95         [ 4] 1239 	call warm_init
      00868F CD 86 B2         [ 4] 1240 	call load_autorun
      008692 CC 88 4F         [ 2] 1241     jp interp 
                                   1242 
      008695                       1243 warm_init:
      008695 72 5F 00 22      [ 1] 1244 	clr flags 
      008699 72 5F 00 1F      [ 1] 1245 	clr loop_depth 
      00869D AE 17 80         [ 2] 1246 	ldw x,#dstack_empty 
      0086A0 CF 00 19         [ 2] 1247 	ldw dstkptr,x 
      0086A3 35 04 00 23      [ 1] 1248 	mov tab_width,#TAB_WIDTH 
      0086A7 35 0A 00 07      [ 1] 1249 	mov base,#10 
      0086AB AE 16 C8         [ 2] 1250 	ldw x,#tib 
      0086AE CF 00 05         [ 2] 1251 	ldw basicptr,x 
      0086B1 81               [ 4] 1252 	ret 
                                   1253 
                                   1254 ;--------------------------
                                   1255 ; if autorun file defined 
                                   1256 ; in eeprom address AUTORUN_NAME 
                                   1257 ; load and run it.
                                   1258 ;-------------------------
      0086B2                       1259 load_autorun:
      0086B2 AE 40 00         [ 2] 1260 	ldw x,#AUTORUN_NAME
      0086B5 F6               [ 1] 1261 	ld a,(x)
      0086B6 27 1D            [ 1] 1262 	jreq 9$
      0086B8 90 AE 40 00      [ 2] 1263 	ldw y,#AUTORUN_NAME
      0086BC CD 9D 1B         [ 4] 1264 	call search_file
      0086BF 25 02            [ 1] 1265 	jrc 2$ 
      0086C1 20 12            [ 2] 1266 	jra 9$ 
      0086C3 CD 9E 2A         [ 4] 1267 2$:	call load_file
      0086C6 AE 40 00         [ 2] 1268 	ldw x,#AUTORUN_NAME 
      0086C9 CD 82 5E         [ 4] 1269 	call puts
      0086CC AE 86 D6         [ 2] 1270 	ldw x,#autorun_msg 
      0086CF CD 82 5E         [ 4] 1271 	call puts 
      0086D2 CC 9A F0         [ 2] 1272 	jp run_it    
      0086D5 81               [ 4] 1273 9$: ret 	
                                   1274 
      0086D6 20 6C 6F 61 64 65 64  1275 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1276 ;---------------------------
                                   1277 ; reset BASIC text variables 
                                   1278 ; and clear variables 
                                   1279 ;---------------------------
      0086EB                       1280 clear_basic:
      0086EB 72 5F 00 04      [ 1] 1281 	clr count 
      0086EF AE 00 59         [ 2] 1282 	ldw x,#free_ram 
      0086F2 CF 00 1B         [ 2] 1283 	ldw txtbgn,x 
      0086F5 CF 00 1D         [ 2] 1284 	ldw txtend,x 
      0086F8 CD 85 95         [ 4] 1285 	call clear_vars 
      0086FB 81               [ 4] 1286 	ret 
                                   1287 
                                   1288 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1289 ;;   Tiny BASIC error messages     ;;
                                   1290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0086FC                       1291 err_msg:
      0086FC 00 00 87 14 87 22 87  1292 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             31 87 4B 87 5B
      008708 87 72 87 89 87 A4 87  1293 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             B6 87 C8
      008712 87 D5                 1294 	.word err_no_access 
                                   1295 
      008714 0A 4D 65 6D 6F 72 79  1296 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      008722 0A 73 79 6E 74 61 78  1297 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      008731 0A 6D 61 74 68 20 6F  1298 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      00874B 0A 64 69 76 69 73 69  1299 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      00875B 0A 69 6E 76 61 6C 69  1300 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      008772 0A 72 75 6E 20 74 69  1301 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      008789 0A 63 6F 6D 6D 61 6E  1302 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      0087A4 0A 64 75 70 6C 69 63  1303 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      0087B6 0A 46 69 6C 65 20 6E  1304 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      0087C8 0A 62 61 64 20 76 61  1305 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      0087D5 0A 46 69 6C 65 20 69  1306 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
                                   1307 
                                   1308 ;rt_msg: .asciz "last token id: "
                                   1309 
      008809                       1310 syntax_error:
      008809 A6 02            [ 1] 1311 	ld a,#ERR_SYNTAX 
                                   1312 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      00880B                       1313 tb_error:
      00880B AE 86 FC         [ 2] 1314 	ldw x, #err_msg 
      00880E 72 5F 00 09      [ 1] 1315 	clr acc16 
      008812 48               [ 1] 1316 	sll a
      008813 72 59 00 09      [ 1] 1317 	rlc acc16  
      008817 C7 00 0A         [ 1] 1318 	ld acc8, a 
      00881A 72 BB 00 09      [ 2] 1319 	addw x,acc16 
      00881E FE               [ 2] 1320 	ldw x,(x)
      00881F CD 82 5E         [ 4] 1321 	call puts
      008822 72 0B 00 22 18   [ 2] 1322 	btjf flags,#FCOMP, 1$
      008827 AE 16 C8         [ 2] 1323 	ldw x,#tib
      00882A CD 82 5E         [ 4] 1324 	call puts 
      00882D A6 0D            [ 1] 1325 	ld a,#CR 
      00882F CD 82 4B         [ 4] 1326 	call putc
      008832 CE 00 01         [ 2] 1327 	ldw x,in.w
      008835 CD 82 86         [ 4] 1328 	call spaces
      008838 A6 5E            [ 1] 1329 	ld a,#'^
      00883A CD 82 4B         [ 4] 1330 	call putc 
      00883D 20 09            [ 2] 1331 	jra 6$
      00883F CE 00 05         [ 2] 1332 1$:	ldw x,basicptr
      008842 C6 00 02         [ 1] 1333 	ld a,in 
      008845 CD 96 07         [ 4] 1334 	call prt_basic_line
                                   1335 ;	ldw x,#rt_msg 
                                   1336 ;	call puts 
                                   1337 ;	clrw x 
                                   1338 ;	ld a,in.saved 
                                   1339 ;	ld xl,a 
                                   1340 ;	ld a,([basicptr],x)
                                   1341 ;	clrw x 
                                   1342 ;	ld xl,a 
                                   1343 ;	call print_int 
      008848 AE 17 FF         [ 2] 1344 6$: ldw x,#STACK_EMPTY 
      00884B 94               [ 1] 1345     ldw sp,x
      00884C                       1346 warm_start:
      00884C CD 86 95         [ 4] 1347 	call warm_init
                                   1348 ;----------------------------
                                   1349 ;   BASIC interpreter
                                   1350 ;----------------------------
      00884F                       1351 interp:
      00884F 72 5F 00 01      [ 1] 1352 	clr in.w
      008853 72 01 00 22 23   [ 2] 1353 	btjf flags,#FRUN,4$ 
                                   1354 ; running program
                                   1355 ; goto next basic line 
      008858 CE 00 05         [ 2] 1356 	ldw x,basicptr
      00885B E6 02            [ 1] 1357 	ld a,(2,x) ; line length 
      00885D C7 00 0A         [ 1] 1358 	ld acc8,a 
      008860 72 5F 00 09      [ 1] 1359 	clr acc16 
      008864 72 BB 00 09      [ 2] 1360 	addw x,acc16
      008868 C3 00 1D         [ 2] 1361 	cpw x,txtend 
      00886B 2A DF            [ 1] 1362 	jrpl warm_start
      00886D CF 00 05         [ 2] 1363 	ldw basicptr,x ; start of next line  
      008870 E6 02            [ 1] 1364 	ld a,(2,x)
      008872 C7 00 04         [ 1] 1365 	ld count,a 
      008875 35 03 00 02      [ 1] 1366 	mov in,#3 ; skip first 3 bytes of line 
      008879 20 14            [ 2] 1367 	jra interp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      00887B                       1368 4$: ; commande line mode 	
      00887B 72 5F 00 02      [ 1] 1369 	clr in
      00887F A6 0D            [ 1] 1370 	ld a,#CR 
      008881 CD 82 4B         [ 4] 1371 	call putc 
      008884 A6 3E            [ 1] 1372 	ld a,#'> 
      008886 CD 82 4B         [ 4] 1373 	call putc 
      008889 CD 8B EC         [ 4] 1374 	call readln
      00888C CD 84 9A         [ 4] 1375 	call compile
      00888F                       1376 interp_loop:  
      00888F C6 00 02         [ 1] 1377 	ld a,in 
      008892 C1 00 04         [ 1] 1378 	cp a,count  
      008895 2A B8            [ 1] 1379 	jrpl interp
      008897 CD 88 BF         [ 4] 1380 	call next_token
      00889A A1 01            [ 1] 1381 	cp a,#TK_COLON 
      00889C 27 F1            [ 1] 1382 	jreq interp_loop 
      00889E A1 00            [ 1] 1383 	cp a,#TK_NONE 
                                   1384 ;	jreq interp 
      0088A0                       1385 1$:
      0088A0 A1 05            [ 1] 1386 	cp a,#TK_VAR
      0088A2 26 05            [ 1] 1387 	jrne 2$
      0088A4 CD 95 14         [ 4] 1388 	call let02  
      0088A7 20 E6            [ 2] 1389 	jra interp_loop 
      0088A9                       1390 2$:	
      0088A9 A1 02            [ 1] 1391 	cp a,#TK_ARRAY 
      0088AB 26 08            [ 1] 1392 	jrne 3$
      0088AD CD 93 59         [ 4] 1393 	call get_array_element
      0088B0 CD 95 14         [ 4] 1394 	call let02 
      0088B3 20 DA            [ 2] 1395 	jra interp_loop 
      0088B5                       1396 3$:
      0088B5 A1 06            [ 1] 1397 	cp a,#TK_CMD
      0088B7 26 03            [ 1] 1398 	jrne 4$
      0088B9 FD               [ 4] 1399 	call (x) 
      0088BA 20 D3            [ 2] 1400 	jra interp_loop 
      0088BC                       1401 4$:	
      0088BC CC 88 09         [ 2] 1402 	jp syntax_error 
                                   1403 
                                   1404 ;--------------------------
                                   1405 ; extract next token from
                                   1406 ; token list 
                                   1407 ; basicptr -> base address 
                                   1408 ; in  -> offset in list array 
                                   1409 ; output:
                                   1410 ;   A 		token attribute
                                   1411 ;   X 		token value if there is one
                                   1412 ;----------------------------------------
      0088BF                       1413 next_token:
      0088BF C6 00 02         [ 1] 1414 	ld a,in 
      0088C2 C0 00 04         [ 1] 1415 	sub a,count ; don't replace sub by cp.  
      0088C5 27 4C            [ 1] 1416 	jreq 9$
      0088C7 55 00 02 00 03   [ 1] 1417 	mov in.saved,in 
      0088CC CE 00 05         [ 2] 1418 	ldw x,basicptr 
      0088CF 72 D6 00 01      [ 4] 1419 	ld a,([in.w],x)
      0088D3 72 5C 00 02      [ 1] 1420 	inc in 
      0088D7 A1 02            [ 1] 1421 	cp a,#TK_ARRAY  
      0088D9 23 38            [ 2] 1422 	jrule 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0088DB A1 03            [ 1] 1423 	cp a,#TK_CHAR
      0088DD 26 0D            [ 1] 1424 	jrne 1$
      0088DF 72 D6 00 01      [ 4] 1425 	ld a,([in.w],x)
      0088E3 72 5C 00 02      [ 1] 1426 	inc in
      0088E7 5F               [ 1] 1427 	clrw x 
      0088E8 97               [ 1] 1428 	ld xl,a 
      0088E9 A6 03            [ 1] 1429 	ld a,#TK_CHAR
      0088EB 81               [ 4] 1430 	ret 
      0088EC A1 0A            [ 1] 1431 1$:	cp a,#TK_QSTR 
      0088EE 25 17            [ 1] 1432 	jrult 4$
      0088F0 26 21            [ 1] 1433 	jrne 9$
      0088F2 72 BB 00 01      [ 2] 1434 	addw x,in.w 
      0088F6 89               [ 2] 1435 	pushw x 
      0088F7 7D               [ 1] 1436 2$:	tnz (x)
      0088F8 27 03            [ 1] 1437 	jreq 3$
      0088FA 5C               [ 2] 1438 	incw x 
      0088FB 20 FA            [ 2] 1439 	jra 2$ 
      0088FD 5C               [ 2] 1440 3$:	incw x 
      0088FE 72 B0 00 05      [ 2] 1441     subw x,basicptr 
      008902 CF 00 01         [ 2] 1442 	ldw in.w,x 
      008905 85               [ 2] 1443 	popw x 
      008906 81               [ 4] 1444 	ret 
      008907 72 DE 00 01      [ 5] 1445 4$: ldw x,([in.w],x)
      00890B 72 5C 00 02      [ 1] 1446 	inc in 
      00890F 72 5C 00 02      [ 1] 1447 	inc in
      008913                       1448 9$: 
      008913 81               [ 4] 1449 	ret	
                                   1450 
                                   1451 
                                   1452 ;----------------------------------------
                                   1453 ;   DEBUG support functions
                                   1454 ;----------------------------------------
                           000001  1455 .if DEBUG 
                                   1456 
                                   1457 ;-------------------------------------
                                   1458 ; input:
                                   1459 ;    A    token ID
                                   1460 ;    X    token value 
                                   1461 ;    in.w  program counter position
                                   1462 ;------------------------------------
      008914                       1463 print_token_info:
      008914 88               [ 1] 1464 	push a 
      008915 89               [ 2] 1465 	pushw x 
      008916 A1 0F            [ 1] 1466 	cp a,#15 
      008918 22 03            [ 1] 1467 	jrugt 2$
      00891A CE 89 1E         [ 2] 1468 	ldw x,token_ptr0 
                                   1469 
      00891D 81               [ 4] 1470 2$:	ret
                                   1471 ; token type name pointer  
      00891E 89 52 89 57 89 59 89  1472 token_ptr0: .word tok_none,tok_colon,tok_array,tok_char,tok_int,tok_var,tok_cmd
             5B 89 60 89 64 89 68
      00892C 89 6C 89 71 89 7B 89  1473             .word tok_func,tok_cfunc,tok_const,tok_str,tok_lparen,tok_rparen
             81 89 88 89 8A
      008938 89 8C 89 8E           1474 			.word tok_comma,tok_sharp
                                   1475 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      00893C 89 90 89 92           1476 token_ptr1: .word tok_plus,tok_minus 
                                   1477 
      008940 89 94 89 96 89 98     1478 token_ptr2: .word tok_star, tok_slash, tok_pcent 
                                   1479 
      008946 89 9A 89 9C 89 9E 89  1480 token_ptr3: .word tok_gt, tok_equ, tok_ge, tok_lt, tok_le, tok_ne 
             A1 89 A3 89 A6
                                   1481 
                                   1482 
                                   1483 ;token types 
      008952                       1484 tok_grp0: 
      008952 6E 6F 6E 65 00        1485 tok_none: .asciz "none"  ; 0
      008957 3A 00                 1486 tok_colon: .asciz ":"    ; 1
      008959 40 00                 1487 tok_array: .asciz "@"    ; 2
      00895B 63 68 61 72 00        1488 tok_char:  .asciz "char" ; 3 
      008960 69 6E 74 00           1489 tok_int:   .asciz "int"  ; 4 
      008964 76 61 72 00           1490 tok_var:   .asciz "var"  ; 5
      008968 63 6D 64 00           1491 tok_cmd:   .asciz "cmd"  ; 6 
      00896C 66 75 6E 63 00        1492 tok_func:  .asciz "func" ; 7 
      008971 63 68 61 72 20 66 75  1493 tok_cfunc: .asciz "char func" ; 8
             6E 63 00
      00897B 63 6F 6E 73 74 00     1494 tok_const: .asciz "const"  ; 9
      008981 73 74 72 69 6E 67 00  1495 tok_str:   .asciz "string" ; 10
      008988 28 00                 1496 tok_lparen: .asciz "("  ; 11
      00898A 29 00                 1497 tok_rparen: .asciz ")" ; 12
      00898C 2C 00                 1498 tok_comma: .asciz ","  ; 13
      00898E 23 00                 1499 tok_sharp: .asciz "#"  ; 14 
      008990                       1500 tok_grp1: 
      008990 2B 00                 1501 tok_plus: .asciz "+"   ; 16
      008992 2D 00                 1502 tok_minus: .asciz "-"  ; 17
      008994                       1503 tok_grp2:
      008994 2A 00                 1504 tok_star: .asciz "*"   ; 32 
      008996 2F 00                 1505 tok_slash: .asciz "/"  ; 33 
      008998 25 00                 1506 tok_pcent: .asciz "%"  ; 34 
      00899A                       1507 tok_grp3:
      00899A 3E 00                 1508 tok_gt: .asciz ">"     ; 49
      00899C 3D 00                 1509 tok_equ: .asciz "="    ; 50
      00899E 3E 3D 00              1510 tok_ge: .asciz ">="    ; 51
      0089A1 3C 00                 1511 tok_lt: .asciz "<"     ; 52 
      0089A3 3C 3D 00              1512 tok_le: .asciz "<="    ; 53
      0089A6 3C 3E 00              1513 tok_ne: .asciz "<>"    ; 54
                                   1514 
                                   1515 
                                   1516 
                                   1517 ; turn LED on 
      0089A9                       1518 ledon:
      0089A9 72 1A 50 0A      [ 1] 1519     bset PC_ODR,#LED2_BIT
      0089AD 81               [ 4] 1520     ret 
                                   1521 
                                   1522 ; turn LED off 
      0089AE                       1523 ledoff:
      0089AE 72 1B 50 0A      [ 1] 1524     bres PC_ODR,#LED2_BIT 
      0089B2 81               [ 4] 1525     ret 
                                   1526 
                                   1527 ; invert LED status 
      0089B3                       1528 ledtoggle:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0089B3 A6 20            [ 1] 1529     ld a,#LED2_MASK
      0089B5 C8 50 0A         [ 1] 1530     xor a,PC_ODR
      0089B8 C7 50 0A         [ 1] 1531     ld PC_ODR,a
      0089BB 81               [ 4] 1532     ret 
                                   1533 
      0089BC                       1534 left_paren:
      0089BC A6 20            [ 1] 1535 	ld a,#SPACE 
      0089BE CD 82 4B         [ 4] 1536 	call putc
      0089C1 A6 28            [ 1] 1537 	ld a,#'( 
      0089C3 CD 82 4B         [ 4] 1538 	call putc 	
      0089C6 81               [ 4] 1539 	ret 
                                   1540 
                                   1541 ;------------------------------
                                   1542 ; print 8 bit register 
                                   1543 ; input:
                                   1544 ;   X  point to register name 
                                   1545 ;   A  register value to print 
                                   1546 ; output:
                                   1547 ;   none
                                   1548 ;------------------------------- 
      0089C7                       1549 prt_reg8:
      0089C7 88               [ 1] 1550 	push a 
      0089C8 CD 82 5E         [ 4] 1551 	call puts 
      0089CB 7B 01            [ 1] 1552 	ld a,(1,sp) 
      0089CD C7 00 0A         [ 1] 1553 	ld acc8,a 
      0089D0 5F               [ 1] 1554 	clrw x 
      0089D1 97               [ 1] 1555 	ld xl,a 
      0089D2 35 10 00 07      [ 1] 1556 	mov base,#16
      0089D6 CD 8A FE         [ 4] 1557 	call print_int 
      0089D9 CD 89 BC         [ 4] 1558 	call left_paren 
      0089DC 84               [ 1] 1559 	pop a 
      0089DD 5F               [ 1] 1560 	clrw x 
      0089DE 97               [ 1] 1561 	ld xl,a 
      0089DF 35 0A 00 07      [ 1] 1562 	mov base,#10 
      0089E3 CD 8A FE         [ 4] 1563 	call print_int  
      0089E6 A6 29            [ 1] 1564 	ld a,#') 
      0089E8 CD 82 4B         [ 4] 1565 	call putc
      0089EB 81               [ 4] 1566 	ret
                                   1567 
                                   1568 ;--------------------------------
                                   1569 ; print 16 bits register 
                                   1570 ; input:
                                   1571 ;   X   point register name 
                                   1572 ;   Y   register value to print 
                                   1573 ; output:
                                   1574 ;  none
                                   1575 ;--------------------------------
      0089EC                       1576 prt_reg16: 
      0089EC 90 89            [ 2] 1577 	pushw y 
      0089EE CD 82 5E         [ 4] 1578 	call puts 
      0089F1 1E 01            [ 2] 1579 	ldw x,(1,sp) 
      0089F3 35 10 00 07      [ 1] 1580 	mov base,#16 
      0089F7 CD 8A FE         [ 4] 1581 	call print_int  
      0089FA CD 89 BC         [ 4] 1582 	call left_paren 
      0089FD 85               [ 2] 1583 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0089FE 35 0A 00 07      [ 1] 1584 	mov base,#10 
      008A02 CD 8A FE         [ 4] 1585 	call print_int  
      008A05 A6 29            [ 1] 1586 	ld a,#') 
      008A07 CD 82 4B         [ 4] 1587 	call putc
      008A0A 81               [ 4] 1588 	ret 
                                   1589 
                                   1590 ;------------------------------------
                                   1591 ; print registers contents saved on
                                   1592 ; stack by trap interrupt.
                                   1593 ;------------------------------------
      008A0B                       1594 print_registers:
      008A0B AE 8A 5E         [ 2] 1595 	ldw x,#STATES
      008A0E CD 82 5E         [ 4] 1596 	call puts
                                   1597 ; print EPC 
      008A11 AE 8A 9B         [ 2] 1598 	ldw x, #REG_EPC
      008A14 CD 82 5E         [ 4] 1599 	call puts 
      008A17 7B 0B            [ 1] 1600 	ld a, (11,sp)
      008A19 C7 00 0A         [ 1] 1601 	ld acc8,a 
      008A1C 7B 0A            [ 1] 1602 	ld a, (10,sp) 
      008A1E C7 00 09         [ 1] 1603 	ld acc16,a 
      008A21 7B 09            [ 1] 1604 	ld a,(9,sp) 
      008A23 C7 00 08         [ 1] 1605 	ld acc24,a
      008A26 5F               [ 1] 1606 	clrw x  
      008A27 A6 10            [ 1] 1607 	ld a,#16
      008A29 CD 8A B6         [ 4] 1608 	call prti24  
                                   1609 ; print X
      008A2C AE 8A A4         [ 2] 1610 	ldw x,#REG_X
      008A2F 16 05            [ 2] 1611 	ldw y,(5,sp)
      008A31 CD 89 EC         [ 4] 1612 	call prt_reg16  
                                   1613 ; print Y 
      008A34 AE 8A A0         [ 2] 1614 	ldw x,#REG_Y
      008A37 16 07            [ 2] 1615 	ldw y, (7,sp)
      008A39 CD 89 EC         [ 4] 1616 	call prt_reg16  
                                   1617 ; print A 
      008A3C AE 8A A8         [ 2] 1618 	ldw x,#REG_A
      008A3F 7B 04            [ 1] 1619 	ld a, (4,sp) 
      008A41 CD 89 C7         [ 4] 1620 	call prt_reg8
                                   1621 ; print CC 
      008A44 AE 8A AC         [ 2] 1622 	ldw x,#REG_CC 
      008A47 7B 03            [ 1] 1623 	ld a, (3,sp) 
      008A49 CD 89 C7         [ 4] 1624 	call prt_reg8 
                                   1625 ; print SP 
      008A4C AE 8A B1         [ 2] 1626 	ldw x,#REG_SP
      008A4F 90 96            [ 1] 1627 	ldw y,sp 
      008A51 72 A9 00 0C      [ 2] 1628 	addw y,#12
      008A55 CD 89 EC         [ 4] 1629 	call prt_reg16  
      008A58 A6 0A            [ 1] 1630 	ld a,#'\n' 
      008A5A CD 82 4B         [ 4] 1631 	call putc
      008A5D 81               [ 4] 1632 	ret
                                   1633 
      008A5E 0A 52 65 67 69 73 74  1634 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal  2D-Bits]



             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      008A82 2D 2D 2D 2D 2D        1635 REG_EPC: .asciz "EPC:"
      008A87 2D 2D 2D 2D           1636 REG_Y:   .asciz "\nY:" 
      008A8B 2D 2D 2D 2D           1637 REG_X:   .asciz "\nX:"
      008A8F 2D 2D 2D 2D           1638 REG_A:   .asciz "\nA:" 
      008A93 2D 2D 2D 2D 2D        1639 REG_CC:  .asciz "\nCC:"
      008A98 2D 0A 00 45 50        1640 REG_SP:  .asciz "\nSP:"
                                   1641 .endif ; DEBUG 
                                   1642 
                                   1643 ;------------------------------------
                                   1644 ; print integer in acc24 
                                   1645 ; input:
                                   1646 ;	acc24 		integer to print 
                                   1647 ;	A 			numerical base for conversion 
                                   1648 ;               if bit 7 is set add a space at print end.
                                   1649 ;   XL 			field width, 0 -> no fill.
                                   1650 ;  output:
                                   1651 ;    none 
                                   1652 ;------------------------------------
                           000001  1653 	WIDTH = 1
                           000002  1654 	BASE = 2
                           000003  1655 	ADD_SPACE=3 ; add a space after number 
                           000003  1656 	VSIZE = 3
      000A36                       1657 prti24:
      000A36                       1658 	_vars VSIZE 
      008A9D 43 3A            [ 2]    1     sub sp,#VSIZE 
      008A9F 00 0A            [ 1] 1659 	clr (ADD_SPACE,sp)
      008AA1 59 3A            [ 1] 1660 	bcp a,#0x80 
      008AA3 00 0A            [ 1] 1661 	jreq 0$ 
      008AA5 58 3A            [ 1] 1662 	cpl (ADD_SPACE,sp)
      008AA7 00 0A            [ 1] 1663 0$:	and a,#31 
      008AA9 41 3A            [ 1] 1664 	ld (BASE,sp),a
      008AAB 00               [ 1] 1665 	ld a,xl
      008AAC 0A 43            [ 1] 1666 	ld (WIDTH,sp),a 
      008AAE 43 3A            [ 1] 1667 	ld a, (BASE,sp)  
      008AB0 00 0A 53         [ 4] 1668     call itoa  ; conversion entier en  .asciz
      008AB3 50 3A            [ 1] 1669 1$: ld a,(WIDTH,sp)
      008AB5 00 1F            [ 1] 1670 	jreq 4$
      008AB6 C7 00 09         [ 1] 1671 	ld acc8,a 
      008AB6 52               [ 2] 1672 	pushw x 
      008AB7 03 0F 03         [ 4] 1673 	call strlen 
      008ABA A5               [ 1] 1674 	ld a,xl 
      008ABB 80               [ 2] 1675 	popw x 
      008ABC 27 02 03         [ 3] 1676 	exg a,acc8 
      008ABF 03 A4 1F         [ 1] 1677 	sub a,acc8 
      008AC2 6B 02            [ 1] 1678 	jrmi 4$
      008AC4 9F 6B            [ 1] 1679 	ld (WIDTH,sp),a 
      008AC6 01 7B            [ 1] 1680 	ld  a,#SPACE
      008AC8 02 CD            [ 1] 1681 3$: tnz (WIDTH,sp)
      008ACA 8B 5A            [ 1] 1682 	jreq 4$
      008ACC 7B               [ 2] 1683 	decw x 
      008ACD 01               [ 1] 1684 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008ACE 27 1F            [ 1] 1685 	dec (WIDTH,sp) 
      008AD0 C7 00            [ 2] 1686 	jra 3$
      000A6F                       1687 4$: 
      008AD2 0A 89 CD         [ 4] 1688 	call puts 
      008AD5 83 20            [ 1] 1689 	tnz (ADD_SPACE,sp)
      008AD7 9F 85            [ 1] 1690 	jreq 5$
      008AD9 31 00            [ 1] 1691     ld a,#SPACE 
      008ADB 0A C0 00         [ 4] 1692 	call putc 
      000A7B                       1693 5$: _drop VSIZE 
      008ADE 0A 2B            [ 2]    1     addw sp,#VSIZE 
      008AE0 0E               [ 4] 1694     ret	
                                   1695 
                                   1696 ;-----------------------------------
                                   1697 ; print a 16 bit integer 
                                   1698 ; using variable 'base' as conversion
                                   1699 ; format.
                                   1700 ; input:
                                   1701 ;   X       integer to print 
                                   1702 ;   base    conversion base 
                                   1703 ; output:
                                   1704 ;   none 
                                   1705 ;-----------------------------------
                           000001  1706 	SIGN=1
                           000001  1707 	VSIZE=1
      000A7E                       1708 print_int: 
      000A7E                       1709 	_vars VSIZE 
      008AE1 6B 01            [ 2]    1     sub sp,#VSIZE 
      008AE3 A6 20            [ 1] 1710 	clr (SIGN,sp)
      008AE5 0D 01 27 06      [ 2] 1711 	ldw y,#pad+PAD_SIZE-1 
      008AE9 5A F7            [ 1] 1712 	clr (y)
      008AEB 0A 01 20         [ 1] 1713 	ld a,base  
      008AEE F6 0A            [ 1] 1714 	cp a,#10 
      008AEF 26 06            [ 1] 1715 	jrne 1$ 
      008AEF CD               [ 2] 1716 	tnzw x 
      008AF0 82 5E            [ 1] 1717 	jrpl 1$ 
      008AF2 0D 03            [ 1] 1718 	cpl (SIGN,sp)
      008AF4 27               [ 2] 1719 	negw x 	 
      000A95                       1720 1$:	
      008AF5 05 A6 20         [ 1] 1721 	ld a,base 
      008AF8 CD               [ 2] 1722 	div x,a 
      008AF9 82 4B            [ 1] 1723 	add a,#'0 
      008AFB 5B 03            [ 1] 1724 	cp a,#'9+1 
      008AFD 81 02            [ 1] 1725 	jrmi 2$ 
      008AFE AB 07            [ 1] 1726 	add a,#7 
      008AFE 52 01            [ 2] 1727 2$: decw y 
      008B00 0F 01            [ 1] 1728 	ld (y),a 
      008B02 90               [ 2] 1729 	tnzw x 
      008B03 AE 17            [ 1] 1730 	jrne 1$ 
      008B05 3F 90            [ 1] 1731 	ld a,#16 
      008B07 7F C6 00         [ 1] 1732 	cp a,base 
      008B0A 07 A1            [ 1] 1733 	jrne 3$
      008B0C 0A 26            [ 1] 1734 	ld a,#'$
      008B0E 06 5D            [ 2] 1735 	decw y  
      008B10 2A 03            [ 1] 1736 	ld (y),a
      008B12 03 01            [ 2] 1737 	jra 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008B14 50 01            [ 1] 1738 3$: tnz (SIGN,sp)
      008B15 27 06            [ 1] 1739 	jreq 9$ 
      008B15 C6 00            [ 1] 1740 	ld a,#'-
      008B17 07 62            [ 2] 1741 	decw y  
      008B19 AB 30            [ 1] 1742 	ld (y),a
      000AC1                       1743 9$:	
      008B1B A1               [ 1] 1744 	ldw x,y 
      008B1C 3A 2B 02         [ 2] 1745 	subw x,#pad+PAD_SIZE-1 
      008B1F AB               [ 2] 1746 	negw x  
      000AC6                       1747 10$:
      008B20 07 90            [ 2] 1748 	decw y 
      008B22 5A 90            [ 1] 1749 	ld a,#SPACE 
      008B24 F7 5D            [ 1] 1750 	ld (y),a
      008B26 26               [ 2] 1751 	incw x 
      008B27 ED               [ 1] 1752 	ld a,xl 
      008B28 A6 10 C1         [ 1] 1753 	cp a,tab_width
      008B2B 00 07            [ 1] 1754 	jrmi 10$ 
      000AD3                       1755 12$:
      008B2D 26               [ 1] 1756     ldw x,y 
      008B2E 08 A6 24         [ 4] 1757 	call puts  
      000AD7                       1758 	_drop VSIZE 
      008B31 90 5A            [ 2]    1     addw sp,#VSIZE 
      008B33 90               [ 4] 1759 	ret 
                                   1760 
                                   1761 ;------------------------------------
                                   1762 ; convert integer in acc24 to string
                                   1763 ; input:
                                   1764 ;   A	  	base
                                   1765 ;	acc24	integer to convert
                                   1766 ; output:
                                   1767 ;   X  		pointer to string
                                   1768 ;------------------------------------
                           000001  1769 	SIGN=1  ; integer sign 
                           000002  1770 	BASE=2  ; numeric base 
                           000002  1771 	VSIZE=2  ;locals size
      000ADA                       1772 itoa:
      008B34 F7 20            [ 2] 1773 	sub sp,#VSIZE
      008B36 0A 0D            [ 1] 1774 	ld (BASE,sp), a  ; base
      008B38 01 27            [ 1] 1775 	clr (SIGN,sp)    ; sign
      008B3A 06 A6            [ 1] 1776 	cp a,#10
      008B3C 2D 90            [ 1] 1777 	jrne 1$
                                   1778 	; base 10 string display with negative sign if bit 23==1
      008B3E 5A 90 F7 07 05   [ 2] 1779 	btjf acc24,#7,1$
      008B41 03 01            [ 1] 1780 	cpl (SIGN,sp)
      008B41 93 1D 17         [ 4] 1781 	call neg_acc24
      000AEE                       1782 1$:
                                   1783 ; initialize string pointer 
      008B44 3F 50 3F         [ 2] 1784 	ldw x,#pad+PAD_SIZE-1
      008B46 7F               [ 1] 1785 	clr (x)
      000AF2                       1786 itoa_loop:
      008B46 90 5A            [ 1] 1787     ld a,(BASE,sp)
      008B48 A6 20 90         [ 4] 1788     call divu24_8 ; acc24/A 
      008B4B F7 5C            [ 1] 1789     add a,#'0  ; remainder of division
      008B4D 9F C1            [ 1] 1790     cp a,#'9+1
      008B4F 00 23            [ 1] 1791     jrmi 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008B51 2B F3            [ 1] 1792     add a,#7 
      008B53 5A               [ 2] 1793 2$: decw x
      008B53 93               [ 1] 1794     ld (x),a
                                   1795 	; if acc24==0 conversion done
      008B54 CD 82 5E         [ 1] 1796 	ld a,acc24
      008B57 5B 01 81         [ 1] 1797 	or a,acc16
      008B5A CA 00 09         [ 1] 1798 	or a,acc8
      008B5A 52 02            [ 1] 1799     jrne itoa_loop
                                   1800 	;conversion done, next add '$' or '-' as required
      008B5C 6B 02            [ 1] 1801 	ld a,(BASE,sp)
      008B5E 0F 01            [ 1] 1802 	cp a,#16
      008B60 A1 0A            [ 1] 1803 	jreq 8$
      008B62 26 0A            [ 1] 1804 	ld a,(SIGN,sp)
      008B64 72 0F            [ 1] 1805     jreq 10$
      008B66 00 08            [ 1] 1806     ld a,#'-
      008B68 05 03            [ 2] 1807 	jra 9$ 
      008B6A 01 CD            [ 1] 1808 8$: ld a,#'$ 
      008B6C 8B               [ 2] 1809 9$: decw x
      008B6D C9               [ 1] 1810     ld (x),a
      008B6E                       1811 10$:
      008B6E AE 17            [ 2] 1812 	addw sp,#VSIZE
      008B70 3F               [ 4] 1813 	ret
                                   1814 
                                   1815 ;-------------------------------------
                                   1816 ; divide uint24_t by uint8_t
                                   1817 ; used to convert uint24_t to string
                                   1818 ; input:
                                   1819 ;	acc24	dividend
                                   1820 ;   A 		divisor
                                   1821 ; output:
                                   1822 ;   acc24	quotient
                                   1823 ;   A		remainder
                                   1824 ;------------------------------------- 
                                   1825 ; offset  on sp of arguments and locals
                           000001  1826 	U8   = 1   ; divisor on stack
                           000001  1827 	VSIZE =1
      000B21                       1828 divu24_8:
      008B71 7F               [ 2] 1829 	pushw x ; save x
      008B72 88               [ 1] 1830 	push a 
                                   1831 	; ld dividend UU:MM bytes in X
      008B72 7B 02 CD         [ 1] 1832 	ld a, acc24
      008B75 8B               [ 1] 1833 	ld xh,a
      008B76 A1 AB 30         [ 1] 1834 	ld a,acc24+1
      008B79 A1               [ 1] 1835 	ld xl,a
      008B7A 3A 2B            [ 1] 1836 	ld a,(U8,SP) ; divisor
      008B7C 02               [ 2] 1837 	div x,a ; UU:MM/U8
      008B7D AB               [ 1] 1838 	push a  ;save remainder
      008B7E 07               [ 1] 1839 	ld a,xh
      008B7F 5A F7 C6         [ 1] 1840 	ld acc24,a
      008B82 00               [ 1] 1841 	ld a,xl
      008B83 08 CA 00         [ 1] 1842 	ld acc24+1,a
      008B86 09               [ 1] 1843 	pop a
      008B87 CA               [ 1] 1844 	ld xh,a
      008B88 00 0A 26         [ 1] 1845 	ld a,acc24+2
      008B8B E6               [ 1] 1846 	ld xl,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B8C 7B 02            [ 1] 1847 	ld a,(U8,sp) ; divisor
      008B8E A1               [ 2] 1848 	div x,a  ; R:LL/U8
      008B8F 10 27            [ 1] 1849 	ld (U8,sp),a ; save remainder
      008B91 08               [ 1] 1850 	ld a,xl
      008B92 7B 01 27         [ 1] 1851 	ld acc24+2,a
      008B95 08               [ 1] 1852 	pop a
      008B96 A6               [ 2] 1853 	popw x
      008B97 2D               [ 4] 1854 	ret
                                   1855 
                                   1856 ;------------------------------------
                                   1857 ;  two's complement acc24
                                   1858 ;  input:
                                   1859 ;		acc24 variable
                                   1860 ;  output:
                                   1861 ;		acc24 variable
                                   1862 ;-------------------------------------
      000B49                       1863 neg_acc24:
      008B98 20 02 A6 24      [ 1] 1864 	cpl acc24+2
      008B9C 5A F7 00 08      [ 1] 1865 	cpl acc24+1
      008B9E 72 53 00 07      [ 1] 1866 	cpl acc24
      008B9E 5B 02            [ 1] 1867 	ld a,#1
      008BA0 81 00 09         [ 1] 1868 	add a,acc24+2
      008BA1 C7 00 09         [ 1] 1869 	ld acc24+2,a
      008BA1 89               [ 1] 1870 	clr a
      008BA2 88 C6 00         [ 1] 1871 	adc a,acc24+1
      008BA5 08 95 C6         [ 1] 1872 	ld acc24+1,a 
      008BA8 00               [ 1] 1873 	clr a 
      008BA9 09 97 7B         [ 1] 1874 	adc a,acc24 
      008BAC 01 62 88         [ 1] 1875 	ld acc24,a 
      008BAF 9E               [ 4] 1876 	ret
                                   1877 
                                   1878 
                                   1879 ;------------------------------------
                                   1880 ; read a line of text from terminal
                                   1881 ; input:
                                   1882 ;	none
                                   1883 ; local variable on stack:
                                   1884 ;	LL  line length
                                   1885 ;   RXCHAR last received chaaracte 
                                   1886 ; output:
                                   1887 ;   text in tib  buffer
                                   1888 ;------------------------------------
                                   1889 	; local variables
                           000001  1890 	LL_HB=1
                           000001  1891 	RXCHAR = 1 ; last char received
                           000002  1892 	LL = 2  ; accepted line length
                           000002  1893 	VSIZE=2 
      000B6C                       1894 readln:
      008BB0 C7               [ 1] 1895 	clrw x 
      008BB1 00               [ 2] 1896 	pushw x 
      008BB2 08 9F C7 00      [ 2] 1897  	ldw y,#tib ; input buffer
      000B72                       1898 readln_loop:
      008BB6 09 84 95         [ 4] 1899 	call getc
      008BB9 C6 00            [ 1] 1900 	ld (RXCHAR,sp),a
      008BBB 0A 97            [ 1] 1901 	cp a,#CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008BBD 7B 01            [ 1] 1902 	jrne 1$
      008BBF 62 6B 01         [ 2] 1903 	jp readln_quit
      008BC2 9F C7            [ 1] 1904 1$:	cp a,#NL
      008BC4 00 0A            [ 1] 1905 	jreq readln_quit
      008BC6 84 85            [ 1] 1906 	cp a,#BSP
      008BC8 81 3D            [ 1] 1907 	jreq del_back
      008BC9 A1 04            [ 1] 1908 	cp a,#CTRL_D
      008BC9 72 53            [ 1] 1909 	jreq del_ln
      008BCB 00 0A            [ 1] 1910 	cp a,#CTRL_R 
      008BCD 72 53            [ 1] 1911 	jreq reprint 
                                   1912 ;	cp a,#'[
                                   1913 ;	jreq ansi_seq
      000B8E                       1914 final_test:
      008BCF 00 09            [ 1] 1915 	cp a,#SPACE
      008BD1 72 53            [ 1] 1916 	jrpl accept_char
      008BD3 00 08            [ 2] 1917 	jra readln_loop
      000B94                       1918 ansi_seq:
                                   1919 ;	call getc
                                   1920 ;	cp a,#'C 
                                   1921 ;	jreq rigth_arrow
                                   1922 ;	cp a,#'D 
                                   1923 ;	jreq left_arrow 
                                   1924 ;	jra final_test
      000B94                       1925 right_arrow:
                                   1926 ;	ld a,#BSP 
                                   1927 ;	call putc 
                                   1928 ;	jra realn_loop 
      000B94                       1929 left_arrow:
                                   1930 
                                   1931 ;	jra readln_loop
      000B94                       1932 reprint: 
      008BD5 A6 01            [ 1] 1933 	tnz (LL,sp)
      008BD7 CB 00            [ 1] 1934 	jrne readln_loop
      008BD9 0A C7 00         [ 2] 1935 	ldw x,#tib 
      008BDC 0A 4F C9         [ 4] 1936 	call strlen 
      008BDF 00 09 C7 00      [ 2] 1937 	ldw y,#tib 
      008BE3 09               [ 1] 1938 	ld a,xl
      008BE4 4F C9            [ 1] 1939 	jreq readln_loop
      008BE6 00 08            [ 1] 1940 	ld (LL,sp),a 
      008BE8 C7 00 08         [ 2] 1941 	ldw x,#tib 
      008BEB 81 01 DE         [ 4] 1942 	call puts
      008BEC 0F 01            [ 1] 1943 	clr (LL_HB,sp)
      008BEC 5F 89 90         [ 2] 1944 	addw y,(LL_HB,sp)
      008BEF AE 16            [ 2] 1945 	jra readln_loop 
      000BB4                       1946 del_ln:
      008BF1 C8 02            [ 1] 1947 	ld a,(LL,sp)
      008BF2 CD 01 F8         [ 4] 1948 	call delete
      008BF2 CD 82 54 6B      [ 2] 1949 	ldw y,#tib
      008BF6 01 A1            [ 1] 1950 	clr (y)
      008BF8 0D 26            [ 1] 1951 	clr (LL,sp)
      008BFA 03 CC            [ 2] 1952 	jra readln_loop
      000BC3                       1953 del_back:
      008BFC 8C 67            [ 1] 1954     tnz (LL,sp)
      008BFE A1 0A            [ 1] 1955     jreq readln_loop
      008C00 27 65            [ 1] 1956     dec (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008C02 A1 08            [ 2] 1957     decw y
      008C04 27 3D            [ 1] 1958     clr  (y)
      008C06 A1 04 27         [ 4] 1959     call bksp 
      008C09 2A A1            [ 2] 1960     jra readln_loop	
      000BD2                       1961 accept_char:
      008C0B 12 27            [ 1] 1962 	ld a,#TIB_SIZE-1
      008C0D 06 02            [ 1] 1963 	cp a, (LL,sp)
      008C0E 27 9A            [ 1] 1964 	jreq readln_loop
      008C0E A1 20            [ 1] 1965 	ld a,(RXCHAR,sp)
      008C10 2A 40            [ 1] 1966 	ld (y),a
      008C12 20 DE            [ 1] 1967 	inc (LL,sp)
      008C14 90 5C            [ 2] 1968 	incw y
      008C14 90 7F            [ 1] 1969 	clr (y)
      008C14 CD 01 CB         [ 4] 1970 	call putc 
      008C14 20 8B            [ 2] 1971 	jra readln_loop
      000BE7                       1972 readln_quit:
      008C14 0D 02            [ 1] 1973 	clr (y)
      008C16 26 DA            [ 1] 1974 	ld a,(LL,sp)
      008C18 AE 16 C8         [ 1] 1975 	ld count,a 
      000BEE                       1976 	_drop VSIZE 
      008C1B CD 83            [ 2]    1     addw sp,#VSIZE 
      008C1D 20 90            [ 1] 1977 	ld a,#CR
      008C1F AE 16 C8         [ 4] 1978 	call putc
      008C22 9F               [ 4] 1979 	ret
                                   1980 
                           000001  1981 .if DEBUG 	
                                   1982 ;----------------------------
                                   1983 ; command interface
                                   1984 ; only 3 commands:
                                   1985 ;  'q' to resume application
                                   1986 ;  'p [addr]' to print memory values 
                                   1987 ;  's addr' to print string 
                                   1988 ;----------------------------
                                   1989 ;local variable 
                           000001  1990 	PSIZE=1
                           000001  1991 	VSIZE=1 
      000BF6                       1992 cmd_itf:
      008C23 27 CD            [ 2] 1993 	sub sp,#VSIZE 
      008C25 6B 02 AE 16      [ 1] 1994 	clr farptr 
      008C29 C8 CD 82 5E      [ 1] 1995 	clr farptr+1 
      008C2D 0F 01 72 F9      [ 1] 1996 	clr farptr+2  
      000C04                       1997 repl:
      008C31 01 20            [ 1] 1998 	ld a,#CR 
      008C33 BE 01 CB         [ 4] 1999 	call putc 
      008C34 A6 3F            [ 1] 2000 	ld a,#'? 
      008C34 7B 02 CD         [ 4] 2001 	call putc
      008C37 82 78 90 AE      [ 1] 2002 	clr in.w 
      008C3B 16 C8 90 7F      [ 1] 2003 	clr in 
      008C3F 0F 02 20         [ 4] 2004 	call readln
      008C42 AF AE 16 C8      [ 2] 2005 	ldw y,#tib  
      008C43 90 F6            [ 1] 2006 	ld a,(y)
      008C43 0D 02            [ 1] 2007 	jreq repl  
      008C45 27 AB 0A 02      [ 1] 2008 	inc in 
      008C49 90 5A 90         [ 4] 2009 	call to_upper 
      008C4C 7F CD            [ 1] 2010 	cp a,#'Q 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008C4E 82 68            [ 1] 2011 	jrne test_p
      000C2C                       2012 repl_exit:
      008C50 20 A0 16 C8      [ 1] 2013 	clr tib 
      008C52 72 5F 00 03      [ 1] 2014 	clr count 
      008C52 A6 4F 11 02      [ 1] 2015 	clr in 
      000C38                       2016 	_drop #VSIZE 	
      008C56 27 9A            [ 2]    1     addw sp,##VSIZE 
      008C58 7B               [ 4] 2017 	ret  
      000C3B                       2018 invalid:
      008C59 01 90 F7         [ 2] 2019 	ldw x,#invalid_cmd 
      008C5C 0C 02 90         [ 4] 2020 	call puts 
      008C5F 5C 90            [ 2] 2021 	jra repl 
      000C43                       2022 test_p:	
      008C61 7F CD            [ 1] 2023     cp a,#'P 
      008C63 82 4B            [ 1] 2024 	jreq mem_peek
      008C65 20 8B            [ 1] 2025     cp a,#'S 
      008C67 26 F0            [ 1] 2026 	jrne invalid 
      000C4B                       2027 print_string:	
      008C67 90 7F 7B         [ 4] 2028 	call get_token
      008C6A 02 C7            [ 1] 2029 	cp a,#TK_INTGR 
      008C6C 00 04            [ 1] 2030 	jrne invalid 
      008C6E 5B 02 A6         [ 4] 2031 	call puts
      008C71 0D CD 82         [ 2] 2032 	jp repl 	
      000C58                       2033 mem_peek:
      008C74 4B 81            [ 1] 2034 	ld a,#SPACE 
      008C76 CD 10 5E         [ 4] 2035 	call skip  	 
      008C76 52 01 72 5F      [ 2] 2036 	addw y,in.w 
      008C7A 00 13 72         [ 2] 2037 	ldw x,#pad 
      008C7D 5F 00 14         [ 4] 2038 	call strcpy
      008C80 72 5F 00         [ 4] 2039 	call atoi24 	
      008C83 15 00 07         [ 1] 2040 	ld a, acc24 
      008C84 CA 00 08         [ 1] 2041 	or a,acc16 
      008C84 A6 0D CD         [ 1] 2042 	or a,acc8 
      008C87 82 4B            [ 1] 2043 	jrne 1$ 
      008C89 A6 3F            [ 2] 2044 	jra peek_byte  
      008C8B CD 82 4B         [ 2] 2045 1$:	ldw x,acc24 
      008C8E 72 5F 00         [ 2] 2046 	ldw farptr,x 
      008C91 01 72 5F         [ 1] 2047 	ld a,acc8 
      008C94 00 02 CD         [ 1] 2048 	ld farptr+2,a 
      000C83                       2049 peek_byte:
      008C97 8B EC 90         [ 4] 2050 	call print_farptr 
      008C9A AE 16            [ 1] 2051 	ld a,#8 
      008C9C C8 90            [ 1] 2052 	ld (PSIZE,sp),a 
      008C9E F6               [ 1] 2053 	clrw x 
      008C9F 27 E3 72         [ 4] 2054 1$:	call fetchc  
      008CA2 5C               [ 2] 2055 	pushw x 
      008CA3 00 02 CD         [ 1] 2056 	ld acc8,a 
      008CA6 90               [ 1] 2057 	clrw x 
      008CA7 26 A1 51         [ 2] 2058 	ldw acc24,x 
      008CAA 26 17            [ 1] 2059 	ld a,#16+128
      008CAC CD 0A 36         [ 4] 2060 	call prti24
      008CAC 72               [ 2] 2061 	popw x 
      008CAD 5F 16            [ 1] 2062 	dec (PSIZE,sp)
      008CAF C8 72            [ 1] 2063 	jrne 1$ 
      008CB1 5F 00            [ 1] 2064 	ld a,#8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008CB3 04 72 5F         [ 1] 2065 	add a,farptr+2 
      008CB6 00 02 5B         [ 1] 2066 	ld farptr+2,a
      008CB9 01               [ 1] 2067 	clr a 
      008CBA 81 00 13         [ 1] 2068 	adc a,farptr+1 
      008CBB C7 00 13         [ 1] 2069 	ld farptr+1,a 
      008CBB AE               [ 1] 2070 	clr a 
      008CBC 8D 39 CD         [ 1] 2071 	adc a,farptr 
      008CBF 82 5E 20         [ 1] 2072 	ld farptr,a 
      008CC2 C1 0C 04         [ 2] 2073 	jp repl  
                                   2074 
      008CC3 6E 6F 74 20 61 20 63  2075 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   2076 
                                   2077 ;----------------------------
                                   2078 ; display farptr address
                                   2079 ;----------------------------
      000CC8                       2080 print_farptr:
      008CC3 A1 50 27         [ 1] 2081 	ld a ,farptr+2 
      008CC6 11 A1 53         [ 1] 2082 	ld acc8,a 
      008CC9 26 F0 12         [ 2] 2083 	ldw x,farptr 
      008CCB CF 00 07         [ 2] 2084 	ldw acc24,x 
      008CCB CD               [ 1] 2085 	clrw x 
      008CCC 8E 65            [ 1] 2086 	ld a,#16 
      008CCE A1 04 26         [ 4] 2087 	call prti24
      008CD1 E9 CD            [ 1] 2088 	ld a,#SPACE 
      008CD3 82 5E CC         [ 4] 2089 	call putc 
      008CD6 8C 84 CB         [ 4] 2090 	call putc 
      008CD8 81               [ 4] 2091 	ret
                                   2092 
                                   2093 ;------------------------------------
                                   2094 ; get byte at address farptr[X]
                                   2095 ; input:
                                   2096 ;	 farptr   address to peek
                                   2097 ;    X		  farptr index 	
                                   2098 ; output:
                                   2099 ;	 A 		  byte from memory  
                                   2100 ;    x		  incremented by 1
                                   2101 ;------------------------------------
      000CE3                       2102 fetchc: ; @C
      008CD8 A6 20 CD 90      [ 5] 2103 	ldf a,([farptr],x)
      008CDC DE               [ 2] 2104 	incw x
      008CDD 72               [ 4] 2105 	ret
                                   2106 
                                   2107 
                                   2108 ;------------------------------------
                                   2109 ; expect a number from command line 
                                   2110 ; next argument
                                   2111 ;  input:
                                   2112 ;	  none
                                   2113 ;  output:
                                   2114 ;    acc24   int24_t 
                                   2115 ;------------------------------------
      000CE9                       2116 number::
      008CDE B9 00 01         [ 4] 2117 	call get_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008CE1 AE 17 18         [ 4] 2118 	call atoi24
      008CE4 CD               [ 4] 2119 	ret
                                   2120 .endif ; DEBUG 
                                   2121 
                                   2122 ;------------------------------------
                                   2123 ; parse quoted string 
                                   2124 ; input:
                                   2125 ;   Y 	pointer to tib 
                                   2126 ;   X   pointer to pad
                                   2127 ; output:
                                   2128 ;	pad   parsed string
                                   2129 ;   TOS  char* to pad  
                                   2130 ;------------------------------------
                           000001  2131 	PREV = 1
                           000002  2132 	CURR =2 
                           000002  2133 	VSIZE=2 
      000CF0                       2134 parse_quote: ; { -- addr }
      000CF0                       2135 	_vars VSIZE 
      008CE5 83 3E            [ 2]    1     sub sp,#VSIZE 
      008CE7 CD               [ 1] 2136 	clr a
      008CE8 90 32            [ 1] 2137 1$:	ld (PREV,sp),a 
      008CEA C6 00 08 CA      [ 1] 2138 2$:	inc in
      008CEE 00 09 CA         [ 4] 2139 	ld a,([in.w],y)
      008CF1 00 0A            [ 1] 2140 	jreq 6$
      008CF3 26 02            [ 1] 2141 	ld (CURR,sp),a 
      008CF5 20 0C            [ 1] 2142 	ld a,#'\
      008CF7 CE 00            [ 1] 2143 	cp a, (PREV,sp)
      008CF9 08 CF            [ 1] 2144 	jrne 3$
      008CFB 00 13            [ 1] 2145 	clr (PREV,sp)
      008CFD C6 00            [ 1] 2146 	ld a,(CURR,sp)
      008CFF 0A C7            [ 4] 2147 	callr convert_escape
      008D01 00               [ 1] 2148 	ld (x),a 
      008D02 15               [ 2] 2149 	incw x 
      008D03 20 E5            [ 2] 2150 	jra 2$
      000D10                       2151 3$:
      008D03 CD 8D            [ 1] 2152 	ld a,(CURR,sp)
      008D05 48 A6            [ 1] 2153 	cp a,#'\'
      008D07 08 6B            [ 1] 2154 	jreq 1$
      008D09 01 5F            [ 1] 2155 	cp a,#'"
      008D0B CD 8D            [ 1] 2156 	jreq 5$ 
      008D0D 63               [ 1] 2157 	ld (x),a 
      008D0E 89               [ 2] 2158 	incw x 
      008D0F C7 00            [ 2] 2159 	jra 2$
      008D11 0A 5F CF 00      [ 1] 2160 5$:	inc in 
      008D15 08               [ 1] 2161 6$: clr (x)
      008D16 A6 90 CD         [ 2] 2162 	ldw x,#pad 
      000D26                       2163 	_drop VSIZE
      008D19 8A B6            [ 2]    1     addw sp,#VSIZE 
      008D1B 85 0A            [ 1] 2164 	ld a,#TK_QSTR  
      008D1D 01               [ 4] 2165 	ret 
                                   2166 
                                   2167 ;---------------------------------------
                                   2168 ; called by parse_quote
                                   2169 ; subtitute escaped character 
                                   2170 ; by their ASCII value .
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2171 ; input:
                                   2172 ;   A  character following '\'
                                   2173 ; output:
                                   2174 ;   A  substitued char or same if not valid.
                                   2175 ;---------------------------------------
      000D2B                       2176 convert_escape:
      008D1E 26               [ 2] 2177 	pushw x 
      008D1F EB A6 08         [ 2] 2178 	ldw x,#escaped 
      008D22 CB               [ 1] 2179 1$:	cp a,(x)
      008D23 00 15            [ 1] 2180 	jreq 2$
      008D25 C7               [ 1] 2181 	tnz (x)
      008D26 00 15            [ 1] 2182 	jreq 3$
      008D28 4F               [ 2] 2183 	incw x 
      008D29 C9 00            [ 2] 2184 	jra 1$
      008D2B 14 C7 00         [ 2] 2185 2$: subw x,#escaped 
      008D2E 14               [ 1] 2186 	ld a,xl 
      008D2F 4F C9            [ 1] 2187 	add a,#7
      008D31 00               [ 2] 2188 3$:	popw x 
      008D32 13               [ 4] 2189 	ret 
                                   2190 
      008D33 C7 00 13 CC 8C 84 6E  2191 escaped: .asciz "abtnvfr"
             6F
                                   2192 
                                   2193 ;-------------------------
                                   2194 ; integer parser 
                                   2195 ; input:
                                   2196 ;   X 		point to pad 
                                   2197 ;   Y 		point to tib 
                                   2198 ;   A 	    first digit|'$' 
                                   2199 ; output:  
                                   2200 ;   pad     number string 
                                   2201 ;   X 		integer 
                                   2202 ;   A 		TK_INTGR
                                   2203 ;-------------------------
                           000001  2204 	BASE=1
                           000002  2205 	TCHAR=2 
                           000002  2206 	VSIZE=2 
      000D48                       2207 parse_integer: ; { -- n }
      008D3B 74 20            [ 1] 2208 	push #0 ; TCHAR 
      008D3D 61 20            [ 1] 2209 	cp a,#'$
      008D3F 63 6F            [ 1] 2210 	jreq 1$ 
      008D41 6D 6D            [ 1] 2211 	push #10 ; BASE=10 
      008D43 61 6E            [ 2] 2212 	jra 2$ 
      008D45 64 0A            [ 1] 2213 1$: push #16  ; BASE=16
      008D47 00               [ 1] 2214 2$:	ld (x),a 
      008D48 5C               [ 2] 2215 	incw x 
      008D48 C6 00 15 C7      [ 1] 2216 	inc in 
      008D4C 00 0A CE         [ 4] 2217 	ld a,([in.w],y)
      008D4F 00 13 CF         [ 4] 2218 	call to_upper 
      008D52 00 08            [ 1] 2219 	ld (TCHAR,sp),a 
      008D54 5F A6 10         [ 4] 2220 	call is_digit 
      008D57 CD 8A            [ 1] 2221 	jrc 2$
      008D59 B6 A6            [ 1] 2222 	ld a,#16 
      008D5B 20 CD            [ 1] 2223 	cp a,(BASE,sp)
      008D5D 82 4B            [ 1] 2224 	jrne 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008D5F CD 82            [ 1] 2225 	ld a,(TCHAR,sp)
      008D61 4B 81            [ 1] 2226 	cp a,#'A 
      008D63 2B 04            [ 1] 2227 	jrmi 3$ 
      008D63 92 AF            [ 1] 2228 	cp a,#'G 
      008D65 00 13            [ 1] 2229 	jrmi 2$ 
      008D67 5C               [ 1] 2230 3$:	clr (x)
      008D68 81 0F B2         [ 4] 2231 	call atoi24
      008D69 CE 00 08         [ 2] 2232 	ldw x,acc16 
      008D69 CD 8E            [ 1] 2233 	ld a,#TK_INTGR
      000D80                       2234 	_drop VSIZE  
      008D6B 65 CD            [ 2]    1     addw sp,#VSIZE 
      008D6D 90               [ 4] 2235 	ret 	
                                   2236 
                                   2237 ;-------------------------
                                   2238 ; binary integer parser 
                                   2239 ; input:
                                   2240 ;   X 		point to pad 
                                   2241 ;   Y 		point to tib 
                                   2242 ;   A 	    '%' 
                                   2243 ; output:  
                                   2244 ;   pad     number string 
                                   2245 ;   X 		integer 
                                   2246 ;   A 		TK_INTGR
                                   2247 ;   TOS     integer 
                                   2248 ;-------------------------
                           000001  2249 	BINARY=1
                           000002  2250 	VSIZE=2
      000D83                       2251 parse_binary: ; { -- n }
      008D6E 32 81            [ 1] 2252 	push #0
      008D70 4B 00            [ 1] 2253 	push #0
      008D70 52               [ 1] 2254 1$: ld (x),a 
      008D71 02               [ 2] 2255 	incw x 
      008D72 4F 6B 01 72      [ 1] 2256 	inc in 
      008D76 5C 00 02         [ 4] 2257 	ld a,([in.w],y)
      008D79 91 D6            [ 1] 2258 	cp a,#'0 
      008D7B 01 27            [ 1] 2259 	jreq 2$
      008D7D 24 6B            [ 1] 2260 	cp a,#'1 
      008D7F 02 A6            [ 1] 2261 	jreq 2$ 
      008D81 5C 11            [ 2] 2262 	jra bin_exit 
      008D83 01 26            [ 1] 2263 2$: sub a,#'0	
      008D85 0A               [ 1] 2264 	rrc a 
      008D86 0F 01            [ 1] 2265 	rlc (BINARY+1,sp)
      008D88 7B 02            [ 1] 2266 	rlc (BINARY,sp)
      008D8A AD 1F            [ 2] 2267 	jra 1$  
      000DA3                       2268 bin_exit:
      008D8C F7               [ 1] 2269 	clr (x)
      008D8D 5C 20            [ 2] 2270 	ldw x,(BINARY,sp)
      008D8F E5 04            [ 1] 2271 	ld a,#TK_INTGR 	
      008D90                       2272 	_drop VSIZE 
      008D90 7B 02            [ 2]    1     addw sp,#VSIZE 
      008D92 A1               [ 4] 2273 	ret
                                   2274 
                                   2275 ;---------------------------
                                   2276 ;  token begin with a letter,
                                   2277 ;  is keyword or variable. 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2278 ; input:
                                   2279 ;   X 		point to pad 
                                   2280 ;   Y 		point to text
                                   2281 ;   A 	    first letter  
                                   2282 ; output:
                                   2283 ;   X		exec_addr|var_addr 
                                   2284 ;   A 		TK_CMD 
                                   2285 ;   pad 	keyword|var_name  
                                   2286 ;   TOS     exec_addr|var_addr 
                                   2287 ;--------------------------  
      000DAB                       2288 parse_keyword: ; { -- exec_addr|var_addr}
      008D93 5C 27 DD         [ 4] 2289 	call to_upper 
      008D96 A1               [ 1] 2290 	ld (x),a 
      008D97 22               [ 2] 2291 	incw x 
      008D98 27 04 F7 5C      [ 1] 2292 	inc in 
      008D9C 20 D7 72         [ 4] 2293 	ld a,([in.w],y)
      008D9F 5C 00 02         [ 4] 2294 	call is_alpha 
      008DA2 7F AE            [ 1] 2295 	jrc parse_keyword 
      008DA4 17               [ 1] 2296 1$: clr (x)
      008DA5 18 5B 02 A6      [ 1] 2297 	tnz pad+1 
      008DA9 0A 81            [ 1] 2298 	jrne 2$
                                   2299 ; one letter variable name 
      008DAB C6 17 18         [ 1] 2300 	ld a,pad 
      008DAB 89 AE            [ 1] 2301 	sub a,#'A 
      008DAD 8D               [ 1] 2302 	sll a 
      008DAE C0               [ 1] 2303 	push a 
      008DAF F1 27            [ 1] 2304 	push #0
      008DB1 06 7D 27         [ 2] 2305 	ldw x,#vars 
      008DB4 09 5C 20         [ 2] 2306 	addw x,(1,sp) ; X=var address 
      000DD2                       2307 	_drop 2 
      008DB7 F7 1D            [ 2]    1     addw sp,#2 
      008DB9 8D C0            [ 1] 2308 	ld a,#TK_VAR 
      008DBB 9F AB            [ 2] 2309 	jra 4$ 
      000DD8                       2310 2$: ; check for keyword, otherwise syntax error.
      000DD8                       2311 	_ldx_dict kword_dict
      008DBD 07 85 81         [ 2]    1     ldw x,#kword_dict+2
      008DC0 61 62 74         [ 4] 2312 	call search_dict
      008DC3 6E               [ 1] 2313 	tnz a
      008DC4 76 66            [ 1] 2314 	jrne 4$ 
      008DC6 72 00 89         [ 2] 2315 	jp syntax_error
      008DC8 81               [ 4] 2316 4$:	ret  	
                                   2317 
                                   2318 
                                   2319 ;------------------------------------
                                   2320 ; Command line tokenizer
                                   2321 ; scan text for next token
                                   2322 ; move token in 'pad'
                                   2323 ; input: 
      000DE5                       2324 	none: 
                                   2325 ; use:
                                   2326 ;	Y   pointer to text
                                   2327 ;   X	pointer to pad 
                                   2328 ;   in.w   index in text buffer
                                   2329 ; output:
                                   2330 ;   A       token attribute 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2331 ;   pad 	token as .asciz
                                   2332 ;   X 		token value   
                                   2333 ;------------------------------------
                                   2334 	; use to check special character 
                                   2335 	.macro _case c t  
                                   2336 	ld a,#c 
                                   2337 	cp a,(TCHAR,sp) 
                                   2338 	jrne t
                                   2339 	.endm 
                                   2340 
                           000001  2341 	TCHAR=1
                           000002  2342 	ATTRIB=2 
                           000002  2343 	VSIZE=2
      000DE5                       2344 get_token: 
      008DC8 4B 00 A1 24      [ 2] 2345 	ldw y,#tib    	
      008DCC 27 04 4B         [ 1] 2346 	ld a,in 
      008DCF 0A 20 02         [ 1] 2347 	cp a,count 
      008DD2 4B 10            [ 1] 2348 	jrmi 1$
      008DD4 F7 5C            [ 1] 2349 	ld a,#TK_NONE 
      008DD6 72               [ 4] 2350 	ret 
      000DF4                       2351 1$:	
      000DF4                       2352 	_vars VSIZE
      008DD7 5C 00            [ 2]    1     sub sp,#VSIZE 
      008DD9 02 91 D6         [ 2] 2353 	ldw x, #pad
      008DDC 01 CD            [ 1] 2354 	ld a,#SPACE
      008DDE 90 26 6B         [ 4] 2355 	call skip
      008DE1 02 CD 90 1D 25   [ 1] 2356 	mov in.saved,in 
      008DE6 ED A6 10         [ 4] 2357 	ld a,([in.w],y)
      008DE9 11 01            [ 1] 2358 	jrne str_tst
      008DEB 26 0A 7B 02      [ 1] 2359 	clr pad 
      008DEF A1 41 2B         [ 2] 2360 	jp token_exit ; end of line 
                                   2361 
      000E0F                       2362 str_tst: ; check for quoted string  	
      008DF2 04 A1 47         [ 4] 2363 	call to_upper 
      008DF5 2B DD            [ 1] 2364 	ld (TCHAR,sp),a 
      000E14                       2365 	_case '"' nbr_tst
      008DF7 7F CD            [ 1]    1 	ld a,#'"' 
      008DF9 90 32            [ 1]    2 	cp a,(TCHAR,sp) 
      008DFB CE 00            [ 1]    3 	jrne nbr_tst
      008DFD 09 A6 04         [ 4] 2366 	call parse_quote
      008E00 5B 02 81         [ 2] 2367 	jp token_exit
      008E03                       2368 nbr_tst: ; check for number 
      008E03 4B 00            [ 1] 2369 	ld a,#'$'
      008E05 4B 00            [ 1] 2370 	cp a,(TCHAR,sp) 
      008E07 F7 5C            [ 1] 2371 	jreq 1$
      008E09 72 5C            [ 1] 2372 	ld a,#'&
      008E0B 00 02            [ 1] 2373 	cp a,(TCHAR,sp)
      008E0D 91 D6            [ 1] 2374 	jrne 0$
      008E0F 01 A1 30         [ 4] 2375 	call parse_binary ; expect binary integer 
      008E12 27 06 A1         [ 2] 2376 	jp token_exit 
      008E15 31 27            [ 1] 2377 0$:	ld a,(TCHAR,sp)
      008E17 02 20 09         [ 4] 2378 	call is_digit
      008E1A A0 30            [ 1] 2379 	jrnc 3$
      008E1C 46 09 02         [ 4] 2380 1$:	call parse_integer 
      008E1F 09 01 20         [ 2] 2381 	jp token_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      000E3F                       2382 3$: 
      000E3F                       2383 	_case '(' bkslsh_tst 
      008E22 E4 28            [ 1]    1 	ld a,#'(' 
      008E23 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E23 7F 1E            [ 1]    3 	jrne bkslsh_tst
      008E25 01 A6            [ 1] 2384 	ld a,#TK_LPAREN
      008E27 04 5B 02         [ 2] 2385 	jp token_char   	
      000E4A                       2386 bkslsh_tst: ; character token 
      000E4A                       2387 	_case '\',rparnt_tst
      008E2A 81 5C            [ 1]    1 	ld a,#'\' 
      008E2B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E2B CD 90            [ 1]    3 	jrne rparnt_tst
      008E2D 26 F7            [ 1] 2388 	ld a,(TCHAR,sp)
      008E2F 5C               [ 1] 2389 	ld (x),a 
      008E30 72               [ 2] 2390 	incw x 
      008E31 5C 00 02 91      [ 1] 2391 	inc in 
      008E35 D6 01 CD         [ 4] 2392 	ld a,([in.w],y)
      008E38 85               [ 1] 2393 	ld (x),a 
      008E39 A3               [ 2] 2394 	incw x 
      008E3A 25 EF 7F 72      [ 1] 2395 	inc in  
      008E3E 5D               [ 1] 2396 	clr (x) 
      008E3F 17               [ 1] 2397 	ld xl,a 
      008E40 19 26            [ 1] 2398 	ld a,#TK_CHAR 
      008E42 15 C6 17         [ 2] 2399 	jp token_exit 
      000E68                       2400 rparnt_tst:		
      000E68                       2401 	_case ')' colon_tst 
      008E45 18 A0            [ 1]    1 	ld a,#')' 
      008E47 41 48            [ 1]    2 	cp a,(TCHAR,sp) 
      008E49 88 4B            [ 1]    3 	jrne colon_tst
      008E4B 00 AE            [ 1] 2402 	ld a,#TK_RPAREN 
      008E4D 00 25 72         [ 2] 2403 	jp token_char 
      000E73                       2404 colon_tst:
      000E73                       2405 	_case ':' comma_tst 
      008E50 FB 01            [ 1]    1 	ld a,#':' 
      008E52 5B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008E54 A6 05            [ 1]    3 	jrne comma_tst
      008E56 20 0C            [ 1] 2406 	ld a,#TK_COLON 
      008E58 CC 0F 8A         [ 2] 2407 	jp token_char 
      000E7E                       2408 comma_tst:
      000E7E                       2409 	_case COMMA sharp_tst 
      008E58 AE A6            [ 1]    1 	ld a,#COMMA 
      008E5A F1 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008E5C 92 C3            [ 1]    3 	jrne sharp_tst
      008E5E 4D 26            [ 1] 2410 	ld a,#TK_COMMA
      008E60 03 CC 88         [ 2] 2411 	jp token_char
      000E89                       2412 sharp_tst:
      000E89                       2413 	_case SHARP dash_tst 
      008E63 09 81            [ 1]    1 	ld a,#SHARP 
      008E65 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E65 26 05            [ 1]    3 	jrne dash_tst
      008E65 90 AE            [ 1] 2414 	ld a,#TK_SHARP
      008E67 16 C8 C6         [ 2] 2415 	jp token_char  	 	 
      000E94                       2416 dash_tst: 	
      000E94                       2417 	_case '-' at_tst 
      008E6A 00 02            [ 1]    1 	ld a,#'-' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E6C C1 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008E6E 04 2B            [ 1]    3 	jrne at_tst
      008E70 03 A6            [ 1] 2418 	ld a,#TK_MINUS  
      008E72 00 81 8A         [ 2] 2419 	jp token_char 
      008E74                       2420 at_tst:
      000E9F                       2421 	_case '@' qmark_tst 
      008E74 52 02            [ 1]    1 	ld a,#'@' 
      008E76 AE 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008E78 18 A6            [ 1]    3 	jrne qmark_tst
      008E7A 20 CD            [ 1] 2422 	ld a,#TK_ARRAY 
      008E7C 90 DE 55         [ 2] 2423 	jp token_char
      000EAA                       2424 qmark_tst:
      000EAA                       2425 	_case '?' tick_tst 
      008E7F 00 02            [ 1]    1 	ld a,#'?' 
      008E81 00 03            [ 1]    2 	cp a,(TCHAR,sp) 
      008E83 91 D6            [ 1]    3 	jrne tick_tst
      008E85 01 26            [ 1] 2426 	ld a,(TCHAR,sp)
      008E87 07               [ 1] 2427 	ld (x),a 
      008E88 72               [ 2] 2428 	incw x 
      008E89 5F               [ 1] 2429 	clr (x)
      008E8A 17 18 CC 90      [ 1] 2430 	inc in 
      008E8E 1A 06            [ 1] 2431 	ld a,#TK_CMD 
      008E8F AE 16 F3         [ 2] 2432 	ldw x,#print 
      008E8F CD 90 26         [ 2] 2433 	jp token_exit
      000EC1                       2434 tick_tst: ; ignore comment 
      000EC1                       2435 	_case TICK plus_tst 
      008E92 6B 01            [ 1]    1 	ld a,#TICK 
      008E94 A6 22            [ 1]    2 	cp a,(TCHAR,sp) 
      008E96 11 01            [ 1]    3 	jrne plus_tst
      008E98 26 06 CD 8D      [ 1] 2436 	inc in 
      008E9C 70 CC            [ 1] 2437 	ld a,#TK_CMD 
      008E9E 90 1A EF         [ 2] 2438 	ldw x,#rem 
      008EA0 CC 0F 9A         [ 2] 2439 	jp token_exit 
      000ED3                       2440 plus_tst:
      000ED3                       2441 	_case '+' star_tst 
      008EA0 A6 24            [ 1]    1 	ld a,#'+' 
      008EA2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EA4 27 13            [ 1]    3 	jrne star_tst
      008EA6 A6 26            [ 1] 2442 	ld a,#TK_PLUS  
      008EA8 11 01 26         [ 2] 2443 	jp token_char 
      000EDE                       2444 star_tst:
      000EDE                       2445 	_case '*' slash_tst 
      008EAB 06 CD            [ 1]    1 	ld a,#'*' 
      008EAD 8E 03            [ 1]    2 	cp a,(TCHAR,sp) 
      008EAF CC 90            [ 1]    3 	jrne slash_tst
      008EB1 1A 7B            [ 1] 2446 	ld a,#TK_MULT 
      008EB3 01 CD 90         [ 2] 2447 	jp token_char 
      000EE9                       2448 slash_tst: 
      000EE9                       2449 	_case '/' prcnt_tst 
      008EB6 1D 24            [ 1]    1 	ld a,#'/' 
      008EB8 06 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008EBA 8D C8            [ 1]    3 	jrne prcnt_tst
      008EBC CC 90            [ 1] 2450 	ld a,#TK_DIV 
      008EBE 1A 0F 8A         [ 2] 2451 	jp token_char 
      008EBF                       2452 prcnt_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      000EF4                       2453 	_case '%' eql_tst 
      008EBF A6 28            [ 1]    1 	ld a,#'%' 
      008EC1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EC3 26 05            [ 1]    3 	jrne eql_tst
      008EC5 A6 0B            [ 1] 2454 	ld a,#TK_MOD
      008EC7 CC 90 0A         [ 2] 2455 	jp token_char  
                                   2456 ; 1 or 2 character tokens 	
      008ECA                       2457 eql_tst:
      000EFF                       2458 	_case '=' gt_tst 		
      008ECA A6 5C            [ 1]    1 	ld a,#'=' 
      008ECC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008ECE 26 18            [ 1]    3 	jrne gt_tst
      008ED0 7B 01            [ 1] 2459 	ld a,#TK_EQUAL
      008ED2 F7 5C 72         [ 2] 2460 	jp token_char 
      000F0A                       2461 gt_tst:
      000F0A                       2462 	_case '>' lt_tst 
      008ED5 5C 00            [ 1]    1 	ld a,#'>' 
      008ED7 02 91            [ 1]    2 	cp a,(TCHAR,sp) 
      008ED9 D6 01            [ 1]    3 	jrne lt_tst
      008EDB F7 5C            [ 1] 2463 	ld a,#TK_GT 
      008EDD 72 5C            [ 1] 2464 	ld (ATTRIB,sp),a 
      008EDF 00 02 7F 97      [ 1] 2465 	inc in 
      008EE3 A6 03 CC         [ 4] 2466 	ld a,([in.w],y)
      008EE6 90 1A            [ 1] 2467 	cp a,#'=
      008EE8 26 0C            [ 1] 2468 	jrne 1$
      008EE8 A6 29            [ 1] 2469 	ld a,(TCHAR,sp)
      008EEA 11               [ 1] 2470 	ld (x),a
      008EEB 01               [ 2] 2471 	incw x 
      008EEC 26 05            [ 1] 2472 	ld a,#'=
      008EEE A6 0C            [ 1] 2473 	ld (TCHAR,sp),a 
      008EF0 CC 90            [ 1] 2474 	ld a,#TK_GE 
      008EF2 0A 5F            [ 2] 2475 	jra token_char  
      008EF3 A1 3C            [ 1] 2476 1$: cp a,#'<
      008EF3 A6 3A            [ 1] 2477 	jrne 2$
      008EF5 11 01            [ 1] 2478 	ld a,(TCHAR,sp)
      008EF7 26               [ 1] 2479 	ld (x),a
      008EF8 05               [ 2] 2480 	incw x 
      008EF9 A6 01            [ 1] 2481 	ld a,#'<	
      008EFB CC 90            [ 1] 2482 	ld (TCHAR,sp),a 
      008EFD 0A 35            [ 1] 2483 	ld a,#TK_NE 
      008EFE 20 4F            [ 2] 2484 	jra token_char 
      008EFE A6 2C 11 01      [ 1] 2485 2$: dec in
      008F02 26 05            [ 1] 2486 	ld a,(ATTRIB,sp)
      008F04 A6 0D            [ 2] 2487 	jra token_char 
      000F43                       2488 lt_tst:
      000F43                       2489 	_case '<' other
      008F06 CC 90            [ 1]    1 	ld a,#'<' 
      008F08 0A 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F09 26 32            [ 1]    3 	jrne other
      008F09 A6 23            [ 1] 2490 	ld a,#TK_LT 
      008F0B 11 01            [ 1] 2491 	ld (ATTRIB,sp),a 
      008F0D 26 05 A6 0E      [ 1] 2492 	inc in 
      008F11 CC 90 0A         [ 4] 2493 	ld a,([in.w],y)
      008F14 A1 3D            [ 1] 2494 	cp a,#'=
      008F14 A6 2D            [ 1] 2495 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008F16 11 01            [ 1] 2496 	ld a,(TCHAR,sp)
      008F18 26               [ 1] 2497 	ld (x),a 
      008F19 05 A6            [ 1] 2498 	ld a,#'=
      008F1B 11 CC            [ 1] 2499 	ld (TCHAR,sp),a 
      008F1D 90 0A            [ 1] 2500 	ld a,#TK_LE 
      008F1F 20 27            [ 2] 2501 	jra token_char 
      008F1F A6 40            [ 1] 2502 1$: cp a,#'>
      008F21 11 01            [ 1] 2503 	jrne 2$
      008F23 26 05            [ 1] 2504 	ld a,(TCHAR,sp)
      008F25 A6               [ 1] 2505 	ld (x),a 
      008F26 02               [ 2] 2506 	incw x 
      008F27 CC 90            [ 1] 2507 	ld a,#'>
      008F29 0A 01            [ 1] 2508 	ld (TCHAR,sp),a 
      008F2A A6 35            [ 1] 2509 	ld a,#TK_NE 
      008F2A A6 3F            [ 2] 2510 	jra token_char 
      008F2C 11 01 26 11      [ 1] 2511 2$: dec in 
      008F30 7B 01            [ 1] 2512 	ld a,(ATTRIB,sp)
      008F32 F7 5C            [ 2] 2513 	jra token_char 	
      000F7B                       2514 other: ; not a special character 	 
      008F34 7F 72            [ 1] 2515 	ld a,(TCHAR,sp)
      008F36 5C 00 02         [ 4] 2516 	call is_alpha 
      008F39 A6 06            [ 1] 2517 	jrc 30$ 
      008F3B AE 97 73         [ 2] 2518 	jp syntax_error 
      000F85                       2519 30$: 
      008F3E CC 90 1A         [ 4] 2520 	call parse_keyword
      008F41 20 10            [ 2] 2521 	jra token_exit 
      000F8A                       2522 token_char:
      008F41 A6 27            [ 1] 2523 	ld (ATTRIB,sp),a 
      008F43 11 01            [ 1] 2524 	ld a,(TCHAR,sp)
      008F45 26               [ 1] 2525 	ld (x),a 
      008F46 0C               [ 2] 2526 	incw x 
      008F47 72               [ 1] 2527 	clr(x)
      008F48 5C 00 02 A6      [ 1] 2528 	inc in 
      008F4C 06 AE            [ 1] 2529 	ld a,(ATTRIB,sp)
      008F4E 98 6F CC         [ 2] 2530 	ldw x,#pad 
      000F9A                       2531 token_exit:
      000F9A                       2532 	_drop VSIZE 
      008F51 90 1A            [ 2]    1     addw sp,#VSIZE 
      008F53 81               [ 4] 2533 	ret
                                   2534 
                                   2535 
                                   2536 
                                   2537 ;------------------------------------
                                   2538 ; check if character in {'0'..'9'}
                                   2539 ; input:
                                   2540 ;    A  character to test
                                   2541 ; output:
                                   2542 ;    Carry  0 not digit | 1 digit
                                   2543 ;------------------------------------
      000F9D                       2544 is_digit:
      008F53 A6 2B            [ 1] 2545 	cp a,#'0
      008F55 11 01            [ 1] 2546 	jrc 1$
      008F57 26 05            [ 1] 2547     cp a,#'9+1
      008F59 A6               [ 1] 2548 	ccf 
      008F5A 10               [ 1] 2549 1$:	ccf 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008F5B CC               [ 4] 2550     ret
                                   2551 
                                   2552 ;------------------------------------
                                   2553 ; convert alpha to uppercase
                                   2554 ; input:
                                   2555 ;    a  character to convert
                                   2556 ; output:
                                   2557 ;    a  uppercase character
                                   2558 ;------------------------------------
      000FA6                       2559 to_upper::
      008F5C 90 0A            [ 1] 2560 	cp a,#'a
      008F5E 2A 01            [ 1] 2561 	jrpl 1$
      008F5E A6               [ 4] 2562 0$:	ret
      008F5F 2A 11            [ 1] 2563 1$: cp a,#'z	
      008F61 01 26            [ 1] 2564 	jrugt 0$
      008F63 05 A6            [ 1] 2565 	sub a,#32
      008F65 20               [ 4] 2566 	ret
                                   2567 	
                                   2568 ;------------------------------------
                                   2569 ; convert pad content in integer
                                   2570 ; input:
                                   2571 ;    pad		.asciz to convert
                                   2572 ; output:
                                   2573 ;    acc24      int24_t
                                   2574 ;------------------------------------
                                   2575 	; local variables
                           000001  2576 	SIGN=1 ; 1 byte, 
                           000002  2577 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2578 	TEMP=3 ; 1 byte, temporary storage
                           000003  2579 	VSIZE=3 ; 3 bytes reserved for local storage
      000FB2                       2580 atoi24:
      008F66 CC               [ 2] 2581 	pushw x ;save x
      008F67 90 0A            [ 2] 2582 	sub sp,#VSIZE
                                   2583 	; acc24=0 
      008F69 72 5F 00 07      [ 1] 2584 	clr acc24    
      008F69 A6 2F 11 01      [ 1] 2585 	clr acc16
      008F6D 26 05 A6 21      [ 1] 2586 	clr acc8 
      008F71 CC 90 0A         [ 1] 2587 	ld a, pad 
      008F74 27 5A            [ 1] 2588 	jreq atoi_exit
      008F74 A6 25            [ 1] 2589 	clr (SIGN,sp)
      008F76 11 01            [ 1] 2590 	ld a,#10
      008F78 26 05            [ 1] 2591 	ld (BASE,sp),a ; default base decimal
      008F7A A6 22 CC         [ 2] 2592 	ldw x,#pad ; pointer to string to convert
      008F7D 90               [ 1] 2593 	ld a,(x)
      008F7E 0A 47            [ 1] 2594 	jreq 9$  ; completed if 0
      008F7F A1 2D            [ 1] 2595 	cp a,#'-
      008F7F A6 3D            [ 1] 2596 	jrne 1$
      008F81 11 01            [ 1] 2597 	cpl (SIGN,sp)
      008F83 26 05            [ 2] 2598 	jra 2$
      008F85 A6 32            [ 1] 2599 1$: cp a,#'$
      008F87 CC 90            [ 1] 2600 	jrne 3$
      008F89 0A 10            [ 1] 2601 	ld a,#16
      008F8A 6B 02            [ 1] 2602 	ld (BASE,sp),a
      008F8A A6               [ 2] 2603 2$:	incw x
      008F8B 3E               [ 1] 2604 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      000FE4                       2605 3$:	
      008F8C 11 01            [ 1] 2606 	cp a,#'a
      008F8E 26 33            [ 1] 2607 	jrmi 4$
      008F90 A6 31            [ 1] 2608 	sub a,#32
      008F92 6B 02            [ 1] 2609 4$:	cp a,#'0
      008F94 72 5C            [ 1] 2610 	jrmi 9$
      008F96 00 02            [ 1] 2611 	sub a,#'0
      008F98 91 D6            [ 1] 2612 	cp a,#10
      008F9A 01 A1            [ 1] 2613 	jrmi 5$
      008F9C 3D 26            [ 1] 2614 	sub a,#7
      008F9E 0C 7B            [ 1] 2615 	cp a,(BASE,sp)
      008FA0 01 F7            [ 1] 2616 	jrpl 9$
      008FA2 5C A6            [ 1] 2617 5$:	ld (TEMP,sp),a
      008FA4 3D 6B            [ 1] 2618 	ld a,(BASE,sp)
      008FA6 01 A6 33         [ 4] 2619 	call mulu24_8
      008FA9 20 5F            [ 1] 2620 	ld a,(TEMP,sp)
      008FAB A1 3C 26         [ 1] 2621 	add a,acc24+2
      008FAE 0C 7B 01         [ 1] 2622 	ld acc24+2,a
      008FB1 F7               [ 1] 2623 	clr a
      008FB2 5C A6 3C         [ 1] 2624 	adc a,acc24+1
      008FB5 6B 01 A6         [ 1] 2625 	ld acc24+1,a
      008FB8 35               [ 1] 2626 	clr a
      008FB9 20 4F 72         [ 1] 2627 	adc a,acc24
      008FBC 5A 00 02         [ 1] 2628 	ld acc24,a
      008FBF 7B 02            [ 2] 2629 	jra 2$
      008FC1 20 47            [ 1] 2630 9$:	tnz (SIGN,sp)
      008FC3 27 03            [ 1] 2631     jreq atoi_exit
      008FC3 A6 3C 11         [ 4] 2632     call neg_acc24
      001020                       2633 atoi_exit: 
      008FC6 01 26            [ 2] 2634 	addw sp,#VSIZE
      008FC8 32               [ 2] 2635 	popw x ; restore x
      008FC9 A6               [ 4] 2636 	ret
                                   2637 
                                   2638 ;--------------------------------------
                                   2639 ; unsigned multiply uint24_t by uint8_t
                                   2640 ; use to convert numerical string to uint24_t
                                   2641 ; input:
                                   2642 ;	acc24	uint24_t 
                                   2643 ;   A		uint8_t
                                   2644 ; output:
                                   2645 ;   acc24   A*acc24
                                   2646 ;-------------------------------------
                                   2647 ; local variables offset  on sp
                           000003  2648 	U8   = 3   ; A pushed on stack
                           000002  2649 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2650 	OVFH = 1  ; multiplication overflow high byte
                           000003  2651 	VSIZE = 3
      001024                       2652 mulu24_8:
      008FCA 34               [ 2] 2653 	pushw x    ; save X
                                   2654 	; local variables
      008FCB 6B               [ 1] 2655 	push a     ; U8
      008FCC 02               [ 1] 2656 	clrw x     ; initialize overflow to 0
      008FCD 72               [ 2] 2657 	pushw x    ; multiplication overflow
                                   2658 ; multiply low byte.
      008FCE 5C 00 02         [ 1] 2659 	ld a,acc24+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008FD1 91               [ 1] 2660 	ld xl,a
      008FD2 D6 01            [ 1] 2661 	ld a,(U8,sp)
      008FD4 A1               [ 4] 2662 	mul x,a
      008FD5 3D               [ 1] 2663 	ld a,xl
      008FD6 26 0B 7B         [ 1] 2664 	ld acc24+2,a
      008FD9 01               [ 1] 2665 	ld a, xh
      008FDA F7 A6            [ 1] 2666 	ld (OVFL,sp),a
                                   2667 ; multipy middle byte
      008FDC 3D 6B 01         [ 1] 2668 	ld a,acc24+1
      008FDF A6               [ 1] 2669 	ld xl,a
      008FE0 36 20            [ 1] 2670 	ld a, (U8,sp)
      008FE2 27               [ 4] 2671 	mul x,a
                                   2672 ; add overflow to this partial product
      008FE3 A1 3E 26         [ 2] 2673 	addw x,(OVFH,sp)
      008FE6 0C               [ 1] 2674 	ld a,xl
      008FE7 7B 01 F7         [ 1] 2675 	ld acc24+1,a
      008FEA 5C               [ 1] 2676 	clr a
      008FEB A6 3E            [ 1] 2677 	adc a,#0
      008FED 6B 01            [ 1] 2678 	ld (OVFH,sp),a
      008FEF A6               [ 1] 2679 	ld a,xh
      008FF0 35 20            [ 1] 2680 	ld (OVFL,sp),a
                                   2681 ; multiply most signficant byte	
      008FF2 17 72 5A         [ 1] 2682 	ld a, acc24
      008FF5 00               [ 1] 2683 	ld xl, a
      008FF6 02 7B            [ 1] 2684 	ld a, (U8,sp)
      008FF8 02               [ 4] 2685 	mul x,a
      008FF9 20 0F 01         [ 2] 2686 	addw x, (OVFH,sp)
      008FFB 9F               [ 1] 2687 	ld a, xl
      008FFB 7B 01 CD         [ 1] 2688 	ld acc24,a
      008FFE 85 A3            [ 2] 2689     addw sp,#VSIZE
      009000 25               [ 2] 2690 	popw x
      009001 03               [ 4] 2691 	ret
                                   2692 
                                   2693 ;------------------------------------
                                   2694 ; skip character c in text starting from 'in'
                                   2695 ; input:
                                   2696 ;	 y 		point to text buffer
                                   2697 ;    a 		character to skip
                                   2698 ; output:  
                                   2699 ;	'in' ajusted to new position
                                   2700 ;------------------------------------
                           000001  2701 	C = 1 ; local var
      00105E                       2702 skip:
      009002 CC               [ 1] 2703 	push a
      009003 88 09 00         [ 4] 2704 1$:	ld a,([in.w],y)
      009005 27 0A            [ 1] 2705 	jreq 2$
      009005 CD 8E            [ 1] 2706 	cp a,(C,sp)
      009007 2B 20            [ 1] 2707 	jrne 2$
      009009 10 5C 00 01      [ 1] 2708 	inc in
      00900A 20 F1            [ 2] 2709 	jra 1$
      00106E                       2710 2$: _drop 1 
      00900A 6B 02            [ 2]    1     addw sp,#1 
      00900C 7B               [ 4] 2711 	ret
                                   2712 	
                                   2713 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2714 ; restore 'in.w' variable to 
                                   2715 ; its value before last call
                                   2716 ; to get_token.
                                   2717 ;------------------------------
      001071                       2718 unget_token:
      00900D 01 F7 5C 7F 72   [ 1] 2719 	mov in,in.saved
      009012 5C               [ 4] 2720 	ret 
                                   2721 
                                   2722 
                                   2723 ;******************************
                                   2724 ;  data stack manipulation
                                   2725 ;*****************************
                                   2726 ;----------------------	
                                   2727 ; push X on data stack 
                                   2728 ; input:
                                   2729 ;	X 
                                   2730 ; output:
                                   2731 ;	none 
                                   2732 ;----------------------	
      001077                       2733 dpush:
      001077                       2734     _dp_down
      009013 00 02 7B 02      [ 1]    1     dec dstkptr+1 
      009017 AE 17 18 19      [ 1]    2     dec dstkptr+1
      00901A 72 CF 00 18      [ 5] 2735     ldw [dstkptr],x  
      00901A 5B               [ 4] 2736 	ret 
                                   2737 
                                   2738 
                                   2739 ;----------------------	
                                   2740 ; pop data stack in X 
                                   2741 ; input:
                                   2742 ;	none
                                   2743 ; output:
                                   2744 ;	X   
                                   2745 ;----------------------	
      001084                       2746 dpop: 
      00901B 02 81 00 18      [ 5] 2747     ldw x, [dstkptr]
      00901D                       2748 	_dp_up
      00901D A1 30 25 03      [ 1]    1     inc dstkptr+1
      009021 A1 3A 8C 8C      [ 1]    2     inc dstkptr+1
      009025 81               [ 4] 2749 	ret 
                                   2750 
                                   2751 ;-----------------------------
                                   2752 ; swap top 2 elements of dstack
                                   2753 ;  {n1 n2 -- n2 n1 }
                                   2754 ;-----------------------------
      009026                       2755 dswap:
      009026 A1 61 2A 01      [ 5] 2756 	ldw x,[dstkptr]
      00902A 81               [ 2] 2757 	pushw x 
      00902B A1 7A 22         [ 2] 2758 	ldw x,#2 
      00902E FB A0 20 81      [ 5] 2759 	ldw x,([dstkptr],x) 
      009032 72 CF 00 18      [ 5] 2760 	ldw [dstkptr],x 
      009032 89 52 03         [ 2] 2761 	ldw x,#2
      009035 72 5F            [ 2] 2762 	popw y 
      009037 00 08 72 5F      [ 5] 2763 	ldw ([dstkptr],x),y 
      00903B 00               [ 4] 2764 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2765 
                                   2766 ;-----------------------------
                                   2767 ; drop TOS 
                                   2768 ;-----------------------------
      0010AB                       2769 ddrop: ; { n -- }
      0010AB                       2770 	_dp_up 
      00903C 09 72 5F 00      [ 1]    1     inc dstkptr+1
      009040 0A C6 17 18      [ 1]    2     inc dstkptr+1
      009044 27               [ 4] 2771 	ret
                                   2772 	
                                   2773 ;-----------------------------
                                   2774 ; duplicate TOS 
                                   2775 ;  dstack: { ix...n -- ix...n n }
                                   2776 ;-----------------------------
      0010B4                       2777 ddup:
      009045 5A 0F 01 A6      [ 5] 2778 	ldw x,[dstkptr]
      0010B8                       2779 	_dp_down
      009049 0A 6B 02 AE      [ 1]    1     dec dstkptr+1 
      00904D 17 18 F6 27      [ 1]    2     dec dstkptr+1
      009051 47 A1 2D 26      [ 5] 2780     ldw [dstkptr],x  
      009055 04               [ 4] 2781 	ret 
                                   2782 
                                   2783 
                                   2784 ;----------------------------------
                                   2785 ; pick value n from dstack 
                                   2786 ; put it on TOS
                                   2787 ; dstack: {ix,..,p -- ix,...,np }
                                   2788 ;-----------------------------------
      0010C5                       2789 dpick:
      009056 03 01 20 08      [ 5] 2790 	ldw x,[dstkptr]
      00905A A1               [ 2] 2791 	sllw x 
      00905B 24 26 06 A6      [ 2] 2792 	addw x,dstkptr 
      00905F 10               [ 2] 2793 	ldw x,(x)
      009060 6B 02 5C F6      [ 5] 2794 	ldw [dstkptr],x 
      009064 81               [ 4] 2795 	ret
                                   2796 
                                   2797 ;---------------------------
                                   2798 ;  fetch variable in X 
                                   2799 ;  dstack:{ addr -- value }
                                   2800 ;---------------------------
      0010D4                       2801 fetch:
      009064 A1 61 2B 02      [ 5] 2802 	ldw x,[dstkptr]
      009068 A0               [ 2] 2803 	ldw x,(x)
      009069 20 A1 30 2B      [ 5] 2804 	ldw [dstkptr],x
      00906D 2B               [ 4] 2805 	ret 
                                   2806 
                                   2807 ;----------------------------
                                   2808 ; store variable 
                                   2809 ; dstack: {addr value -- }
                                   2810 ;----------------------------
      0010DE                       2811 store:
      00906E A0 30 A1         [ 4] 2812 	call dpop 
      009071 0A 2B            [ 1] 2813 	ldw y,x   ; y=value 
      009073 06 A0 07         [ 4] 2814 	call dpop 
      009076 11               [ 2] 2815 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      009077 02               [ 4] 2816 	ret 
                                   2817 
                                   2818 ;---------------------------------
                                   2819 ; drop n elements from data stack 
                                   2820 ; input: 
                                   2821 ;   X 		n 
                                   2822 ; output:
                                   2823 ;   none 
                                   2824 ;-------------------------------------
      0010E8                       2825 ddrop_n:
      009078 2A 1F            [ 2] 2826 	pushw y 
      00907A 6B 03 7B 02      [ 2] 2827 	ldw y,dstkptr 
      00907E CD               [ 2] 2828 	sllw x 
      00907F 90               [ 2] 2829 	pushw x 
      009080 A4 7B 03         [ 2] 2830 	addw y,(1,sp)
      009083 CB 00 0A C7      [ 2] 2831 	ldw dstkptr,y 
      009087 00               [ 2] 2832 	popw x 
      009088 0A 4F            [ 2] 2833 	popw y
      00908A C9               [ 4] 2834 	ret 
                                   2835 
      00908B 00 09 C7 00 09 4F C9  2836 dstk_prompt: .asciz "\ndstack: " 
             00 08 C7
                                   2837 ;----------------------------
                                   2838 ; print dstack content 
                                   2839 ;---------------------------
                           000001  2840 	XSAVE=1
                           000002  2841 	VSIZE=2
      001105                       2842 dots:
      001105                       2843 	_vars VSIZE 
      009095 00 08            [ 2]    1     sub sp,#VSIZE 
      009097 20 C9 0D         [ 2] 2844 	ldw x,#dstk_prompt 
      00909A 01 27 03         [ 4] 2845 	call puts
      00909D CD 8B C9         [ 2] 2846 	ldw x,#dstack_empty-CELL_SIZE
      0090A0 35 0A 00 06      [ 1] 2847 	mov base,#10 
      0090A0 5B 03 85         [ 2] 2848 1$:	cpw x,dstkptr 
      0090A3 81 0D            [ 1] 2849 	jrult 4$ 
      0090A4 1F 01            [ 2] 2850 	ldw (XSAVE,sp),x
      0090A4 89               [ 2] 2851 	ldw  x,(x)
      0090A5 88 5F 89         [ 4] 2852 	call print_int 
      0090A8 C6 00            [ 2] 2853 	ldw x,(XSAVE,sp)
      0090AA 0A 97 7B         [ 2] 2854 	subw x,#CELL_SIZE 
      0090AD 03 42            [ 2] 2855 	jra 1$ 
      0090AF 9F C7            [ 1] 2856 4$: ld a,#CR 
      0090B1 00 0A 9E         [ 4] 2857 	call putc 
      00112B                       2858 	_drop VSIZE
      0090B4 6B 02            [ 2]    1     addw sp,#VSIZE 
      0090B6 C6               [ 1] 2859 	clr a 
      0090B7 00               [ 4] 2860 	ret
                                   2861 
      0090B8 09 97 7B 03 42 72 FB  2862 cstk_prompt: .asciz "\ncstack: "
             01 9F C7
                                   2863 ;--------------------------------
                                   2864 ; print cstack content
                                   2865 ;--------------------------------
                           000001  2866 	XSAVE=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                           000002  2867 	VSIZE=2 
      001139                       2868 dotr:
      001139                       2869 	_vars VSIZE 
      0090C2 00 09            [ 2]    1     sub sp,#VSIZE 
      0090C4 4F A9 00         [ 2] 2870 	ldw x,#cstk_prompt
      0090C7 6B 01 9E         [ 4] 2871 	call puts 
      0090CA 6B               [ 1] 2872 	ldw x,sp 
      0090CB 02 C6 00         [ 2] 2873 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      0090CE 08 97            [ 2] 2874 	ldw (XSAVE,sp),x  
      0090D0 7B 03 42         [ 2] 2875 	ldw x,#RAM_SIZE-2
      0090D3 72 FB 01 9F      [ 1] 2876 	mov base,#16
      00114E                       2877 dotr_loop:
      0090D7 C7 00            [ 2] 2878 	cpw x,(XSAVE,sp)
      0090D9 08 5B            [ 1] 2879 	jrmi 9$
      0090DB 03               [ 2] 2880 	pushw x  
      0090DC 85               [ 2] 2881 	ldw x,(x)
      0090DD 81 0A 7E         [ 4] 2882 	call print_int 
      0090DE 85               [ 2] 2883 	popw x  
      0090DE 88 91 D6         [ 2] 2884 	subw x,#CELL_SIZE
      0090E1 01 27            [ 2] 2885 	jra dotr_loop 
      0090E3 0A 11            [ 1] 2886 9$:	ld a,#CR 
      0090E5 01 26 06         [ 4] 2887 	call putc 
      001162                       2888 	_drop VSIZE 
      0090E8 72 5C            [ 2]    1     addw sp,#VSIZE 
      0090EA 00               [ 1] 2889 	clr a 
      0090EB 02               [ 4] 2890 	ret
                                   2891 
                                   2892 
                                   2893 ;--------------------------------
                                   2894 ;  add 2 integers
                                   2895 ;  input:
                                   2896 ;    N1     on cstack 
                                   2897 ;    N2     on cstack 
                                   2898 ;  output:
                                   2899 ;    X 		n2+n1 
                                   2900 ;--------------------------------
                                   2901 	;arugments on cstack 
      001166                       2902 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001166                       2903 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001166                       2904 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001166                       2905 add:
      0090EC 20 F1            [ 2] 2906 	ldw x ,(N2,sp)
      0090EE 5B 01 81         [ 2] 2907 	addw x,(N1,sp)
      0090F1 1F 03            [ 2] 2908 	ldw (N1,sp),x 
      0090F1 55               [ 4] 2909 	ret 
                                   2910 
                                   2911 ;--------------------------------
                                   2912 ;  substract 2 ntegers
                                   2913 ;  input:
                                   2914 ;    N1     on cstack 
                                   2915 ;    N2     on cstack 
                                   2916 ;  output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2917 ;    X 		n2+n1 
                                   2918 ;--------------------------------
      00116E                       2919 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00116E                       2920 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      00116E                       2921 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      00116E                       2922 substract:
      0090F2 00 03            [ 2] 2923 	ldw x,(N2,sp)
      0090F4 00 02 81         [ 2] 2924 	subw x,(N1,sp)
      0090F7 81               [ 4] 2925 	ret 
                                   2926 
                                   2927 ;-------------------------------------
                                   2928 ; multiply 2 integers
                                   2929 ; product overflow is ignored unless
                                   2930 ; MATH_OVF assembler flag is set to 1
                                   2931 ; input:
                                   2932 ;  	N1      on cstack
                                   2933 ;   N2 		on cstack 
                                   2934 ; output:
                                   2935 ;	X        N1*N2 
                                   2936 ;-------------------------------------
                                   2937 	;arguments 
      001174                       2938 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      001174                       2939 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      001174                       2940 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      001174                       2941 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      001174                       2942 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2943    ; local variables 
                           000001  2944 	SIGN=1
                           000002  2945 	PROD=2
                           000003  2946 	VSIZE=3
      001174                       2947 multiply:
      001174                       2948 	_vars VSIZE 
      0090F7 72 5A            [ 2]    1     sub sp,#VSIZE 
      0090F9 00 1A            [ 1] 2949 	clr (SIGN,sp)
      0090FB 72 5A            [ 2] 2950 	ldw x,(N1_HB,sp)
      0090FD 00               [ 1] 2951 	ld a,xh  
      0090FE 1A 72            [ 1] 2952 	bcp a,#0x80 
      009100 CF 00            [ 1] 2953 	jreq 2$
      009102 19 81            [ 1] 2954 	cpl (SIGN,sp)
      009104 50               [ 2] 2955 	negw x 
      009104 72 CE            [ 2] 2956 	ldw (N1_HB,sp),x 
      009106 00 19            [ 2] 2957 2$: ldw x,(N2_HB,sp)
      009108 72               [ 1] 2958 	ld a,xh  
      009109 5C 00            [ 1] 2959 	bcp a,#0x80 
      00910B 1A 72            [ 1] 2960 	jreq 3$
      00910D 5C 00            [ 1] 2961 	cpl (SIGN,sp)
      00910F 1A               [ 2] 2962 	negw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009110 81 08            [ 2] 2963 	ldw (N2_HB,sp),x 
                                   2964 ; N1_LB * N2_LB 	
      009111 7B 07            [ 1] 2965 3$:	ld a,(N1_LB,sp)
      009111 72               [ 1] 2966 	ld xl,a 
      009112 CE 00            [ 1] 2967 	ld a,(N2_LB,sp) 
      009114 19               [ 4] 2968 	mul x,a 
                           000000  2969 .if MATH_OVF 	
                                   2970 	ld a,xh 
                                   2971 	bcp a,#0x80 
                                   2972 	jreq 4$ 
                                   2973 	ld a,#ERR_MATH_OVF 
                                   2974 	jp tb_error
                                   2975 .endif 	 
      009115 89 AE            [ 2] 2976 4$:	ldw (PROD,sp),x
                                   2977 ; N1_LB * N2_HB	 
      009117 00 02            [ 1] 2978 	ld a,(N1_LB,sp) 
      009119 72               [ 1] 2979 	ld xl,a 
      00911A DE 00            [ 1] 2980 	ld a,(N2_HB,sp)
      00911C 19               [ 4] 2981 	mul x,a
      00911D 72               [ 1] 2982 	ld a,xl 
      00911E CF 00            [ 1] 2983 	add a,(PROD,sp)
                           000000  2984 .if MATH_OVF 	
                                   2985 	bcp a,#0x80 
                                   2986 	jreq 5$ 
                                   2987 	ld a,#ERR_MATH_OVF 
                                   2988 	jp tb_error
                                   2989 .endif 	 
      009120 19 AE            [ 1] 2990 5$:	ld (PROD,sp),a 
                                   2991 ; N1_HB * N2_LB 
      009122 00 02            [ 1] 2992 	ld a,(N1_HB,sp)
      009124 90               [ 1] 2993 	ld xl,a 
      009125 85 72            [ 1] 2994 	ld a,(N2_LB,sp)
      009127 DF               [ 4] 2995 	mul x,a 
      009128 00               [ 1] 2996 	ld a,xl 
      009129 19 81            [ 1] 2997 	add a,(PROD,sp)
                           000000  2998 .if MATH_OVF 	
                                   2999 	bcp a,#0x80 
                                   3000 	jreq 6$ 
                                   3001 	ld a,#ERR_MATH_OVF 
                                   3002 	jp tb_error
                                   3003 .endif 	 
      00912B 6B 02            [ 1] 3004 6$:	ld (PROD,sp),a 
                                   3005 ; N1_HB * N2_HB 	
                                   3006 ; it is pointless to multiply N1_HB*N2_HB 
                                   3007 ; as this product is over 65535 or 0 
                                   3008 ;
                                   3009 ; sign adjust product
      00912B 72 5C            [ 1] 3010 	tnz (SIGN,sp)
      00912D 00 1A            [ 1] 3011 	jreq 7$
      00912F 72 5C            [ 2] 3012 	ldw x, (PROD,sp)
      009131 00               [ 2] 3013 	negw x
      009132 1A 81            [ 2] 3014 	ldw (PROD,sp),x  
      009134                       3015 7$: 
      009134 72 CE            [ 2] 3016 	ldw x,(PROD,sp) 
      0011B9                       3017 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      009136 00 19            [ 2]    1     addw sp,#VSIZE 
      009138 72               [ 4] 3018 	ret
                                   3019 
                                   3020 ;----------------------------------
                                   3021 ;  euclidian divide n2/n1 
                                   3022 ; input:
                                   3023 ;    N2 	on cstack
                                   3024 ;    N1 	on cstack
                                   3025 ; output:
                                   3026 ;    X      n2/n1 
                                   3027 ;    Y      remainder 
                                   3028 ;----------------------------------
      0011BC                       3029 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      0011BC                       3030 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      0011BC                       3031 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   3032 	; local variables
                           000001  3033 	SQUOT=1 ; sign quotient
                           000002  3034 	SDIVD=2 ; sign dividend  
                           000002  3035 	VSIZE=2
      0011BC                       3036 divide:
      0011BC                       3037 	_vars VSIZE 
      009139 5A 00            [ 2]    1     sub sp,#VSIZE 
      00913B 1A 72            [ 1] 3038 	clr (SQUOT,sp)
      00913D 5A 00            [ 1] 3039 	clr (SDIVD,sp)
                                   3040 ; check for 0 divisor
      00913F 1A 72            [ 2] 3041 	ldw x,(DIVISR,sp)
      009141 CF               [ 2] 3042 	tnzw x 
      009142 00 19            [ 1] 3043     jrne 0$
      009144 81 04            [ 1] 3044 	ld a,#ERR_DIV0 
      009145 CC 07 8B         [ 2] 3045 	jp tb_error 
                                   3046 ; check divisor sign 	
      009145 72               [ 1] 3047 0$:	ld a,xh 
      009146 CE 00            [ 1] 3048 	bcp a,#0x80 
      009148 19 58            [ 1] 3049 	jreq 1$
      00914A 72 BB            [ 1] 3050 	cpl (SQUOT,sp)
      00914C 00               [ 2] 3051 	negw x 
      00914D 19 FE            [ 2] 3052 1$:	ldw (DIVISR,sp),x
                                   3053 ; check dividend sign 	 
      00914F 72 CF            [ 2] 3054     ldw x,(DIVIDND,sp)
      009151 00               [ 1] 3055 	ld a,xh 
      009152 19 81            [ 1] 3056 	bcp a,#0x80 
      009154 27 05            [ 1] 3057 	jreq 2$ 
      009154 72 CE            [ 1] 3058 	cpl (SQUOT,sp)
      009156 00 19            [ 1] 3059 	cpl (SDIVD,sp)
      009158 FE               [ 2] 3060 	negw x 
      009159 72 CF            [ 2] 3061 2$:	ldw y,(DIVISR,sp)
      00915B 00               [ 2] 3062 	divw x,y
      00915C 19 81 00 08      [ 2] 3063 	ldw acc16,y 
                                   3064 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      00915E 0D 02            [ 1] 3065 	tnz (SDIVD,sp)
      00915E CD 91            [ 1] 3066 	jreq 7$
      009160 04 90            [ 2] 3067 	tnzw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009162 93 CD            [ 1] 3068 	jreq 7$
      009164 91               [ 2] 3069 	incw x
      009165 04 FF            [ 2] 3070 	ldw y,(DIVISR,sp)
      009167 81 B2 00 08      [ 2] 3071 	subw y,acc16
      009168 0D 01            [ 1] 3072 7$: tnz (SQUOT,sp)
      009168 90 89            [ 1] 3073 	jreq 9$ 	 
      00916A 90               [ 2] 3074 8$:	negw x 
      0011FD                       3075 9$: 
      0011FD                       3076 	_drop VSIZE 
      00916B CE 00            [ 2]    1     addw sp,#VSIZE 
      00916D 19               [ 4] 3077 	ret 
                                   3078 
                                   3079 
                                   3080 ;----------------------------------
                                   3081 ;  remainder resulting from euclidian 
                                   3082 ;  division of n2/n1 
                                   3083 ; input:
                                   3084 ;   N1 		cstack 
                                   3085 ;   N2      cstack
                                   3086 ; output:
                                   3087 ;   X       N2%N1 
                                   3088 ;----------------------------------
                           000003  3089 	N1=3
                           000005  3090 	N2=5
                           000004  3091 	VSIZE=4
      001200                       3092 modulo:
      00916E 58 89            [ 2] 3093 	Ldw x,(N1,sp)
      009170 72 F9            [ 2] 3094 	ldw y,(N2,sp)
      001204                       3095 	_vars VSIZE 
      009172 01 90            [ 2]    1     sub sp,#VSIZE 
      009174 CF 00            [ 2] 3096 	ldw (1,sp),x 
      009176 19 85            [ 2] 3097 	ldw (3,sp),y 
      009178 90 85 81         [ 4] 3098 	call divide 
      00917B 0A               [ 1] 3099 	ldw x,y
      00120E                       3100 	_drop VSIZE 
      00917C 64 73            [ 2]    1     addw sp,#VSIZE 
      00917E 74               [ 4] 3101 	ret 
                                   3102 
                                   3103 
                                   3104 ;----------------------------------
                                   3105 ; search in kword_dict command name
                                   3106 ;  from its execution address 
                                   3107 ; input:
                                   3108 ;   X       	execution address 
                                   3109 ; output:
                                   3110 ;   X 			cstr*  | 0 
                                   3111 ;--------------------------------
                           000001  3112 	XADR=1 
                           000003  3113 	LINK=3 
                           000004  3114 	VSIZE=4
      001211                       3115 cmd_name:
      001211                       3116 	_vars VSIZE 
      00917F 61 63            [ 2]    1     sub sp,#VSIZE 
      009181 6B 3A 20 00      [ 1] 3117 	clr acc16 
      009185 1F 01            [ 2] 3118 	ldw (XADR,sp),x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009185 52 02 AE         [ 2] 3119 	ldw x,#kword_dict	
      009188 91 7B            [ 2] 3120 1$:	ldw (LINK,sp),x
      00918A CD 82            [ 1] 3121 	ld a,(2,x)
      00918C 5E AE            [ 1] 3122 	and a,#15 
      00918E 17 7E 35         [ 1] 3123 	ld acc8,a 
      009191 0A 00 07         [ 2] 3124 	addw x,#3
      009194 C3 00 19 25      [ 2] 3125 	addw x,acc16
      009198 0D               [ 2] 3126 	ldw x,(x) ; execution address 
      009199 1F 01            [ 2] 3127 	cpw x,(XADR,sp)
      00919B FE CD            [ 1] 3128 	jreq 2$
      00919D 8A FE            [ 2] 3129 	ldw x,(LINK,sp)
      00919F 1E               [ 2] 3130 	ldw x,(x) 
      0091A0 01 1D 00         [ 2] 3131 	subw x,#2  
      0091A3 02 20            [ 1] 3132 	jrne 1$
      0091A5 EE A6            [ 2] 3133 	jra 9$
      0091A7 0D CD            [ 2] 3134 2$: ldw x,(LINK,sp)
      0091A9 82 4B 5B         [ 2] 3135 	addw x,#2 	
      001240                       3136 9$:	_drop VSIZE
      0091AC 02 4F            [ 2]    1     addw sp,#VSIZE 
      0091AE 81               [ 4] 3137 	ret
                                   3138 
                                   3139 
                                   3140 ;---------------------------------
                                   3141 ; input:
                                   3142 ;	X 		dictionary entry point 
                                   3143 ;  pad		.asciz name to search 
                                   3144 ; output:
                                   3145 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3146 ;  X		execution address | 0 
                                   3147 ;---------------------------------
                           000001  3148 	NLEN=1 ; cmd length 
                           000002  3149 	YSAVE=2
                           000003  3150 	VSIZE=3 
      001243                       3151 search_dict:
      001243                       3152 	_vars VSIZE 
      0091AF 0A 63            [ 2]    1     sub sp,#VSIZE 
      0091B1 73 74            [ 1] 3153 	ldw y,x 
      001247                       3154 search_next:	
      0091B3 61 63            [ 1] 3155 	ld a,(y)
      0091B5 6B 3A            [ 1] 3156 	and a,#0xf 
      0091B7 20 00            [ 1] 3157 	ld (NLEN,sp),a  
      0091B9 AE 17 18         [ 2] 3158 	ldw x,#pad 
      0091B9 52 02            [ 2] 3159 	ldw (YSAVE,sp),y
      0091BB AE 91            [ 2] 3160 	incw y  
      001254                       3161 cp_loop:
      0091BD AF               [ 1] 3162 	ld a,(x)
      0091BE CD 82            [ 1] 3163 	jreq str_match 
      0091C0 5E 96            [ 1] 3164 	tnz (NLEN,sp)
      0091C2 1C 00            [ 1] 3165 	jreq no_match  
      0091C4 07 1F            [ 1] 3166 	cp a,(y)
      0091C6 01 AE            [ 1] 3167 	jrne no_match 
      0091C8 17 FE            [ 2] 3168 	incw y 
      0091CA 35               [ 2] 3169 	incw x
      0091CB 10 00            [ 1] 3170 	dec (NLEN,sp)
      0091CD 07 EE            [ 2] 3171 	jra cp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0091CE                       3172 no_match:
      0091CE 13 01            [ 2] 3173 	ldw y,(YSAVE,sp) 
      0091D0 2B 0B 89 FE      [ 2] 3174 	subw y,#2 ; move Y to link field
      0091D4 CD 8A            [ 1] 3175 	push #TK_NONE 
      0091D6 FE 85            [ 2] 3176 	ldw y,(y) ; next word link 
      0091D8 1D               [ 1] 3177 	pop a ; TK_NONE 
      0091D9 00 02            [ 1] 3178 	jreq search_exit  ; not found  
                                   3179 ;try next 
      0091DB 20 F1            [ 2] 3180 	jra search_next
      001275                       3181 str_match:
      0091DD A6 0D            [ 2] 3182 	ldw y,(YSAVE,sp)
      0091DF CD 82            [ 1] 3183 	ld a,(y)
      0091E1 4B 5B            [ 1] 3184 	ld (NLEN,sp),a ; needed to test keyword type  
      0091E3 02 4F            [ 1] 3185 	and a,#0xf 
                                   3186 ; move y to procedure address field 	
      0091E5 81               [ 1] 3187 	inc a 
      0091E6 C7 00 09         [ 1] 3188 	ld acc8,a 
      0091E6 1E 05 72 FB      [ 1] 3189 	clr acc16 
      0091EA 03 1F 03 81      [ 2] 3190 	addw y,acc16 
      0091EE 90 FE            [ 2] 3191 	ldw y,(y) ; routine entry point 
                                   3192 ;determine keyword type bits 7:6 
      0091EE 1E 05            [ 1] 3193 	ld a,(NLEN,sp)
      0091F0 72               [ 1] 3194 	swap a 
      0091F1 F0 03            [ 1] 3195 	and a,#0xc
      0091F3 81               [ 1] 3196 	srl a
      0091F4 44               [ 1] 3197 	srl a 
      0091F4 52 03            [ 1] 3198 	add a,#6
      001294                       3199 search_exit: 
      0091F6 0F               [ 1] 3200 	ldw x,y ; x=routine address 
      001295                       3201 	_drop VSIZE 	 
      0091F7 01 1E            [ 2]    1     addw sp,#VSIZE 
      0091F9 06               [ 4] 3202 	ret 
                                   3203 
                                   3204 ;---------------------
                                   3205 ; check if next token
                                   3206 ;  is of expected type 
                                   3207 ; input:
                                   3208 ;   A 		 expected token attribute
                                   3209 ;  ouput:
                                   3210 ;   none     if fail call tb_error 
                                   3211 ;--------------------
      001298                       3212 expect:
      0091FA 9E               [ 1] 3213 	push a 
      0091FB A5 80 27         [ 4] 3214 	call next_token 
      0091FE 05 03            [ 1] 3215 	cp a,(1,sp)
      009200 01 50            [ 1] 3216 	jreq 1$
      009202 1F 06 1E         [ 2] 3217 	jp syntax_error
      009205 08               [ 1] 3218 1$: pop a 
      009206 9E               [ 4] 3219 	ret 
                                   3220 
                                   3221 
                                   3222 ;-------------------------------
                                   3223 ; parse embedded BASIC routines 
                                   3224 ; arguments list.
                                   3225 ; arg_list::=  rel[','rel]*
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3226 ; all arguments are of integer type
                                   3227 ; input:
                                   3228 ;   none
                                   3229 ; output:
                                   3230 ;   A 			number of arguments pushed on dstack  
                                   3231 ;--------------------------------
                           000001  3232 	ARG_CNT=1 
      0012A5                       3233 arg_list:
      009207 A5 80            [ 1] 3234 	push #0  
      009209 27 05 03         [ 4] 3235 1$: call relation
      00920C 01 50            [ 1] 3236 	cp a,#TK_NONE 
      00920E 1F 08            [ 1] 3237 	jreq 5$
      009210 7B 07            [ 1] 3238 	cp a,#TK_INTGR
      009212 97 7B            [ 1] 3239 	jrne 4$
      009214 09 42 1F         [ 4] 3240 3$: call dpush 
      009217 02 7B            [ 1] 3241     inc (ARG_CNT,sp)
      009219 07 97 7B         [ 4] 3242 	call next_token 
      00921C 08 42            [ 1] 3243 	cp a,#TK_NONE 
      00921E 9F 1B            [ 1] 3244 	jreq 5$ 
      009220 02 6B            [ 1] 3245 	cp a,#TK_COMMA 
      009222 02 7B            [ 1] 3246 	jrne 4$
      009224 06 97            [ 2] 3247 	jra 1$ 
      009226 7B 09 42         [ 4] 3248 4$:	call unget_token 
      009229 9F               [ 1] 3249 5$:	pop a 
      00922A 1B               [ 4] 3250 	ret 
                                   3251 
                                   3252 
      0012C9                       3253 func_args:
      00922B 02 6B            [ 1] 3254 	ld a,#TK_LPAREN 
      00922D 02 0D 01         [ 4] 3255 	call expect 
      009230 27 05 1E         [ 4] 3256 	call arg_list 
      009233 02               [ 1] 3257 	push a 
      009234 50 1F            [ 1] 3258 	ld a,#TK_RPAREN 
      009236 02 12 98         [ 4] 3259 	call expect 
      009237 84               [ 1] 3260 	pop a 
      009237 1E               [ 4] 3261 	ret 
                                   3262 
                                   3263 
                                   3264 ;--------------------------------
                                   3265 ;   BASIC commnands 
                                   3266 ;--------------------------------
                                   3267 
                                   3268 ;--------------------------------
                                   3269 ;  arithmetic and relational 
                                   3270 ;  routines
                                   3271 ;  operators precedence
                                   3272 ;  highest to lowest
                                   3273 ;  operators on same row have 
                                   3274 ;  same precedence and are executed
                                   3275 ;  from left to right.
                                   3276 ;	'*','/','%'
                                   3277 ;   '-','+'
                                   3278 ;   '=','>','<','>=','<=','<>','><'
                                   3279 ;   '<>' and '><' are equivalent for not equal.
                                   3280 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3281 
                                   3282 ;---------------------
                                   3283 ; return array element
                                   3284 ; address from @(expr)
                                   3285 ; input:
                                   3286 ;   A 		TK_ARRAY
                                   3287 ; output:
                                   3288 ;   A 		TK_INTGR
                                   3289 ;	X 		element address 
                                   3290 ;----------------------
      0012D9                       3291 get_array_element:
      009238 02 5B 03         [ 4] 3292 	call func_args 
      00923B 81 01            [ 1] 3293 	cp a,#1
      00923C 27 03            [ 1] 3294 	jreq 1$
      00923C 52 02 0F         [ 2] 3295 	jp syntax_error
      00923F 01 0F 02         [ 4] 3296 1$: call dpop  
                                   3297 	; check for bounds 
      009242 1E 05 5D         [ 2] 3298 	cpw x,array_size 
      009245 26 05            [ 2] 3299 	jrule 3$
                                   3300 ; bounds {1..array_size}	
      009247 A6 04            [ 1] 3301 2$: ld a,#ERR_BAD_VALUE 
      009249 CC 88 0B         [ 2] 3302 	jp tb_error 
      00924C 9E               [ 2] 3303 3$: tnzw  x
      00924D A5 80            [ 1] 3304 	jreq 2$ 
      00924F 27               [ 2] 3305 	sllw x 
      009250 03               [ 2] 3306 	pushw x 
      009251 03 01 50         [ 2] 3307 	ldw x,#tib
      009254 1F 05 1E         [ 2] 3308 	subw x,(1,sp)
      0012FB                       3309 	_drop 2   
      009257 07 9E            [ 2]    1     addw sp,#2 
      009259 A5 80            [ 1] 3310 	ld a,#TK_INTGR
      00925B 27               [ 4] 3311 	ret 
                                   3312 
                                   3313 ;***********************************
                                   3314 ;   expression parse,execute 
                                   3315 ;***********************************
                                   3316 ;-----------------------------------
                                   3317 ; factor ::= ['+'|'-'|e] var | @ |
                                   3318 ;			 integer | function |
                                   3319 ;			 '('relation')' 
                                   3320 ; output:
                                   3321 ;   A    token attribute 
                                   3322 ;   X 	 integer
                                   3323 ; ---------------------------------
                           000001  3324 	NEG=1
                           000001  3325 	VSIZE=1
      001300                       3326 factor:
      001300                       3327 	_vars VSIZE 
      00925C 05 03            [ 2]    1     sub sp,#VSIZE 
      00925E 01 03 02         [ 4] 3328 	call next_token
      009261 50 16            [ 1] 3329 	cp a,#CMD_END 
      009263 05 65            [ 1] 3330 	jrmi 20$
      009265 90 CF            [ 1] 3331 1$:	ld (NEG,sp),a 
      009267 00 09            [ 1] 3332 	and a,#TK_GRP_MASK
      009269 0D 02            [ 1] 3333 	cp a,#TK_GRP_ADD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00926B 27 0B            [ 1] 3334 	jreq 2$
      00926D 90 5D            [ 1] 3335 	ld a,(NEG,sp)
      00926F 27 07            [ 2] 3336 	jra 4$  
      001315                       3337 2$:	
      009271 5C 16 05         [ 4] 3338 	call next_token 
      001318                       3339 4$:	
      009274 72 B2            [ 1] 3340 	cp a,#TK_IFUNC 
      009276 00 09            [ 1] 3341 	jrne 5$ 
      009278 0D               [ 4] 3342 	call (x) 
      009279 01 27            [ 2] 3343 	jra 18$ 
      00131F                       3344 5$:
      00927B 01 50            [ 1] 3345 	cp a,#TK_INTGR
      00927D 26 02            [ 1] 3346 	jrne 6$
      00927D 5B 02            [ 2] 3347 	jra 18$
      001325                       3348 6$:
      00927F 81 02            [ 1] 3349 	cp a,#TK_ARRAY
      009280 26 06            [ 1] 3350 	jrne 10$
      009280 1E 03 16         [ 4] 3351 	call get_array_element
      009283 05               [ 2] 3352 	ldw x,(x)
      009284 52 04            [ 2] 3353 	jra 18$ 
      00132F                       3354 10$:
      009286 1F 01            [ 1] 3355 	cp a,#TK_VAR 
      009288 17 03            [ 1] 3356 	jrne 11$
      00928A CD               [ 2] 3357 	ldw x,(x)
      00928B 92 3C            [ 2] 3358 	jra 18$
      001336                       3359 11$: 
      00928D 93 5B            [ 1] 3360 	cp a,#TK_CONST 
      00928F 04 81            [ 1] 3361 	jreq 18$
      009291                       3362 12$:			
      009291 52 04            [ 1] 3363 	cp a,#TK_LPAREN
      009293 72 5F            [ 1] 3364 	jrne 16$
      009295 00 09 1F         [ 4] 3365 	call relation
      009298 01               [ 2] 3366 	pushw x 
      009299 AE A6            [ 1] 3367 	ld a,#TK_RPAREN 
      00929B EF 1F 03         [ 4] 3368 	call expect
      00929E E6               [ 2] 3369 	popw x 
      00929F 02 A4            [ 2] 3370 	jra 18$	
      00134A                       3371 16$:
      0092A1 0F C7 00         [ 4] 3372 	call unget_token
      0092A4 0A               [ 1] 3373 	clr a 
      0092A5 1C 00            [ 2] 3374 	jra 20$ 
      001350                       3375 18$: 
      0092A7 03 72            [ 1] 3376 	ld a,#TK_MINUS 
      0092A9 BB 00            [ 1] 3377 	cp a,(NEG,sp)
      0092AB 09 FE            [ 1] 3378 	jrne 19$
      0092AD 13               [ 2] 3379 	negw x
      001357                       3380 19$:
      0092AE 01 27            [ 1] 3381 	ld a,#TK_INTGR
      001359                       3382 20$:
      001359                       3383 	_drop VSIZE
      0092B0 0A 1E            [ 2]    1     addw sp,#VSIZE 
      0092B2 03               [ 4] 3384 	ret
                                   3385 
                                   3386 ;-----------------------------------
                                   3387 ; term ::= factor [['*'|'/'|'%'] factor]* 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3388 ; output:
                                   3389 ;   A    	token attribute 
                                   3390 ;	X		integer
                                   3391 ;-----------------------------------
                           000001  3392 	N1=1
                           000003  3393 	N2=3
                           000005  3394 	MULOP=5
                           000005  3395 	VSIZE=5
      00135C                       3396 term:
      00135C                       3397 	_vars VSIZE
      0092B3 FE 1D            [ 2]    1     sub sp,#VSIZE 
      0092B5 00 02 26         [ 4] 3398 	call factor
      0092B8 E3 20            [ 1] 3399 	cp a,#CMD_END
      0092BA 05 1E            [ 1] 3400 	jrmi term_exit
      001365                       3401 term01:	 ; check for  operator 
      0092BC 03 1C            [ 2] 3402 	ldw (N2,sp),x  ; save first factor 
      0092BE 00 02 5B         [ 4] 3403 	call next_token
      0092C1 04 81            [ 1] 3404 	cp a,#2
      0092C3 2B 34            [ 1] 3405 	jrmi 9$
      0092C3 52 03            [ 1] 3406 0$:	ld (MULOP,sp),a
      0092C5 90 93            [ 1] 3407 	and a,#TK_GRP_MASK
      0092C7 A1 20            [ 1] 3408 	cp a,#TK_GRP_MULT
      0092C7 90 F6            [ 1] 3409 	jreq 1$
      0092C9 A4 0F            [ 1] 3410 	ld a,(MULOP,sp) 
      0092CB 6B 01 AE         [ 4] 3411 	call unget_token 
      0092CE 17 18            [ 2] 3412 	jra 9$
      00137D                       3413 1$:	; got *|/|%
      0092D0 17 02 90         [ 4] 3414 	call factor
      0092D3 5C 04            [ 1] 3415 	cp a,#TK_INTGR
      0092D4 27 03            [ 1] 3416 	jreq 2$ 
      0092D4 F6 27 1E         [ 2] 3417 	jp syntax_error
      0092D7 0D 01            [ 2] 3418 2$:	ldw (N1,sp),x  
      0092D9 27 0B            [ 1] 3419 	ld a,(MULOP,sp) 
      0092DB 90 F1            [ 1] 3420 	cp a,#TK_MULT 
      0092DD 26 07            [ 1] 3421 	jrne 3$
      0092DF 90 5C 5C         [ 4] 3422 	call multiply 
      0092E2 0A 01            [ 2] 3423 	jra term01
      0092E4 20 EE            [ 1] 3424 3$: cp a,#TK_DIV 
      0092E6 26 05            [ 1] 3425 	jrne 4$ 
      0092E6 16 02 72         [ 4] 3426 	call divide 
      0092E9 A2 00            [ 2] 3427 	jra term01 
      0092EB 02 4B 00         [ 4] 3428 4$: call modulo
      0092EE 90 FE            [ 2] 3429 	jra term01 
      0092F0 84 27            [ 2] 3430 9$: ldw x,(N2,sp)  
      0092F2 21 20            [ 1] 3431 	ld a,#TK_INTGR 	
      0013A6                       3432 term_exit:
      0013A6                       3433 	_drop VSIZE 
      0092F4 D2 05            [ 2]    1     addw sp,#VSIZE 
      0092F5 81               [ 4] 3434 	ret 
                                   3435 
                                   3436 ;-------------------------------
                                   3437 ;  expr ::= term [['+'|'-'] term]*
                                   3438 ;  result range {-32768..32767}
                                   3439 ;  output:
                                   3440 ;   A    token attribute 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3441 ;   X	 integer   
                                   3442 ;-------------------------------
                           000001  3443 	N1=1 
                           000003  3444 	N2=3
                           000005  3445 	OP=5 
                           000005  3446 	VSIZE=5 
      0013A9                       3447 expression:
      0013A9                       3448 	_vars VSIZE 
      0092F5 16 02            [ 2]    1     sub sp,#VSIZE 
      0092F7 90 F6 6B         [ 4] 3449 	call term
      0092FA 01 A4            [ 1] 3450 	cp a,#CMD_END 
      0092FC 0F 4C            [ 1] 3451 	jrmi expr_exit 
      0092FE C7 00            [ 2] 3452 0$:	ldw (N2,sp),x 
      009300 0A 72 5F         [ 4] 3453 	call next_token
      009303 00 09            [ 1] 3454 	cp a,#2
      009305 72 B9            [ 1] 3455 	jrmi 9$ 
      009307 00 09            [ 1] 3456 1$:	ld (OP,sp),a  
      009309 90 FE            [ 1] 3457 	and a,#TK_GRP_MASK
      00930B 7B 01            [ 1] 3458 	cp a,#TK_GRP_ADD 
      00930D 4E A4            [ 1] 3459 	jreq 2$ 
      00930F 0C 44            [ 1] 3460 	ld a,(OP,sp)
      009311 44 AB 06         [ 4] 3461 	call unget_token
      009314 20 1C            [ 2] 3462 	jra 9$
      0013CA                       3463 2$: 
      009314 93 5B 03         [ 4] 3464 	call term
      009317 81 04            [ 1] 3465 	cp a,#TK_INTGR 
      009318 27 03            [ 1] 3466 	jreq 3$
      009318 88 CD 88         [ 2] 3467 	jp syntax_error
      00931B BF 11            [ 2] 3468 3$:	ldw (N1,sp),x 
      00931D 01 27            [ 1] 3469 	ld a,(OP,sp)
      00931F 03 CC            [ 1] 3470 	cp a,#TK_PLUS 
      009321 88 09            [ 1] 3471 	jrne 4$
      009323 84 81 66         [ 4] 3472 	call add 
      009325 20 D1            [ 2] 3473 	jra 0$ 
      009325 4B 00 CD         [ 4] 3474 4$:	call substract
      009328 94 6D            [ 2] 3475 	jra 0$
      00932A A1 00            [ 2] 3476 9$: ldw x,(N2,sp)
      00932C 27 19            [ 1] 3477 	ld a,#TK_INTGR	
      0013EA                       3478 expr_exit:
      0013EA                       3479 	_drop VSIZE 
      00932E A1 04            [ 2]    1     addw sp,#VSIZE 
      009330 26               [ 4] 3480 	ret 
                                   3481 
                                   3482 ;---------------------------------------------
                                   3483 ; rel ::= expr rel_op expr
                                   3484 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3485 ;  relation return 1 | 0  for true | false 
                                   3486 ;  output:
                                   3487 ;    A 		token attribute  
                                   3488 ;	 X		1|0
                                   3489 ;---------------------------------------------
                           000001  3490 	N1=1
                           000003  3491 	N2=3
                           000005  3492 	RELOP=5
                           000005  3493 	VSIZE=5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0013ED                       3494 relation: 
      0013ED                       3495 	_vars VSIZE
      009331 12 CD            [ 2]    1     sub sp,#VSIZE 
      009333 90 F7 0C         [ 4] 3496 	call expression
      009336 01 CD            [ 1] 3497 	cp a,#CMD_END  
      009338 88 BF            [ 1] 3498 	jrmi rel_exit 
                                   3499 	; expect rel_op or leave 
      00933A A1 00            [ 2] 3500 	ldw (N2,sp),x 
      00933C 27 09 A1         [ 4] 3501 	call next_token 
      00933F 0D 26            [ 1] 3502 	cp a,#2
      009341 02 20            [ 1] 3503 	jrmi 9$
      0013FF                       3504 1$:	
      009343 E3 CD            [ 1] 3505 	ld (RELOP,sp),a 
      009345 90 F1            [ 1] 3506 	and a,#TK_GRP_MASK
      009347 84 81            [ 1] 3507 	cp a,#TK_GRP_RELOP 
      009349 27 07            [ 1] 3508 	jreq 2$
      009349 A6 0B            [ 1] 3509 	ld a,(RELOP,sp)
      00934B CD 93 18         [ 4] 3510 	call unget_token  
      00934E CD 93            [ 2] 3511 	jra 9$
      00140E                       3512 2$:	; expect another expression or error 
      009350 25 88 A6         [ 4] 3513 	call expression
      009353 0C CD            [ 1] 3514 	cp a,#TK_INTGR 
      009355 93 18            [ 1] 3515 	jreq 3$
      009357 84 81 89         [ 2] 3516 	jp syntax_error 
      009359 1F 01            [ 2] 3517 3$:	ldw (N1,sp),x 
      009359 CD 93 49         [ 4] 3518 	call substract
      00935C A1 01            [ 1] 3519 	jrne 4$
      00935E 27 03 CC 88      [ 1] 3520 	mov acc8,#2 ; n1==n2
      009362 09 CD            [ 2] 3521 	jra 6$ 
      001425                       3522 4$: 
      009364 91 04            [ 1] 3523 	jrsgt 5$  
      009366 C3 00 20 23      [ 1] 3524 	mov acc8,#4 ; n1<2 
      00936A 05 A6            [ 2] 3525 	jra 6$
      00142D                       3526 5$:
      00936C 0A CC 88 0B      [ 1] 3527 	mov acc8,#1 ; n1>n2 
      001431                       3528 6$:
      009370 5D               [ 1] 3529 	clrw x 
      009371 27 F8 58         [ 1] 3530 	ld a, acc8  
      009374 89 AE            [ 1] 3531 	and a,(RELOP,sp)
      009376 16               [ 1] 3532 	tnz a 
      009377 C8 72            [ 1] 3533 	jreq 10$
      009379 F0               [ 2] 3534 	incw x 
      00143B                       3535 7$:	 
      00937A 01 5B            [ 2] 3536 	jra 10$  	
      00937C 02 A6            [ 2] 3537 9$: ldw x,(N2,sp)
      00143F                       3538 10$:
      00937E 04 81            [ 1] 3539 	ld a,#TK_INTGR
      009380                       3540 rel_exit: 	 
      001441                       3541 	_drop VSIZE
      009380 52 01            [ 2]    1     addw sp,#VSIZE 
      009382 CD               [ 4] 3542 	ret 
                                   3543 
                                   3544 ;--------------------------------
                                   3545 ; BASIC: SHOW 
                                   3546 ;  show content of dstack,cstack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3547 ;--------------------------------
      001444                       3548 show:
      009383 88 BF A1         [ 1] 3549 	ld a,base 
      009386 02               [ 1] 3550 	push a 
      009387 2B 50 6B         [ 4] 3551 	call dots
      00938A 01 A4 30         [ 4] 3552 	call dotr 
      00938D A1               [ 1] 3553 	pop a 
      00938E 10 27 04         [ 1] 3554 	ld base,a 
      009391 7B               [ 1] 3555 	clr a 
      009392 01               [ 4] 3556 	ret
                                   3557 
                                   3558 ;--------------------------------------------
                                   3559 ; BASIC: HEX 
                                   3560 ; select hexadecimal base for integer print
                                   3561 ;---------------------------------------------
      001454                       3562 hex_base:
      009393 20 03 00 06      [ 1] 3563 	mov base,#16 
      009395 81               [ 4] 3564 	ret 
                                   3565 
                                   3566 ;--------------------------------------------
                                   3567 ; BASIC: DEC 
                                   3568 ; select decimal base for integer print
                                   3569 ;---------------------------------------------
      001459                       3570 dec_base:
      009395 CD 88 BF 06      [ 1] 3571 	mov base,#10
      009398 81               [ 4] 3572 	ret 
                                   3573 
                                   3574 ;------------------------
                                   3575 ; BASIC: SIZE 
                                   3576 ; return free size in text area
                                   3577 ; output:
                                   3578 ;   A 		TK_INTGR
                                   3579 ;   X 	    size integer
                                   3580 ;--------------------------
      00145E                       3581 size:
      009398 A1 07 26         [ 2] 3582 	ldw x,#tib 
      00939B 03 FD 20 31      [ 2] 3583 	subw x,txtend 
      00939F A6 04            [ 1] 3584 	ld a,#TK_INTGR
      00939F A1               [ 4] 3585 	ret 
                                   3586 
                                   3587 
                                   3588 ;------------------------
                                   3589 ; BASIC: UBOUND  
                                   3590 ; return array variable size 
                                   3591 ; output:
                                   3592 ;   A 		TK_INTGR
                                   3593 ;   X 	    array size 
                                   3594 ;--------------------------
      001468                       3595 ubound:
      0093A0 04 26 02         [ 2] 3596 	ldw x,#tib
      0093A3 20 2B 00 1C      [ 2] 3597 	subw x,txtend 
      0093A5 90 CE 00 04      [ 2] 3598 	ldw y,basicptr 
      0093A5 A1 02 26 06      [ 2] 3599 	cpw y,txtend 
      0093A9 CD 93            [ 1] 3600 	jrult 1$
      0093AB 59 FE 20         [ 1] 3601 	push count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0093AE 21 00            [ 1] 3602 	push #0 
      0093AF 72 F0 01         [ 2] 3603 	subw x,(1,sp)
      001481                       3604 	_drop 2 
      0093AF A1 05            [ 2]    1     addw sp,#2 
      0093B1 26               [ 2] 3605 1$:	srlw x 
      0093B2 03 FE 20         [ 2] 3606 	ldw array_size,x
      0093B5 1A 04            [ 1] 3607 	ld a,#TK_INTGR
      0093B6 81               [ 4] 3608 	ret 
                                   3609 
                                   3610 ;-----------------------------
                                   3611 ; BASIC: LET var=expr 
                                   3612 ; variable assignement 
                                   3613 ; output:
                                   3614 ;   A 		TK_NONE 
                                   3615 ;-----------------------------
      00148A                       3616 let:
      0093B6 A1 09 27         [ 4] 3617 	call next_token 
      0093B9 16 05            [ 1] 3618 	cp a,#TK_VAR 
      0093BA 27 03            [ 1] 3619 	jreq let02
      0093BA A1 0B 26         [ 2] 3620 	jp syntax_error
      001494                       3621 let02:
      0093BD 0C CD 94         [ 4] 3622 	call dpush 
      0093C0 6D 89 A6         [ 4] 3623 	call next_token 
      0093C3 0C CD            [ 1] 3624 	cp a,#TK_EQUAL
      0093C5 93 18            [ 1] 3625 	jreq 1$
      0093C7 85 20 06         [ 2] 3626 	jp syntax_error
      0093CA                       3627 1$:	
      0093CA CD 90 F1         [ 4] 3628 	call relation   
      0093CD 4F 20            [ 1] 3629 	cp a,#TK_INTGR 
      0093CF 09 03            [ 1] 3630 	jreq 2$
      0093D0 CC 07 89         [ 2] 3631 	jp syntax_error
      0014AB                       3632 2$:	
      0093D0 A6 11            [ 1] 3633 	ldw y,x 
      0093D2 11 01 26         [ 4] 3634 	call dpop  
      0093D5 01               [ 2] 3635 	ldw (x),y   
      0093D6 50               [ 4] 3636 	ret 
                                   3637 
                                   3638 ;----------------------------
                                   3639 ; BASIC: LIST [[start][,end]]
                                   3640 ; list program lines 
                                   3641 ; form start to end 
                                   3642 ; if empty argument list then 
                                   3643 ; list all.
                                   3644 ;----------------------------
                           000001  3645 	FIRST=1
                           000003  3646 	LAST=3 
                           000005  3647 	LN_PTR=5
                           000006  3648 	VSIZE=6 
      0093D7                       3649 list:
      0014B2                       3650 	_vars VSIZE
      0093D7 A6 04            [ 2]    1     sub sp,#VSIZE 
      0093D9 CE 00 1A         [ 2] 3651 	ldw x,txtbgn 
      0093D9 5B 01 81         [ 2] 3652 	cpw x,txtend 
      0093DC 2B 03            [ 1] 3653 	jrmi 1$
      0093DC 52 05 CD         [ 2] 3654 	jp list_exit ; nothing to list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0093DF 93 80            [ 2] 3655 1$:	ldw (LN_PTR,sp),x 
      0093E1 A1               [ 2] 3656 	ldw x,(x) 
      0093E2 02 2B            [ 2] 3657 	ldw (FIRST,sp),x ; list from first line 
      0093E4 41 7F FF         [ 2] 3658 	ldw x,#0x7fff ; biggest line number 
      0093E5 1F 03            [ 2] 3659 	ldw (LAST,sp),x 
      0093E5 1F 03 CD         [ 4] 3660 	call arg_list
      0093E8 88               [ 1] 3661 	tnz a
      0093E9 BF A1            [ 1] 3662 	jreq list_start 
      0093EB 02 2B            [ 1] 3663 	cp a,#2 
      0093ED 34 6B            [ 1] 3664 	jreq 4$
      0093EF 05 A4            [ 1] 3665 	cp a,#1 
      0093F1 30 A1            [ 1] 3666 	jreq first_line 
      0093F3 20 27 07         [ 2] 3667 	jp syntax_error 
      0093F6 7B 05 CD         [ 4] 3668 4$:	call dswap
      0014DD                       3669 first_line:
      0093F9 90 F1 20         [ 4] 3670 	call dpop 
      0093FC 25 01            [ 2] 3671 	ldw (FIRST,sp),x 
      0093FD A1 01            [ 1] 3672 	cp a,#1 
      0093FD CD 93            [ 1] 3673 	jreq lines_skip 	
      0014E6                       3674 last_line:
      0093FF 80 A1 04         [ 4] 3675 	call dpop 
      009402 27 03            [ 2] 3676 	ldw (LAST,sp),x 
      0014EB                       3677 lines_skip:
      009404 CC 88 09         [ 2] 3678 	ldw x,txtbgn
      009407 1F 01            [ 2] 3679 2$:	ldw (LN_PTR,sp),x 
      009409 7B 05 A1         [ 2] 3680 	cpw x,txtend 
      00940C 20 26            [ 1] 3681 	jrpl list_exit 
      00940E 05               [ 2] 3682 	ldw x,(x) ;line# 
      00940F CD 91            [ 2] 3683 	cpw x,(FIRST,sp)
      009411 F4 20            [ 1] 3684 	jrpl list_start 
      009413 D1 A1            [ 2] 3685 	ldw x,(LN_PTR,sp) 
      009415 21 26 05         [ 2] 3686 	addw x,#2 
      009418 CD               [ 1] 3687 	ld a,(x)
      009419 92               [ 2] 3688 	incw x 
      00941A 3C 20 C8         [ 1] 3689 	ld acc8,a 
      00941D CD 92 80 20      [ 1] 3690 	clr acc16 
      009421 C3 1E 03 A6      [ 2] 3691 	addw x,acc16
      009425 04 E0            [ 2] 3692 	jra 2$ 
                                   3693 ; print loop
      009426                       3694 list_start:
      009426 5B 05            [ 2] 3695 	ldw x,(LN_PTR,sp)
      009428 81 02            [ 1] 3696 3$:	ld a,(2,x) 
      009429 CD 15 87         [ 4] 3697 	call prt_basic_line
      009429 52 05            [ 2] 3698 	ldw x,(LN_PTR,sp)
      00942B CD 93            [ 1] 3699 	ld a,(2,x)
      00942D DC A1 02         [ 1] 3700 	ld acc8,a 
      009430 2B 38 1F 03      [ 1] 3701 	clr acc16 
      009434 CD 88 BF A1      [ 2] 3702 	addw x,acc16
      009438 02 2B 2B         [ 2] 3703 	cpw x,txtend 
      00943B 6B 05            [ 1] 3704 	jrpl list_exit
      00943D A4 30            [ 2] 3705 	ldw (LN_PTR,sp),x
      00943F A1               [ 2] 3706 	ldw x,(x)
      009440 10 27            [ 2] 3707 	cpw x,(LAST,sp)  
      009442 07 7B            [ 1] 3708 	jrsgt list_exit 
      009444 05 CD            [ 2] 3709 	ldw x,(LN_PTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009446 90 F1            [ 2] 3710 	jra 3$
      001534                       3711 list_exit:
      001534                       3712 	_drop VSIZE 
      009448 20 1C            [ 2]    1     addw sp,#VSIZE 
      00944A 81               [ 4] 3713 	ret
                                   3714 
                                   3715 ;-------------------------
                                   3716 ; print counted string 
                                   3717 ; input:
                                   3718 ;   X 		address of string
                                   3719 ;--------------------------
      001537                       3720 prt_cmd_name:
      00944A CD               [ 1] 3721 	ld a,(x)
      00944B 93               [ 2] 3722 	incw x
      00944C DC A1            [ 1] 3723 	and a,#15  
      00944E 04               [ 1] 3724 	push a 
      00944F 27 03            [ 1] 3725 1$: tnz (1,sp) 
      009451 CC 88            [ 1] 3726 	jreq 9$
      009453 09               [ 1] 3727 	ld a,(x)
      009454 1F 01 7B         [ 4] 3728 	call putc 
      009457 05               [ 2] 3729 	incw x
      009458 A1 10            [ 1] 3730 	dec (1,sp)	 
      00945A 26 05            [ 2] 3731 	jra 1$
      00945C CD               [ 1] 3732 9$: pop a 
      00945D 91               [ 4] 3733 	ret	
                                   3734 
                                   3735 ;--------------------------
                                   3736 ; print TK_QSTR
                                   3737 ; converting control character
                                   3738 ; to backslash sequence
                                   3739 ; input:
                                   3740 ;   X        char *
                                   3741 ;-----------------------------
      00154B                       3742 prt_quote:
      00945E E6 20            [ 1] 3743 	ld a,#'"
      009460 D1 CD 91         [ 4] 3744 	call putc 
      009463 EE               [ 1] 3745 1$:	ld a,(x)
      009464 20 CC            [ 1] 3746 	jreq 9$
      009466 1E               [ 2] 3747 	incw x 
      009467 03 A6            [ 1] 3748 	cp a,#SPACE 
      009469 04 0C            [ 1] 3749 	jrult 3$
      00946A CD 01 CB         [ 4] 3750 	call putc
      00946A 5B 05            [ 1] 3751 	cp a,#'\ 
      00946C 81 F1            [ 1] 3752 	jrne 1$ 
      00946D                       3753 2$:
      00946D 52 05 CD         [ 4] 3754 	call putc 
      009470 94 29            [ 2] 3755 	jra 1$
      009472 A1               [ 1] 3756 3$: push a 
      009473 02 2B            [ 1] 3757 	ld a,#'\
      009475 4B 1F 03         [ 4] 3758 	call putc 
      009478 CD               [ 1] 3759 	pop a 
      009479 88 BF            [ 1] 3760 	sub a,#7
      00947B A1 02 2B         [ 1] 3761 	ld acc8,a 
      00947E 3E 5F 00 08      [ 1] 3762 	clr acc16
      00947F 90 AE 0D 40      [ 2] 3763 	ldw y,#escaped 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00947F 6B 05 A4 30      [ 2] 3764 	addw y,acc16 
      009483 A1 30            [ 1] 3765 	ld a,(y)
      009485 27 07            [ 2] 3766 	jra 2$
      009487 7B 05            [ 1] 3767 9$: ld a,#'"
      009489 CD 90 F1         [ 4] 3768 	call putc 
      00948C 20               [ 2] 3769 	incw x 
      00948D 2F               [ 4] 3770 	ret
                                   3771 
                                   3772 
                                   3773 ;--------------------------
                                   3774 ; decompile line from token list 
                                   3775 ; input:
                                   3776 ;   A       stop at this position 
                                   3777 ;   X 		pointer at line
                                   3778 ; output:
                                   3779 ;   none 
                                   3780 ;--------------------------	
                           000001  3781 	BASE_SAV=1
                           000002  3782 	WIDTH_SAV=2
                           000003  3783 	XSAVE=3
                           000005  3784 	LLEN=5
                           000005  3785 	VSIZE=5 
      00948E                       3786 prt_basic_line:
      001587                       3787 	_vars VSIZE
      00948E CD 94            [ 2]    1     sub sp,#VSIZE 
      009490 29 A1            [ 1] 3788 	ld (LLEN,sp),a  
      009492 04 27 03         [ 1] 3789 	ld a,base
      009495 CC 88            [ 1] 3790 	ld (BASE_SAV,sp),a  
      009497 09 1F 01         [ 1] 3791 	ld a,tab_width 
      00949A CD 91            [ 1] 3792 	ld (WIDTH_SAV,sp),a 
      00949C EE 26 06         [ 2] 3793 	ldw ptr16,x
      00949F 35               [ 2] 3794 	ldw x,(x)
      0094A0 02 00 0A 20      [ 1] 3795 	mov base,#10
      0094A4 0C 05 00 22      [ 1] 3796 	mov tab_width,#5
      0094A5 CD 0A 7E         [ 4] 3797 	call print_int ; print line number 
      0094A5 2C 06            [ 1] 3798 	ld a,#SPACE 
      0094A7 35 04 00         [ 4] 3799 	call putc 
      0094AA 0A 20 04 22      [ 1] 3800 	clr tab_width
      0094AD AE 00 03         [ 2] 3801 	ldw x,#3
      0094AD 35               [ 1] 3802 1$:	ld a,xl 
      0094AE 01 00            [ 1] 3803 	cp a,(LLEN,sp)
      0094B0 0A 03            [ 1] 3804 	jrmi 20$
      0094B1 CC 16 BF         [ 2] 3805 	jp 90$
      0015B8                       3806 20$:	 
      0094B1 5F C6 00 0A      [ 4] 3807 	ld a,([ptr16],x)
      0094B5 14               [ 2] 3808 	incw x 
      0094B6 05 4D            [ 2] 3809 	ldw (XSAVE,sp),x 
      0094B8 27 05            [ 1] 3810 	cp a,#TK_CMD 
      0094BA 5C 44            [ 1] 3811 	jrult 5$
      0094BB A1 09            [ 1] 3812 	cp a,#TK_CONST 
      0094BB 20 02            [ 1] 3813 	jrugt 4$
      0015C7                       3814 2$:	
      0094BD 1E 03 00 13      [ 5] 3815 	ldw x,([ptr16],x)
      0094BF A3 17 EF         [ 2] 3816 	cpw x,#rem 
      0094BF A6 04            [ 1] 3817 	jrne 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0094C1 A6 27            [ 1] 3818 	ld a,#''
      0094C1 5B 05 81         [ 4] 3819 	call putc 
      0094C4 1E 03            [ 2] 3820 	ldw x,(XSAVE,sp)
      0094C4 C6 00 07         [ 2] 3821 	addw x,#2
      0094C7 88 CD 91 85      [ 2] 3822 	addw x,ptr16  
      0094CB CD 91 B9         [ 4] 3823 	call puts 
      0094CE 84 C7 00         [ 2] 3824 	jp 90$ 
      0094D1 07 4F 81         [ 4] 3825 3$:	call cmd_name
      0094D4 CD 15 37         [ 4] 3826 	call prt_cmd_name
      0094D4 35 10            [ 1] 3827 	ld a,#SPACE 
      0094D6 00 07 81         [ 4] 3828 	call putc 
      0094D9 1E 03            [ 2] 3829 	ldw x,(XSAVE,sp)
      0094D9 35 0A 00         [ 2] 3830 	addw x,#2
      0094DC 07 81            [ 2] 3831 	jra 1$
      0094DE A1 0A            [ 1] 3832 4$: cp a,#TK_QSTR 
      0094DE AE 16            [ 1] 3833 	jrne 5$
      0094E0 C8 72 B0 00      [ 2] 3834 	addw x,ptr16
      0094E4 1D A6 04         [ 4] 3835 	call prt_quote 
      0094E7 81 B0 00 13      [ 2] 3836 	subw x,ptr16  
      0094E8 20 A9            [ 2] 3837 	jra 1$
      0094E8 AE 16            [ 1] 3838 5$:	cp a,#TK_VAR
      0094EA C8 72            [ 1] 3839 	jrne 6$ 
      0094EC B0 00 1D 90      [ 5] 3840 	ldw x,([ptr16],x)
      0094F0 CE 00 05         [ 2] 3841 	subw x,#vars 
      0094F3 90               [ 1] 3842 	ld a,xl
      0094F4 C3               [ 1] 3843 	srl a 
      0094F5 00 1D            [ 1] 3844 	add a,#'A 
      0094F7 25 0A 3B         [ 4] 3845 	call putc 
      0094FA 00 04            [ 1] 3846 	ld a,#SPACE 
      0094FC 4B 00 72         [ 4] 3847 	call putc 
      0094FF F0 01            [ 2] 3848 	ldw x,(XSAVE,sp)
      009501 5B 02 54         [ 2] 3849 	addw x,#2 
      009504 CF 00            [ 2] 3850 	jra 1$ 
      009506 20 A6            [ 1] 3851 6$: cp a,#TK_ARRAY 
      009508 04 81            [ 1] 3852 	jrne 7$
      00950A A6 40            [ 1] 3853 	ld a,#'@ 
      00950A CD 88 BF         [ 4] 3854 	call putc 
      00950D A1 05            [ 2] 3855 	ldw x,(XSAVE,sp)
      00950F 27 03 CC         [ 2] 3856 	jp 1$ 
      009512 88 09            [ 1] 3857 7$: cp a,#TK_INTGR 
      009514 26 14            [ 1] 3858 	jrne 8$
      009514 CD 90 F7 CD      [ 5] 3859 	ldw x,([ptr16],x)
      009518 88 BF A1         [ 4] 3860 	call print_int
      00951B 32 27            [ 1] 3861 	ld a,#SPACE 
      00951D 03 CC 88         [ 4] 3862 	call putc 
      009520 09 03            [ 2] 3863 	ldw x,(XSAVE,sp)
      009521 1C 00 02         [ 2] 3864 	addw x,#2 
      009521 CD 94 6D         [ 2] 3865 	jp 1$
      009524 A1 04            [ 1] 3866 8$: cp a,#TK_GT 
      009526 27 03            [ 1] 3867 	jrmi 9$
      009528 CC 88            [ 1] 3868 	cp a,#TK_NE 
      00952A 09 16            [ 1] 3869 	jrugt 9$
      00952B A0 31            [ 1] 3870 	sub a,#TK_GT  
      00952B 90               [ 1] 3871 	sll a 
      00952C 93 CD            [ 1] 3872 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00952E 91 04            [ 1] 3873 	ld yl,a 
      009530 FF 81 16 D8      [ 2] 3874 	addw y,#relop_str 
      009532 90 FE            [ 2] 3875 	ldw y,(y)
      009532 52               [ 1] 3876 	ldw x,y 
      009533 06 CE 00         [ 4] 3877 	call puts 
      009536 1B C3            [ 2] 3878 	ldw x,(XSAVE,sp)
      009538 00 1D 2B         [ 2] 3879 	jp 1$
      00953B 03 CC            [ 1] 3880 9$: cp a,#TK_PLUS 
      00953D 95 B4            [ 1] 3881 	jrne 10$
      00953F 1F 05            [ 1] 3882 	ld a,#'+
      009541 FE 1F            [ 2] 3883 	jra 80$ 
      009543 01 AE            [ 1] 3884 10$: cp a,#TK_MINUS
      009545 7F FF            [ 1] 3885 	jrne 11$
      009547 1F 03            [ 1] 3886 	ld a,#'-
      009549 CD 93            [ 2] 3887 	jra 80$
      00954B 25 4D            [ 1] 3888 11$: cp a,#TK_MULT 
      00954D 27 3F            [ 1] 3889 	jrmi 12$
      00954F A1 02            [ 1] 3890 	cp a,#TK_MOD 
      009551 27 07            [ 1] 3891 	jrugt 12$
      009553 A1 01            [ 1] 3892 	sub a,#0x20
      009555 27               [ 1] 3893 	clrw x 
      009556 06               [ 1] 3894 	ld xl,a 
      009557 CC 88 09         [ 2] 3895 	addw x,#mul_char 
      00955A CD               [ 1] 3896 	ld a,(x)
      00955B 91 11            [ 2] 3897 	jra 80$ 
      00955D A1 0B            [ 1] 3898 12$: cp a,#TK_LPAREN 
      00955D CD 91            [ 1] 3899 	jrmi 13$
      00955F 04 1F            [ 1] 3900 	cp a,#TK_SHARP 
      009561 01 A1            [ 1] 3901 	jrugt 13$
      009563 01 27            [ 1] 3902 	sub a,#TK_LPAREN
      009565 05               [ 1] 3903 	clrw x 
      009566 97               [ 1] 3904 	ld xl,a 
      009566 CD 91 04         [ 2] 3905 	addw x,#single_char 
      009569 1F               [ 1] 3906 	ld a,(x)
      00956A 03 1A            [ 2] 3907 	jra 80$
      00956B A1 03            [ 1] 3908 13$: cp a,#TK_CHAR 
      00956B CE 00            [ 1] 3909 	jrne 14$
      00956D 1B 1F            [ 1] 3910 	ld a,#'\
      00956F 05 C3 00         [ 4] 3911 	call putc 
      009572 1D 2A            [ 2] 3912 	ldw x,(XSAVE,sp)
      009574 3F FE 13 01      [ 4] 3913 	ld a,([ptr16],x)
      009578 2A               [ 2] 3914 	incw x 
      009579 14 1E            [ 2] 3915 	ldw (XSAVE,sp),x 
      00957B 05 1C 00         [ 4] 3916 	call putc 
      00957E 02 F6 5C         [ 2] 3917 	jp 1$ 
      009581 C7 00            [ 1] 3918 14$: ld a,#':
      009583 0A 72 5F         [ 4] 3919 80$: call putc 
      009586 00 09            [ 2] 3920 	ldw x,(XSAVE,sp)
      009588 72 BB 00         [ 2] 3921 	jp 1$ 
      0016BF                       3922 90$: 
      00958B 09 20            [ 1] 3923 	ld a,#CR 
      00958D E0 01 CB         [ 4] 3924 	call putc
      00958E 7B 02            [ 1] 3925 	ld a,(WIDTH_SAV,sp) 
      00958E 1E 05 E6         [ 1] 3926 	ld tab_width,a 
      009591 02 CD            [ 1] 3927 	ld a,(BASE_SAV,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009593 96 07 1E         [ 1] 3928 	ld base,a
      0016CE                       3929 	_drop VSIZE 
      009596 05 E6            [ 2]    1     addw sp,#VSIZE 
      009598 02               [ 4] 3930 	ret 	
      009599 C7 00 0A 72           3931 single_char: .byte '(',')',',','#'
      00959D 5F 00 09              3932 mul_char: .byte '*','/','%'
      0095A0 72 BB 00 09 C3 00 1D  3933 relop_str: .word gt,equal,ge,lt,le,ne 
             2A 0B 1F 05 FE
      0095AC 13 03                 3934 gt: .asciz ">"
      0095AE 2C 04                 3935 equal: .asciz "="
      0095B0 1E 05 20              3936 ge: .asciz ">="
      0095B3 DC 00                 3937 lt: .asciz "<"
      0095B4 3C 3D 00              3938 le: .asciz "<="
      0095B4 5B 06 81              3939 ne:  .asciz "<>"
                                   3940 
                                   3941 
                                   3942 ;---------------------------------
                                   3943 ; BASIC: PRINT|? arg_list 
                                   3944 ; print values from argument list
                                   3945 ;----------------------------------
                           000001  3946 	COMMA=1
                           000001  3947 	VSIZE=1
      0095B7                       3948 print:
      0095B7 F6 5C            [ 1] 3949 push #0 ; local variable COMMA 
      0016F5                       3950 reset_comma:
      0095B9 A4 0F            [ 1] 3951 	clr (COMMA,sp)
      0016F7                       3952 prt_loop:
      0095BB 88 0D 01         [ 4] 3953 	call relation 
      0095BE 27 09            [ 1] 3954 	cp a,#TK_COLON 
      0095C0 F6 CD            [ 1] 3955 	jreq print_exit   
      0095C2 82 4B            [ 1] 3956 	cp a,#TK_INTGR 
      0095C4 5C 0A            [ 1] 3957 	jrne 0$ 
      0095C6 01 20 F3         [ 4] 3958 	call print_int 
      0095C9 84 81            [ 2] 3959 	jra reset_comma
      0095CB                       3960 0$: 	
      0095CB A6 22 CD         [ 4] 3961 	call next_token
      0095CE 82 4B            [ 1] 3962 	cp a,#TK_NONE 
      0095D0 F6 27            [ 1] 3963 	jreq print_exit 
      0095D2 2D 5C            [ 1] 3964 1$:	cp a,#TK_QSTR
      0095D4 A1 20            [ 1] 3965 	jrne 2$   
      0095D6 25 0C CD         [ 4] 3966 	call puts
      0095D9 82 4B            [ 2] 3967 	jra reset_comma
      0095DB A1 5C            [ 1] 3968 2$: cp a,#TK_CHAR 
      0095DD 26 F1            [ 1] 3969 	jrne 3$
      0095DF 9F               [ 1] 3970 	ld a,xl 
      0095DF CD 82 4B         [ 4] 3971 	call putc 
      0095E2 20 EC            [ 2] 3972 	jra reset_comma 
      001721                       3973 3$: 	
      0095E4 88 A6            [ 1] 3974 	cp a,#TK_CFUNC 
      0095E6 5C CD            [ 1] 3975 	jrne 4$ 
      0095E8 82               [ 4] 3976 	call (x)
      0095E9 4B               [ 1] 3977 	ld a,xl 
      0095EA 84 A0 07         [ 4] 3978 	call putc
      0095ED C7 00            [ 2] 3979 	jra reset_comma 
      00172C                       3980 4$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0095EF 0A 72            [ 1] 3981 	cp a,#TK_COMMA 
      0095F1 5F 00            [ 1] 3982 	jrne 5$
      0095F3 09 90            [ 1] 3983 	cpl (COMMA,sp) 
      0095F5 AE 8D C0         [ 2] 3984 	jp prt_loop   
      001735                       3985 5$: 
      0095F8 72 B9            [ 1] 3986 	cp a,#TK_SHARP
      0095FA 00 09            [ 1] 3987 	jrne 7$
      0095FC 90 F6 20         [ 4] 3988 	call next_token
      0095FF DF A6            [ 1] 3989 	cp a,#TK_INTGR 
      009601 22 CD            [ 1] 3990 	jreq 6$
      009603 82 4B 5C         [ 2] 3991 	jp syntax_error 
      001743                       3992 6$:
      009606 81               [ 1] 3993 	ld a,xl 
      009607 A4 0F            [ 1] 3994 	and a,#15 
      009607 52 05 6B         [ 1] 3995 	ld tab_width,a 
      00960A 05 C6 00         [ 2] 3996 	jp reset_comma 
      00174C                       3997 7$:	
      00960D 07 6B 01         [ 4] 3998 	call unget_token
      00174F                       3999 print_exit:
      009610 C6 00            [ 1] 4000 	tnz (COMMA,sp)
      009612 23 6B            [ 1] 4001 	jrne 9$
      009614 02 CF            [ 1] 4002 	ld a,#CR 
      009616 00 14 FE         [ 4] 4003     call putc 
      001758                       4004 9$:	_drop VSIZE 
      009619 35 0A            [ 2]    1     addw sp,#VSIZE 
      00961B 00               [ 4] 4005 	ret 
                                   4006 
                                   4007 ;----------------------
                                   4008 ; 'save_context' and
                                   4009 ; 'rest_context' must be 
                                   4010 ; called at the same 
                                   4011 ; call stack depth 
                                   4012 ; i.e. SP must have the 
                                   4013 ; save value at  
                                   4014 ; entry point of both 
                                   4015 ; routine. 
                                   4016 ;---------------------
                           000006  4017 	CTXT_SIZE=6 ; size of saved data 
                                   4018 ;--------------------
                                   4019 ; save current BASIC
                                   4020 ; interpreter context 
                                   4021 ; on cstack 
                                   4022 ;--------------------
      00175B                       4023 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00175B                       4024 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00175B                       4025 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      00175B                       4026 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      00175B                       4027 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      00175B                       4028 save_context:
      00961C 07 35 05         [ 2] 4029 	ldw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      00961F 00 23            [ 2] 4030 	ldw (BPTR,sp),x
      009621 CD 8A FE         [ 1] 4031 	ld a,in 
      009624 A6 20            [ 1] 4032 	ld (IN,sp),a
      009626 CD 82 4B         [ 1] 4033 	ld a,count 
      009629 72 5F            [ 1] 4034 	ld (CNT,sp),a  
      00962B 00               [ 4] 4035 	ret
                                   4036 
                                   4037 ;-----------------------
                                   4038 ; restore previously saved 
                                   4039 ; BASIC interpreter context 
                                   4040 ; from cstack 
                                   4041 ;-------------------------
      00176B                       4042 rest_context:
      00962C 23 AE            [ 2] 4043 	ldw x,(BPTR,sp)
      00962E 00 03 9F         [ 2] 4044 	ldw basicptr,x 
      009631 11 05            [ 1] 4045 	ld a,(IN,sp)
      009633 2B 03 CC         [ 1] 4046 	ld in,a
      009636 97 3F            [ 1] 4047 	ld a,(CNT,sp)
      009638 C7 00 03         [ 1] 4048 	ld count,a  
      009638 72               [ 4] 4049 	ret
                                   4050 
                                   4051 ;------------------------------------------
                                   4052 ; BASIC: INPUT [string],var[,[string],var]
                                   4053 ; input value in variables 
                                   4054 ; [string] optionally can be used as prompt 
                                   4055 ;-----------------------------------------
                           000001  4056 	CX_BPTR=1
                           000003  4057 	CX_LNO=3
                           000004  4058 	CX_IN=4
                           000005  4059 	CX_CNT=5
                           000006  4060 	SKIP=6
                           000007  4061 	VSIZE=7
      00177B                       4062 input_var:
      009639 D6 00 14 5C 1F   [ 2] 4063 	btjt flags,#FRUN,1$ 
      00963E 03 A1            [ 1] 4064 	ld a,#ERR_RUN_ONLY 
      009640 06 25 44         [ 2] 4065 	jp tb_error 
      001785                       4066 1$:	_vars VSIZE 
      009643 A1 09            [ 2]    1     sub sp,#VSIZE 
      001787                       4067 input_loop:
      009645 22 2F            [ 1] 4068 	clr (SKIP,sp)
      009647 CD 08 3F         [ 4] 4069 	call next_token 
      009647 72 DE            [ 1] 4070 	cp a,#TK_NONE 
      009649 00 14            [ 1] 4071 	jreq input_exit 
      00964B A3 98            [ 1] 4072 	cp a,#TK_QSTR 
      00964D 6F 26            [ 1] 4073 	jrne 1$ 
      00964F 14 A6 27         [ 4] 4074 	call puts 
      009652 CD 82            [ 1] 4075 	cpl (SKIP,sp)
      009654 4B 1E 03         [ 4] 4076 	call next_token 
      009657 1C 00            [ 1] 4077 1$: cp a,#TK_VAR  
      009659 02 72            [ 1] 4078 	jreq 2$ 
      00965B BB 00 14         [ 2] 4079 	jp syntax_error
      00965E CD 82 5E         [ 4] 4080 2$:	call dpush 
      009661 CC 97            [ 1] 4081 	tnz (SKIP,sp)
      009663 3F CD            [ 1] 4082 	jrne 21$ 
      009665 92 91            [ 1] 4083 	ld a,#':
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009667 CD 95 B7         [ 1] 4084 	ld pad+1,a 
      00966A A6 20 CD 82      [ 1] 4085 	clr pad+2
      00966E 4B 1E 03         [ 2] 4086 	ldw x,#pad 
      009671 1C 00 02         [ 4] 4087 	call puts   
      0017B9                       4088 21$:
      009674 20 BA A1         [ 4] 4089 	call save_context 
      009677 0A 26 0D         [ 2] 4090 	ldw x,#tib 
      00967A 72 BB 00         [ 2] 4091 	ldw basicptr,x  
      00967D 14 CD 95 CB      [ 1] 4092 	clr count  
      009681 72 B0 00         [ 4] 4093 	call readln 
      009684 14 20 A9 A1      [ 1] 4094 	clr in 
      009688 05 26 1A         [ 4] 4095 	call relation 
      00968B 72 DE            [ 1] 4096 	cp a,#TK_INTGR
      00968D 00 14            [ 1] 4097 	jreq 3$ 
      00968F 1D 00 25         [ 2] 4098 	jp syntax_error
      009692 9F 44 AB         [ 4] 4099 3$: call dpush 
      009695 41 CD 82         [ 4] 4100 	call store 
      009698 4B A6 20         [ 4] 4101 	call rest_context
      00969B CD 82 4B         [ 4] 4102 	call next_token 
      00969E 1E 03            [ 1] 4103 	cp a,#TK_COMMA 
      0096A0 1C 00            [ 1] 4104 	jrne 4$
      0096A2 02 20            [ 2] 4105 	jra input_loop 
      0096A4 8B A1 02         [ 4] 4106 4$:	call unget_token 
      0017EC                       4107 input_exit:
      0017EC                       4108 	_drop VSIZE 
      0096A7 26 0A            [ 2]    1     addw sp,#VSIZE 
      0096A9 A6               [ 4] 4109 	ret 
                                   4110 
                                   4111 
                                   4112 ;---------------------
                                   4113 ; BASIC: REMARK | ' 
                                   4114 ; skip comment to end of line 
                                   4115 ;---------------------- 
      0017EF                       4116 rem:
      0096AA 40 CD 82 4B 1E   [ 1] 4117  	mov count,in 
      0096AF 03               [ 4] 4118 	ret 
                                   4119 
                                   4120 ;---------------------
                                   4121 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   4122 ; read in loop 'addr'  
                                   4123 ; apply & 'mask' to value 
                                   4124 ; loop while result==0.  
                                   4125 ; if 'xor_mask' given 
                                   4126 ; apply ^ in second  
                                   4127 ; loop while result==0 
                                   4128 ;---------------------
                           000001  4129 	XMASK=1 
                           000002  4130 	MASK=2
                           000003  4131 	ADDR=3
                           000004  4132 	VSIZE=4
      0017F5                       4133 wait: 
      0017F5                       4134 	_vars VSIZE
      0096B0 CC 96            [ 2]    1     sub sp,#VSIZE 
      0096B2 30 A1            [ 1] 4135 	clr (XMASK,sp) 
      0096B4 04 26 14         [ 4] 4136 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0096B7 72 DE            [ 1] 4137 	cp a,#2
      0096B9 00 14            [ 1] 4138 	jruge 0$
      0096BB CD 8A FE         [ 2] 4139 	jp syntax_error 
      0096BE A6 20            [ 1] 4140 0$:	cp a,#3
      0096C0 CD 82            [ 1] 4141 	jrult 1$
      0096C2 4B 1E 03         [ 4] 4142 	call dpop 
      0096C5 1C               [ 1] 4143 	ld a,xl
      0096C6 00 02            [ 1] 4144 	ld (XMASK,sp),a 
      0096C8 CC 96 30         [ 4] 4145 1$: call dpop ; mask 
      0096CB A1               [ 1] 4146 	ld a,xl 
      0096CC 31 2B            [ 1] 4147 	ld (MASK,sp),a 
      0096CE 1A A1 35         [ 4] 4148 	call dpop ; address 
      0096D1 22               [ 1] 4149 2$:	ld a,(x)
      0096D2 16 A0            [ 1] 4150 	and a,(MASK,sp)
      0096D4 31 48            [ 1] 4151 	xor a,(XMASK,sp)
      0096D6 90 5F            [ 1] 4152 	jreq 2$ 
      00181D                       4153 	_drop VSIZE 
      0096D8 90 97            [ 2]    1     addw sp,#VSIZE 
      0096DA 72               [ 4] 4154 	ret 
                                   4155 
                                   4156 ;---------------------
                                   4157 ; BASIC: BSET addr,mask
                                   4158 ; set bits at 'addr' corresponding 
                                   4159 ; to those of 'mask' that are at 1.
                                   4160 ; arguments:
                                   4161 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4162 ;   mask        mask|addr
                                   4163 ; output:
                                   4164 ;	none 
                                   4165 ;--------------------------
      001820                       4166 bit_set:
      0096DB A9 97 58         [ 4] 4167 	call arg_list 
      0096DE 90 FE            [ 1] 4168 	cp a,#2	 
      0096E0 93 CD            [ 1] 4169 	jreq 1$ 
      0096E2 82 5E 1E         [ 2] 4170 	jp syntax_error
      00182A                       4171 1$: 
      0096E5 03 CC 96         [ 4] 4172 	call dpop ; mask 
      0096E8 30               [ 1] 4173 	ld a,xl 
      0096E9 A1 10 26         [ 4] 4174 	call dpop ; addr  
      0096EC 04               [ 1] 4175 	or a,(x)
      0096ED A6               [ 1] 4176 	ld (x),a
      0096EE 2B               [ 4] 4177 	ret 
                                   4178 
                                   4179 ;---------------------
                                   4180 ; BASIC: BRES addr,mask
                                   4181 ; reset bits at 'addr' corresponding 
                                   4182 ; to those of 'mask' that are at 1.
                                   4183 ; arguments:
                                   4184 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4185 ;   mask	    ~mask&*addr  
                                   4186 ; output:
                                   4187 ;	none 
                                   4188 ;--------------------------
      001834                       4189 bit_reset:
      0096EF 20 46 A1         [ 4] 4190 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0096F2 11 26            [ 1] 4191 	cp a,#2  
      0096F4 04 A6            [ 1] 4192 	jreq 1$ 
      0096F6 2D 20 3E         [ 2] 4193 	jp syntax_error
      00183E                       4194 1$: 
      0096F9 A1 20 2B         [ 4] 4195 	call dpop ; mask 
      0096FC 0E               [ 1] 4196 	ld a,xl 
      0096FD A1               [ 1] 4197 	cpl a 
      0096FE 22 22 0A         [ 4] 4198 	call dpop ; addr  
      009701 A0               [ 1] 4199 	and a,(x)
      009702 20               [ 1] 4200 	ld (x),a 
      009703 5F               [ 4] 4201 	ret 
                                   4202 
                                   4203 ;---------------------
                                   4204 ; BASIC: BRES addr,mask
                                   4205 ; toggle bits at 'addr' corresponding 
                                   4206 ; to those of 'mask' that are at 1.
                                   4207 ; arguments:
                                   4208 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4209 ;   mask	    mask^*addr  
                                   4210 ; output:
                                   4211 ;	none 
                                   4212 ;--------------------------
      001849                       4213 bit_toggle:
      009704 97 1C 97         [ 4] 4214 	call arg_list 
      009707 55 F6            [ 1] 4215 	cp a,#2 
      009709 20 2C            [ 1] 4216 	jreq 1$ 
      00970B A1 0B 2B         [ 2] 4217 	jp syntax_error
      00970E 0E A1 0E         [ 4] 4218 1$: call dpop ; mask 
      009711 22               [ 1] 4219 	ld a,xl 
      009712 0A A0 0B         [ 4] 4220 	call dpop ; addr  
      009715 5F               [ 1] 4221 	xor a,(x)
      009716 97               [ 1] 4222 	ld (x),a 
      009717 1C               [ 4] 4223 	ret 
                                   4224 
                                   4225 
                                   4226 ;---------------------
                                   4227 ; BASIC: BTEST(addr,bit)
                                   4228 ; return bit value at 'addr' 
                                   4229 ; bit is in range {0..7}.
                                   4230 ; arguments:
                                   4231 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4232 ;   bit 	    bit position {0..7}  
                                   4233 ; output:
                                   4234 ;	none 
                                   4235 ;--------------------------
      00185D                       4236 bit_test:
      009718 97 51 F6         [ 4] 4237 	call func_args 
      00971B 20 1A            [ 1] 4238 	cp a,#2
      00971D A1 03            [ 1] 4239 	jreq 0$
      00971F 26 14 A6         [ 2] 4240 	jp syntax_error
      001867                       4241 0$:	
      009722 5C CD 82         [ 4] 4242 	call dpop 
      009725 4B               [ 1] 4243 	ld a,xl 
      009726 1E 03            [ 1] 4244 	and a,#7
      009728 72               [ 1] 4245 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009729 D6 00            [ 1] 4246 	ld a,#1 
      00972B 14 5C            [ 1] 4247 1$: tnz (1,sp)
      00972D 1F 03            [ 1] 4248 	jreq 2$
      00972F CD               [ 1] 4249 	sll a 
      009730 82 4B            [ 1] 4250 	dec (1,sp)
      009732 CC 96            [ 2] 4251 	jra 1$
      009734 30 A6 3A         [ 4] 4252 2$: call dpop 
      009737 CD               [ 1] 4253 	and a,(x)
      009738 82 4B            [ 1] 4254 	jreq 3$
      00973A 1E 03            [ 1] 4255 	ld a,#1 
      00973C CC               [ 1] 4256 3$:	clrw x 
      00973D 96               [ 1] 4257 	ld xl,a 
      00973E 30 04            [ 1] 4258 	ld a,#TK_INTGR
      00973F                       4259 	_drop 1 
      00973F A6 0D            [ 2]    1     addw sp,#1 
      009741 CD               [ 4] 4260 	ret
                                   4261 
                                   4262 
                                   4263 ;--------------------
                                   4264 ; BASIC: POKE addr,byte
                                   4265 ; put a byte at addr 
                                   4266 ;--------------------
      001888                       4267 poke:
      009742 82 4B 7B         [ 4] 4268 	call arg_list 
      009745 02 C7            [ 1] 4269 	cp a,#2
      009747 00 23            [ 1] 4270 	jreq 1$
      009749 7B 01 C7         [ 2] 4271 	jp syntax_error
      001892                       4272 1$:	
      00974C 00 07 5B         [ 4] 4273 	call dpop 
      00974F 05               [ 1] 4274     ld a,xl 
      009750 81 28 29         [ 4] 4275 	call dpop 
      009753 2C               [ 1] 4276 	ld (x),a 
      009754 23               [ 4] 4277 	ret 
                                   4278 
                                   4279 ;-----------------------
                                   4280 ; BASIC: PEEK(addr)
                                   4281 ; get the byte at addr 
                                   4282 ; input:
                                   4283 ;	none 
                                   4284 ; output:
                                   4285 ;	X 		value 
                                   4286 ;-----------------------
      00189B                       4287 peek:
      009755 2A 2F 25         [ 4] 4288 	call func_args
      009758 97 64            [ 1] 4289 	cp a,#1
      00975A 97 66            [ 1] 4290 	jreq 1$
      00975C 97 68 97         [ 2] 4291 	jp syntax_error
      00975F 6B 97 6D         [ 4] 4292 1$:	call dpop 
      009762 97               [ 1] 4293 	ld a,(x)
      009763 70               [ 1] 4294 	clrw x 
      009764 3E               [ 1] 4295 	ld xl,a 
      009765 00 3D            [ 1] 4296 	ld a,#TK_INTGR
      009767 00               [ 4] 4297 	ret 
                                   4298 
                                   4299 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4300 ; BASIC: XPEEK(page,addr)
                                   4301 ; read extended memory byte
                                   4302 ; page in range {0,1,2}
                                   4303 ;----------------------------
      0018AE                       4304 xpeek:
      009768 3E 3D 00         [ 4] 4305 	call func_args 
      00976B 3C 00            [ 1] 4306 	cp a,#2 
      00976D 3C 3D            [ 1] 4307 	jreq 1$
      00976F 00 3C 3E         [ 2] 4308 	jp syntax_error
      0018B8                       4309 1$: 
      009772 00 10 84         [ 4] 4310 	call dpop 
      009773 CF 00 13         [ 2] 4311 	ldw farptr+1,x 
      009773 4B 00 84         [ 4] 4312 	call dpop 
      009775 9F               [ 1] 4313 	ld a,xl 
      009775 0F 01 12         [ 1] 4314 	ld farptr,a 
      009777 5F               [ 1] 4315 	clrw x
      009777 CD 94 6D A1      [ 5] 4316 	ldf a,[farptr]
      00977B 01               [ 1] 4317 	ld xl,a 
      00977C 27 51            [ 1] 4318 	ld a,#TK_INTGR 
      00977E A1               [ 4] 4319 	ret 
                                   4320 
                                   4321 ;---------------------------
                                   4322 ; BASIC IF expr : instructions
                                   4323 ; evaluate expr and if true 
                                   4324 ; execute instructions on same line. 
                                   4325 ;----------------------------
      0018CE                       4326 if: 
      00977F 04 26 05         [ 4] 4327 	call relation 
      009782 CD 8A            [ 1] 4328 	cp a,#TK_INTGR
      009784 FE 20            [ 1] 4329 	jreq 1$ 
      009786 EE 07 89         [ 2] 4330 	jp syntax_error
      009787 4F               [ 1] 4331 1$:	clr a 
      009787 CD               [ 2] 4332 	tnzw x 
      009788 88 BF            [ 1] 4333 	jrne 9$  
                                   4334 ;skip to next line
      00978A A1 00 27 41 A1   [ 1] 4335 	mov in,count
      00978F 0A               [ 4] 4336 9$:	ret 
                                   4337 
                                   4338 ;------------------------
                                   4339 ; BASIC: FOR var=expr 
                                   4340 ; set variable to expression 
                                   4341 ; leave variable address 
                                   4342 ; on dstack and set
                                   4343 ; FLOOP bit in 'flags'
                                   4344 ;-----------------
                           000001  4345 	RETL1=1
                           000003  4346 	INW=3
                           000005  4347 	BPTR=5
      0018E2                       4348 for: ; { -- var_addr }
      009790 26 05            [ 1] 4349 	ld a,#TK_VAR 
      009792 CD 82 5E         [ 4] 4350 	call expect
      009795 20 DE A1         [ 4] 4351 	call dpush 
      009798 03 26 06         [ 4] 4352 	call let02 
      00979B 9F CD 82 4B      [ 1] 4353 	bset flags,#FLOOP 
                                   4354 ; open space on cstack for BPTR and INW 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      00979F 20               [ 2] 4355 	popw x ; call return address 
      0018F2                       4356 	_vars 4
      0097A0 D4 04            [ 2]    1     sub sp,#4 
      0097A1 89               [ 2] 4357 	pushw x  ; RETL1 
      0097A1 A1               [ 1] 4358 	clrw x 
      0097A2 08 26            [ 2] 4359 	ldw (BPTR,sp),x 
      0097A4 07 FD            [ 2] 4360 	ldw (INW,sp),x 
      0097A6 9F CD 82         [ 4] 4361 	call next_token 
      0097A9 4B 20            [ 1] 4362 	cp a,#TK_CMD 
      0097AB C9 03            [ 1] 4363 	jreq 1$
      0097AC CC 07 89         [ 2] 4364 	jp syntax_error
      001904                       4365 1$:  
      0097AC A1 0D 26         [ 2] 4366 	cpw x,#to 
      0097AF 05 03            [ 1] 4367 	jreq to
      0097B1 01 CC 97         [ 2] 4368 	jp syntax_error 
                                   4369 
                                   4370 ;-----------------------------------
                                   4371 ; BASIC: TO expr 
                                   4372 ; second part of FOR loop initilization
                                   4373 ; leave limit on dstack and set 
                                   4374 ; FTO bit in 'flags'
                                   4375 ;-----------------------------------
      00190C                       4376 to: ; { var_addr -- var_addr limit step }
      0097B4 77 04 00 21 03   [ 2] 4377 	btjt flags,#FLOOP,1$
      0097B5 CC 07 89         [ 2] 4378 	jp syntax_error
      0097B5 A1 0E 26         [ 4] 4379 1$: call relation  
      0097B8 13 CD            [ 1] 4380 	cp a,#TK_INTGR 
      0097BA 88 BF            [ 1] 4381 	jreq 2$ 
      0097BC A1 04 27         [ 2] 4382 	jp syntax_error
      00191E                       4383 2$: 
      0097BF 03 CC 88         [ 4] 4384     call dpush ; limit
      0097C2 09 00 00         [ 2] 4385 	ldw x,in.w 
      0097C3 CD 08 3F         [ 4] 4386 	call next_token
      0097C3 9F A4            [ 1] 4387 	cp a,#TK_NONE  
      0097C5 0F C7            [ 1] 4388 	jreq 4$ 
      0097C7 00 23            [ 1] 4389 	cp a,#TK_CMD
      0097C9 CC 97            [ 1] 4390 	jrne 3$
      0097CB 75 19 3F         [ 2] 4391 	cpw x,#step 
      0097CC 27 0B            [ 1] 4392 	jreq step
      001934                       4393 3$:	
      0097CC CD 90 F1         [ 4] 4394 	call unget_token   	 
      0097CF                       4395 4$:	
      0097CF 0D 01 26         [ 2] 4396 	ldw x,#1   ; default step  
      0097D2 05 A6 0D         [ 4] 4397 	call dpush
      0097D5 CD 82            [ 2] 4398 	jra store_loop_addr 
                                   4399 
                                   4400 
                                   4401 ;----------------------------------
                                   4402 ; BASIC: STEP expr 
                                   4403 ; optional third par of FOR loop
                                   4404 ; initialization. 	
                                   4405 ;------------------------------------
      00193F                       4406 step: ; {var limit -- var limit step}
      0097D7 4B 5B 01 81 03   [ 2] 4407 	btjt flags,#FLOOP,1$
      0097DB CC 07 89         [ 2] 4408 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0097DB CE 00 05         [ 4] 4409 1$: call relation
      0097DE 1F 03            [ 1] 4410 	cp a,#TK_INTGR
      0097E0 C6 00            [ 1] 4411 	jreq 2$
      0097E2 02 6B 07         [ 2] 4412 	jp syntax_error
      0097E5 C6 00 04         [ 4] 4413 2$:	call dpush
                                   4414 ; leave loop back entry point on cstack 
                                   4415 ; cstack is 2 call deep from interp_loop
      001954                       4416 store_loop_addr:
      0097E8 6B 08 81         [ 2] 4417 	ldw x,basicptr  
      0097EB 1F 05            [ 2] 4418 	ldw (BPTR,sp),x 
      0097EB 1E 03 CF         [ 2] 4419 	ldw x,in.w 
      0097EE 00 05            [ 2] 4420 	ldw (INW,sp),x   
      0097F0 7B 07 C7 00      [ 1] 4421 	bres flags,#FLOOP 
      0097F4 02 7B 08 C7      [ 1] 4422 	inc loop_depth  
      0097F8 00               [ 4] 4423 	ret 
                                   4424 
                                   4425 ;--------------------------------
                                   4426 ; BASIC: NEXT var 
                                   4427 ; FOR loop control 
                                   4428 ; increment variable with step 
                                   4429 ; and compare with limit 
                                   4430 ; loop if threshold not crossed.
                                   4431 ; else clean both stacks. 
                                   4432 ; and decrement 'loop_depth' 
                                   4433 ;--------------------------------
      001967                       4434 next: ; {var limit step -- [var limit step ] }
      0097F9 04 81 00 1E      [ 1] 4435 	tnz loop_depth 
      0097FB 26 03            [ 1] 4436 	jrne 1$ 
      0097FB 72 00 00         [ 2] 4437 	jp syntax_error 
      001970                       4438 1$: 
      0097FE 22 05            [ 1] 4439 	ld a,#TK_VAR 
      009800 A6 06 CC         [ 4] 4440 	call expect
                                   4441 ; check for good variable after NEXT 	 
      009803 88 0B            [ 1] 4442 	ldw y,x 
      009805 52 07 04         [ 2] 4443 	ldw x,#4  
      009807 72 D3 00 18      [ 4] 4444 	cpw y,([dstkptr],x) ; compare variables address 
      009807 0F 06            [ 1] 4445 	jreq 2$  
      009809 CD 88 BF         [ 2] 4446 	jp syntax_error ; not the good one 
      001983                       4447 2$: ; increment variable 
      00980C A1               [ 1] 4448 	ldw x,y
      00980D 00               [ 2] 4449 	ldw x,(x)  ; get var value 
      00980E 27 5C A1         [ 2] 4450 	ldw acc16,x 
      009811 0A 26 08 CD      [ 5] 4451 	ldw x,[dstkptr] ; step
      009815 82 5E 03 06      [ 2] 4452 	addw x,acc16 ; var+step 
      009819 CD 88            [ 2] 4453 	ldw (y),x ; save var new value 
                                   4454 ; compare with limit 
      00981B BF A1            [ 1] 4455 	ldw y,x 
      00981D 05 27 03 CC      [ 5] 4456 	ldw x,[dstkptr] ; step in x 
      009821 88               [ 2] 4457 	tnzw x  
      009822 09 CD            [ 1] 4458 	jrpl 4$ ; positive step 
                                   4459 ;negative step 
      009824 90 F7 0D         [ 2] 4460 	ldw x,#2
      009827 06 26 0F A6      [ 4] 4461 	cpw y,([dstkptr],x)
      00982B 3A C7            [ 1] 4462 	jrslt loop_done
      00982D 17 19            [ 2] 4463 	jra loop_back 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0019A6                       4464 4$: ; positive step
      00982F 72 5F 17         [ 2] 4465 	ldw x,#2 
      009832 1A AE 17 18      [ 4] 4466 	cpw y,([dstkptr],x)
      009836 CD 82            [ 1] 4467 	jrsgt loop_done
      0019AF                       4468 loop_back:
      009838 5E 05            [ 2] 4469 	ldw x,(BPTR,sp)
      009839 CF 00 04         [ 2] 4470 	ldw basicptr,x 
      009839 CD 97 DB AE 16   [ 2] 4471 	btjf flags,#FRUN,1$ 
      00983E C8 CF            [ 1] 4472 	ld a,(2,x)
      009840 00 05 72         [ 1] 4473 	ld count,a
      009843 5F 00            [ 2] 4474 1$:	ldw x,(INW,sp)
      009845 04 CD 8B         [ 2] 4475 	ldw in.w,x 
      009848 EC               [ 4] 4476 	ret 
      0019C4                       4477 loop_done:
                                   4478 	; remove var limit step on dstack 
      009849 72 5F 00         [ 2] 4479 	ldw x,dstkptr 
      00984C 02 CD 94         [ 2] 4480 	addw x,#3*CELL_SIZE
      00984F 6D A1 04         [ 2] 4481 	ldw dstkptr,x 
                                   4482 	; remove 2 return address on cstack 
      009852 27               [ 2] 4483 	popw x
      0019CE                       4484 	_drop 4
      009853 03 CC            [ 2]    1     addw sp,#4 
      009855 88               [ 2] 4485 	pushw x 
      009856 09 CD 90 F7      [ 1] 4486 	dec loop_depth 
      00985A CD               [ 4] 4487 	ret 
                                   4488 
                                   4489 
                                   4490 ;------------------------
                                   4491 ; BASIC: GOTO line# 
                                   4492 ; jump to line# 
                                   4493 ; here cstack is 2 call deep from interp_loop 
                                   4494 ;------------------------
      0019D6                       4495 goto:
      00985B 91 5E CD 97 EB   [ 2] 4496 	btjt flags,#FRUN,0$ 
      009860 CD 88            [ 1] 4497 	ld a,#ERR_RUN_ONLY
      009862 BF A1 0D         [ 2] 4498 	jp tb_error 
      009865 26               [ 4] 4499 	ret 
      009866 02 20            [ 2] 4500 0$:	jra go_common
                                   4501 
                                   4502 ;--------------------
                                   4503 ; BASIC: GOSUB line#
                                   4504 ; basic subroutine call
                                   4505 ; actual line# and basicptr 
                                   4506 ; are saved on cstack
                                   4507 ; here cstack is 2 call deep from interp_loop 
                                   4508 ;--------------------
                           000003  4509 	GOS_RET=3
      0019E3                       4510 gosub:
      009868 9E CD 90 F1 06   [ 2] 4511 	btjt flags,#FRUN,0$ 
      00986C A6 06            [ 1] 4512 	ld a,#ERR_RUN_ONLY
      00986C 5B 07 81         [ 2] 4513 	jp tb_error 
      00986F 81               [ 4] 4514 	ret 
      00986F 55               [ 2] 4515 0$:	popw x 
      009870 00 02            [ 2] 4516 	sub sp,#2 
      009872 00               [ 2] 4517 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009873 04 81 04         [ 2] 4518 	ldw x,basicptr
      009875 E6 02            [ 1] 4519 	ld a,(2,x)
      009875 52 04            [ 1] 4520 	add a,#3 
      009877 0F 01 CD         [ 1] 4521 	ld acc8,a 
      00987A 93 25 A1 02      [ 1] 4522 	clr acc16 
      00987E 24 03 CC 88      [ 2] 4523 	addw x,acc16
      009882 09 A1            [ 2] 4524 	ldw (GOS_RET,sp),x 
      001A06                       4525 go_common: 
      009884 03 25 06         [ 4] 4526 	call relation 
      009887 CD 91            [ 1] 4527 	cp a,#TK_INTGR
      009889 04 9F            [ 1] 4528 	jreq 1$ 
      00988B 6B 01 CD         [ 2] 4529 	jp syntax_error
      001A10                       4530 1$: 
      00988E 91 04 9F         [ 4] 4531 	call search_lineno  
      009891 6B               [ 2] 4532 	tnzw x 
      009892 02 CD            [ 1] 4533 	jrne 2$ 
      009894 91 04            [ 1] 4534 	ld a,#ERR_NO_LINE 
      009896 F6 14 02         [ 2] 4535 	jp tb_error 
      001A1B                       4536 2$: 
      009899 18 01 27         [ 2] 4537 	ldw basicptr,x 
      00989C F9 5B            [ 1] 4538 	ld a,(2,x)
      00989E 04 81 03         [ 1] 4539 	ld count,a 
      0098A0 35 03 00 01      [ 1] 4540 	mov in,#3 
      0098A0 CD               [ 4] 4541 	ret 
                                   4542 
                                   4543 ;------------------------
                                   4544 ; BASIC: RETURN 
                                   4545 ; exit from a subroutine 
                                   4546 ; cstack is 2 level deep from interp_loop 
                                   4547 ;------------------------
      001A28                       4548 return:
      0098A1 93 25 A1 02 27   [ 2] 4549 	btjt flags,#FRUN,0$ 
      0098A6 03 CC            [ 1] 4550 	ld a,#ERR_RUN_ONLY
      0098A8 88 09 8B         [ 2] 4551 	jp tb_error 
      0098AA                       4552 0$:	
      0098AA CD 91            [ 2] 4553 	ldw x,(GOS_RET,sp) 
      0098AC 04 9F CD         [ 2] 4554 	ldw basicptr,x 
      0098AF 91 04            [ 1] 4555 	ld a,(2,x)
      0098B1 FA F7            [ 1] 4556 	add a,#3 
      0098B3 81 00 03         [ 1] 4557 	ld count,a 
      0098B4 35 03 00 01      [ 1] 4558 	mov in,#3
      0098B4 CD               [ 1] 4559 	clr a 
      0098B5 93               [ 2] 4560 	popw x 
      001A44                       4561 	_drop 2
      0098B6 25 A1            [ 2]    1     addw sp,#2 
      0098B8 02               [ 2] 4562 	pushw x
      0098B9 27               [ 4] 4563 	ret  
                                   4564 
                                   4565 
                                   4566 ;----------------------------------
                                   4567 ; BASIC: RUN
                                   4568 ; run BASIC program in RAM
                                   4569 ;----------------------------------- 
      001A48                       4570 run: 
      0098BA 03 CC 88 09 02   [ 2] 4571 	btjf flags,#FRUN,0$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0098BE 4F               [ 1] 4572 	clr a 
      0098BE CD               [ 4] 4573 	ret
      001A4F                       4574 0$: 
      0098BF 91 04 9F 43 CD   [ 2] 4575 	btjf flags,#FBREAK,1$
      001A54                       4576 	_drop 2 
      0098C4 91 04            [ 2]    1     addw sp,#2 
      0098C6 F4 F7 81         [ 4] 4577 	call rest_context
      0098C9                       4578 	_drop CTXT_SIZE 
      0098C9 CD 93            [ 2]    1     addw sp,#CTXT_SIZE 
      0098CB 25 A1 02 27      [ 1] 4579 	bres flags,#FBREAK 
      0098CF 03 CC 88 09      [ 1] 4580 	bset flags,#FRUN 
      0098D3 CD 91 04         [ 2] 4581 	jp interp_loop 
      0098D6 9F CD 91         [ 2] 4582 1$:	ldw x,txtbgn
      0098D9 04 F8 F7         [ 2] 4583 	cpw x,txtend 
      0098DC 81 02            [ 1] 4584 	jrmi run_it 
      0098DD 4F               [ 1] 4585 	clr a 
      0098DD CD               [ 4] 4586 	ret
                                   4587 
      001A70                       4588 run_it:	 
      0098DE 93 49 A1         [ 4] 4589     call ubound 
      001A73                       4590 	_drop 2 
      0098E1 02 27            [ 2]    1     addw sp,#2 
      0098E3 03 CC 88         [ 2] 4591 	ldw x,txtbgn 
      0098E6 09 00 04         [ 2] 4592 	ldw basicptr,x 
      0098E7 E6 02            [ 1] 4593 	ld a,(2,x)
      0098E7 CD 91 04         [ 1] 4594 	ld count,a
      0098EA 9F A4 07 88      [ 1] 4595 	mov in,#3	
      0098EE A6 01 0D 01      [ 1] 4596 	bset flags,#FRUN 
      0098F2 27 05 48         [ 2] 4597 	jp interp_loop 
                                   4598 
                                   4599 
                                   4600 ;----------------------
                                   4601 ; BASIC: STOP 
                                   4602 ; stop running program
                                   4603 ;---------------------- 
      001A8B                       4604 stop: 
                                   4605 ; clean dstack and cstack 
      0098F5 0A 01 20         [ 2] 4606 	ldw x,#STACK_EMPTY 
      0098F8 F7               [ 1] 4607 	ldw sp,x 
      0098F9 CD 91 04 F4      [ 1] 4608 	bres flags,#FRUN 
      0098FD 27 02 A6 01      [ 1] 4609 	bres flags,#FBREAK
      009901 5F 97 A6         [ 2] 4610 	jp warm_start
                                   4611 
                                   4612 
                                   4613 ;-----------------------
                                   4614 ; BASIC BEEP expr1,expr2
                                   4615 ; used MCU internal beeper 
                                   4616 ; to produce a sound
                                   4617 ; arguments:
                                   4618 ;    expr1   frequency  (expr1%32)
                                   4619 ;    expr2   duration msec.
                                   4620 ;---------------------------
      001A9A                       4621 tone:
      009904 04 5B 01         [ 4] 4622 	call arg_list 
      009907 81 02            [ 1] 4623 	cp a,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009908 27 03            [ 1] 4624 	jreq 1$
      009908 CD 93 25         [ 2] 4625 	jp syntax_error 
      001AA4                       4626 1$: 
      00990B A1 02 27         [ 4] 4627 	call dpop ; duration
      00990E 03               [ 2] 4628 	pushw x 
      00990F CC 88 09         [ 4] 4629 	call dpop ; frequency
      009912 90 93            [ 1] 4630 	ldw y,x 
      009912 CD 91 04         [ 2] 4631 	ldw x,#TIM2_CLK_FREQ
      009915 9F               [ 2] 4632 	divw x,y 
                                   4633 ; round to nearest integer 
      009916 CD 91 04 F7      [ 2] 4634 	cpw y,#TIM2_CLK_FREQ/2
      00991A 81 01            [ 1] 4635 	jrmi 2$
      00991B 5C               [ 2] 4636 	incw x 
      001AB8                       4637 2$:	 
      00991B CD               [ 1] 4638 	ld a,xh 
      00991C 93 49 A1         [ 1] 4639 	ld TIM2_ARRH,a 
      00991F 01               [ 1] 4640 	ld a,xl 
      009920 27 03 CC         [ 1] 4641 	ld TIM2_ARRL,a 
                                   4642 ; 50% duty cycle 
      009923 88               [ 1] 4643 	ccf 
      009924 09               [ 2] 4644 	rrcw x 
      009925 CD               [ 1] 4645 	ld a,xh 
      009926 91 04 F6         [ 1] 4646 	ld TIM2_CCR1H,a 
      009929 5F               [ 1] 4647 	ld a,xl
      00992A 97 A6 04         [ 1] 4648 	ld TIM2_CCR1L,a
      00992D 81 10 53 08      [ 1] 4649 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00992E 72 10 53 00      [ 1] 4650 	bset TIM2_CR1,#TIM2_CR1_CEN
      00992E CD 93 49 A1      [ 1] 4651 	bset TIM2_EGR,#TIM2_EGR_UG
      009932 02               [ 2] 4652 	popw x 
      009933 27 03 CC         [ 2] 4653 	ldw timer,x 
      009936 88 09 0C         [ 2] 4654 3$: ldw x,timer 	
      009938 26 FB            [ 1] 4655 	jrne 3$ 
      009938 CD 91 04 CF      [ 1] 4656 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00993C 00 14 CD 91      [ 1] 4657 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009940 04               [ 4] 4658 	ret 
                                   4659 
                                   4660 ;-------------------------------
                                   4661 ; BASIC: PWRADC 0|1 [,divisor]  
                                   4662 ; disable/enanble ADC 
                                   4663 ;-------------------------------
      001AE8                       4664 power_adc:
      009941 9F C7 00         [ 4] 4665 	call arg_list 
      009944 13 5F            [ 1] 4666 	cp a,#2	
      009946 92 BC            [ 1] 4667 	jreq 1$
      009948 00 13            [ 1] 4668 	cp a,#1 
      00994A 97 A6            [ 1] 4669 	jreq 0$ 
      00994C 04 81 89         [ 2] 4670 	jp syntax_error 
      00994E AE 00 00         [ 2] 4671 0$: ldw x,#0
      00994E CD 94 6D         [ 4] 4672 	call dpush 
      009951 A1 04 27         [ 2] 4673 1$: ldw x,#2
      009954 03 CC 88 09      [ 5] 4674 	ldw x,([dstkptr],x) ; on|off
      009958 4F               [ 2] 4675 	tnzw x 
      009959 5D 26            [ 1] 4676 	jreq 2$ 
      00995B 05 55 00 04      [ 5] 4677 	ldw x,[dstkptr] ; divisor 
      00995F 00               [ 1] 4678 	ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009960 02 81            [ 1] 4679 	and a,#7
      009962 4E               [ 1] 4680 	swap a 
      009962 A6 05 CD         [ 1] 4681 	ld ADC_CR1,a
      009965 93 18 CD 90      [ 1] 4682 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009969 F7 CD 95 14      [ 1] 4683 	bset ADC_CR1,#ADC_CR1_ADON 
      001B19                       4684 	_usec_dly 7 
      00996D 72 14 00         [ 2]    1     ldw x,#(16*7-2)/4
      009970 22               [ 2]    2     decw x
      009971 85               [ 1]    3     nop 
      009972 52 04            [ 1]    4     jrne .-4
      009974 89 5F            [ 2] 4685 	jra 3$
      009976 1F 05 1F 03      [ 1] 4686 2$: bres ADC_CR1,#ADC_CR1_ADON
      00997A CD 88 BF A1      [ 1] 4687 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00997E 06 27 03         [ 2] 4688 3$:	ldw x,#2
      009981 CC 88 09         [ 4] 4689 	call ddrop_n 
      009984 81               [ 4] 4690 	ret
                                   4691 
                                   4692 ;-----------------------------
                                   4693 ; BASIC: RDADC(channel)
                                   4694 ; read adc channel {0..5}
                                   4695 ; output:
                                   4696 ;   A 		TK_INTGR 
                                   4697 ;   X 		value 
                                   4698 ;-----------------------------
      001B31                       4699 analog_read:
      009984 A3 99 8C         [ 4] 4700 	call func_args 
      009987 27 03            [ 1] 4701 	cp a,#1 
      009989 CC 88            [ 1] 4702 	jreq 1$
      00998B 09 07 89         [ 2] 4703 	jp syntax_error
      00998C CD 10 84         [ 4] 4704 1$: call dpop 
      00998C 72 04 00         [ 2] 4705 	cpw x,#5 
      00998F 22 03            [ 2] 4706 	jrule 2$
      009991 CC 88            [ 1] 4707 	ld a,#ERR_BAD_VALUE
      009993 09 CD 94         [ 2] 4708 	jp tb_error 
      009996 6D               [ 1] 4709 2$: ld a,xl
      009997 A1 04 27         [ 1] 4710 	ld acc8,a 
      00999A 03 CC            [ 1] 4711 	ld a,#5
      00999C 88 09 09         [ 1] 4712 	sub a,acc8 
      00999E C7 54 00         [ 1] 4713 	ld ADC_CSR,a
      00999E CD 90 F7 CE      [ 1] 4714 	bset ADC_CR2,#ADC_CR2_ALIGN
      0099A2 00 01 CD 88      [ 1] 4715 	bset ADC_CR1,#ADC_CR1_ADON
      0099A6 BF A1 00 27 0C   [ 2] 4716 	btjf ADC_CSR,#ADC_CSR_EOC,.
      0099AB A1 06 26         [ 2] 4717 	ldw x,ADC_DRH
      0099AE 05 A3            [ 1] 4718 	ld a,#TK_INTGR
      0099B0 99               [ 4] 4719 	ret 
                                   4720 
                                   4721 ;-----------------------
                                   4722 ; BASIC: DREAD(pin)
                                   4723 ; read state of a digital pin 
                                   4724 ; pin# {0..15}
                                   4725 ; output:
                                   4726 ;    A 		TK_INTGR
                                   4727 ;    X      0|1 
                                   4728 ;-------------------------
                           000001  4729 	PINNO=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                           000001  4730 	VSIZE=1
      001B67                       4731 digital_read:
      001B67                       4732 	_vars VSIZE 
      0099B1 BF 27            [ 2]    1     sub sp,#VSIZE 
      0099B3 0B 12 C9         [ 4] 4733 	call func_args
      0099B4 A1 01            [ 1] 4734 	cp a,#1
      0099B4 CD 90            [ 1] 4735 	jreq 1$
      0099B6 F1 07 89         [ 2] 4736 	jp syntax_error
      0099B7 CD 10 84         [ 4] 4737 1$: call dpop 
      0099B7 AE 00 01         [ 2] 4738 	cpw x,#15 
      0099BA CD 90            [ 2] 4739 	jrule 2$
      0099BC F7 20            [ 1] 4740 	ld a,#ERR_BAD_VALUE
      0099BE 15 07 8B         [ 2] 4741 	jp tb_error 
      0099BF CD 21 7E         [ 4] 4742 2$:	call select_pin 
      0099BF 72 04            [ 1] 4743 	ld (PINNO,sp),a
      0099C1 00 22            [ 1] 4744 	ld a,(GPIO_IDR,x)
      0099C3 03 CC            [ 1] 4745 	tnz (PINNO,sp)
      0099C5 88 09            [ 1] 4746 	jreq 8$
      0099C7 CD               [ 1] 4747 3$: srl a 
      0099C8 94 6D            [ 1] 4748 	dec (PINNO,sp)
      0099CA A1 04            [ 1] 4749 	jrne 3$ 
      0099CC 27 03            [ 1] 4750 8$: and a,#1 
      0099CE CC               [ 1] 4751 	clrw x 
      0099CF 88               [ 1] 4752 	ld xl,a 
      0099D0 09 CD            [ 1] 4753 	ld a,#TK_INTGR
      001B96                       4754 	_drop VSIZE
      0099D2 90 F7            [ 2]    1     addw sp,#VSIZE 
      0099D4 81               [ 4] 4755 	ret
                                   4756 
                                   4757 ;-----------------------
                                   4758 ; BASIC: DWRITE pin,0|1
                                   4759 ; write to a digital pin 
                                   4760 ; pin# {0..15}
                                   4761 ; output:
                                   4762 ;    A 		TK_INTGR
                                   4763 ;    X      0|1 
                                   4764 ;-------------------------
                           000001  4765 	PINNO=1
                           000002  4766 	PINVAL=2
                           000002  4767 	VSIZE=2
      001B99                       4768 digital_write:
      001B99                       4769 	_vars VSIZE 
      0099D4 CE 00            [ 2]    1     sub sp,#VSIZE 
      0099D6 05 1F 05         [ 4] 4770 	call arg_list  
      0099D9 CE 00            [ 1] 4771 	cp a,#2 
      0099DB 01 1F            [ 1] 4772 	jreq 1$
      0099DD 03 72 15         [ 2] 4773 	jp syntax_error
      0099E0 00 22 72         [ 4] 4774 1$: call dpop 
      0099E3 5C               [ 1] 4775 	ld a,xl 
      0099E4 00 1F            [ 1] 4776 	ld (PINVAL,sp),a
      0099E6 81 10 84         [ 4] 4777 	call dpop
      0099E7 A3 00 0F         [ 2] 4778 	cpw x,#15 
      0099E7 72 5D            [ 2] 4779 	jrule 2$
      0099E9 00 1F            [ 1] 4780 	ld a,#ERR_BAD_VALUE
      0099EB 26 03 CC         [ 2] 4781 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0099EE 88 09 7E         [ 4] 4782 2$:	call select_pin 
      0099F0 6B 01            [ 1] 4783 	ld (PINNO,sp),a 
      0099F0 A6 05            [ 1] 4784 	ld a,#1
      0099F2 CD 93            [ 1] 4785 	tnz (PINNO,sp)
      0099F4 18 90            [ 1] 4786 	jreq 4$
      0099F6 93               [ 1] 4787 3$: sll a
      0099F7 AE 00            [ 1] 4788 	dec (PINNO,sp)
      0099F9 04 72            [ 1] 4789 	jrne 3$
      0099FB D3 00            [ 1] 4790 4$: tnz (PINVAL,sp)
      0099FD 19 27            [ 1] 4791 	jrne 5$
      0099FF 03               [ 1] 4792 	cpl a 
      009A00 CC 88            [ 1] 4793 	and a,(GPIO_ODR,x)
      009A02 09 02            [ 2] 4794 	jra 8$
      009A03 EA 00            [ 1] 4795 5$: or a,(GPIO_ODR,x)
      009A03 93 FE            [ 1] 4796 8$: ld (GPIO_ODR,x),a 
      001BD5                       4797 	_drop VSIZE 
      009A05 CF 00            [ 2]    1     addw sp,#VSIZE 
      009A07 09               [ 4] 4798 	ret
                                   4799 
                                   4800 
                                   4801 ;-----------------------
                                   4802 ; BASIC: BREAK 
                                   4803 ; insert a breakpoint 
                                   4804 ; in pogram. 
                                   4805 ; the program is resumed
                                   4806 ; with RUN 
                                   4807 ;-------------------------
      001BD8                       4808 break:
      009A08 72 CE 00 19 72   [ 2] 4809 	btjt flags,#FRUN,2$
      009A0D BB               [ 1] 4810 	clr a
      009A0E 00               [ 4] 4811 	ret 
      001BDF                       4812 2$:	 
                                   4813 ; create space on cstack to save context 
      009A0F 09 90 FF         [ 2] 4814 	ldw x,#break_point 
      009A12 90 93 72         [ 4] 4815 	call puts 
      001BE5                       4816 	_drop 2 ;drop return address 
      009A15 CE 00            [ 2]    1     addw sp,#2 
      001BE7                       4817 	_vars CTXT_SIZE ; context size 
      009A17 19 5D            [ 2]    1     sub sp,#CTXT_SIZE 
      009A19 2A 0B AE         [ 4] 4818 	call save_context 
      009A1C 00 02 72         [ 2] 4819 	ldw x,#tib 
      009A1F D3 00 19         [ 2] 4820 	ldw basicptr,x
      009A22 2F               [ 1] 4821 	clr (x)
      009A23 20 20 09 03      [ 1] 4822 	clr count  
      009A26 5F               [ 1] 4823 	clrw x 
      009A26 AE 00 02         [ 2] 4824 	ldw in.w,x
      009A29 72 D3 00 19      [ 1] 4825 	bres flags,#FRUN 
      009A2D 2C 15 00 21      [ 1] 4826 	bset flags,#FBREAK
      009A2F CC 08 0F         [ 2] 4827 	jp interp_loop 
      009A2F 1E 05 CF 00 05 72 01  4828 break_point: .asciz "\nbreak point, RUN to resume.\n"
             00 22 05 E6 02 C7 00
             04 1E 03 CF 00 01 81
             72 65 73 75 6D 65 2E
             0A 00
                                   4829 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4830 ;-----------------------
                                   4831 ; BASIC: NEW
                                   4832 ; from command line only 
                                   4833 ; free program memory
                                   4834 ; and clear variables 
                                   4835 ;------------------------
      009A44                       4836 new: 
      009A44 CE 00 19 1C 00   [ 2] 4837 	btjf flags,#FRUN,0$ 
      009A49 06               [ 1] 4838 	clr a 
      009A4A CF               [ 4] 4839 	ret 
      001C2B                       4840 0$:	
      009A4B 00 19 85         [ 4] 4841 	call clear_basic 
      009A4E 5B               [ 4] 4842 	ret 
                                   4843 	 
                                   4844 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4845 ;   file system routines
                                   4846 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4847 
                                   4848 ;--------------------
                                   4849 ; input:
                                   4850 ;   X     increment 
                                   4851 ; output:
                                   4852 ;   farptr  incremented 
                                   4853 ;---------------------
      001C2F                       4854 incr_farptr:
      009A4F 04 89 72 5A      [ 2] 4855 	addw x,farptr+1 
      009A53 00 1F            [ 1] 4856 	jrnc 1$
      009A55 81 5C 00 12      [ 1] 4857 	inc farptr 
      009A56 CF 00 13         [ 2] 4858 1$:	ldw farptr+1,x  
      009A56 72               [ 4] 4859 	ret 
                                   4860 
                                   4861 ;------------------------------
                                   4862 ; extended flash memory used as FLASH_DRIVE 
                                   4863 ; seek end of used flash drive   
                                   4864 ; starting at 0x10000 address.
                                   4865 ; 4 consecutives 0 bytes signal free space. 
                                   4866 ; input:
                                   4867 ;	none
                                   4868 ; output:
                                   4869 ;   ffree     free_addr| 0 if memory full.
                                   4870 ;------------------------------
      001C3D                       4871 seek_fdrive:
                                   4872 ; start scan at 0x10000 address 
      009A57 00 00            [ 1] 4873 	ld a,#1
      009A59 22 06 A6         [ 1] 4874 	ld farptr,a 
      009A5C 06               [ 1] 4875 	clrw x 
      009A5D CC 88 0B         [ 2] 4876 	ldw farptr+1,x 
      001C46                       4877 1$:
      009A60 81 20 23         [ 2] 4878 	ldw x,#3  
      009A63 92 AF 00 12      [ 5] 4879 2$:	ldf a,([farptr],x) 
      009A63 72 00            [ 1] 4880 	jrne 3$
      009A65 00               [ 2] 4881 	decw x
      009A66 22 06            [ 1] 4882 	jrpl 2$
      009A68 A6 06            [ 2] 4883 	jra 4$ 
      009A6A CC               [ 2] 4884 3$:	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009A6B 88 0B 81         [ 4] 4885 	call incr_farptr
      009A6E 85 52 02         [ 2] 4886 	ldw x,#0x27f 
      009A71 89 CE 00         [ 2] 4887 	cpw x,farptr
      009A74 05 E6            [ 1] 4888 	jrpl 1$
                                   4889 ; drive full 
      009A76 02 AB 03 C7      [ 1] 4890 	clr ffree 
      009A7A 00 0A 72 5F      [ 1] 4891 	clr ffree+1 
      009A7E 00 09 72 BB      [ 1] 4892 	clr ffree+2 
      009A82 00               [ 4] 4893 	ret
      001C6D                       4894 4$: ; copy farptr to ffree	 
      009A83 09 1F 03         [ 2] 4895 	ldw x,farptr 
      009A86 C6 00 14         [ 1] 4896 	ld a,farptr+2 
      009A86 CD 94 6D         [ 2] 4897 	ldw ffree,x 
      009A89 A1 04 27         [ 1] 4898 	ld ffree+2,a  
      009A8C 03               [ 4] 4899 	ret 
                                   4900 
                                   4901 ;-----------------------
                                   4902 ; compare file name 
                                   4903 ; with name pointed by Y  
                                   4904 ; input:
                                   4905 ;   farptr   file name 
                                   4906 ;   Y        target name 
                                   4907 ; output:
                                   4908 ;   farptr 	 at file_name
                                   4909 ;   X 		 farptr[x] point at size field  
                                   4910 ;   Carry    0|1 no match|match  
                                   4911 ;----------------------
      001C7A                       4912 cmp_name:
      009A8D CC               [ 1] 4913 	clrw x
      009A8E 88 09 00 12      [ 5] 4914 1$:	ldf a,([farptr],x)
      009A90 90 F1            [ 1] 4915 	cp a,(y)
      009A90 CD 83            [ 1] 4916 	jrne 4$
      009A92 8E               [ 1] 4917 	tnz a 
      009A93 5D 26            [ 1] 4918 	jreq 9$ 
      009A95 05               [ 2] 4919     incw x 
      009A96 A6 05            [ 2] 4920 	incw y 
      009A98 CC 88            [ 2] 4921 	jra 1$
      001C8B                       4922 4$: ;no match 
      009A9A 0B               [ 1] 4923 	tnz a 
      009A9B 27 07            [ 1] 4924 	jreq 5$
      009A9B CF               [ 2] 4925 	incw x 
      009A9C 00 05 E6 02      [ 5] 4926 	ldf a,([farptr],x)
      009AA0 C7 00            [ 2] 4927 	jra 4$  
      009AA2 04               [ 2] 4928 5$:	incw x ; farptr[x] point at 'size' field 
      009AA3 35               [ 1] 4929 	rcf 
      009AA4 03               [ 4] 4930 	ret
      001C98                       4931 9$: ; match  
      009AA5 00               [ 2] 4932 	incw x  ; farptr[x] at 'size' field 
      009AA6 02               [ 1] 4933 	scf 
      009AA7 81               [ 4] 4934 	ret 
                                   4935 
                                   4936 ;-----------------------
                                   4937 ; search file in 
                                   4938 ; flash memory 
                                   4939 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4940 ;   Y       file name  
                                   4941 ; output:
                                   4942 ;   farptr  addr at name|0
                                   4943 ;-----------------------
                           000001  4944 	FSIZE=1
                           000003  4945 	YSAVE=3
                           000004  4946 	VSIZE=4 
      009AA8                       4947 search_file: 
      001C9B                       4948 	_vars VSIZE
      009AA8 72 00            [ 2]    1     sub sp,#VSIZE 
      009AAA 00 22            [ 2] 4949 	ldw (YSAVE,sp),y  
      009AAC 05               [ 1] 4950 	clrw x 
      009AAD A6 06 CC         [ 2] 4951 	ldw farptr+1,x 
      009AB0 88 0B 00 12      [ 1] 4952 	mov farptr,#1
      009AB2                       4953 1$:	
                                   4954 ; check if farptr is after any file 
                                   4955 ; if  0 then so.
      009AB2 1E 03 CF 00      [ 5] 4956 	ldf a,[farptr]
      009AB6 05 E6            [ 1] 4957 	jreq 6$
      009AB8 02               [ 1] 4958 2$: clrw x 	
      009AB9 AB 03            [ 2] 4959 	ldw y,(YSAVE,sp) 
      009ABB C7 00 04         [ 4] 4960 	call cmp_name
      009ABE 35 03            [ 1] 4961 	jrc 9$
      009AC0 00 02 4F 85      [ 5] 4962 	ldf a,([farptr],x)
      009AC4 5B 02            [ 1] 4963 	ld (FSIZE,sp),a 
      009AC6 89               [ 2] 4964 	incw x 
      009AC7 81 AF 00 12      [ 5] 4965 	ldf a,([farptr],x)
      009AC8 6B 02            [ 1] 4966 	ld (FSIZE+1,sp),a 
      009AC8 72               [ 2] 4967 	incw x 
      009AC9 01 00 22         [ 2] 4968 	addw x,(FSIZE,sp) ; count to skip 
      009ACC 02               [ 2] 4969 	incw x ; skip over EOF marker 
      009ACD 4F 81 2F         [ 4] 4970 	call incr_farptr ; now at next file 'name_field'
      009ACF AE 02 80         [ 2] 4971 	ldw x,#0x280
      009ACF 72 09 00         [ 2] 4972 	cpw x,farptr 
      009AD2 22 12            [ 1] 4973 	jrpl 1$
      001CD2                       4974 6$: ; file not found 
      009AD4 5B 02 CD 97      [ 1] 4975 	clr farptr
      009AD8 EB 5B 06 72      [ 1] 4976 	clr farptr+1 
      009ADC 19 00 22 72      [ 1] 4977 	clr farptr+2 
      001CDE                       4978 	_drop VSIZE 
      009AE0 10 00            [ 2]    1     addw sp,#VSIZE 
      009AE2 22               [ 1] 4979 	rcf
      009AE3 CC               [ 4] 4980 	ret
      001CE2                       4981 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001CE2                       4982 	_drop VSIZE 
      009AE4 88 8F            [ 2]    1     addw sp,#VSIZE 
      009AE6 CE               [ 1] 4983 	scf 	
      009AE7 00               [ 4] 4984 	ret
                                   4985 
                                   4986 ;--------------------------------
                                   4987 ; BASIC: SAVE "name" 
                                   4988 ; save text program in 
                                   4989 ; flash memory used as 
                                   4990 ;--------------------------------
                           000001  4991 	BSIZE=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                           000003  4992 	NAMEPTR=3
                           000004  4993 	VSIZE=4
      001CE6                       4994 save:
      009AE8 1B C3 00 1D 2B   [ 2] 4995 	btjf flags,#FRUN,0$ 
      009AED 02 4F            [ 1] 4996 	ld a,#ERR_CMD_ONLY 
      009AEF 81 07 8B         [ 2] 4997 	jp tb_error
      009AF0                       4998 0$:	 
      009AF0 CD 94 E8         [ 2] 4999 	ldw x,txtend 
      009AF3 5B 02 CE 00      [ 2] 5000 	subw x,txtbgn
      009AF7 1B CF            [ 1] 5001 	jrne 1$
                                   5002 ; nothing to save 
      009AF9 00               [ 4] 5003 	ret 
      001CFA                       5004 1$:	
      001CFA                       5005 	_vars VSIZE 
      009AFA 05 E6            [ 2]    1     sub sp,#VSIZE 
      009AFC 02 C7            [ 2] 5006 	ldw (BSIZE,sp),x 
      009AFE 00 04 35         [ 4] 5007 	call next_token	
      009B01 03 00            [ 1] 5008 	cp a,#TK_QSTR
      009B03 02 72            [ 1] 5009 	jreq 2$
      009B05 10 00 22         [ 2] 5010 	jp syntax_error
      001D08                       5011 2$: 
      009B08 CC 88 8F 04      [ 2] 5012 	ldw y,basicptr 
      009B0B 72 B9 00 00      [ 2] 5013 	addw y,in.w
      009B0B AE 17            [ 2] 5014 	ldw (NAMEPTR,sp),y  
      009B0D FF 94 72 11 00   [ 1] 5015 	mov in,count 
                                   5016 ; check if enough free space 
      009B12 22               [ 1] 5017 	ldw x,y 
      009B13 72 19 00         [ 4] 5018 	call strlen 
      009B16 22 CC 88         [ 2] 5019 	addw x,#3 
      009B19 4C FB 01         [ 2] 5020 	addw x,(BSIZE,sp)
      009B1A 72 5D 00 15      [ 1] 5021 	tnz ffree 
      009B1A CD 93            [ 1] 5022 	jrne 21$
      009B1C 25 A1 02 27      [ 2] 5023 	subw x,ffree+1 
      009B20 03 CC            [ 2] 5024 	jrule 21$
      009B22 88 09            [ 1] 5025 	ld a,#ERR_MEM_FULL 
      009B24 CC 07 8B         [ 2] 5026 	jp tb_error
      001D32                       5027 21$: 
                                   5028 ; check for existing file of that name 
      009B24 CD 91            [ 2] 5029 	ldw y,(NAMEPTR,sp)	
      009B26 04 89 CD         [ 4] 5030 	call search_file 
      009B29 91 04            [ 1] 5031 	jrnc 3$ 
      009B2B 90 93            [ 1] 5032 	ld a,#ERR_DUPLICATE 
      009B2D AE F4 24         [ 2] 5033 	jp tb_error 
      001D3E                       5034 3$:	;** write file name to flash **
      009B30 65 90 A3         [ 2] 5035 	ldw x,ffree 
      009B33 7A 12 2B         [ 1] 5036 	ld a,ffree+2 
      009B36 01 5C 12         [ 2] 5037 	ldw farptr,x 
      009B38 C7 00 14         [ 1] 5038 	ld farptr+2,a 
      009B38 9E C7            [ 2] 5039 	ldw x,(NAMEPTR,sp)  
      009B3A 53 0D 9F         [ 4] 5040 	call strlen 
      009B3D C7               [ 2] 5041 	incw  x
      009B3E 53 0E            [ 2] 5042 	ldw (BSIZE,sp),x  
      009B40 8C               [ 1] 5043 	clrw x   
      009B41 56 9E            [ 2] 5044 	ldw y,(NAMEPTR,sp)
      009B43 C7 53 0F         [ 4] 5045 	call write_block  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   5046 ;** write file length after name **
      009B46 9F C7 53         [ 2] 5047 	ldw x,txtend 
      009B49 10 72 10 53      [ 2] 5048 	subw x,txtbgn
      009B4D 08 72            [ 2] 5049 	ldw (BSIZE,sp),x 
      009B4F 10               [ 1] 5050 	clrw x 
      009B50 53 00            [ 1] 5051 	ld a,(1,sp)
      009B52 72 10 53         [ 4] 5052 	call write_byte 
      009B55 04               [ 2] 5053 	incw x 
      009B56 85 CF            [ 1] 5054 	ld a,(2,sp)
      009B58 00 0D CE         [ 4] 5055 	call write_byte
      009B5B 00               [ 2] 5056 	incw x  
      009B5C 0D 26 FB         [ 4] 5057 	call incr_farptr ; move farptr after SIZE field 
                                   5058 ;** write BASIC text **
                                   5059 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009B5F 72 11            [ 2] 5060 	ldw x,(BSIZE,sp)
      009B61 53               [ 2] 5061 	pushw x ; write_block argument 
      009B62 08               [ 1] 5062 	clrw x 
      009B63 72 11 53 00      [ 2] 5063 	ldw y,txtbgn  ; BASIC text to save 
      009B67 81 01 6D         [ 4] 5064 	call write_block 
      009B68                       5065 	_drop 2 ;  drop write_block argument  
      009B68 CD 93            [ 2]    1     addw sp,#2 
                                   5066 ; write en end of file marker 
      009B6A 25 A1 02         [ 2] 5067 	ldw x,#1
      009B6D 27 0D            [ 1] 5068 	ld a,#EOF  
      009B6F A1 01 27         [ 4] 5069 	call write_byte 
      009B72 03 CC 88         [ 4] 5070 	call incr_farptr
                                   5071 ; save farptr in ffree
      009B75 09 AE 00         [ 2] 5072 	ldw x,farptr 
      009B78 00 CD 90         [ 1] 5073 	ld a,farptr+2 
      009B7B F7 AE 00         [ 2] 5074 	ldw ffree,x 
      009B7E 02 72 DE         [ 1] 5075 	ld ffree+2,a
                                   5076 ;write 4 zero bytes as an end of all files marker 
      009B81 00               [ 1] 5077     clrw x 
      009B82 19 5D            [ 1] 5078 	push #4 
      001D98                       5079 4$:
      009B84 27               [ 1] 5080 	clr a 
      009B85 1C 72 CE         [ 4] 5081 	call write_byte 
      009B88 00               [ 2] 5082 	incw x 
      009B89 19 9F            [ 1] 5083 	dec (1,sp)
      009B8B A4 07            [ 1] 5084 	jrne 4$
      009B8D 4E               [ 1] 5085 5$: pop a 
                                   5086 ; display saved size  
      009B8E C7 54            [ 2] 5087 	ldw x,(BSIZE,sp) 
      009B90 01 72 16         [ 4] 5088 	call print_int 
      001DA7                       5089 	_drop VSIZE 
      009B93 50 CA            [ 2]    1     addw sp,#VSIZE 
      009B95 72               [ 4] 5090 	ret 
                                   5091 
                                   5092 ;----------------------
                                   5093 ; load file in RAM memory
                                   5094 ; input:
                                   5095 ;    farptr point at file size 
                                   5096 ; output:
                                   5097 ;   y point after BASIC program in RAM.
                                   5098 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      001DAA                       5099 load_file:
      009B96 10 54 01         [ 4] 5100 	call incr_farptr  
      009B99 AE 00 1B         [ 4] 5101 	call clear_basic  
      009B9C 5A               [ 1] 5102 	clrw x
      009B9D 9D 26 FA 20      [ 5] 5103 	ldf a,([farptr],x)
      009BA1 08 72            [ 1] 5104 	ld yh,a 
      009BA3 11               [ 2] 5105 	incw x  
      009BA4 54 01 72 17      [ 5] 5106 	ldf a,([farptr],x)
      009BA8 50               [ 2] 5107 	incw x 
      009BA9 CA AE            [ 1] 5108 	ld yl,a 
      009BAB 00 02 CD 91      [ 2] 5109 	addw y,txtbgn
      009BAF 68 81 00 1C      [ 2] 5110 	ldw txtend,y
      009BB1 90 CE 00 1A      [ 2] 5111 	ldw y,txtbgn
      001DCB                       5112 3$:	; load BASIC text 	
      009BB1 CD 93 49 A1      [ 5] 5113 	ldf a,([farptr],x)
      009BB5 01 27            [ 1] 5114 	ld (y),a 
      009BB7 03               [ 2] 5115 	incw x 
      009BB8 CC 88            [ 2] 5116 	incw y 
      009BBA 09 CD 91 04      [ 2] 5117 	cpw y,txtend 
      009BBE A3 00            [ 1] 5118 	jrmi 3$
      009BC0 05               [ 4] 5119 	ret 
                                   5120 
                                   5121 ;------------------------
                                   5122 ; BASIC: LOAD "file" 
                                   5123 ; load file to RAM 
                                   5124 ; for execution 
                                   5125 ;------------------------
      001DDB                       5126 load:
      009BC1 23 05 A6 0A CC   [ 2] 5127 	btjf flags,#FRUN,0$ 
      009BC6 88 0B            [ 1] 5128 	jreq 0$ 
      009BC8 9F C7            [ 1] 5129 	ld a,#ERR_CMD_ONLY 
      009BCA 00 0A A6         [ 2] 5130 	jp tb_error 
      001DE7                       5131 0$:	
      009BCD 05 C0 00         [ 4] 5132 	call next_token 
      009BD0 0A C7            [ 1] 5133 	cp a,#TK_QSTR
      009BD2 54 00            [ 1] 5134 	jreq 1$
      009BD4 72 16 54         [ 2] 5135 	jp syntax_error 
      001DF1                       5136 1$:	
      009BD7 02 72 10 54      [ 2] 5137 	ldw y,basicptr
      009BDB 01 72 0F 54      [ 2] 5138 	addw y,in.w 
      009BDF 00 FB CE 54 04   [ 1] 5139 	mov in,count 
      009BE4 A6 04 81         [ 4] 5140 	call search_file 
      009BE7 25 05            [ 1] 5141 	jrc 2$ 
      009BE7 52 01            [ 1] 5142 	ld a,#ERR_NOT_FILE
      009BE9 CD 93 49         [ 2] 5143 	jp tb_error  
      001E08                       5144 2$:
      009BEC A1 01 27         [ 4] 5145 	call load_file
                                   5146 ; print loaded size 	 
      009BEF 03 CC 88         [ 2] 5147 	ldw x,txtend 
      009BF2 09 CD 91 04      [ 2] 5148 	subw x,txtbgn
      009BF6 A3 00 0F         [ 4] 5149 	call print_int 
      009BF9 23               [ 4] 5150 	ret 
                                   5151 
                                   5152 ;-----------------------------------
                                   5153 ; BASIC: FORGET ["file_name"] 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5154 ; erase file_name and all others 
                                   5155 ; after it. 
                                   5156 ; without argument erase all files 
                                   5157 ;-----------------------------------
      001E16                       5158 forget:
      009BFA 05 A6 0A         [ 4] 5159 	call next_token 
      009BFD CC 88            [ 1] 5160 	cp a,#TK_NONE 
      009BFF 0B CD            [ 1] 5161 	jreq 3$ 
      009C01 A1 FE            [ 1] 5162 	cp a,#TK_QSTR
      009C03 6B 01            [ 1] 5163 	jreq 1$
      009C05 E6 01 0D         [ 2] 5164 	jp syntax_error
      009C08 01 27 05 44      [ 2] 5165 1$: ldw y,basicptr
      009C0C 0A 01 26 FB      [ 2] 5166 	addw y,in.w
      009C10 A4 01 5F 97 A6   [ 1] 5167 	mov in,count 
      009C15 04 5B 01         [ 4] 5168 	call search_file
      009C18 81 05            [ 1] 5169 	jrc 2$
      009C19 A6 09            [ 1] 5170 	ld a,#ERR_NOT_FILE 
      009C19 52 02 CD         [ 2] 5171 	jp tb_error 
      001E3B                       5172 2$: 
      009C1C 93 25 A1         [ 2] 5173 	ldw x,farptr
      009C1F 02 27 03         [ 1] 5174 	ld a,farptr+2
      009C22 CC 88            [ 2] 5175 	jra 4$ 
      001E43                       5176 3$: ; forget all files 
      009C24 09 CD 91         [ 2] 5177 	ldw x,#0x100
      009C27 04               [ 1] 5178 	clr a 
      009C28 9F 6B 02         [ 2] 5179 	ldw farptr,x 
      009C2B CD 91 04         [ 1] 5180 	ld farptr+2,a 
      001E4D                       5181 4$:
      009C2E A3 00 0F         [ 2] 5182 	ldw ffree,x 
      009C31 23 05 A6         [ 1] 5183 	ld ffree+2,a 
      009C34 0A CC            [ 1] 5184 	push #4
      009C36 88               [ 1] 5185 	clrw x 
      001E56                       5186 5$: 
      009C37 0B               [ 1] 5187 	clr a  
      009C38 CD A1 FE         [ 4] 5188 	call write_byte 
      009C3B 6B               [ 2] 5189 	incw x 
      009C3C 01 A6            [ 1] 5190 	dec (1,sp)
      009C3E 01 0D            [ 1] 5191 	jrne 5$	
      009C40 01               [ 1] 5192 6$: pop a 
      009C41 27               [ 4] 5193 	ret 
                                   5194 
                                   5195 ;----------------------
                                   5196 ; BASIC: DIR 
                                   5197 ; list saved files 
                                   5198 ;----------------------
                           000001  5199 	COUNT=1 ; files counter 
                           000002  5200 	VSIZE=2 
      001E61                       5201 directory:
      001E61                       5202 	_vars VSIZE 
      009C42 05 48            [ 2]    1     sub sp,#VSIZE 
      009C44 0A               [ 1] 5203 	clrw x 
      009C45 01 26            [ 2] 5204 	ldw (COUNT,sp),x 
      009C47 FB 0D 02         [ 2] 5205 	ldw farptr+1,x 
      009C4A 26 05 43 E4      [ 1] 5206 	mov farptr,#1 
      001E6D                       5207 dir_loop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009C4E 00               [ 1] 5208 	clrw x 
      009C4F 20 02 EA 00      [ 5] 5209 	ldf a,([farptr],x)
      009C53 E7 00            [ 1] 5210 	jreq 8$ 
      001E74                       5211 1$: ;name loop 	
      009C55 5B 02 81 12      [ 5] 5212 	ldf a,([farptr],x)
      009C58 27 06            [ 1] 5213 	jreq 2$ 
      009C58 72 00 00         [ 4] 5214 	call putc 
      009C5B 22               [ 2] 5215 	incw x 
      009C5C 02 4F            [ 2] 5216 	jra 1$
      009C5E 81               [ 2] 5217 2$: incw x ; skip ending 0. 
      009C5F A6 20            [ 1] 5218 	ld a,#SPACE 
      009C5F AE 9C 86         [ 4] 5219 	call putc 
                                   5220 ; get file size 	
      009C62 CD 82 5E 5B      [ 5] 5221 	ldf a,([farptr],x)
      009C66 02 52            [ 1] 5222 	ld yh,a 
      009C68 06               [ 2] 5223 	incw x 
      009C69 CD 97 DB AE      [ 5] 5224 	ldf a,([farptr],x)
      009C6D 16               [ 2] 5225 	incw x 
      009C6E C8 CF            [ 1] 5226 	ld yl,a 
      009C70 00 05            [ 2] 5227 	pushw y 
      009C72 7F 72 5F         [ 2] 5228 	addw x,(1,sp)
      009C75 00               [ 2] 5229 	incw x ; skip EOF marker 
                                   5230 ; skip to next file 
      009C76 04 5F CF         [ 4] 5231 	call incr_farptr 
                                   5232 ; print file size 
      009C79 00               [ 2] 5233 	popw x ; file size 
      009C7A 01 72 11         [ 4] 5234 	call print_int 
      009C7D 00 22            [ 1] 5235 	ld a,#CR 
      009C7F 72 18 00         [ 4] 5236 	call putc
      009C82 22 CC            [ 2] 5237 	ldw x,(COUNT,sp)
      009C84 88               [ 2] 5238 	incw x
      009C85 8F 0A            [ 2] 5239 	ldw (COUNT,sp),x  
      009C87 62 72            [ 2] 5240 	jra dir_loop 
      001EAD                       5241 8$: ; print number of files 
      009C89 65 61            [ 2] 5242 	ldw x,(COUNT,sp)
      009C8B 6B 20 70         [ 4] 5243 	call print_int 
      009C8E 6F 69 6E         [ 2] 5244 	ldw x,#file_count 
      009C91 74 2C 20         [ 4] 5245 	call puts  
                                   5246 ; print drive free space 	
      009C94 52 55            [ 1] 5247 	ld a,#0xff 
      009C96 4E 20 74         [ 1] 5248 	sub a,ffree+2 
      009C99 6F 20 72         [ 1] 5249 	ld acc8,a 
      009C9C 65 73            [ 1] 5250 	ld a,#0x7f 
      009C9E 75 6D 65         [ 1] 5251 	sbc a,ffree+1 
      009CA1 2E 0A 00         [ 1] 5252 	ld acc16,a 
      009CA4 A6 02            [ 1] 5253 	ld a,#2 
      009CA4 72 01 00         [ 1] 5254 	sbc a,ffree 
      009CA7 22 02 4F         [ 1] 5255 	ld acc24,a 
      009CAA 81               [ 1] 5256 	clrw x  
      009CAB A6 06            [ 1] 5257 	ld a,#6 
      009CAB CD               [ 1] 5258 	ld xl,a 
      009CAC 86 EB            [ 1] 5259 	ld a,#10 
      009CAE 81 0A 36         [ 4] 5260 	call prti24 
      009CAF AE 1E EA         [ 2] 5261 	ldw x,#drive_free
      009CAF 72 BB 00         [ 4] 5262 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      001EDF                       5263 	_drop VSIZE 
      009CB2 14 24            [ 2]    1     addw sp,#VSIZE 
      009CB4 04               [ 4] 5264 	ret
      009CB5 72 5C 00 13 CF 00 14  5265 file_count: .asciz " files\n"
             81
      009CBD 20 62 79 74 65 73 20  5266 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5267 
                                   5268 ;---------------------
                                   5269 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5270 ; write 1 or more byte to FLASH or EEPROM
                                   5271 ; starting at address  
                                   5272 ; input:
                                   5273 ;   expr1  	is address 
                                   5274 ;   expr2,...,exprn   are bytes to write
                                   5275 ; output:
                                   5276 ;   none 
                                   5277 ;---------------------
                           000001  5278 	ADDR=1
                           000002  5279 	VSIZ=2 
      001EF7                       5280 write:
      001EF7                       5281 	_vars VSIZE 
      009CBD A6 01            [ 2]    1     sub sp,#VSIZE 
      009CBF C7 00 13 5F      [ 1] 5282 	clr farptr ; expect 16 bits address 
      009CC3 CF 00 14         [ 4] 5283 	call expression
      009CC6 A1 04            [ 1] 5284 	cp a,#TK_INTGR 
      009CC6 AE 00            [ 1] 5285 	jreq 0$
      009CC8 03 92 AF         [ 2] 5286 	jp syntax_error
      009CCB 00 13            [ 2] 5287 0$: ldw (ADDR,sp),x 
      009CCD 26 05 5A         [ 4] 5288 	call next_token 
      009CD0 2A F7            [ 1] 5289 	cp a,#TK_COMMA 
      009CD2 20 19            [ 1] 5290 	jreq 1$ 
      009CD4 5C CD            [ 2] 5291 	jra 9$ 
      009CD6 9C AF AE         [ 4] 5292 1$:	call expression
      009CD9 02 7F            [ 1] 5293 	cp a,#TK_INTGR
      009CDB C3 00            [ 1] 5294 	jreq 2$
      009CDD 13 2A E6         [ 2] 5295 	jp syntax_error
      009CE0 72               [ 1] 5296 2$:	ld a,xl 
      009CE1 5F 00            [ 2] 5297 	ldw x,(ADDR,sp) 
      009CE3 16 72 5F         [ 2] 5298 	ldw farptr+1,x 
      009CE6 00               [ 1] 5299 	clrw x 
      009CE7 17 72 5F         [ 4] 5300 	call write_byte
      009CEA 00 18            [ 2] 5301 	ldw x,(ADDR,sp)
      009CEC 81               [ 2] 5302 	incw x 
      009CED 20 DC            [ 2] 5303 	jra 0$ 
      001F2B                       5304 9$:
      001F2B                       5305 	_drop VSIZE
      009CED CE 00            [ 2]    1     addw sp,#VSIZE 
      009CEF 13               [ 4] 5306 	ret 
                                   5307 
                                   5308 
                                   5309 ;---------------------
                                   5310 ;BASIC: CHAR(expr)
                                   5311 ; évaluate expression 
                                   5312 ; and take the 7 least 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   5313 ; bits as ASCII character
                                   5314 ;---------------------
      001F2E                       5315 char:
      009CF0 C6 00 15         [ 4] 5316 	call func_args 
      009CF3 CF 00            [ 1] 5317 	cp a,#1
      009CF5 16 C7            [ 1] 5318 	jreq 1$
      009CF7 00 18 81         [ 2] 5319 	jp syntax_error
      009CFA CD 10 84         [ 4] 5320 1$:	call dpop 
      009CFA 5F               [ 1] 5321 	ld a,xl 
      009CFB 92 AF            [ 1] 5322 	and a,#0x7f 
      009CFD 00               [ 1] 5323 	ld xl,a
      009CFE 13 90            [ 1] 5324 	ld a,#TK_CHAR
      009D00 F1               [ 4] 5325 	ret
                                   5326 
                                   5327 ;---------------------
                                   5328 ; BASIC: ASC(string|char)
                                   5329 ; extract first character 
                                   5330 ; of string argument 
                                   5331 ; return it as TK_INTGR 
                                   5332 ;---------------------
      001F42                       5333 ascii:
      009D01 26 08            [ 1] 5334 	ld a,#TK_LPAREN
      009D03 4D 27 12         [ 4] 5335 	call expect 
      009D06 5C 90 5C         [ 4] 5336 	call next_token 
      009D09 20 F0            [ 1] 5337 	cp a,#TK_QSTR 
      009D0B 27 07            [ 1] 5338 	jreq 1$
      009D0B 4D 27            [ 1] 5339 	cp a,#TK_CHAR 
      009D0D 07 5C            [ 1] 5340 	jreq 2$ 
      009D0F 92 AF 00         [ 2] 5341 	jp syntax_error
      001F55                       5342 1$: 
      009D12 13               [ 1] 5343 	ld a,(x) 
      009D13 20               [ 1] 5344 	clrw x
      009D14 F6               [ 1] 5345 	ld xl,a 
      001F58                       5346 2$: 
      009D15 5C               [ 2] 5347 	pushw x 
      009D16 98 81            [ 1] 5348 	ld a,#TK_RPAREN 
      009D18 CD 12 98         [ 4] 5349 	call expect
      009D18 5C               [ 2] 5350 	popw x 
      009D19 99 81            [ 1] 5351 	ld a,#TK_INTGR 
      009D1B 81               [ 4] 5352 	ret 
                                   5353 
                                   5354 ;---------------------
                                   5355 ;BASIC: KEY
                                   5356 ; wait for a character 
                                   5357 ; received from STDIN 
                                   5358 ; input:
                                   5359 ;	none 
                                   5360 ; output:
                                   5361 ;	X 		ASCII character 
                                   5362 ;---------------------
      001F62                       5363 key:
      009D1B 52 04 17         [ 4] 5364 	call getc 
      009D1E 03               [ 1] 5365 	clrw x 
      009D1F 5F               [ 1] 5366 	ld xl,a 
      009D20 CF 00            [ 1] 5367 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009D22 14               [ 4] 5368 	ret
                                   5369 
                                   5370 ;----------------------
                                   5371 ; BASIC: QKEY
                                   5372 ; Return true if there 
                                   5373 ; is a character in 
                                   5374 ; waiting in STDIN 
                                   5375 ; input:
                                   5376 ;  none 
                                   5377 ; output:
                                   5378 ;   X 		0|-1 
                                   5379 ;-----------------------
      001F6A                       5380 qkey: 
      009D23 35               [ 1] 5381 	clrw x 
      009D24 01 00 13 23      [ 1] 5382 	tnz rx_char
      009D27 27 01            [ 1] 5383 	jreq 9$ 
      009D27 92               [ 2] 5384 	cplw x 
      009D28 BC 00            [ 1] 5385 9$: ld a,#TK_INTGR
      009D2A 13               [ 4] 5386 	ret 
                                   5387 
                                   5388 ;---------------------
                                   5389 ; BASIC: GPIO(expr,reg)
                                   5390 ; return gpio address 
                                   5391 ; expr {0..8}
                                   5392 ; input:
                                   5393 ;   none 
                                   5394 ; output:
                                   5395 ;   X 		gpio register address
                                   5396 ;----------------------------
      001F75                       5397 gpio:
      009D2B 27 25 5F         [ 4] 5398 	call func_args 
      009D2E 16 03            [ 1] 5399 	cp a,#2
      009D30 CD 9C            [ 1] 5400 	jreq 1$
      009D32 FA 25 2D         [ 2] 5401 	jp syntax_error  
      001F7F                       5402 1$:	
      009D35 92 AF 00         [ 2] 5403 	ldw x,#2
      009D38 13 6B 01 5C      [ 5] 5404 	ldw x,([dstkptr],x) ; port 
      009D3C 92 AF            [ 1] 5405 	jrmi bad_port
      009D3E 00 13 6B         [ 2] 5406 	cpw x,#9
      009D41 02 5C            [ 1] 5407 	jrpl bad_port
      009D43 72 FB            [ 1] 5408 	ld a,#5
      009D45 01               [ 4] 5409 	mul x,a
      009D46 5C CD 9C         [ 2] 5410 	addw x,#GPIO_BASE 
      009D49 AF               [ 2] 5411 	pushw x 
      009D4A AE 02 80         [ 4] 5412 	call dpop 
      009D4D C3 00 13         [ 2] 5413 	addw x,(1,sp)
      009D50 2A D5            [ 2] 5414 	ldw (1,sp),x  
      009D52 CD 10 AB         [ 4] 5415 	call ddrop  
      009D52 72               [ 2] 5416 	popw x 
      009D53 5F 00            [ 1] 5417 	ld a,#TK_INTGR
      009D55 13               [ 4] 5418 	ret
      001FA3                       5419 bad_port:
      009D56 72 5F            [ 1] 5420 	ld a,#ERR_BAD_VALUE
      009D58 00 14 72         [ 2] 5421 	jp tb_error
                                   5422 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   5423 
                                   5424 ;-------------------------
                                   5425 ; BASIC: UFLASH 
                                   5426 ; return user flash address
                                   5427 ; input:
                                   5428 ;  none 
                                   5429 ; output:
                                   5430 ;	A		TK_INTGR
                                   5431 ;   X 		user address 
                                   5432 ;---------------------------
      001FA8                       5433 uflash:
      009D5B 5F 00 15         [ 2] 5434 	ldw x,#user_space 
      009D5E 5B 04            [ 1] 5435 	ld a,#TK_INTGR 
      009D60 98               [ 4] 5436 	ret 
                                   5437 
                                   5438 
                                   5439 ;---------------------
                                   5440 ; BASIC: USR(addr[,arg])
                                   5441 ; execute a function written 
                                   5442 ; in binary code.
                                   5443 ; binary fonction should 
                                   5444 ; return token attribute in A 
                                   5445 ; and value in X. 
                                   5446 ; input:
                                   5447 ;   addr	routine address 
                                   5448 ;   arg 	is an optional argument 
                                   5449 ; output:
                                   5450 ;   A 		token attribute 
                                   5451 ;   X       returned value 
                                   5452 ;---------------------
      001FAE                       5453 usr:
      009D61 81 89            [ 2] 5454 	pushw y 	
      009D62 CD 12 C9         [ 4] 5455 	call func_args 
      009D62 5B 04            [ 1] 5456 	cp a,#1 
      009D64 99 81            [ 1] 5457 	jrpl 2$ 
      009D66 CC 07 89         [ 2] 5458 	jp syntax_error 
      001FBA                       5459 2$: 
      009D66 72 01 00         [ 4] 5460 	call dpop 
      009D69 22 05            [ 1] 5461 	cp a,#2 
      009D6B A6 07            [ 1] 5462 	jrmi 4$
      009D6D CC 88            [ 1] 5463 	ldw y,x ; y=arg 
      009D6F 0B 10 84         [ 4] 5464 	call dpop ;x=addr 
      009D70 51               [ 1] 5465 4$:	exgw y,x ; y=addr,x=arg 
      009D70 CE 00            [ 4] 5466 	call (y)
      009D72 1D 72            [ 2] 5467 	popw y 
      009D74 B0               [ 4] 5468 	ret 
                                   5469 
                                   5470 ;------------------------------
                                   5471 ; BASIC: BYE 
                                   5472 ; halt mcu in its lowest power mode 
                                   5473 ; wait for reset or external interrupt
                                   5474 ; do a cold start on wakeup.
                                   5475 ;------------------------------
      001FCC                       5476 bye:
      009D75 00 1B 26 01 81   [ 2] 5477 	btjf UART1_SR,#UART_SR_TC,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009D7A 8E               [10] 5478 	halt
      009D7A 52 04 1F         [ 2] 5479 	jp cold_start  
                                   5480 
                                   5481 ;----------------------------------
                                   5482 ; BASIC: AUTORUN "file_name" 
                                   5483 ; record in eeprom at adrress AUTORUN_NAME
                                   5484 ; the name of file to load and execute
                                   5485 ; at startup 
                                   5486 ; input:
                                   5487 ;   file_name   file to execute 
                                   5488 ; output:
                                   5489 ;   none
                                   5490 ;-----------------------------------
      001FD5                       5491 autorun: 
      009D7D 01 CD 88 BF A1   [ 2] 5492 	btjf flags,#FRUN,0$ 
      009D82 0A 27            [ 1] 5493 	jreq 0$ 
      009D84 03 CC            [ 1] 5494 	ld a,#ERR_CMD_ONLY 
      009D86 88 09 8B         [ 2] 5495 	jp tb_error 
      009D88                       5496 0$:	
      009D88 90 CE 00         [ 4] 5497 	call next_token 
      009D8B 05 72            [ 1] 5498 	cp a,#TK_QSTR
      009D8D B9 00            [ 1] 5499 	jreq 1$
      009D8F 01 17 03         [ 2] 5500 	jp syntax_error 
      001FEB                       5501 1$:	
      009D92 55               [ 2] 5502 	pushw x ; file name char*
      009D93 00 04            [ 1] 5503 	ldw y,x  
      009D95 00 02 93         [ 4] 5504 	call search_file 
      009D98 CD 83            [ 1] 5505 	jrc 2$ 
      009D9A 20 1C            [ 1] 5506 	ld a,#ERR_NOT_FILE
      009D9C 00 03 72         [ 2] 5507 	jp tb_error  
      001FF8                       5508 2$: 
      009D9F FB 01 72 5D 00   [ 1] 5509 	mov in,count 
      009DA4 16 26 0B 72      [ 1] 5510 	clr farptr 
      009DA8 B0 00 17         [ 2] 5511 	ldw x,#AUTORUN_NAME
      009DAB 23 05 A6         [ 2] 5512 	ldw farptr+1,x 
      009DAE 01 CC            [ 2] 5513 	ldw x,(1,sp)  
      009DB0 88 0B A0         [ 4] 5514 	call strlen  ; return length in X 
      009DB2 90 85            [ 2] 5515 	popw y 
      009DB2 16               [ 2] 5516 	pushw x 
      009DB3 03               [ 1] 5517 	clrw x 
      009DB4 CD 9D 1B         [ 4] 5518 	call write_block 
      002013                       5519 	_drop 2 
      009DB7 24 05            [ 2]    1     addw sp,#2 
      009DB9 A6               [ 4] 5520 	ret 
                                   5521 
                                   5522 ;----------------------------------
                                   5523 ; BASIC: SLEEP 
                                   5524 ; halt mcu until reset or external
                                   5525 ; interrupt.
                                   5526 ; Resume progam after SLEEP command
                                   5527 ;----------------------------------
      002016                       5528 sleep:
      009DBA 08 CC 88 0B FB   [ 2] 5529 	btjf UART1_SR,#UART_SR_TC,.
      009DBE 72 16 00 21      [ 1] 5530 	bset flags,#FSLEEP
      009DBE CE               [10] 5531 	halt 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009DBF 00               [ 4] 5532 	ret 
                                   5533 
                                   5534 ;-------------------------------
                                   5535 ; BASIC: PAUSE expr 
                                   5536 ; suspend execution for n msec.
                                   5537 ; input:
                                   5538 ;	none
                                   5539 ; output:
                                   5540 ;	none 
                                   5541 ;------------------------------
      002021                       5542 pause:
      009DC0 16 C6 00         [ 4] 5543 	call expression
      009DC3 18 CF            [ 1] 5544 	cp a,#TK_INTGR
      009DC5 00 13            [ 1] 5545 	jreq pause02 
      009DC7 C7 00 15         [ 2] 5546 	jp syntax_error
      00202B                       5547 pause02: 
      009DCA 1E               [ 2] 5548 1$: tnzw x 
      009DCB 03 CD            [ 1] 5549 	jreq 2$
      009DCD 83               [10] 5550 	wfi 
      009DCE 20               [ 2] 5551 	decw x 
      009DCF 5C 1F            [ 1] 5552 	jrne 1$
      009DD1 01               [ 1] 5553 2$:	clr a 
      009DD2 5F               [ 4] 5554 	ret 
                                   5555 
                                   5556 ;------------------------------
                                   5557 ; BASIC: AWU expr
                                   5558 ; halt mcu for 'expr' milliseconds
                                   5559 ; use Auto wakeup peripheral
                                   5560 ; all oscillators stopped except LSI
                                   5561 ; range: 1ms - 511ms
                                   5562 ; input:
                                   5563 ;  none
                                   5564 ; output:
                                   5565 ;  none:
                                   5566 ;------------------------------
      002034                       5567 awu:
      009DD3 16 03 CD         [ 4] 5568   call expression
      009DD6 81 ED            [ 1] 5569   cp a,#TK_INTGR
      009DD8 CE 00            [ 1] 5570   jreq awu02
      009DDA 1D 72 B0         [ 2] 5571   jp syntax_error
      00203E                       5572 awu02:
      009DDD 00 1B 1F         [ 2] 5573   cpw x,#5120
      009DE0 01 5F            [ 1] 5574   jrmi 1$ 
      009DE2 7B 01 CD 81      [ 1] 5575   mov AWU_TBR,#15 
      009DE6 78 5C            [ 1] 5576   ld a,#30
      009DE8 7B               [ 2] 5577   div x,a
      009DE9 02 CD            [ 1] 5578   ld a,#16
      009DEB 81               [ 2] 5579   div x,a 
      009DEC 78 5C            [ 2] 5580   jra 4$
      00204F                       5581 1$: 
      009DEE CD 9C AF         [ 2] 5582   cpw x,#2048
      009DF1 1E 01            [ 1] 5583   jrmi 2$ 
      009DF3 89 5F 90 CE      [ 1] 5584   mov AWU_TBR,#14
      009DF7 00 1B            [ 1] 5585   ld a,#80
      009DF9 CD               [ 2] 5586   div x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009DFA 81 ED            [ 2] 5587   jra 4$   
      00205D                       5588 2$:
      009DFC 5B 02 AE 00      [ 1] 5589   mov AWU_TBR,#7
      002061                       5590 3$:  
                                   5591 ; while X > 64  divide by 2 and increment AWU_TBR 
      009E00 01 A6 FF         [ 2] 5592   cpw x,#64 
      009E03 CD 81            [ 2] 5593   jrule 4$ 
      009E05 78 CD 9C AF      [ 1] 5594   inc AWU_TBR 
      009E09 CE               [ 2] 5595   srlw x 
      009E0A 00 13            [ 2] 5596   jra 3$ 
      00206D                       5597 4$:
      009E0C C6               [ 1] 5598   ld a, xl
      009E0D 00               [ 1] 5599   dec a 
      009E0E 15 CF            [ 1] 5600   jreq 5$
      009E10 00               [ 1] 5601   dec a 	
      002072                       5602 5$: 
      009E11 16 C7            [ 1] 5603   and a,#0x3e 
      009E13 00 18 5F         [ 1] 5604   ld AWU_APR,a 
      009E16 4B 04 50 F0      [ 1] 5605   bset AWU_CSR,#AWU_CSR_AWUEN
      009E18 8E               [10] 5606   halt 
                                   5607 
      009E18 4F               [ 4] 5608   ret 
                                   5609 
                                   5610 ;------------------------------
                                   5611 ; BASIC: TICKS
                                   5612 ; return msec ticks counter value 
                                   5613 ; input:
                                   5614 ; 	none 
                                   5615 ; output:
                                   5616 ;	X 		TK_INTGR
                                   5617 ;-------------------------------
      00207D                       5618 get_ticks:
      009E19 CD 81 78         [ 2] 5619 	ldw x,ticks 
      009E1C 5C 0A            [ 1] 5620 	ld a,#TK_INTGR
      009E1E 01               [ 4] 5621 	ret 
                                   5622 
                                   5623 
                                   5624 
                                   5625 ;------------------------------
                                   5626 ; BASIC: ABS(expr)
                                   5627 ; return absolute value of expr.
                                   5628 ; input:
                                   5629 ;   none
                                   5630 ; output:
                                   5631 ;   X     	positive integer
                                   5632 ;-------------------------------
      002083                       5633 abs:
      009E1F 26 F7 84         [ 4] 5634 	call func_args 
      009E22 1E 01            [ 1] 5635 	cp a,#1 
      009E24 CD 8A            [ 1] 5636 	jreq 0$ 
      009E26 FE 5B 04         [ 2] 5637 	jp syntax_error
      00208D                       5638 0$:  
      009E29 81 10 84         [ 4] 5639     call dpop   
      009E2A 9E               [ 1] 5640 	ld a,xh 
      009E2A CD 9C            [ 1] 5641 	bcp a,#0x80 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009E2C AF CD            [ 1] 5642 	jreq 2$ 
      009E2E 86               [ 2] 5643 	negw x 
      009E2F EB 5F            [ 1] 5644 2$: ld a,#TK_INTGR 
      009E31 92               [ 4] 5645 	ret 
                                   5646 
                                   5647 ;------------------------------
                                   5648 ; BASIC: AND(expr1,expr2)
                                   5649 ; Apply bit AND relation between
                                   5650 ; the 2 arguments, i.e expr1 & expr2 
                                   5651 ; output:
                                   5652 ; 	A 		TK_INTGR
                                   5653 ;   X 		result 
                                   5654 ;------------------------------
      002099                       5655 bit_and:
      009E32 AF 00 13         [ 4] 5656 	call func_args 
      009E35 90 95            [ 1] 5657 	cp a,#2
      009E37 5C 92            [ 1] 5658 	jreq 1$
      009E39 AF 00 13         [ 2] 5659 	jp syntax_error 
      009E3C 5C 90 97         [ 4] 5660 1$:	call dpop 
      009E3F 72               [ 2] 5661 	pushw x 
      009E40 B9 00 1B         [ 4] 5662 	call dpop 
      009E43 90               [ 1] 5663 	ld a,xh 
      009E44 CF 00            [ 1] 5664 	and a,(1,sp)
      009E46 1D               [ 1] 5665 	ld xh,a 
      009E47 90               [ 1] 5666 	ld a,xl
      009E48 CE 00            [ 1] 5667 	and a,(2,sp)
      009E4A 1B               [ 1] 5668 	ld xl,a 
      009E4B                       5669 	_drop 2 
      009E4B 92 AF            [ 2]    1     addw sp,#2 
      009E4D 00 13            [ 1] 5670 	ld a,#TK_INTGR
      009E4F 90               [ 4] 5671 	ret
                                   5672 
                                   5673 ;------------------------------
                                   5674 ; BASIC: OR(expr1,expr2)
                                   5675 ; Apply bit OR relation between
                                   5676 ; the 2 arguments, i.e expr1 | expr2 
                                   5677 ; output:
                                   5678 ; 	A 		TK_INTGR
                                   5679 ;   X 		result 
                                   5680 ;------------------------------
      0020B7                       5681 bit_or:
      009E50 F7 5C 90         [ 4] 5682 	call func_args 
      009E53 5C 90            [ 1] 5683 	cp a,#2
      009E55 C3 00            [ 1] 5684 	jreq 1$
      009E57 1D 2B F1         [ 2] 5685 	jp syntax_error 
      0020C1                       5686 1$: 
      009E5A 81 10 84         [ 4] 5687 	call dpop 
      009E5B 89               [ 2] 5688 	pushw x 
      009E5B 72 01 00         [ 4] 5689 	call dpop 
      009E5E 22               [ 1] 5690 	ld a,xh 
      009E5F 07 27            [ 1] 5691 	or a,(1,sp)
      009E61 05               [ 1] 5692 	ld xh,a 
      009E62 A6               [ 1] 5693 	ld a,xl 
      009E63 07 CC            [ 1] 5694 	or a,(2,sp)
      009E65 88               [ 1] 5695 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      0020D0                       5696 	_drop 2 
      009E66 0B 02            [ 2]    1     addw sp,#2 
      009E67 A6 04            [ 1] 5697 	ld a,#TK_INTGR 
      009E67 CD               [ 4] 5698 	ret
                                   5699 
                                   5700 ;------------------------------
                                   5701 ; BASIC: XOR(expr1,expr2)
                                   5702 ; Apply bit XOR relation between
                                   5703 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5704 ; output:
                                   5705 ; 	A 		TK_INTGR
                                   5706 ;   X 		result 
                                   5707 ;------------------------------
      0020D5                       5708 bit_xor:
      009E68 88 BF A1         [ 4] 5709 	call func_args 
      009E6B 0A 27            [ 1] 5710 	cp a,#2
      009E6D 03 CC            [ 1] 5711 	jreq 1$
      009E6F 88 09 89         [ 2] 5712 	jp syntax_error 
      009E71                       5713 1$: 
      009E71 90 CE 00         [ 4] 5714 	call dpop 
      009E74 05               [ 2] 5715 	pushw x 
      009E75 72 B9 00         [ 4] 5716 	call dpop 
      009E78 01               [ 1] 5717 	ld a,xh 
      009E79 55 00            [ 1] 5718 	xor a,(1,sp)
      009E7B 04               [ 1] 5719 	ld xh,a 
      009E7C 00               [ 1] 5720 	ld a,xl 
      009E7D 02 CD            [ 1] 5721 	xor a,(2,sp)
      009E7F 9D               [ 1] 5722 	ld xl,a 
      0020EE                       5723 	_drop 2 
      009E80 1B 25            [ 2]    1     addw sp,#2 
      009E82 05 A6            [ 1] 5724 	ld a,#TK_INTGR 
      009E84 09               [ 4] 5725 	ret 
                                   5726 
                                   5727 ;------------------------------
                                   5728 ; BASIC: LSHIFT(expr1,expr2)
                                   5729 ; logical shift left expr1 by 
                                   5730 ; expr2 bits 
                                   5731 ; output:
                                   5732 ; 	A 		TK_INTGR
                                   5733 ;   X 		result 
                                   5734 ;------------------------------
      0020F3                       5735 lshift:
      009E85 CC 88 0B         [ 4] 5736 	call func_args
      009E88 A1 02            [ 1] 5737 	cp a,#2 
      009E88 CD 9E            [ 1] 5738 	jreq 1$
      009E8A 2A CE 00         [ 2] 5739 	jp syntax_error
      009E8D 1D 72 B0         [ 4] 5740 1$: call dpop  
      009E90 00               [ 1] 5741 	exgw x,y 
      009E91 1B CD 8A         [ 4] 5742 	call dpop
      009E94 FE 81            [ 2] 5743 	tnzw y 
      009E96 27 05            [ 1] 5744 	jreq 4$
      009E96 CD               [ 2] 5745 2$:	sllw x 
      009E97 88 BF            [ 2] 5746 	decw y 
      009E99 A1 00            [ 1] 5747 	jrne 2$
      00210D                       5748 4$:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009E9B 27 26            [ 1] 5749 	ld a,#TK_INTGR
      009E9D A1               [ 4] 5750 	ret
                                   5751 
                                   5752 ;------------------------------
                                   5753 ; BASIC: RSHIFT(expr1,expr2)
                                   5754 ; logical shift right expr1 by 
                                   5755 ; expr2 bits.
                                   5756 ; output:
                                   5757 ; 	A 		TK_INTGR
                                   5758 ;   X 		result 
                                   5759 ;------------------------------
      002110                       5760 rshift:
      009E9E 0A 27 03         [ 4] 5761 	call func_args
      009EA1 CC 88            [ 1] 5762 	cp a,#2 
      009EA3 09 90            [ 1] 5763 	jreq 1$
      009EA5 CE 00 05         [ 2] 5764 	jp syntax_error
      009EA8 72 B9 00         [ 4] 5765 1$: call dpop  
      009EAB 01               [ 1] 5766 	exgw x,y 
      009EAC 55 00 04         [ 4] 5767 	call dpop
      009EAF 00 02            [ 2] 5768 	tnzw y 
      009EB1 CD 9D            [ 1] 5769 	jreq 4$
      009EB3 1B               [ 2] 5770 2$:	srlw x 
      009EB4 25 05            [ 2] 5771 	decw y 
      009EB6 A6 09            [ 1] 5772 	jrne 2$
      00212A                       5773 4$:  
      009EB8 CC 88            [ 1] 5774 	ld a,#TK_INTGR
      009EBA 0B               [ 4] 5775 	ret
                                   5776 
                                   5777 ;--------------------------
                                   5778 ; BASIC: FCPU integer
                                   5779 ; set CPU frequency 
                                   5780 ;-------------------------- 
                                   5781 
      009EBB                       5782 fcpu:
      009EBB CE 00            [ 1] 5783 	ld a,#TK_INTGR
      009EBD 13 C6 00         [ 4] 5784 	call expect 
      009EC0 15               [ 1] 5785 	ld a,xl 
      009EC1 20 0A            [ 1] 5786 	and a,#7 
      009EC3 C7 50 C6         [ 1] 5787 	ld CLK_CKDIVR,a 
      009EC3 AE               [ 4] 5788 	ret 
                                   5789 
                                   5790 ;------------------------------
                                   5791 ; BASIC: PMODE pin#, mode 
                                   5792 ; define pin as input or output
                                   5793 ; pin#: {0..15}
                                   5794 ; mode: INPUT|OUTPUT  
                                   5795 ;------------------------------
                           000001  5796 	PINNO=1
                           000001  5797 	VSIZE=1
      002139                       5798 pin_mode:
      002139                       5799 	_vars VSIZE 
      009EC4 01 00            [ 2]    1     sub sp,#VSIZE 
      009EC6 4F CF 00         [ 4] 5800 	call arg_list 
      009EC9 13 C7            [ 1] 5801 	cp a,#2 
      009ECB 00 15            [ 1] 5802 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009ECD CC 07 89         [ 2] 5803 	jp syntax_error 
      009ECD CF 00 16         [ 4] 5804 1$: call dpop ; mode 
      009ED0 C7               [ 1] 5805 	exgw x,y 
      009ED1 00 18 4B         [ 4] 5806 	call dpop ; Dx pin 
      009ED4 04 5F 7E         [ 4] 5807 	call select_pin 
      009ED6 6B 01            [ 1] 5808 	ld (PINNO,sp),a  
      009ED6 4F CD            [ 1] 5809 	ld a,#1 
      009ED8 81 78            [ 1] 5810 	tnz (PINNO,sp)
      009EDA 5C 0A            [ 1] 5811 	jreq 4$
      009EDC 01               [ 1] 5812 2$:	sll a 
      009EDD 26 F7            [ 1] 5813 	dec (PINNO,sp)
      009EDF 84 81            [ 1] 5814 	jrne 2$ 
      009EE1 6B 01            [ 1] 5815 	ld (PINNO,sp),a
      009EE1 52 02            [ 1] 5816 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009EE3 5F 1F            [ 1] 5817 	ld (GPIO_CR1,x),a 
      009EE5 01 CF 00 14      [ 2] 5818 4$:	cpw y,#OUTP 
      009EE9 35 01            [ 1] 5819 	jreq 6$
                                   5820 ; input mode
      009EEB 00 13            [ 1] 5821 	ld a,(PINNO,sp)
      009EED 43               [ 1] 5822 	cpl a 
      009EED 5F 92            [ 1] 5823 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009EEF AF 00            [ 2] 5824 	jra 9$
      00216F                       5825 6$: ;output mode  
      009EF1 13 27            [ 1] 5826 	ld a,(PINNO,sp)
      009EF3 39 04            [ 1] 5827 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009EF4 E7 04            [ 1] 5828 	ld (GPIO_CR2,x),a 
      009EF4 92 AF            [ 1] 5829 	ld a,(PINNO,sp)
      009EF6 00 13            [ 1] 5830 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009EF8 27 06            [ 1] 5831 9$:	ld (GPIO_DDR,x),a 
      00217B                       5832 	_drop VSIZE 
      009EFA CD 82            [ 2]    1     addw sp,#VSIZE 
      009EFC 4B               [ 4] 5833 	ret
                                   5834 
                                   5835 ;------------------------
                                   5836 ; select pin 
                                   5837 ; input:
                                   5838 ;   X 	 {0..15} Arduino Dx 
                                   5839 ; output:
                                   5840 ;   A     stm8s208 pin 
                                   5841 ;   X     base address s208 GPIO port 
                                   5842 ;---------------------------
      00217E                       5843 select_pin:
      009EFD 5C               [ 2] 5844 	sllw x 
      009EFE 20 F4 5C         [ 2] 5845 	addw x,#arduino_to_8s208 
      009F01 A6               [ 2] 5846 	ldw x,(x)
      009F02 20               [ 1] 5847 	ld a,xl 
      009F03 CD               [ 1] 5848 	push a 
      009F04 82               [ 1] 5849 	swapw x 
      009F05 4B 92            [ 1] 5850 	ld a,#5 
      009F07 AF               [ 4] 5851 	mul x,a 
      009F08 00 13 90         [ 2] 5852 	addw x,#GPIO_BASE 
      009F0B 95               [ 1] 5853 	pop a 
      009F0C 5C               [ 4] 5854 	ret 
                                   5855 ; translation from Arduino D0..D15 to stm8s208rb 
      00218E                       5856 arduino_to_8s208:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009F0D 92 AF                 5857 .byte 3,6 ; D0 
      009F0F 00 13                 5858 .byte 3,5 ; D1 
      009F11 5C 90                 5859 .byte 4,0 ; D2 
      009F13 97 90                 5860 .byte 2,1 ; D3
      009F15 89 72                 5861 .byte 6,0 ; D4
      009F17 FB 01                 5862 .byte 2,2 ; D5
      009F19 5C CD                 5863 .byte 2,3 ; D6
      009F1B 9C AF                 5864 .byte 3,1 ; D7
      009F1D 85 CD                 5865 .byte 3,3 ; D8
      009F1F 8A FE                 5866 .byte 2,4 ; D9
      009F21 A6 0D                 5867 .byte 4,5 ; D10
      009F23 CD 82                 5868 .byte 2,6 ; D11
      009F25 4B 1E                 5869 .byte 2,7 ; D12
      009F27 01 5C                 5870 .byte 2,5 ; D13
      009F29 1F 01                 5871 .byte 4,2 ; D14
      009F2B 20 C0                 5872 .byte 4,1 ; D15
                                   5873 
                                   5874 
                                   5875 ;------------------------------
                                   5876 ; BASIC: RND(expr)
                                   5877 ; return random number 
                                   5878 ; between 1 and expr inclusive
                                   5879 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5880 ; input:
                                   5881 ; 	none 
                                   5882 ; output:
                                   5883 ;	X 		random positive integer 
                                   5884 ;------------------------------
      009F2D                       5885 random:
      009F2D 1E 01 CD         [ 4] 5886 	call func_args 
      009F30 8A FE            [ 1] 5887 	cp a,#1
      009F32 AE 9F            [ 1] 5888 	jreq 1$
      009F34 62 CD 82         [ 2] 5889 	jp syntax_error
      0021B8                       5890 1$: 
      009F37 5E A6 FF         [ 4] 5891 	call dpop 
      009F3A C0               [ 2] 5892 	pushw x 
      009F3B 00               [ 1] 5893 	ld a,xh 
      009F3C 18 C7            [ 1] 5894 	bcp a,#0x80 
      009F3E 00 0A            [ 1] 5895 	jreq 2$
      009F40 A6 7F            [ 1] 5896 	ld a,#ERR_BAD_VALUE
      009F42 C2 00 17         [ 2] 5897 	jp tb_error
      0021C6                       5898 2$: 
                                   5899 ; acc16=(x<<5)^x 
      009F45 C7 00 09         [ 2] 5900 	ldw x,seedx 
      009F48 A6               [ 2] 5901 	sllw x 
      009F49 02               [ 2] 5902 	sllw x 
      009F4A C2               [ 2] 5903 	sllw x 
      009F4B 00               [ 2] 5904 	sllw x 
      009F4C 16               [ 2] 5905 	sllw x 
      009F4D C7               [ 1] 5906 	ld a,xh 
      009F4E 00 08 5F         [ 1] 5907 	xor a,seedx 
      009F51 A6 06 97         [ 1] 5908 	ld acc16,a 
      009F54 A6               [ 1] 5909 	ld a,xl 
      009F55 0A CD 8A         [ 1] 5910 	xor a,seedx+1 
      009F58 B6 AE 9F         [ 1] 5911 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   5912 ; seedx=seedy 
      009F5B 6A CD 82         [ 2] 5913 	ldw x,seedy 
      009F5E 5E 5B 02         [ 2] 5914 	ldw seedx,x  
                                   5915 ; seedy=seedy^(seedy>>1)
      009F61 81 20            [ 2] 5916 	srlw y 
      009F63 66 69            [ 1] 5917 	ld a,yh 
      009F65 6C 65 73         [ 1] 5918 	xor a,seedy 
      009F68 0A 00 20         [ 1] 5919 	ld seedy,a  
      009F6B 62 79            [ 1] 5920 	ld a,yl 
      009F6D 74 65 73         [ 1] 5921 	xor a,seedy+1 
      009F70 20 66 72         [ 1] 5922 	ld seedy+1,a 
                                   5923 ; acc16>>3 
      009F73 65 65 0A         [ 2] 5924 	ldw x,acc16 
      009F76 00               [ 2] 5925 	srlw x 
      009F77 54               [ 2] 5926 	srlw x 
      009F77 52               [ 2] 5927 	srlw x 
                                   5928 ; x=acc16^x 
      009F78 02               [ 1] 5929 	ld a,xh 
      009F79 72 5F 00         [ 1] 5930 	xor a,acc16 
      009F7C 13               [ 1] 5931 	ld xh,a 
      009F7D CD               [ 1] 5932 	ld a,xl 
      009F7E 94 29 A1         [ 1] 5933 	xor a,acc8 
      009F81 04               [ 1] 5934 	ld xl,a 
                                   5935 ; seedy=x^seedy 
      009F82 27 03 CC         [ 1] 5936 	xor a,seedy+1
      009F85 88               [ 1] 5937 	ld xl,a 
      009F86 09               [ 1] 5938 	ld a,xh 
      009F87 1F 01 CD         [ 1] 5939 	xor a,seedy
      009F8A 88               [ 1] 5940 	ld xh,a 
      009F8B BF A1 0D         [ 2] 5941 	ldw seedy,x 
                                   5942 ; return seedy modulo expr + 1 
      009F8E 27 02            [ 2] 5943 	popw y 
      009F90 20               [ 2] 5944 	divw x,y 
      009F91 19               [ 1] 5945 	ldw x,y 
      009F92 CD               [ 2] 5946 	incw x 
      009F93 94 29            [ 1] 5947 	ld a,#TK_INTGR
      009F95 A1               [ 4] 5948 	ret 
                                   5949 
                                   5950 ;---------------------------------
                                   5951 ; BASIC: WORDS 
                                   5952 ; affiche la listes des mots du
                                   5953 ; dictionnaire.
                                   5954 ;---------------------------------
                           000001  5955 	WLEN=1
                           000002  5956 	LLEN=2  
                           000002  5957 	VSIZE=2 
      002218                       5958 words:
      002218                       5959 	_vars VSIZE
      009F96 04 27            [ 2]    1     sub sp,#VSIZE 
      009F98 03 CC            [ 1] 5960 	clr (LLEN,sp)
      009F9A 88 09 9F 1E      [ 2] 5961 	ldw y,#kword_dict+2
      009F9E 01               [ 1] 5962 0$:	ldw x,y
      009F9F CF               [ 1] 5963 	ld a,(x)
      009FA0 00 14            [ 1] 5964 	and a,#15 
      009FA2 5F CD            [ 1] 5965 	ld (WLEN,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009FA4 81               [ 2] 5966 1$:	incw x 
      009FA5 78               [ 1] 5967 	ld a,(x)
      009FA6 1E 01 5C         [ 4] 5968 	call putc 
      009FA9 20 DC            [ 1] 5969 	inc (LLEN,sp)
      009FAB 0A 01            [ 1] 5970 	dec (WLEN,sp)
      009FAB 5B 02            [ 1] 5971 	jrne 1$
      009FAD 81 46            [ 1] 5972 	ld a,#70
      009FAE 11 02            [ 1] 5973 	cp a,(LLEN,sp)
      009FAE CD 93            [ 1] 5974 	jrmi 2$   
      009FB0 49 A1            [ 1] 5975 	ld a,#SPACE 
      009FB2 01 27 03         [ 4] 5976 	call putc 
      009FB5 CC 88            [ 1] 5977 	inc (LLEN,sp) 
      009FB7 09 CD            [ 2] 5978 	jra 3$
      009FB9 91 04            [ 1] 5979 2$: ld a,#CR 
      009FBB 9F A4 7F         [ 4] 5980 	call putc 
      009FBE 97 A6            [ 1] 5981 	clr (LLEN,sp)
      009FC0 03 81 00 02      [ 2] 5982 3$:	subw y,#2 
      009FC2 90 FE            [ 2] 5983 	ldw y,(y)
      009FC2 A6 0B            [ 1] 5984 	jrne 0$  
      00224F                       5985 	_drop VSIZE 
      009FC4 CD 93            [ 2]    1     addw sp,#VSIZE 
      009FC6 18               [ 4] 5986 	ret 
                                   5987 
                                   5988 
                                   5989 ;-----------------------------
                                   5990 ; BASIC: TIMER expr 
                                   5991 ; initialize count down timer 
                                   5992 ;-----------------------------
      002252                       5993 set_timer:
      009FC7 CD 88 BF         [ 4] 5994 	call arg_list
      009FCA A1 0A            [ 1] 5995 	cp a,#1 
      009FCC 27 07            [ 1] 5996 	jreq 1$
      009FCE A1 03 27         [ 2] 5997 	jp syntax_error
      00225C                       5998 1$: 
      009FD1 06 CC 88         [ 4] 5999 	call dpop 
      009FD4 09 00 0C         [ 2] 6000 	ldw timer,x 
      009FD5 81               [ 4] 6001 	ret 
                                   6002 
                                   6003 ;------------------------------
                                   6004 ; BASIC: TIMEOUT 
                                   6005 ; return state of timer 
                                   6006 ;------------------------------
      002263                       6007 timeout:
      009FD5 F6 5F 97         [ 2] 6008 	ldw x,timer 
      009FD8                       6009 logical_complement:
      009FD8 89               [ 2] 6010 	cplw x 
      009FD9 A6 0C CD         [ 2] 6011 	cpw x,#-1
      009FDC 93 18            [ 1] 6012 	jreq 2$
      009FDE 85               [ 1] 6013 	clrw x 
      009FDF A6 04            [ 1] 6014 2$:	ld a,#TK_INTGR
      009FE1 81               [ 4] 6015 	ret 
                                   6016 
                                   6017 ;--------------------------------
                                   6018 ; BASIC NOT(expr) 
                                   6019 ; return logical complement of expr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                   6020 ;--------------------------------
      009FE2                       6021 func_not:
      009FE2 CD 82 54         [ 4] 6022 	call func_args  
      009FE5 5F 97            [ 1] 6023 	cp a,#1
      009FE7 A6 04            [ 1] 6024 	jreq 1$
      009FE9 81 07 89         [ 2] 6025 	jp syntax_error
      009FEA CD 10 84         [ 4] 6026 1$:	call dpop 
      009FEA 5F 72            [ 2] 6027 	jra logical_complement
                                   6028 
                                   6029 
                                   6030 
                                   6031 ;-----------------------------------
                                   6032 ; BASIC: IWDGEN expr1 
                                   6033 ; enable independant watchdog timer
                                   6034 ; expr1 is delay in multiple of 62.5µsec
                                   6035 ; expr1 -> {1..16383}
                                   6036 ;-----------------------------------
      00227F                       6037 enable_iwdg:
      009FEC 5D 00 24         [ 4] 6038 	call arg_list
      009FEF 27 01            [ 1] 6039 	cp a,#1 
      009FF1 53 A6            [ 1] 6040 	jreq 1$
      009FF3 04 81 89         [ 2] 6041 	jp syntax_error 
      009FF5 4B 00            [ 1] 6042 1$: push #0
      009FF5 CD 93 49 A1      [ 1] 6043 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009FF9 02 27 03         [ 4] 6044 	call dpop
      009FFC CC               [ 1] 6045 	ld a,xh 
      009FFD 88 09            [ 1] 6046 	and a,#0x3f
      009FFF 95               [ 1] 6047 	ld xh,a  
      009FFF AE 00 02         [ 2] 6048 2$:	cpw x,#255
      00A002 72 DE            [ 2] 6049 	jrule 3$
      00A004 00 19            [ 1] 6050 	inc (1,sp)
      00A006 2B               [ 1] 6051 	rcf 
      00A007 1B               [ 2] 6052 	rrcw x 
      00A008 A3 00            [ 2] 6053 	jra 2$
      00A00A 09 2A 16 A6      [ 1] 6054 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A00E 05               [ 1] 6055 	pop a  
      00A00F 42 1C 50         [ 1] 6056 	ld IWDG_PR,a 
      00A012 00               [ 1] 6057 	ld a,xl
      00A013 89               [ 1] 6058 	dec a 
      00A014 CD 91 04 72      [ 1] 6059 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A018 FB 01 1F         [ 1] 6060 	ld IWDG_RLR,a 
      00A01B 01 CD 91 2B      [ 1] 6061 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A01F 85               [ 4] 6062 	ret 
                                   6063 
                                   6064 
                                   6065 ;-----------------------------------
                                   6066 ; BASIC: IWDGREF  
                                   6067 ; refresh independant watchdog count down 
                                   6068 ; timer before it reset MCU. 
                                   6069 ;-----------------------------------
      0022B7                       6070 refresh_iwdg:
      00A020 A6 04 81 E0      [ 1] 6071 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A023 81               [ 4] 6072 	ret 
                                   6073 
                                   6074 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                   6075 ;-------------------------------------
                                   6076 ; BASIC: LOG(expr)
                                   6077 ; return logarithm base 2 of expr 
                                   6078 ; this is the position of most significant
                                   6079 ; bit set. 
                                   6080 ; input: 
                                   6081 ; output:
                                   6082 ;   X     log2 
                                   6083 ;   A     TK_INTGR 
                                   6084 ;*********************************
      0022BC                       6085 log2:
      00A023 A6 0A CC         [ 4] 6086 	call func_args 
      00A026 88 0B            [ 1] 6087 	cp a,#1 
      00A028 27 03            [ 1] 6088 	jreq 1$
      00A028 AE A7 00         [ 2] 6089 	jp syntax_error 
      00A02B A6 04 81         [ 4] 6090 1$: call dpop
      00A02E                       6091 leading_one:
      00A02E 90               [ 2] 6092 	tnzw x 
      00A02F 89 CD            [ 1] 6093 	jreq 4$
      00A031 93 49            [ 1] 6094 	ld a,#15 
      00A033 A1               [ 2] 6095 2$: rlcw x 
      00A034 01 2A            [ 1] 6096     jrc 3$
      00A036 03               [ 1] 6097 	dec a 
      00A037 CC 88            [ 2] 6098 	jra 2$
      00A039 09               [ 1] 6099 3$: clrw x 
      00A03A 97               [ 1] 6100     ld xl,a
      00A03A CD 91            [ 1] 6101 4$:	ld a,#TK_INTGR
      00A03C 04               [ 4] 6102 	ret 
                                   6103 
                                   6104 ;-----------------------------------
                                   6105 ; BASIC: BITMASK(expr) 
                                   6106 ; expr ->{0..15}
                                   6107 ; return 2^expr 
                                   6108 ; output:
                                   6109 ;    x    2^expr 
                                   6110 ;-----------------------------------
      0022D9                       6111 bitmask:
      00A03D A1 02 2B         [ 4] 6112     call func_args 
      00A040 05 90            [ 1] 6113 	cp a,#1
      00A042 93 CD            [ 1] 6114 	jreq 1$
      00A044 91 04 51         [ 2] 6115 	jp syntax_error 
      00A047 90 FD 90         [ 4] 6116 1$: call dpop 
      00A04A 85               [ 1] 6117 	ld a,xl 
      00A04B 81 0F            [ 1] 6118 	and a,#15
      00A04C 5F               [ 1] 6119 	clrw x 
      00A04C 72               [ 2] 6120 	incw x 
      00A04D 0D               [ 1] 6121 2$: tnz a 
      00A04E 52 30            [ 1] 6122 	jreq 3$
      00A050 FB               [ 2] 6123 	slaw x 
      00A051 8E               [ 1] 6124 	dec a 
      00A052 CC 85            [ 2] 6125 	jra 2$ 
      00A054 FA 04            [ 1] 6126 3$: ld a,#TK_INTGR
      00A055 81               [ 4] 6127 	ret 
                                   6128 
                                   6129 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                   6130 ; BASIC: INVERT(expr)
                                   6131 ; 1's complement 
                                   6132 ;--------------------------------
      0022F5                       6133 invert:
      00A055 72 01 00         [ 4] 6134 	call func_args
      00A058 22 07            [ 1] 6135 	cp a,#1 
      00A05A 27 05            [ 1] 6136 	jreq 1$
      00A05C A6 07 CC         [ 2] 6137 	jp syntax_error
      00A05F 88 0B 84         [ 4] 6138 1$: call dpop 
      00A061 53               [ 2] 6139 	cplw x 
      00A061 CD 88            [ 1] 6140 	ld a,#TK_INTGR 
      00A063 BF               [ 4] 6141 	ret 
                                   6142 
                                   6143 ;------------------------------
                                   6144 ; BASIC: DO 
                                   6145 ; initiate a DO ... UNTIL loop 
                                   6146 ;------------------------------
      002306                       6147 do_loop:
      00A064 A1               [ 2] 6148 	popw x 
      002307                       6149 	_vars 4 
      00A065 0A 27            [ 2]    1     sub sp,#4 
      00A067 03               [ 2] 6150 	pushw x 
      00A068 CC 88 09         [ 2] 6151 	jp store_loop_addr
                                   6152 
                                   6153 ;--------------------------------
                                   6154 ; BASIC: UNTIL expr 
                                   6155 ; loop if exprssion is false 
                                   6156 ; else terminate loop
                                   6157 ;--------------------------------
      00A06B                       6158 until: 
      00A06B 89 90 93 CD      [ 1] 6159 	tnz loop_depth 
      00A06F 9D 1B            [ 1] 6160 	jrne 1$ 
      00A071 25 05 A6         [ 2] 6161 	jp syntax_error 
      002316                       6162 1$: 
      00A074 09 CC 88         [ 4] 6163 	call relation 
      00A077 0B 04            [ 1] 6164 	cp a,#TK_INTGR
      00A078 27 03            [ 1] 6165 	jreq 2$
      00A078 55 00 04         [ 2] 6166 	jp syntax_error
      002320                       6167 2$: 
      00A07B 00               [ 2] 6168 	tnzw x 
      00A07C 02 72            [ 1] 6169 	jrne 9$
      00A07E 5F 00 13         [ 2] 6170 	jp loop_back 
      002326                       6171 9$:	; remove loop info cstack  
      00A081 AE               [ 2] 6172 	popw x
      002327                       6173 	_drop 4
      00A082 40 00            [ 2]    1     addw sp,#4 
      00A084 CF               [ 2] 6174 	pushw x 
      00A085 00 14 1E 01      [ 1] 6175 	dec loop_depth 
      00A089 CD               [ 4] 6176 	ret 
                                   6177 
                                   6178 
                                   6179 ;------------------------------
                                   6180 ;      dictionary 
                                   6181 ; format:
                                   6182 ;   link:   2 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                   6183 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6184 ;   cmd_name: 16 byte max 
                                   6185 ;   code_address: 2 bytes 
                                   6186 ;------------------------------
                                   6187 	.macro _dict_entry len,name,cmd 
                                   6188 	.word LINK 
                                   6189 	LINK=.
                                   6190 name:
                                   6191 	.byte len 	
                                   6192 	.ascii "name"
                                   6193 	.word cmd 
                                   6194 	.endm 
                                   6195 
                           000000  6196 	LINK=0
      00232F                       6197 kword_end:
      00232F                       6198 	_dict_entry,5+F_IFUNC,XPEEK,xpeek 
      00A08A 83 20                    1 	.word LINK 
                           002331     2 	LINK=.
      002331                          3 XPEEK:
      00A08C 90                       4 	.byte 5+F_IFUNC 	
      00A08D 85 89 5F CD 81           5 	.ascii "XPEEK"
      00A092 ED 5B                    6 	.word xpeek 
      002339                       6199 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      00A094 02 81                    1 	.word LINK 
                           00233B     2 	LINK=.
      00A096                          3 XOR:
      00A096 72                       4 	.byte 3+F_IFUNC 	
      00A097 0D 52 30                 5 	.ascii "XOR"
      00A09A FB 72                    6 	.word bit_xor 
      002341                       6200 	_dict_entry,5,WRITE,write  
      00A09C 16 00                    1 	.word LINK 
                           002343     2 	LINK=.
      002343                          3 WRITE:
      00A09E 22                       4 	.byte 5 	
      00A09F 8E 81 49 54 45           5 	.ascii "WRITE"
      00A0A1 1E F7                    6 	.word write 
      00234B                       6201 	_dict_entry,5,WORDS,words 
      00A0A1 CD 94                    1 	.word LINK 
                           00234D     2 	LINK=.
      00234D                          3 WORDS:
      00A0A3 29                       4 	.byte 5 	
      00A0A4 A1 04 27 03 CC           5 	.ascii "WORDS"
      00A0A9 88 09                    6 	.word words 
      00A0AB                       6202 	_dict_entry 4,WAIT,wait 
      00A0AB 5D 27                    1 	.word LINK 
                           002357     2 	LINK=.
      002357                          3 WAIT:
      00A0AD 04                       4 	.byte 4 	
      00A0AE 8F 5A 26 F9              5 	.ascii "WAIT"
      00A0B2 4F 81                    6 	.word wait 
      00A0B4                       6203 	_dict_entry,3+F_IFUNC,USR,usr
      00A0B4 CD 94                    1 	.word LINK 
                           002360     2 	LINK=.
      002360                          3 USR:
      00A0B6 29                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00A0B7 A1 04 27                 5 	.ascii "USR"
      00A0BA 03 CC                    6 	.word usr 
      002366                       6204 	_dict_entry,5,UNTIL,until 
      00A0BC 88 09                    1 	.word LINK 
                           002368     2 	LINK=.
      00A0BE                          3 UNTIL:
      00A0BE A3                       4 	.byte 5 	
      00A0BF 14 00 2B 0C 35           5 	.ascii "UNTIL"
      00A0C4 0F 50                    6 	.word until 
      002370                       6205 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00A0C6 F2 A6                    1 	.word LINK 
                           002372     2 	LINK=.
      002372                          3 UFLASH:
      00A0C8 1E                       4 	.byte 6+F_IFUNC 	
      00A0C9 62 A6 10 62 20 1E        5 	.ascii "UFLASH"
      00A0CF 1F A8                    6 	.word uflash 
      00237B                       6206 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      00A0CF A3 08                    1 	.word LINK 
                           00237D     2 	LINK=.
      00237D                          3 UBOUND:
      00A0D1 00                       4 	.byte 6+F_IFUNC 	
      00A0D2 2B 09 35 0E 50 F2        5 	.ascii "UBOUND"
      00A0D8 A6 50                    6 	.word ubound 
      002386                       6207 	_dict_entry,4,TONE,tone  
      00A0DA 62 20                    1 	.word LINK 
                           002388     2 	LINK=.
      002388                          3 TONE:
      00A0DC 10                       4 	.byte 4 	
      00A0DD 54 4F 4E 45              5 	.ascii "TONE"
      00A0DD 35 07                    6 	.word tone 
      00238F                       6208 	_dict_entry,2,TO,to
      00A0DF 50 F2                    1 	.word LINK 
                           002391     2 	LINK=.
      00A0E1                          3 TO:
      00A0E1 A3                       4 	.byte 2 	
      00A0E2 00 40                    5 	.ascii "TO"
      00A0E4 23 07                    6 	.word to 
      002396                       6209 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A0E6 72 5C                    1 	.word LINK 
                           002398     2 	LINK=.
      002398                          3 TIMEOUT:
      00A0E8 50                       4 	.byte 7+F_IFUNC 	
      00A0E9 F2 54 20 F4 4F 55 54     5 	.ascii "TIMEOUT"
      00A0ED 22 63                    6 	.word timeout 
      0023A2                       6210 	_dict_entry,5,TIMER,set_timer
      00A0ED 9F 4A                    1 	.word LINK 
                           0023A4     2 	LINK=.
      0023A4                          3 TIMER:
      00A0EF 27                       4 	.byte 5 	
      00A0F0 01 4A 4D 45 52           5 	.ascii "TIMER"
      00A0F2 22 52                    6 	.word set_timer 
      0023AC                       6211 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A0F2 A4 3E                    1 	.word LINK 
                           0023AE     2 	LINK=.
      0023AE                          3 TICKS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      00A0F4 C7                       4 	.byte 5+F_IFUNC 	
      00A0F5 50 F1 72 18 50           5 	.ascii "TICKS"
      00A0FA F0 8E                    6 	.word get_ticks 
      0023B6                       6212 	_dict_entry,4,STOP,stop 
      00A0FC 81 AE                    1 	.word LINK 
                           0023B8     2 	LINK=.
      00A0FD                          3 STOP:
      00A0FD CE                       4 	.byte 4 	
      00A0FE 00 0B A6 04              5 	.ascii "STOP"
      00A102 81 8B                    6 	.word stop 
      00A103                       6213 	_dict_entry,4,STEP,step 
      00A103 CD 93                    1 	.word LINK 
                           0023C1     2 	LINK=.
      0023C1                          3 STEP:
      00A105 49                       4 	.byte 4 	
      00A106 A1 01 27 03              5 	.ascii "STEP"
      00A10A CC 88                    6 	.word step 
      0023C8                       6214 	_dict_entry,5,SLEEP,sleep 
      00A10C 09 C1                    1 	.word LINK 
                           0023CA     2 	LINK=.
      00A10D                          3 SLEEP:
      00A10D CD                       4 	.byte 5 	
      00A10E 91 04 9E A5 80           5 	.ascii "SLEEP"
      00A113 27 01                    6 	.word sleep 
      0023D2                       6215 	_dict_entry,4+F_IFUNC,SIZE,size
      00A115 50 A6                    1 	.word LINK 
                           0023D4     2 	LINK=.
      0023D4                          3 SIZE:
      00A117 04                       4 	.byte 4+F_IFUNC 	
      00A118 81 49 5A 45              5 	.ascii "SIZE"
      00A119 14 5E                    6 	.word size 
      0023DB                       6216     _dict_entry,4,SHOW,show 
      00A119 CD 93                    1 	.word LINK 
                           0023DD     2 	LINK=.
      0023DD                          3 SHOW:
      00A11B 49                       4 	.byte 4 	
      00A11C A1 02 27 03              5 	.ascii "SHOW"
      00A120 CC 88                    6 	.word show 
      0023E4                       6217 	_dict_entry,4,SAVE,save
      00A122 09 CD                    1 	.word LINK 
                           0023E6     2 	LINK=.
      0023E6                          3 SAVE:
      00A124 91                       4 	.byte 4 	
      00A125 04 89 CD 91              5 	.ascii "SAVE"
      00A129 04 9E                    6 	.word save 
      0023ED                       6218 	_dict_entry 3,RUN,run
      00A12B 14 01                    1 	.word LINK 
                           0023EF     2 	LINK=.
      0023EF                          3 RUN:
      00A12D 95                       4 	.byte 3 	
      00A12E 9F 14 02                 5 	.ascii "RUN"
      00A131 97 5B                    6 	.word run 
      0023F5                       6219 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A133 02 A6                    1 	.word LINK 
                           0023F7     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      0023F7                          3 RSHIFT:
      00A135 04                       4 	.byte 6+F_IFUNC 	
      00A136 81 53 48 49 46 54        5 	.ascii "RSHIFT"
      00A137 21 10                    6 	.word rshift 
      002400                       6220 	_dict_entry,3+F_IFUNC,RND,random 
      00A137 CD 93                    1 	.word LINK 
                           002402     2 	LINK=.
      002402                          3 RND:
      00A139 49                       4 	.byte 3+F_IFUNC 	
      00A13A A1 02 27                 5 	.ascii "RND"
      00A13D 03 CC                    6 	.word random 
      002408                       6221 	_dict_entry,6,RETURN,return 
      00A13F 88 09                    1 	.word LINK 
                           00240A     2 	LINK=.
      00A141                          3 RETURN:
      00A141 CD                       4 	.byte 6 	
      00A142 91 04 89 CD 91 04        5 	.ascii "RETURN"
      00A148 9E 1A                    6 	.word return 
      002413                       6222 	_dict_entry 6,REMARK,rem 
      00A14A 01 95                    1 	.word LINK 
                           002415     2 	LINK=.
      002415                          3 REMARK:
      00A14C 9F                       4 	.byte 6 	
      00A14D 1A 02 97 5B 02 A6        5 	.ascii "REMARK"
      00A153 04 81                    6 	.word rem 
      00A155                       6223 	_dict_entry,6,REBOOT,cold_start 
      00A155 CD 93                    1 	.word LINK 
                           002420     2 	LINK=.
      002420                          3 REBOOT:
      00A157 49                       4 	.byte 6 	
      00A158 A1 02 27 03 CC 88        5 	.ascii "REBOOT"
      00A15E 09 7A                    6 	.word cold_start 
      00A15F                       6224 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A15F CD 91                    1 	.word LINK 
                           00242B     2 	LINK=.
      00242B                          3 QKEY:
      00A161 04                       4 	.byte 4+F_IFUNC 	
      00A162 89 CD 91 04              5 	.ascii "QKEY"
      00A166 9E 18                    6 	.word qkey 
      002432                       6225 	_dict_entry,4+F_CONST,PRTI,8
      00A168 01 95                    1 	.word LINK 
                           002434     2 	LINK=.
      002434                          3 PRTI:
      00A16A 9F                       4 	.byte 4+F_CONST 	
      00A16B 18 02 97 5B              5 	.ascii "PRTI"
      00A16F 02 A6                    6 	.word 8 
      00243B                       6226 	_dict_entry,4+F_CONST,PRTH,7
      00A171 04 81                    1 	.word LINK 
                           00243D     2 	LINK=.
      00A173                          3 PRTH:
      00A173 CD                       4 	.byte 4+F_CONST 	
      00A174 93 49 A1 02              5 	.ascii "PRTH"
      00A178 27 03                    6 	.word 7 
      002444                       6227 	_dict_entry,4+F_CONST,PRTG,6
      00A17A CC 88                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                           002446     2 	LINK=.
      002446                          3 PRTG:
      00A17C 09                       4 	.byte 4+F_CONST 	
      00A17D CD 91 04 51              5 	.ascii "PRTG"
      00A181 CD 91                    6 	.word 6 
      00244D                       6228 	_dict_entry,4+F_CONST,PRTF,5
      00A183 04 90                    1 	.word LINK 
                           00244F     2 	LINK=.
      00244F                          3 PRTF:
      00A185 5D                       4 	.byte 4+F_CONST 	
      00A186 27 05 58 90              5 	.ascii "PRTF"
      00A18A 5A 26                    6 	.word 5 
      002456                       6229 	_dict_entry,4+F_CONST,PRTE,4
      00A18C FB 4F                    1 	.word LINK 
                           002458     2 	LINK=.
      00A18D                          3 PRTE:
      00A18D A6                       4 	.byte 4+F_CONST 	
      00A18E 04 81 54 45              5 	.ascii "PRTE"
      00A190 00 04                    6 	.word 4 
      00245F                       6230 	_dict_entry,4+F_CONST,PRTD,3
      00A190 CD 93                    1 	.word LINK 
                           002461     2 	LINK=.
      002461                          3 PRTD:
      00A192 49                       4 	.byte 4+F_CONST 	
      00A193 A1 02 27 03              5 	.ascii "PRTD"
      00A197 CC 88                    6 	.word 3 
      002468                       6231 	_dict_entry,4+F_CONST,PRTC,2
      00A199 09 CD                    1 	.word LINK 
                           00246A     2 	LINK=.
      00246A                          3 PRTC:
      00A19B 91                       4 	.byte 4+F_CONST 	
      00A19C 04 51 CD 91              5 	.ascii "PRTC"
      00A1A0 04 90                    6 	.word 2 
      002471                       6232 	_dict_entry,4+F_CONST,PRTB,1
      00A1A2 5D 27                    1 	.word LINK 
                           002473     2 	LINK=.
      002473                          3 PRTB:
      00A1A4 05                       4 	.byte 4+F_CONST 	
      00A1A5 54 90 5A 26              5 	.ascii "PRTB"
      00A1A9 FB 01                    6 	.word 1 
      00A1AA                       6233 	_dict_entry,4+F_CONST,PRTA,0
      00A1AA A6 04                    1 	.word LINK 
                           00247C     2 	LINK=.
      00247C                          3 PRTA:
      00A1AC 81                       4 	.byte 4+F_CONST 	
      00A1AD 50 52 54 41              5 	.ascii "PRTA"
      00A1AD A6 04                    6 	.word 0 
      002483                       6234 	_dict_entry 5,PRINT,print 
      00A1AF CD 93                    1 	.word LINK 
                           002485     2 	LINK=.
      002485                          3 PRINT:
      00A1B1 18                       4 	.byte 5 	
      00A1B2 9F A4 07 C7 50           5 	.ascii "PRINT"
      00A1B7 C6 81                    6 	.word print 
      00A1B9                       6235 	_dict_entry,4+F_CONST,POUT,OUTP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A1B9 52 01                    1 	.word LINK 
                           00248F     2 	LINK=.
      00248F                          3 POUT:
      00A1BB CD                       4 	.byte 4+F_CONST 	
      00A1BC 93 25 A1 02              5 	.ascii "POUT"
      00A1C0 27 03                    6 	.word OUTP 
      002496                       6236 	_dict_entry,4,POKE,poke 
      00A1C2 CC 88                    1 	.word LINK 
                           002498     2 	LINK=.
      002498                          3 POKE:
      00A1C4 09                       4 	.byte 4 	
      00A1C5 CD 91 04 51              5 	.ascii "POKE"
      00A1C9 CD 91                    6 	.word poke 
      00249F                       6237 	_dict_entry,4+F_CONST,PINP,INP 
      00A1CB 04 CD                    1 	.word LINK 
                           0024A1     2 	LINK=.
      0024A1                          3 PINP:
      00A1CD A1                       4 	.byte 4+F_CONST 	
      00A1CE FE 6B 01 A6              5 	.ascii "PINP"
      00A1D2 01 0D                    6 	.word INP 
      0024A8                       6238 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A1D4 01 27                    1 	.word LINK 
                           0024AA     2 	LINK=.
      0024AA                          3 PEEK:
      00A1D6 0B                       4 	.byte 4+F_IFUNC 	
      00A1D7 48 0A 01 26              5 	.ascii "PEEK"
      00A1DB FB 6B                    6 	.word peek 
      0024B1                       6239 	_dict_entry,5,PMODE,pin_mode 
      00A1DD 01 EA                    1 	.word LINK 
                           0024B3     2 	LINK=.
      0024B3                          3 PMODE:
      00A1DF 03                       4 	.byte 5 	
      00A1E0 E7 03 90 A3 00           5 	.ascii "PMODE"
      00A1E5 01 27                    6 	.word pin_mode 
      0024BB                       6240 	_dict_entry,5,PAUSE,pause 
      00A1E7 07 7B                    1 	.word LINK 
                           0024BD     2 	LINK=.
      0024BD                          3 PAUSE:
      00A1E9 01                       4 	.byte 5 	
      00A1EA 43 E4 02 20 0A           5 	.ascii "PAUSE"
      00A1EF 20 21                    6 	.word pause 
      0024C5                       6241 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A1EF 7B 01                    1 	.word LINK 
                           0024C7     2 	LINK=.
      0024C7                          3 OR:
      00A1F1 EA                       4 	.byte 2+F_IFUNC 	
      00A1F2 04 E7                    5 	.ascii "OR"
      00A1F4 04 7B                    6 	.word bit_or 
      0024CC                       6242 	_dict_entry,3+F_CONST,ODR,GPIO_ODR
      00A1F6 01 EA                    1 	.word LINK 
                           0024CE     2 	LINK=.
      0024CE                          3 ODR:
      00A1F8 02                       4 	.byte 3+F_CONST 	
      00A1F9 E7 02 5B                 5 	.ascii "ODR"
      00A1FC 01 81                    6 	.word GPIO_ODR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A1FE                       6243 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A1FE 58 1C                    1 	.word LINK 
                           0024D6     2 	LINK=.
      0024D6                          3 NOT:
      00A200 A2                       4 	.byte 3+F_IFUNC 	
      00A201 0E FE 9F                 5 	.ascii "NOT"
      00A204 88 5E                    6 	.word func_not 
      0024DC                       6244 	_dict_entry,3,NEW,new
      00A206 A6 05                    1 	.word LINK 
                           0024DE     2 	LINK=.
      0024DE                          3 NEW:
      00A208 42                       4 	.byte 3 	
      00A209 1C 50 00                 5 	.ascii "NEW"
      00A20C 84 81                    6 	.word new 
      00A20E                       6245 	_dict_entry,4,NEXT,next 
      00A20E 03 06                    1 	.word LINK 
                           0024E6     2 	LINK=.
      0024E6                          3 NEXT:
      00A210 03                       4 	.byte 4 	
      00A211 05 04 00 02              5 	.ascii "NEXT"
      00A215 01 06                    6 	.word next 
      0024ED                       6246 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A217 00 02                    1 	.word LINK 
                           0024EF     2 	LINK=.
      0024EF                          3 LSHIFT:
      00A219 02                       4 	.byte 6+F_IFUNC 	
      00A21A 02 03 03 01 03 03        5 	.ascii "LSHIFT"
      00A220 02 04                    6 	.word lshift 
      0024F8                       6247 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A222 04 05                    1 	.word LINK 
                           0024FA     2 	LINK=.
      0024FA                          3 LOG:
      00A224 02                       4 	.byte 3+F_IFUNC 	
      00A225 06 02 07                 5 	.ascii "LOG"
      00A228 02 05                    6 	.word log2 
      002500                       6248 	_dict_entry,4,LOAD,load 
      00A22A 04 02                    1 	.word LINK 
                           002502     2 	LINK=.
      002502                          3 LOAD:
      00A22C 04                       4 	.byte 4 	
      00A22D 01 4F 41 44              5 	.ascii "LOAD"
      00A22E 1D DB                    6 	.word load 
      002509                       6249 	_dict_entry 4,LIST,list
      00A22E CD 93                    1 	.word LINK 
                           00250B     2 	LINK=.
      00250B                          3 LIST:
      00A230 49                       4 	.byte 4 	
      00A231 A1 01 27 03              5 	.ascii "LIST"
      00A235 CC 88                    6 	.word list 
      002512                       6250 	_dict_entry 3,LET,let 
      00A237 09 0B                    1 	.word LINK 
                           002514     2 	LINK=.
      00A238                          3 LET:
      00A238 CD                       4 	.byte 3 	
      00A239 91 04 89                 5 	.ascii "LET"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A23C 9E A5                    6 	.word let 
      00251A                       6251 	_dict_entry,3+F_IFUNC,KEY,key 
      00A23E 80 27                    1 	.word LINK 
                           00251C     2 	LINK=.
      00251C                          3 KEY:
      00A240 05                       4 	.byte 3+F_IFUNC 	
      00A241 A6 0A CC                 5 	.ascii "KEY"
      00A244 88 0B                    6 	.word key 
      00A246                       6252 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A246 CE 00                    1 	.word LINK 
                           002524     2 	LINK=.
      002524                          3 IWDGREF:
      00A248 0F                       4 	.byte 7 	
      00A249 58 58 58 58 58 9E C8     5 	.ascii "IWDGREF"
      00A250 00 0F                    6 	.word refresh_iwdg 
      00252E                       6253 	_dict_entry,6,IWDGEN,enable_iwdg
      00A252 C7 00                    1 	.word LINK 
                           002530     2 	LINK=.
      002530                          3 IWDGEN:
      00A254 09                       4 	.byte 6 	
      00A255 9F C8 00 10 C7 00        5 	.ascii "IWDGEN"
      00A25B 0A CE                    6 	.word enable_iwdg 
      002539                       6254 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A25D 00 11                    1 	.word LINK 
                           00253B     2 	LINK=.
      00253B                          3 INVERT:
      00A25F CF                       4 	.byte 6+F_IFUNC 	
      00A260 00 0F 90 54 90 9E        5 	.ascii "INVERT"
      00A266 C8 00                    6 	.word invert 
      002544                       6255 	_dict_entry,5,INPUT,input_var  
      00A268 11 C7                    1 	.word LINK 
                           002546     2 	LINK=.
      002546                          3 INPUT:
      00A26A 00                       4 	.byte 5 	
      00A26B 11 90 9F C8 00           5 	.ascii "INPUT"
      00A270 12 C7                    6 	.word input_var 
      00254E                       6256 	_dict_entry,2,IF,if 
      00A272 00 12                    1 	.word LINK 
                           002550     2 	LINK=.
      002550                          3 IF:
      00A274 CE                       4 	.byte 2 	
      00A275 00 09                    5 	.ascii "IF"
      00A277 54 54                    6 	.word if 
      002555                       6257 	_dict_entry,3+F_CONST,IDR,GPIO_IDR
      00A279 54 9E                    1 	.word LINK 
                           002557     2 	LINK=.
      002557                          3 IDR:
      00A27B C8                       4 	.byte 3+F_CONST 	
      00A27C 00 09 95                 5 	.ascii "IDR"
      00A27F 9F C8                    6 	.word GPIO_IDR 
      00255D                       6258 	_dict_entry,3,HEX,hex_base
      00A281 00 0A                    1 	.word LINK 
                           00255F     2 	LINK=.
      00255F                          3 HEX:
      00A283 97                       4 	.byte 3 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A284 C8 00 12                 5 	.ascii "HEX"
      00A287 97 9E                    6 	.word hex_base 
      002565                       6259 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A289 C8 00                    1 	.word LINK 
                           002567     2 	LINK=.
      002567                          3 GPIO:
      00A28B 11                       4 	.byte 4+F_IFUNC 	
      00A28C 95 CF 00 11              5 	.ascii "GPIO"
      00A290 90 85                    6 	.word gpio 
      00256E                       6260 	_dict_entry,4,GOTO,goto 
      00A292 65 93                    1 	.word LINK 
                           002570     2 	LINK=.
      002570                          3 GOTO:
      00A294 5C                       4 	.byte 4 	
      00A295 A6 04 81 4F              5 	.ascii "GOTO"
      00A298 19 D6                    6 	.word goto 
      002577                       6261 	_dict_entry,5,GOSUB,gosub 
      00A298 52 02                    1 	.word LINK 
                           002579     2 	LINK=.
      002579                          3 GOSUB:
      00A29A 0F                       4 	.byte 5 	
      00A29B 02 90 AE A6 F1           5 	.ascii "GOSUB"
      00A2A0 93 F6                    6 	.word gosub 
      002581                       6262 	_dict_entry,6,FORGET,forget 
      00A2A2 A4 0F                    1 	.word LINK 
                           002583     2 	LINK=.
      002583                          3 FORGET:
      00A2A4 6B                       4 	.byte 6 	
      00A2A5 01 5C F6 CD 82 4B        5 	.ascii "FORGET"
      00A2AB 0C 02                    6 	.word forget 
      00258C                       6263 	_dict_entry,3,FOR,for 
      00A2AD 0A 01                    1 	.word LINK 
                           00258E     2 	LINK=.
      00258E                          3 FOR:
      00A2AF 26                       4 	.byte 3 	
      00A2B0 F5 A6 46                 5 	.ascii "FOR"
      00A2B3 11 02                    6 	.word for 
      002594                       6264 	_dict_entry,4,FCPU,fcpu 
      00A2B5 2B 09                    1 	.word LINK 
                           002596     2 	LINK=.
      002596                          3 FCPU:
      00A2B7 A6                       4 	.byte 4 	
      00A2B8 20 CD 82 4B              5 	.ascii "FCPU"
      00A2BC 0C 02                    6 	.word fcpu 
      00259D                       6265 	_dict_entry,6+F_CONST,EEPROM,EEPROM_BASE  
      00A2BE 20 07                    1 	.word LINK 
                           00259F     2 	LINK=.
      00259F                          3 EEPROM:
      00A2C0 A6                       4 	.byte 6+F_CONST 	
      00A2C1 0D CD 82 4B 0F 02        5 	.ascii "EEPROM"
      00A2C7 72 A2                    6 	.word EEPROM_BASE 
      0025A8                       6266 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A2C9 00 02                    1 	.word LINK 
                           0025AA     2 	LINK=.
      0025AA                          3 DWRITE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A2CB 90                       4 	.byte 6+F_CMD 	
      00A2CC FE 26 D1 5B 02 81        5 	.ascii "DWRITE"
      00A2D2 1B 99                    6 	.word digital_write 
      0025B3                       6267 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A2D2 CD 93                    1 	.word LINK 
                           0025B5     2 	LINK=.
      0025B5                          3 DREAD:
      00A2D4 25                       4 	.byte 5+F_IFUNC 	
      00A2D5 A1 01 27 03 CC           5 	.ascii "DREAD"
      00A2DA 88 09                    6 	.word digital_read 
      00A2DC                       6268 	_dict_entry,2,DO,do_loop
      00A2DC CD 91                    1 	.word LINK 
                           0025BF     2 	LINK=.
      0025BF                          3 DO:
      00A2DE 04                       4 	.byte 2 	
      00A2DF CF 00                    5 	.ascii "DO"
      00A2E1 0D 81                    6 	.word do_loop 
      00A2E3                       6269 	_dict_entry,3,DIR,directory 
      00A2E3 CE 00                    1 	.word LINK 
                           0025C6     2 	LINK=.
      0025C6                          3 DIR:
      00A2E5 0D                       4 	.byte 3 	
      00A2E6 44 49 52                 5 	.ascii "DIR"
      00A2E6 53 A3                    6 	.word directory 
      0025CC                       6270 	_dict_entry,3,DEC,dec_base
      00A2E8 FF FF                    1 	.word LINK 
                           0025CE     2 	LINK=.
      0025CE                          3 DEC:
      00A2EA 27                       4 	.byte 3 	
      00A2EB 01 5F A6                 5 	.ascii "DEC"
      00A2EE 04 81                    6 	.word dec_base 
      00A2F0                       6271 	_dict_entry,3+F_CONST,DDR,GPIO_DDR
      00A2F0 CD 93                    1 	.word LINK 
                           0025D6     2 	LINK=.
      0025D6                          3 DDR:
      00A2F2 49                       4 	.byte 3+F_CONST 	
      00A2F3 A1 01 27                 5 	.ascii "DDR"
      00A2F6 03 CC                    6 	.word GPIO_DDR 
      0025DC                       6272 	_dict_entry,3+F_CONST,CRL,GPIO_CR1
      00A2F8 88 09                    1 	.word LINK 
                           0025DE     2 	LINK=.
      0025DE                          3 CRL:
      00A2FA CD                       4 	.byte 3+F_CONST 	
      00A2FB 91 04 20                 5 	.ascii "CRL"
      00A2FE E7 03                    6 	.word GPIO_CR1 
      00A2FF                       6273 	_dict_entry,3+F_CONST,CRH,GPIO_CR2
      00A2FF CD 93                    1 	.word LINK 
                           0025E6     2 	LINK=.
      0025E6                          3 CRH:
      00A301 25                       4 	.byte 3+F_CONST 	
      00A302 A1 01 27                 5 	.ascii "CRH"
      00A305 03 CC                    6 	.word GPIO_CR2 
      0025EC                       6274 	_dict_entry,4+F_CFUNC,CHAR,char
      00A307 88 09                    1 	.word LINK 
                           0025EE     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      0025EE                          3 CHAR:
      00A309 4B                       4 	.byte 4+F_CFUNC 	
      00A30A 00 35 CC 50              5 	.ascii "CHAR"
      00A30E E0 CD                    6 	.word char 
      0025F5                       6275 	_dict_entry,3,BYE,bye 
      00A310 91 04                    1 	.word LINK 
                           0025F7     2 	LINK=.
      0025F7                          3 BYE:
      00A312 9E                       4 	.byte 3 	
      00A313 A4 3F 95                 5 	.ascii "BYE"
      00A316 A3 00                    6 	.word bye 
      0025FD                       6276 	_dict_entry,5,BTOGL,bit_toggle
      00A318 FF 23                    1 	.word LINK 
                           0025FF     2 	LINK=.
      0025FF                          3 BTOGL:
      00A31A 06                       4 	.byte 5 	
      00A31B 0C 01 98 56 20           5 	.ascii "BTOGL"
      00A320 F5 35                    6 	.word bit_toggle 
      002607                       6277 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A322 55 50                    1 	.word LINK 
                           002609     2 	LINK=.
      002609                          3 BTEST:
      00A324 E0                       4 	.byte 5+F_IFUNC 	
      00A325 84 C7 50 E1 9F           5 	.ascii "BTEST"
      00A32A 4A 35                    6 	.word bit_test 
      002611                       6278 	_dict_entry,4,BSET,bit_set 
      00A32C 55 50                    1 	.word LINK 
                           002613     2 	LINK=.
      002613                          3 BSET:
      00A32E E0                       4 	.byte 4 	
      00A32F C7 50 E2 35              5 	.ascii "BSET"
      00A333 AA 50                    6 	.word bit_set 
      00261A                       6279 	_dict_entry,4,BRES,bit_reset
      00A335 E0 81                    1 	.word LINK 
                           00261C     2 	LINK=.
      00A337                          3 BRES:
      00A337 35                       4 	.byte 4 	
      00A338 AA 50 E0 81              5 	.ascii "BRES"
      00A33C 18 34                    6 	.word bit_reset 
      002623                       6280 	_dict_entry,5,BREAK,break 
      00A33C CD 93                    1 	.word LINK 
                           002625     2 	LINK=.
      002625                          3 BREAK:
      00A33E 49                       4 	.byte 5 	
      00A33F A1 01 27 03 CC           5 	.ascii "BREAK"
      00A344 88 09                    6 	.word break 
      00262D                       6281 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A346 CD 91                    1 	.word LINK 
                           00262F     2 	LINK=.
      00262F                          3 BIT:
      00A348 04                       4 	.byte 3+F_IFUNC 	
      00A349 42 49 54                 5 	.ascii "BIT"
      00A349 5D 27                    6 	.word bitmask 
      002635                       6282 	_dict_entry,3,AWU,awu 
      00A34B 0A A6                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                           002637     2 	LINK=.
      002637                          3 AWU:
      00A34D 0F                       4 	.byte 3 	
      00A34E 59 25 03                 5 	.ascii "AWU"
      00A351 4A 20                    6 	.word awu 
      00263D                       6283 	_dict_entry,7,AUTORUN,autorun
      00A353 FA 5F                    1 	.word LINK 
                           00263F     2 	LINK=.
      00263F                          3 AUTORUN:
      00A355 97                       4 	.byte 7 	
      00A356 A6 04 81 4F 52 55 4E     5 	.ascii "AUTORUN"
      00A359 1F D5                    6 	.word autorun 
      002649                       6284 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A359 CD 93                    1 	.word LINK 
                           00264B     2 	LINK=.
      00264B                          3 ASC:
      00A35B 49                       4 	.byte 3+F_IFUNC 	
      00A35C A1 01 27                 5 	.ascii "ASC"
      00A35F 03 CC                    6 	.word ascii 
      002651                       6285 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A361 88 09                    1 	.word LINK 
                           002653     2 	LINK=.
      002653                          3 AND:
      00A363 CD                       4 	.byte 3+F_IFUNC 	
      00A364 91 04 9F                 5 	.ascii "AND"
      00A367 A4 0F                    6 	.word bit_and 
      002659                       6286 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A369 5F 5C                    1 	.word LINK 
                           00265B     2 	LINK=.
      00265B                          3 ADCREAD:
      00A36B 4D                       4 	.byte 7+F_IFUNC 	
      00A36C 27 04 58 4A 20 F9 A6     5 	.ascii "ADCREAD"
      00A373 04 81                    6 	.word analog_read 
      00A375                       6287 	_dict_entry,5,ADCON,power_adc 
      00A375 CD 93                    1 	.word LINK 
                           002667     2 	LINK=.
      002667                          3 ADCON:
      00A377 49                       4 	.byte 5 	
      00A378 A1 01 27 03 CC           5 	.ascii "ADCON"
      00A37D 88 09                    6 	.word power_adc 
      00266F                       6288 kword_dict:
      00266F                       6289 	_dict_entry,3+F_IFUNC,ABS,abs
      00A37F CD 91                    1 	.word LINK 
                           002671     2 	LINK=.
      002671                          3 ABS:
      00A381 04                       4 	.byte 3+F_IFUNC 	
      00A382 53 A6 04                 5 	.ascii "ABS"
      00A385 81 83                    6 	.word abs 
                                   6290 	
                                   6291 
      00A386                       6292 	.bndry 128 ; align on FLASH block.
                                   6293 ; free space for user application  
      002680                       6294 user_space:
                                   6295 ; USR() function test
      00A386 85               [ 2] 6296 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A387 52 04 89 CC      [ 1] 6297 	bset PC_ODR,#5 
      00A38B 99               [ 2] 6298 	popw x 
      00A38C D4 20 2B         [ 4] 6299 	call pause02 
      00A38D 72 1B 50 0A      [ 1] 6300 	bres PC_ODR,#5 
      00A38D 72               [ 4] 6301 	ret
                                   6302 
                                   6303 	.area FLASH_DRIVE (ABS)
      010000                       6304 	.org 0x10000
      010000                       6305 fdrive:
                                   6306 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002671 R   |   5 ADCON      002667 R
  5 ADCREAD    00265B R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
    AFR7_BEE=  000007     |   5 AND        002653 R   |     ARG_CNT =  000001 
    ARG_OFS =  000002     |   5 ASC        00264B R   |     ATTRIB  =  000002 
  5 AUTORUN    00263F R   |     AUTORUN_=  004000     |   5 AWU        002637 R
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
    BINARY  =  000001     |   5 BIT        00262F R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_ER=  000000     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  000005 
  5 BREAK      002625 R   |   5 BRES       00261C R   |   5 BSET       002613 R
    BSIZE   =  000001     |     BSP     =  000008     |   5 BTEST      002609 R
  5 BTOGL      0025FF R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        0025F7 R   |     C       =  000001     |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELL_SIZ=  000002     |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   5 CHAR       0025EE R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
    CLK_ECKR=  000001     |     CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]

Symbol Table

    CLK_ICKR=  000002     |     CLK_ICKR=  000000     |     CLK_ICKR=  000001 
    CLK_ICKR=  000003     |     CLK_ICKR=  000004     |     CLK_ICKR=  000005 
    CLK_PCKE=  0050C7     |     CLK_PCKE=  000000     |     CLK_PCKE=  000001 
    CLK_PCKE=  000007     |     CLK_PCKE=  000005     |     CLK_PCKE=  000006 
    CLK_PCKE=  000004     |     CLK_PCKE=  000002     |     CLK_PCKE=  000003 
    CLK_PCKE=  0050CA     |     CLK_PCKE=  000003     |     CLK_PCKE=  000002 
    CLK_PCKE=  000007     |     CLK_SWCR=  0050C5     |     CLK_SWCR=  000000 
    CLK_SWCR=  000001     |     CLK_SWCR=  000002     |     CLK_SWCR=  000003 
    CLK_SWIM=  0050CD     |     CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4 
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |     CMD_END =  000002 
    CNT     =  000008     |     COMMA   =  000001     |     COUNT   =  000001 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  5 CRH        0025E6 R   |   5 CRL        0025DE R   |     CTRL_A  =  000001 
    CTRL_B  =  000002     |     CTRL_C  =  000003     |     CTRL_D  =  000004 
    CTRL_E  =  000005     |     CTRL_F  =  000006     |     CTRL_G  =  000007 
    CTRL_H  =  000008     |     CTRL_I  =  000009     |     CTRL_J  =  00000A 
    CTRL_K  =  00000B     |     CTRL_L  =  00000C     |     CTRL_M  =  00000D 
    CTRL_N  =  00000E     |     CTRL_O  =  00000F     |     CTRL_P  =  000010 
    CTRL_Q  =  000011     |     CTRL_R  =  000012     |     CTRL_S  =  000013 
    CTRL_T  =  000014     |     CTRL_U  =  000015     |     CTRL_V  =  000016 
    CTRL_W  =  000017     |     CTRL_X  =  000018     |     CTRL_Y  =  000019 
    CTRL_Z  =  00001A     |     CTXT_SIZ=  000006     |     CURR    =  000002 
    CX_BPTR =  000001     |     CX_CNT  =  000005     |     CX_IN   =  000004 
    CX_LNO  =  000003     |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        0025D6 R
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        0025CE R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        0025C6 R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DO         0025BF R   |   5 DREAD      0025B5 R   |     DSTACK_S=  000040 
  5 DWRITE     0025AA R   |   5 EEPROM     00259F R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |     EOF     =  0000FF 
    ERR_BAD_=  00000A     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_L=  000005     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |   5 FCPU       002596 R
    FF      =  00000C     |     FHSE    =  7A1200     |     FHSI    =  F42400 
    FIRST   =  000001     |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
    FLASH_CR=  000002     |     FLASH_CR=  000000     |     FLASH_CR=  000003 
    FLASH_CR=  000001     |     FLASH_CR=  00505B     |     FLASH_CR=  000005 
    FLASH_CR=  000004     |     FLASH_CR=  000007     |     FLASH_CR=  000000 
    FLASH_CR=  000006     |     FLASH_DU=  005064     |     FLASH_DU=  0000AE 
    FLASH_DU=  000056     |     FLASH_EN=  027FFF     |     FLASH_FP=  00505D 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_FP=  000000     |     FLASH_FP=  000001     |     FLASH_FP=  000002 
    FLASH_FP=  000003     |     FLASH_FP=  000004     |     FLASH_FP=  000005 
    FLASH_IA=  00505F     |     FLASH_IA=  000003     |     FLASH_IA=  000002 
    FLASH_IA=  000006     |     FLASH_IA=  000001     |     FLASH_IA=  000000 
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLOOP   =  000002     |     FLSI    =  01F400 
  5 FOR        00258E R   |   5 FORGET     002583 R   |     FRUN    =  000000 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      002579 R   |     GOS_RET =  000003 
  5 GOTO       002570 R   |   5 GPIO       002567 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  5 HEX        00255F R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
    I2C_CCRH=  000080     |     I2C_CCRH=  0000C0     |     I2C_CCRH=  000080 
    I2C_CCRH=  000000     |     I2C_CCRH=  000001     |     I2C_CCRH=  000000 
    I2C_CCRL=  00521B     |     I2C_CCRL=  00001A     |     I2C_CCRL=  000002 
    I2C_CCRL=  00000D     |     I2C_CCRL=  000050     |     I2C_CCRL=  000090 
    I2C_CCRL=  0000A0     |     I2C_CR1 =  005210     |     I2C_CR1_=  000006 
    I2C_CR1_=  000007     |     I2C_CR1_=  000000     |     I2C_CR2 =  005211 
    I2C_CR2_=  000002     |     I2C_CR2_=  000003     |     I2C_CR2_=  000000 
    I2C_CR2_=  000001     |     I2C_CR2_=  000007     |     I2C_DR  =  005216 
    I2C_FREQ=  005212     |     I2C_ITR =  00521A     |     I2C_ITR_=  000002 
    I2C_ITR_=  000000     |     I2C_ITR_=  000001     |     I2C_OARH=  005214 
    I2C_OARH=  000001     |     I2C_OARH=  000002     |     I2C_OARH=  000006 
    I2C_OARH=  000007     |     I2C_OARL=  005213     |     I2C_OARL=  000000 
    I2C_OAR_=  000813     |     I2C_OAR_=  000009     |     I2C_PECR=  00521E 
    I2C_READ=  000001     |     I2C_SR1 =  005217     |     I2C_SR1_=  000003 
    I2C_SR1_=  000001     |     I2C_SR1_=  000002     |     I2C_SR1_=  000006 
    I2C_SR1_=  000000     |     I2C_SR1_=  000004     |     I2C_SR1_=  000007 
    I2C_SR2 =  005218     |     I2C_SR2_=  000002     |     I2C_SR2_=  000001 
    I2C_SR2_=  000000     |     I2C_SR2_=  000003     |     I2C_SR2_=  000005 
    I2C_SR3 =  005219     |     I2C_SR3_=  000001     |     I2C_SR3_=  000007 
    I2C_SR3_=  000004     |     I2C_SR3_=  000000     |     I2C_SR3_=  000002 
    I2C_TRIS=  00521D     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        002557 R
  5 IF         002550 R   |     IN      =  000007     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      002546 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
    INT_ADC2=  000016     |     INT_AUAR=  000012     |     INT_AWU =  000001 
    INT_CAN_=  000008     |     INT_CAN_=  000009     |     INT_CLK =  000002 
    INT_EXTI=  000003     |     INT_EXTI=  000004     |     INT_EXTI=  000005 
    INT_EXTI=  000006     |     INT_EXTI=  000007     |     INT_FLAS=  000018 
    INT_I2C =  000013     |     INT_SPI =  00000A     |     INT_TIM1=  00000C 
    INT_TIM1=  00000B     |     INT_TIM2=  00000E     |     INT_TIM2=  00000D 
    INT_TIM3=  000010     |     INT_TIM3=  00000F     |     INT_TIM4=  000017 
    INT_TLI =  000000     |     INT_UART=  000011     |     INT_UART=  000015 
    INT_UART=  000014     |     INT_VECT=  008060     |     INT_VECT=  00800C 
    INT_VECT=  008028     |     INT_VECT=  00802C     |     INT_VECT=  008010 
    INT_VECT=  008014     |     INT_VECT=  008018     |     INT_VECT=  00801C 
    INT_VECT=  008020     |     INT_VECT=  008024     |     INT_VECT=  008068 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008054     |     INT_VECT=  008000     |     INT_VECT=  008030 
    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  008050     |     INT_VECT=  00804C     |     INT_VECT=  00805C 
    INT_VECT=  008058     |   5 INVERT     00253B R   |     INW     =  000003 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     002530 R
  5 IWDGREF    002524 R   |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   5 KEY        00251C R   |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000005     |   5 LET        002514 R
    LINENO  =  000005     |   5 LINK    =  002671 R   |   5 LIST       00250B R
    LL      =  000002     |     LLEN    =  000002     |     LL_HB   =  000001 
    LNO     =  000005     |     LN_PTR  =  000005     |   5 LOAD       002502 R
  5 LOG        0024FA R   |   5 LSHIFT     0024EF R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        0024DE R
  5 NEXT       0024E6 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NL      =  00000A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   5 NOT        0024D6 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R
  5 ODR        0024CE R   |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         0024C7 R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
    PAD_SIZE=  000028     |   5 PAUSE      0024BD R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       0024AA R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]

Symbol Table

    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       0024A1 R   |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      0024B3 R
  5 POKE       002498 R   |   5 POUT       00248F R   |     PREV    =  000001 
  5 PRINT      002485 R   |     PROD    =  000002     |   5 PRTA       00247C R
  5 PRTB       002473 R   |   5 PRTC       00246A R   |   5 PRTD       002461 R
  5 PRTE       002458 R   |   5 PRTF       00244F R   |   5 PRTG       002446 R
  5 PRTH       00243D R   |   5 PRTI       002434 R   |     PSIZE   =  000001 
  5 QKEY       00242B R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 REBOOT     002420 R   |   5 REG_A      000A28 R
  5 REG_CC     000A2C R   |   5 REG_EPC    000A1B R   |   5 REG_SP     000A31 R
  5 REG_X      000A24 R   |   5 REG_Y      000A20 R   |     RELOP   =  000005 
  5 REMARK     002415 R   |     RETL1   =  000001     |   5 RETURN     00240A R
  5 RND        002402 R   |     ROP     =  004800     |   5 RSHIFT     0023F7 R
    RST_SR  =  0050B3     |   5 RUN        0023EF R   |     RXCHAR  =  000001 
    R_A     =  000007     |     R_CC    =  000008     |     R_X     =  000005 
    R_Y     =  000003     |   5 SAVE       0023E6 R   |     SDIVD   =  000002 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       0023DD R   |     SIGN    =  000001     |   5 SIZE       0023D4 R
    SKIP    =  000006     |   5 SLEEP      0023CA R   |     SPACE   =  000020 
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SQUOT   =  000001 
    SRC     =  000003     |     STACK_EM=  0017FF     |     STACK_SI=  000080 
  5 STATES     0009DE R   |   5 STEP       0023C1 R   |   5 STOP       0023B8 R
    SWIM_CSR=  007F80     |     TAB     =  000009     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      0023AE R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
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
  5 TIMEOUT    002398 R   |   5 TIMER      0023A4 R   |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_ARRAY=  000002     |     TK_CFUNC=  000008 
    TK_CHAR =  000003     |     TK_CMD  =  000006     |     TK_COLON=  000001 
    TK_COMMA=  00000D     |     TK_CONST=  000009     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000007 
    TK_INTGR=  000004     |     TK_LE   =  000036     |     TK_LPARE=  00000B 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  00000A     |     TK_RPARE=  00000C 
    TK_SHARP=  00000E     |     TK_VAR  =  000005     |   5 TO         002391 R
  5 TONE       002388 R   |   5 Timer4Up   00003E R   |   5 TrapHand   00002F R
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
  5 UBOUND     00237D R   |   5 UBTN_Han   000081 R   |   5 UFLASH     002372 R
  5 UNTIL      002368 R   |   5 USER_ABO   000089 R   |   5 USR        002360 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 Uart1RxH   000018 R   |   5 UserButt   000054 R   |     VSIZ    =  000002 
    VSIZE   =  000002     |     VT      =  00000B     |   5 WAIT       002357 R
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH   =  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   5 WORDS      00234D R
  5 WRITE      002343 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XADR    =  000001     |     XMASK   =  000001     |   5 XOR        00233B R
  5 XPEEK      002331 R   |     XSAVE   =  000003     |     YSAVE   =  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

  5 abs        002083 R   |   1 acc16      000008 R   |   1 acc24      000007 R
  1 acc8       000009 R   |   5 accept_c   000BD2 R   |   5 add        001166 R
  5 analog_r   001B31 R   |   5 ansi_seq   000B94 R   |   5 arduino_   00218E R
  5 arg_list   0012A5 R   |   1 array_si   00001F R   |   5 ascii      001F42 R
  5 at_tst     000E9F R   |   5 atoi24     000FB2 R   |   5 atoi_exi   001020 R
  5 autorun    001FD5 R   |   5 autorun_   000656 R   |   5 awu        002034 R
  5 awu02      00203E R   |   5 bad_port   001FA3 R   |   1 base       000006 R
  1 basicptr   000004 R   |   5 bin_exit   000DA3 R   |   5 bit_and    002099 R
  5 bit_or     0020B7 R   |   5 bit_rese   001834 R   |   5 bit_set    001820 R
  5 bit_test   00185D R   |   5 bit_togg   001849 R   |   5 bit_xor    0020D5 R
  5 bitmask    0022D9 R   |   5 bkslsh_t   000E4A R   |   5 bksp       0001E8 R
  5 break      001BD8 R   |   5 break_po   001C06 R   |   5 bye        001FCC R
  5 char       001F2E R   |   5 check_fu   00040B R   |   5 clear_ba   00066B R
  5 clear_va   000515 R   |   5 clock_in   0000A4 R   |   5 cmd_itf    000BF6 R
  5 cmd_name   001211 R   |   5 cmp_name   001C7A R   |   5 cold_sta   00057A R
  5 colon_ts   000E73 R   |   5 comma_ts   000E7E R   |   5 compile    00041A R
  5 convert_   000D2B R   |   1 count      000003 R   |   5 cp_loop    001254 R
  5 create_g   00036A R   |   5 cstk_pro   00112F R   |   5 dash_tst   000E94 R
  5 ddrop      0010AB R   |   5 ddrop_n    0010E8 R   |   5 ddup       0010B4 R
  5 dec_base   001459 R   |   5 del_back   000BC3 R   |   5 del_line   000332 R
  5 del_ln     000BB4 R   |   5 delete     0001F8 R   |   5 digital_   001B67 R
  5 digital_   001B99 R   |   5 dir_loop   001E6D R   |   5 director   001E61 R
  5 divide     0011BC R   |   5 divu24_8   000B21 R   |   5 do_loop    002306 R
  5 dotr       001139 R   |   5 dotr_loo   00114E R   |   5 dots       001105 R
  5 dpick      0010C5 R   |   5 dpop       001084 R   |   5 dpush      001077 R
  5 drive_fr   001EEA R   |   3 dstack     001740 R   |   3 dstack_e   001780 R
  5 dstk_pro   0010FB R   |   1 dstkptr    000018 R   |   5 dswap      001091 R
  5 enable_i   00227F R   |   5 eql_tst    000EFF R   |   5 equal      0016E6 R
  5 err_bad_   000748 R   |   5 err_cmd_   000709 R   |   5 err_div0   0006CB R
  5 err_dupl   000724 R   |   5 err_math   0006B1 R   |   5 err_mem_   000694 R
  5 err_msg    00067C R   |   5 err_no_a   000755 R   |   5 err_no_l   0006DB R
  5 err_not_   000736 R   |   5 err_run_   0006F2 R   |   5 err_synt   0006A2 R
  5 escaped    000D40 R   |   5 expect     001298 R   |   5 expr_exi   0013EA R
  5 expressi   0013A9 R   |   5 factor     001300 R   |   1 farptr     000012 R
  5 fcpu       00212D R   |   7 fdrive     010000 R   |   5 fetch      0010D4 R
  5 fetchc     000CE3 R   |   1 ffree      000015 R   |   5 file_cou   001EE2 R
  5 final_te   000B8E R   |   5 first_li   0014DD R   |   1 flags      000021 R
  5 for        0018E2 R   |   5 forget     001E16 R   |   1 free_ram   000058 R
  5 func_arg   0012C9 R   |   5 func_not   002270 R   |   5 ge         0016E8 R
  5 get_arra   0012D9 R   |   5 get_tick   00207D R   |   5 get_toke   000DE5 R
  5 getc       0001D4 R   |   5 go_commo   001A06 R   |   5 gosub      0019E3 R
  5 goto       0019D6 R   |   5 gpio       001F75 R   |   5 gt         0016E4 R
  5 gt_tst     000F0A R   |   5 hex_base   001454 R   |   5 if         0018CE R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
  5 incr_far   001C2F R   |   5 input_ex   0017EC R   |   5 input_lo   001787 R
  5 input_va   00177B R   |   5 insert_l   0003A3 R   |   5 insert_l   000408 R
  5 interp     0007CF R   |   5 interp_l   00080F R   |   5 invalid    000C3B R
  5 invalid_   000CB9 R   |   5 invert     0022F5 R   |   5 is_alpha   000523 R
  5 is_digit   000F9D R   |   5 itoa       000ADA R   |   5 itoa_loo   000AF2 R
  5 key        001F62 R   |   5 kword_di   00266F R   |   5 kword_en   00232F R
  5 last_lin   0014E6 R   |   5 le         0016ED R   |   5 leading_   0022C9 R
  5 ledoff     00092E R   |   5 ledon      000929 R   |   5 ledtoggl   000933 R
  5 left_arr   000B94 R   |   5 left_par   00093C R   |   5 let        00148A R
  5 let02      001494 R   |   5 lines_sk   0014EB R   |   5 list       0014B2 R
  5 list_exi   001534 R   |   5 list_sta   00150E R   |   5 load       001DDB R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

  5 load_aut   000632 R   |   5 load_fil   001DAA R   |   5 log2       0022BC R
  5 logical_   002266 R   |   5 loop_bac   0019AF R   |   1 loop_dep   00001E R
  5 loop_don   0019C4 R   |   5 lshift     0020F3 R   |   5 lt         0016EB R
  5 lt_tst     000F43 R   |   5 mem_peek   000C58 R   |   5 modulo     001200 R
  5 move       0002CC R   |   5 move_dow   0002EA R   |   5 move_exi   00030B R
  5 move_loo   0002EF R   |   5 move_up    0002DC R   |   5 mul_char   0016D5 R
  5 multiply   001174 R   |   5 mulu24_8   001024 R   |   5 nbr_tst    000E20 R
  5 ne         0016F0 R   |   5 neg_acc2   000B49 R   |   5 new        001C24 R
  5 next       001967 R   |   5 next_tok   00083F R   |   5 no_match   001266 R
  5 none       000DE5 R   |   5 number     000CE9 GR  |   5 other      000F7B R
  3 pad        001718 R   |   5 parse_bi   000D83 R   |   5 parse_in   000D48 R
  5 parse_ke   000DAB R   |   5 parse_qu   000CF0 R   |   5 pause      002021 R
  5 pause02    00202B R   |   5 peek       00189B R   |   5 peek_byt   000C83 R
  5 pin_mode   002139 R   |   5 plus_tst   000ED3 R   |   5 poke       001888 R
  5 power_ad   001AE8 R   |   5 prcnt_ts   000EF4 R   |   5 print      0016F3 R
  5 print_ex   00174F R   |   5 print_fa   000CC8 R   |   5 print_in   000A7E R
  5 print_re   00098B R   |   5 print_st   000C4B R   |   5 print_to   000894 R
  5 prt_basi   001587 R   |   5 prt_cmd_   001537 R   |   5 prt_loop   0016F7 R
  5 prt_peek   00027C R   |   5 prt_quot   00154B R   |   5 prt_reg1   00096C R
  5 prt_reg8   000947 R   |   5 prt_regs   000212 R   |   5 prti24     000A36 R
  1 ptr16      000013 R   |   1 ptr8       000014 R   |   5 putc       0001CB R
  5 puts       0001DE R   |   5 qkey       001F6A R   |   5 qmark_ts   000EAA R
  5 random     0021AE R   |   5 readln     000B6C R   |   5 readln_l   000B72 R
  5 readln_q   000BE7 R   |   5 refresh_   0022B7 R   |   5 regs_sta   000255 R
  5 rel_exit   001441 R   |   5 relation   0013ED R   |   5 relop_st   0016D8 R
  5 rem        0017EF R   |   5 repl       000C04 R   |   5 repl_exi   000C2C R
  5 reprint    000B94 R   |   5 reset_co   0016F5 R   |   5 rest_con   00176B R
  5 return     001A28 R   |   5 right_ar   000B94 R   |   5 rparnt_t   000E68 R
  5 rshift     002110 R   |   5 run        001A48 R   |   5 run_it     001A70 R
  1 rx_char    000023 R   |   5 save       001CE6 R   |   5 save_con   00175B R
  5 search_d   001243 R   |   5 search_e   001294 R   |   5 search_f   001C9B R
  5 search_l   00030E R   |   5 search_l   000316 R   |   5 search_n   001247 R
  1 seedx      00000E R   |   1 seedy      000010 R   |   5 seek_fdr   001C3D R
  5 select_p   00217E R   |   5 set_time   002252 R   |   5 sharp_ts   000E89 R
  5 show       001444 R   |   5 single_c   0016D1 R   |   5 size       00145E R
  5 skip       00105E R   |   5 slash_ts   000EE9 R   |   5 sleep      002016 R
  5 software   000534 R   |   5 spaces     000206 R   |   3 stack_fu   001780 R
  3 stack_un   001800 R   |   5 star_tst   000EDE R   |   5 step       00193F R
  5 stop       001A8B R   |   5 store      0010DE R   |   5 store_lo   001954 R
  5 str_matc   001275 R   |   5 str_tst    000E0F R   |   5 strcmp     0002AD R
  5 strcpy     0002BE R   |   5 strlen     0002A0 R   |   5 substrac   00116E R
  5 syntax_e   000789 R   |   1 tab_widt   000022 R   |   5 tb_error   00078B R
  5 term       00135C R   |   5 term01     001365 R   |   5 term_exi   0013A6 R
  5 test_p     000C43 R   |   3 tib        0016C8 R   |   5 tick_tst   000EC1 R
  1 ticks      00000A R   |   5 timeout    002263 R   |   1 timer      00000C R
  5 timer2_i   0000BA R   |   5 timer4_i   0000C7 R   |   5 to         00190C R
  5 to_upper   000FA6 GR  |   5 tok_arra   0008D9 R   |   5 tok_cfun   0008F1 R
  5 tok_char   0008DB R   |   5 tok_cmd    0008E8 R   |   5 tok_colo   0008D7 R
  5 tok_comm   00090C R   |   5 tok_cons   0008FB R   |   5 tok_equ    00091C R
  5 tok_func   0008EC R   |   5 tok_ge     00091E R   |   5 tok_grp0   0008D2 R
  5 tok_grp1   000910 R   |   5 tok_grp2   000914 R   |   5 tok_grp3   00091A R
  5 tok_gt     00091A R   |   5 tok_int    0008E0 R   |   5 tok_le     000923 R
  5 tok_lpar   000908 R   |   5 tok_lt     000921 R   |   5 tok_minu   000912 R
  5 tok_ne     000926 R   |   5 tok_none   0008D2 R   |   5 tok_pcen   000918 R
  5 tok_plus   000910 R   |   5 tok_rpar   00090A R   |   5 tok_shar   00090E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

  5 tok_slas   000916 R   |   5 tok_star   000914 R   |   5 tok_str    000901 R
  5 tok_var    0008E4 R   |   5 token_ch   000F8A R   |   5 token_ex   000F9A R
  5 token_pt   00089E R   |   5 token_pt   0008BC R   |   5 token_pt   0008C0 R
  5 token_pt   0008C6 R   |   5 tone       001A9A R   |   1 txtbgn     00001A R
  1 txtend     00001C R   |   5 uart1_in   000190 R   |   5 uart1_se   0001A0 R
  5 ubound     001468 R   |   5 uflash     001FA8 R   |   5 unget_to   001071 R
  5 unlock_e   0000DC R   |   5 unlock_f   0000EA R   |   5 until      00230D R
  5 user_int   000067 R   |   5 user_spa   002680 R   |   5 usr        001FAE R
  1 vars       000024 R   |   5 wait       0017F5 R   |   5 warm_ini   000615 R
  5 warm_sta   0007CC R   |   5 words      002218 R   |   5 write      001EF7 R
  5 write_bl   00016D R   |   5 write_by   0000F8 R   |   5 write_ee   000134 R
  5 write_ex   000168 R   |   5 write_fl   00011E R   |   5 xpeek      0018AE R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     58   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   268E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

