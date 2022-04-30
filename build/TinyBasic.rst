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
      008000 82 00 84 EF             97     int cold_start			; RESET vector 
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
      008024 82 00 80 D5            110 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
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
      008064 82 00 80 C0            126 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
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
                                    161 ; CTRL-C (ASCII 3)
                                    162 ; cancel program execution
                                    163 ; and fall back to command line
                                    164 ;--------------------------
      00808F                        165 Uart1RxHandler: ; console receive char 
      00808F 72 0B 52 30 2B   [ 2]  166 	btjf UART1_SR,#UART_SR_RXNE,5$
      008094 C6 52 31         [ 1]  167 	ld a,UART1_DR 
      008097 A1 03            [ 1]  168 	cp a,#CTRL_C 
      008099 26 06            [ 1]  169 	jrne 2$
      00809B CD 83 32         [ 4]  170 	call putc 
      00809E CC 80 E8         [ 2]  171 	jp user_interrupted
      0080A1                        172 2$:
      0080A1 A1 18            [ 1]  173 	cp a,#CAN ; CTRL_X 
      0080A3 26 03            [ 1]  174 	jrne 3$
      0080A5 CC 84 EF         [ 2]  175 	jp cold_start 	
      0080A8 AE 00 23         [ 2]  176 3$:	ldw x,#rx1_queue  
      0080AB 88               [ 1]  177 	push a 
      0080AC 9F               [ 1]  178 	ld a,xl 
      0080AD CB 00 2C         [ 1]  179 	add a,rx1_tail 
      0080B0 97               [ 1]  180 	ld xl,a
      0080B1 84               [ 1]  181 	pop a  
      0080B2 F7               [ 1]  182 	ld (x),a
      0080B3 72 5C 00 2C      [ 1]  183 	inc rx1_tail 
      0080B7 A6 07            [ 1]  184 	ld a,#RX_QUEUE_SIZE-1
      0080B9 C4 00 2C         [ 1]  185 	and a,rx1_tail 
      0080BC C7 00 2C         [ 1]  186 	ld rx1_tail,a  
      0080BF                        187 5$:
      0080BF 80               [11]  188 	iret 
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
      0080C0                        207 Timer4UpdateHandler:
      0080C0 72 5F 53 42      [ 1]  208 	clr TIM4_SR 
      0080C4 CE 00 0F         [ 2]  209 	ldw x,ticks
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080C7 5C               [ 1]  210 	incw x
      0080C8 CF 00 0F         [ 2]  211 	ldw ticks,x 
      0080CB CE 00 11         [ 2]  212 	ldw x,timer
                                    213 ;	tnzw x 
      0080CE 27 04            [ 1]  214 	jreq 1$
      0080D0 5A               [ 2]  215 	decw x 
      0080D1 CF 00 11         [ 2]  216 	ldw timer,x 
      0080D4                        217 1$:	
      0080D4 80               [11]  218 	iret 
                                    219 
                                    220 
                                    221 ;------------------------------------
                                    222 ; Triggered by pressing USER UserButton 
                                    223 ; on NUCLEO card.
                                    224 ; This is used to abort a progam lock 
                                    225 ; in infinite loop. 
                                    226 ;------------------------------------
      0080D5                        227 UserButtonHandler:
                                    228 ; wait button release
      0080D5 5F               [ 1]  229 	clrw x
      0080D6 5A               [ 2]  230 1$: decw x 
      0080D7 26 FD            [ 1]  231 	jrne 1$
      0080D9 72 09 50 15 F8   [ 2]  232 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    233 ; if MCU suspended by SLEEP resume program
      0080DE 72 07 00 21 05   [ 2]  234     btjf flags,#FSLEEP,2$
      0080E3 72 17 00 21      [ 1]  235 	bres flags,#FSLEEP 
      0080E7 80               [11]  236 	iret
      0080E8                        237 2$:	
      0080E8                        238 user_interrupted:
      0080E8 72 00 00 21 02   [ 2]  239     btjt flags,#FRUN,4$
      0080ED 20 0A            [ 2]  240 	jra UBTN_Handler_exit 
      0080EF                        241 4$:	; program interrupted by user 
      0080EF 72 11 00 21      [ 1]  242 	bres flags,#FRUN 
      0080F3 AE 81 0C         [ 2]  243 	ldw x,#USER_ABORT
      0080F6 CD A0 C3         [ 4]  244 	call puts 
      0080F9                        245 UBTN_Handler_exit:
      0080F9 AE 17 FF         [ 2]  246     ldw x,#STACK_EMPTY 
      0080FC 94               [ 1]  247     ldw sp,x
      0080FD 9A               [ 1]  248 	rim 
      0080FE CE 00 1A         [ 2]  249 	ldw x,txtbgn 
      008101 A3 AA 80         [ 2]  250 	cpw x,#app_space 
      008104 22 03            [ 1]  251 	jrugt 5$
      008106 CD 86 12         [ 4]  252 	call clear_basic 
      008109 CC 88 2C         [ 2]  253 5$:	jp warm_start
                                    254 
      00810C 0A 50 72 6F 67 72 61   255 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    256 
                                    257 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    258 ;    peripherals initialization
                                    259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    260 
                                    261 ;----------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    262 ; inialize MCU clock 
                                    263 ; input:
                                    264 ;   A 		source  HSI | 1 HSE 
                                    265 ;   XL      CLK_CKDIVR , clock divisor 
                                    266 ; output:
                                    267 ;   none 
                                    268 ;----------------------------------------
      008127                        269 clock_init:	
      008127 C1 50 C3         [ 1]  270 	cp a,CLK_CMSR 
      00812A 27 0C            [ 1]  271 	jreq 2$ ; no switching required 
                                    272 ; select clock source 
      00812C 72 12 50 C5      [ 1]  273 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008130 C7 50 C4         [ 1]  274 	ld CLK_SWR,a
      008133 C1 50 C3         [ 1]  275 1$:	cp a,CLK_CMSR
      008136 26 FB            [ 1]  276 	jrne 1$
      008138                        277 2$: 	
                                    278 ; HSI and cpu clock divisor 
      008138 9F               [ 1]  279 	ld a,xl 
      008139 C7 50 C6         [ 1]  280 	ld CLK_CKDIVR,a  
      00813C 81               [ 4]  281 	ret
                                    282 
                                    283 ;----------------------------------
                                    284 ; TIMER2 used as audio tone output 
                                    285 ; on port D:5.
                                    286 ; channel 1 configured as PWM mode 1 
                                    287 ;-----------------------------------  
                           00F424   288 TIM2_CLK_FREQ=62500
      00813D                        289 timer2_init:
      00813D 72 1A 50 C7      [ 1]  290 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008141 35 60 53 05      [ 1]  291  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008145 35 08 53 0C      [ 1]  292 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008149 81               [ 4]  293 	ret 
                                    294 
                                    295 ;---------------------------------
                                    296 ; TIM4 is configured to generate an 
                                    297 ; interrupt every millisecond 
                                    298 ;----------------------------------
      00814A                        299 timer4_init:
      00814A 72 18 50 C7      [ 1]  300 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00814E 35 07 53 45      [ 1]  301 	mov TIM4_PSCR,#7 ; prescale 128  
      008152 35 7D 53 46      [ 1]  302 	mov TIM4_ARR,#125 ; set for 1msec.
      008156 35 05 53 40      [ 1]  303 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00815A 72 10 53 41      [ 1]  304 	bset TIM4_IER,#TIM4_IER_UIE
      00815E 81               [ 4]  305 	ret
                                    306 
                                    307 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    308 ;  routines to write to FLASH, EEPROM 
                                    309 ;  and OPTION 
                                    310 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    311 
                                    312 ;----------------------------------
                                    313 ; unlock EEPROM/OPT for writing/erasing
                                    314 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    315 ; input:
                                    316 ;  none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    317 ; output:
                                    318 ;  none 
                                    319 ;----------------------------------
      00815F                        320 unlock_eeprom:
      00815F 72 06 50 5F 15   [ 2]  321 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008164 35 00 50 5B      [ 1]  322 	mov FLASH_CR2,#0 
      008168 35 FF 50 5C      [ 1]  323 	mov FLASH_NCR2,#0xFF 
      00816C 35 AE 50 64      [ 1]  324 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008170 35 56 50 64      [ 1]  325     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008174 72 07 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008179 81               [ 4]  327 9$:	ret
                                    328 
                                    329 ;----------------------------------
                                    330 ; unlock FLASH for writing/erasing
                                    331 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    332 ; input:
                                    333 ;  none
                                    334 ; output:
                                    335 ;  none
                                    336 ;----------------------------------
      00817A                        337 unlock_flash:
      00817A 72 02 50 5F 15   [ 2]  338 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      00817F 35 00 50 5B      [ 1]  339 	mov FLASH_CR2,#0 
      008183 35 FF 50 5C      [ 1]  340 	mov FLASH_NCR2,#0xFF 
      008187 35 56 50 62      [ 1]  341 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00818B 35 AE 50 62      [ 1]  342 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00818F 72 03 50 5F FB   [ 2]  343 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008194 81               [ 4]  344 9$:	ret
                                    345 
                                    346 ;----------------------------
                                    347 ; erase block code must be 
                                    348 ; executed from RAM
                                    349 ; input:
                                    350 ;-----------------------------
      008195                        351 row_erase:
      008195 35 20 50 5B      [ 1]  352 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      008199 35 DF 50 5C      [ 1]  353 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      00819D 4F               [ 1]  354 	clr a 
      00819E 90 5F            [ 1]  355 	clrw y 
      0081A0 91 A7 00 17      [ 1]  356 	ldf ([farptr],y),a
      0081A4 90 5C            [ 1]  357     incw y
      0081A6 91 A7 00 17      [ 1]  358 	ldf ([farptr],y),a
      0081AA 90 5C            [ 1]  359     incw y
      0081AC 91 A7 00 17      [ 1]  360 	ldf ([farptr],y),a
      0081B0 90 5C            [ 1]  361     incw y
      0081B2 91 A7 00 17      [ 1]  362 	ldf ([farptr],y),a
      0081B6 72 05 50 5F FB   [ 2]  363 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      0081BB 81               [ 4]  364 	ret
      0081BC                        365 row_erase_end:
                                    366 
                                    367 ; copy erase_start in RAM 
      0081BC                        368 move_erase_to_ram:
      0081BC AE 81 BC         [ 2]  369 	ldw x,#row_erase_end 
      0081BF 1D 81 95         [ 2]  370 	subw x,#row_erase
      0081C2 CF 00 0D         [ 2]  371 	ldw acc16,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      0081C5 AE 16 90         [ 2]  372 	ldw x,#tib 
      0081C8 90 AE 81 95      [ 2]  373 	ldw y,#row_erase 
      0081CC CD 84 36         [ 4]  374 	call move 
      0081CF 81               [ 4]  375 	ret 
                                    376 
                                    377 ;-----------------------------------
                                    378 ; block programming must be 
                                    379 ; executed from RAM 
                                    380 ; initial contidions: 
                                    381 ; 	memory unlocked
                                    382 ;   bit PRG set in 
                                    383 ; input:
                                    384 ;   x        data source 
                                    385 ;   farptr   row address destination 
                                    386 ; output:
                                    387 ;   none 
                                    388 ;----------------------------------
                           000001   389 	BCNT=1 
      0081D0                        390 program_row:
      0081D0 4B 80            [ 1]  391 	push #BLOCK_SIZE  
                                    392 ;enable block programming 
      0081D2 72 10 50 5B      [ 1]  393 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0081D6 72 11 50 5C      [ 1]  394 	bres FLASH_NCR2,#FLASH_CR2_PRG
                                    395 ;	mov FLASH_CR2,#(1<<FLASH_CR2_PRG) 
                                    396 ;	mov FLASH_NCR2,#~(1<<FLASH_CR2_PRG)
      0081DA 90 5F            [ 1]  397 	clrw y 
      0081DC F6               [ 1]  398 1$:	ld a,(x)
      0081DD 91 A7 00 17      [ 1]  399 	ldf ([farptr],y),a
      0081E1 5C               [ 1]  400 	incw x 
      0081E2 90 5C            [ 1]  401 	incw y 
      0081E4 0A 01            [ 1]  402 	dec (BCNT,sp)
      0081E6 26 F4            [ 1]  403 	jrne 1$
                                    404 ; wait EOP bit 
      0081E8 72 05 50 5F FB   [ 2]  405 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00016D                        406 	_drop 1 
      0081ED 5B 01            [ 2]    1     addw sp,#1 
      0081EF 81               [ 4]  407 	ret 
      0081F0                        408 program_row_end:
                                    409 
                                    410 ;-------------------------
                                    411 ; move program_row to RAM 
                                    412 ; at txtubound address 
                                    413 ;------------------------
      0081F0                        414 move_prg_to_ram:
      0081F0 AE 81 F0         [ 2]  415 	ldw x,#program_row_end 
      0081F3 1D 81 D0         [ 2]  416 	subw x,#program_row 
      0081F6 CF 00 0D         [ 2]  417 	ldw acc16,x ; bytes to move 
      0081F9 AE 16 90         [ 2]  418 	ldw x,#tib ; destination address 
      0081FC 90 AE 81 D0      [ 2]  419 	ldw y,#program_row ; source address 
      008200 CD 84 36         [ 4]  420 	call move 
      008203 81               [ 4]  421 	ret 
                                    422 
                                    423 
                                    424 ;-----------------------------
                                    425 ; write a row in FLASH/EEPROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    426 ; input:
                                    427 ;    farptr   destination address 
                                    428 ;    x        source address 
                                    429 ;-----------------------------
      008204                        430 write_row:
      008204 89               [ 2]  431 	pushw x 
      008205 72 5D 00 17      [ 1]  432 	tnz farptr 
      008209 26 0D            [ 1]  433 	jrne to_flash 
      00820B CE 00 18         [ 2]  434 	ldw x,farptr+1 
      00820E A3 AA 80         [ 2]  435 	cpw x,#app_space  
      008211 24 05            [ 1]  436 	jruge to_flash 
      008213                        437 to_eeprom:
      008213 CD 81 5F         [ 4]  438 	call unlock_eeprom
      008216 20 03            [ 2]  439 	jra do_programming
      008218                        440 to_flash:
      008218 CD 81 7A         [ 4]  441 	call unlock_flash
      00821B                        442 do_programming:
      00821B 85               [ 2]  443 	popw x 
      00821C CD 16 90         [ 4]  444 	call tib
      00821F 72 13 50 5F      [ 1]  445 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008223 72 17 50 5F      [ 1]  446 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008227 81               [ 4]  447 	ret 
                                    448 
                                    449 
                                    450 ;-----------------------------------
                                    451 ; erase flash or EEPROM block
                                    452 ; a block is 128 bytes 
                                    453 ; input:
                                    454 ;   farptr  address row begin
                                    455 ; output:
                                    456 ;   none
                                    457 ;--------------------------------------
      008228                        458 block_erase:
      008228 CE 00 18         [ 2]  459 	ldw x,farptr+1
      00822B A3 AA 80         [ 2]  460 	cpw x,#app_space 
      00822E 24 17            [ 1]  461 	jruge erase_flash 
                                    462 ; erase eeprom block
      008230 A3 40 00         [ 2]  463 	cpw x,#EEPROM_BASE 
      008233 24 01            [ 1]  464 	jruge 1$
      008235 81               [ 4]  465 	ret ; bad address 
      008236 A3 47 FF         [ 2]  466 1$: cpw x,#EEPROM_END 
      008239 25 01            [ 1]  467 	jrult 2$ 
      00823B 81               [ 4]  468 	ret ; bad address 
      00823C CD 81 5F         [ 4]  469 2$:	call unlock_eeprom 
      00823F CD 16 90         [ 4]  470 	call tib 
      008242 72 17 50 5F      [ 1]  471 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008246 81               [ 4]  472 	ret 
                                    473 ; erase flash block:
      008247                        474 erase_flash:
      008247 CD 81 7A         [ 4]  475 	call unlock_flash 
      00824A CD 16 90         [ 4]  476 	call tib 
      00824D 72 13 50 5F      [ 1]  477     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008251 81               [ 4]  478 	ret 
                                    479 
                                    480 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    481 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    482 ; write a byte to FLASH or EEPROM/OPTION  
                                    483 ; input:
                                    484 ;    a  		byte to write
                                    485 ;    farptr  	address
                                    486 ;    x          farptr[x]
                                    487 ; output:
                                    488 ;    none
                                    489 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    490 	; variables locales
                           000001   491 	BTW = 1   ; byte to write offset on stack
                           000002   492 	OPT = 2   ; OPTION flag offset on stack
                           000002   493 	VSIZE = 2
      008252                        494 write_byte:
      008252 90 89            [ 2]  495 	pushw y
      0001D4                        496 	_vars VSIZE
      008254 52 02            [ 2]    1     sub sp,#VSIZE 
      008256 6B 01            [ 1]  497 	ld (BTW,sp),a ; byte to write 
      008258 0F 02            [ 1]  498 	clr (OPT,sp)  ; OPTION flag
                                    499 ; put addr[15:0] in Y, for bounds check.
      00825A 90 CE 00 18      [ 2]  500 	ldw y,farptr+1   ; Y=addr15:0
                                    501 ; check addr[23:16], if <> 0 then it is extened flash memory
      00825E 72 5D 00 17      [ 1]  502 	tnz farptr 
      008262 26 14            [ 1]  503 	jrne write_flash
      008264 90 A3 AA 80      [ 2]  504     cpw y,#app_space 	 
      008268 24 0E            [ 1]  505     jruge write_flash
      00826A 90 A3 40 00      [ 2]  506 	cpw y,#EEPROM_BASE  
      00826E 25 57            [ 1]  507     jrult write_exit
      008270 90 A3 48 7F      [ 2]  508 	cpw y,#OPTION_END 
      008274 22 51            [ 1]  509 	jrugt write_exit
      008276 20 16            [ 2]  510 	jra write_eeprom 
                                    511 ; write program memory
      008278                        512 write_flash:
      008278 CD 81 7A         [ 4]  513 	call unlock_flash 
      00827B 9B               [ 1]  514 1$:	sim 
      00827C 7B 01            [ 1]  515 	ld a,(BTW,sp)
      00827E 92 A7 00 17      [ 4]  516 	ldf ([farptr],x),a ; farptr[x]=A
      008282 72 05 50 5F FB   [ 2]  517 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008287 9A               [ 1]  518     rim 
      008288 72 13 50 5F      [ 1]  519     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00828C 20 39            [ 2]  520     jra write_exit
                                    521 ; write eeprom and option
      00828E                        522 write_eeprom:
      00828E CD 81 5F         [ 4]  523 	call unlock_eeprom
                                    524 	; check for data eeprom or option eeprom
      008291 90 A3 48 00      [ 2]  525 	cpw y,#OPTION_BASE
      008295 2B 08            [ 1]  526 	jrmi 1$
      008297 90 A3 48 80      [ 2]  527 	cpw y,#OPTION_END+1
      00829B 2A 02            [ 1]  528 	jrpl 1$
      00829D 03 02            [ 1]  529 	cpl (OPT,sp)
      00829F                        530 1$: 
      00829F 0D 02            [ 1]  531     tnz (OPT,sp)
      0082A1 27 08            [ 1]  532     jreq 2$
                                    533 	; pour modifier une option il faut modifier ces 2 bits
      0082A3 72 1E 50 5B      [ 1]  534     bset FLASH_CR2,#FLASH_CR2_OPT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0082A7 72 1F 50 5C      [ 1]  535     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0082AB                        536 2$: 
      0082AB 7B 01            [ 1]  537     ld a,(BTW,sp)
      0082AD 92 A7 00 17      [ 4]  538     ldf ([farptr],x),a
      0082B1 0D 02            [ 1]  539     tnz (OPT,sp)
      0082B3 27 08            [ 1]  540     jreq 3$
      0082B5 5C               [ 1]  541     incw x
      0082B6 7B 01            [ 1]  542     ld a,(BTW,sp)
      0082B8 43               [ 1]  543     cpl a
      0082B9 92 A7 00 17      [ 4]  544     ldf ([farptr],x),a
      0082BD 72 05 50 5F FB   [ 2]  545 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082C2 72 0D 50 5F FB   [ 2]  546 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      0082C7                        547 write_exit:
      000247                        548 	_drop VSIZE 
      0082C7 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082C9 90 85            [ 2]  549 	popw y
      0082CB 81               [ 4]  550     ret
                                    551 
                                    552 ;--------------------------------------------
                                    553 ; write a data block to eeprom or flash 
                                    554 ; input:
                                    555 ;   Y        source address   
                                    556 ;   X        array index  destination  farptr[x]
                                    557 ;   BSIZE    block size bytes 
                                    558 ;   farptr   write address , byte* 
                                    559 ; output:
                                    560 ;	X 		after last byte written 
                                    561 ;   Y 		after last byte read 
                                    562 ;  farptr   point after block
                                    563 ;---------------------------------------------
      0082CC                        564 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      00024C                        565 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    566 	; local var 
                           000001   567 	XSAVE=1 
                           000002   568 	VSIZE=2 
      00024C                        569 write_block:
      00024C                        570 	_vars VSIZE
      0082CC 52 02            [ 2]    1     sub sp,#VSIZE 
      0082CE 1F 01            [ 2]  571 	ldw (XSAVE,sp),x 
      0082D0 1E 05            [ 2]  572 	ldw x,(BSIZE,sp) 
      0082D2 27 13            [ 1]  573 	jreq 9$
      0082D4 1E 01            [ 2]  574 1$:	ldw x,(XSAVE,sp)
      0082D6 90 F6            [ 1]  575 	ld a,(y)
      0082D8 CD 82 52         [ 4]  576 	call write_byte 
      0082DB 5C               [ 1]  577 	incw x 
      0082DC 90 5C            [ 1]  578 	incw y 
      0082DE 1F 01            [ 2]  579 	ldw (XSAVE,sp),x
      0082E0 1E 05            [ 2]  580 	ldw x,(BSIZE,sp)
      0082E2 5A               [ 2]  581 	decw x
      0082E3 1F 05            [ 2]  582 	ldw (BSIZE,sp),x 
      0082E5 26 ED            [ 1]  583 	jrne 1$
      0082E7                        584 9$:
      0082E7 1E 01            [ 2]  585 	ldw x,(XSAVE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082E9 CD 94 CE         [ 4]  586 	call incr_farptr
      00026C                        587 	_drop VSIZE
      0082EC 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082EE 81               [ 4]  588 	ret 
                                    589 
                                    590 
                                    591 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    592 ;;   UART1 subroutines
                                    593 ;;   used for user interface 
                                    594 ;;   communication channel.
                                    595 ;;   settings: 
                                    596 ;;		115200 8N1 no flow control
                                    597 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    598 
                                    599 ;---------------------------------------------
                                    600 ; initialize UART1, 115200 8N1
                                    601 ; input:
                                    602 ;	none
                                    603 ; output:
                                    604 ;   none
                                    605 ;---------------------------------------------
      0082EF                        606 uart1_init:
      0082EF 72 1A 50 02      [ 1]  607     bset PA_DDR,#UART1_TX_PIN
      0082F3 72 1A 50 03      [ 1]  608     bset PA_CR1,#UART1_TX_PIN 
      0082F7 72 1A 50 04      [ 1]  609     bset PA_CR2,#UART1_TX_PIN 
                                    610 ; enable UART1 clock
      0082FB 72 14 50 C7      [ 1]  611 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      0082FF                        612 uart1_set_baud: 
                                    613 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    614 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      0082FF A6 E1            [ 1]  615 	ld a,#CLK_SWR_HSI
      008301 C1 50 C3         [ 1]  616 	cp a,CLK_CMSR 
      008304 27 0A            [ 1]  617 	jreq 2$ 
      008306                        618 1$: ; 8 Mhz 	
      008306 35 05 52 33      [ 1]  619 	mov UART1_BRR2,#0x05 ; must be loaded first
      00830A 35 04 52 32      [ 1]  620 	mov UART1_BRR1,#0x4
      00830E 20 08            [ 2]  621 	jra 3$
      008310                        622 2$: ; 16 Mhz 	
      008310 35 0B 52 33      [ 1]  623 	mov UART1_BRR2,#0x0b ; must be loaded first
      008314 35 08 52 32      [ 1]  624 	mov UART1_BRR1,#0x08
      008318                        625 3$:
      008318 72 5F 52 31      [ 1]  626     clr UART1_DR
      00831C 35 2C 52 35      [ 1]  627 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008320 72 10 52 35      [ 1]  628 	bset UART1_CR2,#UART_CR2_SBK
      008324 72 0D 52 30 FB   [ 2]  629     btjf UART1_SR,#UART_SR_TC,.
      008329 72 5F 00 2B      [ 1]  630     clr rx1_head 
      00832D 72 5F 00 2C      [ 1]  631 	clr rx1_tail 
      008331 81               [ 4]  632 	ret
                                    633 
                                    634 ;---------------------------------
                                    635 ; uart1_putc
                                    636 ; send a character via UART1
                                    637 ; input:
                                    638 ;    A  	character to send
                                    639 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008332                        640 putc:: ; console output always on UART1
      008332                        641 uart1_putc:: 
      008332 72 0F 52 30 FB   [ 2]  642 	btjf UART1_SR,#UART_SR_TXE,.
      008337 C7 52 31         [ 1]  643 	ld UART1_DR,a 
      00833A 81               [ 4]  644 	ret 
                                    645 
                                    646 
                                    647 ;---------------------------------
                                    648 ; Query for character in rx1_queue
                                    649 ; input:
                                    650 ;   none 
                                    651 ; output:
                                    652 ;   A     0 no charcter available
                                    653 ;   Z     1 no character available
                                    654 ;---------------------------------
      00833B                        655 qgetc::
      00833B                        656 uart1_qgetc::
      00833B C6 00 2B         [ 1]  657 	ld a,rx1_head 
      00833E C0 00 2C         [ 1]  658 	sub a,rx1_tail 
      008341 81               [ 4]  659 	ret 
                                    660 
                                    661 ;---------------------------------
                                    662 ; wait character from UART1 
                                    663 ; input:
                                    664 ;   none
                                    665 ; output:
                                    666 ;   A 			char  
                                    667 ;--------------------------------	
      008342                        668 getc:: ;console input
      008342                        669 uart1_getc::
      008342 CD 83 3B         [ 4]  670 	call uart1_qgetc
      008345 27 FB            [ 1]  671 	jreq uart1_getc 
      008347 89               [ 2]  672 	pushw x 
      008348 AE 00 23         [ 2]  673 	ldw x,#rx1_queue
      00834B 9F               [ 1]  674 	ld a,xl 
      00834C CB 00 2B         [ 1]  675 	add a,rx1_head 
      00834F 97               [ 1]  676 	ld xl,a 
      008350 F6               [ 1]  677 	ld a,(x)
      008351 85               [ 2]  678 	popw x
      008352 88               [ 1]  679 	push a
      008353 72 5C 00 2B      [ 1]  680 	inc rx1_head 
      008357 A6 07            [ 1]  681 	ld a,#RX_QUEUE_SIZE-1 
      008359 C4 00 2B         [ 1]  682 	and a,rx1_head 
      00835C C7 00 2B         [ 1]  683 	ld rx1_head,a 
      00835F 84               [ 1]  684 	pop a  
      008360 81               [ 4]  685 	ret 
                                    686 
                                    687 ;----------------------
                                    688 ; print token id && value
                                    689 ; input:
                                    690 ;   A     token id 
                                    691 ;   X     token value 
                                    692 ;---------------------
                           000001   693 	BSAVE=1
                           000002   694 	AREG=2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                           000003   695 	XREG=3
                           000004   696 	VSIZE=4
      008361                        697 prt_tok:
      0002E1                        698 	_vars VSIZE 
      008361 52 04            [ 2]    1     sub sp,#VSIZE 
      008363 6B 02            [ 1]  699 	ld (AREG,sp),a 
      008365 1F 03            [ 2]  700 	ldw (XREG,sp),x 
      008367 C6 00 0B         [ 1]  701 	ld a, base
      00836A 6B 01            [ 1]  702 	ld (BSAVE,sp),a 
      00836C 35 10 00 0B      [ 1]  703 	mov base,#16  
      008370 AE 83 98         [ 2]  704 	ldw x,#token_msg
      008373 CD A0 C3         [ 4]  705 	call puts 
      008376 5F               [ 1]  706 	clrw x 
      008377 7B 02            [ 1]  707 	ld a,(AREG,sp)
      008379 97               [ 1]  708 	ld xl,a 
      00837A CD 88 F2         [ 4]  709 	call print_int 
      00837D A6 20            [ 1]  710 	ld a,#SPACE
      00837F CD 83 32         [ 4]  711 	call putc 
      008382 1E 03            [ 2]  712 	ldw x,(XREG,sp)
      008384 CD 88 F2         [ 4]  713 	call print_int 
      008387 A6 0D            [ 1]  714 	ld a,#CR 
      008389 CD 83 32         [ 4]  715 	call putc 
      00838C 7B 01            [ 1]  716 	ld a,(BSAVE,sp)
      00838E C7 00 0B         [ 1]  717 	ld base,a 
      008391 7B 02            [ 1]  718 	ld a,(AREG,sp)
      008393 1E 03            [ 2]  719 	ldw x,(XREG,sp)
      000315                        720 	_drop VSIZE 
      008395 5B 04            [ 2]    1     addw sp,#VSIZE 
      008397 81               [ 4]  721 	ret 
      008398 74 6F 6B 65 6E 3A 20   722 token_msg: .asciz "token: "
             00
                                    723 
                                    724 
                                    725 ;---------------------
                                    726 ; display n bytes row 
                                    727 ; from memory.
                                    728 ; input:
                                    729 ;   A   bytes to print 
                                    730 ;	X   start address 
                                    731 ; output:
                                    732 ;   X   address after last shown  
                                    733 ;---------------------
                           000001   734 	CNT=1 
                           000002   735 	ADR=2 
                           000003   736 	VSIZE=3 
      0083A0                        737 show_row:
      0083A0 4D               [ 1]  738 	tnz a 
      0083A1 26 01            [ 1]  739 	jrne 1$
      0083A3 81               [ 4]  740 	ret 
      0083A4                        741 1$:	
      0083A4 89               [ 2]  742 	pushw x  
      0083A5 88               [ 1]  743 	push a 
      0083A6 35 04 00 22      [ 1]  744 	mov tab_width,#4 
      0083AA CD 88 F2         [ 4]  745 	call print_int 
      0083AD A6 20            [ 1]  746 	ld a,#SPACE  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083AF CD 83 32         [ 4]  747 	call putc
      0083B2                        748 row_loop:
      0083B2 1E 02            [ 2]  749 	ldw x,(ADR,sp)
      0083B4 F6               [ 1]  750 	ld a,(x)
      0083B5 5F               [ 1]  751 	clrw x 
      0083B6 97               [ 1]  752 	ld xl,a 
      0083B7 CD 88 F2         [ 4]  753 	call print_int 
      0083BA 1E 02            [ 2]  754 	ldw x,(ADR,sp)
      0083BC 5C               [ 1]  755 	incw x 
      0083BD 1F 02            [ 2]  756 	ldw (ADR,sp),x 
      0083BF 0A 01            [ 1]  757 	dec (CNT,sp)
      0083C1 26 EF            [ 1]  758 	jrne row_loop
      000343                        759 	_drop VSIZE  		
      0083C3 5B 03            [ 2]    1     addw sp,#VSIZE 
      0083C5 35 04 00 22      [ 1]  760 	mov tab_width,#4
      0083C9 A6 0D            [ 1]  761 	ld a,#CR 
      0083CB CD 83 32         [ 4]  762 	call putc 
      0083CE 81               [ 4]  763 	ret 
                                    764 
                                    765 ;--------------------------
                                    766 ; print memory content 
                                    767 ; in hexadecimal format
                                    768 ;  input:
                                    769 ;    X    start address 
                                    770 ;    Y    count 
                                    771 ;--------------------------
                           000001   772 	BCNT=1
                           000003   773 	BASE=3
                           000004   774 	TABW=4
                           000004   775 	VSIZE=4   
      0083CF                        776 hex_dump:
      00034F                        777 	_vars VSIZE
      0083CF 52 04            [ 2]    1     sub sp,#VSIZE 
      0083D1 C6 00 0B         [ 1]  778 	ld a,base
      0083D4 6B 03            [ 1]  779 	ld (BASE,sp),a 
      0083D6 35 10 00 0B      [ 1]  780 	mov base,#16
      0083DA C6 00 22         [ 1]  781 	ld a,tab_width 
      0083DD 6B 04            [ 1]  782 	ld (TABW,sp),a
      0083DF A6 0D            [ 1]  783 	ld a,#CR 
      0083E1 CD 83 32         [ 4]  784 	call putc 
      0083E4 17 01            [ 2]  785 1$: ldw (BCNT,sp),y
      0083E6 A6 10            [ 1]  786 	ld a,#16
      0083E8 90 A3 00 10      [ 2]  787 	cpw y,#16
      0083EC 2A 02            [ 1]  788 	jrpl 2$
      0083EE 90 9F            [ 1]  789 	ld a,yl
      0083F0                        790 2$: 	
      0083F0 CD 83 A0         [ 4]  791 	call show_row 
      0083F3 16 01            [ 2]  792 	ldw y,(BCNT,sp) 
      0083F5 72 A2 00 10      [ 2]  793 	subw y,#16 
      0083F9 90 A3 00 01      [ 2]  794 	cpw y,#1
      0083FD 2A E5            [ 1]  795 	jrpl 1$
      0083FF 7B 03            [ 1]  796 	ld a,(BASE,sp)
      008401 C7 00 0B         [ 1]  797 	ld base,a
      008404 7B 04            [ 1]  798 	ld a,(TABW,sp)
      008406 C7 00 22         [ 1]  799 	ld tab_width,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      000389                        800 	_drop VSIZE
      008409 5B 04            [ 2]    1     addw sp,#VSIZE 
      00840B 81               [ 4]  801 	ret 
                                    802 
                                    803 ;-------------------------------------
                                    804 ; retrun string length
                                    805 ; input:
                                    806 ;   X         .asciz  pointer 
                                    807 ; output:
                                    808 ;   X         not affected 
                                    809 ;   A         length 
                                    810 ;-------------------------------------
      00840C                        811 strlen::
      00840C 89               [ 2]  812 	pushw x 
      00840D 4F               [ 1]  813 	clr a
      00840E 7D               [ 1]  814 1$:	tnz (x) 
      00840F 27 04            [ 1]  815 	jreq 9$ 
      008411 4C               [ 1]  816 	inc a 
      008412 5C               [ 1]  817 	incw x 
      008413 20 F9            [ 2]  818 	jra 1$ 
      008415 85               [ 2]  819 9$:	popw x 
      008416 81               [ 4]  820 	ret 
                                    821 
                                    822 ;------------------------------------
                                    823 ; compare 2 strings
                                    824 ; input:
                                    825 ;   X 		char* first string 
                                    826 ;   Y       char* second string 
                                    827 ; output:
                                    828 ;   A 		0|1 
                                    829 ;-------------------------------------
      008417                        830 strcmp:
      008417 F6               [ 1]  831 	ld a,(x)
      008418 27 0B            [ 1]  832 	jreq 5$ 
      00841A 90 F1            [ 1]  833 	cp a,(y) 
      00841C 26 05            [ 1]  834 	jrne 4$ 
      00841E 5C               [ 1]  835 	incw x 
      00841F 90 5C            [ 1]  836 	incw y 
      008421 20 F4            [ 2]  837 	jra strcmp 
      008423                        838 4$: ; not same  
      008423 4F               [ 1]  839 	clr a 
      008424 81               [ 4]  840 	ret 
      008425                        841 5$: ; same 
      008425 A6 01            [ 1]  842 	ld a,#1 
      008427 81               [ 4]  843 	ret 
                                    844 
                                    845 
                                    846 ;---------------------------------------
                                    847 ;  copy src to dest 
                                    848 ; input:
                                    849 ;   X 		dest 
                                    850 ;   Y 		src 
                                    851 ; output: 
                                    852 ;   X 		dest 
                                    853 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008428                        854 strcpy::
      008428 89               [ 2]  855 	pushw x 
      008429 90 F6            [ 1]  856 1$: ld a,(y)
      00842B 27 06            [ 1]  857 	jreq 9$ 
      00842D F7               [ 1]  858 	ld (x),a 
      00842E 5C               [ 1]  859 	incw x 
      00842F 90 5C            [ 1]  860 	incw y 
      008431 20 F6            [ 2]  861 	jra 1$ 
      008433 7F               [ 1]  862 9$:	clr (x)
      008434 85               [ 2]  863 	popw x 
      008435 81               [ 4]  864 	ret 
                                    865 
                                    866 ;---------------------------------------
                                    867 ; move memory block 
                                    868 ; input:
                                    869 ;   X 		destination 
                                    870 ;   Y 	    source 
                                    871 ;   acc16	bytes count 
                                    872 ; output:
                                    873 ;   none 
                                    874 ;--------------------------------------
                           000001   875 	INCR=1 ; increament high byte 
                           000002   876 	LB=2 ; increament low byte 
                           000002   877 	VSIZE=2
      008436                        878 move::
      0003B6                        879 	_vars VSIZE 
      008436 52 02            [ 2]    1     sub sp,#VSIZE 
      008438 0F 01            [ 1]  880 	clr (INCR,sp)
      00843A 0F 02            [ 1]  881 	clr (LB,sp)
      00843C 90 89            [ 2]  882 	pushw y 
      00843E 13 01            [ 2]  883 	cpw x,(1,sp) ; compare DEST to SRC 
      008440 90 85            [ 2]  884 	popw y 
      008442 27 31            [ 1]  885 	jreq move_exit ; x==y 
      008444 2B 0E            [ 1]  886 	jrmi move_down
      008446                        887 move_up: ; start from top address with incr=-1
      008446 72 BB 00 0D      [ 2]  888 	addw x,acc16
      00844A 72 B9 00 0D      [ 2]  889 	addw y,acc16
      00844E 03 01            [ 1]  890 	cpl (INCR,sp)
      008450 03 02            [ 1]  891 	cpl (LB,sp)   ; increment = -1 
      008452 20 05            [ 2]  892 	jra move_loop  
      008454                        893 move_down: ; start from bottom address with incr=1 
      008454 5A               [ 2]  894     decw x 
      008455 90 5A            [ 2]  895 	decw y
      008457 0C 02            [ 1]  896 	inc (LB,sp) ; incr=1 
      008459                        897 move_loop:	
      008459 C6 00 0D         [ 1]  898     ld a, acc16 
      00845C CA 00 0E         [ 1]  899 	or a, acc8
      00845F 27 14            [ 1]  900 	jreq move_exit 
      008461 72 FB 01         [ 2]  901 	addw x,(INCR,sp)
      008464 72 F9 01         [ 2]  902 	addw y,(INCR,sp) 
      008467 90 F6            [ 1]  903 	ld a,(y)
      008469 F7               [ 1]  904 	ld (x),a 
      00846A 89               [ 2]  905 	pushw x 
      00846B CE 00 0D         [ 2]  906 	ldw x,acc16 
      00846E 5A               [ 2]  907 	decw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      00846F CF 00 0D         [ 2]  908 	ldw acc16,x 
      008472 85               [ 2]  909 	popw x 
      008473 20 E4            [ 2]  910 	jra move_loop
      008475                        911 move_exit:
      0003F5                        912 	_drop VSIZE
      008475 5B 02            [ 2]    1     addw sp,#VSIZE 
      008477 81               [ 4]  913 	ret 	
                                    914 
                                    915 ;------------------------------------
                                    916 ;  set all variables to zero 
                                    917 ; input:
                                    918 ;   none 
                                    919 ; output:
                                    920 ;	none
                                    921 ;------------------------------------
      008478                        922 clear_vars:
      008478 AE 00 2D         [ 2]  923 	ldw x,#vars 
      00847B 90 AE 00 34      [ 2]  924 	ldw y,#2*26 
      00847F 7F               [ 1]  925 1$:	clr (x)
      008480 5C               [ 1]  926 	incw x 
      008481 90 5A            [ 2]  927 	decw y 
      008483 26 FA            [ 1]  928 	jrne 1$
      008485 81               [ 4]  929 	ret 
                                    930 
                                    931 ;-------------------------------------
                                    932 ; check if A is a letter 
                                    933 ; input:
                                    934 ;   A 			character to test 
                                    935 ; output:
                                    936 ;   C flag      1 true, 0 false 
                                    937 ;-------------------------------------
      008486                        938 is_alpha::
      008486 A1 41            [ 1]  939 	cp a,#'A 
      008488 8C               [ 1]  940 	ccf 
      008489 24 0B            [ 1]  941 	jrnc 9$ 
      00848B A1 5B            [ 1]  942 	cp a,#'Z+1 
      00848D 25 07            [ 1]  943 	jrc 9$ 
      00848F A1 61            [ 1]  944 	cp a,#'a 
      008491 8C               [ 1]  945 	ccf 
      008492 24 02            [ 1]  946 	jrnc 9$
      008494 A1 7B            [ 1]  947 	cp a,#'z+1
      008496 81               [ 4]  948 9$: ret 	
                                    949 
                                    950 ;------------------------------------
                                    951 ; check if character in {'0'..'9'}
                                    952 ; input:
                                    953 ;    A  character to test
                                    954 ; output:
                                    955 ;    Carry  0 not digit | 1 digit
                                    956 ;------------------------------------
      008497                        957 is_digit::
      008497 A1 30            [ 1]  958 	cp a,#'0
      008499 25 03            [ 1]  959 	jrc 1$
      00849B A1 3A            [ 1]  960     cp a,#'9+1
      00849D 8C               [ 1]  961 	ccf 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      00849E 8C               [ 1]  962 1$:	ccf 
      00849F 81               [ 4]  963     ret
                                    964 
                                    965 ;-------------------------------------
                                    966 ; return true if character in  A 
                                    967 ; is letter or digit.
                                    968 ; input:
                                    969 ;   A     ASCII character 
                                    970 ; output:
                                    971 ;   A     no change 
                                    972 ;   Carry    0 false| 1 true 
                                    973 ;--------------------------------------
      0084A0                        974 is_alnum::
      0084A0 CD 84 97         [ 4]  975 	call is_digit
      0084A3 25 03            [ 1]  976 	jrc 1$ 
      0084A5 CD 84 86         [ 4]  977 	call is_alpha
      0084A8 81               [ 4]  978 1$:	ret 
                                    979 
                                    980 
                                    981 ;-------------------------------------
                                    982 ;  program initialization entry point 
                                    983 ;-------------------------------------
                           000002   984 	MAJOR=2
                           000000   985 	MINOR=0 
      0084A9 0A 0A 54 69 6E 79 20   986 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
      0084EF                        987 cold_start:
                                    988 ;set stack 
      0084EF AE 17 FF         [ 2]  989 	ldw x,#STACK_EMPTY
      0084F2 94               [ 1]  990 	ldw sp,x   
                                    991 ; clear all ram 
      0084F3 7F               [ 1]  992 0$: clr (x)
      0084F4 5A               [ 2]  993 	decw x 
      0084F5 26 FC            [ 1]  994 	jrne 0$
                                    995 ; activate pull up on all inputs 
      0084F7 A6 FF            [ 1]  996 	ld a,#255 
      0084F9 C7 50 03         [ 1]  997 	ld PA_CR1,a 
      0084FC C7 50 08         [ 1]  998 	ld PB_CR1,a 
      0084FF C7 50 0D         [ 1]  999 	ld PC_CR1,a 
      008502 C7 50 12         [ 1] 1000 	ld PD_CR1,a 
      008505 C7 50 17         [ 1] 1001 	ld PE_CR1,a 
      008508 C7 50 1C         [ 1] 1002 	ld PF_CR1,a 
      00850B C7 50 21         [ 1] 1003 	ld PG_CR1,a 
      00850E C7 50 2B         [ 1] 1004 	ld PI_CR1,a
                                   1005 ; set LD2 pin as output 
      008511 72 1A 50 0D      [ 1] 1006     bset PC_CR1,#LED2_BIT
      008515 72 1A 50 0E      [ 1] 1007     bset PC_CR2,#LED2_BIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008519 72 1A 50 0C      [ 1] 1008     bset PC_DDR,#LED2_BIT
      00851D 72 1B 50 0A      [ 1] 1009 	bres PC_ODR,#LED2_BIT 
                                   1010 ; disable schmitt triggers on Arduino CN4 analog inputs
      008521 55 00 3F 54 07   [ 1] 1011 	mov ADC_TDRL,0x3f
                                   1012 ; disable peripherals clocks
                                   1013 ;	clr CLK_PCKENR1 
                                   1014 ;	clr CLK_PCKENR2
      008526 72 5F 50 F2      [ 1] 1015 	clr AWU_TBR 
      00852A 72 14 50 CA      [ 1] 1016 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1017 ; select internal clock no divisor: 16 Mhz 	
      00852E A6 E1            [ 1] 1018 	ld a,#CLK_SWR_HSI 
      008530 5F               [ 1] 1019 	clrw x  
      008531 CD 81 27         [ 4] 1020     call clock_init 
      008534 CD 81 4A         [ 4] 1021 	call timer4_init
      008537 CD 81 3D         [ 4] 1022 	call timer2_init
                                   1023 ; UART1 at 115200 BAUD
      00853A CD 82 EF         [ 4] 1024 	call uart1_init
                                   1025 ; activate PE_4 (user button interrupt)
      00853D 72 18 50 18      [ 1] 1026     bset PE_CR2,#USR_BTN_BIT 
                                   1027 ; display system information
      008541 AE 84 A9         [ 2] 1028 	ldw x,#software 
      008544 CD A0 C3         [ 4] 1029 	call puts 
      008547 A6 02            [ 1] 1030 	ld a,#MAJOR 
      008549 C7 00 0E         [ 1] 1031 	ld acc8,a 
      00854C 5F               [ 1] 1032 	clrw x 
      00854D CF 00 0C         [ 2] 1033 	ldw acc24,x
      008550 72 5F 00 22      [ 1] 1034 	clr tab_width  
      008554 35 0A 00 0B      [ 1] 1035 	mov base, #10 
      008558 CD 89 02         [ 4] 1036 	call prti24 
      00855B A6 2E            [ 1] 1037 	ld a,#'.
      00855D CD 83 32         [ 4] 1038 	call putc 
      008560 A6 00            [ 1] 1039 	ld a,#MINOR 
      008562 C7 00 0E         [ 1] 1040 	ld acc8,a 
      008565 5F               [ 1] 1041 	clrw x 
      008566 CF 00 0C         [ 2] 1042 	ldw acc24,x 
      008569 CD 89 02         [ 4] 1043 	call prti24
      00856C A6 0D            [ 1] 1044 	ld a,#CR 
      00856E CD 83 32         [ 4] 1045 	call putc
      008571 9A               [ 1] 1046 	rim 
      008572 72 5C 00 16      [ 1] 1047 	inc seedy+1 
      008576 72 5C 00 14      [ 1] 1048 	inc seedx+1 
      00857A CD 86 12         [ 4] 1049 	call clear_basic
      00857D CD 8E A9         [ 4] 1050 	call ubound 
      008580 CD 93 35         [ 4] 1051 	call beep_1khz  
      008583                       1052 2$:	
      008583 CD 85 F4         [ 4] 1053 	call warm_init
                                   1054 ; check for application in flash memory 
      008586 CE AA 80         [ 2] 1055 	ldw x,app_sign 
      008589 C3 95 B7         [ 2] 1056 	cpw x,SIGNATURE 
      00858C 27 03            [ 1] 1057 	jreq run_app
      00858E CC 88 2F         [ 2] 1058 	jp cmd_line
      008591                       1059 run_app:
                                   1060 ; run application in FLASH|EEPROM 
      008591 CE AA 82         [ 2] 1061 	ldw x,app_size  
      008594 89               [ 2] 1062 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008595 AE AA 84         [ 2] 1063 	ldw x,#app 
      008598 CF 00 1A         [ 2] 1064 	ldw txtbgn,x
      00859B CF 00 05         [ 2] 1065 	ldw basicptr,x 
      00859E 72 FB 01         [ 2] 1066 	addw x,(1,sp) ; x+size 
      000521                       1067 	_drop 2 
      0085A1 5B 02            [ 2]    1     addw sp,#2 
      0085A3 CF 00 1C         [ 2] 1068 	ldw txtend,x 
      0085A6 AE 85 D2         [ 2] 1069 	ldw x,#RUNNING 
      0085A9 CD A0 C3         [ 4] 1070 	call puts
      0085AC CE 00 05         [ 2] 1071 	ldw x,basicptr    
      0085AF 35 10 00 0B      [ 1] 1072 	mov base,#16 
      0085B3 CD 88 F2         [ 4] 1073 	call print_int
      0085B6 35 0A 00 0B      [ 1] 1074 	mov base,#10  
      0085BA CE 00 05         [ 2] 1075 	ldw x, basicptr 
      0085BD E6 02            [ 1] 1076 	ld a,(2,x)
      0085BF C7 00 04         [ 1] 1077 	ld count,a 
      0085C2 35 03 00 02      [ 1] 1078 	mov in,#3 
      0085C6 72 10 00 21      [ 1] 1079 	bset flags,#FRUN
      0085CA CD 8E A9         [ 4] 1080 	call ubound   
      0085CD CC 88 4B         [ 2] 1081 	jp interpreter  
      0085D0 20 FE            [ 2] 1082     jra .  
                                   1083 
      0085D2 0A 72 75 6E 6E 69 6E  1084 RUNNING: .asciz "\nrunning application at address: " 
             67 20 61 70 70 6C 69
             63 61 74 69 6F 6E 20
             61 74 20 61 64 64 72
             65 73 73 3A 20 00
                                   1085 
      0085F4                       1086 warm_init:
      0085F4 72 5F 00 21      [ 1] 1087 	clr flags 
      0085F8 72 5F 00 1E      [ 1] 1088 	clr loop_depth 
      0085FC 35 04 00 22      [ 1] 1089 	mov tab_width,#TAB_WIDTH 
      008600 35 0A 00 0B      [ 1] 1090 	mov base,#10 
      008604 AE 00 00         [ 2] 1091 	ldw x,#0 
      008607 CF 00 05         [ 2] 1092 	ldw basicptr,x 
      00860A CF 00 01         [ 2] 1093 	ldw in.w,x 
      00860D 72 5F 00 04      [ 1] 1094 	clr count
      008611 81               [ 4] 1095 	ret 
                                   1096 
                                   1097 
                                   1098 ;---------------------------
                                   1099 ; reset BASIC text variables 
                                   1100 ; and clear variables 
                                   1101 ;---------------------------
      008612                       1102 clear_basic:
      008612 72 5F 00 04      [ 1] 1103 	clr count
      008616 72 5F 00 02      [ 1] 1104 	clr in  
      00861A AE 00 80         [ 2] 1105 	ldw x,#free_ram 
      00861D CF 00 1A         [ 2] 1106 	ldw txtbgn,x 
      008620 CF 00 1C         [ 2] 1107 	ldw txtend,x 
      008623 CD 84 78         [ 4] 1108 	call clear_vars 
      008626 81               [ 4] 1109 	ret 
                                   1110 
                                   1111 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1112 ;;   Tiny BASIC error messages     ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1113 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008627                       1114 err_msg:
      008627 00 00 86 47 86 54 86  1115 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             62 86 7B 86 8A
      008633 86 A0 86 B6 86 D0 86  1116 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             E1 86 F2
      00863D 86 FE 87 31 87 41 87  1117 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             55 87 68
                                   1118 
      008647 4D 65 6D 6F 72 79 20  1119 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      008654 73 79 6E 74 61 78 20  1120 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      008662 6D 61 74 68 20 6F 70  1121 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      00867B 64 69 76 69 73 69 6F  1122 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      00868A 69 6E 76 61 6C 69 64  1123 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0086A0 72 75 6E 20 74 69 6D  1124 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0086B6 63 6F 6D 6D 61 6E 64  1125 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      0086D0 64 75 70 6C 69 63 61  1126 err_duplicate: .asciz "duplicate name.\n"
             74 65 20 6E 61 6D 65
             2E 0A 00
      0086E1 46 69 6C 65 20 6E 6F  1127 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      0086F2 62 61 64 20 76 61 6C  1128 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      0086FE 46 69 6C 65 20 69 6E  1129 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      008731 4E 6F 20 64 61 74 61  1130 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      008741 4E 6F 20 70 72 6F 67  1131 err_no_prog: .asciz "No program in RAM!\n"
             72 61 6D 20 69 6E 20
             52 41 4D 21 0A 00
      008755 46 69 6C 65 20 73 79  1132 err_no_fspace: .asciz "File system full.\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal  73-Bits]



             73 74 65 6D 20 66 75
             6C 6C 2E 0A 00
      00875D 74 65 6D 20 66 75 6C  1133 err_buf_full: .asciz "Buffer full\n"
             6C 2E 0A 00 42 75
                                   1134 
      00876A 66 66 65 72 20 66 75  1135 rt_msg: .asciz "\nrun time error, "
             6C 6C 0A 00 0A 72 75
             6E 20 74 69
      00877C 6D 65 20 65 72 72 6F  1136 comp_msg: .asciz "\ncompile error, "
             72 2C 20 00 0A 63 6F
             6D 70 69
      00878D 6C 65 20 65 72 72 6F  1137 tk_id: .asciz "last token id: "
             72 2C 20 00 6C 61 73
             74 20
                                   1138 
      000728                       1139 syntax_error::
      00879D 74 6F            [ 1] 1140 	ld a,#ERR_SYNTAX 
                                   1141 
      00072A                       1142 tb_error::
      00879F 6B 65 6E 20 69   [ 2] 1143 	btjt flags,#FCOMP,1$
      0087A4 64               [ 1] 1144 	push a 
      0087A5 3A 20 00         [ 2] 1145 	ldw x, #rt_msg 
      0087A8 CD 20 43         [ 4] 1146 	call puts 
      0087A8 A6               [ 1] 1147 	pop a 
      0087A9 02 05 A7         [ 2] 1148 	ldw x, #err_msg 
      0087AA 72 5F 00 0C      [ 1] 1149 	clr acc16 
      0087AA 72               [ 1] 1150 	sll a
      0087AB 0A 00 21 44      [ 1] 1151 	rlc acc16  
      0087AF 88 AE 87         [ 1] 1152 	ld acc8, a 
      0087B2 75 CD A0 C3      [ 2] 1153 	addw x,acc16 
      0087B6 84               [ 2] 1154 	ldw x,(x)
      0087B7 AE 86 27         [ 4] 1155 	call puts
      0087BA 72 5F 00         [ 2] 1156 	ldw x,basicptr
      0087BD 0D 48 72         [ 1] 1157 	ld a,in 
      0087C0 59 00 0D         [ 4] 1158 	call prt_basic_line
      0087C3 C7 00 0E         [ 2] 1159 	ldw x,#tk_id 
      0087C6 72 BB 00         [ 4] 1160 	call puts 
      0087C9 0D FE CD         [ 1] 1161 	ld a,in.saved 
      0087CC A0               [ 1] 1162 	clrw x 
      0087CD C3               [ 1] 1163 	ld xl,a 
      0087CE CE 00 05 C6      [ 2] 1164 	addw x,basicptr 
      0087D2 00               [ 1] 1165 	ld a,(x)
      0087D3 02               [ 1] 1166 	clrw x 
      0087D4 CD               [ 1] 1167 	ld xl,a 
      0087D5 8F BF AE         [ 4] 1168 	call print_int
      0087D8 87 98 CD A0 C3   [ 2] 1169 	btjf flags,#FAUTORUN ,6$
      0087DD C6 00            [ 2] 1170 	jra 6$
      000773                       1171 1$:	
      0087DF 03               [ 1] 1172 	push a 
      0087E0 5F 97 72         [ 2] 1173 	ldw x,#comp_msg
      0087E3 BB 00 05         [ 4] 1174 	call puts 
      0087E6 F6               [ 1] 1175 	pop a 
      0087E7 5F 97 CD         [ 2] 1176 	ldw x, #err_msg 
      0087EA 88 F2 72 0D      [ 1] 1177 	clr acc16 
      0087EE 00               [ 1] 1178 	sll a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0087EF 21 37 20 35      [ 1] 1179 	rlc acc16  
      0087F3 C7 00 0D         [ 1] 1180 	ld acc8, a 
      0087F3 88 AE 87 87      [ 2] 1181 	addw x,acc16 
      0087F7 CD               [ 2] 1182 	ldw x,(x)
      0087F8 A0 C3 84         [ 4] 1183 	call puts
      0087FB AE 86 27         [ 2] 1184 	ldw x,#tib
      0087FE 72 5F 00         [ 4] 1185 	call puts 
      008801 0D 48            [ 1] 1186 	ld a,#CR 
      008803 72 59 00         [ 4] 1187 	call putc
      008806 0D C7 00         [ 2] 1188 	ldw x,in.w
      008809 0E 72 BB         [ 4] 1189 	call spaces
      00880C 00 0D            [ 1] 1190 	ld a,#'^
      00880E FE CD A0         [ 4] 1191 	call putc 
      008811 C3 AE 16         [ 2] 1192 6$: ldw x,#STACK_EMPTY 
      008814 90               [ 1] 1193     ldw sp,x
      0007AC                       1194 warm_start:
      008815 CD A0 C3         [ 4] 1195 	call warm_init
                                   1196 ;----------------------------
                                   1197 ;   BASIC interpreter
                                   1198 ;----------------------------
      0007AF                       1199 cmd_line: ; user interface 
      008818 A6 0D            [ 1] 1200 	ld a,#CR 
      00881A CD 83 32         [ 4] 1201 	call putc 
      00881D CE 00            [ 1] 1202 	ld a,#'> 
      00881F 01 CD A1         [ 4] 1203 	call putc
      008822 30 A6 5E         [ 4] 1204 	call readln
      008825 CD 83 32 AE      [ 1] 1205 	tnz count 
      008829 17 FF            [ 1] 1206 	jreq cmd_line
      00882B 94 27 21         [ 4] 1207 	call compile
                                   1208 ; if text begin with a line number
                                   1209 ; the compiler set count to zero    
                                   1210 ; so code is not interpreted
      00882C 72 5D 00 03      [ 1] 1211 	tnz count 
      00882C CD 85            [ 1] 1212 	jreq cmd_line
                                   1213 
                                   1214 ; if direct command 
                                   1215 ; it's ready to interpret 
                                   1216 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1217 ;; This is the interpreter loop
                                   1218 ;; for each BASIC code line. 
                                   1219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0007CB                       1220 interpreter: 
      00882E F4 00 01         [ 1] 1221 	ld a,in 
      00882F C1 00 03         [ 1] 1222 	cp a,count 
      00882F A6 0D            [ 1] 1223 	jrmi interp_loop
      0007D3                       1224 next_line:
      008831 CD 83 32 A6 3E   [ 2] 1225 	btjf flags, #FRUN, cmd_line
      008836 CD 83 32         [ 2] 1226 	ldw x,basicptr
      008839 CD A1 C8 72      [ 2] 1227 	addw x,in.w 
      00883D 5D 00 04         [ 2] 1228 	cpw x,txtend 
      008840 27 ED            [ 1] 1229 	jrpl warm_start
      008842 CD A7 A1         [ 2] 1230 	ldw basicptr,x ; start of next line  
      008845 72 5D            [ 1] 1231 	ld a,(2,x)
      008847 00 04 27         [ 1] 1232 	ld count,a 
      00884A E4 03 00 01      [ 1] 1233 	mov in,#3 ; skip first 3 bytes of line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      00884B                       1234 interp_loop: 
      00884B C6 00 02         [ 4] 1235 	call next_token
      00884E C1 00            [ 1] 1236 	cp a,#TK_NONE 
      008850 04 2B            [ 1] 1237 	jreq next_line 
      008852 1D 80            [ 1] 1238 	cp a,#TK_CMD
      008853 26 03            [ 1] 1239 	jrne 1$
      008853 72               [ 4] 1240 	call (x) 
      008854 01 00            [ 2] 1241 	jra interp_loop 
      0007FE                       1242 1$:	 
      008856 21 D7            [ 1] 1243 	cp a,#TK_VAR
      008858 CE 00            [ 1] 1244 	jrne 2$
      00885A 05 72 BB         [ 4] 1245 	call let_var  
      00885D 00 01            [ 2] 1246 	jra interp_loop 
      000807                       1247 2$:	
      00885F C3 00            [ 1] 1248 	cp a,#TK_ARRAY 
      008861 1C 2A            [ 1] 1249 	jrne 3$
      008863 C8 CF 00         [ 4] 1250 	call let_array 
      008866 05 E6            [ 2] 1251 	jra interp_loop
      000810                       1252 3$:	
      008868 02 C7            [ 1] 1253 	cp a,#TK_COLON 
      00886A 00 04            [ 1] 1254 	jreq interp_loop 
      00886C 35 03 00         [ 2] 1255 	jp syntax_error 
                                   1256 
                                   1257 		
                                   1258 ;--------------------------
                                   1259 ; extract next token from
                                   1260 ; token list 
                                   1261 ; basicptr -> base address 
                                   1262 ; in  -> offset in list array 
                                   1263 ; output:
                                   1264 ;   A 		token attribute
                                   1265 ;   X 		token value if there is one
                                   1266 ;----------------------------------------
      000817                       1267 next_token::
      00886F 02               [ 1] 1268 	clrw x 
      008870 C6 00 01         [ 1] 1269 	ld a,in 
                                   1270 ; don't replace sub by "cp a,count" 
                                   1271 ; if end of line must return with A=0   	
      008870 CD 88 97         [ 1] 1272 	sub a,count 
      008873 A1 00            [ 1] 1273 	jreq 9$ ; end of line 
      000820                       1274 0$: 
      008875 27 DC A1 80 26   [ 1] 1275 	mov in.saved,in ; in case "_unget_token" needed 
      00887A 03 FD 20 F2      [ 2] 1276 	ldw y,basicptr 
      00887E 91 D6 00         [ 4] 1277 	ld a,([in.w],y)
      00887E A1 85 26 05      [ 1] 1278 	inc in  
      008882 CD               [ 1] 1279 	tnz a 
      008883 8E C4            [ 1] 1280 	jrmi 6$
      008885 20 E9            [ 1] 1281 	cp a,#TK_ARRAY
      008887 2A 3A            [ 1] 1282 	jrpl 9$  ; no attribute for these
      000837                       1283 1$: ; 
      008887 A1 06            [ 1] 1284 	cp a,#TK_CHAR
      008889 26 05            [ 1] 1285 	jrne 2$
      00888B CD               [ 1] 1286 	exg a,xl
      00888C 8E C1 20         [ 4] 1287 	ld a,([in.w],y)
      00888F E0 5C 00 01      [ 1] 1288 	inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008890 41               [ 1] 1289 	exg a,xl  
      008890 A1 0B            [ 2] 1290 	jra 9$ 
      008892 27 DC            [ 1] 1291 2$:	cp a,#TK_QSTR 
      008894 CC 87            [ 1] 1292 	jrne 9$
      008896 A8               [ 1] 1293 	ldw x,y 
      008897 72 BB 00 00      [ 2] 1294 	addw x,in.w ; pointer to string 
                                   1295 ; move pointer after string 
      008897 5F C6 00         [ 4] 1296 3$:	tnz ([in.w],y)
      00889A 02 C0            [ 1] 1297 	jreq 8$
      00889C 00 04 27 51      [ 1] 1298 	inc in 
      0088A0 20 F5            [ 2] 1299 	jra 3$
      00085A                       1300 6$: 
      0088A0 55 00 02 00      [ 2] 1301 	addw y,in.w 
      0088A4 03 90            [ 2] 1302 	ldw y,(y)
      0088A6 CE 00            [ 1] 1303 	cp a,#TK_INTGR
      0088A8 05 91            [ 1] 1304 	jrpl 7$
      0088AA D6 01 72 5C      [ 2] 1305 	ldw y,(code_addr,y) 
      0088AE 00               [ 1] 1306 7$:	exgw x,y 
      0088AF 02 4D 2B 27      [ 1] 1307 	inc in
      0088B3 A1 06 2A 3A      [ 1] 1308 8$:	inc in 
      0088B7                       1309 9$: 
      0088B7 A1               [ 4] 1310 	ret	
                                   1311 
                                   1312 ;-----------------------------------
                                   1313 ; print a 16 bit integer 
                                   1314 ; using variable 'base' as conversion
                                   1315 ; format.
                                   1316 ; input:
                                   1317 ;   X       integer to print 
                                   1318 ;   'base'    conversion base 
                                   1319 ; output:
                                   1320 ;   none 
                                   1321 ;-----------------------------------
      000872                       1322 print_int:
      0088B8 03 26 0B 41      [ 1] 1323 	clr acc24 
      0088BC 91 D6 01         [ 2] 1324 	ldw acc16,x 
      0088BF 72 5C 00 02 41   [ 2] 1325 	btjf acc16,#7,prti24
      0088C4 20 2B A1 02      [ 1] 1326 	cpl acc24 
                                   1327 	
                                   1328 ;------------------------------------
                                   1329 ; print integer in acc24 
                                   1330 ; input:
                                   1331 ;	acc24 		integer to print 
                                   1332 ;	'base' 		numerical base for conversion 
                                   1333 ;   'tab_width' field width 
                                   1334 ;  output:
                                   1335 ;    A          string length
                                   1336 ;------------------------------------
      000882                       1337 prti24:
      0088C8 26 27 93         [ 4] 1338     call itoa  ; conversion entier en  .asciz
      0088CB 72 BB 00         [ 4] 1339 	call right_align  
      0088CE 01               [ 1] 1340 	push a 
      0088CF 91 6D 01         [ 4] 1341 	call puts
      0088D2 27               [ 1] 1342 	pop a 
      0088D3 19               [ 4] 1343     ret	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1344 
                                   1345 ;------------------------------------
                                   1346 ; convert integer in acc24 to string
                                   1347 ; input:
                                   1348 ;   'base'	conversion base 
                                   1349 ;	acc24	integer to convert
                                   1350 ; output:
                                   1351 ;   X  		pointer to first char of string
                                   1352 ;   A       string length
                                   1353 ;------------------------------------
                           000001  1354 	SIGN=1  ; integer sign 
                           000002  1355 	LEN=2 
                           000003  1356 	PSTR=3
                           000004  1357 	VSIZE=4 ;locals size
      00088E                       1358 itoa::
      00088E                       1359 	_vars VSIZE
      0088D4 72 5C            [ 2]    1     sub sp,#VSIZE 
      0088D6 00 02            [ 1] 1360 	clr (LEN,sp) ; string length  
      0088D8 20 F5            [ 1] 1361 	clr (SIGN,sp)    ; sign
      0088DA C6 00 0A         [ 1] 1362 	ld a,base 
      0088DA 72 B9            [ 1] 1363 	cp a,#10
      0088DC 00 01            [ 1] 1364 	jrne 1$
                                   1365 	; base 10 string display with negative sign if bit 23==1
      0088DE 90 FE A1 84 2A   [ 2] 1366 	btjf acc24,#7,1$
      0088E3 04 90            [ 1] 1367 	cpl (SIGN,sp)
      0088E5 DE 9F C9         [ 4] 1368 	call neg_acc24
      0008A5                       1369 1$:
                                   1370 ; initialize string pointer 
      0088E8 51 72 5C         [ 2] 1371 	ldw x,#tib 
      0088EB 00 02 72         [ 2] 1372 	addw x,#TIB_SIZE
      0088EE 5C               [ 2] 1373 	decw x 
      0088EF 00               [ 1] 1374 	clr (x)
      0088F0 02               [ 2] 1375 	decw x 
      0088F1 A6 20            [ 1] 1376 	ld a,#32
      0088F1 81               [ 1] 1377 	ld (x),a
      0088F2 0C 02            [ 1] 1378 	inc (LEN,sp)
      0008B3                       1379 itoa_loop:
      0088F2 72 5F 00         [ 1] 1380     ld a,base
      0088F5 0C CF            [ 2] 1381 	ldw (PSTR,sp),x 
      0088F7 00 0D 72         [ 4] 1382     call divu24_8 ; acc24/A 
      0088FA 0F 00            [ 2] 1383 	ldw x,(PSTR,sp)
      0088FC 0D 04            [ 1] 1384     add a,#'0  ; remainder of division
      0088FE 72 53            [ 1] 1385     cp a,#'9+1
      008900 00 0C            [ 1] 1386     jrmi 2$
      008902 AB 07            [ 1] 1387     add a,#7 
      0008C5                       1388 2$:	
      008902 CD               [ 2] 1389 	decw x
      008903 89               [ 1] 1390     ld (x),a
      008904 0E CD            [ 1] 1391 	inc (LEN,sp)
                                   1392 	; if acc24==0 conversion done
      008906 A8 40 88         [ 1] 1393 	ld a,acc24
      008909 CD A0 C3         [ 1] 1394 	or a,acc16
      00890C 84 81 0D         [ 1] 1395 	or a,acc8
      00890E 26 DF            [ 1] 1396     jrne itoa_loop
                                   1397 	;conversion done, next add '$' or '-' as required
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      00890E 52 04 0F         [ 1] 1398 	ld a,base 
      008911 02 0F            [ 1] 1399 	cp a,#16
      008913 01 C6            [ 1] 1400 	jreq 8$
      008915 00 0B            [ 1] 1401 	ld a,(SIGN,sp)
      008917 A1 0A            [ 1] 1402     jreq 10$
      008919 26 0A            [ 1] 1403     ld a,#'-
      00891B 72 0F            [ 2] 1404 	jra 9$ 
                                   1405 ; don't print more than 4 digits
                                   1406 ; in hexadecimal to avoid '-' sign 
                                   1407 ; extend display 	
      00891D 00 0C            [ 1] 1408 8$: ld a,(LEN,sp) 
      00891F 05 03            [ 1] 1409 	cp a,#6 
      008921 01 CD            [ 1] 1410 	jrmi 81$
      008923 89               [ 1] 1411 	incw x
      008924 DB 02            [ 1] 1412 	dec (LEN,sp)
      008925 20 F5            [ 2] 1413 	jra 8$
      0008EE                       1414 81$:	
      008925 AE 16            [ 1] 1415 	ld a,#'$ 
      008927 90               [ 2] 1416 9$: decw x
      008928 1C               [ 1] 1417     ld (x),a
      008929 00 50            [ 1] 1418 	inc (LEN,sp)
      0008F4                       1419 10$:
      00892B 5A 7F            [ 1] 1420 	ld a,(LEN,sp)
      0008F6                       1421 	_drop VSIZE
      00892D 5A A6            [ 2]    1     addw sp,#VSIZE 
      00892F 20               [ 4] 1422 	ret
                                   1423 
                                   1424 ;-------------------------------------
                                   1425 ; divide uint24_t by uint8_t
                                   1426 ; used to convert uint24_t to string
                                   1427 ; input:
                                   1428 ;	acc24	dividend
                                   1429 ;   A 		divisor
                                   1430 ; output:
                                   1431 ;   acc24	quotient
                                   1432 ;   A		remainder
                                   1433 ;------------------------------------- 
                                   1434 ; offset  on sp of arguments and locals
                           000001  1435 	U8   = 1   ; divisor on stack
                           000001  1436 	VSIZE =1
      0008F9                       1437 divu24_8:
      008930 F7               [ 2] 1438 	pushw x ; save x
      008931 0C               [ 1] 1439 	push a 
                                   1440 	; ld dividend UU:MM bytes in X
      008932 02 00 0B         [ 1] 1441 	ld a, acc24
      008933 95               [ 1] 1442 	ld xh,a
      008933 C6 00 0B         [ 1] 1443 	ld a,acc24+1
      008936 1F               [ 1] 1444 	ld xl,a
      008937 03 CD            [ 1] 1445 	ld a,(U8,SP) ; divisor
      008939 89               [ 2] 1446 	div x,a ; UU:MM/U8
      00893A 79               [ 1] 1447 	push a  ;save remainder
      00893B 1E               [ 1] 1448 	ld a,xh
      00893C 03 AB 30         [ 1] 1449 	ld acc24,a
      00893F A1               [ 1] 1450 	ld a,xl
      008940 3A 2B 02         [ 1] 1451 	ld acc24+1,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      008943 AB               [ 1] 1452 	pop a
      008944 07               [ 1] 1453 	ld xh,a
      008945 C6 00 0D         [ 1] 1454 	ld a,acc24+2
      008945 5A               [ 1] 1455 	ld xl,a
      008946 F7 0C            [ 1] 1456 	ld a,(U8,sp) ; divisor
      008948 02               [ 2] 1457 	div x,a  ; R:LL/U8
      008949 C6 00            [ 1] 1458 	ld (U8,sp),a ; save remainder
      00894B 0C               [ 1] 1459 	ld a,xl
      00894C CA 00 0D         [ 1] 1460 	ld acc24+2,a
      00894F CA               [ 1] 1461 	pop a
      008950 00               [ 2] 1462 	popw x
      008951 0E               [ 4] 1463 	ret
                                   1464 
                                   1465 ;--------------------------------------
                                   1466 ; unsigned multiply uint24_t by uint8_t
                                   1467 ; use to convert numerical string to uint24_t
                                   1468 ; input:
                                   1469 ;	acc24	uint24_t 
                                   1470 ;   A		uint8_t
                                   1471 ; output:
                                   1472 ;   acc24   A*acc24
                                   1473 ;-------------------------------------
                                   1474 ; local variables offset  on sp
                           000003  1475 	U8   = 3   ; A pushed on stack
                           000002  1476 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1477 	OVFH = 1  ; multiplication overflow high byte
                           000003  1478 	VSIZE = 3
      000921                       1479 mulu24_8:
      008952 26               [ 2] 1480 	pushw x    ; save X
                                   1481 	; local variables
      008953 DF               [ 1] 1482 	push a     ; U8
      008954 C6               [ 1] 1483 	clrw x     ; initialize overflow to 0
      008955 00               [ 2] 1484 	pushw x    ; multiplication overflow
                                   1485 ; multiply low byte.
      008956 0B A1 10         [ 1] 1486 	ld a,acc24+2
      008959 27               [ 1] 1487 	ld xl,a
      00895A 08 7B            [ 1] 1488 	ld a,(U8,sp)
      00895C 01               [ 4] 1489 	mul x,a
      00895D 27               [ 1] 1490 	ld a,xl
      00895E 15 A6 2D         [ 1] 1491 	ld acc24+2,a
      008961 20               [ 1] 1492 	ld a, xh
      008962 0D 7B            [ 1] 1493 	ld (OVFL,sp),a
                                   1494 ; multipy middle byte
      008964 02 A1 06         [ 1] 1495 	ld a,acc24+1
      008967 2B               [ 1] 1496 	ld xl,a
      008968 05 5C            [ 1] 1497 	ld a, (U8,sp)
      00896A 0A               [ 4] 1498 	mul x,a
                                   1499 ; add overflow to this partial product
      00896B 02 20 F5         [ 2] 1500 	addw x,(OVFH,sp)
      00896E 9F               [ 1] 1501 	ld a,xl
      00896E A6 24 5A         [ 1] 1502 	ld acc24+1,a
      008971 F7               [ 1] 1503 	clr a
      008972 0C 02            [ 1] 1504 	adc a,#0
      008974 6B 01            [ 1] 1505 	ld (OVFH,sp),a
      008974 7B               [ 1] 1506 	ld a,xh
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008975 02 5B            [ 1] 1507 	ld (OVFL,sp),a
                                   1508 ; multiply most signficant byte	
      008977 04 81 0B         [ 1] 1509 	ld a, acc24
      008979 97               [ 1] 1510 	ld xl, a
      008979 89 88            [ 1] 1511 	ld a, (U8,sp)
      00897B C6               [ 4] 1512 	mul x,a
      00897C 00 0C 95         [ 2] 1513 	addw x, (OVFH,sp)
      00897F C6               [ 1] 1514 	ld a, xl
      008980 00 0D 97         [ 1] 1515 	ld acc24,a
      008983 7B 01            [ 2] 1516     addw sp,#VSIZE
      008985 62               [ 2] 1517 	popw x
      008986 88               [ 4] 1518 	ret
                                   1519 
                                   1520 ;------------------------------------
                                   1521 ;  two's complement acc24
                                   1522 ;  input:
                                   1523 ;		acc24 variable
                                   1524 ;  output:
                                   1525 ;		acc24 variable
                                   1526 ;-------------------------------------
      00095B                       1527 neg_acc24:
      008987 9E C7 00 0C      [ 1] 1528 	cpl acc24+2
      00898B 9F C7 00 0D      [ 1] 1529 	cpl acc24+1
      00898F 84 95 C6 00      [ 1] 1530 	cpl acc24
      008993 0E 97            [ 1] 1531 	ld a,#1
      008995 7B 01 62         [ 1] 1532 	add a,acc24+2
      008998 6B 01 9F         [ 1] 1533 	ld acc24+2,a
      00899B C7               [ 1] 1534 	clr a
      00899C 00 0E 84         [ 1] 1535 	adc a,acc24+1
      00899F 85 81 0C         [ 1] 1536 	ld acc24+1,a 
      0089A1 4F               [ 1] 1537 	clr a 
      0089A1 89 88 5F         [ 1] 1538 	adc a,acc24 
      0089A4 89 C6 00         [ 1] 1539 	ld acc24,a 
      0089A7 0E               [ 4] 1540 	ret
                                   1541 
                                   1542 
                                   1543 
                                   1544 
                                   1545 ;------------------------------------
                                   1546 ; convert alpha to uppercase
                                   1547 ; input:
                                   1548 ;    a  character to convert
                                   1549 ; output:
                                   1550 ;    a  uppercase character
                                   1551 ;------------------------------------
      00097E                       1552 to_upper::
      0089A8 97 7B            [ 1] 1553 	cp a,#'a
      0089AA 03 42            [ 1] 1554 	jrpl 1$
      0089AC 9F               [ 4] 1555 0$:	ret
      0089AD C7 00            [ 1] 1556 1$: cp a,#'z	
      0089AF 0E 9E            [ 1] 1557 	jrugt 0$
      0089B1 6B 02            [ 1] 1558 	sub a,#32
      0089B3 C6               [ 4] 1559 	ret
                                   1560 	
                                   1561 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1562 ; convert pad content in integer
                                   1563 ; input:
                                   1564 ;    x		.asciz to convert
                                   1565 ; output:
                                   1566 ;    acc24      int24_t
                                   1567 ;------------------------------------
                                   1568 	; local variables
                           000001  1569 	SIGN=1 ; 1 byte, 
                           000002  1570 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  1571 	TEMP=3 ; 1 byte, temporary storage
                           000003  1572 	VSIZE=3 ; 3 bytes reserved for local storage
      00098A                       1573 atoi24::
      0089B4 00               [ 2] 1574 	pushw x 
      00098B                       1575 	_vars VSIZE
      0089B5 0D 97            [ 2]    1     sub sp,#VSIZE 
                                   1576 	; acc24=0 
      0089B7 7B 03 42 72      [ 1] 1577 	clr acc24    
      0089BB FB 01 9F C7      [ 1] 1578 	clr acc16
      0089BF 00 0D 4F A9      [ 1] 1579 	clr acc8 
      0089C3 00 6B            [ 1] 1580 	clr (SIGN,sp)
      0089C5 01 9E            [ 1] 1581 	ld a,#10
      0089C7 6B 02            [ 1] 1582 	ld (BASE,sp),a ; default base decimal
      0089C9 C6               [ 1] 1583 	ld a,(x)
      0089CA 00 0C            [ 1] 1584 	jreq 9$  ; completed if 0
      0089CC 97 7B            [ 1] 1585 	cp a,#'-
      0089CE 03 42            [ 1] 1586 	jrne 1$
      0089D0 72 FB            [ 1] 1587 	cpl (SIGN,sp)
      0089D2 01 9F            [ 2] 1588 	jra 2$
      0089D4 C7 00            [ 1] 1589 1$: cp a,#'$
      0089D6 0C 5B            [ 1] 1590 	jrne 3$
      0089D8 03 85            [ 1] 1591 	ld a,#16
      0089DA 81 02            [ 1] 1592 	ld (BASE,sp),a
      0089DB 5C               [ 1] 1593 2$:	incw x
      0089DB 72               [ 1] 1594 	ld a,(x)
      0009B4                       1595 3$:	
      0089DC 53 00            [ 1] 1596 	cp a,#'a
      0089DE 0E 72            [ 1] 1597 	jrmi 4$
      0089E0 53 00            [ 1] 1598 	sub a,#32
      0089E2 0D 72            [ 1] 1599 4$:	cp a,#'0
      0089E4 53 00            [ 1] 1600 	jrmi 9$
      0089E6 0C A6            [ 1] 1601 	sub a,#'0
      0089E8 01 CB            [ 1] 1602 	cp a,#10
      0089EA 00 0E            [ 1] 1603 	jrmi 5$
      0089EC C7 00            [ 1] 1604 	sub a,#7
      0089EE 0E 4F            [ 1] 1605 	cp a,(BASE,sp)
      0089F0 C9 00            [ 1] 1606 	jrpl 9$
      0089F2 0D C7            [ 1] 1607 5$:	ld (TEMP,sp),a
      0089F4 00 0D            [ 1] 1608 	ld a,(BASE,sp)
      0089F6 4F C9 00         [ 4] 1609 	call mulu24_8
      0089F9 0C C7            [ 1] 1610 	ld a,(TEMP,sp)
      0089FB 00 0C 81         [ 1] 1611 	add a,acc24+2
      0089FE C7 00 0D         [ 1] 1612 	ld acc24+2,a
      0089FE A1               [ 1] 1613 	clr a
      0089FF 61 2A 01         [ 1] 1614 	adc a,acc24+1
      008A02 81 A1 7A         [ 1] 1615 	ld acc24+1,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A05 22               [ 1] 1616 	clr a
      008A06 FB A0 20         [ 1] 1617 	adc a,acc24
      008A09 81 00 0B         [ 1] 1618 	ld acc24,a
      008A0A 20 C9            [ 2] 1619 	jra 2$
      008A0A 89 52            [ 1] 1620 9$:	tnz (SIGN,sp)
      008A0C 03 72            [ 1] 1621     jreq atoi_exit
      008A0E 5F 00 0C         [ 4] 1622     call neg_acc24
      0009F0                       1623 atoi_exit: 
      0009F0                       1624 	_drop VSIZE
      008A11 72 5F            [ 2]    1     addw sp,#VSIZE 
      008A13 00               [ 2] 1625 	popw x ; restore x
      008A14 0D               [ 4] 1626 	ret
                                   1627 
                                   1628 
                                   1629 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1630 ;;   TINY BASIC  operators,
                                   1631 ;;   commands and functions 
                                   1632 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1633 
                                   1634 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1635 ;;  Arithmetic operators
                                   1636 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1637 
                                   1638 ;debug support
                           000001  1639 DEBUG_PRT=1
                           000001  1640 .if DEBUG_PRT 
                           000001  1641 	REGA=1
                           000002  1642 	SAVEB=2
                           000003  1643 	REGX=3
                           000005  1644 	REGY=5
                           000007  1645 	ACC24=7
                           000009  1646 	VSIZE=9 
      0009F4                       1647 printxy:
      0009F4                       1648 	_vars VSIZE 
      008A15 72 5F            [ 2]    1     sub sp,#VSIZE 
      008A17 00 0E            [ 1] 1649 	ld (REGA,sp),a 
      008A19 0F 01 A6         [ 1] 1650 	ld a,base 
      008A1C 0A 6B            [ 1] 1651 	ld (SAVEB,sp),a
      008A1E 02 F6            [ 2] 1652 	ldw (REGX,sp),x
      008A20 27 47            [ 2] 1653 	ldw (REGY,sp),y
      008A22 A1 2D 26         [ 2] 1654 	ldw x,acc24 
      008A25 04 03 01         [ 1] 1655 	ld a,acc8 
      008A28 20 08            [ 2] 1656 	ldw (ACC24,sp),x 
      008A2A A1 24            [ 1] 1657 	ld (ACC24+2,sp),a 
      008A2C 26 06 A6 10      [ 1] 1658 	mov base,#16 
      008A30 6B               [ 1] 1659 	clrw x 
      008A31 02 5C            [ 1] 1660 	ld a,(REGA,sp)
      008A33 F6               [ 1] 1661 	ld xl,a 
      008A34 CD 08 72         [ 4] 1662 	call print_int
      008A34 A1 61            [ 1] 1663 	ld a,#SPACE 
      008A36 2B 02 A0         [ 4] 1664 	call putc  
      008A39 20 A1            [ 2] 1665 	ldw x,(REGX,sp)
      008A3B 30 2B 2B         [ 4] 1666 	call print_int 
      008A3E A0 30            [ 1] 1667 	ld a,#SPACE 
      008A40 A1 0A 2B         [ 4] 1668 	call putc  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A43 06 A0            [ 2] 1669 	ldw x,(REGY,sp)
      008A45 07 11 02         [ 4] 1670 	call print_int 
      008A48 2A 1F            [ 1] 1671 	ld a,#CR 
      008A4A 6B 03 7B         [ 4] 1672 	call putc 
      008A4D 02 CD            [ 1] 1673 	ld a,(ACC24+2,sp)
      008A4F 89 A1            [ 2] 1674 	ldw x,(ACC24,sp)
      008A51 7B 03 CB         [ 2] 1675 	ldw acc24,x 
      008A54 00 0E C7         [ 1] 1676 	ld acc8,a
      008A57 00 0E            [ 1] 1677 	ld a,(SAVEB,sp)
      008A59 4F C9 00         [ 1] 1678 	ld base,a 
      008A5C 0D C7            [ 1] 1679 	ld a,(REGA,sp)
      008A5E 00 0D            [ 2] 1680 	ldw x,(REGX,sp)
      008A60 4F C9            [ 2] 1681 	ldw y,(REGY,sp)
      000A44                       1682 	_drop VSIZE 
      008A62 00 0C            [ 2]    1     addw sp,#VSIZE 
      008A64 C7               [ 4] 1683 	ret 
                                   1684 .endif 
                                   1685 
                                   1686 
                                   1687 ;--------------------------------------
                                   1688 ;  multiply 2 uint16_t return uint32_t
                                   1689 ;  input:
                                   1690 ;     x       uint16_t 
                                   1691 ;     y       uint16_t 
                                   1692 ;  output:
                                   1693 ;     x       product bits 15..0
                                   1694 ;     y       product bits 31..16 
                                   1695 ;---------------------------------------
                           000001  1696 		U1=1  ; uint16_t 
                           000003  1697 		DBL=3 ; uint32_t
                           000006  1698 		VSIZE=6
      000A47                       1699 umstar:
      000A47                       1700 	_vars VSIZE 
      008A65 00 0C            [ 2]    1     sub sp,#VSIZE 
      008A67 20 C9            [ 2] 1701 	ldw (U1,sp),x 
                                   1702 ;initialize bits 31..16 of 
                                   1703 ;product to zero 
      008A69 0D 01            [ 1] 1704 	clr (DBL,sp)
      008A6B 27 03            [ 1] 1705 	clr (DBL+1,sp)
                                   1706 ; produc U1L*U2L 
      008A6D CD 89            [ 1] 1707 	ld a,yl 
      008A6F DB               [ 4] 1708 	mul x,a 
      008A70 1F 05            [ 2] 1709 	ldw (DBL+2,sp),x
                                   1710 ; product U1H*U2L 
      008A70 5B 03            [ 1] 1711 	ld a,(U1,sp) ; xh 
      008A72 85               [ 1] 1712 	ldw x,y
      008A73 81               [ 4] 1713 	mul x,a 
      008A74 4F               [ 1] 1714 	clr a 
      008A74 52 09 6B         [ 2] 1715 	addw x,(DBL+1,sp) 
      008A77 01               [ 1] 1716 	clr a 
      008A78 C6 00            [ 1] 1717 	adc a,(DBL,sp) 
      008A7A 0B 6B            [ 1] 1718 	ld (DBL,sp),a ; bits 23..17 
      008A7C 02 1F            [ 2] 1719 	ldw (DBL+1,sp),x ; bits 15..0 
                                   1720 ; product U1L*U2H
      008A7E 03 17            [ 1] 1721 	swapw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008A80 05               [ 1] 1722 	ldw x,y
      008A81 CE 00            [ 1] 1723 	ld a,(U1+1,sp)
      008A83 0C               [ 4] 1724 	mul x,a
      008A84 C6 00 0E         [ 2] 1725 	addw x,(DBL+1,sp)
      008A87 1F               [ 1] 1726 	clr a 
      008A88 07 6B            [ 1] 1727 	adc a,(DBL,sp)
      008A8A 09 35            [ 1] 1728 	ld (DBL,sp),a 
      008A8C 10 00            [ 2] 1729 	ldw (DBL+1,sp),x 
                                   1730 ; product U1H*U2H 	
      008A8E 0B 5F            [ 1] 1731 	ld a,(U1,sp)
      008A90 7B               [ 1] 1732 	ldw x,y  
      008A91 01               [ 4] 1733 	mul x,a 
      008A92 97 CD 88         [ 2] 1734 	addw x,(DBL,sp)
      008A95 F2 A6            [ 1] 1735 	ldw y,x 
      008A97 20 CD            [ 2] 1736 	ldw x,(DBL+2,sp)
      000A7E                       1737 	_drop VSIZE 
      008A99 83 32            [ 2]    1     addw sp,#VSIZE 
      008A9B 1E               [ 4] 1738 	ret
                                   1739 
                                   1740 
                                   1741 ;-------------------------------------
                                   1742 ; multiply 2 integers
                                   1743 ; input:
                                   1744 ;  	x       n1 
                                   1745 ;   y 		n2 
                                   1746 ; output:
                                   1747 ;	X        N1*N2 bits 15..0
                                   1748 ;   Y        N1*N2 bits 31..16 
                                   1749 ;-------------------------------------
                           000001  1750 	SIGN=1
                           000001  1751 	VSIZE=1
      000A81                       1752 multiply:
      000A81                       1753 	_vars VSIZE 
      008A9C 03 CD            [ 2]    1     sub sp,#VSIZE 
      008A9E 88 F2            [ 1] 1754 	clr (SIGN,sp)
      008AA0 A6               [ 1] 1755 	ld a,xh 
      008AA1 20 CD            [ 1] 1756 	and a,#0x80
      008AA3 83 32            [ 1] 1757 	jrpl 1$
      008AA5 1E 05            [ 1] 1758 	cpl (SIGN,sp)
      008AA7 CD               [ 2] 1759 	negw x 
      000A8D                       1760 1$:	
      008AA8 88 F2            [ 1] 1761 	ld a,yh
      008AAA A6 0D            [ 1] 1762 	and a,#0x80  
      008AAC CD 83            [ 1] 1763 	jrpl 2$ 
      008AAE 32 7B            [ 1] 1764 	cpl (SIGN,sp)
      008AB0 09 1E            [ 2] 1765 	negw y 
      000A97                       1766 2$:	
      008AB2 07 CF 00         [ 4] 1767 	call umstar
      008AB5 0C C7            [ 1] 1768 	ld a,(SIGN,sp)
      008AB7 00 0E            [ 1] 1769 	jreq 3$
      008AB9 7B 02 C7         [ 4] 1770 	call dneg 
      000AA1                       1771 3$:	
      000AA1                       1772 	_drop VSIZE 
      008ABC 00 0B            [ 2]    1     addw sp,#VSIZE 
      008ABE 7B               [ 4] 1773 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1774 
                                   1775 ;--------------------------------------
                                   1776 ; divide uint32_t/uint16_t
                                   1777 ; return:  quotient and remainder 
                                   1778 ; quotient expected to be uint16_t 
                                   1779 ; input:
                                   1780 ;   DBLDIVDND    on stack 
                                   1781 ;   X            divisor 
                                   1782 ; output:
                                   1783 ;   X            quotient 
                                   1784 ;   Y            remainder 
                                   1785 ;---------------------------------------
                           000003  1786 	VSIZE=3
      000AA4                       1787 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000AA4                       1788 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   1789 	; local variables 
                           000001  1790 	DIVISOR=1 
                           000003  1791 	CNTR=3 
      000AA4                       1792 udiv32_16:
      000AA4                       1793 	_vars VSIZE 
      008ABF 01 1E            [ 2]    1     sub sp,#VSIZE 
      008AC1 03 16            [ 2] 1794 	ldw (DIVISOR,sp),x	; save divisor 
      008AC3 05 5B            [ 2] 1795 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008AC5 09 81            [ 2] 1796 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008AC7 90 5D            [ 2] 1797 	tnzw y
      008AC7 52 06            [ 1] 1798 	jrne long_division 
      008AC9 1F 01            [ 2] 1799 	ldw y,(DIVISOR,sp)
      008ACB 0F               [ 2] 1800 	divw x,y
      000AB3                       1801 	_drop VSIZE 
      008ACC 03 0F            [ 2]    1     addw sp,#VSIZE 
      008ACE 04               [ 4] 1802 	ret
      000AB6                       1803 long_division:
      008ACF 90               [ 1] 1804 	exgw x,y ; hi in x, lo in y 
      008AD0 9F 42            [ 1] 1805 	ld a,#17 
      008AD2 1F 05            [ 1] 1806 	ld (CNTR,sp),a
      000ABB                       1807 1$:
      008AD4 7B 01            [ 2] 1808 	cpw x,(DIVISOR,sp)
      008AD6 93 42            [ 1] 1809 	jrmi 2$
      008AD8 4F 72 FB         [ 2] 1810 	subw x,(DIVISOR,sp)
      008ADB 04               [ 1] 1811 2$:	ccf 
      008ADC 4F 19            [ 2] 1812 	rlcw y 
      008ADE 03               [ 2] 1813 	rlcw x 
      008ADF 6B 03            [ 1] 1814 	dec (CNTR,sp)
      008AE1 1F 04            [ 1] 1815 	jrne 1$
      008AE3 90               [ 1] 1816 	exgw x,y 
      000ACB                       1817 	_drop VSIZE 
      008AE4 5E 93            [ 2]    1     addw sp,#VSIZE 
      008AE6 7B               [ 4] 1818 	ret
                                   1819 
                                   1820 ;-----------------------------
                                   1821 ; negate double int.
                                   1822 ; input:
                                   1823 ;   x     bits 15..0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1824 ;   y     bits 31..16
                                   1825 ; output: 
                                   1826 ;   x     bits 15..0
                                   1827 ;   y     bits 31..16
                                   1828 ;-----------------------------
      000ACE                       1829 dneg:
      008AE7 02               [ 2] 1830 	cplw x 
      008AE8 42 72            [ 2] 1831 	cplw y 
      008AEA FB 04 4F         [ 2] 1832 	addw x,#1 
      008AED 19 03            [ 1] 1833 	jrnc 1$
      008AEF 6B 03            [ 1] 1834 	incw y 
      008AF1 1F               [ 4] 1835 1$: ret 
                                   1836 
                                   1837 
                                   1838 ;--------------------------------
                                   1839 ; sign extend single to double
                                   1840 ; input:
                                   1841 ;   x    int16_t
                                   1842 ; output:
                                   1843 ;   x    int32_t bits 15..0
                                   1844 ;   y    int32_t bits 31..16
                                   1845 ;--------------------------------
      000AD9                       1846 dbl_sign_extend:
      008AF2 04 7B            [ 1] 1847 	clrw y
      008AF4 01               [ 1] 1848 	ld a,xh 
      008AF5 93 42            [ 1] 1849 	and a,#0x80 
      008AF7 72 FB            [ 1] 1850 	jreq 1$
      008AF9 03 90            [ 2] 1851 	cplw y
      008AFB 93               [ 4] 1852 1$: ret 	
                                   1853 
                                   1854 
                                   1855 ;----------------------------------
                                   1856 ;  euclidian divide dbl/n1 
                                   1857 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   1858 ; input:
                                   1859 ;    dbl    int32_t on stack 
                                   1860 ;    x 		n1   int16_t  disivor  
                                   1861 ; output:
                                   1862 ;    X      dbl/x  int16_t 
                                   1863 ;    Y      remainder int16_t 
                                   1864 ;----------------------------------
                           000008  1865 	VSIZE=8
      000AE3                       1866 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000AE3                       1867 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000AE3                       1868 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   1869 	; local variables
                           000001  1870 	DBLHI=1
                           000003  1871 	DBLLO=3 
                           000005  1872 	SDIVSR=5 ; sign divisor
                           000006  1873 	SQUOT=6 ; sign dividend 
                           000007  1874 	DIVISR=7 ; divisor 
      000AE3                       1875 div32_16:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      000AE3                       1876 	_vars VSIZE 
      008AFC 1E 05            [ 2]    1     sub sp,#VSIZE 
      008AFE 5B 06            [ 1] 1877 	clr (SDIVSR,sp)
      008B00 81 06            [ 1] 1878 	clr (SQUOT,sp)
                                   1879 ; copy arguments 
      008B01 16 0B            [ 2] 1880 	ldw y,(DIVDNDHI,sp)
      008B01 52 01            [ 2] 1881 	ldw (DBLHI,sp),y
      008B03 0F 01            [ 2] 1882 	ldw y,(DIVDNDLO,sp)
      008B05 9E A4            [ 2] 1883 	ldw (DBLLO,sp),y 
                                   1884 ; check for 0 divisor
      008B07 80               [ 2] 1885 	tnzw x 
      008B08 2A 03            [ 1] 1886     jrne 0$
      008B0A 03 01            [ 1] 1887 	ld a,#ERR_DIV0 
      008B0C 50 07 2A         [ 2] 1888 	jp tb_error 
                                   1889 ; check divisor sign 	
      008B0D 9E               [ 1] 1890 0$:	ld a,xh 
      008B0D 90 9E            [ 1] 1891 	and a,#0x80 
      008B0F A4 80            [ 1] 1892 	jreq 1$
      008B11 2A 04            [ 1] 1893 	cpl (SDIVSR,sp)
      008B13 03 01            [ 1] 1894 	cpl (SQUOT,sp)
      008B15 90               [ 2] 1895 	negw x
      008B16 50 07            [ 2] 1896 1$:	ldw (DIVISR,sp),x
                                   1897 ; check dividend sign 	 
      008B17 7B 01            [ 1] 1898  	ld a,(DBLHI,sp) 
      008B17 CD 8A            [ 1] 1899 	and a,#0x80 
      008B19 C7 7B            [ 1] 1900 	jreq 2$ 
      008B1B 01 27            [ 1] 1901 	cpl (SQUOT,sp)
      008B1D 03 CD            [ 2] 1902 	ldw x,(DBLLO,sp)
      008B1F 8B 4E            [ 2] 1903 	ldw y,(DBLHI,sp)
      008B21 CD 0A CE         [ 4] 1904 	call dneg 
      008B21 5B 01            [ 2] 1905 	ldw (DBLLO,sp),x 
      008B23 81 01            [ 2] 1906 	ldw (DBLHI,sp),y 
      008B24 1E 07            [ 2] 1907 2$:	ldw x,(DIVISR,sp)
      008B24 52 03 1F         [ 4] 1908 	call udiv32_16
      008B27 01 1E            [ 2] 1909 	tnzw y 
      008B29 08 16            [ 1] 1910 	jreq 3$ 
                                   1911 ; x=quotient 
                                   1912 ; y=remainder 
                                   1913 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008B2B 06 90            [ 1] 1914 	ld a,(SQUOT,sp)
      008B2D 5D 26            [ 1] 1915 	xor a,(SDIVSR,sp)
      008B2F 06 16            [ 1] 1916 	jreq 3$
      008B31 01               [ 1] 1917 	incw x 
      008B32 65 5B 03 81      [ 2] 1918 	ldw acc16,y 
      008B36 16 07            [ 2] 1919 	ldw y,(DIVISR,sp)
      008B36 51 A6 11 6B      [ 2] 1920 	subw y,acc16
                                   1921 ; sign quotient
      008B3A 03 06            [ 1] 1922 3$:	ld a,(SQUOT,sp)
      008B3B 27 01            [ 1] 1923 	jreq 4$
      008B3B 13               [ 2] 1924 	negw x 
      000B37                       1925 4$:	
      000B37                       1926 	_drop VSIZE 
      008B3C 01 2B            [ 2]    1     addw sp,#VSIZE 
      008B3E 03               [ 4] 1927 	ret 
                                   1928 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1929 
                                   1930 
                                   1931 ;----------------------------------
                                   1932 ; division x/y 
                                   1933 ; input:
                                   1934 ;    X       dividend
                                   1935 ;    Y       divisor 
                                   1936 ; output:
                                   1937 ;    X       quotient
                                   1938 ;    Y       remainder 
                                   1939 ;-----------------------------------
                           000004  1940 	VSIZE=4 
                                   1941 	; local variables 
                           000001  1942 	DBLHI=1
                           000003  1943 	DBLLO=3
      000B3A                       1944 divide: 
      000B3A                       1945 	_vars VSIZE 
      008B3F 72 F0            [ 2]    1     sub sp,#VSIZE 
      008B41 01 8C 90 59      [ 2] 1946 	ldw acc16,y
      008B45 59 0A 03         [ 4] 1947 	call dbl_sign_extend
      008B48 26 F1            [ 2] 1948 	ldw (DBLLO,sp),x 
      008B4A 51 5B            [ 2] 1949 	ldw (DBLHI,sp),y 
      008B4C 03 81 0C         [ 2] 1950 	ldw x,acc16 
      008B4E CD 0A E3         [ 4] 1951 	call div32_16 
      000B4D                       1952 	_drop VSIZE 
      008B4E 53 90            [ 2]    1     addw sp,#VSIZE 
      008B50 53               [ 4] 1953 	ret
                                   1954 
                                   1955 
                                   1956 ;----------------------------------
                                   1957 ;  remainder resulting from euclidian 
                                   1958 ;  division of x/y 
                                   1959 ; input:
                                   1960 ;   x   	dividend int16_t 
                                   1961 ;   y 		divisor int16_t
                                   1962 ; output:
                                   1963 ;   X       n1%n2 
                                   1964 ;----------------------------------
      000B50                       1965 modulo:
      008B51 1C 00 01         [ 4] 1966 	call divide
      008B54 24               [ 1] 1967 	ldw x,y 
      008B55 02               [ 4] 1968 	ret 
                                   1969 
                                   1970 ;----------------------------------
                                   1971 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   1972 ; return expr1*expr2/expr3 
                                   1973 ; product result is int32_t and 
                                   1974 ; divisiont is int32_t/int16_t
                                   1975 ;----------------------------------
                           000004  1976 	DBL_SIZE=4 
      000B55                       1977 muldiv:
      008B56 90 5C 81         [ 4] 1978 	call func_args 
      008B59 A1 03            [ 1] 1979 	cp a,#3 
      008B59 90 5F            [ 1] 1980 	jreq 1$
      008B5B 9E A4 80         [ 2] 1981 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      000B5F                       1982 1$: 
      008B5E 27 02            [ 2] 1983 	ldw x,(5,sp) ; expr1
      008B60 90 53            [ 2] 1984 	ldw y,(3,sp) ; expr2
      008B62 81 0A 81         [ 4] 1985 	call multiply 
      008B63 1F 05            [ 2] 1986 	ldw (5,sp),x  ;int32_t 15..0
      008B63 52 08            [ 2] 1987 	ldw (3,sp),y  ;int32_t 31..16
      008B65 0F               [ 2] 1988 	popw x        ; expr3 
      008B66 05 0F 06         [ 4] 1989 	call div32_16 ; int32_t/expr3 
      000B6E                       1990 	_drop DBL_SIZE
      008B69 16 0B            [ 2]    1     addw sp,#DBL_SIZE 
      008B6B 17               [ 4] 1991 	ret 
                                   1992 
                                   1993 
                                   1994 ;---------------------------------
                                   1995 ; dictionary search 
                                   1996 ; input:
                                   1997 ;	X 		dictionary entry point, name field  
                                   1998 ;   y		.asciz name to search 
                                   1999 ; output:
                                   2000 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2001 ;  X		cmd_index
                                   2002 ;---------------------------------
                           000001  2003 	NLEN=1 ; cmd length 
                           000002  2004 	XSAVE=2
                           000004  2005 	YSAVE=4
                           000005  2006 	VSIZE=5 
      000B71                       2007 search_dict::
      000B71                       2008 	_vars VSIZE 
      008B6C 01 16            [ 2]    1     sub sp,#VSIZE 
                                   2009 
      008B6E 0D 17            [ 2] 2010 	ldw (YSAVE,sp),y 
      000B75                       2011 search_next:
      008B70 03 5D            [ 2] 2012 	ldw (XSAVE,sp),x 
                                   2013 ; get name length in dictionary	
      008B72 26               [ 1] 2014 	ld a,(x)
      008B73 05 A6            [ 1] 2015 	and a,#0xf 
      008B75 04 CC            [ 1] 2016 	ld (NLEN,sp),a  
      008B77 87 AA            [ 2] 2017 	ldw y,(YSAVE,sp) ; name pointer 
      008B79 9E               [ 1] 2018 	incw x 
      000B7F                       2019 cp_loop:
      008B7A A4 80            [ 1] 2020 	ld a,(y)
      008B7C 27 05            [ 1] 2021 	jreq str_match 
      008B7E 03 05            [ 1] 2022 	tnz (NLEN,sp)
      008B80 03 06            [ 1] 2023 	jreq no_match  
      008B82 50               [ 1] 2024 	cp a,(x)
      008B83 1F 07            [ 1] 2025 	jrne no_match 
      008B85 7B 01            [ 1] 2026 	incw y 
      008B87 A4               [ 1] 2027 	incw x
      008B88 80 27            [ 1] 2028 	dec (NLEN,sp)
      008B8A 0D 03            [ 2] 2029 	jra cp_loop 
      000B91                       2030 no_match:
      008B8C 06 1E            [ 2] 2031 	ldw x,(XSAVE,sp) 
      008B8E 03 16 01         [ 2] 2032 	subw x,#2 ; move X to link field
      008B91 CD 8B            [ 1] 2033 	push #TK_NONE 
      008B93 4E               [ 2] 2034 	ldw x,(x) ; next word link 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008B94 1F               [ 1] 2035 	pop a ; TK_NONE 
      008B95 03 17            [ 1] 2036 	jreq search_exit  ; not found  
                                   2037 ;try next 
      008B97 01 1E            [ 2] 2038 	jra search_next
      000B9E                       2039 str_match:
      008B99 07 CD            [ 2] 2040 	ldw x,(XSAVE,sp)
      008B9B 8B               [ 1] 2041 	ld a,(X)
      008B9C 24 90            [ 1] 2042 	ld (NLEN,sp),a ; needed to test keyword type  
      008B9E 5D 27            [ 1] 2043 	and a,#0xf 
                                   2044 ; move x to procedure address field 	
      008BA0 11               [ 1] 2045 	inc a 
      008BA1 7B 06 18         [ 1] 2046 	ld acc8,a 
      008BA4 05 27 0B 5C      [ 1] 2047 	clr acc16 
      008BA8 90 CF 00 0D      [ 2] 2048 	addw x,acc16 
      008BAC 16               [ 2] 2049 	ldw x,(x) ; routine index  
                                   2050 ;determine keyword type bits 7:6 
      008BAD 07 72            [ 1] 2051 	ld a,(NLEN,sp)
      008BAF B2               [ 1] 2052 	swap a 
      008BB0 00 0D            [ 1] 2053 	and a,#0xc
      008BB2 7B               [ 1] 2054 	srl a
      008BB3 06               [ 1] 2055 	srl a 
      008BB4 27 01            [ 1] 2056 	add a,#128
      000BBB                       2057 search_exit: 
      000BBB                       2058 	_drop VSIZE 	 
      008BB6 50 05            [ 2]    1     addw sp,#VSIZE 
      008BB7 81               [ 4] 2059 	ret 
                                   2060 
                                   2061 ;---------------------
                                   2062 ; check if next token
                                   2063 ;  is of expected type 
                                   2064 ; input:
                                   2065 ;   A 		 expected token attribute
                                   2066 ;  ouput:
                                   2067 ;   none     if fail call syntax_error 
                                   2068 ;--------------------
      000BBE                       2069 expect:
      008BB7 5B               [ 1] 2070 	push a 
      008BB8 08 81 17         [ 4] 2071 	call next_token 
      008BBA 11 01            [ 1] 2072 	cp a,(1,sp)
      008BBA 52 04            [ 1] 2073 	jreq 1$
      008BBC 90 CF 00         [ 2] 2074 	jp syntax_error
      008BBF 0D               [ 1] 2075 1$: pop a 
      008BC0 CD               [ 4] 2076 	ret 
                                   2077 
                                   2078 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2079 ; parse arguments list 
                                   2080 ; between ()
                                   2081 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BCB                       2082 func_args:
      008BC1 8B 59            [ 1] 2083 	ld a,#TK_LPAREN 
      008BC3 1F 03 17         [ 4] 2084 	call expect 
                                   2085 ; expected to continue in arg_list 
                                   2086 ; caller must check for TK_RPAREN 
                                   2087 
                                   2088 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2089 ; parse embedded BASIC routines 
                                   2090 ; arguments list.
                                   2091 ; arg_list::=  rel[','rel]*
                                   2092 ; all arguments are of integer type
                                   2093 ; and pushed on stack 
                                   2094 ; input:
                                   2095 ;   none
                                   2096 ; output:
                                   2097 ;   stack{n}   arguments pushed on stack
                                   2098 ;   A 	number of arguments pushed on stack  
                                   2099 ;--------------------------------
      000BD0                       2100 arg_list:
      008BC6 01 CE            [ 1] 2101 	push #0  
      008BC8 00 0D CD         [ 4] 2102 1$: call relation
      008BCB 8B 63            [ 1] 2103 	cp a,#TK_NONE 
      008BCD 5B 04            [ 1] 2104 	jreq 5$
      008BCF 81 84            [ 1] 2105 	cp a,#TK_INTGR
      008BD0 26 13            [ 1] 2106 	jrne 4$
      000BDD                       2107 3$: 
                                   2108 ; swap return address with argument
      008BD0 CD               [ 1] 2109 	pop a ; arg_count
      008BD1 8B BA            [ 2] 2110 	popw y ; return address 
      008BD3 93               [ 2] 2111 	pushw x ; new argument 
      008BD4 81 89            [ 2] 2112 	pushw y 
      008BD5 4C               [ 1] 2113     inc a
      008BD5 CD               [ 1] 2114 	push a 
      008BD6 8C 4B A1         [ 4] 2115 	call next_token 
      008BD9 03 27            [ 1] 2116 	cp a,#TK_COMMA 
      008BDB 03 CC            [ 1] 2117 	jreq 1$ 
      008BDD 87 A8            [ 1] 2118 	cp a,#TK_NONE 
      008BDF 27 09            [ 1] 2119 	jreq 5$ 
      008BDF 1E 05            [ 1] 2120 4$:	cp a,#TK_RPAREN 
      008BE1 16 03            [ 1] 2121 	jreq 5$
      000BF4                       2122 	_unget_token 
      008BE3 CD 8B 01 1F 05   [ 1]    1      mov in,in.saved  
      008BE8 17               [ 1] 2123 5$:	pop a  
      008BE9 03               [ 4] 2124 	ret 
                                   2125 
                                   2126 ;--------------------------------
                                   2127 ;   BASIC commnands 
                                   2128 ;--------------------------------
                                   2129 
                                   2130 ;--------------------------------
                                   2131 ;  arithmetic and relational 
                                   2132 ;  routines
                                   2133 ;  operators precedence
                                   2134 ;  highest to lowest
                                   2135 ;  operators on same row have 
                                   2136 ;  same precedence and are executed
                                   2137 ;  from left to right.
                                   2138 ;	'*','/','%'
                                   2139 ;   '-','+'
                                   2140 ;   '=','>','<','>=','<=','<>','><'
                                   2141 ;   '<>' and '><' are equivalent for not equal.
                                   2142 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2143 
                                   2144 ;---------------------
                                   2145 ; return array element
                                   2146 ; address from @(expr)
                                   2147 ; input:
                                   2148 ;   A 		TK_ARRAY
                                   2149 ; output:
                                   2150 ;   A 		TK_INTGR
                                   2151 ;	X 		element address 
                                   2152 ;----------------------
      000BFB                       2153 get_array_element:
      008BEA 85 CD 8B         [ 4] 2154 	call func_args 
      008BED 63 5B            [ 1] 2155 	cp a,#1
      008BEF 04 81            [ 1] 2156 	jreq 1$
      008BF1 CC 07 28         [ 2] 2157 	jp syntax_error
      008BF1 52               [ 2] 2158 1$: popw x 
                                   2159 	; check for bounds 
      008BF2 05 17 04         [ 2] 2160 	cpw x,array_size 
      008BF5 23 05            [ 2] 2161 	jrule 3$
                                   2162 ; bounds {1..array_size}	
      008BF5 1F 02            [ 1] 2163 2$: ld a,#ERR_BAD_VALUE 
      008BF7 F6 A4 0F         [ 2] 2164 	jp tb_error 
      008BFA 6B               [ 2] 2165 3$: tnzw  x
      008BFB 01 16            [ 1] 2166 	jreq 2$ 
      008BFD 04               [ 2] 2167 	sllw x 
      008BFE 5C               [ 2] 2168 	pushw x 
      008BFF AE 16 90         [ 2] 2169 	ldw x,#tib
      008BFF 90 F6 27         [ 2] 2170 	subw x,(1,sp)
      000C1B                       2171 	_drop 2   
      008C02 1B 0D            [ 2]    1     addw sp,#2 
      008C04 01 27            [ 1] 2172 	ld a,#TK_INTGR
      008C06 0A               [ 4] 2173 	ret 
                                   2174 
                                   2175 
                                   2176 ;***********************************
                                   2177 ;   expression parse,execute 
                                   2178 ;***********************************
                                   2179 ;-----------------------------------
                                   2180 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2181 ;			 integer | function |
                                   2182 ;			 '('relation')' 
                                   2183 ; output:
                                   2184 ;   A    token attribute 
                                   2185 ;   X 	 integer
                                   2186 ; ---------------------------------
                           000001  2187 	NEG=1
                           000001  2188 	VSIZE=1
      000C20                       2189 factor:
      000C20                       2190 	_vars VSIZE 
      008C07 F1 26            [ 2]    1     sub sp,#VSIZE 
      008C09 07 90 5C         [ 4] 2191 	call next_token
      008C0C 5C 0A            [ 1] 2192 	cp a,#CMD_END  
      008C0E 01 20            [ 1] 2193 	jrult 16$
      008C10 EE 01            [ 1] 2194 1$:	ld (NEG,sp),a 
      008C11 A4 30            [ 1] 2195 	and a,#TK_GRP_MASK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008C11 1E 02            [ 1] 2196 	cp a,#TK_GRP_ADD 
      008C13 1D 00            [ 1] 2197 	jreq 2$
      008C15 02 4B            [ 1] 2198 	ld a,(NEG,sp)
      008C17 00 FE            [ 2] 2199 	jra 4$  
      000C35                       2200 2$:	
      008C19 84 27 1F         [ 4] 2201 	call next_token 
      000C38                       2202 4$:	
      008C1C 20 D7            [ 1] 2203 	cp a,#TK_IFUNC 
      008C1E 26 03            [ 1] 2204 	jrne 5$ 
      008C1E 1E               [ 4] 2205 	call (x) 
      008C1F 02 F6            [ 2] 2206 	jra 18$ 
      000C3F                       2207 5$:
      008C21 6B 01            [ 1] 2208 	cp a,#TK_INTGR
      008C23 A4 0F            [ 1] 2209 	jrne 6$
      008C25 4C C7            [ 2] 2210 	jra 18$
      000C45                       2211 6$:
      008C27 00 0E            [ 1] 2212 	cp a,#TK_ARRAY
      008C29 72 5F            [ 1] 2213 	jrne 10$
      008C2B 00 0D 72         [ 4] 2214 	call get_array_element
      008C2E BB               [ 2] 2215 	ldw x,(x)
      008C2F 00 0D            [ 2] 2216 	jra 18$ 
      000C4F                       2217 10$:
      008C31 FE 7B            [ 1] 2218 	cp a,#TK_VAR 
      008C33 01 4E            [ 1] 2219 	jrne 12$
      008C35 A4               [ 2] 2220 	ldw x,(x)
      008C36 0C 44            [ 2] 2221 	jra 18$
      000C56                       2222 12$:			
      008C38 44 AB            [ 1] 2223 	cp a,#TK_LPAREN
      008C3A 80 0C            [ 1] 2224 	jrne 16$
      008C3B CD 0D 18         [ 4] 2225 	call relation
      008C3B 5B               [ 2] 2226 	pushw x 
      008C3C 05 81            [ 1] 2227 	ld a,#TK_RPAREN 
      008C3E CD 0B BE         [ 4] 2228 	call expect
      008C3E 88               [ 2] 2229 	popw x 
      008C3F CD 88            [ 2] 2230 	jra 18$	
      000C66                       2231 16$:
      008C41 97               [ 1] 2232 	tnz a 
      008C42 11 01            [ 1] 2233 	jreq 20$ 
      000C69                       2234 	_unget_token
      008C44 27 03 CC 87 A8   [ 1]    1      mov in,in.saved  
      008C49 84               [ 1] 2235 	clr a 
      008C4A 81 09            [ 2] 2236 	jra 20$ 
      008C4B                       2237 18$: 
      008C4B A6 07            [ 1] 2238 	ld a,#TK_MINUS 
      008C4D CD 8C            [ 1] 2239 	cp a,(NEG,sp)
      008C4F 3E 01            [ 1] 2240 	jrne 19$
      008C50 50               [ 2] 2241 	negw x
      000C78                       2242 19$:
      008C50 4B 00            [ 1] 2243 	ld a,#TK_INTGR
      000C7A                       2244 20$:
      000C7A                       2245 	_drop VSIZE
      008C52 CD 8D            [ 2]    1     addw sp,#VSIZE 
      008C54 98               [ 4] 2246 	ret
                                   2247 
                                   2248 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2249 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   2250 ; output:
                                   2251 ;   A    	token attribute 
                                   2252 ;	X		integer
                                   2253 ;-----------------------------------
                           000001  2254 	N1=1   ; int16_t
                           000003  2255 	MULOP=3
                           000003  2256 	VSIZE=3
      000C7D                       2257 term:
      000C7D                       2258 	_vars VSIZE
      008C55 A1 00            [ 2]    1     sub sp,#VSIZE 
      008C57 27 20 A1         [ 4] 2259 	call factor
      008C5A 84               [ 1] 2260 	tnz a 
      008C5B 26 13            [ 1] 2261 	jreq term_exit 
      008C5D                       2262 term01:	 ; check for  operator 
      008C5D 84 90            [ 2] 2263 	ldw (N1,sp),x  ; save first factor 
      008C5F 85 89 90         [ 4] 2264 	call next_token
      008C62 89 4C            [ 1] 2265 	ld (MULOP,sp),a
      008C64 88 CD            [ 1] 2266 	cp a,#CMD_END
      008C66 88 97            [ 1] 2267 	jrult 8$
      008C68 A1 09            [ 1] 2268 	and a,#TK_GRP_MASK
      008C6A 27 E6            [ 1] 2269 	cp a,#TK_GRP_MULT
      008C6C A1 00            [ 1] 2270 	jreq 1$
      008C6E 27 09            [ 2] 2271 	jra 8$
      000C98                       2272 1$:	; got *|/|%
      008C70 A1 08 27         [ 4] 2273 	call factor
      008C73 05 55            [ 1] 2274 	cp a,#TK_INTGR
      008C75 00 03            [ 1] 2275 	jreq 2$
      008C77 00 02 84         [ 2] 2276 	jp syntax_error
      008C7A 81 93            [ 1] 2277 2$:	ldw y,x 
      008C7B 1E 01            [ 2] 2278 	ldw x,(N1,sp)
      008C7B CD 8C            [ 1] 2279 	ld a,(MULOP,sp) 
      008C7D 4B A1            [ 1] 2280 	cp a,#TK_MULT 
      008C7F 01 27            [ 1] 2281 	jrne 3$
      008C81 03 CC 87         [ 4] 2282 	call multiply 
      008C84 A8 85            [ 2] 2283 	jra term01
      008C86 C3 00            [ 1] 2284 3$: cp a,#TK_DIV 
      008C88 1F 23            [ 1] 2285 	jrne 4$ 
      008C8A 05 A6 0A         [ 4] 2286 	call divide 
      008C8D CC 87            [ 2] 2287 	jra term01 
      008C8F AA 5D 27         [ 4] 2288 4$: call modulo
      008C92 F8 58            [ 2] 2289 	jra term01 
      008C94 89 AE            [ 1] 2290 8$: ld a,(MULOP,sp)
      008C96 16 90            [ 1] 2291 	jreq 9$ 
      000CC3                       2292 	_unget_token
      008C98 72 F0 01 5B 02   [ 1]    1      mov in,in.saved  
      008C9D A6 84            [ 2] 2293 9$: ldw x,(N1,sp)
      008C9F 81 84            [ 1] 2294 	ld a,#TK_INTGR 	
      008CA0                       2295 term_exit:
      000CCC                       2296 	_drop VSIZE 
      008CA0 52 01            [ 2]    1     addw sp,#VSIZE 
      008CA2 CD               [ 4] 2297 	ret 
                                   2298 
                                   2299 ;-------------------------------
                                   2300 ;  expr ::= term [['+'|'-'] term]*
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2301 ;  result range {-32768..32767}
                                   2302 ;  output:
                                   2303 ;   A    token attribute 
                                   2304 ;   X	 integer   
                                   2305 ;-------------------------------
                           000001  2306 	N1=1
                           000003  2307 	N2=3 
                           000005  2308 	OP=5 
                           000005  2309 	VSIZE=5 
      000CCF                       2310 expression:
      000CCF                       2311 	_vars VSIZE 
      008CA3 88 97            [ 2]    1     sub sp,#VSIZE 
      008CA5 A1 02 25         [ 4] 2312 	call term
      008CA8 3D               [ 1] 2313 	tnz a 
      008CA9 6B 01            [ 1] 2314 	jreq expr_exit 
      008CAB A4 30            [ 2] 2315 1$:	ldw (N1,sp),x 
      008CAD A1 10 27         [ 4] 2316 	call next_token
      008CB0 04 7B            [ 1] 2317 	ld (OP,sp),a 
      008CB2 01 20            [ 1] 2318 	cp a,#CMD_END 
      008CB4 03 26            [ 1] 2319 	jrult 8$ 
      008CB5 A4 30            [ 1] 2320 	and a,#TK_GRP_MASK
      008CB5 CD 88            [ 1] 2321 	cp a,#TK_GRP_ADD 
      008CB7 97 02            [ 1] 2322 	jreq 2$ 
      008CB8 20 1E            [ 2] 2323 	jra 8$
      000CEA                       2324 2$: 
      008CB8 A1 81 26         [ 4] 2325 	call term
      008CBB 03 FD            [ 1] 2326 	cp a,#TK_INTGR
      008CBD 20 32            [ 1] 2327 	jreq 3$
      008CBF CC 07 28         [ 2] 2328 	jp syntax_error
      008CBF A1 84            [ 2] 2329 3$:	ldw (N2,sp),x 
      008CC1 26 02            [ 2] 2330 	ldw x,(N1,sp)
      008CC3 20 2C            [ 1] 2331 	ld a,(OP,sp)
      008CC5 A1 10            [ 1] 2332 	cp a,#TK_PLUS 
      008CC5 A1 06            [ 1] 2333 	jrne 4$
      008CC7 26 06 CD         [ 2] 2334 	addw x,(N2,sp)
      008CCA 8C 7B            [ 2] 2335 	jra 1$ 
      008CCC FE 20 22         [ 2] 2336 4$:	subw x,(N2,sp)
      008CCF 20 CF            [ 2] 2337 	jra 1$
      008CCF A1 85            [ 1] 2338 8$: ld a,(OP,sp)
      008CD1 26 03            [ 1] 2339 	jreq 9$ 
      000D0C                       2340 	_unget_token	
      008CD3 FE 20 1B 00 01   [ 1]    1      mov in,in.saved  
      008CD6 1E 01            [ 2] 2341 9$: ldw x,(N1,sp)
      008CD6 A1 07            [ 1] 2342 	ld a,#TK_INTGR	
      000D15                       2343 expr_exit:
      000D15                       2344 	_drop VSIZE 
      008CD8 26 0C            [ 2]    1     addw sp,#VSIZE 
      008CDA CD               [ 4] 2345 	ret 
                                   2346 
                                   2347 ;---------------------------------------------
                                   2348 ; rel ::= expr rel_op expr
                                   2349 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   2350 ;  relation return  integer , zero is false 
                                   2351 ;  output:
                                   2352 ;    A 		token attribute  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2353 ;	 X		integer 
                                   2354 ;---------------------------------------------
                           000001  2355 	N1=1
                           000003  2356 	RELOP=3
                           000003  2357 	VSIZE=3 
      000D18                       2358 relation: 
      000D18                       2359 	_vars VSIZE
      008CDB 8D 98            [ 2]    1     sub sp,#VSIZE 
      008CDD 89 A6 08         [ 4] 2360 	call expression
      008CE0 CD               [ 1] 2361 	tnz a 
      008CE1 8C 3E            [ 1] 2362 	jreq rel_exit
      008CE3 85 20            [ 2] 2363 	ldw (N1,sp),x 
                                   2364 ; expect rel_op or leave 
      008CE5 0B 08 17         [ 4] 2365 	call next_token 
      008CE6 6B 03            [ 1] 2366 	ld (RELOP,sp),a 
      008CE6 4D 27            [ 1] 2367 	and a,#TK_GRP_MASK
      008CE8 11 55            [ 1] 2368 	cp a,#TK_GRP_RELOP 
      008CEA 00 03            [ 1] 2369 	jrne 8$
      000D2D                       2370 2$:	; expect another expression
      008CEC 00 02 4F         [ 4] 2371 	call expression
      008CEF 20 09            [ 1] 2372 	cp a,#TK_INTGR
      008CF1 27 03            [ 1] 2373 	jreq 3$
      008CF1 A6 11 11         [ 2] 2374 	jp syntax_error 
      008CF4 01 26 01         [ 2] 2375 3$:	ldw acc16,x 
      008CF7 50 01            [ 2] 2376 	ldw x,(N1,sp) 
      008CF8 72 B0 00 0C      [ 2] 2377 	subw x,acc16
      008CF8 A6 84            [ 1] 2378 	jrne 4$
      008CFA 35 02 00 0D      [ 1] 2379 	mov acc8,#2 ; n1==n2
      008CFA 5B 01            [ 2] 2380 	jra 6$ 
      000D48                       2381 4$: 
      008CFC 81 06            [ 1] 2382 	jrsgt 5$  
      008CFD 35 04 00 0D      [ 1] 2383 	mov acc8,#4 ; n1<2 
      008CFD 52 03            [ 2] 2384 	jra 6$
      000D50                       2385 5$:
      008CFF CD 8C A0 4D      [ 1] 2386 	mov acc8,#1 ; n1>n2 
      000D54                       2387 6$:
      008D03 27               [ 1] 2388 	clrw x 
      008D04 47 00 0D         [ 1] 2389 	ld a, acc8  
      008D05 14 03            [ 1] 2390 	and a,(RELOP,sp)
      008D05 1F               [ 1] 2391 	tnz a 
      008D06 01 CD            [ 1] 2392 	jreq 10$
      008D08 88               [ 1] 2393 	incw x 
      008D09 97 6B            [ 2] 2394 	jra 10$  	
      008D0B 03 A1            [ 1] 2395 8$: ld a,(RELOP,sp)
      008D0D 02 25            [ 1] 2396 	jreq 9$
      000D64                       2397 	_unget_token
      008D0F 2F A4 30 A1 20   [ 1]    1      mov in,in.saved  
      000D69                       2398 9$: 
      008D14 27 02            [ 2] 2399 	ldw x,(N1,sp)
      000D6B                       2400 10$:
      008D16 20 27            [ 1] 2401 	ld a,#TK_INTGR
      008D18                       2402 rel_exit:
      000D6D                       2403 	_drop VSIZE
      008D18 CD 8C            [ 2]    1     addw sp,#VSIZE 
      008D1A A0               [ 4] 2404 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2405 
                                   2406 ;--------------------------------
                                   2407 ; BASIC: SHOW 
                                   2408 ; print stack content in hexadecimal bytes 
                                   2409 ; 16 bytes per row 
                                   2410 ;--------------------------------
      000D70                       2411 show:
      008D1B A1 84 27         [ 2] 2412 	ldw x,#cstk_prompt
      008D1E 03 CC 87         [ 4] 2413 	call puts 
      008D21 A8               [ 1] 2414 	ldw x,sp 
      008D22 90 93 1E         [ 2] 2415 	addw x,#3 ; ignore return address
      008D25 01 7B 03 A1      [ 2] 2416 	ldw y,#RAM_SIZE  
      008D29 20 26 05         [ 2] 2417 	ldw acc16,x 
      008D2C CD 8B 01 20      [ 2] 2418 	subw y,acc16
      008D30 D4 A1 21         [ 4] 2419 	call hex_dump
      008D33 26               [ 1] 2420 	clr a 
      008D34 05               [ 4] 2421 	ret
                                   2422 
      008D35 CD 8B BA 20 CB CD 8B  2423 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             D0 20 C6 7B 03 27 05
             55 00 03 00 02 1E 01
             A6 84 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   2424 
                                   2425 
                                   2426 ;--------------------------------------------
                                   2427 ; BASIC: HEX 
                                   2428 ; select hexadecimal base for integer print
                                   2429 ;---------------------------------------------
      008D4C                       2430 hex_base:
      008D4C 5B 03 81 0A      [ 1] 2431 	mov base,#16 
      008D4F 81               [ 4] 2432 	ret 
                                   2433 
                                   2434 ;--------------------------------------------
                                   2435 ; BASIC: DEC 
                                   2436 ; select decimal base for integer print
                                   2437 ;---------------------------------------------
      000DB6                       2438 dec_base:
      008D4F 52 05 CD 8C      [ 1] 2439 	mov base,#10
      008D53 FD               [ 4] 2440 	ret 
                                   2441 
                                   2442 ;------------------------
                                   2443 ; BASIC: FREE 
                                   2444 ; return free size in RAM 
                                   2445 ; output:
                                   2446 ;   A 		TK_INTGR
                                   2447 ;   X 	    size integer
                                   2448 ;--------------------------
      000DBB                       2449 free:
      008D54 4D 27 3E         [ 2] 2450 	ldw x,#tib 
      008D57 1F 01 CD 88      [ 2] 2451 	ldw y,txtbgn 
      008D5B 97 6B 05 A1      [ 2] 2452 	cpw y,#app_space
      008D5F 02 25            [ 1] 2453 	jrult 1$
      008D61 26 A4 30         [ 2] 2454 	subw x,#free_ram 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D64 A1 10            [ 2] 2455 	jra 2$ 
      000DCD                       2456 1$:	
      008D66 27 02 20 1E      [ 2] 2457 	subw x,txtend 
      008D6A A6 84            [ 1] 2458 2$:	ld a,#TK_INTGR
      008D6A CD               [ 4] 2459 	ret 
                                   2460 
                                   2461 ;------------------------------
                                   2462 ; BASIC: SIZE 
                                   2463 ; command that print 
                                   2464 ; program start addres and size 
                                   2465 ;------------------------------
      000DD4                       2466 cmd_size:
      008D6B 8C FD A1         [ 1] 2467 	push base 
      008D6E 84 27 03         [ 2] 2468 	ldw x,#PROG_ADDR 
      008D71 CC 87 A8         [ 4] 2469 	call puts 
      008D74 1F 03 1E         [ 2] 2470 	ldw x,txtbgn     
      008D77 01 7B 05 A1      [ 1] 2471 	mov base,#16 
      008D7B 10 26 05         [ 4] 2472 	call print_int
      008D7E 72 FB 03         [ 1] 2473 	pop base 
      008D81 20 D4 72         [ 2] 2474 	ldw x,#PROG_SIZE 
      008D84 F0 03 20         [ 4] 2475 	call puts 
      008D87 CF 7B 05         [ 2] 2476 	ldw x,txtend 
      008D8A 27 05 55 00      [ 2] 2477 	subw x,txtbgn 
      008D8E 03 00 02         [ 4] 2478 	call print_int
      008D91 1E 01 A6         [ 2] 2479 	ldw x,#STR_BYTES 
      008D94 84 20 43         [ 4] 2480 	call puts  
      008D95 81               [ 4] 2481 	ret 
                                   2482 
      008D95 5B 05 81 67 72 61 6D  2483 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      008D98 70 72 6F 67 72 61 6D  2484 PROG_SIZE: .asciz "program size: "
             20 73 69 7A 65 3A 20
             00
      008D98 52 03 CD 8D 4F 4D 27  2485 STR_BYTES: .asciz "bytes\n" 
                                   2486 
                                   2487 ;------------------------
                                   2488 ; BASIC: UBOUND  
                                   2489 ; return array variable size 
                                   2490 ; output:
                                   2491 ;   A 		TK_INTGR
                                   2492 ;   X 	    array size 
                                   2493 ;--------------------------
      000E29                       2494 ubound:
      008D9F 4D 1F 01         [ 4] 2495 	call free 
      008DA2 CD               [ 2] 2496 	srlw x 
      008DA3 88 97 6B         [ 2] 2497 	ldw array_size,x
      008DA6 03 A4            [ 1] 2498 	ld a,#TK_INTGR
      008DA8 30               [ 4] 2499 	ret 
                                   2500 
                                   2501 ;-----------------------------
                                   2502 ; BASIC: LET var=expr 
                                   2503 ; variable assignement 
                                   2504 ; output:
                                   2505 ;   A 		TK_NONE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2506 ;-----------------------------
      000E33                       2507 let::
      008DA9 A1 30 26         [ 4] 2508 	call next_token 
      008DAC 33 85            [ 1] 2509 	cp a,#TK_VAR 
      008DAD 27 0A            [ 1] 2510 	jreq let_var
      008DAD CD 8D            [ 1] 2511 	cp a,#TK_ARRAY 
      008DAF 4F A1            [ 1] 2512 	jreq  let_array
      008DB1 84 27 03         [ 2] 2513 	jp syntax_error
      000E41                       2514 let_array:
      008DB4 CC 87 A8         [ 4] 2515 	call get_array_element
      000E44                       2516 let_var:
      008DB7 CF               [ 2] 2517 	pushw x  
      008DB8 00 0D 1E         [ 4] 2518 	call next_token 
      008DBB 01 72            [ 1] 2519 	cp a,#TK_EQUAL
      008DBD B0 00            [ 1] 2520 	jreq 1$
      008DBF 0D 26 06         [ 2] 2521 	jp syntax_error
      000E4F                       2522 1$:	
      008DC2 35 02 00         [ 4] 2523 	call relation   
      008DC5 0E 20            [ 1] 2524 	cp a,#TK_INTGR 
      008DC7 0C 03            [ 1] 2525 	jreq 2$
      008DC8 CC 07 28         [ 2] 2526 	jp syntax_error
      000E59                       2527 2$:	
      008DC8 2C 06            [ 1] 2528 	ldw y,x 
      008DCA 35               [ 2] 2529 	popw x   
      008DCB 04               [ 2] 2530 	ldw (x),y   
      008DCC 00               [ 4] 2531 	ret 
                                   2532 
                                   2533 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2534 ; return program size 
                                   2535 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E5E                       2536 prog_size:
      008DCD 0E 20 04         [ 2] 2537 	ldw x,txtend 
      008DD0 72 B0 00 19      [ 2] 2538 	subw x,txtbgn 
      008DD0 35               [ 4] 2539 	ret 
                                   2540 
                                   2541 ;----------------------------
                                   2542 ; BASIC: LIST [[start][,end]]
                                   2543 ; list program lines 
                                   2544 ; form start to end 
                                   2545 ; if empty argument list then 
                                   2546 ; list all.
                                   2547 ;----------------------------
                           000001  2548 	FIRST=1
                           000003  2549 	LAST=3 
                           000005  2550 	LN_PTR=5
                           000006  2551 	VSIZE=6 
      000E66                       2552 list:
      008DD1 01 00 0E         [ 2] 2553 	ldw x,txtbgn 
      008DD4 C3 00 1B         [ 2] 2554 	cpw x,txtend 
      008DD4 5F C6            [ 1] 2555 	jrmi 1$
      008DD6 00               [ 4] 2556 	ret 
      000E6F                       2557 1$:	
      008DD7 0E 14 03         [ 2] 2558 	ldw x,#PROG_SIZE
      008DDA 4D 27 0E         [ 4] 2559 	call puts 
      008DDD 5C 20 0B         [ 2] 2560 	ldw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008DE0 7B 03 27 05      [ 2] 2561 	subw x,txtbgn 
      008DE4 55 00 03         [ 4] 2562 	call print_int 
      008DE7 00 02 22         [ 2] 2563 	ldw x,#STR_BYTES 
      008DE9 CD 20 43         [ 4] 2564 	call puts 
      000E85                       2565 	_vars VSIZE
      008DE9 1E 01            [ 2]    1     sub sp,#VSIZE 
      008DEB CE 00 19         [ 2] 2566 	ldw x,txtbgn 
      008DEB A6 84            [ 2] 2567 	ldw (LN_PTR,sp),x 
      008DED FE               [ 2] 2568 	ldw x,(x) 
      008DED 5B 03            [ 2] 2569 	ldw (FIRST,sp),x ; list from first line 
      008DEF 81 7F FF         [ 2] 2570 	ldw x,#MAX_LINENO ; biggest line number 
      008DF0 1F 03            [ 2] 2571 	ldw (LAST,sp),x 
      008DF0 AE 8E 0A         [ 4] 2572 	call arg_list
      008DF3 CD               [ 1] 2573 	tnz a
      008DF4 A0 C3            [ 1] 2574 	jreq list_loop 
      008DF6 96 1C            [ 1] 2575 	cp a,#2 
      008DF8 00 03            [ 1] 2576 	jreq 4$
      008DFA 90 AE            [ 1] 2577 	cp a,#1 
      008DFC 18 00            [ 1] 2578 	jreq first_line 
      008DFE CF 00 0D         [ 2] 2579 	jp syntax_error 
      008E01 72               [ 2] 2580 4$:	popw x 
      008E02 B2 00            [ 2] 2581 	ldw (LAST+2,sp),x 
      000EA8                       2582 first_line:
      008E04 0D               [ 2] 2583 	popw x
      008E05 CD 83            [ 2] 2584 	ldw (FIRST,sp),x 
      000EAB                       2585 lines_skip:
      008E07 CF 4F 81         [ 2] 2586 	ldw x,txtbgn
      008E0A 0A 63            [ 2] 2587 2$:	ldw (LN_PTR,sp),x 
      008E0C 6F 6E 74         [ 2] 2588 	cpw x,txtend 
      008E0F 65 6E            [ 1] 2589 	jrpl list_exit 
      008E11 74               [ 2] 2590 	ldw x,(x) ;line# 
      008E12 20 6F            [ 2] 2591 	cpw x,(FIRST,sp)
      008E14 66 20            [ 1] 2592 	jrpl list_loop 
      008E16 73 74            [ 2] 2593 	ldw x,(LN_PTR,sp) 
      008E18 61 63            [ 1] 2594 	ld a,(2,x)
      008E1A 6B 20 66         [ 1] 2595 	ld acc8,a 
      008E1D 72 6F 6D 20      [ 1] 2596 	clr acc16 
      008E21 74 6F 70 20      [ 2] 2597 	addw x,acc16
      008E25 74 6F            [ 2] 2598 	jra 2$ 
                                   2599 ; print loop
      000ECB                       2600 list_loop:
      008E27 20 62            [ 2] 2601 	ldw x,(LN_PTR,sp)
      008E29 6F 74            [ 1] 2602 	ld a,(2,x) 
      008E2B 74 6F 6D         [ 4] 2603 	call prt_basic_line
      008E2E 3A 0A            [ 2] 2604 	ldw x,(LN_PTR,sp)
      008E30 00 02            [ 1] 2605 	ld a,(2,x)
      008E31 C7 00 0D         [ 1] 2606 	ld acc8,a 
      008E31 35 10 00 0B      [ 1] 2607 	clr acc16 
      008E35 81 BB 00 0C      [ 2] 2608 	addw x,acc16
      008E36 C3 00 1B         [ 2] 2609 	cpw x,txtend 
      008E36 35 0A            [ 1] 2610 	jrpl list_exit
      008E38 00 0B            [ 2] 2611 	ldw (LN_PTR,sp),x
      008E3A 81               [ 2] 2612 	ldw x,(x)
      008E3B 13 03            [ 2] 2613 	cpw x,(LAST,sp)  
      008E3B AE 16            [ 1] 2614 	jrslt list_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      000EED                       2615 list_exit:
      008E3D 90 90 CE 00 1A   [ 1] 2616 	mov in,count 
      008E42 90 A3 AA         [ 2] 2617 	ldw x,#pad 
      008E45 80 25 05         [ 2] 2618 	ldw basicptr,x 
      000EF8                       2619 	_drop VSIZE 
      008E48 1D 00            [ 2]    1     addw sp,#VSIZE 
      008E4A 80               [ 4] 2620 	ret
                                   2621 
                                   2622 
                                   2623 ;--------------------------
                                   2624 ; BASIC: EDIT \E | \F
                                   2625 ;  copy program in FLASH 
                                   2626 ;  to RAM for edition 
                                   2627 ;-------------------------
      000EFB                       2628 edit:
      008E4B 20 04 CF         [ 4] 2629 	call qsign 
      008E4D 27 07            [ 1] 2630 	jreq 1$ 
      008E4D 72 B0 00         [ 2] 2631 	ldw x,#NOT_SAVED 
      008E50 1C A6 84         [ 4] 2632 	call puts 
      008E53 81               [ 4] 2633 	ret 
      008E54                       2634 1$: 
      008E54 3B 00 0B AE      [ 2] 2635 	ldw y,#app_sign ; source address 
      008E58 8E 81 CD         [ 2] 2636     ldw x,app_size  
      008E5B A0 C3 CE         [ 2] 2637 	addw x,#4 
      008E5E 00 1A 35         [ 2] 2638 	ldw acc16,x  ; bytes to copy 
      008E61 10 00 0B         [ 2] 2639 	ldw x,#rsign ; destination address 
      008E64 CD 88 F2         [ 4] 2640 	call move  
      008E67 32 00 0B         [ 2] 2641 	ldw x,#free_ram 
      008E6A AE 8E 93         [ 2] 2642 	ldw txtbgn,x 
      008E6D CD A0 C3 CE      [ 2] 2643 	addw x,rsize  
      008E71 00 1C 72         [ 2] 2644 	ldw txtend,x 
      008E74 B0               [ 4] 2645 	ret 
                                   2646 
      008E75 00 1A CD 88 F2 AE 8E  2647 NOT_SAVED: .asciz "No application saved.\n"
             A2 CD A0 C3 81 70 72
             6F 67 72 61 6D 20 61
             64 64
                                   2648 
                                   2649 ;--------------------------
                                   2650 ; decompile line from token list
                                   2651 ; and print it. 
                                   2652 ; input:
                                   2653 ;   A       stop at this position 
                                   2654 ;   X 		pointer at line
                                   2655 ; output:
                                   2656 ;   none 
                                   2657 ;--------------------------	
      000F3F                       2658 prt_basic_line:
      008E8C 72 65 73         [ 1] 2659 	ld count,a 
      008E8F 73 3A            [ 1] 2660 	ld a,(2,x)
      008E91 20 00 70         [ 1] 2661 	cp a,count 
      008E94 72 6F            [ 1] 2662 	jrpl 1$ 
      008E96 67 72 61         [ 1] 2663 	ld count,a 
      008E99 6D 20 73         [ 2] 2664 1$:	ldw basicptr,x 
      008E9C 69 7A 65 3A      [ 2] 2665 	ldw y,#tib  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008EA0 20 00 62         [ 4] 2666 	call decompile 
      008EA3 79 74 65         [ 4] 2667 	call puts 
      008EA6 73 0A            [ 1] 2668 	ld a,#CR 
      008EA8 00 02 B2         [ 4] 2669 	call putc 
      008EA9 81               [ 4] 2670 	ret 
                                   2671 
                                   2672 
                                   2673 
                                   2674 ;---------------------------------
                                   2675 ; BASIC: PRINT|? arg_list 
                                   2676 ; print values from argument list
                                   2677 ;----------------------------------
                           000001  2678 	CCOMMA=1
                           000001  2679 	VSIZE=1
      000F5F                       2680 print:
      000F5F                       2681 	_vars VSIZE 
      008EA9 CD 8E            [ 2]    1     sub sp,#VSIZE 
      000F61                       2682 reset_comma:
      008EAB 3B 54            [ 1] 2683 	clr (CCOMMA,sp)
      000F63                       2684 prt_loop:
      008EAD CF 00 1F         [ 4] 2685 	call next_token
      008EB0 A6 84            [ 1] 2686 	cp a,#CMD_END 
      008EB2 81 4F            [ 1] 2687 	jrult print_exit ; colon or end of line 
      008EB3 A1 02            [ 1] 2688 	cp a,#TK_QSTR
      008EB3 CD 88            [ 1] 2689 	jreq 1$
      008EB5 97 A1            [ 1] 2690 	cp a,#TK_CHAR 
      008EB7 85 27            [ 1] 2691 	jreq 2$ 
      008EB9 0A A1            [ 1] 2692 	cp a,#TK_CFUNC 
      008EBB 06 27            [ 1] 2693 	jreq 3$
      008EBD 03 CC            [ 1] 2694 	cp a,#TK_COMMA 
      008EBF 87 A8            [ 1] 2695 	jreq 4$
      008EC1 A1 0A            [ 1] 2696 	cp a,#TK_SHARP 
      008EC1 CD 8C            [ 1] 2697 	jreq 5$
      008EC3 7B 28            [ 2] 2698 	jra 7$ 
      008EC4                       2699 1$:	; print string 
      008EC4 89 CD 88         [ 4] 2700 	call puts
      008EC7 97 A1            [ 2] 2701 	jra reset_comma
      000F85                       2702 2$:	; print character 
      008EC9 32               [ 1] 2703 	ld a,xl 
      008ECA 27 03 CC         [ 4] 2704 	call putc 
      008ECD 87 A8            [ 2] 2705 	jra reset_comma 
      008ECF                       2706 3$: ; print character function value  	
      008ECF CD               [ 4] 2707 	call (x)
      008ED0 8D               [ 1] 2708 	ld a,xl 
      008ED1 98 A1 84         [ 4] 2709 	call putc
      008ED4 27 03            [ 2] 2710 	jra reset_comma 
      000F92                       2711 4$: ; set comma state 
      008ED6 CC 87            [ 1] 2712 	cpl (CCOMMA,sp)
      008ED8 A8 CD            [ 2] 2713 	jra prt_loop   
      008ED9                       2714 5$: ; # character must be followed by an integer   
      008ED9 90 93 85         [ 4] 2715 	call next_token
      008EDC FF 81            [ 1] 2716 	cp a,#TK_INTGR 
      008EDE 27 03            [ 1] 2717 	jreq 6$
      008EDE CE 00 1C         [ 2] 2718 	jp syntax_error 
      000FA0                       2719 6$: ; set tab width
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008EE1 72               [ 1] 2720 	ld a,xl 
      008EE2 B0 00            [ 1] 2721 	and a,#15 
      008EE4 1A 81 21         [ 1] 2722 	ld tab_width,a 
      008EE6 20 B9            [ 2] 2723 	jra reset_comma 
      000FA8                       2724 7$:	
      000FA8                       2725 	_unget_token 
      008EE6 CE 00 1A C3 00   [ 1]    1      mov in,in.saved  
      008EEB 1C 2B 01         [ 4] 2726 	call relation 
      008EEE 81 84            [ 1] 2727 	cp a,#TK_INTGR 
      008EEF 26 05            [ 1] 2728 	jrne print_exit 
      008EEF AE 8E 93         [ 4] 2729     call print_int 
      008EF2 CD A0            [ 2] 2730 	jra reset_comma 
      000FB9                       2731 print_exit:
      008EF4 C3 CE            [ 1] 2732 	tnz (CCOMMA,sp)
      008EF6 00 1C            [ 1] 2733 	jrne 9$
      008EF8 72 B0            [ 1] 2734 	ld a,#CR 
      008EFA 00 1A CD         [ 4] 2735     call putc 
      000FC2                       2736 9$:	_drop VSIZE 
      008EFD 88 F2            [ 2]    1     addw sp,#VSIZE 
      008EFF AE               [ 4] 2737 	ret 
                                   2738 
                                   2739 ;----------------------
                                   2740 ; 'save_context' and
                                   2741 ; 'rest_context' must be 
                                   2742 ; called at the same 
                                   2743 ; call stack depth 
                                   2744 ; i.e. SP must have the 
                                   2745 ; save value at  
                                   2746 ; entry point of both 
                                   2747 ; routine. 
                                   2748 ;---------------------
                           000004  2749 	CTXT_SIZE=4 ; size of saved data 
                                   2750 ;--------------------
                                   2751 ; save current BASIC
                                   2752 ; interpreter context 
                                   2753 ; on stack 
                                   2754 ;--------------------
      000FC5                       2755 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000FC5                       2756 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      000FC5                       2757 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      000FC5                       2758 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      000FC5                       2759 save_context:
      008F00 8E A2 CD         [ 2] 2760 	ldw x,basicptr 
      008F03 A0 C3            [ 2] 2761 	ldw (BPTR,sp),x
      008F05 52 06 CE         [ 1] 2762 	ld a,in 
      008F08 00 1A            [ 1] 2763 	ld (IN,sp),a
      008F0A 1F 05 FE         [ 1] 2764 	ld a,count 
      008F0D 1F 01            [ 1] 2765 	ld (CNT,sp),a  
      008F0F AE               [ 4] 2766 	ret
                                   2767 
                                   2768 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2769 ; restore previously saved 
                                   2770 ; BASIC interpreter context 
                                   2771 ; from stack 
                                   2772 ;-------------------------
      000FD5                       2773 rest_context:
      008F10 7F FF            [ 2] 2774 	ldw x,(BPTR,sp)
      008F12 1F 03 CD         [ 2] 2775 	ldw basicptr,x 
      008F15 8C 50            [ 1] 2776 	ld a,(IN,sp)
      008F17 4D 27 31         [ 1] 2777 	ld in,a
      008F1A A1 02            [ 1] 2778 	ld a,(CNT,sp)
      008F1C 27 07 A1         [ 1] 2779 	ld count,a  
      008F1F 01               [ 4] 2780 	ret
                                   2781 
                                   2782 
                                   2783 
                                   2784 ;------------------------------------------
                                   2785 ; BASIC: INPUT [string]var[,[string]var]
                                   2786 ; input value in variables 
                                   2787 ; [string] optionally can be used as prompt 
                                   2788 ;-----------------------------------------
                           000001  2789 	CX_BPTR=1
                           000003  2790 	CX_IN=3
                           000004  2791 	CX_CNT=4
                           000005  2792 	SKIP=5
                           000006  2793 	VAR_ADDR=6
                           000007  2794 	VSIZE=7
      000FE5                       2795 input_var:
      000FE5                       2796 	_vars VSIZE 
      008F20 27 06            [ 2]    1     sub sp,#VSIZE 
      000FE7                       2797 input_loop:
      008F22 CC 87            [ 1] 2798 	clr (SKIP,sp)
      008F24 A8 85 1F         [ 4] 2799 	call next_token 
      008F27 05 02            [ 1] 2800 	cp a,#TK_QSTR 
      008F28 26 08            [ 1] 2801 	jrne 1$ 
      008F28 85 1F 01         [ 4] 2802 	call puts 
      008F2B 03 05            [ 1] 2803 	cpl (SKIP,sp)
      008F2B CE 00 1A         [ 4] 2804 	call next_token 
      008F2E 1F 05            [ 1] 2805 1$: cp a,#TK_VAR  
      008F30 C3 00            [ 1] 2806 	jreq 2$ 
      008F32 1C 2A 38         [ 2] 2807 	jp syntax_error
      008F35 FE 13            [ 2] 2808 2$:	ldw (VAR_ADDR,sp),x 
      008F37 01 2A            [ 1] 2809 	tnz (SKIP,sp)
      008F39 11 1E            [ 1] 2810 	jrne 21$ 
      008F3B 05 E6 02         [ 4] 2811 	call var_name 
      008F3E C7 00 0E         [ 4] 2812 	call putc   
      00100B                       2813 21$:
      008F41 72 5F            [ 1] 2814 	ld a,#':
      008F43 00 0D 72         [ 4] 2815 	call putc 
      008F46 BB 00 0D         [ 4] 2816 	call save_context 
      008F49 20 E3 00 03      [ 1] 2817 	clr count  
      008F4B CD 21 48         [ 4] 2818 	call readln 
      008F4B 1E 05 E6         [ 2] 2819 	ldw x,#tib 
      008F4E 02 CD 8F         [ 1] 2820 	push count
      008F51 BF 1E            [ 1] 2821 	push #0 
      008F53 05 E6 02         [ 2] 2822 	addw x,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008F56 C7               [ 1] 2823 	incw x 
      001026                       2824 	_drop 2 
      008F57 00 0E            [ 2]    1     addw sp,#2 
      008F59 72 5F 00 0D      [ 1] 2825 	clr in 
      008F5D 72 BB 00         [ 4] 2826 	call get_token
      008F60 0D C3            [ 1] 2827 	cp a,#TK_INTGR
      008F62 00 1C            [ 1] 2828 	jreq 3$ 
      008F64 2A 07 1F         [ 4] 2829 	call rest_context 
      008F67 05 FE 13         [ 2] 2830 	jp syntax_error
      008F6A 03 2F            [ 2] 2831 3$: ldw y,(VAR_ADDR,sp) 
      008F6C DE FF            [ 2] 2832 	ldw (y),x 
      008F6D CD 0F D5         [ 4] 2833 	call rest_context
      008F6D 55 00 04         [ 4] 2834 	call next_token 
      008F70 00 02            [ 1] 2835 	cp a,#TK_COMMA 
      008F72 AE 16            [ 1] 2836 	jreq input_loop
      008F74 E0 CF            [ 1] 2837 	cp a,#TK_NONE 
      008F76 00 05            [ 1] 2838 	jreq input_exit  
      008F78 5B 06            [ 1] 2839 	cp a,#TK_COLON 
      008F7A 81 03            [ 1] 2840     jreq input_exit 
      008F7B CC 07 28         [ 2] 2841 	jp syntax_error 
      001052                       2842 input_exit:
      001052                       2843 	_drop VSIZE 
      008F7B CD 95            [ 2]    1     addw sp,#VSIZE 
      008F7D 4F               [ 4] 2844 	ret 
                                   2845 
                                   2846 
                                   2847 ;---------------------
                                   2848 ; BASIC: REMARK | ' 
                                   2849 ; skip comment to end of line 
                                   2850 ;---------------------- 
      001055                       2851 remark::
      008F7E 27 07 AE 8F A8   [ 1] 2852 	mov in,count 
      008F83 CD               [ 4] 2853  	ret 
                                   2854 
                                   2855 
                                   2856 ;---------------------
                                   2857 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2858 ; read in loop 'addr'  
                                   2859 ; apply & 'mask' to value 
                                   2860 ; loop while result==0.  
                                   2861 ; 'xor_mask' is used to 
                                   2862 ; invert the wait logic.
                                   2863 ; i.e. loop while not 0.
                                   2864 ;---------------------
                           000001  2865 	XMASK=1 
                           000002  2866 	MASK=2
                           000003  2867 	ADDR=3
                           000004  2868 	VSIZE=4
      00105B                       2869 wait: 
      00105B                       2870 	_vars VSIZE
      008F84 A0 C3            [ 2]    1     sub sp,#VSIZE 
      008F86 81 01            [ 1] 2871 	clr (XMASK,sp) 
      008F87 CD 0B D0         [ 4] 2872 	call arg_list 
      008F87 90 AE            [ 1] 2873 	cp a,#2
      008F89 AA 80            [ 1] 2874 	jruge 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008F8B CE AA 82         [ 2] 2875 	jp syntax_error 
      008F8E 1C 00            [ 1] 2876 0$:	cp a,#3
      008F90 04 CF            [ 1] 2877 	jrult 1$
      008F92 00               [ 2] 2878 	popw x 
      008F93 0D               [ 1] 2879 	ld a,xl
      008F94 AE 00            [ 1] 2880 	ld (XMASK,sp),a 
      008F96 7C               [ 2] 2881 1$: popw x ; mask 
      008F97 CD               [ 1] 2882 	ld a,xl 
      008F98 84 36            [ 1] 2883 	ld (MASK,sp),a 
      008F9A AE               [ 2] 2884 	popw x ; address 
      008F9B 00               [ 1] 2885 2$:	ld a,(x)
      008F9C 80 CF            [ 1] 2886 	and a,(MASK,sp)
      008F9E 00 1A            [ 1] 2887 	xor a,(XMASK,sp)
      008FA0 72 BB            [ 1] 2888 	jreq 2$ 
      00107D                       2889 	_drop VSIZE 
      008FA2 00 7E            [ 2]    1     addw sp,#VSIZE 
      008FA4 CF               [ 4] 2890 	ret 
                                   2891 
                                   2892 ;---------------------
                                   2893 ; BASIC: BSET addr,mask
                                   2894 ; set bits at 'addr' corresponding 
                                   2895 ; to those of 'mask' that are at 1.
                                   2896 ; arguments:
                                   2897 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2898 ;   mask        mask|addr
                                   2899 ; output:
                                   2900 ;	none 
                                   2901 ;--------------------------
      001080                       2902 bit_set:
      008FA5 00 1C 81         [ 4] 2903 	call arg_list 
      008FA8 4E 6F            [ 1] 2904 	cp a,#2	 
      008FAA 20 61            [ 1] 2905 	jreq 1$ 
      008FAC 70 70 6C         [ 2] 2906 	jp syntax_error
      00108A                       2907 1$: 
      008FAF 69               [ 2] 2908 	popw x ; mask 
      008FB0 63               [ 1] 2909 	ld a,xl 
      008FB1 61               [ 2] 2910 	popw x ; addr  
      008FB2 74               [ 1] 2911 	or a,(x)
      008FB3 69               [ 1] 2912 	ld (x),a
      008FB4 6F               [ 4] 2913 	ret 
                                   2914 
                                   2915 ;---------------------
                                   2916 ; BASIC: BRES addr,mask
                                   2917 ; reset bits at 'addr' corresponding 
                                   2918 ; to those of 'mask' that are at 1.
                                   2919 ; arguments:
                                   2920 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2921 ;   mask	    ~mask&*addr  
                                   2922 ; output:
                                   2923 ;	none 
                                   2924 ;--------------------------
      001090                       2925 bit_reset:
      008FB5 6E 20 73         [ 4] 2926 	call arg_list 
      008FB8 61 76            [ 1] 2927 	cp a,#2  
      008FBA 65 64            [ 1] 2928 	jreq 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008FBC 2E 0A 00         [ 2] 2929 	jp syntax_error
      008FBF                       2930 1$: 
      008FBF C7               [ 2] 2931 	popw x ; mask 
      008FC0 00               [ 1] 2932 	ld a,xl 
      008FC1 04               [ 1] 2933 	cpl a 
      008FC2 E6               [ 2] 2934 	popw x ; addr  
      008FC3 02               [ 1] 2935 	and a,(x)
      008FC4 C1               [ 1] 2936 	ld (x),a 
      008FC5 00               [ 4] 2937 	ret 
                                   2938 
                                   2939 ;---------------------
                                   2940 ; BASIC: BTOGL addr,mask
                                   2941 ; toggle bits at 'addr' corresponding 
                                   2942 ; to those of 'mask' that are at 1.
                                   2943 ; arguments:
                                   2944 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2945 ;   mask	    mask^*addr  
                                   2946 ; output:
                                   2947 ;	none 
                                   2948 ;--------------------------
      0010A1                       2949 bit_toggle:
      008FC6 04 2A 03         [ 4] 2950 	call arg_list 
      008FC9 C7 00            [ 1] 2951 	cp a,#2 
      008FCB 04 CF            [ 1] 2952 	jreq 1$ 
      008FCD 00 05 90         [ 2] 2953 	jp syntax_error
      008FD0 AE               [ 2] 2954 1$: popw x ; mask 
      008FD1 16               [ 1] 2955 	ld a,xl 
      008FD2 90               [ 2] 2956 	popw x ; addr  
      008FD3 CD               [ 1] 2957 	xor a,(x)
      008FD4 A8               [ 1] 2958 	ld (x),a 
      008FD5 BC               [ 4] 2959 	ret 
                                   2960 
                                   2961 
                                   2962 ;---------------------
                                   2963 ; BASIC: BTEST(addr,bit)
                                   2964 ; return bit value at 'addr' 
                                   2965 ; bit is in range {0..7}.
                                   2966 ; arguments:
                                   2967 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2968 ;   bit 	    bit position {0..7}  
                                   2969 ; output:
                                   2970 ;	none 
                                   2971 ;--------------------------
      0010B1                       2972 bit_test:
      008FD6 CD A0 C3         [ 4] 2973 	call func_args 
      008FD9 A6 0D            [ 1] 2974 	cp a,#2
      008FDB CD 83            [ 1] 2975 	jreq 0$
      008FDD 32 81 28         [ 2] 2976 	jp syntax_error
      008FDF                       2977 0$:	
      008FDF 52               [ 2] 2978 	popw x 
      008FE0 01               [ 1] 2979 	ld a,xl 
      008FE1 A4 07            [ 1] 2980 	and a,#7
      008FE1 0F               [ 1] 2981 	push a   
      008FE2 01 01            [ 1] 2982 	ld a,#1 
      008FE3 0D 01            [ 1] 2983 1$: tnz (1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008FE3 CD 88            [ 1] 2984 	jreq 2$
      008FE5 97               [ 1] 2985 	sll a 
      008FE6 A1 02            [ 1] 2986 	dec (1,sp)
      008FE8 25 4F            [ 2] 2987 	jra 1$
      0010CB                       2988 2$: _drop 1 
      008FEA A1 02            [ 2]    1     addw sp,#1 
      008FEC 27               [ 2] 2989 	popw x 
      008FED 12               [ 1] 2990 	and a,(x)
      008FEE A1 03            [ 1] 2991 	jreq 3$
      008FF0 27 13            [ 1] 2992 	ld a,#1 
      008FF2 A1               [ 1] 2993 3$:	clrw x 
      008FF3 82               [ 1] 2994 	ld xl,a 
      008FF4 27 15            [ 1] 2995 	ld a,#TK_INTGR
      008FF6 A1               [ 4] 2996 	ret
                                   2997 
                                   2998 
                                   2999 ;--------------------
                                   3000 ; BASIC: POKE addr,byte
                                   3001 ; put a byte at addr 
                                   3002 ;--------------------
      0010D8                       3003 poke:
      008FF7 09 27 18         [ 4] 3004 	call arg_list 
      008FFA A1 0A            [ 1] 3005 	cp a,#2
      008FFC 27 18            [ 1] 3006 	jreq 1$
      008FFE 20 28 28         [ 2] 3007 	jp syntax_error
      009000                       3008 1$:	
      009000 CD               [ 2] 3009 	popw x  
      009001 A0               [ 1] 3010     ld a,xl 
      009002 C3               [ 2] 3011 	popw x 
      009003 20               [ 1] 3012 	ld (x),a 
      009004 DC               [ 4] 3013 	ret 
                                   3014 
                                   3015 ;-----------------------
                                   3016 ; BASIC: PEEK(addr)
                                   3017 ; get the byte at addr 
                                   3018 ; input:
                                   3019 ;	none 
                                   3020 ; output:
                                   3021 ;	X 		value 
                                   3022 ;-----------------------
      009005                       3023 peek:
      009005 9F CD 83         [ 4] 3024 	call func_args
      009008 32 20            [ 1] 3025 	cp a,#1 
      00900A D6 03            [ 1] 3026 	jreq 1$
      00900B CC 07 28         [ 2] 3027 	jp syntax_error
      00900B FD               [ 2] 3028 1$: popw x 
      00900C 9F               [ 1] 3029 	ld a,(x)
      00900D CD               [ 1] 3030 	clrw x 
      00900E 83               [ 1] 3031 	ld xl,a 
      00900F 32 20            [ 1] 3032 	ld a,#TK_INTGR
      009011 CF               [ 4] 3033 	ret 
                                   3034 
                                   3035 ;---------------------------
                                   3036 ; BASIC IF expr : instructions
                                   3037 ; evaluate expr and if true 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3038 ; execute instructions on same line. 
                                   3039 ;----------------------------
      009012                       3040 if: 
      009012 03 01 20         [ 4] 3041 	call relation 
      009015 CD 84            [ 1] 3042 	cp a,#TK_INTGR
      009016 27 03            [ 1] 3043 	jreq 1$ 
      009016 CD 88 97         [ 2] 3044 	jp syntax_error
      009019 A1               [ 1] 3045 1$:	clr a 
      00901A 84               [ 2] 3046 	tnzw x 
      00901B 27 03            [ 1] 3047 	jrne 9$  
                                   3048 ;skip to next line
      00901D CC 87 A8 00 01   [ 1] 3049 	mov in,count
      009020 81               [ 4] 3050 9$:	ret 
                                   3051 
                                   3052 ;------------------------
                                   3053 ; BASIC: FOR var=expr 
                                   3054 ; set variable to expression 
                                   3055 ; leave variable address 
                                   3056 ; on stack and set
                                   3057 ; FLOOP bit in 'flags'
                                   3058 ;-----------------
                           000001  3059 	RETL1=1 ; return address  
                           000003  3060 	FSTEP=3  ; variable increment
                           000005  3061 	LIMIT=5 ; loop limit 
                           000007  3062 	CVAR=7   ; control variable 
                           000009  3063 	INW=9   ;  in.w saved
                           00000B  3064 	BPTR=11 ; baseptr saved
                           00000A  3065 	VSIZE=10  
      00110C                       3066 for: ; { -- var_addr }
      009020 9F               [ 2] 3067 	popw x ; call return address 
      00110D                       3068 	_vars VSIZE 
      009021 A4 0F            [ 2]    1     sub sp,#VSIZE 
      009023 C7               [ 2] 3069 	pushw x  ; RETL1 
      009024 00 22            [ 1] 3070 	ld a,#TK_VAR 
      009026 20 B9 BE         [ 4] 3071 	call expect
      009028 1F 07            [ 2] 3072 	ldw (CVAR,sp),x  ; control variable 
      009028 55 00 03         [ 4] 3073 	call let_var 
      00902B 00 02 CD 8D      [ 1] 3074 	bset flags,#FLOOP 
                                   3075 ; open space on stack for loop data 
      00902F 98               [ 1] 3076 	clrw x 
      009030 A1 84            [ 2] 3077 	ldw (BPTR,sp),x 
      009032 26 05            [ 2] 3078 	ldw (INW,sp),x 
      009034 CD 88 F2         [ 4] 3079 	call next_token 
      009037 20 A8            [ 1] 3080 	cp a,#TK_CMD 
      009039 27 03            [ 1] 3081 	jreq 1$
      009039 0D 01 26         [ 2] 3082 	jp syntax_error
      00112D                       3083 1$:  
      00903C 05 A6 0D         [ 2] 3084 	cpw x,#to 
      00903F CD 83            [ 1] 3085 	jreq to
      009041 32 5B 01         [ 2] 3086 	jp syntax_error 
                                   3087 
                                   3088 ;-----------------------------------
                                   3089 ; BASIC: TO expr 
                                   3090 ; second part of FOR loop initilization
                                   3091 ; leave limit on stack and set 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3092 ; FTO bit in 'flags'
                                   3093 ;-----------------------------------
      001135                       3094 to: ; { var_addr -- var_addr limit step }
      009044 81 04 00 20 03   [ 2] 3095 	btjt flags,#FLOOP,1$
      009045 CC 07 28         [ 2] 3096 	jp syntax_error
      009045 CE 00 05         [ 4] 3097 1$: call relation  
      009048 1F 03            [ 1] 3098 	cp a,#TK_INTGR 
      00904A C6 00            [ 1] 3099 	jreq 2$ 
      00904C 02 6B 05         [ 2] 3100 	jp syntax_error
      00904F C6 00            [ 2] 3101 2$: ldw (LIMIT,sp),x
                                   3102 ;	ldw x,in.w 
      009051 04 6B 06         [ 4] 3103 	call next_token
      009054 81 00            [ 1] 3104 	cp a,#TK_NONE  
      009055 27 0E            [ 1] 3105 	jreq 4$ 
      009055 1E 03            [ 1] 3106 	cp a,#TK_CMD
      009057 CF 00            [ 1] 3107 	jrne 3$
      009059 05 7B 05         [ 2] 3108 	cpw x,#step 
      00905C C7 00            [ 1] 3109 	jreq step
      001159                       3110 3$:	
      001159                       3111 	_unget_token   	 
      00905E 02 7B 06 C7 00   [ 1]    1      mov in,in.saved  
      00115E                       3112 4$:	
      009063 04 81 01         [ 2] 3113 	ldw x,#1   ; default step  
      009065 1F 03            [ 2] 3114 	ldw (FSTEP,sp),x 
      009065 52 07            [ 2] 3115 	jra store_loop_addr 
                                   3116 
                                   3117 
                                   3118 ;----------------------------------
                                   3119 ; BASIC: STEP expr 
                                   3120 ; optional third par of FOR loop
                                   3121 ; initialization. 	
                                   3122 ;------------------------------------
      009067                       3123 step: ; {var limit -- var limit step}
      009067 0F 05 CD 88 97   [ 2] 3124 	btjt flags,#FLOOP,1$
      00906C A1 02 26         [ 2] 3125 	jp syntax_error
      00906F 08 CD A0         [ 4] 3126 1$: call relation
      009072 C3 03            [ 1] 3127 	cp a,#TK_INTGR
      009074 05 CD            [ 1] 3128 	jreq 2$
      009076 88 97 A1         [ 2] 3129 	jp syntax_error
      009079 85 27            [ 2] 3130 2$:	ldw (FSTEP,sp),x ; step
                                   3131 ; leave loop back entry point on cstack 
                                   3132 ; cstack is 1 call deep from interpreter
      001179                       3133 store_loop_addr:
      00907B 03 CC 87         [ 2] 3134 	ldw x,basicptr  
      00907E A8 1F            [ 2] 3135 	ldw (BPTR,sp),x 
      009080 06 0D 05         [ 2] 3136 	ldw x,in.w 
      009083 26 06            [ 2] 3137 	ldw (INW,sp),x   
      009085 CD A8 93 CD      [ 1] 3138 	bres flags,#FLOOP 
      009089 83 32 00 1D      [ 1] 3139 	inc loop_depth  
      00908B 81               [ 4] 3140 	ret 
                                   3141 
                                   3142 ;--------------------------------
                                   3143 ; BASIC: NEXT var 
                                   3144 ; FOR loop control 
                                   3145 ; increment variable with step 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3146 ; and compare with limit 
                                   3147 ; loop if threshold not crossed.
                                   3148 ; else stack. 
                                   3149 ; and decrement 'loop_depth' 
                                   3150 ;--------------------------------
      00118C                       3151 next: ; {var limit step retl1 -- [var limit step ] }
      00908B A6 3A CD 83      [ 1] 3152 	tnz loop_depth 
      00908F 32 CD            [ 1] 3153 	jrne 1$ 
      009091 90 45 72         [ 2] 3154 	jp syntax_error 
      001195                       3155 1$: 
      009094 5F 00            [ 1] 3156 	ld a,#TK_VAR 
      009096 04 CD A1         [ 4] 3157 	call expect
                                   3158 ; check for good variable after NEXT 	 
      009099 C8 AE            [ 2] 3159 	cpw x,(CVAR,sp)
      00909B 16 90            [ 1] 3160 	jreq 2$  
      00909D 3B 00 04         [ 2] 3161 	jp syntax_error ; not the good one 
      0011A1                       3162 2$: ; increment variable 
      0090A0 4B               [ 2] 3163 	ldw x,(x)  ; get var value 
      0090A1 00 72 FB         [ 2] 3164 	addw x,(FSTEP,sp) ; var+step 
      0090A4 01 5C            [ 2] 3165 	ldw y,(CVAR,sp)
      0090A6 5B 02            [ 2] 3166 	ldw (y),x ; save var new value 
                                   3167 ; check sign of STEP  
      0090A8 72 5F            [ 1] 3168 	ld a,#0x80
      0090AA 00 02            [ 1] 3169 	bcp a,(FSTEP,sp)
      0090AC CD A5            [ 1] 3170 	jrpl 4$
                                   3171 ;negative step 
      0090AE E2 A1            [ 2] 3172 	cpw x,(LIMIT,sp)
      0090B0 84 27            [ 1] 3173 	jrslt loop_done
      0090B2 06 CD            [ 2] 3174 	jra loop_back 
      0011B5                       3175 4$: ; positive step
      0090B4 90 55            [ 2] 3176 	cpw x,(LIMIT,sp)
      0090B6 CC 87            [ 1] 3177 	jrsgt loop_done
      0011B9                       3178 loop_back:
      0090B8 A8 16            [ 2] 3179 	ldw x,(BPTR,sp)
      0090BA 06 90 FF         [ 2] 3180 	ldw basicptr,x 
      0090BD CD 90 55 CD 88   [ 2] 3181 	btjf flags,#FRUN,1$ 
      0090C2 97 A1            [ 1] 3182 	ld a,(2,x)
      0090C4 09 27 A0         [ 1] 3183 	ld count,a
      0090C7 A1 00            [ 2] 3184 1$:	ldw x,(INW,sp)
      0090C9 27 07 A1         [ 2] 3185 	ldw in.w,x 
      0090CC 0B               [ 4] 3186 	ret 
      0011CE                       3187 loop_done:
                                   3188 	; remove loop data from stack  
      0090CD 27               [ 2] 3189 	popw x
      0011CF                       3190 	_drop VSIZE 
      0090CE 03 CC            [ 2]    1     addw sp,#VSIZE 
      0090D0 87 A8 00 1D      [ 1] 3191 	dec loop_depth 
                                   3192 ;	pushw x 
                                   3193 ;	ret 
      0090D2 FC               [ 2] 3194 	jp (x)
                                   3195 
                                   3196 ;----------------------------
                                   3197 ; called by goto/gosub
                                   3198 ; to get target line number 
                                   3199 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0011D6                       3200 get_target_line:
      0090D2 5B 07 81         [ 4] 3201 	call relation 
      0090D5 A1 84            [ 1] 3202 	cp a,#TK_INTGR
      0090D5 55 00            [ 1] 3203 	jreq 1$
      0090D7 04 00 02         [ 2] 3204 	jp syntax_error
      0090DA 81               [ 1] 3205 1$:	clr a
      0090DB 90 CE 00 04      [ 2] 3206 	ldw y,basicptr 
      0090DB 52 04            [ 2] 3207 	ldw y,(y)
      0090DD 0F 01            [ 2] 3208 	pushw y 
      0090DF CD 8C            [ 2] 3209 	cpw x,(1,sp)
      0090E1 50 A1            [ 2] 3210 	addw sp,#2 
      0090E3 02 24            [ 1] 3211 	jrult 11$
      0090E5 03               [ 1] 3212 	inc a 
      0011F0                       3213 11$:	
      0090E6 CC 87 A8         [ 4] 3214 	call search_lineno  
      0090E9 A1               [ 2] 3215 	tnzw x 
      0090EA 03 25            [ 1] 3216 	jrne 2$ 
      0090EC 04 85            [ 1] 3217 	ld a,#ERR_NO_LINE 
      0090EE 9F 6B 01         [ 2] 3218 	jp tb_error 
      0090F1 85               [ 4] 3219 2$:	ret 
                                   3220 
                                   3221 ;------------------------
                                   3222 ; BASIC: GOTO line# 
                                   3223 ; jump to line# 
                                   3224 ; here cstack is 2 call deep from interpreter 
                                   3225 ;------------------------
      0011FC                       3226 goto:
      0090F2 9F 6B 02 85 F6   [ 2] 3227 	btjt flags,#FRUN,0$ 
      0090F7 14 02            [ 1] 3228 	ld a,#ERR_RUN_ONLY
      0090F9 18 01 27         [ 2] 3229 	jp tb_error 
      0090FC F9               [ 4] 3230 	ret 
      0090FD 5B 04 81         [ 4] 3231 0$:	call get_target_line
      009100                       3232 jp_to_target:
      009100 CD 8C 50         [ 2] 3233 	ldw basicptr,x 
      009103 A1 02            [ 1] 3234 	ld a,(2,x)
      009105 27 03 CC         [ 1] 3235 	ld count,a 
      009108 87 A8 00 01      [ 1] 3236 	mov in,#3 
      00910A 81               [ 4] 3237 	ret 
                                   3238 
                                   3239 
                                   3240 ;--------------------
                                   3241 ; BASIC: GOSUB line#
                                   3242 ; basic subroutine call
                                   3243 ; actual line# and basicptr 
                                   3244 ; are saved on cstack
                                   3245 ; here cstack is 2 call deep from interpreter 
                                   3246 ;--------------------
                           000003  3247 	RET_ADDR=3
                           000005  3248 	RET_INW=5
                           000004  3249 	VSIZE=4  
      001217                       3250 gosub:
      00910A 85 9F 85 FA F7   [ 2] 3251 	btjt flags,#FRUN,0$ 
      00910F 81 06            [ 1] 3252 	ld a,#ERR_RUN_ONLY
      009110 CC 07 2A         [ 2] 3253 	jp tb_error 
      009110 CD               [ 4] 3254 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009111 8C               [ 2] 3255 0$:	popw x 
      001223                       3256 	_vars VSIZE  
      009112 50 A1            [ 2]    1     sub sp,#VSIZE 
      009114 02               [ 2] 3257 	pushw x 
      009115 27 03 CC         [ 2] 3258 	ldw x,basicptr
      009118 87 A8            [ 2] 3259 	ldw (RET_ADDR,sp),x 
      00911A CD 11 D6         [ 4] 3260 	call get_target_line  
      00911A 85               [ 2] 3261 	pushw x 
      00911B 9F 43 85         [ 2] 3262 	ldw x,in.w 
      00911E F4 F7            [ 2] 3263 	ldw (RET_INW+2,sp),x
      009120 81               [ 2] 3264 	popw x 
      009121 20 D3            [ 2] 3265 	jra jp_to_target
                                   3266 
                                   3267 ;------------------------
                                   3268 ; BASIC: RETURN 
                                   3269 ; exit from a subroutine 
                                   3270 ; 
                                   3271 ;------------------------
      001237                       3272 return:
      009121 CD 8C 50 A1 02   [ 2] 3273 	btjt flags,#FRUN,0$ 
      009126 27 03            [ 1] 3274 	ld a,#ERR_RUN_ONLY
      009128 CC 87 A8         [ 2] 3275 	jp tb_error 
      001241                       3276 0$:	
      00912B 85 9F            [ 2] 3277 	ldw x,(RET_ADDR,sp) 
      00912D 85 F8 F7         [ 2] 3278 	ldw basicptr,x
      009130 81 02            [ 1] 3279 	ld a,(2,x)
      009131 C7 00 03         [ 1] 3280 	ld count,a  
      009131 CD 8C            [ 2] 3281 	ldw x,(RET_INW,sp)
      009133 4B A1 02         [ 2] 3282 	ldw in.w,x 
      009136 27               [ 2] 3283 	popw x 
      001251                       3284 	_drop VSIZE 
      009137 03 CC            [ 2]    1     addw sp,#VSIZE 
      009139 87               [ 2] 3285 	pushw x
      00913A A8               [ 4] 3286 	ret  
                                   3287 
                                   3288 
                                   3289 ;----------------------------------
                                   3290 ; BASIC: RUN
                                   3291 ; run BASIC program in RAM
                                   3292 ;----------------------------------- 
      00913B                       3293 run: 
      00913B 85 9F A4 07 88   [ 2] 3294 	btjf flags,#FRUN,0$  
      009140 A6               [ 1] 3295 	clr a 
      009141 01               [ 4] 3296 	ret
      00125C                       3297 0$: 
      009142 0D 01 27 05 48   [ 2] 3298 	btjf flags,#FBREAK,1$
      001261                       3299 	_drop 2 
      009147 0A 01            [ 2]    1     addw sp,#2 
      009149 20 F7 5B         [ 4] 3300 	call rest_context
      001266                       3301 	_drop CTXT_SIZE 
      00914C 01 85            [ 2]    1     addw sp,#CTXT_SIZE 
      00914E F4 27 02 A6      [ 1] 3302 	bres flags,#FBREAK 
      009152 01 5F 97 A6      [ 1] 3303 	bset flags,#FRUN 
      009156 84 81 CB         [ 2] 3304 	jp interpreter 
      009158 CE 00 19         [ 2] 3305 1$:	ldw x,txtbgn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009158 CD 8C 50         [ 2] 3306 	cpw x,txtend 
      00915B A1 02            [ 1] 3307 	jrmi run_it 
      00915D 27 03 CC         [ 2] 3308 	ldw x,#err_no_prog
      009160 87 A8 43         [ 4] 3309 	call puts 
      009162 55 00 03 00 01   [ 1] 3310 	mov in,count
      009162 85               [ 4] 3311 	ret 
      001287                       3312 run_it:	 
      009163 9F 85 F7         [ 4] 3313     call ubound 
      00128A                       3314 	_drop 2 ; drop return address 
      009166 81 02            [ 2]    1     addw sp,#2 
                                   3315 ; clear data pointer 
      009167 5F               [ 1] 3316 	clrw x 
      009167 CD 8C 4B         [ 2] 3317 	ldw data_ptr,x 
      00916A A1 01 27 03      [ 1] 3318 	clr data_ofs 
      00916E CC 87 A8 85      [ 1] 3319 	clr data_len 
                                   3320 ; initialize BASIC pointer 
      009172 F6 5F 97         [ 2] 3321 	ldw x,txtbgn 
      009175 A6 84 81         [ 2] 3322 	ldw basicptr,x 
      009178 E6 02            [ 1] 3323 	ld a,(2,x)
      009178 CD 8D 98         [ 1] 3324 	ld count,a
      00917B A1 84 27 03      [ 1] 3325 	mov in,#3	
      00917F CC 87 A8 4F      [ 1] 3326 	bset flags,#FRUN 
      009183 5D 26 05         [ 2] 3327 	jp interpreter 
                                   3328 
                                   3329 
                                   3330 ;----------------------
                                   3331 ; BASIC: END
                                   3332 ; end running program
                                   3333 ;---------------------- 
      0012AE                       3334 cmd_end: 
                                   3335 ; clean stack 
      009186 55 00 04         [ 2] 3336 	ldw x,#STACK_EMPTY
      009189 00               [ 1] 3337 	ldw sp,x 
      00918A 02 81 AC         [ 2] 3338 	jp warm_start
                                   3339 
                                   3340 ;-----------------
                                   3341 ; 1 Khz beep 
                                   3342 ;-----------------
      00918C                       3343 beep_1khz:: 
      00918C 85 52 0A         [ 2] 3344 	ldw x,#100
      00918F 89 A6 85 CD      [ 2] 3345 	ldw y,#1000
      009193 8C 3E            [ 2] 3346 	jra beep
                                   3347 
                                   3348 ;-----------------------
                                   3349 ; BASIC: TONE expr1,expr2
                                   3350 ; used TIMER2 channel 1
                                   3351 ; to produce a tone 
                                   3352 ; arguments:
                                   3353 ;    expr1   frequency 
                                   3354 ;    expr2   duration msec.
                                   3355 ;---------------------------
      0012BE                       3356 tone:
      009195 1F 07 CD         [ 4] 3357 	call arg_list 
      009198 8E C4            [ 1] 3358 	cp a,#2 
      00919A 72 14            [ 1] 3359 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00919C 00 21 5F         [ 2] 3360 	jp syntax_error 
      0012C8                       3361 1$: 
      00919F 1F               [ 2] 3362 	popw x ; duration
      0091A0 0B 1F            [ 2] 3363 	popw y ; frequency 
      0012CB                       3364 beep:  
      0091A2 09               [ 2] 3365 	pushw x 
      0091A3 CD 88 97         [ 2] 3366 	ldw x,#TIM2_CLK_FREQ
      0091A6 A1               [ 2] 3367 	divw x,y 
                                   3368 ; round to nearest integer 
      0091A7 80 27 03 CC      [ 2] 3369 	cpw y,#TIM2_CLK_FREQ/2
      0091AB 87 A8            [ 1] 3370 	jrmi 2$
      0091AD 5C               [ 1] 3371 	incw x 
      0012D7                       3372 2$:	 
      0091AD A3               [ 1] 3373 	ld a,xh 
      0091AE 91 B5 27         [ 1] 3374 	ld TIM2_ARRH,a 
      0091B1 03               [ 1] 3375 	ld a,xl 
      0091B2 CC 87 A8         [ 1] 3376 	ld TIM2_ARRL,a 
                                   3377 ; 50% duty cycle 
      0091B5 8C               [ 1] 3378 	ccf 
      0091B5 72               [ 2] 3379 	rrcw x 
      0091B6 04               [ 1] 3380 	ld a,xh 
      0091B7 00 21 03         [ 1] 3381 	ld TIM2_CCR1H,a 
      0091BA CC               [ 1] 3382 	ld a,xl
      0091BB 87 A8 CD         [ 1] 3383 	ld TIM2_CCR1L,a
      0091BE 8D 98 A1 84      [ 1] 3384 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0091C2 27 03 CC 87      [ 1] 3385 	bset TIM2_CR1,#TIM2_CR1_CEN
      0091C6 A8 1F 05 CD      [ 1] 3386 	bset TIM2_EGR,#TIM2_EGR_UG
      0091CA 88               [ 2] 3387 	popw x 
      0091CB 97 A1 00         [ 4] 3388 	call pause02
      0091CE 27 0E A1 80      [ 1] 3389 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0091D2 26 05 A3 91      [ 1] 3390 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0091D6 E5               [ 4] 3391 	ret 
                                   3392 
                                   3393 ;-------------------------------
                                   3394 ; BASIC: ADCON 0|1 [,divisor]  
                                   3395 ; disable/enanble ADC 
                                   3396 ;-------------------------------
                           000003  3397 	ONOFF=3 
                           000001  3398 	DIVSOR=1
                           000004  3399 	VSIZE=4 
      001302                       3400 power_adc:
      0091D7 27 0C D0         [ 4] 3401 	call arg_list 
      0091D9 A1 02            [ 1] 3402 	cp a,#2	
      0091D9 55 00            [ 1] 3403 	jreq 1$
      0091DB 03 00            [ 1] 3404 	cp a,#1 
      0091DD 02 03            [ 1] 3405 	jreq 0$ 
      0091DE CC 07 28         [ 2] 3406 	jp syntax_error 
      0091DE AE 00 01         [ 2] 3407 0$: ldw x,#0
      0091E1 1F               [ 2] 3408 	pushw x  ; divisor 
      0091E2 03 20            [ 2] 3409 1$: ldw x,(ONOFF,sp)
      0091E4 14               [ 2] 3410 	tnzw x 
      0091E5 27 1A            [ 1] 3411 	jreq 2$ 
      0091E5 72 04            [ 2] 3412 	ldw x,(DIVSOR,sp) ; divisor 
      0091E7 00               [ 1] 3413 	ld a,xl
      0091E8 21 03            [ 1] 3414 	and a,#7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0091EA CC               [ 1] 3415 	swap a 
      0091EB 87 A8 CD         [ 1] 3416 	ld ADC_CR1,a
      0091EE 8D 98 A1 84      [ 1] 3417 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0091F2 27 03 CC 87      [ 1] 3418 	bset ADC_CR1,#ADC_CR1_ADON 
      00132A                       3419 	_usec_dly 7 
      0091F6 A8 1F 03         [ 2]    1     ldw x,#(16*7-2)/4
      0091F9 5A               [ 2]    2     decw x
      0091F9 CE               [ 1]    3     nop 
      0091FA 00 05            [ 1]    4     jrne .-4
      0091FC 1F 0B            [ 2] 3420 	jra 3$
      0091FE CE 00 01 1F      [ 1] 3421 2$: bres ADC_CR1,#ADC_CR1_ADON
      009202 09 72 15 00      [ 1] 3422 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00133B                       3423 3$:	_drop VSIZE 
      009206 21 72            [ 2]    1     addw sp,#VSIZE 
      009208 5C               [ 4] 3424 	ret
                                   3425 
                                   3426 ;-----------------------------
                                   3427 ; BASIC: ADCREAD (channel)
                                   3428 ; read adc channel {0..5}
                                   3429 ; output:
                                   3430 ;   A 		TK_INTGR 
                                   3431 ;   X 		value 
                                   3432 ;-----------------------------
      00133E                       3433 analog_read:
      009209 00 1E 81         [ 4] 3434 	call func_args 
      00920C A1 01            [ 1] 3435 	cp a,#1 
      00920C 72 5D            [ 1] 3436 	jreq 1$
      00920E 00 1E 26         [ 2] 3437 	jp syntax_error
      009211 03               [ 2] 3438 1$: popw x 
      009212 CC 87 A8         [ 2] 3439 	cpw x,#5 
      009215 23 05            [ 2] 3440 	jrule 2$
      009215 A6 85            [ 1] 3441 	ld a,#ERR_BAD_VALUE
      009217 CD 8C 3E         [ 2] 3442 	jp tb_error 
      00921A 13               [ 1] 3443 2$: ld a,xl
      00921B 07 27 03         [ 1] 3444 	ld acc8,a 
      00921E CC 87            [ 1] 3445 	ld a,#5
      009220 A8 00 0D         [ 1] 3446 	sub a,acc8 
      009221 C7 54 00         [ 1] 3447 	ld ADC_CSR,a
      009221 FE 72 FB 03      [ 1] 3448 	bset ADC_CR2,#ADC_CR2_ALIGN
      009225 16 07 90 FF      [ 1] 3449 	bset ADC_CR1,#ADC_CR1_ADON
      009229 A6 80 15 03 2A   [ 2] 3450 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00922E 06 13 05         [ 2] 3451 	ldw x,ADC_DRH
      009231 2F 1B            [ 1] 3452 	ld a,#TK_INTGR
      009233 20               [ 4] 3453 	ret 
                                   3454 
                                   3455 ;-----------------------
                                   3456 ; BASIC: DREAD(pin)
                                   3457 ; Arduino pins 
                                   3458 ; read state of a digital pin 
                                   3459 ; pin# {0..15}
                                   3460 ; output:
                                   3461 ;    A 		TK_INTGR
                                   3462 ;    X      0|1 
                                   3463 ;-------------------------
                           000001  3464 	PINNO=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                           000001  3465 	VSIZE=1
      001372                       3466 digital_read:
      001372                       3467 	_vars VSIZE 
      009234 04 01            [ 2]    1     sub sp,#VSIZE 
      009235 CD 0B CB         [ 4] 3468 	call func_args
      009235 13 05            [ 1] 3469 	cp a,#1
      009237 2C 15            [ 1] 3470 	jreq 1$
      009239 CC 07 28         [ 2] 3471 	jp syntax_error
      009239 1E               [ 2] 3472 1$: popw x 
      00923A 0B CF 00         [ 2] 3473 	cpw x,#15 
      00923D 05 72            [ 2] 3474 	jrule 2$
      00923F 01 00            [ 1] 3475 	ld a,#ERR_BAD_VALUE
      009241 21 05 E6         [ 2] 3476 	jp tb_error 
      009244 02 C7 00         [ 4] 3477 2$:	call select_pin 
      009247 04 1E            [ 1] 3478 	ld (PINNO,sp),a
      009249 09 CF            [ 1] 3479 	ld a,(GPIO_IDR,x)
      00924B 00 01            [ 1] 3480 	tnz (PINNO,sp)
      00924D 81 05            [ 1] 3481 	jreq 8$
      00924E 44               [ 1] 3482 3$: srl a 
      00924E 85 5B            [ 1] 3483 	dec (PINNO,sp)
      009250 0A 72            [ 1] 3484 	jrne 3$ 
      009252 5A 00            [ 1] 3485 8$: and a,#1 
      009254 1E               [ 1] 3486 	clrw x 
      009255 FC               [ 1] 3487 	ld xl,a 
      009256 A6 84            [ 1] 3488 	ld a,#TK_INTGR
      00139F                       3489 	_drop VSIZE
      009256 CD 8D            [ 2]    1     addw sp,#VSIZE 
      009258 98               [ 4] 3490 	ret
                                   3491 
                                   3492 
                                   3493 ;-----------------------
                                   3494 ; BASIC: DWRITE pin,0|1
                                   3495 ; Arduino pins 
                                   3496 ; write to a digital pin 
                                   3497 ; pin# {0..15}
                                   3498 ; output:
                                   3499 ;    A 		TK_INTGR
                                   3500 ;    X      0|1 
                                   3501 ;-------------------------
                           000001  3502 	PINNO=1
                           000002  3503 	PINVAL=2
                           000002  3504 	VSIZE=2
      0013A2                       3505 digital_write:
      0013A2                       3506 	_vars VSIZE 
      009259 A1 84            [ 2]    1     sub sp,#VSIZE 
      00925B 27 03 CC         [ 4] 3507 	call arg_list  
      00925E 87 A8            [ 1] 3508 	cp a,#2 
      009260 4F 90            [ 1] 3509 	jreq 1$
      009262 CE 00 05         [ 2] 3510 	jp syntax_error
      009265 90               [ 2] 3511 1$: popw x 
      009266 FE               [ 1] 3512 	ld a,xl 
      009267 90 89            [ 1] 3513 	ld (PINVAL,sp),a
      009269 13               [ 2] 3514 	popw x 
      00926A 01 5B 02         [ 2] 3515 	cpw x,#15 
      00926D 25 01            [ 2] 3516 	jrule 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      00926F 4C 0A            [ 1] 3517 	ld a,#ERR_BAD_VALUE
      009270 CC 07 2A         [ 2] 3518 	jp tb_error 
      009270 CD A3 AB         [ 4] 3519 2$:	call select_pin 
      009273 5D 26            [ 1] 3520 	ld (PINNO,sp),a 
      009275 05 A6            [ 1] 3521 	ld a,#1
      009277 05 CC            [ 1] 3522 	tnz (PINNO,sp)
      009279 87 AA            [ 1] 3523 	jreq 4$
      00927B 81               [ 1] 3524 3$: sll a
      00927C 0A 01            [ 1] 3525 	dec (PINNO,sp)
      00927C 72 00            [ 1] 3526 	jrne 3$
      00927E 00 21            [ 1] 3527 4$: tnz (PINVAL,sp)
      009280 06 A6            [ 1] 3528 	jrne 5$
      009282 06               [ 1] 3529 	cpl a 
      009283 CC 87            [ 1] 3530 	and a,(GPIO_ODR,x)
      009285 AA 81            [ 2] 3531 	jra 8$
      009287 CD 92            [ 1] 3532 5$: or a,(GPIO_ODR,x)
      009289 56 00            [ 1] 3533 8$: ld (GPIO_ODR,x),a 
      00928A                       3534 	_drop VSIZE 
      00928A CF 00            [ 2]    1     addw sp,#VSIZE 
      00928C 05               [ 4] 3535 	ret
                                   3536 
                                   3537 
                                   3538 ;-----------------------
                                   3539 ; BASIC: STOP
                                   3540 ; stop progam execution  
                                   3541 ; without resetting pointers 
                                   3542 ; the program is resumed
                                   3543 ; with RUN 
                                   3544 ;-------------------------
      0013DD                       3545 stop:
      00928D E6 02 C7 00 04   [ 2] 3546 	btjt flags,#FRUN,2$
      009292 35               [ 1] 3547 	clr a
      009293 03               [ 4] 3548 	ret 
      0013E4                       3549 2$:	 
                                   3550 ; create space on cstack to save context 
      009294 00 02 81         [ 2] 3551 	ldw x,#break_point 
      009297 CD 20 43         [ 4] 3552 	call puts 
      0013EA                       3553 	_drop 2 ;drop return address 
      009297 72 00            [ 2]    1     addw sp,#2 
      0013EC                       3554 	_vars CTXT_SIZE ; context size 
      009299 00 21            [ 2]    1     sub sp,#CTXT_SIZE 
      00929B 06 A6 06         [ 4] 3555 	call save_context 
      00929E CC 87 AA         [ 2] 3556 	ldw x,#tib 
      0092A1 81 85 52         [ 2] 3557 	ldw basicptr,x
      0092A4 04               [ 1] 3558 	clr (x)
      0092A5 89 CE 00 05      [ 1] 3559 	clr count  
      0092A9 1F               [ 1] 3560 	clrw x 
      0092AA 03 CD 92         [ 2] 3561 	ldw in.w,x
      0092AD 56 89 CE 00      [ 1] 3562 	bres flags,#FRUN 
      0092B1 01 1F 07 85      [ 1] 3563 	bset flags,#FBREAK
      0092B5 20 D3 CB         [ 2] 3564 	jp interpreter 
      0092B7 0A 62 72 65 61 6B 20  3565 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



             0A 00
                                   3566 
                                   3567 ;-----------------------
                                   3568 ; BASIC: NEW
                                   3569 ; from command line only 
                                   3570 ; free program memory
                                   3571 ; and clear variables 
                                   3572 ;------------------------
      001429                       3573 new: 
      0092B7 72 00 00 21 05   [ 2] 3574 	btjf flags,#FRUN,0$ 
      0092BC A6               [ 4] 3575 	ret 
      00142F                       3576 0$:	
      0092BD 06 CC 87         [ 4] 3577 	call clear_basic 
      0092C0 AA               [ 4] 3578 	ret 
                                   3579 
                                   3580 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3581 ;;;  flash memory operations
                                   3582 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3583 
                                   3584 ;--------------------------
                                   3585 ; align farptr to BLOCK_SIZE 
                                   3586 ;---------------------------
      0092C1                       3587 row_align:
      0092C1 1E 03            [ 1] 3588 	ld a,#0x7f 
      0092C3 CF 00 05         [ 1] 3589 	and a,farptr+2 
      0092C6 E6 02            [ 1] 3590 	jreq 1$ 
      0092C8 C7 00 04         [ 2] 3591 	ldw x,farptr+1 
      0092CB 1E 05 CF         [ 2] 3592 	addw x,#BLOCK_SIZE 
      0092CE 00 01            [ 1] 3593 	jrnc 0$
      0092D0 85 5B 04 89      [ 1] 3594 	inc farptr 
      0092D4 81               [ 1] 3595 0$: ld a,xl 
      0092D5 A4 80            [ 1] 3596 	and a,#0x80
      0092D5 72               [ 1] 3597 	ld xl,a
      0092D6 01 00 21         [ 2] 3598 	ldw farptr+1,x  	
      0092D9 02               [ 4] 3599 1$:	ret
                                   3600 
                                   3601 ;--------------------
                                   3602 ; input:
                                   3603 ;   X     increment 
                                   3604 ; output:
                                   3605 ;   farptr  incremented 
                                   3606 ;---------------------
      00144E                       3607 incr_farptr:
      0092DA 4F 81 00 17      [ 2] 3608 	addw x,farptr+1 
      0092DC 24 04            [ 1] 3609 	jrnc 1$
      0092DC 72 09 00 21      [ 1] 3610 	inc farptr 
      0092E0 12 5B 02         [ 2] 3611 1$:	ldw farptr+1,x  
      0092E3 CD               [ 4] 3612 	ret 
                                   3613 
                                   3614 ;-----------------------------------
                                   3615 ; scan block for non zero byte 
                                   3616 ; block are 128 bytes 
                                   3617 ; input:
                                   3618 ;    farptr     address block  
                                   3619 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3620 ;     A     0 cleared, other not cleared  
                                   3621 ;-----------------------------------
      00145C                       3622 scan_block:
      0092E4 90               [ 1] 3623 	clrw x 
      0092E5 55 5B 04 72      [ 5] 3624 1$: ldf a,([farptr],x) 
      0092E9 19 00            [ 1] 3625 	jrne 2$
      0092EB 21               [ 1] 3626 	incw x 
      0092EC 72 10 00         [ 2] 3627 	cpw x,#BLOCK_SIZE 
      0092EF 21 CC            [ 1] 3628 	jrult 1$ 
      0092F1 88               [ 4] 3629 2$:	ret 
                                   3630 
                                   3631 
                                   3632 
                                   3633 ;-----------------------------------
                                   3634 ; BASIC: ERASE \E | \F 
                                   3635 ; erase all block in range from 
                                   3636 ;  'app_space' to FLASH end (0x20000)
                                   3637 ;  or all EEPROM 
                                   3638 ; that contains a non zero byte.  
                                   3639 ;-----------------------------------
                           000001  3640 	LIMIT=1 
                           000003  3641 	VSIZE = 3 
      00146A                       3642 erase:
      0092F2 4B CE 00 1A      [ 1] 3643 	clr farptr 
      00146E                       3644 	_vars VSIZE 
      0092F6 C3 00            [ 2]    1     sub sp,#VSIZE 
      0092F8 1C 2B 0C         [ 4] 3645 	call next_token 
      0092FB AE 87            [ 1] 3646 	cp a,#TK_CHAR 
      0092FD 41 CD            [ 1] 3647 	jreq 0$ 
      0092FF A0 C3 55         [ 2] 3648 	jp syntax_error
      009302 00               [ 1] 3649 0$: ld a,xl 
      009303 04 00            [ 1] 3650 	and a,#0XDF 
      009305 02 81            [ 1] 3651 	cp a,#'E
      009307 26 0C            [ 1] 3652 	jrne 1$
      009307 CD 8E A9         [ 2] 3653 	ldw x,#EEPROM_BASE 
      00930A 5B 02 5F         [ 2] 3654 	ldw farptr+1,x 
      00930D CF 00 07         [ 2] 3655 	ldw x,#EEPROM_END
      009310 72               [ 1] 3656 	clr a 
      009311 5F 00            [ 2] 3657 	jra 3$ 
      009313 09 72            [ 1] 3658 1$: cp a,#'F 
      009315 5F 00            [ 1] 3659 	jreq 2$
      009317 0A CE 00         [ 2] 3660 	ldw x,#err_bad_value
      00931A 1A CF 00         [ 2] 3661 	jp tb_error
      001497                       3662 2$:
      00931D 05 E6 02         [ 2] 3663 	ldw x,#app_sign 
      009320 C7 00 04         [ 2] 3664 	ldw farptr+1,x 
      009323 35 03            [ 1] 3665 	ld a,#(FLASH_END>>16)&0XFF 
      009325 00 02 72         [ 2] 3666 	ldw x,#FLASH_END&0xffff
      0014A2                       3667 3$:
      009328 10 00            [ 1] 3668 	ld (LIMIT,sp),a 
      00932A 21 CC            [ 2] 3669 	ldw (LIMIT+1,sp),x 
                                   3670  ; operation done from RAM
                                   3671  ; copy code to RAM in tib   
      00932C 88 4B 3C         [ 4] 3672 	call move_erase_to_ram
      00932E                       3673 4$:	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00932E AE 17 FF         [ 4] 3674     call scan_block 
      009331 94 CC            [ 1] 3675 	jreq 5$  ; block already erased 
      009333 88 2C            [ 1] 3676     ld a,#'E 
      009335 CD 02 B2         [ 4] 3677     call putc 
      009335 AE 00 64         [ 4] 3678 	call block_erase   
                                   3679 ; this block is clean, next  
      009338 90 AE 03         [ 2] 3680 5$:	ldw x,#BLOCK_SIZE
      00933B E8 20 0D         [ 4] 3681 	call incr_farptr
                                   3682 ; check limit, 24 bit substraction  	
      00933E 7B 01            [ 1] 3683 	ld a,(LIMIT,sp)
      00933E CD 8C            [ 2] 3684 	ldw x,(LIMIT+1,sp)
      009340 50 A1 02 27      [ 2] 3685 	subw x,farptr+1
      009344 03 CC 87         [ 1] 3686 	sbc a,farptr 
      009347 A8 E0            [ 1] 3687 	jrugt 4$ 
      009348 CD 05 92         [ 4] 3688 9$: call clear_basic
      0014CC                       3689 	_drop VSIZE 
      009348 85 90            [ 2]    1     addw sp,#VSIZE 
      00934A 85               [ 4] 3690 	ret 
                                   3691 	
                                   3692 
                                   3693 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3694 ;  check for application signature 
                                   3695 ; output:
                                   3696 ;   Carry    0 app present 
                                   3697 ;            1 no app installed  
                                   3698 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00934B                       3699 qsign: 
      00934B 89 AE F4         [ 2] 3700 	ldw x,app_sign 
      00934E 24 65 90         [ 2] 3701 	cpw x,SIGNATURE ; "BC" 
      009351 A3               [ 4] 3702 	ret 
                                   3703 
                                   3704 ;---------------------------------------
                                   3705 ; BASIC: SAVE
                                   3706 ; write application in RAM to FLASH
                                   3707 ;--------------------------------------
      0014D6                       3708 save_app:
      009352 7A 12 2B         [ 4] 3709 	call qsign 
      009355 01 5C            [ 1] 3710 	jrne 1$
      009357 AE 15 39         [ 2] 3711 	ldw x,#CANT_DO 
      009357 9E C7 53         [ 4] 3712 	call puts 
      00935A 0D 9F C7         [ 2] 3713 	jp 9$
      0014E4                       3714 1$: 
      00935D 53 0E 8C         [ 2] 3715 	ldw x,txtbgn
      009360 56 9E C7         [ 2] 3716 	cpw x,txtend 
      009363 53 0F            [ 1] 3717 	jrult 2$ 
      009365 9F C7 53         [ 2] 3718 	ldw x,#NO_APP
      009368 10 72 10         [ 4] 3719 	call puts 
      00936B 53 08            [ 2] 3720 	jra 9$
      0014F4                       3721 2$: 
                                   3722 ; block programming flash
                                   3723 ; must be done from RAM 
      00936D 72 10 53         [ 4] 3724 	call move_prg_to_ram
                                   3725 ; initialize farptr 
      009370 00 72 10 53      [ 1] 3726 	clr farptr 
      009374 04 85 CD         [ 2] 3727 	ldw x,#app_sign 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009377 97 0E 72         [ 2] 3728 	ldw farptr+1,x 
                                   3729 ; write signature
      00937A 11 53 08         [ 2] 3730 	ldw x,SIGNATURE ; "BC" 
      00937D 72 11 53         [ 2] 3731 	ldw rsign,x 
      009380 00 81 1B         [ 2] 3732 	ldw x,txtend 
      009382 72 B0 00 19      [ 2] 3733 	subw x,txtbgn 
      009382 CD 8C 50         [ 2] 3734 	ldw rsize,x   
                                   3735 ;copy block to flash
      009385 A1 02 27         [ 2] 3736 	ldw x,#rsign  
      009388 0B A1            [ 2] 3737 	ldw (1,sp),x   
      00938A 01 27            [ 2] 3738 3$:	ldw x,(1,sp)
      00938C 03 CC 87         [ 4] 3739 	call write_row 
      00938F A8 AE            [ 1] 3740     ld a,#'. 
      009391 00 00 89         [ 4] 3741     call putc 
      009394 1E 03            [ 2] 3742 	ldw x,(1,sp)
      009396 5D 27 1A         [ 2] 3743 	addw x,#BLOCK_SIZE
      009399 1E 01            [ 2] 3744 	ldw (1,sp),x  
      00939B 9F A4 07         [ 2] 3745 	cpw x,txtend 
      00939E 4E C7            [ 1] 3746 	jruge 8$
      0093A0 54 01 72         [ 2] 3747 	ldw x,#BLOCK_SIZE 
      0093A3 16 50 CA         [ 4] 3748 	call incr_farptr
      0093A6 72 10            [ 2] 3749 	jra 3$ 
      001534                       3750 8$:	
      001534                       3751 	_drop 2   
      0093A8 54 01            [ 2]    1     addw sp,#2 
      0093AA AE               [ 4] 3752 9$: ret 
                                   3753 
      0093AB 00 1B                 3754 SIGNATURE: .ascii "BC"
      0093AD 5A 9D 26 FA 20 08 72  3755 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE before"
             11 54 01 72 17 50 CA
             5B 04 81 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             62 65 66 6F 72 65 00
      0093BE 4E 6F 20 61 70 70 6C  3756 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3757 
                                   3758 ;---------------------
                                   3759 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3760 ; write 1 or more byte to FLASH or EEPROM
                                   3761 ; starting at address  
                                   3762 ; input:
                                   3763 ;   expr1  	is address 
                                   3764 ;   expr2,...,exprn   are bytes to write
                                   3765 ; output:
                                   3766 ;   none 
                                   3767 ;---------------------
                           000001  3768 	ADDR=1
                           000002  3769 	VSIZ=2 
      00158E                       3770 write:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00158E                       3771 	_vars VSIZE 
      0093BE CD 8C            [ 2]    1     sub sp,#VSIZE 
      0093C0 4B A1 01 27      [ 1] 3772 	clr farptr ; expect 16 bits address 
      0093C4 03 CC 87         [ 4] 3773 	call expression
      0093C7 A8 85            [ 1] 3774 	cp a,#TK_INTGR 
      0093C9 A3 00            [ 1] 3775 	jreq 0$
      0093CB 05 23 05         [ 2] 3776 	jp syntax_error
      0093CE A6 0A            [ 2] 3777 0$: ldw (ADDR,sp),x 
      0093D0 CC 87 AA         [ 4] 3778 	call next_token 
      0093D3 9F C7            [ 1] 3779 	cp a,#TK_COMMA 
      0093D5 00 0E            [ 1] 3780 	jreq 1$ 
      0093D7 A6 05            [ 2] 3781 	jra 9$ 
      0093D9 C0 00 0E         [ 4] 3782 1$:	call expression
      0093DC C7 54            [ 1] 3783 	cp a,#TK_INTGR
      0093DE 00 72            [ 1] 3784 	jreq 2$
      0093E0 16 54 02         [ 2] 3785 	jp syntax_error
      0093E3 72               [ 1] 3786 2$:	ld a,xl 
      0093E4 10 54            [ 2] 3787 	ldw x,(ADDR,sp) 
      0093E6 01 72 0F         [ 2] 3788 	ldw farptr+1,x 
      0093E9 54               [ 1] 3789 	clrw x 
      0093EA 00 FB CE         [ 4] 3790 	call write_byte
      0093ED 54 04            [ 2] 3791 	ldw x,(ADDR,sp)
      0093EF A6               [ 1] 3792 	incw x 
      0093F0 84 81            [ 2] 3793 	jra 0$ 
      0093F2                       3794 9$:
      0015C2                       3795 	_drop VSIZE
      0093F2 52 01            [ 2]    1     addw sp,#VSIZE 
      0093F4 CD               [ 4] 3796 	ret 
                                   3797 
                                   3798 
                                   3799 ;---------------------
                                   3800 ;BASIC: CHAR(expr)
                                   3801 ; évaluate expression 
                                   3802 ; and take the 7 least 
                                   3803 ; bits as ASCII character
                                   3804 ; return a TK_CHAR 
                                   3805 ;---------------------
      0015C5                       3806 char:
      0093F5 8C 4B A1         [ 4] 3807 	call func_args 
      0093F8 01 27            [ 1] 3808 	cp a,#1
      0093FA 03 CC            [ 1] 3809 	jreq 1$
      0093FC 87 A8 85         [ 2] 3810 	jp syntax_error
      0093FF A3               [ 2] 3811 1$:	popw x 
      009400 00               [ 1] 3812 	ld a,xl 
      009401 0F 23            [ 1] 3813 	and a,#0x7f 
      009403 05               [ 1] 3814 	ld xl,a
      009404 A6 0A            [ 1] 3815 	ld a,#TK_CHAR
      009406 CC               [ 4] 3816 	ret
                                   3817 
                                   3818 ;---------------------
                                   3819 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3820 ; extract first character 
                                   3821 ; of string argument 
                                   3822 ; return it as TK_INTGR 
                                   3823 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0015D7                       3824 ascii:
      009407 87 AA            [ 1] 3825 	ld a,#TK_LPAREN
      009409 CD 98 4C         [ 4] 3826 	call expect 
      00940C 6B 01 E6         [ 4] 3827 	call next_token 
      00940F 01 0D            [ 1] 3828 	cp a,#TK_QSTR 
      009411 01 27            [ 1] 3829 	jreq 1$
      009413 05 44            [ 1] 3830 	cp a,#TK_CHAR 
      009415 0A 01            [ 1] 3831 	jreq 2$ 
      009417 26 FB            [ 1] 3832 	cp a,#TK_CFUNC 
      009419 A4 01            [ 1] 3833 	jreq 0$
      00941B 5F 97 A6         [ 2] 3834 	jp syntax_error
      00941E 84               [ 4] 3835 0$: call (x)
      00941F 5B 01            [ 2] 3836 	jra 2$
      0015F1                       3837 1$: 
      009421 81               [ 1] 3838 	ld a,(x) 
      009422 5F               [ 1] 3839 	clrw x
      009422 52               [ 1] 3840 	ld xl,a 
      0015F4                       3841 2$: 
      009423 02               [ 2] 3842 	pushw x 
      009424 CD 8C            [ 1] 3843 	ld a,#TK_RPAREN 
      009426 50 A1 02         [ 4] 3844 	call expect
      009429 27               [ 2] 3845 	popw x 
      00942A 03 CC            [ 1] 3846 	ld a,#TK_INTGR 
      00942C 87               [ 4] 3847 	ret 
                                   3848 
                                   3849 ;---------------------
                                   3850 ;BASIC: KEY
                                   3851 ; wait for a character 
                                   3852 ; received from STDIN 
                                   3853 ; input:
                                   3854 ;	none 
                                   3855 ; output:
                                   3856 ;	X 		ASCII character 
                                   3857 ;---------------------
      0015FE                       3858 key:
      00942D A8 85 9F         [ 4] 3859 	call getc 
      009430 6B               [ 1] 3860 	clrw x 
      009431 02               [ 1] 3861 	ld xl,a 
      009432 85 A3            [ 1] 3862 	ld a,#TK_INTGR
      009434 00               [ 4] 3863 	ret
                                   3864 
                                   3865 ;----------------------
                                   3866 ; BASIC: QKEY
                                   3867 ; Return true if there 
                                   3868 ; is a character in 
                                   3869 ; waiting in STDIN 
                                   3870 ; input:
                                   3871 ;  none 
                                   3872 ; output:
                                   3873 ;   X 		0|-1 
                                   3874 ;-----------------------
      001606                       3875 qkey:: 
      009435 0F               [ 1] 3876 	clrw x 
      009436 23 05 A6         [ 1] 3877 	ld a,rx1_head
      009439 0A CC 87         [ 1] 3878 	cp a,rx1_tail 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00943C AA CD            [ 1] 3879 	jreq 9$ 
      00943E 98               [ 2] 3880 	cplw x 
      00943F 4C 6B            [ 1] 3881 9$: ld a,#TK_INTGR
      009441 01               [ 4] 3882 	ret 
                                   3883 
                                   3884 ;---------------------
                                   3885 ; BASIC: GPIO(expr,reg)
                                   3886 ; return gpio address 
                                   3887 ; expr {0..8}
                                   3888 ; input:
                                   3889 ;   none 
                                   3890 ; output:
                                   3891 ;   X 		gpio register address
                                   3892 ;----------------------------
                           000003  3893 	PORT=3
                           000001  3894 	REG=1 
                           000004  3895 	VSIZE=4 
      001613                       3896 gpio:
      009442 A6 01 0D         [ 4] 3897 	call func_args 
      009445 01 27            [ 1] 3898 	cp a,#2
      009447 05 48            [ 1] 3899 	jreq 1$
      009449 0A 01 26         [ 2] 3900 	jp syntax_error  
      00161D                       3901 1$:	
      00944C FB 0D            [ 2] 3902 	ldw x,(PORT,sp)
      00944E 02 26            [ 1] 3903 	jrmi bad_port
      009450 05 43 E4         [ 2] 3904 	cpw x,#9
      009453 00 20            [ 1] 3905 	jrpl bad_port
      009455 02 EA            [ 1] 3906 	ld a,#5
      009457 00               [ 4] 3907 	mul x,a
      009458 E7 00 5B         [ 2] 3908 	addw x,#GPIO_BASE 
      00945B 02 81            [ 2] 3909 	ldw (PORT,sp),x  
      00945D 1E 01            [ 2] 3910 	ldw x,(REG,sp) 
      00945D 72 00 00         [ 2] 3911 	addw x,(PORT,sp)
      009460 21 02            [ 1] 3912 	ld a,#TK_INTGR
      001635                       3913 	_drop VSIZE 
      009462 4F 81            [ 2]    1     addw sp,#VSIZE 
      009464 81               [ 4] 3914 	ret
      001638                       3915 bad_port:
      009464 AE 94            [ 1] 3916 	ld a,#ERR_BAD_VALUE
      009466 8B CD A0         [ 2] 3917 	jp tb_error
                                   3918 
                                   3919 
                                   3920 ;-------------------------
                                   3921 ; BASIC: UFLASH 
                                   3922 ; return free flash address
                                   3923 ; input:
                                   3924 ;  none 
                                   3925 ; output:
                                   3926 ;	A		TK_INTGR
                                   3927 ;   X 		free address 
                                   3928 ;---------------------------
      00163D                       3929 uflash:
      009469 C3 5B 02         [ 2] 3930 	ldw x,app_sign
      00946C 52 04 CD         [ 2] 3931 	cpw x,#4243 ; signature "BC" 
      00946F 90 45            [ 1] 3932 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009471 AE 16 90         [ 2] 3933 	ldw x,app_size 
      009474 CF 00 05         [ 2] 3934 	addw x,#app
      009477 7F 72            [ 2] 3935 	jra 2$
      009479 5F 00 04         [ 2] 3936 1$:	ldw x,#app_space 
      00947C 5F CF            [ 1] 3937 2$:	ld a,#TK_INTGR 
      00947E 00               [ 4] 3938 	ret 
                                   3939 
                                   3940 
                                   3941 ;---------------------
                                   3942 ; BASIC: USR(addr[,arg])
                                   3943 ; execute a function written 
                                   3944 ; in binary code.
                                   3945 ; binary fonction should 
                                   3946 ; return token attribute in A 
                                   3947 ; and value in X. 
                                   3948 ; input:
                                   3949 ;   addr	routine address 
                                   3950 ;   arg 	is an optional argument 
                                   3951 ; output:
                                   3952 ;   A 		token attribute 
                                   3953 ;   X       returned value 
                                   3954 ;---------------------
      001653                       3955 usr:
      00947F 01 72            [ 2] 3956 	pushw y 	
      009481 11 00 21         [ 4] 3957 	call func_args 
      009484 72 18            [ 1] 3958 	cp a,#1 
      009486 00 21            [ 1] 3959 	jreq 2$
      009488 CC 88            [ 1] 3960 	cp a,#2
      00948A 4B 0A            [ 1] 3961 	jreq 2$  
      00948C 62 72 65         [ 2] 3962 	jp syntax_error 
      00948F 61 6B            [ 2] 3963 2$: popw y  ; arg|addr 
      009491 20 70            [ 1] 3964 	cp a,#1
      009493 6F 69            [ 1] 3965 	jreq 3$
      009495 6E               [ 2] 3966 	popw x ; addr
      009496 74               [ 1] 3967 	exgw x,y 
      009497 2C 20            [ 4] 3968 3$: call (y)
      009499 52 55            [ 2] 3969 	popw y 
      00949B 4E               [ 4] 3970 	ret 
                                   3971 
                                   3972 ;------------------------------
                                   3973 ; BASIC: BYE 
                                   3974 ; halt mcu in its lowest power mode 
                                   3975 ; wait for reset or external interrupt
                                   3976 ; do a cold start on wakeup.
                                   3977 ;------------------------------
      001670                       3978 bye:
      00949C 20 74 6F 20 72   [ 2] 3979 	btjf UART1_SR,#UART_SR_TC,.
      0094A1 65               [10] 3980 	halt
      0094A2 73 75 6D         [ 2] 3981 	jp cold_start  
                                   3982 
                                   3983 ;----------------------------------
                                   3984 ; BASIC: SLEEP 
                                   3985 ; halt mcu until reset or external
                                   3986 ; interrupt.
                                   3987 ; Resume progam after SLEEP command
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   3988 ;----------------------------------
      001679                       3989 sleep:
      0094A5 65 2E 0A 00 FB   [ 2] 3990 	btjf UART1_SR,#UART_SR_TC,.
      0094A9 72 16 00 20      [ 1] 3991 	bset flags,#FSLEEP
      0094A9 72               [10] 3992 	halt 
      0094AA 01               [ 4] 3993 	ret 
                                   3994 
                                   3995 ;-------------------------------
                                   3996 ; BASIC: PAUSE expr 
                                   3997 ; suspend execution for n msec.
                                   3998 ; input:
                                   3999 ;	none
                                   4000 ; output:
                                   4001 ;	none 
                                   4002 ;------------------------------
      001684                       4003 pause:
      0094AB 00 21 01         [ 4] 4004 	call expression
      0094AE 81 84            [ 1] 4005 	cp a,#TK_INTGR
      0094AF 27 03            [ 1] 4006 	jreq pause02 
      0094AF CD 86 12         [ 2] 4007 	jp syntax_error
      00168E                       4008 pause02: 
      0094B2 81               [ 2] 4009 1$: tnzw x 
      0094B3 27 04            [ 1] 4010 	jreq 2$
      0094B3 A6               [10] 4011 	wfi 
      0094B4 7F               [ 2] 4012 	decw x 
      0094B5 C4 00            [ 1] 4013 	jrne 1$
      0094B7 19               [ 1] 4014 2$:	clr a 
      0094B8 27               [ 4] 4015 	ret 
                                   4016 
                                   4017 ;------------------------------
                                   4018 ; BASIC: AWU expr
                                   4019 ; halt mcu for 'expr' milliseconds
                                   4020 ; use Auto wakeup peripheral
                                   4021 ; all oscillators stopped except LSI
                                   4022 ; range: 1ms - 511ms
                                   4023 ; input:
                                   4024 ;  none
                                   4025 ; output:
                                   4026 ;  none:
                                   4027 ;------------------------------
      001697                       4028 awu:
      0094B9 13 CE 00         [ 4] 4029   call expression
      0094BC 18 1C            [ 1] 4030   cp a,#TK_INTGR
      0094BE 00 80            [ 1] 4031   jreq awu02
      0094C0 24 04 72         [ 2] 4032   jp syntax_error
      0016A1                       4033 awu02:
      0094C3 5C 00 17         [ 2] 4034   cpw x,#5120
      0094C6 9F A4            [ 1] 4035   jrmi 1$ 
      0094C8 80 97 CF 00      [ 1] 4036   mov AWU_TBR,#15 
      0094CC 18 81            [ 1] 4037   ld a,#30
      0094CE 62               [ 2] 4038   div x,a
      0094CE 72 BB            [ 1] 4039   ld a,#16
      0094D0 00               [ 2] 4040   div x,a 
      0094D1 18 24            [ 2] 4041   jra 4$
      0016B2                       4042 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0094D3 04 72 5C         [ 2] 4043   cpw x,#2048
      0094D6 00 17            [ 1] 4044   jrmi 2$ 
      0094D8 CF 00 18 81      [ 1] 4045   mov AWU_TBR,#14
      0094DC A6 50            [ 1] 4046   ld a,#80
      0094DC 5F               [ 2] 4047   div x,a 
      0094DD 92 AF            [ 2] 4048   jra 4$   
      0016C0                       4049 2$:
      0094DF 00 17 26 06      [ 1] 4050   mov AWU_TBR,#7
      0016C4                       4051 3$:  
                                   4052 ; while X > 64  divide by 2 and increment AWU_TBR 
      0094E3 5C A3 00         [ 2] 4053   cpw x,#64 
      0094E6 80 25            [ 2] 4054   jrule 4$ 
      0094E8 F4 81 50 F2      [ 1] 4055   inc AWU_TBR 
      0094EA 54               [ 2] 4056   srlw x 
      0094EA 72 5F            [ 2] 4057   jra 3$ 
      0016D0                       4058 4$:
      0094EC 00               [ 1] 4059   ld a, xl
      0094ED 17               [ 1] 4060   dec a 
      0094EE 52 03            [ 1] 4061   jreq 5$
      0094F0 CD               [ 1] 4062   dec a 	
      0016D5                       4063 5$: 
      0094F1 88 97            [ 1] 4064   and a,#0x3e 
      0094F3 A1 03 27         [ 1] 4065   ld AWU_APR,a 
      0094F6 03 CC 87 A8      [ 1] 4066   bset AWU_CSR,#AWU_CSR_AWUEN
      0094FA 9F               [10] 4067   halt 
                                   4068 
      0094FB A4               [ 4] 4069   ret 
                                   4070 
                                   4071 ;------------------------------
                                   4072 ; BASIC: TICKS
                                   4073 ; return msec ticks counter value 
                                   4074 ; input:
                                   4075 ; 	none 
                                   4076 ; output:
                                   4077 ;	X 		TK_INTGR
                                   4078 ;-------------------------------
      0016E0                       4079 get_ticks:
      0094FC DF A1 45         [ 2] 4080 	ldw x,ticks 
      0094FF 26 0C            [ 1] 4081 	ld a,#TK_INTGR
      009501 AE               [ 4] 4082 	ret 
                                   4083 
                                   4084 
                                   4085 
                                   4086 ;------------------------------
                                   4087 ; BASIC: ABS(expr)
                                   4088 ; return absolute value of expr.
                                   4089 ; input:
                                   4090 ;   none
                                   4091 ; output:
                                   4092 ;   X     	positive integer
                                   4093 ;-------------------------------
      0016E6                       4094 abs:
      009502 40 00 CF         [ 4] 4095 	call func_args 
      009505 00 18            [ 1] 4096 	cp a,#1 
      009507 AE 47            [ 1] 4097 	jreq 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009509 FF 4F 20         [ 2] 4098 	jp syntax_error
      0016F0                       4099 0$:  
      00950C 15               [ 2] 4100     popw x   
      00950D A1               [ 1] 4101 	ld a,xh 
      00950E 46 27            [ 1] 4102 	bcp a,#0x80 
      009510 06 AE            [ 1] 4103 	jreq 2$ 
      009512 86               [ 2] 4104 	negw x 
      009513 F2 CC            [ 1] 4105 2$: ld a,#TK_INTGR 
      009515 87               [ 4] 4106 	ret 
                                   4107 
                                   4108 ;------------------------------
                                   4109 ; BASIC: AND(expr1,expr2)
                                   4110 ; Apply bit AND relation between
                                   4111 ; the 2 arguments, i.e expr1 & expr2 
                                   4112 ; output:
                                   4113 ; 	A 		TK_INTGR
                                   4114 ;   X 		result 
                                   4115 ;------------------------------
      0016FA                       4116 bit_and:
      009516 AA 0B CB         [ 4] 4117 	call func_args 
      009517 A1 02            [ 1] 4118 	cp a,#2
      009517 AE AA            [ 1] 4119 	jreq 1$
      009519 80 CF 00         [ 2] 4120 	jp syntax_error 
      00951C 18               [ 2] 4121 1$:	popw x 
      00951D A6               [ 1] 4122 	ld a,xh 
      00951E 02 AE            [ 1] 4123 	and a,(1,sp)
      009520 7F               [ 1] 4124 	ld xh,a 
      009521 FF               [ 1] 4125 	ld a,xl
      009522 14 02            [ 1] 4126 	and a,(2,sp)
      009522 6B               [ 1] 4127 	ld xl,a 
      00170D                       4128 	_drop 2 
      009523 01 1F            [ 2]    1     addw sp,#2 
      009525 02 CD            [ 1] 4129 	ld a,#TK_INTGR
      009527 81               [ 4] 4130 	ret
                                   4131 
                                   4132 ;------------------------------
                                   4133 ; BASIC: OR(expr1,expr2)
                                   4134 ; Apply bit OR relation between
                                   4135 ; the 2 arguments, i.e expr1 | expr2 
                                   4136 ; output:
                                   4137 ; 	A 		TK_INTGR
                                   4138 ;   X 		result 
                                   4139 ;------------------------------
      001712                       4140 bit_or:
      009528 BC 0B CB         [ 4] 4141 	call func_args 
      009529 A1 02            [ 1] 4142 	cp a,#2
      009529 CD 94            [ 1] 4143 	jreq 1$
      00952B DC 27 08         [ 2] 4144 	jp syntax_error 
      00171C                       4145 1$: 
      00952E A6               [ 2] 4146 	popw x 
      00952F 45               [ 1] 4147 	ld a,xh 
      009530 CD 83            [ 1] 4148 	or a,(1,sp)
      009532 32               [ 1] 4149 	ld xh,a 
      009533 CD               [ 1] 4150 	ld a,xl 
      009534 82 28            [ 1] 4151 	or a,(2,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009536 AE               [ 1] 4152 	ld xl,a 
      001725                       4153 	_drop 2 
      009537 00 80            [ 2]    1     addw sp,#2 
      009539 CD 94            [ 1] 4154 	ld a,#TK_INTGR 
      00953B CE               [ 4] 4155 	ret
                                   4156 
                                   4157 ;------------------------------
                                   4158 ; BASIC: XOR(expr1,expr2)
                                   4159 ; Apply bit XOR relation between
                                   4160 ; the 2 arguments, i.e expr1 ^ expr2 
                                   4161 ; output:
                                   4162 ; 	A 		TK_INTGR
                                   4163 ;   X 		result 
                                   4164 ;------------------------------
      00172A                       4165 bit_xor:
      00953C 7B 01 1E         [ 4] 4166 	call func_args 
      00953F 02 72            [ 1] 4167 	cp a,#2
      009541 B0 00            [ 1] 4168 	jreq 1$
      009543 18 C2 00         [ 2] 4169 	jp syntax_error 
      001734                       4170 1$: 
      009546 17               [ 2] 4171 	popw x 
      009547 22               [ 1] 4172 	ld a,xh 
      009548 E0 CD            [ 1] 4173 	xor a,(1,sp)
      00954A 86               [ 1] 4174 	ld xh,a 
      00954B 12               [ 1] 4175 	ld a,xl 
      00954C 5B 03            [ 1] 4176 	xor a,(2,sp)
      00954E 81               [ 1] 4177 	ld xl,a 
      00954F                       4178 	_drop 2 
      00954F CE AA            [ 2]    1     addw sp,#2 
      009551 80 C3            [ 1] 4179 	ld a,#TK_INTGR 
      009553 95               [ 4] 4180 	ret 
                                   4181 
                                   4182 ;------------------------------
                                   4183 ; BASIC: LSHIFT(expr1,expr2)
                                   4184 ; logical shift left expr1 by 
                                   4185 ; expr2 bits 
                                   4186 ; output:
                                   4187 ; 	A 		TK_INTGR
                                   4188 ;   X 		result 
                                   4189 ;------------------------------
      001742                       4190 lshift:
      009554 B7 81 CB         [ 4] 4191 	call func_args
      009556 A1 02            [ 1] 4192 	cp a,#2 
      009556 CD 95            [ 1] 4193 	jreq 1$
      009558 4F 26 09         [ 2] 4194 	jp syntax_error
      00955B AE 95            [ 2] 4195 1$: popw y   
      00955D B9               [ 2] 4196 	popw x 
      00955E CD A0            [ 2] 4197 	tnzw y 
      009560 C3 CC            [ 1] 4198 	jreq 4$
      009562 95               [ 2] 4199 2$:	sllw x 
      009563 B6 5A            [ 2] 4200 	decw y 
      009564 26 FB            [ 1] 4201 	jrne 2$
      001758                       4202 4$:  
      009564 CE 00            [ 1] 4203 	ld a,#TK_INTGR
      009566 1A               [ 4] 4204 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4205 
                                   4206 ;------------------------------
                                   4207 ; BASIC: RSHIFT(expr1,expr2)
                                   4208 ; logical shift right expr1 by 
                                   4209 ; expr2 bits.
                                   4210 ; output:
                                   4211 ; 	A 		TK_INTGR
                                   4212 ;   X 		result 
                                   4213 ;------------------------------
      00175B                       4214 rshift:
      009567 C3 00 1C         [ 4] 4215 	call func_args
      00956A 25 08            [ 1] 4216 	cp a,#2 
      00956C AE 95            [ 1] 4217 	jreq 1$
      00956E F8 CD A0         [ 2] 4218 	jp syntax_error
      009571 C3 20            [ 2] 4219 1$: popw y  
      009573 42               [ 2] 4220 	popw x
      009574 90 5D            [ 2] 4221 	tnzw y 
      009574 CD 81            [ 1] 4222 	jreq 4$
      009576 F0               [ 2] 4223 2$:	srlw x 
      009577 72 5F            [ 2] 4224 	decw y 
      009579 00 17            [ 1] 4225 	jrne 2$
      001771                       4226 4$:  
      00957B AE AA            [ 1] 4227 	ld a,#TK_INTGR
      00957D 80               [ 4] 4228 	ret
                                   4229 
                                   4230 ;--------------------------
                                   4231 ; BASIC: FCPU integer
                                   4232 ; set CPU frequency 
                                   4233 ;-------------------------- 
                                   4234 
      001774                       4235 fcpu:
      00957E CF 00            [ 1] 4236 	ld a,#TK_INTGR
      009580 18 CE 95         [ 4] 4237 	call expect 
      009583 B7               [ 1] 4238 	ld a,xl 
      009584 CF 00            [ 1] 4239 	and a,#7 
      009586 7C CE 00         [ 1] 4240 	ld CLK_CKDIVR,a 
      009589 1C               [ 4] 4241 	ret 
                                   4242 
                                   4243 ;------------------------------
                                   4244 ; BASIC: PMODE pin#, mode 
                                   4245 ; Arduino pin. 
                                   4246 ; define pin as input or output
                                   4247 ; pin#: {0..15}
                                   4248 ; mode: INPUT|OUTPUT  
                                   4249 ;------------------------------
                           000001  4250 	PINNO=1
                           000001  4251 	VSIZE=1
      001780                       4252 pin_mode:
      001780                       4253 	_vars VSIZE 
      00958A 72 B0            [ 2]    1     sub sp,#VSIZE 
      00958C 00 1A CF         [ 4] 4254 	call arg_list 
      00958F 00 7E            [ 1] 4255 	cp a,#2 
      009591 AE 00            [ 1] 4256 	jreq 1$
      009593 7C 1F 01         [ 2] 4257 	jp syntax_error 
      009596 1E 01            [ 2] 4258 1$: popw y ; mode 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009598 CD               [ 2] 4259 	popw x ; Dx pin 
      009599 82 04 A6         [ 4] 4260 	call select_pin 
      00959C 2E CD            [ 1] 4261 	ld (PINNO,sp),a  
      00959E 83 32            [ 1] 4262 	ld a,#1 
      0095A0 1E 01            [ 1] 4263 	tnz (PINNO,sp)
      0095A2 1C 00            [ 1] 4264 	jreq 4$
      0095A4 80               [ 1] 4265 2$:	sll a 
      0095A5 1F 01            [ 1] 4266 	dec (PINNO,sp)
      0095A7 C3 00            [ 1] 4267 	jrne 2$ 
      0095A9 1C 24            [ 1] 4268 	ld (PINNO,sp),a
      0095AB 08 AE            [ 1] 4269 	ld a,(PINNO,sp)
      0095AD 00 80            [ 1] 4270 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      0095AF CD 94            [ 1] 4271 	ld (GPIO_CR1,x),a 
      0095B1 CE 20 E2 01      [ 2] 4272 4$:	cpw y,#OUTP 
      0095B4 27 10            [ 1] 4273 	jreq 6$
                                   4274 ; input mode
                                   4275 ; disable external interrupt 
      0095B4 5B 02            [ 1] 4276 	ld a,(PINNO,sp)
      0095B6 81               [ 1] 4277 	cpl a 
      0095B7 42 43            [ 1] 4278 	and a,(GPIO_CR2,x)
      0095B9 43 61            [ 1] 4279 	ld (GPIO_CR2,x),a 
                                   4280 ;clear bit in DDR for input mode 
      0095BB 6E 27            [ 1] 4281 	ld a,(PINNO,sp)
      0095BD 74               [ 1] 4282 	cpl a 
      0095BE 20 66            [ 1] 4283 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      0095C0 6C 61            [ 1] 4284 	ld (GPIO_DDR,x),a 
      0095C2 73 68            [ 2] 4285 	jra 9$
      0017BD                       4286 6$: ;output mode  
      0095C4 20 61            [ 1] 4287 	ld a,(PINNO,sp)
      0095C6 70 70            [ 1] 4288 	or a,(GPIO_DDR,x) ; bit==1 for output 
      0095C8 6C 69            [ 1] 4289 	ld (GPIO_DDR,x),a 
      0095CA 63 61            [ 1] 4290 	ld a,(PINNO,sp)
      0095CC 74 69            [ 1] 4291 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      0095CE 6F 6E            [ 1] 4292 	ld (GPIO_CR2,x),a 
      0017C9                       4293 9$:	
      0017C9                       4294 	_drop VSIZE 
      0095D0 2C 20            [ 2]    1     addw sp,#VSIZE 
      0095D2 61               [ 4] 4295 	ret
                                   4296 
                                   4297 ;------------------------
                                   4298 ; select Arduino pin 
                                   4299 ; input:
                                   4300 ;   X 	 {0..15} Arduino Dx 
                                   4301 ; output:
                                   4302 ;   A     stm8s208 pin 
                                   4303 ;   X     base address s208 GPIO port 
                                   4304 ;---------------------------
      0017CC                       4305 select_pin:
      0095D3 6C               [ 2] 4306 	sllw x 
      0095D4 72 65 61         [ 2] 4307 	addw x,#arduino_to_8s208 
      0095D7 64               [ 2] 4308 	ldw x,(x)
      0095D8 79               [ 1] 4309 	ld a,xl 
      0095D9 20               [ 1] 4310 	push a 
      0095DA 6F               [ 1] 4311 	swapw x 
      0095DB 6E 65            [ 1] 4312 	ld a,#5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095DD 20               [ 4] 4313 	mul x,a 
      0095DE 69 6E 20         [ 2] 4314 	addw x,#GPIO_BASE 
      0095E1 46               [ 1] 4315 	pop a 
      0095E2 4C               [ 4] 4316 	ret 
                                   4317 ; translation from Arduino D0..D15 to stm8s208rb 
      0017DC                       4318 arduino_to_8s208:
      0095E3 41 53                 4319 .byte 3,6 ; D0 
      0095E5 48 0A                 4320 .byte 3,5 ; D1 
      0095E7 75 73                 4321 .byte 4,0 ; D2 
      0095E9 65 20                 4322 .byte 2,1 ; D3
      0095EB 45 52                 4323 .byte 6,0 ; D4
      0095ED 41 53                 4324 .byte 2,2 ; D5
      0095EF 45 20                 4325 .byte 2,3 ; D6
      0095F1 62 65                 4326 .byte 3,1 ; D7
      0095F3 66 6F                 4327 .byte 3,3 ; D8
      0095F5 72 65                 4328 .byte 2,4 ; D9
      0095F7 00 4E                 4329 .byte 4,5 ; D10
      0095F9 6F 20                 4330 .byte 2,6 ; D11
      0095FB 61 70                 4331 .byte 2,7 ; D12
      0095FD 70 6C                 4332 .byte 2,5 ; D13
      0095FF 69 63                 4333 .byte 4,2 ; D14
      009601 61 74                 4334 .byte 4,1 ; D15
                                   4335 
                                   4336 
                                   4337 ;------------------------------
                                   4338 ; BASIC: RND(expr)
                                   4339 ; return random number 
                                   4340 ; between 1 and expr inclusive
                                   4341 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4342 ; input:
                                   4343 ; 	none 
                                   4344 ; output:
                                   4345 ;	X 		random positive integer 
                                   4346 ;------------------------------
      0017FC                       4347 random:
      009603 69 6F 6E         [ 4] 4348 	call func_args 
      009606 20 69            [ 1] 4349 	cp a,#1
      009608 6E 20            [ 1] 4350 	jreq 1$
      00960A 52 41 4D         [ 2] 4351 	jp syntax_error
      001806                       4352 1$:  
      00960D 00 80            [ 1] 4353 	ld a,#0x80 
      00960E 15 01            [ 1] 4354 	bcp a,(1,sp)
      00960E 52 03            [ 1] 4355 	jreq 2$
      009610 72 5F            [ 1] 4356 	ld a,#ERR_BAD_VALUE
      009612 00 17 CD         [ 2] 4357 	jp tb_error
      001811                       4358 2$: 
                                   4359 ; acc16=(x<<5)^x 
      009615 8D 4F A1         [ 2] 4360 	ldw x,seedx 
      009618 84               [ 2] 4361 	sllw x 
      009619 27               [ 2] 4362 	sllw x 
      00961A 03               [ 2] 4363 	sllw x 
      00961B CC               [ 2] 4364 	sllw x 
      00961C 87               [ 2] 4365 	sllw x 
      00961D A8               [ 1] 4366 	ld a,xh 
      00961E 1F 01 CD         [ 1] 4367 	xor a,seedx 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009621 88 97 A1         [ 1] 4368 	ld acc16,a 
      009624 09               [ 1] 4369 	ld a,xl 
      009625 27 02 20         [ 1] 4370 	xor a,seedx+1 
      009628 19 CD 8D         [ 1] 4371 	ld acc8,a 
                                   4372 ; seedx=seedy 
      00962B 4F A1 84         [ 2] 4373 	ldw x,seedy 
      00962E 27 03 CC         [ 2] 4374 	ldw seedx,x  
                                   4375 ; seedy=seedy^(seedy>>1)
      009631 87 A8            [ 2] 4376 	srlw y 
      009633 9F 1E            [ 1] 4377 	ld a,yh 
      009635 01 CF 00         [ 1] 4378 	xor a,seedy 
      009638 18 5F CD         [ 1] 4379 	ld seedy,a  
      00963B 82 52            [ 1] 4380 	ld a,yl 
      00963D 1E 01 5C         [ 1] 4381 	xor a,seedy+1 
      009640 20 DC 15         [ 1] 4382 	ld seedy+1,a 
                                   4383 ; acc16>>3 
      009642 CE 00 0C         [ 2] 4384 	ldw x,acc16 
      009642 5B               [ 2] 4385 	srlw x 
      009643 03               [ 2] 4386 	srlw x 
      009644 81               [ 2] 4387 	srlw x 
                                   4388 ; x=acc16^x 
      009645 9E               [ 1] 4389 	ld a,xh 
      009645 CD 8C 4B         [ 1] 4390 	xor a,acc16 
      009648 A1               [ 1] 4391 	ld xh,a 
      009649 01               [ 1] 4392 	ld a,xl 
      00964A 27 03 CC         [ 1] 4393 	xor a,acc8 
      00964D 87               [ 1] 4394 	ld xl,a 
                                   4395 ; seedy=x^seedy 
      00964E A8 85 9F         [ 1] 4396 	xor a,seedy+1
      009651 A4               [ 1] 4397 	ld xl,a 
      009652 7F               [ 1] 4398 	ld a,xh 
      009653 97 A6 03         [ 1] 4399 	xor a,seedy
      009656 81               [ 1] 4400 	ld xh,a 
      009657 CF 00 14         [ 2] 4401 	ldw seedy,x 
                                   4402 ; return seedy modulo expr + 1 
      009657 A6 07            [ 2] 4403 	popw y 
      009659 CD               [ 2] 4404 	divw x,y 
      00965A 8C               [ 1] 4405 	ldw x,y 
      00965B 3E               [ 1] 4406 	incw x 
      001860                       4407 10$:
      00965C CD 88            [ 1] 4408 	ld a,#TK_INTGR
      00965E 97               [ 4] 4409 	ret 
                                   4410 
                                   4411 ;---------------------------------
                                   4412 ; BASIC: WORDS 
                                   4413 ; affiche la listes des mots du
                                   4414 ; dictionnaire ainsi que le nombre
                                   4415 ; de mots.
                                   4416 ;---------------------------------
                           000001  4417 	WLEN=1 ; word length
                           000002  4418 	LLEN=2 ; character sent to console
                           000003  4419 	WCNT=3 ; count words printed 
                           000003  4420 	VSIZE=3 
      001863                       4421 words:
      001863                       4422 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00965F A1 02            [ 2]    1     sub sp,#VSIZE 
      009661 27 0E            [ 1] 4423 	clr (LLEN,sp)
      009663 A1 03            [ 1] 4424 	clr (WCNT,sp)
      009665 27 0D A1 82      [ 2] 4425 	ldw y,#kword_dict+2
      009669 27               [ 1] 4426 0$:	ldw x,y
      00966A 03               [ 1] 4427 	ld a,(x)
      00966B CC 87            [ 1] 4428 	and a,#15 
      00966D A8 FD            [ 1] 4429 	ld (WLEN,sp),a 
      00966F 20 03            [ 1] 4430 	inc (WCNT,sp)
      009671 5C               [ 1] 4431 1$:	incw x 
      009671 F6               [ 1] 4432 	ld a,(x)
      009672 5F 97 B2         [ 4] 4433 	call putc 
      009674 0C 02            [ 1] 4434 	inc (LLEN,sp)
      009674 89 A6            [ 1] 4435 	dec (WLEN,sp)
      009676 08 CD            [ 1] 4436 	jrne 1$
      009678 8C 3E            [ 1] 4437 	ld a,#70
      00967A 85 A6            [ 1] 4438 	cp a,(LLEN,sp)
      00967C 84 81            [ 1] 4439 	jrmi 2$   
      00967E A6 20            [ 1] 4440 	ld a,#SPACE 
      00967E CD 83 42         [ 4] 4441 	call putc 
      009681 5F 97            [ 1] 4442 	inc (LLEN,sp) 
      009683 A6 84            [ 2] 4443 	jra 3$
      009685 81 0D            [ 1] 4444 2$: ld a,#CR 
      009686 CD 02 B2         [ 4] 4445 	call putc 
      009686 5F C6            [ 1] 4446 	clr (LLEN,sp)
      009688 00 2B C1 00      [ 2] 4447 3$:	subw y,#2 
      00968C 2C 27            [ 2] 4448 	ldw y,(y)
      00968E 01 53            [ 1] 4449 	jrne 0$ 
      009690 A6 84            [ 1] 4450 	ld a,#CR 
      009692 81 02 B2         [ 4] 4451 	call putc  
      009693 5F               [ 1] 4452 	clrw x 
      009693 CD 8C            [ 1] 4453 	ld a,(WCNT,sp)
      009695 4B               [ 1] 4454 	ld xl,a 
      009696 A1 02 27         [ 4] 4455 	call print_int 
      009699 03 CC 87         [ 2] 4456 	ldw x,#words_count_msg
      00969C A8 20 43         [ 4] 4457 	call puts 
      00969D                       4458 	_drop VSIZE 
      00969D 1E 03            [ 2]    1     addw sp,#VSIZE 
      00969F 2B               [ 4] 4459 	ret 
      0096A0 17 A3 00 09 2A 12 A6  4460 words_count_msg: .asciz " words in dictionary\n"
             05 42 1C 50 00 1F 03
             1E 01 72 FB 03 A6 84
             5B
                                   4461 
                                   4462 
                                   4463 ;-----------------------------
                                   4464 ; BASIC: TIMER expr 
                                   4465 ; initialize count down timer 
                                   4466 ;-----------------------------
      0018C9                       4467 set_timer:
      0096B6 04 81 D0         [ 4] 4468 	call arg_list
      0096B8 A1 01            [ 1] 4469 	cp a,#1 
      0096B8 A6 0A            [ 1] 4470 	jreq 1$
      0096BA CC 87 AA         [ 2] 4471 	jp syntax_error
      0096BD                       4472 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0096BD CE               [ 2] 4473 	popw x 
      0096BE AA 80 A3         [ 2] 4474 	ldw timer,x 
      0096C1 10               [ 4] 4475 	ret 
                                   4476 
                                   4477 ;------------------------------
                                   4478 ; BASIC: TIMEOUT 
                                   4479 ; return state of timer 
                                   4480 ;------------------------------
      0018D8                       4481 timeout:
      0096C2 93 27 08         [ 2] 4482 	ldw x,timer 
      0018DB                       4483 logical_complement:
      0096C5 CE               [ 2] 4484 	cplw x 
      0096C6 AA 82 1C         [ 2] 4485 	cpw x,#-1
      0096C9 AA 84            [ 1] 4486 	jreq 2$
      0096CB 20               [ 1] 4487 	clrw x 
      0096CC 03 AE            [ 1] 4488 2$:	ld a,#TK_INTGR
      0096CE AA               [ 4] 4489 	ret 
                                   4490 
                                   4491 ;--------------------------------
                                   4492 ; BASIC NOT(expr) 
                                   4493 ; return logical complement of expr
                                   4494 ;--------------------------------
      0018E5                       4495 func_not:
      0096CF 80 A6 84         [ 4] 4496 	call func_args  
      0096D2 81 01            [ 1] 4497 	cp a,#1
      0096D3 27 03            [ 1] 4498 	jreq 1$
      0096D3 90 89 CD         [ 2] 4499 	jp syntax_error
      0096D6 8C               [ 2] 4500 1$:	popw x 
      0096D7 4B A1            [ 2] 4501 	jra logical_complement
                                   4502 
                                   4503 
                                   4504 
                                   4505 ;-----------------------------------
                                   4506 ; BASIC: IWDGEN expr1 
                                   4507 ; enable independant watchdog timer
                                   4508 ; expr1 is delay in multiple of 62.5µsec
                                   4509 ; expr1 -> {1..16383}
                                   4510 ;-----------------------------------
      0018F2                       4511 enable_iwdg:
      0096D9 01 27 07         [ 4] 4512 	call arg_list
      0096DC A1 02            [ 1] 4513 	cp a,#1 
      0096DE 27 03            [ 1] 4514 	jreq 1$
      0096E0 CC 87 A8         [ 2] 4515 	jp syntax_error 
      0096E3 90               [ 2] 4516 1$: popw x 
      0096E4 85 A1            [ 1] 4517 	push #0
      0096E6 01 27 02 85      [ 1] 4518 	mov IWDG_KR,#IWDG_KEY_ENABLE
      0096EA 51               [ 1] 4519 	ld a,xh 
      0096EB 90 FD            [ 1] 4520 	and a,#0x3f
      0096ED 90               [ 1] 4521 	ld xh,a  
      0096EE 85 81 FF         [ 2] 4522 2$:	cpw x,#255
      0096F0 23 06            [ 2] 4523 	jrule 3$
      0096F0 72 0D            [ 1] 4524 	inc (1,sp)
      0096F2 52               [ 1] 4525 	rcf 
      0096F3 30               [ 2] 4526 	rrcw x 
      0096F4 FB 8E            [ 2] 4527 	jra 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0096F6 CC 84 EF E0      [ 1] 4528 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      0096F9 84               [ 1] 4529 	pop a  
      0096F9 72 0D 52         [ 1] 4530 	ld IWDG_PR,a 
      0096FC 30               [ 1] 4531 	ld a,xl
      0096FD FB               [ 1] 4532 	dec a 
      0096FE 72 16 00 21      [ 1] 4533 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009702 8E 81 E2         [ 1] 4534 	ld IWDG_RLR,a 
      009704 35 AA 50 E0      [ 1] 4535 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009704 CD               [ 4] 4536 	ret 
                                   4537 
                                   4538 
                                   4539 ;-----------------------------------
                                   4540 ; BASIC: IWDGREF  
                                   4541 ; refresh independant watchdog count down 
                                   4542 ; timer before it reset MCU. 
                                   4543 ;-----------------------------------
      001928                       4544 refresh_iwdg:
      009705 8D 4F A1 84      [ 1] 4545 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009709 27               [ 4] 4546 	ret 
                                   4547 
                                   4548 
                                   4549 ;-------------------------------------
                                   4550 ; BASIC: LOG(expr)
                                   4551 ; return logarithm base 2 of expr 
                                   4552 ; this is the position of most significant
                                   4553 ; bit set. 
                                   4554 ; input: 
                                   4555 ; output:
                                   4556 ;   X     log2 
                                   4557 ;   A     TK_INTGR 
                                   4558 ;*********************************
      00192D                       4559 log2:
      00970A 03 CC 87         [ 4] 4560 	call func_args 
      00970D A8 01            [ 1] 4561 	cp a,#1 
      00970E 27 03            [ 1] 4562 	jreq 1$
      00970E 5D 27 04         [ 2] 4563 	jp syntax_error 
      009711 8F               [ 2] 4564 1$: popw x 
      001938                       4565 leading_one:
      009712 5A               [ 2] 4566 	tnzw x 
      009713 26 F9            [ 1] 4567 	jreq 4$
      009715 4F 81            [ 1] 4568 	ld a,#15 
      009717 59               [ 2] 4569 2$: rlcw x 
      009717 CD 8D            [ 1] 4570     jrc 3$
      009719 4F               [ 1] 4571 	dec a 
      00971A A1 84            [ 2] 4572 	jra 2$
      00971C 27               [ 1] 4573 3$: clrw x 
      00971D 03               [ 1] 4574     ld xl,a
      00971E CC 87            [ 1] 4575 4$:	ld a,#TK_INTGR
      009720 A8               [ 4] 4576 	ret 
                                   4577 
                                   4578 ;-----------------------------------
                                   4579 ; BASIC: BIT(expr) 
                                   4580 ; expr ->{0..15}
                                   4581 ; return 2^expr 
                                   4582 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4583 ;    x    2^expr 
                                   4584 ;-----------------------------------
      009721                       4585 bitmask:
      009721 A3 14 00         [ 4] 4586     call func_args 
      009724 2B 0C            [ 1] 4587 	cp a,#1
      009726 35 0F            [ 1] 4588 	jreq 1$
      009728 50 F2 A6         [ 2] 4589 	jp syntax_error 
      00972B 1E               [ 2] 4590 1$: popw x 
      00972C 62               [ 1] 4591 	ld a,xl 
      00972D A6 10            [ 1] 4592 	and a,#15
      00972F 62               [ 1] 4593 	clrw x 
      009730 20               [ 1] 4594 	incw x 
      009731 1E               [ 1] 4595 2$: tnz a 
      009732 27 04            [ 1] 4596 	jreq 3$
      009732 A3               [ 2] 4597 	slaw x 
      009733 08               [ 1] 4598 	dec a 
      009734 00 2B            [ 2] 4599 	jra 2$ 
      009736 09 35            [ 1] 4600 3$: ld a,#TK_INTGR
      009738 0E               [ 4] 4601 	ret 
                                   4602 
                                   4603 ;------------------------------
                                   4604 ; BASIC: INVERT(expr)
                                   4605 ; 1's complement 
                                   4606 ;--------------------------------
      001962                       4607 invert:
      009739 50 F2 A6         [ 4] 4608 	call func_args
      00973C 50 62            [ 1] 4609 	cp a,#1 
      00973E 20 10            [ 1] 4610 	jreq 1$
      009740 CC 07 28         [ 2] 4611 	jp syntax_error
      009740 35               [ 2] 4612 1$: popw x  
      009741 07               [ 2] 4613 	cplw x 
      009742 50 F2            [ 1] 4614 	ld a,#TK_INTGR 
      009744 81               [ 4] 4615 	ret 
                                   4616 
                                   4617 ;------------------------------
                                   4618 ; BASIC: DO 
                                   4619 ; initiate a DO ... UNTIL loop 
                                   4620 ;------------------------------
                           000003  4621 	DOLP_ADR=3 
                           000005  4622 	DOLP_INW=5
                           000004  4623 	VSIZE=4 
      001971                       4624 do_loop:
      009744 A3               [ 2] 4625 	popw x 
      001972                       4626 	_vars VSIZE 
      009745 00 40            [ 2]    1     sub sp,#VSIZE 
      009747 23               [ 2] 4627 	pushw x 
      009748 07 72 5C 50      [ 2] 4628 	ldw y,basicptr 
      00974C F2 54            [ 2] 4629 	ldw (DOLP_ADR,sp),y
      00974E 20 F4 00 00      [ 2] 4630 	ldw y,in.w 
      009750 17 05            [ 2] 4631 	ldw (DOLP_INW,sp),y
      009750 9F 4A 27 01      [ 1] 4632 	inc loop_depth 
      009754 4A               [ 4] 4633 	ret 
                                   4634 
                                   4635 ;--------------------------------
                                   4636 ; BASIC: UNTIL expr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4637 ; loop if exprssion is false 
                                   4638 ; else terminate loop
                                   4639 ;--------------------------------
      009755                       4640 until: 
      009755 A4 3E C7 50      [ 1] 4641 	tnz loop_depth 
      009759 F1 72            [ 1] 4642 	jrne 1$ 
      00975B 18 50 F0         [ 2] 4643 	jp syntax_error 
      00198F                       4644 1$: 
      00975E 8E 81 18         [ 4] 4645 	call relation 
      009760 A1 84            [ 1] 4646 	cp a,#TK_INTGR
      009760 CE 00            [ 1] 4647 	jreq 2$
      009762 0F A6 84         [ 2] 4648 	jp syntax_error
      001999                       4649 2$: 
      009765 81               [ 2] 4650 	tnzw x 
      009766 26 10            [ 1] 4651 	jrne 9$
      009766 CD 8C            [ 2] 4652 	ldw x,(DOLP_ADR,sp)
      009768 4B A1 01         [ 2] 4653 	ldw basicptr,x 
      00976B 27 03            [ 1] 4654 	ld a,(2,x)
      00976D CC 87 A8         [ 1] 4655 	ld count,a 
      009770 1E 05            [ 2] 4656 	ldw x,(DOLP_INW,sp)
      009770 85 9E A5         [ 2] 4657 	ldw in.w,x 
      009773 80               [ 4] 4658 	ret 
      0019AC                       4659 9$:	; remove loop data from stack  
      009774 27               [ 2] 4660 	popw x
      0019AD                       4661 	_drop VSIZE
      009775 01 50            [ 2]    1     addw sp,#VSIZE 
      009777 A6 84 81 1D      [ 1] 4662 	dec loop_depth 
      00977A FC               [ 2] 4663 	jp (x)
                                   4664 
                                   4665 ;--------------------------
                                   4666 ; BASIC: PRTA...PRTI  
                                   4667 ;  return constant value 
                                   4668 ;  PORT  offset in GPIO
                                   4669 ;  array
                                   4670 ;---------------------------
      0019B4                       4671 const_porta:
      00977A CD 8C 4B         [ 2] 4672 	ldw x,#0
      00977D A1 02            [ 1] 4673 	ld a,#TK_INTGR 
      00977F 27               [ 4] 4674 	ret 
      0019BA                       4675 const_portb:
      009780 03 CC 87         [ 2] 4676 	ldw x,#1
      009783 A8 85            [ 1] 4677 	ld a,#TK_INTGR 
      009785 9E               [ 4] 4678 	ret 
      0019C0                       4679 const_portc:
      009786 14 01 95         [ 2] 4680 	ldw x,#2
      009789 9F 14            [ 1] 4681 	ld a,#TK_INTGR 
      00978B 02               [ 4] 4682 	ret 
      0019C6                       4683 const_portd:
      00978C 97 5B 02         [ 2] 4684 	ldw x,#3
      00978F A6 84            [ 1] 4685 	ld a,#TK_INTGR 
      009791 81               [ 4] 4686 	ret 
      009792                       4687 const_porte:
      009792 CD 8C 4B         [ 2] 4688 	ldw x,#4
      009795 A1 02            [ 1] 4689 	ld a,#TK_INTGR 
      009797 27               [ 4] 4690 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0019D2                       4691 const_portf:
      009798 03 CC 87         [ 2] 4692 	ldw x,#5
      00979B A8 84            [ 1] 4693 	ld a,#TK_INTGR 
      00979C 81               [ 4] 4694 	ret 
      0019D8                       4695 const_portg:
      00979C 85 9E 1A         [ 2] 4696 	ldw x,#6
      00979F 01 95            [ 1] 4697 	ld a,#TK_INTGR 
      0097A1 9F               [ 4] 4698 	ret 
      0019DE                       4699 const_porth:
      0097A2 1A 02 97         [ 2] 4700 	ldw x,#7
      0097A5 5B 02            [ 1] 4701 	ld a,#TK_INTGR 
      0097A7 A6               [ 4] 4702 	ret 
      0019E4                       4703 const_porti:
      0097A8 84 81 08         [ 2] 4704 	ldw x,#8
      0097AA A6 84            [ 1] 4705 	ld a,#TK_INTGR 
      0097AA CD               [ 4] 4706 	ret 
                                   4707 
                                   4708 ;-------------------------------
                                   4709 ; following return constant 
                                   4710 ; related to GPIO register offset 
                                   4711 ;---------------------------------
      0019EA                       4712 const_odr:
      0097AB 8C 4B            [ 1] 4713 	ld a,#TK_INTGR 
      0097AD A1 02 27         [ 2] 4714 	ldw x,#GPIO_ODR
      0097B0 03               [ 4] 4715 	ret 
      0019F0                       4716 const_idr:
      0097B1 CC 87            [ 1] 4717 	ld a,#TK_INTGR 
      0097B3 A8 00 01         [ 2] 4718 	ldw x,#GPIO_IDR
      0097B4 81               [ 4] 4719 	ret 
      0019F6                       4720 const_ddr:
      0097B4 85 9E            [ 1] 4721 	ld a,#TK_INTGR 
      0097B6 18 01 95         [ 2] 4722 	ldw x,#GPIO_DDR
      0097B9 9F               [ 4] 4723 	ret 
      0019FC                       4724 const_cr1:
      0097BA 18 02            [ 1] 4725 	ld a,#TK_INTGR 
      0097BC 97 5B 02         [ 2] 4726 	ldw x,#GPIO_CR1
      0097BF A6               [ 4] 4727 	ret 
      001A02                       4728 const_cr2:
      0097C0 84 81            [ 1] 4729 	ld a,#TK_INTGR 
      0097C2 AE 00 04         [ 2] 4730 	ldw x,#GPIO_CR2
      0097C2 CD               [ 4] 4731 	ret 
                                   4732 ;-------------------------
                                   4733 ; BASIC: POUT 
                                   4734 ;  constant for port mode
                                   4735 ;  used by PMODE 
                                   4736 ;  to set pin as output
                                   4737 ;------------------------
      001A08                       4738 const_output:
      0097C3 8C 4B            [ 1] 4739 	ld a,#TK_INTGR 
      0097C5 A1 02 27         [ 2] 4740 	ldw x,#OUTP
      0097C8 03               [ 4] 4741 	ret 
                                   4742 
                                   4743 ;-------------------------
                                   4744 ; BASIC: PINP 
                                   4745 ;  constant for port mode
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4746 ;  used by PMODE 
                                   4747 ;  to set pin as input
                                   4748 ;------------------------
      001A0E                       4749 const_input:
      0097C9 CC 87            [ 1] 4750 	ld a,#TK_INTGR 
      0097CB A8 90 85         [ 2] 4751 	ldw x,#INP 
      0097CE 85               [ 4] 4752 	ret 
                                   4753 	
                                   4754 ;-----------------------
                                   4755 ; memory area constants
                                   4756 ;-----------------------
      001A14                       4757 const_eeprom_base:
      0097CF 90 5D            [ 1] 4758 	ld a,#TK_INTGR 
      0097D1 27 05 58         [ 2] 4759 	ldw x,#EEPROM_BASE 
      0097D4 90               [ 4] 4760 	ret 
                                   4761 
                                   4762 ;---------------------------
                                   4763 ; BASIC: DATA 
                                   4764 ; when the interpreter find 
                                   4765 ; a DATA line it skip it.
                                   4766 ;---------------------------
      001A1A                       4767 data:
      0097D5 5A 26 FB 00 01   [ 1] 4768 	mov in,count 
      0097D8 81               [ 4] 4769 	ret 
                                   4770 
                                   4771 ;---------------------------
                                   4772 ; BASIC: DATLN  *expr*
                                   4773 ; set DATA pointer at line# 
                                   4774 ; specified by *expr* 
                                   4775 ;---------------------------
      001A20                       4776 data_line:
      0097D8 A6 84 81         [ 4] 4777 	call expression
      0097DB A1 84            [ 1] 4778 	cp a,#TK_INTGR
      0097DB CD 8C            [ 1] 4779 	jreq 1$
      0097DD 4B A1 02         [ 2] 4780 	jp syntax_error  
      0097E0 27               [ 1] 4781 1$: clr a 
      0097E1 03 CC 87         [ 4] 4782 	call search_lineno
      0097E4 A8               [ 2] 4783 	tnzw x 
      0097E5 90 85            [ 1] 4784 	jrne 3$
      0097E7 85 90            [ 1] 4785 2$:	ld a,#ERR_NO_LINE 
      0097E9 5D 27 05         [ 2] 4786 	jp tb_error
      001A36                       4787 3$: ; check if valid data line 
      0097EC 54 90            [ 1] 4788     ldw y,x 
      0097EE 5A 26            [ 2] 4789 	ldw x,(4,x)
      0097F0 FB 1A 1A         [ 2] 4790 	cpw x,#data 
      0097F1 26 F2            [ 1] 4791 	jrne 2$ 
      0097F1 A6 84 81 06      [ 2] 4792 	ldw data_ptr,y
      0097F4 90 E6 02         [ 1] 4793 	ld a,(2,y)
      0097F4 A6 84 CD         [ 1] 4794 	ld data_len,a 
      0097F7 8C 3E 9F A4      [ 1] 4795 	mov data_ofs,#FIRST_DATA_ITEM 
      0097FB 07               [ 4] 4796 	ret
                                   4797 
                                   4798 ;---------------------------------
                                   4799 ; BASIC: RESTORE 
                                   4800 ; set data_ptr to first data line
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4801 ; if not DATA found pointer set to
                                   4802 ; zero 
                                   4803 ;---------------------------------
      001A4E                       4804 restore:
      0097FC C7 50 C6 81      [ 1] 4805 	clr data_ptr 
      009800 72 5F 00 07      [ 1] 4806 	clr data_ptr+1
      009800 52 01 CD 8C      [ 1] 4807 	clr data_ofs 
      009804 50 A1 02 27      [ 1] 4808 	clr data_len
      009808 03 CC 87         [ 2] 4809 	ldw x,txtbgn
      001A61                       4810 data_search_loop: 	
      00980B A8 90 85         [ 2] 4811 	cpw x,txtend
      00980E 85 CD            [ 1] 4812 	jruge 9$
      009810 98 4C            [ 1] 4813 	ldw y,x 
      009812 6B 01            [ 2] 4814 	ldw x,(4,x)
      009814 A6 01 0D         [ 2] 4815 	addw x,#code_addr
      009817 01               [ 2] 4816 	ldw x,(x)
      009818 27 0D 48         [ 2] 4817 	cpw x,#data 
      00981B 0A 01            [ 1] 4818 	jrne try_next_line 
      00981D 26 FB 6B 01      [ 2] 4819 	ldw data_ptr,y 
      009821 7B 01 EA         [ 1] 4820 	ld a,(2,y)
      009824 03 E7 03         [ 1] 4821 	ld data_len,a 
      009827 90 A3 00 01      [ 1] 4822 	mov data_ofs,#FIRST_DATA_ITEM
      00982B 27 10 7B 01      [ 1] 4823 9$:	tnz data_len 
      00982F 43 E4            [ 1] 4824     jrne 10$
      009831 04 E7            [ 1] 4825 	ld a,#ERR_NO_DATA 
      009833 04 7B 01         [ 2] 4826 	jp tb_error 
      009836 43               [ 4] 4827 10$:ret
      001A8D                       4828 try_next_line:
      009837 E4               [ 1] 4829 	ldw x,y 
      009838 02 E7            [ 1] 4830 	ld a,(2,x)
      00983A 02 20 0C         [ 1] 4831 	ld acc8,a 
      00983D 72 5F 00 0C      [ 1] 4832 	clr acc16 
      00983D 7B 01 EA 02      [ 2] 4833 	addw x,acc16 
      009841 E7 02            [ 2] 4834 	jra data_search_loop
                                   4835 
                                   4836 
                                   4837 ;---------------------------------
                                   4838 ; BASIC: READ 
                                   4839 ; return next data item | 0 
                                   4840 ;---------------------------------
                           000001  4841 	CTX_BPTR=1 
                           000003  4842 	CTX_IN=3 
                           000004  4843 	CTX_COUNT=4 
                           000005  4844 	XSAVE=5
                           000006  4845 	VSIZE=6
      001A9D                       4846 read:
      001A9D                       4847 	_vars  VSIZE 
      009843 7B 01            [ 2]    1     sub sp,#VSIZE 
      001A9F                       4848 read01:	
      009845 EA 04 E7         [ 1] 4849 	ld a,data_ofs
      009848 04 00 09         [ 1] 4850 	cp a,data_len 
      009849 27 37            [ 1] 4851 	jreq 2$ ; end of line  
      009849 5B 01 81         [ 4] 4852 	call save_context
      00984C CE 00 06         [ 2] 4853 	ldw x,data_ptr 
      00984C 58 1C 98         [ 2] 4854 	ldw basicptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      00984F 5C FE 9F 88 5E   [ 1] 4855 	mov in,data_ofs 
      009854 A6 05 42 1C 50   [ 1] 4856 	mov count,data_len  
      009859 00 84 81         [ 4] 4857 	call expression 
      00985C A1 84            [ 1] 4858 	cp a,#TK_INTGR 
      00985C 03 06            [ 1] 4859 	jreq 1$ 
      00985E 03 05 04         [ 2] 4860 	jp syntax_error 
      001AC4                       4861 1$:
      009861 00 02            [ 2] 4862 	ldw (XSAVE,SP),x
      009863 01 06 00         [ 4] 4863 	call next_token ; skip comma
      009866 02 02 02         [ 2] 4864 	ldw x,basicptr 
      009869 03 03 01         [ 2] 4865 	ldw data_ptr,x 
      00986C 03 03 02 04 04   [ 1] 4866 	mov data_ofs,in 
      009871 05 02 06         [ 4] 4867 	call rest_context
      009874 02 07            [ 2] 4868 	ldw x,(XSAVE,sp)
      009876 02 05            [ 1] 4869 	ld a,#TK_INTGR
      001ADB                       4870 	_drop VSIZE 
      009878 04 02            [ 2]    1     addw sp,#VSIZE 
      00987A 04               [ 4] 4871 	ret 
      001ADE                       4872 2$: ; end of line reached 
      00987B 01 CE 00 06      [ 2] 4873 	ldw y, data_ptr 
      00987C 72 5F 00 06      [ 1] 4874 	clr data_ptr
      00987C CD 8C 4B A1      [ 1] 4875 	clr data_ptr+1   
      009880 01 27 03 CC      [ 1] 4876 	clr data_ofs 
      009884 87 A8 00 09      [ 1] 4877 	clr data_len 
      009886 CD 1A 8D         [ 4] 4878 	call try_next_line 
      009886 A6 80            [ 2] 4879 	jra read01
                                   4880 
                                   4881 
                                   4882 ;---------------------------------
                                   4883 ; BASIC: SPIEN clkdiv, 0|1  
                                   4884 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4885 ; if clkdiv==-1 disable SPI
                                   4886 ; 0|1 -> disable|enable  
                                   4887 ;--------------------------------- 
                           000005  4888 SPI_CS_BIT=5
      001AF7                       4889 spi_enable:
      009888 15 01 27         [ 4] 4890 	call arg_list 
      00988B 05 A6            [ 1] 4891 	cp a,#2
      00988D 0A CC            [ 1] 4892 	jreq 1$
      00988F 87 AA 28         [ 2] 4893 	jp syntax_error 
      009891                       4894 1$: 
      009891 CE 00 13 58      [ 1] 4895 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009895 58               [ 2] 4896 	popw x  
      009896 58               [ 2] 4897 	tnzw x 
      009897 58 58            [ 1] 4898 	jreq spi_disable 
      009899 9E               [ 2] 4899 	popw x 
      00989A C8 00            [ 1] 4900 	ld a,#(1<<SPI_CR1_BR)
      00989C 13               [ 4] 4901 	mul x,a 
      00989D C7               [ 1] 4902 	ld a,xl 
      00989E 00 0D 9F         [ 1] 4903 	ld SPI_CR1,a 
                                   4904 ; configure ~CS on PE5 (D10 on CN8) as output. 
      0098A1 C8 00 14 C7      [ 1] 4905 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      0098A5 00 0E CE 00      [ 1] 4906 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4907 ; configure SPI as master mode 0.	
      0098A9 15 CF 00 13      [ 1] 4908 	bset SPI_CR1,#SPI_CR1_MSTR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                   4909 ; ~CS line controlled by sofware 	
      0098AD 90 54 90 9E      [ 1] 4910 	bset SPI_CR2,#SPI_CR2_SSM 
      0098B1 C8 00 15 C7      [ 1] 4911     bset SPI_CR2,#SPI_CR2_SSI 
                                   4912 ; enable SPI
      0098B5 00 15 90 9F      [ 1] 4913 	bset SPI_CR1,#SPI_CR1_SPE 	
      0098B9 C8               [ 4] 4914 	ret 
      001B2A                       4915 spi_disable:
      001B2A                       4916 	_drop #2; throw first argument.
      0098BA 00 16            [ 2]    1     addw sp,##2 
                                   4917 ; wait spi idle 
      0098BC C7 00            [ 1] 4918 1$:	ld a,#0x82 
      0098BE 16 CE 00         [ 1] 4919 	and a,SPI_SR
      0098C1 0D 54            [ 1] 4920 	cp a,#2 
      0098C3 54 54            [ 1] 4921 	jrne 1$
      0098C5 9E C8 00 0D      [ 1] 4922 	bres SPI_CR1,#SPI_CR1_SPE
      0098C9 95 9F C8 00      [ 1] 4923 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      0098CD 0E 97 C8 00      [ 1] 4924 	bres PE_DDR,#SPI_CS_BIT 
      0098D1 16               [ 4] 4925 	ret 
                                   4926 
      001B42                       4927 spi_clear_error:
      0098D2 97 9E            [ 1] 4928 	ld a,#0x78 
      0098D4 C8 00 15         [ 1] 4929 	bcp a,SPI_SR 
      0098D7 95 CF            [ 1] 4930 	jreq 1$
      0098D9 00 15 90 85      [ 1] 4931 	clr SPI_SR 
      0098DD 65               [ 4] 4932 1$: ret 
                                   4933 
      001B4E                       4934 spi_send_byte:
      0098DE 93               [ 1] 4935 	push a 
      0098DF 5C 1B 42         [ 4] 4936 	call spi_clear_error
      0098E0 84               [ 1] 4937 	pop a 
      0098E0 A6 84 81 03 FB   [ 2] 4938 	btjf SPI_SR,#SPI_SR_TXE,.
      0098E3 C7 52 04         [ 1] 4939 	ld SPI_DR,a
      0098E3 52 03 0F 02 0F   [ 2] 4940 	btjf SPI_SR,#SPI_SR_RXNE,.  
      0098E8 03 90 AE         [ 1] 4941 	ld a,SPI_DR 
      0098EB 9F               [ 4] 4942 	ret 
                                   4943 
      001B64                       4944 spi_rcv_byte:
      0098EC C3 93            [ 1] 4945 	ld a,#255
      0098EE F6 A4 0F 6B 01   [ 2] 4946 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      0098F3 0C 03 5C         [ 1] 4947 	ld a,SPI_DR 
      0098F6 F6               [ 4] 4948 	ret
                                   4949 
                                   4950 ;------------------------------
                                   4951 ; BASIC: SPIWR byte [,byte]
                                   4952 ; write 1 or more byte
                                   4953 ;------------------------------
      001B6F                       4954 spi_write:
      0098F7 CD 83 32         [ 4] 4955 	call expression
      0098FA 0C 02            [ 1] 4956 	cp a,#TK_INTGR 
      0098FC 0A 01            [ 1] 4957 	jreq 1$
      0098FE 26 F5 A6         [ 2] 4958 	jp syntax_error 
      001B79                       4959 1$:	
      009901 46               [ 1] 4960 	ld a,xl 
      009902 11 02 2B         [ 4] 4961 	call spi_send_byte 
      009905 09 A6 20         [ 4] 4962 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009908 CD 83            [ 1] 4963 	cp a,#TK_COMMA 
      00990A 32 0C            [ 1] 4964 	jrne 2$ 
      00990C 02 20            [ 2] 4965 	jra spi_write 
      00990E 07               [ 1] 4966 2$:	tnz a 
      00990F A6 0D            [ 1] 4967 	jreq 3$
      001B89                       4968 	_unget_token  
      009911 CD 83 32 0F 02   [ 1]    1      mov in,in.saved  
      009916 72               [ 4] 4969 3$:	ret 
                                   4970 
                                   4971 
                                   4972 ;-------------------------------
                                   4973 ; BASIC: SPIRD 	
                                   4974 ; read one byte from SPI 
                                   4975 ;-------------------------------
      001B8F                       4976 spi_read:
      009917 A2 00 02         [ 4] 4977 	call spi_rcv_byte 
      00991A 90               [ 1] 4978 	clrw x 
      00991B FE               [ 1] 4979 	ld xl,a 
      00991C 26 CF            [ 1] 4980 	ld a,#TK_INTGR 
      00991E A6               [ 4] 4981 	ret 
                                   4982 
                                   4983 ;------------------------------
                                   4984 ; BASIC: SPISEL 0|1 
                                   4985 ; set state of ~CS line
                                   4986 ; 0|1 deselect|select  
                                   4987 ;------------------------------
      001B97                       4988 spi_select:
      00991F 0D CD 83         [ 4] 4989 	call next_token 
      009922 32 5F            [ 1] 4990 	cp a,#TK_INTGR 
      009924 7B 03            [ 1] 4991 	jreq 1$
      009926 97 CD 88         [ 2] 4992 	jp syntax_error 
      009929 F2               [ 2] 4993 1$: tnzw x  
      00992A AE 99            [ 1] 4994 	jreq cs_high 
      00992C 33 CD A0 C3      [ 1] 4995 	bres PE_ODR,#SPI_CS_BIT
      009930 5B               [ 4] 4996 	ret 
      001BA9                       4997 cs_high: 
      009931 03 81 20 77      [ 1] 4998 	bset PE_ODR,#SPI_CS_BIT
      009935 6F               [ 4] 4999 	ret 
                                   5000 
                                   5001 ;-------------------------------
                                   5002 ; BASIC: PAD 
                                   5003 ; Return pad buffer address.
                                   5004 ;------------------------------
      001BAE                       5005 pad_ref:
      009936 72 64 73         [ 2] 5006 	ldw x,#pad 
      009939 20 69            [ 1] 5007 	ld a,TK_INTGR
      00993B 6E               [ 4] 5008 	ret 
                                   5009 
                                   5010 
                                   5011 ;------------------------------
                                   5012 ;      dictionary 
                                   5013 ; format:
                                   5014 ;   link:   2 bytes 
                                   5015 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5016 ;   cmd_name: 16 byte max 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   5017 ;   cmd_index: 2 bytes 
                                   5018 ;------------------------------
                                   5019 	.macro _dict_entry len,name,cmd_idx 
                                   5020 	.word LINK 
                                   5021 	LINK=.
                                   5022 name:
                                   5023 	.byte len 	
                                   5024 	.ascii "name"
                                   5025 	.word cmd_idx 
                                   5026 	.endm 
                                   5027 
                           000000  5028 	LINK=0
                                   5029 ; respect alphabetic order for BASIC names from Z-A
                                   5030 ; this sort order is for a cleaner WORDS cmd output. 	
      001BB4                       5031 kword_end:
      001BB4                       5032 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00993C 20 64                    1 	.word LINK 
                           001BB6     2 	LINK=.
      001BB6                          3 XOR:
      00993E 69                       4 	.byte 3+F_IFUNC 	
      00993F 63 74 69                 5 	.ascii "XOR"
      009942 6F 6E                    6 	.word XOR_IDX 
      001BBC                       5033 	_dict_entry,5,WRITE,WRITE_IDX;write  
      009944 61 72                    1 	.word LINK 
                           001BBE     2 	LINK=.
      001BBE                          3 WRITE:
      009946 79                       4 	.byte 5 	
      009947 0A 00 49 54 45           5 	.ascii "WRITE"
      009949 00 C0                    6 	.word WRITE_IDX 
      001BC6                       5034 	_dict_entry,5,WORDS,WORDS_IDX;words 
      009949 CD 8C                    1 	.word LINK 
                           001BC8     2 	LINK=.
      001BC8                          3 WORDS:
      00994B 50                       4 	.byte 5 	
      00994C A1 01 27 03 CC           5 	.ascii "WORDS"
      009951 87 A8                    6 	.word WORDS_IDX 
      009953                       5035 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      009953 85 CF                    1 	.word LINK 
                           001BD2     2 	LINK=.
      001BD2                          3 WAIT:
      009955 00                       4 	.byte 4 	
      009956 11 81 49 54              5 	.ascii "WAIT"
      009958 00 BC                    6 	.word WAIT_IDX 
      001BD9                       5036 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      009958 CE 00                    1 	.word LINK 
                           001BDB     2 	LINK=.
      001BDB                          3 USR:
      00995A 11                       4 	.byte 3+F_IFUNC 	
      00995B 55 53 52                 5 	.ascii "USR"
      00995B 53 A3                    6 	.word USR_IDX 
      001BE1                       5037 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00995D FF FF                    1 	.word LINK 
                           001BE3     2 	LINK=.
      001BE3                          3 UNTIL:
      00995F 27                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009960 01 5F A6 84 81           5 	.ascii "UNTIL"
      009965 00 B8                    6 	.word UNTIL_IDX 
      001BEB                       5038 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      009965 CD 8C                    1 	.word LINK 
                           001BED     2 	LINK=.
      001BED                          3 UFLASH:
      009967 4B                       4 	.byte 6+F_IFUNC 	
      009968 A1 01 27 03 CC 87        5 	.ascii "UFLASH"
      00996E A8 85                    6 	.word UFLASH_IDX 
      001BF6                       5039 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      009970 20 E9                    1 	.word LINK 
                           001BF8     2 	LINK=.
      009972                          3 UBOUND:
      009972 CD                       4 	.byte 6+F_IFUNC 	
      009973 8C 50 A1 01 27 03        5 	.ascii "UBOUND"
      009979 CC 87                    6 	.word UBOUND_IDX 
      001C01                       5040 	_dict_entry,4,TONE,TONE_IDX;tone  
      00997B A8 85                    1 	.word LINK 
                           001C03     2 	LINK=.
      001C03                          3 TONE:
      00997D 4B                       4 	.byte 4 	
      00997E 00 35 CC 50              5 	.ascii "TONE"
      009982 E0 9E                    6 	.word TONE_IDX 
      001C0A                       5041 	_dict_entry,2,TO,TO_IDX;to
      009984 A4 3F                    1 	.word LINK 
                           001C0C     2 	LINK=.
      001C0C                          3 TO:
      009986 95                       4 	.byte 2 	
      009987 A3 00                    5 	.ascii "TO"
      009989 FF 23                    6 	.word TO_IDX 
      001C11                       5042 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00998B 06 0C                    1 	.word LINK 
                           001C13     2 	LINK=.
      001C13                          3 TIMER:
      00998D 01                       4 	.byte 5 	
      00998E 98 56 20 F5 35           5 	.ascii "TIMER"
      009993 55 50                    6 	.word TIMER_IDX 
      001C1B                       5043 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      009995 E0 84                    1 	.word LINK 
                           001C1D     2 	LINK=.
      001C1D                          3 TIMEOUT:
      009997 C7                       4 	.byte 7+F_IFUNC 	
      009998 50 E1 9F 4A 35 55 50     5 	.ascii "TIMEOUT"
      00999F E0 C7                    6 	.word TMROUT_IDX 
      001C27                       5044 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      0099A1 50 E2                    1 	.word LINK 
                           001C29     2 	LINK=.
      001C29                          3 TICKS:
      0099A3 35                       4 	.byte 5+F_IFUNC 	
      0099A4 AA 50 E0 81 53           5 	.ascii "TICKS"
      0099A8 00 AA                    6 	.word TICKS_IDX 
      001C31                       5045 	_dict_entry,4,STOP,STOP_IDX;stop 
      0099A8 35 AA                    1 	.word LINK 
                           001C33     2 	LINK=.
      001C33                          3 STOP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      0099AA 50                       4 	.byte 4 	
      0099AB E0 81 4F 50              5 	.ascii "STOP"
      0099AD 00 A8                    6 	.word STOP_IDX 
      001C3A                       5046 	_dict_entry,4,STEP,STEP_IDX;step 
      0099AD CD 8C                    1 	.word LINK 
                           001C3C     2 	LINK=.
      001C3C                          3 STEP:
      0099AF 4B                       4 	.byte 4 	
      0099B0 A1 01 27 03              5 	.ascii "STEP"
      0099B4 CC 87                    6 	.word STEP_IDX 
      001C43                       5047 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      0099B6 A8 85                    1 	.word LINK 
                           001C45     2 	LINK=.
      0099B8                          3 SPIWR:
      0099B8 5D                       4 	.byte 5 	
      0099B9 27 0A A6 0F 59           5 	.ascii "SPIWR"
      0099BE 25 03                    6 	.word SPIWR_IDX 
      001C4D                       5048 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      0099C0 4A 20                    1 	.word LINK 
                           001C4F     2 	LINK=.
      001C4F                          3 SPISEL:
      0099C2 FA                       4 	.byte 6 	
      0099C3 5F 97 A6 84 81 4C        5 	.ascii "SPISEL"
      0099C8 00 A2                    6 	.word SPISEL_IDX 
      001C58                       5049 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      0099C8 CD 8C                    1 	.word LINK 
                           001C5A     2 	LINK=.
      001C5A                          3 SPIRD:
      0099CA 4B                       4 	.byte 5+F_IFUNC 	
      0099CB A1 01 27 03 CC           5 	.ascii "SPIRD"
      0099D0 87 A8                    6 	.word SPIRD_IDX 
      001C62                       5050 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      0099D2 85 9F                    1 	.word LINK 
                           001C64     2 	LINK=.
      001C64                          3 SPIEN:
      0099D4 A4                       4 	.byte 5 	
      0099D5 0F 5F 5C 4D 27           5 	.ascii "SPIEN"
      0099DA 04 58                    6 	.word SPIEN_IDX 
      001C6C                       5051 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      0099DC 4A 20                    1 	.word LINK 
                           001C6E     2 	LINK=.
      001C6E                          3 SLEEP:
      0099DE F9                       4 	.byte 5 	
      0099DF A6 84 81 45 50           5 	.ascii "SLEEP"
      0099E2 00 9C                    6 	.word SLEEP_IDX 
      001C76                       5052     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      0099E2 CD 8C                    1 	.word LINK 
                           001C78     2 	LINK=.
      001C78                          3 SIZE:
      0099E4 4B                       4 	.byte 4 	
      0099E5 A1 01 27 03              5 	.ascii "SIZE"
      0099E9 CC 87                    6 	.word SIZE_IDX 
      001C7F                       5053 	_dict_entry,4,SHOW,SHOW_IDX;show 
      0099EB A8 85                    1 	.word LINK 
                           001C81     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      001C81                          3 SHOW:
      0099ED 53                       4 	.byte 4 	
      0099EE A6 84 81 57              5 	.ascii "SHOW"
      0099F1 00 98                    6 	.word SHOW_IDX 
      001C88                       5054 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      0099F1 85 52                    1 	.word LINK 
                           001C8A     2 	LINK=.
      001C8A                          3 SAVE:
      0099F3 04                       4 	.byte 4 	
      0099F4 89 90 CE 00              5 	.ascii "SAVE"
      0099F8 05 17                    6 	.word SAVE_IDX 
      001C91                       5055 	_dict_entry 3,RUN,RUN_IDX;run
      0099FA 03 90                    1 	.word LINK 
                           001C93     2 	LINK=.
      001C93                          3 RUN:
      0099FC CE                       4 	.byte 3 	
      0099FD 00 01 17                 5 	.ascii "RUN"
      009A00 05 72                    6 	.word RUN_IDX 
      001C99                       5056 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      009A02 5C 00                    1 	.word LINK 
                           001C9B     2 	LINK=.
      001C9B                          3 RSHIFT:
      009A04 1E                       4 	.byte 6+F_IFUNC 	
      009A05 81 53 48 49 46 54        5 	.ascii "RSHIFT"
      009A06 00 94                    6 	.word RSHIFT_IDX 
      001CA4                       5057 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      009A06 72 5D                    1 	.word LINK 
                           001CA6     2 	LINK=.
      001CA6                          3 RND:
      009A08 00                       4 	.byte 3+F_IFUNC 	
      009A09 1E 26 03                 5 	.ascii "RND"
      009A0C CC 87                    6 	.word RND_IDX 
      001CAC                       5058 	_dict_entry,6,RETURN,RET_IDX;return 
      009A0E A8 A6                    1 	.word LINK 
                           001CAE     2 	LINK=.
      009A0F                          3 RETURN:
      009A0F CD                       4 	.byte 6 	
      009A10 8D 98 A1 84 27 03        5 	.ascii "RETURN"
      009A16 CC 87                    6 	.word RET_IDX 
      001CB7                       5059 	_dict_entry,7,RESTORE,REST_IDX;restore 
      009A18 A8 AE                    1 	.word LINK 
                           001CB9     2 	LINK=.
      009A19                          3 RESTORE:
      009A19 5D                       4 	.byte 7 	
      009A1A 26 10 1E 03 CF 00 05     5 	.ascii "RESTORE"
      009A21 E6 02                    6 	.word REST_IDX 
      001CC3                       5060 	_dict_entry 6,REMARK,REM_IDX;remark 
      009A23 C7 00                    1 	.word LINK 
                           001CC5     2 	LINK=.
      001CC5                          3 REMARK:
      009A25 04                       4 	.byte 6 	
      009A26 1E 05 CF 00 01 81        5 	.ascii "REMARK"
      009A2C 00 8C                    6 	.word REM_IDX 
      001CCE                       5061 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      009A2C 85 5B                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                           001CD0     2 	LINK=.
      001CD0                          3 REBOOT:
      009A2E 04                       4 	.byte 6 	
      009A2F 72 5A 00 1E FC 54        5 	.ascii "REBOOT"
      009A34 00 8A                    6 	.word RBT_IDX 
      001CD9                       5062 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      009A34 AE 00                    1 	.word LINK 
                           001CDB     2 	LINK=.
      001CDB                          3 READ:
      009A36 00                       4 	.byte 4+F_IFUNC 	
      009A37 A6 84 81 44              5 	.ascii "READ"
      009A3A 00 88                    6 	.word READ_IDX 
      001CE2                       5063 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      009A3A AE 00                    1 	.word LINK 
                           001CE4     2 	LINK=.
      001CE4                          3 QKEY:
      009A3C 01                       4 	.byte 4+F_IFUNC 	
      009A3D A6 84 81 59              5 	.ascii "QKEY"
      009A40 00 86                    6 	.word QKEY_IDX 
      001CEB                       5064 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      009A40 AE 00                    1 	.word LINK 
                           001CED     2 	LINK=.
      001CED                          3 PRTI:
      009A42 02                       4 	.byte 4+F_IFUNC 	
      009A43 A6 84 81 49              5 	.ascii "PRTI"
      009A46 00 84                    6 	.word PRTI_IDX 
      001CF4                       5065 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      009A46 AE 00                    1 	.word LINK 
                           001CF6     2 	LINK=.
      001CF6                          3 PRTH:
      009A48 03                       4 	.byte 4+F_IFUNC 	
      009A49 A6 84 81 48              5 	.ascii "PRTH"
      009A4C 00 82                    6 	.word PRTH_IDX 
      001CFD                       5066 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      009A4C AE 00                    1 	.word LINK 
                           001CFF     2 	LINK=.
      001CFF                          3 PRTG:
      009A4E 04                       4 	.byte 4+F_IFUNC 	
      009A4F A6 84 81 47              5 	.ascii "PRTG"
      009A52 00 80                    6 	.word PRTG_IDX 
      001D06                       5067 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      009A52 AE 00                    1 	.word LINK 
                           001D08     2 	LINK=.
      001D08                          3 PRTF:
      009A54 05                       4 	.byte 4+F_IFUNC 	
      009A55 A6 84 81 46              5 	.ascii "PRTF"
      009A58 00 7E                    6 	.word PRTF_IDX 
      001D0F                       5068 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      009A58 AE 00                    1 	.word LINK 
                           001D11     2 	LINK=.
      001D11                          3 PRTE:
      009A5A 06                       4 	.byte 4+F_IFUNC 	
      009A5B A6 84 81 45              5 	.ascii "PRTE"
      009A5E 00 7C                    6 	.word PRTE_IDX 
      001D18                       5069 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009A5E AE 00                    1 	.word LINK 
                           001D1A     2 	LINK=.
      001D1A                          3 PRTD:
      009A60 07                       4 	.byte 4+F_IFUNC 	
      009A61 A6 84 81 44              5 	.ascii "PRTD"
      009A64 00 7A                    6 	.word PRTD_IDX 
      001D21                       5070 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      009A64 AE 00                    1 	.word LINK 
                           001D23     2 	LINK=.
      001D23                          3 PRTC:
      009A66 08                       4 	.byte 4+F_IFUNC 	
      009A67 A6 84 81 43              5 	.ascii "PRTC"
      009A6A 00 78                    6 	.word PRTC_IDX 
      001D2A                       5071 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      009A6A A6 84                    1 	.word LINK 
                           001D2C     2 	LINK=.
      001D2C                          3 PRTB:
      009A6C AE                       4 	.byte 4+F_IFUNC 	
      009A6D 00 00 81 42              5 	.ascii "PRTB"
      009A70 00 76                    6 	.word PRTB_IDX 
      001D33                       5072 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      009A70 A6 84                    1 	.word LINK 
                           001D35     2 	LINK=.
      001D35                          3 PRTA:
      009A72 AE                       4 	.byte 4+F_IFUNC 	
      009A73 00 01 81 41              5 	.ascii "PRTA"
      009A76 00 74                    6 	.word PRTA_IDX 
      001D3C                       5073 	_dict_entry 5,PRINT,PRT_IDX;print 
      009A76 A6 84                    1 	.word LINK 
                           001D3E     2 	LINK=.
      001D3E                          3 PRINT:
      009A78 AE                       4 	.byte 5 	
      009A79 00 02 81 4E 54           5 	.ascii "PRINT"
      009A7C 00 72                    6 	.word PRT_IDX 
      001D46                       5074 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      009A7C A6 84                    1 	.word LINK 
                           001D48     2 	LINK=.
      001D48                          3 POUT:
      009A7E AE                       4 	.byte 4+F_IFUNC 	
      009A7F 00 03 81 54              5 	.ascii "POUT"
      009A82 00 70                    6 	.word POUT_IDX 
      001D4F                       5075 	_dict_entry,4,POKE,POKE_IDX;poke 
      009A82 A6 84                    1 	.word LINK 
                           001D51     2 	LINK=.
      001D51                          3 POKE:
      009A84 AE                       4 	.byte 4 	
      009A85 00 04 81 45              5 	.ascii "POKE"
      009A88 00 6E                    6 	.word POKE_IDX 
      001D58                       5076 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      009A88 A6 84                    1 	.word LINK 
                           001D5A     2 	LINK=.
      001D5A                          3 PMODE:
      009A8A AE                       4 	.byte 5 	
      009A8B 00 01 81 44 45           5 	.ascii "PMODE"
      009A8E 00 68                    6 	.word PMODE_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      001D62                       5077 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      009A8E A6 84                    1 	.word LINK 
                           001D64     2 	LINK=.
      001D64                          3 PINP:
      009A90 AE                       4 	.byte 4+F_IFUNC 	
      009A91 00 00 81 50              5 	.ascii "PINP"
      009A94 00 6C                    6 	.word PINP_IDX 
      001D6B                       5078 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      009A94 A6 84                    1 	.word LINK 
                           001D6D     2 	LINK=.
      001D6D                          3 PEEK:
      009A96 AE                       4 	.byte 4+F_IFUNC 	
      009A97 40 00 81 4B              5 	.ascii "PEEK"
      009A9A 00 6A                    6 	.word PEEK_IDX 
      001D74                       5079 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      009A9A 55 00                    1 	.word LINK 
                           001D76     2 	LINK=.
      001D76                          3 PAUSE:
      009A9C 04                       4 	.byte 5 	
      009A9D 00 02 81 53 45           5 	.ascii "PAUSE"
      009AA0 00 66                    6 	.word PAUSE_IDX 
      001D7E                       5080 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      009AA0 CD 8D                    1 	.word LINK 
                           001D80     2 	LINK=.
      001D80                          3 PAD:
      009AA2 4F                       4 	.byte 3+F_IFUNC 	
      009AA3 A1 84 27                 5 	.ascii "PAD"
      009AA6 03 CC                    6 	.word PAD_IDX 
      001D86                       5081 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      009AA8 87 A8                    1 	.word LINK 
                           001D88     2 	LINK=.
      001D88                          3 OR:
      009AAA 4F                       4 	.byte 2+F_IFUNC 	
      009AAB CD A3                    5 	.ascii "OR"
      009AAD AB 5D                    6 	.word OR_IDX 
      001D8D                       5082 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      009AAF 26 05                    1 	.word LINK 
                           001D8F     2 	LINK=.
      001D8F                          3 ODR:
      009AB1 A6                       4 	.byte 3+F_IFUNC 	
      009AB2 05 CC 87                 5 	.ascii "ODR"
      009AB5 AA 60                    6 	.word ODR_IDX 
      009AB6                       5083 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      009AB6 90 93                    1 	.word LINK 
                           001D97     2 	LINK=.
      001D97                          3 NOT:
      009AB8 EE                       4 	.byte 3+F_IFUNC 	
      009AB9 04 A3 9A                 5 	.ascii "NOT"
      009ABC 9A 26                    6 	.word NOT_IDX 
      001D9D                       5084 	_dict_entry,4,NEXT,NEXT_IDX;next 
      009ABE F2 90                    1 	.word LINK 
                           001D9F     2 	LINK=.
      001D9F                          3 NEXT:
      009AC0 CF                       4 	.byte 4 	
      009AC1 00 07 90 E6              5 	.ascii "NEXT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009AC5 02 C7                    6 	.word NEXT_IDX 
      001DA6                       5085 	_dict_entry,3,NEW,NEW_IDX;new
      009AC7 00 0A                    1 	.word LINK 
                           001DA8     2 	LINK=.
      001DA8                          3 NEW:
      009AC9 35                       4 	.byte 3 	
      009ACA 06 00 09                 5 	.ascii "NEW"
      009ACD 81 5C                    6 	.word NEW_IDX 
      009ACE                       5086 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      009ACE 72 5F                    1 	.word LINK 
                           001DB0     2 	LINK=.
      001DB0                          3 MULDIV:
      009AD0 00                       4 	.byte 6+F_IFUNC 	
      009AD1 07 72 5F 00 08 72        5 	.ascii "MULDIV"
      009AD7 5F 00                    6 	.word MULDIV_IDX 
      001DB9                       5087 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      009AD9 09 72                    1 	.word LINK 
                           001DBB     2 	LINK=.
      001DBB                          3 LSHIFT:
      009ADB 5F                       4 	.byte 6+F_IFUNC 	
      009ADC 00 0A CE 00 1A 54        5 	.ascii "LSHIFT"
      009AE1 00 56                    6 	.word LSHIFT_IDX 
      001DC4                       5088 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      009AE1 C3 00                    1 	.word LINK 
                           001DC6     2 	LINK=.
      001DC6                          3 LOG:
      009AE3 1C                       4 	.byte 3+F_IFUNC 	
      009AE4 24 1B 90                 5 	.ascii "LOG"
      009AE7 93 EE                    6 	.word LOG_IDX 
      001DCC                       5089 	_dict_entry 4,LIST,LIST_IDX;list
      009AE9 04 1C                    1 	.word LINK 
                           001DCE     2 	LINK=.
      001DCE                          3 LIST:
      009AEB 9F                       4 	.byte 4 	
      009AEC C9 FE A3 9A              5 	.ascii "LIST"
      009AF0 9A 26                    6 	.word LIST_IDX 
      001DD5                       5090 	_dict_entry 3,LET,LET_IDX;let 
      009AF2 1A 90                    1 	.word LINK 
                           001DD7     2 	LINK=.
      001DD7                          3 LET:
      009AF4 CF                       4 	.byte 3 	
      009AF5 00 07 90                 5 	.ascii "LET"
      009AF8 E6 02                    6 	.word LET_IDX 
      001DDD                       5091 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      009AFA C7 00                    1 	.word LINK 
                           001DDF     2 	LINK=.
      001DDF                          3 KEY:
      009AFC 0A                       4 	.byte 3+F_IFUNC 	
      009AFD 35 06 00                 5 	.ascii "KEY"
      009B00 09 72                    6 	.word KEY_IDX 
      001DE5                       5092 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      009B02 5D 00                    1 	.word LINK 
                           001DE7     2 	LINK=.
      001DE7                          3 IWDGREF:
      009B04 0A                       4 	.byte 7 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009B05 26 05 A6 0C CC 87 AA     5 	.ascii "IWDGREF"
      009B0C 81 4C                    6 	.word IWDGREF_IDX 
      009B0D                       5093 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      009B0D 93 E6                    1 	.word LINK 
                           001DF3     2 	LINK=.
      001DF3                          3 IWDGEN:
      009B0F 02                       4 	.byte 6 	
      009B10 C7 00 0E 72 5F 00        5 	.ascii "IWDGEN"
      009B16 0D 72                    6 	.word IWDGEN_IDX 
      001DFC                       5094 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      009B18 BB 00                    1 	.word LINK 
                           001DFE     2 	LINK=.
      001DFE                          3 INVERT:
      009B1A 0D                       4 	.byte 6+F_IFUNC 	
      009B1B 20 C4 56 45 52 54        5 	.ascii "INVERT"
      009B1D 00 48                    6 	.word INVERT_IDX 
      001E07                       5095 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      009B1D 52 06                    1 	.word LINK 
                           001E09     2 	LINK=.
      009B1F                          3 INPUT:
      009B1F C6                       4 	.byte 5 	
      009B20 00 09 C1 00 0A           5 	.ascii "INPUT"
      009B25 27 37                    6 	.word INPUT_IDX 
      001E11                       5096 	_dict_entry,2,IF,IF_IDX;if 
      009B27 CD 90                    1 	.word LINK 
                           001E13     2 	LINK=.
      001E13                          3 IF:
      009B29 45                       4 	.byte 2 	
      009B2A CE 00                    5 	.ascii "IF"
      009B2C 07 CF                    6 	.word IF_IDX 
      001E18                       5097 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      009B2E 00 05                    1 	.word LINK 
                           001E1A     2 	LINK=.
      001E1A                          3 IDR:
      009B30 55                       4 	.byte 3+F_IFUNC 	
      009B31 00 09 00                 5 	.ascii "IDR"
      009B34 02 55                    6 	.word IDR_IDX 
      001E20                       5098 	_dict_entry,3,HEX,HEX_IDX;hex_base
      009B36 00 0A                    1 	.word LINK 
                           001E22     2 	LINK=.
      001E22                          3 HEX:
      009B38 00                       4 	.byte 3 	
      009B39 04 CD 8D                 5 	.ascii "HEX"
      009B3C 4F A1                    6 	.word HEX_IDX 
      001E28                       5099 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      009B3E 84 27                    1 	.word LINK 
                           001E2A     2 	LINK=.
      001E2A                          3 GPIO:
      009B40 03                       4 	.byte 4+F_IFUNC 	
      009B41 CC 87 A8 4F              5 	.ascii "GPIO"
      009B44 00 3E                    6 	.word GPIO_IDX 
      001E31                       5100 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      009B44 1F 05                    1 	.word LINK 
                           001E33     2 	LINK=.
      001E33                          3 GOTO:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009B46 CD                       4 	.byte 4 	
      009B47 88 97 CE 00              5 	.ascii "GOTO"
      009B4B 05 CF                    6 	.word GOTO_IDX 
      001E3A                       5101 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      009B4D 00 07                    1 	.word LINK 
                           001E3C     2 	LINK=.
      001E3C                          3 GOSUB:
      009B4F 55                       4 	.byte 5 	
      009B50 00 02 00 09 CD           5 	.ascii "GOSUB"
      009B55 90 55                    6 	.word GOSUB_IDX 
      001E44                       5102 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      009B57 1E 05                    1 	.word LINK 
                           001E46     2 	LINK=.
      001E46                          3 FREE:
      009B59 A6                       4 	.byte 4+F_IFUNC 	
      009B5A 84 5B 06 81              5 	.ascii "FREE"
      009B5E 00 9A                    6 	.word FREE_IDX 
      001E4D                       5103 	_dict_entry,3,FOR,FOR_IDX;for 
      009B5E 90 CE                    1 	.word LINK 
                           001E4F     2 	LINK=.
      001E4F                          3 FOR:
      009B60 00                       4 	.byte 3 	
      009B61 07 72 5F                 5 	.ascii "FOR"
      009B64 00 07                    6 	.word FOR_IDX 
      001E55                       5104 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      009B66 72 5F                    1 	.word LINK 
                           001E57     2 	LINK=.
      001E57                          3 FCPU:
      009B68 00                       4 	.byte 4 	
      009B69 08 72 5F 00              5 	.ascii "FCPU"
      009B6D 09 72                    6 	.word FCPU_IDX 
      001E5E                       5105 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      009B6F 5F 00                    1 	.word LINK 
                           001E60     2 	LINK=.
      001E60                          3 ERASE:
      009B71 0A                       4 	.byte 5 	
      009B72 CD 9B 0D 20 A8           5 	.ascii "ERASE"
      009B77 00 32                    6 	.word ERASE_IDX 
      001E68                       5106 	_dict_entry,3,END,END_IDX;cmd_end  
      009B77 CD 8C                    1 	.word LINK 
                           001E6A     2 	LINK=.
      001E6A                          3 END:
      009B79 50                       4 	.byte 3 	
      009B7A A1 02 27                 5 	.ascii "END"
      009B7D 03 CC                    6 	.word END_IDX 
      001E70                       5107 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      009B7F 87 A8                    1 	.word LINK 
                           001E72     2 	LINK=.
      009B81                          3 EEPROM:
      009B81 72                       4 	.byte 6+F_IFUNC 	
      009B82 12 50 C7 85 5D 27        5 	.ascii "EEPROM"
      009B88 21 85                    6 	.word EEPROM_IDX 
      001E7B                       5108 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      009B8A A6 08                    1 	.word LINK 
                           001E7D     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      001E7D                          3 EDIT:
      009B8C 42                       4 	.byte 4 	
      009B8D 9F C7 52 00              5 	.ascii "EDIT"
      009B91 72 1A                    6 	.word EDIT_IDX 
      001E84                       5109 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      009B93 50 14                    1 	.word LINK 
                           001E86     2 	LINK=.
      001E86                          3 DWRITE:
      009B95 72                       4 	.byte 6+F_CMD 	
      009B96 1A 50 16 72 14 52        5 	.ascii "DWRITE"
      009B9C 00 72                    6 	.word DWRITE_IDX 
      001E8F                       5110 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      009B9E 12 52                    1 	.word LINK 
                           001E91     2 	LINK=.
      001E91                          3 DREAD:
      009BA0 01                       4 	.byte 5+F_IFUNC 	
      009BA1 72 10 52 01 72           5 	.ascii "DREAD"
      009BA6 1C 52                    6 	.word DREAD_IDX 
      001E99                       5111 	_dict_entry,2,DO,DO_IDX;do_loop
      009BA8 00 81                    1 	.word LINK 
                           001E9B     2 	LINK=.
      009BAA                          3 DO:
      009BAA 5B                       4 	.byte 2 	
      009BAB 02 A6                    5 	.ascii "DO"
      009BAD 82 C4                    6 	.word DO_IDX 
      001EA0                       5112 	_dict_entry,3,DEC,DEC_IDX;dec_base
      009BAF 52 03                    1 	.word LINK 
                           001EA2     2 	LINK=.
      001EA2                          3 DEC:
      009BB1 A1                       4 	.byte 3 	
      009BB2 02 26 F7                 5 	.ascii "DEC"
      009BB5 72 1D                    6 	.word DEC_IDX 
      001EA8                       5113 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      009BB7 52 00                    1 	.word LINK 
                           001EAA     2 	LINK=.
      001EAA                          3 DDR:
      009BB9 72                       4 	.byte 3+F_IFUNC 	
      009BBA 13 50 C7                 5 	.ascii "DDR"
      009BBD 72 1B                    6 	.word DDR_IDX 
      001EB0                       5114 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      009BBF 50 16                    1 	.word LINK 
                           001EB2     2 	LINK=.
      001EB2                          3 DATALN:
      009BC1 81                       4 	.byte 6 	
      009BC2 44 41 54 41 4C 4E        5 	.ascii "DATALN"
      009BC2 A6 78                    6 	.word DATALN_IDX 
      001EBB                       5115 	_dict_entry,4,DATA,DATA_IDX;data  
      009BC4 C5 52                    1 	.word LINK 
                           001EBD     2 	LINK=.
      001EBD                          3 DATA:
      009BC6 03                       4 	.byte 4 	
      009BC7 27 04 72 5F              5 	.ascii "DATA"
      009BCB 52 03                    6 	.word DATA_IDX 
      001EC4                       5116 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      009BCD 81 BD                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                           001EC6     2 	LINK=.
      009BCE                          3 CRL:
      009BCE 88                       4 	.byte 3+F_IFUNC 	
      009BCF CD 9B C2                 5 	.ascii "CRL"
      009BD2 84 72                    6 	.word CRL_IDX 
      001ECC                       5117 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      009BD4 03 52                    1 	.word LINK 
                           001ECE     2 	LINK=.
      001ECE                          3 CRH:
      009BD6 03                       4 	.byte 3+F_IFUNC 	
      009BD7 FB C7 52                 5 	.ascii "CRH"
      009BDA 04 72                    6 	.word CRH_IDX 
      001ED4                       5118 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      009BDC 01 52                    1 	.word LINK 
                           001ED6     2 	LINK=.
      001ED6                          3 CHAR:
      009BDE 03                       4 	.byte 4+F_CFUNC 	
      009BDF FB C6 52 04              5 	.ascii "CHAR"
      009BE3 81 18                    6 	.word CHAR_IDX 
      009BE4                       5119 	_dict_entry,3,BYE,BYE_IDX;bye 
      009BE4 A6 FF                    1 	.word LINK 
                           001EDF     2 	LINK=.
      001EDF                          3 BYE:
      009BE6 72                       4 	.byte 3 	
      009BE7 01 52 03                 5 	.ascii "BYE"
      009BEA E3 C6                    6 	.word BYE_IDX 
      001EE5                       5120 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      009BEC 52 04                    1 	.word LINK 
                           001EE7     2 	LINK=.
      001EE7                          3 BTOGL:
      009BEE 81                       4 	.byte 5 	
      009BEF 42 54 4F 47 4C           5 	.ascii "BTOGL"
      009BEF CD 8D                    6 	.word BTOGL_IDX 
      001EEF                       5121 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      009BF1 4F A1                    1 	.word LINK 
                           001EF1     2 	LINK=.
      001EF1                          3 BTEST:
      009BF3 84                       4 	.byte 5+F_IFUNC 	
      009BF4 27 03 CC 87 A8           5 	.ascii "BTEST"
      009BF9 00 12                    6 	.word BTEST_IDX 
      001EF9                       5122 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      009BF9 9F CD                    1 	.word LINK 
                           001EFB     2 	LINK=.
      001EFB                          3 BSET:
      009BFB 9B                       4 	.byte 4 	
      009BFC CE CD 88 97              5 	.ascii "BSET"
      009C00 A1 09                    6 	.word BSET_IDX 
      001F02                       5123 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      009C02 26 02                    1 	.word LINK 
                           001F04     2 	LINK=.
      001F04                          3 BRES:
      009C04 20                       4 	.byte 4 	
      009C05 E9 4D 27 05              5 	.ascii "BRES"
      009C09 55 00                    6 	.word BRES_IDX 
      001F0B                       5124 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009C0B 03 00                    1 	.word LINK 
                           001F0D     2 	LINK=.
      001F0D                          3 BIT:
      009C0D 02                       4 	.byte 3+F_IFUNC 	
      009C0E 81 49 54                 5 	.ascii "BIT"
      009C0F 00 0C                    6 	.word BIT_IDX 
      001F13                       5125 	_dict_entry,3,AWU,AWU_IDX;awu 
      009C0F CD 9B                    1 	.word LINK 
                           001F15     2 	LINK=.
      001F15                          3 AWU:
      009C11 E4                       4 	.byte 3 	
      009C12 5F 97 A6                 5 	.ascii "AWU"
      009C15 84 81                    6 	.word AWU_IDX 
      009C17                       5126 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      009C17 CD 88                    1 	.word LINK 
                           001F1D     2 	LINK=.
      001F1D                          3 ASC:
      009C19 97                       4 	.byte 3+F_IFUNC 	
      009C1A A1 84 27                 5 	.ascii "ASC"
      009C1D 03 CC                    6 	.word ASC_IDX 
      001F23                       5127 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      009C1F 87 A8                    1 	.word LINK 
                           001F25     2 	LINK=.
      001F25                          3 AND:
      009C21 5D                       4 	.byte 3+F_IFUNC 	
      009C22 27 05 72                 5 	.ascii "AND"
      009C25 1B 50                    6 	.word AND_IDX 
      001F2B                       5128 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      009C27 14 81                    1 	.word LINK 
                           001F2D     2 	LINK=.
      009C29                          3 ADCREAD:
      009C29 72                       4 	.byte 7+F_IFUNC 	
      009C2A 1A 50 14 81 45 41 44     5 	.ascii "ADCREAD"
      009C2E 00 04                    6 	.word ADCREAD_IDX 
      001F37                       5129 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      009C2E AE 16                    1 	.word LINK 
                           001F39     2 	LINK=.
      001F39                          3 ADCON:
      009C30 E0                       4 	.byte 5 	
      009C31 B6 84 81 4F 4E           5 	.ascii "ADCON"
      009C34 00 02                    6 	.word ADCON_IDX 
      001F41                       5130 kword_dict::
      001F41                       5131 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      009C34 00 00                    1 	.word LINK 
                           001F43     2 	LINK=.
      009C36                          3 ABS:
      009C36 43                       4 	.byte 3+F_IFUNC 	
      009C37 58 4F 52                 5 	.ascii "ABS"
      009C3A 00 C2                    6 	.word ABS_IDX 
                                   5132 
                                   5133 ;comands and fonctions address table 	
      001F49                       5134 code_addr::
      009C3C 9C 36 13 02 13 3E 16  5135 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             FA 15 D7 16 97 19 48
      009C3E 10 90 10 80 10 B1 10  5136 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



             A1 16 70 15 C5 1A 02
      009C3E 05 57 52 49 54 45 00  5137 	.word const_cr1,data,data_line,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             C0 9C 3E 19 71 13 72
             13 A2
      009C48 0E FB 1A 14 12 AE 14  5138 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
             6A 17 74 14 D6 11 0C
             12 17 11 FC 16 13
      009C48 05 57 4F 52 44 53 00  5139 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             BE 9C 48 18 F2 19 28
             15 FE
      009C52 0E 33 0E 66 19 2D 17  5140 	.word let,list,log2,lshift,muldiv,next,new ; 40..47
             42 0B 55 11 8C 14 29
      009C52 04 57 41 49 54 00 BC  5141 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             9C 52 84 17 80 10 E7
             1A 0E
      009C5B 10 D8 1A 08 0F 5F 19  5142 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             B4 19 BA 19 C0 19 C6
             19 CC
      009C5B 43 55 53 52 00 BA 9C  5143 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             5B 16 06 1A 9D 04 6F
             10 55
      009C63 1A 4E 12 37 17 FC 17  5144 	.word restore,return, random,rshift,run,show,free ; 72..79
             5B 12 55 0D 70 0D BB
      009C63 05 55 4E 54 49 4C 00  5145 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             B8 9C 63 11 65 13 DD
             16 E0
      009C6D 18 C9 18 D8 11 35 12  5146 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             BE 0E 29 16 3D 19 86
             16 53
      009C6D 46 55 46 4C 41 53 48  5147 	.word wait,words,write,bit_xor,cmd_size ; 96..99
             00 B6 9C
      009C77 6D 00                 5148 	.word 0 
                                   5149 
                                   5150 
                                   5151 
                                   5152 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                     56 
      009C78 43 81 44 80 48 82 46    57 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
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
      00201D                         70 get_escape:
      009C78 46 55 42         [ 4]   71     call getc 
      009C7B 4F 55            [ 1]   72     cp a,#'[ ; this character is expected after ESC 
      009C7D 4E 44            [ 1]   73     jreq 1$
      009C7F 00               [ 1]   74     clr a
      009C80 B4               [ 4]   75     ret
      009C81 9C 78 C2         [ 4]   76 1$: call getc 
      009C83 AE 20 11         [ 2]   77     ldw x,#convert_table
      00202C                         78 2$:
      009C83 04               [ 1]   79     cp a,(x)
      009C84 54 4F            [ 1]   80     jreq 4$
      009C86 4E 45 00         [ 2]   81     addw x,#2
      009C89 B2               [ 1]   82     tnz (x)
      009C8A 9C 83            [ 1]   83     jrne 2$
      009C8C 4F               [ 1]   84     clr a
      009C8C 02               [ 4]   85     ret 
      009C8D 54               [ 1]   86 4$: incw x 
      009C8E 4F               [ 1]   87     ld a,(x)
      009C8F 00 B0            [ 1]   88     cp a,#SUP
      009C91 9C 8C            [ 1]   89     jrne 5$
      009C93 88               [ 1]   90     push a 
      009C93 05 54 49         [ 4]   91     call getc
      009C96 4D               [ 1]   92     pop a 
      002042                         93 5$:
      009C97 45               [ 4]   94     ret 
                                     95 
                                     96 
                                     97 ;-----------------------------
                                     98 ; send an ASCIZ string to UART1 
                                     99 ; input: 
                                    100 ;   x 		char * 
                                    101 ; output:
                                    102 ;   none 
                                    103 ;-------------------------------
      002043                        104 puts::
      009C98 52               [ 1]  105     ld a,(x)
      009C99 00 AC            [ 1]  106 	jreq 1$
      009C9B 9C 93 B2         [ 4]  107 	call putc 
      009C9D 5C               [ 1]  108 	incw x 
      009C9D 47 54            [ 2]  109 	jra puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009C9F 49               [ 4]  110 1$:	ret 
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
      00204D                        121 bksp:
      009CA0 4D 45            [ 1]  122 	ld a,#BS 
      009CA2 4F 55 54         [ 4]  123 	call putc 
      009CA5 00 AE            [ 1]  124 	ld a,#SPACE 
      009CA7 9C 9D B2         [ 4]  125 	call putc 
      009CA9 A6 08            [ 1]  126 	ld a,#BS 
      009CA9 45 54 49         [ 4]  127 	call putc 
      009CAC 43               [ 4]  128 	ret 
                                    129 ;---------------------------
                                    130 ; delete n character left of cursor 
                                    131 ; at terminal.
                                    132 ; input: 
                                    133 ;   A   number of characters to delete.
                                    134 ; output:
                                    135 ;    none 
                                    136 ;--------------------------	
      00205D                        137 delete_nchar:
      009CAD 4B               [ 1]  138 	push a 
      009CAE 53 00            [ 1]  139 0$:	tnz (1,sp)
      009CB0 AA 9C            [ 1]  140 	jreq 1$
      009CB2 A9 20 4D         [ 4]  141 	call bksp 
      009CB3 0A 01            [ 1]  142 	dec (1,sp)
      009CB3 04 53            [ 2]  143 	jra 0$
      009CB5 54               [ 1]  144 1$:	pop a 
      009CB6 4F               [ 4]  145 	ret
                                    146 
                                    147 ;--------------------------
                                    148 ; send ANSI escape sequence
                                    149 ; ANSI: ESC[
                                    150 ; note: ESC is ASCII 27
                                    151 ;       [   is ASCII 91  
                                    152 ;-------------------------- 
      00206B                        153 send_escape:
      009CB7 50 00            [ 1]  154 	ld a,#ESC 
      009CB9 A8 9C B3         [ 4]  155 	call putc 
      009CBC A6 5B            [ 1]  156 	ld a,#'[
      009CBC 04 53 54         [ 4]  157 	call putc 
      009CBF 45               [ 4]  158 	ret 
                                    159 
                                    160 ;---------------------
                                    161 ;send ANSI parameter value
                                    162 ; ANSI parameter values are 
                                    163 ; sent as ASCII charater 
                                    164 ; not as binary number.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
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
      002076                        174 send_parameter:
      009CC0 50               [ 2]  175 	pushw x 
      009CC1 00               [ 1]  176 	clrw x 
      009CC2 A6               [ 1]  177 	ld xl,a 
      009CC3 9C BC            [ 1]  178 	ld a,#10 
      009CC5 62               [ 2]  179 	div x,a 
      009CC5 05               [ 1]  180 	ld xh,a 
      009CC6 53               [ 1]  181 	ld a,xl
      009CC7 50               [ 1]  182     tnz a 
      009CC8 49 57            [ 1]  183     jreq 2$
      009CCA 52 00            [ 1]  184 	cp a,#9 
      009CCC A4 9C            [ 2]  185 	jrule 1$
      009CCE C5 39            [ 1]  186 	ld a,#'9
      009CCF                        187 1$:
      009CCF 06 53            [ 1]  188 	add a,#'0 
      009CD1 50 49 53         [ 4]  189 	call putc
      009CD4 45               [ 1]  190 2$:	ld a,xh 
      009CD5 4C 00            [ 1]  191 	add a,#'0
      009CD7 A2 9C CF         [ 4]  192 	call putc 
      009CDA 85               [ 2]  193 	popw x 
      009CDA 45               [ 4]  194 	ret 
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
      002094                        207 move_left:
      009CDB 53               [ 1]  208 	push a 
      009CDC 50 49 52         [ 4]  209 	call send_escape
      009CDF 44               [ 1]  210     pop a
      009CE0 00 9E 9C         [ 4]  211 	call send_parameter 
      009CE3 DA 44            [ 1]  212 	ld a,#'D 
      009CE4 CD 02 B2         [ 4]  213 	call putc 
      009CE4 05               [ 4]  214 	ret	
                                    215 
                                    216 
                                    217 ;--------------------------
                                    218 ; move cursor right n character 
                                    219 ; ANSI: ESC[PnC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                    220 ; input:
                                    221 ;   A     character count
                                    222 ; output:
                                    223 ;   none
                                    224 ;--------------------------
      0020A2                        225 move_right:
      009CE5 53               [ 1]  226 	push a 
      009CE6 50 49 45         [ 4]  227 	call send_escape
      009CE9 4E               [ 1]  228     pop a
      009CEA 00 A0 9C         [ 4]  229 	call send_parameter 
      009CED E4 43            [ 1]  230 	ld a,#'C 
      009CEE CD 02 B2         [ 4]  231 	call putc 
      009CEE 05               [ 4]  232 	ret 
                                    233 
                                    234 
                                    235 ;--------------------------
                                    236 ; print n spaces on terminal
                                    237 ; input:
                                    238 ;  X 		number of spaces 
                                    239 ; output:
                                    240 ;	none 
                                    241 ;---------------------------
      0020B0                        242 spaces::
      009CEF 53 4C            [ 1]  243 	ld a,#SPACE 
      009CF1 45               [ 2]  244 1$:	tnzw x
      009CF2 45 50            [ 1]  245 	jreq 9$
      009CF4 00 9C 9C         [ 4]  246 	call putc 
      009CF7 EE               [ 2]  247 	decw x
      009CF8 20 F7            [ 2]  248 	jra 1$
      0020BB                        249 9$: 
      009CF8 04               [ 4]  250 	ret 
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
      0020BC                        267 insert_char: 
      0020BC                        268 	_vars VSIZE 
      009CF9 53 49            [ 2]    1     sub sp,#VSIZE 
      009CFB 5A 45            [ 1]  269     ld (KCHAR,sp),a 
      009CFD 00               [ 1]  270     ld a,xh 
      009CFE C4 9C            [ 1]  271 	ld (IPOS,sp),a
      009D00 F8               [ 1]  272     ld a,xl 
      009D01 6B 03            [ 1]  273     ld (LLEN,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009D01 04               [ 1]  274     ldw x,y
      009D02 53               [ 1]  275     incw x 
      009D03 48 4F            [ 1]  276     ld a,(LLEN,sp)
      009D05 57 00            [ 1]  277     sub a,(IPOS,sp)
      009D07 98               [ 1]  278     inc a 
      009D08 9D 01 0D         [ 1]  279     ld acc8,a 
      009D0A 72 5F 00 0C      [ 1]  280     clr acc16
      009D0A 04 53 41         [ 4]  281     call move
      009D0D 56 45 00 36      [ 2]  282     ldw y,#tib 
      009D11 9D 0A            [ 1]  283     ld a,(IPOS,sp)
      009D13 C7 00 0D         [ 1]  284     ld acc8,a 
      009D13 03 52 55 4E      [ 2]  285     addw y,acc16 
      009D17 00 96            [ 1]  286     ld a,(KCHAR,sp)
      009D19 9D 13            [ 1]  287     ld (y),a
      009D1B 90 5C            [ 1]  288     incw y  
      009D1B 46 52            [ 1]  289     ld a,(IPOS,sp)
      009D1D 53 48 49         [ 4]  290     call move_left
      009D20 46 54 00         [ 2]  291     ldw x,#tib 
      009D23 94 9D 1B         [ 4]  292     call puts 
      009D26 7B 03            [ 1]  293     ld a,(LLEN,sp)
      009D26 43 52            [ 1]  294     sub a,(IPOS,sp) 
      009D28 4E 44 00         [ 4]  295     call move_left 
      0020FC                        296 	_drop VSIZE 
      009D2B 92 9D            [ 2]    1     addw sp,#VSIZE 
      009D2D 26               [ 4]  297 	ret 
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
      009D2E                        310 delete_under:
      0020FF                        311 	_vars VSIZE 
      009D2E 06 52            [ 2]    1     sub sp,#VSIZE 
      009D30 45 54            [ 1]  312     ld (LLEN,sp),a 
      009D32 55               [ 1]  313     ld a,xl 
      009D33 52 4E            [ 1]  314     ld (CPOS,sp),a 
      009D35 00               [ 1]  315     ldw x,y ; move destination
      009D36 90 9D            [ 1]  316     incw y  ; move source 
      009D38 2E 02            [ 1]  317     ld a,(LLEN,sp)
      009D39 10 01            [ 1]  318     sub a,(CPOS,sp)
      009D39 07               [ 1]  319     inc a ; move including zero at end.
      009D3A 52 45 53         [ 1]  320     ld acc8,a 
      009D3D 54 4F 52 45      [ 1]  321     clr acc16 
      009D41 00 8E 9D         [ 4]  322 	call move 
      009D44 39 AE 16 90      [ 2]  323     ldw y,#tib 
      009D45 7B 01            [ 1]  324     ld a,(CPOS,sp)
      009D45 06 52 45         [ 1]  325     ld acc8,a 
      009D48 4D 41 52 4B      [ 2]  326     addw y,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009D4C 00               [ 1]  327     ldw x,y 
      009D4D 8C 9D 45         [ 4]  328     call puts 
      009D50 A6 20            [ 1]  329     ld a,#SPACE  
      009D50 06 52 45         [ 4]  330     call putc
      009D53 42 4F            [ 1]  331     ld a,(LLEN,sp)
      009D55 4F 54            [ 1]  332     sub a,(CPOS,sp)
      009D57 00 8A 9D         [ 4]  333     call move_left 
      009D5A 50 02            [ 1]  334     dec (LLEN,sp)
      009D5B                        335 	_drop VSIZE 
      009D5B 44 52            [ 2]    1     addw sp,#VSIZE 
      009D5D 45               [ 4]  336 	ret 
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
      00213A                        348 delete_line:
      009D5E 41 44 00         [ 4]  349     call send_escape
      009D61 88 9D            [ 1]  350 	ld a,#'2
      009D63 5B 02 B2         [ 4]  351 	call putc 
      009D64 A6 4B            [ 1]  352 	ld a,#'K 
      009D64 44 51 4B         [ 4]  353 	call putc 
      009D67 45               [ 4]  354 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                           000001   381 	RXCHAR = 1 ; last char received
                           000002   382 	LL = 2  ; accepted line length
                           000003   383 	CPOS=3  ; cursor position 
                           000004   384 	OVRWR=4 ; overwrite flag 
                           000004   385 	VSIZE=4 
      002148                        386 readln::
      002148                        387 	_vars VSIZE 
      009D68 59 00            [ 2]    1     sub sp,#VSIZE 
      009D6A 86               [ 1]  388 	clrw x 
      009D6B 9D 64            [ 2]  389 	ldw (LL,sp),x 
      009D6D 1F 03            [ 2]  390 	ldw (CPOS,sp),x 
      009D6D 44 50            [ 1]  391 	cpl (OVRWR,sp) ; default to overwrite mode 
      009D6F 52 54 49 00      [ 2]  392  	ldw y,#tib ; input buffer
      002155                        393 readln_loop:
      009D73 84 9D 6D         [ 4]  394 	call getc
      009D76 6B 01            [ 1]  395 	ld (RXCHAR,sp),a
      009D76 44 50            [ 1]  396     cp a,#ESC 
      009D78 52 54            [ 1]  397     jrne 0$
      009D7A 48 00 82         [ 4]  398     call get_escape 
      009D7D 9D 76            [ 1]  399     ld (RXCHAR,sp),a 
      009D7F A1 0D            [ 1]  400 0$:	cp a,#CR
      009D7F 44 50            [ 1]  401 	jrne 1$
      009D81 52 54 47         [ 2]  402 	jp readln_quit
      009D84 00 80            [ 1]  403 1$:	cp a,#LF 
      009D86 9D 7F            [ 1]  404 	jrne 2$ 
      009D88 CC 22 F1         [ 2]  405 	jp readln_quit
      002171                        406 2$:
      009D88 44 50            [ 1]  407 	cp a,#BS
      009D8A 52 54            [ 1]  408 	jrne 3$
                                    409 ; delete left 
      009D8C 46 00            [ 1]  410     tnz (CPOS,sp)
      009D8E 7E 9D            [ 1]  411     jreq readln_loop 
      009D90 88 01            [ 1]  412     ld a,#1 
      009D91 CD 20 94         [ 4]  413     call move_left
      009D91 44 50            [ 1]  414     dec (CPOS,sp)
      009D93 52 54            [ 2]  415     decw y 
      009D95 45 00            [ 1]  416     ld a,(CPOS,sp) 
      009D97 7C 9D 91         [ 2]  417     jp 12$
      009D9A                        418 3$:
      009D9A 44 50            [ 1]  419 	cp a,#CTRL_D
      009D9C 52 54            [ 1]  420 	jrne 4$
                                    421 ;delete line 
      009D9E 44 00 7A         [ 4]  422 	call delete_line 
      009DA1 9D 9A            [ 1]  423     ld a,(CPOS,sp)
      009DA3 4C               [ 1]  424     inc a 
      009DA3 44 50 52         [ 4]  425     call move_left 
      009DA6 54 43            [ 1]  426 	ld a,#'> 
      009DA8 00 78 9D         [ 4]  427 	call putc 
      009DAB A3 AE 16 90      [ 2]  428 	ldw y,#tib
      009DAC 90 7F            [ 1]  429 	clr (y)
      009DAC 44 50            [ 1]  430 	clr (LL,sp)
      009DAE 52 54            [ 1]  431 	clr (CPOS,sp)
      009DB0 42 00            [ 2]  432 	jra readln_loop
      0021A5                        433 4$:
      009DB2 76 9D            [ 1]  434 	cp a,#CTRL_R 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009DB4 AC 21            [ 1]  435 	jrne 5$
                                    436 ;reprint 
      009DB5 0D 02            [ 1]  437 	tnz (LL,sp)
      009DB5 44 50            [ 1]  438 	jrne readln_loop
      009DB7 52 54 41         [ 2]  439 	ldw x,#tib 
      009DBA 00 74 9D         [ 4]  440 	call strlen 
      009DBD B5 AE 16 90      [ 2]  441 	ldw y,#tib 
      009DBE 27 9C            [ 1]  442 	jreq readln_loop
      009DBE 05 50            [ 1]  443 	ld (LL,sp),a 
      009DC0 52 49            [ 1]  444     ld (CPOS,sp),a
      009DC2 4E 54 00         [ 2]  445 	ldw x,#tib 
      009DC5 72 9D BE         [ 4]  446 	call puts
      009DC8 0F 01            [ 1]  447 	clr (LL_HB,sp)
      009DC8 44 50 4F         [ 2]  448 	addw y,(LL_HB,sp)
      009DCB 55 54            [ 2]  449 	jra readln_loop 
      0021CA                        450 5$:
      009DCD 00 70            [ 1]  451 	cp a,#CTRL_E 
      009DCF 9D C8            [ 1]  452 	jrne 6$
                                    453 ;edit line number 
      009DD1 AE 16 90         [ 2]  454 	ldw x,#tib 
      009DD1 04 50 4F         [ 4]  455 	call atoi24
      009DD4 4B 45 00         [ 2]  456 	ldw x,acc16
      009DD7 6E 9D D1         [ 4]  457 	call search_lineno
      009DDA 5D               [ 2]  458 	tnzw x 
      009DDA 05 50            [ 1]  459 	jrne 51$
      009DDC 4D 4F            [ 1]  460 	clr (LL,sp)
      009DDE 44 45 00 68      [ 2]  461 	ldw y,#tib
      009DE2 9D DA            [ 1]  462     clr (y) 	
      009DE4 CC 22 F1         [ 2]  463 	jp readln_quit  
      0021E8                        464 51$:
      009DE4 44 50 49         [ 2]  465 	ldw basicptr,x
      009DE7 4E 50            [ 1]  466 	ld a,(2,x)
      009DE9 00 6C 9D         [ 1]  467 	ld count,a 
      009DEC E4 AE 16 90      [ 2]  468 	ldw y,#tib 
      009DED CD 28 3C         [ 4]  469 	call decompile 
      009DED 44 50            [ 1]  470 	clr (LL_HB,sp)
      009DEF 45 45            [ 1]  471 	ld a,#CR 
      009DF1 4B 00 6A         [ 4]  472 	call putc 
      009DF4 9D ED            [ 1]  473 	ld a,#'>
      009DF6 CD 02 B2         [ 4]  474 	call putc
      009DF6 05 50 41         [ 2]  475     ldw x,#tib  
      009DF9 55 53 45         [ 4]  476 	call strlen 
      009DFC 00 66            [ 1]  477 	ld (LL,sp),a 
      009DFE 9D F6 43         [ 4]  478 	call puts 
      009E00 90 93            [ 1]  479 	ldw y,x
      009E00 43 50            [ 1]  480     ld a,(LL,sp)
      009E02 41 44            [ 1]  481     ld (CPOS,sp),a  
      009E04 00 64 9E         [ 2]  482 	jp readln_loop
      002217                        483 6$:
      009E07 00 81            [ 1]  484 	cp a,#ARROW_RIGHT
      009E08 26 15            [ 1]  485    	jrne 7$ 
                                    486 ; right arrow
      009E08 42 4F            [ 1]  487 	ld a,(CPOS,sp)
      009E0A 52 00            [ 1]  488     cp a,(LL,sp)
      009E0C 62 9E            [ 1]  489     jrmi 61$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009E0E 08 21 55         [ 2]  490     jp readln_loop 
      009E0F                        491 61$:
      009E0F 43 4F            [ 1]  492     ld a,#1 
      009E11 44 52 00         [ 4]  493 	call move_right 
      009E14 60 9E            [ 1]  494 	inc (CPOS,sp)
      009E16 0F 5C            [ 1]  495     incw y 
      009E17 CC 21 55         [ 2]  496     jp readln_loop 
      009E17 43 4E            [ 1]  497 7$: cp a,#ARROW_LEFT  
      009E19 4F 54            [ 1]  498 	jrne 8$
                                    499 ; left arrow 
      009E1B 00 5E            [ 1]  500 	tnz (CPOS,sp)
      009E1D 9E 17            [ 1]  501 	jrne 71$
      009E1F CC 21 55         [ 2]  502 	jp readln_loop
      00223B                        503 71$:
      009E1F 04 4E            [ 1]  504     ld a,#1 
      009E21 45 58 54         [ 4]  505 	call move_left 
      009E24 00 5A            [ 1]  506 	dec (CPOS,sp)
      009E26 9E 1F            [ 2]  507     decw y 
      009E28 CC 21 55         [ 2]  508 	jp readln_loop 
      009E28 03 4E            [ 1]  509 8$: cp a,#HOME  
      009E2A 45 57            [ 1]  510 	jrne 9$
                                    511 ; HOME 
      009E2C 00 5C            [ 1]  512     ld a,(CPOS,sp)
      009E2E 9E 28 94         [ 4]  513     call move_left 
      009E30 0F 03            [ 1]  514 	clr (CPOS,sp)
      009E30 46 4D 55 4C      [ 2]  515     ldw y,#tib 
      009E34 44 49 56         [ 2]  516 	jp readln_loop  
      009E37 00 58            [ 1]  517 9$: cp a,#KEY_END  
      009E39 9E 30            [ 1]  518 	jrne 10$
                                    519 ; KEY_END 
      009E3B 7B 03            [ 1]  520 	ld a,(CPOS,sp)
      009E3B 46 4C            [ 1]  521 	cp a,(LL,sp)
      009E3D 53 48            [ 1]  522 	jrne 91$
      009E3F 49 46 54         [ 2]  523 	jp readln_loop 
      002266                        524 91$:
      009E42 00 56            [ 1]  525 	ld a,(LL,sp)
      009E44 9E 3B            [ 1]  526 	sub a,(CPOS,sp)
      009E46 CD 20 A2         [ 4]  527 	call move_right 
      009E46 43 4C            [ 1]  528 	ld a,(LL,sp)
      009E48 4F 47            [ 1]  529 	ld (CPOS,sp),a
      009E4A 00 54 9E 46      [ 2]  530     ldw y,#tib
      009E4E 72 5F 00 0C      [ 1]  531     clr acc16 
      009E4E 04 4C 49         [ 1]  532     ld acc8,a 
      009E51 53 54 00 52      [ 2]  533     addw y,acc16  
      009E55 9E 4E 55         [ 2]  534 	jp readln_loop 
      009E57 A1 0F            [ 1]  535 10$: cp a,#CTRL_O
      009E57 03 4C            [ 1]  536 	jrne 11$ 
                                    537 ; toggle between insert/overwrite
      009E59 45 54            [ 1]  538 	cpl (OVRWR,sp)
      009E5B 00 50            [ 2]  539 	pushw y 
      009E5D 9E 57 B5         [ 4]  540 	call beep_1khz
      009E5F 90 85            [ 2]  541 	popw y 
      009E5F 43 4B 45         [ 2]  542 	jp readln_loop 
      009E62 59 00            [ 1]  543 11$: cp a,#SUP 
      009E64 4E 9E            [ 1]  544     jrne final_test 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                    545 ; del character under cursor 
      009E66 5F 03            [ 1]  546     ld a,(CPOS,sp)
      009E67 11 02            [ 1]  547     cp a,(LL,sp)
      009E67 07 49            [ 1]  548     jrpl 13$
      00229D                        549 12$:
      009E69 57               [ 1]  550     ld xl,a    ; cursor position 
      009E6A 44 47            [ 1]  551     ld a,(LL,sp)  ; line length
      009E6C 52 45 46         [ 4]  552     call delete_under
      009E6F 00 4C            [ 1]  553     dec (LLEN,sp)
      0022A5                        554 13$:
      009E71 9E 67 55         [ 2]  555     jp readln_loop 
      009E73                        556 final_test:
      009E73 06 49            [ 1]  557 	cp a,#SPACE
      009E75 57 44            [ 1]  558 	jrpl accept_char
      009E77 47 45 4E         [ 2]  559 	jp readln_loop
      0022AF                        560 accept_char:
      009E7A 00 4A            [ 1]  561 	ld a,#TIB_SIZE-1
      009E7C 9E 73            [ 1]  562 	cp a, (LL,sp)
      009E7E 2A 03            [ 1]  563 	jrpl 1$
      009E7E 46 49 4E         [ 2]  564 	jp readln_loop
      009E81 56 45            [ 1]  565 1$:	tnz (OVRWR,sp)
      009E83 52 54            [ 1]  566 	jrne overwrite
                                    567 ; insert mode 
      009E85 00 48            [ 1]  568     ld a,(CPOS,sp)
      009E87 9E 7E            [ 1]  569     cp a,(LL,sp)
      009E89 27 12            [ 1]  570     jreq overwrite
      009E89 05 49            [ 1]  571     ld a,(LL,sp)
      009E8B 4E               [ 1]  572     ld xl,a 
      009E8C 50 55            [ 1]  573     ld a,(CPOS,sp)
      009E8E 54               [ 1]  574     ld xh,a
      009E8F 00 46            [ 1]  575     ld a,(RXCHAR,sp)
      009E91 9E 89 BC         [ 4]  576     call insert_char
      009E93 0C 02            [ 1]  577     inc (LLEN,sp)
      009E93 02 49            [ 1]  578     inc (CPOS,sp)
      009E95 46 00 44         [ 2]  579     jp readln_loop 
      0022D4                        580 overwrite:
      009E98 9E 93            [ 1]  581 	ld a,(RXCHAR,sp)
      009E9A 90 F7            [ 1]  582 	ld (y),a
      009E9A 43 49            [ 1]  583     incw y
      009E9C 44 52 00         [ 4]  584     call putc 
      009E9F 42 9E            [ 1]  585 	ld a,(CPOS,sp)
      009EA1 9A 02            [ 1]  586 	cp a,(LL,sp)
      009EA2 2B 09            [ 1]  587 	jrmi 1$
      009EA2 03 48            [ 1]  588 	clr (y)
      009EA4 45 58            [ 1]  589 	inc (LL,sp)
      009EA6 00 40            [ 1]  590     inc (CPOS,sp)
      009EA8 9E A2 55         [ 2]  591 	jp readln_loop 
      009EAA                        592 1$:	
      009EAA 44 47            [ 1]  593 	inc (CPOS,sp)
      009EAC 50 49 4F         [ 2]  594 	jp readln_loop 
      0022F1                        595 readln_quit:
      009EAF 00 3E 9E AA      [ 2]  596 	ldw y,#tib
      009EB3 0F 01            [ 1]  597     clr (LL_HB,sp) 
      009EB3 04 47 4F         [ 2]  598     addw y,(LL_HB,sp)
      009EB6 54 4F            [ 1]  599     clr (y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009EB8 00 3C            [ 1]  600 	ld a,(LL,sp)
      009EBA 9E B3 03         [ 1]  601 	ld count,a 
      009EBC A6 0D            [ 1]  602 	ld a,#CR
      009EBC 05 47 4F         [ 4]  603 	call putc
      002306                        604 	_drop VSIZE 
      009EBF 53 55            [ 2]    1     addw sp,#VSIZE 
      009EC1 42               [ 4]  605 	ret
                                    606 
                                    607 ;------------------------------
                                    608 ; print byte  in hexadecimal 
                                    609 ; on console
                                    610 ; input:
                                    611 ;    A		byte to print
                                    612 ;------------------------------
      002309                        613 print_hex::
      009EC2 00               [ 1]  614 	push a 
      009EC3 3A               [ 1]  615 	swap a 
      009EC4 9E BC 20         [ 4]  616 	call to_hex_char 
      009EC6 CD 02 B2         [ 4]  617 	call putc 
      009EC6 44 46            [ 1]  618     ld a,(1,sp) 
      009EC8 52 45 45         [ 4]  619 	call to_hex_char
      009ECB 00 9A 9E         [ 4]  620 	call putc
      009ECE C6 20            [ 1]  621 	ld a,#SPACE 
      009ECF CD 02 B2         [ 4]  622 	call putc 
      009ECF 03               [ 1]  623 	pop a 
      009ED0 46               [ 4]  624 	ret 
                                    625 
                                    626 ;----------------------------------
                                    627 ; convert to hexadecimal digit 
                                    628 ; input:
                                    629 ;   A       digit to convert 
                                    630 ; output:
                                    631 ;   A       hexdecimal character 
                                    632 ;----------------------------------
      002320                        633 to_hex_char::
      009ED1 4F 52            [ 1]  634 	and a,#15 
      009ED3 00 38            [ 1]  635 	cp a,#9 
      009ED5 9E CF            [ 2]  636 	jrule 1$ 
      009ED7 AB 07            [ 1]  637 	add a,#7
      009ED7 04 46            [ 1]  638 1$: add a,#'0 
      009ED9 43               [ 4]  639 	ret 
                                    640 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
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
      00232B                         51 search_lineno::
      00232B                         52 	_vars VSIZE
      009EDA 50 55            [ 2]    1     sub sp,#VSIZE 
      009EDC 00 34            [ 1]   53 	clr (LL,sp)
      009EDE 9E D7 00 19      [ 2]   54 	ldw y,txtbgn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      009EE0 4D               [ 1]   55 	tnz a 
      009EE0 05 45            [ 1]   56 	jreq search_ln_loop
      009EE2 52 41 53 45      [ 2]   57 	ldw y,basicptr 
      00233A                         58 search_ln_loop:
      009EE6 00 32 9E E0      [ 2]   59 	cpw y,txtend 
      009EEA 2A 10            [ 1]   60 	jrpl 8$
      009EEA 03 45            [ 1]   61 	cpw x,(y)
      009EEC 4E 44            [ 1]   62 	jreq 9$
      009EEE 00 30            [ 1]   63 	jrmi 8$ 
      009EF0 9E EA 02         [ 1]   64 	ld a,(2,y)
      009EF2 6B 02            [ 1]   65 	ld (LB,sp),a 
      009EF2 46 45 45         [ 2]   66 	addw y,(LL,sp)
      009EF5 50 52            [ 2]   67 	jra search_ln_loop 
      002350                         68 8$: 
      009EF7 4F               [ 1]   69 	clrw x 	
      009EF8 4D               [ 1]   70 	exgw x,y 
      002352                         71 9$: _drop VSIZE
      009EF9 00 2E            [ 2]    1     addw sp,#VSIZE 
      009EFB 9E               [ 1]   72 	exgw x,y   
      009EFC F2               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      009EFD                         83 del_line: 
      002356                         84 	_vars VSIZE 
      009EFD 04 45            [ 2]    1     sub sp,#VSIZE 
      009EFF 44 49            [ 1]   85 	ld a,(2,x) ; line length
      009F01 54 00            [ 1]   86 	ld (LLEN+1,sp),a 
      009F03 2C 9E            [ 1]   87 	clr (LLEN,sp)
      009F05 FD 93            [ 1]   88 	ldw y,x  
      009F06 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      009F06 06 44            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      009F08 57 52 49 54      [ 2]   91 	ldw y,txtend 
      009F0C 45 00 2A         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      009F0F 9F 06 00 0C      [ 2]   93 	ldw acc16,y 
      009F11 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      009F11 45 44 52         [ 4]   95 	call move
      009F14 45 41 44 00      [ 2]   96 	ldw y,txtend 
      009F18 28 9F 11         [ 2]   97 	subw y,(LLEN,sp)
      009F1B 90 CF 00 1B      [ 2]   98 	ldw txtend,y  
      002380                         99 	_drop VSIZE     
      009F1B 02 44            [ 2]    1     addw sp,#VSIZE 
      009F1D 4F               [ 4]  100 	ret 
                                    101 
                                    102 ;---------------------------------------------
                                    103 ; create a gap in text area to 
                                    104 ; move new line in this gap
                                    105 ; input:
                                    106 ;    X 			addr gap start 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                    107 ;    Y 			gap length 
                                    108 ; output:
                                    109 ;    X 			addr gap start 
                                    110 ;--------------------------------------------
                           000001   111 	DEST=1
                           000003   112 	SRC=3
                           000005   113 	LEN=5
                           000006   114 	VSIZE=6 
      002383                        115 create_gap:
      002383                        116 	_vars VSIZE
      009F1E 00 26            [ 2]    1     sub sp,#VSIZE 
      009F20 9F 1B            [ 2]  117 	ldw (SRC,sp),x 
      009F22 17 05            [ 2]  118 	ldw (LEN,sp),y 
      009F22 03 44 45 43      [ 2]  119 	ldw acc16,y 
      009F26 00 24            [ 1]  120 	ldw y,x ; SRC
      009F28 9F 22 00 0C      [ 2]  121 	addw x,acc16  
      009F2A 1F 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      009F2A 43 44 44         [ 2]  124 	ldw x,txtend 
      009F2D 52 00 22         [ 2]  125 	subw x,(SRC,sp)
      009F30 9F 2A 0C         [ 2]  126 	ldw acc16,x ; size to move
      009F32 1E 01            [ 2]  127 	ldw x,(DEST,sp) 
      009F32 06 44 41         [ 4]  128 	call move
      009F35 54 41 4C         [ 2]  129 	ldw x,txtend
      009F38 4E 00 20         [ 2]  130 	addw x,(LEN,sp)
      009F3B 9F 32 1B         [ 2]  131 	ldw txtend,x
      009F3D                        132 9$:	_drop VSIZE 
      009F3D 04 44            [ 2]    1     addw sp,#VSIZE 
      009F3F 41               [ 4]  133 	ret 
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
      0023AF                        150 insert_line:
      0023AF                        151 	_vars VSIZE 
      009F40 54 41            [ 2]    1     sub sp,#VSIZE 
      009F42 00 1E 9F         [ 2]  152 	ldw x,txtend  
      009F45 3D 00 19         [ 2]  153 	cpw x,txtbgn 
      009F46 26 19            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      009F46 43 43 52         [ 2]  156 	ldw x,#2 
      009F49 4C 00 1C 9F      [ 4]  157 	ld a,([ptr16],x)
      009F4D 46 03            [ 1]  158 	cp a,#3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      009F4E 27 5A            [ 1]  159 	jreq insert_ln_exit
      009F4E 43               [ 1]  160 	clrw x 
      009F4F 43               [ 1]  161 	ld xl,a
      009F50 52 48            [ 2]  162 	ldw (LLEN,sp),x 
      009F52 00 1A 9F         [ 2]  163 	ldw x,txtbgn
      009F55 4E 01            [ 2]  164 	ldw (DEST,sp),x 
      009F56 CE 00 1B         [ 2]  165 	ldw x,txtend 
      009F56 84 43            [ 2]  166 	jra 4$
      009F58 48 41 52 00      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      009F5C 18 9F            [ 2]  169 	ldw (LINENO,sp),x 
      009F5E 56 00 02         [ 2]  170 	ldw x,#2 
      009F5F 72 D6 00 17      [ 4]  171 	ld a,([ptr16],x)
      009F5F 03               [ 1]  172 	ld xl,a
                                    173 ; line length
      009F60 42 59            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      009F62 45 00            [ 2]  176 	ldw x,(LINENO,sp)
      009F64 16               [ 1]  177 	clr a 
      009F65 9F 5F 2B         [ 4]  178 	call search_lineno 
      009F67 5D               [ 2]  179 	tnzw x 
      009F67 05 42            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      009F69 54 4F            [ 2]  183 	ldw (DEST,sp),y 
      009F6B 47 4C            [ 2]  184 	jra 3$
                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      009F6D 00 14            [ 2]  187 2$: ldw (DEST,sp),x 
      009F6F 9F 67 56         [ 4]  188 	call del_line
      009F71                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      009F71 45 42            [ 1]  192 	ld a,#3
      009F73 54 45            [ 1]  193 	cp a,(LLEN+1,sp)
      009F75 53 54            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      009F77 00 12            [ 2]  197 	ldw x,(DEST,sp)
      009F79 9F 71 1B         [ 2]  198 	cpw x,txtend 
      009F7B 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      009F7B 04 42            [ 2]  202 	ldw x,(DEST,sp)
      009F7D 53 45            [ 2]  203 	ldw y,(LLEN,sp)
      009F7F 54 00 10         [ 4]  204 	call create_gap
      009F82 9F 7B            [ 2]  205 	jra 5$
      009F84                        206 4$: 
      009F84 04 42 52         [ 2]  207 	addw x,(LLEN,sp)
      009F87 45 53 00         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      009F8A 0E 9F            [ 2]  210 5$:	ldw x,(LLEN,sp)
      009F8C 84 00 0C         [ 2]  211 	ldw acc16,x 
      009F8D 90 AE 16 E0      [ 2]  212 	ldw y,#pad ;SRC 
      009F8D 43 42            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      009F8F 49 54 00         [ 4]  214 	call move 
      00241E                        215 insert_ln_exit:	
      00241E                        216 	_drop VSIZE
      009F92 0C 9F            [ 2]    1     addw sp,#VSIZE 
      009F94 8D               [ 4]  217 	ret
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
      009F95                        233 parse_quote: 
      002421                        234 	_vars VSIZE 
      009F95 03 41            [ 2]    1     sub sp,#VSIZE 
      009F97 57               [ 1]  235 	clr a
      009F98 55 00            [ 1]  236 1$:	ld (PREV,sp),a 
      002426                        237 2$:	
      009F9A 0A 9F 95         [ 4]  238 	ld a,([in.w],y)
      009F9D 27 24            [ 1]  239 	jreq 6$
      009F9D 43 41 53 43      [ 1]  240 	inc in 
      009FA1 00 08            [ 1]  241 	ld (CURR,sp),a 
      009FA3 9F 9D            [ 1]  242 	ld a,#'\
      009FA5 11 01            [ 1]  243 	cp a, (PREV,sp)
      009FA5 43 41            [ 1]  244 	jrne 3$
      009FA7 4E 44            [ 1]  245 	clr (PREV,sp)
      009FA9 00 06            [ 1]  246 	ld a,(CURR,sp)
      009FAB 9F A5            [ 4]  247 	callr convert_escape
      009FAD F7               [ 1]  248 	ld (x),a 
      009FAD 47               [ 1]  249 	incw x 
      009FAE 41 44            [ 2]  250 	jra 2$
      002441                        251 3$:
      009FB0 43 52            [ 1]  252 	ld a,(CURR,sp)
      009FB2 45 41            [ 1]  253 	cp a,#'\'
      009FB4 44 00            [ 1]  254 	jreq 1$
      009FB6 04 9F            [ 1]  255 	cp a,#'"
      009FB8 AD 04            [ 1]  256 	jreq 6$ 
      009FB9 F7               [ 1]  257 	ld (x),a 
      009FB9 05               [ 1]  258 	incw x 
      009FBA 41 44            [ 2]  259 	jra 2$
      00244F                        260 6$:
      009FBC 43               [ 1]  261 	clr (x)
      009FBD 4F               [ 1]  262 	incw x 
      009FBE 4E 00            [ 1]  263 	ldw y,x 
      009FC0 02               [ 1]  264 	clrw x 
      009FC1 A6 02            [ 1]  265 	ld a,#TK_QSTR  
      002456                        266 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      009FC1 9F B9            [ 2]    1     addw sp,#VSIZE 
      009FC3 81               [ 4]  267 	ret 
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
      002459                        278 convert_escape:
      009FC3 43               [ 2]  279 	pushw x 
      009FC4 41 42 53         [ 2]  280 	ldw x,#escaped 
      009FC7 00               [ 1]  281 1$:	cp a,(x)
      009FC8 00 06            [ 1]  282 	jreq 2$
      009FC9 7D               [ 1]  283 	tnz (x)
      009FC9 97 66            [ 1]  284 	jreq 3$
      009FCB 93               [ 1]  285 	incw x 
      009FCC 82 93            [ 2]  286 	jra 1$
      009FCE BE 97 7A         [ 2]  287 2$: subw x,#escaped 
      009FD1 96               [ 1]  288 	ld a,xl 
      009FD2 57 97            [ 1]  289 	add a,#7
      009FD4 17               [ 2]  290 3$:	popw x 
      009FD5 99               [ 4]  291 	ret 
                                    292 
      009FD6 C8 91 10 91 00 91 31   293 escaped:: .asciz "abtnvfr"
             91
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
      002476                        310 parse_integer: ; { -- n }
      009FDE 21               [ 2]  311 	pushw x 	
      009FDF 96 F0            [ 1]  312 	push #0 ; TCHAR
      009FE1 96 45            [ 1]  313 	push #10 ; BASE=10
      009FE3 9A 82            [ 1]  314 	cp a,#'$
      009FE5 9A 7C            [ 1]  315 	jrne 2$ 
      00247F                        316     _drop #1
      009FE7 9A 9A            [ 2]    1     addw sp,##1 
      009FE9 9A A0            [ 1]  317 	push #16  ; BASE=16
      009FEB 9A               [ 1]  318 2$:	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009FEC 76               [ 1]  319 	incw x 
      009FED 8E 36 99         [ 4]  320 	ld a,([in.w],y)
      009FF0 F1 93 F2 94      [ 1]  321 	inc in 
      009FF4 22 8F 7B         [ 4]  322 	call to_upper 
      009FF7 9A 94            [ 1]  323 	ld (TCHAR,sp),a 
      009FF9 93 2E 94         [ 4]  324 	call is_digit 
      009FFC EA 97            [ 1]  325 	jrc 2$
      009FFE F4 95            [ 1]  326 	ld a,#16 
      00A000 56 91            [ 1]  327 	cp a,(BASE,sp)
      00A002 8C 92            [ 1]  328 	jrne 3$ 
      00A004 97 92            [ 1]  329 	ld a,(TCHAR,sp)
      00A006 7C 96            [ 1]  330 	cp a,#'A 
      00A008 93 8E            [ 1]  331 	jrmi 3$ 
      00A00A 31 9A            [ 1]  332 	cp a,#'G 
      00A00C 70 91            [ 1]  333 	jrmi 2$ 
      00A00E 78 90 65 99      [ 1]  334 3$: dec in 	
      00A012 E2               [ 1]  335     clr (x)
      00A013 99 72            [ 2]  336 	ldw x,(XSAVE,sp)
      00A015 99 A8 96         [ 4]  337 	call atoi24
      00A018 7E 8E            [ 1]  338 	ldw y,x 
      00A01A B3 8E E6         [ 2]  339 	ldw x,acc16 
      00A01D 99 AD            [ 1]  340 	ld a,#TK_INTGR
      00A01F 97 C2            [ 2]  341 	ldw (y),x 
      00A021 8B D5 92 0C      [ 2]  342 	addw y,#2
      0024BD                        343 	_drop VSIZE  
      00A025 94 A9            [ 2]    1     addw sp,#VSIZE 
      00A027 99               [ 4]  344 	ret 	
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
      0024C0                        361 parse_binary: ; { -- n }
      00A028 65 9A            [ 1]  362 	push #0
      00A02A 6A 97            [ 1]  363 	push #0
      00A02C 92 9C            [ 1]  364 	push #0
      0024C6                        365 2$:	
      00A02E 2E 97 04         [ 4]  366 	ld a,([in.w],y)
      00A031 98 00 91 67      [ 1]  367 	inc in 
      00A035 9A 8E            [ 1]  368 	cp a,#'0 
      00A037 91 58            [ 1]  369 	jreq 3$
      00A039 9A 88            [ 1]  370 	cp a,#'1 
      00A03B 8F DF            [ 1]  371 	jreq 3$ 
      00A03D 9A 34            [ 2]  372 	jra bin_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A03F 9A 3A            [ 1]  373 3$: sub a,#'0 
      00A041 9A               [ 1]  374 	rrc a
      00A042 40 9A            [ 1]  375 	rlc (BINARY+2,sp) 
      00A044 46 9A            [ 1]  376 	rlc (BINARY+1,sp)
      00A046 4C 9A            [ 1]  377 	rlc (BINARY,sp) 
      00A048 52 9A            [ 2]  378 	jra 2$  
      0024E2                        379 bin_exit:
      00A04A 58 9A 5E 9A      [ 1]  380 	dec in 
      00A04E 64 96            [ 1]  381 	ldw y,x
      00A050 86 9B            [ 1]  382 	ld a,(BINARY,sp)
      00A052 1D 84 EF         [ 1]  383 	ld acc24,a 
      00A055 90 D5            [ 2]  384 	ldw x,(BINARY+1,sp)
      00A057 9A CE 92         [ 2]  385 	ldw acc16,x
      00A05A B7 98            [ 2]  386 	ldw (y),x 
      00A05C 7C 97 DB 92      [ 2]  387 	addw y,#2  
      00A060 D5 8D            [ 1]  388 	ld a,#TK_INTGR 	
      0024FA                        389 	_drop VSIZE 
      00A062 F0 8E            [ 2]    1     addw sp,#VSIZE 
      00A064 3B               [ 4]  390 	ret
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
      0024FD                        406 parse_keyword: 
      00A065 96               [ 2]  407 	pushw x 
      0024FE                        408 kw_loop:	
      00A066 F9 9C 0F         [ 4]  409 	call to_upper 
      00A069 9B               [ 1]  410 	ld (x),a 
      00A06A 77               [ 1]  411 	incw x 
      00A06B 9C 17 9B         [ 4]  412 	ld a,([in.w],y)
      00A06E EF 91 E5 94      [ 1]  413 	inc in 
      00A072 5D 97 60         [ 4]  414 	call is_alpha 
      00A075 99 49            [ 1]  415 	jrc kw_loop
      00A077 99 58 91 B5      [ 1]  416 	dec in   
      00A07B 93               [ 1]  417 1$: clr (x)
      00A07C 3E 8E            [ 2]  418 	ldw x,(XFIRST,sp) 
      00A07E A9 96            [ 1]  419 	ld a,(1,x)
      00A080 BD 9A            [ 1]  420 	jrne 2$
                                    421 ; one letter variable name 
      00A082 06               [ 1]  422 	ld a,(x) 
      00A083 96 D3            [ 1]  423 	sub a,#'A 
      00A085 90               [ 1]  424 	sll a 
      00A086 DB               [ 1]  425 	push a 
      00A087 98 E3            [ 1]  426 	push #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A089 96 0E 97         [ 2]  427 	ldw x,#vars 
      00A08C AA 8E 54         [ 2]  428 	addw x,(1,sp) ; X=var address 
      002527                        429 	_drop 2 
      00A08F 00 00            [ 2]    1     addw sp,#2 
      00A091 43 81            [ 1]  430 	ld a,#TK_VAR 
      00A093 44 80            [ 2]  431 	jra 4$ 
      00252D                        432 2$: ; check for keyword, otherwise syntax error.
      00252D                        433 	_ldx_dict kword_dict ; dictionary entry point
      00A095 48 82 46         [ 2]    1     ldw x,#kword_dict+2
      00A098 83 33            [ 2]  434 	ldw y,(XFIRST,sp) ; name to search for
      00A09A 84 00 00         [ 4]  435 	call search_dict
      00A09D 4D               [ 1]  436 	tnz a
      00A09D CD 83            [ 1]  437 	jrne 4$ 
      00A09F 42 A1 5B         [ 2]  438 	jp syntax_error
      00253B                        439 4$:	
      00A0A2 27 02            [ 2]  440 	ldw y,(XFIRST,sp)
      00A0A4 4F 81 CD         [ 2]  441 	cpw x,#LET_IDX 
      00A0A7 83 42            [ 1]  442 	jreq 5$  ; don't compile LET command 
      00A0A9 AE A0            [ 1]  443 	ld (y),a 
      00A0AB 91 5C            [ 1]  444 	incw y 
      00A0AC 90 FF            [ 2]  445 	ldw (y),x
      00A0AC F1 27 08 1C      [ 2]  446 	addw y,#2  
      00254C                        447 5$:	_drop VSIZE 
      00A0B0 00 02            [ 2]    1     addw sp,#VSIZE 
      00A0B2 7D               [ 4]  448 	ret  	
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
      00254F                        459 skip:
      00A0B3 26               [ 1]  460 	push a
      00A0B4 F7 4F 81         [ 4]  461 1$:	ld a,([in.w],y)
      00A0B7 5C F6            [ 1]  462 	jreq 2$
      00A0B9 A1 84            [ 1]  463 	cp a,(C,sp)
      00A0BB 26 05            [ 1]  464 	jrne 2$
      00A0BD 88 CD 83 42      [ 1]  465 	inc in
      00A0C1 84 F1            [ 2]  466 	jra 1$
      00A0C2                        467 2$: _drop 1 
      00A0C2 81 01            [ 2]    1     addw sp,#1 
      00A0C3 81               [ 4]  468 	ret
                                    469 	
                                    470 
                                    471 ;------------------------------------
                                    472 ; scan text for next token
                                    473 ; input: 
                                    474 ;	X 		pointer to buffer where 
                                    475 ;	        token id and value are copied 
                                    476 ; use:
                                    477 ;	Y   pointer to text in tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
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
      002562                        493 get_token:: 
      002562                        494 	_vars VSIZE
      00A0C3 F6 27            [ 2]    1     sub sp,#VSIZE 
                                    495 ;	ld a,in 
                                    496 ;	sub a,count
                                    497 ;   jrmi 0$
                                    498 ;	clr a 
                                    499 ;	ret 
      002564                        500 0$: 
      00A0C5 06 CD 83 32      [ 2]  501 	ldw y,#tib    	
      00A0C9 5C 20            [ 1]  502 	ld a,#SPACE
      00A0CB F7 81 4F         [ 4]  503 	call skip
      00A0CD 55 00 01 00 02   [ 1]  504 	mov in.saved,in 
      00A0CD A6 08 CD         [ 4]  505 	ld a,([in.w],y)
      00A0D0 83 32            [ 1]  506 	jrne 1$
      00A0D2 A6 20            [ 1]  507 	ldw y,x 
      00A0D4 CD 83 32         [ 2]  508 	jp token_exit ; end of line 
      00A0D7 A6 08 CD 83      [ 1]  509 1$:	inc in 
      00A0DB 32 81 7E         [ 4]  510 	call to_upper 
      00A0DD 6B 01            [ 1]  511 	ld (TCHAR,sp),a 
                                    512 ; check for quoted string
      002585                        513 str_tst:  	
      002585                        514 	_case '"' nbr_tst
      00A0DD 88 0D            [ 1]    1 	ld a,#'"' 
      00A0DF 01 27            [ 1]    2 	cp a,(TCHAR,sp) 
      00A0E1 07 CD            [ 1]    3 	jrne nbr_tst
      00A0E3 A0 CD            [ 1]  515 	ld a,#TK_QSTR
      00A0E5 0A               [ 1]  516 	ld (x),a 
      00A0E6 01               [ 1]  517 	incw x 
      00A0E7 20 F5 84         [ 4]  518 	call parse_quote
      00A0EA 81 27 1E         [ 2]  519 	jp token_exit
      00A0EB                        520 nbr_tst:
                                    521 ; check for hexadecimal number 
      00A0EB A6 1B            [ 1]  522 	ld a,#'$'
      00A0ED CD 83            [ 1]  523 	cp a,(TCHAR,sp) 
      00A0EF 32 A6            [ 1]  524 	jreq 1$
                                    525 ;check for binary number 
      00A0F1 5B CD            [ 1]  526 	ld a,#'&
      00A0F3 83 32            [ 1]  527 	cp a,(TCHAR,sp)
      00A0F5 81 0A            [ 1]  528 	jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A0F6 A6 84            [ 1]  529 	ld a,#TK_INTGR
      00A0F6 89               [ 1]  530 	ld (x),a 
      00A0F7 5F               [ 1]  531 	incw x 
      00A0F8 97 A6 0A         [ 4]  532 	call parse_binary ; expect binary integer 
      00A0FB 62 95 9F         [ 2]  533 	jp token_exit 
                                    534 ; check for decimal number 	
      00A0FE 4D 27            [ 1]  535 0$:	ld a,(TCHAR,sp)
      00A100 0B A1 09         [ 4]  536 	call is_digit
      00A103 23 02            [ 1]  537 	jrnc 3$
      00A105 A6 39            [ 1]  538 1$:	ld a,#TK_INTGR 
      00A107 F7               [ 1]  539 	ld (x),a 
      00A107 AB               [ 1]  540 	incw x 
      00A108 30 CD            [ 1]  541 	ld a,(TCHAR,sp)
      00A10A 83 32 9E         [ 4]  542 	call parse_integer 
      00A10D AB 30 CD         [ 2]  543 	jp token_exit 
      0025BE                        544 3$: 
      0025BE                        545 	_case '(' bkslsh_tst 
      00A110 83 32            [ 1]    1 	ld a,#'(' 
      00A112 85 81            [ 1]    2 	cp a,(TCHAR,sp) 
      00A114 26 05            [ 1]    3 	jrne bkslsh_tst
      00A114 88 CD            [ 1]  546 	ld a,#TK_LPAREN
      00A116 A0 EB 84         [ 2]  547 	jp token_char   	
      0025C9                        548 bkslsh_tst: ; character token 
      0025C9                        549 	_case '\',rparnt_tst
      00A119 CD A0            [ 1]    1 	ld a,#'\' 
      00A11B F6 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      00A11D 44 CD            [ 1]    3 	jrne rparnt_tst
      00A11F 83 32            [ 1]  550 	ld a,#TK_CHAR 
      00A121 81               [ 1]  551 	ld (x),a 
      00A122 5C               [ 1]  552 	incw x 
      00A122 88 CD A0         [ 4]  553 	ld a,([in.w],y)
      00A125 EB               [ 1]  554 	ld (x),a 
      00A126 84               [ 1]  555 	incw x
      00A127 CD A0            [ 1]  556 	ldw y,x 	 
      00A129 F6 A6 43 CD      [ 1]  557 	inc in  
      00A12D 83               [ 1]  558 	clrw x 
      00A12E 32               [ 1]  559 	ld xl,a 
      00A12F 81 03            [ 1]  560 	ld a,#TK_CHAR 
      00A130 CC 27 1E         [ 2]  561 	jp token_exit 
      0025E5                        562 rparnt_tst:		
      0025E5                        563 	_case ')' colon_tst 
      00A130 A6 20            [ 1]    1 	ld a,#')' 
      00A132 5D 27            [ 1]    2 	cp a,(TCHAR,sp) 
      00A134 06 CD            [ 1]    3 	jrne colon_tst
      00A136 83 32            [ 1]  564 	ld a,#TK_RPAREN 
      00A138 5A 20 F7         [ 2]  565 	jp token_char
      00A13B                        566 colon_tst:
      0025F0                        567 	_case ':' comma_tst 
      00A13B 81 3A            [ 1]    1 	ld a,#':' 
      00A13C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A13C 52 06            [ 1]    3 	jrne comma_tst
      00A13E 6B 02            [ 1]  568 	ld a,#TK_COLON 
      00A140 9E 6B 01         [ 2]  569 	jp token_char  
      0025FB                        570 comma_tst:
      0025FB                        571 	_case COMMA sharp_tst 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A143 9F 6B            [ 1]    1 	ld a,#COMMA 
      00A145 03 93            [ 1]    2 	cp a,(TCHAR,sp) 
      00A147 5C 7B            [ 1]    3 	jrne sharp_tst
      00A149 03 10            [ 1]  572 	ld a,#TK_COMMA
      00A14B 01 4C C7         [ 2]  573 	jp token_char
      002606                        574 sharp_tst:
      002606                        575 	_case SHARP dash_tst 
      00A14E 00 0E            [ 1]    1 	ld a,#SHARP 
      00A150 72 5F            [ 1]    2 	cp a,(TCHAR,sp) 
      00A152 00 0D            [ 1]    3 	jrne dash_tst
      00A154 CD 84            [ 1]  576 	ld a,#TK_SHARP
      00A156 36 90 AE         [ 2]  577 	jp token_char  	 	 
      002611                        578 dash_tst: 	
      002611                        579 	_case '-' at_tst 
      00A159 16 90            [ 1]    1 	ld a,#'-' 
      00A15B 7B 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A15D C7 00            [ 1]    3 	jrne at_tst
      00A15F 0E 72            [ 1]  580 	ld a,#TK_MINUS  
      00A161 B9 00 0D         [ 2]  581 	jp token_char 
      00261C                        582 at_tst:
      00261C                        583 	_case '@' qmark_tst 
      00A164 7B 02            [ 1]    1 	ld a,#'@' 
      00A166 90 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      00A168 90 5C            [ 1]    3 	jrne qmark_tst
      00A16A 7B 01            [ 1]  584 	ld a,#TK_ARRAY 
      00A16C CD A1 14         [ 2]  585 	jp token_char
      002627                        586 qmark_tst:
      002627                        587 	_case '?' tick_tst 
      00A16F AE 16            [ 1]    1 	ld a,#'?' 
      00A171 90 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      00A173 A0 C3            [ 1]    3 	jrne tick_tst
      00A175 7B 03            [ 1]  588 	ld a,#TK_CMD  
      00A177 10               [ 1]  589 	ld (x),a 
      00A178 01               [ 1]  590 	incw x 
      00A179 CD A1            [ 1]  591 	ldw y,x 
      00A17B 14 5B 06         [ 2]  592 	ldw x,#PRT_IDX 
      00A17E 81 FF            [ 2]  593 	ldw (y),x 
      00A17F 72 A9 00 02      [ 2]  594 	addw y,#2
      00A17F 52 02 6B         [ 2]  595 	jp token_exit
      00263F                        596 tick_tst: ; comment 
      00263F                        597 	_case TICK plus_tst 
      00A182 02 9F            [ 1]    1 	ld a,#TICK 
      00A184 6B 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A186 93 90            [ 1]    3 	jrne plus_tst
      00A188 5C 7B            [ 1]  598 	ld a,#TK_CMD
      00A18A 02               [ 1]  599 	ld (x),a 
      00A18B 10               [ 1]  600 	incw x
      00A18C 01 4C C7 00      [ 2]  601 	ldw y,#REM_IDX
      00A190 0E               [ 2]  602 	ldw (x),y 
      00A191 72 5F 00         [ 2]  603 	addw x,#2  
      002651                        604 copy_comment:
      00A194 0D CD 84 36      [ 2]  605 	ldw y,#tib 
      00A198 90 AE 16 90      [ 2]  606 	addw y,in.w
      00A19C 7B 01            [ 2]  607 	pushw y
      00A19E C7 00 0E         [ 4]  608 	call strcpy
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A1A1 72 B9 00         [ 2]  609     subw y,(1,sp)
      00A1A4 0D 93            [ 1]  610 	ld a,yl 
      00A1A6 CD A0 C3         [ 1]  611 	add a,in
      00A1A9 A6 20 CD         [ 1]  612 	ld in,a 
      00A1AC 83 32            [ 2]  613 	ldw (1,sp),x
      00A1AE 7B 02 10         [ 2]  614 	addw y,(1,sp)
      00A1B1 01 CD            [ 1]  615 	incw y 
      002670                        616 	_drop 2 
      00A1B3 A1 14            [ 2]    1     addw sp,#2 
      00A1B5 0A 02 5B         [ 2]  617 	ldw x,#REM_IDX 
      00A1B8 02 81            [ 1]  618 	ld a,#TK_CMD 
      00A1BA CC 27 1E         [ 2]  619 	jp token_exit 
      00267A                        620 plus_tst:
      00267A                        621 	_case '+' star_tst 
      00A1BA CD A0            [ 1]    1 	ld a,#'+' 
      00A1BC EB A6            [ 1]    2 	cp a,(TCHAR,sp) 
      00A1BE 32 CD            [ 1]    3 	jrne star_tst
      00A1C0 83 32            [ 1]  622 	ld a,#TK_PLUS  
      00A1C2 A6 4B CD         [ 2]  623 	jp token_char 
      002685                        624 star_tst:
      002685                        625 	_case '*' slash_tst 
      00A1C5 83 32            [ 1]    1 	ld a,#'*' 
      00A1C7 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A1C8 26 05            [ 1]    3 	jrne slash_tst
      00A1C8 52 04            [ 1]  626 	ld a,#TK_MULT 
      00A1CA 5F 1F 02         [ 2]  627 	jp token_char 
      002690                        628 slash_tst: 
      002690                        629 	_case '/' prcnt_tst 
      00A1CD 1F 03            [ 1]    1 	ld a,#'/' 
      00A1CF 03 04            [ 1]    2 	cp a,(TCHAR,sp) 
      00A1D1 90 AE            [ 1]    3 	jrne prcnt_tst
      00A1D3 16 90            [ 1]  630 	ld a,#TK_DIV 
      00A1D5 CC 27 1A         [ 2]  631 	jp token_char 
      00269B                        632 prcnt_tst:
      00269B                        633 	_case '%' eql_tst 
      00A1D5 CD 83            [ 1]    1 	ld a,#'%' 
      00A1D7 42 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      00A1D9 01 A1            [ 1]    3 	jrne eql_tst
      00A1DB 1B 26            [ 1]  634 	ld a,#TK_MOD
      00A1DD 05 CD A0         [ 2]  635 	jp token_char  
                                    636 ; 1 or 2 character tokens 	
      0026A6                        637 eql_tst:
      0026A6                        638 	_case '=' gt_tst 		
      00A1E0 9D 6B            [ 1]    1 	ld a,#'=' 
      00A1E2 01 A1            [ 1]    2 	cp a,(TCHAR,sp) 
      00A1E4 0D 26            [ 1]    3 	jrne gt_tst
      00A1E6 03 CC            [ 1]  639 	ld a,#TK_EQUAL
      00A1E8 A3 71 A1         [ 2]  640 	jp token_char 
      0026B1                        641 gt_tst:
      0026B1                        642 	_case '>' lt_tst 
      00A1EB 0A 26            [ 1]    1 	ld a,#'>' 
      00A1ED 03 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      00A1EF A3 71            [ 1]    3 	jrne lt_tst
      00A1F1 A6 31            [ 1]  643 	ld a,#TK_GT 
      00A1F1 A1 08            [ 1]  644 	ld (ATTRIB,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A1F3 26 12 0D         [ 4]  645 	ld a,([in.w],y)
      00A1F6 03 27 DC A6      [ 1]  646 	inc in 
      00A1FA 01 CD            [ 1]  647 	cp a,#'=
      00A1FC A1 14            [ 1]  648 	jrne 1$
      00A1FE 0A 03            [ 1]  649 	ld a,#TK_GE 
      00A200 90 5A            [ 2]  650 	jra token_char  
      00A202 7B 03            [ 1]  651 1$: cp a,#'<
      00A204 CC A3            [ 1]  652 	jrne 2$
      00A206 1D 35            [ 1]  653 	ld a,#TK_NE 
      00A207 20 48            [ 2]  654 	jra token_char 
      00A207 A1 04 26 1A      [ 1]  655 2$: dec in
      00A20B CD A1            [ 1]  656 	ld a,(ATTRIB,sp)
      00A20D BA 7B            [ 2]  657 	jra token_char 	 
      0026DA                        658 lt_tst:
      0026DA                        659 	_case '<' other
      00A20F 03 4C            [ 1]    1 	ld a,#'<' 
      00A211 CD A1            [ 1]    2 	cp a,(TCHAR,sp) 
      00A213 14 A6            [ 1]    3 	jrne other
      00A215 3E CD            [ 1]  660 	ld a,#TK_LT 
      00A217 83 32            [ 1]  661 	ld (ATTRIB,sp),a 
      00A219 90 AE 16         [ 4]  662 	ld a,([in.w],y)
      00A21C 90 90 7F 0F      [ 1]  663 	inc in 
      00A220 02 0F            [ 1]  664 	cp a,#'=
      00A222 03 20            [ 1]  665 	jrne 1$
      00A224 B0 36            [ 1]  666 	ld a,#TK_LE 
      00A225 20 27            [ 2]  667 	jra token_char 
      00A225 A1 12            [ 1]  668 1$: cp a,#'>
      00A227 26 21            [ 1]  669 	jrne 2$
      00A229 0D 02            [ 1]  670 	ld a,#TK_NE 
      00A22B 26 A8            [ 2]  671 	jra token_char 
      00A22D AE 16 90 CD      [ 1]  672 2$: dec in 
      00A231 84 0C            [ 1]  673 	ld a,(ATTRIB,sp)
      00A233 90 AE            [ 2]  674 	jra token_char 	
      002703                        675 other: ; not a special character 	 
      00A235 16 90            [ 1]  676 	ld a,(TCHAR,sp)
      00A237 27 9C 6B         [ 4]  677 	call is_alpha 
      00A23A 02 6B            [ 1]  678 	jrc 30$ 
      00A23C 03 AE 16         [ 2]  679 	jp syntax_error 
      00270D                        680 30$: 
      00A23F 90 CD A0         [ 4]  681 	call parse_keyword
      00A242 C3 0F 01         [ 2]  682 	cpw x,#remark 
      00A245 72 F9            [ 1]  683 	jrne token_exit 
      00A247 01 20            [ 1]  684 	ldw y,x 
      00A249 8B 26 51         [ 2]  685 	jp copy_comment 
      00A24A                        686 token_char:
      00A24A A1               [ 1]  687 	ld (x),a 
      00A24B 05               [ 1]  688 	incw x
      00A24C 26 49            [ 1]  689 	ldw y,x 
      00271E                        690 token_exit:
      00271E                        691 	_drop VSIZE 
      00A24E AE 16            [ 2]    1     addw sp,#VSIZE 
      00A250 90               [ 4]  692 	ret
                                    693 
                                    694 
                                    695 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
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
      002721                        712 compile::
      002721                        713 	_vars VSIZE 
      00A251 CD 8A            [ 2]    1     sub sp,#VSIZE 
      00A253 0A CE 00 0D CD   [ 1]  714 	mov basicptr,txtbgn
      00A258 A3 AB 5D 26      [ 1]  715 	bset flags,#FCOMP 
      00A25C 0B 0F            [ 1]  716 	ld a,#0
      00A25E 02 90 AE         [ 2]  717 	ldw x,#0
      00A261 16 90 90         [ 2]  718 	ldw pad,x ; destination buffer 
      00A264 7F CC A3         [ 1]  719 	ld pad+2,a ; count 
      00A267 71 16 E3         [ 2]  720 	ldw x,#pad+3
      00A268 72 5F 00 01      [ 1]  721 	clr in 
      00A268 CF 00 05         [ 4]  722 	call get_token
      00A26B E6 02            [ 1]  723 	cp a,#TK_INTGR
      00A26D C7 00            [ 1]  724 	jrne 2$
      00A26F 04 90 AE         [ 2]  725 	cpw x,#1 
      00A272 16 90            [ 1]  726 	jrpl 1$
      00A274 CD A8            [ 1]  727 	ld a,#ERR_BAD_VALUE
      00A276 BC 0F 01         [ 2]  728 	jp tb_error
      00A279 A6 0D CD         [ 2]  729 1$:	ldw pad,x 
      00A27C 83 32 A6 3E      [ 2]  730 	ldw y,#pad+3 
      00A280 CD 83 32 AE      [ 2]  731 2$:	cpw y,#stack_full 
      00A284 16 90            [ 1]  732 	jrult 3$
      00A286 CD 84            [ 1]  733 	ld a,#ERR_BUF_FULL 
      00A288 0C 6B 02         [ 2]  734 	jp tb_error 
      002761                        735 3$:	
      00A28B CD               [ 1]  736 	ldw x,y 
      00A28C A0 C3 90         [ 4]  737 	call get_token 
      00A28F 93 7B            [ 1]  738 	cp a,#TK_NONE 
      00A291 02 6B            [ 1]  739 	jrne 2$ 
                                    740 ; compilation completed  
      00A293 03 CC A1 D5      [ 2]  741 	subw y,#pad
      00A297 90 9F            [ 1]  742     ld a,yl
      00A297 A1 81 26         [ 2]  743 	ldw x,#pad 
      00A29A 15 7B 03         [ 2]  744 	ldw ptr16,x 
      00A29D 11 02            [ 1]  745 	ld (2,x),a 
      00A29F 2B               [ 2]  746 	ldw x,(x)
      00A2A0 03 CC            [ 1]  747 	jreq 10$
      00A2A2 A1 D5 AF         [ 4]  748 	call insert_line
      00A2A4 72 5F 00 03      [ 1]  749 	clr  count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A2A4 A6 01            [ 2]  750 	jra  11$ 
      002783                        751 10$: ; line# is zero 
      00A2A6 CD A1 22         [ 2]  752 	ldw x,ptr16  
      00A2A9 0C 03 90         [ 2]  753 	ldw basicptr,x 
      00A2AC 5C CC            [ 1]  754 	ld a,(2,x)
      00A2AE A1 D5 A1         [ 1]  755 	ld count,a 
      00A2B1 80 26 13 0D      [ 1]  756 	mov in,#3 
      002792                        757 11$:
      002792                        758 	_drop VSIZE 
      00A2B5 03 26            [ 2]    1     addw sp,#VSIZE 
      00A2B7 03 CC A1 D5      [ 1]  759 	bres flags,#FCOMP 
      00A2BB 81               [ 4]  760 	ret 
                                    761 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
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
      002799                         47 cpy_cmd_name:
      00A2BB A6               [ 1]   48 	ld a,(x)
      00A2BC 01               [ 1]   49 	incw x
      00A2BD CD A1            [ 1]   50 	and a,#15  
      00A2BF 14               [ 1]   51 	push a 
      00A2C0 0A 03            [ 1]   52     tnz (1,sp) 
      00A2C2 90 5A            [ 1]   53 	jreq 9$
      00A2C4 CC               [ 1]   54 1$:	ld a,(x)
      00A2C5 A1 D5            [ 1]   55 	ld (y),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A2C7 A1               [ 1]   56 	incw x
      00A2C8 82 26            [ 1]   57 	incw y 
      00A2CA 0E 7B            [ 1]   58 	dec (1,sp)	 
      00A2CC 03 CD            [ 1]   59 	jrne 1$
      00A2CE A1               [ 1]   60 9$: pop a 
      00A2CF 14               [ 4]   61 	ret	
                                     62 
                                     63 ;--------------------------
                                     64 ; add a space after letter or 
                                     65 ; digit.
                                     66 ; input:
                                     67 ;   Y     pointer to buffer 
                                     68 ; output:
                                     69 ;   Y    moved to end 
                                     70 ;--------------------------
      0027AE                         71 add_space:
      00A2D0 0F 03            [ 2]   72 	decw y 
      00A2D2 90 AE            [ 1]   73 	ld a,(y)
      00A2D4 16 90            [ 1]   74 	incw y
      00A2D6 CC A1 D5         [ 4]   75 	call is_alnum 
      00A2D9 A1 83            [ 1]   76 	jrnc 1$
      00A2DB 26 26            [ 1]   77 	ld a,#SPACE 
      00A2DD 7B 03            [ 1]   78 	ld (y),a 
      00A2DF 11 02            [ 1]   79 	incw y 
      00A2E1 26               [ 4]   80 1$: ret 
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
      0027C0                         92 right_align::
      00A2E2 03               [ 1]   93 	push a 
      00A2E3 CC A1            [ 1]   94 0$: ld a,(1,sp)
      00A2E5 D5 00 21         [ 1]   95 	cp a,tab_width 
      00A2E6 2A 08            [ 1]   96 	jrpl 1$
      00A2E6 7B 02            [ 1]   97 	ld a,#SPACE 
      00A2E8 10               [ 2]   98 	decw x
      00A2E9 03               [ 1]   99 	ld (x),a  
      00A2EA CD A1            [ 1]  100 	inc (1,sp)
      00A2EC 22 7B            [ 2]  101 	jra 0$ 
      00A2EE 02               [ 1]  102 1$: pop a 	
      00A2EF 6B               [ 4]  103 	ret 
                                    104 
                                    105 ;--------------------------
                                    106 ; print TK_QSTR
                                    107 ; converting control character
                                    108 ; to backslash sequence
                                    109 ; input:
                                    110 ;   X        char *
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



                                    111 ;   Y        dest. buffer 
                                    112 ; output:
                                    113 ;   X        moved forward 
                                    114 ;   Y        moved forward 
                                    115 ;-----------------------------
      0027D2                        116 cpy_quote:
      00A2F0 03 90            [ 1]  117 	ld a,#'"
      00A2F2 AE 16            [ 1]  118 	ld (y),a 
      00A2F4 90 72            [ 1]  119 	incw y 
      00A2F6 5F               [ 1]  120 1$:	ld a,(x)
      00A2F7 00 0D            [ 1]  121 	jreq 9$
      00A2F9 C7               [ 1]  122 	incw x 
      00A2FA 00 0E            [ 1]  123 	cp a,#SPACE 
      00A2FC 72 B9            [ 1]  124 	jrult 3$
      00A2FE 00 0D            [ 1]  125 	ld (y),a
      00A300 CC A1            [ 1]  126 	incw y 
      00A302 D5 A1            [ 1]  127 	cp a,#'\ 
      00A304 0F 26            [ 1]  128 	jrne 1$ 
      0027E8                        129 2$:
      00A306 0C 03            [ 1]  130 	ld (y),a
      00A308 04 90            [ 1]  131 	incw y  
      00A30A 89 CD            [ 2]  132 	jra 1$
      00A30C 93               [ 1]  133 3$: push a 
      00A30D 35 90            [ 1]  134 	ld a,#'\
      00A30F 85 CC            [ 1]  135 	ld (y),a 
      00A311 A1 D5            [ 1]  136 	incw y  
      00A313 A1               [ 1]  137 	pop a 
      00A314 84 26            [ 1]  138 	sub a,#7
      00A316 11 7B 03         [ 1]  139 	ld acc8,a 
      00A319 11 02 2A 08      [ 1]  140 	clr acc16
      00A31D 89               [ 2]  141 	pushw x
      00A31D 97 7B 02         [ 2]  142 	ldw x,#escaped 
      00A320 CD A1 7F 0A      [ 2]  143 	addw x,acc16 
      00A324 02               [ 1]  144 	ld a,(x)
      00A325 85               [ 2]  145 	popw x
      00A325 CC A1            [ 2]  146 	jra 2$
      00A327 D5 22            [ 1]  147 9$: ld a,#'"
      00A328 90 F7            [ 1]  148 	ld (y),a 
      00A328 A1 20            [ 1]  149 	incw y  
      00A32A 2A               [ 1]  150 	incw x 
      00A32B 03               [ 4]  151 	ret
                                    152 
                                    153 ;--------------------------
                                    154 ; return variable name 
                                    155 ; from its address.
                                    156 ; input:
                                    157 ;   X    variable address
                                    158 ; output:
                                    159 ;   A     variable letter
                                    160 ;--------------------------
      002813                        161 var_name::
      00A32C CC A1 D5         [ 2]  162 		subw x,#vars 
      00A32F 9F               [ 1]  163 		ld a,xl 
      00A32F A6               [ 1]  164 		srl a 
      00A330 4F 11            [ 1]  165 		add a,#'A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A332 02               [ 4]  166 		ret 
                                    167 
                                    168 ;-----------------------------
                                    169 ; return cmd  idx from its 
                                    170 ; code address 
                                    171 ; input:
                                    172 ;   X      code address 
                                    173 ; output:
                                    174 ;   X      cmd_idx
                                    175 ;-----------------------------
      00281B                        176 get_cmd_idx:
      00A333 2A 03            [ 2]  177 	pushw y
      00A335 CC A1 D5 0D      [ 2]  178 	ldw y,#code_addr 
      00A339 04 26 18 7B      [ 2]  179 	ldw ptr16,y 
      00A33D 03 11            [ 1]  180 	clrw y 
      00A33F 02 27 12         [ 5]  181 1$:	cpw x,([ptr16],y)
      00A342 7B 02            [ 1]  182 	jreq 3$ 
      00A344 97 7B            [ 1]  183 	incw y 
      00A346 03 95 7B         [ 4]  184 	ld a,([ptr16],y)
      00A349 01 CD            [ 1]  185 	incw y
      00A34B A1 3C 0C         [ 4]  186 	or a,([ptr16],y)	
      00A34E 02 0C            [ 1]  187 	jrne 1$
      00A350 03               [ 1]  188 3$: ldw x,y 
      00A351 CC A1            [ 2]  189 	popw y 
      00A353 D5               [ 4]  190 	ret
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
      00A354                        206 decompile::
      00283C                        207 	_vars VSIZE
      00A354 7B 01            [ 2]    1     sub sp,#VSIZE 
      00A356 90 F7 90         [ 1]  208 	ld a,base
      00A359 5C CD            [ 1]  209 	ld (BASE_SAV,sp),a  
      00A35B 83 32 7B         [ 1]  210 	ld a,tab_width 
      00A35E 03 11            [ 1]  211 	ld (WIDTH_SAV,sp),a 
      00A360 02 2B            [ 2]  212 	ldw (STR,sp),y   
      00A362 09 90 7F 0C      [ 5]  213 	ldw x,[basicptr] ; line number 
      00A366 02 0C 03 CC      [ 1]  214 	mov base,#10
      00A36A A1 D5 00 21      [ 1]  215 	mov tab_width,#5
      00A36C 72 5F 00 0B      [ 1]  216 	clr acc24 
      00A36C 0C 03 CC         [ 2]  217 	ldw acc16,x
      00A36F A1 D5 8E         [ 4]  218 	call itoa  
      00A371 CD 27 C0         [ 4]  219 	call right_align 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A371 90               [ 1]  220 	push a 
      00A372 AE 16            [ 1]  221 1$:	ldw y,x ; source
      00A374 90 0F            [ 2]  222 	ldw x,(STR+1,sp) ; destination
      00A376 01 72 F9         [ 4]  223 	call strcpy 
      00A379 01 90            [ 1]  224 	clrw y 
      00A37B 7F               [ 1]  225 	pop a 
      00A37C 7B 02            [ 1]  226 	ld yl,a 
      00A37E C7 00 04         [ 2]  227 	addw y,(STR,sp)
      00A381 A6 0D            [ 1]  228 	ld a,#SPACE 
      00A383 CD 83            [ 1]  229 	ld (y),a 
      00A385 32 5B            [ 1]  230 	incw y 
      00A387 04 81 00 21      [ 1]  231 	clr tab_width
      00A389 AE 00 03         [ 2]  232 	ldw x,#3
      00A389 88 4E CD         [ 2]  233 	ldw in.w,x 
      002883                        234 decomp_loop:
      00A38C A3 A0            [ 2]  235 	pushw y
      00A38E CD 83 32         [ 4]  236 	call next_token 
      00A391 7B 01            [ 2]  237 	popw y 
      00A393 CD               [ 1]  238 	tnz a  
      00A394 A3 A0            [ 1]  239 	jrne 1$
      00A396 CD 83 32         [ 2]  240 	jp 20$
      00A399 A6 20            [ 1]  241 1$:	jrpl 6$
                                    242 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      00A39B CD 83            [ 1]  243 	cp a,#TK_VAR 
      00A39D 32 84            [ 1]  244 	jrne 3$
                                    245 ;; TK_VAR 
      00A39F 81 27 AE         [ 4]  246 	call add_space  
      00A3A0 CD 28 13         [ 4]  247 	call var_name
      00A3A0 A4 0F            [ 1]  248 	ld (y),a 
      00A3A2 A1 09            [ 1]  249 	incw y  
      00A3A4 23 02            [ 2]  250 	jra decomp_loop
      0028A2                        251 3$:
      00A3A6 AB 07            [ 1]  252 	cp a,#TK_INTGR
      00A3A8 AB 30            [ 1]  253 	jrne 4$
                                    254 ;; TK_INTGR
      00A3AA 81 27 AE         [ 4]  255 	call add_space
      00A3AB 72 5F 00 0B      [ 1]  256 	clr acc24 
      00A3AB 52 02 0F         [ 2]  257 	ldw acc16,x 
      00A3AE 01 90            [ 2]  258 	pushw y 
      00A3B0 CE 00 1A         [ 4]  259 	call itoa  
      00A3B3 4D 27            [ 2]  260 	ldw y,(1,sp) 
      00A3B5 04               [ 1]  261 	push a 
      00A3B6 90               [ 1]  262 	exgw x,y 
      00A3B7 CE 00 05         [ 4]  263 	call strcpy 
      00A3BA 90 5F            [ 1]  264 	clrw y
      00A3BA 90               [ 1]  265 	pop a  
      00A3BB C3 00            [ 1]  266 	ld yl,a 
      00A3BD 1C 2A 10         [ 2]  267 	addw y,(1,sp)
      0028C4                        268 	_drop 2 
      00A3C0 90 F3            [ 2]    1     addw sp,#2 
      00A3C2 27 0E            [ 2]  269 	jra decomp_loop
                                    270 ;; dictionary keyword 
      0028C8                        271 4$:	
      00A3C4 2B 0A 90         [ 4]  272 	call get_cmd_idx 
      00A3C7 E6 02 6B         [ 2]  273 	cpw x,#REM_IDX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00A3CA 02 72            [ 1]  274 	jrne 5$
      00A3CC F9 01 20         [ 2]  275 	ldw x,basicptr 
                                    276 ; copy comment to buffer 
      00A3CF EA 27 AE         [ 4]  277 	call add_space
      00A3D0 A6 27            [ 1]  278 	ld a,#''
      00A3D0 5F 51            [ 1]  279 	ld (y),a 
      00A3D2 5B 02            [ 1]  280 	incw y 
      0028DC                        281 41$:
      00A3D4 51 81 00 00      [ 4]  282 	ld a,([in.w],x)
      00A3D6 72 5C 00 01      [ 1]  283 	inc in  
      00A3D6 52 04            [ 1]  284 	ld (y),a 
      00A3D8 E6 02            [ 1]  285 	incw y 
      00A3DA 6B 02 0F         [ 1]  286 	ld a,in 
      00A3DD 01 90 93         [ 1]  287 	cp a,count 
      00A3E0 72 F9            [ 1]  288 	jrmi 41$
      00A3E2 01 17            [ 2]  289 	jra 20$  
      00A3E4 03 90 CE         [ 2]  290 5$: cpw x,#LET_IDX 
      00A3E7 00 1C            [ 1]  291 	jreq decomp_loop ; down display LET 	
                                    292 ; insert command name 
      00A3E9 72 F2 03         [ 4]  293 	call add_space  
      00A3EC 90 CF            [ 2]  294 	pushw y
      00A3EE 00 0D 16         [ 4]  295 	call cmd_name
      00A3F1 03 CD            [ 2]  296 	popw y 
      00A3F3 84 36 90         [ 4]  297 	call cpy_cmd_name
      00A3F6 CE 00 1C         [ 2]  298 	jp decomp_loop 
      002907                        299 6$:
      00A3F9 72 F2            [ 1]  300 	cp a,#TK_QSTR 
      00A3FB 01 90            [ 1]  301 	jrne 7$
                                    302 ;; TK_QSTR
      00A3FD CF 00 1C         [ 4]  303 	call cpy_quote  
      00A400 5B 04 81         [ 2]  304 	jp decomp_loop
      00A403                        305 7$:
      00A403 52 06            [ 1]  306 	cp a,#TK_CHAR 
      00A405 1F 03            [ 1]  307 	jrne 8$
                                    308 ;; TK_CHAR 
      00A407 17 05            [ 1]  309 	ld a,#'\ 
      00A409 90 CF            [ 1]  310 	ld (y),a 
      00A40B 00 0D            [ 1]  311 	incw y 
      00A40D 90               [ 1]  312 	ld a,xl 
      00A40E 93 72            [ 1]  313 	ld (y),a 
      00A410 BB 00            [ 1]  314 	incw y 
      00A412 0D 1F 01         [ 2]  315 	jp decomp_loop
      00A415 CE 00            [ 1]  316 8$: cp a,#TK_COLON 
      00A417 1C 72            [ 1]  317 	jrne 9$
      00A419 F0 03            [ 1]  318 	ld a,#':
      002929                        319 81$:
      00A41B CF 00            [ 1]  320 	ld (y),a 
      00A41D 0D 1E            [ 1]  321 	incw y 
      00292D                        322 82$:
      00A41F 01 CD 84         [ 2]  323 	jp decomp_loop
      002930                        324 9$: 
      00A422 36 CE            [ 1]  325 	cp a,#TK_SHARP
      00A424 00 1C            [ 1]  326 	jrugt 10$ 
      00A426 72 FB            [ 1]  327 	sub a,#TK_ARRAY 
      00A428 05               [ 1]  328 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A429 CF               [ 1]  329 	ld xl,a
      00A42A 00 1C 5B         [ 2]  330 	addw x,#single_char 
      00A42D 06               [ 1]  331 	ld a,(x)
      00A42E 81 EB            [ 2]  332 	jra 81$ 
      00A42F                        333 10$: 
      00A42F 52 08            [ 1]  334 	cp a,#TK_MINUS 
      00A431 CE 00            [ 1]  335 	jrugt 11$
      00A433 1C C3            [ 1]  336 	sub a,#TK_PLUS 
      00A435 00               [ 1]  337 	clrw x 
      00A436 1A               [ 1]  338 	ld xl,a 
      00A437 26 19 AE         [ 2]  339 	addw x,#add_char 
      00A43A 00               [ 1]  340 	ld a,(x)
      00A43B 02 72            [ 2]  341 	jra 81$
      00294C                        342 11$:
      00A43D D6 00            [ 1]  343     cp a,#TK_MOD 
      00A43F 18 A1            [ 1]  344 	jrugt 12$
      00A441 03 27            [ 1]  345 	sub a,#TK_MULT
      00A443 5A               [ 1]  346 	clrw x 
      00A444 5F               [ 1]  347 	ld xl,a 
      00A445 97 1F 07         [ 2]  348 	addw x,#mul_char
      00A448 CE               [ 1]  349 	ld a,(x)
      00A449 00 1A            [ 2]  350 	jra 81$
      00295A                        351 12$:
      00A44B 1F 01            [ 1]  352 	sub a,#TK_GT  
      00A44D CE               [ 1]  353 	sll a 
      00A44E 00               [ 1]  354 	clrw x 
      00A44F 1C               [ 1]  355 	ld xl,a 
      00A450 20 38 72         [ 2]  356 	addw x,#relop_str 
      00A453 CE               [ 2]  357 	ldw x,(x)
      00A454 00               [ 1]  358 	ld a,(x)
      00A455 18               [ 1]  359 	incw x 
      00A456 1F 05            [ 1]  360 	ld (y),a
      00A458 AE 00            [ 1]  361 	incw y 
      00A45A 02               [ 1]  362 	ld a,(x)
      00A45B 72 D6            [ 1]  363 	jrne 81$
      00A45D 00 18 97         [ 2]  364 	jp decomp_loop 
      00296F                        365 20$: 
      00A460 1F 07            [ 1]  366 	clr (y)
      00A462 1E 05            [ 2]  367 	ldw x,(STR,sp)
      00A464 4F CD            [ 1]  368 	ld a,(BASE_SAV,sp)
      00A466 A3 AB 5D         [ 1]  369 	ld base,a 
      00A469 26 04            [ 1]  370 	ld a,(WIDTH_SAV,sp)
      00A46B 17 01 20         [ 1]  371 	ld tab_width,a
      00A46E 05 1F 01         [ 2]  372 	subw y,(STR,sp) 
      00A471 CD A3            [ 1]  373 	ld a,yl 
      002982                        374 	_drop VSIZE 
      00A473 D6 04            [ 2]    1     addw sp,#VSIZE 
      00A474 81               [ 4]  375 	ret 
                                    376 
      00A474 A6 03 11 08 27         377 single_char: .byte '@','(',')',',','#'
      00A479 24 1E                  378 add_char: .byte '+','-'
      00A47B 01 C3 00               379 mul_char: .byte '*','/','%'
      00A47E 1C 27 09 1E 01 16 07   380 relop_str: .word gt,equal,ge,lt,le,ne 
             CD A4 03 20 06
      00A48A 3E 00                  381 gt: .asciz ">"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00A48A 72 FB                  382 equal: .asciz "="
      00A48C 07 CF 00               383 ge: .asciz ">="
      00A48F 1C 1E                  384 lt: .asciz "<"
      00A491 07 CF 00               385 le: .asciz "<="
      00A494 0D 90 AE               386 ne:  .asciz "<>"
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
      0029AA                        399 cmd_name:
      0029AA                        400 	_vars VSIZE 
      00A497 16 E0            [ 2]    1     sub sp,#VSIZE 
      00A499 1E 01 CD 84      [ 1]  401 	clr acc16 
      00A49D 36 01            [ 2]  402 	ldw (CMDX,sp),x  
      00A49E AE 1F 41         [ 2]  403 	ldw x,#kword_dict	
      00A49E 5B 08            [ 2]  404 1$:	ldw (LINK,sp),x
      00A4A0 81 02            [ 1]  405 	ld a,(2,x)
      00A4A1 A4 0F            [ 1]  406 	and a,#15 
      00A4A1 52 02 4F         [ 1]  407 	ld acc8,a 
      00A4A4 6B 01 03         [ 2]  408 	addw x,#3
      00A4A6 72 BB 00 0C      [ 2]  409 	addw x,acc16
      00A4A6 91               [ 2]  410 	ldw x,(x) ; command index  
      00A4A7 D6 01            [ 2]  411 	cpw x,(CMDX,sp)
      00A4A9 27 24            [ 1]  412 	jreq 2$
      00A4AB 72 5C            [ 2]  413 	ldw x,(LINK,sp)
      00A4AD 00               [ 2]  414 	ldw x,(x) 
      00A4AE 02 6B 02         [ 2]  415 	subw x,#2  
      00A4B1 A6 5C            [ 1]  416 	jrne 1$
      00A4B3 11 01            [ 2]  417 	jra 9$
      00A4B5 26 0A            [ 2]  418 2$: ldw x,(LINK,sp)
      00A4B7 0F 01 7B         [ 2]  419 	addw x,#2 	
      0029D9                        420 9$:	_drop VSIZE
      00A4BA 02 AD            [ 2]    1     addw sp,#VSIZE 
      00A4BC 1C               [ 4]  421 	ret
                                    422 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
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
      00A4BD F7 5C                   30 app_sign: .word 0 ; .ascii "BC"  ; signature 
      00A4BF 20 E5                   31 app_size: .word 0 ; 31 
      00A4C1                         32 app: 
                                     33 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     34 ;;  BASIC code demo 'BLINK.BAS' 
                                     35 ;; 10 do btogl $500a,32 pause 250 until qkey bres $500a,32 end 
                                     36 ;; byte code generated by compiler.
                                     37 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     38 ;.byte 0,10,31,128,0,38,128,0,20,132,80,10,9,132,0,32,128
                                     39 ;.byte 0,100,132,0,250,128,0,182,129,0,132,128,0,46
                                     40 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   7 ABS        001F43 R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   7 ADCON      001F39 R
    ADCON_ID=  000002     |   7 ADCREAD    001F2D R   |     ADCREAD_=  000004 
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
  7 AND        001F25 R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  7 ASC        001F1D R   |     ASC_IDX =  000008     |     ATTRIB  =  000002 
    AUTORUN_=  004000     |   7 AWU        001F15 R   |   7 AWUHandl   000001 R
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
    BELL    =  000007     |     BINARY  =  000001     |   7 BIT        001F0D R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000C 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   7 BRES       001F04 R   |     BRES_IDX=  00000E 
    BS      =  000008     |     BSAVE   =  000001     |   7 BSET       001EFB R
    BSET_IDX=  000010     |     BSIZE   =  000005     |   7 BTEST      001EF1 R
    BTEST_ID=  000012     |   7 BTOGL      001EE7 R   |     BTOGL_ID=  000014 
    BTW     =  000001     |   7 BYE        001EDF R   |     BYE_IDX =  000016 
    C       =  000001     |     CAN     =  000018     |   7 CANT_DO    001539 R
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
  7 CHAR       001ED6 R   |     CHAR_IDX=  000018     |     CLKOPT  =  004807 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
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
    CPU_YL  =  007F07     |     CR      =  00000D     |   7 CRH        001ECE R
    CRH_IDX =  00001A     |   7 CRL        001EC6 R   |     CRL_IDX =  00001C 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   7 DATA       001EBD R
  7 DATALN     001EB2 R   |     DATALN_I=  000020     |     DATA_IDX=  00001E 
    DBG_A   =  000005     |     DBG_CC  =  000006     |     DBG_X   =  000003 
    DBG_Y   =  000001     |     DBL     =  000003     |     DBLDIVDN=  000006 
    DBLHI   =  000001     |     DBLLO   =  000003     |     DBL_SIZE=  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   7 DDR        001EAA R   |     DDR_IDX =  000022 
    DEBUG   =  000000     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
    DEBUG_PR=  000001     |   7 DEC        001EA2 R   |     DEC_IDX =  000024 
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
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   7 DO         001E9B R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]

Symbol Table

  7 DREAD      001E91 R   |     DREAD_ID=  000028     |   7 DWRITE     001E86 R
    DWRITE_I=  00002A     |   7 EDIT       001E7D R   |     EDIT_IDX=  00002C 
  7 EEPROM     001E72 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002E     |     EEPROM_S=  000800     |     EM      =  000019 
  7 END        001E6A R   |     END_IDX =  000030     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   7 ERASE      001E60 R
    ERASE_ID=  000032     |     ERR_BAD_=  00000A     |     ERR_BUF_=  00000F 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FAUTORUN=  000006     |     FBREAK  =  000004 
    FCOMP   =  000005     |   7 FCPU       001E57 R   |     FCPU_IDX=  000034 
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
    FLSI    =  01F400     |   7 FOR        001E4F R   |     FOR_IDX =  000038 
  7 FREE       001E46 R   |     FREE_IDX=  00009A     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   7 GOSUB      001E3C R
    GOSUB_ID=  00003A     |   7 GOTO       001E33 R   |     GOTO_IDX=  00003C 
  7 GPIO       001E2A R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_IDX=  00003E     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   7 HEX        001E22 R   |     HEX_IDX =  000040 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   7 IDR        001E1A R
    IDR_IDX =  000042     |   7 IF         001E13 R   |     IF_IDX  =  000044 
    IN      =  000005     |     INCR    =  000001     |     INP     =  000000 
  7 INPUT      001E09 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
    INT_VECT=  008058     |   7 INVERT     001DFE R   |     INVERT_I=  000048 
    INW     =  000009     |     IPOS    =  000001     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   7 IWDGEN     001DF3 R   |     IWDGEN_I=  00004A 
  7 IWDGREF    001DE7 R   |     IWDGREF_=  00004C     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  7 KEY        001DDF R   |     KEY_END =  000083     |     KEY_IDX =  00004E 
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  7 LET        001DD7 R   |     LET_IDX =  000050     |     LF      =  00000A 
    LIMIT   =  000001     |     LINENO  =  000005     |     LINK    =  000003 
  7 LIST       001DCE R   |     LIST_IDX=  000052     |     LL      =  000001 
    LLEN    =  000007     |     LL_HB   =  000001     |     LN_PTR  =  000005 
  7 LOG        001DC6 R   |     LOG_IDX =  000054     |   7 LSHIFT     001DBB R
    LSHIFT_I=  000056     |     MAJOR   =  000002     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
  7 MULDIV     001DB0 R   |     MULDIV_I=  000058     |     MULOP   =  000003 
    N1      =  000001     |     N2      =  000003     |     NAFR    =  004804 
    NAK     =  000015     |     NCLKOPT =  004808     |     NEG     =  000001 
  7 NEW        001DA8 R   |     NEW_IDX =  00005C     |   7 NEXT       001D9F R
    NEXT_IDX=  00005A     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]

Symbol Table

    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  7 NOT        001D97 R   |     NOT_IDX =  00005E     |   7 NOT_SAVE   000F28 R
  7 NO_APP     001578 R   |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   7 NonHandl   000000 R   |   7 ODR        001D8F R
    ODR_IDX =  000060     |     ONOFF   =  000003     |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   7 OR         001D88 R   |     OR_IDX  =  000062 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     OVRWR   =  000004     |     PA      =  000000 
  7 PAD        001D80 R   |     PAD_IDX =  000064     |     PAD_SIZE=  000080 
  7 PAUSE      001D76 R   |     PAUSE_ID=  000066     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  7 PEEK       001D6D R   |     PEEK_IDX=  00006A     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   7 PINP       001D64 R   |     PINP_IDX=  00006C 
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   7 PMODE      001D5A R   |     PMODE_ID=  000068 
  7 POKE       001D51 R   |     POKE_IDX=  00006E     |     PORT    =  000003 
  7 POUT       001D48 R   |     POUT_IDX=  000070     |     PREV    =  000001 
  7 PRINT      001D3E R   |   7 PROG_ADD   000E01 R   |   7 PROG_SIZ   000E13 R
  7 PRTA       001D35 R   |     PRTA_IDX=  000074     |   7 PRTB       001D2C R
    PRTB_IDX=  000076     |   7 PRTC       001D23 R   |     PRTC_IDX=  000078 
  7 PRTD       001D1A R   |     PRTD_IDX=  00007A     |   7 PRTE       001D11 R
    PRTE_IDX=  00007C     |   7 PRTF       001D08 R   |     PRTF_IDX=  00007E 
  7 PRTG       001CFF R   |     PRTG_IDX=  000080     |   7 PRTH       001CF6 R
    PRTH_IDX=  000082     |   7 PRTI       001CED R   |     PRTI_IDX=  000084 
    PRT_IDX =  000072     |     PSTR    =  000003     |   7 QKEY       001CE4 R
    QKEY_IDX=  000086     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |     RBT_IDX =  00008A     |   7 READ       001CDB R
    READ_IDX=  000088     |   7 REBOOT     001CD0 R   |     REG     =  000001 
    REGA    =  000001     |     REGX    =  000003     |     REGY    =  000005 
    RELOP   =  000003     |   7 REMARK     001CC5 R   |     REM_IDX =  00008C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]

Symbol Table

  7 RESTORE    001CB9 R   |     REST_IDX=  00008E     |     RETL1   =  000001 
  7 RETURN     001CAE R   |     RET_ADDR=  000003     |     RET_IDX =  000090 
    RET_INW =  000005     |   7 RND        001CA6 R   |     RND_IDX =  000092 
    ROP     =  004800     |     RS      =  00001E     |   7 RSHIFT     001C9B R
    RSHIFT_I=  000094     |     RST_SR  =  0050B3     |   7 RUN        001C93 R
  7 RUNNING    000552 R   |     RUN_IDX =  000096     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |   7 SAVE       001C8A R   |     SAVEB   =  000002 
    SAVE_IDX=  000036     |     SDIVSR  =  000005     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   7 SHOW       001C81 R
    SHOW_IDX=  000098     |     SI      =  00000F     |     SIGN    =  000001 
  7 SIGNATUR   001537 R   |   7 SIZE       001C78 R   |     SIZE_IDX=  0000C4 
    SKIP    =  000005     |   7 SLEEP      001C6E R   |     SLEEP_ID=  00009C 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  7 SPIEN      001C64 R   |     SPIEN_ID=  0000A0     |   7 SPIRD      001C5A R
    SPIRD_ID=  00009E     |   7 SPISEL     001C4F R   |     SPISEL_I=  0000A2 
  7 SPIWR      001C45 R   |     SPIWR_ID=  0000A4     |     SPI_CR1 =  005200 
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
    STACK_EM=  0017FF     |     STACK_SI=  0000A0     |   7 STEP       001C3C R
    STEP_IDX=  0000A6     |   7 STOP       001C33 R   |     STOP_IDX=  0000A8 
    STR     =  000003     |   7 STR_BYTE   000E22 R   |     STX     =  000002 
    SUB     =  00001A     |     SUP     =  000084     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   7 TICKS      001C29 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   7 TIMEOUT    001C1D R
  7 TIMER      001C13 R   |     TIMER_ID=  0000AC     |     TIM_CR1_=  000007 
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
  7 TO         001C0C R   |   7 TONE       001C03 R   |     TONE_IDX=  0000B2 
    TO_IDX  =  0000B0     |   7 Timer4Up   000040 R   |     U1      =  000001 
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
    UBC     =  004801     |   7 UBOUND     001BF8 R   |     UBOUND_I=  0000B4 
  7 UBTN_Han   000079 R   |   7 UFLASH     001BED R   |     UFLASH_I=  0000B6 
  7 UNTIL      001BE3 R   |     UNTIL_ID=  0000B8     |     US      =  00001F 
  7 USER_ABO   00008C R   |   7 USR        001BDB R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     USR_IDX =  0000BA 
  7 Uart1RxH   00000F R   |   7 UserButt   000055 R   |     VAR_ADDR=  000006 
    VSISE   =  000003     |     VSIZ    =  000002     |     VSIZE   =  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]

Symbol Table

    VT      =  00000B     |   7 WAIT       001BD2 R   |     WAIT_IDX=  0000BC 
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   7 WORDS      001BC8 R
    WORDS_ID=  0000BE     |   7 WRITE      001BBE R   |     WRITE_ID=  0000C0 
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XFIRST  =  000001 
    XMASK   =  000001     |     XOFF    =  000013     |     XON     =  000011 
  7 XOR        001BB6 R   |     XOR_IDX =  0000C2     |     XREG    =  000003 
    XSAVE   =  000001     |     YSAVE   =  000004     |   7 abs        0016E6 R
  1 acc16      00000C GR  |   1 acc24      00000B GR  |   1 acc8       00000D GR
  7 accept_c   0022AF R   |   7 add_char   00298A R   |   7 add_spac   0027AE R
  7 analog_r   00133E R   |   7 app        002A04 R   |   7 app_sign   002A00 R
  7 app_size   002A02 R   |   7 app_spac   002A00 GR  |   7 arduino_   0017DC R
  7 arg_list   000BD0 R   |   1 array_si   00001E R   |   7 ascii      0015D7 R
  7 at_tst     00261C R   |   7 atoi24     00098A GR  |   7 atoi_exi   0009F0 R
  7 awu        001697 R   |   7 awu02      0016A1 R   |   7 bad_port   001638 R
  1 base       00000A GR  |   1 basicptr   000004 GR  |   7 beep       0012CB R
  7 beep_1kh   0012B5 GR  |   7 bin_exit   0024E2 R   |   7 bit_and    0016FA R
  7 bit_or     001712 R   |   7 bit_rese   001090 R   |   7 bit_set    001080 R
  7 bit_test   0010B1 R   |   7 bit_togg   0010A1 R   |   7 bit_xor    00172A R
  7 bitmask    001948 R   |   7 bkslsh_t   0025C9 R   |   7 bksp       00204D R
  7 block_er   0001A8 R   |   7 break_po   00140B R   |   7 bye        001670 R
  7 char       0015C5 R   |   7 clear_ba   000592 R   |   7 clear_va   0003F8 R
  7 clock_in   0000A7 R   |   7 cmd_end    0012AE R   |   7 cmd_line   0007AF R
  7 cmd_name   0029AA R   |   7 cmd_size   000DD4 R   |   7 code_add   001F49 GR
  7 cold_sta   00046F R   |   7 colon_ts   0025F0 R   |   7 comma_ts   0025FB R
  7 comp_msg   000707 R   |   7 compile    002721 GR  |   7 const_cr   0019FC R
  7 const_cr   001A02 R   |   7 const_dd   0019F6 R   |   7 const_ee   001A14 R
  7 const_id   0019F0 R   |   7 const_in   001A0E R   |   7 const_od   0019EA R
  7 const_ou   001A08 R   |   7 const_po   0019B4 R   |   7 const_po   0019BA R
  7 const_po   0019C0 R   |   7 const_po   0019C6 R   |   7 const_po   0019CC R
  7 const_po   0019D2 R   |   7 const_po   0019D8 R   |   7 const_po   0019DE R
  7 const_po   0019E4 R   |   7 convert_   002459 R   |   7 convert_   002011 R
  7 copy_com   002651 R   |   1 count      000003 GR  |   7 cp_loop    000B7F R
  7 cpy_cmd_   002799 R   |   7 cpy_quot   0027D2 R   |   7 create_g   002383 R
  7 cs_high    001BA9 R   |   7 cstk_pro   000D8A R   |   7 dash_tst   002611 R
  7 data       001A1A R   |   1 data_len   000009 R   |   7 data_lin   001A20 R
  1 data_ofs   000008 R   |   1 data_ptr   000006 R   |   7 data_sea   001A61 R
  7 dbl_sign   000AD9 R   |   7 dec_base   000DB6 R   |   7 decomp_l   002883 R
  7 decompil   00283C GR  |   7 del_line   002356 R   |   7 delete_l   00213A R
  7 delete_n   00205D R   |   7 delete_u   0020FF R   |   7 digital_   001372 R
  7 digital_   0013A2 R   |   7 div32_16   000AE3 R   |   7 divide     000B3A R
  7 divu24_8   0008F9 R   |   7 dneg       000ACE R   |   7 do_loop    001971 R
  7 do_progr   00019B R   |   7 edit       000EFB R   |   7 enable_i   0018F2 R
  7 eql_tst    0026A6 R   |   7 equal      00299D R   |   7 erase      00146A R
  7 erase_fl   0001C7 R   |   7 err_bad_   000672 R   |   7 err_buf_   0006E8 R
  7 err_cmd_   000636 R   |   7 err_div0   0005FB R   |   7 err_dupl   000650 R
  7 err_math   0005E2 R   |   7 err_mem_   0005C7 R   |   7 err_msg    0005A7 R
  7 err_no_a   00067E R   |   7 err_no_d   0006B1 R   |   7 err_no_f   0006D5 R
  7 err_no_l   00060A R   |   7 err_no_p   0006C1 R   |   7 err_not_   000661 R
  7 err_run_   000620 R   |   7 err_synt   0005D4 R   |   7 escaped    00246E GR
  7 expect     000BBE R   |   7 expr_exi   000D15 R   |   7 expressi   000CCF R
  7 factor     000C20 R   |   1 farptr     000016 R   |   7 fcpu       001774 R
  7 final_te   0022A8 R   |   7 first_li   000EA8 R   |   1 flags      000020 GR
  7 for        00110C R   |   7 free       000DBB R   |   3 free_ram   000080 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]

Symbol Table

  7 func_arg   000BCB R   |   7 func_not   0018E5 R   |   7 ge         00299F R
  7 get_arra   000BFB R   |   7 get_cmd_   00281B R   |   7 get_esca   00201D R
  7 get_targ   0011D6 R   |   7 get_tick   0016E0 R   |   7 get_toke   002562 GR
  7 getc       0002C2 GR  |   7 gosub      001217 R   |   7 goto       0011FC R
  7 gpio       001613 R   |   7 gt         00299B R   |   7 gt_tst     0026B1 R
  7 hex_base   000DB1 R   |   7 hex_dump   00034F R   |   7 if         0010F8 R
  1 in         000001 GR  |   1 in.saved   000002 GR  |   1 in.w       000000 GR
  7 incr_far   00144E R   |   7 input_ex   001052 R   |   7 input_lo   000FE7 R
  7 input_va   000FE5 R   |   7 insert_c   0020BC R   |   7 insert_l   0023AF R
  7 insert_l   00241E R   |   7 interp_l   0007F0 R   |   7 interpre   0007CB R
  7 invert     001962 R   |   7 is_alnum   000420 GR  |   7 is_alpha   000406 GR
  7 is_digit   000417 GR  |   7 itoa       00088E GR  |   7 itoa_loo   0008B3 R
  7 jp_to_ta   00120A R   |   7 key        0015FE R   |   7 kw_loop    0024FE R
  7 kword_di   001F41 GR  |   7 kword_en   001BB4 R   |   7 le         0029A4 R
  7 leading_   001938 R   |   7 let        000E33 GR  |   7 let_arra   000E41 R
  7 let_var    000E44 R   |   7 lines_sk   000EAB R   |   7 list       000E66 R
  7 list_exi   000EED R   |   7 list_loo   000ECB R   |   7 log2       00192D R
  7 logical_   0018DB R   |   7 long_div   000AB6 R   |   7 loop_bac   0011B9 R
  1 loop_dep   00001D R   |   7 loop_don   0011CE R   |   7 lshift     001742 R
  7 lt         0029A2 R   |   7 lt_tst     0026DA R   |   7 modulo     000B50 R
  7 move       0003B6 GR  |   7 move_dow   0003D4 R   |   7 move_era   00013C R
  7 move_exi   0003F5 R   |   7 move_lef   002094 R   |   7 move_loo   0003D9 R
  7 move_prg   000170 R   |   7 move_rig   0020A2 R   |   7 move_up    0003C6 R
  7 mul_char   00298C R   |   7 muldiv     000B55 R   |   7 multiply   000A81 R
  7 mulu24_8   000921 R   |   7 nbr_tst    002595 R   |   7 ne         0029A7 R
  7 neg_acc2   00095B R   |   7 new        001429 R   |   7 next       00118C R
  7 next_lin   0007D3 R   |   7 next_tok   000817 GR  |   7 no_match   000B91 R
  7 other      002703 R   |   7 overwrit   0022D4 R   |   5 pad        0016E0 GR
  7 pad_ref    001BAE R   |   7 parse_bi   0024C0 R   |   7 parse_in   002476 R
  7 parse_ke   0024FD R   |   7 parse_qu   002421 R   |   7 pause      001684 R
  7 pause02    00168E R   |   7 peek       0010E7 R   |   7 pin_mode   001780 R
  7 plus_tst   00267A R   |   7 poke       0010D8 R   |   7 power_ad   001302 R
  7 prcnt_ts   00269B R   |   7 print      000F5F R   |   7 print_ex   000FB9 R
  7 print_he   002309 GR  |   7 print_in   000872 R   |   7 printxy    0009F4 R
  7 prog_siz   000E5E R   |   7 program_   000150 R   |   7 program_   000170 R
  7 prt_basi   000F3F R   |   7 prt_loop   000F63 R   |   7 prt_tok    0002E1 R
  7 prti24     000882 R   |   1 ptr16      000017 GR  |   1 ptr8       000018 R
  7 putc       0002B2 GR  |   7 puts       002043 GR  |   7 qgetc      0002BB GR
  7 qkey       001606 GR  |   7 qmark_ts   002627 R   |   7 qsign      0014CF R
  7 random     0017FC R   |   7 read       001A9D R   |   7 read01     001A9F R
  7 readln     002148 GR  |   7 readln_l   002155 R   |   7 readln_q   0022F1 R
  7 refresh_   001928 R   |   7 rel_exit   000D6D R   |   7 relation   000D18 R
  7 relop_st   00298F R   |   7 remark     001055 GR  |   7 reset_co   000F61 R
  7 rest_con   000FD5 R   |   7 restore    001A4E R   |   7 return     001237 R
  7 right_al   0027C0 GR  |   7 row_alig   001433 R   |   7 row_eras   000115 R
  7 row_eras   00013C R   |   7 row_loop   000332 R   |   7 rparnt_t   0025E5 R
  7 rshift     00175B R   |   3 rsign      00007C R   |   3 rsize      00007E R
  7 rt_msg     0006F5 R   |   7 run        001255 R   |   7 run_app    000511 R
  7 run_it     001287 R   |   1 rx1_head   00002A R   |   1 rx1_queu   000022 R
  1 rx1_tail   00002B R   |   7 save_app   0014D6 R   |   7 save_con   000FC5 R
  7 scan_blo   00145C R   |   7 search_d   000B71 GR  |   7 search_e   000BBB R
  7 search_l   00232B GR  |   7 search_l   00233A R   |   7 search_n   000B75 R
  1 seedx      000012 R   |   1 seedy      000014 R   |   7 select_p   0017CC R
  7 send_esc   00206B R   |   7 send_par   002076 R   |   7 set_time   0018C9 R
  7 sharp_ts   002606 R   |   7 show       000D70 R   |   7 show_row   000320 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]

Symbol Table

  7 single_c   002985 R   |   7 skip       00254F R   |   7 slash_ts   002690 R
  7 sleep      001679 R   |   7 software   000429 R   |   7 spaces     0020B0 GR
  7 spi_clea   001B42 R   |   7 spi_disa   001B2A R   |   7 spi_enab   001AF7 R
  7 spi_rcv_   001B64 R   |   7 spi_read   001B8F R   |   7 spi_sele   001B97 R
  7 spi_send   001B4E R   |   7 spi_writ   001B6F R   |   5 stack_fu   001760 GR
  5 stack_un   001800 R   |   7 star_tst   002685 R   |   7 step       001165 R
  7 stop       0013DD R   |   7 store_lo   001179 R   |   7 str_matc   000B9E R
  7 str_tst    002585 R   |   7 strcmp     000397 R   |   7 strcpy     0003A8 GR
  7 strlen     00038C GR  |   7 syntax_e   000728 GR  |   1 tab_widt   000021 GR
  7 tb_error   00072A GR  |   7 term       000C7D R   |   7 term01     000C85 R
  7 term_exi   000CCC R   |   5 tib        001690 GR  |   7 tick_tst   00263F R
  1 ticks      00000E R   |   7 timeout    0018D8 R   |   1 timer      000010 GR
  7 timer2_i   0000BD R   |   7 timer4_i   0000CA R   |   7 tk_id      000718 R
  7 to         001135 R   |   7 to_eepro   000193 R   |   7 to_flash   000198 R
  7 to_hex_c   002320 GR  |   7 to_upper   00097E GR  |   7 token_ch   00271A R
  7 token_ex   00271E R   |   7 token_ms   000318 R   |   7 tone       0012BE R
  7 try_next   001A8D R   |   1 txtbgn     000019 GR  |   1 txtend     00001B GR
  7 uart1_ge   0002C2 GR  |   7 uart1_in   00026F R   |   7 uart1_pu   0002B2 GR
  7 uart1_qg   0002BB GR  |   7 uart1_se   00027F R   |   7 ubound     000E29 R
  7 udiv32_1   000AA4 R   |   7 uflash     00163D R   |   7 umstar     000A47 R
  7 unlock_e   0000DF R   |   7 unlock_f   0000FA R   |   7 until      001986 R
  7 user_int   000068 R   |   7 usr        001653 R   |   7 var_name   002813 GR
  1 vars       00002C GR  |   7 wait       00105B R   |   7 warm_ini   000574 R
  7 warm_sta   0007AC R   |   7 words      001863 R   |   7 words_co   0018B3 R
  7 write      00158E R   |   7 write_bl   00024C R   |   7 write_by   0001D2 R
  7 write_ee   00020E R   |   7 write_ex   000247 R   |   7 write_fl   0001F8 R
  7 write_ro   000184 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
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

