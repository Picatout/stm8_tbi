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
      000001                         45 in.w::  .blkb 1 ; parser position in text line high-byte 
      000002                         46 in::    .blkb 1 ; low byte of in.w 
      000003                         47 in.saved:: .blkb 1 ; set by get_token before parsing next token, used by unget_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



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
      00001A                         64 txtbgn:: .blkw 1 ; tokenized BASIC text beginning address 
      00001C                         65 txtend:: .blkw 1 ; tokenized BASIC text end address 
      00001E                         66 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      00001F                         67 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000021                         68 flags:: .blkb 1 ; various boolean flags
      000022                         69 tab_width:: .blkb 1 ; print colon width (default 6)
      000023                         70 rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
      00002B                         71 rx1_head:  .blkb 1 ; rx1_queue head pointer
      00002C                         72 rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
                                     73 
      000031                         74 	.bndry 16 
      000031                         75 vars:: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     76 ; keep 'free_ram' as last variable 
      000065                         77 free_ram: ; from here RAM free for BASIC text 
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
      008000 82 00 84 EF             93     int cold_start			; RESET vector 
                           000000    94 .if DEBUG
                                     95 	int TrapHandler 		;TRAP  software interrupt
                           000001    96 .else
      008004 82 00 80 80             97 	int NonHandledInterrupt ;TRAP  software interrupt
                                     98 .endif
      008008 82 00 80 80             99 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 81            100 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            101 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            102 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008018 82 00 80 80            103 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80            104 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            105 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 D5            106 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
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
      008064 82 00 80 C0            122 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
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
                                    155 ;--------------------------
                                    156 ; UART1 receive character
                                    157 ; CTRL-C (ASCII 3)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    158 ; cancel program execution
                                    159 ; and fall back to command line
                                    160 ;--------------------------
      00808F                        161 Uart1RxHandler: ; console receive char 
      00808F 72 0B 52 30 2B   [ 2]  162 	btjf UART1_SR,#UART_SR_RXNE,5$
      008094 C6 52 31         [ 1]  163 	ld a,UART1_DR 
      008097 A1 03            [ 1]  164 	cp a,#CTRL_C 
      008099 26 06            [ 1]  165 	jrne 2$
      00809B CD 83 32         [ 4]  166 	call putc 
      00809E CC 80 E8         [ 2]  167 	jp user_interrupted
      0080A1                        168 2$:
      0080A1 A1 18            [ 1]  169 	cp a,#CAN ; CTRL_X 
      0080A3 26 03            [ 1]  170 	jrne 3$
      0080A5 CC 84 EF         [ 2]  171 	jp cold_start 	
      0080A8 AE 00 23         [ 2]  172 3$:	ldw x,#rx1_queue  
      0080AB 88               [ 1]  173 	push a 
      0080AC 9F               [ 1]  174 	ld a,xl 
      0080AD CB 00 2C         [ 1]  175 	add a,rx1_tail 
      0080B0 97               [ 1]  176 	ld xl,a
      0080B1 84               [ 1]  177 	pop a  
      0080B2 F7               [ 1]  178 	ld (x),a
      0080B3 72 5C 00 2C      [ 1]  179 	inc rx1_tail 
      0080B7 A6 07            [ 1]  180 	ld a,#RX_QUEUE_SIZE-1
      0080B9 C4 00 2C         [ 1]  181 	and a,rx1_tail 
      0080BC C7 00 2C         [ 1]  182 	ld rx1_tail,a  
      0080BF                        183 5$:
      0080BF 80               [11]  184 	iret 
                                    185 
                                    186 ;------------------------------------
                                    187 ; software interrupt handler  
                                    188 ;------------------------------------
                           000000   189 .if DEBUG 
                                    190 TrapHandler:
                                    191 	bset flags,#FTRAP 
                                    192 	call print_registers
                                    193 	call cmd_itf
                                    194 	bres flags,#FTRAP 	
                                    195 	iret
                                    196 .endif 
                                    197 
                                    198 ;------------------------------
                                    199 ; TIMER 4 is used to maintain 
                                    200 ; a milliseconds 'ticks' counter
                                    201 ; and decrement 'timer' varaiable
                                    202 ;--------------------------------
      0080C0                        203 Timer4UpdateHandler:
      0080C0 72 5F 53 42      [ 1]  204 	clr TIM4_SR 
      0080C4 CE 00 0F         [ 2]  205 	ldw x,ticks
      0080C7 5C               [ 1]  206 	incw x
      0080C8 CF 00 0F         [ 2]  207 	ldw ticks,x 
      0080CB CE 00 11         [ 2]  208 	ldw x,timer
                                    209 ;	tnzw x 
      0080CE 27 04            [ 1]  210 	jreq 1$
      0080D0 5A               [ 2]  211 	decw x 
      0080D1 CF 00 11         [ 2]  212 	ldw timer,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080D4                        213 1$:	
      0080D4 80               [11]  214 	iret 
                                    215 
                                    216 
                                    217 ;------------------------------------
                                    218 ; Triggered by pressing USER UserButton 
                                    219 ; on NUCLEO card.
                                    220 ; This is used to abort a progam lock 
                                    221 ; in infinite loop. 
                                    222 ;------------------------------------
      0080D5                        223 UserButtonHandler:
                                    224 ; wait button release
      0080D5 5F               [ 1]  225 	clrw x
      0080D6 5A               [ 2]  226 1$: decw x 
      0080D7 26 FD            [ 1]  227 	jrne 1$
      0080D9 72 09 50 15 F8   [ 2]  228 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    229 ; if MCU suspended by SLEEP resume program
      0080DE 72 07 00 21 05   [ 2]  230     btjf flags,#FSLEEP,2$
      0080E3 72 17 00 21      [ 1]  231 	bres flags,#FSLEEP 
      0080E7 80               [11]  232 	iret
      0080E8                        233 2$:	
      0080E8                        234 user_interrupted:
      0080E8 72 00 00 21 02   [ 2]  235     btjt flags,#FRUN,4$
      0080ED 20 0A            [ 2]  236 	jra UBTN_Handler_exit 
      0080EF                        237 4$:	; program interrupted by user 
      0080EF 72 11 00 21      [ 1]  238 	bres flags,#FRUN 
      0080F3 AE 81 0C         [ 2]  239 	ldw x,#USER_ABORT
      0080F6 CD 9F 0C         [ 4]  240 	call puts 
      0080F9                        241 UBTN_Handler_exit:
      0080F9 AE 17 FF         [ 2]  242     ldw x,#STACK_EMPTY 
      0080FC 94               [ 1]  243     ldw sp,x
      0080FD 9A               [ 1]  244 	rim 
      0080FE CE 00 1A         [ 2]  245 	ldw x,txtbgn 
      008101 A3 A9 00         [ 2]  246 	cpw x,#app_space 
      008104 22 03            [ 1]  247 	jrugt 5$
      008106 CD 86 10         [ 4]  248 	call clear_basic 
      008109 CC 88 2A         [ 2]  249 5$:	jp warm_start
                                    250 
      00810C 0A 50 72 6F 67 72 61   251 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    252 
                                    253 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    254 ;    peripherals initialization
                                    255 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    256 
                                    257 ;----------------------------------------
                                    258 ; inialize MCU clock 
                                    259 ; input:
                                    260 ;   A 		source  HSI | 1 HSE 
                                    261 ;   XL      CLK_CKDIVR , clock divisor 
                                    262 ; output:
                                    263 ;   none 
                                    264 ;----------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      008127                        265 clock_init:	
      008127 C1 50 C3         [ 1]  266 	cp a,CLK_CMSR 
      00812A 27 0C            [ 1]  267 	jreq 2$ ; no switching required 
                                    268 ; select clock source 
      00812C 72 12 50 C5      [ 1]  269 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008130 C7 50 C4         [ 1]  270 	ld CLK_SWR,a
      008133 C1 50 C3         [ 1]  271 1$:	cp a,CLK_CMSR
      008136 26 FB            [ 1]  272 	jrne 1$
      008138                        273 2$: 	
                                    274 ; HSI and cpu clock divisor 
      008138 9F               [ 1]  275 	ld a,xl 
      008139 C7 50 C6         [ 1]  276 	ld CLK_CKDIVR,a  
      00813C 81               [ 4]  277 	ret
                                    278 
                                    279 ;----------------------------------
                                    280 ; TIMER2 used as audio tone output 
                                    281 ; on port D:5.
                                    282 ; channel 1 configured as PWM mode 1 
                                    283 ;-----------------------------------  
                           00F424   284 TIM2_CLK_FREQ=62500
      00813D                        285 timer2_init:
      00813D 72 1A 50 C7      [ 1]  286 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008141 35 60 53 05      [ 1]  287  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008145 35 08 53 0C      [ 1]  288 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008149 81               [ 4]  289 	ret 
                                    290 
                                    291 ;---------------------------------
                                    292 ; TIM4 is configured to generate an 
                                    293 ; interrupt every millisecond 
                                    294 ;----------------------------------
      00814A                        295 timer4_init:
      00814A 72 18 50 C7      [ 1]  296 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00814E 35 07 53 45      [ 1]  297 	mov TIM4_PSCR,#7 ; prescale 128  
      008152 35 7D 53 46      [ 1]  298 	mov TIM4_ARR,#125 ; set for 1msec.
      008156 35 05 53 40      [ 1]  299 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00815A 72 10 53 41      [ 1]  300 	bset TIM4_IER,#TIM4_IER_UIE
      00815E 81               [ 4]  301 	ret
                                    302 
                                    303 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    304 ;  routines to write to FLASH, EEPROM 
                                    305 ;  and OPTION 
                                    306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    307 
                                    308 ;----------------------------------
                                    309 ; unlock EEPROM/OPT for writing/erasing
                                    310 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    311 ; input:
                                    312 ;  none
                                    313 ; output:
                                    314 ;  none 
                                    315 ;----------------------------------
      00815F                        316 unlock_eeprom:
      00815F 35 00 50 5B      [ 1]  317 	mov FLASH_CR2,#0 
      008163 35 FF 50 5C      [ 1]  318 	mov FLASH_NCR2,#0xFF 
      008167 35 AE 50 64      [ 1]  319 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      00816B 35 56 50 64      [ 1]  320     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00816F 72 07 50 5F FB   [ 2]  321 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008174 81               [ 4]  322 	ret
                                    323 
                                    324 ;----------------------------------
                                    325 ; unlock FLASH for writing/erasing
                                    326 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    327 ; input:
                                    328 ;  none
                                    329 ; output:
                                    330 ;  none
                                    331 ;----------------------------------
      008175                        332 unlock_flash:
      008175 35 00 50 5B      [ 1]  333 	mov FLASH_CR2,#0 
      008179 35 FF 50 5C      [ 1]  334 	mov FLASH_NCR2,#0xFF 
      00817D 35 56 50 62      [ 1]  335 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008181 35 AE 50 62      [ 1]  336 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008185 72 03 50 5F FB   [ 2]  337 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00818A 81               [ 4]  338 	ret
                                    339 
                                    340 ;----------------------------
                                    341 ; erase block code must be 
                                    342 ; executed from RAM
                                    343 ; input:
                                    344 ;-----------------------------
      00818B                        345 row_erase:
      00818B 35 20 50 5B      [ 1]  346 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00818F 35 DF 50 5C      [ 1]  347 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      008193 4F               [ 1]  348 	clr a 
      008194 90 5F            [ 1]  349 	clrw y 
      008196 91 A7 00 17      [ 1]  350 	ldf ([farptr],y),a
      00819A 90 5C            [ 1]  351     incw y
      00819C 91 A7 00 17      [ 1]  352 	ldf ([farptr],y),a
      0081A0 90 5C            [ 1]  353     incw y
      0081A2 91 A7 00 17      [ 1]  354 	ldf ([farptr],y),a
      0081A6 90 5C            [ 1]  355     incw y
      0081A8 91 A7 00 17      [ 1]  356 	ldf ([farptr],y),a
      0081AC 72 05 50 5F FB   [ 2]  357 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081B1 81               [ 4]  358 	ret
      0081B2                        359 row_erase_end:
                                    360 
                                    361 ; copy erase_start in RAM 
      0081B2                        362 move_erase_to_ram:
      0081B2 AE 81 B2         [ 2]  363 	ldw x,#row_erase_end 
      0081B5 1D 81 8B         [ 2]  364 	subw x,#row_erase
      0081B8 CF 00 0D         [ 2]  365 	ldw acc16,x 
      0081BB AE 16 90         [ 2]  366 	ldw x,#tib 
      0081BE 90 AE 81 8B      [ 2]  367 	ldw y,#row_erase 
      0081C2 CD 84 36         [ 4]  368 	call move 
      0081C5 81               [ 4]  369 	ret 
                                    370 
                                    371 ;-----------------------------------
                                    372 ; block programming must be 
                                    373 ; executed from RAM 
                                    374 ; initial contidions: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    375 ; 	memory unlocked
                                    376 ;   bit PRG set in 
                                    377 ; input:
                                    378 ;   x        128 bytes row to program 
                                    379 ;   farptr   row address 
                                    380 ; output:
                                    381 ;   none 
                                    382 ;----------------------------------
                           000001   383 	BCNT=1 
      0081C6                        384 program_row:
      0081C6 4B 80            [ 1]  385 	push #BLOCK_SIZE  
                                    386 ;enable block programming 
      0081C8 72 10 50 5B      [ 1]  387 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0081CC 72 11 50 5C      [ 1]  388 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0081D0 90 5F            [ 1]  389 	clrw y 
      0081D2 F6               [ 1]  390 1$:	ld a,(x)
      0081D3 91 A7 00 17      [ 1]  391 	ldf ([farptr],y),a
      0081D7 5C               [ 1]  392 	incw x 
      0081D8 90 5C            [ 1]  393 	incw y 
      0081DA 0A 01            [ 1]  394 	dec (BCNT,sp)
      0081DC 26 F4            [ 1]  395 	jrne 1$
                                    396 ; wait EOP bit 
      0081DE 72 05 50 5F FB   [ 2]  397 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      000163                        398 	_drop 1 
      0081E3 5B 01            [ 2]    1     addw sp,#1 
      0081E5 81               [ 4]  399 	ret 
      0081E6                        400 program_row_end:
                                    401 
                                    402 ;-------------------------
                                    403 ; move program_row to RAM 
                                    404 ; at txtubound address 
                                    405 ;------------------------
      0081E6                        406 move_prg_to_ram:
      0081E6 AE 81 E6         [ 2]  407 	ldw x,#program_row_end 
      0081E9 1D 81 C6         [ 2]  408 	subw x,#program_row 
      0081EC CF 00 0D         [ 2]  409 	ldw acc16,x 
      0081EF AE 16 90         [ 2]  410 	ldw x,#tib 
      0081F2 90 AE 81 C6      [ 2]  411 	ldw y,#program_row 
      0081F6 CD 84 36         [ 4]  412 	call move 
      0081F9 81               [ 4]  413 	ret 
                                    414 
                                    415 
                                    416 ;-----------------------------
                                    417 ; write a row in FLASH/EEPROM 
                                    418 ; input:
                                    419 ;    farptr   destination address 
                                    420 ;    x        source address 
                                    421 ;-----------------------------
      0081FA                        422 write_row:
      0081FA 89               [ 2]  423 	pushw x 
      0081FB 72 5D 00 17      [ 1]  424 	tnz farptr 
      0081FF 26 1C            [ 1]  425 	jrne to_flash 
      008201 AE 80 00         [ 2]  426 	ldw x,#FLASH_BASE 
      008204 C3 00 18         [ 2]  427 	cpw x,farptr+1 
      008207 24 14            [ 1]  428 	jruge to_flash 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      008209                        429 to_eeprom:
      008209 AE 40 00         [ 2]  430 	ldw x,#EEPROM_BASE 
      00820C C3 00 18         [ 2]  431 	cpw x,farptr+1 
      00820F 24 01            [ 1]  432 	jruge 1$
      008211 81               [ 4]  433 	ret ; bad address 
      008212 AE 47 FF         [ 2]  434 1$: ldw x,#EEPROM_END 
      008215 23 01            [ 2]  435 	jrule 2$ 
      008217 81               [ 4]  436 	ret ; bad address 
      008218 CD 81 5F         [ 4]  437 2$:	call unlock_eeprom
      00821B 20 03            [ 2]  438 	jra do_programming
      00821D                        439 to_flash:
      00821D CD 81 75         [ 4]  440 	call unlock_flash 
      008220                        441 do_programming:
      008220 85               [ 2]  442 	popw x 
      008221 CD 16 90         [ 4]  443 	call tib
      008224 72 13 50 5F      [ 1]  444 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008228 72 17 50 5F      [ 1]  445 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      00822C 81               [ 4]  446 	ret 
                                    447 
                                    448 
                                    449 ;-----------------------------------
                                    450 ; erase flash or EEPROM block
                                    451 ; a block is 128 bytes 
                                    452 ; input:
                                    453 ;   farptr  address row begin
                                    454 ; output:
                                    455 ;   none
                                    456 ;--------------------------------------
      00822D                        457 block_erase:
      00822D CE 00 18         [ 2]  458 	ldw x,farptr+1
      008230 A3 A9 00         [ 2]  459 	cpw x,#app_space 
      008233 2A 17            [ 1]  460 	jrpl erase_flash 
                                    461 ; erase eeprom block
      008235 A3 40 00         [ 2]  462 	cpw x,#EEPROM_BASE 
      008238 24 01            [ 1]  463 	jruge 1$
      00823A 81               [ 4]  464 	ret ; bad address 
      00823B AE 47 FF         [ 2]  465 1$: ldw x,#EEPROM_END 
      00823E 23 01            [ 2]  466 	jrule 2$ 
      008240 81               [ 4]  467 	ret ; bad address 
      008241 CD 81 5F         [ 4]  468 2$:	call unlock_eeprom 
      008244 CD 16 90         [ 4]  469 	call tib 
      008247 72 17 50 5F      [ 1]  470 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      00824B 81               [ 4]  471 	ret 
                                    472 ; erase flash block:
      00824C                        473 erase_flash:
      00824C CD 81 75         [ 4]  474 	call unlock_flash 
      00824F CD 16 90         [ 4]  475 	call tib 
      008252 72 13 50 5F      [ 1]  476     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008256 81               [ 4]  477 	ret 
                                    478 
                                    479 
                                    480 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    481 ; write a byte to FLASH or EEPROM/OPTION  
                                    482 ; input:
                                    483 ;    a  		byte to write
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    484 ;    farptr  	address
                                    485 ;    x          farptr[x]
                                    486 ; output:
                                    487 ;    none
                                    488 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    489 	; variables locales
                           000001   490 	BTW = 1   ; byte to write offset on stack
                           000002   491 	OPT = 2   ; OPTION flag offset on stack
                           000002   492 	VSIZE = 2
      008257                        493 write_byte:
      008257 90 89            [ 2]  494 	pushw y
      0001D9                        495 	_vars VSIZE
      008259 52 02            [ 2]    1     sub sp,#VSIZE 
      00825B 6B 01            [ 1]  496 	ld (BTW,sp),a ; byte to write 
      00825D 0F 02            [ 1]  497 	clr (OPT,sp)  ; OPTION flag
                                    498 ; put addr[15:0] in Y, for bounds check.
      00825F 90 CE 00 18      [ 2]  499 	ldw y,farptr+1   ; Y=addr15:0
                                    500 ; check addr[23:16], if <> 0 then it is extened flash memory
      008263 72 5D 00 17      [ 1]  501 	tnz farptr 
      008267 26 14            [ 1]  502 	jrne write_flash
      008269 90 A3 A9 00      [ 2]  503     cpw y,#app_space 	 
      00826D 24 0E            [ 1]  504     jruge write_flash
      00826F 90 A3 40 00      [ 2]  505 	cpw y,#EEPROM_BASE  
      008273 25 52            [ 1]  506     jrult write_exit
      008275 90 A3 48 7F      [ 2]  507 	cpw y,#OPTION_END 
      008279 22 4C            [ 1]  508 	jrugt write_exit
      00827B 20 16            [ 2]  509 	jra write_eeprom 
                                    510 ; write program memory
      00827D                        511 write_flash:
      00827D CD 81 75         [ 4]  512 	call unlock_flash 
      008280 9B               [ 1]  513 1$:	sim 
      008281 7B 01            [ 1]  514 	ld a,(BTW,sp)
      008283 92 A7 00 17      [ 4]  515 	ldf ([farptr],x),a ; farptr[x]=A
      008287 72 05 50 5F FB   [ 2]  516 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00828C 9A               [ 1]  517     rim 
      00828D 72 13 50 5F      [ 1]  518     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008291 20 34            [ 2]  519     jra write_exit
                                    520 ; write eeprom and option
      008293                        521 write_eeprom:
      008293 CD 81 5F         [ 4]  522 	call unlock_eeprom
                                    523 	; check for data eeprom or option eeprom
      008296 90 A3 48 00      [ 2]  524 	cpw y,#OPTION_BASE
      00829A 2B 08            [ 1]  525 	jrmi 1$
      00829C 90 A3 48 80      [ 2]  526 	cpw y,#OPTION_END+1
      0082A0 2A 02            [ 1]  527 	jrpl 1$
      0082A2 03 02            [ 1]  528 	cpl (OPT,sp)
      0082A4                        529 1$: 
      0082A4 0D 02            [ 1]  530     tnz (OPT,sp)
      0082A6 27 08            [ 1]  531     jreq 2$
                                    532 	; pour modifier une option il faut modifier ces 2 bits
      0082A8 72 1E 50 5B      [ 1]  533     bset FLASH_CR2,#FLASH_CR2_OPT
      0082AC 72 1F 50 5C      [ 1]  534     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0082B0                        535 2$: 
      0082B0 7B 01            [ 1]  536     ld a,(BTW,sp)
      0082B2 92 A7 00 17      [ 4]  537     ldf ([farptr],x),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0082B6 0D 02            [ 1]  538     tnz (OPT,sp)
      0082B8 27 08            [ 1]  539     jreq 3$
      0082BA 5C               [ 1]  540     incw x
      0082BB 7B 01            [ 1]  541     ld a,(BTW,sp)
      0082BD 43               [ 1]  542     cpl a
      0082BE 92 A7 00 17      [ 4]  543     ldf ([farptr],x),a
      0082C2 72 05 50 5F FB   [ 2]  544 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082C7                        545 write_exit:
      000247                        546 	_drop VSIZE 
      0082C7 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082C9 90 85            [ 2]  547 	popw y
      0082CB 81               [ 4]  548     ret
                                    549 
                                    550 ;--------------------------------------------
                                    551 ; write a data block to eeprom or flash 
                                    552 ; input:
                                    553 ;   Y        source address   
                                    554 ;   X        array index  destination  farptr[x]
                                    555 ;   BSIZE    block size bytes 
                                    556 ;   farptr   write address , byte* 
                                    557 ; output:
                                    558 ;	X 		after last byte written 
                                    559 ;   Y 		after last byte read 
                                    560 ;  farptr   point after block
                                    561 ;---------------------------------------------
      0082CC                        562 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      00024C                        563 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    564 	; local var 
                           000001   565 	XSAVE=1 
                           000002   566 	VSIZE=2 
      00024C                        567 write_block:
      00024C                        568 	_vars VSIZE
      0082CC 52 02            [ 2]    1     sub sp,#VSIZE 
      0082CE 1F 01            [ 2]  569 	ldw (XSAVE,sp),x 
      0082D0 1E 05            [ 2]  570 	ldw x,(BSIZE,sp) 
      0082D2 27 13            [ 1]  571 	jreq 9$
      0082D4 1E 01            [ 2]  572 1$:	ldw x,(XSAVE,sp)
      0082D6 90 F6            [ 1]  573 	ld a,(y)
      0082D8 CD 82 57         [ 4]  574 	call write_byte 
      0082DB 5C               [ 1]  575 	incw x 
      0082DC 90 5C            [ 1]  576 	incw y 
      0082DE 1F 01            [ 2]  577 	ldw (XSAVE,sp),x
      0082E0 1E 05            [ 2]  578 	ldw x,(BSIZE,sp)
      0082E2 5A               [ 2]  579 	decw x
      0082E3 1F 05            [ 2]  580 	ldw (BSIZE,sp),x 
      0082E5 26 ED            [ 1]  581 	jrne 1$
      0082E7                        582 9$:
      0082E7 1E 01            [ 2]  583 	ldw x,(XSAVE,sp)
      0082E9 CD 94 39         [ 4]  584 	call incr_farptr
      00026C                        585 	_drop VSIZE
      0082EC 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082EE 81               [ 4]  586 	ret 
                                    587 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    588 
                                    589 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    590 ;;   UART1 subroutines
                                    591 ;;   used for user interface 
                                    592 ;;   communication channel.
                                    593 ;;   settings: 
                                    594 ;;		115200 8N1 no flow control
                                    595 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    596 
                                    597 ;---------------------------------------------
                                    598 ; initialize UART1, 115200 8N1
                                    599 ; input:
                                    600 ;	none
                                    601 ; output:
                                    602 ;   none
                                    603 ;---------------------------------------------
      0082EF                        604 uart1_init:
      0082EF 72 1A 50 02      [ 1]  605     bset PA_DDR,#UART1_TX_PIN
      0082F3 72 1A 50 03      [ 1]  606     bset PA_CR1,#UART1_TX_PIN 
      0082F7 72 1A 50 04      [ 1]  607     bset PA_CR2,#UART1_TX_PIN 
                                    608 ; enable UART1 clock
      0082FB 72 14 50 C7      [ 1]  609 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      0082FF                        610 uart1_set_baud: 
                                    611 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    612 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      0082FF A6 E1            [ 1]  613 	ld a,#CLK_SWR_HSI
      008301 C1 50 C3         [ 1]  614 	cp a,CLK_CMSR 
      008304 27 0A            [ 1]  615 	jreq 2$ 
      008306                        616 1$: ; 8 Mhz 	
      008306 35 05 52 33      [ 1]  617 	mov UART1_BRR2,#0x05 ; must be loaded first
      00830A 35 04 52 32      [ 1]  618 	mov UART1_BRR1,#0x4
      00830E 20 08            [ 2]  619 	jra 3$
      008310                        620 2$: ; 16 Mhz 	
      008310 35 0B 52 33      [ 1]  621 	mov UART1_BRR2,#0x0b ; must be loaded first
      008314 35 08 52 32      [ 1]  622 	mov UART1_BRR1,#0x08
      008318                        623 3$:
      008318 72 5F 52 31      [ 1]  624     clr UART1_DR
      00831C 35 2C 52 35      [ 1]  625 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008320 72 10 52 35      [ 1]  626 	bset UART1_CR2,#UART_CR2_SBK
      008324 72 0D 52 30 FB   [ 2]  627     btjf UART1_SR,#UART_SR_TC,.
      008329 72 5F 00 2B      [ 1]  628     clr rx1_head 
      00832D 72 5F 00 2C      [ 1]  629 	clr rx1_tail 
      008331 81               [ 4]  630 	ret
                                    631 
                                    632 ;---------------------------------
                                    633 ; uart1_putc
                                    634 ; send a character via UART1
                                    635 ; input:
                                    636 ;    A  	character to send
                                    637 ;---------------------------------
      008332                        638 putc:: ; console output always on UART1
      008332                        639 uart1_putc:: 
      008332 72 0F 52 30 FB   [ 2]  640 	btjf UART1_SR,#UART_SR_TXE,.
      008337 C7 52 31         [ 1]  641 	ld UART1_DR,a 
      00833A 81               [ 4]  642 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    643 
                                    644 
                                    645 ;---------------------------------
                                    646 ; Query for character in rx1_queue
                                    647 ; input:
                                    648 ;   none 
                                    649 ; output:
                                    650 ;   A     0 no charcter available
                                    651 ;   Z     1 no character available
                                    652 ;---------------------------------
      00833B                        653 qgetc::
      00833B                        654 uart1_qgetc::
      00833B C6 00 2B         [ 1]  655 	ld a,rx1_head 
      00833E C0 00 2C         [ 1]  656 	sub a,rx1_tail 
      008341 81               [ 4]  657 	ret 
                                    658 
                                    659 ;---------------------------------
                                    660 ; wait character from UART1 
                                    661 ; input:
                                    662 ;   none
                                    663 ; output:
                                    664 ;   A 			char  
                                    665 ;--------------------------------	
      008342                        666 getc:: ;console input
      008342                        667 uart1_getc::
      008342 CD 83 3B         [ 4]  668 	call uart1_qgetc
      008345 27 FB            [ 1]  669 	jreq uart1_getc 
      008347 89               [ 2]  670 	pushw x 
      008348 AE 00 23         [ 2]  671 	ldw x,#rx1_queue
      00834B 9F               [ 1]  672 	ld a,xl 
      00834C CB 00 2B         [ 1]  673 	add a,rx1_head 
      00834F 97               [ 1]  674 	ld xl,a 
      008350 F6               [ 1]  675 	ld a,(x)
      008351 85               [ 2]  676 	popw x
      008352 88               [ 1]  677 	push a
      008353 72 5C 00 2B      [ 1]  678 	inc rx1_head 
      008357 A6 07            [ 1]  679 	ld a,#RX_QUEUE_SIZE-1 
      008359 C4 00 2B         [ 1]  680 	and a,rx1_head 
      00835C C7 00 2B         [ 1]  681 	ld rx1_head,a 
      00835F 84               [ 1]  682 	pop a  
      008360 81               [ 4]  683 	ret 
                                    684 
                                    685 ;----------------------
                                    686 ; print token id && value
                                    687 ; input:
                                    688 ;   A     token id 
                                    689 ;   X     token value 
                                    690 ;---------------------
                           000001   691 	BSAVE=1
                           000002   692 	AREG=2
                           000003   693 	XREG=3
                           000004   694 	VSIZE=4
      008361                        695 prt_tok:
      0002E1                        696 	_vars VSIZE 
      008361 52 04            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008363 6B 02            [ 1]  697 	ld (AREG,sp),a 
      008365 1F 03            [ 2]  698 	ldw (XREG,sp),x 
      008367 C6 00 0B         [ 1]  699 	ld a, base
      00836A 6B 01            [ 1]  700 	ld (BSAVE,sp),a 
      00836C 35 10 00 0B      [ 1]  701 	mov base,#16  
      008370 AE 83 98         [ 2]  702 	ldw x,#token_msg
      008373 CD 9F 0C         [ 4]  703 	call puts 
      008376 5F               [ 1]  704 	clrw x 
      008377 7B 02            [ 1]  705 	ld a,(AREG,sp)
      008379 97               [ 1]  706 	ld xl,a 
      00837A CD 88 F0         [ 4]  707 	call print_int 
      00837D A6 20            [ 1]  708 	ld a,#SPACE
      00837F CD 83 32         [ 4]  709 	call putc 
      008382 1E 03            [ 2]  710 	ldw x,(XREG,sp)
      008384 CD 88 F0         [ 4]  711 	call print_int 
      008387 A6 0D            [ 1]  712 	ld a,#CR 
      008389 CD 83 32         [ 4]  713 	call putc 
      00838C 7B 01            [ 1]  714 	ld a,(BSAVE,sp)
      00838E C7 00 0B         [ 1]  715 	ld base,a 
      008391 7B 02            [ 1]  716 	ld a,(AREG,sp)
      008393 1E 03            [ 2]  717 	ldw x,(XREG,sp)
      000315                        718 	_drop VSIZE 
      008395 5B 04            [ 2]    1     addw sp,#VSIZE 
      008397 81               [ 4]  719 	ret 
      008398 74 6F 6B 65 6E 3A 20   720 token_msg: .asciz "token: "
             00
                                    721 
                                    722 
                                    723 ;---------------------
                                    724 ; display n bytes row 
                                    725 ; from memory.
                                    726 ; input:
                                    727 ;   A   bytes to print 
                                    728 ;	X   start address 
                                    729 ; output:
                                    730 ;   X   address after last shown  
                                    731 ;---------------------
                           000001   732 	CNT=1 
                           000002   733 	ADR=2 
                           000003   734 	VSIZE=3 
      0083A0                        735 show_row:
      0083A0 4D               [ 1]  736 	tnz a 
      0083A1 26 01            [ 1]  737 	jrne 1$
      0083A3 81               [ 4]  738 	ret 
      0083A4                        739 1$:	
      0083A4 89               [ 2]  740 	pushw x  
      0083A5 88               [ 1]  741 	push a 
      0083A6 35 04 00 22      [ 1]  742 	mov tab_width,#4 
      0083AA CD 88 F0         [ 4]  743 	call print_int 
      0083AD A6 20            [ 1]  744 	ld a,#SPACE  
      0083AF CD 83 32         [ 4]  745 	call putc
      0083B2                        746 row_loop:
      0083B2 1E 02            [ 2]  747 	ldw x,(ADR,sp)
      0083B4 F6               [ 1]  748 	ld a,(x)
      0083B5 5F               [ 1]  749 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083B6 97               [ 1]  750 	ld xl,a 
      0083B7 CD 88 F0         [ 4]  751 	call print_int 
      0083BA 1E 02            [ 2]  752 	ldw x,(ADR,sp)
      0083BC 5C               [ 1]  753 	incw x 
      0083BD 1F 02            [ 2]  754 	ldw (ADR,sp),x 
      0083BF 0A 01            [ 1]  755 	dec (CNT,sp)
      0083C1 26 EF            [ 1]  756 	jrne row_loop
      000343                        757 	_drop VSIZE  		
      0083C3 5B 03            [ 2]    1     addw sp,#VSIZE 
      0083C5 35 04 00 22      [ 1]  758 	mov tab_width,#4
      0083C9 A6 0D            [ 1]  759 	ld a,#CR 
      0083CB CD 83 32         [ 4]  760 	call putc 
      0083CE 81               [ 4]  761 	ret 
                                    762 
                                    763 ;--------------------------
                                    764 ; print memory content 
                                    765 ; in hexadecimal format
                                    766 ;  input:
                                    767 ;    X    start address 
                                    768 ;    Y    count 
                                    769 ;--------------------------
                           000001   770 	BCNT=1
                           000003   771 	BASE=3
                           000004   772 	TABW=4
                           000004   773 	VSIZE=4   
      0083CF                        774 hex_dump:
      00034F                        775 	_vars VSIZE
      0083CF 52 04            [ 2]    1     sub sp,#VSIZE 
      0083D1 C6 00 0B         [ 1]  776 	ld a,base
      0083D4 6B 03            [ 1]  777 	ld (BASE,sp),a 
      0083D6 35 10 00 0B      [ 1]  778 	mov base,#16
      0083DA C6 00 22         [ 1]  779 	ld a,tab_width 
      0083DD 6B 04            [ 1]  780 	ld (TABW,sp),a
      0083DF A6 0D            [ 1]  781 	ld a,#CR 
      0083E1 CD 83 32         [ 4]  782 	call putc 
      0083E4 17 01            [ 2]  783 1$: ldw (BCNT,sp),y
      0083E6 A6 10            [ 1]  784 	ld a,#16
      0083E8 90 A3 00 10      [ 2]  785 	cpw y,#16
      0083EC 2A 02            [ 1]  786 	jrpl 2$
      0083EE 90 9F            [ 1]  787 	ld a,yl
      0083F0                        788 2$: 	
      0083F0 CD 83 A0         [ 4]  789 	call show_row 
      0083F3 16 01            [ 2]  790 	ldw y,(BCNT,sp) 
      0083F5 72 A2 00 10      [ 2]  791 	subw y,#16 
      0083F9 90 A3 00 01      [ 2]  792 	cpw y,#1
      0083FD 2A E5            [ 1]  793 	jrpl 1$
      0083FF 7B 03            [ 1]  794 	ld a,(BASE,sp)
      008401 C7 00 0B         [ 1]  795 	ld base,a
      008404 7B 04            [ 1]  796 	ld a,(TABW,sp)
      008406 C7 00 22         [ 1]  797 	ld tab_width,a 
      000389                        798 	_drop VSIZE
      008409 5B 04            [ 2]    1     addw sp,#VSIZE 
      00840B 81               [ 4]  799 	ret 
                                    800 
                                    801 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    802 ; retrun string length
                                    803 ; input:
                                    804 ;   X         .asciz  pointer 
                                    805 ; output:
                                    806 ;   X         not affected 
                                    807 ;   A         length 
                                    808 ;-------------------------------------
      00840C                        809 strlen::
      00840C 89               [ 2]  810 	pushw x 
      00840D 4F               [ 1]  811 	clr a
      00840E 7D               [ 1]  812 1$:	tnz (x) 
      00840F 27 04            [ 1]  813 	jreq 9$ 
      008411 4C               [ 1]  814 	inc a 
      008412 5C               [ 1]  815 	incw x 
      008413 20 F9            [ 2]  816 	jra 1$ 
      008415 85               [ 2]  817 9$:	popw x 
      008416 81               [ 4]  818 	ret 
                                    819 
                                    820 ;------------------------------------
                                    821 ; compare 2 strings
                                    822 ; input:
                                    823 ;   X 		char* first string 
                                    824 ;   Y       char* second string 
                                    825 ; output:
                                    826 ;   A 		0|1 
                                    827 ;-------------------------------------
      008417                        828 strcmp:
      008417 F6               [ 1]  829 	ld a,(x)
      008418 27 0B            [ 1]  830 	jreq 5$ 
      00841A 90 F1            [ 1]  831 	cp a,(y) 
      00841C 26 05            [ 1]  832 	jrne 4$ 
      00841E 5C               [ 1]  833 	incw x 
      00841F 90 5C            [ 1]  834 	incw y 
      008421 20 F4            [ 2]  835 	jra strcmp 
      008423                        836 4$: ; not same  
      008423 4F               [ 1]  837 	clr a 
      008424 81               [ 4]  838 	ret 
      008425                        839 5$: ; same 
      008425 A6 01            [ 1]  840 	ld a,#1 
      008427 81               [ 4]  841 	ret 
                                    842 
                                    843 
                                    844 ;---------------------------------------
                                    845 ;  copy src to dest 
                                    846 ; input:
                                    847 ;   X 		dest 
                                    848 ;   Y 		src 
                                    849 ; output: 
                                    850 ;   X 		dest 
                                    851 ;----------------------------------
      008428                        852 strcpy::
      008428 89               [ 2]  853 	pushw x 
      008429 90 F6            [ 1]  854 1$: ld a,(y)
      00842B 27 06            [ 1]  855 	jreq 9$ 
      00842D F7               [ 1]  856 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      00842E 5C               [ 1]  857 	incw x 
      00842F 90 5C            [ 1]  858 	incw y 
      008431 20 F6            [ 2]  859 	jra 1$ 
      008433 7F               [ 1]  860 9$:	clr (x)
      008434 85               [ 2]  861 	popw x 
      008435 81               [ 4]  862 	ret 
                                    863 
                                    864 ;---------------------------------------
                                    865 ; move memory block 
                                    866 ; input:
                                    867 ;   X 		destination 
                                    868 ;   Y 	    source 
                                    869 ;   acc16	bytes count 
                                    870 ; output:
                                    871 ;   none 
                                    872 ;--------------------------------------
                           000001   873 	INCR=1 ; increament high byte 
                           000002   874 	LB=2 ; increament low byte 
                           000002   875 	VSIZE=2
      008436                        876 move::
      0003B6                        877 	_vars VSIZE 
      008436 52 02            [ 2]    1     sub sp,#VSIZE 
      008438 0F 01            [ 1]  878 	clr (INCR,sp)
      00843A 0F 02            [ 1]  879 	clr (LB,sp)
      00843C 90 89            [ 2]  880 	pushw y 
      00843E 13 01            [ 2]  881 	cpw x,(1,sp) ; compare DEST to SRC 
      008440 90 85            [ 2]  882 	popw y 
      008442 27 31            [ 1]  883 	jreq move_exit ; x==y 
      008444 2B 0E            [ 1]  884 	jrmi move_down
      008446                        885 move_up: ; start from top address with incr=-1
      008446 72 BB 00 0D      [ 2]  886 	addw x,acc16
      00844A 72 B9 00 0D      [ 2]  887 	addw y,acc16
      00844E 03 01            [ 1]  888 	cpl (INCR,sp)
      008450 03 02            [ 1]  889 	cpl (LB,sp)   ; increment = -1 
      008452 20 05            [ 2]  890 	jra move_loop  
      008454                        891 move_down: ; start from bottom address with incr=1 
      008454 5A               [ 2]  892     decw x 
      008455 90 5A            [ 2]  893 	decw y
      008457 0C 02            [ 1]  894 	inc (LB,sp) ; incr=1 
      008459                        895 move_loop:	
      008459 C6 00 0D         [ 1]  896     ld a, acc16 
      00845C CA 00 0E         [ 1]  897 	or a, acc8
      00845F 27 14            [ 1]  898 	jreq move_exit 
      008461 72 FB 01         [ 2]  899 	addw x,(INCR,sp)
      008464 72 F9 01         [ 2]  900 	addw y,(INCR,sp) 
      008467 90 F6            [ 1]  901 	ld a,(y)
      008469 F7               [ 1]  902 	ld (x),a 
      00846A 89               [ 2]  903 	pushw x 
      00846B CE 00 0D         [ 2]  904 	ldw x,acc16 
      00846E 5A               [ 2]  905 	decw x 
      00846F CF 00 0D         [ 2]  906 	ldw acc16,x 
      008472 85               [ 2]  907 	popw x 
      008473 20 E4            [ 2]  908 	jra move_loop
      008475                        909 move_exit:
      0003F5                        910 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008475 5B 02            [ 2]    1     addw sp,#VSIZE 
      008477 81               [ 4]  911 	ret 	
                                    912 
                                    913 ;------------------------------------
                                    914 ;  set all variables to zero 
                                    915 ; input:
                                    916 ;   none 
                                    917 ; output:
                                    918 ;	none
                                    919 ;------------------------------------
      008478                        920 clear_vars:
      008478 AE 00 31         [ 2]  921 	ldw x,#vars 
      00847B 90 AE 00 34      [ 2]  922 	ldw y,#2*26 
      00847F 7F               [ 1]  923 1$:	clr (x)
      008480 5C               [ 1]  924 	incw x 
      008481 90 5A            [ 2]  925 	decw y 
      008483 26 FA            [ 1]  926 	jrne 1$
      008485 81               [ 4]  927 	ret 
                                    928 
                                    929 ;-------------------------------------
                                    930 ; check if A is a letter 
                                    931 ; input:
                                    932 ;   A 			character to test 
                                    933 ; output:
                                    934 ;   C flag      1 true, 0 false 
                                    935 ;-------------------------------------
      008486                        936 is_alpha::
      008486 A1 41            [ 1]  937 	cp a,#'A 
      008488 8C               [ 1]  938 	ccf 
      008489 24 0B            [ 1]  939 	jrnc 9$ 
      00848B A1 5B            [ 1]  940 	cp a,#'Z+1 
      00848D 25 07            [ 1]  941 	jrc 9$ 
      00848F A1 61            [ 1]  942 	cp a,#'a 
      008491 8C               [ 1]  943 	ccf 
      008492 24 02            [ 1]  944 	jrnc 9$
      008494 A1 7B            [ 1]  945 	cp a,#'z+1
      008496 81               [ 4]  946 9$: ret 	
                                    947 
                                    948 ;------------------------------------
                                    949 ; check if character in {'0'..'9'}
                                    950 ; input:
                                    951 ;    A  character to test
                                    952 ; output:
                                    953 ;    Carry  0 not digit | 1 digit
                                    954 ;------------------------------------
      008497                        955 is_digit::
      008497 A1 30            [ 1]  956 	cp a,#'0
      008499 25 03            [ 1]  957 	jrc 1$
      00849B A1 3A            [ 1]  958     cp a,#'9+1
      00849D 8C               [ 1]  959 	ccf 
      00849E 8C               [ 1]  960 1$:	ccf 
      00849F 81               [ 4]  961     ret
                                    962 
                                    963 ;-------------------------------------
                                    964 ; return true if character in  A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    965 ; is letter or digit.
                                    966 ; input:
                                    967 ;   A     ASCII character 
                                    968 ; output:
                                    969 ;   A     no change 
                                    970 ;   Carry    0 false| 1 true 
                                    971 ;--------------------------------------
      0084A0                        972 is_alnum::
      0084A0 CD 84 97         [ 4]  973 	call is_digit
      0084A3 25 03            [ 1]  974 	jrc 1$ 
      0084A5 CD 84 86         [ 4]  975 	call is_alpha
      0084A8 81               [ 4]  976 1$:	ret 
                                    977 
                                    978 
                                    979 ;-------------------------------------
                                    980 ;  program initialization entry point 
                                    981 ;-------------------------------------
                           000001   982 	MAJOR=1
                           000002   983 	MINOR=2 
      0084A9 0A 0A 54 69 6E 79 20   984 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
      0084EF                        985 cold_start:
                                    986 ;set stack 
      0084EF AE 17 FF         [ 2]  987 	ldw x,#STACK_EMPTY
      0084F2 94               [ 1]  988 	ldw sp,x   
                                    989 ; clear all ram 
      0084F3 7F               [ 1]  990 0$: clr (x)
      0084F4 5A               [ 2]  991 	decw x 
      0084F5 26 FC            [ 1]  992 	jrne 0$
                                    993 ; activate pull up on all inputs 
      0084F7 A6 FF            [ 1]  994 	ld a,#255 
      0084F9 C7 50 03         [ 1]  995 	ld PA_CR1,a 
      0084FC C7 50 08         [ 1]  996 	ld PB_CR1,a 
      0084FF C7 50 0D         [ 1]  997 	ld PC_CR1,a 
      008502 C7 50 12         [ 1]  998 	ld PD_CR1,a 
      008505 C7 50 17         [ 1]  999 	ld PE_CR1,a 
      008508 C7 50 1C         [ 1] 1000 	ld PF_CR1,a 
      00850B C7 50 21         [ 1] 1001 	ld PG_CR1,a 
      00850E C7 50 2B         [ 1] 1002 	ld PI_CR1,a
                                   1003 ; set LD2 pin as output 
      008511 72 1A 50 0D      [ 1] 1004     bset PC_CR1,#LED2_BIT
      008515 72 1A 50 0E      [ 1] 1005     bset PC_CR2,#LED2_BIT
      008519 72 1A 50 0C      [ 1] 1006     bset PC_DDR,#LED2_BIT
      00851D 72 1B 50 0A      [ 1] 1007 	bres PC_ODR,#LED2_BIT 
                                   1008 ; disable schmitt triggers on Arduino CN4 analog inputs
      008521 55 00 3F 54 07   [ 1] 1009 	mov ADC_TDRL,0x3f
                                   1010 ; disable peripherals clocks
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1011 ;	clr CLK_PCKENR1 
                                   1012 ;	clr CLK_PCKENR2
      008526 72 5F 50 F2      [ 1] 1013 	clr AWU_TBR 
      00852A 72 14 50 CA      [ 1] 1014 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1015 ; select internal clock no divisor: 16 Mhz 	
      00852E A6 E1            [ 1] 1016 	ld a,#CLK_SWR_HSI 
      008530 5F               [ 1] 1017 	clrw x  
      008531 CD 81 27         [ 4] 1018     call clock_init 
      008534 CD 81 4A         [ 4] 1019 	call timer4_init
      008537 CD 81 3D         [ 4] 1020 	call timer2_init
                                   1021 ; UART1 at 115200 BAUD
      00853A CD 82 EF         [ 4] 1022 	call uart1_init
                                   1023 ; activate PE_4 (user button interrupt)
      00853D 72 18 50 18      [ 1] 1024     bset PE_CR2,#USR_BTN_BIT 
                                   1025 ; display system information
      008541 AE 84 A9         [ 2] 1026 	ldw x,#software 
      008544 CD 9F 0C         [ 4] 1027 	call puts 
      008547 A6 01            [ 1] 1028 	ld a,#MAJOR 
      008549 C7 00 0E         [ 1] 1029 	ld acc8,a 
      00854C 5F               [ 1] 1030 	clrw x 
      00854D CF 00 0C         [ 2] 1031 	ldw acc24,x
      008550 72 5F 00 22      [ 1] 1032 	clr tab_width  
      008554 35 0A 00 0B      [ 1] 1033 	mov base, #10 
      008558 CD 89 00         [ 4] 1034 	call prti24 
      00855B A6 2E            [ 1] 1035 	ld a,#'.
      00855D CD 83 32         [ 4] 1036 	call putc 
      008560 A6 02            [ 1] 1037 	ld a,#MINOR 
      008562 C7 00 0E         [ 1] 1038 	ld acc8,a 
      008565 5F               [ 1] 1039 	clrw x 
      008566 CF 00 0C         [ 2] 1040 	ldw acc24,x 
      008569 CD 89 00         [ 4] 1041 	call prti24
      00856C A6 0D            [ 1] 1042 	ld a,#CR 
      00856E CD 83 32         [ 4] 1043 	call putc
      008571 9A               [ 1] 1044 	rim 
      008572 72 5C 00 16      [ 1] 1045 	inc seedy+1 
      008576 72 5C 00 14      [ 1] 1046 	inc seedx+1 
      00857A CD 86 10         [ 4] 1047 	call clear_basic
      00857D CD 8E 61         [ 4] 1048 	call ubound 
      008580 CD 92 A0         [ 4] 1049 	call beep_1khz  
      008583                       1050 2$:	
      008583 CD 85 F2         [ 4] 1051 	call warm_init
                                   1052 ; check for application in flash memory 
      008586 CE A9 00         [ 2] 1053 	ldw x,app_sign 
      008589 A3 42 43         [ 2] 1054 	cpw x,#0x4243 ; signature "BC" 
      00858C 27 03            [ 1] 1055 	jreq 3$
      00858E CC 88 2D         [ 2] 1056 	jp cmd_line 
      008591                       1057 3$:	 
      008591 AE 85 C7         [ 2] 1058 	ldw x,#running 
      008594 CD 9F 0C         [ 4] 1059 	call puts 
                                   1060 ;	jra 4$
      008597 AE A9 04         [ 2] 1061 	ldw x,#app
      00859A 35 10 00 0B      [ 1] 1062 	mov base,#16 
      00859E CD 88 F0         [ 4] 1063 	call print_int
      0085A1 35 0A 00 0B      [ 1] 1064 	mov base,#10  
      0085A5 AE A9 04         [ 2] 1065 4$:	ldw x,#app  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      0085A8 CF 00 05         [ 2] 1066 	ldw basicptr,x
      0085AB CF 00 1A         [ 2] 1067 	ldw txtbgn,x 
      0085AE E6 02            [ 1] 1068 	ld a,(2,x)
      0085B0 C7 00 04         [ 1] 1069 	ld count,a 
      0085B3 A6 03            [ 1] 1070 	ld a,#3 
      0085B5 C7 00 02         [ 1] 1071 	ld in,a 
      0085B8 CE A9 02         [ 2] 1072 	ldw x,app_size 
      0085BB 72 BB 00 1A      [ 2] 1073 	addw x,txtbgn 
      0085BF CF 00 1C         [ 2] 1074 	ldw txtend,x  
      0085C2 CC 88 6E         [ 2] 1075 	jp interp_loop 
      0085C5 20 FE            [ 2] 1076     jra .  
                                   1077 
      0085C7 0A 72 75 6E 6E 69 6E  1078 running: .asciz "\nrunning application in FLASH at address: " 
             67 20 61 70 70 6C 69
             63 61 74 69 6F 6E 20
             69 6E 20 46 4C 41 53
             48 20 61 74 20 61 64
             64 72 65 73 73 3A 20
             00
                                   1079 
      0085F2                       1080 warm_init:
      0085F2 72 5F 00 21      [ 1] 1081 	clr flags 
      0085F6 72 5F 00 1E      [ 1] 1082 	clr loop_depth 
      0085FA 35 04 00 22      [ 1] 1083 	mov tab_width,#TAB_WIDTH 
      0085FE 35 0A 00 0B      [ 1] 1084 	mov base,#10 
      008602 AE 00 00         [ 2] 1085 	ldw x,#0 
      008605 CF 00 05         [ 2] 1086 	ldw basicptr,x 
      008608 CF 00 01         [ 2] 1087 	ldw in.w,x 
      00860B 72 5F 00 04      [ 1] 1088 	clr count
      00860F 81               [ 4] 1089 	ret 
                                   1090 
                                   1091 
                                   1092 ;---------------------------
                                   1093 ; reset BASIC text variables 
                                   1094 ; and clear variables 
                                   1095 ;---------------------------
      008610                       1096 clear_basic:
      008610 72 5F 00 04      [ 1] 1097 	clr count
      008614 72 5F 00 02      [ 1] 1098 	clr in  
      008618 AE 00 65         [ 2] 1099 	ldw x,#free_ram 
      00861B CF 00 1A         [ 2] 1100 	ldw txtbgn,x 
      00861E CF 00 1C         [ 2] 1101 	ldw txtend,x 
      008621 CD 84 78         [ 4] 1102 	call clear_vars 
      008624 81               [ 4] 1103 	ret 
                                   1104 
                                   1105 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1106 ;;   Tiny BASIC error messages     ;;
                                   1107 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008625                       1108 err_msg:
      008625 00 00 86 45 86 52 86  1109 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             60 86 79 86 88
      008631 86 9E 86 B4 86 CE 86  1110 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             DF 86 F0
      00863B 86 FC 87 2F 87 3F 87  1111 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             53 87 66
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1112 
      008645 4D 65 6D 6F 72 79 20  1113 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      008652 73 79 6E 74 61 78 20  1114 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      008660 6D 61 74 68 20 6F 70  1115 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      008679 64 69 76 69 73 69 6F  1116 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      008688 69 6E 76 61 6C 69 64  1117 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      00869E 72 75 6E 20 74 69 6D  1118 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0086B4 63 6F 6D 6D 61 6E 64  1119 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      0086CE 64 75 70 6C 69 63 61  1120 err_duplicate: .asciz "duplicate name.\n"
             74 65 20 6E 61 6D 65
             2E 0A 00
      0086DF 46 69 6C 65 20 6E 6F  1121 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      0086F0 62 61 64 20 76 61 6C  1122 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      0086FC 46 69 6C 65 20 69 6E  1123 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      00872F 4E 6F 20 64 61 74 61  1124 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      00873F 4E 6F 20 70 72 6F 67  1125 err_no_prog: .asciz "No program in RAM!\n"
             72 61 6D 20 69 6E 20
             52 41 4D 21 0A 00
      008753 46 69 6C 65 20 73 79  1126 err_no_fspace: .asciz "File system full.\n" 
             73 74 65 6D 20 66 75
             6C 6C 2E 0A 00
      008766 42 75 66 66 65 72 20  1127 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
                                   1128 
      008773 0A 72 75 6E 20 74 69  1129 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008785 0A 63 6F 6D 70 69 6C  1130 comp_msg: .asciz "\ncompile error, "
             65 20 65 72 72 6F 72
             2C 20 00
      008796 6C 61 73 74 20 74 6F  1131 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                   1132 
      0087A6                       1133 syntax_error::
      0087A6 A6 02            [ 1] 1134 	ld a,#ERR_SYNTAX 
                                   1135 
      0087A8                       1136 tb_error::
      0087A8 72 0A 00 21 44   [ 2] 1137 	btjt flags,#FCOMP,1$
      0087AD 88               [ 1] 1138 	push a 
      0087AE AE 87 73         [ 2] 1139 	ldw x, #rt_msg 
      0087B1 CD 9F 0C         [ 4] 1140 	call puts 
      0087B4 84               [ 1] 1141 	pop a 
      0087B5 AE 86 25         [ 2] 1142 	ldw x, #err_msg 
      0087B8 72 5F 00 0D      [ 1] 1143 	clr acc16 
      0087BC 48               [ 1] 1144 	sll a
      0087BD 72 59 00 0D      [ 1] 1145 	rlc acc16  
      0087C1 C7 00 0E         [ 1] 1146 	ld acc8, a 
      0087C4 72 BB 00 0D      [ 2] 1147 	addw x,acc16 
      0087C8 FE               [ 2] 1148 	ldw x,(x)
      0087C9 CD 9F 0C         [ 4] 1149 	call puts
      0087CC CE 00 05         [ 2] 1150 	ldw x,basicptr
      0087CF C6 00 02         [ 1] 1151 	ld a,in 
      0087D2 CD 8F 2A         [ 4] 1152 	call prt_basic_line
      0087D5 AE 87 96         [ 2] 1153 	ldw x,#tk_id 
      0087D8 CD 9F 0C         [ 4] 1154 	call puts 
      0087DB C6 00 03         [ 1] 1155 	ld a,in.saved 
      0087DE 5F               [ 1] 1156 	clrw x 
      0087DF 97               [ 1] 1157 	ld xl,a 
      0087E0 72 BB 00 05      [ 2] 1158 	addw x,basicptr 
      0087E4 F6               [ 1] 1159 	ld a,(x)
      0087E5 5F               [ 1] 1160 	clrw x 
      0087E6 97               [ 1] 1161 	ld xl,a 
      0087E7 CD 88 F0         [ 4] 1162 	call print_int
      0087EA 72 0D 00 21 37   [ 2] 1163 	btjf flags,#FAUTORUN ,6$
      0087EF 20 35            [ 2] 1164 	jra 6$
      0087F1                       1165 1$:	
      0087F1 88               [ 1] 1166 	push a 
      0087F2 AE 87 85         [ 2] 1167 	ldw x,#comp_msg
      0087F5 CD 9F 0C         [ 4] 1168 	call puts 
      0087F8 84               [ 1] 1169 	pop a 
      0087F9 AE 86 25         [ 2] 1170 	ldw x, #err_msg 
      0087FC 72 5F 00 0D      [ 1] 1171 	clr acc16 
      008800 48               [ 1] 1172 	sll a
      008801 72 59 00 0D      [ 1] 1173 	rlc acc16  
      008805 C7 00 0E         [ 1] 1174 	ld acc8, a 
      008808 72 BB 00 0D      [ 2] 1175 	addw x,acc16 
      00880C FE               [ 2] 1176 	ldw x,(x)
      00880D CD 9F 0C         [ 4] 1177 	call puts
      008810 AE 16 90         [ 2] 1178 	ldw x,#tib
      008813 CD 9F 0C         [ 4] 1179 	call puts 
      008816 A6 0D            [ 1] 1180 	ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008818 CD 83 32         [ 4] 1181 	call putc
      00881B CE 00 01         [ 2] 1182 	ldw x,in.w
      00881E CD 9F 79         [ 4] 1183 	call spaces
      008821 A6 5E            [ 1] 1184 	ld a,#'^
      008823 CD 83 32         [ 4] 1185 	call putc 
      008826 AE 17 FF         [ 2] 1186 6$: ldw x,#STACK_EMPTY 
      008829 94               [ 1] 1187     ldw sp,x
      00882A                       1188 warm_start:
      00882A CD 85 F2         [ 4] 1189 	call warm_init
                                   1190 ;----------------------------
                                   1191 ;   BASIC interpreter
                                   1192 ;----------------------------
      00882D                       1193 cmd_line: ; user interface 
      00882D A6 0D            [ 1] 1194 	ld a,#CR 
      00882F CD 83 32         [ 4] 1195 	call putc 
      008832 A6 3E            [ 1] 1196 	ld a,#'> 
      008834 CD 83 32         [ 4] 1197 	call putc
      008837 CD A0 11         [ 4] 1198 	call readln
      00883A 72 5D 00 04      [ 1] 1199 	tnz count 
      00883E 27 ED            [ 1] 1200 	jreq cmd_line
      008840 CD A5 EA         [ 4] 1201 	call compile
                                   1202 ; if text begin with a line number
                                   1203 ; the compiler set count to zero    
                                   1204 ; so code is not interpreted
      008843 72 5D 00 04      [ 1] 1205 	tnz count 
      008847 27 E4            [ 1] 1206 	jreq cmd_line
                                   1207 
                                   1208 ; if direct command 
                                   1209 ; it's ready to interpret 
                                   1210 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1211 ;; This is the interpreter loop
                                   1212 ;; for each BASIC code line. 
                                   1213 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      008849                       1214 interpreter: 
      008849 C6 00 02         [ 1] 1215 	ld a,in 
      00884C C1 00 04         [ 1] 1216 	cp a,count 
      00884F 2B 1D            [ 1] 1217 	jrmi interp_loop
      008851                       1218 next_line:
      008851 72 01 00 21 D7   [ 2] 1219 	btjf flags, #FRUN, cmd_line
      008856 CE 00 05         [ 2] 1220 	ldw x,basicptr
      008859 72 BB 00 01      [ 2] 1221 	addw x,in.w 
      00885D C3 00 1C         [ 2] 1222 	cpw x,txtend 
      008860 2A C8            [ 1] 1223 	jrpl warm_start
      008862 CF 00 05         [ 2] 1224 	ldw basicptr,x ; start of next line  
      008865 E6 02            [ 1] 1225 	ld a,(2,x)
      008867 C7 00 04         [ 1] 1226 	ld count,a 
      00886A 35 03 00 02      [ 1] 1227 	mov in,#3 ; skip first 3 bytes of line 
      00886E                       1228 interp_loop: 
      00886E CD 88 95         [ 4] 1229 	call next_token
      008871 A1 00            [ 1] 1230 	cp a,#TK_NONE 
      008873 27 DC            [ 1] 1231 	jreq next_line 
      008875 A1 80            [ 1] 1232 	cp a,#TK_CMD
      008877 26 03            [ 1] 1233 	jrne 1$
      008879 FD               [ 4] 1234 	call (x) 
      00887A 20 F2            [ 2] 1235 	jra interp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      00887C                       1236 1$:	 
      00887C A1 85            [ 1] 1237 	cp a,#TK_VAR
      00887E 26 05            [ 1] 1238 	jrne 2$
      008880 CD 8E 94         [ 4] 1239 	call let_var  
      008883 20 E9            [ 2] 1240 	jra interp_loop 
      008885                       1241 2$:	
      008885 A1 06            [ 1] 1242 	cp a,#TK_ARRAY 
      008887 26 05            [ 1] 1243 	jrne 3$
      008889 CD 8E 91         [ 4] 1244 	call let_array 
      00888C 20 E0            [ 2] 1245 	jra interp_loop
      00888E                       1246 3$:	
      00888E A1 0B            [ 1] 1247 	cp a,#TK_COLON 
      008890 27 DC            [ 1] 1248 	jreq interp_loop 
      008892 CC 87 A6         [ 2] 1249 	jp syntax_error 
                                   1250 
                                   1251 		
                                   1252 ;--------------------------
                                   1253 ; extract next token from
                                   1254 ; token list 
                                   1255 ; basicptr -> base address 
                                   1256 ; in  -> offset in list array 
                                   1257 ; output:
                                   1258 ;   A 		token attribute
                                   1259 ;   X 		token value if there is one
                                   1260 ;----------------------------------------
      008895                       1261 next_token::
      008895 5F               [ 1] 1262 	clrw x 
      008896 C6 00 02         [ 1] 1263 	ld a,in 
                                   1264 ; don't replace sub by "cp a,count" 
                                   1265 ; if end of line must return with A=0   	
      008899 C0 00 04         [ 1] 1266 	sub a,count 
      00889C 27 51            [ 1] 1267 	jreq 9$ ; end of line 
      00889E                       1268 0$: 
      00889E 55 00 02 00 03   [ 1] 1269 	mov in.saved,in ; in case "_unget_token" needed 
      0088A3 90 CE 00 05      [ 2] 1270 	ldw y,basicptr 
      0088A7 91 D6 01         [ 4] 1271 	ld a,([in.w],y)
      0088AA 72 5C 00 02      [ 1] 1272 	inc in  
      0088AE 4D               [ 1] 1273 	tnz a 
      0088AF 2B 27            [ 1] 1274 	jrmi 6$
      0088B1 A1 06            [ 1] 1275 	cp a,#TK_ARRAY
      0088B3 2A 3A            [ 1] 1276 	jrpl 9$  ; no attribute for these
      0088B5                       1277 1$: ; 
      0088B5 A1 03            [ 1] 1278 	cp a,#TK_CHAR
      0088B7 26 0B            [ 1] 1279 	jrne 2$
      0088B9 41               [ 1] 1280 	exg a,xl
      0088BA 91 D6 01         [ 4] 1281 	ld a,([in.w],y)
      0088BD 72 5C 00 02      [ 1] 1282 	inc in 
      0088C1 41               [ 1] 1283 	exg a,xl  
      0088C2 20 2B            [ 2] 1284 	jra 9$ 
      0088C4 A1 02            [ 1] 1285 2$:	cp a,#TK_QSTR 
      0088C6 26 27            [ 1] 1286 	jrne 9$
      0088C8 93               [ 1] 1287 	ldw x,y 
      0088C9 72 BB 00 01      [ 2] 1288 	addw x,in.w ; pointer to string 
                                   1289 ; move pointer after string 
      0088CD 91 6D 01         [ 4] 1290 3$:	tnz ([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0088D0 27 19            [ 1] 1291 	jreq 8$
      0088D2 72 5C 00 02      [ 1] 1292 	inc in 
      0088D6 20 F5            [ 2] 1293 	jra 3$
      0088D8                       1294 6$: 
      0088D8 72 B9 00 01      [ 2] 1295 	addw y,in.w 
      0088DC 90 FE            [ 2] 1296 	ldw y,(y)
      0088DE A1 84            [ 1] 1297 	cp a,#TK_INTGR
      0088E0 2A 04            [ 1] 1298 	jrpl 7$
      0088E2 90 DE 9E 18      [ 2] 1299 	ldw y,(code_addr,y) 
      0088E6 51               [ 1] 1300 7$:	exgw x,y 
      0088E7 72 5C 00 02      [ 1] 1301 	inc in
      0088EB 72 5C 00 02      [ 1] 1302 8$:	inc in 
      0088EF                       1303 9$: 
      0088EF 81               [ 4] 1304 	ret	
                                   1305 
                                   1306 ;-----------------------------------
                                   1307 ; print a 16 bit integer 
                                   1308 ; using variable 'base' as conversion
                                   1309 ; format.
                                   1310 ; input:
                                   1311 ;   X       integer to print 
                                   1312 ;   'base'    conversion base 
                                   1313 ; output:
                                   1314 ;   none 
                                   1315 ;-----------------------------------
      0088F0                       1316 print_int:
      0088F0 72 5F 00 0C      [ 1] 1317 	clr acc24 
      0088F4 CF 00 0D         [ 2] 1318 	ldw acc16,x 
      0088F7 72 0F 00 0D 04   [ 2] 1319 	btjf acc16,#7,prti24
      0088FC 72 53 00 0C      [ 1] 1320 	cpl acc24 
                                   1321 	
                                   1322 ;------------------------------------
                                   1323 ; print integer in acc24 
                                   1324 ; input:
                                   1325 ;	acc24 		integer to print 
                                   1326 ;	'base' 		numerical base for conversion 
                                   1327 ;   'tab_width' field width 
                                   1328 ;  output:
                                   1329 ;    A          string length
                                   1330 ;------------------------------------
      008900                       1331 prti24:
      008900 CD 89 0C         [ 4] 1332     call itoa  ; conversion entier en  .asciz
      008903 CD A6 89         [ 4] 1333 	call right_align  
      008906 88               [ 1] 1334 	push a 
      008907 CD 9F 0C         [ 4] 1335 	call puts
      00890A 84               [ 1] 1336 	pop a 
      00890B 81               [ 4] 1337     ret	
                                   1338 
                                   1339 ;------------------------------------
                                   1340 ; convert integer in acc24 to string
                                   1341 ; input:
                                   1342 ;   'base'	conversion base 
                                   1343 ;	acc24	integer to convert
                                   1344 ; output:
                                   1345 ;   X  		pointer to first char of string
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1346 ;   A       string length
                                   1347 ;------------------------------------
                           000001  1348 	SIGN=1  ; integer sign 
                           000002  1349 	LEN=2 
                           000003  1350 	PSTR=3
                           000004  1351 	VSIZE=4 ;locals size
      00890C                       1352 itoa::
      00088C                       1353 	_vars VSIZE
      00890C 52 04            [ 2]    1     sub sp,#VSIZE 
      00890E 0F 02            [ 1] 1354 	clr (LEN,sp) ; string length  
      008910 0F 01            [ 1] 1355 	clr (SIGN,sp)    ; sign
      008912 C6 00 0B         [ 1] 1356 	ld a,base 
      008915 A1 0A            [ 1] 1357 	cp a,#10
      008917 26 0A            [ 1] 1358 	jrne 1$
                                   1359 	; base 10 string display with negative sign if bit 23==1
      008919 72 0F 00 0C 05   [ 2] 1360 	btjf acc24,#7,1$
      00891E 03 01            [ 1] 1361 	cpl (SIGN,sp)
      008920 CD 89 D9         [ 4] 1362 	call neg_acc24
      008923                       1363 1$:
                                   1364 ; initialize string pointer 
      008923 AE 16 90         [ 2] 1365 	ldw x,#tib 
      008926 1C 00 50         [ 2] 1366 	addw x,#TIB_SIZE
      008929 5A               [ 2] 1367 	decw x 
      00892A 7F               [ 1] 1368 	clr (x)
      00892B 5A               [ 2] 1369 	decw x 
      00892C A6 20            [ 1] 1370 	ld a,#32
      00892E F7               [ 1] 1371 	ld (x),a
      00892F 0C 02            [ 1] 1372 	inc (LEN,sp)
      008931                       1373 itoa_loop:
      008931 C6 00 0B         [ 1] 1374     ld a,base
      008934 1F 03            [ 2] 1375 	ldw (PSTR,sp),x 
      008936 CD 89 77         [ 4] 1376     call divu24_8 ; acc24/A 
      008939 1E 03            [ 2] 1377 	ldw x,(PSTR,sp)
      00893B AB 30            [ 1] 1378     add a,#'0  ; remainder of division
      00893D A1 3A            [ 1] 1379     cp a,#'9+1
      00893F 2B 02            [ 1] 1380     jrmi 2$
      008941 AB 07            [ 1] 1381     add a,#7 
      008943                       1382 2$:	
      008943 5A               [ 2] 1383 	decw x
      008944 F7               [ 1] 1384     ld (x),a
      008945 0C 02            [ 1] 1385 	inc (LEN,sp)
                                   1386 	; if acc24==0 conversion done
      008947 C6 00 0C         [ 1] 1387 	ld a,acc24
      00894A CA 00 0D         [ 1] 1388 	or a,acc16
      00894D CA 00 0E         [ 1] 1389 	or a,acc8
      008950 26 DF            [ 1] 1390     jrne itoa_loop
                                   1391 	;conversion done, next add '$' or '-' as required
      008952 C6 00 0B         [ 1] 1392 	ld a,base 
      008955 A1 10            [ 1] 1393 	cp a,#16
      008957 27 08            [ 1] 1394 	jreq 8$
      008959 7B 01            [ 1] 1395 	ld a,(SIGN,sp)
      00895B 27 15            [ 1] 1396     jreq 10$
      00895D A6 2D            [ 1] 1397     ld a,#'-
      00895F 20 0D            [ 2] 1398 	jra 9$ 
                                   1399 ; don't print more than 4 digits
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1400 ; in hexadecimal to avoid '-' sign 
                                   1401 ; extend display 	
      008961 7B 02            [ 1] 1402 8$: ld a,(LEN,sp) 
      008963 A1 06            [ 1] 1403 	cp a,#6 
      008965 2B 05            [ 1] 1404 	jrmi 81$
      008967 5C               [ 1] 1405 	incw x
      008968 0A 02            [ 1] 1406 	dec (LEN,sp)
      00896A 20 F5            [ 2] 1407 	jra 8$
      00896C                       1408 81$:	
      00896C A6 24            [ 1] 1409 	ld a,#'$ 
      00896E 5A               [ 2] 1410 9$: decw x
      00896F F7               [ 1] 1411     ld (x),a
      008970 0C 02            [ 1] 1412 	inc (LEN,sp)
      008972                       1413 10$:
      008972 7B 02            [ 1] 1414 	ld a,(LEN,sp)
      0008F4                       1415 	_drop VSIZE
      008974 5B 04            [ 2]    1     addw sp,#VSIZE 
      008976 81               [ 4] 1416 	ret
                                   1417 
                                   1418 ;-------------------------------------
                                   1419 ; divide uint24_t by uint8_t
                                   1420 ; used to convert uint24_t to string
                                   1421 ; input:
                                   1422 ;	acc24	dividend
                                   1423 ;   A 		divisor
                                   1424 ; output:
                                   1425 ;   acc24	quotient
                                   1426 ;   A		remainder
                                   1427 ;------------------------------------- 
                                   1428 ; offset  on sp of arguments and locals
                           000001  1429 	U8   = 1   ; divisor on stack
                           000001  1430 	VSIZE =1
      008977                       1431 divu24_8:
      008977 89               [ 2] 1432 	pushw x ; save x
      008978 88               [ 1] 1433 	push a 
                                   1434 	; ld dividend UU:MM bytes in X
      008979 C6 00 0C         [ 1] 1435 	ld a, acc24
      00897C 95               [ 1] 1436 	ld xh,a
      00897D C6 00 0D         [ 1] 1437 	ld a,acc24+1
      008980 97               [ 1] 1438 	ld xl,a
      008981 7B 01            [ 1] 1439 	ld a,(U8,SP) ; divisor
      008983 62               [ 2] 1440 	div x,a ; UU:MM/U8
      008984 88               [ 1] 1441 	push a  ;save remainder
      008985 9E               [ 1] 1442 	ld a,xh
      008986 C7 00 0C         [ 1] 1443 	ld acc24,a
      008989 9F               [ 1] 1444 	ld a,xl
      00898A C7 00 0D         [ 1] 1445 	ld acc24+1,a
      00898D 84               [ 1] 1446 	pop a
      00898E 95               [ 1] 1447 	ld xh,a
      00898F C6 00 0E         [ 1] 1448 	ld a,acc24+2
      008992 97               [ 1] 1449 	ld xl,a
      008993 7B 01            [ 1] 1450 	ld a,(U8,sp) ; divisor
      008995 62               [ 2] 1451 	div x,a  ; R:LL/U8
      008996 6B 01            [ 1] 1452 	ld (U8,sp),a ; save remainder
      008998 9F               [ 1] 1453 	ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      008999 C7 00 0E         [ 1] 1454 	ld acc24+2,a
      00899C 84               [ 1] 1455 	pop a
      00899D 85               [ 2] 1456 	popw x
      00899E 81               [ 4] 1457 	ret
                                   1458 
                                   1459 ;--------------------------------------
                                   1460 ; unsigned multiply uint24_t by uint8_t
                                   1461 ; use to convert numerical string to uint24_t
                                   1462 ; input:
                                   1463 ;	acc24	uint24_t 
                                   1464 ;   A		uint8_t
                                   1465 ; output:
                                   1466 ;   acc24   A*acc24
                                   1467 ;-------------------------------------
                                   1468 ; local variables offset  on sp
                           000003  1469 	U8   = 3   ; A pushed on stack
                           000002  1470 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1471 	OVFH = 1  ; multiplication overflow high byte
                           000003  1472 	VSIZE = 3
      00899F                       1473 mulu24_8:
      00899F 89               [ 2] 1474 	pushw x    ; save X
                                   1475 	; local variables
      0089A0 88               [ 1] 1476 	push a     ; U8
      0089A1 5F               [ 1] 1477 	clrw x     ; initialize overflow to 0
      0089A2 89               [ 2] 1478 	pushw x    ; multiplication overflow
                                   1479 ; multiply low byte.
      0089A3 C6 00 0E         [ 1] 1480 	ld a,acc24+2
      0089A6 97               [ 1] 1481 	ld xl,a
      0089A7 7B 03            [ 1] 1482 	ld a,(U8,sp)
      0089A9 42               [ 4] 1483 	mul x,a
      0089AA 9F               [ 1] 1484 	ld a,xl
      0089AB C7 00 0E         [ 1] 1485 	ld acc24+2,a
      0089AE 9E               [ 1] 1486 	ld a, xh
      0089AF 6B 02            [ 1] 1487 	ld (OVFL,sp),a
                                   1488 ; multipy middle byte
      0089B1 C6 00 0D         [ 1] 1489 	ld a,acc24+1
      0089B4 97               [ 1] 1490 	ld xl,a
      0089B5 7B 03            [ 1] 1491 	ld a, (U8,sp)
      0089B7 42               [ 4] 1492 	mul x,a
                                   1493 ; add overflow to this partial product
      0089B8 72 FB 01         [ 2] 1494 	addw x,(OVFH,sp)
      0089BB 9F               [ 1] 1495 	ld a,xl
      0089BC C7 00 0D         [ 1] 1496 	ld acc24+1,a
      0089BF 4F               [ 1] 1497 	clr a
      0089C0 A9 00            [ 1] 1498 	adc a,#0
      0089C2 6B 01            [ 1] 1499 	ld (OVFH,sp),a
      0089C4 9E               [ 1] 1500 	ld a,xh
      0089C5 6B 02            [ 1] 1501 	ld (OVFL,sp),a
                                   1502 ; multiply most signficant byte	
      0089C7 C6 00 0C         [ 1] 1503 	ld a, acc24
      0089CA 97               [ 1] 1504 	ld xl, a
      0089CB 7B 03            [ 1] 1505 	ld a, (U8,sp)
      0089CD 42               [ 4] 1506 	mul x,a
      0089CE 72 FB 01         [ 2] 1507 	addw x, (OVFH,sp)
      0089D1 9F               [ 1] 1508 	ld a, xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0089D2 C7 00 0C         [ 1] 1509 	ld acc24,a
      0089D5 5B 03            [ 2] 1510     addw sp,#VSIZE
      0089D7 85               [ 2] 1511 	popw x
      0089D8 81               [ 4] 1512 	ret
                                   1513 
                                   1514 ;------------------------------------
                                   1515 ;  two's complement acc24
                                   1516 ;  input:
                                   1517 ;		acc24 variable
                                   1518 ;  output:
                                   1519 ;		acc24 variable
                                   1520 ;-------------------------------------
      0089D9                       1521 neg_acc24:
      0089D9 72 53 00 0E      [ 1] 1522 	cpl acc24+2
      0089DD 72 53 00 0D      [ 1] 1523 	cpl acc24+1
      0089E1 72 53 00 0C      [ 1] 1524 	cpl acc24
      0089E5 A6 01            [ 1] 1525 	ld a,#1
      0089E7 CB 00 0E         [ 1] 1526 	add a,acc24+2
      0089EA C7 00 0E         [ 1] 1527 	ld acc24+2,a
      0089ED 4F               [ 1] 1528 	clr a
      0089EE C9 00 0D         [ 1] 1529 	adc a,acc24+1
      0089F1 C7 00 0D         [ 1] 1530 	ld acc24+1,a 
      0089F4 4F               [ 1] 1531 	clr a 
      0089F5 C9 00 0C         [ 1] 1532 	adc a,acc24 
      0089F8 C7 00 0C         [ 1] 1533 	ld acc24,a 
      0089FB 81               [ 4] 1534 	ret
                                   1535 
                                   1536 
                                   1537 
                                   1538 
                                   1539 ;------------------------------------
                                   1540 ; convert alpha to uppercase
                                   1541 ; input:
                                   1542 ;    a  character to convert
                                   1543 ; output:
                                   1544 ;    a  uppercase character
                                   1545 ;------------------------------------
      0089FC                       1546 to_upper::
      0089FC A1 61            [ 1] 1547 	cp a,#'a
      0089FE 2A 01            [ 1] 1548 	jrpl 1$
      008A00 81               [ 4] 1549 0$:	ret
      008A01 A1 7A            [ 1] 1550 1$: cp a,#'z	
      008A03 22 FB            [ 1] 1551 	jrugt 0$
      008A05 A0 20            [ 1] 1552 	sub a,#32
      008A07 81               [ 4] 1553 	ret
                                   1554 	
                                   1555 ;------------------------------------
                                   1556 ; convert pad content in integer
                                   1557 ; input:
                                   1558 ;    x		.asciz to convert
                                   1559 ; output:
                                   1560 ;    acc24      int24_t
                                   1561 ;------------------------------------
                                   1562 	; local variables
                           000001  1563 	SIGN=1 ; 1 byte, 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                           000002  1564 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  1565 	TEMP=3 ; 1 byte, temporary storage
                           000003  1566 	VSIZE=3 ; 3 bytes reserved for local storage
      008A08                       1567 atoi24::
      008A08 89               [ 2] 1568 	pushw x 
      000989                       1569 	_vars VSIZE
      008A09 52 03            [ 2]    1     sub sp,#VSIZE 
                                   1570 	; acc24=0 
      008A0B 72 5F 00 0C      [ 1] 1571 	clr acc24    
      008A0F 72 5F 00 0D      [ 1] 1572 	clr acc16
      008A13 72 5F 00 0E      [ 1] 1573 	clr acc8 
      008A17 0F 01            [ 1] 1574 	clr (SIGN,sp)
      008A19 A6 0A            [ 1] 1575 	ld a,#10
      008A1B 6B 02            [ 1] 1576 	ld (BASE,sp),a ; default base decimal
      008A1D F6               [ 1] 1577 	ld a,(x)
      008A1E 27 47            [ 1] 1578 	jreq 9$  ; completed if 0
      008A20 A1 2D            [ 1] 1579 	cp a,#'-
      008A22 26 04            [ 1] 1580 	jrne 1$
      008A24 03 01            [ 1] 1581 	cpl (SIGN,sp)
      008A26 20 08            [ 2] 1582 	jra 2$
      008A28 A1 24            [ 1] 1583 1$: cp a,#'$
      008A2A 26 06            [ 1] 1584 	jrne 3$
      008A2C A6 10            [ 1] 1585 	ld a,#16
      008A2E 6B 02            [ 1] 1586 	ld (BASE,sp),a
      008A30 5C               [ 1] 1587 2$:	incw x
      008A31 F6               [ 1] 1588 	ld a,(x)
      008A32                       1589 3$:	
      008A32 A1 61            [ 1] 1590 	cp a,#'a
      008A34 2B 02            [ 1] 1591 	jrmi 4$
      008A36 A0 20            [ 1] 1592 	sub a,#32
      008A38 A1 30            [ 1] 1593 4$:	cp a,#'0
      008A3A 2B 2B            [ 1] 1594 	jrmi 9$
      008A3C A0 30            [ 1] 1595 	sub a,#'0
      008A3E A1 0A            [ 1] 1596 	cp a,#10
      008A40 2B 06            [ 1] 1597 	jrmi 5$
      008A42 A0 07            [ 1] 1598 	sub a,#7
      008A44 11 02            [ 1] 1599 	cp a,(BASE,sp)
      008A46 2A 1F            [ 1] 1600 	jrpl 9$
      008A48 6B 03            [ 1] 1601 5$:	ld (TEMP,sp),a
      008A4A 7B 02            [ 1] 1602 	ld a,(BASE,sp)
      008A4C CD 89 9F         [ 4] 1603 	call mulu24_8
      008A4F 7B 03            [ 1] 1604 	ld a,(TEMP,sp)
      008A51 CB 00 0E         [ 1] 1605 	add a,acc24+2
      008A54 C7 00 0E         [ 1] 1606 	ld acc24+2,a
      008A57 4F               [ 1] 1607 	clr a
      008A58 C9 00 0D         [ 1] 1608 	adc a,acc24+1
      008A5B C7 00 0D         [ 1] 1609 	ld acc24+1,a
      008A5E 4F               [ 1] 1610 	clr a
      008A5F C9 00 0C         [ 1] 1611 	adc a,acc24
      008A62 C7 00 0C         [ 1] 1612 	ld acc24,a
      008A65 20 C9            [ 2] 1613 	jra 2$
      008A67 0D 01            [ 1] 1614 9$:	tnz (SIGN,sp)
      008A69 27 03            [ 1] 1615     jreq atoi_exit
      008A6B CD 89 D9         [ 4] 1616     call neg_acc24
      008A6E                       1617 atoi_exit: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0009EE                       1618 	_drop VSIZE
      008A6E 5B 03            [ 2]    1     addw sp,#VSIZE 
      008A70 85               [ 2] 1619 	popw x ; restore x
      008A71 81               [ 4] 1620 	ret
                                   1621 
                                   1622 
                                   1623 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1624 ;;   TINY BASIC  operators,
                                   1625 ;;   commands and functions 
                                   1626 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1627 
                                   1628 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1629 ;;  Arithmetic operators
                                   1630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1631 
                                   1632 ;debug support
                           000001  1633 DEBUG_PRT=1
                           000001  1634 .if DEBUG_PRT 
                           000001  1635 	REGA=1
                           000002  1636 	SAVEB=2
                           000003  1637 	REGX=3
                           000005  1638 	REGY=5
                           000007  1639 	ACC24=7
                           000009  1640 	VSIZE=9 
      008A72                       1641 printxy:
      0009F2                       1642 	_vars VSIZE 
      008A72 52 09            [ 2]    1     sub sp,#VSIZE 
      008A74 6B 01            [ 1] 1643 	ld (REGA,sp),a 
      008A76 C6 00 0B         [ 1] 1644 	ld a,base 
      008A79 6B 02            [ 1] 1645 	ld (SAVEB,sp),a
      008A7B 1F 03            [ 2] 1646 	ldw (REGX,sp),x
      008A7D 17 05            [ 2] 1647 	ldw (REGY,sp),y
      008A7F CE 00 0C         [ 2] 1648 	ldw x,acc24 
      008A82 C6 00 0E         [ 1] 1649 	ld a,acc8 
      008A85 1F 07            [ 2] 1650 	ldw (ACC24,sp),x 
      008A87 6B 09            [ 1] 1651 	ld (ACC24+2,sp),a 
      008A89 35 10 00 0B      [ 1] 1652 	mov base,#16 
      008A8D 5F               [ 1] 1653 	clrw x 
      008A8E 7B 01            [ 1] 1654 	ld a,(REGA,sp)
      008A90 97               [ 1] 1655 	ld xl,a 
      008A91 CD 88 F0         [ 4] 1656 	call print_int
      008A94 A6 20            [ 1] 1657 	ld a,#SPACE 
      008A96 CD 83 32         [ 4] 1658 	call putc  
      008A99 1E 03            [ 2] 1659 	ldw x,(REGX,sp)
      008A9B CD 88 F0         [ 4] 1660 	call print_int 
      008A9E A6 20            [ 1] 1661 	ld a,#SPACE 
      008AA0 CD 83 32         [ 4] 1662 	call putc  
      008AA3 1E 05            [ 2] 1663 	ldw x,(REGY,sp)
      008AA5 CD 88 F0         [ 4] 1664 	call print_int 
      008AA8 A6 0D            [ 1] 1665 	ld a,#CR 
      008AAA CD 83 32         [ 4] 1666 	call putc 
      008AAD 7B 09            [ 1] 1667 	ld a,(ACC24+2,sp)
      008AAF 1E 07            [ 2] 1668 	ldw x,(ACC24,sp)
      008AB1 CF 00 0C         [ 2] 1669 	ldw acc24,x 
      008AB4 C7 00 0E         [ 1] 1670 	ld acc8,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008AB7 7B 02            [ 1] 1671 	ld a,(SAVEB,sp)
      008AB9 C7 00 0B         [ 1] 1672 	ld base,a 
      008ABC 7B 01            [ 1] 1673 	ld a,(REGA,sp)
      008ABE 1E 03            [ 2] 1674 	ldw x,(REGX,sp)
      008AC0 16 05            [ 2] 1675 	ldw y,(REGY,sp)
      000A42                       1676 	_drop VSIZE 
      008AC2 5B 09            [ 2]    1     addw sp,#VSIZE 
      008AC4 81               [ 4] 1677 	ret 
                                   1678 .endif 
                                   1679 
                                   1680 
                                   1681 ;--------------------------------------
                                   1682 ;  multiply 2 uint16_t return uint32_t
                                   1683 ;  input:
                                   1684 ;     x       uint16_t 
                                   1685 ;     y       uint16_t 
                                   1686 ;  output:
                                   1687 ;     x       product bits 15..0
                                   1688 ;     y       product bits 31..16 
                                   1689 ;---------------------------------------
                           000001  1690 		U1=1  ; uint16_t 
                           000003  1691 		DBL=3 ; uint32_t
                           000006  1692 		VSIZE=6
      008AC5                       1693 umstar:
      000A45                       1694 	_vars VSIZE 
      008AC5 52 06            [ 2]    1     sub sp,#VSIZE 
      008AC7 1F 01            [ 2] 1695 	ldw (U1,sp),x 
                                   1696 ;initialize bits 31..16 of 
                                   1697 ;product to zero 
      008AC9 0F 03            [ 1] 1698 	clr (DBL,sp)
      008ACB 0F 04            [ 1] 1699 	clr (DBL+1,sp)
                                   1700 ; produc U1L*U2L 
      008ACD 90 9F            [ 1] 1701 	ld a,yl 
      008ACF 42               [ 4] 1702 	mul x,a 
      008AD0 1F 05            [ 2] 1703 	ldw (DBL+2,sp),x
                                   1704 ; product U1H*U2L 
      008AD2 7B 01            [ 1] 1705 	ld a,(U1,sp) ; xh 
      008AD4 93               [ 1] 1706 	ldw x,y
      008AD5 42               [ 4] 1707 	mul x,a 
      008AD6 4F               [ 1] 1708 	clr a 
      008AD7 72 FB 04         [ 2] 1709 	addw x,(DBL+1,sp) 
      008ADA 4F               [ 1] 1710 	clr a 
      008ADB 19 03            [ 1] 1711 	adc a,(DBL,sp) 
      008ADD 6B 03            [ 1] 1712 	ld (DBL,sp),a ; bits 23..17 
      008ADF 1F 04            [ 2] 1713 	ldw (DBL+1,sp),x ; bits 15..0 
                                   1714 ; product U1L*U2H
      008AE1 90 5E            [ 1] 1715 	swapw y 
      008AE3 93               [ 1] 1716 	ldw x,y
      008AE4 7B 02            [ 1] 1717 	ld a,(U1+1,sp)
      008AE6 42               [ 4] 1718 	mul x,a
      008AE7 72 FB 04         [ 2] 1719 	addw x,(DBL+1,sp)
      008AEA 4F               [ 1] 1720 	clr a 
      008AEB 19 03            [ 1] 1721 	adc a,(DBL,sp)
      008AED 6B 03            [ 1] 1722 	ld (DBL,sp),a 
      008AEF 1F 04            [ 2] 1723 	ldw (DBL+1,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1724 ; product U1H*U2H 	
      008AF1 7B 01            [ 1] 1725 	ld a,(U1,sp)
      008AF3 93               [ 1] 1726 	ldw x,y  
      008AF4 42               [ 4] 1727 	mul x,a 
      008AF5 72 FB 03         [ 2] 1728 	addw x,(DBL,sp)
      008AF8 90 93            [ 1] 1729 	ldw y,x 
      008AFA 1E 05            [ 2] 1730 	ldw x,(DBL+2,sp)
      000A7C                       1731 	_drop VSIZE 
      008AFC 5B 06            [ 2]    1     addw sp,#VSIZE 
      008AFE 81               [ 4] 1732 	ret
                                   1733 
                                   1734 
                                   1735 ;-------------------------------------
                                   1736 ; multiply 2 integers
                                   1737 ; input:
                                   1738 ;  	x       n1 
                                   1739 ;   y 		n2 
                                   1740 ; output:
                                   1741 ;	X        N1*N2 bits 15..0
                                   1742 ;   Y        N1*N2 bits 31..16 
                                   1743 ;-------------------------------------
                           000001  1744 	SIGN=1
                           000001  1745 	VSIZE=1
      008AFF                       1746 multiply:
      000A7F                       1747 	_vars VSIZE 
      008AFF 52 01            [ 2]    1     sub sp,#VSIZE 
      008B01 0F 01            [ 1] 1748 	clr (SIGN,sp)
      008B03 9E               [ 1] 1749 	ld a,xh 
      008B04 A4 80            [ 1] 1750 	and a,#0x80
      008B06 2A 03            [ 1] 1751 	jrpl 1$
      008B08 03 01            [ 1] 1752 	cpl (SIGN,sp)
      008B0A 50               [ 2] 1753 	negw x 
      008B0B                       1754 1$:	
      008B0B 90 9E            [ 1] 1755 	ld a,yh
      008B0D A4 80            [ 1] 1756 	and a,#0x80  
      008B0F 2A 04            [ 1] 1757 	jrpl 2$ 
      008B11 03 01            [ 1] 1758 	cpl (SIGN,sp)
      008B13 90 50            [ 2] 1759 	negw y 
      008B15                       1760 2$:	
      008B15 CD 8A C5         [ 4] 1761 	call umstar
      008B18 7B 01            [ 1] 1762 	ld a,(SIGN,sp)
      008B1A 27 03            [ 1] 1763 	jreq 3$
      008B1C CD 8B 4C         [ 4] 1764 	call dneg 
      008B1F                       1765 3$:	
      000A9F                       1766 	_drop VSIZE 
      008B1F 5B 01            [ 2]    1     addw sp,#VSIZE 
      008B21 81               [ 4] 1767 	ret
                                   1768 
                                   1769 ;--------------------------------------
                                   1770 ; divide uint32_t/uint16_t
                                   1771 ; return:  quotient and remainder 
                                   1772 ; quotient expected to be uint16_t 
                                   1773 ; input:
                                   1774 ;   DBLDIVDND    on stack 
                                   1775 ;   X            divisor 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1776 ; output:
                                   1777 ;   X            quotient 
                                   1778 ;   Y            remainder 
                                   1779 ;---------------------------------------
                           000003  1780 	VSIZE=3
      008B22                       1781 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000AA2                       1782 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   1783 	; local variables 
                           000001  1784 	DIVISOR=1 
                           000003  1785 	CNTR=3 
      000AA2                       1786 udiv32_16:
      000AA2                       1787 	_vars VSIZE 
      008B22 52 03            [ 2]    1     sub sp,#VSIZE 
      008B24 1F 01            [ 2] 1788 	ldw (DIVISOR,sp),x	; save divisor 
      008B26 1E 08            [ 2] 1789 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008B28 16 06            [ 2] 1790 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008B2A 90 5D            [ 2] 1791 	tnzw y
      008B2C 26 06            [ 1] 1792 	jrne long_division 
      008B2E 16 01            [ 2] 1793 	ldw y,(DIVISOR,sp)
      008B30 65               [ 2] 1794 	divw x,y
      000AB1                       1795 	_drop VSIZE 
      008B31 5B 03            [ 2]    1     addw sp,#VSIZE 
      008B33 81               [ 4] 1796 	ret
      008B34                       1797 long_division:
      008B34 51               [ 1] 1798 	exgw x,y ; hi in x, lo in y 
      008B35 A6 11            [ 1] 1799 	ld a,#17 
      008B37 6B 03            [ 1] 1800 	ld (CNTR,sp),a
      008B39                       1801 1$:
      008B39 13 01            [ 2] 1802 	cpw x,(DIVISOR,sp)
      008B3B 2B 03            [ 1] 1803 	jrmi 2$
      008B3D 72 F0 01         [ 2] 1804 	subw x,(DIVISOR,sp)
      008B40 8C               [ 1] 1805 2$:	ccf 
      008B41 90 59            [ 2] 1806 	rlcw y 
      008B43 59               [ 2] 1807 	rlcw x 
      008B44 0A 03            [ 1] 1808 	dec (CNTR,sp)
      008B46 26 F1            [ 1] 1809 	jrne 1$
      008B48 51               [ 1] 1810 	exgw x,y 
      000AC9                       1811 	_drop VSIZE 
      008B49 5B 03            [ 2]    1     addw sp,#VSIZE 
      008B4B 81               [ 4] 1812 	ret
                                   1813 
                                   1814 ;-----------------------------
                                   1815 ; negate double int.
                                   1816 ; input:
                                   1817 ;   x     bits 15..0
                                   1818 ;   y     bits 31..16
                                   1819 ; output: 
                                   1820 ;   x     bits 15..0
                                   1821 ;   y     bits 31..16
                                   1822 ;-----------------------------
      008B4C                       1823 dneg:
      008B4C 53               [ 2] 1824 	cplw x 
      008B4D 90 53            [ 2] 1825 	cplw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B4F 1C 00 01         [ 2] 1826 	addw x,#1 
      008B52 24 02            [ 1] 1827 	jrnc 1$
      008B54 90 5C            [ 1] 1828 	incw y 
      008B56 81               [ 4] 1829 1$: ret 
                                   1830 
                                   1831 
                                   1832 ;--------------------------------
                                   1833 ; sign extend single to double
                                   1834 ; input:
                                   1835 ;   x    int16_t
                                   1836 ; output:
                                   1837 ;   x    int32_t bits 15..0
                                   1838 ;   y    int32_t bits 31..16
                                   1839 ;--------------------------------
      008B57                       1840 dbl_sign_extend:
      008B57 90 5F            [ 1] 1841 	clrw y
      008B59 9E               [ 1] 1842 	ld a,xh 
      008B5A A4 80            [ 1] 1843 	and a,#0x80 
      008B5C 27 02            [ 1] 1844 	jreq 1$
      008B5E 90 53            [ 2] 1845 	cplw y
      008B60 81               [ 4] 1846 1$: ret 	
                                   1847 
                                   1848 
                                   1849 ;----------------------------------
                                   1850 ;  euclidian divide dbl/n1 
                                   1851 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   1852 ; input:
                                   1853 ;    dbl    int32_t on stack 
                                   1854 ;    x 		n1   int16_t  disivor  
                                   1855 ; output:
                                   1856 ;    X      dbl/x  int16_t 
                                   1857 ;    Y      remainder int16_t 
                                   1858 ;----------------------------------
                           000008  1859 	VSIZE=8
      008B61                       1860 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000AE1                       1861 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000AE1                       1862 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   1863 	; local variables
                           000001  1864 	DBLHI=1
                           000003  1865 	DBLLO=3 
                           000005  1866 	SDIVSR=5 ; sign divisor
                           000006  1867 	SQUOT=6 ; sign dividend 
                           000007  1868 	DIVISR=7 ; divisor 
      000AE1                       1869 div32_16:
      000AE1                       1870 	_vars VSIZE 
      008B61 52 08            [ 2]    1     sub sp,#VSIZE 
      008B63 0F 05            [ 1] 1871 	clr (SDIVSR,sp)
      008B65 0F 06            [ 1] 1872 	clr (SQUOT,sp)
                                   1873 ; copy arguments 
      008B67 16 0B            [ 2] 1874 	ldw y,(DIVDNDHI,sp)
      008B69 17 01            [ 2] 1875 	ldw (DBLHI,sp),y
      008B6B 16 0D            [ 2] 1876 	ldw y,(DIVDNDLO,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B6D 17 03            [ 2] 1877 	ldw (DBLLO,sp),y 
                                   1878 ; check for 0 divisor
      008B6F 5D               [ 2] 1879 	tnzw x 
      008B70 26 05            [ 1] 1880     jrne 0$
      008B72 A6 04            [ 1] 1881 	ld a,#ERR_DIV0 
      008B74 CC 87 A8         [ 2] 1882 	jp tb_error 
                                   1883 ; check divisor sign 	
      008B77 9E               [ 1] 1884 0$:	ld a,xh 
      008B78 A4 80            [ 1] 1885 	and a,#0x80 
      008B7A 27 05            [ 1] 1886 	jreq 1$
      008B7C 03 05            [ 1] 1887 	cpl (SDIVSR,sp)
      008B7E 03 06            [ 1] 1888 	cpl (SQUOT,sp)
      008B80 50               [ 2] 1889 	negw x
      008B81 1F 07            [ 2] 1890 1$:	ldw (DIVISR,sp),x
                                   1891 ; check dividend sign 	 
      008B83 7B 01            [ 1] 1892  	ld a,(DBLHI,sp) 
      008B85 A4 80            [ 1] 1893 	and a,#0x80 
      008B87 27 0D            [ 1] 1894 	jreq 2$ 
      008B89 03 06            [ 1] 1895 	cpl (SQUOT,sp)
      008B8B 1E 03            [ 2] 1896 	ldw x,(DBLLO,sp)
      008B8D 16 01            [ 2] 1897 	ldw y,(DBLHI,sp)
      008B8F CD 8B 4C         [ 4] 1898 	call dneg 
      008B92 1F 03            [ 2] 1899 	ldw (DBLLO,sp),x 
      008B94 17 01            [ 2] 1900 	ldw (DBLHI,sp),y 
      008B96 1E 07            [ 2] 1901 2$:	ldw x,(DIVISR,sp)
      008B98 CD 8B 22         [ 4] 1902 	call udiv32_16
      008B9B 90 5D            [ 2] 1903 	tnzw y 
      008B9D 27 11            [ 1] 1904 	jreq 3$ 
                                   1905 ; x=quotient 
                                   1906 ; y=remainder 
                                   1907 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008B9F 7B 06            [ 1] 1908 	ld a,(SQUOT,sp)
      008BA1 18 05            [ 1] 1909 	xor a,(SDIVSR,sp)
      008BA3 27 0B            [ 1] 1910 	jreq 3$
      008BA5 5C               [ 1] 1911 	incw x 
      008BA6 90 CF 00 0D      [ 2] 1912 	ldw acc16,y 
      008BAA 16 07            [ 2] 1913 	ldw y,(DIVISR,sp)
      008BAC 72 B2 00 0D      [ 2] 1914 	subw y,acc16
                                   1915 ; sign quotient
      008BB0 7B 06            [ 1] 1916 3$:	ld a,(SQUOT,sp)
      008BB2 27 01            [ 1] 1917 	jreq 4$
      008BB4 50               [ 2] 1918 	negw x 
      008BB5                       1919 4$:	
      000B35                       1920 	_drop VSIZE 
      008BB5 5B 08            [ 2]    1     addw sp,#VSIZE 
      008BB7 81               [ 4] 1921 	ret 
                                   1922 
                                   1923 
                                   1924 
                                   1925 ;----------------------------------
                                   1926 ; division x/y 
                                   1927 ; input:
                                   1928 ;    X       dividend
                                   1929 ;    Y       divisor 
                                   1930 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1931 ;    X       quotient
                                   1932 ;    Y       remainder 
                                   1933 ;-----------------------------------
                           000004  1934 	VSIZE=4 
                                   1935 	; local variables 
                           000001  1936 	DBLHI=1
                           000003  1937 	DBLLO=3
      008BB8                       1938 divide: 
      000B38                       1939 	_vars VSIZE 
      008BB8 52 04            [ 2]    1     sub sp,#VSIZE 
      008BBA 90 CF 00 0D      [ 2] 1940 	ldw acc16,y
      008BBE CD 8B 57         [ 4] 1941 	call dbl_sign_extend
      008BC1 1F 03            [ 2] 1942 	ldw (DBLLO,sp),x 
      008BC3 17 01            [ 2] 1943 	ldw (DBLHI,sp),y 
      008BC5 CE 00 0D         [ 2] 1944 	ldw x,acc16 
      008BC8 CD 8B 61         [ 4] 1945 	call div32_16 
      000B4B                       1946 	_drop VSIZE 
      008BCB 5B 04            [ 2]    1     addw sp,#VSIZE 
      008BCD 81               [ 4] 1947 	ret
                                   1948 
                                   1949 
                                   1950 ;----------------------------------
                                   1951 ;  remainder resulting from euclidian 
                                   1952 ;  division of x/y 
                                   1953 ; input:
                                   1954 ;   x   	dividend int16_t 
                                   1955 ;   y 		divisor int16_t
                                   1956 ; output:
                                   1957 ;   X       n1%n2 
                                   1958 ;----------------------------------
      008BCE                       1959 modulo:
      008BCE CD 8B B8         [ 4] 1960 	call divide
      008BD1 93               [ 1] 1961 	ldw x,y 
      008BD2 81               [ 4] 1962 	ret 
                                   1963 
                                   1964 ;----------------------------------
                                   1965 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   1966 ; return expr1*expr2/expr3 
                                   1967 ; product result is int32_t and 
                                   1968 ; divisiont is int32_t/int16_t
                                   1969 ;----------------------------------
                           000004  1970 	DBL_SIZE=4 
      008BD3                       1971 muldiv:
      008BD3 CD 8C 49         [ 4] 1972 	call func_args 
      008BD6 A1 03            [ 1] 1973 	cp a,#3 
      008BD8 27 03            [ 1] 1974 	jreq 1$
      008BDA CC 87 A6         [ 2] 1975 	jp syntax_error
      008BDD                       1976 1$: 
      008BDD 1E 05            [ 2] 1977 	ldw x,(5,sp) ; expr1
      008BDF 16 03            [ 2] 1978 	ldw y,(3,sp) ; expr2
      008BE1 CD 8A FF         [ 4] 1979 	call multiply 
      008BE4 1F 05            [ 2] 1980 	ldw (5,sp),x  ;int32_t 15..0
      008BE6 17 03            [ 2] 1981 	ldw (3,sp),y  ;int32_t 31..16
      008BE8 85               [ 2] 1982 	popw x        ; expr3 
      008BE9 CD 8B 61         [ 4] 1983 	call div32_16 ; int32_t/expr3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      000B6C                       1984 	_drop DBL_SIZE
      008BEC 5B 04            [ 2]    1     addw sp,#DBL_SIZE 
      008BEE 81               [ 4] 1985 	ret 
                                   1986 
                                   1987 
                                   1988 ;---------------------------------
                                   1989 ; dictionary search 
                                   1990 ; input:
                                   1991 ;	X 		dictionary entry point, name field  
                                   1992 ;   y		.asciz name to search 
                                   1993 ; output:
                                   1994 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   1995 ;  X		cmd_index
                                   1996 ;---------------------------------
                           000001  1997 	NLEN=1 ; cmd length 
                           000002  1998 	XSAVE=2
                           000004  1999 	YSAVE=4
                           000005  2000 	VSIZE=5 
      008BEF                       2001 search_dict::
      000B6F                       2002 	_vars VSIZE 
      008BEF 52 05            [ 2]    1     sub sp,#VSIZE 
                                   2003 
      008BF1 17 04            [ 2] 2004 	ldw (YSAVE,sp),y 
      008BF3                       2005 search_next:
      008BF3 1F 02            [ 2] 2006 	ldw (XSAVE,sp),x 
                                   2007 ; get name length in dictionary	
      008BF5 F6               [ 1] 2008 	ld a,(x)
      008BF6 A4 0F            [ 1] 2009 	and a,#0xf 
      008BF8 6B 01            [ 1] 2010 	ld (NLEN,sp),a  
      008BFA 16 04            [ 2] 2011 	ldw y,(YSAVE,sp) ; name pointer 
      008BFC 5C               [ 1] 2012 	incw x 
      008BFD                       2013 cp_loop:
      008BFD 90 F6            [ 1] 2014 	ld a,(y)
      008BFF 27 1B            [ 1] 2015 	jreq str_match 
      008C01 0D 01            [ 1] 2016 	tnz (NLEN,sp)
      008C03 27 0A            [ 1] 2017 	jreq no_match  
      008C05 F1               [ 1] 2018 	cp a,(x)
      008C06 26 07            [ 1] 2019 	jrne no_match 
      008C08 90 5C            [ 1] 2020 	incw y 
      008C0A 5C               [ 1] 2021 	incw x
      008C0B 0A 01            [ 1] 2022 	dec (NLEN,sp)
      008C0D 20 EE            [ 2] 2023 	jra cp_loop 
      008C0F                       2024 no_match:
      008C0F 1E 02            [ 2] 2025 	ldw x,(XSAVE,sp) 
      008C11 1D 00 02         [ 2] 2026 	subw x,#2 ; move X to link field
      008C14 4B 00            [ 1] 2027 	push #TK_NONE 
      008C16 FE               [ 2] 2028 	ldw x,(x) ; next word link 
      008C17 84               [ 1] 2029 	pop a ; TK_NONE 
      008C18 27 1F            [ 1] 2030 	jreq search_exit  ; not found  
                                   2031 ;try next 
      008C1A 20 D7            [ 2] 2032 	jra search_next
      008C1C                       2033 str_match:
      008C1C 1E 02            [ 2] 2034 	ldw x,(XSAVE,sp)
      008C1E F6               [ 1] 2035 	ld a,(X)
      008C1F 6B 01            [ 1] 2036 	ld (NLEN,sp),a ; needed to test keyword type  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C21 A4 0F            [ 1] 2037 	and a,#0xf 
                                   2038 ; move x to procedure address field 	
      008C23 4C               [ 1] 2039 	inc a 
      008C24 C7 00 0E         [ 1] 2040 	ld acc8,a 
      008C27 72 5F 00 0D      [ 1] 2041 	clr acc16 
      008C2B 72 BB 00 0D      [ 2] 2042 	addw x,acc16 
      008C2F FE               [ 2] 2043 	ldw x,(x) ; routine index  
                                   2044 ;determine keyword type bits 7:6 
      008C30 7B 01            [ 1] 2045 	ld a,(NLEN,sp)
      008C32 4E               [ 1] 2046 	swap a 
      008C33 A4 0C            [ 1] 2047 	and a,#0xc
      008C35 44               [ 1] 2048 	srl a
      008C36 44               [ 1] 2049 	srl a 
      008C37 AB 80            [ 1] 2050 	add a,#128
      008C39                       2051 search_exit: 
      000BB9                       2052 	_drop VSIZE 	 
      008C39 5B 05            [ 2]    1     addw sp,#VSIZE 
      008C3B 81               [ 4] 2053 	ret 
                                   2054 
                                   2055 ;---------------------
                                   2056 ; check if next token
                                   2057 ;  is of expected type 
                                   2058 ; input:
                                   2059 ;   A 		 expected token attribute
                                   2060 ;  ouput:
                                   2061 ;   none     if fail call syntax_error 
                                   2062 ;--------------------
      008C3C                       2063 expect:
      008C3C 88               [ 1] 2064 	push a 
      008C3D CD 88 95         [ 4] 2065 	call next_token 
      008C40 11 01            [ 1] 2066 	cp a,(1,sp)
      008C42 27 03            [ 1] 2067 	jreq 1$
      008C44 CC 87 A6         [ 2] 2068 	jp syntax_error
      008C47 84               [ 1] 2069 1$: pop a 
      008C48 81               [ 4] 2070 	ret 
                                   2071 
                                   2072 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2073 ; parse arguments list 
                                   2074 ; between ()
                                   2075 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      008C49                       2076 func_args:
      008C49 A6 07            [ 1] 2077 	ld a,#TK_LPAREN 
      008C4B CD 8C 3C         [ 4] 2078 	call expect 
                                   2079 ; expected to continue in arg_list 
                                   2080 ; caller must check for TK_RPAREN 
                                   2081 
                                   2082 ;-------------------------------
                                   2083 ; parse embedded BASIC routines 
                                   2084 ; arguments list.
                                   2085 ; arg_list::=  rel[','rel]*
                                   2086 ; all arguments are of integer type
                                   2087 ; and pushed on stack 
                                   2088 ; input:
                                   2089 ;   none
                                   2090 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2091 ;   stack{n}   arguments pushed on stack
                                   2092 ;   A 	number of arguments pushed on stack  
                                   2093 ;--------------------------------
      008C4E                       2094 arg_list:
      008C4E 4B 00            [ 1] 2095 	push #0  
      008C50 CD 8D 96         [ 4] 2096 1$: call relation
      008C53 A1 00            [ 1] 2097 	cp a,#TK_NONE 
      008C55 27 20            [ 1] 2098 	jreq 5$
      008C57 A1 84            [ 1] 2099 	cp a,#TK_INTGR
      008C59 26 13            [ 1] 2100 	jrne 4$
      008C5B                       2101 3$: 
                                   2102 ; swap return address with argument
      008C5B 84               [ 1] 2103 	pop a ; arg_count
      008C5C 90 85            [ 2] 2104 	popw y ; return address 
      008C5E 89               [ 2] 2105 	pushw x ; new argument 
      008C5F 90 89            [ 2] 2106 	pushw y 
      008C61 4C               [ 1] 2107     inc a
      008C62 88               [ 1] 2108 	push a 
      008C63 CD 88 95         [ 4] 2109 	call next_token 
      008C66 A1 09            [ 1] 2110 	cp a,#TK_COMMA 
      008C68 27 E6            [ 1] 2111 	jreq 1$ 
      008C6A A1 00            [ 1] 2112 	cp a,#TK_NONE 
      008C6C 27 09            [ 1] 2113 	jreq 5$ 
      008C6E A1 08            [ 1] 2114 4$:	cp a,#TK_RPAREN 
      008C70 27 05            [ 1] 2115 	jreq 5$
      000BF2                       2116 	_unget_token 
      008C72 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      008C77 84               [ 1] 2117 5$:	pop a  
      008C78 81               [ 4] 2118 	ret 
                                   2119 
                                   2120 ;--------------------------------
                                   2121 ;   BASIC commnands 
                                   2122 ;--------------------------------
                                   2123 
                                   2124 ;--------------------------------
                                   2125 ;  arithmetic and relational 
                                   2126 ;  routines
                                   2127 ;  operators precedence
                                   2128 ;  highest to lowest
                                   2129 ;  operators on same row have 
                                   2130 ;  same precedence and are executed
                                   2131 ;  from left to right.
                                   2132 ;	'*','/','%'
                                   2133 ;   '-','+'
                                   2134 ;   '=','>','<','>=','<=','<>','><'
                                   2135 ;   '<>' and '><' are equivalent for not equal.
                                   2136 ;--------------------------------
                                   2137 
                                   2138 ;---------------------
                                   2139 ; return array element
                                   2140 ; address from @(expr)
                                   2141 ; input:
                                   2142 ;   A 		TK_ARRAY
                                   2143 ; output:
                                   2144 ;   A 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2145 ;	X 		element address 
                                   2146 ;----------------------
      008C79                       2147 get_array_element:
      008C79 CD 8C 49         [ 4] 2148 	call func_args 
      008C7C A1 01            [ 1] 2149 	cp a,#1
      008C7E 27 03            [ 1] 2150 	jreq 1$
      008C80 CC 87 A6         [ 2] 2151 	jp syntax_error
      008C83 85               [ 2] 2152 1$: popw x 
                                   2153 	; check for bounds 
      008C84 C3 00 1F         [ 2] 2154 	cpw x,array_size 
      008C87 23 05            [ 2] 2155 	jrule 3$
                                   2156 ; bounds {1..array_size}	
      008C89 A6 0A            [ 1] 2157 2$: ld a,#ERR_BAD_VALUE 
      008C8B CC 87 A8         [ 2] 2158 	jp tb_error 
      008C8E 5D               [ 2] 2159 3$: tnzw  x
      008C8F 27 F8            [ 1] 2160 	jreq 2$ 
      008C91 58               [ 2] 2161 	sllw x 
      008C92 89               [ 2] 2162 	pushw x 
      008C93 AE 16 90         [ 2] 2163 	ldw x,#tib
      008C96 72 F0 01         [ 2] 2164 	subw x,(1,sp)
      000C19                       2165 	_drop 2   
      008C99 5B 02            [ 2]    1     addw sp,#2 
      008C9B A6 84            [ 1] 2166 	ld a,#TK_INTGR
      008C9D 81               [ 4] 2167 	ret 
                                   2168 
                                   2169 
                                   2170 ;***********************************
                                   2171 ;   expression parse,execute 
                                   2172 ;***********************************
                                   2173 ;-----------------------------------
                                   2174 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2175 ;			 integer | function |
                                   2176 ;			 '('relation')' 
                                   2177 ; output:
                                   2178 ;   A    token attribute 
                                   2179 ;   X 	 integer
                                   2180 ; ---------------------------------
                           000001  2181 	NEG=1
                           000001  2182 	VSIZE=1
      008C9E                       2183 factor:
      000C1E                       2184 	_vars VSIZE 
      008C9E 52 01            [ 2]    1     sub sp,#VSIZE 
      008CA0 CD 88 95         [ 4] 2185 	call next_token
      008CA3 A1 02            [ 1] 2186 	cp a,#CMD_END  
      008CA5 25 3D            [ 1] 2187 	jrult 16$
      008CA7 6B 01            [ 1] 2188 1$:	ld (NEG,sp),a 
      008CA9 A4 30            [ 1] 2189 	and a,#TK_GRP_MASK
      008CAB A1 10            [ 1] 2190 	cp a,#TK_GRP_ADD 
      008CAD 27 04            [ 1] 2191 	jreq 2$
      008CAF 7B 01            [ 1] 2192 	ld a,(NEG,sp)
      008CB1 20 03            [ 2] 2193 	jra 4$  
      008CB3                       2194 2$:	
      008CB3 CD 88 95         [ 4] 2195 	call next_token 
      008CB6                       2196 4$:	
      008CB6 A1 81            [ 1] 2197 	cp a,#TK_IFUNC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008CB8 26 03            [ 1] 2198 	jrne 5$ 
      008CBA FD               [ 4] 2199 	call (x) 
      008CBB 20 32            [ 2] 2200 	jra 18$ 
      008CBD                       2201 5$:
      008CBD A1 84            [ 1] 2202 	cp a,#TK_INTGR
      008CBF 26 02            [ 1] 2203 	jrne 6$
      008CC1 20 2C            [ 2] 2204 	jra 18$
      008CC3                       2205 6$:
      008CC3 A1 06            [ 1] 2206 	cp a,#TK_ARRAY
      008CC5 26 06            [ 1] 2207 	jrne 10$
      008CC7 CD 8C 79         [ 4] 2208 	call get_array_element
      008CCA FE               [ 2] 2209 	ldw x,(x)
      008CCB 20 22            [ 2] 2210 	jra 18$ 
      008CCD                       2211 10$:
      008CCD A1 85            [ 1] 2212 	cp a,#TK_VAR 
      008CCF 26 03            [ 1] 2213 	jrne 12$
      008CD1 FE               [ 2] 2214 	ldw x,(x)
      008CD2 20 1B            [ 2] 2215 	jra 18$
      008CD4                       2216 12$:			
      008CD4 A1 07            [ 1] 2217 	cp a,#TK_LPAREN
      008CD6 26 0C            [ 1] 2218 	jrne 16$
      008CD8 CD 8D 96         [ 4] 2219 	call relation
      008CDB 89               [ 2] 2220 	pushw x 
      008CDC A6 08            [ 1] 2221 	ld a,#TK_RPAREN 
      008CDE CD 8C 3C         [ 4] 2222 	call expect
      008CE1 85               [ 2] 2223 	popw x 
      008CE2 20 0B            [ 2] 2224 	jra 18$	
      008CE4                       2225 16$:
      008CE4 4D               [ 1] 2226 	tnz a 
      008CE5 27 11            [ 1] 2227 	jreq 20$ 
      000C67                       2228 	_unget_token
      008CE7 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      008CEC 4F               [ 1] 2229 	clr a 
      008CED 20 09            [ 2] 2230 	jra 20$ 
      008CEF                       2231 18$: 
      008CEF A6 11            [ 1] 2232 	ld a,#TK_MINUS 
      008CF1 11 01            [ 1] 2233 	cp a,(NEG,sp)
      008CF3 26 01            [ 1] 2234 	jrne 19$
      008CF5 50               [ 2] 2235 	negw x
      008CF6                       2236 19$:
      008CF6 A6 84            [ 1] 2237 	ld a,#TK_INTGR
      008CF8                       2238 20$:
      000C78                       2239 	_drop VSIZE
      008CF8 5B 01            [ 2]    1     addw sp,#VSIZE 
      008CFA 81               [ 4] 2240 	ret
                                   2241 
                                   2242 ;-----------------------------------
                                   2243 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   2244 ; output:
                                   2245 ;   A    	token attribute 
                                   2246 ;	X		integer
                                   2247 ;-----------------------------------
                           000001  2248 	N1=1   ; int16_t
                           000003  2249 	MULOP=3
                           000003  2250 	VSIZE=3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008CFB                       2251 term:
      000C7B                       2252 	_vars VSIZE
      008CFB 52 03            [ 2]    1     sub sp,#VSIZE 
      008CFD CD 8C 9E         [ 4] 2253 	call factor
      008D00 4D               [ 1] 2254 	tnz a 
      008D01 27 47            [ 1] 2255 	jreq term_exit 
      008D03                       2256 term01:	 ; check for  operator 
      008D03 1F 01            [ 2] 2257 	ldw (N1,sp),x  ; save first factor 
      008D05 CD 88 95         [ 4] 2258 	call next_token
      008D08 6B 03            [ 1] 2259 	ld (MULOP,sp),a
      008D0A A1 02            [ 1] 2260 	cp a,#CMD_END
      008D0C 25 2F            [ 1] 2261 	jrult 8$
      008D0E A4 30            [ 1] 2262 	and a,#TK_GRP_MASK
      008D10 A1 20            [ 1] 2263 	cp a,#TK_GRP_MULT
      008D12 27 02            [ 1] 2264 	jreq 1$
      008D14 20 27            [ 2] 2265 	jra 8$
      008D16                       2266 1$:	; got *|/|%
      008D16 CD 8C 9E         [ 4] 2267 	call factor
      008D19 A1 84            [ 1] 2268 	cp a,#TK_INTGR
      008D1B 27 03            [ 1] 2269 	jreq 2$
      008D1D CC 87 A6         [ 2] 2270 	jp syntax_error
      008D20 90 93            [ 1] 2271 2$:	ldw y,x 
      008D22 1E 01            [ 2] 2272 	ldw x,(N1,sp)
      008D24 7B 03            [ 1] 2273 	ld a,(MULOP,sp) 
      008D26 A1 20            [ 1] 2274 	cp a,#TK_MULT 
      008D28 26 05            [ 1] 2275 	jrne 3$
      008D2A CD 8A FF         [ 4] 2276 	call multiply 
      008D2D 20 D4            [ 2] 2277 	jra term01
      008D2F A1 21            [ 1] 2278 3$: cp a,#TK_DIV 
      008D31 26 05            [ 1] 2279 	jrne 4$ 
      008D33 CD 8B B8         [ 4] 2280 	call divide 
      008D36 20 CB            [ 2] 2281 	jra term01 
      008D38 CD 8B CE         [ 4] 2282 4$: call modulo
      008D3B 20 C6            [ 2] 2283 	jra term01 
      008D3D 7B 03            [ 1] 2284 8$: ld a,(MULOP,sp)
      008D3F 27 05            [ 1] 2285 	jreq 9$ 
      000CC1                       2286 	_unget_token
      008D41 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      008D46 1E 01            [ 2] 2287 9$: ldw x,(N1,sp)
      008D48 A6 84            [ 1] 2288 	ld a,#TK_INTGR 	
      008D4A                       2289 term_exit:
      000CCA                       2290 	_drop VSIZE 
      008D4A 5B 03            [ 2]    1     addw sp,#VSIZE 
      008D4C 81               [ 4] 2291 	ret 
                                   2292 
                                   2293 ;-------------------------------
                                   2294 ;  expr ::= term [['+'|'-'] term]*
                                   2295 ;  result range {-32768..32767}
                                   2296 ;  output:
                                   2297 ;   A    token attribute 
                                   2298 ;   X	 integer   
                                   2299 ;-------------------------------
                           000001  2300 	N1=1
                           000003  2301 	N2=3 
                           000005  2302 	OP=5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                           000005  2303 	VSIZE=5 
      008D4D                       2304 expression:
      000CCD                       2305 	_vars VSIZE 
      008D4D 52 05            [ 2]    1     sub sp,#VSIZE 
      008D4F CD 8C FB         [ 4] 2306 	call term
      008D52 4D               [ 1] 2307 	tnz a 
      008D53 27 3E            [ 1] 2308 	jreq expr_exit 
      008D55 1F 01            [ 2] 2309 1$:	ldw (N1,sp),x 
      008D57 CD 88 95         [ 4] 2310 	call next_token
      008D5A 6B 05            [ 1] 2311 	ld (OP,sp),a 
      008D5C A1 02            [ 1] 2312 	cp a,#CMD_END 
      008D5E 25 26            [ 1] 2313 	jrult 8$ 
      008D60 A4 30            [ 1] 2314 	and a,#TK_GRP_MASK
      008D62 A1 10            [ 1] 2315 	cp a,#TK_GRP_ADD 
      008D64 27 02            [ 1] 2316 	jreq 2$ 
      008D66 20 1E            [ 2] 2317 	jra 8$
      008D68                       2318 2$: 
      008D68 CD 8C FB         [ 4] 2319 	call term
      008D6B A1 84            [ 1] 2320 	cp a,#TK_INTGR
      008D6D 27 03            [ 1] 2321 	jreq 3$
      008D6F CC 87 A6         [ 2] 2322 	jp syntax_error
      008D72 1F 03            [ 2] 2323 3$:	ldw (N2,sp),x 
      008D74 1E 01            [ 2] 2324 	ldw x,(N1,sp)
      008D76 7B 05            [ 1] 2325 	ld a,(OP,sp)
      008D78 A1 10            [ 1] 2326 	cp a,#TK_PLUS 
      008D7A 26 05            [ 1] 2327 	jrne 4$
      008D7C 72 FB 03         [ 2] 2328 	addw x,(N2,sp)
      008D7F 20 D4            [ 2] 2329 	jra 1$ 
      008D81 72 F0 03         [ 2] 2330 4$:	subw x,(N2,sp)
      008D84 20 CF            [ 2] 2331 	jra 1$
      008D86 7B 05            [ 1] 2332 8$: ld a,(OP,sp)
      008D88 27 05            [ 1] 2333 	jreq 9$ 
      000D0A                       2334 	_unget_token	
      008D8A 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      008D8F 1E 01            [ 2] 2335 9$: ldw x,(N1,sp)
      008D91 A6 84            [ 1] 2336 	ld a,#TK_INTGR	
      008D93                       2337 expr_exit:
      000D13                       2338 	_drop VSIZE 
      008D93 5B 05            [ 2]    1     addw sp,#VSIZE 
      008D95 81               [ 4] 2339 	ret 
                                   2340 
                                   2341 ;---------------------------------------------
                                   2342 ; rel ::= expr rel_op expr
                                   2343 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   2344 ;  relation return  integer , zero is false 
                                   2345 ;  output:
                                   2346 ;    A 		token attribute  
                                   2347 ;	 X		integer 
                                   2348 ;---------------------------------------------
                           000001  2349 	N1=1
                           000003  2350 	RELOP=3
                           000003  2351 	VSIZE=3 
      008D96                       2352 relation: 
      000D16                       2353 	_vars VSIZE
      008D96 52 03            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008D98 CD 8D 4D         [ 4] 2354 	call expression
      008D9B 4D               [ 1] 2355 	tnz a 
      008D9C 27 4D            [ 1] 2356 	jreq rel_exit
      008D9E 1F 01            [ 2] 2357 	ldw (N1,sp),x 
                                   2358 ; expect rel_op or leave 
      008DA0 CD 88 95         [ 4] 2359 	call next_token 
      008DA3 6B 03            [ 1] 2360 	ld (RELOP,sp),a 
      008DA5 A4 30            [ 1] 2361 	and a,#TK_GRP_MASK
      008DA7 A1 30            [ 1] 2362 	cp a,#TK_GRP_RELOP 
      008DA9 26 33            [ 1] 2363 	jrne 8$
      008DAB                       2364 2$:	; expect another expression
      008DAB CD 8D 4D         [ 4] 2365 	call expression
      008DAE A1 84            [ 1] 2366 	cp a,#TK_INTGR
      008DB0 27 03            [ 1] 2367 	jreq 3$
      008DB2 CC 87 A6         [ 2] 2368 	jp syntax_error 
      008DB5 CF 00 0D         [ 2] 2369 3$:	ldw acc16,x 
      008DB8 1E 01            [ 2] 2370 	ldw x,(N1,sp) 
      008DBA 72 B0 00 0D      [ 2] 2371 	subw x,acc16
      008DBE 26 06            [ 1] 2372 	jrne 4$
      008DC0 35 02 00 0E      [ 1] 2373 	mov acc8,#2 ; n1==n2
      008DC4 20 0C            [ 2] 2374 	jra 6$ 
      008DC6                       2375 4$: 
      008DC6 2C 06            [ 1] 2376 	jrsgt 5$  
      008DC8 35 04 00 0E      [ 1] 2377 	mov acc8,#4 ; n1<2 
      008DCC 20 04            [ 2] 2378 	jra 6$
      008DCE                       2379 5$:
      008DCE 35 01 00 0E      [ 1] 2380 	mov acc8,#1 ; n1>n2 
      008DD2                       2381 6$:
      008DD2 5F               [ 1] 2382 	clrw x 
      008DD3 C6 00 0E         [ 1] 2383 	ld a, acc8  
      008DD6 14 03            [ 1] 2384 	and a,(RELOP,sp)
      008DD8 4D               [ 1] 2385 	tnz a 
      008DD9 27 0E            [ 1] 2386 	jreq 10$
      008DDB 5C               [ 1] 2387 	incw x 
      008DDC 20 0B            [ 2] 2388 	jra 10$  	
      008DDE 7B 03            [ 1] 2389 8$: ld a,(RELOP,sp)
      008DE0 27 05            [ 1] 2390 	jreq 9$
      000D62                       2391 	_unget_token
      008DE2 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      008DE7                       2392 9$: 
      008DE7 1E 01            [ 2] 2393 	ldw x,(N1,sp)
      008DE9                       2394 10$:
      008DE9 A6 84            [ 1] 2395 	ld a,#TK_INTGR
      008DEB                       2396 rel_exit:
      000D6B                       2397 	_drop VSIZE
      008DEB 5B 03            [ 2]    1     addw sp,#VSIZE 
      008DED 81               [ 4] 2398 	ret 
                                   2399 
                                   2400 ;--------------------------------
                                   2401 ; BASIC: SHOW 
                                   2402 ; print stack content in hexadecimal bytes 
                                   2403 ; 16 bytes per row 
                                   2404 ;--------------------------------
      008DEE                       2405 show:
      008DEE AE 8E 08         [ 2] 2406 	ldw x,#cstk_prompt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008DF1 CD 9F 0C         [ 4] 2407 	call puts 
      008DF4 96               [ 1] 2408 	ldw x,sp 
      008DF5 1C 00 03         [ 2] 2409 	addw x,#3 ; ignore return address
      008DF8 90 AE 18 00      [ 2] 2410 	ldw y,#RAM_SIZE  
      008DFC CF 00 0D         [ 2] 2411 	ldw acc16,x 
      008DFF 72 B2 00 0D      [ 2] 2412 	subw y,acc16
      008E03 CD 83 CF         [ 4] 2413 	call hex_dump
      008E06 4F               [ 1] 2414 	clr a 
      008E07 81               [ 4] 2415 	ret
                                   2416 
      008E08 0A 63 6F 6E 74 65 6E  2417 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   2418 
                                   2419 
                                   2420 ;--------------------------------------------
                                   2421 ; BASIC: HEX 
                                   2422 ; select hexadecimal base for integer print
                                   2423 ;---------------------------------------------
      008E2F                       2424 hex_base:
      008E2F 35 10 00 0B      [ 1] 2425 	mov base,#16 
      008E33 81               [ 4] 2426 	ret 
                                   2427 
                                   2428 ;--------------------------------------------
                                   2429 ; BASIC: DEC 
                                   2430 ; select decimal base for integer print
                                   2431 ;---------------------------------------------
      008E34                       2432 dec_base:
      008E34 35 0A 00 0B      [ 1] 2433 	mov base,#10
      008E38 81               [ 4] 2434 	ret 
                                   2435 
                                   2436 ;------------------------
                                   2437 ; BASIC: FREE 
                                   2438 ; return free size in text area
                                   2439 ; output:
                                   2440 ;   A 		TK_INTGR
                                   2441 ;   X 	    size integer
                                   2442 ;--------------------------
      008E39                       2443 free:
      008E39 CE 00 1A         [ 2] 2444 	ldw x,txtbgn 
      008E3C C3 A9 00         [ 2] 2445 	cpw x,app_space
      008E3F 25 16            [ 1] 2446 	jrult 1$
      008E41 AE FF FF         [ 2] 2447 	ldw x,#0xffff 
      008E44 90 AE A9 04      [ 2] 2448 	ldw y,#app
      008E48 72 B9 A9 02      [ 2] 2449 	addw y,app_size
      008E4C 90 CF 00 0D      [ 2] 2450 	ldw acc16,y 
      008E50 72 B0 00 0D      [ 2] 2451 	subw x,acc16 
      008E54 5C               [ 1] 2452 	incw x 
      008E55 20 07            [ 2] 2453 	jra 2$ 
      008E57 AE 16 90         [ 2] 2454 1$:	ldw x,#tib 
      008E5A 72 B0 00 1C      [ 2] 2455 	subw x,txtend 
      008E5E A6 84            [ 1] 2456 2$:	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E60 81               [ 4] 2457 	ret 
                                   2458 
                                   2459 
                                   2460 ;------------------------
                                   2461 ; BASIC: UBOUND  
                                   2462 ; return array variable size 
                                   2463 ; output:
                                   2464 ;   A 		TK_INTGR
                                   2465 ;   X 	    array size 
                                   2466 ;--------------------------
      008E61                       2467 ubound:
      008E61 AE 16 90         [ 2] 2468 	ldw x,#tib
      008E64 72 B0 00 1C      [ 2] 2469 	subw x,txtend 
      008E68 90 CE 00 05      [ 2] 2470 	ldw y,basicptr 
      008E6C 90 C3 00 1C      [ 2] 2471 	cpw y,txtend 
      008E70 25 0A            [ 1] 2472 	jrult 1$
      008E72 3B 00 04         [ 1] 2473 	push count 
      008E75 4B 00            [ 1] 2474 	push #0 
      008E77 72 F0 01         [ 2] 2475 	subw x,(1,sp)
      000DFA                       2476 	_drop 2 
      008E7A 5B 02            [ 2]    1     addw sp,#2 
      008E7C 54               [ 2] 2477 1$:	srlw x 
      008E7D CF 00 1F         [ 2] 2478 	ldw array_size,x
      008E80 A6 84            [ 1] 2479 	ld a,#TK_INTGR
      008E82 81               [ 4] 2480 	ret 
                                   2481 
                                   2482 ;-----------------------------
                                   2483 ; BASIC: LET var=expr 
                                   2484 ; variable assignement 
                                   2485 ; output:
                                   2486 ;   A 		TK_NONE 
                                   2487 ;-----------------------------
      008E83                       2488 let::
      008E83 CD 88 95         [ 4] 2489 	call next_token 
      008E86 A1 85            [ 1] 2490 	cp a,#TK_VAR 
      008E88 27 0A            [ 1] 2491 	jreq let_var
      008E8A A1 06            [ 1] 2492 	cp a,#TK_ARRAY 
      008E8C 27 03            [ 1] 2493 	jreq  let_array
      008E8E CC 87 A6         [ 2] 2494 	jp syntax_error
      008E91                       2495 let_array:
      008E91 CD 8C 79         [ 4] 2496 	call get_array_element
      008E94                       2497 let_var:
      008E94 89               [ 2] 2498 	pushw x  
      008E95 CD 88 95         [ 4] 2499 	call next_token 
      008E98 A1 32            [ 1] 2500 	cp a,#TK_EQUAL
      008E9A 27 03            [ 1] 2501 	jreq 1$
      008E9C CC 87 A6         [ 2] 2502 	jp syntax_error
      008E9F                       2503 1$:	
      008E9F CD 8D 96         [ 4] 2504 	call relation   
      008EA2 A1 84            [ 1] 2505 	cp a,#TK_INTGR 
      008EA4 27 03            [ 1] 2506 	jreq 2$
      008EA6 CC 87 A6         [ 2] 2507 	jp syntax_error
      008EA9                       2508 2$:	
      008EA9 90 93            [ 1] 2509 	ldw y,x 
      008EAB 85               [ 2] 2510 	popw x   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008EAC FF               [ 2] 2511 	ldw (x),y   
      008EAD 81               [ 4] 2512 	ret 
                                   2513 
                                   2514 ;----------------------------
                                   2515 ; BASIC: LIST [[start][,end]]
                                   2516 ; list program lines 
                                   2517 ; form start to end 
                                   2518 ; if empty argument list then 
                                   2519 ; list all.
                                   2520 ;----------------------------
                           000001  2521 	FIRST=1
                           000003  2522 	LAST=3 
                           000005  2523 	LN_PTR=5
                           000006  2524 	VSIZE=6 
      008EAE                       2525 list:
      008EAE CE 00 1A         [ 2] 2526 	ldw x,txtbgn 
      008EB1 C3 00 1C         [ 2] 2527 	cpw x,txtend 
      008EB4 2B 01            [ 1] 2528 	jrmi 1$
      008EB6 81               [ 4] 2529 	ret 
      008EB7                       2530 1$:	
      000E37                       2531 	_vars VSIZE
      008EB7 52 06            [ 2]    1     sub sp,#VSIZE 
      008EB9 1F 05            [ 2] 2532 	ldw (LN_PTR,sp),x 
      008EBB FE               [ 2] 2533 	ldw x,(x) 
      008EBC 1F 01            [ 2] 2534 	ldw (FIRST,sp),x ; list from first line 
      008EBE AE 7F FF         [ 2] 2535 	ldw x,#MAX_LINENO ; biggest line number 
      008EC1 1F 03            [ 2] 2536 	ldw (LAST,sp),x 
      008EC3 CD 8C 4E         [ 4] 2537 	call arg_list
      008EC6 4D               [ 1] 2538 	tnz a
      008EC7 27 31            [ 1] 2539 	jreq list_loop 
      008EC9 A1 02            [ 1] 2540 	cp a,#2 
      008ECB 27 07            [ 1] 2541 	jreq 4$
      008ECD A1 01            [ 1] 2542 	cp a,#1 
      008ECF 27 06            [ 1] 2543 	jreq first_line 
      008ED1 CC 87 A6         [ 2] 2544 	jp syntax_error 
      008ED4 85               [ 2] 2545 4$:	popw x 
      008ED5 1F 05            [ 2] 2546 	ldw (LAST+2,sp),x 
      008ED7                       2547 first_line:
      008ED7 85               [ 2] 2548 	popw x
      008ED8 1F 01            [ 2] 2549 	ldw (FIRST,sp),x 
      008EDA                       2550 lines_skip:
      008EDA CE 00 1A         [ 2] 2551 	ldw x,txtbgn
      008EDD 1F 05            [ 2] 2552 2$:	ldw (LN_PTR,sp),x 
      008EDF C3 00 1C         [ 2] 2553 	cpw x,txtend 
      008EE2 2A 38            [ 1] 2554 	jrpl list_exit 
      008EE4 FE               [ 2] 2555 	ldw x,(x) ;line# 
      008EE5 13 01            [ 2] 2556 	cpw x,(FIRST,sp)
      008EE7 2A 11            [ 1] 2557 	jrpl list_loop 
      008EE9 1E 05            [ 2] 2558 	ldw x,(LN_PTR,sp) 
      008EEB E6 02            [ 1] 2559 	ld a,(2,x)
      008EED C7 00 0E         [ 1] 2560 	ld acc8,a 
      008EF0 72 5F 00 0D      [ 1] 2561 	clr acc16 
      008EF4 72 BB 00 0D      [ 2] 2562 	addw x,acc16
      008EF8 20 E3            [ 2] 2563 	jra 2$ 
                                   2564 ; print loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008EFA                       2565 list_loop:
      008EFA 1E 05            [ 2] 2566 	ldw x,(LN_PTR,sp)
      008EFC E6 02            [ 1] 2567 	ld a,(2,x) 
      008EFE CD 8F 2A         [ 4] 2568 	call prt_basic_line
      008F01 1E 05            [ 2] 2569 	ldw x,(LN_PTR,sp)
      008F03 E6 02            [ 1] 2570 	ld a,(2,x)
      008F05 C7 00 0E         [ 1] 2571 	ld acc8,a 
      008F08 72 5F 00 0D      [ 1] 2572 	clr acc16 
      008F0C 72 BB 00 0D      [ 2] 2573 	addw x,acc16
      008F10 C3 00 1C         [ 2] 2574 	cpw x,txtend 
      008F13 2A 07            [ 1] 2575 	jrpl list_exit
      008F15 1F 05            [ 2] 2576 	ldw (LN_PTR,sp),x
      008F17 FE               [ 2] 2577 	ldw x,(x)
      008F18 13 03            [ 2] 2578 	cpw x,(LAST,sp)  
      008F1A 2F DE            [ 1] 2579 	jrslt list_loop
      008F1C                       2580 list_exit:
      008F1C 55 00 04 00 02   [ 1] 2581 	mov in,count 
      008F21 AE 16 E0         [ 2] 2582 	ldw x,#pad 
      008F24 CF 00 05         [ 2] 2583 	ldw basicptr,x 
      000EA7                       2584 	_drop VSIZE 
      008F27 5B 06            [ 2]    1     addw sp,#VSIZE 
      008F29 81               [ 4] 2585 	ret
                                   2586 
                                   2587 
                                   2588 ;--------------------------
                                   2589 ; decompile line from token list
                                   2590 ; and print it. 
                                   2591 ; input:
                                   2592 ;   A       stop at this position 
                                   2593 ;   X 		pointer at line
                                   2594 ; output:
                                   2595 ;   none 
                                   2596 ;--------------------------	
      008F2A                       2597 prt_basic_line:
      008F2A C7 00 04         [ 1] 2598 	ld count,a 
      008F2D E6 02            [ 1] 2599 	ld a,(2,x)
      008F2F C1 00 04         [ 1] 2600 	cp a,count 
      008F32 2A 03            [ 1] 2601 	jrpl 1$ 
      008F34 C7 00 04         [ 1] 2602 	ld count,a 
      008F37 CF 00 05         [ 2] 2603 1$:	ldw basicptr,x 
      008F3A 90 AE 16 90      [ 2] 2604 	ldw y,#tib  
      008F3E CD A7 05         [ 4] 2605 	call decompile 
      008F41 CD 9F 0C         [ 4] 2606 	call puts 
      008F44 A6 0D            [ 1] 2607 	ld a,#CR 
      008F46 CD 83 32         [ 4] 2608 	call putc 
      008F49 81               [ 4] 2609 	ret 
                                   2610 
                                   2611 
                                   2612 
                                   2613 ;---------------------------------
                                   2614 ; BASIC: PRINT|? arg_list 
                                   2615 ; print values from argument list
                                   2616 ;----------------------------------
                           000001  2617 	CCOMMA=1
                           000001  2618 	VSIZE=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008F4A                       2619 print:
      000ECA                       2620 	_vars VSIZE 
      008F4A 52 01            [ 2]    1     sub sp,#VSIZE 
      008F4C                       2621 reset_comma:
      008F4C 0F 01            [ 1] 2622 	clr (CCOMMA,sp)
      008F4E                       2623 prt_loop:
      008F4E CD 88 95         [ 4] 2624 	call next_token
      008F51 A1 02            [ 1] 2625 	cp a,#CMD_END 
      008F53 25 4F            [ 1] 2626 	jrult print_exit ; colon or end of line 
      008F55 A1 02            [ 1] 2627 	cp a,#TK_QSTR
      008F57 27 12            [ 1] 2628 	jreq 1$
      008F59 A1 03            [ 1] 2629 	cp a,#TK_CHAR 
      008F5B 27 13            [ 1] 2630 	jreq 2$ 
      008F5D A1 82            [ 1] 2631 	cp a,#TK_CFUNC 
      008F5F 27 15            [ 1] 2632 	jreq 3$
      008F61 A1 09            [ 1] 2633 	cp a,#TK_COMMA 
      008F63 27 18            [ 1] 2634 	jreq 4$
      008F65 A1 0A            [ 1] 2635 	cp a,#TK_SHARP 
      008F67 27 18            [ 1] 2636 	jreq 5$
      008F69 20 28            [ 2] 2637 	jra 7$ 
      008F6B                       2638 1$:	; print string 
      008F6B CD 9F 0C         [ 4] 2639 	call puts
      008F6E 20 DC            [ 2] 2640 	jra reset_comma
      008F70                       2641 2$:	; print character 
      008F70 9F               [ 1] 2642 	ld a,xl 
      008F71 CD 83 32         [ 4] 2643 	call putc 
      008F74 20 D6            [ 2] 2644 	jra reset_comma 
      008F76                       2645 3$: ; print character function value  	
      008F76 FD               [ 4] 2646 	call (x)
      008F77 9F               [ 1] 2647 	ld a,xl 
      008F78 CD 83 32         [ 4] 2648 	call putc
      008F7B 20 CF            [ 2] 2649 	jra reset_comma 
      008F7D                       2650 4$: ; set comma state 
      008F7D 03 01            [ 1] 2651 	cpl (CCOMMA,sp)
      008F7F 20 CD            [ 2] 2652 	jra prt_loop   
      008F81                       2653 5$: ; # character must be followed by an integer   
      008F81 CD 88 95         [ 4] 2654 	call next_token
      008F84 A1 84            [ 1] 2655 	cp a,#TK_INTGR 
      008F86 27 03            [ 1] 2656 	jreq 6$
      008F88 CC 87 A6         [ 2] 2657 	jp syntax_error 
      008F8B                       2658 6$: ; set tab width
      008F8B 9F               [ 1] 2659 	ld a,xl 
      008F8C A4 0F            [ 1] 2660 	and a,#15 
      008F8E C7 00 22         [ 1] 2661 	ld tab_width,a 
      008F91 20 B9            [ 2] 2662 	jra reset_comma 
      008F93                       2663 7$:	
      000F13                       2664 	_unget_token 
      008F93 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      008F98 CD 8D 96         [ 4] 2665 	call relation 
      008F9B A1 84            [ 1] 2666 	cp a,#TK_INTGR 
      008F9D 26 05            [ 1] 2667 	jrne print_exit 
      008F9F CD 88 F0         [ 4] 2668     call print_int 
      008FA2 20 A8            [ 2] 2669 	jra reset_comma 
      008FA4                       2670 print_exit:
      008FA4 0D 01            [ 1] 2671 	tnz (CCOMMA,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008FA6 26 05            [ 1] 2672 	jrne 9$
      008FA8 A6 0D            [ 1] 2673 	ld a,#CR 
      008FAA CD 83 32         [ 4] 2674     call putc 
      000F2D                       2675 9$:	_drop VSIZE 
      008FAD 5B 01            [ 2]    1     addw sp,#VSIZE 
      008FAF 81               [ 4] 2676 	ret 
                                   2677 
                                   2678 ;----------------------
                                   2679 ; 'save_context' and
                                   2680 ; 'rest_context' must be 
                                   2681 ; called at the same 
                                   2682 ; call stack depth 
                                   2683 ; i.e. SP must have the 
                                   2684 ; save value at  
                                   2685 ; entry point of both 
                                   2686 ; routine. 
                                   2687 ;---------------------
                           000004  2688 	CTXT_SIZE=4 ; size of saved data 
                                   2689 ;--------------------
                                   2690 ; save current BASIC
                                   2691 ; interpreter context 
                                   2692 ; on stack 
                                   2693 ;--------------------
      008FB0                       2694 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000F30                       2695 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      000F30                       2696 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      000F30                       2697 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      000F30                       2698 save_context:
      008FB0 CE 00 05         [ 2] 2699 	ldw x,basicptr 
      008FB3 1F 03            [ 2] 2700 	ldw (BPTR,sp),x
      008FB5 C6 00 02         [ 1] 2701 	ld a,in 
      008FB8 6B 05            [ 1] 2702 	ld (IN,sp),a
      008FBA C6 00 04         [ 1] 2703 	ld a,count 
      008FBD 6B 06            [ 1] 2704 	ld (CNT,sp),a  
      008FBF 81               [ 4] 2705 	ret
                                   2706 
                                   2707 ;-----------------------
                                   2708 ; restore previously saved 
                                   2709 ; BASIC interpreter context 
                                   2710 ; from stack 
                                   2711 ;-------------------------
      008FC0                       2712 rest_context:
      008FC0 1E 03            [ 2] 2713 	ldw x,(BPTR,sp)
      008FC2 CF 00 05         [ 2] 2714 	ldw basicptr,x 
      008FC5 7B 05            [ 1] 2715 	ld a,(IN,sp)
      008FC7 C7 00 02         [ 1] 2716 	ld in,a
      008FCA 7B 06            [ 1] 2717 	ld a,(CNT,sp)
      008FCC C7 00 04         [ 1] 2718 	ld count,a  
      008FCF 81               [ 4] 2719 	ret
                                   2720 
                                   2721 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2722 
                                   2723 ;------------------------------------------
                                   2724 ; BASIC: INPUT [string]var[,[string]var]
                                   2725 ; input value in variables 
                                   2726 ; [string] optionally can be used as prompt 
                                   2727 ;-----------------------------------------
                           000001  2728 	CX_BPTR=1
                           000003  2729 	CX_IN=3
                           000004  2730 	CX_CNT=4
                           000005  2731 	SKIP=5
                           000006  2732 	VAR_ADDR=6
                           000007  2733 	VSIZE=7
      008FD0                       2734 input_var:
      000F50                       2735 	_vars VSIZE 
      008FD0 52 07            [ 2]    1     sub sp,#VSIZE 
      008FD2                       2736 input_loop:
      008FD2 0F 05            [ 1] 2737 	clr (SKIP,sp)
      008FD4 CD 88 95         [ 4] 2738 	call next_token 
      008FD7 A1 02            [ 1] 2739 	cp a,#TK_QSTR 
      008FD9 26 08            [ 1] 2740 	jrne 1$ 
      008FDB CD 9F 0C         [ 4] 2741 	call puts 
      008FDE 03 05            [ 1] 2742 	cpl (SKIP,sp)
      008FE0 CD 88 95         [ 4] 2743 	call next_token 
      008FE3 A1 85            [ 1] 2744 1$: cp a,#TK_VAR  
      008FE5 27 03            [ 1] 2745 	jreq 2$ 
      008FE7 CC 87 A6         [ 2] 2746 	jp syntax_error
      008FEA 1F 06            [ 2] 2747 2$:	ldw (VAR_ADDR,sp),x 
      008FEC 0D 05            [ 1] 2748 	tnz (SKIP,sp)
      008FEE 26 06            [ 1] 2749 	jrne 21$ 
      008FF0 CD A6 DC         [ 4] 2750 	call var_name 
      008FF3 CD 83 32         [ 4] 2751 	call putc   
      008FF6                       2752 21$:
      008FF6 A6 3A            [ 1] 2753 	ld a,#':
      008FF8 CD 83 32         [ 4] 2754 	call putc 
      008FFB CD 8F B0         [ 4] 2755 	call save_context 
      008FFE 72 5F 00 04      [ 1] 2756 	clr count  
      009002 CD A0 11         [ 4] 2757 	call readln 
      009005 AE 16 90         [ 2] 2758 	ldw x,#tib 
      009008 3B 00 04         [ 1] 2759 	push count
      00900B 4B 00            [ 1] 2760 	push #0 
      00900D 72 FB 01         [ 2] 2761 	addw x,(1,sp)
      009010 5C               [ 1] 2762 	incw x 
      000F91                       2763 	_drop 2 
      009011 5B 02            [ 2]    1     addw sp,#2 
      009013 72 5F 00 02      [ 1] 2764 	clr in 
      009017 CD A4 2B         [ 4] 2765 	call get_token
      00901A A1 84            [ 1] 2766 	cp a,#TK_INTGR
      00901C 27 06            [ 1] 2767 	jreq 3$ 
      00901E CD 8F C0         [ 4] 2768 	call rest_context 
      009021 CC 87 A6         [ 2] 2769 	jp syntax_error
      009024 16 06            [ 2] 2770 3$: ldw y,(VAR_ADDR,sp) 
      009026 90 FF            [ 2] 2771 	ldw (y),x 
      009028 CD 8F C0         [ 4] 2772 	call rest_context
      00902B CD 88 95         [ 4] 2773 	call next_token 
      00902E A1 09            [ 1] 2774 	cp a,#TK_COMMA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      009030 27 A0            [ 1] 2775 	jreq input_loop
      009032 A1 00            [ 1] 2776 	cp a,#TK_NONE 
      009034 27 07            [ 1] 2777 	jreq input_exit  
      009036 A1 0B            [ 1] 2778 	cp a,#TK_COLON 
      009038 27 03            [ 1] 2779     jreq input_exit 
      00903A CC 87 A6         [ 2] 2780 	jp syntax_error 
      00903D                       2781 input_exit:
      000FBD                       2782 	_drop VSIZE 
      00903D 5B 07            [ 2]    1     addw sp,#VSIZE 
      00903F 81               [ 4] 2783 	ret 
                                   2784 
                                   2785 
                                   2786 ;---------------------
                                   2787 ; BASIC: REMARK | ' 
                                   2788 ; skip comment to end of line 
                                   2789 ;---------------------- 
      009040                       2790 remark::
      009040 55 00 04 00 02   [ 1] 2791 	mov in,count 
      009045 81               [ 4] 2792  	ret 
                                   2793 
                                   2794 
                                   2795 ;---------------------
                                   2796 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2797 ; read in loop 'addr'  
                                   2798 ; apply & 'mask' to value 
                                   2799 ; loop while result==0.  
                                   2800 ; 'xor_mask' is used to 
                                   2801 ; invert the wait logic.
                                   2802 ; i.e. loop while not 0.
                                   2803 ;---------------------
                           000001  2804 	XMASK=1 
                           000002  2805 	MASK=2
                           000003  2806 	ADDR=3
                           000004  2807 	VSIZE=4
      009046                       2808 wait: 
      000FC6                       2809 	_vars VSIZE
      009046 52 04            [ 2]    1     sub sp,#VSIZE 
      009048 0F 01            [ 1] 2810 	clr (XMASK,sp) 
      00904A CD 8C 4E         [ 4] 2811 	call arg_list 
      00904D A1 02            [ 1] 2812 	cp a,#2
      00904F 24 03            [ 1] 2813 	jruge 0$
      009051 CC 87 A6         [ 2] 2814 	jp syntax_error 
      009054 A1 03            [ 1] 2815 0$:	cp a,#3
      009056 25 04            [ 1] 2816 	jrult 1$
      009058 85               [ 2] 2817 	popw x 
      009059 9F               [ 1] 2818 	ld a,xl
      00905A 6B 01            [ 1] 2819 	ld (XMASK,sp),a 
      00905C 85               [ 2] 2820 1$: popw x ; mask 
      00905D 9F               [ 1] 2821 	ld a,xl 
      00905E 6B 02            [ 1] 2822 	ld (MASK,sp),a 
      009060 85               [ 2] 2823 	popw x ; address 
      009061 F6               [ 1] 2824 2$:	ld a,(x)
      009062 14 02            [ 1] 2825 	and a,(MASK,sp)
      009064 18 01            [ 1] 2826 	xor a,(XMASK,sp)
      009066 27 F9            [ 1] 2827 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      000FE8                       2828 	_drop VSIZE 
      009068 5B 04            [ 2]    1     addw sp,#VSIZE 
      00906A 81               [ 4] 2829 	ret 
                                   2830 
                                   2831 ;---------------------
                                   2832 ; BASIC: BSET addr,mask
                                   2833 ; set bits at 'addr' corresponding 
                                   2834 ; to those of 'mask' that are at 1.
                                   2835 ; arguments:
                                   2836 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2837 ;   mask        mask|addr
                                   2838 ; output:
                                   2839 ;	none 
                                   2840 ;--------------------------
      00906B                       2841 bit_set:
      00906B CD 8C 4E         [ 4] 2842 	call arg_list 
      00906E A1 02            [ 1] 2843 	cp a,#2	 
      009070 27 03            [ 1] 2844 	jreq 1$ 
      009072 CC 87 A6         [ 2] 2845 	jp syntax_error
      009075                       2846 1$: 
      009075 85               [ 2] 2847 	popw x ; mask 
      009076 9F               [ 1] 2848 	ld a,xl 
      009077 85               [ 2] 2849 	popw x ; addr  
      009078 FA               [ 1] 2850 	or a,(x)
      009079 F7               [ 1] 2851 	ld (x),a
      00907A 81               [ 4] 2852 	ret 
                                   2853 
                                   2854 ;---------------------
                                   2855 ; BASIC: BRES addr,mask
                                   2856 ; reset bits at 'addr' corresponding 
                                   2857 ; to those of 'mask' that are at 1.
                                   2858 ; arguments:
                                   2859 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2860 ;   mask	    ~mask&*addr  
                                   2861 ; output:
                                   2862 ;	none 
                                   2863 ;--------------------------
      00907B                       2864 bit_reset:
      00907B CD 8C 4E         [ 4] 2865 	call arg_list 
      00907E A1 02            [ 1] 2866 	cp a,#2  
      009080 27 03            [ 1] 2867 	jreq 1$ 
      009082 CC 87 A6         [ 2] 2868 	jp syntax_error
      009085                       2869 1$: 
      009085 85               [ 2] 2870 	popw x ; mask 
      009086 9F               [ 1] 2871 	ld a,xl 
      009087 43               [ 1] 2872 	cpl a 
      009088 85               [ 2] 2873 	popw x ; addr  
      009089 F4               [ 1] 2874 	and a,(x)
      00908A F7               [ 1] 2875 	ld (x),a 
      00908B 81               [ 4] 2876 	ret 
                                   2877 
                                   2878 ;---------------------
                                   2879 ; BASIC: BTOGL addr,mask
                                   2880 ; toggle bits at 'addr' corresponding 
                                   2881 ; to those of 'mask' that are at 1.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2882 ; arguments:
                                   2883 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2884 ;   mask	    mask^*addr  
                                   2885 ; output:
                                   2886 ;	none 
                                   2887 ;--------------------------
      00908C                       2888 bit_toggle:
      00908C CD 8C 4E         [ 4] 2889 	call arg_list 
      00908F A1 02            [ 1] 2890 	cp a,#2 
      009091 27 03            [ 1] 2891 	jreq 1$ 
      009093 CC 87 A6         [ 2] 2892 	jp syntax_error
      009096 85               [ 2] 2893 1$: popw x ; mask 
      009097 9F               [ 1] 2894 	ld a,xl 
      009098 85               [ 2] 2895 	popw x ; addr  
      009099 F8               [ 1] 2896 	xor a,(x)
      00909A F7               [ 1] 2897 	ld (x),a 
      00909B 81               [ 4] 2898 	ret 
                                   2899 
                                   2900 
                                   2901 ;---------------------
                                   2902 ; BASIC: BTEST(addr,bit)
                                   2903 ; return bit value at 'addr' 
                                   2904 ; bit is in range {0..7}.
                                   2905 ; arguments:
                                   2906 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2907 ;   bit 	    bit position {0..7}  
                                   2908 ; output:
                                   2909 ;	none 
                                   2910 ;--------------------------
      00909C                       2911 bit_test:
      00909C CD 8C 49         [ 4] 2912 	call func_args 
      00909F A1 02            [ 1] 2913 	cp a,#2
      0090A1 27 03            [ 1] 2914 	jreq 0$
      0090A3 CC 87 A6         [ 2] 2915 	jp syntax_error
      0090A6                       2916 0$:	
      0090A6 85               [ 2] 2917 	popw x 
      0090A7 9F               [ 1] 2918 	ld a,xl 
      0090A8 A4 07            [ 1] 2919 	and a,#7
      0090AA 88               [ 1] 2920 	push a   
      0090AB A6 01            [ 1] 2921 	ld a,#1 
      0090AD 0D 01            [ 1] 2922 1$: tnz (1,sp)
      0090AF 27 05            [ 1] 2923 	jreq 2$
      0090B1 48               [ 1] 2924 	sll a 
      0090B2 0A 01            [ 1] 2925 	dec (1,sp)
      0090B4 20 F7            [ 2] 2926 	jra 1$
      001036                       2927 2$: _drop 1 
      0090B6 5B 01            [ 2]    1     addw sp,#1 
      0090B8 85               [ 2] 2928 	popw x 
      0090B9 F4               [ 1] 2929 	and a,(x)
      0090BA 27 02            [ 1] 2930 	jreq 3$
      0090BC A6 01            [ 1] 2931 	ld a,#1 
      0090BE 5F               [ 1] 2932 3$:	clrw x 
      0090BF 97               [ 1] 2933 	ld xl,a 
      0090C0 A6 84            [ 1] 2934 	ld a,#TK_INTGR
      0090C2 81               [ 4] 2935 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2936 
                                   2937 
                                   2938 ;--------------------
                                   2939 ; BASIC: POKE addr,byte
                                   2940 ; put a byte at addr 
                                   2941 ;--------------------
      0090C3                       2942 poke:
      0090C3 CD 8C 4E         [ 4] 2943 	call arg_list 
      0090C6 A1 02            [ 1] 2944 	cp a,#2
      0090C8 27 03            [ 1] 2945 	jreq 1$
      0090CA CC 87 A6         [ 2] 2946 	jp syntax_error
      0090CD                       2947 1$:	
      0090CD 85               [ 2] 2948 	popw x  
      0090CE 9F               [ 1] 2949     ld a,xl 
      0090CF 85               [ 2] 2950 	popw x 
      0090D0 F7               [ 1] 2951 	ld (x),a 
      0090D1 81               [ 4] 2952 	ret 
                                   2953 
                                   2954 ;-----------------------
                                   2955 ; BASIC: PEEK(addr)
                                   2956 ; get the byte at addr 
                                   2957 ; input:
                                   2958 ;	none 
                                   2959 ; output:
                                   2960 ;	X 		value 
                                   2961 ;-----------------------
      0090D2                       2962 peek:
      0090D2 CD 8C 49         [ 4] 2963 	call func_args
      0090D5 A1 01            [ 1] 2964 	cp a,#1 
      0090D7 27 03            [ 1] 2965 	jreq 1$
      0090D9 CC 87 A6         [ 2] 2966 	jp syntax_error
      0090DC 85               [ 2] 2967 1$: popw x 
      0090DD F6               [ 1] 2968 	ld a,(x)
      0090DE 5F               [ 1] 2969 	clrw x 
      0090DF 97               [ 1] 2970 	ld xl,a 
      0090E0 A6 84            [ 1] 2971 	ld a,#TK_INTGR
      0090E2 81               [ 4] 2972 	ret 
                                   2973 
                                   2974 ;---------------------------
                                   2975 ; BASIC IF expr : instructions
                                   2976 ; evaluate expr and if true 
                                   2977 ; execute instructions on same line. 
                                   2978 ;----------------------------
      0090E3                       2979 if: 
      0090E3 CD 8D 96         [ 4] 2980 	call relation 
      0090E6 A1 84            [ 1] 2981 	cp a,#TK_INTGR
      0090E8 27 03            [ 1] 2982 	jreq 1$ 
      0090EA CC 87 A6         [ 2] 2983 	jp syntax_error
      0090ED 4F               [ 1] 2984 1$:	clr a 
      0090EE 5D               [ 2] 2985 	tnzw x 
      0090EF 26 05            [ 1] 2986 	jrne 9$  
                                   2987 ;skip to next line
      0090F1 55 00 04 00 02   [ 1] 2988 	mov in,count
      0090F6 81               [ 4] 2989 9$:	ret 
                                   2990 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2991 ;------------------------
                                   2992 ; BASIC: FOR var=expr 
                                   2993 ; set variable to expression 
                                   2994 ; leave variable address 
                                   2995 ; on stack and set
                                   2996 ; FLOOP bit in 'flags'
                                   2997 ;-----------------
                           000001  2998 	RETL1=1 ; return address  
                           000003  2999 	FSTEP=3  ; variable increment
                           000005  3000 	LIMIT=5 ; loop limit 
                           000007  3001 	CVAR=7   ; control variable 
                           000009  3002 	INW=9   ;  in.w saved
                           00000B  3003 	BPTR=11 ; baseptr saved
                           00000A  3004 	VSIZE=10  
      0090F7                       3005 for: ; { -- var_addr }
      0090F7 85               [ 2] 3006 	popw x ; call return address 
      001078                       3007 	_vars VSIZE 
      0090F8 52 0A            [ 2]    1     sub sp,#VSIZE 
      0090FA 89               [ 2] 3008 	pushw x  ; RETL1 
      0090FB A6 85            [ 1] 3009 	ld a,#TK_VAR 
      0090FD CD 8C 3C         [ 4] 3010 	call expect
      009100 1F 07            [ 2] 3011 	ldw (CVAR,sp),x  ; control variable 
      009102 CD 8E 94         [ 4] 3012 	call let_var 
      009105 72 14 00 21      [ 1] 3013 	bset flags,#FLOOP 
                                   3014 ; open space on stack for loop data 
      009109 5F               [ 1] 3015 	clrw x 
      00910A 1F 0B            [ 2] 3016 	ldw (BPTR,sp),x 
      00910C 1F 09            [ 2] 3017 	ldw (INW,sp),x 
      00910E CD 88 95         [ 4] 3018 	call next_token 
      009111 A1 80            [ 1] 3019 	cp a,#TK_CMD 
      009113 27 03            [ 1] 3020 	jreq 1$
      009115 CC 87 A6         [ 2] 3021 	jp syntax_error
      009118                       3022 1$:  
      009118 A3 91 20         [ 2] 3023 	cpw x,#to 
      00911B 27 03            [ 1] 3024 	jreq to
      00911D CC 87 A6         [ 2] 3025 	jp syntax_error 
                                   3026 
                                   3027 ;-----------------------------------
                                   3028 ; BASIC: TO expr 
                                   3029 ; second part of FOR loop initilization
                                   3030 ; leave limit on stack and set 
                                   3031 ; FTO bit in 'flags'
                                   3032 ;-----------------------------------
      009120                       3033 to: ; { var_addr -- var_addr limit step }
      009120 72 04 00 21 03   [ 2] 3034 	btjt flags,#FLOOP,1$
      009125 CC 87 A6         [ 2] 3035 	jp syntax_error
      009128 CD 8D 96         [ 4] 3036 1$: call relation  
      00912B A1 84            [ 1] 3037 	cp a,#TK_INTGR 
      00912D 27 03            [ 1] 3038 	jreq 2$ 
      00912F CC 87 A6         [ 2] 3039 	jp syntax_error
      009132 1F 05            [ 2] 3040 2$: ldw (LIMIT,sp),x
                                   3041 ;	ldw x,in.w 
      009134 CD 88 95         [ 4] 3042 	call next_token
      009137 A1 00            [ 1] 3043 	cp a,#TK_NONE  
      009139 27 0E            [ 1] 3044 	jreq 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00913B A1 80            [ 1] 3045 	cp a,#TK_CMD
      00913D 26 05            [ 1] 3046 	jrne 3$
      00913F A3 91 50         [ 2] 3047 	cpw x,#step 
      009142 27 0C            [ 1] 3048 	jreq step
      009144                       3049 3$:	
      0010C4                       3050 	_unget_token   	 
      009144 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      009149                       3051 4$:	
      009149 AE 00 01         [ 2] 3052 	ldw x,#1   ; default step  
      00914C 1F 03            [ 2] 3053 	ldw (FSTEP,sp),x 
      00914E 20 14            [ 2] 3054 	jra store_loop_addr 
                                   3055 
                                   3056 
                                   3057 ;----------------------------------
                                   3058 ; BASIC: STEP expr 
                                   3059 ; optional third par of FOR loop
                                   3060 ; initialization. 	
                                   3061 ;------------------------------------
      009150                       3062 step: ; {var limit -- var limit step}
      009150 72 04 00 21 03   [ 2] 3063 	btjt flags,#FLOOP,1$
      009155 CC 87 A6         [ 2] 3064 	jp syntax_error
      009158 CD 8D 96         [ 4] 3065 1$: call relation
      00915B A1 84            [ 1] 3066 	cp a,#TK_INTGR
      00915D 27 03            [ 1] 3067 	jreq 2$
      00915F CC 87 A6         [ 2] 3068 	jp syntax_error
      009162 1F 03            [ 2] 3069 2$:	ldw (FSTEP,sp),x ; step
                                   3070 ; leave loop back entry point on cstack 
                                   3071 ; cstack is 1 call deep from interpreter
      009164                       3072 store_loop_addr:
      009164 CE 00 05         [ 2] 3073 	ldw x,basicptr  
      009167 1F 0B            [ 2] 3074 	ldw (BPTR,sp),x 
      009169 CE 00 01         [ 2] 3075 	ldw x,in.w 
      00916C 1F 09            [ 2] 3076 	ldw (INW,sp),x   
      00916E 72 15 00 21      [ 1] 3077 	bres flags,#FLOOP 
      009172 72 5C 00 1E      [ 1] 3078 	inc loop_depth  
      009176 81               [ 4] 3079 	ret 
                                   3080 
                                   3081 ;--------------------------------
                                   3082 ; BASIC: NEXT var 
                                   3083 ; FOR loop control 
                                   3084 ; increment variable with step 
                                   3085 ; and compare with limit 
                                   3086 ; loop if threshold not crossed.
                                   3087 ; else stack. 
                                   3088 ; and decrement 'loop_depth' 
                                   3089 ;--------------------------------
      009177                       3090 next: ; {var limit step retl1 -- [var limit step ] }
      009177 72 5D 00 1E      [ 1] 3091 	tnz loop_depth 
      00917B 26 03            [ 1] 3092 	jrne 1$ 
      00917D CC 87 A6         [ 2] 3093 	jp syntax_error 
      009180                       3094 1$: 
      009180 A6 85            [ 1] 3095 	ld a,#TK_VAR 
      009182 CD 8C 3C         [ 4] 3096 	call expect
                                   3097 ; check for good variable after NEXT 	 
      009185 13 07            [ 2] 3098 	cpw x,(CVAR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009187 27 03            [ 1] 3099 	jreq 2$  
      009189 CC 87 A6         [ 2] 3100 	jp syntax_error ; not the good one 
      00918C                       3101 2$: ; increment variable 
      00918C FE               [ 2] 3102 	ldw x,(x)  ; get var value 
      00918D 72 FB 03         [ 2] 3103 	addw x,(FSTEP,sp) ; var+step 
      009190 16 07            [ 2] 3104 	ldw y,(CVAR,sp)
      009192 90 FF            [ 2] 3105 	ldw (y),x ; save var new value 
                                   3106 ; check sign of STEP  
      009194 A6 80            [ 1] 3107 	ld a,#0x80
      009196 15 03            [ 1] 3108 	bcp a,(FSTEP,sp)
      009198 2A 06            [ 1] 3109 	jrpl 4$
                                   3110 ;negative step 
      00919A 13 05            [ 2] 3111 	cpw x,(LIMIT,sp)
      00919C 2F 1B            [ 1] 3112 	jrslt loop_done
      00919E 20 04            [ 2] 3113 	jra loop_back 
      0091A0                       3114 4$: ; positive step
      0091A0 13 05            [ 2] 3115 	cpw x,(LIMIT,sp)
      0091A2 2C 15            [ 1] 3116 	jrsgt loop_done
      0091A4                       3117 loop_back:
      0091A4 1E 0B            [ 2] 3118 	ldw x,(BPTR,sp)
      0091A6 CF 00 05         [ 2] 3119 	ldw basicptr,x 
      0091A9 72 01 00 21 05   [ 2] 3120 	btjf flags,#FRUN,1$ 
      0091AE E6 02            [ 1] 3121 	ld a,(2,x)
      0091B0 C7 00 04         [ 1] 3122 	ld count,a
      0091B3 1E 09            [ 2] 3123 1$:	ldw x,(INW,sp)
      0091B5 CF 00 01         [ 2] 3124 	ldw in.w,x 
      0091B8 81               [ 4] 3125 	ret 
      0091B9                       3126 loop_done:
                                   3127 	; remove loop data from stack  
      0091B9 85               [ 2] 3128 	popw x
      00113A                       3129 	_drop VSIZE 
      0091BA 5B 0A            [ 2]    1     addw sp,#VSIZE 
      0091BC 72 5A 00 1E      [ 1] 3130 	dec loop_depth 
                                   3131 ;	pushw x 
                                   3132 ;	ret 
      0091C0 FC               [ 2] 3133 	jp (x)
                                   3134 
                                   3135 ;----------------------------
                                   3136 ; called by goto/gosub
                                   3137 ; to get target line number 
                                   3138 ;---------------------------
      0091C1                       3139 get_target_line:
      0091C1 CD 8D 96         [ 4] 3140 	call relation 
      0091C4 A1 84            [ 1] 3141 	cp a,#TK_INTGR
      0091C6 27 03            [ 1] 3142 	jreq 1$
      0091C8 CC 87 A6         [ 2] 3143 	jp syntax_error
      0091CB 4F               [ 1] 3144 1$:	clr a
      0091CC 90 CE 00 05      [ 2] 3145 	ldw y,basicptr 
      0091D0 90 FE            [ 2] 3146 	ldw y,(y)
      0091D2 90 89            [ 2] 3147 	pushw y 
      0091D4 13 01            [ 2] 3148 	cpw x,(1,sp)
      0091D6 5B 02            [ 2] 3149 	addw sp,#2 
      0091D8 25 01            [ 1] 3150 	jrult 11$
      0091DA 4C               [ 1] 3151 	inc a 
      0091DB                       3152 11$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0091DB CD A1 F4         [ 4] 3153 	call search_lineno  
      0091DE 5D               [ 2] 3154 	tnzw x 
      0091DF 26 05            [ 1] 3155 	jrne 2$ 
      0091E1 A6 05            [ 1] 3156 	ld a,#ERR_NO_LINE 
      0091E3 CC 87 A8         [ 2] 3157 	jp tb_error 
      0091E6 81               [ 4] 3158 2$:	ret 
                                   3159 
                                   3160 ;------------------------
                                   3161 ; BASIC: GOTO line# 
                                   3162 ; jump to line# 
                                   3163 ; here cstack is 2 call deep from interpreter 
                                   3164 ;------------------------
      0091E7                       3165 goto:
      0091E7 72 00 00 21 06   [ 2] 3166 	btjt flags,#FRUN,0$ 
      0091EC A6 06            [ 1] 3167 	ld a,#ERR_RUN_ONLY
      0091EE CC 87 A8         [ 2] 3168 	jp tb_error 
      0091F1 81               [ 4] 3169 	ret 
      0091F2 CD 91 C1         [ 4] 3170 0$:	call get_target_line
      0091F5                       3171 jp_to_target:
      0091F5 CF 00 05         [ 2] 3172 	ldw basicptr,x 
      0091F8 E6 02            [ 1] 3173 	ld a,(2,x)
      0091FA C7 00 04         [ 1] 3174 	ld count,a 
      0091FD 35 03 00 02      [ 1] 3175 	mov in,#3 
      009201 81               [ 4] 3176 	ret 
                                   3177 
                                   3178 
                                   3179 ;--------------------
                                   3180 ; BASIC: GOSUB line#
                                   3181 ; basic subroutine call
                                   3182 ; actual line# and basicptr 
                                   3183 ; are saved on cstack
                                   3184 ; here cstack is 2 call deep from interpreter 
                                   3185 ;--------------------
                           000003  3186 	RET_ADDR=3
                           000005  3187 	RET_INW=5
                           000004  3188 	VSIZE=4  
      009202                       3189 gosub:
      009202 72 00 00 21 06   [ 2] 3190 	btjt flags,#FRUN,0$ 
      009207 A6 06            [ 1] 3191 	ld a,#ERR_RUN_ONLY
      009209 CC 87 A8         [ 2] 3192 	jp tb_error 
      00920C 81               [ 4] 3193 	ret 
      00920D 85               [ 2] 3194 0$:	popw x 
      00118E                       3195 	_vars VSIZE  
      00920E 52 04            [ 2]    1     sub sp,#VSIZE 
      009210 89               [ 2] 3196 	pushw x 
      009211 CE 00 05         [ 2] 3197 	ldw x,basicptr
      009214 1F 03            [ 2] 3198 	ldw (RET_ADDR,sp),x 
      009216 CD 91 C1         [ 4] 3199 	call get_target_line  
      009219 89               [ 2] 3200 	pushw x 
      00921A CE 00 01         [ 2] 3201 	ldw x,in.w 
      00921D 1F 07            [ 2] 3202 	ldw (RET_INW+2,sp),x
      00921F 85               [ 2] 3203 	popw x 
      009220 20 D3            [ 2] 3204 	jra jp_to_target
                                   3205 
                                   3206 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3207 ; BASIC: RETURN 
                                   3208 ; exit from a subroutine 
                                   3209 ; 
                                   3210 ;------------------------
      009222                       3211 return:
      009222 72 00 00 21 05   [ 2] 3212 	btjt flags,#FRUN,0$ 
      009227 A6 06            [ 1] 3213 	ld a,#ERR_RUN_ONLY
      009229 CC 87 A8         [ 2] 3214 	jp tb_error 
      00922C                       3215 0$:	
      00922C 1E 03            [ 2] 3216 	ldw x,(RET_ADDR,sp) 
      00922E CF 00 05         [ 2] 3217 	ldw basicptr,x
      009231 E6 02            [ 1] 3218 	ld a,(2,x)
      009233 C7 00 04         [ 1] 3219 	ld count,a  
      009236 1E 05            [ 2] 3220 	ldw x,(RET_INW,sp)
      009238 CF 00 01         [ 2] 3221 	ldw in.w,x 
      00923B 85               [ 2] 3222 	popw x 
      0011BC                       3223 	_drop VSIZE 
      00923C 5B 04            [ 2]    1     addw sp,#VSIZE 
      00923E 89               [ 2] 3224 	pushw x
      00923F 81               [ 4] 3225 	ret  
                                   3226 
                                   3227 
                                   3228 ;----------------------------------
                                   3229 ; BASIC: RUN
                                   3230 ; run BASIC program in RAM
                                   3231 ;----------------------------------- 
      009240                       3232 run: 
      009240 72 01 00 21 02   [ 2] 3233 	btjf flags,#FRUN,0$  
      009245 4F               [ 1] 3234 	clr a 
      009246 81               [ 4] 3235 	ret
      009247                       3236 0$: 
      009247 72 09 00 21 12   [ 2] 3237 	btjf flags,#FBREAK,1$
      0011CC                       3238 	_drop 2 
      00924C 5B 02            [ 2]    1     addw sp,#2 
      00924E CD 8F C0         [ 4] 3239 	call rest_context
      0011D1                       3240 	_drop CTXT_SIZE 
      009251 5B 04            [ 2]    1     addw sp,#CTXT_SIZE 
      009253 72 19 00 21      [ 1] 3241 	bres flags,#FBREAK 
      009257 72 10 00 21      [ 1] 3242 	bset flags,#FRUN 
      00925B CC 88 49         [ 2] 3243 	jp interpreter 
      00925E CE 00 1A         [ 2] 3244 1$:	ldw x,txtbgn
      009261 C3 00 1C         [ 2] 3245 	cpw x,txtend 
      009264 2B 0C            [ 1] 3246 	jrmi run_it 
      009266 AE 87 3F         [ 2] 3247 	ldw x,#err_no_prog
      009269 CD 9F 0C         [ 4] 3248 	call puts 
      00926C 55 00 04 00 02   [ 1] 3249 	mov in,count
      009271 81               [ 4] 3250 	ret 
      009272                       3251 run_it:	 
      009272 CD 8E 61         [ 4] 3252     call ubound 
      0011F5                       3253 	_drop 2 ; drop return address 
      009275 5B 02            [ 2]    1     addw sp,#2 
                                   3254 ; clear data pointer 
      009277 5F               [ 1] 3255 	clrw x 
      009278 CF 00 07         [ 2] 3256 	ldw data_ptr,x 
      00927B 72 5F 00 09      [ 1] 3257 	clr data_ofs 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00927F 72 5F 00 0A      [ 1] 3258 	clr data_len 
                                   3259 ; initialize BASIC pointer 
      009283 CE 00 1A         [ 2] 3260 	ldw x,txtbgn 
      009286 CF 00 05         [ 2] 3261 	ldw basicptr,x 
      009289 E6 02            [ 1] 3262 	ld a,(2,x)
      00928B C7 00 04         [ 1] 3263 	ld count,a
      00928E 35 03 00 02      [ 1] 3264 	mov in,#3	
      009292 72 10 00 21      [ 1] 3265 	bset flags,#FRUN 
      009296 CC 88 49         [ 2] 3266 	jp interpreter 
                                   3267 
                                   3268 
                                   3269 ;----------------------
                                   3270 ; BASIC: END
                                   3271 ; end running program
                                   3272 ;---------------------- 
      009299                       3273 cmd_end: 
                                   3274 ; clean stack 
      009299 AE 17 FF         [ 2] 3275 	ldw x,#STACK_EMPTY
      00929C 94               [ 1] 3276 	ldw sp,x 
      00929D CC 88 2A         [ 2] 3277 	jp warm_start
                                   3278 
                                   3279 ;-----------------
                                   3280 ; 1 Khz beep 
                                   3281 ;-----------------
      0092A0                       3282 beep_1khz:: 
      0092A0 AE 00 64         [ 2] 3283 	ldw x,#100
      0092A3 90 AE 03 E8      [ 2] 3284 	ldw y,#1000
      0092A7 20 0D            [ 2] 3285 	jra beep
                                   3286 
                                   3287 ;-----------------------
                                   3288 ; BASIC: TONE expr1,expr2
                                   3289 ; used TIMER2 channel 1
                                   3290 ; to produce a tone 
                                   3291 ; arguments:
                                   3292 ;    expr1   frequency 
                                   3293 ;    expr2   duration msec.
                                   3294 ;---------------------------
      0092A9                       3295 tone:
      0092A9 CD 8C 4E         [ 4] 3296 	call arg_list 
      0092AC A1 02            [ 1] 3297 	cp a,#2 
      0092AE 27 03            [ 1] 3298 	jreq 1$
      0092B0 CC 87 A6         [ 2] 3299 	jp syntax_error 
      0092B3                       3300 1$: 
      0092B3 85               [ 2] 3301 	popw x ; duration
      0092B4 90 85            [ 2] 3302 	popw y ; frequency 
      0092B6                       3303 beep:  
      0092B6 89               [ 2] 3304 	pushw x 
      0092B7 AE F4 24         [ 2] 3305 	ldw x,#TIM2_CLK_FREQ
      0092BA 65               [ 2] 3306 	divw x,y 
                                   3307 ; round to nearest integer 
      0092BB 90 A3 7A 12      [ 2] 3308 	cpw y,#TIM2_CLK_FREQ/2
      0092BF 2B 01            [ 1] 3309 	jrmi 2$
      0092C1 5C               [ 1] 3310 	incw x 
      0092C2                       3311 2$:	 
      0092C2 9E               [ 1] 3312 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0092C3 C7 53 0D         [ 1] 3313 	ld TIM2_ARRH,a 
      0092C6 9F               [ 1] 3314 	ld a,xl 
      0092C7 C7 53 0E         [ 1] 3315 	ld TIM2_ARRL,a 
                                   3316 ; 50% duty cycle 
      0092CA 8C               [ 1] 3317 	ccf 
      0092CB 56               [ 2] 3318 	rrcw x 
      0092CC 9E               [ 1] 3319 	ld a,xh 
      0092CD C7 53 0F         [ 1] 3320 	ld TIM2_CCR1H,a 
      0092D0 9F               [ 1] 3321 	ld a,xl
      0092D1 C7 53 10         [ 1] 3322 	ld TIM2_CCR1L,a
      0092D4 72 10 53 08      [ 1] 3323 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0092D8 72 10 53 00      [ 1] 3324 	bset TIM2_CR1,#TIM2_CR1_CEN
      0092DC 72 10 53 04      [ 1] 3325 	bset TIM2_EGR,#TIM2_EGR_UG
      0092E0 85               [ 2] 3326 	popw x 
      0092E1 CD 95 78         [ 4] 3327 	call pause02
      0092E4 72 11 53 08      [ 1] 3328 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0092E8 72 11 53 00      [ 1] 3329 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0092EC 81               [ 4] 3330 	ret 
                                   3331 
                                   3332 ;-------------------------------
                                   3333 ; BASIC: ADCON 0|1 [,divisor]  
                                   3334 ; disable/enanble ADC 
                                   3335 ;-------------------------------
                           000003  3336 	ONOFF=3 
                           000001  3337 	DIVSOR=1
                           000004  3338 	VSIZE=4 
      0092ED                       3339 power_adc:
      0092ED CD 8C 4E         [ 4] 3340 	call arg_list 
      0092F0 A1 02            [ 1] 3341 	cp a,#2	
      0092F2 27 0B            [ 1] 3342 	jreq 1$
      0092F4 A1 01            [ 1] 3343 	cp a,#1 
      0092F6 27 03            [ 1] 3344 	jreq 0$ 
      0092F8 CC 87 A6         [ 2] 3345 	jp syntax_error 
      0092FB AE 00 00         [ 2] 3346 0$: ldw x,#0
      0092FE 89               [ 2] 3347 	pushw x  ; divisor 
      0092FF 1E 03            [ 2] 3348 1$: ldw x,(ONOFF,sp)
      009301 5D               [ 2] 3349 	tnzw x 
      009302 27 1A            [ 1] 3350 	jreq 2$ 
      009304 1E 01            [ 2] 3351 	ldw x,(DIVSOR,sp) ; divisor 
      009306 9F               [ 1] 3352 	ld a,xl
      009307 A4 07            [ 1] 3353 	and a,#7
      009309 4E               [ 1] 3354 	swap a 
      00930A C7 54 01         [ 1] 3355 	ld ADC_CR1,a
      00930D 72 16 50 CA      [ 1] 3356 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009311 72 10 54 01      [ 1] 3357 	bset ADC_CR1,#ADC_CR1_ADON 
      001295                       3358 	_usec_dly 7 
      009315 AE 00 1B         [ 2]    1     ldw x,#(16*7-2)/4
      009318 5A               [ 2]    2     decw x
      009319 9D               [ 1]    3     nop 
      00931A 26 FA            [ 1]    4     jrne .-4
      00931C 20 08            [ 2] 3359 	jra 3$
      00931E 72 11 54 01      [ 1] 3360 2$: bres ADC_CR1,#ADC_CR1_ADON
      009322 72 17 50 CA      [ 1] 3361 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0012A6                       3362 3$:	_drop VSIZE 
      009326 5B 04            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      009328 81               [ 4] 3363 	ret
                                   3364 
                                   3365 ;-----------------------------
                                   3366 ; BASIC: ADCREAD (channel)
                                   3367 ; read adc channel {0..5}
                                   3368 ; output:
                                   3369 ;   A 		TK_INTGR 
                                   3370 ;   X 		value 
                                   3371 ;-----------------------------
      009329                       3372 analog_read:
      009329 CD 8C 49         [ 4] 3373 	call func_args 
      00932C A1 01            [ 1] 3374 	cp a,#1 
      00932E 27 03            [ 1] 3375 	jreq 1$
      009330 CC 87 A6         [ 2] 3376 	jp syntax_error
      009333 85               [ 2] 3377 1$: popw x 
      009334 A3 00 05         [ 2] 3378 	cpw x,#5 
      009337 23 05            [ 2] 3379 	jrule 2$
      009339 A6 0A            [ 1] 3380 	ld a,#ERR_BAD_VALUE
      00933B CC 87 A8         [ 2] 3381 	jp tb_error 
      00933E 9F               [ 1] 3382 2$: ld a,xl
      00933F C7 00 0E         [ 1] 3383 	ld acc8,a 
      009342 A6 05            [ 1] 3384 	ld a,#5
      009344 C0 00 0E         [ 1] 3385 	sub a,acc8 
      009347 C7 54 00         [ 1] 3386 	ld ADC_CSR,a
      00934A 72 16 54 02      [ 1] 3387 	bset ADC_CR2,#ADC_CR2_ALIGN
      00934E 72 10 54 01      [ 1] 3388 	bset ADC_CR1,#ADC_CR1_ADON
      009352 72 0F 54 00 FB   [ 2] 3389 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009357 CE 54 04         [ 2] 3390 	ldw x,ADC_DRH
      00935A A6 84            [ 1] 3391 	ld a,#TK_INTGR
      00935C 81               [ 4] 3392 	ret 
                                   3393 
                                   3394 ;-----------------------
                                   3395 ; BASIC: DREAD(pin)
                                   3396 ; Arduino pins 
                                   3397 ; read state of a digital pin 
                                   3398 ; pin# {0..15}
                                   3399 ; output:
                                   3400 ;    A 		TK_INTGR
                                   3401 ;    X      0|1 
                                   3402 ;-------------------------
                           000001  3403 	PINNO=1
                           000001  3404 	VSIZE=1
      00935D                       3405 digital_read:
      0012DD                       3406 	_vars VSIZE 
      00935D 52 01            [ 2]    1     sub sp,#VSIZE 
      00935F CD 8C 49         [ 4] 3407 	call func_args
      009362 A1 01            [ 1] 3408 	cp a,#1
      009364 27 03            [ 1] 3409 	jreq 1$
      009366 CC 87 A6         [ 2] 3410 	jp syntax_error
      009369 85               [ 2] 3411 1$: popw x 
      00936A A3 00 0F         [ 2] 3412 	cpw x,#15 
      00936D 23 05            [ 2] 3413 	jrule 2$
      00936F A6 0A            [ 1] 3414 	ld a,#ERR_BAD_VALUE
      009371 CC 87 A8         [ 2] 3415 	jp tb_error 
      009374 CD 96 B6         [ 4] 3416 2$:	call select_pin 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009377 6B 01            [ 1] 3417 	ld (PINNO,sp),a
      009379 E6 01            [ 1] 3418 	ld a,(GPIO_IDR,x)
      00937B 0D 01            [ 1] 3419 	tnz (PINNO,sp)
      00937D 27 05            [ 1] 3420 	jreq 8$
      00937F 44               [ 1] 3421 3$: srl a 
      009380 0A 01            [ 1] 3422 	dec (PINNO,sp)
      009382 26 FB            [ 1] 3423 	jrne 3$ 
      009384 A4 01            [ 1] 3424 8$: and a,#1 
      009386 5F               [ 1] 3425 	clrw x 
      009387 97               [ 1] 3426 	ld xl,a 
      009388 A6 84            [ 1] 3427 	ld a,#TK_INTGR
      00130A                       3428 	_drop VSIZE
      00938A 5B 01            [ 2]    1     addw sp,#VSIZE 
      00938C 81               [ 4] 3429 	ret
                                   3430 
                                   3431 
                                   3432 ;-----------------------
                                   3433 ; BASIC: DWRITE pin,0|1
                                   3434 ; Arduino pins 
                                   3435 ; write to a digital pin 
                                   3436 ; pin# {0..15}
                                   3437 ; output:
                                   3438 ;    A 		TK_INTGR
                                   3439 ;    X      0|1 
                                   3440 ;-------------------------
                           000001  3441 	PINNO=1
                           000002  3442 	PINVAL=2
                           000002  3443 	VSIZE=2
      00938D                       3444 digital_write:
      00130D                       3445 	_vars VSIZE 
      00938D 52 02            [ 2]    1     sub sp,#VSIZE 
      00938F CD 8C 4E         [ 4] 3446 	call arg_list  
      009392 A1 02            [ 1] 3447 	cp a,#2 
      009394 27 03            [ 1] 3448 	jreq 1$
      009396 CC 87 A6         [ 2] 3449 	jp syntax_error
      009399 85               [ 2] 3450 1$: popw x 
      00939A 9F               [ 1] 3451 	ld a,xl 
      00939B 6B 02            [ 1] 3452 	ld (PINVAL,sp),a
      00939D 85               [ 2] 3453 	popw x 
      00939E A3 00 0F         [ 2] 3454 	cpw x,#15 
      0093A1 23 05            [ 2] 3455 	jrule 2$
      0093A3 A6 0A            [ 1] 3456 	ld a,#ERR_BAD_VALUE
      0093A5 CC 87 A8         [ 2] 3457 	jp tb_error 
      0093A8 CD 96 B6         [ 4] 3458 2$:	call select_pin 
      0093AB 6B 01            [ 1] 3459 	ld (PINNO,sp),a 
      0093AD A6 01            [ 1] 3460 	ld a,#1
      0093AF 0D 01            [ 1] 3461 	tnz (PINNO,sp)
      0093B1 27 05            [ 1] 3462 	jreq 4$
      0093B3 48               [ 1] 3463 3$: sll a
      0093B4 0A 01            [ 1] 3464 	dec (PINNO,sp)
      0093B6 26 FB            [ 1] 3465 	jrne 3$
      0093B8 0D 02            [ 1] 3466 4$: tnz (PINVAL,sp)
      0093BA 26 05            [ 1] 3467 	jrne 5$
      0093BC 43               [ 1] 3468 	cpl a 
      0093BD E4 00            [ 1] 3469 	and a,(GPIO_ODR,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0093BF 20 02            [ 2] 3470 	jra 8$
      0093C1 EA 00            [ 1] 3471 5$: or a,(GPIO_ODR,x)
      0093C3 E7 00            [ 1] 3472 8$: ld (GPIO_ODR,x),a 
      001345                       3473 	_drop VSIZE 
      0093C5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0093C7 81               [ 4] 3474 	ret
                                   3475 
                                   3476 
                                   3477 ;-----------------------
                                   3478 ; BASIC: STOP
                                   3479 ; stop progam execution  
                                   3480 ; without resetting pointers 
                                   3481 ; the program is resumed
                                   3482 ; with RUN 
                                   3483 ;-------------------------
      0093C8                       3484 stop:
      0093C8 72 00 00 21 02   [ 2] 3485 	btjt flags,#FRUN,2$
      0093CD 4F               [ 1] 3486 	clr a
      0093CE 81               [ 4] 3487 	ret 
      0093CF                       3488 2$:	 
                                   3489 ; create space on cstack to save context 
      0093CF AE 93 F6         [ 2] 3490 	ldw x,#break_point 
      0093D2 CD 9F 0C         [ 4] 3491 	call puts 
      001355                       3492 	_drop 2 ;drop return address 
      0093D5 5B 02            [ 2]    1     addw sp,#2 
      001357                       3493 	_vars CTXT_SIZE ; context size 
      0093D7 52 04            [ 2]    1     sub sp,#CTXT_SIZE 
      0093D9 CD 8F B0         [ 4] 3494 	call save_context 
      0093DC AE 16 90         [ 2] 3495 	ldw x,#tib 
      0093DF CF 00 05         [ 2] 3496 	ldw basicptr,x
      0093E2 7F               [ 1] 3497 	clr (x)
      0093E3 72 5F 00 04      [ 1] 3498 	clr count  
      0093E7 5F               [ 1] 3499 	clrw x 
      0093E8 CF 00 01         [ 2] 3500 	ldw in.w,x
      0093EB 72 11 00 21      [ 1] 3501 	bres flags,#FRUN 
      0093EF 72 18 00 21      [ 1] 3502 	bset flags,#FBREAK
      0093F3 CC 88 49         [ 2] 3503 	jp interpreter 
      0093F6 0A 62 72 65 61 6B 20  3504 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3505 
                                   3506 ;-----------------------
                                   3507 ; BASIC: NEW
                                   3508 ; from command line only 
                                   3509 ; free program memory
                                   3510 ; and clear variables 
                                   3511 ;------------------------
      009414                       3512 new: 
      009414 72 01 00 21 01   [ 2] 3513 	btjf flags,#FRUN,0$ 
      009419 81               [ 4] 3514 	ret 
      00941A                       3515 0$:	
      00941A CD 86 10         [ 4] 3516 	call clear_basic 
      00941D 81               [ 4] 3517 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3518 
                                   3519 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3520 ;;;  flash memory operations
                                   3521 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3522 
                                   3523 ;--------------------------
                                   3524 ; align farptr to BLOCK_SIZE 
                                   3525 ;---------------------------
      00941E                       3526 row_align:
      00941E A6 7F            [ 1] 3527 	ld a,#0x7f 
      009420 C4 00 19         [ 1] 3528 	and a,farptr+2 
      009423 27 13            [ 1] 3529 	jreq 1$ 
      009425 CE 00 18         [ 2] 3530 	ldw x,farptr+1 
      009428 1C 00 80         [ 2] 3531 	addw x,#BLOCK_SIZE 
      00942B 24 04            [ 1] 3532 	jrnc 0$
      00942D 72 5C 00 17      [ 1] 3533 	inc farptr 
      009431 9F               [ 1] 3534 0$: ld a,xl 
      009432 A4 80            [ 1] 3535 	and a,#0x80
      009434 97               [ 1] 3536 	ld xl,a
      009435 CF 00 18         [ 2] 3537 	ldw farptr+1,x  	
      009438 81               [ 4] 3538 1$:	ret
                                   3539 
                                   3540 ;--------------------
                                   3541 ; input:
                                   3542 ;   X     increment 
                                   3543 ; output:
                                   3544 ;   farptr  incremented 
                                   3545 ;---------------------
      009439                       3546 incr_farptr:
      009439 72 BB 00 18      [ 2] 3547 	addw x,farptr+1 
      00943D 24 04            [ 1] 3548 	jrnc 1$
      00943F 72 5C 00 17      [ 1] 3549 	inc farptr 
      009443 CF 00 18         [ 2] 3550 1$:	ldw farptr+1,x  
      009446 81               [ 4] 3551 	ret 
                                   3552 
                                   3553 ;-----------------------------------
                                   3554 ; scan block for non zero byte 
                                   3555 ; block are 128 bytes 
                                   3556 ; input:
                                   3557 ;    farptr     address block  
                                   3558 ; output:
                                   3559 ;     A     0 cleared, other not cleared  
                                   3560 ;-----------------------------------
      009447                       3561 scan_block:
      009447 5F               [ 1] 3562 	clrw x 
      009448 92 AF 00 17      [ 5] 3563 1$: ldf a,([farptr],x) 
      00944C 26 06            [ 1] 3564 	jrne 2$
      00944E 5C               [ 1] 3565 	incw x 
      00944F A3 00 80         [ 2] 3566 	cpw x,#BLOCK_SIZE 
      009452 25 F4            [ 1] 3567 	jrult 1$ 
      009454 81               [ 4] 3568 2$:	ret 
                                   3569 
                                   3570 
                                   3571 
                                   3572 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3573 ; BASIC: ERASE
                                   3574 ; erase all block in range from 
                                   3575 ;  'app_space' to RAM end (0x20000)
                                   3576 ; that contains a non zero byte.  
                                   3577 ;-----------------------------------
      009455                       3578 erase:
                                   3579  ; operation done from RAM
                                   3580  ; copy code to RAM in tib   
      009455 CD 81 B2         [ 4] 3581 	call move_erase_to_ram
                                   3582 	; first block 
      009458 72 5F 00 17      [ 1] 3583 	clr farptr 
      00945C AE A9 00         [ 2] 3584 	ldw x,#app_space
      00945F CF 00 18         [ 2] 3585 	ldw farptr+1,x
      009462                       3586 1$:	 
      009462 CD 94 47         [ 4] 3587     call scan_block 
      009465 27 03            [ 1] 3588 	jreq 2$
      009467 CD 82 2D         [ 4] 3589 	call block_erase   
                                   3590 ; this block is clean, next  
      00946A AE 00 80         [ 2] 3591 2$:	ldw x,#BLOCK_SIZE
      00946D CD 94 39         [ 4] 3592 	call incr_farptr
      009470 C6 00 17         [ 1] 3593 	ld a,farptr
      009473 A1 02            [ 1] 3594 	cp a,#2 
      009475 25 EB            [ 1] 3595 	jrult 1$ 
      009477                       3596 9$: 
      009477 81               [ 4] 3597 	 ret 
                                   3598 
                                   3599 
                                   3600 ;---------------------
                                   3601 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3602 ; write 1 or more byte to FLASH or EEPROM
                                   3603 ; starting at address  
                                   3604 ; input:
                                   3605 ;   expr1  	is address 
                                   3606 ;   expr2,...,exprn   are bytes to write
                                   3607 ; output:
                                   3608 ;   none 
                                   3609 ;---------------------
                           000001  3610 	ADDR=1
                           000002  3611 	VSIZ=2 
      009478                       3612 write:
      0013F8                       3613 	_vars VSIZE 
      009478 52 02            [ 2]    1     sub sp,#VSIZE 
      00947A 72 5F 00 17      [ 1] 3614 	clr farptr ; expect 16 bits address 
      00947E CD 8D 4D         [ 4] 3615 	call expression
      009481 A1 84            [ 1] 3616 	cp a,#TK_INTGR 
      009483 27 03            [ 1] 3617 	jreq 0$
      009485 CC 87 A6         [ 2] 3618 	jp syntax_error
      009488 1F 01            [ 2] 3619 0$: ldw (ADDR,sp),x 
      00948A CD 88 95         [ 4] 3620 	call next_token 
      00948D A1 09            [ 1] 3621 	cp a,#TK_COMMA 
      00948F 27 02            [ 1] 3622 	jreq 1$ 
      009491 20 19            [ 2] 3623 	jra 9$ 
      009493 CD 8D 4D         [ 4] 3624 1$:	call expression
      009496 A1 84            [ 1] 3625 	cp a,#TK_INTGR
      009498 27 03            [ 1] 3626 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00949A CC 87 A6         [ 2] 3627 	jp syntax_error
      00949D 9F               [ 1] 3628 2$:	ld a,xl 
      00949E 1E 01            [ 2] 3629 	ldw x,(ADDR,sp) 
      0094A0 CF 00 18         [ 2] 3630 	ldw farptr+1,x 
      0094A3 5F               [ 1] 3631 	clrw x 
      0094A4 CD 82 57         [ 4] 3632 	call write_byte
      0094A7 1E 01            [ 2] 3633 	ldw x,(ADDR,sp)
      0094A9 5C               [ 1] 3634 	incw x 
      0094AA 20 DC            [ 2] 3635 	jra 0$ 
      0094AC                       3636 9$:
      00142C                       3637 	_drop VSIZE
      0094AC 5B 02            [ 2]    1     addw sp,#VSIZE 
      0094AE 81               [ 4] 3638 	ret 
                                   3639 
                                   3640 
                                   3641 ;---------------------
                                   3642 ;BASIC: CHAR(expr)
                                   3643 ; évaluate expression 
                                   3644 ; and take the 7 least 
                                   3645 ; bits as ASCII character
                                   3646 ; return a TK_CHAR 
                                   3647 ;---------------------
      0094AF                       3648 char:
      0094AF CD 8C 49         [ 4] 3649 	call func_args 
      0094B2 A1 01            [ 1] 3650 	cp a,#1
      0094B4 27 03            [ 1] 3651 	jreq 1$
      0094B6 CC 87 A6         [ 2] 3652 	jp syntax_error
      0094B9 85               [ 2] 3653 1$:	popw x 
      0094BA 9F               [ 1] 3654 	ld a,xl 
      0094BB A4 7F            [ 1] 3655 	and a,#0x7f 
      0094BD 97               [ 1] 3656 	ld xl,a
      0094BE A6 03            [ 1] 3657 	ld a,#TK_CHAR
      0094C0 81               [ 4] 3658 	ret
                                   3659 
                                   3660 ;---------------------
                                   3661 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3662 ; extract first character 
                                   3663 ; of string argument 
                                   3664 ; return it as TK_INTGR 
                                   3665 ;---------------------
      0094C1                       3666 ascii:
      0094C1 A6 07            [ 1] 3667 	ld a,#TK_LPAREN
      0094C3 CD 8C 3C         [ 4] 3668 	call expect 
      0094C6 CD 88 95         [ 4] 3669 	call next_token 
      0094C9 A1 02            [ 1] 3670 	cp a,#TK_QSTR 
      0094CB 27 0E            [ 1] 3671 	jreq 1$
      0094CD A1 03            [ 1] 3672 	cp a,#TK_CHAR 
      0094CF 27 0D            [ 1] 3673 	jreq 2$ 
      0094D1 A1 82            [ 1] 3674 	cp a,#TK_CFUNC 
      0094D3 27 03            [ 1] 3675 	jreq 0$
      0094D5 CC 87 A6         [ 2] 3676 	jp syntax_error
      0094D8 FD               [ 4] 3677 0$: call (x)
      0094D9 20 03            [ 2] 3678 	jra 2$
      0094DB                       3679 1$: 
      0094DB F6               [ 1] 3680 	ld a,(x) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0094DC 5F               [ 1] 3681 	clrw x
      0094DD 97               [ 1] 3682 	ld xl,a 
      0094DE                       3683 2$: 
      0094DE 89               [ 2] 3684 	pushw x 
      0094DF A6 08            [ 1] 3685 	ld a,#TK_RPAREN 
      0094E1 CD 8C 3C         [ 4] 3686 	call expect
      0094E4 85               [ 2] 3687 	popw x 
      0094E5 A6 84            [ 1] 3688 	ld a,#TK_INTGR 
      0094E7 81               [ 4] 3689 	ret 
                                   3690 
                                   3691 ;---------------------
                                   3692 ;BASIC: KEY
                                   3693 ; wait for a character 
                                   3694 ; received from STDIN 
                                   3695 ; input:
                                   3696 ;	none 
                                   3697 ; output:
                                   3698 ;	X 		ASCII character 
                                   3699 ;---------------------
      0094E8                       3700 key:
      0094E8 CD 83 42         [ 4] 3701 	call getc 
      0094EB 5F               [ 1] 3702 	clrw x 
      0094EC 97               [ 1] 3703 	ld xl,a 
      0094ED A6 84            [ 1] 3704 	ld a,#TK_INTGR
      0094EF 81               [ 4] 3705 	ret
                                   3706 
                                   3707 ;----------------------
                                   3708 ; BASIC: QKEY
                                   3709 ; Return true if there 
                                   3710 ; is a character in 
                                   3711 ; waiting in STDIN 
                                   3712 ; input:
                                   3713 ;  none 
                                   3714 ; output:
                                   3715 ;   X 		0|-1 
                                   3716 ;-----------------------
      0094F0                       3717 qkey:: 
      0094F0 5F               [ 1] 3718 	clrw x 
      0094F1 C6 00 2B         [ 1] 3719 	ld a,rx1_head
      0094F4 C1 00 2C         [ 1] 3720 	cp a,rx1_tail 
      0094F7 27 01            [ 1] 3721 	jreq 9$ 
      0094F9 53               [ 2] 3722 	cplw x 
      0094FA A6 84            [ 1] 3723 9$: ld a,#TK_INTGR
      0094FC 81               [ 4] 3724 	ret 
                                   3725 
                                   3726 ;---------------------
                                   3727 ; BASIC: GPIO(expr,reg)
                                   3728 ; return gpio address 
                                   3729 ; expr {0..8}
                                   3730 ; input:
                                   3731 ;   none 
                                   3732 ; output:
                                   3733 ;   X 		gpio register address
                                   3734 ;----------------------------
                           000003  3735 	PORT=3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                           000001  3736 	REG=1 
                           000004  3737 	VSIZE=4 
      0094FD                       3738 gpio:
      0094FD CD 8C 49         [ 4] 3739 	call func_args 
      009500 A1 02            [ 1] 3740 	cp a,#2
      009502 27 03            [ 1] 3741 	jreq 1$
      009504 CC 87 A6         [ 2] 3742 	jp syntax_error  
      009507                       3743 1$:	
      009507 1E 03            [ 2] 3744 	ldw x,(PORT,sp)
      009509 2B 17            [ 1] 3745 	jrmi bad_port
      00950B A3 00 09         [ 2] 3746 	cpw x,#9
      00950E 2A 12            [ 1] 3747 	jrpl bad_port
      009510 A6 05            [ 1] 3748 	ld a,#5
      009512 42               [ 4] 3749 	mul x,a
      009513 1C 50 00         [ 2] 3750 	addw x,#GPIO_BASE 
      009516 1F 03            [ 2] 3751 	ldw (PORT,sp),x  
      009518 1E 01            [ 2] 3752 	ldw x,(REG,sp) 
      00951A 72 FB 03         [ 2] 3753 	addw x,(PORT,sp)
      00951D A6 84            [ 1] 3754 	ld a,#TK_INTGR
      00149F                       3755 	_drop VSIZE 
      00951F 5B 04            [ 2]    1     addw sp,#VSIZE 
      009521 81               [ 4] 3756 	ret
      009522                       3757 bad_port:
      009522 A6 0A            [ 1] 3758 	ld a,#ERR_BAD_VALUE
      009524 CC 87 A8         [ 2] 3759 	jp tb_error
                                   3760 
                                   3761 
                                   3762 ;-------------------------
                                   3763 ; BASIC: UFLASH 
                                   3764 ; return free flash address
                                   3765 ; input:
                                   3766 ;  none 
                                   3767 ; output:
                                   3768 ;	A		TK_INTGR
                                   3769 ;   X 		free address 
                                   3770 ;---------------------------
      009527                       3771 uflash:
      009527 CE A9 00         [ 2] 3772 	ldw x,app_sign
      00952A A3 10 93         [ 2] 3773 	cpw x,#4243 ; signature "BC" 
      00952D 27 08            [ 1] 3774 	jreq 1$
      00952F CE A9 02         [ 2] 3775 	ldw x,app_size 
      009532 1C A9 04         [ 2] 3776 	addw x,#app
      009535 20 03            [ 2] 3777 	jra 2$
      009537 AE A9 00         [ 2] 3778 1$:	ldw x,#app_space 
      00953A A6 84            [ 1] 3779 2$:	ld a,#TK_INTGR 
      00953C 81               [ 4] 3780 	ret 
                                   3781 
                                   3782 
                                   3783 ;---------------------
                                   3784 ; BASIC: USR(addr[,arg])
                                   3785 ; execute a function written 
                                   3786 ; in binary code.
                                   3787 ; binary fonction should 
                                   3788 ; return token attribute in A 
                                   3789 ; and value in X. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3790 ; input:
                                   3791 ;   addr	routine address 
                                   3792 ;   arg 	is an optional argument 
                                   3793 ; output:
                                   3794 ;   A 		token attribute 
                                   3795 ;   X       returned value 
                                   3796 ;---------------------
      00953D                       3797 usr:
      00953D 90 89            [ 2] 3798 	pushw y 	
      00953F CD 8C 49         [ 4] 3799 	call func_args 
      009542 A1 01            [ 1] 3800 	cp a,#1 
      009544 27 07            [ 1] 3801 	jreq 2$
      009546 A1 02            [ 1] 3802 	cp a,#2
      009548 27 03            [ 1] 3803 	jreq 2$  
      00954A CC 87 A6         [ 2] 3804 	jp syntax_error 
      00954D 90 85            [ 2] 3805 2$: popw y  ; arg|addr 
      00954F A1 01            [ 1] 3806 	cp a,#1
      009551 27 02            [ 1] 3807 	jreq 3$
      009553 85               [ 2] 3808 	popw x ; addr
      009554 51               [ 1] 3809 	exgw x,y 
      009555 90 FD            [ 4] 3810 3$: call (y)
      009557 90 85            [ 2] 3811 	popw y 
      009559 81               [ 4] 3812 	ret 
                                   3813 
                                   3814 ;------------------------------
                                   3815 ; BASIC: BYE 
                                   3816 ; halt mcu in its lowest power mode 
                                   3817 ; wait for reset or external interrupt
                                   3818 ; do a cold start on wakeup.
                                   3819 ;------------------------------
      00955A                       3820 bye:
      00955A 72 0D 52 30 FB   [ 2] 3821 	btjf UART1_SR,#UART_SR_TC,.
      00955F 8E               [10] 3822 	halt
      009560 CC 84 EF         [ 2] 3823 	jp cold_start  
                                   3824 
                                   3825 ;----------------------------------
                                   3826 ; BASIC: SLEEP 
                                   3827 ; halt mcu until reset or external
                                   3828 ; interrupt.
                                   3829 ; Resume progam after SLEEP command
                                   3830 ;----------------------------------
      009563                       3831 sleep:
      009563 72 0D 52 30 FB   [ 2] 3832 	btjf UART1_SR,#UART_SR_TC,.
      009568 72 16 00 21      [ 1] 3833 	bset flags,#FSLEEP
      00956C 8E               [10] 3834 	halt 
      00956D 81               [ 4] 3835 	ret 
                                   3836 
                                   3837 ;-------------------------------
                                   3838 ; BASIC: PAUSE expr 
                                   3839 ; suspend execution for n msec.
                                   3840 ; input:
                                   3841 ;	none
                                   3842 ; output:
                                   3843 ;	none 
                                   3844 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00956E                       3845 pause:
      00956E CD 8D 4D         [ 4] 3846 	call expression
      009571 A1 84            [ 1] 3847 	cp a,#TK_INTGR
      009573 27 03            [ 1] 3848 	jreq pause02 
      009575 CC 87 A6         [ 2] 3849 	jp syntax_error
      009578                       3850 pause02: 
      009578 5D               [ 2] 3851 1$: tnzw x 
      009579 27 04            [ 1] 3852 	jreq 2$
      00957B 8F               [10] 3853 	wfi 
      00957C 5A               [ 2] 3854 	decw x 
      00957D 26 F9            [ 1] 3855 	jrne 1$
      00957F 4F               [ 1] 3856 2$:	clr a 
      009580 81               [ 4] 3857 	ret 
                                   3858 
                                   3859 ;------------------------------
                                   3860 ; BASIC: AWU expr
                                   3861 ; halt mcu for 'expr' milliseconds
                                   3862 ; use Auto wakeup peripheral
                                   3863 ; all oscillators stopped except LSI
                                   3864 ; range: 1ms - 511ms
                                   3865 ; input:
                                   3866 ;  none
                                   3867 ; output:
                                   3868 ;  none:
                                   3869 ;------------------------------
      009581                       3870 awu:
      009581 CD 8D 4D         [ 4] 3871   call expression
      009584 A1 84            [ 1] 3872   cp a,#TK_INTGR
      009586 27 03            [ 1] 3873   jreq awu02
      009588 CC 87 A6         [ 2] 3874   jp syntax_error
      00958B                       3875 awu02:
      00958B A3 14 00         [ 2] 3876   cpw x,#5120
      00958E 2B 0C            [ 1] 3877   jrmi 1$ 
      009590 35 0F 50 F2      [ 1] 3878   mov AWU_TBR,#15 
      009594 A6 1E            [ 1] 3879   ld a,#30
      009596 62               [ 2] 3880   div x,a
      009597 A6 10            [ 1] 3881   ld a,#16
      009599 62               [ 2] 3882   div x,a 
      00959A 20 1E            [ 2] 3883   jra 4$
      00959C                       3884 1$: 
      00959C A3 08 00         [ 2] 3885   cpw x,#2048
      00959F 2B 09            [ 1] 3886   jrmi 2$ 
      0095A1 35 0E 50 F2      [ 1] 3887   mov AWU_TBR,#14
      0095A5 A6 50            [ 1] 3888   ld a,#80
      0095A7 62               [ 2] 3889   div x,a 
      0095A8 20 10            [ 2] 3890   jra 4$   
      0095AA                       3891 2$:
      0095AA 35 07 50 F2      [ 1] 3892   mov AWU_TBR,#7
      0095AE                       3893 3$:  
                                   3894 ; while X > 64  divide by 2 and increment AWU_TBR 
      0095AE A3 00 40         [ 2] 3895   cpw x,#64 
      0095B1 23 07            [ 2] 3896   jrule 4$ 
      0095B3 72 5C 50 F2      [ 1] 3897   inc AWU_TBR 
      0095B7 54               [ 2] 3898   srlw x 
      0095B8 20 F4            [ 2] 3899   jra 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0095BA                       3900 4$:
      0095BA 9F               [ 1] 3901   ld a, xl
      0095BB 4A               [ 1] 3902   dec a 
      0095BC 27 01            [ 1] 3903   jreq 5$
      0095BE 4A               [ 1] 3904   dec a 	
      0095BF                       3905 5$: 
      0095BF A4 3E            [ 1] 3906   and a,#0x3e 
      0095C1 C7 50 F1         [ 1] 3907   ld AWU_APR,a 
      0095C4 72 18 50 F0      [ 1] 3908   bset AWU_CSR,#AWU_CSR_AWUEN
      0095C8 8E               [10] 3909   halt 
                                   3910 
      0095C9 81               [ 4] 3911   ret 
                                   3912 
                                   3913 ;------------------------------
                                   3914 ; BASIC: TICKS
                                   3915 ; return msec ticks counter value 
                                   3916 ; input:
                                   3917 ; 	none 
                                   3918 ; output:
                                   3919 ;	X 		TK_INTGR
                                   3920 ;-------------------------------
      0095CA                       3921 get_ticks:
      0095CA CE 00 0F         [ 2] 3922 	ldw x,ticks 
      0095CD A6 84            [ 1] 3923 	ld a,#TK_INTGR
      0095CF 81               [ 4] 3924 	ret 
                                   3925 
                                   3926 
                                   3927 
                                   3928 ;------------------------------
                                   3929 ; BASIC: ABS(expr)
                                   3930 ; return absolute value of expr.
                                   3931 ; input:
                                   3932 ;   none
                                   3933 ; output:
                                   3934 ;   X     	positive integer
                                   3935 ;-------------------------------
      0095D0                       3936 abs:
      0095D0 CD 8C 49         [ 4] 3937 	call func_args 
      0095D3 A1 01            [ 1] 3938 	cp a,#1 
      0095D5 27 03            [ 1] 3939 	jreq 0$ 
      0095D7 CC 87 A6         [ 2] 3940 	jp syntax_error
      0095DA                       3941 0$:  
      0095DA 85               [ 2] 3942     popw x   
      0095DB 9E               [ 1] 3943 	ld a,xh 
      0095DC A5 80            [ 1] 3944 	bcp a,#0x80 
      0095DE 27 01            [ 1] 3945 	jreq 2$ 
      0095E0 50               [ 2] 3946 	negw x 
      0095E1 A6 84            [ 1] 3947 2$: ld a,#TK_INTGR 
      0095E3 81               [ 4] 3948 	ret 
                                   3949 
                                   3950 ;------------------------------
                                   3951 ; BASIC: AND(expr1,expr2)
                                   3952 ; Apply bit AND relation between
                                   3953 ; the 2 arguments, i.e expr1 & expr2 
                                   3954 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3955 ; 	A 		TK_INTGR
                                   3956 ;   X 		result 
                                   3957 ;------------------------------
      0095E4                       3958 bit_and:
      0095E4 CD 8C 49         [ 4] 3959 	call func_args 
      0095E7 A1 02            [ 1] 3960 	cp a,#2
      0095E9 27 03            [ 1] 3961 	jreq 1$
      0095EB CC 87 A6         [ 2] 3962 	jp syntax_error 
      0095EE 85               [ 2] 3963 1$:	popw x 
      0095EF 9E               [ 1] 3964 	ld a,xh 
      0095F0 14 01            [ 1] 3965 	and a,(1,sp)
      0095F2 95               [ 1] 3966 	ld xh,a 
      0095F3 9F               [ 1] 3967 	ld a,xl
      0095F4 14 02            [ 1] 3968 	and a,(2,sp)
      0095F6 97               [ 1] 3969 	ld xl,a 
      001577                       3970 	_drop 2 
      0095F7 5B 02            [ 2]    1     addw sp,#2 
      0095F9 A6 84            [ 1] 3971 	ld a,#TK_INTGR
      0095FB 81               [ 4] 3972 	ret
                                   3973 
                                   3974 ;------------------------------
                                   3975 ; BASIC: OR(expr1,expr2)
                                   3976 ; Apply bit OR relation between
                                   3977 ; the 2 arguments, i.e expr1 | expr2 
                                   3978 ; output:
                                   3979 ; 	A 		TK_INTGR
                                   3980 ;   X 		result 
                                   3981 ;------------------------------
      0095FC                       3982 bit_or:
      0095FC CD 8C 49         [ 4] 3983 	call func_args 
      0095FF A1 02            [ 1] 3984 	cp a,#2
      009601 27 03            [ 1] 3985 	jreq 1$
      009603 CC 87 A6         [ 2] 3986 	jp syntax_error 
      009606                       3987 1$: 
      009606 85               [ 2] 3988 	popw x 
      009607 9E               [ 1] 3989 	ld a,xh 
      009608 1A 01            [ 1] 3990 	or a,(1,sp)
      00960A 95               [ 1] 3991 	ld xh,a 
      00960B 9F               [ 1] 3992 	ld a,xl 
      00960C 1A 02            [ 1] 3993 	or a,(2,sp)
      00960E 97               [ 1] 3994 	ld xl,a 
      00158F                       3995 	_drop 2 
      00960F 5B 02            [ 2]    1     addw sp,#2 
      009611 A6 84            [ 1] 3996 	ld a,#TK_INTGR 
      009613 81               [ 4] 3997 	ret
                                   3998 
                                   3999 ;------------------------------
                                   4000 ; BASIC: XOR(expr1,expr2)
                                   4001 ; Apply bit XOR relation between
                                   4002 ; the 2 arguments, i.e expr1 ^ expr2 
                                   4003 ; output:
                                   4004 ; 	A 		TK_INTGR
                                   4005 ;   X 		result 
                                   4006 ;------------------------------
      009614                       4007 bit_xor:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009614 CD 8C 49         [ 4] 4008 	call func_args 
      009617 A1 02            [ 1] 4009 	cp a,#2
      009619 27 03            [ 1] 4010 	jreq 1$
      00961B CC 87 A6         [ 2] 4011 	jp syntax_error 
      00961E                       4012 1$: 
      00961E 85               [ 2] 4013 	popw x 
      00961F 9E               [ 1] 4014 	ld a,xh 
      009620 18 01            [ 1] 4015 	xor a,(1,sp)
      009622 95               [ 1] 4016 	ld xh,a 
      009623 9F               [ 1] 4017 	ld a,xl 
      009624 18 02            [ 1] 4018 	xor a,(2,sp)
      009626 97               [ 1] 4019 	ld xl,a 
      0015A7                       4020 	_drop 2 
      009627 5B 02            [ 2]    1     addw sp,#2 
      009629 A6 84            [ 1] 4021 	ld a,#TK_INTGR 
      00962B 81               [ 4] 4022 	ret 
                                   4023 
                                   4024 ;------------------------------
                                   4025 ; BASIC: LSHIFT(expr1,expr2)
                                   4026 ; logical shift left expr1 by 
                                   4027 ; expr2 bits 
                                   4028 ; output:
                                   4029 ; 	A 		TK_INTGR
                                   4030 ;   X 		result 
                                   4031 ;------------------------------
      00962C                       4032 lshift:
      00962C CD 8C 49         [ 4] 4033 	call func_args
      00962F A1 02            [ 1] 4034 	cp a,#2 
      009631 27 03            [ 1] 4035 	jreq 1$
      009633 CC 87 A6         [ 2] 4036 	jp syntax_error
      009636 90 85            [ 2] 4037 1$: popw y   
      009638 85               [ 2] 4038 	popw x 
      009639 90 5D            [ 2] 4039 	tnzw y 
      00963B 27 05            [ 1] 4040 	jreq 4$
      00963D 58               [ 2] 4041 2$:	sllw x 
      00963E 90 5A            [ 2] 4042 	decw y 
      009640 26 FB            [ 1] 4043 	jrne 2$
      009642                       4044 4$:  
      009642 A6 84            [ 1] 4045 	ld a,#TK_INTGR
      009644 81               [ 4] 4046 	ret
                                   4047 
                                   4048 ;------------------------------
                                   4049 ; BASIC: RSHIFT(expr1,expr2)
                                   4050 ; logical shift right expr1 by 
                                   4051 ; expr2 bits.
                                   4052 ; output:
                                   4053 ; 	A 		TK_INTGR
                                   4054 ;   X 		result 
                                   4055 ;------------------------------
      009645                       4056 rshift:
      009645 CD 8C 49         [ 4] 4057 	call func_args
      009648 A1 02            [ 1] 4058 	cp a,#2 
      00964A 27 03            [ 1] 4059 	jreq 1$
      00964C CC 87 A6         [ 2] 4060 	jp syntax_error
      00964F 90 85            [ 2] 4061 1$: popw y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009651 85               [ 2] 4062 	popw x
      009652 90 5D            [ 2] 4063 	tnzw y 
      009654 27 05            [ 1] 4064 	jreq 4$
      009656 54               [ 2] 4065 2$:	srlw x 
      009657 90 5A            [ 2] 4066 	decw y 
      009659 26 FB            [ 1] 4067 	jrne 2$
      00965B                       4068 4$:  
      00965B A6 84            [ 1] 4069 	ld a,#TK_INTGR
      00965D 81               [ 4] 4070 	ret
                                   4071 
                                   4072 ;--------------------------
                                   4073 ; BASIC: FCPU integer
                                   4074 ; set CPU frequency 
                                   4075 ;-------------------------- 
                                   4076 
      00965E                       4077 fcpu:
      00965E A6 84            [ 1] 4078 	ld a,#TK_INTGR
      009660 CD 8C 3C         [ 4] 4079 	call expect 
      009663 9F               [ 1] 4080 	ld a,xl 
      009664 A4 07            [ 1] 4081 	and a,#7 
      009666 C7 50 C6         [ 1] 4082 	ld CLK_CKDIVR,a 
      009669 81               [ 4] 4083 	ret 
                                   4084 
                                   4085 ;------------------------------
                                   4086 ; BASIC: PMODE pin#, mode 
                                   4087 ; Arduino pin. 
                                   4088 ; define pin as input or output
                                   4089 ; pin#: {0..15}
                                   4090 ; mode: INPUT|OUTPUT  
                                   4091 ;------------------------------
                           000001  4092 	PINNO=1
                           000001  4093 	VSIZE=1
      00966A                       4094 pin_mode:
      0015EA                       4095 	_vars VSIZE 
      00966A 52 01            [ 2]    1     sub sp,#VSIZE 
      00966C CD 8C 4E         [ 4] 4096 	call arg_list 
      00966F A1 02            [ 1] 4097 	cp a,#2 
      009671 27 03            [ 1] 4098 	jreq 1$
      009673 CC 87 A6         [ 2] 4099 	jp syntax_error 
      009676 90 85            [ 2] 4100 1$: popw y ; mode 
      009678 85               [ 2] 4101 	popw x ; Dx pin 
      009679 CD 96 B6         [ 4] 4102 	call select_pin 
      00967C 6B 01            [ 1] 4103 	ld (PINNO,sp),a  
      00967E A6 01            [ 1] 4104 	ld a,#1 
      009680 0D 01            [ 1] 4105 	tnz (PINNO,sp)
      009682 27 0D            [ 1] 4106 	jreq 4$
      009684 48               [ 1] 4107 2$:	sll a 
      009685 0A 01            [ 1] 4108 	dec (PINNO,sp)
      009687 26 FB            [ 1] 4109 	jrne 2$ 
      009689 6B 01            [ 1] 4110 	ld (PINNO,sp),a
      00968B 7B 01            [ 1] 4111 	ld a,(PINNO,sp)
      00968D EA 03            [ 1] 4112 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00968F E7 03            [ 1] 4113 	ld (GPIO_CR1,x),a 
      009691 90 A3 00 01      [ 2] 4114 4$:	cpw y,#OUTP 
      009695 27 10            [ 1] 4115 	jreq 6$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4116 ; input mode
                                   4117 ; disable external interrupt 
      009697 7B 01            [ 1] 4118 	ld a,(PINNO,sp)
      009699 43               [ 1] 4119 	cpl a 
      00969A E4 04            [ 1] 4120 	and a,(GPIO_CR2,x)
      00969C E7 04            [ 1] 4121 	ld (GPIO_CR2,x),a 
                                   4122 ;clear bit in DDR for input mode 
      00969E 7B 01            [ 1] 4123 	ld a,(PINNO,sp)
      0096A0 43               [ 1] 4124 	cpl a 
      0096A1 E4 02            [ 1] 4125 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      0096A3 E7 02            [ 1] 4126 	ld (GPIO_DDR,x),a 
      0096A5 20 0C            [ 2] 4127 	jra 9$
      0096A7                       4128 6$: ;output mode  
      0096A7 7B 01            [ 1] 4129 	ld a,(PINNO,sp)
      0096A9 EA 02            [ 1] 4130 	or a,(GPIO_DDR,x) ; bit==1 for output 
      0096AB E7 02            [ 1] 4131 	ld (GPIO_DDR,x),a 
      0096AD 7B 01            [ 1] 4132 	ld a,(PINNO,sp)
      0096AF EA 04            [ 1] 4133 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      0096B1 E7 04            [ 1] 4134 	ld (GPIO_CR2,x),a 
      0096B3                       4135 9$:	
      001633                       4136 	_drop VSIZE 
      0096B3 5B 01            [ 2]    1     addw sp,#VSIZE 
      0096B5 81               [ 4] 4137 	ret
                                   4138 
                                   4139 ;------------------------
                                   4140 ; select Arduino pin 
                                   4141 ; input:
                                   4142 ;   X 	 {0..15} Arduino Dx 
                                   4143 ; output:
                                   4144 ;   A     stm8s208 pin 
                                   4145 ;   X     base address s208 GPIO port 
                                   4146 ;---------------------------
      0096B6                       4147 select_pin:
      0096B6 58               [ 2] 4148 	sllw x 
      0096B7 1C 96 C6         [ 2] 4149 	addw x,#arduino_to_8s208 
      0096BA FE               [ 2] 4150 	ldw x,(x)
      0096BB 9F               [ 1] 4151 	ld a,xl 
      0096BC 88               [ 1] 4152 	push a 
      0096BD 5E               [ 1] 4153 	swapw x 
      0096BE A6 05            [ 1] 4154 	ld a,#5 
      0096C0 42               [ 4] 4155 	mul x,a 
      0096C1 1C 50 00         [ 2] 4156 	addw x,#GPIO_BASE 
      0096C4 84               [ 1] 4157 	pop a 
      0096C5 81               [ 4] 4158 	ret 
                                   4159 ; translation from Arduino D0..D15 to stm8s208rb 
      0096C6                       4160 arduino_to_8s208:
      0096C6 03 06                 4161 .byte 3,6 ; D0 
      0096C8 03 05                 4162 .byte 3,5 ; D1 
      0096CA 04 00                 4163 .byte 4,0 ; D2 
      0096CC 02 01                 4164 .byte 2,1 ; D3
      0096CE 06 00                 4165 .byte 6,0 ; D4
      0096D0 02 02                 4166 .byte 2,2 ; D5
      0096D2 02 03                 4167 .byte 2,3 ; D6
      0096D4 03 01                 4168 .byte 3,1 ; D7
      0096D6 03 03                 4169 .byte 3,3 ; D8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0096D8 02 04                 4170 .byte 2,4 ; D9
      0096DA 04 05                 4171 .byte 4,5 ; D10
      0096DC 02 06                 4172 .byte 2,6 ; D11
      0096DE 02 07                 4173 .byte 2,7 ; D12
      0096E0 02 05                 4174 .byte 2,5 ; D13
      0096E2 04 02                 4175 .byte 4,2 ; D14
      0096E4 04 01                 4176 .byte 4,1 ; D15
                                   4177 
                                   4178 
                                   4179 ;------------------------------
                                   4180 ; BASIC: RND(expr)
                                   4181 ; return random number 
                                   4182 ; between 1 and expr inclusive
                                   4183 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4184 ; input:
                                   4185 ; 	none 
                                   4186 ; output:
                                   4187 ;	X 		random positive integer 
                                   4188 ;------------------------------
      0096E6                       4189 random:
      0096E6 CD 8C 49         [ 4] 4190 	call func_args 
      0096E9 A1 01            [ 1] 4191 	cp a,#1
      0096EB 27 03            [ 1] 4192 	jreq 1$
      0096ED CC 87 A6         [ 2] 4193 	jp syntax_error
      0096F0                       4194 1$:  
      0096F0 A6 80            [ 1] 4195 	ld a,#0x80 
      0096F2 15 01            [ 1] 4196 	bcp a,(1,sp)
      0096F4 27 05            [ 1] 4197 	jreq 2$
      0096F6 A6 0A            [ 1] 4198 	ld a,#ERR_BAD_VALUE
      0096F8 CC 87 A8         [ 2] 4199 	jp tb_error
      0096FB                       4200 2$: 
                                   4201 ; acc16=(x<<5)^x 
      0096FB CE 00 13         [ 2] 4202 	ldw x,seedx 
      0096FE 58               [ 2] 4203 	sllw x 
      0096FF 58               [ 2] 4204 	sllw x 
      009700 58               [ 2] 4205 	sllw x 
      009701 58               [ 2] 4206 	sllw x 
      009702 58               [ 2] 4207 	sllw x 
      009703 9E               [ 1] 4208 	ld a,xh 
      009704 C8 00 13         [ 1] 4209 	xor a,seedx 
      009707 C7 00 0D         [ 1] 4210 	ld acc16,a 
      00970A 9F               [ 1] 4211 	ld a,xl 
      00970B C8 00 14         [ 1] 4212 	xor a,seedx+1 
      00970E C7 00 0E         [ 1] 4213 	ld acc8,a 
                                   4214 ; seedx=seedy 
      009711 CE 00 15         [ 2] 4215 	ldw x,seedy 
      009714 CF 00 13         [ 2] 4216 	ldw seedx,x  
                                   4217 ; seedy=seedy^(seedy>>1)
      009717 90 54            [ 2] 4218 	srlw y 
      009719 90 9E            [ 1] 4219 	ld a,yh 
      00971B C8 00 15         [ 1] 4220 	xor a,seedy 
      00971E C7 00 15         [ 1] 4221 	ld seedy,a  
      009721 90 9F            [ 1] 4222 	ld a,yl 
      009723 C8 00 16         [ 1] 4223 	xor a,seedy+1 
      009726 C7 00 16         [ 1] 4224 	ld seedy+1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4225 ; acc16>>3 
      009729 CE 00 0D         [ 2] 4226 	ldw x,acc16 
      00972C 54               [ 2] 4227 	srlw x 
      00972D 54               [ 2] 4228 	srlw x 
      00972E 54               [ 2] 4229 	srlw x 
                                   4230 ; x=acc16^x 
      00972F 9E               [ 1] 4231 	ld a,xh 
      009730 C8 00 0D         [ 1] 4232 	xor a,acc16 
      009733 95               [ 1] 4233 	ld xh,a 
      009734 9F               [ 1] 4234 	ld a,xl 
      009735 C8 00 0E         [ 1] 4235 	xor a,acc8 
      009738 97               [ 1] 4236 	ld xl,a 
                                   4237 ; seedy=x^seedy 
      009739 C8 00 16         [ 1] 4238 	xor a,seedy+1
      00973C 97               [ 1] 4239 	ld xl,a 
      00973D 9E               [ 1] 4240 	ld a,xh 
      00973E C8 00 15         [ 1] 4241 	xor a,seedy
      009741 95               [ 1] 4242 	ld xh,a 
      009742 CF 00 15         [ 2] 4243 	ldw seedy,x 
                                   4244 ; return seedy modulo expr + 1 
      009745 90 85            [ 2] 4245 	popw y 
      009747 65               [ 2] 4246 	divw x,y 
      009748 93               [ 1] 4247 	ldw x,y 
      009749 5C               [ 1] 4248 	incw x 
      00974A                       4249 10$:
      00974A A6 84            [ 1] 4250 	ld a,#TK_INTGR
      00974C 81               [ 4] 4251 	ret 
                                   4252 
                                   4253 ;---------------------------------
                                   4254 ; BASIC: WORDS 
                                   4255 ; affiche la listes des mots du
                                   4256 ; dictionnaire ainsi que le nombre
                                   4257 ; de mots.
                                   4258 ;---------------------------------
                           000001  4259 	WLEN=1 ; word length
                           000002  4260 	LLEN=2 ; character sent to console
                           000003  4261 	WCNT=3 ; count words printed 
                           000003  4262 	VSIZE=3 
      00974D                       4263 words:
      0016CD                       4264 	_vars VSIZE
      00974D 52 03            [ 2]    1     sub sp,#VSIZE 
      00974F 0F 02            [ 1] 4265 	clr (LLEN,sp)
      009751 0F 03            [ 1] 4266 	clr (WCNT,sp)
      009753 90 AE 9E 12      [ 2] 4267 	ldw y,#kword_dict+2
      009757 93               [ 1] 4268 0$:	ldw x,y
      009758 F6               [ 1] 4269 	ld a,(x)
      009759 A4 0F            [ 1] 4270 	and a,#15 
      00975B 6B 01            [ 1] 4271 	ld (WLEN,sp),a 
      00975D 0C 03            [ 1] 4272 	inc (WCNT,sp)
      00975F 5C               [ 1] 4273 1$:	incw x 
      009760 F6               [ 1] 4274 	ld a,(x)
      009761 CD 83 32         [ 4] 4275 	call putc 
      009764 0C 02            [ 1] 4276 	inc (LLEN,sp)
      009766 0A 01            [ 1] 4277 	dec (WLEN,sp)
      009768 26 F5            [ 1] 4278 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      00976A A6 46            [ 1] 4279 	ld a,#70
      00976C 11 02            [ 1] 4280 	cp a,(LLEN,sp)
      00976E 2B 09            [ 1] 4281 	jrmi 2$   
      009770 A6 20            [ 1] 4282 	ld a,#SPACE 
      009772 CD 83 32         [ 4] 4283 	call putc 
      009775 0C 02            [ 1] 4284 	inc (LLEN,sp) 
      009777 20 07            [ 2] 4285 	jra 3$
      009779 A6 0D            [ 1] 4286 2$: ld a,#CR 
      00977B CD 83 32         [ 4] 4287 	call putc 
      00977E 0F 02            [ 1] 4288 	clr (LLEN,sp)
      009780 72 A2 00 02      [ 2] 4289 3$:	subw y,#2 
      009784 90 FE            [ 2] 4290 	ldw y,(y)
      009786 26 CF            [ 1] 4291 	jrne 0$ 
      009788 A6 0D            [ 1] 4292 	ld a,#CR 
      00978A CD 83 32         [ 4] 4293 	call putc  
      00978D 5F               [ 1] 4294 	clrw x 
      00978E 7B 03            [ 1] 4295 	ld a,(WCNT,sp)
      009790 97               [ 1] 4296 	ld xl,a 
      009791 CD 88 F0         [ 4] 4297 	call print_int 
      009794 AE 97 9D         [ 2] 4298 	ldw x,#words_count_msg
      009797 CD 9F 0C         [ 4] 4299 	call puts 
      00171A                       4300 	_drop VSIZE 
      00979A 5B 03            [ 2]    1     addw sp,#VSIZE 
      00979C 81               [ 4] 4301 	ret 
      00979D 20 77 6F 72 64 73 20  4302 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   4303 
                                   4304 
                                   4305 ;-----------------------------
                                   4306 ; BASIC: TIMER expr 
                                   4307 ; initialize count down timer 
                                   4308 ;-----------------------------
      0097B3                       4309 set_timer:
      0097B3 CD 8C 4E         [ 4] 4310 	call arg_list
      0097B6 A1 01            [ 1] 4311 	cp a,#1 
      0097B8 27 03            [ 1] 4312 	jreq 1$
      0097BA CC 87 A6         [ 2] 4313 	jp syntax_error
      0097BD                       4314 1$: 
      0097BD 85               [ 2] 4315 	popw x 
      0097BE CF 00 11         [ 2] 4316 	ldw timer,x 
      0097C1 81               [ 4] 4317 	ret 
                                   4318 
                                   4319 ;------------------------------
                                   4320 ; BASIC: TIMEOUT 
                                   4321 ; return state of timer 
                                   4322 ;------------------------------
      0097C2                       4323 timeout:
      0097C2 CE 00 11         [ 2] 4324 	ldw x,timer 
      0097C5                       4325 logical_complement:
      0097C5 53               [ 2] 4326 	cplw x 
      0097C6 A3 FF FF         [ 2] 4327 	cpw x,#-1
      0097C9 27 01            [ 1] 4328 	jreq 2$
      0097CB 5F               [ 1] 4329 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0097CC A6 84            [ 1] 4330 2$:	ld a,#TK_INTGR
      0097CE 81               [ 4] 4331 	ret 
                                   4332 
                                   4333 ;--------------------------------
                                   4334 ; BASIC NOT(expr) 
                                   4335 ; return logical complement of expr
                                   4336 ;--------------------------------
      0097CF                       4337 func_not:
      0097CF CD 8C 49         [ 4] 4338 	call func_args  
      0097D2 A1 01            [ 1] 4339 	cp a,#1
      0097D4 27 03            [ 1] 4340 	jreq 1$
      0097D6 CC 87 A6         [ 2] 4341 	jp syntax_error
      0097D9 85               [ 2] 4342 1$:	popw x 
      0097DA 20 E9            [ 2] 4343 	jra logical_complement
                                   4344 
                                   4345 
                                   4346 
                                   4347 ;-----------------------------------
                                   4348 ; BASIC: IWDGEN expr1 
                                   4349 ; enable independant watchdog timer
                                   4350 ; expr1 is delay in multiple of 62.5µsec
                                   4351 ; expr1 -> {1..16383}
                                   4352 ;-----------------------------------
      0097DC                       4353 enable_iwdg:
      0097DC CD 8C 4E         [ 4] 4354 	call arg_list
      0097DF A1 01            [ 1] 4355 	cp a,#1 
      0097E1 27 03            [ 1] 4356 	jreq 1$
      0097E3 CC 87 A6         [ 2] 4357 	jp syntax_error 
      0097E6 85               [ 2] 4358 1$: popw x 
      0097E7 4B 00            [ 1] 4359 	push #0
      0097E9 35 CC 50 E0      [ 1] 4360 	mov IWDG_KR,#IWDG_KEY_ENABLE
      0097ED 9E               [ 1] 4361 	ld a,xh 
      0097EE A4 3F            [ 1] 4362 	and a,#0x3f
      0097F0 95               [ 1] 4363 	ld xh,a  
      0097F1 A3 00 FF         [ 2] 4364 2$:	cpw x,#255
      0097F4 23 06            [ 2] 4365 	jrule 3$
      0097F6 0C 01            [ 1] 4366 	inc (1,sp)
      0097F8 98               [ 1] 4367 	rcf 
      0097F9 56               [ 2] 4368 	rrcw x 
      0097FA 20 F5            [ 2] 4369 	jra 2$
      0097FC 35 55 50 E0      [ 1] 4370 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009800 84               [ 1] 4371 	pop a  
      009801 C7 50 E1         [ 1] 4372 	ld IWDG_PR,a 
      009804 9F               [ 1] 4373 	ld a,xl
      009805 4A               [ 1] 4374 	dec a 
      009806 35 55 50 E0      [ 1] 4375 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00980A C7 50 E2         [ 1] 4376 	ld IWDG_RLR,a 
      00980D 35 AA 50 E0      [ 1] 4377 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009811 81               [ 4] 4378 	ret 
                                   4379 
                                   4380 
                                   4381 ;-----------------------------------
                                   4382 ; BASIC: IWDGREF  
                                   4383 ; refresh independant watchdog count down 
                                   4384 ; timer before it reset MCU. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4385 ;-----------------------------------
      009812                       4386 refresh_iwdg:
      009812 35 AA 50 E0      [ 1] 4387 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009816 81               [ 4] 4388 	ret 
                                   4389 
                                   4390 
                                   4391 ;-------------------------------------
                                   4392 ; BASIC: LOG(expr)
                                   4393 ; return logarithm base 2 of expr 
                                   4394 ; this is the position of most significant
                                   4395 ; bit set. 
                                   4396 ; input: 
                                   4397 ; output:
                                   4398 ;   X     log2 
                                   4399 ;   A     TK_INTGR 
                                   4400 ;*********************************
      009817                       4401 log2:
      009817 CD 8C 49         [ 4] 4402 	call func_args 
      00981A A1 01            [ 1] 4403 	cp a,#1 
      00981C 27 03            [ 1] 4404 	jreq 1$
      00981E CC 87 A6         [ 2] 4405 	jp syntax_error 
      009821 85               [ 2] 4406 1$: popw x 
      009822                       4407 leading_one:
      009822 5D               [ 2] 4408 	tnzw x 
      009823 27 0A            [ 1] 4409 	jreq 4$
      009825 A6 0F            [ 1] 4410 	ld a,#15 
      009827 59               [ 2] 4411 2$: rlcw x 
      009828 25 03            [ 1] 4412     jrc 3$
      00982A 4A               [ 1] 4413 	dec a 
      00982B 20 FA            [ 2] 4414 	jra 2$
      00982D 5F               [ 1] 4415 3$: clrw x 
      00982E 97               [ 1] 4416     ld xl,a
      00982F A6 84            [ 1] 4417 4$:	ld a,#TK_INTGR
      009831 81               [ 4] 4418 	ret 
                                   4419 
                                   4420 ;-----------------------------------
                                   4421 ; BASIC: BIT(expr) 
                                   4422 ; expr ->{0..15}
                                   4423 ; return 2^expr 
                                   4424 ; output:
                                   4425 ;    x    2^expr 
                                   4426 ;-----------------------------------
      009832                       4427 bitmask:
      009832 CD 8C 49         [ 4] 4428     call func_args 
      009835 A1 01            [ 1] 4429 	cp a,#1
      009837 27 03            [ 1] 4430 	jreq 1$
      009839 CC 87 A6         [ 2] 4431 	jp syntax_error 
      00983C 85               [ 2] 4432 1$: popw x 
      00983D 9F               [ 1] 4433 	ld a,xl 
      00983E A4 0F            [ 1] 4434 	and a,#15
      009840 5F               [ 1] 4435 	clrw x 
      009841 5C               [ 1] 4436 	incw x 
      009842 4D               [ 1] 4437 2$: tnz a 
      009843 27 04            [ 1] 4438 	jreq 3$
      009845 58               [ 2] 4439 	slaw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009846 4A               [ 1] 4440 	dec a 
      009847 20 F9            [ 2] 4441 	jra 2$ 
      009849 A6 84            [ 1] 4442 3$: ld a,#TK_INTGR
      00984B 81               [ 4] 4443 	ret 
                                   4444 
                                   4445 ;------------------------------
                                   4446 ; BASIC: INVERT(expr)
                                   4447 ; 1's complement 
                                   4448 ;--------------------------------
      00984C                       4449 invert:
      00984C CD 8C 49         [ 4] 4450 	call func_args
      00984F A1 01            [ 1] 4451 	cp a,#1 
      009851 27 03            [ 1] 4452 	jreq 1$
      009853 CC 87 A6         [ 2] 4453 	jp syntax_error
      009856 85               [ 2] 4454 1$: popw x  
      009857 53               [ 2] 4455 	cplw x 
      009858 A6 84            [ 1] 4456 	ld a,#TK_INTGR 
      00985A 81               [ 4] 4457 	ret 
                                   4458 
                                   4459 ;------------------------------
                                   4460 ; BASIC: DO 
                                   4461 ; initiate a DO ... UNTIL loop 
                                   4462 ;------------------------------
                           000003  4463 	DOLP_ADR=3 
                           000005  4464 	DOLP_INW=5
                           000004  4465 	VSIZE=4 
      00985B                       4466 do_loop:
      00985B 85               [ 2] 4467 	popw x 
      0017DC                       4468 	_vars VSIZE 
      00985C 52 04            [ 2]    1     sub sp,#VSIZE 
      00985E 89               [ 2] 4469 	pushw x 
      00985F 90 CE 00 05      [ 2] 4470 	ldw y,basicptr 
      009863 17 03            [ 2] 4471 	ldw (DOLP_ADR,sp),y
      009865 90 CE 00 01      [ 2] 4472 	ldw y,in.w 
      009869 17 05            [ 2] 4473 	ldw (DOLP_INW,sp),y
      00986B 72 5C 00 1E      [ 1] 4474 	inc loop_depth 
      00986F 81               [ 4] 4475 	ret 
                                   4476 
                                   4477 ;--------------------------------
                                   4478 ; BASIC: UNTIL expr 
                                   4479 ; loop if exprssion is false 
                                   4480 ; else terminate loop
                                   4481 ;--------------------------------
      009870                       4482 until: 
      009870 72 5D 00 1E      [ 1] 4483 	tnz loop_depth 
      009874 26 03            [ 1] 4484 	jrne 1$ 
      009876 CC 87 A6         [ 2] 4485 	jp syntax_error 
      009879                       4486 1$: 
      009879 CD 8D 96         [ 4] 4487 	call relation 
      00987C A1 84            [ 1] 4488 	cp a,#TK_INTGR
      00987E 27 03            [ 1] 4489 	jreq 2$
      009880 CC 87 A6         [ 2] 4490 	jp syntax_error
      009883                       4491 2$: 
      009883 5D               [ 2] 4492 	tnzw x 
      009884 26 10            [ 1] 4493 	jrne 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009886 1E 03            [ 2] 4494 	ldw x,(DOLP_ADR,sp)
      009888 CF 00 05         [ 2] 4495 	ldw basicptr,x 
      00988B E6 02            [ 1] 4496 	ld a,(2,x)
      00988D C7 00 04         [ 1] 4497 	ld count,a 
      009890 1E 05            [ 2] 4498 	ldw x,(DOLP_INW,sp)
      009892 CF 00 01         [ 2] 4499 	ldw in.w,x 
      009895 81               [ 4] 4500 	ret 
      009896                       4501 9$:	; remove loop data from stack  
      009896 85               [ 2] 4502 	popw x
      001817                       4503 	_drop VSIZE
      009897 5B 04            [ 2]    1     addw sp,#VSIZE 
      009899 72 5A 00 1E      [ 1] 4504 	dec loop_depth 
      00989D FC               [ 2] 4505 	jp (x)
                                   4506 
                                   4507 ;--------------------------
                                   4508 ; BASIC: PRTA...PRTI  
                                   4509 ;  return constant value 
                                   4510 ;  PORT  offset in GPIO
                                   4511 ;  array
                                   4512 ;---------------------------
      00989E                       4513 const_porta:
      00989E AE 00 00         [ 2] 4514 	ldw x,#0
      0098A1 A6 84            [ 1] 4515 	ld a,#TK_INTGR 
      0098A3 81               [ 4] 4516 	ret 
      0098A4                       4517 const_portb:
      0098A4 AE 00 01         [ 2] 4518 	ldw x,#1
      0098A7 A6 84            [ 1] 4519 	ld a,#TK_INTGR 
      0098A9 81               [ 4] 4520 	ret 
      0098AA                       4521 const_portc:
      0098AA AE 00 02         [ 2] 4522 	ldw x,#2
      0098AD A6 84            [ 1] 4523 	ld a,#TK_INTGR 
      0098AF 81               [ 4] 4524 	ret 
      0098B0                       4525 const_portd:
      0098B0 AE 00 03         [ 2] 4526 	ldw x,#3
      0098B3 A6 84            [ 1] 4527 	ld a,#TK_INTGR 
      0098B5 81               [ 4] 4528 	ret 
      0098B6                       4529 const_porte:
      0098B6 AE 00 04         [ 2] 4530 	ldw x,#4
      0098B9 A6 84            [ 1] 4531 	ld a,#TK_INTGR 
      0098BB 81               [ 4] 4532 	ret 
      0098BC                       4533 const_portf:
      0098BC AE 00 05         [ 2] 4534 	ldw x,#5
      0098BF A6 84            [ 1] 4535 	ld a,#TK_INTGR 
      0098C1 81               [ 4] 4536 	ret 
      0098C2                       4537 const_portg:
      0098C2 AE 00 06         [ 2] 4538 	ldw x,#6
      0098C5 A6 84            [ 1] 4539 	ld a,#TK_INTGR 
      0098C7 81               [ 4] 4540 	ret 
      0098C8                       4541 const_porth:
      0098C8 AE 00 07         [ 2] 4542 	ldw x,#7
      0098CB A6 84            [ 1] 4543 	ld a,#TK_INTGR 
      0098CD 81               [ 4] 4544 	ret 
      0098CE                       4545 const_porti:
      0098CE AE 00 08         [ 2] 4546 	ldw x,#8
      0098D1 A6 84            [ 1] 4547 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0098D3 81               [ 4] 4548 	ret 
                                   4549 
                                   4550 ;-------------------------------
                                   4551 ; following return constant 
                                   4552 ; related to GPIO register offset 
                                   4553 ;---------------------------------
      0098D4                       4554 const_odr:
      0098D4 A6 84            [ 1] 4555 	ld a,#TK_INTGR 
      0098D6 AE 00 00         [ 2] 4556 	ldw x,#GPIO_ODR
      0098D9 81               [ 4] 4557 	ret 
      0098DA                       4558 const_idr:
      0098DA A6 84            [ 1] 4559 	ld a,#TK_INTGR 
      0098DC AE 00 01         [ 2] 4560 	ldw x,#GPIO_IDR
      0098DF 81               [ 4] 4561 	ret 
      0098E0                       4562 const_ddr:
      0098E0 A6 84            [ 1] 4563 	ld a,#TK_INTGR 
      0098E2 AE 00 02         [ 2] 4564 	ldw x,#GPIO_DDR
      0098E5 81               [ 4] 4565 	ret 
      0098E6                       4566 const_cr1:
      0098E6 A6 84            [ 1] 4567 	ld a,#TK_INTGR 
      0098E8 AE 00 03         [ 2] 4568 	ldw x,#GPIO_CR1
      0098EB 81               [ 4] 4569 	ret 
      0098EC                       4570 const_cr2:
      0098EC A6 84            [ 1] 4571 	ld a,#TK_INTGR 
      0098EE AE 00 04         [ 2] 4572 	ldw x,#GPIO_CR2
      0098F1 81               [ 4] 4573 	ret 
                                   4574 ;-------------------------
                                   4575 ; BASIC: POUT 
                                   4576 ;  constant for port mode
                                   4577 ;  used by PMODE 
                                   4578 ;  to set pin as output
                                   4579 ;------------------------
      0098F2                       4580 const_output:
      0098F2 A6 84            [ 1] 4581 	ld a,#TK_INTGR 
      0098F4 AE 00 01         [ 2] 4582 	ldw x,#OUTP
      0098F7 81               [ 4] 4583 	ret 
                                   4584 
                                   4585 ;-------------------------
                                   4586 ; BASIC: PINP 
                                   4587 ;  constant for port mode
                                   4588 ;  used by PMODE 
                                   4589 ;  to set pin as input
                                   4590 ;------------------------
      0098F8                       4591 const_input:
      0098F8 A6 84            [ 1] 4592 	ld a,#TK_INTGR 
      0098FA AE 00 00         [ 2] 4593 	ldw x,#INP 
      0098FD 81               [ 4] 4594 	ret 
                                   4595 	
                                   4596 ;-----------------------
                                   4597 ; memory area constants
                                   4598 ;-----------------------
      0098FE                       4599 const_eeprom_base:
      0098FE A6 84            [ 1] 4600 	ld a,#TK_INTGR 
      009900 AE 40 00         [ 2] 4601 	ldw x,#EEPROM_BASE 
      009903 81               [ 4] 4602 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4603 
                                   4604 ;---------------------------
                                   4605 ; BASIC: DATA 
                                   4606 ; when the interpreter find 
                                   4607 ; a DATA line it skip it.
                                   4608 ;---------------------------
      009904                       4609 data:
      009904 55 00 04 00 02   [ 1] 4610 	mov in,count 
      009909 81               [ 4] 4611 	ret 
                                   4612 
                                   4613 ;---------------------------
                                   4614 ; BASIC: DATLN  *expr*
                                   4615 ; set DATA pointer at line# 
                                   4616 ; specified by *expr* 
                                   4617 ;---------------------------
      00990A                       4618 data_line:
      00990A CD 8D 4D         [ 4] 4619 	call expression
      00990D A1 84            [ 1] 4620 	cp a,#TK_INTGR
      00990F 27 03            [ 1] 4621 	jreq 1$
      009911 CC 87 A6         [ 2] 4622 	jp syntax_error  
      009914 4F               [ 1] 4623 1$: clr a 
      009915 CD A1 F4         [ 4] 4624 	call search_lineno
      009918 5D               [ 2] 4625 	tnzw x 
      009919 26 05            [ 1] 4626 	jrne 3$
      00991B A6 05            [ 1] 4627 2$:	ld a,#ERR_NO_LINE 
      00991D CC 87 A8         [ 2] 4628 	jp tb_error
      009920                       4629 3$: ; check if valid data line 
      009920 90 93            [ 1] 4630     ldw y,x 
      009922 EE 04            [ 2] 4631 	ldw x,(4,x)
      009924 A3 99 04         [ 2] 4632 	cpw x,#data 
      009927 26 F2            [ 1] 4633 	jrne 2$ 
      009929 90 CF 00 07      [ 2] 4634 	ldw data_ptr,y
      00992D 90 E6 02         [ 1] 4635 	ld a,(2,y)
      009930 C7 00 0A         [ 1] 4636 	ld data_len,a 
      009933 35 06 00 09      [ 1] 4637 	mov data_ofs,#FIRST_DATA_ITEM 
      009937 81               [ 4] 4638 	ret
                                   4639 
                                   4640 ;---------------------------------
                                   4641 ; BASIC: RESTORE 
                                   4642 ; set data_ptr to first data line
                                   4643 ; if not DATA found pointer set to
                                   4644 ; zero 
                                   4645 ;---------------------------------
      009938                       4646 restore:
      009938 72 5F 00 07      [ 1] 4647 	clr data_ptr 
      00993C 72 5F 00 08      [ 1] 4648 	clr data_ptr+1
      009940 72 5F 00 09      [ 1] 4649 	clr data_ofs 
      009944 72 5F 00 0A      [ 1] 4650 	clr data_len
      009948 CE 00 1A         [ 2] 4651 	ldw x,txtbgn
      00994B                       4652 data_search_loop: 	
      00994B C3 00 1C         [ 2] 4653 	cpw x,txtend
      00994E 24 1B            [ 1] 4654 	jruge 9$
      009950 90 93            [ 1] 4655 	ldw y,x 
      009952 EE 04            [ 2] 4656 	ldw x,(4,x)
      009954 1C 9E 18         [ 2] 4657 	addw x,#code_addr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009957 FE               [ 2] 4658 	ldw x,(x)
      009958 A3 99 04         [ 2] 4659 	cpw x,#data 
      00995B 26 1A            [ 1] 4660 	jrne try_next_line 
      00995D 90 CF 00 07      [ 2] 4661 	ldw data_ptr,y 
      009961 90 E6 02         [ 1] 4662 	ld a,(2,y)
      009964 C7 00 0A         [ 1] 4663 	ld data_len,a 
      009967 35 06 00 09      [ 1] 4664 	mov data_ofs,#FIRST_DATA_ITEM
      00996B 72 5D 00 0A      [ 1] 4665 9$:	tnz data_len 
      00996F 26 05            [ 1] 4666     jrne 10$
      009971 A6 0C            [ 1] 4667 	ld a,#ERR_NO_DATA 
      009973 CC 87 A8         [ 2] 4668 	jp tb_error 
      009976 81               [ 4] 4669 10$:ret
      009977                       4670 try_next_line:
      009977 93               [ 1] 4671 	ldw x,y 
      009978 E6 02            [ 1] 4672 	ld a,(2,x)
      00997A C7 00 0E         [ 1] 4673 	ld acc8,a 
      00997D 72 5F 00 0D      [ 1] 4674 	clr acc16 
      009981 72 BB 00 0D      [ 2] 4675 	addw x,acc16 
      009985 20 C4            [ 2] 4676 	jra data_search_loop
                                   4677 
                                   4678 
                                   4679 ;---------------------------------
                                   4680 ; BASIC: READ 
                                   4681 ; return next data item | 0 
                                   4682 ;---------------------------------
                           000001  4683 	CTX_BPTR=1 
                           000003  4684 	CTX_IN=3 
                           000004  4685 	CTX_COUNT=4 
                           000005  4686 	XSAVE=5
                           000006  4687 	VSIZE=6
      009987                       4688 read:
      001907                       4689 	_vars  VSIZE 
      009987 52 06            [ 2]    1     sub sp,#VSIZE 
      009989                       4690 read01:	
      009989 C6 00 09         [ 1] 4691 	ld a,data_ofs
      00998C C1 00 0A         [ 1] 4692 	cp a,data_len 
      00998F 27 37            [ 1] 4693 	jreq 2$ ; end of line  
      009991 CD 8F B0         [ 4] 4694 	call save_context
      009994 CE 00 07         [ 2] 4695 	ldw x,data_ptr 
      009997 CF 00 05         [ 2] 4696 	ldw basicptr,x 
      00999A 55 00 09 00 02   [ 1] 4697 	mov in,data_ofs 
      00999F 55 00 0A 00 04   [ 1] 4698 	mov count,data_len  
      0099A4 CD 8D 4D         [ 4] 4699 	call expression 
      0099A7 A1 84            [ 1] 4700 	cp a,#TK_INTGR 
      0099A9 27 03            [ 1] 4701 	jreq 1$ 
      0099AB CC 87 A6         [ 2] 4702 	jp syntax_error 
      0099AE                       4703 1$:
      0099AE 1F 05            [ 2] 4704 	ldw (XSAVE,SP),x
      0099B0 CD 88 95         [ 4] 4705 	call next_token ; skip comma
      0099B3 CE 00 05         [ 2] 4706 	ldw x,basicptr 
      0099B6 CF 00 07         [ 2] 4707 	ldw data_ptr,x 
      0099B9 55 00 02 00 09   [ 1] 4708 	mov data_ofs,in 
      0099BE CD 8F C0         [ 4] 4709 	call rest_context
      0099C1 1E 05            [ 2] 4710 	ldw x,(XSAVE,sp)
      0099C3 A6 84            [ 1] 4711 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      001945                       4712 	_drop VSIZE 
      0099C5 5B 06            [ 2]    1     addw sp,#VSIZE 
      0099C7 81               [ 4] 4713 	ret 
      0099C8                       4714 2$: ; end of line reached 
      0099C8 90 CE 00 07      [ 2] 4715 	ldw y, data_ptr 
      0099CC 72 5F 00 07      [ 1] 4716 	clr data_ptr
      0099D0 72 5F 00 08      [ 1] 4717 	clr data_ptr+1   
      0099D4 72 5F 00 09      [ 1] 4718 	clr data_ofs 
      0099D8 72 5F 00 0A      [ 1] 4719 	clr data_len 
      0099DC CD 99 77         [ 4] 4720 	call try_next_line 
      0099DF 20 A8            [ 2] 4721 	jra read01
                                   4722 
                                   4723 
                                   4724 ;---------------------------------
                                   4725 ; BASIC: SPIEN clkdiv, 0|1  
                                   4726 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4727 ; if clkdiv==-1 disable SPI
                                   4728 ; 0|1 -> disable|enable  
                                   4729 ;--------------------------------- 
                           000005  4730 SPI_CS_BIT=5
      0099E1                       4731 spi_enable:
      0099E1 CD 8C 4E         [ 4] 4732 	call arg_list 
      0099E4 A1 02            [ 1] 4733 	cp a,#2
      0099E6 27 03            [ 1] 4734 	jreq 1$
      0099E8 CC 87 A6         [ 2] 4735 	jp syntax_error 
      0099EB                       4736 1$: 
      0099EB 72 12 50 C7      [ 1] 4737 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      0099EF 85               [ 2] 4738 	popw x  
      0099F0 5D               [ 2] 4739 	tnzw x 
      0099F1 27 21            [ 1] 4740 	jreq spi_disable 
      0099F3 85               [ 2] 4741 	popw x 
      0099F4 A6 08            [ 1] 4742 	ld a,#(1<<SPI_CR1_BR)
      0099F6 42               [ 4] 4743 	mul x,a 
      0099F7 9F               [ 1] 4744 	ld a,xl 
      0099F8 C7 52 00         [ 1] 4745 	ld SPI_CR1,a 
                                   4746 ; configure ~CS on PE5 (D10 on CN8) as output. 
      0099FB 72 1A 50 14      [ 1] 4747 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      0099FF 72 1A 50 16      [ 1] 4748 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4749 ; configure SPI as master mode 0.	
      009A03 72 14 52 00      [ 1] 4750 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4751 ; ~CS line controlled by sofware 	
      009A07 72 12 52 01      [ 1] 4752 	bset SPI_CR2,#SPI_CR2_SSM 
      009A0B 72 10 52 01      [ 1] 4753     bset SPI_CR2,#SPI_CR2_SSI 
                                   4754 ; enable SPI
      009A0F 72 1C 52 00      [ 1] 4755 	bset SPI_CR1,#SPI_CR1_SPE 	
      009A13 81               [ 4] 4756 	ret 
      009A14                       4757 spi_disable:
      001994                       4758 	_drop #2; throw first argument.
      009A14 5B 02            [ 2]    1     addw sp,##2 
                                   4759 ; wait spi idle 
      009A16 A6 82            [ 1] 4760 1$:	ld a,#0x82 
      009A18 C4 52 03         [ 1] 4761 	and a,SPI_SR
      009A1B A1 02            [ 1] 4762 	cp a,#2 
      009A1D 26 F7            [ 1] 4763 	jrne 1$
      009A1F 72 1D 52 00      [ 1] 4764 	bres SPI_CR1,#SPI_CR1_SPE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009A23 72 13 50 C7      [ 1] 4765 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009A27 72 1B 50 16      [ 1] 4766 	bres PE_DDR,#SPI_CS_BIT 
      009A2B 81               [ 4] 4767 	ret 
                                   4768 
      009A2C                       4769 spi_clear_error:
      009A2C A6 78            [ 1] 4770 	ld a,#0x78 
      009A2E C5 52 03         [ 1] 4771 	bcp a,SPI_SR 
      009A31 27 04            [ 1] 4772 	jreq 1$
      009A33 72 5F 52 03      [ 1] 4773 	clr SPI_SR 
      009A37 81               [ 4] 4774 1$: ret 
                                   4775 
      009A38                       4776 spi_send_byte:
      009A38 88               [ 1] 4777 	push a 
      009A39 CD 9A 2C         [ 4] 4778 	call spi_clear_error
      009A3C 84               [ 1] 4779 	pop a 
      009A3D 72 03 52 03 FB   [ 2] 4780 	btjf SPI_SR,#SPI_SR_TXE,.
      009A42 C7 52 04         [ 1] 4781 	ld SPI_DR,a
      009A45 72 01 52 03 FB   [ 2] 4782 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009A4A C6 52 04         [ 1] 4783 	ld a,SPI_DR 
      009A4D 81               [ 4] 4784 	ret 
                                   4785 
      009A4E                       4786 spi_rcv_byte:
      009A4E A6 FF            [ 1] 4787 	ld a,#255
      009A50 72 01 52 03 E3   [ 2] 4788 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009A55 C6 52 04         [ 1] 4789 	ld a,SPI_DR 
      009A58 81               [ 4] 4790 	ret
                                   4791 
                                   4792 ;------------------------------
                                   4793 ; BASIC: SPIWR byte [,byte]
                                   4794 ; write 1 or more byte
                                   4795 ;------------------------------
      009A59                       4796 spi_write:
      009A59 CD 8D 4D         [ 4] 4797 	call expression
      009A5C A1 84            [ 1] 4798 	cp a,#TK_INTGR 
      009A5E 27 03            [ 1] 4799 	jreq 1$
      009A60 CC 87 A6         [ 2] 4800 	jp syntax_error 
      009A63                       4801 1$:	
      009A63 9F               [ 1] 4802 	ld a,xl 
      009A64 CD 9A 38         [ 4] 4803 	call spi_send_byte 
      009A67 CD 88 95         [ 4] 4804 	call next_token 
      009A6A A1 09            [ 1] 4805 	cp a,#TK_COMMA 
      009A6C 26 02            [ 1] 4806 	jrne 2$ 
      009A6E 20 E9            [ 2] 4807 	jra spi_write 
      009A70 4D               [ 1] 4808 2$:	tnz a 
      009A71 27 05            [ 1] 4809 	jreq 3$
      0019F3                       4810 	_unget_token  
      009A73 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      009A78 81               [ 4] 4811 3$:	ret 
                                   4812 
                                   4813 
                                   4814 ;-------------------------------
                                   4815 ; BASIC: SPIRD 	
                                   4816 ; read one byte from SPI 
                                   4817 ;-------------------------------
      009A79                       4818 spi_read:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009A79 CD 9A 4E         [ 4] 4819 	call spi_rcv_byte 
      009A7C 5F               [ 1] 4820 	clrw x 
      009A7D 97               [ 1] 4821 	ld xl,a 
      009A7E A6 84            [ 1] 4822 	ld a,#TK_INTGR 
      009A80 81               [ 4] 4823 	ret 
                                   4824 
                                   4825 ;------------------------------
                                   4826 ; BASIC: SPISEL 0|1 
                                   4827 ; set state of ~CS line
                                   4828 ; 0|1 deselect|select  
                                   4829 ;------------------------------
      009A81                       4830 spi_select:
      009A81 CD 88 95         [ 4] 4831 	call next_token 
      009A84 A1 84            [ 1] 4832 	cp a,#TK_INTGR 
      009A86 27 03            [ 1] 4833 	jreq 1$
      009A88 CC 87 A6         [ 2] 4834 	jp syntax_error 
      009A8B 5D               [ 2] 4835 1$: tnzw x  
      009A8C 27 05            [ 1] 4836 	jreq cs_high 
      009A8E 72 1B 50 14      [ 1] 4837 	bres PE_ODR,#SPI_CS_BIT
      009A92 81               [ 4] 4838 	ret 
      009A93                       4839 cs_high: 
      009A93 72 1A 50 14      [ 1] 4840 	bset PE_ODR,#SPI_CS_BIT
      009A97 81               [ 4] 4841 	ret 
                                   4842 
                                   4843 ;-------------------------------
                                   4844 ; BASIC: PAD 
                                   4845 ; Return pad buffer address.
                                   4846 ;------------------------------
      009A98                       4847 pad_ref:
      009A98 AE 16 E0         [ 2] 4848 	ldw x,#pad 
      009A9B B6 84            [ 1] 4849 	ld a,TK_INTGR
      009A9D 81               [ 4] 4850 	ret 
                                   4851 
                                   4852 
                                   4853 ;------------------------------
                                   4854 ;      dictionary 
                                   4855 ; format:
                                   4856 ;   link:   2 bytes 
                                   4857 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4858 ;   cmd_name: 16 byte max 
                                   4859 ;   cmd_index: 2 bytes 
                                   4860 ;------------------------------
                                   4861 	.macro _dict_entry len,name,cmd_idx 
                                   4862 	.word LINK 
                                   4863 	LINK=.
                                   4864 name:
                                   4865 	.byte len 	
                                   4866 	.ascii "name"
                                   4867 	.word cmd_idx 
                                   4868 	.endm 
                                   4869 
                           000000  4870 	LINK=0
                                   4871 ; respect alphabetic order for BASIC names from Z-A
                                   4872 ; this sort order is for a cleaner WORDS cmd output. 	
      009A9E                       4873 kword_end:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      001A1E                       4874 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      009A9E 00 00                    1 	.word LINK 
                           001A20     2 	LINK=.
      009AA0                          3 XOR:
      009AA0 43                       4 	.byte 3+F_IFUNC 	
      009AA1 58 4F 52                 5 	.ascii "XOR"
      009AA4 00 BE                    6 	.word XOR_IDX 
      001A26                       4875 	_dict_entry,5,WRITE,WRITE_IDX;write  
      009AA6 9A A0                    1 	.word LINK 
                           001A28     2 	LINK=.
      009AA8                          3 WRITE:
      009AA8 05                       4 	.byte 5 	
      009AA9 57 52 49 54 45           5 	.ascii "WRITE"
      009AAE 00 BC                    6 	.word WRITE_IDX 
      001A30                       4876 	_dict_entry,5,WORDS,WORDS_IDX;words 
      009AB0 9A A8                    1 	.word LINK 
                           001A32     2 	LINK=.
      009AB2                          3 WORDS:
      009AB2 05                       4 	.byte 5 	
      009AB3 57 4F 52 44 53           5 	.ascii "WORDS"
      009AB8 00 BA                    6 	.word WORDS_IDX 
      001A3A                       4877 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      009ABA 9A B2                    1 	.word LINK 
                           001A3C     2 	LINK=.
      009ABC                          3 WAIT:
      009ABC 04                       4 	.byte 4 	
      009ABD 57 41 49 54              5 	.ascii "WAIT"
      009AC1 00 B8                    6 	.word WAIT_IDX 
      001A43                       4878 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      009AC3 9A BC                    1 	.word LINK 
                           001A45     2 	LINK=.
      009AC5                          3 USR:
      009AC5 43                       4 	.byte 3+F_IFUNC 	
      009AC6 55 53 52                 5 	.ascii "USR"
      009AC9 00 B6                    6 	.word USR_IDX 
      001A4B                       4879 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      009ACB 9A C5                    1 	.word LINK 
                           001A4D     2 	LINK=.
      009ACD                          3 UNTIL:
      009ACD 05                       4 	.byte 5 	
      009ACE 55 4E 54 49 4C           5 	.ascii "UNTIL"
      009AD3 00 B4                    6 	.word UNTIL_IDX 
      001A55                       4880 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      009AD5 9A CD                    1 	.word LINK 
                           001A57     2 	LINK=.
      009AD7                          3 UFLASH:
      009AD7 46                       4 	.byte 6+F_IFUNC 	
      009AD8 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      009ADE 00 B2                    6 	.word UFLASH_IDX 
      001A60                       4881 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      009AE0 9A D7                    1 	.word LINK 
                           001A62     2 	LINK=.
      009AE2                          3 UBOUND:
      009AE2 46                       4 	.byte 6+F_IFUNC 	
      009AE3 55 42 4F 55 4E 44        5 	.ascii "UBOUND"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009AE9 00 B0                    6 	.word UBOUND_IDX 
      001A6B                       4882 	_dict_entry,4,TONE,TONE_IDX;tone  
      009AEB 9A E2                    1 	.word LINK 
                           001A6D     2 	LINK=.
      009AED                          3 TONE:
      009AED 04                       4 	.byte 4 	
      009AEE 54 4F 4E 45              5 	.ascii "TONE"
      009AF2 00 AE                    6 	.word TONE_IDX 
      001A74                       4883 	_dict_entry,2,TO,TO_IDX;to
      009AF4 9A ED                    1 	.word LINK 
                           001A76     2 	LINK=.
      009AF6                          3 TO:
      009AF6 02                       4 	.byte 2 	
      009AF7 54 4F                    5 	.ascii "TO"
      009AF9 00 AC                    6 	.word TO_IDX 
      001A7B                       4884 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      009AFB 9A F6                    1 	.word LINK 
                           001A7D     2 	LINK=.
      009AFD                          3 TIMER:
      009AFD 05                       4 	.byte 5 	
      009AFE 54 49 4D 45 52           5 	.ascii "TIMER"
      009B03 00 A8                    6 	.word TIMER_IDX 
      001A85                       4885 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      009B05 9A FD                    1 	.word LINK 
                           001A87     2 	LINK=.
      009B07                          3 TIMEOUT:
      009B07 47                       4 	.byte 7+F_IFUNC 	
      009B08 54 49 4D 45 4F 55 54     5 	.ascii "TIMEOUT"
      009B0F 00 AA                    6 	.word TMROUT_IDX 
      001A91                       4886 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      009B11 9B 07                    1 	.word LINK 
                           001A93     2 	LINK=.
      009B13                          3 TICKS:
      009B13 45                       4 	.byte 5+F_IFUNC 	
      009B14 54 49 43 4B 53           5 	.ascii "TICKS"
      009B19 00 A6                    6 	.word TICKS_IDX 
      001A9B                       4887 	_dict_entry,4,STOP,STOP_IDX;stop 
      009B1B 9B 13                    1 	.word LINK 
                           001A9D     2 	LINK=.
      009B1D                          3 STOP:
      009B1D 04                       4 	.byte 4 	
      009B1E 53 54 4F 50              5 	.ascii "STOP"
      009B22 00 A4                    6 	.word STOP_IDX 
      001AA4                       4888 	_dict_entry,4,STEP,STEP_IDX;step 
      009B24 9B 1D                    1 	.word LINK 
                           001AA6     2 	LINK=.
      009B26                          3 STEP:
      009B26 04                       4 	.byte 4 	
      009B27 53 54 45 50              5 	.ascii "STEP"
      009B2B 00 A2                    6 	.word STEP_IDX 
      001AAD                       4889 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      009B2D 9B 26                    1 	.word LINK 
                           001AAF     2 	LINK=.
      009B2F                          3 SPIWR:
      009B2F 05                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009B30 53 50 49 57 52           5 	.ascii "SPIWR"
      009B35 00 A0                    6 	.word SPIWR_IDX 
      001AB7                       4890 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      009B37 9B 2F                    1 	.word LINK 
                           001AB9     2 	LINK=.
      009B39                          3 SPISEL:
      009B39 06                       4 	.byte 6 	
      009B3A 53 50 49 53 45 4C        5 	.ascii "SPISEL"
      009B40 00 9E                    6 	.word SPISEL_IDX 
      001AC2                       4891 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      009B42 9B 39                    1 	.word LINK 
                           001AC4     2 	LINK=.
      009B44                          3 SPIRD:
      009B44 45                       4 	.byte 5+F_IFUNC 	
      009B45 53 50 49 52 44           5 	.ascii "SPIRD"
      009B4A 00 9A                    6 	.word SPIRD_IDX 
      001ACC                       4892 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      009B4C 9B 44                    1 	.word LINK 
                           001ACE     2 	LINK=.
      009B4E                          3 SPIEN:
      009B4E 05                       4 	.byte 5 	
      009B4F 53 50 49 45 4E           5 	.ascii "SPIEN"
      009B54 00 9C                    6 	.word SPIEN_IDX 
      001AD6                       4893 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      009B56 9B 4E                    1 	.word LINK 
                           001AD8     2 	LINK=.
      009B58                          3 SLEEP:
      009B58 05                       4 	.byte 5 	
      009B59 53 4C 45 45 50           5 	.ascii "SLEEP"
      009B5E 00 98                    6 	.word SLEEP_IDX 
      001AE0                       4894     _dict_entry,4,SHOW,SHOW_IDX;show 
      009B60 9B 58                    1 	.word LINK 
                           001AE2     2 	LINK=.
      009B62                          3 SHOW:
      009B62 04                       4 	.byte 4 	
      009B63 53 48 4F 57              5 	.ascii "SHOW"
      009B67 00 94                    6 	.word SHOW_IDX 
      001AE9                       4895 	_dict_entry 3,RUN,RUN_IDX;run
      009B69 9B 62                    1 	.word LINK 
                           001AEB     2 	LINK=.
      009B6B                          3 RUN:
      009B6B 03                       4 	.byte 3 	
      009B6C 52 55 4E                 5 	.ascii "RUN"
      009B6F 00 92                    6 	.word RUN_IDX 
      001AF1                       4896 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      009B71 9B 6B                    1 	.word LINK 
                           001AF3     2 	LINK=.
      009B73                          3 RSHIFT:
      009B73 46                       4 	.byte 6+F_IFUNC 	
      009B74 52 53 48 49 46 54        5 	.ascii "RSHIFT"
      009B7A 00 90                    6 	.word RSHIFT_IDX 
      001AFC                       4897 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      009B7C 9B 73                    1 	.word LINK 
                           001AFE     2 	LINK=.
      009B7E                          3 RND:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009B7E 43                       4 	.byte 3+F_IFUNC 	
      009B7F 52 4E 44                 5 	.ascii "RND"
      009B82 00 8E                    6 	.word RND_IDX 
      001B04                       4898 	_dict_entry,6,RETURN,RET_IDX;return 
      009B84 9B 7E                    1 	.word LINK 
                           001B06     2 	LINK=.
      009B86                          3 RETURN:
      009B86 06                       4 	.byte 6 	
      009B87 52 45 54 55 52 4E        5 	.ascii "RETURN"
      009B8D 00 8C                    6 	.word RET_IDX 
      001B0F                       4899 	_dict_entry,7,RESTORE,REST_IDX;restore 
      009B8F 9B 86                    1 	.word LINK 
                           001B11     2 	LINK=.
      009B91                          3 RESTORE:
      009B91 07                       4 	.byte 7 	
      009B92 52 45 53 54 4F 52 45     5 	.ascii "RESTORE"
      009B99 00 8A                    6 	.word REST_IDX 
      001B1B                       4900 	_dict_entry 6,REMARK,REM_IDX;remark 
      009B9B 9B 91                    1 	.word LINK 
                           001B1D     2 	LINK=.
      009B9D                          3 REMARK:
      009B9D 06                       4 	.byte 6 	
      009B9E 52 45 4D 41 52 4B        5 	.ascii "REMARK"
      009BA4 00 88                    6 	.word REM_IDX 
      001B26                       4901 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      009BA6 9B 9D                    1 	.word LINK 
                           001B28     2 	LINK=.
      009BA8                          3 REBOOT:
      009BA8 06                       4 	.byte 6 	
      009BA9 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      009BAF 00 86                    6 	.word RBT_IDX 
      001B31                       4902 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      009BB1 9B A8                    1 	.word LINK 
                           001B33     2 	LINK=.
      009BB3                          3 READ:
      009BB3 44                       4 	.byte 4+F_IFUNC 	
      009BB4 52 45 41 44              5 	.ascii "READ"
      009BB8 00 84                    6 	.word READ_IDX 
      001B3A                       4903 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      009BBA 9B B3                    1 	.word LINK 
                           001B3C     2 	LINK=.
      009BBC                          3 QKEY:
      009BBC 44                       4 	.byte 4+F_IFUNC 	
      009BBD 51 4B 45 59              5 	.ascii "QKEY"
      009BC1 00 82                    6 	.word QKEY_IDX 
      001B43                       4904 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      009BC3 9B BC                    1 	.word LINK 
                           001B45     2 	LINK=.
      009BC5                          3 PRTI:
      009BC5 44                       4 	.byte 4+F_IFUNC 	
      009BC6 50 52 54 49              5 	.ascii "PRTI"
      009BCA 00 80                    6 	.word PRTI_IDX 
      001B4C                       4905 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      009BCC 9B C5                    1 	.word LINK 
                           001B4E     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009BCE                          3 PRTH:
      009BCE 44                       4 	.byte 4+F_IFUNC 	
      009BCF 50 52 54 48              5 	.ascii "PRTH"
      009BD3 00 7E                    6 	.word PRTH_IDX 
      001B55                       4906 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      009BD5 9B CE                    1 	.word LINK 
                           001B57     2 	LINK=.
      009BD7                          3 PRTG:
      009BD7 44                       4 	.byte 4+F_IFUNC 	
      009BD8 50 52 54 47              5 	.ascii "PRTG"
      009BDC 00 7C                    6 	.word PRTG_IDX 
      001B5E                       4907 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      009BDE 9B D7                    1 	.word LINK 
                           001B60     2 	LINK=.
      009BE0                          3 PRTF:
      009BE0 44                       4 	.byte 4+F_IFUNC 	
      009BE1 50 52 54 46              5 	.ascii "PRTF"
      009BE5 00 7A                    6 	.word PRTF_IDX 
      001B67                       4908 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      009BE7 9B E0                    1 	.word LINK 
                           001B69     2 	LINK=.
      009BE9                          3 PRTE:
      009BE9 44                       4 	.byte 4+F_IFUNC 	
      009BEA 50 52 54 45              5 	.ascii "PRTE"
      009BEE 00 78                    6 	.word PRTE_IDX 
      001B70                       4909 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      009BF0 9B E9                    1 	.word LINK 
                           001B72     2 	LINK=.
      009BF2                          3 PRTD:
      009BF2 44                       4 	.byte 4+F_IFUNC 	
      009BF3 50 52 54 44              5 	.ascii "PRTD"
      009BF7 00 76                    6 	.word PRTD_IDX 
      001B79                       4910 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      009BF9 9B F2                    1 	.word LINK 
                           001B7B     2 	LINK=.
      009BFB                          3 PRTC:
      009BFB 44                       4 	.byte 4+F_IFUNC 	
      009BFC 50 52 54 43              5 	.ascii "PRTC"
      009C00 00 74                    6 	.word PRTC_IDX 
      001B82                       4911 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      009C02 9B FB                    1 	.word LINK 
                           001B84     2 	LINK=.
      009C04                          3 PRTB:
      009C04 44                       4 	.byte 4+F_IFUNC 	
      009C05 50 52 54 42              5 	.ascii "PRTB"
      009C09 00 72                    6 	.word PRTB_IDX 
      001B8B                       4912 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      009C0B 9C 04                    1 	.word LINK 
                           001B8D     2 	LINK=.
      009C0D                          3 PRTA:
      009C0D 44                       4 	.byte 4+F_IFUNC 	
      009C0E 50 52 54 41              5 	.ascii "PRTA"
      009C12 00 70                    6 	.word PRTA_IDX 
      001B94                       4913 	_dict_entry 5,PRINT,PRT_IDX;print 
      009C14 9C 0D                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                           001B96     2 	LINK=.
      009C16                          3 PRINT:
      009C16 05                       4 	.byte 5 	
      009C17 50 52 49 4E 54           5 	.ascii "PRINT"
      009C1C 00 6E                    6 	.word PRT_IDX 
      001B9E                       4914 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      009C1E 9C 16                    1 	.word LINK 
                           001BA0     2 	LINK=.
      009C20                          3 POUT:
      009C20 44                       4 	.byte 4+F_IFUNC 	
      009C21 50 4F 55 54              5 	.ascii "POUT"
      009C25 00 6C                    6 	.word POUT_IDX 
      001BA7                       4915 	_dict_entry,4,POKE,POKE_IDX;poke 
      009C27 9C 20                    1 	.word LINK 
                           001BA9     2 	LINK=.
      009C29                          3 POKE:
      009C29 04                       4 	.byte 4 	
      009C2A 50 4F 4B 45              5 	.ascii "POKE"
      009C2E 00 6A                    6 	.word POKE_IDX 
      001BB0                       4916 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      009C30 9C 29                    1 	.word LINK 
                           001BB2     2 	LINK=.
      009C32                          3 PMODE:
      009C32 05                       4 	.byte 5 	
      009C33 50 4D 4F 44 45           5 	.ascii "PMODE"
      009C38 00 64                    6 	.word PMODE_IDX 
      001BBA                       4917 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      009C3A 9C 32                    1 	.word LINK 
                           001BBC     2 	LINK=.
      009C3C                          3 PINP:
      009C3C 44                       4 	.byte 4+F_IFUNC 	
      009C3D 50 49 4E 50              5 	.ascii "PINP"
      009C41 00 68                    6 	.word PINP_IDX 
      001BC3                       4918 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      009C43 9C 3C                    1 	.word LINK 
                           001BC5     2 	LINK=.
      009C45                          3 PEEK:
      009C45 44                       4 	.byte 4+F_IFUNC 	
      009C46 50 45 45 4B              5 	.ascii "PEEK"
      009C4A 00 66                    6 	.word PEEK_IDX 
      001BCC                       4919 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      009C4C 9C 45                    1 	.word LINK 
                           001BCE     2 	LINK=.
      009C4E                          3 PAUSE:
      009C4E 05                       4 	.byte 5 	
      009C4F 50 41 55 53 45           5 	.ascii "PAUSE"
      009C54 00 62                    6 	.word PAUSE_IDX 
      001BD6                       4920 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      009C56 9C 4E                    1 	.word LINK 
                           001BD8     2 	LINK=.
      009C58                          3 PAD:
      009C58 43                       4 	.byte 3+F_IFUNC 	
      009C59 50 41 44                 5 	.ascii "PAD"
      009C5C 00 60                    6 	.word PAD_IDX 
      001BDE                       4921 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009C5E 9C 58                    1 	.word LINK 
                           001BE0     2 	LINK=.
      009C60                          3 OR:
      009C60 42                       4 	.byte 2+F_IFUNC 	
      009C61 4F 52                    5 	.ascii "OR"
      009C63 00 5E                    6 	.word OR_IDX 
      001BE5                       4922 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      009C65 9C 60                    1 	.word LINK 
                           001BE7     2 	LINK=.
      009C67                          3 ODR:
      009C67 43                       4 	.byte 3+F_IFUNC 	
      009C68 4F 44 52                 5 	.ascii "ODR"
      009C6B 00 5C                    6 	.word ODR_IDX 
      001BED                       4923 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      009C6D 9C 67                    1 	.word LINK 
                           001BEF     2 	LINK=.
      009C6F                          3 NOT:
      009C6F 43                       4 	.byte 3+F_IFUNC 	
      009C70 4E 4F 54                 5 	.ascii "NOT"
      009C73 00 5A                    6 	.word NOT_IDX 
      001BF5                       4924 	_dict_entry,4,NEXT,NEXT_IDX;next 
      009C75 9C 6F                    1 	.word LINK 
                           001BF7     2 	LINK=.
      009C77                          3 NEXT:
      009C77 04                       4 	.byte 4 	
      009C78 4E 45 58 54              5 	.ascii "NEXT"
      009C7C 00 56                    6 	.word NEXT_IDX 
      001BFE                       4925 	_dict_entry,3,NEW,NEW_IDX;new
      009C7E 9C 77                    1 	.word LINK 
                           001C00     2 	LINK=.
      009C80                          3 NEW:
      009C80 03                       4 	.byte 3 	
      009C81 4E 45 57                 5 	.ascii "NEW"
      009C84 00 58                    6 	.word NEW_IDX 
      001C06                       4926 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      009C86 9C 80                    1 	.word LINK 
                           001C08     2 	LINK=.
      009C88                          3 MULDIV:
      009C88 46                       4 	.byte 6+F_IFUNC 	
      009C89 4D 55 4C 44 49 56        5 	.ascii "MULDIV"
      009C8F 00 54                    6 	.word MULDIV_IDX 
      001C11                       4927 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      009C91 9C 88                    1 	.word LINK 
                           001C13     2 	LINK=.
      009C93                          3 LSHIFT:
      009C93 46                       4 	.byte 6+F_IFUNC 	
      009C94 4C 53 48 49 46 54        5 	.ascii "LSHIFT"
      009C9A 00 52                    6 	.word LSHIFT_IDX 
      001C1C                       4928 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      009C9C 9C 93                    1 	.word LINK 
                           001C1E     2 	LINK=.
      009C9E                          3 LOG:
      009C9E 43                       4 	.byte 3+F_IFUNC 	
      009C9F 4C 4F 47                 5 	.ascii "LOG"
      009CA2 00 50                    6 	.word LOG_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      001C24                       4929 	_dict_entry 4,LIST,LIST_IDX;list
      009CA4 9C 9E                    1 	.word LINK 
                           001C26     2 	LINK=.
      009CA6                          3 LIST:
      009CA6 04                       4 	.byte 4 	
      009CA7 4C 49 53 54              5 	.ascii "LIST"
      009CAB 00 4E                    6 	.word LIST_IDX 
      001C2D                       4930 	_dict_entry 3,LET,LET_IDX;let 
      009CAD 9C A6                    1 	.word LINK 
                           001C2F     2 	LINK=.
      009CAF                          3 LET:
      009CAF 03                       4 	.byte 3 	
      009CB0 4C 45 54                 5 	.ascii "LET"
      009CB3 00 4C                    6 	.word LET_IDX 
      001C35                       4931 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      009CB5 9C AF                    1 	.word LINK 
                           001C37     2 	LINK=.
      009CB7                          3 KEY:
      009CB7 43                       4 	.byte 3+F_IFUNC 	
      009CB8 4B 45 59                 5 	.ascii "KEY"
      009CBB 00 4A                    6 	.word KEY_IDX 
      001C3D                       4932 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      009CBD 9C B7                    1 	.word LINK 
                           001C3F     2 	LINK=.
      009CBF                          3 IWDGREF:
      009CBF 07                       4 	.byte 7 	
      009CC0 49 57 44 47 52 45 46     5 	.ascii "IWDGREF"
      009CC7 00 48                    6 	.word IWDGREF_IDX 
      001C49                       4933 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      009CC9 9C BF                    1 	.word LINK 
                           001C4B     2 	LINK=.
      009CCB                          3 IWDGEN:
      009CCB 06                       4 	.byte 6 	
      009CCC 49 57 44 47 45 4E        5 	.ascii "IWDGEN"
      009CD2 00 46                    6 	.word IWDGEN_IDX 
      001C54                       4934 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      009CD4 9C CB                    1 	.word LINK 
                           001C56     2 	LINK=.
      009CD6                          3 INVERT:
      009CD6 46                       4 	.byte 6+F_IFUNC 	
      009CD7 49 4E 56 45 52 54        5 	.ascii "INVERT"
      009CDD 00 44                    6 	.word INVERT_IDX 
      001C5F                       4935 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      009CDF 9C D6                    1 	.word LINK 
                           001C61     2 	LINK=.
      009CE1                          3 INPUT:
      009CE1 05                       4 	.byte 5 	
      009CE2 49 4E 50 55 54           5 	.ascii "INPUT"
      009CE7 00 42                    6 	.word INPUT_IDX 
      001C69                       4936 	_dict_entry,2,IF,IF_IDX;if 
      009CE9 9C E1                    1 	.word LINK 
                           001C6B     2 	LINK=.
      009CEB                          3 IF:
      009CEB 02                       4 	.byte 2 	
      009CEC 49 46                    5 	.ascii "IF"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009CEE 00 40                    6 	.word IF_IDX 
      001C70                       4937 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      009CF0 9C EB                    1 	.word LINK 
                           001C72     2 	LINK=.
      009CF2                          3 IDR:
      009CF2 43                       4 	.byte 3+F_IFUNC 	
      009CF3 49 44 52                 5 	.ascii "IDR"
      009CF6 00 3E                    6 	.word IDR_IDX 
      001C78                       4938 	_dict_entry,3,HEX,HEX_IDX;hex_base
      009CF8 9C F2                    1 	.word LINK 
                           001C7A     2 	LINK=.
      009CFA                          3 HEX:
      009CFA 03                       4 	.byte 3 	
      009CFB 48 45 58                 5 	.ascii "HEX"
      009CFE 00 3C                    6 	.word HEX_IDX 
      001C80                       4939 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      009D00 9C FA                    1 	.word LINK 
                           001C82     2 	LINK=.
      009D02                          3 GPIO:
      009D02 44                       4 	.byte 4+F_IFUNC 	
      009D03 47 50 49 4F              5 	.ascii "GPIO"
      009D07 00 3A                    6 	.word GPIO_IDX 
      001C89                       4940 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      009D09 9D 02                    1 	.word LINK 
                           001C8B     2 	LINK=.
      009D0B                          3 GOTO:
      009D0B 04                       4 	.byte 4 	
      009D0C 47 4F 54 4F              5 	.ascii "GOTO"
      009D10 00 38                    6 	.word GOTO_IDX 
      001C92                       4941 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      009D12 9D 0B                    1 	.word LINK 
                           001C94     2 	LINK=.
      009D14                          3 GOSUB:
      009D14 05                       4 	.byte 5 	
      009D15 47 4F 53 55 42           5 	.ascii "GOSUB"
      009D1A 00 36                    6 	.word GOSUB_IDX 
      001C9C                       4942 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      009D1C 9D 14                    1 	.word LINK 
                           001C9E     2 	LINK=.
      009D1E                          3 FREE:
      009D1E 44                       4 	.byte 4+F_IFUNC 	
      009D1F 46 52 45 45              5 	.ascii "FREE"
      009D23 00 96                    6 	.word FREE_IDX 
      001CA5                       4943 	_dict_entry,3,FOR,FOR_IDX;for 
      009D25 9D 1E                    1 	.word LINK 
                           001CA7     2 	LINK=.
      009D27                          3 FOR:
      009D27 03                       4 	.byte 3 	
      009D28 46 4F 52                 5 	.ascii "FOR"
      009D2B 00 34                    6 	.word FOR_IDX 
      001CAD                       4944 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      009D2D 9D 27                    1 	.word LINK 
                           001CAF     2 	LINK=.
      009D2F                          3 FCPU:
      009D2F 04                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009D30 46 43 50 55              5 	.ascii "FCPU"
      009D34 00 32                    6 	.word FCPU_IDX 
      001CB6                       4945 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      009D36 9D 2F                    1 	.word LINK 
                           001CB8     2 	LINK=.
      009D38                          3 ERASE:
      009D38 05                       4 	.byte 5 	
      009D39 45 52 41 53 45           5 	.ascii "ERASE"
      009D3E 00 30                    6 	.word ERASE_IDX 
      001CC0                       4946 	_dict_entry,3,END,END_IDX;cmd_end  
      009D40 9D 38                    1 	.word LINK 
                           001CC2     2 	LINK=.
      009D42                          3 END:
      009D42 03                       4 	.byte 3 	
      009D43 45 4E 44                 5 	.ascii "END"
      009D46 00 2E                    6 	.word END_IDX 
      001CC8                       4947 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      009D48 9D 42                    1 	.word LINK 
                           001CCA     2 	LINK=.
      009D4A                          3 EEPROM:
      009D4A 46                       4 	.byte 6+F_IFUNC 	
      009D4B 45 45 50 52 4F 4D        5 	.ascii "EEPROM"
      009D51 00 2C                    6 	.word EEPROM_IDX 
      001CD3                       4948 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      009D53 9D 4A                    1 	.word LINK 
                           001CD5     2 	LINK=.
      009D55                          3 DWRITE:
      009D55 06                       4 	.byte 6+F_CMD 	
      009D56 44 57 52 49 54 45        5 	.ascii "DWRITE"
      009D5C 00 2A                    6 	.word DWRITE_IDX 
      001CDE                       4949 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      009D5E 9D 55                    1 	.word LINK 
                           001CE0     2 	LINK=.
      009D60                          3 DREAD:
      009D60 45                       4 	.byte 5+F_IFUNC 	
      009D61 44 52 45 41 44           5 	.ascii "DREAD"
      009D66 00 28                    6 	.word DREAD_IDX 
      001CE8                       4950 	_dict_entry,2,DO,DO_IDX;do_loop
      009D68 9D 60                    1 	.word LINK 
                           001CEA     2 	LINK=.
      009D6A                          3 DO:
      009D6A 02                       4 	.byte 2 	
      009D6B 44 4F                    5 	.ascii "DO"
      009D6D 00 26                    6 	.word DO_IDX 
      001CEF                       4951 	_dict_entry,3,DEC,DEC_IDX;dec_base
      009D6F 9D 6A                    1 	.word LINK 
                           001CF1     2 	LINK=.
      009D71                          3 DEC:
      009D71 03                       4 	.byte 3 	
      009D72 44 45 43                 5 	.ascii "DEC"
      009D75 00 24                    6 	.word DEC_IDX 
      001CF7                       4952 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      009D77 9D 71                    1 	.word LINK 
                           001CF9     2 	LINK=.
      009D79                          3 DDR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009D79 43                       4 	.byte 3+F_IFUNC 	
      009D7A 44 44 52                 5 	.ascii "DDR"
      009D7D 00 22                    6 	.word DDR_IDX 
      001CFF                       4953 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      009D7F 9D 79                    1 	.word LINK 
                           001D01     2 	LINK=.
      009D81                          3 DATALN:
      009D81 06                       4 	.byte 6 	
      009D82 44 41 54 41 4C 4E        5 	.ascii "DATALN"
      009D88 00 20                    6 	.word DATALN_IDX 
      001D0A                       4954 	_dict_entry,4,DATA,DATA_IDX;data  
      009D8A 9D 81                    1 	.word LINK 
                           001D0C     2 	LINK=.
      009D8C                          3 DATA:
      009D8C 04                       4 	.byte 4 	
      009D8D 44 41 54 41              5 	.ascii "DATA"
      009D91 00 1E                    6 	.word DATA_IDX 
      001D13                       4955 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      009D93 9D 8C                    1 	.word LINK 
                           001D15     2 	LINK=.
      009D95                          3 CRL:
      009D95 43                       4 	.byte 3+F_IFUNC 	
      009D96 43 52 4C                 5 	.ascii "CRL"
      009D99 00 1C                    6 	.word CRL_IDX 
      001D1B                       4956 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      009D9B 9D 95                    1 	.word LINK 
                           001D1D     2 	LINK=.
      009D9D                          3 CRH:
      009D9D 43                       4 	.byte 3+F_IFUNC 	
      009D9E 43 52 48                 5 	.ascii "CRH"
      009DA1 00 1A                    6 	.word CRH_IDX 
      001D23                       4957 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      009DA3 9D 9D                    1 	.word LINK 
                           001D25     2 	LINK=.
      009DA5                          3 CHAR:
      009DA5 84                       4 	.byte 4+F_CFUNC 	
      009DA6 43 48 41 52              5 	.ascii "CHAR"
      009DAA 00 18                    6 	.word CHAR_IDX 
      001D2C                       4958 	_dict_entry,3,BYE,BYE_IDX;bye 
      009DAC 9D A5                    1 	.word LINK 
                           001D2E     2 	LINK=.
      009DAE                          3 BYE:
      009DAE 03                       4 	.byte 3 	
      009DAF 42 59 45                 5 	.ascii "BYE"
      009DB2 00 16                    6 	.word BYE_IDX 
      001D34                       4959 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      009DB4 9D AE                    1 	.word LINK 
                           001D36     2 	LINK=.
      009DB6                          3 BTOGL:
      009DB6 05                       4 	.byte 5 	
      009DB7 42 54 4F 47 4C           5 	.ascii "BTOGL"
      009DBC 00 14                    6 	.word BTOGL_IDX 
      001D3E                       4960 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      009DBE 9D B6                    1 	.word LINK 
                           001D40     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009DC0                          3 BTEST:
      009DC0 45                       4 	.byte 5+F_IFUNC 	
      009DC1 42 54 45 53 54           5 	.ascii "BTEST"
      009DC6 00 12                    6 	.word BTEST_IDX 
      001D48                       4961 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      009DC8 9D C0                    1 	.word LINK 
                           001D4A     2 	LINK=.
      009DCA                          3 BSET:
      009DCA 04                       4 	.byte 4 	
      009DCB 42 53 45 54              5 	.ascii "BSET"
      009DCF 00 10                    6 	.word BSET_IDX 
      001D51                       4962 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      009DD1 9D CA                    1 	.word LINK 
                           001D53     2 	LINK=.
      009DD3                          3 BRES:
      009DD3 04                       4 	.byte 4 	
      009DD4 42 52 45 53              5 	.ascii "BRES"
      009DD8 00 0E                    6 	.word BRES_IDX 
      001D5A                       4963 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      009DDA 9D D3                    1 	.word LINK 
                           001D5C     2 	LINK=.
      009DDC                          3 BIT:
      009DDC 43                       4 	.byte 3+F_IFUNC 	
      009DDD 42 49 54                 5 	.ascii "BIT"
      009DE0 00 0C                    6 	.word BIT_IDX 
      001D62                       4964 	_dict_entry,3,AWU,AWU_IDX;awu 
      009DE2 9D DC                    1 	.word LINK 
                           001D64     2 	LINK=.
      009DE4                          3 AWU:
      009DE4 03                       4 	.byte 3 	
      009DE5 41 57 55                 5 	.ascii "AWU"
      009DE8 00 0A                    6 	.word AWU_IDX 
      001D6A                       4965 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      009DEA 9D E4                    1 	.word LINK 
                           001D6C     2 	LINK=.
      009DEC                          3 ASC:
      009DEC 43                       4 	.byte 3+F_IFUNC 	
      009DED 41 53 43                 5 	.ascii "ASC"
      009DF0 00 08                    6 	.word ASC_IDX 
      001D72                       4966 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      009DF2 9D EC                    1 	.word LINK 
                           001D74     2 	LINK=.
      009DF4                          3 AND:
      009DF4 43                       4 	.byte 3+F_IFUNC 	
      009DF5 41 4E 44                 5 	.ascii "AND"
      009DF8 00 06                    6 	.word AND_IDX 
      001D7A                       4967 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      009DFA 9D F4                    1 	.word LINK 
                           001D7C     2 	LINK=.
      009DFC                          3 ADCREAD:
      009DFC 47                       4 	.byte 7+F_IFUNC 	
      009DFD 41 44 43 52 45 41 44     5 	.ascii "ADCREAD"
      009E04 00 04                    6 	.word ADCREAD_IDX 
      001D86                       4968 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      009E06 9D FC                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                           001D88     2 	LINK=.
      009E08                          3 ADCON:
      009E08 05                       4 	.byte 5 	
      009E09 41 44 43 4F 4E           5 	.ascii "ADCON"
      009E0E 00 02                    6 	.word ADCON_IDX 
      009E10                       4969 kword_dict::
      001D90                       4970 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      009E10 9E 08                    1 	.word LINK 
                           001D92     2 	LINK=.
      009E12                          3 ABS:
      009E12 43                       4 	.byte 3+F_IFUNC 	
      009E13 41 42 53                 5 	.ascii "ABS"
      009E16 00 00                    6 	.word ABS_IDX 
                                   4971 
                                   4972 ;comands and fonctions address table 	
      009E18                       4973 code_addr::
      009E18 95 D0 92 ED 93 29 95  4974 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             E4 94 C1 95 81 98 32
      009E26 90 7B 90 6B 90 9C 90  4975 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             8C 95 5A 94 AF 98 EC
      009E34 98 E6 99 04 99 0A 98  4976 	.word const_cr1,data,data_line,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             E0 8E 34 98 5B 93 5D
             93 8D
      009E44 98 FE 92 99 94 55 96  4977 	.word const_eeprom_base,cmd_end,erase,fcpu,for,gosub,goto,gpio ; 24..31 
             5E 90 F7 92 02 91 E7
             94 FD
      009E54 8E 2F 98 DA 90 E3 8F  4978 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             D0 98 4C 97 DC 98 12
             94 E8
      009E64 8E 83 8E AE 98 17 96  4979 	.word let,list,log2,lshift,muldiv,next,new ; 40..47
             2C 8B D3 91 77 94 14
      009E72 97 CF 98 D4 95 FC 9A  4980 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             98 95 6E 96 6A 90 D2
             98 F8
      009E82 90 C3 98 F2 8F 4A 98  4981 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             9E 98 A4 98 AA 98 B0
             98 B6
      009E92 98 BC 98 C2 98 C8 98  4982 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             CE 94 F0 99 87 84 EF
             90 40
      009EA2 99 38 92 22 96 E6 96  4983 	.word restore,return, random,rshift,run,show,free ; 72..79
             45 92 40 8D EE 8E 39
      009EB0 95 63 9A 79 99 E1 9A  4984 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             81 9A 59 91 50 93 C8
             95 CA
      009EC0 97 B3 97 C2 91 20 92  4985 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             A9 8E 61 95 27 98 70
             95 3D
      009ED0 90 46 97 4D 94 78 96  4986 	.word wait,words,write,bit_xor ; 96..99
             14
      009ED8 00 00                 4987 	.word 0 
                                   4988 
                                   4989 
                                   4990 
                                   4991 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
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
                                     18 ;------------------------------
                                     19 ; This file is for functions 
                                     20 ; interfacing with VT100 terminal
                                     21 ; emulator.
                                     22 ; except for getc and putc which
                                     23 ; are in TinyBasic.asm 
                                     24 ; exported functions:
                                     25 ;   puts 
                                     26 ;   readln 
                                     27 ;   spaces 
                                     28 ;------------------------------
                                     29 
                                     30     .module TERMINAL
                                     31 
                                     32 ;    .nlist
                                     33 ;	.include "inc/nucleo_8s208.inc"
                                     34 ;	.include "inc/stm8s208.inc"
                                     35 ;	.include "inc/ascii.inc"
                                     36 ;	.include "inc/gen_macros.inc" 
                                     37 ;	.include "tbi_macros.inc" 
                                     38     .list 
                                     39 
                                     40 
                                     41     .area CODE 
                                     42 
                                     43 
                                     44 ;-----------------------------
                                     45 ;  constants replacing 
                                     46 ;  ANSI sequence received 
                                     47 ;  from terminal.
                                     48 ;  These are the ANSI sequences
                                     49 ;  accepted by function readln
                                     50 ;------------------------------
                           000080    51     ARROW_LEFT=128
                           000081    52     ARROW_RIGHT=129
                           000082    53     HOME=130
                           000083    54     KEY_END=131
                           000084    55     SUP=132 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                     56 
      009EDA 43 81 44 80 48 82 46    57 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             83 33 84 00 00
                                     58 
                                     59 ;--------------------------------
                                     60 ; receive ANSI ESC 
                                     61 ; sequence and convert it
                                     62 ; to a single character code 
                                     63 ; in range {128..255}
                                     64 ; This is called after receiving 
                                     65 ; ESC character. 
                                     66 ; ignored sequence return 0 
                                     67 ; output:
                                     68 ;   A    converted character 
                                     69 ;-------------------------------
      009EE6                         70 get_escape:
      009EE6 CD 83 42         [ 4]   71     call getc 
      009EE9 A1 5B            [ 1]   72     cp a,#'[ ; this character is expected after ESC 
      009EEB 27 02            [ 1]   73     jreq 1$
      009EED 4F               [ 1]   74     clr a
      009EEE 81               [ 4]   75     ret
      009EEF CD 83 42         [ 4]   76 1$: call getc 
      009EF2 AE 9E DA         [ 2]   77     ldw x,#convert_table
      009EF5                         78 2$:
      009EF5 F1               [ 1]   79     cp a,(x)
      009EF6 27 08            [ 1]   80     jreq 4$
      009EF8 1C 00 02         [ 2]   81     addw x,#2
      009EFB 7D               [ 1]   82     tnz (x)
      009EFC 26 F7            [ 1]   83     jrne 2$
      009EFE 4F               [ 1]   84     clr a
      009EFF 81               [ 4]   85     ret 
      009F00 5C               [ 1]   86 4$: incw x 
      009F01 F6               [ 1]   87     ld a,(x)
      009F02 A1 84            [ 1]   88     cp a,#SUP
      009F04 26 05            [ 1]   89     jrne 5$
      009F06 88               [ 1]   90     push a 
      009F07 CD 83 42         [ 4]   91     call getc
      009F0A 84               [ 1]   92     pop a 
      009F0B                         93 5$:
      009F0B 81               [ 4]   94     ret 
                                     95 
                                     96 
                                     97 ;-----------------------------
                                     98 ; send an ASCIZ string to UART1 
                                     99 ; input: 
                                    100 ;   x 		char * 
                                    101 ; output:
                                    102 ;   none 
                                    103 ;-------------------------------
      009F0C                        104 puts::
      009F0C F6               [ 1]  105     ld a,(x)
      009F0D 27 06            [ 1]  106 	jreq 1$
      009F0F CD 83 32         [ 4]  107 	call putc 
      009F12 5C               [ 1]  108 	incw x 
      009F13 20 F7            [ 2]  109 	jra puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009F15 81               [ 4]  110 1$:	ret 
                                    111 
                                    112 
                                    113 ;---------------------------
                                    114 ; delete character at left 
                                    115 ; of cursor on terminal 
                                    116 ; input:
                                    117 ;   none 
                                    118 ; output:
                                    119 ;	none 
                                    120 ;---------------------------
      009F16                        121 bksp:
      009F16 A6 08            [ 1]  122 	ld a,#BS 
      009F18 CD 83 32         [ 4]  123 	call putc 
      009F1B A6 20            [ 1]  124 	ld a,#SPACE 
      009F1D CD 83 32         [ 4]  125 	call putc 
      009F20 A6 08            [ 1]  126 	ld a,#BS 
      009F22 CD 83 32         [ 4]  127 	call putc 
      009F25 81               [ 4]  128 	ret 
                                    129 ;---------------------------
                                    130 ; delete n character left of cursor 
                                    131 ; at terminal.
                                    132 ; input: 
                                    133 ;   A   number of characters to delete.
                                    134 ; output:
                                    135 ;    none 
                                    136 ;--------------------------	
      009F26                        137 delete_nchar:
      009F26 88               [ 1]  138 	push a 
      009F27 0D 01            [ 1]  139 0$:	tnz (1,sp)
      009F29 27 07            [ 1]  140 	jreq 1$
      009F2B CD 9F 16         [ 4]  141 	call bksp 
      009F2E 0A 01            [ 1]  142 	dec (1,sp)
      009F30 20 F5            [ 2]  143 	jra 0$
      009F32 84               [ 1]  144 1$:	pop a 
      009F33 81               [ 4]  145 	ret
                                    146 
                                    147 ;--------------------------
                                    148 ; send ANSI escape sequence
                                    149 ; ANSI: ESC[
                                    150 ; note: ESC is ASCII 27
                                    151 ;       [   is ASCII 91  
                                    152 ;-------------------------- 
      009F34                        153 send_escape:
      009F34 A6 1B            [ 1]  154 	ld a,#ESC 
      009F36 CD 83 32         [ 4]  155 	call putc 
      009F39 A6 5B            [ 1]  156 	ld a,#'[
      009F3B CD 83 32         [ 4]  157 	call putc 
      009F3E 81               [ 4]  158 	ret 
                                    159 
                                    160 ;---------------------
                                    161 ;send ANSI parameter value
                                    162 ; ANSI parameter values are 
                                    163 ; sent as ASCII charater 
                                    164 ; not as binary number.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                    165 ; this routine 
                                    166 ; convert binary number to 
                                    167 ; ASCII string and send it.
                                    168 ; expected range {0..99}
                                    169 ; input: 
                                    170 ; 	A {0..99} 
                                    171 ; output:
                                    172 ;   none 
                                    173 ;---------------------
      009F3F                        174 send_parameter:
      009F3F 89               [ 2]  175 	pushw x 
      009F40 5F               [ 1]  176 	clrw x 
      009F41 97               [ 1]  177 	ld xl,a 
      009F42 A6 0A            [ 1]  178 	ld a,#10 
      009F44 62               [ 2]  179 	div x,a 
      009F45 95               [ 1]  180 	ld xh,a 
      009F46 9F               [ 1]  181 	ld a,xl
      009F47 4D               [ 1]  182     tnz a 
      009F48 27 0B            [ 1]  183     jreq 2$
      009F4A A1 09            [ 1]  184 	cp a,#9 
      009F4C 23 02            [ 2]  185 	jrule 1$
      009F4E A6 39            [ 1]  186 	ld a,#'9
      009F50                        187 1$:
      009F50 AB 30            [ 1]  188 	add a,#'0 
      009F52 CD 83 32         [ 4]  189 	call putc
      009F55 9E               [ 1]  190 2$:	ld a,xh 
      009F56 AB 30            [ 1]  191 	add a,#'0
      009F58 CD 83 32         [ 4]  192 	call putc 
      009F5B 85               [ 2]  193 	popw x 
      009F5C 81               [ 4]  194 	ret 
                                    195 
                                    196 ;--------------------------
                                    197 ; move cursor left n character
                                    198 ; ANSI: ESC[PnD 
                                    199 ; 'Pn' est a numerical parameter
                                    200 ; specifying number of characters 
                                    201 ; displacement.
                                    202 ; input:
                                    203 ;   A     character count
                                    204 ; output:
                                    205 ;   none
                                    206 ;--------------------------
      009F5D                        207 move_left:
      009F5D 88               [ 1]  208 	push a 
      009F5E CD 9F 34         [ 4]  209 	call send_escape
      009F61 84               [ 1]  210     pop a
      009F62 CD 9F 3F         [ 4]  211 	call send_parameter 
      009F65 A6 44            [ 1]  212 	ld a,#'D 
      009F67 CD 83 32         [ 4]  213 	call putc 
      009F6A 81               [ 4]  214 	ret	
                                    215 
                                    216 
                                    217 ;--------------------------
                                    218 ; move cursor right n character 
                                    219 ; ANSI: ESC[PnC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                    220 ; input:
                                    221 ;   A     character count
                                    222 ; output:
                                    223 ;   none
                                    224 ;--------------------------
      009F6B                        225 move_right:
      009F6B 88               [ 1]  226 	push a 
      009F6C CD 9F 34         [ 4]  227 	call send_escape
      009F6F 84               [ 1]  228     pop a
      009F70 CD 9F 3F         [ 4]  229 	call send_parameter 
      009F73 A6 43            [ 1]  230 	ld a,#'C 
      009F75 CD 83 32         [ 4]  231 	call putc 
      009F78 81               [ 4]  232 	ret 
                                    233 
                                    234 
                                    235 ;--------------------------
                                    236 ; print n spaces on terminal
                                    237 ; input:
                                    238 ;  X 		number of spaces 
                                    239 ; output:
                                    240 ;	none 
                                    241 ;---------------------------
      009F79                        242 spaces::
      009F79 A6 20            [ 1]  243 	ld a,#SPACE 
      009F7B 5D               [ 2]  244 1$:	tnzw x
      009F7C 27 06            [ 1]  245 	jreq 9$
      009F7E CD 83 32         [ 4]  246 	call putc 
      009F81 5A               [ 2]  247 	decw x
      009F82 20 F7            [ 2]  248 	jra 1$
      009F84                        249 9$: 
      009F84 81               [ 4]  250 	ret 
                                    251 
                                    252 ;--------------------------
                                    253 ; insert character in text 
                                    254 ; line 
                                    255 ; input:
                                    256 ;   A       character to insert 
                                    257 ;   xl      line length
                                    258 ;   xh      insert position 
                                    259 ;   Y       line pointer 
                                    260 ; output:
                                    261 ;   Y       updated Y 
                                    262 ;-------------------------
                           000001   263 	IPOS=1
                           000002   264 	KCHAR=2 
                           000003   265     LLEN=3 
                           000003   266 	VSISE=3 
      009F85                        267 insert_char: 
      001F05                        268 	_vars VSIZE 
      009F85 52 06            [ 2]    1     sub sp,#VSIZE 
      009F87 6B 02            [ 1]  269     ld (KCHAR,sp),a 
      009F89 9E               [ 1]  270     ld a,xh 
      009F8A 6B 01            [ 1]  271 	ld (IPOS,sp),a
      009F8C 9F               [ 1]  272     ld a,xl 
      009F8D 6B 03            [ 1]  273     ld (LLEN,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009F8F 93               [ 1]  274     ldw x,y
      009F90 5C               [ 1]  275     incw x 
      009F91 7B 03            [ 1]  276     ld a,(LLEN,sp)
      009F93 10 01            [ 1]  277     sub a,(IPOS,sp)
      009F95 4C               [ 1]  278     inc a 
      009F96 C7 00 0E         [ 1]  279     ld acc8,a 
      009F99 72 5F 00 0D      [ 1]  280     clr acc16
      009F9D CD 84 36         [ 4]  281     call move
      009FA0 90 AE 16 90      [ 2]  282     ldw y,#tib 
      009FA4 7B 01            [ 1]  283     ld a,(IPOS,sp)
      009FA6 C7 00 0E         [ 1]  284     ld acc8,a 
      009FA9 72 B9 00 0D      [ 2]  285     addw y,acc16 
      009FAD 7B 02            [ 1]  286     ld a,(KCHAR,sp)
      009FAF 90 F7            [ 1]  287     ld (y),a
      009FB1 90 5C            [ 1]  288     incw y  
      009FB3 7B 01            [ 1]  289     ld a,(IPOS,sp)
      009FB5 CD 9F 5D         [ 4]  290     call move_left
      009FB8 AE 16 90         [ 2]  291     ldw x,#tib 
      009FBB CD 9F 0C         [ 4]  292     call puts 
      009FBE 7B 03            [ 1]  293     ld a,(LLEN,sp)
      009FC0 10 01            [ 1]  294     sub a,(IPOS,sp) 
      009FC2 CD 9F 5D         [ 4]  295     call move_left 
      001F45                        296 	_drop VSIZE 
      009FC5 5B 06            [ 2]    1     addw sp,#VSIZE 
      009FC7 81               [ 4]  297 	ret 
                                    298 
                                    299 
                                    300 ;--------------------------
                                    301 ; delete character under cursor
                                    302 ; input:
                                    303 ;   A       line length   
                                    304 ;   xl      delete position
                                    305 ;   Y       line pointer 
                                    306 ;-------------------------
                           000001   307 	CPOS=1
                           000002   308 	LLEN=2
                           000002   309 	VSIZE=2
      009FC8                        310 delete_under:
      001F48                        311 	_vars VSIZE 
      009FC8 52 02            [ 2]    1     sub sp,#VSIZE 
      009FCA 6B 02            [ 1]  312     ld (LLEN,sp),a 
      009FCC 9F               [ 1]  313     ld a,xl 
      009FCD 6B 01            [ 1]  314     ld (CPOS,sp),a 
      009FCF 93               [ 1]  315     ldw x,y ; move destination
      009FD0 90 5C            [ 1]  316     incw y  ; move source 
      009FD2 7B 02            [ 1]  317     ld a,(LLEN,sp)
      009FD4 10 01            [ 1]  318     sub a,(CPOS,sp)
      009FD6 4C               [ 1]  319     inc a ; move including zero at end.
      009FD7 C7 00 0E         [ 1]  320     ld acc8,a 
      009FDA 72 5F 00 0D      [ 1]  321     clr acc16 
      009FDE CD 84 36         [ 4]  322 	call move 
      009FE1 90 AE 16 90      [ 2]  323     ldw y,#tib 
      009FE5 7B 01            [ 1]  324     ld a,(CPOS,sp)
      009FE7 C7 00 0E         [ 1]  325     ld acc8,a 
      009FEA 72 B9 00 0D      [ 2]  326     addw y,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009FEE 93               [ 1]  327     ldw x,y 
      009FEF CD 9F 0C         [ 4]  328     call puts 
      009FF2 A6 20            [ 1]  329     ld a,#SPACE  
      009FF4 CD 83 32         [ 4]  330     call putc
      009FF7 7B 02            [ 1]  331     ld a,(LLEN,sp)
      009FF9 10 01            [ 1]  332     sub a,(CPOS,sp)
      009FFB CD 9F 5D         [ 4]  333     call move_left 
      009FFE 0A 02            [ 1]  334     dec (LLEN,sp)
      001F80                        335 	_drop VSIZE 
      00A000 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A002 81               [ 4]  336 	ret 
                                    337 
                                    338 ;-----------------------------
                                    339 ; send ANSI sequence to delete
                                    340 ; whole line. Cursor position
                                    341 ; is not updated.
                                    342 ; ANSI: ESC[2K
                                    343 ; input:
                                    344 ;   none
                                    345 ; output:
                                    346 ;   none 
                                    347 ;-----------------------------
      00A003                        348 delete_line:
      00A003 CD 9F 34         [ 4]  349     call send_escape
      00A006 A6 32            [ 1]  350 	ld a,#'2
      00A008 CD 83 32         [ 4]  351 	call putc 
      00A00B A6 4B            [ 1]  352 	ld a,#'K 
      00A00D CD 83 32         [ 4]  353 	call putc 
      00A010 81               [ 4]  354 	ret 
                                    355 
                                    356 
                                    357 
                                    358 ;------------------------------------
                                    359 ; read a line of text from terminal
                                    360 ;  touches de contrôle
                                    361 ;    BS   efface caractère à gauche 
                                    362 ;    ln+CTRL_E  edit ligne# 'ln' 
                                    363 ;    CTRL_R  répète dernière ligne saisie
                                    364 ;    CTRL_D  supprime ligne 
                                    365 ;    HOME  va au début de la ligne 
                                    366 ;    KEY_END  va à la fin de la ligne 
                                    367 ;    ARROW_LEFT  un caractère vers la gauche 
                                    368 ;    ARROW_RIGHT  un caractère vers la droite 
                                    369 ;    CTRL_O  commute entre insert/overwrite
                                    370 ; input:
                                    371 ;	none
                                    372 ; local variable on stack:
                                    373 ;	LL  line length
                                    374 ;   RXCHAR last received character 
                                    375 ; output:
                                    376 ;   text in tib  buffer
                                    377 ;   count  line length 
                                    378 ;------------------------------------
                                    379 	; local variables
                           000001   380 	LL_HB=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                           000001   381 	RXCHAR = 1 ; last char received
                           000002   382 	LL = 2  ; accepted line length
                           000003   383 	CPOS=3  ; cursor position 
                           000004   384 	OVRWR=4 ; overwrite flag 
                           000004   385 	VSIZE=4 
      00A011                        386 readln::
      001F91                        387 	_vars VSIZE 
      00A011 52 04            [ 2]    1     sub sp,#VSIZE 
      00A013 5F               [ 1]  388 	clrw x 
      00A014 1F 02            [ 2]  389 	ldw (LL,sp),x 
      00A016 1F 03            [ 2]  390 	ldw (CPOS,sp),x 
      00A018 03 04            [ 1]  391 	cpl (OVRWR,sp) ; default to overwrite mode 
      00A01A 90 AE 16 90      [ 2]  392  	ldw y,#tib ; input buffer
      00A01E                        393 readln_loop:
      00A01E CD 83 42         [ 4]  394 	call getc
      00A021 6B 01            [ 1]  395 	ld (RXCHAR,sp),a
      00A023 A1 1B            [ 1]  396     cp a,#ESC 
      00A025 26 05            [ 1]  397     jrne 0$
      00A027 CD 9E E6         [ 4]  398     call get_escape 
      00A02A 6B 01            [ 1]  399     ld (RXCHAR,sp),a 
      00A02C A1 0D            [ 1]  400 0$:	cp a,#CR
      00A02E 26 03            [ 1]  401 	jrne 1$
      00A030 CC A1 BA         [ 2]  402 	jp readln_quit
      00A033 A1 0A            [ 1]  403 1$:	cp a,#LF 
      00A035 26 03            [ 1]  404 	jrne 2$ 
      00A037 CC A1 BA         [ 2]  405 	jp readln_quit
      00A03A                        406 2$:
      00A03A A1 08            [ 1]  407 	cp a,#BS
      00A03C 26 12            [ 1]  408 	jrne 3$
                                    409 ; delete left 
      00A03E 0D 03            [ 1]  410     tnz (CPOS,sp)
      00A040 27 DC            [ 1]  411     jreq readln_loop 
      00A042 A6 01            [ 1]  412     ld a,#1 
      00A044 CD 9F 5D         [ 4]  413     call move_left
      00A047 0A 03            [ 1]  414     dec (CPOS,sp)
      00A049 90 5A            [ 2]  415     decw y 
      00A04B 7B 03            [ 1]  416     ld a,(CPOS,sp) 
      00A04D CC A1 66         [ 2]  417     jp 12$
      00A050                        418 3$:
      00A050 A1 04            [ 1]  419 	cp a,#CTRL_D
      00A052 26 1A            [ 1]  420 	jrne 4$
                                    421 ;delete line 
      00A054 CD A0 03         [ 4]  422 	call delete_line 
      00A057 7B 03            [ 1]  423     ld a,(CPOS,sp)
      00A059 4C               [ 1]  424     inc a 
      00A05A CD 9F 5D         [ 4]  425     call move_left 
      00A05D A6 3E            [ 1]  426 	ld a,#'> 
      00A05F CD 83 32         [ 4]  427 	call putc 
      00A062 90 AE 16 90      [ 2]  428 	ldw y,#tib
      00A066 90 7F            [ 1]  429 	clr (y)
      00A068 0F 02            [ 1]  430 	clr (LL,sp)
      00A06A 0F 03            [ 1]  431 	clr (CPOS,sp)
      00A06C 20 B0            [ 2]  432 	jra readln_loop
      00A06E                        433 4$:
      00A06E A1 12            [ 1]  434 	cp a,#CTRL_R 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00A070 26 21            [ 1]  435 	jrne 5$
                                    436 ;reprint 
      00A072 0D 02            [ 1]  437 	tnz (LL,sp)
      00A074 26 A8            [ 1]  438 	jrne readln_loop
      00A076 AE 16 90         [ 2]  439 	ldw x,#tib 
      00A079 CD 84 0C         [ 4]  440 	call strlen 
      00A07C 90 AE 16 90      [ 2]  441 	ldw y,#tib 
      00A080 27 9C            [ 1]  442 	jreq readln_loop
      00A082 6B 02            [ 1]  443 	ld (LL,sp),a 
      00A084 6B 03            [ 1]  444     ld (CPOS,sp),a
      00A086 AE 16 90         [ 2]  445 	ldw x,#tib 
      00A089 CD 9F 0C         [ 4]  446 	call puts
      00A08C 0F 01            [ 1]  447 	clr (LL_HB,sp)
      00A08E 72 F9 01         [ 2]  448 	addw y,(LL_HB,sp)
      00A091 20 8B            [ 2]  449 	jra readln_loop 
      00A093                        450 5$:
      00A093 A1 05            [ 1]  451 	cp a,#CTRL_E 
      00A095 26 49            [ 1]  452 	jrne 6$
                                    453 ;edit line number 
      00A097 AE 16 90         [ 2]  454 	ldw x,#tib 
      00A09A CD 8A 08         [ 4]  455 	call atoi24
      00A09D CE 00 0D         [ 2]  456 	ldw x,acc16
      00A0A0 CD A1 F4         [ 4]  457 	call search_lineno
      00A0A3 5D               [ 2]  458 	tnzw x 
      00A0A4 26 0B            [ 1]  459 	jrne 51$
      00A0A6 0F 02            [ 1]  460 	clr (LL,sp)
      00A0A8 90 AE 16 90      [ 2]  461 	ldw y,#tib
      00A0AC 90 7F            [ 1]  462     clr (y) 	
      00A0AE CC A1 BA         [ 2]  463 	jp readln_quit  
      00A0B1                        464 51$:
      00A0B1 CF 00 05         [ 2]  465 	ldw basicptr,x
      00A0B4 E6 02            [ 1]  466 	ld a,(2,x)
      00A0B6 C7 00 04         [ 1]  467 	ld count,a 
      00A0B9 90 AE 16 90      [ 2]  468 	ldw y,#tib 
      00A0BD CD A7 05         [ 4]  469 	call decompile 
      00A0C0 0F 01            [ 1]  470 	clr (LL_HB,sp)
      00A0C2 A6 0D            [ 1]  471 	ld a,#CR 
      00A0C4 CD 83 32         [ 4]  472 	call putc 
      00A0C7 A6 3E            [ 1]  473 	ld a,#'>
      00A0C9 CD 83 32         [ 4]  474 	call putc
      00A0CC AE 16 90         [ 2]  475     ldw x,#tib  
      00A0CF CD 84 0C         [ 4]  476 	call strlen 
      00A0D2 6B 02            [ 1]  477 	ld (LL,sp),a 
      00A0D4 CD 9F 0C         [ 4]  478 	call puts 
      00A0D7 90 93            [ 1]  479 	ldw y,x
      00A0D9 7B 02            [ 1]  480     ld a,(LL,sp)
      00A0DB 6B 03            [ 1]  481     ld (CPOS,sp),a  
      00A0DD CC A0 1E         [ 2]  482 	jp readln_loop
      00A0E0                        483 6$:
      00A0E0 A1 81            [ 1]  484 	cp a,#ARROW_RIGHT
      00A0E2 26 15            [ 1]  485    	jrne 7$ 
                                    486 ; right arrow
      00A0E4 7B 03            [ 1]  487 	ld a,(CPOS,sp)
      00A0E6 11 02            [ 1]  488     cp a,(LL,sp)
      00A0E8 2B 03            [ 1]  489     jrmi 61$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      00A0EA CC A0 1E         [ 2]  490     jp readln_loop 
      00A0ED                        491 61$:
      00A0ED A6 01            [ 1]  492     ld a,#1 
      00A0EF CD 9F 6B         [ 4]  493 	call move_right 
      00A0F2 0C 03            [ 1]  494 	inc (CPOS,sp)
      00A0F4 90 5C            [ 1]  495     incw y 
      00A0F6 CC A0 1E         [ 2]  496     jp readln_loop 
      00A0F9 A1 80            [ 1]  497 7$: cp a,#ARROW_LEFT  
      00A0FB 26 13            [ 1]  498 	jrne 8$
                                    499 ; left arrow 
      00A0FD 0D 03            [ 1]  500 	tnz (CPOS,sp)
      00A0FF 26 03            [ 1]  501 	jrne 71$
      00A101 CC A0 1E         [ 2]  502 	jp readln_loop
      00A104                        503 71$:
      00A104 A6 01            [ 1]  504     ld a,#1 
      00A106 CD 9F 5D         [ 4]  505 	call move_left 
      00A109 0A 03            [ 1]  506 	dec (CPOS,sp)
      00A10B 90 5A            [ 2]  507     decw y 
      00A10D CC A0 1E         [ 2]  508 	jp readln_loop 
      00A110 A1 82            [ 1]  509 8$: cp a,#HOME  
      00A112 26 0E            [ 1]  510 	jrne 9$
                                    511 ; HOME 
      00A114 7B 03            [ 1]  512     ld a,(CPOS,sp)
      00A116 CD 9F 5D         [ 4]  513     call move_left 
      00A119 0F 03            [ 1]  514 	clr (CPOS,sp)
      00A11B 90 AE 16 90      [ 2]  515     ldw y,#tib 
      00A11F CC A0 1E         [ 2]  516 	jp readln_loop  
      00A122 A1 83            [ 1]  517 9$: cp a,#KEY_END  
      00A124 26 26            [ 1]  518 	jrne 10$
                                    519 ; KEY_END 
      00A126 7B 03            [ 1]  520 	ld a,(CPOS,sp)
      00A128 11 02            [ 1]  521 	cp a,(LL,sp)
      00A12A 26 03            [ 1]  522 	jrne 91$
      00A12C CC A0 1E         [ 2]  523 	jp readln_loop 
      00A12F                        524 91$:
      00A12F 7B 02            [ 1]  525 	ld a,(LL,sp)
      00A131 10 03            [ 1]  526 	sub a,(CPOS,sp)
      00A133 CD 9F 6B         [ 4]  527 	call move_right 
      00A136 7B 02            [ 1]  528 	ld a,(LL,sp)
      00A138 6B 03            [ 1]  529 	ld (CPOS,sp),a
      00A13A 90 AE 16 90      [ 2]  530     ldw y,#tib
      00A13E 72 5F 00 0D      [ 1]  531     clr acc16 
      00A142 C7 00 0E         [ 1]  532     ld acc8,a 
      00A145 72 B9 00 0D      [ 2]  533     addw y,acc16  
      00A149 CC A0 1E         [ 2]  534 	jp readln_loop 
      00A14C A1 0F            [ 1]  535 10$: cp a,#CTRL_O
      00A14E 26 0C            [ 1]  536 	jrne 11$ 
                                    537 ; toggle between insert/overwrite
      00A150 03 04            [ 1]  538 	cpl (OVRWR,sp)
      00A152 90 89            [ 2]  539 	pushw y 
      00A154 CD 92 A0         [ 4]  540 	call beep_1khz
      00A157 90 85            [ 2]  541 	popw y 
      00A159 CC A0 1E         [ 2]  542 	jp readln_loop 
      00A15C A1 84            [ 1]  543 11$: cp a,#SUP 
      00A15E 26 11            [ 1]  544     jrne final_test 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                    545 ; del character under cursor 
      00A160 7B 03            [ 1]  546     ld a,(CPOS,sp)
      00A162 11 02            [ 1]  547     cp a,(LL,sp)
      00A164 2A 08            [ 1]  548     jrpl 13$
      00A166                        549 12$:
      00A166 97               [ 1]  550     ld xl,a    ; cursor position 
      00A167 7B 02            [ 1]  551     ld a,(LL,sp)  ; line length
      00A169 CD 9F C8         [ 4]  552     call delete_under
      00A16C 0A 02            [ 1]  553     dec (LLEN,sp)
      00A16E                        554 13$:
      00A16E CC A0 1E         [ 2]  555     jp readln_loop 
      00A171                        556 final_test:
      00A171 A1 20            [ 1]  557 	cp a,#SPACE
      00A173 2A 03            [ 1]  558 	jrpl accept_char
      00A175 CC A0 1E         [ 2]  559 	jp readln_loop
      00A178                        560 accept_char:
      00A178 A6 4F            [ 1]  561 	ld a,#TIB_SIZE-1
      00A17A 11 02            [ 1]  562 	cp a, (LL,sp)
      00A17C 2A 03            [ 1]  563 	jrpl 1$
      00A17E CC A0 1E         [ 2]  564 	jp readln_loop
      00A181 0D 04            [ 1]  565 1$:	tnz (OVRWR,sp)
      00A183 26 18            [ 1]  566 	jrne overwrite
                                    567 ; insert mode 
      00A185 7B 03            [ 1]  568     ld a,(CPOS,sp)
      00A187 11 02            [ 1]  569     cp a,(LL,sp)
      00A189 27 12            [ 1]  570     jreq overwrite
      00A18B 7B 02            [ 1]  571     ld a,(LL,sp)
      00A18D 97               [ 1]  572     ld xl,a 
      00A18E 7B 03            [ 1]  573     ld a,(CPOS,sp)
      00A190 95               [ 1]  574     ld xh,a
      00A191 7B 01            [ 1]  575     ld a,(RXCHAR,sp)
      00A193 CD 9F 85         [ 4]  576     call insert_char
      00A196 0C 02            [ 1]  577     inc (LLEN,sp)
      00A198 0C 03            [ 1]  578     inc (CPOS,sp)
      00A19A CC A0 1E         [ 2]  579     jp readln_loop 
      00A19D                        580 overwrite:
      00A19D 7B 01            [ 1]  581 	ld a,(RXCHAR,sp)
      00A19F 90 F7            [ 1]  582 	ld (y),a
      00A1A1 90 5C            [ 1]  583     incw y
      00A1A3 CD 83 32         [ 4]  584     call putc 
      00A1A6 7B 03            [ 1]  585 	ld a,(CPOS,sp)
      00A1A8 11 02            [ 1]  586 	cp a,(LL,sp)
      00A1AA 2B 09            [ 1]  587 	jrmi 1$
      00A1AC 90 7F            [ 1]  588 	clr (y)
      00A1AE 0C 02            [ 1]  589 	inc (LL,sp)
      00A1B0 0C 03            [ 1]  590     inc (CPOS,sp)
      00A1B2 CC A0 1E         [ 2]  591 	jp readln_loop 
      00A1B5                        592 1$:	
      00A1B5 0C 03            [ 1]  593 	inc (CPOS,sp)
      00A1B7 CC A0 1E         [ 2]  594 	jp readln_loop 
      00A1BA                        595 readln_quit:
      00A1BA 90 AE 16 90      [ 2]  596 	ldw y,#tib
      00A1BE 0F 01            [ 1]  597     clr (LL_HB,sp) 
      00A1C0 72 F9 01         [ 2]  598     addw y,(LL_HB,sp)
      00A1C3 90 7F            [ 1]  599     clr (y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00A1C5 7B 02            [ 1]  600 	ld a,(LL,sp)
      00A1C7 C7 00 04         [ 1]  601 	ld count,a 
      00A1CA A6 0D            [ 1]  602 	ld a,#CR
      00A1CC CD 83 32         [ 4]  603 	call putc
      00214F                        604 	_drop VSIZE 
      00A1CF 5B 04            [ 2]    1     addw sp,#VSIZE 
      00A1D1 81               [ 4]  605 	ret
                                    606 
                                    607 ;------------------------------
                                    608 ; print byte  in hexadecimal 
                                    609 ; on console
                                    610 ; input:
                                    611 ;    A		byte to print
                                    612 ;------------------------------
      00A1D2                        613 print_hex::
      00A1D2 88               [ 1]  614 	push a 
      00A1D3 4E               [ 1]  615 	swap a 
      00A1D4 CD A1 E9         [ 4]  616 	call to_hex_char 
      00A1D7 CD 83 32         [ 4]  617 	call putc 
      00A1DA 7B 01            [ 1]  618     ld a,(1,sp) 
      00A1DC CD A1 E9         [ 4]  619 	call to_hex_char
      00A1DF CD 83 32         [ 4]  620 	call putc
      00A1E2 A6 20            [ 1]  621 	ld a,#SPACE 
      00A1E4 CD 83 32         [ 4]  622 	call putc 
      00A1E7 84               [ 1]  623 	pop a 
      00A1E8 81               [ 4]  624 	ret 
                                    625 
                                    626 ;----------------------------------
                                    627 ; convert to hexadecimal digit 
                                    628 ; input:
                                    629 ;   A       digit to convert 
                                    630 ; output:
                                    631 ;   A       hexdecimal character 
                                    632 ;----------------------------------
      00A1E9                        633 to_hex_char::
      00A1E9 A4 0F            [ 1]  634 	and a,#15 
      00A1EB A1 09            [ 1]  635 	cp a,#9 
      00A1ED 23 02            [ 2]  636 	jrule 1$ 
      00A1EF AB 07            [ 1]  637 	add a,#7
      00A1F1 AB 30            [ 1]  638 1$: add a,#'0 
      00A1F3 81               [ 4]  639 	ret 
                                    640 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
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
                                     26 ;    .nlist
                                     27 ;	.include "inc/nucleo_8s208.inc"
                                     28 ;	.include "inc/stm8s208.inc"
                                     29 ;	.include "inc/ascii.inc"
                                     30 ;	.include "inc/gen_macros.inc" 
                                     31 ;	.include "tbi_macros.inc" 
                                     32 ;	.include "cmd_index.inc"
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
                                     45 ;   X 			addr of line | 0 
                                     46 ;   Y           line#|insert address if not found  
                                     47 ;-------------------------------------
                           000001    48 	LL=1 ; line length 
                           000002    49 	LB=2 ; line length low byte 
                           000002    50 	VSIZE=2 
      00A1F4                         51 search_lineno::
      002174                         52 	_vars VSIZE
      00A1F4 52 02            [ 2]    1     sub sp,#VSIZE 
      00A1F6 0F 01            [ 1]   53 	clr (LL,sp)
      00A1F8 90 CE 00 1A      [ 2]   54 	ldw y,txtbgn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00A1FC 4D               [ 1]   55 	tnz a 
      00A1FD 27 04            [ 1]   56 	jreq search_ln_loop
      00A1FF 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      00A203                         58 search_ln_loop:
      00A203 90 C3 00 1C      [ 2]   59 	cpw y,txtend 
      00A207 2A 10            [ 1]   60 	jrpl 8$
      00A209 90 F3            [ 1]   61 	cpw x,(y)
      00A20B 27 0E            [ 1]   62 	jreq 9$
      00A20D 2B 0A            [ 1]   63 	jrmi 8$ 
      00A20F 90 E6 02         [ 1]   64 	ld a,(2,y)
      00A212 6B 02            [ 1]   65 	ld (LB,sp),a 
      00A214 72 F9 01         [ 2]   66 	addw y,(LL,sp)
      00A217 20 EA            [ 2]   67 	jra search_ln_loop 
      00A219                         68 8$: 
      00A219 5F               [ 1]   69 	clrw x 	
      00A21A 51               [ 1]   70 	exgw x,y 
      00219B                         71 9$: _drop VSIZE
      00A21B 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A21D 51               [ 1]   72 	exgw x,y   
      00A21E 81               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      00A21F                         83 del_line: 
      00219F                         84 	_vars VSIZE 
      00A21F 52 04            [ 2]    1     sub sp,#VSIZE 
      00A221 E6 02            [ 1]   85 	ld a,(2,x) ; line length
      00A223 6B 02            [ 1]   86 	ld (LLEN+1,sp),a 
      00A225 0F 01            [ 1]   87 	clr (LLEN,sp)
      00A227 90 93            [ 1]   88 	ldw y,x  
      00A229 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      00A22C 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      00A22E 90 CE 00 1C      [ 2]   91 	ldw y,txtend 
      00A232 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      00A235 90 CF 00 0D      [ 2]   93 	ldw acc16,y 
      00A239 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      00A23B CD 84 36         [ 4]   95 	call move
      00A23E 90 CE 00 1C      [ 2]   96 	ldw y,txtend 
      00A242 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      00A245 90 CF 00 1C      [ 2]   98 	ldw txtend,y  
      0021C9                         99 	_drop VSIZE     
      00A249 5B 04            [ 2]    1     addw sp,#VSIZE 
      00A24B 81               [ 4]  100 	ret 
                                    101 
                                    102 ;---------------------------------------------
                                    103 ; create a gap in text area to 
                                    104 ; move new line in this gap
                                    105 ; input:
                                    106 ;    X 			addr gap start 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                    107 ;    Y 			gap length 
                                    108 ; output:
                                    109 ;    X 			addr gap start 
                                    110 ;--------------------------------------------
                           000001   111 	DEST=1
                           000003   112 	SRC=3
                           000005   113 	LEN=5
                           000006   114 	VSIZE=6 
      00A24C                        115 create_gap:
      0021CC                        116 	_vars VSIZE
      00A24C 52 06            [ 2]    1     sub sp,#VSIZE 
      00A24E 1F 03            [ 2]  117 	ldw (SRC,sp),x 
      00A250 17 05            [ 2]  118 	ldw (LEN,sp),y 
      00A252 90 CF 00 0D      [ 2]  119 	ldw acc16,y 
      00A256 90 93            [ 1]  120 	ldw y,x ; SRC
      00A258 72 BB 00 0D      [ 2]  121 	addw x,acc16  
      00A25C 1F 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      00A25E CE 00 1C         [ 2]  124 	ldw x,txtend 
      00A261 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      00A264 CF 00 0D         [ 2]  126 	ldw acc16,x ; size to move
      00A267 1E 01            [ 2]  127 	ldw x,(DEST,sp) 
      00A269 CD 84 36         [ 4]  128 	call move
      00A26C CE 00 1C         [ 2]  129 	ldw x,txtend
      00A26F 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      00A272 CF 00 1C         [ 2]  131 	ldw txtend,x
      0021F5                        132 9$:	_drop VSIZE 
      00A275 5B 06            [ 2]    1     addw sp,#VSIZE 
      00A277 81               [ 4]  133 	ret 
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
                           000008   149 	VSIZE=8  
      00A278                        150 insert_line:
      0021F8                        151 	_vars VSIZE 
      00A278 52 08            [ 2]    1     sub sp,#VSIZE 
      00A27A CE 00 1C         [ 2]  152 	ldw x,txtend  
      00A27D C3 00 1A         [ 2]  153 	cpw x,txtbgn 
      00A280 26 19            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      00A282 AE 00 02         [ 2]  156 	ldw x,#2 
      00A285 72 D6 00 18      [ 4]  157 	ld a,([ptr16],x)
      00A289 A1 03            [ 1]  158 	cp a,#3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A28B 27 5A            [ 1]  159 	jreq insert_ln_exit
      00A28D 5F               [ 1]  160 	clrw x 
      00A28E 97               [ 1]  161 	ld xl,a
      00A28F 1F 07            [ 2]  162 	ldw (LLEN,sp),x 
      00A291 CE 00 1A         [ 2]  163 	ldw x,txtbgn
      00A294 1F 01            [ 2]  164 	ldw (DEST,sp),x 
      00A296 CE 00 1C         [ 2]  165 	ldw x,txtend 
      00A299 20 38            [ 2]  166 	jra 4$
      00A29B 72 CE 00 18      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      00A29F 1F 05            [ 2]  169 	ldw (LINENO,sp),x 
      00A2A1 AE 00 02         [ 2]  170 	ldw x,#2 
      00A2A4 72 D6 00 18      [ 4]  171 	ld a,([ptr16],x)
      00A2A8 97               [ 1]  172 	ld xl,a
                                    173 ; line length
      00A2A9 1F 07            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      00A2AB 1E 05            [ 2]  176 	ldw x,(LINENO,sp)
      00A2AD 4F               [ 1]  177 	clr a 
      00A2AE CD A1 F4         [ 4]  178 	call search_lineno 
      00A2B1 5D               [ 2]  179 	tnzw x 
      00A2B2 26 04            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      00A2B4 17 01            [ 2]  183 	ldw (DEST,sp),y 
      00A2B6 20 05            [ 2]  184 	jra 3$
                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      00A2B8 1F 01            [ 2]  187 2$: ldw (DEST,sp),x 
      00A2BA CD A2 1F         [ 4]  188 	call del_line
      00A2BD                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      00A2BD A6 03            [ 1]  192 	ld a,#3
      00A2BF 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      00A2C1 27 24            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      00A2C3 1E 01            [ 2]  197 	ldw x,(DEST,sp)
      00A2C5 C3 00 1C         [ 2]  198 	cpw x,txtend 
      00A2C8 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      00A2CA 1E 01            [ 2]  202 	ldw x,(DEST,sp)
      00A2CC 16 07            [ 2]  203 	ldw y,(LLEN,sp)
      00A2CE CD A2 4C         [ 4]  204 	call create_gap
      00A2D1 20 06            [ 2]  205 	jra 5$
      00A2D3                        206 4$: 
      00A2D3 72 FB 07         [ 2]  207 	addw x,(LLEN,sp)
      00A2D6 CF 00 1C         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      00A2D9 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      00A2DB CF 00 0D         [ 2]  211 	ldw acc16,x 
      00A2DE 90 AE 16 E0      [ 2]  212 	ldw y,#pad ;SRC 
      00A2E2 1E 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A2E4 CD 84 36         [ 4]  214 	call move 
      00A2E7                        215 insert_ln_exit:	
      002267                        216 	_drop VSIZE
      00A2E7 5B 08            [ 2]    1     addw sp,#VSIZE 
      00A2E9 81               [ 4]  217 	ret
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
      00A2EA                        233 parse_quote: 
      00226A                        234 	_vars VSIZE 
      00A2EA 52 02            [ 2]    1     sub sp,#VSIZE 
      00A2EC 4F               [ 1]  235 	clr a
      00A2ED 6B 01            [ 1]  236 1$:	ld (PREV,sp),a 
      00A2EF                        237 2$:	
      00A2EF 91 D6 01         [ 4]  238 	ld a,([in.w],y)
      00A2F2 27 24            [ 1]  239 	jreq 6$
      00A2F4 72 5C 00 02      [ 1]  240 	inc in 
      00A2F8 6B 02            [ 1]  241 	ld (CURR,sp),a 
      00A2FA A6 5C            [ 1]  242 	ld a,#'\
      00A2FC 11 01            [ 1]  243 	cp a, (PREV,sp)
      00A2FE 26 0A            [ 1]  244 	jrne 3$
      00A300 0F 01            [ 1]  245 	clr (PREV,sp)
      00A302 7B 02            [ 1]  246 	ld a,(CURR,sp)
      00A304 AD 1C            [ 4]  247 	callr convert_escape
      00A306 F7               [ 1]  248 	ld (x),a 
      00A307 5C               [ 1]  249 	incw x 
      00A308 20 E5            [ 2]  250 	jra 2$
      00A30A                        251 3$:
      00A30A 7B 02            [ 1]  252 	ld a,(CURR,sp)
      00A30C A1 5C            [ 1]  253 	cp a,#'\'
      00A30E 27 DD            [ 1]  254 	jreq 1$
      00A310 A1 22            [ 1]  255 	cp a,#'"
      00A312 27 04            [ 1]  256 	jreq 6$ 
      00A314 F7               [ 1]  257 	ld (x),a 
      00A315 5C               [ 1]  258 	incw x 
      00A316 20 D7            [ 2]  259 	jra 2$
      00A318                        260 6$:
      00A318 7F               [ 1]  261 	clr (x)
      00A319 5C               [ 1]  262 	incw x 
      00A31A 90 93            [ 1]  263 	ldw y,x 
      00A31C 5F               [ 1]  264 	clrw x 
      00A31D A6 02            [ 1]  265 	ld a,#TK_QSTR  
      00229F                        266 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A31F 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A321 81               [ 4]  267 	ret 
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
      00A322                        278 convert_escape:
      00A322 89               [ 2]  279 	pushw x 
      00A323 AE A3 37         [ 2]  280 	ldw x,#escaped 
      00A326 F1               [ 1]  281 1$:	cp a,(x)
      00A327 27 06            [ 1]  282 	jreq 2$
      00A329 7D               [ 1]  283 	tnz (x)
      00A32A 27 09            [ 1]  284 	jreq 3$
      00A32C 5C               [ 1]  285 	incw x 
      00A32D 20 F7            [ 2]  286 	jra 1$
      00A32F 1D A3 37         [ 2]  287 2$: subw x,#escaped 
      00A332 9F               [ 1]  288 	ld a,xl 
      00A333 AB 07            [ 1]  289 	add a,#7
      00A335 85               [ 2]  290 3$:	popw x 
      00A336 81               [ 4]  291 	ret 
                                    292 
      00A337 61 62 74 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
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
                           000004   309 	VSIZE=4 
      00A33F                        310 parse_integer: ; { -- n }
      00A33F 89               [ 2]  311 	pushw x 	
      00A340 4B 00            [ 1]  312 	push #0 ; TCHAR
      00A342 4B 0A            [ 1]  313 	push #10 ; BASE=10
      00A344 A1 24            [ 1]  314 	cp a,#'$
      00A346 26 04            [ 1]  315 	jrne 2$ 
      0022C8                        316     _drop #1
      00A348 5B 01            [ 2]    1     addw sp,##1 
      00A34A 4B 10            [ 1]  317 	push #16  ; BASE=16
      00A34C F7               [ 1]  318 2$:	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A34D 5C               [ 1]  319 	incw x 
      00A34E 91 D6 01         [ 4]  320 	ld a,([in.w],y)
      00A351 72 5C 00 02      [ 1]  321 	inc in 
      00A355 CD 89 FC         [ 4]  322 	call to_upper 
      00A358 6B 02            [ 1]  323 	ld (TCHAR,sp),a 
      00A35A CD 84 97         [ 4]  324 	call is_digit 
      00A35D 25 ED            [ 1]  325 	jrc 2$
      00A35F A6 10            [ 1]  326 	ld a,#16 
      00A361 11 01            [ 1]  327 	cp a,(BASE,sp)
      00A363 26 0A            [ 1]  328 	jrne 3$ 
      00A365 7B 02            [ 1]  329 	ld a,(TCHAR,sp)
      00A367 A1 41            [ 1]  330 	cp a,#'A 
      00A369 2B 04            [ 1]  331 	jrmi 3$ 
      00A36B A1 47            [ 1]  332 	cp a,#'G 
      00A36D 2B DD            [ 1]  333 	jrmi 2$ 
      00A36F 72 5A 00 02      [ 1]  334 3$: dec in 	
      00A373 7F               [ 1]  335     clr (x)
      00A374 1E 03            [ 2]  336 	ldw x,(XSAVE,sp)
      00A376 CD 8A 08         [ 4]  337 	call atoi24
      00A379 90 93            [ 1]  338 	ldw y,x 
      00A37B CE 00 0D         [ 2]  339 	ldw x,acc16 
      00A37E A6 84            [ 1]  340 	ld a,#TK_INTGR
      00A380 90 FF            [ 2]  341 	ldw (y),x 
      00A382 72 A9 00 02      [ 2]  342 	addw y,#2
      002306                        343 	_drop VSIZE  
      00A386 5B 04            [ 2]    1     addw sp,#VSIZE 
      00A388 81               [ 4]  344 	ret 	
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
      00A389                        361 parse_binary: ; { -- n }
      00A389 4B 00            [ 1]  362 	push #0
      00A38B 4B 00            [ 1]  363 	push #0
      00A38D 4B 00            [ 1]  364 	push #0
      00A38F                        365 2$:	
      00A38F 91 D6 01         [ 4]  366 	ld a,([in.w],y)
      00A392 72 5C 00 02      [ 1]  367 	inc in 
      00A396 A1 30            [ 1]  368 	cp a,#'0 
      00A398 27 06            [ 1]  369 	jreq 3$
      00A39A A1 31            [ 1]  370 	cp a,#'1 
      00A39C 27 02            [ 1]  371 	jreq 3$ 
      00A39E 20 0B            [ 2]  372 	jra bin_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A3A0 A0 30            [ 1]  373 3$: sub a,#'0 
      00A3A2 46               [ 1]  374 	rrc a
      00A3A3 09 03            [ 1]  375 	rlc (BINARY+2,sp) 
      00A3A5 09 02            [ 1]  376 	rlc (BINARY+1,sp)
      00A3A7 09 01            [ 1]  377 	rlc (BINARY,sp) 
      00A3A9 20 E4            [ 2]  378 	jra 2$  
      00A3AB                        379 bin_exit:
      00A3AB 72 5A 00 02      [ 1]  380 	dec in 
      00A3AF 90 93            [ 1]  381 	ldw y,x
      00A3B1 7B 01            [ 1]  382 	ld a,(BINARY,sp)
      00A3B3 C7 00 0C         [ 1]  383 	ld acc24,a 
      00A3B6 1E 02            [ 2]  384 	ldw x,(BINARY+1,sp)
      00A3B8 CF 00 0D         [ 2]  385 	ldw acc16,x
      00A3BB 90 FF            [ 2]  386 	ldw (y),x 
      00A3BD 72 A9 00 02      [ 2]  387 	addw y,#2  
      00A3C1 A6 84            [ 1]  388 	ld a,#TK_INTGR 	
      002343                        389 	_drop VSIZE 
      00A3C3 5B 03            [ 2]    1     addw sp,#VSIZE 
      00A3C5 81               [ 4]  390 	ret
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
      00A3C6                        406 parse_keyword: 
      00A3C6 89               [ 2]  407 	pushw x 
      00A3C7                        408 kw_loop:	
      00A3C7 CD 89 FC         [ 4]  409 	call to_upper 
      00A3CA F7               [ 1]  410 	ld (x),a 
      00A3CB 5C               [ 1]  411 	incw x 
      00A3CC 91 D6 01         [ 4]  412 	ld a,([in.w],y)
      00A3CF 72 5C 00 02      [ 1]  413 	inc in 
      00A3D3 CD 84 86         [ 4]  414 	call is_alpha 
      00A3D6 25 EF            [ 1]  415 	jrc kw_loop
      00A3D8 72 5A 00 02      [ 1]  416 	dec in   
      00A3DC 7F               [ 1]  417 1$: clr (x)
      00A3DD 1E 01            [ 2]  418 	ldw x,(XFIRST,sp) 
      00A3DF E6 01            [ 1]  419 	ld a,(1,x)
      00A3E1 26 13            [ 1]  420 	jrne 2$
                                    421 ; one letter variable name 
      00A3E3 F6               [ 1]  422 	ld a,(x) 
      00A3E4 A0 41            [ 1]  423 	sub a,#'A 
      00A3E6 48               [ 1]  424 	sll a 
      00A3E7 88               [ 1]  425 	push a 
      00A3E8 4B 00            [ 1]  426 	push #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A3EA AE 00 31         [ 2]  427 	ldw x,#vars 
      00A3ED 72 FB 01         [ 2]  428 	addw x,(1,sp) ; X=var address 
      002370                        429 	_drop 2 
      00A3F0 5B 02            [ 2]    1     addw sp,#2 
      00A3F2 A6 85            [ 1]  430 	ld a,#TK_VAR 
      00A3F4 20 0E            [ 2]  431 	jra 4$ 
      00A3F6                        432 2$: ; check for keyword, otherwise syntax error.
      002376                        433 	_ldx_dict kword_dict ; dictionary entry point
      00A3F6 AE 9E 12         [ 2]    1     ldw x,#kword_dict+2
      00A3F9 16 01            [ 2]  434 	ldw y,(XFIRST,sp) ; name to search for
      00A3FB CD 8B EF         [ 4]  435 	call search_dict
      00A3FE 4D               [ 1]  436 	tnz a
      00A3FF 26 03            [ 1]  437 	jrne 4$ 
      00A401 CC 87 A6         [ 2]  438 	jp syntax_error
      00A404                        439 4$:	
      00A404 16 01            [ 2]  440 	ldw y,(XFIRST,sp)
      00A406 A3 00 4C         [ 2]  441 	cpw x,#LET_IDX 
      00A409 27 0A            [ 1]  442 	jreq 5$  ; don't compile LET command 
      00A40B 90 F7            [ 1]  443 	ld (y),a 
      00A40D 90 5C            [ 1]  444 	incw y 
      00A40F 90 FF            [ 2]  445 	ldw (y),x
      00A411 72 A9 00 02      [ 2]  446 	addw y,#2  
      002395                        447 5$:	_drop VSIZE 
      00A415 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A417 81               [ 4]  448 	ret  	
                                    449 
                                    450 ;------------------------------------
                                    451 ; skip character c in text starting from 'in'
                                    452 ; input:
                                    453 ;	 y 		point to text buffer
                                    454 ;    a 		character to skip
                                    455 ; output:  
                                    456 ;	'in' ajusted to new position
                                    457 ;------------------------------------
                           000001   458 	C = 1 ; local var
      00A418                        459 skip:
      00A418 88               [ 1]  460 	push a
      00A419 91 D6 01         [ 4]  461 1$:	ld a,([in.w],y)
      00A41C 27 0A            [ 1]  462 	jreq 2$
      00A41E 11 01            [ 1]  463 	cp a,(C,sp)
      00A420 26 06            [ 1]  464 	jrne 2$
      00A422 72 5C 00 02      [ 1]  465 	inc in
      00A426 20 F1            [ 2]  466 	jra 1$
      0023A8                        467 2$: _drop 1 
      00A428 5B 01            [ 2]    1     addw sp,#1 
      00A42A 81               [ 4]  468 	ret
                                    469 	
                                    470 
                                    471 ;------------------------------------
                                    472 ; scan text for next token
                                    473 ; input: 
                                    474 ;	X 		pointer to buffer where 
                                    475 ;	        token id and value are copied 
                                    476 ; use:
                                    477 ;	Y   pointer to text in tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                                    478 ; output:
                                    479 ;   A       token attribute 
                                    480 ;   X 		token value
                                    481 ;   Y       updated position in output buffer   
                                    482 ;------------------------------------
                                    483 	; use to check special character 
                                    484 	.macro _case c t  
                                    485 	ld a,#c 
                                    486 	cp a,(TCHAR,sp) 
                                    487 	jrne t
                                    488 	.endm 
                                    489 
                           000001   490 	TCHAR=1
                           000002   491 	ATTRIB=2
                           000002   492 	VSIZE=2
      00A42B                        493 get_token:: 
      0023AB                        494 	_vars VSIZE
      00A42B 52 02            [ 2]    1     sub sp,#VSIZE 
                                    495 ;	ld a,in 
                                    496 ;	sub a,count
                                    497 ;   jrmi 0$
                                    498 ;	clr a 
                                    499 ;	ret 
      00A42D                        500 0$: 
      00A42D 90 AE 16 90      [ 2]  501 	ldw y,#tib    	
      00A431 A6 20            [ 1]  502 	ld a,#SPACE
      00A433 CD A4 18         [ 4]  503 	call skip
      00A436 55 00 02 00 03   [ 1]  504 	mov in.saved,in 
      00A43B 91 D6 01         [ 4]  505 	ld a,([in.w],y)
      00A43E 26 05            [ 1]  506 	jrne 1$
      00A440 90 93            [ 1]  507 	ldw y,x 
      00A442 CC A5 E7         [ 2]  508 	jp token_exit ; end of line 
      00A445 72 5C 00 02      [ 1]  509 1$:	inc in 
      00A449 CD 89 FC         [ 4]  510 	call to_upper 
      00A44C 6B 01            [ 1]  511 	ld (TCHAR,sp),a 
                                    512 ; check for quoted string
      00A44E                        513 str_tst:  	
      0023CE                        514 	_case '"' nbr_tst
      00A44E A6 22            [ 1]    1 	ld a,#'"' 
      00A450 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A452 26 0A            [ 1]    3 	jrne nbr_tst
      00A454 A6 02            [ 1]  515 	ld a,#TK_QSTR
      00A456 F7               [ 1]  516 	ld (x),a 
      00A457 5C               [ 1]  517 	incw x 
      00A458 CD A2 EA         [ 4]  518 	call parse_quote
      00A45B CC A5 E7         [ 2]  519 	jp token_exit
      00A45E                        520 nbr_tst:
                                    521 ; check for hexadecimal number 
      00A45E A6 24            [ 1]  522 	ld a,#'$'
      00A460 11 01            [ 1]  523 	cp a,(TCHAR,sp) 
      00A462 27 17            [ 1]  524 	jreq 1$
                                    525 ;check for binary number 
      00A464 A6 26            [ 1]  526 	ld a,#'&
      00A466 11 01            [ 1]  527 	cp a,(TCHAR,sp)
      00A468 26 0A            [ 1]  528 	jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A46A A6 84            [ 1]  529 	ld a,#TK_INTGR
      00A46C F7               [ 1]  530 	ld (x),a 
      00A46D 5C               [ 1]  531 	incw x 
      00A46E CD A3 89         [ 4]  532 	call parse_binary ; expect binary integer 
      00A471 CC A5 E7         [ 2]  533 	jp token_exit 
                                    534 ; check for decimal number 	
      00A474 7B 01            [ 1]  535 0$:	ld a,(TCHAR,sp)
      00A476 CD 84 97         [ 4]  536 	call is_digit
      00A479 24 0C            [ 1]  537 	jrnc 3$
      00A47B A6 84            [ 1]  538 1$:	ld a,#TK_INTGR 
      00A47D F7               [ 1]  539 	ld (x),a 
      00A47E 5C               [ 1]  540 	incw x 
      00A47F 7B 01            [ 1]  541 	ld a,(TCHAR,sp)
      00A481 CD A3 3F         [ 4]  542 	call parse_integer 
      00A484 CC A5 E7         [ 2]  543 	jp token_exit 
      00A487                        544 3$: 
      002407                        545 	_case '(' bkslsh_tst 
      00A487 A6 28            [ 1]    1 	ld a,#'(' 
      00A489 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A48B 26 05            [ 1]    3 	jrne bkslsh_tst
      00A48D A6 07            [ 1]  546 	ld a,#TK_LPAREN
      00A48F CC A5 E3         [ 2]  547 	jp token_char   	
      00A492                        548 bkslsh_tst: ; character token 
      002412                        549 	_case '\',rparnt_tst
      00A492 A6 5C            [ 1]    1 	ld a,#'\' 
      00A494 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A496 26 16            [ 1]    3 	jrne rparnt_tst
      00A498 A6 03            [ 1]  550 	ld a,#TK_CHAR 
      00A49A F7               [ 1]  551 	ld (x),a 
      00A49B 5C               [ 1]  552 	incw x 
      00A49C 91 D6 01         [ 4]  553 	ld a,([in.w],y)
      00A49F F7               [ 1]  554 	ld (x),a 
      00A4A0 5C               [ 1]  555 	incw x
      00A4A1 90 93            [ 1]  556 	ldw y,x 	 
      00A4A3 72 5C 00 02      [ 1]  557 	inc in  
      00A4A7 5F               [ 1]  558 	clrw x 
      00A4A8 97               [ 1]  559 	ld xl,a 
      00A4A9 A6 03            [ 1]  560 	ld a,#TK_CHAR 
      00A4AB CC A5 E7         [ 2]  561 	jp token_exit 
      00A4AE                        562 rparnt_tst:		
      00242E                        563 	_case ')' colon_tst 
      00A4AE A6 29            [ 1]    1 	ld a,#')' 
      00A4B0 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A4B2 26 05            [ 1]    3 	jrne colon_tst
      00A4B4 A6 08            [ 1]  564 	ld a,#TK_RPAREN 
      00A4B6 CC A5 E3         [ 2]  565 	jp token_char
      00A4B9                        566 colon_tst:
      002439                        567 	_case ':' comma_tst 
      00A4B9 A6 3A            [ 1]    1 	ld a,#':' 
      00A4BB 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A4BD 26 05            [ 1]    3 	jrne comma_tst
      00A4BF A6 0B            [ 1]  568 	ld a,#TK_COLON 
      00A4C1 CC A5 E3         [ 2]  569 	jp token_char  
      00A4C4                        570 comma_tst:
      002444                        571 	_case COMMA sharp_tst 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A4C4 A6 2C            [ 1]    1 	ld a,#COMMA 
      00A4C6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A4C8 26 05            [ 1]    3 	jrne sharp_tst
      00A4CA A6 09            [ 1]  572 	ld a,#TK_COMMA
      00A4CC CC A5 E3         [ 2]  573 	jp token_char
      00A4CF                        574 sharp_tst:
      00244F                        575 	_case SHARP dash_tst 
      00A4CF A6 23            [ 1]    1 	ld a,#SHARP 
      00A4D1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A4D3 26 05            [ 1]    3 	jrne dash_tst
      00A4D5 A6 0A            [ 1]  576 	ld a,#TK_SHARP
      00A4D7 CC A5 E3         [ 2]  577 	jp token_char  	 	 
      00A4DA                        578 dash_tst: 	
      00245A                        579 	_case '-' at_tst 
      00A4DA A6 2D            [ 1]    1 	ld a,#'-' 
      00A4DC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A4DE 26 05            [ 1]    3 	jrne at_tst
      00A4E0 A6 11            [ 1]  580 	ld a,#TK_MINUS  
      00A4E2 CC A5 E3         [ 2]  581 	jp token_char 
      00A4E5                        582 at_tst:
      002465                        583 	_case '@' qmark_tst 
      00A4E5 A6 40            [ 1]    1 	ld a,#'@' 
      00A4E7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A4E9 26 05            [ 1]    3 	jrne qmark_tst
      00A4EB A6 06            [ 1]  584 	ld a,#TK_ARRAY 
      00A4ED CC A5 E3         [ 2]  585 	jp token_char
      00A4F0                        586 qmark_tst:
      002470                        587 	_case '?' tick_tst 
      00A4F0 A6 3F            [ 1]    1 	ld a,#'?' 
      00A4F2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A4F4 26 12            [ 1]    3 	jrne tick_tst
      00A4F6 A6 80            [ 1]  588 	ld a,#TK_CMD  
      00A4F8 F7               [ 1]  589 	ld (x),a 
      00A4F9 5C               [ 1]  590 	incw x 
      00A4FA 90 93            [ 1]  591 	ldw y,x 
      00A4FC AE 00 6E         [ 2]  592 	ldw x,#PRT_IDX 
      00A4FF 90 FF            [ 2]  593 	ldw (y),x 
      00A501 72 A9 00 02      [ 2]  594 	addw y,#2
      00A505 CC A5 E7         [ 2]  595 	jp token_exit
      00A508                        596 tick_tst: ; comment 
      002488                        597 	_case TICK plus_tst 
      00A508 A6 27            [ 1]    1 	ld a,#TICK 
      00A50A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A50C 26 35            [ 1]    3 	jrne plus_tst
      00A50E A6 80            [ 1]  598 	ld a,#TK_CMD
      00A510 F7               [ 1]  599 	ld (x),a 
      00A511 5C               [ 1]  600 	incw x
      00A512 90 AE 00 88      [ 2]  601 	ldw y,#REM_IDX
      00A516 FF               [ 2]  602 	ldw (x),y 
      00A517 1C 00 02         [ 2]  603 	addw x,#2  
      00A51A                        604 copy_comment:
      00A51A 90 AE 16 90      [ 2]  605 	ldw y,#tib 
      00A51E 72 B9 00 01      [ 2]  606 	addw y,in.w
      00A522 90 89            [ 2]  607 	pushw y
      00A524 CD 84 28         [ 4]  608 	call strcpy
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A527 72 F2 01         [ 2]  609     subw y,(1,sp)
      00A52A 90 9F            [ 1]  610 	ld a,yl 
      00A52C CB 00 02         [ 1]  611 	add a,in
      00A52F C7 00 02         [ 1]  612 	ld in,a 
      00A532 1F 01            [ 2]  613 	ldw (1,sp),x
      00A534 72 F9 01         [ 2]  614 	addw y,(1,sp)
      00A537 90 5C            [ 1]  615 	incw y 
      0024B9                        616 	_drop 2 
      00A539 5B 02            [ 2]    1     addw sp,#2 
      00A53B AE 00 88         [ 2]  617 	ldw x,#REM_IDX 
      00A53E A6 80            [ 1]  618 	ld a,#TK_CMD 
      00A540 CC A5 E7         [ 2]  619 	jp token_exit 
      00A543                        620 plus_tst:
      0024C3                        621 	_case '+' star_tst 
      00A543 A6 2B            [ 1]    1 	ld a,#'+' 
      00A545 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A547 26 05            [ 1]    3 	jrne star_tst
      00A549 A6 10            [ 1]  622 	ld a,#TK_PLUS  
      00A54B CC A5 E3         [ 2]  623 	jp token_char 
      00A54E                        624 star_tst:
      0024CE                        625 	_case '*' slash_tst 
      00A54E A6 2A            [ 1]    1 	ld a,#'*' 
      00A550 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A552 26 05            [ 1]    3 	jrne slash_tst
      00A554 A6 20            [ 1]  626 	ld a,#TK_MULT 
      00A556 CC A5 E3         [ 2]  627 	jp token_char 
      00A559                        628 slash_tst: 
      0024D9                        629 	_case '/' prcnt_tst 
      00A559 A6 2F            [ 1]    1 	ld a,#'/' 
      00A55B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A55D 26 05            [ 1]    3 	jrne prcnt_tst
      00A55F A6 21            [ 1]  630 	ld a,#TK_DIV 
      00A561 CC A5 E3         [ 2]  631 	jp token_char 
      00A564                        632 prcnt_tst:
      0024E4                        633 	_case '%' eql_tst 
      00A564 A6 25            [ 1]    1 	ld a,#'%' 
      00A566 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A568 26 05            [ 1]    3 	jrne eql_tst
      00A56A A6 22            [ 1]  634 	ld a,#TK_MOD
      00A56C CC A5 E3         [ 2]  635 	jp token_char  
                                    636 ; 1 or 2 character tokens 	
      00A56F                        637 eql_tst:
      0024EF                        638 	_case '=' gt_tst 		
      00A56F A6 3D            [ 1]    1 	ld a,#'=' 
      00A571 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A573 26 05            [ 1]    3 	jrne gt_tst
      00A575 A6 32            [ 1]  639 	ld a,#TK_EQUAL
      00A577 CC A5 E3         [ 2]  640 	jp token_char 
      00A57A                        641 gt_tst:
      0024FA                        642 	_case '>' lt_tst 
      00A57A A6 3E            [ 1]    1 	ld a,#'>' 
      00A57C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A57E 26 23            [ 1]    3 	jrne lt_tst
      00A580 A6 31            [ 1]  643 	ld a,#TK_GT 
      00A582 6B 02            [ 1]  644 	ld (ATTRIB,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A584 91 D6 01         [ 4]  645 	ld a,([in.w],y)
      00A587 72 5C 00 02      [ 1]  646 	inc in 
      00A58B A1 3D            [ 1]  647 	cp a,#'=
      00A58D 26 04            [ 1]  648 	jrne 1$
      00A58F A6 33            [ 1]  649 	ld a,#TK_GE 
      00A591 20 50            [ 2]  650 	jra token_char  
      00A593 A1 3C            [ 1]  651 1$: cp a,#'<
      00A595 26 04            [ 1]  652 	jrne 2$
      00A597 A6 35            [ 1]  653 	ld a,#TK_NE 
      00A599 20 48            [ 2]  654 	jra token_char 
      00A59B 72 5A 00 02      [ 1]  655 2$: dec in
      00A59F 7B 02            [ 1]  656 	ld a,(ATTRIB,sp)
      00A5A1 20 40            [ 2]  657 	jra token_char 	 
      00A5A3                        658 lt_tst:
      002523                        659 	_case '<' other
      00A5A3 A6 3C            [ 1]    1 	ld a,#'<' 
      00A5A5 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A5A7 26 23            [ 1]    3 	jrne other
      00A5A9 A6 34            [ 1]  660 	ld a,#TK_LT 
      00A5AB 6B 02            [ 1]  661 	ld (ATTRIB,sp),a 
      00A5AD 91 D6 01         [ 4]  662 	ld a,([in.w],y)
      00A5B0 72 5C 00 02      [ 1]  663 	inc in 
      00A5B4 A1 3D            [ 1]  664 	cp a,#'=
      00A5B6 26 04            [ 1]  665 	jrne 1$
      00A5B8 A6 36            [ 1]  666 	ld a,#TK_LE 
      00A5BA 20 27            [ 2]  667 	jra token_char 
      00A5BC A1 3E            [ 1]  668 1$: cp a,#'>
      00A5BE 26 04            [ 1]  669 	jrne 2$
      00A5C0 A6 35            [ 1]  670 	ld a,#TK_NE 
      00A5C2 20 1F            [ 2]  671 	jra token_char 
      00A5C4 72 5A 00 02      [ 1]  672 2$: dec in 
      00A5C8 7B 02            [ 1]  673 	ld a,(ATTRIB,sp)
      00A5CA 20 17            [ 2]  674 	jra token_char 	
      00A5CC                        675 other: ; not a special character 	 
      00A5CC 7B 01            [ 1]  676 	ld a,(TCHAR,sp)
      00A5CE CD 84 86         [ 4]  677 	call is_alpha 
      00A5D1 25 03            [ 1]  678 	jrc 30$ 
      00A5D3 CC 87 A6         [ 2]  679 	jp syntax_error 
      00A5D6                        680 30$: 
      00A5D6 CD A3 C6         [ 4]  681 	call parse_keyword
      00A5D9 A3 90 40         [ 2]  682 	cpw x,#remark 
      00A5DC 26 09            [ 1]  683 	jrne token_exit 
      00A5DE 90 93            [ 1]  684 	ldw y,x 
      00A5E0 CC A5 1A         [ 2]  685 	jp copy_comment 
      00A5E3                        686 token_char:
      00A5E3 F7               [ 1]  687 	ld (x),a 
      00A5E4 5C               [ 1]  688 	incw x
      00A5E5 90 93            [ 1]  689 	ldw y,x 
      00A5E7                        690 token_exit:
      002567                        691 	_drop VSIZE 
      00A5E7 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A5E9 81               [ 4]  692 	ret
                                    693 
                                    694 
                                    695 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                    696 ; create token list fromm text line 
                                    697 ; save this list in pad buffer 
                                    698 ;  compiled line format: 
                                    699 ;    line_no  2 bytes {0...32767}
                                    700 ;    count    1 byte  
                                    701 ;    tokens   variable length 
                                    702 ;   
                                    703 ; input:
                                    704 ;   none
                                    705 ; modified variables:
                                    706 ;   basicptr     token list buffer address 
                                    707 ;   in.w  		 3|count, i.e. index in buffer
                                    708 ;   count        length of line | 0  
                                    709 ;-----------------------------------
                           000001   710 	XSAVE=1
                           000002   711 	VSIZE=2
      00A5EA                        712 compile::
      00256A                        713 	_vars VSIZE 
      00A5EA 52 02            [ 2]    1     sub sp,#VSIZE 
      00A5EC 55 00 1A 00 05   [ 1]  714 	mov basicptr,txtbgn
      00A5F1 72 1A 00 21      [ 1]  715 	bset flags,#FCOMP 
      00A5F5 A6 00            [ 1]  716 	ld a,#0
      00A5F7 AE 00 00         [ 2]  717 	ldw x,#0
      00A5FA CF 16 E0         [ 2]  718 	ldw pad,x ; destination buffer 
      00A5FD C7 16 E2         [ 1]  719 	ld pad+2,a ; count 
      00A600 AE 16 E3         [ 2]  720 	ldw x,#pad+3
      00A603 72 5F 00 02      [ 1]  721 	clr in 
      00A607 CD A4 2B         [ 4]  722 	call get_token
      00A60A A1 84            [ 1]  723 	cp a,#TK_INTGR
      00A60C 26 11            [ 1]  724 	jrne 2$
      00A60E A3 00 01         [ 2]  725 	cpw x,#1 
      00A611 2A 05            [ 1]  726 	jrpl 1$
      00A613 A6 0A            [ 1]  727 	ld a,#ERR_BAD_VALUE
      00A615 CC 87 A8         [ 2]  728 	jp tb_error
      00A618 CF 16 E0         [ 2]  729 1$:	ldw pad,x 
      00A61B 90 AE 16 E3      [ 2]  730 	ldw y,#pad+3 
      00A61F 90 A3 17 60      [ 2]  731 2$:	cpw y,#stack_full 
      00A623 25 05            [ 1]  732 	jrult 3$
      00A625 A6 0F            [ 1]  733 	ld a,#ERR_BUF_FULL 
      00A627 CC 87 A8         [ 2]  734 	jp tb_error 
      00A62A                        735 3$:	
      00A62A 93               [ 1]  736 	ldw x,y 
      00A62B CD A4 2B         [ 4]  737 	call get_token 
      00A62E A1 00            [ 1]  738 	cp a,#TK_NONE 
      00A630 26 ED            [ 1]  739 	jrne 2$ 
                                    740 ; compilation completed  
      00A632 72 A2 16 E0      [ 2]  741 	subw y,#pad
      00A636 90 9F            [ 1]  742     ld a,yl
      00A638 AE 16 E0         [ 2]  743 	ldw x,#pad 
      00A63B CF 00 18         [ 2]  744 	ldw ptr16,x 
      00A63E E7 02            [ 1]  745 	ld (2,x),a 
      00A640 FE               [ 2]  746 	ldw x,(x)
      00A641 27 09            [ 1]  747 	jreq 10$
      00A643 CD A2 78         [ 4]  748 	call insert_line
      00A646 72 5F 00 04      [ 1]  749 	clr  count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A64A 20 0F            [ 2]  750 	jra  11$ 
      00A64C                        751 10$: ; line# is zero 
      00A64C CE 00 18         [ 2]  752 	ldw x,ptr16  
      00A64F CF 00 05         [ 2]  753 	ldw basicptr,x 
      00A652 E6 02            [ 1]  754 	ld a,(2,x)
      00A654 C7 00 04         [ 1]  755 	ld count,a 
      00A657 35 03 00 02      [ 1]  756 	mov in,#3 
      00A65B                        757 11$:
      0025DB                        758 	_drop VSIZE 
      00A65B 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A65D 72 1B 00 21      [ 1]  759 	bres flags,#FCOMP 
      00A661 81               [ 4]  760 	ret 
                                    761 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
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
                                     19 ;---------------------------------------
                                     20 ;  decompiler
                                     21 ;  decompile bytecode to text source
                                     22 ;  used by command LIST
                                     23 ;---------------------------------------
                                     24 
                                     25     .module DECOMPILER 
                                     26 
                                     27 ;    .nlist
                                     28 ;	.include "inc/nucleo_8s208.inc"
                                     29 ;	.include "inc/stm8s208.inc"
                                     30 ;	.include "inc/ascii.inc"
                                     31 ;	.include "inc/gen_macros.inc" 
                                     32 ;	.include "tbi_macros.inc" 
                                     33 ;	.include "cmd_index.inc"
                                     34     .list 
                                     35 
                                     36 
                                     37     .area  CODE 
                                     38 
                                     39 ;-------------------------
                                     40 ; copy command name to buffer  
                                     41 ; input:
                                     42 ;   X 	name address 
                                     43 ;   Y   destination buffer 
                                     44 ; output:
                                     45 ;   Y   point after name  
                                     46 ;--------------------------
      00A662                         47 cpy_cmd_name:
      00A662 F6               [ 1]   48 	ld a,(x)
      00A663 5C               [ 1]   49 	incw x
      00A664 A4 0F            [ 1]   50 	and a,#15  
      00A666 88               [ 1]   51 	push a 
      00A667 0D 01            [ 1]   52     tnz (1,sp) 
      00A669 27 0A            [ 1]   53 	jreq 9$
      00A66B F6               [ 1]   54 1$:	ld a,(x)
      00A66C 90 F7            [ 1]   55 	ld (y),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A66E 5C               [ 1]   56 	incw x
      00A66F 90 5C            [ 1]   57 	incw y 
      00A671 0A 01            [ 1]   58 	dec (1,sp)	 
      00A673 26 F6            [ 1]   59 	jrne 1$
      00A675 84               [ 1]   60 9$: pop a 
      00A676 81               [ 4]   61 	ret	
                                     62 
                                     63 ;--------------------------
                                     64 ; add a space after letter or 
                                     65 ; digit.
                                     66 ; input:
                                     67 ;   Y     pointer to buffer 
                                     68 ; output:
                                     69 ;   Y    moved to end 
                                     70 ;--------------------------
      00A677                         71 add_space:
      00A677 90 5A            [ 2]   72 	decw y 
      00A679 90 F6            [ 1]   73 	ld a,(y)
      00A67B 90 5C            [ 1]   74 	incw y
      00A67D CD 84 A0         [ 4]   75 	call is_alnum 
      00A680 24 06            [ 1]   76 	jrnc 1$
      00A682 A6 20            [ 1]   77 	ld a,#SPACE 
      00A684 90 F7            [ 1]   78 	ld (y),a 
      00A686 90 5C            [ 1]   79 	incw y 
      00A688 81               [ 4]   80 1$: ret 
                                     81 
                                     82 ;--------------------------
                                     83 ;  align text in buffer 
                                     84 ;  to tab_width padding 
                                     85 ;  left with  SPACE 
                                     86 ; input:
                                     87 ;   X      str*
                                     88 ;   A      str_length 
                                     89 ; output:
                                     90 ;   X      ajusted
                                     91 ;--------------------------
      00A689                         92 right_align::
      00A689 88               [ 1]   93 	push a 
      00A68A 7B 01            [ 1]   94 0$: ld a,(1,sp)
      00A68C C1 00 22         [ 1]   95 	cp a,tab_width 
      00A68F 2A 08            [ 1]   96 	jrpl 1$
      00A691 A6 20            [ 1]   97 	ld a,#SPACE 
      00A693 5A               [ 2]   98 	decw x
      00A694 F7               [ 1]   99 	ld (x),a  
      00A695 0C 01            [ 1]  100 	inc (1,sp)
      00A697 20 F1            [ 2]  101 	jra 0$ 
      00A699 84               [ 1]  102 1$: pop a 	
      00A69A 81               [ 4]  103 	ret 
                                    104 
                                    105 ;--------------------------
                                    106 ; print TK_QSTR
                                    107 ; converting control character
                                    108 ; to backslash sequence
                                    109 ; input:
                                    110 ;   X        char *
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    111 ;   Y        dest. buffer 
                                    112 ; output:
                                    113 ;   X        moved forward 
                                    114 ;   Y        moved forward 
                                    115 ;-----------------------------
      00A69B                        116 cpy_quote:
      00A69B A6 22            [ 1]  117 	ld a,#'"
      00A69D 90 F7            [ 1]  118 	ld (y),a 
      00A69F 90 5C            [ 1]  119 	incw y 
      00A6A1 F6               [ 1]  120 1$:	ld a,(x)
      00A6A2 27 30            [ 1]  121 	jreq 9$
      00A6A4 5C               [ 1]  122 	incw x 
      00A6A5 A1 20            [ 1]  123 	cp a,#SPACE 
      00A6A7 25 0E            [ 1]  124 	jrult 3$
      00A6A9 90 F7            [ 1]  125 	ld (y),a
      00A6AB 90 5C            [ 1]  126 	incw y 
      00A6AD A1 5C            [ 1]  127 	cp a,#'\ 
      00A6AF 26 F0            [ 1]  128 	jrne 1$ 
      00A6B1                        129 2$:
      00A6B1 90 F7            [ 1]  130 	ld (y),a
      00A6B3 90 5C            [ 1]  131 	incw y  
      00A6B5 20 EA            [ 2]  132 	jra 1$
      00A6B7 88               [ 1]  133 3$: push a 
      00A6B8 A6 5C            [ 1]  134 	ld a,#'\
      00A6BA 90 F7            [ 1]  135 	ld (y),a 
      00A6BC 90 5C            [ 1]  136 	incw y  
      00A6BE 84               [ 1]  137 	pop a 
      00A6BF A0 07            [ 1]  138 	sub a,#7
      00A6C1 C7 00 0E         [ 1]  139 	ld acc8,a 
      00A6C4 72 5F 00 0D      [ 1]  140 	clr acc16
      00A6C8 89               [ 2]  141 	pushw x
      00A6C9 AE A3 37         [ 2]  142 	ldw x,#escaped 
      00A6CC 72 BB 00 0D      [ 2]  143 	addw x,acc16 
      00A6D0 F6               [ 1]  144 	ld a,(x)
      00A6D1 85               [ 2]  145 	popw x
      00A6D2 20 DD            [ 2]  146 	jra 2$
      00A6D4 A6 22            [ 1]  147 9$: ld a,#'"
      00A6D6 90 F7            [ 1]  148 	ld (y),a 
      00A6D8 90 5C            [ 1]  149 	incw y  
      00A6DA 5C               [ 1]  150 	incw x 
      00A6DB 81               [ 4]  151 	ret
                                    152 
                                    153 ;--------------------------
                                    154 ; return variable name 
                                    155 ; from its address.
                                    156 ; input:
                                    157 ;   X    variable address
                                    158 ; output:
                                    159 ;   A     variable letter
                                    160 ;--------------------------
      00A6DC                        161 var_name::
      00A6DC 1D 00 31         [ 2]  162 		subw x,#vars 
      00A6DF 9F               [ 1]  163 		ld a,xl 
      00A6E0 44               [ 1]  164 		srl a 
      00A6E1 AB 41            [ 1]  165 		add a,#'A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A6E3 81               [ 4]  166 		ret 
                                    167 
                                    168 ;-----------------------------
                                    169 ; return cmd  idx from its 
                                    170 ; code address 
                                    171 ; input:
                                    172 ;   X      code address 
                                    173 ; output:
                                    174 ;   X      cmd_idx
                                    175 ;-----------------------------
      00A6E4                        176 get_cmd_idx:
      00A6E4 90 89            [ 2]  177 	pushw y
      00A6E6 90 AE 9E 18      [ 2]  178 	ldw y,#code_addr 
      00A6EA 90 CF 00 18      [ 2]  179 	ldw ptr16,y 
      00A6EE 90 5F            [ 1]  180 	clrw y 
      00A6F0 91 D3 18         [ 5]  181 1$:	cpw x,([ptr16],y)
      00A6F3 27 0C            [ 1]  182 	jreq 3$ 
      00A6F5 90 5C            [ 1]  183 	incw y 
      00A6F7 91 D6 18         [ 4]  184 	ld a,([ptr16],y)
      00A6FA 90 5C            [ 1]  185 	incw y
      00A6FC 91 DA 18         [ 4]  186 	or a,([ptr16],y)	
      00A6FF 26 EF            [ 1]  187 	jrne 1$
      00A701 93               [ 1]  188 3$: ldw x,y 
      00A702 90 85            [ 2]  189 	popw y 
      00A704 81               [ 4]  190 	ret
                                    191 
                                    192 ;-------------------------------------
                                    193 ; decompile tokens list 
                                    194 ; to original text line 
                                    195 ; input:
                                    196 ;   [basicptr]  pointer at line 
                                    197 ;   Y           destination buffer
                                    198 ; output:
                                    199 ;   A           length 
                                    200 ;   Y           after string  
                                    201 ;------------------------------------
                           000001   202 	BASE_SAV=1
                           000002   203 	WIDTH_SAV=2
                           000003   204 	STR=3
                           000004   205 	VSIZE=4 
      00A705                        206 decompile::
      002685                        207 	_vars VSIZE
      00A705 52 04            [ 2]    1     sub sp,#VSIZE 
      00A707 C6 00 0B         [ 1]  208 	ld a,base
      00A70A 6B 01            [ 1]  209 	ld (BASE_SAV,sp),a  
      00A70C C6 00 22         [ 1]  210 	ld a,tab_width 
      00A70F 6B 02            [ 1]  211 	ld (WIDTH_SAV,sp),a 
      00A711 17 03            [ 2]  212 	ldw (STR,sp),y   
      00A713 72 CE 00 05      [ 5]  213 	ldw x,[basicptr] ; line number 
      00A717 35 0A 00 0B      [ 1]  214 	mov base,#10
      00A71B 35 05 00 22      [ 1]  215 	mov tab_width,#5
      00A71F 72 5F 00 0C      [ 1]  216 	clr acc24 
      00A723 CF 00 0D         [ 2]  217 	ldw acc16,x
      00A726 CD 89 0C         [ 4]  218 	call itoa  
      00A729 CD A6 89         [ 4]  219 	call right_align 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00A72C 88               [ 1]  220 	push a 
      00A72D 90 93            [ 1]  221 1$:	ldw y,x ; source
      00A72F 1E 04            [ 2]  222 	ldw x,(STR+1,sp) ; destination
      00A731 CD 84 28         [ 4]  223 	call strcpy 
      00A734 90 5F            [ 1]  224 	clrw y 
      00A736 84               [ 1]  225 	pop a 
      00A737 90 97            [ 1]  226 	ld yl,a 
      00A739 72 F9 03         [ 2]  227 	addw y,(STR,sp)
      00A73C A6 20            [ 1]  228 	ld a,#SPACE 
      00A73E 90 F7            [ 1]  229 	ld (y),a 
      00A740 90 5C            [ 1]  230 	incw y 
      00A742 72 5F 00 22      [ 1]  231 	clr tab_width
      00A746 AE 00 03         [ 2]  232 	ldw x,#3
      00A749 CF 00 01         [ 2]  233 	ldw in.w,x 
      00A74C                        234 decomp_loop:
      00A74C 90 89            [ 2]  235 	pushw y
      00A74E CD 88 95         [ 4]  236 	call next_token 
      00A751 90 85            [ 2]  237 	popw y 
      00A753 4D               [ 1]  238 	tnz a  
      00A754 26 03            [ 1]  239 	jrne 1$
      00A756 CC A8 38         [ 2]  240 	jp 20$
      00A759 2A 75            [ 1]  241 1$:	jrpl 6$
                                    242 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      00A75B A1 85            [ 1]  243 	cp a,#TK_VAR 
      00A75D 26 0C            [ 1]  244 	jrne 3$
                                    245 ;; TK_VAR 
      00A75F CD A6 77         [ 4]  246 	call add_space  
      00A762 CD A6 DC         [ 4]  247 	call var_name
      00A765 90 F7            [ 1]  248 	ld (y),a 
      00A767 90 5C            [ 1]  249 	incw y  
      00A769 20 E1            [ 2]  250 	jra decomp_loop
      00A76B                        251 3$:
      00A76B A1 84            [ 1]  252 	cp a,#TK_INTGR
      00A76D 26 22            [ 1]  253 	jrne 4$
                                    254 ;; TK_INTGR
      00A76F CD A6 77         [ 4]  255 	call add_space
      00A772 72 5F 00 0C      [ 1]  256 	clr acc24 
      00A776 CF 00 0D         [ 2]  257 	ldw acc16,x 
      00A779 90 89            [ 2]  258 	pushw y 
      00A77B CD 89 0C         [ 4]  259 	call itoa  
      00A77E 16 01            [ 2]  260 	ldw y,(1,sp) 
      00A780 88               [ 1]  261 	push a 
      00A781 51               [ 1]  262 	exgw x,y 
      00A782 CD 84 28         [ 4]  263 	call strcpy 
      00A785 90 5F            [ 1]  264 	clrw y
      00A787 84               [ 1]  265 	pop a  
      00A788 90 97            [ 1]  266 	ld yl,a 
      00A78A 72 F9 01         [ 2]  267 	addw y,(1,sp)
      00270D                        268 	_drop 2 
      00A78D 5B 02            [ 2]    1     addw sp,#2 
      00A78F 20 BB            [ 2]  269 	jra decomp_loop
                                    270 ;; dictionary keyword 
      00A791                        271 4$:	
      00A791 CD A6 E4         [ 4]  272 	call get_cmd_idx 
      00A794 A3 00 88         [ 2]  273 	cpw x,#REM_IDX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A797 26 22            [ 1]  274 	jrne 5$
      00A799 CE 00 05         [ 2]  275 	ldw x,basicptr 
                                    276 ; copy comment to buffer 
      00A79C CD A6 77         [ 4]  277 	call add_space
      00A79F A6 27            [ 1]  278 	ld a,#''
      00A7A1 90 F7            [ 1]  279 	ld (y),a 
      00A7A3 90 5C            [ 1]  280 	incw y 
      00A7A5                        281 41$:
      00A7A5 72 D6 00 01      [ 4]  282 	ld a,([in.w],x)
      00A7A9 72 5C 00 02      [ 1]  283 	inc in  
      00A7AD 90 F7            [ 1]  284 	ld (y),a 
      00A7AF 90 5C            [ 1]  285 	incw y 
      00A7B1 C6 00 02         [ 1]  286 	ld a,in 
      00A7B4 C1 00 04         [ 1]  287 	cp a,count 
      00A7B7 2B EC            [ 1]  288 	jrmi 41$
      00A7B9 20 7D            [ 2]  289 	jra 20$  
      00A7BB A3 00 4C         [ 2]  290 5$: cpw x,#LET_IDX 
      00A7BE 27 8C            [ 1]  291 	jreq decomp_loop ; down display LET 	
                                    292 ; insert command name 
      00A7C0 CD A6 77         [ 4]  293 	call add_space  
      00A7C3 90 89            [ 2]  294 	pushw y
      00A7C5 CD A8 73         [ 4]  295 	call cmd_name
      00A7C8 90 85            [ 2]  296 	popw y 
      00A7CA CD A6 62         [ 4]  297 	call cpy_cmd_name
      00A7CD CC A7 4C         [ 2]  298 	jp decomp_loop 
      00A7D0                        299 6$:
      00A7D0 A1 02            [ 1]  300 	cp a,#TK_QSTR 
      00A7D2 26 06            [ 1]  301 	jrne 7$
                                    302 ;; TK_QSTR
      00A7D4 CD A6 9B         [ 4]  303 	call cpy_quote  
      00A7D7 CC A7 4C         [ 2]  304 	jp decomp_loop
      00A7DA                        305 7$:
      00A7DA A1 03            [ 1]  306 	cp a,#TK_CHAR 
      00A7DC 26 0E            [ 1]  307 	jrne 8$
                                    308 ;; TK_CHAR 
      00A7DE A6 5C            [ 1]  309 	ld a,#'\ 
      00A7E0 90 F7            [ 1]  310 	ld (y),a 
      00A7E2 90 5C            [ 1]  311 	incw y 
      00A7E4 9F               [ 1]  312 	ld a,xl 
      00A7E5 90 F7            [ 1]  313 	ld (y),a 
      00A7E7 90 5C            [ 1]  314 	incw y 
      00A7E9 CC A7 4C         [ 2]  315 	jp decomp_loop
      00A7EC A1 0B            [ 1]  316 8$: cp a,#TK_COLON 
      00A7EE 26 09            [ 1]  317 	jrne 9$
      00A7F0 A6 3A            [ 1]  318 	ld a,#':
      00A7F2                        319 81$:
      00A7F2 90 F7            [ 1]  320 	ld (y),a 
      00A7F4 90 5C            [ 1]  321 	incw y 
      00A7F6                        322 82$:
      00A7F6 CC A7 4C         [ 2]  323 	jp decomp_loop
      00A7F9                        324 9$: 
      00A7F9 A1 0A            [ 1]  325 	cp a,#TK_SHARP
      00A7FB 22 0A            [ 1]  326 	jrugt 10$ 
      00A7FD A0 06            [ 1]  327 	sub a,#TK_ARRAY 
      00A7FF 5F               [ 1]  328 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A800 97               [ 1]  329 	ld xl,a
      00A801 1C A8 4E         [ 2]  330 	addw x,#single_char 
      00A804 F6               [ 1]  331 	ld a,(x)
      00A805 20 EB            [ 2]  332 	jra 81$ 
      00A807                        333 10$: 
      00A807 A1 11            [ 1]  334 	cp a,#TK_MINUS 
      00A809 22 0A            [ 1]  335 	jrugt 11$
      00A80B A0 10            [ 1]  336 	sub a,#TK_PLUS 
      00A80D 5F               [ 1]  337 	clrw x 
      00A80E 97               [ 1]  338 	ld xl,a 
      00A80F 1C A8 53         [ 2]  339 	addw x,#add_char 
      00A812 F6               [ 1]  340 	ld a,(x)
      00A813 20 DD            [ 2]  341 	jra 81$
      00A815                        342 11$:
      00A815 A1 22            [ 1]  343     cp a,#TK_MOD 
      00A817 22 0A            [ 1]  344 	jrugt 12$
      00A819 A0 20            [ 1]  345 	sub a,#TK_MULT
      00A81B 5F               [ 1]  346 	clrw x 
      00A81C 97               [ 1]  347 	ld xl,a 
      00A81D 1C A8 55         [ 2]  348 	addw x,#mul_char
      00A820 F6               [ 1]  349 	ld a,(x)
      00A821 20 CF            [ 2]  350 	jra 81$
      00A823                        351 12$:
      00A823 A0 31            [ 1]  352 	sub a,#TK_GT  
      00A825 48               [ 1]  353 	sll a 
      00A826 5F               [ 1]  354 	clrw x 
      00A827 97               [ 1]  355 	ld xl,a 
      00A828 1C A8 58         [ 2]  356 	addw x,#relop_str 
      00A82B FE               [ 2]  357 	ldw x,(x)
      00A82C F6               [ 1]  358 	ld a,(x)
      00A82D 5C               [ 1]  359 	incw x 
      00A82E 90 F7            [ 1]  360 	ld (y),a
      00A830 90 5C            [ 1]  361 	incw y 
      00A832 F6               [ 1]  362 	ld a,(x)
      00A833 26 BD            [ 1]  363 	jrne 81$
      00A835 CC A7 4C         [ 2]  364 	jp decomp_loop 
      00A838                        365 20$: 
      00A838 90 7F            [ 1]  366 	clr (y)
      00A83A 1E 03            [ 2]  367 	ldw x,(STR,sp)
      00A83C 7B 01            [ 1]  368 	ld a,(BASE_SAV,sp)
      00A83E C7 00 0B         [ 1]  369 	ld base,a 
      00A841 7B 02            [ 1]  370 	ld a,(WIDTH_SAV,sp)
      00A843 C7 00 22         [ 1]  371 	ld tab_width,a
      00A846 72 F2 03         [ 2]  372 	subw y,(STR,sp) 
      00A849 90 9F            [ 1]  373 	ld a,yl 
      0027CB                        374 	_drop VSIZE 
      00A84B 5B 04            [ 2]    1     addw sp,#VSIZE 
      00A84D 81               [ 4]  375 	ret 
                                    376 
      00A84E 40 28 29 2C 23         377 single_char: .byte '@','(',')',',','#'
      00A853 2B 2D                  378 add_char: .byte '+','-'
      00A855 2A 2F 25               379 mul_char: .byte '*','/','%'
      00A858 A8 64 A8 66 A8 68 A8   380 relop_str: .word gt,equal,ge,lt,le,ne 
             6B A8 6D A8 70
      00A864 3E 00                  381 gt: .asciz ">"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A866 3D 00                  382 equal: .asciz "="
      00A868 3E 3D 00               383 ge: .asciz ">="
      00A86B 3C 00                  384 lt: .asciz "<"
      00A86D 3C 3D 00               385 le: .asciz "<="
      00A870 3C 3E 00               386 ne:  .asciz "<>"
                                    387 
                                    388 ;----------------------------------
                                    389 ; search in kword_dict name
                                    390 ; from its execution address 
                                    391 ; input:
                                    392 ;   X       	cmd_index 
                                    393 ; output:
                                    394 ;   X 			cstr*  | 0 
                                    395 ;--------------------------------
                           000001   396 	CMDX=1 
                           000003   397 	LINK=3 
                           000004   398 	VSIZE=4
      00A873                        399 cmd_name:
      0027F3                        400 	_vars VSIZE 
      00A873 52 04            [ 2]    1     sub sp,#VSIZE 
      00A875 72 5F 00 0D      [ 1]  401 	clr acc16 
      00A879 1F 01            [ 2]  402 	ldw (CMDX,sp),x  
      00A87B AE 9E 10         [ 2]  403 	ldw x,#kword_dict	
      00A87E 1F 03            [ 2]  404 1$:	ldw (LINK,sp),x
      00A880 E6 02            [ 1]  405 	ld a,(2,x)
      00A882 A4 0F            [ 1]  406 	and a,#15 
      00A884 C7 00 0E         [ 1]  407 	ld acc8,a 
      00A887 1C 00 03         [ 2]  408 	addw x,#3
      00A88A 72 BB 00 0D      [ 2]  409 	addw x,acc16
      00A88E FE               [ 2]  410 	ldw x,(x) ; command index  
      00A88F 13 01            [ 2]  411 	cpw x,(CMDX,sp)
      00A891 27 0A            [ 1]  412 	jreq 2$
      00A893 1E 03            [ 2]  413 	ldw x,(LINK,sp)
      00A895 FE               [ 2]  414 	ldw x,(x) 
      00A896 1D 00 02         [ 2]  415 	subw x,#2  
      00A899 26 E3            [ 1]  416 	jrne 1$
      00A89B 20 05            [ 2]  417 	jra 9$
      00A89D 1E 03            [ 2]  418 2$: ldw x,(LINK,sp)
      00A89F 1C 00 02         [ 2]  419 	addw x,#2 	
      002822                        420 9$:	_drop VSIZE
      00A8A2 5B 04            [ 2]    1     addw sp,#VSIZE 
      00A8A4 81               [ 4]  421 	ret
                                    422 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
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
                                     19     .module APP_SPACE
                                     20 
                                     21 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     22 ;;  application space 
                                     23 ;;  *** must be last to be linked ***
                                     24 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     25 
                                     26     .area CODE 
      00A900                         27 	.bndry 128 ; align on FLASH block.
                                     28 ; space for user application  
      00A900                         29 app_space::
      00A900 42 43                   30 app_sign: .ascii "BC"  ; signature 
      00A902 00 29                   31 app_size:  .word 41
      00A904                         32 app: 
                                     33 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     34 ;;  BASIC code demo 'BLINK.BAS' 
                                     35 ;; 10 do btogl $500a,32 pause 250 until qkey bres $500a,32 end 
                                     36 ;; byte code generated by compiler.
                                     37 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00A904 00 0A 29 80 00 26 80    38 .byte 0,10,41,128,0,38,128,0,20,132,80,10,9,132,0,32,128,0,98,132
             00 14 84 50 0A 09 84
             00 20 80 00 62 84
      00A918 00 FA 80 00 B4 81 00    39 .byte 0,250,128,0,180,129,0,130,128,0,14,132,80,10,9,132,0,32,128,0,46,0
             82 80 00 0E 84 50 0A
             09 84 00 20 80 00 2E
             00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        001D92 R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   5 ADCON      001D88 R
    ADCON_ID=  000002     |   5 ADCREAD    001D7C R   |     ADCREAD_=  000004 
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
  5 AND        001D74 R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  5 ASC        001D6C R   |     ASC_IDX =  000008     |     ATTRIB  =  000002 
    AUTORUN_=  004000     |   5 AWU        001D64 R   |   5 AWUHandl   000001 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_CSR_=  000004 
    AWU_IDX =  00000A     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |     BASE    =  000001 
    BASE_SAV=  000001     |     BCNT    =  000001     |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |   5 BIT        001D5C R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000C 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   5 BRES       001D53 R   |     BRES_IDX=  00000E 
    BS      =  000008     |     BSAVE   =  000001     |   5 BSET       001D4A R
    BSET_IDX=  000010     |     BSIZE   =  000005     |   5 BTEST      001D40 R
    BTEST_ID=  000012     |   5 BTOGL      001D36 R   |     BTOGL_ID=  000014 
    BTW     =  000001     |   5 BYE        001D2E R   |     BYE_IDX =  000016 
    C       =  000001     |     CAN     =  000018     |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CCOMMA  =  000001 
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELL_SIZ=  000002     |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       001D25 R
    CHAR_IDX=  000018     |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

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
    CLK_SWR_=  0000D2     |     CMDX    =  000001     |     CMD_END =  000002 
    CNT     =  000006     |     CNTR    =  000003     |     COMMA   =  00002C 
    CPOS    =  000003     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   5 CRH        001D1D R   |     CRH_IDX =  00001A 
  5 CRL        001D15 R   |     CRL_IDX =  00001C     |     CTRL_A  =  000001 
    CTRL_B  =  000002     |     CTRL_C  =  000003     |     CTRL_D  =  000004 
    CTRL_E  =  000005     |     CTRL_F  =  000006     |     CTRL_G  =  000007 
    CTRL_H  =  000008     |     CTRL_I  =  000009     |     CTRL_J  =  00000A 
    CTRL_K  =  00000B     |     CTRL_L  =  00000C     |     CTRL_M  =  00000D 
    CTRL_N  =  00000E     |     CTRL_O  =  00000F     |     CTRL_P  =  000010 
    CTRL_Q  =  000011     |     CTRL_R  =  000012     |     CTRL_S  =  000013 
    CTRL_T  =  000014     |     CTRL_U  =  000015     |     CTRL_V  =  000016 
    CTRL_W  =  000017     |     CTRL_X  =  000018     |     CTRL_Y  =  000019 
    CTRL_Z  =  00001A     |     CTXT_SIZ=  000004     |     CTX_BPTR=  000001 
    CTX_COUN=  000004     |     CTX_IN  =  000003     |     CURR    =  000002 
    CVAR    =  000007     |     CX_BPTR =  000001     |     CX_CNT  =  000004 
    CX_IN   =  000003     |   5 DATA       001D0C R   |   5 DATALN     001D01 R
    DATALN_I=  000020     |     DATA_IDX=  00001E     |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
    DBL     =  000003     |     DBLDIVDN=  000006     |     DBLHI   =  000001 
    DBLLO   =  000003     |     DBL_SIZE=  000004     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  5 DDR        001CF9 R   |     DDR_IDX =  000022     |     DEBUG   =  000000 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |     DEBUG_PR=  000001 
  5 DEC        001CF1 R   |     DEC_IDX =  000024     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |     DIVDNDHI=  00000B 
    DIVDNDLO=  00000D     |     DIVISOR =  000001     |     DIVISR  =  000007 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   5 DO         001CEA R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  000026     |   5 DREAD      001CE0 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

    DREAD_ID=  000028     |   5 DWRITE     001CD5 R   |     DWRITE_I=  00002A 
  5 EEPROM     001CCA R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002C     |     EEPROM_S=  000800     |     EM      =  000019 
  5 END        001CC2 R   |     END_IDX =  00002E     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   5 ERASE      001CB8 R
    ERASE_ID=  000030     |     ERR_BAD_=  00000A     |     ERR_BUF_=  00000F 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FAUTORUN=  000006     |     FBREAK  =  000004 
    FCOMP   =  000005     |   5 FCPU       001CAF R   |     FCPU_IDX=  000032 
    FF      =  00000C     |     FHSE    =  7A1200     |     FHSI    =  F42400 
    FIRST   =  000001     |     FIRST_DA=  000006     |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |   5 FOR        001CA7 R   |     FOR_IDX =  000034 
  5 FREE       001C9E R   |     FREE_IDX=  000096     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   5 GOSUB      001C94 R
    GOSUB_ID=  000036     |   5 GOTO       001C8B R   |     GOTO_IDX=  000038 
  5 GPIO       001C82 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_IDX=  00003A     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   5 HEX        001C7A R   |     HEX_IDX =  00003C 
    HOME    =  000082     |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

    I2C_SR1_=  000001     |     I2C_SR1_=  000002     |     I2C_SR1_=  000006 
    I2C_SR1_=  000000     |     I2C_SR1_=  000004     |     I2C_SR1_=  000007 
    I2C_SR2 =  005218     |     I2C_SR2_=  000002     |     I2C_SR2_=  000001 
    I2C_SR2_=  000000     |     I2C_SR2_=  000003     |     I2C_SR2_=  000005 
    I2C_SR3 =  005219     |     I2C_SR3_=  000001     |     I2C_SR3_=  000007 
    I2C_SR3_=  000004     |     I2C_SR3_=  000000     |     I2C_SR3_=  000002 
    I2C_TRIS=  00521D     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        001C72 R
    IDR_IDX =  00003E     |   5 IF         001C6B R   |     IF_IDX  =  000040 
    IN      =  000005     |     INCR    =  000001     |     INP     =  000000 
  5 INPUT      001C61 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_ID=  000042     |     INPUT_PU=  000001 
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
    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  008050     |     INT_VECT=  00804C     |     INT_VECT=  00805C 
    INT_VECT=  008058     |   5 INVERT     001C56 R   |     INVERT_I=  000044 
    INW     =  000009     |     IPOS    =  000001     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   5 IWDGEN     001C4B R   |     IWDGEN_I=  000046 
  5 IWDGREF    001C3F R   |     IWDGREF_=  000048     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  5 KEY        001C37 R   |     KEY_END =  000083     |     KEY_IDX =  00004A 
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  5 LET        001C2F R   |     LET_IDX =  00004C     |     LF      =  00000A 
    LIMIT   =  000005     |     LINENO  =  000005     |     LINK    =  000003 
  5 LIST       001C26 R   |     LIST_IDX=  00004E     |     LL      =  000001 
    LLEN    =  000007     |     LL_HB   =  000001     |     LN_PTR  =  000005 
  5 LOG        001C1E R   |     LOG_IDX =  000050     |   5 LSHIFT     001C13 R
    LSHIFT_I=  000052     |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000002 
  5 MULDIV     001C08 R   |     MULDIV_I=  000054     |     MULOP   =  000003 
    N1      =  000001     |     N2      =  000003     |     NAFR    =  004804 
    NAK     =  000015     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        001C00 R   |     NEW_IDX =  000058     |   5 NEXT       001BF7 R
    NEXT_IDX=  000056     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]

Symbol Table

    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  5 NOT        001BEF R   |     NOT_IDX =  00005A     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R
  5 ODR        001BE7 R   |     ODR_IDX =  00005C     |     ONOFF   =  000003 
    OP      =  000005     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   5 OR         001BE0 R
    OR_IDX  =  00005E     |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     OVRWR   =  000004 
    PA      =  000000     |   5 PAD        001BD8 R   |     PAD_IDX =  000060 
    PAD_SIZE=  000080     |   5 PAUSE      001BCE R   |     PAUSE_ID=  000062 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       001BC5 R   |     PEEK_IDX=  000066 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   5 PINP       001BBC R
    PINP_IDX=  000068     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      001BB2 R
    PMODE_ID=  000064     |   5 POKE       001BA9 R   |     POKE_IDX=  00006A 
    PORT    =  000003     |   5 POUT       001BA0 R   |     POUT_IDX=  00006C 
    PREV    =  000001     |   5 PRINT      001B96 R   |   5 PRTA       001B8D R
    PRTA_IDX=  000070     |   5 PRTB       001B84 R   |     PRTB_IDX=  000072 
  5 PRTC       001B7B R   |     PRTC_IDX=  000074     |   5 PRTD       001B72 R
    PRTD_IDX=  000076     |   5 PRTE       001B69 R   |     PRTE_IDX=  000078 
  5 PRTF       001B60 R   |     PRTF_IDX=  00007A     |   5 PRTG       001B57 R
    PRTG_IDX=  00007C     |   5 PRTH       001B4E R   |     PRTH_IDX=  00007E 
  5 PRTI       001B45 R   |     PRTI_IDX=  000080     |     PRT_IDX =  00006E 
    PSTR    =  000003     |   5 QKEY       001B3C R   |     QKEY_IDX=  000082 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
    RBT_IDX =  000086     |   5 READ       001B33 R   |     READ_IDX=  000084 
  5 REBOOT     001B28 R   |     REG     =  000001     |     REGA    =  000001 
    REGX    =  000003     |     REGY    =  000005     |     RELOP   =  000003 
  5 REMARK     001B1D R   |     REM_IDX =  000088     |   5 RESTORE    001B11 R
    REST_IDX=  00008A     |     RETL1   =  000001     |   5 RETURN     001B06 R
    RET_ADDR=  000003     |     RET_IDX =  00008C     |     RET_INW =  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]

Symbol Table

  5 RND        001AFE R   |     RND_IDX =  00008E     |     ROP     =  004800 
    RS      =  00001E     |   5 RSHIFT     001AF3 R   |     RSHIFT_I=  000090 
    RST_SR  =  0050B3     |   5 RUN        001AEB R   |     RUN_IDX =  000092 
    RXCHAR  =  000001     |     RX_QUEUE=  000008     |     SAVEB   =  000002 
    SDIVSR  =  000005     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       001AE2 R   |     SHOW_IDX=  000094 
    SI      =  00000F     |     SIGN    =  000001     |     SKIP    =  000005 
  5 SLEEP      001AD8 R   |     SLEEP_ID=  000098     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   5 SPIEN      001ACE R
    SPIEN_ID=  00009C     |   5 SPIRD      001AC4 R   |     SPIRD_ID=  00009A 
  5 SPISEL     001AB9 R   |     SPISEL_I=  00009E     |   5 SPIWR      001AAF R
    SPIWR_ID=  0000A0     |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
    SPI_CR1_=  000000     |     SPI_CR1_=  000001     |     SPI_CR1_=  000007 
    SPI_CR1_=  000002     |     SPI_CR1_=  000006     |     SPI_CR2 =  005201 
    SPI_CR2_=  000007     |     SPI_CR2_=  000006     |     SPI_CR2_=  000005 
    SPI_CR2_=  000004     |     SPI_CR2_=  000002     |     SPI_CR2_=  000000 
    SPI_CR2_=  000001     |     SPI_CRCP=  005205     |     SPI_CS_B=  000005 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_SR_B=  000007     |     SPI_SR_C=  000004 
    SPI_SR_M=  000005     |     SPI_SR_O=  000006     |     SPI_SR_R=  000000 
    SPI_SR_T=  000001     |     SPI_SR_W=  000003     |     SPI_TXCR=  005207 
    SQUOT   =  000006     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  0000A0     |   5 STEP       001AA6 R   |     STEP_IDX=  0000A2 
  5 STOP       001A9D R   |     STOP_IDX=  0000A4     |     STR     =  000003 
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      001A93 R   |     TICKS_ID=  0000A6     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]

Symbol Table

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
  5 TIMEOUT    001A87 R   |   5 TIMER      001A7D R   |     TIMER_ID=  0000A8 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_ARRAY=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]

Symbol Table

    TK_CFUNC=  000082     |     TK_CHAR =  000003     |     TK_CMD  =  000080 
    TK_COLON=  00000B     |     TK_COMMA=  000009     |     TK_CONST=  000083 
    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_IFUNC=  000081     |     TK_INTGR=  000084     |     TK_LE   =  000036 
    TK_LPARE=  000007     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_PLUS =  000010     |     TK_QSTR =  000002 
    TK_RPARE=  000008     |     TK_SHARP=  00000A     |     TK_VAR  =  000085 
    TMROUT_I=  0000AA     |   5 TO         001A76 R   |   5 TONE       001A6D R
    TONE_IDX=  0000AE     |     TO_IDX  =  0000AC     |   5 Timer4Up   000040 R
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
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     001A62 R
    UBOUND_I=  0000B0     |   5 UBTN_Han   000079 R   |   5 UFLASH     001A57 R
    UFLASH_I=  0000B2     |   5 UNTIL      001A4D R   |     UNTIL_ID=  0000B4 
    US      =  00001F     |   5 USER_ABO   00008C R   |   5 USR        001A45 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000B6     |   5 Uart1RxH   00000F R   |   5 UserButt   000055 R
    VAR_ADDR=  000006     |     VSISE   =  000003     |     VSIZ    =  000002 
    VSIZE   =  000004     |     VT      =  00000B     |   5 WAIT       001A3C R
    WAIT_IDX=  0000B8     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      001A32 R   |     WORDS_ID=  0000BA     |   5 WRITE      001A28 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]

Symbol Table

    WRITE_ID=  0000BC     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   5 XOR        001A20 R   |     XOR_IDX =  0000BE 
    XREG    =  000003     |     XSAVE   =  000001     |     YSAVE   =  000004 
  5 abs        001550 R   |   1 acc16      00000C GR  |   1 acc24      00000B GR
  1 acc8       00000D GR  |   5 accept_c   0020F8 R   |   5 add_char   0027D3 R
  5 add_spac   0025F7 R   |   5 analog_r   0012A9 R   |   5 app        002884 R
  5 app_sign   002880 R   |   5 app_size   002882 R   |   5 app_spac   002880 GR
  5 arduino_   001646 R   |   5 arg_list   000BCE R   |   1 array_si   00001E R
  5 ascii      001441 R   |   5 at_tst     002465 R   |   5 atoi24     000988 GR
  5 atoi_exi   0009EE R   |   5 awu        001501 R   |   5 awu02      00150B R
  5 bad_port   0014A2 R   |   1 base       00000A GR  |   1 basicptr   000004 GR
  5 beep       001236 R   |   5 beep_1kh   001220 GR  |   5 bin_exit   00232B R
  5 bit_and    001564 R   |   5 bit_or     00157C R   |   5 bit_rese   000FFB R
  5 bit_set    000FEB R   |   5 bit_test   00101C R   |   5 bit_togg   00100C R
  5 bit_xor    001594 R   |   5 bitmask    0017B2 R   |   5 bkslsh_t   002412 R
  5 bksp       001E96 R   |   5 block_er   0001AD R   |   5 break_po   001376 R
  5 bye        0014DA R   |   5 char       00142F R   |   5 clear_ba   000590 R
  5 clear_va   0003F8 R   |   5 clock_in   0000A7 R   |   5 cmd_end    001219 R
  5 cmd_line   0007AD R   |   5 cmd_name   0027F3 R   |   5 code_add   001D98 GR
  5 cold_sta   00046F R   |   5 colon_ts   002439 R   |   5 comma_ts   002444 R
  5 comp_msg   000705 R   |   5 compile    00256A GR  |   5 const_cr   001866 R
  5 const_cr   00186C R   |   5 const_dd   001860 R   |   5 const_ee   00187E R
  5 const_id   00185A R   |   5 const_in   001878 R   |   5 const_od   001854 R
  5 const_ou   001872 R   |   5 const_po   00181E R   |   5 const_po   001824 R
  5 const_po   00182A R   |   5 const_po   001830 R   |   5 const_po   001836 R
  5 const_po   00183C R   |   5 const_po   001842 R   |   5 const_po   001848 R
  5 const_po   00184E R   |   5 convert_   0022A2 R   |   5 convert_   001E5A R
  5 copy_com   00249A R   |   1 count      000003 GR  |   5 cp_loop    000B7D R
  5 cpy_cmd_   0025E2 R   |   5 cpy_quot   00261B R   |   5 create_g   0021CC R
  5 cs_high    001A13 R   |   5 cstk_pro   000D88 R   |   5 dash_tst   00245A R
  5 data       001884 R   |   1 data_len   000009 R   |   5 data_lin   00188A R
  1 data_ofs   000008 R   |   1 data_ptr   000006 R   |   5 data_sea   0018CB R
  5 dbl_sign   000AD7 R   |   5 dec_base   000DB4 R   |   5 decomp_l   0026CC R
  5 decompil   002685 GR  |   5 del_line   00219F R   |   5 delete_l   001F83 R
  5 delete_n   001EA6 R   |   5 delete_u   001F48 R   |   5 digital_   0012DD R
  5 digital_   00130D R   |   5 div32_16   000AE1 R   |   5 divide     000B38 R
  5 divu24_8   0008F7 R   |   5 dneg       000ACC R   |   5 do_loop    0017DB R
  5 do_progr   0001A0 R   |   5 enable_i   00175C R   |   5 eql_tst    0024EF R
  5 equal      0027E6 R   |   5 erase      0013D5 R   |   5 erase_fl   0001CC R
  5 err_bad_   000670 R   |   5 err_buf_   0006E6 R   |   5 err_cmd_   000634 R
  5 err_div0   0005F9 R   |   5 err_dupl   00064E R   |   5 err_math   0005E0 R
  5 err_mem_   0005C5 R   |   5 err_msg    0005A5 R   |   5 err_no_a   00067C R
  5 err_no_d   0006AF R   |   5 err_no_f   0006D3 R   |   5 err_no_l   000608 R
  5 err_no_p   0006BF R   |   5 err_not_   00065F R   |   5 err_run_   00061E R
  5 err_synt   0005D2 R   |   5 escaped    0022B7 GR  |   5 expect     000BBC R
  5 expr_exi   000D13 R   |   5 expressi   000CCD R   |   5 factor     000C1E R
  1 farptr     000016 R   |   5 fcpu       0015DE R   |   5 final_te   0020F1 R
  5 first_li   000E57 R   |   1 flags      000020 GR  |   5 for        001077 R
  5 free       000DB9 R   |   1 free_ram   000064 R   |   5 func_arg   000BC9 R
  5 func_not   00174F R   |   5 ge         0027E8 R   |   5 get_arra   000BF9 R
  5 get_cmd_   002664 R   |   5 get_esca   001E66 R   |   5 get_targ   001141 R
  5 get_tick   00154A R   |   5 get_toke   0023AB GR  |   5 getc       0002C2 GR
  5 gosub      001182 R   |   5 goto       001167 R   |   5 gpio       00147D R
  5 gt         0027E4 R   |   5 gt_tst     0024FA R   |   5 hex_base   000DAF R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]

Symbol Table

  5 hex_dump   00034F R   |   5 if         001063 R   |   1 in         000001 GR
  1 in.saved   000002 GR  |   1 in.w       000000 GR  |   5 incr_far   0013B9 R
  5 input_ex   000FBD R   |   5 input_lo   000F52 R   |   5 input_va   000F50 R
  5 insert_c   001F05 R   |   5 insert_l   0021F8 R   |   5 insert_l   002267 R
  5 interp_l   0007EE R   |   5 interpre   0007C9 R   |   5 invert     0017CC R
  5 is_alnum   000420 GR  |   5 is_alpha   000406 GR  |   5 is_digit   000417 GR
  5 itoa       00088C GR  |   5 itoa_loo   0008B1 R   |   5 jp_to_ta   001175 R
  5 key        001468 R   |   5 kw_loop    002347 R   |   5 kword_di   001D90 GR
  5 kword_en   001A1E R   |   5 le         0027ED R   |   5 leading_   0017A2 R
  5 let        000E03 GR  |   5 let_arra   000E11 R   |   5 let_var    000E14 R
  5 lines_sk   000E5A R   |   5 list       000E2E R   |   5 list_exi   000E9C R
  5 list_loo   000E7A R   |   5 log2       001797 R   |   5 logical_   001745 R
  5 long_div   000AB4 R   |   5 loop_bac   001124 R   |   1 loop_dep   00001D R
  5 loop_don   001139 R   |   5 lshift     0015AC R   |   5 lt         0027EB R
  5 lt_tst     002523 R   |   5 modulo     000B4E R   |   5 move       0003B6 GR
  5 move_dow   0003D4 R   |   5 move_era   000132 R   |   5 move_exi   0003F5 R
  5 move_lef   001EDD R   |   5 move_loo   0003D9 R   |   5 move_prg   000166 R
  5 move_rig   001EEB R   |   5 move_up    0003C6 R   |   5 mul_char   0027D5 R
  5 muldiv     000B53 R   |   5 multiply   000A7F R   |   5 mulu24_8   00091F R
  5 nbr_tst    0023DE R   |   5 ne         0027F0 R   |   5 neg_acc2   000959 R
  5 new        001394 R   |   5 next       0010F7 R   |   5 next_lin   0007D1 R
  5 next_tok   000815 GR  |   5 no_match   000B8F R   |   5 other      00254C R
  5 overwrit   00211D R   |   3 pad        0016E0 GR  |   5 pad_ref    001A18 R
  5 parse_bi   002309 R   |   5 parse_in   0022BF R   |   5 parse_ke   002346 R
  5 parse_qu   00226A R   |   5 pause      0014EE R   |   5 pause02    0014F8 R
  5 peek       001052 R   |   5 pin_mode   0015EA R   |   5 plus_tst   0024C3 R
  5 poke       001043 R   |   5 power_ad   00126D R   |   5 prcnt_ts   0024E4 R
  5 print      000ECA R   |   5 print_ex   000F24 R   |   5 print_he   002152 GR
  5 print_in   000870 R   |   5 printxy    0009F2 R   |   5 program_   000146 R
  5 program_   000166 R   |   5 prt_basi   000EAA R   |   5 prt_loop   000ECE R
  5 prt_tok    0002E1 R   |   5 prti24     000880 R   |   1 ptr16      000017 GR
  1 ptr8       000018 R   |   5 putc       0002B2 GR  |   5 puts       001E8C GR
  5 qgetc      0002BB GR  |   5 qkey       001470 GR  |   5 qmark_ts   002470 R
  5 random     001666 R   |   5 read       001907 R   |   5 read01     001909 R
  5 readln     001F91 GR  |   5 readln_l   001F9E R   |   5 readln_q   00213A R
  5 refresh_   001792 R   |   5 rel_exit   000D6B R   |   5 relation   000D16 R
  5 relop_st   0027D8 R   |   5 remark     000FC0 GR  |   5 reset_co   000ECC R
  5 rest_con   000F40 R   |   5 restore    0018B8 R   |   5 return     0011A2 R
  5 right_al   002609 GR  |   5 row_alig   00139E R   |   5 row_eras   00010B R
  5 row_eras   000132 R   |   5 row_loop   000332 R   |   5 rparnt_t   00242E R
  5 rshift     0015C5 R   |   5 rt_msg     0006F3 R   |   5 run        0011C0 R
  5 run_it     0011F2 R   |   5 running    000547 R   |   1 rx1_head   00002A R
  1 rx1_queu   000022 R   |   1 rx1_tail   00002B R   |   5 save_con   000F30 R
  5 scan_blo   0013C7 R   |   5 search_d   000B6F GR  |   5 search_e   000BB9 R
  5 search_l   002174 GR  |   5 search_l   002183 R   |   5 search_n   000B73 R
  1 seedx      000012 R   |   1 seedy      000014 R   |   5 select_p   001636 R
  5 send_esc   001EB4 R   |   5 send_par   001EBF R   |   5 set_time   001733 R
  5 sharp_ts   00244F R   |   5 show       000D6E R   |   5 show_row   000320 R
  5 single_c   0027CE R   |   5 skip       002398 R   |   5 slash_ts   0024D9 R
  5 sleep      0014E3 R   |   5 software   000429 R   |   5 spaces     001EF9 GR
  5 spi_clea   0019AC R   |   5 spi_disa   001994 R   |   5 spi_enab   001961 R
  5 spi_rcv_   0019CE R   |   5 spi_read   0019F9 R   |   5 spi_sele   001A01 R
  5 spi_send   0019B8 R   |   5 spi_writ   0019D9 R   |   3 stack_fu   001760 GR
  3 stack_un   001800 R   |   5 star_tst   0024CE R   |   5 step       0010D0 R
  5 stop       001348 R   |   5 store_lo   0010E4 R   |   5 str_matc   000B9C R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]

Symbol Table

  5 str_tst    0023CE R   |   5 strcmp     000397 R   |   5 strcpy     0003A8 GR
  5 strlen     00038C GR  |   5 syntax_e   000726 GR  |   1 tab_widt   000021 GR
  5 tb_error   000728 GR  |   5 term       000C7B R   |   5 term01     000C83 R
  5 term_exi   000CCA R   |   3 tib        001690 GR  |   5 tick_tst   002488 R
  1 ticks      00000E R   |   5 timeout    001742 R   |   1 timer      000010 GR
  5 timer2_i   0000BD R   |   5 timer4_i   0000CA R   |   5 tk_id      000716 R
  5 to         0010A0 R   |   5 to_eepro   000189 R   |   5 to_flash   00019D R
  5 to_hex_c   002169 GR  |   5 to_upper   00097C GR  |   5 token_ch   002563 R
  5 token_ex   002567 R   |   5 token_ms   000318 R   |   5 tone       001229 R
  5 try_next   0018F7 R   |   1 txtbgn     000019 GR  |   1 txtend     00001B GR
  5 uart1_ge   0002C2 GR  |   5 uart1_in   00026F R   |   5 uart1_pu   0002B2 GR
  5 uart1_qg   0002BB GR  |   5 uart1_se   00027F R   |   5 ubound     000DE1 R
  5 udiv32_1   000AA2 R   |   5 uflash     0014A7 R   |   5 umstar     000A45 R
  5 unlock_e   0000DF R   |   5 unlock_f   0000F5 R   |   5 until      0017F0 R
  5 user_int   000068 R   |   5 usr        0014BD R   |   5 var_name   00265C GR
  1 vars       000030 GR  |   5 wait       000FC6 R   |   5 warm_ini   000572 R
  5 warm_sta   0007AA R   |   5 words      0016CD R   |   5 words_co   00171D R
  5 write      0013F8 R   |   5 write_bl   00024C R   |   5 write_by   0001D7 R
  5 write_ee   000213 R   |   5 write_ex   000247 R   |   5 write_fl   0001FD R
  5 write_ro   00017A R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     64   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   28AE   flags    0

