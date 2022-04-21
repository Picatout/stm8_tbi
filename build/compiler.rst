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
                                     19 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     20 ;;   compile BASIC source code to byte code
                                     21 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     22 
                                     23 
                                     24     .module COMPILER 
                                     25 
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
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                     33     .list 
                                     34 
                                     35 
                                     36     .area  CODE 
                                     37 
                                     38 ;-------------------------------------
                                     39 ; search text area for a line#
                                     40 ; input:
                                     41 ;	X 			line# 
                                     42 ; output:
                                     43 ;   X 			addr of line | 0 
                                     44 ;   Y           line#|insert address if not found  
                                     45 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                           000001    46 	LL=1 ; line length 
                           000002    47 	LB=2 ; line length low byte 
                           000002    48 	VSIZE=2 
      00A5A8                         49 search_lineno::
      000000                         50 	_vars VSIZE
      00A5A8 52 02            [ 2]    1     sub sp,#VSIZE 
      00A5AA 0F 01            [ 1]   51 	clr (LL,sp)
      00A5AC 90 CE 00 1D      [ 2]   52 	ldw y,txtbgn
      00A5B0                         53 search_ln_loop:
      00A5B0 90 C3 00 1F      [ 2]   54 	cpw y,txtend 
      00A5B4 2A 10            [ 1]   55 	jrpl 8$
      00A5B6 90 F3            [ 1]   56 	cpw x,(y)
      00A5B8 27 0E            [ 1]   57 	jreq 9$
      00A5BA 2B 0A            [ 1]   58 	jrmi 8$ 
      00A5BC 90 E6 02         [ 1]   59 	ld a,(2,y)
      00A5BF 6B 02            [ 1]   60 	ld (LB,sp),a 
      00A5C1 72 F9 01         [ 2]   61 	addw y,(LL,sp)
      00A5C4 20 EA            [ 2]   62 	jra search_ln_loop 
      00A5C6                         63 8$: 
      00A5C6 5F               [ 1]   64 	clrw x 	
      00A5C7 51               [ 1]   65 	exgw x,y 
      000020                         66 9$: _drop VSIZE
      00A5C8 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A5CA 51               [ 1]   67 	exgw x,y   
      00A5CB 81               [ 4]   68 	ret 
                                     69 
                                     70 ;-------------------------------------
                                     71 ; delete line at addr
                                     72 ; input:
                                     73 ;   X 		addr of line i.e DEST for move 
                                     74 ;-------------------------------------
                           000001    75 	LLEN=1
                           000003    76 	SRC=3
                           000004    77 	VSIZE=4
      00A5CC                         78 del_line: 
      000024                         79 	_vars VSIZE 
      00A5CC 52 04            [ 2]    1     sub sp,#VSIZE 
      00A5CE E6 02            [ 1]   80 	ld a,(2,x) ; line length
      00A5D0 6B 02            [ 1]   81 	ld (LLEN+1,sp),a 
      00A5D2 0F 01            [ 1]   82 	clr (LLEN,sp)
      00A5D4 90 93            [ 1]   83 	ldw y,x  
      00A5D6 72 F9 01         [ 2]   84 	addw y,(LLEN,sp) ;SRC  
      00A5D9 17 03            [ 2]   85 	ldw (SRC,sp),y  ;save source 
      00A5DB 90 CE 00 1F      [ 2]   86 	ldw y,txtend 
      00A5DF 72 F2 03         [ 2]   87 	subw y,(SRC,sp) ; y=count 
      00A5E2 90 CF 00 0D      [ 2]   88 	ldw acc16,y 
      00A5E6 16 03            [ 2]   89 	ldw y,(SRC,sp)    ; source
      00A5E8 CD 84 DE         [ 4]   90 	call move
      00A5EB 90 CE 00 1F      [ 2]   91 	ldw y,txtend 
      00A5EF 72 F2 01         [ 2]   92 	subw y,(LLEN,sp)
      00A5F2 90 CF 00 1F      [ 2]   93 	ldw txtend,y  
      00004E                         94 	_drop VSIZE     
      00A5F6 5B 04            [ 2]    1     addw sp,#VSIZE 
      00A5F8 81               [ 4]   95 	ret 
                                     96 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                     97 ;---------------------------------------------
                                     98 ; create a gap in text area to 
                                     99 ; move new line in this gap
                                    100 ; input:
                                    101 ;    X 			addr gap start 
                                    102 ;    Y 			gap length 
                                    103 ; output:
                                    104 ;    X 			addr gap start 
                                    105 ;--------------------------------------------
                           000001   106 	DEST=1
                           000003   107 	SRC=3
                           000005   108 	LEN=5
                           000006   109 	VSIZE=6 
      00A5F9                        110 create_gap:
      000051                        111 	_vars VSIZE
      00A5F9 52 06            [ 2]    1     sub sp,#VSIZE 
      00A5FB 1F 03            [ 2]  112 	ldw (SRC,sp),x 
      00A5FD 17 05            [ 2]  113 	ldw (LEN,sp),y 
      00A5FF 90 CF 00 0D      [ 2]  114 	ldw acc16,y 
      00A603 90 93            [ 1]  115 	ldw y,x ; SRC
      00A605 72 BB 00 0D      [ 2]  116 	addw x,acc16  
      00A609 1F 01            [ 2]  117 	ldw (DEST,sp),x 
                                    118 ;compute size to move 	
      00A60B CE 00 1F         [ 2]  119 	ldw x,txtend 
      00A60E 72 F0 03         [ 2]  120 	subw x,(SRC,sp)
      00A611 CF 00 0D         [ 2]  121 	ldw acc16,x ; size to move
      00A614 1E 01            [ 2]  122 	ldw x,(DEST,sp) 
      00A616 CD 84 DE         [ 4]  123 	call move
      00A619 CE 00 1F         [ 2]  124 	ldw x,txtend
      00A61C 72 FB 05         [ 2]  125 	addw x,(LEN,sp)
      00A61F CF 00 1F         [ 2]  126 	ldw txtend,x
      00007A                        127 9$:	_drop VSIZE 
      00A622 5B 06            [ 2]    1     addw sp,#VSIZE 
      00A624 81               [ 4]  128 	ret 
                                    129 
                                    130 ;--------------------------------------------
                                    131 ; insert line in pad into text area 
                                    132 ; first search for already existing 
                                    133 ; replace existing 
                                    134 ; if new line empty delete existing one. 
                                    135 ; input:
                                    136 ;   ptr16		pointer to tokenized line  
                                    137 ; output:
                                    138 ;   none
                                    139 ;---------------------------------------------
                           000001   140 	DEST=1  ; text area insertion address 
                           000003   141 	SRC=3   ; str to insert address 
                           000005   142 	LINENO=5 ; line number 
                           000007   143 	LLEN=7 ; line length 
                           000008   144 	VSIZE=8  
      00A625                        145 insert_line:
      00007D                        146 	_vars VSIZE 
      00A625 52 08            [ 2]    1     sub sp,#VSIZE 
      00A627 CE 00 1F         [ 2]  147 	ldw x,txtend  
      00A62A C3 00 1D         [ 2]  148 	cpw x,txtbgn 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      00A62D 26 19            [ 1]  149 	jrne 0$
                                    150 ;first text line 
      00A62F AE 00 02         [ 2]  151 	ldw x,#2 
      00A632 72 D6 00 18      [ 4]  152 	ld a,([ptr16],x)
      00A636 A1 03            [ 1]  153 	cp a,#3
      00A638 27 59            [ 1]  154 	jreq insert_ln_exit
      00A63A 5F               [ 1]  155 	clrw x 
      00A63B 97               [ 1]  156 	ld xl,a
      00A63C 1F 07            [ 2]  157 	ldw (LLEN,sp),x 
      00A63E CE 00 1D         [ 2]  158 	ldw x,txtbgn
      00A641 1F 01            [ 2]  159 	ldw (DEST,sp),x 
      00A643 CE 00 1F         [ 2]  160 	ldw x,txtend 
      00A646 20 37            [ 2]  161 	jra 4$
      00A648 72 CE 00 18      [ 5]  162 0$:	ldw x,[ptr16]
                                    163 ; line number
      00A64C 1F 05            [ 2]  164 	ldw (LINENO,sp),x 
      00A64E AE 00 02         [ 2]  165 	ldw x,#2 
      00A651 72 D6 00 18      [ 4]  166 	ld a,([ptr16],x)
      00A655 97               [ 1]  167 	ld xl,a
                                    168 ; line length
      00A656 1F 07            [ 2]  169 	ldw (LLEN,sp),x
                                    170 ; check if that line number already exit 	
      00A658 1E 05            [ 2]  171 	ldw x,(LINENO,sp)
      00A65A CD A5 A8         [ 4]  172 	call search_lineno 
      00A65D 5D               [ 2]  173 	tnzw x 
      00A65E 26 04            [ 1]  174 	jrne 2$
                                    175 ; line doesn't exit
                                    176 ; it will be inserted at this point.  	
      00A660 17 01            [ 2]  177 	ldw (DEST,sp),y 
      00A662 20 05            [ 2]  178 	jra 3$
                                    179 ; line exit delete it.
                                    180 ; it will be replaced by new one 	
      00A664 1F 01            [ 2]  181 2$: ldw (DEST,sp),x 
      00A666 CD A5 CC         [ 4]  182 	call del_line
      00A669                        183 3$: 
                                    184 ; insert new line or leave if LLEN==3
                                    185 ; LLEN==3 means empty line 
      00A669 A6 03            [ 1]  186 	ld a,#3
      00A66B 11 08            [ 1]  187 	cp a,(LLEN+1,sp)
      00A66D 27 24            [ 1]  188 	jreq insert_ln_exit ; empty line exit.
                                    189 ; if insertion point at txtend 
                                    190 ; move no need to create a gap 
      00A66F 1E 01            [ 2]  191 	ldw x,(DEST,sp)
      00A671 C3 00 1F         [ 2]  192 	cpw x,txtend 
      00A674 27 09            [ 1]  193 	jreq 4$ 
                                    194 ; must create a gap
                                    195 ; at insertion point  
      00A676 1E 01            [ 2]  196 	ldw x,(DEST,sp)
      00A678 16 07            [ 2]  197 	ldw y,(LLEN,sp)
      00A67A CD A5 F9         [ 4]  198 	call create_gap
      00A67D 20 06            [ 2]  199 	jra 5$
      00A67F                        200 4$: 
      00A67F 72 FB 07         [ 2]  201 	addw x,(LLEN,sp)
      00A682 CF 00 1F         [ 2]  202 	ldw txtend,x 	 
                                    203 ; move new line in gap 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      00A685 1E 07            [ 2]  204 5$:	ldw x,(LLEN,sp)
      00A687 CF 00 0D         [ 2]  205 	ldw acc16,x 
      00A68A 90 AE 16 E0      [ 2]  206 	ldw y,#pad ;SRC 
      00A68E 1E 01            [ 2]  207 	ldw x,(DEST,sp) ; dest address 
      00A690 CD 84 DE         [ 4]  208 	call move 
      00A693                        209 insert_ln_exit:	
      0000EB                        210 	_drop VSIZE
      00A693 5B 08            [ 2]    1     addw sp,#VSIZE 
      00A695 81               [ 4]  211 	ret
                                    212 
                                    213 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    214 ;; compiler routines        ;;
                                    215 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    216 ;------------------------------------
                                    217 ; parse quoted string 
                                    218 ; input:
                                    219 ;   Y 	pointer to tib 
                                    220 ;   X   pointer to output buffer 
                                    221 ; output:
                                    222 ;	buffer   parsed string
                                    223 ;------------------------------------
                           000001   224 	PREV = 1
                           000002   225 	CURR =2
                           000002   226 	VSIZE=2
      00A696                        227 parse_quote: 
      0000EE                        228 	_vars VSIZE 
      00A696 52 02            [ 2]    1     sub sp,#VSIZE 
      00A698 4F               [ 1]  229 	clr a
      00A699 6B 01            [ 1]  230 1$:	ld (PREV,sp),a 
      00A69B                        231 2$:	
      00A69B 91 D6 01         [ 4]  232 	ld a,([in.w],y)
      00A69E 27 24            [ 1]  233 	jreq 6$
      00A6A0 72 5C 00 02      [ 1]  234 	inc in 
      00A6A4 6B 02            [ 1]  235 	ld (CURR,sp),a 
      00A6A6 A6 5C            [ 1]  236 	ld a,#'\
      00A6A8 11 01            [ 1]  237 	cp a, (PREV,sp)
      00A6AA 26 0A            [ 1]  238 	jrne 3$
      00A6AC 0F 01            [ 1]  239 	clr (PREV,sp)
      00A6AE 7B 02            [ 1]  240 	ld a,(CURR,sp)
      00A6B0 AD 1C            [ 4]  241 	callr convert_escape
      00A6B2 F7               [ 1]  242 	ld (x),a 
      00A6B3 5C               [ 1]  243 	incw x 
      00A6B4 20 E5            [ 2]  244 	jra 2$
      00A6B6                        245 3$:
      00A6B6 7B 02            [ 1]  246 	ld a,(CURR,sp)
      00A6B8 A1 5C            [ 1]  247 	cp a,#'\'
      00A6BA 27 DD            [ 1]  248 	jreq 1$
      00A6BC A1 22            [ 1]  249 	cp a,#'"
      00A6BE 27 04            [ 1]  250 	jreq 6$ 
      00A6C0 F7               [ 1]  251 	ld (x),a 
      00A6C1 5C               [ 1]  252 	incw x 
      00A6C2 20 D7            [ 2]  253 	jra 2$
      00A6C4                        254 6$:
      00A6C4 7F               [ 1]  255 	clr (x)
      00A6C5 5C               [ 1]  256 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      00A6C6 90 93            [ 1]  257 	ldw y,x 
      00A6C8 5F               [ 1]  258 	clrw x 
      00A6C9 A6 02            [ 1]  259 	ld a,#TK_QSTR  
      000123                        260 	_drop VSIZE
      00A6CB 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A6CD 81               [ 4]  261 	ret 
                                    262 
                                    263 ;---------------------------------------
                                    264 ; called by parse_quote
                                    265 ; subtitute escaped character 
                                    266 ; by their ASCII value .
                                    267 ; input:
                                    268 ;   A  character following '\'
                                    269 ; output:
                                    270 ;   A  substitued char or same if not valid.
                                    271 ;---------------------------------------
      00A6CE                        272 convert_escape:
      00A6CE 89               [ 2]  273 	pushw x 
      00A6CF AE A6 E3         [ 2]  274 	ldw x,#escaped 
      00A6D2 F1               [ 1]  275 1$:	cp a,(x)
      00A6D3 27 06            [ 1]  276 	jreq 2$
      00A6D5 7D               [ 1]  277 	tnz (x)
      00A6D6 27 09            [ 1]  278 	jreq 3$
      00A6D8 5C               [ 1]  279 	incw x 
      00A6D9 20 F7            [ 2]  280 	jra 1$
      00A6DB 1D A6 E3         [ 2]  281 2$: subw x,#escaped 
      00A6DE 9F               [ 1]  282 	ld a,xl 
      00A6DF AB 07            [ 1]  283 	add a,#7
      00A6E1 85               [ 2]  284 3$:	popw x 
      00A6E2 81               [ 4]  285 	ret 
                                    286 
      00A6E3 61 62 74 6E 76 66 72   287 escaped:: .asciz "abtnvfr"
             00
                                    288 
                                    289 ;-------------------------
                                    290 ; integer parser 
                                    291 ; input:
                                    292 ;   X 		point to output buffer  
                                    293 ;   Y 		point to tib 
                                    294 ;   A 	    first digit|'$' 
                                    295 ; output:  
                                    296 ;   X 		integer 
                                    297 ;   A 		TK_INTGR
                                    298 ;   acc24   24 bits integer 
                                    299 ;-------------------------
                           000001   300 	BASE=1
                           000002   301 	TCHAR=2 
                           000003   302 	XSAVE=3
                           000004   303 	VSIZE=4 
      00A6EB                        304 parse_integer: ; { -- n }
      00A6EB 89               [ 2]  305 	pushw x 	
      00A6EC 4B 00            [ 1]  306 	push #0 ; TCHAR
      00A6EE 4B 0A            [ 1]  307 	push #10 ; BASE=10
      00A6F0 A1 24            [ 1]  308 	cp a,#'$
      00A6F2 26 04            [ 1]  309 	jrne 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      00014C                        310     _drop #1
      00A6F4 5B 01            [ 2]    1     addw sp,##1 
      00A6F6 4B 10            [ 1]  311 	push #16  ; BASE=16
      00A6F8 F7               [ 1]  312 2$:	ld (x),a 
      00A6F9 5C               [ 1]  313 	incw x 
      00A6FA 91 D6 01         [ 4]  314 	ld a,([in.w],y)
      00A6FD 72 5C 00 02      [ 1]  315 	inc in 
      00A701 CD 8A 94         [ 4]  316 	call to_upper 
      00A704 6B 02            [ 1]  317 	ld (TCHAR,sp),a 
      00A706 CD 85 3F         [ 4]  318 	call is_digit 
      00A709 25 ED            [ 1]  319 	jrc 2$
      00A70B A6 10            [ 1]  320 	ld a,#16 
      00A70D 11 01            [ 1]  321 	cp a,(BASE,sp)
      00A70F 26 0A            [ 1]  322 	jrne 3$ 
      00A711 7B 02            [ 1]  323 	ld a,(TCHAR,sp)
      00A713 A1 41            [ 1]  324 	cp a,#'A 
      00A715 2B 04            [ 1]  325 	jrmi 3$ 
      00A717 A1 47            [ 1]  326 	cp a,#'G 
      00A719 2B DD            [ 1]  327 	jrmi 2$ 
      00A71B 72 5A 00 02      [ 1]  328 3$: dec in 	
      00A71F 7F               [ 1]  329     clr (x)
      00A720 1E 03            [ 2]  330 	ldw x,(XSAVE,sp)
      00A722 CD 8A A0         [ 4]  331 	call atoi24
      00A725 90 93            [ 1]  332 	ldw y,x 
      00A727 CE 00 0D         [ 2]  333 	ldw x,acc16 
      00A72A A6 84            [ 1]  334 	ld a,#TK_INTGR
      00A72C 90 FF            [ 2]  335 	ldw (y),x 
      00A72E 72 A9 00 02      [ 2]  336 	addw y,#2
      00018A                        337 	_drop VSIZE  
      00A732 5B 04            [ 2]    1     addw sp,#VSIZE 
      00A734 81               [ 4]  338 	ret 	
                                    339 
                                    340 ;-------------------------
                                    341 ; binary integer parser
                                    342 ; build integer in acc24  
                                    343 ; input:
                                    344 ;   X 		point to output buffer  
                                    345 ;   Y 		point to tib 
                                    346 ;   A 	    '&' 
                                    347 ; output:  
                                    348 ;   buffer  TK_INTGR integer  
                                    349 ;   X 		int16 
                                    350 ;   A 		TK_INTGR
                                    351 ;   acc24    int24 
                                    352 ;-------------------------
                           000001   353 	BINARY=1 ; 24 bits integer 
                           000003   354 	VSIZE=3
      00A735                        355 parse_binary: ; { -- n }
      00A735 4B 00            [ 1]  356 	push #0
      00A737 4B 00            [ 1]  357 	push #0
      00A739 4B 00            [ 1]  358 	push #0
      00A73B                        359 2$:	
      00A73B 91 D6 01         [ 4]  360 	ld a,([in.w],y)
      00A73E 72 5C 00 02      [ 1]  361 	inc in 
      00A742 A1 30            [ 1]  362 	cp a,#'0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      00A744 27 06            [ 1]  363 	jreq 3$
      00A746 A1 31            [ 1]  364 	cp a,#'1 
      00A748 27 02            [ 1]  365 	jreq 3$ 
      00A74A 20 0B            [ 2]  366 	jra bin_exit 
      00A74C A0 30            [ 1]  367 3$: sub a,#'0 
      00A74E 46               [ 1]  368 	rrc a
      00A74F 09 03            [ 1]  369 	rlc (BINARY+2,sp) 
      00A751 09 02            [ 1]  370 	rlc (BINARY+1,sp)
      00A753 09 01            [ 1]  371 	rlc (BINARY,sp) 
      00A755 20 E4            [ 2]  372 	jra 2$  
      00A757                        373 bin_exit:
      00A757 72 5A 00 02      [ 1]  374 	dec in 
      00A75B 90 93            [ 1]  375 	ldw y,x
      00A75D 7B 01            [ 1]  376 	ld a,(BINARY,sp)
      00A75F C7 00 0C         [ 1]  377 	ld acc24,a 
      00A762 1E 02            [ 2]  378 	ldw x,(BINARY+1,sp)
      00A764 CF 00 0D         [ 2]  379 	ldw acc16,x
      00A767 90 FF            [ 2]  380 	ldw (y),x 
      00A769 72 A9 00 02      [ 2]  381 	addw y,#2  
      00A76D A6 84            [ 1]  382 	ld a,#TK_INTGR 	
      0001C7                        383 	_drop VSIZE 
      00A76F 5B 03            [ 2]    1     addw sp,#VSIZE 
      00A771 81               [ 4]  384 	ret
                                    385 
                                    386 ;---------------------------
                                    387 ;  token begin with a letter,
                                    388 ;  is keyword or variable. 	
                                    389 ; input:
                                    390 ;   X 		point to pad 
                                    391 ;   Y 		point to text
                                    392 ;   A 	    first letter  
                                    393 ; output:
                                    394 ;   X		exec_addr|var_addr 
                                    395 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                    396 ;   pad 	keyword|var_name  
                                    397 ;--------------------------  
                           000001   398 	XFIRST=1
                           000002   399 	VSIZE=2
      00A772                        400 parse_keyword: 
      00A772 89               [ 2]  401 	pushw x 
      00A773                        402 kw_loop:	
      00A773 CD 8A 94         [ 4]  403 	call to_upper 
      00A776 F7               [ 1]  404 	ld (x),a 
      00A777 5C               [ 1]  405 	incw x 
      00A778 91 D6 01         [ 4]  406 	ld a,([in.w],y)
      00A77B 72 5C 00 02      [ 1]  407 	inc in 
      00A77F CD 85 2E         [ 4]  408 	call is_alpha 
      00A782 25 EF            [ 1]  409 	jrc kw_loop
      00A784 72 5A 00 02      [ 1]  410 	dec in   
      00A788 7F               [ 1]  411 1$: clr (x)
      00A789 1E 01            [ 2]  412 	ldw x,(XFIRST,sp) 
      00A78B E6 01            [ 1]  413 	ld a,(1,x)
      00A78D 26 13            [ 1]  414 	jrne 2$
                                    415 ; one letter variable name 
      00A78F F6               [ 1]  416 	ld a,(x) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00A790 A0 41            [ 1]  417 	sub a,#'A 
      00A792 48               [ 1]  418 	sll a 
      00A793 88               [ 1]  419 	push a 
      00A794 4B 00            [ 1]  420 	push #0
      00A796 AE 00 3A         [ 2]  421 	ldw x,#vars 
      00A799 72 FB 01         [ 2]  422 	addw x,(1,sp) ; X=var address 
      0001F4                        423 	_drop 2 
      00A79C 5B 02            [ 2]    1     addw sp,#2 
      00A79E A6 85            [ 1]  424 	ld a,#TK_VAR 
      00A7A0 20 0E            [ 2]  425 	jra 4$ 
      00A7A2                        426 2$: ; check for keyword, otherwise syntax error.
      0001FA                        427 	_ldx_dict kword_dict ; dictionary entry point
      00A7A2 AE A1 98         [ 2]    1     ldw x,#kword_dict+2
      00A7A5 16 01            [ 2]  428 	ldw y,(XFIRST,sp) ; name to search for
      00A7A7 CD 8C 87         [ 4]  429 	call search_dict
      00A7AA 4D               [ 1]  430 	tnz a
      00A7AB 26 03            [ 1]  431 	jrne 4$ 
      00A7AD CC 88 3B         [ 2]  432 	jp syntax_error
      00A7B0                        433 4$:	
      00A7B0 A3 8F 00         [ 2]  434     cpw x,#let 
      00A7B3 27 0C            [ 1]  435     jreq 5$
      00A7B5 16 01            [ 2]  436 	ldw y,(XFIRST,sp)
      00A7B7 90 F7            [ 1]  437 	ld (y),a 
      00A7B9 90 5C            [ 1]  438 	incw y 
      00A7BB 90 FF            [ 2]  439 	ldw (y),x
      00A7BD 72 A9 00 02      [ 2]  440 	addw y,#2  
      000219                        441 5$:	_drop VSIZE 
      00A7C1 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A7C3 81               [ 4]  442 	ret  	
                                    443 
                                    444 ;------------------------------------
                                    445 ; skip character c in text starting from 'in'
                                    446 ; input:
                                    447 ;	 y 		point to text buffer
                                    448 ;    a 		character to skip
                                    449 ; output:  
                                    450 ;	'in' ajusted to new position
                                    451 ;------------------------------------
                           000001   452 	C = 1 ; local var
      00A7C4                        453 skip:
      00A7C4 88               [ 1]  454 	push a
      00A7C5 91 D6 01         [ 4]  455 1$:	ld a,([in.w],y)
      00A7C8 27 0A            [ 1]  456 	jreq 2$
      00A7CA 11 01            [ 1]  457 	cp a,(C,sp)
      00A7CC 26 06            [ 1]  458 	jrne 2$
      00A7CE 72 5C 00 02      [ 1]  459 	inc in
      00A7D2 20 F1            [ 2]  460 	jra 1$
      00022C                        461 2$: _drop 1 
      00A7D4 5B 01            [ 2]    1     addw sp,#1 
      00A7D6 81               [ 4]  462 	ret
                                    463 	
                                    464 
                                    465 ;------------------------------------
                                    466 ; scan text for next token
                                    467 ; input: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    468 ;	X 		pointer to buffer where 
                                    469 ;	        token id and value are copied 
                                    470 ; use:
                                    471 ;	Y   pointer to text in tib 
                                    472 ; output:
                                    473 ;   A       token attribute 
                                    474 ;   X 		token value
                                    475 ;   Y       updated position in output buffer   
                                    476 ;------------------------------------
                                    477 	; use to check special character 
                                    478 	.macro _case c t  
                                    479 	ld a,#c 
                                    480 	cp a,(TCHAR,sp) 
                                    481 	jrne t
                                    482 	.endm 
                                    483 
                           000001   484 	TCHAR=1
                           000002   485 	ATTRIB=2
                           000002   486 	VSIZE=2
      00A7D7                        487 get_token:: 
      00022F                        488 	_vars VSIZE
      00A7D7 52 02            [ 2]    1     sub sp,#VSIZE 
                                    489 ;	ld a,in 
                                    490 ;	sub a,count
                                    491 ;   jrmi 0$
                                    492 ;	clr a 
                                    493 ;	ret 
      00A7D9                        494 0$: 
      00A7D9 90 AE 16 90      [ 2]  495 	ldw y,#tib    	
      00A7DD A6 20            [ 1]  496 	ld a,#SPACE
      00A7DF CD A7 C4         [ 4]  497 	call skip
      00A7E2 55 00 02 00 03   [ 1]  498 	mov in.saved,in 
      00A7E7 91 D6 01         [ 4]  499 	ld a,([in.w],y)
      00A7EA 26 05            [ 1]  500 	jrne 1$
      00A7EC 90 93            [ 1]  501 	ldw y,x 
      00A7EE CC A9 93         [ 2]  502 	jp token_exit ; end of line 
      00A7F1 72 5C 00 02      [ 1]  503 1$:	inc in 
      00A7F5 CD 8A 94         [ 4]  504 	call to_upper 
      00A7F8 6B 01            [ 1]  505 	ld (TCHAR,sp),a 
                                    506 ; check for quoted string
      00A7FA                        507 str_tst:  	
      000252                        508 	_case '"' nbr_tst
      00A7FA A6 22            [ 1]    1 	ld a,#'"' 
      00A7FC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A7FE 26 0A            [ 1]    3 	jrne nbr_tst
      00A800 A6 02            [ 1]  509 	ld a,#TK_QSTR
      00A802 F7               [ 1]  510 	ld (x),a 
      00A803 5C               [ 1]  511 	incw x 
      00A804 CD A6 96         [ 4]  512 	call parse_quote
      00A807 CC A9 93         [ 2]  513 	jp token_exit
      00A80A                        514 nbr_tst:
                                    515 ; check for hexadecimal number 
      00A80A A6 24            [ 1]  516 	ld a,#'$'
      00A80C 11 01            [ 1]  517 	cp a,(TCHAR,sp) 
      00A80E 27 17            [ 1]  518 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    519 ;check for binary number 
      00A810 A6 26            [ 1]  520 	ld a,#'&
      00A812 11 01            [ 1]  521 	cp a,(TCHAR,sp)
      00A814 26 0A            [ 1]  522 	jrne 0$
      00A816 A6 84            [ 1]  523 	ld a,#TK_INTGR
      00A818 F7               [ 1]  524 	ld (x),a 
      00A819 5C               [ 1]  525 	incw x 
      00A81A CD A7 35         [ 4]  526 	call parse_binary ; expect binary integer 
      00A81D CC A9 93         [ 2]  527 	jp token_exit 
                                    528 ; check for decimal number 	
      00A820 7B 01            [ 1]  529 0$:	ld a,(TCHAR,sp)
      00A822 CD 85 3F         [ 4]  530 	call is_digit
      00A825 24 0C            [ 1]  531 	jrnc 3$
      00A827 A6 84            [ 1]  532 1$:	ld a,#TK_INTGR 
      00A829 F7               [ 1]  533 	ld (x),a 
      00A82A 5C               [ 1]  534 	incw x 
      00A82B 7B 01            [ 1]  535 	ld a,(TCHAR,sp)
      00A82D CD A6 EB         [ 4]  536 	call parse_integer 
      00A830 CC A9 93         [ 2]  537 	jp token_exit 
      00A833                        538 3$: 
      00028B                        539 	_case '(' bkslsh_tst 
      00A833 A6 28            [ 1]    1 	ld a,#'(' 
      00A835 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A837 26 05            [ 1]    3 	jrne bkslsh_tst
      00A839 A6 07            [ 1]  540 	ld a,#TK_LPAREN
      00A83B CC A9 8F         [ 2]  541 	jp token_char   	
      00A83E                        542 bkslsh_tst: ; character token 
      000296                        543 	_case '\',rparnt_tst
      00A83E A6 5C            [ 1]    1 	ld a,#'\' 
      00A840 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A842 26 16            [ 1]    3 	jrne rparnt_tst
      00A844 A6 03            [ 1]  544 	ld a,#TK_CHAR 
      00A846 F7               [ 1]  545 	ld (x),a 
      00A847 5C               [ 1]  546 	incw x 
      00A848 91 D6 01         [ 4]  547 	ld a,([in.w],y)
      00A84B F7               [ 1]  548 	ld (x),a 
      00A84C 5C               [ 1]  549 	incw x
      00A84D 90 93            [ 1]  550 	ldw y,x 	 
      00A84F 72 5C 00 02      [ 1]  551 	inc in  
      00A853 5F               [ 1]  552 	clrw x 
      00A854 97               [ 1]  553 	ld xl,a 
      00A855 A6 03            [ 1]  554 	ld a,#TK_CHAR 
      00A857 CC A9 93         [ 2]  555 	jp token_exit 
      00A85A                        556 rparnt_tst:		
      0002B2                        557 	_case ')' colon_tst 
      00A85A A6 29            [ 1]    1 	ld a,#')' 
      00A85C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A85E 26 05            [ 1]    3 	jrne colon_tst
      00A860 A6 08            [ 1]  558 	ld a,#TK_RPAREN 
      00A862 CC A9 8F         [ 2]  559 	jp token_char
      00A865                        560 colon_tst:
      0002BD                        561 	_case ':' comma_tst 
      00A865 A6 3A            [ 1]    1 	ld a,#':' 
      00A867 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A869 26 05            [ 1]    3 	jrne comma_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      00A86B A6 01            [ 1]  562 	ld a,#TK_COLON 
      00A86D CC A9 8F         [ 2]  563 	jp token_char  
      00A870                        564 comma_tst:
      0002C8                        565 	_case COMMA sharp_tst 
      00A870 A6 2C            [ 1]    1 	ld a,#COMMA 
      00A872 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A874 26 05            [ 1]    3 	jrne sharp_tst
      00A876 A6 09            [ 1]  566 	ld a,#TK_COMMA
      00A878 CC A9 8F         [ 2]  567 	jp token_char
      00A87B                        568 sharp_tst:
      0002D3                        569 	_case SHARP dash_tst 
      00A87B A6 23            [ 1]    1 	ld a,#SHARP 
      00A87D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A87F 26 05            [ 1]    3 	jrne dash_tst
      00A881 A6 0A            [ 1]  570 	ld a,#TK_SHARP
      00A883 CC A9 8F         [ 2]  571 	jp token_char  	 	 
      00A886                        572 dash_tst: 	
      0002DE                        573 	_case '-' at_tst 
      00A886 A6 2D            [ 1]    1 	ld a,#'-' 
      00A888 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A88A 26 05            [ 1]    3 	jrne at_tst
      00A88C A6 11            [ 1]  574 	ld a,#TK_MINUS  
      00A88E CC A9 8F         [ 2]  575 	jp token_char 
      00A891                        576 at_tst:
      0002E9                        577 	_case '@' qmark_tst 
      00A891 A6 40            [ 1]    1 	ld a,#'@' 
      00A893 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A895 26 05            [ 1]    3 	jrne qmark_tst
      00A897 A6 06            [ 1]  578 	ld a,#TK_ARRAY 
      00A899 CC A9 8F         [ 2]  579 	jp token_char
      00A89C                        580 qmark_tst:
      0002F4                        581 	_case '?' tick_tst 
      00A89C A6 3F            [ 1]    1 	ld a,#'?' 
      00A89E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A8A0 26 12            [ 1]    3 	jrne tick_tst
      00A8A2 A6 80            [ 1]  582 	ld a,#TK_CMD  
      00A8A4 F7               [ 1]  583 	ld (x),a 
      00A8A5 5C               [ 1]  584 	incw x 
      00A8A6 90 93            [ 1]  585 	ldw y,x 
      00A8A8 AE 00 74         [ 2]  586 	ldw x,#PRT_IDX 
      00A8AB 90 FF            [ 2]  587 	ldw (y),x 
      00A8AD 72 A9 00 02      [ 2]  588 	addw y,#2
      00A8B1 CC A9 93         [ 2]  589 	jp token_exit
      00A8B4                        590 tick_tst: ; comment 
      00030C                        591 	_case TICK plus_tst 
      00A8B4 A6 27            [ 1]    1 	ld a,#TICK 
      00A8B6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A8B8 26 35            [ 1]    3 	jrne plus_tst
      00A8BA A6 80            [ 1]  592 	ld a,#TK_CMD
      00A8BC F7               [ 1]  593 	ld (x),a 
      00A8BD 5C               [ 1]  594 	incw x
      00A8BE 90 AE 00 8E      [ 2]  595 	ldw y,#REM_IDX
      00A8C2 FF               [ 2]  596 	ldw (x),y 
      00A8C3 1C 00 02         [ 2]  597 	addw x,#2  
      00A8C6                        598 copy_comment:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      00A8C6 90 AE 16 90      [ 2]  599 	ldw y,#tib 
      00A8CA 72 B9 00 01      [ 2]  600 	addw y,in.w
      00A8CE 90 89            [ 2]  601 	pushw y
      00A8D0 CD 84 D0         [ 4]  602 	call strcpy
      00A8D3 72 F2 01         [ 2]  603     subw y,(1,sp)
      00A8D6 90 9F            [ 1]  604 	ld a,yl 
      00A8D8 CB 00 02         [ 1]  605 	add a,in
      00A8DB C7 00 02         [ 1]  606 	ld in,a 
      00A8DE 1F 01            [ 2]  607 	ldw (1,sp),x
      00A8E0 72 F9 01         [ 2]  608 	addw y,(1,sp)
      00A8E3 90 5C            [ 1]  609 	incw y 
      00033D                        610 	_drop 2 
      00A8E5 5B 02            [ 2]    1     addw sp,#2 
      00A8E7 AE 00 8E         [ 2]  611 	ldw x,#REM_IDX 
      00A8EA A6 80            [ 1]  612 	ld a,#TK_CMD 
      00A8EC CC A9 93         [ 2]  613 	jp token_exit 
      00A8EF                        614 plus_tst:
      000347                        615 	_case '+' star_tst 
      00A8EF A6 2B            [ 1]    1 	ld a,#'+' 
      00A8F1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A8F3 26 05            [ 1]    3 	jrne star_tst
      00A8F5 A6 10            [ 1]  616 	ld a,#TK_PLUS  
      00A8F7 CC A9 8F         [ 2]  617 	jp token_char 
      00A8FA                        618 star_tst:
      000352                        619 	_case '*' slash_tst 
      00A8FA A6 2A            [ 1]    1 	ld a,#'*' 
      00A8FC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A8FE 26 05            [ 1]    3 	jrne slash_tst
      00A900 A6 20            [ 1]  620 	ld a,#TK_MULT 
      00A902 CC A9 8F         [ 2]  621 	jp token_char 
      00A905                        622 slash_tst: 
      00035D                        623 	_case '/' prcnt_tst 
      00A905 A6 2F            [ 1]    1 	ld a,#'/' 
      00A907 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A909 26 05            [ 1]    3 	jrne prcnt_tst
      00A90B A6 21            [ 1]  624 	ld a,#TK_DIV 
      00A90D CC A9 8F         [ 2]  625 	jp token_char 
      00A910                        626 prcnt_tst:
      000368                        627 	_case '%' eql_tst 
      00A910 A6 25            [ 1]    1 	ld a,#'%' 
      00A912 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A914 26 05            [ 1]    3 	jrne eql_tst
      00A916 A6 22            [ 1]  628 	ld a,#TK_MOD
      00A918 CC A9 8F         [ 2]  629 	jp token_char  
                                    630 ; 1 or 2 character tokens 	
      00A91B                        631 eql_tst:
      000373                        632 	_case '=' gt_tst 		
      00A91B A6 3D            [ 1]    1 	ld a,#'=' 
      00A91D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A91F 26 05            [ 1]    3 	jrne gt_tst
      00A921 A6 32            [ 1]  633 	ld a,#TK_EQUAL
      00A923 CC A9 8F         [ 2]  634 	jp token_char 
      00A926                        635 gt_tst:
      00037E                        636 	_case '>' lt_tst 
      00A926 A6 3E            [ 1]    1 	ld a,#'>' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00A928 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A92A 26 23            [ 1]    3 	jrne lt_tst
      00A92C A6 31            [ 1]  637 	ld a,#TK_GT 
      00A92E 6B 02            [ 1]  638 	ld (ATTRIB,sp),a 
      00A930 91 D6 01         [ 4]  639 	ld a,([in.w],y)
      00A933 72 5C 00 02      [ 1]  640 	inc in 
      00A937 A1 3D            [ 1]  641 	cp a,#'=
      00A939 26 04            [ 1]  642 	jrne 1$
      00A93B A6 33            [ 1]  643 	ld a,#TK_GE 
      00A93D 20 50            [ 2]  644 	jra token_char  
      00A93F A1 3C            [ 1]  645 1$: cp a,#'<
      00A941 26 04            [ 1]  646 	jrne 2$
      00A943 A6 35            [ 1]  647 	ld a,#TK_NE 
      00A945 20 48            [ 2]  648 	jra token_char 
      00A947 72 5A 00 02      [ 1]  649 2$: dec in
      00A94B 7B 02            [ 1]  650 	ld a,(ATTRIB,sp)
      00A94D 20 40            [ 2]  651 	jra token_char 	 
      00A94F                        652 lt_tst:
      0003A7                        653 	_case '<' other
      00A94F A6 3C            [ 1]    1 	ld a,#'<' 
      00A951 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A953 26 23            [ 1]    3 	jrne other
      00A955 A6 34            [ 1]  654 	ld a,#TK_LT 
      00A957 6B 02            [ 1]  655 	ld (ATTRIB,sp),a 
      00A959 91 D6 01         [ 4]  656 	ld a,([in.w],y)
      00A95C 72 5C 00 02      [ 1]  657 	inc in 
      00A960 A1 3D            [ 1]  658 	cp a,#'=
      00A962 26 04            [ 1]  659 	jrne 1$
      00A964 A6 36            [ 1]  660 	ld a,#TK_LE 
      00A966 20 27            [ 2]  661 	jra token_char 
      00A968 A1 3E            [ 1]  662 1$: cp a,#'>
      00A96A 26 04            [ 1]  663 	jrne 2$
      00A96C A6 35            [ 1]  664 	ld a,#TK_NE 
      00A96E 20 1F            [ 2]  665 	jra token_char 
      00A970 72 5A 00 02      [ 1]  666 2$: dec in 
      00A974 7B 02            [ 1]  667 	ld a,(ATTRIB,sp)
      00A976 20 17            [ 2]  668 	jra token_char 	
      00A978                        669 other: ; not a special character 	 
      00A978 7B 01            [ 1]  670 	ld a,(TCHAR,sp)
      00A97A CD 85 2E         [ 4]  671 	call is_alpha 
      00A97D 25 03            [ 1]  672 	jrc 30$ 
      00A97F CC 88 3B         [ 2]  673 	jp syntax_error 
      00A982                        674 30$: 
      00A982 CD A7 72         [ 4]  675 	call parse_keyword
      00A985 A3 90 B9         [ 2]  676 	cpw x,#remark 
      00A988 26 09            [ 1]  677 	jrne token_exit 
      00A98A 90 93            [ 1]  678 	ldw y,x 
      00A98C CC A8 C6         [ 2]  679 	jp copy_comment 
      00A98F                        680 token_char:
      00A98F F7               [ 1]  681 	ld (x),a 
      00A990 5C               [ 1]  682 	incw x
      00A991 90 93            [ 1]  683 	ldw y,x 
      00A993                        684 token_exit:
      0003EB                        685 	_drop VSIZE 
      00A993 5B 02            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      00A995 81               [ 4]  686 	ret
                                    687 
                                    688 
                                    689 ;-----------------------------------
                                    690 ; create token list fromm text line 
                                    691 ; save this list in pad buffer 
                                    692 ;  compiled line format: 
                                    693 ;    line_no  2 bytes {0...32767}
                                    694 ;    count    1 byte  
                                    695 ;    tokens   variable length 
                                    696 ;   
                                    697 ; input:
                                    698 ;   none
                                    699 ; modified variables:
                                    700 ;   basicptr     token list buffer address 
                                    701 ;   in.w  		 3|count, i.e. index in buffer
                                    702 ;   count        length of line | 0  
                                    703 ;-----------------------------------
                           000001   704 	XSAVE=1
                           000002   705 	VSIZE=2
      00A996                        706 compile::
      0003EE                        707 	_vars VSIZE 
      00A996 52 02            [ 2]    1     sub sp,#VSIZE 
      00A998 72 1A 00 24      [ 1]  708 	bset flags,#FCOMP 
      00A99C A6 00            [ 1]  709 	ld a,#0
      00A99E AE 00 00         [ 2]  710 	ldw x,#0
      00A9A1 CF 16 E0         [ 2]  711 	ldw pad,x ; destination buffer 
      00A9A4 C7 16 E2         [ 1]  712 	ld pad+2,a ; count 
      00A9A7 AE 16 E3         [ 2]  713 	ldw x,#pad+3
      00A9AA 72 5F 00 02      [ 1]  714 	clr in 
      00A9AE CD A7 D7         [ 4]  715 	call get_token
      00A9B1 A1 84            [ 1]  716 	cp a,#TK_INTGR
      00A9B3 26 11            [ 1]  717 	jrne 2$
      00A9B5 A3 00 01         [ 2]  718 	cpw x,#1 
      00A9B8 2A 05            [ 1]  719 	jrpl 1$
      00A9BA A6 0A            [ 1]  720 	ld a,#ERR_BAD_VALUE
      00A9BC CC 88 3D         [ 2]  721 	jp tb_error
      00A9BF CF 16 E0         [ 2]  722 1$:	ldw pad,x 
      00A9C2 90 AE 16 E3      [ 2]  723 	ldw y,#pad+3 
      00A9C6 90 A3 17 60      [ 2]  724 2$:	cpw y,#stack_full 
      00A9CA 25 05            [ 1]  725 	jrult 3$
      00A9CC A6 0F            [ 1]  726 	ld a,#ERR_BUF_FULL 
      00A9CE CC 88 3D         [ 2]  727 	jp tb_error 
      00A9D1                        728 3$:	
      00A9D1 93               [ 1]  729 	ldw x,y 
      00A9D2 CD A7 D7         [ 4]  730 	call get_token 
      00A9D5 A1 00            [ 1]  731 	cp a,#TK_NONE 
      00A9D7 26 ED            [ 1]  732 	jrne 2$ 
                                    733 ; compilation completed  
      00A9D9 72 A2 16 E0      [ 2]  734 	subw y,#pad
      00A9DD 90 9F            [ 1]  735     ld a,yl
      00A9DF AE 16 E0         [ 2]  736 	ldw x,#pad 
      00A9E2 CF 00 18         [ 2]  737 	ldw ptr16,x 
      00A9E5 E7 02            [ 1]  738 	ld (2,x),a 
      00A9E7 FE               [ 2]  739 	ldw x,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00A9E8 27 09            [ 1]  740 	jreq 10$
      00A9EA CD A6 25         [ 4]  741 	call insert_line
      00A9ED 72 5F 00 04      [ 1]  742 	clr  count 
      00A9F1 20 0F            [ 2]  743 	jra  11$ 
      00A9F3                        744 10$: ; line# is zero 
      00A9F3 CE 00 18         [ 2]  745 	ldw x,ptr16  
      00A9F6 CF 00 05         [ 2]  746 	ldw basicptr,x 
      00A9F9 E6 02            [ 1]  747 	ld a,(2,x)
      00A9FB C7 00 04         [ 1]  748 	ld count,a 
      00A9FE 35 03 00 02      [ 1]  749 	mov in,#3 
      00AA02                        750 11$:
      00045A                        751 	_drop VSIZE 
      00AA02 5B 02            [ 2]    1     addw sp,#VSIZE 
      00AA04 72 1B 00 24      [ 1]  752 	bres flags,#FCOMP 
      00AA08 81               [ 4]  753 	ret 
                                    754 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     ABS_IDX =  000000     |     ACK     =  000006 
    ADCON_ID=  000002     |     ADCREAD_=  000004     |     ADC_CR1 =  005401 
    ADC_CR1_=  000000     |     ADC_CR1_=  000001     |     ADC_CR1_=  000004 
    ADC_CR1_=  000005     |     ADC_CR1_=  000006     |     ADC_CR2 =  005402 
    ADC_CR2_=  000003     |     ADC_CR2_=  000004     |     ADC_CR2_=  000005 
    ADC_CR2_=  000006     |     ADC_CR2_=  000001     |     ADC_CR3 =  005403 
    ADC_CR3_=  000007     |     ADC_CR3_=  000006     |     ADC_CSR =  005400 
    ADC_CSR_=  000006     |     ADC_CSR_=  000004     |     ADC_CSR_=  000000 
    ADC_CSR_=  000001     |     ADC_CSR_=  000002     |     ADC_CSR_=  000003 
    ADC_CSR_=  000007     |     ADC_CSR_=  000005     |     ADC_DRH =  005404 
    ADC_DRL =  005405     |     ADC_TDRH=  005406     |     ADC_TDRL=  005407 
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
    AND_IDX =  000006     |     ASC_IDX =  000008     |     ATTRIB  =  000002 
    AUTORUN_=  00000A     |     AUTORUN_=  004000     |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_CSR_=  000004     |     AWU_IDX =  00000C 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
    B19200  =  000003     |     B1_MASK =  000002     |     B230400 =  000007 
    B2400   =  000000     |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
    B4_MASK =  000010     |     B57600  =  000005     |     B5_MASK =  000020 
    B6_MASK =  000040     |     B7_MASK =  000080     |     B921600 =  000009 
    B9600   =  000002     |     BASE    =  000001     |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BIT_IDX =  00000E     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BRES_IDX=  000010 
    BS      =  000008     |     BSET_IDX=  000012     |     BTEST_ID=  000014 
    BTOGL_ID=  000016     |     BYE_IDX =  000018     |     C       =  000001 
    CAN     =  000018     |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
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
    CHAR_IDX=  00001A     |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
    CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0     |     CLK_ICKR=  000002 
    CLK_ICKR=  000000     |     CLK_ICKR=  000001     |     CLK_ICKR=  000003 
    CLK_ICKR=  000004     |     CLK_ICKR=  000005     |     CLK_PCKE=  0050C7 
    CLK_PCKE=  000000     |     CLK_PCKE=  000001     |     CLK_PCKE=  000007 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]

