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
                                     41 ;   A           0 search from txbgn 
                                     42 ;			    1 search from basicptr 
                                     43 ;	X 			line# 
                                     44 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                                     45 ;   X 			addr of line | 0 
                                     46 ;   Y           line#|insert address if not found  
                                     47 ;-------------------------------------
                           000001    48 	LL=1 ; line length 
                           000002    49 	LB=2 ; line length low byte 
                           000002    50 	VSIZE=2 
      00A528                         51 search_lineno::
      000000                         52 	_vars VSIZE
      00A528 52 02            [ 2]    1     sub sp,#VSIZE 
      00A52A 0F 01            [ 1]   53 	clr (LL,sp)
      00A52C 90 CE 00 1D      [ 2]   54 	ldw y,txtbgn
      00A530 4D               [ 1]   55 	tnz a 
      00A531 27 04            [ 1]   56 	jreq search_ln_loop
      00A533 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      00A537                         58 search_ln_loop:
      00A537 90 C3 00 1F      [ 2]   59 	cpw y,txtend 
      00A53B 2A 10            [ 1]   60 	jrpl 8$
      00A53D 90 F3            [ 1]   61 	cpw x,(y)
      00A53F 27 0E            [ 1]   62 	jreq 9$
      00A541 2B 0A            [ 1]   63 	jrmi 8$ 
      00A543 90 E6 02         [ 1]   64 	ld a,(2,y)
      00A546 6B 02            [ 1]   65 	ld (LB,sp),a 
      00A548 72 F9 01         [ 2]   66 	addw y,(LL,sp)
      00A54B 20 EA            [ 2]   67 	jra search_ln_loop 
      00A54D                         68 8$: 
      00A54D 5F               [ 1]   69 	clrw x 	
      00A54E 51               [ 1]   70 	exgw x,y 
      000027                         71 9$: _drop VSIZE
      00A54F 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A551 51               [ 1]   72 	exgw x,y   
      00A552 81               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      00A553                         83 del_line: 
      00002B                         84 	_vars VSIZE 
      00A553 52 04            [ 2]    1     sub sp,#VSIZE 
      00A555 E6 02            [ 1]   85 	ld a,(2,x) ; line length
      00A557 6B 02            [ 1]   86 	ld (LLEN+1,sp),a 
      00A559 0F 01            [ 1]   87 	clr (LLEN,sp)
      00A55B 90 93            [ 1]   88 	ldw y,x  
      00A55D 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      00A560 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      00A562 90 CE 00 1F      [ 2]   91 	ldw y,txtend 
      00A566 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      00A569 90 CF 00 0D      [ 2]   93 	ldw acc16,y 
      00A56D 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      00A56F CD 84 46         [ 4]   95 	call move
      00A572 90 CE 00 1F      [ 2]   96 	ldw y,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      00A576 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      00A579 90 CF 00 1F      [ 2]   98 	ldw txtend,y  
      000055                         99 	_drop VSIZE     
      00A57D 5B 04            [ 2]    1     addw sp,#VSIZE 
      00A57F 81               [ 4]  100 	ret 
                                    101 
                                    102 ;---------------------------------------------
                                    103 ; create a gap in text area to 
                                    104 ; move new line in this gap
                                    105 ; input:
                                    106 ;    X 			addr gap start 
                                    107 ;    Y 			gap length 
                                    108 ; output:
                                    109 ;    X 			addr gap start 
                                    110 ;--------------------------------------------
                           000001   111 	DEST=1
                           000003   112 	SRC=3
                           000005   113 	LEN=5
                           000006   114 	VSIZE=6 
      00A580                        115 create_gap:
      000058                        116 	_vars VSIZE
      00A580 52 06            [ 2]    1     sub sp,#VSIZE 
      00A582 1F 03            [ 2]  117 	ldw (SRC,sp),x 
      00A584 17 05            [ 2]  118 	ldw (LEN,sp),y 
      00A586 90 CF 00 0D      [ 2]  119 	ldw acc16,y 
      00A58A 90 93            [ 1]  120 	ldw y,x ; SRC
      00A58C 72 BB 00 0D      [ 2]  121 	addw x,acc16  
      00A590 1F 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      00A592 CE 00 1F         [ 2]  124 	ldw x,txtend 
      00A595 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      00A598 CF 00 0D         [ 2]  126 	ldw acc16,x ; size to move
      00A59B 1E 01            [ 2]  127 	ldw x,(DEST,sp) 
      00A59D CD 84 46         [ 4]  128 	call move
      00A5A0 CE 00 1F         [ 2]  129 	ldw x,txtend
      00A5A3 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      00A5A6 CF 00 1F         [ 2]  131 	ldw txtend,x
      000081                        132 9$:	_drop VSIZE 
      00A5A9 5B 06            [ 2]    1     addw sp,#VSIZE 
      00A5AB 81               [ 4]  133 	ret 
                                    134 
                                    135 ;--------------------------------------------
                                    136 ; insert line in pad into text area 
                                    137 ; first search for already existing 
                                    138 ; replace existing 
                                    139 ; if new line empty delete existing one. 
                                    140 ; input:
                                    141 ;   ptr16		pointer to tokenized line  
                                    142 ; output:
                                    143 ;   none
                                    144 ;---------------------------------------------
                           000001   145 	DEST=1  ; text area insertion address 
                           000003   146 	SRC=3   ; str to insert address 
                           000005   147 	LINENO=5 ; line number 
                           000007   148 	LLEN=7 ; line length 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000008   149 	VSIZE=8  
      00A5AC                        150 insert_line:
      000084                        151 	_vars VSIZE 
      00A5AC 52 08            [ 2]    1     sub sp,#VSIZE 
      00A5AE CE 00 1F         [ 2]  152 	ldw x,txtend  
      00A5B1 C3 00 1D         [ 2]  153 	cpw x,txtbgn 
      00A5B4 26 19            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      00A5B6 AE 00 02         [ 2]  156 	ldw x,#2 
      00A5B9 72 D6 00 18      [ 4]  157 	ld a,([ptr16],x)
      00A5BD A1 03            [ 1]  158 	cp a,#3
      00A5BF 27 5A            [ 1]  159 	jreq insert_ln_exit
      00A5C1 5F               [ 1]  160 	clrw x 
      00A5C2 97               [ 1]  161 	ld xl,a
      00A5C3 1F 07            [ 2]  162 	ldw (LLEN,sp),x 
      00A5C5 CE 00 1D         [ 2]  163 	ldw x,txtbgn
      00A5C8 1F 01            [ 2]  164 	ldw (DEST,sp),x 
      00A5CA CE 00 1F         [ 2]  165 	ldw x,txtend 
      00A5CD 20 38            [ 2]  166 	jra 4$
      00A5CF 72 CE 00 18      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      00A5D3 1F 05            [ 2]  169 	ldw (LINENO,sp),x 
      00A5D5 AE 00 02         [ 2]  170 	ldw x,#2 
      00A5D8 72 D6 00 18      [ 4]  171 	ld a,([ptr16],x)
      00A5DC 97               [ 1]  172 	ld xl,a
                                    173 ; line length
      00A5DD 1F 07            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      00A5DF 1E 05            [ 2]  176 	ldw x,(LINENO,sp)
      00A5E1 4F               [ 1]  177 	clr a 
      00A5E2 CD A5 28         [ 4]  178 	call search_lineno 
      00A5E5 5D               [ 2]  179 	tnzw x 
      00A5E6 26 04            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      00A5E8 17 01            [ 2]  183 	ldw (DEST,sp),y 
      00A5EA 20 05            [ 2]  184 	jra 3$
                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      00A5EC 1F 01            [ 2]  187 2$: ldw (DEST,sp),x 
      00A5EE CD A5 53         [ 4]  188 	call del_line
      00A5F1                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      00A5F1 A6 03            [ 1]  192 	ld a,#3
      00A5F3 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      00A5F5 27 24            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      00A5F7 1E 01            [ 2]  197 	ldw x,(DEST,sp)
      00A5F9 C3 00 1F         [ 2]  198 	cpw x,txtend 
      00A5FC 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      00A5FE 1E 01            [ 2]  202 	ldw x,(DEST,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      00A600 16 07            [ 2]  203 	ldw y,(LLEN,sp)
      00A602 CD A5 80         [ 4]  204 	call create_gap
      00A605 20 06            [ 2]  205 	jra 5$
      00A607                        206 4$: 
      00A607 72 FB 07         [ 2]  207 	addw x,(LLEN,sp)
      00A60A CF 00 1F         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      00A60D 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      00A60F CF 00 0D         [ 2]  211 	ldw acc16,x 
      00A612 90 AE 16 E0      [ 2]  212 	ldw y,#pad ;SRC 
      00A616 1E 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      00A618 CD 84 46         [ 4]  214 	call move 
      00A61B                        215 insert_ln_exit:	
      0000F3                        216 	_drop VSIZE
      00A61B 5B 08            [ 2]    1     addw sp,#VSIZE 
      00A61D 81               [ 4]  217 	ret
                                    218 
                                    219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    220 ;; compiler routines        ;;
                                    221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    222 ;------------------------------------
                                    223 ; parse quoted string 
                                    224 ; input:
                                    225 ;   Y 	pointer to tib 
                                    226 ;   X   pointer to output buffer 
                                    227 ; output:
                                    228 ;	buffer   parsed string
                                    229 ;------------------------------------
                           000001   230 	PREV = 1
                           000002   231 	CURR =2
                           000002   232 	VSIZE=2
      00A61E                        233 parse_quote: 
      0000F6                        234 	_vars VSIZE 
      00A61E 52 02            [ 2]    1     sub sp,#VSIZE 
      00A620 4F               [ 1]  235 	clr a
      00A621 6B 01            [ 1]  236 1$:	ld (PREV,sp),a 
      00A623                        237 2$:	
      00A623 91 D6 01         [ 4]  238 	ld a,([in.w],y)
      00A626 27 24            [ 1]  239 	jreq 6$
      00A628 72 5C 00 02      [ 1]  240 	inc in 
      00A62C 6B 02            [ 1]  241 	ld (CURR,sp),a 
      00A62E A6 5C            [ 1]  242 	ld a,#'\
      00A630 11 01            [ 1]  243 	cp a, (PREV,sp)
      00A632 26 0A            [ 1]  244 	jrne 3$
      00A634 0F 01            [ 1]  245 	clr (PREV,sp)
      00A636 7B 02            [ 1]  246 	ld a,(CURR,sp)
      00A638 AD 1C            [ 4]  247 	callr convert_escape
      00A63A F7               [ 1]  248 	ld (x),a 
      00A63B 5C               [ 1]  249 	incw x 
      00A63C 20 E5            [ 2]  250 	jra 2$
      00A63E                        251 3$:
      00A63E 7B 02            [ 1]  252 	ld a,(CURR,sp)
      00A640 A1 5C            [ 1]  253 	cp a,#'\'
      00A642 27 DD            [ 1]  254 	jreq 1$
      00A644 A1 22            [ 1]  255 	cp a,#'"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      00A646 27 04            [ 1]  256 	jreq 6$ 
      00A648 F7               [ 1]  257 	ld (x),a 
      00A649 5C               [ 1]  258 	incw x 
      00A64A 20 D7            [ 2]  259 	jra 2$
      00A64C                        260 6$:
      00A64C 7F               [ 1]  261 	clr (x)
      00A64D 5C               [ 1]  262 	incw x 
      00A64E 90 93            [ 1]  263 	ldw y,x 
      00A650 5F               [ 1]  264 	clrw x 
      00A651 A6 02            [ 1]  265 	ld a,#TK_QSTR  
      00012B                        266 	_drop VSIZE
      00A653 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A655 81               [ 4]  267 	ret 
                                    268 
                                    269 ;---------------------------------------
                                    270 ; called by parse_quote
                                    271 ; subtitute escaped character 
                                    272 ; by their ASCII value .
                                    273 ; input:
                                    274 ;   A  character following '\'
                                    275 ; output:
                                    276 ;   A  substitued char or same if not valid.
                                    277 ;---------------------------------------
      00A656                        278 convert_escape:
      00A656 89               [ 2]  279 	pushw x 
      00A657 AE A6 6B         [ 2]  280 	ldw x,#escaped 
      00A65A F1               [ 1]  281 1$:	cp a,(x)
      00A65B 27 06            [ 1]  282 	jreq 2$
      00A65D 7D               [ 1]  283 	tnz (x)
      00A65E 27 09            [ 1]  284 	jreq 3$
      00A660 5C               [ 1]  285 	incw x 
      00A661 20 F7            [ 2]  286 	jra 1$
      00A663 1D A6 6B         [ 2]  287 2$: subw x,#escaped 
      00A666 9F               [ 1]  288 	ld a,xl 
      00A667 AB 07            [ 1]  289 	add a,#7
      00A669 85               [ 2]  290 3$:	popw x 
      00A66A 81               [ 4]  291 	ret 
                                    292 
      00A66B 61 62 74 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
             00
                                    294 
                                    295 ;-------------------------
                                    296 ; integer parser 
                                    297 ; input:
                                    298 ;   X 		point to output buffer  
                                    299 ;   Y 		point to tib 
                                    300 ;   A 	    first digit|'$' 
                                    301 ; output:  
                                    302 ;   X 		integer 
                                    303 ;   A 		TK_INTGR
                                    304 ;   acc24   24 bits integer 
                                    305 ;-------------------------
                           000001   306 	BASE=1
                           000002   307 	TCHAR=2 
                           000003   308 	XSAVE=3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                           000004   309 	VSIZE=4 
      00A673                        310 parse_integer: ; { -- n }
      00A673 89               [ 2]  311 	pushw x 	
      00A674 4B 00            [ 1]  312 	push #0 ; TCHAR
      00A676 4B 0A            [ 1]  313 	push #10 ; BASE=10
      00A678 A1 24            [ 1]  314 	cp a,#'$
      00A67A 26 04            [ 1]  315 	jrne 2$ 
      000154                        316     _drop #1
      00A67C 5B 01            [ 2]    1     addw sp,##1 
      00A67E 4B 10            [ 1]  317 	push #16  ; BASE=16
      00A680 F7               [ 1]  318 2$:	ld (x),a 
      00A681 5C               [ 1]  319 	incw x 
      00A682 91 D6 01         [ 4]  320 	ld a,([in.w],y)
      00A685 72 5C 00 02      [ 1]  321 	inc in 
      00A689 CD 89 F8         [ 4]  322 	call to_upper 
      00A68C 6B 02            [ 1]  323 	ld (TCHAR,sp),a 
      00A68E CD 84 A7         [ 4]  324 	call is_digit 
      00A691 25 ED            [ 1]  325 	jrc 2$
      00A693 A6 10            [ 1]  326 	ld a,#16 
      00A695 11 01            [ 1]  327 	cp a,(BASE,sp)
      00A697 26 0A            [ 1]  328 	jrne 3$ 
      00A699 7B 02            [ 1]  329 	ld a,(TCHAR,sp)
      00A69B A1 41            [ 1]  330 	cp a,#'A 
      00A69D 2B 04            [ 1]  331 	jrmi 3$ 
      00A69F A1 47            [ 1]  332 	cp a,#'G 
      00A6A1 2B DD            [ 1]  333 	jrmi 2$ 
      00A6A3 72 5A 00 02      [ 1]  334 3$: dec in 	
      00A6A7 7F               [ 1]  335     clr (x)
      00A6A8 1E 03            [ 2]  336 	ldw x,(XSAVE,sp)
      00A6AA CD 8A 04         [ 4]  337 	call atoi24
      00A6AD 90 93            [ 1]  338 	ldw y,x 
      00A6AF CE 00 0D         [ 2]  339 	ldw x,acc16 
      00A6B2 A6 84            [ 1]  340 	ld a,#TK_INTGR
      00A6B4 90 FF            [ 2]  341 	ldw (y),x 
      00A6B6 72 A9 00 02      [ 2]  342 	addw y,#2
      000192                        343 	_drop VSIZE  
      00A6BA 5B 04            [ 2]    1     addw sp,#VSIZE 
      00A6BC 81               [ 4]  344 	ret 	
                                    345 
                                    346 ;-------------------------
                                    347 ; binary integer parser
                                    348 ; build integer in acc24  
                                    349 ; input:
                                    350 ;   X 		point to output buffer  
                                    351 ;   Y 		point to tib 
                                    352 ;   A 	    '&' 
                                    353 ; output:  
                                    354 ;   buffer  TK_INTGR integer  
                                    355 ;   X 		int16 
                                    356 ;   A 		TK_INTGR
                                    357 ;   acc24    int24 
                                    358 ;-------------------------
                           000001   359 	BINARY=1 ; 24 bits integer 
                           000003   360 	VSIZE=3
      00A6BD                        361 parse_binary: ; { -- n }
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      00A6BD 4B 00            [ 1]  362 	push #0
      00A6BF 4B 00            [ 1]  363 	push #0
      00A6C1 4B 00            [ 1]  364 	push #0
      00A6C3                        365 2$:	
      00A6C3 91 D6 01         [ 4]  366 	ld a,([in.w],y)
      00A6C6 72 5C 00 02      [ 1]  367 	inc in 
      00A6CA A1 30            [ 1]  368 	cp a,#'0 
      00A6CC 27 06            [ 1]  369 	jreq 3$
      00A6CE A1 31            [ 1]  370 	cp a,#'1 
      00A6D0 27 02            [ 1]  371 	jreq 3$ 
      00A6D2 20 0B            [ 2]  372 	jra bin_exit 
      00A6D4 A0 30            [ 1]  373 3$: sub a,#'0 
      00A6D6 46               [ 1]  374 	rrc a
      00A6D7 09 03            [ 1]  375 	rlc (BINARY+2,sp) 
      00A6D9 09 02            [ 1]  376 	rlc (BINARY+1,sp)
      00A6DB 09 01            [ 1]  377 	rlc (BINARY,sp) 
      00A6DD 20 E4            [ 2]  378 	jra 2$  
      00A6DF                        379 bin_exit:
      00A6DF 72 5A 00 02      [ 1]  380 	dec in 
      00A6E3 90 93            [ 1]  381 	ldw y,x
      00A6E5 7B 01            [ 1]  382 	ld a,(BINARY,sp)
      00A6E7 C7 00 0C         [ 1]  383 	ld acc24,a 
      00A6EA 1E 02            [ 2]  384 	ldw x,(BINARY+1,sp)
      00A6EC CF 00 0D         [ 2]  385 	ldw acc16,x
      00A6EF 90 FF            [ 2]  386 	ldw (y),x 
      00A6F1 72 A9 00 02      [ 2]  387 	addw y,#2  
      00A6F5 A6 84            [ 1]  388 	ld a,#TK_INTGR 	
      0001CF                        389 	_drop VSIZE 
      00A6F7 5B 03            [ 2]    1     addw sp,#VSIZE 
      00A6F9 81               [ 4]  390 	ret
                                    391 
                                    392 ;---------------------------
                                    393 ;  token begin with a letter,
                                    394 ;  is keyword or variable. 	
                                    395 ; input:
                                    396 ;   X 		point to pad 
                                    397 ;   Y 		point to text
                                    398 ;   A 	    first letter  
                                    399 ; output:
                                    400 ;   X		exec_addr|var_addr 
                                    401 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                    402 ;   pad 	keyword|var_name  
                                    403 ;--------------------------  
                           000001   404 	XFIRST=1
                           000002   405 	VSIZE=2
      00A6FA                        406 parse_keyword: 
      00A6FA 89               [ 2]  407 	pushw x 
      00A6FB                        408 kw_loop:	
      00A6FB CD 89 F8         [ 4]  409 	call to_upper 
      00A6FE F7               [ 1]  410 	ld (x),a 
      00A6FF 5C               [ 1]  411 	incw x 
      00A700 91 D6 01         [ 4]  412 	ld a,([in.w],y)
      00A703 72 5C 00 02      [ 1]  413 	inc in 
      00A707 CD 84 96         [ 4]  414 	call is_alpha 
      00A70A 25 EF            [ 1]  415 	jrc kw_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00A70C 72 5A 00 02      [ 1]  416 	dec in   
      00A710 7F               [ 1]  417 1$: clr (x)
      00A711 1E 01            [ 2]  418 	ldw x,(XFIRST,sp) 
      00A713 E6 01            [ 1]  419 	ld a,(1,x)
      00A715 26 13            [ 1]  420 	jrne 2$
                                    421 ; one letter variable name 
      00A717 F6               [ 1]  422 	ld a,(x) 
      00A718 A0 41            [ 1]  423 	sub a,#'A 
      00A71A 48               [ 1]  424 	sll a 
      00A71B 88               [ 1]  425 	push a 
      00A71C 4B 00            [ 1]  426 	push #0
      00A71E AE 00 30         [ 2]  427 	ldw x,#vars 
      00A721 72 FB 01         [ 2]  428 	addw x,(1,sp) ; X=var address 
      0001FC                        429 	_drop 2 
      00A724 5B 02            [ 2]    1     addw sp,#2 
      00A726 A6 85            [ 1]  430 	ld a,#TK_VAR 
      00A728 20 0E            [ 2]  431 	jra 4$ 
      00A72A                        432 2$: ; check for keyword, otherwise syntax error.
      000202                        433 	_ldx_dict kword_dict ; dictionary entry point
      00A72A AE A1 0E         [ 2]    1     ldw x,#kword_dict+2
      00A72D 16 01            [ 2]  434 	ldw y,(XFIRST,sp) ; name to search for
      00A72F CD 8B EB         [ 4]  435 	call search_dict
      00A732 4D               [ 1]  436 	tnz a
      00A733 26 03            [ 1]  437 	jrne 4$ 
      00A735 CC 87 A0         [ 2]  438 	jp syntax_error
      00A738                        439 4$:	
      00A738 16 01            [ 2]  440 	ldw y,(XFIRST,sp)
      00A73A 90 F7            [ 1]  441 	ld (y),a 
      00A73C 90 5C            [ 1]  442 	incw y 
      00A73E 90 FF            [ 2]  443 	ldw (y),x
      00A740 72 A9 00 02      [ 2]  444 	addw y,#2  
      00021C                        445 5$:	_drop VSIZE 
      00A744 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A746 81               [ 4]  446 	ret  	
                                    447 
                                    448 ;------------------------------------
                                    449 ; skip character c in text starting from 'in'
                                    450 ; input:
                                    451 ;	 y 		point to text buffer
                                    452 ;    a 		character to skip
                                    453 ; output:  
                                    454 ;	'in' ajusted to new position
                                    455 ;------------------------------------
                           000001   456 	C = 1 ; local var
      00A747                        457 skip:
      00A747 88               [ 1]  458 	push a
      00A748 91 D6 01         [ 4]  459 1$:	ld a,([in.w],y)
      00A74B 27 0A            [ 1]  460 	jreq 2$
      00A74D 11 01            [ 1]  461 	cp a,(C,sp)
      00A74F 26 06            [ 1]  462 	jrne 2$
      00A751 72 5C 00 02      [ 1]  463 	inc in
      00A755 20 F1            [ 2]  464 	jra 1$
      00022F                        465 2$: _drop 1 
      00A757 5B 01            [ 2]    1     addw sp,#1 
      00A759 81               [ 4]  466 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    467 	
                                    468 
                                    469 ;------------------------------------
                                    470 ; scan text for next token
                                    471 ; input: 
                                    472 ;	X 		pointer to buffer where 
                                    473 ;	        token id and value are copied 
                                    474 ; use:
                                    475 ;	Y   pointer to text in tib 
                                    476 ; output:
                                    477 ;   A       token attribute 
                                    478 ;   X 		token value
                                    479 ;   Y       updated position in output buffer   
                                    480 ;------------------------------------
                                    481 	; use to check special character 
                                    482 	.macro _case c t  
                                    483 	ld a,#c 
                                    484 	cp a,(TCHAR,sp) 
                                    485 	jrne t
                                    486 	.endm 
                                    487 
                           000001   488 	TCHAR=1
                           000002   489 	ATTRIB=2
                           000002   490 	VSIZE=2
      00A75A                        491 get_token:: 
      000232                        492 	_vars VSIZE
      00A75A 52 02            [ 2]    1     sub sp,#VSIZE 
                                    493 ;	ld a,in 
                                    494 ;	sub a,count
                                    495 ;   jrmi 0$
                                    496 ;	clr a 
                                    497 ;	ret 
      00A75C                        498 0$: 
      00A75C 90 AE 16 90      [ 2]  499 	ldw y,#tib    	
      00A760 A6 20            [ 1]  500 	ld a,#SPACE
      00A762 CD A7 47         [ 4]  501 	call skip
      00A765 55 00 02 00 03   [ 1]  502 	mov in.saved,in 
      00A76A 91 D6 01         [ 4]  503 	ld a,([in.w],y)
      00A76D 26 05            [ 1]  504 	jrne 1$
      00A76F 90 93            [ 1]  505 	ldw y,x 
      00A771 CC A9 16         [ 2]  506 	jp token_exit ; end of line 
      00A774 72 5C 00 02      [ 1]  507 1$:	inc in 
      00A778 CD 89 F8         [ 4]  508 	call to_upper 
      00A77B 6B 01            [ 1]  509 	ld (TCHAR,sp),a 
                                    510 ; check for quoted string
      00A77D                        511 str_tst:  	
      000255                        512 	_case '"' nbr_tst
      00A77D A6 22            [ 1]    1 	ld a,#'"' 
      00A77F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A781 26 0A            [ 1]    3 	jrne nbr_tst
      00A783 A6 02            [ 1]  513 	ld a,#TK_QSTR
      00A785 F7               [ 1]  514 	ld (x),a 
      00A786 5C               [ 1]  515 	incw x 
      00A787 CD A6 1E         [ 4]  516 	call parse_quote
      00A78A CC A9 16         [ 2]  517 	jp token_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      00A78D                        518 nbr_tst:
                                    519 ; check for hexadecimal number 
      00A78D A6 24            [ 1]  520 	ld a,#'$'
      00A78F 11 01            [ 1]  521 	cp a,(TCHAR,sp) 
      00A791 27 17            [ 1]  522 	jreq 1$
                                    523 ;check for binary number 
      00A793 A6 26            [ 1]  524 	ld a,#'&
      00A795 11 01            [ 1]  525 	cp a,(TCHAR,sp)
      00A797 26 0A            [ 1]  526 	jrne 0$
      00A799 A6 84            [ 1]  527 	ld a,#TK_INTGR
      00A79B F7               [ 1]  528 	ld (x),a 
      00A79C 5C               [ 1]  529 	incw x 
      00A79D CD A6 BD         [ 4]  530 	call parse_binary ; expect binary integer 
      00A7A0 CC A9 16         [ 2]  531 	jp token_exit 
                                    532 ; check for decimal number 	
      00A7A3 7B 01            [ 1]  533 0$:	ld a,(TCHAR,sp)
      00A7A5 CD 84 A7         [ 4]  534 	call is_digit
      00A7A8 24 0C            [ 1]  535 	jrnc 3$
      00A7AA A6 84            [ 1]  536 1$:	ld a,#TK_INTGR 
      00A7AC F7               [ 1]  537 	ld (x),a 
      00A7AD 5C               [ 1]  538 	incw x 
      00A7AE 7B 01            [ 1]  539 	ld a,(TCHAR,sp)
      00A7B0 CD A6 73         [ 4]  540 	call parse_integer 
      00A7B3 CC A9 16         [ 2]  541 	jp token_exit 
      00A7B6                        542 3$: 
      00028E                        543 	_case '(' bkslsh_tst 
      00A7B6 A6 28            [ 1]    1 	ld a,#'(' 
      00A7B8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A7BA 26 05            [ 1]    3 	jrne bkslsh_tst
      00A7BC A6 07            [ 1]  544 	ld a,#TK_LPAREN
      00A7BE CC A9 12         [ 2]  545 	jp token_char   	
      00A7C1                        546 bkslsh_tst: ; character token 
      000299                        547 	_case '\',rparnt_tst
      00A7C1 A6 5C            [ 1]    1 	ld a,#'\' 
      00A7C3 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A7C5 26 16            [ 1]    3 	jrne rparnt_tst
      00A7C7 A6 03            [ 1]  548 	ld a,#TK_CHAR 
      00A7C9 F7               [ 1]  549 	ld (x),a 
      00A7CA 5C               [ 1]  550 	incw x 
      00A7CB 91 D6 01         [ 4]  551 	ld a,([in.w],y)
      00A7CE F7               [ 1]  552 	ld (x),a 
      00A7CF 5C               [ 1]  553 	incw x
      00A7D0 90 93            [ 1]  554 	ldw y,x 	 
      00A7D2 72 5C 00 02      [ 1]  555 	inc in  
      00A7D6 5F               [ 1]  556 	clrw x 
      00A7D7 97               [ 1]  557 	ld xl,a 
      00A7D8 A6 03            [ 1]  558 	ld a,#TK_CHAR 
      00A7DA CC A9 16         [ 2]  559 	jp token_exit 
      00A7DD                        560 rparnt_tst:		
      0002B5                        561 	_case ')' colon_tst 
      00A7DD A6 29            [ 1]    1 	ld a,#')' 
      00A7DF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A7E1 26 05            [ 1]    3 	jrne colon_tst
      00A7E3 A6 08            [ 1]  562 	ld a,#TK_RPAREN 
      00A7E5 CC A9 12         [ 2]  563 	jp token_char
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      00A7E8                        564 colon_tst:
      0002C0                        565 	_case ':' comma_tst 
      00A7E8 A6 3A            [ 1]    1 	ld a,#':' 
      00A7EA 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A7EC 26 05            [ 1]    3 	jrne comma_tst
      00A7EE A6 0B            [ 1]  566 	ld a,#TK_COLON 
      00A7F0 CC A9 12         [ 2]  567 	jp token_char  
      00A7F3                        568 comma_tst:
      0002CB                        569 	_case COMMA sharp_tst 
      00A7F3 A6 2C            [ 1]    1 	ld a,#COMMA 
      00A7F5 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A7F7 26 05            [ 1]    3 	jrne sharp_tst
      00A7F9 A6 09            [ 1]  570 	ld a,#TK_COMMA
      00A7FB CC A9 12         [ 2]  571 	jp token_char
      00A7FE                        572 sharp_tst:
      0002D6                        573 	_case SHARP dash_tst 
      00A7FE A6 23            [ 1]    1 	ld a,#SHARP 
      00A800 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A802 26 05            [ 1]    3 	jrne dash_tst
      00A804 A6 0A            [ 1]  574 	ld a,#TK_SHARP
      00A806 CC A9 12         [ 2]  575 	jp token_char  	 	 
      00A809                        576 dash_tst: 	
      0002E1                        577 	_case '-' at_tst 
      00A809 A6 2D            [ 1]    1 	ld a,#'-' 
      00A80B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A80D 26 05            [ 1]    3 	jrne at_tst
      00A80F A6 11            [ 1]  578 	ld a,#TK_MINUS  
      00A811 CC A9 12         [ 2]  579 	jp token_char 
      00A814                        580 at_tst:
      0002EC                        581 	_case '@' qmark_tst 
      00A814 A6 40            [ 1]    1 	ld a,#'@' 
      00A816 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A818 26 05            [ 1]    3 	jrne qmark_tst
      00A81A A6 06            [ 1]  582 	ld a,#TK_ARRAY 
      00A81C CC A9 12         [ 2]  583 	jp token_char
      00A81F                        584 qmark_tst:
      0002F7                        585 	_case '?' tick_tst 
      00A81F A6 3F            [ 1]    1 	ld a,#'?' 
      00A821 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A823 26 12            [ 1]    3 	jrne tick_tst
      00A825 A6 80            [ 1]  586 	ld a,#TK_CMD  
      00A827 F7               [ 1]  587 	ld (x),a 
      00A828 5C               [ 1]  588 	incw x 
      00A829 90 93            [ 1]  589 	ldw y,x 
      00A82B AE 00 74         [ 2]  590 	ldw x,#PRT_IDX 
      00A82E 90 FF            [ 2]  591 	ldw (y),x 
      00A830 72 A9 00 02      [ 2]  592 	addw y,#2
      00A834 CC A9 16         [ 2]  593 	jp token_exit
      00A837                        594 tick_tst: ; comment 
      00030F                        595 	_case TICK plus_tst 
      00A837 A6 27            [ 1]    1 	ld a,#TICK 
      00A839 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A83B 26 35            [ 1]    3 	jrne plus_tst
      00A83D A6 80            [ 1]  596 	ld a,#TK_CMD
      00A83F F7               [ 1]  597 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      00A840 5C               [ 1]  598 	incw x
      00A841 90 AE 00 8E      [ 2]  599 	ldw y,#REM_IDX
      00A845 FF               [ 2]  600 	ldw (x),y 
      00A846 1C 00 02         [ 2]  601 	addw x,#2  
      00A849                        602 copy_comment:
      00A849 90 AE 16 90      [ 2]  603 	ldw y,#tib 
      00A84D 72 B9 00 01      [ 2]  604 	addw y,in.w
      00A851 90 89            [ 2]  605 	pushw y
      00A853 CD 84 38         [ 4]  606 	call strcpy
      00A856 72 F2 01         [ 2]  607     subw y,(1,sp)
      00A859 90 9F            [ 1]  608 	ld a,yl 
      00A85B CB 00 02         [ 1]  609 	add a,in
      00A85E C7 00 02         [ 1]  610 	ld in,a 
      00A861 1F 01            [ 2]  611 	ldw (1,sp),x
      00A863 72 F9 01         [ 2]  612 	addw y,(1,sp)
      00A866 90 5C            [ 1]  613 	incw y 
      000340                        614 	_drop 2 
      00A868 5B 02            [ 2]    1     addw sp,#2 
      00A86A AE 00 8E         [ 2]  615 	ldw x,#REM_IDX 
      00A86D A6 80            [ 1]  616 	ld a,#TK_CMD 
      00A86F CC A9 16         [ 2]  617 	jp token_exit 
      00A872                        618 plus_tst:
      00034A                        619 	_case '+' star_tst 
      00A872 A6 2B            [ 1]    1 	ld a,#'+' 
      00A874 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A876 26 05            [ 1]    3 	jrne star_tst
      00A878 A6 10            [ 1]  620 	ld a,#TK_PLUS  
      00A87A CC A9 12         [ 2]  621 	jp token_char 
      00A87D                        622 star_tst:
      000355                        623 	_case '*' slash_tst 
      00A87D A6 2A            [ 1]    1 	ld a,#'*' 
      00A87F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A881 26 05            [ 1]    3 	jrne slash_tst
      00A883 A6 20            [ 1]  624 	ld a,#TK_MULT 
      00A885 CC A9 12         [ 2]  625 	jp token_char 
      00A888                        626 slash_tst: 
      000360                        627 	_case '/' prcnt_tst 
      00A888 A6 2F            [ 1]    1 	ld a,#'/' 
      00A88A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A88C 26 05            [ 1]    3 	jrne prcnt_tst
      00A88E A6 21            [ 1]  628 	ld a,#TK_DIV 
      00A890 CC A9 12         [ 2]  629 	jp token_char 
      00A893                        630 prcnt_tst:
      00036B                        631 	_case '%' eql_tst 
      00A893 A6 25            [ 1]    1 	ld a,#'%' 
      00A895 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A897 26 05            [ 1]    3 	jrne eql_tst
      00A899 A6 22            [ 1]  632 	ld a,#TK_MOD
      00A89B CC A9 12         [ 2]  633 	jp token_char  
                                    634 ; 1 or 2 character tokens 	
      00A89E                        635 eql_tst:
      000376                        636 	_case '=' gt_tst 		
      00A89E A6 3D            [ 1]    1 	ld a,#'=' 
      00A8A0 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A8A2 26 05            [ 1]    3 	jrne gt_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00A8A4 A6 32            [ 1]  637 	ld a,#TK_EQUAL
      00A8A6 CC A9 12         [ 2]  638 	jp token_char 
      00A8A9                        639 gt_tst:
      000381                        640 	_case '>' lt_tst 
      00A8A9 A6 3E            [ 1]    1 	ld a,#'>' 
      00A8AB 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A8AD 26 23            [ 1]    3 	jrne lt_tst
      00A8AF A6 31            [ 1]  641 	ld a,#TK_GT 
      00A8B1 6B 02            [ 1]  642 	ld (ATTRIB,sp),a 
      00A8B3 91 D6 01         [ 4]  643 	ld a,([in.w],y)
      00A8B6 72 5C 00 02      [ 1]  644 	inc in 
      00A8BA A1 3D            [ 1]  645 	cp a,#'=
      00A8BC 26 04            [ 1]  646 	jrne 1$
      00A8BE A6 33            [ 1]  647 	ld a,#TK_GE 
      00A8C0 20 50            [ 2]  648 	jra token_char  
      00A8C2 A1 3C            [ 1]  649 1$: cp a,#'<
      00A8C4 26 04            [ 1]  650 	jrne 2$
      00A8C6 A6 35            [ 1]  651 	ld a,#TK_NE 
      00A8C8 20 48            [ 2]  652 	jra token_char 
      00A8CA 72 5A 00 02      [ 1]  653 2$: dec in
      00A8CE 7B 02            [ 1]  654 	ld a,(ATTRIB,sp)
      00A8D0 20 40            [ 2]  655 	jra token_char 	 
      00A8D2                        656 lt_tst:
      0003AA                        657 	_case '<' other
      00A8D2 A6 3C            [ 1]    1 	ld a,#'<' 
      00A8D4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A8D6 26 23            [ 1]    3 	jrne other
      00A8D8 A6 34            [ 1]  658 	ld a,#TK_LT 
      00A8DA 6B 02            [ 1]  659 	ld (ATTRIB,sp),a 
      00A8DC 91 D6 01         [ 4]  660 	ld a,([in.w],y)
      00A8DF 72 5C 00 02      [ 1]  661 	inc in 
      00A8E3 A1 3D            [ 1]  662 	cp a,#'=
      00A8E5 26 04            [ 1]  663 	jrne 1$
      00A8E7 A6 36            [ 1]  664 	ld a,#TK_LE 
      00A8E9 20 27            [ 2]  665 	jra token_char 
      00A8EB A1 3E            [ 1]  666 1$: cp a,#'>
      00A8ED 26 04            [ 1]  667 	jrne 2$
      00A8EF A6 35            [ 1]  668 	ld a,#TK_NE 
      00A8F1 20 1F            [ 2]  669 	jra token_char 
      00A8F3 72 5A 00 02      [ 1]  670 2$: dec in 
      00A8F7 7B 02            [ 1]  671 	ld a,(ATTRIB,sp)
      00A8F9 20 17            [ 2]  672 	jra token_char 	
      00A8FB                        673 other: ; not a special character 	 
      00A8FB 7B 01            [ 1]  674 	ld a,(TCHAR,sp)
      00A8FD CD 84 96         [ 4]  675 	call is_alpha 
      00A900 25 03            [ 1]  676 	jrc 30$ 
      00A902 CC 87 A0         [ 2]  677 	jp syntax_error 
      00A905                        678 30$: 
      00A905 CD A6 FA         [ 4]  679 	call parse_keyword
      00A908 A3 90 1E         [ 2]  680 	cpw x,#remark 
      00A90B 26 09            [ 1]  681 	jrne token_exit 
      00A90D 90 93            [ 1]  682 	ldw y,x 
      00A90F CC A8 49         [ 2]  683 	jp copy_comment 
      00A912                        684 token_char:
      00A912 F7               [ 1]  685 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      00A913 5C               [ 1]  686 	incw x
      00A914 90 93            [ 1]  687 	ldw y,x 
      00A916                        688 token_exit:
      0003EE                        689 	_drop VSIZE 
      00A916 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A918 81               [ 4]  690 	ret
                                    691 
                                    692 
                                    693 ;-----------------------------------
                                    694 ; create token list fromm text line 
                                    695 ; save this list in pad buffer 
                                    696 ;  compiled line format: 
                                    697 ;    line_no  2 bytes {0...32767}
                                    698 ;    count    1 byte  
                                    699 ;    tokens   variable length 
                                    700 ;   
                                    701 ; input:
                                    702 ;   none
                                    703 ; modified variables:
                                    704 ;   basicptr     token list buffer address 
                                    705 ;   in.w  		 3|count, i.e. index in buffer
                                    706 ;   count        length of line | 0  
                                    707 ;-----------------------------------
                           000001   708 	XSAVE=1
                           000002   709 	VSIZE=2
      00A919                        710 compile::
      0003F1                        711 	_vars VSIZE 
      00A919 52 02            [ 2]    1     sub sp,#VSIZE 
      00A91B 55 00 1D 00 05   [ 1]  712 	mov basicptr,txtbgn
      00A920 72 1A 00 24      [ 1]  713 	bset flags,#FCOMP 
      00A924 A6 00            [ 1]  714 	ld a,#0
      00A926 AE 00 00         [ 2]  715 	ldw x,#0
      00A929 CF 16 E0         [ 2]  716 	ldw pad,x ; destination buffer 
      00A92C C7 16 E2         [ 1]  717 	ld pad+2,a ; count 
      00A92F AE 16 E3         [ 2]  718 	ldw x,#pad+3
      00A932 72 5F 00 02      [ 1]  719 	clr in 
      00A936 CD A7 5A         [ 4]  720 	call get_token
      00A939 A1 84            [ 1]  721 	cp a,#TK_INTGR
      00A93B 26 11            [ 1]  722 	jrne 2$
      00A93D A3 00 01         [ 2]  723 	cpw x,#1 
      00A940 2A 05            [ 1]  724 	jrpl 1$
      00A942 A6 0A            [ 1]  725 	ld a,#ERR_BAD_VALUE
      00A944 CC 87 A2         [ 2]  726 	jp tb_error
      00A947 CF 16 E0         [ 2]  727 1$:	ldw pad,x 
      00A94A 90 AE 16 E3      [ 2]  728 	ldw y,#pad+3 
      00A94E 90 A3 17 60      [ 2]  729 2$:	cpw y,#stack_full 
      00A952 25 05            [ 1]  730 	jrult 3$
      00A954 A6 0F            [ 1]  731 	ld a,#ERR_BUF_FULL 
      00A956 CC 87 A2         [ 2]  732 	jp tb_error 
      00A959                        733 3$:	
      00A959 93               [ 1]  734 	ldw x,y 
      00A95A CD A7 5A         [ 4]  735 	call get_token 
      00A95D A1 00            [ 1]  736 	cp a,#TK_NONE 
      00A95F 26 ED            [ 1]  737 	jrne 2$ 
                                    738 ; compilation completed  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00A961 72 A2 16 E0      [ 2]  739 	subw y,#pad
      00A965 90 9F            [ 1]  740     ld a,yl
      00A967 AE 16 E0         [ 2]  741 	ldw x,#pad 
      00A96A CF 00 18         [ 2]  742 	ldw ptr16,x 
      00A96D E7 02            [ 1]  743 	ld (2,x),a 
      00A96F FE               [ 2]  744 	ldw x,(x)
      00A970 27 09            [ 1]  745 	jreq 10$
      00A972 CD A5 AC         [ 4]  746 	call insert_line
      00A975 72 5F 00 04      [ 1]  747 	clr  count 
      00A979 20 0F            [ 2]  748 	jra  11$ 
      00A97B                        749 10$: ; line# is zero 
      00A97B CE 00 18         [ 2]  750 	ldw x,ptr16  
      00A97E CF 00 05         [ 2]  751 	ldw basicptr,x 
      00A981 E6 02            [ 1]  752 	ld a,(2,x)
      00A983 C7 00 04         [ 1]  753 	ld count,a 
      00A986 35 03 00 02      [ 1]  754 	mov in,#3 
      00A98A                        755 11$:
      000462                        756 	_drop VSIZE 
      00A98A 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A98C 72 1B 00 24      [ 1]  757 	bres flags,#FCOMP 
      00A990 81               [ 4]  758 	ret 
                                    759 
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
    TK_CHAR =  000003     |     TK_CMD  =  000080     |     TK_COLON=  00000B 
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
    acc16      ****** GX  |     acc24      ****** GX  |   1 at_tst     0002EC R
    atoi24     ****** GX  |     basicptr   ****** GX  |   1 bin_exit   0001B7 R
  1 bkslsh_t   000299 R   |   1 colon_ts   0002C0 R   |   1 comma_ts   0002CB R
  1 compile    0003F1 GR  |   1 convert_   00012E R   |   1 copy_com   000321 R
    count      ****** GX  |   1 create_g   000058 R   |   1 dash_tst   0002E1 R
  1 del_line   00002B R   |   1 eql_tst    000376 R   |   1 escaped    000143 GR
    flags      ****** GX  |   1 get_toke   000232 GR  |   1 gt_tst     000381 R
    in         ****** GX  |     in.saved   ****** GX  |     in.w       ****** GX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]

