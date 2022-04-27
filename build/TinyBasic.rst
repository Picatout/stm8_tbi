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
      0080F6 CD 9F 60         [ 4]  240 	call puts 
      0080F9                        241 UBTN_Handler_exit:
      0080F9 AE 17 FF         [ 2]  242     ldw x,#STACK_EMPTY 
      0080FC 94               [ 1]  243     ldw sp,x
      0080FD 9A               [ 1]  244 	rim 
      0080FE CE 00 1A         [ 2]  245 	ldw x,txtbgn 
      008101 A3 9F 00         [ 2]  246 	cpw x,#app_space 
      008104 22 03            [ 1]  247 	jrugt 5$
      008106 CD 85 D1         [ 4]  248 	call clear_basic 
      008109 CC 87 EB         [ 2]  249 5$:	jp warm_start
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
                                    451 ; a blow is 128 bytes 
                                    452 ; input:
                                    453 ;   farptr  address row begin
                                    454 ; output:
                                    455 ;   none
                                    456 ;--------------------------------------
      00822D                        457 block_erase:
      00822D CE 00 18         [ 2]  458 	ldw x,farptr+1
      008230 A3 9F 00         [ 2]  459 	cpw x,#app_space 
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
      008269 90 A3 9F 00      [ 2]  503     cpw y,#app_space 	 
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
      0082E9 CD 93 F9         [ 4]  584 	call incr_farptr
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
      008373 CD 9F 60         [ 4]  703 	call puts 
      008376 5F               [ 1]  704 	clrw x 
      008377 7B 02            [ 1]  705 	ld a,(AREG,sp)
      008379 97               [ 1]  706 	ld xl,a 
      00837A CD 88 B1         [ 4]  707 	call print_int 
      00837D A6 20            [ 1]  708 	ld a,#SPACE
      00837F CD 83 32         [ 4]  709 	call putc 
      008382 1E 03            [ 2]  710 	ldw x,(XREG,sp)
      008384 CD 88 B1         [ 4]  711 	call print_int 
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
      0083AA CD 88 B1         [ 4]  743 	call print_int 
      0083AD A6 20            [ 1]  744 	ld a,#SPACE  
      0083AF CD 83 32         [ 4]  745 	call putc
      0083B2                        746 row_loop:
      0083B2 1E 02            [ 2]  747 	ldw x,(ADR,sp)
      0083B4 F6               [ 1]  748 	ld a,(x)
      0083B5 5F               [ 1]  749 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083B6 97               [ 1]  750 	ld xl,a 
      0083B7 CD 88 B1         [ 4]  751 	call print_int 
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
      0084A9 0A 0A 54 69 6E 79 20   984 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
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
      008544 CD 9F 60         [ 4] 1027 	call puts 
      008547 A6 01            [ 1] 1028 	ld a,#MAJOR 
      008549 C7 00 0E         [ 1] 1029 	ld acc8,a 
      00854C 5F               [ 1] 1030 	clrw x 
      00854D CF 00 0C         [ 2] 1031 	ldw acc24,x
      008550 72 5F 00 22      [ 1] 1032 	clr tab_width  
      008554 35 0A 00 0B      [ 1] 1033 	mov base, #10 
      008558 CD 88 C1         [ 4] 1034 	call prti24 
      00855B A6 2E            [ 1] 1035 	ld a,#'.
      00855D CD 83 32         [ 4] 1036 	call putc 
      008560 A6 02            [ 1] 1037 	ld a,#MINOR 
      008562 C7 00 0E         [ 1] 1038 	ld acc8,a 
      008565 5F               [ 1] 1039 	clrw x 
      008566 CF 00 0C         [ 2] 1040 	ldw acc24,x 
      008569 CD 88 C1         [ 4] 1041 	call prti24
      00856C A6 0D            [ 1] 1042 	ld a,#CR 
      00856E CD 83 32         [ 4] 1043 	call putc
      008571 9A               [ 1] 1044 	rim 
      008572 72 5C 00 16      [ 1] 1045 	inc seedy+1 
      008576 72 5C 00 14      [ 1] 1046 	inc seedx+1 
      00857A CD 85 D1         [ 4] 1047 	call clear_basic
      00857D CD 8E 21         [ 4] 1048 	call ubound 
      008580 CD 92 60         [ 4] 1049 	call beep_1khz  
      008583                       1050 2$:	
      008583 CD 85 B3         [ 4] 1051 	call warm_init
                                   1052 ; check for application in flash memory 
      008586 CE 9F 00         [ 2] 1053 	ldw x,app_sign 
      008589 A3 42 43         [ 2] 1054 	cpw x,#0x4243
      00858C 27 03            [ 1] 1055 	jreq 3$
      00858E CC 87 EE         [ 2] 1056 	jp cmd_line 
      008591                       1057 3$:	 
      008591 AE 9F 04         [ 2] 1058 	ldw x,#app 
      008594 CF 00 05         [ 2] 1059 	ldw basicptr,x
      008597 CF 00 1A         [ 2] 1060 	ldw txtbgn,x 
      00859A E6 02            [ 1] 1061 	ld a,(2,x)
      00859C C7 00 04         [ 1] 1062 	ld count,a 
      00859F A6 03            [ 1] 1063 	ld a,#3 
      0085A1 C7 00 02         [ 1] 1064 	ld in,a 
      0085A4 CE 9F 02         [ 2] 1065 	ldw x,app_size 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      0085A7 72 BB 00 1A      [ 2] 1066 	addw x,txtbgn 
      0085AB CF 00 1C         [ 2] 1067 	ldw txtend,x  
      0085AE CC 88 2F         [ 2] 1068 	jp interp_loop 
      0085B1 20 FE            [ 2] 1069     jra .  
                                   1070 
      0085B3                       1071 warm_init:
      0085B3 72 5F 00 21      [ 1] 1072 	clr flags 
      0085B7 72 5F 00 1E      [ 1] 1073 	clr loop_depth 
      0085BB 35 04 00 22      [ 1] 1074 	mov tab_width,#TAB_WIDTH 
      0085BF 35 0A 00 0B      [ 1] 1075 	mov base,#10 
      0085C3 AE 00 00         [ 2] 1076 	ldw x,#0 
      0085C6 CF 00 05         [ 2] 1077 	ldw basicptr,x 
      0085C9 CF 00 01         [ 2] 1078 	ldw in.w,x 
      0085CC 72 5F 00 04      [ 1] 1079 	clr count
      0085D0 81               [ 4] 1080 	ret 
                                   1081 
                                   1082 
                                   1083 ;---------------------------
                                   1084 ; reset BASIC text variables 
                                   1085 ; and clear variables 
                                   1086 ;---------------------------
      0085D1                       1087 clear_basic:
      0085D1 72 5F 00 04      [ 1] 1088 	clr count
      0085D5 72 5F 00 02      [ 1] 1089 	clr in  
      0085D9 AE 00 65         [ 2] 1090 	ldw x,#free_ram 
      0085DC CF 00 1A         [ 2] 1091 	ldw txtbgn,x 
      0085DF CF 00 1C         [ 2] 1092 	ldw txtend,x 
      0085E2 CD 84 78         [ 4] 1093 	call clear_vars 
      0085E5 81               [ 4] 1094 	ret 
                                   1095 
                                   1096 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1097 ;;   Tiny BASIC error messages     ;;
                                   1098 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0085E6                       1099 err_msg:
      0085E6 00 00 86 06 86 13 86  1100 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             21 86 3A 86 49
      0085F2 86 5F 86 75 86 8F 86  1101 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             A0 86 B1
      0085FC 86 BD 86 F0 87 00 87  1102 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             14 87 27
                                   1103 
      008606 4D 65 6D 6F 72 79 20  1104 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      008613 73 79 6E 74 61 78 20  1105 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      008621 6D 61 74 68 20 6F 70  1106 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      00863A 64 69 76 69 73 69 6F  1107 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      008649 69 6E 76 61 6C 69 64  1108 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal  00-Bits]



             00
      00865F 72 75 6E 20 74 69 6D  1109 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      008675 63 6F 6D 6D 61 6E 64  1110 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      00868F 64 75 70 6C 69 63 61  1111 err_duplicate: .asciz "duplicate name.\n"
             74 65 20 6E 61 6D 65
             2E 0A 00
      0086A0 46 69 6C 65 20 6E 6F  1112 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      0086B1 62 61 64 20 76 61 6C  1113 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      0086BD 46 69 6C 65 20 69 6E  1114 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      0086F0 4E 6F 20 64 61 74 61  1115 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      008700 4E 6F 20 70 72 6F 67  1116 err_no_prog: .asciz "No program in RAM!\n"
             72 61 6D 20 69 6E 20
             52 41 4D 21 0A 00
      008714 46 69 6C 65 20 73 79  1117 err_no_fspace: .asciz "File system full.\n" 
             73 74 65 6D 20 66 75
             6C 6C 2E 0A 00
      008727 42 75 66 66 65 72 20  1118 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
                                   1119 
      008734 0A 72 75 6E 20 74 69  1120 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
      008746 0A 63 6F 6D 70 69 6C  1121 comp_msg: .asciz "\ncompile error, "
             65 20 65 72 72 6F 72
             2C 20 00
      008757 6C 61 73 74 20 74 6F  1122 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                   1123 
      008767                       1124 syntax_error::
      008767 A6 02            [ 1] 1125 	ld a,#ERR_SYNTAX 
                                   1126 
      008769                       1127 tb_error::
      008769 72 0A 00 21 44   [ 2] 1128 	btjt flags,#FCOMP,1$
      00876E 88               [ 1] 1129 	push a 
      00876F AE 87 34         [ 2] 1130 	ldw x, #rt_msg 
      008772 CD 9F 60         [ 4] 1131 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008775 84               [ 1] 1132 	pop a 
      008776 AE 85 E6         [ 2] 1133 	ldw x, #err_msg 
      008779 72 5F 00 0D      [ 1] 1134 	clr acc16 
      00877D 48               [ 1] 1135 	sll a
      00877E 72 59 00 0D      [ 1] 1136 	rlc acc16  
      008782 C7 00 0E         [ 1] 1137 	ld acc8, a 
      008785 72 BB 00 0D      [ 2] 1138 	addw x,acc16 
      008789 FE               [ 2] 1139 	ldw x,(x)
      00878A CD 9F 60         [ 4] 1140 	call puts
      00878D CE 00 05         [ 2] 1141 	ldw x,basicptr
      008790 C6 00 02         [ 1] 1142 	ld a,in 
      008793 CD 8E EA         [ 4] 1143 	call prt_basic_line
      008796 AE 87 57         [ 2] 1144 	ldw x,#tk_id 
      008799 CD 9F 60         [ 4] 1145 	call puts 
      00879C C6 00 03         [ 1] 1146 	ld a,in.saved 
      00879F 5F               [ 1] 1147 	clrw x 
      0087A0 97               [ 1] 1148 	ld xl,a 
      0087A1 72 BB 00 05      [ 2] 1149 	addw x,basicptr 
      0087A5 F6               [ 1] 1150 	ld a,(x)
      0087A6 5F               [ 1] 1151 	clrw x 
      0087A7 97               [ 1] 1152 	ld xl,a 
      0087A8 CD 88 B1         [ 4] 1153 	call print_int
      0087AB 72 0D 00 21 37   [ 2] 1154 	btjf flags,#FAUTORUN ,6$
      0087B0 20 35            [ 2] 1155 	jra 6$
      0087B2                       1156 1$:	
      0087B2 88               [ 1] 1157 	push a 
      0087B3 AE 87 46         [ 2] 1158 	ldw x,#comp_msg
      0087B6 CD 9F 60         [ 4] 1159 	call puts 
      0087B9 84               [ 1] 1160 	pop a 
      0087BA AE 85 E6         [ 2] 1161 	ldw x, #err_msg 
      0087BD 72 5F 00 0D      [ 1] 1162 	clr acc16 
      0087C1 48               [ 1] 1163 	sll a
      0087C2 72 59 00 0D      [ 1] 1164 	rlc acc16  
      0087C6 C7 00 0E         [ 1] 1165 	ld acc8, a 
      0087C9 72 BB 00 0D      [ 2] 1166 	addw x,acc16 
      0087CD FE               [ 2] 1167 	ldw x,(x)
      0087CE CD 9F 60         [ 4] 1168 	call puts
      0087D1 AE 16 90         [ 2] 1169 	ldw x,#tib
      0087D4 CD 9F 60         [ 4] 1170 	call puts 
      0087D7 A6 0D            [ 1] 1171 	ld a,#CR 
      0087D9 CD 83 32         [ 4] 1172 	call putc
      0087DC CE 00 01         [ 2] 1173 	ldw x,in.w
      0087DF CD 9F CD         [ 4] 1174 	call spaces
      0087E2 A6 5E            [ 1] 1175 	ld a,#'^
      0087E4 CD 83 32         [ 4] 1176 	call putc 
      0087E7 AE 17 FF         [ 2] 1177 6$: ldw x,#STACK_EMPTY 
      0087EA 94               [ 1] 1178     ldw sp,x
      0087EB                       1179 warm_start:
      0087EB CD 85 B3         [ 4] 1180 	call warm_init
                                   1181 ;----------------------------
                                   1182 ;   BASIC interpreter
                                   1183 ;----------------------------
      0087EE                       1184 cmd_line: ; user interface 
      0087EE A6 0D            [ 1] 1185 	ld a,#CR 
      0087F0 CD 83 32         [ 4] 1186 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0087F3 A6 3E            [ 1] 1187 	ld a,#'> 
      0087F5 CD 83 32         [ 4] 1188 	call putc
      0087F8 CD A0 65         [ 4] 1189 	call readln
      0087FB 72 5D 00 04      [ 1] 1190 	tnz count 
      0087FF 27 ED            [ 1] 1191 	jreq cmd_line
      008801 CD A6 3E         [ 4] 1192 	call compile
                                   1193 ; if text begin with a line number
                                   1194 ; the compiler set count to zero    
                                   1195 ; so code is not interpreted
      008804 72 5D 00 04      [ 1] 1196 	tnz count 
      008808 27 E4            [ 1] 1197 	jreq cmd_line
                                   1198 
                                   1199 ; if direct command 
                                   1200 ; it's ready to interpret 
                                   1201 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1202 ;; This is the interpreter loop
                                   1203 ;; for each BASIC code line. 
                                   1204 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00880A                       1205 interpreter: 
      00880A C6 00 02         [ 1] 1206 	ld a,in 
      00880D C1 00 04         [ 1] 1207 	cp a,count 
      008810 2B 1D            [ 1] 1208 	jrmi interp_loop
      008812                       1209 next_line:
      008812 72 01 00 21 D7   [ 2] 1210 	btjf flags, #FRUN, cmd_line
      008817 CE 00 05         [ 2] 1211 	ldw x,basicptr
      00881A 72 BB 00 01      [ 2] 1212 	addw x,in.w 
      00881E C3 00 1C         [ 2] 1213 	cpw x,txtend 
      008821 2A C8            [ 1] 1214 	jrpl warm_start
      008823 CF 00 05         [ 2] 1215 	ldw basicptr,x ; start of next line  
      008826 E6 02            [ 1] 1216 	ld a,(2,x)
      008828 C7 00 04         [ 1] 1217 	ld count,a 
      00882B 35 03 00 02      [ 1] 1218 	mov in,#3 ; skip first 3 bytes of line 
      00882F                       1219 interp_loop: 
      00882F CD 88 56         [ 4] 1220 	call next_token
      008832 A1 00            [ 1] 1221 	cp a,#TK_NONE 
      008834 27 DC            [ 1] 1222 	jreq next_line 
      008836 A1 80            [ 1] 1223 	cp a,#TK_CMD
      008838 26 03            [ 1] 1224 	jrne 1$
      00883A FD               [ 4] 1225 	call (x) 
      00883B 20 F2            [ 2] 1226 	jra interp_loop 
      00883D                       1227 1$:	 
      00883D A1 85            [ 1] 1228 	cp a,#TK_VAR
      00883F 26 05            [ 1] 1229 	jrne 2$
      008841 CD 8E 54         [ 4] 1230 	call let_var  
      008844 20 E9            [ 2] 1231 	jra interp_loop 
      008846                       1232 2$:	
      008846 A1 06            [ 1] 1233 	cp a,#TK_ARRAY 
      008848 26 05            [ 1] 1234 	jrne 3$
      00884A CD 8E 51         [ 4] 1235 	call let_array 
      00884D 20 E0            [ 2] 1236 	jra interp_loop
      00884F                       1237 3$:	
      00884F A1 0B            [ 1] 1238 	cp a,#TK_COLON 
      008851 27 DC            [ 1] 1239 	jreq interp_loop 
      008853 CC 87 67         [ 2] 1240 	jp syntax_error 
                                   1241 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1242 		
                                   1243 ;--------------------------
                                   1244 ; extract next token from
                                   1245 ; token list 
                                   1246 ; basicptr -> base address 
                                   1247 ; in  -> offset in list array 
                                   1248 ; output:
                                   1249 ;   A 		token attribute
                                   1250 ;   X 		token value if there is one
                                   1251 ;----------------------------------------
      008856                       1252 next_token::
      008856 5F               [ 1] 1253 	clrw x 
      008857 C6 00 02         [ 1] 1254 	ld a,in 
                                   1255 ; don't replace sub by "cp a,count" 
                                   1256 ; if end of line must return with A=0   	
      00885A C0 00 04         [ 1] 1257 	sub a,count 
      00885D 27 51            [ 1] 1258 	jreq 9$ ; end of line 
      00885F                       1259 0$: 
      00885F 55 00 02 00 03   [ 1] 1260 	mov in.saved,in ; in case "_unget_token" needed 
      008864 90 CE 00 05      [ 2] 1261 	ldw y,basicptr 
      008868 91 D6 01         [ 4] 1262 	ld a,([in.w],y)
      00886B 72 5C 00 02      [ 1] 1263 	inc in  
      00886F 4D               [ 1] 1264 	tnz a 
      008870 2B 27            [ 1] 1265 	jrmi 6$
      008872 A1 06            [ 1] 1266 	cp a,#TK_ARRAY
      008874 2A 3A            [ 1] 1267 	jrpl 9$  ; no attribute for these
      008876                       1268 1$: ; 
      008876 A1 03            [ 1] 1269 	cp a,#TK_CHAR
      008878 26 0B            [ 1] 1270 	jrne 2$
      00887A 41               [ 1] 1271 	exg a,xl
      00887B 91 D6 01         [ 4] 1272 	ld a,([in.w],y)
      00887E 72 5C 00 02      [ 1] 1273 	inc in 
      008882 41               [ 1] 1274 	exg a,xl  
      008883 20 2B            [ 2] 1275 	jra 9$ 
      008885 A1 02            [ 1] 1276 2$:	cp a,#TK_QSTR 
      008887 26 27            [ 1] 1277 	jrne 9$
      008889 93               [ 1] 1278 	ldw x,y 
      00888A 72 BB 00 01      [ 2] 1279 	addw x,in.w ; pointer to string 
                                   1280 ; move pointer after string 
      00888E 91 6D 01         [ 4] 1281 3$:	tnz ([in.w],y)
      008891 27 19            [ 1] 1282 	jreq 8$
      008893 72 5C 00 02      [ 1] 1283 	inc in 
      008897 20 F5            [ 2] 1284 	jra 3$
      008899                       1285 6$: 
      008899 72 B9 00 01      [ 2] 1286 	addw y,in.w 
      00889D 90 FE            [ 2] 1287 	ldw y,(y)
      00889F A1 84            [ 1] 1288 	cp a,#TK_INTGR
      0088A1 2A 04            [ 1] 1289 	jrpl 7$
      0088A3 90 DE 9E 01      [ 2] 1290 	ldw y,(code_addr,y) 
      0088A7 51               [ 1] 1291 7$:	exgw x,y 
      0088A8 72 5C 00 02      [ 1] 1292 	inc in
      0088AC 72 5C 00 02      [ 1] 1293 8$:	inc in 
      0088B0                       1294 9$: 
      0088B0 81               [ 4] 1295 	ret	
                                   1296 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1297 ;-----------------------------------
                                   1298 ; print a 16 bit integer 
                                   1299 ; using variable 'base' as conversion
                                   1300 ; format.
                                   1301 ; input:
                                   1302 ;   X       integer to print 
                                   1303 ;   'base'    conversion base 
                                   1304 ; output:
                                   1305 ;   none 
                                   1306 ;-----------------------------------
      0088B1                       1307 print_int:
      0088B1 72 5F 00 0C      [ 1] 1308 	clr acc24 
      0088B5 CF 00 0D         [ 2] 1309 	ldw acc16,x 
      0088B8 72 0F 00 0D 04   [ 2] 1310 	btjf acc16,#7,prti24
      0088BD 72 53 00 0C      [ 1] 1311 	cpl acc24 
                                   1312 
                                   1313 ;------------------------------------
                                   1314 ; print integer in acc24 
                                   1315 ; input:
                                   1316 ;	acc24 		integer to print 
                                   1317 ;	'base' 		numerical base for conversion 
                                   1318 ;   'tab_width' field width 
                                   1319 ;  output:
                                   1320 ;    A          string length
                                   1321 ;------------------------------------
      0088C1                       1322 prti24:
      0088C1 CD 88 CD         [ 4] 1323     call itoa  ; conversion entier en  .asciz
      0088C4 CD A6 DD         [ 4] 1324 	call right_align  
      0088C7 88               [ 1] 1325 	push a 
      0088C8 CD 9F 60         [ 4] 1326 	call puts
      0088CB 84               [ 1] 1327 	pop a 
      0088CC 81               [ 4] 1328     ret	
                                   1329 
                                   1330 ;------------------------------------
                                   1331 ; convert integer in acc24 to string
                                   1332 ; input:
                                   1333 ;   'base'	conversion base 
                                   1334 ;	acc24	integer to convert
                                   1335 ; output:
                                   1336 ;   X  		pointer to first char of string
                                   1337 ;   A       string length
                                   1338 ;------------------------------------
                           000001  1339 	SIGN=1  ; integer sign 
                           000002  1340 	LEN=2 
                           000003  1341 	PSTR=3
                           000004  1342 	VSIZE=4 ;locals size
      0088CD                       1343 itoa::
      00084D                       1344 	_vars VSIZE
      0088CD 52 04            [ 2]    1     sub sp,#VSIZE 
      0088CF 0F 02            [ 1] 1345 	clr (LEN,sp) ; string length  
      0088D1 0F 01            [ 1] 1346 	clr (SIGN,sp)    ; sign
      0088D3 C6 00 0B         [ 1] 1347 	ld a,base 
      0088D6 A1 0A            [ 1] 1348 	cp a,#10
      0088D8 26 0A            [ 1] 1349 	jrne 1$
                                   1350 	; base 10 string display with negative sign if bit 23==1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0088DA 72 0F 00 0C 05   [ 2] 1351 	btjf acc24,#7,1$
      0088DF 03 01            [ 1] 1352 	cpl (SIGN,sp)
      0088E1 CD 89 99         [ 4] 1353 	call neg_acc24
      0088E4                       1354 1$:
                                   1355 ; initialize string pointer 
      0088E4 AE 16 90         [ 2] 1356 	ldw x,#tib 
      0088E7 1C 00 50         [ 2] 1357 	addw x,#TIB_SIZE
      0088EA 5A               [ 2] 1358 	decw x 
      0088EB 7F               [ 1] 1359 	clr (x)
      0088EC A6 20            [ 1] 1360 	ld a,#32
      0088EE F7               [ 1] 1361 	ld (x),a 
      0088EF 0C 02            [ 1] 1362 	inc (LEN,sp)
      0088F1                       1363 itoa_loop:
      0088F1 C6 00 0B         [ 1] 1364     ld a,base
      0088F4 1F 03            [ 2] 1365 	ldw (PSTR,sp),x 
      0088F6 CD 89 37         [ 4] 1366     call divu24_8 ; acc24/A 
      0088F9 1E 03            [ 2] 1367 	ldw x,(PSTR,sp)
      0088FB AB 30            [ 1] 1368     add a,#'0  ; remainder of division
      0088FD A1 3A            [ 1] 1369     cp a,#'9+1
      0088FF 2B 02            [ 1] 1370     jrmi 2$
      008901 AB 07            [ 1] 1371     add a,#7 
      008903                       1372 2$:	
      008903 5A               [ 2] 1373 	decw x
      008904 F7               [ 1] 1374     ld (x),a
      008905 0C 02            [ 1] 1375 	inc (LEN,sp)
                                   1376 	; if acc24==0 conversion done
      008907 C6 00 0C         [ 1] 1377 	ld a,acc24
      00890A CA 00 0D         [ 1] 1378 	or a,acc16
      00890D CA 00 0E         [ 1] 1379 	or a,acc8
      008910 26 DF            [ 1] 1380     jrne itoa_loop
                                   1381 	;conversion done, next add '$' or '-' as required
      008912 C6 00 0B         [ 1] 1382 	ld a,base 
      008915 A1 10            [ 1] 1383 	cp a,#16
      008917 27 08            [ 1] 1384 	jreq 8$
      008919 7B 01            [ 1] 1385 	ld a,(SIGN,sp)
      00891B 27 15            [ 1] 1386     jreq 10$
      00891D A6 2D            [ 1] 1387     ld a,#'-
      00891F 20 0D            [ 2] 1388 	jra 9$ 
                                   1389 ; don't print more than 4 digits
                                   1390 ; in hexadecimal to avoid '-' sign 
                                   1391 ; extend display 	
      008921 7B 02            [ 1] 1392 8$: ld a,(LEN,sp) 
      008923 A1 05            [ 1] 1393 	cp a,#5 
      008925 2B 05            [ 1] 1394 	jrmi 81$
      008927 5C               [ 1] 1395 	incw x
      008928 0A 02            [ 1] 1396 	dec (LEN,sp)
      00892A 20 F5            [ 2] 1397 	jra 8$
      00892C                       1398 81$:	
      00892C A6 24            [ 1] 1399 	ld a,#'$ 
      00892E 5A               [ 2] 1400 9$: decw x
      00892F F7               [ 1] 1401     ld (x),a
      008930 0C 02            [ 1] 1402 	inc (LEN,sp)
      008932                       1403 10$:
      008932 7B 02            [ 1] 1404 	ld a,(LEN,sp)
      0008B4                       1405 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008934 5B 04            [ 2]    1     addw sp,#VSIZE 
      008936 81               [ 4] 1406 	ret
                                   1407 
                                   1408 ;-------------------------------------
                                   1409 ; divide uint24_t by uint8_t
                                   1410 ; used to convert uint24_t to string
                                   1411 ; input:
                                   1412 ;	acc24	dividend
                                   1413 ;   A 		divisor
                                   1414 ; output:
                                   1415 ;   acc24	quotient
                                   1416 ;   A		remainder
                                   1417 ;------------------------------------- 
                                   1418 ; offset  on sp of arguments and locals
                           000001  1419 	U8   = 1   ; divisor on stack
                           000001  1420 	VSIZE =1
      008937                       1421 divu24_8:
      008937 89               [ 2] 1422 	pushw x ; save x
      008938 88               [ 1] 1423 	push a 
                                   1424 	; ld dividend UU:MM bytes in X
      008939 C6 00 0C         [ 1] 1425 	ld a, acc24
      00893C 95               [ 1] 1426 	ld xh,a
      00893D C6 00 0D         [ 1] 1427 	ld a,acc24+1
      008940 97               [ 1] 1428 	ld xl,a
      008941 7B 01            [ 1] 1429 	ld a,(U8,SP) ; divisor
      008943 62               [ 2] 1430 	div x,a ; UU:MM/U8
      008944 88               [ 1] 1431 	push a  ;save remainder
      008945 9E               [ 1] 1432 	ld a,xh
      008946 C7 00 0C         [ 1] 1433 	ld acc24,a
      008949 9F               [ 1] 1434 	ld a,xl
      00894A C7 00 0D         [ 1] 1435 	ld acc24+1,a
      00894D 84               [ 1] 1436 	pop a
      00894E 95               [ 1] 1437 	ld xh,a
      00894F C6 00 0E         [ 1] 1438 	ld a,acc24+2
      008952 97               [ 1] 1439 	ld xl,a
      008953 7B 01            [ 1] 1440 	ld a,(U8,sp) ; divisor
      008955 62               [ 2] 1441 	div x,a  ; R:LL/U8
      008956 6B 01            [ 1] 1442 	ld (U8,sp),a ; save remainder
      008958 9F               [ 1] 1443 	ld a,xl
      008959 C7 00 0E         [ 1] 1444 	ld acc24+2,a
      00895C 84               [ 1] 1445 	pop a
      00895D 85               [ 2] 1446 	popw x
      00895E 81               [ 4] 1447 	ret
                                   1448 
                                   1449 ;--------------------------------------
                                   1450 ; unsigned multiply uint24_t by uint8_t
                                   1451 ; use to convert numerical string to uint24_t
                                   1452 ; input:
                                   1453 ;	acc24	uint24_t 
                                   1454 ;   A		uint8_t
                                   1455 ; output:
                                   1456 ;   acc24   A*acc24
                                   1457 ;-------------------------------------
                                   1458 ; local variables offset  on sp
                           000003  1459 	U8   = 3   ; A pushed on stack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                           000002  1460 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1461 	OVFH = 1  ; multiplication overflow high byte
                           000003  1462 	VSIZE = 3
      00895F                       1463 mulu24_8:
      00895F 89               [ 2] 1464 	pushw x    ; save X
                                   1465 	; local variables
      008960 88               [ 1] 1466 	push a     ; U8
      008961 5F               [ 1] 1467 	clrw x     ; initialize overflow to 0
      008962 89               [ 2] 1468 	pushw x    ; multiplication overflow
                                   1469 ; multiply low byte.
      008963 C6 00 0E         [ 1] 1470 	ld a,acc24+2
      008966 97               [ 1] 1471 	ld xl,a
      008967 7B 03            [ 1] 1472 	ld a,(U8,sp)
      008969 42               [ 4] 1473 	mul x,a
      00896A 9F               [ 1] 1474 	ld a,xl
      00896B C7 00 0E         [ 1] 1475 	ld acc24+2,a
      00896E 9E               [ 1] 1476 	ld a, xh
      00896F 6B 02            [ 1] 1477 	ld (OVFL,sp),a
                                   1478 ; multipy middle byte
      008971 C6 00 0D         [ 1] 1479 	ld a,acc24+1
      008974 97               [ 1] 1480 	ld xl,a
      008975 7B 03            [ 1] 1481 	ld a, (U8,sp)
      008977 42               [ 4] 1482 	mul x,a
                                   1483 ; add overflow to this partial product
      008978 72 FB 01         [ 2] 1484 	addw x,(OVFH,sp)
      00897B 9F               [ 1] 1485 	ld a,xl
      00897C C7 00 0D         [ 1] 1486 	ld acc24+1,a
      00897F 4F               [ 1] 1487 	clr a
      008980 A9 00            [ 1] 1488 	adc a,#0
      008982 6B 01            [ 1] 1489 	ld (OVFH,sp),a
      008984 9E               [ 1] 1490 	ld a,xh
      008985 6B 02            [ 1] 1491 	ld (OVFL,sp),a
                                   1492 ; multiply most signficant byte	
      008987 C6 00 0C         [ 1] 1493 	ld a, acc24
      00898A 97               [ 1] 1494 	ld xl, a
      00898B 7B 03            [ 1] 1495 	ld a, (U8,sp)
      00898D 42               [ 4] 1496 	mul x,a
      00898E 72 FB 01         [ 2] 1497 	addw x, (OVFH,sp)
      008991 9F               [ 1] 1498 	ld a, xl
      008992 C7 00 0C         [ 1] 1499 	ld acc24,a
      008995 5B 03            [ 2] 1500     addw sp,#VSIZE
      008997 85               [ 2] 1501 	popw x
      008998 81               [ 4] 1502 	ret
                                   1503 
                                   1504 ;------------------------------------
                                   1505 ;  two's complement acc24
                                   1506 ;  input:
                                   1507 ;		acc24 variable
                                   1508 ;  output:
                                   1509 ;		acc24 variable
                                   1510 ;-------------------------------------
      008999                       1511 neg_acc24:
      008999 72 53 00 0E      [ 1] 1512 	cpl acc24+2
      00899D 72 53 00 0D      [ 1] 1513 	cpl acc24+1
      0089A1 72 53 00 0C      [ 1] 1514 	cpl acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0089A5 A6 01            [ 1] 1515 	ld a,#1
      0089A7 CB 00 0E         [ 1] 1516 	add a,acc24+2
      0089AA C7 00 0E         [ 1] 1517 	ld acc24+2,a
      0089AD 4F               [ 1] 1518 	clr a
      0089AE C9 00 0D         [ 1] 1519 	adc a,acc24+1
      0089B1 C7 00 0D         [ 1] 1520 	ld acc24+1,a 
      0089B4 4F               [ 1] 1521 	clr a 
      0089B5 C9 00 0C         [ 1] 1522 	adc a,acc24 
      0089B8 C7 00 0C         [ 1] 1523 	ld acc24,a 
      0089BB 81               [ 4] 1524 	ret
                                   1525 
                                   1526 
                                   1527 
                                   1528 
                                   1529 ;------------------------------------
                                   1530 ; convert alpha to uppercase
                                   1531 ; input:
                                   1532 ;    a  character to convert
                                   1533 ; output:
                                   1534 ;    a  uppercase character
                                   1535 ;------------------------------------
      0089BC                       1536 to_upper::
      0089BC A1 61            [ 1] 1537 	cp a,#'a
      0089BE 2A 01            [ 1] 1538 	jrpl 1$
      0089C0 81               [ 4] 1539 0$:	ret
      0089C1 A1 7A            [ 1] 1540 1$: cp a,#'z	
      0089C3 22 FB            [ 1] 1541 	jrugt 0$
      0089C5 A0 20            [ 1] 1542 	sub a,#32
      0089C7 81               [ 4] 1543 	ret
                                   1544 	
                                   1545 ;------------------------------------
                                   1546 ; convert pad content in integer
                                   1547 ; input:
                                   1548 ;    x		.asciz to convert
                                   1549 ; output:
                                   1550 ;    acc24      int24_t
                                   1551 ;------------------------------------
                                   1552 	; local variables
                           000001  1553 	SIGN=1 ; 1 byte, 
                           000002  1554 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  1555 	TEMP=3 ; 1 byte, temporary storage
                           000003  1556 	VSIZE=3 ; 3 bytes reserved for local storage
      0089C8                       1557 atoi24::
      0089C8 89               [ 2] 1558 	pushw x 
      000949                       1559 	_vars VSIZE
      0089C9 52 03            [ 2]    1     sub sp,#VSIZE 
                                   1560 	; acc24=0 
      0089CB 72 5F 00 0C      [ 1] 1561 	clr acc24    
      0089CF 72 5F 00 0D      [ 1] 1562 	clr acc16
      0089D3 72 5F 00 0E      [ 1] 1563 	clr acc8 
      0089D7 0F 01            [ 1] 1564 	clr (SIGN,sp)
      0089D9 A6 0A            [ 1] 1565 	ld a,#10
      0089DB 6B 02            [ 1] 1566 	ld (BASE,sp),a ; default base decimal
      0089DD F6               [ 1] 1567 	ld a,(x)
      0089DE 27 47            [ 1] 1568 	jreq 9$  ; completed if 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0089E0 A1 2D            [ 1] 1569 	cp a,#'-
      0089E2 26 04            [ 1] 1570 	jrne 1$
      0089E4 03 01            [ 1] 1571 	cpl (SIGN,sp)
      0089E6 20 08            [ 2] 1572 	jra 2$
      0089E8 A1 24            [ 1] 1573 1$: cp a,#'$
      0089EA 26 06            [ 1] 1574 	jrne 3$
      0089EC A6 10            [ 1] 1575 	ld a,#16
      0089EE 6B 02            [ 1] 1576 	ld (BASE,sp),a
      0089F0 5C               [ 1] 1577 2$:	incw x
      0089F1 F6               [ 1] 1578 	ld a,(x)
      0089F2                       1579 3$:	
      0089F2 A1 61            [ 1] 1580 	cp a,#'a
      0089F4 2B 02            [ 1] 1581 	jrmi 4$
      0089F6 A0 20            [ 1] 1582 	sub a,#32
      0089F8 A1 30            [ 1] 1583 4$:	cp a,#'0
      0089FA 2B 2B            [ 1] 1584 	jrmi 9$
      0089FC A0 30            [ 1] 1585 	sub a,#'0
      0089FE A1 0A            [ 1] 1586 	cp a,#10
      008A00 2B 06            [ 1] 1587 	jrmi 5$
      008A02 A0 07            [ 1] 1588 	sub a,#7
      008A04 11 02            [ 1] 1589 	cp a,(BASE,sp)
      008A06 2A 1F            [ 1] 1590 	jrpl 9$
      008A08 6B 03            [ 1] 1591 5$:	ld (TEMP,sp),a
      008A0A 7B 02            [ 1] 1592 	ld a,(BASE,sp)
      008A0C CD 89 5F         [ 4] 1593 	call mulu24_8
      008A0F 7B 03            [ 1] 1594 	ld a,(TEMP,sp)
      008A11 CB 00 0E         [ 1] 1595 	add a,acc24+2
      008A14 C7 00 0E         [ 1] 1596 	ld acc24+2,a
      008A17 4F               [ 1] 1597 	clr a
      008A18 C9 00 0D         [ 1] 1598 	adc a,acc24+1
      008A1B C7 00 0D         [ 1] 1599 	ld acc24+1,a
      008A1E 4F               [ 1] 1600 	clr a
      008A1F C9 00 0C         [ 1] 1601 	adc a,acc24
      008A22 C7 00 0C         [ 1] 1602 	ld acc24,a
      008A25 20 C9            [ 2] 1603 	jra 2$
      008A27 0D 01            [ 1] 1604 9$:	tnz (SIGN,sp)
      008A29 27 03            [ 1] 1605     jreq atoi_exit
      008A2B CD 89 99         [ 4] 1606     call neg_acc24
      008A2E                       1607 atoi_exit: 
      0009AE                       1608 	_drop VSIZE
      008A2E 5B 03            [ 2]    1     addw sp,#VSIZE 
      008A30 85               [ 2] 1609 	popw x ; restore x
      008A31 81               [ 4] 1610 	ret
                                   1611 
                                   1612 
                                   1613 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1614 ;;   TINY BASIC  operators,
                                   1615 ;;   commands and functions 
                                   1616 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1617 
                                   1618 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1619 ;;  Arithmetic operators
                                   1620 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1621 
                                   1622 ;debug support
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                           000001  1623 DEBUG_PRT=1
                           000001  1624 .if DEBUG_PRT 
                           000001  1625 	REGA=1
                           000002  1626 	SAVEB=2
                           000003  1627 	REGX=3
                           000005  1628 	REGY=5
                           000007  1629 	ACC24=7
                           000009  1630 	VSIZE=9 
      008A32                       1631 printxy:
      0009B2                       1632 	_vars VSIZE 
      008A32 52 09            [ 2]    1     sub sp,#VSIZE 
      008A34 6B 01            [ 1] 1633 	ld (REGA,sp),a 
      008A36 C6 00 0B         [ 1] 1634 	ld a,base 
      008A39 6B 02            [ 1] 1635 	ld (SAVEB,sp),a
      008A3B 1F 03            [ 2] 1636 	ldw (REGX,sp),x
      008A3D 17 05            [ 2] 1637 	ldw (REGY,sp),y
      008A3F CE 00 0C         [ 2] 1638 	ldw x,acc24 
      008A42 C6 00 0E         [ 1] 1639 	ld a,acc8 
      008A45 1F 07            [ 2] 1640 	ldw (ACC24,sp),x 
      008A47 6B 09            [ 1] 1641 	ld (ACC24+2,sp),a 
      008A49 35 10 00 0B      [ 1] 1642 	mov base,#16 
      008A4D 5F               [ 1] 1643 	clrw x 
      008A4E 7B 01            [ 1] 1644 	ld a,(REGA,sp)
      008A50 97               [ 1] 1645 	ld xl,a 
      008A51 CD 88 B1         [ 4] 1646 	call print_int
      008A54 A6 20            [ 1] 1647 	ld a,#SPACE 
      008A56 CD 83 32         [ 4] 1648 	call putc  
      008A59 1E 03            [ 2] 1649 	ldw x,(REGX,sp)
      008A5B CD 88 B1         [ 4] 1650 	call print_int 
      008A5E A6 20            [ 1] 1651 	ld a,#SPACE 
      008A60 CD 83 32         [ 4] 1652 	call putc  
      008A63 1E 05            [ 2] 1653 	ldw x,(REGY,sp)
      008A65 CD 88 B1         [ 4] 1654 	call print_int 
      008A68 A6 0D            [ 1] 1655 	ld a,#CR 
      008A6A CD 83 32         [ 4] 1656 	call putc 
      008A6D 7B 09            [ 1] 1657 	ld a,(ACC24+2,sp)
      008A6F 1E 07            [ 2] 1658 	ldw x,(ACC24,sp)
      008A71 CF 00 0C         [ 2] 1659 	ldw acc24,x 
      008A74 C7 00 0E         [ 1] 1660 	ld acc8,a
      008A77 7B 02            [ 1] 1661 	ld a,(SAVEB,sp)
      008A79 C7 00 0B         [ 1] 1662 	ld base,a 
      008A7C 7B 01            [ 1] 1663 	ld a,(REGA,sp)
      008A7E 1E 03            [ 2] 1664 	ldw x,(REGX,sp)
      008A80 16 05            [ 2] 1665 	ldw y,(REGY,sp)
      000A02                       1666 	_drop VSIZE 
      008A82 5B 09            [ 2]    1     addw sp,#VSIZE 
      008A84 81               [ 4] 1667 	ret 
                                   1668 .endif 
                                   1669 
                                   1670 
                                   1671 ;--------------------------------------
                                   1672 ;  multiply 2 uint16_t return uint32_t
                                   1673 ;  input:
                                   1674 ;     x       uint16_t 
                                   1675 ;     y       uint16_t 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1676 ;  output:
                                   1677 ;     x       product bits 15..0
                                   1678 ;     y       product bits 31..16 
                                   1679 ;---------------------------------------
                           000001  1680 		U1=1  ; uint16_t 
                           000003  1681 		DBL=3 ; uint32_t
                           000006  1682 		VSIZE=6
      008A85                       1683 umstar:
      000A05                       1684 	_vars VSIZE 
      008A85 52 06            [ 2]    1     sub sp,#VSIZE 
      008A87 1F 01            [ 2] 1685 	ldw (U1,sp),x 
                                   1686 ;initialize bits 31..16 of 
                                   1687 ;product to zero 
      008A89 0F 03            [ 1] 1688 	clr (DBL,sp)
      008A8B 0F 04            [ 1] 1689 	clr (DBL+1,sp)
                                   1690 ; produc U1L*U2L 
      008A8D 90 9F            [ 1] 1691 	ld a,yl 
      008A8F 42               [ 4] 1692 	mul x,a 
      008A90 1F 05            [ 2] 1693 	ldw (DBL+2,sp),x
                                   1694 ; product U1H*U2L 
      008A92 7B 01            [ 1] 1695 	ld a,(U1,sp) ; xh 
      008A94 93               [ 1] 1696 	ldw x,y
      008A95 42               [ 4] 1697 	mul x,a 
      008A96 4F               [ 1] 1698 	clr a 
      008A97 72 FB 04         [ 2] 1699 	addw x,(DBL+1,sp) 
      008A9A 4F               [ 1] 1700 	clr a 
      008A9B 19 03            [ 1] 1701 	adc a,(DBL,sp) 
      008A9D 6B 03            [ 1] 1702 	ld (DBL,sp),a ; bits 23..17 
      008A9F 1F 04            [ 2] 1703 	ldw (DBL+1,sp),x ; bits 15..0 
                                   1704 ; product U1L*U2H
      008AA1 90 5E            [ 1] 1705 	swapw y 
      008AA3 93               [ 1] 1706 	ldw x,y
      008AA4 7B 02            [ 1] 1707 	ld a,(U1+1,sp)
      008AA6 42               [ 4] 1708 	mul x,a
      008AA7 72 FB 04         [ 2] 1709 	addw x,(DBL+1,sp)
      008AAA 4F               [ 1] 1710 	clr a 
      008AAB 19 03            [ 1] 1711 	adc a,(DBL,sp)
      008AAD 6B 03            [ 1] 1712 	ld (DBL,sp),a 
      008AAF 1F 04            [ 2] 1713 	ldw (DBL+1,sp),x 
                                   1714 ; product U1H*U2H 	
      008AB1 7B 01            [ 1] 1715 	ld a,(U1,sp)
      008AB3 93               [ 1] 1716 	ldw x,y  
      008AB4 42               [ 4] 1717 	mul x,a 
      008AB5 72 FB 03         [ 2] 1718 	addw x,(DBL,sp)
      008AB8 90 93            [ 1] 1719 	ldw y,x 
      008ABA 1E 05            [ 2] 1720 	ldw x,(DBL+2,sp)
      000A3C                       1721 	_drop VSIZE 
      008ABC 5B 06            [ 2]    1     addw sp,#VSIZE 
      008ABE 81               [ 4] 1722 	ret
                                   1723 
                                   1724 
                                   1725 ;-------------------------------------
                                   1726 ; multiply 2 integers
                                   1727 ; input:
                                   1728 ;  	x       n1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1729 ;   y 		n2 
                                   1730 ; output:
                                   1731 ;	X        N1*N2 bits 15..0
                                   1732 ;   Y        N1*N2 bits 31..16 
                                   1733 ;-------------------------------------
                           000001  1734 	SIGN=1
                           000001  1735 	VSIZE=1
      008ABF                       1736 multiply:
      000A3F                       1737 	_vars VSIZE 
      008ABF 52 01            [ 2]    1     sub sp,#VSIZE 
      008AC1 0F 01            [ 1] 1738 	clr (SIGN,sp)
      008AC3 9E               [ 1] 1739 	ld a,xh 
      008AC4 A4 80            [ 1] 1740 	and a,#0x80
      008AC6 2A 03            [ 1] 1741 	jrpl 1$
      008AC8 03 01            [ 1] 1742 	cpl (SIGN,sp)
      008ACA 50               [ 2] 1743 	negw x 
      008ACB                       1744 1$:	
      008ACB 90 9E            [ 1] 1745 	ld a,yh
      008ACD A4 80            [ 1] 1746 	and a,#0x80  
      008ACF 2A 04            [ 1] 1747 	jrpl 2$ 
      008AD1 03 01            [ 1] 1748 	cpl (SIGN,sp)
      008AD3 90 50            [ 2] 1749 	negw y 
      008AD5                       1750 2$:	
      008AD5 CD 8A 85         [ 4] 1751 	call umstar
      008AD8 7B 01            [ 1] 1752 	ld a,(SIGN,sp)
      008ADA 27 03            [ 1] 1753 	jreq 3$
      008ADC CD 8B 0C         [ 4] 1754 	call dneg 
      008ADF                       1755 3$:	
      000A5F                       1756 	_drop VSIZE 
      008ADF 5B 01            [ 2]    1     addw sp,#VSIZE 
      008AE1 81               [ 4] 1757 	ret
                                   1758 
                                   1759 ;--------------------------------------
                                   1760 ; divide uint32_t/uint16_t
                                   1761 ; return:  quotient and remainder 
                                   1762 ; quotient expected to be uint16_t 
                                   1763 ; input:
                                   1764 ;   DBLDIVDND    on stack 
                                   1765 ;   X            divisor 
                                   1766 ; output:
                                   1767 ;   X            quotient 
                                   1768 ;   Y            remainder 
                                   1769 ;---------------------------------------
                           000003  1770 	VSIZE=3
      008AE2                       1771 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000A62                       1772 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   1773 	; local variables 
                           000001  1774 	DIVISOR=1 
                           000003  1775 	CNTR=3 
      000A62                       1776 udiv32_16:
      000A62                       1777 	_vars VSIZE 
      008AE2 52 03            [ 2]    1     sub sp,#VSIZE 
      008AE4 1F 01            [ 2] 1778 	ldw (DIVISOR,sp),x	; save divisor 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008AE6 1E 08            [ 2] 1779 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008AE8 16 06            [ 2] 1780 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008AEA 90 5D            [ 2] 1781 	tnzw y
      008AEC 26 06            [ 1] 1782 	jrne long_division 
      008AEE 16 01            [ 2] 1783 	ldw y,(DIVISOR,sp)
      008AF0 65               [ 2] 1784 	divw x,y
      000A71                       1785 	_drop VSIZE 
      008AF1 5B 03            [ 2]    1     addw sp,#VSIZE 
      008AF3 81               [ 4] 1786 	ret
      008AF4                       1787 long_division:
      008AF4 51               [ 1] 1788 	exgw x,y ; hi in x, lo in y 
      008AF5 A6 11            [ 1] 1789 	ld a,#17 
      008AF7 6B 03            [ 1] 1790 	ld (CNTR,sp),a
      008AF9                       1791 1$:
      008AF9 13 01            [ 2] 1792 	cpw x,(DIVISOR,sp)
      008AFB 2B 03            [ 1] 1793 	jrmi 2$
      008AFD 72 F0 01         [ 2] 1794 	subw x,(DIVISOR,sp)
      008B00 8C               [ 1] 1795 2$:	ccf 
      008B01 90 59            [ 2] 1796 	rlcw y 
      008B03 59               [ 2] 1797 	rlcw x 
      008B04 0A 03            [ 1] 1798 	dec (CNTR,sp)
      008B06 26 F1            [ 1] 1799 	jrne 1$
      008B08 51               [ 1] 1800 	exgw x,y 
      000A89                       1801 	_drop VSIZE 
      008B09 5B 03            [ 2]    1     addw sp,#VSIZE 
      008B0B 81               [ 4] 1802 	ret
                                   1803 
                                   1804 ;-----------------------------
                                   1805 ; negate double int.
                                   1806 ; input:
                                   1807 ;   x     bits 15..0
                                   1808 ;   y     bits 31..16
                                   1809 ; output: 
                                   1810 ;   x     bits 15..0
                                   1811 ;   y     bits 31..16
                                   1812 ;-----------------------------
      008B0C                       1813 dneg:
      008B0C 53               [ 2] 1814 	cplw x 
      008B0D 90 53            [ 2] 1815 	cplw y 
      008B0F 1C 00 01         [ 2] 1816 	addw x,#1 
      008B12 24 02            [ 1] 1817 	jrnc 1$
      008B14 90 5C            [ 1] 1818 	incw y 
      008B16 81               [ 4] 1819 1$: ret 
                                   1820 
                                   1821 
                                   1822 ;--------------------------------
                                   1823 ; sign extend single to double
                                   1824 ; input:
                                   1825 ;   x    int16_t
                                   1826 ; output:
                                   1827 ;   x    int32_t bits 15..0
                                   1828 ;   y    int32_t bits 31..16
                                   1829 ;--------------------------------
      008B17                       1830 dbl_sign_extend:
      008B17 90 5F            [ 1] 1831 	clrw y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B19 9E               [ 1] 1832 	ld a,xh 
      008B1A A4 80            [ 1] 1833 	and a,#0x80 
      008B1C 27 02            [ 1] 1834 	jreq 1$
      008B1E 90 53            [ 2] 1835 	cplw y
      008B20 81               [ 4] 1836 1$: ret 	
                                   1837 
                                   1838 
                                   1839 ;----------------------------------
                                   1840 ;  euclidian divide dbl/n1 
                                   1841 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   1842 ; input:
                                   1843 ;    dbl    int32_t on stack 
                                   1844 ;    x 		n1   int16_t  disivor  
                                   1845 ; output:
                                   1846 ;    X      dbl/x  int16_t 
                                   1847 ;    Y      remainder int16_t 
                                   1848 ;----------------------------------
                           000008  1849 	VSIZE=8
      008B21                       1850 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000AA1                       1851 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000AA1                       1852 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   1853 	; local variables
                           000001  1854 	DBLHI=1
                           000003  1855 	DBLLO=3 
                           000005  1856 	SDIVSR=5 ; sign divisor
                           000006  1857 	SQUOT=6 ; sign dividend 
                           000007  1858 	DIVISR=7 ; divisor 
      000AA1                       1859 div32_16:
      000AA1                       1860 	_vars VSIZE 
      008B21 52 08            [ 2]    1     sub sp,#VSIZE 
      008B23 0F 05            [ 1] 1861 	clr (SDIVSR,sp)
      008B25 0F 06            [ 1] 1862 	clr (SQUOT,sp)
                                   1863 ; copy arguments 
      008B27 16 0B            [ 2] 1864 	ldw y,(DIVDNDHI,sp)
      008B29 17 01            [ 2] 1865 	ldw (DBLHI,sp),y
      008B2B 16 0D            [ 2] 1866 	ldw y,(DIVDNDLO,sp)
      008B2D 17 03            [ 2] 1867 	ldw (DBLLO,sp),y 
                                   1868 ; check for 0 divisor
      008B2F 5D               [ 2] 1869 	tnzw x 
      008B30 26 05            [ 1] 1870     jrne 0$
      008B32 A6 04            [ 1] 1871 	ld a,#ERR_DIV0 
      008B34 CC 87 69         [ 2] 1872 	jp tb_error 
                                   1873 ; check divisor sign 	
      008B37 9E               [ 1] 1874 0$:	ld a,xh 
      008B38 A4 80            [ 1] 1875 	and a,#0x80 
      008B3A 27 05            [ 1] 1876 	jreq 1$
      008B3C 03 05            [ 1] 1877 	cpl (SDIVSR,sp)
      008B3E 03 06            [ 1] 1878 	cpl (SQUOT,sp)
      008B40 50               [ 2] 1879 	negw x
      008B41 1F 07            [ 2] 1880 1$:	ldw (DIVISR,sp),x
                                   1881 ; check dividend sign 	 
      008B43 7B 01            [ 1] 1882  	ld a,(DBLHI,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B45 A4 80            [ 1] 1883 	and a,#0x80 
      008B47 27 0D            [ 1] 1884 	jreq 2$ 
      008B49 03 06            [ 1] 1885 	cpl (SQUOT,sp)
      008B4B 1E 03            [ 2] 1886 	ldw x,(DBLLO,sp)
      008B4D 16 01            [ 2] 1887 	ldw y,(DBLHI,sp)
      008B4F CD 8B 0C         [ 4] 1888 	call dneg 
      008B52 1F 03            [ 2] 1889 	ldw (DBLLO,sp),x 
      008B54 17 01            [ 2] 1890 	ldw (DBLHI,sp),y 
      008B56 1E 07            [ 2] 1891 2$:	ldw x,(DIVISR,sp)
      008B58 CD 8A E2         [ 4] 1892 	call udiv32_16
      008B5B 90 5D            [ 2] 1893 	tnzw y 
      008B5D 27 11            [ 1] 1894 	jreq 3$ 
                                   1895 ; x=quotient 
                                   1896 ; y=remainder 
                                   1897 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008B5F 7B 06            [ 1] 1898 	ld a,(SQUOT,sp)
      008B61 18 05            [ 1] 1899 	xor a,(SDIVSR,sp)
      008B63 27 0B            [ 1] 1900 	jreq 3$
      008B65 5C               [ 1] 1901 	incw x 
      008B66 90 CF 00 0D      [ 2] 1902 	ldw acc16,y 
      008B6A 16 07            [ 2] 1903 	ldw y,(DIVISR,sp)
      008B6C 72 B2 00 0D      [ 2] 1904 	subw y,acc16
                                   1905 ; sign quotient
      008B70 7B 06            [ 1] 1906 3$:	ld a,(SQUOT,sp)
      008B72 27 01            [ 1] 1907 	jreq 4$
      008B74 50               [ 2] 1908 	negw x 
      008B75                       1909 4$:	
      000AF5                       1910 	_drop VSIZE 
      008B75 5B 08            [ 2]    1     addw sp,#VSIZE 
      008B77 81               [ 4] 1911 	ret 
                                   1912 
                                   1913 
                                   1914 
                                   1915 ;----------------------------------
                                   1916 ; division x/y 
                                   1917 ; input:
                                   1918 ;    X       dividend
                                   1919 ;    Y       divisor 
                                   1920 ; output:
                                   1921 ;    X       quotient
                                   1922 ;    Y       remainder 
                                   1923 ;-----------------------------------
                           000004  1924 	VSIZE=4 
                                   1925 	; local variables 
                           000001  1926 	DBLHI=1
                           000003  1927 	DBLLO=3
      008B78                       1928 divide: 
      000AF8                       1929 	_vars VSIZE 
      008B78 52 04            [ 2]    1     sub sp,#VSIZE 
      008B7A 90 CF 00 0D      [ 2] 1930 	ldw acc16,y
      008B7E CD 8B 17         [ 4] 1931 	call dbl_sign_extend
      008B81 1F 03            [ 2] 1932 	ldw (DBLLO,sp),x 
      008B83 17 01            [ 2] 1933 	ldw (DBLHI,sp),y 
      008B85 CE 00 0D         [ 2] 1934 	ldw x,acc16 
      008B88 CD 8B 21         [ 4] 1935 	call div32_16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      000B0B                       1936 	_drop VSIZE 
      008B8B 5B 04            [ 2]    1     addw sp,#VSIZE 
      008B8D 81               [ 4] 1937 	ret
                                   1938 
                                   1939 
                                   1940 ;----------------------------------
                                   1941 ;  remainder resulting from euclidian 
                                   1942 ;  division of x/y 
                                   1943 ; input:
                                   1944 ;   x   	dividend int16_t 
                                   1945 ;   y 		divisor int16_t
                                   1946 ; output:
                                   1947 ;   X       n1%n2 
                                   1948 ;----------------------------------
      008B8E                       1949 modulo:
      008B8E CD 8B 78         [ 4] 1950 	call divide
      008B91 93               [ 1] 1951 	ldw x,y 
      008B92 81               [ 4] 1952 	ret 
                                   1953 
                                   1954 ;----------------------------------
                                   1955 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   1956 ; return expr1*expr2/expr3 
                                   1957 ; product result is int32_t and 
                                   1958 ; divisiont is int32_t/int16_t
                                   1959 ;----------------------------------
                           000004  1960 	DBL_SIZE=4 
      008B93                       1961 muldiv:
      008B93 CD 8C 09         [ 4] 1962 	call func_args 
      008B96 A1 03            [ 1] 1963 	cp a,#3 
      008B98 27 03            [ 1] 1964 	jreq 1$
      008B9A CC 87 67         [ 2] 1965 	jp syntax_error
      008B9D                       1966 1$: 
      008B9D 1E 05            [ 2] 1967 	ldw x,(5,sp) ; expr1
      008B9F 16 03            [ 2] 1968 	ldw y,(3,sp) ; expr2
      008BA1 CD 8A BF         [ 4] 1969 	call multiply 
      008BA4 1F 05            [ 2] 1970 	ldw (5,sp),x  ;int32_t 15..0
      008BA6 17 03            [ 2] 1971 	ldw (3,sp),y  ;int32_t 31..16
      008BA8 85               [ 2] 1972 	popw x        ; expr3 
      008BA9 CD 8B 21         [ 4] 1973 	call div32_16 ; int32_t/expr3 
      000B2C                       1974 	_drop DBL_SIZE
      008BAC 5B 04            [ 2]    1     addw sp,#DBL_SIZE 
      008BAE 81               [ 4] 1975 	ret 
                                   1976 
                                   1977 
                                   1978 ;---------------------------------
                                   1979 ; dictionary search 
                                   1980 ; input:
                                   1981 ;	X 		dictionary entry point, name field  
                                   1982 ;   y		.asciz name to search 
                                   1983 ; output:
                                   1984 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   1985 ;  X		cmd_index
                                   1986 ;---------------------------------
                           000001  1987 	NLEN=1 ; cmd length 
                           000002  1988 	XSAVE=2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                           000004  1989 	YSAVE=4
                           000005  1990 	VSIZE=5 
      008BAF                       1991 search_dict::
      000B2F                       1992 	_vars VSIZE 
      008BAF 52 05            [ 2]    1     sub sp,#VSIZE 
                                   1993 
      008BB1 17 04            [ 2] 1994 	ldw (YSAVE,sp),y 
      008BB3                       1995 search_next:
      008BB3 1F 02            [ 2] 1996 	ldw (XSAVE,sp),x 
                                   1997 ; get name length in dictionary	
      008BB5 F6               [ 1] 1998 	ld a,(x)
      008BB6 A4 0F            [ 1] 1999 	and a,#0xf 
      008BB8 6B 01            [ 1] 2000 	ld (NLEN,sp),a  
      008BBA 16 04            [ 2] 2001 	ldw y,(YSAVE,sp) ; name pointer 
      008BBC 5C               [ 1] 2002 	incw x 
      008BBD                       2003 cp_loop:
      008BBD 90 F6            [ 1] 2004 	ld a,(y)
      008BBF 27 1B            [ 1] 2005 	jreq str_match 
      008BC1 0D 01            [ 1] 2006 	tnz (NLEN,sp)
      008BC3 27 0A            [ 1] 2007 	jreq no_match  
      008BC5 F1               [ 1] 2008 	cp a,(x)
      008BC6 26 07            [ 1] 2009 	jrne no_match 
      008BC8 90 5C            [ 1] 2010 	incw y 
      008BCA 5C               [ 1] 2011 	incw x
      008BCB 0A 01            [ 1] 2012 	dec (NLEN,sp)
      008BCD 20 EE            [ 2] 2013 	jra cp_loop 
      008BCF                       2014 no_match:
      008BCF 1E 02            [ 2] 2015 	ldw x,(XSAVE,sp) 
      008BD1 1D 00 02         [ 2] 2016 	subw x,#2 ; move X to link field
      008BD4 4B 00            [ 1] 2017 	push #TK_NONE 
      008BD6 FE               [ 2] 2018 	ldw x,(x) ; next word link 
      008BD7 84               [ 1] 2019 	pop a ; TK_NONE 
      008BD8 27 1F            [ 1] 2020 	jreq search_exit  ; not found  
                                   2021 ;try next 
      008BDA 20 D7            [ 2] 2022 	jra search_next
      008BDC                       2023 str_match:
      008BDC 1E 02            [ 2] 2024 	ldw x,(XSAVE,sp)
      008BDE F6               [ 1] 2025 	ld a,(X)
      008BDF 6B 01            [ 1] 2026 	ld (NLEN,sp),a ; needed to test keyword type  
      008BE1 A4 0F            [ 1] 2027 	and a,#0xf 
                                   2028 ; move x to procedure address field 	
      008BE3 4C               [ 1] 2029 	inc a 
      008BE4 C7 00 0E         [ 1] 2030 	ld acc8,a 
      008BE7 72 5F 00 0D      [ 1] 2031 	clr acc16 
      008BEB 72 BB 00 0D      [ 2] 2032 	addw x,acc16 
      008BEF FE               [ 2] 2033 	ldw x,(x) ; routine index  
                                   2034 ;determine keyword type bits 7:6 
      008BF0 7B 01            [ 1] 2035 	ld a,(NLEN,sp)
      008BF2 4E               [ 1] 2036 	swap a 
      008BF3 A4 0C            [ 1] 2037 	and a,#0xc
      008BF5 44               [ 1] 2038 	srl a
      008BF6 44               [ 1] 2039 	srl a 
      008BF7 AB 80            [ 1] 2040 	add a,#128
      008BF9                       2041 search_exit: 
      000B79                       2042 	_drop VSIZE 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008BF9 5B 05            [ 2]    1     addw sp,#VSIZE 
      008BFB 81               [ 4] 2043 	ret 
                                   2044 
                                   2045 ;---------------------
                                   2046 ; check if next token
                                   2047 ;  is of expected type 
                                   2048 ; input:
                                   2049 ;   A 		 expected token attribute
                                   2050 ;  ouput:
                                   2051 ;   none     if fail call syntax_error 
                                   2052 ;--------------------
      008BFC                       2053 expect:
      008BFC 88               [ 1] 2054 	push a 
      008BFD CD 88 56         [ 4] 2055 	call next_token 
      008C00 11 01            [ 1] 2056 	cp a,(1,sp)
      008C02 27 03            [ 1] 2057 	jreq 1$
      008C04 CC 87 67         [ 2] 2058 	jp syntax_error
      008C07 84               [ 1] 2059 1$: pop a 
      008C08 81               [ 4] 2060 	ret 
                                   2061 
                                   2062 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2063 ; parse arguments list 
                                   2064 ; between ()
                                   2065 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      008C09                       2066 func_args:
      008C09 A6 07            [ 1] 2067 	ld a,#TK_LPAREN 
      008C0B CD 8B FC         [ 4] 2068 	call expect 
                                   2069 ; expected to continue in arg_list 
                                   2070 ; caller must check for TK_RPAREN 
                                   2071 
                                   2072 ;-------------------------------
                                   2073 ; parse embedded BASIC routines 
                                   2074 ; arguments list.
                                   2075 ; arg_list::=  rel[','rel]*
                                   2076 ; all arguments are of integer type
                                   2077 ; and pushed on stack 
                                   2078 ; input:
                                   2079 ;   none
                                   2080 ; output:
                                   2081 ;   stack{n}   arguments pushed on stack
                                   2082 ;   A 	number of arguments pushed on stack  
                                   2083 ;--------------------------------
      008C0E                       2084 arg_list:
      008C0E 4B 00            [ 1] 2085 	push #0  
      008C10 CD 8D 56         [ 4] 2086 1$: call relation
      008C13 A1 00            [ 1] 2087 	cp a,#TK_NONE 
      008C15 27 20            [ 1] 2088 	jreq 5$
      008C17 A1 84            [ 1] 2089 	cp a,#TK_INTGR
      008C19 26 13            [ 1] 2090 	jrne 4$
      008C1B                       2091 3$: 
                                   2092 ; swap return address with argument
      008C1B 84               [ 1] 2093 	pop a ; arg_count
      008C1C 90 85            [ 2] 2094 	popw y ; return address 
      008C1E 89               [ 2] 2095 	pushw x ; new argument 
      008C1F 90 89            [ 2] 2096 	pushw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C21 4C               [ 1] 2097     inc a
      008C22 88               [ 1] 2098 	push a 
      008C23 CD 88 56         [ 4] 2099 	call next_token 
      008C26 A1 09            [ 1] 2100 	cp a,#TK_COMMA 
      008C28 27 E6            [ 1] 2101 	jreq 1$ 
      008C2A A1 00            [ 1] 2102 	cp a,#TK_NONE 
      008C2C 27 09            [ 1] 2103 	jreq 5$ 
      008C2E A1 08            [ 1] 2104 4$:	cp a,#TK_RPAREN 
      008C30 27 05            [ 1] 2105 	jreq 5$
      000BB2                       2106 	_unget_token 
      008C32 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      008C37 84               [ 1] 2107 5$:	pop a  
      008C38 81               [ 4] 2108 	ret 
                                   2109 
                                   2110 ;--------------------------------
                                   2111 ;   BASIC commnands 
                                   2112 ;--------------------------------
                                   2113 
                                   2114 ;--------------------------------
                                   2115 ;  arithmetic and relational 
                                   2116 ;  routines
                                   2117 ;  operators precedence
                                   2118 ;  highest to lowest
                                   2119 ;  operators on same row have 
                                   2120 ;  same precedence and are executed
                                   2121 ;  from left to right.
                                   2122 ;	'*','/','%'
                                   2123 ;   '-','+'
                                   2124 ;   '=','>','<','>=','<=','<>','><'
                                   2125 ;   '<>' and '><' are equivalent for not equal.
                                   2126 ;--------------------------------
                                   2127 
                                   2128 ;---------------------
                                   2129 ; return array element
                                   2130 ; address from @(expr)
                                   2131 ; input:
                                   2132 ;   A 		TK_ARRAY
                                   2133 ; output:
                                   2134 ;   A 		TK_INTGR
                                   2135 ;	X 		element address 
                                   2136 ;----------------------
      008C39                       2137 get_array_element:
      008C39 CD 8C 09         [ 4] 2138 	call func_args 
      008C3C A1 01            [ 1] 2139 	cp a,#1
      008C3E 27 03            [ 1] 2140 	jreq 1$
      008C40 CC 87 67         [ 2] 2141 	jp syntax_error
      008C43 85               [ 2] 2142 1$: popw x 
                                   2143 	; check for bounds 
      008C44 C3 00 1F         [ 2] 2144 	cpw x,array_size 
      008C47 23 05            [ 2] 2145 	jrule 3$
                                   2146 ; bounds {1..array_size}	
      008C49 A6 0A            [ 1] 2147 2$: ld a,#ERR_BAD_VALUE 
      008C4B CC 87 69         [ 2] 2148 	jp tb_error 
      008C4E 5D               [ 2] 2149 3$: tnzw  x
      008C4F 27 F8            [ 1] 2150 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008C51 58               [ 2] 2151 	sllw x 
      008C52 89               [ 2] 2152 	pushw x 
      008C53 AE 16 90         [ 2] 2153 	ldw x,#tib
      008C56 72 F0 01         [ 2] 2154 	subw x,(1,sp)
      000BD9                       2155 	_drop 2   
      008C59 5B 02            [ 2]    1     addw sp,#2 
      008C5B A6 84            [ 1] 2156 	ld a,#TK_INTGR
      008C5D 81               [ 4] 2157 	ret 
                                   2158 
                                   2159 
                                   2160 ;***********************************
                                   2161 ;   expression parse,execute 
                                   2162 ;***********************************
                                   2163 ;-----------------------------------
                                   2164 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2165 ;			 integer | function |
                                   2166 ;			 '('relation')' 
                                   2167 ; output:
                                   2168 ;   A    token attribute 
                                   2169 ;   X 	 integer
                                   2170 ; ---------------------------------
                           000001  2171 	NEG=1
                           000001  2172 	VSIZE=1
      008C5E                       2173 factor:
      000BDE                       2174 	_vars VSIZE 
      008C5E 52 01            [ 2]    1     sub sp,#VSIZE 
      008C60 CD 88 56         [ 4] 2175 	call next_token
      008C63 A1 02            [ 1] 2176 	cp a,#CMD_END  
      008C65 25 3D            [ 1] 2177 	jrult 16$
      008C67 6B 01            [ 1] 2178 1$:	ld (NEG,sp),a 
      008C69 A4 30            [ 1] 2179 	and a,#TK_GRP_MASK
      008C6B A1 10            [ 1] 2180 	cp a,#TK_GRP_ADD 
      008C6D 27 04            [ 1] 2181 	jreq 2$
      008C6F 7B 01            [ 1] 2182 	ld a,(NEG,sp)
      008C71 20 03            [ 2] 2183 	jra 4$  
      008C73                       2184 2$:	
      008C73 CD 88 56         [ 4] 2185 	call next_token 
      008C76                       2186 4$:	
      008C76 A1 81            [ 1] 2187 	cp a,#TK_IFUNC 
      008C78 26 03            [ 1] 2188 	jrne 5$ 
      008C7A FD               [ 4] 2189 	call (x) 
      008C7B 20 32            [ 2] 2190 	jra 18$ 
      008C7D                       2191 5$:
      008C7D A1 84            [ 1] 2192 	cp a,#TK_INTGR
      008C7F 26 02            [ 1] 2193 	jrne 6$
      008C81 20 2C            [ 2] 2194 	jra 18$
      008C83                       2195 6$:
      008C83 A1 06            [ 1] 2196 	cp a,#TK_ARRAY
      008C85 26 06            [ 1] 2197 	jrne 10$
      008C87 CD 8C 39         [ 4] 2198 	call get_array_element
      008C8A FE               [ 2] 2199 	ldw x,(x)
      008C8B 20 22            [ 2] 2200 	jra 18$ 
      008C8D                       2201 10$:
      008C8D A1 85            [ 1] 2202 	cp a,#TK_VAR 
      008C8F 26 03            [ 1] 2203 	jrne 12$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008C91 FE               [ 2] 2204 	ldw x,(x)
      008C92 20 1B            [ 2] 2205 	jra 18$
      008C94                       2206 12$:			
      008C94 A1 07            [ 1] 2207 	cp a,#TK_LPAREN
      008C96 26 0C            [ 1] 2208 	jrne 16$
      008C98 CD 8D 56         [ 4] 2209 	call relation
      008C9B 89               [ 2] 2210 	pushw x 
      008C9C A6 08            [ 1] 2211 	ld a,#TK_RPAREN 
      008C9E CD 8B FC         [ 4] 2212 	call expect
      008CA1 85               [ 2] 2213 	popw x 
      008CA2 20 0B            [ 2] 2214 	jra 18$	
      008CA4                       2215 16$:
      008CA4 4D               [ 1] 2216 	tnz a 
      008CA5 27 11            [ 1] 2217 	jreq 20$ 
      000C27                       2218 	_unget_token
      008CA7 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      008CAC 4F               [ 1] 2219 	clr a 
      008CAD 20 09            [ 2] 2220 	jra 20$ 
      008CAF                       2221 18$: 
      008CAF A6 11            [ 1] 2222 	ld a,#TK_MINUS 
      008CB1 11 01            [ 1] 2223 	cp a,(NEG,sp)
      008CB3 26 01            [ 1] 2224 	jrne 19$
      008CB5 50               [ 2] 2225 	negw x
      008CB6                       2226 19$:
      008CB6 A6 84            [ 1] 2227 	ld a,#TK_INTGR
      008CB8                       2228 20$:
      000C38                       2229 	_drop VSIZE
      008CB8 5B 01            [ 2]    1     addw sp,#VSIZE 
      008CBA 81               [ 4] 2230 	ret
                                   2231 
                                   2232 ;-----------------------------------
                                   2233 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   2234 ; output:
                                   2235 ;   A    	token attribute 
                                   2236 ;	X		integer
                                   2237 ;-----------------------------------
                           000001  2238 	N1=1   ; int16_t
                           000003  2239 	MULOP=3
                           000003  2240 	VSIZE=3
      008CBB                       2241 term:
      000C3B                       2242 	_vars VSIZE
      008CBB 52 03            [ 2]    1     sub sp,#VSIZE 
      008CBD CD 8C 5E         [ 4] 2243 	call factor
      008CC0 4D               [ 1] 2244 	tnz a 
      008CC1 27 47            [ 1] 2245 	jreq term_exit 
      008CC3                       2246 term01:	 ; check for  operator 
      008CC3 1F 01            [ 2] 2247 	ldw (N1,sp),x  ; save first factor 
      008CC5 CD 88 56         [ 4] 2248 	call next_token
      008CC8 6B 03            [ 1] 2249 	ld (MULOP,sp),a
      008CCA A1 02            [ 1] 2250 	cp a,#CMD_END
      008CCC 25 2F            [ 1] 2251 	jrult 8$
      008CCE A4 30            [ 1] 2252 	and a,#TK_GRP_MASK
      008CD0 A1 20            [ 1] 2253 	cp a,#TK_GRP_MULT
      008CD2 27 02            [ 1] 2254 	jreq 1$
      008CD4 20 27            [ 2] 2255 	jra 8$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008CD6                       2256 1$:	; got *|/|%
      008CD6 CD 8C 5E         [ 4] 2257 	call factor
      008CD9 A1 84            [ 1] 2258 	cp a,#TK_INTGR
      008CDB 27 03            [ 1] 2259 	jreq 2$
      008CDD CC 87 67         [ 2] 2260 	jp syntax_error
      008CE0 90 93            [ 1] 2261 2$:	ldw y,x 
      008CE2 1E 01            [ 2] 2262 	ldw x,(N1,sp)
      008CE4 7B 03            [ 1] 2263 	ld a,(MULOP,sp) 
      008CE6 A1 20            [ 1] 2264 	cp a,#TK_MULT 
      008CE8 26 05            [ 1] 2265 	jrne 3$
      008CEA CD 8A BF         [ 4] 2266 	call multiply 
      008CED 20 D4            [ 2] 2267 	jra term01
      008CEF A1 21            [ 1] 2268 3$: cp a,#TK_DIV 
      008CF1 26 05            [ 1] 2269 	jrne 4$ 
      008CF3 CD 8B 78         [ 4] 2270 	call divide 
      008CF6 20 CB            [ 2] 2271 	jra term01 
      008CF8 CD 8B 8E         [ 4] 2272 4$: call modulo
      008CFB 20 C6            [ 2] 2273 	jra term01 
      008CFD 7B 03            [ 1] 2274 8$: ld a,(MULOP,sp)
      008CFF 27 05            [ 1] 2275 	jreq 9$ 
      000C81                       2276 	_unget_token
      008D01 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      008D06 1E 01            [ 2] 2277 9$: ldw x,(N1,sp)
      008D08 A6 84            [ 1] 2278 	ld a,#TK_INTGR 	
      008D0A                       2279 term_exit:
      000C8A                       2280 	_drop VSIZE 
      008D0A 5B 03            [ 2]    1     addw sp,#VSIZE 
      008D0C 81               [ 4] 2281 	ret 
                                   2282 
                                   2283 ;-------------------------------
                                   2284 ;  expr ::= term [['+'|'-'] term]*
                                   2285 ;  result range {-32768..32767}
                                   2286 ;  output:
                                   2287 ;   A    token attribute 
                                   2288 ;   X	 integer   
                                   2289 ;-------------------------------
                           000001  2290 	N1=1
                           000003  2291 	N2=3 
                           000005  2292 	OP=5 
                           000005  2293 	VSIZE=5 
      008D0D                       2294 expression:
      000C8D                       2295 	_vars VSIZE 
      008D0D 52 05            [ 2]    1     sub sp,#VSIZE 
      008D0F CD 8C BB         [ 4] 2296 	call term
      008D12 4D               [ 1] 2297 	tnz a 
      008D13 27 3E            [ 1] 2298 	jreq expr_exit 
      008D15 1F 01            [ 2] 2299 1$:	ldw (N1,sp),x 
      008D17 CD 88 56         [ 4] 2300 	call next_token
      008D1A 6B 05            [ 1] 2301 	ld (OP,sp),a 
      008D1C A1 02            [ 1] 2302 	cp a,#CMD_END 
      008D1E 25 26            [ 1] 2303 	jrult 8$ 
      008D20 A4 30            [ 1] 2304 	and a,#TK_GRP_MASK
      008D22 A1 10            [ 1] 2305 	cp a,#TK_GRP_ADD 
      008D24 27 02            [ 1] 2306 	jreq 2$ 
      008D26 20 1E            [ 2] 2307 	jra 8$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008D28                       2308 2$: 
      008D28 CD 8C BB         [ 4] 2309 	call term
      008D2B A1 84            [ 1] 2310 	cp a,#TK_INTGR
      008D2D 27 03            [ 1] 2311 	jreq 3$
      008D2F CC 87 67         [ 2] 2312 	jp syntax_error
      008D32 1F 03            [ 2] 2313 3$:	ldw (N2,sp),x 
      008D34 1E 01            [ 2] 2314 	ldw x,(N1,sp)
      008D36 7B 05            [ 1] 2315 	ld a,(OP,sp)
      008D38 A1 10            [ 1] 2316 	cp a,#TK_PLUS 
      008D3A 26 05            [ 1] 2317 	jrne 4$
      008D3C 72 FB 03         [ 2] 2318 	addw x,(N2,sp)
      008D3F 20 D4            [ 2] 2319 	jra 1$ 
      008D41 72 F0 03         [ 2] 2320 4$:	subw x,(N2,sp)
      008D44 20 CF            [ 2] 2321 	jra 1$
      008D46 7B 05            [ 1] 2322 8$: ld a,(OP,sp)
      008D48 27 05            [ 1] 2323 	jreq 9$ 
      000CCA                       2324 	_unget_token	
      008D4A 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      008D4F 1E 01            [ 2] 2325 9$: ldw x,(N1,sp)
      008D51 A6 84            [ 1] 2326 	ld a,#TK_INTGR	
      008D53                       2327 expr_exit:
      000CD3                       2328 	_drop VSIZE 
      008D53 5B 05            [ 2]    1     addw sp,#VSIZE 
      008D55 81               [ 4] 2329 	ret 
                                   2330 
                                   2331 ;---------------------------------------------
                                   2332 ; rel ::= expr rel_op expr
                                   2333 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   2334 ;  relation return  integer , zero is false 
                                   2335 ;  output:
                                   2336 ;    A 		token attribute  
                                   2337 ;	 X		integer 
                                   2338 ;---------------------------------------------
                           000001  2339 	N1=1
                           000003  2340 	RELOP=3
                           000003  2341 	VSIZE=3 
      008D56                       2342 relation: 
      000CD6                       2343 	_vars VSIZE
      008D56 52 03            [ 2]    1     sub sp,#VSIZE 
      008D58 CD 8D 0D         [ 4] 2344 	call expression
      008D5B 4D               [ 1] 2345 	tnz a 
      008D5C 27 4D            [ 1] 2346 	jreq rel_exit
      008D5E 1F 01            [ 2] 2347 	ldw (N1,sp),x 
                                   2348 ; expect rel_op or leave 
      008D60 CD 88 56         [ 4] 2349 	call next_token 
      008D63 6B 03            [ 1] 2350 	ld (RELOP,sp),a 
      008D65 A4 30            [ 1] 2351 	and a,#TK_GRP_MASK
      008D67 A1 30            [ 1] 2352 	cp a,#TK_GRP_RELOP 
      008D69 26 33            [ 1] 2353 	jrne 8$
      008D6B                       2354 2$:	; expect another expression
      008D6B CD 8D 0D         [ 4] 2355 	call expression
      008D6E A1 84            [ 1] 2356 	cp a,#TK_INTGR
      008D70 27 03            [ 1] 2357 	jreq 3$
      008D72 CC 87 67         [ 2] 2358 	jp syntax_error 
      008D75 CF 00 0D         [ 2] 2359 3$:	ldw acc16,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008D78 1E 01            [ 2] 2360 	ldw x,(N1,sp) 
      008D7A 72 B0 00 0D      [ 2] 2361 	subw x,acc16
      008D7E 26 06            [ 1] 2362 	jrne 4$
      008D80 35 02 00 0E      [ 1] 2363 	mov acc8,#2 ; n1==n2
      008D84 20 0C            [ 2] 2364 	jra 6$ 
      008D86                       2365 4$: 
      008D86 2C 06            [ 1] 2366 	jrsgt 5$  
      008D88 35 04 00 0E      [ 1] 2367 	mov acc8,#4 ; n1<2 
      008D8C 20 04            [ 2] 2368 	jra 6$
      008D8E                       2369 5$:
      008D8E 35 01 00 0E      [ 1] 2370 	mov acc8,#1 ; n1>n2 
      008D92                       2371 6$:
      008D92 5F               [ 1] 2372 	clrw x 
      008D93 C6 00 0E         [ 1] 2373 	ld a, acc8  
      008D96 14 03            [ 1] 2374 	and a,(RELOP,sp)
      008D98 4D               [ 1] 2375 	tnz a 
      008D99 27 0E            [ 1] 2376 	jreq 10$
      008D9B 5C               [ 1] 2377 	incw x 
      008D9C 20 0B            [ 2] 2378 	jra 10$  	
      008D9E 7B 03            [ 1] 2379 8$: ld a,(RELOP,sp)
      008DA0 27 05            [ 1] 2380 	jreq 9$
      000D22                       2381 	_unget_token
      008DA2 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      008DA7                       2382 9$: 
      008DA7 1E 01            [ 2] 2383 	ldw x,(N1,sp)
      008DA9                       2384 10$:
      008DA9 A6 84            [ 1] 2385 	ld a,#TK_INTGR
      008DAB                       2386 rel_exit:
      000D2B                       2387 	_drop VSIZE
      008DAB 5B 03            [ 2]    1     addw sp,#VSIZE 
      008DAD 81               [ 4] 2388 	ret 
                                   2389 
                                   2390 ;--------------------------------
                                   2391 ; BASIC: SHOW 
                                   2392 ; print stack content in hexadecimal bytes 
                                   2393 ; 16 bytes per row 
                                   2394 ;--------------------------------
      008DAE                       2395 show:
      008DAE AE 8D C8         [ 2] 2396 	ldw x,#cstk_prompt
      008DB1 CD 9F 60         [ 4] 2397 	call puts 
      008DB4 96               [ 1] 2398 	ldw x,sp 
      008DB5 1C 00 03         [ 2] 2399 	addw x,#3 ; ignore return address
      008DB8 90 AE 18 00      [ 2] 2400 	ldw y,#RAM_SIZE  
      008DBC CF 00 0D         [ 2] 2401 	ldw acc16,x 
      008DBF 72 B2 00 0D      [ 2] 2402 	subw y,acc16
      008DC3 CD 83 CF         [ 4] 2403 	call hex_dump
      008DC6 4F               [ 1] 2404 	clr a 
      008DC7 81               [ 4] 2405 	ret
                                   2406 
      008DC8 0A 63 6F 6E 74 65 6E  2407 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2408 
                                   2409 
                                   2410 ;--------------------------------------------
                                   2411 ; BASIC: HEX 
                                   2412 ; select hexadecimal base for integer print
                                   2413 ;---------------------------------------------
      008DEF                       2414 hex_base:
      008DEF 35 10 00 0B      [ 1] 2415 	mov base,#16 
      008DF3 81               [ 4] 2416 	ret 
                                   2417 
                                   2418 ;--------------------------------------------
                                   2419 ; BASIC: DEC 
                                   2420 ; select decimal base for integer print
                                   2421 ;---------------------------------------------
      008DF4                       2422 dec_base:
      008DF4 35 0A 00 0B      [ 1] 2423 	mov base,#10
      008DF8 81               [ 4] 2424 	ret 
                                   2425 
                                   2426 ;------------------------
                                   2427 ; BASIC: FREE 
                                   2428 ; return free size in text area
                                   2429 ; output:
                                   2430 ;   A 		TK_INTGR
                                   2431 ;   X 	    size integer
                                   2432 ;--------------------------
      008DF9                       2433 free:
      008DF9 CE 00 1A         [ 2] 2434 	ldw x,txtbgn 
      008DFC C3 9F 00         [ 2] 2435 	cpw x,app_space
      008DFF 25 16            [ 1] 2436 	jrult 1$
      008E01 AE FF FF         [ 2] 2437 	ldw x,#0xffff 
      008E04 90 AE 9F 04      [ 2] 2438 	ldw y,#app
      008E08 72 B9 9F 02      [ 2] 2439 	addw y,app_size
      008E0C 90 CF 00 0D      [ 2] 2440 	ldw acc16,y 
      008E10 72 B0 00 0D      [ 2] 2441 	subw x,acc16 
      008E14 5C               [ 1] 2442 	incw x 
      008E15 20 07            [ 2] 2443 	jra 2$ 
      008E17 AE 16 90         [ 2] 2444 1$:	ldw x,#tib 
      008E1A 72 B0 00 1C      [ 2] 2445 	subw x,txtend 
      008E1E A6 84            [ 1] 2446 2$:	ld a,#TK_INTGR
      008E20 81               [ 4] 2447 	ret 
                                   2448 
                                   2449 
                                   2450 ;------------------------
                                   2451 ; BASIC: UBOUND  
                                   2452 ; return array variable size 
                                   2453 ; output:
                                   2454 ;   A 		TK_INTGR
                                   2455 ;   X 	    array size 
                                   2456 ;--------------------------
      008E21                       2457 ubound:
      008E21 AE 16 90         [ 2] 2458 	ldw x,#tib
      008E24 72 B0 00 1C      [ 2] 2459 	subw x,txtend 
      008E28 90 CE 00 05      [ 2] 2460 	ldw y,basicptr 
      008E2C 90 C3 00 1C      [ 2] 2461 	cpw y,txtend 
      008E30 25 0A            [ 1] 2462 	jrult 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E32 3B 00 04         [ 1] 2463 	push count 
      008E35 4B 00            [ 1] 2464 	push #0 
      008E37 72 F0 01         [ 2] 2465 	subw x,(1,sp)
      000DBA                       2466 	_drop 2 
      008E3A 5B 02            [ 2]    1     addw sp,#2 
      008E3C 54               [ 2] 2467 1$:	srlw x 
      008E3D CF 00 1F         [ 2] 2468 	ldw array_size,x
      008E40 A6 84            [ 1] 2469 	ld a,#TK_INTGR
      008E42 81               [ 4] 2470 	ret 
                                   2471 
                                   2472 ;-----------------------------
                                   2473 ; BASIC: LET var=expr 
                                   2474 ; variable assignement 
                                   2475 ; output:
                                   2476 ;   A 		TK_NONE 
                                   2477 ;-----------------------------
      008E43                       2478 let::
      008E43 CD 88 56         [ 4] 2479 	call next_token 
      008E46 A1 85            [ 1] 2480 	cp a,#TK_VAR 
      008E48 27 0A            [ 1] 2481 	jreq let_var
      008E4A A1 06            [ 1] 2482 	cp a,#TK_ARRAY 
      008E4C 27 03            [ 1] 2483 	jreq  let_array
      008E4E CC 87 67         [ 2] 2484 	jp syntax_error
      008E51                       2485 let_array:
      008E51 CD 8C 39         [ 4] 2486 	call get_array_element
      008E54                       2487 let_var:
      008E54 89               [ 2] 2488 	pushw x  
      008E55 CD 88 56         [ 4] 2489 	call next_token 
      008E58 A1 32            [ 1] 2490 	cp a,#TK_EQUAL
      008E5A 27 03            [ 1] 2491 	jreq 1$
      008E5C CC 87 67         [ 2] 2492 	jp syntax_error
      008E5F                       2493 1$:	
      008E5F CD 8D 56         [ 4] 2494 	call relation   
      008E62 A1 84            [ 1] 2495 	cp a,#TK_INTGR 
      008E64 27 03            [ 1] 2496 	jreq 2$
      008E66 CC 87 67         [ 2] 2497 	jp syntax_error
      008E69                       2498 2$:	
      008E69 90 93            [ 1] 2499 	ldw y,x 
      008E6B 85               [ 2] 2500 	popw x   
      008E6C FF               [ 2] 2501 	ldw (x),y   
      008E6D 81               [ 4] 2502 	ret 
                                   2503 
                                   2504 ;----------------------------
                                   2505 ; BASIC: LIST [[start][,end]]
                                   2506 ; list program lines 
                                   2507 ; form start to end 
                                   2508 ; if empty argument list then 
                                   2509 ; list all.
                                   2510 ;----------------------------
                           000001  2511 	FIRST=1
                           000003  2512 	LAST=3 
                           000005  2513 	LN_PTR=5
                           000006  2514 	VSIZE=6 
      008E6E                       2515 list:
      008E6E CE 00 1A         [ 2] 2516 	ldw x,txtbgn 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008E71 C3 00 1C         [ 2] 2517 	cpw x,txtend 
      008E74 2B 01            [ 1] 2518 	jrmi 1$
      008E76 81               [ 4] 2519 	ret 
      008E77                       2520 1$:	
      000DF7                       2521 	_vars VSIZE
      008E77 52 06            [ 2]    1     sub sp,#VSIZE 
      008E79 1F 05            [ 2] 2522 	ldw (LN_PTR,sp),x 
      008E7B FE               [ 2] 2523 	ldw x,(x) 
      008E7C 1F 01            [ 2] 2524 	ldw (FIRST,sp),x ; list from first line 
      008E7E AE 7F FF         [ 2] 2525 	ldw x,#MAX_LINENO ; biggest line number 
      008E81 1F 03            [ 2] 2526 	ldw (LAST,sp),x 
      008E83 CD 8C 0E         [ 4] 2527 	call arg_list
      008E86 4D               [ 1] 2528 	tnz a
      008E87 27 31            [ 1] 2529 	jreq list_loop 
      008E89 A1 02            [ 1] 2530 	cp a,#2 
      008E8B 27 07            [ 1] 2531 	jreq 4$
      008E8D A1 01            [ 1] 2532 	cp a,#1 
      008E8F 27 06            [ 1] 2533 	jreq first_line 
      008E91 CC 87 67         [ 2] 2534 	jp syntax_error 
      008E94 85               [ 2] 2535 4$:	popw x 
      008E95 1F 05            [ 2] 2536 	ldw (LAST+2,sp),x 
      008E97                       2537 first_line:
      008E97 85               [ 2] 2538 	popw x
      008E98 1F 01            [ 2] 2539 	ldw (FIRST,sp),x 
      008E9A                       2540 lines_skip:
      008E9A CE 00 1A         [ 2] 2541 	ldw x,txtbgn
      008E9D 1F 05            [ 2] 2542 2$:	ldw (LN_PTR,sp),x 
      008E9F C3 00 1C         [ 2] 2543 	cpw x,txtend 
      008EA2 2A 38            [ 1] 2544 	jrpl list_exit 
      008EA4 FE               [ 2] 2545 	ldw x,(x) ;line# 
      008EA5 13 01            [ 2] 2546 	cpw x,(FIRST,sp)
      008EA7 2A 11            [ 1] 2547 	jrpl list_loop 
      008EA9 1E 05            [ 2] 2548 	ldw x,(LN_PTR,sp) 
      008EAB E6 02            [ 1] 2549 	ld a,(2,x)
      008EAD C7 00 0E         [ 1] 2550 	ld acc8,a 
      008EB0 72 5F 00 0D      [ 1] 2551 	clr acc16 
      008EB4 72 BB 00 0D      [ 2] 2552 	addw x,acc16
      008EB8 20 E3            [ 2] 2553 	jra 2$ 
                                   2554 ; print loop
      008EBA                       2555 list_loop:
      008EBA 1E 05            [ 2] 2556 	ldw x,(LN_PTR,sp)
      008EBC E6 02            [ 1] 2557 	ld a,(2,x) 
      008EBE CD 8E EA         [ 4] 2558 	call prt_basic_line
      008EC1 1E 05            [ 2] 2559 	ldw x,(LN_PTR,sp)
      008EC3 E6 02            [ 1] 2560 	ld a,(2,x)
      008EC5 C7 00 0E         [ 1] 2561 	ld acc8,a 
      008EC8 72 5F 00 0D      [ 1] 2562 	clr acc16 
      008ECC 72 BB 00 0D      [ 2] 2563 	addw x,acc16
      008ED0 C3 00 1C         [ 2] 2564 	cpw x,txtend 
      008ED3 2A 07            [ 1] 2565 	jrpl list_exit
      008ED5 1F 05            [ 2] 2566 	ldw (LN_PTR,sp),x
      008ED7 FE               [ 2] 2567 	ldw x,(x)
      008ED8 13 03            [ 2] 2568 	cpw x,(LAST,sp)  
      008EDA 2F DE            [ 1] 2569 	jrslt list_loop
      008EDC                       2570 list_exit:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008EDC 55 00 04 00 02   [ 1] 2571 	mov in,count 
      008EE1 AE 16 E0         [ 2] 2572 	ldw x,#pad 
      008EE4 CF 00 05         [ 2] 2573 	ldw basicptr,x 
      000E67                       2574 	_drop VSIZE 
      008EE7 5B 06            [ 2]    1     addw sp,#VSIZE 
      008EE9 81               [ 4] 2575 	ret
                                   2576 
                                   2577 
                                   2578 ;--------------------------
                                   2579 ; decompile line from token list
                                   2580 ; and print it. 
                                   2581 ; input:
                                   2582 ;   A       stop at this position 
                                   2583 ;   X 		pointer at line
                                   2584 ; output:
                                   2585 ;   none 
                                   2586 ;--------------------------	
      008EEA                       2587 prt_basic_line:
      008EEA C7 00 04         [ 1] 2588 	ld count,a 
      008EED E6 02            [ 1] 2589 	ld a,(2,x)
      008EEF C1 00 04         [ 1] 2590 	cp a,count 
      008EF2 2A 03            [ 1] 2591 	jrpl 1$ 
      008EF4 C7 00 04         [ 1] 2592 	ld count,a 
      008EF7 CF 00 05         [ 2] 2593 1$:	ldw basicptr,x 
      008EFA 90 AE 16 90      [ 2] 2594 	ldw y,#tib  
      008EFE CD A7 59         [ 4] 2595 	call decompile 
      008F01 CD 9F 60         [ 4] 2596 	call puts 
      008F04 A6 0D            [ 1] 2597 	ld a,#CR 
      008F06 CD 83 32         [ 4] 2598 	call putc 
      008F09 81               [ 4] 2599 	ret 
                                   2600 
                                   2601 
                                   2602 
                                   2603 ;---------------------------------
                                   2604 ; BASIC: PRINT|? arg_list 
                                   2605 ; print values from argument list
                                   2606 ;----------------------------------
                           000001  2607 	COMMA=1
                           000001  2608 	VSIZE=1
      008F0A                       2609 print:
      000E8A                       2610 	_vars VSIZE 
      008F0A 52 01            [ 2]    1     sub sp,#VSIZE 
      008F0C                       2611 reset_comma:
      008F0C 0F 01            [ 1] 2612 	clr (COMMA,sp)
      008F0E                       2613 prt_loop:
      008F0E CD 88 56         [ 4] 2614 	call next_token
      008F11 A1 02            [ 1] 2615 	cp a,#CMD_END 
      008F13 25 4F            [ 1] 2616 	jrult print_exit ; colon or end of line 
      008F15 A1 02            [ 1] 2617 	cp a,#TK_QSTR
      008F17 27 12            [ 1] 2618 	jreq 1$
      008F19 A1 03            [ 1] 2619 	cp a,#TK_CHAR 
      008F1B 27 13            [ 1] 2620 	jreq 2$ 
      008F1D A1 82            [ 1] 2621 	cp a,#TK_CFUNC 
      008F1F 27 15            [ 1] 2622 	jreq 3$
      008F21 A1 09            [ 1] 2623 	cp a,#TK_COMMA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008F23 27 18            [ 1] 2624 	jreq 4$
      008F25 A1 0A            [ 1] 2625 	cp a,#TK_SHARP 
      008F27 27 18            [ 1] 2626 	jreq 5$
      008F29 20 28            [ 2] 2627 	jra 7$ 
      008F2B                       2628 1$:	; print string 
      008F2B CD 9F 60         [ 4] 2629 	call puts
      008F2E 20 DC            [ 2] 2630 	jra reset_comma
      008F30                       2631 2$:	; print character 
      008F30 9F               [ 1] 2632 	ld a,xl 
      008F31 CD 83 32         [ 4] 2633 	call putc 
      008F34 20 D6            [ 2] 2634 	jra reset_comma 
      008F36                       2635 3$: ; print character function value  	
      008F36 FD               [ 4] 2636 	call (x)
      008F37 9F               [ 1] 2637 	ld a,xl 
      008F38 CD 83 32         [ 4] 2638 	call putc
      008F3B 20 CF            [ 2] 2639 	jra reset_comma 
      008F3D                       2640 4$: ; set comma state 
      008F3D 03 01            [ 1] 2641 	cpl (COMMA,sp)
      008F3F 20 CD            [ 2] 2642 	jra prt_loop   
      008F41                       2643 5$: ; # character must be followed by an integer   
      008F41 CD 88 56         [ 4] 2644 	call next_token
      008F44 A1 84            [ 1] 2645 	cp a,#TK_INTGR 
      008F46 27 03            [ 1] 2646 	jreq 6$
      008F48 CC 87 67         [ 2] 2647 	jp syntax_error 
      008F4B                       2648 6$: ; set tab width
      008F4B 9F               [ 1] 2649 	ld a,xl 
      008F4C A4 0F            [ 1] 2650 	and a,#15 
      008F4E C7 00 22         [ 1] 2651 	ld tab_width,a 
      008F51 20 B9            [ 2] 2652 	jra reset_comma 
      008F53                       2653 7$:	
      000ED3                       2654 	_unget_token 
      008F53 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      008F58 CD 8D 56         [ 4] 2655 	call relation 
      008F5B A1 84            [ 1] 2656 	cp a,#TK_INTGR 
      008F5D 26 05            [ 1] 2657 	jrne print_exit 
      008F5F CD 88 B1         [ 4] 2658     call print_int 
      008F62 20 A8            [ 2] 2659 	jra reset_comma 
      008F64                       2660 print_exit:
      008F64 0D 01            [ 1] 2661 	tnz (COMMA,sp)
      008F66 26 05            [ 1] 2662 	jrne 9$
      008F68 A6 0D            [ 1] 2663 	ld a,#CR 
      008F6A CD 83 32         [ 4] 2664     call putc 
      000EED                       2665 9$:	_drop VSIZE 
      008F6D 5B 01            [ 2]    1     addw sp,#VSIZE 
      008F6F 81               [ 4] 2666 	ret 
                                   2667 
                                   2668 ;----------------------
                                   2669 ; 'save_context' and
                                   2670 ; 'rest_context' must be 
                                   2671 ; called at the same 
                                   2672 ; call stack depth 
                                   2673 ; i.e. SP must have the 
                                   2674 ; save value at  
                                   2675 ; entry point of both 
                                   2676 ; routine. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2677 ;---------------------
                           000004  2678 	CTXT_SIZE=4 ; size of saved data 
                                   2679 ;--------------------
                                   2680 ; save current BASIC
                                   2681 ; interpreter context 
                                   2682 ; on stack 
                                   2683 ;--------------------
      008F70                       2684 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000EF0                       2685 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      000EF0                       2686 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      000EF0                       2687 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      000EF0                       2688 save_context:
      008F70 CE 00 05         [ 2] 2689 	ldw x,basicptr 
      008F73 1F 03            [ 2] 2690 	ldw (BPTR,sp),x
      008F75 C6 00 02         [ 1] 2691 	ld a,in 
      008F78 6B 05            [ 1] 2692 	ld (IN,sp),a
      008F7A C6 00 04         [ 1] 2693 	ld a,count 
      008F7D 6B 06            [ 1] 2694 	ld (CNT,sp),a  
      008F7F 81               [ 4] 2695 	ret
                                   2696 
                                   2697 ;-----------------------
                                   2698 ; restore previously saved 
                                   2699 ; BASIC interpreter context 
                                   2700 ; from stack 
                                   2701 ;-------------------------
      008F80                       2702 rest_context:
      008F80 1E 03            [ 2] 2703 	ldw x,(BPTR,sp)
      008F82 CF 00 05         [ 2] 2704 	ldw basicptr,x 
      008F85 7B 05            [ 1] 2705 	ld a,(IN,sp)
      008F87 C7 00 02         [ 1] 2706 	ld in,a
      008F8A 7B 06            [ 1] 2707 	ld a,(CNT,sp)
      008F8C C7 00 04         [ 1] 2708 	ld count,a  
      008F8F 81               [ 4] 2709 	ret
                                   2710 
                                   2711 
                                   2712 
                                   2713 ;------------------------------------------
                                   2714 ; BASIC: INPUT [string]var[,[string]var]
                                   2715 ; input value in variables 
                                   2716 ; [string] optionally can be used as prompt 
                                   2717 ;-----------------------------------------
                           000001  2718 	CX_BPTR=1
                           000003  2719 	CX_IN=3
                           000004  2720 	CX_CNT=4
                           000005  2721 	SKIP=5
                           000006  2722 	VAR_ADDR=6
                           000007  2723 	VSIZE=7
      008F90                       2724 input_var:
      000F10                       2725 	_vars VSIZE 
      008F90 52 07            [ 2]    1     sub sp,#VSIZE 
      008F92                       2726 input_loop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F92 0F 05            [ 1] 2727 	clr (SKIP,sp)
      008F94 CD 88 56         [ 4] 2728 	call next_token 
      008F97 A1 02            [ 1] 2729 	cp a,#TK_QSTR 
      008F99 26 08            [ 1] 2730 	jrne 1$ 
      008F9B CD 9F 60         [ 4] 2731 	call puts 
      008F9E 03 05            [ 1] 2732 	cpl (SKIP,sp)
      008FA0 CD 88 56         [ 4] 2733 	call next_token 
      008FA3 A1 85            [ 1] 2734 1$: cp a,#TK_VAR  
      008FA5 27 03            [ 1] 2735 	jreq 2$ 
      008FA7 CC 87 67         [ 2] 2736 	jp syntax_error
      008FAA 1F 06            [ 2] 2737 2$:	ldw (VAR_ADDR,sp),x 
      008FAC 0D 05            [ 1] 2738 	tnz (SKIP,sp)
      008FAE 26 06            [ 1] 2739 	jrne 21$ 
      008FB0 CD A7 30         [ 4] 2740 	call var_name 
      008FB3 CD 83 32         [ 4] 2741 	call putc   
      008FB6                       2742 21$:
      008FB6 A6 3A            [ 1] 2743 	ld a,#':
      008FB8 CD 83 32         [ 4] 2744 	call putc 
      008FBB CD 8F 70         [ 4] 2745 	call save_context 
      008FBE 72 5F 00 04      [ 1] 2746 	clr count  
      008FC2 CD A0 65         [ 4] 2747 	call readln 
      008FC5 AE 16 90         [ 2] 2748 	ldw x,#tib 
      008FC8 3B 00 04         [ 1] 2749 	push count
      008FCB 4B 00            [ 1] 2750 	push #0 
      008FCD 72 FB 01         [ 2] 2751 	addw x,(1,sp)
      008FD0 5C               [ 1] 2752 	incw x 
      000F51                       2753 	_drop 2 
      008FD1 5B 02            [ 2]    1     addw sp,#2 
      008FD3 72 5F 00 02      [ 1] 2754 	clr in 
      008FD7 CD A4 7F         [ 4] 2755 	call get_token
      008FDA A1 84            [ 1] 2756 	cp a,#TK_INTGR
      008FDC 27 06            [ 1] 2757 	jreq 3$ 
      008FDE CD 8F 80         [ 4] 2758 	call rest_context 
      008FE1 CC 87 67         [ 2] 2759 	jp syntax_error
      008FE4 16 06            [ 2] 2760 3$: ldw y,(VAR_ADDR,sp) 
      008FE6 90 FF            [ 2] 2761 	ldw (y),x 
      008FE8 CD 8F 80         [ 4] 2762 	call rest_context
      008FEB CD 88 56         [ 4] 2763 	call next_token 
      008FEE A1 09            [ 1] 2764 	cp a,#TK_COMMA 
      008FF0 27 A0            [ 1] 2765 	jreq input_loop
      008FF2 A1 00            [ 1] 2766 	cp a,#TK_NONE 
      008FF4 27 07            [ 1] 2767 	jreq input_exit  
      008FF6 A1 0B            [ 1] 2768 	cp a,#TK_COLON 
      008FF8 27 03            [ 1] 2769     jreq input_exit 
      008FFA CC 87 67         [ 2] 2770 	jp syntax_error 
      008FFD                       2771 input_exit:
      000F7D                       2772 	_drop VSIZE 
      008FFD 5B 07            [ 2]    1     addw sp,#VSIZE 
      008FFF 81               [ 4] 2773 	ret 
                                   2774 
                                   2775 
                                   2776 ;---------------------
                                   2777 ; BASIC: REMARK | ' 
                                   2778 ; skip comment to end of line 
                                   2779 ;---------------------- 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      009000                       2780 remark::
      009000 55 00 04 00 02   [ 1] 2781 	mov in,count 
      009005 81               [ 4] 2782  	ret 
                                   2783 
                                   2784 
                                   2785 ;---------------------
                                   2786 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2787 ; read in loop 'addr'  
                                   2788 ; apply & 'mask' to value 
                                   2789 ; loop while result==0.  
                                   2790 ; 'xor_mask' is used to 
                                   2791 ; invert the wait logic.
                                   2792 ; i.e. loop while not 0.
                                   2793 ;---------------------
                           000001  2794 	XMASK=1 
                           000002  2795 	MASK=2
                           000003  2796 	ADDR=3
                           000004  2797 	VSIZE=4
      009006                       2798 wait: 
      000F86                       2799 	_vars VSIZE
      009006 52 04            [ 2]    1     sub sp,#VSIZE 
      009008 0F 01            [ 1] 2800 	clr (XMASK,sp) 
      00900A CD 8C 0E         [ 4] 2801 	call arg_list 
      00900D A1 02            [ 1] 2802 	cp a,#2
      00900F 24 03            [ 1] 2803 	jruge 0$
      009011 CC 87 67         [ 2] 2804 	jp syntax_error 
      009014 A1 03            [ 1] 2805 0$:	cp a,#3
      009016 25 04            [ 1] 2806 	jrult 1$
      009018 85               [ 2] 2807 	popw x 
      009019 9F               [ 1] 2808 	ld a,xl
      00901A 6B 01            [ 1] 2809 	ld (XMASK,sp),a 
      00901C 85               [ 2] 2810 1$: popw x ; mask 
      00901D 9F               [ 1] 2811 	ld a,xl 
      00901E 6B 02            [ 1] 2812 	ld (MASK,sp),a 
      009020 85               [ 2] 2813 	popw x ; address 
      009021 F6               [ 1] 2814 2$:	ld a,(x)
      009022 14 02            [ 1] 2815 	and a,(MASK,sp)
      009024 18 01            [ 1] 2816 	xor a,(XMASK,sp)
      009026 27 F9            [ 1] 2817 	jreq 2$ 
      000FA8                       2818 	_drop VSIZE 
      009028 5B 04            [ 2]    1     addw sp,#VSIZE 
      00902A 81               [ 4] 2819 	ret 
                                   2820 
                                   2821 ;---------------------
                                   2822 ; BASIC: BSET addr,mask
                                   2823 ; set bits at 'addr' corresponding 
                                   2824 ; to those of 'mask' that are at 1.
                                   2825 ; arguments:
                                   2826 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2827 ;   mask        mask|addr
                                   2828 ; output:
                                   2829 ;	none 
                                   2830 ;--------------------------
      00902B                       2831 bit_set:
      00902B CD 8C 0E         [ 4] 2832 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      00902E A1 02            [ 1] 2833 	cp a,#2	 
      009030 27 03            [ 1] 2834 	jreq 1$ 
      009032 CC 87 67         [ 2] 2835 	jp syntax_error
      009035                       2836 1$: 
      009035 85               [ 2] 2837 	popw x ; mask 
      009036 9F               [ 1] 2838 	ld a,xl 
      009037 85               [ 2] 2839 	popw x ; addr  
      009038 FA               [ 1] 2840 	or a,(x)
      009039 F7               [ 1] 2841 	ld (x),a
      00903A 81               [ 4] 2842 	ret 
                                   2843 
                                   2844 ;---------------------
                                   2845 ; BASIC: BRES addr,mask
                                   2846 ; reset bits at 'addr' corresponding 
                                   2847 ; to those of 'mask' that are at 1.
                                   2848 ; arguments:
                                   2849 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2850 ;   mask	    ~mask&*addr  
                                   2851 ; output:
                                   2852 ;	none 
                                   2853 ;--------------------------
      00903B                       2854 bit_reset:
      00903B CD 8C 0E         [ 4] 2855 	call arg_list 
      00903E A1 02            [ 1] 2856 	cp a,#2  
      009040 27 03            [ 1] 2857 	jreq 1$ 
      009042 CC 87 67         [ 2] 2858 	jp syntax_error
      009045                       2859 1$: 
      009045 85               [ 2] 2860 	popw x ; mask 
      009046 9F               [ 1] 2861 	ld a,xl 
      009047 43               [ 1] 2862 	cpl a 
      009048 85               [ 2] 2863 	popw x ; addr  
      009049 F4               [ 1] 2864 	and a,(x)
      00904A F7               [ 1] 2865 	ld (x),a 
      00904B 81               [ 4] 2866 	ret 
                                   2867 
                                   2868 ;---------------------
                                   2869 ; BASIC: BTOGL addr,mask
                                   2870 ; toggle bits at 'addr' corresponding 
                                   2871 ; to those of 'mask' that are at 1.
                                   2872 ; arguments:
                                   2873 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2874 ;   mask	    mask^*addr  
                                   2875 ; output:
                                   2876 ;	none 
                                   2877 ;--------------------------
      00904C                       2878 bit_toggle:
      00904C CD 8C 0E         [ 4] 2879 	call arg_list 
      00904F A1 02            [ 1] 2880 	cp a,#2 
      009051 27 03            [ 1] 2881 	jreq 1$ 
      009053 CC 87 67         [ 2] 2882 	jp syntax_error
      009056 85               [ 2] 2883 1$: popw x ; mask 
      009057 9F               [ 1] 2884 	ld a,xl 
      009058 85               [ 2] 2885 	popw x ; addr  
      009059 F8               [ 1] 2886 	xor a,(x)
      00905A F7               [ 1] 2887 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      00905B 81               [ 4] 2888 	ret 
                                   2889 
                                   2890 
                                   2891 ;---------------------
                                   2892 ; BASIC: BTEST(addr,bit)
                                   2893 ; return bit value at 'addr' 
                                   2894 ; bit is in range {0..7}.
                                   2895 ; arguments:
                                   2896 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2897 ;   bit 	    bit position {0..7}  
                                   2898 ; output:
                                   2899 ;	none 
                                   2900 ;--------------------------
      00905C                       2901 bit_test:
      00905C CD 8C 09         [ 4] 2902 	call func_args 
      00905F A1 02            [ 1] 2903 	cp a,#2
      009061 27 03            [ 1] 2904 	jreq 0$
      009063 CC 87 67         [ 2] 2905 	jp syntax_error
      009066                       2906 0$:	
      009066 85               [ 2] 2907 	popw x 
      009067 9F               [ 1] 2908 	ld a,xl 
      009068 A4 07            [ 1] 2909 	and a,#7
      00906A 88               [ 1] 2910 	push a   
      00906B A6 01            [ 1] 2911 	ld a,#1 
      00906D 0D 01            [ 1] 2912 1$: tnz (1,sp)
      00906F 27 05            [ 1] 2913 	jreq 2$
      009071 48               [ 1] 2914 	sll a 
      009072 0A 01            [ 1] 2915 	dec (1,sp)
      009074 20 F7            [ 2] 2916 	jra 1$
      000FF6                       2917 2$: _drop 1 
      009076 5B 01            [ 2]    1     addw sp,#1 
      009078 85               [ 2] 2918 	popw x 
      009079 F4               [ 1] 2919 	and a,(x)
      00907A 27 02            [ 1] 2920 	jreq 3$
      00907C A6 01            [ 1] 2921 	ld a,#1 
      00907E 5F               [ 1] 2922 3$:	clrw x 
      00907F 97               [ 1] 2923 	ld xl,a 
      009080 A6 84            [ 1] 2924 	ld a,#TK_INTGR
      009082 81               [ 4] 2925 	ret
                                   2926 
                                   2927 
                                   2928 ;--------------------
                                   2929 ; BASIC: POKE addr,byte
                                   2930 ; put a byte at addr 
                                   2931 ;--------------------
      009083                       2932 poke:
      009083 CD 8C 0E         [ 4] 2933 	call arg_list 
      009086 A1 02            [ 1] 2934 	cp a,#2
      009088 27 03            [ 1] 2935 	jreq 1$
      00908A CC 87 67         [ 2] 2936 	jp syntax_error
      00908D                       2937 1$:	
      00908D 85               [ 2] 2938 	popw x  
      00908E 9F               [ 1] 2939     ld a,xl 
      00908F 85               [ 2] 2940 	popw x 
      009090 F7               [ 1] 2941 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      009091 81               [ 4] 2942 	ret 
                                   2943 
                                   2944 ;-----------------------
                                   2945 ; BASIC: PEEK(addr)
                                   2946 ; get the byte at addr 
                                   2947 ; input:
                                   2948 ;	none 
                                   2949 ; output:
                                   2950 ;	X 		value 
                                   2951 ;-----------------------
      009092                       2952 peek:
      009092 CD 8C 09         [ 4] 2953 	call func_args
      009095 A1 01            [ 1] 2954 	cp a,#1 
      009097 27 03            [ 1] 2955 	jreq 1$
      009099 CC 87 67         [ 2] 2956 	jp syntax_error
      00909C 85               [ 2] 2957 1$: popw x 
      00909D F6               [ 1] 2958 	ld a,(x)
      00909E 5F               [ 1] 2959 	clrw x 
      00909F 97               [ 1] 2960 	ld xl,a 
      0090A0 A6 84            [ 1] 2961 	ld a,#TK_INTGR
      0090A2 81               [ 4] 2962 	ret 
                                   2963 
                                   2964 ;---------------------------
                                   2965 ; BASIC IF expr : instructions
                                   2966 ; evaluate expr and if true 
                                   2967 ; execute instructions on same line. 
                                   2968 ;----------------------------
      0090A3                       2969 if: 
      0090A3 CD 8D 56         [ 4] 2970 	call relation 
      0090A6 A1 84            [ 1] 2971 	cp a,#TK_INTGR
      0090A8 27 03            [ 1] 2972 	jreq 1$ 
      0090AA CC 87 67         [ 2] 2973 	jp syntax_error
      0090AD 4F               [ 1] 2974 1$:	clr a 
      0090AE 5D               [ 2] 2975 	tnzw x 
      0090AF 26 05            [ 1] 2976 	jrne 9$  
                                   2977 ;skip to next line
      0090B1 55 00 04 00 02   [ 1] 2978 	mov in,count
      0090B6 81               [ 4] 2979 9$:	ret 
                                   2980 
                                   2981 ;------------------------
                                   2982 ; BASIC: FOR var=expr 
                                   2983 ; set variable to expression 
                                   2984 ; leave variable address 
                                   2985 ; on stack and set
                                   2986 ; FLOOP bit in 'flags'
                                   2987 ;-----------------
                           000001  2988 	RETL1=1 ; return address  
                           000003  2989 	FSTEP=3  ; variable increment
                           000005  2990 	LIMIT=5 ; loop limit 
                           000007  2991 	CVAR=7   ; control variable 
                           000009  2992 	INW=9   ;  in.w saved
                           00000B  2993 	BPTR=11 ; baseptr saved
                           00000A  2994 	VSIZE=10  
      0090B7                       2995 for: ; { -- var_addr }
      0090B7 85               [ 2] 2996 	popw x ; call return address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      001038                       2997 	_vars VSIZE 
      0090B8 52 0A            [ 2]    1     sub sp,#VSIZE 
      0090BA 89               [ 2] 2998 	pushw x  ; RETL1 
      0090BB A6 85            [ 1] 2999 	ld a,#TK_VAR 
      0090BD CD 8B FC         [ 4] 3000 	call expect
      0090C0 1F 07            [ 2] 3001 	ldw (CVAR,sp),x  ; control variable 
      0090C2 CD 8E 54         [ 4] 3002 	call let_var 
      0090C5 72 14 00 21      [ 1] 3003 	bset flags,#FLOOP 
                                   3004 ; open space on stack for loop data 
      0090C9 5F               [ 1] 3005 	clrw x 
      0090CA 1F 0B            [ 2] 3006 	ldw (BPTR,sp),x 
      0090CC 1F 09            [ 2] 3007 	ldw (INW,sp),x 
      0090CE CD 88 56         [ 4] 3008 	call next_token 
      0090D1 A1 80            [ 1] 3009 	cp a,#TK_CMD 
      0090D3 27 03            [ 1] 3010 	jreq 1$
      0090D5 CC 87 67         [ 2] 3011 	jp syntax_error
      0090D8                       3012 1$:  
      0090D8 A3 90 E0         [ 2] 3013 	cpw x,#to 
      0090DB 27 03            [ 1] 3014 	jreq to
      0090DD CC 87 67         [ 2] 3015 	jp syntax_error 
                                   3016 
                                   3017 ;-----------------------------------
                                   3018 ; BASIC: TO expr 
                                   3019 ; second part of FOR loop initilization
                                   3020 ; leave limit on stack and set 
                                   3021 ; FTO bit in 'flags'
                                   3022 ;-----------------------------------
      0090E0                       3023 to: ; { var_addr -- var_addr limit step }
      0090E0 72 04 00 21 03   [ 2] 3024 	btjt flags,#FLOOP,1$
      0090E5 CC 87 67         [ 2] 3025 	jp syntax_error
      0090E8 CD 8D 56         [ 4] 3026 1$: call relation  
      0090EB A1 84            [ 1] 3027 	cp a,#TK_INTGR 
      0090ED 27 03            [ 1] 3028 	jreq 2$ 
      0090EF CC 87 67         [ 2] 3029 	jp syntax_error
      0090F2 1F 05            [ 2] 3030 2$: ldw (LIMIT,sp),x
                                   3031 ;	ldw x,in.w 
      0090F4 CD 88 56         [ 4] 3032 	call next_token
      0090F7 A1 00            [ 1] 3033 	cp a,#TK_NONE  
      0090F9 27 0E            [ 1] 3034 	jreq 4$ 
      0090FB A1 80            [ 1] 3035 	cp a,#TK_CMD
      0090FD 26 05            [ 1] 3036 	jrne 3$
      0090FF A3 91 10         [ 2] 3037 	cpw x,#step 
      009102 27 0C            [ 1] 3038 	jreq step
      009104                       3039 3$:	
      001084                       3040 	_unget_token   	 
      009104 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      009109                       3041 4$:	
      009109 AE 00 01         [ 2] 3042 	ldw x,#1   ; default step  
      00910C 1F 03            [ 2] 3043 	ldw (FSTEP,sp),x 
      00910E 20 14            [ 2] 3044 	jra store_loop_addr 
                                   3045 
                                   3046 
                                   3047 ;----------------------------------
                                   3048 ; BASIC: STEP expr 
                                   3049 ; optional third par of FOR loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3050 ; initialization. 	
                                   3051 ;------------------------------------
      009110                       3052 step: ; {var limit -- var limit step}
      009110 72 04 00 21 03   [ 2] 3053 	btjt flags,#FLOOP,1$
      009115 CC 87 67         [ 2] 3054 	jp syntax_error
      009118 CD 8D 56         [ 4] 3055 1$: call relation
      00911B A1 84            [ 1] 3056 	cp a,#TK_INTGR
      00911D 27 03            [ 1] 3057 	jreq 2$
      00911F CC 87 67         [ 2] 3058 	jp syntax_error
      009122 1F 03            [ 2] 3059 2$:	ldw (FSTEP,sp),x ; step
                                   3060 ; leave loop back entry point on cstack 
                                   3061 ; cstack is 1 call deep from interpreter
      009124                       3062 store_loop_addr:
      009124 CE 00 05         [ 2] 3063 	ldw x,basicptr  
      009127 1F 0B            [ 2] 3064 	ldw (BPTR,sp),x 
      009129 CE 00 01         [ 2] 3065 	ldw x,in.w 
      00912C 1F 09            [ 2] 3066 	ldw (INW,sp),x   
      00912E 72 15 00 21      [ 1] 3067 	bres flags,#FLOOP 
      009132 72 5C 00 1E      [ 1] 3068 	inc loop_depth  
      009136 81               [ 4] 3069 	ret 
                                   3070 
                                   3071 ;--------------------------------
                                   3072 ; BASIC: NEXT var 
                                   3073 ; FOR loop control 
                                   3074 ; increment variable with step 
                                   3075 ; and compare with limit 
                                   3076 ; loop if threshold not crossed.
                                   3077 ; else stack. 
                                   3078 ; and decrement 'loop_depth' 
                                   3079 ;--------------------------------
      009137                       3080 next: ; {var limit step retl1 -- [var limit step ] }
      009137 72 5D 00 1E      [ 1] 3081 	tnz loop_depth 
      00913B 26 03            [ 1] 3082 	jrne 1$ 
      00913D CC 87 67         [ 2] 3083 	jp syntax_error 
      009140                       3084 1$: 
      009140 A6 85            [ 1] 3085 	ld a,#TK_VAR 
      009142 CD 8B FC         [ 4] 3086 	call expect
                                   3087 ; check for good variable after NEXT 	 
      009145 13 07            [ 2] 3088 	cpw x,(CVAR,sp)
      009147 27 03            [ 1] 3089 	jreq 2$  
      009149 CC 87 67         [ 2] 3090 	jp syntax_error ; not the good one 
      00914C                       3091 2$: ; increment variable 
      00914C FE               [ 2] 3092 	ldw x,(x)  ; get var value 
      00914D 72 FB 03         [ 2] 3093 	addw x,(FSTEP,sp) ; var+step 
      009150 16 07            [ 2] 3094 	ldw y,(CVAR,sp)
      009152 90 FF            [ 2] 3095 	ldw (y),x ; save var new value 
                                   3096 ; check sign of STEP  
      009154 A6 80            [ 1] 3097 	ld a,#0x80
      009156 15 03            [ 1] 3098 	bcp a,(FSTEP,sp)
      009158 2A 06            [ 1] 3099 	jrpl 4$
                                   3100 ;negative step 
      00915A 13 05            [ 2] 3101 	cpw x,(LIMIT,sp)
      00915C 2F 1B            [ 1] 3102 	jrslt loop_done
      00915E 20 04            [ 2] 3103 	jra loop_back 
      009160                       3104 4$: ; positive step
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009160 13 05            [ 2] 3105 	cpw x,(LIMIT,sp)
      009162 2C 15            [ 1] 3106 	jrsgt loop_done
      009164                       3107 loop_back:
      009164 1E 0B            [ 2] 3108 	ldw x,(BPTR,sp)
      009166 CF 00 05         [ 2] 3109 	ldw basicptr,x 
      009169 72 01 00 21 05   [ 2] 3110 	btjf flags,#FRUN,1$ 
      00916E E6 02            [ 1] 3111 	ld a,(2,x)
      009170 C7 00 04         [ 1] 3112 	ld count,a
      009173 1E 09            [ 2] 3113 1$:	ldw x,(INW,sp)
      009175 CF 00 01         [ 2] 3114 	ldw in.w,x 
      009178 81               [ 4] 3115 	ret 
      009179                       3116 loop_done:
                                   3117 	; remove loop data from stack  
      009179 85               [ 2] 3118 	popw x
      0010FA                       3119 	_drop VSIZE 
      00917A 5B 0A            [ 2]    1     addw sp,#VSIZE 
      00917C 72 5A 00 1E      [ 1] 3120 	dec loop_depth 
                                   3121 ;	pushw x 
                                   3122 ;	ret 
      009180 FC               [ 2] 3123 	jp (x)
                                   3124 
                                   3125 ;----------------------------
                                   3126 ; called by goto/gosub
                                   3127 ; to get target line number 
                                   3128 ;---------------------------
      009181                       3129 get_target_line:
      009181 CD 8D 56         [ 4] 3130 	call relation 
      009184 A1 84            [ 1] 3131 	cp a,#TK_INTGR
      009186 27 03            [ 1] 3132 	jreq 1$
      009188 CC 87 67         [ 2] 3133 	jp syntax_error
      00918B 4F               [ 1] 3134 1$:	clr a
      00918C 90 CE 00 05      [ 2] 3135 	ldw y,basicptr 
      009190 90 FE            [ 2] 3136 	ldw y,(y)
      009192 90 89            [ 2] 3137 	pushw y 
      009194 13 01            [ 2] 3138 	cpw x,(1,sp)
      009196 5B 02            [ 2] 3139 	addw sp,#2 
      009198 25 01            [ 1] 3140 	jrult 11$
      00919A 4C               [ 1] 3141 	inc a 
      00919B                       3142 11$:	
      00919B CD A2 48         [ 4] 3143 	call search_lineno  
      00919E 5D               [ 2] 3144 	tnzw x 
      00919F 26 05            [ 1] 3145 	jrne 2$ 
      0091A1 A6 05            [ 1] 3146 	ld a,#ERR_NO_LINE 
      0091A3 CC 87 69         [ 2] 3147 	jp tb_error 
      0091A6 81               [ 4] 3148 2$:	ret 
                                   3149 
                                   3150 ;------------------------
                                   3151 ; BASIC: GOTO line# 
                                   3152 ; jump to line# 
                                   3153 ; here cstack is 2 call deep from interpreter 
                                   3154 ;------------------------
      0091A7                       3155 goto:
      0091A7 72 00 00 21 06   [ 2] 3156 	btjt flags,#FRUN,0$ 
      0091AC A6 06            [ 1] 3157 	ld a,#ERR_RUN_ONLY
      0091AE CC 87 69         [ 2] 3158 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0091B1 81               [ 4] 3159 	ret 
      0091B2 CD 91 81         [ 4] 3160 0$:	call get_target_line
      0091B5                       3161 jp_to_target:
      0091B5 CF 00 05         [ 2] 3162 	ldw basicptr,x 
      0091B8 E6 02            [ 1] 3163 	ld a,(2,x)
      0091BA C7 00 04         [ 1] 3164 	ld count,a 
      0091BD 35 03 00 02      [ 1] 3165 	mov in,#3 
      0091C1 81               [ 4] 3166 	ret 
                                   3167 
                                   3168 
                                   3169 ;--------------------
                                   3170 ; BASIC: GOSUB line#
                                   3171 ; basic subroutine call
                                   3172 ; actual line# and basicptr 
                                   3173 ; are saved on cstack
                                   3174 ; here cstack is 2 call deep from interpreter 
                                   3175 ;--------------------
                           000003  3176 	RET_ADDR=3
                           000005  3177 	RET_INW=5
                           000004  3178 	VSIZE=4  
      0091C2                       3179 gosub:
      0091C2 72 00 00 21 06   [ 2] 3180 	btjt flags,#FRUN,0$ 
      0091C7 A6 06            [ 1] 3181 	ld a,#ERR_RUN_ONLY
      0091C9 CC 87 69         [ 2] 3182 	jp tb_error 
      0091CC 81               [ 4] 3183 	ret 
      0091CD 85               [ 2] 3184 0$:	popw x 
      00114E                       3185 	_vars VSIZE  
      0091CE 52 04            [ 2]    1     sub sp,#VSIZE 
      0091D0 89               [ 2] 3186 	pushw x 
      0091D1 CE 00 05         [ 2] 3187 	ldw x,basicptr
      0091D4 1F 03            [ 2] 3188 	ldw (RET_ADDR,sp),x 
      0091D6 CD 91 81         [ 4] 3189 	call get_target_line  
      0091D9 89               [ 2] 3190 	pushw x 
      0091DA CE 00 01         [ 2] 3191 	ldw x,in.w 
      0091DD 1F 07            [ 2] 3192 	ldw (RET_INW+2,sp),x
      0091DF 85               [ 2] 3193 	popw x 
      0091E0 20 D3            [ 2] 3194 	jra jp_to_target
                                   3195 
                                   3196 ;------------------------
                                   3197 ; BASIC: RETURN 
                                   3198 ; exit from a subroutine 
                                   3199 ; 
                                   3200 ;------------------------
      0091E2                       3201 return:
      0091E2 72 00 00 21 05   [ 2] 3202 	btjt flags,#FRUN,0$ 
      0091E7 A6 06            [ 1] 3203 	ld a,#ERR_RUN_ONLY
      0091E9 CC 87 69         [ 2] 3204 	jp tb_error 
      0091EC                       3205 0$:	
      0091EC 1E 03            [ 2] 3206 	ldw x,(RET_ADDR,sp) 
      0091EE CF 00 05         [ 2] 3207 	ldw basicptr,x
      0091F1 E6 02            [ 1] 3208 	ld a,(2,x)
      0091F3 C7 00 04         [ 1] 3209 	ld count,a  
      0091F6 1E 05            [ 2] 3210 	ldw x,(RET_INW,sp)
      0091F8 CF 00 01         [ 2] 3211 	ldw in.w,x 
      0091FB 85               [ 2] 3212 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      00117C                       3213 	_drop VSIZE 
      0091FC 5B 04            [ 2]    1     addw sp,#VSIZE 
      0091FE 89               [ 2] 3214 	pushw x
      0091FF 81               [ 4] 3215 	ret  
                                   3216 
                                   3217 
                                   3218 ;----------------------------------
                                   3219 ; BASIC: RUN
                                   3220 ; run BASIC program in RAM
                                   3221 ;----------------------------------- 
      009200                       3222 run: 
      009200 72 01 00 21 02   [ 2] 3223 	btjf flags,#FRUN,0$  
      009205 4F               [ 1] 3224 	clr a 
      009206 81               [ 4] 3225 	ret
      009207                       3226 0$: 
      009207 72 09 00 21 12   [ 2] 3227 	btjf flags,#FBREAK,1$
      00118C                       3228 	_drop 2 
      00920C 5B 02            [ 2]    1     addw sp,#2 
      00920E CD 8F 80         [ 4] 3229 	call rest_context
      001191                       3230 	_drop CTXT_SIZE 
      009211 5B 04            [ 2]    1     addw sp,#CTXT_SIZE 
      009213 72 19 00 21      [ 1] 3231 	bres flags,#FBREAK 
      009217 72 10 00 21      [ 1] 3232 	bset flags,#FRUN 
      00921B CC 88 0A         [ 2] 3233 	jp interpreter 
      00921E CE 00 1A         [ 2] 3234 1$:	ldw x,txtbgn
      009221 C3 00 1C         [ 2] 3235 	cpw x,txtend 
      009224 2B 0C            [ 1] 3236 	jrmi run_it 
      009226 AE 87 00         [ 2] 3237 	ldw x,#err_no_prog
      009229 CD 9F 60         [ 4] 3238 	call puts 
      00922C 55 00 04 00 02   [ 1] 3239 	mov in,count
      009231 81               [ 4] 3240 	ret 
      009232                       3241 run_it:	 
      009232 CD 8E 21         [ 4] 3242     call ubound 
      0011B5                       3243 	_drop 2 ; drop return address 
      009235 5B 02            [ 2]    1     addw sp,#2 
                                   3244 ; clear data pointer 
      009237 5F               [ 1] 3245 	clrw x 
      009238 CF 00 07         [ 2] 3246 	ldw data_ptr,x 
      00923B 72 5F 00 09      [ 1] 3247 	clr data_ofs 
      00923F 72 5F 00 0A      [ 1] 3248 	clr data_len 
                                   3249 ; initialize BASIC pointer 
      009243 CE 00 1A         [ 2] 3250 	ldw x,txtbgn 
      009246 CF 00 05         [ 2] 3251 	ldw basicptr,x 
      009249 E6 02            [ 1] 3252 	ld a,(2,x)
      00924B C7 00 04         [ 1] 3253 	ld count,a
      00924E 35 03 00 02      [ 1] 3254 	mov in,#3	
      009252 72 10 00 21      [ 1] 3255 	bset flags,#FRUN 
      009256 CC 88 0A         [ 2] 3256 	jp interpreter 
                                   3257 
                                   3258 
                                   3259 ;----------------------
                                   3260 ; BASIC: END
                                   3261 ; end running program
                                   3262 ;---------------------- 
      009259                       3263 cmd_end: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3264 ; clean stack 
      009259 AE 17 FF         [ 2] 3265 	ldw x,#STACK_EMPTY
      00925C 94               [ 1] 3266 	ldw sp,x 
      00925D CC 87 EB         [ 2] 3267 	jp warm_start
                                   3268 
                                   3269 ;-----------------
                                   3270 ; 1 Khz beep 
                                   3271 ;-----------------
      009260                       3272 beep_1khz:: 
      009260 AE 00 64         [ 2] 3273 	ldw x,#100
      009263 90 AE 03 E8      [ 2] 3274 	ldw y,#1000
      009267 20 0D            [ 2] 3275 	jra beep
                                   3276 
                                   3277 ;-----------------------
                                   3278 ; BASIC: TONE expr1,expr2
                                   3279 ; used TIMER2 channel 1
                                   3280 ; to produce a tone 
                                   3281 ; arguments:
                                   3282 ;    expr1   frequency 
                                   3283 ;    expr2   duration msec.
                                   3284 ;---------------------------
      009269                       3285 tone:
      009269 CD 8C 0E         [ 4] 3286 	call arg_list 
      00926C A1 02            [ 1] 3287 	cp a,#2 
      00926E 27 03            [ 1] 3288 	jreq 1$
      009270 CC 87 67         [ 2] 3289 	jp syntax_error 
      009273                       3290 1$: 
      009273 85               [ 2] 3291 	popw x ; duration
      009274 90 85            [ 2] 3292 	popw y ; frequency 
      009276                       3293 beep:  
      009276 89               [ 2] 3294 	pushw x 
      009277 AE F4 24         [ 2] 3295 	ldw x,#TIM2_CLK_FREQ
      00927A 65               [ 2] 3296 	divw x,y 
                                   3297 ; round to nearest integer 
      00927B 90 A3 7A 12      [ 2] 3298 	cpw y,#TIM2_CLK_FREQ/2
      00927F 2B 01            [ 1] 3299 	jrmi 2$
      009281 5C               [ 1] 3300 	incw x 
      009282                       3301 2$:	 
      009282 9E               [ 1] 3302 	ld a,xh 
      009283 C7 53 0D         [ 1] 3303 	ld TIM2_ARRH,a 
      009286 9F               [ 1] 3304 	ld a,xl 
      009287 C7 53 0E         [ 1] 3305 	ld TIM2_ARRL,a 
                                   3306 ; 50% duty cycle 
      00928A 8C               [ 1] 3307 	ccf 
      00928B 56               [ 2] 3308 	rrcw x 
      00928C 9E               [ 1] 3309 	ld a,xh 
      00928D C7 53 0F         [ 1] 3310 	ld TIM2_CCR1H,a 
      009290 9F               [ 1] 3311 	ld a,xl
      009291 C7 53 10         [ 1] 3312 	ld TIM2_CCR1L,a
      009294 72 10 53 08      [ 1] 3313 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009298 72 10 53 00      [ 1] 3314 	bset TIM2_CR1,#TIM2_CR1_CEN
      00929C 72 10 53 04      [ 1] 3315 	bset TIM2_EGR,#TIM2_EGR_UG
      0092A0 85               [ 2] 3316 	popw x 
      0092A1 CD 95 61         [ 4] 3317 	call pause02
      0092A4 72 11 53 08      [ 1] 3318 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0092A8 72 11 53 00      [ 1] 3319 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0092AC 81               [ 4] 3320 	ret 
                                   3321 
                                   3322 ;-------------------------------
                                   3323 ; BASIC: ADCON 0|1 [,divisor]  
                                   3324 ; disable/enanble ADC 
                                   3325 ;-------------------------------
                           000003  3326 	ONOFF=3 
                           000001  3327 	DIVSOR=1
                           000004  3328 	VSIZE=4 
      0092AD                       3329 power_adc:
      0092AD CD 8C 0E         [ 4] 3330 	call arg_list 
      0092B0 A1 02            [ 1] 3331 	cp a,#2	
      0092B2 27 0B            [ 1] 3332 	jreq 1$
      0092B4 A1 01            [ 1] 3333 	cp a,#1 
      0092B6 27 03            [ 1] 3334 	jreq 0$ 
      0092B8 CC 87 67         [ 2] 3335 	jp syntax_error 
      0092BB AE 00 00         [ 2] 3336 0$: ldw x,#0
      0092BE 89               [ 2] 3337 	pushw x  ; divisor 
      0092BF 1E 03            [ 2] 3338 1$: ldw x,(ONOFF,sp)
      0092C1 5D               [ 2] 3339 	tnzw x 
      0092C2 27 1A            [ 1] 3340 	jreq 2$ 
      0092C4 1E 01            [ 2] 3341 	ldw x,(DIVSOR,sp) ; divisor 
      0092C6 9F               [ 1] 3342 	ld a,xl
      0092C7 A4 07            [ 1] 3343 	and a,#7
      0092C9 4E               [ 1] 3344 	swap a 
      0092CA C7 54 01         [ 1] 3345 	ld ADC_CR1,a
      0092CD 72 16 50 CA      [ 1] 3346 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0092D1 72 10 54 01      [ 1] 3347 	bset ADC_CR1,#ADC_CR1_ADON 
      001255                       3348 	_usec_dly 7 
      0092D5 AE 00 1B         [ 2]    1     ldw x,#(16*7-2)/4
      0092D8 5A               [ 2]    2     decw x
      0092D9 9D               [ 1]    3     nop 
      0092DA 26 FA            [ 1]    4     jrne .-4
      0092DC 20 08            [ 2] 3349 	jra 3$
      0092DE 72 11 54 01      [ 1] 3350 2$: bres ADC_CR1,#ADC_CR1_ADON
      0092E2 72 17 50 CA      [ 1] 3351 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001266                       3352 3$:	_drop VSIZE 
      0092E6 5B 04            [ 2]    1     addw sp,#VSIZE 
      0092E8 81               [ 4] 3353 	ret
                                   3354 
                                   3355 ;-----------------------------
                                   3356 ; BASIC: ADCREAD (channel)
                                   3357 ; read adc channel {0..5}
                                   3358 ; output:
                                   3359 ;   A 		TK_INTGR 
                                   3360 ;   X 		value 
                                   3361 ;-----------------------------
      0092E9                       3362 analog_read:
      0092E9 CD 8C 09         [ 4] 3363 	call func_args 
      0092EC A1 01            [ 1] 3364 	cp a,#1 
      0092EE 27 03            [ 1] 3365 	jreq 1$
      0092F0 CC 87 67         [ 2] 3366 	jp syntax_error
      0092F3 85               [ 2] 3367 1$: popw x 
      0092F4 A3 00 05         [ 2] 3368 	cpw x,#5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0092F7 23 05            [ 2] 3369 	jrule 2$
      0092F9 A6 0A            [ 1] 3370 	ld a,#ERR_BAD_VALUE
      0092FB CC 87 69         [ 2] 3371 	jp tb_error 
      0092FE 9F               [ 1] 3372 2$: ld a,xl
      0092FF C7 00 0E         [ 1] 3373 	ld acc8,a 
      009302 A6 05            [ 1] 3374 	ld a,#5
      009304 C0 00 0E         [ 1] 3375 	sub a,acc8 
      009307 C7 54 00         [ 1] 3376 	ld ADC_CSR,a
      00930A 72 16 54 02      [ 1] 3377 	bset ADC_CR2,#ADC_CR2_ALIGN
      00930E 72 10 54 01      [ 1] 3378 	bset ADC_CR1,#ADC_CR1_ADON
      009312 72 0F 54 00 FB   [ 2] 3379 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009317 CE 54 04         [ 2] 3380 	ldw x,ADC_DRH
      00931A A6 84            [ 1] 3381 	ld a,#TK_INTGR
      00931C 81               [ 4] 3382 	ret 
                                   3383 
                                   3384 ;-----------------------
                                   3385 ; BASIC: DREAD(pin)
                                   3386 ; Arduino pins 
                                   3387 ; read state of a digital pin 
                                   3388 ; pin# {0..15}
                                   3389 ; output:
                                   3390 ;    A 		TK_INTGR
                                   3391 ;    X      0|1 
                                   3392 ;-------------------------
                           000001  3393 	PINNO=1
                           000001  3394 	VSIZE=1
      00931D                       3395 digital_read:
      00129D                       3396 	_vars VSIZE 
      00931D 52 01            [ 2]    1     sub sp,#VSIZE 
      00931F CD 8C 09         [ 4] 3397 	call func_args
      009322 A1 01            [ 1] 3398 	cp a,#1
      009324 27 03            [ 1] 3399 	jreq 1$
      009326 CC 87 67         [ 2] 3400 	jp syntax_error
      009329 85               [ 2] 3401 1$: popw x 
      00932A A3 00 0F         [ 2] 3402 	cpw x,#15 
      00932D 23 05            [ 2] 3403 	jrule 2$
      00932F A6 0A            [ 1] 3404 	ld a,#ERR_BAD_VALUE
      009331 CC 87 69         [ 2] 3405 	jp tb_error 
      009334 CD 96 9F         [ 4] 3406 2$:	call select_pin 
      009337 6B 01            [ 1] 3407 	ld (PINNO,sp),a
      009339 E6 01            [ 1] 3408 	ld a,(GPIO_IDR,x)
      00933B 0D 01            [ 1] 3409 	tnz (PINNO,sp)
      00933D 27 05            [ 1] 3410 	jreq 8$
      00933F 44               [ 1] 3411 3$: srl a 
      009340 0A 01            [ 1] 3412 	dec (PINNO,sp)
      009342 26 FB            [ 1] 3413 	jrne 3$ 
      009344 A4 01            [ 1] 3414 8$: and a,#1 
      009346 5F               [ 1] 3415 	clrw x 
      009347 97               [ 1] 3416 	ld xl,a 
      009348 A6 84            [ 1] 3417 	ld a,#TK_INTGR
      0012CA                       3418 	_drop VSIZE
      00934A 5B 01            [ 2]    1     addw sp,#VSIZE 
      00934C 81               [ 4] 3419 	ret
                                   3420 
                                   3421 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3422 ;-----------------------
                                   3423 ; BASIC: DWRITE pin,0|1
                                   3424 ; Arduino pins 
                                   3425 ; write to a digital pin 
                                   3426 ; pin# {0..15}
                                   3427 ; output:
                                   3428 ;    A 		TK_INTGR
                                   3429 ;    X      0|1 
                                   3430 ;-------------------------
                           000001  3431 	PINNO=1
                           000002  3432 	PINVAL=2
                           000002  3433 	VSIZE=2
      00934D                       3434 digital_write:
      0012CD                       3435 	_vars VSIZE 
      00934D 52 02            [ 2]    1     sub sp,#VSIZE 
      00934F CD 8C 0E         [ 4] 3436 	call arg_list  
      009352 A1 02            [ 1] 3437 	cp a,#2 
      009354 27 03            [ 1] 3438 	jreq 1$
      009356 CC 87 67         [ 2] 3439 	jp syntax_error
      009359 85               [ 2] 3440 1$: popw x 
      00935A 9F               [ 1] 3441 	ld a,xl 
      00935B 6B 02            [ 1] 3442 	ld (PINVAL,sp),a
      00935D 85               [ 2] 3443 	popw x 
      00935E A3 00 0F         [ 2] 3444 	cpw x,#15 
      009361 23 05            [ 2] 3445 	jrule 2$
      009363 A6 0A            [ 1] 3446 	ld a,#ERR_BAD_VALUE
      009365 CC 87 69         [ 2] 3447 	jp tb_error 
      009368 CD 96 9F         [ 4] 3448 2$:	call select_pin 
      00936B 6B 01            [ 1] 3449 	ld (PINNO,sp),a 
      00936D A6 01            [ 1] 3450 	ld a,#1
      00936F 0D 01            [ 1] 3451 	tnz (PINNO,sp)
      009371 27 05            [ 1] 3452 	jreq 4$
      009373 48               [ 1] 3453 3$: sll a
      009374 0A 01            [ 1] 3454 	dec (PINNO,sp)
      009376 26 FB            [ 1] 3455 	jrne 3$
      009378 0D 02            [ 1] 3456 4$: tnz (PINVAL,sp)
      00937A 26 05            [ 1] 3457 	jrne 5$
      00937C 43               [ 1] 3458 	cpl a 
      00937D E4 00            [ 1] 3459 	and a,(GPIO_ODR,x)
      00937F 20 02            [ 2] 3460 	jra 8$
      009381 EA 00            [ 1] 3461 5$: or a,(GPIO_ODR,x)
      009383 E7 00            [ 1] 3462 8$: ld (GPIO_ODR,x),a 
      001305                       3463 	_drop VSIZE 
      009385 5B 02            [ 2]    1     addw sp,#VSIZE 
      009387 81               [ 4] 3464 	ret
                                   3465 
                                   3466 
                                   3467 ;-----------------------
                                   3468 ; BASIC: STOP
                                   3469 ; stop progam execution  
                                   3470 ; without resetting pointers 
                                   3471 ; the program is resumed
                                   3472 ; with RUN 
                                   3473 ;-------------------------
      009388                       3474 stop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009388 72 00 00 21 02   [ 2] 3475 	btjt flags,#FRUN,2$
      00938D 4F               [ 1] 3476 	clr a
      00938E 81               [ 4] 3477 	ret 
      00938F                       3478 2$:	 
                                   3479 ; create space on cstack to save context 
      00938F AE 93 B6         [ 2] 3480 	ldw x,#break_point 
      009392 CD 9F 60         [ 4] 3481 	call puts 
      001315                       3482 	_drop 2 ;drop return address 
      009395 5B 02            [ 2]    1     addw sp,#2 
      001317                       3483 	_vars CTXT_SIZE ; context size 
      009397 52 04            [ 2]    1     sub sp,#CTXT_SIZE 
      009399 CD 8F 70         [ 4] 3484 	call save_context 
      00939C AE 16 90         [ 2] 3485 	ldw x,#tib 
      00939F CF 00 05         [ 2] 3486 	ldw basicptr,x
      0093A2 7F               [ 1] 3487 	clr (x)
      0093A3 72 5F 00 04      [ 1] 3488 	clr count  
      0093A7 5F               [ 1] 3489 	clrw x 
      0093A8 CF 00 01         [ 2] 3490 	ldw in.w,x
      0093AB 72 11 00 21      [ 1] 3491 	bres flags,#FRUN 
      0093AF 72 18 00 21      [ 1] 3492 	bset flags,#FBREAK
      0093B3 CC 88 0A         [ 2] 3493 	jp interpreter 
      0093B6 0A 62 72 65 61 6B 20  3494 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3495 
                                   3496 ;-----------------------
                                   3497 ; BASIC: NEW
                                   3498 ; from command line only 
                                   3499 ; free program memory
                                   3500 ; and clear variables 
                                   3501 ;------------------------
      0093D4                       3502 new: 
      0093D4 72 01 00 21 01   [ 2] 3503 	btjf flags,#FRUN,0$ 
      0093D9 81               [ 4] 3504 	ret 
      0093DA                       3505 0$:	
      0093DA CD 85 D1         [ 4] 3506 	call clear_basic 
      0093DD 81               [ 4] 3507 	ret 
                                   3508 
                                   3509 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3510 ;;;  flash memory operations
                                   3511 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3512 
                                   3513 ;--------------------------
                                   3514 ; align farptr to BLOCK_SIZE 
                                   3515 ;---------------------------
      0093DE                       3516 row_align:
      0093DE A6 7F            [ 1] 3517 	ld a,#0x7f 
      0093E0 C4 00 19         [ 1] 3518 	and a,farptr+2 
      0093E3 27 13            [ 1] 3519 	jreq 1$ 
      0093E5 CE 00 18         [ 2] 3520 	ldw x,farptr+1 
      0093E8 1C 00 80         [ 2] 3521 	addw x,#BLOCK_SIZE 
      0093EB 24 04            [ 1] 3522 	jrnc 0$
      0093ED 72 5C 00 17      [ 1] 3523 	inc farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0093F1 9F               [ 1] 3524 0$: ld a,xl 
      0093F2 A4 80            [ 1] 3525 	and a,#0x80
      0093F4 97               [ 1] 3526 	ld xl,a
      0093F5 CF 00 18         [ 2] 3527 	ldw farptr+1,x  	
      0093F8 81               [ 4] 3528 1$:	ret
                                   3529 
                                   3530 ;--------------------
                                   3531 ; input:
                                   3532 ;   X     increment 
                                   3533 ; output:
                                   3534 ;   farptr  incremented 
                                   3535 ;---------------------
      0093F9                       3536 incr_farptr:
      0093F9 72 BB 00 18      [ 2] 3537 	addw x,farptr+1 
      0093FD 24 04            [ 1] 3538 	jrnc 1$
      0093FF 72 5C 00 17      [ 1] 3539 	inc farptr 
      009403 CF 00 18         [ 2] 3540 1$:	ldw farptr+1,x  
      009406 81               [ 4] 3541 	ret 
                                   3542 
                                   3543 ;-----------------------------------
                                   3544 ; scan block for non zero byte 
                                   3545 ; block are 128 bytes 
                                   3546 ; input:
                                   3547 ;     X     block# 
                                   3548 ; output:
                                   3549 ;     A     0 clean, other not clean 
                                   3550 ;-----------------------------------
                           000001  3551 	COUNT=1 
                           000001  3552 	VSIZE=1
      009407                       3553 scan_block:
      009407 A6 80            [ 1] 3554 	ld a, #128 ;COUNT 
      009409 88               [ 1] 3555 	push a  
      00940A 72 5F 00 0C      [ 1] 3556 	clr acc24 
      00940E CF 00 0D         [ 2] 3557 	ldw acc16,x 
      009411 CD 89 5F         [ 4] 3558 	call mulu24_8  ; block address  
      009414 55 00 0C 00 17   [ 1] 3559 	mov farptr,acc24 
      009419 CE 00 0D         [ 2] 3560 	ldw x,acc16 
      00941C CF 00 18         [ 2] 3561 	ldw farptr+1,x 
      00941F AE 00 01         [ 2] 3562 	ldw x,#1  ; farptr increment 
      009422 92 BC 00 17      [ 5] 3563 1$: ldf a,[farptr]
      009426 26 07            [ 1] 3564 	jrne 2$
      009428 CD 93 F9         [ 4] 3565 	call incr_farptr
      00942B 0A 01            [ 1] 3566 	dec (COUNT,sp)
      00942D 26 F3            [ 1] 3567 	jrne 1$ 
      0013AF                       3568 2$:	_drop VSIZE 
      00942F 5B 01            [ 2]    1     addw sp,#VSIZE 
      009431 81               [ 4] 3569 	ret 
                                   3570 
                                   3571 
                                   3572 ;-----------------------------------
                                   3573 ; BASIC: ERASE
                                   3574 ; erase all block in range from 
                                   3575 ;  'app_space' to RAM end (0x20000)
                                   3576 ; that contains a non zero byte.  
                                   3577 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                           000001  3578 	BLOCK=1  ;block to delete 
                           000002  3579 	VSIZE=2
      009432                       3580 erase:
                                   3581  ; operation done from RAM  
      009432 CD 81 B2         [ 4] 3582 	call move_erase_to_ram
      0013B5                       3583 	_vars VSIZE 
      009435 52 02            [ 2]    1     sub sp,#VSIZE 
      009437 AE 9F 00         [ 2] 3584 	ldw x,#app_space 
      00943A A6 80            [ 1] 3585 	ld a,#128 
      00943C 62               [ 2] 3586 	div x,a 
      00943D 1F 01            [ 2] 3587 1$:	ldw (BLOCK,sp),x 
      00943F CD 94 07         [ 4] 3588     call scan_block 
      009442 26 0A            [ 1] 3589 	jrne 3$ 
                                   3590 ; this block is clean, next  
      009444 1E 01            [ 2] 3591 2$:	ldw x,(BLOCK,sp)
      009446 5C               [ 1] 3592 	incw x 
      009447 A3 04 00         [ 2] 3593 	cpw x,#1024 ; maximum block count 
      00944A 25 F1            [ 1] 3594 	jrult 1$ 
      00944C 20 10            [ 2] 3595 	jra 9$ ; done  
      00944E                       3596 3$: ; acc24 still contains block address
      00944E 55 00 0C 00 17   [ 1] 3597 	mov farptr,acc24			
      009453 CE 00 0D         [ 2] 3598 	ldw x,acc16 
      009456 CF 00 18         [ 2] 3599 	ldw farptr+1,x 
      009459 CD 82 2D         [ 4] 3600 	call block_erase 
      00945C 20 E6            [ 2] 3601 	jra 2$
      0013DE                       3602 9$: _drop VSIZE 
      00945E 5B 02            [ 2]    1     addw sp,#VSIZE 
      009460 81               [ 4] 3603 	 ret 
                                   3604 
                                   3605 
                                   3606 ;---------------------
                                   3607 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3608 ; write 1 or more byte to FLASH or EEPROM
                                   3609 ; starting at address  
                                   3610 ; input:
                                   3611 ;   expr1  	is address 
                                   3612 ;   expr2,...,exprn   are bytes to write
                                   3613 ; output:
                                   3614 ;   none 
                                   3615 ;---------------------
                           000001  3616 	ADDR=1
                           000002  3617 	VSIZ=2 
      009461                       3618 write:
      0013E1                       3619 	_vars VSIZE 
      009461 52 02            [ 2]    1     sub sp,#VSIZE 
      009463 72 5F 00 17      [ 1] 3620 	clr farptr ; expect 16 bits address 
      009467 CD 8D 0D         [ 4] 3621 	call expression
      00946A A1 84            [ 1] 3622 	cp a,#TK_INTGR 
      00946C 27 03            [ 1] 3623 	jreq 0$
      00946E CC 87 67         [ 2] 3624 	jp syntax_error
      009471 1F 01            [ 2] 3625 0$: ldw (ADDR,sp),x 
      009473 CD 88 56         [ 4] 3626 	call next_token 
      009476 A1 09            [ 1] 3627 	cp a,#TK_COMMA 
      009478 27 02            [ 1] 3628 	jreq 1$ 
      00947A 20 19            [ 2] 3629 	jra 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00947C CD 8D 0D         [ 4] 3630 1$:	call expression
      00947F A1 84            [ 1] 3631 	cp a,#TK_INTGR
      009481 27 03            [ 1] 3632 	jreq 2$
      009483 CC 87 67         [ 2] 3633 	jp syntax_error
      009486 9F               [ 1] 3634 2$:	ld a,xl 
      009487 1E 01            [ 2] 3635 	ldw x,(ADDR,sp) 
      009489 CF 00 18         [ 2] 3636 	ldw farptr+1,x 
      00948C 5F               [ 1] 3637 	clrw x 
      00948D CD 82 57         [ 4] 3638 	call write_byte
      009490 1E 01            [ 2] 3639 	ldw x,(ADDR,sp)
      009492 5C               [ 1] 3640 	incw x 
      009493 20 DC            [ 2] 3641 	jra 0$ 
      009495                       3642 9$:
      001415                       3643 	_drop VSIZE
      009495 5B 02            [ 2]    1     addw sp,#VSIZE 
      009497 81               [ 4] 3644 	ret 
                                   3645 
                                   3646 
                                   3647 ;---------------------
                                   3648 ;BASIC: CHAR(expr)
                                   3649 ; évaluate expression 
                                   3650 ; and take the 7 least 
                                   3651 ; bits as ASCII character
                                   3652 ; return a TK_CHAR 
                                   3653 ;---------------------
      009498                       3654 char:
      009498 CD 8C 09         [ 4] 3655 	call func_args 
      00949B A1 01            [ 1] 3656 	cp a,#1
      00949D 27 03            [ 1] 3657 	jreq 1$
      00949F CC 87 67         [ 2] 3658 	jp syntax_error
      0094A2 85               [ 2] 3659 1$:	popw x 
      0094A3 9F               [ 1] 3660 	ld a,xl 
      0094A4 A4 7F            [ 1] 3661 	and a,#0x7f 
      0094A6 97               [ 1] 3662 	ld xl,a
      0094A7 A6 03            [ 1] 3663 	ld a,#TK_CHAR
      0094A9 81               [ 4] 3664 	ret
                                   3665 
                                   3666 ;---------------------
                                   3667 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3668 ; extract first character 
                                   3669 ; of string argument 
                                   3670 ; return it as TK_INTGR 
                                   3671 ;---------------------
      0094AA                       3672 ascii:
      0094AA A6 07            [ 1] 3673 	ld a,#TK_LPAREN
      0094AC CD 8B FC         [ 4] 3674 	call expect 
      0094AF CD 88 56         [ 4] 3675 	call next_token 
      0094B2 A1 02            [ 1] 3676 	cp a,#TK_QSTR 
      0094B4 27 0E            [ 1] 3677 	jreq 1$
      0094B6 A1 03            [ 1] 3678 	cp a,#TK_CHAR 
      0094B8 27 0D            [ 1] 3679 	jreq 2$ 
      0094BA A1 82            [ 1] 3680 	cp a,#TK_CFUNC 
      0094BC 27 03            [ 1] 3681 	jreq 0$
      0094BE CC 87 67         [ 2] 3682 	jp syntax_error
      0094C1 FD               [ 4] 3683 0$: call (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0094C2 20 03            [ 2] 3684 	jra 2$
      0094C4                       3685 1$: 
      0094C4 F6               [ 1] 3686 	ld a,(x) 
      0094C5 5F               [ 1] 3687 	clrw x
      0094C6 97               [ 1] 3688 	ld xl,a 
      0094C7                       3689 2$: 
      0094C7 89               [ 2] 3690 	pushw x 
      0094C8 A6 08            [ 1] 3691 	ld a,#TK_RPAREN 
      0094CA CD 8B FC         [ 4] 3692 	call expect
      0094CD 85               [ 2] 3693 	popw x 
      0094CE A6 84            [ 1] 3694 	ld a,#TK_INTGR 
      0094D0 81               [ 4] 3695 	ret 
                                   3696 
                                   3697 ;---------------------
                                   3698 ;BASIC: KEY
                                   3699 ; wait for a character 
                                   3700 ; received from STDIN 
                                   3701 ; input:
                                   3702 ;	none 
                                   3703 ; output:
                                   3704 ;	X 		ASCII character 
                                   3705 ;---------------------
      0094D1                       3706 key:
      0094D1 CD 83 42         [ 4] 3707 	call getc 
      0094D4 5F               [ 1] 3708 	clrw x 
      0094D5 97               [ 1] 3709 	ld xl,a 
      0094D6 A6 84            [ 1] 3710 	ld a,#TK_INTGR
      0094D8 81               [ 4] 3711 	ret
                                   3712 
                                   3713 ;----------------------
                                   3714 ; BASIC: QKEY
                                   3715 ; Return true if there 
                                   3716 ; is a character in 
                                   3717 ; waiting in STDIN 
                                   3718 ; input:
                                   3719 ;  none 
                                   3720 ; output:
                                   3721 ;   X 		0|-1 
                                   3722 ;-----------------------
      0094D9                       3723 qkey:: 
      0094D9 5F               [ 1] 3724 	clrw x 
      0094DA C6 00 2B         [ 1] 3725 	ld a,rx1_head
      0094DD C1 00 2C         [ 1] 3726 	cp a,rx1_tail 
      0094E0 27 01            [ 1] 3727 	jreq 9$ 
      0094E2 53               [ 2] 3728 	cplw x 
      0094E3 A6 84            [ 1] 3729 9$: ld a,#TK_INTGR
      0094E5 81               [ 4] 3730 	ret 
                                   3731 
                                   3732 ;---------------------
                                   3733 ; BASIC: GPIO(expr,reg)
                                   3734 ; return gpio address 
                                   3735 ; expr {0..8}
                                   3736 ; input:
                                   3737 ;   none 
                                   3738 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3739 ;   X 		gpio register address
                                   3740 ;----------------------------
                           000003  3741 	PORT=3
                           000001  3742 	REG=1 
                           000004  3743 	VSIZE=4 
      0094E6                       3744 gpio:
      0094E6 CD 8C 09         [ 4] 3745 	call func_args 
      0094E9 A1 02            [ 1] 3746 	cp a,#2
      0094EB 27 03            [ 1] 3747 	jreq 1$
      0094ED CC 87 67         [ 2] 3748 	jp syntax_error  
      0094F0                       3749 1$:	
      0094F0 1E 03            [ 2] 3750 	ldw x,(PORT,sp)
      0094F2 2B 17            [ 1] 3751 	jrmi bad_port
      0094F4 A3 00 09         [ 2] 3752 	cpw x,#9
      0094F7 2A 12            [ 1] 3753 	jrpl bad_port
      0094F9 A6 05            [ 1] 3754 	ld a,#5
      0094FB 42               [ 4] 3755 	mul x,a
      0094FC 1C 50 00         [ 2] 3756 	addw x,#GPIO_BASE 
      0094FF 1F 03            [ 2] 3757 	ldw (PORT,sp),x  
      009501 1E 01            [ 2] 3758 	ldw x,(REG,sp) 
      009503 72 FB 03         [ 2] 3759 	addw x,(PORT,sp)
      009506 A6 84            [ 1] 3760 	ld a,#TK_INTGR
      001488                       3761 	_drop VSIZE 
      009508 5B 04            [ 2]    1     addw sp,#VSIZE 
      00950A 81               [ 4] 3762 	ret
      00950B                       3763 bad_port:
      00950B A6 0A            [ 1] 3764 	ld a,#ERR_BAD_VALUE
      00950D CC 87 69         [ 2] 3765 	jp tb_error
                                   3766 
                                   3767 
                                   3768 ;-------------------------
                                   3769 ; BASIC: UFLASH 
                                   3770 ; return free flash address
                                   3771 ; input:
                                   3772 ;  none 
                                   3773 ; output:
                                   3774 ;	A		TK_INTGR
                                   3775 ;   X 		free address 
                                   3776 ;---------------------------
      009510                       3777 uflash:
      009510 CE 9F 00         [ 2] 3778 	ldw x,app_sign
      009513 A3 10 93         [ 2] 3779 	cpw x,#4243 ; signature "BC" 
      009516 27 08            [ 1] 3780 	jreq 1$
      009518 CE 9F 02         [ 2] 3781 	ldw x,app_size 
      00951B 1C 9F 04         [ 2] 3782 	addw x,#app
      00951E 20 03            [ 2] 3783 	jra 2$
      009520 AE 9F 00         [ 2] 3784 1$:	ldw x,#app_space 
      009523 A6 84            [ 1] 3785 2$:	ld a,#TK_INTGR 
      009525 81               [ 4] 3786 	ret 
                                   3787 
                                   3788 
                                   3789 ;---------------------
                                   3790 ; BASIC: USR(addr[,arg])
                                   3791 ; execute a function written 
                                   3792 ; in binary code.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3793 ; binary fonction should 
                                   3794 ; return token attribute in A 
                                   3795 ; and value in X. 
                                   3796 ; input:
                                   3797 ;   addr	routine address 
                                   3798 ;   arg 	is an optional argument 
                                   3799 ; output:
                                   3800 ;   A 		token attribute 
                                   3801 ;   X       returned value 
                                   3802 ;---------------------
      009526                       3803 usr:
      009526 90 89            [ 2] 3804 	pushw y 	
      009528 CD 8C 09         [ 4] 3805 	call func_args 
      00952B A1 01            [ 1] 3806 	cp a,#1 
      00952D 27 07            [ 1] 3807 	jreq 2$
      00952F A1 02            [ 1] 3808 	cp a,#2
      009531 27 03            [ 1] 3809 	jreq 2$  
      009533 CC 87 67         [ 2] 3810 	jp syntax_error 
      009536 90 85            [ 2] 3811 2$: popw y  ; arg|addr 
      009538 A1 01            [ 1] 3812 	cp a,#1
      00953A 27 02            [ 1] 3813 	jreq 3$
      00953C 85               [ 2] 3814 	popw x ; addr
      00953D 51               [ 1] 3815 	exgw x,y 
      00953E 90 FD            [ 4] 3816 3$: call (y)
      009540 90 85            [ 2] 3817 	popw y 
      009542 81               [ 4] 3818 	ret 
                                   3819 
                                   3820 ;------------------------------
                                   3821 ; BASIC: BYE 
                                   3822 ; halt mcu in its lowest power mode 
                                   3823 ; wait for reset or external interrupt
                                   3824 ; do a cold start on wakeup.
                                   3825 ;------------------------------
      009543                       3826 bye:
      009543 72 0D 52 30 FB   [ 2] 3827 	btjf UART1_SR,#UART_SR_TC,.
      009548 8E               [10] 3828 	halt
      009549 CC 84 EF         [ 2] 3829 	jp cold_start  
                                   3830 
                                   3831 ;----------------------------------
                                   3832 ; BASIC: SLEEP 
                                   3833 ; halt mcu until reset or external
                                   3834 ; interrupt.
                                   3835 ; Resume progam after SLEEP command
                                   3836 ;----------------------------------
      00954C                       3837 sleep:
      00954C 72 0D 52 30 FB   [ 2] 3838 	btjf UART1_SR,#UART_SR_TC,.
      009551 72 16 00 21      [ 1] 3839 	bset flags,#FSLEEP
      009555 8E               [10] 3840 	halt 
      009556 81               [ 4] 3841 	ret 
                                   3842 
                                   3843 ;-------------------------------
                                   3844 ; BASIC: PAUSE expr 
                                   3845 ; suspend execution for n msec.
                                   3846 ; input:
                                   3847 ;	none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3848 ; output:
                                   3849 ;	none 
                                   3850 ;------------------------------
      009557                       3851 pause:
      009557 CD 8D 0D         [ 4] 3852 	call expression
      00955A A1 84            [ 1] 3853 	cp a,#TK_INTGR
      00955C 27 03            [ 1] 3854 	jreq pause02 
      00955E CC 87 67         [ 2] 3855 	jp syntax_error
      009561                       3856 pause02: 
      009561 5D               [ 2] 3857 1$: tnzw x 
      009562 27 04            [ 1] 3858 	jreq 2$
      009564 8F               [10] 3859 	wfi 
      009565 5A               [ 2] 3860 	decw x 
      009566 26 F9            [ 1] 3861 	jrne 1$
      009568 4F               [ 1] 3862 2$:	clr a 
      009569 81               [ 4] 3863 	ret 
                                   3864 
                                   3865 ;------------------------------
                                   3866 ; BASIC: AWU expr
                                   3867 ; halt mcu for 'expr' milliseconds
                                   3868 ; use Auto wakeup peripheral
                                   3869 ; all oscillators stopped except LSI
                                   3870 ; range: 1ms - 511ms
                                   3871 ; input:
                                   3872 ;  none
                                   3873 ; output:
                                   3874 ;  none:
                                   3875 ;------------------------------
      00956A                       3876 awu:
      00956A CD 8D 0D         [ 4] 3877   call expression
      00956D A1 84            [ 1] 3878   cp a,#TK_INTGR
      00956F 27 03            [ 1] 3879   jreq awu02
      009571 CC 87 67         [ 2] 3880   jp syntax_error
      009574                       3881 awu02:
      009574 A3 14 00         [ 2] 3882   cpw x,#5120
      009577 2B 0C            [ 1] 3883   jrmi 1$ 
      009579 35 0F 50 F2      [ 1] 3884   mov AWU_TBR,#15 
      00957D A6 1E            [ 1] 3885   ld a,#30
      00957F 62               [ 2] 3886   div x,a
      009580 A6 10            [ 1] 3887   ld a,#16
      009582 62               [ 2] 3888   div x,a 
      009583 20 1E            [ 2] 3889   jra 4$
      009585                       3890 1$: 
      009585 A3 08 00         [ 2] 3891   cpw x,#2048
      009588 2B 09            [ 1] 3892   jrmi 2$ 
      00958A 35 0E 50 F2      [ 1] 3893   mov AWU_TBR,#14
      00958E A6 50            [ 1] 3894   ld a,#80
      009590 62               [ 2] 3895   div x,a 
      009591 20 10            [ 2] 3896   jra 4$   
      009593                       3897 2$:
      009593 35 07 50 F2      [ 1] 3898   mov AWU_TBR,#7
      009597                       3899 3$:  
                                   3900 ; while X > 64  divide by 2 and increment AWU_TBR 
      009597 A3 00 40         [ 2] 3901   cpw x,#64 
      00959A 23 07            [ 2] 3902   jrule 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00959C 72 5C 50 F2      [ 1] 3903   inc AWU_TBR 
      0095A0 54               [ 2] 3904   srlw x 
      0095A1 20 F4            [ 2] 3905   jra 3$ 
      0095A3                       3906 4$:
      0095A3 9F               [ 1] 3907   ld a, xl
      0095A4 4A               [ 1] 3908   dec a 
      0095A5 27 01            [ 1] 3909   jreq 5$
      0095A7 4A               [ 1] 3910   dec a 	
      0095A8                       3911 5$: 
      0095A8 A4 3E            [ 1] 3912   and a,#0x3e 
      0095AA C7 50 F1         [ 1] 3913   ld AWU_APR,a 
      0095AD 72 18 50 F0      [ 1] 3914   bset AWU_CSR,#AWU_CSR_AWUEN
      0095B1 8E               [10] 3915   halt 
                                   3916 
      0095B2 81               [ 4] 3917   ret 
                                   3918 
                                   3919 ;------------------------------
                                   3920 ; BASIC: TICKS
                                   3921 ; return msec ticks counter value 
                                   3922 ; input:
                                   3923 ; 	none 
                                   3924 ; output:
                                   3925 ;	X 		TK_INTGR
                                   3926 ;-------------------------------
      0095B3                       3927 get_ticks:
      0095B3 CE 00 0F         [ 2] 3928 	ldw x,ticks 
      0095B6 A6 84            [ 1] 3929 	ld a,#TK_INTGR
      0095B8 81               [ 4] 3930 	ret 
                                   3931 
                                   3932 
                                   3933 
                                   3934 ;------------------------------
                                   3935 ; BASIC: ABS(expr)
                                   3936 ; return absolute value of expr.
                                   3937 ; input:
                                   3938 ;   none
                                   3939 ; output:
                                   3940 ;   X     	positive integer
                                   3941 ;-------------------------------
      0095B9                       3942 abs:
      0095B9 CD 8C 09         [ 4] 3943 	call func_args 
      0095BC A1 01            [ 1] 3944 	cp a,#1 
      0095BE 27 03            [ 1] 3945 	jreq 0$ 
      0095C0 CC 87 67         [ 2] 3946 	jp syntax_error
      0095C3                       3947 0$:  
      0095C3 85               [ 2] 3948     popw x   
      0095C4 9E               [ 1] 3949 	ld a,xh 
      0095C5 A5 80            [ 1] 3950 	bcp a,#0x80 
      0095C7 27 01            [ 1] 3951 	jreq 2$ 
      0095C9 50               [ 2] 3952 	negw x 
      0095CA A6 84            [ 1] 3953 2$: ld a,#TK_INTGR 
      0095CC 81               [ 4] 3954 	ret 
                                   3955 
                                   3956 ;------------------------------
                                   3957 ; BASIC: AND(expr1,expr2)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3958 ; Apply bit AND relation between
                                   3959 ; the 2 arguments, i.e expr1 & expr2 
                                   3960 ; output:
                                   3961 ; 	A 		TK_INTGR
                                   3962 ;   X 		result 
                                   3963 ;------------------------------
      0095CD                       3964 bit_and:
      0095CD CD 8C 09         [ 4] 3965 	call func_args 
      0095D0 A1 02            [ 1] 3966 	cp a,#2
      0095D2 27 03            [ 1] 3967 	jreq 1$
      0095D4 CC 87 67         [ 2] 3968 	jp syntax_error 
      0095D7 85               [ 2] 3969 1$:	popw x 
      0095D8 9E               [ 1] 3970 	ld a,xh 
      0095D9 14 01            [ 1] 3971 	and a,(1,sp)
      0095DB 95               [ 1] 3972 	ld xh,a 
      0095DC 9F               [ 1] 3973 	ld a,xl
      0095DD 14 02            [ 1] 3974 	and a,(2,sp)
      0095DF 97               [ 1] 3975 	ld xl,a 
      001560                       3976 	_drop 2 
      0095E0 5B 02            [ 2]    1     addw sp,#2 
      0095E2 A6 84            [ 1] 3977 	ld a,#TK_INTGR
      0095E4 81               [ 4] 3978 	ret
                                   3979 
                                   3980 ;------------------------------
                                   3981 ; BASIC: OR(expr1,expr2)
                                   3982 ; Apply bit OR relation between
                                   3983 ; the 2 arguments, i.e expr1 | expr2 
                                   3984 ; output:
                                   3985 ; 	A 		TK_INTGR
                                   3986 ;   X 		result 
                                   3987 ;------------------------------
      0095E5                       3988 bit_or:
      0095E5 CD 8C 09         [ 4] 3989 	call func_args 
      0095E8 A1 02            [ 1] 3990 	cp a,#2
      0095EA 27 03            [ 1] 3991 	jreq 1$
      0095EC CC 87 67         [ 2] 3992 	jp syntax_error 
      0095EF                       3993 1$: 
      0095EF 85               [ 2] 3994 	popw x 
      0095F0 9E               [ 1] 3995 	ld a,xh 
      0095F1 1A 01            [ 1] 3996 	or a,(1,sp)
      0095F3 95               [ 1] 3997 	ld xh,a 
      0095F4 9F               [ 1] 3998 	ld a,xl 
      0095F5 1A 02            [ 1] 3999 	or a,(2,sp)
      0095F7 97               [ 1] 4000 	ld xl,a 
      001578                       4001 	_drop 2 
      0095F8 5B 02            [ 2]    1     addw sp,#2 
      0095FA A6 84            [ 1] 4002 	ld a,#TK_INTGR 
      0095FC 81               [ 4] 4003 	ret
                                   4004 
                                   4005 ;------------------------------
                                   4006 ; BASIC: XOR(expr1,expr2)
                                   4007 ; Apply bit XOR relation between
                                   4008 ; the 2 arguments, i.e expr1 ^ expr2 
                                   4009 ; output:
                                   4010 ; 	A 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   4011 ;   X 		result 
                                   4012 ;------------------------------
      0095FD                       4013 bit_xor:
      0095FD CD 8C 09         [ 4] 4014 	call func_args 
      009600 A1 02            [ 1] 4015 	cp a,#2
      009602 27 03            [ 1] 4016 	jreq 1$
      009604 CC 87 67         [ 2] 4017 	jp syntax_error 
      009607                       4018 1$: 
      009607 85               [ 2] 4019 	popw x 
      009608 9E               [ 1] 4020 	ld a,xh 
      009609 18 01            [ 1] 4021 	xor a,(1,sp)
      00960B 95               [ 1] 4022 	ld xh,a 
      00960C 9F               [ 1] 4023 	ld a,xl 
      00960D 18 02            [ 1] 4024 	xor a,(2,sp)
      00960F 97               [ 1] 4025 	ld xl,a 
      001590                       4026 	_drop 2 
      009610 5B 02            [ 2]    1     addw sp,#2 
      009612 A6 84            [ 1] 4027 	ld a,#TK_INTGR 
      009614 81               [ 4] 4028 	ret 
                                   4029 
                                   4030 ;------------------------------
                                   4031 ; BASIC: LSHIFT(expr1,expr2)
                                   4032 ; logical shift left expr1 by 
                                   4033 ; expr2 bits 
                                   4034 ; output:
                                   4035 ; 	A 		TK_INTGR
                                   4036 ;   X 		result 
                                   4037 ;------------------------------
      009615                       4038 lshift:
      009615 CD 8C 09         [ 4] 4039 	call func_args
      009618 A1 02            [ 1] 4040 	cp a,#2 
      00961A 27 03            [ 1] 4041 	jreq 1$
      00961C CC 87 67         [ 2] 4042 	jp syntax_error
      00961F 90 85            [ 2] 4043 1$: popw y   
      009621 85               [ 2] 4044 	popw x 
      009622 90 5D            [ 2] 4045 	tnzw y 
      009624 27 05            [ 1] 4046 	jreq 4$
      009626 58               [ 2] 4047 2$:	sllw x 
      009627 90 5A            [ 2] 4048 	decw y 
      009629 26 FB            [ 1] 4049 	jrne 2$
      00962B                       4050 4$:  
      00962B A6 84            [ 1] 4051 	ld a,#TK_INTGR
      00962D 81               [ 4] 4052 	ret
                                   4053 
                                   4054 ;------------------------------
                                   4055 ; BASIC: RSHIFT(expr1,expr2)
                                   4056 ; logical shift right expr1 by 
                                   4057 ; expr2 bits.
                                   4058 ; output:
                                   4059 ; 	A 		TK_INTGR
                                   4060 ;   X 		result 
                                   4061 ;------------------------------
      00962E                       4062 rshift:
      00962E CD 8C 09         [ 4] 4063 	call func_args
      009631 A1 02            [ 1] 4064 	cp a,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009633 27 03            [ 1] 4065 	jreq 1$
      009635 CC 87 67         [ 2] 4066 	jp syntax_error
      009638 90 85            [ 2] 4067 1$: popw y  
      00963A 85               [ 2] 4068 	popw x
      00963B 90 5D            [ 2] 4069 	tnzw y 
      00963D 27 05            [ 1] 4070 	jreq 4$
      00963F 54               [ 2] 4071 2$:	srlw x 
      009640 90 5A            [ 2] 4072 	decw y 
      009642 26 FB            [ 1] 4073 	jrne 2$
      009644                       4074 4$:  
      009644 A6 84            [ 1] 4075 	ld a,#TK_INTGR
      009646 81               [ 4] 4076 	ret
                                   4077 
                                   4078 ;--------------------------
                                   4079 ; BASIC: FCPU integer
                                   4080 ; set CPU frequency 
                                   4081 ;-------------------------- 
                                   4082 
      009647                       4083 fcpu:
      009647 A6 84            [ 1] 4084 	ld a,#TK_INTGR
      009649 CD 8B FC         [ 4] 4085 	call expect 
      00964C 9F               [ 1] 4086 	ld a,xl 
      00964D A4 07            [ 1] 4087 	and a,#7 
      00964F C7 50 C6         [ 1] 4088 	ld CLK_CKDIVR,a 
      009652 81               [ 4] 4089 	ret 
                                   4090 
                                   4091 ;------------------------------
                                   4092 ; BASIC: PMODE pin#, mode 
                                   4093 ; Arduino pin. 
                                   4094 ; define pin as input or output
                                   4095 ; pin#: {0..15}
                                   4096 ; mode: INPUT|OUTPUT  
                                   4097 ;------------------------------
                           000001  4098 	PINNO=1
                           000001  4099 	VSIZE=1
      009653                       4100 pin_mode:
      0015D3                       4101 	_vars VSIZE 
      009653 52 01            [ 2]    1     sub sp,#VSIZE 
      009655 CD 8C 0E         [ 4] 4102 	call arg_list 
      009658 A1 02            [ 1] 4103 	cp a,#2 
      00965A 27 03            [ 1] 4104 	jreq 1$
      00965C CC 87 67         [ 2] 4105 	jp syntax_error 
      00965F 90 85            [ 2] 4106 1$: popw y ; mode 
      009661 85               [ 2] 4107 	popw x ; Dx pin 
      009662 CD 96 9F         [ 4] 4108 	call select_pin 
      009665 6B 01            [ 1] 4109 	ld (PINNO,sp),a  
      009667 A6 01            [ 1] 4110 	ld a,#1 
      009669 0D 01            [ 1] 4111 	tnz (PINNO,sp)
      00966B 27 0D            [ 1] 4112 	jreq 4$
      00966D 48               [ 1] 4113 2$:	sll a 
      00966E 0A 01            [ 1] 4114 	dec (PINNO,sp)
      009670 26 FB            [ 1] 4115 	jrne 2$ 
      009672 6B 01            [ 1] 4116 	ld (PINNO,sp),a
      009674 7B 01            [ 1] 4117 	ld a,(PINNO,sp)
      009676 EA 03            [ 1] 4118 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009678 E7 03            [ 1] 4119 	ld (GPIO_CR1,x),a 
      00967A 90 A3 00 01      [ 2] 4120 4$:	cpw y,#OUTP 
      00967E 27 10            [ 1] 4121 	jreq 6$
                                   4122 ; input mode
                                   4123 ; disable external interrupt 
      009680 7B 01            [ 1] 4124 	ld a,(PINNO,sp)
      009682 43               [ 1] 4125 	cpl a 
      009683 E4 04            [ 1] 4126 	and a,(GPIO_CR2,x)
      009685 E7 04            [ 1] 4127 	ld (GPIO_CR2,x),a 
                                   4128 ;clear bit in DDR for input mode 
      009687 7B 01            [ 1] 4129 	ld a,(PINNO,sp)
      009689 43               [ 1] 4130 	cpl a 
      00968A E4 02            [ 1] 4131 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00968C E7 02            [ 1] 4132 	ld (GPIO_DDR,x),a 
      00968E 20 0C            [ 2] 4133 	jra 9$
      009690                       4134 6$: ;output mode  
      009690 7B 01            [ 1] 4135 	ld a,(PINNO,sp)
      009692 EA 02            [ 1] 4136 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009694 E7 02            [ 1] 4137 	ld (GPIO_DDR,x),a 
      009696 7B 01            [ 1] 4138 	ld a,(PINNO,sp)
      009698 EA 04            [ 1] 4139 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00969A E7 04            [ 1] 4140 	ld (GPIO_CR2,x),a 
      00969C                       4141 9$:	
      00161C                       4142 	_drop VSIZE 
      00969C 5B 01            [ 2]    1     addw sp,#VSIZE 
      00969E 81               [ 4] 4143 	ret
                                   4144 
                                   4145 ;------------------------
                                   4146 ; select Arduino pin 
                                   4147 ; input:
                                   4148 ;   X 	 {0..15} Arduino Dx 
                                   4149 ; output:
                                   4150 ;   A     stm8s208 pin 
                                   4151 ;   X     base address s208 GPIO port 
                                   4152 ;---------------------------
      00969F                       4153 select_pin:
      00969F 58               [ 2] 4154 	sllw x 
      0096A0 1C 96 AF         [ 2] 4155 	addw x,#arduino_to_8s208 
      0096A3 FE               [ 2] 4156 	ldw x,(x)
      0096A4 9F               [ 1] 4157 	ld a,xl 
      0096A5 88               [ 1] 4158 	push a 
      0096A6 5E               [ 1] 4159 	swapw x 
      0096A7 A6 05            [ 1] 4160 	ld a,#5 
      0096A9 42               [ 4] 4161 	mul x,a 
      0096AA 1C 50 00         [ 2] 4162 	addw x,#GPIO_BASE 
      0096AD 84               [ 1] 4163 	pop a 
      0096AE 81               [ 4] 4164 	ret 
                                   4165 ; translation from Arduino D0..D15 to stm8s208rb 
      0096AF                       4166 arduino_to_8s208:
      0096AF 03 06                 4167 .byte 3,6 ; D0 
      0096B1 03 05                 4168 .byte 3,5 ; D1 
      0096B3 04 00                 4169 .byte 4,0 ; D2 
      0096B5 02 01                 4170 .byte 2,1 ; D3
      0096B7 06 00                 4171 .byte 6,0 ; D4
      0096B9 02 02                 4172 .byte 2,2 ; D5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0096BB 02 03                 4173 .byte 2,3 ; D6
      0096BD 03 01                 4174 .byte 3,1 ; D7
      0096BF 03 03                 4175 .byte 3,3 ; D8
      0096C1 02 04                 4176 .byte 2,4 ; D9
      0096C3 04 05                 4177 .byte 4,5 ; D10
      0096C5 02 06                 4178 .byte 2,6 ; D11
      0096C7 02 07                 4179 .byte 2,7 ; D12
      0096C9 02 05                 4180 .byte 2,5 ; D13
      0096CB 04 02                 4181 .byte 4,2 ; D14
      0096CD 04 01                 4182 .byte 4,1 ; D15
                                   4183 
                                   4184 
                                   4185 ;------------------------------
                                   4186 ; BASIC: RND(expr)
                                   4187 ; return random number 
                                   4188 ; between 1 and expr inclusive
                                   4189 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4190 ; input:
                                   4191 ; 	none 
                                   4192 ; output:
                                   4193 ;	X 		random positive integer 
                                   4194 ;------------------------------
      0096CF                       4195 random:
      0096CF CD 8C 09         [ 4] 4196 	call func_args 
      0096D2 A1 01            [ 1] 4197 	cp a,#1
      0096D4 27 03            [ 1] 4198 	jreq 1$
      0096D6 CC 87 67         [ 2] 4199 	jp syntax_error
      0096D9                       4200 1$:  
      0096D9 A6 80            [ 1] 4201 	ld a,#0x80 
      0096DB 15 01            [ 1] 4202 	bcp a,(1,sp)
      0096DD 27 05            [ 1] 4203 	jreq 2$
      0096DF A6 0A            [ 1] 4204 	ld a,#ERR_BAD_VALUE
      0096E1 CC 87 69         [ 2] 4205 	jp tb_error
      0096E4                       4206 2$: 
                                   4207 ; acc16=(x<<5)^x 
      0096E4 CE 00 13         [ 2] 4208 	ldw x,seedx 
      0096E7 58               [ 2] 4209 	sllw x 
      0096E8 58               [ 2] 4210 	sllw x 
      0096E9 58               [ 2] 4211 	sllw x 
      0096EA 58               [ 2] 4212 	sllw x 
      0096EB 58               [ 2] 4213 	sllw x 
      0096EC 9E               [ 1] 4214 	ld a,xh 
      0096ED C8 00 13         [ 1] 4215 	xor a,seedx 
      0096F0 C7 00 0D         [ 1] 4216 	ld acc16,a 
      0096F3 9F               [ 1] 4217 	ld a,xl 
      0096F4 C8 00 14         [ 1] 4218 	xor a,seedx+1 
      0096F7 C7 00 0E         [ 1] 4219 	ld acc8,a 
                                   4220 ; seedx=seedy 
      0096FA CE 00 15         [ 2] 4221 	ldw x,seedy 
      0096FD CF 00 13         [ 2] 4222 	ldw seedx,x  
                                   4223 ; seedy=seedy^(seedy>>1)
      009700 90 54            [ 2] 4224 	srlw y 
      009702 90 9E            [ 1] 4225 	ld a,yh 
      009704 C8 00 15         [ 1] 4226 	xor a,seedy 
      009707 C7 00 15         [ 1] 4227 	ld seedy,a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00970A 90 9F            [ 1] 4228 	ld a,yl 
      00970C C8 00 16         [ 1] 4229 	xor a,seedy+1 
      00970F C7 00 16         [ 1] 4230 	ld seedy+1,a 
                                   4231 ; acc16>>3 
      009712 CE 00 0D         [ 2] 4232 	ldw x,acc16 
      009715 54               [ 2] 4233 	srlw x 
      009716 54               [ 2] 4234 	srlw x 
      009717 54               [ 2] 4235 	srlw x 
                                   4236 ; x=acc16^x 
      009718 9E               [ 1] 4237 	ld a,xh 
      009719 C8 00 0D         [ 1] 4238 	xor a,acc16 
      00971C 95               [ 1] 4239 	ld xh,a 
      00971D 9F               [ 1] 4240 	ld a,xl 
      00971E C8 00 0E         [ 1] 4241 	xor a,acc8 
      009721 97               [ 1] 4242 	ld xl,a 
                                   4243 ; seedy=x^seedy 
      009722 C8 00 16         [ 1] 4244 	xor a,seedy+1
      009725 97               [ 1] 4245 	ld xl,a 
      009726 9E               [ 1] 4246 	ld a,xh 
      009727 C8 00 15         [ 1] 4247 	xor a,seedy
      00972A 95               [ 1] 4248 	ld xh,a 
      00972B CF 00 15         [ 2] 4249 	ldw seedy,x 
                                   4250 ; return seedy modulo expr + 1 
      00972E 90 85            [ 2] 4251 	popw y 
      009730 65               [ 2] 4252 	divw x,y 
      009731 93               [ 1] 4253 	ldw x,y 
      009732 5C               [ 1] 4254 	incw x 
      009733                       4255 10$:
      009733 A6 84            [ 1] 4256 	ld a,#TK_INTGR
      009735 81               [ 4] 4257 	ret 
                                   4258 
                                   4259 ;---------------------------------
                                   4260 ; BASIC: WORDS 
                                   4261 ; affiche la listes des mots du
                                   4262 ; dictionnaire ainsi que le nombre
                                   4263 ; de mots.
                                   4264 ;---------------------------------
                           000001  4265 	WLEN=1 ; word length
                           000002  4266 	LLEN=2 ; character sent to console
                           000003  4267 	WCNT=3 ; count words printed 
                           000003  4268 	VSIZE=3 
      009736                       4269 words:
      0016B6                       4270 	_vars VSIZE
      009736 52 03            [ 2]    1     sub sp,#VSIZE 
      009738 0F 02            [ 1] 4271 	clr (LLEN,sp)
      00973A 0F 03            [ 1] 4272 	clr (WCNT,sp)
      00973C 90 AE 9D FB      [ 2] 4273 	ldw y,#kword_dict+2
      009740 93               [ 1] 4274 0$:	ldw x,y
      009741 F6               [ 1] 4275 	ld a,(x)
      009742 A4 0F            [ 1] 4276 	and a,#15 
      009744 6B 01            [ 1] 4277 	ld (WLEN,sp),a 
      009746 0C 03            [ 1] 4278 	inc (WCNT,sp)
      009748 5C               [ 1] 4279 1$:	incw x 
      009749 F6               [ 1] 4280 	ld a,(x)
      00974A CD 83 32         [ 4] 4281 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      00974D 0C 02            [ 1] 4282 	inc (LLEN,sp)
      00974F 0A 01            [ 1] 4283 	dec (WLEN,sp)
      009751 26 F5            [ 1] 4284 	jrne 1$
      009753 A6 46            [ 1] 4285 	ld a,#70
      009755 11 02            [ 1] 4286 	cp a,(LLEN,sp)
      009757 2B 09            [ 1] 4287 	jrmi 2$   
      009759 A6 20            [ 1] 4288 	ld a,#SPACE 
      00975B CD 83 32         [ 4] 4289 	call putc 
      00975E 0C 02            [ 1] 4290 	inc (LLEN,sp) 
      009760 20 07            [ 2] 4291 	jra 3$
      009762 A6 0D            [ 1] 4292 2$: ld a,#CR 
      009764 CD 83 32         [ 4] 4293 	call putc 
      009767 0F 02            [ 1] 4294 	clr (LLEN,sp)
      009769 72 A2 00 02      [ 2] 4295 3$:	subw y,#2 
      00976D 90 FE            [ 2] 4296 	ldw y,(y)
      00976F 26 CF            [ 1] 4297 	jrne 0$ 
      009771 A6 0D            [ 1] 4298 	ld a,#CR 
      009773 CD 83 32         [ 4] 4299 	call putc  
      009776 5F               [ 1] 4300 	clrw x 
      009777 7B 03            [ 1] 4301 	ld a,(WCNT,sp)
      009779 97               [ 1] 4302 	ld xl,a 
      00977A CD 88 B1         [ 4] 4303 	call print_int 
      00977D AE 97 86         [ 2] 4304 	ldw x,#words_count_msg
      009780 CD 9F 60         [ 4] 4305 	call puts 
      001703                       4306 	_drop VSIZE 
      009783 5B 03            [ 2]    1     addw sp,#VSIZE 
      009785 81               [ 4] 4307 	ret 
      009786 20 77 6F 72 64 73 20  4308 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   4309 
                                   4310 
                                   4311 ;-----------------------------
                                   4312 ; BASIC: TIMER expr 
                                   4313 ; initialize count down timer 
                                   4314 ;-----------------------------
      00979C                       4315 set_timer:
      00979C CD 8C 0E         [ 4] 4316 	call arg_list
      00979F A1 01            [ 1] 4317 	cp a,#1 
      0097A1 27 03            [ 1] 4318 	jreq 1$
      0097A3 CC 87 67         [ 2] 4319 	jp syntax_error
      0097A6                       4320 1$: 
      0097A6 85               [ 2] 4321 	popw x 
      0097A7 CF 00 11         [ 2] 4322 	ldw timer,x 
      0097AA 81               [ 4] 4323 	ret 
                                   4324 
                                   4325 ;------------------------------
                                   4326 ; BASIC: TIMEOUT 
                                   4327 ; return state of timer 
                                   4328 ;------------------------------
      0097AB                       4329 timeout:
      0097AB CE 00 11         [ 2] 4330 	ldw x,timer 
      0097AE                       4331 logical_complement:
      0097AE 53               [ 2] 4332 	cplw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0097AF A3 FF FF         [ 2] 4333 	cpw x,#-1
      0097B2 27 01            [ 1] 4334 	jreq 2$
      0097B4 5F               [ 1] 4335 	clrw x 
      0097B5 A6 84            [ 1] 4336 2$:	ld a,#TK_INTGR
      0097B7 81               [ 4] 4337 	ret 
                                   4338 
                                   4339 ;--------------------------------
                                   4340 ; BASIC NOT(expr) 
                                   4341 ; return logical complement of expr
                                   4342 ;--------------------------------
      0097B8                       4343 func_not:
      0097B8 CD 8C 09         [ 4] 4344 	call func_args  
      0097BB A1 01            [ 1] 4345 	cp a,#1
      0097BD 27 03            [ 1] 4346 	jreq 1$
      0097BF CC 87 67         [ 2] 4347 	jp syntax_error
      0097C2 85               [ 2] 4348 1$:	popw x 
      0097C3 20 E9            [ 2] 4349 	jra logical_complement
                                   4350 
                                   4351 
                                   4352 
                                   4353 ;-----------------------------------
                                   4354 ; BASIC: IWDGEN expr1 
                                   4355 ; enable independant watchdog timer
                                   4356 ; expr1 is delay in multiple of 62.5µsec
                                   4357 ; expr1 -> {1..16383}
                                   4358 ;-----------------------------------
      0097C5                       4359 enable_iwdg:
      0097C5 CD 8C 0E         [ 4] 4360 	call arg_list
      0097C8 A1 01            [ 1] 4361 	cp a,#1 
      0097CA 27 03            [ 1] 4362 	jreq 1$
      0097CC CC 87 67         [ 2] 4363 	jp syntax_error 
      0097CF 85               [ 2] 4364 1$: popw x 
      0097D0 4B 00            [ 1] 4365 	push #0
      0097D2 35 CC 50 E0      [ 1] 4366 	mov IWDG_KR,#IWDG_KEY_ENABLE
      0097D6 9E               [ 1] 4367 	ld a,xh 
      0097D7 A4 3F            [ 1] 4368 	and a,#0x3f
      0097D9 95               [ 1] 4369 	ld xh,a  
      0097DA A3 00 FF         [ 2] 4370 2$:	cpw x,#255
      0097DD 23 06            [ 2] 4371 	jrule 3$
      0097DF 0C 01            [ 1] 4372 	inc (1,sp)
      0097E1 98               [ 1] 4373 	rcf 
      0097E2 56               [ 2] 4374 	rrcw x 
      0097E3 20 F5            [ 2] 4375 	jra 2$
      0097E5 35 55 50 E0      [ 1] 4376 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      0097E9 84               [ 1] 4377 	pop a  
      0097EA C7 50 E1         [ 1] 4378 	ld IWDG_PR,a 
      0097ED 9F               [ 1] 4379 	ld a,xl
      0097EE 4A               [ 1] 4380 	dec a 
      0097EF 35 55 50 E0      [ 1] 4381 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      0097F3 C7 50 E2         [ 1] 4382 	ld IWDG_RLR,a 
      0097F6 35 AA 50 E0      [ 1] 4383 	mov IWDG_KR,#IWDG_KEY_REFRESH
      0097FA 81               [ 4] 4384 	ret 
                                   4385 
                                   4386 
                                   4387 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4388 ; BASIC: IWDGREF  
                                   4389 ; refresh independant watchdog count down 
                                   4390 ; timer before it reset MCU. 
                                   4391 ;-----------------------------------
      0097FB                       4392 refresh_iwdg:
      0097FB 35 AA 50 E0      [ 1] 4393 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      0097FF 81               [ 4] 4394 	ret 
                                   4395 
                                   4396 
                                   4397 ;-------------------------------------
                                   4398 ; BASIC: LOG(expr)
                                   4399 ; return logarithm base 2 of expr 
                                   4400 ; this is the position of most significant
                                   4401 ; bit set. 
                                   4402 ; input: 
                                   4403 ; output:
                                   4404 ;   X     log2 
                                   4405 ;   A     TK_INTGR 
                                   4406 ;*********************************
      009800                       4407 log2:
      009800 CD 8C 09         [ 4] 4408 	call func_args 
      009803 A1 01            [ 1] 4409 	cp a,#1 
      009805 27 03            [ 1] 4410 	jreq 1$
      009807 CC 87 67         [ 2] 4411 	jp syntax_error 
      00980A 85               [ 2] 4412 1$: popw x 
      00980B                       4413 leading_one:
      00980B 5D               [ 2] 4414 	tnzw x 
      00980C 27 0A            [ 1] 4415 	jreq 4$
      00980E A6 0F            [ 1] 4416 	ld a,#15 
      009810 59               [ 2] 4417 2$: rlcw x 
      009811 25 03            [ 1] 4418     jrc 3$
      009813 4A               [ 1] 4419 	dec a 
      009814 20 FA            [ 2] 4420 	jra 2$
      009816 5F               [ 1] 4421 3$: clrw x 
      009817 97               [ 1] 4422     ld xl,a
      009818 A6 84            [ 1] 4423 4$:	ld a,#TK_INTGR
      00981A 81               [ 4] 4424 	ret 
                                   4425 
                                   4426 ;-----------------------------------
                                   4427 ; BASIC: BIT(expr) 
                                   4428 ; expr ->{0..15}
                                   4429 ; return 2^expr 
                                   4430 ; output:
                                   4431 ;    x    2^expr 
                                   4432 ;-----------------------------------
      00981B                       4433 bitmask:
      00981B CD 8C 09         [ 4] 4434     call func_args 
      00981E A1 01            [ 1] 4435 	cp a,#1
      009820 27 03            [ 1] 4436 	jreq 1$
      009822 CC 87 67         [ 2] 4437 	jp syntax_error 
      009825 85               [ 2] 4438 1$: popw x 
      009826 9F               [ 1] 4439 	ld a,xl 
      009827 A4 0F            [ 1] 4440 	and a,#15
      009829 5F               [ 1] 4441 	clrw x 
      00982A 5C               [ 1] 4442 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00982B 4D               [ 1] 4443 2$: tnz a 
      00982C 27 04            [ 1] 4444 	jreq 3$
      00982E 58               [ 2] 4445 	slaw x 
      00982F 4A               [ 1] 4446 	dec a 
      009830 20 F9            [ 2] 4447 	jra 2$ 
      009832 A6 84            [ 1] 4448 3$: ld a,#TK_INTGR
      009834 81               [ 4] 4449 	ret 
                                   4450 
                                   4451 ;------------------------------
                                   4452 ; BASIC: INVERT(expr)
                                   4453 ; 1's complement 
                                   4454 ;--------------------------------
      009835                       4455 invert:
      009835 CD 8C 09         [ 4] 4456 	call func_args
      009838 A1 01            [ 1] 4457 	cp a,#1 
      00983A 27 03            [ 1] 4458 	jreq 1$
      00983C CC 87 67         [ 2] 4459 	jp syntax_error
      00983F 85               [ 2] 4460 1$: popw x  
      009840 53               [ 2] 4461 	cplw x 
      009841 A6 84            [ 1] 4462 	ld a,#TK_INTGR 
      009843 81               [ 4] 4463 	ret 
                                   4464 
                                   4465 ;------------------------------
                                   4466 ; BASIC: DO 
                                   4467 ; initiate a DO ... UNTIL loop 
                                   4468 ;------------------------------
                           000003  4469 	DOLP_ADR=3 
                           000005  4470 	DOLP_INW=5
                           000004  4471 	VSIZE=4 
      009844                       4472 do_loop:
      009844 85               [ 2] 4473 	popw x 
      0017C5                       4474 	_vars VSIZE 
      009845 52 04            [ 2]    1     sub sp,#VSIZE 
      009847 89               [ 2] 4475 	pushw x 
      009848 90 CE 00 05      [ 2] 4476 	ldw y,basicptr 
      00984C 17 03            [ 2] 4477 	ldw (DOLP_ADR,sp),y
      00984E 90 CE 00 01      [ 2] 4478 	ldw y,in.w 
      009852 17 05            [ 2] 4479 	ldw (DOLP_INW,sp),y
      009854 72 5C 00 1E      [ 1] 4480 	inc loop_depth 
      009858 81               [ 4] 4481 	ret 
                                   4482 
                                   4483 ;--------------------------------
                                   4484 ; BASIC: UNTIL expr 
                                   4485 ; loop if exprssion is false 
                                   4486 ; else terminate loop
                                   4487 ;--------------------------------
      009859                       4488 until: 
      009859 72 5D 00 1E      [ 1] 4489 	tnz loop_depth 
      00985D 26 03            [ 1] 4490 	jrne 1$ 
      00985F CC 87 67         [ 2] 4491 	jp syntax_error 
      009862                       4492 1$: 
      009862 CD 8D 56         [ 4] 4493 	call relation 
      009865 A1 84            [ 1] 4494 	cp a,#TK_INTGR
      009867 27 03            [ 1] 4495 	jreq 2$
      009869 CC 87 67         [ 2] 4496 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00986C                       4497 2$: 
      00986C 5D               [ 2] 4498 	tnzw x 
      00986D 26 10            [ 1] 4499 	jrne 9$
      00986F 1E 03            [ 2] 4500 	ldw x,(DOLP_ADR,sp)
      009871 CF 00 05         [ 2] 4501 	ldw basicptr,x 
      009874 E6 02            [ 1] 4502 	ld a,(2,x)
      009876 C7 00 04         [ 1] 4503 	ld count,a 
      009879 1E 05            [ 2] 4504 	ldw x,(DOLP_INW,sp)
      00987B CF 00 01         [ 2] 4505 	ldw in.w,x 
      00987E 81               [ 4] 4506 	ret 
      00987F                       4507 9$:	; remove loop data from stack  
      00987F 85               [ 2] 4508 	popw x
      001800                       4509 	_drop VSIZE
      009880 5B 04            [ 2]    1     addw sp,#VSIZE 
      009882 72 5A 00 1E      [ 1] 4510 	dec loop_depth 
      009886 FC               [ 2] 4511 	jp (x)
                                   4512 
                                   4513 ;--------------------------
                                   4514 ; BASIC: PRTA...PRTI  
                                   4515 ;  return constant value 
                                   4516 ;  PORT  offset in GPIO
                                   4517 ;  array
                                   4518 ;---------------------------
      009887                       4519 const_porta:
      009887 AE 00 00         [ 2] 4520 	ldw x,#0
      00988A A6 84            [ 1] 4521 	ld a,#TK_INTGR 
      00988C 81               [ 4] 4522 	ret 
      00988D                       4523 const_portb:
      00988D AE 00 01         [ 2] 4524 	ldw x,#1
      009890 A6 84            [ 1] 4525 	ld a,#TK_INTGR 
      009892 81               [ 4] 4526 	ret 
      009893                       4527 const_portc:
      009893 AE 00 02         [ 2] 4528 	ldw x,#2
      009896 A6 84            [ 1] 4529 	ld a,#TK_INTGR 
      009898 81               [ 4] 4530 	ret 
      009899                       4531 const_portd:
      009899 AE 00 03         [ 2] 4532 	ldw x,#3
      00989C A6 84            [ 1] 4533 	ld a,#TK_INTGR 
      00989E 81               [ 4] 4534 	ret 
      00989F                       4535 const_porte:
      00989F AE 00 04         [ 2] 4536 	ldw x,#4
      0098A2 A6 84            [ 1] 4537 	ld a,#TK_INTGR 
      0098A4 81               [ 4] 4538 	ret 
      0098A5                       4539 const_portf:
      0098A5 AE 00 05         [ 2] 4540 	ldw x,#5
      0098A8 A6 84            [ 1] 4541 	ld a,#TK_INTGR 
      0098AA 81               [ 4] 4542 	ret 
      0098AB                       4543 const_portg:
      0098AB AE 00 06         [ 2] 4544 	ldw x,#6
      0098AE A6 84            [ 1] 4545 	ld a,#TK_INTGR 
      0098B0 81               [ 4] 4546 	ret 
      0098B1                       4547 const_porth:
      0098B1 AE 00 07         [ 2] 4548 	ldw x,#7
      0098B4 A6 84            [ 1] 4549 	ld a,#TK_INTGR 
      0098B6 81               [ 4] 4550 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0098B7                       4551 const_porti:
      0098B7 AE 00 08         [ 2] 4552 	ldw x,#8
      0098BA A6 84            [ 1] 4553 	ld a,#TK_INTGR 
      0098BC 81               [ 4] 4554 	ret 
                                   4555 
                                   4556 ;-------------------------------
                                   4557 ; following return constant 
                                   4558 ; related to GPIO register offset 
                                   4559 ;---------------------------------
      0098BD                       4560 const_odr:
      0098BD A6 84            [ 1] 4561 	ld a,#TK_INTGR 
      0098BF AE 00 00         [ 2] 4562 	ldw x,#GPIO_ODR
      0098C2 81               [ 4] 4563 	ret 
      0098C3                       4564 const_idr:
      0098C3 A6 84            [ 1] 4565 	ld a,#TK_INTGR 
      0098C5 AE 00 01         [ 2] 4566 	ldw x,#GPIO_IDR
      0098C8 81               [ 4] 4567 	ret 
      0098C9                       4568 const_ddr:
      0098C9 A6 84            [ 1] 4569 	ld a,#TK_INTGR 
      0098CB AE 00 02         [ 2] 4570 	ldw x,#GPIO_DDR
      0098CE 81               [ 4] 4571 	ret 
      0098CF                       4572 const_cr1:
      0098CF A6 84            [ 1] 4573 	ld a,#TK_INTGR 
      0098D1 AE 00 03         [ 2] 4574 	ldw x,#GPIO_CR1
      0098D4 81               [ 4] 4575 	ret 
      0098D5                       4576 const_cr2:
      0098D5 A6 84            [ 1] 4577 	ld a,#TK_INTGR 
      0098D7 AE 00 04         [ 2] 4578 	ldw x,#GPIO_CR2
      0098DA 81               [ 4] 4579 	ret 
                                   4580 ;-------------------------
                                   4581 ; BASIC: POUT 
                                   4582 ;  constant for port mode
                                   4583 ;  used by PMODE 
                                   4584 ;  to set pin as output
                                   4585 ;------------------------
      0098DB                       4586 const_output:
      0098DB A6 84            [ 1] 4587 	ld a,#TK_INTGR 
      0098DD AE 00 01         [ 2] 4588 	ldw x,#OUTP
      0098E0 81               [ 4] 4589 	ret 
                                   4590 
                                   4591 ;-------------------------
                                   4592 ; BASIC: PINP 
                                   4593 ;  constant for port mode
                                   4594 ;  used by PMODE 
                                   4595 ;  to set pin as input
                                   4596 ;------------------------
      0098E1                       4597 const_input:
      0098E1 A6 84            [ 1] 4598 	ld a,#TK_INTGR 
      0098E3 AE 00 00         [ 2] 4599 	ldw x,#INP 
      0098E6 81               [ 4] 4600 	ret 
                                   4601 	
                                   4602 ;-----------------------
                                   4603 ; memory area constants
                                   4604 ;-----------------------
      0098E7                       4605 const_eeprom_base:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0098E7 A6 84            [ 1] 4606 	ld a,#TK_INTGR 
      0098E9 AE 40 00         [ 2] 4607 	ldw x,#EEPROM_BASE 
      0098EC 81               [ 4] 4608 	ret 
                                   4609 
                                   4610 ;---------------------------
                                   4611 ; BASIC: DATA 
                                   4612 ; when the interpreter find 
                                   4613 ; a DATA line it skip it.
                                   4614 ;---------------------------
      0098ED                       4615 data:
      0098ED 55 00 04 00 02   [ 1] 4616 	mov in,count 
      0098F2 81               [ 4] 4617 	ret 
                                   4618 
                                   4619 ;---------------------------
                                   4620 ; BASIC: DATLN  *expr*
                                   4621 ; set DATA pointer at line# 
                                   4622 ; specified by *expr* 
                                   4623 ;---------------------------
      0098F3                       4624 data_line:
      0098F3 CD 8D 0D         [ 4] 4625 	call expression
      0098F6 A1 84            [ 1] 4626 	cp a,#TK_INTGR
      0098F8 27 03            [ 1] 4627 	jreq 1$
      0098FA CC 87 67         [ 2] 4628 	jp syntax_error  
      0098FD 4F               [ 1] 4629 1$: clr a 
      0098FE CD A2 48         [ 4] 4630 	call search_lineno
      009901 5D               [ 2] 4631 	tnzw x 
      009902 26 05            [ 1] 4632 	jrne 3$
      009904 A6 05            [ 1] 4633 2$:	ld a,#ERR_NO_LINE 
      009906 CC 87 69         [ 2] 4634 	jp tb_error
      009909                       4635 3$: ; check if valid data line 
      009909 90 93            [ 1] 4636     ldw y,x 
      00990B EE 04            [ 2] 4637 	ldw x,(4,x)
      00990D A3 98 ED         [ 2] 4638 	cpw x,#data 
      009910 26 F2            [ 1] 4639 	jrne 2$ 
      009912 90 CF 00 07      [ 2] 4640 	ldw data_ptr,y
      009916 90 E6 02         [ 1] 4641 	ld a,(2,y)
      009919 C7 00 0A         [ 1] 4642 	ld data_len,a 
      00991C 35 06 00 09      [ 1] 4643 	mov data_ofs,#FIRST_DATA_ITEM 
      009920 81               [ 4] 4644 	ret
                                   4645 
                                   4646 ;---------------------------------
                                   4647 ; BASIC: RESTORE 
                                   4648 ; set data_ptr to first data line
                                   4649 ; if not DATA found pointer set to
                                   4650 ; zero 
                                   4651 ;---------------------------------
      009921                       4652 restore:
      009921 72 5F 00 07      [ 1] 4653 	clr data_ptr 
      009925 72 5F 00 08      [ 1] 4654 	clr data_ptr+1
      009929 72 5F 00 09      [ 1] 4655 	clr data_ofs 
      00992D 72 5F 00 0A      [ 1] 4656 	clr data_len
      009931 CE 00 1A         [ 2] 4657 	ldw x,txtbgn
      009934                       4658 data_search_loop: 	
      009934 C3 00 1C         [ 2] 4659 	cpw x,txtend
      009937 24 1B            [ 1] 4660 	jruge 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009939 90 93            [ 1] 4661 	ldw y,x 
      00993B EE 04            [ 2] 4662 	ldw x,(4,x)
      00993D 1C 9E 01         [ 2] 4663 	addw x,#code_addr
      009940 FE               [ 2] 4664 	ldw x,(x)
      009941 A3 98 ED         [ 2] 4665 	cpw x,#data 
      009944 26 1A            [ 1] 4666 	jrne try_next_line 
      009946 90 CF 00 07      [ 2] 4667 	ldw data_ptr,y 
      00994A 90 E6 02         [ 1] 4668 	ld a,(2,y)
      00994D C7 00 0A         [ 1] 4669 	ld data_len,a 
      009950 35 06 00 09      [ 1] 4670 	mov data_ofs,#FIRST_DATA_ITEM
      009954 72 5D 00 0A      [ 1] 4671 9$:	tnz data_len 
      009958 26 05            [ 1] 4672     jrne 10$
      00995A A6 0C            [ 1] 4673 	ld a,#ERR_NO_DATA 
      00995C CC 87 69         [ 2] 4674 	jp tb_error 
      00995F 81               [ 4] 4675 10$:ret
      009960                       4676 try_next_line:
      009960 93               [ 1] 4677 	ldw x,y 
      009961 E6 02            [ 1] 4678 	ld a,(2,x)
      009963 C7 00 0E         [ 1] 4679 	ld acc8,a 
      009966 72 5F 00 0D      [ 1] 4680 	clr acc16 
      00996A 72 BB 00 0D      [ 2] 4681 	addw x,acc16 
      00996E 20 C4            [ 2] 4682 	jra data_search_loop
                                   4683 
                                   4684 
                                   4685 ;---------------------------------
                                   4686 ; BASIC: READ 
                                   4687 ; return next data item | 0 
                                   4688 ;---------------------------------
                           000001  4689 	CTX_BPTR=1 
                           000003  4690 	CTX_IN=3 
                           000004  4691 	CTX_COUNT=4 
                           000005  4692 	XSAVE=5
                           000006  4693 	VSIZE=6
      009970                       4694 read:
      0018F0                       4695 	_vars  VSIZE 
      009970 52 06            [ 2]    1     sub sp,#VSIZE 
      009972                       4696 read01:	
      009972 C6 00 09         [ 1] 4697 	ld a,data_ofs
      009975 C1 00 0A         [ 1] 4698 	cp a,data_len 
      009978 27 37            [ 1] 4699 	jreq 2$ ; end of line  
      00997A CD 8F 70         [ 4] 4700 	call save_context
      00997D CE 00 07         [ 2] 4701 	ldw x,data_ptr 
      009980 CF 00 05         [ 2] 4702 	ldw basicptr,x 
      009983 55 00 09 00 02   [ 1] 4703 	mov in,data_ofs 
      009988 55 00 0A 00 04   [ 1] 4704 	mov count,data_len  
      00998D CD 8D 0D         [ 4] 4705 	call expression 
      009990 A1 84            [ 1] 4706 	cp a,#TK_INTGR 
      009992 27 03            [ 1] 4707 	jreq 1$ 
      009994 CC 87 67         [ 2] 4708 	jp syntax_error 
      009997                       4709 1$:
      009997 1F 05            [ 2] 4710 	ldw (XSAVE,SP),x
      009999 CD 88 56         [ 4] 4711 	call next_token ; skip comma
      00999C CE 00 05         [ 2] 4712 	ldw x,basicptr 
      00999F CF 00 07         [ 2] 4713 	ldw data_ptr,x 
      0099A2 55 00 02 00 09   [ 1] 4714 	mov data_ofs,in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0099A7 CD 8F 80         [ 4] 4715 	call rest_context
      0099AA 1E 05            [ 2] 4716 	ldw x,(XSAVE,sp)
      0099AC A6 84            [ 1] 4717 	ld a,#TK_INTGR
      00192E                       4718 	_drop VSIZE 
      0099AE 5B 06            [ 2]    1     addw sp,#VSIZE 
      0099B0 81               [ 4] 4719 	ret 
      0099B1                       4720 2$: ; end of line reached 
      0099B1 90 CE 00 07      [ 2] 4721 	ldw y, data_ptr 
      0099B5 72 5F 00 07      [ 1] 4722 	clr data_ptr
      0099B9 72 5F 00 08      [ 1] 4723 	clr data_ptr+1   
      0099BD 72 5F 00 09      [ 1] 4724 	clr data_ofs 
      0099C1 72 5F 00 0A      [ 1] 4725 	clr data_len 
      0099C5 CD 99 60         [ 4] 4726 	call try_next_line 
      0099C8 20 A8            [ 2] 4727 	jra read01
                                   4728 
                                   4729 
                                   4730 ;---------------------------------
                                   4731 ; BASIC: SPIEN clkdiv, 0|1  
                                   4732 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4733 ; if clkdiv==-1 disable SPI
                                   4734 ; 0|1 -> disable|enable  
                                   4735 ;--------------------------------- 
                           000005  4736 SPI_CS_BIT=5
      0099CA                       4737 spi_enable:
      0099CA CD 8C 0E         [ 4] 4738 	call arg_list 
      0099CD A1 02            [ 1] 4739 	cp a,#2
      0099CF 27 03            [ 1] 4740 	jreq 1$
      0099D1 CC 87 67         [ 2] 4741 	jp syntax_error 
      0099D4                       4742 1$: 
      0099D4 72 12 50 C7      [ 1] 4743 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      0099D8 85               [ 2] 4744 	popw x  
      0099D9 5D               [ 2] 4745 	tnzw x 
      0099DA 27 21            [ 1] 4746 	jreq spi_disable 
      0099DC 85               [ 2] 4747 	popw x 
      0099DD A6 08            [ 1] 4748 	ld a,#(1<<SPI_CR1_BR)
      0099DF 42               [ 4] 4749 	mul x,a 
      0099E0 9F               [ 1] 4750 	ld a,xl 
      0099E1 C7 52 00         [ 1] 4751 	ld SPI_CR1,a 
                                   4752 ; configure ~CS on PE5 (D10 on CN8) as output. 
      0099E4 72 1A 50 14      [ 1] 4753 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      0099E8 72 1A 50 16      [ 1] 4754 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4755 ; configure SPI as master mode 0.	
      0099EC 72 14 52 00      [ 1] 4756 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4757 ; ~CS line controlled by sofware 	
      0099F0 72 12 52 01      [ 1] 4758 	bset SPI_CR2,#SPI_CR2_SSM 
      0099F4 72 10 52 01      [ 1] 4759     bset SPI_CR2,#SPI_CR2_SSI 
                                   4760 ; enable SPI
      0099F8 72 1C 52 00      [ 1] 4761 	bset SPI_CR1,#SPI_CR1_SPE 	
      0099FC 81               [ 4] 4762 	ret 
      0099FD                       4763 spi_disable:
      00197D                       4764 	_drop #2; throw first argument.
      0099FD 5B 02            [ 2]    1     addw sp,##2 
                                   4765 ; wait spi idle 
      0099FF A6 82            [ 1] 4766 1$:	ld a,#0x82 
      009A01 C4 52 03         [ 1] 4767 	and a,SPI_SR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009A04 A1 02            [ 1] 4768 	cp a,#2 
      009A06 26 F7            [ 1] 4769 	jrne 1$
      009A08 72 1D 52 00      [ 1] 4770 	bres SPI_CR1,#SPI_CR1_SPE
      009A0C 72 13 50 C7      [ 1] 4771 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009A10 72 1B 50 16      [ 1] 4772 	bres PE_DDR,#SPI_CS_BIT 
      009A14 81               [ 4] 4773 	ret 
                                   4774 
      009A15                       4775 spi_clear_error:
      009A15 A6 78            [ 1] 4776 	ld a,#0x78 
      009A17 C5 52 03         [ 1] 4777 	bcp a,SPI_SR 
      009A1A 27 04            [ 1] 4778 	jreq 1$
      009A1C 72 5F 52 03      [ 1] 4779 	clr SPI_SR 
      009A20 81               [ 4] 4780 1$: ret 
                                   4781 
      009A21                       4782 spi_send_byte:
      009A21 88               [ 1] 4783 	push a 
      009A22 CD 9A 15         [ 4] 4784 	call spi_clear_error
      009A25 84               [ 1] 4785 	pop a 
      009A26 72 03 52 03 FB   [ 2] 4786 	btjf SPI_SR,#SPI_SR_TXE,.
      009A2B C7 52 04         [ 1] 4787 	ld SPI_DR,a
      009A2E 72 01 52 03 FB   [ 2] 4788 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009A33 C6 52 04         [ 1] 4789 	ld a,SPI_DR 
      009A36 81               [ 4] 4790 	ret 
                                   4791 
      009A37                       4792 spi_rcv_byte:
      009A37 A6 FF            [ 1] 4793 	ld a,#255
      009A39 72 01 52 03 E3   [ 2] 4794 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009A3E C6 52 04         [ 1] 4795 	ld a,SPI_DR 
      009A41 81               [ 4] 4796 	ret
                                   4797 
                                   4798 ;------------------------------
                                   4799 ; BASIC: SPIWR byte [,byte]
                                   4800 ; write 1 or more byte
                                   4801 ;------------------------------
      009A42                       4802 spi_write:
      009A42 CD 8D 0D         [ 4] 4803 	call expression
      009A45 A1 84            [ 1] 4804 	cp a,#TK_INTGR 
      009A47 27 03            [ 1] 4805 	jreq 1$
      009A49 CC 87 67         [ 2] 4806 	jp syntax_error 
      009A4C                       4807 1$:	
      009A4C 9F               [ 1] 4808 	ld a,xl 
      009A4D CD 9A 21         [ 4] 4809 	call spi_send_byte 
      009A50 CD 88 56         [ 4] 4810 	call next_token 
      009A53 A1 09            [ 1] 4811 	cp a,#TK_COMMA 
      009A55 26 02            [ 1] 4812 	jrne 2$ 
      009A57 20 E9            [ 2] 4813 	jra spi_write 
      009A59 4D               [ 1] 4814 2$:	tnz a 
      009A5A 27 05            [ 1] 4815 	jreq 3$
      0019DC                       4816 	_unget_token  
      009A5C 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      009A61 81               [ 4] 4817 3$:	ret 
                                   4818 
                                   4819 
                                   4820 ;-------------------------------
                                   4821 ; BASIC: SPIRD 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4822 ; read one byte from SPI 
                                   4823 ;-------------------------------
      009A62                       4824 spi_read:
      009A62 CD 9A 37         [ 4] 4825 	call spi_rcv_byte 
      009A65 5F               [ 1] 4826 	clrw x 
      009A66 97               [ 1] 4827 	ld xl,a 
      009A67 A6 84            [ 1] 4828 	ld a,#TK_INTGR 
      009A69 81               [ 4] 4829 	ret 
                                   4830 
                                   4831 ;------------------------------
                                   4832 ; BASIC: SPISEL 0|1 
                                   4833 ; set state of ~CS line
                                   4834 ; 0|1 deselect|select  
                                   4835 ;------------------------------
      009A6A                       4836 spi_select:
      009A6A CD 88 56         [ 4] 4837 	call next_token 
      009A6D A1 84            [ 1] 4838 	cp a,#TK_INTGR 
      009A6F 27 03            [ 1] 4839 	jreq 1$
      009A71 CC 87 67         [ 2] 4840 	jp syntax_error 
      009A74 5D               [ 2] 4841 1$: tnzw x  
      009A75 27 05            [ 1] 4842 	jreq cs_high 
      009A77 72 1B 50 14      [ 1] 4843 	bres PE_ODR,#SPI_CS_BIT
      009A7B 81               [ 4] 4844 	ret 
      009A7C                       4845 cs_high: 
      009A7C 72 1A 50 14      [ 1] 4846 	bset PE_ODR,#SPI_CS_BIT
      009A80 81               [ 4] 4847 	ret 
                                   4848 
                                   4849 ;-------------------------------
                                   4850 ; BASIC: PAD 
                                   4851 ; Return pad buffer address.
                                   4852 ;------------------------------
      009A81                       4853 pad_ref:
      009A81 AE 16 E0         [ 2] 4854 	ldw x,#pad 
      009A84 B6 84            [ 1] 4855 	ld a,TK_INTGR
      009A86 81               [ 4] 4856 	ret 
                                   4857 
                                   4858 
                                   4859 ;------------------------------
                                   4860 ;      dictionary 
                                   4861 ; format:
                                   4862 ;   link:   2 bytes 
                                   4863 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4864 ;   cmd_name: 16 byte max 
                                   4865 ;   cmd_index: 2 bytes 
                                   4866 ;------------------------------
                                   4867 	.macro _dict_entry len,name,cmd_idx 
                                   4868 	.word LINK 
                                   4869 	LINK=.
                                   4870 name:
                                   4871 	.byte len 	
                                   4872 	.ascii "name"
                                   4873 	.word cmd_idx 
                                   4874 	.endm 
                                   4875 
                           000000  4876 	LINK=0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4877 ; respect alphabetic order for BASIC names from Z-A
                                   4878 ; this sort order is for a cleaner WORDS cmd output. 	
      009A87                       4879 kword_end:
      001A07                       4880 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      009A87 00 00                    1 	.word LINK 
                           001A09     2 	LINK=.
      009A89                          3 XOR:
      009A89 43                       4 	.byte 3+F_IFUNC 	
      009A8A 58 4F 52                 5 	.ascii "XOR"
      009A8D 00 BE                    6 	.word XOR_IDX 
      001A0F                       4881 	_dict_entry,5,WRITE,WRITE_IDX;write  
      009A8F 9A 89                    1 	.word LINK 
                           001A11     2 	LINK=.
      009A91                          3 WRITE:
      009A91 05                       4 	.byte 5 	
      009A92 57 52 49 54 45           5 	.ascii "WRITE"
      009A97 00 BC                    6 	.word WRITE_IDX 
      001A19                       4882 	_dict_entry,5,WORDS,WORDS_IDX;words 
      009A99 9A 91                    1 	.word LINK 
                           001A1B     2 	LINK=.
      009A9B                          3 WORDS:
      009A9B 05                       4 	.byte 5 	
      009A9C 57 4F 52 44 53           5 	.ascii "WORDS"
      009AA1 00 BA                    6 	.word WORDS_IDX 
      001A23                       4883 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      009AA3 9A 9B                    1 	.word LINK 
                           001A25     2 	LINK=.
      009AA5                          3 WAIT:
      009AA5 04                       4 	.byte 4 	
      009AA6 57 41 49 54              5 	.ascii "WAIT"
      009AAA 00 B8                    6 	.word WAIT_IDX 
      001A2C                       4884 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      009AAC 9A A5                    1 	.word LINK 
                           001A2E     2 	LINK=.
      009AAE                          3 USR:
      009AAE 43                       4 	.byte 3+F_IFUNC 	
      009AAF 55 53 52                 5 	.ascii "USR"
      009AB2 00 B6                    6 	.word USR_IDX 
      001A34                       4885 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      009AB4 9A AE                    1 	.word LINK 
                           001A36     2 	LINK=.
      009AB6                          3 UNTIL:
      009AB6 05                       4 	.byte 5 	
      009AB7 55 4E 54 49 4C           5 	.ascii "UNTIL"
      009ABC 00 B4                    6 	.word UNTIL_IDX 
      001A3E                       4886 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      009ABE 9A B6                    1 	.word LINK 
                           001A40     2 	LINK=.
      009AC0                          3 UFLASH:
      009AC0 46                       4 	.byte 6+F_IFUNC 	
      009AC1 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      009AC7 00 B2                    6 	.word UFLASH_IDX 
      001A49                       4887 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      009AC9 9A C0                    1 	.word LINK 
                           001A4B     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009ACB                          3 UBOUND:
      009ACB 46                       4 	.byte 6+F_IFUNC 	
      009ACC 55 42 4F 55 4E 44        5 	.ascii "UBOUND"
      009AD2 00 B0                    6 	.word UBOUND_IDX 
      001A54                       4888 	_dict_entry,4,TONE,TONE_IDX;tone  
      009AD4 9A CB                    1 	.word LINK 
                           001A56     2 	LINK=.
      009AD6                          3 TONE:
      009AD6 04                       4 	.byte 4 	
      009AD7 54 4F 4E 45              5 	.ascii "TONE"
      009ADB 00 AE                    6 	.word TONE_IDX 
      001A5D                       4889 	_dict_entry,2,TO,TO_IDX;to
      009ADD 9A D6                    1 	.word LINK 
                           001A5F     2 	LINK=.
      009ADF                          3 TO:
      009ADF 02                       4 	.byte 2 	
      009AE0 54 4F                    5 	.ascii "TO"
      009AE2 00 AC                    6 	.word TO_IDX 
      001A64                       4890 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      009AE4 9A DF                    1 	.word LINK 
                           001A66     2 	LINK=.
      009AE6                          3 TIMER:
      009AE6 05                       4 	.byte 5 	
      009AE7 54 49 4D 45 52           5 	.ascii "TIMER"
      009AEC 00 A8                    6 	.word TIMER_IDX 
      001A6E                       4891 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      009AEE 9A E6                    1 	.word LINK 
                           001A70     2 	LINK=.
      009AF0                          3 TIMEOUT:
      009AF0 47                       4 	.byte 7+F_IFUNC 	
      009AF1 54 49 4D 45 4F 55 54     5 	.ascii "TIMEOUT"
      009AF8 00 AA                    6 	.word TMROUT_IDX 
      001A7A                       4892 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      009AFA 9A F0                    1 	.word LINK 
                           001A7C     2 	LINK=.
      009AFC                          3 TICKS:
      009AFC 45                       4 	.byte 5+F_IFUNC 	
      009AFD 54 49 43 4B 53           5 	.ascii "TICKS"
      009B02 00 A6                    6 	.word TICKS_IDX 
      001A84                       4893 	_dict_entry,4,STOP,STOP_IDX;stop 
      009B04 9A FC                    1 	.word LINK 
                           001A86     2 	LINK=.
      009B06                          3 STOP:
      009B06 04                       4 	.byte 4 	
      009B07 53 54 4F 50              5 	.ascii "STOP"
      009B0B 00 A4                    6 	.word STOP_IDX 
      001A8D                       4894 	_dict_entry,4,STEP,STEP_IDX;step 
      009B0D 9B 06                    1 	.word LINK 
                           001A8F     2 	LINK=.
      009B0F                          3 STEP:
      009B0F 04                       4 	.byte 4 	
      009B10 53 54 45 50              5 	.ascii "STEP"
      009B14 00 A2                    6 	.word STEP_IDX 
      001A96                       4895 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      009B16 9B 0F                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                           001A98     2 	LINK=.
      009B18                          3 SPIWR:
      009B18 05                       4 	.byte 5 	
      009B19 53 50 49 57 52           5 	.ascii "SPIWR"
      009B1E 00 A0                    6 	.word SPIWR_IDX 
      001AA0                       4896 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      009B20 9B 18                    1 	.word LINK 
                           001AA2     2 	LINK=.
      009B22                          3 SPISEL:
      009B22 06                       4 	.byte 6 	
      009B23 53 50 49 53 45 4C        5 	.ascii "SPISEL"
      009B29 00 9E                    6 	.word SPISEL_IDX 
      001AAB                       4897 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      009B2B 9B 22                    1 	.word LINK 
                           001AAD     2 	LINK=.
      009B2D                          3 SPIRD:
      009B2D 45                       4 	.byte 5+F_IFUNC 	
      009B2E 53 50 49 52 44           5 	.ascii "SPIRD"
      009B33 00 9A                    6 	.word SPIRD_IDX 
      001AB5                       4898 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      009B35 9B 2D                    1 	.word LINK 
                           001AB7     2 	LINK=.
      009B37                          3 SPIEN:
      009B37 05                       4 	.byte 5 	
      009B38 53 50 49 45 4E           5 	.ascii "SPIEN"
      009B3D 00 9C                    6 	.word SPIEN_IDX 
      001ABF                       4899 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      009B3F 9B 37                    1 	.word LINK 
                           001AC1     2 	LINK=.
      009B41                          3 SLEEP:
      009B41 05                       4 	.byte 5 	
      009B42 53 4C 45 45 50           5 	.ascii "SLEEP"
      009B47 00 98                    6 	.word SLEEP_IDX 
      001AC9                       4900     _dict_entry,4,SHOW,SHOW_IDX;show 
      009B49 9B 41                    1 	.word LINK 
                           001ACB     2 	LINK=.
      009B4B                          3 SHOW:
      009B4B 04                       4 	.byte 4 	
      009B4C 53 48 4F 57              5 	.ascii "SHOW"
      009B50 00 94                    6 	.word SHOW_IDX 
      001AD2                       4901 	_dict_entry 3,RUN,RUN_IDX;run
      009B52 9B 4B                    1 	.word LINK 
                           001AD4     2 	LINK=.
      009B54                          3 RUN:
      009B54 03                       4 	.byte 3 	
      009B55 52 55 4E                 5 	.ascii "RUN"
      009B58 00 92                    6 	.word RUN_IDX 
      001ADA                       4902 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      009B5A 9B 54                    1 	.word LINK 
                           001ADC     2 	LINK=.
      009B5C                          3 RSHIFT:
      009B5C 46                       4 	.byte 6+F_IFUNC 	
      009B5D 52 53 48 49 46 54        5 	.ascii "RSHIFT"
      009B63 00 90                    6 	.word RSHIFT_IDX 
      001AE5                       4903 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009B65 9B 5C                    1 	.word LINK 
                           001AE7     2 	LINK=.
      009B67                          3 RND:
      009B67 43                       4 	.byte 3+F_IFUNC 	
      009B68 52 4E 44                 5 	.ascii "RND"
      009B6B 00 8E                    6 	.word RND_IDX 
      001AED                       4904 	_dict_entry,6,RETURN,RET_IDX;return 
      009B6D 9B 67                    1 	.word LINK 
                           001AEF     2 	LINK=.
      009B6F                          3 RETURN:
      009B6F 06                       4 	.byte 6 	
      009B70 52 45 54 55 52 4E        5 	.ascii "RETURN"
      009B76 00 8C                    6 	.word RET_IDX 
      001AF8                       4905 	_dict_entry,7,RESTORE,REST_IDX;restore 
      009B78 9B 6F                    1 	.word LINK 
                           001AFA     2 	LINK=.
      009B7A                          3 RESTORE:
      009B7A 07                       4 	.byte 7 	
      009B7B 52 45 53 54 4F 52 45     5 	.ascii "RESTORE"
      009B82 00 8A                    6 	.word REST_IDX 
      001B04                       4906 	_dict_entry 6,REMARK,REM_IDX;remark 
      009B84 9B 7A                    1 	.word LINK 
                           001B06     2 	LINK=.
      009B86                          3 REMARK:
      009B86 06                       4 	.byte 6 	
      009B87 52 45 4D 41 52 4B        5 	.ascii "REMARK"
      009B8D 00 88                    6 	.word REM_IDX 
      001B0F                       4907 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      009B8F 9B 86                    1 	.word LINK 
                           001B11     2 	LINK=.
      009B91                          3 REBOOT:
      009B91 06                       4 	.byte 6 	
      009B92 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      009B98 00 86                    6 	.word RBT_IDX 
      001B1A                       4908 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      009B9A 9B 91                    1 	.word LINK 
                           001B1C     2 	LINK=.
      009B9C                          3 READ:
      009B9C 44                       4 	.byte 4+F_IFUNC 	
      009B9D 52 45 41 44              5 	.ascii "READ"
      009BA1 00 84                    6 	.word READ_IDX 
      001B23                       4909 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      009BA3 9B 9C                    1 	.word LINK 
                           001B25     2 	LINK=.
      009BA5                          3 QKEY:
      009BA5 44                       4 	.byte 4+F_IFUNC 	
      009BA6 51 4B 45 59              5 	.ascii "QKEY"
      009BAA 00 82                    6 	.word QKEY_IDX 
      001B2C                       4910 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      009BAC 9B A5                    1 	.word LINK 
                           001B2E     2 	LINK=.
      009BAE                          3 PRTI:
      009BAE 44                       4 	.byte 4+F_IFUNC 	
      009BAF 50 52 54 49              5 	.ascii "PRTI"
      009BB3 00 80                    6 	.word PRTI_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      001B35                       4911 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      009BB5 9B AE                    1 	.word LINK 
                           001B37     2 	LINK=.
      009BB7                          3 PRTH:
      009BB7 44                       4 	.byte 4+F_IFUNC 	
      009BB8 50 52 54 48              5 	.ascii "PRTH"
      009BBC 00 7E                    6 	.word PRTH_IDX 
      001B3E                       4912 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      009BBE 9B B7                    1 	.word LINK 
                           001B40     2 	LINK=.
      009BC0                          3 PRTG:
      009BC0 44                       4 	.byte 4+F_IFUNC 	
      009BC1 50 52 54 47              5 	.ascii "PRTG"
      009BC5 00 7C                    6 	.word PRTG_IDX 
      001B47                       4913 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      009BC7 9B C0                    1 	.word LINK 
                           001B49     2 	LINK=.
      009BC9                          3 PRTF:
      009BC9 44                       4 	.byte 4+F_IFUNC 	
      009BCA 50 52 54 46              5 	.ascii "PRTF"
      009BCE 00 7A                    6 	.word PRTF_IDX 
      001B50                       4914 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      009BD0 9B C9                    1 	.word LINK 
                           001B52     2 	LINK=.
      009BD2                          3 PRTE:
      009BD2 44                       4 	.byte 4+F_IFUNC 	
      009BD3 50 52 54 45              5 	.ascii "PRTE"
      009BD7 00 78                    6 	.word PRTE_IDX 
      001B59                       4915 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      009BD9 9B D2                    1 	.word LINK 
                           001B5B     2 	LINK=.
      009BDB                          3 PRTD:
      009BDB 44                       4 	.byte 4+F_IFUNC 	
      009BDC 50 52 54 44              5 	.ascii "PRTD"
      009BE0 00 76                    6 	.word PRTD_IDX 
      001B62                       4916 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      009BE2 9B DB                    1 	.word LINK 
                           001B64     2 	LINK=.
      009BE4                          3 PRTC:
      009BE4 44                       4 	.byte 4+F_IFUNC 	
      009BE5 50 52 54 43              5 	.ascii "PRTC"
      009BE9 00 74                    6 	.word PRTC_IDX 
      001B6B                       4917 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      009BEB 9B E4                    1 	.word LINK 
                           001B6D     2 	LINK=.
      009BED                          3 PRTB:
      009BED 44                       4 	.byte 4+F_IFUNC 	
      009BEE 50 52 54 42              5 	.ascii "PRTB"
      009BF2 00 72                    6 	.word PRTB_IDX 
      001B74                       4918 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      009BF4 9B ED                    1 	.word LINK 
                           001B76     2 	LINK=.
      009BF6                          3 PRTA:
      009BF6 44                       4 	.byte 4+F_IFUNC 	
      009BF7 50 52 54 41              5 	.ascii "PRTA"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009BFB 00 70                    6 	.word PRTA_IDX 
      001B7D                       4919 	_dict_entry 5,PRINT,PRT_IDX;print 
      009BFD 9B F6                    1 	.word LINK 
                           001B7F     2 	LINK=.
      009BFF                          3 PRINT:
      009BFF 05                       4 	.byte 5 	
      009C00 50 52 49 4E 54           5 	.ascii "PRINT"
      009C05 00 6E                    6 	.word PRT_IDX 
      001B87                       4920 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      009C07 9B FF                    1 	.word LINK 
                           001B89     2 	LINK=.
      009C09                          3 POUT:
      009C09 44                       4 	.byte 4+F_IFUNC 	
      009C0A 50 4F 55 54              5 	.ascii "POUT"
      009C0E 00 6C                    6 	.word POUT_IDX 
      001B90                       4921 	_dict_entry,4,POKE,POKE_IDX;poke 
      009C10 9C 09                    1 	.word LINK 
                           001B92     2 	LINK=.
      009C12                          3 POKE:
      009C12 04                       4 	.byte 4 	
      009C13 50 4F 4B 45              5 	.ascii "POKE"
      009C17 00 6A                    6 	.word POKE_IDX 
      001B99                       4922 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      009C19 9C 12                    1 	.word LINK 
                           001B9B     2 	LINK=.
      009C1B                          3 PMODE:
      009C1B 05                       4 	.byte 5 	
      009C1C 50 4D 4F 44 45           5 	.ascii "PMODE"
      009C21 00 64                    6 	.word PMODE_IDX 
      001BA3                       4923 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      009C23 9C 1B                    1 	.word LINK 
                           001BA5     2 	LINK=.
      009C25                          3 PINP:
      009C25 44                       4 	.byte 4+F_IFUNC 	
      009C26 50 49 4E 50              5 	.ascii "PINP"
      009C2A 00 68                    6 	.word PINP_IDX 
      001BAC                       4924 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      009C2C 9C 25                    1 	.word LINK 
                           001BAE     2 	LINK=.
      009C2E                          3 PEEK:
      009C2E 44                       4 	.byte 4+F_IFUNC 	
      009C2F 50 45 45 4B              5 	.ascii "PEEK"
      009C33 00 66                    6 	.word PEEK_IDX 
      001BB5                       4925 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      009C35 9C 2E                    1 	.word LINK 
                           001BB7     2 	LINK=.
      009C37                          3 PAUSE:
      009C37 05                       4 	.byte 5 	
      009C38 50 41 55 53 45           5 	.ascii "PAUSE"
      009C3D 00 62                    6 	.word PAUSE_IDX 
      001BBF                       4926 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      009C3F 9C 37                    1 	.word LINK 
                           001BC1     2 	LINK=.
      009C41                          3 PAD:
      009C41 43                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009C42 50 41 44                 5 	.ascii "PAD"
      009C45 00 60                    6 	.word PAD_IDX 
      001BC7                       4927 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      009C47 9C 41                    1 	.word LINK 
                           001BC9     2 	LINK=.
      009C49                          3 OR:
      009C49 42                       4 	.byte 2+F_IFUNC 	
      009C4A 4F 52                    5 	.ascii "OR"
      009C4C 00 5E                    6 	.word OR_IDX 
      001BCE                       4928 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      009C4E 9C 49                    1 	.word LINK 
                           001BD0     2 	LINK=.
      009C50                          3 ODR:
      009C50 43                       4 	.byte 3+F_IFUNC 	
      009C51 4F 44 52                 5 	.ascii "ODR"
      009C54 00 5C                    6 	.word ODR_IDX 
      001BD6                       4929 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      009C56 9C 50                    1 	.word LINK 
                           001BD8     2 	LINK=.
      009C58                          3 NOT:
      009C58 43                       4 	.byte 3+F_IFUNC 	
      009C59 4E 4F 54                 5 	.ascii "NOT"
      009C5C 00 5A                    6 	.word NOT_IDX 
      001BDE                       4930 	_dict_entry,4,NEXT,NEXT_IDX;next 
      009C5E 9C 58                    1 	.word LINK 
                           001BE0     2 	LINK=.
      009C60                          3 NEXT:
      009C60 04                       4 	.byte 4 	
      009C61 4E 45 58 54              5 	.ascii "NEXT"
      009C65 00 56                    6 	.word NEXT_IDX 
      001BE7                       4931 	_dict_entry,3,NEW,NEW_IDX;new
      009C67 9C 60                    1 	.word LINK 
                           001BE9     2 	LINK=.
      009C69                          3 NEW:
      009C69 03                       4 	.byte 3 	
      009C6A 4E 45 57                 5 	.ascii "NEW"
      009C6D 00 58                    6 	.word NEW_IDX 
      001BEF                       4932 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      009C6F 9C 69                    1 	.word LINK 
                           001BF1     2 	LINK=.
      009C71                          3 MULDIV:
      009C71 46                       4 	.byte 6+F_IFUNC 	
      009C72 4D 55 4C 44 49 56        5 	.ascii "MULDIV"
      009C78 00 54                    6 	.word MULDIV_IDX 
      001BFA                       4933 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      009C7A 9C 71                    1 	.word LINK 
                           001BFC     2 	LINK=.
      009C7C                          3 LSHIFT:
      009C7C 46                       4 	.byte 6+F_IFUNC 	
      009C7D 4C 53 48 49 46 54        5 	.ascii "LSHIFT"
      009C83 00 52                    6 	.word LSHIFT_IDX 
      001C05                       4934 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      009C85 9C 7C                    1 	.word LINK 
                           001C07     2 	LINK=.
      009C87                          3 LOG:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009C87 43                       4 	.byte 3+F_IFUNC 	
      009C88 4C 4F 47                 5 	.ascii "LOG"
      009C8B 00 50                    6 	.word LOG_IDX 
      001C0D                       4935 	_dict_entry 4,LIST,LIST_IDX;list
      009C8D 9C 87                    1 	.word LINK 
                           001C0F     2 	LINK=.
      009C8F                          3 LIST:
      009C8F 04                       4 	.byte 4 	
      009C90 4C 49 53 54              5 	.ascii "LIST"
      009C94 00 4E                    6 	.word LIST_IDX 
      001C16                       4936 	_dict_entry 3,LET,LET_IDX;let 
      009C96 9C 8F                    1 	.word LINK 
                           001C18     2 	LINK=.
      009C98                          3 LET:
      009C98 03                       4 	.byte 3 	
      009C99 4C 45 54                 5 	.ascii "LET"
      009C9C 00 4C                    6 	.word LET_IDX 
      001C1E                       4937 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      009C9E 9C 98                    1 	.word LINK 
                           001C20     2 	LINK=.
      009CA0                          3 KEY:
      009CA0 43                       4 	.byte 3+F_IFUNC 	
      009CA1 4B 45 59                 5 	.ascii "KEY"
      009CA4 00 4A                    6 	.word KEY_IDX 
      001C26                       4938 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      009CA6 9C A0                    1 	.word LINK 
                           001C28     2 	LINK=.
      009CA8                          3 IWDGREF:
      009CA8 07                       4 	.byte 7 	
      009CA9 49 57 44 47 52 45 46     5 	.ascii "IWDGREF"
      009CB0 00 48                    6 	.word IWDGREF_IDX 
      001C32                       4939 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      009CB2 9C A8                    1 	.word LINK 
                           001C34     2 	LINK=.
      009CB4                          3 IWDGEN:
      009CB4 06                       4 	.byte 6 	
      009CB5 49 57 44 47 45 4E        5 	.ascii "IWDGEN"
      009CBB 00 46                    6 	.word IWDGEN_IDX 
      001C3D                       4940 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      009CBD 9C B4                    1 	.word LINK 
                           001C3F     2 	LINK=.
      009CBF                          3 INVERT:
      009CBF 46                       4 	.byte 6+F_IFUNC 	
      009CC0 49 4E 56 45 52 54        5 	.ascii "INVERT"
      009CC6 00 44                    6 	.word INVERT_IDX 
      001C48                       4941 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      009CC8 9C BF                    1 	.word LINK 
                           001C4A     2 	LINK=.
      009CCA                          3 INPUT:
      009CCA 05                       4 	.byte 5 	
      009CCB 49 4E 50 55 54           5 	.ascii "INPUT"
      009CD0 00 42                    6 	.word INPUT_IDX 
      001C52                       4942 	_dict_entry,2,IF,IF_IDX;if 
      009CD2 9C CA                    1 	.word LINK 
                           001C54     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009CD4                          3 IF:
      009CD4 02                       4 	.byte 2 	
      009CD5 49 46                    5 	.ascii "IF"
      009CD7 00 40                    6 	.word IF_IDX 
      001C59                       4943 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      009CD9 9C D4                    1 	.word LINK 
                           001C5B     2 	LINK=.
      009CDB                          3 IDR:
      009CDB 43                       4 	.byte 3+F_IFUNC 	
      009CDC 49 44 52                 5 	.ascii "IDR"
      009CDF 00 3E                    6 	.word IDR_IDX 
      001C61                       4944 	_dict_entry,3,HEX,HEX_IDX;hex_base
      009CE1 9C DB                    1 	.word LINK 
                           001C63     2 	LINK=.
      009CE3                          3 HEX:
      009CE3 03                       4 	.byte 3 	
      009CE4 48 45 58                 5 	.ascii "HEX"
      009CE7 00 3C                    6 	.word HEX_IDX 
      001C69                       4945 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      009CE9 9C E3                    1 	.word LINK 
                           001C6B     2 	LINK=.
      009CEB                          3 GPIO:
      009CEB 44                       4 	.byte 4+F_IFUNC 	
      009CEC 47 50 49 4F              5 	.ascii "GPIO"
      009CF0 00 3A                    6 	.word GPIO_IDX 
      001C72                       4946 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      009CF2 9C EB                    1 	.word LINK 
                           001C74     2 	LINK=.
      009CF4                          3 GOTO:
      009CF4 04                       4 	.byte 4 	
      009CF5 47 4F 54 4F              5 	.ascii "GOTO"
      009CF9 00 38                    6 	.word GOTO_IDX 
      001C7B                       4947 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      009CFB 9C F4                    1 	.word LINK 
                           001C7D     2 	LINK=.
      009CFD                          3 GOSUB:
      009CFD 05                       4 	.byte 5 	
      009CFE 47 4F 53 55 42           5 	.ascii "GOSUB"
      009D03 00 36                    6 	.word GOSUB_IDX 
      001C85                       4948 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      009D05 9C FD                    1 	.word LINK 
                           001C87     2 	LINK=.
      009D07                          3 FREE:
      009D07 44                       4 	.byte 4+F_IFUNC 	
      009D08 46 52 45 45              5 	.ascii "FREE"
      009D0C 00 96                    6 	.word FREE_IDX 
      001C8E                       4949 	_dict_entry,3,FOR,FOR_IDX;for 
      009D0E 9D 07                    1 	.word LINK 
                           001C90     2 	LINK=.
      009D10                          3 FOR:
      009D10 03                       4 	.byte 3 	
      009D11 46 4F 52                 5 	.ascii "FOR"
      009D14 00 34                    6 	.word FOR_IDX 
      001C96                       4950 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      009D16 9D 10                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                           001C98     2 	LINK=.
      009D18                          3 FCPU:
      009D18 04                       4 	.byte 4 	
      009D19 46 43 50 55              5 	.ascii "FCPU"
      009D1D 00 32                    6 	.word FCPU_IDX 
      001C9F                       4951 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      009D1F 9D 18                    1 	.word LINK 
                           001CA1     2 	LINK=.
      009D21                          3 ERASE:
      009D21 05                       4 	.byte 5 	
      009D22 45 52 41 53 45           5 	.ascii "ERASE"
      009D27 00 30                    6 	.word ERASE_IDX 
      001CA9                       4952 	_dict_entry,3,END,END_IDX;cmd_end  
      009D29 9D 21                    1 	.word LINK 
                           001CAB     2 	LINK=.
      009D2B                          3 END:
      009D2B 03                       4 	.byte 3 	
      009D2C 45 4E 44                 5 	.ascii "END"
      009D2F 00 2E                    6 	.word END_IDX 
      001CB1                       4953 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      009D31 9D 2B                    1 	.word LINK 
                           001CB3     2 	LINK=.
      009D33                          3 EEPROM:
      009D33 46                       4 	.byte 6+F_IFUNC 	
      009D34 45 45 50 52 4F 4D        5 	.ascii "EEPROM"
      009D3A 00 2C                    6 	.word EEPROM_IDX 
      001CBC                       4954 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      009D3C 9D 33                    1 	.word LINK 
                           001CBE     2 	LINK=.
      009D3E                          3 DWRITE:
      009D3E 06                       4 	.byte 6+F_CMD 	
      009D3F 44 57 52 49 54 45        5 	.ascii "DWRITE"
      009D45 00 2A                    6 	.word DWRITE_IDX 
      001CC7                       4955 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      009D47 9D 3E                    1 	.word LINK 
                           001CC9     2 	LINK=.
      009D49                          3 DREAD:
      009D49 45                       4 	.byte 5+F_IFUNC 	
      009D4A 44 52 45 41 44           5 	.ascii "DREAD"
      009D4F 00 28                    6 	.word DREAD_IDX 
      001CD1                       4956 	_dict_entry,2,DO,DO_IDX;do_loop
      009D51 9D 49                    1 	.word LINK 
                           001CD3     2 	LINK=.
      009D53                          3 DO:
      009D53 02                       4 	.byte 2 	
      009D54 44 4F                    5 	.ascii "DO"
      009D56 00 26                    6 	.word DO_IDX 
      001CD8                       4957 	_dict_entry,3,DEC,DEC_IDX;dec_base
      009D58 9D 53                    1 	.word LINK 
                           001CDA     2 	LINK=.
      009D5A                          3 DEC:
      009D5A 03                       4 	.byte 3 	
      009D5B 44 45 43                 5 	.ascii "DEC"
      009D5E 00 24                    6 	.word DEC_IDX 
      001CE0                       4958 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009D60 9D 5A                    1 	.word LINK 
                           001CE2     2 	LINK=.
      009D62                          3 DDR:
      009D62 43                       4 	.byte 3+F_IFUNC 	
      009D63 44 44 52                 5 	.ascii "DDR"
      009D66 00 22                    6 	.word DDR_IDX 
      001CE8                       4959 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      009D68 9D 62                    1 	.word LINK 
                           001CEA     2 	LINK=.
      009D6A                          3 DATALN:
      009D6A 06                       4 	.byte 6 	
      009D6B 44 41 54 41 4C 4E        5 	.ascii "DATALN"
      009D71 00 20                    6 	.word DATALN_IDX 
      001CF3                       4960 	_dict_entry,4,DATA,DATA_IDX;data  
      009D73 9D 6A                    1 	.word LINK 
                           001CF5     2 	LINK=.
      009D75                          3 DATA:
      009D75 04                       4 	.byte 4 	
      009D76 44 41 54 41              5 	.ascii "DATA"
      009D7A 00 1E                    6 	.word DATA_IDX 
      001CFC                       4961 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      009D7C 9D 75                    1 	.word LINK 
                           001CFE     2 	LINK=.
      009D7E                          3 CRL:
      009D7E 43                       4 	.byte 3+F_IFUNC 	
      009D7F 43 52 4C                 5 	.ascii "CRL"
      009D82 00 1C                    6 	.word CRL_IDX 
      001D04                       4962 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      009D84 9D 7E                    1 	.word LINK 
                           001D06     2 	LINK=.
      009D86                          3 CRH:
      009D86 43                       4 	.byte 3+F_IFUNC 	
      009D87 43 52 48                 5 	.ascii "CRH"
      009D8A 00 1A                    6 	.word CRH_IDX 
      001D0C                       4963 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      009D8C 9D 86                    1 	.word LINK 
                           001D0E     2 	LINK=.
      009D8E                          3 CHAR:
      009D8E 84                       4 	.byte 4+F_CFUNC 	
      009D8F 43 48 41 52              5 	.ascii "CHAR"
      009D93 00 18                    6 	.word CHAR_IDX 
      001D15                       4964 	_dict_entry,3,BYE,BYE_IDX;bye 
      009D95 9D 8E                    1 	.word LINK 
                           001D17     2 	LINK=.
      009D97                          3 BYE:
      009D97 03                       4 	.byte 3 	
      009D98 42 59 45                 5 	.ascii "BYE"
      009D9B 00 16                    6 	.word BYE_IDX 
      001D1D                       4965 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      009D9D 9D 97                    1 	.word LINK 
                           001D1F     2 	LINK=.
      009D9F                          3 BTOGL:
      009D9F 05                       4 	.byte 5 	
      009DA0 42 54 4F 47 4C           5 	.ascii "BTOGL"
      009DA5 00 14                    6 	.word BTOGL_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      001D27                       4966 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      009DA7 9D 9F                    1 	.word LINK 
                           001D29     2 	LINK=.
      009DA9                          3 BTEST:
      009DA9 45                       4 	.byte 5+F_IFUNC 	
      009DAA 42 54 45 53 54           5 	.ascii "BTEST"
      009DAF 00 12                    6 	.word BTEST_IDX 
      001D31                       4967 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      009DB1 9D A9                    1 	.word LINK 
                           001D33     2 	LINK=.
      009DB3                          3 BSET:
      009DB3 04                       4 	.byte 4 	
      009DB4 42 53 45 54              5 	.ascii "BSET"
      009DB8 00 10                    6 	.word BSET_IDX 
      001D3A                       4968 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      009DBA 9D B3                    1 	.word LINK 
                           001D3C     2 	LINK=.
      009DBC                          3 BRES:
      009DBC 04                       4 	.byte 4 	
      009DBD 42 52 45 53              5 	.ascii "BRES"
      009DC1 00 0E                    6 	.word BRES_IDX 
      001D43                       4969 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      009DC3 9D BC                    1 	.word LINK 
                           001D45     2 	LINK=.
      009DC5                          3 BIT:
      009DC5 43                       4 	.byte 3+F_IFUNC 	
      009DC6 42 49 54                 5 	.ascii "BIT"
      009DC9 00 0C                    6 	.word BIT_IDX 
      001D4B                       4970 	_dict_entry,3,AWU,AWU_IDX;awu 
      009DCB 9D C5                    1 	.word LINK 
                           001D4D     2 	LINK=.
      009DCD                          3 AWU:
      009DCD 03                       4 	.byte 3 	
      009DCE 41 57 55                 5 	.ascii "AWU"
      009DD1 00 0A                    6 	.word AWU_IDX 
      001D53                       4971 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      009DD3 9D CD                    1 	.word LINK 
                           001D55     2 	LINK=.
      009DD5                          3 ASC:
      009DD5 43                       4 	.byte 3+F_IFUNC 	
      009DD6 41 53 43                 5 	.ascii "ASC"
      009DD9 00 08                    6 	.word ASC_IDX 
      001D5B                       4972 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      009DDB 9D D5                    1 	.word LINK 
                           001D5D     2 	LINK=.
      009DDD                          3 AND:
      009DDD 43                       4 	.byte 3+F_IFUNC 	
      009DDE 41 4E 44                 5 	.ascii "AND"
      009DE1 00 06                    6 	.word AND_IDX 
      001D63                       4973 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      009DE3 9D DD                    1 	.word LINK 
                           001D65     2 	LINK=.
      009DE5                          3 ADCREAD:
      009DE5 47                       4 	.byte 7+F_IFUNC 	
      009DE6 41 44 43 52 45 41 44     5 	.ascii "ADCREAD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal  00-Bits]



      009DEE 04 9D                    6 	.word ADCREAD_IDX 
      001D6F                       4974 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      009DF0 E5 65                    1 	.word LINK 
                           001D71     2 	LINK=.
      009DF1                          3 ADCON:
      009DF1 05                       4 	.byte 5 	
      009DF2 41 44 43 4F 4E           5 	.ascii "ADCON"
      009DF7 00 02                    6 	.word ADCON_IDX 
      009DF9                       4975 kword_dict::
      001D79                       4976 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      009DF9 9D F1                    1 	.word LINK 
                           001D7B     2 	LINK=.
      009DFB                          3 ABS:
      009DFB 43                       4 	.byte 3+F_IFUNC 	
      009DFC 41 42 53                 5 	.ascii "ABS"
      009DFF 00 00                    6 	.word ABS_IDX 
                                   4977 
                                   4978 ;comands and fonctions address table 	
      009E01                       4979 code_addr::
      009E01 95 B9 92 AD 92 E9 95  4980 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             CD 94 AA 95 6A 98 1B
      009E0F 90 3B 90 2B 90 5C 90  4981 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             4C 95 43 94 98 98 D5
      009E1D 98 CF 98 ED 98 F3 98  4982 	.word const_cr1,data,data_line,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             C9 8D F4 98 44 93 1D
             93 4D
      009E2D 98 E7 92 59 94 32 96  4983 	.word const_eeprom_base,cmd_end,erase,fcpu,for,gosub,goto,gpio ; 24..31 
             47 90 B7 91 C2 91 A7
             94 E6
      009E3D 8D EF 98 C3 90 A3 8F  4984 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             90 98 35 97 C5 97 FB
             94 D1
      009E4D 8E 43 8E 6E 98 00 96  4985 	.word let,list,log2,lshift,muldiv,next,new ; 40..47
             15 8B 93 91 37 93 D4
      009E5B 97 B8 98 BD 95 E5 9A  4986 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             81 95 57 96 53 90 92
             98 E1
      009E6B 90 83 98 DB 8F 0A 98  4987 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             87 98 8D 98 93 98 99
             98 9F
      009E7B 98 A5 98 AB 98 B1 98  4988 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             B7 94 D9 99 70 84 EF
             90 00
      009E8B 99 21 91 E2 96 CF 96  4989 	.word restore,return, random,rshift,run,show,free ; 72..79
             2E 92 00 8D AE 8D F9
      009E99 95 4C 9A 62 99 CA 9A  4990 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             6A 9A 42 91 10 93 88
             95 B3
      009EA9 97 9C 97 AB 90 E0 92  4991 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             69 8E 21 95 10 98 59
             95 26
      009EB9 90 06 97 36 94 61 95  4992 	.word wait,words,write,bit_xor ; 96..99
             FD
      009EC1 00 00                 4993 	.word 0 
                                   4994 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009F00                       4995 	.bndry 128 ; align on FLASH block.
                                   4996 ; space for user application  
      009F00                       4997 app_space:
      009F00 42 43                 4998 app_sign: .ascii "BC"  ; signature 
      009F02 00 29                 4999 app_size:  .word 41
      009F04                       5000 app: ;  BASIC byte code for blink.bas application.
                                   5001 ; 10 do btogl $500a,32 pause 250 until qkey bres $500a,32 end 
      009F04 00 0A 29 80 00 26 80  5002 .byte 0,10,41,128,0,38,128,0,20,132,80,10,9,132,0,32,128,0,98,132
             00 14 84 50 0A 09 84
             00 20 80 00 62 84
      009F18 00 FA 80 00 B4 81 00  5003 .byte 0,250,128,0,180,129,0,130,128,0,14,132,80,10,9,132,0,32,128,0,46,0
             82 80 00 0E 84 50 0A
             09 84 00 20 80 00 2E
             00
                                   5004 
                                   5005 
                                   5006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        001D7B R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   5 ADCON      001D71 R
    ADCON_ID=  000002     |   5 ADCREAD    001D65 R   |     ADCREAD_=  000004 
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
  5 AND        001D5D R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |   5 ASC        001D55 R   |     ASC_IDX =  000008 
    AUTORUN_=  004000     |   5 AWU        001D4D R   |   5 AWUHandl   000001 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_CSR_=  000004 
    AWU_IDX =  00000A     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |     BASE    =  000002 
    BCNT    =  000001     |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |     BELL    =  000007 
  5 BIT        001D45 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BIT_IDX =  00000C     |     BLOCK   =  000001     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000B 
  5 BRES       001D3C R   |     BRES_IDX=  00000E     |     BS      =  000008 
    BSAVE   =  000001     |   5 BSET       001D33 R   |     BSET_IDX=  000010 
    BSIZE   =  000005     |   5 BTEST      001D29 R   |     BTEST_ID=  000012 
  5 BTOGL      001D1F R   |     BTOGL_ID=  000014     |     BTW     =  000001 
  5 BYE        001D17 R   |     BYE_IDX =  000016     |     CAN     =  000018 
    CAN_DGR =  005426     |     CAN_FPSR=  005427     |     CAN_IER =  005425 
    CAN_MCR =  005420     |     CAN_MSR =  005421     |     CAN_P0  =  005428 
    CAN_P1  =  005429     |     CAN_P2  =  00542A     |     CAN_P3  =  00542B 
    CAN_P4  =  00542C     |     CAN_P5  =  00542D     |     CAN_P6  =  00542E 
    CAN_P7  =  00542F     |     CAN_P8  =  005430     |     CAN_P9  =  005431 
    CAN_PA  =  005432     |     CAN_PB  =  005433     |     CAN_PC  =  005434 
    CAN_PD  =  005435     |     CAN_PE  =  005436     |     CAN_PF  =  005437 
    CAN_RFR =  005424     |     CAN_TPR =  005423     |     CAN_TSR =  005422 
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELL_SIZ=  000002     |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       001D0E R
    CHAR_IDX=  000018     |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

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
    CLK_SWR_=  0000D2     |     CMD_END =  000002     |     CNT     =  000006 
    CNTR    =  000003     |     COMMA   =  000001     |     COUNT   =  000001 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  5 CRH        001D06 R   |     CRH_IDX =  00001A     |   5 CRL        001CFE R
    CRL_IDX =  00001C     |     CTRL_A  =  000001     |     CTRL_B  =  000002 
    CTRL_C  =  000003     |     CTRL_D  =  000004     |     CTRL_E  =  000005 
    CTRL_F  =  000006     |     CTRL_G  =  000007     |     CTRL_H  =  000008 
    CTRL_I  =  000009     |     CTRL_J  =  00000A     |     CTRL_K  =  00000B 
    CTRL_L  =  00000C     |     CTRL_M  =  00000D     |     CTRL_N  =  00000E 
    CTRL_O  =  00000F     |     CTRL_P  =  000010     |     CTRL_Q  =  000011 
    CTRL_R  =  000012     |     CTRL_S  =  000013     |     CTRL_T  =  000014 
    CTRL_U  =  000015     |     CTRL_V  =  000016     |     CTRL_W  =  000017 
    CTRL_X  =  000018     |     CTRL_Y  =  000019     |     CTRL_Z  =  00001A 
    CTXT_SIZ=  000004     |     CTX_BPTR=  000001     |     CTX_COUN=  000004 
    CTX_IN  =  000003     |     CVAR    =  000007     |     CX_BPTR =  000001 
    CX_CNT  =  000004     |     CX_IN   =  000003     |   5 DATA       001CF5 R
  5 DATALN     001CEA R   |     DATALN_I=  000020     |     DATA_IDX=  00001E 
    DBG_A   =  000005     |     DBG_CC  =  000006     |     DBG_X   =  000003 
    DBG_Y   =  000001     |     DBL     =  000003     |     DBLDIVDN=  000006 
    DBLHI   =  000001     |     DBLLO   =  000003     |     DBL_SIZE=  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   5 DDR        001CE2 R   |     DDR_IDX =  000022 
    DEBUG   =  000000     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
    DEBUG_PR=  000001     |   5 DEC        001CDA R   |     DEC_IDX =  000024 
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
    DM_ENFCT=  007F9A     |   5 DO         001CD3 R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  000026     |   5 DREAD      001CC9 R
    DREAD_ID=  000028     |   5 DWRITE     001CBE R   |     DWRITE_I=  00002A 
  5 EEPROM     001CB3 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002C     |     EEPROM_S=  000800     |     EM      =  000019 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

  5 END        001CAB R   |     END_IDX =  00002E     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   5 ERASE      001CA1 R
    ERASE_ID=  000030     |     ERR_BAD_=  00000A     |     ERR_BUF_=  00000F 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FAUTORUN=  000006     |     FBREAK  =  000004 
    FCOMP   =  000005     |   5 FCPU       001C98 R   |     FCPU_IDX=  000032 
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
    FLSI    =  01F400     |   5 FOR        001C90 R   |     FOR_IDX =  000034 
  5 FREE       001C87 R   |     FREE_IDX=  000096     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   5 GOSUB      001C7D R
    GOSUB_ID=  000036     |   5 GOTO       001C74 R   |     GOTO_IDX=  000038 
  5 GPIO       001C6B R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_IDX=  00003A     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   5 HEX        001C63 R   |     HEX_IDX =  00003C 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

    I2C_SR2_=  000003     |     I2C_SR2_=  000005     |     I2C_SR3 =  005219 
    I2C_SR3_=  000001     |     I2C_SR3_=  000007     |     I2C_SR3_=  000004 
    I2C_SR3_=  000000     |     I2C_SR3_=  000002     |     I2C_TRIS=  00521D 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_WRIT=  000000     |   5 IDR        001C5B R   |     IDR_IDX =  00003E 
  5 IF         001C54 R   |     IF_IDX  =  000040     |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   5 INPUT      001C4A R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_ID=  000042     |     INPUT_PU=  000001     |     INT_ADC2=  000016 
    INT_AUAR=  000012     |     INT_AWU =  000001     |     INT_CAN_=  000008 
    INT_CAN_=  000009     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
    INT_EXTI=  000007     |     INT_FLAS=  000018     |     INT_I2C =  000013 
    INT_SPI =  00000A     |     INT_TIM1=  00000C     |     INT_TIM1=  00000B 
    INT_TIM2=  00000E     |     INT_TIM2=  00000D     |     INT_TIM3=  000010 
    INT_TIM3=  00000F     |     INT_TIM4=  000017     |     INT_TLI =  000000 
    INT_UART=  000011     |     INT_UART=  000015     |     INT_UART=  000014 
    INT_VECT=  008060     |     INT_VECT=  00800C     |     INT_VECT=  008028 
    INT_VECT=  00802C     |     INT_VECT=  008010     |     INT_VECT=  008014 
    INT_VECT=  008018     |     INT_VECT=  00801C     |     INT_VECT=  008020 
    INT_VECT=  008024     |     INT_VECT=  008068     |     INT_VECT=  008054 
    INT_VECT=  008000     |     INT_VECT=  008030     |     INT_VECT=  008038 
    INT_VECT=  008034     |     INT_VECT=  008040     |     INT_VECT=  00803C 
    INT_VECT=  008048     |     INT_VECT=  008044     |     INT_VECT=  008064 
    INT_VECT=  008008     |     INT_VECT=  008004     |     INT_VECT=  008050 
    INT_VECT=  00804C     |     INT_VECT=  00805C     |     INT_VECT=  008058 
  5 INVERT     001C3F R   |     INVERT_I=  000044     |     INW     =  000009 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     001C34 R
    IWDGEN_I=  000046     |   5 IWDGREF    001C28 R   |     IWDGREF_=  000048 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        001C20 R   |     KEY_IDX =  00004A     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   5 LET        001C18 R
    LET_IDX =  00004C     |     LF      =  00000A     |     LIMIT   =  000005 
  5 LINK    =  001D7B R   |   5 LIST       001C0F R   |     LIST_IDX=  00004E 
    LLEN    =  000002     |     LN_PTR  =  000005     |   5 LOG        001C07 R
    LOG_IDX =  000050     |   5 LSHIFT     001BFC R   |     LSHIFT_I=  000052 
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MAX_LINE=  007FFF     |     MINOR   =  000002     |   5 MULDIV     001BF1 R
    MULDIV_I=  000054     |     MULOP   =  000003     |     N1      =  000001 
    N2      =  000003     |     NAFR    =  004804     |     NAK     =  000015 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        001BE9 R
    NEW_IDX =  000058     |   5 NEXT       001BE0 R   |     NEXT_IDX=  000056 
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   5 NOT        001BD8 R
    NOT_IDX =  00005A     |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R   |   5 ODR        001BD0 R
    ODR_IDX =  00005C     |     ONOFF   =  000003     |     OP      =  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   5 OR         001BC9 R   |     OR_IDX  =  00005E 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |   5 PAD        001BC1 R
    PAD_IDX =  000060     |     PAD_SIZE=  000080     |   5 PAUSE      001BB7 R
    PAUSE_ID=  000062     |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   5 PEEK       001BAE R
    PEEK_IDX=  000066     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       001BA5 R   |     PINP_IDX=  000068     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  5 PMODE      001B9B R   |     PMODE_ID=  000064     |   5 POKE       001B92 R
    POKE_IDX=  00006A     |     PORT    =  000003     |   5 POUT       001B89 R
    POUT_IDX=  00006C     |   5 PRINT      001B7F R   |   5 PRTA       001B76 R
    PRTA_IDX=  000070     |   5 PRTB       001B6D R   |     PRTB_IDX=  000072 
  5 PRTC       001B64 R   |     PRTC_IDX=  000074     |   5 PRTD       001B5B R
    PRTD_IDX=  000076     |   5 PRTE       001B52 R   |     PRTE_IDX=  000078 
  5 PRTF       001B49 R   |     PRTF_IDX=  00007A     |   5 PRTG       001B40 R
    PRTG_IDX=  00007C     |   5 PRTH       001B37 R   |     PRTH_IDX=  00007E 
  5 PRTI       001B2E R   |     PRTI_IDX=  000080     |     PRT_IDX =  00006E 
    PSTR    =  000003     |   5 QKEY       001B25 R   |     QKEY_IDX=  000082 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
    RBT_IDX =  000086     |   5 READ       001B1C R   |     READ_IDX=  000084 
  5 REBOOT     001B11 R   |     REG     =  000001     |     REGA    =  000001 
    REGX    =  000003     |     REGY    =  000005     |     RELOP   =  000003 
  5 REMARK     001B06 R   |     REM_IDX =  000088     |   5 RESTORE    001AFA R
    REST_IDX=  00008A     |     RETL1   =  000001     |   5 RETURN     001AEF R
    RET_ADDR=  000003     |     RET_IDX =  00008C     |     RET_INW =  000005 
  5 RND        001AE7 R   |     RND_IDX =  00008E     |     ROP     =  004800 
    RS      =  00001E     |   5 RSHIFT     001ADC R   |     RSHIFT_I=  000090 
    RST_SR  =  0050B3     |   5 RUN        001AD4 R   |     RUN_IDX =  000092 
    RX_QUEUE=  000008     |     SAVEB   =  000002     |     SDIVSR  =  000005 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       001ACB R   |     SHOW_IDX=  000094     |     SI      =  00000F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

    SIGN    =  000001     |     SKIP    =  000005     |   5 SLEEP      001AC1 R
    SLEEP_ID=  000098     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   5 SPIEN      001AB7 R   |     SPIEN_ID=  00009C 
  5 SPIRD      001AAD R   |     SPIRD_ID=  00009A     |   5 SPISEL     001AA2 R
    SPISEL_I=  00009E     |   5 SPIWR      001A98 R   |     SPIWR_ID=  0000A0 
    SPI_CR1 =  005200     |     SPI_CR1_=  000003     |     SPI_CR1_=  000000 
    SPI_CR1_=  000001     |     SPI_CR1_=  000007     |     SPI_CR1_=  000002 
    SPI_CR1_=  000006     |     SPI_CR2 =  005201     |     SPI_CR2_=  000007 
    SPI_CR2_=  000006     |     SPI_CR2_=  000005     |     SPI_CR2_=  000004 
    SPI_CR2_=  000002     |     SPI_CR2_=  000000     |     SPI_CR2_=  000001 
    SPI_CRCP=  005205     |     SPI_CS_B=  000005     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_SR_B=  000007     |     SPI_SR_C=  000004     |     SPI_SR_M=  000005 
    SPI_SR_O=  000006     |     SPI_SR_R=  000000     |     SPI_SR_T=  000001 
    SPI_SR_W=  000003     |     SPI_TXCR=  005207     |     SQUOT   =  000006 
    STACK_EM=  0017FF     |     STACK_SI=  0000A0     |   5 STEP       001A8F R
    STEP_IDX=  0000A2     |   5 STOP       001A86 R   |     STOP_IDX=  0000A4 
    STX     =  000002     |     SUB     =  00001A     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      001A7C R   |     TICKS_ID=  0000A6 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR_=  000000     |   5 TIMEOUT    001A70 R   |   5 TIMER      001A66 R
    TIMER_ID=  0000A8     |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
    TK_ARRAY=  000006     |     TK_CFUNC=  000082     |     TK_CHAR =  000003 
    TK_CMD  =  000080     |     TK_COLON=  00000B     |     TK_COMMA=  000009 
    TK_CONST=  000083     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_IFUNC=  000081     |     TK_INTGR=  000084 
    TK_LE   =  000036     |     TK_LPARE=  000007     |     TK_LT   =  000034 
    TK_MINUS=  000011     |     TK_MOD  =  000022     |     TK_MULT =  000020 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Symbol Table

    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_PLUS =  000010 
    TK_QSTR =  000002     |     TK_RPARE=  000008     |     TK_SHARP=  00000A 
    TK_VAR  =  000085     |     TMROUT_I=  0000AA     |   5 TO         001A5F R
  5 TONE       001A56 R   |     TONE_IDX=  0000AE     |     TO_IDX  =  0000AC 
  5 Timer4Up   000040 R   |     U1      =  000001     |     U8      =  000003 
    UART1   =  000000     |     UART1_BA=  005230     |     UART1_BR=  005232 
    UART1_BR=  005233     |     UART1_CR=  005234     |     UART1_CR=  005235 
    UART1_CR=  005236     |     UART1_CR=  005237     |     UART1_CR=  005238 
    UART1_DR=  005231     |     UART1_GT=  005239     |     UART1_PO=  000000 
    UART1_PS=  00523A     |     UART1_RX=  000004     |     UART1_SR=  005230 
    UART1_TX=  000005     |     UART2   =  000001     |     UART3   =  000002 
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
  5 UBOUND     001A4B R   |     UBOUND_I=  0000B0     |   5 UBTN_Han   000079 R
  5 UFLASH     001A40 R   |     UFLASH_I=  0000B2     |   5 UNTIL      001A36 R
    UNTIL_ID=  0000B4     |     US      =  00001F     |   5 USER_ABO   00008C R
  5 USR        001A2E R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000B6     |   5 Uart1RxH   00000F R
  5 UserButt   000055 R   |     VAR_ADDR=  000006     |     VSIZ    =  000002 
    VSIZE   =  000006     |     VT      =  00000B     |   5 WAIT       001A25 R
    WAIT_IDX=  0000B8     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WLEN    =  000001     |   5 WORDS      001A1B R
    WORDS_ID=  0000BA     |   5 WRITE      001A11 R   |     WRITE_ID=  0000BC 
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   5 XOR        001A09 R
    XOR_IDX =  0000BE     |     XREG    =  000003     |     XSAVE   =  000005 
    YSAVE   =  000004     |   5 abs        001539 R   |   1 acc16      00000C GR
  1 acc24      00000B GR  |   1 acc8       00000D GR  |   5 analog_r   001269 R
  5 app        001E84 R   |   5 app_sign   001E80 R   |   5 app_size   001E82 R
  5 app_spac   001E80 R   |   5 arduino_   00162F R   |   5 arg_list   000B8E R
  1 array_si   00001E R   |   5 ascii      00142A R   |   5 atoi24     000948 GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Symbol Table

  5 atoi_exi   0009AE R   |   5 awu        0014EA R   |   5 awu02      0014F4 R
  5 bad_port   00148B R   |   1 base       00000A GR  |   1 basicptr   000004 GR
  5 beep       0011F6 R   |   5 beep_1kh   0011E0 GR  |   5 bit_and    00154D R
  5 bit_or     001565 R   |   5 bit_rese   000FBB R   |   5 bit_set    000FAB R
  5 bit_test   000FDC R   |   5 bit_togg   000FCC R   |   5 bit_xor    00157D R
  5 bitmask    00179B R   |   5 block_er   0001AD R   |   5 break_po   001336 R
  5 bye        0014C3 R   |   5 char       001418 R   |   5 clear_ba   000551 R
  5 clear_va   0003F8 R   |   5 clock_in   0000A7 R   |   5 cmd_end    0011D9 R
  5 cmd_line   00076E R   |   5 code_add   001D81 GR  |   5 cold_sta   00046F R
  5 comp_msg   0006C6 R   |     compile    ****** GX  |   5 const_cr   00184F R
  5 const_cr   001855 R   |   5 const_dd   001849 R   |   5 const_ee   001867 R
  5 const_id   001843 R   |   5 const_in   001861 R   |   5 const_od   00183D R
  5 const_ou   00185B R   |   5 const_po   001807 R   |   5 const_po   00180D R
  5 const_po   001813 R   |   5 const_po   001819 R   |   5 const_po   00181F R
  5 const_po   001825 R   |   5 const_po   00182B R   |   5 const_po   001831 R
  5 const_po   001837 R   |   1 count      000003 GR  |   5 cp_loop    000B3D R
  5 cs_high    0019FC R   |   5 cstk_pro   000D48 R   |   5 data       00186D R
  1 data_len   000009 R   |   5 data_lin   001873 R   |   1 data_ofs   000008 R
  1 data_ptr   000006 R   |   5 data_sea   0018B4 R   |   5 dbl_sign   000A97 R
  5 dec_base   000D74 R   |     decompil   ****** GX  |   5 digital_   00129D R
  5 digital_   0012CD R   |   5 div32_16   000AA1 R   |   5 divide     000AF8 R
  5 divu24_8   0008B7 R   |   5 dneg       000A8C R   |   5 do_loop    0017C4 R
  5 do_progr   0001A0 R   |   5 enable_i   001745 R   |   5 erase      0013B2 R
  5 erase_fl   0001CC R   |   5 err_bad_   000631 R   |   5 err_buf_   0006A7 R
  5 err_cmd_   0005F5 R   |   5 err_div0   0005BA R   |   5 err_dupl   00060F R
  5 err_math   0005A1 R   |   5 err_mem_   000586 R   |   5 err_msg    000566 R
  5 err_no_a   00063D R   |   5 err_no_d   000670 R   |   5 err_no_f   000694 R
  5 err_no_l   0005C9 R   |   5 err_no_p   000680 R   |   5 err_not_   000620 R
  5 err_run_   0005DF R   |   5 err_synt   000593 R   |   5 expect     000B7C R
  5 expr_exi   000CD3 R   |   5 expressi   000C8D R   |   5 factor     000BDE R
  1 farptr     000016 R   |   5 fcpu       0015C7 R   |   5 first_li   000E17 R
  1 flags      000020 GR  |   5 for        001037 R   |   5 free       000D79 R
  1 free_ram   000064 R   |   5 func_arg   000B89 R   |   5 func_not   001738 R
  5 get_arra   000BB9 R   |   5 get_targ   001101 R   |   5 get_tick   001533 R
    get_toke   ****** GX  |   5 getc       0002C2 GR  |   5 gosub      001142 R
  5 goto       001127 R   |   5 gpio       001466 R   |   5 hex_base   000D6F R
  5 hex_dump   00034F R   |   5 if         001023 R   |   1 in         000001 GR
  1 in.saved   000002 GR  |   1 in.w       000000 GR  |   5 incr_far   001379 R
  5 input_ex   000F7D R   |   5 input_lo   000F12 R   |   5 input_va   000F10 R
  5 interp_l   0007AF R   |   5 interpre   00078A R   |   5 invert     0017B5 R
  5 is_alnum   000420 GR  |   5 is_alpha   000406 GR  |   5 is_digit   000417 GR
  5 itoa       00084D GR  |   5 itoa_loo   000871 R   |   5 jp_to_ta   001135 R
  5 key        001451 R   |   5 kword_di   001D79 GR  |   5 kword_en   001A07 R
  5 leading_   00178B R   |   5 let        000DC3 GR  |   5 let_arra   000DD1 R
  5 let_var    000DD4 R   |   5 lines_sk   000E1A R   |   5 list       000DEE R
  5 list_exi   000E5C R   |   5 list_loo   000E3A R   |   5 log2       001780 R
  5 logical_   00172E R   |   5 long_div   000A74 R   |   5 loop_bac   0010E4 R
  1 loop_dep   00001D R   |   5 loop_don   0010F9 R   |   5 lshift     001595 R
  5 modulo     000B0E R   |   5 move       0003B6 GR  |   5 move_dow   0003D4 R
  5 move_era   000132 R   |   5 move_exi   0003F5 R   |   5 move_loo   0003D9 R
  5 move_prg   000166 R   |   5 move_up    0003C6 R   |   5 muldiv     000B13 R
  5 multiply   000A3F R   |   5 mulu24_8   0008DF R   |   5 neg_acc2   000919 R
  5 new        001354 R   |   5 next       0010B7 R   |   5 next_lin   000792 R
  5 next_tok   0007D6 GR  |   5 no_match   000B4F R   |   3 pad        0016E0 GR
  5 pad_ref    001A01 R   |   5 pause      0014D7 R   |   5 pause02    0014E1 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

  5 peek       001012 R   |   5 pin_mode   0015D3 R   |   5 poke       001003 R
  5 power_ad   00122D R   |   5 print      000E8A R   |   5 print_ex   000EE4 R
  5 print_in   000831 R   |   5 printxy    0009B2 R   |   5 program_   000146 R
  5 program_   000166 R   |   5 prt_basi   000E6A R   |   5 prt_loop   000E8E R
  5 prt_tok    0002E1 R   |   5 prti24     000841 R   |   1 ptr16      000017 GR
  1 ptr8       000018 R   |   5 putc       0002B2 GR  |     puts       ****** GX
  5 qgetc      0002BB GR  |   5 qkey       001459 GR  |   5 random     00164F R
  5 read       0018F0 R   |   5 read01     0018F2 R   |     readln     ****** GX
  5 refresh_   00177B R   |   5 rel_exit   000D2B R   |   5 relation   000CD6 R
  5 remark     000F80 GR  |   5 reset_co   000E8C R   |   5 rest_con   000F00 R
  5 restore    0018A1 R   |   5 return     001162 R   |     right_al   ****** GX
  5 row_alig   00135E R   |   5 row_eras   00010B R   |   5 row_eras   000132 R
  5 row_loop   000332 R   |   5 rshift     0015AE R   |   5 rt_msg     0006B4 R
  5 run        001180 R   |   5 run_it     0011B2 R   |   1 rx1_head   00002A R
  1 rx1_queu   000022 R   |   1 rx1_tail   00002B R   |   5 save_con   000EF0 R
  5 scan_blo   001387 R   |   5 search_d   000B2F GR  |   5 search_e   000B79 R
    search_l   ****** GX  |   5 search_n   000B33 R   |   1 seedx      000012 R
  1 seedy      000014 R   |   5 select_p   00161F R   |   5 set_time   00171C R
  5 show       000D2E R   |   5 show_row   000320 R   |   5 sleep      0014CC R
  5 software   000429 R   |     spaces     ****** GX  |   5 spi_clea   001995 R
  5 spi_disa   00197D R   |   5 spi_enab   00194A R   |   5 spi_rcv_   0019B7 R
  5 spi_read   0019E2 R   |   5 spi_sele   0019EA R   |   5 spi_send   0019A1 R
  5 spi_writ   0019C2 R   |   3 stack_fu   001760 GR  |   3 stack_un   001800 R
  5 step       001090 R   |   5 stop       001308 R   |   5 store_lo   0010A4 R
  5 str_matc   000B5C R   |   5 strcmp     000397 R   |   5 strcpy     0003A8 GR
  5 strlen     00038C GR  |   5 syntax_e   0006E7 GR  |   1 tab_widt   000021 GR
  5 tb_error   0006E9 GR  |   5 term       000C3B R   |   5 term01     000C43 R
  5 term_exi   000C8A R   |   3 tib        001690 GR  |   1 ticks      00000E R
  5 timeout    00172B R   |   1 timer      000010 GR  |   5 timer2_i   0000BD R
  5 timer4_i   0000CA R   |   5 tk_id      0006D7 R   |   5 to         001060 R
  5 to_eepro   000189 R   |   5 to_flash   00019D R   |   5 to_upper   00093C GR
  5 token_ms   000318 R   |   5 tone       0011E9 R   |   5 try_next   0018E0 R
  1 txtbgn     000019 GR  |   1 txtend     00001B GR  |   5 uart1_ge   0002C2 GR
  5 uart1_in   00026F R   |   5 uart1_pu   0002B2 GR  |   5 uart1_qg   0002BB GR
  5 uart1_se   00027F R   |   5 ubound     000DA1 R   |   5 udiv32_1   000A62 R
  5 uflash     001490 R   |   5 umstar     000A05 R   |   5 unlock_e   0000DF R
  5 unlock_f   0000F5 R   |   5 until      0017D9 R   |   5 user_int   000068 R
  5 usr        0014A6 R   |     var_name   ****** GX  |   1 vars       000030 GR
  5 wait       000F86 R   |   5 warm_ini   000533 R   |   5 warm_sta   00076B R
  5 words      0016B6 R   |   5 words_co   001706 R   |   5 write      0013E1 R
  5 write_bl   00024C R   |   5 write_by   0001D7 R   |   5 write_ee   000213 R
  5 write_ex   000247 R   |   5 write_fl   0001FD R   |   5 write_ro   00017A R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     64   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   1EAE   flags    0