Symbol Table

    CLK_PCKE=  000005     |     CLK_PCKE=  000006     |     CLK_PCKE=  000004 
    CLK_PCKE=  000002     |     CLK_PCKE=  000003     |     CLK_PCKE=  0050CA 
    CLK_PCKE=  000003     |     CLK_PCKE=  000002     |     CLK_PCKE=  000007 
    CLK_SWCR=  0050C5     |     CLK_SWCR=  000000     |     CLK_SWCR=  000001 
    CLK_SWCR=  000002     |     CLK_SWCR=  000003     |     CLK_SWIM=  0050CD 
    CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1 
    CLK_SWR_=  0000D2     |     CMD_END =  000002     |     COMMA   =  00002C 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
    CRH_IDX =  00001C     |     CRL_IDX =  00001E     |     CTRL_A  =  000001 
    CTRL_B  =  000002     |     CTRL_C  =  000003     |     CTRL_D  =  000004 
    CTRL_E  =  000005     |     CTRL_F  =  000006     |     CTRL_G  =  000007 
    CTRL_H  =  000008     |     CTRL_I  =  000009     |     CTRL_J  =  00000A 
    CTRL_K  =  00000B     |     CTRL_L  =  00000C     |     CTRL_M  =  00000D 
    CTRL_N  =  00000E     |     CTRL_O  =  00000F     |     CTRL_P  =  000010 
    CTRL_Q  =  000011     |     CTRL_R  =  000012     |     CTRL_S  =  000013 
    CTRL_T  =  000014     |     CTRL_U  =  000015     |     CTRL_V  =  000016 
    CTRL_W  =  000017     |     CTRL_X  =  000018     |     CTRL_Y  =  000019 
    CTRL_Z  =  00001A     |     CURR    =  000002     |     DATALN_I=  000022 
    DATA_IDX=  000020     |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
    DDR_IDX =  000024     |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |     DEC_IDX =  000026     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |     DIR_IDX =  000028 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
    DO_IDX  =  00002A     |     DREAD_ID=  00002C     |     DWRITE_I=  00002E 
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_I=  000032 
    EEPROM_S=  000800     |     EM      =  000019     |     END_IDX =  000030 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FAUTORUN=  000006     |     FBREAK  =  000004     |     FCOMP   =  000005 
    FCPU_IDX=  000034     |     FF      =  00000C     |     FHSE    =  7A1200 
    FHSI    =  F42400     |     FIRST_DA=  000006     |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |     FORGET_I=  000038     |     FOR_IDX =  000036 
    FREE_IDX=  00009E     |     FRUN    =  000000     |     FS      =  00001C 
    FSLEEP  =  000003     |     FTRAP   =  000001     |     F_CFUNC =  000080 
    F_CMD   =  000000     |     F_CONST =  0000C0     |     F_IFUNC =  000040 
    GOSUB_ID=  00003A     |     GOTO_IDX=  00003C     |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_IDX=  00003E     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |     HEX_IDX =  000040 
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
    I2C_WRIT=  000000     |     IDR_IDX =  000042     |     IF_IDX  =  000044 
    INP     =  000000     |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_ID=  000046     |     INPUT_PU=  000001 
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
    INT_VECT=  008054     |     INT_VECT=  008000     |     INT_VECT=  008030 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  008050     |     INT_VECT=  00804C     |     INT_VECT=  00805C 
    INT_VECT=  008058     |     INVERT_I=  000048     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDGEN_I=  00004A     |     IWDGREF_=  00004C 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
    KEY_IDX =  00004E     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
    LET_IDX =  000050     |     LF      =  00000A     |     LINENO  =  000005 
    LIST_IDX=  000052     |     LL      =  000001     |     LLEN    =  000007 
    LOAD_IDX=  000054     |     LOG_IDX =  000056     |     LSHIFT_I=  000058 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MULDIV_I=  00005A 
    NAFR    =  004804     |     NAK     =  000015     |     NCLKOPT =  004808 
    NEW_IDX =  00005E     |     NEXT_IDX=  00005C     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
    NOT_IDX =  000060     |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |     ODR_IDX =  000062     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |     OR_IDX  =  000064 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     PA      =  000000 
    PAD_IDX =  000066     |     PAD_SIZE=  000080     |     PAUSE_ID=  000068 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |     PEEK_IDX=  00006C     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINP_IDX=  00006E     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |     PMODE_ID=  00006A     |     POKE_IDX=  000070 
    POUT_IDX=  000072     |     PREV    =  000001     |     PRTA_IDX=  000076 
    PRTB_IDX=  000078     |     PRTC_IDX=  00007A     |     PRTD_IDX=  00007C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]

