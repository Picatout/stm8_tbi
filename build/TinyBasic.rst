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
      00002D                         74 vars:: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     75 	.area BTXT (ABS)
      00007C                         76 	.org 0x7C  
                                     77 ; keep 'free_ram' as last variable 
                                     78 ; basic code compiled here. 
      00007C                         79 rsign: .blkw 1 ; "BC" 
      00007E                         80 rsize: .blkw 1 ; code size 	 
      000080                         81 free_ram: ; from here RAM free for BASIC text 
                                     82 
                                     83 ;;-----------------------------------
                                     84     .area SSEG (ABS)
                                     85 ;; working buffers and stack at end of RAM. 	
                                     86 ;;-----------------------------------
      001690                         87     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
      001690                         88 tib:: .ds TIB_SIZE             ; transaction input buffer
      0016E0                         89 pad:: .ds PAD_SIZE             ; working buffer
      001760                         90 stack_full:: .ds STACK_SIZE   ; control stack 
      001800                         91 stack_unf: ; stack underflow ; control_stack bottom 
                                     92 
                                     93 ;;--------------------------------------
                                     94     .area HOME 
                                     95 ;; interrupt vector table at 0x8000
                                     96 ;;--------------------------------------
      008000 82 00 85 06             97     int cold_start			; RESET vector 
                           000000    98 .if DEBUG
                                     99 	int TrapHandler 		;TRAP  software interrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                           000001   100 .else
      008004 82 00 80 80            101 	int NonHandledInterrupt ;TRAP  software interrupt
                                    102 .endif
      008008 82 00 80 80            103 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 81            104 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            105 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            106 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80            107 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80            108 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            109 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 D1            110 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80            111 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80            112 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80            113 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80            114 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80            115 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80            116 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80            117 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80            118 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80            119 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80            120 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 8F            121 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80            122 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80            123 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 80            124 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80            125 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 BC            126 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80            127 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80            128 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80            129 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80            130 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80            131 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80            132 	int NonHandledInterrupt ;int29  not used
                                    133 
                                    134 ;---------------------------------------
                                    135     .area CODE
                                    136 ;---------------------------------------
                           000000   137 .if DEBUG
                                    138 .asciz "STM8_TBI" ; I like to put module name here.
                                    139 .endif 
                                    140 
                                    141 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    142 ; non handled interrupt 
                                    143 ; reset MCU
                                    144 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                        145 NonHandledInterrupt:
      008080 71                     146     .byte 0x71  ; invalid opcode reinitialize MCU
                                    147 
                                    148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    149 ; auto wakeup from halt
                                    150 ; at iret, program continue 
                                    151 ; after hatl instruction
                                    152 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008081                        153 AWUHandler:
      008081 72 19 50 F0      [ 1]  154 	bres AWU_CSR,#AWU_CSR_AWUEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      008085 55 00 3F 50 F1   [ 1]  155 	mov AWU_APR,0x3F
      00808A 72 5F 50 F2      [ 1]  156 	clr AWU_TBR 
      00808E 80               [11]  157 	iret
                                    158 
                                    159 ;--------------------------
                                    160 ; UART1 receive character
                                    161 ; CTRL+C (ASCII 3)
                                    162 ; cancel program execution
                                    163 ; and fall back to command line
                                    164 ; CTRL+X reboot system 
                                    165 ;--------------------------
      00808F                        166 Uart1RxHandler: ; console receive char 
      00808F 72 0B 52 30 27   [ 2]  167 	btjf UART1_SR,#UART_SR_RXNE,5$
      008094 C6 52 31         [ 1]  168 	ld a,UART1_DR 
      008097 A1 03            [ 1]  169 	cp a,#CTRL_C 
      008099 26 06            [ 1]  170 	jrne 2$
      00809B CD 83 41         [ 4]  171 	call putc 
      00809E CC 80 E4         [ 2]  172 	jp user_interrupted
      0080A1                        173 2$:
      0080A1 A1 18            [ 1]  174 	cp a,#CAN ; CTRL_X 
      0080A3 26 03            [ 1]  175 	jrne 3$
      0080A5 CC 85 06         [ 2]  176 	jp cold_start 	
      0080A8 88               [ 1]  177 3$:	push a 
      0080A9 A6 23            [ 1]  178 	ld a,#rx1_queue 
      0080AB CB 00 2C         [ 1]  179 	add a,rx1_tail 
      0080AE 5F               [ 1]  180 	clrw x 
      0080AF 97               [ 1]  181 	ld xl,a 
      0080B0 84               [ 1]  182 	pop a 
      0080B1 F7               [ 1]  183 	ld (x),a 
      0080B2 C6 00 2C         [ 1]  184 	ld a,rx1_tail 
      0080B5 4C               [ 1]  185 	inc a 
      0080B6 A4 07            [ 1]  186 	and a,#RX_QUEUE_SIZE-1
      0080B8 C7 00 2C         [ 1]  187 	ld rx1_tail,a 
      0080BB 80               [11]  188 5$:	iret 
                                    189 
                                    190 ;------------------------------------
                                    191 ; software interrupt handler  
                                    192 ;------------------------------------
                           000000   193 .if DEBUG 
                                    194 TrapHandler:
                                    195 	bset flags,#FTRAP 
                                    196 	call print_registers
                                    197 	call cmd_itf
                                    198 	bres flags,#FTRAP 	
                                    199 	iret
                                    200 .endif 
                                    201 
                                    202 ;------------------------------
                                    203 ; TIMER 4 is used to maintain 
                                    204 ; a milliseconds 'ticks' counter
                                    205 ; and decrement 'timer' varaiable
                                    206 ;--------------------------------
      0080BC                        207 Timer4UpdateHandler:
      0080BC 72 5F 53 42      [ 1]  208 	clr TIM4_SR 
      0080C0 CE 00 0F         [ 2]  209 	ldw x,ticks
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080C3 5C               [ 1]  210 	incw x
      0080C4 CF 00 0F         [ 2]  211 	ldw ticks,x 
      0080C7 CE 00 11         [ 2]  212 	ldw x,timer
                                    213 ;	tnzw x 
      0080CA 27 04            [ 1]  214 	jreq 1$
      0080CC 5A               [ 2]  215 	decw x 
      0080CD CF 00 11         [ 2]  216 	ldw timer,x 
      0080D0                        217 1$:	
      0080D0 80               [11]  218 	iret 
                                    219 
                                    220 ;------------------------------------
                                    221 ; Triggered by pressing USER UserButton 
                                    222 ; on NUCLEO card.
                                    223 ; This is used to abort a progam lock 
                                    224 ; in infinite loop. 
                                    225 ;------------------------------------
      0080D1                        226 UserButtonHandler:
                                    227 ; wait button release
      0080D1 5F               [ 1]  228 	clrw x
      0080D2 5A               [ 2]  229 1$: decw x 
      0080D3 26 FD            [ 1]  230 	jrne 1$
      0080D5 72 09 50 15 F8   [ 2]  231 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    232 ; if MCU suspended by SLEEP resume program
      0080DA 72 07 00 21 05   [ 2]  233     btjf flags,#FSLEEP,2$
      0080DF 72 17 00 21      [ 1]  234 	bres flags,#FSLEEP 
      0080E3 80               [11]  235 	iret
      0080E4                        236 2$:	
      0080E4                        237 user_interrupted:
      0080E4 72 00 00 21 02   [ 2]  238     btjt flags,#FRUN,4$
      0080E9 20 0A            [ 2]  239 	jra UBTN_Handler_exit 
      0080EB                        240 4$:	; program interrupted by user 
      0080EB 72 11 00 21      [ 1]  241 	bres flags,#FRUN 
      0080EF AE 81 08         [ 2]  242 	ldw x,#USER_ABORT
      0080F2 CD A0 DC         [ 4]  243 	call puts 
      0080F5                        244 UBTN_Handler_exit:
      0080F5 AE 17 FF         [ 2]  245     ldw x,#STACK_EMPTY 
      0080F8 94               [ 1]  246     ldw sp,x
      0080F9 9A               [ 1]  247 	rim 
      0080FA CE 00 1A         [ 2]  248 	ldw x,txtbgn 
      0080FD A3 AA 80         [ 2]  249 	cpw x,#app_space 
      008100 22 03            [ 1]  250 	jrugt 5$
      008102 CD 86 29         [ 4]  251 	call clear_basic 
      008105 CC 88 45         [ 2]  252 5$:	jp warm_start
                                    253 
      008108 0A 50 72 6F 67 72 61   254 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    255 
                                    256 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    257 ;    peripherals initialization
                                    258 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    259 
                                    260 ;----------------------------------------
                                    261 ; inialize MCU clock 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    262 ; input:
                                    263 ;   A 		source  HSI | 1 HSE 
                                    264 ;   XL      CLK_CKDIVR , clock divisor 
                                    265 ; output:
                                    266 ;   none 
                                    267 ;----------------------------------------
      008123                        268 clock_init:	
      008123 C1 50 C3         [ 1]  269 	cp a,CLK_CMSR 
      008126 27 0C            [ 1]  270 	jreq 2$ ; no switching required 
                                    271 ; select clock source 
      008128 72 12 50 C5      [ 1]  272 	bset CLK_SWCR,#CLK_SWCR_SWEN
      00812C C7 50 C4         [ 1]  273 	ld CLK_SWR,a
      00812F C1 50 C3         [ 1]  274 1$:	cp a,CLK_CMSR
      008132 26 FB            [ 1]  275 	jrne 1$
      008134                        276 2$: 	
                                    277 ; HSI and cpu clock divisor 
      008134 9F               [ 1]  278 	ld a,xl 
      008135 C7 50 C6         [ 1]  279 	ld CLK_CKDIVR,a  
      008138 81               [ 4]  280 	ret
                                    281 
                                    282 ;----------------------------------
                                    283 ; TIMER2 used as audio tone output 
                                    284 ; on port D:5.
                                    285 ; channel 1 configured as PWM mode 1 
                                    286 ;-----------------------------------  
                           00F424   287 TIM2_CLK_FREQ=62500
      008139                        288 timer2_init:
      008139 72 1A 50 C7      [ 1]  289 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      00813D 35 60 53 05      [ 1]  290  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008141 35 08 53 0C      [ 1]  291 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008145 81               [ 4]  292 	ret 
                                    293 
                                    294 ;---------------------------------
                                    295 ; TIM4 is configured to generate an 
                                    296 ; interrupt every millisecond 
                                    297 ;----------------------------------
      008146                        298 timer4_init:
      008146 72 18 50 C7      [ 1]  299 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00814A 35 07 53 45      [ 1]  300 	mov TIM4_PSCR,#7 ; prescale 128  
      00814E 35 7D 53 46      [ 1]  301 	mov TIM4_ARR,#125 ; set for 1msec.
      008152 35 05 53 40      [ 1]  302 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008156 72 10 53 41      [ 1]  303 	bset TIM4_IER,#TIM4_IER_UIE
      00815A 81               [ 4]  304 	ret
                                    305 
                                    306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    307 ;  routines to write to FLASH, EEPROM 
                                    308 ;  and OPTION 
                                    309 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    310 
                                    311 ;----------------------------------
                                    312 ; unlock EEPROM/OPT for writing/erasing
                                    313 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    314 ; input:
                                    315 ;  none
                                    316 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    317 ;  none 
                                    318 ;----------------------------------
      00815B                        319 unlock_eeprom:
      00815B 72 06 50 5F 15   [ 2]  320 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008160 35 00 50 5B      [ 1]  321 	mov FLASH_CR2,#0 
      008164 35 FF 50 5C      [ 1]  322 	mov FLASH_NCR2,#0xFF 
      008168 35 AE 50 64      [ 1]  323 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00816C 35 56 50 64      [ 1]  324     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008170 72 07 50 5F FB   [ 2]  325 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008175 81               [ 4]  326 9$:	ret
                                    327 
                                    328 ;----------------------------------
                                    329 ; unlock FLASH for writing/erasing
                                    330 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    331 ; input:
                                    332 ;  none
                                    333 ; output:
                                    334 ;  none
                                    335 ;----------------------------------
      008176                        336 unlock_flash:
      008176 72 02 50 5F 15   [ 2]  337 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      00817B 35 00 50 5B      [ 1]  338 	mov FLASH_CR2,#0 
      00817F 35 FF 50 5C      [ 1]  339 	mov FLASH_NCR2,#0xFF 
      008183 35 56 50 62      [ 1]  340 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008187 35 AE 50 62      [ 1]  341 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00818B 72 03 50 5F FB   [ 2]  342 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008190 81               [ 4]  343 9$:	ret
                                    344 
                                    345 ;----------------------------
                                    346 ; erase block code must be 
                                    347 ; executed from RAM
                                    348 ; input:
                                    349 ;-----------------------------
      008191                        350 row_erase:
      008191 88               [ 1]  351 	push a 
      008192 90 89            [ 2]  352 	pushw y 
      008194 35 20 50 5B      [ 1]  353 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      008198 35 DF 50 5C      [ 1]  354 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      00819C 4F               [ 1]  355 	clr a 
      00819D 90 5F            [ 1]  356 	clrw y 
      00819F 91 A7 00 17      [ 1]  357 	ldf ([farptr],y),a
      0081A3 90 5C            [ 1]  358     incw y
      0081A5 91 A7 00 17      [ 1]  359 	ldf ([farptr],y),a
      0081A9 90 5C            [ 1]  360     incw y
      0081AB 91 A7 00 17      [ 1]  361 	ldf ([farptr],y),a
      0081AF 90 5C            [ 1]  362     incw y
      0081B1 91 A7 00 17      [ 1]  363 	ldf ([farptr],y),a
      0081B5 72 05 50 5F FB   [ 2]  364 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      0081BA 90 85            [ 2]  365 	popw y 
      0081BC 84               [ 1]  366 	pop a 
      0081BD 81               [ 4]  367 	ret
      0081BE                        368 row_erase_end:
                                    369 
                                    370 ; copy erase_start in RAM 
      0081BE                        371 move_erase_to_ram:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      0081BE 89               [ 2]  372 	pushw x 
      0081BF 90 89            [ 2]  373 	pushw y 
      0081C1 AE 81 BE         [ 2]  374 	ldw x,#row_erase_end 
      0081C4 1D 81 91         [ 2]  375 	subw x,#row_erase
      0081C7 CF 00 0D         [ 2]  376 	ldw acc16,x 
      0081CA AE 16 90         [ 2]  377 	ldw x,#tib 
      0081CD 90 AE 81 91      [ 2]  378 	ldw y,#row_erase 
      0081D1 CD 84 45         [ 4]  379 	call move
      0081D4 90 85            [ 2]  380 	popw y
      0081D6 85               [ 2]  381 	popw x
      0081D7 81               [ 4]  382 	ret 
                                    383 
                                    384 ;-----------------------------------
                                    385 ; block programming must be 
                                    386 ; executed from RAM 
                                    387 ; initial contidions: 
                                    388 ; 	memory unlocked
                                    389 ;   bit PRG set in 
                                    390 ; input:
                                    391 ;   x        data source 
                                    392 ;   farptr   row address destination 
                                    393 ; output:
                                    394 ;   none 
                                    395 ;----------------------------------
                           000001   396 	BCNT=1 
      0081D8                        397 program_row:
      0081D8 88               [ 1]  398 	push a 
      0081D9 90 89            [ 2]  399 	pushw y 
      0081DB 4B 80            [ 1]  400 	push #BLOCK_SIZE  
                                    401 ;enable block programming 
      0081DD 72 10 50 5B      [ 1]  402 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0081E1 72 11 50 5C      [ 1]  403 	bres FLASH_NCR2,#FLASH_CR2_PRG
                                    404 ;	mov FLASH_CR2,#(1<<FLASH_CR2_PRG) 
                                    405 ;	mov FLASH_NCR2,#~(1<<FLASH_CR2_PRG)
      0081E5 90 5F            [ 1]  406 	clrw y 
      0081E7 F6               [ 1]  407 1$:	ld a,(x)
      0081E8 91 A7 00 17      [ 1]  408 	ldf ([farptr],y),a
      0081EC 5C               [ 1]  409 	incw x 
      0081ED 90 5C            [ 1]  410 	incw y 
      0081EF 0A 01            [ 1]  411 	dec (BCNT,sp)
      0081F1 26 F4            [ 1]  412 	jrne 1$
                                    413 ; wait EOP bit 
      0081F3 72 05 50 5F FB   [ 2]  414 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      000178                        415 	_drop 1 
      0081F8 5B 01            [ 2]    1     addw sp,#1 
      0081FA 90 85            [ 2]  416 	popw y 
      0081FC 84               [ 1]  417 	pop a 
      0081FD 81               [ 4]  418 	ret 
      0081FE                        419 program_row_end:
                                    420 
                                    421 ;-------------------------
                                    422 ; move program_row to RAM 
                                    423 ; at txtubound address 
                                    424 ;------------------------
      0081FE                        425 move_prg_to_ram:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0081FE 89               [ 2]  426 	pushw x 
      0081FF 90 89            [ 2]  427 	pushw y 
      008201 AE 81 FE         [ 2]  428 	ldw x,#program_row_end 
      008204 1D 81 D8         [ 2]  429 	subw x,#program_row 
      008207 CF 00 0D         [ 2]  430 	ldw acc16,x ; bytes to move 
      00820A AE 16 90         [ 2]  431 	ldw x,#tib ; destination address 
      00820D 90 AE 81 D8      [ 2]  432 	ldw y,#program_row ; source address 
      008211 CD 84 45         [ 4]  433 	call move
      008214 90 85            [ 2]  434 	popw y 
      008216 85               [ 2]  435 	popw x  
      008217 81               [ 4]  436 	ret 
                                    437 
                                    438 
                                    439 ;-----------------------------
                                    440 ; write a row in FLASH/EEPROM 
                                    441 ; input:
                                    442 ;    farptr   destination address 
                                    443 ;    x        source address 
                                    444 ;-----------------------------
      008218                        445 write_row:
      008218 89               [ 2]  446 	pushw x 
      008219 72 5D 00 17      [ 1]  447 	tnz farptr 
      00821D 26 0D            [ 1]  448 	jrne to_flash 
      00821F CE 00 18         [ 2]  449 	ldw x,farptr+1 
      008222 A3 AA 80         [ 2]  450 	cpw x,#app_space  
      008225 24 05            [ 1]  451 	jruge to_flash 
      008227                        452 to_eeprom:
      008227 CD 81 5B         [ 4]  453 	call unlock_eeprom
      00822A 20 03            [ 2]  454 	jra do_programming
      00822C                        455 to_flash:
      00822C CD 81 76         [ 4]  456 	call unlock_flash
      00822F                        457 do_programming:
      00822F 85               [ 2]  458 	popw x 
      008230 CD 16 90         [ 4]  459 	call tib
      008233 72 13 50 5F      [ 1]  460 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008237 72 17 50 5F      [ 1]  461 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      00823B 81               [ 4]  462 	ret 
                                    463 
                                    464 
                                    465 ;-----------------------------------
                                    466 ; erase flash or EEPROM block
                                    467 ; a block is 128 bytes 
                                    468 ; input:
                                    469 ;   farptr  address row begin
                                    470 ; output:
                                    471 ;   none
                                    472 ;--------------------------------------
      00823C                        473 block_erase:
      00823C 89               [ 2]  474 	pushw x 
      00823D CE 00 18         [ 2]  475 	ldw x,farptr+1
      008240 A3 AA 80         [ 2]  476 	cpw x,#app_space 
      008243 24 0C            [ 1]  477 	jruge erase_flash 
                                    478 ; erase eeprom block
      008245 CD 81 5B         [ 4]  479 	call unlock_eeprom 
      008248 CD 16 90         [ 4]  480 	call tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00824B 72 17 50 5F      [ 1]  481 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      00824F 20 0A            [ 2]  482 	jra erase_exit  
                                    483 ; erase flash block:
      008251                        484 erase_flash:
      008251 CD 81 76         [ 4]  485 	call unlock_flash 
      008254 CD 16 90         [ 4]  486 	call tib 
      008257 72 13 50 5F      [ 1]  487     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00825B                        488 erase_exit: 
      00825B 85               [ 2]  489 	popw x 
      00825C 81               [ 4]  490 	ret 
                                    491 
                                    492 
                                    493 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    494 ; write a byte to FLASH or EEPROM/OPTION  
                                    495 ; input:
                                    496 ;    a  		byte to write
                                    497 ;    farptr  	address
                                    498 ;    x          farptr[x]
                                    499 ; output:
                                    500 ;    none
                                    501 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    502 	; variables locales
                           000001   503 	BTW = 1   ; byte to write offset on stack
                           000002   504 	OPT = 2   ; OPTION flag offset on stack
                           000002   505 	VSIZE = 2
      00825D                        506 write_byte:
      00825D 90 89            [ 2]  507 	pushw y
      0001DF                        508 	_vars VSIZE
      00825F 52 02            [ 2]    1     sub sp,#VSIZE 
      008261 6B 01            [ 1]  509 	ld (BTW,sp),a ; byte to write 
      008263 0F 02            [ 1]  510 	clr (OPT,sp)  ; OPTION flag
                                    511 ; put addr[15:0] in Y, for bounds check.
      008265 90 CE 00 18      [ 2]  512 	ldw y,farptr+1   ; Y=addr15:0
                                    513 ; check addr[23:16], if <> 0 then it is extened flash memory
      008269 72 5D 00 17      [ 1]  514 	tnz farptr 
      00826D 26 14            [ 1]  515 	jrne write_flash
      00826F 90 A3 AA 80      [ 2]  516     cpw y,#app_space 	 
      008273 24 0E            [ 1]  517     jruge write_flash
      008275 90 A3 40 00      [ 2]  518 	cpw y,#EEPROM_BASE  
      008279 25 57            [ 1]  519     jrult write_exit
      00827B 90 A3 48 7F      [ 2]  520 	cpw y,#OPTION_END 
      00827F 22 51            [ 1]  521 	jrugt write_exit
      008281 20 16            [ 2]  522 	jra write_eeprom 
                                    523 ; write program memory
      008283                        524 write_flash:
      008283 CD 81 76         [ 4]  525 	call unlock_flash 
      008286 9B               [ 1]  526 1$:	sim 
      008287 7B 01            [ 1]  527 	ld a,(BTW,sp)
      008289 92 A7 00 17      [ 4]  528 	ldf ([farptr],x),a ; farptr[x]=A
      00828D 72 05 50 5F FB   [ 2]  529 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008292 9A               [ 1]  530     rim 
      008293 72 13 50 5F      [ 1]  531     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008297 20 39            [ 2]  532     jra write_exit
                                    533 ; write eeprom and option
      008299                        534 write_eeprom:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008299 CD 81 5B         [ 4]  535 	call unlock_eeprom
                                    536 	; check for data eeprom or option eeprom
      00829C 90 A3 48 00      [ 2]  537 	cpw y,#OPTION_BASE
      0082A0 2B 08            [ 1]  538 	jrmi 1$
      0082A2 90 A3 48 80      [ 2]  539 	cpw y,#OPTION_END+1
      0082A6 2A 02            [ 1]  540 	jrpl 1$
      0082A8 03 02            [ 1]  541 	cpl (OPT,sp)
      0082AA                        542 1$: 
      0082AA 0D 02            [ 1]  543     tnz (OPT,sp)
      0082AC 27 08            [ 1]  544     jreq 2$
                                    545 	; pour modifier une option il faut modifier ces 2 bits
      0082AE 72 1E 50 5B      [ 1]  546     bset FLASH_CR2,#FLASH_CR2_OPT
      0082B2 72 1F 50 5C      [ 1]  547     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0082B6                        548 2$: 
      0082B6 7B 01            [ 1]  549     ld a,(BTW,sp)
      0082B8 92 A7 00 17      [ 4]  550     ldf ([farptr],x),a
      0082BC 0D 02            [ 1]  551     tnz (OPT,sp)
      0082BE 27 08            [ 1]  552     jreq 3$
      0082C0 5C               [ 1]  553     incw x
      0082C1 7B 01            [ 1]  554     ld a,(BTW,sp)
      0082C3 43               [ 1]  555     cpl a
      0082C4 92 A7 00 17      [ 4]  556     ldf ([farptr],x),a
      0082C8 72 05 50 5F FB   [ 2]  557 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082CD 72 0D 50 5F FB   [ 2]  558 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      0082D2                        559 write_exit:
      000252                        560 	_drop VSIZE 
      0082D2 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082D4 90 85            [ 2]  561 	popw y
      0082D6 81               [ 4]  562     ret
                                    563 
                                    564 ;--------------------------------------------
                                    565 ; write a data block to eeprom or flash 
                                    566 ; input:
                                    567 ;   Y        source address   
                                    568 ;   X        array index  destination  farptr[x]
                                    569 ;   BSIZE    block size bytes 
                                    570 ;   farptr   write address , byte* 
                                    571 ; output:
                                    572 ;	X 		after last byte written 
                                    573 ;   Y 		after last byte read 
                                    574 ;  farptr   point after block
                                    575 ;---------------------------------------------
      0082D7                        576 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      000257                        577 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    578 	; local var 
                           000001   579 	XSAVE=1 
                           000002   580 	VSIZE=2 
      000257                        581 write_block:
      0082D7 88               [ 1]  582 	push a 
      000258                        583 	_vars VSIZE
      0082D8 52 02            [ 2]    1     sub sp,#VSIZE 
      0082DA 1F 01            [ 2]  584 	ldw (XSAVE,sp),x 
      0082DC 1E 06            [ 2]  585 	ldw x,(BSIZE,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082DE 27 13            [ 1]  586 	jreq 9$
      0082E0 1E 01            [ 2]  587 1$:	ldw x,(XSAVE,sp)
      0082E2 90 F6            [ 1]  588 	ld a,(y)
      0082E4 CD 82 5D         [ 4]  589 	call write_byte 
      0082E7 5C               [ 1]  590 	incw x 
      0082E8 90 5C            [ 1]  591 	incw y 
      0082EA 1F 01            [ 2]  592 	ldw (XSAVE,sp),x
      0082EC 1E 06            [ 2]  593 	ldw x,(BSIZE,sp)
      0082EE 5A               [ 2]  594 	decw x
      0082EF 1F 06            [ 2]  595 	ldw (BSIZE,sp),x 
      0082F1 26 ED            [ 1]  596 	jrne 1$
      0082F3                        597 9$:
      0082F3 1E 01            [ 2]  598 	ldw x,(XSAVE,sp)
      0082F5 CD 94 E7         [ 4]  599 	call incr_farptr
      000278                        600 	_drop VSIZE
      0082F8 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082FA 84               [ 1]  601 	pop a 
      0082FB 81               [ 4]  602 	ret 
                                    603 
                                    604 
                                    605 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    606 ;;   UART1 subroutines
                                    607 ;;   used for user interface 
                                    608 ;;   communication channel.
                                    609 ;;   settings: 
                                    610 ;;		115200 8N1 no flow control
                                    611 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    612 
                                    613 ;---------------------------------------------
                                    614 ; initialize UART1, 115200 8N1
                                    615 ; input:
                                    616 ;	none
                                    617 ; output:
                                    618 ;   none
                                    619 ;---------------------------------------------
      0082FC                        620 uart1_init:
      0082FC 72 1A 50 02      [ 1]  621     bset PA_DDR,#UART1_TX_PIN
      008300 72 1A 50 03      [ 1]  622     bset PA_CR1,#UART1_TX_PIN 
      008304 72 1A 50 04      [ 1]  623     bset PA_CR2,#UART1_TX_PIN 
                                    624 ; enable UART1 clock
      008308 72 14 50 C7      [ 1]  625 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      00830C                        626 uart1_set_baud: 
      00830C 88               [ 1]  627 	push a 
                                    628 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    629 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      00830D A6 E1            [ 1]  630 	ld a,#CLK_SWR_HSI
      00830F C1 50 C3         [ 1]  631 	cp a,CLK_CMSR 
      008312 27 0A            [ 1]  632 	jreq 2$ 
      008314                        633 1$: ; 8 Mhz 	
      008314 35 05 52 33      [ 1]  634 	mov UART1_BRR2,#0x05 ; must be loaded first
      008318 35 04 52 32      [ 1]  635 	mov UART1_BRR1,#0x4
      00831C 20 08            [ 2]  636 	jra 3$
      00831E                        637 2$: ; 16 Mhz 	
      00831E 35 0B 52 33      [ 1]  638 	mov UART1_BRR2,#0x0b ; must be loaded first
      008322 35 08 52 32      [ 1]  639 	mov UART1_BRR1,#0x08
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008326                        640 3$:
      008326 72 5F 52 31      [ 1]  641     clr UART1_DR
      00832A 35 2C 52 35      [ 1]  642 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00832E 72 10 52 35      [ 1]  643 	bset UART1_CR2,#UART_CR2_SBK
      008332 72 0D 52 30 FB   [ 2]  644     btjf UART1_SR,#UART_SR_TC,.
      008337 72 5F 00 2B      [ 1]  645     clr rx1_head 
      00833B 72 5F 00 2C      [ 1]  646 	clr rx1_tail
      00833F 84               [ 1]  647 	pop a  
      008340 81               [ 4]  648 	ret
                                    649 
                                    650 ;---------------------------------
                                    651 ; uart1_putc
                                    652 ; send a character via UART1
                                    653 ; input:
                                    654 ;    A  	character to send
                                    655 ;---------------------------------
      008341                        656 putc:: ; console output always on UART1
      008341                        657 uart1_putc:: 
      008341 72 0F 52 30 FB   [ 2]  658 	btjf UART1_SR,#UART_SR_TXE,.
      008346 C7 52 31         [ 1]  659 	ld UART1_DR,a 
      008349 81               [ 4]  660 	ret 
                                    661 
                                    662 
                                    663 ;---------------------------------
                                    664 ; Query for character in rx1_queue
                                    665 ; input:
                                    666 ;   none 
                                    667 ; output:
                                    668 ;   A     0 no charcter available
                                    669 ;   Z     1 no character available
                                    670 ;---------------------------------
      00834A                        671 qgetc::
      00834A                        672 uart1_qgetc::
      00834A C6 00 2B         [ 1]  673 	ld a,rx1_head 
      00834D C0 00 2C         [ 1]  674 	sub a,rx1_tail 
      008350 81               [ 4]  675 	ret 
                                    676 
                                    677 ;---------------------------------
                                    678 ; wait character from UART1 
                                    679 ; input:
                                    680 ;   none
                                    681 ; output:
                                    682 ;   A 			char  
                                    683 ;--------------------------------	
      008351                        684 getc:: ;console input
      008351                        685 uart1_getc::
      008351 CD 83 4A         [ 4]  686 	call uart1_qgetc
      008354 27 FB            [ 1]  687 	jreq uart1_getc 
      008356 89               [ 2]  688 	pushw x 
                                    689 ;; rx1_queue must be in page 0 	
      008357 A6 23            [ 1]  690 	ld a,#rx1_queue
      008359 CB 00 2B         [ 1]  691 	add a,rx1_head 
      00835C 5F               [ 1]  692 	clrw x  
      00835D 97               [ 1]  693 	ld xl,a 
      00835E F6               [ 1]  694 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00835F 88               [ 1]  695 	push a
      008360 C6 00 2B         [ 1]  696 	ld a,rx1_head 
      008363 4C               [ 1]  697 	inc a 
      008364 A4 07            [ 1]  698 	and a,#RX_QUEUE_SIZE-1
      008366 C7 00 2B         [ 1]  699 	ld rx1_head,a 
      008369 84               [ 1]  700 	pop a  
      00836A 85               [ 2]  701 	popw x
      00836B 81               [ 4]  702 	ret 
                                    703 
                                    704 ;----------------------
                                    705 ; print token id && value
                                    706 ; input:
                                    707 ;   A     token id 
                                    708 ;   X     token value 
                                    709 ;---------------------
                           000001   710 	BSAVE=1
                           000002   711 	AREG=2
                           000003   712 	XREG=3
                           000004   713 	VSIZE=4
      00836C                        714 prt_tok:
      0002EC                        715 	_vars VSIZE 
      00836C 52 04            [ 2]    1     sub sp,#VSIZE 
      00836E 6B 02            [ 1]  716 	ld (AREG,sp),a 
      008370 1F 03            [ 2]  717 	ldw (XREG,sp),x 
      008372 C6 00 0B         [ 1]  718 	ld a, base
      008375 6B 01            [ 1]  719 	ld (BSAVE,sp),a 
      008377 35 10 00 0B      [ 1]  720 	mov base,#16  
      00837B AE 83 A3         [ 2]  721 	ldw x,#token_msg
      00837E CD A0 DC         [ 4]  722 	call puts 
      008381 5F               [ 1]  723 	clrw x 
      008382 7B 02            [ 1]  724 	ld a,(AREG,sp)
      008384 97               [ 1]  725 	ld xl,a 
      008385 CD 89 0B         [ 4]  726 	call print_int 
      008388 A6 20            [ 1]  727 	ld a,#SPACE
      00838A CD 83 41         [ 4]  728 	call putc 
      00838D 1E 03            [ 2]  729 	ldw x,(XREG,sp)
      00838F CD 89 0B         [ 4]  730 	call print_int 
      008392 A6 0D            [ 1]  731 	ld a,#CR 
      008394 CD 83 41         [ 4]  732 	call putc 
      008397 7B 01            [ 1]  733 	ld a,(BSAVE,sp)
      008399 C7 00 0B         [ 1]  734 	ld base,a 
      00839C 7B 02            [ 1]  735 	ld a,(AREG,sp)
      00839E 1E 03            [ 2]  736 	ldw x,(XREG,sp)
      000320                        737 	_drop VSIZE 
      0083A0 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083A2 81               [ 4]  738 	ret 
      0083A3 74 6F 6B 65 6E 3A 20   739 token_msg: .asciz "token: "
             00
                                    740 
                                    741 
                                    742 ;---------------------
                                    743 ; display n bytes row 
                                    744 ; from memory.
                                    745 ; input:
                                    746 ;   A   bytes to print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                                    747 ;	X   start address 
                                    748 ; output:
                                    749 ;   X   address after last shown  
                                    750 ;---------------------
                           000001   751 	CNT=1 
                           000002   752 	ADR=2 
                           000003   753 	VSIZE=3 
      0083AB                        754 show_row:
      0083AB 4D               [ 1]  755 	tnz a 
      0083AC 26 01            [ 1]  756 	jrne 1$
      0083AE 81               [ 4]  757 	ret 
      0083AF                        758 1$:	
      0083AF 89               [ 2]  759 	pushw x  
      0083B0 88               [ 1]  760 	push a 
      0083B1 35 04 00 22      [ 1]  761 	mov tab_width,#4 
      0083B5 CD 89 0B         [ 4]  762 	call print_int 
      0083B8 A6 20            [ 1]  763 	ld a,#SPACE  
      0083BA CD 83 41         [ 4]  764 	call putc
      0083BD                        765 row_loop:
      0083BD 1E 02            [ 2]  766 	ldw x,(ADR,sp)
      0083BF F6               [ 1]  767 	ld a,(x)
      0083C0 5F               [ 1]  768 	clrw x 
      0083C1 97               [ 1]  769 	ld xl,a 
      0083C2 CD 89 0B         [ 4]  770 	call print_int 
      0083C5 1E 02            [ 2]  771 	ldw x,(ADR,sp)
      0083C7 5C               [ 1]  772 	incw x 
      0083C8 1F 02            [ 2]  773 	ldw (ADR,sp),x 
      0083CA 0A 01            [ 1]  774 	dec (CNT,sp)
      0083CC 26 EF            [ 1]  775 	jrne row_loop
      00034E                        776 	_drop VSIZE  		
      0083CE 5B 03            [ 2]    1     addw sp,#VSIZE 
      0083D0 35 04 00 22      [ 1]  777 	mov tab_width,#4
      0083D4 A6 0D            [ 1]  778 	ld a,#CR 
      0083D6 CD 83 41         [ 4]  779 	call putc 
      0083D9 81               [ 4]  780 	ret 
                                    781 
                                    782 ;--------------------------
                                    783 ; print memory content 
                                    784 ; in hexadecimal format
                                    785 ;  input:
                                    786 ;    X    start address 
                                    787 ;    Y    count 
                                    788 ;--------------------------
                           000001   789 	BCNT=1
                           000003   790 	BASE=3
                           000004   791 	TABW=4
                           000004   792 	VSIZE=4   
      0083DA                        793 hex_dump:
      0083DA 88               [ 1]  794 	push a 
      00035B                        795 	_vars VSIZE
      0083DB 52 04            [ 2]    1     sub sp,#VSIZE 
      0083DD C6 00 0B         [ 1]  796 	ld a,base
      0083E0 6B 03            [ 1]  797 	ld (BASE,sp),a 
      0083E2 35 10 00 0B      [ 1]  798 	mov base,#16
      0083E6 C6 00 22         [ 1]  799 	ld a,tab_width 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      0083E9 6B 04            [ 1]  800 	ld (TABW,sp),a
      0083EB A6 0D            [ 1]  801 	ld a,#CR 
      0083ED CD 83 41         [ 4]  802 	call putc 
      0083F0 17 01            [ 2]  803 1$: ldw (BCNT,sp),y
      0083F2 A6 10            [ 1]  804 	ld a,#16
      0083F4 90 A3 00 10      [ 2]  805 	cpw y,#16
      0083F8 2A 02            [ 1]  806 	jrpl 2$
      0083FA 90 9F            [ 1]  807 	ld a,yl
      0083FC                        808 2$: 	
      0083FC CD 83 AB         [ 4]  809 	call show_row 
      0083FF 16 01            [ 2]  810 	ldw y,(BCNT,sp) 
      008401 72 A2 00 10      [ 2]  811 	subw y,#16 
      008405 90 A3 00 01      [ 2]  812 	cpw y,#1
      008409 2A E5            [ 1]  813 	jrpl 1$
      00840B 7B 03            [ 1]  814 	ld a,(BASE,sp)
      00840D C7 00 0B         [ 1]  815 	ld base,a
      008410 7B 04            [ 1]  816 	ld a,(TABW,sp)
      008412 C7 00 22         [ 1]  817 	ld tab_width,a 
      000395                        818 	_drop VSIZE
      008415 5B 04            [ 2]    1     addw sp,#VSIZE 
      008417 84               [ 1]  819 	pop a 
      008418 81               [ 4]  820 	ret 
                                    821 
                                    822 ;-------------------------------------
                                    823 ; retrun string length
                                    824 ; input:
                                    825 ;   X         .asciz  pointer 
                                    826 ; output:
                                    827 ;   X         not affected 
                                    828 ;   A         length 
                                    829 ;-------------------------------------
      008419                        830 strlen::
      008419 89               [ 2]  831 	pushw x 
      00841A 4F               [ 1]  832 	clr a
      00841B 7D               [ 1]  833 1$:	tnz (x) 
      00841C 27 04            [ 1]  834 	jreq 9$ 
      00841E 4C               [ 1]  835 	inc a 
      00841F 5C               [ 1]  836 	incw x 
      008420 20 F9            [ 2]  837 	jra 1$ 
      008422 85               [ 2]  838 9$:	popw x 
      008423 81               [ 4]  839 	ret 
                                    840 
                                    841 ;------------------------------------
                                    842 ; compare 2 strings
                                    843 ; input:
                                    844 ;   X 		char* first string 
                                    845 ;   Y       char* second string 
                                    846 ; output:
                                    847 ;   A 		0|1 
                                    848 ;-------------------------------------
      008424                        849 strcmp:
      008424 F6               [ 1]  850 	ld a,(x)
      008425 27 0B            [ 1]  851 	jreq 5$ 
      008427 90 F1            [ 1]  852 	cp a,(y) 
      008429 26 05            [ 1]  853 	jrne 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      00842B 5C               [ 1]  854 	incw x 
      00842C 90 5C            [ 1]  855 	incw y 
      00842E 20 F4            [ 2]  856 	jra strcmp 
      008430                        857 4$: ; not same  
      008430 4F               [ 1]  858 	clr a 
      008431 81               [ 4]  859 	ret 
      008432                        860 5$: ; same 
      008432 A6 01            [ 1]  861 	ld a,#1 
      008434 81               [ 4]  862 	ret 
                                    863 
                                    864 
                                    865 ;---------------------------------------
                                    866 ;  copy src to dest 
                                    867 ; input:
                                    868 ;   X 		dest 
                                    869 ;   Y 		src 
                                    870 ; output: 
                                    871 ;   X 		dest 
                                    872 ;----------------------------------
      008435                        873 strcpy::
      008435 88               [ 1]  874 	push a 
      008436 89               [ 2]  875 	pushw x 
      008437 90 F6            [ 1]  876 1$: ld a,(y)
      008439 27 06            [ 1]  877 	jreq 9$ 
      00843B F7               [ 1]  878 	ld (x),a 
      00843C 5C               [ 1]  879 	incw x 
      00843D 90 5C            [ 1]  880 	incw y 
      00843F 20 F6            [ 2]  881 	jra 1$ 
      008441 7F               [ 1]  882 9$:	clr (x)
      008442 85               [ 2]  883 	popw x 
      008443 84               [ 1]  884 	pop a 
      008444 81               [ 4]  885 	ret 
                                    886 
                                    887 ;---------------------------------------
                                    888 ; move memory block 
                                    889 ; input:
                                    890 ;   X 		destination 
                                    891 ;   Y 	    source 
                                    892 ;   acc16	bytes count 
                                    893 ; output:
                                    894 ;   none 
                                    895 ;--------------------------------------
                           000001   896 	INCR=1 ; increament high byte 
                           000002   897 	LB=2 ; increament low byte 
                           000002   898 	VSIZE=2
      008445                        899 move::
      008445 88               [ 1]  900 	push a 
      0003C6                        901 	_vars VSIZE 
      008446 52 02            [ 2]    1     sub sp,#VSIZE 
      008448 0F 01            [ 1]  902 	clr (INCR,sp)
      00844A 0F 02            [ 1]  903 	clr (LB,sp)
      00844C 90 89            [ 2]  904 	pushw y 
      00844E 13 01            [ 2]  905 	cpw x,(1,sp) ; compare DEST to SRC 
      008450 90 85            [ 2]  906 	popw y 
      008452 27 31            [ 1]  907 	jreq move_exit ; x==y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008454 2B 0E            [ 1]  908 	jrmi move_down
      008456                        909 move_up: ; start from top address with incr=-1
      008456 72 BB 00 0D      [ 2]  910 	addw x,acc16
      00845A 72 B9 00 0D      [ 2]  911 	addw y,acc16
      00845E 03 01            [ 1]  912 	cpl (INCR,sp)
      008460 03 02            [ 1]  913 	cpl (LB,sp)   ; increment = -1 
      008462 20 05            [ 2]  914 	jra move_loop  
      008464                        915 move_down: ; start from bottom address with incr=1 
      008464 5A               [ 2]  916     decw x 
      008465 90 5A            [ 2]  917 	decw y
      008467 0C 02            [ 1]  918 	inc (LB,sp) ; incr=1 
      008469                        919 move_loop:	
      008469 C6 00 0D         [ 1]  920     ld a, acc16 
      00846C CA 00 0E         [ 1]  921 	or a, acc8
      00846F 27 14            [ 1]  922 	jreq move_exit 
      008471 72 FB 01         [ 2]  923 	addw x,(INCR,sp)
      008474 72 F9 01         [ 2]  924 	addw y,(INCR,sp) 
      008477 90 F6            [ 1]  925 	ld a,(y)
      008479 F7               [ 1]  926 	ld (x),a 
      00847A 89               [ 2]  927 	pushw x 
      00847B CE 00 0D         [ 2]  928 	ldw x,acc16 
      00847E 5A               [ 2]  929 	decw x 
      00847F CF 00 0D         [ 2]  930 	ldw acc16,x 
      008482 85               [ 2]  931 	popw x 
      008483 20 E4            [ 2]  932 	jra move_loop
      008485                        933 move_exit:
      000405                        934 	_drop VSIZE
      008485 5B 02            [ 2]    1     addw sp,#VSIZE 
      008487 84               [ 1]  935 	pop a 
      008488 81               [ 4]  936 	ret 	
                                    937 
                                    938 ;------------------------------------
                                    939 ;  set all variables to zero 
                                    940 ; input:
                                    941 ;   none 
                                    942 ; output:
                                    943 ;	none
                                    944 ;------------------------------------
      008489                        945 clear_vars:
      008489 89               [ 2]  946 	pushw x 
      00848A 90 89            [ 2]  947 	pushw y 
      00848C AE 00 2D         [ 2]  948 	ldw x,#vars 
      00848F 90 AE 00 34      [ 2]  949 	ldw y,#2*26 
      008493 7F               [ 1]  950 1$:	clr (x)
      008494 5C               [ 1]  951 	incw x 
      008495 90 5A            [ 2]  952 	decw y 
      008497 26 FA            [ 1]  953 	jrne 1$
      008499 90 85            [ 2]  954 	popw y 
      00849B 85               [ 2]  955 	popw x 
      00849C 81               [ 4]  956 	ret 
                                    957 
                                    958 ;-------------------------------------
                                    959 ; check if A is a letter 
                                    960 ; input:
                                    961 ;   A 			character to test 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    962 ; output:
                                    963 ;   C flag      1 true, 0 false 
                                    964 ;-------------------------------------
      00849D                        965 is_alpha::
      00849D A1 41            [ 1]  966 	cp a,#'A 
      00849F 8C               [ 1]  967 	ccf 
      0084A0 24 0B            [ 1]  968 	jrnc 9$ 
      0084A2 A1 5B            [ 1]  969 	cp a,#'Z+1 
      0084A4 25 07            [ 1]  970 	jrc 9$ 
      0084A6 A1 61            [ 1]  971 	cp a,#'a 
      0084A8 8C               [ 1]  972 	ccf 
      0084A9 24 02            [ 1]  973 	jrnc 9$
      0084AB A1 7B            [ 1]  974 	cp a,#'z+1
      0084AD 81               [ 4]  975 9$: ret 	
                                    976 
                                    977 ;------------------------------------
                                    978 ; check if character in {'0'..'9'}
                                    979 ; input:
                                    980 ;    A  character to test
                                    981 ; output:
                                    982 ;    Carry  0 not digit | 1 digit
                                    983 ;------------------------------------
      0084AE                        984 is_digit::
      0084AE A1 30            [ 1]  985 	cp a,#'0
      0084B0 25 03            [ 1]  986 	jrc 1$
      0084B2 A1 3A            [ 1]  987     cp a,#'9+1
      0084B4 8C               [ 1]  988 	ccf 
      0084B5 8C               [ 1]  989 1$:	ccf 
      0084B6 81               [ 4]  990     ret
                                    991 
                                    992 ;-------------------------------------
                                    993 ; return true if character in  A 
                                    994 ; is letter or digit.
                                    995 ; input:
                                    996 ;   A     ASCII character 
                                    997 ; output:
                                    998 ;   A     no change 
                                    999 ;   Carry    0 false| 1 true 
                                   1000 ;--------------------------------------
      0084B7                       1001 is_alnum::
      0084B7 CD 84 AE         [ 4] 1002 	call is_digit
      0084BA 25 03            [ 1] 1003 	jrc 1$ 
      0084BC CD 84 9D         [ 4] 1004 	call is_alpha
      0084BF 81               [ 4] 1005 1$:	ret 
                                   1006 
                                   1007 
                                   1008 ;-------------------------------------
                                   1009 ;  program initialization entry point 
                                   1010 ;-------------------------------------
                           000002  1011 	MAJOR=2
                           000000  1012 	MINOR=0 
      0084C0 0A 0A 54 69 6E 79 20  1013 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal  67-Bits]



             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
      000486                       1014 cold_start:
                                   1015 ;set stack 
      0084DD 68 74 2C         [ 2] 1016 	ldw x,#STACK_EMPTY
      0084E0 20               [ 1] 1017 	ldw sp,x   
                                   1018 ; clear all ram 
      0084E1 4A               [ 1] 1019 0$: clr (x)
      0084E2 61               [ 2] 1020 	decw x 
      0084E3 63 71            [ 1] 1021 	jrne 0$
                                   1022 ; activate pull up on all inputs 
      0084E5 75 65            [ 1] 1023 	ld a,#255 
      0084E7 73 20 44         [ 1] 1024 	ld PA_CR1,a 
      0084EA 65 73 63         [ 1] 1025 	ld PB_CR1,a 
      0084ED 68 65 6E         [ 1] 1026 	ld PC_CR1,a 
      0084F0 65 73 20         [ 1] 1027 	ld PD_CR1,a 
      0084F3 32 30 31         [ 1] 1028 	ld PE_CR1,a 
      0084F6 39 2C 32         [ 1] 1029 	ld PF_CR1,a 
      0084F9 30 32 32         [ 1] 1030 	ld PG_CR1,a 
      0084FC 0A 76 65         [ 1] 1031 	ld PI_CR1,a
                                   1032 ; set LD2 pin as output 
      0084FF 72 73 69 6F      [ 1] 1033     bset PC_CR1,#LED2_BIT
      008503 6E 20 00 0E      [ 1] 1034     bset PC_CR2,#LED2_BIT
      008506 72 1A 50 0C      [ 1] 1035     bset PC_DDR,#LED2_BIT
      008506 AE 17 FF 94      [ 1] 1036 	bres PC_ODR,#LED2_BIT 
                                   1037 ; disable schmitt triggers on Arduino CN4 analog inputs
      00850A 7F 5A 26 FC A6   [ 1] 1038 	mov ADC_TDRL,0x3f
                                   1039 ; disable peripherals clocks
                                   1040 ;	clr CLK_PCKENR1 
                                   1041 ;	clr CLK_PCKENR2
      00850F FF C7 50 03      [ 1] 1042 	clr AWU_TBR 
      008513 C7 50 08 C7      [ 1] 1043 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1044 ; select internal clock no divisor: 16 Mhz 	
      008517 50 0D            [ 1] 1045 	ld a,#CLK_SWR_HSI 
      008519 C7               [ 1] 1046 	clrw x  
      00851A 50 12 C7         [ 4] 1047     call clock_init 
      00851D 50 17 C7         [ 4] 1048 	call timer4_init
      008520 50 1C C7         [ 4] 1049 	call timer2_init
                                   1050 ; UART1 at 115200 BAUD
      008523 50 21 C7         [ 4] 1051 	call uart1_init
                                   1052 ; activate PE_4 (user button interrupt)
      008526 50 2B 72 1A      [ 1] 1053     bset PE_CR2,#USR_BTN_BIT 
                                   1054 ; display system information
      00852A 50 0D 72         [ 2] 1055 	ldw x,#software 
      00852D 1A 50 0E         [ 4] 1056 	call puts 
      008530 72 1A            [ 1] 1057 	ld a,#MAJOR 
      008532 50 0C 72         [ 1] 1058 	ld acc8,a 
      008535 1B               [ 1] 1059 	clrw x 
      008536 50 0A 55         [ 2] 1060 	ldw acc24,x
      008539 00 3F 54 07      [ 1] 1061 	clr tab_width  
      00853D 72 5F 50 F2      [ 1] 1062 	mov base, #10 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008541 72 14 50         [ 4] 1063 	call prti24 
      008544 CA A6            [ 1] 1064 	ld a,#'.
      008546 E1 5F CD         [ 4] 1065 	call putc 
      008549 81 23            [ 1] 1066 	ld a,#MINOR 
      00854B CD 81 46         [ 1] 1067 	ld acc8,a 
      00854E CD               [ 1] 1068 	clrw x 
      00854F 81 39 CD         [ 2] 1069 	ldw acc24,x 
      008552 82 FC 72         [ 4] 1070 	call prti24
      008555 18 50            [ 1] 1071 	ld a,#CR 
      008557 18 AE 84         [ 4] 1072 	call putc
      00855A C0               [ 1] 1073 	rim 
      00855B CD A0 DC A6      [ 1] 1074 	inc seedy+1 
      00855F 02 C7 00 0E      [ 1] 1075 	inc seedx+1 
      008563 5F CF 00         [ 4] 1076 	call clear_basic
      008566 0C 72 5F         [ 4] 1077 	call ubound 
      008569 00 22 35         [ 4] 1078 	call beep_1khz  
      00051A                       1079 2$:	
      00856C 0A 00 0B         [ 4] 1080 	call warm_init
                                   1081 ; check for application in flash memory 
      00856F CD 89 1B         [ 2] 1082 	ldw x,app_sign 
      008572 A6 2E CD         [ 2] 1083 	cpw x,SIGNATURE 
      008575 83 41            [ 1] 1084 	jreq run_app
      008577 A6 00 C7         [ 2] 1085 	jp cmd_line
      000528                       1086 run_app:
                                   1087 ; run application in FLASH|EEPROM 
      00857A 00 0E 5F         [ 2] 1088 	ldw x,app_size  
      00857D CF               [ 2] 1089 	pushw x 
      00857E 00 0C CD         [ 2] 1090 	ldw x,#app 
      008581 89 1B A6         [ 2] 1091 	ldw txtbgn,x
      008584 0D CD 83         [ 2] 1092 	ldw basicptr,x 
      008587 41 9A 72         [ 2] 1093 	addw x,(1,sp) ; x+size 
      000538                       1094 	_drop 2 
      00858A 5C 00            [ 2]    1     addw sp,#2 
      00858C 16 72 5C         [ 2] 1095 	ldw txtend,x 
      00858F 00 14 CD         [ 2] 1096 	ldw x,#RUNNING 
      008592 86 29 CD         [ 4] 1097 	call puts
      008595 8E C2 CD         [ 2] 1098 	ldw x,basicptr    
      008598 93 4E 00 0A      [ 1] 1099 	mov base,#16 
      00859A CD 08 8B         [ 4] 1100 	call print_int
      00859A CD 86 0B CE      [ 1] 1101 	mov base,#10  
      00859E AA 80 C3         [ 2] 1102 	ldw x, basicptr 
      0085A1 95 D0            [ 1] 1103 	ld a,(2,x)
      0085A3 27 03 CC         [ 1] 1104 	ld count,a 
      0085A6 88 48 00 01      [ 1] 1105 	mov in,#3 
      0085A8 72 10 00 20      [ 1] 1106 	bset flags,#FRUN
      0085A8 CE AA 82         [ 4] 1107 	call ubound   
      0085AB 89 AE AA         [ 2] 1108 	jp interpreter  
      0085AE 84 CF            [ 2] 1109     jra .  
                                   1110 
      0085B0 00 1A CF 00 05 72 FB  1111 RUNNING: .asciz "\nrunning application at address: " 
             01 5B 02 CF 00 1C AE
             85 E9 CD A0 DC CE 00
             05 35 10 00 0B CD 89
             0B 35 0A 00 0B CE
                                   1112 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00058B                       1113 warm_init:
      0085D2 00 05 E6 02      [ 1] 1114 	clr flags 
      0085D6 C7 00 04 35      [ 1] 1115 	clr loop_depth 
      0085DA 03 00 02 72      [ 1] 1116 	mov tab_width,#TAB_WIDTH 
      0085DE 10 00 21 CD      [ 1] 1117 	mov base,#10 
      0085E2 8E C2 CC         [ 2] 1118 	ldw x,#0 
      0085E5 88 64 20         [ 2] 1119 	ldw basicptr,x 
      0085E8 FE 0A 72         [ 2] 1120 	ldw in.w,x 
      0085EB 75 6E 6E 69      [ 1] 1121 	clr count
      0085EF 6E               [ 4] 1122 	ret 
                                   1123 
                                   1124 
                                   1125 ;---------------------------
                                   1126 ; reset BASIC text variables 
                                   1127 ; and clear variables 
                                   1128 ;---------------------------
      0005A9                       1129 clear_basic:
      0085F0 67               [ 2] 1130 	pushw x 
      0085F1 20 61 70 70      [ 1] 1131 	clr count
      0085F5 6C 69 63 61      [ 1] 1132 	clr in  
      0085F9 74 69 6F         [ 2] 1133 	ldw x,#free_ram 
      0085FC 6E 20 61         [ 2] 1134 	ldw txtbgn,x 
      0085FF 74 20 61         [ 2] 1135 	ldw txtend,x 
      008602 64 64 72         [ 4] 1136 	call clear_vars 
      008605 65               [ 2] 1137 	popw x
      008606 73               [ 4] 1138 	ret 
                                   1139 
                                   1140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1141 ;;   Tiny BASIC error messages     ;;
                                   1142 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005C0                       1143 err_msg:
      008607 73 3A 20 00 05 ED 05  1144 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             FB 06 14 06 23
      00860B 06 39 06 4F 06 69 06  1145 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             7A 06 8B
      00860B 72 5F 00 21 72 5F 00  1146 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             1E 35 04
                                   1147 
      008615 00 22 35 0A 00 0B AE  1148 err_mem_full: .asciz "Memory full\n" 
             00 00 CF 00 05 CF
      008622 00 01 72 5F 00 04 81  1149 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      008629 6D 61 74 68 20 6F 70  1150 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      008629 89 72 5F 00 04 72 5F  1151 err_div0: .asciz "division by 0\n" 
             00 02 AE 00 80 CF 00
             1A
      008638 CF 00 1C CD 84 89 85  1152 err_no_line: .asciz "invalid line number.\n"
             81 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      008640 72 75 6E 20 74 69 6D  1153 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



             75 73 61 67 65 2E 0A
             00
      008640 00 00 86 60 86 6D 86  1154 err_cmd_only: .asciz "command line only usage.\n"
             7B 86 94 86 A3 86 B9
             86 CF 86 E9 86 FA 87
             0B 87 17 87 4A
      00865A 87 5A 87 6E 87 81 4D  1155 err_duplicate: .asciz "duplicate name.\n"
             65 6D 6F 72 79 20 66
             75 6C 6C
      00866B 0A 00 73 79 6E 74 61  1156 err_not_file: .asciz "File not found.\n"
             78 20 65 72 72 6F 72
             0A 00 6D
      00867C 61 74 68 20 6F 70 65  1157 err_bad_value: .asciz "bad value.\n"
             72 61 74 69 6F
      008688 6E 20 6F 76 65 72 66  1158 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             6C 6F 77 0A 00 64 69
             76 69 73 69 6F 6E 20
             62 79 20 30 0A 00 69
             6E 76 61 6C 69 64 20
             6C 69 6E 65 20 6E 75
             6D 62 65 72 2E 0A 00
             72 75
      0086BB 6E 20 74 69 6D 65 20  1159 err_no_data: .asciz "No data found.\n"
             6F 6E 6C 79 20 75 73
             61 67
      0086CB 65 2E 0A 00 63 6F 6D  1160 err_no_prog: .asciz "No program in RAM!\n"
             6D 61 6E 64 20 6C 69
             6E 65 20 6F 6E 6C
      0086DF 79 20 75 73 61 67 65  1161 err_no_fspace: .asciz "File system full.\n" 
             2E 0A 00 64 75 70 6C
             69 63 61 74 65
      0086F2 20 6E 61 6D 65 2E 0A  1162 err_buf_full: .asciz "Buffer full\n"
             00 46 69 6C 65 20
                                   1163 
      0086FF 6E 6F 74 20 66 6F 75  1164 rt_msg: .asciz "\nrun time error, "
             6E 64 2E 0A 00 62 61
             64 20 76 61
      008711 6C 75 65 2E 0A 00 46  1165 comp_msg: .asciz "\ncompile error, "
             69 6C 65 20 69 6E 20
             65 78 74
      008722 65 6E 64 65 64 20 6D  1166 tk_id: .asciz "last token id: "
             65 6D 6F 72 79 2C 20
             63 61
                                   1167 
      000741                       1168 syntax_error::
      008732 6E 27            [ 1] 1169 	ld a,#ERR_SYNTAX 
                                   1170 
      000743                       1171 tb_error::
      008734 74 20 62 65 20   [ 2] 1172 	btjt flags,#FCOMP,1$
      008739 72               [ 1] 1173 	push a 
      00873A 75 6E 20         [ 2] 1174 	ldw x, #rt_msg 
      00873D 66 72 6F         [ 4] 1175 	call puts 
      008740 6D               [ 1] 1176 	pop a 
      008741 20 74 68         [ 2] 1177 	ldw x, #err_msg 
      008744 65 72 65 2E      [ 1] 1178 	clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008748 0A               [ 1] 1179 	sll a
      008749 00 4E 6F 20      [ 1] 1180 	rlc acc16  
      00874D 64 61 74         [ 1] 1181 	ld acc8, a 
      008750 61 20 66 6F      [ 2] 1182 	addw x,acc16 
      008754 75               [ 2] 1183 	ldw x,(x)
      008755 6E 64 2E         [ 4] 1184 	call puts
      008758 0A 00 4E         [ 2] 1185 	ldw x,basicptr
      00875B 6F 20 70         [ 1] 1186 	ld a,in 
      00875E 72 6F 67         [ 4] 1187 	call prt_basic_line
      008761 72 61 6D         [ 2] 1188 	ldw x,#tk_id 
      008764 20 69 6E         [ 4] 1189 	call puts 
      008767 20 52 41         [ 1] 1190 	ld a,in.saved 
      00876A 4D               [ 1] 1191 	clrw x 
      00876B 21               [ 1] 1192 	ld xl,a 
      00876C 0A 00 46 69      [ 2] 1193 	addw x,basicptr 
      008770 6C               [ 1] 1194 	ld a,(x)
      008771 65               [ 1] 1195 	clrw x 
      008772 20               [ 1] 1196 	ld xl,a 
      008773 73 79 73         [ 4] 1197 	call print_int
      008776 74 65 6D 20 66   [ 2] 1198 	btjf flags,#FAUTORUN ,6$
      00877B 75 6C            [ 2] 1199 	jra 6$
      00078C                       1200 1$:	
      00877D 6C               [ 1] 1201 	push a 
      00877E 2E 0A 00         [ 2] 1202 	ldw x,#comp_msg
      008781 42 75 66         [ 4] 1203 	call puts 
      008784 66               [ 1] 1204 	pop a 
      008785 65 72 20         [ 2] 1205 	ldw x, #err_msg 
      008788 66 75 6C 6C      [ 1] 1206 	clr acc16 
      00878C 0A               [ 1] 1207 	sll a
      00878D 00 0A 72 75      [ 1] 1208 	rlc acc16  
      008791 6E 20 74         [ 1] 1209 	ld acc8, a 
      008794 69 6D 65 20      [ 2] 1210 	addw x,acc16 
      008798 65               [ 2] 1211 	ldw x,(x)
      008799 72 72 6F         [ 4] 1212 	call puts
      00879C 72 2C 20         [ 2] 1213 	ldw x,#tib
      00879F 00 0A 63         [ 4] 1214 	call puts 
      0087A2 6F 6D            [ 1] 1215 	ld a,#CR 
      0087A4 70 69 6C         [ 4] 1216 	call putc
      0087A7 65 20 65         [ 2] 1217 	ldw x,in.w
      0087AA 72 72 6F         [ 4] 1218 	call spaces
      0087AD 72 2C            [ 1] 1219 	ld a,#'^
      0087AF 20 00 6C         [ 4] 1220 	call putc 
      0087B2 61 73 74         [ 2] 1221 6$: ldw x,#STACK_EMPTY 
      0087B5 20               [ 1] 1222     ldw sp,x
      0007C5                       1223 warm_start:
      0087B6 74 6F 6B         [ 4] 1224 	call warm_init
                                   1225 ;----------------------------
                                   1226 ;   BASIC interpreter
                                   1227 ;----------------------------
      0007C8                       1228 cmd_line: ; user interface 
      0087B9 65 6E            [ 1] 1229 	ld a,#CR 
      0087BB 20 69 64         [ 4] 1230 	call putc 
      0087BE 3A 20            [ 1] 1231 	ld a,#'> 
      0087C0 00 02 C1         [ 4] 1232 	call putc
      0087C1 CD 21 61         [ 4] 1233 	call readln
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0087C1 A6 02 00 03      [ 1] 1234 	tnz count 
      0087C3 27 ED            [ 1] 1235 	jreq cmd_line
      0087C3 72 0A 00         [ 4] 1236 	call compile
                                   1237 ; if text begin with a line number
                                   1238 ; the compiler set count to zero    
                                   1239 ; so code is not interpreted
      0087C6 21 44 88 AE      [ 1] 1240 	tnz count 
      0087CA 87 8E            [ 1] 1241 	jreq cmd_line
                                   1242 
                                   1243 ; if direct command 
                                   1244 ; it's ready to interpret 
                                   1245 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1246 ;; This is the interpreter loop
                                   1247 ;; for each BASIC code line. 
                                   1248 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0007E4                       1249 interpreter: 
      0087CC CD A0 DC         [ 1] 1250 	ld a,in 
      0087CF 84 AE 86         [ 1] 1251 	cp a,count 
      0087D2 40 72            [ 1] 1252 	jrmi interp_loop
      0007EC                       1253 next_line:
      0087D4 5F 00 0D 48 72   [ 2] 1254 	btjf flags, #FRUN, cmd_line
      0087D9 59 00 0D         [ 2] 1255 	ldw x,basicptr
      0087DC C7 00 0E 72      [ 2] 1256 	addw x,in.w 
      0087E0 BB 00 0D         [ 2] 1257 	cpw x,txtend 
      0087E3 FE CD            [ 1] 1258 	jrpl warm_start
      0087E5 A0 DC CE         [ 2] 1259 	ldw basicptr,x ; start of next line  
      0087E8 00 05            [ 1] 1260 	ld a,(2,x)
      0087EA C6 00 02         [ 1] 1261 	ld count,a 
      0087ED CD 8F D8 AE      [ 1] 1262 	mov in,#3 ; skip first 3 bytes of line 
      000809                       1263 interp_loop: 
      0087F1 87 B1 CD         [ 4] 1264 	call next_token
      0087F4 A0 DC            [ 1] 1265 	cp a,#TK_NONE 
      0087F6 C6 00            [ 1] 1266 	jreq next_line 
      0087F8 03 5F            [ 1] 1267 	cp a,#TK_CMD
      0087FA 97 72            [ 1] 1268 	jrne 1$
      0087FC BB               [ 4] 1269 	call (x) 
      0087FD 00 05            [ 2] 1270 	jra interp_loop 
      000817                       1271 1$:	 
      0087FF F6 5F            [ 1] 1272 	cp a,#TK_VAR
      008801 97 CD            [ 1] 1273 	jrne 2$
      008803 89 0B 72         [ 4] 1274 	call let_var  
      008806 0D 00            [ 2] 1275 	jra interp_loop 
      000820                       1276 2$:	
      008808 21 37            [ 1] 1277 	cp a,#TK_ARRAY 
      00880A 20 35            [ 1] 1278 	jrne 3$
      00880C CD 0E 5A         [ 4] 1279 	call let_array 
      00880C 88 AE            [ 2] 1280 	jra interp_loop
      000829                       1281 3$:	
      00880E 87 A0            [ 1] 1282 	cp a,#TK_COLON 
      008810 CD A0            [ 1] 1283 	jreq interp_loop 
      008812 DC 84 AE         [ 2] 1284 	jp syntax_error 
                                   1285 
                                   1286 		
                                   1287 ;--------------------------
                                   1288 ; extract next token from
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1289 ; token list 
                                   1290 ; basicptr -> base address 
                                   1291 ; in  -> offset in list array 
                                   1292 ; output:
                                   1293 ;   A 		token attribute
                                   1294 ;   X 		token value if there is one
                                   1295 ;----------------------------------------
      000830                       1296 next_token::
      008815 86               [ 1] 1297 	clrw x 
      008816 40 72 5F         [ 1] 1298 	ld a,in 
                                   1299 ; don't replace sub by "cp a,count" 
                                   1300 ; if end of line must return with A=0   	
      008819 00 0D 48         [ 1] 1301 	sub a,count 
      00881C 72 59            [ 1] 1302 	jreq 9$ ; end of line 
      000839                       1303 0$: 
      00881E 00 0D C7 00 0E   [ 1] 1304 	mov in.saved,in ; in case "_unget_token" needed 
      008823 72 BB 00 0D      [ 2] 1305 	ldw y,basicptr 
      008827 FE CD A0         [ 4] 1306 	ld a,([in.w],y)
      00882A DC AE 16 90      [ 1] 1307 	inc in  
      00882E CD               [ 1] 1308 	tnz a 
      00882F A0 DC            [ 1] 1309 	jrmi 6$
      008831 A6 0D            [ 1] 1310 	cp a,#TK_ARRAY
      008833 CD 83            [ 1] 1311 	jrpl 9$  ; no attribute for these
      000850                       1312 1$: ; 
      008835 41 CE            [ 1] 1313 	cp a,#TK_CHAR
      008837 00 01            [ 1] 1314 	jrne 2$
      008839 CD               [ 1] 1315 	exg a,xl
      00883A A1 49 A6         [ 4] 1316 	ld a,([in.w],y)
      00883D 5E CD 83 41      [ 1] 1317 	inc in 
      008841 AE               [ 1] 1318 	exg a,xl  
      008842 17 FF            [ 2] 1319 	jra 9$ 
      008844 94 02            [ 1] 1320 2$:	cp a,#TK_QSTR 
      008845 26 27            [ 1] 1321 	jrne 9$
      008845 CD               [ 1] 1322 	ldw x,y 
      008846 86 0B 00 00      [ 2] 1323 	addw x,in.w ; pointer to string 
                                   1324 ; move pointer after string 
      008848 91 6D 00         [ 4] 1325 3$:	tnz ([in.w],y)
      008848 A6 0D            [ 1] 1326 	jreq 8$
      00884A CD 83 41 A6      [ 1] 1327 	inc in 
      00884E 3E CD            [ 2] 1328 	jra 3$
      000873                       1329 6$: 
      008850 83 41 CD A1      [ 2] 1330 	addw y,in.w 
      008854 E1 72            [ 2] 1331 	ldw y,(y)
      008856 5D 00            [ 1] 1332 	cp a,#TK_INTGR
      008858 04 27            [ 1] 1333 	jrpl 7$
      00885A ED CD A7 BA      [ 2] 1334 	ldw y,(code_addr,y) 
      00885E 72               [ 1] 1335 7$:	exgw x,y 
      00885F 5D 00 04 27      [ 1] 1336 	inc in
      008863 E4 5C 00 01      [ 1] 1337 8$:	inc in 
      008864                       1338 9$: 
      008864 C6               [ 4] 1339 	ret	
                                   1340 
                                   1341 ;-----------------------------------
                                   1342 ; print a 16 bit integer 
                                   1343 ; using variable 'base' as conversion
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1344 ; format.
                                   1345 ; input:
                                   1346 ;   X       integer to print 
                                   1347 ;   'base'    conversion base 
                                   1348 ; output:
                                   1349 ;   none 
                                   1350 ;-----------------------------------
      00088B                       1351 print_int:
      008865 00 02 C1 00      [ 1] 1352 	clr acc24 
      008869 04 2B 1D         [ 2] 1353 	ldw acc16,x 
      00886C 72 0F 00 0C 04   [ 2] 1354 	btjf acc16,#7,prti24
      00886C 72 01 00 21      [ 1] 1355 	cpl acc24 
                                   1356 	
                                   1357 ;------------------------------------
                                   1358 ; print integer in acc24 
                                   1359 ; input:
                                   1360 ;	acc24 		integer to print 
                                   1361 ;	'base' 		numerical base for conversion 
                                   1362 ;   'tab_width' field width 
                                   1363 ;  output:
                                   1364 ;    A          string length
                                   1365 ;------------------------------------
      00089B                       1366 prti24:
      008870 D7 CE 00         [ 4] 1367     call itoa  ; conversion entier en  .asciz
      008873 05 72 BB         [ 4] 1368 	call right_align  
      008876 00               [ 1] 1369 	push a 
      008877 01 C3 00         [ 4] 1370 	call puts
      00887A 1C               [ 1] 1371 	pop a 
      00887B 2A               [ 4] 1372     ret	
                                   1373 
                                   1374 ;------------------------------------
                                   1375 ; convert integer in acc24 to string
                                   1376 ; input:
                                   1377 ;   'base'	conversion base 
                                   1378 ;	acc24	integer to convert
                                   1379 ; output:
                                   1380 ;   X  		pointer to first char of string
                                   1381 ;   A       string length
                                   1382 ;------------------------------------
                           000001  1383 	SIGN=1  ; integer sign 
                           000002  1384 	LEN=2 
                           000003  1385 	PSTR=3
                           000004  1386 	VSIZE=4 ;locals size
      0008A7                       1387 itoa::
      0008A7                       1388 	_vars VSIZE
      00887C C8 CF            [ 2]    1     sub sp,#VSIZE 
      00887E 00 05            [ 1] 1389 	clr (LEN,sp) ; string length  
      008880 E6 02            [ 1] 1390 	clr (SIGN,sp)    ; sign
      008882 C7 00 04         [ 1] 1391 	ld a,base 
      008885 35 03            [ 1] 1392 	cp a,#10
      008887 00 02            [ 1] 1393 	jrne 1$
                                   1394 	; base 10 string display with negative sign if bit 23==1
      008889 72 0F 00 0B 05   [ 2] 1395 	btjf acc24,#7,1$
      008889 CD 88            [ 1] 1396 	cpl (SIGN,sp)
      00888B B0 A1 00         [ 4] 1397 	call neg_acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0008BE                       1398 1$:
                                   1399 ; initialize string pointer 
      00888E 27 DC A1         [ 2] 1400 	ldw x,#tib 
      008891 80 26 03         [ 2] 1401 	addw x,#TIB_SIZE
      008894 FD               [ 2] 1402 	decw x 
      008895 20               [ 1] 1403 	clr (x)
      008896 F2               [ 2] 1404 	decw x 
      008897 A6 20            [ 1] 1405 	ld a,#32
      008897 A1               [ 1] 1406 	ld (x),a
      008898 85 26            [ 1] 1407 	inc (LEN,sp)
      0008CC                       1408 itoa_loop:
      00889A 05 CD 8E         [ 1] 1409     ld a,base
      00889D DD 20            [ 2] 1410 	ldw (PSTR,sp),x 
      00889F E9 09 12         [ 4] 1411     call divu24_8 ; acc24/A 
      0088A0 1E 03            [ 2] 1412 	ldw x,(PSTR,sp)
      0088A0 A1 06            [ 1] 1413     add a,#'0  ; remainder of division
      0088A2 26 05            [ 1] 1414     cp a,#'9+1
      0088A4 CD 8E            [ 1] 1415     jrmi 2$
      0088A6 DA 20            [ 1] 1416     add a,#7 
      0008DE                       1417 2$:	
      0088A8 E0               [ 2] 1418 	decw x
      0088A9 F7               [ 1] 1419     ld (x),a
      0088A9 A1 0B            [ 1] 1420 	inc (LEN,sp)
                                   1421 	; if acc24==0 conversion done
      0088AB 27 DC CC         [ 1] 1422 	ld a,acc24
      0088AE 87 C1 0C         [ 1] 1423 	or a,acc16
      0088B0 CA 00 0D         [ 1] 1424 	or a,acc8
      0088B0 5F C6            [ 1] 1425     jrne itoa_loop
                                   1426 	;conversion done, next add '$' or '-' as required
      0088B2 00 02 C0         [ 1] 1427 	ld a,base 
      0088B5 00 04            [ 1] 1428 	cp a,#16
      0088B7 27 51            [ 1] 1429 	jreq 8$
      0088B9 7B 01            [ 1] 1430 	ld a,(SIGN,sp)
      0088B9 55 00            [ 1] 1431     jreq 10$
      0088BB 02 00            [ 1] 1432     ld a,#'-
      0088BD 03 90            [ 2] 1433 	jra 9$ 
                                   1434 ; don't print more than 4 digits
                                   1435 ; in hexadecimal to avoid '-' sign 
                                   1436 ; extend display 	
      0088BF CE 00            [ 1] 1437 8$: ld a,(LEN,sp) 
      0088C1 05 91            [ 1] 1438 	cp a,#6 
      0088C3 D6 01            [ 1] 1439 	jrmi 81$
      0088C5 72               [ 1] 1440 	incw x
      0088C6 5C 00            [ 1] 1441 	dec (LEN,sp)
      0088C8 02 4D            [ 2] 1442 	jra 8$
      000907                       1443 81$:	
      0088CA 2B 27            [ 1] 1444 	ld a,#'$ 
      0088CC A1               [ 2] 1445 9$: decw x
      0088CD 06               [ 1] 1446     ld (x),a
      0088CE 2A 3A            [ 1] 1447 	inc (LEN,sp)
      0088D0                       1448 10$:
      0088D0 A1 03            [ 1] 1449 	ld a,(LEN,sp)
      00090F                       1450 	_drop VSIZE
      0088D2 26 0B            [ 2]    1     addw sp,#VSIZE 
      0088D4 41               [ 4] 1451 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1452 
                                   1453 ;-------------------------------------
                                   1454 ; divide uint24_t by uint8_t
                                   1455 ; used to convert uint24_t to string
                                   1456 ; input:
                                   1457 ;	acc24	dividend
                                   1458 ;   A 		divisor
                                   1459 ; output:
                                   1460 ;   acc24	quotient
                                   1461 ;   A		remainder
                                   1462 ;------------------------------------- 
                                   1463 ; offset  on sp of arguments and locals
                           000001  1464 	U8   = 1   ; divisor on stack
                           000001  1465 	VSIZE =1
      000912                       1466 divu24_8:
      0088D5 91               [ 2] 1467 	pushw x ; save x
      0088D6 D6               [ 1] 1468 	push a 
                                   1469 	; ld dividend UU:MM bytes in X
      0088D7 01 72 5C         [ 1] 1470 	ld a, acc24
      0088DA 00               [ 1] 1471 	ld xh,a
      0088DB 02 41 20         [ 1] 1472 	ld a,acc24+1
      0088DE 2B               [ 1] 1473 	ld xl,a
      0088DF A1 02            [ 1] 1474 	ld a,(U8,SP) ; divisor
      0088E1 26               [ 2] 1475 	div x,a ; UU:MM/U8
      0088E2 27               [ 1] 1476 	push a  ;save remainder
      0088E3 93               [ 1] 1477 	ld a,xh
      0088E4 72 BB 00         [ 1] 1478 	ld acc24,a
      0088E7 01               [ 1] 1479 	ld a,xl
      0088E8 91 6D 01         [ 1] 1480 	ld acc24+1,a
      0088EB 27               [ 1] 1481 	pop a
      0088EC 19               [ 1] 1482 	ld xh,a
      0088ED 72 5C 00         [ 1] 1483 	ld a,acc24+2
      0088F0 02               [ 1] 1484 	ld xl,a
      0088F1 20 F5            [ 1] 1485 	ld a,(U8,sp) ; divisor
      0088F3 62               [ 2] 1486 	div x,a  ; R:LL/U8
      0088F3 72 B9            [ 1] 1487 	ld (U8,sp),a ; save remainder
      0088F5 00               [ 1] 1488 	ld a,xl
      0088F6 01 90 FE         [ 1] 1489 	ld acc24+2,a
      0088F9 A1               [ 1] 1490 	pop a
      0088FA 84               [ 2] 1491 	popw x
      0088FB 2A               [ 4] 1492 	ret
                                   1493 
                                   1494 ;--------------------------------------
                                   1495 ; unsigned multiply uint24_t by uint8_t
                                   1496 ; use to convert numerical string to uint24_t
                                   1497 ; input:
                                   1498 ;	acc24	uint24_t 
                                   1499 ;   A		uint8_t
                                   1500 ; output:
                                   1501 ;   acc24   A*acc24
                                   1502 ;-------------------------------------
                                   1503 ; local variables offset  on sp
                           000003  1504 	U8   = 3   ; A pushed on stack
                           000002  1505 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1506 	OVFH = 1  ; multiplication overflow high byte
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                           000003  1507 	VSIZE = 3
      00093A                       1508 mulu24_8:
      0088FC 04               [ 2] 1509 	pushw x    ; save X
                                   1510 	; local variables
      0088FD 90               [ 1] 1511 	push a     ; U8
      0088FE DE               [ 1] 1512 	clrw x     ; initialize overflow to 0
      0088FF 9F               [ 2] 1513 	pushw x    ; multiplication overflow
                                   1514 ; multiply low byte.
      008900 E2 51 72         [ 1] 1515 	ld a,acc24+2
      008903 5C               [ 1] 1516 	ld xl,a
      008904 00 02            [ 1] 1517 	ld a,(U8,sp)
      008906 72               [ 4] 1518 	mul x,a
      008907 5C               [ 1] 1519 	ld a,xl
      008908 00 02 0D         [ 1] 1520 	ld acc24+2,a
      00890A 9E               [ 1] 1521 	ld a, xh
      00890A 81 02            [ 1] 1522 	ld (OVFL,sp),a
                                   1523 ; multipy middle byte
      00890B C6 00 0C         [ 1] 1524 	ld a,acc24+1
      00890B 72               [ 1] 1525 	ld xl,a
      00890C 5F 00            [ 1] 1526 	ld a, (U8,sp)
      00890E 0C               [ 4] 1527 	mul x,a
                                   1528 ; add overflow to this partial product
      00890F CF 00 0D         [ 2] 1529 	addw x,(OVFH,sp)
      008912 72               [ 1] 1530 	ld a,xl
      008913 0F 00 0D         [ 1] 1531 	ld acc24+1,a
      008916 04               [ 1] 1532 	clr a
      008917 72 53            [ 1] 1533 	adc a,#0
      008919 00 0C            [ 1] 1534 	ld (OVFH,sp),a
      00891B 9E               [ 1] 1535 	ld a,xh
      00891B CD 89            [ 1] 1536 	ld (OVFL,sp),a
                                   1537 ; multiply most signficant byte	
      00891D 27 CD A8         [ 1] 1538 	ld a, acc24
      008920 59               [ 1] 1539 	ld xl, a
      008921 88 CD            [ 1] 1540 	ld a, (U8,sp)
      008923 A0               [ 4] 1541 	mul x,a
      008924 DC 84 81         [ 2] 1542 	addw x, (OVFH,sp)
      008927 9F               [ 1] 1543 	ld a, xl
      008927 52 04 0F         [ 1] 1544 	ld acc24,a
      00892A 02 0F            [ 2] 1545     addw sp,#VSIZE
      00892C 01               [ 2] 1546 	popw x
      00892D C6               [ 4] 1547 	ret
                                   1548 
                                   1549 ;------------------------------------
                                   1550 ;  two's complement acc24
                                   1551 ;  input:
                                   1552 ;		acc24 variable
                                   1553 ;  output:
                                   1554 ;		acc24 variable
                                   1555 ;-------------------------------------
      000974                       1556 neg_acc24:
      00892E 00 0B A1 0A      [ 1] 1557 	cpl acc24+2
      008932 26 0A 72 0F      [ 1] 1558 	cpl acc24+1
      008936 00 0C 05 03      [ 1] 1559 	cpl acc24
      00893A 01 CD            [ 1] 1560 	ld a,#1
      00893C 89 F4 0D         [ 1] 1561 	add a,acc24+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      00893E C7 00 0D         [ 1] 1562 	ld acc24+2,a
      00893E AE               [ 1] 1563 	clr a
      00893F 16 90 1C         [ 1] 1564 	adc a,acc24+1
      008942 00 50 5A         [ 1] 1565 	ld acc24+1,a 
      008945 7F               [ 1] 1566 	clr a 
      008946 5A A6 20         [ 1] 1567 	adc a,acc24 
      008949 F7 0C 02         [ 1] 1568 	ld acc24,a 
      00894C 81               [ 4] 1569 	ret
                                   1570 
                                   1571 
                                   1572 
                                   1573 
                                   1574 ;------------------------------------
                                   1575 ; convert alpha to uppercase
                                   1576 ; input:
                                   1577 ;    a  character to convert
                                   1578 ; output:
                                   1579 ;    a  uppercase character
                                   1580 ;------------------------------------
      000997                       1581 to_upper::
      00894C C6 00            [ 1] 1582 	cp a,#'a
      00894E 0B 1F            [ 1] 1583 	jrpl 1$
      008950 03               [ 4] 1584 0$:	ret
      008951 CD 89            [ 1] 1585 1$: cp a,#'z	
      008953 92 1E            [ 1] 1586 	jrugt 0$
      008955 03 AB            [ 1] 1587 	sub a,#32
      008957 30               [ 4] 1588 	ret
                                   1589 	
                                   1590 ;------------------------------------
                                   1591 ; convert pad content in integer
                                   1592 ; input:
                                   1593 ;    x		.asciz to convert
                                   1594 ; output:
                                   1595 ;    acc24      int24_t
                                   1596 ;------------------------------------
                                   1597 	; local variables
                           000001  1598 	SIGN=1 ; 1 byte, 
                           000002  1599 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  1600 	TEMP=3 ; 1 byte, temporary storage
                           000003  1601 	VSIZE=3 ; 3 bytes reserved for local storage
      0009A3                       1602 atoi24::
      008958 A1               [ 2] 1603 	pushw x 
      0009A4                       1604 	_vars VSIZE
      008959 3A 2B            [ 2]    1     sub sp,#VSIZE 
                                   1605 	; acc24=0 
      00895B 02 AB 07 0B      [ 1] 1606 	clr acc24    
      00895E 72 5F 00 0C      [ 1] 1607 	clr acc16
      00895E 5A F7 0C 02      [ 1] 1608 	clr acc8 
      008962 C6 00            [ 1] 1609 	clr (SIGN,sp)
      008964 0C CA            [ 1] 1610 	ld a,#10
      008966 00 0D            [ 1] 1611 	ld (BASE,sp),a ; default base decimal
      008968 CA               [ 1] 1612 	ld a,(x)
      008969 00 0E            [ 1] 1613 	jreq 9$  ; completed if 0
      00896B 26 DF            [ 1] 1614 	cp a,#'-
      00896D C6 00            [ 1] 1615 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      00896F 0B A1            [ 1] 1616 	cpl (SIGN,sp)
      008971 10 27            [ 2] 1617 	jra 2$
      008973 08 7B            [ 1] 1618 1$: cp a,#'$
      008975 01 27            [ 1] 1619 	jrne 3$
      008977 15 A6            [ 1] 1620 	ld a,#16
      008979 2D 20            [ 1] 1621 	ld (BASE,sp),a
      00897B 0D               [ 1] 1622 2$:	incw x
      00897C 7B               [ 1] 1623 	ld a,(x)
      0009CD                       1624 3$:	
      00897D 02 A1            [ 1] 1625 	cp a,#'a
      00897F 06 2B            [ 1] 1626 	jrmi 4$
      008981 05 5C            [ 1] 1627 	sub a,#32
      008983 0A 02            [ 1] 1628 4$:	cp a,#'0
      008985 20 F5            [ 1] 1629 	jrmi 9$
      008987 A0 30            [ 1] 1630 	sub a,#'0
      008987 A6 24            [ 1] 1631 	cp a,#10
      008989 5A F7            [ 1] 1632 	jrmi 5$
      00898B 0C 02            [ 1] 1633 	sub a,#7
      00898D 11 02            [ 1] 1634 	cp a,(BASE,sp)
      00898D 7B 02            [ 1] 1635 	jrpl 9$
      00898F 5B 04            [ 1] 1636 5$:	ld (TEMP,sp),a
      008991 81 02            [ 1] 1637 	ld a,(BASE,sp)
      008992 CD 09 3A         [ 4] 1638 	call mulu24_8
      008992 89 88            [ 1] 1639 	ld a,(TEMP,sp)
      008994 C6 00 0C         [ 1] 1640 	add a,acc24+2
      008997 95 C6 00         [ 1] 1641 	ld acc24+2,a
      00899A 0D               [ 1] 1642 	clr a
      00899B 97 7B 01         [ 1] 1643 	adc a,acc24+1
      00899E 62 88 9E         [ 1] 1644 	ld acc24+1,a
      0089A1 C7               [ 1] 1645 	clr a
      0089A2 00 0C 9F         [ 1] 1646 	adc a,acc24
      0089A5 C7 00 0D         [ 1] 1647 	ld acc24,a
      0089A8 84 95            [ 2] 1648 	jra 2$
      0089AA C6 00            [ 1] 1649 9$:	tnz (SIGN,sp)
      0089AC 0E 97            [ 1] 1650     jreq atoi_exit
      0089AE 7B 01 62         [ 4] 1651     call neg_acc24
      000A09                       1652 atoi_exit: 
      000A09                       1653 	_drop VSIZE
      0089B1 6B 01            [ 2]    1     addw sp,#VSIZE 
      0089B3 9F               [ 2] 1654 	popw x ; restore x
      0089B4 C7               [ 4] 1655 	ret
                                   1656 
                                   1657 
                                   1658 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1659 ;;   TINY BASIC  operators,
                                   1660 ;;   commands and functions 
                                   1661 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1662 
                                   1663 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1664 ;;  Arithmetic operators
                                   1665 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1666 
                                   1667 ;debug support
                           000001  1668 DEBUG_PRT=1
                           000001  1669 .if DEBUG_PRT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                           000001  1670 	REGA=1
                           000002  1671 	SAVEB=2
                           000003  1672 	REGX=3
                           000005  1673 	REGY=5
                           000007  1674 	ACC24=7
                           000009  1675 	VSIZE=9 
      000A0D                       1676 printxy:
      000A0D                       1677 	_vars VSIZE 
      0089B5 00 0E            [ 2]    1     sub sp,#VSIZE 
      0089B7 84 85            [ 1] 1678 	ld (REGA,sp),a 
      0089B9 81 00 0A         [ 1] 1679 	ld a,base 
      0089BA 6B 02            [ 1] 1680 	ld (SAVEB,sp),a
      0089BA 89 88            [ 2] 1681 	ldw (REGX,sp),x
      0089BC 5F 89            [ 2] 1682 	ldw (REGY,sp),y
      0089BE C6 00 0E         [ 2] 1683 	ldw x,acc24 
      0089C1 97 7B 03         [ 1] 1684 	ld a,acc8 
      0089C4 42 9F            [ 2] 1685 	ldw (ACC24,sp),x 
      0089C6 C7 00            [ 1] 1686 	ld (ACC24+2,sp),a 
      0089C8 0E 9E 6B 02      [ 1] 1687 	mov base,#16 
      0089CC C6               [ 1] 1688 	clrw x 
      0089CD 00 0D            [ 1] 1689 	ld a,(REGA,sp)
      0089CF 97               [ 1] 1690 	ld xl,a 
      0089D0 7B 03 42         [ 4] 1691 	call print_int
      0089D3 72 FB            [ 1] 1692 	ld a,#SPACE 
      0089D5 01 9F C7         [ 4] 1693 	call putc  
      0089D8 00 0D            [ 2] 1694 	ldw x,(REGX,sp)
      0089DA 4F A9 00         [ 4] 1695 	call print_int 
      0089DD 6B 01            [ 1] 1696 	ld a,#SPACE 
      0089DF 9E 6B 02         [ 4] 1697 	call putc  
      0089E2 C6 00            [ 2] 1698 	ldw x,(REGY,sp)
      0089E4 0C 97 7B         [ 4] 1699 	call print_int 
      0089E7 03 42            [ 1] 1700 	ld a,#CR 
      0089E9 72 FB 01         [ 4] 1701 	call putc 
      0089EC 9F C7            [ 1] 1702 	ld a,(ACC24+2,sp)
      0089EE 00 0C            [ 2] 1703 	ldw x,(ACC24,sp)
      0089F0 5B 03 85         [ 2] 1704 	ldw acc24,x 
      0089F3 81 00 0D         [ 1] 1705 	ld acc8,a
      0089F4 7B 02            [ 1] 1706 	ld a,(SAVEB,sp)
      0089F4 72 53 00         [ 1] 1707 	ld base,a 
      0089F7 0E 72            [ 1] 1708 	ld a,(REGA,sp)
      0089F9 53 00            [ 2] 1709 	ldw x,(REGX,sp)
      0089FB 0D 72            [ 2] 1710 	ldw y,(REGY,sp)
      000A5D                       1711 	_drop VSIZE 
      0089FD 53 00            [ 2]    1     addw sp,#VSIZE 
      0089FF 0C               [ 4] 1712 	ret 
                                   1713 .endif 
                                   1714 
                                   1715 
                                   1716 ;--------------------------------------
                                   1717 ;  multiply 2 uint16_t return uint32_t
                                   1718 ;  input:
                                   1719 ;     x       uint16_t 
                                   1720 ;     y       uint16_t 
                                   1721 ;  output:
                                   1722 ;     x       product bits 15..0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1723 ;     y       product bits 31..16 
                                   1724 ;---------------------------------------
                           000001  1725 		U1=1  ; uint16_t 
                           000003  1726 		DBL=3 ; uint32_t
                           000006  1727 		VSIZE=6
      000A60                       1728 umstar:
      000A60                       1729 	_vars VSIZE 
      008A00 A6 01            [ 2]    1     sub sp,#VSIZE 
      008A02 CB 00            [ 2] 1730 	ldw (U1,sp),x 
                                   1731 ;initialize bits 31..16 of 
                                   1732 ;product to zero 
      008A04 0E C7            [ 1] 1733 	clr (DBL,sp)
      008A06 00 0E            [ 1] 1734 	clr (DBL+1,sp)
                                   1735 ; produc U1L*U2L 
      008A08 4F C9            [ 1] 1736 	ld a,yl 
      008A0A 00               [ 4] 1737 	mul x,a 
      008A0B 0D C7            [ 2] 1738 	ldw (DBL+2,sp),x
                                   1739 ; product U1H*U2L 
      008A0D 00 0D            [ 1] 1740 	ld a,(U1,sp) ; xh 
      008A0F 4F               [ 1] 1741 	ldw x,y
      008A10 C9               [ 4] 1742 	mul x,a 
      008A11 00               [ 1] 1743 	clr a 
      008A12 0C C7 00         [ 2] 1744 	addw x,(DBL+1,sp) 
      008A15 0C               [ 1] 1745 	clr a 
      008A16 81 03            [ 1] 1746 	adc a,(DBL,sp) 
      008A17 6B 03            [ 1] 1747 	ld (DBL,sp),a ; bits 23..17 
      008A17 A1 61            [ 2] 1748 	ldw (DBL+1,sp),x ; bits 15..0 
                                   1749 ; product U1L*U2H
      008A19 2A 01            [ 1] 1750 	swapw y 
      008A1B 81               [ 1] 1751 	ldw x,y
      008A1C A1 7A            [ 1] 1752 	ld a,(U1+1,sp)
      008A1E 22               [ 4] 1753 	mul x,a
      008A1F FB A0 20         [ 2] 1754 	addw x,(DBL+1,sp)
      008A22 81               [ 1] 1755 	clr a 
      008A23 19 03            [ 1] 1756 	adc a,(DBL,sp)
      008A23 89 52            [ 1] 1757 	ld (DBL,sp),a 
      008A25 03 72            [ 2] 1758 	ldw (DBL+1,sp),x 
                                   1759 ; product U1H*U2H 	
      008A27 5F 00            [ 1] 1760 	ld a,(U1,sp)
      008A29 0C               [ 1] 1761 	ldw x,y  
      008A2A 72               [ 4] 1762 	mul x,a 
      008A2B 5F 00 0D         [ 2] 1763 	addw x,(DBL,sp)
      008A2E 72 5F            [ 1] 1764 	ldw y,x 
      008A30 00 0E            [ 2] 1765 	ldw x,(DBL+2,sp)
      000A97                       1766 	_drop VSIZE 
      008A32 0F 01            [ 2]    1     addw sp,#VSIZE 
      008A34 A6               [ 4] 1767 	ret
                                   1768 
                                   1769 
                                   1770 ;-------------------------------------
                                   1771 ; multiply 2 integers
                                   1772 ; input:
                                   1773 ;  	x       n1 
                                   1774 ;   y 		n2 
                                   1775 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1776 ;	X        N1*N2 bits 15..0
                                   1777 ;   Y        N1*N2 bits 31..16 
                                   1778 ;-------------------------------------
                           000001  1779 	SIGN=1
                           000001  1780 	VSIZE=1
      000A9A                       1781 multiply:
      000A9A                       1782 	_vars VSIZE 
      008A35 0A 6B            [ 2]    1     sub sp,#VSIZE 
      008A37 02 F6            [ 1] 1783 	clr (SIGN,sp)
      008A39 27               [ 1] 1784 	ld a,xh 
      008A3A 47 A1            [ 1] 1785 	and a,#0x80
      008A3C 2D 26            [ 1] 1786 	jrpl 1$
      008A3E 04 03            [ 1] 1787 	cpl (SIGN,sp)
      008A40 01               [ 2] 1788 	negw x 
      000AA6                       1789 1$:	
      008A41 20 08            [ 1] 1790 	ld a,yh
      008A43 A1 24            [ 1] 1791 	and a,#0x80  
      008A45 26 06            [ 1] 1792 	jrpl 2$ 
      008A47 A6 10            [ 1] 1793 	cpl (SIGN,sp)
      008A49 6B 02            [ 2] 1794 	negw y 
      000AB0                       1795 2$:	
      008A4B 5C F6 60         [ 4] 1796 	call umstar
      008A4D 7B 01            [ 1] 1797 	ld a,(SIGN,sp)
      008A4D A1 61            [ 1] 1798 	jreq 3$
      008A4F 2B 02 A0         [ 4] 1799 	call dneg 
      000ABA                       1800 3$:	
      000ABA                       1801 	_drop VSIZE 
      008A52 20 A1            [ 2]    1     addw sp,#VSIZE 
      008A54 30               [ 4] 1802 	ret
                                   1803 
                                   1804 ;--------------------------------------
                                   1805 ; divide uint32_t/uint16_t
                                   1806 ; return:  quotient and remainder 
                                   1807 ; quotient expected to be uint16_t 
                                   1808 ; input:
                                   1809 ;   DBLDIVDND    on stack 
                                   1810 ;   X            divisor 
                                   1811 ; output:
                                   1812 ;   X            quotient 
                                   1813 ;   Y            remainder 
                                   1814 ;---------------------------------------
                           000003  1815 	VSIZE=3
      000ABD                       1816 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000ABD                       1817 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   1818 	; local variables 
                           000001  1819 	DIVISOR=1 
                           000003  1820 	CNTR=3 
      000ABD                       1821 udiv32_16:
      000ABD                       1822 	_vars VSIZE 
      008A55 2B 2B            [ 2]    1     sub sp,#VSIZE 
      008A57 A0 30            [ 2] 1823 	ldw (DIVISOR,sp),x	; save divisor 
      008A59 A1 0A            [ 2] 1824 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008A5B 2B 06            [ 2] 1825 	ldw y,(DBLDIVDND,sp) ; bits 31..16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008A5D A0 07            [ 2] 1826 	tnzw y
      008A5F 11 02            [ 1] 1827 	jrne long_division 
      008A61 2A 1F            [ 2] 1828 	ldw y,(DIVISOR,sp)
      008A63 6B               [ 2] 1829 	divw x,y
      000ACC                       1830 	_drop VSIZE 
      008A64 03 7B            [ 2]    1     addw sp,#VSIZE 
      008A66 02               [ 4] 1831 	ret
      000ACF                       1832 long_division:
      008A67 CD               [ 1] 1833 	exgw x,y ; hi in x, lo in y 
      008A68 89 BA            [ 1] 1834 	ld a,#17 
      008A6A 7B 03            [ 1] 1835 	ld (CNTR,sp),a
      000AD4                       1836 1$:
      008A6C CB 00            [ 2] 1837 	cpw x,(DIVISOR,sp)
      008A6E 0E C7            [ 1] 1838 	jrmi 2$
      008A70 00 0E 4F         [ 2] 1839 	subw x,(DIVISOR,sp)
      008A73 C9               [ 1] 1840 2$:	ccf 
      008A74 00 0D            [ 2] 1841 	rlcw y 
      008A76 C7               [ 2] 1842 	rlcw x 
      008A77 00 0D            [ 1] 1843 	dec (CNTR,sp)
      008A79 4F C9            [ 1] 1844 	jrne 1$
      008A7B 00               [ 1] 1845 	exgw x,y 
      000AE4                       1846 	_drop VSIZE 
      008A7C 0C C7            [ 2]    1     addw sp,#VSIZE 
      008A7E 00               [ 4] 1847 	ret
                                   1848 
                                   1849 ;-----------------------------
                                   1850 ; negate double int.
                                   1851 ; input:
                                   1852 ;   x     bits 15..0
                                   1853 ;   y     bits 31..16
                                   1854 ; output: 
                                   1855 ;   x     bits 15..0
                                   1856 ;   y     bits 31..16
                                   1857 ;-----------------------------
      000AE7                       1858 dneg:
      008A7F 0C               [ 2] 1859 	cplw x 
      008A80 20 C9            [ 2] 1860 	cplw y 
      008A82 0D 01 27         [ 2] 1861 	addw x,#1 
      008A85 03 CD            [ 1] 1862 	jrnc 1$
      008A87 89 F4            [ 1] 1863 	incw y 
      008A89 81               [ 4] 1864 1$: ret 
                                   1865 
                                   1866 
                                   1867 ;--------------------------------
                                   1868 ; sign extend single to double
                                   1869 ; input:
                                   1870 ;   x    int16_t
                                   1871 ; output:
                                   1872 ;   x    int32_t bits 15..0
                                   1873 ;   y    int32_t bits 31..16
                                   1874 ;--------------------------------
      000AF2                       1875 dbl_sign_extend:
      008A89 5B 03            [ 1] 1876 	clrw y
      008A8B 85               [ 1] 1877 	ld a,xh 
      008A8C 81 80            [ 1] 1878 	and a,#0x80 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A8D 27 02            [ 1] 1879 	jreq 1$
      008A8D 52 09            [ 2] 1880 	cplw y
      008A8F 6B               [ 4] 1881 1$: ret 	
                                   1882 
                                   1883 
                                   1884 ;----------------------------------
                                   1885 ;  euclidian divide dbl/n1 
                                   1886 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   1887 ; input:
                                   1888 ;    dbl    int32_t on stack 
                                   1889 ;    x 		n1   int16_t  disivor  
                                   1890 ; output:
                                   1891 ;    X      dbl/x  int16_t 
                                   1892 ;    Y      remainder int16_t 
                                   1893 ;----------------------------------
                           000008  1894 	VSIZE=8
      000AFC                       1895 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000AFC                       1896 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000AFC                       1897 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   1898 	; local variables
                           000001  1899 	DBLHI=1
                           000003  1900 	DBLLO=3 
                           000005  1901 	SDIVSR=5 ; sign divisor
                           000006  1902 	SQUOT=6 ; sign dividend 
                           000007  1903 	DIVISR=7 ; divisor 
      000AFC                       1904 div32_16:
      000AFC                       1905 	_vars VSIZE 
      008A90 01 C6            [ 2]    1     sub sp,#VSIZE 
      008A92 00 0B            [ 1] 1906 	clr (SDIVSR,sp)
      008A94 6B 02            [ 1] 1907 	clr (SQUOT,sp)
                                   1908 ; copy arguments 
      008A96 1F 03            [ 2] 1909 	ldw y,(DIVDNDHI,sp)
      008A98 17 05            [ 2] 1910 	ldw (DBLHI,sp),y
      008A9A CE 00            [ 2] 1911 	ldw y,(DIVDNDLO,sp)
      008A9C 0C C6            [ 2] 1912 	ldw (DBLLO,sp),y 
                                   1913 ; check for 0 divisor
      008A9E 00               [ 2] 1914 	tnzw x 
      008A9F 0E 1F            [ 1] 1915     jrne 0$
      008AA1 07 6B            [ 1] 1916 	ld a,#ERR_DIV0 
      008AA3 09 35 10         [ 2] 1917 	jp tb_error 
                                   1918 ; check divisor sign 	
      008AA6 00               [ 1] 1919 0$:	ld a,xh 
      008AA7 0B 5F            [ 1] 1920 	and a,#0x80 
      008AA9 7B 01            [ 1] 1921 	jreq 1$
      008AAB 97 CD            [ 1] 1922 	cpl (SDIVSR,sp)
      008AAD 89 0B            [ 1] 1923 	cpl (SQUOT,sp)
      008AAF A6               [ 2] 1924 	negw x
      008AB0 20 CD            [ 2] 1925 1$:	ldw (DIVISR,sp),x
                                   1926 ; check dividend sign 	 
      008AB2 83 41            [ 1] 1927  	ld a,(DBLHI,sp) 
      008AB4 1E 03            [ 1] 1928 	and a,#0x80 
      008AB6 CD 89            [ 1] 1929 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008AB8 0B A6            [ 1] 1930 	cpl (SQUOT,sp)
      008ABA 20 CD            [ 2] 1931 	ldw x,(DBLLO,sp)
      008ABC 83 41            [ 2] 1932 	ldw y,(DBLHI,sp)
      008ABE 1E 05 CD         [ 4] 1933 	call dneg 
      008AC1 89 0B            [ 2] 1934 	ldw (DBLLO,sp),x 
      008AC3 A6 0D            [ 2] 1935 	ldw (DBLHI,sp),y 
      008AC5 CD 83            [ 2] 1936 2$:	ldw x,(DIVISR,sp)
      008AC7 41 7B 09         [ 4] 1937 	call udiv32_16
      008ACA 1E 07            [ 2] 1938 	tnzw y 
      008ACC CF 00            [ 1] 1939 	jreq 3$ 
                                   1940 ; x=quotient 
                                   1941 ; y=remainder 
                                   1942 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008ACE 0C C7            [ 1] 1943 	ld a,(SQUOT,sp)
      008AD0 00 0E            [ 1] 1944 	xor a,(SDIVSR,sp)
      008AD2 7B 02            [ 1] 1945 	jreq 3$
      008AD4 C7               [ 1] 1946 	incw x 
      008AD5 00 0B 7B 01      [ 2] 1947 	ldw acc16,y 
      008AD9 1E 03            [ 2] 1948 	ldw y,(DIVISR,sp)
      008ADB 16 05 5B 09      [ 2] 1949 	subw y,acc16
                                   1950 ; sign quotient
      008ADF 81 06            [ 1] 1951 3$:	ld a,(SQUOT,sp)
      008AE0 27 01            [ 1] 1952 	jreq 4$
      008AE0 52               [ 2] 1953 	negw x 
      000B50                       1954 4$:	
      000B50                       1955 	_drop VSIZE 
      008AE1 06 1F            [ 2]    1     addw sp,#VSIZE 
      008AE3 01               [ 4] 1956 	ret 
                                   1957 
                                   1958 
                                   1959 
                                   1960 ;----------------------------------
                                   1961 ; division x/y 
                                   1962 ; input:
                                   1963 ;    X       dividend
                                   1964 ;    Y       divisor 
                                   1965 ; output:
                                   1966 ;    X       quotient
                                   1967 ;    Y       remainder 
                                   1968 ;-----------------------------------
                           000004  1969 	VSIZE=4 
                                   1970 	; local variables 
                           000001  1971 	DBLHI=1
                           000003  1972 	DBLLO=3
      000B53                       1973 divide: 
      000B53                       1974 	_vars VSIZE 
      008AE4 0F 03            [ 2]    1     sub sp,#VSIZE 
      008AE6 0F 04 90 9F      [ 2] 1975 	ldw acc16,y
      008AEA 42 1F 05         [ 4] 1976 	call dbl_sign_extend
      008AED 7B 01            [ 2] 1977 	ldw (DBLLO,sp),x 
      008AEF 93 42            [ 2] 1978 	ldw (DBLHI,sp),y 
      008AF1 4F 72 FB         [ 2] 1979 	ldw x,acc16 
      008AF4 04 4F 19         [ 4] 1980 	call div32_16 
      000B66                       1981 	_drop VSIZE 
      008AF7 03 6B            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008AF9 03               [ 4] 1982 	ret
                                   1983 
                                   1984 
                                   1985 ;----------------------------------
                                   1986 ;  remainder resulting from euclidian 
                                   1987 ;  division of x/y 
                                   1988 ; input:
                                   1989 ;   x   	dividend int16_t 
                                   1990 ;   y 		divisor int16_t
                                   1991 ; output:
                                   1992 ;   X       n1%n2 
                                   1993 ;----------------------------------
      000B69                       1994 modulo:
      008AFA 1F 04 90         [ 4] 1995 	call divide
      008AFD 5E               [ 1] 1996 	ldw x,y 
      008AFE 93               [ 4] 1997 	ret 
                                   1998 
                                   1999 ;----------------------------------
                                   2000 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2001 ; return expr1*expr2/expr3 
                                   2002 ; product result is int32_t and 
                                   2003 ; divisiont is int32_t/int16_t
                                   2004 ;----------------------------------
                           000004  2005 	DBL_SIZE=4 
      000B6E                       2006 muldiv:
      008AFF 7B 02 42         [ 4] 2007 	call func_args 
      008B02 72 FB            [ 1] 2008 	cp a,#3 
      008B04 04 4F            [ 1] 2009 	jreq 1$
      008B06 19 03 6B         [ 2] 2010 	jp syntax_error
      000B78                       2011 1$: 
      008B09 03 1F            [ 2] 2012 	ldw x,(5,sp) ; expr1
      008B0B 04 7B            [ 2] 2013 	ldw y,(3,sp) ; expr2
      008B0D 01 93 42         [ 4] 2014 	call multiply 
      008B10 72 FB            [ 2] 2015 	ldw (5,sp),x  ;int32_t 15..0
      008B12 03 90            [ 2] 2016 	ldw (3,sp),y  ;int32_t 31..16
      008B14 93               [ 2] 2017 	popw x        ; expr3 
      008B15 1E 05 5B         [ 4] 2018 	call div32_16 ; int32_t/expr3 
      000B87                       2019 	_drop DBL_SIZE
      008B18 06 81            [ 2]    1     addw sp,#DBL_SIZE 
      008B1A 81               [ 4] 2020 	ret 
                                   2021 
                                   2022 
                                   2023 ;---------------------------------
                                   2024 ; dictionary search 
                                   2025 ; input:
                                   2026 ;	X 		dictionary entry point, name field  
                                   2027 ;   y		.asciz name to search 
                                   2028 ; output:
                                   2029 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2030 ;  X		cmd_index
                                   2031 ;---------------------------------
                           000001  2032 	NLEN=1 ; cmd length 
                           000002  2033 	XSAVE=2
                           000004  2034 	YSAVE=4
                           000005  2035 	VSIZE=5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      000B8A                       2036 search_dict::
      000B8A                       2037 	_vars VSIZE 
      008B1A 52 01            [ 2]    1     sub sp,#VSIZE 
                                   2038 
      008B1C 0F 01            [ 2] 2039 	ldw (YSAVE,sp),y 
      000B8E                       2040 search_next:
      008B1E 9E A4            [ 2] 2041 	ldw (XSAVE,sp),x 
                                   2042 ; get name length in dictionary	
      008B20 80               [ 1] 2043 	ld a,(x)
      008B21 2A 03            [ 1] 2044 	and a,#0xf 
      008B23 03 01            [ 1] 2045 	ld (NLEN,sp),a  
      008B25 50 04            [ 2] 2046 	ldw y,(YSAVE,sp) ; name pointer 
      008B26 5C               [ 1] 2047 	incw x 
      000B98                       2048 cp_loop:
      008B26 90 9E            [ 1] 2049 	ld a,(y)
      008B28 A4 80            [ 1] 2050 	jreq str_match 
      008B2A 2A 04            [ 1] 2051 	tnz (NLEN,sp)
      008B2C 03 01            [ 1] 2052 	jreq no_match  
      008B2E 90               [ 1] 2053 	cp a,(x)
      008B2F 50 07            [ 1] 2054 	jrne no_match 
      008B30 90 5C            [ 1] 2055 	incw y 
      008B30 CD               [ 1] 2056 	incw x
      008B31 8A E0            [ 1] 2057 	dec (NLEN,sp)
      008B33 7B 01            [ 2] 2058 	jra cp_loop 
      000BAA                       2059 no_match:
      008B35 27 03            [ 2] 2060 	ldw x,(XSAVE,sp) 
      008B37 CD 8B 67         [ 2] 2061 	subw x,#2 ; move X to link field
      008B3A 4B 00            [ 1] 2062 	push #TK_NONE 
      008B3A 5B               [ 2] 2063 	ldw x,(x) ; next word link 
      008B3B 01               [ 1] 2064 	pop a ; TK_NONE 
      008B3C 81 1F            [ 1] 2065 	jreq search_exit  ; not found  
                                   2066 ;try next 
      008B3D 20 D7            [ 2] 2067 	jra search_next
      000BB7                       2068 str_match:
      008B3D 52 03            [ 2] 2069 	ldw x,(XSAVE,sp)
      008B3F 1F               [ 1] 2070 	ld a,(X)
      008B40 01 1E            [ 1] 2071 	ld (NLEN,sp),a ; needed to test keyword type  
      008B42 08 16            [ 1] 2072 	and a,#0xf 
                                   2073 ; move x to procedure address field 	
      008B44 06               [ 1] 2074 	inc a 
      008B45 90 5D 26         [ 1] 2075 	ld acc8,a 
      008B48 06 16 01 65      [ 1] 2076 	clr acc16 
      008B4C 5B 03 81 0C      [ 2] 2077 	addw x,acc16 
      008B4F FE               [ 2] 2078 	ldw x,(x) ; routine index  
                                   2079 ;determine keyword type bits 7:6 
      008B4F 51 A6            [ 1] 2080 	ld a,(NLEN,sp)
      008B51 11               [ 1] 2081 	swap a 
      008B52 6B 03            [ 1] 2082 	and a,#0xc
      008B54 44               [ 1] 2083 	srl a
      008B54 13               [ 1] 2084 	srl a 
      008B55 01 2B            [ 1] 2085 	add a,#128
      000BD4                       2086 search_exit: 
      000BD4                       2087 	_drop VSIZE 	 
      008B57 03 72            [ 2]    1     addw sp,#VSIZE 
      008B59 F0               [ 4] 2088 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2089 
                                   2090 ;---------------------
                                   2091 ; check if next token
                                   2092 ;  is of expected type 
                                   2093 ; input:
                                   2094 ;   A 		 expected token attribute
                                   2095 ;  ouput:
                                   2096 ;   none     if fail call syntax_error 
                                   2097 ;--------------------
      000BD7                       2098 expect:
      008B5A 01               [ 1] 2099 	push a 
      008B5B 8C 90 59         [ 4] 2100 	call next_token 
      008B5E 59 0A            [ 1] 2101 	cp a,(1,sp)
      008B60 03 26            [ 1] 2102 	jreq 1$
      008B62 F1 51 5B         [ 2] 2103 	jp syntax_error
      008B65 03               [ 1] 2104 1$: pop a 
      008B66 81               [ 4] 2105 	ret 
                                   2106 
                                   2107 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2108 ; parse arguments list 
                                   2109 ; between ()
                                   2110 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      008B67                       2111 func_args:
      008B67 53 90            [ 1] 2112 	ld a,#TK_LPAREN 
      008B69 53 1C 00         [ 4] 2113 	call expect 
                                   2114 ; expected to continue in arg_list 
                                   2115 ; caller must check for TK_RPAREN 
                                   2116 
                                   2117 ;-------------------------------
                                   2118 ; parse embedded BASIC routines 
                                   2119 ; arguments list.
                                   2120 ; arg_list::=  rel[','rel]*
                                   2121 ; all arguments are of integer type
                                   2122 ; and pushed on stack 
                                   2123 ; input:
                                   2124 ;   none
                                   2125 ; output:
                                   2126 ;   stack{n}   arguments pushed on stack
                                   2127 ;   A 	number of arguments pushed on stack  
                                   2128 ;--------------------------------
      000BE9                       2129 arg_list:
      008B6C 01 24            [ 1] 2130 	push #0  
      008B6E 02 90 5C         [ 4] 2131 1$: call relation
      008B71 81 00            [ 1] 2132 	cp a,#TK_NONE 
      008B72 27 20            [ 1] 2133 	jreq 5$
      008B72 90 5F            [ 1] 2134 	cp a,#TK_INTGR
      008B74 9E A4            [ 1] 2135 	jrne 4$
      000BF6                       2136 3$: 
                                   2137 ; swap return address with argument
      008B76 80               [ 1] 2138 	pop a ; arg_count
      008B77 27 02            [ 2] 2139 	popw y ; return address 
      008B79 90               [ 2] 2140 	pushw x ; new argument 
      008B7A 53 81            [ 2] 2141 	pushw y 
      008B7C 4C               [ 1] 2142     inc a
      008B7C 52               [ 1] 2143 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008B7D 08 0F 05         [ 4] 2144 	call next_token 
      008B80 0F 06            [ 1] 2145 	cp a,#TK_COMMA 
      008B82 16 0B            [ 1] 2146 	jreq 1$ 
      008B84 17 01            [ 1] 2147 	cp a,#TK_NONE 
      008B86 16 0D            [ 1] 2148 	jreq 5$ 
      008B88 17 03            [ 1] 2149 4$:	cp a,#TK_RPAREN 
      008B8A 5D 26            [ 1] 2150 	jreq 5$
      000C0D                       2151 	_unget_token 
      008B8C 05 A6 04 CC 87   [ 1]    1      mov in,in.saved  
      008B91 C3               [ 1] 2152 5$:	pop a  
      008B92 9E               [ 4] 2153 	ret 
                                   2154 
                                   2155 ;--------------------------------
                                   2156 ;   BASIC commnands 
                                   2157 ;--------------------------------
                                   2158 
                                   2159 ;--------------------------------
                                   2160 ;  arithmetic and relational 
                                   2161 ;  routines
                                   2162 ;  operators precedence
                                   2163 ;  highest to lowest
                                   2164 ;  operators on same row have 
                                   2165 ;  same precedence and are executed
                                   2166 ;  from left to right.
                                   2167 ;	'*','/','%'
                                   2168 ;   '-','+'
                                   2169 ;   '=','>','<','>=','<=','<>','><'
                                   2170 ;   '<>' and '><' are equivalent for not equal.
                                   2171 ;--------------------------------
                                   2172 
                                   2173 ;---------------------
                                   2174 ; return array element
                                   2175 ; address from @(expr)
                                   2176 ; input:
                                   2177 ;   A 		TK_ARRAY
                                   2178 ; output:
                                   2179 ;   A 		TK_INTGR
                                   2180 ;	X 		element address 
                                   2181 ;----------------------
      000C14                       2182 get_array_element:
      008B93 A4 80 27         [ 4] 2183 	call func_args 
      008B96 05 03            [ 1] 2184 	cp a,#1
      008B98 05 03            [ 1] 2185 	jreq 1$
      008B9A 06 50 1F         [ 2] 2186 	jp syntax_error
      008B9D 07               [ 2] 2187 1$: popw x 
                                   2188 	; check for bounds 
      008B9E 7B 01 A4         [ 2] 2189 	cpw x,array_size 
      008BA1 80 27            [ 2] 2190 	jrule 3$
                                   2191 ; bounds {1..array_size}	
      008BA3 0D 03            [ 1] 2192 2$: ld a,#ERR_BAD_VALUE 
      008BA5 06 1E 03         [ 2] 2193 	jp tb_error 
      008BA8 16               [ 2] 2194 3$: tnzw  x
      008BA9 01 CD            [ 1] 2195 	jreq 2$ 
      008BAB 8B               [ 2] 2196 	sllw x 
      008BAC 67               [ 2] 2197 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008BAD 1F 03 17         [ 2] 2198 	ldw x,#tib
      008BB0 01 1E 07         [ 2] 2199 	subw x,(1,sp)
      000C34                       2200 	_drop 2   
      008BB3 CD 8B            [ 2]    1     addw sp,#2 
      008BB5 3D 90            [ 1] 2201 	ld a,#TK_INTGR
      008BB7 5D               [ 4] 2202 	ret 
                                   2203 
                                   2204 
                                   2205 ;***********************************
                                   2206 ;   expression parse,execute 
                                   2207 ;***********************************
                                   2208 ;-----------------------------------
                                   2209 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2210 ;			 integer | function |
                                   2211 ;			 '('relation')' 
                                   2212 ; output:
                                   2213 ;   A    token attribute 
                                   2214 ;   X 	 integer
                                   2215 ; ---------------------------------
                           000001  2216 	NEG=1
                           000001  2217 	VSIZE=1
      000C39                       2218 factor:
      000C39                       2219 	_vars VSIZE 
      008BB8 27 11            [ 2]    1     sub sp,#VSIZE 
      008BBA 7B 06 18         [ 4] 2220 	call next_token
      008BBD 05 27            [ 1] 2221 	cp a,#CMD_END  
      008BBF 0B 5C            [ 1] 2222 	jrult 16$
      008BC1 90 CF            [ 1] 2223 1$:	ld (NEG,sp),a 
      008BC3 00 0D            [ 1] 2224 	and a,#TK_GRP_MASK
      008BC5 16 07            [ 1] 2225 	cp a,#TK_GRP_ADD 
      008BC7 72 B2            [ 1] 2226 	jreq 2$
      008BC9 00 0D            [ 1] 2227 	ld a,(NEG,sp)
      008BCB 7B 06            [ 2] 2228 	jra 4$  
      000C4E                       2229 2$:	
      008BCD 27 01 50         [ 4] 2230 	call next_token 
      008BD0                       2231 4$:	
      008BD0 5B 08            [ 1] 2232 	cp a,#TK_IFUNC 
      008BD2 81 03            [ 1] 2233 	jrne 5$ 
      008BD3 FD               [ 4] 2234 	call (x) 
      008BD3 52 04            [ 2] 2235 	jra 18$ 
      000C58                       2236 5$:
      008BD5 90 CF            [ 1] 2237 	cp a,#TK_INTGR
      008BD7 00 0D            [ 1] 2238 	jrne 6$
      008BD9 CD 8B            [ 2] 2239 	jra 18$
      000C5E                       2240 6$:
      008BDB 72 1F            [ 1] 2241 	cp a,#TK_ARRAY
      008BDD 03 17            [ 1] 2242 	jrne 10$
      008BDF 01 CE 00         [ 4] 2243 	call get_array_element
      008BE2 0D               [ 2] 2244 	ldw x,(x)
      008BE3 CD 8B            [ 2] 2245 	jra 18$ 
      000C68                       2246 10$:
      008BE5 7C 5B            [ 1] 2247 	cp a,#TK_VAR 
      008BE7 04 81            [ 1] 2248 	jrne 12$
      008BE9 FE               [ 2] 2249 	ldw x,(x)
      008BE9 CD 8B            [ 2] 2250 	jra 18$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      000C6F                       2251 12$:			
      008BEB D3 93            [ 1] 2252 	cp a,#TK_LPAREN
      008BED 81 0C            [ 1] 2253 	jrne 16$
      008BEE CD 0D 31         [ 4] 2254 	call relation
      008BEE CD               [ 2] 2255 	pushw x 
      008BEF 8C 64            [ 1] 2256 	ld a,#TK_RPAREN 
      008BF1 A1 03 27         [ 4] 2257 	call expect
      008BF4 03               [ 2] 2258 	popw x 
      008BF5 CC 87            [ 2] 2259 	jra 18$	
      000C7F                       2260 16$:
      008BF7 C1               [ 1] 2261 	tnz a 
      008BF8 27 11            [ 1] 2262 	jreq 20$ 
      000C82                       2263 	_unget_token
      008BF8 1E 05 16 03 CD   [ 1]    1      mov in,in.saved  
      008BFD 8B               [ 1] 2264 	clr a 
      008BFE 1A 1F            [ 2] 2265 	jra 20$ 
      000C8A                       2266 18$: 
      008C00 05 17            [ 1] 2267 	ld a,#TK_MINUS 
      008C02 03 85            [ 1] 2268 	cp a,(NEG,sp)
      008C04 CD 8B            [ 1] 2269 	jrne 19$
      008C06 7C               [ 2] 2270 	negw x
      000C91                       2271 19$:
      008C07 5B 04            [ 1] 2272 	ld a,#TK_INTGR
      000C93                       2273 20$:
      000C93                       2274 	_drop VSIZE
      008C09 81 01            [ 2]    1     addw sp,#VSIZE 
      008C0A 81               [ 4] 2275 	ret
                                   2276 
                                   2277 ;-----------------------------------
                                   2278 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   2279 ; output:
                                   2280 ;   A    	token attribute 
                                   2281 ;	X		integer
                                   2282 ;-----------------------------------
                           000001  2283 	N1=1   ; int16_t
                           000003  2284 	MULOP=3
                           000003  2285 	VSIZE=3
      000C96                       2286 term:
      000C96                       2287 	_vars VSIZE
      008C0A 52 05            [ 2]    1     sub sp,#VSIZE 
      008C0C 17 04 39         [ 4] 2288 	call factor
      008C0E 4D               [ 1] 2289 	tnz a 
      008C0E 1F 02            [ 1] 2290 	jreq term_exit 
      000C9E                       2291 term01:	 ; check for  operator 
      008C10 F6 A4            [ 2] 2292 	ldw (N1,sp),x  ; save first factor 
      008C12 0F 6B 01         [ 4] 2293 	call next_token
      008C15 16 04            [ 1] 2294 	ld (MULOP,sp),a
      008C17 5C 02            [ 1] 2295 	cp a,#CMD_END
      008C18 25 2F            [ 1] 2296 	jrult 8$
      008C18 90 F6            [ 1] 2297 	and a,#TK_GRP_MASK
      008C1A 27 1B            [ 1] 2298 	cp a,#TK_GRP_MULT
      008C1C 0D 01            [ 1] 2299 	jreq 1$
      008C1E 27 0A            [ 2] 2300 	jra 8$
      000CB1                       2301 1$:	; got *|/|%
      008C20 F1 26 07         [ 4] 2302 	call factor
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008C23 90 5C            [ 1] 2303 	cp a,#TK_INTGR
      008C25 5C 0A            [ 1] 2304 	jreq 2$
      008C27 01 20 EE         [ 2] 2305 	jp syntax_error
      008C2A 90 93            [ 1] 2306 2$:	ldw y,x 
      008C2A 1E 02            [ 2] 2307 	ldw x,(N1,sp)
      008C2C 1D 00            [ 1] 2308 	ld a,(MULOP,sp) 
      008C2E 02 4B            [ 1] 2309 	cp a,#TK_MULT 
      008C30 00 FE            [ 1] 2310 	jrne 3$
      008C32 84 27 1F         [ 4] 2311 	call multiply 
      008C35 20 D7            [ 2] 2312 	jra term01
      008C37 A1 21            [ 1] 2313 3$: cp a,#TK_DIV 
      008C37 1E 02            [ 1] 2314 	jrne 4$ 
      008C39 F6 6B 01         [ 4] 2315 	call divide 
      008C3C A4 0F            [ 2] 2316 	jra term01 
      008C3E 4C C7 00         [ 4] 2317 4$: call modulo
      008C41 0E 72            [ 2] 2318 	jra term01 
      008C43 5F 00            [ 1] 2319 8$: ld a,(MULOP,sp)
      008C45 0D 72            [ 1] 2320 	jreq 9$ 
      000CDC                       2321 	_unget_token
      008C47 BB 00 0D FE 7B   [ 1]    1      mov in,in.saved  
      008C4C 01 4E            [ 2] 2322 9$: ldw x,(N1,sp)
      008C4E A4 0C            [ 1] 2323 	ld a,#TK_INTGR 	
      000CE5                       2324 term_exit:
      000CE5                       2325 	_drop VSIZE 
      008C50 44 44            [ 2]    1     addw sp,#VSIZE 
      008C52 AB               [ 4] 2326 	ret 
                                   2327 
                                   2328 ;-------------------------------
                                   2329 ;  expr ::= term [['+'|'-'] term]*
                                   2330 ;  result range {-32768..32767}
                                   2331 ;  output:
                                   2332 ;   A    token attribute 
                                   2333 ;   X	 integer   
                                   2334 ;-------------------------------
                           000001  2335 	N1=1
                           000003  2336 	N2=3 
                           000005  2337 	OP=5 
                           000005  2338 	VSIZE=5 
      000CE8                       2339 expression:
      000CE8                       2340 	_vars VSIZE 
      008C53 80 05            [ 2]    1     sub sp,#VSIZE 
      008C54 CD 0C 96         [ 4] 2341 	call term
      008C54 5B               [ 1] 2342 	tnz a 
      008C55 05 81            [ 1] 2343 	jreq expr_exit 
      008C57 1F 01            [ 2] 2344 1$:	ldw (N1,sp),x 
      008C57 88 CD 88         [ 4] 2345 	call next_token
      008C5A B0 11            [ 1] 2346 	ld (OP,sp),a 
      008C5C 01 27            [ 1] 2347 	cp a,#CMD_END 
      008C5E 03 CC            [ 1] 2348 	jrult 8$ 
      008C60 87 C1            [ 1] 2349 	and a,#TK_GRP_MASK
      008C62 84 81            [ 1] 2350 	cp a,#TK_GRP_ADD 
      008C64 27 02            [ 1] 2351 	jreq 2$ 
      008C64 A6 07            [ 2] 2352 	jra 8$
      000D03                       2353 2$: 
      008C66 CD 8C 57         [ 4] 2354 	call term
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008C69 A1 84            [ 1] 2355 	cp a,#TK_INTGR
      008C69 4B 00            [ 1] 2356 	jreq 3$
      008C6B CD 8D B1         [ 2] 2357 	jp syntax_error
      008C6E A1 00            [ 2] 2358 3$:	ldw (N2,sp),x 
      008C70 27 20            [ 2] 2359 	ldw x,(N1,sp)
      008C72 A1 84            [ 1] 2360 	ld a,(OP,sp)
      008C74 26 13            [ 1] 2361 	cp a,#TK_PLUS 
      008C76 26 05            [ 1] 2362 	jrne 4$
      008C76 84 90 85         [ 2] 2363 	addw x,(N2,sp)
      008C79 89 90            [ 2] 2364 	jra 1$ 
      008C7B 89 4C 88         [ 2] 2365 4$:	subw x,(N2,sp)
      008C7E CD 88            [ 2] 2366 	jra 1$
      008C80 B0 A1            [ 1] 2367 8$: ld a,(OP,sp)
      008C82 09 27            [ 1] 2368 	jreq 9$ 
      000D25                       2369 	_unget_token	
      008C84 E6 A1 00 27 09   [ 1]    1      mov in,in.saved  
      008C89 A1 08            [ 2] 2370 9$: ldw x,(N1,sp)
      008C8B 27 05            [ 1] 2371 	ld a,#TK_INTGR	
      000D2E                       2372 expr_exit:
      000D2E                       2373 	_drop VSIZE 
      008C8D 55 00            [ 2]    1     addw sp,#VSIZE 
      008C8F 03               [ 4] 2374 	ret 
                                   2375 
                                   2376 ;---------------------------------------------
                                   2377 ; rel ::= expr rel_op expr
                                   2378 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   2379 ;  relation return  integer , zero is false 
                                   2380 ;  output:
                                   2381 ;    A 		token attribute  
                                   2382 ;	 X		integer 
                                   2383 ;---------------------------------------------
                           000001  2384 	N1=1
                           000003  2385 	RELOP=3
                           000003  2386 	VSIZE=3 
      000D31                       2387 relation: 
      000D31                       2388 	_vars VSIZE
      008C90 00 02            [ 2]    1     sub sp,#VSIZE 
      008C92 84 81 E8         [ 4] 2389 	call expression
      008C94 4D               [ 1] 2390 	tnz a 
      008C94 CD 8C            [ 1] 2391 	jreq rel_exit
      008C96 64 A1            [ 2] 2392 	ldw (N1,sp),x 
                                   2393 ; expect rel_op or leave 
      008C98 01 27 03         [ 4] 2394 	call next_token 
      008C9B CC 87            [ 1] 2395 	ld (RELOP,sp),a 
      008C9D C1 85            [ 1] 2396 	and a,#TK_GRP_MASK
      008C9F C3 00            [ 1] 2397 	cp a,#TK_GRP_RELOP 
      008CA1 1F 23            [ 1] 2398 	jrne 8$
      000D46                       2399 2$:	; expect another expression
      008CA3 05 A6 0A         [ 4] 2400 	call expression
      008CA6 CC 87            [ 1] 2401 	cp a,#TK_INTGR
      008CA8 C3 5D            [ 1] 2402 	jreq 3$
      008CAA 27 F8 58         [ 2] 2403 	jp syntax_error 
      008CAD 89 AE 16         [ 2] 2404 3$:	ldw acc16,x 
      008CB0 90 72            [ 2] 2405 	ldw x,(N1,sp) 
      008CB2 F0 01 5B 02      [ 2] 2406 	subw x,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008CB6 A6 84            [ 1] 2407 	jrne 4$
      008CB8 81 02 00 0D      [ 1] 2408 	mov acc8,#2 ; n1==n2
      008CB9 20 0C            [ 2] 2409 	jra 6$ 
      000D61                       2410 4$: 
      008CB9 52 01            [ 1] 2411 	jrsgt 5$  
      008CBB CD 88 B0 A1      [ 1] 2412 	mov acc8,#4 ; n1<2 
      008CBF 02 25            [ 2] 2413 	jra 6$
      000D69                       2414 5$:
      008CC1 3D 6B 01 A4      [ 1] 2415 	mov acc8,#1 ; n1>n2 
      000D6D                       2416 6$:
      008CC5 30               [ 1] 2417 	clrw x 
      008CC6 A1 10 27         [ 1] 2418 	ld a, acc8  
      008CC9 04 7B            [ 1] 2419 	and a,(RELOP,sp)
      008CCB 01               [ 1] 2420 	tnz a 
      008CCC 20 03            [ 1] 2421 	jreq 10$
      008CCE 5C               [ 1] 2422 	incw x 
      008CCE CD 88            [ 2] 2423 	jra 10$  	
      008CD0 B0 03            [ 1] 2424 8$: ld a,(RELOP,sp)
      008CD1 27 05            [ 1] 2425 	jreq 9$
      000D7D                       2426 	_unget_token
      008CD1 A1 81 26 03 FD   [ 1]    1      mov in,in.saved  
      000D82                       2427 9$: 
      008CD6 20 32            [ 2] 2428 	ldw x,(N1,sp)
      008CD8                       2429 10$:
      008CD8 A1 84            [ 1] 2430 	ld a,#TK_INTGR
      000D86                       2431 rel_exit:
      000D86                       2432 	_drop VSIZE
      008CDA 26 02            [ 2]    1     addw sp,#VSIZE 
      008CDC 20               [ 4] 2433 	ret 
                                   2434 
                                   2435 ;--------------------------------
                                   2436 ; BASIC: SHOW 
                                   2437 ; print stack content in hexadecimal bytes 
                                   2438 ; 16 bytes per row 
                                   2439 ;--------------------------------
      000D89                       2440 show:
      008CDD 2C 0D A3         [ 2] 2441 	ldw x,#cstk_prompt
      008CDE CD 20 5C         [ 4] 2442 	call puts 
      008CDE A1               [ 1] 2443 	ldw x,sp 
      008CDF 06 26 06         [ 2] 2444 	addw x,#3 ; ignore return address
      008CE2 CD 8C 94 FE      [ 2] 2445 	ldw y,#RAM_SIZE  
      008CE6 20 22 0C         [ 2] 2446 	ldw acc16,x 
      008CE8 72 B2 00 0C      [ 2] 2447 	subw y,acc16
      008CE8 A1 85 26         [ 4] 2448 	call hex_dump
      008CEB 03               [ 1] 2449 	clr a 
      008CEC FE               [ 4] 2450 	ret
                                   2451 
      008CED 20 1B 6F 6E 74 65 6E  2452 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   2453 
                                   2454 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2455 ;--------------------------------------------
                                   2456 ; BASIC: HEX 
                                   2457 ; select hexadecimal base for integer print
                                   2458 ;---------------------------------------------
      008CEF                       2459 hex_base:
      008CEF A1 07 26 0C      [ 1] 2460 	mov base,#16 
      008CF3 CD               [ 4] 2461 	ret 
                                   2462 
                                   2463 ;--------------------------------------------
                                   2464 ; BASIC: DEC 
                                   2465 ; select decimal base for integer print
                                   2466 ;---------------------------------------------
      000DCF                       2467 dec_base:
      008CF4 8D B1 89 A6      [ 1] 2468 	mov base,#10
      008CF8 08               [ 4] 2469 	ret 
                                   2470 
                                   2471 ;------------------------
                                   2472 ; BASIC: FREE 
                                   2473 ; return free size in RAM 
                                   2474 ; output:
                                   2475 ;   A 		TK_INTGR
                                   2476 ;   X 	    size integer
                                   2477 ;--------------------------
      000DD4                       2478 free:
      008CF9 CD 8C 57         [ 2] 2479 	ldw x,#tib 
      008CFC 85 20 0B 19      [ 2] 2480 	ldw y,txtbgn 
      008CFF 90 A3 2A 00      [ 2] 2481 	cpw y,#app_space
      008CFF 4D 27            [ 1] 2482 	jrult 1$
      008D01 11 55 00         [ 2] 2483 	subw x,#free_ram 
      008D04 03 00            [ 2] 2484 	jra 2$ 
      000DE6                       2485 1$:	
      008D06 02 4F 20 09      [ 2] 2486 	subw x,txtend 
      008D0A A6 84            [ 1] 2487 2$:	ld a,#TK_INTGR
      008D0A A6               [ 4] 2488 	ret 
                                   2489 
                                   2490 ;------------------------------
                                   2491 ; BASIC: SIZE 
                                   2492 ; command that print 
                                   2493 ; program start addres and size 
                                   2494 ;------------------------------
      000DED                       2495 cmd_size:
      008D0B 11 11 01         [ 1] 2496 	push base 
      008D0E 26 01 50         [ 2] 2497 	ldw x,#PROG_ADDR 
      008D11 CD 20 5C         [ 4] 2498 	call puts 
      008D11 A6 84 19         [ 2] 2499 	ldw x,txtbgn     
      008D13 35 10 00 0A      [ 1] 2500 	mov base,#16 
      008D13 5B 01 81         [ 4] 2501 	call print_int
      008D16 32 00 0A         [ 1] 2502 	pop base 
      008D16 52 03 CD         [ 2] 2503 	ldw x,#PROG_SIZE 
      008D19 8C B9 4D         [ 4] 2504 	call puts 
      008D1C 27 47 1B         [ 2] 2505 	ldw x,txtend 
      008D1E 72 B0 00 19      [ 2] 2506 	subw x,txtbgn 
      008D1E 1F 01 CD         [ 4] 2507 	call print_int
      008D21 88 B0 6B         [ 2] 2508 	ldw x,#STR_BYTES 
      008D24 03 A1 02         [ 4] 2509 	call puts  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008D27 25               [ 4] 2510 	ret 
                                   2511 
      008D28 2F A4 30 A1 20 27 02  2512 PROG_ADDR: .asciz "program address: "
             20 27 64 64 72 65 73
             73 3A 20 00
      008D31 70 72 6F 67 72 61 6D  2513 PROG_SIZE: .asciz "program size: "
             20 73 69 7A 65 3A 20
             00
      008D31 CD 8C B9 A1 84 27 03  2514 STR_BYTES: .asciz "bytes\n" 
                                   2515 
                                   2516 ;------------------------
                                   2517 ; BASIC: UBOUND  
                                   2518 ; return array variable size 
                                   2519 ; output:
                                   2520 ;   A 		TK_INTGR
                                   2521 ;   X 	    array size 
                                   2522 ;--------------------------
      000E42                       2523 ubound:
      008D38 CC 87 C1         [ 4] 2524 	call free 
      008D3B 90               [ 2] 2525 	srlw x 
      008D3C 93 1E 01         [ 2] 2526 	ldw array_size,x
      008D3F 7B 03            [ 1] 2527 	ld a,#TK_INTGR
      008D41 A1               [ 4] 2528 	ret 
                                   2529 
                                   2530 ;-----------------------------
                                   2531 ; BASIC: LET var=expr 
                                   2532 ; variable assignement 
                                   2533 ; output:
                                   2534 ;   A 		TK_NONE 
                                   2535 ;-----------------------------
      000E4C                       2536 let::
      008D42 20 26 05         [ 4] 2537 	call next_token 
      008D45 CD 8B            [ 1] 2538 	cp a,#TK_VAR 
      008D47 1A 20            [ 1] 2539 	jreq let_var
      008D49 D4 A1            [ 1] 2540 	cp a,#TK_ARRAY 
      008D4B 21 26            [ 1] 2541 	jreq  let_array
      008D4D 05 CD 8B         [ 2] 2542 	jp syntax_error
      000E5A                       2543 let_array:
      008D50 D3 20 CB         [ 4] 2544 	call get_array_element
      000E5D                       2545 let_var:
      008D53 CD               [ 2] 2546 	pushw x  
      008D54 8B E9 20         [ 4] 2547 	call next_token 
      008D57 C6 7B            [ 1] 2548 	cp a,#TK_EQUAL
      008D59 03 27            [ 1] 2549 	jreq 1$
      008D5B 05 55 00         [ 2] 2550 	jp syntax_error
      000E68                       2551 1$:	
      008D5E 03 00 02         [ 4] 2552 	call relation   
      008D61 1E 01            [ 1] 2553 	cp a,#TK_INTGR 
      008D63 A6 84            [ 1] 2554 	jreq 2$
      008D65 CC 07 41         [ 2] 2555 	jp syntax_error
      000E72                       2556 2$:	
      008D65 5B 03            [ 1] 2557 	ldw y,x 
      008D67 81               [ 2] 2558 	popw x   
      008D68 FF               [ 2] 2559 	ldw (x),y   
      008D68 52               [ 4] 2560 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2561 
                                   2562 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2563 ; return program size 
                                   2564 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E77                       2565 prog_size:
      008D69 05 CD 8D         [ 2] 2566 	ldw x,txtend 
      008D6C 16 4D 27 3E      [ 2] 2567 	subw x,txtbgn 
      008D70 1F               [ 4] 2568 	ret 
                                   2569 
                                   2570 ;----------------------------
                                   2571 ; BASIC: LIST [[start][,end]]
                                   2572 ; list program lines 
                                   2573 ; form start to end 
                                   2574 ; if empty argument list then 
                                   2575 ; list all.
                                   2576 ;----------------------------
                           000001  2577 	FIRST=1
                           000003  2578 	LAST=3 
                           000005  2579 	LN_PTR=5
                           000006  2580 	VSIZE=6 
      000E7F                       2581 list:
      008D71 01 CD 88         [ 2] 2582 	ldw x,txtbgn 
      008D74 B0 6B 05         [ 2] 2583 	cpw x,txtend 
      008D77 A1 02            [ 1] 2584 	jrmi 1$
      008D79 25               [ 4] 2585 	ret 
      000E88                       2586 1$:	
      008D7A 26 A4 30         [ 2] 2587 	ldw x,#PROG_SIZE
      008D7D A1 10 27         [ 4] 2588 	call puts 
      008D80 02 20 1E         [ 2] 2589 	ldw x,txtend 
      008D83 72 B0 00 19      [ 2] 2590 	subw x,txtbgn 
      008D83 CD 8D 16         [ 4] 2591 	call print_int 
      008D86 A1 84 27         [ 2] 2592 	ldw x,#STR_BYTES 
      008D89 03 CC 87         [ 4] 2593 	call puts 
      000E9E                       2594 	_vars VSIZE
      008D8C C1 1F            [ 2]    1     sub sp,#VSIZE 
      008D8E 03 1E 01         [ 2] 2595 	ldw x,txtbgn 
      008D91 7B 05            [ 2] 2596 	ldw (LN_PTR,sp),x 
      008D93 A1               [ 2] 2597 	ldw x,(x) 
      008D94 10 26            [ 2] 2598 	ldw (FIRST,sp),x ; list from first line 
      008D96 05 72 FB         [ 2] 2599 	ldw x,#MAX_LINENO ; biggest line number 
      008D99 03 20            [ 2] 2600 	ldw (LAST,sp),x 
      008D9B D4 72 F0         [ 4] 2601 	call arg_list
      008D9E 03               [ 1] 2602 	tnz a
      008D9F 20 CF            [ 1] 2603 	jreq list_loop 
      008DA1 7B 05            [ 1] 2604 	cp a,#2 
      008DA3 27 05            [ 1] 2605 	jreq 4$
      008DA5 55 00            [ 1] 2606 	cp a,#1 
      008DA7 03 00            [ 1] 2607 	jreq first_line 
      008DA9 02 1E 01         [ 2] 2608 	jp syntax_error 
      008DAC A6               [ 2] 2609 4$:	popw x 
      008DAD 84 05            [ 2] 2610 	ldw (LAST+2,sp),x 
      008DAE                       2611 first_line:
      008DAE 5B               [ 2] 2612 	popw x
      008DAF 05 81            [ 2] 2613 	ldw (FIRST,sp),x 
      008DB1                       2614 lines_skip:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008DB1 52 03 CD         [ 2] 2615 	ldw x,txtbgn
      008DB4 8D 68            [ 2] 2616 2$:	ldw (LN_PTR,sp),x 
      008DB6 4D 27 4D         [ 2] 2617 	cpw x,txtend 
      008DB9 1F 01            [ 1] 2618 	jrpl list_exit 
      008DBB CD               [ 2] 2619 	ldw x,(x) ;line# 
      008DBC 88 B0            [ 2] 2620 	cpw x,(FIRST,sp)
      008DBE 6B 03            [ 1] 2621 	jrpl list_loop 
      008DC0 A4 30            [ 2] 2622 	ldw x,(LN_PTR,sp) 
      008DC2 A1 30            [ 1] 2623 	ld a,(2,x)
      008DC4 26 33 0D         [ 1] 2624 	ld acc8,a 
      008DC6 72 5F 00 0C      [ 1] 2625 	clr acc16 
      008DC6 CD 8D 68 A1      [ 2] 2626 	addw x,acc16
      008DCA 84 27            [ 2] 2627 	jra 2$ 
                                   2628 ; print loop
      000EE4                       2629 list_loop:
      008DCC 03 CC            [ 2] 2630 	ldw x,(LN_PTR,sp)
      008DCE 87 C1            [ 1] 2631 	ld a,(2,x) 
      008DD0 CF 00 0D         [ 4] 2632 	call prt_basic_line
      008DD3 1E 01            [ 2] 2633 	ldw x,(LN_PTR,sp)
      008DD5 72 B0            [ 1] 2634 	ld a,(2,x)
      008DD7 00 0D 26         [ 1] 2635 	ld acc8,a 
      008DDA 06 35 02 00      [ 1] 2636 	clr acc16 
      008DDE 0E 20 0C 0C      [ 2] 2637 	addw x,acc16
      008DE1 C3 00 1B         [ 2] 2638 	cpw x,txtend 
      008DE1 2C 06            [ 1] 2639 	jrpl list_exit
      008DE3 35 04            [ 2] 2640 	ldw (LN_PTR,sp),x
      008DE5 00               [ 2] 2641 	ldw x,(x)
      008DE6 0E 20            [ 2] 2642 	cpw x,(LAST,sp)  
      008DE8 04 DE            [ 1] 2643 	jrslt list_loop
      008DE9                       2644 list_exit:
      008DE9 35 01 00 0E 01   [ 1] 2645 	mov in,count 
      008DED AE 16 E0         [ 2] 2646 	ldw x,#pad 
      008DED 5F C6 00         [ 2] 2647 	ldw basicptr,x 
      000F11                       2648 	_drop VSIZE 
      008DF0 0E 14            [ 2]    1     addw sp,#VSIZE 
      008DF2 03               [ 4] 2649 	ret
                                   2650 
                                   2651 
                                   2652 ;--------------------------
                                   2653 ; BASIC: EDIT \E | \F
                                   2654 ;  copy program in FLASH 
                                   2655 ;  to RAM for edition 
                                   2656 ;-------------------------
      000F14                       2657 edit:
      008DF3 4D 27 0E         [ 4] 2658 	call qsign 
      008DF6 5C 20            [ 1] 2659 	jreq 1$ 
      008DF8 0B 7B 03         [ 2] 2660 	ldw x,#NOT_SAVED 
      008DFB 27 05 55         [ 4] 2661 	call puts 
      008DFE 00               [ 4] 2662 	ret 
      000F20                       2663 1$: 
      008DFF 03 00 02 00      [ 2] 2664 	ldw y,#app_sign ; source address 
      008E02 CE 2A 02         [ 2] 2665     ldw x,app_size  
      008E02 1E 01 04         [ 2] 2666 	addw x,#4 
      008E04 CF 00 0C         [ 2] 2667 	ldw acc16,x  ; bytes to copy 
      008E04 A6 84 7C         [ 2] 2668 	ldw x,#rsign ; destination address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008E06 CD 03 C5         [ 4] 2669 	call move  
      008E06 5B 03 81         [ 2] 2670 	ldw x,#free_ram 
      008E09 CF 00 19         [ 2] 2671 	ldw txtbgn,x 
      008E09 AE 8E 23 CD      [ 2] 2672 	addw x,rsize  
      008E0D A0 DC 96         [ 2] 2673 	ldw txtend,x 
      008E10 1C               [ 4] 2674 	ret 
                                   2675 
      008E11 00 03 90 AE 18 00 CF  2676 NOT_SAVED: .asciz "No application saved.\n"
             00 0D 72 B2 00 0D CD
             83 DA 4F 81 0A 63 6F
             6E 74
                                   2677 
                                   2678 ;--------------------------
                                   2679 ; decompile line from token list
                                   2680 ; and print it. 
                                   2681 ; input:
                                   2682 ;   A       stop at this position 
                                   2683 ;   X 		pointer at line
                                   2684 ; output:
                                   2685 ;   none 
                                   2686 ;--------------------------	
      000F58                       2687 prt_basic_line:
      008E28 65 6E 74         [ 1] 2688 	ld count,a 
      008E2B 20 6F            [ 1] 2689 	ld a,(2,x)
      008E2D 66 20 73         [ 1] 2690 	cp a,count 
      008E30 74 61            [ 1] 2691 	jrpl 1$ 
      008E32 63 6B 20         [ 1] 2692 	ld count,a 
      008E35 66 72 6F         [ 2] 2693 1$:	ldw basicptr,x 
      008E38 6D 20 74 6F      [ 2] 2694 	ldw y,#tib  
      008E3C 70 20 74         [ 4] 2695 	call decompile 
      008E3F 6F 20 62         [ 4] 2696 	call puts 
      008E42 6F 74            [ 1] 2697 	ld a,#CR 
      008E44 74 6F 6D         [ 4] 2698 	call putc 
      008E47 3A               [ 4] 2699 	ret 
                                   2700 
                                   2701 
                                   2702 
                                   2703 ;---------------------------------
                                   2704 ; BASIC: PRINT|? arg_list 
                                   2705 ; print values from argument list
                                   2706 ;----------------------------------
                           000001  2707 	CCOMMA=1
                           000001  2708 	VSIZE=1
      000F78                       2709 print:
      000F78                       2710 	_vars VSIZE 
      008E48 0A 00            [ 2]    1     sub sp,#VSIZE 
      008E4A                       2711 reset_comma:
      008E4A 35 10            [ 1] 2712 	clr (CCOMMA,sp)
      000F7C                       2713 prt_loop:
      008E4C 00 0B 81         [ 4] 2714 	call next_token
      008E4F A1 02            [ 1] 2715 	cp a,#CMD_END 
      008E4F 35 0A            [ 1] 2716 	jrult print_exit ; colon or end of line 
      008E51 00 0B            [ 1] 2717 	cp a,#TK_QSTR
      008E53 81 12            [ 1] 2718 	jreq 1$
      008E54 A1 03            [ 1] 2719 	cp a,#TK_CHAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008E54 AE 16            [ 1] 2720 	jreq 2$ 
      008E56 90 90            [ 1] 2721 	cp a,#TK_CFUNC 
      008E58 CE 00            [ 1] 2722 	jreq 3$
      008E5A 1A 90            [ 1] 2723 	cp a,#TK_COMMA 
      008E5C A3 AA            [ 1] 2724 	jreq 4$
      008E5E 80 25            [ 1] 2725 	cp a,#TK_SHARP 
      008E60 05 1D            [ 1] 2726 	jreq 5$
      008E62 00 80            [ 2] 2727 	jra 7$ 
      000F99                       2728 1$:	; print string 
      008E64 20 04 5C         [ 4] 2729 	call puts
      008E66 20 DC            [ 2] 2730 	jra reset_comma
      000F9E                       2731 2$:	; print character 
      008E66 72               [ 1] 2732 	ld a,xl 
      008E67 B0 00 1C         [ 4] 2733 	call putc 
      008E6A A6 84            [ 2] 2734 	jra reset_comma 
      000FA4                       2735 3$: ; print character function value  	
      008E6C 81               [ 4] 2736 	call (x)
      008E6D 9F               [ 1] 2737 	ld a,xl 
      008E6D 3B 00 0B         [ 4] 2738 	call putc
      008E70 AE 8E            [ 2] 2739 	jra reset_comma 
      000FAB                       2740 4$: ; set comma state 
      008E72 9A CD            [ 1] 2741 	cpl (CCOMMA,sp)
      008E74 A0 DC            [ 2] 2742 	jra prt_loop   
      000FAF                       2743 5$: ; # character must be followed by an integer   
      008E76 CE 00 1A         [ 4] 2744 	call next_token
      008E79 35 10            [ 1] 2745 	cp a,#TK_INTGR 
      008E7B 00 0B            [ 1] 2746 	jreq 6$
      008E7D CD 89 0B         [ 2] 2747 	jp syntax_error 
      000FB9                       2748 6$: ; set tab width
      008E80 32               [ 1] 2749 	ld a,xl 
      008E81 00 0B            [ 1] 2750 	and a,#15 
      008E83 AE 8E AC         [ 1] 2751 	ld tab_width,a 
      008E86 CD A0            [ 2] 2752 	jra reset_comma 
      000FC1                       2753 7$:	
      000FC1                       2754 	_unget_token 
      008E88 DC CE 00 1C 72   [ 1]    1      mov in,in.saved  
      008E8D B0 00 1A         [ 4] 2755 	call relation 
      008E90 CD 89            [ 1] 2756 	cp a,#TK_INTGR 
      008E92 0B AE            [ 1] 2757 	jrne print_exit 
      008E94 8E BB CD         [ 4] 2758     call print_int 
      008E97 A0 DC            [ 2] 2759 	jra reset_comma 
      000FD2                       2760 print_exit:
      008E99 81 70            [ 1] 2761 	tnz (CCOMMA,sp)
      008E9B 72 6F            [ 1] 2762 	jrne 9$
      008E9D 67 72            [ 1] 2763 	ld a,#CR 
      008E9F 61 6D 20         [ 4] 2764     call putc 
      000FDB                       2765 9$:	_drop VSIZE 
      008EA2 61 64            [ 2]    1     addw sp,#VSIZE 
      008EA4 64               [ 4] 2766 	ret 
                                   2767 
                                   2768 ;----------------------
                                   2769 ; 'save_context' and
                                   2770 ; 'rest_context' must be 
                                   2771 ; called at the same 
                                   2772 ; call stack depth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2773 ; i.e. SP must have the 
                                   2774 ; save value at  
                                   2775 ; entry point of both 
                                   2776 ; routine. 
                                   2777 ;---------------------
                           000004  2778 	CTXT_SIZE=4 ; size of saved data 
                                   2779 ;--------------------
                                   2780 ; save current BASIC
                                   2781 ; interpreter context 
                                   2782 ; on stack 
                                   2783 ;--------------------
      000FDE                       2784 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000FDE                       2785 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      000FDE                       2786 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      000FDE                       2787 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      000FDE                       2788 save_context:
      008EA5 72 65 73         [ 2] 2789 	ldw x,basicptr 
      008EA8 73 3A            [ 2] 2790 	ldw (BPTR,sp),x
      008EAA 20 00 70         [ 1] 2791 	ld a,in 
      008EAD 72 6F            [ 1] 2792 	ld (IN,sp),a
      008EAF 67 72 61         [ 1] 2793 	ld a,count 
      008EB2 6D 20            [ 1] 2794 	ld (CNT,sp),a  
      008EB4 73               [ 4] 2795 	ret
                                   2796 
                                   2797 ;-----------------------
                                   2798 ; restore previously saved 
                                   2799 ; BASIC interpreter context 
                                   2800 ; from stack 
                                   2801 ;-------------------------
      000FEE                       2802 rest_context:
      008EB5 69 7A            [ 2] 2803 	ldw x,(BPTR,sp)
      008EB7 65 3A 20         [ 2] 2804 	ldw basicptr,x 
      008EBA 00 62            [ 1] 2805 	ld a,(IN,sp)
      008EBC 79 74 65         [ 1] 2806 	ld in,a
      008EBF 73 0A            [ 1] 2807 	ld a,(CNT,sp)
      008EC1 00 00 03         [ 1] 2808 	ld count,a  
      008EC2 81               [ 4] 2809 	ret
                                   2810 
                                   2811 
                                   2812 
                                   2813 ;------------------------------------------
                                   2814 ; BASIC: INPUT [string]var[,[string]var]
                                   2815 ; input value in variables 
                                   2816 ; [string] optionally can be used as prompt 
                                   2817 ;-----------------------------------------
                           000001  2818 	CX_BPTR=1
                           000003  2819 	CX_IN=3
                           000004  2820 	CX_CNT=4
                           000005  2821 	SKIP=5
                           000006  2822 	VAR_ADDR=6
                           000007  2823 	VSIZE=7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      000FFE                       2824 input_var:
      000FFE                       2825 	_vars VSIZE 
      008EC2 CD 8E            [ 2]    1     sub sp,#VSIZE 
      001000                       2826 input_loop:
      008EC4 54 54            [ 1] 2827 	clr (SKIP,sp)
      008EC6 CF 00 1F         [ 4] 2828 	call next_token 
      008EC9 A6 84            [ 1] 2829 	cp a,#TK_QSTR 
      008ECB 81 08            [ 1] 2830 	jrne 1$ 
      008ECC CD 20 5C         [ 4] 2831 	call puts 
      008ECC CD 88            [ 1] 2832 	cpl (SKIP,sp)
      008ECE B0 A1 85         [ 4] 2833 	call next_token 
      008ED1 27 0A            [ 1] 2834 1$: cp a,#TK_VAR  
      008ED3 A1 06            [ 1] 2835 	jreq 2$ 
      008ED5 27 03 CC         [ 2] 2836 	jp syntax_error
      008ED8 87 C1            [ 2] 2837 2$:	ldw (VAR_ADDR,sp),x 
      008EDA 0D 05            [ 1] 2838 	tnz (SKIP,sp)
      008EDA CD 8C            [ 1] 2839 	jrne 21$ 
      008EDC 94 28 2C         [ 4] 2840 	call var_name 
      008EDD CD 02 C1         [ 4] 2841 	call putc   
      001024                       2842 21$:
      008EDD 89 CD            [ 1] 2843 	ld a,#':
      008EDF 88 B0 A1         [ 4] 2844 	call putc 
      008EE2 32 27 03         [ 4] 2845 	call save_context 
      008EE5 CC 87 C1 03      [ 1] 2846 	clr count  
      008EE8 CD 21 61         [ 4] 2847 	call readln 
      008EE8 CD 8D B1         [ 2] 2848 	ldw x,#tib 
      008EEB A1 84 27         [ 1] 2849 	push count
      008EEE 03 CC            [ 1] 2850 	push #0 
      008EF0 87 C1 01         [ 2] 2851 	addw x,(1,sp)
      008EF2 5C               [ 1] 2852 	incw x 
      00103F                       2853 	_drop 2 
      008EF2 90 93            [ 2]    1     addw sp,#2 
      008EF4 85 FF 81 01      [ 1] 2854 	clr in 
      008EF7 CD 25 7B         [ 4] 2855 	call get_token
      008EF7 CE 00            [ 1] 2856 	cp a,#TK_INTGR
      008EF9 1C 72            [ 1] 2857 	jreq 3$ 
      008EFB B0 00 1A         [ 4] 2858 	call rest_context 
      008EFE 81 07 41         [ 2] 2859 	jp syntax_error
      008EFF 16 06            [ 2] 2860 3$: ldw y,(VAR_ADDR,sp) 
      008EFF CE 00            [ 2] 2861 	ldw (y),x 
      008F01 1A C3 00         [ 4] 2862 	call rest_context
      008F04 1C 2B 01         [ 4] 2863 	call next_token 
      008F07 81 09            [ 1] 2864 	cp a,#TK_COMMA 
      008F08 27 A0            [ 1] 2865 	jreq input_loop
      008F08 AE 8E            [ 1] 2866 	cp a,#TK_NONE 
      008F0A AC CD            [ 1] 2867 	jreq input_exit  
      008F0C A0 DC            [ 1] 2868 	cp a,#TK_COLON 
      008F0E CE 00            [ 1] 2869     jreq input_exit 
      008F10 1C 72 B0         [ 2] 2870 	jp syntax_error 
      00106B                       2871 input_exit:
      00106B                       2872 	_drop VSIZE 
      008F13 00 1A            [ 2]    1     addw sp,#VSIZE 
      008F15 CD               [ 4] 2873 	ret 
                                   2874 
                                   2875 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2876 ;---------------------
                                   2877 ; BASIC: REMARK | ' 
                                   2878 ; skip comment to end of line 
                                   2879 ;---------------------- 
      00106E                       2880 remark::
      008F16 89 0B AE 8E BB   [ 1] 2881 	mov in,count 
      008F1B CD               [ 4] 2882  	ret 
                                   2883 
                                   2884 
                                   2885 ;---------------------
                                   2886 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2887 ; read in loop 'addr'  
                                   2888 ; apply & 'mask' to value 
                                   2889 ; loop while result==0.  
                                   2890 ; 'xor_mask' is used to 
                                   2891 ; invert the wait logic.
                                   2892 ; i.e. loop while not 0.
                                   2893 ;---------------------
                           000001  2894 	XMASK=1 
                           000002  2895 	MASK=2
                           000003  2896 	ADDR=3
                           000004  2897 	VSIZE=4
      001074                       2898 wait: 
      001074                       2899 	_vars VSIZE
      008F1C A0 DC            [ 2]    1     sub sp,#VSIZE 
      008F1E 52 06            [ 1] 2900 	clr (XMASK,sp) 
      008F20 CE 00 1A         [ 4] 2901 	call arg_list 
      008F23 1F 05            [ 1] 2902 	cp a,#2
      008F25 FE 1F            [ 1] 2903 	jruge 0$
      008F27 01 AE 7F         [ 2] 2904 	jp syntax_error 
      008F2A FF 1F            [ 1] 2905 0$:	cp a,#3
      008F2C 03 CD            [ 1] 2906 	jrult 1$
      008F2E 8C               [ 2] 2907 	popw x 
      008F2F 69               [ 1] 2908 	ld a,xl
      008F30 4D 27            [ 1] 2909 	ld (XMASK,sp),a 
      008F32 31               [ 2] 2910 1$: popw x ; mask 
      008F33 A1               [ 1] 2911 	ld a,xl 
      008F34 02 27            [ 1] 2912 	ld (MASK,sp),a 
      008F36 07               [ 2] 2913 	popw x ; address 
      008F37 A1               [ 1] 2914 2$:	ld a,(x)
      008F38 01 27            [ 1] 2915 	and a,(MASK,sp)
      008F3A 06 CC            [ 1] 2916 	xor a,(XMASK,sp)
      008F3C 87 C1            [ 1] 2917 	jreq 2$ 
      001096                       2918 	_drop VSIZE 
      008F3E 85 1F            [ 2]    1     addw sp,#VSIZE 
      008F40 05               [ 4] 2919 	ret 
                                   2920 
                                   2921 ;---------------------
                                   2922 ; BASIC: BSET addr,mask
                                   2923 ; set bits at 'addr' corresponding 
                                   2924 ; to those of 'mask' that are at 1.
                                   2925 ; arguments:
                                   2926 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2927 ;   mask        mask|addr
                                   2928 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2929 ;	none 
                                   2930 ;--------------------------
      008F41                       2931 bit_set:
      008F41 85 1F 01         [ 4] 2932 	call arg_list 
      008F44 A1 02            [ 1] 2933 	cp a,#2	 
      008F44 CE 00            [ 1] 2934 	jreq 1$ 
      008F46 1A 1F 05         [ 2] 2935 	jp syntax_error
      0010A3                       2936 1$: 
      008F49 C3               [ 2] 2937 	popw x ; mask 
      008F4A 00               [ 1] 2938 	ld a,xl 
      008F4B 1C               [ 2] 2939 	popw x ; addr  
      008F4C 2A               [ 1] 2940 	or a,(x)
      008F4D 38               [ 1] 2941 	ld (x),a
      008F4E FE               [ 4] 2942 	ret 
                                   2943 
                                   2944 ;---------------------
                                   2945 ; BASIC: BRES addr,mask
                                   2946 ; reset bits at 'addr' corresponding 
                                   2947 ; to those of 'mask' that are at 1.
                                   2948 ; arguments:
                                   2949 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2950 ;   mask	    ~mask&*addr  
                                   2951 ; output:
                                   2952 ;	none 
                                   2953 ;--------------------------
      0010A9                       2954 bit_reset:
      008F4F 13 01 2A         [ 4] 2955 	call arg_list 
      008F52 11 1E            [ 1] 2956 	cp a,#2  
      008F54 05 E6            [ 1] 2957 	jreq 1$ 
      008F56 02 C7 00         [ 2] 2958 	jp syntax_error
      0010B3                       2959 1$: 
      008F59 0E               [ 2] 2960 	popw x ; mask 
      008F5A 72               [ 1] 2961 	ld a,xl 
      008F5B 5F               [ 1] 2962 	cpl a 
      008F5C 00               [ 2] 2963 	popw x ; addr  
      008F5D 0D               [ 1] 2964 	and a,(x)
      008F5E 72               [ 1] 2965 	ld (x),a 
      008F5F BB               [ 4] 2966 	ret 
                                   2967 
                                   2968 ;---------------------
                                   2969 ; BASIC: BTOGL addr,mask
                                   2970 ; toggle bits at 'addr' corresponding 
                                   2971 ; to those of 'mask' that are at 1.
                                   2972 ; arguments:
                                   2973 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2974 ;   mask	    mask^*addr  
                                   2975 ; output:
                                   2976 ;	none 
                                   2977 ;--------------------------
      0010BA                       2978 bit_toggle:
      008F60 00 0D 20         [ 4] 2979 	call arg_list 
      008F63 E3 02            [ 1] 2980 	cp a,#2 
      008F64 27 03            [ 1] 2981 	jreq 1$ 
      008F64 1E 05 E6         [ 2] 2982 	jp syntax_error
      008F67 02               [ 2] 2983 1$: popw x ; mask 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008F68 CD               [ 1] 2984 	ld a,xl 
      008F69 8F               [ 2] 2985 	popw x ; addr  
      008F6A D8               [ 1] 2986 	xor a,(x)
      008F6B 1E               [ 1] 2987 	ld (x),a 
      008F6C 05               [ 4] 2988 	ret 
                                   2989 
                                   2990 
                                   2991 ;---------------------
                                   2992 ; BASIC: BTEST(addr,bit)
                                   2993 ; return bit value at 'addr' 
                                   2994 ; bit is in range {0..7}.
                                   2995 ; arguments:
                                   2996 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2997 ;   bit 	    bit position {0..7}  
                                   2998 ; output:
                                   2999 ;	none 
                                   3000 ;--------------------------
      0010CA                       3001 bit_test:
      008F6D E6 02 C7         [ 4] 3002 	call func_args 
      008F70 00 0E            [ 1] 3003 	cp a,#2
      008F72 72 5F            [ 1] 3004 	jreq 0$
      008F74 00 0D 72         [ 2] 3005 	jp syntax_error
      0010D4                       3006 0$:	
      008F77 BB               [ 2] 3007 	popw x 
      008F78 00               [ 1] 3008 	ld a,xl 
      008F79 0D C3            [ 1] 3009 	and a,#7
      008F7B 00               [ 1] 3010 	push a   
      008F7C 1C 2A            [ 1] 3011 	ld a,#1 
      008F7E 07 1F            [ 1] 3012 1$: tnz (1,sp)
      008F80 05 FE            [ 1] 3013 	jreq 2$
      008F82 13               [ 1] 3014 	sll a 
      008F83 03 2F            [ 1] 3015 	dec (1,sp)
      008F85 DE F7            [ 2] 3016 	jra 1$
      008F86                       3017 2$: _drop 1 
      008F86 55 00            [ 2]    1     addw sp,#1 
      008F88 04               [ 2] 3018 	popw x 
      008F89 00               [ 1] 3019 	and a,(x)
      008F8A 02 AE            [ 1] 3020 	jreq 3$
      008F8C 16 E0            [ 1] 3021 	ld a,#1 
      008F8E CF               [ 1] 3022 3$:	clrw x 
      008F8F 00               [ 1] 3023 	ld xl,a 
      008F90 05 5B            [ 1] 3024 	ld a,#TK_INTGR
      008F92 06               [ 4] 3025 	ret
                                   3026 
                                   3027 
                                   3028 ;--------------------
                                   3029 ; BASIC: POKE addr,byte
                                   3030 ; put a byte at addr 
                                   3031 ;--------------------
      0010F1                       3032 poke:
      008F93 81 0B E9         [ 4] 3033 	call arg_list 
      008F94 A1 02            [ 1] 3034 	cp a,#2
      008F94 CD 95            [ 1] 3035 	jreq 1$
      008F96 68 27 07         [ 2] 3036 	jp syntax_error
      0010FB                       3037 1$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008F99 AE               [ 2] 3038 	popw x  
      008F9A 8F               [ 1] 3039     ld a,xl 
      008F9B C1               [ 2] 3040 	popw x 
      008F9C CD               [ 1] 3041 	ld (x),a 
      008F9D A0               [ 4] 3042 	ret 
                                   3043 
                                   3044 ;-----------------------
                                   3045 ; BASIC: PEEK(addr)
                                   3046 ; get the byte at addr 
                                   3047 ; input:
                                   3048 ;	none 
                                   3049 ; output:
                                   3050 ;	X 		value 
                                   3051 ;-----------------------
      001100                       3052 peek:
      008F9E DC 81 E4         [ 4] 3053 	call func_args
      008FA0 A1 01            [ 1] 3054 	cp a,#1 
      008FA0 90 AE            [ 1] 3055 	jreq 1$
      008FA2 AA 80 CE         [ 2] 3056 	jp syntax_error
      008FA5 AA               [ 2] 3057 1$: popw x 
      008FA6 82               [ 1] 3058 	ld a,(x)
      008FA7 1C               [ 1] 3059 	clrw x 
      008FA8 00               [ 1] 3060 	ld xl,a 
      008FA9 04 CF            [ 1] 3061 	ld a,#TK_INTGR
      008FAB 00               [ 4] 3062 	ret 
                                   3063 
                                   3064 ;---------------------------
                                   3065 ; BASIC IF expr : instructions
                                   3066 ; evaluate expr and if true 
                                   3067 ; execute instructions on same line. 
                                   3068 ;----------------------------
      001111                       3069 if: 
      008FAC 0D AE 00         [ 4] 3070 	call relation 
      008FAF 7C CD            [ 1] 3071 	cp a,#TK_INTGR
      008FB1 84 45            [ 1] 3072 	jreq 1$ 
      008FB3 AE 00 80         [ 2] 3073 	jp syntax_error
      008FB6 CF               [ 1] 3074 1$:	clr a 
      008FB7 00               [ 2] 3075 	tnzw x 
      008FB8 1A 72            [ 1] 3076 	jrne 9$  
                                   3077 ;skip to next line
      008FBA BB 00 7E CF 00   [ 1] 3078 	mov in,count
      008FBF 1C               [ 4] 3079 9$:	ret 
                                   3080 
                                   3081 ;------------------------
                                   3082 ; BASIC: FOR var=expr 
                                   3083 ; set variable to expression 
                                   3084 ; leave variable address 
                                   3085 ; on stack and set
                                   3086 ; FLOOP bit in 'flags'
                                   3087 ;-----------------
                           000001  3088 	RETL1=1 ; return address  
                           000003  3089 	FSTEP=3  ; variable increment
                           000005  3090 	LIMIT=5 ; loop limit 
                           000007  3091 	CVAR=7   ; control variable 
                           000009  3092 	INW=9   ;  in.w saved
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                           00000B  3093 	BPTR=11 ; baseptr saved
                           00000A  3094 	VSIZE=10  
      001125                       3095 for: ; { -- var_addr }
      008FC0 81               [ 2] 3096 	popw x ; call return address 
      001126                       3097 	_vars VSIZE 
      008FC1 4E 6F            [ 2]    1     sub sp,#VSIZE 
      008FC3 20               [ 2] 3098 	pushw x  ; RETL1 
      008FC4 61 70            [ 1] 3099 	ld a,#TK_VAR 
      008FC6 70 6C 69         [ 4] 3100 	call expect
      008FC9 63 61            [ 2] 3101 	ldw (CVAR,sp),x  ; control variable 
      008FCB 74 69 6F         [ 4] 3102 	call let_var 
      008FCE 6E 20 73 61      [ 1] 3103 	bset flags,#FLOOP 
                                   3104 ; open space on stack for loop data 
      008FD2 76               [ 1] 3105 	clrw x 
      008FD3 65 64            [ 2] 3106 	ldw (BPTR,sp),x 
      008FD5 2E 0A            [ 2] 3107 	ldw (INW,sp),x 
      008FD7 00 08 30         [ 4] 3108 	call next_token 
      008FD8 A1 80            [ 1] 3109 	cp a,#TK_CMD 
      008FD8 C7 00            [ 1] 3110 	jreq 1$
      008FDA 04 E6 02         [ 2] 3111 	jp syntax_error
      001146                       3112 1$:  
      008FDD C1 00 04         [ 2] 3113 	cpw x,#to 
      008FE0 2A 03            [ 1] 3114 	jreq to
      008FE2 C7 00 04         [ 2] 3115 	jp syntax_error 
                                   3116 
                                   3117 ;-----------------------------------
                                   3118 ; BASIC: TO expr 
                                   3119 ; second part of FOR loop initilization
                                   3120 ; leave limit on stack and set 
                                   3121 ; FTO bit in 'flags'
                                   3122 ;-----------------------------------
      00114E                       3123 to: ; { var_addr -- var_addr limit step }
      008FE5 CF 00 05 90 AE   [ 2] 3124 	btjt flags,#FLOOP,1$
      008FEA 16 90 CD         [ 2] 3125 	jp syntax_error
      008FED A8 D5 CD         [ 4] 3126 1$: call relation  
      008FF0 A0 DC            [ 1] 3127 	cp a,#TK_INTGR 
      008FF2 A6 0D            [ 1] 3128 	jreq 2$ 
      008FF4 CD 83 41         [ 2] 3129 	jp syntax_error
      008FF7 81 05            [ 2] 3130 2$: ldw (LIMIT,sp),x
                                   3131 ;	ldw x,in.w 
      008FF8 CD 08 30         [ 4] 3132 	call next_token
      008FF8 52 01            [ 1] 3133 	cp a,#TK_NONE  
      008FFA 27 0E            [ 1] 3134 	jreq 4$ 
      008FFA 0F 01            [ 1] 3135 	cp a,#TK_CMD
      008FFC 26 05            [ 1] 3136 	jrne 3$
      008FFC CD 88 B0         [ 2] 3137 	cpw x,#step 
      008FFF A1 02            [ 1] 3138 	jreq step
      001172                       3139 3$:	
      001172                       3140 	_unget_token   	 
      009001 25 4F A1 02 27   [ 1]    1      mov in,in.saved  
      001177                       3141 4$:	
      009006 12 A1 03         [ 2] 3142 	ldw x,#1   ; default step  
      009009 27 13            [ 2] 3143 	ldw (FSTEP,sp),x 
      00900B A1 82            [ 2] 3144 	jra store_loop_addr 
                                   3145 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3146 
                                   3147 ;----------------------------------
                                   3148 ; BASIC: STEP expr 
                                   3149 ; optional third par of FOR loop
                                   3150 ; initialization. 	
                                   3151 ;------------------------------------
      00117E                       3152 step: ; {var limit -- var limit step}
      00900D 27 15 A1 09 27   [ 2] 3153 	btjt flags,#FLOOP,1$
      009012 18 A1 0A         [ 2] 3154 	jp syntax_error
      009015 27 18 20         [ 4] 3155 1$: call relation
      009018 28 84            [ 1] 3156 	cp a,#TK_INTGR
      009019 27 03            [ 1] 3157 	jreq 2$
      009019 CD A0 DC         [ 2] 3158 	jp syntax_error
      00901C 20 DC            [ 2] 3159 2$:	ldw (FSTEP,sp),x ; step
                                   3160 ; leave loop back entry point on cstack 
                                   3161 ; cstack is 1 call deep from interpreter
      00901E                       3162 store_loop_addr:
      00901E 9F CD 83         [ 2] 3163 	ldw x,basicptr  
      009021 41 20            [ 2] 3164 	ldw (BPTR,sp),x 
      009023 D6 00 00         [ 2] 3165 	ldw x,in.w 
      009024 1F 09            [ 2] 3166 	ldw (INW,sp),x   
      009024 FD 9F CD 83      [ 1] 3167 	bres flags,#FLOOP 
      009028 41 20 CF 1D      [ 1] 3168 	inc loop_depth  
      00902B 81               [ 4] 3169 	ret 
                                   3170 
                                   3171 ;--------------------------------
                                   3172 ; BASIC: NEXT var 
                                   3173 ; FOR loop control 
                                   3174 ; increment variable with step 
                                   3175 ; and compare with limit 
                                   3176 ; loop if threshold not crossed.
                                   3177 ; else stack. 
                                   3178 ; and decrement 'loop_depth' 
                                   3179 ;--------------------------------
      0011A5                       3180 next: ; {var limit step retl1 -- [var limit step ] }
      00902B 03 01 20 CD      [ 1] 3181 	tnz loop_depth 
      00902F 26 03            [ 1] 3182 	jrne 1$ 
      00902F CD 88 B0         [ 2] 3183 	jp syntax_error 
      0011AE                       3184 1$: 
      009032 A1 84            [ 1] 3185 	ld a,#TK_VAR 
      009034 27 03 CC         [ 4] 3186 	call expect
                                   3187 ; check for good variable after NEXT 	 
      009037 87 C1            [ 2] 3188 	cpw x,(CVAR,sp)
      009039 27 03            [ 1] 3189 	jreq 2$  
      009039 9F A4 0F         [ 2] 3190 	jp syntax_error ; not the good one 
      0011BA                       3191 2$: ; increment variable 
      00903C C7               [ 2] 3192 	ldw x,(x)  ; get var value 
      00903D 00 22 20         [ 2] 3193 	addw x,(FSTEP,sp) ; var+step 
      009040 B9 07            [ 2] 3194 	ldw y,(CVAR,sp)
      009041 90 FF            [ 2] 3195 	ldw (y),x ; save var new value 
                                   3196 ; check sign of STEP  
      009041 55 00            [ 1] 3197 	ld a,#0x80
      009043 03 00            [ 1] 3198 	bcp a,(FSTEP,sp)
      009045 02 CD            [ 1] 3199 	jrpl 4$
                                   3200 ;negative step 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009047 8D B1            [ 2] 3201 	cpw x,(LIMIT,sp)
      009049 A1 84            [ 1] 3202 	jrslt loop_done
      00904B 26 05            [ 2] 3203 	jra loop_back 
      0011CE                       3204 4$: ; positive step
      00904D CD 89            [ 2] 3205 	cpw x,(LIMIT,sp)
      00904F 0B 20            [ 1] 3206 	jrsgt loop_done
      0011D2                       3207 loop_back:
      009051 A8 0B            [ 2] 3208 	ldw x,(BPTR,sp)
      009052 CF 00 04         [ 2] 3209 	ldw basicptr,x 
      009052 0D 01 26 05 A6   [ 2] 3210 	btjf flags,#FRUN,1$ 
      009057 0D CD            [ 1] 3211 	ld a,(2,x)
      009059 83 41 5B         [ 1] 3212 	ld count,a
      00905C 01 81            [ 2] 3213 1$:	ldw x,(INW,sp)
      00905E CF 00 00         [ 2] 3214 	ldw in.w,x 
      00905E CE               [ 4] 3215 	ret 
      0011E7                       3216 loop_done:
                                   3217 	; remove loop data from stack  
      00905F 00               [ 2] 3218 	popw x
      0011E8                       3219 	_drop VSIZE 
      009060 05 1F            [ 2]    1     addw sp,#VSIZE 
      009062 03 C6 00 02      [ 1] 3220 	dec loop_depth 
                                   3221 ;	pushw x 
                                   3222 ;	ret 
      009066 6B               [ 2] 3223 	jp (x)
                                   3224 
                                   3225 ;----------------------------
                                   3226 ; called by goto/gosub
                                   3227 ; to get target line number 
                                   3228 ;---------------------------
      0011EF                       3229 get_target_line:
      009067 05 C6 00         [ 4] 3230 	call relation 
      00906A 04 6B            [ 1] 3231 	cp a,#TK_INTGR
      00906C 06 81            [ 1] 3232 	jreq 1$
      00906E CC 07 41         [ 2] 3233 	jp syntax_error
      00906E 1E               [ 1] 3234 1$:	clr a
      00906F 03 CF 00 05      [ 2] 3235 	ldw y,basicptr 
      009073 7B 05            [ 2] 3236 	ldw y,(y)
      009075 C7 00            [ 2] 3237 	pushw y 
      009077 02 7B            [ 2] 3238 	cpw x,(1,sp)
      009079 06 C7            [ 2] 3239 	addw sp,#2 
      00907B 00 04            [ 1] 3240 	jrult 11$
      00907D 81               [ 1] 3241 	inc a 
      00907E                       3242 11$:	
      00907E 52 07 44         [ 4] 3243 	call search_lineno  
      009080 5D               [ 2] 3244 	tnzw x 
      009080 0F 05            [ 1] 3245 	jrne 2$ 
      009082 CD 88            [ 1] 3246 	ld a,#ERR_NO_LINE 
      009084 B0 A1 02         [ 2] 3247 	jp tb_error 
      009087 26               [ 4] 3248 2$:	ret 
                                   3249 
                                   3250 ;------------------------
                                   3251 ; BASIC: GOTO line# 
                                   3252 ; jump to line# 
                                   3253 ; here cstack is 2 call deep from interpreter 
                                   3254 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      001215                       3255 goto:
      009088 08 CD A0 DC 03   [ 2] 3256 	btjt flags,#FRUN,0$ 
      00908D 05 CD            [ 1] 3257 	ld a,#ERR_RUN_ONLY
      00908F 88 B0 A1         [ 2] 3258 	jp tb_error 
      009092 85               [ 4] 3259 	ret 
      009093 27 03 CC         [ 4] 3260 0$:	call get_target_line
      001223                       3261 jp_to_target:
      009096 87 C1 1F         [ 2] 3262 	ldw basicptr,x 
      009099 06 0D            [ 1] 3263 	ld a,(2,x)
      00909B 05 26 06         [ 1] 3264 	ld count,a 
      00909E CD A8 AC CD      [ 1] 3265 	mov in,#3 
      0090A2 83               [ 4] 3266 	ret 
                                   3267 
                                   3268 
                                   3269 ;--------------------
                                   3270 ; BASIC: GOSUB line#
                                   3271 ; basic subroutine call
                                   3272 ; actual line# and basicptr 
                                   3273 ; are saved on cstack
                                   3274 ; here cstack is 2 call deep from interpreter 
                                   3275 ;--------------------
                           000003  3276 	RET_ADDR=3
                           000005  3277 	RET_INW=5
                           000004  3278 	VSIZE=4  
      001230                       3279 gosub:
      0090A3 41 00 00 20 06   [ 2] 3280 	btjt flags,#FRUN,0$ 
      0090A4 A6 06            [ 1] 3281 	ld a,#ERR_RUN_ONLY
      0090A4 A6 3A CD         [ 2] 3282 	jp tb_error 
      0090A7 83               [ 4] 3283 	ret 
      0090A8 41               [ 2] 3284 0$:	popw x 
      00123C                       3285 	_vars VSIZE  
      0090A9 CD 90            [ 2]    1     sub sp,#VSIZE 
      0090AB 5E               [ 2] 3286 	pushw x 
      0090AC 72 5F 00         [ 2] 3287 	ldw x,basicptr
      0090AF 04 CD            [ 2] 3288 	ldw (RET_ADDR,sp),x 
      0090B1 A1 E1 AE         [ 4] 3289 	call get_target_line  
      0090B4 16               [ 2] 3290 	pushw x 
      0090B5 90 3B 00         [ 2] 3291 	ldw x,in.w 
      0090B8 04 4B            [ 2] 3292 	ldw (RET_INW+2,sp),x
      0090BA 00               [ 2] 3293 	popw x 
      0090BB 72 FB            [ 2] 3294 	jra jp_to_target
                                   3295 
                                   3296 ;------------------------
                                   3297 ; BASIC: RETURN 
                                   3298 ; exit from a subroutine 
                                   3299 ; 
                                   3300 ;------------------------
      001250                       3301 return:
      0090BD 01 5C 5B 02 72   [ 2] 3302 	btjt flags,#FRUN,0$ 
      0090C2 5F 00            [ 1] 3303 	ld a,#ERR_RUN_ONLY
      0090C4 02 CD A5         [ 2] 3304 	jp tb_error 
      00125A                       3305 0$:	
      0090C7 FB A1            [ 2] 3306 	ldw x,(RET_ADDR,sp) 
      0090C9 84 27 06         [ 2] 3307 	ldw basicptr,x
      0090CC CD 90            [ 1] 3308 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0090CE 6E CC 87         [ 1] 3309 	ld count,a  
      0090D1 C1 16            [ 2] 3310 	ldw x,(RET_INW,sp)
      0090D3 06 90 FF         [ 2] 3311 	ldw in.w,x 
      0090D6 CD               [ 2] 3312 	popw x 
      00126A                       3313 	_drop VSIZE 
      0090D7 90 6E            [ 2]    1     addw sp,#VSIZE 
      0090D9 CD               [ 2] 3314 	pushw x
      0090DA 88               [ 4] 3315 	ret  
                                   3316 
                                   3317 
                                   3318 ;----------------------------------
                                   3319 ; BASIC: RUN
                                   3320 ; run BASIC program in RAM
                                   3321 ;----------------------------------- 
      00126E                       3322 run: 
      0090DB B0 A1 09 27 A0   [ 2] 3323 	btjf flags,#FRUN,0$  
      0090E0 A1               [ 1] 3324 	clr a 
      0090E1 00               [ 4] 3325 	ret
      001275                       3326 0$: 
      0090E2 27 07 A1 0B 27   [ 2] 3327 	btjf flags,#FBREAK,1$
      00127A                       3328 	_drop 2 
      0090E7 03 CC            [ 2]    1     addw sp,#2 
      0090E9 87 C1 EE         [ 4] 3329 	call rest_context
      0090EB                       3330 	_drop CTXT_SIZE 
      0090EB 5B 07            [ 2]    1     addw sp,#CTXT_SIZE 
      0090ED 81 19 00 20      [ 1] 3331 	bres flags,#FBREAK 
      0090EE 72 10 00 20      [ 1] 3332 	bset flags,#FRUN 
      0090EE 55 00 04         [ 2] 3333 	jp interpreter 
      0090F1 00 02 81         [ 2] 3334 1$:	ldw x,txtbgn
      0090F4 C3 00 1B         [ 2] 3335 	cpw x,txtend 
      0090F4 52 04            [ 1] 3336 	jrmi run_it 
      0090F6 0F 01 CD         [ 2] 3337 	ldw x,#err_no_prog
      0090F9 8C 69 A1         [ 4] 3338 	call puts 
      0090FC 02 24 03 CC 87   [ 1] 3339 	mov in,count
      009101 C1               [ 4] 3340 	ret 
      0012A0                       3341 run_it:	 
      009102 A1 03 25         [ 4] 3342     call ubound 
      0012A3                       3343 	_drop 2 ; drop return address 
      009105 04 85            [ 2]    1     addw sp,#2 
                                   3344 ; clear data pointer 
      009107 9F               [ 1] 3345 	clrw x 
      009108 6B 01 85         [ 2] 3346 	ldw data_ptr,x 
      00910B 9F 6B 02 85      [ 1] 3347 	clr data_ofs 
      00910F F6 14 02 18      [ 1] 3348 	clr data_len 
                                   3349 ; initialize BASIC pointer 
      009113 01 27 F9         [ 2] 3350 	ldw x,txtbgn 
      009116 5B 04 81         [ 2] 3351 	ldw basicptr,x 
      009119 E6 02            [ 1] 3352 	ld a,(2,x)
      009119 CD 8C 69         [ 1] 3353 	ld count,a
      00911C A1 02 27 03      [ 1] 3354 	mov in,#3	
      009120 CC 87 C1 20      [ 1] 3355 	bset flags,#FRUN 
      009123 CC 07 E4         [ 2] 3356 	jp interpreter 
                                   3357 
                                   3358 
                                   3359 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3360 ; BASIC: END
                                   3361 ; end running program
                                   3362 ;---------------------- 
      0012C7                       3363 cmd_end: 
                                   3364 ; clean stack 
      009123 85 9F 85         [ 2] 3365 	ldw x,#STACK_EMPTY
      009126 FA               [ 1] 3366 	ldw sp,x 
      009127 F7 81 C5         [ 2] 3367 	jp warm_start
                                   3368 
                                   3369 ;-----------------
                                   3370 ; 1 Khz beep 
                                   3371 ;-----------------
      009129                       3372 beep_1khz:: 
      009129 CD 8C 69         [ 2] 3373 	ldw x,#100
      00912C A1 02 27 03      [ 2] 3374 	ldw y,#1000
      009130 CC 87            [ 2] 3375 	jra beep
                                   3376 
                                   3377 ;-----------------------
                                   3378 ; BASIC: TONE expr1,expr2
                                   3379 ; used TIMER2 channel 1
                                   3380 ; to produce a tone 
                                   3381 ; arguments:
                                   3382 ;    expr1   frequency 
                                   3383 ;    expr2   duration msec.
                                   3384 ;---------------------------
      0012D7                       3385 tone:
      009132 C1 0B E9         [ 4] 3386 	call arg_list 
      009133 A1 02            [ 1] 3387 	cp a,#2 
      009133 85 9F            [ 1] 3388 	jreq 1$
      009135 43 85 F4         [ 2] 3389 	jp syntax_error 
      0012E1                       3390 1$: 
      009138 F7               [ 2] 3391 	popw x ; duration
      009139 81 85            [ 2] 3392 	popw y ; frequency 
      00913A                       3393 beep:  
      00913A CD               [ 2] 3394 	pushw x 
      00913B 8C 69 A1         [ 2] 3395 	ldw x,#TIM2_CLK_FREQ
      00913E 02               [ 2] 3396 	divw x,y 
                                   3397 ; round to nearest integer 
      00913F 27 03 CC 87      [ 2] 3398 	cpw y,#TIM2_CLK_FREQ/2
      009143 C1 85            [ 1] 3399 	jrmi 2$
      009145 9F               [ 1] 3400 	incw x 
      0012F0                       3401 2$:	 
      009146 85               [ 1] 3402 	ld a,xh 
      009147 F8 F7 81         [ 1] 3403 	ld TIM2_ARRH,a 
      00914A 9F               [ 1] 3404 	ld a,xl 
      00914A CD 8C 64         [ 1] 3405 	ld TIM2_ARRL,a 
                                   3406 ; 50% duty cycle 
      00914D A1               [ 1] 3407 	ccf 
      00914E 02               [ 2] 3408 	rrcw x 
      00914F 27               [ 1] 3409 	ld a,xh 
      009150 03 CC 87         [ 1] 3410 	ld TIM2_CCR1H,a 
      009153 C1               [ 1] 3411 	ld a,xl
      009154 C7 53 10         [ 1] 3412 	ld TIM2_CCR1L,a
      009154 85 9F A4 07      [ 1] 3413 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009158 88 A6 01 0D      [ 1] 3414 	bset TIM2_CR1,#TIM2_CR1_CEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00915C 01 27 05 48      [ 1] 3415 	bset TIM2_EGR,#TIM2_EGR_UG
      009160 0A               [ 2] 3416 	popw x 
      009161 01 20 F7         [ 4] 3417 	call pause02
      009164 5B 01 85 F4      [ 1] 3418 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009168 27 02 A6 01      [ 1] 3419 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00916C 5F               [ 4] 3420 	ret 
                                   3421 
                                   3422 ;-------------------------------
                                   3423 ; BASIC: ADCON 0|1 [,divisor]  
                                   3424 ; disable/enanble ADC 
                                   3425 ;-------------------------------
                           000003  3426 	ONOFF=3 
                           000001  3427 	DIVSOR=1
                           000004  3428 	VSIZE=4 
      00131B                       3429 power_adc:
      00916D 97 A6 84         [ 4] 3430 	call arg_list 
      009170 81 02            [ 1] 3431 	cp a,#2	
      009171 27 0B            [ 1] 3432 	jreq 1$
      009171 CD 8C            [ 1] 3433 	cp a,#1 
      009173 69 A1            [ 1] 3434 	jreq 0$ 
      009175 02 27 03         [ 2] 3435 	jp syntax_error 
      009178 CC 87 C1         [ 2] 3436 0$: ldw x,#0
      00917B 89               [ 2] 3437 	pushw x  ; divisor 
      00917B 85 9F            [ 2] 3438 1$: ldw x,(ONOFF,sp)
      00917D 85               [ 2] 3439 	tnzw x 
      00917E F7 81            [ 1] 3440 	jreq 2$ 
      009180 1E 01            [ 2] 3441 	ldw x,(DIVSOR,sp) ; divisor 
      009180 CD               [ 1] 3442 	ld a,xl
      009181 8C 64            [ 1] 3443 	and a,#7
      009183 A1               [ 1] 3444 	swap a 
      009184 01 27 03         [ 1] 3445 	ld ADC_CR1,a
      009187 CC 87 C1 85      [ 1] 3446 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00918B F6 5F 97 A6      [ 1] 3447 	bset ADC_CR1,#ADC_CR1_ADON 
      001343                       3448 	_usec_dly 7 
      00918F 84 81 1B         [ 2]    1     ldw x,#(16*7-2)/4
      009191 5A               [ 2]    2     decw x
      009191 CD               [ 1]    3     nop 
      009192 8D B1            [ 1]    4     jrne .-4
      009194 A1 84            [ 2] 3449 	jra 3$
      009196 27 03 CC 87      [ 1] 3450 2$: bres ADC_CR1,#ADC_CR1_ADON
      00919A C1 4F 5D 26      [ 1] 3451 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001354                       3452 3$:	_drop VSIZE 
      00919E 05 55            [ 2]    1     addw sp,#VSIZE 
      0091A0 00               [ 4] 3453 	ret
                                   3454 
                                   3455 ;-----------------------------
                                   3456 ; BASIC: ADCREAD (channel)
                                   3457 ; read adc channel {0..5}
                                   3458 ; output:
                                   3459 ;   A 		TK_INTGR 
                                   3460 ;   X 		value 
                                   3461 ;-----------------------------
      001357                       3462 analog_read:
      0091A1 04 00 02         [ 4] 3463 	call func_args 
      0091A4 81 01            [ 1] 3464 	cp a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0091A5 27 03            [ 1] 3465 	jreq 1$
      0091A5 85 52 0A         [ 2] 3466 	jp syntax_error
      0091A8 89               [ 2] 3467 1$: popw x 
      0091A9 A6 85 CD         [ 2] 3468 	cpw x,#5 
      0091AC 8C 57            [ 2] 3469 	jrule 2$
      0091AE 1F 07            [ 1] 3470 	ld a,#ERR_BAD_VALUE
      0091B0 CD 8E DD         [ 2] 3471 	jp tb_error 
      0091B3 72               [ 1] 3472 2$: ld a,xl
      0091B4 14 00 21         [ 1] 3473 	ld acc8,a 
      0091B7 5F 1F            [ 1] 3474 	ld a,#5
      0091B9 0B 1F 09         [ 1] 3475 	sub a,acc8 
      0091BC CD 88 B0         [ 1] 3476 	ld ADC_CSR,a
      0091BF A1 80 27 03      [ 1] 3477 	bset ADC_CR2,#ADC_CR2_ALIGN
      0091C3 CC 87 C1 01      [ 1] 3478 	bset ADC_CR1,#ADC_CR1_ADON
      0091C6 72 0F 54 00 FB   [ 2] 3479 	btjf ADC_CSR,#ADC_CSR_EOC,.
      0091C6 A3 91 CE         [ 2] 3480 	ldw x,ADC_DRH
      0091C9 27 03            [ 1] 3481 	ld a,#TK_INTGR
      0091CB CC               [ 4] 3482 	ret 
                                   3483 
                                   3484 ;-----------------------
                                   3485 ; BASIC: DREAD(pin)
                                   3486 ; Arduino pins 
                                   3487 ; read state of a digital pin 
                                   3488 ; pin# {0..15}
                                   3489 ; output:
                                   3490 ;    A 		TK_INTGR
                                   3491 ;    X      0|1 
                                   3492 ;-------------------------
                           000001  3493 	PINNO=1
                           000001  3494 	VSIZE=1
      00138B                       3495 digital_read:
      00138B                       3496 	_vars VSIZE 
      0091CC 87 C1            [ 2]    1     sub sp,#VSIZE 
      0091CE CD 0B E4         [ 4] 3497 	call func_args
      0091CE 72 04            [ 1] 3498 	cp a,#1
      0091D0 00 21            [ 1] 3499 	jreq 1$
      0091D2 03 CC 87         [ 2] 3500 	jp syntax_error
      0091D5 C1               [ 2] 3501 1$: popw x 
      0091D6 CD 8D B1         [ 2] 3502 	cpw x,#15 
      0091D9 A1 84            [ 2] 3503 	jrule 2$
      0091DB 27 03            [ 1] 3504 	ld a,#ERR_BAD_VALUE
      0091DD CC 87 C1         [ 2] 3505 	jp tb_error 
      0091E0 1F 05 CD         [ 4] 3506 2$:	call select_pin 
      0091E3 88 B0            [ 1] 3507 	ld (PINNO,sp),a
      0091E5 A1 00            [ 1] 3508 	ld a,(GPIO_IDR,x)
      0091E7 27 0E            [ 1] 3509 	tnz (PINNO,sp)
      0091E9 A1 80            [ 1] 3510 	jreq 8$
      0091EB 26               [ 1] 3511 3$: srl a 
      0091EC 05 A3            [ 1] 3512 	dec (PINNO,sp)
      0091EE 91 FE            [ 1] 3513 	jrne 3$ 
      0091F0 27 0C            [ 1] 3514 8$: and a,#1 
      0091F2 5F               [ 1] 3515 	clrw x 
      0091F2 55               [ 1] 3516 	ld xl,a 
      0091F3 00 03            [ 1] 3517 	ld a,#TK_INTGR
      0013B8                       3518 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0091F5 00 02            [ 2]    1     addw sp,#VSIZE 
      0091F7 81               [ 4] 3519 	ret
                                   3520 
                                   3521 
                                   3522 ;-----------------------
                                   3523 ; BASIC: DWRITE pin,0|1
                                   3524 ; Arduino pins 
                                   3525 ; write to a digital pin 
                                   3526 ; pin# {0..15}
                                   3527 ; output:
                                   3528 ;    A 		TK_INTGR
                                   3529 ;    X      0|1 
                                   3530 ;-------------------------
                           000001  3531 	PINNO=1
                           000002  3532 	PINVAL=2
                           000002  3533 	VSIZE=2
      0013BB                       3534 digital_write:
      0013BB                       3535 	_vars VSIZE 
      0091F7 AE 00            [ 2]    1     sub sp,#VSIZE 
      0091F9 01 1F 03         [ 4] 3536 	call arg_list  
      0091FC 20 14            [ 1] 3537 	cp a,#2 
      0091FE 27 03            [ 1] 3538 	jreq 1$
      0091FE 72 04 00         [ 2] 3539 	jp syntax_error
      009201 21               [ 2] 3540 1$: popw x 
      009202 03               [ 1] 3541 	ld a,xl 
      009203 CC 87            [ 1] 3542 	ld (PINVAL,sp),a
      009205 C1               [ 2] 3543 	popw x 
      009206 CD 8D B1         [ 2] 3544 	cpw x,#15 
      009209 A1 84            [ 2] 3545 	jrule 2$
      00920B 27 03            [ 1] 3546 	ld a,#ERR_BAD_VALUE
      00920D CC 87 C1         [ 2] 3547 	jp tb_error 
      009210 1F 03 E5         [ 4] 3548 2$:	call select_pin 
      009212 6B 01            [ 1] 3549 	ld (PINNO,sp),a 
      009212 CE 00            [ 1] 3550 	ld a,#1
      009214 05 1F            [ 1] 3551 	tnz (PINNO,sp)
      009216 0B CE            [ 1] 3552 	jreq 4$
      009218 00               [ 1] 3553 3$: sll a
      009219 01 1F            [ 1] 3554 	dec (PINNO,sp)
      00921B 09 72            [ 1] 3555 	jrne 3$
      00921D 15 00            [ 1] 3556 4$: tnz (PINVAL,sp)
      00921F 21 72            [ 1] 3557 	jrne 5$
      009221 5C               [ 1] 3558 	cpl a 
      009222 00 1E            [ 1] 3559 	and a,(GPIO_ODR,x)
      009224 81 02            [ 2] 3560 	jra 8$
      009225 EA 00            [ 1] 3561 5$: or a,(GPIO_ODR,x)
      009225 72 5D            [ 1] 3562 8$: ld (GPIO_ODR,x),a 
      0013F3                       3563 	_drop VSIZE 
      009227 00 1E            [ 2]    1     addw sp,#VSIZE 
      009229 26               [ 4] 3564 	ret
                                   3565 
                                   3566 
                                   3567 ;-----------------------
                                   3568 ; BASIC: STOP
                                   3569 ; stop progam execution  
                                   3570 ; without resetting pointers 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3571 ; the program is resumed
                                   3572 ; with RUN 
                                   3573 ;-------------------------
      0013F6                       3574 stop:
      00922A 03 CC 87 C1 02   [ 2] 3575 	btjt flags,#FRUN,2$
      00922E 4F               [ 1] 3576 	clr a
      00922E A6               [ 4] 3577 	ret 
      0013FD                       3578 2$:	 
                                   3579 ; create space on cstack to save context 
      00922F 85 CD 8C         [ 2] 3580 	ldw x,#break_point 
      009232 57 13 07         [ 4] 3581 	call puts 
      001403                       3582 	_drop 2 ;drop return address 
      009235 27 03            [ 2]    1     addw sp,#2 
      001405                       3583 	_vars CTXT_SIZE ; context size 
      009237 CC 87            [ 2]    1     sub sp,#CTXT_SIZE 
      009239 C1 0F DE         [ 4] 3584 	call save_context 
      00923A AE 16 90         [ 2] 3585 	ldw x,#tib 
      00923A FE 72 FB         [ 2] 3586 	ldw basicptr,x
      00923D 03               [ 1] 3587 	clr (x)
      00923E 16 07 90 FF      [ 1] 3588 	clr count  
      009242 A6               [ 1] 3589 	clrw x 
      009243 80 15 03         [ 2] 3590 	ldw in.w,x
      009246 2A 06 13 05      [ 1] 3591 	bres flags,#FRUN 
      00924A 2F 1B 20 04      [ 1] 3592 	bset flags,#FBREAK
      00924E CC 07 E4         [ 2] 3593 	jp interpreter 
      00924E 13 05 2C 15 61 6B 20  3594 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3595 
                                   3596 ;-----------------------
                                   3597 ; BASIC: NEW
                                   3598 ; from command line only 
                                   3599 ; free program memory
                                   3600 ; and clear variables 
                                   3601 ;------------------------
      009252                       3602 new: 
      009252 1E 0B CF 00 05   [ 2] 3603 	btjf flags,#FRUN,0$ 
      009257 72               [ 4] 3604 	ret 
      001448                       3605 0$:	
      009258 01 00 21         [ 4] 3606 	call clear_basic 
      00925B 05               [ 4] 3607 	ret 
                                   3608 
                                   3609 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3610 ;;;  flash memory operations
                                   3611 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3612 
                                   3613 ;--------------------------
                                   3614 ; align farptr to BLOCK_SIZE 
                                   3615 ;---------------------------
      00144C                       3616 row_align:
      00925C E6 02            [ 1] 3617 	ld a,#0x7f 
      00925E C7 00 04         [ 1] 3618 	and a,farptr+2 
      009261 1E 09            [ 1] 3619 	jreq 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009263 CF 00 01         [ 2] 3620 	ldw x,farptr+1 
      009266 81 00 80         [ 2] 3621 	addw x,#BLOCK_SIZE 
      009267 24 04            [ 1] 3622 	jrnc 0$
      009267 85 5B 0A 72      [ 1] 3623 	inc farptr 
      00926B 5A               [ 1] 3624 0$: ld a,xl 
      00926C 00 1E            [ 1] 3625 	and a,#0x80
      00926E FC               [ 1] 3626 	ld xl,a
      00926F CF 00 17         [ 2] 3627 	ldw farptr+1,x  	
      00926F CD               [ 4] 3628 1$:	ret
                                   3629 
                                   3630 ;--------------------
                                   3631 ; input:
                                   3632 ;   X     increment 
                                   3633 ; output:
                                   3634 ;   farptr  incremented 
                                   3635 ;---------------------
      001467                       3636 incr_farptr:
      009270 8D B1 A1 84      [ 2] 3637 	addw x,farptr+1 
      009274 27 03            [ 1] 3638 	jrnc 1$
      009276 CC 87 C1 4F      [ 1] 3639 	inc farptr 
      00927A 90 CE 00         [ 2] 3640 1$:	ldw farptr+1,x  
      00927D 05               [ 4] 3641 	ret 
                                   3642 
                                   3643 ;-----------------------------------
                                   3644 ; scan block for non zero byte 
                                   3645 ; block are 128 bytes 
                                   3646 ; input:
                                   3647 ;    farptr     address block  
                                   3648 ; output:
                                   3649 ;     A     0 cleared, other not cleared  
                                   3650 ;-----------------------------------
      001475                       3651 scan_block:
      00927E 90               [ 1] 3652 	clrw x 
      00927F FE 90 89 13      [ 5] 3653 1$: ldf a,([farptr],x) 
      009283 01 5B            [ 1] 3654 	jrne 2$
      009285 02               [ 1] 3655 	incw x 
      009286 25 01 4C         [ 2] 3656 	cpw x,#BLOCK_SIZE 
      009289 25 F4            [ 1] 3657 	jrult 1$ 
      009289 CD               [ 4] 3658 2$:	ret 
                                   3659 
                                   3660 
                                   3661 
                                   3662 ;-----------------------------------
                                   3663 ; BASIC: ERASE \E | \F 
                                   3664 ; erase all block in range from 
                                   3665 ;  'app_space' to FLASH end (0x20000)
                                   3666 ;  or all EEPROM 
                                   3667 ; that contains a non zero byte.  
                                   3668 ;-----------------------------------
                           000001  3669 	LIMIT=1 
                           000003  3670 	VSIZE = 3 
      001483                       3671 erase:
      00928A A3 C4 5D 26      [ 1] 3672 	clr farptr 
      001487                       3673 	_vars VSIZE 
      00928E 05 A6            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009290 05 CC 87         [ 4] 3674 	call next_token 
      009293 C3 81            [ 1] 3675 	cp a,#TK_CHAR 
      009295 27 03            [ 1] 3676 	jreq 0$ 
      009295 72 00 00         [ 2] 3677 	jp syntax_error
      009298 21               [ 1] 3678 0$: ld a,xl 
      009299 06 A6            [ 1] 3679 	and a,#0XDF 
      00929B 06 CC            [ 1] 3680 	cp a,#'E
      00929D 87 C3            [ 1] 3681 	jrne 1$
      00929F 81 CD 92         [ 2] 3682 	ldw x,#EEPROM_BASE 
      0092A2 6F 00 17         [ 2] 3683 	ldw farptr+1,x 
      0092A3 AE 47 FF         [ 2] 3684 	ldw x,#EEPROM_END
      0092A3 CF               [ 1] 3685 	clr a 
      0092A4 00 05            [ 2] 3686 	jra 3$ 
      0092A6 E6 02            [ 1] 3687 1$: cp a,#'F 
      0092A8 C7 00            [ 1] 3688 	jreq 2$
      0092AA 04 35 03         [ 2] 3689 	ldw x,#err_bad_value
      0092AD 00 02 81         [ 2] 3690 	jp tb_error
      0092B0                       3691 2$:
      0092B0 72 00 00         [ 2] 3692 	ldw x,#app_sign 
      0092B3 21 06 A6         [ 2] 3693 	ldw farptr+1,x 
      0092B6 06 CC            [ 1] 3694 	ld a,#(FLASH_END>>16)&0XFF 
      0092B8 87 C3 81         [ 2] 3695 	ldw x,#FLASH_END&0xffff
      0014BB                       3696 3$:
      0092BB 85 52            [ 1] 3697 	ld (LIMIT,sp),a 
      0092BD 04 89            [ 2] 3698 	ldw (LIMIT+1,sp),x 
                                   3699  ; operation done from RAM
                                   3700  ; copy code to RAM in tib   
      0092BF CE 00 05         [ 4] 3701 	call move_erase_to_ram
      0014C2                       3702 4$:	 
      0092C2 1F 03 CD         [ 4] 3703     call scan_block 
      0092C5 92 6F            [ 1] 3704 	jreq 5$  ; block already erased 
      0092C7 89 CE            [ 1] 3705     ld a,#'E 
      0092C9 00 01 1F         [ 4] 3706     call putc 
      0092CC 07 85 20         [ 4] 3707 	call block_erase   
                                   3708 ; this block is clean, next  
      0092CF D3 00 80         [ 2] 3709 5$:	ldw x,#BLOCK_SIZE
      0092D0 CD 14 67         [ 4] 3710 	call incr_farptr
                                   3711 ; check limit, 24 bit substraction  	
      0092D0 72 00            [ 1] 3712 	ld a,(LIMIT,sp)
      0092D2 00 21            [ 2] 3713 	ldw x,(LIMIT+1,sp)
      0092D4 05 A6 06 CC      [ 2] 3714 	subw x,farptr+1
      0092D8 87 C3 16         [ 1] 3715 	sbc a,farptr 
      0092DA 22 E0            [ 1] 3716 	jrugt 4$ 
      0092DA 1E 03 CF         [ 4] 3717 9$: call clear_basic
      0014E5                       3718 	_drop VSIZE 
      0092DD 00 05            [ 2]    1     addw sp,#VSIZE 
      0092DF E6               [ 4] 3719 	ret 
                                   3720 	
                                   3721 
                                   3722 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3723 ;  check for application signature 
                                   3724 ; output:
                                   3725 ;   Carry    0 app present 
                                   3726 ;            1 no app installed  
                                   3727 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0014E8                       3728 qsign: 
      0092E0 02 C7 00         [ 2] 3729 	ldw x,app_sign 
      0092E3 04 1E 05         [ 2] 3730 	cpw x,SIGNATURE ; "BC" 
      0092E6 CF               [ 4] 3731 	ret 
                                   3732 
                                   3733 ;---------------------------------------
                                   3734 ; BASIC: SAVE
                                   3735 ; write application in RAM to FLASH
                                   3736 ;--------------------------------------
      0014EF                       3737 save_app:
      0092E7 00 01 85         [ 4] 3738 	call qsign 
      0092EA 5B 04            [ 1] 3739 	jrne 1$
      0092EC 89 81 52         [ 2] 3740 	ldw x,#CANT_DO 
      0092EE CD 20 5C         [ 4] 3741 	call puts 
      0092EE 72 01 00         [ 2] 3742 	jp 9$
      0014FD                       3743 1$: 
      0092F1 21 02 4F         [ 2] 3744 	ldw x,txtbgn
      0092F4 81 00 1B         [ 2] 3745 	cpw x,txtend 
      0092F5 25 08            [ 1] 3746 	jrult 2$ 
      0092F5 72 09 00         [ 2] 3747 	ldw x,#NO_APP
      0092F8 21 12 5B         [ 4] 3748 	call puts 
      0092FB 02 CD            [ 2] 3749 	jra 9$
      00150D                       3750 2$: 
                                   3751 ; block programming flash
                                   3752 ; must be done from RAM 
      0092FD 90 6E 5B         [ 4] 3753 	call move_prg_to_ram
                                   3754 ; initialize farptr 
      009300 04 72 19 00      [ 1] 3755 	clr farptr 
      009304 21 72 10         [ 2] 3756 	ldw x,#app_sign 
      009307 00 21 CC         [ 2] 3757 	ldw farptr+1,x 
                                   3758 ; write signature
      00930A 88 64 CE         [ 2] 3759 	ldw x,SIGNATURE ; "BC" 
      00930D 00 1A C3         [ 2] 3760 	ldw rsign,x 
      009310 00 1C 2B         [ 2] 3761 	ldw x,txtend 
      009313 0C AE 87 5A      [ 2] 3762 	subw x,txtbgn 
      009317 CD A0 DC         [ 2] 3763 	ldw rsize,x   
                                   3764 ;copy block to flash
      00931A 55 00 04         [ 2] 3765 	ldw x,#rsign  
      00931D 00 02            [ 2] 3766 	ldw (1,sp),x   
      00931F 81 01            [ 2] 3767 3$:	ldw x,(1,sp)
      009320 CD 01 98         [ 4] 3768 	call write_row 
      009320 CD 8E            [ 1] 3769     ld a,#'. 
      009322 C2 5B 02         [ 4] 3770     call putc 
      009325 5F CF            [ 2] 3771 	ldw x,(1,sp)
      009327 00 07 72         [ 2] 3772 	addw x,#BLOCK_SIZE
      00932A 5F 00            [ 2] 3773 	ldw (1,sp),x  
      00932C 09 72 5F         [ 2] 3774 	cpw x,txtend 
      00932F 00 0A            [ 1] 3775 	jruge 8$
      009331 CE 00 1A         [ 2] 3776 	ldw x,#BLOCK_SIZE 
      009334 CF 00 05         [ 4] 3777 	call incr_farptr
      009337 E6 02            [ 2] 3778 	jra 3$ 
      00154D                       3779 8$:	
      00154D                       3780 	_drop 2   
      009339 C7 00            [ 2]    1     addw sp,#2 
      00933B 04               [ 4] 3781 9$: ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3782 
      00933C 35 03                 3783 SIGNATURE: .ascii "BC"
      00933E 00 02 72 10 00 21 CC  3784 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE before"
             88 64 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             62 65 66 6F 72 65 00
      009347 4E 6F 20 61 70 70 6C  3785 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3786 
                                   3787 ;---------------------
                                   3788 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3789 ; write 1 or more byte to FLASH or EEPROM
                                   3790 ; starting at address  
                                   3791 ; input:
                                   3792 ;   expr1  	is address 
                                   3793 ;   expr2,...,exprn   are bytes to write
                                   3794 ; output:
                                   3795 ;   none 
                                   3796 ;---------------------
                           000001  3797 	ADDR=1
                           000002  3798 	VSIZ=2 
      0015A7                       3799 write:
      0015A7                       3800 	_vars VSIZE 
      009347 AE 17            [ 2]    1     sub sp,#VSIZE 
      009349 FF 94 CC 88      [ 1] 3801 	clr farptr ; expect 16 bits address 
      00934D 45 0C E8         [ 4] 3802 	call expression
      00934E A1 84            [ 1] 3803 	cp a,#TK_INTGR 
      00934E AE 00            [ 1] 3804 	jreq 0$
      009350 64 90 AE         [ 2] 3805 	jp syntax_error
      009353 03 E8            [ 2] 3806 0$: ldw (ADDR,sp),x 
      009355 20 0D 30         [ 4] 3807 	call next_token 
      009357 A1 09            [ 1] 3808 	cp a,#TK_COMMA 
      009357 CD 8C            [ 1] 3809 	jreq 1$ 
      009359 69 A1            [ 2] 3810 	jra 9$ 
      00935B 02 27 03         [ 4] 3811 1$:	call expression
      00935E CC 87            [ 1] 3812 	cp a,#TK_INTGR
      009360 C1 03            [ 1] 3813 	jreq 2$
      009361 CC 07 41         [ 2] 3814 	jp syntax_error
      009361 85               [ 1] 3815 2$:	ld a,xl 
      009362 90 85            [ 2] 3816 	ldw x,(ADDR,sp) 
      009364 CF 00 17         [ 2] 3817 	ldw farptr+1,x 
      009364 89               [ 1] 3818 	clrw x 
      009365 AE F4 24         [ 4] 3819 	call write_byte
      009368 65 90            [ 2] 3820 	ldw x,(ADDR,sp)
      00936A A3               [ 1] 3821 	incw x 
      00936B 7A 12            [ 2] 3822 	jra 0$ 
      0015DB                       3823 9$:
      0015DB                       3824 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00936D 2B 01            [ 2]    1     addw sp,#VSIZE 
      00936F 5C               [ 4] 3825 	ret 
                                   3826 
                                   3827 
                                   3828 ;---------------------
                                   3829 ;BASIC: CHAR(expr)
                                   3830 ; évaluate expression 
                                   3831 ; and take the 7 least 
                                   3832 ; bits as ASCII character
                                   3833 ; return a TK_CHAR 
                                   3834 ;---------------------
      009370                       3835 char:
      009370 9E C7 53         [ 4] 3836 	call func_args 
      009373 0D 9F            [ 1] 3837 	cp a,#1
      009375 C7 53            [ 1] 3838 	jreq 1$
      009377 0E 8C 56         [ 2] 3839 	jp syntax_error
      00937A 9E               [ 2] 3840 1$:	popw x 
      00937B C7               [ 1] 3841 	ld a,xl 
      00937C 53 0F            [ 1] 3842 	and a,#0x7f 
      00937E 9F               [ 1] 3843 	ld xl,a
      00937F C7 53            [ 1] 3844 	ld a,#TK_CHAR
      009381 10               [ 4] 3845 	ret
                                   3846 
                                   3847 ;---------------------
                                   3848 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3849 ; extract first character 
                                   3850 ; of string argument 
                                   3851 ; return it as TK_INTGR 
                                   3852 ;---------------------
      0015F0                       3853 ascii:
      009382 72 10            [ 1] 3854 	ld a,#TK_LPAREN
      009384 53 08 72         [ 4] 3855 	call expect 
      009387 10 53 00         [ 4] 3856 	call next_token 
      00938A 72 10            [ 1] 3857 	cp a,#TK_QSTR 
      00938C 53 04            [ 1] 3858 	jreq 1$
      00938E 85 CD            [ 1] 3859 	cp a,#TK_CHAR 
      009390 97 27            [ 1] 3860 	jreq 2$ 
      009392 72 11            [ 1] 3861 	cp a,#TK_CFUNC 
      009394 53 08            [ 1] 3862 	jreq 0$
      009396 72 11 53         [ 2] 3863 	jp syntax_error
      009399 00               [ 4] 3864 0$: call (x)
      00939A 81 03            [ 2] 3865 	jra 2$
      00939B                       3866 1$: 
      00939B CD               [ 1] 3867 	ld a,(x) 
      00939C 8C               [ 1] 3868 	clrw x
      00939D 69               [ 1] 3869 	ld xl,a 
      00160D                       3870 2$: 
      00939E A1               [ 2] 3871 	pushw x 
      00939F 02 27            [ 1] 3872 	ld a,#TK_RPAREN 
      0093A1 0B A1 01         [ 4] 3873 	call expect
      0093A4 27               [ 2] 3874 	popw x 
      0093A5 03 CC            [ 1] 3875 	ld a,#TK_INTGR 
      0093A7 87               [ 4] 3876 	ret 
                                   3877 
                                   3878 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3879 ;BASIC: KEY
                                   3880 ; wait for a character 
                                   3881 ; received from STDIN 
                                   3882 ; input:
                                   3883 ;	none 
                                   3884 ; output:
                                   3885 ;	X 		ASCII character 
                                   3886 ;---------------------
      001617                       3887 key:
      0093A8 C1 AE 00         [ 4] 3888 	call getc 
      0093AB 00               [ 1] 3889 	clrw x 
      0093AC 89               [ 1] 3890 	ld xl,a 
      0093AD 1E 03            [ 1] 3891 	ld a,#TK_INTGR
      0093AF 5D               [ 4] 3892 	ret
                                   3893 
                                   3894 ;----------------------
                                   3895 ; BASIC: QKEY
                                   3896 ; Return true if there 
                                   3897 ; is a character in 
                                   3898 ; waiting in STDIN 
                                   3899 ; input:
                                   3900 ;  none 
                                   3901 ; output:
                                   3902 ;   X 		0|-1 
                                   3903 ;-----------------------
      00161F                       3904 qkey:: 
      0093B0 27               [ 1] 3905 	clrw x 
      0093B1 1A 1E 01         [ 1] 3906 	ld a,rx1_head
      0093B4 9F A4 07         [ 1] 3907 	cp a,rx1_tail 
      0093B7 4E C7            [ 1] 3908 	jreq 9$ 
      0093B9 54               [ 2] 3909 	cplw x 
      0093BA 01 72            [ 1] 3910 9$: ld a,#TK_INTGR
      0093BC 16               [ 4] 3911 	ret 
                                   3912 
                                   3913 ;---------------------
                                   3914 ; BASIC: GPIO(expr,reg)
                                   3915 ; return gpio address 
                                   3916 ; expr {0..8}
                                   3917 ; input:
                                   3918 ;   none 
                                   3919 ; output:
                                   3920 ;   X 		gpio register address
                                   3921 ;----------------------------
                           000003  3922 	PORT=3
                           000001  3923 	REG=1 
                           000004  3924 	VSIZE=4 
      00162C                       3925 gpio:
      0093BD 50 CA 72         [ 4] 3926 	call func_args 
      0093C0 10 54            [ 1] 3927 	cp a,#2
      0093C2 01 AE            [ 1] 3928 	jreq 1$
      0093C4 00 1B 5A         [ 2] 3929 	jp syntax_error  
      001636                       3930 1$:	
      0093C7 9D 26            [ 2] 3931 	ldw x,(PORT,sp)
      0093C9 FA 20            [ 1] 3932 	jrmi bad_port
      0093CB 08 72 11         [ 2] 3933 	cpw x,#9
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0093CE 54 01            [ 1] 3934 	jrpl bad_port
      0093D0 72 17            [ 1] 3935 	ld a,#5
      0093D2 50               [ 4] 3936 	mul x,a
      0093D3 CA 5B 04         [ 2] 3937 	addw x,#GPIO_BASE 
      0093D6 81 03            [ 2] 3938 	ldw (PORT,sp),x  
      0093D7 1E 01            [ 2] 3939 	ldw x,(REG,sp) 
      0093D7 CD 8C 64         [ 2] 3940 	addw x,(PORT,sp)
      0093DA A1 01            [ 1] 3941 	ld a,#TK_INTGR
      00164E                       3942 	_drop VSIZE 
      0093DC 27 03            [ 2]    1     addw sp,#VSIZE 
      0093DE CC               [ 4] 3943 	ret
      001651                       3944 bad_port:
      0093DF 87 C1            [ 1] 3945 	ld a,#ERR_BAD_VALUE
      0093E1 85 A3 00         [ 2] 3946 	jp tb_error
                                   3947 
                                   3948 
                                   3949 ;-------------------------
                                   3950 ; BASIC: UFLASH 
                                   3951 ; return free flash address
                                   3952 ; input:
                                   3953 ;  none 
                                   3954 ; output:
                                   3955 ;	A		TK_INTGR
                                   3956 ;   X 		free address 
                                   3957 ;---------------------------
      001656                       3958 uflash:
      0093E4 05 23 05         [ 2] 3959 	ldw x,app_sign
      0093E7 A6 0A CC         [ 2] 3960 	cpw x,#4243 ; signature "BC" 
      0093EA 87 C3            [ 1] 3961 	jreq 1$
      0093EC 9F C7 00         [ 2] 3962 	ldw x,app_size 
      0093EF 0E A6 05         [ 2] 3963 	addw x,#app
      0093F2 C0 00            [ 2] 3964 	jra 2$
      0093F4 0E C7 54         [ 2] 3965 1$:	ldw x,#app_space 
      0093F7 00 72            [ 1] 3966 2$:	ld a,#TK_INTGR 
      0093F9 16               [ 4] 3967 	ret 
                                   3968 
                                   3969 
                                   3970 ;---------------------
                                   3971 ; BASIC: USR(addr[,arg])
                                   3972 ; execute a function written 
                                   3973 ; in binary code.
                                   3974 ; binary fonction should 
                                   3975 ; return token attribute in A 
                                   3976 ; and value in X. 
                                   3977 ; input:
                                   3978 ;   addr	routine address 
                                   3979 ;   arg 	is an optional argument 
                                   3980 ; output:
                                   3981 ;   A 		token attribute 
                                   3982 ;   X       returned value 
                                   3983 ;---------------------
      00166C                       3984 usr:
      0093FA 54 02            [ 2] 3985 	pushw y 	
      0093FC 72 10 54         [ 4] 3986 	call func_args 
      0093FF 01 72            [ 1] 3987 	cp a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009401 0F 54            [ 1] 3988 	jreq 2$
      009403 00 FB            [ 1] 3989 	cp a,#2
      009405 CE 54            [ 1] 3990 	jreq 2$  
      009407 04 A6 84         [ 2] 3991 	jp syntax_error 
      00940A 81 85            [ 2] 3992 2$: popw y  ; arg|addr 
      00940B A1 01            [ 1] 3993 	cp a,#1
      00940B 52 01            [ 1] 3994 	jreq 3$
      00940D CD               [ 2] 3995 	popw x ; addr
      00940E 8C               [ 1] 3996 	exgw x,y 
      00940F 64 A1            [ 4] 3997 3$: call (y)
      009411 01 27            [ 2] 3998 	popw y 
      009413 03               [ 4] 3999 	ret 
                                   4000 
                                   4001 ;------------------------------
                                   4002 ; BASIC: BYE 
                                   4003 ; halt mcu in its lowest power mode 
                                   4004 ; wait for reset or external interrupt
                                   4005 ; do a cold start on wakeup.
                                   4006 ;------------------------------
      001689                       4007 bye:
      009414 CC 87 C1 85 A3   [ 2] 4008 	btjf UART1_SR,#UART_SR_TC,.
      009419 00               [10] 4009 	halt
      00941A 0F 23 05         [ 2] 4010 	jp cold_start  
                                   4011 
                                   4012 ;----------------------------------
                                   4013 ; BASIC: SLEEP 
                                   4014 ; halt mcu until reset or external
                                   4015 ; interrupt.
                                   4016 ; Resume progam after SLEEP command
                                   4017 ;----------------------------------
      001692                       4018 sleep:
      00941D A6 0A CC 87 C3   [ 2] 4019 	btjf UART1_SR,#UART_SR_TC,.
      009422 CD 98 65 6B      [ 1] 4020 	bset flags,#FSLEEP
      009426 01               [10] 4021 	halt 
      009427 E6               [ 4] 4022 	ret 
                                   4023 
                                   4024 ;-------------------------------
                                   4025 ; BASIC: PAUSE expr 
                                   4026 ; suspend execution for n msec.
                                   4027 ; input:
                                   4028 ;	none
                                   4029 ; output:
                                   4030 ;	none 
                                   4031 ;------------------------------
      00169D                       4032 pause:
      009428 01 0D 01         [ 4] 4033 	call expression
      00942B 27 05            [ 1] 4034 	cp a,#TK_INTGR
      00942D 44 0A            [ 1] 4035 	jreq pause02 
      00942F 01 26 FB         [ 2] 4036 	jp syntax_error
      0016A7                       4037 pause02: 
      009432 A4               [ 2] 4038 1$: tnzw x 
      009433 01 5F            [ 1] 4039 	jreq 2$
      009435 97               [10] 4040 	wfi 
      009436 A6               [ 2] 4041 	decw x 
      009437 84 5B            [ 1] 4042 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009439 01               [ 1] 4043 2$:	clr a 
      00943A 81               [ 4] 4044 	ret 
                                   4045 
                                   4046 ;------------------------------
                                   4047 ; BASIC: AWU expr
                                   4048 ; halt mcu for 'expr' milliseconds
                                   4049 ; use Auto wakeup peripheral
                                   4050 ; all oscillators stopped except LSI
                                   4051 ; range: 1ms - 511ms
                                   4052 ; input:
                                   4053 ;  none
                                   4054 ; output:
                                   4055 ;  none:
                                   4056 ;------------------------------
      00943B                       4057 awu:
      00943B 52 02 CD         [ 4] 4058   call expression
      00943E 8C 69            [ 1] 4059   cp a,#TK_INTGR
      009440 A1 02            [ 1] 4060   jreq awu02
      009442 27 03 CC         [ 2] 4061   jp syntax_error
      0016BA                       4062 awu02:
      009445 87 C1 85         [ 2] 4063   cpw x,#5120
      009448 9F 6B            [ 1] 4064   jrmi 1$ 
      00944A 02 85 A3 00      [ 1] 4065   mov AWU_TBR,#15 
      00944E 0F 23            [ 1] 4066   ld a,#30
      009450 05               [ 2] 4067   div x,a
      009451 A6 0A            [ 1] 4068   ld a,#16
      009453 CC               [ 2] 4069   div x,a 
      009454 87 C3            [ 2] 4070   jra 4$
      0016CB                       4071 1$: 
      009456 CD 98 65         [ 2] 4072   cpw x,#2048
      009459 6B 01            [ 1] 4073   jrmi 2$ 
      00945B A6 01 0D 01      [ 1] 4074   mov AWU_TBR,#14
      00945F 27 05            [ 1] 4075   ld a,#80
      009461 48               [ 2] 4076   div x,a 
      009462 0A 01            [ 2] 4077   jra 4$   
      0016D9                       4078 2$:
      009464 26 FB 0D 02      [ 1] 4079   mov AWU_TBR,#7
      0016DD                       4080 3$:  
                                   4081 ; while X > 64  divide by 2 and increment AWU_TBR 
      009468 26 05 43         [ 2] 4082   cpw x,#64 
      00946B E4 00            [ 2] 4083   jrule 4$ 
      00946D 20 02 EA 00      [ 1] 4084   inc AWU_TBR 
      009471 E7               [ 2] 4085   srlw x 
      009472 00 5B            [ 2] 4086   jra 3$ 
      0016E9                       4087 4$:
      009474 02               [ 1] 4088   ld a, xl
      009475 81               [ 1] 4089   dec a 
      009476 27 01            [ 1] 4090   jreq 5$
      009476 72               [ 1] 4091   dec a 	
      0016EE                       4092 5$: 
      009477 00 00            [ 1] 4093   and a,#0x3e 
      009479 21 02 4F         [ 1] 4094   ld AWU_APR,a 
      00947C 81 18 50 F0      [ 1] 4095   bset AWU_CSR,#AWU_CSR_AWUEN
      00947D 8E               [10] 4096   halt 
                                   4097 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00947D AE               [ 4] 4098   ret 
                                   4099 
                                   4100 ;------------------------------
                                   4101 ; BASIC: TICKS
                                   4102 ; return msec ticks counter value 
                                   4103 ; input:
                                   4104 ; 	none 
                                   4105 ; output:
                                   4106 ;	X 		TK_INTGR
                                   4107 ;-------------------------------
      0016F9                       4108 get_ticks:
      00947E 94 A4 CD         [ 2] 4109 	ldw x,ticks 
      009481 A0 DC            [ 1] 4110 	ld a,#TK_INTGR
      009483 5B               [ 4] 4111 	ret 
                                   4112 
                                   4113 
                                   4114 
                                   4115 ;------------------------------
                                   4116 ; BASIC: ABS(expr)
                                   4117 ; return absolute value of expr.
                                   4118 ; input:
                                   4119 ;   none
                                   4120 ; output:
                                   4121 ;   X     	positive integer
                                   4122 ;-------------------------------
      0016FF                       4123 abs:
      009484 02 52 04         [ 4] 4124 	call func_args 
      009487 CD 90            [ 1] 4125 	cp a,#1 
      009489 5E AE            [ 1] 4126 	jreq 0$ 
      00948B 16 90 CF         [ 2] 4127 	jp syntax_error
      001709                       4128 0$:  
      00948E 00               [ 2] 4129     popw x   
      00948F 05               [ 1] 4130 	ld a,xh 
      009490 7F 72            [ 1] 4131 	bcp a,#0x80 
      009492 5F 00            [ 1] 4132 	jreq 2$ 
      009494 04               [ 2] 4133 	negw x 
      009495 5F CF            [ 1] 4134 2$: ld a,#TK_INTGR 
      009497 00               [ 4] 4135 	ret 
                                   4136 
                                   4137 ;------------------------------
                                   4138 ; BASIC: AND(expr1,expr2)
                                   4139 ; Apply bit AND relation between
                                   4140 ; the 2 arguments, i.e expr1 & expr2 
                                   4141 ; output:
                                   4142 ; 	A 		TK_INTGR
                                   4143 ;   X 		result 
                                   4144 ;------------------------------
      001713                       4145 bit_and:
      009498 01 72 11         [ 4] 4146 	call func_args 
      00949B 00 21            [ 1] 4147 	cp a,#2
      00949D 72 18            [ 1] 4148 	jreq 1$
      00949F 00 21 CC         [ 2] 4149 	jp syntax_error 
      0094A2 88               [ 2] 4150 1$:	popw x 
      0094A3 64               [ 1] 4151 	ld a,xh 
      0094A4 0A 62            [ 1] 4152 	and a,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0094A6 72               [ 1] 4153 	ld xh,a 
      0094A7 65               [ 1] 4154 	ld a,xl
      0094A8 61 6B            [ 1] 4155 	and a,(2,sp)
      0094AA 20               [ 1] 4156 	ld xl,a 
      001726                       4157 	_drop 2 
      0094AB 70 6F            [ 2]    1     addw sp,#2 
      0094AD 69 6E            [ 1] 4158 	ld a,#TK_INTGR
      0094AF 74               [ 4] 4159 	ret
                                   4160 
                                   4161 ;------------------------------
                                   4162 ; BASIC: OR(expr1,expr2)
                                   4163 ; Apply bit OR relation between
                                   4164 ; the 2 arguments, i.e expr1 | expr2 
                                   4165 ; output:
                                   4166 ; 	A 		TK_INTGR
                                   4167 ;   X 		result 
                                   4168 ;------------------------------
      00172B                       4169 bit_or:
      0094B0 2C 20 52         [ 4] 4170 	call func_args 
      0094B3 55 4E            [ 1] 4171 	cp a,#2
      0094B5 20 74            [ 1] 4172 	jreq 1$
      0094B7 6F 20 72         [ 2] 4173 	jp syntax_error 
      001735                       4174 1$: 
      0094BA 65               [ 2] 4175 	popw x 
      0094BB 73               [ 1] 4176 	ld a,xh 
      0094BC 75 6D            [ 1] 4177 	or a,(1,sp)
      0094BE 65               [ 1] 4178 	ld xh,a 
      0094BF 2E               [ 1] 4179 	ld a,xl 
      0094C0 0A 00            [ 1] 4180 	or a,(2,sp)
      0094C2 97               [ 1] 4181 	ld xl,a 
      00173E                       4182 	_drop 2 
      0094C2 72 01            [ 2]    1     addw sp,#2 
      0094C4 00 21            [ 1] 4183 	ld a,#TK_INTGR 
      0094C6 01               [ 4] 4184 	ret
                                   4185 
                                   4186 ;------------------------------
                                   4187 ; BASIC: XOR(expr1,expr2)
                                   4188 ; Apply bit XOR relation between
                                   4189 ; the 2 arguments, i.e expr1 ^ expr2 
                                   4190 ; output:
                                   4191 ; 	A 		TK_INTGR
                                   4192 ;   X 		result 
                                   4193 ;------------------------------
      001743                       4194 bit_xor:
      0094C7 81 0B E4         [ 4] 4195 	call func_args 
      0094C8 A1 02            [ 1] 4196 	cp a,#2
      0094C8 CD 86            [ 1] 4197 	jreq 1$
      0094CA 29 81 41         [ 2] 4198 	jp syntax_error 
      0094CC                       4199 1$: 
      0094CC A6               [ 2] 4200 	popw x 
      0094CD 7F               [ 1] 4201 	ld a,xh 
      0094CE C4 00            [ 1] 4202 	xor a,(1,sp)
      0094D0 19               [ 1] 4203 	ld xh,a 
      0094D1 27               [ 1] 4204 	ld a,xl 
      0094D2 13 CE            [ 1] 4205 	xor a,(2,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0094D4 00               [ 1] 4206 	ld xl,a 
      001756                       4207 	_drop 2 
      0094D5 18 1C            [ 2]    1     addw sp,#2 
      0094D7 00 80            [ 1] 4208 	ld a,#TK_INTGR 
      0094D9 24               [ 4] 4209 	ret 
                                   4210 
                                   4211 ;------------------------------
                                   4212 ; BASIC: LSHIFT(expr1,expr2)
                                   4213 ; logical shift left expr1 by 
                                   4214 ; expr2 bits 
                                   4215 ; output:
                                   4216 ; 	A 		TK_INTGR
                                   4217 ;   X 		result 
                                   4218 ;------------------------------
      00175B                       4219 lshift:
      0094DA 04 72 5C         [ 4] 4220 	call func_args
      0094DD 00 17            [ 1] 4221 	cp a,#2 
      0094DF 9F A4            [ 1] 4222 	jreq 1$
      0094E1 80 97 CF         [ 2] 4223 	jp syntax_error
      0094E4 00 18            [ 2] 4224 1$: popw y   
      0094E6 81               [ 2] 4225 	popw x 
      0094E7 90 5D            [ 2] 4226 	tnzw y 
      0094E7 72 BB            [ 1] 4227 	jreq 4$
      0094E9 00               [ 2] 4228 2$:	sllw x 
      0094EA 18 24            [ 2] 4229 	decw y 
      0094EC 04 72            [ 1] 4230 	jrne 2$
      001771                       4231 4$:  
      0094EE 5C 00            [ 1] 4232 	ld a,#TK_INTGR
      0094F0 17               [ 4] 4233 	ret
                                   4234 
                                   4235 ;------------------------------
                                   4236 ; BASIC: RSHIFT(expr1,expr2)
                                   4237 ; logical shift right expr1 by 
                                   4238 ; expr2 bits.
                                   4239 ; output:
                                   4240 ; 	A 		TK_INTGR
                                   4241 ;   X 		result 
                                   4242 ;------------------------------
      001774                       4243 rshift:
      0094F1 CF 00 18         [ 4] 4244 	call func_args
      0094F4 81 02            [ 1] 4245 	cp a,#2 
      0094F5 27 03            [ 1] 4246 	jreq 1$
      0094F5 5F 92 AF         [ 2] 4247 	jp syntax_error
      0094F8 00 17            [ 2] 4248 1$: popw y  
      0094FA 26               [ 2] 4249 	popw x
      0094FB 06 5C            [ 2] 4250 	tnzw y 
      0094FD A3 00            [ 1] 4251 	jreq 4$
      0094FF 80               [ 2] 4252 2$:	srlw x 
      009500 25 F4            [ 2] 4253 	decw y 
      009502 81 FB            [ 1] 4254 	jrne 2$
      009503                       4255 4$:  
      009503 72 5F            [ 1] 4256 	ld a,#TK_INTGR
      009505 00               [ 4] 4257 	ret
                                   4258 
                                   4259 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4260 ; BASIC: FCPU integer
                                   4261 ; set CPU frequency 
                                   4262 ;-------------------------- 
                                   4263 
      00178D                       4264 fcpu:
      009506 17 52            [ 1] 4265 	ld a,#TK_INTGR
      009508 03 CD 88         [ 4] 4266 	call expect 
      00950B B0               [ 1] 4267 	ld a,xl 
      00950C A1 03            [ 1] 4268 	and a,#7 
      00950E 27 03 CC         [ 1] 4269 	ld CLK_CKDIVR,a 
      009511 87               [ 4] 4270 	ret 
                                   4271 
                                   4272 ;------------------------------
                                   4273 ; BASIC: PMODE pin#, mode 
                                   4274 ; Arduino pin. 
                                   4275 ; define pin as input or output
                                   4276 ; pin#: {0..15}
                                   4277 ; mode: INPUT|OUTPUT  
                                   4278 ;------------------------------
                           000001  4279 	PINNO=1
                           000001  4280 	VSIZE=1
      001799                       4281 pin_mode:
      001799                       4282 	_vars VSIZE 
      009512 C1 9F            [ 2]    1     sub sp,#VSIZE 
      009514 A4 DF A1         [ 4] 4283 	call arg_list 
      009517 45 26            [ 1] 4284 	cp a,#2 
      009519 0C AE            [ 1] 4285 	jreq 1$
      00951B 40 00 CF         [ 2] 4286 	jp syntax_error 
      00951E 00 18            [ 2] 4287 1$: popw y ; mode 
      009520 AE               [ 2] 4288 	popw x ; Dx pin 
      009521 47 FF 4F         [ 4] 4289 	call select_pin 
      009524 20 15            [ 1] 4290 	ld (PINNO,sp),a  
      009526 A1 46            [ 1] 4291 	ld a,#1 
      009528 27 06            [ 1] 4292 	tnz (PINNO,sp)
      00952A AE 87            [ 1] 4293 	jreq 4$
      00952C 0B               [ 1] 4294 2$:	sll a 
      00952D CC 87            [ 1] 4295 	dec (PINNO,sp)
      00952F C3 FB            [ 1] 4296 	jrne 2$ 
      009530 6B 01            [ 1] 4297 	ld (PINNO,sp),a
      009530 AE AA            [ 1] 4298 	ld a,(PINNO,sp)
      009532 80 CF            [ 1] 4299 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009534 00 18            [ 1] 4300 	ld (GPIO_CR1,x),a 
      009536 A6 02 AE 7F      [ 2] 4301 4$:	cpw y,#OUTP 
      00953A FF 10            [ 1] 4302 	jreq 6$
                                   4303 ; input mode
                                   4304 ; disable external interrupt 
      00953B 7B 01            [ 1] 4305 	ld a,(PINNO,sp)
      00953B 6B               [ 1] 4306 	cpl a 
      00953C 01 1F            [ 1] 4307 	and a,(GPIO_CR2,x)
      00953E 02 CD            [ 1] 4308 	ld (GPIO_CR2,x),a 
                                   4309 ;clear bit in DDR for input mode 
      009540 81 BE            [ 1] 4310 	ld a,(PINNO,sp)
      009542 43               [ 1] 4311 	cpl a 
      009542 CD 94            [ 1] 4312 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009544 F5 27            [ 1] 4313 	ld (GPIO_DDR,x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009546 08 A6            [ 2] 4314 	jra 9$
      0017D6                       4315 6$: ;output mode  
      009548 45 CD            [ 1] 4316 	ld a,(PINNO,sp)
      00954A 83 41            [ 1] 4317 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00954C CD 82            [ 1] 4318 	ld (GPIO_DDR,x),a 
      00954E 3C AE            [ 1] 4319 	ld a,(PINNO,sp)
      009550 00 80            [ 1] 4320 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009552 CD 94            [ 1] 4321 	ld (GPIO_CR2,x),a 
      0017E2                       4322 9$:	
      0017E2                       4323 	_drop VSIZE 
      009554 E7 7B            [ 2]    1     addw sp,#VSIZE 
      009556 01               [ 4] 4324 	ret
                                   4325 
                                   4326 ;------------------------
                                   4327 ; select Arduino pin 
                                   4328 ; input:
                                   4329 ;   X 	 {0..15} Arduino Dx 
                                   4330 ; output:
                                   4331 ;   A     stm8s208 pin 
                                   4332 ;   X     base address s208 GPIO port 
                                   4333 ;---------------------------
      0017E5                       4334 select_pin:
      009557 1E               [ 2] 4335 	sllw x 
      009558 02 72 B0         [ 2] 4336 	addw x,#arduino_to_8s208 
      00955B 00               [ 2] 4337 	ldw x,(x)
      00955C 18               [ 1] 4338 	ld a,xl 
      00955D C2               [ 1] 4339 	push a 
      00955E 00               [ 1] 4340 	swapw x 
      00955F 17 22            [ 1] 4341 	ld a,#5 
      009561 E0               [ 4] 4342 	mul x,a 
      009562 CD 86 29         [ 2] 4343 	addw x,#GPIO_BASE 
      009565 5B               [ 1] 4344 	pop a 
      009566 03               [ 4] 4345 	ret 
                                   4346 ; translation from Arduino D0..D15 to stm8s208rb 
      0017F5                       4347 arduino_to_8s208:
      009567 81 06                 4348 .byte 3,6 ; D0 
      009568 03 05                 4349 .byte 3,5 ; D1 
      009568 CE AA                 4350 .byte 4,0 ; D2 
      00956A 80 C3                 4351 .byte 2,1 ; D3
      00956C 95 D0                 4352 .byte 6,0 ; D4
      00956E 81 02                 4353 .byte 2,2 ; D5
      00956F 02 03                 4354 .byte 2,3 ; D6
      00956F CD 95                 4355 .byte 3,1 ; D7
      009571 68 26                 4356 .byte 3,3 ; D8
      009573 09 AE                 4357 .byte 2,4 ; D9
      009575 95 D2                 4358 .byte 4,5 ; D10
      009577 CD A0                 4359 .byte 2,6 ; D11
      009579 DC CC                 4360 .byte 2,7 ; D12
      00957B 95 CF                 4361 .byte 2,5 ; D13
      00957D 04 02                 4362 .byte 4,2 ; D14
      00957D CE 00                 4363 .byte 4,1 ; D15
                                   4364 
                                   4365 
                                   4366 ;------------------------------
                                   4367 ; BASIC: RND(expr)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4368 ; return random number 
                                   4369 ; between 1 and expr inclusive
                                   4370 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4371 ; input:
                                   4372 ; 	none 
                                   4373 ; output:
                                   4374 ;	X 		random positive integer 
                                   4375 ;------------------------------
      001815                       4376 random:
      00957F 1A C3 00         [ 4] 4377 	call func_args 
      009582 1C 25            [ 1] 4378 	cp a,#1
      009584 08 AE            [ 1] 4379 	jreq 1$
      009586 96 11 CD         [ 2] 4380 	jp syntax_error
      00181F                       4381 1$:  
      009589 A0 DC            [ 1] 4382 	ld a,#0x80 
      00958B 20 42            [ 1] 4383 	bcp a,(1,sp)
      00958D 27 05            [ 1] 4384 	jreq 2$
      00958D CD 81            [ 1] 4385 	ld a,#ERR_BAD_VALUE
      00958F FE 72 5F         [ 2] 4386 	jp tb_error
      00182A                       4387 2$: 
                                   4388 ; acc16=(x<<5)^x 
      009592 00 17 AE         [ 2] 4389 	ldw x,seedx 
      009595 AA               [ 2] 4390 	sllw x 
      009596 80               [ 2] 4391 	sllw x 
      009597 CF               [ 2] 4392 	sllw x 
      009598 00               [ 2] 4393 	sllw x 
      009599 18               [ 2] 4394 	sllw x 
      00959A CE               [ 1] 4395 	ld a,xh 
      00959B 95 D0 CF         [ 1] 4396 	xor a,seedx 
      00959E 00 7C CE         [ 1] 4397 	ld acc16,a 
      0095A1 00               [ 1] 4398 	ld a,xl 
      0095A2 1C 72 B0         [ 1] 4399 	xor a,seedx+1 
      0095A5 00 1A CF         [ 1] 4400 	ld acc8,a 
                                   4401 ; seedx=seedy 
      0095A8 00 7E AE         [ 2] 4402 	ldw x,seedy 
      0095AB 00 7C 1F         [ 2] 4403 	ldw seedx,x  
                                   4404 ; seedy=seedy^(seedy>>1)
      0095AE 01 1E            [ 2] 4405 	srlw y 
      0095B0 01 CD            [ 1] 4406 	ld a,yh 
      0095B2 82 18 A6         [ 1] 4407 	xor a,seedy 
      0095B5 2E CD 83         [ 1] 4408 	ld seedy,a  
      0095B8 41 1E            [ 1] 4409 	ld a,yl 
      0095BA 01 1C 00         [ 1] 4410 	xor a,seedy+1 
      0095BD 80 1F 01         [ 1] 4411 	ld seedy+1,a 
                                   4412 ; acc16>>3 
      0095C0 C3 00 1C         [ 2] 4413 	ldw x,acc16 
      0095C3 24               [ 2] 4414 	srlw x 
      0095C4 08               [ 2] 4415 	srlw x 
      0095C5 AE               [ 2] 4416 	srlw x 
                                   4417 ; x=acc16^x 
      0095C6 00               [ 1] 4418 	ld a,xh 
      0095C7 80 CD 94         [ 1] 4419 	xor a,acc16 
      0095CA E7               [ 1] 4420 	ld xh,a 
      0095CB 20               [ 1] 4421 	ld a,xl 
      0095CC E2 00 0D         [ 1] 4422 	xor a,acc8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0095CD 97               [ 1] 4423 	ld xl,a 
                                   4424 ; seedy=x^seedy 
      0095CD 5B 02 81         [ 1] 4425 	xor a,seedy+1
      0095D0 42               [ 1] 4426 	ld xl,a 
      0095D1 43               [ 1] 4427 	ld a,xh 
      0095D2 43 61 6E         [ 1] 4428 	xor a,seedy
      0095D5 27               [ 1] 4429 	ld xh,a 
      0095D6 74 20 66         [ 2] 4430 	ldw seedy,x 
                                   4431 ; return seedy modulo expr + 1 
      0095D9 6C 61            [ 2] 4432 	popw y 
      0095DB 73               [ 2] 4433 	divw x,y 
      0095DC 68               [ 1] 4434 	ldw x,y 
      0095DD 20               [ 1] 4435 	incw x 
      001879                       4436 10$:
      0095DE 61 70            [ 1] 4437 	ld a,#TK_INTGR
      0095E0 70               [ 4] 4438 	ret 
                                   4439 
                                   4440 ;---------------------------------
                                   4441 ; BASIC: WORDS 
                                   4442 ; affiche la listes des mots du
                                   4443 ; dictionnaire ainsi que le nombre
                                   4444 ; de mots.
                                   4445 ;---------------------------------
                           000001  4446 	WLEN=1 ; word length
                           000002  4447 	LLEN=2 ; character sent to console
                           000003  4448 	WCNT=3 ; count words printed 
                           000003  4449 	VSIZE=3 
      00187C                       4450 words:
      00187C                       4451 	_vars VSIZE
      0095E1 6C 69            [ 2]    1     sub sp,#VSIZE 
      0095E3 63 61            [ 1] 4452 	clr (LLEN,sp)
      0095E5 74 69            [ 1] 4453 	clr (WCNT,sp)
      0095E7 6F 6E 2C 20      [ 2] 4454 	ldw y,#kword_dict+2
      0095EB 61               [ 1] 4455 0$:	ldw x,y
      0095EC 6C               [ 1] 4456 	ld a,(x)
      0095ED 72 65            [ 1] 4457 	and a,#15 
      0095EF 61 64            [ 1] 4458 	ld (WLEN,sp),a 
      0095F1 79 20            [ 1] 4459 	inc (WCNT,sp)
      0095F3 6F               [ 1] 4460 1$:	incw x 
      0095F4 6E               [ 1] 4461 	ld a,(x)
      0095F5 65 20 69         [ 4] 4462 	call putc 
      0095F8 6E 20            [ 1] 4463 	inc (LLEN,sp)
      0095FA 46 4C            [ 1] 4464 	dec (WLEN,sp)
      0095FC 41 53            [ 1] 4465 	jrne 1$
      0095FE 48 0A            [ 1] 4466 	ld a,#70
      009600 75 73            [ 1] 4467 	cp a,(LLEN,sp)
      009602 65 20            [ 1] 4468 	jrmi 2$   
      009604 45 52            [ 1] 4469 	ld a,#SPACE 
      009606 41 53 45         [ 4] 4470 	call putc 
      009609 20 62            [ 1] 4471 	inc (LLEN,sp) 
      00960B 65 66            [ 2] 4472 	jra 3$
      00960D 6F 72            [ 1] 4473 2$: ld a,#CR 
      00960F 65 00 4E         [ 4] 4474 	call putc 
      009612 6F 20            [ 1] 4475 	clr (LLEN,sp)
      009614 61 70 70 6C      [ 2] 4476 3$:	subw y,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009618 69 63            [ 2] 4477 	ldw y,(y)
      00961A 61 74            [ 1] 4478 	jrne 0$ 
      00961C 69 6F            [ 1] 4479 	ld a,#CR 
      00961E 6E 20 69         [ 4] 4480 	call putc  
      009621 6E               [ 1] 4481 	clrw x 
      009622 20 52            [ 1] 4482 	ld a,(WCNT,sp)
      009624 41               [ 1] 4483 	ld xl,a 
      009625 4D 00 8B         [ 4] 4484 	call print_int 
      009627 AE 18 CC         [ 2] 4485 	ldw x,#words_count_msg
      009627 52 03 72         [ 4] 4486 	call puts 
      0018C9                       4487 	_drop VSIZE 
      00962A 5F 00            [ 2]    1     addw sp,#VSIZE 
      00962C 17               [ 4] 4488 	ret 
      00962D CD 8D 68 A1 84 27 03  4489 words_count_msg: .asciz " words in dictionary\n"
             CC 87 C1 1F 01 CD 88
             B0 A1 09 27 02 20 19
             CD
                                   4490 
                                   4491 
                                   4492 ;-----------------------------
                                   4493 ; BASIC: TIMER expr 
                                   4494 ; initialize count down timer 
                                   4495 ;-----------------------------
      0018E2                       4496 set_timer:
      009643 8D 68 A1         [ 4] 4497 	call arg_list
      009646 84 27            [ 1] 4498 	cp a,#1 
      009648 03 CC            [ 1] 4499 	jreq 1$
      00964A 87 C1 9F         [ 2] 4500 	jp syntax_error
      0018EC                       4501 1$: 
      00964D 1E               [ 2] 4502 	popw x 
      00964E 01 CF 00         [ 2] 4503 	ldw timer,x 
      009651 18               [ 4] 4504 	ret 
                                   4505 
                                   4506 ;------------------------------
                                   4507 ; BASIC: TIMEOUT 
                                   4508 ; return state of timer 
                                   4509 ;------------------------------
      0018F1                       4510 timeout:
      009652 5F CD 82         [ 2] 4511 	ldw x,timer 
      0018F4                       4512 logical_complement:
      009655 5D               [ 2] 4513 	cplw x 
      009656 1E 01 5C         [ 2] 4514 	cpw x,#-1
      009659 20 DC            [ 1] 4515 	jreq 2$
      00965B 5F               [ 1] 4516 	clrw x 
      00965B 5B 03            [ 1] 4517 2$:	ld a,#TK_INTGR
      00965D 81               [ 4] 4518 	ret 
                                   4519 
                                   4520 ;--------------------------------
                                   4521 ; BASIC NOT(expr) 
                                   4522 ; return logical complement of expr
                                   4523 ;--------------------------------
      00965E                       4524 func_not:
      00965E CD 8C 64         [ 4] 4525 	call func_args  
      009661 A1 01            [ 1] 4526 	cp a,#1
      009663 27 03            [ 1] 4527 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009665 CC 87 C1         [ 2] 4528 	jp syntax_error
      009668 85               [ 2] 4529 1$:	popw x 
      009669 9F A4            [ 2] 4530 	jra logical_complement
                                   4531 
                                   4532 
                                   4533 
                                   4534 ;-----------------------------------
                                   4535 ; BASIC: IWDGEN expr1 
                                   4536 ; enable independant watchdog timer
                                   4537 ; expr1 is delay in multiple of 62.5µsec
                                   4538 ; expr1 -> {1..16383}
                                   4539 ;-----------------------------------
      00190B                       4540 enable_iwdg:
      00966B 7F 97 A6         [ 4] 4541 	call arg_list
      00966E 03 81            [ 1] 4542 	cp a,#1 
      009670 27 03            [ 1] 4543 	jreq 1$
      009670 A6 07 CD         [ 2] 4544 	jp syntax_error 
      009673 8C               [ 2] 4545 1$: popw x 
      009674 57 CD            [ 1] 4546 	push #0
      009676 88 B0 A1 02      [ 1] 4547 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00967A 27               [ 1] 4548 	ld a,xh 
      00967B 0E A1            [ 1] 4549 	and a,#0x3f
      00967D 03               [ 1] 4550 	ld xh,a  
      00967E 27 0D A1         [ 2] 4551 2$:	cpw x,#255
      009681 82 27            [ 2] 4552 	jrule 3$
      009683 03 CC            [ 1] 4553 	inc (1,sp)
      009685 87               [ 1] 4554 	rcf 
      009686 C1               [ 2] 4555 	rrcw x 
      009687 FD 20            [ 2] 4556 	jra 2$
      009689 03 55 50 E0      [ 1] 4557 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00968A 84               [ 1] 4558 	pop a  
      00968A F6 5F 97         [ 1] 4559 	ld IWDG_PR,a 
      00968D 9F               [ 1] 4560 	ld a,xl
      00968D 89               [ 1] 4561 	dec a 
      00968E A6 08 CD 8C      [ 1] 4562 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009692 57 85 A6         [ 1] 4563 	ld IWDG_RLR,a 
      009695 84 81 50 E0      [ 1] 4564 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009697 81               [ 4] 4565 	ret 
                                   4566 
                                   4567 
                                   4568 ;-----------------------------------
                                   4569 ; BASIC: IWDGREF  
                                   4570 ; refresh independant watchdog count down 
                                   4571 ; timer before it reset MCU. 
                                   4572 ;-----------------------------------
      001941                       4573 refresh_iwdg:
      009697 CD 83 51 5F      [ 1] 4574 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00969B 97               [ 4] 4575 	ret 
                                   4576 
                                   4577 
                                   4578 ;-------------------------------------
                                   4579 ; BASIC: LOG(expr)
                                   4580 ; return logarithm base 2 of expr 
                                   4581 ; this is the position of most significant
                                   4582 ; bit set. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4583 ; input: 
                                   4584 ; output:
                                   4585 ;   X     log2 
                                   4586 ;   A     TK_INTGR 
                                   4587 ;*********************************
      001946                       4588 log2:
      00969C A6 84 81         [ 4] 4589 	call func_args 
      00969F A1 01            [ 1] 4590 	cp a,#1 
      00969F 5F C6            [ 1] 4591 	jreq 1$
      0096A1 00 2B C1         [ 2] 4592 	jp syntax_error 
      0096A4 00               [ 2] 4593 1$: popw x 
      001951                       4594 leading_one:
      0096A5 2C               [ 2] 4595 	tnzw x 
      0096A6 27 01            [ 1] 4596 	jreq 4$
      0096A8 53 A6            [ 1] 4597 	ld a,#15 
      0096AA 84               [ 2] 4598 2$: rlcw x 
      0096AB 81 03            [ 1] 4599     jrc 3$
      0096AC 4A               [ 1] 4600 	dec a 
      0096AC CD 8C            [ 2] 4601 	jra 2$
      0096AE 64               [ 1] 4602 3$: clrw x 
      0096AF A1               [ 1] 4603     ld xl,a
      0096B0 02 27            [ 1] 4604 4$:	ld a,#TK_INTGR
      0096B2 03               [ 4] 4605 	ret 
                                   4606 
                                   4607 ;-----------------------------------
                                   4608 ; BASIC: BIT(expr) 
                                   4609 ; expr ->{0..15}
                                   4610 ; return 2^expr 
                                   4611 ; output:
                                   4612 ;    x    2^expr 
                                   4613 ;-----------------------------------
      001961                       4614 bitmask:
      0096B3 CC 87 C1         [ 4] 4615     call func_args 
      0096B6 A1 01            [ 1] 4616 	cp a,#1
      0096B6 1E 03            [ 1] 4617 	jreq 1$
      0096B8 2B 17 A3         [ 2] 4618 	jp syntax_error 
      0096BB 00               [ 2] 4619 1$: popw x 
      0096BC 09               [ 1] 4620 	ld a,xl 
      0096BD 2A 12            [ 1] 4621 	and a,#15
      0096BF A6               [ 1] 4622 	clrw x 
      0096C0 05               [ 1] 4623 	incw x 
      0096C1 42               [ 1] 4624 2$: tnz a 
      0096C2 1C 50            [ 1] 4625 	jreq 3$
      0096C4 00               [ 2] 4626 	slaw x 
      0096C5 1F               [ 1] 4627 	dec a 
      0096C6 03 1E            [ 2] 4628 	jra 2$ 
      0096C8 01 72            [ 1] 4629 3$: ld a,#TK_INTGR
      0096CA FB               [ 4] 4630 	ret 
                                   4631 
                                   4632 ;------------------------------
                                   4633 ; BASIC: INVERT(expr)
                                   4634 ; 1's complement 
                                   4635 ;--------------------------------
      00197B                       4636 invert:
      0096CB 03 A6 84         [ 4] 4637 	call func_args
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0096CE 5B 04            [ 1] 4638 	cp a,#1 
      0096D0 81 03            [ 1] 4639 	jreq 1$
      0096D1 CC 07 41         [ 2] 4640 	jp syntax_error
      0096D1 A6               [ 2] 4641 1$: popw x  
      0096D2 0A               [ 2] 4642 	cplw x 
      0096D3 CC 87            [ 1] 4643 	ld a,#TK_INTGR 
      0096D5 C3               [ 4] 4644 	ret 
                                   4645 
                                   4646 ;------------------------------
                                   4647 ; BASIC: DO 
                                   4648 ; initiate a DO ... UNTIL loop 
                                   4649 ;------------------------------
                           000003  4650 	DOLP_ADR=3 
                           000005  4651 	DOLP_INW=5
                           000004  4652 	VSIZE=4 
      0096D6                       4653 do_loop:
      0096D6 CE               [ 2] 4654 	popw x 
      00198B                       4655 	_vars VSIZE 
      0096D7 AA 80            [ 2]    1     sub sp,#VSIZE 
      0096D9 A3               [ 2] 4656 	pushw x 
      0096DA 10 93 27 08      [ 2] 4657 	ldw y,basicptr 
      0096DE CE AA            [ 2] 4658 	ldw (DOLP_ADR,sp),y
      0096E0 82 1C AA 84      [ 2] 4659 	ldw y,in.w 
      0096E4 20 03            [ 2] 4660 	ldw (DOLP_INW,sp),y
      0096E6 AE AA 80 A6      [ 1] 4661 	inc loop_depth 
      0096EA 84               [ 4] 4662 	ret 
                                   4663 
                                   4664 ;--------------------------------
                                   4665 ; BASIC: UNTIL expr 
                                   4666 ; loop if exprssion is false 
                                   4667 ; else terminate loop
                                   4668 ;--------------------------------
      00199F                       4669 until: 
      0096EB 81 5D 00 1D      [ 1] 4670 	tnz loop_depth 
      0096EC 26 03            [ 1] 4671 	jrne 1$ 
      0096EC 90 89 CD         [ 2] 4672 	jp syntax_error 
      0019A8                       4673 1$: 
      0096EF 8C 64 A1         [ 4] 4674 	call relation 
      0096F2 01 27            [ 1] 4675 	cp a,#TK_INTGR
      0096F4 07 A1            [ 1] 4676 	jreq 2$
      0096F6 02 27 03         [ 2] 4677 	jp syntax_error
      0019B2                       4678 2$: 
      0096F9 CC               [ 2] 4679 	tnzw x 
      0096FA 87 C1            [ 1] 4680 	jrne 9$
      0096FC 90 85            [ 2] 4681 	ldw x,(DOLP_ADR,sp)
      0096FE A1 01 27         [ 2] 4682 	ldw basicptr,x 
      009701 02 85            [ 1] 4683 	ld a,(2,x)
      009703 51 90 FD         [ 1] 4684 	ld count,a 
      009706 90 85            [ 2] 4685 	ldw x,(DOLP_INW,sp)
      009708 81 00 00         [ 2] 4686 	ldw in.w,x 
      009709 81               [ 4] 4687 	ret 
      0019C5                       4688 9$:	; remove loop data from stack  
      009709 72               [ 2] 4689 	popw x
      0019C6                       4690 	_drop VSIZE
      00970A 0D 52            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      00970C 30 FB 8E CC      [ 1] 4691 	dec loop_depth 
      009710 85               [ 2] 4692 	jp (x)
                                   4693 
                                   4694 ;--------------------------
                                   4695 ; BASIC: PRTA...PRTI  
                                   4696 ;  return constant value 
                                   4697 ;  PORT  offset in GPIO
                                   4698 ;  array
                                   4699 ;---------------------------
      0019CD                       4700 const_porta:
      009711 06 00 00         [ 2] 4701 	ldw x,#0
      009712 A6 84            [ 1] 4702 	ld a,#TK_INTGR 
      009712 72               [ 4] 4703 	ret 
      0019D3                       4704 const_portb:
      009713 0D 52 30         [ 2] 4705 	ldw x,#1
      009716 FB 72            [ 1] 4706 	ld a,#TK_INTGR 
      009718 16               [ 4] 4707 	ret 
      0019D9                       4708 const_portc:
      009719 00 21 8E         [ 2] 4709 	ldw x,#2
      00971C 81 84            [ 1] 4710 	ld a,#TK_INTGR 
      00971D 81               [ 4] 4711 	ret 
      0019DF                       4712 const_portd:
      00971D CD 8D 68         [ 2] 4713 	ldw x,#3
      009720 A1 84            [ 1] 4714 	ld a,#TK_INTGR 
      009722 27               [ 4] 4715 	ret 
      0019E5                       4716 const_porte:
      009723 03 CC 87         [ 2] 4717 	ldw x,#4
      009726 C1 84            [ 1] 4718 	ld a,#TK_INTGR 
      009727 81               [ 4] 4719 	ret 
      0019EB                       4720 const_portf:
      009727 5D 27 04         [ 2] 4721 	ldw x,#5
      00972A 8F 5A            [ 1] 4722 	ld a,#TK_INTGR 
      00972C 26               [ 4] 4723 	ret 
      0019F1                       4724 const_portg:
      00972D F9 4F 81         [ 2] 4725 	ldw x,#6
      009730 A6 84            [ 1] 4726 	ld a,#TK_INTGR 
      009730 CD               [ 4] 4727 	ret 
      0019F7                       4728 const_porth:
      009731 8D 68 A1         [ 2] 4729 	ldw x,#7
      009734 84 27            [ 1] 4730 	ld a,#TK_INTGR 
      009736 03               [ 4] 4731 	ret 
      0019FD                       4732 const_porti:
      009737 CC 87 C1         [ 2] 4733 	ldw x,#8
      00973A A6 84            [ 1] 4734 	ld a,#TK_INTGR 
      00973A A3               [ 4] 4735 	ret 
                                   4736 
                                   4737 ;-------------------------------
                                   4738 ; following return constant 
                                   4739 ; related to GPIO register offset 
                                   4740 ;---------------------------------
      001A03                       4741 const_odr:
      00973B 14 00            [ 1] 4742 	ld a,#TK_INTGR 
      00973D 2B 0C 35         [ 2] 4743 	ldw x,#GPIO_ODR
      009740 0F               [ 4] 4744 	ret 
      001A09                       4745 const_idr:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009741 50 F2            [ 1] 4746 	ld a,#TK_INTGR 
      009743 A6 1E 62         [ 2] 4747 	ldw x,#GPIO_IDR
      009746 A6               [ 4] 4748 	ret 
      001A0F                       4749 const_ddr:
      009747 10 62            [ 1] 4750 	ld a,#TK_INTGR 
      009749 20 1E 02         [ 2] 4751 	ldw x,#GPIO_DDR
      00974B 81               [ 4] 4752 	ret 
      001A15                       4753 const_cr1:
      00974B A3 08            [ 1] 4754 	ld a,#TK_INTGR 
      00974D 00 2B 09         [ 2] 4755 	ldw x,#GPIO_CR1
      009750 35               [ 4] 4756 	ret 
      001A1B                       4757 const_cr2:
      009751 0E 50            [ 1] 4758 	ld a,#TK_INTGR 
      009753 F2 A6 50         [ 2] 4759 	ldw x,#GPIO_CR2
      009756 62               [ 4] 4760 	ret 
                                   4761 ;-------------------------
                                   4762 ; BASIC: POUT 
                                   4763 ;  constant for port mode
                                   4764 ;  used by PMODE 
                                   4765 ;  to set pin as output
                                   4766 ;------------------------
      001A21                       4767 const_output:
      009757 20 10            [ 1] 4768 	ld a,#TK_INTGR 
      009759 AE 00 01         [ 2] 4769 	ldw x,#OUTP
      009759 35               [ 4] 4770 	ret 
                                   4771 
                                   4772 ;-------------------------
                                   4773 ; BASIC: PINP 
                                   4774 ;  constant for port mode
                                   4775 ;  used by PMODE 
                                   4776 ;  to set pin as input
                                   4777 ;------------------------
      001A27                       4778 const_input:
      00975A 07 50            [ 1] 4779 	ld a,#TK_INTGR 
      00975C F2 00 00         [ 2] 4780 	ldw x,#INP 
      00975D 81               [ 4] 4781 	ret 
                                   4782 	
                                   4783 ;-----------------------
                                   4784 ; memory area constants
                                   4785 ;-----------------------
      001A2D                       4786 const_eeprom_base:
      00975D A3 00            [ 1] 4787 	ld a,#TK_INTGR 
      00975F 40 23 07         [ 2] 4788 	ldw x,#EEPROM_BASE 
      009762 72               [ 4] 4789 	ret 
                                   4790 
                                   4791 ;---------------------------
                                   4792 ; BASIC: DATA 
                                   4793 ; when the interpreter find 
                                   4794 ; a DATA line it skip it.
                                   4795 ;---------------------------
      001A33                       4796 data:
      009763 5C 50 F2 54 20   [ 1] 4797 	mov in,count 
      009768 F4               [ 4] 4798 	ret 
                                   4799 
                                   4800 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4801 ; BASIC: DATLN  *expr*
                                   4802 ; set DATA pointer at line# 
                                   4803 ; specified by *expr* 
                                   4804 ;---------------------------
      009769                       4805 data_line:
      009769 9F 4A 27         [ 4] 4806 	call expression
      00976C 01 4A            [ 1] 4807 	cp a,#TK_INTGR
      00976E 27 03            [ 1] 4808 	jreq 1$
      00976E A4 3E C7         [ 2] 4809 	jp syntax_error  
      009771 50               [ 1] 4810 1$: clr a 
      009772 F1 72 18         [ 4] 4811 	call search_lineno
      009775 50               [ 2] 4812 	tnzw x 
      009776 F0 8E            [ 1] 4813 	jrne 3$
      009778 81 05            [ 1] 4814 2$:	ld a,#ERR_NO_LINE 
      009779 CC 07 43         [ 2] 4815 	jp tb_error
      001A4F                       4816 3$: ; check if valid data line 
      009779 CE 00            [ 1] 4817     ldw y,x 
      00977B 0F A6            [ 2] 4818 	ldw x,(4,x)
      00977D 84 81 33         [ 2] 4819 	cpw x,#data 
      00977F 26 F2            [ 1] 4820 	jrne 2$ 
      00977F CD 8C 64 A1      [ 2] 4821 	ldw data_ptr,y
      009783 01 27 03         [ 1] 4822 	ld a,(2,y)
      009786 CC 87 C1         [ 1] 4823 	ld data_len,a 
      009789 35 06 00 08      [ 1] 4824 	mov data_ofs,#FIRST_DATA_ITEM 
      009789 85               [ 4] 4825 	ret
                                   4826 
                                   4827 ;---------------------------------
                                   4828 ; BASIC: RESTORE 
                                   4829 ; set data_ptr to first data line
                                   4830 ; if not DATA found pointer set to
                                   4831 ; zero 
                                   4832 ;---------------------------------
      001A67                       4833 restore:
      00978A 9E A5 80 27      [ 1] 4834 	clr data_ptr 
      00978E 01 50 A6 84      [ 1] 4835 	clr data_ptr+1
      009792 81 5F 00 08      [ 1] 4836 	clr data_ofs 
      009793 72 5F 00 09      [ 1] 4837 	clr data_len
      009793 CD 8C 64         [ 2] 4838 	ldw x,txtbgn
      001A7A                       4839 data_search_loop: 	
      009796 A1 02 27         [ 2] 4840 	cpw x,txtend
      009799 03 CC            [ 1] 4841 	jruge 9$
      00979B 87 C1            [ 1] 4842 	ldw y,x 
      00979D 85 9E            [ 2] 4843 	ldw x,(4,x)
      00979F 14 01 95         [ 2] 4844 	addw x,#code_addr
      0097A2 9F               [ 2] 4845 	ldw x,(x)
      0097A3 14 02 97         [ 2] 4846 	cpw x,#data 
      0097A6 5B 02            [ 1] 4847 	jrne try_next_line 
      0097A8 A6 84 81 06      [ 2] 4848 	ldw data_ptr,y 
      0097AB 90 E6 02         [ 1] 4849 	ld a,(2,y)
      0097AB CD 8C 64         [ 1] 4850 	ld data_len,a 
      0097AE A1 02 27 03      [ 1] 4851 	mov data_ofs,#FIRST_DATA_ITEM
      0097B2 CC 87 C1 09      [ 1] 4852 9$:	tnz data_len 
      0097B5 26 05            [ 1] 4853     jrne 10$
      0097B5 85 9E            [ 1] 4854 	ld a,#ERR_NO_DATA 
      0097B7 1A 01 95         [ 2] 4855 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0097BA 9F               [ 4] 4856 10$:ret
      001AA6                       4857 try_next_line:
      0097BB 1A               [ 1] 4858 	ldw x,y 
      0097BC 02 97            [ 1] 4859 	ld a,(2,x)
      0097BE 5B 02 A6         [ 1] 4860 	ld acc8,a 
      0097C1 84 81 00 0C      [ 1] 4861 	clr acc16 
      0097C3 72 BB 00 0C      [ 2] 4862 	addw x,acc16 
      0097C3 CD 8C            [ 2] 4863 	jra data_search_loop
                                   4864 
                                   4865 
                                   4866 ;---------------------------------
                                   4867 ; BASIC: READ 
                                   4868 ; return next data item | 0 
                                   4869 ;---------------------------------
                           000001  4870 	CTX_BPTR=1 
                           000003  4871 	CTX_IN=3 
                           000004  4872 	CTX_COUNT=4 
                           000005  4873 	XSAVE=5
                           000006  4874 	VSIZE=6
      001AB6                       4875 read:
      001AB6                       4876 	_vars  VSIZE 
      0097C5 64 A1            [ 2]    1     sub sp,#VSIZE 
      001AB8                       4877 read01:	
      0097C7 02 27 03         [ 1] 4878 	ld a,data_ofs
      0097CA CC 87 C1         [ 1] 4879 	cp a,data_len 
      0097CD 27 37            [ 1] 4880 	jreq 2$ ; end of line  
      0097CD 85 9E 18         [ 4] 4881 	call save_context
      0097D0 01 95 9F         [ 2] 4882 	ldw x,data_ptr 
      0097D3 18 02 97         [ 2] 4883 	ldw basicptr,x 
      0097D6 5B 02 A6 84 81   [ 1] 4884 	mov in,data_ofs 
      0097DB 55 00 09 00 03   [ 1] 4885 	mov count,data_len  
      0097DB CD 8C 64         [ 4] 4886 	call expression 
      0097DE A1 02            [ 1] 4887 	cp a,#TK_INTGR 
      0097E0 27 03            [ 1] 4888 	jreq 1$ 
      0097E2 CC 87 C1         [ 2] 4889 	jp syntax_error 
      001ADD                       4890 1$:
      0097E5 90 85            [ 2] 4891 	ldw (XSAVE,SP),x
      0097E7 85 90 5D         [ 4] 4892 	call next_token ; skip comma
      0097EA 27 05 58         [ 2] 4893 	ldw x,basicptr 
      0097ED 90 5A 26         [ 2] 4894 	ldw data_ptr,x 
      0097F0 FB 00 01 00 08   [ 1] 4895 	mov data_ofs,in 
      0097F1 CD 0F EE         [ 4] 4896 	call rest_context
      0097F1 A6 84            [ 2] 4897 	ldw x,(XSAVE,sp)
      0097F3 81 84            [ 1] 4898 	ld a,#TK_INTGR
      0097F4                       4899 	_drop VSIZE 
      0097F4 CD 8C            [ 2]    1     addw sp,#VSIZE 
      0097F6 64               [ 4] 4900 	ret 
      001AF7                       4901 2$: ; end of line reached 
      0097F7 A1 02 27 03      [ 2] 4902 	ldw y, data_ptr 
      0097FB CC 87 C1 90      [ 1] 4903 	clr data_ptr
      0097FF 85 85 90 5D      [ 1] 4904 	clr data_ptr+1   
      009803 27 05 54 90      [ 1] 4905 	clr data_ofs 
      009807 5A 26 FB 09      [ 1] 4906 	clr data_len 
      00980A CD 1A A6         [ 4] 4907 	call try_next_line 
      00980A A6 84            [ 2] 4908 	jra read01
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                   4909 
                                   4910 
                                   4911 ;---------------------------------
                                   4912 ; BASIC: SPIEN clkdiv, 0|1  
                                   4913 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4914 ; if clkdiv==-1 disable SPI
                                   4915 ; 0|1 -> disable|enable  
                                   4916 ;--------------------------------- 
                           000005  4917 SPI_CS_BIT=5
      001B10                       4918 spi_enable:
      00980C 81 0B E9         [ 4] 4919 	call arg_list 
      00980D A1 02            [ 1] 4920 	cp a,#2
      00980D A6 84            [ 1] 4921 	jreq 1$
      00980F CD 8C 57         [ 2] 4922 	jp syntax_error 
      001B1A                       4923 1$: 
      009812 9F A4 07 C7      [ 1] 4924 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009816 50               [ 2] 4925 	popw x  
      009817 C6               [ 2] 4926 	tnzw x 
      009818 81 21            [ 1] 4927 	jreq spi_disable 
      009819 85               [ 2] 4928 	popw x 
      009819 52 01            [ 1] 4929 	ld a,#(1<<SPI_CR1_BR)
      00981B CD               [ 4] 4930 	mul x,a 
      00981C 8C               [ 1] 4931 	ld a,xl 
      00981D 69 A1 02         [ 1] 4932 	ld SPI_CR1,a 
                                   4933 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009820 27 03 CC 87      [ 1] 4934 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009824 C1 90 85 85      [ 1] 4935 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4936 ; configure SPI as master mode 0.	
      009828 CD 98 65 6B      [ 1] 4937 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4938 ; ~CS line controlled by sofware 	
      00982C 01 A6 01 0D      [ 1] 4939 	bset SPI_CR2,#SPI_CR2_SSM 
      009830 01 27 0D 48      [ 1] 4940     bset SPI_CR2,#SPI_CR2_SSI 
                                   4941 ; enable SPI
      009834 0A 01 26 FB      [ 1] 4942 	bset SPI_CR1,#SPI_CR1_SPE 	
      009838 6B               [ 4] 4943 	ret 
      001B43                       4944 spi_disable:
      001B43                       4945 	_drop #2; throw first argument.
      009839 01 7B            [ 2]    1     addw sp,##2 
                                   4946 ; wait spi idle 
      00983B 01 EA            [ 1] 4947 1$:	ld a,#0x82 
      00983D 03 E7 03         [ 1] 4948 	and a,SPI_SR
      009840 90 A3            [ 1] 4949 	cp a,#2 
      009842 00 01            [ 1] 4950 	jrne 1$
      009844 27 10 7B 01      [ 1] 4951 	bres SPI_CR1,#SPI_CR1_SPE
      009848 43 E4 04 E7      [ 1] 4952 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00984C 04 7B 01 43      [ 1] 4953 	bres PE_DDR,#SPI_CS_BIT 
      009850 E4               [ 4] 4954 	ret 
                                   4955 
      001B5B                       4956 spi_clear_error:
      009851 02 E7            [ 1] 4957 	ld a,#0x78 
      009853 02 20 0C         [ 1] 4958 	bcp a,SPI_SR 
      009856 27 04            [ 1] 4959 	jreq 1$
      009856 7B 01 EA 02      [ 1] 4960 	clr SPI_SR 
      00985A E7               [ 4] 4961 1$: ret 
                                   4962 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      001B67                       4963 spi_send_byte:
      00985B 02               [ 1] 4964 	push a 
      00985C 7B 01 EA         [ 4] 4965 	call spi_clear_error
      00985F 04               [ 1] 4966 	pop a 
      009860 E7 04 52 03 FB   [ 2] 4967 	btjf SPI_SR,#SPI_SR_TXE,.
      009862 C7 52 04         [ 1] 4968 	ld SPI_DR,a
      009862 5B 01 81 03 FB   [ 2] 4969 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009865 C6 52 04         [ 1] 4970 	ld a,SPI_DR 
      009865 58               [ 4] 4971 	ret 
                                   4972 
      001B7D                       4973 spi_rcv_byte:
      009866 1C 98            [ 1] 4974 	ld a,#255
      009868 75 FE 9F 88 5E   [ 2] 4975 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00986D A6 05 42         [ 1] 4976 	ld a,SPI_DR 
      009870 1C               [ 4] 4977 	ret
                                   4978 
                                   4979 ;------------------------------
                                   4980 ; BASIC: SPIWR byte [,byte]
                                   4981 ; write 1 or more byte
                                   4982 ;------------------------------
      001B88                       4983 spi_write:
      009871 50 00 84         [ 4] 4984 	call expression
      009874 81 84            [ 1] 4985 	cp a,#TK_INTGR 
      009875 27 03            [ 1] 4986 	jreq 1$
      009875 03 06 03         [ 2] 4987 	jp syntax_error 
      001B92                       4988 1$:	
      009878 05               [ 1] 4989 	ld a,xl 
      009879 04 00 02         [ 4] 4990 	call spi_send_byte 
      00987C 01 06 00         [ 4] 4991 	call next_token 
      00987F 02 02            [ 1] 4992 	cp a,#TK_COMMA 
      009881 02 03            [ 1] 4993 	jrne 2$ 
      009883 03 01            [ 2] 4994 	jra spi_write 
      009885 03               [ 1] 4995 2$:	tnz a 
      009886 03 02            [ 1] 4996 	jreq 3$
      001BA2                       4997 	_unget_token  
      009888 04 04 05 02 06   [ 1]    1      mov in,in.saved  
      00988D 02               [ 4] 4998 3$:	ret 
                                   4999 
                                   5000 
                                   5001 ;-------------------------------
                                   5002 ; BASIC: SPIRD 	
                                   5003 ; read one byte from SPI 
                                   5004 ;-------------------------------
      001BA8                       5005 spi_read:
      00988E 07 02 05         [ 4] 5006 	call spi_rcv_byte 
      009891 04               [ 1] 5007 	clrw x 
      009892 02               [ 1] 5008 	ld xl,a 
      009893 04 01            [ 1] 5009 	ld a,#TK_INTGR 
      009895 81               [ 4] 5010 	ret 
                                   5011 
                                   5012 ;------------------------------
                                   5013 ; BASIC: SPISEL 0|1 
                                   5014 ; set state of ~CS line
                                   5015 ; 0|1 deselect|select  
                                   5016 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      001BB0                       5017 spi_select:
      009895 CD 8C 64         [ 4] 5018 	call next_token 
      009898 A1 01            [ 1] 5019 	cp a,#TK_INTGR 
      00989A 27 03            [ 1] 5020 	jreq 1$
      00989C CC 87 C1         [ 2] 5021 	jp syntax_error 
      00989F 5D               [ 2] 5022 1$: tnzw x  
      00989F A6 80            [ 1] 5023 	jreq cs_high 
      0098A1 15 01 27 05      [ 1] 5024 	bres PE_ODR,#SPI_CS_BIT
      0098A5 A6               [ 4] 5025 	ret 
      001BC2                       5026 cs_high: 
      0098A6 0A CC 87 C3      [ 1] 5027 	bset PE_ODR,#SPI_CS_BIT
      0098AA 81               [ 4] 5028 	ret 
                                   5029 
                                   5030 ;-------------------------------
                                   5031 ; BASIC: PAD 
                                   5032 ; Return pad buffer address.
                                   5033 ;------------------------------
      001BC7                       5034 pad_ref:
      0098AA CE 00 13         [ 2] 5035 	ldw x,#pad 
      0098AD 58 58            [ 1] 5036 	ld a,TK_INTGR
      0098AF 58               [ 4] 5037 	ret 
                                   5038 
                                   5039 
                                   5040 ;------------------------------
                                   5041 ;      dictionary 
                                   5042 ; format:
                                   5043 ;   link:   2 bytes 
                                   5044 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5045 ;   cmd_name: 16 byte max 
                                   5046 ;   cmd_index: 2 bytes 
                                   5047 ;------------------------------
                                   5048 	.macro _dict_entry len,name,cmd_idx 
                                   5049 	.word LINK 
                                   5050 	LINK=.
                                   5051 name:
                                   5052 	.byte len 	
                                   5053 	.ascii "name"
                                   5054 	.word cmd_idx 
                                   5055 	.endm 
                                   5056 
                           000000  5057 	LINK=0
                                   5058 ; respect alphabetic order for BASIC names from Z-A
                                   5059 ; this sort order is for a cleaner WORDS cmd output. 	
      001BCD                       5060 kword_end:
      001BCD                       5061 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      0098B0 58 58                    1 	.word LINK 
                           001BCF     2 	LINK=.
      001BCF                          3 XOR:
      0098B2 9E                       4 	.byte 3+F_IFUNC 	
      0098B3 C8 00 13                 5 	.ascii "XOR"
      0098B6 C7 00                    6 	.word XOR_IDX 
      001BD5                       5062 	_dict_entry,5,WRITE,WRITE_IDX;write  
      0098B8 0D 9F                    1 	.word LINK 
                           001BD7     2 	LINK=.
      001BD7                          3 WRITE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      0098BA C8                       4 	.byte 5 	
      0098BB 00 14 C7 00 0E           5 	.ascii "WRITE"
      0098C0 CE 00                    6 	.word WRITE_IDX 
      001BDF                       5063 	_dict_entry,5,WORDS,WORDS_IDX;words 
      0098C2 15 CF                    1 	.word LINK 
                           001BE1     2 	LINK=.
      001BE1                          3 WORDS:
      0098C4 00                       4 	.byte 5 	
      0098C5 13 90 54 90 9E           5 	.ascii "WORDS"
      0098CA C8 00                    6 	.word WORDS_IDX 
      001BE9                       5064 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      0098CC 15 C7                    1 	.word LINK 
                           001BEB     2 	LINK=.
      001BEB                          3 WAIT:
      0098CE 00                       4 	.byte 4 	
      0098CF 15 90 9F C8              5 	.ascii "WAIT"
      0098D3 00 16                    6 	.word WAIT_IDX 
      001BF2                       5065 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      0098D5 C7 00                    1 	.word LINK 
                           001BF4     2 	LINK=.
      001BF4                          3 USR:
      0098D7 16                       4 	.byte 3+F_IFUNC 	
      0098D8 CE 00 0D                 5 	.ascii "USR"
      0098DB 54 54                    6 	.word USR_IDX 
      001BFA                       5066 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      0098DD 54 9E                    1 	.word LINK 
                           001BFC     2 	LINK=.
      001BFC                          3 UNTIL:
      0098DF C8                       4 	.byte 5 	
      0098E0 00 0D 95 9F C8           5 	.ascii "UNTIL"
      0098E5 00 0E                    6 	.word UNTIL_IDX 
      001C04                       5067 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      0098E7 97 C8                    1 	.word LINK 
                           001C06     2 	LINK=.
      001C06                          3 UFLASH:
      0098E9 00                       4 	.byte 6+F_IFUNC 	
      0098EA 16 97 9E C8 00 15        5 	.ascii "UFLASH"
      0098F0 95 CF                    6 	.word UFLASH_IDX 
      001C0F                       5068 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      0098F2 00 15                    1 	.word LINK 
                           001C11     2 	LINK=.
      001C11                          3 UBOUND:
      0098F4 90                       4 	.byte 6+F_IFUNC 	
      0098F5 85 65 93 5C 4E 44        5 	.ascii "UBOUND"
      0098F9 00 B4                    6 	.word UBOUND_IDX 
      001C1A                       5069 	_dict_entry,4,TONE,TONE_IDX;tone  
      0098F9 A6 84                    1 	.word LINK 
                           001C1C     2 	LINK=.
      001C1C                          3 TONE:
      0098FB 81                       4 	.byte 4 	
      0098FC 54 4F 4E 45              5 	.ascii "TONE"
      0098FC 52 03                    6 	.word TONE_IDX 
      001C23                       5070 	_dict_entry,2,TO,TO_IDX;to
      0098FE 0F 02                    1 	.word LINK 
                           001C25     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      001C25                          3 TO:
      009900 0F                       4 	.byte 2 	
      009901 03 90                    5 	.ascii "TO"
      009903 AE 9F                    6 	.word TO_IDX 
      001C2A                       5071 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      009905 DC 93                    1 	.word LINK 
                           001C2C     2 	LINK=.
      001C2C                          3 TIMER:
      009907 F6                       4 	.byte 5 	
      009908 A4 0F 6B 01 0C           5 	.ascii "TIMER"
      00990D 03 5C                    6 	.word TIMER_IDX 
      001C34                       5072 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00990F F6 CD                    1 	.word LINK 
                           001C36     2 	LINK=.
      001C36                          3 TIMEOUT:
      009911 83                       4 	.byte 7+F_IFUNC 	
      009912 41 0C 02 0A 01 26 F5     5 	.ascii "TIMEOUT"
      009919 A6 46                    6 	.word TMROUT_IDX 
      001C40                       5073 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00991B 11 02                    1 	.word LINK 
                           001C42     2 	LINK=.
      001C42                          3 TICKS:
      00991D 2B                       4 	.byte 5+F_IFUNC 	
      00991E 09 A6 20 CD 83           5 	.ascii "TICKS"
      009923 41 0C                    6 	.word TICKS_IDX 
      001C4A                       5074 	_dict_entry,4,STOP,STOP_IDX;stop 
      009925 02 20                    1 	.word LINK 
                           001C4C     2 	LINK=.
      001C4C                          3 STOP:
      009927 07                       4 	.byte 4 	
      009928 A6 0D CD 83              5 	.ascii "STOP"
      00992C 41 0F                    6 	.word STOP_IDX 
      001C53                       5075 	_dict_entry,4,STEP,STEP_IDX;step 
      00992E 02 72                    1 	.word LINK 
                           001C55     2 	LINK=.
      001C55                          3 STEP:
      009930 A2                       4 	.byte 4 	
      009931 00 02 90 FE              5 	.ascii "STEP"
      009935 26 CF                    6 	.word STEP_IDX 
      001C5C                       5076 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      009937 A6 0D                    1 	.word LINK 
                           001C5E     2 	LINK=.
      001C5E                          3 SPIWR:
      009939 CD                       4 	.byte 5 	
      00993A 83 41 5F 7B 03           5 	.ascii "SPIWR"
      00993F 97 CD                    6 	.word SPIWR_IDX 
      001C66                       5077 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      009941 89 0B                    1 	.word LINK 
                           001C68     2 	LINK=.
      001C68                          3 SPISEL:
      009943 AE                       4 	.byte 6 	
      009944 99 4C CD A0 DC 5B        5 	.ascii "SPISEL"
      00994A 03 81                    6 	.word SPISEL_IDX 
      001C71                       5078 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00994C 20 77                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                           001C73     2 	LINK=.
      001C73                          3 SPIRD:
      00994E 6F                       4 	.byte 5+F_IFUNC 	
      00994F 72 64 73 20 69           5 	.ascii "SPIRD"
      009954 6E 20                    6 	.word SPIRD_IDX 
      001C7B                       5079 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      009956 64 69                    1 	.word LINK 
                           001C7D     2 	LINK=.
      001C7D                          3 SPIEN:
      009958 63                       4 	.byte 5 	
      009959 74 69 6F 6E 61           5 	.ascii "SPIEN"
      00995E 72 79                    6 	.word SPIEN_IDX 
      001C85                       5080 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      009960 0A 00                    1 	.word LINK 
                           001C87     2 	LINK=.
      009962                          3 SLEEP:
      009962 CD                       4 	.byte 5 	
      009963 8C 69 A1 01 27           5 	.ascii "SLEEP"
      009968 03 CC                    6 	.word SLEEP_IDX 
      001C8F                       5081     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00996A 87 C1                    1 	.word LINK 
                           001C91     2 	LINK=.
      00996C                          3 SIZE:
      00996C 85                       4 	.byte 4 	
      00996D CF 00 11 81              5 	.ascii "SIZE"
      009971 00 C4                    6 	.word SIZE_IDX 
      001C98                       5082 	_dict_entry,4,SHOW,SHOW_IDX;show 
      009971 CE 00                    1 	.word LINK 
                           001C9A     2 	LINK=.
      001C9A                          3 SHOW:
      009973 11                       4 	.byte 4 	
      009974 53 48 4F 57              5 	.ascii "SHOW"
      009974 53 A3                    6 	.word SHOW_IDX 
      001CA1                       5083 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      009976 FF FF                    1 	.word LINK 
                           001CA3     2 	LINK=.
      001CA3                          3 SAVE:
      009978 27                       4 	.byte 4 	
      009979 01 5F A6 84              5 	.ascii "SAVE"
      00997D 81 36                    6 	.word SAVE_IDX 
      00997E                       5084 	_dict_entry 3,RUN,RUN_IDX;run
      00997E CD 8C                    1 	.word LINK 
                           001CAC     2 	LINK=.
      001CAC                          3 RUN:
      009980 64                       4 	.byte 3 	
      009981 A1 01 27                 5 	.ascii "RUN"
      009984 03 CC                    6 	.word RUN_IDX 
      001CB2                       5085 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      009986 87 C1                    1 	.word LINK 
                           001CB4     2 	LINK=.
      001CB4                          3 RSHIFT:
      009988 85                       4 	.byte 6+F_IFUNC 	
      009989 20 E9 48 49 46 54        5 	.ascii "RSHIFT"
      00998B 00 94                    6 	.word RSHIFT_IDX 
      001CBD                       5086 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      00998B CD 8C                    1 	.word LINK 
                           001CBF     2 	LINK=.
      001CBF                          3 RND:
      00998D 69                       4 	.byte 3+F_IFUNC 	
      00998E A1 01 27                 5 	.ascii "RND"
      009991 03 CC                    6 	.word RND_IDX 
      001CC5                       5087 	_dict_entry,6,RETURN,RET_IDX;return 
      009993 87 C1                    1 	.word LINK 
                           001CC7     2 	LINK=.
      001CC7                          3 RETURN:
      009995 85                       4 	.byte 6 	
      009996 4B 00 35 CC 50 E0        5 	.ascii "RETURN"
      00999C 9E A4                    6 	.word RET_IDX 
      001CD0                       5088 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00999E 3F 95                    1 	.word LINK 
                           001CD2     2 	LINK=.
      001CD2                          3 RESTORE:
      0099A0 A3                       4 	.byte 7 	
      0099A1 00 FF 23 06 0C 01 98     5 	.ascii "RESTORE"
      0099A8 56 20                    6 	.word REST_IDX 
      001CDC                       5089 	_dict_entry 6,REMARK,REM_IDX;remark 
      0099AA F5 35                    1 	.word LINK 
                           001CDE     2 	LINK=.
      001CDE                          3 REMARK:
      0099AC 55                       4 	.byte 6 	
      0099AD 50 E0 84 C7 50 E1        5 	.ascii "REMARK"
      0099B3 9F 4A                    6 	.word REM_IDX 
      001CE7                       5090 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      0099B5 35 55                    1 	.word LINK 
                           001CE9     2 	LINK=.
      001CE9                          3 REBOOT:
      0099B7 50                       4 	.byte 6 	
      0099B8 E0 C7 50 E2 35 AA        5 	.ascii "REBOOT"
      0099BE 50 E0                    6 	.word RBT_IDX 
      001CF2                       5091 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      0099C0 81 E9                    1 	.word LINK 
                           001CF4     2 	LINK=.
      0099C1                          3 READ:
      0099C1 35                       4 	.byte 4+F_IFUNC 	
      0099C2 AA 50 E0 81              5 	.ascii "READ"
      0099C6 00 88                    6 	.word READ_IDX 
      001CFB                       5092 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      0099C6 CD 8C                    1 	.word LINK 
                           001CFD     2 	LINK=.
      001CFD                          3 QKEY:
      0099C8 64                       4 	.byte 4+F_IFUNC 	
      0099C9 A1 01 27 03              5 	.ascii "QKEY"
      0099CD CC 87                    6 	.word QKEY_IDX 
      001D04                       5093 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      0099CF C1 85                    1 	.word LINK 
                           001D06     2 	LINK=.
      0099D1                          3 PRTI:
      0099D1 5D                       4 	.byte 4+F_IFUNC 	
      0099D2 27 0A A6 0F              5 	.ascii "PRTI"
      0099D6 59 25                    6 	.word PRTI_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      001D0D                       5094 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      0099D8 03 4A                    1 	.word LINK 
                           001D0F     2 	LINK=.
      001D0F                          3 PRTH:
      0099DA 20                       4 	.byte 4+F_IFUNC 	
      0099DB FA 5F 97 A6              5 	.ascii "PRTH"
      0099DF 84 81                    6 	.word PRTH_IDX 
      0099E1                       5095 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      0099E1 CD 8C                    1 	.word LINK 
                           001D18     2 	LINK=.
      001D18                          3 PRTG:
      0099E3 64                       4 	.byte 4+F_IFUNC 	
      0099E4 A1 01 27 03              5 	.ascii "PRTG"
      0099E8 CC 87                    6 	.word PRTG_IDX 
      001D1F                       5096 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      0099EA C1 85                    1 	.word LINK 
                           001D21     2 	LINK=.
      001D21                          3 PRTF:
      0099EC 9F                       4 	.byte 4+F_IFUNC 	
      0099ED A4 0F 5F 5C              5 	.ascii "PRTF"
      0099F1 4D 27                    6 	.word PRTF_IDX 
      001D28                       5097 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      0099F3 04 58                    1 	.word LINK 
                           001D2A     2 	LINK=.
      001D2A                          3 PRTE:
      0099F5 4A                       4 	.byte 4+F_IFUNC 	
      0099F6 20 F9 A6 84              5 	.ascii "PRTE"
      0099FA 81 7C                    6 	.word PRTE_IDX 
      0099FB                       5098 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      0099FB CD 8C                    1 	.word LINK 
                           001D33     2 	LINK=.
      001D33                          3 PRTD:
      0099FD 64                       4 	.byte 4+F_IFUNC 	
      0099FE A1 01 27 03              5 	.ascii "PRTD"
      009A02 CC 87                    6 	.word PRTD_IDX 
      001D3A                       5099 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      009A04 C1 85                    1 	.word LINK 
                           001D3C     2 	LINK=.
      001D3C                          3 PRTC:
      009A06 53                       4 	.byte 4+F_IFUNC 	
      009A07 A6 84 81 43              5 	.ascii "PRTC"
      009A0A 00 78                    6 	.word PRTC_IDX 
      001D43                       5100 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      009A0A 85 52                    1 	.word LINK 
                           001D45     2 	LINK=.
      001D45                          3 PRTB:
      009A0C 04                       4 	.byte 4+F_IFUNC 	
      009A0D 89 90 CE 00              5 	.ascii "PRTB"
      009A11 05 17                    6 	.word PRTB_IDX 
      001D4C                       5101 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      009A13 03 90                    1 	.word LINK 
                           001D4E     2 	LINK=.
      001D4E                          3 PRTA:
      009A15 CE                       4 	.byte 4+F_IFUNC 	
      009A16 00 01 17 05              5 	.ascii "PRTA"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009A1A 72 5C                    6 	.word PRTA_IDX 
      001D55                       5102 	_dict_entry 5,PRINT,PRT_IDX;print 
      009A1C 00 1E                    1 	.word LINK 
                           001D57     2 	LINK=.
      001D57                          3 PRINT:
      009A1E 81                       4 	.byte 5 	
      009A1F 50 52 49 4E 54           5 	.ascii "PRINT"
      009A1F 72 5D                    6 	.word PRT_IDX 
      001D5F                       5103 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      009A21 00 1E                    1 	.word LINK 
                           001D61     2 	LINK=.
      001D61                          3 POUT:
      009A23 26                       4 	.byte 4+F_IFUNC 	
      009A24 03 CC 87 C1              5 	.ascii "POUT"
      009A28 00 70                    6 	.word POUT_IDX 
      001D68                       5104 	_dict_entry,4,POKE,POKE_IDX;poke 
      009A28 CD 8D                    1 	.word LINK 
                           001D6A     2 	LINK=.
      001D6A                          3 POKE:
      009A2A B1                       4 	.byte 4 	
      009A2B A1 84 27 03              5 	.ascii "POKE"
      009A2F CC 87                    6 	.word POKE_IDX 
      001D71                       5105 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      009A31 C1 6A                    1 	.word LINK 
                           001D73     2 	LINK=.
      009A32                          3 PMODE:
      009A32 5D                       4 	.byte 5 	
      009A33 26 10 1E 03 CF           5 	.ascii "PMODE"
      009A38 00 05                    6 	.word PMODE_IDX 
      001D7B                       5106 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      009A3A E6 02                    1 	.word LINK 
                           001D7D     2 	LINK=.
      001D7D                          3 PINP:
      009A3C C7                       4 	.byte 4+F_IFUNC 	
      009A3D 00 04 1E 05              5 	.ascii "PINP"
      009A41 CF 00                    6 	.word PINP_IDX 
      001D84                       5107 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      009A43 01 81                    1 	.word LINK 
                           001D86     2 	LINK=.
      009A45                          3 PEEK:
      009A45 85                       4 	.byte 4+F_IFUNC 	
      009A46 5B 04 72 5A              5 	.ascii "PEEK"
      009A4A 00 1E                    6 	.word PEEK_IDX 
      001D8D                       5108 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      009A4C FC 86                    1 	.word LINK 
                           001D8F     2 	LINK=.
      009A4D                          3 PAUSE:
      009A4D AE                       4 	.byte 5 	
      009A4E 00 00 A6 84 81           5 	.ascii "PAUSE"
      009A53 00 66                    6 	.word PAUSE_IDX 
      001D97                       5109 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      009A53 AE 00                    1 	.word LINK 
                           001D99     2 	LINK=.
      001D99                          3 PAD:
      009A55 01                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009A56 A6 84 81                 5 	.ascii "PAD"
      009A59 00 64                    6 	.word PAD_IDX 
      001D9F                       5110 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      009A59 AE 00                    1 	.word LINK 
                           001DA1     2 	LINK=.
      001DA1                          3 OR:
      009A5B 02                       4 	.byte 2+F_IFUNC 	
      009A5C A6 84                    5 	.ascii "OR"
      009A5E 81 62                    6 	.word OR_IDX 
      009A5F                       5111 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      009A5F AE 00                    1 	.word LINK 
                           001DA8     2 	LINK=.
      001DA8                          3 ODR:
      009A61 03                       4 	.byte 3+F_IFUNC 	
      009A62 A6 84 81                 5 	.ascii "ODR"
      009A65 00 60                    6 	.word ODR_IDX 
      001DAE                       5112 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      009A65 AE 00                    1 	.word LINK 
                           001DB0     2 	LINK=.
      001DB0                          3 NOT:
      009A67 04                       4 	.byte 3+F_IFUNC 	
      009A68 A6 84 81                 5 	.ascii "NOT"
      009A6B 00 5E                    6 	.word NOT_IDX 
      001DB6                       5113 	_dict_entry,4,NEXT,NEXT_IDX;next 
      009A6B AE 00                    1 	.word LINK 
                           001DB8     2 	LINK=.
      001DB8                          3 NEXT:
      009A6D 05                       4 	.byte 4 	
      009A6E A6 84 81 54              5 	.ascii "NEXT"
      009A71 00 5A                    6 	.word NEXT_IDX 
      001DBF                       5114 	_dict_entry,3,NEW,NEW_IDX;new
      009A71 AE 00                    1 	.word LINK 
                           001DC1     2 	LINK=.
      001DC1                          3 NEW:
      009A73 06                       4 	.byte 3 	
      009A74 A6 84 81                 5 	.ascii "NEW"
      009A77 00 5C                    6 	.word NEW_IDX 
      001DC7                       5115 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      009A77 AE 00                    1 	.word LINK 
                           001DC9     2 	LINK=.
      001DC9                          3 MULDIV:
      009A79 07                       4 	.byte 6+F_IFUNC 	
      009A7A A6 84 81 44 49 56        5 	.ascii "MULDIV"
      009A7D 00 58                    6 	.word MULDIV_IDX 
      001DD2                       5116 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      009A7D AE 00                    1 	.word LINK 
                           001DD4     2 	LINK=.
      001DD4                          3 LSHIFT:
      009A7F 08                       4 	.byte 6+F_IFUNC 	
      009A80 A6 84 81 49 46 54        5 	.ascii "LSHIFT"
      009A83 00 56                    6 	.word LSHIFT_IDX 
      001DDD                       5117 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      009A83 A6 84                    1 	.word LINK 
                           001DDF     2 	LINK=.
      001DDF                          3 LOG:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009A85 AE                       4 	.byte 3+F_IFUNC 	
      009A86 00 00 81                 5 	.ascii "LOG"
      009A89 00 54                    6 	.word LOG_IDX 
      001DE5                       5118 	_dict_entry 4,LIST,LIST_IDX;list
      009A89 A6 84                    1 	.word LINK 
                           001DE7     2 	LINK=.
      001DE7                          3 LIST:
      009A8B AE                       4 	.byte 4 	
      009A8C 00 01 81 54              5 	.ascii "LIST"
      009A8F 00 52                    6 	.word LIST_IDX 
      001DEE                       5119 	_dict_entry 3,LET,LET_IDX;let 
      009A8F A6 84                    1 	.word LINK 
                           001DF0     2 	LINK=.
      001DF0                          3 LET:
      009A91 AE                       4 	.byte 3 	
      009A92 00 02 81                 5 	.ascii "LET"
      009A95 00 50                    6 	.word LET_IDX 
      001DF6                       5120 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      009A95 A6 84                    1 	.word LINK 
                           001DF8     2 	LINK=.
      001DF8                          3 KEY:
      009A97 AE                       4 	.byte 3+F_IFUNC 	
      009A98 00 03 81                 5 	.ascii "KEY"
      009A9B 00 4E                    6 	.word KEY_IDX 
      001DFE                       5121 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      009A9B A6 84                    1 	.word LINK 
                           001E00     2 	LINK=.
      001E00                          3 IWDGREF:
      009A9D AE                       4 	.byte 7 	
      009A9E 00 04 81 47 52 45 46     5 	.ascii "IWDGREF"
      009AA1 00 4C                    6 	.word IWDGREF_IDX 
      001E0A                       5122 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      009AA1 A6 84                    1 	.word LINK 
                           001E0C     2 	LINK=.
      001E0C                          3 IWDGEN:
      009AA3 AE                       4 	.byte 6 	
      009AA4 00 01 81 47 45 4E        5 	.ascii "IWDGEN"
      009AA7 00 4A                    6 	.word IWDGEN_IDX 
      001E15                       5123 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      009AA7 A6 84                    1 	.word LINK 
                           001E17     2 	LINK=.
      001E17                          3 INVERT:
      009AA9 AE                       4 	.byte 6+F_IFUNC 	
      009AAA 00 00 81 45 52 54        5 	.ascii "INVERT"
      009AAD 00 48                    6 	.word INVERT_IDX 
      001E20                       5124 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      009AAD A6 84                    1 	.word LINK 
                           001E22     2 	LINK=.
      001E22                          3 INPUT:
      009AAF AE                       4 	.byte 5 	
      009AB0 40 00 81 55 54           5 	.ascii "INPUT"
      009AB3 00 46                    6 	.word INPUT_IDX 
      001E2A                       5125 	_dict_entry,2,IF,IF_IDX;if 
      009AB3 55 00                    1 	.word LINK 
                           001E2C     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      001E2C                          3 IF:
      009AB5 04                       4 	.byte 2 	
      009AB6 00 02                    5 	.ascii "IF"
      009AB8 81 44                    6 	.word IF_IDX 
      009AB9                       5126 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      009AB9 CD 8D                    1 	.word LINK 
                           001E33     2 	LINK=.
      001E33                          3 IDR:
      009ABB 68                       4 	.byte 3+F_IFUNC 	
      009ABC A1 84 27                 5 	.ascii "IDR"
      009ABF 03 CC                    6 	.word IDR_IDX 
      001E39                       5127 	_dict_entry,3,HEX,HEX_IDX;hex_base
      009AC1 87 C1                    1 	.word LINK 
                           001E3B     2 	LINK=.
      001E3B                          3 HEX:
      009AC3 4F                       4 	.byte 3 	
      009AC4 CD A3 C4                 5 	.ascii "HEX"
      009AC7 5D 26                    6 	.word HEX_IDX 
      001E41                       5128 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      009AC9 05 A6                    1 	.word LINK 
                           001E43     2 	LINK=.
      001E43                          3 GPIO:
      009ACB 05                       4 	.byte 4+F_IFUNC 	
      009ACC CC 87 C3 4F              5 	.ascii "GPIO"
      009ACF 00 3E                    6 	.word GPIO_IDX 
      001E4A                       5129 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      009ACF 90 93                    1 	.word LINK 
                           001E4C     2 	LINK=.
      001E4C                          3 GOTO:
      009AD1 EE                       4 	.byte 4 	
      009AD2 04 A3 9A B3              5 	.ascii "GOTO"
      009AD6 26 F2                    6 	.word GOTO_IDX 
      001E53                       5130 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      009AD8 90 CF                    1 	.word LINK 
                           001E55     2 	LINK=.
      001E55                          3 GOSUB:
      009ADA 00                       4 	.byte 5 	
      009ADB 07 90 E6 02 C7           5 	.ascii "GOSUB"
      009AE0 00 0A                    6 	.word GOSUB_IDX 
      001E5D                       5131 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      009AE2 35 06                    1 	.word LINK 
                           001E5F     2 	LINK=.
      001E5F                          3 FREE:
      009AE4 00                       4 	.byte 4+F_IFUNC 	
      009AE5 09 81 45 45              5 	.ascii "FREE"
      009AE7 00 9A                    6 	.word FREE_IDX 
      001E66                       5132 	_dict_entry,3,FOR,FOR_IDX;for 
      009AE7 72 5F                    1 	.word LINK 
                           001E68     2 	LINK=.
      001E68                          3 FOR:
      009AE9 00                       4 	.byte 3 	
      009AEA 07 72 5F                 5 	.ascii "FOR"
      009AED 00 08                    6 	.word FOR_IDX 
      001E6E                       5133 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      009AEF 72 5F                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                           001E70     2 	LINK=.
      001E70                          3 FCPU:
      009AF1 00                       4 	.byte 4 	
      009AF2 09 72 5F 00              5 	.ascii "FCPU"
      009AF6 0A CE                    6 	.word FCPU_IDX 
      001E77                       5134 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      009AF8 00 1A                    1 	.word LINK 
                           001E79     2 	LINK=.
      009AFA                          3 ERASE:
      009AFA C3                       4 	.byte 5 	
      009AFB 00 1C 24 1B 90           5 	.ascii "ERASE"
      009B00 93 EE                    6 	.word ERASE_IDX 
      001E81                       5135 	_dict_entry,3,END,END_IDX;cmd_end  
      009B02 04 1C                    1 	.word LINK 
                           001E83     2 	LINK=.
      001E83                          3 END:
      009B04 9F                       4 	.byte 3 	
      009B05 E2 FE A3                 5 	.ascii "END"
      009B08 9A B3                    6 	.word END_IDX 
      001E89                       5136 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      009B0A 26 1A                    1 	.word LINK 
                           001E8B     2 	LINK=.
      001E8B                          3 EEPROM:
      009B0C 90                       4 	.byte 6+F_IFUNC 	
      009B0D CF 00 07 90 E6 02        5 	.ascii "EEPROM"
      009B13 C7 00                    6 	.word EEPROM_IDX 
      001E94                       5137 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      009B15 0A 35                    1 	.word LINK 
                           001E96     2 	LINK=.
      001E96                          3 EDIT:
      009B17 06                       4 	.byte 4 	
      009B18 00 09 72 5D              5 	.ascii "EDIT"
      009B1C 00 0A                    6 	.word EDIT_IDX 
      001E9D                       5138 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      009B1E 26 05                    1 	.word LINK 
                           001E9F     2 	LINK=.
      001E9F                          3 DWRITE:
      009B20 A6                       4 	.byte 6+F_CMD 	
      009B21 0C CC 87 C3 81 45        5 	.ascii "DWRITE"
      009B26 00 2A                    6 	.word DWRITE_IDX 
      001EA8                       5139 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      009B26 93 E6                    1 	.word LINK 
                           001EAA     2 	LINK=.
      001EAA                          3 DREAD:
      009B28 02                       4 	.byte 5+F_IFUNC 	
      009B29 C7 00 0E 72 5F           5 	.ascii "DREAD"
      009B2E 00 0D                    6 	.word DREAD_IDX 
      001EB2                       5140 	_dict_entry,2,DO,DO_IDX;do_loop
      009B30 72 BB                    1 	.word LINK 
                           001EB4     2 	LINK=.
      001EB4                          3 DO:
      009B32 00                       4 	.byte 2 	
      009B33 0D 20                    5 	.ascii "DO"
      009B35 C4 26                    6 	.word DO_IDX 
      009B36                       5141 	_dict_entry,3,DEC,DEC_IDX;dec_base
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009B36 52 06                    1 	.word LINK 
                           001EBB     2 	LINK=.
      009B38                          3 DEC:
      009B38 C6                       4 	.byte 3 	
      009B39 00 09 C1                 5 	.ascii "DEC"
      009B3C 00 0A                    6 	.word DEC_IDX 
      001EC1                       5142 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      009B3E 27 37                    1 	.word LINK 
                           001EC3     2 	LINK=.
      001EC3                          3 DDR:
      009B40 CD                       4 	.byte 3+F_IFUNC 	
      009B41 90 5E CE                 5 	.ascii "DDR"
      009B44 00 07                    6 	.word DDR_IDX 
      001EC9                       5143 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      009B46 CF 00                    1 	.word LINK 
                           001ECB     2 	LINK=.
      001ECB                          3 DATALN:
      009B48 05                       4 	.byte 6 	
      009B49 55 00 09 00 02 55        5 	.ascii "DATALN"
      009B4F 00 0A                    6 	.word DATALN_IDX 
      001ED4                       5144 	_dict_entry,4,DATA,DATA_IDX;data  
      009B51 00 04                    1 	.word LINK 
                           001ED6     2 	LINK=.
      001ED6                          3 DATA:
      009B53 CD                       4 	.byte 4 	
      009B54 8D 68 A1 84              5 	.ascii "DATA"
      009B58 27 03                    6 	.word DATA_IDX 
      001EDD                       5145 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      009B5A CC 87                    1 	.word LINK 
                           001EDF     2 	LINK=.
      001EDF                          3 CRL:
      009B5C C1                       4 	.byte 3+F_IFUNC 	
      009B5D 43 52 4C                 5 	.ascii "CRL"
      009B5D 1F 05                    6 	.word CRL_IDX 
      001EE5                       5146 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      009B5F CD 88                    1 	.word LINK 
                           001EE7     2 	LINK=.
      001EE7                          3 CRH:
      009B61 B0                       4 	.byte 3+F_IFUNC 	
      009B62 CE 00 05                 5 	.ascii "CRH"
      009B65 CF 00                    6 	.word CRH_IDX 
      001EED                       5147 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      009B67 07 55                    1 	.word LINK 
                           001EEF     2 	LINK=.
      001EEF                          3 CHAR:
      009B69 00                       4 	.byte 4+F_CFUNC 	
      009B6A 02 00 09 CD              5 	.ascii "CHAR"
      009B6E 90 6E                    6 	.word CHAR_IDX 
      001EF6                       5148 	_dict_entry,3,BYE,BYE_IDX;bye 
      009B70 1E 05                    1 	.word LINK 
                           001EF8     2 	LINK=.
      001EF8                          3 BYE:
      009B72 A6                       4 	.byte 3 	
      009B73 84 5B 06                 5 	.ascii "BYE"
      009B76 81 16                    6 	.word BYE_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009B77                       5149 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      009B77 90 CE                    1 	.word LINK 
                           001F00     2 	LINK=.
      001F00                          3 BTOGL:
      009B79 00                       4 	.byte 5 	
      009B7A 07 72 5F 00 07           5 	.ascii "BTOGL"
      009B7F 72 5F                    6 	.word BTOGL_IDX 
      001F08                       5150 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      009B81 00 08                    1 	.word LINK 
                           001F0A     2 	LINK=.
      001F0A                          3 BTEST:
      009B83 72                       4 	.byte 5+F_IFUNC 	
      009B84 5F 00 09 72 5F           5 	.ascii "BTEST"
      009B89 00 0A                    6 	.word BTEST_IDX 
      001F12                       5151 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      009B8B CD 9B                    1 	.word LINK 
                           001F14     2 	LINK=.
      001F14                          3 BSET:
      009B8D 26                       4 	.byte 4 	
      009B8E 20 A8 45 54              5 	.ascii "BSET"
      009B90 00 10                    6 	.word BSET_IDX 
      001F1B                       5152 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      009B90 CD 8C                    1 	.word LINK 
                           001F1D     2 	LINK=.
      001F1D                          3 BRES:
      009B92 69                       4 	.byte 4 	
      009B93 A1 02 27 03              5 	.ascii "BRES"
      009B97 CC 87                    6 	.word BRES_IDX 
      001F24                       5153 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      009B99 C1 1D                    1 	.word LINK 
                           001F26     2 	LINK=.
      009B9A                          3 BIT:
      009B9A 72                       4 	.byte 3+F_IFUNC 	
      009B9B 12 50 C7                 5 	.ascii "BIT"
      009B9E 85 5D                    6 	.word BIT_IDX 
      001F2C                       5154 	_dict_entry,3,AWU,AWU_IDX;awu 
      009BA0 27 21                    1 	.word LINK 
                           001F2E     2 	LINK=.
      001F2E                          3 AWU:
      009BA2 85                       4 	.byte 3 	
      009BA3 A6 08 42                 5 	.ascii "AWU"
      009BA6 9F C7                    6 	.word AWU_IDX 
      001F34                       5155 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      009BA8 52 00                    1 	.word LINK 
                           001F36     2 	LINK=.
      001F36                          3 ASC:
      009BAA 72                       4 	.byte 3+F_IFUNC 	
      009BAB 1A 50 14                 5 	.ascii "ASC"
      009BAE 72 1A                    6 	.word ASC_IDX 
      001F3C                       5156 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      009BB0 50 16                    1 	.word LINK 
                           001F3E     2 	LINK=.
      001F3E                          3 AND:
      009BB2 72                       4 	.byte 3+F_IFUNC 	
      009BB3 14 52 00                 5 	.ascii "AND"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009BB6 72 12                    6 	.word AND_IDX 
      001F44                       5157 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      009BB8 52 01                    1 	.word LINK 
                           001F46     2 	LINK=.
      001F46                          3 ADCREAD:
      009BBA 72                       4 	.byte 7+F_IFUNC 	
      009BBB 10 52 01 72 1C 52 00     5 	.ascii "ADCREAD"
      009BC2 81 04                    6 	.word ADCREAD_IDX 
      009BC3                       5158 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      009BC3 5B 02                    1 	.word LINK 
                           001F52     2 	LINK=.
      001F52                          3 ADCON:
      009BC5 A6                       4 	.byte 5 	
      009BC6 82 C4 52 03 A1           5 	.ascii "ADCON"
      009BCB 02 26                    6 	.word ADCON_IDX 
      001F5A                       5159 kword_dict::
      001F5A                       5160 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      009BCD F7 72                    1 	.word LINK 
                           001F5C     2 	LINK=.
      001F5C                          3 ABS:
      009BCF 1D                       4 	.byte 3+F_IFUNC 	
      009BD0 52 00 72                 5 	.ascii "ABS"
      009BD3 13 50                    6 	.word ABS_IDX 
                                   5161 
                                   5162 ;comands and fonctions address table 	
      001F62                       5163 code_addr::
      009BD5 C7 72 1B 50 16 81 17  5164 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             13 15 F0 16 B0 19 61
      009BDB 10 A9 10 99 10 CA 10  5165 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             BA 16 89 15 DE 1A 1B
      009BDB A6 78 C5 52 03 27 04  5166 	.word const_cr1,data,data_line,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             72 5F 52 03 81 13 8B
             13 BB
      009BE7 0F 14 1A 2D 12 C7 14  5167 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
             83 17 8D 14 EF 11 25
             12 30 12 15 16 2C
      009BE7 88 CD 9B DB 84 72 03  5168 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             52 03 FB C7 52 04 72
             01 52
      009BF7 03 FB C6 52 04 81 17  5169 	.word let,list,log2,lshift,muldiv,next,new ; 40..47
             5B 0B 6E 11 A5 14 42
      009BFD 18 FE 1A 03 17 2B 1B  5170 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             C7 16 9D 17 99 11 00
             1A 27
      009BFD A6 FF 72 01 52 03 E3  5171 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             C6 52 04 81 D9 19 DF
             19 E5
      009C08 19 EB 19 F1 19 F7 19  5172 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             FD 16 1F 1A B6 04 86
             10 6E
      009C08 CD 8D 68 A1 84 27 03  5173 	.word restore,return, random,rshift,run,show,free ; 72..79
             CC 87 C1 0D 89 0D D4
      009C12 16 92 1B A8 1B 10 1B  5174 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             B0 1B 88 11 7E 13 F6
             16 F9
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009C12 9F CD 9B E7 CD 88 B0  5175 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             A1 09 26 02 20 E9 4D
             27 05
      009C22 55 00 03 00 02 81 17  5176 	.word wait,words,write,bit_xor,cmd_size ; 96..99
             43 0D ED
      009C28 00 00                 5177 	.word 0 
                                   5178 
                                   5179 
                                   5180 
                                   5181 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                     56 
      009C28 CD 9B FD 5F 97 A6 84    57 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             81 33 84 00 00
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
      009C30                         70 get_escape:
      009C30 CD 88 B0         [ 4]   71     call getc 
      009C33 A1 84            [ 1]   72     cp a,#'[ ; this character is expected after ESC 
      009C35 27 03            [ 1]   73     jreq 1$
      009C37 CC               [ 1]   74     clr a
      009C38 87               [ 4]   75     ret
      009C39 C1 5D 27         [ 4]   76 1$: call getc 
      009C3C 05 72 1B         [ 2]   77     ldw x,#convert_table
      002045                         78 2$:
      009C3F 50               [ 1]   79     cp a,(x)
      009C40 14 81            [ 1]   80     jreq 4$
      009C42 1C 00 02         [ 2]   81     addw x,#2
      009C42 72               [ 1]   82     tnz (x)
      009C43 1A 50            [ 1]   83     jrne 2$
      009C45 14               [ 1]   84     clr a
      009C46 81               [ 4]   85     ret 
      009C47 5C               [ 1]   86 4$: incw x 
      009C47 AE               [ 1]   87     ld a,(x)
      009C48 16 E0            [ 1]   88     cp a,#SUP
      009C4A B6 84            [ 1]   89     jrne 5$
      009C4C 81               [ 1]   90     push a 
      009C4D CD 02 D1         [ 4]   91     call getc
      009C4D 00               [ 1]   92     pop a 
      00205B                         93 5$:
      009C4E 00               [ 4]   94     ret 
                                     95 
                                     96 
                                     97 ;-----------------------------
                                     98 ; send an ASCIZ string to UART1 
                                     99 ; input: 
                                    100 ;   x 		char * 
                                    101 ; output:
                                    102 ;   none 
                                    103 ;-------------------------------
      009C4F                        104 puts::
      009C4F 43               [ 1]  105     ld a,(x)
      009C50 58 4F            [ 1]  106 	jreq 1$
      009C52 52 00 C2         [ 4]  107 	call putc 
      009C55 9C               [ 1]  108 	incw x 
      009C56 4F F7            [ 2]  109 	jra puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009C57 81               [ 4]  110 1$:	ret 
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
      002066                        121 bksp:
      009C57 05 57            [ 1]  122 	ld a,#BS 
      009C59 52 49 54         [ 4]  123 	call putc 
      009C5C 45 00            [ 1]  124 	ld a,#SPACE 
      009C5E C0 9C 57         [ 4]  125 	call putc 
      009C61 A6 08            [ 1]  126 	ld a,#BS 
      009C61 05 57 4F         [ 4]  127 	call putc 
      009C64 52               [ 4]  128 	ret 
                                    129 ;---------------------------
                                    130 ; delete n character left of cursor 
                                    131 ; at terminal.
                                    132 ; input: 
                                    133 ;   A   number of characters to delete.
                                    134 ; output:
                                    135 ;    none 
                                    136 ;--------------------------	
      002076                        137 delete_nchar:
      009C65 44               [ 1]  138 	push a 
      009C66 53 00            [ 1]  139 0$:	tnz (1,sp)
      009C68 BE 9C            [ 1]  140 	jreq 1$
      009C6A 61 20 66         [ 4]  141 	call bksp 
      009C6B 0A 01            [ 1]  142 	dec (1,sp)
      009C6B 04 57            [ 2]  143 	jra 0$
      009C6D 41               [ 1]  144 1$:	pop a 
      009C6E 49               [ 4]  145 	ret
                                    146 
                                    147 ;--------------------------
                                    148 ; send ANSI escape sequence
                                    149 ; ANSI: ESC[
                                    150 ; note: ESC is ASCII 27
                                    151 ;       [   is ASCII 91  
                                    152 ;-------------------------- 
      002084                        153 send_escape:
      009C6F 54 00            [ 1]  154 	ld a,#ESC 
      009C71 BC 9C 6B         [ 4]  155 	call putc 
      009C74 A6 5B            [ 1]  156 	ld a,#'[
      009C74 43 55 53         [ 4]  157 	call putc 
      009C77 52               [ 4]  158 	ret 
                                    159 
                                    160 ;---------------------
                                    161 ;send ANSI parameter value
                                    162 ; ANSI parameter values are 
                                    163 ; sent as ASCII charater 
                                    164 ; not as binary number.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
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
      00208F                        174 send_parameter:
      009C78 00               [ 2]  175 	pushw x 
      009C79 BA               [ 1]  176 	clrw x 
      009C7A 9C               [ 1]  177 	ld xl,a 
      009C7B 74 0A            [ 1]  178 	ld a,#10 
      009C7C 62               [ 2]  179 	div x,a 
      009C7C 05               [ 1]  180 	ld xh,a 
      009C7D 55               [ 1]  181 	ld a,xl
      009C7E 4E               [ 1]  182     tnz a 
      009C7F 54 49            [ 1]  183     jreq 2$
      009C81 4C 00            [ 1]  184 	cp a,#9 
      009C83 B8 9C            [ 2]  185 	jrule 1$
      009C85 7C 39            [ 1]  186 	ld a,#'9
      009C86                        187 1$:
      009C86 46 55            [ 1]  188 	add a,#'0 
      009C88 46 4C 41         [ 4]  189 	call putc
      009C8B 53               [ 1]  190 2$:	ld a,xh 
      009C8C 48 00            [ 1]  191 	add a,#'0
      009C8E B6 9C 86         [ 4]  192 	call putc 
      009C91 85               [ 2]  193 	popw x 
      009C91 46               [ 4]  194 	ret 
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
      0020AD                        207 move_left:
      009C92 55               [ 1]  208 	push a 
      009C93 42 4F 55         [ 4]  209 	call send_escape
      009C96 4E               [ 1]  210     pop a
      009C97 44 00 B4         [ 4]  211 	call send_parameter 
      009C9A 9C 91            [ 1]  212 	ld a,#'D 
      009C9C CD 02 C1         [ 4]  213 	call putc 
      009C9C 04               [ 4]  214 	ret	
                                    215 
                                    216 
                                    217 ;--------------------------
                                    218 ; move cursor right n character 
                                    219 ; ANSI: ESC[PnC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                    220 ; input:
                                    221 ;   A     character count
                                    222 ; output:
                                    223 ;   none
                                    224 ;--------------------------
      0020BB                        225 move_right:
      009C9D 54               [ 1]  226 	push a 
      009C9E 4F 4E 45         [ 4]  227 	call send_escape
      009CA1 00               [ 1]  228     pop a
      009CA2 B2 9C 9C         [ 4]  229 	call send_parameter 
      009CA5 A6 43            [ 1]  230 	ld a,#'C 
      009CA5 02 54 4F         [ 4]  231 	call putc 
      009CA8 00               [ 4]  232 	ret 
                                    233 
                                    234 
                                    235 ;--------------------------
                                    236 ; print n spaces on terminal
                                    237 ; input:
                                    238 ;  X 		number of spaces 
                                    239 ; output:
                                    240 ;	none 
                                    241 ;---------------------------
      0020C9                        242 spaces::
      009CA9 B0 9C            [ 1]  243 	ld a,#SPACE 
      009CAB A5               [ 2]  244 1$:	tnzw x
      009CAC 27 06            [ 1]  245 	jreq 9$
      009CAC 05 54 49         [ 4]  246 	call putc 
      009CAF 4D               [ 2]  247 	decw x
      009CB0 45 52            [ 2]  248 	jra 1$
      0020D4                        249 9$: 
      009CB2 00               [ 4]  250 	ret 
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
      0020D5                        267 insert_char: 
      0020D5                        268 	_vars VSIZE 
      009CB3 AC 9C            [ 2]    1     sub sp,#VSIZE 
      009CB5 AC 02            [ 1]  269     ld (KCHAR,sp),a 
      009CB6 9E               [ 1]  270     ld a,xh 
      009CB6 47 54            [ 1]  271 	ld (IPOS,sp),a
      009CB8 49               [ 1]  272     ld a,xl 
      009CB9 4D 45            [ 1]  273     ld (LLEN,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009CBB 4F               [ 1]  274     ldw x,y
      009CBC 55               [ 1]  275     incw x 
      009CBD 54 00            [ 1]  276     ld a,(LLEN,sp)
      009CBF AE 9C            [ 1]  277     sub a,(IPOS,sp)
      009CC1 B6               [ 1]  278     inc a 
      009CC2 C7 00 0D         [ 1]  279     ld acc8,a 
      009CC2 45 54 49 43      [ 1]  280     clr acc16
      009CC6 4B 53 00         [ 4]  281     call move
      009CC9 AA 9C C2 90      [ 2]  282     ldw y,#tib 
      009CCC 7B 01            [ 1]  283     ld a,(IPOS,sp)
      009CCC 04 53 54         [ 1]  284     ld acc8,a 
      009CCF 4F 50 00 A8      [ 2]  285     addw y,acc16 
      009CD3 9C CC            [ 1]  286     ld a,(KCHAR,sp)
      009CD5 90 F7            [ 1]  287     ld (y),a
      009CD5 04 53            [ 1]  288     incw y  
      009CD7 54 45            [ 1]  289     ld a,(IPOS,sp)
      009CD9 50 00 A6         [ 4]  290     call move_left
      009CDC 9C D5 90         [ 2]  291     ldw x,#tib 
      009CDE CD 20 5C         [ 4]  292     call puts 
      009CDE 05 53            [ 1]  293     ld a,(LLEN,sp)
      009CE0 50 49            [ 1]  294     sub a,(IPOS,sp) 
      009CE2 57 52 00         [ 4]  295     call move_left 
      002115                        296 	_drop VSIZE 
      009CE5 A4 9C            [ 2]    1     addw sp,#VSIZE 
      009CE7 DE               [ 4]  297 	ret 
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
      009CE8                        310 delete_under:
      002118                        311 	_vars VSIZE 
      009CE8 06 53            [ 2]    1     sub sp,#VSIZE 
      009CEA 50 49            [ 1]  312     ld (LLEN,sp),a 
      009CEC 53               [ 1]  313     ld a,xl 
      009CED 45 4C            [ 1]  314     ld (CPOS,sp),a 
      009CEF 00               [ 1]  315     ldw x,y ; move destination
      009CF0 A2 9C            [ 1]  316     incw y  ; move source 
      009CF2 E8 02            [ 1]  317     ld a,(LLEN,sp)
      009CF3 10 01            [ 1]  318     sub a,(CPOS,sp)
      009CF3 45               [ 1]  319     inc a ; move including zero at end.
      009CF4 53 50 49         [ 1]  320     ld acc8,a 
      009CF7 52 44 00 9E      [ 1]  321     clr acc16 
      009CFB 9C F3 C5         [ 4]  322 	call move 
      009CFD 90 AE 16 90      [ 2]  323     ldw y,#tib 
      009CFD 05 53            [ 1]  324     ld a,(CPOS,sp)
      009CFF 50 49 45         [ 1]  325     ld acc8,a 
      009D02 4E 00 A0 9C      [ 2]  326     addw y,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009D06 FD               [ 1]  327     ldw x,y 
      009D07 CD 20 5C         [ 4]  328     call puts 
      009D07 05 53            [ 1]  329     ld a,#SPACE  
      009D09 4C 45 45         [ 4]  330     call putc
      009D0C 50 00            [ 1]  331     ld a,(LLEN,sp)
      009D0E 9C 9D            [ 1]  332     sub a,(CPOS,sp)
      009D10 07 20 AD         [ 4]  333     call move_left 
      009D11 0A 02            [ 1]  334     dec (LLEN,sp)
      002150                        335 	_drop VSIZE 
      009D11 04 53            [ 2]    1     addw sp,#VSIZE 
      009D13 49               [ 4]  336 	ret 
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
      002153                        348 delete_line:
      009D14 5A 45 00         [ 4]  349     call send_escape
      009D17 C4 9D            [ 1]  350 	ld a,#'2
      009D19 11 02 C1         [ 4]  351 	call putc 
      009D1A A6 4B            [ 1]  352 	ld a,#'K 
      009D1A 04 53 48         [ 4]  353 	call putc 
      009D1D 4F               [ 4]  354 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                           000001   381 	RXCHAR = 1 ; last char received
                           000002   382 	LL = 2  ; accepted line length
                           000003   383 	CPOS=3  ; cursor position 
                           000004   384 	OVRWR=4 ; overwrite flag 
                           000004   385 	VSIZE=4 
      002161                        386 readln::
      002161                        387 	_vars VSIZE 
      009D1E 57 00            [ 2]    1     sub sp,#VSIZE 
      009D20 98               [ 1]  388 	clrw x 
      009D21 9D 1A            [ 2]  389 	ldw (LL,sp),x 
      009D23 1F 03            [ 2]  390 	ldw (CPOS,sp),x 
      009D23 04 53            [ 1]  391 	cpl (OVRWR,sp) ; default to overwrite mode 
      009D25 41 56 45 00      [ 2]  392  	ldw y,#tib ; input buffer
      00216E                        393 readln_loop:
      009D29 36 9D 23         [ 4]  394 	call getc
      009D2C 6B 01            [ 1]  395 	ld (RXCHAR,sp),a
      009D2C 03 52            [ 1]  396     cp a,#ESC 
      009D2E 55 4E            [ 1]  397     jrne 0$
      009D30 00 96 9D         [ 4]  398     call get_escape 
      009D33 2C 01            [ 1]  399     ld (RXCHAR,sp),a 
      009D34 A1 0D            [ 1]  400 0$:	cp a,#CR
      009D34 46 52            [ 1]  401 	jrne 1$
      009D36 53 48 49         [ 2]  402 	jp readln_quit
      009D39 46 54            [ 1]  403 1$:	cp a,#LF 
      009D3B 00 94            [ 1]  404 	jrne 2$ 
      009D3D 9D 34 0A         [ 2]  405 	jp readln_quit
      009D3F                        406 2$:
      009D3F 43 52            [ 1]  407 	cp a,#BS
      009D41 4E 44            [ 1]  408 	jrne 3$
                                    409 ; delete left 
      009D43 00 92            [ 1]  410     tnz (CPOS,sp)
      009D45 9D 3F            [ 1]  411     jreq readln_loop 
      009D47 A6 01            [ 1]  412     ld a,#1 
      009D47 06 52 45         [ 4]  413     call move_left
      009D4A 54 55            [ 1]  414     dec (CPOS,sp)
      009D4C 52 4E            [ 2]  415     decw y 
      009D4E 00 90            [ 1]  416     ld a,(CPOS,sp) 
      009D50 9D 47 B6         [ 2]  417     jp 12$
      009D52                        418 3$:
      009D52 07 52            [ 1]  419 	cp a,#CTRL_D
      009D54 45 53            [ 1]  420 	jrne 4$
                                    421 ;delete line 
      009D56 54 4F 52         [ 4]  422 	call delete_line 
      009D59 45 00            [ 1]  423     ld a,(CPOS,sp)
      009D5B 8E               [ 1]  424     inc a 
      009D5C 9D 52 AD         [ 4]  425     call move_left 
      009D5E A6 3E            [ 1]  426 	ld a,#'> 
      009D5E 06 52 45         [ 4]  427 	call putc 
      009D61 4D 41 52 4B      [ 2]  428 	ldw y,#tib
      009D65 00 8C            [ 1]  429 	clr (y)
      009D67 9D 5E            [ 1]  430 	clr (LL,sp)
      009D69 0F 03            [ 1]  431 	clr (CPOS,sp)
      009D69 06 52            [ 2]  432 	jra readln_loop
      0021BE                        433 4$:
      009D6B 45 42            [ 1]  434 	cp a,#CTRL_R 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009D6D 4F 4F            [ 1]  435 	jrne 5$
                                    436 ;reprint 
      009D6F 54 00            [ 1]  437 	tnz (LL,sp)
      009D71 8A 9D            [ 1]  438 	jrne readln_loop
      009D73 69 16 90         [ 2]  439 	ldw x,#tib 
      009D74 CD 03 99         [ 4]  440 	call strlen 
      009D74 44 52 45 41      [ 2]  441 	ldw y,#tib 
      009D78 44 00            [ 1]  442 	jreq readln_loop
      009D7A 88 9D            [ 1]  443 	ld (LL,sp),a 
      009D7C 74 03            [ 1]  444     ld (CPOS,sp),a
      009D7D AE 16 90         [ 2]  445 	ldw x,#tib 
      009D7D 44 51 4B         [ 4]  446 	call puts
      009D80 45 59            [ 1]  447 	clr (LL_HB,sp)
      009D82 00 86 9D         [ 2]  448 	addw y,(LL_HB,sp)
      009D85 7D 8B            [ 2]  449 	jra readln_loop 
      009D86                        450 5$:
      009D86 44 50            [ 1]  451 	cp a,#CTRL_E 
      009D88 52 54            [ 1]  452 	jrne 6$
                                    453 ;edit line number 
      009D8A 49 00 84         [ 2]  454 	ldw x,#tib 
      009D8D 9D 86 A3         [ 4]  455 	call atoi24
      009D8F CE 00 0C         [ 2]  456 	ldw x,acc16
      009D8F 44 50 52         [ 4]  457 	call search_lineno
      009D92 54               [ 2]  458 	tnzw x 
      009D93 48 00            [ 1]  459 	jrne 51$
      009D95 82 9D            [ 1]  460 	clr (LL,sp)
      009D97 8F AE 16 90      [ 2]  461 	ldw y,#tib
      009D98 90 7F            [ 1]  462     clr (y) 	
      009D98 44 50 52         [ 2]  463 	jp readln_quit  
      002201                        464 51$:
      009D9B 54 47 00         [ 2]  465 	ldw basicptr,x
      009D9E 80 9D            [ 1]  466 	ld a,(2,x)
      009DA0 98 00 03         [ 1]  467 	ld count,a 
      009DA1 90 AE 16 90      [ 2]  468 	ldw y,#tib 
      009DA1 44 50 52         [ 4]  469 	call decompile 
      009DA4 54 46            [ 1]  470 	clr (LL_HB,sp)
      009DA6 00 7E            [ 1]  471 	ld a,#CR 
      009DA8 9D A1 C1         [ 4]  472 	call putc 
      009DAA A6 3E            [ 1]  473 	ld a,#'>
      009DAA 44 50 52         [ 4]  474 	call putc
      009DAD 54 45 00         [ 2]  475     ldw x,#tib  
      009DB0 7C 9D AA         [ 4]  476 	call strlen 
      009DB3 6B 02            [ 1]  477 	ld (LL,sp),a 
      009DB3 44 50 52         [ 4]  478 	call puts 
      009DB6 54 44            [ 1]  479 	ldw y,x
      009DB8 00 7A            [ 1]  480     ld a,(LL,sp)
      009DBA 9D B3            [ 1]  481     ld (CPOS,sp),a  
      009DBC CC 21 6E         [ 2]  482 	jp readln_loop
      002230                        483 6$:
      009DBC 44 50            [ 1]  484 	cp a,#ARROW_RIGHT
      009DBE 52 54            [ 1]  485    	jrne 7$ 
                                    486 ; right arrow
      009DC0 43 00            [ 1]  487 	ld a,(CPOS,sp)
      009DC2 78 9D            [ 1]  488     cp a,(LL,sp)
      009DC4 BC 03            [ 1]  489     jrmi 61$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009DC5 CC 21 6E         [ 2]  490     jp readln_loop 
      00223D                        491 61$:
      009DC5 44 50            [ 1]  492     ld a,#1 
      009DC7 52 54 42         [ 4]  493 	call move_right 
      009DCA 00 76            [ 1]  494 	inc (CPOS,sp)
      009DCC 9D C5            [ 1]  495     incw y 
      009DCE CC 21 6E         [ 2]  496     jp readln_loop 
      009DCE 44 50            [ 1]  497 7$: cp a,#ARROW_LEFT  
      009DD0 52 54            [ 1]  498 	jrne 8$
                                    499 ; left arrow 
      009DD2 41 00            [ 1]  500 	tnz (CPOS,sp)
      009DD4 74 9D            [ 1]  501 	jrne 71$
      009DD6 CE 21 6E         [ 2]  502 	jp readln_loop
      009DD7                        503 71$:
      009DD7 05 50            [ 1]  504     ld a,#1 
      009DD9 52 49 4E         [ 4]  505 	call move_left 
      009DDC 54 00            [ 1]  506 	dec (CPOS,sp)
      009DDE 72 9D            [ 2]  507     decw y 
      009DE0 D7 21 6E         [ 2]  508 	jp readln_loop 
      009DE1 A1 82            [ 1]  509 8$: cp a,#HOME  
      009DE1 44 50            [ 1]  510 	jrne 9$
                                    511 ; HOME 
      009DE3 4F 55            [ 1]  512     ld a,(CPOS,sp)
      009DE5 54 00 70         [ 4]  513     call move_left 
      009DE8 9D E1            [ 1]  514 	clr (CPOS,sp)
      009DEA 90 AE 16 90      [ 2]  515     ldw y,#tib 
      009DEA 04 50 4F         [ 2]  516 	jp readln_loop  
      009DED 4B 45            [ 1]  517 9$: cp a,#KEY_END  
      009DEF 00 6E            [ 1]  518 	jrne 10$
                                    519 ; KEY_END 
      009DF1 9D EA            [ 1]  520 	ld a,(CPOS,sp)
      009DF3 11 02            [ 1]  521 	cp a,(LL,sp)
      009DF3 05 50            [ 1]  522 	jrne 91$
      009DF5 4D 4F 44         [ 2]  523 	jp readln_loop 
      00227F                        524 91$:
      009DF8 45 00            [ 1]  525 	ld a,(LL,sp)
      009DFA 68 9D            [ 1]  526 	sub a,(CPOS,sp)
      009DFC F3 20 BB         [ 4]  527 	call move_right 
      009DFD 7B 02            [ 1]  528 	ld a,(LL,sp)
      009DFD 44 50            [ 1]  529 	ld (CPOS,sp),a
      009DFF 49 4E 50 00      [ 2]  530     ldw y,#tib
      009E03 6C 9D FD 0C      [ 1]  531     clr acc16 
      009E06 C7 00 0D         [ 1]  532     ld acc8,a 
      009E06 44 50 45 45      [ 2]  533     addw y,acc16  
      009E0A 4B 00 6A         [ 2]  534 	jp readln_loop 
      009E0D 9E 06            [ 1]  535 10$: cp a,#CTRL_O
      009E0F 26 0C            [ 1]  536 	jrne 11$ 
                                    537 ; toggle between insert/overwrite
      009E0F 05 50            [ 1]  538 	cpl (OVRWR,sp)
      009E11 41 55            [ 2]  539 	pushw y 
      009E13 53 45 00         [ 4]  540 	call beep_1khz
      009E16 66 9E            [ 2]  541 	popw y 
      009E18 0F 21 6E         [ 2]  542 	jp readln_loop 
      009E19 A1 84            [ 1]  543 11$: cp a,#SUP 
      009E19 43 50            [ 1]  544     jrne final_test 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                    545 ; del character under cursor 
      009E1B 41 44            [ 1]  546     ld a,(CPOS,sp)
      009E1D 00 64            [ 1]  547     cp a,(LL,sp)
      009E1F 9E 19            [ 1]  548     jrpl 13$
      009E21                        549 12$:
      009E21 42               [ 1]  550     ld xl,a    ; cursor position 
      009E22 4F 52            [ 1]  551     ld a,(LL,sp)  ; line length
      009E24 00 62 9E         [ 4]  552     call delete_under
      009E27 21 02            [ 1]  553     dec (LLEN,sp)
      009E28                        554 13$:
      009E28 43 4F 44         [ 2]  555     jp readln_loop 
      0022C1                        556 final_test:
      009E2B 52 00            [ 1]  557 	cp a,#SPACE
      009E2D 60 9E            [ 1]  558 	jrpl accept_char
      009E2F 28 21 6E         [ 2]  559 	jp readln_loop
      009E30                        560 accept_char:
      009E30 43 4E            [ 1]  561 	ld a,#TIB_SIZE-1
      009E32 4F 54            [ 1]  562 	cp a, (LL,sp)
      009E34 00 5E            [ 1]  563 	jrpl 1$
      009E36 9E 30 6E         [ 2]  564 	jp readln_loop
      009E38 0D 04            [ 1]  565 1$:	tnz (OVRWR,sp)
      009E38 04 4E            [ 1]  566 	jrne overwrite
                                    567 ; insert mode 
      009E3A 45 58            [ 1]  568     ld a,(CPOS,sp)
      009E3C 54 00            [ 1]  569     cp a,(LL,sp)
      009E3E 5A 9E            [ 1]  570     jreq overwrite
      009E40 38 02            [ 1]  571     ld a,(LL,sp)
      009E41 97               [ 1]  572     ld xl,a 
      009E41 03 4E            [ 1]  573     ld a,(CPOS,sp)
      009E43 45               [ 1]  574     ld xh,a
      009E44 57 00            [ 1]  575     ld a,(RXCHAR,sp)
      009E46 5C 9E 41         [ 4]  576     call insert_char
      009E49 0C 02            [ 1]  577     inc (LLEN,sp)
      009E49 46 4D            [ 1]  578     inc (CPOS,sp)
      009E4B 55 4C 44         [ 2]  579     jp readln_loop 
      0022ED                        580 overwrite:
      009E4E 49 56            [ 1]  581 	ld a,(RXCHAR,sp)
      009E50 00 58            [ 1]  582 	ld (y),a
      009E52 9E 49            [ 1]  583     incw y
      009E54 CD 02 C1         [ 4]  584     call putc 
      009E54 46 4C            [ 1]  585 	ld a,(CPOS,sp)
      009E56 53 48            [ 1]  586 	cp a,(LL,sp)
      009E58 49 46            [ 1]  587 	jrmi 1$
      009E5A 54 00            [ 1]  588 	clr (y)
      009E5C 56 9E            [ 1]  589 	inc (LL,sp)
      009E5E 54 03            [ 1]  590     inc (CPOS,sp)
      009E5F CC 21 6E         [ 2]  591 	jp readln_loop 
      002305                        592 1$:	
      009E5F 43 4C            [ 1]  593 	inc (CPOS,sp)
      009E61 4F 47 00         [ 2]  594 	jp readln_loop 
      00230A                        595 readln_quit:
      009E64 54 9E 5F 90      [ 2]  596 	ldw y,#tib
      009E67 0F 01            [ 1]  597     clr (LL_HB,sp) 
      009E67 04 4C 49         [ 2]  598     addw y,(LL_HB,sp)
      009E6A 53 54            [ 1]  599     clr (y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      009E6C 00 52            [ 1]  600 	ld a,(LL,sp)
      009E6E 9E 67 03         [ 1]  601 	ld count,a 
      009E70 A6 0D            [ 1]  602 	ld a,#CR
      009E70 03 4C 45         [ 4]  603 	call putc
      00231F                        604 	_drop VSIZE 
      009E73 54 00            [ 2]    1     addw sp,#VSIZE 
      009E75 50               [ 4]  605 	ret
                                    606 
                                    607 ;------------------------------
                                    608 ; print byte  in hexadecimal 
                                    609 ; on console
                                    610 ; input:
                                    611 ;    A		byte to print
                                    612 ;------------------------------
      002322                        613 print_hex::
      009E76 9E               [ 1]  614 	push a 
      009E77 70               [ 1]  615 	swap a 
      009E78 CD 23 39         [ 4]  616 	call to_hex_char 
      009E78 43 4B 45         [ 4]  617 	call putc 
      009E7B 59 00            [ 1]  618     ld a,(1,sp) 
      009E7D 4E 9E 78         [ 4]  619 	call to_hex_char
      009E80 CD 02 C1         [ 4]  620 	call putc
      009E80 07 49            [ 1]  621 	ld a,#SPACE 
      009E82 57 44 47         [ 4]  622 	call putc 
      009E85 52               [ 1]  623 	pop a 
      009E86 45               [ 4]  624 	ret 
                                    625 
                                    626 ;----------------------------------
                                    627 ; convert to hexadecimal digit 
                                    628 ; input:
                                    629 ;   A       digit to convert 
                                    630 ; output:
                                    631 ;   A       hexdecimal character 
                                    632 ;----------------------------------
      002339                        633 to_hex_char::
      009E87 46 00            [ 1]  634 	and a,#15 
      009E89 4C 9E            [ 1]  635 	cp a,#9 
      009E8B 80 02            [ 2]  636 	jrule 1$ 
      009E8C AB 07            [ 1]  637 	add a,#7
      009E8C 06 49            [ 1]  638 1$: add a,#'0 
      009E8E 57               [ 4]  639 	ret 
                                    640 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
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
      002344                         51 search_lineno::
      002344                         52 	_vars VSIZE
      009E8F 44 47            [ 2]    1     sub sp,#VSIZE 
      009E91 45 4E            [ 1]   53 	clr (LL,sp)
      009E93 00 4A 9E 8C      [ 2]   54 	ldw y,txtbgn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      009E97 4D               [ 1]   55 	tnz a 
      009E97 46 49            [ 1]   56 	jreq search_ln_loop
      009E99 4E 56 45 52      [ 2]   57 	ldw y,basicptr 
      002353                         58 search_ln_loop:
      009E9D 54 00 48 9E      [ 2]   59 	cpw y,txtend 
      009EA1 97 10            [ 1]   60 	jrpl 8$
      009EA2 90 F3            [ 1]   61 	cpw x,(y)
      009EA2 05 49            [ 1]   62 	jreq 9$
      009EA4 4E 50            [ 1]   63 	jrmi 8$ 
      009EA6 55 54 00         [ 1]   64 	ld a,(2,y)
      009EA9 46 9E            [ 1]   65 	ld (LB,sp),a 
      009EAB A2 F9 01         [ 2]   66 	addw y,(LL,sp)
      009EAC 20 EA            [ 2]   67 	jra search_ln_loop 
      002369                         68 8$: 
      009EAC 02               [ 1]   69 	clrw x 	
      009EAD 49               [ 1]   70 	exgw x,y 
      00236B                         71 9$: _drop VSIZE
      009EAE 46 00            [ 2]    1     addw sp,#VSIZE 
      009EB0 44               [ 1]   72 	exgw x,y   
      009EB1 9E               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      00236F                         83 del_line: 
      00236F                         84 	_vars VSIZE 
      009EB2 AC 04            [ 2]    1     sub sp,#VSIZE 
      009EB3 E6 02            [ 1]   85 	ld a,(2,x) ; line length
      009EB3 43 49            [ 1]   86 	ld (LLEN+1,sp),a 
      009EB5 44 52            [ 1]   87 	clr (LLEN,sp)
      009EB7 00 42            [ 1]   88 	ldw y,x  
      009EB9 9E B3 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      009EBB 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      009EBB 03 48 45 58      [ 2]   91 	ldw y,txtend 
      009EBF 00 40 9E         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      009EC2 BB CF 00 0C      [ 2]   93 	ldw acc16,y 
      009EC3 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      009EC3 44 47 50         [ 4]   95 	call move
      009EC6 49 4F 00 3E      [ 2]   96 	ldw y,txtend 
      009ECA 9E C3 01         [ 2]   97 	subw y,(LLEN,sp)
      009ECC 90 CF 00 1B      [ 2]   98 	ldw txtend,y  
      002399                         99 	_drop VSIZE     
      009ECC 04 47            [ 2]    1     addw sp,#VSIZE 
      009ECE 4F               [ 4]  100 	ret 
                                    101 
                                    102 ;---------------------------------------------
                                    103 ; create a gap in text area to 
                                    104 ; move new line in this gap
                                    105 ; input:
                                    106 ;    X 			addr gap start 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                                    107 ;    Y 			gap length 
                                    108 ; output:
                                    109 ;    X 			addr gap start 
                                    110 ;--------------------------------------------
                           000001   111 	DEST=1
                           000003   112 	SRC=3
                           000005   113 	LEN=5
                           000006   114 	VSIZE=6 
      00239C                        115 create_gap:
      00239C                        116 	_vars VSIZE
      009ECF 54 4F            [ 2]    1     sub sp,#VSIZE 
      009ED1 00 3C            [ 2]  117 	ldw (SRC,sp),x 
      009ED3 9E CC            [ 2]  118 	ldw (LEN,sp),y 
      009ED5 90 CF 00 0C      [ 2]  119 	ldw acc16,y 
      009ED5 05 47            [ 1]  120 	ldw y,x ; SRC
      009ED7 4F 53 55 42      [ 2]  121 	addw x,acc16  
      009EDB 00 3A            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      009EDD 9E D5 1B         [ 2]  124 	ldw x,txtend 
      009EDF 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      009EDF 44 46 52         [ 2]  126 	ldw acc16,x ; size to move
      009EE2 45 45            [ 2]  127 	ldw x,(DEST,sp) 
      009EE4 00 9A 9E         [ 4]  128 	call move
      009EE7 DF 00 1B         [ 2]  129 	ldw x,txtend
      009EE8 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      009EE8 03 46 4F         [ 2]  131 	ldw txtend,x
      0023C5                        132 9$:	_drop VSIZE 
      009EEB 52 00            [ 2]    1     addw sp,#VSIZE 
      009EED 38               [ 4]  133 	ret 
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
      0023C8                        150 insert_line:
      0023C8                        151 	_vars VSIZE 
      009EEE 9E E8            [ 2]    1     sub sp,#VSIZE 
      009EF0 CE 00 1B         [ 2]  152 	ldw x,txtend  
      009EF0 04 46 43         [ 2]  153 	cpw x,txtbgn 
      009EF3 50 55            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      009EF5 00 34 9E         [ 2]  156 	ldw x,#2 
      009EF8 F0 D6 00 17      [ 4]  157 	ld a,([ptr16],x)
      009EF9 A1 03            [ 1]  158 	cp a,#3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      009EF9 05 45            [ 1]  159 	jreq insert_ln_exit
      009EFB 52               [ 1]  160 	clrw x 
      009EFC 41               [ 1]  161 	ld xl,a
      009EFD 53 45            [ 2]  162 	ldw (LLEN,sp),x 
      009EFF 00 32 9E         [ 2]  163 	ldw x,txtbgn
      009F02 F9 01            [ 2]  164 	ldw (DEST,sp),x 
      009F03 CE 00 1B         [ 2]  165 	ldw x,txtend 
      009F03 03 45            [ 2]  166 	jra 4$
      009F05 4E 44 00 30      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      009F09 9F 03            [ 2]  169 	ldw (LINENO,sp),x 
      009F0B AE 00 02         [ 2]  170 	ldw x,#2 
      009F0B 46 45 45 50      [ 4]  171 	ld a,([ptr16],x)
      009F0F 52               [ 1]  172 	ld xl,a
                                    173 ; line length
      009F10 4F 4D            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      009F12 00 2E            [ 2]  176 	ldw x,(LINENO,sp)
      009F14 9F               [ 1]  177 	clr a 
      009F15 0B 23 44         [ 4]  178 	call search_lineno 
      009F16 5D               [ 2]  179 	tnzw x 
      009F16 04 45            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      009F18 44 49            [ 2]  183 	ldw (DEST,sp),y 
      009F1A 54 00            [ 2]  184 	jra 3$
                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      009F1C 2C 9F            [ 2]  187 2$: ldw (DEST,sp),x 
      009F1E 16 23 6F         [ 4]  188 	call del_line
      009F1F                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      009F1F 06 44            [ 1]  192 	ld a,#3
      009F21 57 52            [ 1]  193 	cp a,(LLEN+1,sp)
      009F23 49 54            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      009F25 45 00            [ 2]  197 	ldw x,(DEST,sp)
      009F27 2A 9F 1F         [ 2]  198 	cpw x,txtend 
      009F2A 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      009F2A 45 44            [ 2]  202 	ldw x,(DEST,sp)
      009F2C 52 45            [ 2]  203 	ldw y,(LLEN,sp)
      009F2E 41 44 00         [ 4]  204 	call create_gap
      009F31 28 9F            [ 2]  205 	jra 5$
      002423                        206 4$: 
      009F33 2A FB 07         [ 2]  207 	addw x,(LLEN,sp)
      009F34 CF 00 1B         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      009F34 02 44            [ 2]  210 5$:	ldw x,(LLEN,sp)
      009F36 4F 00 26         [ 2]  211 	ldw acc16,x 
      009F39 9F 34 16 E0      [ 2]  212 	ldw y,#pad ;SRC 
      009F3B 1E 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      009F3B 03 44 45         [ 4]  214 	call move 
      002437                        215 insert_ln_exit:	
      002437                        216 	_drop VSIZE
      009F3E 43 00            [ 2]    1     addw sp,#VSIZE 
      009F40 24               [ 4]  217 	ret
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
      00243A                        233 parse_quote: 
      00243A                        234 	_vars VSIZE 
      009F41 9F 3B            [ 2]    1     sub sp,#VSIZE 
      009F43 4F               [ 1]  235 	clr a
      009F43 43 44            [ 1]  236 1$:	ld (PREV,sp),a 
      00243F                        237 2$:	
      009F45 44 52 00         [ 4]  238 	ld a,([in.w],y)
      009F48 22 9F            [ 1]  239 	jreq 6$
      009F4A 43 5C 00 01      [ 1]  240 	inc in 
      009F4B 6B 02            [ 1]  241 	ld (CURR,sp),a 
      009F4B 06 44            [ 1]  242 	ld a,#'\
      009F4D 41 54            [ 1]  243 	cp a, (PREV,sp)
      009F4F 41 4C            [ 1]  244 	jrne 3$
      009F51 4E 00            [ 1]  245 	clr (PREV,sp)
      009F53 20 9F            [ 1]  246 	ld a,(CURR,sp)
      009F55 4B 1C            [ 4]  247 	callr convert_escape
      009F56 F7               [ 1]  248 	ld (x),a 
      009F56 04               [ 1]  249 	incw x 
      009F57 44 41            [ 2]  250 	jra 2$
      00245A                        251 3$:
      009F59 54 41            [ 1]  252 	ld a,(CURR,sp)
      009F5B 00 1E            [ 1]  253 	cp a,#'\'
      009F5D 9F 56            [ 1]  254 	jreq 1$
      009F5F A1 22            [ 1]  255 	cp a,#'"
      009F5F 43 43            [ 1]  256 	jreq 6$ 
      009F61 52               [ 1]  257 	ld (x),a 
      009F62 4C               [ 1]  258 	incw x 
      009F63 00 1C            [ 2]  259 	jra 2$
      002468                        260 6$:
      009F65 9F               [ 1]  261 	clr (x)
      009F66 5F               [ 1]  262 	incw x 
      009F67 90 93            [ 1]  263 	ldw y,x 
      009F67 43               [ 1]  264 	clrw x 
      009F68 43 52            [ 1]  265 	ld a,#TK_QSTR  
      00246F                        266 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009F6A 48 00            [ 2]    1     addw sp,#VSIZE 
      009F6C 1A               [ 4]  267 	ret 
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
      002472                        278 convert_escape:
      009F6D 9F               [ 2]  279 	pushw x 
      009F6E 67 24 87         [ 2]  280 	ldw x,#escaped 
      009F6F F1               [ 1]  281 1$:	cp a,(x)
      009F6F 84 43            [ 1]  282 	jreq 2$
      009F71 48               [ 1]  283 	tnz (x)
      009F72 41 52            [ 1]  284 	jreq 3$
      009F74 00               [ 1]  285 	incw x 
      009F75 18 9F            [ 2]  286 	jra 1$
      009F77 6F 24 87         [ 2]  287 2$: subw x,#escaped 
      009F78 9F               [ 1]  288 	ld a,xl 
      009F78 03 42            [ 1]  289 	add a,#7
      009F7A 59               [ 2]  290 3$:	popw x 
      009F7B 45               [ 4]  291 	ret 
                                    292 
      009F7C 00 16 9F 78 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      009F80                        310 parse_integer: ; { -- n }
      009F80 05               [ 2]  311 	pushw x 	
      009F81 42 54            [ 1]  312 	push #0 ; TCHAR
      009F83 4F 47            [ 1]  313 	push #10 ; BASE=10
      009F85 4C 00            [ 1]  314 	cp a,#'$
      009F87 14 9F            [ 1]  315 	jrne 2$ 
      002498                        316     _drop #1
      009F89 80 01            [ 2]    1     addw sp,##1 
      009F8A 4B 10            [ 1]  317 	push #16  ; BASE=16
      009F8A 45               [ 1]  318 2$:	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      009F8B 42               [ 1]  319 	incw x 
      009F8C 54 45 53         [ 4]  320 	ld a,([in.w],y)
      009F8F 54 00 12 9F      [ 1]  321 	inc in 
      009F93 8A 09 97         [ 4]  322 	call to_upper 
      009F94 6B 02            [ 1]  323 	ld (TCHAR,sp),a 
      009F94 04 42 53         [ 4]  324 	call is_digit 
      009F97 45 54            [ 1]  325 	jrc 2$
      009F99 00 10            [ 1]  326 	ld a,#16 
      009F9B 9F 94            [ 1]  327 	cp a,(BASE,sp)
      009F9D 26 0A            [ 1]  328 	jrne 3$ 
      009F9D 04 42            [ 1]  329 	ld a,(TCHAR,sp)
      009F9F 52 45            [ 1]  330 	cp a,#'A 
      009FA1 53 00            [ 1]  331 	jrmi 3$ 
      009FA3 0E 9F            [ 1]  332 	cp a,#'G 
      009FA5 9D DD            [ 1]  333 	jrmi 2$ 
      009FA6 72 5A 00 01      [ 1]  334 3$: dec in 	
      009FA6 43               [ 1]  335     clr (x)
      009FA7 42 49            [ 2]  336 	ldw x,(XSAVE,sp)
      009FA9 54 00 0C         [ 4]  337 	call atoi24
      009FAC 9F A6            [ 1]  338 	ldw y,x 
      009FAE CE 00 0C         [ 2]  339 	ldw x,acc16 
      009FAE 03 41            [ 1]  340 	ld a,#TK_INTGR
      009FB0 57 55            [ 2]  341 	ldw (y),x 
      009FB2 00 0A 9F AE      [ 2]  342 	addw y,#2
      009FB6                        343 	_drop VSIZE  
      009FB6 43 41            [ 2]    1     addw sp,#VSIZE 
      009FB8 53               [ 4]  344 	ret 	
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
      0024D9                        361 parse_binary: ; { -- n }
      009FB9 43 00            [ 1]  362 	push #0
      009FBB 08 9F            [ 1]  363 	push #0
      009FBD B6 00            [ 1]  364 	push #0
      009FBE                        365 2$:	
      009FBE 43 41 4E         [ 4]  366 	ld a,([in.w],y)
      009FC1 44 00 06 9F      [ 1]  367 	inc in 
      009FC5 BE 30            [ 1]  368 	cp a,#'0 
      009FC6 27 06            [ 1]  369 	jreq 3$
      009FC6 47 41            [ 1]  370 	cp a,#'1 
      009FC8 44 43            [ 1]  371 	jreq 3$ 
      009FCA 52 45            [ 2]  372 	jra bin_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      009FCC 41 44            [ 1]  373 3$: sub a,#'0 
      009FCE 00               [ 1]  374 	rrc a
      009FCF 04 9F            [ 1]  375 	rlc (BINARY+2,sp) 
      009FD1 C6 02            [ 1]  376 	rlc (BINARY+1,sp)
      009FD2 09 01            [ 1]  377 	rlc (BINARY,sp) 
      009FD2 05 41            [ 2]  378 	jra 2$  
      0024FB                        379 bin_exit:
      009FD4 44 43 4F 4E      [ 1]  380 	dec in 
      009FD8 00 02            [ 1]  381 	ldw y,x
      009FDA 7B 01            [ 1]  382 	ld a,(BINARY,sp)
      009FDA 9F D2 0B         [ 1]  383 	ld acc24,a 
      009FDC 1E 02            [ 2]  384 	ldw x,(BINARY+1,sp)
      009FDC 43 41 42         [ 2]  385 	ldw acc16,x
      009FDF 53 00            [ 2]  386 	ldw (y),x 
      009FE1 00 A9 00 02      [ 2]  387 	addw y,#2  
      009FE2 A6 84            [ 1]  388 	ld a,#TK_INTGR 	
      002513                        389 	_drop VSIZE 
      009FE2 97 7F            [ 2]    1     addw sp,#VSIZE 
      009FE4 93               [ 4]  390 	ret
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
      002516                        406 parse_keyword: 
      009FE5 9B               [ 2]  407 	pushw x 
      002517                        408 kw_loop:	
      009FE6 93 D7 97         [ 4]  409 	call to_upper 
      009FE9 93               [ 1]  410 	ld (x),a 
      009FEA 96               [ 1]  411 	incw x 
      009FEB 70 97 30         [ 4]  412 	ld a,([in.w],y)
      009FEE 99 E1 91 29      [ 1]  413 	inc in 
      009FF2 91 19 91         [ 4]  414 	call is_alpha 
      009FF5 4A 91            [ 1]  415 	jrc kw_loop
      009FF7 3A 97 09 96      [ 1]  416 	dec in   
      009FFB 5E               [ 1]  417 1$: clr (x)
      009FFC 9A 9B            [ 2]  418 	ldw x,(XFIRST,sp) 
      009FFE 9A 95            [ 1]  419 	ld a,(1,x)
      00A000 9A B3            [ 1]  420 	jrne 2$
                                    421 ; one letter variable name 
      00A002 9A               [ 1]  422 	ld a,(x) 
      00A003 B9 9A            [ 1]  423 	sub a,#'A 
      00A005 8F               [ 1]  424 	sll a 
      00A006 8E               [ 1]  425 	push a 
      00A007 4F 9A            [ 1]  426 	push #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A009 0A 94 0B         [ 2]  427 	ldw x,#vars 
      00A00C 94 3B 8F         [ 2]  428 	addw x,(1,sp) ; X=var address 
      002540                        429 	_drop 2 
      00A00F 94 9A            [ 2]    1     addw sp,#2 
      00A011 AD 93            [ 1]  430 	ld a,#TK_VAR 
      00A013 47 95            [ 2]  431 	jra 4$ 
      002546                        432 2$: ; check for keyword, otherwise syntax error.
      002546                        433 	_ldx_dict kword_dict ; dictionary entry point
      00A015 03 98 0D         [ 2]    1     ldw x,#kword_dict+2
      00A018 95 6F            [ 2]  434 	ldw y,(XFIRST,sp) ; name to search for
      00A01A 91 A5 92         [ 4]  435 	call search_dict
      00A01D B0               [ 1]  436 	tnz a
      00A01E 92 95            [ 1]  437 	jrne 4$ 
      00A020 96 AC 8E         [ 2]  438 	jp syntax_error
      002554                        439 4$:	
      00A023 4A 9A            [ 2]  440 	ldw y,(XFIRST,sp)
      00A025 89 91 91         [ 2]  441 	cpw x,#LET_IDX 
      00A028 90 7E            [ 1]  442 	jreq 5$  ; don't compile LET command 
      00A02A 99 FB            [ 1]  443 	ld (y),a 
      00A02C 99 8B            [ 1]  444 	incw y 
      00A02E 99 C1            [ 2]  445 	ldw (y),x
      00A030 96 97 8E CC      [ 2]  446 	addw y,#2  
      002565                        447 5$:	_drop VSIZE 
      00A034 8E FF            [ 2]    1     addw sp,#VSIZE 
      00A036 99               [ 4]  448 	ret  	
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
      002568                        459 skip:
      00A037 C6               [ 1]  460 	push a
      00A038 97 DB 8B         [ 4]  461 1$:	ld a,([in.w],y)
      00A03B EE 92            [ 1]  462 	jreq 2$
      00A03D 25 94            [ 1]  463 	cp a,(C,sp)
      00A03F C2 99            [ 1]  464 	jrne 2$
      00A041 7E 9A 83 97      [ 1]  465 	inc in
      00A045 AB 9C            [ 2]  466 	jra 1$
      002578                        467 2$: _drop 1 
      00A047 47 97            [ 2]    1     addw sp,#1 
      00A049 1D               [ 4]  468 	ret
                                    469 	
                                    470 
                                    471 ;------------------------------------
                                    472 ; scan text for next token
                                    473 ; input: 
                                    474 ;	X 		pointer to buffer where 
                                    475 ;	        token id and value are copied 
                                    476 ; use:
                                    477 ;	Y   pointer to text in tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
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
      00257B                        493 get_token:: 
      00257B                        494 	_vars VSIZE
      00A04A 98 19            [ 2]    1     sub sp,#VSIZE 
                                    495 ;	ld a,in 
                                    496 ;	sub a,count
                                    497 ;   jrmi 0$
                                    498 ;	clr a 
                                    499 ;	ret 
      00257D                        500 0$: 
      00A04C 91 80 9A A7      [ 2]  501 	ldw y,#tib    	
      00A050 91 71            [ 1]  502 	ld a,#SPACE
      00A052 9A A1 8F         [ 4]  503 	call skip
      00A055 F8 9A 4D 9A 53   [ 1]  504 	mov in.saved,in 
      00A05A 9A 59 9A         [ 4]  505 	ld a,([in.w],y)
      00A05D 5F 9A            [ 1]  506 	jrne 1$
      00A05F 65 9A            [ 1]  507 	ldw y,x 
      00A061 6B 9A 71         [ 2]  508 	jp token_exit ; end of line 
      00A064 9A 77 9A 7D      [ 1]  509 1$:	inc in 
      00A068 96 9F 9B         [ 4]  510 	call to_upper 
      00A06B 36 85            [ 1]  511 	ld (TCHAR,sp),a 
                                    512 ; check for quoted string
      00259E                        513 str_tst:  	
      00259E                        514 	_case '"' nbr_tst
      00A06D 06 90            [ 1]    1 	ld a,#'"' 
      00A06F EE 9A            [ 1]    2 	cp a,(TCHAR,sp) 
      00A071 E7 92            [ 1]    3 	jrne nbr_tst
      00A073 D0 98            [ 1]  515 	ld a,#TK_QSTR
      00A075 95               [ 1]  516 	ld (x),a 
      00A076 97               [ 1]  517 	incw x 
      00A077 F4 92 EE         [ 4]  518 	call parse_quote
      00A07A 8E 09 8E         [ 2]  519 	jp token_exit
      0025AE                        520 nbr_tst:
                                    521 ; check for hexadecimal number 
      00A07D 54 97            [ 1]  522 	ld a,#'$'
      00A07F 12 9C            [ 1]  523 	cp a,(TCHAR,sp) 
      00A081 28 9B            [ 1]  524 	jreq 1$
                                    525 ;check for binary number 
      00A083 90 9C            [ 1]  526 	ld a,#'&
      00A085 30 9C            [ 1]  527 	cp a,(TCHAR,sp)
      00A087 08 91            [ 1]  528 	jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A089 FE 94            [ 1]  529 	ld a,#TK_INTGR
      00A08B 76               [ 1]  530 	ld (x),a 
      00A08C 97               [ 1]  531 	incw x 
      00A08D 79 99 62         [ 4]  532 	call parse_binary ; expect binary integer 
      00A090 99 71 91         [ 2]  533 	jp token_exit 
                                    534 ; check for decimal number 	
      00A093 CE 93            [ 1]  535 0$:	ld a,(TCHAR,sp)
      00A095 57 8E C2         [ 4]  536 	call is_digit
      00A098 96 D6            [ 1]  537 	jrnc 3$
      00A09A 9A 1F            [ 1]  538 1$:	ld a,#TK_INTGR 
      00A09C 96               [ 1]  539 	ld (x),a 
      00A09D EC               [ 1]  540 	incw x 
      00A09E 90 F4            [ 1]  541 	ld a,(TCHAR,sp)
      00A0A0 98 FC 96         [ 4]  542 	call parse_integer 
      00A0A3 27 97 C3         [ 2]  543 	jp token_exit 
      0025D7                        544 3$: 
      0025D7                        545 	_case '(' bkslsh_tst 
      00A0A6 8E 6D            [ 1]    1 	ld a,#'(' 
      00A0A8 00 00            [ 1]    2 	cp a,(TCHAR,sp) 
      00A0AA 43 81            [ 1]    3 	jrne bkslsh_tst
      00A0AC 44 80            [ 1]  546 	ld a,#TK_LPAREN
      00A0AE 48 82 46         [ 2]  547 	jp token_char   	
      0025E2                        548 bkslsh_tst: ; character token 
      0025E2                        549 	_case '\',rparnt_tst
      00A0B1 83 33            [ 1]    1 	ld a,#'\' 
      00A0B3 84 00            [ 1]    2 	cp a,(TCHAR,sp) 
      00A0B5 00 16            [ 1]    3 	jrne rparnt_tst
      00A0B6 A6 03            [ 1]  550 	ld a,#TK_CHAR 
      00A0B6 CD               [ 1]  551 	ld (x),a 
      00A0B7 83               [ 1]  552 	incw x 
      00A0B8 51 A1 5B         [ 4]  553 	ld a,([in.w],y)
      00A0BB 27               [ 1]  554 	ld (x),a 
      00A0BC 02               [ 1]  555 	incw x
      00A0BD 4F 81            [ 1]  556 	ldw y,x 	 
      00A0BF CD 83 51 AE      [ 1]  557 	inc in  
      00A0C3 A0               [ 1]  558 	clrw x 
      00A0C4 AA               [ 1]  559 	ld xl,a 
      00A0C5 A6 03            [ 1]  560 	ld a,#TK_CHAR 
      00A0C5 F1 27 08         [ 2]  561 	jp token_exit 
      0025FE                        562 rparnt_tst:		
      0025FE                        563 	_case ')' colon_tst 
      00A0C8 1C 00            [ 1]    1 	ld a,#')' 
      00A0CA 02 7D            [ 1]    2 	cp a,(TCHAR,sp) 
      00A0CC 26 F7            [ 1]    3 	jrne colon_tst
      00A0CE 4F 81            [ 1]  564 	ld a,#TK_RPAREN 
      00A0D0 5C F6 A1         [ 2]  565 	jp token_char
      002609                        566 colon_tst:
      002609                        567 	_case ':' comma_tst 
      00A0D3 84 26            [ 1]    1 	ld a,#':' 
      00A0D5 05 88            [ 1]    2 	cp a,(TCHAR,sp) 
      00A0D7 CD 83            [ 1]    3 	jrne comma_tst
      00A0D9 51 84            [ 1]  568 	ld a,#TK_COLON 
      00A0DB CC 27 33         [ 2]  569 	jp token_char  
      002614                        570 comma_tst:
      002614                        571 	_case COMMA sharp_tst 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A0DB 81 2C            [ 1]    1 	ld a,#COMMA 
      00A0DC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A0DC F6 27            [ 1]    3 	jrne sharp_tst
      00A0DE 06 CD            [ 1]  572 	ld a,#TK_COMMA
      00A0E0 83 41 5C         [ 2]  573 	jp token_char
      00261F                        574 sharp_tst:
      00261F                        575 	_case SHARP dash_tst 
      00A0E3 20 F7            [ 1]    1 	ld a,#SHARP 
      00A0E5 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A0E6 26 05            [ 1]    3 	jrne dash_tst
      00A0E6 A6 08            [ 1]  576 	ld a,#TK_SHARP
      00A0E8 CD 83 41         [ 2]  577 	jp token_char  	 	 
      00262A                        578 dash_tst: 	
      00262A                        579 	_case '-' at_tst 
      00A0EB A6 20            [ 1]    1 	ld a,#'-' 
      00A0ED CD 83            [ 1]    2 	cp a,(TCHAR,sp) 
      00A0EF 41 A6            [ 1]    3 	jrne at_tst
      00A0F1 08 CD            [ 1]  580 	ld a,#TK_MINUS  
      00A0F3 83 41 81         [ 2]  581 	jp token_char 
      00A0F6                        582 at_tst:
      002635                        583 	_case '@' qmark_tst 
      00A0F6 88 0D            [ 1]    1 	ld a,#'@' 
      00A0F8 01 27            [ 1]    2 	cp a,(TCHAR,sp) 
      00A0FA 07 CD            [ 1]    3 	jrne qmark_tst
      00A0FC A0 E6            [ 1]  584 	ld a,#TK_ARRAY 
      00A0FE 0A 01 20         [ 2]  585 	jp token_char
      002640                        586 qmark_tst:
      002640                        587 	_case '?' tick_tst 
      00A101 F5 84            [ 1]    1 	ld a,#'?' 
      00A103 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A104 26 12            [ 1]    3 	jrne tick_tst
      00A104 A6 1B            [ 1]  588 	ld a,#TK_CMD  
      00A106 CD               [ 1]  589 	ld (x),a 
      00A107 83               [ 1]  590 	incw x 
      00A108 41 A6            [ 1]  591 	ldw y,x 
      00A10A 5B CD 83         [ 2]  592 	ldw x,#PRT_IDX 
      00A10D 41 81            [ 2]  593 	ldw (y),x 
      00A10F 72 A9 00 02      [ 2]  594 	addw y,#2
      00A10F 89 5F 97         [ 2]  595 	jp token_exit
      002658                        596 tick_tst: ; comment 
      002658                        597 	_case TICK plus_tst 
      00A112 A6 0A            [ 1]    1 	ld a,#TICK 
      00A114 62 95            [ 1]    2 	cp a,(TCHAR,sp) 
      00A116 9F 4D            [ 1]    3 	jrne plus_tst
      00A118 27 0B            [ 1]  598 	ld a,#TK_CMD
      00A11A A1               [ 1]  599 	ld (x),a 
      00A11B 09               [ 1]  600 	incw x
      00A11C 23 02 A6 39      [ 2]  601 	ldw y,#REM_IDX
      00A120 FF               [ 2]  602 	ldw (x),y 
      00A120 AB 30 CD         [ 2]  603 	addw x,#2  
      00266A                        604 copy_comment:
      00A123 83 41 9E AB      [ 2]  605 	ldw y,#tib 
      00A127 30 CD 83 41      [ 2]  606 	addw y,in.w
      00A12B 85 81            [ 2]  607 	pushw y
      00A12D CD 03 B5         [ 4]  608 	call strcpy
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A12D 88 CD A1         [ 2]  609     subw y,(1,sp)
      00A130 04 84            [ 1]  610 	ld a,yl 
      00A132 CD A1 0F         [ 1]  611 	add a,in
      00A135 A6 44 CD         [ 1]  612 	ld in,a 
      00A138 83 41            [ 2]  613 	ldw (1,sp),x
      00A13A 81 F9 01         [ 2]  614 	addw y,(1,sp)
      00A13B 90 5C            [ 1]  615 	incw y 
      002689                        616 	_drop 2 
      00A13B 88 CD            [ 2]    1     addw sp,#2 
      00A13D A1 04 84         [ 2]  617 	ldw x,#REM_IDX 
      00A140 CD A1            [ 1]  618 	ld a,#TK_CMD 
      00A142 0F A6 43         [ 2]  619 	jp token_exit 
      002693                        620 plus_tst:
      002693                        621 	_case '+' star_tst 
      00A145 CD 83            [ 1]    1 	ld a,#'+' 
      00A147 41 81            [ 1]    2 	cp a,(TCHAR,sp) 
      00A149 26 05            [ 1]    3 	jrne star_tst
      00A149 A6 20            [ 1]  622 	ld a,#TK_PLUS  
      00A14B 5D 27 06         [ 2]  623 	jp token_char 
      00269E                        624 star_tst:
      00269E                        625 	_case '*' slash_tst 
      00A14E CD 83            [ 1]    1 	ld a,#'*' 
      00A150 41 5A            [ 1]    2 	cp a,(TCHAR,sp) 
      00A152 20 F7            [ 1]    3 	jrne slash_tst
      00A154 A6 20            [ 1]  626 	ld a,#TK_MULT 
      00A154 81 27 33         [ 2]  627 	jp token_char 
      00A155                        628 slash_tst: 
      0026A9                        629 	_case '/' prcnt_tst 
      00A155 52 06            [ 1]    1 	ld a,#'/' 
      00A157 6B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      00A159 9E 6B            [ 1]    3 	jrne prcnt_tst
      00A15B 01 9F            [ 1]  630 	ld a,#TK_DIV 
      00A15D 6B 03 93         [ 2]  631 	jp token_char 
      0026B4                        632 prcnt_tst:
      0026B4                        633 	_case '%' eql_tst 
      00A160 5C 7B            [ 1]    1 	ld a,#'%' 
      00A162 03 10            [ 1]    2 	cp a,(TCHAR,sp) 
      00A164 01 4C            [ 1]    3 	jrne eql_tst
      00A166 C7 00            [ 1]  634 	ld a,#TK_MOD
      00A168 0E 72 5F         [ 2]  635 	jp token_char  
                                    636 ; 1 or 2 character tokens 	
      0026BF                        637 eql_tst:
      0026BF                        638 	_case '=' gt_tst 		
      00A16B 00 0D            [ 1]    1 	ld a,#'=' 
      00A16D CD 84            [ 1]    2 	cp a,(TCHAR,sp) 
      00A16F 45 90            [ 1]    3 	jrne gt_tst
      00A171 AE 16            [ 1]  639 	ld a,#TK_EQUAL
      00A173 90 7B 01         [ 2]  640 	jp token_char 
      0026CA                        641 gt_tst:
      0026CA                        642 	_case '>' lt_tst 
      00A176 C7 00            [ 1]    1 	ld a,#'>' 
      00A178 0E 72            [ 1]    2 	cp a,(TCHAR,sp) 
      00A17A B9 00            [ 1]    3 	jrne lt_tst
      00A17C 0D 7B            [ 1]  643 	ld a,#TK_GT 
      00A17E 02 90            [ 1]  644 	ld (ATTRIB,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A180 F7 90 5C         [ 4]  645 	ld a,([in.w],y)
      00A183 7B 01 CD A1      [ 1]  646 	inc in 
      00A187 2D AE            [ 1]  647 	cp a,#'=
      00A189 16 90            [ 1]  648 	jrne 1$
      00A18B CD A0            [ 1]  649 	ld a,#TK_GE 
      00A18D DC 7B            [ 2]  650 	jra token_char  
      00A18F 03 10            [ 1]  651 1$: cp a,#'<
      00A191 01 CD            [ 1]  652 	jrne 2$
      00A193 A1 2D            [ 1]  653 	ld a,#TK_NE 
      00A195 5B 06            [ 2]  654 	jra token_char 
      00A197 81 5A 00 01      [ 1]  655 2$: dec in
      00A198 7B 02            [ 1]  656 	ld a,(ATTRIB,sp)
      00A198 52 02            [ 2]  657 	jra token_char 	 
      0026F3                        658 lt_tst:
      0026F3                        659 	_case '<' other
      00A19A 6B 02            [ 1]    1 	ld a,#'<' 
      00A19C 9F 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      00A19E 01 93            [ 1]    3 	jrne other
      00A1A0 90 5C            [ 1]  660 	ld a,#TK_LT 
      00A1A2 7B 02            [ 1]  661 	ld (ATTRIB,sp),a 
      00A1A4 10 01 4C         [ 4]  662 	ld a,([in.w],y)
      00A1A7 C7 00 0E 72      [ 1]  663 	inc in 
      00A1AB 5F 00            [ 1]  664 	cp a,#'=
      00A1AD 0D CD            [ 1]  665 	jrne 1$
      00A1AF 84 45            [ 1]  666 	ld a,#TK_LE 
      00A1B1 90 AE            [ 2]  667 	jra token_char 
      00A1B3 16 90            [ 1]  668 1$: cp a,#'>
      00A1B5 7B 01            [ 1]  669 	jrne 2$
      00A1B7 C7 00            [ 1]  670 	ld a,#TK_NE 
      00A1B9 0E 72            [ 2]  671 	jra token_char 
      00A1BB B9 00 0D 93      [ 1]  672 2$: dec in 
      00A1BF CD A0            [ 1]  673 	ld a,(ATTRIB,sp)
      00A1C1 DC A6            [ 2]  674 	jra token_char 	
      00271C                        675 other: ; not a special character 	 
      00A1C3 20 CD            [ 1]  676 	ld a,(TCHAR,sp)
      00A1C5 83 41 7B         [ 4]  677 	call is_alpha 
      00A1C8 02 10            [ 1]  678 	jrc 30$ 
      00A1CA 01 CD A1         [ 2]  679 	jp syntax_error 
      002726                        680 30$: 
      00A1CD 2D 0A 02         [ 4]  681 	call parse_keyword
      00A1D0 5B 02 81         [ 2]  682 	cpw x,#remark 
      00A1D3 26 09            [ 1]  683 	jrne token_exit 
      00A1D3 CD A1            [ 1]  684 	ldw y,x 
      00A1D5 04 A6 32         [ 2]  685 	jp copy_comment 
      002733                        686 token_char:
      00A1D8 CD               [ 1]  687 	ld (x),a 
      00A1D9 83               [ 1]  688 	incw x
      00A1DA 41 A6            [ 1]  689 	ldw y,x 
      002737                        690 token_exit:
      002737                        691 	_drop VSIZE 
      00A1DC 4B CD            [ 2]    1     addw sp,#VSIZE 
      00A1DE 83               [ 4]  692 	ret
                                    693 
                                    694 
                                    695 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
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
      00273A                        712 compile::
      00273A                        713 	_vars VSIZE 
      00A1DF 41 81            [ 2]    1     sub sp,#VSIZE 
      00A1E1 55 00 19 00 04   [ 1]  714 	mov basicptr,txtbgn
      00A1E1 52 04 5F 1F      [ 1]  715 	bset flags,#FCOMP 
      00A1E5 02 1F            [ 1]  716 	ld a,#0
      00A1E7 03 03 04         [ 2]  717 	ldw x,#0
      00A1EA 90 AE 16         [ 2]  718 	ldw pad,x ; destination buffer 
      00A1ED 90 16 E2         [ 1]  719 	ld pad+2,a ; count 
      00A1EE AE 16 E3         [ 2]  720 	ldw x,#pad+3
      00A1EE CD 83 51 6B      [ 1]  721 	clr in 
      00A1F2 01 A1 1B         [ 4]  722 	call get_token
      00A1F5 26 05            [ 1]  723 	cp a,#TK_INTGR
      00A1F7 CD A0            [ 1]  724 	jrne 2$
      00A1F9 B6 6B 01         [ 2]  725 	cpw x,#1 
      00A1FC A1 0D            [ 1]  726 	jrpl 1$
      00A1FE 26 03            [ 1]  727 	ld a,#ERR_BAD_VALUE
      00A200 CC A3 8A         [ 2]  728 	jp tb_error
      00A203 A1 0A 26         [ 2]  729 1$:	ldw pad,x 
      00A206 03 CC A3 8A      [ 2]  730 	ldw y,#pad+3 
      00A20A 90 A3 17 60      [ 2]  731 2$:	cpw y,#stack_full 
      00A20A A1 08            [ 1]  732 	jrult 3$
      00A20C 26 12            [ 1]  733 	ld a,#ERR_BUF_FULL 
      00A20E 0D 03 27         [ 2]  734 	jp tb_error 
      00277A                        735 3$:	
      00A211 DC               [ 1]  736 	ldw x,y 
      00A212 A6 01 CD         [ 4]  737 	call get_token 
      00A215 A1 2D            [ 1]  738 	cp a,#TK_NONE 
      00A217 0A 03            [ 1]  739 	jrne 2$ 
                                    740 ; compilation completed  
      00A219 90 5A 7B 03      [ 2]  741 	subw y,#pad
      00A21D CC A3            [ 1]  742     ld a,yl
      00A21F 36 16 E0         [ 2]  743 	ldw x,#pad 
      00A220 CF 00 17         [ 2]  744 	ldw ptr16,x 
      00A220 A1 04            [ 1]  745 	ld (2,x),a 
      00A222 26               [ 2]  746 	ldw x,(x)
      00A223 1A CD            [ 1]  747 	jreq 10$
      00A225 A1 D3 7B         [ 4]  748 	call insert_line
      00A228 03 4C CD A1      [ 1]  749 	clr  count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00A22C 2D A6            [ 2]  750 	jra  11$ 
      00279C                        751 10$: ; line# is zero 
      00A22E 3E CD 83         [ 2]  752 	ldw x,ptr16  
      00A231 41 90 AE         [ 2]  753 	ldw basicptr,x 
      00A234 16 90            [ 1]  754 	ld a,(2,x)
      00A236 90 7F 0F         [ 1]  755 	ld count,a 
      00A239 02 0F 03 20      [ 1]  756 	mov in,#3 
      0027AB                        757 11$:
      0027AB                        758 	_drop VSIZE 
      00A23D B0 02            [ 2]    1     addw sp,#VSIZE 
      00A23E 72 1B 00 20      [ 1]  759 	bres flags,#FCOMP 
      00A23E A1               [ 4]  760 	ret 
                                    761 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
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
      0027B2                         47 cpy_cmd_name:
      00A23F 12               [ 1]   48 	ld a,(x)
      00A240 26               [ 1]   49 	incw x
      00A241 21 0D            [ 1]   50 	and a,#15  
      00A243 02               [ 1]   51 	push a 
      00A244 26 A8            [ 1]   52     tnz (1,sp) 
      00A246 AE 16            [ 1]   53 	jreq 9$
      00A248 90               [ 1]   54 1$:	ld a,(x)
      00A249 CD 84            [ 1]   55 	ld (y),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A24B 19               [ 1]   56 	incw x
      00A24C 90 AE            [ 1]   57 	incw y 
      00A24E 16 90            [ 1]   58 	dec (1,sp)	 
      00A250 27 9C            [ 1]   59 	jrne 1$
      00A252 6B               [ 1]   60 9$: pop a 
      00A253 02               [ 4]   61 	ret	
                                     62 
                                     63 ;--------------------------
                                     64 ; add a space after letter or 
                                     65 ; digit.
                                     66 ; input:
                                     67 ;   Y     pointer to buffer 
                                     68 ; output:
                                     69 ;   Y    moved to end 
                                     70 ;--------------------------
      0027C7                         71 add_space:
      00A254 6B 03            [ 2]   72 	decw y 
      00A256 AE 16            [ 1]   73 	ld a,(y)
      00A258 90 CD            [ 1]   74 	incw y
      00A25A A0 DC 0F         [ 4]   75 	call is_alnum 
      00A25D 01 72            [ 1]   76 	jrnc 1$
      00A25F F9 01            [ 1]   77 	ld a,#SPACE 
      00A261 20 8B            [ 1]   78 	ld (y),a 
      00A263 90 5C            [ 1]   79 	incw y 
      00A263 A1               [ 4]   80 1$: ret 
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
      0027D9                         92 right_align::
      00A264 05               [ 1]   93 	push a 
      00A265 26 49            [ 1]   94 0$: ld a,(1,sp)
      00A267 AE 16 90         [ 1]   95 	cp a,tab_width 
      00A26A CD 8A            [ 1]   96 	jrpl 1$
      00A26C 23 CE            [ 1]   97 	ld a,#SPACE 
      00A26E 00               [ 2]   98 	decw x
      00A26F 0D               [ 1]   99 	ld (x),a  
      00A270 CD A3            [ 1]  100 	inc (1,sp)
      00A272 C4 5D            [ 2]  101 	jra 0$ 
      00A274 26               [ 1]  102 1$: pop a 	
      00A275 0B               [ 4]  103 	ret 
                                    104 
                                    105 ;--------------------------
                                    106 ; print TK_QSTR
                                    107 ; converting control character
                                    108 ; to backslash sequence
                                    109 ; input:
                                    110 ;   X        char *
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



                                    111 ;   Y        dest. buffer 
                                    112 ; output:
                                    113 ;   X        moved forward 
                                    114 ;   Y        moved forward 
                                    115 ;-----------------------------
      0027EB                        116 cpy_quote:
      00A276 0F 02            [ 1]  117 	ld a,#'"
      00A278 90 AE            [ 1]  118 	ld (y),a 
      00A27A 16 90            [ 1]  119 	incw y 
      00A27C 90               [ 1]  120 1$:	ld a,(x)
      00A27D 7F CC            [ 1]  121 	jreq 9$
      00A27F A3               [ 1]  122 	incw x 
      00A280 8A 20            [ 1]  123 	cp a,#SPACE 
      00A281 25 0E            [ 1]  124 	jrult 3$
      00A281 CF 00            [ 1]  125 	ld (y),a
      00A283 05 E6            [ 1]  126 	incw y 
      00A285 02 C7            [ 1]  127 	cp a,#'\ 
      00A287 00 04            [ 1]  128 	jrne 1$ 
      002801                        129 2$:
      00A289 90 AE            [ 1]  130 	ld (y),a
      00A28B 16 90            [ 1]  131 	incw y  
      00A28D CD A8            [ 2]  132 	jra 1$
      00A28F D5               [ 1]  133 3$: push a 
      00A290 0F 01            [ 1]  134 	ld a,#'\
      00A292 A6 0D            [ 1]  135 	ld (y),a 
      00A294 CD 83            [ 1]  136 	incw y  
      00A296 41               [ 1]  137 	pop a 
      00A297 A6 3E            [ 1]  138 	sub a,#7
      00A299 CD 83 41         [ 1]  139 	ld acc8,a 
      00A29C AE 16 90 CD      [ 1]  140 	clr acc16
      00A2A0 84               [ 2]  141 	pushw x
      00A2A1 19 6B 02         [ 2]  142 	ldw x,#escaped 
      00A2A4 CD A0 DC 90      [ 2]  143 	addw x,acc16 
      00A2A8 93               [ 1]  144 	ld a,(x)
      00A2A9 7B               [ 2]  145 	popw x
      00A2AA 02 6B            [ 2]  146 	jra 2$
      00A2AC 03 CC            [ 1]  147 9$: ld a,#'"
      00A2AE A1 EE            [ 1]  148 	ld (y),a 
      00A2B0 90 5C            [ 1]  149 	incw y  
      00A2B0 A1               [ 1]  150 	incw x 
      00A2B1 81               [ 4]  151 	ret
                                    152 
                                    153 ;--------------------------
                                    154 ; return variable name 
                                    155 ; from its address.
                                    156 ; input:
                                    157 ;   X    variable address
                                    158 ; output:
                                    159 ;   A     variable letter
                                    160 ;--------------------------
      00282C                        161 var_name::
      00A2B2 26 15 7B         [ 2]  162 		subw x,#vars 
      00A2B5 03               [ 1]  163 		ld a,xl 
      00A2B6 11               [ 1]  164 		srl a 
      00A2B7 02 2B            [ 1]  165 		add a,#'A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A2B9 03               [ 4]  166 		ret 
                                    167 
                                    168 ;-----------------------------
                                    169 ; return cmd  idx from its 
                                    170 ; code address 
                                    171 ; input:
                                    172 ;   X      code address 
                                    173 ; output:
                                    174 ;   X      cmd_idx
                                    175 ;-----------------------------
      002834                        176 get_cmd_idx:
      00A2BA CC A1            [ 2]  177 	pushw y
      00A2BC EE AE 1F 62      [ 2]  178 	ldw y,#code_addr 
      00A2BD 90 CF 00 17      [ 2]  179 	ldw ptr16,y 
      00A2BD A6 01            [ 1]  180 	clrw y 
      00A2BF CD A1 3B         [ 5]  181 1$:	cpw x,([ptr16],y)
      00A2C2 0C 03            [ 1]  182 	jreq 3$ 
      00A2C4 90 5C            [ 1]  183 	incw y 
      00A2C6 CC A1 EE         [ 4]  184 	ld a,([ptr16],y)
      00A2C9 A1 80            [ 1]  185 	incw y
      00A2CB 26 13 0D         [ 4]  186 	or a,([ptr16],y)	
      00A2CE 03 26            [ 1]  187 	jrne 1$
      00A2D0 03               [ 1]  188 3$: ldw x,y 
      00A2D1 CC A1            [ 2]  189 	popw y 
      00A2D3 EE               [ 4]  190 	ret
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
      00A2D4                        206 decompile::
      002855                        207 	_vars VSIZE
      00A2D4 A6 01            [ 2]    1     sub sp,#VSIZE 
      00A2D6 CD A1 2D         [ 1]  208 	ld a,base
      00A2D9 0A 03            [ 1]  209 	ld (BASE_SAV,sp),a  
      00A2DB 90 5A CC         [ 1]  210 	ld a,tab_width 
      00A2DE A1 EE            [ 1]  211 	ld (WIDTH_SAV,sp),a 
      00A2E0 A1 82            [ 2]  212 	ldw (STR,sp),y   
      00A2E2 26 0E 7B 03      [ 5]  213 	ldw x,[basicptr] ; line number 
      00A2E6 CD A1 2D 0F      [ 1]  214 	mov base,#10
      00A2EA 03 90 AE 16      [ 1]  215 	mov tab_width,#5
      00A2EE 90 CC A1 EE      [ 1]  216 	clr acc24 
      00A2F2 A1 83 26         [ 2]  217 	ldw acc16,x
      00A2F5 26 7B 03         [ 4]  218 	call itoa  
      00A2F8 11 02 26         [ 4]  219 	call right_align 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00A2FB 03               [ 1]  220 	push a 
      00A2FC CC A1            [ 1]  221 1$:	ldw y,x ; source
      00A2FE EE 04            [ 2]  222 	ldw x,(STR+1,sp) ; destination
      00A2FF CD 03 B5         [ 4]  223 	call strcpy 
      00A2FF 7B 02            [ 1]  224 	clrw y 
      00A301 10               [ 1]  225 	pop a 
      00A302 03 CD            [ 1]  226 	ld yl,a 
      00A304 A1 3B 7B         [ 2]  227 	addw y,(STR,sp)
      00A307 02 6B            [ 1]  228 	ld a,#SPACE 
      00A309 03 90            [ 1]  229 	ld (y),a 
      00A30B AE 16            [ 1]  230 	incw y 
      00A30D 90 72 5F 00      [ 1]  231 	clr tab_width
      00A311 0D C7 00         [ 2]  232 	ldw x,#3
      00A314 0E 72 B9         [ 2]  233 	ldw in.w,x 
      00289C                        234 decomp_loop:
      00A317 00 0D            [ 2]  235 	pushw y
      00A319 CC A1 EE         [ 4]  236 	call next_token 
      00A31C A1 0F            [ 2]  237 	popw y 
      00A31E 26               [ 1]  238 	tnz a  
      00A31F 0C 03            [ 1]  239 	jrne 1$
      00A321 04 90 89         [ 2]  240 	jp 20$
      00A324 CD 93            [ 1]  241 1$:	jrpl 6$
                                    242 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      00A326 4E 90            [ 1]  243 	cp a,#TK_VAR 
      00A328 85 CC            [ 1]  244 	jrne 3$
                                    245 ;; TK_VAR 
      00A32A A1 EE A1         [ 4]  246 	call add_space  
      00A32D 84 26 11         [ 4]  247 	call var_name
      00A330 7B 03            [ 1]  248 	ld (y),a 
      00A332 11 02            [ 1]  249 	incw y  
      00A334 2A 08            [ 2]  250 	jra decomp_loop
      00A336                        251 3$:
      00A336 97 7B            [ 1]  252 	cp a,#TK_INTGR
      00A338 02 CD            [ 1]  253 	jrne 4$
                                    254 ;; TK_INTGR
      00A33A A1 98 0A         [ 4]  255 	call add_space
      00A33D 02 5F 00 0B      [ 1]  256 	clr acc24 
      00A33E CF 00 0C         [ 2]  257 	ldw acc16,x 
      00A33E CC A1            [ 2]  258 	pushw y 
      00A340 EE 08 A7         [ 4]  259 	call itoa  
      00A341 16 01            [ 2]  260 	ldw y,(1,sp) 
      00A341 A1               [ 1]  261 	push a 
      00A342 20               [ 1]  262 	exgw x,y 
      00A343 2A 03 CC         [ 4]  263 	call strcpy 
      00A346 A1 EE            [ 1]  264 	clrw y
      00A348 84               [ 1]  265 	pop a  
      00A348 A6 4F            [ 1]  266 	ld yl,a 
      00A34A 11 02 2A         [ 2]  267 	addw y,(1,sp)
      0028DD                        268 	_drop 2 
      00A34D 03 CC            [ 2]    1     addw sp,#2 
      00A34F A1 EE            [ 2]  269 	jra decomp_loop
                                    270 ;; dictionary keyword 
      0028E1                        271 4$:	
      00A351 0D 04 26         [ 4]  272 	call get_cmd_idx 
      00A354 18 7B 03         [ 2]  273 	cpw x,#REM_IDX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A357 11 02            [ 1]  274 	jrne 5$
      00A359 27 12 7B         [ 2]  275 	ldw x,basicptr 
                                    276 ; copy comment to buffer 
      00A35C 02 97 7B         [ 4]  277 	call add_space
      00A35F 03 95            [ 1]  278 	ld a,#''
      00A361 7B 01            [ 1]  279 	ld (y),a 
      00A363 CD A1            [ 1]  280 	incw y 
      0028F5                        281 41$:
      00A365 55 0C 02 0C      [ 4]  282 	ld a,([in.w],x)
      00A369 03 CC A1 EE      [ 1]  283 	inc in  
      00A36D 90 F7            [ 1]  284 	ld (y),a 
      00A36D 7B 01            [ 1]  285 	incw y 
      00A36F 90 F7 90         [ 1]  286 	ld a,in 
      00A372 5C CD 83         [ 1]  287 	cp a,count 
      00A375 41 7B            [ 1]  288 	jrmi 41$
      00A377 03 11            [ 2]  289 	jra 20$  
      00A379 02 2B 09         [ 2]  290 5$: cpw x,#LET_IDX 
      00A37C 90 7F            [ 1]  291 	jreq decomp_loop ; down display LET 	
                                    292 ; insert command name 
      00A37E 0C 02 0C         [ 4]  293 	call add_space  
      00A381 03 CC            [ 2]  294 	pushw y
      00A383 A1 EE C3         [ 4]  295 	call cmd_name
      00A385 90 85            [ 2]  296 	popw y 
      00A385 0C 03 CC         [ 4]  297 	call cpy_cmd_name
      00A388 A1 EE 9C         [ 2]  298 	jp decomp_loop 
      00A38A                        299 6$:
      00A38A 90 AE            [ 1]  300 	cp a,#TK_QSTR 
      00A38C 16 90            [ 1]  301 	jrne 7$
                                    302 ;; TK_QSTR
      00A38E 0F 01 72         [ 4]  303 	call cpy_quote  
      00A391 F9 01 90         [ 2]  304 	jp decomp_loop
      00292A                        305 7$:
      00A394 7F 7B            [ 1]  306 	cp a,#TK_CHAR 
      00A396 02 C7            [ 1]  307 	jrne 8$
                                    308 ;; TK_CHAR 
      00A398 00 04            [ 1]  309 	ld a,#'\ 
      00A39A A6 0D            [ 1]  310 	ld (y),a 
      00A39C CD 83            [ 1]  311 	incw y 
      00A39E 41               [ 1]  312 	ld a,xl 
      00A39F 5B 04            [ 1]  313 	ld (y),a 
      00A3A1 81 5C            [ 1]  314 	incw y 
      00A3A2 CC 28 9C         [ 2]  315 	jp decomp_loop
      00A3A2 88 4E            [ 1]  316 8$: cp a,#TK_COLON 
      00A3A4 CD A3            [ 1]  317 	jrne 9$
      00A3A6 B9 CD            [ 1]  318 	ld a,#':
      002942                        319 81$:
      00A3A8 83 41            [ 1]  320 	ld (y),a 
      00A3AA 7B 01            [ 1]  321 	incw y 
      002946                        322 82$:
      00A3AC CD A3 B9         [ 2]  323 	jp decomp_loop
      002949                        324 9$: 
      00A3AF CD 83            [ 1]  325 	cp a,#TK_SHARP
      00A3B1 41 A6            [ 1]  326 	jrugt 10$ 
      00A3B3 20 CD            [ 1]  327 	sub a,#TK_ARRAY 
      00A3B5 83               [ 1]  328 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00A3B6 41               [ 1]  329 	ld xl,a
      00A3B7 84 81 9E         [ 2]  330 	addw x,#single_char 
      00A3B9 F6               [ 1]  331 	ld a,(x)
      00A3B9 A4 0F            [ 2]  332 	jra 81$ 
      002957                        333 10$: 
      00A3BB A1 09            [ 1]  334 	cp a,#TK_MINUS 
      00A3BD 23 02            [ 1]  335 	jrugt 11$
      00A3BF AB 07            [ 1]  336 	sub a,#TK_PLUS 
      00A3C1 AB               [ 1]  337 	clrw x 
      00A3C2 30               [ 1]  338 	ld xl,a 
      00A3C3 81 29 A3         [ 2]  339 	addw x,#add_char 
      00A3C4 F6               [ 1]  340 	ld a,(x)
      00A3C4 52 02            [ 2]  341 	jra 81$
      002965                        342 11$:
      00A3C6 0F 01            [ 1]  343     cp a,#TK_MOD 
      00A3C8 90 CE            [ 1]  344 	jrugt 12$
      00A3CA 00 1A            [ 1]  345 	sub a,#TK_MULT
      00A3CC 4D               [ 1]  346 	clrw x 
      00A3CD 27               [ 1]  347 	ld xl,a 
      00A3CE 04 90 CE         [ 2]  348 	addw x,#mul_char
      00A3D1 00               [ 1]  349 	ld a,(x)
      00A3D2 05 CF            [ 2]  350 	jra 81$
      00A3D3                        351 12$:
      00A3D3 90 C3            [ 1]  352 	sub a,#TK_GT  
      00A3D5 00               [ 1]  353 	sll a 
      00A3D6 1C               [ 1]  354 	clrw x 
      00A3D7 2A               [ 1]  355 	ld xl,a 
      00A3D8 10 90 F3         [ 2]  356 	addw x,#relop_str 
      00A3DB 27               [ 2]  357 	ldw x,(x)
      00A3DC 0E               [ 1]  358 	ld a,(x)
      00A3DD 2B               [ 1]  359 	incw x 
      00A3DE 0A 90            [ 1]  360 	ld (y),a
      00A3E0 E6 02            [ 1]  361 	incw y 
      00A3E2 6B               [ 1]  362 	ld a,(x)
      00A3E3 02 72            [ 1]  363 	jrne 81$
      00A3E5 F9 01 20         [ 2]  364 	jp decomp_loop 
      002988                        365 20$: 
      00A3E8 EA 7F            [ 1]  366 	clr (y)
      00A3E9 1E 03            [ 2]  367 	ldw x,(STR,sp)
      00A3E9 5F 51            [ 1]  368 	ld a,(BASE_SAV,sp)
      00A3EB 5B 02 51         [ 1]  369 	ld base,a 
      00A3EE 81 02            [ 1]  370 	ld a,(WIDTH_SAV,sp)
      00A3EF C7 00 21         [ 1]  371 	ld tab_width,a
      00A3EF 52 04 E6         [ 2]  372 	subw y,(STR,sp) 
      00A3F2 02 6B            [ 1]  373 	ld a,yl 
      00299B                        374 	_drop VSIZE 
      00A3F4 02 0F            [ 2]    1     addw sp,#VSIZE 
      00A3F6 01               [ 4]  375 	ret 
                                    376 
      00A3F7 90 93 72 F9 01         377 single_char: .byte '@','(',')',',','#'
      00A3FC 17 03                  378 add_char: .byte '+','-'
      00A3FE 90 CE 00               379 mul_char: .byte '*','/','%'
      00A401 1C 72 F2 03 90 CF 00   380 relop_str: .word gt,equal,ge,lt,le,ne 
             0D 16 03 CD 84
      00A40D 45 90                  381 gt: .asciz ">"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      00A40F CE 00                  382 equal: .asciz "="
      00A411 1C 72 F2               383 ge: .asciz ">="
      00A414 01 90                  384 lt: .asciz "<"
      00A416 CF 00 1C               385 le: .asciz "<="
      00A419 5B 04 81               386 ne:  .asciz "<>"
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
      00A41C                        399 cmd_name:
      0029C3                        400 	_vars VSIZE 
      00A41C 52 06            [ 2]    1     sub sp,#VSIZE 
      00A41E 1F 03 17 05      [ 1]  401 	clr acc16 
      00A422 90 CF            [ 2]  402 	ldw (CMDX,sp),x  
      00A424 00 0D 90         [ 2]  403 	ldw x,#kword_dict	
      00A427 93 72            [ 2]  404 1$:	ldw (LINK,sp),x
      00A429 BB 00            [ 1]  405 	ld a,(2,x)
      00A42B 0D 1F            [ 1]  406 	and a,#15 
      00A42D 01 CE 00         [ 1]  407 	ld acc8,a 
      00A430 1C 72 F0         [ 2]  408 	addw x,#3
      00A433 03 CF 00 0D      [ 2]  409 	addw x,acc16
      00A437 1E               [ 2]  410 	ldw x,(x) ; command index  
      00A438 01 CD            [ 2]  411 	cpw x,(CMDX,sp)
      00A43A 84 45            [ 1]  412 	jreq 2$
      00A43C CE 00            [ 2]  413 	ldw x,(LINK,sp)
      00A43E 1C               [ 2]  414 	ldw x,(x) 
      00A43F 72 FB 05         [ 2]  415 	subw x,#2  
      00A442 CF 00            [ 1]  416 	jrne 1$
      00A444 1C 5B            [ 2]  417 	jra 9$
      00A446 06 81            [ 2]  418 2$: ldw x,(LINK,sp)
      00A448 1C 00 02         [ 2]  419 	addw x,#2 	
      0029F2                        420 9$:	_drop VSIZE
      00A448 52 08            [ 2]    1     addw sp,#VSIZE 
      00A44A CE               [ 4]  421 	ret
                                    422 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
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
      002A00                         27 	.bndry 128 ; align on FLASH block.
                                     28 ; space for user application  
      002A00                         29 app_space::
      00A44B 00 1C                   30 app_sign: .word 0 ; .ascii "BC"  ; signature 
      00A44D C3 00                   31 app_size: .word 0 ; 31 
      002A04                         32 app: 
                                     33 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     34 ;;  BASIC code demo 'BLINK.BAS' 
                                     35 ;; 10 do btogl $500a,32 pause 250 until qkey bres $500a,32 end 
                                     36 ;; byte code generated by compiler.
                                     37 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     38 ;.byte 0,10,31,128,0,38,128,0,20,132,80,10,9,132,0,32,128
                                     39 ;.byte 0,100,132,0,250,128,0,182,129,0,132,128,0,46
                                     40 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   7 ABS        001F5C R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   7 ADCON      001F52 R
    ADCON_ID=  000002     |   7 ADCREAD    001F46 R   |     ADCREAD_=  000004 
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
  7 AND        001F3E R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  7 ASC        001F36 R   |     ASC_IDX =  000008     |     ATTRIB  =  000002 
    AUTORUN_=  004000     |   7 AWU        001F2E R   |   7 AWUHandl   000001 R
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
    BELL    =  000007     |     BINARY  =  000001     |   7 BIT        001F26 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000C 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   7 BRES       001F1D R   |     BRES_IDX=  00000E 
    BS      =  000008     |     BSAVE   =  000001     |   7 BSET       001F14 R
    BSET_IDX=  000010     |     BSIZE   =  000006     |   7 BTEST      001F0A R
    BTEST_ID=  000012     |   7 BTOGL      001F00 R   |     BTOGL_ID=  000014 
    BTW     =  000001     |   7 BYE        001EF8 R   |     BYE_IDX =  000016 
    C       =  000001     |     CAN     =  000018     |   7 CANT_DO    001552 R
    CAN_DGR =  005426     |     CAN_FPSR=  005427     |     CAN_IER =  005425 
    CAN_MCR =  005420     |     CAN_MSR =  005421     |     CAN_P0  =  005428 
    CAN_P1  =  005429     |     CAN_P2  =  00542A     |     CAN_P3  =  00542B 
    CAN_P4  =  00542C     |     CAN_P5  =  00542D     |     CAN_P6  =  00542E 
    CAN_P7  =  00542F     |     CAN_P8  =  005430     |     CAN_P9  =  005431 
    CAN_PA  =  005432     |     CAN_PB  =  005433     |     CAN_PC  =  005434 
    CAN_PD  =  005435     |     CAN_PE  =  005436     |     CAN_PF  =  005437 
    CAN_RFR =  005424     |     CAN_TPR =  005423     |     CAN_TSR =  005422 
    CCOMMA  =  000001     |     CC_C    =  000000     |     CC_H    =  000004 
    CC_I0   =  000003     |     CC_I1   =  000005     |     CC_N    =  000002 
    CC_V    =  000007     |     CC_Z    =  000001     |     CELL_SIZ=  000002 
    CFG_GCR =  007F60     |     CFG_GCR_=  000001     |     CFG_GCR_=  000000 
  7 CHAR       001EEF R   |     CHAR_IDX=  000018     |     CLKOPT  =  004807 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]

Symbol Table

    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
    CLK_ECKR=  000001     |     CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0 
    CLK_ICKR=  000002     |     CLK_ICKR=  000000     |     CLK_ICKR=  000001 
    CLK_ICKR=  000003     |     CLK_ICKR=  000004     |     CLK_ICKR=  000005 
    CLK_PCKE=  0050C7     |     CLK_PCKE=  000000     |     CLK_PCKE=  000001 
    CLK_PCKE=  000007     |     CLK_PCKE=  000005     |     CLK_PCKE=  000006 
    CLK_PCKE=  000004     |     CLK_PCKE=  000002     |     CLK_PCKE=  000003 
    CLK_PCKE=  0050CA     |     CLK_PCKE=  000003     |     CLK_PCKE=  000002 
    CLK_PCKE=  000007     |     CLK_SWCR=  0050C5     |     CLK_SWCR=  000000 
    CLK_SWCR=  000001     |     CLK_SWCR=  000002     |     CLK_SWCR=  000003 
    CLK_SWIM=  0050CD     |     CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4 
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |     CMDX    =  000001 
    CMD_END =  000002     |     CNT     =  000006     |     CNTR    =  000003 
    COMMA   =  00002C     |     CPOS    =  000003     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   7 CRH        001EE7 R
    CRH_IDX =  00001A     |   7 CRL        001EDF R   |     CRL_IDX =  00001C 
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
    CURR    =  000002     |     CVAR    =  000007     |     CX_BPTR =  000001 
    CX_CNT  =  000004     |     CX_IN   =  000003     |   7 DATA       001ED6 R
  7 DATALN     001ECB R   |     DATALN_I=  000020     |     DATA_IDX=  00001E 
    DBG_A   =  000005     |     DBG_CC  =  000006     |     DBG_X   =  000003 
    DBG_Y   =  000001     |     DBL     =  000003     |     DBLDIVDN=  000006 
    DBLHI   =  000001     |     DBLLO   =  000003     |     DBL_SIZE=  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   7 DDR        001EC3 R   |     DDR_IDX =  000022 
    DEBUG   =  000000     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
    DEBUG_PR=  000001     |   7 DEC        001EBB R   |     DEC_IDX =  000024 
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
    DIVDNDHI=  00000B     |     DIVDNDLO=  00000D     |     DIVISOR =  000001 
    DIVISR  =  000007     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   7 DO         001EB4 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]

Symbol Table

  7 DREAD      001EAA R   |     DREAD_ID=  000028     |   7 DWRITE     001E9F R
    DWRITE_I=  00002A     |   7 EDIT       001E96 R   |     EDIT_IDX=  00002C 
  7 EEPROM     001E8B R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002E     |     EEPROM_S=  000800     |     EM      =  000019 
  7 END        001E83 R   |     END_IDX =  000030     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   7 ERASE      001E79 R
    ERASE_ID=  000032     |     ERR_BAD_=  00000A     |     ERR_BUF_=  00000F 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FAUTORUN=  000006     |     FBREAK  =  000004 
    FCOMP   =  000005     |   7 FCPU       001E70 R   |     FCPU_IDX=  000034 
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
    FLSI    =  01F400     |   7 FOR        001E68 R   |     FOR_IDX =  000038 
  7 FREE       001E5F R   |     FREE_IDX=  00009A     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   7 GOSUB      001E55 R
    GOSUB_ID=  00003A     |   7 GOTO       001E4C R   |     GOTO_IDX=  00003C 
  7 GPIO       001E43 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_IDX=  00003E     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   7 HEX        001E3B R   |     HEX_IDX =  000040 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]

Symbol Table

    I2C_READ=  000001     |     I2C_SR1 =  005217     |     I2C_SR1_=  000003 
    I2C_SR1_=  000001     |     I2C_SR1_=  000002     |     I2C_SR1_=  000006 
    I2C_SR1_=  000000     |     I2C_SR1_=  000004     |     I2C_SR1_=  000007 
    I2C_SR2 =  005218     |     I2C_SR2_=  000002     |     I2C_SR2_=  000001 
    I2C_SR2_=  000000     |     I2C_SR2_=  000003     |     I2C_SR2_=  000005 
    I2C_SR3 =  005219     |     I2C_SR3_=  000001     |     I2C_SR3_=  000007 
    I2C_SR3_=  000004     |     I2C_SR3_=  000000     |     I2C_SR3_=  000002 
    I2C_TRIS=  00521D     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   7 IDR        001E33 R
    IDR_IDX =  000042     |   7 IF         001E2C R   |     IF_IDX  =  000044 
    IN      =  000005     |     INCR    =  000001     |     INP     =  000000 
  7 INPUT      001E22 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  008050     |     INT_VECT=  00804C     |     INT_VECT=  00805C 
    INT_VECT=  008058     |   7 INVERT     001E17 R   |     INVERT_I=  000048 
    INW     =  000009     |     IPOS    =  000001     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   7 IWDGEN     001E0C R   |     IWDGEN_I=  00004A 
  7 IWDGREF    001E00 R   |     IWDGREF_=  00004C     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  7 KEY        001DF8 R   |     KEY_END =  000083     |     KEY_IDX =  00004E 
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  7 LET        001DF0 R   |     LET_IDX =  000050     |     LF      =  00000A 
    LIMIT   =  000001     |     LINENO  =  000005     |     LINK    =  000003 
  7 LIST       001DE7 R   |     LIST_IDX=  000052     |     LL      =  000001 
    LLEN    =  000007     |     LL_HB   =  000001     |     LN_PTR  =  000005 
  7 LOG        001DDF R   |     LOG_IDX =  000054     |   7 LSHIFT     001DD4 R
    LSHIFT_I=  000056     |     MAJOR   =  000002     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
  7 MULDIV     001DC9 R   |     MULDIV_I=  000058     |     MULOP   =  000003 
    N1      =  000001     |     N2      =  000003     |     NAFR    =  004804 
    NAK     =  000015     |     NCLKOPT =  004808     |     NEG     =  000001 
  7 NEW        001DC1 R   |     NEW_IDX =  00005C     |   7 NEXT       001DB8 R
    NEXT_IDX=  00005A     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]

Symbol Table

    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  7 NOT        001DB0 R   |     NOT_IDX =  00005E     |   7 NOT_SAVE   000F41 R
  7 NO_APP     001591 R   |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   7 NonHandl   000000 R   |   7 ODR        001DA8 R
    ODR_IDX =  000060     |     ONOFF   =  000003     |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   7 OR         001DA1 R   |     OR_IDX  =  000062 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     OVRWR   =  000004     |     PA      =  000000 
  7 PAD        001D99 R   |     PAD_IDX =  000064     |     PAD_SIZE=  000080 
  7 PAUSE      001D8F R   |     PAUSE_ID=  000066     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  7 PEEK       001D86 R   |     PEEK_IDX=  00006A     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   7 PINP       001D7D R   |     PINP_IDX=  00006C 
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   7 PMODE      001D73 R   |     PMODE_ID=  000068 
  7 POKE       001D6A R   |     POKE_IDX=  00006E     |     PORT    =  000003 
  7 POUT       001D61 R   |     POUT_IDX=  000070     |     PREV    =  000001 
  7 PRINT      001D57 R   |   7 PROG_ADD   000E1A R   |   7 PROG_SIZ   000E2C R
  7 PRTA       001D4E R   |     PRTA_IDX=  000074     |   7 PRTB       001D45 R
    PRTB_IDX=  000076     |   7 PRTC       001D3C R   |     PRTC_IDX=  000078 
  7 PRTD       001D33 R   |     PRTD_IDX=  00007A     |   7 PRTE       001D2A R
    PRTE_IDX=  00007C     |   7 PRTF       001D21 R   |     PRTF_IDX=  00007E 
  7 PRTG       001D18 R   |     PRTG_IDX=  000080     |   7 PRTH       001D0F R
    PRTH_IDX=  000082     |   7 PRTI       001D06 R   |     PRTI_IDX=  000084 
    PRT_IDX =  000072     |     PSTR    =  000003     |   7 QKEY       001CFD R
    QKEY_IDX=  000086     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |     RBT_IDX =  00008A     |   7 READ       001CF4 R
    READ_IDX=  000088     |   7 REBOOT     001CE9 R   |     REG     =  000001 
    REGA    =  000001     |     REGX    =  000003     |     REGY    =  000005 
    RELOP   =  000003     |   7 REMARK     001CDE R   |     REM_IDX =  00008C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]

Symbol Table

  7 RESTORE    001CD2 R   |     REST_IDX=  00008E     |     RETL1   =  000001 
  7 RETURN     001CC7 R   |     RET_ADDR=  000003     |     RET_IDX =  000090 
    RET_INW =  000005     |   7 RND        001CBF R   |     RND_IDX =  000092 
    ROP     =  004800     |     RS      =  00001E     |   7 RSHIFT     001CB4 R
    RSHIFT_I=  000094     |     RST_SR  =  0050B3     |   7 RUN        001CAC R
  7 RUNNING    000569 R   |     RUN_IDX =  000096     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |   7 SAVE       001CA3 R   |     SAVEB   =  000002 
    SAVE_IDX=  000036     |     SDIVSR  =  000005     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   7 SHOW       001C9A R
    SHOW_IDX=  000098     |     SI      =  00000F     |     SIGN    =  000001 
  7 SIGNATUR   001550 R   |   7 SIZE       001C91 R   |     SIZE_IDX=  0000C4 
    SKIP    =  000005     |   7 SLEEP      001C87 R   |     SLEEP_ID=  00009C 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  7 SPIEN      001C7D R   |     SPIEN_ID=  0000A0     |   7 SPIRD      001C73 R
    SPIRD_ID=  00009E     |   7 SPISEL     001C68 R   |     SPISEL_I=  0000A2 
  7 SPIWR      001C5E R   |     SPIWR_ID=  0000A4     |     SPI_CR1 =  005200 
    SPI_CR1_=  000003     |     SPI_CR1_=  000000     |     SPI_CR1_=  000001 
    SPI_CR1_=  000007     |     SPI_CR1_=  000002     |     SPI_CR1_=  000006 
    SPI_CR2 =  005201     |     SPI_CR2_=  000007     |     SPI_CR2_=  000006 
    SPI_CR2_=  000005     |     SPI_CR2_=  000004     |     SPI_CR2_=  000002 
    SPI_CR2_=  000000     |     SPI_CR2_=  000001     |     SPI_CRCP=  005205 
    SPI_CS_B=  000005     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_SR_B=  000007 
    SPI_SR_C=  000004     |     SPI_SR_M=  000005     |     SPI_SR_O=  000006 
    SPI_SR_R=  000000     |     SPI_SR_T=  000001     |     SPI_SR_W=  000003 
    SPI_TXCR=  005207     |     SQUOT   =  000006     |     SRC     =  000003 
    STACK_EM=  0017FF     |     STACK_SI=  0000A0     |   7 STEP       001C55 R
    STEP_IDX=  0000A6     |   7 STOP       001C4C R   |     STOP_IDX=  0000A8 
    STR     =  000003     |   7 STR_BYTE   000E3B R   |     STX     =  000002 
    SUB     =  00001A     |     SUP     =  000084     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   7 TICKS      001C42 R
    TICKS_ID=  0000AA     |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_CCR=  005265     |     TIM1_CCR=  005266     |     TIM1_CCR=  005267 
    TIM1_CCR=  005268     |     TIM1_CCR=  005269     |     TIM1_CCR=  00526A 
    TIM1_CCR=  00526B     |     TIM1_CCR=  00526C     |     TIM1_CNT=  00525E 
    TIM1_CNT=  00525F     |     TIM1_CR1=  005250     |     TIM1_CR2=  005251 
    TIM1_CR2=  000000     |     TIM1_CR2=  000002     |     TIM1_CR2=  000004 
    TIM1_CR2=  000005     |     TIM1_CR2=  000006     |     TIM1_DTR=  00526E 
    TIM1_EGR=  005257     |     TIM1_EGR=  000007     |     TIM1_EGR=  000001 
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
    TIM2_CCR=  005314     |     TIM2_CLK=  00F424     |     TIM2_CNT=  00530A 
    TIM2_CNT=  00530B     |     TIM2_CR1=  005300     |     TIM2_CR1=  000007 
    TIM2_CR1=  000000     |     TIM2_CR1=  000003     |     TIM2_CR1=  000001 
    TIM2_CR1=  000002     |     TIM2_EGR=  005304     |     TIM2_EGR=  000001 
    TIM2_EGR=  000002     |     TIM2_EGR=  000003     |     TIM2_EGR=  000006 
    TIM2_EGR=  000000     |     TIM2_IER=  005301     |     TIM2_PSC=  00530C 
    TIM2_SR1=  005302     |     TIM2_SR2=  005303     |     TIM3_ARR=  00532B 
    TIM3_ARR=  00532C     |     TIM3_CCE=  005327     |     TIM3_CCE=  000000 
    TIM3_CCE=  000001     |     TIM3_CCE=  000004     |     TIM3_CCE=  000005 
    TIM3_CCE=  000000     |     TIM3_CCE=  000001     |     TIM3_CCM=  005325 
    TIM3_CCM=  005326     |     TIM3_CCM=  000000     |     TIM3_CCM=  000004 
    TIM3_CCM=  000003     |     TIM3_CCR=  00532D     |     TIM3_CCR=  00532E 
    TIM3_CCR=  00532F     |     TIM3_CCR=  005330     |     TIM3_CNT=  005328 
    TIM3_CNT=  005329     |     TIM3_CR1=  005320     |     TIM3_CR1=  000007 
    TIM3_CR1=  000000     |     TIM3_CR1=  000003     |     TIM3_CR1=  000001 
    TIM3_CR1=  000002     |     TIM3_EGR=  005324     |     TIM3_IER=  005321 
    TIM3_PSC=  00532A     |     TIM3_SR1=  005322     |     TIM3_SR2=  005323 
    TIM4_ARR=  005346     |     TIM4_CNT=  005344     |     TIM4_CR1=  005340 
    TIM4_CR1=  000007     |     TIM4_CR1=  000000     |     TIM4_CR1=  000003 
    TIM4_CR1=  000001     |     TIM4_CR1=  000002     |     TIM4_EGR=  005343 
    TIM4_EGR=  000000     |     TIM4_IER=  005341     |     TIM4_IER=  000000 
    TIM4_PSC=  005345     |     TIM4_PSC=  000000     |     TIM4_PSC=  000007 
    TIM4_PSC=  000004     |     TIM4_PSC=  000001     |     TIM4_PSC=  000005 
    TIM4_PSC=  000002     |     TIM4_PSC=  000006     |     TIM4_PSC=  000003 
    TIM4_PSC=  000000     |     TIM4_PSC=  000001     |     TIM4_PSC=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   7 TIMEOUT    001C36 R
  7 TIMER      001C2C R   |     TIMER_ID=  0000AC     |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_ARRAY=  000006     |     TK_CFUNC=  000082 
    TK_CHAR =  000003     |     TK_CMD  =  000080     |     TK_COLON=  00000B 
    TK_COMMA=  000009     |     TK_CONST=  000083     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000081 
    TK_INTGR=  000084     |     TK_LE   =  000036     |     TK_LPARE=  000007 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  000002     |     TK_RPARE=  000008 
    TK_SHARP=  00000A     |     TK_VAR  =  000085     |     TMROUT_I=  0000AE 
  7 TO         001C25 R   |   7 TONE       001C1C R   |     TONE_IDX=  0000B2 
    TO_IDX  =  0000B0     |   7 Timer4Up   00003C R   |     U1      =  000001 
    U8      =  000003     |     UART1   =  000000     |     UART1_BA=  005230 
    UART1_BR=  005232     |     UART1_BR=  005233     |     UART1_CR=  005234 
    UART1_CR=  005235     |     UART1_CR=  005236     |     UART1_CR=  005237 
    UART1_CR=  005238     |     UART1_DR=  005231     |     UART1_GT=  005239 
    UART1_PO=  000000     |     UART1_PS=  00523A     |     UART1_RX=  000004 
    UART1_SR=  005230     |     UART1_TX=  000005     |     UART2   =  000001 
    UART3   =  000002     |     UART3_BA=  005240     |     UART3_BR=  005242 
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
    UBC     =  004801     |   7 UBOUND     001C11 R   |     UBOUND_I=  0000B4 
  7 UBTN_Han   000075 R   |   7 UFLASH     001C06 R   |     UFLASH_I=  0000B6 
  7 UNTIL      001BFC R   |     UNTIL_ID=  0000B8     |     US      =  00001F 
  7 USER_ABO   000088 R   |   7 USR        001BF4 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     USR_IDX =  0000BA 
  7 Uart1RxH   00000F R   |   7 UserButt   000051 R   |     VAR_ADDR=  000006 
    VSISE   =  000003     |     VSIZ    =  000002     |     VSIZE   =  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]

Symbol Table

    VT      =  00000B     |   7 WAIT       001BEB R   |     WAIT_IDX=  0000BC 
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   7 WORDS      001BE1 R
    WORDS_ID=  0000BE     |   7 WRITE      001BD7 R   |     WRITE_ID=  0000C0 
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XFIRST  =  000001 
    XMASK   =  000001     |     XOFF    =  000013     |     XON     =  000011 
  7 XOR        001BCF R   |     XOR_IDX =  0000C2     |     XREG    =  000003 
    XSAVE   =  000001     |     YSAVE   =  000004     |   7 abs        0016FF R
  1 acc16      00000C GR  |   1 acc24      00000B GR  |   1 acc8       00000D GR
  7 accept_c   0022C8 R   |   7 add_char   0029A3 R   |   7 add_spac   0027C7 R
  7 analog_r   001357 R   |   7 app        002A04 R   |   7 app_sign   002A00 R
  7 app_size   002A02 R   |   7 app_spac   002A00 GR  |   7 arduino_   0017F5 R
  7 arg_list   000BE9 R   |   1 array_si   00001E R   |   7 ascii      0015F0 R
  7 at_tst     002635 R   |   7 atoi24     0009A3 GR  |   7 atoi_exi   000A09 R
  7 awu        0016B0 R   |   7 awu02      0016BA R   |   7 bad_port   001651 R
  1 base       00000A GR  |   1 basicptr   000004 GR  |   7 beep       0012E4 R
  7 beep_1kh   0012CE GR  |   7 bin_exit   0024FB R   |   7 bit_and    001713 R
  7 bit_or     00172B R   |   7 bit_rese   0010A9 R   |   7 bit_set    001099 R
  7 bit_test   0010CA R   |   7 bit_togg   0010BA R   |   7 bit_xor    001743 R
  7 bitmask    001961 R   |   7 bkslsh_t   0025E2 R   |   7 bksp       002066 R
  7 block_er   0001BC R   |   7 break_po   001424 R   |   7 bye        001689 R
  7 char       0015DE R   |   7 clear_ba   0005A9 R   |   7 clear_va   000409 R
  7 clock_in   0000A3 R   |   7 cmd_end    0012C7 R   |   7 cmd_line   0007C8 R
  7 cmd_name   0029C3 R   |   7 cmd_size   000DED R   |   7 code_add   001F62 GR
  7 cold_sta   000486 R   |   7 colon_ts   002609 R   |   7 comma_ts   002614 R
  7 comp_msg   000720 R   |   7 compile    00273A GR  |   7 const_cr   001A15 R
  7 const_cr   001A1B R   |   7 const_dd   001A0F R   |   7 const_ee   001A2D R
  7 const_id   001A09 R   |   7 const_in   001A27 R   |   7 const_od   001A03 R
  7 const_ou   001A21 R   |   7 const_po   0019CD R   |   7 const_po   0019D3 R
  7 const_po   0019D9 R   |   7 const_po   0019DF R   |   7 const_po   0019E5 R
  7 const_po   0019EB R   |   7 const_po   0019F1 R   |   7 const_po   0019F7 R
  7 const_po   0019FD R   |   7 convert_   002472 R   |   7 convert_   00202A R
  7 copy_com   00266A R   |   1 count      000003 GR  |   7 cp_loop    000B98 R
  7 cpy_cmd_   0027B2 R   |   7 cpy_quot   0027EB R   |   7 create_g   00239C R
  7 cs_high    001BC2 R   |   7 cstk_pro   000DA3 R   |   7 dash_tst   00262A R
  7 data       001A33 R   |   1 data_len   000009 R   |   7 data_lin   001A39 R
  1 data_ofs   000008 R   |   1 data_ptr   000006 R   |   7 data_sea   001A7A R
  7 dbl_sign   000AF2 R   |   7 dec_base   000DCF R   |   7 decomp_l   00289C R
  7 decompil   002855 GR  |   7 del_line   00236F R   |   7 delete_l   002153 R
  7 delete_n   002076 R   |   7 delete_u   002118 R   |   7 digital_   00138B R
  7 digital_   0013BB R   |   7 div32_16   000AFC R   |   7 divide     000B53 R
  7 divu24_8   000912 R   |   7 dneg       000AE7 R   |   7 do_loop    00198A R
  7 do_progr   0001AF R   |   7 edit       000F14 R   |   7 enable_i   00190B R
  7 eql_tst    0026BF R   |   7 equal      0029B6 R   |   7 erase      001483 R
  7 erase_ex   0001DB R   |   7 erase_fl   0001D1 R   |   7 err_bad_   00068B R
  7 err_buf_   000701 R   |   7 err_cmd_   00064F R   |   7 err_div0   000614 R
  7 err_dupl   000669 R   |   7 err_math   0005FB R   |   7 err_mem_   0005E0 R
  7 err_msg    0005C0 R   |   7 err_no_a   000697 R   |   7 err_no_d   0006CA R
  7 err_no_f   0006EE R   |   7 err_no_l   000623 R   |   7 err_no_p   0006DA R
  7 err_not_   00067A R   |   7 err_run_   000639 R   |   7 err_synt   0005ED R
  7 escaped    002487 GR  |   7 expect     000BD7 R   |   7 expr_exi   000D2E R
  7 expressi   000CE8 R   |   7 factor     000C39 R   |   1 farptr     000016 R
  7 fcpu       00178D R   |   7 final_te   0022C1 R   |   7 first_li   000EC1 R
  1 flags      000020 GR  |   7 for        001125 R   |   7 free       000DD4 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]

Symbol Table

  3 free_ram   000080 R   |   7 func_arg   000BE4 R   |   7 func_not   0018FE R
  7 ge         0029B8 R   |   7 get_arra   000C14 R   |   7 get_cmd_   002834 R
  7 get_esca   002036 R   |   7 get_targ   0011EF R   |   7 get_tick   0016F9 R
  7 get_toke   00257B GR  |   7 getc       0002D1 GR  |   7 gosub      001230 R
  7 goto       001215 R   |   7 gpio       00162C R   |   7 gt         0029B4 R
  7 gt_tst     0026CA R   |   7 hex_base   000DCA R   |   7 hex_dump   00035A R
  7 if         001111 R   |   1 in         000001 GR  |   1 in.saved   000002 GR
  1 in.w       000000 GR  |   7 incr_far   001467 R   |   7 input_ex   00106B R
  7 input_lo   001000 R   |   7 input_va   000FFE R   |   7 insert_c   0020D5 R
  7 insert_l   0023C8 R   |   7 insert_l   002437 R   |   7 interp_l   000809 R
  7 interpre   0007E4 R   |   7 invert     00197B R   |   7 is_alnum   000437 GR
  7 is_alpha   00041D GR  |   7 is_digit   00042E GR  |   7 itoa       0008A7 GR
  7 itoa_loo   0008CC R   |   7 jp_to_ta   001223 R   |   7 key        001617 R
  7 kw_loop    002517 R   |   7 kword_di   001F5A GR  |   7 kword_en   001BCD R
  7 le         0029BD R   |   7 leading_   001951 R   |   7 let        000E4C GR
  7 let_arra   000E5A R   |   7 let_var    000E5D R   |   7 lines_sk   000EC4 R
  7 list       000E7F R   |   7 list_exi   000F06 R   |   7 list_loo   000EE4 R
  7 log2       001946 R   |   7 logical_   0018F4 R   |   7 long_div   000ACF R
  7 loop_bac   0011D2 R   |   1 loop_dep   00001D R   |   7 loop_don   0011E7 R
  7 lshift     00175B R   |   7 lt         0029BB R   |   7 lt_tst     0026F3 R
  7 modulo     000B69 R   |   7 move       0003C5 GR  |   7 move_dow   0003E4 R
  7 move_era   00013E R   |   7 move_exi   000405 R   |   7 move_lef   0020AD R
  7 move_loo   0003E9 R   |   7 move_prg   00017E R   |   7 move_rig   0020BB R
  7 move_up    0003D6 R   |   7 mul_char   0029A5 R   |   7 muldiv     000B6E R
  7 multiply   000A9A R   |   7 mulu24_8   00093A R   |   7 nbr_tst    0025AE R
  7 ne         0029C0 R   |   7 neg_acc2   000974 R   |   7 new        001442 R
  7 next       0011A5 R   |   7 next_lin   0007EC R   |   7 next_tok   000830 GR
  7 no_match   000BAA R   |   7 other      00271C R   |   7 overwrit   0022ED R
  5 pad        0016E0 GR  |   7 pad_ref    001BC7 R   |   7 parse_bi   0024D9 R
  7 parse_in   00248F R   |   7 parse_ke   002516 R   |   7 parse_qu   00243A R
  7 pause      00169D R   |   7 pause02    0016A7 R   |   7 peek       001100 R
  7 pin_mode   001799 R   |   7 plus_tst   002693 R   |   7 poke       0010F1 R
  7 power_ad   00131B R   |   7 prcnt_ts   0026B4 R   |   7 print      000F78 R
  7 print_ex   000FD2 R   |   7 print_he   002322 GR  |   7 print_in   00088B R
  7 printxy    000A0D R   |   7 prog_siz   000E77 R   |   7 program_   000158 R
  7 program_   00017E R   |   7 prt_basi   000F58 R   |   7 prt_loop   000F7C R
  7 prt_tok    0002EC R   |   7 prti24     00089B R   |   1 ptr16      000017 GR
  1 ptr8       000018 R   |   7 putc       0002C1 GR  |   7 puts       00205C GR
  7 qgetc      0002CA GR  |   7 qkey       00161F GR  |   7 qmark_ts   002640 R
  7 qsign      0014E8 R   |   7 random     001815 R   |   7 read       001AB6 R
  7 read01     001AB8 R   |   7 readln     002161 GR  |   7 readln_l   00216E R
  7 readln_q   00230A R   |   7 refresh_   001941 R   |   7 rel_exit   000D86 R
  7 relation   000D31 R   |   7 relop_st   0029A8 R   |   7 remark     00106E GR
  7 reset_co   000F7A R   |   7 rest_con   000FEE R   |   7 restore    001A67 R
  7 return     001250 R   |   7 right_al   0027D9 GR  |   7 row_alig   00144C R
  7 row_eras   000111 R   |   7 row_eras   00013E R   |   7 row_loop   00033D R
  7 rparnt_t   0025FE R   |   7 rshift     001774 R   |   3 rsign      00007C R
  3 rsize      00007E R   |   7 rt_msg     00070E R   |   7 run        00126E R
  7 run_app    000528 R   |   7 run_it     0012A0 R   |   1 rx1_head   00002A R
  1 rx1_queu   000022 R   |   1 rx1_tail   00002B R   |   7 save_app   0014EF R
  7 save_con   000FDE R   |   7 scan_blo   001475 R   |   7 search_d   000B8A GR
  7 search_e   000BD4 R   |   7 search_l   002344 GR  |   7 search_l   002353 R
  7 search_n   000B8E R   |   1 seedx      000012 R   |   1 seedy      000014 R
  7 select_p   0017E5 R   |   7 send_esc   002084 R   |   7 send_par   00208F R
  7 set_time   0018E2 R   |   7 sharp_ts   00261F R   |   7 show       000D89 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]

Symbol Table

  7 show_row   00032B R   |   7 single_c   00299E R   |   7 skip       002568 R
  7 slash_ts   0026A9 R   |   7 sleep      001692 R   |   7 software   000440 R
  7 spaces     0020C9 GR  |   7 spi_clea   001B5B R   |   7 spi_disa   001B43 R
  7 spi_enab   001B10 R   |   7 spi_rcv_   001B7D R   |   7 spi_read   001BA8 R
  7 spi_sele   001BB0 R   |   7 spi_send   001B67 R   |   7 spi_writ   001B88 R
  5 stack_fu   001760 GR  |   5 stack_un   001800 R   |   7 star_tst   00269E R
  7 step       00117E R   |   7 stop       0013F6 R   |   7 store_lo   001192 R
  7 str_matc   000BB7 R   |   7 str_tst    00259E R   |   7 strcmp     0003A4 R
  7 strcpy     0003B5 GR  |   7 strlen     000399 GR  |   7 syntax_e   000741 GR
  1 tab_widt   000021 GR  |   7 tb_error   000743 GR  |   7 term       000C96 R
  7 term01     000C9E R   |   7 term_exi   000CE5 R   |   5 tib        001690 GR
  7 tick_tst   002658 R   |   1 ticks      00000E R   |   7 timeout    0018F1 R
  1 timer      000010 GR  |   7 timer2_i   0000B9 R   |   7 timer4_i   0000C6 R
  7 tk_id      000731 R   |   7 to         00114E R   |   7 to_eepro   0001A7 R
  7 to_flash   0001AC R   |   7 to_hex_c   002339 GR  |   7 to_upper   000997 GR
  7 token_ch   002733 R   |   7 token_ex   002737 R   |   7 token_ms   000323 R
  7 tone       0012D7 R   |   7 try_next   001AA6 R   |   1 txtbgn     000019 GR
  1 txtend     00001B GR  |   7 uart1_ge   0002D1 GR  |   7 uart1_in   00027C R
  7 uart1_pu   0002C1 GR  |   7 uart1_qg   0002CA GR  |   7 uart1_se   00028C R
  7 ubound     000E42 R   |   7 udiv32_1   000ABD R   |   7 uflash     001656 R
  7 umstar     000A60 R   |   7 unlock_e   0000DB R   |   7 unlock_f   0000F6 R
  7 until      00199F R   |   7 user_int   000064 R   |   7 usr        00166C R
  7 var_name   00282C GR  |   1 vars       00002C GR  |   7 wait       001074 R
  7 warm_ini   00058B R   |   7 warm_sta   0007C5 R   |   7 words      00187C R
  7 words_co   0018CC R   |   7 write      0015A7 R   |   7 write_bl   000257 R
  7 write_by   0001DD R   |   7 write_ee   000219 R   |   7 write_ex   000252 R
  7 write_fl   000203 R   |   7 write_ro   000198 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     60   flags    0
   2 BTXT       size      0   flags    8
   3 BTXT0      size      4   flags    8
   4 SSEG       size      0   flags    8
   5 SSEG1      size    170   flags    8
   6 HOME       size     80   flags    0
   7 CODE       size   2A04   flags    0