Symbol Table

  1 insert_l   000084 R   |   1 insert_l   0000F3 R   |     is_alpha   ****** GX
    is_digit   ****** GX  |   1 kw_loop    0001D3 R   |     kword_di   ****** GX
  1 lt_tst     0003AA R   |     move       ****** GX  |   1 nbr_tst    000265 R
  1 other      0003D3 R   |     pad        ****** GX  |   1 parse_bi   000195 R
  1 parse_in   00014B R   |   1 parse_ke   0001D2 R   |   1 parse_qu   0000F6 R
  1 plus_tst   00034A R   |   1 prcnt_ts   00036B R   |     ptr16      ****** GX
  1 qmark_ts   0002F7 R   |     remark     ****** GX  |   1 rparnt_t   0002B5 R
    search_d   ****** GX  |   1 search_l   000000 GR  |   1 search_l   00000F R
  1 sharp_ts   0002D6 R   |   1 skip       00021F R   |   1 slash_ts   000360 R
    stack_fu   ****** GX  |   1 star_tst   000355 R   |   1 str_tst    000255 R
    strcpy     ****** GX  |     syntax_e   ****** GX  |     tb_error   ****** GX
    tib        ****** GX  |   1 tick_tst   00030F R   |     to_upper   ****** GX
  1 token_ch   0003EA R   |   1 token_ex   0003EE R   |     txtbgn     ****** GX
    txtend     ****** GX  |     vars       ****** GX

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 CODE       size    469   flags    0