Symbol Table

    PRTE_IDX=  00007E     |     PRTF_IDX=  000080     |     PRTG_IDX=  000082 
    PRTH_IDX=  000084     |     PRTI_IDX=  000086     |     PRT_IDX =  000074 
    QKEY_IDX=  000088     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |     RBT_IDX =  00008C     |     READ_IDX=  00008A 
    REM_IDX =  00008E     |     REST_IDX=  000090     |     RET_IDX =  000092 
    RND_IDX =  000094     |     ROP     =  004800     |     RS      =  00001E 
    RSHIFT_I=  000096     |     RST_SR  =  0050B3     |     RUN_IDX =  000098 
    RX_QUEUE=  000008     |     SAVE_IDX=  00009A     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |     SHOW_IDX=  00009C 
    SI      =  00000F     |     SLEEP_ID=  0000A0     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |     SPIEN_ID=  0000A4 
    SPIRD_ID=  0000A2     |     SPISEL_I=  0000A6     |     SPIWR_ID=  0000A8 
    SPI_CR1 =  005200     |     SPI_CR1_=  000003     |     SPI_CR1_=  000000 
    SPI_CR1_=  000001     |     SPI_CR1_=  000007     |     SPI_CR1_=  000002 
    SPI_CR1_=  000006     |     SPI_CR2 =  005201     |     SPI_CR2_=  000007 
    SPI_CR2_=  000006     |     SPI_CR2_=  000005     |     SPI_CR2_=  000004 
    SPI_CR2_=  000002     |     SPI_CR2_=  000000     |     SPI_CR2_=  000001 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_SR_B=  000007 
    SPI_SR_C=  000004     |     SPI_SR_M=  000005     |     SPI_SR_O=  000006 
    SPI_SR_R=  000000     |     SPI_SR_T=  000001     |     SPI_SR_W=  000003 
    SPI_TXCR=  005207     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  0000A0     |     STEP_IDX=  0000AA     |     STOP_IDX=  0000AC 
    STX     =  000002     |     SUB     =  00001A     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     TAB     =  000009     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TIB_SIZE=  000050     |     TICK    =  000027 
    TICKS_ID=  0000AE     |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
    TIM1_BKR=  00526D     |     TIM1_CCE=  00525C     |     TIM1_CCE=  00525D 
    TIM1_CCM=  005258     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCM=  005259     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCM=  00525A     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCM=  00525B     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCR=  005265     |     TIM1_CCR=  005266     |     TIM1_CCR=  005267 
    TIM1_CCR=  005268     |     TIM1_CCR=  005269     |     TIM1_CCR=  00526A 
    TIM1_CCR=  00526B     |     TIM1_CCR=  00526C     |     TIM1_CNT=  00525E 
    TIM1_CNT=  00525F     |     TIM1_CR1=  005250     |     TIM1_CR2=  005251 
    TIM1_CR2=  000000     |     TIM1_CR2=  000002     |     TIM1_CR2=  000004 
    TIM1_CR2=  000005     |     TIM1_CR2=  000006     |     TIM1_DTR=  00526E 
    TIM1_EGR=  005257     |     TIM1_EGR=  000007     |     TIM1_EGR=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_EGR=  000002     |     TIM1_EGR=  000003     |     TIM1_EGR=  000004 
    TIM1_EGR=  000005     |     TIM1_EGR=  000006     |     TIM1_EGR=  000000 
    TIM1_ETR=  005253     |     TIM1_ETR=  000006     |     TIM1_ETR=  000000 
    TIM1_ETR=  000001     |     TIM1_ETR=  000002     |     TIM1_ETR=  000003 
    TIM1_ETR=  000007     |     TIM1_ETR=  000004     |     TIM1_ETR=  000005 
    TIM1_IER=  005254     |     TIM1_IER=  000007     |     TIM1_IER=  000001 
    TIM1_IER=  000002     |     TIM1_IER=  000003     |     TIM1_IER=  000004 
    TIM1_IER=  000005     |     TIM1_IER=  000006     |     TIM1_IER=  000000 
    TIM1_OIS=  00526F     |     TIM1_PSC=  005260     |     TIM1_PSC=  005261 
    TIM1_RCR=  005264     |     TIM1_SMC=  005252     |     TIM1_SMC=  000007 
    TIM1_SMC=  000000     |     TIM1_SMC=  000001     |     TIM1_SMC=  000002 
    TIM1_SMC=  000004     |     TIM1_SMC=  000005     |     TIM1_SMC=  000006 
    TIM1_SR1=  005255     |     TIM1_SR1=  000007     |     TIM1_SR1=  000001 
    TIM1_SR1=  000002     |     TIM1_SR1=  000003     |     TIM1_SR1=  000004 
    TIM1_SR1=  000005     |     TIM1_SR1=  000006     |     TIM1_SR1=  000000 
    TIM1_SR2=  005256     |     TIM1_SR2=  000001     |     TIM1_SR2=  000002 
    TIM1_SR2=  000003     |     TIM1_SR2=  000004     |     TIM2_ARR=  00530D 
    TIM2_ARR=  00530E     |     TIM2_CCE=  005308     |     TIM2_CCE=  000000 
    TIM2_CCE=  000001     |     TIM2_CCE=  000004     |     TIM2_CCE=  000005 
    TIM2_CCE=  005309     |     TIM2_CCM=  005305     |     TIM2_CCM=  005306 
    TIM2_CCM=  005307     |     TIM2_CCM=  000000     |     TIM2_CCM=  000004 
    TIM2_CCM=  000003     |     TIM2_CCR=  00530F     |     TIM2_CCR=  005310 
    TIM2_CCR=  005311     |     TIM2_CCR=  005312     |     TIM2_CCR=  005313 
    TIM2_CCR=  005314     |     TIM2_CNT=  00530A     |     TIM2_CNT=  00530B 
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
    TIM4_SR_=  000000     |     TIMER_ID=  0000B0     |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_ARRAY=  000006     |     TK_CFUNC=  000082 
    TK_CHAR =  000003     |     TK_CMD  =  000080     |     TK_COLON=  000001 
    TK_COMMA=  000009     |     TK_CONST=  000083     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]

