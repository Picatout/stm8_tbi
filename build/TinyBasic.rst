ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 1.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020,2021,2022  
                                      3 ; This file is part of stm8_tbi 
                                      4 ;
                                      5 ;     stm8_tbi is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     stm8_tbi is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with stm8_tbi.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19 ;--------------------------------------
                                     20 ;   Implementation of Tiny BASIC
                                     21 ;   REF: https://en.wikipedia.org/wiki/Li-Chen_Wang#Palo_Alto_Tiny_BASIC
                                     22 ;   Palo Alto BASIC is 4th version of TinyBasic
                                     23 ;   DATE: 2019-12-17
                                     24 ;
                                     25 ;--------------------------------------------------
                                     26 
                                     27     .module STM8_TBI
                                     28 
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
                                 
                                 
                                 
                                        
                                            .macro _led2_on 
                                        
                                            .macro _led2_off 
                                        
                                            .macro _led2_toggle 
                                             
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
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; SPI_CR1 bit fields 
                                 
                                 
                                 
                                 
                                 
                                 
                                          
                                        ; SPI_CR2 bit fields 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; SPI_SR bit fields 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
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
                                        ; REF: https://en.wikipedia.org/wiki/ASCII    
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
                                        	.include "tbi_macros.inc" 
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
                                                ; bit 7   1 for dictionary words else 0 
                                                ; bits 6  always 0 
                                                ; bits 5:4 identify group 
                                                ; bits 3:0 token identifier inside group  
                                 
                                 
                                 
                                 
                                 
                                 
                                                ; token groups 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ;--------------------------------------
                                        ;   error codes 
                                        ;--------------------------------------
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ;--------------------------------------
                                        ;   assembler flags 
                                        ;-------------------------------------
                                 
                                        
                                 
                                        
                                            .macro _usec_dly n 
                                            
                                            ; load X register with 
                                            ; entry point of dictionary
                                            ; before calling 'search_dict'
                                            .macro _ldx_dict dict_name
                                        
                                            ; reset BASIC pointer
                                            ; to beginning of last token
                                            ; extracted except if it was end of line 
                                            .macro _unget_token 
                                        
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
                                        	.include "cmd_index.inc"
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
                                        
                                        ;---------------------------------------
                                        ; BASIC command and functions indexes
                                        ; for addressing 'code_addr' table
                                        ;--------------------------------------
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                     36     .list 
                                     37 
                                     38 ;_dbg 
                                     39 
                                     40 ;--------------------------------------
                                     41     .area DATA 
                                     42 ;--------------------------------------	
                                     43 
                                     44 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      000001                         45 in.w::  .blkb 1 ; parser position in text line high-byte 
      000002                         46 in::    .blkb 1 ; low byte of in.w 
      000003                         47 in.saved:: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000004                         48 count:: .blkb 1 ; current BASIC line length and tib text length  
      000005                         49 basicptr::  .blkb 2  ; point to current BASIC line address.
      000007                         50 data_ptr:  .blkw 1  ; point to DATA address
      000009                         51 data_ofs:  .blkb 1  ; index to next data item 
      00000A                         52 data_len:  .blkb 1  ; length of data line 
      00000B                         53 base::  .blkb 1 ; nemeric base used to print integer 
      00000C                         54 acc24:: .blkb 1 ; 24 bit accumulator upper-byte 
      00000D                         55 acc16:: .blkb 1 ; 16 bit accumulator, acc24 high-byte
      00000E                         56 acc8::  .blkb 1 ;  8 bit accumulator, acc24 low-byte  
      00000F                         57 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000011                         58 timer:: .blkw 1 ;  milliseconds count down timer 
      000013                         59 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000015                         60 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000017                         61 farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
      000018                         62 ptr16::  .blkb 1 ; 16 bits pointer , farptr high-byte 
      000019                         63 ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
      00001A                         64 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001D                         65 txtbgn:: .blkw 1 ; tokenized BASIC text beginning address 
      00001F                         66 txtend:: .blkw 1 ; tokenized BASIC text end address 
      000021                         67 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000022                         68 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000024                         69 flags:: .blkb 1 ; various boolean flags
      000025                         70 tab_width:: .blkb 1 ; print colon width (default 6)
      000026                         71 rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
      00002E                         72 rx1_head:  .blkb 1 ; rx1_queue head pointer
      00002F                         73 rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
                                     74 
      000030                         75 vars:: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     76 ; keep 'free_ram' as last variable 
      000064                         77 free_ram: ; from here RAM free for BASIC text 
                                     78 
                                     79 ;;-----------------------------------
                                     80     .area SSEG (ABS)
                                     81 ;; working buffers and stack at end of RAM. 	
                                     82 ;;-----------------------------------
      001690                         83     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
      001690                         84 tib:: .ds TIB_SIZE             ; transaction input buffer
      0016E0                         85 pad:: .ds PAD_SIZE             ; working buffer
      001760                         86 stack_full:: .ds STACK_SIZE   ; control stack 
      001800                         87 stack_unf: ; stack underflow ; control_stack bottom 
                                     88 
                                     89 ;;--------------------------------------
                                     90     .area HOME 
                                     91 ;; interrupt vector table at 0x8000
                                     92 ;;--------------------------------------
      008000 82 00 84 FF             93     int cold_start			; RESET vector 
                           000000    94 .if DEBUG
                                     95 	int TrapHandler 		;TRAP  software interrupt
                           000001    96 .else
      008004 82 00 80 80             97 	int NonHandledInterrupt ;TRAP  software interrupt
                                     98 .endif
      008008 82 00 80 80             99 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      00800C 82 00 80 81            100 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            101 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            102 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80            103 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80            104 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            105 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 E7            106 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80            107 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80            108 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80            109 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80            110 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80            111 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80            112 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80            113 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80            114 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80            115 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80            116 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 8F            117 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80            118 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80            119 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 80            120 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80            121 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 D2            122 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80            123 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80            124 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80            125 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80            126 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80            127 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80            128 	int NonHandledInterrupt ;int29  not used
                                    129 
                                    130 ;---------------------------------------
                                    131     .area CODE
                                    132 ;---------------------------------------
                           000000   133 .if DEBUG
                                    134 .asciz "STM8_TBI" ; I like to put module name here.
                                    135 .endif 
                                    136 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    138 ; non handled interrupt 
                                    139 ; reset MCU
                                    140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                        141 NonHandledInterrupt:
      008080 71                     142     .byte 0x71  ; invalid opcode reinitialize MCU
                                    143 
                                    144 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    145 ; auto wakeup from halt
                                    146 ; at iret, program continue 
                                    147 ; after hatl instruction
                                    148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008081                        149 AWUHandler:
      008081 72 19 50 F0      [ 1]  150 	bres AWU_CSR,#AWU_CSR_AWUEN
      008085 55 00 3F 50 F1   [ 1]  151 	mov AWU_APR,0x3F
      00808A 72 5F 50 F2      [ 1]  152 	clr AWU_TBR 
      00808E 80               [11]  153 	iret
                                    154 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    155 ;--------------------------
                                    156 ; UART1 receive character
                                    157 ; CTRL-C (ASCII 3)
                                    158 ; cancel program execution
                                    159 ; and fall back to command line
                                    160 ;--------------------------
      00808F                        161 Uart1RxHandler: ; console receive char 
      00000F                        162 	_led2_on 
      00808F 72 1A 50 0A      [ 1]    1     bset LED2_PORT,#LED2_BIT 
      008093 72 0B 52 30 35   [ 2]  163 	btjf UART1_SR,#UART_SR_RXNE,5$
      008098 C6 52 31         [ 1]  164 	ld a,UART1_DR 
      00809B A1 03            [ 1]  165 	cp a,#CTRL_C 
      00809D 26 06            [ 1]  166 	jrne 2$
      00809F CD 83 42         [ 4]  167 	call putc 
      0080A2 CC 80 FA         [ 2]  168 	jp user_interrupted
      0080A5                        169 2$:
      0080A5 A1 18            [ 1]  170 	cp a,#CAN ; CTRL_X 
      0080A7 26 03            [ 1]  171 	jrne 3$
      0080A9 CC 84 FF         [ 2]  172 	jp cold_start 	
      0080AC                        173 3$: 
      0080AC A1 1A            [ 1]  174 	cp a,#CTRL_Z
      0080AE 26 06            [ 1]  175 	jrne 4$
      0080B0 CD 85 BD         [ 4]  176 	call cancel_autorun 
      0080B3 CC 84 FF         [ 2]  177 	jp cold_start
      0080B6 AE 00 26         [ 2]  178 4$:	ldw x,#rx1_queue  
      0080B9 88               [ 1]  179 	push a 
      0080BA 9F               [ 1]  180 	ld a,xl 
      0080BB CB 00 2F         [ 1]  181 	add a,rx1_tail 
      0080BE 97               [ 1]  182 	ld xl,a
      0080BF 84               [ 1]  183 	pop a  
      0080C0 F7               [ 1]  184 	ld (x),a
      0080C1 72 5C 00 2F      [ 1]  185 	inc rx1_tail 
      0080C5 A6 07            [ 1]  186 	ld a,#RX_QUEUE_SIZE-1
      0080C7 C4 00 2F         [ 1]  187 	and a,rx1_tail 
      0080CA C7 00 2F         [ 1]  188 	ld rx1_tail,a  
      00004D                        189 5$:	_led2_off 	
      0080CD 72 1B 50 0A      [ 1]    1     bres LED2_PORT,#LED2_BIT 
      0080D1 80               [11]  190 	iret 
                                    191 
                                    192 ;------------------------------------
                                    193 ; software interrupt handler  
                                    194 ;------------------------------------
                           000000   195 .if DEBUG 
                                    196 TrapHandler:
                                    197 	bset flags,#FTRAP 
                                    198 	call print_registers
                                    199 	call cmd_itf
                                    200 	bres flags,#FTRAP 	
                                    201 	iret
                                    202 .endif 
                                    203 
                                    204 ;------------------------------
                                    205 ; TIMER 4 is used to maintain 
                                    206 ; a milliseconds 'ticks' counter
                                    207 ; and decrement 'timer' varaiable
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    208 ;--------------------------------
      0080D2                        209 Timer4UpdateHandler:
      0080D2 72 5F 53 42      [ 1]  210 	clr TIM4_SR 
      0080D6 CE 00 0F         [ 2]  211 	ldw x,ticks
      0080D9 5C               [ 1]  212 	incw x
      0080DA CF 00 0F         [ 2]  213 	ldw ticks,x 
      0080DD CE 00 11         [ 2]  214 	ldw x,timer
                                    215 ;	tnzw x 
      0080E0 27 04            [ 1]  216 	jreq 1$
      0080E2 5A               [ 2]  217 	decw x 
      0080E3 CF 00 11         [ 2]  218 	ldw timer,x 
      0080E6                        219 1$:	
      0080E6 80               [11]  220 	iret 
                                    221 
                                    222 
                                    223 ;------------------------------------
                                    224 ; Triggered by pressing USER UserButton 
                                    225 ; on NUCLEO card.
                                    226 ; This is used to abort a progam lock 
                                    227 ; in infinite loop. 
                                    228 ;------------------------------------
      0080E7                        229 UserButtonHandler:
                                    230 ; wait button release
      0080E7 5F               [ 1]  231 	clrw x
      0080E8 5A               [ 2]  232 1$: decw x 
      0080E9 26 FD            [ 1]  233 	jrne 1$
      0080EB 72 09 50 15 F8   [ 2]  234 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    235 ; if MCU suspended by SLEEP resume program
      0080F0 72 07 00 24 05   [ 2]  236     btjf flags,#FSLEEP,2$
      0080F5 72 17 00 24      [ 1]  237 	bres flags,#FSLEEP 
      0080F9 80               [11]  238 	iret
      0080FA                        239 2$:	
      0080FA                        240 user_interrupted:
      0080FA 72 00 00 24 02   [ 2]  241     btjt flags,#FRUN,4$
      0080FF 20 13            [ 2]  242 	jra UBTN_Handler_exit 
      008101                        243 4$:	; program interrupted by user 
      008101 72 11 00 24      [ 1]  244 	bres flags,#FRUN 
      008105 AE 81 1C         [ 2]  245 	ldw x,#USER_ABORT
      008108 CD A2 40         [ 4]  246 	call puts 
      00810B CE 00 05         [ 2]  247 	ldw x,basicptr 
      00810E C6 00 02         [ 1]  248 	ld a,in 
      008111 CD 8F 08         [ 4]  249 	call prt_basic_line
      008114                        250 UBTN_Handler_exit:
      008114 AE 17 FF         [ 2]  251     ldw x,#STACK_EMPTY 
      008117 94               [ 1]  252     ldw sp,x
      008118 9A               [ 1]  253 	rim 
      008119 CC 88 27         [ 2]  254 	jp warm_start
                                    255 
      00811C 0A 50 72 6F 67 72 61   256 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    257 
                                    258 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    259 ;    peripherals initialization
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    261 
                                    262 ;----------------------------------------
                                    263 ; inialize MCU clock 
                                    264 ; input:
                                    265 ;   A 		source  HSI | 1 HSE 
                                    266 ;   XL      CLK_CKDIVR , clock divisor 
                                    267 ; output:
                                    268 ;   none 
                                    269 ;----------------------------------------
      008137                        270 clock_init:	
      008137 C1 50 C3         [ 1]  271 	cp a,CLK_CMSR 
      00813A 27 0C            [ 1]  272 	jreq 2$ ; no switching required 
                                    273 ; select clock source 
      00813C 72 12 50 C5      [ 1]  274 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008140 C7 50 C4         [ 1]  275 	ld CLK_SWR,a
      008143 C1 50 C3         [ 1]  276 1$:	cp a,CLK_CMSR
      008146 26 FB            [ 1]  277 	jrne 1$
      008148                        278 2$: 	
                                    279 ; HSI and cpu clock divisor 
      008148 9F               [ 1]  280 	ld a,xl 
      008149 C7 50 C6         [ 1]  281 	ld CLK_CKDIVR,a  
      00814C 81               [ 4]  282 	ret
                                    283 
                                    284 ;----------------------------------
                                    285 ; TIMER2 used as audio tone output 
                                    286 ; on port D:5.
                                    287 ; channel 1 configured as PWM mode 1 
                                    288 ;-----------------------------------  
                           00F424   289 TIM2_CLK_FREQ=62500
      00814D                        290 timer2_init:
      00814D 72 1A 50 C7      [ 1]  291 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008151 35 60 53 05      [ 1]  292  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008155 35 08 53 0C      [ 1]  293 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008159 81               [ 4]  294 	ret 
                                    295 
                                    296 ;---------------------------------
                                    297 ; TIM4 is configured to generate an 
                                    298 ; interrupt every millisecond 
                                    299 ;----------------------------------
      00815A                        300 timer4_init:
      00815A 72 18 50 C7      [ 1]  301 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00815E 35 07 53 45      [ 1]  302 	mov TIM4_PSCR,#7 ; prescale 128  
      008162 35 7D 53 46      [ 1]  303 	mov TIM4_ARR,#125 ; set for 1msec.
      008166 35 05 53 40      [ 1]  304 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00816A 72 10 53 41      [ 1]  305 	bset TIM4_IER,#TIM4_IER_UIE
      00816E 81               [ 4]  306 	ret
                                    307 
                                    308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    309 ;  routines to write to FLASH, EEPROM 
                                    310 ;  and OPTION 
                                    311 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    312 
                                    313 ;----------------------------------
                                    314 ; unlock EEPROM/OPT for writing/erasing
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    315 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    316 ; input:
                                    317 ;  none
                                    318 ; output:
                                    319 ;  none 
                                    320 ;----------------------------------
      00816F                        321 unlock_eeprom:
      00816F 35 00 50 5B      [ 1]  322 	mov FLASH_CR2,#0 
      008173 35 FF 50 5C      [ 1]  323 	mov FLASH_NCR2,#0xFF 
      008177 35 AE 50 64      [ 1]  324 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00817B 35 56 50 64      [ 1]  325     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00817F 72 07 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008184 81               [ 4]  327 	ret
                                    328 
                                    329 ;----------------------------------
                                    330 ; unlock FLASH for writing/erasing
                                    331 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    332 ; input:
                                    333 ;  none
                                    334 ; output:
                                    335 ;  none
                                    336 ;----------------------------------
      008185                        337 unlock_flash:
      008185 35 00 50 5B      [ 1]  338 	mov FLASH_CR2,#0 
      008189 35 FF 50 5C      [ 1]  339 	mov FLASH_NCR2,#0xFF 
      00818D 35 56 50 62      [ 1]  340 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008191 35 AE 50 62      [ 1]  341 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008195 72 03 50 5F FB   [ 2]  342 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00819A 81               [ 4]  343 	ret
                                    344 
                                    345 ;----------------------------
                                    346 ; erase block code must be 
                                    347 ; executed from RAM
                                    348 ; input:
                                    349 ;-----------------------------
      00819B                        350 row_erase:
      00819B 35 20 50 5B      [ 1]  351 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00819F 35 DF 50 5C      [ 1]  352 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      0081A3 4F               [ 1]  353 	clr a 
      0081A4 90 5F            [ 1]  354 	clrw y 
      0081A6 91 A7 00 17      [ 1]  355 	ldf ([farptr],y),a
      0081AA 90 5C            [ 1]  356     incw y
      0081AC 91 A7 00 17      [ 1]  357 	ldf ([farptr],y),a
      0081B0 90 5C            [ 1]  358     incw y
      0081B2 91 A7 00 17      [ 1]  359 	ldf ([farptr],y),a
      0081B6 90 5C            [ 1]  360     incw y
      0081B8 91 A7 00 17      [ 1]  361 	ldf ([farptr],y),a
      0081BC 72 05 50 5F FB   [ 2]  362 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081C1 81               [ 4]  363 	ret
      0081C2                        364 row_erase_end:
                                    365 
                                    366 ; copy erase_start in RAM 
      0081C2                        367 move_erase_to_ram:
      0081C2 AE 81 C2         [ 2]  368 	ldw x,#row_erase_end 
      0081C5 1D 81 9B         [ 2]  369 	subw x,#row_erase
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      0081C8 CF 00 0D         [ 2]  370 	ldw acc16,x 
      0081CB AE 16 90         [ 2]  371 	ldw x,#tib 
      0081CE 90 AE 81 9B      [ 2]  372 	ldw y,#row_erase 
      0081D2 CD 84 46         [ 4]  373 	call move 
      0081D5 81               [ 4]  374 	ret 
                                    375 
                                    376 ;-----------------------------------
                                    377 ; block programming must be 
                                    378 ; executed from RAM 
                                    379 ; initial contidions: 
                                    380 ; 	memory unlocked
                                    381 ;   bit PRG set in 
                                    382 ; input:
                                    383 ;   x        128 bytes row to program 
                                    384 ;   farptr   row address 
                                    385 ; output:
                                    386 ;   none 
                                    387 ;----------------------------------
                           000001   388 	BCNT=1 
      0081D6                        389 program_row:
      0081D6 4B 80            [ 1]  390 	push #BLOCK_SIZE  
                                    391 ;enable block programming 
      0081D8 72 10 50 5B      [ 1]  392 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0081DC 72 11 50 5C      [ 1]  393 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0081E0 90 5F            [ 1]  394 	clrw y 
      0081E2 F6               [ 1]  395 1$:	ld a,(x)
      0081E3 91 A7 00 17      [ 1]  396 	ldf ([farptr],y),a
      0081E7 5C               [ 1]  397 	incw x 
      0081E8 90 5C            [ 1]  398 	incw y 
      0081EA 0A 01            [ 1]  399 	dec (BCNT,sp)
      0081EC 26 F4            [ 1]  400 	jrne 1$
                                    401 ; wait EOP bit 
      0081EE 72 05 50 5F FB   [ 2]  402 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      000173                        403 	_drop 1 
      0081F3 5B 01            [ 2]    1     addw sp,#1 
      0081F5 81               [ 4]  404 	ret 
      0081F6                        405 program_row_end:
                                    406 
                                    407 ;-------------------------
                                    408 ; move program_row to RAM 
                                    409 ; at txtubound address 
                                    410 ;------------------------
      0081F6                        411 move_prg_to_ram:
      0081F6 AE 81 F6         [ 2]  412 	ldw x,#program_row_end 
      0081F9 1D 81 D6         [ 2]  413 	subw x,#program_row 
      0081FC CF 00 0D         [ 2]  414 	ldw acc16,x 
      0081FF AE 16 90         [ 2]  415 	ldw x,#tib 
      008202 90 AE 81 D6      [ 2]  416 	ldw y,#program_row 
      008206 CD 84 46         [ 4]  417 	call move 
      008209 81               [ 4]  418 	ret 
                                    419 
                                    420 
                                    421 ;-----------------------------
                                    422 ; write a row in FLASH/EEPROM 
                                    423 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    424 ;    farptr   destination address 
                                    425 ;    x        source address 
                                    426 ;-----------------------------
      00820A                        427 write_row:
      00820A 89               [ 2]  428 	pushw x 
      00820B 72 5D 00 17      [ 1]  429 	tnz farptr 
      00820F 26 1C            [ 1]  430 	jrne to_flash 
      008211 AE 80 00         [ 2]  431 	ldw x,#FLASH_BASE 
      008214 C3 00 18         [ 2]  432 	cpw x,farptr+1 
      008217 24 14            [ 1]  433 	jruge to_flash 
      008219                        434 to_eeprom:
      008219 AE 40 00         [ 2]  435 	ldw x,#EEPROM_BASE 
      00821C C3 00 18         [ 2]  436 	cpw x,farptr+1 
      00821F 24 01            [ 1]  437 	jruge 1$
      008221 81               [ 4]  438 	ret ; bad address 
      008222 AE 47 FF         [ 2]  439 1$: ldw x,#EEPROM_END 
      008225 23 01            [ 2]  440 	jrule 2$ 
      008227 81               [ 4]  441 	ret ; bad address 
      008228 CD 81 6F         [ 4]  442 2$:	call unlock_eeprom
      00822B 20 03            [ 2]  443 	jra do_programming
      00822D                        444 to_flash:
      00822D CD 81 85         [ 4]  445 	call unlock_flash 
      008230                        446 do_programming:
      008230 85               [ 2]  447 	popw x 
      008231 CD 16 90         [ 4]  448 	call tib
      008234 72 13 50 5F      [ 1]  449 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008238 72 17 50 5F      [ 1]  450 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      00823C 81               [ 4]  451 	ret 
                                    452 
                                    453 
                                    454 ;-----------------------------------
                                    455 ; erase flash or EEPROM block
                                    456 ; a blow is 128 bytes 
                                    457 ; input:
                                    458 ;   farptr  address row begin
                                    459 ; output:
                                    460 ;   none
                                    461 ;--------------------------------------
      00823D                        462 block_erase:
      00823D CE 00 18         [ 2]  463 	ldw x,farptr+1
      008240 A3 A2 00         [ 2]  464 	cpw x,#user_space 
      008243 2A 17            [ 1]  465 	jrpl erase_flash 
                                    466 ; erase eeprom block
      008245 A3 40 00         [ 2]  467 	cpw x,#EEPROM_BASE 
      008248 24 01            [ 1]  468 	jruge 1$
      00824A 81               [ 4]  469 	ret ; bad address 
      00824B AE 47 FF         [ 2]  470 1$: ldw x,#EEPROM_END 
      00824E 23 01            [ 2]  471 	jrule 2$ 
      008250 81               [ 4]  472 	ret ; bad address 
      008251 CD 81 6F         [ 4]  473 2$:	call unlock_eeprom 
      008254 CD 16 90         [ 4]  474 	call tib 
      008257 72 17 50 5F      [ 1]  475 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      00825B 81               [ 4]  476 	ret 
                                    477 ; erase flash block:
      00825C                        478 erase_flash:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00825C CD 81 85         [ 4]  479 	call unlock_flash 
      00825F CD 16 90         [ 4]  480 	call tib 
      008262 72 13 50 5F      [ 1]  481     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008266 81               [ 4]  482 	ret 
                                    483 
                                    484 
                                    485 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    486 ; write a byte to FLASH or EEPROM/OPTION  
                                    487 ; input:
                                    488 ;    a  		byte to write
                                    489 ;    farptr  	address
                                    490 ;    x          farptr[x]
                                    491 ; output:
                                    492 ;    none
                                    493 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    494 	; variables locales
                           000001   495 	BTW = 1   ; byte to write offset on stack
                           000002   496 	OPT = 2   ; OPTION flag offset on stack
                           000002   497 	VSIZE = 2
      008267                        498 write_byte:
      008267 90 89            [ 2]  499 	pushw y
      0001E9                        500 	_vars VSIZE
      008269 52 02            [ 2]    1     sub sp,#VSIZE 
      00826B 6B 01            [ 1]  501 	ld (BTW,sp),a ; byte to write 
      00826D 0F 02            [ 1]  502 	clr (OPT,sp)  ; OPTION flag
                                    503 ; put addr[15:0] in Y, for bounds check.
      00826F 90 CE 00 18      [ 2]  504 	ldw y,farptr+1   ; Y=addr15:0
                                    505 ; check addr[23:16], if <> 0 then it is extened flash memory
      008273 72 5D 00 17      [ 1]  506 	tnz farptr 
      008277 26 14            [ 1]  507 	jrne write_flash
      008279 90 A3 A2 00      [ 2]  508     cpw y,#user_space
      00827D 24 0E            [ 1]  509     jruge write_flash
      00827F 90 A3 40 00      [ 2]  510 	cpw y,#EEPROM_BASE  
      008283 25 52            [ 1]  511     jrult write_exit
      008285 90 A3 48 7F      [ 2]  512 	cpw y,#OPTION_END 
      008289 22 4C            [ 1]  513 	jrugt write_exit
      00828B 20 16            [ 2]  514 	jra write_eeprom 
                                    515 ; write program memory
      00828D                        516 write_flash:
      00828D CD 81 85         [ 4]  517 	call unlock_flash 
      008290 9B               [ 1]  518 1$:	sim 
      008291 7B 01            [ 1]  519 	ld a,(BTW,sp)
      008293 92 A7 00 17      [ 4]  520 	ldf ([farptr],x),a ; farptr[x]=A
      008297 72 05 50 5F FB   [ 2]  521 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00829C 9A               [ 1]  522     rim 
      00829D 72 13 50 5F      [ 1]  523     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0082A1 20 34            [ 2]  524     jra write_exit
                                    525 ; write eeprom and option
      0082A3                        526 write_eeprom:
      0082A3 CD 81 6F         [ 4]  527 	call unlock_eeprom
                                    528 	; check for data eeprom or option eeprom
      0082A6 90 A3 48 00      [ 2]  529 	cpw y,#OPTION_BASE
      0082AA 2B 08            [ 1]  530 	jrmi 1$
      0082AC 90 A3 48 80      [ 2]  531 	cpw y,#OPTION_END+1
      0082B0 2A 02            [ 1]  532 	jrpl 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0082B2 03 02            [ 1]  533 	cpl (OPT,sp)
      0082B4                        534 1$: 
      0082B4 0D 02            [ 1]  535     tnz (OPT,sp)
      0082B6 27 08            [ 1]  536     jreq 2$
                                    537 	; pour modifier une option il faut modifier ces 2 bits
      0082B8 72 1E 50 5B      [ 1]  538     bset FLASH_CR2,#FLASH_CR2_OPT
      0082BC 72 1F 50 5C      [ 1]  539     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0082C0                        540 2$: 
      0082C0 7B 01            [ 1]  541     ld a,(BTW,sp)
      0082C2 92 A7 00 17      [ 4]  542     ldf ([farptr],x),a
      0082C6 0D 02            [ 1]  543     tnz (OPT,sp)
      0082C8 27 08            [ 1]  544     jreq 3$
      0082CA 5C               [ 1]  545     incw x
      0082CB 7B 01            [ 1]  546     ld a,(BTW,sp)
      0082CD 43               [ 1]  547     cpl a
      0082CE 92 A7 00 17      [ 4]  548     ldf ([farptr],x),a
      0082D2 72 05 50 5F FB   [ 2]  549 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082D7                        550 write_exit:
      000257                        551 	_drop VSIZE 
      0082D7 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082D9 90 85            [ 2]  552 	popw y
      0082DB 81               [ 4]  553     ret
                                    554 
                                    555 ;--------------------------------------------
                                    556 ; write a data block to eeprom or flash 
                                    557 ; input:
                                    558 ;   Y        source address   
                                    559 ;   X        array index  destination  farptr[x]
                                    560 ;   BSIZE    block size bytes 
                                    561 ;   farptr   write address , byte* 
                                    562 ; output:
                                    563 ;	X 		after last byte written 
                                    564 ;   Y 		after last byte read 
                                    565 ;  farptr   point after block
                                    566 ;---------------------------------------------
      0082DC                        567 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      00025C                        568 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    569 	; local var 
                           000001   570 	XSAVE=1 
                           000002   571 	VSIZE=2 
      00025C                        572 write_block:
      00025C                        573 	_vars VSIZE
      0082DC 52 02            [ 2]    1     sub sp,#VSIZE 
      0082DE 1F 01            [ 2]  574 	ldw (XSAVE,sp),x 
      0082E0 1E 05            [ 2]  575 	ldw x,(BSIZE,sp) 
      0082E2 27 13            [ 1]  576 	jreq 9$
      0082E4 1E 01            [ 2]  577 1$:	ldw x,(XSAVE,sp)
      0082E6 90 F6            [ 1]  578 	ld a,(y)
      0082E8 CD 82 67         [ 4]  579 	call write_byte 
      0082EB 5C               [ 1]  580 	incw x 
      0082EC 90 5C            [ 1]  581 	incw y 
      0082EE 1F 01            [ 2]  582 	ldw (XSAVE,sp),x
      0082F0 1E 05            [ 2]  583 	ldw x,(BSIZE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082F2 5A               [ 2]  584 	decw x
      0082F3 1F 05            [ 2]  585 	ldw (BSIZE,sp),x 
      0082F5 26 ED            [ 1]  586 	jrne 1$
      0082F7                        587 9$:
      0082F7 1E 01            [ 2]  588 	ldw x,(XSAVE,sp)
      0082F9 CD 94 22         [ 4]  589 	call incr_farptr
      00027C                        590 	_drop VSIZE
      0082FC 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082FE 81               [ 4]  591 	ret 
                                    592 
                                    593 
                                    594 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    595 ;;   UART1 subroutines
                                    596 ;;   used for user interface 
                                    597 ;;   communication channel.
                                    598 ;;   settings: 
                                    599 ;;		115200 8N1 no flow control
                                    600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    601 
                                    602 ;---------------------------------------------
                                    603 ; initialize UART1, 115200 8N1
                                    604 ; input:
                                    605 ;	none
                                    606 ; output:
                                    607 ;   none
                                    608 ;---------------------------------------------
      0082FF                        609 uart1_init:
      0082FF 72 1A 50 02      [ 1]  610     bset PA_DDR,#UART1_TX_PIN
      008303 72 1A 50 03      [ 1]  611     bset PA_CR1,#UART1_TX_PIN 
      008307 72 1A 50 04      [ 1]  612     bset PA_CR2,#UART1_TX_PIN 
                                    613 ; enable UART1 clock
      00830B 72 14 50 C7      [ 1]  614 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      00830F                        615 uart1_set_baud: 
                                    616 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    617 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      00830F A6 E1            [ 1]  618 	ld a,#CLK_SWR_HSI
      008311 C1 50 C3         [ 1]  619 	cp a,CLK_CMSR 
      008314 27 0A            [ 1]  620 	jreq 2$ 
      008316                        621 1$: ; 8 Mhz 	
      008316 35 05 52 33      [ 1]  622 	mov UART1_BRR2,#0x05 ; must be loaded first
      00831A 35 04 52 32      [ 1]  623 	mov UART1_BRR1,#0x4
      00831E 20 08            [ 2]  624 	jra 3$
      008320                        625 2$: ; 16 Mhz 	
      008320 35 0B 52 33      [ 1]  626 	mov UART1_BRR2,#0x0b ; must be loaded first
      008324 35 08 52 32      [ 1]  627 	mov UART1_BRR1,#0x08
      008328                        628 3$:
      008328 72 5F 52 31      [ 1]  629     clr UART1_DR
      00832C 35 2C 52 35      [ 1]  630 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008330 72 10 52 35      [ 1]  631 	bset UART1_CR2,#UART_CR2_SBK
      008334 72 0D 52 30 FB   [ 2]  632     btjf UART1_SR,#UART_SR_TC,.
      008339 72 5F 00 2E      [ 1]  633     clr rx1_head 
      00833D 72 5F 00 2F      [ 1]  634 	clr rx1_tail 
      008341 81               [ 4]  635 	ret
                                    636 
                                    637 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    638 ; uart1_putc
                                    639 ; send a character via UART1
                                    640 ; input:
                                    641 ;    A  	character to send
                                    642 ;---------------------------------
      008342                        643 putc:: ; console output always on UART1
      008342                        644 uart1_putc:: 
      008342 72 0F 52 30 FB   [ 2]  645 	btjf UART1_SR,#UART_SR_TXE,.
      008347 C7 52 31         [ 1]  646 	ld UART1_DR,a 
      00834A 81               [ 4]  647 	ret 
                                    648 
                                    649 
                                    650 ;---------------------------------
                                    651 ; Query for character in rx1_queue
                                    652 ; input:
                                    653 ;   none 
                                    654 ; output:
                                    655 ;   A     0 no charcter available
                                    656 ;   Z     1 no character available
                                    657 ;---------------------------------
      00834B                        658 qgetc::
      00834B                        659 uart1_qgetc::
      00834B C6 00 2E         [ 1]  660 	ld a,rx1_head 
      00834E C0 00 2F         [ 1]  661 	sub a,rx1_tail 
      008351 81               [ 4]  662 	ret 
                                    663 
                                    664 ;---------------------------------
                                    665 ; wait character from UART1 
                                    666 ; input:
                                    667 ;   none
                                    668 ; output:
                                    669 ;   A 			char  
                                    670 ;--------------------------------	
      008352                        671 getc:: ;console input
      008352                        672 uart1_getc::
      008352 CD 83 4B         [ 4]  673 	call uart1_qgetc
      008355 27 FB            [ 1]  674 	jreq uart1_getc 
      008357 89               [ 2]  675 	pushw x 
      008358 AE 00 26         [ 2]  676 	ldw x,#rx1_queue
      00835B 9F               [ 1]  677 	ld a,xl 
      00835C CB 00 2E         [ 1]  678 	add a,rx1_head 
      00835F 97               [ 1]  679 	ld xl,a 
      008360 F6               [ 1]  680 	ld a,(x)
      008361 85               [ 2]  681 	popw x
      008362 88               [ 1]  682 	push a
      008363 72 5C 00 2E      [ 1]  683 	inc rx1_head 
      008367 A6 07            [ 1]  684 	ld a,#RX_QUEUE_SIZE-1 
      008369 C4 00 2E         [ 1]  685 	and a,rx1_head 
      00836C C7 00 2E         [ 1]  686 	ld rx1_head,a 
      00836F 84               [ 1]  687 	pop a  
      008370 81               [ 4]  688 	ret 
                                    689 
                                    690 ;----------------------
                                    691 ; print token id && value
                                    692 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    693 ;   A     token id 
                                    694 ;   X     token value 
                                    695 ;---------------------
                           000001   696 	BSAVE=1
                           000002   697 	AREG=2
                           000003   698 	XREG=3
                           000004   699 	VSIZE=4
      008371                        700 prt_tok:
      0002F1                        701 	_vars VSIZE 
      008371 52 04            [ 2]    1     sub sp,#VSIZE 
      008373 6B 02            [ 1]  702 	ld (AREG,sp),a 
      008375 1F 03            [ 2]  703 	ldw (XREG,sp),x 
      008377 C6 00 0B         [ 1]  704 	ld a, base
      00837A 6B 01            [ 1]  705 	ld (BSAVE,sp),a 
      00837C 35 10 00 0B      [ 1]  706 	mov base,#16  
      008380 AE 83 A8         [ 2]  707 	ldw x,#token_msg
      008383 CD A2 40         [ 4]  708 	call puts 
      008386 5F               [ 1]  709 	clrw x 
      008387 7B 02            [ 1]  710 	ld a,(AREG,sp)
      008389 97               [ 1]  711 	ld xl,a 
      00838A CD 88 ED         [ 4]  712 	call print_int 
      00838D A6 20            [ 1]  713 	ld a,#SPACE
      00838F CD 83 42         [ 4]  714 	call putc 
      008392 1E 03            [ 2]  715 	ldw x,(XREG,sp)
      008394 CD 88 ED         [ 4]  716 	call print_int 
      008397 A6 0D            [ 1]  717 	ld a,#CR 
      008399 CD 83 42         [ 4]  718 	call putc 
      00839C 7B 01            [ 1]  719 	ld a,(BSAVE,sp)
      00839E C7 00 0B         [ 1]  720 	ld base,a 
      0083A1 7B 02            [ 1]  721 	ld a,(AREG,sp)
      0083A3 1E 03            [ 2]  722 	ldw x,(XREG,sp)
      000325                        723 	_drop VSIZE 
      0083A5 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083A7 81               [ 4]  724 	ret 
      0083A8 74 6F 6B 65 6E 3A 20   725 token_msg: .asciz "token: "
             00
                                    726 
                                    727 
                                    728 ;---------------------
                                    729 ; display n bytes row 
                                    730 ; from memory.
                                    731 ; input:
                                    732 ;   A   bytes to print 
                                    733 ;	X   start address 
                                    734 ; output:
                                    735 ;   X   address after last shown  
                                    736 ;---------------------
                           000001   737 	CNT=1 
                           000002   738 	ADR=2 
                           000003   739 	VSIZE=3 
      0083B0                        740 show_row:
      0083B0 4D               [ 1]  741 	tnz a 
      0083B1 26 01            [ 1]  742 	jrne 1$
      0083B3 81               [ 4]  743 	ret 
      0083B4                        744 1$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083B4 89               [ 2]  745 	pushw x  
      0083B5 88               [ 1]  746 	push a 
      0083B6 35 04 00 25      [ 1]  747 	mov tab_width,#4 
      0083BA CD 88 ED         [ 4]  748 	call print_int 
      0083BD A6 20            [ 1]  749 	ld a,#SPACE  
      0083BF CD 83 42         [ 4]  750 	call putc
      0083C2                        751 row_loop:
      0083C2 1E 02            [ 2]  752 	ldw x,(ADR,sp)
      0083C4 F6               [ 1]  753 	ld a,(x)
      0083C5 5F               [ 1]  754 	clrw x 
      0083C6 97               [ 1]  755 	ld xl,a 
      0083C7 CD 88 ED         [ 4]  756 	call print_int 
      0083CA 1E 02            [ 2]  757 	ldw x,(ADR,sp)
      0083CC 5C               [ 1]  758 	incw x 
      0083CD 1F 02            [ 2]  759 	ldw (ADR,sp),x 
      0083CF 0A 01            [ 1]  760 	dec (CNT,sp)
      0083D1 26 EF            [ 1]  761 	jrne row_loop
      000353                        762 	_drop VSIZE  		
      0083D3 5B 03            [ 2]    1     addw sp,#VSIZE 
      0083D5 35 04 00 25      [ 1]  763 	mov tab_width,#4
      0083D9 A6 0D            [ 1]  764 	ld a,#CR 
      0083DB CD 83 42         [ 4]  765 	call putc 
      0083DE 81               [ 4]  766 	ret 
                                    767 
                                    768 ;--------------------------
                                    769 ; print memory content 
                                    770 ; in hexadecimal format
                                    771 ;  input:
                                    772 ;    X    start address 
                                    773 ;    Y    count 
                                    774 ;--------------------------
                           000001   775 	BCNT=1
                           000003   776 	BASE=3
                           000004   777 	TABW=4
                           000004   778 	VSIZE=4   
      0083DF                        779 hex_dump:
      00035F                        780 	_vars VSIZE
      0083DF 52 04            [ 2]    1     sub sp,#VSIZE 
      0083E1 C6 00 0B         [ 1]  781 	ld a,base
      0083E4 6B 03            [ 1]  782 	ld (BASE,sp),a 
      0083E6 35 10 00 0B      [ 1]  783 	mov base,#16
      0083EA C6 00 25         [ 1]  784 	ld a,tab_width 
      0083ED 6B 04            [ 1]  785 	ld (TABW,sp),a
      0083EF A6 0D            [ 1]  786 	ld a,#CR 
      0083F1 CD 83 42         [ 4]  787 	call putc 
      0083F4 17 01            [ 2]  788 1$: ldw (BCNT,sp),y
      0083F6 A6 10            [ 1]  789 	ld a,#16
      0083F8 90 A3 00 10      [ 2]  790 	cpw y,#16
      0083FC 2A 02            [ 1]  791 	jrpl 2$
      0083FE 90 9F            [ 1]  792 	ld a,yl
      008400                        793 2$: 	
      008400 CD 83 B0         [ 4]  794 	call show_row 
      008403 16 01            [ 2]  795 	ldw y,(BCNT,sp) 
      008405 72 A2 00 10      [ 2]  796 	subw y,#16 
      008409 90 A3 00 01      [ 2]  797 	cpw y,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00840D 2A E5            [ 1]  798 	jrpl 1$
      00840F 7B 03            [ 1]  799 	ld a,(BASE,sp)
      008411 C7 00 0B         [ 1]  800 	ld base,a
      008414 7B 04            [ 1]  801 	ld a,(TABW,sp)
      008416 C7 00 25         [ 1]  802 	ld tab_width,a 
      000399                        803 	_drop VSIZE
      008419 5B 04            [ 2]    1     addw sp,#VSIZE 
      00841B 81               [ 4]  804 	ret 
                                    805 
                                    806 ;-------------------------------------
                                    807 ; retrun string length
                                    808 ; input:
                                    809 ;   X         .asciz  pointer 
                                    810 ; output:
                                    811 ;   X         not affected 
                                    812 ;   A         length 
                                    813 ;-------------------------------------
      00841C                        814 strlen::
      00841C 89               [ 2]  815 	pushw x 
      00841D 4F               [ 1]  816 	clr a
      00841E 7D               [ 1]  817 1$:	tnz (x) 
      00841F 27 04            [ 1]  818 	jreq 9$ 
      008421 4C               [ 1]  819 	inc a 
      008422 5C               [ 1]  820 	incw x 
      008423 20 F9            [ 2]  821 	jra 1$ 
      008425 85               [ 2]  822 9$:	popw x 
      008426 81               [ 4]  823 	ret 
                                    824 
                                    825 ;------------------------------------
                                    826 ; compare 2 strings
                                    827 ; input:
                                    828 ;   X 		char* first string 
                                    829 ;   Y       char* second string 
                                    830 ; output:
                                    831 ;   A 		0|1 
                                    832 ;-------------------------------------
      008427                        833 strcmp:
      008427 F6               [ 1]  834 	ld a,(x)
      008428 27 0B            [ 1]  835 	jreq 5$ 
      00842A 90 F1            [ 1]  836 	cp a,(y) 
      00842C 26 05            [ 1]  837 	jrne 4$ 
      00842E 5C               [ 1]  838 	incw x 
      00842F 90 5C            [ 1]  839 	incw y 
      008431 20 F4            [ 2]  840 	jra strcmp 
      008433                        841 4$: ; not same  
      008433 4F               [ 1]  842 	clr a 
      008434 81               [ 4]  843 	ret 
      008435                        844 5$: ; same 
      008435 A6 01            [ 1]  845 	ld a,#1 
      008437 81               [ 4]  846 	ret 
                                    847 
                                    848 
                                    849 ;---------------------------------------
                                    850 ;  copy src to dest 
                                    851 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    852 ;   X 		dest 
                                    853 ;   Y 		src 
                                    854 ; output: 
                                    855 ;   X 		dest 
                                    856 ;----------------------------------
      008438                        857 strcpy::
      008438 89               [ 2]  858 	pushw x 
      008439 90 F6            [ 1]  859 1$: ld a,(y)
      00843B 27 06            [ 1]  860 	jreq 9$ 
      00843D F7               [ 1]  861 	ld (x),a 
      00843E 5C               [ 1]  862 	incw x 
      00843F 90 5C            [ 1]  863 	incw y 
      008441 20 F6            [ 2]  864 	jra 1$ 
      008443 7F               [ 1]  865 9$:	clr (x)
      008444 85               [ 2]  866 	popw x 
      008445 81               [ 4]  867 	ret 
                                    868 
                                    869 ;---------------------------------------
                                    870 ; move memory block 
                                    871 ; input:
                                    872 ;   X 		destination 
                                    873 ;   Y 	    source 
                                    874 ;   acc16	bytes count 
                                    875 ; output:
                                    876 ;   none 
                                    877 ;--------------------------------------
                           000001   878 	INCR=1 ; increament high byte 
                           000002   879 	LB=2 ; increament low byte 
                           000002   880 	VSIZE=2
      008446                        881 move::
      0003C6                        882 	_vars VSIZE 
      008446 52 02            [ 2]    1     sub sp,#VSIZE 
      008448 0F 01            [ 1]  883 	clr (INCR,sp)
      00844A 0F 02            [ 1]  884 	clr (LB,sp)
      00844C 90 89            [ 2]  885 	pushw y 
      00844E 13 01            [ 2]  886 	cpw x,(1,sp) ; compare DEST to SRC 
      008450 90 85            [ 2]  887 	popw y 
      008452 27 31            [ 1]  888 	jreq move_exit ; x==y 
      008454 2B 0E            [ 1]  889 	jrmi move_down
      008456                        890 move_up: ; start from top address with incr=-1
      008456 72 BB 00 0D      [ 2]  891 	addw x,acc16
      00845A 72 B9 00 0D      [ 2]  892 	addw y,acc16
      00845E 03 01            [ 1]  893 	cpl (INCR,sp)
      008460 03 02            [ 1]  894 	cpl (LB,sp)   ; increment = -1 
      008462 20 05            [ 2]  895 	jra move_loop  
      008464                        896 move_down: ; start from bottom address with incr=1 
      008464 5A               [ 2]  897     decw x 
      008465 90 5A            [ 2]  898 	decw y
      008467 0C 02            [ 1]  899 	inc (LB,sp) ; incr=1 
      008469                        900 move_loop:	
      008469 C6 00 0D         [ 1]  901     ld a, acc16 
      00846C CA 00 0E         [ 1]  902 	or a, acc8
      00846F 27 14            [ 1]  903 	jreq move_exit 
      008471 72 FB 01         [ 2]  904 	addw x,(INCR,sp)
      008474 72 F9 01         [ 2]  905 	addw y,(INCR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008477 90 F6            [ 1]  906 	ld a,(y)
      008479 F7               [ 1]  907 	ld (x),a 
      00847A 89               [ 2]  908 	pushw x 
      00847B CE 00 0D         [ 2]  909 	ldw x,acc16 
      00847E 5A               [ 2]  910 	decw x 
      00847F CF 00 0D         [ 2]  911 	ldw acc16,x 
      008482 85               [ 2]  912 	popw x 
      008483 20 E4            [ 2]  913 	jra move_loop
      008485                        914 move_exit:
      000405                        915 	_drop VSIZE
      008485 5B 02            [ 2]    1     addw sp,#VSIZE 
      008487 81               [ 4]  916 	ret 	
                                    917 
                                    918 ;------------------------------------
                                    919 ;  set all variables to zero 
                                    920 ; input:
                                    921 ;   none 
                                    922 ; output:
                                    923 ;	none
                                    924 ;------------------------------------
      008488                        925 clear_vars:
      008488 AE 00 30         [ 2]  926 	ldw x,#vars 
      00848B 90 AE 00 34      [ 2]  927 	ldw y,#2*26 
      00848F 7F               [ 1]  928 1$:	clr (x)
      008490 5C               [ 1]  929 	incw x 
      008491 90 5A            [ 2]  930 	decw y 
      008493 26 FA            [ 1]  931 	jrne 1$
      008495 81               [ 4]  932 	ret 
                                    933 
                                    934 ;-------------------------------------
                                    935 ; check if A is a letter 
                                    936 ; input:
                                    937 ;   A 			character to test 
                                    938 ; output:
                                    939 ;   C flag      1 true, 0 false 
                                    940 ;-------------------------------------
      008496                        941 is_alpha::
      008496 A1 41            [ 1]  942 	cp a,#'A 
      008498 8C               [ 1]  943 	ccf 
      008499 24 0B            [ 1]  944 	jrnc 9$ 
      00849B A1 5B            [ 1]  945 	cp a,#'Z+1 
      00849D 25 07            [ 1]  946 	jrc 9$ 
      00849F A1 61            [ 1]  947 	cp a,#'a 
      0084A1 8C               [ 1]  948 	ccf 
      0084A2 24 02            [ 1]  949 	jrnc 9$
      0084A4 A1 7B            [ 1]  950 	cp a,#'z+1
      0084A6 81               [ 4]  951 9$: ret 	
                                    952 
                                    953 ;------------------------------------
                                    954 ; check if character in {'0'..'9'}
                                    955 ; input:
                                    956 ;    A  character to test
                                    957 ; output:
                                    958 ;    Carry  0 not digit | 1 digit
                                    959 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084A7                        960 is_digit::
      0084A7 A1 30            [ 1]  961 	cp a,#'0
      0084A9 25 03            [ 1]  962 	jrc 1$
      0084AB A1 3A            [ 1]  963     cp a,#'9+1
      0084AD 8C               [ 1]  964 	ccf 
      0084AE 8C               [ 1]  965 1$:	ccf 
      0084AF 81               [ 4]  966     ret
                                    967 
                                    968 ;-------------------------------------
                                    969 ; return true if character in  A 
                                    970 ; is letter or digit.
                                    971 ; input:
                                    972 ;   A     ASCII character 
                                    973 ; output:
                                    974 ;   A     no change 
                                    975 ;   Carry    0 false| 1 true 
                                    976 ;--------------------------------------
      0084B0                        977 is_alnum::
      0084B0 CD 84 A7         [ 4]  978 	call is_digit
      0084B3 25 03            [ 1]  979 	jrc 1$ 
      0084B5 CD 84 96         [ 4]  980 	call is_alpha
      0084B8 81               [ 4]  981 1$:	ret 
                                    982 
                                    983 
                                    984 ;-------------------------------------
                                    985 ;  program initialization entry point 
                                    986 ;-------------------------------------
                           000002   987 	MAJOR=2
                           000000   988 	MINOR=0 
      0084B9 0A 0A 54 69 6E 79 20   989 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0084FF                        990 cold_start:
                                    991 ;set stack 
      0084FF AE 17 FF         [ 2]  992 	ldw x,#STACK_EMPTY
      008502 94               [ 1]  993 	ldw sp,x   
                                    994 ; clear all ram 
      008503 7F               [ 1]  995 0$: clr (x)
      008504 5A               [ 2]  996 	decw x 
      008505 26 FC            [ 1]  997 	jrne 0$
                                    998 ; activate pull up on all inputs 
      008507 A6 FF            [ 1]  999 	ld a,#255 
      008509 C7 50 03         [ 1] 1000 	ld PA_CR1,a 
      00850C C7 50 08         [ 1] 1001 	ld PB_CR1,a 
      00850F C7 50 0D         [ 1] 1002 	ld PC_CR1,a 
      008512 C7 50 12         [ 1] 1003 	ld PD_CR1,a 
      008515 C7 50 17         [ 1] 1004 	ld PE_CR1,a 
      008518 C7 50 1C         [ 1] 1005 	ld PF_CR1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      00851B C7 50 21         [ 1] 1006 	ld PG_CR1,a 
      00851E C7 50 2B         [ 1] 1007 	ld PI_CR1,a
                                   1008 ; set LD2 pin as output 
      008521 72 1A 50 0D      [ 1] 1009     bset PC_CR1,#LED2_BIT
      008525 72 1A 50 0E      [ 1] 1010     bset PC_CR2,#LED2_BIT
      008529 72 1A 50 0C      [ 1] 1011     bset PC_DDR,#LED2_BIT
      00852D 72 1B 50 0A      [ 1] 1012 	bres PC_ODR,#LED2_BIT 
                                   1013 ; disable schmitt triggers on Arduino CN4 analog inputs
      008531 55 00 3F 54 07   [ 1] 1014 	mov ADC_TDRL,0x3f
                                   1015 ; disable peripherals clocks
                                   1016 ;	clr CLK_PCKENR1 
                                   1017 ;	clr CLK_PCKENR2
      008536 72 5F 50 F2      [ 1] 1018 	clr AWU_TBR 
      00853A 72 14 50 CA      [ 1] 1019 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1020 ; select internal clock no divisor: 16 Mhz 	
      00853E A6 E1            [ 1] 1021 	ld a,#CLK_SWR_HSI 
      008540 5F               [ 1] 1022 	clrw x  
      008541 CD 81 37         [ 4] 1023     call clock_init 
      008544 CD 81 5A         [ 4] 1024 	call timer4_init
      008547 CD 81 4D         [ 4] 1025 	call timer2_init
                                   1026 ; UART1 at 115200 BAUD
      00854A CD 82 FF         [ 4] 1027 	call uart1_init
                                   1028 ; activate PE_4 (user button interrupt)
      00854D 72 18 50 18      [ 1] 1029     bset PE_CR2,#USR_BTN_BIT 
                                   1030 ; display system information
      008551 AE 84 B9         [ 2] 1031 	ldw x,#software 
      008554 CD A2 40         [ 4] 1032 	call puts 
      008557 A6 02            [ 1] 1033 	ld a,#MAJOR 
      008559 C7 00 0E         [ 1] 1034 	ld acc8,a 
      00855C 5F               [ 1] 1035 	clrw x 
      00855D CF 00 0C         [ 2] 1036 	ldw acc24,x
      008560 72 5F 00 25      [ 1] 1037 	clr tab_width  
      008564 35 0A 00 0B      [ 1] 1038 	mov base, #10 
      008568 CD 88 FD         [ 4] 1039 	call prti24 
      00856B A6 2E            [ 1] 1040 	ld a,#'.
      00856D CD 83 42         [ 4] 1041 	call putc 
      008570 A6 00            [ 1] 1042 	ld a,#MINOR 
      008572 C7 00 0E         [ 1] 1043 	ld acc8,a 
      008575 5F               [ 1] 1044 	clrw x 
      008576 CF 00 0C         [ 2] 1045 	ldw acc24,x 
      008579 CD 88 FD         [ 4] 1046 	call prti24
      00857C A6 0D            [ 1] 1047 	ld a,#CR 
      00857E CD 83 42         [ 4] 1048 	call putc
      008581 CD 94 30         [ 4] 1049 	call seek_fdrive 
      008584 9A               [ 1] 1050 	rim 
      008585 72 5C 00 16      [ 1] 1051 	inc seedy+1 
      008589 72 5C 00 14      [ 1] 1052 	inc seedx+1 
      00858D CD 86 0A         [ 4] 1053 	call clear_basic
      008590 CD 8E 3F         [ 4] 1054 	call ubound 
      008593 CD 92 7E         [ 4] 1055 	call beep_1khz  
      008596                       1056 2$:	
      008596 CD 85 9F         [ 4] 1057 	call warm_init
      008599 CD 85 CC         [ 4] 1058 	call load_autorun
      00859C CC 88 2A         [ 2] 1059     jp cmd_line  
                                   1060 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00859F                       1061 warm_init:
      00859F 72 5F 00 24      [ 1] 1062 	clr flags 
      0085A3 72 5F 00 21      [ 1] 1063 	clr loop_depth 
      0085A7 35 04 00 25      [ 1] 1064 	mov tab_width,#TAB_WIDTH 
      0085AB 35 0A 00 0B      [ 1] 1065 	mov base,#10 
      0085AF AE 00 00         [ 2] 1066 	ldw x,#0 
      0085B2 CF 00 05         [ 2] 1067 	ldw basicptr,x 
      0085B5 CF 00 01         [ 2] 1068 	ldw in.w,x 
      0085B8 72 5F 00 04      [ 1] 1069 	clr count
      0085BC 81               [ 4] 1070 	ret 
                                   1071 
                                   1072 ;--------------------------
                                   1073 ; called by tb_error when
                                   1074 ; flag FAUTORUN is set.
                                   1075 ; There is a bug in autorun 
                                   1076 ; program so cancel it.
                                   1077 ;---------------------------
      0085BD                       1078 cancel_autorun:
      0085BD AE 40 00         [ 2] 1079 	ldw x,#AUTORUN_NAME 
      0085C0 CF 00 18         [ 2] 1080 	ldw farptr+1,x 
      0085C3 4F               [ 1] 1081 	clr a
      0085C4 5F               [ 1] 1082 	clrw x  
      0085C5 C7 00 17         [ 1] 1083 	ld farptr,a 
      0085C8 CD 82 67         [ 4] 1084 	call write_byte 
      0085CB 81               [ 4] 1085 	ret 
                                   1086 
                                   1087 
                                   1088 ;--------------------------
                                   1089 ; if autorun file defined 
                                   1090 ; in eeprom address AUTORUN_NAME 
                                   1091 ; load and run it.
                                   1092 ;-------------------------
      0085CC                       1093 load_autorun:
      0085CC 90 AE 40 00      [ 2] 1094 	ldw y,#AUTORUN_NAME
      0085D0 90 F6            [ 1] 1095 	ld a,(y)
      0085D2 27 20            [ 1] 1096 	jreq 9$
      0085D4 CD 94 96         [ 4] 1097 	call search_file
      0085D7 25 05            [ 1] 1098 	jrc 2$ 
                                   1099 ; if file doesn't exit
      0085D9 CD 85 BD         [ 4] 1100 	call cancel_autorun
      0085DC 20 16            [ 2] 1101 	jra 9$ 
      0085DE CD 95 B1         [ 4] 1102 2$:	call load_file
      0085E1 AE 40 00         [ 2] 1103 	ldw x,#AUTORUN_NAME 
      0085E4 CD A2 40         [ 4] 1104 	call puts
      0085E7 AE 85 F5         [ 2] 1105 	ldw x,#autorun_msg 
      0085EA CD A2 40         [ 4] 1106 	call puts 
      0085ED 72 1C 00 24      [ 1] 1107 	bset flags,#FAUTORUN 
      0085F1 CC 92 50         [ 2] 1108 	jp run_it    
      0085F4 81               [ 4] 1109 9$: ret 	
                                   1110 
      0085F5 20 6C 6F 61 64 65 64  1111 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1112 ;---------------------------
                                   1113 ; reset BASIC text variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1114 ; and clear variables 
                                   1115 ;---------------------------
      00860A                       1116 clear_basic:
      00860A 72 5F 00 04      [ 1] 1117 	clr count
      00860E 72 5F 00 02      [ 1] 1118 	clr in  
      008612 AE 00 64         [ 2] 1119 	ldw x,#free_ram 
      008615 CF 00 1D         [ 2] 1120 	ldw txtbgn,x 
      008618 CF 00 1F         [ 2] 1121 	ldw txtend,x 
      00861B CD 84 88         [ 4] 1122 	call clear_vars 
      00861E 81               [ 4] 1123 	ret 
                                   1124 
                                   1125 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1126 ;;   Tiny BASIC error messages     ;;
                                   1127 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00861F                       1128 err_msg:
      00861F 00 00 86 3F 86 4C 86  1129 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             5A 86 73 86 82
      00862B 86 98 86 AE 86 C8 86  1130 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             D9 86 EA
      008635 86 F6 87 29 87 39 87  1131 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             4D 87 60
                                   1132 
      00863F 4D 65 6D 6F 72 79 20  1133 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      00864C 73 79 6E 74 61 78 20  1134 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      00865A 6D 61 74 68 20 6F 70  1135 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      008673 64 69 76 69 73 69 6F  1136 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      008682 69 6E 76 61 6C 69 64  1137 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      008698 72 75 6E 20 74 69 6D  1138 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0086AE 63 6F 6D 6D 61 6E 64  1139 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      0086C8 64 75 70 6C 69 63 61  1140 err_duplicate: .asciz "duplicate name.\n"
             74 65 20 6E 61 6D 65
             2E 0A 00
      0086D9 46 69 6C 65 20 6E 6F  1141 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      0086EA 62 61 64 20 76 61 6C  1142 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      0086F6 46 69 6C 65 20 69 6E  1143 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal  65-Bits]



             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      008705 64 20 6D 65 6D 6F 72  1144 err_no_data: .asciz "No data found.\n"
             79 2C 20 63 61 6E 27
             74 20
      008715 62 65 20 72 75 6E 20  1145 err_no_prog: .asciz "No program in RAM!\n"
             66 72 6F 6D 20 74 68
             65 72 65 2E 0A 00
      008729 4E 6F 20 64 61 74 61  1146 err_no_fspace: .asciz "File system full.\n" 
             20 66 6F 75 6E 64 2E
             0A 00 4E 6F 20
      00873C 70 72 6F 67 72 61 6D  1147 err_buf_full: .asciz "Buffer full\n"
             20 69 6E 20 52 41
                                   1148 
      008749 4D 21 0A 00 46 69 6C  1149 rt_msg: .asciz "\nrun time error, "
             65 20 73 79 73 74 65
             6D 20 66 75
      00875B 6C 6C 2E 0A 00 42 75  1150 comp_msg: .asciz "\ncompile error, "
             66 66 65 72 20 66 75
             6C 6C 0A
      00876C 00 0A 72 75 6E 20 74  1151 tk_id: .asciz "last token id: "
             69 6D 65 20 65 72 72
             6F 72
                                   1152 
      000720                       1153 syntax_error::
      00877C 2C 20            [ 1] 1154 	ld a,#ERR_SYNTAX 
                                   1155 
      000722                       1156 tb_error::
      00877E 00 0A 63 6F 6D   [ 2] 1157 	btjt flags,#FCOMP,1$
      008783 70               [ 1] 1158 	push a 
      008784 69 6C 65         [ 2] 1159 	ldw x, #rt_msg 
      008787 20 65 72         [ 4] 1160 	call puts 
      00878A 72               [ 1] 1161 	pop a 
      00878B 6F 72 2C         [ 2] 1162 	ldw x, #err_msg 
      00878E 20 00 6C 61      [ 1] 1163 	clr acc16 
      008792 73               [ 1] 1164 	sll a
      008793 74 20 74 6F      [ 1] 1165 	rlc acc16  
      008797 6B 65 6E         [ 1] 1166 	ld acc8, a 
      00879A 20 69 64 3A      [ 2] 1167 	addw x,acc16 
      00879E 20               [ 2] 1168 	ldw x,(x)
      00879F 00 00 00         [ 4] 1169 	call puts
      0087A0 CE 00 04         [ 2] 1170 	ldw x,basicptr
      0087A0 A6 02 01         [ 1] 1171 	ld a,in 
      0087A2 CD 0E 88         [ 4] 1172 	call prt_basic_line
      0087A2 72 0A 00         [ 2] 1173 	ldw x,#tk_id 
      0087A5 24 47 88         [ 4] 1174 	call puts 
      0087A8 AE 87 6D         [ 1] 1175 	ld a,in.saved 
      0087AB CD               [ 1] 1176 	clrw x 
      0087AC A2               [ 1] 1177 	ld xl,a 
      0087AD 40 84 AE 86      [ 2] 1178 	addw x,basicptr 
      0087B1 1F               [ 1] 1179 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0087B2 72               [ 1] 1180 	clrw x 
      0087B3 5F               [ 1] 1181 	ld xl,a 
      0087B4 00 0D 48         [ 4] 1182 	call print_int
      0087B7 72 59 00 0D C7   [ 2] 1183 	btjf flags,#FAUTORUN ,6$
      0087BC 00 0E 72         [ 4] 1184 	call cancel_autorun  
      0087BF BB 00            [ 2] 1185 	jra 6$
      00076E                       1186 1$:	
      0087C1 0D               [ 1] 1187 	push a 
      0087C2 FE CD A2         [ 2] 1188 	ldw x,#comp_msg
      0087C5 40 CE 00         [ 4] 1189 	call puts 
      0087C8 05               [ 1] 1190 	pop a 
      0087C9 C6 00 02         [ 2] 1191 	ldw x, #err_msg 
      0087CC CD 8F 08 AE      [ 1] 1192 	clr acc16 
      0087D0 87               [ 1] 1193 	sll a
      0087D1 90 CD A2 40      [ 1] 1194 	rlc acc16  
      0087D5 C6 00 03         [ 1] 1195 	ld acc8, a 
      0087D8 5F 97 72 BB      [ 2] 1196 	addw x,acc16 
      0087DC 00               [ 2] 1197 	ldw x,(x)
      0087DD 05 F6 5F         [ 4] 1198 	call puts
      0087E0 97 CD 88         [ 2] 1199 	ldw x,#tib
      0087E3 ED 72 0D         [ 4] 1200 	call puts 
      0087E6 00 24            [ 1] 1201 	ld a,#CR 
      0087E8 3A CD 85         [ 4] 1202 	call putc
      0087EB BD 20 35         [ 2] 1203 	ldw x,in.w
      0087EE CD 00 00         [ 4] 1204 	call spaces
      0087EE 88 AE            [ 1] 1205 	ld a,#'^
      0087F0 87 7F CD         [ 4] 1206 	call putc 
      0087F3 A2 40 84         [ 2] 1207 6$: ldw x,#STACK_EMPTY 
      0087F6 AE               [ 1] 1208     ldw sp,x
      0007A7                       1209 warm_start:
      0087F7 86 1F 72         [ 4] 1210 	call warm_init
                                   1211 ;----------------------------
                                   1212 ;   BASIC interpreter
                                   1213 ;----------------------------
      0007AA                       1214 cmd_line: ; user interface 
      0087FA 5F 00            [ 1] 1215 	ld a,#CR 
      0087FC 0D 48 72         [ 4] 1216 	call putc 
      0087FF 59 00            [ 1] 1217 	ld a,#'> 
      008801 0D C7 00         [ 4] 1218 	call putc
      008804 0E 72 BB         [ 4] 1219 	call readln
      008807 00 0D FE CD      [ 1] 1220 	tnz count 
      00880B A2 40            [ 1] 1221 	jreq cmd_line
      00880D AE 16 90         [ 4] 1222 	call compile
                                   1223 ; if text begin with a line number
                                   1224 ; the compiler set count to zero    
                                   1225 ; so code is not interpreted
      008810 CD A2 40 A6      [ 1] 1226 	tnz count 
      008814 0D CD            [ 1] 1227 	jreq cmd_line
                                   1228 
                                   1229 ; if direct command 
                                   1230 ; it's ready to interpret 
                                   1231 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1232 ;; This is the interpreter loop
                                   1233 ;; for each BASIC code line. 
                                   1234 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0007C6                       1235 interpreter: 
      008816 83 42 CE         [ 1] 1236 	ld a,in 
      008819 00 01 CD         [ 1] 1237 	cp a,count 
      00881C A2 AD            [ 1] 1238 	jrmi interp_loop
      0007CE                       1239 next_line:
      00881E A6 5E CD 83 42   [ 2] 1240 	btjf flags, #FRUN, cmd_line
      008823 AE 17 FF         [ 2] 1241 	ldw x,basicptr
      008826 94 BB 00 00      [ 2] 1242 	addw x,in.w 
      008827 C3 00 1E         [ 2] 1243 	cpw x,txtend 
      008827 CD 85            [ 1] 1244 	jrpl warm_start
      008829 9F 00 04         [ 2] 1245 	ldw basicptr,x ; start of next line  
      00882A E6 02            [ 1] 1246 	ld a,(2,x)
      00882A A6 0D CD         [ 1] 1247 	ld count,a 
      00882D 83 42 A6 3E      [ 1] 1248 	mov in,#3 ; skip first 3 bytes of line 
      0007EB                       1249 interp_loop: 
      008831 CD 83 42         [ 4] 1250 	call next_token
      008834 CD A3            [ 1] 1251 	cp a,#TK_NONE 
      008836 45 72            [ 1] 1252 	jreq next_line 
      008838 5D 00            [ 1] 1253 	cp a,#TK_CMD
      00883A 04 27            [ 1] 1254 	jrne 1$
      00883C ED               [ 4] 1255 	call (x) 
      00883D CD A9            [ 2] 1256 	jra interp_loop 
      0007F9                       1257 1$:	 
      00883F 19 72            [ 1] 1258 	cp a,#TK_VAR
      008841 5D 00            [ 1] 1259 	jrne 2$
      008843 04 27 E4         [ 4] 1260 	call let_var  
      008846 20 E9            [ 2] 1261 	jra interp_loop 
      000802                       1262 2$:	
      008846 C6 00            [ 1] 1263 	cp a,#TK_ARRAY 
      008848 02 C1            [ 1] 1264 	jrne 3$
      00884A 00 04 2B         [ 4] 1265 	call let_array 
      00884D 1D E0            [ 2] 1266 	jra interp_loop
      00884E                       1267 3$:	
      00884E 72 01            [ 1] 1268 	cp a,#TK_COLON 
      008850 00 24            [ 1] 1269 	jreq interp_loop 
      008852 D7 CE 00         [ 2] 1270 	jp syntax_error 
                                   1271 
                                   1272 		
                                   1273 ;--------------------------
                                   1274 ; extract next token from
                                   1275 ; token list 
                                   1276 ; basicptr -> base address 
                                   1277 ; in  -> offset in list array 
                                   1278 ; output:
                                   1279 ;   A 		token attribute
                                   1280 ;   X 		token value if there is one
                                   1281 ;----------------------------------------
      000812                       1282 next_token::
      008855 05               [ 1] 1283 	clrw x 
      008856 72 BB 00         [ 1] 1284 	ld a,in 
                                   1285 ; don't replace sub by "cp a,count" 
                                   1286 ; if end of line must return with A=0   	
      008859 01 C3 00         [ 1] 1287 	sub a,count 
      00885C 1F 2A            [ 1] 1288 	jreq 9$ ; end of line 
      00081B                       1289 0$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      00885E C8 CF 00 05 E6   [ 1] 1290 	mov in.saved,in ; in case "_unget_token" needed 
      008863 02 C7 00 04      [ 2] 1291 	ldw y,basicptr 
      008867 35 03 00         [ 4] 1292 	ld a,([in.w],y)
      00886A 02 5C 00 01      [ 1] 1293 	inc in  
      00886B 4D               [ 1] 1294 	tnz a 
      00886B CD 88            [ 1] 1295 	jrmi 6$
      00886D 92 A1            [ 1] 1296 	cp a,#TK_ARRAY
      00886F 00 27            [ 1] 1297 	jrpl 9$  ; no attribute for these
                                   1298 ;	cp a,#TK_COLON
                                   1299 ;	jreq 9$  
      000832                       1300 1$: ; 
      008871 DC A1            [ 1] 1301 	cp a,#TK_CHAR
      008873 80 26            [ 1] 1302 	jrne 2$
      008875 03               [ 1] 1303 	exg a,xl
      008876 FD 20 F2         [ 4] 1304 	ld a,([in.w],y)
      008879 72 5C 00 01      [ 1] 1305 	inc in 
      008879 A1               [ 1] 1306 	exg a,xl  
      00887A 85 26            [ 2] 1307 	jra 9$ 
      00887C 05 CD            [ 1] 1308 2$:	cp a,#TK_QSTR 
      00887E 8E 72            [ 1] 1309 	jrne 9$
      008880 20               [ 1] 1310 	ldw x,y 
      008881 E9 BB 00 00      [ 2] 1311 	addw x,in.w ; pointer to string 
                                   1312 ; move pointer after string 
      008882 91 6D 00         [ 4] 1313 3$:	tnz ([in.w],y)
      008882 A1 06            [ 1] 1314 	jreq 8$
      008884 26 05 CD 8E      [ 1] 1315 	inc in 
      008888 6F 20            [ 2] 1316 	jra 3$
      000855                       1317 6$: 
      00888A E0 B9 00 00      [ 2] 1318 	addw y,in.w 
      00888B 90 FE            [ 2] 1319 	ldw y,(y)
      00888B A1 0B            [ 1] 1320 	cp a,#TK_INTGR
      00888D 27 DC            [ 1] 1321 	jrpl 7$
      00888F CC 87 A0 94      [ 2] 1322 	ldw y,(code_addr,y) 
      008892 51               [ 1] 1323 7$:	exgw x,y 
      008892 5F C6 00 02      [ 1] 1324 	inc in
      008896 C0 00 04 27      [ 1] 1325 8$:	inc in 
      00086C                       1326 9$: 
      00889A 51               [ 4] 1327 	ret	
                                   1328 
                                   1329 ;-----------------------------------
                                   1330 ; print a 16 bit integer 
                                   1331 ; using variable 'base' as conversion
                                   1332 ; format.
                                   1333 ; input:
                                   1334 ;   X       integer to print 
                                   1335 ;   'base'    conversion base 
                                   1336 ; output:
                                   1337 ;   none 
                                   1338 ;-----------------------------------
      00889B                       1339 print_int:
      00889B 55 00 02 00      [ 1] 1340 	clr acc24 
      00889F 03 90 CE         [ 2] 1341 	ldw acc16,x 
      0088A2 00 05 91 D6 01   [ 2] 1342 	btjf acc16,#7,prti24
      0088A7 72 5C 00 02      [ 1] 1343 	cpl acc24 
                                   1344 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1345 ;------------------------------------
                                   1346 ; print integer in acc24 
                                   1347 ; input:
                                   1348 ;	acc24 		integer to print 
                                   1349 ;	'base' 		numerical base for conversion 
                                   1350 ;   'tab_width' field width 
                                   1351 ;  output:
                                   1352 ;    A          string length
                                   1353 ;------------------------------------
      00087D                       1354 prti24:
      0088AB 4D 2B 27         [ 4] 1355     call itoa  ; conversion entier en  .asciz
      0088AE A1 06 2A         [ 4] 1356 	call right_align  
      0088B1 3A               [ 1] 1357 	push a 
      0088B2 CD 00 00         [ 4] 1358 	call puts
      0088B2 A1               [ 1] 1359 	pop a 
      0088B3 03               [ 4] 1360     ret	
                                   1361 
                                   1362 ;------------------------------------
                                   1363 ; convert integer in acc24 to string
                                   1364 ; input:
                                   1365 ;   'base'	conversion base 
                                   1366 ;	acc24	integer to convert
                                   1367 ; output:
                                   1368 ;   X  		pointer to first char of string
                                   1369 ;   A       string length
                                   1370 ;------------------------------------
                           000001  1371 	SIGN=1  ; integer sign 
                           000002  1372 	LEN=2 
                           000003  1373 	PSTR=3
                           000004  1374 	VSIZE=4 ;locals size
      000889                       1375 itoa::
      000889                       1376 	_vars VSIZE
      0088B4 26 0B            [ 2]    1     sub sp,#VSIZE 
      0088B6 41 91            [ 1] 1377 	clr (LEN,sp) ; string length  
      0088B8 D6 01            [ 1] 1378 	clr (SIGN,sp)    ; sign
      0088BA 72 5C 00         [ 1] 1379 	ld a,base 
      0088BD 02 41            [ 1] 1380 	cp a,#10
      0088BF 20 2B            [ 1] 1381 	jrne 1$
                                   1382 	; base 10 string display with negative sign if bit 23==1
      0088C1 A1 02 26 27 93   [ 2] 1383 	btjf acc24,#7,1$
      0088C6 72 BB            [ 1] 1384 	cpl (SIGN,sp)
      0088C8 00 01 91         [ 4] 1385 	call neg_acc24
      0008A0                       1386 1$:
                                   1387 ; initialize string pointer 
      0088CB 6D 01 27         [ 2] 1388 	ldw x,#tib 
      0088CE 19 72 5C         [ 2] 1389 	addw x,#TIB_SIZE
      0088D1 00               [ 2] 1390 	decw x 
      0088D2 02               [ 1] 1391 	clr (x)
      0088D3 20 F5            [ 1] 1392 	ld a,#32
      0088D5 F7               [ 1] 1393 	ld (x),a 
      0088D5 72 B9            [ 1] 1394 	inc (LEN,sp)
      0008AD                       1395 itoa_loop:
      0088D7 00 01 90         [ 1] 1396     ld a,base
      0088DA FE A1            [ 2] 1397 	ldw (PSTR,sp),x 
      0088DC 84 2A 04         [ 4] 1398     call divu24_8 ; acc24/A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0088DF 90 DE            [ 2] 1399 	ldw x,(PSTR,sp)
      0088E1 A1 14            [ 1] 1400     add a,#'0  ; remainder of division
      0088E3 51 72            [ 1] 1401     cp a,#'9+1
      0088E5 5C 00            [ 1] 1402     jrmi 2$
      0088E7 02 72            [ 1] 1403     add a,#7 
      0008BF                       1404 2$:	
      0088E9 5C               [ 2] 1405 	decw x
      0088EA 00               [ 1] 1406     ld (x),a
      0088EB 02 02            [ 1] 1407 	inc (LEN,sp)
                                   1408 	; if acc24==0 conversion done
      0088EC C6 00 0B         [ 1] 1409 	ld a,acc24
      0088EC 81 00 0C         [ 1] 1410 	or a,acc16
      0088ED CA 00 0D         [ 1] 1411 	or a,acc8
      0088ED 72 5F            [ 1] 1412     jrne itoa_loop
                                   1413 	;conversion done, next add '$' or '-' as required
      0088EF 00 0C CF         [ 1] 1414 	ld a,base 
      0088F2 00 0D            [ 1] 1415 	cp a,#16
      0088F4 72 0F            [ 1] 1416 	jreq 8$
      0088F6 00 0D            [ 1] 1417 	ld a,(SIGN,sp)
      0088F8 04 72            [ 1] 1418     jreq 10$
      0088FA 53 00            [ 1] 1419     ld a,#'-
      0088FC 0C 0D            [ 2] 1420 	jra 9$ 
                                   1421 ; don't print more than 4 digits
                                   1422 ; in hexadecimal to avoid '-' sign 
                                   1423 ; extend display 	
      0088FD 7B 02            [ 1] 1424 8$: ld a,(LEN,sp) 
      0088FD CD 89            [ 1] 1425 	cp a,#5 
      0088FF 09 CD            [ 1] 1426 	jrmi 81$
      008901 A9               [ 1] 1427 	incw x
      008902 B8 88            [ 1] 1428 	dec (LEN,sp)
      008904 CD A2            [ 2] 1429 	jra 8$
      0008E8                       1430 81$:	
      008906 40 84            [ 1] 1431 	ld a,#'$ 
      008908 81               [ 2] 1432 9$: decw x
      008909 F7               [ 1] 1433     ld (x),a
      008909 52 04            [ 1] 1434 	inc (LEN,sp)
      0008EE                       1435 10$:
      00890B 0F 02            [ 1] 1436 	ld a,(LEN,sp)
      0008F0                       1437 	_drop VSIZE
      00890D 0F 01            [ 2]    1     addw sp,#VSIZE 
      00890F C6               [ 4] 1438 	ret
                                   1439 
                                   1440 ;-------------------------------------
                                   1441 ; divide uint24_t by uint8_t
                                   1442 ; used to convert uint24_t to string
                                   1443 ; input:
                                   1444 ;	acc24	dividend
                                   1445 ;   A 		divisor
                                   1446 ; output:
                                   1447 ;   acc24	quotient
                                   1448 ;   A		remainder
                                   1449 ;------------------------------------- 
                                   1450 ; offset  on sp of arguments and locals
                           000001  1451 	U8   = 1   ; divisor on stack
                           000001  1452 	VSIZE =1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0008F3                       1453 divu24_8:
      008910 00               [ 2] 1454 	pushw x ; save x
      008911 0B               [ 1] 1455 	push a 
                                   1456 	; ld dividend UU:MM bytes in X
      008912 A1 0A 26         [ 1] 1457 	ld a, acc24
      008915 0A               [ 1] 1458 	ld xh,a
      008916 72 0F 00         [ 1] 1459 	ld a,acc24+1
      008919 0C               [ 1] 1460 	ld xl,a
      00891A 05 03            [ 1] 1461 	ld a,(U8,SP) ; divisor
      00891C 01               [ 2] 1462 	div x,a ; UU:MM/U8
      00891D CD               [ 1] 1463 	push a  ;save remainder
      00891E 89               [ 1] 1464 	ld a,xh
      00891F D5 00 0B         [ 1] 1465 	ld acc24,a
      008920 9F               [ 1] 1466 	ld a,xl
      008920 AE 16 90         [ 1] 1467 	ld acc24+1,a
      008923 1C               [ 1] 1468 	pop a
      008924 00               [ 1] 1469 	ld xh,a
      008925 50 5A 7F         [ 1] 1470 	ld a,acc24+2
      008928 A6               [ 1] 1471 	ld xl,a
      008929 20 F7            [ 1] 1472 	ld a,(U8,sp) ; divisor
      00892B 0C               [ 2] 1473 	div x,a  ; R:LL/U8
      00892C 02 01            [ 1] 1474 	ld (U8,sp),a ; save remainder
      00892D 9F               [ 1] 1475 	ld a,xl
      00892D C6 00 0B         [ 1] 1476 	ld acc24+2,a
      008930 1F               [ 1] 1477 	pop a
      008931 03               [ 2] 1478 	popw x
      008932 CD               [ 4] 1479 	ret
                                   1480 
                                   1481 ;--------------------------------------
                                   1482 ; unsigned multiply uint24_t by uint8_t
                                   1483 ; use to convert numerical string to uint24_t
                                   1484 ; input:
                                   1485 ;	acc24	uint24_t 
                                   1486 ;   A		uint8_t
                                   1487 ; output:
                                   1488 ;   acc24   A*acc24
                                   1489 ;-------------------------------------
                                   1490 ; local variables offset  on sp
                           000003  1491 	U8   = 3   ; A pushed on stack
                           000002  1492 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1493 	OVFH = 1  ; multiplication overflow high byte
                           000003  1494 	VSIZE = 3
      00091B                       1495 mulu24_8:
      008933 89               [ 2] 1496 	pushw x    ; save X
                                   1497 	; local variables
      008934 73               [ 1] 1498 	push a     ; U8
      008935 1E               [ 1] 1499 	clrw x     ; initialize overflow to 0
      008936 03               [ 2] 1500 	pushw x    ; multiplication overflow
                                   1501 ; multiply low byte.
      008937 AB 30 A1         [ 1] 1502 	ld a,acc24+2
      00893A 3A               [ 1] 1503 	ld xl,a
      00893B 2B 02            [ 1] 1504 	ld a,(U8,sp)
      00893D AB               [ 4] 1505 	mul x,a
      00893E 07               [ 1] 1506 	ld a,xl
      00893F C7 00 0D         [ 1] 1507 	ld acc24+2,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00893F 5A               [ 1] 1508 	ld a, xh
      008940 F7 0C            [ 1] 1509 	ld (OVFL,sp),a
                                   1510 ; multipy middle byte
      008942 02 C6 00         [ 1] 1511 	ld a,acc24+1
      008945 0C               [ 1] 1512 	ld xl,a
      008946 CA 00            [ 1] 1513 	ld a, (U8,sp)
      008948 0D               [ 4] 1514 	mul x,a
                                   1515 ; add overflow to this partial product
      008949 CA 00 0E         [ 2] 1516 	addw x,(OVFH,sp)
      00894C 26               [ 1] 1517 	ld a,xl
      00894D DF C6 00         [ 1] 1518 	ld acc24+1,a
      008950 0B               [ 1] 1519 	clr a
      008951 A1 10            [ 1] 1520 	adc a,#0
      008953 27 08            [ 1] 1521 	ld (OVFH,sp),a
      008955 7B               [ 1] 1522 	ld a,xh
      008956 01 27            [ 1] 1523 	ld (OVFL,sp),a
                                   1524 ; multiply most signficant byte	
      008958 15 A6 2D         [ 1] 1525 	ld a, acc24
      00895B 20               [ 1] 1526 	ld xl, a
      00895C 0D 7B            [ 1] 1527 	ld a, (U8,sp)
      00895E 02               [ 4] 1528 	mul x,a
      00895F A1 05 2B         [ 2] 1529 	addw x, (OVFH,sp)
      008962 05               [ 1] 1530 	ld a, xl
      008963 5C 0A 02         [ 1] 1531 	ld acc24,a
      008966 20 F5            [ 2] 1532     addw sp,#VSIZE
      008968 85               [ 2] 1533 	popw x
      008968 A6               [ 4] 1534 	ret
                                   1535 
                                   1536 ;------------------------------------
                                   1537 ;  two's complement acc24
                                   1538 ;  input:
                                   1539 ;		acc24 variable
                                   1540 ;  output:
                                   1541 ;		acc24 variable
                                   1542 ;-------------------------------------
      000955                       1543 neg_acc24:
      008969 24 5A F7 0C      [ 1] 1544 	cpl acc24+2
      00896D 02 53 00 0C      [ 1] 1545 	cpl acc24+1
      00896E 72 53 00 0B      [ 1] 1546 	cpl acc24
      00896E 7B 02            [ 1] 1547 	ld a,#1
      008970 5B 04 81         [ 1] 1548 	add a,acc24+2
      008973 C7 00 0D         [ 1] 1549 	ld acc24+2,a
      008973 89               [ 1] 1550 	clr a
      008974 88 C6 00         [ 1] 1551 	adc a,acc24+1
      008977 0C 95 C6         [ 1] 1552 	ld acc24+1,a 
      00897A 00               [ 1] 1553 	clr a 
      00897B 0D 97 7B         [ 1] 1554 	adc a,acc24 
      00897E 01 62 88         [ 1] 1555 	ld acc24,a 
      008981 9E               [ 4] 1556 	ret
                                   1557 
                                   1558 
                                   1559 
                                   1560 
                                   1561 ;------------------------------------
                                   1562 ; convert alpha to uppercase
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1563 ; input:
                                   1564 ;    a  character to convert
                                   1565 ; output:
                                   1566 ;    a  uppercase character
                                   1567 ;------------------------------------
      000978                       1568 to_upper::
      008982 C7 00            [ 1] 1569 	cp a,#'a
      008984 0C 9F            [ 1] 1570 	jrpl 1$
      008986 C7               [ 4] 1571 0$:	ret
      008987 00 0D            [ 1] 1572 1$: cp a,#'z	
      008989 84 95            [ 1] 1573 	jrugt 0$
      00898B C6 00            [ 1] 1574 	sub a,#32
      00898D 0E               [ 4] 1575 	ret
                                   1576 	
                                   1577 ;------------------------------------
                                   1578 ; convert pad content in integer
                                   1579 ; input:
                                   1580 ;    x		.asciz to convert
                                   1581 ; output:
                                   1582 ;    acc24      int24_t
                                   1583 ;------------------------------------
                                   1584 	; local variables
                           000001  1585 	SIGN=1 ; 1 byte, 
                           000002  1586 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  1587 	TEMP=3 ; 1 byte, temporary storage
                           000003  1588 	VSIZE=3 ; 3 bytes reserved for local storage
      000984                       1589 atoi24::
      00898E 97               [ 2] 1590 	pushw x 
      000985                       1591 	_vars VSIZE
      00898F 7B 01            [ 2]    1     sub sp,#VSIZE 
                                   1592 	; acc24=0 
      008991 62 6B 01 9F      [ 1] 1593 	clr acc24    
      008995 C7 00 0E 84      [ 1] 1594 	clr acc16
      008999 85 81 00 0D      [ 1] 1595 	clr acc8 
      00899B 0F 01            [ 1] 1596 	clr (SIGN,sp)
      00899B 89 88            [ 1] 1597 	ld a,#10
      00899D 5F 89            [ 1] 1598 	ld (BASE,sp),a ; default base decimal
      00899F C6               [ 1] 1599 	ld a,(x)
      0089A0 00 0E            [ 1] 1600 	jreq 9$  ; completed if 0
      0089A2 97 7B            [ 1] 1601 	cp a,#'-
      0089A4 03 42            [ 1] 1602 	jrne 1$
      0089A6 9F C7            [ 1] 1603 	cpl (SIGN,sp)
      0089A8 00 0E            [ 2] 1604 	jra 2$
      0089AA 9E 6B            [ 1] 1605 1$: cp a,#'$
      0089AC 02 C6            [ 1] 1606 	jrne 3$
      0089AE 00 0D            [ 1] 1607 	ld a,#16
      0089B0 97 7B            [ 1] 1608 	ld (BASE,sp),a
      0089B2 03               [ 1] 1609 2$:	incw x
      0089B3 42               [ 1] 1610 	ld a,(x)
      0009AE                       1611 3$:	
      0089B4 72 FB            [ 1] 1612 	cp a,#'a
      0089B6 01 9F            [ 1] 1613 	jrmi 4$
      0089B8 C7 00            [ 1] 1614 	sub a,#32
      0089BA 0D 4F            [ 1] 1615 4$:	cp a,#'0
      0089BC A9 00            [ 1] 1616 	jrmi 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0089BE 6B 01            [ 1] 1617 	sub a,#'0
      0089C0 9E 6B            [ 1] 1618 	cp a,#10
      0089C2 02 C6            [ 1] 1619 	jrmi 5$
      0089C4 00 0C            [ 1] 1620 	sub a,#7
      0089C6 97 7B            [ 1] 1621 	cp a,(BASE,sp)
      0089C8 03 42            [ 1] 1622 	jrpl 9$
      0089CA 72 FB            [ 1] 1623 5$:	ld (TEMP,sp),a
      0089CC 01 9F            [ 1] 1624 	ld a,(BASE,sp)
      0089CE C7 00 0C         [ 4] 1625 	call mulu24_8
      0089D1 5B 03            [ 1] 1626 	ld a,(TEMP,sp)
      0089D3 85 81 0D         [ 1] 1627 	add a,acc24+2
      0089D5 C7 00 0D         [ 1] 1628 	ld acc24+2,a
      0089D5 72               [ 1] 1629 	clr a
      0089D6 53 00 0E         [ 1] 1630 	adc a,acc24+1
      0089D9 72 53 00         [ 1] 1631 	ld acc24+1,a
      0089DC 0D               [ 1] 1632 	clr a
      0089DD 72 53 00         [ 1] 1633 	adc a,acc24
      0089E0 0C A6 01         [ 1] 1634 	ld acc24,a
      0089E3 CB 00            [ 2] 1635 	jra 2$
      0089E5 0E C7            [ 1] 1636 9$:	tnz (SIGN,sp)
      0089E7 00 0E            [ 1] 1637     jreq atoi_exit
      0089E9 4F C9 00         [ 4] 1638     call neg_acc24
      0009EA                       1639 atoi_exit: 
      0009EA                       1640 	_drop VSIZE
      0089EC 0D C7            [ 2]    1     addw sp,#VSIZE 
      0089EE 00               [ 2] 1641 	popw x ; restore x
      0089EF 0D               [ 4] 1642 	ret
                                   1643 
                                   1644 
                                   1645 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1646 ;;   TINY BASIC  operators,
                                   1647 ;;   commands and functions 
                                   1648 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1649 
                                   1650 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1651 ;;  Arithmetic operators
                                   1652 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1653 
                                   1654 ;debug support
                           000001  1655 DEBUG_PRT=1
                           000001  1656 .if DEBUG_PRT 
                           000001  1657 	REGA=1
                           000002  1658 	SAVEB=2
                           000003  1659 	REGX=3
                           000005  1660 	REGY=5
                           000007  1661 	ACC24=7
                           000009  1662 	VSIZE=9 
      0009EE                       1663 printxy:
      0009EE                       1664 	_vars VSIZE 
      0089F0 4F C9            [ 2]    1     sub sp,#VSIZE 
      0089F2 00 0C            [ 1] 1665 	ld (REGA,sp),a 
      0089F4 C7 00 0C         [ 1] 1666 	ld a,base 
      0089F7 81 02            [ 1] 1667 	ld (SAVEB,sp),a
      0089F8 1F 03            [ 2] 1668 	ldw (REGX,sp),x
      0089F8 A1 61            [ 2] 1669 	ldw (REGY,sp),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0089FA 2A 01 81         [ 2] 1670 	ldw x,acc24 
      0089FD A1 7A 22         [ 1] 1671 	ld a,acc8 
      008A00 FB A0            [ 2] 1672 	ldw (ACC24,sp),x 
      008A02 20 81            [ 1] 1673 	ld (ACC24+2,sp),a 
      008A04 35 10 00 0A      [ 1] 1674 	mov base,#16 
      008A04 89               [ 1] 1675 	clrw x 
      008A05 52 03            [ 1] 1676 	ld a,(REGA,sp)
      008A07 72               [ 1] 1677 	ld xl,a 
      008A08 5F 00 0C         [ 4] 1678 	call print_int
      008A0B 72 5F            [ 1] 1679 	ld a,#SPACE 
      008A0D 00 0D 72         [ 4] 1680 	call putc  
      008A10 5F 00            [ 2] 1681 	ldw x,(REGX,sp)
      008A12 0E 0F 01         [ 4] 1682 	call print_int 
      008A15 A6 0A            [ 1] 1683 	ld a,#SPACE 
      008A17 6B 02 F6         [ 4] 1684 	call putc  
      008A1A 27 47            [ 2] 1685 	ldw x,(REGY,sp)
      008A1C A1 2D 26         [ 4] 1686 	call print_int 
      008A1F 04 03            [ 1] 1687 	ld a,#CR 
      008A21 01 20 08         [ 4] 1688 	call putc 
      008A24 A1 24            [ 1] 1689 	ld a,(ACC24+2,sp)
      008A26 26 06            [ 2] 1690 	ldw x,(ACC24,sp)
      008A28 A6 10 6B         [ 2] 1691 	ldw acc24,x 
      008A2B 02 5C F6         [ 1] 1692 	ld acc8,a
      008A2E 7B 02            [ 1] 1693 	ld a,(SAVEB,sp)
      008A2E A1 61 2B         [ 1] 1694 	ld base,a 
      008A31 02 A0            [ 1] 1695 	ld a,(REGA,sp)
      008A33 20 A1            [ 2] 1696 	ldw x,(REGX,sp)
      008A35 30 2B            [ 2] 1697 	ldw y,(REGY,sp)
      000A3E                       1698 	_drop VSIZE 
      008A37 2B A0            [ 2]    1     addw sp,#VSIZE 
      008A39 30               [ 4] 1699 	ret 
                                   1700 .endif 
                                   1701 
                                   1702 
                                   1703 ;--------------------------------------
                                   1704 ;  multiply 2 uint16_t return uint32_t
                                   1705 ;  input:
                                   1706 ;     x       uint16_t 
                                   1707 ;     y       uint16_t 
                                   1708 ;  output:
                                   1709 ;     x       product bits 15..0
                                   1710 ;     y       product bits 31..16 
                                   1711 ;---------------------------------------
                           000001  1712 		U1=1  ; uint16_t 
                           000003  1713 		DBL=3 ; uint32_t
                           000006  1714 		VSIZE=6
      000A41                       1715 umstar:
      000A41                       1716 	_vars VSIZE 
      008A3A A1 0A            [ 2]    1     sub sp,#VSIZE 
      008A3C 2B 06            [ 2] 1717 	ldw (U1,sp),x 
                                   1718 ;initialize bits 31..16 of 
                                   1719 ;product to zero 
      008A3E A0 07            [ 1] 1720 	clr (DBL,sp)
      008A40 11 02            [ 1] 1721 	clr (DBL+1,sp)
                                   1722 ; produc U1L*U2L 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008A42 2A 1F            [ 1] 1723 	ld a,yl 
      008A44 6B               [ 4] 1724 	mul x,a 
      008A45 03 7B            [ 2] 1725 	ldw (DBL+2,sp),x
                                   1726 ; product U1H*U2L 
      008A47 02 CD            [ 1] 1727 	ld a,(U1,sp) ; xh 
      008A49 89               [ 1] 1728 	ldw x,y
      008A4A 9B               [ 4] 1729 	mul x,a 
      008A4B 7B               [ 1] 1730 	clr a 
      008A4C 03 CB 00         [ 2] 1731 	addw x,(DBL+1,sp) 
      008A4F 0E               [ 1] 1732 	clr a 
      008A50 C7 00            [ 1] 1733 	adc a,(DBL,sp) 
      008A52 0E 4F            [ 1] 1734 	ld (DBL,sp),a ; bits 23..17 
      008A54 C9 00            [ 2] 1735 	ldw (DBL+1,sp),x ; bits 15..0 
                                   1736 ; product U1L*U2H
      008A56 0D C7            [ 1] 1737 	swapw y 
      008A58 00               [ 1] 1738 	ldw x,y
      008A59 0D 4F            [ 1] 1739 	ld a,(U1+1,sp)
      008A5B C9               [ 4] 1740 	mul x,a
      008A5C 00 0C C7         [ 2] 1741 	addw x,(DBL+1,sp)
      008A5F 00               [ 1] 1742 	clr a 
      008A60 0C 20            [ 1] 1743 	adc a,(DBL,sp)
      008A62 C9 0D            [ 1] 1744 	ld (DBL,sp),a 
      008A64 01 27            [ 2] 1745 	ldw (DBL+1,sp),x 
                                   1746 ; product U1H*U2H 	
      008A66 03 CD            [ 1] 1747 	ld a,(U1,sp)
      008A68 89               [ 1] 1748 	ldw x,y  
      008A69 D5               [ 4] 1749 	mul x,a 
      008A6A 72 FB 03         [ 2] 1750 	addw x,(DBL,sp)
      008A6A 5B 03            [ 1] 1751 	ldw y,x 
      008A6C 85 81            [ 2] 1752 	ldw x,(DBL+2,sp)
      008A6E                       1753 	_drop VSIZE 
      008A6E 52 09            [ 2]    1     addw sp,#VSIZE 
      008A70 6B               [ 4] 1754 	ret
                                   1755 
                                   1756 
                                   1757 ;-------------------------------------
                                   1758 ; multiply 2 integers
                                   1759 ; input:
                                   1760 ;  	x       n1 
                                   1761 ;   y 		n2 
                                   1762 ; output:
                                   1763 ;	X        N1*N2 bits 15..0
                                   1764 ;   Y        N1*N2 bits 31..16 
                                   1765 ;-------------------------------------
                           000001  1766 	SIGN=1
                           000001  1767 	VSIZE=1
      000A7B                       1768 multiply:
      000A7B                       1769 	_vars VSIZE 
      008A71 01 C6            [ 2]    1     sub sp,#VSIZE 
      008A73 00 0B            [ 1] 1770 	clr (SIGN,sp)
      008A75 6B               [ 1] 1771 	ld a,xh 
      008A76 02 1F            [ 1] 1772 	and a,#0x80
      008A78 03 17            [ 1] 1773 	jrpl 1$
      008A7A 05 CE            [ 1] 1774 	cpl (SIGN,sp)
      008A7C 00               [ 2] 1775 	negw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      000A87                       1776 1$:	
      008A7D 0C C6            [ 1] 1777 	ld a,yh
      008A7F 00 0E            [ 1] 1778 	and a,#0x80  
      008A81 1F 07            [ 1] 1779 	jrpl 2$ 
      008A83 6B 09            [ 1] 1780 	cpl (SIGN,sp)
      008A85 35 10            [ 2] 1781 	negw y 
      000A91                       1782 2$:	
      008A87 00 0B 5F         [ 4] 1783 	call umstar
      008A8A 7B 01            [ 1] 1784 	ld a,(SIGN,sp)
      008A8C 97 CD            [ 1] 1785 	jreq 3$
      008A8E 88 ED A6         [ 4] 1786 	call dneg 
      000A9B                       1787 3$:	
      000A9B                       1788 	_drop VSIZE 
      008A91 20 CD            [ 2]    1     addw sp,#VSIZE 
      008A93 83               [ 4] 1789 	ret
                                   1790 
                                   1791 ;--------------------------------------
                                   1792 ; divide uint32_t/uint16_t
                                   1793 ; return:  quotient and remainder 
                                   1794 ; quotient expected to be uint16_t 
                                   1795 ; input:
                                   1796 ;   DBLDIVDND    on stack 
                                   1797 ;   X            divisor 
                                   1798 ; output:
                                   1799 ;   X            quotient 
                                   1800 ;   Y            remainder 
                                   1801 ;---------------------------------------
                           000003  1802 	VSIZE=3
      000A9E                       1803 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000A9E                       1804 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   1805 	; local variables 
                           000001  1806 	DIVISOR=1 
                           000003  1807 	CNTR=3 
      000A9E                       1808 udiv32_16:
      000A9E                       1809 	_vars VSIZE 
      008A94 42 1E            [ 2]    1     sub sp,#VSIZE 
      008A96 03 CD            [ 2] 1810 	ldw (DIVISOR,sp),x	; save divisor 
      008A98 88 ED            [ 2] 1811 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008A9A A6 20            [ 2] 1812 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008A9C CD 83            [ 2] 1813 	tnzw y
      008A9E 42 1E            [ 1] 1814 	jrne long_division 
      008AA0 05 CD            [ 2] 1815 	ldw y,(DIVISOR,sp)
      008AA2 88               [ 2] 1816 	divw x,y
      000AAD                       1817 	_drop VSIZE 
      008AA3 ED A6            [ 2]    1     addw sp,#VSIZE 
      008AA5 0D               [ 4] 1818 	ret
      000AB0                       1819 long_division:
      008AA6 CD               [ 1] 1820 	exgw x,y ; hi in x, lo in y 
      008AA7 83 42            [ 1] 1821 	ld a,#17 
      008AA9 7B 09            [ 1] 1822 	ld (CNTR,sp),a
      000AB5                       1823 1$:
      008AAB 1E 07            [ 2] 1824 	cpw x,(DIVISOR,sp)
      008AAD CF 00            [ 1] 1825 	jrmi 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008AAF 0C C7 00         [ 2] 1826 	subw x,(DIVISOR,sp)
      008AB2 0E               [ 1] 1827 2$:	ccf 
      008AB3 7B 02            [ 2] 1828 	rlcw y 
      008AB5 C7               [ 2] 1829 	rlcw x 
      008AB6 00 0B            [ 1] 1830 	dec (CNTR,sp)
      008AB8 7B 01            [ 1] 1831 	jrne 1$
      008ABA 1E               [ 1] 1832 	exgw x,y 
      000AC5                       1833 	_drop VSIZE 
      008ABB 03 16            [ 2]    1     addw sp,#VSIZE 
      008ABD 05               [ 4] 1834 	ret
                                   1835 
                                   1836 ;-----------------------------
                                   1837 ; negate double int.
                                   1838 ; input:
                                   1839 ;   x     bits 15..0
                                   1840 ;   y     bits 31..16
                                   1841 ; output: 
                                   1842 ;   x     bits 15..0
                                   1843 ;   y     bits 31..16
                                   1844 ;-----------------------------
      000AC8                       1845 dneg:
      008ABE 5B               [ 2] 1846 	cplw x 
      008ABF 09 81            [ 2] 1847 	cplw y 
      008AC1 1C 00 01         [ 2] 1848 	addw x,#1 
      008AC1 52 06            [ 1] 1849 	jrnc 1$
      008AC3 1F 01            [ 1] 1850 	incw y 
      008AC5 0F               [ 4] 1851 1$: ret 
                                   1852 
                                   1853 
                                   1854 ;--------------------------------
                                   1855 ; sign extend single to double
                                   1856 ; input:
                                   1857 ;   x    int16_t
                                   1858 ; output:
                                   1859 ;   x    int32_t bits 15..0
                                   1860 ;   y    int32_t bits 31..16
                                   1861 ;--------------------------------
      000AD3                       1862 dbl_sign_extend:
      008AC6 03 0F            [ 1] 1863 	clrw y
      008AC8 04               [ 1] 1864 	ld a,xh 
      008AC9 90 9F            [ 1] 1865 	and a,#0x80 
      008ACB 42 1F            [ 1] 1866 	jreq 1$
      008ACD 05 7B            [ 2] 1867 	cplw y
      008ACF 01               [ 4] 1868 1$: ret 	
                                   1869 
                                   1870 
                                   1871 ;----------------------------------
                                   1872 ;  euclidian divide dbl/n1 
                                   1873 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   1874 ; input:
                                   1875 ;    dbl    int32_t on stack 
                                   1876 ;    x 		n1   int16_t  disivor  
                                   1877 ; output:
                                   1878 ;    X      dbl/x  int16_t 
                                   1879 ;    Y      remainder int16_t 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1880 ;----------------------------------
                           000008  1881 	VSIZE=8
      000ADD                       1882 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000ADD                       1883 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000ADD                       1884 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   1885 	; local variables
                           000001  1886 	DBLHI=1
                           000003  1887 	DBLLO=3 
                           000005  1888 	SDIVSR=5 ; sign divisor
                           000006  1889 	SQUOT=6 ; sign dividend 
                           000007  1890 	DIVISR=7 ; divisor 
      000ADD                       1891 div32_16:
      000ADD                       1892 	_vars VSIZE 
      008AD0 93 42            [ 2]    1     sub sp,#VSIZE 
      008AD2 4F 72            [ 1] 1893 	clr (SDIVSR,sp)
      008AD4 FB 04            [ 1] 1894 	clr (SQUOT,sp)
                                   1895 ; copy arguments 
      008AD6 4F 19            [ 2] 1896 	ldw y,(DIVDNDHI,sp)
      008AD8 03 6B            [ 2] 1897 	ldw (DBLHI,sp),y
      008ADA 03 1F            [ 2] 1898 	ldw y,(DIVDNDLO,sp)
      008ADC 04 90            [ 2] 1899 	ldw (DBLLO,sp),y 
                                   1900 ; check for 0 divisor
      008ADE 5E               [ 2] 1901 	tnzw x 
      008ADF 93 7B            [ 1] 1902     jrne 0$
      008AE1 02 42            [ 1] 1903 	ld a,#ERR_DIV0 
      008AE3 72 FB 04         [ 2] 1904 	jp tb_error 
                                   1905 ; check divisor sign 	
      008AE6 4F               [ 1] 1906 0$:	ld a,xh 
      008AE7 19 03            [ 1] 1907 	and a,#0x80 
      008AE9 6B 03            [ 1] 1908 	jreq 1$
      008AEB 1F 04            [ 1] 1909 	cpl (SDIVSR,sp)
      008AED 7B 01            [ 1] 1910 	cpl (SQUOT,sp)
      008AEF 93               [ 2] 1911 	negw x
      008AF0 42 72            [ 2] 1912 1$:	ldw (DIVISR,sp),x
                                   1913 ; check dividend sign 	 
      008AF2 FB 03            [ 1] 1914  	ld a,(DBLHI,sp) 
      008AF4 90 93            [ 1] 1915 	and a,#0x80 
      008AF6 1E 05            [ 1] 1916 	jreq 2$ 
      008AF8 5B 06            [ 1] 1917 	cpl (SQUOT,sp)
      008AFA 81 03            [ 2] 1918 	ldw x,(DBLLO,sp)
      008AFB 16 01            [ 2] 1919 	ldw y,(DBLHI,sp)
      008AFB 52 01 0F         [ 4] 1920 	call dneg 
      008AFE 01 9E            [ 2] 1921 	ldw (DBLLO,sp),x 
      008B00 A4 80            [ 2] 1922 	ldw (DBLHI,sp),y 
      008B02 2A 03            [ 2] 1923 2$:	ldw x,(DIVISR,sp)
      008B04 03 01 50         [ 4] 1924 	call udiv32_16
      008B07 90 5D            [ 2] 1925 	tnzw y 
      008B07 90 9E            [ 1] 1926 	jreq 3$ 
                                   1927 ; x=quotient 
                                   1928 ; y=remainder 
                                   1929 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008B09 A4 80            [ 1] 1930 	ld a,(SQUOT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008B0B 2A 04            [ 1] 1931 	xor a,(SDIVSR,sp)
      008B0D 03 01            [ 1] 1932 	jreq 3$
      008B0F 90               [ 1] 1933 	incw x 
      008B10 50 CF 00 0C      [ 2] 1934 	ldw acc16,y 
      008B11 16 07            [ 2] 1935 	ldw y,(DIVISR,sp)
      008B11 CD 8A C1 7B      [ 2] 1936 	subw y,acc16
                                   1937 ; sign quotient
      008B15 01 27            [ 1] 1938 3$:	ld a,(SQUOT,sp)
      008B17 03 CD            [ 1] 1939 	jreq 4$
      008B19 8B               [ 2] 1940 	negw x 
      000B31                       1941 4$:	
      000B31                       1942 	_drop VSIZE 
      008B1A 48 08            [ 2]    1     addw sp,#VSIZE 
      008B1B 81               [ 4] 1943 	ret 
                                   1944 
                                   1945 
                                   1946 
                                   1947 ;----------------------------------
                                   1948 ; division x/y 
                                   1949 ; input:
                                   1950 ;    X       dividend
                                   1951 ;    Y       divisor 
                                   1952 ; output:
                                   1953 ;    X       quotient
                                   1954 ;    Y       remainder 
                                   1955 ;-----------------------------------
                           000004  1956 	VSIZE=4 
                                   1957 	; local variables 
                           000001  1958 	DBLHI=1
                           000003  1959 	DBLLO=3
      000B34                       1960 divide: 
      000B34                       1961 	_vars VSIZE 
      008B1B 5B 01            [ 2]    1     sub sp,#VSIZE 
      008B1D 81 CF 00 0C      [ 2] 1962 	ldw acc16,y
      008B1E CD 0A D3         [ 4] 1963 	call dbl_sign_extend
      008B1E 52 03            [ 2] 1964 	ldw (DBLLO,sp),x 
      008B20 1F 01            [ 2] 1965 	ldw (DBLHI,sp),y 
      008B22 1E 08 16         [ 2] 1966 	ldw x,acc16 
      008B25 06 90 5D         [ 4] 1967 	call div32_16 
      000B47                       1968 	_drop VSIZE 
      008B28 26 06            [ 2]    1     addw sp,#VSIZE 
      008B2A 16               [ 4] 1969 	ret
                                   1970 
                                   1971 
                                   1972 ;----------------------------------
                                   1973 ;  remainder resulting from euclidian 
                                   1974 ;  division of x/y 
                                   1975 ; input:
                                   1976 ;   x   	dividend int16_t 
                                   1977 ;   y 		divisor int16_t
                                   1978 ; output:
                                   1979 ;   X       n1%n2 
                                   1980 ;----------------------------------
      000B4A                       1981 modulo:
      008B2B 01 65 5B         [ 4] 1982 	call divide
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008B2E 03               [ 1] 1983 	ldw x,y 
      008B2F 81               [ 4] 1984 	ret 
                                   1985 
                                   1986 ;----------------------------------
                                   1987 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   1988 ; return expr1*expr2/expr3 
                                   1989 ; product result is int32_t and 
                                   1990 ; divisiont is int32_t/int16_t
                                   1991 ;----------------------------------
                           000004  1992 	DBL_SIZE=4 
      008B30                       1993 muldiv:
      008B30 51 A6 11         [ 4] 1994 	call func_args 
      008B33 6B 03            [ 1] 1995 	cp a,#3 
      008B35 27 03            [ 1] 1996 	jreq 1$
      008B35 13 01 2B         [ 2] 1997 	jp syntax_error
      000B59                       1998 1$: 
      008B38 03 72            [ 2] 1999 	ldw x,(5,sp) ; expr1
      008B3A F0 01            [ 2] 2000 	ldw y,(3,sp) ; expr2
      008B3C 8C 90 59         [ 4] 2001 	call multiply 
      008B3F 59 0A            [ 2] 2002 	ldw (5,sp),x  ;int32_t 15..0
      008B41 03 26            [ 2] 2003 	ldw (3,sp),y  ;int32_t 31..16
      008B43 F1               [ 2] 2004 	popw x        ; expr3 
      008B44 51 5B 03         [ 4] 2005 	call div32_16 ; int32_t/expr3 
      000B68                       2006 	_drop DBL_SIZE
      008B47 81 04            [ 2]    1     addw sp,#DBL_SIZE 
      008B48 81               [ 4] 2007 	ret 
                                   2008 
                                   2009 
                                   2010 ;---------------------------------
                                   2011 ; dictionary search 
                                   2012 ; input:
                                   2013 ;	X 		dictionary entry point, name field  
                                   2014 ;   y		.asciz name to search 
                                   2015 ; output:
                                   2016 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2017 ;  X		cmd_index
                                   2018 ;---------------------------------
                           000001  2019 	NLEN=1 ; cmd length 
                           000002  2020 	XSAVE=2
                           000004  2021 	YSAVE=4
                           000005  2022 	VSIZE=5 
      000B6B                       2023 search_dict::
      000B6B                       2024 	_vars VSIZE 
      008B48 53 90            [ 2]    1     sub sp,#VSIZE 
                                   2025 
      008B4A 53 1C            [ 2] 2026 	ldw (YSAVE,sp),y 
      000B6F                       2027 search_next:
      008B4C 00 01            [ 2] 2028 	ldw (XSAVE,sp),x 
                                   2029 ; get name length in dictionary	
      008B4E 24               [ 1] 2030 	ld a,(x)
      008B4F 02 90            [ 1] 2031 	and a,#0xf 
      008B51 5C 81            [ 1] 2032 	ld (NLEN,sp),a  
      008B53 16 04            [ 2] 2033 	ldw y,(YSAVE,sp) ; name pointer 
      008B53 90               [ 1] 2034 	incw x 
      000B79                       2035 cp_loop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008B54 5F 9E            [ 1] 2036 	ld a,(y)
      008B56 A4 80            [ 1] 2037 	jreq str_match 
      008B58 27 02            [ 1] 2038 	tnz (NLEN,sp)
      008B5A 90 53            [ 1] 2039 	jreq no_match  
      008B5C 81               [ 1] 2040 	cp a,(x)
      008B5D 26 07            [ 1] 2041 	jrne no_match 
      008B5D 52 08            [ 1] 2042 	incw y 
      008B5F 0F               [ 1] 2043 	incw x
      008B60 05 0F            [ 1] 2044 	dec (NLEN,sp)
      008B62 06 16            [ 2] 2045 	jra cp_loop 
      000B8B                       2046 no_match:
      008B64 0B 17            [ 2] 2047 	ldw x,(XSAVE,sp) 
      008B66 01 16 0D         [ 2] 2048 	subw x,#2 ; move X to link field
      008B69 17 03            [ 1] 2049 	push #TK_NONE 
      008B6B 5D               [ 2] 2050 	ldw x,(x) ; next word link 
      008B6C 26               [ 1] 2051 	pop a ; TK_NONE 
      008B6D 05 A6            [ 1] 2052 	jreq search_exit  ; not found  
                                   2053 ;try next 
      008B6F 04 CC            [ 2] 2054 	jra search_next
      000B98                       2055 str_match:
      008B71 87 A2            [ 2] 2056 	ldw x,(XSAVE,sp)
      008B73 9E               [ 1] 2057 	ld a,(X)
      008B74 A4 80            [ 1] 2058 	ld (NLEN,sp),a ; needed to test keyword type  
      008B76 27 05            [ 1] 2059 	and a,#0xf 
                                   2060 ; move x to procedure address field 	
      008B78 03               [ 1] 2061 	inc a 
      008B79 05 03 06         [ 1] 2062 	ld acc8,a 
      008B7C 50 1F 07 7B      [ 1] 2063 	clr acc16 
      008B80 01 A4 80 27      [ 2] 2064 	addw x,acc16 
      008B84 0D               [ 2] 2065 	ldw x,(x) ; routine index  
                                   2066 ;determine keyword type bits 7:6 
      008B85 03 06            [ 1] 2067 	ld a,(NLEN,sp)
      008B87 1E               [ 1] 2068 	swap a 
      008B88 03 16            [ 1] 2069 	and a,#0xc
      008B8A 01               [ 1] 2070 	srl a
      008B8B CD               [ 1] 2071 	srl a 
      008B8C 8B 48            [ 1] 2072 	add a,#128
      000BB5                       2073 search_exit: 
      000BB5                       2074 	_drop VSIZE 	 
      008B8E 1F 03            [ 2]    1     addw sp,#VSIZE 
      008B90 17               [ 4] 2075 	ret 
                                   2076 
                                   2077 ;---------------------
                                   2078 ; check if next token
                                   2079 ;  is of expected type 
                                   2080 ; input:
                                   2081 ;   A 		 expected token attribute
                                   2082 ;  ouput:
                                   2083 ;   none     if fail call syntax_error 
                                   2084 ;--------------------
      000BB8                       2085 expect:
      008B91 01               [ 1] 2086 	push a 
      008B92 1E 07 CD         [ 4] 2087 	call next_token 
      008B95 8B 1E            [ 1] 2088 	cp a,(1,sp)
      008B97 90 5D            [ 1] 2089 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B99 27 11 7B         [ 2] 2090 	jp syntax_error
      008B9C 06               [ 1] 2091 1$: pop a 
      008B9D 18               [ 4] 2092 	ret 
                                   2093 
                                   2094 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2095 ; parse arguments list 
                                   2096 ; between ()
                                   2097 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BC5                       2098 func_args:
      008B9E 05 27            [ 1] 2099 	ld a,#TK_LPAREN 
      008BA0 0B 5C 90         [ 4] 2100 	call expect 
                                   2101 ; expected to continue in arg_list 
                                   2102 ; caller must check for TK_RPAREN 
                                   2103 
                                   2104 ;-------------------------------
                                   2105 ; parse embedded BASIC routines 
                                   2106 ; arguments list.
                                   2107 ; arg_list::=  rel[','rel]*
                                   2108 ; all arguments are of integer type
                                   2109 ; and pushed on stack 
                                   2110 ; input:
                                   2111 ;   none
                                   2112 ; output:
                                   2113 ;   stack{n}   arguments pushed on stack
                                   2114 ;   A 	number of arguments pushed on stack  
                                   2115 ;--------------------------------
      000BCA                       2116 arg_list:
      008BA3 CF 00            [ 1] 2117 	push #0  
      008BA5 0D 16 07         [ 4] 2118 1$: call relation
      008BA8 72 B2            [ 1] 2119 	cp a,#TK_NONE 
      008BAA 00 0D            [ 1] 2120 	jreq 5$
      008BAC 7B 06            [ 1] 2121 	cp a,#TK_INTGR
      008BAE 27 01            [ 1] 2122 	jrne 4$
      000BD7                       2123 3$: 
                                   2124 ; swap return address with argument
      008BB0 50               [ 1] 2125 	pop a ; arg_count
      008BB1 90 85            [ 2] 2126 	popw y ; return address 
      008BB1 5B               [ 2] 2127 	pushw x ; new argument 
      008BB2 08 81            [ 2] 2128 	pushw y 
      008BB4 4C               [ 1] 2129     inc a
      008BB4 52               [ 1] 2130 	push a 
      008BB5 04 90 CF         [ 4] 2131 	call next_token 
      008BB8 00 0D            [ 1] 2132 	cp a,#TK_COMMA 
      008BBA CD 8B            [ 1] 2133 	jreq 1$ 
      008BBC 53 1F            [ 1] 2134 	cp a,#TK_NONE 
      008BBE 03 17            [ 1] 2135 	jreq 5$ 
      008BC0 01 CE            [ 1] 2136 4$:	cp a,#TK_RPAREN 
      008BC2 00 0D            [ 1] 2137 	jreq 5$
      000BEE                       2138 	_unget_token 
      008BC4 CD 8B 5D 5B 04   [ 1]    1      mov in,in.saved  
      008BC9 81               [ 1] 2139 5$:	pop a  
      008BCA 81               [ 4] 2140 	ret 
                                   2141 
                                   2142 ;--------------------------------
                                   2143 ;   BASIC commnands 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2144 ;--------------------------------
                                   2145 
                                   2146 ;--------------------------------
                                   2147 ;  arithmetic and relational 
                                   2148 ;  routines
                                   2149 ;  operators precedence
                                   2150 ;  highest to lowest
                                   2151 ;  operators on same row have 
                                   2152 ;  same precedence and are executed
                                   2153 ;  from left to right.
                                   2154 ;	'*','/','%'
                                   2155 ;   '-','+'
                                   2156 ;   '=','>','<','>=','<=','<>','><'
                                   2157 ;   '<>' and '><' are equivalent for not equal.
                                   2158 ;--------------------------------
                                   2159 
                                   2160 ;---------------------
                                   2161 ; return array element
                                   2162 ; address from @(expr)
                                   2163 ; input:
                                   2164 ;   A 		TK_ARRAY
                                   2165 ; output:
                                   2166 ;   A 		TK_INTGR
                                   2167 ;	X 		element address 
                                   2168 ;----------------------
      000BF5                       2169 get_array_element:
      008BCA CD 8B B4         [ 4] 2170 	call func_args 
      008BCD 93 81            [ 1] 2171 	cp a,#1
      008BCF 27 03            [ 1] 2172 	jreq 1$
      008BCF CD 8C 45         [ 2] 2173 	jp syntax_error
      008BD2 A1               [ 2] 2174 1$: popw x 
                                   2175 	; check for bounds 
      008BD3 03 27 03         [ 2] 2176 	cpw x,array_size 
      008BD6 CC 87            [ 2] 2177 	jrule 3$
                                   2178 ; bounds {1..array_size}	
      008BD8 A0 0A            [ 1] 2179 2$: ld a,#ERR_BAD_VALUE 
      008BD9 CC 07 22         [ 2] 2180 	jp tb_error 
      008BD9 1E               [ 2] 2181 3$: tnzw  x
      008BDA 05 16            [ 1] 2182 	jreq 2$ 
      008BDC 03               [ 2] 2183 	sllw x 
      008BDD CD               [ 2] 2184 	pushw x 
      008BDE 8A FB 1F         [ 2] 2185 	ldw x,#tib
      008BE1 05 17 03         [ 2] 2186 	subw x,(1,sp)
      000C15                       2187 	_drop 2   
      008BE4 85 CD            [ 2]    1     addw sp,#2 
      008BE6 8B 5D            [ 1] 2188 	ld a,#TK_INTGR
      008BE8 5B               [ 4] 2189 	ret 
                                   2190 
                                   2191 
                                   2192 ;***********************************
                                   2193 ;   expression parse,execute 
                                   2194 ;***********************************
                                   2195 ;-----------------------------------
                                   2196 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2197 ;			 integer | function |
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2198 ;			 '('relation')' 
                                   2199 ; output:
                                   2200 ;   A    token attribute 
                                   2201 ;   X 	 integer
                                   2202 ; ---------------------------------
                           000001  2203 	NEG=1
                           000001  2204 	VSIZE=1
      000C1A                       2205 factor:
      000C1A                       2206 	_vars VSIZE 
      008BE9 04 81            [ 2]    1     sub sp,#VSIZE 
      008BEB CD 08 12         [ 4] 2207 	call next_token
      008BEB 52 05            [ 1] 2208 	cp a,#CMD_END  
      008BED 17 04            [ 1] 2209 	jrult 16$
      008BEF 6B 01            [ 1] 2210 1$:	ld (NEG,sp),a 
      008BEF 1F 02            [ 1] 2211 	and a,#TK_GRP_MASK
      008BF1 F6 A4            [ 1] 2212 	cp a,#TK_GRP_ADD 
      008BF3 0F 6B            [ 1] 2213 	jreq 2$
      008BF5 01 16            [ 1] 2214 	ld a,(NEG,sp)
      008BF7 04 5C            [ 2] 2215 	jra 4$  
      008BF9                       2216 2$:	
      008BF9 90 F6 27         [ 4] 2217 	call next_token 
      000C32                       2218 4$:	
      008BFC 1B 0D            [ 1] 2219 	cp a,#TK_IFUNC 
      008BFE 01 27            [ 1] 2220 	jrne 5$ 
      008C00 0A               [ 4] 2221 	call (x) 
      008C01 F1 26            [ 2] 2222 	jra 18$ 
      000C39                       2223 5$:
      008C03 07 90            [ 1] 2224 	cp a,#TK_INTGR
      008C05 5C 5C            [ 1] 2225 	jrne 6$
      008C07 0A 01            [ 2] 2226 	jra 18$
      000C3F                       2227 6$:
      008C09 20 EE            [ 1] 2228 	cp a,#TK_ARRAY
      008C0B 26 06            [ 1] 2229 	jrne 10$
      008C0B 1E 02 1D         [ 4] 2230 	call get_array_element
      008C0E 00               [ 2] 2231 	ldw x,(x)
      008C0F 02 4B            [ 2] 2232 	jra 18$ 
      000C49                       2233 10$:
      008C11 00 FE            [ 1] 2234 	cp a,#TK_VAR 
      008C13 84 27            [ 1] 2235 	jrne 12$
      008C15 1F               [ 2] 2236 	ldw x,(x)
      008C16 20 D7            [ 2] 2237 	jra 18$
      008C18                       2238 12$:			
      008C18 1E 02            [ 1] 2239 	cp a,#TK_LPAREN
      008C1A F6 6B            [ 1] 2240 	jrne 16$
      008C1C 01 A4 0F         [ 4] 2241 	call relation
      008C1F 4C               [ 2] 2242 	pushw x 
      008C20 C7 00            [ 1] 2243 	ld a,#TK_RPAREN 
      008C22 0E 72 5F         [ 4] 2244 	call expect
      008C25 00               [ 2] 2245 	popw x 
      008C26 0D 72            [ 2] 2246 	jra 18$	
      000C60                       2247 16$:
      008C28 BB               [ 1] 2248 	tnz a 
      008C29 00 0D            [ 1] 2249 	jreq 20$ 
      000C63                       2250 	_unget_token
      008C2B FE 7B 01 4E A4   [ 1]    1      mov in,in.saved  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C30 0C               [ 1] 2251 	clr a 
      008C31 44 44            [ 2] 2252 	jra 20$ 
      000C6B                       2253 18$: 
      008C33 AB 80            [ 1] 2254 	ld a,#TK_MINUS 
      008C35 11 01            [ 1] 2255 	cp a,(NEG,sp)
      008C35 5B 05            [ 1] 2256 	jrne 19$
      008C37 81               [ 2] 2257 	negw x
      008C38                       2258 19$:
      008C38 88 CD            [ 1] 2259 	ld a,#TK_INTGR
      000C74                       2260 20$:
      000C74                       2261 	_drop VSIZE
      008C3A 88 92            [ 2]    1     addw sp,#VSIZE 
      008C3C 11               [ 4] 2262 	ret
                                   2263 
                                   2264 ;-----------------------------------
                                   2265 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   2266 ; output:
                                   2267 ;   A    	token attribute 
                                   2268 ;	X		integer
                                   2269 ;-----------------------------------
                           000001  2270 	N1=1   ; int16_t
                           000003  2271 	MULOP=3
                           000003  2272 	VSIZE=3
      000C77                       2273 term:
      000C77                       2274 	_vars VSIZE
      008C3D 01 27            [ 2]    1     sub sp,#VSIZE 
      008C3F 03 CC 87         [ 4] 2275 	call factor
      008C42 A0               [ 1] 2276 	tnz a 
      008C43 84 81            [ 1] 2277 	jreq term_exit 
      008C45                       2278 term01:	 ; check for  operator 
      008C45 A6 07            [ 2] 2279 	ldw (N1,sp),x  ; save first factor 
      008C47 CD 8C 38         [ 4] 2280 	call next_token
      008C4A 6B 03            [ 1] 2281 	ld (MULOP,sp),a
      008C4A 4B 00            [ 1] 2282 	cp a,#CMD_END
      008C4C CD 8D            [ 1] 2283 	jrult 8$
      008C4E 92 A1            [ 1] 2284 	and a,#TK_GRP_MASK
      008C50 00 27            [ 1] 2285 	cp a,#TK_GRP_MULT
      008C52 20 A1            [ 1] 2286 	jreq 1$
      008C54 84 26            [ 2] 2287 	jra 8$
      000C92                       2288 1$:	; got *|/|%
      008C56 13 0C 1A         [ 4] 2289 	call factor
      008C57 A1 84            [ 1] 2290 	cp a,#TK_INTGR
      008C57 84 90            [ 1] 2291 	jreq 2$
      008C59 85 89 90         [ 2] 2292 	jp syntax_error
      008C5C 89 4C            [ 1] 2293 2$:	ldw y,x 
      008C5E 88 CD            [ 2] 2294 	ldw x,(N1,sp)
      008C60 88 92            [ 1] 2295 	ld a,(MULOP,sp) 
      008C62 A1 09            [ 1] 2296 	cp a,#TK_MULT 
      008C64 27 E6            [ 1] 2297 	jrne 3$
      008C66 A1 00 27         [ 4] 2298 	call multiply 
      008C69 09 A1            [ 2] 2299 	jra term01
      008C6B 08 27            [ 1] 2300 3$: cp a,#TK_DIV 
      008C6D 05 55            [ 1] 2301 	jrne 4$ 
      008C6F 00 03 00         [ 4] 2302 	call divide 
      008C72 02 84            [ 2] 2303 	jra term01 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008C74 81 0B 4A         [ 4] 2304 4$: call modulo
      008C75 20 C6            [ 2] 2305 	jra term01 
      008C75 CD 8C            [ 1] 2306 8$: ld a,(MULOP,sp)
      008C77 45 A1            [ 1] 2307 	jreq 9$ 
      000CBD                       2308 	_unget_token
      008C79 01 27 03 CC 87   [ 1]    1      mov in,in.saved  
      008C7E A0 85            [ 2] 2309 9$: ldw x,(N1,sp)
      008C80 C3 00            [ 1] 2310 	ld a,#TK_INTGR 	
      000CC6                       2311 term_exit:
      000CC6                       2312 	_drop VSIZE 
      008C82 22 23            [ 2]    1     addw sp,#VSIZE 
      008C84 05               [ 4] 2313 	ret 
                                   2314 
                                   2315 ;-------------------------------
                                   2316 ;  expr ::= term [['+'|'-'] term]*
                                   2317 ;  result range {-32768..32767}
                                   2318 ;  output:
                                   2319 ;   A    token attribute 
                                   2320 ;   X	 integer   
                                   2321 ;-------------------------------
                           000001  2322 	N1=1
                           000003  2323 	N2=3 
                           000005  2324 	OP=5 
                           000005  2325 	VSIZE=5 
      000CC9                       2326 expression:
      000CC9                       2327 	_vars VSIZE 
      008C85 A6 0A            [ 2]    1     sub sp,#VSIZE 
      008C87 CC 87 A2         [ 4] 2328 	call term
      008C8A 5D               [ 1] 2329 	tnz a 
      008C8B 27 F8            [ 1] 2330 	jreq expr_exit 
      008C8D 58 89            [ 2] 2331 1$:	ldw (N1,sp),x 
      008C8F AE 16 90         [ 4] 2332 	call next_token
      008C92 72 F0            [ 1] 2333 	ld (OP,sp),a 
      008C94 01 5B            [ 1] 2334 	cp a,#CMD_END 
      008C96 02 A6            [ 1] 2335 	jrult 8$ 
      008C98 84 81            [ 1] 2336 	and a,#TK_GRP_MASK
      008C9A A1 10            [ 1] 2337 	cp a,#TK_GRP_ADD 
      008C9A 52 01            [ 1] 2338 	jreq 2$ 
      008C9C CD 88            [ 2] 2339 	jra 8$
      000CE4                       2340 2$: 
      008C9E 92 A1 02         [ 4] 2341 	call term
      008CA1 25 3D            [ 1] 2342 	cp a,#TK_INTGR
      008CA3 6B 01            [ 1] 2343 	jreq 3$
      008CA5 A4 30 A1         [ 2] 2344 	jp syntax_error
      008CA8 10 27            [ 2] 2345 3$:	ldw (N2,sp),x 
      008CAA 04 7B            [ 2] 2346 	ldw x,(N1,sp)
      008CAC 01 20            [ 1] 2347 	ld a,(OP,sp)
      008CAE 03 10            [ 1] 2348 	cp a,#TK_PLUS 
      008CAF 26 05            [ 1] 2349 	jrne 4$
      008CAF CD 88 92         [ 2] 2350 	addw x,(N2,sp)
      008CB2 20 D4            [ 2] 2351 	jra 1$ 
      008CB2 A1 81 26         [ 2] 2352 4$:	subw x,(N2,sp)
      008CB5 03 FD            [ 2] 2353 	jra 1$
      008CB7 20 32            [ 1] 2354 8$: ld a,(OP,sp)
      008CB9 27 05            [ 1] 2355 	jreq 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      000D06                       2356 	_unget_token	
      008CB9 A1 84 26 02 20   [ 1]    1      mov in,in.saved  
      008CBE 2C 01            [ 2] 2357 9$: ldw x,(N1,sp)
      008CBF A6 84            [ 1] 2358 	ld a,#TK_INTGR	
      000D0F                       2359 expr_exit:
      000D0F                       2360 	_drop VSIZE 
      008CBF A1 06            [ 2]    1     addw sp,#VSIZE 
      008CC1 26               [ 4] 2361 	ret 
                                   2362 
                                   2363 ;---------------------------------------------
                                   2364 ; rel ::= expr rel_op expr
                                   2365 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   2366 ;  relation return  integer , zero is false 
                                   2367 ;  output:
                                   2368 ;    A 		token attribute  
                                   2369 ;	 X		integer 
                                   2370 ;---------------------------------------------
                           000001  2371 	N1=1
                           000003  2372 	RELOP=3
                           000003  2373 	VSIZE=3 
      000D12                       2374 relation: 
      000D12                       2375 	_vars VSIZE
      008CC2 06 CD            [ 2]    1     sub sp,#VSIZE 
      008CC4 8C 75 FE         [ 4] 2376 	call expression
      008CC7 20               [ 1] 2377 	tnz a 
      008CC8 22 4D            [ 1] 2378 	jreq rel_exit
      008CC9 1F 01            [ 2] 2379 	ldw (N1,sp),x 
                                   2380 ; expect rel_op or leave 
      008CC9 A1 85 26         [ 4] 2381 	call next_token 
      008CCC 03 FE            [ 1] 2382 	ld (RELOP,sp),a 
      008CCE 20 1B            [ 1] 2383 	and a,#TK_GRP_MASK
      008CD0 A1 30            [ 1] 2384 	cp a,#TK_GRP_RELOP 
      008CD0 A1 07            [ 1] 2385 	jrne 8$
      000D27                       2386 2$:	; expect another expression
      008CD2 26 0C CD         [ 4] 2387 	call expression
      008CD5 8D 92            [ 1] 2388 	cp a,#TK_INTGR
      008CD7 89 A6            [ 1] 2389 	jreq 3$
      008CD9 08 CD 8C         [ 2] 2390 	jp syntax_error 
      008CDC 38 85 20         [ 2] 2391 3$:	ldw acc16,x 
      008CDF 0B 01            [ 2] 2392 	ldw x,(N1,sp) 
      008CE0 72 B0 00 0C      [ 2] 2393 	subw x,acc16
      008CE0 4D 27            [ 1] 2394 	jrne 4$
      008CE2 11 55 00 03      [ 1] 2395 	mov acc8,#2 ; n1==n2
      008CE6 00 02            [ 2] 2396 	jra 6$ 
      000D42                       2397 4$: 
      008CE8 4F 20            [ 1] 2398 	jrsgt 5$  
      008CEA 09 04 00 0D      [ 1] 2399 	mov acc8,#4 ; n1<2 
      008CEB 20 04            [ 2] 2400 	jra 6$
      000D4A                       2401 5$:
      008CEB A6 11 11 01      [ 1] 2402 	mov acc8,#1 ; n1>n2 
      000D4E                       2403 6$:
      008CEF 26               [ 1] 2404 	clrw x 
      008CF0 01 50 0D         [ 1] 2405 	ld a, acc8  
      008CF2 14 03            [ 1] 2406 	and a,(RELOP,sp)
      008CF2 A6               [ 1] 2407 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008CF3 84 0E            [ 1] 2408 	jreq 10$
      008CF4 5C               [ 1] 2409 	incw x 
      008CF4 5B 01            [ 2] 2410 	jra 10$  	
      008CF6 81 03            [ 1] 2411 8$: ld a,(RELOP,sp)
      008CF7 27 05            [ 1] 2412 	jreq 9$
      000D5E                       2413 	_unget_token
      008CF7 52 03 CD 8C 9A   [ 1]    1      mov in,in.saved  
      000D63                       2414 9$: 
      008CFC 4D 27            [ 2] 2415 	ldw x,(N1,sp)
      000D65                       2416 10$:
      008CFE 47 84            [ 1] 2417 	ld a,#TK_INTGR
      008CFF                       2418 rel_exit:
      000D67                       2419 	_drop VSIZE
      008CFF 1F 01            [ 2]    1     addw sp,#VSIZE 
      008D01 CD               [ 4] 2420 	ret 
                                   2421 
                                   2422 ;--------------------------------
                                   2423 ; BASIC: SHOW 
                                   2424 ; print stack content in hexadecimal bytes 
                                   2425 ; 16 bytes per row 
                                   2426 ;--------------------------------
      000D6A                       2427 show:
      008D02 88 92 6B         [ 2] 2428 	ldw x,#cstk_prompt
      008D05 03 A1 02         [ 4] 2429 	call puts 
      008D08 25               [ 1] 2430 	ldw x,sp 
      008D09 2F A4 30         [ 2] 2431 	addw x,#3 ; ignore return address
      008D0C A1 20 27 02      [ 2] 2432 	ldw y,#RAM_SIZE  
      008D10 20 27 0C         [ 2] 2433 	ldw acc16,x 
      008D12 72 B2 00 0C      [ 2] 2434 	subw y,acc16
      008D12 CD 8C 9A         [ 4] 2435 	call hex_dump
      008D15 A1               [ 1] 2436 	clr a 
      008D16 84               [ 4] 2437 	ret
                                   2438 
      008D17 27 03 CC 87 A0 90 93  2439 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             1E 01 7B 03 A1 20 26
             05 CD 8A FB 20 D4 A1
             21 26 05 CD 8B B4 20
             CB CD 8B CA 20 C6 7B
             03 27 05 55
                                   2440 
                                   2441 
                                   2442 ;--------------------------------------------
                                   2443 ; BASIC: HEX 
                                   2444 ; select hexadecimal base for integer print
                                   2445 ;---------------------------------------------
      000DAB                       2446 hex_base:
      008D3E 00 03 00 02      [ 1] 2447 	mov base,#16 
      008D42 1E               [ 4] 2448 	ret 
                                   2449 
                                   2450 ;--------------------------------------------
                                   2451 ; BASIC: DEC 
                                   2452 ; select decimal base for integer print
                                   2453 ;---------------------------------------------
      000DB0                       2454 dec_base:
      008D43 01 A6 84 0A      [ 1] 2455 	mov base,#10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D46 81               [ 4] 2456 	ret 
                                   2457 
                                   2458 ;------------------------
                                   2459 ; BASIC: FREE 
                                   2460 ; return free size in text area
                                   2461 ; output:
                                   2462 ;   A 		TK_INTGR
                                   2463 ;   X 	    size integer
                                   2464 ;--------------------------
      000DB5                       2465 free:
      008D46 5B 03 81         [ 2] 2466 	ldw x,#tib 
      008D49 72 B0 00 1E      [ 2] 2467 	subw x,txtend 
      008D49 52 05            [ 1] 2468 	ld a,#TK_INTGR
      008D4B CD               [ 4] 2469 	ret 
                                   2470 
                                   2471 
                                   2472 ;------------------------
                                   2473 ; BASIC: UBOUND  
                                   2474 ; return array variable size 
                                   2475 ; output:
                                   2476 ;   A 		TK_INTGR
                                   2477 ;   X 	    array size 
                                   2478 ;--------------------------
      000DBF                       2479 ubound:
      008D4C 8C F7 4D         [ 2] 2480 	ldw x,#tib
      008D4F 27 3E 1F 01      [ 2] 2481 	subw x,txtend 
      008D53 CD 88 92 6B      [ 2] 2482 	ldw y,basicptr 
      008D57 05 A1 02 25      [ 2] 2483 	cpw y,txtend 
      008D5B 26 A4            [ 1] 2484 	jrult 1$
      008D5D 30 A1 10         [ 1] 2485 	push count 
      008D60 27 02            [ 1] 2486 	push #0 
      008D62 20 1E 01         [ 2] 2487 	subw x,(1,sp)
      008D64                       2488 	_drop 2 
      008D64 CD 8C            [ 2]    1     addw sp,#2 
      008D66 F7               [ 2] 2489 1$:	srlw x 
      008D67 A1 84 27         [ 2] 2490 	ldw array_size,x
      008D6A 03 CC            [ 1] 2491 	ld a,#TK_INTGR
      008D6C 87               [ 4] 2492 	ret 
                                   2493 
                                   2494 ;-----------------------------
                                   2495 ; BASIC: LET var=expr 
                                   2496 ; variable assignement 
                                   2497 ; output:
                                   2498 ;   A 		TK_NONE 
                                   2499 ;-----------------------------
      000DE1                       2500 let::
      008D6D A0 1F 03         [ 4] 2501 	call next_token 
      008D70 1E 01            [ 1] 2502 	cp a,#TK_VAR 
      008D72 7B 05            [ 1] 2503 	jreq let_var
      008D74 A1 10            [ 1] 2504 	cp a,#TK_ARRAY 
      008D76 26 05            [ 1] 2505 	jreq  let_array
      008D78 72 FB 03         [ 2] 2506 	jp syntax_error
      000DEF                       2507 let_array:
      008D7B 20 D4 72         [ 4] 2508 	call get_array_element
      000DF2                       2509 let_var:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008D7E F0               [ 2] 2510 	pushw x  
      008D7F 03 20 CF         [ 4] 2511 	call next_token 
      008D82 7B 05            [ 1] 2512 	cp a,#TK_EQUAL
      008D84 27 05            [ 1] 2513 	jreq 1$
      008D86 55 00 03         [ 2] 2514 	jp syntax_error
      000DFD                       2515 1$:	
      008D89 00 02 1E         [ 4] 2516 	call relation   
      008D8C 01 A6            [ 1] 2517 	cp a,#TK_INTGR 
      008D8E 84 03            [ 1] 2518 	jreq 2$
      008D8F CC 07 20         [ 2] 2519 	jp syntax_error
      000E07                       2520 2$:	
      008D8F 5B 05            [ 1] 2521 	ldw y,x 
      008D91 81               [ 2] 2522 	popw x   
      008D92 FF               [ 2] 2523 	ldw (x),y   
      008D92 52               [ 4] 2524 	ret 
                                   2525 
                                   2526 ;----------------------------
                                   2527 ; BASIC: LIST [[start][,end]]
                                   2528 ; list program lines 
                                   2529 ; form start to end 
                                   2530 ; if empty argument list then 
                                   2531 ; list all.
                                   2532 ;----------------------------
                           000001  2533 	FIRST=1
                           000003  2534 	LAST=3 
                           000005  2535 	LN_PTR=5
                           000006  2536 	VSIZE=6 
      000E0C                       2537 list:
      008D93 03 CD 8D         [ 2] 2538 	ldw x,txtbgn 
      008D96 49 4D 27         [ 2] 2539 	cpw x,txtend 
      008D99 4D 1F            [ 1] 2540 	jrmi 1$
      008D9B 01               [ 4] 2541 	ret 
      000E15                       2542 1$:	
      000E15                       2543 	_vars VSIZE
      008D9C CD 88            [ 2]    1     sub sp,#VSIZE 
      008D9E 92 6B            [ 2] 2544 	ldw (LN_PTR,sp),x 
      008DA0 03               [ 2] 2545 	ldw x,(x) 
      008DA1 A4 30            [ 2] 2546 	ldw (FIRST,sp),x ; list from first line 
      008DA3 A1 30 26         [ 2] 2547 	ldw x,#MAX_LINENO ; biggest line number 
      008DA6 33 03            [ 2] 2548 	ldw (LAST,sp),x 
      008DA7 CD 0B CA         [ 4] 2549 	call arg_list
      008DA7 CD               [ 1] 2550 	tnz a
      008DA8 8D 49            [ 1] 2551 	jreq list_loop 
      008DAA A1 84            [ 1] 2552 	cp a,#2 
      008DAC 27 03            [ 1] 2553 	jreq 4$
      008DAE CC 87            [ 1] 2554 	cp a,#1 
      008DB0 A0 CF            [ 1] 2555 	jreq first_line 
      008DB2 00 0D 1E         [ 2] 2556 	jp syntax_error 
      008DB5 01               [ 2] 2557 4$:	popw x 
      008DB6 72 B0            [ 2] 2558 	ldw (LAST+2,sp),x 
      000E35                       2559 first_line:
      008DB8 00               [ 2] 2560 	popw x
      008DB9 0D 26            [ 2] 2561 	ldw (FIRST,sp),x 
      000E38                       2562 lines_skip:
      008DBB 06 35 02         [ 2] 2563 	ldw x,txtbgn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008DBE 00 0E            [ 2] 2564 2$:	ldw (LN_PTR,sp),x 
      008DC0 20 0C 1E         [ 2] 2565 	cpw x,txtend 
      008DC2 2A 38            [ 1] 2566 	jrpl list_exit 
      008DC2 2C               [ 2] 2567 	ldw x,(x) ;line# 
      008DC3 06 35            [ 2] 2568 	cpw x,(FIRST,sp)
      008DC5 04 00            [ 1] 2569 	jrpl list_loop 
      008DC7 0E 20            [ 2] 2570 	ldw x,(LN_PTR,sp) 
      008DC9 04 02            [ 1] 2571 	ld a,(2,x)
      008DCA C7 00 0D         [ 1] 2572 	ld acc8,a 
      008DCA 35 01 00 0E      [ 1] 2573 	clr acc16 
      008DCE 72 BB 00 0C      [ 2] 2574 	addw x,acc16
      008DCE 5F C6            [ 2] 2575 	jra 2$ 
                                   2576 ; print loop
      000E58                       2577 list_loop:
      008DD0 00 0E            [ 2] 2578 	ldw x,(LN_PTR,sp)
      008DD2 14 03            [ 1] 2579 	ld a,(2,x) 
      008DD4 4D 27 0E         [ 4] 2580 	call prt_basic_line
      008DD7 5C 20            [ 2] 2581 	ldw x,(LN_PTR,sp)
      008DD9 0B 7B            [ 1] 2582 	ld a,(2,x)
      008DDB 03 27 05         [ 1] 2583 	ld acc8,a 
      008DDE 55 00 03 00      [ 1] 2584 	clr acc16 
      008DE2 02 BB 00 0C      [ 2] 2585 	addw x,acc16
      008DE3 C3 00 1E         [ 2] 2586 	cpw x,txtend 
      008DE3 1E 01            [ 1] 2587 	jrpl list_exit
      008DE5 1F 05            [ 2] 2588 	ldw (LN_PTR,sp),x
      008DE5 A6               [ 2] 2589 	ldw x,(x)
      008DE6 84 03            [ 2] 2590 	cpw x,(LAST,sp)  
      008DE7 2F DE            [ 1] 2591 	jrslt list_loop
      000E7A                       2592 list_exit:
      008DE7 5B 03 81 00 01   [ 1] 2593 	mov in,count 
      008DEA AE 16 E0         [ 2] 2594 	ldw x,#pad 
      008DEA AE 8E 04         [ 2] 2595 	ldw basicptr,x 
      000E85                       2596 	_drop VSIZE 
      008DED CD A2            [ 2]    1     addw sp,#VSIZE 
      008DEF 40               [ 4] 2597 	ret
                                   2598 
                                   2599 
                                   2600 ;--------------------------
                                   2601 ; decompile line from token list
                                   2602 ; and print it. 
                                   2603 ; input:
                                   2604 ;   A       stop at this position 
                                   2605 ;   X 		pointer at line
                                   2606 ; output:
                                   2607 ;   none 
                                   2608 ;--------------------------	
      000E88                       2609 prt_basic_line:
      008DF0 96 1C 00         [ 1] 2610 	ld count,a 
      008DF3 03 90            [ 1] 2611 	ld a,(2,x)
      008DF5 AE 18 00         [ 1] 2612 	cp a,count 
      008DF8 CF 00            [ 1] 2613 	jrpl 1$ 
      008DFA 0D 72 B2         [ 1] 2614 	ld count,a 
      008DFD 00 0D CD         [ 2] 2615 1$:	ldw basicptr,x 
      008E00 83 DF 4F 81      [ 2] 2616 	ldw y,#tib  
      008E04 0A 63 6F         [ 4] 2617 	call decompile 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E07 6E 74 65         [ 4] 2618 	call puts 
      008E0A 6E 74            [ 1] 2619 	ld a,#CR 
      008E0C 20 6F 66         [ 4] 2620 	call putc 
      008E0F 20               [ 4] 2621 	ret 
                                   2622 
                                   2623 
                                   2624 
                                   2625 ;---------------------------------
                                   2626 ; BASIC: PRINT|? arg_list 
                                   2627 ; print values from argument list
                                   2628 ;----------------------------------
                           000001  2629 	COMMA=1
                           000001  2630 	VSIZE=1
      000EA8                       2631 print:
      000EA8                       2632 	_vars VSIZE 
      008E10 73 74            [ 2]    1     sub sp,#VSIZE 
      000EAA                       2633 reset_comma:
      008E12 61 63            [ 1] 2634 	clr (COMMA,sp)
      000EAC                       2635 prt_loop:
      008E14 6B 20 66         [ 4] 2636 	call next_token
      008E17 72 6F            [ 1] 2637 	cp a,#CMD_END 
      008E19 6D 20            [ 1] 2638 	jrult print_exit ; colon or end of line 
      008E1B 74 6F            [ 1] 2639 	cp a,#TK_QSTR
      008E1D 70 20            [ 1] 2640 	jreq 1$
      008E1F 74 6F            [ 1] 2641 	cp a,#TK_CHAR 
      008E21 20 62            [ 1] 2642 	jreq 2$ 
      008E23 6F 74            [ 1] 2643 	cp a,#TK_CFUNC 
      008E25 74 6F            [ 1] 2644 	jreq 3$
      008E27 6D 3A            [ 1] 2645 	cp a,#TK_COMMA 
      008E29 0A 00            [ 1] 2646 	jreq 4$
      008E2B A1 0A            [ 1] 2647 	cp a,#TK_SHARP 
      008E2B 35 10            [ 1] 2648 	jreq 5$
      008E2D 00 0B            [ 2] 2649 	jra 7$ 
      000EC9                       2650 1$:	; print string 
      008E2F 81 00 00         [ 4] 2651 	call puts
      008E30 20 DC            [ 2] 2652 	jra reset_comma
      000ECE                       2653 2$:	; print character 
      008E30 35               [ 1] 2654 	ld a,xl 
      008E31 0A 00 0B         [ 4] 2655 	call putc 
      008E34 81 D6            [ 2] 2656 	jra reset_comma 
      008E35                       2657 3$: ; print character function value  	
      008E35 AE               [ 4] 2658 	call (x)
      008E36 16               [ 1] 2659 	ld a,xl 
      008E37 90 72 B0         [ 4] 2660 	call putc
      008E3A 00 1F            [ 2] 2661 	jra reset_comma 
      000EDB                       2662 4$: ; set comma state 
      008E3C A6 84            [ 1] 2663 	cpl (COMMA,sp)
      008E3E 81 CD            [ 2] 2664 	jra prt_loop   
      008E3F                       2665 5$: ; # character must be followed by an integer   
      008E3F AE 16 90         [ 4] 2666 	call next_token
      008E42 72 B0            [ 1] 2667 	cp a,#TK_INTGR 
      008E44 00 1F            [ 1] 2668 	jreq 6$
      008E46 90 CE 00         [ 2] 2669 	jp syntax_error 
      000EE9                       2670 6$: ; set tab width
      008E49 05               [ 1] 2671 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008E4A 90 C3            [ 1] 2672 	and a,#15 
      008E4C 00 1F 25         [ 1] 2673 	ld tab_width,a 
      008E4F 0A 3B            [ 2] 2674 	jra reset_comma 
      000EF1                       2675 7$:	
      000EF1                       2676 	_unget_token 
      008E51 00 04 4B 00 72   [ 1]    1      mov in,in.saved  
      008E56 F0 01 5B         [ 4] 2677 	call relation 
      008E59 02 54            [ 1] 2678 	cp a,#TK_INTGR 
      008E5B CF 00            [ 1] 2679 	jrne print_exit 
      008E5D 22 A6 84         [ 4] 2680     call print_int 
      008E60 81 A8            [ 2] 2681 	jra reset_comma 
      008E61                       2682 print_exit:
      008E61 CD 88            [ 1] 2683 	tnz (COMMA,sp)
      008E63 92 A1            [ 1] 2684 	jrne 9$
      008E65 85 27            [ 1] 2685 	ld a,#CR 
      008E67 0A A1 06         [ 4] 2686     call putc 
      000F0B                       2687 9$:	_drop VSIZE 
      008E6A 27 03            [ 2]    1     addw sp,#VSIZE 
      008E6C CC               [ 4] 2688 	ret 
                                   2689 
                                   2690 ;----------------------
                                   2691 ; 'save_context' and
                                   2692 ; 'rest_context' must be 
                                   2693 ; called at the same 
                                   2694 ; call stack depth 
                                   2695 ; i.e. SP must have the 
                                   2696 ; save value at  
                                   2697 ; entry point of both 
                                   2698 ; routine. 
                                   2699 ;---------------------
                           000004  2700 	CTXT_SIZE=4 ; size of saved data 
                                   2701 ;--------------------
                                   2702 ; save current BASIC
                                   2703 ; interpreter context 
                                   2704 ; on stack 
                                   2705 ;--------------------
      000F0E                       2706 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000F0E                       2707 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      000F0E                       2708 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      000F0E                       2709 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      000F0E                       2710 save_context:
      008E6D 87 A0 04         [ 2] 2711 	ldw x,basicptr 
      008E6F 1F 03            [ 2] 2712 	ldw (BPTR,sp),x
      008E6F CD 8C 75         [ 1] 2713 	ld a,in 
      008E72 6B 05            [ 1] 2714 	ld (IN,sp),a
      008E72 89 CD 88         [ 1] 2715 	ld a,count 
      008E75 92 A1            [ 1] 2716 	ld (CNT,sp),a  
      008E77 32               [ 4] 2717 	ret
                                   2718 
                                   2719 ;-----------------------
                                   2720 ; restore previously saved 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2721 ; BASIC interpreter context 
                                   2722 ; from stack 
                                   2723 ;-------------------------
      000F1E                       2724 rest_context:
      008E78 27 03            [ 2] 2725 	ldw x,(BPTR,sp)
      008E7A CC 87 A0         [ 2] 2726 	ldw basicptr,x 
      008E7D 7B 05            [ 1] 2727 	ld a,(IN,sp)
      008E7D CD 8D 92         [ 1] 2728 	ld in,a
      008E80 A1 84            [ 1] 2729 	ld a,(CNT,sp)
      008E82 27 03 CC         [ 1] 2730 	ld count,a  
      008E85 87               [ 4] 2731 	ret
                                   2732 
                                   2733 
                                   2734 
                                   2735 ;------------------------------------------
                                   2736 ; BASIC: INPUT [string]var[,[string]var]
                                   2737 ; input value in variables 
                                   2738 ; [string] optionally can be used as prompt 
                                   2739 ;-----------------------------------------
                           000001  2740 	CX_BPTR=1
                           000003  2741 	CX_IN=3
                           000004  2742 	CX_CNT=4
                           000005  2743 	SKIP=5
                           000006  2744 	VAR_ADDR=6
                           000007  2745 	VSIZE=7
      000F2E                       2746 input_var:
      000F2E                       2747 	_vars VSIZE 
      008E86 A0 07            [ 2]    1     sub sp,#VSIZE 
      008E87                       2748 input_loop:
      008E87 90 93            [ 1] 2749 	clr (SKIP,sp)
      008E89 85 FF 81         [ 4] 2750 	call next_token 
      008E8C A1 02            [ 1] 2751 	cp a,#TK_QSTR 
      008E8C CE 00            [ 1] 2752 	jrne 1$ 
      008E8E 1D C3 00         [ 4] 2753 	call puts 
      008E91 1F 2B            [ 1] 2754 	cpl (SKIP,sp)
      008E93 01 81 12         [ 4] 2755 	call next_token 
      008E95 A1 85            [ 1] 2756 1$: cp a,#TK_VAR  
      008E95 52 06            [ 1] 2757 	jreq 2$ 
      008E97 1F 05 FE         [ 2] 2758 	jp syntax_error
      008E9A 1F 01            [ 2] 2759 2$:	ldw (VAR_ADDR,sp),x 
      008E9C AE 7F            [ 1] 2760 	tnz (SKIP,sp)
      008E9E FF 1F            [ 1] 2761 	jrne 21$ 
      008EA0 03 CD 8C         [ 4] 2762 	call var_name 
      008EA3 4A 4D 27         [ 4] 2763 	call putc   
      000F54                       2764 21$:
      008EA6 31 A1            [ 1] 2765 	ld a,#':
      008EA8 02 27 07         [ 4] 2766 	call putc 
      008EAB A1 01 27         [ 4] 2767 	call save_context 
      008EAE 06 CC 87 A0      [ 1] 2768 	clr count  
      008EB2 85 1F 05         [ 4] 2769 	call readln 
      008EB5 AE 16 90         [ 2] 2770 	ldw x,#tib 
      008EB5 85 1F 01         [ 1] 2771 	push count
      008EB8 4B 00            [ 1] 2772 	push #0 
      008EB8 CE 00 1D         [ 2] 2773 	addw x,(1,sp)
      008EBB 1F               [ 1] 2774 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      000F6F                       2775 	_drop 2 
      008EBC 05 C3            [ 2]    1     addw sp,#2 
      008EBE 00 1F 2A 38      [ 1] 2776 	clr in 
      008EC2 FE 13 01         [ 4] 2777 	call get_token
      008EC5 2A 11            [ 1] 2778 	cp a,#TK_INTGR
      008EC7 1E 05            [ 1] 2779 	jreq 3$ 
      008EC9 E6 02 C7         [ 4] 2780 	call rest_context 
      008ECC 00 0E 72         [ 2] 2781 	jp syntax_error
      008ECF 5F 00            [ 2] 2782 3$: ldw y,(VAR_ADDR,sp) 
      008ED1 0D 72            [ 2] 2783 	ldw (y),x 
      008ED3 BB 00 0D         [ 4] 2784 	call rest_context
      008ED6 20 E3 12         [ 4] 2785 	call next_token 
      008ED8 A1 09            [ 1] 2786 	cp a,#TK_COMMA 
      008ED8 1E 05            [ 1] 2787 	jreq input_loop
      008EDA E6 02            [ 1] 2788 	cp a,#TK_NONE 
      008EDC CD 8F            [ 1] 2789 	jreq input_exit  
      008EDE 08 1E            [ 1] 2790 	cp a,#TK_COLON 
      008EE0 05 E6            [ 1] 2791     jreq input_exit 
      008EE2 02 C7 00         [ 2] 2792 	jp syntax_error 
      000F9B                       2793 input_exit:
      000F9B                       2794 	_drop VSIZE 
      008EE5 0E 72            [ 2]    1     addw sp,#VSIZE 
      008EE7 5F               [ 4] 2795 	ret 
                                   2796 
                                   2797 
                                   2798 ;---------------------
                                   2799 ; BASIC: REMARK | ' 
                                   2800 ; skip comment to end of line 
                                   2801 ;---------------------- 
      000F9E                       2802 remark::
      008EE8 00 0D 72 BB 00   [ 1] 2803 	mov in,count 
      008EED 0D               [ 4] 2804  	ret 
                                   2805 
                                   2806 
                                   2807 ;---------------------
                                   2808 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2809 ; read in loop 'addr'  
                                   2810 ; apply & 'mask' to value 
                                   2811 ; loop while result==0.  
                                   2812 ; 'xor_mask' is used to 
                                   2813 ; invert the wait logic.
                                   2814 ; i.e. loop while not 0.
                                   2815 ;---------------------
                           000001  2816 	XMASK=1 
                           000002  2817 	MASK=2
                           000003  2818 	ADDR=3
                           000004  2819 	VSIZE=4
      000FA4                       2820 wait: 
      000FA4                       2821 	_vars VSIZE
      008EEE C3 00            [ 2]    1     sub sp,#VSIZE 
      008EF0 1F 2A            [ 1] 2822 	clr (XMASK,sp) 
      008EF2 07 1F 05         [ 4] 2823 	call arg_list 
      008EF5 FE 13            [ 1] 2824 	cp a,#2
      008EF7 03 2F            [ 1] 2825 	jruge 0$
      008EF9 DE 07 20         [ 2] 2826 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008EFA A1 03            [ 1] 2827 0$:	cp a,#3
      008EFA 55 00            [ 1] 2828 	jrult 1$
      008EFC 04               [ 2] 2829 	popw x 
      008EFD 00               [ 1] 2830 	ld a,xl
      008EFE 02 AE            [ 1] 2831 	ld (XMASK,sp),a 
      008F00 16               [ 2] 2832 1$: popw x ; mask 
      008F01 E0               [ 1] 2833 	ld a,xl 
      008F02 CF 00            [ 1] 2834 	ld (MASK,sp),a 
      008F04 05               [ 2] 2835 	popw x ; address 
      008F05 5B               [ 1] 2836 2$:	ld a,(x)
      008F06 06 81            [ 1] 2837 	and a,(MASK,sp)
      008F08 18 01            [ 1] 2838 	xor a,(XMASK,sp)
      008F08 C7 00            [ 1] 2839 	jreq 2$ 
      000FC6                       2840 	_drop VSIZE 
      008F0A 04 E6            [ 2]    1     addw sp,#VSIZE 
      008F0C 02               [ 4] 2841 	ret 
                                   2842 
                                   2843 ;---------------------
                                   2844 ; BASIC: BSET addr,mask
                                   2845 ; set bits at 'addr' corresponding 
                                   2846 ; to those of 'mask' that are at 1.
                                   2847 ; arguments:
                                   2848 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2849 ;   mask        mask|addr
                                   2850 ; output:
                                   2851 ;	none 
                                   2852 ;--------------------------
      000FC9                       2853 bit_set:
      008F0D C1 00 04         [ 4] 2854 	call arg_list 
      008F10 2A 03            [ 1] 2855 	cp a,#2	 
      008F12 C7 00            [ 1] 2856 	jreq 1$ 
      008F14 04 CF 00         [ 2] 2857 	jp syntax_error
      000FD3                       2858 1$: 
      008F17 05               [ 2] 2859 	popw x ; mask 
      008F18 90               [ 1] 2860 	ld a,xl 
      008F19 AE               [ 2] 2861 	popw x ; addr  
      008F1A 16               [ 1] 2862 	or a,(x)
      008F1B 90               [ 1] 2863 	ld (x),a
      008F1C CD               [ 4] 2864 	ret 
                                   2865 
                                   2866 ;---------------------
                                   2867 ; BASIC: BRES addr,mask
                                   2868 ; reset bits at 'addr' corresponding 
                                   2869 ; to those of 'mask' that are at 1.
                                   2870 ; arguments:
                                   2871 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2872 ;   mask	    ~mask&*addr  
                                   2873 ; output:
                                   2874 ;	none 
                                   2875 ;--------------------------
      000FD9                       2876 bit_reset:
      008F1D AA 34 CD         [ 4] 2877 	call arg_list 
      008F20 A2 40            [ 1] 2878 	cp a,#2  
      008F22 A6 0D            [ 1] 2879 	jreq 1$ 
      008F24 CD 83 42         [ 2] 2880 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      000FE3                       2881 1$: 
      008F27 81               [ 2] 2882 	popw x ; mask 
      008F28 9F               [ 1] 2883 	ld a,xl 
      008F28 52               [ 1] 2884 	cpl a 
      008F29 01               [ 2] 2885 	popw x ; addr  
      008F2A F4               [ 1] 2886 	and a,(x)
      008F2A 0F               [ 1] 2887 	ld (x),a 
      008F2B 01               [ 4] 2888 	ret 
                                   2889 
                                   2890 ;---------------------
                                   2891 ; BASIC: BTOGL addr,mask
                                   2892 ; toggle bits at 'addr' corresponding 
                                   2893 ; to those of 'mask' that are at 1.
                                   2894 ; arguments:
                                   2895 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2896 ;   mask	    mask^*addr  
                                   2897 ; output:
                                   2898 ;	none 
                                   2899 ;--------------------------
      008F2C                       2900 bit_toggle:
      008F2C CD 88 92         [ 4] 2901 	call arg_list 
      008F2F A1 02            [ 1] 2902 	cp a,#2 
      008F31 25 4F            [ 1] 2903 	jreq 1$ 
      008F33 A1 02 27         [ 2] 2904 	jp syntax_error
      008F36 12               [ 2] 2905 1$: popw x ; mask 
      008F37 A1               [ 1] 2906 	ld a,xl 
      008F38 03               [ 2] 2907 	popw x ; addr  
      008F39 27               [ 1] 2908 	xor a,(x)
      008F3A 13               [ 1] 2909 	ld (x),a 
      008F3B A1               [ 4] 2910 	ret 
                                   2911 
                                   2912 
                                   2913 ;---------------------
                                   2914 ; BASIC: BTEST(addr,bit)
                                   2915 ; return bit value at 'addr' 
                                   2916 ; bit is in range {0..7}.
                                   2917 ; arguments:
                                   2918 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2919 ;   bit 	    bit position {0..7}  
                                   2920 ; output:
                                   2921 ;	none 
                                   2922 ;--------------------------
      000FFA                       2923 bit_test:
      008F3C 82 27 15         [ 4] 2924 	call func_args 
      008F3F A1 09            [ 1] 2925 	cp a,#2
      008F41 27 18            [ 1] 2926 	jreq 0$
      008F43 A1 0A 27         [ 2] 2927 	jp syntax_error
      001004                       2928 0$:	
      008F46 18               [ 2] 2929 	popw x 
      008F47 20               [ 1] 2930 	ld a,xl 
      008F48 28 07            [ 1] 2931 	and a,#7
      008F49 88               [ 1] 2932 	push a   
      008F49 CD A2            [ 1] 2933 	ld a,#1 
      008F4B 40 20            [ 1] 2934 1$: tnz (1,sp)
      008F4D DC 05            [ 1] 2935 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008F4E 48               [ 1] 2936 	sll a 
      008F4E 9F CD            [ 1] 2937 	dec (1,sp)
      008F50 83 42            [ 2] 2938 	jra 1$
      001014                       2939 2$: _drop 1 
      008F52 20 D6            [ 2]    1     addw sp,#1 
      008F54 85               [ 2] 2940 	popw x 
      008F54 FD               [ 1] 2941 	and a,(x)
      008F55 9F CD            [ 1] 2942 	jreq 3$
      008F57 83 42            [ 1] 2943 	ld a,#1 
      008F59 20               [ 1] 2944 3$:	clrw x 
      008F5A CF               [ 1] 2945 	ld xl,a 
      008F5B A6 84            [ 1] 2946 	ld a,#TK_INTGR
      008F5B 03               [ 4] 2947 	ret
                                   2948 
                                   2949 
                                   2950 ;--------------------
                                   2951 ; BASIC: POKE addr,byte
                                   2952 ; put a byte at addr 
                                   2953 ;--------------------
      001021                       2954 poke:
      008F5C 01 20 CD         [ 4] 2955 	call arg_list 
      008F5F A1 02            [ 1] 2956 	cp a,#2
      008F5F CD 88            [ 1] 2957 	jreq 1$
      008F61 92 A1 84         [ 2] 2958 	jp syntax_error
      00102B                       2959 1$:	
      008F64 27               [ 2] 2960 	popw x  
      008F65 03               [ 1] 2961     ld a,xl 
      008F66 CC               [ 2] 2962 	popw x 
      008F67 87               [ 1] 2963 	ld (x),a 
      008F68 A0               [ 4] 2964 	ret 
                                   2965 
                                   2966 ;-----------------------
                                   2967 ; BASIC: PEEK(addr)
                                   2968 ; get the byte at addr 
                                   2969 ; input:
                                   2970 ;	none 
                                   2971 ; output:
                                   2972 ;	X 		value 
                                   2973 ;-----------------------
      008F69                       2974 peek:
      008F69 9F A4 0F         [ 4] 2975 	call func_args
      008F6C C7 00            [ 1] 2976 	cp a,#1 
      008F6E 25 20            [ 1] 2977 	jreq 1$
      008F70 B9 07 20         [ 2] 2978 	jp syntax_error
      008F71 85               [ 2] 2979 1$: popw x 
      008F71 55               [ 1] 2980 	ld a,(x)
      008F72 00               [ 1] 2981 	clrw x 
      008F73 03               [ 1] 2982 	ld xl,a 
      008F74 00 02            [ 1] 2983 	ld a,#TK_INTGR
      008F76 CD               [ 4] 2984 	ret 
                                   2985 
                                   2986 ;---------------------------
                                   2987 ; BASIC IF expr : instructions
                                   2988 ; evaluate expr and if true 
                                   2989 ; execute instructions on same line. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2990 ;----------------------------
      001041                       2991 if: 
      008F77 8D 92 A1         [ 4] 2992 	call relation 
      008F7A 84 26            [ 1] 2993 	cp a,#TK_INTGR
      008F7C 05 CD            [ 1] 2994 	jreq 1$ 
      008F7E 88 ED 20         [ 2] 2995 	jp syntax_error
      008F81 A8               [ 1] 2996 1$:	clr a 
      008F82 5D               [ 2] 2997 	tnzw x 
      008F82 0D 01            [ 1] 2998 	jrne 9$  
                                   2999 ;skip to next line
      008F84 26 05 A6 0D CD   [ 1] 3000 	mov in,count
      008F89 83               [ 4] 3001 9$:	ret 
                                   3002 
                                   3003 ;------------------------
                                   3004 ; BASIC: FOR var=expr 
                                   3005 ; set variable to expression 
                                   3006 ; leave variable address 
                                   3007 ; on stack and set
                                   3008 ; FLOOP bit in 'flags'
                                   3009 ;-----------------
                           000001  3010 	RETL1=1 ; return address  
                           000003  3011 	FSTEP=3  ; variable increment
                           000005  3012 	LIMIT=5 ; loop limit 
                           000007  3013 	CVAR=7   ; control variable 
                           000009  3014 	INW=9   ;  in.w saved
                           00000B  3015 	BPTR=11 ; baseptr saved
                           00000A  3016 	VSIZE=10  
      001055                       3017 for: ; { -- var_addr }
      008F8A 42               [ 2] 3018 	popw x ; call return address 
      001056                       3019 	_vars VSIZE 
      008F8B 5B 01            [ 2]    1     sub sp,#VSIZE 
      008F8D 81               [ 2] 3020 	pushw x  ; RETL1 
      008F8E A6 85            [ 1] 3021 	ld a,#TK_VAR 
      008F8E CE 00 05         [ 4] 3022 	call expect
      008F91 1F 03            [ 2] 3023 	ldw (CVAR,sp),x  ; control variable 
      008F93 C6 00 02         [ 4] 3024 	call let_var 
      008F96 6B 05 C6 00      [ 1] 3025 	bset flags,#FLOOP 
                                   3026 ; open space on stack for loop data 
      008F9A 04               [ 1] 3027 	clrw x 
      008F9B 6B 06            [ 2] 3028 	ldw (BPTR,sp),x 
      008F9D 81 09            [ 2] 3029 	ldw (INW,sp),x 
      008F9E CD 08 12         [ 4] 3030 	call next_token 
      008F9E 1E 03            [ 1] 3031 	cp a,#TK_CMD 
      008FA0 CF 00            [ 1] 3032 	jreq 1$
      008FA2 05 7B 05         [ 2] 3033 	jp syntax_error
      001076                       3034 1$:  
      008FA5 C7 00 02         [ 2] 3035 	cpw x,#to 
      008FA8 7B 06            [ 1] 3036 	jreq to
      008FAA C7 00 04         [ 2] 3037 	jp syntax_error 
                                   3038 
                                   3039 ;-----------------------------------
                                   3040 ; BASIC: TO expr 
                                   3041 ; second part of FOR loop initilization
                                   3042 ; leave limit on stack and set 
                                   3043 ; FTO bit in 'flags'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3044 ;-----------------------------------
      00107E                       3045 to: ; { var_addr -- var_addr limit step }
      008FAD 81 04 00 23 03   [ 2] 3046 	btjt flags,#FLOOP,1$
      008FAE CC 07 20         [ 2] 3047 	jp syntax_error
      008FAE 52 07 12         [ 4] 3048 1$: call relation  
      008FB0 A1 84            [ 1] 3049 	cp a,#TK_INTGR 
      008FB0 0F 05            [ 1] 3050 	jreq 2$ 
      008FB2 CD 88 92         [ 2] 3051 	jp syntax_error
      008FB5 A1 02            [ 2] 3052 2$: ldw (LIMIT,sp),x
                                   3053 ;	ldw x,in.w 
      008FB7 26 08 CD         [ 4] 3054 	call next_token
      008FBA A2 40            [ 1] 3055 	cp a,#TK_NONE  
      008FBC 03 05            [ 1] 3056 	jreq 4$ 
      008FBE CD 88            [ 1] 3057 	cp a,#TK_CMD
      008FC0 92 A1            [ 1] 3058 	jrne 3$
      008FC2 85 27 03         [ 2] 3059 	cpw x,#step 
      008FC5 CC 87            [ 1] 3060 	jreq step
      0010A2                       3061 3$:	
      0010A2                       3062 	_unget_token   	 
      008FC7 A0 1F 06 0D 05   [ 1]    1      mov in,in.saved  
      0010A7                       3063 4$:	
      008FCC 26 06 CD         [ 2] 3064 	ldw x,#1   ; default step  
      008FCF AA 0B            [ 2] 3065 	ldw (FSTEP,sp),x 
      008FD1 CD 83            [ 2] 3066 	jra store_loop_addr 
                                   3067 
                                   3068 
                                   3069 ;----------------------------------
                                   3070 ; BASIC: STEP expr 
                                   3071 ; optional third par of FOR loop
                                   3072 ; initialization. 	
                                   3073 ;------------------------------------
      0010AE                       3074 step: ; {var limit -- var limit step}
      008FD3 42 04 00 23 03   [ 2] 3075 	btjt flags,#FLOOP,1$
      008FD4 CC 07 20         [ 2] 3076 	jp syntax_error
      008FD4 A6 3A CD         [ 4] 3077 1$: call relation
      008FD7 83 42            [ 1] 3078 	cp a,#TK_INTGR
      008FD9 CD 8F            [ 1] 3079 	jreq 2$
      008FDB 8E 72 5F         [ 2] 3080 	jp syntax_error
      008FDE 00 04            [ 2] 3081 2$:	ldw (FSTEP,sp),x ; step
                                   3082 ; leave loop back entry point on cstack 
                                   3083 ; cstack is 1 call deep from interpreter
      0010C2                       3084 store_loop_addr:
      008FE0 CD A3 45         [ 2] 3085 	ldw x,basicptr  
      008FE3 AE 16            [ 2] 3086 	ldw (BPTR,sp),x 
      008FE5 90 3B 00         [ 2] 3087 	ldw x,in.w 
      008FE8 04 4B            [ 2] 3088 	ldw (INW,sp),x   
      008FEA 00 72 FB 01      [ 1] 3089 	bres flags,#FLOOP 
      008FEE 5C 5B 02 72      [ 1] 3090 	inc loop_depth  
      008FF2 5F               [ 4] 3091 	ret 
                                   3092 
                                   3093 ;--------------------------------
                                   3094 ; BASIC: NEXT var 
                                   3095 ; FOR loop control 
                                   3096 ; increment variable with step 
                                   3097 ; and compare with limit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3098 ; loop if threshold not crossed.
                                   3099 ; else stack. 
                                   3100 ; and decrement 'loop_depth' 
                                   3101 ;--------------------------------
      0010D5                       3102 next: ; {var limit step retl1 -- [var limit step ] }
      008FF3 00 02 CD A7      [ 1] 3103 	tnz loop_depth 
      008FF7 5A A1            [ 1] 3104 	jrne 1$ 
      008FF9 84 27 06         [ 2] 3105 	jp syntax_error 
      0010DE                       3106 1$: 
      008FFC CD 8F            [ 1] 3107 	ld a,#TK_VAR 
      008FFE 9E CC 87         [ 4] 3108 	call expect
                                   3109 ; check for good variable after NEXT 	 
      009001 A0 16            [ 2] 3110 	cpw x,(CVAR,sp)
      009003 06 90            [ 1] 3111 	jreq 2$  
      009005 FF CD 8F         [ 2] 3112 	jp syntax_error ; not the good one 
      0010EA                       3113 2$: ; increment variable 
      009008 9E               [ 2] 3114 	ldw x,(x)  ; get var value 
      009009 CD 88 92         [ 2] 3115 	addw x,(FSTEP,sp) ; var+step 
      00900C A1 09            [ 2] 3116 	ldw y,(CVAR,sp)
      00900E 27 A0            [ 2] 3117 	ldw (y),x ; save var new value 
                                   3118 ; check sign of STEP  
      009010 A1 00            [ 1] 3119 	ld a,#0x80
      009012 27 07            [ 1] 3120 	bcp a,(FSTEP,sp)
      009014 A1 0B            [ 1] 3121 	jrpl 4$
                                   3122 ;negative step 
      009016 27 03            [ 2] 3123 	cpw x,(LIMIT,sp)
      009018 CC 87            [ 1] 3124 	jrslt loop_done
      00901A A0 04            [ 2] 3125 	jra loop_back 
      00901B                       3126 4$: ; positive step
      00901B 5B 07            [ 2] 3127 	cpw x,(LIMIT,sp)
      00901D 81 15            [ 1] 3128 	jrsgt loop_done
      00901E                       3129 loop_back:
      00901E 55 00            [ 2] 3130 	ldw x,(BPTR,sp)
      009020 04 00 02         [ 2] 3131 	ldw basicptr,x 
      009023 81 01 00 23 05   [ 2] 3132 	btjf flags,#FRUN,1$ 
      009024 E6 02            [ 1] 3133 	ld a,(2,x)
      009024 52 04 0F         [ 1] 3134 	ld count,a
      009027 01 CD            [ 2] 3135 1$:	ldw x,(INW,sp)
      009029 8C 4A A1         [ 2] 3136 	ldw in.w,x 
      00902C 02               [ 4] 3137 	ret 
      001117                       3138 loop_done:
                                   3139 	; remove loop data from stack  
      00902D 24               [ 2] 3140 	popw x
      001118                       3141 	_drop VSIZE 
      00902E 03 CC            [ 2]    1     addw sp,#VSIZE 
      009030 87 A0 A1 03      [ 1] 3142 	dec loop_depth 
                                   3143 ;	pushw x 
                                   3144 ;	ret 
      009034 25               [ 2] 3145 	jp (x)
                                   3146 
                                   3147 ;----------------------------
                                   3148 ; called by goto/gosub
                                   3149 ; to get target line number 
                                   3150 ;---------------------------
      00111F                       3151 get_target_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009035 04 85 9F         [ 4] 3152 	call relation 
      009038 6B 01            [ 1] 3153 	cp a,#TK_INTGR
      00903A 85 9F            [ 1] 3154 	jreq 1$
      00903C 6B 02 85         [ 2] 3155 	jp syntax_error
      00903F F6               [ 1] 3156 1$:	clr a
      009040 14 02 18 01      [ 2] 3157 	ldw y,basicptr 
      009044 27 F9            [ 2] 3158 	ldw y,(y)
      009046 5B 04            [ 2] 3159 	pushw y 
      009048 81 01            [ 2] 3160 	cpw x,(1,sp)
      009049 5B 02            [ 2] 3161 	addw sp,#2 
      009049 CD 8C            [ 1] 3162 	jrult 11$
      00904B 4A               [ 1] 3163 	inc a 
      001139                       3164 11$:	
      00904C A1 02 27         [ 4] 3165 	call search_lineno  
      00904F 03               [ 2] 3166 	tnzw x 
      009050 CC 87            [ 1] 3167 	jrne 2$ 
      009052 A0 05            [ 1] 3168 	ld a,#ERR_NO_LINE 
      009053 CC 07 22         [ 2] 3169 	jp tb_error 
      009053 85               [ 4] 3170 2$:	ret 
                                   3171 
                                   3172 ;------------------------
                                   3173 ; BASIC: GOTO line# 
                                   3174 ; jump to line# 
                                   3175 ; here cstack is 2 call deep from interpreter 
                                   3176 ;------------------------
      001145                       3177 goto:
      009054 9F 85 FA F7 81   [ 2] 3178 	btjt flags,#FRUN,0$ 
      009059 A6 06            [ 1] 3179 	ld a,#ERR_RUN_ONLY
      009059 CD 8C 4A         [ 2] 3180 	jp tb_error 
      00905C A1               [ 4] 3181 	ret 
      00905D 02 27 03         [ 4] 3182 0$:	call get_target_line
      001153                       3183 jp_to_target:
      009060 CC 87 A0         [ 2] 3184 	ldw basicptr,x 
      009063 E6 02            [ 1] 3185 	ld a,(2,x)
      009063 85 9F 43         [ 1] 3186 	ld count,a 
      009066 85 F4 F7 81      [ 1] 3187 	mov in,#3 
      00906A 81               [ 4] 3188 	ret 
                                   3189 
                                   3190 
                                   3191 ;--------------------
                                   3192 ; BASIC: GOSUB line#
                                   3193 ; basic subroutine call
                                   3194 ; actual line# and basicptr 
                                   3195 ; are saved on cstack
                                   3196 ; here cstack is 2 call deep from interpreter 
                                   3197 ;--------------------
                           000003  3198 	RET_ADDR=3
                           000005  3199 	RET_INW=5
                           000004  3200 	VSIZE=4  
      001160                       3201 gosub:
      00906A CD 8C 4A A1 02   [ 2] 3202 	btjt flags,#FRUN,0$ 
      00906F 27 03            [ 1] 3203 	ld a,#ERR_RUN_ONLY
      009071 CC 87 A0         [ 2] 3204 	jp tb_error 
      009074 85               [ 4] 3205 	ret 
      009075 9F               [ 2] 3206 0$:	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      00116C                       3207 	_vars VSIZE  
      009076 85 F8            [ 2]    1     sub sp,#VSIZE 
      009078 F7               [ 2] 3208 	pushw x 
      009079 81 00 04         [ 2] 3209 	ldw x,basicptr
      00907A 1F 03            [ 2] 3210 	ldw (RET_ADDR,sp),x 
      00907A CD 8C 45         [ 4] 3211 	call get_target_line  
      00907D A1               [ 2] 3212 	pushw x 
      00907E 02 27 03         [ 2] 3213 	ldw x,in.w 
      009081 CC 87            [ 2] 3214 	ldw (RET_INW+2,sp),x
      009083 A0               [ 2] 3215 	popw x 
      009084 20 D3            [ 2] 3216 	jra jp_to_target
                                   3217 
                                   3218 ;------------------------
                                   3219 ; BASIC: RETURN 
                                   3220 ; exit from a subroutine 
                                   3221 ; 
                                   3222 ;------------------------
      001180                       3223 return:
      009084 85 9F A4 07 88   [ 2] 3224 	btjt flags,#FRUN,0$ 
      009089 A6 01            [ 1] 3225 	ld a,#ERR_RUN_ONLY
      00908B 0D 01 27         [ 2] 3226 	jp tb_error 
      00118A                       3227 0$:	
      00908E 05 48            [ 2] 3228 	ldw x,(RET_ADDR,sp) 
      009090 0A 01 20         [ 2] 3229 	ldw basicptr,x
      009093 F7 5B            [ 1] 3230 	ld a,(2,x)
      009095 01 85 F4         [ 1] 3231 	ld count,a  
      009098 27 02            [ 2] 3232 	ldw x,(RET_INW,sp)
      00909A A6 01 5F         [ 2] 3233 	ldw in.w,x 
      00909D 97               [ 2] 3234 	popw x 
      00119A                       3235 	_drop VSIZE 
      00909E A6 84            [ 2]    1     addw sp,#VSIZE 
      0090A0 81               [ 2] 3236 	pushw x
      0090A1 81               [ 4] 3237 	ret  
                                   3238 
                                   3239 
                                   3240 ;----------------------------------
                                   3241 ; BASIC: RUN
                                   3242 ; run BASIC program in RAM
                                   3243 ;----------------------------------- 
      00119E                       3244 run: 
      0090A1 CD 8C 4A A1 02   [ 2] 3245 	btjf flags,#FRUN,0$  
      0090A6 27               [ 1] 3246 	clr a 
      0090A7 03               [ 4] 3247 	ret
      0011A5                       3248 0$: 
      0090A8 CC 87 A0 23 12   [ 2] 3249 	btjf flags,#FBREAK,1$
      0090AB                       3250 	_drop 2 
      0090AB 85 9F            [ 2]    1     addw sp,#2 
      0090AD 85 F7 81         [ 4] 3251 	call rest_context
      0090B0                       3252 	_drop CTXT_SIZE 
      0090B0 CD 8C            [ 2]    1     addw sp,#CTXT_SIZE 
      0090B2 45 A1 01 27      [ 1] 3253 	bres flags,#FBREAK 
      0090B6 03 CC 87 A0      [ 1] 3254 	bset flags,#FRUN 
      0090BA 85 F6 5F         [ 2] 3255 	jp interpreter 
      0090BD 97 A6 84         [ 2] 3256 1$:	ldw x,txtbgn
      0090C0 81 00 1E         [ 2] 3257 	cpw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0090C1 2B 0C            [ 1] 3258 	jrmi run_it 
      0090C1 CD 8D 92         [ 2] 3259 	ldw x,#err_no_prog
      0090C4 A1 84 27         [ 4] 3260 	call puts 
      0090C7 03 CC 87 A0 4F   [ 1] 3261 	mov in,count
      0090CC 5D               [ 4] 3262 	ret 
      0011D0                       3263 run_it:	 
      0090CD 26 05 55         [ 4] 3264     call ubound 
      0011D3                       3265 	_drop 2 ; drop return address 
      0090D0 00 04            [ 2]    1     addw sp,#2 
                                   3266 ; clear data pointer 
      0090D2 00               [ 1] 3267 	clrw x 
      0090D3 02 81 06         [ 2] 3268 	ldw data_ptr,x 
      0090D5 72 5F 00 08      [ 1] 3269 	clr data_ofs 
      0090D5 85 52 0A 89      [ 1] 3270 	clr data_len 
                                   3271 ; initialize BASIC pointer 
      0090D9 A6 85 CD         [ 2] 3272 	ldw x,txtbgn 
      0090DC 8C 38 1F         [ 2] 3273 	ldw basicptr,x 
      0090DF 07 CD            [ 1] 3274 	ld a,(2,x)
      0090E1 8E 72 72         [ 1] 3275 	ld count,a
      0090E4 14 00 24 5F      [ 1] 3276 	mov in,#3	
      0090E8 1F 0B 1F 09      [ 1] 3277 	bset flags,#FRUN 
      0090EC CD 88 92         [ 2] 3278 	jp interpreter 
                                   3279 
                                   3280 
                                   3281 ;----------------------
                                   3282 ; BASIC: END
                                   3283 ; end running program
                                   3284 ;---------------------- 
      0011F7                       3285 cmd_end: 
                                   3286 ; clean stack 
      0090EF A1 80 27         [ 2] 3287 	ldw x,#STACK_EMPTY
      0090F2 03               [ 1] 3288 	ldw sp,x 
      0090F3 CC 87 A0         [ 2] 3289 	jp warm_start
                                   3290 
                                   3291 ;-----------------
                                   3292 ; 1 Khz beep 
                                   3293 ;-----------------
      0090F6                       3294 beep_1khz:: 
      0090F6 A3 90 FE         [ 2] 3295 	ldw x,#100
      0090F9 27 03 CC 87      [ 2] 3296 	ldw y,#1000
      0090FD A0 0D            [ 2] 3297 	jra beep
                                   3298 
                                   3299 ;-----------------------
                                   3300 ; BASIC: TONE expr1,expr2
                                   3301 ; used TIMER2 channel 1
                                   3302 ; to produce a tone 
                                   3303 ; arguments:
                                   3304 ;    expr1   frequency 
                                   3305 ;    expr2   duration msec.
                                   3306 ;---------------------------
      0090FE                       3307 tone:
      0090FE 72 04 00         [ 4] 3308 	call arg_list 
      009101 24 03            [ 1] 3309 	cp a,#2 
      009103 CC 87            [ 1] 3310 	jreq 1$
      009105 A0 CD 8D         [ 2] 3311 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      001211                       3312 1$: 
      009108 92               [ 2] 3313 	popw x ; duration
      009109 A1 84            [ 2] 3314 	popw y ; frequency 
      001214                       3315 beep:  
      00910B 27               [ 2] 3316 	pushw x 
      00910C 03 CC 87         [ 2] 3317 	ldw x,#TIM2_CLK_FREQ
      00910F A0               [ 2] 3318 	divw x,y 
                                   3319 ; round to nearest integer 
      009110 1F 05 CD 88      [ 2] 3320 	cpw y,#TIM2_CLK_FREQ/2
      009114 92 A1            [ 1] 3321 	jrmi 2$
      009116 00               [ 1] 3322 	incw x 
      001220                       3323 2$:	 
      009117 27               [ 1] 3324 	ld a,xh 
      009118 0E A1 80         [ 1] 3325 	ld TIM2_ARRH,a 
      00911B 26               [ 1] 3326 	ld a,xl 
      00911C 05 A3 91         [ 1] 3327 	ld TIM2_ARRL,a 
                                   3328 ; 50% duty cycle 
      00911F 2E               [ 1] 3329 	ccf 
      009120 27               [ 2] 3330 	rrcw x 
      009121 0C               [ 1] 3331 	ld a,xh 
      009122 C7 53 0F         [ 1] 3332 	ld TIM2_CCR1H,a 
      009122 55               [ 1] 3333 	ld a,xl
      009123 00 03 00         [ 1] 3334 	ld TIM2_CCR1L,a
      009126 02 10 53 08      [ 1] 3335 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009127 72 10 53 00      [ 1] 3336 	bset TIM2_CR1,#TIM2_CR1_CEN
      009127 AE 00 01 1F      [ 1] 3337 	bset TIM2_EGR,#TIM2_EGR_UG
      00912B 03               [ 2] 3338 	popw x 
      00912C 20 14 CD         [ 4] 3339 	call pause02
      00912E 72 11 53 08      [ 1] 3340 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00912E 72 04 00 24      [ 1] 3341 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009132 03               [ 4] 3342 	ret 
                                   3343 
                                   3344 ;-------------------------------
                                   3345 ; BASIC: ADCON 0|1 [,divisor]  
                                   3346 ; disable/enanble ADC 
                                   3347 ;-------------------------------
                           000003  3348 	ONOFF=3 
                           000001  3349 	DIVSOR=1
                           000004  3350 	VSIZE=4 
      00124B                       3351 power_adc:
      009133 CC 87 A0         [ 4] 3352 	call arg_list 
      009136 CD 8D            [ 1] 3353 	cp a,#2	
      009138 92 A1            [ 1] 3354 	jreq 1$
      00913A 84 27            [ 1] 3355 	cp a,#1 
      00913C 03 CC            [ 1] 3356 	jreq 0$ 
      00913E 87 A0 1F         [ 2] 3357 	jp syntax_error 
      009141 03 00 00         [ 2] 3358 0$: ldw x,#0
      009142 89               [ 2] 3359 	pushw x  ; divisor 
      009142 CE 00            [ 2] 3360 1$: ldw x,(ONOFF,sp)
      009144 05               [ 2] 3361 	tnzw x 
      009145 1F 0B            [ 1] 3362 	jreq 2$ 
      009147 CE 00            [ 2] 3363 	ldw x,(DIVSOR,sp) ; divisor 
      009149 01               [ 1] 3364 	ld a,xl
      00914A 1F 09            [ 1] 3365 	and a,#7
      00914C 72               [ 1] 3366 	swap a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00914D 15 00 24         [ 1] 3367 	ld ADC_CR1,a
      009150 72 5C 00 21      [ 1] 3368 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009154 81 10 54 01      [ 1] 3369 	bset ADC_CR1,#ADC_CR1_ADON 
      009155                       3370 	_usec_dly 7 
      009155 72 5D 00         [ 2]    1     ldw x,#(16*7-2)/4
      009158 21               [ 2]    2     decw x
      009159 26               [ 1]    3     nop 
      00915A 03 CC            [ 1]    4     jrne .-4
      00915C 87 A0            [ 2] 3371 	jra 3$
      00915E 72 11 54 01      [ 1] 3372 2$: bres ADC_CR1,#ADC_CR1_ADON
      00915E A6 85 CD 8C      [ 1] 3373 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001284                       3374 3$:	_drop VSIZE 
      009162 38 13            [ 2]    1     addw sp,#VSIZE 
      009164 07               [ 4] 3375 	ret
                                   3376 
                                   3377 ;-----------------------------
                                   3378 ; BASIC: ADCREAD (channel)
                                   3379 ; read adc channel {0..5}
                                   3380 ; output:
                                   3381 ;   A 		TK_INTGR 
                                   3382 ;   X 		value 
                                   3383 ;-----------------------------
      001287                       3384 analog_read:
      009165 27 03 CC         [ 4] 3385 	call func_args 
      009168 87 A0            [ 1] 3386 	cp a,#1 
      00916A 27 03            [ 1] 3387 	jreq 1$
      00916A FE 72 FB         [ 2] 3388 	jp syntax_error
      00916D 03               [ 2] 3389 1$: popw x 
      00916E 16 07 90         [ 2] 3390 	cpw x,#5 
      009171 FF A6            [ 2] 3391 	jrule 2$
      009173 80 15            [ 1] 3392 	ld a,#ERR_BAD_VALUE
      009175 03 2A 06         [ 2] 3393 	jp tb_error 
      009178 13               [ 1] 3394 2$: ld a,xl
      009179 05 2F 1B         [ 1] 3395 	ld acc8,a 
      00917C 20 04            [ 1] 3396 	ld a,#5
      00917E C0 00 0D         [ 1] 3397 	sub a,acc8 
      00917E 13 05 2C         [ 1] 3398 	ld ADC_CSR,a
      009181 15 16 54 02      [ 1] 3399 	bset ADC_CR2,#ADC_CR2_ALIGN
      009182 72 10 54 01      [ 1] 3400 	bset ADC_CR1,#ADC_CR1_ADON
      009182 1E 0B CF 00 05   [ 2] 3401 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009187 72 01 00         [ 2] 3402 	ldw x,ADC_DRH
      00918A 24 05            [ 1] 3403 	ld a,#TK_INTGR
      00918C E6               [ 4] 3404 	ret 
                                   3405 
                                   3406 ;-----------------------
                                   3407 ; BASIC: DREAD(pin)
                                   3408 ; Arduino pins 
                                   3409 ; read state of a digital pin 
                                   3410 ; pin# {0..15}
                                   3411 ; output:
                                   3412 ;    A 		TK_INTGR
                                   3413 ;    X      0|1 
                                   3414 ;-------------------------
                           000001  3415 	PINNO=1
                           000001  3416 	VSIZE=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0012BB                       3417 digital_read:
      0012BB                       3418 	_vars VSIZE 
      00918D 02 C7            [ 2]    1     sub sp,#VSIZE 
      00918F 00 04 1E         [ 4] 3419 	call func_args
      009192 09 CF            [ 1] 3420 	cp a,#1
      009194 00 01            [ 1] 3421 	jreq 1$
      009196 81 07 20         [ 2] 3422 	jp syntax_error
      009197 85               [ 2] 3423 1$: popw x 
      009197 85 5B 0A         [ 2] 3424 	cpw x,#15 
      00919A 72 5A            [ 2] 3425 	jrule 2$
      00919C 00 21            [ 1] 3426 	ld a,#ERR_BAD_VALUE
      00919E FC 07 22         [ 2] 3427 	jp tb_error 
      00919F CD 19 0B         [ 4] 3428 2$:	call select_pin 
      00919F CD 8D            [ 1] 3429 	ld (PINNO,sp),a
      0091A1 92 A1            [ 1] 3430 	ld a,(GPIO_IDR,x)
      0091A3 84 27            [ 1] 3431 	tnz (PINNO,sp)
      0091A5 03 CC            [ 1] 3432 	jreq 8$
      0091A7 87               [ 1] 3433 3$: srl a 
      0091A8 A0 4F            [ 1] 3434 	dec (PINNO,sp)
      0091AA 90 CE            [ 1] 3435 	jrne 3$ 
      0091AC 00 05            [ 1] 3436 8$: and a,#1 
      0091AE 90               [ 1] 3437 	clrw x 
      0091AF FE               [ 1] 3438 	ld xl,a 
      0091B0 90 89            [ 1] 3439 	ld a,#TK_INTGR
      0012E8                       3440 	_drop VSIZE
      0091B2 13 01            [ 2]    1     addw sp,#VSIZE 
      0091B4 5B               [ 4] 3441 	ret
                                   3442 
                                   3443 ;-----------------------
                                   3444 ; BASIC: DWRITE pin,0|1
                                   3445 ; Arduino pins 
                                   3446 ; write to a digital pin 
                                   3447 ; pin# {0..15}
                                   3448 ; output:
                                   3449 ;    A 		TK_INTGR
                                   3450 ;    X      0|1 
                                   3451 ;-------------------------
                           000001  3452 	PINNO=1
                           000002  3453 	PINVAL=2
                           000002  3454 	VSIZE=2
      0012EB                       3455 digital_write:
      0012EB                       3456 	_vars VSIZE 
      0091B5 02 25            [ 2]    1     sub sp,#VSIZE 
      0091B7 01 4C CA         [ 4] 3457 	call arg_list  
      0091B9 A1 02            [ 1] 3458 	cp a,#2 
      0091B9 CD A5            [ 1] 3459 	jreq 1$
      0091BB 28 5D 26         [ 2] 3460 	jp syntax_error
      0091BE 05               [ 2] 3461 1$: popw x 
      0091BF A6               [ 1] 3462 	ld a,xl 
      0091C0 05 CC            [ 1] 3463 	ld (PINVAL,sp),a
      0091C2 87               [ 2] 3464 	popw x 
      0091C3 A2 81 0F         [ 2] 3465 	cpw x,#15 
      0091C5 23 05            [ 2] 3466 	jrule 2$
      0091C5 72 00            [ 1] 3467 	ld a,#ERR_BAD_VALUE
      0091C7 00 24 06         [ 2] 3468 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0091CA A6 06 CC         [ 4] 3469 2$:	call select_pin 
      0091CD 87 A2            [ 1] 3470 	ld (PINNO,sp),a 
      0091CF 81 CD            [ 1] 3471 	ld a,#1
      0091D1 91 9F            [ 1] 3472 	tnz (PINNO,sp)
      0091D3 27 05            [ 1] 3473 	jreq 4$
      0091D3 CF               [ 1] 3474 3$: sll a
      0091D4 00 05            [ 1] 3475 	dec (PINNO,sp)
      0091D6 E6 02            [ 1] 3476 	jrne 3$
      0091D8 C7 00            [ 1] 3477 4$: tnz (PINVAL,sp)
      0091DA 04 35            [ 1] 3478 	jrne 5$
      0091DC 03               [ 1] 3479 	cpl a 
      0091DD 00 02            [ 1] 3480 	and a,(GPIO_ODR,x)
      0091DF 81 02            [ 2] 3481 	jra 8$
      0091E0 EA 00            [ 1] 3482 5$: or a,(GPIO_ODR,x)
      0091E0 72 00            [ 1] 3483 8$: ld (GPIO_ODR,x),a 
      001323                       3484 	_drop VSIZE 
      0091E2 00 24            [ 2]    1     addw sp,#VSIZE 
      0091E4 06               [ 4] 3485 	ret
                                   3486 
                                   3487 
                                   3488 ;-----------------------
                                   3489 ; BASIC: STOP
                                   3490 ; stop progam execution  
                                   3491 ; without resetting pointers 
                                   3492 ; the program is resumed
                                   3493 ; with RUN 
                                   3494 ;-------------------------
      001326                       3495 stop:
      0091E5 A6 06 CC 87 A2   [ 2] 3496 	btjt flags,#FRUN,2$
      0091EA 81               [ 1] 3497 	clr a
      0091EB 85               [ 4] 3498 	ret 
      00132D                       3499 2$:	 
                                   3500 ; create space on cstack to save context 
      0091EC 52 04 89         [ 2] 3501 	ldw x,#break_point 
      0091EF CE 00 05         [ 4] 3502 	call puts 
      001333                       3503 	_drop 2 ;drop return address 
      0091F2 1F 03            [ 2]    1     addw sp,#2 
      001335                       3504 	_vars CTXT_SIZE ; context size 
      0091F4 CD 91            [ 2]    1     sub sp,#CTXT_SIZE 
      0091F6 9F 89 CE         [ 4] 3505 	call save_context 
      0091F9 00 01 1F         [ 2] 3506 	ldw x,#tib 
      0091FC 07 85 20         [ 2] 3507 	ldw basicptr,x
      0091FF D3               [ 1] 3508 	clr (x)
      009200 72 5F 00 03      [ 1] 3509 	clr count  
      009200 72               [ 1] 3510 	clrw x 
      009201 00 00 24         [ 2] 3511 	ldw in.w,x
      009204 05 A6 06 CC      [ 1] 3512 	bres flags,#FRUN 
      009208 87 A2 00 23      [ 1] 3513 	bset flags,#FBREAK
      00920A CC 07 C6         [ 2] 3514 	jp interpreter 
      00920A 1E 03 CF 00 05 E6 02  3515 break_point: .asciz "\nbreak point, RUN to resume.\n"
             C7 00 04 1E 05 CF 00
             01 85 5B 04 89 81 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3516 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3517 ;-----------------------
                                   3518 ; BASIC: NEW
                                   3519 ; from command line only 
                                   3520 ; free program memory
                                   3521 ; and clear variables 
                                   3522 ;------------------------
      00921E                       3523 new: 
      00921E 72 01 00 24 02   [ 2] 3524 	btjf flags,#FRUN,0$ 
      009223 4F               [ 4] 3525 	ret 
      001378                       3526 0$:	
      009224 81 05 8A         [ 4] 3527 	call clear_basic 
      009225 81               [ 4] 3528 	ret 
                                   3529 	 
                                   3530 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3531 ;  file system routines
                                   3532 ;  MCU flash memory from
                                   3533 ;  0x10000-0x27fff is 
                                   3534 ;  used to store BASIC 
                                   3535 ;  program files. 
                                   3536 ;  use 128 bytes sectors
                                   3537 ;  because this is the MCU 
                                   3538 ;  row size.
                                   3539 ;  file entry aligned to row
                                   3540 ;  	name  variable length
                                   3541 ;  	size  2 bytes  
                                   3542 ; 	data  variable length 
                                   3543 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3544 
                                   3545 ;---------------------------
                                   3546 ; fill pad with zeros 
                                   3547 ;--------------------------
      00137C                       3548 zero_pad:
      009225 72 09 00         [ 2] 3549 	ldw x,#pad 
      009228 24 12            [ 1] 3550 	ld a,#PAD_SIZE 
      00922A 5B               [ 1] 3551 1$:	clr (x)
      00922B 02               [ 1] 3552 	incw x 
      00922C CD               [ 1] 3553 	dec a 
      00922D 8F 9E            [ 1] 3554 	jrne 1$
      00922F 5B               [ 4] 3555 	ret 
                                   3556 
                                   3557 ;--------------------------
                                   3558 ; align farptr to BLOCK_SIZE 
                                   3559 ;---------------------------
      001387                       3560 row_align:
      009230 04 72            [ 1] 3561 	ld a,#0x7f 
      009232 19 00 24         [ 1] 3562 	and a,farptr+2 
      009235 72 10            [ 1] 3563 	jreq 1$ 
      009237 00 24 CC         [ 2] 3564 	ldw x,farptr+1 
      00923A 88 46 CE         [ 2] 3565 	addw x,#BLOCK_SIZE 
      00923D 00 1D            [ 1] 3566 	jrnc 0$
      00923F C3 00 1F 2B      [ 1] 3567 	inc farptr 
      009243 0C               [ 1] 3568 0$: ld a,xl 
      009244 AE 87            [ 1] 3569 	and a,#0x80
      009246 39               [ 1] 3570 	ld xl,a
      009247 CD A2 40         [ 2] 3571 	ldw farptr+1,x  	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00924A 55               [ 4] 3572 1$:	ret
                                   3573 
                                   3574 ;--------------------
                                   3575 ; input:
                                   3576 ;   X     increment 
                                   3577 ; output:
                                   3578 ;   farptr  incremented 
                                   3579 ;---------------------
      0013A2                       3580 incr_farptr:
      00924B 00 04 00 02      [ 2] 3581 	addw x,farptr+1 
      00924F 81 04            [ 1] 3582 	jrnc 1$
      009250 72 5C 00 16      [ 1] 3583 	inc farptr 
      009250 CD 8E 3F         [ 2] 3584 1$:	ldw farptr+1,x  
      009253 5B               [ 4] 3585 	ret 
                                   3586 
                                   3587 ;------------------------------
                                   3588 ; extended flash memory used as FLASH_DRIVE 
                                   3589 ; seek end of used flash drive   
                                   3590 ; starting at 0x10000 address.
                                   3591 ; 4 consecutives 0 bytes signal free space. 
                                   3592 ; input:
                                   3593 ;	none
                                   3594 ; output:
                                   3595 ;   ffree     free_addr| 0 if memory full.
                                   3596 ;------------------------------
      0013B0                       3597 seek_fdrive:
                                   3598 ; start scan at 0x10000 address 
      009254 02 5F            [ 1] 3599 	ld a,#1
      009256 CF 00 07         [ 1] 3600 	ld farptr,a 
      009259 72               [ 1] 3601 	clrw x 
      00925A 5F 00 09         [ 2] 3602 	ldw farptr+1,x 
      0013B9                       3603 1$:
      00925D 72 5F 00         [ 2] 3604 	ldw x,#3  
      009260 0A CE 00 1D      [ 5] 3605 2$:	ldf a,([farptr],x) 
      009264 CF 00            [ 1] 3606 	jrne 3$
      009266 05               [ 2] 3607 	decw x
      009267 E6 02            [ 1] 3608 	jrpl 2$
      009269 C7 00            [ 2] 3609 	jra 4$ 
      00926B 04 35 03         [ 2] 3610 3$:	ldw x,#BLOCK_SIZE 
      00926E 00 02 72         [ 4] 3611 	call incr_farptr
      009271 10 00 24         [ 2] 3612 	ldw x,#0x280  
      009274 CC 88 46         [ 2] 3613 	cpw x,farptr
      009277 22 E4            [ 1] 3614 	jrugt 1$
      0013D5                       3615 4$: ; copy farptr to ffree	 
      009277 AE 17 FF         [ 2] 3616 	ldw x,farptr 
      00927A 94 CC 88         [ 1] 3617 	ld a,farptr+2 
      00927D 27 00 19         [ 2] 3618 	ldw ffree,x 
      00927E C7 00 1B         [ 1] 3619 	ld ffree+2,a  
      00927E AE               [ 4] 3620 	ret 
                                   3621 
                                   3622 ;-----------------------
                                   3623 ; return amount of free 
                                   3624 ; space on flash drive
                                   3625 ; input:
                                   3626 ;   none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3627 ; output:
                                   3628 ;   acc24   free space 
                                   3629 ;-----------------------
      0013E2                       3630 disk_free:
      00927F 00 64 90         [ 2] 3631 	ldw x,#0x8000
      009282 AE 03 E8 20      [ 2] 3632 	subw x,ffree+1
      009286 0D 02            [ 1] 3633 	ld a,#2
      009287 C2 00 19         [ 1] 3634 	sbc a,ffree 
      009287 CD 8C 4A         [ 1] 3635 	ld acc24,a 
      00928A A1 02 27         [ 2] 3636 	ldw acc16,x 
      00928D 03               [ 4] 3637 	ret 
                                   3638 
                                   3639 ;-----------------------
                                   3640 ; compare file name 
                                   3641 ; with name pointed by Y  
                                   3642 ; input:
                                   3643 ;   farptr   file name 
                                   3644 ;   Y        target name 
                                   3645 ; output:
                                   3646 ;   farptr 	 at file_name
                                   3647 ;   X 		 farptr[x] point at size field  
                                   3648 ;   Carry    0|1 no match|match  
                                   3649 ;----------------------
      0013F5                       3650 cmp_name:
      00928E CC               [ 1] 3651 	clrw x
      00928F 87 A0 00 16      [ 5] 3652 1$:	ldf a,([farptr],x)
      009291 90 F1            [ 1] 3653 	cp a,(y)
      009291 85 90            [ 1] 3654 	jrne 4$
      009293 85               [ 1] 3655 	tnz a 
      009294 27 12            [ 1] 3656 	jreq 9$ 
      009294 89               [ 1] 3657     incw x 
      009295 AE F4            [ 1] 3658 	incw y 
      009297 24 65            [ 2] 3659 	jra 1$
      001406                       3660 4$: ;no match 
      009299 90               [ 1] 3661 	tnz a 
      00929A A3 7A            [ 1] 3662 	jreq 5$
      00929C 12               [ 1] 3663 	incw x 
      00929D 2B 01 5C 16      [ 5] 3664 	ldf a,([farptr],x)
      0092A0 20 F6            [ 2] 3665 	jra 4$  
      0092A0 9E               [ 1] 3666 5$:	incw x ; farptr[x] point at 'size' field 
      0092A1 C7               [ 1] 3667 	rcf 
      0092A2 53               [ 4] 3668 	ret
      001413                       3669 9$: ; match  
      0092A3 0D               [ 1] 3670 	incw x  ; farptr[x] at 'size' field 
      0092A4 9F               [ 1] 3671 	scf 
      0092A5 C7               [ 4] 3672 	ret 
                                   3673 
                                   3674 ;-----------------------
                                   3675 ; search file in 
                                   3676 ; flash memory 
                                   3677 ; input:
                                   3678 ;   Y       file name  
                                   3679 ; output:
                                   3680 ;   farptr  addr at name|0
                                   3681 ;   X       offset to size field
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3682 ;   Carray   0 not found, 1 found 
                                   3683 ;-----------------------
                           000001  3684 	FSIZE=1
                           000003  3685 	YSAVE=3
                           000004  3686 	VSIZE=4 
      001416                       3687 search_file: 
      001416                       3688 	_vars VSIZE
      0092A6 53 0E            [ 2]    1     sub sp,#VSIZE 
      0092A8 8C 56            [ 2] 3689 	ldw (YSAVE,sp),y  
      0092AA 9E               [ 1] 3690 	clrw x 
      0092AB C7 53 0F         [ 2] 3691 	ldw farptr+1,x 
      0092AE 9F C7 53 10      [ 1] 3692 	mov farptr,#1
      001422                       3693 1$:	
                                   3694 ; check if farptr is after any file 
                                   3695 ; if  0 then so.
      0092B2 72 10 53 08      [ 5] 3696 	ldf a,[farptr]
      0092B6 72 10            [ 1] 3697 	jreq 6$
      0092B8 53               [ 1] 3698 2$: clrw x 	
      0092B9 00 72            [ 2] 3699 	ldw y,(YSAVE,sp) 
      0092BB 10 53 04         [ 4] 3700 	call cmp_name
      0092BE 85 CD            [ 1] 3701 	jrc 9$
      0092C0 98 4D 72 11      [ 5] 3702 	ldf a,([farptr],x)
      0092C4 53 08            [ 1] 3703 	ld (FSIZE,sp),a 
      0092C6 72               [ 1] 3704 	incw x 
      0092C7 11 53 00 81      [ 5] 3705 	ldf a,([farptr],x)
      0092CB 6B 02            [ 1] 3706 	ld (FSIZE+1,sp),a 
      0092CB CD               [ 1] 3707 	incw x 
      0092CC 8C 4A A1         [ 2] 3708 	addw x,(FSIZE,sp) ; skip over file data
      0092CF 02 27 0B         [ 4] 3709 	call incr_farptr
      0092D2 A1 01 27         [ 4] 3710 	call row_align  
      0092D5 03 CC 87         [ 2] 3711 	ldw x,#0x280
      0092D8 A0 AE 00         [ 2] 3712 	cpw x,farptr 
      0092DB 00 89            [ 1] 3713 	jrpl 1$
      00144F                       3714 6$: ; file not found 
      0092DD 1E 03 5D 27      [ 1] 3715 	clr farptr
      0092E1 1A 1E 01 9F      [ 1] 3716 	clr farptr+1 
      0092E5 A4 07 4E C7      [ 1] 3717 	clr farptr+2 
      00145B                       3718 	_drop VSIZE 
      0092E9 54 01            [ 2]    1     addw sp,#VSIZE 
      0092EB 72               [ 1] 3719 	rcf
      0092EC 16               [ 4] 3720 	ret
      00145F                       3721 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      00145F                       3722 	_drop VSIZE 
      0092ED 50 CA            [ 2]    1     addw sp,#VSIZE 
      0092EF 72               [ 1] 3723 	scf 	
      0092F0 10               [ 4] 3724 	ret
                                   3725 
                                   3726 ;--------------------------------
                                   3727 ; BASIC: SAVE "name" 
                                   3728 ; save text program in 
                                   3729 ; flash memory used as permanent
                                   3730 ; storage from address 0x10000-0x27fff 
                                   3731 ;--------------------------------
                           000001  3732 	BSIZE=1
                           000003  3733 	NAMEPTR=3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                           000005  3734 	XSAVE=5
                           000007  3735 	YSAVE=7
                           000008  3736 	VSIZE=8 
      001463                       3737 save:
      0092F1 54 01 AE 00 1B   [ 2] 3738 	btjf flags,#FRUN,0$ 
      0092F6 5A 9D            [ 1] 3739 	ld a,#ERR_CMD_ONLY 
      0092F8 26 FA 20         [ 2] 3740 	jp tb_error
      00146D                       3741 0$:	 
      0092FB 08 72 11         [ 2] 3742 	ldw x,txtend 
      0092FE 54 01 72 17      [ 2] 3743 	subw x,txtbgn
      009302 50 CA            [ 1] 3744 	jrne 1$
                                   3745 ; nothing to save 
      009304 5B 04 81         [ 2] 3746 	ldw x,#err_no_prog 
      009307 CD 00 00         [ 4] 3747 	call puts 
      009307 CD 8C 45 A1 01   [ 1] 3748 	mov in,count 
      00930C 27               [ 4] 3749 	ret  	
      001482                       3750 1$:	
      001482                       3751 	_vars VSIZE 
      00930D 03 CC            [ 2]    1     sub sp,#VSIZE 
      00930F 87 A0            [ 2] 3752 	ldw (BSIZE,sp),x 
      009311 85 A3 00         [ 4] 3753 	call next_token	
      009314 05 23            [ 1] 3754 	cp a,#TK_QSTR
      009316 05 A6            [ 1] 3755 	jreq 2$
      009318 0A CC 87         [ 2] 3756 	jp syntax_error
      001490                       3757 2$: 
      00931B A2 9F            [ 2] 3758 	ldw (NAMEPTR,sp),x  
      00931D C7 00 0E         [ 4] 3759 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   3760 ; check if enough free space 
      009320 A6 05            [ 2] 3761 	ldw x,(NAMEPTR,sp)
      009322 C0 00 0E         [ 4] 3762 	call strlen 
      009325 C7 54            [ 1] 3763 	add a,#3
      009327 00               [ 1] 3764 	clrw x 
      009328 72               [ 1] 3765 	ld xl,a 
      009329 16 54 02         [ 2] 3766 	addw x,(BSIZE,sp)
      00932C 72               [ 1] 3767 	clr a 
      00932D 10 54 01 72      [ 2] 3768 	addw x,ffree+1 
      009331 0F 54 00         [ 1] 3769 	adc a,ffree 
      009334 FB CE            [ 1] 3770 	cp a,#2
      009336 54 04            [ 1] 3771 	jrmi 21$
      009338 A6 84 81         [ 2] 3772 	cpw x,#0x8000
      00933B 2B 05            [ 1] 3773 	jrmi 21$
      00933B 52 01            [ 1] 3774 	ld a,#ERR_NO_FSPACE  
      00933D CD 8C 45         [ 2] 3775 	jp tb_error
      0014B7                       3776 21$: 
                                   3777 ; check for existing file of that name 
      009340 A1 01            [ 2] 3778 	ldw y,(NAMEPTR,sp)	
      009342 27 03 CC         [ 4] 3779 	call search_file 
      009345 87 A0            [ 1] 3780 	jrnc 3$ 
      009347 85 A3            [ 1] 3781 	ld a,#ERR_DUPLICATE 
      009349 00 0F 23         [ 2] 3782 	jp tb_error 
      0014C3                       3783 3$:	; initialize farptr 
      00934C 05 A6 0A         [ 2] 3784 	ldw x,ffree 
      00934F CC 87 A2         [ 1] 3785 	ld a,ffree+2 
      009352 CD 99 8B         [ 2] 3786 	ldw farptr,x 
      009355 6B 01 E6         [ 1] 3787 	ld farptr+2,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3788 ;** write file name to row buffer **	
      009358 01 0D            [ 2] 3789 	ldw y,(NAMEPTR,sp)  
      00935A 01 27 05         [ 2] 3790 	ldw x,#pad 
      00935D 44 0A 01         [ 4] 3791 	call strcpy
      009360 26 FB A4         [ 4] 3792 	call strlen 
      009363 01               [ 1] 3793 	clrw x 
      009364 5F               [ 1] 3794 	ld xl,a 
      009365 97               [ 1] 3795 	incw  x
      009366 A6 84 5B         [ 2] 3796 	addw x,#pad 
                                   3797 ; ** write file size to row buffer 
      009369 01 81            [ 2] 3798 	ldw y,(BSIZE,sp)
      00936B FF               [ 2] 3799 	ldw (x),y 
      00936B 52 02 CD         [ 2] 3800 	addw x,#2 
                                   3801 ; ** write file data to row buffer 
      00936E 8C 4A A1 02      [ 2] 3802 	ldw y,txtbgn 
      009372 27 03            [ 1] 3803 6$:	ld a,(y)
      009374 CC 87            [ 1] 3804 	incw y
      009376 A0               [ 1] 3805 	ld (x),a 
      009377 85               [ 1] 3806 	incw x
      009378 9F 6B 02 85      [ 2] 3807 	cpw y,txtend 
      00937C A3 00            [ 1] 3808 	jreq 12$
      00937E 0F 23 05         [ 2] 3809 	cpw x,#stack_full 
      009381 A6 0A            [ 1] 3810 	jrmi 6$
      0014FB                       3811 12$:
      009383 CC 87            [ 2] 3812 	ldw (YSAVE,sp),y 
      0014FD                       3813 14$: ; zero buffer end 
      009385 A2 CD 99         [ 2] 3814 	cpw x,#stack_full
      009388 8B 6B            [ 1] 3815 	jreq 16$
      00938A 01               [ 1] 3816 	clr (x)
      00938B A6               [ 1] 3817 	incw x 
      00938C 01 0D            [ 2] 3818 	jra 14$
      001506                       3819 16$:
      00938E 01 27 05         [ 2] 3820 	ldw x,#pad 
      009391 48 0A 01         [ 4] 3821 	call write_row 
      009394 26 FB 0D         [ 2] 3822 	ldw x,#BLOCK_SIZE 
      009397 02 26 05         [ 4] 3823 	call incr_farptr
      00939A 43 E4 00         [ 2] 3824 	ldw x,#pad 
      00939D 20 02            [ 2] 3825 	ldw y,(YSAVE,sp)
      00939F EA 00 E7 00      [ 2] 3826 	cpw y,txtend 
      0093A3 5B 02            [ 1] 3827 	jrmi 6$
                                   3828 ; save farptr in ffree
      0093A5 81 00 16         [ 2] 3829 	ldw x,farptr 
      0093A6 C6 00 18         [ 1] 3830 	ld a,farptr+2 
      0093A6 72 00 00         [ 2] 3831 	ldw ffree,x 
      0093A9 24 02 4F         [ 1] 3832 	ld ffree+2,a
                                   3833 ; print file size 	
      0093AC 81 01            [ 2] 3834 	ldw x,(BSIZE,sp) 
      0093AD CD 08 6D         [ 4] 3835 	call print_int 
      00152E                       3836 	_drop VSIZE 
      0093AD AE 93            [ 2]    1     addw sp,#VSIZE 
      0093AF D4               [ 4] 3837 	ret 
                                   3838 
                                   3839 ;----------------------
                                   3840 ; load file in RAM memory
                                   3841 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3842 ;    farptr point at file size 
                                   3843 ; output:
                                   3844 ;   y point after BASIC program in RAM.
                                   3845 ;------------------------
      001531                       3846 load_file:
      0093B0 CD A2 40         [ 4] 3847 	call incr_farptr  
      0093B3 5B 02 52         [ 4] 3848 	call clear_basic  
      0093B6 04               [ 1] 3849 	clrw x
      0093B7 CD 8F 8E AE      [ 5] 3850 	ldf a,([farptr],x)
      0093BB 16 90            [ 1] 3851 	ld yh,a 
      0093BD CF               [ 1] 3852 	incw x  
      0093BE 00 05 7F 72      [ 5] 3853 	ldf a,([farptr],x)
      0093C2 5F               [ 1] 3854 	incw x 
      0093C3 00 04            [ 1] 3855 	ld yl,a 
      0093C5 5F CF 00 01      [ 2] 3856 	addw y,txtbgn
      0093C9 72 11 00 24      [ 2] 3857 	ldw txtend,y
      0093CD 72 18 00 24      [ 2] 3858 	ldw y,txtbgn
      001552                       3859 3$:	; load BASIC text 	
      0093D1 CC 88 46 0A      [ 5] 3860 	ldf a,([farptr],x)
      0093D5 62 72            [ 1] 3861 	ld (y),a 
      0093D7 65               [ 1] 3862 	incw x 
      0093D8 61 6B            [ 1] 3863 	incw y 
      0093DA 20 70 6F 69      [ 2] 3864 	cpw y,txtend 
      0093DE 6E 74            [ 1] 3865 	jrmi 3$
      0093E0 2C               [ 4] 3866 	ret 
                                   3867 
                                   3868 ;------------------------
                                   3869 ; BASIC: LOAD "file" 
                                   3870 ; load file to RAM 
                                   3871 ; for execution 
                                   3872 ;------------------------
      001562                       3873 load:
      0093E1 20 52 55 4E 20   [ 2] 3874 	btjf flags,#FRUN,0$ 
      0093E6 74 6F            [ 1] 3875 	jreq 0$ 
      0093E8 20 72            [ 1] 3876 	ld a,#ERR_CMD_ONLY 
      0093EA 65 73 75         [ 2] 3877 	jp tb_error 
      00156E                       3878 0$:	
      0093ED 6D 65 2E         [ 4] 3879 	call next_token 
      0093F0 0A 00            [ 1] 3880 	cp a,#TK_QSTR
      0093F2 27 03            [ 1] 3881 	jreq 1$
      0093F2 72 01 00         [ 2] 3882 	jp syntax_error 
      0093F5 24 01            [ 1] 3883 1$:	ldw y,x 
      0093F7 81 14 16         [ 4] 3884 	call search_file 
      0093F8 25 05            [ 1] 3885 	jrc 2$ 
      0093F8 CD 86            [ 1] 3886 	ld a,#ERR_NOT_FILE
      0093FA 0A 81 22         [ 2] 3887 	jp tb_error  
      0093FC                       3888 2$:
      0093FC AE 16 E0         [ 4] 3889 	call load_file
                                   3890 ; print loaded size 	 
      0093FF A6 80 7F         [ 2] 3891 	ldw x,txtend 
      009402 5C 4A 26 FB      [ 2] 3892 	subw x,txtbgn
      009406 81 08 6D         [ 4] 3893 	call print_int 
      009407 81               [ 4] 3894 	ret 
                                   3895 
                                   3896 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3897 ; BASIC: FORGET ["file_name"] 
                                   3898 ; erase file_name and all others 
                                   3899 ; after it. 
                                   3900 ; without argument erase all files 
                                   3901 ;-----------------------------------
                           000001  3902 	NEW_FREE=1   ; free address after file delete
                           000004  3903 	BLOCK_COUNT=4  ; how many rows to delete
                           000005  3904 	VSIZE=5 
      001592                       3905 forget:
      001592                       3906 	_vars VSIZE 
      009407 A6 7F            [ 2]    1     sub sp,#VSIZE 
      009409 C4 00 19         [ 4] 3907 	call next_token 
      00940C 27 13            [ 1] 3908 	cp a,#TK_NONE 
      00940E CE 00            [ 1] 3909 	jreq 2$ 
      009410 18 1C            [ 1] 3910 	cp a,#TK_QSTR
      009412 00 80            [ 1] 3911 	jreq 1$
      009414 24 04 72         [ 2] 3912 	jp syntax_error
      009417 5C 00            [ 1] 3913 1$: ldw y,x 
      009419 17 9F A4 80 97   [ 1] 3914 	mov in,count 
      00941E CF 00 18         [ 4] 3915 	call search_file
      009421 81 0F            [ 1] 3916 	jrc 3$
      009422 A6 09            [ 1] 3917 	ld a,#ERR_NOT_FILE 
      009422 72 BB 00         [ 2] 3918 	jp tb_error 
      0015B3                       3919 2$: 
      009425 18 24 04         [ 2] 3920 	ldw x,#0x100
      009428 72               [ 1] 3921 	clr a 
      009429 5C 00 17         [ 2] 3922 	ldw farptr,x 
      00942C CF 00 18         [ 1] 3923 	ld farptr+2,a 
      00942F 81 00 18         [ 1] 3924 3$:	ld a,farptr+2 
      009430 CE 00 16         [ 2] 3925 	ldw x,farptr 
                                   3926 ; save new free address 
      009430 A6 01            [ 2] 3927 	ldw (NEW_FREE,sp),x
      009432 C7 00            [ 1] 3928 	ld (NEW_FREE+2,sp),a 
                                   3929 ; count blocks to erase 
      009434 17 5F CF         [ 1] 3930 	ld a,ffree+2 
      009437 00 18 19         [ 2] 3931 	ldw x,ffree 
      009439 C0 00 18         [ 1] 3932 	sub a,farptr+2 
      009439 AE 00            [ 1] 3933 	jrnc 4$
      00943B 03               [ 2] 3934 	decw x 
      00943C 92 AF 00 17      [ 2] 3935 4$:	subw x,farptr 
                                   3936 ; X= X:A/BLOCK_SIZE 
      009440 26               [ 1] 3937 	sll a 
      009441 05               [ 2] 3938 	rlcw x 
      009442 5A 2A            [ 2] 3939 	ldw (BLOCK_COUNT,sp),x
      009444 F7 20 0E         [ 4] 3940 	call move_erase_to_ram
      009447 AE 00            [ 2] 3941 5$: ldw x,(BLOCK_COUNT,sp)
      009449 80               [ 2] 3942 	tnzw x
      00944A CD 94            [ 1] 3943 	jreq 6$
      00944C 22 AE 02         [ 4] 3944 	call block_erase 
      00944F 80 C3 00         [ 2] 3945 	ldw x,#BLOCK_SIZE 
      009452 17 22 E4         [ 4] 3946 	call incr_farptr 
      009455 1E 04            [ 2] 3947 	ldw x,(BLOCK_COUNT,sp)
      009455 CE               [ 2] 3948 	decw x 
      009456 00 17            [ 2] 3949 	ldw (BLOCK_COUNT,sp),x
      009458 C6 00            [ 2] 3950 	jra 5$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3951 ; save new free address
      00945A 19 CF            [ 1] 3952 6$:	ld a,(NEW_FREE+2,sp)
      00945C 00 1A            [ 2] 3953 	ldw x,(NEW_FREE,sp)
      00945E C7 00 1C         [ 1] 3954 	ld ffree+2,a 
      009461 81 00 19         [ 2] 3955 	ldw ffree,x 
      009462                       3956 	_drop VSIZE 
      009462 AE 80            [ 2]    1     addw sp,#VSIZE 
      009464 00               [ 4] 3957 	ret 
                                   3958 
                                   3959 ;----------------------
                                   3960 ; BASIC: DIR 
                                   3961 ; list saved files 
                                   3962 ;----------------------
                           000001  3963 	COUNT=1 ; files counter 
                           000002  3964 	VSIZE=2 
      001600                       3965 directory:
      001600                       3966 	_vars VSIZE 
      009465 72 B0            [ 2]    1     sub sp,#VSIZE 
      009467 00               [ 1] 3967 	clrw x 
      009468 1B A6            [ 2] 3968 	ldw (COUNT,sp),x 
      00946A 02 C2 00         [ 2] 3969 	ldw farptr+1,x 
      00946D 1A C7 00 0C      [ 1] 3970 	mov farptr,#1 
      00160C                       3971 dir_loop:
      009471 CF               [ 1] 3972 	clrw x 
      009472 00 0D 81 16      [ 5] 3973 	ldf a,([farptr],x)
      009475 27 3B            [ 1] 3974 	jreq 8$ 
      001613                       3975 1$: ;name loop 	
      009475 5F 92 AF 00      [ 5] 3976 	ldf a,([farptr],x)
      009479 17 90            [ 1] 3977 	jreq 2$ 
      00947B F1 26 08         [ 4] 3978 	call putc 
      00947E 4D               [ 1] 3979 	incw x 
      00947F 27 12            [ 2] 3980 	jra 1$
      009481 5C               [ 1] 3981 2$: incw x ; skip ending 0. 
      009482 90 5C            [ 1] 3982 	ld a,#SPACE 
      009484 20 F0 C2         [ 4] 3983 	call putc 
                                   3984 ; get file size 	
      009486 92 AF 00 16      [ 5] 3985 	ldf a,([farptr],x)
      009486 4D 27            [ 1] 3986 	ld yh,a 
      009488 07               [ 1] 3987 	incw x 
      009489 5C 92 AF 00      [ 5] 3988 	ldf a,([farptr],x)
      00948D 17               [ 1] 3989 	incw x 
      00948E 20 F6            [ 1] 3990 	ld yl,a 
      009490 5C 98            [ 2] 3991 	pushw y 
      009492 81 FB 01         [ 2] 3992 	addw x,(1,sp)
                                   3993 ; skip to next file 
      009493 CD 13 A2         [ 4] 3994 	call incr_farptr
      009493 5C 99 81         [ 4] 3995 	call row_align
                                   3996 ; print file size 
      009496 85               [ 2] 3997 	popw x ; file size 
      009496 52 04 17         [ 4] 3998 	call print_int 
      009499 03 5F            [ 1] 3999 	ld a,#CR 
      00949B CF 00 18         [ 4] 4000 	call putc
      00949E 35 01            [ 2] 4001 	ldw x,(COUNT,sp)
      0094A0 00               [ 1] 4002 	incw x
      0094A1 17 01            [ 2] 4003 	ldw (COUNT,sp),x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0094A2 20 BE            [ 2] 4004 	jra dir_loop
      00164E                       4005 8$: ; print number of files 
      0094A2 92 BC            [ 2] 4006 	ldw x,(COUNT,sp)
      0094A4 00 17 27         [ 4] 4007 	call print_int 
      0094A7 27 5F 16         [ 2] 4008 	ldw x,#file_count 
      0094AA 03 CD 94         [ 4] 4009 	call puts  
                                   4010 ; print drive free space 	
      0094AD 75 25 2F         [ 4] 4011 	call disk_free
      0094B0 92               [ 1] 4012 	clrw x  
      0094B1 AF 00 17 6B      [ 1] 4013 	mov base,#10 
      0094B5 01 5C 92         [ 4] 4014 	call prti24 
      0094B8 AF 00 17         [ 2] 4015 	ldw x,#drive_free
      0094BB 6B 02 5C         [ 4] 4016 	call puts 
      00166A                       4017 	_drop VSIZE 
      0094BE 72 FB            [ 2]    1     addw sp,#VSIZE 
      0094C0 01               [ 4] 4018 	ret
      0094C1 CD 94 22 CD 94 07 AE  4019 file_count: .asciz " files\n"
             02
      0094C9 80 C3 00 17 2A D3 20  4020 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   4021 
                                   4022 ;---------------------
                                   4023 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   4024 ; write 1 or more byte to FLASH or EEPROM
                                   4025 ; starting at address  
                                   4026 ; input:
                                   4027 ;   expr1  	is address 
                                   4028 ;   expr2,...,exprn   are bytes to write
                                   4029 ; output:
                                   4030 ;   none 
                                   4031 ;---------------------
                           000001  4032 	ADDR=1
                           000002  4033 	VSIZ=2 
      0094CF                       4034 write:
      001682                       4035 	_vars VSIZE 
      0094CF 72 5F            [ 2]    1     sub sp,#VSIZE 
      0094D1 00 17 72 5F      [ 1] 4036 	clr farptr ; expect 16 bits address 
      0094D5 00 18 72         [ 4] 4037 	call expression
      0094D8 5F 00            [ 1] 4038 	cp a,#TK_INTGR 
      0094DA 19 5B            [ 1] 4039 	jreq 0$
      0094DC 04 98 81         [ 2] 4040 	jp syntax_error
      0094DF 1F 01            [ 2] 4041 0$: ldw (ADDR,sp),x 
      0094DF 5B 04 99         [ 4] 4042 	call next_token 
      0094E2 81 09            [ 1] 4043 	cp a,#TK_COMMA 
      0094E3 27 02            [ 1] 4044 	jreq 1$ 
      0094E3 72 01            [ 2] 4045 	jra 9$ 
      0094E5 00 24 05         [ 4] 4046 1$:	call expression
      0094E8 A6 07            [ 1] 4047 	cp a,#TK_INTGR
      0094EA CC 87            [ 1] 4048 	jreq 2$
      0094EC A2 07 20         [ 2] 4049 	jp syntax_error
      0094ED 9F               [ 1] 4050 2$:	ld a,xl 
      0094ED CE 00            [ 2] 4051 	ldw x,(ADDR,sp) 
      0094EF 1F 72 B0         [ 2] 4052 	ldw farptr+1,x 
      0094F2 00               [ 1] 4053 	clrw x 
      0094F3 1D 26 0C         [ 4] 4054 	call write_byte
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0094F6 AE 87            [ 2] 4055 	ldw x,(ADDR,sp)
      0094F8 39               [ 1] 4056 	incw x 
      0094F9 CD A2            [ 2] 4057 	jra 0$ 
      0016B6                       4058 9$:
      0016B6                       4059 	_drop VSIZE
      0094FB 40 55            [ 2]    1     addw sp,#VSIZE 
      0094FD 00               [ 4] 4060 	ret 
                                   4061 
                                   4062 
                                   4063 ;---------------------
                                   4064 ;BASIC: CHAR(expr)
                                   4065 ; évaluate expression 
                                   4066 ; and take the 7 least 
                                   4067 ; bits as ASCII character
                                   4068 ; return a TK_CHAR 
                                   4069 ;---------------------
      0016B9                       4070 char:
      0094FE 04 00 02         [ 4] 4071 	call func_args 
      009501 81 01            [ 1] 4072 	cp a,#1
      009502 27 03            [ 1] 4073 	jreq 1$
      009502 52 08 1F         [ 2] 4074 	jp syntax_error
      009505 01               [ 2] 4075 1$:	popw x 
      009506 CD               [ 1] 4076 	ld a,xl 
      009507 88 92            [ 1] 4077 	and a,#0x7f 
      009509 A1               [ 1] 4078 	ld xl,a
      00950A 02 27            [ 1] 4079 	ld a,#TK_CHAR
      00950C 03               [ 4] 4080 	ret
                                   4081 
                                   4082 ;---------------------
                                   4083 ; BASIC: ASC(string|char|TK_CFUNC)
                                   4084 ; extract first character 
                                   4085 ; of string argument 
                                   4086 ; return it as TK_INTGR 
                                   4087 ;---------------------
      0016CB                       4088 ascii:
      00950D CC 87            [ 1] 4089 	ld a,#TK_LPAREN
      00950F A0 0B B8         [ 4] 4090 	call expect 
      009510 CD 08 12         [ 4] 4091 	call next_token 
      009510 1F 03            [ 1] 4092 	cp a,#TK_QSTR 
      009512 CD 81            [ 1] 4093 	jreq 1$
      009514 F6 1E            [ 1] 4094 	cp a,#TK_CHAR 
      009516 03 CD            [ 1] 4095 	jreq 2$ 
      009518 84 1C            [ 1] 4096 	cp a,#TK_CFUNC 
      00951A AB 03            [ 1] 4097 	jreq 0$
      00951C 5F 97 72         [ 2] 4098 	jp syntax_error
      00951F FB               [ 4] 4099 0$: call (x)
      009520 01 4F            [ 2] 4100 	jra 2$
      0016E5                       4101 1$: 
      009522 72               [ 1] 4102 	ld a,(x) 
      009523 BB               [ 1] 4103 	clrw x
      009524 00               [ 1] 4104 	ld xl,a 
      0016E8                       4105 2$: 
      009525 1B               [ 2] 4106 	pushw x 
      009526 C9 00            [ 1] 4107 	ld a,#TK_RPAREN 
      009528 1A A1 02         [ 4] 4108 	call expect
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00952B 2B               [ 2] 4109 	popw x 
      00952C 0A A3            [ 1] 4110 	ld a,#TK_INTGR 
      00952E 80               [ 4] 4111 	ret 
                                   4112 
                                   4113 ;---------------------
                                   4114 ;BASIC: KEY
                                   4115 ; wait for a character 
                                   4116 ; received from STDIN 
                                   4117 ; input:
                                   4118 ;	none 
                                   4119 ; output:
                                   4120 ;	X 		ASCII character 
                                   4121 ;---------------------
      0016F2                       4122 key:
      00952F 00 2B 05         [ 4] 4123 	call getc 
      009532 A6               [ 1] 4124 	clrw x 
      009533 0E               [ 1] 4125 	ld xl,a 
      009534 CC 87            [ 1] 4126 	ld a,#TK_INTGR
      009536 A2               [ 4] 4127 	ret
                                   4128 
                                   4129 ;----------------------
                                   4130 ; BASIC: QKEY
                                   4131 ; Return true if there 
                                   4132 ; is a character in 
                                   4133 ; waiting in STDIN 
                                   4134 ; input:
                                   4135 ;  none 
                                   4136 ; output:
                                   4137 ;   X 		0|-1 
                                   4138 ;-----------------------
      009537                       4139 qkey:: 
      009537 16               [ 1] 4140 	clrw x 
      009538 03 CD 94         [ 1] 4141 	ld a,rx1_head
      00953B 96 24 05         [ 1] 4142 	cp a,rx1_tail 
      00953E A6 08            [ 1] 4143 	jreq 9$ 
      009540 CC               [ 2] 4144 	cplw x 
      009541 87 A2            [ 1] 4145 9$: ld a,#TK_INTGR
      009543 81               [ 4] 4146 	ret 
                                   4147 
                                   4148 ;---------------------
                                   4149 ; BASIC: GPIO(expr,reg)
                                   4150 ; return gpio address 
                                   4151 ; expr {0..8}
                                   4152 ; input:
                                   4153 ;   none 
                                   4154 ; output:
                                   4155 ;   X 		gpio register address
                                   4156 ;----------------------------
                           000003  4157 	PORT=3
                           000001  4158 	REG=1 
                           000004  4159 	VSIZE=4 
      001707                       4160 gpio:
      009543 CE 00 1A         [ 4] 4161 	call func_args 
      009546 C6 00            [ 1] 4162 	cp a,#2
      009548 1C CF            [ 1] 4163 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      00954A 00 17 C7         [ 2] 4164 	jp syntax_error  
      001711                       4165 1$:	
      00954D 00 19            [ 2] 4166 	ldw x,(PORT,sp)
      00954F 16 03            [ 1] 4167 	jrmi bad_port
      009551 AE 16 E0         [ 2] 4168 	cpw x,#9
      009554 CD 84            [ 1] 4169 	jrpl bad_port
      009556 38 CD            [ 1] 4170 	ld a,#5
      009558 84               [ 4] 4171 	mul x,a
      009559 1C 5F 97         [ 2] 4172 	addw x,#GPIO_BASE 
      00955C 5C 1C            [ 2] 4173 	ldw (PORT,sp),x  
      00955E 16 E0            [ 2] 4174 	ldw x,(REG,sp) 
      009560 16 01 FF         [ 2] 4175 	addw x,(PORT,sp)
      009563 1C 00            [ 1] 4176 	ld a,#TK_INTGR
      001729                       4177 	_drop VSIZE 
      009565 02 90            [ 2]    1     addw sp,#VSIZE 
      009567 CE               [ 4] 4178 	ret
      00172C                       4179 bad_port:
      009568 00 1D            [ 1] 4180 	ld a,#ERR_BAD_VALUE
      00956A 90 F6 90         [ 2] 4181 	jp tb_error
                                   4182 
                                   4183 
                                   4184 ;-------------------------
                                   4185 ; BASIC: UFLASH 
                                   4186 ; return user flash address
                                   4187 ; input:
                                   4188 ;  none 
                                   4189 ; output:
                                   4190 ;	A		TK_INTGR
                                   4191 ;   X 		user address 
                                   4192 ;---------------------------
      001731                       4193 uflash:
      00956D 5C F7 5C         [ 2] 4194 	ldw x,#user_space 
      009570 90 C3            [ 1] 4195 	ld a,#TK_INTGR 
      009572 00               [ 4] 4196 	ret 
                                   4197 
                                   4198 
                                   4199 ;---------------------
                                   4200 ; BASIC: USR(addr[,arg])
                                   4201 ; execute a function written 
                                   4202 ; in binary code.
                                   4203 ; binary fonction should 
                                   4204 ; return token attribute in A 
                                   4205 ; and value in X. 
                                   4206 ; input:
                                   4207 ;   addr	routine address 
                                   4208 ;   arg 	is an optional argument 
                                   4209 ; output:
                                   4210 ;   A 		token attribute 
                                   4211 ;   X       returned value 
                                   4212 ;---------------------
      001737                       4213 usr:
      009573 1F 27            [ 2] 4214 	pushw y 	
      009575 05 A3 17         [ 4] 4215 	call func_args 
      009578 60 2B            [ 1] 4216 	cp a,#1 
      00957A EF 07            [ 1] 4217 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00957B A1 02            [ 1] 4218 	cp a,#2
      00957B 17 07            [ 1] 4219 	jreq 2$  
      00957D CC 07 20         [ 2] 4220 	jp syntax_error 
      00957D A3 17            [ 2] 4221 2$: popw y  ; arg|addr 
      00957F 60 27            [ 1] 4222 	cp a,#1
      009581 04 7F            [ 1] 4223 	jreq 3$
      009583 5C               [ 2] 4224 	popw x ; addr
      009584 20               [ 1] 4225 	exgw x,y 
      009585 F7 FD            [ 4] 4226 3$: call (y)
      009586 90 85            [ 2] 4227 	popw y 
      009586 AE               [ 4] 4228 	ret 
                                   4229 
                                   4230 ;------------------------------
                                   4231 ; BASIC: BYE 
                                   4232 ; halt mcu in its lowest power mode 
                                   4233 ; wait for reset or external interrupt
                                   4234 ; do a cold start on wakeup.
                                   4235 ;------------------------------
      001754                       4236 bye:
      009587 16 E0 CD 82 0A   [ 2] 4237 	btjf UART1_SR,#UART_SR_TC,.
      00958C AE               [10] 4238 	halt
      00958D 00 80 CD         [ 2] 4239 	jp cold_start  
                                   4240 
                                   4241 ;----------------------------------
                                   4242 ; BASIC: AUTORUN ["file_name"] 
                                   4243 ; record in eeprom at adrress AUTORUN_NAME
                                   4244 ; the name of file to load and execute
                                   4245 ; at startup. 
                                   4246 ; empty string delete autorun name 
                                   4247 ; no argument display autorun name  
                                   4248 ; input:
                                   4249 ;   file_name   file to execute 
                                   4250 ; output:
                                   4251 ;   none
                                   4252 ;-----------------------------------
      00175D                       4253 autorun: 
      009590 94 22 AE 16 E0   [ 2] 4254 	btjf flags,#FRUN,0$ 
      009595 16 07            [ 1] 4255 	jreq 0$ 
      009597 90 C3            [ 1] 4256 	ld a,#ERR_CMD_ONLY 
      009599 00 1F 2B         [ 2] 4257 	jp tb_error 
      001769                       4258 0$:	
      00959C CD CE 00         [ 4] 4259 	call next_token
      00959F 17               [ 1] 4260 	tnz a 
      0095A0 C6 00            [ 1] 4261 	jrne 1$
      0095A2 19 CF 00         [ 2] 4262 	ldw x,#AUTORUN_NAME
      0095A5 1A C7 00         [ 4] 4263 	call puts 
      0095A8 1C               [ 1] 4264 	clr a 
      0095A9 1E               [ 4] 4265 	ret 
      001777                       4266 1$:
      0095AA 01 CD            [ 1] 4267 	cp a,#TK_QSTR
      0095AC 88 ED            [ 1] 4268 	jreq 2$
      0095AE 5B 08 81         [ 2] 4269 	jp syntax_error 
      0095B1                       4270 2$:	
      0095B1 CD               [ 1] 4271 	tnz (x) 
      0095B2 94 22            [ 1] 4272 	jrne 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4273 ; empty string, delete autorun 	
      0095B4 CD 86 0A         [ 4] 4274 	call cancel_autorun
      0095B7 5F 92 AF 00 17   [ 1] 4275 	mov in,count 
      0095BC 90               [ 4] 4276 	ret 
      0095BD 95               [ 2] 4277 3$:	pushw x 
      0095BE 5C 92            [ 1] 4278 	ldw y,x  
      0095C0 AF 00 17         [ 4] 4279 	call search_file 
      0095C3 5C 90            [ 1] 4280 	jrc 4$ 
      0095C5 97 72            [ 1] 4281 	ld a,#ERR_NOT_FILE
      0095C7 B9 00 1D         [ 2] 4282 	jp tb_error  
      001797                       4283 4$: 
      0095CA 90 CF 00 1F 90   [ 1] 4284 	mov in,count 
      0095CF CE 00 1D 16      [ 1] 4285 	clr farptr 
      0095D2 AE 40 00         [ 2] 4286 	ldw x,#AUTORUN_NAME
      0095D2 92 AF 00         [ 2] 4287 	ldw farptr+1,x 
      0095D5 17 90            [ 2] 4288 	ldw x,(1,sp)  
      0095D7 F7 5C 90         [ 4] 4289 	call strlen  ; return length in A 
      0095DA 5C               [ 1] 4290 	clrw x 
      0095DB 90               [ 1] 4291 	ld xl,a 
      0095DC C3               [ 1] 4292 	incw x 
      0095DD 00 1F            [ 2] 4293 	popw y 
      0095DF 2B               [ 2] 4294 	pushw x 
      0095E0 F1               [ 1] 4295 	clrw x 
      0095E1 81 02 5C         [ 4] 4296 	call write_block 
      0095E2                       4297 	_drop 2 
      0095E2 72 01            [ 2]    1     addw sp,#2 
      0095E4 00               [ 4] 4298 	ret 
                                   4299 
                                   4300 ;----------------------------------
                                   4301 ; BASIC: SLEEP 
                                   4302 ; halt mcu until reset or external
                                   4303 ; interrupt.
                                   4304 ; Resume progam after SLEEP command
                                   4305 ;----------------------------------
      0017B8                       4306 sleep:
      0095E5 24 07 27 05 A6   [ 2] 4307 	btjf UART1_SR,#UART_SR_TC,.
      0095EA 07 CC 87 A2      [ 1] 4308 	bset flags,#FSLEEP
      0095EE 8E               [10] 4309 	halt 
      0095EE CD               [ 4] 4310 	ret 
                                   4311 
                                   4312 ;-------------------------------
                                   4313 ; BASIC: PAUSE expr 
                                   4314 ; suspend execution for n msec.
                                   4315 ; input:
                                   4316 ;	none
                                   4317 ; output:
                                   4318 ;	none 
                                   4319 ;------------------------------
      0017C3                       4320 pause:
      0095EF 88 92 A1         [ 4] 4321 	call expression
      0095F2 02 27            [ 1] 4322 	cp a,#TK_INTGR
      0095F4 03 CC            [ 1] 4323 	jreq pause02 
      0095F6 87 A0 90         [ 2] 4324 	jp syntax_error
      0017CD                       4325 pause02: 
      0095F9 93               [ 2] 4326 1$: tnzw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095FA CD 94            [ 1] 4327 	jreq 2$
      0095FC 96               [10] 4328 	wfi 
      0095FD 25               [ 2] 4329 	decw x 
      0095FE 05 A6            [ 1] 4330 	jrne 1$
      009600 09               [ 1] 4331 2$:	clr a 
      009601 CC               [ 4] 4332 	ret 
                                   4333 
                                   4334 ;------------------------------
                                   4335 ; BASIC: AWU expr
                                   4336 ; halt mcu for 'expr' milliseconds
                                   4337 ; use Auto wakeup peripheral
                                   4338 ; all oscillators stopped except LSI
                                   4339 ; range: 1ms - 511ms
                                   4340 ; input:
                                   4341 ;  none
                                   4342 ; output:
                                   4343 ;  none:
                                   4344 ;------------------------------
      0017D6                       4345 awu:
      009602 87 A2 C9         [ 4] 4346   call expression
      009604 A1 84            [ 1] 4347   cp a,#TK_INTGR
      009604 CD 95            [ 1] 4348   jreq awu02
      009606 B1 CE 00         [ 2] 4349   jp syntax_error
      0017E0                       4350 awu02:
      009609 1F 72 B0         [ 2] 4351   cpw x,#5120
      00960C 00 1D            [ 1] 4352   jrmi 1$ 
      00960E CD 88 ED 81      [ 1] 4353   mov AWU_TBR,#15 
      009612 A6 1E            [ 1] 4354   ld a,#30
      009612 52               [ 2] 4355   div x,a
      009613 05 CD            [ 1] 4356   ld a,#16
      009615 88               [ 2] 4357   div x,a 
      009616 92 A1            [ 2] 4358   jra 4$
      0017F1                       4359 1$: 
      009618 00 27 18         [ 2] 4360   cpw x,#2048
      00961B A1 02            [ 1] 4361   jrmi 2$ 
      00961D 27 03 CC 87      [ 1] 4362   mov AWU_TBR,#14
      009621 A0 90            [ 1] 4363   ld a,#80
      009623 93               [ 2] 4364   div x,a 
      009624 55 00            [ 2] 4365   jra 4$   
      0017FF                       4366 2$:
      009626 04 00 02 CD      [ 1] 4367   mov AWU_TBR,#7
      001803                       4368 3$:  
                                   4369 ; while X > 64  divide by 2 and increment AWU_TBR 
      00962A 94 96 25         [ 2] 4370   cpw x,#64 
      00962D 0F A6            [ 2] 4371   jrule 4$ 
      00962F 09 CC 87 A2      [ 1] 4372   inc AWU_TBR 
      009633 54               [ 2] 4373   srlw x 
      009633 AE 01            [ 2] 4374   jra 3$ 
      00180F                       4375 4$:
      009635 00               [ 1] 4376   ld a, xl
      009636 4F               [ 1] 4377   dec a 
      009637 CF 00            [ 1] 4378   jreq 5$
      009639 17               [ 1] 4379   dec a 	
      001814                       4380 5$: 
      00963A C7 00            [ 1] 4381   and a,#0x3e 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      00963C 19 C6 00         [ 1] 4382   ld AWU_APR,a 
      00963F 19 CE 00 17      [ 1] 4383   bset AWU_CSR,#AWU_CSR_AWUEN
      009643 1F               [10] 4384   halt 
                                   4385 
      009644 01               [ 4] 4386   ret 
                                   4387 
                                   4388 ;------------------------------
                                   4389 ; BASIC: TICKS
                                   4390 ; return msec ticks counter value 
                                   4391 ; input:
                                   4392 ; 	none 
                                   4393 ; output:
                                   4394 ;	X 		TK_INTGR
                                   4395 ;-------------------------------
      00181F                       4396 get_ticks:
      009645 6B 03 C6         [ 2] 4397 	ldw x,ticks 
      009648 00 1C            [ 1] 4398 	ld a,#TK_INTGR
      00964A CE               [ 4] 4399 	ret 
                                   4400 
                                   4401 
                                   4402 
                                   4403 ;------------------------------
                                   4404 ; BASIC: ABS(expr)
                                   4405 ; return absolute value of expr.
                                   4406 ; input:
                                   4407 ;   none
                                   4408 ; output:
                                   4409 ;   X     	positive integer
                                   4410 ;-------------------------------
      001825                       4411 abs:
      00964B 00 1A C0         [ 4] 4412 	call func_args 
      00964E 00 19            [ 1] 4413 	cp a,#1 
      009650 24 01            [ 1] 4414 	jreq 0$ 
      009652 5A 72 B0         [ 2] 4415 	jp syntax_error
      00182F                       4416 0$:  
      009655 00               [ 2] 4417     popw x   
      009656 17               [ 1] 4418 	ld a,xh 
      009657 48 59            [ 1] 4419 	bcp a,#0x80 
      009659 1F 04            [ 1] 4420 	jreq 2$ 
      00965B CD               [ 2] 4421 	negw x 
      00965C 81 C2            [ 1] 4422 2$: ld a,#TK_INTGR 
      00965E 1E               [ 4] 4423 	ret 
                                   4424 
                                   4425 ;------------------------------
                                   4426 ; BASIC: AND(expr1,expr2)
                                   4427 ; Apply bit AND relation between
                                   4428 ; the 2 arguments, i.e expr1 & expr2 
                                   4429 ; output:
                                   4430 ; 	A 		TK_INTGR
                                   4431 ;   X 		result 
                                   4432 ;------------------------------
      001839                       4433 bit_and:
      00965F 04 5D 27         [ 4] 4434 	call func_args 
      009662 10 CD            [ 1] 4435 	cp a,#2
      009664 82 3D            [ 1] 4436 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009666 AE 00 80         [ 2] 4437 	jp syntax_error 
      009669 CD               [ 2] 4438 1$:	popw x 
      00966A 94               [ 1] 4439 	ld a,xh 
      00966B 22 1E            [ 1] 4440 	and a,(1,sp)
      00966D 04               [ 1] 4441 	ld xh,a 
      00966E 5A               [ 1] 4442 	ld a,xl
      00966F 1F 04            [ 1] 4443 	and a,(2,sp)
      009671 20               [ 1] 4444 	ld xl,a 
      00184C                       4445 	_drop 2 
      009672 EB 7B            [ 2]    1     addw sp,#2 
      009674 03 1E            [ 1] 4446 	ld a,#TK_INTGR
      009676 01               [ 4] 4447 	ret
                                   4448 
                                   4449 ;------------------------------
                                   4450 ; BASIC: OR(expr1,expr2)
                                   4451 ; Apply bit OR relation between
                                   4452 ; the 2 arguments, i.e expr1 | expr2 
                                   4453 ; output:
                                   4454 ; 	A 		TK_INTGR
                                   4455 ;   X 		result 
                                   4456 ;------------------------------
      001851                       4457 bit_or:
      009677 C7 00 1C         [ 4] 4458 	call func_args 
      00967A CF 00            [ 1] 4459 	cp a,#2
      00967C 1A 5B            [ 1] 4460 	jreq 1$
      00967E 05 81 20         [ 2] 4461 	jp syntax_error 
      009680                       4462 1$: 
      009680 52               [ 2] 4463 	popw x 
      009681 02               [ 1] 4464 	ld a,xh 
      009682 5F 1F            [ 1] 4465 	or a,(1,sp)
      009684 01               [ 1] 4466 	ld xh,a 
      009685 CF               [ 1] 4467 	ld a,xl 
      009686 00 18            [ 1] 4468 	or a,(2,sp)
      009688 35               [ 1] 4469 	ld xl,a 
      001864                       4470 	_drop 2 
      009689 01 00            [ 2]    1     addw sp,#2 
      00968B 17 84            [ 1] 4471 	ld a,#TK_INTGR 
      00968C 81               [ 4] 4472 	ret
                                   4473 
                                   4474 ;------------------------------
                                   4475 ; BASIC: XOR(expr1,expr2)
                                   4476 ; Apply bit XOR relation between
                                   4477 ; the 2 arguments, i.e expr1 ^ expr2 
                                   4478 ; output:
                                   4479 ; 	A 		TK_INTGR
                                   4480 ;   X 		result 
                                   4481 ;------------------------------
      001869                       4482 bit_xor:
      00968C 5F 92 AF         [ 4] 4483 	call func_args 
      00968F 00 17            [ 1] 4484 	cp a,#2
      009691 27 3B            [ 1] 4485 	jreq 1$
      009693 CC 07 20         [ 2] 4486 	jp syntax_error 
      001873                       4487 1$: 
      009693 92               [ 2] 4488 	popw x 
      009694 AF               [ 1] 4489 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009695 00 17            [ 1] 4490 	xor a,(1,sp)
      009697 27               [ 1] 4491 	ld xh,a 
      009698 06               [ 1] 4492 	ld a,xl 
      009699 CD 83            [ 1] 4493 	xor a,(2,sp)
      00969B 42               [ 1] 4494 	ld xl,a 
      00187C                       4495 	_drop 2 
      00969C 5C 20            [ 2]    1     addw sp,#2 
      00969E F4 5C            [ 1] 4496 	ld a,#TK_INTGR 
      0096A0 A6               [ 4] 4497 	ret 
                                   4498 
                                   4499 ;------------------------------
                                   4500 ; BASIC: LSHIFT(expr1,expr2)
                                   4501 ; logical shift left expr1 by 
                                   4502 ; expr2 bits 
                                   4503 ; output:
                                   4504 ; 	A 		TK_INTGR
                                   4505 ;   X 		result 
                                   4506 ;------------------------------
      001881                       4507 lshift:
      0096A1 20 CD 83         [ 4] 4508 	call func_args
      0096A4 42 92            [ 1] 4509 	cp a,#2 
      0096A6 AF 00            [ 1] 4510 	jreq 1$
      0096A8 17 90 95         [ 2] 4511 	jp syntax_error
      0096AB 5C 92            [ 2] 4512 1$: popw y   
      0096AD AF               [ 2] 4513 	popw x 
      0096AE 00 17            [ 2] 4514 	tnzw y 
      0096B0 5C 90            [ 1] 4515 	jreq 4$
      0096B2 97               [ 2] 4516 2$:	sllw x 
      0096B3 90 89            [ 2] 4517 	decw y 
      0096B5 72 FB            [ 1] 4518 	jrne 2$
      001897                       4519 4$:  
      0096B7 01 CD            [ 1] 4520 	ld a,#TK_INTGR
      0096B9 94               [ 4] 4521 	ret
                                   4522 
                                   4523 ;------------------------------
                                   4524 ; BASIC: RSHIFT(expr1,expr2)
                                   4525 ; logical shift right expr1 by 
                                   4526 ; expr2 bits.
                                   4527 ; output:
                                   4528 ; 	A 		TK_INTGR
                                   4529 ;   X 		result 
                                   4530 ;------------------------------
      00189A                       4531 rshift:
      0096BA 22 CD 94         [ 4] 4532 	call func_args
      0096BD 07 85            [ 1] 4533 	cp a,#2 
      0096BF CD 88            [ 1] 4534 	jreq 1$
      0096C1 ED A6 0D         [ 2] 4535 	jp syntax_error
      0096C4 CD 83            [ 2] 4536 1$: popw y  
      0096C6 42               [ 2] 4537 	popw x
      0096C7 1E 01            [ 2] 4538 	tnzw y 
      0096C9 5C 1F            [ 1] 4539 	jreq 4$
      0096CB 01               [ 2] 4540 2$:	srlw x 
      0096CC 20 BE            [ 2] 4541 	decw y 
      0096CE 26 FB            [ 1] 4542 	jrne 2$
      0018B0                       4543 4$:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0096CE 1E 01            [ 1] 4544 	ld a,#TK_INTGR
      0096D0 CD               [ 4] 4545 	ret
                                   4546 
                                   4547 ;--------------------------
                                   4548 ; BASIC: FCPU integer
                                   4549 ; set CPU frequency 
                                   4550 ;-------------------------- 
                                   4551 
      0018B3                       4552 fcpu:
      0096D1 88 ED            [ 1] 4553 	ld a,#TK_INTGR
      0096D3 AE 96 ED         [ 4] 4554 	call expect 
      0096D6 CD               [ 1] 4555 	ld a,xl 
      0096D7 A2 40            [ 1] 4556 	and a,#7 
      0096D9 CD 94 62         [ 1] 4557 	ld CLK_CKDIVR,a 
      0096DC 5F               [ 4] 4558 	ret 
                                   4559 
                                   4560 ;------------------------------
                                   4561 ; BASIC: PMODE pin#, mode 
                                   4562 ; Arduino pin. 
                                   4563 ; define pin as input or output
                                   4564 ; pin#: {0..15}
                                   4565 ; mode: INPUT|OUTPUT  
                                   4566 ;------------------------------
                           000001  4567 	PINNO=1
                           000001  4568 	VSIZE=1
      0018BF                       4569 pin_mode:
      0018BF                       4570 	_vars VSIZE 
      0096DD 35 0A            [ 2]    1     sub sp,#VSIZE 
      0096DF 00 0B CD         [ 4] 4571 	call arg_list 
      0096E2 88 FD            [ 1] 4572 	cp a,#2 
      0096E4 AE 96            [ 1] 4573 	jreq 1$
      0096E6 F5 CD A2         [ 2] 4574 	jp syntax_error 
      0096E9 40 5B            [ 2] 4575 1$: popw y ; mode 
      0096EB 02               [ 2] 4576 	popw x ; Dx pin 
      0096EC 81 20 66         [ 4] 4577 	call select_pin 
      0096EF 69 6C            [ 1] 4578 	ld (PINNO,sp),a  
      0096F1 65 73            [ 1] 4579 	ld a,#1 
      0096F3 0A 00            [ 1] 4580 	tnz (PINNO,sp)
      0096F5 20 62            [ 1] 4581 	jreq 4$
      0096F7 79               [ 1] 4582 2$:	sll a 
      0096F8 74 65            [ 1] 4583 	dec (PINNO,sp)
      0096FA 73 20            [ 1] 4584 	jrne 2$ 
      0096FC 66 72            [ 1] 4585 	ld (PINNO,sp),a
      0096FE 65 65            [ 1] 4586 	ld a,(PINNO,sp)
      009700 0A 00            [ 1] 4587 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009702 E7 03            [ 1] 4588 	ld (GPIO_CR1,x),a 
      009702 52 02 72 5F      [ 2] 4589 4$:	cpw y,#OUTP 
      009706 00 17            [ 1] 4590 	jreq 6$
                                   4591 ; input mode
                                   4592 ; disable external interrupt 
      009708 CD 8D            [ 1] 4593 	ld a,(PINNO,sp)
      00970A 49               [ 1] 4594 	cpl a 
      00970B A1 84            [ 1] 4595 	and a,(GPIO_CR2,x)
      00970D 27 03            [ 1] 4596 	ld (GPIO_CR2,x),a 
                                   4597 ;clear bit in DDR for input mode 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      00970F CC 87            [ 1] 4598 	ld a,(PINNO,sp)
      009711 A0               [ 1] 4599 	cpl a 
      009712 1F 01            [ 1] 4600 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009714 CD 88            [ 1] 4601 	ld (GPIO_DDR,x),a 
      009716 92 A1            [ 2] 4602 	jra 9$
      0018FC                       4603 6$: ;output mode  
      009718 09 27            [ 1] 4604 	ld a,(PINNO,sp)
      00971A 02 20            [ 1] 4605 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00971C 19 CD            [ 1] 4606 	ld (GPIO_DDR,x),a 
      00971E 8D 49            [ 1] 4607 	ld a,(PINNO,sp)
      009720 A1 84            [ 1] 4608 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009722 27 03            [ 1] 4609 	ld (GPIO_CR2,x),a 
      001908                       4610 9$:	
      001908                       4611 	_drop VSIZE 
      009724 CC 87            [ 2]    1     addw sp,#VSIZE 
      009726 A0               [ 4] 4612 	ret
                                   4613 
                                   4614 ;------------------------
                                   4615 ; select Arduino pin 
                                   4616 ; input:
                                   4617 ;   X 	 {0..15} Arduino Dx 
                                   4618 ; output:
                                   4619 ;   A     stm8s208 pin 
                                   4620 ;   X     base address s208 GPIO port 
                                   4621 ;---------------------------
      00190B                       4622 select_pin:
      009727 9F               [ 2] 4623 	sllw x 
      009728 1E 01 CF         [ 2] 4624 	addw x,#arduino_to_8s208 
      00972B 00               [ 2] 4625 	ldw x,(x)
      00972C 18               [ 1] 4626 	ld a,xl 
      00972D 5F               [ 1] 4627 	push a 
      00972E CD               [ 1] 4628 	swapw x 
      00972F 82 67            [ 1] 4629 	ld a,#5 
      009731 1E               [ 4] 4630 	mul x,a 
      009732 01 5C 20         [ 2] 4631 	addw x,#GPIO_BASE 
      009735 DC               [ 1] 4632 	pop a 
      009736 81               [ 4] 4633 	ret 
                                   4634 ; translation from Arduino D0..D15 to stm8s208rb 
      00191B                       4635 arduino_to_8s208:
      009736 5B 02                 4636 .byte 3,6 ; D0 
      009738 81 05                 4637 .byte 3,5 ; D1 
      009739 04 00                 4638 .byte 4,0 ; D2 
      009739 CD 8C                 4639 .byte 2,1 ; D3
      00973B 45 A1                 4640 .byte 6,0 ; D4
      00973D 01 27                 4641 .byte 2,2 ; D5
      00973F 03 CC                 4642 .byte 2,3 ; D6
      009741 87 A0                 4643 .byte 3,1 ; D7
      009743 85 9F                 4644 .byte 3,3 ; D8
      009745 A4 7F                 4645 .byte 2,4 ; D9
      009747 97 A6                 4646 .byte 4,5 ; D10
      009749 03 81                 4647 .byte 2,6 ; D11
      00974B 02 07                 4648 .byte 2,7 ; D12
      00974B A6 07                 4649 .byte 2,5 ; D13
      00974D CD 8C                 4650 .byte 4,2 ; D14
      00974F 38 CD                 4651 .byte 4,1 ; D15
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4652 
                                   4653 
                                   4654 ;------------------------------
                                   4655 ; BASIC: RND(expr)
                                   4656 ; return random number 
                                   4657 ; between 1 and expr inclusive
                                   4658 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4659 ; input:
                                   4660 ; 	none 
                                   4661 ; output:
                                   4662 ;	X 		random positive integer 
                                   4663 ;------------------------------
      00193B                       4664 random:
      009751 88 92 A1         [ 4] 4665 	call func_args 
      009754 02 27            [ 1] 4666 	cp a,#1
      009756 0E A1            [ 1] 4667 	jreq 1$
      009758 03 27 0D         [ 2] 4668 	jp syntax_error
      001945                       4669 1$:  
      00975B A1 82            [ 1] 4670 	ld a,#0x80 
      00975D 27 03            [ 1] 4671 	bcp a,(1,sp)
      00975F CC 87            [ 1] 4672 	jreq 2$
      009761 A0 FD            [ 1] 4673 	ld a,#ERR_BAD_VALUE
      009763 20 03 22         [ 2] 4674 	jp tb_error
      009765                       4675 2$: 
                                   4676 ; acc16=(x<<5)^x 
      009765 F6 5F 97         [ 2] 4677 	ldw x,seedx 
      009768 58               [ 2] 4678 	sllw x 
      009768 89               [ 2] 4679 	sllw x 
      009769 A6               [ 2] 4680 	sllw x 
      00976A 08               [ 2] 4681 	sllw x 
      00976B CD               [ 2] 4682 	sllw x 
      00976C 8C               [ 1] 4683 	ld a,xh 
      00976D 38 85 A6         [ 1] 4684 	xor a,seedx 
      009770 84 81 0C         [ 1] 4685 	ld acc16,a 
      009772 9F               [ 1] 4686 	ld a,xl 
      009772 CD 83 52         [ 1] 4687 	xor a,seedx+1 
      009775 5F 97 A6         [ 1] 4688 	ld acc8,a 
                                   4689 ; seedx=seedy 
      009778 84 81 14         [ 2] 4690 	ldw x,seedy 
      00977A CF 00 12         [ 2] 4691 	ldw seedx,x  
                                   4692 ; seedy=seedy^(seedy>>1)
      00977A 5F C6            [ 2] 4693 	srlw y 
      00977C 00 2E            [ 1] 4694 	ld a,yh 
      00977E C1 00 2F         [ 1] 4695 	xor a,seedy 
      009781 27 01 53         [ 1] 4696 	ld seedy,a  
      009784 A6 84            [ 1] 4697 	ld a,yl 
      009786 81 00 15         [ 1] 4698 	xor a,seedy+1 
      009787 C7 00 15         [ 1] 4699 	ld seedy+1,a 
                                   4700 ; acc16>>3 
      009787 CD 8C 45         [ 2] 4701 	ldw x,acc16 
      00978A A1               [ 2] 4702 	srlw x 
      00978B 02               [ 2] 4703 	srlw x 
      00978C 27               [ 2] 4704 	srlw x 
                                   4705 ; x=acc16^x 
      00978D 03               [ 1] 4706 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      00978E CC 87 A0         [ 1] 4707 	xor a,acc16 
      009791 95               [ 1] 4708 	ld xh,a 
      009791 1E               [ 1] 4709 	ld a,xl 
      009792 03 2B 17         [ 1] 4710 	xor a,acc8 
      009795 A3               [ 1] 4711 	ld xl,a 
                                   4712 ; seedy=x^seedy 
      009796 00 09 2A         [ 1] 4713 	xor a,seedy+1
      009799 12               [ 1] 4714 	ld xl,a 
      00979A A6               [ 1] 4715 	ld a,xh 
      00979B 05 42 1C         [ 1] 4716 	xor a,seedy
      00979E 50               [ 1] 4717 	ld xh,a 
      00979F 00 1F 03         [ 2] 4718 	ldw seedy,x 
                                   4719 ; return seedy modulo expr + 1 
      0097A2 1E 01            [ 2] 4720 	popw y 
      0097A4 72               [ 2] 4721 	divw x,y 
      0097A5 FB               [ 1] 4722 	ldw x,y 
      0097A6 03               [ 1] 4723 	incw x 
      00199F                       4724 10$:
      0097A7 A6 84            [ 1] 4725 	ld a,#TK_INTGR
      0097A9 5B               [ 4] 4726 	ret 
                                   4727 
                                   4728 ;---------------------------------
                                   4729 ; BASIC: WORDS 
                                   4730 ; affiche la listes des mots du
                                   4731 ; dictionnaire ainsi que le nombre
                                   4732 ; de mots.
                                   4733 ;---------------------------------
                           000001  4734 	WLEN=1 ; word length
                           000002  4735 	LLEN=2 ; character sent to console
                           000003  4736 	WCNT=3 ; count words printed 
                           000003  4737 	VSIZE=3 
      0019A2                       4738 words:
      0019A2                       4739 	_vars VSIZE
      0097AA 04 81            [ 2]    1     sub sp,#VSIZE 
      0097AC 0F 02            [ 1] 4740 	clr (LLEN,sp)
      0097AC A6 0A            [ 1] 4741 	clr (WCNT,sp)
      0097AE CC 87 A2 8E      [ 2] 4742 	ldw y,#kword_dict+2
      0097B1 93               [ 1] 4743 0$:	ldw x,y
      0097B1 AE               [ 1] 4744 	ld a,(x)
      0097B2 A2 00            [ 1] 4745 	and a,#15 
      0097B4 A6 84            [ 1] 4746 	ld (WLEN,sp),a 
      0097B6 81 03            [ 1] 4747 	inc (WCNT,sp)
      0097B7 5C               [ 1] 4748 1$:	incw x 
      0097B7 90               [ 1] 4749 	ld a,(x)
      0097B8 89 CD 8C         [ 4] 4750 	call putc 
      0097BB 45 A1            [ 1] 4751 	inc (LLEN,sp)
      0097BD 01 27            [ 1] 4752 	dec (WLEN,sp)
      0097BF 07 A1            [ 1] 4753 	jrne 1$
      0097C1 02 27            [ 1] 4754 	ld a,#70
      0097C3 03 CC            [ 1] 4755 	cp a,(LLEN,sp)
      0097C5 87 A0            [ 1] 4756 	jrmi 2$   
      0097C7 90 85            [ 1] 4757 	ld a,#SPACE 
      0097C9 A1 01 27         [ 4] 4758 	call putc 
      0097CC 02 85            [ 1] 4759 	inc (LLEN,sp) 
      0097CE 51 90            [ 2] 4760 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0097D0 FD 90            [ 1] 4761 2$: ld a,#CR 
      0097D2 85 81 C2         [ 4] 4762 	call putc 
      0097D4 0F 02            [ 1] 4763 	clr (LLEN,sp)
      0097D4 72 0D 52 30      [ 2] 4764 3$:	subw y,#2 
      0097D8 FB 8E            [ 2] 4765 	ldw y,(y)
      0097DA CC 84            [ 1] 4766 	jrne 0$ 
      0097DC FF 0D            [ 1] 4767 	ld a,#CR 
      0097DD CD 02 C2         [ 4] 4768 	call putc  
      0097DD 72               [ 1] 4769 	clrw x 
      0097DE 01 00            [ 1] 4770 	ld a,(WCNT,sp)
      0097E0 24               [ 1] 4771 	ld xl,a 
      0097E1 07 27 05         [ 4] 4772 	call print_int 
      0097E4 A6 07 CC         [ 2] 4773 	ldw x,#words_count_msg
      0097E7 87 A2 00         [ 4] 4774 	call puts 
      0097E9                       4775 	_drop VSIZE 
      0097E9 CD 88            [ 2]    1     addw sp,#VSIZE 
      0097EB 92               [ 4] 4776 	ret 
      0097EC 4D 26 08 AE 40 00 CD  4777 words_count_msg: .asciz " words in dictionary\n"
             A2 40 4F 81 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   4778 
                                   4779 
                                   4780 ;-----------------------------
                                   4781 ; BASIC: TIMER expr 
                                   4782 ; initialize count down timer 
                                   4783 ;-----------------------------
      0097F7                       4784 set_timer:
      0097F7 A1 02 27         [ 4] 4785 	call arg_list
      0097FA 03 CC            [ 1] 4786 	cp a,#1 
      0097FC 87 A0            [ 1] 4787 	jreq 1$
      0097FE CC 07 20         [ 2] 4788 	jp syntax_error
      001A12                       4789 1$: 
      0097FE 7D               [ 2] 4790 	popw x 
      0097FF 26 09 CD         [ 2] 4791 	ldw timer,x 
      009802 85               [ 4] 4792 	ret 
                                   4793 
                                   4794 ;------------------------------
                                   4795 ; BASIC: TIMEOUT 
                                   4796 ; return state of timer 
                                   4797 ;------------------------------
      001A17                       4798 timeout:
      009803 BD 55 00         [ 2] 4799 	ldw x,timer 
      001A1A                       4800 logical_complement:
      009806 04               [ 2] 4801 	cplw x 
      009807 00 02 81         [ 2] 4802 	cpw x,#-1
      00980A 89 90            [ 1] 4803 	jreq 2$
      00980C 93               [ 1] 4804 	clrw x 
      00980D CD 94            [ 1] 4805 2$:	ld a,#TK_INTGR
      00980F 96               [ 4] 4806 	ret 
                                   4807 
                                   4808 ;--------------------------------
                                   4809 ; BASIC NOT(expr) 
                                   4810 ; return logical complement of expr
                                   4811 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      001A24                       4812 func_not:
      009810 25 05 A6         [ 4] 4813 	call func_args  
      009813 09 CC            [ 1] 4814 	cp a,#1
      009815 87 A2            [ 1] 4815 	jreq 1$
      009817 CC 07 20         [ 2] 4816 	jp syntax_error
      009817 55               [ 2] 4817 1$:	popw x 
      009818 00 04            [ 2] 4818 	jra logical_complement
                                   4819 
                                   4820 
                                   4821 
                                   4822 ;-----------------------------------
                                   4823 ; BASIC: IWDGEN expr1 
                                   4824 ; enable independant watchdog timer
                                   4825 ; expr1 is delay in multiple of 62.5µsec
                                   4826 ; expr1 -> {1..16383}
                                   4827 ;-----------------------------------
      001A31                       4828 enable_iwdg:
      00981A 00 02 72         [ 4] 4829 	call arg_list
      00981D 5F 00            [ 1] 4830 	cp a,#1 
      00981F 17 AE            [ 1] 4831 	jreq 1$
      009821 40 00 CF         [ 2] 4832 	jp syntax_error 
      009824 00               [ 2] 4833 1$: popw x 
      009825 18 1E            [ 1] 4834 	push #0
      009827 01 CD 84 1C      [ 1] 4835 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00982B 5F               [ 1] 4836 	ld a,xh 
      00982C 97 5C            [ 1] 4837 	and a,#0x3f
      00982E 90               [ 1] 4838 	ld xh,a  
      00982F 85 89 5F         [ 2] 4839 2$:	cpw x,#255
      009832 CD 82            [ 2] 4840 	jrule 3$
      009834 DC 5B            [ 1] 4841 	inc (1,sp)
      009836 02               [ 1] 4842 	rcf 
      009837 81               [ 2] 4843 	rrcw x 
      009838 20 F5            [ 2] 4844 	jra 2$
      009838 72 0D 52 30      [ 1] 4845 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00983C FB               [ 1] 4846 	pop a  
      00983D 72 16 00         [ 1] 4847 	ld IWDG_PR,a 
      009840 24               [ 1] 4848 	ld a,xl
      009841 8E               [ 1] 4849 	dec a 
      009842 81 55 50 E0      [ 1] 4850 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009843 C7 50 E2         [ 1] 4851 	ld IWDG_RLR,a 
      009843 CD 8D 49 A1      [ 1] 4852 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009847 84               [ 4] 4853 	ret 
                                   4854 
                                   4855 
                                   4856 ;-----------------------------------
                                   4857 ; BASIC: IWDGREF  
                                   4858 ; refresh independant watchdog count down 
                                   4859 ; timer before it reset MCU. 
                                   4860 ;-----------------------------------
      001A67                       4861 refresh_iwdg:
      009848 27 03 CC 87      [ 1] 4862 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00984C A0               [ 4] 4863 	ret 
                                   4864 
                                   4865 
                                   4866 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4867 ; BASIC: LOG(expr)
                                   4868 ; return logarithm base 2 of expr 
                                   4869 ; this is the position of most significant
                                   4870 ; bit set. 
                                   4871 ; input: 
                                   4872 ; output:
                                   4873 ;   X     log2 
                                   4874 ;   A     TK_INTGR 
                                   4875 ;*********************************
      00984D                       4876 log2:
      00984D 5D 27 04         [ 4] 4877 	call func_args 
      009850 8F 5A            [ 1] 4878 	cp a,#1 
      009852 26 F9            [ 1] 4879 	jreq 1$
      009854 4F 81 20         [ 2] 4880 	jp syntax_error 
      009856 85               [ 2] 4881 1$: popw x 
      001A77                       4882 leading_one:
      009856 CD               [ 2] 4883 	tnzw x 
      009857 8D 49            [ 1] 4884 	jreq 4$
      009859 A1 84            [ 1] 4885 	ld a,#15 
      00985B 27               [ 2] 4886 2$: rlcw x 
      00985C 03 CC            [ 1] 4887     jrc 3$
      00985E 87               [ 1] 4888 	dec a 
      00985F A0 FA            [ 2] 4889 	jra 2$
      009860 5F               [ 1] 4890 3$: clrw x 
      009860 A3               [ 1] 4891     ld xl,a
      009861 14 00            [ 1] 4892 4$:	ld a,#TK_INTGR
      009863 2B               [ 4] 4893 	ret 
                                   4894 
                                   4895 ;-----------------------------------
                                   4896 ; BASIC: BIT(expr) 
                                   4897 ; expr ->{0..15}
                                   4898 ; return 2^expr 
                                   4899 ; output:
                                   4900 ;    x    2^expr 
                                   4901 ;-----------------------------------
      001A87                       4902 bitmask:
      009864 0C 35 0F         [ 4] 4903     call func_args 
      009867 50 F2            [ 1] 4904 	cp a,#1
      009869 A6 1E            [ 1] 4905 	jreq 1$
      00986B 62 A6 10         [ 2] 4906 	jp syntax_error 
      00986E 62               [ 2] 4907 1$: popw x 
      00986F 20               [ 1] 4908 	ld a,xl 
      009870 1E 0F            [ 1] 4909 	and a,#15
      009871 5F               [ 1] 4910 	clrw x 
      009871 A3               [ 1] 4911 	incw x 
      009872 08               [ 1] 4912 2$: tnz a 
      009873 00 2B            [ 1] 4913 	jreq 3$
      009875 09               [ 2] 4914 	slaw x 
      009876 35               [ 1] 4915 	dec a 
      009877 0E 50            [ 2] 4916 	jra 2$ 
      009879 F2 A6            [ 1] 4917 3$: ld a,#TK_INTGR
      00987B 50               [ 4] 4918 	ret 
                                   4919 
                                   4920 ;------------------------------
                                   4921 ; BASIC: INVERT(expr)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                   4922 ; 1's complement 
                                   4923 ;--------------------------------
      001AA1                       4924 invert:
      00987C 62 20 10         [ 4] 4925 	call func_args
      00987F A1 01            [ 1] 4926 	cp a,#1 
      00987F 35 07            [ 1] 4927 	jreq 1$
      009881 50 F2 20         [ 2] 4928 	jp syntax_error
      009883 85               [ 2] 4929 1$: popw x  
      009883 A3               [ 2] 4930 	cplw x 
      009884 00 40            [ 1] 4931 	ld a,#TK_INTGR 
      009886 23               [ 4] 4932 	ret 
                                   4933 
                                   4934 ;------------------------------
                                   4935 ; BASIC: DO 
                                   4936 ; initiate a DO ... UNTIL loop 
                                   4937 ;------------------------------
                           000003  4938 	DOLP_ADR=3 
                           000005  4939 	DOLP_INW=5
                           000004  4940 	VSIZE=4 
      001AB0                       4941 do_loop:
      009887 07               [ 2] 4942 	popw x 
      001AB1                       4943 	_vars VSIZE 
      009888 72 5C            [ 2]    1     sub sp,#VSIZE 
      00988A 50               [ 2] 4944 	pushw x 
      00988B F2 54 20 F4      [ 2] 4945 	ldw y,basicptr 
      00988F 17 03            [ 2] 4946 	ldw (DOLP_ADR,sp),y
      00988F 9F 4A 27 01      [ 2] 4947 	ldw y,in.w 
      009893 4A 05            [ 2] 4948 	ldw (DOLP_INW,sp),y
      009894 72 5C 00 20      [ 1] 4949 	inc loop_depth 
      009894 A4               [ 4] 4950 	ret 
                                   4951 
                                   4952 ;--------------------------------
                                   4953 ; BASIC: UNTIL expr 
                                   4954 ; loop if exprssion is false 
                                   4955 ; else terminate loop
                                   4956 ;--------------------------------
      001AC5                       4957 until: 
      009895 3E C7 50 F1      [ 1] 4958 	tnz loop_depth 
      009899 72 18            [ 1] 4959 	jrne 1$ 
      00989B 50 F0 8E         [ 2] 4960 	jp syntax_error 
      001ACE                       4961 1$: 
      00989E 81 0D 12         [ 4] 4962 	call relation 
      00989F A1 84            [ 1] 4963 	cp a,#TK_INTGR
      00989F CE 00            [ 1] 4964 	jreq 2$
      0098A1 0F A6 84         [ 2] 4965 	jp syntax_error
      001AD8                       4966 2$: 
      0098A4 81               [ 2] 4967 	tnzw x 
      0098A5 26 10            [ 1] 4968 	jrne 9$
      0098A5 CD 8C            [ 2] 4969 	ldw x,(DOLP_ADR,sp)
      0098A7 45 A1 01         [ 2] 4970 	ldw basicptr,x 
      0098AA 27 03            [ 1] 4971 	ld a,(2,x)
      0098AC CC 87 A0         [ 1] 4972 	ld count,a 
      0098AF 1E 05            [ 2] 4973 	ldw x,(DOLP_INW,sp)
      0098AF 85 9E A5         [ 2] 4974 	ldw in.w,x 
      0098B2 80               [ 4] 4975 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      001AEB                       4976 9$:	; remove loop data from stack  
      0098B3 27               [ 2] 4977 	popw x
      001AEC                       4978 	_drop VSIZE
      0098B4 01 50            [ 2]    1     addw sp,#VSIZE 
      0098B6 A6 84 81 20      [ 1] 4979 	dec loop_depth 
      0098B9 FC               [ 2] 4980 	jp (x)
                                   4981 
                                   4982 ;--------------------------
                                   4983 ; BASIC: PRTA...PRTI  
                                   4984 ;  return constant value 
                                   4985 ;  PORT  offset in GPIO
                                   4986 ;  array
                                   4987 ;---------------------------
      001AF3                       4988 const_porta:
      0098B9 CD 8C 45         [ 2] 4989 	ldw x,#0
      0098BC A1 02            [ 1] 4990 	ld a,#TK_INTGR 
      0098BE 27               [ 4] 4991 	ret 
      001AF9                       4992 const_portb:
      0098BF 03 CC 87         [ 2] 4993 	ldw x,#1
      0098C2 A0 85            [ 1] 4994 	ld a,#TK_INTGR 
      0098C4 9E               [ 4] 4995 	ret 
      001AFF                       4996 const_portc:
      0098C5 14 01 95         [ 2] 4997 	ldw x,#2
      0098C8 9F 14            [ 1] 4998 	ld a,#TK_INTGR 
      0098CA 02               [ 4] 4999 	ret 
      001B05                       5000 const_portd:
      0098CB 97 5B 02         [ 2] 5001 	ldw x,#3
      0098CE A6 84            [ 1] 5002 	ld a,#TK_INTGR 
      0098D0 81               [ 4] 5003 	ret 
      0098D1                       5004 const_porte:
      0098D1 CD 8C 45         [ 2] 5005 	ldw x,#4
      0098D4 A1 02            [ 1] 5006 	ld a,#TK_INTGR 
      0098D6 27               [ 4] 5007 	ret 
      001B11                       5008 const_portf:
      0098D7 03 CC 87         [ 2] 5009 	ldw x,#5
      0098DA A0 84            [ 1] 5010 	ld a,#TK_INTGR 
      0098DB 81               [ 4] 5011 	ret 
      001B17                       5012 const_portg:
      0098DB 85 9E 1A         [ 2] 5013 	ldw x,#6
      0098DE 01 95            [ 1] 5014 	ld a,#TK_INTGR 
      0098E0 9F               [ 4] 5015 	ret 
      001B1D                       5016 const_porth:
      0098E1 1A 02 97         [ 2] 5017 	ldw x,#7
      0098E4 5B 02            [ 1] 5018 	ld a,#TK_INTGR 
      0098E6 A6               [ 4] 5019 	ret 
      001B23                       5020 const_porti:
      0098E7 84 81 08         [ 2] 5021 	ldw x,#8
      0098E9 A6 84            [ 1] 5022 	ld a,#TK_INTGR 
      0098E9 CD               [ 4] 5023 	ret 
                                   5024 
                                   5025 ;-------------------------------
                                   5026 ; following return constant 
                                   5027 ; related to GPIO register offset 
                                   5028 ;---------------------------------
      001B29                       5029 const_odr:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0098EA 8C 45            [ 1] 5030 	ld a,#TK_INTGR 
      0098EC A1 02 27         [ 2] 5031 	ldw x,#GPIO_ODR
      0098EF 03               [ 4] 5032 	ret 
      001B2F                       5033 const_idr:
      0098F0 CC 87            [ 1] 5034 	ld a,#TK_INTGR 
      0098F2 A0 00 01         [ 2] 5035 	ldw x,#GPIO_IDR
      0098F3 81               [ 4] 5036 	ret 
      001B35                       5037 const_ddr:
      0098F3 85 9E            [ 1] 5038 	ld a,#TK_INTGR 
      0098F5 18 01 95         [ 2] 5039 	ldw x,#GPIO_DDR
      0098F8 9F               [ 4] 5040 	ret 
      001B3B                       5041 const_cr1:
      0098F9 18 02            [ 1] 5042 	ld a,#TK_INTGR 
      0098FB 97 5B 02         [ 2] 5043 	ldw x,#GPIO_CR1
      0098FE A6               [ 4] 5044 	ret 
      001B41                       5045 const_cr2:
      0098FF 84 81            [ 1] 5046 	ld a,#TK_INTGR 
      009901 AE 00 04         [ 2] 5047 	ldw x,#GPIO_CR2
      009901 CD               [ 4] 5048 	ret 
                                   5049 ;-------------------------
                                   5050 ; BASIC: POUT 
                                   5051 ;  constant for port mode
                                   5052 ;  used by PMODE 
                                   5053 ;  to set pin as output
                                   5054 ;------------------------
      001B47                       5055 const_output:
      009902 8C 45            [ 1] 5056 	ld a,#TK_INTGR 
      009904 A1 02 27         [ 2] 5057 	ldw x,#OUTP
      009907 03               [ 4] 5058 	ret 
                                   5059 
                                   5060 ;-------------------------
                                   5061 ; BASIC: PINP 
                                   5062 ;  constant for port mode
                                   5063 ;  used by PMODE 
                                   5064 ;  to set pin as input
                                   5065 ;------------------------
      001B4D                       5066 const_input:
      009908 CC 87            [ 1] 5067 	ld a,#TK_INTGR 
      00990A A0 90 85         [ 2] 5068 	ldw x,#INP 
      00990D 85               [ 4] 5069 	ret 
                                   5070 	
                                   5071 ;-----------------------
                                   5072 ; memory area constants
                                   5073 ;-----------------------
      001B53                       5074 const_eeprom_base:
      00990E 90 5D            [ 1] 5075 	ld a,#TK_INTGR 
      009910 27 05 58         [ 2] 5076 	ldw x,#EEPROM_BASE 
      009913 90               [ 4] 5077 	ret 
                                   5078 
                                   5079 ;---------------------------
                                   5080 ; BASIC: DATA 
                                   5081 ; when the interpreter find 
                                   5082 ; a DATA line it skip it.
                                   5083 ;---------------------------
      001B59                       5084 data:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009914 5A 26 FB 00 01   [ 1] 5085 	mov in,count 
      009917 81               [ 4] 5086 	ret 
                                   5087 
                                   5088 ;---------------------------
                                   5089 ; BASIC: DATLN  *expr*
                                   5090 ; set DATA pointer at line# 
                                   5091 ; specified by *expr* 
                                   5092 ;---------------------------
      001B5F                       5093 data_line:
      009917 A6 84 81         [ 4] 5094 	call expression
      00991A A1 84            [ 1] 5095 	cp a,#TK_INTGR
      00991A CD 8C            [ 1] 5096 	jreq 1$
      00991C 45 A1 02         [ 2] 5097 	jp syntax_error  
      00991F 27               [ 1] 5098 1$: clr a 
      009920 03 CC 87         [ 4] 5099 	call search_lineno
      009923 A0               [ 2] 5100 	tnzw x 
      009924 90 85            [ 1] 5101 	jrne 3$
      009926 85 90            [ 1] 5102 2$:	ld a,#ERR_NO_LINE 
      009928 5D 27 05         [ 2] 5103 	jp tb_error
      001B75                       5104 3$: ; check if valid data line 
      00992B 54 90            [ 1] 5105     ldw y,x 
      00992D 5A 26            [ 2] 5106 	ldw x,(4,x)
      00992F FB 1B 59         [ 2] 5107 	cpw x,#data 
      009930 26 F2            [ 1] 5108 	jrne 2$ 
      009930 A6 84 81 06      [ 2] 5109 	ldw data_ptr,y
      009933 90 E6 02         [ 1] 5110 	ld a,(2,y)
      009933 A6 84 CD         [ 1] 5111 	ld data_len,a 
      009936 8C 38 9F A4      [ 1] 5112 	mov data_ofs,#FIRST_DATA_ITEM 
      00993A 07               [ 4] 5113 	ret
                                   5114 
                                   5115 ;---------------------------------
                                   5116 ; BASIC: RESTORE 
                                   5117 ; set data_ptr to first data line
                                   5118 ; if not DATA found pointer set to
                                   5119 ; zero 
                                   5120 ;---------------------------------
      001B8D                       5121 restore:
      00993B C7 50 C6 81      [ 1] 5122 	clr data_ptr 
      00993F 72 5F 00 07      [ 1] 5123 	clr data_ptr+1
      00993F 52 01 CD 8C      [ 1] 5124 	clr data_ofs 
      009943 4A A1 02 27      [ 1] 5125 	clr data_len
      009947 03 CC 87         [ 2] 5126 	ldw x,txtbgn
      001BA0                       5127 data_search_loop: 	
      00994A A0 90 85         [ 2] 5128 	cpw x,txtend
      00994D 85 CD            [ 1] 5129 	jruge 9$
      00994F 99 8B            [ 1] 5130 	ldw y,x 
      009951 6B 01            [ 2] 5131 	ldw x,(4,x)
      009953 A6 01 0D         [ 2] 5132 	addw x,#code_addr
      009956 01               [ 2] 5133 	ldw x,(x)
      009957 27 0D 48         [ 2] 5134 	cpw x,#data 
      00995A 0A 01            [ 1] 5135 	jrne try_next_line 
      00995C 26 FB 6B 01      [ 2] 5136 	ldw data_ptr,y 
      009960 7B 01 EA         [ 1] 5137 	ld a,(2,y)
      009963 03 E7 03         [ 1] 5138 	ld data_len,a 
      009966 90 A3 00 01      [ 1] 5139 	mov data_ofs,#FIRST_DATA_ITEM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      00996A 27 10 7B 01      [ 1] 5140 9$:	tnz data_len 
      00996E 43 E4            [ 1] 5141     jrne 10$
      009970 04 E7            [ 1] 5142 	ld a,#ERR_NO_DATA 
      009972 04 7B 01         [ 2] 5143 	jp tb_error 
      009975 43               [ 4] 5144 10$:ret
      001BCC                       5145 try_next_line:
      009976 E4               [ 1] 5146 	ldw x,y 
      009977 02 E7            [ 1] 5147 	ld a,(2,x)
      009979 02 20 0C         [ 1] 5148 	ld acc8,a 
      00997C 72 5F 00 0C      [ 1] 5149 	clr acc16 
      00997C 7B 01 EA 02      [ 2] 5150 	addw x,acc16 
      009980 E7 02            [ 2] 5151 	jra data_search_loop
                                   5152 
                                   5153 
                                   5154 ;---------------------------------
                                   5155 ; BASIC: READ 
                                   5156 ; return next data item | 0 
                                   5157 ;---------------------------------
                           000001  5158 	CTX_BPTR=1 
                           000003  5159 	CTX_IN=3 
                           000004  5160 	CTX_COUNT=4 
                           000005  5161 	XSAVE=5
                           000006  5162 	VSIZE=6
      001BDC                       5163 read:
      001BDC                       5164 	_vars  VSIZE 
      009982 7B 01            [ 2]    1     sub sp,#VSIZE 
      001BDE                       5165 read01:	
      009984 EA 04 E7         [ 1] 5166 	ld a,data_ofs
      009987 04 00 09         [ 1] 5167 	cp a,data_len 
      009988 27 37            [ 1] 5168 	jreq 2$ ; end of line  
      009988 5B 01 81         [ 4] 5169 	call save_context
      00998B CE 00 06         [ 2] 5170 	ldw x,data_ptr 
      00998B 58 1C 99         [ 2] 5171 	ldw basicptr,x 
      00998E 9B FE 9F 88 5E   [ 1] 5172 	mov in,data_ofs 
      009993 A6 05 42 1C 50   [ 1] 5173 	mov count,data_len  
      009998 00 84 81         [ 4] 5174 	call expression 
      00999B A1 84            [ 1] 5175 	cp a,#TK_INTGR 
      00999B 03 06            [ 1] 5176 	jreq 1$ 
      00999D 03 05 04         [ 2] 5177 	jp syntax_error 
      001C03                       5178 1$:
      0099A0 00 02            [ 2] 5179 	ldw (XSAVE,SP),x
      0099A2 01 06 00         [ 4] 5180 	call next_token ; skip comma
      0099A5 02 02 02         [ 2] 5181 	ldw x,basicptr 
      0099A8 03 03 01         [ 2] 5182 	ldw data_ptr,x 
      0099AB 03 03 02 04 04   [ 1] 5183 	mov data_ofs,in 
      0099B0 05 02 06         [ 4] 5184 	call rest_context
      0099B3 02 07            [ 2] 5185 	ldw x,(XSAVE,sp)
      0099B5 02 05            [ 1] 5186 	ld a,#TK_INTGR
      001C1A                       5187 	_drop VSIZE 
      0099B7 04 02            [ 2]    1     addw sp,#VSIZE 
      0099B9 04               [ 4] 5188 	ret 
      001C1D                       5189 2$: ; end of line reached 
      0099BA 01 CE 00 06      [ 2] 5190 	ldw y, data_ptr 
      0099BB 72 5F 00 06      [ 1] 5191 	clr data_ptr
      0099BB CD 8C 45 A1      [ 1] 5192 	clr data_ptr+1   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      0099BF 01 27 03 CC      [ 1] 5193 	clr data_ofs 
      0099C3 87 A0 00 09      [ 1] 5194 	clr data_len 
      0099C5 CD 1B CC         [ 4] 5195 	call try_next_line 
      0099C5 A6 80            [ 2] 5196 	jra read01
                                   5197 
                                   5198 
                                   5199 ;---------------------------------
                                   5200 ; BASIC: SPIEN clkdiv, 0|1  
                                   5201 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   5202 ; if clkdiv==-1 disable SPI
                                   5203 ; 0|1 -> disable|enable  
                                   5204 ;--------------------------------- 
                           000005  5205 SPI_CS_BIT=5
      001C36                       5206 spi_enable:
      0099C7 15 01 27         [ 4] 5207 	call arg_list 
      0099CA 05 A6            [ 1] 5208 	cp a,#2
      0099CC 0A CC            [ 1] 5209 	jreq 1$
      0099CE 87 A2 20         [ 2] 5210 	jp syntax_error 
      0099D0                       5211 1$: 
      0099D0 CE 00 13 58      [ 1] 5212 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      0099D4 58               [ 2] 5213 	popw x  
      0099D5 58               [ 2] 5214 	tnzw x 
      0099D6 58 58            [ 1] 5215 	jreq spi_disable 
      0099D8 9E               [ 2] 5216 	popw x 
      0099D9 C8 00            [ 1] 5217 	ld a,#(1<<SPI_CR1_BR)
      0099DB 13               [ 4] 5218 	mul x,a 
      0099DC C7               [ 1] 5219 	ld a,xl 
      0099DD 00 0D 9F         [ 1] 5220 	ld SPI_CR1,a 
                                   5221 ; configure ~CS on PE5 (D10 on CN8) as output. 
      0099E0 C8 00 14 C7      [ 1] 5222 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      0099E4 00 0E CE 00      [ 1] 5223 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   5224 ; configure SPI as master mode 0.	
      0099E8 15 CF 00 13      [ 1] 5225 	bset SPI_CR1,#SPI_CR1_MSTR
                                   5226 ; ~CS line controlled by sofware 	
      0099EC 90 54 90 9E      [ 1] 5227 	bset SPI_CR2,#SPI_CR2_SSM 
      0099F0 C8 00 15 C7      [ 1] 5228     bset SPI_CR2,#SPI_CR2_SSI 
                                   5229 ; enable SPI
      0099F4 00 15 90 9F      [ 1] 5230 	bset SPI_CR1,#SPI_CR1_SPE 	
      0099F8 C8               [ 4] 5231 	ret 
      001C69                       5232 spi_disable:
      001C69                       5233 	_drop #2; throw first argument.
      0099F9 00 16            [ 2]    1     addw sp,##2 
                                   5234 ; wait spi idle 
      0099FB C7 00            [ 1] 5235 1$:	ld a,#0x82 
      0099FD 16 CE 00         [ 1] 5236 	and a,SPI_SR
      009A00 0D 54            [ 1] 5237 	cp a,#2 
      009A02 54 54            [ 1] 5238 	jrne 1$
      009A04 9E C8 00 0D      [ 1] 5239 	bres SPI_CR1,#SPI_CR1_SPE
      009A08 95 9F C8 00      [ 1] 5240 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009A0C 0E 97 C8 00      [ 1] 5241 	bres PE_DDR,#SPI_CS_BIT 
      009A10 16               [ 4] 5242 	ret 
                                   5243 
      001C81                       5244 spi_clear_error:
      009A11 97 9E            [ 1] 5245 	ld a,#0x78 
      009A13 C8 00 15         [ 1] 5246 	bcp a,SPI_SR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009A16 95 CF            [ 1] 5247 	jreq 1$
      009A18 00 15 90 85      [ 1] 5248 	clr SPI_SR 
      009A1C 65               [ 4] 5249 1$: ret 
                                   5250 
      001C8D                       5251 spi_send_byte:
      009A1D 93               [ 1] 5252 	push a 
      009A1E 5C 1C 81         [ 4] 5253 	call spi_clear_error
      009A1F 84               [ 1] 5254 	pop a 
      009A1F A6 84 81 03 FB   [ 2] 5255 	btjf SPI_SR,#SPI_SR_TXE,.
      009A22 C7 52 04         [ 1] 5256 	ld SPI_DR,a
      009A22 52 03 0F 02 0F   [ 2] 5257 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009A27 03 90 AE         [ 1] 5258 	ld a,SPI_DR 
      009A2A A1               [ 4] 5259 	ret 
                                   5260 
      001CA3                       5261 spi_rcv_byte:
      009A2B 0E 93            [ 1] 5262 	ld a,#255
      009A2D F6 A4 0F 6B 01   [ 2] 5263 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009A32 0C 03 5C         [ 1] 5264 	ld a,SPI_DR 
      009A35 F6               [ 4] 5265 	ret
                                   5266 
                                   5267 ;------------------------------
                                   5268 ; BASIC: SPIWR byte [,byte]
                                   5269 ; write 1 or more byte
                                   5270 ;------------------------------
      001CAE                       5271 spi_write:
      009A36 CD 83 42         [ 4] 5272 	call expression
      009A39 0C 02            [ 1] 5273 	cp a,#TK_INTGR 
      009A3B 0A 01            [ 1] 5274 	jreq 1$
      009A3D 26 F5 A6         [ 2] 5275 	jp syntax_error 
      001CB8                       5276 1$:	
      009A40 46               [ 1] 5277 	ld a,xl 
      009A41 11 02 2B         [ 4] 5278 	call spi_send_byte 
      009A44 09 A6 20         [ 4] 5279 	call next_token 
      009A47 CD 83            [ 1] 5280 	cp a,#TK_COMMA 
      009A49 42 0C            [ 1] 5281 	jrne 2$ 
      009A4B 02 20            [ 2] 5282 	jra spi_write 
      009A4D 07               [ 1] 5283 2$:	tnz a 
      009A4E A6 0D            [ 1] 5284 	jreq 3$
      001CC8                       5285 	_unget_token  
      009A50 CD 83 42 0F 02   [ 1]    1      mov in,in.saved  
      009A55 72               [ 4] 5286 3$:	ret 
                                   5287 
                                   5288 
                                   5289 ;-------------------------------
                                   5290 ; BASIC: SPIRD 	
                                   5291 ; read one byte from SPI 
                                   5292 ;-------------------------------
      001CCE                       5293 spi_read:
      009A56 A2 00 02         [ 4] 5294 	call spi_rcv_byte 
      009A59 90               [ 1] 5295 	clrw x 
      009A5A FE               [ 1] 5296 	ld xl,a 
      009A5B 26 CF            [ 1] 5297 	ld a,#TK_INTGR 
      009A5D A6               [ 4] 5298 	ret 
                                   5299 
                                   5300 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5301 ; BASIC: SPISEL 0|1 
                                   5302 ; set state of ~CS line
                                   5303 ; 0|1 deselect|select  
                                   5304 ;------------------------------
      001CD6                       5305 spi_select:
      009A5E 0D CD 83         [ 4] 5306 	call next_token 
      009A61 42 5F            [ 1] 5307 	cp a,#TK_INTGR 
      009A63 7B 03            [ 1] 5308 	jreq 1$
      009A65 97 CD 88         [ 2] 5309 	jp syntax_error 
      009A68 ED               [ 2] 5310 1$: tnzw x  
      009A69 AE 9A            [ 1] 5311 	jreq cs_high 
      009A6B 72 CD A2 40      [ 1] 5312 	bres PE_ODR,#SPI_CS_BIT
      009A6F 5B               [ 4] 5313 	ret 
      001CE8                       5314 cs_high: 
      009A70 03 81 20 77      [ 1] 5315 	bset PE_ODR,#SPI_CS_BIT
      009A74 6F               [ 4] 5316 	ret 
                                   5317 
                                   5318 ;-------------------------------
                                   5319 ; BASIC: PAD 
                                   5320 ; Return pad buffer address.
                                   5321 ;------------------------------
      001CED                       5322 pad_ref:
      009A75 72 64 73         [ 2] 5323 	ldw x,#pad 
      009A78 20 69            [ 1] 5324 	ld a,TK_INTGR
      009A7A 6E               [ 4] 5325 	ret 
                                   5326 
                                   5327 
                                   5328 ;------------------------------
                                   5329 ;      dictionary 
                                   5330 ; format:
                                   5331 ;   link:   2 bytes 
                                   5332 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5333 ;   cmd_name: 16 byte max 
                                   5334 ;   cmd_index: 2 bytes 
                                   5335 ;------------------------------
                                   5336 	.macro _dict_entry len,name,cmd_idx 
                                   5337 	.word LINK 
                                   5338 	LINK=.
                                   5339 name:
                                   5340 	.byte len 	
                                   5341 	.ascii "name"
                                   5342 	.word cmd_idx 
                                   5343 	.endm 
                                   5344 
                           000000  5345 	LINK=0
                                   5346 ; respect alphabetic order for BASIC names from Z-A
                                   5347 ; this sort order is for a cleaner WORDS cmd output. 	
      001CF3                       5348 kword_end:
      001CF3                       5349 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      009A7B 20 64                    1 	.word LINK 
                           001CF5     2 	LINK=.
      001CF5                          3 XOR:
      009A7D 69                       4 	.byte 3+F_IFUNC 	
      009A7E 63 74 69                 5 	.ascii "XOR"
      009A81 6F 6E                    6 	.word XOR_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      001CFB                       5350 	_dict_entry,5,WRITE,WRITE_IDX;write  
      009A83 61 72                    1 	.word LINK 
                           001CFD     2 	LINK=.
      001CFD                          3 WRITE:
      009A85 79                       4 	.byte 5 	
      009A86 0A 00 49 54 45           5 	.ascii "WRITE"
      009A88 00 C4                    6 	.word WRITE_IDX 
      001D05                       5351 	_dict_entry,5,WORDS,WORDS_IDX;words 
      009A88 CD 8C                    1 	.word LINK 
                           001D07     2 	LINK=.
      001D07                          3 WORDS:
      009A8A 4A                       4 	.byte 5 	
      009A8B A1 01 27 03 CC           5 	.ascii "WORDS"
      009A90 87 A0                    6 	.word WORDS_IDX 
      009A92                       5352 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      009A92 85 CF                    1 	.word LINK 
                           001D11     2 	LINK=.
      001D11                          3 WAIT:
      009A94 00                       4 	.byte 4 	
      009A95 11 81 49 54              5 	.ascii "WAIT"
      009A97 00 C0                    6 	.word WAIT_IDX 
      001D18                       5353 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      009A97 CE 00                    1 	.word LINK 
                           001D1A     2 	LINK=.
      001D1A                          3 USR:
      009A99 11                       4 	.byte 3+F_IFUNC 	
      009A9A 55 53 52                 5 	.ascii "USR"
      009A9A 53 A3                    6 	.word USR_IDX 
      001D20                       5354 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      009A9C FF FF                    1 	.word LINK 
                           001D22     2 	LINK=.
      001D22                          3 UNTIL:
      009A9E 27                       4 	.byte 5 	
      009A9F 01 5F A6 84 81           5 	.ascii "UNTIL"
      009AA4 00 BC                    6 	.word UNTIL_IDX 
      001D2A                       5355 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      009AA4 CD 8C                    1 	.word LINK 
                           001D2C     2 	LINK=.
      001D2C                          3 UFLASH:
      009AA6 45                       4 	.byte 6+F_IFUNC 	
      009AA7 A1 01 27 03 CC 87        5 	.ascii "UFLASH"
      009AAD A0 85                    6 	.word UFLASH_IDX 
      001D35                       5356 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      009AAF 20 E9                    1 	.word LINK 
                           001D37     2 	LINK=.
      009AB1                          3 UBOUND:
      009AB1 CD                       4 	.byte 6+F_IFUNC 	
      009AB2 8C 4A A1 01 27 03        5 	.ascii "UBOUND"
      009AB8 CC 87                    6 	.word UBOUND_IDX 
      001D40                       5357 	_dict_entry,4,TONE,TONE_IDX;tone  
      009ABA A0 85                    1 	.word LINK 
                           001D42     2 	LINK=.
      001D42                          3 TONE:
      009ABC 4B                       4 	.byte 4 	
      009ABD 00 35 CC 50              5 	.ascii "TONE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009AC1 E0 9E                    6 	.word TONE_IDX 
      001D49                       5358 	_dict_entry,2,TO,TO_IDX;to
      009AC3 A4 3F                    1 	.word LINK 
                           001D4B     2 	LINK=.
      001D4B                          3 TO:
      009AC5 95                       4 	.byte 2 	
      009AC6 A3 00                    5 	.ascii "TO"
      009AC8 FF 23                    6 	.word TO_IDX 
      001D50                       5359 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      009ACA 06 0C                    1 	.word LINK 
                           001D52     2 	LINK=.
      001D52                          3 TIMER:
      009ACC 01                       4 	.byte 5 	
      009ACD 98 56 20 F5 35           5 	.ascii "TIMER"
      009AD2 55 50                    6 	.word TIMER_IDX 
      001D5A                       5360 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      009AD4 E0 84                    1 	.word LINK 
                           001D5C     2 	LINK=.
      001D5C                          3 TIMEOUT:
      009AD6 C7                       4 	.byte 7+F_IFUNC 	
      009AD7 50 E1 9F 4A 35 55 50     5 	.ascii "TIMEOUT"
      009ADE E0 C7                    6 	.word TMROUT_IDX 
      001D66                       5361 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      009AE0 50 E2                    1 	.word LINK 
                           001D68     2 	LINK=.
      001D68                          3 TICKS:
      009AE2 35                       4 	.byte 5+F_IFUNC 	
      009AE3 AA 50 E0 81 53           5 	.ascii "TICKS"
      009AE7 00 AE                    6 	.word TICKS_IDX 
      001D70                       5362 	_dict_entry,4,STOP,STOP_IDX;stop 
      009AE7 35 AA                    1 	.word LINK 
                           001D72     2 	LINK=.
      001D72                          3 STOP:
      009AE9 50                       4 	.byte 4 	
      009AEA E0 81 4F 50              5 	.ascii "STOP"
      009AEC 00 AC                    6 	.word STOP_IDX 
      001D79                       5363 	_dict_entry,4,STEP,STEP_IDX;step 
      009AEC CD 8C                    1 	.word LINK 
                           001D7B     2 	LINK=.
      001D7B                          3 STEP:
      009AEE 45                       4 	.byte 4 	
      009AEF A1 01 27 03              5 	.ascii "STEP"
      009AF3 CC 87                    6 	.word STEP_IDX 
      001D82                       5364 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      009AF5 A0 85                    1 	.word LINK 
                           001D84     2 	LINK=.
      009AF7                          3 SPIWR:
      009AF7 5D                       4 	.byte 5 	
      009AF8 27 0A A6 0F 59           5 	.ascii "SPIWR"
      009AFD 25 03                    6 	.word SPIWR_IDX 
      001D8C                       5365 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      009AFF 4A 20                    1 	.word LINK 
                           001D8E     2 	LINK=.
      001D8E                          3 SPISEL:
      009B01 FA                       4 	.byte 6 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009B02 5F 97 A6 84 81 4C        5 	.ascii "SPISEL"
      009B07 00 A6                    6 	.word SPISEL_IDX 
      001D97                       5366 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      009B07 CD 8C                    1 	.word LINK 
                           001D99     2 	LINK=.
      001D99                          3 SPIRD:
      009B09 45                       4 	.byte 5+F_IFUNC 	
      009B0A A1 01 27 03 CC           5 	.ascii "SPIRD"
      009B0F 87 A0                    6 	.word SPIRD_IDX 
      001DA1                       5367 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      009B11 85 9F                    1 	.word LINK 
                           001DA3     2 	LINK=.
      001DA3                          3 SPIEN:
      009B13 A4                       4 	.byte 5 	
      009B14 0F 5F 5C 4D 27           5 	.ascii "SPIEN"
      009B19 04 58                    6 	.word SPIEN_IDX 
      001DAB                       5368 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      009B1B 4A 20                    1 	.word LINK 
                           001DAD     2 	LINK=.
      001DAD                          3 SLEEP:
      009B1D F9                       4 	.byte 5 	
      009B1E A6 84 81 45 50           5 	.ascii "SLEEP"
      009B21 00 A0                    6 	.word SLEEP_IDX 
      001DB5                       5369     _dict_entry,4,SHOW,SHOW_IDX;show 
      009B21 CD 8C                    1 	.word LINK 
                           001DB7     2 	LINK=.
      001DB7                          3 SHOW:
      009B23 45                       4 	.byte 4 	
      009B24 A1 01 27 03              5 	.ascii "SHOW"
      009B28 CC 87                    6 	.word SHOW_IDX 
      001DBE                       5370 	_dict_entry,4,SAVE,SAVE_IDX;save
      009B2A A0 85                    1 	.word LINK 
                           001DC0     2 	LINK=.
      001DC0                          3 SAVE:
      009B2C 53                       4 	.byte 4 	
      009B2D A6 84 81 45              5 	.ascii "SAVE"
      009B30 00 9A                    6 	.word SAVE_IDX 
      001DC7                       5371 	_dict_entry 3,RUN,RUN_IDX;run
      009B30 85 52                    1 	.word LINK 
                           001DC9     2 	LINK=.
      001DC9                          3 RUN:
      009B32 04                       4 	.byte 3 	
      009B33 89 90 CE                 5 	.ascii "RUN"
      009B36 00 05                    6 	.word RUN_IDX 
      001DCF                       5372 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      009B38 17 03                    1 	.word LINK 
                           001DD1     2 	LINK=.
      001DD1                          3 RSHIFT:
      009B3A 90                       4 	.byte 6+F_IFUNC 	
      009B3B CE 00 01 17 05 72        5 	.ascii "RSHIFT"
      009B41 5C 00                    6 	.word RSHIFT_IDX 
      001DDA                       5373 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      009B43 21 81                    1 	.word LINK 
                           001DDC     2 	LINK=.
      009B45                          3 RND:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009B45 72                       4 	.byte 3+F_IFUNC 	
      009B46 5D 00 21                 5 	.ascii "RND"
      009B49 26 03                    6 	.word RND_IDX 
      001DE2                       5374 	_dict_entry,6,RETURN,RET_IDX;return 
      009B4B CC 87                    1 	.word LINK 
                           001DE4     2 	LINK=.
      001DE4                          3 RETURN:
      009B4D A0                       4 	.byte 6 	
      009B4E 52 45 54 55 52 4E        5 	.ascii "RETURN"
      009B4E CD 8D                    6 	.word RET_IDX 
      001DED                       5375 	_dict_entry,7,RESTORE,REST_IDX;restore 
      009B50 92 A1                    1 	.word LINK 
                           001DEF     2 	LINK=.
      001DEF                          3 RESTORE:
      009B52 84                       4 	.byte 7 	
      009B53 27 03 CC 87 A0 52 45     5 	.ascii "RESTORE"
      009B58 00 90                    6 	.word REST_IDX 
      001DF9                       5376 	_dict_entry 6,REMARK,REM_IDX;remark 
      009B58 5D 26                    1 	.word LINK 
                           001DFB     2 	LINK=.
      001DFB                          3 REMARK:
      009B5A 10                       4 	.byte 6 	
      009B5B 1E 03 CF 00 05 E6        5 	.ascii "REMARK"
      009B61 02 C7                    6 	.word REM_IDX 
      001E04                       5377 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      009B63 00 04                    1 	.word LINK 
                           001E06     2 	LINK=.
      001E06                          3 REBOOT:
      009B65 1E                       4 	.byte 6 	
      009B66 05 CF 00 01 81 54        5 	.ascii "REBOOT"
      009B6B 00 8C                    6 	.word RBT_IDX 
      001E0F                       5378 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      009B6B 85 5B                    1 	.word LINK 
                           001E11     2 	LINK=.
      001E11                          3 READ:
      009B6D 04                       4 	.byte 4+F_IFUNC 	
      009B6E 72 5A 00 21              5 	.ascii "READ"
      009B72 FC 8A                    6 	.word READ_IDX 
      009B73                       5379 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      009B73 AE 00                    1 	.word LINK 
                           001E1A     2 	LINK=.
      001E1A                          3 QKEY:
      009B75 00                       4 	.byte 4+F_IFUNC 	
      009B76 A6 84 81 59              5 	.ascii "QKEY"
      009B79 00 88                    6 	.word QKEY_IDX 
      001E21                       5380 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      009B79 AE 00                    1 	.word LINK 
                           001E23     2 	LINK=.
      001E23                          3 PRTI:
      009B7B 01                       4 	.byte 4+F_IFUNC 	
      009B7C A6 84 81 49              5 	.ascii "PRTI"
      009B7F 00 86                    6 	.word PRTI_IDX 
      001E2A                       5381 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      009B7F AE 00                    1 	.word LINK 
                           001E2C     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      001E2C                          3 PRTH:
      009B81 02                       4 	.byte 4+F_IFUNC 	
      009B82 A6 84 81 48              5 	.ascii "PRTH"
      009B85 00 84                    6 	.word PRTH_IDX 
      001E33                       5382 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      009B85 AE 00                    1 	.word LINK 
                           001E35     2 	LINK=.
      001E35                          3 PRTG:
      009B87 03                       4 	.byte 4+F_IFUNC 	
      009B88 A6 84 81 47              5 	.ascii "PRTG"
      009B8B 00 82                    6 	.word PRTG_IDX 
      001E3C                       5383 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      009B8B AE 00                    1 	.word LINK 
                           001E3E     2 	LINK=.
      001E3E                          3 PRTF:
      009B8D 04                       4 	.byte 4+F_IFUNC 	
      009B8E A6 84 81 46              5 	.ascii "PRTF"
      009B91 00 80                    6 	.word PRTF_IDX 
      001E45                       5384 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      009B91 AE 00                    1 	.word LINK 
                           001E47     2 	LINK=.
      001E47                          3 PRTE:
      009B93 05                       4 	.byte 4+F_IFUNC 	
      009B94 A6 84 81 45              5 	.ascii "PRTE"
      009B97 00 7E                    6 	.word PRTE_IDX 
      001E4E                       5385 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      009B97 AE 00                    1 	.word LINK 
                           001E50     2 	LINK=.
      001E50                          3 PRTD:
      009B99 06                       4 	.byte 4+F_IFUNC 	
      009B9A A6 84 81 44              5 	.ascii "PRTD"
      009B9D 00 7C                    6 	.word PRTD_IDX 
      001E57                       5386 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      009B9D AE 00                    1 	.word LINK 
                           001E59     2 	LINK=.
      001E59                          3 PRTC:
      009B9F 07                       4 	.byte 4+F_IFUNC 	
      009BA0 A6 84 81 43              5 	.ascii "PRTC"
      009BA3 00 7A                    6 	.word PRTC_IDX 
      001E60                       5387 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      009BA3 AE 00                    1 	.word LINK 
                           001E62     2 	LINK=.
      001E62                          3 PRTB:
      009BA5 08                       4 	.byte 4+F_IFUNC 	
      009BA6 A6 84 81 42              5 	.ascii "PRTB"
      009BA9 00 78                    6 	.word PRTB_IDX 
      001E69                       5388 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      009BA9 A6 84                    1 	.word LINK 
                           001E6B     2 	LINK=.
      001E6B                          3 PRTA:
      009BAB AE                       4 	.byte 4+F_IFUNC 	
      009BAC 00 00 81 41              5 	.ascii "PRTA"
      009BAF 00 76                    6 	.word PRTA_IDX 
      001E72                       5389 	_dict_entry 5,PRINT,PRT_IDX;print 
      009BAF A6 84                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                           001E74     2 	LINK=.
      001E74                          3 PRINT:
      009BB1 AE                       4 	.byte 5 	
      009BB2 00 01 81 4E 54           5 	.ascii "PRINT"
      009BB5 00 74                    6 	.word PRT_IDX 
      001E7C                       5390 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      009BB5 A6 84                    1 	.word LINK 
                           001E7E     2 	LINK=.
      001E7E                          3 POUT:
      009BB7 AE                       4 	.byte 4+F_IFUNC 	
      009BB8 00 02 81 54              5 	.ascii "POUT"
      009BBB 00 72                    6 	.word POUT_IDX 
      001E85                       5391 	_dict_entry,4,POKE,POKE_IDX;poke 
      009BBB A6 84                    1 	.word LINK 
                           001E87     2 	LINK=.
      001E87                          3 POKE:
      009BBD AE                       4 	.byte 4 	
      009BBE 00 03 81 45              5 	.ascii "POKE"
      009BC1 00 70                    6 	.word POKE_IDX 
      001E8E                       5392 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      009BC1 A6 84                    1 	.word LINK 
                           001E90     2 	LINK=.
      001E90                          3 PMODE:
      009BC3 AE                       4 	.byte 5 	
      009BC4 00 04 81 44 45           5 	.ascii "PMODE"
      009BC7 00 6A                    6 	.word PMODE_IDX 
      001E98                       5393 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      009BC7 A6 84                    1 	.word LINK 
                           001E9A     2 	LINK=.
      001E9A                          3 PINP:
      009BC9 AE                       4 	.byte 4+F_IFUNC 	
      009BCA 00 01 81 50              5 	.ascii "PINP"
      009BCD 00 6E                    6 	.word PINP_IDX 
      001EA1                       5394 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      009BCD A6 84                    1 	.word LINK 
                           001EA3     2 	LINK=.
      001EA3                          3 PEEK:
      009BCF AE                       4 	.byte 4+F_IFUNC 	
      009BD0 00 00 81 4B              5 	.ascii "PEEK"
      009BD3 00 6C                    6 	.word PEEK_IDX 
      001EAA                       5395 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      009BD3 A6 84                    1 	.word LINK 
                           001EAC     2 	LINK=.
      001EAC                          3 PAUSE:
      009BD5 AE                       4 	.byte 5 	
      009BD6 40 00 81 53 45           5 	.ascii "PAUSE"
      009BD9 00 68                    6 	.word PAUSE_IDX 
      001EB4                       5396 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      009BD9 55 00                    1 	.word LINK 
                           001EB6     2 	LINK=.
      001EB6                          3 PAD:
      009BDB 04                       4 	.byte 3+F_IFUNC 	
      009BDC 00 02 81                 5 	.ascii "PAD"
      009BDF 00 66                    6 	.word PAD_IDX 
      001EBC                       5397 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009BDF CD 8D                    1 	.word LINK 
                           001EBE     2 	LINK=.
      001EBE                          3 OR:
      009BE1 49                       4 	.byte 2+F_IFUNC 	
      009BE2 A1 84                    5 	.ascii "OR"
      009BE4 27 03                    6 	.word OR_IDX 
      001EC3                       5398 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      009BE6 CC 87                    1 	.word LINK 
                           001EC5     2 	LINK=.
      001EC5                          3 ODR:
      009BE8 A0                       4 	.byte 3+F_IFUNC 	
      009BE9 4F CD A5                 5 	.ascii "ODR"
      009BEC 28 5D                    6 	.word ODR_IDX 
      001ECB                       5399 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      009BEE 26 05                    1 	.word LINK 
                           001ECD     2 	LINK=.
      001ECD                          3 NOT:
      009BF0 A6                       4 	.byte 3+F_IFUNC 	
      009BF1 05 CC 87                 5 	.ascii "NOT"
      009BF4 A2 60                    6 	.word NOT_IDX 
      009BF5                       5400 	_dict_entry,4,NEXT,NEXT_IDX;next 
      009BF5 90 93                    1 	.word LINK 
                           001ED5     2 	LINK=.
      001ED5                          3 NEXT:
      009BF7 EE                       4 	.byte 4 	
      009BF8 04 A3 9B D9              5 	.ascii "NEXT"
      009BFC 26 F2                    6 	.word NEXT_IDX 
      001EDC                       5401 	_dict_entry,3,NEW,NEW_IDX;new
      009BFE 90 CF                    1 	.word LINK 
                           001EDE     2 	LINK=.
      001EDE                          3 NEW:
      009C00 00                       4 	.byte 3 	
      009C01 07 90 E6                 5 	.ascii "NEW"
      009C04 02 C7                    6 	.word NEW_IDX 
      001EE4                       5402 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      009C06 00 0A                    1 	.word LINK 
                           001EE6     2 	LINK=.
      001EE6                          3 MULDIV:
      009C08 35                       4 	.byte 6+F_IFUNC 	
      009C09 06 00 09 81 49 56        5 	.ascii "MULDIV"
      009C0D 00 5A                    6 	.word MULDIV_IDX 
      001EEF                       5403 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      009C0D 72 5F                    1 	.word LINK 
                           001EF1     2 	LINK=.
      001EF1                          3 LSHIFT:
      009C0F 00                       4 	.byte 6+F_IFUNC 	
      009C10 07 72 5F 00 08 72        5 	.ascii "LSHIFT"
      009C16 5F 00                    6 	.word LSHIFT_IDX 
      001EFA                       5404 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      009C18 09 72                    1 	.word LINK 
                           001EFC     2 	LINK=.
      001EFC                          3 LOG:
      009C1A 5F                       4 	.byte 3+F_IFUNC 	
      009C1B 00 0A CE                 5 	.ascii "LOG"
      009C1E 00 1D                    6 	.word LOG_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009C20                       5405 	_dict_entry,4,LOAD,LOAD_IDX;load 
      009C20 C3 00                    1 	.word LINK 
                           001F04     2 	LINK=.
      001F04                          3 LOAD:
      009C22 1F                       4 	.byte 4 	
      009C23 24 1B 90 93              5 	.ascii "LOAD"
      009C27 EE 04                    6 	.word LOAD_IDX 
      001F0B                       5406 	_dict_entry 4,LIST,LIST_IDX;list
      009C29 1C A1                    1 	.word LINK 
                           001F0D     2 	LINK=.
      001F0D                          3 LIST:
      009C2B 14                       4 	.byte 4 	
      009C2C FE A3 9B D9              5 	.ascii "LIST"
      009C30 26 1A                    6 	.word LIST_IDX 
      001F14                       5407 	_dict_entry 3,LET,LET_IDX;let 
      009C32 90 CF                    1 	.word LINK 
                           001F16     2 	LINK=.
      001F16                          3 LET:
      009C34 00                       4 	.byte 3 	
      009C35 07 90 E6                 5 	.ascii "LET"
      009C38 02 C7                    6 	.word LET_IDX 
      001F1C                       5408 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      009C3A 00 0A                    1 	.word LINK 
                           001F1E     2 	LINK=.
      001F1E                          3 KEY:
      009C3C 35                       4 	.byte 3+F_IFUNC 	
      009C3D 06 00 09                 5 	.ascii "KEY"
      009C40 72 5D                    6 	.word KEY_IDX 
      001F24                       5409 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      009C42 00 0A                    1 	.word LINK 
                           001F26     2 	LINK=.
      001F26                          3 IWDGREF:
      009C44 26                       4 	.byte 7 	
      009C45 05 A6 0C CC 87 A2 81     5 	.ascii "IWDGREF"
      009C4C 00 4C                    6 	.word IWDGREF_IDX 
      001F30                       5410 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      009C4C 93 E6                    1 	.word LINK 
                           001F32     2 	LINK=.
      001F32                          3 IWDGEN:
      009C4E 02                       4 	.byte 6 	
      009C4F C7 00 0E 72 5F 00        5 	.ascii "IWDGEN"
      009C55 0D 72                    6 	.word IWDGEN_IDX 
      001F3B                       5411 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      009C57 BB 00                    1 	.word LINK 
                           001F3D     2 	LINK=.
      001F3D                          3 INVERT:
      009C59 0D                       4 	.byte 6+F_IFUNC 	
      009C5A 20 C4 56 45 52 54        5 	.ascii "INVERT"
      009C5C 00 48                    6 	.word INVERT_IDX 
      001F46                       5412 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      009C5C 52 06                    1 	.word LINK 
                           001F48     2 	LINK=.
      009C5E                          3 INPUT:
      009C5E C6                       4 	.byte 5 	
      009C5F 00 09 C1 00 0A           5 	.ascii "INPUT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009C64 27 37                    6 	.word INPUT_IDX 
      001F50                       5413 	_dict_entry,2,IF,IF_IDX;if 
      009C66 CD 8F                    1 	.word LINK 
                           001F52     2 	LINK=.
      001F52                          3 IF:
      009C68 8E                       4 	.byte 2 	
      009C69 CE 00                    5 	.ascii "IF"
      009C6B 07 CF                    6 	.word IF_IDX 
      001F57                       5414 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      009C6D 00 05                    1 	.word LINK 
                           001F59     2 	LINK=.
      001F59                          3 IDR:
      009C6F 55                       4 	.byte 3+F_IFUNC 	
      009C70 00 09 00                 5 	.ascii "IDR"
      009C73 02 55                    6 	.word IDR_IDX 
      001F5F                       5415 	_dict_entry,3,HEX,HEX_IDX;hex_base
      009C75 00 0A                    1 	.word LINK 
                           001F61     2 	LINK=.
      001F61                          3 HEX:
      009C77 00                       4 	.byte 3 	
      009C78 04 CD 8D                 5 	.ascii "HEX"
      009C7B 49 A1                    6 	.word HEX_IDX 
      001F67                       5416 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      009C7D 84 27                    1 	.word LINK 
                           001F69     2 	LINK=.
      001F69                          3 GPIO:
      009C7F 03                       4 	.byte 4+F_IFUNC 	
      009C80 CC 87 A0 4F              5 	.ascii "GPIO"
      009C83 00 3E                    6 	.word GPIO_IDX 
      001F70                       5417 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      009C83 1F 05                    1 	.word LINK 
                           001F72     2 	LINK=.
      001F72                          3 GOTO:
      009C85 CD                       4 	.byte 4 	
      009C86 88 92 CE 00              5 	.ascii "GOTO"
      009C8A 05 CF                    6 	.word GOTO_IDX 
      001F79                       5418 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      009C8C 00 07                    1 	.word LINK 
                           001F7B     2 	LINK=.
      001F7B                          3 GOSUB:
      009C8E 55                       4 	.byte 5 	
      009C8F 00 02 00 09 CD           5 	.ascii "GOSUB"
      009C94 8F 9E                    6 	.word GOSUB_IDX 
      001F83                       5419 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      009C96 1E 05                    1 	.word LINK 
                           001F85     2 	LINK=.
      001F85                          3 FREE:
      009C98 A6                       4 	.byte 4+F_IFUNC 	
      009C99 84 5B 06 81              5 	.ascii "FREE"
      009C9D 00 9E                    6 	.word FREE_IDX 
      001F8C                       5420 	_dict_entry,6,FORGET,FORGET_IDX;forget 
      009C9D 90 CE                    1 	.word LINK 
                           001F8E     2 	LINK=.
      001F8E                          3 FORGET:
      009C9F 00                       4 	.byte 6 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009CA0 07 72 5F 00 07 72        5 	.ascii "FORGET"
      009CA6 5F 00                    6 	.word FORGET_IDX 
      001F97                       5421 	_dict_entry,3,FOR,FOR_IDX;for 
      009CA8 08 72                    1 	.word LINK 
                           001F99     2 	LINK=.
      001F99                          3 FOR:
      009CAA 5F                       4 	.byte 3 	
      009CAB 00 09 72                 5 	.ascii "FOR"
      009CAE 5F 00                    6 	.word FOR_IDX 
      001F9F                       5422 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      009CB0 0A CD                    1 	.word LINK 
                           001FA1     2 	LINK=.
      001FA1                          3 FCPU:
      009CB2 9C                       4 	.byte 4 	
      009CB3 4C 20 A8 55              5 	.ascii "FCPU"
      009CB6 00 34                    6 	.word FCPU_IDX 
      001FA8                       5423 	_dict_entry,3,END,END_IDX;cmd_end  
      009CB6 CD 8C                    1 	.word LINK 
                           001FAA     2 	LINK=.
      001FAA                          3 END:
      009CB8 4A                       4 	.byte 3 	
      009CB9 A1 02 27                 5 	.ascii "END"
      009CBC 03 CC                    6 	.word END_IDX 
      001FB0                       5424 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      009CBE 87 A0                    1 	.word LINK 
                           001FB2     2 	LINK=.
      009CC0                          3 EEPROM:
      009CC0 72                       4 	.byte 6+F_IFUNC 	
      009CC1 12 50 C7 85 5D 27        5 	.ascii "EEPROM"
      009CC7 21 85                    6 	.word EEPROM_IDX 
      001FBB                       5425 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      009CC9 A6 08                    1 	.word LINK 
                           001FBD     2 	LINK=.
      001FBD                          3 DWRITE:
      009CCB 42                       4 	.byte 6+F_CMD 	
      009CCC 9F C7 52 00 72 1A        5 	.ascii "DWRITE"
      009CD2 50 14                    6 	.word DWRITE_IDX 
      001FC6                       5426 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      009CD4 72 1A                    1 	.word LINK 
                           001FC8     2 	LINK=.
      001FC8                          3 DREAD:
      009CD6 50                       4 	.byte 5+F_IFUNC 	
      009CD7 16 72 14 52 00           5 	.ascii "DREAD"
      009CDC 72 12                    6 	.word DREAD_IDX 
      001FD0                       5427 	_dict_entry,2,DO,DO_IDX;do_loop
      009CDE 52 01                    1 	.word LINK 
                           001FD2     2 	LINK=.
      001FD2                          3 DO:
      009CE0 72                       4 	.byte 2 	
      009CE1 10 52                    5 	.ascii "DO"
      009CE3 01 72                    6 	.word DO_IDX 
      001FD7                       5428 	_dict_entry,3,DIR,DIR_IDX;directory 
      009CE5 1C 52                    1 	.word LINK 
                           001FD9     2 	LINK=.
      001FD9                          3 DIR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009CE7 00                       4 	.byte 3 	
      009CE8 81 49 52                 5 	.ascii "DIR"
      009CE9 00 28                    6 	.word DIR_IDX 
      001FDF                       5429 	_dict_entry,3,DEC,DEC_IDX;dec_base
      009CE9 5B 02                    1 	.word LINK 
                           001FE1     2 	LINK=.
      001FE1                          3 DEC:
      009CEB A6                       4 	.byte 3 	
      009CEC 82 C4 52                 5 	.ascii "DEC"
      009CEF 03 A1                    6 	.word DEC_IDX 
      001FE7                       5430 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      009CF1 02 26                    1 	.word LINK 
                           001FE9     2 	LINK=.
      001FE9                          3 DDR:
      009CF3 F7                       4 	.byte 3+F_IFUNC 	
      009CF4 72 1D 52                 5 	.ascii "DDR"
      009CF7 00 72                    6 	.word DDR_IDX 
      001FEF                       5431 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      009CF9 13 50                    1 	.word LINK 
                           001FF1     2 	LINK=.
      001FF1                          3 DATALN:
      009CFB C7                       4 	.byte 6 	
      009CFC 72 1B 50 16 81 4E        5 	.ascii "DATALN"
      009D01 00 22                    6 	.word DATALN_IDX 
      001FFA                       5432 	_dict_entry,4,DATA,DATA_IDX;data  
      009D01 A6 78                    1 	.word LINK 
                           001FFC     2 	LINK=.
      001FFC                          3 DATA:
      009D03 C5                       4 	.byte 4 	
      009D04 52 03 27 04              5 	.ascii "DATA"
      009D08 72 5F                    6 	.word DATA_IDX 
      002003                       5433 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      009D0A 52 03                    1 	.word LINK 
                           002005     2 	LINK=.
      002005                          3 CRL:
      009D0C 81                       4 	.byte 3+F_IFUNC 	
      009D0D 43 52 4C                 5 	.ascii "CRL"
      009D0D 88 CD                    6 	.word CRL_IDX 
      00200B                       5434 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      009D0F 9D 01                    1 	.word LINK 
                           00200D     2 	LINK=.
      00200D                          3 CRH:
      009D11 84                       4 	.byte 3+F_IFUNC 	
      009D12 72 03 52                 5 	.ascii "CRH"
      009D15 03 FB                    6 	.word CRH_IDX 
      002013                       5435 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      009D17 C7 52                    1 	.word LINK 
                           002015     2 	LINK=.
      002015                          3 CHAR:
      009D19 04                       4 	.byte 4+F_CFUNC 	
      009D1A 72 01 52 03              5 	.ascii "CHAR"
      009D1E FB C6                    6 	.word CHAR_IDX 
      00201C                       5436 	_dict_entry,3,BYE,BYE_IDX;bye 
      009D20 52 04                    1 	.word LINK 
                           00201E     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      00201E                          3 BYE:
      009D22 81                       4 	.byte 3 	
      009D23 42 59 45                 5 	.ascii "BYE"
      009D23 A6 FF                    6 	.word BYE_IDX 
      002024                       5437 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      009D25 72 01                    1 	.word LINK 
                           002026     2 	LINK=.
      002026                          3 BTOGL:
      009D27 52                       4 	.byte 5 	
      009D28 03 E3 C6 52 04           5 	.ascii "BTOGL"
      009D2D 81 16                    6 	.word BTOGL_IDX 
      009D2E                       5438 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      009D2E CD 8D                    1 	.word LINK 
                           002030     2 	LINK=.
      002030                          3 BTEST:
      009D30 49                       4 	.byte 5+F_IFUNC 	
      009D31 A1 84 27 03 CC           5 	.ascii "BTEST"
      009D36 87 A0                    6 	.word BTEST_IDX 
      009D38                       5439 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      009D38 9F CD                    1 	.word LINK 
                           00203A     2 	LINK=.
      00203A                          3 BSET:
      009D3A 9D                       4 	.byte 4 	
      009D3B 0D CD 88 92              5 	.ascii "BSET"
      009D3F A1 09                    6 	.word BSET_IDX 
      002041                       5440 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      009D41 26 02                    1 	.word LINK 
                           002043     2 	LINK=.
      002043                          3 BRES:
      009D43 20                       4 	.byte 4 	
      009D44 E9 4D 27 05              5 	.ascii "BRES"
      009D48 55 00                    6 	.word BRES_IDX 
      00204A                       5441 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      009D4A 03 00                    1 	.word LINK 
                           00204C     2 	LINK=.
      00204C                          3 BIT:
      009D4C 02                       4 	.byte 3+F_IFUNC 	
      009D4D 81 49 54                 5 	.ascii "BIT"
      009D4E 00 0E                    6 	.word BIT_IDX 
      002052                       5442 	_dict_entry,3,AWU,AWU_IDX;awu 
      009D4E CD 9D                    1 	.word LINK 
                           002054     2 	LINK=.
      002054                          3 AWU:
      009D50 23                       4 	.byte 3 	
      009D51 5F 97 A6                 5 	.ascii "AWU"
      009D54 84 81                    6 	.word AWU_IDX 
      009D56                       5443 	_dict_entry,7,AUTORUN,AUTORUN_IDX;autorun
      009D56 CD 88                    1 	.word LINK 
                           00205C     2 	LINK=.
      00205C                          3 AUTORUN:
      009D58 92                       4 	.byte 7 	
      009D59 A1 84 27 03 CC 87 A0     5 	.ascii "AUTORUN"
      009D60 5D 27                    6 	.word AUTORUN_IDX 
      002066                       5444 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      009D62 05 72                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                           002068     2 	LINK=.
      002068                          3 ASC:
      009D64 1B                       4 	.byte 3+F_IFUNC 	
      009D65 50 14 81                 5 	.ascii "ASC"
      009D68 00 08                    6 	.word ASC_IDX 
      00206E                       5445 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      009D68 72 1A                    1 	.word LINK 
                           002070     2 	LINK=.
      002070                          3 AND:
      009D6A 50                       4 	.byte 3+F_IFUNC 	
      009D6B 14 81 44                 5 	.ascii "AND"
      009D6D 00 06                    6 	.word AND_IDX 
      002076                       5446 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      009D6D AE 16                    1 	.word LINK 
                           002078     2 	LINK=.
      002078                          3 ADCREAD:
      009D6F E0                       4 	.byte 7+F_IFUNC 	
      009D70 B6 84 81 52 45 41 44     5 	.ascii "ADCREAD"
      009D73 00 04                    6 	.word ADCREAD_IDX 
      002082                       5447 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      009D73 00 00                    1 	.word LINK 
                           002084     2 	LINK=.
      009D75                          3 ADCON:
      009D75 43                       4 	.byte 5 	
      009D76 58 4F 52 00 C6           5 	.ascii "ADCON"
      009D7B 9D 75                    6 	.word ADCON_IDX 
      009D7D                       5448 kword_dict::
      00208C                       5449 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      009D7D 05 57                    1 	.word LINK 
                           00208E     2 	LINK=.
      00208E                          3 ABS:
      009D7F 52                       4 	.byte 3+F_IFUNC 	
      009D80 49 54 45                 5 	.ascii "ABS"
      009D83 00 C4                    6 	.word ABS_IDX 
                                   5450 
                                   5451 ;comands and fonctions address table 	
      002094                       5452 code_addr::
      009D85 9D 7D 12 4B 12 87 18  5453 	.word abs,power_adc,analog_read,bit_and,ascii,autorun,awu,bitmask ; 0..7
             39 16 CB 17 5D 17 D6
             1A 87
      009D87 0F D9 0F C9 0F FA 0F  5454 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             EA 17 54 16 B9 1B 41
      009D87 05 57 4F 52 44 53 00  5455 	.word const_cr1,data,data_line,const_ddr,dec_base,directory,do_loop,digital_read,digital_write ;16..23 
             C2 9D 87 16 00 1A B0
             12 BB 12 EB
      009D91 11 F7 1B 53 18 B3 10  5456 	.word cmd_end,const_eeprom_base,fcpu,for,forget,gosub,goto,gpio ; 24..31 
             55 15 92 11 60 11 45
             17 07
      009D91 04 57 41 49 54 00 C0  5457 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             9D 91 A1 1A 31 1A 67
             16 F2
      009D9A 0D E1 0E 0C 15 62 1A  5458 	.word let,list,load,log2,lshift,muldiv,next,new ; 40..47
             6C 18 81 0B 4F 10 D5
             13 72
      009D9A 43 55 53 52 00 BE 9D  5459 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal  9A-Bits]



             ED 17 C3 18 BF 10 30
             1B 4D
      009DA2 10 21 1B 47 0E A8 1A  5460 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             F3 1A F9 1A FF 1B 05
             1B 0B
      009DA2 05 55 4E 54 49 4C 00  5461 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             BC 9D A2 1B DC 04 7F
             0F 9E
      009DAC 1B 8D 11 80 19 3B 18  5462 	.word restore,return, random,rshift,run,save,show,free ; 72..79
             9A 11 9E 14 63 0D 6A
             0D B5
      009DAC 46 55 46 4C 41 53 48  5463 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             00 BA 9D AC AE 13 26
             18 1F
      009DB7 1A 08 1A 17 10 7E 12  5464 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             07 0D BF 17 31 1A C5
             17 37
      009DB7 46 55 42 4F 55 4E 44  5465 	.word wait,words,write,bit_xor ; 96..99
             00
      009DBF B8 9D                 5466 	.word 0 
                                   5467 
      002180                       5468 	.bndry 128 ; align on FLASH block.
                                   5469 ; free space for user application  
      002180                       5470 user_space:
                                   5471 ; USR() function test
      009DC1 B7               [ 2] 5472 	pushw x 
      009DC2 72 1A 50 0A      [ 1] 5473 	bset PC_ODR,#5 
      009DC2 04               [ 2] 5474 	popw x 
      009DC3 54 4F 4E         [ 4] 5475 	call pause02 
      009DC6 45 00 B6 9D      [ 1] 5476 	bres PC_ODR,#5 
      009DCA C2               [ 4] 5477 	ret
                                   5478 
                                   5479 	.area FLASH_DRIVE (ABS)
      009DCB                       5480 	.org 0x10000
      010000                       5481 fdrive:
                                   5482 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        00208E R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   5 ADCON      002084 R
    ADCON_ID=  000002     |   5 ADCREAD    002078 R   |     ADCREAD_=  000004 
    ADC_CR1 =  005401     |     ADC_CR1_=  000000     |     ADC_CR1_=  000001 
    ADC_CR1_=  000004     |     ADC_CR1_=  000005     |     ADC_CR1_=  000006 
    ADC_CR2 =  005402     |     ADC_CR2_=  000003     |     ADC_CR2_=  000004 
    ADC_CR2_=  000005     |     ADC_CR2_=  000006     |     ADC_CR2_=  000001 
    ADC_CR3 =  005403     |     ADC_CR3_=  000007     |     ADC_CR3_=  000006 
    ADC_CSR =  005400     |     ADC_CSR_=  000006     |     ADC_CSR_=  000004 
    ADC_CSR_=  000000     |     ADC_CSR_=  000001     |     ADC_CSR_=  000002 
    ADC_CSR_=  000003     |     ADC_CSR_=  000007     |     ADC_CSR_=  000005 
    ADC_DRH =  005404     |     ADC_DRL =  005405     |     ADC_TDRH=  005406 
    ADC_TDRL=  005407     |     ADDR    =  000001     |     ADR     =  000002 
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  5 AND        002070 R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |   5 ASC        002068 R   |     ASC_IDX =  000008 
  5 AUTORUN    00205C R   |     AUTORUN_=  00000A     |     AUTORUN_=  004000 
  5 AWU        002054 R   |   5 AWUHandl   000001 R   |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_CSR_=  000004     |     AWU_IDX =  00000C 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
    B19200  =  000003     |     B1_MASK =  000002     |     B230400 =  000007 
    B2400   =  000000     |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
    B4_MASK =  000010     |     B57600  =  000005     |     B5_MASK =  000020 
    B6_MASK =  000040     |     B7_MASK =  000080     |     B921600 =  000009 
    B9600   =  000002     |     BASE    =  000002     |     BCNT    =  000001 
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |   5 BIT        00204C R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000E 
    BLOCK_CO=  000004     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000B     |   5 BRES       002043 R
    BRES_IDX=  000010     |     BS      =  000008     |     BSAVE   =  000001 
  5 BSET       00203A R   |     BSET_IDX=  000012     |     BSIZE   =  000001 
  5 BTEST      002030 R   |     BTEST_ID=  000014     |   5 BTOGL      002026 R
    BTOGL_ID=  000016     |     BTW     =  000001     |   5 BYE        00201E R
    BYE_IDX =  000018     |     CAN     =  000018     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000000     |   5 CHAR       002015 R   |     CHAR_IDX=  00001A 
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Symbol Table

    CLK_CKDI=  0050C6     |     CLK_CKDI=  000000     |     CLK_CKDI=  000001 
    CLK_CKDI=  000002     |     CLK_CKDI=  000003     |     CLK_CKDI=  000004 
    CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1 
    CLK_ECKR=  000000     |     CLK_ECKR=  000001     |     CLK_HSIT=  0050CC 
    CLK_ICKR=  0050C0     |     CLK_ICKR=  000002     |     CLK_ICKR=  000000 
    CLK_ICKR=  000001     |     CLK_ICKR=  000003     |     CLK_ICKR=  000004 
    CLK_ICKR=  000005     |     CLK_PCKE=  0050C7     |     CLK_PCKE=  000000 
    CLK_PCKE=  000001     |     CLK_PCKE=  000007     |     CLK_PCKE=  000005 
    CLK_PCKE=  000006     |     CLK_PCKE=  000004     |     CLK_PCKE=  000002 
    CLK_PCKE=  000003     |     CLK_PCKE=  0050CA     |     CLK_PCKE=  000003 
    CLK_PCKE=  000002     |     CLK_PCKE=  000007     |     CLK_SWCR=  0050C5 
    CLK_SWCR=  000000     |     CLK_SWCR=  000001     |     CLK_SWCR=  000002 
    CLK_SWCR=  000003     |     CLK_SWIM=  0050CD     |     CLK_SWR =  0050C4 
    CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2 
    CMD_END =  000002     |     CNT     =  000006     |     CNTR    =  000003 
    COMMA   =  000001     |     COUNT   =  000001     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        00200D R
    CRH_IDX =  00001C     |   5 CRL        002005 R   |     CRL_IDX =  00001E 
    CTRL_A  =  000001     |     CTRL_B  =  000002     |     CTRL_C  =  000003 
    CTRL_D  =  000004     |     CTRL_E  =  000005     |     CTRL_F  =  000006 
    CTRL_G  =  000007     |     CTRL_H  =  000008     |     CTRL_I  =  000009 
    CTRL_J  =  00000A     |     CTRL_K  =  00000B     |     CTRL_L  =  00000C 
    CTRL_M  =  00000D     |     CTRL_N  =  00000E     |     CTRL_O  =  00000F 
    CTRL_P  =  000010     |     CTRL_Q  =  000011     |     CTRL_R  =  000012 
    CTRL_S  =  000013     |     CTRL_T  =  000014     |     CTRL_U  =  000015 
    CTRL_V  =  000016     |     CTRL_W  =  000017     |     CTRL_X  =  000018 
    CTRL_Y  =  000019     |     CTRL_Z  =  00001A     |     CTXT_SIZ=  000004 
    CTX_BPTR=  000001     |     CTX_COUN=  000004     |     CTX_IN  =  000003 
    CVAR    =  000007     |     CX_BPTR =  000001     |     CX_CNT  =  000004 
    CX_IN   =  000003     |   5 DATA       001FFC R   |   5 DATALN     001FF1 R
    DATALN_I=  000022     |     DATA_IDX=  000020     |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
    DBL     =  000003     |     DBLDIVDN=  000006     |     DBLHI   =  000001 
    DBLLO   =  000003     |     DBL_SIZE=  000004     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  5 DDR        001FE9 R   |     DDR_IDX =  000024     |     DEBUG   =  000000 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |     DEBUG_PR=  000001 
  5 DEC        001FE1 R   |     DEC_IDX =  000026     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        001FD9 R   |     DIR_IDX =  000028 
    DIVDNDHI=  00000B     |     DIVDNDLO=  00000D     |     DIVISOR =  000001 
    DIVISR  =  000007     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   5 DO         001FD2 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  00002A 
  5 DREAD      001FC8 R   |     DREAD_ID=  00002C     |   5 DWRITE     001FBD R
    DWRITE_I=  00002E     |   5 EEPROM     001FB2 R   |     EEPROM_B=  004000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

    EEPROM_E=  0047FF     |     EEPROM_I=  000032     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        001FAA R   |     END_IDX =  000030 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FAUTORUN=  000006     |     FBREAK  =  000004     |     FCOMP   =  000005 
  5 FCPU       001FA1 R   |     FCPU_IDX=  000034     |     FF      =  00000C 
    FHSE    =  7A1200     |     FHSI    =  F42400     |     FIRST   =  000001 
    FIRST_DA=  000006     |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
    FLASH_CR=  000002     |     FLASH_CR=  000000     |     FLASH_CR=  000003 
    FLASH_CR=  000001     |     FLASH_CR=  00505B     |     FLASH_CR=  000005 
    FLASH_CR=  000004     |     FLASH_CR=  000007     |     FLASH_CR=  000000 
    FLASH_CR=  000006     |     FLASH_DU=  005064     |     FLASH_DU=  0000AE 
    FLASH_DU=  000056     |     FLASH_EN=  027FFF     |     FLASH_FP=  00505D 
    FLASH_FP=  000000     |     FLASH_FP=  000001     |     FLASH_FP=  000002 
    FLASH_FP=  000003     |     FLASH_FP=  000004     |     FLASH_FP=  000005 
    FLASH_IA=  00505F     |     FLASH_IA=  000003     |     FLASH_IA=  000002 
    FLASH_IA=  000006     |     FLASH_IA=  000001     |     FLASH_IA=  000000 
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLOOP   =  000002     |     FLSI    =  01F400 
  5 FOR        001F99 R   |   5 FORGET     001F8E R   |     FORGET_I=  000038 
    FOR_IDX =  000036     |   5 FREE       001F85 R   |     FREE_IDX=  00009E 
    FRUN    =  000000     |     FS      =  00001C     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      001F7B R   |     GOSUB_ID=  00003A 
  5 GOTO       001F72 R   |     GOTO_IDX=  00003C     |   5 GPIO       001F69 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_IDX=  00003E 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  5 HEX        001F61 R   |     HEX_IDX =  000040     |     HSECNT  =  004809 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

    I2C_SR1_=  000007     |     I2C_SR2 =  005218     |     I2C_SR2_=  000002 
    I2C_SR2_=  000001     |     I2C_SR2_=  000000     |     I2C_SR2_=  000003 
    I2C_SR2_=  000005     |     I2C_SR3 =  005219     |     I2C_SR3_=  000001 
    I2C_SR3_=  000007     |     I2C_SR3_=  000004     |     I2C_SR3_=  000000 
    I2C_SR3_=  000002     |     I2C_TRIS=  00521D     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_WRIT=  000000 
  5 IDR        001F59 R   |     IDR_IDX =  000042     |   5 IF         001F52 R
    IF_IDX  =  000044     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      001F48 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_ID=  000046 
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
    INT_VECT=  008030     |     INT_VECT=  008038     |     INT_VECT=  008034 
    INT_VECT=  008040     |     INT_VECT=  00803C     |     INT_VECT=  008048 
    INT_VECT=  008044     |     INT_VECT=  008064     |     INT_VECT=  008008 
    INT_VECT=  008004     |     INT_VECT=  008050     |     INT_VECT=  00804C 
    INT_VECT=  00805C     |     INT_VECT=  008058     |   5 INVERT     001F3D R
    INVERT_I=  000048     |     INW     =  000009     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   5 IWDGEN     001F32 R   |     IWDGEN_I=  00004A 
  5 IWDGREF    001F26 R   |     IWDGREF_=  00004C     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        001F1E R
    KEY_IDX =  00004E     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   5 LET        001F16 R   |     LET_IDX =  000050 
    LF      =  00000A     |     LIMIT   =  000005     |   5 LINK    =  00208E R
  5 LIST       001F0D R   |     LIST_IDX=  000052     |     LLEN    =  000002 
    LN_PTR  =  000005     |   5 LOAD       001F04 R   |     LOAD_IDX=  000054 
  5 LOG        001EFC R   |     LOG_IDX =  000056     |   5 LSHIFT     001EF1 R
    LSHIFT_I=  000058     |     MAJOR   =  000002     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
  5 MULDIV     001EE6 R   |     MULDIV_I=  00005A     |     MULOP   =  000003 
    N1      =  000001     |     N2      =  000003     |     NAFR    =  004804 
    NAK     =  000015     |     NAMEPTR =  000003     |     NCLKOPT =  004808 
    NEG     =  000001     |   5 NEW        001EDE R   |     NEW_FREE=  000001 
    NEW_IDX =  00005E     |   5 NEXT       001ED5 R   |     NEXT_IDX=  00005C 
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   5 NOT        001ECD R
    NOT_IDX =  000060     |     NUBC    =  004802     |     NWDGOPT =  004806 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R   |   5 ODR        001EC5 R
    ODR_IDX =  000062     |     ONOFF   =  000003     |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   5 OR         001EBE R   |     OR_IDX  =  000064 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |   5 PAD        001EB6 R
    PAD_IDX =  000066     |     PAD_SIZE=  000080     |   5 PAUSE      001EAC R
    PAUSE_ID=  000068     |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   5 PEEK       001EA3 R
    PEEK_IDX=  00006C     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       001E9A R   |     PINP_IDX=  00006E     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  5 PMODE      001E90 R   |     PMODE_ID=  00006A     |   5 POKE       001E87 R
    POKE_IDX=  000070     |     PORT    =  000003     |   5 POUT       001E7E R
    POUT_IDX=  000072     |   5 PRINT      001E74 R   |   5 PRTA       001E6B R
    PRTA_IDX=  000076     |   5 PRTB       001E62 R   |     PRTB_IDX=  000078 
  5 PRTC       001E59 R   |     PRTC_IDX=  00007A     |   5 PRTD       001E50 R
    PRTD_IDX=  00007C     |   5 PRTE       001E47 R   |     PRTE_IDX=  00007E 
  5 PRTF       001E3E R   |     PRTF_IDX=  000080     |   5 PRTG       001E35 R
    PRTG_IDX=  000082     |   5 PRTH       001E2C R   |     PRTH_IDX=  000084 
  5 PRTI       001E23 R   |     PRTI_IDX=  000086     |     PRT_IDX =  000074 
    PSTR    =  000003     |   5 QKEY       001E1A R   |     QKEY_IDX=  000088 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
    RBT_IDX =  00008C     |   5 READ       001E11 R   |     READ_IDX=  00008A 
  5 REBOOT     001E06 R   |     REG     =  000001     |     REGA    =  000001 
    REGX    =  000003     |     REGY    =  000005     |     RELOP   =  000003 
  5 REMARK     001DFB R   |     REM_IDX =  00008E     |   5 RESTORE    001DEF R
    REST_IDX=  000090     |     RETL1   =  000001     |   5 RETURN     001DE4 R
    RET_ADDR=  000003     |     RET_IDX =  000092     |     RET_INW =  000005 
  5 RND        001DDC R   |     RND_IDX =  000094     |     ROP     =  004800 
    RS      =  00001E     |   5 RSHIFT     001DD1 R   |     RSHIFT_I=  000096 
    RST_SR  =  0050B3     |   5 RUN        001DC9 R   |     RUN_IDX =  000098 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]

Symbol Table

    RX_QUEUE=  000008     |   5 SAVE       001DC0 R   |     SAVEB   =  000002 
    SAVE_IDX=  00009A     |     SDIVSR  =  000005     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       001DB7 R
    SHOW_IDX=  00009C     |     SI      =  00000F     |     SIGN    =  000001 
    SKIP    =  000005     |   5 SLEEP      001DAD R   |     SLEEP_ID=  0000A0 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  5 SPIEN      001DA3 R   |     SPIEN_ID=  0000A4     |   5 SPIRD      001D99 R
    SPIRD_ID=  0000A2     |   5 SPISEL     001D8E R   |     SPISEL_I=  0000A6 
  5 SPIWR      001D84 R   |     SPIWR_ID=  0000A8     |     SPI_CR1 =  005200 
    SPI_CR1_=  000003     |     SPI_CR1_=  000000     |     SPI_CR1_=  000001 
    SPI_CR1_=  000007     |     SPI_CR1_=  000002     |     SPI_CR1_=  000006 
    SPI_CR2 =  005201     |     SPI_CR2_=  000007     |     SPI_CR2_=  000006 
    SPI_CR2_=  000005     |     SPI_CR2_=  000004     |     SPI_CR2_=  000002 
    SPI_CR2_=  000000     |     SPI_CR2_=  000001     |     SPI_CRCP=  005205 
    SPI_CS_B=  000005     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_SR_B=  000007 
    SPI_SR_C=  000004     |     SPI_SR_M=  000005     |     SPI_SR_O=  000006 
    SPI_SR_R=  000000     |     SPI_SR_T=  000001     |     SPI_SR_W=  000003 
    SPI_TXCR=  005207     |     SQUOT   =  000006     |     STACK_EM=  0017FF 
    STACK_SI=  0000A0     |   5 STEP       001D7B R   |     STEP_IDX=  0000AA 
  5 STOP       001D72 R   |     STOP_IDX=  0000AC     |     STX     =  000002 
    SUB     =  00001A     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      001D68 R   |     TICKS_ID=  0000AE     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]

Symbol Table

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
  5 TIMEOUT    001D5C R   |   5 TIMER      001D52 R   |     TIMER_ID=  0000B0 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_ARRAY=  000006 
    TK_CFUNC=  000082     |     TK_CHAR =  000003     |     TK_CMD  =  000080 
    TK_COLON=  00000B     |     TK_COMMA=  000009     |     TK_CONST=  000083 
    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]

Symbol Table

    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_IFUNC=  000081     |     TK_INTGR=  000084     |     TK_LE   =  000036 
    TK_LPARE=  000007     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_PLUS =  000010     |     TK_QSTR =  000002 
    TK_RPARE=  000008     |     TK_SHARP=  00000A     |     TK_VAR  =  000085 
    TMROUT_I=  0000B2     |   5 TO         001D4B R   |   5 TONE       001D42 R
    TONE_IDX=  0000B6     |     TO_IDX  =  0000B4     |   5 Timer4Up   000052 R
    U1      =  000001     |     U8      =  000003     |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
    UART1_RX=  000004     |     UART1_SR=  005230     |     UART1_TX=  000005 
    UART2   =  000001     |     UART3   =  000002     |     UART3_BA=  005240 
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
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     001D37 R
    UBOUND_I=  0000B8     |   5 UBTN_Han   000094 R   |   5 UFLASH     001D2C R
    UFLASH_I=  0000BA     |   5 UNTIL      001D22 R   |     UNTIL_ID=  0000BC 
    US      =  00001F     |   5 USER_ABO   00009C R   |   5 USR        001D1A R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000BE     |   5 Uart1RxH   00000F R   |   5 UserButt   000067 R
    VAR_ADDR=  000006     |     VSIZ    =  000002     |     VSIZE   =  000006 
    VT      =  00000B     |   5 WAIT       001D11 R   |     WAIT_IDX=  0000C0 
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WLEN    =  000001     |   5 WORDS      001D07 R   |     WORDS_ID=  0000C2 
  5 WRITE      001CFD R   |     WRITE_ID=  0000C4     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   5 XOR        001CF5 R   |     XOR_IDX =  0000C6 
    XREG    =  000003     |     XSAVE   =  000005     |     YSAVE   =  000007 
  5 abs        001825 R   |   1 acc16      00000C GR  |   1 acc24      00000B GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]

Symbol Table

  1 acc8       00000D GR  |   5 analog_r   001287 R   |   5 arduino_   00191B R
  5 arg_list   000BCA R   |   1 array_si   000021 R   |   5 ascii      0016CB R
  5 atoi24     000984 GR  |   5 atoi_exi   0009EA R   |   5 autorun    00175D R
  5 autorun_   000575 R   |   5 awu        0017D6 R   |   5 awu02      0017E0 R
  5 bad_port   00172C R   |   1 base       00000A GR  |   1 basicptr   000004 GR
  5 beep       001214 R   |   5 beep_1kh   0011FE GR  |   5 bit_and    001839 R
  5 bit_or     001851 R   |   5 bit_rese   000FD9 R   |   5 bit_set    000FC9 R
  5 bit_test   000FFA R   |   5 bit_togg   000FEA R   |   5 bit_xor    001869 R
  5 bitmask    001A87 R   |   5 block_er   0001BD R   |   5 break_po   001354 R
  5 bye        001754 R   |   5 cancel_a   00053D R   |   5 char       0016B9 R
  5 clear_ba   00058A R   |   5 clear_va   000408 R   |   5 clock_in   0000B7 R
  5 cmd_end    0011F7 R   |   5 cmd_line   0007AA R   |   5 cmp_name   0013F5 R
  5 code_add   002094 GR  |   5 cold_sta   00047F R   |   5 comp_msg   0006FF R
    compile    ****** GX  |   5 const_cr   001B3B R   |   5 const_cr   001B41 R
  5 const_dd   001B35 R   |   5 const_ee   001B53 R   |   5 const_id   001B2F R
  5 const_in   001B4D R   |   5 const_od   001B29 R   |   5 const_ou   001B47 R
  5 const_po   001AF3 R   |   5 const_po   001AF9 R   |   5 const_po   001AFF R
  5 const_po   001B05 R   |   5 const_po   001B0B R   |   5 const_po   001B11 R
  5 const_po   001B17 R   |   5 const_po   001B1D R   |   5 const_po   001B23 R
  1 count      000003 GR  |   5 cp_loop    000B79 R   |   5 cs_high    001CE8 R
  5 cstk_pro   000D84 R   |   5 data       001B59 R   |   1 data_len   000009 R
  5 data_lin   001B5F R   |   1 data_ofs   000008 R   |   1 data_ptr   000006 R
  5 data_sea   001BA0 R   |   5 dbl_sign   000AD3 R   |   5 dec_base   000DB0 R
    decompil   ****** GX  |   5 digital_   0012BB R   |   5 digital_   0012EB R
  5 dir_loop   00160C R   |   5 director   001600 R   |   5 disk_fre   0013E2 R
  5 div32_16   000ADD R   |   5 divide     000B34 R   |   5 divu24_8   0008F3 R
  5 dneg       000AC8 R   |   5 do_loop    001AB0 R   |   5 do_progr   0001B0 R
  5 drive_fr   001675 R   |   5 enable_i   001A31 R   |   5 erase_fl   0001DC R
  5 err_bad_   00066A R   |   5 err_buf_   0006E0 R   |   5 err_cmd_   00062E R
  5 err_div0   0005F3 R   |   5 err_dupl   000648 R   |   5 err_math   0005DA R
  5 err_mem_   0005BF R   |   5 err_msg    00059F R   |   5 err_no_a   000676 R
  5 err_no_d   0006A9 R   |   5 err_no_f   0006CD R   |   5 err_no_l   000602 R
  5 err_no_p   0006B9 R   |   5 err_not_   000659 R   |   5 err_run_   000618 R
  5 err_synt   0005CC R   |   5 expect     000BB8 R   |   5 expr_exi   000D0F R
  5 expressi   000CC9 R   |   5 factor     000C1A R   |   1 farptr     000016 R
  5 fcpu       0018B3 R   |   7 fdrive     010000 R   |   1 ffree      000019 R
  5 file_cou   00166D R   |   5 first_li   000E35 R   |   1 flags      000023 GR
  5 for        001055 R   |   5 forget     001592 R   |   5 free       000DB5 R
  1 free_ram   000063 R   |   5 func_arg   000BC5 R   |   5 func_not   001A24 R
  5 get_arra   000BF5 R   |   5 get_targ   00111F R   |   5 get_tick   00181F R
    get_toke   ****** GX  |   5 getc       0002D2 GR  |   5 gosub      001160 R
  5 goto       001145 R   |   5 gpio       001707 R   |   5 hex_base   000DAB R
  5 hex_dump   00035F R   |   5 if         001041 R   |   1 in         000001 GR
  1 in.saved   000002 GR  |   1 in.w       000000 GR  |   5 incr_far   0013A2 R
  5 input_ex   000F9B R   |   5 input_lo   000F30 R   |   5 input_va   000F2E R
  5 interp_l   0007EB R   |   5 interpre   0007C6 R   |   5 invert     001AA1 R
  5 is_alnum   000430 GR  |   5 is_alpha   000416 GR  |   5 is_digit   000427 GR
  5 itoa       000889 GR  |   5 itoa_loo   0008AD R   |   5 jp_to_ta   001153 R
  5 key        0016F2 R   |   5 kword_di   00208C GR  |   5 kword_en   001CF3 R
  5 leading_   001A77 R   |   5 let        000DE1 GR  |   5 let_arra   000DEF R
  5 let_var    000DF2 R   |   5 lines_sk   000E38 R   |   5 list       000E0C R
  5 list_exi   000E7A R   |   5 list_loo   000E58 R   |   5 load       001562 R
  5 load_aut   00054C R   |   5 load_fil   001531 R   |   5 log2       001A6C R
  5 logical_   001A1A R   |   5 long_div   000AB0 R   |   5 loop_bac   001102 R
  1 loop_dep   000020 R   |   5 loop_don   001117 R   |   5 lshift     001881 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]

Symbol Table

  5 modulo     000B4A R   |   5 move       0003C6 GR  |   5 move_dow   0003E4 R
  5 move_era   000142 R   |   5 move_exi   000405 R   |   5 move_loo   0003E9 R
  5 move_prg   000176 R   |   5 move_up    0003D6 R   |   5 muldiv     000B4F R
  5 multiply   000A7B R   |   5 mulu24_8   00091B R   |   5 neg_acc2   000955 R
  5 new        001372 R   |   5 next       0010D5 R   |   5 next_lin   0007CE R
  5 next_tok   000812 GR  |   5 no_match   000B8B R   |   3 pad        0016E0 GR
  5 pad_ref    001CED R   |   5 pause      0017C3 R   |   5 pause02    0017CD R
  5 peek       001030 R   |   5 pin_mode   0018BF R   |   5 poke       001021 R
  5 power_ad   00124B R   |   5 print      000EA8 R   |   5 print_ex   000F02 R
  5 print_in   00086D R   |   5 printxy    0009EE R   |   5 program_   000156 R
  5 program_   000176 R   |   5 prt_basi   000E88 R   |   5 prt_loop   000EAC R
  5 prt_tok    0002F1 R   |   5 prti24     00087D R   |   1 ptr16      000017 GR
  1 ptr8       000018 R   |   5 putc       0002C2 GR  |     puts       ****** GX
  5 qgetc      0002CB GR  |   5 qkey       0016FA GR  |   5 random     00193B R
  5 read       001BDC R   |   5 read01     001BDE R   |     readln     ****** GX
  5 refresh_   001A67 R   |   5 rel_exit   000D67 R   |   5 relation   000D12 R
  5 remark     000F9E GR  |   5 reset_co   000EAA R   |   5 rest_con   000F1E R
  5 restore    001B8D R   |   5 return     001180 R   |     right_al   ****** GX
  5 row_alig   001387 R   |   5 row_eras   00011B R   |   5 row_eras   000142 R
  5 row_loop   000342 R   |   5 rshift     00189A R   |   5 rt_msg     0006ED R
  5 run        00119E R   |   5 run_it     0011D0 R   |   1 rx1_head   00002D R
  1 rx1_queu   000025 R   |   1 rx1_tail   00002E R   |   5 save       001463 R
  5 save_con   000F0E R   |   5 search_d   000B6B GR  |   5 search_e   000BB5 R
  5 search_f   001416 R   |     search_l   ****** GX  |   5 search_n   000B6F R
  1 seedx      000012 R   |   1 seedy      000014 R   |   5 seek_fdr   0013B0 R
  5 select_p   00190B R   |   5 set_time   001A08 R   |   5 show       000D6A R
  5 show_row   000330 R   |   5 sleep      0017B8 R   |   5 software   000439 R
    spaces     ****** GX  |   5 spi_clea   001C81 R   |   5 spi_disa   001C69 R
  5 spi_enab   001C36 R   |   5 spi_rcv_   001CA3 R   |   5 spi_read   001CCE R
  5 spi_sele   001CD6 R   |   5 spi_send   001C8D R   |   5 spi_writ   001CAE R
  3 stack_fu   001760 GR  |   3 stack_un   001800 R   |   5 step       0010AE R
  5 stop       001326 R   |   5 store_lo   0010C2 R   |   5 str_matc   000B98 R
  5 strcmp     0003A7 R   |   5 strcpy     0003B8 GR  |   5 strlen     00039C GR
  5 syntax_e   000720 GR  |   1 tab_widt   000024 GR  |   5 tb_error   000722 GR
  5 term       000C77 R   |   5 term01     000C7F R   |   5 term_exi   000CC6 R
  3 tib        001690 GR  |   1 ticks      00000E R   |   5 timeout    001A17 R
  1 timer      000010 GR  |   5 timer2_i   0000CD R   |   5 timer4_i   0000DA R
  5 tk_id      000710 R   |   5 to         00107E R   |   5 to_eepro   000199 R
  5 to_flash   0001AD R   |   5 to_upper   000978 GR  |   5 token_ms   000328 R
  5 tone       001207 R   |   5 try_next   001BCC R   |   1 txtbgn     00001C GR
  1 txtend     00001E GR  |   5 uart1_ge   0002D2 GR  |   5 uart1_in   00027F R
  5 uart1_pu   0002C2 GR  |   5 uart1_qg   0002CB GR  |   5 uart1_se   00028F R
  5 ubound     000DBF R   |   5 udiv32_1   000A9E R   |   5 uflash     001731 R
  5 umstar     000A41 R   |   5 unlock_e   0000EF R   |   5 unlock_f   000105 R
  5 until      001AC5 R   |   5 user_int   00007A R   |   5 user_spa   002180 R
  5 usr        001737 R   |     var_name   ****** GX  |   1 vars       00002F GR
  5 wait       000FA4 R   |   5 warm_ini   00051F R   |   5 warm_sta   0007A7 R
  5 words      0019A2 R   |   5 words_co   0019F2 R   |   5 write      001682 R
  5 write_bl   00025C R   |   5 write_by   0001E7 R   |   5 write_ee   000223 R
  5 write_ex   000257 R   |   5 write_fl   00020D R   |   5 write_ro   00018A R
  5 zero_pad   00137C R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     63   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   218E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

