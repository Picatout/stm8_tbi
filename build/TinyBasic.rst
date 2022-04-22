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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



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
      000025                         70 tab_width:: .blkb 1 ; print colon width (default 4)
      000026                         71 rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
      00002E                         72 rx1_head:  .blkb 1 ; rx1_queue head pointer
      00002F                         73 rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
      000030                         74 rx3_queue: .ds RX_QUEUE_SIZE ; UART3 receive circular queue
      000038                         75 rx3_head:  .blkb 1 ; rx3_queue head pointer 
      000039                         76 rx3_tail:  .blkb 1 ; rx3_queue tail pointer  
                                     77 
      00003A                         78 vars:: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     79 ; keep 'free_ram' as last variable 
      00006E                         80 free_ram: ; from here RAM free for BASIC text 
                                     81 
                                     82 ;;-----------------------------------
                                     83     .area SSEG (ABS)
                                     84 ;; working buffers and stack at end of RAM. 	
                                     85 ;;-----------------------------------
      001690                         86     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
      001690                         87 tib:: .ds TIB_SIZE             ; transaction input buffer
      0016E0                         88 pad:: .ds PAD_SIZE             ; working buffer
      001760                         89 stack_full:: .ds STACK_SIZE   ; control stack 
      001800                         90 stack_unf: ; stack underflow ; control_stack bottom 
                                     91 
                                     92 ;;--------------------------------------
                                     93     .area HOME 
                                     94 ;; interrupt vector table at 0x8000
                                     95 ;;--------------------------------------
      008000 82 00 85 97             96     int cold_start			; RESET vector 
                           000000    97 .if DEBUG
                                     98 	int TrapHandler 		;TRAP  software interrupt
                           000001    99 .else
      008004 82 00 80 80            100 	int NonHandledInterrupt ;TRAP  software interrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                    101 .endif
      008008 82 00 80 80            102 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 81            103 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            104 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            105 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80            106 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80            107 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            108 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 81 0D            109 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80            110 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80            111 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80            112 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80            113 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80            114 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80            115 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80            116 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80            117 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80            118 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80            119 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 8F            120 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80            121 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80            122 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 D2            123 	int Uart3RxHandler      ;int21 UART3 RX full
      008060 82 00 80 80            124 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 F8            125 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80            126 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80            127 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80            128 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80            129 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80            130 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80            131 	int NonHandledInterrupt ;int29  not used
                                    132 
                                    133 ;---------------------------------------
                                    134     .area CODE
                                    135 ;---------------------------------------
                           000000   136 .if DEBUG
                                    137 .asciz "STM8_TBI" ; I like to put module name here.
                                    138 .endif 
                                    139 
                                    140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    141 ; non handled interrupt 
                                    142 ; reset MCU
                                    143 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                        144 NonHandledInterrupt:
      008080 71                     145     .byte 0x71  ; invalid opcode reinitialize MCU
                                    146 
                                    147 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    148 ; auto wakeup from halt
                                    149 ; at iret, program continue 
                                    150 ; after hatl instruction
                                    151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008081                        152 AWUHandler:
      008081 72 19 50 F0      [ 1]  153 	bres AWU_CSR,#AWU_CSR_AWUEN
      008085 55 00 3F 50 F1   [ 1]  154 	mov AWU_APR,0x3F
      00808A 72 5F 50 F2      [ 1]  155 	clr AWU_TBR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      00808E 80               [11]  156 	iret
                                    157 
                                    158 ;--------------------------
                                    159 ; UART1 receive character
                                    160 ; CTRL-C (ASCII 3)
                                    161 ; cancel program execution
                                    162 ; and fall back to command line
                                    163 ;--------------------------
      00808F                        164 Uart1RxHandler: ; console receive char 
      00000F                        165 	_led2_on 
      00808F 72 1A 50 0A      [ 1]    1     bset LED2_PORT,#LED2_BIT 
      008093 72 0B 52 30 35   [ 2]  166 	btjf UART1_SR,#UART_SR_RXNE,5$
      008098 C6 52 31         [ 1]  167 	ld a,UART1_DR 
      00809B A1 03            [ 1]  168 	cp a,#CTRL_C 
      00809D 26 06            [ 1]  169 	jrne 2$
      00809F CD 83 AB         [ 4]  170 	call putc 
      0080A2 CC 81 20         [ 2]  171 	jp user_interrupted
      0080A5                        172 2$:
      0080A5 A1 18            [ 1]  173 	cp a,#CAN ; CTRL_X 
      0080A7 26 03            [ 1]  174 	jrne 3$
      0080A9 CC 85 97         [ 2]  175 	jp cold_start 	
      0080AC                        176 3$: 
      0080AC A1 1A            [ 1]  177 	cp a,#CTRL_Z
      0080AE 26 06            [ 1]  178 	jrne 4$
      0080B0 CD 86 58         [ 4]  179 	call cancel_autorun 
      0080B3 CC 85 97         [ 2]  180 	jp cold_start
      0080B6 AE 00 26         [ 2]  181 4$:	ldw x,#rx1_queue  
      0080B9 88               [ 1]  182 	push a 
      0080BA 9F               [ 1]  183 	ld a,xl 
      0080BB CB 00 2F         [ 1]  184 	add a,rx1_tail 
      0080BE 97               [ 1]  185 	ld xl,a
      0080BF 84               [ 1]  186 	pop a  
      0080C0 F7               [ 1]  187 	ld (x),a
      0080C1 72 5C 00 2F      [ 1]  188 	inc rx1_tail 
      0080C5 A6 07            [ 1]  189 	ld a,#RX_QUEUE_SIZE-1
      0080C7 C4 00 2F         [ 1]  190 	and a,rx1_tail 
      0080CA C7 00 2F         [ 1]  191 	ld rx1_tail,a  
      00004D                        192 5$:	_led2_off 	
      0080CD 72 1B 50 0A      [ 1]    1     bres LED2_PORT,#LED2_BIT 
      0080D1 80               [11]  193 	iret 
                                    194 
                                    195 ;-----------------------------
                                    196 ; ISR for character reception
                                    197 ; on UART3
                                    198 ; raw data communication
                                    199 ;-----------------------------
      0080D2                        200 Uart3RxHandler:
      000052                        201 	_led2_on 
      0080D2 72 1A 50 0A      [ 1]    1     bset LED2_PORT,#LED2_BIT 
      0080D6 AE 00 30         [ 2]  202 	ldw x,#rx3_queue 
      0080D9 9F               [ 1]  203 	ld a,xl 
      0080DA CB 00 39         [ 1]  204 	add a,rx3_tail 
      0080DD 97               [ 1]  205 	ld xl,a 
      0080DE 72 0B 52 40 10   [ 2]  206 	btjf UART3_SR,#UART_SR_RXNE,9$
      0080E3 C6 52 41         [ 1]  207 	ld a,UART3_DR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080E6 F7               [ 1]  208 	ld (x),a  
      0080E7 72 5C 00 39      [ 1]  209 	inc rx3_tail 
      0080EB A6 07            [ 1]  210 	ld a,#RX_QUEUE_SIZE-1 
      0080ED C4 00 39         [ 1]  211 	and a,rx3_tail 
      0080F0 C7 00 39         [ 1]  212 	ld rx3_tail,a 
      000073                        213 9$:	_led2_off 
      0080F3 72 1B 50 0A      [ 1]    1     bres LED2_PORT,#LED2_BIT 
      0080F7 80               [11]  214 	iret  
                                    215 
                                    216 
                                    217 ;------------------------------------
                                    218 ; software interrupt handler  
                                    219 ;------------------------------------
                           000000   220 .if DEBUG 
                                    221 TrapHandler:
                                    222 	bset flags,#FTRAP 
                                    223 	call print_registers
                                    224 	call cmd_itf
                                    225 	bres flags,#FTRAP 	
                                    226 	iret
                                    227 .endif 
                                    228 
                                    229 ;------------------------------
                                    230 ; TIMER 4 is used to maintain 
                                    231 ; a milliseconds 'ticks' counter
                                    232 ; and decrement 'timer' varaiable
                                    233 ;--------------------------------
      0080F8                        234 Timer4UpdateHandler:
      0080F8 72 5F 53 42      [ 1]  235 	clr TIM4_SR 
      0080FC CE 00 0F         [ 2]  236 	ldw x,ticks
      0080FF 5C               [ 1]  237 	incw x
      008100 CF 00 0F         [ 2]  238 	ldw ticks,x 
      008103 CE 00 11         [ 2]  239 	ldw x,timer
                                    240 ;	tnzw x 
      008106 27 04            [ 1]  241 	jreq 1$
      008108 5A               [ 2]  242 	decw x 
      008109 CF 00 11         [ 2]  243 	ldw timer,x 
      00810C                        244 1$:	
      00810C 80               [11]  245 	iret 
                                    246 
                                    247 
                                    248 ;------------------------------------
                                    249 ; Triggered by pressing USER UserButton 
                                    250 ; on NUCLEO card.
                                    251 ; This is used to abort a progam lock 
                                    252 ; in infinite loop. 
                                    253 ;------------------------------------
      00810D                        254 UserButtonHandler:
                                    255 ; wait button release
      00810D 5F               [ 1]  256 	clrw x
      00810E 5A               [ 2]  257 1$: decw x 
      00810F 26 FD            [ 1]  258 	jrne 1$
      008111 72 09 50 15 F8   [ 2]  259 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    260 ; if MCU suspended by SLEEP resume program
      008116 72 07 00 24 05   [ 2]  261     btjf flags,#FSLEEP,2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      00811B 72 17 00 24      [ 1]  262 	bres flags,#FSLEEP 
      00811F 80               [11]  263 	iret
      008120                        264 2$:	
      008120                        265 user_interrupted:
      008120 72 00 00 24 02   [ 2]  266     btjt flags,#FRUN,4$
      008125 20 13            [ 2]  267 	jra UBTN_Handler_exit 
      008127                        268 4$:	; program interrupted by user 
      008127 72 11 00 24      [ 1]  269 	bres flags,#FRUN 
      00812B AE 81 42         [ 2]  270 	ldw x,#USER_ABORT
      00812E CD A2 C0         [ 4]  271 	call puts 
      008131 CE 00 05         [ 2]  272 	ldw x,basicptr 
      008134 C6 00 02         [ 1]  273 	ld a,in 
      008137 CD 8F A4         [ 4]  274 	call prt_basic_line
      00813A                        275 UBTN_Handler_exit:
      00813A AE 17 FF         [ 2]  276     ldw x,#STACK_EMPTY 
      00813D 94               [ 1]  277     ldw sp,x
      00813E 9A               [ 1]  278 	rim 
      00813F CC 88 C2         [ 2]  279 	jp warm_start
                                    280 
      008142 0A 50 72 6F 67 72 61   281 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    282 
                                    283 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    284 ;    peripherals initialization
                                    285 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    286 
                                    287 ;----------------------------------------
                                    288 ; inialize MCU clock 
                                    289 ; input:
                                    290 ;   A 		source  HSI | 1 HSE 
                                    291 ;   XL      CLK_CKDIVR , clock divisor 
                                    292 ; output:
                                    293 ;   none 
                                    294 ;----------------------------------------
      00815D                        295 clock_init:	
      00815D C1 50 C3         [ 1]  296 	cp a,CLK_CMSR 
      008160 27 0C            [ 1]  297 	jreq 2$ ; no switching required 
                                    298 ; select clock source 
      008162 72 12 50 C5      [ 1]  299 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008166 C7 50 C4         [ 1]  300 	ld CLK_SWR,a
      008169 C1 50 C3         [ 1]  301 1$:	cp a,CLK_CMSR
      00816C 26 FB            [ 1]  302 	jrne 1$
      00816E                        303 2$: 	
                                    304 ; HSI and cpu clock divisor 
      00816E 9F               [ 1]  305 	ld a,xl 
      00816F C7 50 C6         [ 1]  306 	ld CLK_CKDIVR,a  
      008172 81               [ 4]  307 	ret
                                    308 
                                    309 ;----------------------------------
                                    310 ; TIMER2 used as audio tone output 
                                    311 ; on port D:5.
                                    312 ; channel 1 configured as PWM mode 1 
                                    313 ;-----------------------------------  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                           00F424   314 TIM2_CLK_FREQ=62500
      008173                        315 timer2_init:
      008173 72 1A 50 C7      [ 1]  316 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008177 35 60 53 05      [ 1]  317  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      00817B 35 08 53 0C      [ 1]  318 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      00817F 81               [ 4]  319 	ret 
                                    320 
                                    321 ;---------------------------------
                                    322 ; TIM4 is configured to generate an 
                                    323 ; interrupt every millisecond 
                                    324 ;----------------------------------
      008180                        325 timer4_init:
      008180 72 18 50 C7      [ 1]  326 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008184 35 07 53 45      [ 1]  327 	mov TIM4_PSCR,#7 ; prescale 128  
      008188 35 7D 53 46      [ 1]  328 	mov TIM4_ARR,#125 ; set for 1msec.
      00818C 35 05 53 40      [ 1]  329 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008190 72 10 53 41      [ 1]  330 	bset TIM4_IER,#TIM4_IER_UIE
      008194 81               [ 4]  331 	ret
                                    332 
                                    333 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    334 ;  routines to write to FLASH, EEPROM 
                                    335 ;  and OPTION 
                                    336 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    337 
                                    338 ;----------------------------------
                                    339 ; unlock EEPROM/OPT for writing/erasing
                                    340 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    341 ; input:
                                    342 ;  none
                                    343 ; output:
                                    344 ;  none 
                                    345 ;----------------------------------
      008195                        346 unlock_eeprom:
      008195 35 00 50 5B      [ 1]  347 	mov FLASH_CR2,#0 
      008199 35 FF 50 5C      [ 1]  348 	mov FLASH_NCR2,#0xFF 
      00819D 35 AE 50 64      [ 1]  349 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      0081A1 35 56 50 64      [ 1]  350     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      0081A5 72 07 50 5F FB   [ 2]  351 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      0081AA 81               [ 4]  352 	ret
                                    353 
                                    354 ;----------------------------------
                                    355 ; unlock FLASH for writing/erasing
                                    356 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    357 ; input:
                                    358 ;  none
                                    359 ; output:
                                    360 ;  none
                                    361 ;----------------------------------
      0081AB                        362 unlock_flash:
      0081AB 35 00 50 5B      [ 1]  363 	mov FLASH_CR2,#0 
      0081AF 35 FF 50 5C      [ 1]  364 	mov FLASH_NCR2,#0xFF 
      0081B3 35 56 50 62      [ 1]  365 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      0081B7 35 AE 50 62      [ 1]  366 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      0081BB 72 03 50 5F FB   [ 2]  367 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      0081C0 81               [ 4]  368 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    369 
                                    370 ;----------------------------
                                    371 ; erase block code must be 
                                    372 ; executed from RAM
                                    373 ; input:
                                    374 ;-----------------------------
      0081C1                        375 row_erase:
      0081C1 35 20 50 5B      [ 1]  376 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      0081C5 35 DF 50 5C      [ 1]  377 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      0081C9 4F               [ 1]  378 	clr a 
      0081CA 90 5F            [ 1]  379 	clrw y 
      0081CC 91 A7 00 17      [ 1]  380 	ldf ([farptr],y),a
      0081D0 90 5C            [ 1]  381     incw y
      0081D2 91 A7 00 17      [ 1]  382 	ldf ([farptr],y),a
      0081D6 90 5C            [ 1]  383     incw y
      0081D8 91 A7 00 17      [ 1]  384 	ldf ([farptr],y),a
      0081DC 90 5C            [ 1]  385     incw y
      0081DE 91 A7 00 17      [ 1]  386 	ldf ([farptr],y),a
      0081E2 72 05 50 5F FB   [ 2]  387 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081E7 81               [ 4]  388 	ret
      0081E8                        389 row_erase_end:
                                    390 
                                    391 ; copy erase_start in RAM 
      0081E8                        392 move_erase_to_ram:
      0081E8 AE 81 E8         [ 2]  393 	ldw x,#row_erase_end 
      0081EB 1D 81 C1         [ 2]  394 	subw x,#row_erase
      0081EE CF 00 0D         [ 2]  395 	ldw acc16,x 
      0081F1 AE 16 90         [ 2]  396 	ldw x,#tib 
      0081F4 90 AE 81 C1      [ 2]  397 	ldw y,#row_erase 
      0081F8 CD 84 DE         [ 4]  398 	call move 
      0081FB 81               [ 4]  399 	ret 
                                    400 
                                    401 ;-----------------------------------
                                    402 ; block programming must be 
                                    403 ; executed from RAM 
                                    404 ; initial contidions: 
                                    405 ; 	memory unlocked
                                    406 ;   bit PRG set in 
                                    407 ; input:
                                    408 ;   x        128 bytes row to program 
                                    409 ;   farptr   row address 
                                    410 ; output:
                                    411 ;   none 
                                    412 ;----------------------------------
                           000001   413 	BCNT=1 
      0081FC                        414 program_row:
      0081FC 4B 80            [ 1]  415 	push #BLOCK_SIZE  
                                    416 ;enable block programming 
      0081FE 72 10 50 5B      [ 1]  417 	bset FLASH_CR2,#FLASH_CR2_PRG 
      008202 72 11 50 5C      [ 1]  418 	bres FLASH_NCR2,#FLASH_CR2_PRG
      008206 90 5F            [ 1]  419 	clrw y 
      008208 F6               [ 1]  420 1$:	ld a,(x)
      008209 91 A7 00 17      [ 1]  421 	ldf ([farptr],y),a
      00820D 5C               [ 1]  422 	incw x 
      00820E 90 5C            [ 1]  423 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      008210 0A 01            [ 1]  424 	dec (BCNT,sp)
      008212 26 F4            [ 1]  425 	jrne 1$
                                    426 ; wait EOP bit 
      008214 72 05 50 5F FB   [ 2]  427 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      000199                        428 	_drop 1 
      008219 5B 01            [ 2]    1     addw sp,#1 
      00821B 81               [ 4]  429 	ret 
      00821C                        430 program_row_end:
                                    431 
                                    432 ;-------------------------
                                    433 ; move program_row to RAM 
                                    434 ; at txtubound address 
                                    435 ;------------------------
      00821C                        436 move_prg_to_ram:
      00821C AE 82 1C         [ 2]  437 	ldw x,#program_row_end 
      00821F 1D 81 FC         [ 2]  438 	subw x,#program_row 
      008222 CF 00 0D         [ 2]  439 	ldw acc16,x 
      008225 AE 16 90         [ 2]  440 	ldw x,#tib 
      008228 90 AE 81 FC      [ 2]  441 	ldw y,#program_row 
      00822C CD 84 DE         [ 4]  442 	call move 
      00822F 81               [ 4]  443 	ret 
                                    444 
                                    445 
                                    446 ;-----------------------------
                                    447 ; write a row in FLASH/EEPROM 
                                    448 ; input:
                                    449 ;    farptr   destination address 
                                    450 ;    x        source address 
                                    451 ;-----------------------------
      008230                        452 write_row:
      008230 89               [ 2]  453 	pushw x 
      008231 72 5D 00 17      [ 1]  454 	tnz farptr 
      008235 26 1C            [ 1]  455 	jrne to_flash 
      008237 AE 80 00         [ 2]  456 	ldw x,#FLASH_BASE 
      00823A C3 00 18         [ 2]  457 	cpw x,farptr+1 
      00823D 24 14            [ 1]  458 	jruge to_flash 
      00823F                        459 to_eeprom:
      00823F AE 40 00         [ 2]  460 	ldw x,#EEPROM_BASE 
      008242 C3 00 18         [ 2]  461 	cpw x,farptr+1 
      008245 24 01            [ 1]  462 	jruge 1$
      008247 81               [ 4]  463 	ret ; bad address 
      008248 AE 47 FF         [ 2]  464 1$: ldw x,#EEPROM_END 
      00824B 23 01            [ 2]  465 	jrule 2$ 
      00824D 81               [ 4]  466 	ret ; bad address 
      00824E CD 81 95         [ 4]  467 2$:	call unlock_eeprom
      008251 20 03            [ 2]  468 	jra do_programming
      008253                        469 to_flash:
      008253 CD 81 AB         [ 4]  470 	call unlock_flash 
      008256                        471 do_programming:
      008256 85               [ 2]  472 	popw x 
      008257 CD 16 90         [ 4]  473 	call tib
      00825A 72 13 50 5F      [ 1]  474 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      00825E 72 17 50 5F      [ 1]  475 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008262 81               [ 4]  476 	ret 
                                    477 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    478 
                                    479 ;-----------------------------------
                                    480 ; erase flash or EEPROM block
                                    481 ; a blow is 128 bytes 
                                    482 ; input:
                                    483 ;   farptr  address row begin
                                    484 ; output:
                                    485 ;   none
                                    486 ;--------------------------------------
      008263                        487 block_erase:
      008263 CE 00 18         [ 2]  488 	ldw x,farptr+1
      008266 A3 A2 80         [ 2]  489 	cpw x,#user_space 
      008269 2A 17            [ 1]  490 	jrpl erase_flash 
                                    491 ; erase eeprom block
      00826B A3 40 00         [ 2]  492 	cpw x,#EEPROM_BASE 
      00826E 24 01            [ 1]  493 	jruge 1$
      008270 81               [ 4]  494 	ret ; bad address 
      008271 AE 47 FF         [ 2]  495 1$: ldw x,#EEPROM_END 
      008274 23 01            [ 2]  496 	jrule 2$ 
      008276 81               [ 4]  497 	ret ; bad address 
      008277 CD 81 95         [ 4]  498 2$:	call unlock_eeprom 
      00827A CD 16 90         [ 4]  499 	call tib 
      00827D 72 17 50 5F      [ 1]  500 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008281 81               [ 4]  501 	ret 
                                    502 ; erase flash block:
      008282                        503 erase_flash:
      008282 CD 81 AB         [ 4]  504 	call unlock_flash 
      008285 CD 16 90         [ 4]  505 	call tib 
      008288 72 13 50 5F      [ 1]  506     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00828C 81               [ 4]  507 	ret 
                                    508 
                                    509 
                                    510 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    511 ; write a byte to FLASH or EEPROM/OPTION  
                                    512 ; input:
                                    513 ;    a  		byte to write
                                    514 ;    farptr  	address
                                    515 ;    x          farptr[x]
                                    516 ; output:
                                    517 ;    none
                                    518 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    519 	; variables locales
                           000001   520 	BTW = 1   ; byte to write offset on stack
                           000002   521 	OPT = 2   ; OPTION flag offset on stack
                           000002   522 	VSIZE = 2
      00828D                        523 write_byte:
      00828D 90 89            [ 2]  524 	pushw y
      00020F                        525 	_vars VSIZE
      00828F 52 02            [ 2]    1     sub sp,#VSIZE 
      008291 6B 01            [ 1]  526 	ld (BTW,sp),a ; byte to write 
      008293 0F 02            [ 1]  527 	clr (OPT,sp)  ; OPTION flag
                                    528 ; put addr[15:0] in Y, for bounds check.
      008295 90 CE 00 18      [ 2]  529 	ldw y,farptr+1   ; Y=addr15:0
                                    530 ; check addr[23:16], if <> 0 then it is extened flash memory
      008299 72 5D 00 17      [ 1]  531 	tnz farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      00829D 26 14            [ 1]  532 	jrne write_flash
      00829F 90 A3 A2 80      [ 2]  533     cpw y,#user_space
      0082A3 24 0E            [ 1]  534     jruge write_flash
      0082A5 90 A3 40 00      [ 2]  535 	cpw y,#EEPROM_BASE  
      0082A9 25 52            [ 1]  536     jrult write_exit
      0082AB 90 A3 48 7F      [ 2]  537 	cpw y,#OPTION_END 
      0082AF 22 4C            [ 1]  538 	jrugt write_exit
      0082B1 20 16            [ 2]  539 	jra write_eeprom 
                                    540 ; write program memory
      0082B3                        541 write_flash:
      0082B3 CD 81 AB         [ 4]  542 	call unlock_flash 
      0082B6 9B               [ 1]  543 1$:	sim 
      0082B7 7B 01            [ 1]  544 	ld a,(BTW,sp)
      0082B9 92 A7 00 17      [ 4]  545 	ldf ([farptr],x),a ; farptr[x]=A
      0082BD 72 05 50 5F FB   [ 2]  546 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082C2 9A               [ 1]  547     rim 
      0082C3 72 13 50 5F      [ 1]  548     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0082C7 20 34            [ 2]  549     jra write_exit
                                    550 ; write eeprom and option
      0082C9                        551 write_eeprom:
      0082C9 CD 81 95         [ 4]  552 	call unlock_eeprom
                                    553 	; check for data eeprom or option eeprom
      0082CC 90 A3 48 00      [ 2]  554 	cpw y,#OPTION_BASE
      0082D0 2B 08            [ 1]  555 	jrmi 1$
      0082D2 90 A3 48 80      [ 2]  556 	cpw y,#OPTION_END+1
      0082D6 2A 02            [ 1]  557 	jrpl 1$
      0082D8 03 02            [ 1]  558 	cpl (OPT,sp)
      0082DA                        559 1$: 
      0082DA 0D 02            [ 1]  560     tnz (OPT,sp)
      0082DC 27 08            [ 1]  561     jreq 2$
                                    562 	; pour modifier une option il faut modifier ces 2 bits
      0082DE 72 1E 50 5B      [ 1]  563     bset FLASH_CR2,#FLASH_CR2_OPT
      0082E2 72 1F 50 5C      [ 1]  564     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0082E6                        565 2$: 
      0082E6 7B 01            [ 1]  566     ld a,(BTW,sp)
      0082E8 92 A7 00 17      [ 4]  567     ldf ([farptr],x),a
      0082EC 0D 02            [ 1]  568     tnz (OPT,sp)
      0082EE 27 08            [ 1]  569     jreq 3$
      0082F0 5C               [ 1]  570     incw x
      0082F1 7B 01            [ 1]  571     ld a,(BTW,sp)
      0082F3 43               [ 1]  572     cpl a
      0082F4 92 A7 00 17      [ 4]  573     ldf ([farptr],x),a
      0082F8 72 05 50 5F FB   [ 2]  574 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082FD                        575 write_exit:
      00027D                        576 	_drop VSIZE 
      0082FD 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082FF 90 85            [ 2]  577 	popw y
      008301 81               [ 4]  578     ret
                                    579 
                                    580 ;--------------------------------------------
                                    581 ; write a data block to eeprom or flash 
                                    582 ; input:
                                    583 ;   Y        source address   
                                    584 ;   X        array index  destination  farptr[x]
                                    585 ;   BSIZE    block size bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    586 ;   farptr   write address , byte* 
                                    587 ; output:
                                    588 ;	X 		after last byte written 
                                    589 ;   Y 		after last byte read 
                                    590 ;  farptr   point after block
                                    591 ;---------------------------------------------
      008302                        592 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000282                        593 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    594 	; local var 
                           000001   595 	XSAVE=1 
                           000002   596 	VSIZE=2 
      000282                        597 write_block:
      000282                        598 	_vars VSIZE
      008302 52 02            [ 2]    1     sub sp,#VSIZE 
      008304 1F 01            [ 2]  599 	ldw (XSAVE,sp),x 
      008306 1E 05            [ 2]  600 	ldw x,(BSIZE,sp) 
      008308 27 13            [ 1]  601 	jreq 9$
      00830A 1E 01            [ 2]  602 1$:	ldw x,(XSAVE,sp)
      00830C 90 F6            [ 1]  603 	ld a,(y)
      00830E CD 82 8D         [ 4]  604 	call write_byte 
      008311 5C               [ 1]  605 	incw x 
      008312 90 5C            [ 1]  606 	incw y 
      008314 1F 01            [ 2]  607 	ldw (XSAVE,sp),x
      008316 1E 05            [ 2]  608 	ldw x,(BSIZE,sp)
      008318 5A               [ 2]  609 	decw x
      008319 1F 05            [ 2]  610 	ldw (BSIZE,sp),x 
      00831B 26 ED            [ 1]  611 	jrne 1$
      00831D                        612 9$:
      00831D 1E 01            [ 2]  613 	ldw x,(XSAVE,sp)
      00831F CD 94 AA         [ 4]  614 	call incr_farptr
      0002A2                        615 	_drop VSIZE
      008322 5B 02            [ 2]    1     addw sp,#VSIZE 
      008324 81               [ 4]  616 	ret 
                                    617 
                                    618 
                                    619 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    620 ;;   UART1 subroutines
                                    621 ;;   used for user interface 
                                    622 ;;   communication channel.
                                    623 ;;   settings: 
                                    624 ;;		115200 8N1 no flow control
                                    625 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    626 
                                    627 ;--------------------------------
                                    628 ; initialize UART3, 115200 8N1 
                                    629 ;--------------------------------
      008325                        630 uart3_init: 
      008325 72 1A 50 11      [ 1]  631 	bset PD_DDR,#UART3_TX_PIN
      008329 72 1A 50 12      [ 1]  632 	bset PD_CR1,#UART3_TX_PIN 
      00832D 72 1A 50 13      [ 1]  633 	bset PD_CR2,#UART3_TX_PIN 
      008331 72 16 50 C7      [ 1]  634 	bset CLK_PCKENR1,#CLK_PCKENR1_UART3
      008335                        635 uart3_set_baud: 
                                    636 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    637 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008335 A6 E1            [ 1]  638 	ld a,#CLK_SWR_HSI
      008337 C1 50 C3         [ 1]  639 	cp a,CLK_CMSR 
      00833A 27 0A            [ 1]  640 	jreq 2$ 
      00833C                        641 1$: ; 8 Mhz 	
      00833C 35 05 52 43      [ 1]  642 	mov UART3_BRR2,#0x05 ; must be loaded first
      008340 35 04 52 42      [ 1]  643 	mov UART3_BRR1,#0x4
      008344 20 08            [ 2]  644 	jra 3$
      008346                        645 2$: ; 16 Mhz 	
      008346 35 0B 52 43      [ 1]  646 	mov UART3_BRR2,#0x0b ; must be loaded first
      00834A 35 08 52 42      [ 1]  647 	mov UART3_BRR1,#0x08
      00834E                        648 3$:
      00834E 72 5F 52 41      [ 1]  649     clr UART3_DR
      008352 35 2C 52 45      [ 1]  650 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008356 72 10 52 45      [ 1]  651 	bset UART3_CR2,#UART_CR2_SBK
      00835A 72 0D 52 40 FB   [ 2]  652     btjf UART3_SR,#UART_SR_TC,.
      00835F 72 5F 00 39      [ 1]  653 	clr rx3_tail 
      008363 72 5F 00 38      [ 1]  654 	clr rx3_head 
      008367 81               [ 4]  655 	ret 
                                    656 
                                    657 ;---------------------------------------------
                                    658 ; initialize UART1, 115200 8N1
                                    659 ; input:
                                    660 ;	none
                                    661 ; output:
                                    662 ;   none
                                    663 ;---------------------------------------------
      008368                        664 uart1_init:
      008368 72 1A 50 02      [ 1]  665     bset PA_DDR,#UART1_TX_PIN
      00836C 72 1A 50 03      [ 1]  666     bset PA_CR1,#UART1_TX_PIN 
      008370 72 1A 50 04      [ 1]  667     bset PA_CR2,#UART1_TX_PIN 
                                    668 ; enable UART1 clock
      008374 72 14 50 C7      [ 1]  669 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008378                        670 uart1_set_baud: 
                                    671 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    672 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008378 A6 E1            [ 1]  673 	ld a,#CLK_SWR_HSI
      00837A C1 50 C3         [ 1]  674 	cp a,CLK_CMSR 
      00837D 27 0A            [ 1]  675 	jreq 2$ 
      00837F                        676 1$: ; 8 Mhz 	
      00837F 35 05 52 33      [ 1]  677 	mov UART1_BRR2,#0x05 ; must be loaded first
      008383 35 04 52 32      [ 1]  678 	mov UART1_BRR1,#0x4
      008387 20 08            [ 2]  679 	jra 3$
      008389                        680 2$: ; 16 Mhz 	
      008389 35 0B 52 33      [ 1]  681 	mov UART1_BRR2,#0x0b ; must be loaded first
      00838D 35 08 52 32      [ 1]  682 	mov UART1_BRR1,#0x08
      008391                        683 3$:
      008391 72 5F 52 31      [ 1]  684     clr UART1_DR
      008395 35 2C 52 35      [ 1]  685 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008399 72 10 52 35      [ 1]  686 	bset UART1_CR2,#UART_CR2_SBK
      00839D 72 0D 52 30 FB   [ 2]  687     btjf UART1_SR,#UART_SR_TC,.
      0083A2 72 5F 00 2E      [ 1]  688     clr rx1_head 
      0083A6 72 5F 00 2F      [ 1]  689 	clr rx1_tail 
      0083AA 81               [ 4]  690 	ret
                                    691 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    692 ;---------------------------------
                                    693 ; uart1_putc
                                    694 ; send a character via UART1
                                    695 ; input:
                                    696 ;    A  	character to send
                                    697 ;---------------------------------
      0083AB                        698 putc:: ; console output always on UART1
      0083AB                        699 uart1_putc:: 
      0083AB 72 0F 52 30 FB   [ 2]  700 	btjf UART1_SR,#UART_SR_TXE,.
      0083B0 C7 52 31         [ 1]  701 	ld UART1_DR,a 
      0083B3 81               [ 4]  702 	ret 
                                    703 
                                    704 ;---------------------------------
                                    705 ; uart3_putc 
                                    706 ; send a character via UART3 
                                    707 ; input:
                                    708 ;    A  	character to send
                                    709 ;---------------------------------
      0083B4                        710 uart3_putc::
      0083B4 72 0F 52 40 FB   [ 2]  711 	btjf UART3_SR,#UART_SR_TXE,.
      0083B9 C7 52 41         [ 1]  712 	ld UART3_DR,a 
      0083BC 81               [ 4]  713 	ret 
                                    714 
                                    715 ;---------------------------------
                                    716 ; Query for character in rx1_queue
                                    717 ; input:
                                    718 ;   none 
                                    719 ; output:
                                    720 ;   A     0 no charcter available
                                    721 ;   Z     1 no character available
                                    722 ;---------------------------------
      0083BD                        723 qgetc::
      0083BD                        724 uart1_qgetc::
      0083BD C6 00 2E         [ 1]  725 	ld a,rx1_head 
      0083C0 C0 00 2F         [ 1]  726 	sub a,rx1_tail 
      0083C3 81               [ 4]  727 	ret 
                                    728 
      0083C4                        729 uart3_qgetc::
      0083C4 C6 00 38         [ 1]  730 	ld a,rx3_head 
      0083C7 C0 00 39         [ 1]  731 	sub a,rx3_tail 
      0083CA 81               [ 4]  732 	ret 
                                    733 
                                    734 ;---------------------------------
                                    735 ; wait character from UART1 
                                    736 ; input:
                                    737 ;   none
                                    738 ; output:
                                    739 ;   A 			char  
                                    740 ;--------------------------------	
      0083CB                        741 getc:: ;console input
      0083CB                        742 uart1_getc::
      0083CB CD 83 BD         [ 4]  743 	call uart1_qgetc
      0083CE 27 FB            [ 1]  744 	jreq uart1_getc 
      0083D0 89               [ 2]  745 	pushw x 
      0083D1 AE 00 26         [ 2]  746 	ldw x,#rx1_queue
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083D4 9F               [ 1]  747 	ld a,xl 
      0083D5 CB 00 2E         [ 1]  748 	add a,rx1_head 
      0083D8 97               [ 1]  749 	ld xl,a 
      0083D9 F6               [ 1]  750 	ld a,(x)
      0083DA 85               [ 2]  751 	popw x
      0083DB 88               [ 1]  752 	push a
      0083DC 72 5C 00 2E      [ 1]  753 	inc rx1_head 
      0083E0 A6 07            [ 1]  754 	ld a,#RX_QUEUE_SIZE-1 
      0083E2 C4 00 2E         [ 1]  755 	and a,rx1_head 
      0083E5 C7 00 2E         [ 1]  756 	ld rx1_head,a 
      0083E8 84               [ 1]  757 	pop a  
      0083E9 81               [ 4]  758 	ret 
                                    759 
                                    760 ;----------------------------------
                                    761 ; wait character from UART3 
                                    762 ; output:
                                    763 ;   A       character received
                                    764 ;-----------------------------------
      0083EA                        765 uart3_getc::
      0083EA CD 83 C4         [ 4]  766 	call uart3_qgetc
      0083ED 27 FB            [ 1]  767 	jreq uart3_getc 
      0083EF 89               [ 2]  768 	pushw x 
      0083F0 AE 00 30         [ 2]  769 	ldw x,#rx3_queue
      0083F3 9F               [ 1]  770 	ld a,xl 
      0083F4 CB 00 38         [ 1]  771 	add a,rx3_head 
      0083F7 97               [ 1]  772 	ld xl,a 
      0083F8 F6               [ 1]  773 	ld a,(x)
      0083F9 85               [ 2]  774 	popw x
      0083FA 88               [ 1]  775 	push a
      0083FB 72 5C 00 38      [ 1]  776 	inc rx3_head 
      0083FF A6 07            [ 1]  777 	ld a,#RX_QUEUE_SIZE-1 
      008401 C4 00 38         [ 1]  778 	and a,rx3_head 
      008404 C7 00 38         [ 1]  779 	ld rx3_head,a 
      008407 84               [ 1]  780 	pop a  
      008408 81               [ 4]  781 	ret 
                                    782 
                                    783 
                                    784 ;----------------------
                                    785 ; print token id && value
                                    786 ; input:
                                    787 ;   A     token id 
                                    788 ;   X     token value 
                                    789 ;---------------------
                           000001   790 	BSAVE=1
                           000002   791 	AREG=2
                           000003   792 	XREG=3
                           000004   793 	VSIZE=4
      008409                        794 prt_tok:
      000389                        795 	_vars VSIZE 
      008409 52 04            [ 2]    1     sub sp,#VSIZE 
      00840B 6B 02            [ 1]  796 	ld (AREG,sp),a 
      00840D 1F 03            [ 2]  797 	ldw (XREG,sp),x 
      00840F C6 00 0B         [ 1]  798 	ld a, base
      008412 6B 01            [ 1]  799 	ld (BSAVE,sp),a 
      008414 35 10 00 0B      [ 1]  800 	mov base,#16  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      008418 AE 84 40         [ 2]  801 	ldw x,#token_msg
      00841B CD A2 C0         [ 4]  802 	call puts 
      00841E 5F               [ 1]  803 	clrw x 
      00841F 7B 02            [ 1]  804 	ld a,(AREG,sp)
      008421 97               [ 1]  805 	ld xl,a 
      008422 CD 89 8E         [ 4]  806 	call print_int 
      008425 A6 20            [ 1]  807 	ld a,#SPACE
      008427 CD 83 AB         [ 4]  808 	call putc 
      00842A 1E 03            [ 2]  809 	ldw x,(XREG,sp)
      00842C CD 89 8E         [ 4]  810 	call print_int 
      00842F A6 0D            [ 1]  811 	ld a,#CR 
      008431 CD 83 AB         [ 4]  812 	call putc 
      008434 7B 01            [ 1]  813 	ld a,(BSAVE,sp)
      008436 C7 00 0B         [ 1]  814 	ld base,a 
      008439 7B 02            [ 1]  815 	ld a,(AREG,sp)
      00843B 1E 03            [ 2]  816 	ldw x,(XREG,sp)
      0003BD                        817 	_drop VSIZE 
      00843D 5B 04            [ 2]    1     addw sp,#VSIZE 
      00843F 81               [ 4]  818 	ret 
      008440 74 6F 6B 65 6E 3A 20   819 token_msg: .asciz "token: "
             00
                                    820 
                                    821 
                                    822 ;---------------------
                                    823 ; display n bytes row 
                                    824 ; from memory.
                                    825 ; input:
                                    826 ;   A   bytes to print 
                                    827 ;	X   start address 
                                    828 ; output:
                                    829 ;   X   address after last shown  
                                    830 ;---------------------
                           000001   831 	CNT=1 
                           000002   832 	ADR=2 
                           000003   833 	VSIZE=3 
      008448                        834 show_row:
      008448 4D               [ 1]  835 	tnz a 
      008449 26 01            [ 1]  836 	jrne 1$
      00844B 81               [ 4]  837 	ret 
      00844C                        838 1$:	
      00844C 89               [ 2]  839 	pushw x  
      00844D 88               [ 1]  840 	push a 
      00844E 35 04 00 25      [ 1]  841 	mov tab_width,#4 
      008452 CD 89 8E         [ 4]  842 	call print_int 
      008455 A6 20            [ 1]  843 	ld a,#SPACE  
      008457 CD 83 AB         [ 4]  844 	call putc
      00845A                        845 row_loop:
      00845A 1E 02            [ 2]  846 	ldw x,(ADR,sp)
      00845C F6               [ 1]  847 	ld a,(x)
      00845D 5F               [ 1]  848 	clrw x 
      00845E 97               [ 1]  849 	ld xl,a 
      00845F CD 89 8E         [ 4]  850 	call print_int 
      008462 1E 02            [ 2]  851 	ldw x,(ADR,sp)
      008464 5C               [ 1]  852 	incw x 
      008465 1F 02            [ 2]  853 	ldw (ADR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008467 0A 01            [ 1]  854 	dec (CNT,sp)
      008469 26 EF            [ 1]  855 	jrne row_loop
      0003EB                        856 	_drop VSIZE  		
      00846B 5B 03            [ 2]    1     addw sp,#VSIZE 
      00846D 35 04 00 25      [ 1]  857 	mov tab_width,#4
      008471 A6 0D            [ 1]  858 	ld a,#CR 
      008473 CD 83 AB         [ 4]  859 	call putc 
      008476 81               [ 4]  860 	ret 
                                    861 
                                    862 ;--------------------------
                                    863 ; print memory content 
                                    864 ; in hexadecimal format
                                    865 ;  input:
                                    866 ;    X    start address 
                                    867 ;    Y    count 
                                    868 ;--------------------------
                           000001   869 	BCNT=1
                           000003   870 	BASE=3
                           000004   871 	TABW=4
                           000004   872 	VSIZE=4   
      008477                        873 hex_dump:
      0003F7                        874 	_vars VSIZE
      008477 52 04            [ 2]    1     sub sp,#VSIZE 
      008479 C6 00 0B         [ 1]  875 	ld a,base
      00847C 6B 03            [ 1]  876 	ld (BASE,sp),a 
      00847E 35 10 00 0B      [ 1]  877 	mov base,#16
      008482 C6 00 25         [ 1]  878 	ld a,tab_width 
      008485 6B 04            [ 1]  879 	ld (TABW,sp),a
      008487 A6 0D            [ 1]  880 	ld a,#CR 
      008489 CD 83 AB         [ 4]  881 	call putc 
      00848C 17 01            [ 2]  882 1$: ldw (BCNT,sp),y
      00848E A6 10            [ 1]  883 	ld a,#16
      008490 90 A3 00 10      [ 2]  884 	cpw y,#16
      008494 2A 02            [ 1]  885 	jrpl 2$
      008496 90 9F            [ 1]  886 	ld a,yl
      008498                        887 2$: 	
      008498 CD 84 48         [ 4]  888 	call show_row 
      00849B 16 01            [ 2]  889 	ldw y,(BCNT,sp) 
      00849D 72 A2 00 10      [ 2]  890 	subw y,#16 
      0084A1 90 A3 00 01      [ 2]  891 	cpw y,#1
      0084A5 2A E5            [ 1]  892 	jrpl 1$
      0084A7 7B 03            [ 1]  893 	ld a,(BASE,sp)
      0084A9 C7 00 0B         [ 1]  894 	ld base,a
      0084AC 7B 04            [ 1]  895 	ld a,(TABW,sp)
      0084AE C7 00 25         [ 1]  896 	ld tab_width,a 
      000431                        897 	_drop VSIZE
      0084B1 5B 04            [ 2]    1     addw sp,#VSIZE 
      0084B3 81               [ 4]  898 	ret 
                                    899 
                                    900 ;-------------------------------------
                                    901 ; retrun string length
                                    902 ; input:
                                    903 ;   X         .asciz  pointer 
                                    904 ; output:
                                    905 ;   X         not affected 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    906 ;   A         length 
                                    907 ;-------------------------------------
      0084B4                        908 strlen::
      0084B4 89               [ 2]  909 	pushw x 
      0084B5 4F               [ 1]  910 	clr a
      0084B6 7D               [ 1]  911 1$:	tnz (x) 
      0084B7 27 04            [ 1]  912 	jreq 9$ 
      0084B9 4C               [ 1]  913 	inc a 
      0084BA 5C               [ 1]  914 	incw x 
      0084BB 20 F9            [ 2]  915 	jra 1$ 
      0084BD 85               [ 2]  916 9$:	popw x 
      0084BE 81               [ 4]  917 	ret 
                                    918 
                                    919 ;------------------------------------
                                    920 ; compare 2 strings
                                    921 ; input:
                                    922 ;   X 		char* first string 
                                    923 ;   Y       char* second string 
                                    924 ; output:
                                    925 ;   A 		0|1 
                                    926 ;-------------------------------------
      0084BF                        927 strcmp:
      0084BF F6               [ 1]  928 	ld a,(x)
      0084C0 27 0B            [ 1]  929 	jreq 5$ 
      0084C2 90 F1            [ 1]  930 	cp a,(y) 
      0084C4 26 05            [ 1]  931 	jrne 4$ 
      0084C6 5C               [ 1]  932 	incw x 
      0084C7 90 5C            [ 1]  933 	incw y 
      0084C9 20 F4            [ 2]  934 	jra strcmp 
      0084CB                        935 4$: ; not same  
      0084CB 4F               [ 1]  936 	clr a 
      0084CC 81               [ 4]  937 	ret 
      0084CD                        938 5$: ; same 
      0084CD A6 01            [ 1]  939 	ld a,#1 
      0084CF 81               [ 4]  940 	ret 
                                    941 
                                    942 
                                    943 ;---------------------------------------
                                    944 ;  copy src to dest 
                                    945 ; input:
                                    946 ;   X 		dest 
                                    947 ;   Y 		src 
                                    948 ; output: 
                                    949 ;   X 		dest 
                                    950 ;----------------------------------
      0084D0                        951 strcpy::
      0084D0 89               [ 2]  952 	pushw x 
      0084D1 90 F6            [ 1]  953 1$: ld a,(y)
      0084D3 27 06            [ 1]  954 	jreq 9$ 
      0084D5 F7               [ 1]  955 	ld (x),a 
      0084D6 5C               [ 1]  956 	incw x 
      0084D7 90 5C            [ 1]  957 	incw y 
      0084D9 20 F6            [ 2]  958 	jra 1$ 
      0084DB 7F               [ 1]  959 9$:	clr (x)
      0084DC 85               [ 2]  960 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084DD 81               [ 4]  961 	ret 
                                    962 
                                    963 ;---------------------------------------
                                    964 ; move memory block 
                                    965 ; input:
                                    966 ;   X 		destination 
                                    967 ;   Y 	    source 
                                    968 ;   acc16	bytes count 
                                    969 ; output:
                                    970 ;   none 
                                    971 ;--------------------------------------
                           000001   972 	INCR=1 ; increament high byte 
                           000002   973 	LB=2 ; increament low byte 
                           000002   974 	VSIZE=2
      0084DE                        975 move::
      00045E                        976 	_vars VSIZE 
      0084DE 52 02            [ 2]    1     sub sp,#VSIZE 
      0084E0 0F 01            [ 1]  977 	clr (INCR,sp)
      0084E2 0F 02            [ 1]  978 	clr (LB,sp)
      0084E4 90 89            [ 2]  979 	pushw y 
      0084E6 13 01            [ 2]  980 	cpw x,(1,sp) ; compare DEST to SRC 
      0084E8 90 85            [ 2]  981 	popw y 
      0084EA 27 31            [ 1]  982 	jreq move_exit ; x==y 
      0084EC 2B 0E            [ 1]  983 	jrmi move_down
      0084EE                        984 move_up: ; start from top address with incr=-1
      0084EE 72 BB 00 0D      [ 2]  985 	addw x,acc16
      0084F2 72 B9 00 0D      [ 2]  986 	addw y,acc16
      0084F6 03 01            [ 1]  987 	cpl (INCR,sp)
      0084F8 03 02            [ 1]  988 	cpl (LB,sp)   ; increment = -1 
      0084FA 20 05            [ 2]  989 	jra move_loop  
      0084FC                        990 move_down: ; start from bottom address with incr=1 
      0084FC 5A               [ 2]  991     decw x 
      0084FD 90 5A            [ 2]  992 	decw y
      0084FF 0C 02            [ 1]  993 	inc (LB,sp) ; incr=1 
      008501                        994 move_loop:	
      008501 C6 00 0D         [ 1]  995     ld a, acc16 
      008504 CA 00 0E         [ 1]  996 	or a, acc8
      008507 27 14            [ 1]  997 	jreq move_exit 
      008509 72 FB 01         [ 2]  998 	addw x,(INCR,sp)
      00850C 72 F9 01         [ 2]  999 	addw y,(INCR,sp) 
      00850F 90 F6            [ 1] 1000 	ld a,(y)
      008511 F7               [ 1] 1001 	ld (x),a 
      008512 89               [ 2] 1002 	pushw x 
      008513 CE 00 0D         [ 2] 1003 	ldw x,acc16 
      008516 5A               [ 2] 1004 	decw x 
      008517 CF 00 0D         [ 2] 1005 	ldw acc16,x 
      00851A 85               [ 2] 1006 	popw x 
      00851B 20 E4            [ 2] 1007 	jra move_loop
      00851D                       1008 move_exit:
      00049D                       1009 	_drop VSIZE
      00851D 5B 02            [ 2]    1     addw sp,#VSIZE 
      00851F 81               [ 4] 1010 	ret 	
                                   1011 
                                   1012 ;------------------------------------
                                   1013 ;  set all variables to zero 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1014 ; input:
                                   1015 ;   none 
                                   1016 ; output:
                                   1017 ;	none
                                   1018 ;------------------------------------
      008520                       1019 clear_vars:
      008520 AE 00 3A         [ 2] 1020 	ldw x,#vars 
      008523 90 AE 00 34      [ 2] 1021 	ldw y,#2*26 
      008527 7F               [ 1] 1022 1$:	clr (x)
      008528 5C               [ 1] 1023 	incw x 
      008529 90 5A            [ 2] 1024 	decw y 
      00852B 26 FA            [ 1] 1025 	jrne 1$
      00852D 81               [ 4] 1026 	ret 
                                   1027 
                                   1028 ;-------------------------------------
                                   1029 ; check if A is a letter 
                                   1030 ; input:
                                   1031 ;   A 			character to test 
                                   1032 ; output:
                                   1033 ;   C flag      1 true, 0 false 
                                   1034 ;-------------------------------------
      00852E                       1035 is_alpha::
      00852E A1 41            [ 1] 1036 	cp a,#'A 
      008530 8C               [ 1] 1037 	ccf 
      008531 24 0B            [ 1] 1038 	jrnc 9$ 
      008533 A1 5B            [ 1] 1039 	cp a,#'Z+1 
      008535 25 07            [ 1] 1040 	jrc 9$ 
      008537 A1 61            [ 1] 1041 	cp a,#'a 
      008539 8C               [ 1] 1042 	ccf 
      00853A 24 02            [ 1] 1043 	jrnc 9$
      00853C A1 7B            [ 1] 1044 	cp a,#'z+1
      00853E 81               [ 4] 1045 9$: ret 	
                                   1046 
                                   1047 ;------------------------------------
                                   1048 ; check if character in {'0'..'9'}
                                   1049 ; input:
                                   1050 ;    A  character to test
                                   1051 ; output:
                                   1052 ;    Carry  0 not digit | 1 digit
                                   1053 ;------------------------------------
      00853F                       1054 is_digit::
      00853F A1 30            [ 1] 1055 	cp a,#'0
      008541 25 03            [ 1] 1056 	jrc 1$
      008543 A1 3A            [ 1] 1057     cp a,#'9+1
      008545 8C               [ 1] 1058 	ccf 
      008546 8C               [ 1] 1059 1$:	ccf 
      008547 81               [ 4] 1060     ret
                                   1061 
                                   1062 ;-------------------------------------
                                   1063 ; return true if character in  A 
                                   1064 ; is letter or digit.
                                   1065 ; input:
                                   1066 ;   A     ASCII character 
                                   1067 ; output:
                                   1068 ;   A     no change 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1069 ;   Carry    0 false| 1 true 
                                   1070 ;--------------------------------------
      008548                       1071 is_alnum::
      008548 CD 85 3F         [ 4] 1072 	call is_digit
      00854B 25 03            [ 1] 1073 	jrc 1$ 
      00854D CD 85 2E         [ 4] 1074 	call is_alpha
      008550 81               [ 4] 1075 1$:	ret 
                                   1076 
                                   1077 
                                   1078 ;-------------------------------------
                                   1079 ;  program initialization entry point 
                                   1080 ;-------------------------------------
                           000001  1081 	MAJOR=1
                           000000  1082 	MINOR=0
      008551 0A 0A 54 69 6E 79 20  1083 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      008597                       1084 cold_start:
                                   1085 ;set stack 
      008597 AE 17 FF         [ 2] 1086 	ldw x,#STACK_EMPTY
      00859A 94               [ 1] 1087 	ldw sp,x   
                                   1088 ; clear all ram 
      00859B 7F               [ 1] 1089 0$: clr (x)
      00859C 5A               [ 2] 1090 	decw x 
      00859D 26 FC            [ 1] 1091 	jrne 0$
                                   1092 ; activate pull up on all inputs 
      00859F A6 FF            [ 1] 1093 	ld a,#255 
      0085A1 C7 50 03         [ 1] 1094 	ld PA_CR1,a 
      0085A4 C7 50 08         [ 1] 1095 	ld PB_CR1,a 
      0085A7 C7 50 0D         [ 1] 1096 	ld PC_CR1,a 
      0085AA C7 50 12         [ 1] 1097 	ld PD_CR1,a 
      0085AD C7 50 17         [ 1] 1098 	ld PE_CR1,a 
      0085B0 C7 50 1C         [ 1] 1099 	ld PF_CR1,a 
      0085B3 C7 50 21         [ 1] 1100 	ld PG_CR1,a 
      0085B6 C7 50 2B         [ 1] 1101 	ld PI_CR1,a
                                   1102 ; set LD2 pin as output 
      0085B9 72 1A 50 0D      [ 1] 1103     bset PC_CR1,#LED2_BIT
      0085BD 72 1A 50 0E      [ 1] 1104     bset PC_CR2,#LED2_BIT
      0085C1 72 1A 50 0C      [ 1] 1105     bset PC_DDR,#LED2_BIT
      0085C5 72 1B 50 0A      [ 1] 1106 	bres PC_ODR,#LED2_BIT 
                                   1107 ; disable schmitt triggers on Arduino CN4 analog inputs
      0085C9 55 00 3F 54 07   [ 1] 1108 	mov ADC_TDRL,0x3f
                                   1109 ; disable peripherals clocks
                                   1110 ;	clr CLK_PCKENR1 
                                   1111 ;	clr CLK_PCKENR2
      0085CE 72 5F 50 F2      [ 1] 1112 	clr AWU_TBR 
      0085D2 72 14 50 CA      [ 1] 1113 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1114 ; select internal clock no divisor: 16 Mhz 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0085D6 A6 E1            [ 1] 1115 	ld a,#CLK_SWR_HSI 
      0085D8 5F               [ 1] 1116 	clrw x  
      0085D9 CD 81 5D         [ 4] 1117     call clock_init 
      0085DC CD 81 80         [ 4] 1118 	call timer4_init
      0085DF CD 81 73         [ 4] 1119 	call timer2_init
                                   1120 ; UART1 at 115200 BAUD
      0085E2 CD 83 68         [ 4] 1121 	call uart1_init
                                   1122 ; UART3 at 115200 BAUD 
      0085E5 CD 83 25         [ 4] 1123 	call uart3_init	
                                   1124 ; activate PE_4 (user button interrupt)
      0085E8 72 18 50 18      [ 1] 1125     bset PE_CR2,#USR_BTN_BIT 
                                   1126 ; display system information
      0085EC AE 85 51         [ 2] 1127 	ldw x,#software 
      0085EF CD A2 C0         [ 4] 1128 	call puts 
      0085F2 A6 01            [ 1] 1129 	ld a,#MAJOR 
      0085F4 C7 00 0E         [ 1] 1130 	ld acc8,a 
      0085F7 5F               [ 1] 1131 	clrw x 
      0085F8 CF 00 0C         [ 2] 1132 	ldw acc24,x
      0085FB 72 5F 00 25      [ 1] 1133 	clr tab_width  
      0085FF 35 0A 00 0B      [ 1] 1134 	mov base, #10 
      008603 CD 89 9E         [ 4] 1135 	call prti24 
      008606 A6 2E            [ 1] 1136 	ld a,#'.
      008608 CD 83 AB         [ 4] 1137 	call putc 
      00860B A6 00            [ 1] 1138 	ld a,#MINOR 
      00860D C7 00 0E         [ 1] 1139 	ld acc8,a 
      008610 5F               [ 1] 1140 	clrw x 
      008611 CF 00 0C         [ 2] 1141 	ldw acc24,x 
      008614 CD 89 9E         [ 4] 1142 	call prti24
      008617 A6 0D            [ 1] 1143 	ld a,#CR 
      008619 CD 83 AB         [ 4] 1144 	call putc
      00861C CD 94 B8         [ 4] 1145 	call seek_fdrive 
      00861F 9A               [ 1] 1146 	rim 
      008620 72 5C 00 16      [ 1] 1147 	inc seedy+1 
      008624 72 5C 00 14      [ 1] 1148 	inc seedx+1 
      008628 CD 86 A5         [ 4] 1149 	call clear_basic
      00862B CD 8E DB         [ 4] 1150 	call ubound 
      00862E CD 93 06         [ 4] 1151 	call beep_1khz  
      008631                       1152 2$:	
      008631 CD 86 3A         [ 4] 1153 	call warm_init
      008634 CD 86 67         [ 4] 1154 	call load_autorun
      008637 CC 88 C5         [ 2] 1155     jp cmd_line  
                                   1156 
      00863A                       1157 warm_init:
      00863A 72 5F 00 24      [ 1] 1158 	clr flags 
      00863E 72 5F 00 21      [ 1] 1159 	clr loop_depth 
      008642 35 04 00 25      [ 1] 1160 	mov tab_width,#TAB_WIDTH 
      008646 35 0A 00 0B      [ 1] 1161 	mov base,#10 
      00864A AE 00 00         [ 2] 1162 	ldw x,#0 
      00864D CF 00 05         [ 2] 1163 	ldw basicptr,x 
      008650 CF 00 01         [ 2] 1164 	ldw in.w,x 
      008653 72 5F 00 04      [ 1] 1165 	clr count
      008657 81               [ 4] 1166 	ret 
                                   1167 
                                   1168 ;--------------------------
                                   1169 ; called by tb_error when
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1170 ; flag FAUTORUN is set.
                                   1171 ; There is a bug in autorun 
                                   1172 ; program so cancel it.
                                   1173 ;---------------------------
      008658                       1174 cancel_autorun:
      008658 AE 40 00         [ 2] 1175 	ldw x,#AUTORUN_NAME 
      00865B CF 00 18         [ 2] 1176 	ldw farptr+1,x 
      00865E 4F               [ 1] 1177 	clr a
      00865F 5F               [ 1] 1178 	clrw x  
      008660 C7 00 17         [ 1] 1179 	ld farptr,a 
      008663 CD 82 8D         [ 4] 1180 	call write_byte 
      008666 81               [ 4] 1181 	ret 
                                   1182 
                                   1183 
                                   1184 ;--------------------------
                                   1185 ; if autorun file defined 
                                   1186 ; in eeprom address AUTORUN_NAME 
                                   1187 ; load and run it.
                                   1188 ;-------------------------
      008667                       1189 load_autorun:
      008667 90 AE 40 00      [ 2] 1190 	ldw y,#AUTORUN_NAME
      00866B 90 F6            [ 1] 1191 	ld a,(y)
      00866D 27 20            [ 1] 1192 	jreq 9$
      00866F CD 95 1E         [ 4] 1193 	call search_file
      008672 25 05            [ 1] 1194 	jrc 2$ 
                                   1195 ; if file doesn't exit
      008674 CD 86 58         [ 4] 1196 	call cancel_autorun
      008677 20 16            [ 2] 1197 	jra 9$ 
      008679 CD 96 39         [ 4] 1198 2$:	call load_file
      00867C AE 40 00         [ 2] 1199 	ldw x,#AUTORUN_NAME 
      00867F CD A2 C0         [ 4] 1200 	call puts
      008682 AE 86 90         [ 2] 1201 	ldw x,#autorun_msg 
      008685 CD A2 C0         [ 4] 1202 	call puts 
      008688 72 1C 00 24      [ 1] 1203 	bset flags,#FAUTORUN 
      00868C CC 92 D8         [ 2] 1204 	jp run_it    
      00868F 81               [ 4] 1205 9$: ret 	
                                   1206 
      008690 20 6C 6F 61 64 65 64  1207 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1208 ;---------------------------
                                   1209 ; reset BASIC text variables 
                                   1210 ; and clear variables 
                                   1211 ;---------------------------
      0086A5                       1212 clear_basic:
      0086A5 72 5F 00 04      [ 1] 1213 	clr count
      0086A9 72 5F 00 02      [ 1] 1214 	clr in  
      0086AD AE 00 6E         [ 2] 1215 	ldw x,#free_ram 
      0086B0 CF 00 1D         [ 2] 1216 	ldw txtbgn,x 
      0086B3 CF 00 1F         [ 2] 1217 	ldw txtend,x 
      0086B6 CD 85 20         [ 4] 1218 	call clear_vars 
      0086B9 81               [ 4] 1219 	ret 
                                   1220 
                                   1221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1222 ;;   Tiny BASIC error messages     ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1223 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0086BA                       1224 err_msg:
      0086BA 00 00 86 DA 86 E7 86  1225 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             F5 87 0E 87 1D
      0086C6 87 33 87 49 87 63 87  1226 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             74 87 85
      0086D0 87 91 87 C4 87 D4 87  1227 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             E8 87 FB
                                   1228 
      0086DA 4D 65 6D 6F 72 79 20  1229 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      0086E7 73 79 6E 74 61 78 20  1230 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      0086F5 6D 61 74 68 20 6F 70  1231 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      00870E 64 69 76 69 73 69 6F  1232 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      00871D 69 6E 76 61 6C 69 64  1233 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      008733 72 75 6E 20 74 69 6D  1234 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      008749 63 6F 6D 6D 61 6E 64  1235 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      008763 64 75 70 6C 69 63 61  1236 err_duplicate: .asciz "duplicate name.\n"
             74 65 20 6E 61 6D 65
             2E 0A 00
      008774 46 69 6C 65 20 6E 6F  1237 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      008785 62 61 64 20 76 61 6C  1238 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      008791 46 69 6C 65 20 69 6E  1239 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      0087C4 4E 6F 20 64 61 74 61  1240 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      0087D4 4E 6F 20 70 72 6F 67  1241 err_no_prog: .asciz "No program in RAM!\n"
             72 61 6D 20 69 6E 20
             52 41 4D 21 0A 00
      0087E8 46 69 6C 65 20 73 79  1242 err_no_fspace: .asciz "File system full.\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal  73-Bits]



             73 74 65 6D 20 66 75
             6C 6C 2E 0A 00
      0087F0 74 65 6D 20 66 75 6C  1243 err_buf_full: .asciz "Buffer full\n"
             6C 2E 0A 00 42 75
                                   1244 
      0087FD 66 66 65 72 20 66 75  1245 rt_msg: .asciz "\nrun time error, "
             6C 6C 0A 00 0A 72 75
             6E 20 74 69
      00880F 6D 65 20 65 72 72 6F  1246 comp_msg: .asciz "\ncompile error, "
             72 2C 20 00 0A 63 6F
             6D 70 69
      008820 6C 65 20 65 72 72 6F  1247 tk_id: .asciz "last token id: "
             72 2C 20 00 6C 61 73
             74 20
                                   1248 
      0007BB                       1249 syntax_error::
      008830 74 6F            [ 1] 1250 	ld a,#ERR_SYNTAX 
                                   1251 
      0007BD                       1252 tb_error::
      008832 6B 65 6E 20 69   [ 2] 1253 	btjt flags,#FCOMP,1$
      008837 64               [ 1] 1254 	push a 
      008838 3A 20 00         [ 2] 1255 	ldw x, #rt_msg 
      00883B CD 00 00         [ 4] 1256 	call puts 
      00883B A6               [ 1] 1257 	pop a 
      00883C 02 06 3A         [ 2] 1258 	ldw x, #err_msg 
      00883D 72 5F 00 0C      [ 1] 1259 	clr acc16 
      00883D 72               [ 1] 1260 	sll a
      00883E 0A 00 24 47      [ 1] 1261 	rlc acc16  
      008842 88 AE 88         [ 1] 1262 	ld acc8, a 
      008845 08 CD A2 C0      [ 2] 1263 	addw x,acc16 
      008849 84               [ 2] 1264 	ldw x,(x)
      00884A AE 86 BA         [ 4] 1265 	call puts
      00884D 72 5F 00         [ 2] 1266 	ldw x,basicptr
      008850 0D 48 72         [ 1] 1267 	ld a,in 
      008853 59 00 0D         [ 4] 1268 	call prt_basic_line
      008856 C7 00 0E         [ 2] 1269 	ldw x,#tk_id 
      008859 72 BB 00         [ 4] 1270 	call puts 
      00885C 0D FE CD         [ 1] 1271 	ld a,in.saved 
      00885F A2               [ 1] 1272 	clrw x 
      008860 C0               [ 1] 1273 	ld xl,a 
      008861 CE 00 05 C6      [ 2] 1274 	addw x,basicptr 
      008865 00               [ 1] 1275 	ld a,(x)
      008866 02               [ 1] 1276 	clrw x 
      008867 CD               [ 1] 1277 	ld xl,a 
      008868 8F A4 AE         [ 4] 1278 	call print_int
      00886B 88 2B CD A2 C0   [ 2] 1279 	btjf flags,#FAUTORUN ,6$
      008870 C6 00 03         [ 4] 1280 	call cancel_autorun  
      008873 5F 97            [ 2] 1281 	jra 6$
      000809                       1282 1$:	
      008875 72               [ 1] 1283 	push a 
      008876 BB 00 05         [ 2] 1284 	ldw x,#comp_msg
      008879 F6 5F 97         [ 4] 1285 	call puts 
      00887C CD               [ 1] 1286 	pop a 
      00887D 89 8E 72         [ 2] 1287 	ldw x, #err_msg 
      008880 0D 00 24 3A      [ 1] 1288 	clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008884 CD               [ 1] 1289 	sll a
      008885 86 58 20 35      [ 1] 1290 	rlc acc16  
      008889 C7 00 0D         [ 1] 1291 	ld acc8, a 
      008889 88 AE 88 1A      [ 2] 1292 	addw x,acc16 
      00888D CD               [ 2] 1293 	ldw x,(x)
      00888E A2 C0 84         [ 4] 1294 	call puts
      008891 AE 86 BA         [ 2] 1295 	ldw x,#tib
      008894 72 5F 00         [ 4] 1296 	call puts 
      008897 0D 48            [ 1] 1297 	ld a,#CR 
      008899 72 59 00         [ 4] 1298 	call putc
      00889C 0D C7 00         [ 2] 1299 	ldw x,in.w
      00889F 0E 72 BB         [ 4] 1300 	call spaces
      0088A2 00 0D            [ 1] 1301 	ld a,#'^
      0088A4 FE CD A2         [ 4] 1302 	call putc 
      0088A7 C0 AE 16         [ 2] 1303 6$: ldw x,#STACK_EMPTY 
      0088AA 90               [ 1] 1304     ldw sp,x
      000842                       1305 warm_start:
      0088AB CD A2 C0         [ 4] 1306 	call warm_init
                                   1307 ;----------------------------
                                   1308 ;   BASIC interpreter
                                   1309 ;----------------------------
      000845                       1310 cmd_line: ; user interface 
      0088AE A6 0D            [ 1] 1311 	ld a,#CR 
      0088B0 CD 83 AB         [ 4] 1312 	call putc 
      0088B3 CE 00            [ 1] 1313 	ld a,#'> 
      0088B5 01 CD A3         [ 4] 1314 	call putc
      0088B8 2D A6 5E         [ 4] 1315 	call readln
      0088BB CD 83 AB AE      [ 1] 1316 	tnz count 
      0088BF 17 FF            [ 1] 1317 	jreq cmd_line
      0088C1 94 00 00         [ 4] 1318 	call compile
                                   1319 ; if text begin with a line number
                                   1320 ; the compiler set count to zero    
                                   1321 ; so code is not interpreted
      0088C2 72 5D 00 03      [ 1] 1322 	tnz count 
      0088C2 CD 86            [ 1] 1323 	jreq cmd_line
                                   1324 
                                   1325 ; if direct command 
                                   1326 ; it's ready to interpret 
                                   1327 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1328 ;; This is the interpreter loop
                                   1329 ;; for each BASIC code line. 
                                   1330 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      000861                       1331 interpreter: 
      0088C4 3A 00 01         [ 1] 1332 	ld a,in 
      0088C5 C1 00 03         [ 1] 1333 	cp a,count 
      0088C5 A6 0D            [ 1] 1334 	jrmi interp_loop
      000869                       1335 next_line:
      0088C7 CD 83 AB A6 3E   [ 2] 1336 	btjf flags, #FRUN, cmd_line
      0088CC CD 83 AB         [ 2] 1337 	ldw x,basicptr
      0088CF CD A3 C5 72      [ 2] 1338 	addw x,in.w 
      0088D3 5D 00 04         [ 2] 1339 	cpw x,txtend 
      0088D6 27 ED            [ 1] 1340 	jrpl warm_start
      0088D8 CD A9 96         [ 2] 1341 	ldw basicptr,x ; start of next line  
      0088DB 72 5D            [ 1] 1342 	ld a,(2,x)
      0088DD 00 04 27         [ 1] 1343 	ld count,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0088E0 E4 03 00 01      [ 1] 1344 	mov in,#3 ; skip first 3 bytes of line 
      0088E1                       1345 interp_loop: 
      0088E1 C6 00 02         [ 4] 1346 	call next_token
      0088E4 C1 00            [ 1] 1347 	cp a,#TK_NONE 
      0088E6 04 2B            [ 1] 1348 	jreq next_line 
      0088E8 1D 80            [ 1] 1349 	cp a,#TK_CMD
      0088E9 26 03            [ 1] 1350 	jrne 1$
      0088E9 72               [ 4] 1351 	call (x) 
      0088EA 01 00            [ 2] 1352 	jra interp_loop 
      000894                       1353 1$:	 
      0088EC 24 D7            [ 1] 1354 	cp a,#TK_VAR
      0088EE CE 00            [ 1] 1355 	jrne 2$
      0088F0 05 72 BB         [ 4] 1356 	call let_var  
      0088F3 00 01            [ 2] 1357 	jra interp_loop 
      00089D                       1358 2$:	
      0088F5 C3 00            [ 1] 1359 	cp a,#TK_ARRAY 
      0088F7 1F 2A            [ 1] 1360 	jrne 3$
      0088F9 C8 CF 00         [ 4] 1361 	call let_array 
      0088FC 05 E6            [ 2] 1362 	jra interp_loop
      0008A6                       1363 3$:	
      0088FE 02 C7            [ 1] 1364 	cp a,#TK_COLON 
      008900 00 04            [ 1] 1365 	jreq interp_loop 
      008902 35 03 00         [ 2] 1366 	jp syntax_error 
                                   1367 
                                   1368 		
                                   1369 ;--------------------------
                                   1370 ; extract next token from
                                   1371 ; token list 
                                   1372 ; basicptr -> base address 
                                   1373 ; in  -> offset in list array 
                                   1374 ; output:
                                   1375 ;   A 		token attribute
                                   1376 ;   X 		token value if there is one
                                   1377 ;----------------------------------------
      0008AD                       1378 next_token::
      008905 02               [ 1] 1379 	clrw x 
      008906 C6 00 01         [ 1] 1380 	ld a,in 
      008906 CD 89 2D         [ 1] 1381 	sub a,count ; don't replace sub by cp!  
      008909 A1 00            [ 1] 1382 	jrmi 0$
      00890B 27               [ 4] 1383 	ret  ; end of BASIC line 
      0008B7                       1384 0$: 
      00890C DC A1 80 26 03   [ 1] 1385 	mov in.saved,in 
      008911 FD 20 F2 04      [ 2] 1386 	ldw y,basicptr 
      008914 91 D6 00         [ 4] 1387 	ld a,([in.w],y)
      008914 A1 85 26 05      [ 1] 1388 	inc in  
      008918 CD               [ 1] 1389 	tnz a 
      008919 8F 0E            [ 1] 1390 	jrmi 6$
      00891B 20 E9            [ 1] 1391 	cp a,#TK_ARRAY
      00891D 2A 3F            [ 1] 1392 	jrpl 9$  ; no attribute for these
      00891D A1 06            [ 1] 1393 	cp a,#TK_COLON
      00891F 26 05            [ 1] 1394 	jreq 9$  
      0008D2                       1395 1$: ; 
      008921 CD 8F            [ 1] 1396 	cp a,#TK_CHAR
      008923 0B 20            [ 1] 1397 	jrne 2$
      008925 E0               [ 1] 1398 	exg a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008926 91 D6 00         [ 4] 1399 	ld a,([in.w],y)
      008926 A1 01 27 DC      [ 1] 1400 	inc in 
      00892A CC               [ 1] 1401 	exg a,xl  
      00892B 88               [ 4] 1402 	ret
      00892C 3B 02            [ 1] 1403 2$:	cp a,#TK_QSTR 
      00892D 26 29            [ 1] 1404 	jrne 9$
      00892D 5F               [ 1] 1405 	ldw x,y 
      00892E C6 00 02 C0      [ 2] 1406 	addw x,in.w ; pointer to string 
                                   1407 ; move pointer after string 
      008932 00 04 2B         [ 4] 1408 3$:	tnz ([in.w],y)
      008935 01 81            [ 1] 1409 	jreq 8$
      008937 72 5C 00 01      [ 1] 1410 	inc in 
      008937 55 00            [ 2] 1411 	jra 3$
      0008F4                       1412 6$: 
      008939 02 00 03 90      [ 2] 1413 	addw y,in.w 
      00893D CE 00            [ 2] 1414 	ldw y,(y)
      00893F 05 91            [ 1] 1415 	cp a,#TK_INTGR
      008941 D6 01            [ 1] 1416 	jrpl 7$
      008943 72 5C 00 02      [ 2] 1417 	addw y,#code_addr
      008947 4D 2B            [ 2] 1418 	ldw y,(y) 
      008949 2A               [ 1] 1419 7$:	exgw x,y 
      00894A A1 06 2A 3F      [ 1] 1420 	inc in
      00894E A1 01 27 3B      [ 1] 1421 8$:	inc in 
      008952                       1422 9$: 
      008952 A1               [ 4] 1423 	ret	
                                   1424 
                                   1425 ;-----------------------------------
                                   1426 ; print a 16 bit integer 
                                   1427 ; using variable 'base' as conversion
                                   1428 ; format.
                                   1429 ; input:
                                   1430 ;   X       integer to print 
                                   1431 ;   'base'    conversion base 
                                   1432 ; output:
                                   1433 ;   none 
                                   1434 ;-----------------------------------
      00090E                       1435 print_int:
      008953 03 26 0A 41      [ 1] 1436 	clr acc24 
      008957 91 D6 01         [ 2] 1437 	ldw acc16,x 
      00895A 72 5C 00 02 41   [ 2] 1438 	btjf acc16,#7,prti24
      00895F 81 A1 02 26      [ 1] 1439 	cpl acc24 
                                   1440 
                                   1441 ;------------------------------------
                                   1442 ; print integer in acc24 
                                   1443 ; input:
                                   1444 ;	acc24 		integer to print 
                                   1445 ;	'base' 		numerical base for conversion 
                                   1446 ;   'tab_width' field width 
                                   1447 ;  output:
                                   1448 ;    A          string length
                                   1449 ;------------------------------------
      00091E                       1450 prti24:
      008963 29 93 72         [ 4] 1451     call itoa  ; conversion entier en  .asciz
      008966 BB 00 01         [ 4] 1452 	call right_align  
      008969 91               [ 1] 1453 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      00896A 6D 01 27         [ 4] 1454 	call puts
      00896D 1B               [ 1] 1455 	pop a 
      00896E 72               [ 4] 1456     ret	
                                   1457 
                                   1458 ;------------------------------------
                                   1459 ; convert integer in acc24 to string
                                   1460 ; input:
                                   1461 ;   'base'	conversion base 
                                   1462 ;	acc24	integer to convert
                                   1463 ; output:
                                   1464 ;   X  		pointer to first char of string
                                   1465 ;   A       string length
                                   1466 ;------------------------------------
                           000001  1467 	SIGN=1  ; integer sign 
                           000002  1468 	LEN=2 
                           000003  1469 	PSTR=3
                           000004  1470 	VSIZE=4 ;locals size
      00092A                       1471 itoa::
      00092A                       1472 	_vars VSIZE
      00896F 5C 00            [ 2]    1     sub sp,#VSIZE 
      008971 02 20            [ 1] 1473 	clr (LEN,sp) ; string length  
      008973 F5 01            [ 1] 1474 	clr (SIGN,sp)    ; sign
      008974 C6 00 0A         [ 1] 1475 	ld a,base 
      008974 72 B9            [ 1] 1476 	cp a,#10
      008976 00 01            [ 1] 1477 	jrne 1$
                                   1478 	; base 10 string display with negative sign if bit 23==1
      008978 90 FE A1 84 2A   [ 2] 1479 	btjf acc24,#7,1$
      00897D 06 72            [ 1] 1480 	cpl (SIGN,sp)
      00897F A9 A1 9B         [ 4] 1481 	call neg_acc24
      000941                       1482 1$:
                                   1483 ; initialize string pointer 
      008982 90 FE 51         [ 2] 1484 	ldw x,#tib 
      008985 72 5C 00         [ 2] 1485 	addw x,#TIB_SIZE
      008988 02               [ 2] 1486 	decw x 
      008989 72               [ 1] 1487 	clr (x)
      000949                       1488 itoa_loop:
      00898A 5C 00 02         [ 1] 1489     ld a,base
      00898D 1F 03            [ 2] 1490 	ldw (PSTR,sp),x 
      00898D 81 09 8F         [ 4] 1491     call divu24_8 ; acc24/A 
      00898E 1E 03            [ 2] 1492 	ldw x,(PSTR,sp)
      00898E 72 5F            [ 1] 1493     add a,#'0  ; remainder of division
      008990 00 0C            [ 1] 1494     cp a,#'9+1
      008992 CF 00            [ 1] 1495     jrmi 2$
      008994 0D 72            [ 1] 1496     add a,#7 
      00095B                       1497 2$:	
      008996 0F               [ 2] 1498 	decw x
      008997 00               [ 1] 1499     ld (x),a
      008998 0D 04            [ 1] 1500 	inc (LEN,sp)
                                   1501 	; if acc24==0 conversion done
      00899A 72 53 00         [ 1] 1502 	ld a,acc24
      00899D 0C 00 0C         [ 1] 1503 	or a,acc16
      00899E CA 00 0D         [ 1] 1504 	or a,acc8
      00899E CD 89            [ 1] 1505     jrne itoa_loop
                                   1506 	;conversion done, next add '$' or '-' as required
      0089A0 AA CD AA         [ 1] 1507 	ld a,base 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0089A3 30 88            [ 1] 1508 	cp a,#16
      0089A5 CD A2            [ 1] 1509 	jreq 8$
      0089A7 C0 84            [ 1] 1510 	ld a,(SIGN,sp)
      0089A9 81 15            [ 1] 1511     jreq 10$
      0089AA A6 2D            [ 1] 1512     ld a,#'-
      0089AA 52 04            [ 2] 1513 	jra 9$ 
                                   1514 ; don't print more than 4 digits
                                   1515 ; in hexadecimal to avoid '-' sign 
                                   1516 ; extend display 	
      0089AC 0F 02            [ 1] 1517 8$: ld a,(LEN,sp) 
      0089AE 0F 01            [ 1] 1518 	cp a,#5 
      0089B0 C6 00            [ 1] 1519 	jrmi 81$
      0089B2 0B               [ 1] 1520 	incw x
      0089B3 A1 0A            [ 1] 1521 	dec (LEN,sp)
      0089B5 26 0A            [ 2] 1522 	jra 8$
      000984                       1523 81$:	
      0089B7 72 0F            [ 1] 1524 	ld a,#'$ 
      0089B9 00               [ 2] 1525 9$: decw x
      0089BA 0C               [ 1] 1526     ld (x),a
      0089BB 05 03            [ 1] 1527 	inc (LEN,sp)
      00098A                       1528 10$:
      0089BD 01 CD            [ 1] 1529 	ld a,(LEN,sp)
      00098C                       1530 	_drop VSIZE
      0089BF 8A 71            [ 2]    1     addw sp,#VSIZE 
      0089C1 81               [ 4] 1531 	ret
                                   1532 
                                   1533 ;-------------------------------------
                                   1534 ; divide uint24_t by uint8_t
                                   1535 ; used to convert uint24_t to string
                                   1536 ; input:
                                   1537 ;	acc24	dividend
                                   1538 ;   A 		divisor
                                   1539 ; output:
                                   1540 ;   acc24	quotient
                                   1541 ;   A		remainder
                                   1542 ;------------------------------------- 
                                   1543 ; offset  on sp of arguments and locals
                           000001  1544 	U8   = 1   ; divisor on stack
                           000001  1545 	VSIZE =1
      00098F                       1546 divu24_8:
      0089C1 AE               [ 2] 1547 	pushw x ; save x
      0089C2 16               [ 1] 1548 	push a 
                                   1549 	; ld dividend UU:MM bytes in X
      0089C3 90 1C 00         [ 1] 1550 	ld a, acc24
      0089C6 50               [ 1] 1551 	ld xh,a
      0089C7 5A 7F 0C         [ 1] 1552 	ld a,acc24+1
      0089C9 97               [ 1] 1553 	ld xl,a
      0089C9 C6 00            [ 1] 1554 	ld a,(U8,SP) ; divisor
      0089CB 0B               [ 2] 1555 	div x,a ; UU:MM/U8
      0089CC 1F               [ 1] 1556 	push a  ;save remainder
      0089CD 03               [ 1] 1557 	ld a,xh
      0089CE CD 8A 0F         [ 1] 1558 	ld acc24,a
      0089D1 1E               [ 1] 1559 	ld a,xl
      0089D2 03 AB 30         [ 1] 1560 	ld acc24+1,a
      0089D5 A1               [ 1] 1561 	pop a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0089D6 3A               [ 1] 1562 	ld xh,a
      0089D7 2B 02 AB         [ 1] 1563 	ld a,acc24+2
      0089DA 07               [ 1] 1564 	ld xl,a
      0089DB 7B 01            [ 1] 1565 	ld a,(U8,sp) ; divisor
      0089DB 5A               [ 2] 1566 	div x,a  ; R:LL/U8
      0089DC F7 0C            [ 1] 1567 	ld (U8,sp),a ; save remainder
      0089DE 02               [ 1] 1568 	ld a,xl
      0089DF C6 00 0C         [ 1] 1569 	ld acc24+2,a
      0089E2 CA               [ 1] 1570 	pop a
      0089E3 00               [ 2] 1571 	popw x
      0089E4 0D               [ 4] 1572 	ret
                                   1573 
                                   1574 ;--------------------------------------
                                   1575 ; unsigned multiply uint24_t by uint8_t
                                   1576 ; use to convert numerical string to uint24_t
                                   1577 ; input:
                                   1578 ;	acc24	uint24_t 
                                   1579 ;   A		uint8_t
                                   1580 ; output:
                                   1581 ;   acc24   A*acc24
                                   1582 ;-------------------------------------
                                   1583 ; local variables offset  on sp
                           000003  1584 	U8   = 3   ; A pushed on stack
                           000002  1585 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1586 	OVFH = 1  ; multiplication overflow high byte
                           000003  1587 	VSIZE = 3
      0009B7                       1588 mulu24_8:
      0089E5 CA               [ 2] 1589 	pushw x    ; save X
                                   1590 	; local variables
      0089E6 00               [ 1] 1591 	push a     ; U8
      0089E7 0E               [ 1] 1592 	clrw x     ; initialize overflow to 0
      0089E8 26               [ 2] 1593 	pushw x    ; multiplication overflow
                                   1594 ; multiply low byte.
      0089E9 DF C6 00         [ 1] 1595 	ld a,acc24+2
      0089EC 0B               [ 1] 1596 	ld xl,a
      0089ED A1 10            [ 1] 1597 	ld a,(U8,sp)
      0089EF 27               [ 4] 1598 	mul x,a
      0089F0 08               [ 1] 1599 	ld a,xl
      0089F1 7B 01 27         [ 1] 1600 	ld acc24+2,a
      0089F4 15               [ 1] 1601 	ld a, xh
      0089F5 A6 2D            [ 1] 1602 	ld (OVFL,sp),a
                                   1603 ; multipy middle byte
      0089F7 20 0D 7B         [ 1] 1604 	ld a,acc24+1
      0089FA 02               [ 1] 1605 	ld xl,a
      0089FB A1 05            [ 1] 1606 	ld a, (U8,sp)
      0089FD 2B               [ 4] 1607 	mul x,a
                                   1608 ; add overflow to this partial product
      0089FE 05 5C 0A         [ 2] 1609 	addw x,(OVFH,sp)
      008A01 02               [ 1] 1610 	ld a,xl
      008A02 20 F5 0C         [ 1] 1611 	ld acc24+1,a
      008A04 4F               [ 1] 1612 	clr a
      008A04 A6 24            [ 1] 1613 	adc a,#0
      008A06 5A F7            [ 1] 1614 	ld (OVFH,sp),a
      008A08 0C               [ 1] 1615 	ld a,xh
      008A09 02 02            [ 1] 1616 	ld (OVFL,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1617 ; multiply most signficant byte	
      008A0A C6 00 0B         [ 1] 1618 	ld a, acc24
      008A0A 7B               [ 1] 1619 	ld xl, a
      008A0B 02 5B            [ 1] 1620 	ld a, (U8,sp)
      008A0D 04               [ 4] 1621 	mul x,a
      008A0E 81 FB 01         [ 2] 1622 	addw x, (OVFH,sp)
      008A0F 9F               [ 1] 1623 	ld a, xl
      008A0F 89 88 C6         [ 1] 1624 	ld acc24,a
      008A12 00 0C            [ 2] 1625     addw sp,#VSIZE
      008A14 95               [ 2] 1626 	popw x
      008A15 C6               [ 4] 1627 	ret
                                   1628 
                                   1629 ;------------------------------------
                                   1630 ;  two's complement acc24
                                   1631 ;  input:
                                   1632 ;		acc24 variable
                                   1633 ;  output:
                                   1634 ;		acc24 variable
                                   1635 ;-------------------------------------
      0009F1                       1636 neg_acc24:
      008A16 00 0D 97 7B      [ 1] 1637 	cpl acc24+2
      008A1A 01 62 88 9E      [ 1] 1638 	cpl acc24+1
      008A1E C7 00 0C 9F      [ 1] 1639 	cpl acc24
      008A22 C7 00            [ 1] 1640 	ld a,#1
      008A24 0D 84 95         [ 1] 1641 	add a,acc24+2
      008A27 C6 00 0E         [ 1] 1642 	ld acc24+2,a
      008A2A 97               [ 1] 1643 	clr a
      008A2B 7B 01 62         [ 1] 1644 	adc a,acc24+1
      008A2E 6B 01 9F         [ 1] 1645 	ld acc24+1,a 
      008A31 C7               [ 1] 1646 	clr a 
      008A32 00 0E 84         [ 1] 1647 	adc a,acc24 
      008A35 85 81 0B         [ 1] 1648 	ld acc24,a 
      008A37 81               [ 4] 1649 	ret
                                   1650 
                                   1651 
                                   1652 
                                   1653 
                                   1654 ;------------------------------------
                                   1655 ; convert alpha to uppercase
                                   1656 ; input:
                                   1657 ;    a  character to convert
                                   1658 ; output:
                                   1659 ;    a  uppercase character
                                   1660 ;------------------------------------
      000A14                       1661 to_upper::
      008A37 89 88            [ 1] 1662 	cp a,#'a
      008A39 5F 89            [ 1] 1663 	jrpl 1$
      008A3B C6               [ 4] 1664 0$:	ret
      008A3C 00 0E            [ 1] 1665 1$: cp a,#'z	
      008A3E 97 7B            [ 1] 1666 	jrugt 0$
      008A40 03 42            [ 1] 1667 	sub a,#32
      008A42 9F               [ 4] 1668 	ret
                                   1669 	
                                   1670 ;------------------------------------
                                   1671 ; convert pad content in integer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1672 ; input:
                                   1673 ;    x		.asciz to convert
                                   1674 ; output:
                                   1675 ;    acc24      int24_t
                                   1676 ;------------------------------------
                                   1677 	; local variables
                           000001  1678 	SIGN=1 ; 1 byte, 
                           000002  1679 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  1680 	TEMP=3 ; 1 byte, temporary storage
                           000003  1681 	VSIZE=3 ; 3 bytes reserved for local storage
      000A20                       1682 atoi24::
      008A43 C7               [ 2] 1683 	pushw x 
      000A21                       1684 	_vars VSIZE
      008A44 00 0E            [ 2]    1     sub sp,#VSIZE 
                                   1685 	; acc24=0 
      008A46 9E 6B 02 C6      [ 1] 1686 	clr acc24    
      008A4A 00 0D 97 7B      [ 1] 1687 	clr acc16
      008A4E 03 42 72 FB      [ 1] 1688 	clr acc8 
      008A52 01 9F            [ 1] 1689 	clr (SIGN,sp)
      008A54 C7 00            [ 1] 1690 	ld a,#10
      008A56 0D 4F            [ 1] 1691 	ld (BASE,sp),a ; default base decimal
      008A58 A9               [ 1] 1692 	ld a,(x)
      008A59 00 6B            [ 1] 1693 	jreq 9$  ; completed if 0
      008A5B 01 9E            [ 1] 1694 	cp a,#'-
      008A5D 6B 02            [ 1] 1695 	jrne 1$
      008A5F C6 00            [ 1] 1696 	cpl (SIGN,sp)
      008A61 0C 97            [ 2] 1697 	jra 2$
      008A63 7B 03            [ 1] 1698 1$: cp a,#'$
      008A65 42 72            [ 1] 1699 	jrne 3$
      008A67 FB 01            [ 1] 1700 	ld a,#16
      008A69 9F C7            [ 1] 1701 	ld (BASE,sp),a
      008A6B 00               [ 1] 1702 2$:	incw x
      008A6C 0C               [ 1] 1703 	ld a,(x)
      000A4A                       1704 3$:	
      008A6D 5B 03            [ 1] 1705 	cp a,#'a
      008A6F 85 81            [ 1] 1706 	jrmi 4$
      008A71 A0 20            [ 1] 1707 	sub a,#32
      008A71 72 53            [ 1] 1708 4$:	cp a,#'0
      008A73 00 0E            [ 1] 1709 	jrmi 9$
      008A75 72 53            [ 1] 1710 	sub a,#'0
      008A77 00 0D            [ 1] 1711 	cp a,#10
      008A79 72 53            [ 1] 1712 	jrmi 5$
      008A7B 00 0C            [ 1] 1713 	sub a,#7
      008A7D A6 01            [ 1] 1714 	cp a,(BASE,sp)
      008A7F CB 00            [ 1] 1715 	jrpl 9$
      008A81 0E C7            [ 1] 1716 5$:	ld (TEMP,sp),a
      008A83 00 0E            [ 1] 1717 	ld a,(BASE,sp)
      008A85 4F C9 00         [ 4] 1718 	call mulu24_8
      008A88 0D C7            [ 1] 1719 	ld a,(TEMP,sp)
      008A8A 00 0D 4F         [ 1] 1720 	add a,acc24+2
      008A8D C9 00 0C         [ 1] 1721 	ld acc24+2,a
      008A90 C7               [ 1] 1722 	clr a
      008A91 00 0C 81         [ 1] 1723 	adc a,acc24+1
      008A94 C7 00 0C         [ 1] 1724 	ld acc24+1,a
      008A94 A1               [ 1] 1725 	clr a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008A95 61 2A 01         [ 1] 1726 	adc a,acc24
      008A98 81 A1 7A         [ 1] 1727 	ld acc24,a
      008A9B 22 FB            [ 2] 1728 	jra 2$
      008A9D A0 20            [ 1] 1729 9$:	tnz (SIGN,sp)
      008A9F 81 03            [ 1] 1730     jreq atoi_exit
      008AA0 CD 09 F1         [ 4] 1731     call neg_acc24
      000A86                       1732 atoi_exit: 
      000A86                       1733 	_drop VSIZE
      008AA0 89 52            [ 2]    1     addw sp,#VSIZE 
      008AA2 03               [ 2] 1734 	popw x ; restore x
      008AA3 72               [ 4] 1735 	ret
                                   1736 
                                   1737 
                                   1738 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1739 ;;   TINY BASIC  operators,
                                   1740 ;;   commands and functions 
                                   1741 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1742 
                                   1743 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1744 ;;  Arithmetic operators
                                   1745 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1746 
                                   1747 ;debug support
                           000001  1748 DEBUG_PRT=1
                           000001  1749 .if DEBUG_PRT 
                           000001  1750 	REGA=1
                           000002  1751 	SAVEB=2
                           000003  1752 	REGX=3
                           000005  1753 	REGY=5
                           000007  1754 	ACC24=7
                           000009  1755 	VSIZE=9 
      000A8A                       1756 printxy:
      000A8A                       1757 	_vars VSIZE 
      008AA4 5F 00            [ 2]    1     sub sp,#VSIZE 
      008AA6 0C 72            [ 1] 1758 	ld (REGA,sp),a 
      008AA8 5F 00 0D         [ 1] 1759 	ld a,base 
      008AAB 72 5F            [ 1] 1760 	ld (SAVEB,sp),a
      008AAD 00 0E            [ 2] 1761 	ldw (REGX,sp),x
      008AAF 0F 01            [ 2] 1762 	ldw (REGY,sp),y
      008AB1 A6 0A 6B         [ 2] 1763 	ldw x,acc24 
      008AB4 02 F6 27         [ 1] 1764 	ld a,acc8 
      008AB7 47 A1            [ 2] 1765 	ldw (ACC24,sp),x 
      008AB9 2D 26            [ 1] 1766 	ld (ACC24+2,sp),a 
      008ABB 04 03 01 20      [ 1] 1767 	mov base,#16 
      008ABF 08               [ 1] 1768 	clrw x 
      008AC0 A1 24            [ 1] 1769 	ld a,(REGA,sp)
      008AC2 26               [ 1] 1770 	ld xl,a 
      008AC3 06 A6 10         [ 4] 1771 	call print_int
      008AC6 6B 02            [ 1] 1772 	ld a,#SPACE 
      008AC8 5C F6 2B         [ 4] 1773 	call putc  
      008ACA 1E 03            [ 2] 1774 	ldw x,(REGX,sp)
      008ACA A1 61 2B         [ 4] 1775 	call print_int 
      008ACD 02 A0            [ 1] 1776 	ld a,#SPACE 
      008ACF 20 A1 30         [ 4] 1777 	call putc  
      008AD2 2B 2B            [ 2] 1778 	ldw x,(REGY,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008AD4 A0 30 A1         [ 4] 1779 	call print_int 
      008AD7 0A 2B            [ 1] 1780 	ld a,#CR 
      008AD9 06 A0 07         [ 4] 1781 	call putc 
      008ADC 11 02            [ 1] 1782 	ld a,(ACC24+2,sp)
      008ADE 2A 1F            [ 2] 1783 	ldw x,(ACC24,sp)
      008AE0 6B 03 7B         [ 2] 1784 	ldw acc24,x 
      008AE3 02 CD 8A         [ 1] 1785 	ld acc8,a
      008AE6 37 7B            [ 1] 1786 	ld a,(SAVEB,sp)
      008AE8 03 CB 00         [ 1] 1787 	ld base,a 
      008AEB 0E C7            [ 1] 1788 	ld a,(REGA,sp)
      008AED 00 0E            [ 2] 1789 	ldw x,(REGX,sp)
      008AEF 4F C9            [ 2] 1790 	ldw y,(REGY,sp)
      000ADA                       1791 	_drop VSIZE 
      008AF1 00 0D            [ 2]    1     addw sp,#VSIZE 
      008AF3 C7               [ 4] 1792 	ret 
                                   1793 .endif 
                                   1794 
                                   1795 
                                   1796 ;--------------------------------------
                                   1797 ;  multiply 2 uint16_t return uint32_t
                                   1798 ;  input:
                                   1799 ;     x       uint16_t 
                                   1800 ;     y       uint16_t 
                                   1801 ;  output:
                                   1802 ;     x       product bits 15..0
                                   1803 ;     y       product bits 31..16 
                                   1804 ;---------------------------------------
                           000001  1805 		U1=1  ; uint16_t 
                           000003  1806 		DBL=3 ; uint32_t
                           000006  1807 		VSIZE=6
      000ADD                       1808 umstar:
      000ADD                       1809 	_vars VSIZE 
      008AF4 00 0D            [ 2]    1     sub sp,#VSIZE 
      008AF6 4F C9            [ 2] 1810 	ldw (U1,sp),x 
                                   1811 ;initialize bits 31..16 of 
                                   1812 ;product to zero 
      008AF8 00 0C            [ 1] 1813 	clr (DBL,sp)
      008AFA C7 00            [ 1] 1814 	clr (DBL+1,sp)
                                   1815 ; produc U1L*U2L 
      008AFC 0C 20            [ 1] 1816 	ld a,yl 
      008AFE C9               [ 4] 1817 	mul x,a 
      008AFF 0D 01            [ 2] 1818 	ldw (DBL+2,sp),x
                                   1819 ; product U1H*U2L 
      008B01 27 03            [ 1] 1820 	ld a,(U1,sp) ; xh 
      008B03 CD               [ 1] 1821 	ldw x,y
      008B04 8A               [ 4] 1822 	mul x,a 
      008B05 71               [ 1] 1823 	clr a 
      008B06 72 FB 04         [ 2] 1824 	addw x,(DBL+1,sp) 
      008B06 5B               [ 1] 1825 	clr a 
      008B07 03 85            [ 1] 1826 	adc a,(DBL,sp) 
      008B09 81 03            [ 1] 1827 	ld (DBL,sp),a ; bits 23..17 
      008B0A 1F 04            [ 2] 1828 	ldw (DBL+1,sp),x ; bits 15..0 
                                   1829 ; product U1L*U2H
      008B0A 52 09            [ 1] 1830 	swapw y 
      008B0C 6B               [ 1] 1831 	ldw x,y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B0D 01 C6            [ 1] 1832 	ld a,(U1+1,sp)
      008B0F 00               [ 4] 1833 	mul x,a
      008B10 0B 6B 02         [ 2] 1834 	addw x,(DBL+1,sp)
      008B13 1F               [ 1] 1835 	clr a 
      008B14 03 17            [ 1] 1836 	adc a,(DBL,sp)
      008B16 05 CE            [ 1] 1837 	ld (DBL,sp),a 
      008B18 00 0C            [ 2] 1838 	ldw (DBL+1,sp),x 
                                   1839 ; product U1H*U2H 	
      008B1A C6 00            [ 1] 1840 	ld a,(U1,sp)
      008B1C 0E               [ 1] 1841 	ldw x,y  
      008B1D 1F               [ 4] 1842 	mul x,a 
      008B1E 07 6B 09         [ 2] 1843 	addw x,(DBL,sp)
      008B21 35 10            [ 1] 1844 	ldw y,x 
      008B23 00 0B            [ 2] 1845 	ldw x,(DBL+2,sp)
      000B14                       1846 	_drop VSIZE 
      008B25 5F 7B            [ 2]    1     addw sp,#VSIZE 
      008B27 01               [ 4] 1847 	ret
                                   1848 
                                   1849 
                                   1850 ;-------------------------------------
                                   1851 ; multiply 2 integers
                                   1852 ; input:
                                   1853 ;  	x       n1 
                                   1854 ;   y 		n2 
                                   1855 ; output:
                                   1856 ;	X        N1*N2 bits 15..0
                                   1857 ;   Y        N1*N2 bits 31..16 
                                   1858 ;-------------------------------------
                           000001  1859 	SIGN=1
                           000001  1860 	VSIZE=1
      000B17                       1861 multiply:
      000B17                       1862 	_vars VSIZE 
      008B28 97 CD            [ 2]    1     sub sp,#VSIZE 
      008B2A 89 8E            [ 1] 1863 	clr (SIGN,sp)
      008B2C A6               [ 1] 1864 	ld a,xh 
      008B2D 20 CD            [ 1] 1865 	and a,#0x80
      008B2F 83 AB            [ 1] 1866 	jrpl 1$
      008B31 1E 03            [ 1] 1867 	cpl (SIGN,sp)
      008B33 CD               [ 2] 1868 	negw x 
      000B23                       1869 1$:	
      008B34 89 8E            [ 1] 1870 	ld a,yh
      008B36 A6 20            [ 1] 1871 	and a,#0x80  
      008B38 CD 83            [ 1] 1872 	jrpl 2$ 
      008B3A AB 1E            [ 1] 1873 	cpl (SIGN,sp)
      008B3C 05 CD            [ 2] 1874 	negw y 
      000B2D                       1875 2$:	
      008B3E 89 8E A6         [ 4] 1876 	call umstar
      008B41 0D CD            [ 1] 1877 	ld a,(SIGN,sp)
      008B43 83 AB            [ 1] 1878 	jreq 3$
      008B45 7B 09 1E         [ 4] 1879 	call dneg 
      000B37                       1880 3$:	
      000B37                       1881 	_drop VSIZE 
      008B48 07 CF            [ 2]    1     addw sp,#VSIZE 
      008B4A 00               [ 4] 1882 	ret
                                   1883 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1884 ;--------------------------------------
                                   1885 ; divide uint32_t/uint16_t
                                   1886 ; return:  quotient and remainder 
                                   1887 ; quotient expected to be uint16_t 
                                   1888 ; input:
                                   1889 ;   DBLDIVDND    on stack 
                                   1890 ;   X            divisor 
                                   1891 ; output:
                                   1892 ;   X            quotient 
                                   1893 ;   Y            remainder 
                                   1894 ;---------------------------------------
                           000003  1895 	VSIZE=3
      000B3A                       1896 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000B3A                       1897 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   1898 	; local variables 
                           000001  1899 	DIVISOR=1 
                           000003  1900 	CNTR=3 
      000B3A                       1901 udiv32_16:
      000B3A                       1902 	_vars VSIZE 
      008B4B 0C C7            [ 2]    1     sub sp,#VSIZE 
      008B4D 00 0E            [ 2] 1903 	ldw (DIVISOR,sp),x	; save divisor 
      008B4F 7B 02            [ 2] 1904 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008B51 C7 00            [ 2] 1905 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008B53 0B 7B            [ 2] 1906 	tnzw y
      008B55 01 1E            [ 1] 1907 	jrne long_division 
      008B57 03 16            [ 2] 1908 	ldw y,(DIVISOR,sp)
      008B59 05               [ 2] 1909 	divw x,y
      000B49                       1910 	_drop VSIZE 
      008B5A 5B 09            [ 2]    1     addw sp,#VSIZE 
      008B5C 81               [ 4] 1911 	ret
      008B5D                       1912 long_division:
      008B5D 52               [ 1] 1913 	exgw x,y ; hi in x, lo in y 
      008B5E 06 1F            [ 1] 1914 	ld a,#17 
      008B60 01 0F            [ 1] 1915 	ld (CNTR,sp),a
      000B51                       1916 1$:
      008B62 03 0F            [ 2] 1917 	cpw x,(DIVISOR,sp)
      008B64 04 90            [ 1] 1918 	jrmi 2$
      008B66 9F 42 1F         [ 2] 1919 	subw x,(DIVISOR,sp)
      008B69 05               [ 1] 1920 2$:	ccf 
      008B6A 7B 01            [ 2] 1921 	rlcw y 
      008B6C 93               [ 2] 1922 	rlcw x 
      008B6D 42 4F            [ 1] 1923 	dec (CNTR,sp)
      008B6F 72 FB            [ 1] 1924 	jrne 1$
      008B71 04               [ 1] 1925 	exgw x,y 
      000B61                       1926 	_drop VSIZE 
      008B72 4F 19            [ 2]    1     addw sp,#VSIZE 
      008B74 03               [ 4] 1927 	ret
                                   1928 
                                   1929 ;-----------------------------
                                   1930 ; negate double int.
                                   1931 ; input:
                                   1932 ;   x     bits 15..0
                                   1933 ;   y     bits 31..16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1934 ; output: 
                                   1935 ;   x     bits 15..0
                                   1936 ;   y     bits 31..16
                                   1937 ;-----------------------------
      000B64                       1938 dneg:
      008B75 6B               [ 2] 1939 	cplw x 
      008B76 03 1F            [ 2] 1940 	cplw y 
      008B78 04 90 5E         [ 2] 1941 	addw x,#1 
      008B7B 93 7B            [ 1] 1942 	jrnc 1$
      008B7D 02 42            [ 1] 1943 	incw y 
      008B7F 72               [ 4] 1944 1$: ret 
                                   1945 
                                   1946 
                                   1947 ;--------------------------------
                                   1948 ; sign extend single to double
                                   1949 ; input:
                                   1950 ;   x    int16_t
                                   1951 ; output:
                                   1952 ;   x    int32_t bits 15..0
                                   1953 ;   y    int32_t bits 31..16
                                   1954 ;--------------------------------
      000B6F                       1955 dbl_sign_extend:
      008B80 FB 04            [ 1] 1956 	clrw y
      008B82 4F               [ 1] 1957 	ld a,xh 
      008B83 19 03            [ 1] 1958 	and a,#0x80 
      008B85 6B 03            [ 1] 1959 	jreq 1$
      008B87 1F 04            [ 2] 1960 	cplw y
      008B89 7B               [ 4] 1961 1$: ret 	
                                   1962 
                                   1963 
                                   1964 ;----------------------------------
                                   1965 ;  euclidian divide dbl/n1 
                                   1966 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   1967 ; input:
                                   1968 ;    dbl    int32_t on stack 
                                   1969 ;    x 		n1   int16_t  disivor  
                                   1970 ; output:
                                   1971 ;    X      dbl/x  int16_t 
                                   1972 ;    Y      remainder int16_t 
                                   1973 ;----------------------------------
                           000008  1974 	VSIZE=8
      000B79                       1975 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000B79                       1976 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000B79                       1977 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   1978 	; local variables
                           000001  1979 	DBLHI=1
                           000003  1980 	DBLLO=3 
                           000005  1981 	SDIVSR=5 ; sign divisor
                           000006  1982 	SQUOT=6 ; sign dividend 
                           000007  1983 	DIVISR=7 ; divisor 
      000B79                       1984 div32_16:
      000B79                       1985 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008B8A 01 93            [ 2]    1     sub sp,#VSIZE 
      008B8C 42 72            [ 1] 1986 	clr (SDIVSR,sp)
      008B8E FB 03            [ 1] 1987 	clr (SQUOT,sp)
                                   1988 ; copy arguments 
      008B90 90 93            [ 2] 1989 	ldw y,(DIVDNDHI,sp)
      008B92 1E 05            [ 2] 1990 	ldw (DBLHI,sp),y
      008B94 5B 06            [ 2] 1991 	ldw y,(DIVDNDLO,sp)
      008B96 81 03            [ 2] 1992 	ldw (DBLLO,sp),y 
                                   1993 ; check for 0 divisor
      008B97 5D               [ 2] 1994 	tnzw x 
      008B97 52 01            [ 1] 1995     jrne 0$
      008B99 0F 01            [ 1] 1996 	ld a,#ERR_DIV0 
      008B9B 9E A4 80         [ 2] 1997 	jp tb_error 
                                   1998 ; check divisor sign 	
      008B9E 2A               [ 1] 1999 0$:	ld a,xh 
      008B9F 03 03            [ 1] 2000 	and a,#0x80 
      008BA1 01 50            [ 1] 2001 	jreq 1$
      008BA3 03 05            [ 1] 2002 	cpl (SDIVSR,sp)
      008BA3 90 9E            [ 1] 2003 	cpl (SQUOT,sp)
      008BA5 A4               [ 2] 2004 	negw x
      008BA6 80 2A            [ 2] 2005 1$:	ldw (DIVISR,sp),x
                                   2006 ; check dividend sign 	 
      008BA8 04 03            [ 1] 2007  	ld a,(DBLHI,sp) 
      008BAA 01 90            [ 1] 2008 	and a,#0x80 
      008BAC 50 0D            [ 1] 2009 	jreq 2$ 
      008BAD 03 06            [ 1] 2010 	cpl (SQUOT,sp)
      008BAD CD 8B            [ 2] 2011 	ldw x,(DBLLO,sp)
      008BAF 5D 7B            [ 2] 2012 	ldw y,(DBLHI,sp)
      008BB1 01 27 03         [ 4] 2013 	call dneg 
      008BB4 CD 8B            [ 2] 2014 	ldw (DBLLO,sp),x 
      008BB6 E4 01            [ 2] 2015 	ldw (DBLHI,sp),y 
      008BB7 1E 07            [ 2] 2016 2$:	ldw x,(DIVISR,sp)
      008BB7 5B 01 81         [ 4] 2017 	call udiv32_16
      008BBA 90 5D            [ 2] 2018 	tnzw y 
      008BBA 52 03            [ 1] 2019 	jreq 3$ 
                                   2020 ; x=quotient 
                                   2021 ; y=remainder 
                                   2022 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008BBC 1F 01            [ 1] 2023 	ld a,(SQUOT,sp)
      008BBE 1E 08            [ 1] 2024 	xor a,(SDIVSR,sp)
      008BC0 16 06            [ 1] 2025 	jreq 3$
      008BC2 90               [ 1] 2026 	incw x 
      008BC3 5D 26 06 16      [ 2] 2027 	ldw acc16,y 
      008BC7 01 65            [ 2] 2028 	ldw y,(DIVISR,sp)
      008BC9 5B 03 81 0C      [ 2] 2029 	subw y,acc16
                                   2030 ; sign quotient
      008BCC 7B 06            [ 1] 2031 3$:	ld a,(SQUOT,sp)
      008BCC 51 A6            [ 1] 2032 	jreq 4$
      008BCE 11               [ 2] 2033 	negw x 
      000BCD                       2034 4$:	
      000BCD                       2035 	_drop VSIZE 
      008BCF 6B 03            [ 2]    1     addw sp,#VSIZE 
      008BD1 81               [ 4] 2036 	ret 
                                   2037 
                                   2038 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2039 
                                   2040 ;----------------------------------
                                   2041 ; division x/y 
                                   2042 ; input:
                                   2043 ;    X       dividend
                                   2044 ;    Y       divisor 
                                   2045 ; output:
                                   2046 ;    X       quotient
                                   2047 ;    Y       remainder 
                                   2048 ;-----------------------------------
                           000004  2049 	VSIZE=4 
                                   2050 	; local variables 
                           000001  2051 	DBLHI=1
                           000003  2052 	DBLLO=3
      000BD0                       2053 divide: 
      000BD0                       2054 	_vars VSIZE 
      008BD1 13 01            [ 2]    1     sub sp,#VSIZE 
      008BD3 2B 03 72 F0      [ 2] 2055 	ldw acc16,y
      008BD7 01 8C 90         [ 4] 2056 	call dbl_sign_extend
      008BDA 59 59            [ 2] 2057 	ldw (DBLLO,sp),x 
      008BDC 0A 03            [ 2] 2058 	ldw (DBLHI,sp),y 
      008BDE 26 F1 51         [ 2] 2059 	ldw x,acc16 
      008BE1 5B 03 81         [ 4] 2060 	call div32_16 
      008BE4                       2061 	_drop VSIZE 
      008BE4 53 90            [ 2]    1     addw sp,#VSIZE 
      008BE6 53               [ 4] 2062 	ret
                                   2063 
                                   2064 
                                   2065 ;----------------------------------
                                   2066 ;  remainder resulting from euclidian 
                                   2067 ;  division of x/y 
                                   2068 ; input:
                                   2069 ;   x   	dividend int16_t 
                                   2070 ;   y 		divisor int16_t
                                   2071 ; output:
                                   2072 ;   X       n1%n2 
                                   2073 ;----------------------------------
      000BE6                       2074 modulo:
      008BE7 1C 00 01         [ 4] 2075 	call divide
      008BEA 24               [ 1] 2076 	ldw x,y 
      008BEB 02               [ 4] 2077 	ret 
                                   2078 
                                   2079 ;----------------------------------
                                   2080 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2081 ; return expr1*expr2/expr3 
                                   2082 ; product result is int32_t and 
                                   2083 ; divisiont is int32_t/int16_t
                                   2084 ;----------------------------------
                           000004  2085 	DBL_SIZE=4 
      000BEB                       2086 muldiv:
      008BEC 90 5C 81         [ 4] 2087 	call func_args 
      008BEF A1 03            [ 1] 2088 	cp a,#3 
      008BEF 90 5F            [ 1] 2089 	jreq 1$
      008BF1 9E A4 80         [ 2] 2090 	jp syntax_error
      000BF5                       2091 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008BF4 27 02            [ 2] 2092 	ldw x,(5,sp) ; expr1
      008BF6 90 53            [ 2] 2093 	ldw y,(3,sp) ; expr2
      008BF8 81 0B 17         [ 4] 2094 	call multiply 
      008BF9 1F 05            [ 2] 2095 	ldw (5,sp),x  ;int32_t 15..0
      008BF9 52 08            [ 2] 2096 	ldw (3,sp),y  ;int32_t 31..16
      008BFB 0F               [ 2] 2097 	popw x        ; expr3 
      008BFC 05 0F 06         [ 4] 2098 	call div32_16 ; int32_t/expr3 
      000C04                       2099 	_drop DBL_SIZE
      008BFF 16 0B            [ 2]    1     addw sp,#DBL_SIZE 
      008C01 17               [ 4] 2100 	ret 
                                   2101 
                                   2102 
                                   2103 ;---------------------------------
                                   2104 ; dictionary search 
                                   2105 ; input:
                                   2106 ;	X 		dictionary entry point, name field  
                                   2107 ;   y		.asciz name to search 
                                   2108 ; output:
                                   2109 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2110 ;  X		cmd_index ; execution address | 0 
                                   2111 ;---------------------------------
                           000001  2112 	NLEN=1 ; cmd length 
                           000002  2113 	XSAVE=2
                           000004  2114 	YSAVE=4
                           000005  2115 	VSIZE=5 
      000C07                       2116 search_dict::
      000C07                       2117 	_vars VSIZE 
      008C02 01 16            [ 2]    1     sub sp,#VSIZE 
                                   2118 
      008C04 0D 17            [ 2] 2119 	ldw (YSAVE,sp),y 
      000C0B                       2120 search_next:
      008C06 03 5D            [ 2] 2121 	ldw (XSAVE,sp),x 
                                   2122 ; get name length in dictionary	
      008C08 26               [ 1] 2123 	ld a,(x)
      008C09 05 A6            [ 1] 2124 	and a,#0xf 
      008C0B 04 CC            [ 1] 2125 	ld (NLEN,sp),a  
      008C0D 88 3D            [ 2] 2126 	ldw y,(YSAVE,sp) ; name pointer 
      008C0F 9E               [ 1] 2127 	incw x 
      000C15                       2128 cp_loop:
      008C10 A4 80            [ 1] 2129 	ld a,(y)
      008C12 27 05            [ 1] 2130 	jreq str_match 
      008C14 03 05            [ 1] 2131 	tnz (NLEN,sp)
      008C16 03 06            [ 1] 2132 	jreq no_match  
      008C18 50               [ 1] 2133 	cp a,(x)
      008C19 1F 07            [ 1] 2134 	jrne no_match 
      008C1B 7B 01            [ 1] 2135 	incw y 
      008C1D A4               [ 1] 2136 	incw x
      008C1E 80 27            [ 1] 2137 	dec (NLEN,sp)
      008C20 0D 03            [ 2] 2138 	jra cp_loop 
      000C27                       2139 no_match:
      008C22 06 1E            [ 2] 2140 	ldw x,(XSAVE,sp) 
      008C24 03 16 01         [ 2] 2141 	subw x,#2 ; move X to link field
      008C27 CD 8B            [ 1] 2142 	push #TK_NONE 
      008C29 E4               [ 2] 2143 	ldw x,(x) ; next word link 
      008C2A 1F               [ 1] 2144 	pop a ; TK_NONE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008C2B 03 17            [ 1] 2145 	jreq search_exit  ; not found  
                                   2146 ;try next 
      008C2D 01 1E            [ 2] 2147 	jra search_next
      000C34                       2148 str_match:
      008C2F 07 CD            [ 2] 2149 	ldw x,(XSAVE,sp)
      008C31 8B               [ 1] 2150 	ld a,(X)
      008C32 BA 90            [ 1] 2151 	ld (NLEN,sp),a ; needed to test keyword type  
      008C34 5D 27            [ 1] 2152 	and a,#0xf 
                                   2153 ; move x to procedure address field 	
      008C36 11               [ 1] 2154 	inc a 
      008C37 7B 06 18         [ 1] 2155 	ld acc8,a 
      008C3A 05 27 0B 5C      [ 1] 2156 	clr acc16 
      008C3E 90 CF 00 0D      [ 2] 2157 	addw x,acc16 
      008C42 16               [ 2] 2158 	ldw x,(x) ; routine index  
                                   2159 ;determine keyword type bits 7:6 
      008C43 07 72            [ 1] 2160 	ld a,(NLEN,sp)
      008C45 B2               [ 1] 2161 	swap a 
      008C46 00 0D            [ 1] 2162 	and a,#0xc
      008C48 7B               [ 1] 2163 	srl a
      008C49 06               [ 1] 2164 	srl a 
      008C4A 27 01            [ 1] 2165 	add a,#128
      000C51                       2166 search_exit: 
      000C51                       2167 	_drop VSIZE 	 
      008C4C 50 05            [ 2]    1     addw sp,#VSIZE 
      008C4D 81               [ 4] 2168 	ret 
                                   2169 
                                   2170 ;---------------------
                                   2171 ; check if next token
                                   2172 ;  is of expected type 
                                   2173 ; input:
                                   2174 ;   A 		 expected token attribute
                                   2175 ;  ouput:
                                   2176 ;   none     if fail call syntax_error 
                                   2177 ;--------------------
      000C54                       2178 expect:
      008C4D 5B               [ 1] 2179 	push a 
      008C4E 08 81 AD         [ 4] 2180 	call next_token 
      008C50 11 01            [ 1] 2181 	cp a,(1,sp)
      008C50 52 04            [ 1] 2182 	jreq 1$
      008C52 90 CF 00         [ 2] 2183 	jp syntax_error
      008C55 0D               [ 1] 2184 1$: pop a 
      008C56 CD               [ 4] 2185 	ret 
                                   2186 
                                   2187 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2188 ; parse arguments list 
                                   2189 ; between ()
                                   2190 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C61                       2191 func_args:
      008C57 8B EF            [ 1] 2192 	ld a,#TK_LPAREN 
      008C59 1F 03 17         [ 4] 2193 	call expect 
                                   2194 ; expected to continue in arg_list 
                                   2195 ; caller must check for TK_RPAREN 
                                   2196 
                                   2197 ;-------------------------------
                                   2198 ; parse embedded BASIC routines 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2199 ; arguments list.
                                   2200 ; arg_list::=  rel[','rel]*
                                   2201 ; all arguments are of integer type
                                   2202 ; and pushed on stack 
                                   2203 ; input:
                                   2204 ;   none
                                   2205 ; output:
                                   2206 ;   stack{n}   arguments pushed on stack
                                   2207 ;   A 	number of arguments pushed on stack  
                                   2208 ;--------------------------------
      000C66                       2209 arg_list:
      008C5C 01 CE            [ 1] 2210 	push #0  
      008C5E 00 0D CD         [ 4] 2211 1$: call relation
      008C61 8B F9            [ 1] 2212 	cp a,#TK_NONE 
      008C63 5B 04            [ 1] 2213 	jreq 5$
      008C65 81 84            [ 1] 2214 	cp a,#TK_INTGR
      008C66 26 13            [ 1] 2215 	jrne 4$
      000C73                       2216 3$: 
                                   2217 ; swap return address with argument
      008C66 CD               [ 1] 2218 	pop a ; arg_count
      008C67 8C 50            [ 2] 2219 	popw y ; return address 
      008C69 93               [ 2] 2220 	pushw x ; new argument 
      008C6A 81 89            [ 2] 2221 	pushw y 
      008C6B 4C               [ 1] 2222     inc a
      008C6B CD               [ 1] 2223 	push a 
      008C6C 8C E1 A1         [ 4] 2224 	call next_token 
      008C6F 03 27            [ 1] 2225 	cp a,#TK_COMMA 
      008C71 03 CC            [ 1] 2226 	jreq 1$ 
      008C73 88 3B            [ 1] 2227 	cp a,#TK_NONE 
      008C75 27 09            [ 1] 2228 	jreq 5$ 
      008C75 1E 05            [ 1] 2229 4$:	cp a,#TK_RPAREN 
      008C77 16 03            [ 1] 2230 	jreq 5$
      000C8A                       2231 	_unget_token 
      008C79 CD 8B 97 1F 05   [ 1]    1      mov in,in.saved  
      008C7E 17               [ 1] 2232 5$:	pop a  
      008C7F 03               [ 4] 2233 	ret 
                                   2234 
                                   2235 ;--------------------------------
                                   2236 ;   BASIC commnands 
                                   2237 ;--------------------------------
                                   2238 
                                   2239 ;--------------------------------
                                   2240 ;  arithmetic and relational 
                                   2241 ;  routines
                                   2242 ;  operators precedence
                                   2243 ;  highest to lowest
                                   2244 ;  operators on same row have 
                                   2245 ;  same precedence and are executed
                                   2246 ;  from left to right.
                                   2247 ;	'*','/','%'
                                   2248 ;   '-','+'
                                   2249 ;   '=','>','<','>=','<=','<>','><'
                                   2250 ;   '<>' and '><' are equivalent for not equal.
                                   2251 ;--------------------------------
                                   2252 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2253 ;---------------------
                                   2254 ; return array element
                                   2255 ; address from @(expr)
                                   2256 ; input:
                                   2257 ;   A 		TK_ARRAY
                                   2258 ; output:
                                   2259 ;   A 		TK_INTGR
                                   2260 ;	X 		element address 
                                   2261 ;----------------------
      000C91                       2262 get_array_element:
      008C80 85 CD 8B         [ 4] 2263 	call func_args 
      008C83 F9 5B            [ 1] 2264 	cp a,#1
      008C85 04 81            [ 1] 2265 	jreq 1$
      008C87 CC 07 BB         [ 2] 2266 	jp syntax_error
      008C87 52               [ 2] 2267 1$: popw x 
                                   2268 	; check for bounds 
      008C88 05 17 04         [ 2] 2269 	cpw x,array_size 
      008C8B 23 05            [ 2] 2270 	jrule 3$
                                   2271 ; bounds {1..array_size}	
      008C8B 1F 02            [ 1] 2272 2$: ld a,#ERR_BAD_VALUE 
      008C8D F6 A4 0F         [ 2] 2273 	jp tb_error 
      008C90 6B               [ 2] 2274 3$: tnzw  x
      008C91 01 16            [ 1] 2275 	jreq 2$ 
      008C93 04               [ 2] 2276 	sllw x 
      008C94 5C               [ 2] 2277 	pushw x 
      008C95 AE 16 90         [ 2] 2278 	ldw x,#tib
      008C95 90 F6 27         [ 2] 2279 	subw x,(1,sp)
      000CB1                       2280 	_drop 2   
      008C98 1B 0D            [ 2]    1     addw sp,#2 
      008C9A 01 27            [ 1] 2281 	ld a,#TK_INTGR
      008C9C 0A               [ 4] 2282 	ret 
                                   2283 
                                   2284 
                                   2285 ;***********************************
                                   2286 ;   expression parse,execute 
                                   2287 ;***********************************
                                   2288 ;-----------------------------------
                                   2289 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2290 ;			 integer | function |
                                   2291 ;			 '('relation')' 
                                   2292 ; output:
                                   2293 ;   A    token attribute 
                                   2294 ;   X 	 integer
                                   2295 ; ---------------------------------
                           000001  2296 	NEG=1
                           000001  2297 	VSIZE=1
      000CB6                       2298 factor:
      000CB6                       2299 	_vars VSIZE 
      008C9D F1 26            [ 2]    1     sub sp,#VSIZE 
      008C9F 07 90 5C         [ 4] 2300 	call next_token
      008CA2 5C 0A            [ 1] 2301 	cp a,#CMD_END  
      008CA4 01 20            [ 1] 2302 	jrult 16$
      008CA6 EE 01            [ 1] 2303 1$:	ld (NEG,sp),a 
      008CA7 A4 30            [ 1] 2304 	and a,#TK_GRP_MASK
      008CA7 1E 02            [ 1] 2305 	cp a,#TK_GRP_ADD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008CA9 1D 00            [ 1] 2306 	jreq 2$
      008CAB 02 4B            [ 1] 2307 	ld a,(NEG,sp)
      008CAD 00 FE            [ 2] 2308 	jra 4$  
      000CCB                       2309 2$:	
      008CAF 84 27 1F         [ 4] 2310 	call next_token 
      000CCE                       2311 4$:	
      008CB2 20 D7            [ 1] 2312 	cp a,#TK_IFUNC 
      008CB4 26 03            [ 1] 2313 	jrne 5$ 
      008CB4 1E               [ 4] 2314 	call (x) 
      008CB5 02 F6            [ 2] 2315 	jra 18$ 
      000CD5                       2316 5$:
      008CB7 6B 01            [ 1] 2317 	cp a,#TK_INTGR
      008CB9 A4 0F            [ 1] 2318 	jrne 6$
      008CBB 4C C7            [ 2] 2319 	jra 18$
      000CDB                       2320 6$:
      008CBD 00 0E            [ 1] 2321 	cp a,#TK_ARRAY
      008CBF 72 5F            [ 1] 2322 	jrne 10$
      008CC1 00 0D 72         [ 4] 2323 	call get_array_element
      008CC4 BB               [ 2] 2324 	ldw x,(x)
      008CC5 00 0D            [ 2] 2325 	jra 18$ 
      000CE5                       2326 10$:
      008CC7 FE 7B            [ 1] 2327 	cp a,#TK_VAR 
      008CC9 01 4E            [ 1] 2328 	jrne 12$
      008CCB A4               [ 2] 2329 	ldw x,(x)
      008CCC 0C 44            [ 2] 2330 	jra 18$
      000CEC                       2331 12$:			
      008CCE 44 AB            [ 1] 2332 	cp a,#TK_LPAREN
      008CD0 80 0C            [ 1] 2333 	jrne 16$
      008CD1 CD 0D AE         [ 4] 2334 	call relation
      008CD1 5B               [ 2] 2335 	pushw x 
      008CD2 05 81            [ 1] 2336 	ld a,#TK_RPAREN 
      008CD4 CD 0C 54         [ 4] 2337 	call expect
      008CD4 88               [ 2] 2338 	popw x 
      008CD5 CD 89            [ 2] 2339 	jra 18$	
      000CFC                       2340 16$:
      008CD7 2D               [ 1] 2341 	tnz a 
      008CD8 11 01            [ 1] 2342 	jreq 20$ 
      000CFF                       2343 	_unget_token
      008CDA 27 03 CC 88 3B   [ 1]    1      mov in,in.saved  
      008CDF 84               [ 1] 2344 	clr a 
      008CE0 81 09            [ 2] 2345 	jra 20$ 
      008CE1                       2346 18$: 
      008CE1 A6 07            [ 1] 2347 	ld a,#TK_MINUS 
      008CE3 CD 8C            [ 1] 2348 	cp a,(NEG,sp)
      008CE5 D4 01            [ 1] 2349 	jrne 19$
      008CE6 50               [ 2] 2350 	negw x
      000D0E                       2351 19$:
      008CE6 4B 00            [ 1] 2352 	ld a,#TK_INTGR
      000D10                       2353 20$:
      000D10                       2354 	_drop VSIZE
      008CE8 CD 8E            [ 2]    1     addw sp,#VSIZE 
      008CEA 2E               [ 4] 2355 	ret
                                   2356 
                                   2357 ;-----------------------------------
                                   2358 ; term ::= factor [['*'|'/'|'%'] factor]* 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2359 ; output:
                                   2360 ;   A    	token attribute 
                                   2361 ;	X		integer
                                   2362 ;-----------------------------------
                           000001  2363 	N1=1   ; int16_t
                           000003  2364 	MULOP=3
                           000003  2365 	VSIZE=3
      000D13                       2366 term:
      000D13                       2367 	_vars VSIZE
      008CEB A1 00            [ 2]    1     sub sp,#VSIZE 
      008CED 27 20 A1         [ 4] 2368 	call factor
      008CF0 84               [ 1] 2369 	tnz a 
      008CF1 26 13            [ 1] 2370 	jreq term_exit 
      008CF3                       2371 term01:	 ; check for  operator 
      008CF3 84 90            [ 2] 2372 	ldw (N1,sp),x  ; save first factor 
      008CF5 85 89 90         [ 4] 2373 	call next_token
      008CF8 89 4C            [ 1] 2374 	ld (MULOP,sp),a
      008CFA 88 CD            [ 1] 2375 	cp a,#CMD_END
      008CFC 89 2D            [ 1] 2376 	jrult 8$
      008CFE A1 09            [ 1] 2377 	and a,#TK_GRP_MASK
      008D00 27 E6            [ 1] 2378 	cp a,#TK_GRP_MULT
      008D02 A1 00            [ 1] 2379 	jreq 1$
      008D04 27 09            [ 2] 2380 	jra 8$
      000D2E                       2381 1$:	; got *|/|%
      008D06 A1 08 27         [ 4] 2382 	call factor
      008D09 05 55            [ 1] 2383 	cp a,#TK_INTGR
      008D0B 00 03            [ 1] 2384 	jreq 2$
      008D0D 00 02 84         [ 2] 2385 	jp syntax_error
      008D10 81 93            [ 1] 2386 2$:	ldw y,x 
      008D11 1E 01            [ 2] 2387 	ldw x,(N1,sp)
      008D11 CD 8C            [ 1] 2388 	ld a,(MULOP,sp) 
      008D13 E1 A1            [ 1] 2389 	cp a,#TK_MULT 
      008D15 01 27            [ 1] 2390 	jrne 3$
      008D17 03 CC 88         [ 4] 2391 	call multiply 
      008D1A 3B 85            [ 2] 2392 	jra term01
      008D1C C3 00            [ 1] 2393 3$: cp a,#TK_DIV 
      008D1E 22 23            [ 1] 2394 	jrne 4$ 
      008D20 05 A6 0A         [ 4] 2395 	call divide 
      008D23 CC 88            [ 2] 2396 	jra term01 
      008D25 3D 5D 27         [ 4] 2397 4$: call modulo
      008D28 F8 58            [ 2] 2398 	jra term01 
      008D2A 89 AE            [ 1] 2399 8$: ld a,(MULOP,sp)
      008D2C 16 90            [ 1] 2400 	jreq 9$ 
      000D59                       2401 	_unget_token
      008D2E 72 F0 01 5B 02   [ 1]    1      mov in,in.saved  
      008D33 A6 84            [ 2] 2402 9$: ldw x,(N1,sp)
      008D35 81 84            [ 1] 2403 	ld a,#TK_INTGR 	
      008D36                       2404 term_exit:
      000D62                       2405 	_drop VSIZE 
      008D36 52 01            [ 2]    1     addw sp,#VSIZE 
      008D38 CD               [ 4] 2406 	ret 
                                   2407 
                                   2408 ;-------------------------------
                                   2409 ;  expr ::= term [['+'|'-'] term]*
                                   2410 ;  result range {-32768..32767}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2411 ;  output:
                                   2412 ;   A    token attribute 
                                   2413 ;   X	 integer   
                                   2414 ;-------------------------------
                           000001  2415 	N1=1
                           000003  2416 	N2=3 
                           000005  2417 	OP=5 
                           000005  2418 	VSIZE=5 
      000D65                       2419 expression:
      000D65                       2420 	_vars VSIZE 
      008D39 89 2D            [ 2]    1     sub sp,#VSIZE 
      008D3B A1 02 25         [ 4] 2421 	call term
      008D3E 3D               [ 1] 2422 	tnz a 
      008D3F 6B 01            [ 1] 2423 	jreq expr_exit 
      008D41 A4 30            [ 2] 2424 1$:	ldw (N1,sp),x 
      008D43 A1 10 27         [ 4] 2425 	call next_token
      008D46 04 7B            [ 1] 2426 	ld (OP,sp),a 
      008D48 01 20            [ 1] 2427 	cp a,#CMD_END 
      008D4A 03 26            [ 1] 2428 	jrult 8$ 
      008D4B A4 30            [ 1] 2429 	and a,#TK_GRP_MASK
      008D4B CD 89            [ 1] 2430 	cp a,#TK_GRP_ADD 
      008D4D 2D 02            [ 1] 2431 	jreq 2$ 
      008D4E 20 1E            [ 2] 2432 	jra 8$
      000D80                       2433 2$: 
      008D4E A1 81 26         [ 4] 2434 	call term
      008D51 03 FD            [ 1] 2435 	cp a,#TK_INTGR
      008D53 20 32            [ 1] 2436 	jreq 3$
      008D55 CC 07 BB         [ 2] 2437 	jp syntax_error
      008D55 A1 84            [ 2] 2438 3$:	ldw (N2,sp),x 
      008D57 26 02            [ 2] 2439 	ldw x,(N1,sp)
      008D59 20 2C            [ 1] 2440 	ld a,(OP,sp)
      008D5B A1 10            [ 1] 2441 	cp a,#TK_PLUS 
      008D5B A1 06            [ 1] 2442 	jrne 4$
      008D5D 26 06 CD         [ 2] 2443 	addw x,(N2,sp)
      008D60 8D 11            [ 2] 2444 	jra 1$ 
      008D62 FE 20 22         [ 2] 2445 4$:	subw x,(N2,sp)
      008D65 20 CF            [ 2] 2446 	jra 1$
      008D65 A1 85            [ 1] 2447 8$: ld a,(OP,sp)
      008D67 26 03            [ 1] 2448 	jreq 9$ 
      000DA2                       2449 	_unget_token	
      008D69 FE 20 1B 00 01   [ 1]    1      mov in,in.saved  
      008D6C 1E 01            [ 2] 2450 9$: ldw x,(N1,sp)
      008D6C A1 07            [ 1] 2451 	ld a,#TK_INTGR	
      000DAB                       2452 expr_exit:
      000DAB                       2453 	_drop VSIZE 
      008D6E 26 0C            [ 2]    1     addw sp,#VSIZE 
      008D70 CD               [ 4] 2454 	ret 
                                   2455 
                                   2456 ;---------------------------------------------
                                   2457 ; rel ::= expr rel_op expr
                                   2458 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   2459 ;  relation return  integer , zero is false 
                                   2460 ;  output:
                                   2461 ;    A 		token attribute  
                                   2462 ;	 X		integer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2463 ;---------------------------------------------
                           000001  2464 	N1=1
                           000003  2465 	RELOP=3
                           000003  2466 	VSIZE=3 
      000DAE                       2467 relation: 
      000DAE                       2468 	_vars VSIZE
      008D71 8E 2E            [ 2]    1     sub sp,#VSIZE 
      008D73 89 A6 08         [ 4] 2469 	call expression
      008D76 CD               [ 1] 2470 	tnz a 
      008D77 8C D4            [ 1] 2471 	jreq rel_exit
      008D79 85 20            [ 2] 2472 	ldw (N1,sp),x 
                                   2473 ; expect rel_op or leave 
      008D7B 0B 08 AD         [ 4] 2474 	call next_token 
      008D7C 6B 03            [ 1] 2475 	ld (RELOP,sp),a 
      008D7C 4D 27            [ 1] 2476 	and a,#TK_GRP_MASK
      008D7E 11 55            [ 1] 2477 	cp a,#TK_GRP_RELOP 
      008D80 00 03            [ 1] 2478 	jrne 8$
      000DC3                       2479 2$:	; expect another expression
      008D82 00 02 4F         [ 4] 2480 	call expression
      008D85 20 09            [ 1] 2481 	cp a,#TK_INTGR
      008D87 27 03            [ 1] 2482 	jreq 3$
      008D87 A6 11 11         [ 2] 2483 	jp syntax_error 
      008D8A 01 26 01         [ 2] 2484 3$:	ldw acc16,x 
      008D8D 50 01            [ 2] 2485 	ldw x,(N1,sp) 
      008D8E 72 B0 00 0C      [ 2] 2486 	subw x,acc16
      008D8E A6 84            [ 1] 2487 	jrne 4$
      008D90 35 02 00 0D      [ 1] 2488 	mov acc8,#2 ; n1==n2
      008D90 5B 01            [ 2] 2489 	jra 6$ 
      000DDE                       2490 4$: 
      008D92 81 06            [ 1] 2491 	jrsgt 5$  
      008D93 35 04 00 0D      [ 1] 2492 	mov acc8,#4 ; n1<2 
      008D93 52 03            [ 2] 2493 	jra 6$
      000DE6                       2494 5$:
      008D95 CD 8D 36 4D      [ 1] 2495 	mov acc8,#1 ; n1>n2 
      000DEA                       2496 6$:
      008D99 27               [ 1] 2497 	clrw x 
      008D9A 47 00 0D         [ 1] 2498 	ld a, acc8  
      008D9B 14 03            [ 1] 2499 	and a,(RELOP,sp)
      008D9B 1F               [ 1] 2500 	tnz a 
      008D9C 01 CD            [ 1] 2501 	jreq 10$
      008D9E 89               [ 1] 2502 	incw x 
      008D9F 2D 6B            [ 2] 2503 	jra 10$  	
      008DA1 03 A1            [ 1] 2504 8$: ld a,(RELOP,sp)
      008DA3 02 25            [ 1] 2505 	jreq 9$
      000DFA                       2506 	_unget_token
      008DA5 2F A4 30 A1 20   [ 1]    1      mov in,in.saved  
      000DFF                       2507 9$: 
      008DAA 27 02            [ 2] 2508 	ldw x,(N1,sp)
      000E01                       2509 10$:
      008DAC 20 27            [ 1] 2510 	ld a,#TK_INTGR
      008DAE                       2511 rel_exit:
      000E03                       2512 	_drop VSIZE
      008DAE CD 8D            [ 2]    1     addw sp,#VSIZE 
      008DB0 36               [ 4] 2513 	ret 
                                   2514 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2515 ;--------------------------------
                                   2516 ; BASIC: SHOW 
                                   2517 ; print stack content in hexadecimal bytes 
                                   2518 ; 16 bytes per row 
                                   2519 ;--------------------------------
      000E06                       2520 show:
      008DB1 A1 84 27         [ 2] 2521 	ldw x,#cstk_prompt
      008DB4 03 CC 88         [ 4] 2522 	call puts 
      008DB7 3B               [ 1] 2523 	ldw x,sp 
      008DB8 90 93 1E         [ 2] 2524 	addw x,#3 ; ignore return address
      008DBB 01 7B 03 A1      [ 2] 2525 	ldw y,#RAM_SIZE  
      008DBF 20 26 05         [ 2] 2526 	ldw acc16,x 
      008DC2 CD 8B 97 20      [ 2] 2527 	subw y,acc16
      008DC6 D4 A1 21         [ 4] 2528 	call hex_dump
      008DC9 26               [ 1] 2529 	clr a 
      008DCA 05               [ 4] 2530 	ret
                                   2531 
      008DCB CD 8C 50 20 CB CD 8C  2532 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             66 20 C6 7B 03 27 05
             55 00 03 00 02 1E 01
             A6 84 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   2533 
                                   2534 
                                   2535 ;--------------------------------------------
                                   2536 ; BASIC: HEX 
                                   2537 ; select hexadecimal base for integer print
                                   2538 ;---------------------------------------------
      008DE2                       2539 hex_base:
      008DE2 5B 03 81 0A      [ 1] 2540 	mov base,#16 
      008DE5 81               [ 4] 2541 	ret 
                                   2542 
                                   2543 ;--------------------------------------------
                                   2544 ; BASIC: DEC 
                                   2545 ; select decimal base for integer print
                                   2546 ;---------------------------------------------
      000E4C                       2547 dec_base:
      008DE5 52 05 CD 8D      [ 1] 2548 	mov base,#10
      008DE9 93               [ 4] 2549 	ret 
                                   2550 
                                   2551 ;------------------------
                                   2552 ; BASIC: FREE 
                                   2553 ; return free size in text area
                                   2554 ; output:
                                   2555 ;   A 		TK_INTGR
                                   2556 ;   X 	    size integer
                                   2557 ;--------------------------
      000E51                       2558 free:
      008DEA 4D 27 3E         [ 2] 2559 	ldw x,#tib 
      008DED 1F 01 CD 89      [ 2] 2560 	subw x,txtend 
      008DF1 2D 6B            [ 1] 2561 	ld a,#TK_INTGR
      008DF3 05               [ 4] 2562 	ret 
                                   2563 
                                   2564 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2565 ;------------------------
                                   2566 ; BASIC: UBOUND  
                                   2567 ; return array variable size 
                                   2568 ; output:
                                   2569 ;   A 		TK_INTGR
                                   2570 ;   X 	    array size 
                                   2571 ;--------------------------
      000E5B                       2572 ubound:
      008DF4 A1 02 25         [ 2] 2573 	ldw x,#tib
      008DF7 26 A4 30 A1      [ 2] 2574 	subw x,txtend 
      008DFB 10 27 02 20      [ 2] 2575 	ldw y,basicptr 
      008DFF 1E C3 00 1E      [ 2] 2576 	cpw y,txtend 
      008E00 25 0A            [ 1] 2577 	jrult 1$
      008E00 CD 8D 93         [ 1] 2578 	push count 
      008E03 A1 84            [ 1] 2579 	push #0 
      008E05 27 03 CC         [ 2] 2580 	subw x,(1,sp)
      000E74                       2581 	_drop 2 
      008E08 88 3B            [ 2]    1     addw sp,#2 
      008E0A 1F               [ 2] 2582 1$:	srlw x 
      008E0B 03 1E 01         [ 2] 2583 	ldw array_size,x
      008E0E 7B 05            [ 1] 2584 	ld a,#TK_INTGR
      008E10 A1               [ 4] 2585 	ret 
                                   2586 
                                   2587 ;-----------------------------
                                   2588 ; BASIC: LET var=expr 
                                   2589 ; variable assignement 
                                   2590 ; output:
                                   2591 ;   A 		TK_NONE 
                                   2592 ;-----------------------------
      000E7D                       2593 let::
      008E11 10 26 05         [ 4] 2594 	call next_token 
      008E14 72 FB            [ 1] 2595 	cp a,#TK_VAR 
      008E16 03 20            [ 1] 2596 	jreq let_var
      008E18 D4 72            [ 1] 2597 	cp a,#TK_ARRAY 
      008E1A F0 03            [ 1] 2598 	jreq  let_array
      008E1C 20 CF 7B         [ 2] 2599 	jp syntax_error
      000E8B                       2600 let_array:
      008E1F 05 27 05         [ 4] 2601 	call get_array_element
      000E8E                       2602 let_var:
      008E22 55               [ 2] 2603 	pushw x  
      008E23 00 03 00         [ 4] 2604 	call next_token 
      008E26 02 1E            [ 1] 2605 	cp a,#TK_EQUAL
      008E28 01 A6            [ 1] 2606 	jreq 1$
      008E2A 84 07 BB         [ 2] 2607 	jp syntax_error
      008E2B                       2608 1$:	
      008E2B 5B 05 81         [ 4] 2609 	call relation   
      008E2E A1 84            [ 1] 2610 	cp a,#TK_INTGR 
      008E2E 52 03            [ 1] 2611 	jreq 2$
      008E30 CD 8D E5         [ 2] 2612 	jp syntax_error
      000EA3                       2613 2$:	
      008E33 4D 27            [ 1] 2614 	ldw y,x 
      008E35 4D               [ 2] 2615 	popw x   
      008E36 1F               [ 2] 2616 	ldw (x),y   
      008E37 01               [ 4] 2617 	ret 
                                   2618 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2619 ;----------------------------
                                   2620 ; BASIC: LIST [[start][,end]]
                                   2621 ; list program lines 
                                   2622 ; form start to end 
                                   2623 ; if empty argument list then 
                                   2624 ; list all.
                                   2625 ;----------------------------
                           000001  2626 	FIRST=1
                           000003  2627 	LAST=3 
                           000005  2628 	LN_PTR=5
                           000006  2629 	VSIZE=6 
      000EA8                       2630 list:
      008E38 CD 89 2D         [ 2] 2631 	ldw x,txtbgn 
      008E3B 6B 03 A4         [ 2] 2632 	cpw x,txtend 
      008E3E 30 A1            [ 1] 2633 	jrmi 1$
      008E40 30               [ 4] 2634 	ret 
      000EB1                       2635 1$:	
      000EB1                       2636 	_vars VSIZE
      008E41 26 33            [ 2]    1     sub sp,#VSIZE 
      008E43 1F 05            [ 2] 2637 	ldw (LN_PTR,sp),x 
      008E43 CD               [ 2] 2638 	ldw x,(x) 
      008E44 8D E5            [ 2] 2639 	ldw (FIRST,sp),x ; list from first line 
      008E46 A1 84 27         [ 2] 2640 	ldw x,#MAX_LINENO ; biggest line number 
      008E49 03 CC            [ 2] 2641 	ldw (LAST,sp),x 
      008E4B 88 3B CF         [ 4] 2642 	call arg_list
      008E4E 00               [ 1] 2643 	tnz a
      008E4F 0D 1E            [ 1] 2644 	jreq list_loop 
      008E51 01 72            [ 1] 2645 	cp a,#2 
      008E53 B0 00            [ 1] 2646 	jreq 4$
      008E55 0D 26            [ 1] 2647 	cp a,#1 
      008E57 06 35            [ 1] 2648 	jreq first_line 
      008E59 02 00 0E         [ 2] 2649 	jp syntax_error 
      008E5C 20               [ 2] 2650 4$:	popw x 
      008E5D 0C 05            [ 2] 2651 	ldw (LAST+2,sp),x 
      008E5E                       2652 first_line:
      008E5E 2C               [ 2] 2653 	popw x
      008E5F 06 35            [ 2] 2654 	ldw (FIRST,sp),x 
      000ED4                       2655 lines_skip:
      008E61 04 00 0E         [ 2] 2656 	ldw x,txtbgn
      008E64 20 04            [ 2] 2657 2$:	ldw (LN_PTR,sp),x 
      008E66 C3 00 1E         [ 2] 2658 	cpw x,txtend 
      008E66 35 01            [ 1] 2659 	jrpl list_exit 
      008E68 00               [ 2] 2660 	ldw x,(x) ;line# 
      008E69 0E 01            [ 2] 2661 	cpw x,(FIRST,sp)
      008E6A 2A 11            [ 1] 2662 	jrpl list_loop 
      008E6A 5F C6            [ 2] 2663 	ldw x,(LN_PTR,sp) 
      008E6C 00 0E            [ 1] 2664 	ld a,(2,x)
      008E6E 14 03 4D         [ 1] 2665 	ld acc8,a 
      008E71 27 0E 5C 20      [ 1] 2666 	clr acc16 
      008E75 0B 7B 03 27      [ 2] 2667 	addw x,acc16
      008E79 05 55            [ 2] 2668 	jra 2$ 
                                   2669 ; print loop
      000EF4                       2670 list_loop:
      008E7B 00 03            [ 2] 2671 	ldw x,(LN_PTR,sp)
      008E7D 00 02            [ 1] 2672 	ld a,(2,x) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008E7F CD 0F 24         [ 4] 2673 	call prt_basic_line
      008E7F 1E 01            [ 2] 2674 	ldw x,(LN_PTR,sp)
      008E81 E6 02            [ 1] 2675 	ld a,(2,x)
      008E81 A6 84 0D         [ 1] 2676 	ld acc8,a 
      008E83 72 5F 00 0C      [ 1] 2677 	clr acc16 
      008E83 5B 03 81 0C      [ 2] 2678 	addw x,acc16
      008E86 C3 00 1E         [ 2] 2679 	cpw x,txtend 
      008E86 AE 8E            [ 1] 2680 	jrpl list_exit
      008E88 A0 CD            [ 2] 2681 	ldw (LN_PTR,sp),x
      008E8A A2               [ 2] 2682 	ldw x,(x)
      008E8B C0 96            [ 2] 2683 	cpw x,(LAST,sp)  
      008E8D 1C 00            [ 1] 2684 	jrslt list_loop
      000F16                       2685 list_exit:
      008E8F 03 90 AE 18 00   [ 1] 2686 	mov in,count 
      008E94 CF 00 0D         [ 2] 2687 	ldw x,#pad 
      008E97 72 B2 00         [ 2] 2688 	ldw basicptr,x 
      000F21                       2689 	_drop VSIZE 
      008E9A 0D CD            [ 2]    1     addw sp,#VSIZE 
      008E9C 84               [ 4] 2690 	ret
                                   2691 
                                   2692 
                                   2693 ;--------------------------
                                   2694 ; decompile line from token list
                                   2695 ; and print it. 
                                   2696 ; input:
                                   2697 ;   A       stop at this position 
                                   2698 ;   X 		pointer at line
                                   2699 ; output:
                                   2700 ;   none 
                                   2701 ;--------------------------	
      000F24                       2702 prt_basic_line:
      008E9D 77 4F 81         [ 1] 2703 	ld count,a 
      008EA0 0A 63            [ 1] 2704 	ld a,(2,x)
      008EA2 6F 6E 74         [ 1] 2705 	cp a,count 
      008EA5 65 6E            [ 1] 2706 	jrpl 1$ 
      008EA7 74 20 6F         [ 1] 2707 	ld count,a 
      008EAA 66 20 73         [ 2] 2708 1$:	ldw basicptr,x 
      008EAD 74 61 63 6B      [ 2] 2709 	ldw y,#tib  
      008EB1 20 66 72         [ 4] 2710 	call decompile 
      008EB4 6F 6D 20         [ 4] 2711 	call puts 
      008EB7 74 6F            [ 1] 2712 	ld a,#CR 
      008EB9 70 20 74         [ 4] 2713 	call putc 
      008EBC 6F               [ 4] 2714 	ret 
                                   2715 
                                   2716 
                                   2717 
                                   2718 ;---------------------------------
                                   2719 ; BASIC: PRINT|? arg_list 
                                   2720 ; print values from argument list
                                   2721 ;----------------------------------
                           000001  2722 	COMMA=1
                           000001  2723 	VSIZE=1
      000F44                       2724 print:
      000F44                       2725 	_vars VSIZE 
      008EBD 20 62            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      000F46                       2726 reset_comma:
      008EBF 6F 74            [ 1] 2727 	clr (COMMA,sp)
      000F48                       2728 prt_loop:
      008EC1 74 6F 6D         [ 4] 2729 	call next_token
      008EC4 3A 0A            [ 1] 2730 	cp a,#CMD_END 
      008EC6 00 4F            [ 1] 2731 	jrult print_exit ; colon or end of line 
      008EC7 A1 02            [ 1] 2732 	cp a,#TK_QSTR
      008EC7 35 10            [ 1] 2733 	jreq 1$
      008EC9 00 0B            [ 1] 2734 	cp a,#TK_CHAR 
      008ECB 81 13            [ 1] 2735 	jreq 2$ 
      008ECC A1 82            [ 1] 2736 	cp a,#TK_CFUNC 
      008ECC 35 0A            [ 1] 2737 	jreq 3$
      008ECE 00 0B            [ 1] 2738 	cp a,#TK_COMMA 
      008ED0 81 18            [ 1] 2739 	jreq 4$
      008ED1 A1 0A            [ 1] 2740 	cp a,#TK_SHARP 
      008ED1 AE 16            [ 1] 2741 	jreq 5$
      008ED3 90 72            [ 2] 2742 	jra 7$ 
      000F65                       2743 1$:	; print string 
      008ED5 B0 00 1F         [ 4] 2744 	call puts
      008ED8 A6 84            [ 2] 2745 	jra reset_comma
      000F6A                       2746 2$:	; print character 
      008EDA 81               [ 1] 2747 	ld a,xl 
      008EDB CD 03 2B         [ 4] 2748 	call putc 
      008EDB AE 16            [ 2] 2749 	jra reset_comma 
      000F70                       2750 3$: ; print character function value  	
      008EDD 90               [ 4] 2751 	call (x)
      008EDE 72               [ 1] 2752 	ld a,xl 
      008EDF B0 00 1F         [ 4] 2753 	call putc
      008EE2 90 CE            [ 2] 2754 	jra reset_comma 
      000F77                       2755 4$: ; set comma state 
      008EE4 00 05            [ 1] 2756 	cpl (COMMA,sp)
      008EE6 90 C3            [ 2] 2757 	jra prt_loop   
      000F7B                       2758 5$: ; # character must be followed by an integer   
      008EE8 00 1F 25         [ 4] 2759 	call next_token
      008EEB 0A 3B            [ 1] 2760 	cp a,#TK_INTGR 
      008EED 00 04            [ 1] 2761 	jreq 6$
      008EEF 4B 00 72         [ 2] 2762 	jp syntax_error 
      000F85                       2763 6$: ; set tab width
      008EF2 F0               [ 1] 2764 	ld a,xl 
      008EF3 01 5B            [ 1] 2765 	and a,#15 
      008EF5 02 54 CF         [ 1] 2766 	ld tab_width,a 
      008EF8 00 22            [ 2] 2767 	jra reset_comma 
      000F8D                       2768 7$:	
      000F8D                       2769 	_unget_token 
      008EFA A6 84 81 00 01   [ 1]    1      mov in,in.saved  
      008EFD CD 0D AE         [ 4] 2770 	call relation 
      008EFD CD 89            [ 1] 2771 	cp a,#TK_INTGR 
      008EFF 2D A1            [ 1] 2772 	jrne print_exit 
      008F01 85 27 0A         [ 4] 2773     call print_int 
      008F04 A1 06            [ 2] 2774 	jra reset_comma 
      000F9E                       2775 print_exit:
      008F06 27 03            [ 1] 2776 	tnz (COMMA,sp)
      008F08 CC 88            [ 1] 2777 	jrne 9$
      008F0A 3B 0D            [ 1] 2778 	ld a,#CR 
      008F0B CD 03 2B         [ 4] 2779     call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      000FA7                       2780 9$:	_drop VSIZE 
      008F0B CD 8D            [ 2]    1     addw sp,#VSIZE 
      008F0D 11               [ 4] 2781 	ret 
                                   2782 
                                   2783 ;----------------------
                                   2784 ; 'save_context' and
                                   2785 ; 'rest_context' must be 
                                   2786 ; called at the same 
                                   2787 ; call stack depth 
                                   2788 ; i.e. SP must have the 
                                   2789 ; save value at  
                                   2790 ; entry point of both 
                                   2791 ; routine. 
                                   2792 ;---------------------
                           000004  2793 	CTXT_SIZE=4 ; size of saved data 
                                   2794 ;--------------------
                                   2795 ; save current BASIC
                                   2796 ; interpreter context 
                                   2797 ; on stack 
                                   2798 ;--------------------
      008F0E                       2799 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000FAA                       2800 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      000FAA                       2801 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      000FAA                       2802 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      000FAA                       2803 save_context:
      008F0E 89 CD 89         [ 2] 2804 	ldw x,basicptr 
      008F11 2D A1            [ 2] 2805 	ldw (BPTR,sp),x
      008F13 32 27 03         [ 1] 2806 	ld a,in 
      008F16 CC 88            [ 1] 2807 	ld (IN,sp),a
      008F18 3B 00 03         [ 1] 2808 	ld a,count 
      008F19 6B 06            [ 1] 2809 	ld (CNT,sp),a  
      008F19 CD               [ 4] 2810 	ret
                                   2811 
                                   2812 ;-----------------------
                                   2813 ; restore previously saved 
                                   2814 ; BASIC interpreter context 
                                   2815 ; from stack 
                                   2816 ;-------------------------
      000FBA                       2817 rest_context:
      008F1A 8E 2E            [ 2] 2818 	ldw x,(BPTR,sp)
      008F1C A1 84 27         [ 2] 2819 	ldw basicptr,x 
      008F1F 03 CC            [ 1] 2820 	ld a,(IN,sp)
      008F21 88 3B 01         [ 1] 2821 	ld in,a
      008F23 7B 06            [ 1] 2822 	ld a,(CNT,sp)
      008F23 90 93 85         [ 1] 2823 	ld count,a  
      008F26 FF               [ 4] 2824 	ret
                                   2825 
                                   2826 
                                   2827 
                                   2828 ;------------------------------------------
                                   2829 ; BASIC: INPUT [string]var[,[string]var]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2830 ; input value in variables 
                                   2831 ; [string] optionally can be used as prompt 
                                   2832 ;-----------------------------------------
                           000001  2833 	CX_BPTR=1
                           000003  2834 	CX_IN=3
                           000004  2835 	CX_CNT=4
                           000005  2836 	SKIP=5
                           000006  2837 	VAR_ADDR=6
                           000007  2838 	VSIZE=7
      000FCA                       2839 input_var:
      000FCA                       2840 	_vars VSIZE 
      008F27 81 07            [ 2]    1     sub sp,#VSIZE 
      008F28                       2841 input_loop:
      008F28 CE 00            [ 1] 2842 	clr (SKIP,sp)
      008F2A 1D C3 00         [ 4] 2843 	call next_token 
      008F2D 1F 2B            [ 1] 2844 	cp a,#TK_QSTR 
      008F2F 01 81            [ 1] 2845 	jrne 1$ 
      008F31 CD 00 00         [ 4] 2846 	call puts 
      008F31 52 06            [ 1] 2847 	cpl (SKIP,sp)
      008F33 1F 05 FE         [ 4] 2848 	call next_token 
      008F36 1F 01            [ 1] 2849 1$: cp a,#TK_VAR  
      008F38 AE 7F            [ 1] 2850 	jreq 2$ 
      008F3A FF 1F 03         [ 2] 2851 	jp syntax_error
      008F3D CD 8C            [ 2] 2852 2$:	ldw (VAR_ADDR,sp),x 
      008F3F E6 4D            [ 1] 2853 	tnz (SKIP,sp)
      008F41 27 31            [ 1] 2854 	jrne 21$ 
      008F43 A1 02 27         [ 4] 2855 	call var_name 
      008F46 07 A1 01         [ 4] 2856 	call putc   
      000FF0                       2857 21$:
      008F49 27 06            [ 1] 2858 	ld a,#':
      008F4B CC 88 3B         [ 4] 2859 	call putc 
      008F4E 85 1F 05         [ 4] 2860 	call save_context 
      008F51 72 5F 00 03      [ 1] 2861 	clr count  
      008F51 85 1F 01         [ 4] 2862 	call readln 
      008F54 AE 16 90         [ 2] 2863 	ldw x,#tib 
      008F54 CE 00 1D         [ 1] 2864 	push count
      008F57 1F 05            [ 1] 2865 	push #0 
      008F59 C3 00 1F         [ 2] 2866 	addw x,(1,sp)
      008F5C 2A               [ 1] 2867 	incw x 
      00100B                       2868 	_drop 2 
      008F5D 38 FE            [ 2]    1     addw sp,#2 
      008F5F 13 01 2A 11      [ 1] 2869 	clr in 
      008F63 1E 05 E6         [ 4] 2870 	call get_token
      008F66 02 C7            [ 1] 2871 	cp a,#TK_INTGR
      008F68 00 0E            [ 1] 2872 	jreq 3$ 
      008F6A 72 5F 00         [ 4] 2873 	call rest_context 
      008F6D 0D 72 BB         [ 2] 2874 	jp syntax_error
      008F70 00 0D            [ 2] 2875 3$: ldw y,(VAR_ADDR,sp) 
      008F72 20 E3            [ 2] 2876 	ldw (y),x 
      008F74 CD 0F BA         [ 4] 2877 	call rest_context
      008F74 1E 05 E6         [ 4] 2878 	call next_token 
      008F77 02 CD            [ 1] 2879 	cp a,#TK_COMMA 
      008F79 8F A4            [ 1] 2880 	jreq input_loop 
      008F7B 1E 05            [ 1] 2881 	cp a,#TK_COLON 
      008F7D E6 02            [ 2] 2882     jrule input_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008F7F C7 00 0E         [ 2] 2883 	jp syntax_error 
      001033                       2884 input_exit:
      001033                       2885 	_drop VSIZE 
      008F82 72 5F            [ 2]    1     addw sp,#VSIZE 
      008F84 00               [ 4] 2886 	ret 
                                   2887 
                                   2888 
                                   2889 ;---------------------
                                   2890 ; BASIC: REMARK | ' 
                                   2891 ; skip comment to end of line 
                                   2892 ;---------------------- 
      001036                       2893 remark::
      008F85 0D 72 BB 00 0D   [ 1] 2894 	mov in,count 
      008F8A C3               [ 4] 2895  	ret 
                                   2896 
                                   2897 
                                   2898 ;---------------------
                                   2899 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2900 ; read in loop 'addr'  
                                   2901 ; apply & 'mask' to value 
                                   2902 ; loop while result==0.  
                                   2903 ; 'xor_mask' is used to 
                                   2904 ; invert the wait logic.
                                   2905 ; i.e. loop while not 0.
                                   2906 ;---------------------
                           000001  2907 	XMASK=1 
                           000002  2908 	MASK=2
                           000003  2909 	ADDR=3
                           000004  2910 	VSIZE=4
      00103C                       2911 wait: 
      00103C                       2912 	_vars VSIZE
      008F8B 00 1F            [ 2]    1     sub sp,#VSIZE 
      008F8D 2A 07            [ 1] 2913 	clr (XMASK,sp) 
      008F8F 1F 05 FE         [ 4] 2914 	call arg_list 
      008F92 13 03            [ 1] 2915 	cp a,#2
      008F94 2F DE            [ 1] 2916 	jruge 0$
      008F96 CC 07 BB         [ 2] 2917 	jp syntax_error 
      008F96 55 00            [ 1] 2918 0$:	cp a,#3
      008F98 04 00            [ 1] 2919 	jrult 1$
      008F9A 02               [ 2] 2920 	popw x 
      008F9B AE               [ 1] 2921 	ld a,xl
      008F9C 16 E0            [ 1] 2922 	ld (XMASK,sp),a 
      008F9E CF               [ 2] 2923 1$: popw x ; mask 
      008F9F 00               [ 1] 2924 	ld a,xl 
      008FA0 05 5B            [ 1] 2925 	ld (MASK,sp),a 
      008FA2 06               [ 2] 2926 	popw x ; address 
      008FA3 81               [ 1] 2927 2$:	ld a,(x)
      008FA4 14 02            [ 1] 2928 	and a,(MASK,sp)
      008FA4 C7 00            [ 1] 2929 	xor a,(XMASK,sp)
      008FA6 04 E6            [ 1] 2930 	jreq 2$ 
      00105E                       2931 	_drop VSIZE 
      008FA8 02 C1            [ 2]    1     addw sp,#VSIZE 
      008FAA 00               [ 4] 2932 	ret 
                                   2933 
                                   2934 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2935 ; BASIC: BSET addr,mask
                                   2936 ; set bits at 'addr' corresponding 
                                   2937 ; to those of 'mask' that are at 1.
                                   2938 ; arguments:
                                   2939 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2940 ;   mask        mask|addr
                                   2941 ; output:
                                   2942 ;	none 
                                   2943 ;--------------------------
      001061                       2944 bit_set:
      008FAB 04 2A 03         [ 4] 2945 	call arg_list 
      008FAE C7 00            [ 1] 2946 	cp a,#2	 
      008FB0 04 CF            [ 1] 2947 	jreq 1$ 
      008FB2 00 05 90         [ 2] 2948 	jp syntax_error
      00106B                       2949 1$: 
      008FB5 AE               [ 2] 2950 	popw x ; mask 
      008FB6 16               [ 1] 2951 	ld a,xl 
      008FB7 90               [ 2] 2952 	popw x ; addr  
      008FB8 CD               [ 1] 2953 	or a,(x)
      008FB9 AA               [ 1] 2954 	ld (x),a
      008FBA AC               [ 4] 2955 	ret 
                                   2956 
                                   2957 ;---------------------
                                   2958 ; BASIC: BRES addr,mask
                                   2959 ; reset bits at 'addr' corresponding 
                                   2960 ; to those of 'mask' that are at 1.
                                   2961 ; arguments:
                                   2962 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2963 ;   mask	    ~mask&*addr  
                                   2964 ; output:
                                   2965 ;	none 
                                   2966 ;--------------------------
      001071                       2967 bit_reset:
      008FBB CD A2 C0         [ 4] 2968 	call arg_list 
      008FBE A6 0D            [ 1] 2969 	cp a,#2  
      008FC0 CD 83            [ 1] 2970 	jreq 1$ 
      008FC2 AB 81 BB         [ 2] 2971 	jp syntax_error
      008FC4                       2972 1$: 
      008FC4 52               [ 2] 2973 	popw x ; mask 
      008FC5 01               [ 1] 2974 	ld a,xl 
      008FC6 43               [ 1] 2975 	cpl a 
      008FC6 0F               [ 2] 2976 	popw x ; addr  
      008FC7 01               [ 1] 2977 	and a,(x)
      008FC8 F7               [ 1] 2978 	ld (x),a 
      008FC8 CD               [ 4] 2979 	ret 
                                   2980 
                                   2981 ;---------------------
                                   2982 ; BASIC: BTOGL addr,mask
                                   2983 ; toggle bits at 'addr' corresponding 
                                   2984 ; to those of 'mask' that are at 1.
                                   2985 ; arguments:
                                   2986 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2987 ;   mask	    mask^*addr  
                                   2988 ; output:
                                   2989 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2990 ;--------------------------
      001082                       2991 bit_toggle:
      008FC9 89 2D A1         [ 4] 2992 	call arg_list 
      008FCC 02 25            [ 1] 2993 	cp a,#2 
      008FCE 4F A1            [ 1] 2994 	jreq 1$ 
      008FD0 02 27 12         [ 2] 2995 	jp syntax_error
      008FD3 A1               [ 2] 2996 1$: popw x ; mask 
      008FD4 03               [ 1] 2997 	ld a,xl 
      008FD5 27               [ 2] 2998 	popw x ; addr  
      008FD6 13               [ 1] 2999 	xor a,(x)
      008FD7 A1               [ 1] 3000 	ld (x),a 
      008FD8 82               [ 4] 3001 	ret 
                                   3002 
                                   3003 
                                   3004 ;---------------------
                                   3005 ; BASIC: BTEST(addr,bit)
                                   3006 ; return bit value at 'addr' 
                                   3007 ; bit is in range {0..7}.
                                   3008 ; arguments:
                                   3009 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3010 ;   bit 	    bit position {0..7}  
                                   3011 ; output:
                                   3012 ;	none 
                                   3013 ;--------------------------
      001092                       3014 bit_test:
      008FD9 27 15 A1         [ 4] 3015 	call func_args 
      008FDC 09 27            [ 1] 3016 	cp a,#2
      008FDE 18 A1            [ 1] 3017 	jreq 0$
      008FE0 0A 27 18         [ 2] 3018 	jp syntax_error
      00109C                       3019 0$:	
      008FE3 20               [ 2] 3020 	popw x 
      008FE4 28               [ 1] 3021 	ld a,xl 
      008FE5 A4 07            [ 1] 3022 	and a,#7
      008FE5 CD               [ 1] 3023 	push a   
      008FE6 A2 C0            [ 1] 3024 	ld a,#1 
      008FE8 20 DC            [ 1] 3025 1$: tnz (1,sp)
      008FEA 27 05            [ 1] 3026 	jreq 2$
      008FEA 9F               [ 1] 3027 	sll a 
      008FEB CD 83            [ 1] 3028 	dec (1,sp)
      008FED AB 20            [ 2] 3029 	jra 1$
      0010AC                       3030 2$: _drop 1 
      008FEF D6 01            [ 2]    1     addw sp,#1 
      008FF0 85               [ 2] 3031 	popw x 
      008FF0 FD               [ 1] 3032 	and a,(x)
      008FF1 9F CD            [ 1] 3033 	jreq 3$
      008FF3 83 AB            [ 1] 3034 	ld a,#1 
      008FF5 20               [ 1] 3035 3$:	clrw x 
      008FF6 CF               [ 1] 3036 	ld xl,a 
      008FF7 A6 84            [ 1] 3037 	ld a,#TK_INTGR
      008FF7 03               [ 4] 3038 	ret
                                   3039 
                                   3040 
                                   3041 ;--------------------
                                   3042 ; BASIC: POKE addr,byte
                                   3043 ; put a byte at addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3044 ;--------------------
      0010B9                       3045 poke:
      008FF8 01 20 CD         [ 4] 3046 	call arg_list 
      008FFB A1 02            [ 1] 3047 	cp a,#2
      008FFB CD 89            [ 1] 3048 	jreq 1$
      008FFD 2D A1 84         [ 2] 3049 	jp syntax_error
      0010C3                       3050 1$:	
      009000 27               [ 2] 3051 	popw x  
      009001 03               [ 1] 3052     ld a,xl 
      009002 CC               [ 2] 3053 	popw x 
      009003 88               [ 1] 3054 	ld (x),a 
      009004 3B               [ 4] 3055 	ret 
                                   3056 
                                   3057 ;-----------------------
                                   3058 ; BASIC: PEEK(addr)
                                   3059 ; get the byte at addr 
                                   3060 ; input:
                                   3061 ;	none 
                                   3062 ; output:
                                   3063 ;	X 		value 
                                   3064 ;-----------------------
      009005                       3065 peek:
      009005 9F A4 0F         [ 4] 3066 	call func_args
      009008 C7 00            [ 1] 3067 	cp a,#1 
      00900A 25 20            [ 1] 3068 	jreq 1$
      00900C B9 07 BB         [ 2] 3069 	jp syntax_error
      00900D 85               [ 2] 3070 1$: popw x 
      00900D 55               [ 1] 3071 	ld a,(x)
      00900E 00               [ 1] 3072 	clrw x 
      00900F 03               [ 1] 3073 	ld xl,a 
      009010 00 02            [ 1] 3074 	ld a,#TK_INTGR
      009012 CD               [ 4] 3075 	ret 
                                   3076 
                                   3077 ;---------------------------
                                   3078 ; BASIC IF expr : instructions
                                   3079 ; evaluate expr and if true 
                                   3080 ; execute instructions on same line. 
                                   3081 ;----------------------------
      0010D9                       3082 if: 
      009013 8E 2E A1         [ 4] 3083 	call relation 
      009016 84 26            [ 1] 3084 	cp a,#TK_INTGR
      009018 05 CD            [ 1] 3085 	jreq 1$ 
      00901A 89 8E 20         [ 2] 3086 	jp syntax_error
      00901D A8               [ 1] 3087 1$:	clr a 
      00901E 5D               [ 2] 3088 	tnzw x 
      00901E 0D 01            [ 1] 3089 	jrne 9$  
                                   3090 ;skip to next line
      009020 26 05 A6 0D CD   [ 1] 3091 	mov in,count
      009025 83               [ 4] 3092 9$:	ret 
                                   3093 
                                   3094 ;------------------------
                                   3095 ; BASIC: FOR var=expr 
                                   3096 ; set variable to expression 
                                   3097 ; leave variable address 
                                   3098 ; on stack and set
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3099 ; FLOOP bit in 'flags'
                                   3100 ;-----------------
                           000001  3101 	RETL1=1 ; return address  
                           000003  3102 	FSTEP=3  ; variable increment
                           000005  3103 	LIMIT=5 ; loop limit 
                           000007  3104 	CVAR=7   ; control variable 
                           000009  3105 	INW=9   ;  in.w saved
                           00000B  3106 	BPTR=11 ; baseptr saved
                           00000A  3107 	VSIZE=10  
      0010ED                       3108 for: ; { -- var_addr }
      009026 AB               [ 2] 3109 	popw x ; call return address 
      0010EE                       3110 	_vars VSIZE 
      009027 5B 01            [ 2]    1     sub sp,#VSIZE 
      009029 81               [ 2] 3111 	pushw x  ; RETL1 
      00902A A6 85            [ 1] 3112 	ld a,#TK_VAR 
      00902A CE 00 05         [ 4] 3113 	call expect
      00902D 1F 03            [ 2] 3114 	ldw (CVAR,sp),x  ; control variable 
      00902F C6 00 02         [ 4] 3115 	call let_var 
      009032 6B 05 C6 00      [ 1] 3116 	bset flags,#FLOOP 
                                   3117 ; open space on stack for loop data 
      009036 04               [ 1] 3118 	clrw x 
      009037 6B 06            [ 2] 3119 	ldw (BPTR,sp),x 
      009039 81 09            [ 2] 3120 	ldw (INW,sp),x 
      00903A CD 08 AD         [ 4] 3121 	call next_token 
      00903A 1E 03            [ 1] 3122 	cp a,#TK_CMD 
      00903C CF 00            [ 1] 3123 	jreq 1$
      00903E 05 7B 05         [ 2] 3124 	jp syntax_error
      00110E                       3125 1$:  
      009041 C7 00 02         [ 2] 3126 	cpw x,#to 
      009044 7B 06            [ 1] 3127 	jreq to
      009046 C7 00 04         [ 2] 3128 	jp syntax_error 
                                   3129 
                                   3130 ;-----------------------------------
                                   3131 ; BASIC: TO expr 
                                   3132 ; second part of FOR loop initilization
                                   3133 ; leave limit on stack and set 
                                   3134 ; FTO bit in 'flags'
                                   3135 ;-----------------------------------
      001116                       3136 to: ; { var_addr -- var_addr limit step }
      009049 81 04 00 23 03   [ 2] 3137 	btjt flags,#FLOOP,1$
      00904A CC 07 BB         [ 2] 3138 	jp syntax_error
      00904A 52 07 AE         [ 4] 3139 1$: call relation  
      00904C A1 84            [ 1] 3140 	cp a,#TK_INTGR 
      00904C 0F 05            [ 1] 3141 	jreq 2$ 
      00904E CD 89 2D         [ 2] 3142 	jp syntax_error
      009051 A1 02            [ 2] 3143 2$: ldw (LIMIT,sp),x
                                   3144 ;	ldw x,in.w 
      009053 26 08 CD         [ 4] 3145 	call next_token
      009056 A2 C0            [ 1] 3146 	cp a,#TK_NONE  
      009058 03 05            [ 1] 3147 	jreq 4$ 
      00905A CD 89            [ 1] 3148 	cp a,#TK_CMD
      00905C 2D A1            [ 1] 3149 	jrne 3$
      00905E 85 27 03         [ 2] 3150 	cpw x,#step 
      009061 CC 88            [ 1] 3151 	jreq step
      00113A                       3152 3$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00113A                       3153 	_unget_token   	 
      009063 3B 1F 06 0D 05   [ 1]    1      mov in,in.saved  
      00113F                       3154 4$:	
      009068 26 06 CD         [ 2] 3155 	ldw x,#1   ; default step  
      00906B AA 83            [ 2] 3156 	ldw (FSTEP,sp),x 
      00906D CD 83            [ 2] 3157 	jra store_loop_addr 
                                   3158 
                                   3159 
                                   3160 ;----------------------------------
                                   3161 ; BASIC: STEP expr 
                                   3162 ; optional third par of FOR loop
                                   3163 ; initialization. 	
                                   3164 ;------------------------------------
      001146                       3165 step: ; {var limit -- var limit step}
      00906F AB 04 00 23 03   [ 2] 3166 	btjt flags,#FLOOP,1$
      009070 CC 07 BB         [ 2] 3167 	jp syntax_error
      009070 A6 3A CD         [ 4] 3168 1$: call relation
      009073 83 AB            [ 1] 3169 	cp a,#TK_INTGR
      009075 CD 90            [ 1] 3170 	jreq 2$
      009077 2A 72 5F         [ 2] 3171 	jp syntax_error
      00907A 00 04            [ 2] 3172 2$:	ldw (FSTEP,sp),x ; step
                                   3173 ; leave loop back entry point on cstack 
                                   3174 ; cstack is 1 call deep from interpreter
      00115A                       3175 store_loop_addr:
      00907C CD A3 C5         [ 2] 3176 	ldw x,basicptr  
      00907F AE 16            [ 2] 3177 	ldw (BPTR,sp),x 
      009081 90 3B 00         [ 2] 3178 	ldw x,in.w 
      009084 04 4B            [ 2] 3179 	ldw (INW,sp),x   
      009086 00 72 FB 01      [ 1] 3180 	bres flags,#FLOOP 
      00908A 5C 5B 02 72      [ 1] 3181 	inc loop_depth  
      00908E 5F               [ 4] 3182 	ret 
                                   3183 
                                   3184 ;--------------------------------
                                   3185 ; BASIC: NEXT var 
                                   3186 ; FOR loop control 
                                   3187 ; increment variable with step 
                                   3188 ; and compare with limit 
                                   3189 ; loop if threshold not crossed.
                                   3190 ; else stack. 
                                   3191 ; and decrement 'loop_depth' 
                                   3192 ;--------------------------------
      00116D                       3193 next: ; {var limit step retl1 -- [var limit step ] }
      00908F 00 02 CD A7      [ 1] 3194 	tnz loop_depth 
      009093 D7 A1            [ 1] 3195 	jrne 1$ 
      009095 84 27 06         [ 2] 3196 	jp syntax_error 
      001176                       3197 1$: 
      009098 CD 90            [ 1] 3198 	ld a,#TK_VAR 
      00909A 3A CC 88         [ 4] 3199 	call expect
                                   3200 ; check for good variable after NEXT 	 
      00909D 3B 16            [ 2] 3201 	cpw x,(CVAR,sp)
      00909F 06 90            [ 1] 3202 	jreq 2$  
      0090A1 FF CD 90         [ 2] 3203 	jp syntax_error ; not the good one 
      001182                       3204 2$: ; increment variable 
      0090A4 3A               [ 2] 3205 	ldw x,(x)  ; get var value 
      0090A5 CD 89 2D         [ 2] 3206 	addw x,(FSTEP,sp) ; var+step 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0090A8 A1 09            [ 2] 3207 	ldw y,(CVAR,sp)
      0090AA 27 A0            [ 2] 3208 	ldw (y),x ; save var new value 
                                   3209 ; check sign of STEP  
      0090AC A1 01            [ 1] 3210 	ld a,#0x80
      0090AE 23 03            [ 1] 3211 	bcp a,(FSTEP,sp)
      0090B0 CC 88            [ 1] 3212 	jrpl 4$
                                   3213 ;negative step 
      0090B2 3B 05            [ 2] 3214 	cpw x,(LIMIT,sp)
      0090B3 2F 1B            [ 1] 3215 	jrslt loop_done
      0090B3 5B 07            [ 2] 3216 	jra loop_back 
      001196                       3217 4$: ; positive step
      0090B5 81 05            [ 2] 3218 	cpw x,(LIMIT,sp)
      0090B6 2C 15            [ 1] 3219 	jrsgt loop_done
      00119A                       3220 loop_back:
      0090B6 55 00            [ 2] 3221 	ldw x,(BPTR,sp)
      0090B8 04 00 02         [ 2] 3222 	ldw basicptr,x 
      0090BB 81 01 00 23 05   [ 2] 3223 	btjf flags,#FRUN,1$ 
      0090BC E6 02            [ 1] 3224 	ld a,(2,x)
      0090BC 52 04 0F         [ 1] 3225 	ld count,a
      0090BF 01 CD            [ 2] 3226 1$:	ldw x,(INW,sp)
      0090C1 8C E6 A1         [ 2] 3227 	ldw in.w,x 
      0090C4 02               [ 4] 3228 	ret 
      0011AF                       3229 loop_done:
                                   3230 	; remove loop data from stack  
      0090C5 24               [ 2] 3231 	popw x
      0011B0                       3232 	_drop VSIZE 
      0090C6 03 CC            [ 2]    1     addw sp,#VSIZE 
      0090C8 88 3B A1 03      [ 1] 3233 	dec loop_depth 
                                   3234 ;	pushw x 
                                   3235 ;	ret 
      0090CC 25               [ 2] 3236 	jp (x)
                                   3237 
                                   3238 ;----------------------------
                                   3239 ; called by goto/gosub
                                   3240 ; to get target line number 
                                   3241 ;---------------------------
      0011B7                       3242 get_target_line:
      0090CD 04 85 9F         [ 4] 3243 	call relation 
      0090D0 6B 01            [ 1] 3244 	cp a,#TK_INTGR
      0090D2 85 9F            [ 1] 3245 	jreq 1$
      0090D4 6B 02 85         [ 2] 3246 	jp syntax_error
      0090D7 F6 14 02         [ 4] 3247 1$:	call search_lineno  
      0090DA 18               [ 2] 3248 	tnzw x 
      0090DB 01 27            [ 1] 3249 	jrne 2$ 
      0090DD F9 5B            [ 1] 3250 	ld a,#ERR_NO_LINE 
      0090DF 04 81 BD         [ 2] 3251 	jp tb_error 
      0090E1 81               [ 4] 3252 2$:	ret 
                                   3253 
                                   3254 ;------------------------
                                   3255 ; BASIC: GOTO line# 
                                   3256 ; jump to line# 
                                   3257 ; here cstack is 2 call deep from interpreter 
                                   3258 ;------------------------
      0011CD                       3259 goto:
      0090E1 CD 8C E6 A1 02   [ 2] 3260 	btjt flags,#FRUN,0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0090E6 27 03            [ 1] 3261 	ld a,#ERR_RUN_ONLY
      0090E8 CC 88 3B         [ 2] 3262 	jp tb_error 
      0090EB 81               [ 4] 3263 	ret 
      0090EB 85 9F 85         [ 4] 3264 0$:	call get_target_line
      0011DB                       3265 jp_to_target:
      0090EE FA F7 81         [ 2] 3266 	ldw basicptr,x 
      0090F1 E6 02            [ 1] 3267 	ld a,(2,x)
      0090F1 CD 8C E6         [ 1] 3268 	ld count,a 
      0090F4 A1 02 27 03      [ 1] 3269 	mov in,#3 
      0090F8 CC               [ 4] 3270 	ret 
                                   3271 
                                   3272 
                                   3273 ;--------------------
                                   3274 ; BASIC: GOSUB line#
                                   3275 ; basic subroutine call
                                   3276 ; actual line# and basicptr 
                                   3277 ; are saved on cstack
                                   3278 ; here cstack is 2 call deep from interpreter 
                                   3279 ;--------------------
                           000003  3280 	RET_ADDR=3
                           000005  3281 	RET_INW=5
                           000004  3282 	VSIZE=4  
      0011E8                       3283 gosub:
      0090F9 88 3B 00 23 06   [ 2] 3284 	btjt flags,#FRUN,0$ 
      0090FB A6 06            [ 1] 3285 	ld a,#ERR_RUN_ONLY
      0090FB 85 9F 43         [ 2] 3286 	jp tb_error 
      0090FE 85               [ 4] 3287 	ret 
      0090FF F4               [ 2] 3288 0$:	popw x 
      0011F4                       3289 	_vars VSIZE  
      009100 F7 81            [ 2]    1     sub sp,#VSIZE 
      009102 89               [ 2] 3290 	pushw x 
      009102 CD 8C E6         [ 2] 3291 	ldw x,basicptr
      009105 A1 02            [ 2] 3292 	ldw (RET_ADDR,sp),x 
      009107 27 03 CC         [ 4] 3293 	call get_target_line  
      00910A 88               [ 2] 3294 	pushw x 
      00910B 3B 85 9F         [ 2] 3295 	ldw x,in.w 
      00910E 85 F8            [ 2] 3296 	ldw (RET_INW+2,sp),x
      009110 F7               [ 2] 3297 	popw x 
      009111 81 D3            [ 2] 3298 	jra jp_to_target
                                   3299 
                                   3300 ;------------------------
                                   3301 ; BASIC: RETURN 
                                   3302 ; exit from a subroutine 
                                   3303 ; 
                                   3304 ;------------------------
      009112                       3305 return:
      009112 CD 8C E1 A1 02   [ 2] 3306 	btjt flags,#FRUN,0$ 
      009117 27 03            [ 1] 3307 	ld a,#ERR_RUN_ONLY
      009119 CC 88 3B         [ 2] 3308 	jp tb_error 
      00911C                       3309 0$:	
      00911C 85 9F            [ 2] 3310 	ldw x,(RET_ADDR,sp) 
      00911E A4 07 88         [ 2] 3311 	ldw basicptr,x
      009121 A6 01            [ 1] 3312 	ld a,(2,x)
      009123 0D 01 27         [ 1] 3313 	ld count,a  
      009126 05 48            [ 2] 3314 	ldw x,(RET_INW,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009128 0A 01 20         [ 2] 3315 	ldw in.w,x 
      00912B F7               [ 2] 3316 	popw x 
      001222                       3317 	_drop VSIZE 
      00912C 5B 01            [ 2]    1     addw sp,#VSIZE 
      00912E 85               [ 2] 3318 	pushw x
      00912F F4               [ 4] 3319 	ret  
                                   3320 
                                   3321 
                                   3322 ;----------------------------------
                                   3323 ; BASIC: RUN
                                   3324 ; run BASIC program in RAM
                                   3325 ;----------------------------------- 
      001226                       3326 run: 
      009130 27 02 A6 01 5F   [ 2] 3327 	btjf flags,#FRUN,0$  
      009135 97               [ 1] 3328 	clr a 
      009136 A6               [ 4] 3329 	ret
      00122D                       3330 0$: 
      009137 84 81 00 23 12   [ 2] 3331 	btjf flags,#FBREAK,1$
      009139                       3332 	_drop 2 
      009139 CD 8C            [ 2]    1     addw sp,#2 
      00913B E6 A1 02         [ 4] 3333 	call rest_context
      001237                       3334 	_drop CTXT_SIZE 
      00913E 27 03            [ 2]    1     addw sp,#CTXT_SIZE 
      009140 CC 88 3B 23      [ 1] 3335 	bres flags,#FBREAK 
      009143 72 10 00 23      [ 1] 3336 	bset flags,#FRUN 
      009143 85 9F 85         [ 2] 3337 	jp interpreter 
      009146 F7 81 1C         [ 2] 3338 1$:	ldw x,txtbgn
      009148 C3 00 1E         [ 2] 3339 	cpw x,txtend 
      009148 CD 8C            [ 1] 3340 	jrmi run_it 
      00914A E1 A1 01         [ 2] 3341 	ldw x,#err_no_prog
      00914D 27 03 CC         [ 4] 3342 	call puts 
      009150 88 3B 85 F6 5F   [ 1] 3343 	mov in,count
      009155 97               [ 4] 3344 	ret 
      001258                       3345 run_it:	 
      009156 A6 84 81         [ 4] 3346     call ubound 
      009159                       3347 	_drop 2 ; drop return address 
      009159 CD 8E            [ 2]    1     addw sp,#2 
                                   3348 ; clear data pointer 
      00915B 2E               [ 1] 3349 	clrw x 
      00915C A1 84 27         [ 2] 3350 	ldw data_ptr,x 
      00915F 03 CC 88 3B      [ 1] 3351 	clr data_ofs 
      009163 4F 5D 26 05      [ 1] 3352 	clr data_len 
                                   3353 ; initialize BASIC pointer 
      009167 55 00 04         [ 2] 3354 	ldw x,txtbgn 
      00916A 00 02 81         [ 2] 3355 	ldw basicptr,x 
      00916D E6 02            [ 1] 3356 	ld a,(2,x)
      00916D 85 52 0A         [ 1] 3357 	ld count,a
      009170 89 A6 85 CD      [ 1] 3358 	mov in,#3	
      009174 8C D4 1F 07      [ 1] 3359 	bset flags,#FRUN 
      009178 CD 8F 0E         [ 2] 3360 	jp interpreter 
                                   3361 
                                   3362 
                                   3363 ;----------------------
                                   3364 ; BASIC: END
                                   3365 ; end running program
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3366 ;---------------------- 
      00127F                       3367 cmd_end: 
                                   3368 ; clean stack 
      00917B 72 14 00         [ 2] 3369 	ldw x,#STACK_EMPTY
      00917E 24               [ 1] 3370 	ldw sp,x 
      00917F 5F 1F 0B         [ 2] 3371 	jp warm_start
                                   3372 
                                   3373 ;-----------------
                                   3374 ; 1 Khz beep 
                                   3375 ;-----------------
      001286                       3376 beep_1khz:: 
      009182 1F 09 CD         [ 2] 3377 	ldw x,#100
      009185 89 2D A1 80      [ 2] 3378 	ldw y,#1000
      009189 27 03            [ 2] 3379 	jra beep
                                   3380 
                                   3381 ;-----------------------
                                   3382 ; BASIC: TONE expr1,expr2
                                   3383 ; used TIMER2 channel 1
                                   3384 ; to produce a tone 
                                   3385 ; arguments:
                                   3386 ;    expr1   frequency 
                                   3387 ;    expr2   duration msec.
                                   3388 ;---------------------------
      00128F                       3389 tone:
      00918B CC 88 3B         [ 4] 3390 	call arg_list 
      00918E A1 02            [ 1] 3391 	cp a,#2 
      00918E A3 91            [ 1] 3392 	jreq 1$
      009190 96 27 03         [ 2] 3393 	jp syntax_error 
      001299                       3394 1$: 
      009193 CC               [ 2] 3395 	popw x ; duration
      009194 88 3B            [ 2] 3396 	popw y ; frequency 
      009196                       3397 beep:  
      009196 72               [ 2] 3398 	pushw x 
      009197 04 00 24         [ 2] 3399 	ldw x,#TIM2_CLK_FREQ
      00919A 03               [ 2] 3400 	divw x,y 
                                   3401 ; round to nearest integer 
      00919B CC 88 3B CD      [ 2] 3402 	cpw y,#TIM2_CLK_FREQ/2
      00919F 8E 2E            [ 1] 3403 	jrmi 2$
      0091A1 A1               [ 1] 3404 	incw x 
      0012A8                       3405 2$:	 
      0091A2 84               [ 1] 3406 	ld a,xh 
      0091A3 27 03 CC         [ 1] 3407 	ld TIM2_ARRH,a 
      0091A6 88               [ 1] 3408 	ld a,xl 
      0091A7 3B 1F 05         [ 1] 3409 	ld TIM2_ARRL,a 
                                   3410 ; 50% duty cycle 
      0091AA CD               [ 1] 3411 	ccf 
      0091AB 89               [ 2] 3412 	rrcw x 
      0091AC 2D               [ 1] 3413 	ld a,xh 
      0091AD A1 00 27         [ 1] 3414 	ld TIM2_CCR1H,a 
      0091B0 0E               [ 1] 3415 	ld a,xl
      0091B1 A1 80 26         [ 1] 3416 	ld TIM2_CCR1L,a
      0091B4 05 A3 91 C6      [ 1] 3417 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0091B8 27 0C 53 00      [ 1] 3418 	bset TIM2_CR1,#TIM2_CR1_CEN
      0091BA 72 10 53 04      [ 1] 3419 	bset TIM2_EGR,#TIM2_EGR_UG
      0091BA 55               [ 2] 3420 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0091BB 00 03 00         [ 4] 3421 	call pause02
      0091BE 02 11 53 08      [ 1] 3422 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0091BF 72 11 53 00      [ 1] 3423 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0091BF AE               [ 4] 3424 	ret 
                                   3425 
                                   3426 ;-------------------------------
                                   3427 ; BASIC: ADCON 0|1 [,divisor]  
                                   3428 ; disable/enanble ADC 
                                   3429 ;-------------------------------
                           000003  3430 	ONOFF=3 
                           000001  3431 	DIVSOR=1
                           000004  3432 	VSIZE=4 
      0012D3                       3433 power_adc:
      0091C0 00 01 1F         [ 4] 3434 	call arg_list 
      0091C3 03 20            [ 1] 3435 	cp a,#2	
      0091C5 14 0B            [ 1] 3436 	jreq 1$
      0091C6 A1 01            [ 1] 3437 	cp a,#1 
      0091C6 72 04            [ 1] 3438 	jreq 0$ 
      0091C8 00 24 03         [ 2] 3439 	jp syntax_error 
      0091CB CC 88 3B         [ 2] 3440 0$: ldw x,#0
      0091CE CD               [ 2] 3441 	pushw x  ; divisor 
      0091CF 8E 2E            [ 2] 3442 1$: ldw x,(ONOFF,sp)
      0091D1 A1               [ 2] 3443 	tnzw x 
      0091D2 84 27            [ 1] 3444 	jreq 2$ 
      0091D4 03 CC            [ 2] 3445 	ldw x,(DIVSOR,sp) ; divisor 
      0091D6 88               [ 1] 3446 	ld a,xl
      0091D7 3B 1F            [ 1] 3447 	and a,#7
      0091D9 03               [ 1] 3448 	swap a 
      0091DA C7 54 01         [ 1] 3449 	ld ADC_CR1,a
      0091DA CE 00 05 1F      [ 1] 3450 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0091DE 0B CE 00 01      [ 1] 3451 	bset ADC_CR1,#ADC_CR1_ADON 
      0012FB                       3452 	_usec_dly 7 
      0091E2 1F 09 72         [ 2]    1     ldw x,#(16*7-2)/4
      0091E5 15               [ 2]    2     decw x
      0091E6 00               [ 1]    3     nop 
      0091E7 24 72            [ 1]    4     jrne .-4
      0091E9 5C 00            [ 2] 3453 	jra 3$
      0091EB 21 81 54 01      [ 1] 3454 2$: bres ADC_CR1,#ADC_CR1_ADON
      0091ED 72 17 50 CA      [ 1] 3455 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00130C                       3456 3$:	_drop VSIZE 
      0091ED 72 5D            [ 2]    1     addw sp,#VSIZE 
      0091EF 00               [ 4] 3457 	ret
                                   3458 
                                   3459 ;-----------------------------
                                   3460 ; BASIC: ADCREAD (channel)
                                   3461 ; read adc channel {0..5}
                                   3462 ; output:
                                   3463 ;   A 		TK_INTGR 
                                   3464 ;   X 		value 
                                   3465 ;-----------------------------
      00130F                       3466 analog_read:
      0091F0 21 26 03         [ 4] 3467 	call func_args 
      0091F3 CC 88            [ 1] 3468 	cp a,#1 
      0091F5 3B 03            [ 1] 3469 	jreq 1$
      0091F6 CC 07 BB         [ 2] 3470 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0091F6 A6               [ 2] 3471 1$: popw x 
      0091F7 85 CD 8C         [ 2] 3472 	cpw x,#5 
      0091FA D4 13            [ 2] 3473 	jrule 2$
      0091FC 07 27            [ 1] 3474 	ld a,#ERR_BAD_VALUE
      0091FE 03 CC 88         [ 2] 3475 	jp tb_error 
      009201 3B               [ 1] 3476 2$: ld a,xl
      009202 C7 00 0D         [ 1] 3477 	ld acc8,a 
      009202 FE 72            [ 1] 3478 	ld a,#5
      009204 FB 03 16         [ 1] 3479 	sub a,acc8 
      009207 07 90 FF         [ 1] 3480 	ld ADC_CSR,a
      00920A A6 80 15 03      [ 1] 3481 	bset ADC_CR2,#ADC_CR2_ALIGN
      00920E 2A 06 13 05      [ 1] 3482 	bset ADC_CR1,#ADC_CR1_ADON
      009212 2F 1B 20 04 FB   [ 2] 3483 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009216 CE 54 04         [ 2] 3484 	ldw x,ADC_DRH
      009216 13 05            [ 1] 3485 	ld a,#TK_INTGR
      009218 2C               [ 4] 3486 	ret 
                                   3487 
                                   3488 ;-----------------------
                                   3489 ; BASIC: DREAD(pin)
                                   3490 ; Arduino pins 
                                   3491 ; read state of a digital pin 
                                   3492 ; pin# {0..15}
                                   3493 ; output:
                                   3494 ;    A 		TK_INTGR
                                   3495 ;    X      0|1 
                                   3496 ;-------------------------
                           000001  3497 	PINNO=1
                           000001  3498 	VSIZE=1
      001343                       3499 digital_read:
      001343                       3500 	_vars VSIZE 
      009219 15 01            [ 2]    1     sub sp,#VSIZE 
      00921A CD 0C 61         [ 4] 3501 	call func_args
      00921A 1E 0B            [ 1] 3502 	cp a,#1
      00921C CF 00            [ 1] 3503 	jreq 1$
      00921E 05 72 01         [ 2] 3504 	jp syntax_error
      009221 00               [ 2] 3505 1$: popw x 
      009222 24 05 E6         [ 2] 3506 	cpw x,#15 
      009225 02 C7            [ 2] 3507 	jrule 2$
      009227 00 04            [ 1] 3508 	ld a,#ERR_BAD_VALUE
      009229 1E 09 CF         [ 2] 3509 	jp tb_error 
      00922C 00 01 81         [ 4] 3510 2$:	call select_pin 
      00922F 6B 01            [ 1] 3511 	ld (PINNO,sp),a
      00922F 85 5B            [ 1] 3512 	ld a,(GPIO_IDR,x)
      009231 0A 72            [ 1] 3513 	tnz (PINNO,sp)
      009233 5A 00            [ 1] 3514 	jreq 8$
      009235 21               [ 1] 3515 3$: srl a 
      009236 FC 01            [ 1] 3516 	dec (PINNO,sp)
      009237 26 FB            [ 1] 3517 	jrne 3$ 
      009237 CD 8E            [ 1] 3518 8$: and a,#1 
      009239 2E               [ 1] 3519 	clrw x 
      00923A A1               [ 1] 3520 	ld xl,a 
      00923B 84 27            [ 1] 3521 	ld a,#TK_INTGR
      001370                       3522 	_drop VSIZE
      00923D 03 CC            [ 2]    1     addw sp,#VSIZE 
      00923F 88               [ 4] 3523 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3524 
                                   3525 ;-----------------------
                                   3526 ; BASIC: DWRITE pin,0|1
                                   3527 ; Arduino pins 
                                   3528 ; write to a digital pin 
                                   3529 ; pin# {0..15}
                                   3530 ; output:
                                   3531 ;    A 		TK_INTGR
                                   3532 ;    X      0|1 
                                   3533 ;-------------------------
                           000001  3534 	PINNO=1
                           000002  3535 	PINVAL=2
                           000002  3536 	VSIZE=2
      001373                       3537 digital_write:
      001373                       3538 	_vars VSIZE 
      009240 3B CD            [ 2]    1     sub sp,#VSIZE 
      009242 A5 A8 5D         [ 4] 3539 	call arg_list  
      009245 26 05            [ 1] 3540 	cp a,#2 
      009247 A6 05            [ 1] 3541 	jreq 1$
      009249 CC 88 3D         [ 2] 3542 	jp syntax_error
      00924C 81               [ 2] 3543 1$: popw x 
      00924D 9F               [ 1] 3544 	ld a,xl 
      00924D 72 00            [ 1] 3545 	ld (PINVAL,sp),a
      00924F 00               [ 2] 3546 	popw x 
      009250 24 06 A6         [ 2] 3547 	cpw x,#15 
      009253 06 CC            [ 2] 3548 	jrule 2$
      009255 88 3D            [ 1] 3549 	ld a,#ERR_BAD_VALUE
      009257 81 CD 92         [ 2] 3550 	jp tb_error 
      00925A 37 19 93         [ 4] 3551 2$:	call select_pin 
      00925B 6B 01            [ 1] 3552 	ld (PINNO,sp),a 
      00925B CF 00            [ 1] 3553 	ld a,#1
      00925D 05 E6            [ 1] 3554 	tnz (PINNO,sp)
      00925F 02 C7            [ 1] 3555 	jreq 4$
      009261 00               [ 1] 3556 3$: sll a
      009262 04 35            [ 1] 3557 	dec (PINNO,sp)
      009264 03 00            [ 1] 3558 	jrne 3$
      009266 02 81            [ 1] 3559 4$: tnz (PINVAL,sp)
      009268 26 05            [ 1] 3560 	jrne 5$
      009268 72               [ 1] 3561 	cpl a 
      009269 00 00            [ 1] 3562 	and a,(GPIO_ODR,x)
      00926B 24 06            [ 2] 3563 	jra 8$
      00926D A6 06            [ 1] 3564 5$: or a,(GPIO_ODR,x)
      00926F CC 88            [ 1] 3565 8$: ld (GPIO_ODR,x),a 
      0013AB                       3566 	_drop VSIZE 
      009271 3D 81            [ 2]    1     addw sp,#VSIZE 
      009273 85               [ 4] 3567 	ret
                                   3568 
                                   3569 
                                   3570 ;-----------------------
                                   3571 ; BASIC: STOP
                                   3572 ; stop progam execution  
                                   3573 ; without resetting pointers 
                                   3574 ; the program is resumed
                                   3575 ; with RUN 
                                   3576 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0013AE                       3577 stop:
      009274 52 04 89 CE 00   [ 2] 3578 	btjt flags,#FRUN,2$
      009279 05               [ 1] 3579 	clr a
      00927A 1F               [ 4] 3580 	ret 
      0013B5                       3581 2$:	 
                                   3582 ; create space on cstack to save context 
      00927B 03 CD 92         [ 2] 3583 	ldw x,#break_point 
      00927E 37 89 CE         [ 4] 3584 	call puts 
      0013BB                       3585 	_drop 2 ;drop return address 
      009281 00 01            [ 2]    1     addw sp,#2 
      0013BD                       3586 	_vars CTXT_SIZE ; context size 
      009283 1F 07            [ 2]    1     sub sp,#CTXT_SIZE 
      009285 85 20 D3         [ 4] 3587 	call save_context 
      009288 AE 16 90         [ 2] 3588 	ldw x,#tib 
      009288 72 00 00         [ 2] 3589 	ldw basicptr,x
      00928B 24               [ 1] 3590 	clr (x)
      00928C 05 A6 06 CC      [ 1] 3591 	clr count  
      009290 88               [ 1] 3592 	clrw x 
      009291 3D 00 00         [ 2] 3593 	ldw in.w,x
      009292 72 11 00 23      [ 1] 3594 	bres flags,#FRUN 
      009292 1E 03 CF 00      [ 1] 3595 	bset flags,#FBREAK
      009296 05 E6 02         [ 2] 3596 	jp interpreter 
      009299 C7 00 04 1E 05 CF 00  3597 break_point: .asciz "\nbreak point, RUN to resume.\n"
             01 85 5B 04 89 81 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3598 
                                   3599 ;-----------------------
                                   3600 ; BASIC: NEW
                                   3601 ; from command line only 
                                   3602 ; free program memory
                                   3603 ; and clear variables 
                                   3604 ;------------------------
      0092A6                       3605 new: 
      0092A6 72 01 00 24 02   [ 2] 3606 	btjf flags,#FRUN,0$ 
      0092AB 4F               [ 4] 3607 	ret 
      001400                       3608 0$:	
      0092AC 81 06 25         [ 4] 3609 	call clear_basic 
      0092AD 81               [ 4] 3610 	ret 
                                   3611 	 
                                   3612 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3613 ;  file system routines
                                   3614 ;  MCU flash memory from
                                   3615 ;  0x10000-0x27fff is 
                                   3616 ;  used to store BASIC 
                                   3617 ;  program files. 
                                   3618 ;  use 128 bytes sectors
                                   3619 ;  because this is the MCU 
                                   3620 ;  row size.
                                   3621 ;  file entry aligned to row
                                   3622 ;  	name  variable length
                                   3623 ;  	size  2 bytes  
                                   3624 ; 	data  variable length 
                                   3625 ;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3626 
                                   3627 ;---------------------------
                                   3628 ; fill pad with zeros 
                                   3629 ;--------------------------
      001404                       3630 zero_pad:
      0092AD 72 09 00         [ 2] 3631 	ldw x,#pad 
      0092B0 24 12            [ 1] 3632 	ld a,#PAD_SIZE 
      0092B2 5B               [ 1] 3633 1$:	clr (x)
      0092B3 02               [ 1] 3634 	incw x 
      0092B4 CD               [ 1] 3635 	dec a 
      0092B5 90 3A            [ 1] 3636 	jrne 1$
      0092B7 5B               [ 4] 3637 	ret 
                                   3638 
                                   3639 ;--------------------------
                                   3640 ; align farptr to BLOCK_SIZE 
                                   3641 ;---------------------------
      00140F                       3642 row_align:
      0092B8 04 72            [ 1] 3643 	ld a,#0x7f 
      0092BA 19 00 24         [ 1] 3644 	and a,farptr+2 
      0092BD 72 10            [ 1] 3645 	jreq 1$ 
      0092BF 00 24 CC         [ 2] 3646 	ldw x,farptr+1 
      0092C2 88 E1 CE         [ 2] 3647 	addw x,#BLOCK_SIZE 
      0092C5 00 1D            [ 1] 3648 	jrnc 0$
      0092C7 C3 00 1F 2B      [ 1] 3649 	inc farptr 
      0092CB 0C               [ 1] 3650 0$: ld a,xl 
      0092CC AE 87            [ 1] 3651 	and a,#0x80
      0092CE D4               [ 1] 3652 	ld xl,a
      0092CF CD A2 C0         [ 2] 3653 	ldw farptr+1,x  	
      0092D2 55               [ 4] 3654 1$:	ret
                                   3655 
                                   3656 ;--------------------
                                   3657 ; input:
                                   3658 ;   X     increment 
                                   3659 ; output:
                                   3660 ;   farptr  incremented 
                                   3661 ;---------------------
      00142A                       3662 incr_farptr:
      0092D3 00 04 00 02      [ 2] 3663 	addw x,farptr+1 
      0092D7 81 04            [ 1] 3664 	jrnc 1$
      0092D8 72 5C 00 16      [ 1] 3665 	inc farptr 
      0092D8 CD 8E DB         [ 2] 3666 1$:	ldw farptr+1,x  
      0092DB 5B               [ 4] 3667 	ret 
                                   3668 
                                   3669 ;------------------------------
                                   3670 ; extended flash memory used as FLASH_DRIVE 
                                   3671 ; seek end of used flash drive   
                                   3672 ; starting at 0x10000 address.
                                   3673 ; 4 consecutives 0 bytes signal free space. 
                                   3674 ; input:
                                   3675 ;	none
                                   3676 ; output:
                                   3677 ;   ffree     free_addr| 0 if memory full.
                                   3678 ;------------------------------
      001438                       3679 seek_fdrive:
                                   3680 ; start scan at 0x10000 address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0092DC 02 5F            [ 1] 3681 	ld a,#1
      0092DE CF 00 07         [ 1] 3682 	ld farptr,a 
      0092E1 72               [ 1] 3683 	clrw x 
      0092E2 5F 00 09         [ 2] 3684 	ldw farptr+1,x 
      001441                       3685 1$:
      0092E5 72 5F 00         [ 2] 3686 	ldw x,#3  
      0092E8 0A CE 00 1D      [ 5] 3687 2$:	ldf a,([farptr],x) 
      0092EC CF 00            [ 1] 3688 	jrne 3$
      0092EE 05               [ 2] 3689 	decw x
      0092EF E6 02            [ 1] 3690 	jrpl 2$
      0092F1 C7 00            [ 2] 3691 	jra 4$ 
      0092F3 04 35 03         [ 2] 3692 3$:	ldw x,#BLOCK_SIZE 
      0092F6 00 02 72         [ 4] 3693 	call incr_farptr
      0092F9 10 00 24         [ 2] 3694 	ldw x,#0x280  
      0092FC CC 88 E1         [ 2] 3695 	cpw x,farptr
      0092FF 22 E4            [ 1] 3696 	jrugt 1$
      00145D                       3697 4$: ; copy farptr to ffree	 
      0092FF AE 17 FF         [ 2] 3698 	ldw x,farptr 
      009302 94 CC 88         [ 1] 3699 	ld a,farptr+2 
      009305 C2 00 19         [ 2] 3700 	ldw ffree,x 
      009306 C7 00 1B         [ 1] 3701 	ld ffree+2,a  
      009306 AE               [ 4] 3702 	ret 
                                   3703 
                                   3704 ;-----------------------
                                   3705 ; return amount of free 
                                   3706 ; space on flash drive
                                   3707 ; input:
                                   3708 ;   none
                                   3709 ; output:
                                   3710 ;   acc24   free space 
                                   3711 ;-----------------------
      00146A                       3712 disk_free:
      009307 00 64 90         [ 2] 3713 	ldw x,#0x8000
      00930A AE 03 E8 20      [ 2] 3714 	subw x,ffree+1
      00930E 0D 02            [ 1] 3715 	ld a,#2
      00930F C2 00 19         [ 1] 3716 	sbc a,ffree 
      00930F CD 8C E6         [ 1] 3717 	ld acc24,a 
      009312 A1 02 27         [ 2] 3718 	ldw acc16,x 
      009315 03               [ 4] 3719 	ret 
                                   3720 
                                   3721 ;-----------------------
                                   3722 ; compare file name 
                                   3723 ; with name pointed by Y  
                                   3724 ; input:
                                   3725 ;   farptr   file name 
                                   3726 ;   Y        target name 
                                   3727 ; output:
                                   3728 ;   farptr 	 at file_name
                                   3729 ;   X 		 farptr[x] point at size field  
                                   3730 ;   Carry    0|1 no match|match  
                                   3731 ;----------------------
      00147D                       3732 cmp_name:
      009316 CC               [ 1] 3733 	clrw x
      009317 88 3B 00 16      [ 5] 3734 1$:	ldf a,([farptr],x)
      009319 90 F1            [ 1] 3735 	cp a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009319 85 90            [ 1] 3736 	jrne 4$
      00931B 85               [ 1] 3737 	tnz a 
      00931C 27 12            [ 1] 3738 	jreq 9$ 
      00931C 89               [ 1] 3739     incw x 
      00931D AE F4            [ 1] 3740 	incw y 
      00931F 24 65            [ 2] 3741 	jra 1$
      00148E                       3742 4$: ;no match 
      009321 90               [ 1] 3743 	tnz a 
      009322 A3 7A            [ 1] 3744 	jreq 5$
      009324 12               [ 1] 3745 	incw x 
      009325 2B 01 5C 16      [ 5] 3746 	ldf a,([farptr],x)
      009328 20 F6            [ 2] 3747 	jra 4$  
      009328 9E               [ 1] 3748 5$:	incw x ; farptr[x] point at 'size' field 
      009329 C7               [ 1] 3749 	rcf 
      00932A 53               [ 4] 3750 	ret
      00149B                       3751 9$: ; match  
      00932B 0D               [ 1] 3752 	incw x  ; farptr[x] at 'size' field 
      00932C 9F               [ 1] 3753 	scf 
      00932D C7               [ 4] 3754 	ret 
                                   3755 
                                   3756 ;-----------------------
                                   3757 ; search file in 
                                   3758 ; flash memory 
                                   3759 ; input:
                                   3760 ;   Y       file name  
                                   3761 ; output:
                                   3762 ;   farptr  addr at name|0
                                   3763 ;   X       offset to size field
                                   3764 ;   Carray   0 not found, 1 found 
                                   3765 ;-----------------------
                           000001  3766 	FSIZE=1
                           000003  3767 	YSAVE=3
                           000004  3768 	VSIZE=4 
      00149E                       3769 search_file: 
      00149E                       3770 	_vars VSIZE
      00932E 53 0E            [ 2]    1     sub sp,#VSIZE 
      009330 8C 56            [ 2] 3771 	ldw (YSAVE,sp),y  
      009332 9E               [ 1] 3772 	clrw x 
      009333 C7 53 0F         [ 2] 3773 	ldw farptr+1,x 
      009336 9F C7 53 10      [ 1] 3774 	mov farptr,#1
      0014AA                       3775 1$:	
                                   3776 ; check if farptr is after any file 
                                   3777 ; if  0 then so.
      00933A 72 10 53 08      [ 5] 3778 	ldf a,[farptr]
      00933E 72 10            [ 1] 3779 	jreq 6$
      009340 53               [ 1] 3780 2$: clrw x 	
      009341 00 72            [ 2] 3781 	ldw y,(YSAVE,sp) 
      009343 10 53 04         [ 4] 3782 	call cmp_name
      009346 85 CD            [ 1] 3783 	jrc 9$
      009348 98 D5 72 11      [ 5] 3784 	ldf a,([farptr],x)
      00934C 53 08            [ 1] 3785 	ld (FSIZE,sp),a 
      00934E 72               [ 1] 3786 	incw x 
      00934F 11 53 00 81      [ 5] 3787 	ldf a,([farptr],x)
      009353 6B 02            [ 1] 3788 	ld (FSIZE+1,sp),a 
      009353 CD               [ 1] 3789 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009354 8C E6 A1         [ 2] 3790 	addw x,(FSIZE,sp) ; skip over file data
      009357 02 27 0B         [ 4] 3791 	call incr_farptr
      00935A A1 01 27         [ 4] 3792 	call row_align  
      00935D 03 CC 88         [ 2] 3793 	ldw x,#0x280
      009360 3B AE 00         [ 2] 3794 	cpw x,farptr 
      009363 00 89            [ 1] 3795 	jrpl 1$
      0014D7                       3796 6$: ; file not found 
      009365 1E 03 5D 27      [ 1] 3797 	clr farptr
      009369 1A 1E 01 9F      [ 1] 3798 	clr farptr+1 
      00936D A4 07 4E C7      [ 1] 3799 	clr farptr+2 
      0014E3                       3800 	_drop VSIZE 
      009371 54 01            [ 2]    1     addw sp,#VSIZE 
      009373 72               [ 1] 3801 	rcf
      009374 16               [ 4] 3802 	ret
      0014E7                       3803 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      0014E7                       3804 	_drop VSIZE 
      009375 50 CA            [ 2]    1     addw sp,#VSIZE 
      009377 72               [ 1] 3805 	scf 	
      009378 10               [ 4] 3806 	ret
                                   3807 
                                   3808 ;--------------------------------
                                   3809 ; BASIC: SAVE "name" 
                                   3810 ; save text program in 
                                   3811 ; flash memory used as permanent
                                   3812 ; storage from address 0x10000-0x27fff 
                                   3813 ;--------------------------------
                           000001  3814 	BSIZE=1
                           000003  3815 	NAMEPTR=3
                           000005  3816 	XSAVE=5
                           000007  3817 	YSAVE=7
                           000008  3818 	VSIZE=8 
      0014EB                       3819 save:
      009379 54 01 AE 00 1B   [ 2] 3820 	btjf flags,#FRUN,0$ 
      00937E 5A 9D            [ 1] 3821 	ld a,#ERR_CMD_ONLY 
      009380 26 FA 20         [ 2] 3822 	jp tb_error
      0014F5                       3823 0$:	 
      009383 08 72 11         [ 2] 3824 	ldw x,txtend 
      009386 54 01 72 17      [ 2] 3825 	subw x,txtbgn
      00938A 50 CA            [ 1] 3826 	jrne 1$
                                   3827 ; nothing to save 
      00938C 5B 04 81         [ 2] 3828 	ldw x,#err_no_prog 
      00938F CD 00 00         [ 4] 3829 	call puts 
      00938F CD 8C E1 A1 01   [ 1] 3830 	mov in,count 
      009394 27               [ 4] 3831 	ret  	
      00150A                       3832 1$:	
      00150A                       3833 	_vars VSIZE 
      009395 03 CC            [ 2]    1     sub sp,#VSIZE 
      009397 88 3B            [ 2] 3834 	ldw (BSIZE,sp),x 
      009399 85 A3 00         [ 4] 3835 	call next_token	
      00939C 05 23            [ 1] 3836 	cp a,#TK_QSTR
      00939E 05 A6            [ 1] 3837 	jreq 2$
      0093A0 0A CC 88         [ 2] 3838 	jp syntax_error
      001518                       3839 2$: 
      0093A3 3D 9F            [ 2] 3840 	ldw (NAMEPTR,sp),x  
      0093A5 C7 00 0E         [ 4] 3841 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3842 ; check if enough free space 
      0093A8 A6 05            [ 2] 3843 	ldw x,(NAMEPTR,sp)
      0093AA C0 00 0E         [ 4] 3844 	call strlen 
      0093AD C7 54            [ 1] 3845 	add a,#3
      0093AF 00               [ 1] 3846 	clrw x 
      0093B0 72               [ 1] 3847 	ld xl,a 
      0093B1 16 54 02         [ 2] 3848 	addw x,(BSIZE,sp)
      0093B4 72               [ 1] 3849 	clr a 
      0093B5 10 54 01 72      [ 2] 3850 	addw x,ffree+1 
      0093B9 0F 54 00         [ 1] 3851 	adc a,ffree 
      0093BC FB CE            [ 1] 3852 	cp a,#2
      0093BE 54 04            [ 1] 3853 	jrmi 21$
      0093C0 A6 84 81         [ 2] 3854 	cpw x,#0x8000
      0093C3 2B 05            [ 1] 3855 	jrmi 21$
      0093C3 52 01            [ 1] 3856 	ld a,#ERR_NO_FSPACE  
      0093C5 CD 8C E1         [ 2] 3857 	jp tb_error
      00153F                       3858 21$: 
                                   3859 ; check for existing file of that name 
      0093C8 A1 01            [ 2] 3860 	ldw y,(NAMEPTR,sp)	
      0093CA 27 03 CC         [ 4] 3861 	call search_file 
      0093CD 88 3B            [ 1] 3862 	jrnc 3$ 
      0093CF 85 A3            [ 1] 3863 	ld a,#ERR_DUPLICATE 
      0093D1 00 0F 23         [ 2] 3864 	jp tb_error 
      00154B                       3865 3$:	; initialize farptr 
      0093D4 05 A6 0A         [ 2] 3866 	ldw x,ffree 
      0093D7 CC 88 3D         [ 1] 3867 	ld a,ffree+2 
      0093DA CD 9A 13         [ 2] 3868 	ldw farptr,x 
      0093DD 6B 01 E6         [ 1] 3869 	ld farptr+2,a 
                                   3870 ;** write file name to row buffer **	
      0093E0 01 0D            [ 2] 3871 	ldw y,(NAMEPTR,sp)  
      0093E2 01 27 05         [ 2] 3872 	ldw x,#pad 
      0093E5 44 0A 01         [ 4] 3873 	call strcpy
      0093E8 26 FB A4         [ 4] 3874 	call strlen 
      0093EB 01               [ 1] 3875 	clrw x 
      0093EC 5F               [ 1] 3876 	ld xl,a 
      0093ED 97               [ 1] 3877 	incw  x
      0093EE A6 84 5B         [ 2] 3878 	addw x,#pad 
                                   3879 ; ** write file size to row buffer 
      0093F1 01 81            [ 2] 3880 	ldw y,(BSIZE,sp)
      0093F3 FF               [ 2] 3881 	ldw (x),y 
      0093F3 52 02 CD         [ 2] 3882 	addw x,#2 
                                   3883 ; ** write file data to row buffer 
      0093F6 8C E6 A1 02      [ 2] 3884 	ldw y,txtbgn 
      0093FA 27 03            [ 1] 3885 6$:	ld a,(y)
      0093FC CC 88            [ 1] 3886 	incw y
      0093FE 3B               [ 1] 3887 	ld (x),a 
      0093FF 85               [ 1] 3888 	incw x
      009400 9F 6B 02 85      [ 2] 3889 	cpw y,txtend 
      009404 A3 00            [ 1] 3890 	jreq 12$
      009406 0F 23 05         [ 2] 3891 	cpw x,#stack_full 
      009409 A6 0A            [ 1] 3892 	jrmi 6$
      001583                       3893 12$:
      00940B CC 88            [ 2] 3894 	ldw (YSAVE,sp),y 
      001585                       3895 14$: ; zero buffer end 
      00940D 3D CD 9A         [ 2] 3896 	cpw x,#stack_full
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009410 13 6B            [ 1] 3897 	jreq 16$
      009412 01               [ 1] 3898 	clr (x)
      009413 A6               [ 1] 3899 	incw x 
      009414 01 0D            [ 2] 3900 	jra 14$
      00158E                       3901 16$:
      009416 01 27 05         [ 2] 3902 	ldw x,#pad 
      009419 48 0A 01         [ 4] 3903 	call write_row 
      00941C 26 FB 0D         [ 2] 3904 	ldw x,#BLOCK_SIZE 
      00941F 02 26 05         [ 4] 3905 	call incr_farptr
      009422 43 E4 00         [ 2] 3906 	ldw x,#pad 
      009425 20 02            [ 2] 3907 	ldw y,(YSAVE,sp)
      009427 EA 00 E7 00      [ 2] 3908 	cpw y,txtend 
      00942B 5B 02            [ 1] 3909 	jrmi 6$
                                   3910 ; save farptr in ffree
      00942D 81 00 16         [ 2] 3911 	ldw x,farptr 
      00942E C6 00 18         [ 1] 3912 	ld a,farptr+2 
      00942E 72 00 00         [ 2] 3913 	ldw ffree,x 
      009431 24 02 4F         [ 1] 3914 	ld ffree+2,a
                                   3915 ; print file size 	
      009434 81 01            [ 2] 3916 	ldw x,(BSIZE,sp) 
      009435 CD 09 0E         [ 4] 3917 	call print_int 
      0015B6                       3918 	_drop VSIZE 
      009435 AE 94            [ 2]    1     addw sp,#VSIZE 
      009437 5C               [ 4] 3919 	ret 
                                   3920 
                                   3921 ;----------------------
                                   3922 ; load file in RAM memory
                                   3923 ; input:
                                   3924 ;    farptr point at file size 
                                   3925 ; output:
                                   3926 ;   y point after BASIC program in RAM.
                                   3927 ;------------------------
      0015B9                       3928 load_file:
      009438 CD A2 C0         [ 4] 3929 	call incr_farptr  
      00943B 5B 02 52         [ 4] 3930 	call clear_basic  
      00943E 04               [ 1] 3931 	clrw x
      00943F CD 90 2A AE      [ 5] 3932 	ldf a,([farptr],x)
      009443 16 90            [ 1] 3933 	ld yh,a 
      009445 CF               [ 1] 3934 	incw x  
      009446 00 05 7F 72      [ 5] 3935 	ldf a,([farptr],x)
      00944A 5F               [ 1] 3936 	incw x 
      00944B 00 04            [ 1] 3937 	ld yl,a 
      00944D 5F CF 00 01      [ 2] 3938 	addw y,txtbgn
      009451 72 11 00 24      [ 2] 3939 	ldw txtend,y
      009455 72 18 00 24      [ 2] 3940 	ldw y,txtbgn
      0015DA                       3941 3$:	; load BASIC text 	
      009459 CC 88 E1 0A      [ 5] 3942 	ldf a,([farptr],x)
      00945D 62 72            [ 1] 3943 	ld (y),a 
      00945F 65               [ 1] 3944 	incw x 
      009460 61 6B            [ 1] 3945 	incw y 
      009462 20 70 6F 69      [ 2] 3946 	cpw y,txtend 
      009466 6E 74            [ 1] 3947 	jrmi 3$
      009468 2C               [ 4] 3948 	ret 
                                   3949 
                                   3950 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3951 ; BASIC: LOAD "file" 
                                   3952 ; load file to RAM 
                                   3953 ; for execution 
                                   3954 ;------------------------
      0015EA                       3955 load:
      009469 20 52 55 4E 20   [ 2] 3956 	btjf flags,#FRUN,0$ 
      00946E 74 6F            [ 1] 3957 	jreq 0$ 
      009470 20 72            [ 1] 3958 	ld a,#ERR_CMD_ONLY 
      009472 65 73 75         [ 2] 3959 	jp tb_error 
      0015F6                       3960 0$:	
      009475 6D 65 2E         [ 4] 3961 	call next_token 
      009478 0A 00            [ 1] 3962 	cp a,#TK_QSTR
      00947A 27 03            [ 1] 3963 	jreq 1$
      00947A 72 01 00         [ 2] 3964 	jp syntax_error 
      00947D 24 01            [ 1] 3965 1$:	ldw y,x 
      00947F 81 14 9E         [ 4] 3966 	call search_file 
      009480 25 05            [ 1] 3967 	jrc 2$ 
      009480 CD 86            [ 1] 3968 	ld a,#ERR_NOT_FILE
      009482 A5 81 BD         [ 2] 3969 	jp tb_error  
      009484                       3970 2$:
      009484 AE 16 E0         [ 4] 3971 	call load_file
                                   3972 ; print loaded size 	 
      009487 A6 80 7F         [ 2] 3973 	ldw x,txtend 
      00948A 5C 4A 26 FB      [ 2] 3974 	subw x,txtbgn
      00948E 81 09 0E         [ 4] 3975 	call print_int 
      00948F 81               [ 4] 3976 	ret 
                                   3977 
                                   3978 ;-----------------------------------
                                   3979 ; BASIC: FORGET ["file_name"] 
                                   3980 ; erase file_name and all others 
                                   3981 ; after it. 
                                   3982 ; without argument erase all files 
                                   3983 ;-----------------------------------
                           000001  3984 	NEW_FREE=1   ; free address after file delete
                           000004  3985 	BLOCK_COUNT=4  ; how many rows to delete
                           000005  3986 	VSIZE=5 
      00161A                       3987 forget:
      00161A                       3988 	_vars VSIZE 
      00948F A6 7F            [ 2]    1     sub sp,#VSIZE 
      009491 C4 00 19         [ 4] 3989 	call next_token 
      009494 27 13            [ 1] 3990 	cp a,#TK_NONE 
      009496 CE 00            [ 1] 3991 	jreq 2$ 
      009498 18 1C            [ 1] 3992 	cp a,#TK_QSTR
      00949A 00 80            [ 1] 3993 	jreq 1$
      00949C 24 04 72         [ 2] 3994 	jp syntax_error
      00949F 5C 00            [ 1] 3995 1$: ldw y,x 
      0094A1 17 9F A4 80 97   [ 1] 3996 	mov in,count 
      0094A6 CF 00 18         [ 4] 3997 	call search_file
      0094A9 81 0F            [ 1] 3998 	jrc 3$
      0094AA A6 09            [ 1] 3999 	ld a,#ERR_NOT_FILE 
      0094AA 72 BB 00         [ 2] 4000 	jp tb_error 
      00163B                       4001 2$: 
      0094AD 18 24 04         [ 2] 4002 	ldw x,#0x100
      0094B0 72               [ 1] 4003 	clr a 
      0094B1 5C 00 17         [ 2] 4004 	ldw farptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0094B4 CF 00 18         [ 1] 4005 	ld farptr+2,a 
      0094B7 81 00 18         [ 1] 4006 3$:	ld a,farptr+2 
      0094B8 CE 00 16         [ 2] 4007 	ldw x,farptr 
                                   4008 ; save new free address 
      0094B8 A6 01            [ 2] 4009 	ldw (NEW_FREE,sp),x
      0094BA C7 00            [ 1] 4010 	ld (NEW_FREE+2,sp),a 
                                   4011 ; count blocks to erase 
      0094BC 17 5F CF         [ 1] 4012 	ld a,ffree+2 
      0094BF 00 18 19         [ 2] 4013 	ldw x,ffree 
      0094C1 C0 00 18         [ 1] 4014 	sub a,farptr+2 
      0094C1 AE 00            [ 1] 4015 	jrnc 4$
      0094C3 03               [ 2] 4016 	decw x 
      0094C4 92 AF 00 17      [ 2] 4017 4$:	subw x,farptr 
                                   4018 ; X= X:A/BLOCK_SIZE 
      0094C8 26               [ 1] 4019 	sll a 
      0094C9 05               [ 2] 4020 	rlcw x 
      0094CA 5A 2A            [ 2] 4021 	ldw (BLOCK_COUNT,sp),x
      0094CC F7 20 0E         [ 4] 4022 	call move_erase_to_ram
      0094CF AE 00            [ 2] 4023 5$: ldw x,(BLOCK_COUNT,sp)
      0094D1 80               [ 2] 4024 	tnzw x
      0094D2 CD 94            [ 1] 4025 	jreq 6$
      0094D4 AA AE 02         [ 4] 4026 	call block_erase 
      0094D7 80 C3 00         [ 2] 4027 	ldw x,#BLOCK_SIZE 
      0094DA 17 22 E4         [ 4] 4028 	call incr_farptr 
      0094DD 1E 04            [ 2] 4029 	ldw x,(BLOCK_COUNT,sp)
      0094DD CE               [ 2] 4030 	decw x 
      0094DE 00 17            [ 2] 4031 	ldw (BLOCK_COUNT,sp),x
      0094E0 C6 00            [ 2] 4032 	jra 5$  
                                   4033 ; save new free address
      0094E2 19 CF            [ 1] 4034 6$:	ld a,(NEW_FREE+2,sp)
      0094E4 00 1A            [ 2] 4035 	ldw x,(NEW_FREE,sp)
      0094E6 C7 00 1C         [ 1] 4036 	ld ffree+2,a 
      0094E9 81 00 19         [ 2] 4037 	ldw ffree,x 
      0094EA                       4038 	_drop VSIZE 
      0094EA AE 80            [ 2]    1     addw sp,#VSIZE 
      0094EC 00               [ 4] 4039 	ret 
                                   4040 
                                   4041 ;----------------------
                                   4042 ; BASIC: DIR 
                                   4043 ; list saved files 
                                   4044 ;----------------------
                           000001  4045 	COUNT=1 ; files counter 
                           000002  4046 	VSIZE=2 
      001688                       4047 directory:
      001688                       4048 	_vars VSIZE 
      0094ED 72 B0            [ 2]    1     sub sp,#VSIZE 
      0094EF 00               [ 1] 4049 	clrw x 
      0094F0 1B A6            [ 2] 4050 	ldw (COUNT,sp),x 
      0094F2 02 C2 00         [ 2] 4051 	ldw farptr+1,x 
      0094F5 1A C7 00 0C      [ 1] 4052 	mov farptr,#1 
      001694                       4053 dir_loop:
      0094F9 CF               [ 1] 4054 	clrw x 
      0094FA 00 0D 81 16      [ 5] 4055 	ldf a,([farptr],x)
      0094FD 27 3B            [ 1] 4056 	jreq 8$ 
      00169B                       4057 1$: ;name loop 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0094FD 5F 92 AF 00      [ 5] 4058 	ldf a,([farptr],x)
      009501 17 90            [ 1] 4059 	jreq 2$ 
      009503 F1 26 08         [ 4] 4060 	call putc 
      009506 4D               [ 1] 4061 	incw x 
      009507 27 12            [ 2] 4062 	jra 1$
      009509 5C               [ 1] 4063 2$: incw x ; skip ending 0. 
      00950A 90 5C            [ 1] 4064 	ld a,#SPACE 
      00950C 20 F0 2B         [ 4] 4065 	call putc 
                                   4066 ; get file size 	
      00950E 92 AF 00 16      [ 5] 4067 	ldf a,([farptr],x)
      00950E 4D 27            [ 1] 4068 	ld yh,a 
      009510 07               [ 1] 4069 	incw x 
      009511 5C 92 AF 00      [ 5] 4070 	ldf a,([farptr],x)
      009515 17               [ 1] 4071 	incw x 
      009516 20 F6            [ 1] 4072 	ld yl,a 
      009518 5C 98            [ 2] 4073 	pushw y 
      00951A 81 FB 01         [ 2] 4074 	addw x,(1,sp)
                                   4075 ; skip to next file 
      00951B CD 14 2A         [ 4] 4076 	call incr_farptr
      00951B 5C 99 81         [ 4] 4077 	call row_align
                                   4078 ; print file size 
      00951E 85               [ 2] 4079 	popw x ; file size 
      00951E 52 04 17         [ 4] 4080 	call print_int 
      009521 03 5F            [ 1] 4081 	ld a,#CR 
      009523 CF 00 18         [ 4] 4082 	call putc
      009526 35 01            [ 2] 4083 	ldw x,(COUNT,sp)
      009528 00               [ 1] 4084 	incw x
      009529 17 01            [ 2] 4085 	ldw (COUNT,sp),x  
      00952A 20 BE            [ 2] 4086 	jra dir_loop
      0016D6                       4087 8$: ; print number of files 
      00952A 92 BC            [ 2] 4088 	ldw x,(COUNT,sp)
      00952C 00 17 27         [ 4] 4089 	call print_int 
      00952F 27 5F 16         [ 2] 4090 	ldw x,#file_count 
      009532 03 CD 94         [ 4] 4091 	call puts  
                                   4092 ; print drive free space 	
      009535 FD 25 2F         [ 4] 4093 	call disk_free
      009538 92               [ 1] 4094 	clrw x  
      009539 AF 00 17 6B      [ 1] 4095 	mov base,#10 
      00953D 01 5C 92         [ 4] 4096 	call prti24 
      009540 AF 00 17         [ 2] 4097 	ldw x,#drive_free
      009543 6B 02 5C         [ 4] 4098 	call puts 
      0016F2                       4099 	_drop VSIZE 
      009546 72 FB            [ 2]    1     addw sp,#VSIZE 
      009548 01               [ 4] 4100 	ret
      009549 CD 94 AA CD 94 8F AE  4101 file_count: .asciz " files\n"
             02
      009551 80 C3 00 17 2A D3 20  4102 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   4103 
                                   4104 ;---------------------
                                   4105 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   4106 ; write 1 or more byte to FLASH or EEPROM
                                   4107 ; starting at address  
                                   4108 ; input:
                                   4109 ;   expr1  	is address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4110 ;   expr2,...,exprn   are bytes to write
                                   4111 ; output:
                                   4112 ;   none 
                                   4113 ;---------------------
                           000001  4114 	ADDR=1
                           000002  4115 	VSIZ=2 
      009557                       4116 write:
      00170A                       4117 	_vars VSIZE 
      009557 72 5F            [ 2]    1     sub sp,#VSIZE 
      009559 00 17 72 5F      [ 1] 4118 	clr farptr ; expect 16 bits address 
      00955D 00 18 72         [ 4] 4119 	call expression
      009560 5F 00            [ 1] 4120 	cp a,#TK_INTGR 
      009562 19 5B            [ 1] 4121 	jreq 0$
      009564 04 98 81         [ 2] 4122 	jp syntax_error
      009567 1F 01            [ 2] 4123 0$: ldw (ADDR,sp),x 
      009567 5B 04 99         [ 4] 4124 	call next_token 
      00956A 81 09            [ 1] 4125 	cp a,#TK_COMMA 
      00956B 27 02            [ 1] 4126 	jreq 1$ 
      00956B 72 01            [ 2] 4127 	jra 9$ 
      00956D 00 24 05         [ 4] 4128 1$:	call expression
      009570 A6 07            [ 1] 4129 	cp a,#TK_INTGR
      009572 CC 88            [ 1] 4130 	jreq 2$
      009574 3D 07 BB         [ 2] 4131 	jp syntax_error
      009575 9F               [ 1] 4132 2$:	ld a,xl 
      009575 CE 00            [ 2] 4133 	ldw x,(ADDR,sp) 
      009577 1F 72 B0         [ 2] 4134 	ldw farptr+1,x 
      00957A 00               [ 1] 4135 	clrw x 
      00957B 1D 26 0C         [ 4] 4136 	call write_byte
      00957E AE 87            [ 2] 4137 	ldw x,(ADDR,sp)
      009580 D4               [ 1] 4138 	incw x 
      009581 CD A2            [ 2] 4139 	jra 0$ 
      00173E                       4140 9$:
      00173E                       4141 	_drop VSIZE
      009583 C0 55            [ 2]    1     addw sp,#VSIZE 
      009585 00               [ 4] 4142 	ret 
                                   4143 
                                   4144 
                                   4145 ;---------------------
                                   4146 ;BASIC: CHAR(expr)
                                   4147 ; évaluate expression 
                                   4148 ; and take the 7 least 
                                   4149 ; bits as ASCII character
                                   4150 ; return a TK_CHAR 
                                   4151 ;---------------------
      001741                       4152 char:
      009586 04 00 02         [ 4] 4153 	call func_args 
      009589 81 01            [ 1] 4154 	cp a,#1
      00958A 27 03            [ 1] 4155 	jreq 1$
      00958A 52 08 1F         [ 2] 4156 	jp syntax_error
      00958D 01               [ 2] 4157 1$:	popw x 
      00958E CD               [ 1] 4158 	ld a,xl 
      00958F 89 2D            [ 1] 4159 	and a,#0x7f 
      009591 A1               [ 1] 4160 	ld xl,a
      009592 02 27            [ 1] 4161 	ld a,#TK_CHAR
      009594 03               [ 4] 4162 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4163 
                                   4164 ;---------------------
                                   4165 ; BASIC: ASC(string|char|TK_CFUNC)
                                   4166 ; extract first character 
                                   4167 ; of string argument 
                                   4168 ; return it as TK_INTGR 
                                   4169 ;---------------------
      001753                       4170 ascii:
      009595 CC 88            [ 1] 4171 	ld a,#TK_LPAREN
      009597 3B 0C 54         [ 4] 4172 	call expect 
      009598 CD 08 AD         [ 4] 4173 	call next_token 
      009598 1F 03            [ 1] 4174 	cp a,#TK_QSTR 
      00959A CD 82            [ 1] 4175 	jreq 1$
      00959C 1C 1E            [ 1] 4176 	cp a,#TK_CHAR 
      00959E 03 CD            [ 1] 4177 	jreq 2$ 
      0095A0 84 B4            [ 1] 4178 	cp a,#TK_CFUNC 
      0095A2 AB 03            [ 1] 4179 	jreq 0$
      0095A4 5F 97 72         [ 2] 4180 	jp syntax_error
      0095A7 FB               [ 4] 4181 0$: call (x)
      0095A8 01 4F            [ 2] 4182 	jra 2$
      00176D                       4183 1$: 
      0095AA 72               [ 1] 4184 	ld a,(x) 
      0095AB BB               [ 1] 4185 	clrw x
      0095AC 00               [ 1] 4186 	ld xl,a 
      001770                       4187 2$: 
      0095AD 1B               [ 2] 4188 	pushw x 
      0095AE C9 00            [ 1] 4189 	ld a,#TK_RPAREN 
      0095B0 1A A1 02         [ 4] 4190 	call expect
      0095B3 2B               [ 2] 4191 	popw x 
      0095B4 0A A3            [ 1] 4192 	ld a,#TK_INTGR 
      0095B6 80               [ 4] 4193 	ret 
                                   4194 
                                   4195 ;---------------------
                                   4196 ;BASIC: KEY
                                   4197 ; wait for a character 
                                   4198 ; received from STDIN 
                                   4199 ; input:
                                   4200 ;	none 
                                   4201 ; output:
                                   4202 ;	X 		ASCII character 
                                   4203 ;---------------------
      00177A                       4204 key:
      0095B7 00 2B 05         [ 4] 4205 	call getc 
      0095BA A6               [ 1] 4206 	clrw x 
      0095BB 0E               [ 1] 4207 	ld xl,a 
      0095BC CC 88            [ 1] 4208 	ld a,#TK_INTGR
      0095BE 3D               [ 4] 4209 	ret
                                   4210 
                                   4211 ;----------------------
                                   4212 ; BASIC: QKEY
                                   4213 ; Return true if there 
                                   4214 ; is a character in 
                                   4215 ; waiting in STDIN 
                                   4216 ; input:
                                   4217 ;  none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4218 ; output:
                                   4219 ;   X 		0|-1 
                                   4220 ;-----------------------
      0095BF                       4221 qkey:: 
      0095BF 16               [ 1] 4222 	clrw x 
      0095C0 03 CD 95         [ 1] 4223 	ld a,rx1_head
      0095C3 1E 24 05         [ 1] 4224 	cp a,rx1_tail 
      0095C6 A6 08            [ 1] 4225 	jreq 9$ 
      0095C8 CC               [ 2] 4226 	cplw x 
      0095C9 88 3D            [ 1] 4227 9$: ld a,#TK_INTGR
      0095CB 81               [ 4] 4228 	ret 
                                   4229 
                                   4230 ;---------------------
                                   4231 ; BASIC: GPIO(expr,reg)
                                   4232 ; return gpio address 
                                   4233 ; expr {0..8}
                                   4234 ; input:
                                   4235 ;   none 
                                   4236 ; output:
                                   4237 ;   X 		gpio register address
                                   4238 ;----------------------------
                           000003  4239 	PORT=3
                           000001  4240 	REG=1 
                           000004  4241 	VSIZE=4 
      00178F                       4242 gpio:
      0095CB CE 00 1A         [ 4] 4243 	call func_args 
      0095CE C6 00            [ 1] 4244 	cp a,#2
      0095D0 1C CF            [ 1] 4245 	jreq 1$
      0095D2 00 17 C7         [ 2] 4246 	jp syntax_error  
      001799                       4247 1$:	
      0095D5 00 19            [ 2] 4248 	ldw x,(PORT,sp)
      0095D7 16 03            [ 1] 4249 	jrmi bad_port
      0095D9 AE 16 E0         [ 2] 4250 	cpw x,#9
      0095DC CD 84            [ 1] 4251 	jrpl bad_port
      0095DE D0 CD            [ 1] 4252 	ld a,#5
      0095E0 84               [ 4] 4253 	mul x,a
      0095E1 B4 5F 97         [ 2] 4254 	addw x,#GPIO_BASE 
      0095E4 5C 1C            [ 2] 4255 	ldw (PORT,sp),x  
      0095E6 16 E0            [ 2] 4256 	ldw x,(REG,sp) 
      0095E8 16 01 FF         [ 2] 4257 	addw x,(PORT,sp)
      0095EB 1C 00            [ 1] 4258 	ld a,#TK_INTGR
      0017B1                       4259 	_drop VSIZE 
      0095ED 02 90            [ 2]    1     addw sp,#VSIZE 
      0095EF CE               [ 4] 4260 	ret
      0017B4                       4261 bad_port:
      0095F0 00 1D            [ 1] 4262 	ld a,#ERR_BAD_VALUE
      0095F2 90 F6 90         [ 2] 4263 	jp tb_error
                                   4264 
                                   4265 
                                   4266 ;-------------------------
                                   4267 ; BASIC: UFLASH 
                                   4268 ; return user flash address
                                   4269 ; input:
                                   4270 ;  none 
                                   4271 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4272 ;	A		TK_INTGR
                                   4273 ;   X 		user address 
                                   4274 ;---------------------------
      0017B9                       4275 uflash:
      0095F5 5C F7 5C         [ 2] 4276 	ldw x,#user_space 
      0095F8 90 C3            [ 1] 4277 	ld a,#TK_INTGR 
      0095FA 00               [ 4] 4278 	ret 
                                   4279 
                                   4280 
                                   4281 ;---------------------
                                   4282 ; BASIC: USR(addr[,arg])
                                   4283 ; execute a function written 
                                   4284 ; in binary code.
                                   4285 ; binary fonction should 
                                   4286 ; return token attribute in A 
                                   4287 ; and value in X. 
                                   4288 ; input:
                                   4289 ;   addr	routine address 
                                   4290 ;   arg 	is an optional argument 
                                   4291 ; output:
                                   4292 ;   A 		token attribute 
                                   4293 ;   X       returned value 
                                   4294 ;---------------------
      0017BF                       4295 usr:
      0095FB 1F 27            [ 2] 4296 	pushw y 	
      0095FD 05 A3 17         [ 4] 4297 	call func_args 
      009600 60 2B            [ 1] 4298 	cp a,#1 
      009602 EF 07            [ 1] 4299 	jreq 2$
      009603 A1 02            [ 1] 4300 	cp a,#2
      009603 17 07            [ 1] 4301 	jreq 2$  
      009605 CC 07 BB         [ 2] 4302 	jp syntax_error 
      009605 A3 17            [ 2] 4303 2$: popw y  ; arg|addr 
      009607 60 27            [ 1] 4304 	cp a,#1
      009609 04 7F            [ 1] 4305 	jreq 3$
      00960B 5C               [ 2] 4306 	popw x ; addr
      00960C 20               [ 1] 4307 	exgw x,y 
      00960D F7 FD            [ 4] 4308 3$: call (y)
      00960E 90 85            [ 2] 4309 	popw y 
      00960E AE               [ 4] 4310 	ret 
                                   4311 
                                   4312 ;------------------------------
                                   4313 ; BASIC: BYE 
                                   4314 ; halt mcu in its lowest power mode 
                                   4315 ; wait for reset or external interrupt
                                   4316 ; do a cold start on wakeup.
                                   4317 ;------------------------------
      0017DC                       4318 bye:
      00960F 16 E0 CD 82 30   [ 2] 4319 	btjf UART1_SR,#UART_SR_TC,.
      009614 AE               [10] 4320 	halt
      009615 00 80 CD         [ 2] 4321 	jp cold_start  
                                   4322 
                                   4323 ;----------------------------------
                                   4324 ; BASIC: AUTORUN ["file_name"] 
                                   4325 ; record in eeprom at adrress AUTORUN_NAME
                                   4326 ; the name of file to load and execute
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4327 ; at startup. 
                                   4328 ; empty string delete autorun name 
                                   4329 ; no argument display autorun name  
                                   4330 ; input:
                                   4331 ;   file_name   file to execute 
                                   4332 ; output:
                                   4333 ;   none
                                   4334 ;-----------------------------------
      0017E5                       4335 autorun: 
      009618 94 AA AE 16 E0   [ 2] 4336 	btjf flags,#FRUN,0$ 
      00961D 16 07            [ 1] 4337 	jreq 0$ 
      00961F 90 C3            [ 1] 4338 	ld a,#ERR_CMD_ONLY 
      009621 00 1F 2B         [ 2] 4339 	jp tb_error 
      0017F1                       4340 0$:	
      009624 CD CE 00         [ 4] 4341 	call next_token
      009627 17               [ 1] 4342 	tnz a 
      009628 C6 00            [ 1] 4343 	jrne 1$
      00962A 19 CF 00         [ 2] 4344 	ldw x,#AUTORUN_NAME
      00962D 1A C7 00         [ 4] 4345 	call puts 
      009630 1C               [ 1] 4346 	clr a 
      009631 1E               [ 4] 4347 	ret 
      0017FF                       4348 1$:
      009632 01 CD            [ 1] 4349 	cp a,#TK_QSTR
      009634 89 8E            [ 1] 4350 	jreq 2$
      009636 5B 08 81         [ 2] 4351 	jp syntax_error 
      009639                       4352 2$:	
      009639 CD               [ 1] 4353 	tnz (x) 
      00963A 94 AA            [ 1] 4354 	jrne 3$
                                   4355 ; empty string, delete autorun 	
      00963C CD 86 A5         [ 4] 4356 	call cancel_autorun
      00963F 5F 92 AF 00 17   [ 1] 4357 	mov in,count 
      009644 90               [ 4] 4358 	ret 
      009645 95               [ 2] 4359 3$:	pushw x 
      009646 5C 92            [ 1] 4360 	ldw y,x  
      009648 AF 00 17         [ 4] 4361 	call search_file 
      00964B 5C 90            [ 1] 4362 	jrc 4$ 
      00964D 97 72            [ 1] 4363 	ld a,#ERR_NOT_FILE
      00964F B9 00 1D         [ 2] 4364 	jp tb_error  
      00181F                       4365 4$: 
      009652 90 CF 00 1F 90   [ 1] 4366 	mov in,count 
      009657 CE 00 1D 16      [ 1] 4367 	clr farptr 
      00965A AE 40 00         [ 2] 4368 	ldw x,#AUTORUN_NAME
      00965A 92 AF 00         [ 2] 4369 	ldw farptr+1,x 
      00965D 17 90            [ 2] 4370 	ldw x,(1,sp)  
      00965F F7 5C 90         [ 4] 4371 	call strlen  ; return length in A 
      009662 5C               [ 1] 4372 	clrw x 
      009663 90               [ 1] 4373 	ld xl,a 
      009664 C3               [ 1] 4374 	incw x 
      009665 00 1F            [ 2] 4375 	popw y 
      009667 2B               [ 2] 4376 	pushw x 
      009668 F1               [ 1] 4377 	clrw x 
      009669 81 02 82         [ 4] 4378 	call write_block 
      00966A                       4379 	_drop 2 
      00966A 72 01            [ 2]    1     addw sp,#2 
      00966C 00               [ 4] 4380 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4381 
                                   4382 ;----------------------------------
                                   4383 ; BASIC: SLEEP 
                                   4384 ; halt mcu until reset or external
                                   4385 ; interrupt.
                                   4386 ; Resume progam after SLEEP command
                                   4387 ;----------------------------------
      001840                       4388 sleep:
      00966D 24 07 27 05 A6   [ 2] 4389 	btjf UART1_SR,#UART_SR_TC,.
      009672 07 CC 88 3D      [ 1] 4390 	bset flags,#FSLEEP
      009676 8E               [10] 4391 	halt 
      009676 CD               [ 4] 4392 	ret 
                                   4393 
                                   4394 ;-------------------------------
                                   4395 ; BASIC: PAUSE expr 
                                   4396 ; suspend execution for n msec.
                                   4397 ; input:
                                   4398 ;	none
                                   4399 ; output:
                                   4400 ;	none 
                                   4401 ;------------------------------
      00184B                       4402 pause:
      009677 89 2D A1         [ 4] 4403 	call expression
      00967A 02 27            [ 1] 4404 	cp a,#TK_INTGR
      00967C 03 CC            [ 1] 4405 	jreq pause02 
      00967E 88 3B 90         [ 2] 4406 	jp syntax_error
      001855                       4407 pause02: 
      009681 93               [ 2] 4408 1$: tnzw x 
      009682 CD 95            [ 1] 4409 	jreq 2$
      009684 1E               [10] 4410 	wfi 
      009685 25               [ 2] 4411 	decw x 
      009686 05 A6            [ 1] 4412 	jrne 1$
      009688 09               [ 1] 4413 2$:	clr a 
      009689 CC               [ 4] 4414 	ret 
                                   4415 
                                   4416 ;------------------------------
                                   4417 ; BASIC: AWU expr
                                   4418 ; halt mcu for 'expr' milliseconds
                                   4419 ; use Auto wakeup peripheral
                                   4420 ; all oscillators stopped except LSI
                                   4421 ; range: 1ms - 511ms
                                   4422 ; input:
                                   4423 ;  none
                                   4424 ; output:
                                   4425 ;  none:
                                   4426 ;------------------------------
      00185E                       4427 awu:
      00968A 88 3D 65         [ 4] 4428   call expression
      00968C A1 84            [ 1] 4429   cp a,#TK_INTGR
      00968C CD 96            [ 1] 4430   jreq awu02
      00968E 39 CE 00         [ 2] 4431   jp syntax_error
      001868                       4432 awu02:
      009691 1F 72 B0         [ 2] 4433   cpw x,#5120
      009694 00 1D            [ 1] 4434   jrmi 1$ 
      009696 CD 89 8E 81      [ 1] 4435   mov AWU_TBR,#15 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00969A A6 1E            [ 1] 4436   ld a,#30
      00969A 52               [ 2] 4437   div x,a
      00969B 05 CD            [ 1] 4438   ld a,#16
      00969D 89               [ 2] 4439   div x,a 
      00969E 2D A1            [ 2] 4440   jra 4$
      001879                       4441 1$: 
      0096A0 00 27 18         [ 2] 4442   cpw x,#2048
      0096A3 A1 02            [ 1] 4443   jrmi 2$ 
      0096A5 27 03 CC 88      [ 1] 4444   mov AWU_TBR,#14
      0096A9 3B 90            [ 1] 4445   ld a,#80
      0096AB 93               [ 2] 4446   div x,a 
      0096AC 55 00            [ 2] 4447   jra 4$   
      001887                       4448 2$:
      0096AE 04 00 02 CD      [ 1] 4449   mov AWU_TBR,#7
      00188B                       4450 3$:  
                                   4451 ; while X > 64  divide by 2 and increment AWU_TBR 
      0096B2 95 1E 25         [ 2] 4452   cpw x,#64 
      0096B5 0F A6            [ 2] 4453   jrule 4$ 
      0096B7 09 CC 88 3D      [ 1] 4454   inc AWU_TBR 
      0096BB 54               [ 2] 4455   srlw x 
      0096BB AE 01            [ 2] 4456   jra 3$ 
      001897                       4457 4$:
      0096BD 00               [ 1] 4458   ld a, xl
      0096BE 4F               [ 1] 4459   dec a 
      0096BF CF 00            [ 1] 4460   jreq 5$
      0096C1 17               [ 1] 4461   dec a 	
      00189C                       4462 5$: 
      0096C2 C7 00            [ 1] 4463   and a,#0x3e 
      0096C4 19 C6 00         [ 1] 4464   ld AWU_APR,a 
      0096C7 19 CE 00 17      [ 1] 4465   bset AWU_CSR,#AWU_CSR_AWUEN
      0096CB 1F               [10] 4466   halt 
                                   4467 
      0096CC 01               [ 4] 4468   ret 
                                   4469 
                                   4470 ;------------------------------
                                   4471 ; BASIC: TICKS
                                   4472 ; return msec ticks counter value 
                                   4473 ; input:
                                   4474 ; 	none 
                                   4475 ; output:
                                   4476 ;	X 		TK_INTGR
                                   4477 ;-------------------------------
      0018A7                       4478 get_ticks:
      0096CD 6B 03 C6         [ 2] 4479 	ldw x,ticks 
      0096D0 00 1C            [ 1] 4480 	ld a,#TK_INTGR
      0096D2 CE               [ 4] 4481 	ret 
                                   4482 
                                   4483 
                                   4484 
                                   4485 ;------------------------------
                                   4486 ; BASIC: ABS(expr)
                                   4487 ; return absolute value of expr.
                                   4488 ; input:
                                   4489 ;   none
                                   4490 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4491 ;   X     	positive integer
                                   4492 ;-------------------------------
      0018AD                       4493 abs:
      0096D3 00 1A C0         [ 4] 4494 	call func_args 
      0096D6 00 19            [ 1] 4495 	cp a,#1 
      0096D8 24 01            [ 1] 4496 	jreq 0$ 
      0096DA 5A 72 B0         [ 2] 4497 	jp syntax_error
      0018B7                       4498 0$:  
      0096DD 00               [ 2] 4499     popw x   
      0096DE 17               [ 1] 4500 	ld a,xh 
      0096DF 48 59            [ 1] 4501 	bcp a,#0x80 
      0096E1 1F 04            [ 1] 4502 	jreq 2$ 
      0096E3 CD               [ 2] 4503 	negw x 
      0096E4 81 E8            [ 1] 4504 2$: ld a,#TK_INTGR 
      0096E6 1E               [ 4] 4505 	ret 
                                   4506 
                                   4507 ;------------------------------
                                   4508 ; BASIC: AND(expr1,expr2)
                                   4509 ; Apply bit AND relation between
                                   4510 ; the 2 arguments, i.e expr1 & expr2 
                                   4511 ; output:
                                   4512 ; 	A 		TK_INTGR
                                   4513 ;   X 		result 
                                   4514 ;------------------------------
      0018C1                       4515 bit_and:
      0096E7 04 5D 27         [ 4] 4516 	call func_args 
      0096EA 10 CD            [ 1] 4517 	cp a,#2
      0096EC 82 63            [ 1] 4518 	jreq 1$
      0096EE AE 00 80         [ 2] 4519 	jp syntax_error 
      0096F1 CD               [ 2] 4520 1$:	popw x 
      0096F2 94               [ 1] 4521 	ld a,xh 
      0096F3 AA 1E            [ 1] 4522 	and a,(1,sp)
      0096F5 04               [ 1] 4523 	ld xh,a 
      0096F6 5A               [ 1] 4524 	ld a,xl
      0096F7 1F 04            [ 1] 4525 	and a,(2,sp)
      0096F9 20               [ 1] 4526 	ld xl,a 
      0018D4                       4527 	_drop 2 
      0096FA EB 7B            [ 2]    1     addw sp,#2 
      0096FC 03 1E            [ 1] 4528 	ld a,#TK_INTGR
      0096FE 01               [ 4] 4529 	ret
                                   4530 
                                   4531 ;------------------------------
                                   4532 ; BASIC: OR(expr1,expr2)
                                   4533 ; Apply bit OR relation between
                                   4534 ; the 2 arguments, i.e expr1 | expr2 
                                   4535 ; output:
                                   4536 ; 	A 		TK_INTGR
                                   4537 ;   X 		result 
                                   4538 ;------------------------------
      0018D9                       4539 bit_or:
      0096FF C7 00 1C         [ 4] 4540 	call func_args 
      009702 CF 00            [ 1] 4541 	cp a,#2
      009704 1A 5B            [ 1] 4542 	jreq 1$
      009706 05 81 BB         [ 2] 4543 	jp syntax_error 
      009708                       4544 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009708 52               [ 2] 4545 	popw x 
      009709 02               [ 1] 4546 	ld a,xh 
      00970A 5F 1F            [ 1] 4547 	or a,(1,sp)
      00970C 01               [ 1] 4548 	ld xh,a 
      00970D CF               [ 1] 4549 	ld a,xl 
      00970E 00 18            [ 1] 4550 	or a,(2,sp)
      009710 35               [ 1] 4551 	ld xl,a 
      0018EC                       4552 	_drop 2 
      009711 01 00            [ 2]    1     addw sp,#2 
      009713 17 84            [ 1] 4553 	ld a,#TK_INTGR 
      009714 81               [ 4] 4554 	ret
                                   4555 
                                   4556 ;------------------------------
                                   4557 ; BASIC: XOR(expr1,expr2)
                                   4558 ; Apply bit XOR relation between
                                   4559 ; the 2 arguments, i.e expr1 ^ expr2 
                                   4560 ; output:
                                   4561 ; 	A 		TK_INTGR
                                   4562 ;   X 		result 
                                   4563 ;------------------------------
      0018F1                       4564 bit_xor:
      009714 5F 92 AF         [ 4] 4565 	call func_args 
      009717 00 17            [ 1] 4566 	cp a,#2
      009719 27 3B            [ 1] 4567 	jreq 1$
      00971B CC 07 BB         [ 2] 4568 	jp syntax_error 
      0018FB                       4569 1$: 
      00971B 92               [ 2] 4570 	popw x 
      00971C AF               [ 1] 4571 	ld a,xh 
      00971D 00 17            [ 1] 4572 	xor a,(1,sp)
      00971F 27               [ 1] 4573 	ld xh,a 
      009720 06               [ 1] 4574 	ld a,xl 
      009721 CD 83            [ 1] 4575 	xor a,(2,sp)
      009723 AB               [ 1] 4576 	ld xl,a 
      001904                       4577 	_drop 2 
      009724 5C 20            [ 2]    1     addw sp,#2 
      009726 F4 5C            [ 1] 4578 	ld a,#TK_INTGR 
      009728 A6               [ 4] 4579 	ret 
                                   4580 
                                   4581 ;------------------------------
                                   4582 ; BASIC: LSHIFT(expr1,expr2)
                                   4583 ; logical shift left expr1 by 
                                   4584 ; expr2 bits 
                                   4585 ; output:
                                   4586 ; 	A 		TK_INTGR
                                   4587 ;   X 		result 
                                   4588 ;------------------------------
      001909                       4589 lshift:
      009729 20 CD 83         [ 4] 4590 	call func_args
      00972C AB 92            [ 1] 4591 	cp a,#2 
      00972E AF 00            [ 1] 4592 	jreq 1$
      009730 17 90 95         [ 2] 4593 	jp syntax_error
      009733 5C 92            [ 2] 4594 1$: popw y   
      009735 AF               [ 2] 4595 	popw x 
      009736 00 17            [ 2] 4596 	tnzw y 
      009738 5C 90            [ 1] 4597 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      00973A 97               [ 2] 4598 2$:	sllw x 
      00973B 90 89            [ 2] 4599 	decw y 
      00973D 72 FB            [ 1] 4600 	jrne 2$
      00191F                       4601 4$:  
      00973F 01 CD            [ 1] 4602 	ld a,#TK_INTGR
      009741 94               [ 4] 4603 	ret
                                   4604 
                                   4605 ;------------------------------
                                   4606 ; BASIC: RSHIFT(expr1,expr2)
                                   4607 ; logical shift right expr1 by 
                                   4608 ; expr2 bits.
                                   4609 ; output:
                                   4610 ; 	A 		TK_INTGR
                                   4611 ;   X 		result 
                                   4612 ;------------------------------
      001922                       4613 rshift:
      009742 AA CD 94         [ 4] 4614 	call func_args
      009745 8F 85            [ 1] 4615 	cp a,#2 
      009747 CD 89            [ 1] 4616 	jreq 1$
      009749 8E A6 0D         [ 2] 4617 	jp syntax_error
      00974C CD 83            [ 2] 4618 1$: popw y  
      00974E AB               [ 2] 4619 	popw x
      00974F 1E 01            [ 2] 4620 	tnzw y 
      009751 5C 1F            [ 1] 4621 	jreq 4$
      009753 01               [ 2] 4622 2$:	srlw x 
      009754 20 BE            [ 2] 4623 	decw y 
      009756 26 FB            [ 1] 4624 	jrne 2$
      001938                       4625 4$:  
      009756 1E 01            [ 1] 4626 	ld a,#TK_INTGR
      009758 CD               [ 4] 4627 	ret
                                   4628 
                                   4629 ;--------------------------
                                   4630 ; BASIC: FCPU integer
                                   4631 ; set CPU frequency 
                                   4632 ;-------------------------- 
                                   4633 
      00193B                       4634 fcpu:
      009759 89 8E            [ 1] 4635 	ld a,#TK_INTGR
      00975B AE 97 75         [ 4] 4636 	call expect 
      00975E CD               [ 1] 4637 	ld a,xl 
      00975F A2 C0            [ 1] 4638 	and a,#7 
      009761 CD 94 EA         [ 1] 4639 	ld CLK_CKDIVR,a 
      009764 5F               [ 4] 4640 	ret 
                                   4641 
                                   4642 ;------------------------------
                                   4643 ; BASIC: PMODE pin#, mode 
                                   4644 ; Arduino pin. 
                                   4645 ; define pin as input or output
                                   4646 ; pin#: {0..15}
                                   4647 ; mode: INPUT|OUTPUT  
                                   4648 ;------------------------------
                           000001  4649 	PINNO=1
                           000001  4650 	VSIZE=1
      001947                       4651 pin_mode:
      001947                       4652 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009765 35 0A            [ 2]    1     sub sp,#VSIZE 
      009767 00 0B CD         [ 4] 4653 	call arg_list 
      00976A 89 9E            [ 1] 4654 	cp a,#2 
      00976C AE 97            [ 1] 4655 	jreq 1$
      00976E 7D CD A2         [ 2] 4656 	jp syntax_error 
      009771 C0 5B            [ 2] 4657 1$: popw y ; mode 
      009773 02               [ 2] 4658 	popw x ; Dx pin 
      009774 81 20 66         [ 4] 4659 	call select_pin 
      009777 69 6C            [ 1] 4660 	ld (PINNO,sp),a  
      009779 65 73            [ 1] 4661 	ld a,#1 
      00977B 0A 00            [ 1] 4662 	tnz (PINNO,sp)
      00977D 20 62            [ 1] 4663 	jreq 4$
      00977F 79               [ 1] 4664 2$:	sll a 
      009780 74 65            [ 1] 4665 	dec (PINNO,sp)
      009782 73 20            [ 1] 4666 	jrne 2$ 
      009784 66 72            [ 1] 4667 	ld (PINNO,sp),a
      009786 65 65            [ 1] 4668 	ld a,(PINNO,sp)
      009788 0A 00            [ 1] 4669 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00978A E7 03            [ 1] 4670 	ld (GPIO_CR1,x),a 
      00978A 52 02 72 5F      [ 2] 4671 4$:	cpw y,#OUTP 
      00978E 00 17            [ 1] 4672 	jreq 6$
                                   4673 ; input mode
                                   4674 ; disable external interrupt 
      009790 CD 8D            [ 1] 4675 	ld a,(PINNO,sp)
      009792 E5               [ 1] 4676 	cpl a 
      009793 A1 84            [ 1] 4677 	and a,(GPIO_CR2,x)
      009795 27 03            [ 1] 4678 	ld (GPIO_CR2,x),a 
                                   4679 ;clear bit in DDR for input mode 
      009797 CC 88            [ 1] 4680 	ld a,(PINNO,sp)
      009799 3B               [ 1] 4681 	cpl a 
      00979A 1F 01            [ 1] 4682 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00979C CD 89            [ 1] 4683 	ld (GPIO_DDR,x),a 
      00979E 2D A1            [ 2] 4684 	jra 9$
      001984                       4685 6$: ;output mode  
      0097A0 09 27            [ 1] 4686 	ld a,(PINNO,sp)
      0097A2 02 20            [ 1] 4687 	or a,(GPIO_DDR,x) ; bit==1 for output 
      0097A4 19 CD            [ 1] 4688 	ld (GPIO_DDR,x),a 
      0097A6 8D E5            [ 1] 4689 	ld a,(PINNO,sp)
      0097A8 A1 84            [ 1] 4690 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      0097AA 27 03            [ 1] 4691 	ld (GPIO_CR2,x),a 
      001990                       4692 9$:	
      001990                       4693 	_drop VSIZE 
      0097AC CC 88            [ 2]    1     addw sp,#VSIZE 
      0097AE 3B               [ 4] 4694 	ret
                                   4695 
                                   4696 ;------------------------
                                   4697 ; select Arduino pin 
                                   4698 ; input:
                                   4699 ;   X 	 {0..15} Arduino Dx 
                                   4700 ; output:
                                   4701 ;   A     stm8s208 pin 
                                   4702 ;   X     base address s208 GPIO port 
                                   4703 ;---------------------------
      001993                       4704 select_pin:
      0097AF 9F               [ 2] 4705 	sllw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0097B0 1E 01 CF         [ 2] 4706 	addw x,#arduino_to_8s208 
      0097B3 00               [ 2] 4707 	ldw x,(x)
      0097B4 18               [ 1] 4708 	ld a,xl 
      0097B5 5F               [ 1] 4709 	push a 
      0097B6 CD               [ 1] 4710 	swapw x 
      0097B7 82 8D            [ 1] 4711 	ld a,#5 
      0097B9 1E               [ 4] 4712 	mul x,a 
      0097BA 01 5C 20         [ 2] 4713 	addw x,#GPIO_BASE 
      0097BD DC               [ 1] 4714 	pop a 
      0097BE 81               [ 4] 4715 	ret 
                                   4716 ; translation from Arduino D0..D15 to stm8s208rb 
      0019A3                       4717 arduino_to_8s208:
      0097BE 5B 02                 4718 .byte 3,6 ; D0 
      0097C0 81 05                 4719 .byte 3,5 ; D1 
      0097C1 04 00                 4720 .byte 4,0 ; D2 
      0097C1 CD 8C                 4721 .byte 2,1 ; D3
      0097C3 E1 A1                 4722 .byte 6,0 ; D4
      0097C5 01 27                 4723 .byte 2,2 ; D5
      0097C7 03 CC                 4724 .byte 2,3 ; D6
      0097C9 88 3B                 4725 .byte 3,1 ; D7
      0097CB 85 9F                 4726 .byte 3,3 ; D8
      0097CD A4 7F                 4727 .byte 2,4 ; D9
      0097CF 97 A6                 4728 .byte 4,5 ; D10
      0097D1 03 81                 4729 .byte 2,6 ; D11
      0097D3 02 07                 4730 .byte 2,7 ; D12
      0097D3 A6 07                 4731 .byte 2,5 ; D13
      0097D5 CD 8C                 4732 .byte 4,2 ; D14
      0097D7 D4 CD                 4733 .byte 4,1 ; D15
                                   4734 
                                   4735 
                                   4736 ;------------------------------
                                   4737 ; BASIC: RND(expr)
                                   4738 ; return random number 
                                   4739 ; between 1 and expr inclusive
                                   4740 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4741 ; input:
                                   4742 ; 	none 
                                   4743 ; output:
                                   4744 ;	X 		random positive integer 
                                   4745 ;------------------------------
      0019C3                       4746 random:
      0097D9 89 2D A1         [ 4] 4747 	call func_args 
      0097DC 02 27            [ 1] 4748 	cp a,#1
      0097DE 0E A1            [ 1] 4749 	jreq 1$
      0097E0 03 27 0D         [ 2] 4750 	jp syntax_error
      0019CD                       4751 1$:  
      0097E3 A1 82            [ 1] 4752 	ld a,#0x80 
      0097E5 27 03            [ 1] 4753 	bcp a,(1,sp)
      0097E7 CC 88            [ 1] 4754 	jreq 2$
      0097E9 3B FD            [ 1] 4755 	ld a,#ERR_BAD_VALUE
      0097EB 20 03 BD         [ 2] 4756 	jp tb_error
      0097ED                       4757 2$: 
                                   4758 ; acc16=(x<<5)^x 
      0097ED F6 5F 97         [ 2] 4759 	ldw x,seedx 
      0097F0 58               [ 2] 4760 	sllw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0097F0 89               [ 2] 4761 	sllw x 
      0097F1 A6               [ 2] 4762 	sllw x 
      0097F2 08               [ 2] 4763 	sllw x 
      0097F3 CD               [ 2] 4764 	sllw x 
      0097F4 8C               [ 1] 4765 	ld a,xh 
      0097F5 D4 85 A6         [ 1] 4766 	xor a,seedx 
      0097F8 84 81 0C         [ 1] 4767 	ld acc16,a 
      0097FA 9F               [ 1] 4768 	ld a,xl 
      0097FA CD 83 CB         [ 1] 4769 	xor a,seedx+1 
      0097FD 5F 97 A6         [ 1] 4770 	ld acc8,a 
                                   4771 ; seedx=seedy 
      009800 84 81 14         [ 2] 4772 	ldw x,seedy 
      009802 CF 00 12         [ 2] 4773 	ldw seedx,x  
                                   4774 ; seedy=seedy^(seedy>>1)
      009802 5F C6            [ 2] 4775 	srlw y 
      009804 00 2E            [ 1] 4776 	ld a,yh 
      009806 C1 00 2F         [ 1] 4777 	xor a,seedy 
      009809 27 01 53         [ 1] 4778 	ld seedy,a  
      00980C A6 84            [ 1] 4779 	ld a,yl 
      00980E 81 00 15         [ 1] 4780 	xor a,seedy+1 
      00980F C7 00 15         [ 1] 4781 	ld seedy+1,a 
                                   4782 ; acc16>>3 
      00980F CD 8C E1         [ 2] 4783 	ldw x,acc16 
      009812 A1               [ 2] 4784 	srlw x 
      009813 02               [ 2] 4785 	srlw x 
      009814 27               [ 2] 4786 	srlw x 
                                   4787 ; x=acc16^x 
      009815 03               [ 1] 4788 	ld a,xh 
      009816 CC 88 3B         [ 1] 4789 	xor a,acc16 
      009819 95               [ 1] 4790 	ld xh,a 
      009819 1E               [ 1] 4791 	ld a,xl 
      00981A 03 2B 17         [ 1] 4792 	xor a,acc8 
      00981D A3               [ 1] 4793 	ld xl,a 
                                   4794 ; seedy=x^seedy 
      00981E 00 09 2A         [ 1] 4795 	xor a,seedy+1
      009821 12               [ 1] 4796 	ld xl,a 
      009822 A6               [ 1] 4797 	ld a,xh 
      009823 05 42 1C         [ 1] 4798 	xor a,seedy
      009826 50               [ 1] 4799 	ld xh,a 
      009827 00 1F 03         [ 2] 4800 	ldw seedy,x 
                                   4801 ; return seedy modulo expr + 1 
      00982A 1E 01            [ 2] 4802 	popw y 
      00982C 72               [ 2] 4803 	divw x,y 
      00982D FB               [ 1] 4804 	ldw x,y 
      00982E 03               [ 1] 4805 	incw x 
      001A27                       4806 10$:
      00982F A6 84            [ 1] 4807 	ld a,#TK_INTGR
      009831 5B               [ 4] 4808 	ret 
                                   4809 
                                   4810 ;---------------------------------
                                   4811 ; BASIC: WORDS 
                                   4812 ; affiche la listes des mots du
                                   4813 ; dictionnaire ainsi que le nombre
                                   4814 ; de mots.
                                   4815 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                           000001  4816 	WLEN=1 ; word length
                           000002  4817 	LLEN=2 ; character sent to console
                           000003  4818 	WCNT=3 ; count words printed 
                           000003  4819 	VSIZE=3 
      001A2A                       4820 words:
      001A2A                       4821 	_vars VSIZE
      009832 04 81            [ 2]    1     sub sp,#VSIZE 
      009834 0F 02            [ 1] 4822 	clr (LLEN,sp)
      009834 A6 0A            [ 1] 4823 	clr (WCNT,sp)
      009836 CC 88 3D 15      [ 2] 4824 	ldw y,#kword_dict+2
      009839 93               [ 1] 4825 0$:	ldw x,y
      009839 AE               [ 1] 4826 	ld a,(x)
      00983A A2 80            [ 1] 4827 	and a,#15 
      00983C A6 84            [ 1] 4828 	ld (WLEN,sp),a 
      00983E 81 03            [ 1] 4829 	inc (WCNT,sp)
      00983F 5C               [ 1] 4830 1$:	incw x 
      00983F 90               [ 1] 4831 	ld a,(x)
      009840 89 CD 8C         [ 4] 4832 	call putc 
      009843 E1 A1            [ 1] 4833 	inc (LLEN,sp)
      009845 01 27            [ 1] 4834 	dec (WLEN,sp)
      009847 07 A1            [ 1] 4835 	jrne 1$
      009849 02 27            [ 1] 4836 	ld a,#70
      00984B 03 CC            [ 1] 4837 	cp a,(LLEN,sp)
      00984D 88 3B            [ 1] 4838 	jrmi 2$   
      00984F 90 85            [ 1] 4839 	ld a,#SPACE 
      009851 A1 01 27         [ 4] 4840 	call putc 
      009854 02 85            [ 1] 4841 	inc (LLEN,sp) 
      009856 51 90            [ 2] 4842 	jra 3$
      009858 FD 90            [ 1] 4843 2$: ld a,#CR 
      00985A 85 81 2B         [ 4] 4844 	call putc 
      00985C 0F 02            [ 1] 4845 	clr (LLEN,sp)
      00985C 72 0D 52 30      [ 2] 4846 3$:	subw y,#2 
      009860 FB 8E            [ 2] 4847 	ldw y,(y)
      009862 CC 85            [ 1] 4848 	jrne 0$ 
      009864 97 0D            [ 1] 4849 	ld a,#CR 
      009865 CD 03 2B         [ 4] 4850 	call putc  
      009865 72               [ 1] 4851 	clrw x 
      009866 01 00            [ 1] 4852 	ld a,(WCNT,sp)
      009868 24               [ 1] 4853 	ld xl,a 
      009869 07 27 05         [ 4] 4854 	call print_int 
      00986C A6 07 CC         [ 2] 4855 	ldw x,#words_count_msg
      00986F 88 3D 00         [ 4] 4856 	call puts 
      009871                       4857 	_drop VSIZE 
      009871 CD 89            [ 2]    1     addw sp,#VSIZE 
      009873 2D               [ 4] 4858 	ret 
      009874 4D 26 08 AE 40 00 CD  4859 words_count_msg: .asciz " words in dictionary\n"
             A2 C0 4F 81 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   4860 
                                   4861 
                                   4862 ;-----------------------------
                                   4863 ; BASIC: TIMER expr 
                                   4864 ; initialize count down timer 
                                   4865 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      00987F                       4866 set_timer:
      00987F A1 02 27         [ 4] 4867 	call arg_list
      009882 03 CC            [ 1] 4868 	cp a,#1 
      009884 88 3B            [ 1] 4869 	jreq 1$
      009886 CC 07 BB         [ 2] 4870 	jp syntax_error
      001A9A                       4871 1$: 
      009886 7D               [ 2] 4872 	popw x 
      009887 26 09 CD         [ 2] 4873 	ldw timer,x 
      00988A 86               [ 4] 4874 	ret 
                                   4875 
                                   4876 ;------------------------------
                                   4877 ; BASIC: TIMEOUT 
                                   4878 ; return state of timer 
                                   4879 ;------------------------------
      001A9F                       4880 timeout:
      00988B 58 55 00         [ 2] 4881 	ldw x,timer 
      001AA2                       4882 logical_complement:
      00988E 04               [ 2] 4883 	cplw x 
      00988F 00 02 81         [ 2] 4884 	cpw x,#-1
      009892 89 90            [ 1] 4885 	jreq 2$
      009894 93               [ 1] 4886 	clrw x 
      009895 CD 95            [ 1] 4887 2$:	ld a,#TK_INTGR
      009897 1E               [ 4] 4888 	ret 
                                   4889 
                                   4890 ;--------------------------------
                                   4891 ; BASIC NOT(expr) 
                                   4892 ; return logical complement of expr
                                   4893 ;--------------------------------
      001AAC                       4894 func_not:
      009898 25 05 A6         [ 4] 4895 	call func_args  
      00989B 09 CC            [ 1] 4896 	cp a,#1
      00989D 88 3D            [ 1] 4897 	jreq 1$
      00989F CC 07 BB         [ 2] 4898 	jp syntax_error
      00989F 55               [ 2] 4899 1$:	popw x 
      0098A0 00 04            [ 2] 4900 	jra logical_complement
                                   4901 
                                   4902 
                                   4903 
                                   4904 ;-----------------------------------
                                   4905 ; BASIC: IWDGEN expr1 
                                   4906 ; enable independant watchdog timer
                                   4907 ; expr1 is delay in multiple of 62.5µsec
                                   4908 ; expr1 -> {1..16383}
                                   4909 ;-----------------------------------
      001AB9                       4910 enable_iwdg:
      0098A2 00 02 72         [ 4] 4911 	call arg_list
      0098A5 5F 00            [ 1] 4912 	cp a,#1 
      0098A7 17 AE            [ 1] 4913 	jreq 1$
      0098A9 40 00 CF         [ 2] 4914 	jp syntax_error 
      0098AC 00               [ 2] 4915 1$: popw x 
      0098AD 18 1E            [ 1] 4916 	push #0
      0098AF 01 CD 84 B4      [ 1] 4917 	mov IWDG_KR,#IWDG_KEY_ENABLE
      0098B3 5F               [ 1] 4918 	ld a,xh 
      0098B4 97 5C            [ 1] 4919 	and a,#0x3f
      0098B6 90               [ 1] 4920 	ld xh,a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      0098B7 85 89 5F         [ 2] 4921 2$:	cpw x,#255
      0098BA CD 83            [ 2] 4922 	jrule 3$
      0098BC 02 5B            [ 1] 4923 	inc (1,sp)
      0098BE 02               [ 1] 4924 	rcf 
      0098BF 81               [ 2] 4925 	rrcw x 
      0098C0 20 F5            [ 2] 4926 	jra 2$
      0098C0 72 0D 52 30      [ 1] 4927 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      0098C4 FB               [ 1] 4928 	pop a  
      0098C5 72 16 00         [ 1] 4929 	ld IWDG_PR,a 
      0098C8 24               [ 1] 4930 	ld a,xl
      0098C9 8E               [ 1] 4931 	dec a 
      0098CA 81 55 50 E0      [ 1] 4932 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      0098CB C7 50 E2         [ 1] 4933 	ld IWDG_RLR,a 
      0098CB CD 8D E5 A1      [ 1] 4934 	mov IWDG_KR,#IWDG_KEY_REFRESH
      0098CF 84               [ 4] 4935 	ret 
                                   4936 
                                   4937 
                                   4938 ;-----------------------------------
                                   4939 ; BASIC: IWDGREF  
                                   4940 ; refresh independant watchdog count down 
                                   4941 ; timer before it reset MCU. 
                                   4942 ;-----------------------------------
      001AEF                       4943 refresh_iwdg:
      0098D0 27 03 CC 88      [ 1] 4944 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      0098D4 3B               [ 4] 4945 	ret 
                                   4946 
                                   4947 
                                   4948 ;-------------------------------------
                                   4949 ; BASIC: LOG(expr)
                                   4950 ; return logarithm base 2 of expr 
                                   4951 ; this is the position of most significant
                                   4952 ; bit set. 
                                   4953 ; input: 
                                   4954 ; output:
                                   4955 ;   X     log2 
                                   4956 ;   A     TK_INTGR 
                                   4957 ;*********************************
      0098D5                       4958 log2:
      0098D5 5D 27 04         [ 4] 4959 	call func_args 
      0098D8 8F 5A            [ 1] 4960 	cp a,#1 
      0098DA 26 F9            [ 1] 4961 	jreq 1$
      0098DC 4F 81 BB         [ 2] 4962 	jp syntax_error 
      0098DE 85               [ 2] 4963 1$: popw x 
      001AFF                       4964 leading_one:
      0098DE CD               [ 2] 4965 	tnzw x 
      0098DF 8D E5            [ 1] 4966 	jreq 4$
      0098E1 A1 84            [ 1] 4967 	ld a,#15 
      0098E3 27               [ 2] 4968 2$: rlcw x 
      0098E4 03 CC            [ 1] 4969     jrc 3$
      0098E6 88               [ 1] 4970 	dec a 
      0098E7 3B FA            [ 2] 4971 	jra 2$
      0098E8 5F               [ 1] 4972 3$: clrw x 
      0098E8 A3               [ 1] 4973     ld xl,a
      0098E9 14 00            [ 1] 4974 4$:	ld a,#TK_INTGR
      0098EB 2B               [ 4] 4975 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4976 
                                   4977 ;-----------------------------------
                                   4978 ; BASIC: BIT(expr) 
                                   4979 ; expr ->{0..15}
                                   4980 ; return 2^expr 
                                   4981 ; output:
                                   4982 ;    x    2^expr 
                                   4983 ;-----------------------------------
      001B0F                       4984 bitmask:
      0098EC 0C 35 0F         [ 4] 4985     call func_args 
      0098EF 50 F2            [ 1] 4986 	cp a,#1
      0098F1 A6 1E            [ 1] 4987 	jreq 1$
      0098F3 62 A6 10         [ 2] 4988 	jp syntax_error 
      0098F6 62               [ 2] 4989 1$: popw x 
      0098F7 20               [ 1] 4990 	ld a,xl 
      0098F8 1E 0F            [ 1] 4991 	and a,#15
      0098F9 5F               [ 1] 4992 	clrw x 
      0098F9 A3               [ 1] 4993 	incw x 
      0098FA 08               [ 1] 4994 2$: tnz a 
      0098FB 00 2B            [ 1] 4995 	jreq 3$
      0098FD 09               [ 2] 4996 	slaw x 
      0098FE 35               [ 1] 4997 	dec a 
      0098FF 0E 50            [ 2] 4998 	jra 2$ 
      009901 F2 A6            [ 1] 4999 3$: ld a,#TK_INTGR
      009903 50               [ 4] 5000 	ret 
                                   5001 
                                   5002 ;------------------------------
                                   5003 ; BASIC: INVERT(expr)
                                   5004 ; 1's complement 
                                   5005 ;--------------------------------
      001B29                       5006 invert:
      009904 62 20 10         [ 4] 5007 	call func_args
      009907 A1 01            [ 1] 5008 	cp a,#1 
      009907 35 07            [ 1] 5009 	jreq 1$
      009909 50 F2 BB         [ 2] 5010 	jp syntax_error
      00990B 85               [ 2] 5011 1$: popw x  
      00990B A3               [ 2] 5012 	cplw x 
      00990C 00 40            [ 1] 5013 	ld a,#TK_INTGR 
      00990E 23               [ 4] 5014 	ret 
                                   5015 
                                   5016 ;------------------------------
                                   5017 ; BASIC: DO 
                                   5018 ; initiate a DO ... UNTIL loop 
                                   5019 ;------------------------------
                           000003  5020 	DOLP_ADR=3 
                           000005  5021 	DOLP_INW=5
                           000004  5022 	VSIZE=4 
      001B38                       5023 do_loop:
      00990F 07               [ 2] 5024 	popw x 
      001B39                       5025 	_vars VSIZE 
      009910 72 5C            [ 2]    1     sub sp,#VSIZE 
      009912 50               [ 2] 5026 	pushw x 
      009913 F2 54 20 F4      [ 2] 5027 	ldw y,basicptr 
      009917 17 03            [ 2] 5028 	ldw (DOLP_ADR,sp),y
      009917 9F 4A 27 01      [ 2] 5029 	ldw y,in.w 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      00991B 4A 05            [ 2] 5030 	ldw (DOLP_INW,sp),y
      00991C 72 5C 00 20      [ 1] 5031 	inc loop_depth 
      00991C A4               [ 4] 5032 	ret 
                                   5033 
                                   5034 ;--------------------------------
                                   5035 ; BASIC: UNTIL expr 
                                   5036 ; loop if exprssion is false 
                                   5037 ; else terminate loop
                                   5038 ;--------------------------------
      001B4D                       5039 until: 
      00991D 3E C7 50 F1      [ 1] 5040 	tnz loop_depth 
      009921 72 18            [ 1] 5041 	jrne 1$ 
      009923 50 F0 8E         [ 2] 5042 	jp syntax_error 
      001B56                       5043 1$: 
      009926 81 0D AE         [ 4] 5044 	call relation 
      009927 A1 84            [ 1] 5045 	cp a,#TK_INTGR
      009927 CE 00            [ 1] 5046 	jreq 2$
      009929 0F A6 84         [ 2] 5047 	jp syntax_error
      001B60                       5048 2$: 
      00992C 81               [ 2] 5049 	tnzw x 
      00992D 26 10            [ 1] 5050 	jrne 9$
      00992D CD 8C            [ 2] 5051 	ldw x,(DOLP_ADR,sp)
      00992F E1 A1 01         [ 2] 5052 	ldw basicptr,x 
      009932 27 03            [ 1] 5053 	ld a,(2,x)
      009934 CC 88 3B         [ 1] 5054 	ld count,a 
      009937 1E 05            [ 2] 5055 	ldw x,(DOLP_INW,sp)
      009937 85 9E A5         [ 2] 5056 	ldw in.w,x 
      00993A 80               [ 4] 5057 	ret 
      001B73                       5058 9$:	; remove loop data from stack  
      00993B 27               [ 2] 5059 	popw x
      001B74                       5060 	_drop VSIZE
      00993C 01 50            [ 2]    1     addw sp,#VSIZE 
      00993E A6 84 81 20      [ 1] 5061 	dec loop_depth 
      009941 FC               [ 2] 5062 	jp (x)
                                   5063 
                                   5064 ;--------------------------
                                   5065 ; BASIC: PRTA...PRTI  
                                   5066 ;  return constant value 
                                   5067 ;  PORT  offset in GPIO
                                   5068 ;  array
                                   5069 ;---------------------------
      001B7B                       5070 const_porta:
      009941 CD 8C E1         [ 2] 5071 	ldw x,#0
      009944 A1 02            [ 1] 5072 	ld a,#TK_INTGR 
      009946 27               [ 4] 5073 	ret 
      001B81                       5074 const_portb:
      009947 03 CC 88         [ 2] 5075 	ldw x,#1
      00994A 3B 85            [ 1] 5076 	ld a,#TK_INTGR 
      00994C 9E               [ 4] 5077 	ret 
      001B87                       5078 const_portc:
      00994D 14 01 95         [ 2] 5079 	ldw x,#2
      009950 9F 14            [ 1] 5080 	ld a,#TK_INTGR 
      009952 02               [ 4] 5081 	ret 
      001B8D                       5082 const_portd:
      009953 97 5B 02         [ 2] 5083 	ldw x,#3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009956 A6 84            [ 1] 5084 	ld a,#TK_INTGR 
      009958 81               [ 4] 5085 	ret 
      009959                       5086 const_porte:
      009959 CD 8C E1         [ 2] 5087 	ldw x,#4
      00995C A1 02            [ 1] 5088 	ld a,#TK_INTGR 
      00995E 27               [ 4] 5089 	ret 
      001B99                       5090 const_portf:
      00995F 03 CC 88         [ 2] 5091 	ldw x,#5
      009962 3B 84            [ 1] 5092 	ld a,#TK_INTGR 
      009963 81               [ 4] 5093 	ret 
      001B9F                       5094 const_portg:
      009963 85 9E 1A         [ 2] 5095 	ldw x,#6
      009966 01 95            [ 1] 5096 	ld a,#TK_INTGR 
      009968 9F               [ 4] 5097 	ret 
      001BA5                       5098 const_porth:
      009969 1A 02 97         [ 2] 5099 	ldw x,#7
      00996C 5B 02            [ 1] 5100 	ld a,#TK_INTGR 
      00996E A6               [ 4] 5101 	ret 
      001BAB                       5102 const_porti:
      00996F 84 81 08         [ 2] 5103 	ldw x,#8
      009971 A6 84            [ 1] 5104 	ld a,#TK_INTGR 
      009971 CD               [ 4] 5105 	ret 
                                   5106 
                                   5107 ;-------------------------------
                                   5108 ; following return constant 
                                   5109 ; related to GPIO register offset 
                                   5110 ;---------------------------------
      001BB1                       5111 const_odr:
      009972 8C E1            [ 1] 5112 	ld a,#TK_INTGR 
      009974 A1 02 27         [ 2] 5113 	ldw x,#GPIO_ODR
      009977 03               [ 4] 5114 	ret 
      001BB7                       5115 const_idr:
      009978 CC 88            [ 1] 5116 	ld a,#TK_INTGR 
      00997A 3B 00 01         [ 2] 5117 	ldw x,#GPIO_IDR
      00997B 81               [ 4] 5118 	ret 
      001BBD                       5119 const_ddr:
      00997B 85 9E            [ 1] 5120 	ld a,#TK_INTGR 
      00997D 18 01 95         [ 2] 5121 	ldw x,#GPIO_DDR
      009980 9F               [ 4] 5122 	ret 
      001BC3                       5123 const_cr1:
      009981 18 02            [ 1] 5124 	ld a,#TK_INTGR 
      009983 97 5B 02         [ 2] 5125 	ldw x,#GPIO_CR1
      009986 A6               [ 4] 5126 	ret 
      001BC9                       5127 const_cr2:
      009987 84 81            [ 1] 5128 	ld a,#TK_INTGR 
      009989 AE 00 04         [ 2] 5129 	ldw x,#GPIO_CR2
      009989 CD               [ 4] 5130 	ret 
                                   5131 ;-------------------------
                                   5132 ; BASIC: POUT 
                                   5133 ;  constant for port mode
                                   5134 ;  used by PMODE 
                                   5135 ;  to set pin as output
                                   5136 ;------------------------
      001BCF                       5137 const_output:
      00998A 8C E1            [ 1] 5138 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      00998C A1 02 27         [ 2] 5139 	ldw x,#OUTP
      00998F 03               [ 4] 5140 	ret 
                                   5141 
                                   5142 ;-------------------------
                                   5143 ; BASIC: PINP 
                                   5144 ;  constant for port mode
                                   5145 ;  used by PMODE 
                                   5146 ;  to set pin as input
                                   5147 ;------------------------
      001BD5                       5148 const_input:
      009990 CC 88            [ 1] 5149 	ld a,#TK_INTGR 
      009992 3B 90 85         [ 2] 5150 	ldw x,#INP 
      009995 85               [ 4] 5151 	ret 
                                   5152 	
                                   5153 ;-----------------------
                                   5154 ; memory area constants
                                   5155 ;-----------------------
      001BDB                       5156 const_eeprom_base:
      009996 90 5D            [ 1] 5157 	ld a,#TK_INTGR 
      009998 27 05 58         [ 2] 5158 	ldw x,#EEPROM_BASE 
      00999B 90               [ 4] 5159 	ret 
                                   5160 
                                   5161 ;---------------------------
                                   5162 ; BASIC: DATA 
                                   5163 ; when the interpreter find 
                                   5164 ; a DATA line it skip it.
                                   5165 ;---------------------------
      001BE1                       5166 data:
      00999C 5A 26 FB 00 01   [ 1] 5167 	mov in,count 
      00999F 81               [ 4] 5168 	ret 
                                   5169 
                                   5170 ;---------------------------
                                   5171 ; BASIC: DATLN  *expr*
                                   5172 ; set DATA pointer at line# 
                                   5173 ; specified by *expr* 
                                   5174 ;---------------------------
      001BE7                       5175 data_line:
      00999F A6 84 81         [ 4] 5176 	call expression
      0099A2 A1 84            [ 1] 5177 	cp a,#TK_INTGR
      0099A2 CD 8C            [ 1] 5178 	jreq 1$
      0099A4 E1 A1 02         [ 2] 5179 	jp syntax_error 
      0099A7 27 03 CC         [ 4] 5180 1$: call search_lineno
      0099AA 88               [ 2] 5181 	tnzw x 
      0099AB 3B 90            [ 1] 5182 	jrne 3$
      0099AD 85 85            [ 1] 5183 2$:	ld a,#ERR_NO_LINE 
      0099AF 90 5D 27         [ 2] 5184 	jp tb_error
      001BFC                       5185 3$: ; check if valid data line 
      0099B2 05 54            [ 1] 5186     ldw y,x 
      0099B4 90 5A            [ 2] 5187 	ldw x,(4,x)
      0099B6 26 FB E1         [ 2] 5188 	cpw x,#data 
      0099B8 26 F2            [ 1] 5189 	jrne 2$ 
      0099B8 A6 84 81 06      [ 2] 5190 	ldw data_ptr,y
      0099BB 90 E6 02         [ 1] 5191 	ld a,(2,y)
      0099BB A6 84 CD         [ 1] 5192 	ld data_len,a 
      0099BE 8C D4 9F A4      [ 1] 5193 	mov data_ofs,#FIRST_DATA_ITEM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      0099C2 07               [ 4] 5194 	ret
                                   5195 
                                   5196 ;---------------------------------
                                   5197 ; BASIC: RESTORE 
                                   5198 ; set data_ptr to first data line
                                   5199 ; if not DATA found pointer set to
                                   5200 ; zero 
                                   5201 ;---------------------------------
      001C14                       5202 restore:
      0099C3 C7 50 C6 81      [ 1] 5203 	clr data_ptr 
      0099C7 72 5F 00 07      [ 1] 5204 	clr data_ptr+1
      0099C7 52 01 CD 8C      [ 1] 5205 	clr data_ofs 
      0099CB E6 A1 02 27      [ 1] 5206 	clr data_len
      0099CF 03 CC 88         [ 2] 5207 	ldw x,txtbgn
      001C27                       5208 data_search_loop: 	
      0099D2 3B 90 85         [ 2] 5209 	cpw x,txtend
      0099D5 85 CD            [ 1] 5210 	jruge 9$
      0099D7 9A 13            [ 1] 5211 	ldw y,x 
      0099D9 6B 01            [ 2] 5212 	ldw x,(4,x)
      0099DB A6 01 0D         [ 2] 5213 	addw x,#code_addr
      0099DE 01               [ 2] 5214 	ldw x,(x)
      0099DF 27 0D 48         [ 2] 5215 	cpw x,#data 
      0099E2 0A 01            [ 1] 5216 	jrne try_next_line 
      0099E4 26 FB 6B 01      [ 2] 5217 	ldw data_ptr,y 
      0099E8 7B 01 EA         [ 1] 5218 	ld a,(2,y)
      0099EB 03 E7 03         [ 1] 5219 	ld data_len,a 
      0099EE 90 A3 00 01      [ 1] 5220 	mov data_ofs,#FIRST_DATA_ITEM
      0099F2 27 10 7B 01      [ 1] 5221 9$:	tnz data_len 
      0099F6 43 E4            [ 1] 5222     jrne 10$
      0099F8 04 E7            [ 1] 5223 	ld a,#ERR_NO_DATA 
      0099FA 04 7B 01         [ 2] 5224 	jp tb_error 
      0099FD 43               [ 4] 5225 10$:ret
      001C53                       5226 try_next_line:
      0099FE E4               [ 1] 5227 	ldw x,y 
      0099FF 02 E7            [ 1] 5228 	ld a,(2,x)
      009A01 02 20 0C         [ 1] 5229 	ld acc8,a 
      009A04 72 5F 00 0C      [ 1] 5230 	clr acc16 
      009A04 7B 01 EA 02      [ 2] 5231 	addw x,acc16 
      009A08 E7 02            [ 2] 5232 	jra data_search_loop
                                   5233 
                                   5234 
                                   5235 ;---------------------------------
                                   5236 ; BASIC: READ 
                                   5237 ; return next data item | 0 
                                   5238 ;---------------------------------
                           000001  5239 	CTX_BPTR=1 
                           000003  5240 	CTX_IN=3 
                           000004  5241 	CTX_COUNT=4 
                           000005  5242 	XSAVE=5
                           000006  5243 	VSIZE=6
      001C63                       5244 read:
      001C63                       5245 	_vars  VSIZE 
      009A0A 7B 01            [ 2]    1     sub sp,#VSIZE 
      001C65                       5246 read01:	
      009A0C EA 04 E7         [ 1] 5247 	ld a,data_ofs
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009A0F 04 00 09         [ 1] 5248 	cp a,data_len 
      009A10 27 37            [ 1] 5249 	jreq 2$ ; end of line  
      009A10 5B 01 81         [ 4] 5250 	call save_context
      009A13 CE 00 06         [ 2] 5251 	ldw x,data_ptr 
      009A13 58 1C 9A         [ 2] 5252 	ldw basicptr,x 
      009A16 23 FE 9F 88 5E   [ 1] 5253 	mov in,data_ofs 
      009A1B A6 05 42 1C 50   [ 1] 5254 	mov count,data_len  
      009A20 00 84 81         [ 4] 5255 	call expression 
      009A23 A1 84            [ 1] 5256 	cp a,#TK_INTGR 
      009A23 03 06            [ 1] 5257 	jreq 1$ 
      009A25 03 05 04         [ 2] 5258 	jp syntax_error 
      001C8A                       5259 1$:
      009A28 00 02            [ 2] 5260 	ldw (XSAVE,SP),x
      009A2A 01 06 00         [ 4] 5261 	call next_token ; skip comma
      009A2D 02 02 02         [ 2] 5262 	ldw x,basicptr 
      009A30 03 03 01         [ 2] 5263 	ldw data_ptr,x 
      009A33 03 03 02 04 04   [ 1] 5264 	mov data_ofs,in 
      009A38 05 02 06         [ 4] 5265 	call rest_context
      009A3B 02 07            [ 2] 5266 	ldw x,(XSAVE,sp)
      009A3D 02 05            [ 1] 5267 	ld a,#TK_INTGR
      001CA1                       5268 	_drop VSIZE 
      009A3F 04 02            [ 2]    1     addw sp,#VSIZE 
      009A41 04               [ 4] 5269 	ret 
      001CA4                       5270 2$: ; end of line reached 
      009A42 01 CE 00 06      [ 2] 5271 	ldw y, data_ptr 
      009A43 72 5F 00 06      [ 1] 5272 	clr data_ptr
      009A43 CD 8C E1 A1      [ 1] 5273 	clr data_ptr+1   
      009A47 01 27 03 CC      [ 1] 5274 	clr data_ofs 
      009A4B 88 3B 00 09      [ 1] 5275 	clr data_len 
      009A4D CD 1C 53         [ 4] 5276 	call try_next_line 
      009A4D A6 80            [ 2] 5277 	jra read01
                                   5278 
                                   5279 
                                   5280 ;---------------------------------
                                   5281 ; BASIC: SPIEN clkdiv, 0|1  
                                   5282 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   5283 ; if clkdiv==-1 disable SPI
                                   5284 ; 0|1 -> disable|enable  
                                   5285 ;--------------------------------- 
                           000005  5286 SPI_CS_BIT=5
      001CBD                       5287 spi_enable:
      009A4F 15 01 27         [ 4] 5288 	call arg_list 
      009A52 05 A6            [ 1] 5289 	cp a,#2
      009A54 0A CC            [ 1] 5290 	jreq 1$
      009A56 88 3D BB         [ 2] 5291 	jp syntax_error 
      009A58                       5292 1$: 
      009A58 CE 00 13 58      [ 1] 5293 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009A5C 58               [ 2] 5294 	popw x  
      009A5D 58               [ 2] 5295 	tnzw x 
      009A5E 58 58            [ 1] 5296 	jreq spi_disable 
      009A60 9E               [ 2] 5297 	popw x 
      009A61 C8 00            [ 1] 5298 	ld a,#(1<<SPI_CR1_BR)
      009A63 13               [ 4] 5299 	mul x,a 
      009A64 C7               [ 1] 5300 	ld a,xl 
      009A65 00 0D 9F         [ 1] 5301 	ld SPI_CR1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5302 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009A68 C8 00 14 C7      [ 1] 5303 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009A6C 00 0E CE 00      [ 1] 5304 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   5305 ; configure SPI as master mode 0.	
      009A70 15 CF 00 13      [ 1] 5306 	bset SPI_CR1,#SPI_CR1_MSTR
                                   5307 ; ~CS line controlled by sofware 	
      009A74 90 54 90 9E      [ 1] 5308 	bset SPI_CR2,#SPI_CR2_SSM 
      009A78 C8 00 15 C7      [ 1] 5309     bset SPI_CR2,#SPI_CR2_SSI 
                                   5310 ; enable SPI
      009A7C 00 15 90 9F      [ 1] 5311 	bset SPI_CR1,#SPI_CR1_SPE 	
      009A80 C8               [ 4] 5312 	ret 
      001CF0                       5313 spi_disable:
      001CF0                       5314 	_drop #2; throw first argument.
      009A81 00 16            [ 2]    1     addw sp,##2 
                                   5315 ; wait spi idle 
      009A83 C7 00            [ 1] 5316 1$:	ld a,#0x82 
      009A85 16 CE 00         [ 1] 5317 	and a,SPI_SR
      009A88 0D 54            [ 1] 5318 	cp a,#2 
      009A8A 54 54            [ 1] 5319 	jrne 1$
      009A8C 9E C8 00 0D      [ 1] 5320 	bres SPI_CR1,#SPI_CR1_SPE
      009A90 95 9F C8 00      [ 1] 5321 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009A94 0E 97 C8 00      [ 1] 5322 	bres PE_DDR,#SPI_CS_BIT 
      009A98 16               [ 4] 5323 	ret 
                                   5324 
      001D08                       5325 spi_clear_error:
      009A99 97 9E            [ 1] 5326 	ld a,#0x78 
      009A9B C8 00 15         [ 1] 5327 	bcp a,SPI_SR 
      009A9E 95 CF            [ 1] 5328 	jreq 1$
      009AA0 00 15 90 85      [ 1] 5329 	clr SPI_SR 
      009AA4 65               [ 4] 5330 1$: ret 
                                   5331 
      001D14                       5332 spi_send_byte:
      009AA5 93               [ 1] 5333 	push a 
      009AA6 5C 1D 08         [ 4] 5334 	call spi_clear_error
      009AA7 84               [ 1] 5335 	pop a 
      009AA7 A6 84 81 03 FB   [ 2] 5336 	btjf SPI_SR,#SPI_SR_TXE,.
      009AAA C7 52 04         [ 1] 5337 	ld SPI_DR,a
      009AAA 52 03 0F 02 0F   [ 2] 5338 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009AAF 03 90 AE         [ 1] 5339 	ld a,SPI_DR 
      009AB2 A1               [ 4] 5340 	ret 
                                   5341 
      001D2A                       5342 spi_rcv_byte:
      009AB3 95 93            [ 1] 5343 	ld a,#255
      009AB5 F6 A4 0F 6B 01   [ 2] 5344 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009ABA 0C 03 5C         [ 1] 5345 	ld a,SPI_DR 
      009ABD F6               [ 4] 5346 	ret
                                   5347 
                                   5348 ;------------------------------
                                   5349 ; BASIC: SPIWR byte [,byte]
                                   5350 ; write 1 or more byte
                                   5351 ;------------------------------
      001D35                       5352 spi_write:
      009ABE CD 83 AB         [ 4] 5353 	call expression
      009AC1 0C 02            [ 1] 5354 	cp a,#TK_INTGR 
      009AC3 0A 01            [ 1] 5355 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009AC5 26 F5 A6         [ 2] 5356 	jp syntax_error 
      001D3F                       5357 1$:	
      009AC8 46               [ 1] 5358 	ld a,xl 
      009AC9 11 02 2B         [ 4] 5359 	call spi_send_byte 
      009ACC 09 A6 20         [ 4] 5360 	call next_token 
      009ACF CD 83            [ 1] 5361 	cp a,#TK_COMMA 
      009AD1 AB 0C            [ 1] 5362 	jrne 2$ 
      009AD3 02 20            [ 2] 5363 	jra spi_write 
      009AD5 07               [ 1] 5364 2$:	tnz a 
      009AD6 A6 0D            [ 1] 5365 	jreq 3$
      001D4F                       5366 	_unget_token  
      009AD8 CD 83 AB 0F 02   [ 1]    1      mov in,in.saved  
      009ADD 72               [ 4] 5367 3$:	ret 
                                   5368 
                                   5369 
                                   5370 ;-------------------------------
                                   5371 ; BASIC: SPIRD 	
                                   5372 ; read one byte from SPI 
                                   5373 ;-------------------------------
      001D55                       5374 spi_read:
      009ADE A2 00 02         [ 4] 5375 	call spi_rcv_byte 
      009AE1 90               [ 1] 5376 	clrw x 
      009AE2 FE               [ 1] 5377 	ld xl,a 
      009AE3 26 CF            [ 1] 5378 	ld a,#TK_INTGR 
      009AE5 A6               [ 4] 5379 	ret 
                                   5380 
                                   5381 ;------------------------------
                                   5382 ; BASIC: SPISEL 0|1 
                                   5383 ; set state of ~CS line
                                   5384 ; 0|1 deselect|select  
                                   5385 ;------------------------------
      001D5D                       5386 spi_select:
      009AE6 0D CD 83         [ 4] 5387 	call next_token 
      009AE9 AB 5F            [ 1] 5388 	cp a,#TK_INTGR 
      009AEB 7B 03            [ 1] 5389 	jreq 1$
      009AED 97 CD 89         [ 2] 5390 	jp syntax_error 
      009AF0 8E               [ 2] 5391 1$: tnzw x  
      009AF1 AE 9A            [ 1] 5392 	jreq cs_high 
      009AF3 FA CD A2 C0      [ 1] 5393 	bres PE_ODR,#SPI_CS_BIT
      009AF7 5B               [ 4] 5394 	ret 
      001D6F                       5395 cs_high: 
      009AF8 03 81 20 77      [ 1] 5396 	bset PE_ODR,#SPI_CS_BIT
      009AFC 6F               [ 4] 5397 	ret 
                                   5398 
                                   5399 ;-------------------------------
                                   5400 ; BASIC: PAD 
                                   5401 ; Return pad buffer address.
                                   5402 ;------------------------------
      001D74                       5403 pad_ref:
      009AFD 72 64 73         [ 2] 5404 	ldw x,#pad 
      009B00 20 69            [ 1] 5405 	ld a,TK_INTGR
      009B02 6E               [ 4] 5406 	ret 
                                   5407 
                                   5408 
                                   5409 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5410 ;      dictionary 
                                   5411 ; format:
                                   5412 ;   link:   2 bytes 
                                   5413 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5414 ;   cmd_name: 16 byte max 
                                   5415 ;   cmd_index: 2 bytes 
                                   5416 ;------------------------------
                                   5417 	.macro _dict_entry len,name,cmd_idx 
                                   5418 	.word LINK 
                                   5419 	LINK=.
                                   5420 name:
                                   5421 	.byte len 	
                                   5422 	.ascii "name"
                                   5423 	.word cmd_idx 
                                   5424 	.endm 
                                   5425 
                           000000  5426 	LINK=0
                                   5427 ; respect alphabetic order for BASIC names from Z-A
                                   5428 ; this sort order is for a cleaner WORDS cmd output. 	
      001D7A                       5429 kword_end:
      001D7A                       5430 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      009B03 20 64                    1 	.word LINK 
                           001D7C     2 	LINK=.
      001D7C                          3 XOR:
      009B05 69                       4 	.byte 3+F_IFUNC 	
      009B06 63 74 69                 5 	.ascii "XOR"
      009B09 6F 6E                    6 	.word XOR_IDX 
      001D82                       5431 	_dict_entry,5,WRITE,WRITE_IDX;write  
      009B0B 61 72                    1 	.word LINK 
                           001D84     2 	LINK=.
      001D84                          3 WRITE:
      009B0D 79                       4 	.byte 5 	
      009B0E 0A 00 49 54 45           5 	.ascii "WRITE"
      009B10 00 C4                    6 	.word WRITE_IDX 
      001D8C                       5432 	_dict_entry,5,WORDS,WORDS_IDX;words 
      009B10 CD 8C                    1 	.word LINK 
                           001D8E     2 	LINK=.
      001D8E                          3 WORDS:
      009B12 E6                       4 	.byte 5 	
      009B13 A1 01 27 03 CC           5 	.ascii "WORDS"
      009B18 88 3B                    6 	.word WORDS_IDX 
      009B1A                       5433 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      009B1A 85 CF                    1 	.word LINK 
                           001D98     2 	LINK=.
      001D98                          3 WAIT:
      009B1C 00                       4 	.byte 4 	
      009B1D 11 81 49 54              5 	.ascii "WAIT"
      009B1F 00 C0                    6 	.word WAIT_IDX 
      001D9F                       5434 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      009B1F CE 00                    1 	.word LINK 
                           001DA1     2 	LINK=.
      001DA1                          3 USR:
      009B21 11                       4 	.byte 3+F_IFUNC 	
      009B22 55 53 52                 5 	.ascii "USR"
      009B22 53 A3                    6 	.word USR_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      001DA7                       5435 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      009B24 FF FF                    1 	.word LINK 
                           001DA9     2 	LINK=.
      001DA9                          3 UNTIL:
      009B26 27                       4 	.byte 5 	
      009B27 01 5F A6 84 81           5 	.ascii "UNTIL"
      009B2C 00 BC                    6 	.word UNTIL_IDX 
      001DB1                       5436 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      009B2C CD 8C                    1 	.word LINK 
                           001DB3     2 	LINK=.
      001DB3                          3 UFLASH:
      009B2E E1                       4 	.byte 6+F_IFUNC 	
      009B2F A1 01 27 03 CC 88        5 	.ascii "UFLASH"
      009B35 3B 85                    6 	.word UFLASH_IDX 
      001DBC                       5437 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      009B37 20 E9                    1 	.word LINK 
                           001DBE     2 	LINK=.
      009B39                          3 UBOUND:
      009B39 CD                       4 	.byte 6+F_IFUNC 	
      009B3A 8C E6 A1 01 27 03        5 	.ascii "UBOUND"
      009B40 CC 88                    6 	.word UBOUND_IDX 
      001DC7                       5438 	_dict_entry,4,TONE,TONE_IDX;tone  
      009B42 3B 85                    1 	.word LINK 
                           001DC9     2 	LINK=.
      001DC9                          3 TONE:
      009B44 4B                       4 	.byte 4 	
      009B45 00 35 CC 50              5 	.ascii "TONE"
      009B49 E0 9E                    6 	.word TONE_IDX 
      001DD0                       5439 	_dict_entry,2,TO,TO_IDX;to
      009B4B A4 3F                    1 	.word LINK 
                           001DD2     2 	LINK=.
      001DD2                          3 TO:
      009B4D 95                       4 	.byte 2 	
      009B4E A3 00                    5 	.ascii "TO"
      009B50 FF 23                    6 	.word TO_IDX 
      001DD7                       5440 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      009B52 06 0C                    1 	.word LINK 
                           001DD9     2 	LINK=.
      001DD9                          3 TIMER:
      009B54 01                       4 	.byte 5 	
      009B55 98 56 20 F5 35           5 	.ascii "TIMER"
      009B5A 55 50                    6 	.word TIMER_IDX 
      001DE1                       5441 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      009B5C E0 84                    1 	.word LINK 
                           001DE3     2 	LINK=.
      001DE3                          3 TIMEOUT:
      009B5E C7                       4 	.byte 7+F_IFUNC 	
      009B5F 50 E1 9F 4A 35 55 50     5 	.ascii "TIMEOUT"
      009B66 E0 C7                    6 	.word TMROUT_IDX 
      001DED                       5442 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      009B68 50 E2                    1 	.word LINK 
                           001DEF     2 	LINK=.
      001DEF                          3 TICKS:
      009B6A 35                       4 	.byte 5+F_IFUNC 	
      009B6B AA 50 E0 81 53           5 	.ascii "TICKS"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009B6F 00 AE                    6 	.word TICKS_IDX 
      001DF7                       5443 	_dict_entry,4,STOP,STOP_IDX;stop 
      009B6F 35 AA                    1 	.word LINK 
                           001DF9     2 	LINK=.
      001DF9                          3 STOP:
      009B71 50                       4 	.byte 4 	
      009B72 E0 81 4F 50              5 	.ascii "STOP"
      009B74 00 AC                    6 	.word STOP_IDX 
      001E00                       5444 	_dict_entry,4,STEP,STEP_IDX;step 
      009B74 CD 8C                    1 	.word LINK 
                           001E02     2 	LINK=.
      001E02                          3 STEP:
      009B76 E1                       4 	.byte 4 	
      009B77 A1 01 27 03              5 	.ascii "STEP"
      009B7B CC 88                    6 	.word STEP_IDX 
      001E09                       5445 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      009B7D 3B 85                    1 	.word LINK 
                           001E0B     2 	LINK=.
      009B7F                          3 SPIWR:
      009B7F 5D                       4 	.byte 5 	
      009B80 27 0A A6 0F 59           5 	.ascii "SPIWR"
      009B85 25 03                    6 	.word SPIWR_IDX 
      001E13                       5446 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      009B87 4A 20                    1 	.word LINK 
                           001E15     2 	LINK=.
      001E15                          3 SPISEL:
      009B89 FA                       4 	.byte 6 	
      009B8A 5F 97 A6 84 81 4C        5 	.ascii "SPISEL"
      009B8F 00 A6                    6 	.word SPISEL_IDX 
      001E1E                       5447 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      009B8F CD 8C                    1 	.word LINK 
                           001E20     2 	LINK=.
      001E20                          3 SPIRD:
      009B91 E1                       4 	.byte 5+F_IFUNC 	
      009B92 A1 01 27 03 CC           5 	.ascii "SPIRD"
      009B97 88 3B                    6 	.word SPIRD_IDX 
      001E28                       5448 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      009B99 85 9F                    1 	.word LINK 
                           001E2A     2 	LINK=.
      001E2A                          3 SPIEN:
      009B9B A4                       4 	.byte 5 	
      009B9C 0F 5F 5C 4D 27           5 	.ascii "SPIEN"
      009BA1 04 58                    6 	.word SPIEN_IDX 
      001E32                       5449 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      009BA3 4A 20                    1 	.word LINK 
                           001E34     2 	LINK=.
      001E34                          3 SLEEP:
      009BA5 F9                       4 	.byte 5 	
      009BA6 A6 84 81 45 50           5 	.ascii "SLEEP"
      009BA9 00 A0                    6 	.word SLEEP_IDX 
      001E3C                       5450     _dict_entry,4,SHOW,SHOW_IDX;show 
      009BA9 CD 8C                    1 	.word LINK 
                           001E3E     2 	LINK=.
      001E3E                          3 SHOW:
      009BAB E1                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009BAC A1 01 27 03              5 	.ascii "SHOW"
      009BB0 CC 88                    6 	.word SHOW_IDX 
      001E45                       5451 	_dict_entry,4,SAVE,SAVE_IDX;save
      009BB2 3B 85                    1 	.word LINK 
                           001E47     2 	LINK=.
      001E47                          3 SAVE:
      009BB4 53                       4 	.byte 4 	
      009BB5 A6 84 81 45              5 	.ascii "SAVE"
      009BB8 00 9A                    6 	.word SAVE_IDX 
      001E4E                       5452 	_dict_entry 3,RUN,RUN_IDX;run
      009BB8 85 52                    1 	.word LINK 
                           001E50     2 	LINK=.
      001E50                          3 RUN:
      009BBA 04                       4 	.byte 3 	
      009BBB 89 90 CE                 5 	.ascii "RUN"
      009BBE 00 05                    6 	.word RUN_IDX 
      001E56                       5453 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      009BC0 17 03                    1 	.word LINK 
                           001E58     2 	LINK=.
      001E58                          3 RSHIFT:
      009BC2 90                       4 	.byte 6+F_IFUNC 	
      009BC3 CE 00 01 17 05 72        5 	.ascii "RSHIFT"
      009BC9 5C 00                    6 	.word RSHIFT_IDX 
      001E61                       5454 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      009BCB 21 81                    1 	.word LINK 
                           001E63     2 	LINK=.
      009BCD                          3 RND:
      009BCD 72                       4 	.byte 3+F_IFUNC 	
      009BCE 5D 00 21                 5 	.ascii "RND"
      009BD1 26 03                    6 	.word RND_IDX 
      001E69                       5455 	_dict_entry,6,RETURN,RET_IDX;return 
      009BD3 CC 88                    1 	.word LINK 
                           001E6B     2 	LINK=.
      001E6B                          3 RETURN:
      009BD5 3B                       4 	.byte 6 	
      009BD6 52 45 54 55 52 4E        5 	.ascii "RETURN"
      009BD6 CD 8E                    6 	.word RET_IDX 
      001E74                       5456 	_dict_entry,7,RESTORE,REST_IDX;restore 
      009BD8 2E A1                    1 	.word LINK 
                           001E76     2 	LINK=.
      001E76                          3 RESTORE:
      009BDA 84                       4 	.byte 7 	
      009BDB 27 03 CC 88 3B 52 45     5 	.ascii "RESTORE"
      009BE0 00 90                    6 	.word REST_IDX 
      001E80                       5457 	_dict_entry 6,REMARK,REM_IDX;remark 
      009BE0 5D 26                    1 	.word LINK 
                           001E82     2 	LINK=.
      001E82                          3 REMARK:
      009BE2 10                       4 	.byte 6 	
      009BE3 1E 03 CF 00 05 E6        5 	.ascii "REMARK"
      009BE9 02 C7                    6 	.word REM_IDX 
      001E8B                       5458 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      009BEB 00 04                    1 	.word LINK 
                           001E8D     2 	LINK=.
      001E8D                          3 REBOOT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009BED 1E                       4 	.byte 6 	
      009BEE 05 CF 00 01 81 54        5 	.ascii "REBOOT"
      009BF3 00 8C                    6 	.word RBT_IDX 
      001E96                       5459 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      009BF3 85 5B                    1 	.word LINK 
                           001E98     2 	LINK=.
      001E98                          3 READ:
      009BF5 04                       4 	.byte 4+F_IFUNC 	
      009BF6 72 5A 00 21              5 	.ascii "READ"
      009BFA FC 8A                    6 	.word READ_IDX 
      009BFB                       5460 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      009BFB AE 00                    1 	.word LINK 
                           001EA1     2 	LINK=.
      001EA1                          3 QKEY:
      009BFD 00                       4 	.byte 4+F_IFUNC 	
      009BFE A6 84 81 59              5 	.ascii "QKEY"
      009C01 00 88                    6 	.word QKEY_IDX 
      001EA8                       5461 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      009C01 AE 00                    1 	.word LINK 
                           001EAA     2 	LINK=.
      001EAA                          3 PRTI:
      009C03 01                       4 	.byte 4+F_IFUNC 	
      009C04 A6 84 81 49              5 	.ascii "PRTI"
      009C07 00 86                    6 	.word PRTI_IDX 
      001EB1                       5462 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      009C07 AE 00                    1 	.word LINK 
                           001EB3     2 	LINK=.
      001EB3                          3 PRTH:
      009C09 02                       4 	.byte 4+F_IFUNC 	
      009C0A A6 84 81 48              5 	.ascii "PRTH"
      009C0D 00 84                    6 	.word PRTH_IDX 
      001EBA                       5463 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      009C0D AE 00                    1 	.word LINK 
                           001EBC     2 	LINK=.
      001EBC                          3 PRTG:
      009C0F 03                       4 	.byte 4+F_IFUNC 	
      009C10 A6 84 81 47              5 	.ascii "PRTG"
      009C13 00 82                    6 	.word PRTG_IDX 
      001EC3                       5464 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      009C13 AE 00                    1 	.word LINK 
                           001EC5     2 	LINK=.
      001EC5                          3 PRTF:
      009C15 04                       4 	.byte 4+F_IFUNC 	
      009C16 A6 84 81 46              5 	.ascii "PRTF"
      009C19 00 80                    6 	.word PRTF_IDX 
      001ECC                       5465 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      009C19 AE 00                    1 	.word LINK 
                           001ECE     2 	LINK=.
      001ECE                          3 PRTE:
      009C1B 05                       4 	.byte 4+F_IFUNC 	
      009C1C A6 84 81 45              5 	.ascii "PRTE"
      009C1F 00 7E                    6 	.word PRTE_IDX 
      001ED5                       5466 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      009C1F AE 00                    1 	.word LINK 
                           001ED7     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      001ED7                          3 PRTD:
      009C21 06                       4 	.byte 4+F_IFUNC 	
      009C22 A6 84 81 44              5 	.ascii "PRTD"
      009C25 00 7C                    6 	.word PRTD_IDX 
      001EDE                       5467 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      009C25 AE 00                    1 	.word LINK 
                           001EE0     2 	LINK=.
      001EE0                          3 PRTC:
      009C27 07                       4 	.byte 4+F_IFUNC 	
      009C28 A6 84 81 43              5 	.ascii "PRTC"
      009C2B 00 7A                    6 	.word PRTC_IDX 
      001EE7                       5468 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      009C2B AE 00                    1 	.word LINK 
                           001EE9     2 	LINK=.
      001EE9                          3 PRTB:
      009C2D 08                       4 	.byte 4+F_IFUNC 	
      009C2E A6 84 81 42              5 	.ascii "PRTB"
      009C31 00 78                    6 	.word PRTB_IDX 
      001EF0                       5469 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      009C31 A6 84                    1 	.word LINK 
                           001EF2     2 	LINK=.
      001EF2                          3 PRTA:
      009C33 AE                       4 	.byte 4+F_IFUNC 	
      009C34 00 00 81 41              5 	.ascii "PRTA"
      009C37 00 76                    6 	.word PRTA_IDX 
      001EF9                       5470 	_dict_entry 5,PRINT,PRT_IDX;print 
      009C37 A6 84                    1 	.word LINK 
                           001EFB     2 	LINK=.
      001EFB                          3 PRINT:
      009C39 AE                       4 	.byte 5 	
      009C3A 00 01 81 4E 54           5 	.ascii "PRINT"
      009C3D 00 74                    6 	.word PRT_IDX 
      001F03                       5471 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      009C3D A6 84                    1 	.word LINK 
                           001F05     2 	LINK=.
      001F05                          3 POUT:
      009C3F AE                       4 	.byte 4+F_IFUNC 	
      009C40 00 02 81 54              5 	.ascii "POUT"
      009C43 00 72                    6 	.word POUT_IDX 
      001F0C                       5472 	_dict_entry,4,POKE,POKE_IDX;poke 
      009C43 A6 84                    1 	.word LINK 
                           001F0E     2 	LINK=.
      001F0E                          3 POKE:
      009C45 AE                       4 	.byte 4 	
      009C46 00 03 81 45              5 	.ascii "POKE"
      009C49 00 70                    6 	.word POKE_IDX 
      001F15                       5473 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      009C49 A6 84                    1 	.word LINK 
                           001F17     2 	LINK=.
      001F17                          3 PMODE:
      009C4B AE                       4 	.byte 5 	
      009C4C 00 04 81 44 45           5 	.ascii "PMODE"
      009C4F 00 6A                    6 	.word PMODE_IDX 
      001F1F                       5474 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      009C4F A6 84                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                           001F21     2 	LINK=.
      001F21                          3 PINP:
      009C51 AE                       4 	.byte 4+F_IFUNC 	
      009C52 00 01 81 50              5 	.ascii "PINP"
      009C55 00 6E                    6 	.word PINP_IDX 
      001F28                       5475 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      009C55 A6 84                    1 	.word LINK 
                           001F2A     2 	LINK=.
      001F2A                          3 PEEK:
      009C57 AE                       4 	.byte 4+F_IFUNC 	
      009C58 00 00 81 4B              5 	.ascii "PEEK"
      009C5B 00 6C                    6 	.word PEEK_IDX 
      001F31                       5476 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      009C5B A6 84                    1 	.word LINK 
                           001F33     2 	LINK=.
      001F33                          3 PAUSE:
      009C5D AE                       4 	.byte 5 	
      009C5E 40 00 81 53 45           5 	.ascii "PAUSE"
      009C61 00 68                    6 	.word PAUSE_IDX 
      001F3B                       5477 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      009C61 55 00                    1 	.word LINK 
                           001F3D     2 	LINK=.
      001F3D                          3 PAD:
      009C63 04                       4 	.byte 3+F_IFUNC 	
      009C64 00 02 81                 5 	.ascii "PAD"
      009C67 00 66                    6 	.word PAD_IDX 
      001F43                       5478 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      009C67 CD 8D                    1 	.word LINK 
                           001F45     2 	LINK=.
      001F45                          3 OR:
      009C69 E5                       4 	.byte 2+F_IFUNC 	
      009C6A A1 84                    5 	.ascii "OR"
      009C6C 27 03                    6 	.word OR_IDX 
      001F4A                       5479 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      009C6E CC 88                    1 	.word LINK 
                           001F4C     2 	LINK=.
      001F4C                          3 ODR:
      009C70 3B                       4 	.byte 3+F_IFUNC 	
      009C71 CD A5 A8                 5 	.ascii "ODR"
      009C74 5D 26                    6 	.word ODR_IDX 
      001F52                       5480 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      009C76 05 A6                    1 	.word LINK 
                           001F54     2 	LINK=.
      001F54                          3 NOT:
      009C78 05                       4 	.byte 3+F_IFUNC 	
      009C79 CC 88 3D                 5 	.ascii "NOT"
      009C7C 00 60                    6 	.word NOT_IDX 
      001F5A                       5481 	_dict_entry,4,NEXT,NEXT_IDX;next 
      009C7C 90 93                    1 	.word LINK 
                           001F5C     2 	LINK=.
      001F5C                          3 NEXT:
      009C7E EE                       4 	.byte 4 	
      009C7F 04 A3 9C 61              5 	.ascii "NEXT"
      009C83 26 F2                    6 	.word NEXT_IDX 
      001F63                       5482 	_dict_entry,3,NEW,NEW_IDX;new
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009C85 90 CF                    1 	.word LINK 
                           001F65     2 	LINK=.
      001F65                          3 NEW:
      009C87 00                       4 	.byte 3 	
      009C88 07 90 E6                 5 	.ascii "NEW"
      009C8B 02 C7                    6 	.word NEW_IDX 
      001F6B                       5483 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      009C8D 00 0A                    1 	.word LINK 
                           001F6D     2 	LINK=.
      001F6D                          3 MULDIV:
      009C8F 35                       4 	.byte 6+F_IFUNC 	
      009C90 06 00 09 81 49 56        5 	.ascii "MULDIV"
      009C94 00 5A                    6 	.word MULDIV_IDX 
      001F76                       5484 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      009C94 72 5F                    1 	.word LINK 
                           001F78     2 	LINK=.
      001F78                          3 LSHIFT:
      009C96 00                       4 	.byte 6+F_IFUNC 	
      009C97 07 72 5F 00 08 72        5 	.ascii "LSHIFT"
      009C9D 5F 00                    6 	.word LSHIFT_IDX 
      001F81                       5485 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      009C9F 09 72                    1 	.word LINK 
                           001F83     2 	LINK=.
      001F83                          3 LOG:
      009CA1 5F                       4 	.byte 3+F_IFUNC 	
      009CA2 00 0A CE                 5 	.ascii "LOG"
      009CA5 00 1D                    6 	.word LOG_IDX 
      009CA7                       5486 	_dict_entry,4,LOAD,LOAD_IDX;load 
      009CA7 C3 00                    1 	.word LINK 
                           001F8B     2 	LINK=.
      001F8B                          3 LOAD:
      009CA9 1F                       4 	.byte 4 	
      009CAA 24 1B 90 93              5 	.ascii "LOAD"
      009CAE EE 04                    6 	.word LOAD_IDX 
      001F92                       5487 	_dict_entry 4,LIST,LIST_IDX;list
      009CB0 1C A1                    1 	.word LINK 
                           001F94     2 	LINK=.
      001F94                          3 LIST:
      009CB2 9B                       4 	.byte 4 	
      009CB3 FE A3 9C 61              5 	.ascii "LIST"
      009CB7 26 1A                    6 	.word LIST_IDX 
      001F9B                       5488 	_dict_entry 3,LET,LET_IDX;let 
      009CB9 90 CF                    1 	.word LINK 
                           001F9D     2 	LINK=.
      001F9D                          3 LET:
      009CBB 00                       4 	.byte 3 	
      009CBC 07 90 E6                 5 	.ascii "LET"
      009CBF 02 C7                    6 	.word LET_IDX 
      001FA3                       5489 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      009CC1 00 0A                    1 	.word LINK 
                           001FA5     2 	LINK=.
      001FA5                          3 KEY:
      009CC3 35                       4 	.byte 3+F_IFUNC 	
      009CC4 06 00 09                 5 	.ascii "KEY"
      009CC7 72 5D                    6 	.word KEY_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      001FAB                       5490 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      009CC9 00 0A                    1 	.word LINK 
                           001FAD     2 	LINK=.
      001FAD                          3 IWDGREF:
      009CCB 26                       4 	.byte 7 	
      009CCC 05 A6 0C CC 88 3D 81     5 	.ascii "IWDGREF"
      009CD3 00 4C                    6 	.word IWDGREF_IDX 
      001FB7                       5491 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      009CD3 93 E6                    1 	.word LINK 
                           001FB9     2 	LINK=.
      001FB9                          3 IWDGEN:
      009CD5 02                       4 	.byte 6 	
      009CD6 C7 00 0E 72 5F 00        5 	.ascii "IWDGEN"
      009CDC 0D 72                    6 	.word IWDGEN_IDX 
      001FC2                       5492 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      009CDE BB 00                    1 	.word LINK 
                           001FC4     2 	LINK=.
      001FC4                          3 INVERT:
      009CE0 0D                       4 	.byte 6+F_IFUNC 	
      009CE1 20 C4 56 45 52 54        5 	.ascii "INVERT"
      009CE3 00 48                    6 	.word INVERT_IDX 
      001FCD                       5493 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      009CE3 52 06                    1 	.word LINK 
                           001FCF     2 	LINK=.
      009CE5                          3 INPUT:
      009CE5 C6                       4 	.byte 5 	
      009CE6 00 09 C1 00 0A           5 	.ascii "INPUT"
      009CEB 27 37                    6 	.word INPUT_IDX 
      001FD7                       5494 	_dict_entry,2,IF,IF_IDX;if 
      009CED CD 90                    1 	.word LINK 
                           001FD9     2 	LINK=.
      001FD9                          3 IF:
      009CEF 2A                       4 	.byte 2 	
      009CF0 CE 00                    5 	.ascii "IF"
      009CF2 07 CF                    6 	.word IF_IDX 
      001FDE                       5495 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      009CF4 00 05                    1 	.word LINK 
                           001FE0     2 	LINK=.
      001FE0                          3 IDR:
      009CF6 55                       4 	.byte 3+F_IFUNC 	
      009CF7 00 09 00                 5 	.ascii "IDR"
      009CFA 02 55                    6 	.word IDR_IDX 
      001FE6                       5496 	_dict_entry,3,HEX,HEX_IDX;hex_base
      009CFC 00 0A                    1 	.word LINK 
                           001FE8     2 	LINK=.
      001FE8                          3 HEX:
      009CFE 00                       4 	.byte 3 	
      009CFF 04 CD 8D                 5 	.ascii "HEX"
      009D02 E5 A1                    6 	.word HEX_IDX 
      001FEE                       5497 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      009D04 84 27                    1 	.word LINK 
                           001FF0     2 	LINK=.
      001FF0                          3 GPIO:
      009D06 03                       4 	.byte 4+F_IFUNC 	
      009D07 CC 88 3B 4F              5 	.ascii "GPIO"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009D0A 00 3E                    6 	.word GPIO_IDX 
      001FF7                       5498 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      009D0A 1F 05                    1 	.word LINK 
                           001FF9     2 	LINK=.
      001FF9                          3 GOTO:
      009D0C CD                       4 	.byte 4 	
      009D0D 89 2D CE 00              5 	.ascii "GOTO"
      009D11 05 CF                    6 	.word GOTO_IDX 
      002000                       5499 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      009D13 00 07                    1 	.word LINK 
                           002002     2 	LINK=.
      002002                          3 GOSUB:
      009D15 55                       4 	.byte 5 	
      009D16 00 02 00 09 CD           5 	.ascii "GOSUB"
      009D1B 90 3A                    6 	.word GOSUB_IDX 
      00200A                       5500 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      009D1D 1E 05                    1 	.word LINK 
                           00200C     2 	LINK=.
      00200C                          3 FREE:
      009D1F A6                       4 	.byte 4+F_IFUNC 	
      009D20 84 5B 06 81              5 	.ascii "FREE"
      009D24 00 9E                    6 	.word FREE_IDX 
      002013                       5501 	_dict_entry,6,FORGET,FORGET_IDX;forget 
      009D24 90 CE                    1 	.word LINK 
                           002015     2 	LINK=.
      002015                          3 FORGET:
      009D26 00                       4 	.byte 6 	
      009D27 07 72 5F 00 07 72        5 	.ascii "FORGET"
      009D2D 5F 00                    6 	.word FORGET_IDX 
      00201E                       5502 	_dict_entry,3,FOR,FOR_IDX;for 
      009D2F 08 72                    1 	.word LINK 
                           002020     2 	LINK=.
      002020                          3 FOR:
      009D31 5F                       4 	.byte 3 	
      009D32 00 09 72                 5 	.ascii "FOR"
      009D35 5F 00                    6 	.word FOR_IDX 
      002026                       5503 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      009D37 0A CD                    1 	.word LINK 
                           002028     2 	LINK=.
      002028                          3 FCPU:
      009D39 9C                       4 	.byte 4 	
      009D3A D3 20 A8 55              5 	.ascii "FCPU"
      009D3D 00 34                    6 	.word FCPU_IDX 
      00202F                       5504 	_dict_entry,3,END,END_IDX;cmd_end  
      009D3D CD 8C                    1 	.word LINK 
                           002031     2 	LINK=.
      002031                          3 END:
      009D3F E6                       4 	.byte 3 	
      009D40 A1 02 27                 5 	.ascii "END"
      009D43 03 CC                    6 	.word END_IDX 
      002037                       5505 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      009D45 88 3B                    1 	.word LINK 
                           002039     2 	LINK=.
      009D47                          3 EEPROM:
      009D47 72                       4 	.byte 6+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009D48 12 50 C7 85 5D 27        5 	.ascii "EEPROM"
      009D4E 21 85                    6 	.word EEPROM_IDX 
      002042                       5506 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      009D50 A6 08                    1 	.word LINK 
                           002044     2 	LINK=.
      002044                          3 DWRITE:
      009D52 42                       4 	.byte 6+F_CMD 	
      009D53 9F C7 52 00 72 1A        5 	.ascii "DWRITE"
      009D59 50 14                    6 	.word DWRITE_IDX 
      00204D                       5507 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      009D5B 72 1A                    1 	.word LINK 
                           00204F     2 	LINK=.
      00204F                          3 DREAD:
      009D5D 50                       4 	.byte 5+F_IFUNC 	
      009D5E 16 72 14 52 00           5 	.ascii "DREAD"
      009D63 72 12                    6 	.word DREAD_IDX 
      002057                       5508 	_dict_entry,2,DO,DO_IDX;do_loop
      009D65 52 01                    1 	.word LINK 
                           002059     2 	LINK=.
      002059                          3 DO:
      009D67 72                       4 	.byte 2 	
      009D68 10 52                    5 	.ascii "DO"
      009D6A 01 72                    6 	.word DO_IDX 
      00205E                       5509 	_dict_entry,3,DIR,DIR_IDX;directory 
      009D6C 1C 52                    1 	.word LINK 
                           002060     2 	LINK=.
      002060                          3 DIR:
      009D6E 00                       4 	.byte 3 	
      009D6F 81 49 52                 5 	.ascii "DIR"
      009D70 00 28                    6 	.word DIR_IDX 
      002066                       5510 	_dict_entry,3,DEC,DEC_IDX;dec_base
      009D70 5B 02                    1 	.word LINK 
                           002068     2 	LINK=.
      002068                          3 DEC:
      009D72 A6                       4 	.byte 3 	
      009D73 82 C4 52                 5 	.ascii "DEC"
      009D76 03 A1                    6 	.word DEC_IDX 
      00206E                       5511 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      009D78 02 26                    1 	.word LINK 
                           002070     2 	LINK=.
      002070                          3 DDR:
      009D7A F7                       4 	.byte 3+F_IFUNC 	
      009D7B 72 1D 52                 5 	.ascii "DDR"
      009D7E 00 72                    6 	.word DDR_IDX 
      002076                       5512 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      009D80 13 50                    1 	.word LINK 
                           002078     2 	LINK=.
      002078                          3 DATALN:
      009D82 C7                       4 	.byte 6 	
      009D83 72 1B 50 16 81 4E        5 	.ascii "DATALN"
      009D88 00 22                    6 	.word DATALN_IDX 
      002081                       5513 	_dict_entry,4,DATA,DATA_IDX;data  
      009D88 A6 78                    1 	.word LINK 
                           002083     2 	LINK=.
      002083                          3 DATA:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009D8A C5                       4 	.byte 4 	
      009D8B 52 03 27 04              5 	.ascii "DATA"
      009D8F 72 5F                    6 	.word DATA_IDX 
      00208A                       5514 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      009D91 52 03                    1 	.word LINK 
                           00208C     2 	LINK=.
      00208C                          3 CRL:
      009D93 81                       4 	.byte 3+F_IFUNC 	
      009D94 43 52 4C                 5 	.ascii "CRL"
      009D94 88 CD                    6 	.word CRL_IDX 
      002092                       5515 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      009D96 9D 88                    1 	.word LINK 
                           002094     2 	LINK=.
      002094                          3 CRH:
      009D98 84                       4 	.byte 3+F_IFUNC 	
      009D99 72 03 52                 5 	.ascii "CRH"
      009D9C 03 FB                    6 	.word CRH_IDX 
      00209A                       5516 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      009D9E C7 52                    1 	.word LINK 
                           00209C     2 	LINK=.
      00209C                          3 CHAR:
      009DA0 04                       4 	.byte 4+F_CFUNC 	
      009DA1 72 01 52 03              5 	.ascii "CHAR"
      009DA5 FB C6                    6 	.word CHAR_IDX 
      0020A3                       5517 	_dict_entry,3,BYE,BYE_IDX;bye 
      009DA7 52 04                    1 	.word LINK 
                           0020A5     2 	LINK=.
      0020A5                          3 BYE:
      009DA9 81                       4 	.byte 3 	
      009DAA 42 59 45                 5 	.ascii "BYE"
      009DAA A6 FF                    6 	.word BYE_IDX 
      0020AB                       5518 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      009DAC 72 01                    1 	.word LINK 
                           0020AD     2 	LINK=.
      0020AD                          3 BTOGL:
      009DAE 52                       4 	.byte 5 	
      009DAF 03 E3 C6 52 04           5 	.ascii "BTOGL"
      009DB4 81 16                    6 	.word BTOGL_IDX 
      009DB5                       5519 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      009DB5 CD 8D                    1 	.word LINK 
                           0020B7     2 	LINK=.
      0020B7                          3 BTEST:
      009DB7 E5                       4 	.byte 5+F_IFUNC 	
      009DB8 A1 84 27 03 CC           5 	.ascii "BTEST"
      009DBD 88 3B                    6 	.word BTEST_IDX 
      009DBF                       5520 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      009DBF 9F CD                    1 	.word LINK 
                           0020C1     2 	LINK=.
      0020C1                          3 BSET:
      009DC1 9D                       4 	.byte 4 	
      009DC2 94 CD 89 2D              5 	.ascii "BSET"
      009DC6 A1 09                    6 	.word BSET_IDX 
      0020C8                       5521 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      009DC8 26 02                    1 	.word LINK 
                           0020CA     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      0020CA                          3 BRES:
      009DCA 20                       4 	.byte 4 	
      009DCB E9 4D 27 05              5 	.ascii "BRES"
      009DCF 55 00                    6 	.word BRES_IDX 
      0020D1                       5522 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      009DD1 03 00                    1 	.word LINK 
                           0020D3     2 	LINK=.
      0020D3                          3 BIT:
      009DD3 02                       4 	.byte 3+F_IFUNC 	
      009DD4 81 49 54                 5 	.ascii "BIT"
      009DD5 00 0E                    6 	.word BIT_IDX 
      0020D9                       5523 	_dict_entry,3,AWU,AWU_IDX;awu 
      009DD5 CD 9D                    1 	.word LINK 
                           0020DB     2 	LINK=.
      0020DB                          3 AWU:
      009DD7 AA                       4 	.byte 3 	
      009DD8 5F 97 A6                 5 	.ascii "AWU"
      009DDB 84 81                    6 	.word AWU_IDX 
      009DDD                       5524 	_dict_entry,7,AUTORUN,AUTORUN_IDX;autorun
      009DDD CD 89                    1 	.word LINK 
                           0020E3     2 	LINK=.
      0020E3                          3 AUTORUN:
      009DDF 2D                       4 	.byte 7 	
      009DE0 A1 84 27 03 CC 88 3B     5 	.ascii "AUTORUN"
      009DE7 5D 27                    6 	.word AUTORUN_IDX 
      0020ED                       5525 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      009DE9 05 72                    1 	.word LINK 
                           0020EF     2 	LINK=.
      0020EF                          3 ASC:
      009DEB 1B                       4 	.byte 3+F_IFUNC 	
      009DEC 50 14 81                 5 	.ascii "ASC"
      009DEF 00 08                    6 	.word ASC_IDX 
      0020F5                       5526 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      009DEF 72 1A                    1 	.word LINK 
                           0020F7     2 	LINK=.
      0020F7                          3 AND:
      009DF1 50                       4 	.byte 3+F_IFUNC 	
      009DF2 14 81 44                 5 	.ascii "AND"
      009DF4 00 06                    6 	.word AND_IDX 
      0020FD                       5527 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      009DF4 AE 16                    1 	.word LINK 
                           0020FF     2 	LINK=.
      0020FF                          3 ADCREAD:
      009DF6 E0                       4 	.byte 7+F_IFUNC 	
      009DF7 B6 84 81 52 45 41 44     5 	.ascii "ADCREAD"
      009DFA 00 04                    6 	.word ADCREAD_IDX 
      002109                       5528 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      009DFA 00 00                    1 	.word LINK 
                           00210B     2 	LINK=.
      009DFC                          3 ADCON:
      009DFC 43                       4 	.byte 5 	
      009DFD 58 4F 52 00 C6           5 	.ascii "ADCON"
      009E02 9D FC                    6 	.word ADCON_IDX 
      009E04                       5529 kword_dict::
      002113                       5530 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009E04 05 57                    1 	.word LINK 
                           002115     2 	LINK=.
      002115                          3 ABS:
      009E06 52                       4 	.byte 3+F_IFUNC 	
      009E07 49 54 45                 5 	.ascii "ABS"
      009E0A 00 C4                    6 	.word ABS_IDX 
                                   5531 
                                   5532 ;comands and fonctions address table 	
      00211B                       5533 code_addr::
      009E0C 9E 04 12 D3 13 0F 18  5534 	.word abs,power_adc,analog_read,bit_and,ascii,autorun,awu,bitmask ; 0..7
             C1 17 53 17 E5 18 5E
             1B 0F
      009E0E 10 71 10 61 10 92 10  5535 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             82 17 DC 17 41 1B C9
      009E0E 05 57 4F 52 44 53 00  5536 	.word const_cr1,data,data_line,const_ddr,dec_base,directory,do_loop,digital_read,digital_write ;16..23 
             C2 9E 0E 16 88 1B 38
             13 43 13 73
      009E18 12 7F 1B DB 19 3B 10  5537 	.word cmd_end,const_eeprom_base,fcpu,for,forget,gosub,goto,gpio ; 24..31 
             ED 16 1A 11 E8 11 CD
             17 8F
      009E18 04 57 41 49 54 00 C0  5538 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             9E 18 29 1A B9 1A EF
             17 7A
      009E21 0E 7D 0E A8 15 EA 1A  5539 	.word let,list,load,log2,lshift,muldiv,next,new ; 40..47
             F4 19 09 0B EB 11 6D
             13 FA
      009E21 43 55 53 52 00 BE 9E  5540 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             21 18 4B 19 47 10 C8
             1B D5
      009E29 10 B9 1B CF 0F 44 1B  5541 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             7B 1B 81 1B 87 1B 8D
             1B 93
      009E29 05 55 4E 54 49 4C 00  5542 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             BC 9E 29 1C 63 05 17
             10 36
      009E33 1C 14 12 08 19 C3 19  5543 	.word restore,return, random,rshift,run,save,show,free ; 72..79
             22 12 26 14 EB 0E 06
             0E 51
      009E33 46 55 46 4C 41 53 48  5544 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             00 BA 9E 33 46 13 AE
             18 A7
      009E3E 1A 90 1A 9F 11 16 12  5545 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             8F 0E 5B 17 B9 1B 4D
             17 BF
      009E3E 46 55 42 4F 55 4E 44  5546 	.word wait,words,write,bit_xor ; 96..99
             00
      009E46 B8 9E                 5547 	.word 0 
                                   5548 
      002200                       5549 	.bndry 128 ; align on FLASH block.
                                   5550 ; free space for user application  
      002200                       5551 user_space:
                                   5552 ; USR() function test
      009E48 3E               [ 2] 5553 	pushw x 
      009E49 72 1A 50 0A      [ 1] 5554 	bset PC_ODR,#5 
      009E49 04               [ 2] 5555 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009E4A 54 4F 4E         [ 4] 5556 	call pause02 
      009E4D 45 00 B6 9E      [ 1] 5557 	bres PC_ODR,#5 
      009E51 49               [ 4] 5558 	ret
                                   5559 
                                   5560 	.area FLASH_DRIVE (ABS)
      009E52                       5561 	.org 0x10000
      010000                       5562 fdrive:
                                   5563 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002115 R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   5 ADCON      00210B R
    ADCON_ID=  000002     |   5 ADCREAD    0020FF R   |     ADCREAD_=  000004 
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
  5 AND        0020F7 R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |   5 ASC        0020EF R   |     ASC_IDX =  000008 
  5 AUTORUN    0020E3 R   |     AUTORUN_=  00000A     |     AUTORUN_=  004000 
  5 AWU        0020DB R   |   5 AWUHandl   000001 R   |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_CSR_=  000004     |     AWU_IDX =  00000C 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
    B19200  =  000003     |     B1_MASK =  000002     |     B230400 =  000007 
    B2400   =  000000     |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
    B4_MASK =  000010     |     B57600  =  000005     |     B5_MASK =  000020 
    B6_MASK =  000040     |     B7_MASK =  000080     |     B921600 =  000009 
    B9600   =  000002     |     BASE    =  000002     |     BCNT    =  000001 
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |   5 BIT        0020D3 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000E 
    BLOCK_CO=  000004     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000B     |   5 BRES       0020CA R
    BRES_IDX=  000010     |     BS      =  000008     |     BSAVE   =  000001 
  5 BSET       0020C1 R   |     BSET_IDX=  000012     |     BSIZE   =  000001 
  5 BTEST      0020B7 R   |     BTEST_ID=  000014     |   5 BTOGL      0020AD R
    BTOGL_ID=  000016     |     BTW     =  000001     |   5 BYE        0020A5 R
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
    CFG_GCR_=  000000     |   5 CHAR       00209C R   |     CHAR_IDX=  00001A 
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
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
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        002094 R
    CRH_IDX =  00001C     |   5 CRL        00208C R   |     CRL_IDX =  00001E 
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
    CX_IN   =  000003     |   5 DATA       002083 R   |   5 DATALN     002078 R
    DATALN_I=  000022     |     DATA_IDX=  000020     |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
    DBL     =  000003     |     DBLDIVDN=  000006     |     DBLHI   =  000001 
    DBLLO   =  000003     |     DBL_SIZE=  000004     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  5 DDR        002070 R   |     DDR_IDX =  000024     |     DEBUG   =  000000 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |     DEBUG_PR=  000001 
  5 DEC        002068 R   |     DEC_IDX =  000026     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        002060 R   |     DIR_IDX =  000028 
    DIVDNDHI=  00000B     |     DIVDNDLO=  00000D     |     DIVISOR =  000001 
    DIVISR  =  000007     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   5 DO         002059 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  00002A 
  5 DREAD      00204F R   |     DREAD_ID=  00002C     |   5 DWRITE     002044 R
    DWRITE_I=  00002E     |   5 EEPROM     002039 R   |     EEPROM_B=  004000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

    EEPROM_E=  0047FF     |     EEPROM_I=  000032     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        002031 R   |     END_IDX =  000030 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FAUTORUN=  000006     |     FBREAK  =  000004     |     FCOMP   =  000005 
  5 FCPU       002028 R   |     FCPU_IDX=  000034     |     FF      =  00000C 
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
  5 FOR        002020 R   |   5 FORGET     002015 R   |     FORGET_I=  000038 
    FOR_IDX =  000036     |   5 FREE       00200C R   |     FREE_IDX=  00009E 
    FRUN    =  000000     |     FS      =  00001C     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      002002 R   |     GOSUB_ID=  00003A 
  5 GOTO       001FF9 R   |     GOTO_IDX=  00003C     |   5 GPIO       001FF0 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_IDX=  00003E 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  5 HEX        001FE8 R   |     HEX_IDX =  000040     |     HSECNT  =  004809 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]

Symbol Table

    I2C_SR1_=  000007     |     I2C_SR2 =  005218     |     I2C_SR2_=  000002 
    I2C_SR2_=  000001     |     I2C_SR2_=  000000     |     I2C_SR2_=  000003 
    I2C_SR2_=  000005     |     I2C_SR3 =  005219     |     I2C_SR3_=  000001 
    I2C_SR3_=  000007     |     I2C_SR3_=  000004     |     I2C_SR3_=  000000 
    I2C_SR3_=  000002     |     I2C_TRIS=  00521D     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_WRIT=  000000 
  5 IDR        001FE0 R   |     IDR_IDX =  000042     |   5 IF         001FD9 R
    IF_IDX  =  000044     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      001FCF R   |     INPUT_DI=  000000 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   5 INVERT     001FC4 R
    INVERT_I=  000048     |     INW     =  000009     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   5 IWDGEN     001FB9 R   |     IWDGEN_I=  00004A 
  5 IWDGREF    001FAD R   |     IWDGREF_=  00004C     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        001FA5 R
    KEY_IDX =  00004E     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   5 LET        001F9D R   |     LET_IDX =  000050 
    LF      =  00000A     |     LIMIT   =  000005     |   5 LINK    =  002115 R
  5 LIST       001F94 R   |     LIST_IDX=  000052     |     LLEN    =  000002 
    LN_PTR  =  000005     |   5 LOAD       001F8B R   |     LOAD_IDX=  000054 
  5 LOG        001F83 R   |     LOG_IDX =  000056     |   5 LSHIFT     001F78 R
    LSHIFT_I=  000058     |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
  5 MULDIV     001F6D R   |     MULDIV_I=  00005A     |     MULOP   =  000003 
    N1      =  000001     |     N2      =  000003     |     NAFR    =  004804 
    NAK     =  000015     |     NAMEPTR =  000003     |     NCLKOPT =  004808 
    NEG     =  000001     |   5 NEW        001F65 R   |     NEW_FREE=  000001 
    NEW_IDX =  00005E     |   5 NEXT       001F5C R   |     NEXT_IDX=  00005C 
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   5 NOT        001F54 R
    NOT_IDX =  000060     |     NUBC    =  004802     |     NWDGOPT =  004806 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]

Symbol Table

    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R   |   5 ODR        001F4C R
    ODR_IDX =  000062     |     ONOFF   =  000003     |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   5 OR         001F45 R   |     OR_IDX  =  000064 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |   5 PAD        001F3D R
    PAD_IDX =  000066     |     PAD_SIZE=  000080     |   5 PAUSE      001F33 R
    PAUSE_ID=  000068     |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   5 PEEK       001F2A R
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
  5 PINP       001F21 R   |     PINP_IDX=  00006E     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  5 PMODE      001F17 R   |     PMODE_ID=  00006A     |   5 POKE       001F0E R
    POKE_IDX=  000070     |     PORT    =  000003     |   5 POUT       001F05 R
    POUT_IDX=  000072     |   5 PRINT      001EFB R   |   5 PRTA       001EF2 R
    PRTA_IDX=  000076     |   5 PRTB       001EE9 R   |     PRTB_IDX=  000078 
  5 PRTC       001EE0 R   |     PRTC_IDX=  00007A     |   5 PRTD       001ED7 R
    PRTD_IDX=  00007C     |   5 PRTE       001ECE R   |     PRTE_IDX=  00007E 
  5 PRTF       001EC5 R   |     PRTF_IDX=  000080     |   5 PRTG       001EBC R
    PRTG_IDX=  000082     |   5 PRTH       001EB3 R   |     PRTH_IDX=  000084 
  5 PRTI       001EAA R   |     PRTI_IDX=  000086     |     PRT_IDX =  000074 
    PSTR    =  000003     |   5 QKEY       001EA1 R   |     QKEY_IDX=  000088 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
    RBT_IDX =  00008C     |   5 READ       001E98 R   |     READ_IDX=  00008A 
  5 REBOOT     001E8D R   |     REG     =  000001     |     REGA    =  000001 
    REGX    =  000003     |     REGY    =  000005     |     RELOP   =  000003 
  5 REMARK     001E82 R   |     REM_IDX =  00008E     |   5 RESTORE    001E76 R
    REST_IDX=  000090     |     RETL1   =  000001     |   5 RETURN     001E6B R
    RET_ADDR=  000003     |     RET_IDX =  000092     |     RET_INW =  000005 
  5 RND        001E63 R   |     RND_IDX =  000094     |     ROP     =  004800 
    RS      =  00001E     |   5 RSHIFT     001E58 R   |     RSHIFT_I=  000096 
    RST_SR  =  0050B3     |   5 RUN        001E50 R   |     RUN_IDX =  000098 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]

Symbol Table

    RX_QUEUE=  000008     |   5 SAVE       001E47 R   |     SAVEB   =  000002 
    SAVE_IDX=  00009A     |     SDIVSR  =  000005     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       001E3E R
    SHOW_IDX=  00009C     |     SI      =  00000F     |     SIGN    =  000001 
    SKIP    =  000005     |   5 SLEEP      001E34 R   |     SLEEP_ID=  0000A0 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  5 SPIEN      001E2A R   |     SPIEN_ID=  0000A4     |   5 SPIRD      001E20 R
    SPIRD_ID=  0000A2     |   5 SPISEL     001E15 R   |     SPISEL_I=  0000A6 
  5 SPIWR      001E0B R   |     SPIWR_ID=  0000A8     |     SPI_CR1 =  005200 
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
    STACK_SI=  0000A0     |   5 STEP       001E02 R   |     STEP_IDX=  0000AA 
  5 STOP       001DF9 R   |     STOP_IDX=  0000AC     |     STX     =  000002 
    SUB     =  00001A     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      001DEF R   |     TICKS_ID=  0000AE     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
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
  5 TIMEOUT    001DE3 R   |   5 TIMER      001DD9 R   |     TIMER_ID=  0000B0 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_ARRAY=  000006 
    TK_CFUNC=  000082     |     TK_CHAR =  000003     |     TK_CMD  =  000080 
    TK_COLON=  000001     |     TK_COMMA=  000009     |     TK_CONST=  000083 
    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]

Symbol Table

    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_IFUNC=  000081     |     TK_INTGR=  000084     |     TK_LE   =  000036 
    TK_LPARE=  000007     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_PLUS =  000010     |     TK_QSTR =  000002 
    TK_RPARE=  000008     |     TK_SHARP=  00000A     |     TK_VAR  =  000085 
    TMROUT_I=  0000B2     |   5 TO         001DD2 R   |   5 TONE       001DC9 R
    TONE_IDX=  0000B6     |     TO_IDX  =  0000B4     |   5 Timer4Up   000078 R
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
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     001DBE R
    UBOUND_I=  0000B8     |   5 UBTN_Han   0000BA R   |   5 UFLASH     001DB3 R
    UFLASH_I=  0000BA     |   5 UNTIL      001DA9 R   |     UNTIL_ID=  0000BC 
    US      =  00001F     |   5 USER_ABO   0000C2 R   |   5 USR        001DA1 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000BE     |   5 Uart1RxH   00000F R   |   5 Uart3RxH   000052 R
  5 UserButt   00008D R   |     VAR_ADDR=  000006     |     VSIZ    =  000002 
    VSIZE   =  000006     |     VT      =  00000B     |   5 WAIT       001D98 R
    WAIT_IDX=  0000C0     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WLEN    =  000001     |   5 WORDS      001D8E R
    WORDS_ID=  0000C2     |   5 WRITE      001D84 R   |     WRITE_ID=  0000C4 
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   5 XOR        001D7C R
    XOR_IDX =  0000C6     |     XREG    =  000003     |     XSAVE   =  000005 
    YSAVE   =  000007     |   5 abs        0018AD R   |   1 acc16      00000C GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]

Symbol Table

  1 acc24      00000B GR  |   1 acc8       00000D GR  |   5 analog_r   00130F R
  5 arduino_   0019A3 R   |   5 arg_list   000C66 R   |   1 array_si   000021 R
  5 ascii      001753 R   |   5 atoi24     000A20 GR  |   5 atoi_exi   000A86 R
  5 autorun    0017E5 R   |   5 autorun_   000610 R   |   5 awu        00185E R
  5 awu02      001868 R   |   5 bad_port   0017B4 R   |   1 base       00000A GR
  1 basicptr   000004 GR  |   5 beep       00129C R   |   5 beep_1kh   001286 GR
  5 bit_and    0018C1 R   |   5 bit_or     0018D9 R   |   5 bit_rese   001071 R
  5 bit_set    001061 R   |   5 bit_test   001092 R   |   5 bit_togg   001082 R
  5 bit_xor    0018F1 R   |   5 bitmask    001B0F R   |   5 block_er   0001E3 R
  5 break_po   0013DC R   |   5 bye        0017DC R   |   5 cancel_a   0005D8 R
  5 char       001741 R   |   5 clear_ba   000625 R   |   5 clear_va   0004A0 R
  5 clock_in   0000DD R   |   5 cmd_end    00127F R   |   5 cmd_line   000845 R
  5 cmp_name   00147D R   |   5 code_add   00211B GR  |   5 cold_sta   000517 R
  5 comp_msg   00079A R   |     compile    ****** GX  |   5 const_cr   001BC3 R
  5 const_cr   001BC9 R   |   5 const_dd   001BBD R   |   5 const_ee   001BDB R
  5 const_id   001BB7 R   |   5 const_in   001BD5 R   |   5 const_od   001BB1 R
  5 const_ou   001BCF R   |   5 const_po   001B7B R   |   5 const_po   001B81 R
  5 const_po   001B87 R   |   5 const_po   001B8D R   |   5 const_po   001B93 R
  5 const_po   001B99 R   |   5 const_po   001B9F R   |   5 const_po   001BA5 R
  5 const_po   001BAB R   |   1 count      000003 GR  |   5 cp_loop    000C15 R
  5 cs_high    001D6F R   |   5 cstk_pro   000E20 R   |   5 data       001BE1 R
  1 data_len   000009 R   |   5 data_lin   001BE7 R   |   1 data_ofs   000008 R
  1 data_ptr   000006 R   |   5 data_sea   001C27 R   |   5 dbl_sign   000B6F R
  5 dec_base   000E4C R   |     decompil   ****** GX  |   5 digital_   001343 R
  5 digital_   001373 R   |   5 dir_loop   001694 R   |   5 director   001688 R
  5 disk_fre   00146A R   |   5 div32_16   000B79 R   |   5 divide     000BD0 R
  5 divu24_8   00098F R   |   5 dneg       000B64 R   |   5 do_loop    001B38 R
  5 do_progr   0001D6 R   |   5 drive_fr   0016FD R   |   5 enable_i   001AB9 R
  5 erase_fl   000202 R   |   5 err_bad_   000705 R   |   5 err_buf_   00077B R
  5 err_cmd_   0006C9 R   |   5 err_div0   00068E R   |   5 err_dupl   0006E3 R
  5 err_math   000675 R   |   5 err_mem_   00065A R   |   5 err_msg    00063A R
  5 err_no_a   000711 R   |   5 err_no_d   000744 R   |   5 err_no_f   000768 R
  5 err_no_l   00069D R   |   5 err_no_p   000754 R   |   5 err_not_   0006F4 R
  5 err_run_   0006B3 R   |   5 err_synt   000667 R   |   5 expect     000C54 R
  5 expr_exi   000DAB R   |   5 expressi   000D65 R   |   5 factor     000CB6 R
  1 farptr     000016 R   |   5 fcpu       00193B R   |   7 fdrive     010000 R
  1 ffree      000019 R   |   5 file_cou   0016F5 R   |   5 first_li   000ED1 R
  1 flags      000023 GR  |   5 for        0010ED R   |   5 forget     00161A R
  5 free       000E51 R   |   1 free_ram   00006D R   |   5 func_arg   000C61 R
  5 func_not   001AAC R   |   5 get_arra   000C91 R   |   5 get_targ   0011B7 R
  5 get_tick   0018A7 R   |     get_toke   ****** GX  |   5 getc       00034B GR
  5 gosub      0011E8 R   |   5 goto       0011CD R   |   5 gpio       00178F R
  5 hex_base   000E47 R   |   5 hex_dump   0003F7 R   |   5 if         0010D9 R
  1 in         000001 GR  |   1 in.saved   000002 GR  |   1 in.w       000000 GR
  5 incr_far   00142A R   |   5 input_ex   001033 R   |   5 input_lo   000FCC R
  5 input_va   000FCA R   |   5 interp_l   000886 R   |   5 interpre   000861 R
  5 invert     001B29 R   |   5 is_alnum   0004C8 GR  |   5 is_alpha   0004AE GR
  5 is_digit   0004BF GR  |   5 itoa       00092A GR  |   5 itoa_loo   000949 R
  5 jp_to_ta   0011DB R   |   5 key        00177A R   |   5 kword_di   002113 GR
  5 kword_en   001D7A R   |   5 leading_   001AFF R   |   5 let        000E7D GR
  5 let_arra   000E8B R   |   5 let_var    000E8E R   |   5 lines_sk   000ED4 R
  5 list       000EA8 R   |   5 list_exi   000F16 R   |   5 list_loo   000EF4 R
  5 load       0015EA R   |   5 load_aut   0005E7 R   |   5 load_fil   0015B9 R
  5 log2       001AF4 R   |   5 logical_   001AA2 R   |   5 long_div   000B4C R
  5 loop_bac   00119A R   |   1 loop_dep   000020 R   |   5 loop_don   0011AF R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]

Symbol Table

  5 lshift     001909 R   |   5 modulo     000BE6 R   |   5 move       00045E GR
  5 move_dow   00047C R   |   5 move_era   000168 R   |   5 move_exi   00049D R
  5 move_loo   000481 R   |   5 move_prg   00019C R   |   5 move_up    00046E R
  5 muldiv     000BEB R   |   5 multiply   000B17 R   |   5 mulu24_8   0009B7 R
  5 neg_acc2   0009F1 R   |   5 new        0013FA R   |   5 next       00116D R
  5 next_lin   000869 R   |   5 next_tok   0008AD GR  |   5 no_match   000C27 R
  3 pad        0016E0 GR  |   5 pad_ref    001D74 R   |   5 pause      00184B R
  5 pause02    001855 R   |   5 peek       0010C8 R   |   5 pin_mode   001947 R
  5 poke       0010B9 R   |   5 power_ad   0012D3 R   |   5 print      000F44 R
  5 print_ex   000F9E R   |   5 print_in   00090E R   |   5 printxy    000A8A R
  5 program_   00017C R   |   5 program_   00019C R   |   5 prt_basi   000F24 R
  5 prt_loop   000F48 R   |   5 prt_tok    000389 R   |   5 prti24     00091E R
  1 ptr16      000017 GR  |   1 ptr8       000018 R   |   5 putc       00032B GR
    puts       ****** GX  |   5 qgetc      00033D GR  |   5 qkey       001782 GR
  5 random     0019C3 R   |   5 read       001C63 R   |   5 read01     001C65 R
    readln     ****** GX  |   5 refresh_   001AEF R   |   5 rel_exit   000E03 R
  5 relation   000DAE R   |   5 remark     001036 GR  |   5 reset_co   000F46 R
  5 rest_con   000FBA R   |   5 restore    001C14 R   |   5 return     001208 R
    right_al   ****** GX  |   5 row_alig   00140F R   |   5 row_eras   000141 R
  5 row_eras   000168 R   |   5 row_loop   0003DA R   |   5 rshift     001922 R
  5 rt_msg     000788 R   |   5 run        001226 R   |   5 run_it     001258 R
  1 rx1_head   00002D R   |   1 rx1_queu   000025 R   |   1 rx1_tail   00002E R
  1 rx3_head   000037 R   |   1 rx3_queu   00002F R   |   1 rx3_tail   000038 R
  5 save       0014EB R   |   5 save_con   000FAA R   |   5 search_d   000C07 GR
  5 search_e   000C51 R   |   5 search_f   00149E R   |     search_l   ****** GX
  5 search_n   000C0B R   |   1 seedx      000012 R   |   1 seedy      000014 R
  5 seek_fdr   001438 R   |   5 select_p   001993 R   |   5 set_time   001A90 R
  5 show       000E06 R   |   5 show_row   0003C8 R   |   5 sleep      001840 R
  5 software   0004D1 R   |     spaces     ****** GX  |   5 spi_clea   001D08 R
  5 spi_disa   001CF0 R   |   5 spi_enab   001CBD R   |   5 spi_rcv_   001D2A R
  5 spi_read   001D55 R   |   5 spi_sele   001D5D R   |   5 spi_send   001D14 R
  5 spi_writ   001D35 R   |   3 stack_fu   001760 GR  |   3 stack_un   001800 R
  5 step       001146 R   |   5 stop       0013AE R   |   5 store_lo   00115A R
  5 str_matc   000C34 R   |   5 strcmp     00043F R   |   5 strcpy     000450 GR
  5 strlen     000434 GR  |   5 syntax_e   0007BB GR  |   1 tab_widt   000024 GR
  5 tb_error   0007BD GR  |   5 term       000D13 R   |   5 term01     000D1B R
  5 term_exi   000D62 R   |   3 tib        001690 GR  |   1 ticks      00000E R
  5 timeout    001A9F R   |   1 timer      000010 GR  |   5 timer2_i   0000F3 R
  5 timer4_i   000100 R   |   5 tk_id      0007AB R   |   5 to         001116 R
  5 to_eepro   0001BF R   |   5 to_flash   0001D3 R   |   5 to_upper   000A14 GR
  5 token_ms   0003C0 R   |   5 tone       00128F R   |   5 try_next   001C53 R
  1 txtbgn     00001C GR  |   1 txtend     00001E GR  |   5 uart1_ge   00034B GR
  5 uart1_in   0002E8 R   |   5 uart1_pu   00032B GR  |   5 uart1_qg   00033D GR
  5 uart1_se   0002F8 R   |   5 uart3_ge   00036A GR  |   5 uart3_in   0002A5 R
  5 uart3_pu   000334 GR  |   5 uart3_qg   000344 GR  |   5 uart3_se   0002B5 R
  5 ubound     000E5B R   |   5 udiv32_1   000B3A R   |   5 uflash     0017B9 R
  5 umstar     000ADD R   |   5 unlock_e   000115 R   |   5 unlock_f   00012B R
  5 until      001B4D R   |   5 user_int   0000A0 R   |   5 user_spa   002200 R
  5 usr        0017BF R   |     var_name   ****** GX  |   1 vars       000039 GR
  5 wait       00103C R   |   5 warm_ini   0005BA R   |   5 warm_sta   000842 R
  5 words      001A2A R   |   5 words_co   001A7A R   |   5 write      00170A R
  5 write_bl   000282 R   |   5 write_by   00020D R   |   5 write_ee   000249 R
  5 write_ex   00027D R   |   5 write_fl   000233 R   |   5 write_ro   0001B0 R
  5 zero_pad   001404 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     6D   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   220E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