Symbol Table

    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000081 
    TK_INTGR=  000084     |     TK_LE   =  000036     |     TK_LPARE=  000007 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  000002     |     TK_RPARE=  000008 
    TK_SHARP=  00000A     |     TK_VAR  =  000085     |     TMROUT_I=  0000B2 
    TONE_IDX=  0000B6     |     TO_IDX  =  0000B4     |     UART1   =  000000 
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
    UART_SR_=  000007     |     UBC     =  004801     |     UBOUND_I=  0000B8 
    UFLASH_I=  0000BA     |     UNTIL_ID=  0000BC     |     US      =  00001F 
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000BE     |     VSIZE   =  000002     |     VT      =  00000B 
    WAIT_IDX=  0000C0     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WORDS_ID=  0000C2     |     WRITE_ID=  0000C4     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XOFF    =  000013 
    XON     =  000011     |     XOR_IDX =  0000C6     |     XSAVE   =  000001 
    acc16      ****** GX  |     acc24      ****** GX  |   1 at_tst     0002E9 R
    atoi24     ****** GX  |     basicptr   ****** GX  |   1 bin_exit   0001AF R
  1 bkslsh_t   000296 R   |   1 colon_ts   0002BD R   |   1 comma_ts   0002C8 R
  1 compile    0003EE GR  |   1 convert_   000126 R   |   1 copy_com   00031E R
    count      ****** GX  |   1 create_g   000051 R   |   1 dash_tst   0002DE R
  1 del_line   000024 R   |   1 eql_tst    000373 R   |   1 escaped    00013B GR
    flags      ****** GX  |   1 get_toke   00022F GR  |   1 gt_tst     00037E R
    in         ****** GX  |     in.saved   ****** GX  |     in.w       ****** GX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]

Symbol Table

  1 insert_l   00007D R   |   1 insert_l   0000EB R   |     is_alpha   ****** GX
    is_digit   ****** GX  |   1 kw_loop    0001CB R   |     kword_di   ****** GX
    let        ****** GX  |   1 lt_tst     0003A7 R   |     move       ****** GX
  1 nbr_tst    000262 R   |   1 other      0003D0 R   |     pad        ****** GX
  1 parse_bi   00018D R   |   1 parse_in   000143 R   |   1 parse_ke   0001CA R
  1 parse_qu   0000EE R   |   1 plus_tst   000347 R   |   1 prcnt_ts   000368 R
    ptr16      ****** GX  |   1 qmark_ts   0002F4 R   |     remark     ****** GX
  1 rparnt_t   0002B2 R   |     search_d   ****** GX  |   1 search_l   000000 GR
  1 search_l   000008 R   |   1 sharp_ts   0002D3 R   |   1 skip       00021C R
  1 slash_ts   00035D R   |     stack_fu   ****** GX  |   1 star_tst   000352 R
  1 str_tst    000252 R   |     strcpy     ****** GX  |     syntax_e   ****** GX
    tb_error   ****** GX  |     tib        ****** GX  |   1 tick_tst   00030C R
    to_upper   ****** GX  |   1 token_ch   0003E7 R   |   1 token_ex   0003EB R
    txtbgn     ****** GX  |     txtend     ****** GX  |     vars       ****** GX

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 CODE       size    461   flags    0

