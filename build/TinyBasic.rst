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
                                     75 ; keep 'free_ram' as last variable 
                                     76 ; basic code compiled here. 
      000061                         77 	.bndry 16
      000061                         78 rsign: .blkw 1 ; "BC" 
      000063                         79 rsize: .blkw 1 ; code size 	 
      000065                         80 free_ram: ; from here RAM free for BASIC text 
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
      008000 82 00 84 FE             96     int cold_start			; RESET vector 
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
      008024 82 00 80 D5            109 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
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
      00805C 82 00 80 80            123 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80            124 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 C0            125 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
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
      00808F 72 0B 52 30 2B   [ 2]  165 	btjf UART1_SR,#UART_SR_RXNE,5$
      008094 C6 52 31         [ 1]  166 	ld a,UART1_DR 
      008097 A1 03            [ 1]  167 	cp a,#CTRL_C 
      008099 26 06            [ 1]  168 	jrne 2$
      00809B CD 83 41         [ 4]  169 	call putc 
      00809E CC 80 E8         [ 2]  170 	jp user_interrupted
      0080A1                        171 2$:
      0080A1 A1 18            [ 1]  172 	cp a,#CAN ; CTRL_X 
      0080A3 26 03            [ 1]  173 	jrne 3$
      0080A5 CC 84 FE         [ 2]  174 	jp cold_start 	
      0080A8 AE 00 23         [ 2]  175 3$:	ldw x,#rx1_queue  
      0080AB 88               [ 1]  176 	push a 
      0080AC 9F               [ 1]  177 	ld a,xl 
      0080AD CB 00 2C         [ 1]  178 	add a,rx1_tail 
      0080B0 97               [ 1]  179 	ld xl,a
      0080B1 84               [ 1]  180 	pop a  
      0080B2 F7               [ 1]  181 	ld (x),a
      0080B3 72 5C 00 2C      [ 1]  182 	inc rx1_tail 
      0080B7 A6 07            [ 1]  183 	ld a,#RX_QUEUE_SIZE-1
      0080B9 C4 00 2C         [ 1]  184 	and a,rx1_tail 
      0080BC C7 00 2C         [ 1]  185 	ld rx1_tail,a  
      0080BF                        186 5$:
      0080BF 80               [11]  187 	iret 
                                    188 
                                    189 ;------------------------------------
                                    190 ; software interrupt handler  
                                    191 ;------------------------------------
                           000000   192 .if DEBUG 
                                    193 TrapHandler:
                                    194 	bset flags,#FTRAP 
                                    195 	call print_registers
                                    196 	call cmd_itf
                                    197 	bres flags,#FTRAP 	
                                    198 	iret
                                    199 .endif 
                                    200 
                                    201 ;------------------------------
                                    202 ; TIMER 4 is used to maintain 
                                    203 ; a milliseconds 'ticks' counter
                                    204 ; and decrement 'timer' varaiable
                                    205 ;--------------------------------
      0080C0                        206 Timer4UpdateHandler:
      0080C0 72 5F 53 42      [ 1]  207 	clr TIM4_SR 
      0080C4 CE 00 0F         [ 2]  208 	ldw x,ticks
      0080C7 5C               [ 1]  209 	incw x
      0080C8 CF 00 0F         [ 2]  210 	ldw ticks,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080CB CE 00 11         [ 2]  211 	ldw x,timer
                                    212 ;	tnzw x 
      0080CE 27 04            [ 1]  213 	jreq 1$
      0080D0 5A               [ 2]  214 	decw x 
      0080D1 CF 00 11         [ 2]  215 	ldw timer,x 
      0080D4                        216 1$:	
      0080D4 80               [11]  217 	iret 
                                    218 
                                    219 
                                    220 ;------------------------------------
                                    221 ; Triggered by pressing USER UserButton 
                                    222 ; on NUCLEO card.
                                    223 ; This is used to abort a progam lock 
                                    224 ; in infinite loop. 
                                    225 ;------------------------------------
      0080D5                        226 UserButtonHandler:
                                    227 ; wait button release
      0080D5 5F               [ 1]  228 	clrw x
      0080D6 5A               [ 2]  229 1$: decw x 
      0080D7 26 FD            [ 1]  230 	jrne 1$
      0080D9 72 09 50 15 F8   [ 2]  231 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    232 ; if MCU suspended by SLEEP resume program
      0080DE 72 07 00 21 05   [ 2]  233     btjf flags,#FSLEEP,2$
      0080E3 72 17 00 21      [ 1]  234 	bres flags,#FSLEEP 
      0080E7 80               [11]  235 	iret
      0080E8                        236 2$:	
      0080E8                        237 user_interrupted:
      0080E8 72 00 00 21 02   [ 2]  238     btjt flags,#FRUN,4$
      0080ED 20 0A            [ 2]  239 	jra UBTN_Handler_exit 
      0080EF                        240 4$:	; program interrupted by user 
      0080EF 72 11 00 21      [ 1]  241 	bres flags,#FRUN 
      0080F3 AE 81 0C         [ 2]  242 	ldw x,#USER_ABORT
      0080F6 CD A0 74         [ 4]  243 	call puts 
      0080F9                        244 UBTN_Handler_exit:
      0080F9 AE 17 FF         [ 2]  245     ldw x,#STACK_EMPTY 
      0080FC 94               [ 1]  246     ldw sp,x
      0080FD 9A               [ 1]  247 	rim 
      0080FE CE 00 1A         [ 2]  248 	ldw x,txtbgn 
      008101 A3 AA 80         [ 2]  249 	cpw x,#app_space 
      008104 22 03            [ 1]  250 	jrugt 5$
      008106 CD 86 23         [ 4]  251 	call clear_basic 
      008109 CC 88 3D         [ 2]  252 5$:	jp warm_start
                                    253 
      00810C 0A 50 72 6F 67 72 61   254 USER_ABORT: .asciz "\nProgram aborted by user.\n"
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
                                    262 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    263 ;   A 		source  HSI | 1 HSE 
                                    264 ;   XL      CLK_CKDIVR , clock divisor 
                                    265 ; output:
                                    266 ;   none 
                                    267 ;----------------------------------------
      008127                        268 clock_init:	
      008127 C1 50 C3         [ 1]  269 	cp a,CLK_CMSR 
      00812A 27 0C            [ 1]  270 	jreq 2$ ; no switching required 
                                    271 ; select clock source 
      00812C 72 12 50 C5      [ 1]  272 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008130 C7 50 C4         [ 1]  273 	ld CLK_SWR,a
      008133 C1 50 C3         [ 1]  274 1$:	cp a,CLK_CMSR
      008136 26 FB            [ 1]  275 	jrne 1$
      008138                        276 2$: 	
                                    277 ; HSI and cpu clock divisor 
      008138 9F               [ 1]  278 	ld a,xl 
      008139 C7 50 C6         [ 1]  279 	ld CLK_CKDIVR,a  
      00813C 81               [ 4]  280 	ret
                                    281 
                                    282 ;----------------------------------
                                    283 ; TIMER2 used as audio tone output 
                                    284 ; on port D:5.
                                    285 ; channel 1 configured as PWM mode 1 
                                    286 ;-----------------------------------  
                           00F424   287 TIM2_CLK_FREQ=62500
      00813D                        288 timer2_init:
      00813D 72 1A 50 C7      [ 1]  289 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008141 35 60 53 05      [ 1]  290  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008145 35 08 53 0C      [ 1]  291 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008149 81               [ 4]  292 	ret 
                                    293 
                                    294 ;---------------------------------
                                    295 ; TIM4 is configured to generate an 
                                    296 ; interrupt every millisecond 
                                    297 ;----------------------------------
      00814A                        298 timer4_init:
      00814A 72 18 50 C7      [ 1]  299 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00814E 35 07 53 45      [ 1]  300 	mov TIM4_PSCR,#7 ; prescale 128  
      008152 35 7D 53 46      [ 1]  301 	mov TIM4_ARR,#125 ; set for 1msec.
      008156 35 05 53 40      [ 1]  302 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00815A 72 10 53 41      [ 1]  303 	bset TIM4_IER,#TIM4_IER_UIE
      00815E 81               [ 4]  304 	ret
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
                                    317 ;  none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    318 ;----------------------------------
      00815F                        319 unlock_eeprom:
      00815F 72 06 50 5F 15   [ 2]  320 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008164 35 00 50 5B      [ 1]  321 	mov FLASH_CR2,#0 
      008168 35 FF 50 5C      [ 1]  322 	mov FLASH_NCR2,#0xFF 
      00816C 35 AE 50 64      [ 1]  323 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008170 35 56 50 64      [ 1]  324     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008174 72 07 50 5F FB   [ 2]  325 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008179 81               [ 4]  326 9$:	ret
                                    327 
                                    328 ;----------------------------------
                                    329 ; unlock FLASH for writing/erasing
                                    330 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    331 ; input:
                                    332 ;  none
                                    333 ; output:
                                    334 ;  none
                                    335 ;----------------------------------
      00817A                        336 unlock_flash:
      00817A 72 02 50 5F 15   [ 2]  337 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      00817F 35 00 50 5B      [ 1]  338 	mov FLASH_CR2,#0 
      008183 35 FF 50 5C      [ 1]  339 	mov FLASH_NCR2,#0xFF 
      008187 35 56 50 62      [ 1]  340 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00818B 35 AE 50 62      [ 1]  341 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00818F 72 03 50 5F FB   [ 2]  342 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008194 81               [ 4]  343 9$:	ret
                                    344 
                                    345 ;----------------------------
                                    346 ; erase block code must be 
                                    347 ; executed from RAM
                                    348 ; input:
                                    349 ;-----------------------------
      008195                        350 row_erase:
      008195 35 20 50 5B      [ 1]  351 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      008199 35 DF 50 5C      [ 1]  352 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      00819D 4F               [ 1]  353 	clr a 
      00819E 90 5F            [ 1]  354 	clrw y 
      0081A0 91 A7 00 17      [ 1]  355 	ldf ([farptr],y),a
      0081A4 90 5C            [ 1]  356     incw y
      0081A6 91 A7 00 17      [ 1]  357 	ldf ([farptr],y),a
      0081AA 90 5C            [ 1]  358     incw y
      0081AC 91 A7 00 17      [ 1]  359 	ldf ([farptr],y),a
      0081B0 90 5C            [ 1]  360     incw y
      0081B2 91 A7 00 17      [ 1]  361 	ldf ([farptr],y),a
      0081B6 72 05 50 5F FB   [ 2]  362 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      0081BB 81               [ 4]  363 	ret
      0081BC                        364 row_erase_end:
                                    365 
                                    366 ; copy erase_start in RAM 
      0081BC                        367 move_erase_to_ram:
      0081BC AE 81 BC         [ 2]  368 	ldw x,#row_erase_end 
      0081BF 1D 81 95         [ 2]  369 	subw x,#row_erase
      0081C2 CF 00 0D         [ 2]  370 	ldw acc16,x 
      0081C5 AE 16 90         [ 2]  371 	ldw x,#tib 
      0081C8 90 AE 81 95      [ 2]  372 	ldw y,#row_erase 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      0081CC CD 84 45         [ 4]  373 	call move 
      0081CF 81               [ 4]  374 	ret 
                                    375 
                                    376 ;-----------------------------------
                                    377 ; block programming must be 
                                    378 ; executed from RAM 
                                    379 ; initial contidions: 
                                    380 ; 	memory unlocked
                                    381 ;   bit PRG set in 
                                    382 ; input:
                                    383 ;   x        data source 
                                    384 ;   farptr   row address destination 
                                    385 ; output:
                                    386 ;   none 
                                    387 ;----------------------------------
                           000001   388 	BCNT=1 
      0081D0                        389 program_row:
      0081D0 4B 80            [ 1]  390 	push #BLOCK_SIZE  
                                    391 ;enable block programming 
      0081D2 72 10 50 5B      [ 1]  392 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0081D6 72 11 50 5C      [ 1]  393 	bres FLASH_NCR2,#FLASH_CR2_PRG
                                    394 ;	mov FLASH_CR2,#(1<<FLASH_CR2_PRG) 
                                    395 ;	mov FLASH_NCR2,#~(1<<FLASH_CR2_PRG)
      0081DA 90 5F            [ 1]  396 	clrw y 
      0081DC F6               [ 1]  397 1$:	ld a,(x)
      0081DD 91 A7 00 17      [ 1]  398 	ldf ([farptr],y),a
      0081E1 5C               [ 1]  399 	incw x 
      0081E2 90 5C            [ 1]  400 	incw y 
      0081E4 0A 01            [ 1]  401 	dec (BCNT,sp)
      0081E6 26 F4            [ 1]  402 	jrne 1$
                                    403 ; wait EOP bit 
      0081E8 72 05 50 5F FB   [ 2]  404 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00016D                        405 	_drop 1 
      0081ED 5B 01            [ 2]    1     addw sp,#1 
      0081EF 81               [ 4]  406 	ret 
      0081F0                        407 program_row_end:
                                    408 
                                    409 ;-------------------------
                                    410 ; move program_row to RAM 
                                    411 ; at txtubound address 
                                    412 ;------------------------
      0081F0                        413 move_prg_to_ram:
      0081F0 AE 81 F0         [ 2]  414 	ldw x,#program_row_end 
      0081F3 1D 81 D0         [ 2]  415 	subw x,#program_row 
      0081F6 CF 00 0D         [ 2]  416 	ldw acc16,x ; bytes to move 
      0081F9 AE 16 90         [ 2]  417 	ldw x,#tib ; destination address 
      0081FC 90 AE 81 D0      [ 2]  418 	ldw y,#program_row ; source address 
      008200 CD 84 45         [ 4]  419 	call move 
      008203 81               [ 4]  420 	ret 
                                    421 
                                    422 
                                    423 ;-----------------------------
                                    424 ; write a row in FLASH/EEPROM 
                                    425 ; input:
                                    426 ;    farptr   destination address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    427 ;    x        source address 
                                    428 ;-----------------------------
      008204                        429 write_row:
      008204 89               [ 2]  430 	pushw x 
      008205 72 5D 00 17      [ 1]  431 	tnz farptr 
      008209 26 1C            [ 1]  432 	jrne to_flash 
      00820B CE 00 18         [ 2]  433 	ldw x,farptr+1 
      00820E A3 AA 80         [ 2]  434 	cpw x,#app_space  
      008211 24 14            [ 1]  435 	jruge to_flash 
      008213                        436 to_eeprom:
      008213 AE 40 00         [ 2]  437 	ldw x,#EEPROM_BASE 
      008216 C3 00 18         [ 2]  438 	cpw x,farptr+1 
      008219 24 01            [ 1]  439 	jruge 1$
      00821B 81               [ 4]  440 	ret ; bad address 
      00821C AE 47 FF         [ 2]  441 1$: ldw x,#EEPROM_END 
      00821F 23 01            [ 2]  442 	jrule 2$ 
      008221 81               [ 4]  443 	ret ; bad address 
      008222 CD 81 5F         [ 4]  444 2$:	call unlock_eeprom
      008225 20 03            [ 2]  445 	jra do_programming
      008227                        446 to_flash:
      008227 CD 81 7A         [ 4]  447 	call unlock_flash
      00822A                        448 do_programming:
      00822A 85               [ 2]  449 	popw x 
      00822B CD 16 90         [ 4]  450 	call tib
      00822E 72 13 50 5F      [ 1]  451 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008232 72 17 50 5F      [ 1]  452 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008236 81               [ 4]  453 	ret 
                                    454 
                                    455 
                                    456 ;-----------------------------------
                                    457 ; erase flash or EEPROM block
                                    458 ; a block is 128 bytes 
                                    459 ; input:
                                    460 ;   farptr  address row begin
                                    461 ; output:
                                    462 ;   none
                                    463 ;--------------------------------------
      008237                        464 block_erase:
      008237 CE 00 18         [ 2]  465 	ldw x,farptr+1
      00823A A3 AA 80         [ 2]  466 	cpw x,#app_space 
      00823D 2A 17            [ 1]  467 	jrpl erase_flash 
                                    468 ; erase eeprom block
      00823F A3 40 00         [ 2]  469 	cpw x,#EEPROM_BASE 
      008242 24 01            [ 1]  470 	jruge 1$
      008244 81               [ 4]  471 	ret ; bad address 
      008245 AE 47 FF         [ 2]  472 1$: ldw x,#EEPROM_END 
      008248 23 01            [ 2]  473 	jrule 2$ 
      00824A 81               [ 4]  474 	ret ; bad address 
      00824B CD 81 5F         [ 4]  475 2$:	call unlock_eeprom 
      00824E CD 16 90         [ 4]  476 	call tib 
      008251 72 17 50 5F      [ 1]  477 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008255 81               [ 4]  478 	ret 
                                    479 ; erase flash block:
      008256                        480 erase_flash:
      008256 CD 81 7A         [ 4]  481 	call unlock_flash 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      008259 CD 16 90         [ 4]  482 	call tib 
      00825C 72 13 50 5F      [ 1]  483     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008260 81               [ 4]  484 	ret 
                                    485 
                                    486 
                                    487 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    488 ; write a byte to FLASH or EEPROM/OPTION  
                                    489 ; input:
                                    490 ;    a  		byte to write
                                    491 ;    farptr  	address
                                    492 ;    x          farptr[x]
                                    493 ; output:
                                    494 ;    none
                                    495 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    496 	; variables locales
                           000001   497 	BTW = 1   ; byte to write offset on stack
                           000002   498 	OPT = 2   ; OPTION flag offset on stack
                           000002   499 	VSIZE = 2
      008261                        500 write_byte:
      008261 90 89            [ 2]  501 	pushw y
      0001E3                        502 	_vars VSIZE
      008263 52 02            [ 2]    1     sub sp,#VSIZE 
      008265 6B 01            [ 1]  503 	ld (BTW,sp),a ; byte to write 
      008267 0F 02            [ 1]  504 	clr (OPT,sp)  ; OPTION flag
                                    505 ; put addr[15:0] in Y, for bounds check.
      008269 90 CE 00 18      [ 2]  506 	ldw y,farptr+1   ; Y=addr15:0
                                    507 ; check addr[23:16], if <> 0 then it is extened flash memory
      00826D 72 5D 00 17      [ 1]  508 	tnz farptr 
      008271 26 14            [ 1]  509 	jrne write_flash
      008273 90 A3 AA 80      [ 2]  510     cpw y,#app_space 	 
      008277 24 0E            [ 1]  511     jruge write_flash
      008279 90 A3 40 00      [ 2]  512 	cpw y,#EEPROM_BASE  
      00827D 25 57            [ 1]  513     jrult write_exit
      00827F 90 A3 48 7F      [ 2]  514 	cpw y,#OPTION_END 
      008283 22 51            [ 1]  515 	jrugt write_exit
      008285 20 16            [ 2]  516 	jra write_eeprom 
                                    517 ; write program memory
      008287                        518 write_flash:
      008287 CD 81 7A         [ 4]  519 	call unlock_flash 
      00828A 9B               [ 1]  520 1$:	sim 
      00828B 7B 01            [ 1]  521 	ld a,(BTW,sp)
      00828D 92 A7 00 17      [ 4]  522 	ldf ([farptr],x),a ; farptr[x]=A
      008291 72 05 50 5F FB   [ 2]  523 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008296 9A               [ 1]  524     rim 
      008297 72 13 50 5F      [ 1]  525     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00829B 20 39            [ 2]  526     jra write_exit
                                    527 ; write eeprom and option
      00829D                        528 write_eeprom:
      00829D CD 81 5F         [ 4]  529 	call unlock_eeprom
                                    530 	; check for data eeprom or option eeprom
      0082A0 90 A3 48 00      [ 2]  531 	cpw y,#OPTION_BASE
      0082A4 2B 08            [ 1]  532 	jrmi 1$
      0082A6 90 A3 48 80      [ 2]  533 	cpw y,#OPTION_END+1
      0082AA 2A 02            [ 1]  534 	jrpl 1$
      0082AC 03 02            [ 1]  535 	cpl (OPT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0082AE                        536 1$: 
      0082AE 0D 02            [ 1]  537     tnz (OPT,sp)
      0082B0 27 08            [ 1]  538     jreq 2$
                                    539 	; pour modifier une option il faut modifier ces 2 bits
      0082B2 72 1E 50 5B      [ 1]  540     bset FLASH_CR2,#FLASH_CR2_OPT
      0082B6 72 1F 50 5C      [ 1]  541     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0082BA                        542 2$: 
      0082BA 7B 01            [ 1]  543     ld a,(BTW,sp)
      0082BC 92 A7 00 17      [ 4]  544     ldf ([farptr],x),a
      0082C0 0D 02            [ 1]  545     tnz (OPT,sp)
      0082C2 27 08            [ 1]  546     jreq 3$
      0082C4 5C               [ 1]  547     incw x
      0082C5 7B 01            [ 1]  548     ld a,(BTW,sp)
      0082C7 43               [ 1]  549     cpl a
      0082C8 92 A7 00 17      [ 4]  550     ldf ([farptr],x),a
      0082CC 72 05 50 5F FB   [ 2]  551 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082D1 72 0D 50 5F FB   [ 2]  552 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      0082D6                        553 write_exit:
      000256                        554 	_drop VSIZE 
      0082D6 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082D8 90 85            [ 2]  555 	popw y
      0082DA 81               [ 4]  556     ret
                                    557 
                                    558 ;--------------------------------------------
                                    559 ; write a data block to eeprom or flash 
                                    560 ; input:
                                    561 ;   Y        source address   
                                    562 ;   X        array index  destination  farptr[x]
                                    563 ;   BSIZE    block size bytes 
                                    564 ;   farptr   write address , byte* 
                                    565 ; output:
                                    566 ;	X 		after last byte written 
                                    567 ;   Y 		after last byte read 
                                    568 ;  farptr   point after block
                                    569 ;---------------------------------------------
      0082DB                        570 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      00025B                        571 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    572 	; local var 
                           000001   573 	XSAVE=1 
                           000002   574 	VSIZE=2 
      00025B                        575 write_block:
      00025B                        576 	_vars VSIZE
      0082DB 52 02            [ 2]    1     sub sp,#VSIZE 
      0082DD 1F 01            [ 2]  577 	ldw (XSAVE,sp),x 
      0082DF 1E 05            [ 2]  578 	ldw x,(BSIZE,sp) 
      0082E1 27 13            [ 1]  579 	jreq 9$
      0082E3 1E 01            [ 2]  580 1$:	ldw x,(XSAVE,sp)
      0082E5 90 F6            [ 1]  581 	ld a,(y)
      0082E7 CD 82 61         [ 4]  582 	call write_byte 
      0082EA 5C               [ 1]  583 	incw x 
      0082EB 90 5C            [ 1]  584 	incw y 
      0082ED 1F 01            [ 2]  585 	ldw (XSAVE,sp),x
      0082EF 1E 05            [ 2]  586 	ldw x,(BSIZE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082F1 5A               [ 2]  587 	decw x
      0082F2 1F 05            [ 2]  588 	ldw (BSIZE,sp),x 
      0082F4 26 ED            [ 1]  589 	jrne 1$
      0082F6                        590 9$:
      0082F6 1E 01            [ 2]  591 	ldw x,(XSAVE,sp)
      0082F8 CD 94 93         [ 4]  592 	call incr_farptr
      00027B                        593 	_drop VSIZE
      0082FB 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082FD 81               [ 4]  594 	ret 
                                    595 
                                    596 
                                    597 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    598 ;;   UART1 subroutines
                                    599 ;;   used for user interface 
                                    600 ;;   communication channel.
                                    601 ;;   settings: 
                                    602 ;;		115200 8N1 no flow control
                                    603 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    604 
                                    605 ;---------------------------------------------
                                    606 ; initialize UART1, 115200 8N1
                                    607 ; input:
                                    608 ;	none
                                    609 ; output:
                                    610 ;   none
                                    611 ;---------------------------------------------
      0082FE                        612 uart1_init:
      0082FE 72 1A 50 02      [ 1]  613     bset PA_DDR,#UART1_TX_PIN
      008302 72 1A 50 03      [ 1]  614     bset PA_CR1,#UART1_TX_PIN 
      008306 72 1A 50 04      [ 1]  615     bset PA_CR2,#UART1_TX_PIN 
                                    616 ; enable UART1 clock
      00830A 72 14 50 C7      [ 1]  617 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      00830E                        618 uart1_set_baud: 
                                    619 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    620 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      00830E A6 E1            [ 1]  621 	ld a,#CLK_SWR_HSI
      008310 C1 50 C3         [ 1]  622 	cp a,CLK_CMSR 
      008313 27 0A            [ 1]  623 	jreq 2$ 
      008315                        624 1$: ; 8 Mhz 	
      008315 35 05 52 33      [ 1]  625 	mov UART1_BRR2,#0x05 ; must be loaded first
      008319 35 04 52 32      [ 1]  626 	mov UART1_BRR1,#0x4
      00831D 20 08            [ 2]  627 	jra 3$
      00831F                        628 2$: ; 16 Mhz 	
      00831F 35 0B 52 33      [ 1]  629 	mov UART1_BRR2,#0x0b ; must be loaded first
      008323 35 08 52 32      [ 1]  630 	mov UART1_BRR1,#0x08
      008327                        631 3$:
      008327 72 5F 52 31      [ 1]  632     clr UART1_DR
      00832B 35 2C 52 35      [ 1]  633 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00832F 72 10 52 35      [ 1]  634 	bset UART1_CR2,#UART_CR2_SBK
      008333 72 0D 52 30 FB   [ 2]  635     btjf UART1_SR,#UART_SR_TC,.
      008338 72 5F 00 2B      [ 1]  636     clr rx1_head 
      00833C 72 5F 00 2C      [ 1]  637 	clr rx1_tail 
      008340 81               [ 4]  638 	ret
                                    639 
                                    640 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    641 ; uart1_putc
                                    642 ; send a character via UART1
                                    643 ; input:
                                    644 ;    A  	character to send
                                    645 ;---------------------------------
      008341                        646 putc:: ; console output always on UART1
      008341                        647 uart1_putc:: 
      008341 72 0F 52 30 FB   [ 2]  648 	btjf UART1_SR,#UART_SR_TXE,.
      008346 C7 52 31         [ 1]  649 	ld UART1_DR,a 
      008349 81               [ 4]  650 	ret 
                                    651 
                                    652 
                                    653 ;---------------------------------
                                    654 ; Query for character in rx1_queue
                                    655 ; input:
                                    656 ;   none 
                                    657 ; output:
                                    658 ;   A     0 no charcter available
                                    659 ;   Z     1 no character available
                                    660 ;---------------------------------
      00834A                        661 qgetc::
      00834A                        662 uart1_qgetc::
      00834A C6 00 2B         [ 1]  663 	ld a,rx1_head 
      00834D C0 00 2C         [ 1]  664 	sub a,rx1_tail 
      008350 81               [ 4]  665 	ret 
                                    666 
                                    667 ;---------------------------------
                                    668 ; wait character from UART1 
                                    669 ; input:
                                    670 ;   none
                                    671 ; output:
                                    672 ;   A 			char  
                                    673 ;--------------------------------	
      008351                        674 getc:: ;console input
      008351                        675 uart1_getc::
      008351 CD 83 4A         [ 4]  676 	call uart1_qgetc
      008354 27 FB            [ 1]  677 	jreq uart1_getc 
      008356 89               [ 2]  678 	pushw x 
      008357 AE 00 23         [ 2]  679 	ldw x,#rx1_queue
      00835A 9F               [ 1]  680 	ld a,xl 
      00835B CB 00 2B         [ 1]  681 	add a,rx1_head 
      00835E 97               [ 1]  682 	ld xl,a 
      00835F F6               [ 1]  683 	ld a,(x)
      008360 85               [ 2]  684 	popw x
      008361 88               [ 1]  685 	push a
      008362 72 5C 00 2B      [ 1]  686 	inc rx1_head 
      008366 A6 07            [ 1]  687 	ld a,#RX_QUEUE_SIZE-1 
      008368 C4 00 2B         [ 1]  688 	and a,rx1_head 
      00836B C7 00 2B         [ 1]  689 	ld rx1_head,a 
      00836E 84               [ 1]  690 	pop a  
      00836F 81               [ 4]  691 	ret 
                                    692 
                                    693 ;----------------------
                                    694 ; print token id && value
                                    695 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    696 ;   A     token id 
                                    697 ;   X     token value 
                                    698 ;---------------------
                           000001   699 	BSAVE=1
                           000002   700 	AREG=2
                           000003   701 	XREG=3
                           000004   702 	VSIZE=4
      008370                        703 prt_tok:
      0002F0                        704 	_vars VSIZE 
      008370 52 04            [ 2]    1     sub sp,#VSIZE 
      008372 6B 02            [ 1]  705 	ld (AREG,sp),a 
      008374 1F 03            [ 2]  706 	ldw (XREG,sp),x 
      008376 C6 00 0B         [ 1]  707 	ld a, base
      008379 6B 01            [ 1]  708 	ld (BSAVE,sp),a 
      00837B 35 10 00 0B      [ 1]  709 	mov base,#16  
      00837F AE 83 A7         [ 2]  710 	ldw x,#token_msg
      008382 CD A0 74         [ 4]  711 	call puts 
      008385 5F               [ 1]  712 	clrw x 
      008386 7B 02            [ 1]  713 	ld a,(AREG,sp)
      008388 97               [ 1]  714 	ld xl,a 
      008389 CD 89 03         [ 4]  715 	call print_int 
      00838C A6 20            [ 1]  716 	ld a,#SPACE
      00838E CD 83 41         [ 4]  717 	call putc 
      008391 1E 03            [ 2]  718 	ldw x,(XREG,sp)
      008393 CD 89 03         [ 4]  719 	call print_int 
      008396 A6 0D            [ 1]  720 	ld a,#CR 
      008398 CD 83 41         [ 4]  721 	call putc 
      00839B 7B 01            [ 1]  722 	ld a,(BSAVE,sp)
      00839D C7 00 0B         [ 1]  723 	ld base,a 
      0083A0 7B 02            [ 1]  724 	ld a,(AREG,sp)
      0083A2 1E 03            [ 2]  725 	ldw x,(XREG,sp)
      000324                        726 	_drop VSIZE 
      0083A4 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083A6 81               [ 4]  727 	ret 
      0083A7 74 6F 6B 65 6E 3A 20   728 token_msg: .asciz "token: "
             00
                                    729 
                                    730 
                                    731 ;---------------------
                                    732 ; display n bytes row 
                                    733 ; from memory.
                                    734 ; input:
                                    735 ;   A   bytes to print 
                                    736 ;	X   start address 
                                    737 ; output:
                                    738 ;   X   address after last shown  
                                    739 ;---------------------
                           000001   740 	CNT=1 
                           000002   741 	ADR=2 
                           000003   742 	VSIZE=3 
      0083AF                        743 show_row:
      0083AF 4D               [ 1]  744 	tnz a 
      0083B0 26 01            [ 1]  745 	jrne 1$
      0083B2 81               [ 4]  746 	ret 
      0083B3                        747 1$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083B3 89               [ 2]  748 	pushw x  
      0083B4 88               [ 1]  749 	push a 
      0083B5 35 04 00 22      [ 1]  750 	mov tab_width,#4 
      0083B9 CD 89 03         [ 4]  751 	call print_int 
      0083BC A6 20            [ 1]  752 	ld a,#SPACE  
      0083BE CD 83 41         [ 4]  753 	call putc
      0083C1                        754 row_loop:
      0083C1 1E 02            [ 2]  755 	ldw x,(ADR,sp)
      0083C3 F6               [ 1]  756 	ld a,(x)
      0083C4 5F               [ 1]  757 	clrw x 
      0083C5 97               [ 1]  758 	ld xl,a 
      0083C6 CD 89 03         [ 4]  759 	call print_int 
      0083C9 1E 02            [ 2]  760 	ldw x,(ADR,sp)
      0083CB 5C               [ 1]  761 	incw x 
      0083CC 1F 02            [ 2]  762 	ldw (ADR,sp),x 
      0083CE 0A 01            [ 1]  763 	dec (CNT,sp)
      0083D0 26 EF            [ 1]  764 	jrne row_loop
      000352                        765 	_drop VSIZE  		
      0083D2 5B 03            [ 2]    1     addw sp,#VSIZE 
      0083D4 35 04 00 22      [ 1]  766 	mov tab_width,#4
      0083D8 A6 0D            [ 1]  767 	ld a,#CR 
      0083DA CD 83 41         [ 4]  768 	call putc 
      0083DD 81               [ 4]  769 	ret 
                                    770 
                                    771 ;--------------------------
                                    772 ; print memory content 
                                    773 ; in hexadecimal format
                                    774 ;  input:
                                    775 ;    X    start address 
                                    776 ;    Y    count 
                                    777 ;--------------------------
                           000001   778 	BCNT=1
                           000003   779 	BASE=3
                           000004   780 	TABW=4
                           000004   781 	VSIZE=4   
      0083DE                        782 hex_dump:
      00035E                        783 	_vars VSIZE
      0083DE 52 04            [ 2]    1     sub sp,#VSIZE 
      0083E0 C6 00 0B         [ 1]  784 	ld a,base
      0083E3 6B 03            [ 1]  785 	ld (BASE,sp),a 
      0083E5 35 10 00 0B      [ 1]  786 	mov base,#16
      0083E9 C6 00 22         [ 1]  787 	ld a,tab_width 
      0083EC 6B 04            [ 1]  788 	ld (TABW,sp),a
      0083EE A6 0D            [ 1]  789 	ld a,#CR 
      0083F0 CD 83 41         [ 4]  790 	call putc 
      0083F3 17 01            [ 2]  791 1$: ldw (BCNT,sp),y
      0083F5 A6 10            [ 1]  792 	ld a,#16
      0083F7 90 A3 00 10      [ 2]  793 	cpw y,#16
      0083FB 2A 02            [ 1]  794 	jrpl 2$
      0083FD 90 9F            [ 1]  795 	ld a,yl
      0083FF                        796 2$: 	
      0083FF CD 83 AF         [ 4]  797 	call show_row 
      008402 16 01            [ 2]  798 	ldw y,(BCNT,sp) 
      008404 72 A2 00 10      [ 2]  799 	subw y,#16 
      008408 90 A3 00 01      [ 2]  800 	cpw y,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00840C 2A E5            [ 1]  801 	jrpl 1$
      00840E 7B 03            [ 1]  802 	ld a,(BASE,sp)
      008410 C7 00 0B         [ 1]  803 	ld base,a
      008413 7B 04            [ 1]  804 	ld a,(TABW,sp)
      008415 C7 00 22         [ 1]  805 	ld tab_width,a 
      000398                        806 	_drop VSIZE
      008418 5B 04            [ 2]    1     addw sp,#VSIZE 
      00841A 81               [ 4]  807 	ret 
                                    808 
                                    809 ;-------------------------------------
                                    810 ; retrun string length
                                    811 ; input:
                                    812 ;   X         .asciz  pointer 
                                    813 ; output:
                                    814 ;   X         not affected 
                                    815 ;   A         length 
                                    816 ;-------------------------------------
      00841B                        817 strlen::
      00841B 89               [ 2]  818 	pushw x 
      00841C 4F               [ 1]  819 	clr a
      00841D 7D               [ 1]  820 1$:	tnz (x) 
      00841E 27 04            [ 1]  821 	jreq 9$ 
      008420 4C               [ 1]  822 	inc a 
      008421 5C               [ 1]  823 	incw x 
      008422 20 F9            [ 2]  824 	jra 1$ 
      008424 85               [ 2]  825 9$:	popw x 
      008425 81               [ 4]  826 	ret 
                                    827 
                                    828 ;------------------------------------
                                    829 ; compare 2 strings
                                    830 ; input:
                                    831 ;   X 		char* first string 
                                    832 ;   Y       char* second string 
                                    833 ; output:
                                    834 ;   A 		0|1 
                                    835 ;-------------------------------------
      008426                        836 strcmp:
      008426 F6               [ 1]  837 	ld a,(x)
      008427 27 0B            [ 1]  838 	jreq 5$ 
      008429 90 F1            [ 1]  839 	cp a,(y) 
      00842B 26 05            [ 1]  840 	jrne 4$ 
      00842D 5C               [ 1]  841 	incw x 
      00842E 90 5C            [ 1]  842 	incw y 
      008430 20 F4            [ 2]  843 	jra strcmp 
      008432                        844 4$: ; not same  
      008432 4F               [ 1]  845 	clr a 
      008433 81               [ 4]  846 	ret 
      008434                        847 5$: ; same 
      008434 A6 01            [ 1]  848 	ld a,#1 
      008436 81               [ 4]  849 	ret 
                                    850 
                                    851 
                                    852 ;---------------------------------------
                                    853 ;  copy src to dest 
                                    854 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    855 ;   X 		dest 
                                    856 ;   Y 		src 
                                    857 ; output: 
                                    858 ;   X 		dest 
                                    859 ;----------------------------------
      008437                        860 strcpy::
      008437 89               [ 2]  861 	pushw x 
      008438 90 F6            [ 1]  862 1$: ld a,(y)
      00843A 27 06            [ 1]  863 	jreq 9$ 
      00843C F7               [ 1]  864 	ld (x),a 
      00843D 5C               [ 1]  865 	incw x 
      00843E 90 5C            [ 1]  866 	incw y 
      008440 20 F6            [ 2]  867 	jra 1$ 
      008442 7F               [ 1]  868 9$:	clr (x)
      008443 85               [ 2]  869 	popw x 
      008444 81               [ 4]  870 	ret 
                                    871 
                                    872 ;---------------------------------------
                                    873 ; move memory block 
                                    874 ; input:
                                    875 ;   X 		destination 
                                    876 ;   Y 	    source 
                                    877 ;   acc16	bytes count 
                                    878 ; output:
                                    879 ;   none 
                                    880 ;--------------------------------------
                           000001   881 	INCR=1 ; increament high byte 
                           000002   882 	LB=2 ; increament low byte 
                           000002   883 	VSIZE=2
      008445                        884 move::
      0003C5                        885 	_vars VSIZE 
      008445 52 02            [ 2]    1     sub sp,#VSIZE 
      008447 0F 01            [ 1]  886 	clr (INCR,sp)
      008449 0F 02            [ 1]  887 	clr (LB,sp)
      00844B 90 89            [ 2]  888 	pushw y 
      00844D 13 01            [ 2]  889 	cpw x,(1,sp) ; compare DEST to SRC 
      00844F 90 85            [ 2]  890 	popw y 
      008451 27 31            [ 1]  891 	jreq move_exit ; x==y 
      008453 2B 0E            [ 1]  892 	jrmi move_down
      008455                        893 move_up: ; start from top address with incr=-1
      008455 72 BB 00 0D      [ 2]  894 	addw x,acc16
      008459 72 B9 00 0D      [ 2]  895 	addw y,acc16
      00845D 03 01            [ 1]  896 	cpl (INCR,sp)
      00845F 03 02            [ 1]  897 	cpl (LB,sp)   ; increment = -1 
      008461 20 05            [ 2]  898 	jra move_loop  
      008463                        899 move_down: ; start from bottom address with incr=1 
      008463 5A               [ 2]  900     decw x 
      008464 90 5A            [ 2]  901 	decw y
      008466 0C 02            [ 1]  902 	inc (LB,sp) ; incr=1 
      008468                        903 move_loop:	
      008468 C6 00 0D         [ 1]  904     ld a, acc16 
      00846B CA 00 0E         [ 1]  905 	or a, acc8
      00846E 27 14            [ 1]  906 	jreq move_exit 
      008470 72 FB 01         [ 2]  907 	addw x,(INCR,sp)
      008473 72 F9 01         [ 2]  908 	addw y,(INCR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008476 90 F6            [ 1]  909 	ld a,(y)
      008478 F7               [ 1]  910 	ld (x),a 
      008479 89               [ 2]  911 	pushw x 
      00847A CE 00 0D         [ 2]  912 	ldw x,acc16 
      00847D 5A               [ 2]  913 	decw x 
      00847E CF 00 0D         [ 2]  914 	ldw acc16,x 
      008481 85               [ 2]  915 	popw x 
      008482 20 E4            [ 2]  916 	jra move_loop
      008484                        917 move_exit:
      000404                        918 	_drop VSIZE
      008484 5B 02            [ 2]    1     addw sp,#VSIZE 
      008486 81               [ 4]  919 	ret 	
                                    920 
                                    921 ;------------------------------------
                                    922 ;  set all variables to zero 
                                    923 ; input:
                                    924 ;   none 
                                    925 ; output:
                                    926 ;	none
                                    927 ;------------------------------------
      008487                        928 clear_vars:
      008487 AE 00 2D         [ 2]  929 	ldw x,#vars 
      00848A 90 AE 00 34      [ 2]  930 	ldw y,#2*26 
      00848E 7F               [ 1]  931 1$:	clr (x)
      00848F 5C               [ 1]  932 	incw x 
      008490 90 5A            [ 2]  933 	decw y 
      008492 26 FA            [ 1]  934 	jrne 1$
      008494 81               [ 4]  935 	ret 
                                    936 
                                    937 ;-------------------------------------
                                    938 ; check if A is a letter 
                                    939 ; input:
                                    940 ;   A 			character to test 
                                    941 ; output:
                                    942 ;   C flag      1 true, 0 false 
                                    943 ;-------------------------------------
      008495                        944 is_alpha::
      008495 A1 41            [ 1]  945 	cp a,#'A 
      008497 8C               [ 1]  946 	ccf 
      008498 24 0B            [ 1]  947 	jrnc 9$ 
      00849A A1 5B            [ 1]  948 	cp a,#'Z+1 
      00849C 25 07            [ 1]  949 	jrc 9$ 
      00849E A1 61            [ 1]  950 	cp a,#'a 
      0084A0 8C               [ 1]  951 	ccf 
      0084A1 24 02            [ 1]  952 	jrnc 9$
      0084A3 A1 7B            [ 1]  953 	cp a,#'z+1
      0084A5 81               [ 4]  954 9$: ret 	
                                    955 
                                    956 ;------------------------------------
                                    957 ; check if character in {'0'..'9'}
                                    958 ; input:
                                    959 ;    A  character to test
                                    960 ; output:
                                    961 ;    Carry  0 not digit | 1 digit
                                    962 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084A6                        963 is_digit::
      0084A6 A1 30            [ 1]  964 	cp a,#'0
      0084A8 25 03            [ 1]  965 	jrc 1$
      0084AA A1 3A            [ 1]  966     cp a,#'9+1
      0084AC 8C               [ 1]  967 	ccf 
      0084AD 8C               [ 1]  968 1$:	ccf 
      0084AE 81               [ 4]  969     ret
                                    970 
                                    971 ;-------------------------------------
                                    972 ; return true if character in  A 
                                    973 ; is letter or digit.
                                    974 ; input:
                                    975 ;   A     ASCII character 
                                    976 ; output:
                                    977 ;   A     no change 
                                    978 ;   Carry    0 false| 1 true 
                                    979 ;--------------------------------------
      0084AF                        980 is_alnum::
      0084AF CD 84 A6         [ 4]  981 	call is_digit
      0084B2 25 03            [ 1]  982 	jrc 1$ 
      0084B4 CD 84 95         [ 4]  983 	call is_alpha
      0084B7 81               [ 4]  984 1$:	ret 
                                    985 
                                    986 
                                    987 ;-------------------------------------
                                    988 ;  program initialization entry point 
                                    989 ;-------------------------------------
                           000001   990 	MAJOR=1
                           000002   991 	MINOR=2 
      0084B8 0A 0A 54 69 6E 79 20   992 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
      0084FE                        993 cold_start:
                                    994 ;set stack 
      0084FE AE 17 FF         [ 2]  995 	ldw x,#STACK_EMPTY
      008501 94               [ 1]  996 	ldw sp,x   
                                    997 ; clear all ram 
      008502 7F               [ 1]  998 0$: clr (x)
      008503 5A               [ 2]  999 	decw x 
      008504 26 FC            [ 1] 1000 	jrne 0$
                                   1001 ; activate pull up on all inputs 
      008506 A6 FF            [ 1] 1002 	ld a,#255 
      008508 C7 50 03         [ 1] 1003 	ld PA_CR1,a 
      00850B C7 50 08         [ 1] 1004 	ld PB_CR1,a 
      00850E C7 50 0D         [ 1] 1005 	ld PC_CR1,a 
      008511 C7 50 12         [ 1] 1006 	ld PD_CR1,a 
      008514 C7 50 17         [ 1] 1007 	ld PE_CR1,a 
      008517 C7 50 1C         [ 1] 1008 	ld PF_CR1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      00851A C7 50 21         [ 1] 1009 	ld PG_CR1,a 
      00851D C7 50 2B         [ 1] 1010 	ld PI_CR1,a
                                   1011 ; set LD2 pin as output 
      008520 72 1A 50 0D      [ 1] 1012     bset PC_CR1,#LED2_BIT
      008524 72 1A 50 0E      [ 1] 1013     bset PC_CR2,#LED2_BIT
      008528 72 1A 50 0C      [ 1] 1014     bset PC_DDR,#LED2_BIT
      00852C 72 1B 50 0A      [ 1] 1015 	bres PC_ODR,#LED2_BIT 
                                   1016 ; disable schmitt triggers on Arduino CN4 analog inputs
      008530 55 00 3F 54 07   [ 1] 1017 	mov ADC_TDRL,0x3f
                                   1018 ; disable peripherals clocks
                                   1019 ;	clr CLK_PCKENR1 
                                   1020 ;	clr CLK_PCKENR2
      008535 72 5F 50 F2      [ 1] 1021 	clr AWU_TBR 
      008539 72 14 50 CA      [ 1] 1022 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1023 ; select internal clock no divisor: 16 Mhz 	
      00853D A6 E1            [ 1] 1024 	ld a,#CLK_SWR_HSI 
      00853F 5F               [ 1] 1025 	clrw x  
      008540 CD 81 27         [ 4] 1026     call clock_init 
      008543 CD 81 4A         [ 4] 1027 	call timer4_init
      008546 CD 81 3D         [ 4] 1028 	call timer2_init
                                   1029 ; UART1 at 115200 BAUD
      008549 CD 82 FE         [ 4] 1030 	call uart1_init
                                   1031 ; activate PE_4 (user button interrupt)
      00854C 72 18 50 18      [ 1] 1032     bset PE_CR2,#USR_BTN_BIT 
                                   1033 ; display system information
      008550 AE 84 B8         [ 2] 1034 	ldw x,#software 
      008553 CD A0 74         [ 4] 1035 	call puts 
      008556 A6 01            [ 1] 1036 	ld a,#MAJOR 
      008558 C7 00 0E         [ 1] 1037 	ld acc8,a 
      00855B 5F               [ 1] 1038 	clrw x 
      00855C CF 00 0C         [ 2] 1039 	ldw acc24,x
      00855F 72 5F 00 22      [ 1] 1040 	clr tab_width  
      008563 35 0A 00 0B      [ 1] 1041 	mov base, #10 
      008567 CD 89 13         [ 4] 1042 	call prti24 
      00856A A6 2E            [ 1] 1043 	ld a,#'.
      00856C CD 83 41         [ 4] 1044 	call putc 
      00856F A6 02            [ 1] 1045 	ld a,#MINOR 
      008571 C7 00 0E         [ 1] 1046 	ld acc8,a 
      008574 5F               [ 1] 1047 	clrw x 
      008575 CF 00 0C         [ 2] 1048 	ldw acc24,x 
      008578 CD 89 13         [ 4] 1049 	call prti24
      00857B A6 0D            [ 1] 1050 	ld a,#CR 
      00857D CD 83 41         [ 4] 1051 	call putc
      008580 9A               [ 1] 1052 	rim 
      008581 72 5C 00 16      [ 1] 1053 	inc seedy+1 
      008585 72 5C 00 14      [ 1] 1054 	inc seedx+1 
      008589 CD 86 23         [ 4] 1055 	call clear_basic
      00858C CD 8E 65         [ 4] 1056 	call ubound 
      00858F CD 92 FA         [ 4] 1057 	call beep_1khz  
      008592                       1058 2$:	
      008592 CD 86 05         [ 4] 1059 	call warm_init
                                   1060 ; check for application in flash memory 
      008595 CD 94 D5         [ 4] 1061 	call qsign ; app in flash?
      008598 27 03            [ 1] 1062 	jreq run_app ; yes 
      00859A CC 88 40         [ 2] 1063 	jp cmd_line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00859D                       1064 run_app:
                                   1065 ; run application in FLASH 
      00859D AE 85 DA         [ 2] 1066 	ldw x,#RUNNING 
      0085A0 CD A0 74         [ 4] 1067 	call puts 
      0085A3 AE AA 84         [ 2] 1068 	ldw x,#app
      0085A6 35 10 00 0B      [ 1] 1069 	mov base,#16 
      0085AA CD 89 03         [ 4] 1070 	call print_int
      0085AD 35 0A 00 0B      [ 1] 1071 	mov base,#10  
      0085B1 AE AA 84         [ 2] 1072 4$:	ldw x,#app  
      0085B4 CF 00 05         [ 2] 1073 	ldw basicptr,x
      0085B7 CF 00 1A         [ 2] 1074 	ldw txtbgn,x 
      0085BA E6 02            [ 1] 1075 	ld a,(2,x)
      0085BC C7 00 04         [ 1] 1076 	ld count,a 
      0085BF A6 03            [ 1] 1077 	ld a,#3 
      0085C1 C7 00 02         [ 1] 1078 	ld in,a 
      0085C4 CE AA 82         [ 2] 1079 	ldw x,app_size 
      0085C7 72 BB 00 1A      [ 2] 1080 	addw x,txtbgn 
      0085CB CF 00 1C         [ 2] 1081 	ldw txtend,x
      0085CE 72 10 00 21      [ 1] 1082 	bset flags,#FRUN
      0085D2 CD 8E 65         [ 4] 1083 	call ubound   
      0085D5 CC 88 5C         [ 2] 1084 	jp interpreter  
      0085D8 20 FE            [ 2] 1085     jra .  
                                   1086 
      0085DA 0A 72 75 6E 6E 69 6E  1087 RUNNING: .asciz "\nrunning application in FLASH at address: " 
             67 20 61 70 70 6C 69
             63 61 74 69 6F 6E 20
             69 6E 20 46 4C 41 53
             48 20 61 74 20 61 64
             64 72 65 73 73 3A 20
             00
                                   1088 
      008605                       1089 warm_init:
      008605 72 5F 00 21      [ 1] 1090 	clr flags 
      008609 72 5F 00 1E      [ 1] 1091 	clr loop_depth 
      00860D 35 04 00 22      [ 1] 1092 	mov tab_width,#TAB_WIDTH 
      008611 35 0A 00 0B      [ 1] 1093 	mov base,#10 
      008615 AE 00 00         [ 2] 1094 	ldw x,#0 
      008618 CF 00 05         [ 2] 1095 	ldw basicptr,x 
      00861B CF 00 01         [ 2] 1096 	ldw in.w,x 
      00861E 72 5F 00 04      [ 1] 1097 	clr count
      008622 81               [ 4] 1098 	ret 
                                   1099 
                                   1100 
                                   1101 ;---------------------------
                                   1102 ; reset BASIC text variables 
                                   1103 ; and clear variables 
                                   1104 ;---------------------------
      008623                       1105 clear_basic:
      008623 72 5F 00 04      [ 1] 1106 	clr count
      008627 72 5F 00 02      [ 1] 1107 	clr in  
      00862B AE 00 65         [ 2] 1108 	ldw x,#free_ram 
      00862E CF 00 1A         [ 2] 1109 	ldw txtbgn,x 
      008631 CF 00 1C         [ 2] 1110 	ldw txtend,x 
      008634 CD 84 87         [ 4] 1111 	call clear_vars 
      008637 81               [ 4] 1112 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1113 
                                   1114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1115 ;;   Tiny BASIC error messages     ;;
                                   1116 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008638                       1117 err_msg:
      008638 00 00 86 58 86 65 86  1118 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             73 86 8C 86 9B
      008644 86 B1 86 C7 86 E1 86  1119 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             F2 87 03
      00864E 87 0F 87 42 87 52 87  1120 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             66 87 79
                                   1121 
      008658 4D 65 6D 6F 72 79 20  1122 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      008665 73 79 6E 74 61 78 20  1123 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      008673 6D 61 74 68 20 6F 70  1124 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      00868C 64 69 76 69 73 69 6F  1125 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      00869B 69 6E 76 61 6C 69 64  1126 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0086B1 72 75 6E 20 74 69 6D  1127 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0086C7 63 6F 6D 6D 61 6E 64  1128 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      0086E1 64 75 70 6C 69 63 61  1129 err_duplicate: .asciz "duplicate name.\n"
             74 65 20 6E 61 6D 65
             2E 0A 00
      0086F2 46 69 6C 65 20 6E 6F  1130 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      008703 62 61 64 20 76 61 6C  1131 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      00870F 46 69 6C 65 20 69 6E  1132 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      008742 4E 6F 20 64 61 74 61  1133 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      008752 4E 6F 20 70 72 6F 67  1134 err_no_prog: .asciz "No program in RAM!\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal  72-Bits]



             72 61 6D 20 69 6E 20
             52 41 4D 21 0A 00
      00875A 61 6D 20 69 6E 20 52  1135 err_no_fspace: .asciz "File system full.\n" 
             41 4D 21 0A 00 46 69
             6C 65 20 73 79
      00876D 73 74 65 6D 20 66 75  1136 err_buf_full: .asciz "Buffer full\n"
             6C 6C 2E 0A 00 42
                                   1137 
      00877A 75 66 66 65 72 20 66  1138 rt_msg: .asciz "\nrun time error, "
             75 6C 6C 0A 00 0A 72
             75 6E 20 74
      00878C 69 6D 65 20 65 72 72  1139 comp_msg: .asciz "\ncompile error, "
             6F 72 2C 20 00 0A 63
             6F 6D 70
      00879D 69 6C 65 20 65 72 72  1140 tk_id: .asciz "last token id: "
             6F 72 2C 20 00 6C 61
             73 74
                                   1141 
      000739                       1142 syntax_error::
      0087AD 20 74            [ 1] 1143 	ld a,#ERR_SYNTAX 
                                   1144 
      00073B                       1145 tb_error::
      0087AF 6F 6B 65 6E 20   [ 2] 1146 	btjt flags,#FCOMP,1$
      0087B4 69               [ 1] 1147 	push a 
      0087B5 64 3A 20         [ 2] 1148 	ldw x, #rt_msg 
      0087B8 00 1F F4         [ 4] 1149 	call puts 
      0087B9 84               [ 1] 1150 	pop a 
      0087B9 A6 02 B8         [ 2] 1151 	ldw x, #err_msg 
      0087BB 72 5F 00 0C      [ 1] 1152 	clr acc16 
      0087BB 72               [ 1] 1153 	sll a
      0087BC 0A 00 21 44      [ 1] 1154 	rlc acc16  
      0087C0 88 AE 87         [ 1] 1155 	ld acc8, a 
      0087C3 86 CD A0 74      [ 2] 1156 	addw x,acc16 
      0087C7 84               [ 2] 1157 	ldw x,(x)
      0087C8 AE 86 38         [ 4] 1158 	call puts
      0087CB 72 5F 00         [ 2] 1159 	ldw x,basicptr
      0087CE 0D 48 72         [ 1] 1160 	ld a,in 
      0087D1 59 00 0D         [ 4] 1161 	call prt_basic_line
      0087D4 C7 00 0E         [ 2] 1162 	ldw x,#tk_id 
      0087D7 72 BB 00         [ 4] 1163 	call puts 
      0087DA 0D FE CD         [ 1] 1164 	ld a,in.saved 
      0087DD A0               [ 1] 1165 	clrw x 
      0087DE 74               [ 1] 1166 	ld xl,a 
      0087DF CE 00 05 C6      [ 2] 1167 	addw x,basicptr 
      0087E3 00               [ 1] 1168 	ld a,(x)
      0087E4 02               [ 1] 1169 	clrw x 
      0087E5 CD               [ 1] 1170 	ld xl,a 
      0087E6 8F 81 AE         [ 4] 1171 	call print_int
      0087E9 87 A9 CD A0 74   [ 2] 1172 	btjf flags,#FAUTORUN ,6$
      0087EE C6 00            [ 2] 1173 	jra 6$
      000784                       1174 1$:	
      0087F0 03               [ 1] 1175 	push a 
      0087F1 5F 97 72         [ 2] 1176 	ldw x,#comp_msg
      0087F4 BB 00 05         [ 4] 1177 	call puts 
      0087F7 F6               [ 1] 1178 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0087F8 5F 97 CD         [ 2] 1179 	ldw x, #err_msg 
      0087FB 89 03 72 0D      [ 1] 1180 	clr acc16 
      0087FF 00               [ 1] 1181 	sll a
      008800 21 37 20 35      [ 1] 1182 	rlc acc16  
      008804 C7 00 0D         [ 1] 1183 	ld acc8, a 
      008804 88 AE 87 98      [ 2] 1184 	addw x,acc16 
      008808 CD               [ 2] 1185 	ldw x,(x)
      008809 A0 74 84         [ 4] 1186 	call puts
      00880C AE 86 38         [ 2] 1187 	ldw x,#tib
      00880F 72 5F 00         [ 4] 1188 	call puts 
      008812 0D 48            [ 1] 1189 	ld a,#CR 
      008814 72 59 00         [ 4] 1190 	call putc
      008817 0D C7 00         [ 2] 1191 	ldw x,in.w
      00881A 0E 72 BB         [ 4] 1192 	call spaces
      00881D 00 0D            [ 1] 1193 	ld a,#'^
      00881F FE CD A0         [ 4] 1194 	call putc 
      008822 74 AE 16         [ 2] 1195 6$: ldw x,#STACK_EMPTY 
      008825 90               [ 1] 1196     ldw sp,x
      0007BD                       1197 warm_start:
      008826 CD A0 74         [ 4] 1198 	call warm_init
                                   1199 ;----------------------------
                                   1200 ;   BASIC interpreter
                                   1201 ;----------------------------
      0007C0                       1202 cmd_line: ; user interface 
      008829 A6 0D            [ 1] 1203 	ld a,#CR 
      00882B CD 83 41         [ 4] 1204 	call putc 
      00882E CE 00            [ 1] 1205 	ld a,#'> 
      008830 01 CD A0         [ 4] 1206 	call putc
      008833 E1 A6 5E         [ 4] 1207 	call readln
      008836 CD 83 41 AE      [ 1] 1208 	tnz count 
      00883A 17 FF            [ 1] 1209 	jreq cmd_line
      00883C 94 26 D2         [ 4] 1210 	call compile
                                   1211 ; if text begin with a line number
                                   1212 ; the compiler set count to zero    
                                   1213 ; so code is not interpreted
      00883D 72 5D 00 03      [ 1] 1214 	tnz count 
      00883D CD 86            [ 1] 1215 	jreq cmd_line
                                   1216 
                                   1217 ; if direct command 
                                   1218 ; it's ready to interpret 
                                   1219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1220 ;; This is the interpreter loop
                                   1221 ;; for each BASIC code line. 
                                   1222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0007DC                       1223 interpreter: 
      00883F 05 00 01         [ 1] 1224 	ld a,in 
      008840 C1 00 03         [ 1] 1225 	cp a,count 
      008840 A6 0D            [ 1] 1226 	jrmi interp_loop
      0007E4                       1227 next_line:
      008842 CD 83 41 A6 3E   [ 2] 1228 	btjf flags, #FRUN, cmd_line
      008847 CD 83 41         [ 2] 1229 	ldw x,basicptr
      00884A CD A1 79 72      [ 2] 1230 	addw x,in.w 
      00884E 5D 00 04         [ 2] 1231 	cpw x,txtend 
      008851 27 ED            [ 1] 1232 	jrpl warm_start
      008853 CD A7 52         [ 2] 1233 	ldw basicptr,x ; start of next line  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008856 72 5D            [ 1] 1234 	ld a,(2,x)
      008858 00 04 27         [ 1] 1235 	ld count,a 
      00885B E4 03 00 01      [ 1] 1236 	mov in,#3 ; skip first 3 bytes of line 
      00885C                       1237 interp_loop: 
      00885C C6 00 02         [ 4] 1238 	call next_token
      00885F C1 00            [ 1] 1239 	cp a,#TK_NONE 
      008861 04 2B            [ 1] 1240 	jreq next_line 
      008863 1D 80            [ 1] 1241 	cp a,#TK_CMD
      008864 26 03            [ 1] 1242 	jrne 1$
      008864 72               [ 4] 1243 	call (x) 
      008865 01 00            [ 2] 1244 	jra interp_loop 
      00080F                       1245 1$:	 
      008867 21 D7            [ 1] 1246 	cp a,#TK_VAR
      008869 CE 00            [ 1] 1247 	jrne 2$
      00886B 05 72 BB         [ 4] 1248 	call let_var  
      00886E 00 01            [ 2] 1249 	jra interp_loop 
      000818                       1250 2$:	
      008870 C3 00            [ 1] 1251 	cp a,#TK_ARRAY 
      008872 1C 2A            [ 1] 1252 	jrne 3$
      008874 C8 CF 00         [ 4] 1253 	call let_array 
      008877 05 E6            [ 2] 1254 	jra interp_loop
      000821                       1255 3$:	
      008879 02 C7            [ 1] 1256 	cp a,#TK_COLON 
      00887B 00 04            [ 1] 1257 	jreq interp_loop 
      00887D 35 03 00         [ 2] 1258 	jp syntax_error 
                                   1259 
                                   1260 		
                                   1261 ;--------------------------
                                   1262 ; extract next token from
                                   1263 ; token list 
                                   1264 ; basicptr -> base address 
                                   1265 ; in  -> offset in list array 
                                   1266 ; output:
                                   1267 ;   A 		token attribute
                                   1268 ;   X 		token value if there is one
                                   1269 ;----------------------------------------
      000828                       1270 next_token::
      008880 02               [ 1] 1271 	clrw x 
      008881 C6 00 01         [ 1] 1272 	ld a,in 
                                   1273 ; don't replace sub by "cp a,count" 
                                   1274 ; if end of line must return with A=0   	
      008881 CD 88 A8         [ 1] 1275 	sub a,count 
      008884 A1 00            [ 1] 1276 	jreq 9$ ; end of line 
      000831                       1277 0$: 
      008886 27 DC A1 80 26   [ 1] 1278 	mov in.saved,in ; in case "_unget_token" needed 
      00888B 03 FD 20 F2      [ 2] 1279 	ldw y,basicptr 
      00888F 91 D6 00         [ 4] 1280 	ld a,([in.w],y)
      00888F A1 85 26 05      [ 1] 1281 	inc in  
      008893 CD               [ 1] 1282 	tnz a 
      008894 8E 80            [ 1] 1283 	jrmi 6$
      008896 20 E9            [ 1] 1284 	cp a,#TK_ARRAY
      008898 2A 3A            [ 1] 1285 	jrpl 9$  ; no attribute for these
      000848                       1286 1$: ; 
      008898 A1 06            [ 1] 1287 	cp a,#TK_CHAR
      00889A 26 05            [ 1] 1288 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      00889C CD               [ 1] 1289 	exg a,xl
      00889D 8E 7D 20         [ 4] 1290 	ld a,([in.w],y)
      0088A0 E0 5C 00 01      [ 1] 1291 	inc in 
      0088A1 41               [ 1] 1292 	exg a,xl  
      0088A1 A1 0B            [ 2] 1293 	jra 9$ 
      0088A3 27 DC            [ 1] 1294 2$:	cp a,#TK_QSTR 
      0088A5 CC 87            [ 1] 1295 	jrne 9$
      0088A7 B9               [ 1] 1296 	ldw x,y 
      0088A8 72 BB 00 00      [ 2] 1297 	addw x,in.w ; pointer to string 
                                   1298 ; move pointer after string 
      0088A8 5F C6 00         [ 4] 1299 3$:	tnz ([in.w],y)
      0088AB 02 C0            [ 1] 1300 	jreq 8$
      0088AD 00 04 27 51      [ 1] 1301 	inc in 
      0088B1 20 F5            [ 2] 1302 	jra 3$
      00086B                       1303 6$: 
      0088B1 55 00 02 00      [ 2] 1304 	addw y,in.w 
      0088B5 03 90            [ 2] 1305 	ldw y,(y)
      0088B7 CE 00            [ 1] 1306 	cp a,#TK_INTGR
      0088B9 05 91            [ 1] 1307 	jrpl 7$
      0088BB D6 01 72 5C      [ 2] 1308 	ldw y,(code_addr,y) 
      0088BF 00               [ 1] 1309 7$:	exgw x,y 
      0088C0 02 4D 2B 27      [ 1] 1310 	inc in
      0088C4 A1 06 2A 3A      [ 1] 1311 8$:	inc in 
      0088C8                       1312 9$: 
      0088C8 A1               [ 4] 1313 	ret	
                                   1314 
                                   1315 ;-----------------------------------
                                   1316 ; print a 16 bit integer 
                                   1317 ; using variable 'base' as conversion
                                   1318 ; format.
                                   1319 ; input:
                                   1320 ;   X       integer to print 
                                   1321 ;   'base'    conversion base 
                                   1322 ; output:
                                   1323 ;   none 
                                   1324 ;-----------------------------------
      000883                       1325 print_int:
      0088C9 03 26 0B 41      [ 1] 1326 	clr acc24 
      0088CD 91 D6 01         [ 2] 1327 	ldw acc16,x 
      0088D0 72 5C 00 02 41   [ 2] 1328 	btjf acc16,#7,prti24
      0088D5 20 2B A1 02      [ 1] 1329 	cpl acc24 
                                   1330 	
                                   1331 ;------------------------------------
                                   1332 ; print integer in acc24 
                                   1333 ; input:
                                   1334 ;	acc24 		integer to print 
                                   1335 ;	'base' 		numerical base for conversion 
                                   1336 ;   'tab_width' field width 
                                   1337 ;  output:
                                   1338 ;    A          string length
                                   1339 ;------------------------------------
      000893                       1340 prti24:
      0088D9 26 27 93         [ 4] 1341     call itoa  ; conversion entier en  .asciz
      0088DC 72 BB 00         [ 4] 1342 	call right_align  
      0088DF 01               [ 1] 1343 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0088E0 91 6D 01         [ 4] 1344 	call puts
      0088E3 27               [ 1] 1345 	pop a 
      0088E4 19               [ 4] 1346     ret	
                                   1347 
                                   1348 ;------------------------------------
                                   1349 ; convert integer in acc24 to string
                                   1350 ; input:
                                   1351 ;   'base'	conversion base 
                                   1352 ;	acc24	integer to convert
                                   1353 ; output:
                                   1354 ;   X  		pointer to first char of string
                                   1355 ;   A       string length
                                   1356 ;------------------------------------
                           000001  1357 	SIGN=1  ; integer sign 
                           000002  1358 	LEN=2 
                           000003  1359 	PSTR=3
                           000004  1360 	VSIZE=4 ;locals size
      00089F                       1361 itoa::
      00089F                       1362 	_vars VSIZE
      0088E5 72 5C            [ 2]    1     sub sp,#VSIZE 
      0088E7 00 02            [ 1] 1363 	clr (LEN,sp) ; string length  
      0088E9 20 F5            [ 1] 1364 	clr (SIGN,sp)    ; sign
      0088EB C6 00 0A         [ 1] 1365 	ld a,base 
      0088EB 72 B9            [ 1] 1366 	cp a,#10
      0088ED 00 01            [ 1] 1367 	jrne 1$
                                   1368 	; base 10 string display with negative sign if bit 23==1
      0088EF 90 FE A1 84 2A   [ 2] 1369 	btjf acc24,#7,1$
      0088F4 04 90            [ 1] 1370 	cpl (SIGN,sp)
      0088F6 DE 9F 7C         [ 4] 1371 	call neg_acc24
      0008B6                       1372 1$:
                                   1373 ; initialize string pointer 
      0088F9 51 72 5C         [ 2] 1374 	ldw x,#tib 
      0088FC 00 02 72         [ 2] 1375 	addw x,#TIB_SIZE
      0088FF 5C               [ 2] 1376 	decw x 
      008900 00               [ 1] 1377 	clr (x)
      008901 02               [ 2] 1378 	decw x 
      008902 A6 20            [ 1] 1379 	ld a,#32
      008902 81               [ 1] 1380 	ld (x),a
      008903 0C 02            [ 1] 1381 	inc (LEN,sp)
      0008C4                       1382 itoa_loop:
      008903 72 5F 00         [ 1] 1383     ld a,base
      008906 0C CF            [ 2] 1384 	ldw (PSTR,sp),x 
      008908 00 0D 72         [ 4] 1385     call divu24_8 ; acc24/A 
      00890B 0F 00            [ 2] 1386 	ldw x,(PSTR,sp)
      00890D 0D 04            [ 1] 1387     add a,#'0  ; remainder of division
      00890F 72 53            [ 1] 1388     cp a,#'9+1
      008911 00 0C            [ 1] 1389     jrmi 2$
      008913 AB 07            [ 1] 1390     add a,#7 
      0008D6                       1391 2$:	
      008913 CD               [ 2] 1392 	decw x
      008914 89               [ 1] 1393     ld (x),a
      008915 1F CD            [ 1] 1394 	inc (LEN,sp)
                                   1395 	; if acc24==0 conversion done
      008917 A7 F1 88         [ 1] 1396 	ld a,acc24
      00891A CD A0 74         [ 1] 1397 	or a,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      00891D 84 81 0D         [ 1] 1398 	or a,acc8
      00891F 26 DF            [ 1] 1399     jrne itoa_loop
                                   1400 	;conversion done, next add '$' or '-' as required
      00891F 52 04 0F         [ 1] 1401 	ld a,base 
      008922 02 0F            [ 1] 1402 	cp a,#16
      008924 01 C6            [ 1] 1403 	jreq 8$
      008926 00 0B            [ 1] 1404 	ld a,(SIGN,sp)
      008928 A1 0A            [ 1] 1405     jreq 10$
      00892A 26 0A            [ 1] 1406     ld a,#'-
      00892C 72 0F            [ 2] 1407 	jra 9$ 
                                   1408 ; don't print more than 4 digits
                                   1409 ; in hexadecimal to avoid '-' sign 
                                   1410 ; extend display 	
      00892E 00 0C            [ 1] 1411 8$: ld a,(LEN,sp) 
      008930 05 03            [ 1] 1412 	cp a,#6 
      008932 01 CD            [ 1] 1413 	jrmi 81$
      008934 89               [ 1] 1414 	incw x
      008935 EC 02            [ 1] 1415 	dec (LEN,sp)
      008936 20 F5            [ 2] 1416 	jra 8$
      0008FF                       1417 81$:	
      008936 AE 16            [ 1] 1418 	ld a,#'$ 
      008938 90               [ 2] 1419 9$: decw x
      008939 1C               [ 1] 1420     ld (x),a
      00893A 00 50            [ 1] 1421 	inc (LEN,sp)
      000905                       1422 10$:
      00893C 5A 7F            [ 1] 1423 	ld a,(LEN,sp)
      000907                       1424 	_drop VSIZE
      00893E 5A A6            [ 2]    1     addw sp,#VSIZE 
      008940 20               [ 4] 1425 	ret
                                   1426 
                                   1427 ;-------------------------------------
                                   1428 ; divide uint24_t by uint8_t
                                   1429 ; used to convert uint24_t to string
                                   1430 ; input:
                                   1431 ;	acc24	dividend
                                   1432 ;   A 		divisor
                                   1433 ; output:
                                   1434 ;   acc24	quotient
                                   1435 ;   A		remainder
                                   1436 ;------------------------------------- 
                                   1437 ; offset  on sp of arguments and locals
                           000001  1438 	U8   = 1   ; divisor on stack
                           000001  1439 	VSIZE =1
      00090A                       1440 divu24_8:
      008941 F7               [ 2] 1441 	pushw x ; save x
      008942 0C               [ 1] 1442 	push a 
                                   1443 	; ld dividend UU:MM bytes in X
      008943 02 00 0B         [ 1] 1444 	ld a, acc24
      008944 95               [ 1] 1445 	ld xh,a
      008944 C6 00 0B         [ 1] 1446 	ld a,acc24+1
      008947 1F               [ 1] 1447 	ld xl,a
      008948 03 CD            [ 1] 1448 	ld a,(U8,SP) ; divisor
      00894A 89               [ 2] 1449 	div x,a ; UU:MM/U8
      00894B 8A               [ 1] 1450 	push a  ;save remainder
      00894C 1E               [ 1] 1451 	ld a,xh
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      00894D 03 AB 30         [ 1] 1452 	ld acc24,a
      008950 A1               [ 1] 1453 	ld a,xl
      008951 3A 2B 02         [ 1] 1454 	ld acc24+1,a
      008954 AB               [ 1] 1455 	pop a
      008955 07               [ 1] 1456 	ld xh,a
      008956 C6 00 0D         [ 1] 1457 	ld a,acc24+2
      008956 5A               [ 1] 1458 	ld xl,a
      008957 F7 0C            [ 1] 1459 	ld a,(U8,sp) ; divisor
      008959 02               [ 2] 1460 	div x,a  ; R:LL/U8
      00895A C6 00            [ 1] 1461 	ld (U8,sp),a ; save remainder
      00895C 0C               [ 1] 1462 	ld a,xl
      00895D CA 00 0D         [ 1] 1463 	ld acc24+2,a
      008960 CA               [ 1] 1464 	pop a
      008961 00               [ 2] 1465 	popw x
      008962 0E               [ 4] 1466 	ret
                                   1467 
                                   1468 ;--------------------------------------
                                   1469 ; unsigned multiply uint24_t by uint8_t
                                   1470 ; use to convert numerical string to uint24_t
                                   1471 ; input:
                                   1472 ;	acc24	uint24_t 
                                   1473 ;   A		uint8_t
                                   1474 ; output:
                                   1475 ;   acc24   A*acc24
                                   1476 ;-------------------------------------
                                   1477 ; local variables offset  on sp
                           000003  1478 	U8   = 3   ; A pushed on stack
                           000002  1479 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1480 	OVFH = 1  ; multiplication overflow high byte
                           000003  1481 	VSIZE = 3
      000932                       1482 mulu24_8:
      008963 26               [ 2] 1483 	pushw x    ; save X
                                   1484 	; local variables
      008964 DF               [ 1] 1485 	push a     ; U8
      008965 C6               [ 1] 1486 	clrw x     ; initialize overflow to 0
      008966 00               [ 2] 1487 	pushw x    ; multiplication overflow
                                   1488 ; multiply low byte.
      008967 0B A1 10         [ 1] 1489 	ld a,acc24+2
      00896A 27               [ 1] 1490 	ld xl,a
      00896B 08 7B            [ 1] 1491 	ld a,(U8,sp)
      00896D 01               [ 4] 1492 	mul x,a
      00896E 27               [ 1] 1493 	ld a,xl
      00896F 15 A6 2D         [ 1] 1494 	ld acc24+2,a
      008972 20               [ 1] 1495 	ld a, xh
      008973 0D 7B            [ 1] 1496 	ld (OVFL,sp),a
                                   1497 ; multipy middle byte
      008975 02 A1 06         [ 1] 1498 	ld a,acc24+1
      008978 2B               [ 1] 1499 	ld xl,a
      008979 05 5C            [ 1] 1500 	ld a, (U8,sp)
      00897B 0A               [ 4] 1501 	mul x,a
                                   1502 ; add overflow to this partial product
      00897C 02 20 F5         [ 2] 1503 	addw x,(OVFH,sp)
      00897F 9F               [ 1] 1504 	ld a,xl
      00897F A6 24 5A         [ 1] 1505 	ld acc24+1,a
      008982 F7               [ 1] 1506 	clr a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008983 0C 02            [ 1] 1507 	adc a,#0
      008985 6B 01            [ 1] 1508 	ld (OVFH,sp),a
      008985 7B               [ 1] 1509 	ld a,xh
      008986 02 5B            [ 1] 1510 	ld (OVFL,sp),a
                                   1511 ; multiply most signficant byte	
      008988 04 81 0B         [ 1] 1512 	ld a, acc24
      00898A 97               [ 1] 1513 	ld xl, a
      00898A 89 88            [ 1] 1514 	ld a, (U8,sp)
      00898C C6               [ 4] 1515 	mul x,a
      00898D 00 0C 95         [ 2] 1516 	addw x, (OVFH,sp)
      008990 C6               [ 1] 1517 	ld a, xl
      008991 00 0D 97         [ 1] 1518 	ld acc24,a
      008994 7B 01            [ 2] 1519     addw sp,#VSIZE
      008996 62               [ 2] 1520 	popw x
      008997 88               [ 4] 1521 	ret
                                   1522 
                                   1523 ;------------------------------------
                                   1524 ;  two's complement acc24
                                   1525 ;  input:
                                   1526 ;		acc24 variable
                                   1527 ;  output:
                                   1528 ;		acc24 variable
                                   1529 ;-------------------------------------
      00096C                       1530 neg_acc24:
      008998 9E C7 00 0C      [ 1] 1531 	cpl acc24+2
      00899C 9F C7 00 0D      [ 1] 1532 	cpl acc24+1
      0089A0 84 95 C6 00      [ 1] 1533 	cpl acc24
      0089A4 0E 97            [ 1] 1534 	ld a,#1
      0089A6 7B 01 62         [ 1] 1535 	add a,acc24+2
      0089A9 6B 01 9F         [ 1] 1536 	ld acc24+2,a
      0089AC C7               [ 1] 1537 	clr a
      0089AD 00 0E 84         [ 1] 1538 	adc a,acc24+1
      0089B0 85 81 0C         [ 1] 1539 	ld acc24+1,a 
      0089B2 4F               [ 1] 1540 	clr a 
      0089B2 89 88 5F         [ 1] 1541 	adc a,acc24 
      0089B5 89 C6 00         [ 1] 1542 	ld acc24,a 
      0089B8 0E               [ 4] 1543 	ret
                                   1544 
                                   1545 
                                   1546 
                                   1547 
                                   1548 ;------------------------------------
                                   1549 ; convert alpha to uppercase
                                   1550 ; input:
                                   1551 ;    a  character to convert
                                   1552 ; output:
                                   1553 ;    a  uppercase character
                                   1554 ;------------------------------------
      00098F                       1555 to_upper::
      0089B9 97 7B            [ 1] 1556 	cp a,#'a
      0089BB 03 42            [ 1] 1557 	jrpl 1$
      0089BD 9F               [ 4] 1558 0$:	ret
      0089BE C7 00            [ 1] 1559 1$: cp a,#'z	
      0089C0 0E 9E            [ 1] 1560 	jrugt 0$
      0089C2 6B 02            [ 1] 1561 	sub a,#32
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0089C4 C6               [ 4] 1562 	ret
                                   1563 	
                                   1564 ;------------------------------------
                                   1565 ; convert pad content in integer
                                   1566 ; input:
                                   1567 ;    x		.asciz to convert
                                   1568 ; output:
                                   1569 ;    acc24      int24_t
                                   1570 ;------------------------------------
                                   1571 	; local variables
                           000001  1572 	SIGN=1 ; 1 byte, 
                           000002  1573 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  1574 	TEMP=3 ; 1 byte, temporary storage
                           000003  1575 	VSIZE=3 ; 3 bytes reserved for local storage
      00099B                       1576 atoi24::
      0089C5 00               [ 2] 1577 	pushw x 
      00099C                       1578 	_vars VSIZE
      0089C6 0D 97            [ 2]    1     sub sp,#VSIZE 
                                   1579 	; acc24=0 
      0089C8 7B 03 42 72      [ 1] 1580 	clr acc24    
      0089CC FB 01 9F C7      [ 1] 1581 	clr acc16
      0089D0 00 0D 4F A9      [ 1] 1582 	clr acc8 
      0089D4 00 6B            [ 1] 1583 	clr (SIGN,sp)
      0089D6 01 9E            [ 1] 1584 	ld a,#10
      0089D8 6B 02            [ 1] 1585 	ld (BASE,sp),a ; default base decimal
      0089DA C6               [ 1] 1586 	ld a,(x)
      0089DB 00 0C            [ 1] 1587 	jreq 9$  ; completed if 0
      0089DD 97 7B            [ 1] 1588 	cp a,#'-
      0089DF 03 42            [ 1] 1589 	jrne 1$
      0089E1 72 FB            [ 1] 1590 	cpl (SIGN,sp)
      0089E3 01 9F            [ 2] 1591 	jra 2$
      0089E5 C7 00            [ 1] 1592 1$: cp a,#'$
      0089E7 0C 5B            [ 1] 1593 	jrne 3$
      0089E9 03 85            [ 1] 1594 	ld a,#16
      0089EB 81 02            [ 1] 1595 	ld (BASE,sp),a
      0089EC 5C               [ 1] 1596 2$:	incw x
      0089EC 72               [ 1] 1597 	ld a,(x)
      0009C5                       1598 3$:	
      0089ED 53 00            [ 1] 1599 	cp a,#'a
      0089EF 0E 72            [ 1] 1600 	jrmi 4$
      0089F1 53 00            [ 1] 1601 	sub a,#32
      0089F3 0D 72            [ 1] 1602 4$:	cp a,#'0
      0089F5 53 00            [ 1] 1603 	jrmi 9$
      0089F7 0C A6            [ 1] 1604 	sub a,#'0
      0089F9 01 CB            [ 1] 1605 	cp a,#10
      0089FB 00 0E            [ 1] 1606 	jrmi 5$
      0089FD C7 00            [ 1] 1607 	sub a,#7
      0089FF 0E 4F            [ 1] 1608 	cp a,(BASE,sp)
      008A01 C9 00            [ 1] 1609 	jrpl 9$
      008A03 0D C7            [ 1] 1610 5$:	ld (TEMP,sp),a
      008A05 00 0D            [ 1] 1611 	ld a,(BASE,sp)
      008A07 4F C9 00         [ 4] 1612 	call mulu24_8
      008A0A 0C C7            [ 1] 1613 	ld a,(TEMP,sp)
      008A0C 00 0C 81         [ 1] 1614 	add a,acc24+2
      008A0F C7 00 0D         [ 1] 1615 	ld acc24+2,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A0F A1               [ 1] 1616 	clr a
      008A10 61 2A 01         [ 1] 1617 	adc a,acc24+1
      008A13 81 A1 7A         [ 1] 1618 	ld acc24+1,a
      008A16 22               [ 1] 1619 	clr a
      008A17 FB A0 20         [ 1] 1620 	adc a,acc24
      008A1A 81 00 0B         [ 1] 1621 	ld acc24,a
      008A1B 20 C9            [ 2] 1622 	jra 2$
      008A1B 89 52            [ 1] 1623 9$:	tnz (SIGN,sp)
      008A1D 03 72            [ 1] 1624     jreq atoi_exit
      008A1F 5F 00 0C         [ 4] 1625     call neg_acc24
      000A01                       1626 atoi_exit: 
      000A01                       1627 	_drop VSIZE
      008A22 72 5F            [ 2]    1     addw sp,#VSIZE 
      008A24 00               [ 2] 1628 	popw x ; restore x
      008A25 0D               [ 4] 1629 	ret
                                   1630 
                                   1631 
                                   1632 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1633 ;;   TINY BASIC  operators,
                                   1634 ;;   commands and functions 
                                   1635 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1636 
                                   1637 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1638 ;;  Arithmetic operators
                                   1639 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1640 
                                   1641 ;debug support
                           000001  1642 DEBUG_PRT=1
                           000001  1643 .if DEBUG_PRT 
                           000001  1644 	REGA=1
                           000002  1645 	SAVEB=2
                           000003  1646 	REGX=3
                           000005  1647 	REGY=5
                           000007  1648 	ACC24=7
                           000009  1649 	VSIZE=9 
      000A05                       1650 printxy:
      000A05                       1651 	_vars VSIZE 
      008A26 72 5F            [ 2]    1     sub sp,#VSIZE 
      008A28 00 0E            [ 1] 1652 	ld (REGA,sp),a 
      008A2A 0F 01 A6         [ 1] 1653 	ld a,base 
      008A2D 0A 6B            [ 1] 1654 	ld (SAVEB,sp),a
      008A2F 02 F6            [ 2] 1655 	ldw (REGX,sp),x
      008A31 27 47            [ 2] 1656 	ldw (REGY,sp),y
      008A33 A1 2D 26         [ 2] 1657 	ldw x,acc24 
      008A36 04 03 01         [ 1] 1658 	ld a,acc8 
      008A39 20 08            [ 2] 1659 	ldw (ACC24,sp),x 
      008A3B A1 24            [ 1] 1660 	ld (ACC24+2,sp),a 
      008A3D 26 06 A6 10      [ 1] 1661 	mov base,#16 
      008A41 6B               [ 1] 1662 	clrw x 
      008A42 02 5C            [ 1] 1663 	ld a,(REGA,sp)
      008A44 F6               [ 1] 1664 	ld xl,a 
      008A45 CD 08 83         [ 4] 1665 	call print_int
      008A45 A1 61            [ 1] 1666 	ld a,#SPACE 
      008A47 2B 02 A0         [ 4] 1667 	call putc  
      008A4A 20 A1            [ 2] 1668 	ldw x,(REGX,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A4C 30 2B 2B         [ 4] 1669 	call print_int 
      008A4F A0 30            [ 1] 1670 	ld a,#SPACE 
      008A51 A1 0A 2B         [ 4] 1671 	call putc  
      008A54 06 A0            [ 2] 1672 	ldw x,(REGY,sp)
      008A56 07 11 02         [ 4] 1673 	call print_int 
      008A59 2A 1F            [ 1] 1674 	ld a,#CR 
      008A5B 6B 03 7B         [ 4] 1675 	call putc 
      008A5E 02 CD            [ 1] 1676 	ld a,(ACC24+2,sp)
      008A60 89 B2            [ 2] 1677 	ldw x,(ACC24,sp)
      008A62 7B 03 CB         [ 2] 1678 	ldw acc24,x 
      008A65 00 0E C7         [ 1] 1679 	ld acc8,a
      008A68 00 0E            [ 1] 1680 	ld a,(SAVEB,sp)
      008A6A 4F C9 00         [ 1] 1681 	ld base,a 
      008A6D 0D C7            [ 1] 1682 	ld a,(REGA,sp)
      008A6F 00 0D            [ 2] 1683 	ldw x,(REGX,sp)
      008A71 4F C9            [ 2] 1684 	ldw y,(REGY,sp)
      000A55                       1685 	_drop VSIZE 
      008A73 00 0C            [ 2]    1     addw sp,#VSIZE 
      008A75 C7               [ 4] 1686 	ret 
                                   1687 .endif 
                                   1688 
                                   1689 
                                   1690 ;--------------------------------------
                                   1691 ;  multiply 2 uint16_t return uint32_t
                                   1692 ;  input:
                                   1693 ;     x       uint16_t 
                                   1694 ;     y       uint16_t 
                                   1695 ;  output:
                                   1696 ;     x       product bits 15..0
                                   1697 ;     y       product bits 31..16 
                                   1698 ;---------------------------------------
                           000001  1699 		U1=1  ; uint16_t 
                           000003  1700 		DBL=3 ; uint32_t
                           000006  1701 		VSIZE=6
      000A58                       1702 umstar:
      000A58                       1703 	_vars VSIZE 
      008A76 00 0C            [ 2]    1     sub sp,#VSIZE 
      008A78 20 C9            [ 2] 1704 	ldw (U1,sp),x 
                                   1705 ;initialize bits 31..16 of 
                                   1706 ;product to zero 
      008A7A 0D 01            [ 1] 1707 	clr (DBL,sp)
      008A7C 27 03            [ 1] 1708 	clr (DBL+1,sp)
                                   1709 ; produc U1L*U2L 
      008A7E CD 89            [ 1] 1710 	ld a,yl 
      008A80 EC               [ 4] 1711 	mul x,a 
      008A81 1F 05            [ 2] 1712 	ldw (DBL+2,sp),x
                                   1713 ; product U1H*U2L 
      008A81 5B 03            [ 1] 1714 	ld a,(U1,sp) ; xh 
      008A83 85               [ 1] 1715 	ldw x,y
      008A84 81               [ 4] 1716 	mul x,a 
      008A85 4F               [ 1] 1717 	clr a 
      008A85 52 09 6B         [ 2] 1718 	addw x,(DBL+1,sp) 
      008A88 01               [ 1] 1719 	clr a 
      008A89 C6 00            [ 1] 1720 	adc a,(DBL,sp) 
      008A8B 0B 6B            [ 1] 1721 	ld (DBL,sp),a ; bits 23..17 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008A8D 02 1F            [ 2] 1722 	ldw (DBL+1,sp),x ; bits 15..0 
                                   1723 ; product U1L*U2H
      008A8F 03 17            [ 1] 1724 	swapw y 
      008A91 05               [ 1] 1725 	ldw x,y
      008A92 CE 00            [ 1] 1726 	ld a,(U1+1,sp)
      008A94 0C               [ 4] 1727 	mul x,a
      008A95 C6 00 0E         [ 2] 1728 	addw x,(DBL+1,sp)
      008A98 1F               [ 1] 1729 	clr a 
      008A99 07 6B            [ 1] 1730 	adc a,(DBL,sp)
      008A9B 09 35            [ 1] 1731 	ld (DBL,sp),a 
      008A9D 10 00            [ 2] 1732 	ldw (DBL+1,sp),x 
                                   1733 ; product U1H*U2H 	
      008A9F 0B 5F            [ 1] 1734 	ld a,(U1,sp)
      008AA1 7B               [ 1] 1735 	ldw x,y  
      008AA2 01               [ 4] 1736 	mul x,a 
      008AA3 97 CD 89         [ 2] 1737 	addw x,(DBL,sp)
      008AA6 03 A6            [ 1] 1738 	ldw y,x 
      008AA8 20 CD            [ 2] 1739 	ldw x,(DBL+2,sp)
      000A8F                       1740 	_drop VSIZE 
      008AAA 83 41            [ 2]    1     addw sp,#VSIZE 
      008AAC 1E               [ 4] 1741 	ret
                                   1742 
                                   1743 
                                   1744 ;-------------------------------------
                                   1745 ; multiply 2 integers
                                   1746 ; input:
                                   1747 ;  	x       n1 
                                   1748 ;   y 		n2 
                                   1749 ; output:
                                   1750 ;	X        N1*N2 bits 15..0
                                   1751 ;   Y        N1*N2 bits 31..16 
                                   1752 ;-------------------------------------
                           000001  1753 	SIGN=1
                           000001  1754 	VSIZE=1
      000A92                       1755 multiply:
      000A92                       1756 	_vars VSIZE 
      008AAD 03 CD            [ 2]    1     sub sp,#VSIZE 
      008AAF 89 03            [ 1] 1757 	clr (SIGN,sp)
      008AB1 A6               [ 1] 1758 	ld a,xh 
      008AB2 20 CD            [ 1] 1759 	and a,#0x80
      008AB4 83 41            [ 1] 1760 	jrpl 1$
      008AB6 1E 05            [ 1] 1761 	cpl (SIGN,sp)
      008AB8 CD               [ 2] 1762 	negw x 
      000A9E                       1763 1$:	
      008AB9 89 03            [ 1] 1764 	ld a,yh
      008ABB A6 0D            [ 1] 1765 	and a,#0x80  
      008ABD CD 83            [ 1] 1766 	jrpl 2$ 
      008ABF 41 7B            [ 1] 1767 	cpl (SIGN,sp)
      008AC1 09 1E            [ 2] 1768 	negw y 
      000AA8                       1769 2$:	
      008AC3 07 CF 00         [ 4] 1770 	call umstar
      008AC6 0C C7            [ 1] 1771 	ld a,(SIGN,sp)
      008AC8 00 0E            [ 1] 1772 	jreq 3$
      008ACA 7B 02 C7         [ 4] 1773 	call dneg 
      000AB2                       1774 3$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      000AB2                       1775 	_drop VSIZE 
      008ACD 00 0B            [ 2]    1     addw sp,#VSIZE 
      008ACF 7B               [ 4] 1776 	ret
                                   1777 
                                   1778 ;--------------------------------------
                                   1779 ; divide uint32_t/uint16_t
                                   1780 ; return:  quotient and remainder 
                                   1781 ; quotient expected to be uint16_t 
                                   1782 ; input:
                                   1783 ;   DBLDIVDND    on stack 
                                   1784 ;   X            divisor 
                                   1785 ; output:
                                   1786 ;   X            quotient 
                                   1787 ;   Y            remainder 
                                   1788 ;---------------------------------------
                           000003  1789 	VSIZE=3
      000AB5                       1790 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000AB5                       1791 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   1792 	; local variables 
                           000001  1793 	DIVISOR=1 
                           000003  1794 	CNTR=3 
      000AB5                       1795 udiv32_16:
      000AB5                       1796 	_vars VSIZE 
      008AD0 01 1E            [ 2]    1     sub sp,#VSIZE 
      008AD2 03 16            [ 2] 1797 	ldw (DIVISOR,sp),x	; save divisor 
      008AD4 05 5B            [ 2] 1798 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008AD6 09 81            [ 2] 1799 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008AD8 90 5D            [ 2] 1800 	tnzw y
      008AD8 52 06            [ 1] 1801 	jrne long_division 
      008ADA 1F 01            [ 2] 1802 	ldw y,(DIVISOR,sp)
      008ADC 0F               [ 2] 1803 	divw x,y
      000AC4                       1804 	_drop VSIZE 
      008ADD 03 0F            [ 2]    1     addw sp,#VSIZE 
      008ADF 04               [ 4] 1805 	ret
      000AC7                       1806 long_division:
      008AE0 90               [ 1] 1807 	exgw x,y ; hi in x, lo in y 
      008AE1 9F 42            [ 1] 1808 	ld a,#17 
      008AE3 1F 05            [ 1] 1809 	ld (CNTR,sp),a
      000ACC                       1810 1$:
      008AE5 7B 01            [ 2] 1811 	cpw x,(DIVISOR,sp)
      008AE7 93 42            [ 1] 1812 	jrmi 2$
      008AE9 4F 72 FB         [ 2] 1813 	subw x,(DIVISOR,sp)
      008AEC 04               [ 1] 1814 2$:	ccf 
      008AED 4F 19            [ 2] 1815 	rlcw y 
      008AEF 03               [ 2] 1816 	rlcw x 
      008AF0 6B 03            [ 1] 1817 	dec (CNTR,sp)
      008AF2 1F 04            [ 1] 1818 	jrne 1$
      008AF4 90               [ 1] 1819 	exgw x,y 
      000ADC                       1820 	_drop VSIZE 
      008AF5 5E 93            [ 2]    1     addw sp,#VSIZE 
      008AF7 7B               [ 4] 1821 	ret
                                   1822 
                                   1823 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1824 ; negate double int.
                                   1825 ; input:
                                   1826 ;   x     bits 15..0
                                   1827 ;   y     bits 31..16
                                   1828 ; output: 
                                   1829 ;   x     bits 15..0
                                   1830 ;   y     bits 31..16
                                   1831 ;-----------------------------
      000ADF                       1832 dneg:
      008AF8 02               [ 2] 1833 	cplw x 
      008AF9 42 72            [ 2] 1834 	cplw y 
      008AFB FB 04 4F         [ 2] 1835 	addw x,#1 
      008AFE 19 03            [ 1] 1836 	jrnc 1$
      008B00 6B 03            [ 1] 1837 	incw y 
      008B02 1F               [ 4] 1838 1$: ret 
                                   1839 
                                   1840 
                                   1841 ;--------------------------------
                                   1842 ; sign extend single to double
                                   1843 ; input:
                                   1844 ;   x    int16_t
                                   1845 ; output:
                                   1846 ;   x    int32_t bits 15..0
                                   1847 ;   y    int32_t bits 31..16
                                   1848 ;--------------------------------
      000AEA                       1849 dbl_sign_extend:
      008B03 04 7B            [ 1] 1850 	clrw y
      008B05 01               [ 1] 1851 	ld a,xh 
      008B06 93 42            [ 1] 1852 	and a,#0x80 
      008B08 72 FB            [ 1] 1853 	jreq 1$
      008B0A 03 90            [ 2] 1854 	cplw y
      008B0C 93               [ 4] 1855 1$: ret 	
                                   1856 
                                   1857 
                                   1858 ;----------------------------------
                                   1859 ;  euclidian divide dbl/n1 
                                   1860 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   1861 ; input:
                                   1862 ;    dbl    int32_t on stack 
                                   1863 ;    x 		n1   int16_t  disivor  
                                   1864 ; output:
                                   1865 ;    X      dbl/x  int16_t 
                                   1866 ;    Y      remainder int16_t 
                                   1867 ;----------------------------------
                           000008  1868 	VSIZE=8
      000AF4                       1869 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000AF4                       1870 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000AF4                       1871 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   1872 	; local variables
                           000001  1873 	DBLHI=1
                           000003  1874 	DBLLO=3 
                           000005  1875 	SDIVSR=5 ; sign divisor
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                           000006  1876 	SQUOT=6 ; sign dividend 
                           000007  1877 	DIVISR=7 ; divisor 
      000AF4                       1878 div32_16:
      000AF4                       1879 	_vars VSIZE 
      008B0D 1E 05            [ 2]    1     sub sp,#VSIZE 
      008B0F 5B 06            [ 1] 1880 	clr (SDIVSR,sp)
      008B11 81 06            [ 1] 1881 	clr (SQUOT,sp)
                                   1882 ; copy arguments 
      008B12 16 0B            [ 2] 1883 	ldw y,(DIVDNDHI,sp)
      008B12 52 01            [ 2] 1884 	ldw (DBLHI,sp),y
      008B14 0F 01            [ 2] 1885 	ldw y,(DIVDNDLO,sp)
      008B16 9E A4            [ 2] 1886 	ldw (DBLLO,sp),y 
                                   1887 ; check for 0 divisor
      008B18 80               [ 2] 1888 	tnzw x 
      008B19 2A 03            [ 1] 1889     jrne 0$
      008B1B 03 01            [ 1] 1890 	ld a,#ERR_DIV0 
      008B1D 50 07 3B         [ 2] 1891 	jp tb_error 
                                   1892 ; check divisor sign 	
      008B1E 9E               [ 1] 1893 0$:	ld a,xh 
      008B1E 90 9E            [ 1] 1894 	and a,#0x80 
      008B20 A4 80            [ 1] 1895 	jreq 1$
      008B22 2A 04            [ 1] 1896 	cpl (SDIVSR,sp)
      008B24 03 01            [ 1] 1897 	cpl (SQUOT,sp)
      008B26 90               [ 2] 1898 	negw x
      008B27 50 07            [ 2] 1899 1$:	ldw (DIVISR,sp),x
                                   1900 ; check dividend sign 	 
      008B28 7B 01            [ 1] 1901  	ld a,(DBLHI,sp) 
      008B28 CD 8A            [ 1] 1902 	and a,#0x80 
      008B2A D8 7B            [ 1] 1903 	jreq 2$ 
      008B2C 01 27            [ 1] 1904 	cpl (SQUOT,sp)
      008B2E 03 CD            [ 2] 1905 	ldw x,(DBLLO,sp)
      008B30 8B 5F            [ 2] 1906 	ldw y,(DBLHI,sp)
      008B32 CD 0A DF         [ 4] 1907 	call dneg 
      008B32 5B 01            [ 2] 1908 	ldw (DBLLO,sp),x 
      008B34 81 01            [ 2] 1909 	ldw (DBLHI,sp),y 
      008B35 1E 07            [ 2] 1910 2$:	ldw x,(DIVISR,sp)
      008B35 52 03 1F         [ 4] 1911 	call udiv32_16
      008B38 01 1E            [ 2] 1912 	tnzw y 
      008B3A 08 16            [ 1] 1913 	jreq 3$ 
                                   1914 ; x=quotient 
                                   1915 ; y=remainder 
                                   1916 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008B3C 06 90            [ 1] 1917 	ld a,(SQUOT,sp)
      008B3E 5D 26            [ 1] 1918 	xor a,(SDIVSR,sp)
      008B40 06 16            [ 1] 1919 	jreq 3$
      008B42 01               [ 1] 1920 	incw x 
      008B43 65 5B 03 81      [ 2] 1921 	ldw acc16,y 
      008B47 16 07            [ 2] 1922 	ldw y,(DIVISR,sp)
      008B47 51 A6 11 6B      [ 2] 1923 	subw y,acc16
                                   1924 ; sign quotient
      008B4B 03 06            [ 1] 1925 3$:	ld a,(SQUOT,sp)
      008B4C 27 01            [ 1] 1926 	jreq 4$
      008B4C 13               [ 2] 1927 	negw x 
      000B48                       1928 4$:	
      000B48                       1929 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008B4D 01 2B            [ 2]    1     addw sp,#VSIZE 
      008B4F 03               [ 4] 1930 	ret 
                                   1931 
                                   1932 
                                   1933 
                                   1934 ;----------------------------------
                                   1935 ; division x/y 
                                   1936 ; input:
                                   1937 ;    X       dividend
                                   1938 ;    Y       divisor 
                                   1939 ; output:
                                   1940 ;    X       quotient
                                   1941 ;    Y       remainder 
                                   1942 ;-----------------------------------
                           000004  1943 	VSIZE=4 
                                   1944 	; local variables 
                           000001  1945 	DBLHI=1
                           000003  1946 	DBLLO=3
      000B4B                       1947 divide: 
      000B4B                       1948 	_vars VSIZE 
      008B50 72 F0            [ 2]    1     sub sp,#VSIZE 
      008B52 01 8C 90 59      [ 2] 1949 	ldw acc16,y
      008B56 59 0A 03         [ 4] 1950 	call dbl_sign_extend
      008B59 26 F1            [ 2] 1951 	ldw (DBLLO,sp),x 
      008B5B 51 5B            [ 2] 1952 	ldw (DBLHI,sp),y 
      008B5D 03 81 0C         [ 2] 1953 	ldw x,acc16 
      008B5F CD 0A F4         [ 4] 1954 	call div32_16 
      000B5E                       1955 	_drop VSIZE 
      008B5F 53 90            [ 2]    1     addw sp,#VSIZE 
      008B61 53               [ 4] 1956 	ret
                                   1957 
                                   1958 
                                   1959 ;----------------------------------
                                   1960 ;  remainder resulting from euclidian 
                                   1961 ;  division of x/y 
                                   1962 ; input:
                                   1963 ;   x   	dividend int16_t 
                                   1964 ;   y 		divisor int16_t
                                   1965 ; output:
                                   1966 ;   X       n1%n2 
                                   1967 ;----------------------------------
      000B61                       1968 modulo:
      008B62 1C 00 01         [ 4] 1969 	call divide
      008B65 24               [ 1] 1970 	ldw x,y 
      008B66 02               [ 4] 1971 	ret 
                                   1972 
                                   1973 ;----------------------------------
                                   1974 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   1975 ; return expr1*expr2/expr3 
                                   1976 ; product result is int32_t and 
                                   1977 ; divisiont is int32_t/int16_t
                                   1978 ;----------------------------------
                           000004  1979 	DBL_SIZE=4 
      000B66                       1980 muldiv:
      008B67 90 5C 81         [ 4] 1981 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008B6A A1 03            [ 1] 1982 	cp a,#3 
      008B6A 90 5F            [ 1] 1983 	jreq 1$
      008B6C 9E A4 80         [ 2] 1984 	jp syntax_error
      000B70                       1985 1$: 
      008B6F 27 02            [ 2] 1986 	ldw x,(5,sp) ; expr1
      008B71 90 53            [ 2] 1987 	ldw y,(3,sp) ; expr2
      008B73 81 0A 92         [ 4] 1988 	call multiply 
      008B74 1F 05            [ 2] 1989 	ldw (5,sp),x  ;int32_t 15..0
      008B74 52 08            [ 2] 1990 	ldw (3,sp),y  ;int32_t 31..16
      008B76 0F               [ 2] 1991 	popw x        ; expr3 
      008B77 05 0F 06         [ 4] 1992 	call div32_16 ; int32_t/expr3 
      000B7F                       1993 	_drop DBL_SIZE
      008B7A 16 0B            [ 2]    1     addw sp,#DBL_SIZE 
      008B7C 17               [ 4] 1994 	ret 
                                   1995 
                                   1996 
                                   1997 ;---------------------------------
                                   1998 ; dictionary search 
                                   1999 ; input:
                                   2000 ;	X 		dictionary entry point, name field  
                                   2001 ;   y		.asciz name to search 
                                   2002 ; output:
                                   2003 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2004 ;  X		cmd_index
                                   2005 ;---------------------------------
                           000001  2006 	NLEN=1 ; cmd length 
                           000002  2007 	XSAVE=2
                           000004  2008 	YSAVE=4
                           000005  2009 	VSIZE=5 
      000B82                       2010 search_dict::
      000B82                       2011 	_vars VSIZE 
      008B7D 01 16            [ 2]    1     sub sp,#VSIZE 
                                   2012 
      008B7F 0D 17            [ 2] 2013 	ldw (YSAVE,sp),y 
      000B86                       2014 search_next:
      008B81 03 5D            [ 2] 2015 	ldw (XSAVE,sp),x 
                                   2016 ; get name length in dictionary	
      008B83 26               [ 1] 2017 	ld a,(x)
      008B84 05 A6            [ 1] 2018 	and a,#0xf 
      008B86 04 CC            [ 1] 2019 	ld (NLEN,sp),a  
      008B88 87 BB            [ 2] 2020 	ldw y,(YSAVE,sp) ; name pointer 
      008B8A 9E               [ 1] 2021 	incw x 
      000B90                       2022 cp_loop:
      008B8B A4 80            [ 1] 2023 	ld a,(y)
      008B8D 27 05            [ 1] 2024 	jreq str_match 
      008B8F 03 05            [ 1] 2025 	tnz (NLEN,sp)
      008B91 03 06            [ 1] 2026 	jreq no_match  
      008B93 50               [ 1] 2027 	cp a,(x)
      008B94 1F 07            [ 1] 2028 	jrne no_match 
      008B96 7B 01            [ 1] 2029 	incw y 
      008B98 A4               [ 1] 2030 	incw x
      008B99 80 27            [ 1] 2031 	dec (NLEN,sp)
      008B9B 0D 03            [ 2] 2032 	jra cp_loop 
      000BA2                       2033 no_match:
      008B9D 06 1E            [ 2] 2034 	ldw x,(XSAVE,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008B9F 03 16 01         [ 2] 2035 	subw x,#2 ; move X to link field
      008BA2 CD 8B            [ 1] 2036 	push #TK_NONE 
      008BA4 5F               [ 2] 2037 	ldw x,(x) ; next word link 
      008BA5 1F               [ 1] 2038 	pop a ; TK_NONE 
      008BA6 03 17            [ 1] 2039 	jreq search_exit  ; not found  
                                   2040 ;try next 
      008BA8 01 1E            [ 2] 2041 	jra search_next
      000BAF                       2042 str_match:
      008BAA 07 CD            [ 2] 2043 	ldw x,(XSAVE,sp)
      008BAC 8B               [ 1] 2044 	ld a,(X)
      008BAD 35 90            [ 1] 2045 	ld (NLEN,sp),a ; needed to test keyword type  
      008BAF 5D 27            [ 1] 2046 	and a,#0xf 
                                   2047 ; move x to procedure address field 	
      008BB1 11               [ 1] 2048 	inc a 
      008BB2 7B 06 18         [ 1] 2049 	ld acc8,a 
      008BB5 05 27 0B 5C      [ 1] 2050 	clr acc16 
      008BB9 90 CF 00 0D      [ 2] 2051 	addw x,acc16 
      008BBD 16               [ 2] 2052 	ldw x,(x) ; routine index  
                                   2053 ;determine keyword type bits 7:6 
      008BBE 07 72            [ 1] 2054 	ld a,(NLEN,sp)
      008BC0 B2               [ 1] 2055 	swap a 
      008BC1 00 0D            [ 1] 2056 	and a,#0xc
      008BC3 7B               [ 1] 2057 	srl a
      008BC4 06               [ 1] 2058 	srl a 
      008BC5 27 01            [ 1] 2059 	add a,#128
      000BCC                       2060 search_exit: 
      000BCC                       2061 	_drop VSIZE 	 
      008BC7 50 05            [ 2]    1     addw sp,#VSIZE 
      008BC8 81               [ 4] 2062 	ret 
                                   2063 
                                   2064 ;---------------------
                                   2065 ; check if next token
                                   2066 ;  is of expected type 
                                   2067 ; input:
                                   2068 ;   A 		 expected token attribute
                                   2069 ;  ouput:
                                   2070 ;   none     if fail call syntax_error 
                                   2071 ;--------------------
      000BCF                       2072 expect:
      008BC8 5B               [ 1] 2073 	push a 
      008BC9 08 81 28         [ 4] 2074 	call next_token 
      008BCB 11 01            [ 1] 2075 	cp a,(1,sp)
      008BCB 52 04            [ 1] 2076 	jreq 1$
      008BCD 90 CF 00         [ 2] 2077 	jp syntax_error
      008BD0 0D               [ 1] 2078 1$: pop a 
      008BD1 CD               [ 4] 2079 	ret 
                                   2080 
                                   2081 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2082 ; parse arguments list 
                                   2083 ; between ()
                                   2084 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BDC                       2085 func_args:
      008BD2 8B 6A            [ 1] 2086 	ld a,#TK_LPAREN 
      008BD4 1F 03 17         [ 4] 2087 	call expect 
                                   2088 ; expected to continue in arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2089 ; caller must check for TK_RPAREN 
                                   2090 
                                   2091 ;-------------------------------
                                   2092 ; parse embedded BASIC routines 
                                   2093 ; arguments list.
                                   2094 ; arg_list::=  rel[','rel]*
                                   2095 ; all arguments are of integer type
                                   2096 ; and pushed on stack 
                                   2097 ; input:
                                   2098 ;   none
                                   2099 ; output:
                                   2100 ;   stack{n}   arguments pushed on stack
                                   2101 ;   A 	number of arguments pushed on stack  
                                   2102 ;--------------------------------
      000BE1                       2103 arg_list:
      008BD7 01 CE            [ 1] 2104 	push #0  
      008BD9 00 0D CD         [ 4] 2105 1$: call relation
      008BDC 8B 74            [ 1] 2106 	cp a,#TK_NONE 
      008BDE 5B 04            [ 1] 2107 	jreq 5$
      008BE0 81 84            [ 1] 2108 	cp a,#TK_INTGR
      008BE1 26 13            [ 1] 2109 	jrne 4$
      000BEE                       2110 3$: 
                                   2111 ; swap return address with argument
      008BE1 CD               [ 1] 2112 	pop a ; arg_count
      008BE2 8B CB            [ 2] 2113 	popw y ; return address 
      008BE4 93               [ 2] 2114 	pushw x ; new argument 
      008BE5 81 89            [ 2] 2115 	pushw y 
      008BE6 4C               [ 1] 2116     inc a
      008BE6 CD               [ 1] 2117 	push a 
      008BE7 8C 5C A1         [ 4] 2118 	call next_token 
      008BEA 03 27            [ 1] 2119 	cp a,#TK_COMMA 
      008BEC 03 CC            [ 1] 2120 	jreq 1$ 
      008BEE 87 B9            [ 1] 2121 	cp a,#TK_NONE 
      008BF0 27 09            [ 1] 2122 	jreq 5$ 
      008BF0 1E 05            [ 1] 2123 4$:	cp a,#TK_RPAREN 
      008BF2 16 03            [ 1] 2124 	jreq 5$
      000C05                       2125 	_unget_token 
      008BF4 CD 8B 12 1F 05   [ 1]    1      mov in,in.saved  
      008BF9 17               [ 1] 2126 5$:	pop a  
      008BFA 03               [ 4] 2127 	ret 
                                   2128 
                                   2129 ;--------------------------------
                                   2130 ;   BASIC commnands 
                                   2131 ;--------------------------------
                                   2132 
                                   2133 ;--------------------------------
                                   2134 ;  arithmetic and relational 
                                   2135 ;  routines
                                   2136 ;  operators precedence
                                   2137 ;  highest to lowest
                                   2138 ;  operators on same row have 
                                   2139 ;  same precedence and are executed
                                   2140 ;  from left to right.
                                   2141 ;	'*','/','%'
                                   2142 ;   '-','+'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2143 ;   '=','>','<','>=','<=','<>','><'
                                   2144 ;   '<>' and '><' are equivalent for not equal.
                                   2145 ;--------------------------------
                                   2146 
                                   2147 ;---------------------
                                   2148 ; return array element
                                   2149 ; address from @(expr)
                                   2150 ; input:
                                   2151 ;   A 		TK_ARRAY
                                   2152 ; output:
                                   2153 ;   A 		TK_INTGR
                                   2154 ;	X 		element address 
                                   2155 ;----------------------
      000C0C                       2156 get_array_element:
      008BFB 85 CD 8B         [ 4] 2157 	call func_args 
      008BFE 74 5B            [ 1] 2158 	cp a,#1
      008C00 04 81            [ 1] 2159 	jreq 1$
      008C02 CC 07 39         [ 2] 2160 	jp syntax_error
      008C02 52               [ 2] 2161 1$: popw x 
                                   2162 	; check for bounds 
      008C03 05 17 04         [ 2] 2163 	cpw x,array_size 
      008C06 23 05            [ 2] 2164 	jrule 3$
                                   2165 ; bounds {1..array_size}	
      008C06 1F 02            [ 1] 2166 2$: ld a,#ERR_BAD_VALUE 
      008C08 F6 A4 0F         [ 2] 2167 	jp tb_error 
      008C0B 6B               [ 2] 2168 3$: tnzw  x
      008C0C 01 16            [ 1] 2169 	jreq 2$ 
      008C0E 04               [ 2] 2170 	sllw x 
      008C0F 5C               [ 2] 2171 	pushw x 
      008C10 AE 16 90         [ 2] 2172 	ldw x,#tib
      008C10 90 F6 27         [ 2] 2173 	subw x,(1,sp)
      000C2C                       2174 	_drop 2   
      008C13 1B 0D            [ 2]    1     addw sp,#2 
      008C15 01 27            [ 1] 2175 	ld a,#TK_INTGR
      008C17 0A               [ 4] 2176 	ret 
                                   2177 
                                   2178 
                                   2179 ;***********************************
                                   2180 ;   expression parse,execute 
                                   2181 ;***********************************
                                   2182 ;-----------------------------------
                                   2183 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2184 ;			 integer | function |
                                   2185 ;			 '('relation')' 
                                   2186 ; output:
                                   2187 ;   A    token attribute 
                                   2188 ;   X 	 integer
                                   2189 ; ---------------------------------
                           000001  2190 	NEG=1
                           000001  2191 	VSIZE=1
      000C31                       2192 factor:
      000C31                       2193 	_vars VSIZE 
      008C18 F1 26            [ 2]    1     sub sp,#VSIZE 
      008C1A 07 90 5C         [ 4] 2194 	call next_token
      008C1D 5C 0A            [ 1] 2195 	cp a,#CMD_END  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008C1F 01 20            [ 1] 2196 	jrult 16$
      008C21 EE 01            [ 1] 2197 1$:	ld (NEG,sp),a 
      008C22 A4 30            [ 1] 2198 	and a,#TK_GRP_MASK
      008C22 1E 02            [ 1] 2199 	cp a,#TK_GRP_ADD 
      008C24 1D 00            [ 1] 2200 	jreq 2$
      008C26 02 4B            [ 1] 2201 	ld a,(NEG,sp)
      008C28 00 FE            [ 2] 2202 	jra 4$  
      000C46                       2203 2$:	
      008C2A 84 27 1F         [ 4] 2204 	call next_token 
      000C49                       2205 4$:	
      008C2D 20 D7            [ 1] 2206 	cp a,#TK_IFUNC 
      008C2F 26 03            [ 1] 2207 	jrne 5$ 
      008C2F 1E               [ 4] 2208 	call (x) 
      008C30 02 F6            [ 2] 2209 	jra 18$ 
      000C50                       2210 5$:
      008C32 6B 01            [ 1] 2211 	cp a,#TK_INTGR
      008C34 A4 0F            [ 1] 2212 	jrne 6$
      008C36 4C C7            [ 2] 2213 	jra 18$
      000C56                       2214 6$:
      008C38 00 0E            [ 1] 2215 	cp a,#TK_ARRAY
      008C3A 72 5F            [ 1] 2216 	jrne 10$
      008C3C 00 0D 72         [ 4] 2217 	call get_array_element
      008C3F BB               [ 2] 2218 	ldw x,(x)
      008C40 00 0D            [ 2] 2219 	jra 18$ 
      000C60                       2220 10$:
      008C42 FE 7B            [ 1] 2221 	cp a,#TK_VAR 
      008C44 01 4E            [ 1] 2222 	jrne 12$
      008C46 A4               [ 2] 2223 	ldw x,(x)
      008C47 0C 44            [ 2] 2224 	jra 18$
      000C67                       2225 12$:			
      008C49 44 AB            [ 1] 2226 	cp a,#TK_LPAREN
      008C4B 80 0C            [ 1] 2227 	jrne 16$
      008C4C CD 0D 29         [ 4] 2228 	call relation
      008C4C 5B               [ 2] 2229 	pushw x 
      008C4D 05 81            [ 1] 2230 	ld a,#TK_RPAREN 
      008C4F CD 0B CF         [ 4] 2231 	call expect
      008C4F 88               [ 2] 2232 	popw x 
      008C50 CD 88            [ 2] 2233 	jra 18$	
      000C77                       2234 16$:
      008C52 A8               [ 1] 2235 	tnz a 
      008C53 11 01            [ 1] 2236 	jreq 20$ 
      000C7A                       2237 	_unget_token
      008C55 27 03 CC 87 B9   [ 1]    1      mov in,in.saved  
      008C5A 84               [ 1] 2238 	clr a 
      008C5B 81 09            [ 2] 2239 	jra 20$ 
      008C5C                       2240 18$: 
      008C5C A6 07            [ 1] 2241 	ld a,#TK_MINUS 
      008C5E CD 8C            [ 1] 2242 	cp a,(NEG,sp)
      008C60 4F 01            [ 1] 2243 	jrne 19$
      008C61 50               [ 2] 2244 	negw x
      000C89                       2245 19$:
      008C61 4B 00            [ 1] 2246 	ld a,#TK_INTGR
      000C8B                       2247 20$:
      000C8B                       2248 	_drop VSIZE
      008C63 CD 8D            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C65 A9               [ 4] 2249 	ret
                                   2250 
                                   2251 ;-----------------------------------
                                   2252 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   2253 ; output:
                                   2254 ;   A    	token attribute 
                                   2255 ;	X		integer
                                   2256 ;-----------------------------------
                           000001  2257 	N1=1   ; int16_t
                           000003  2258 	MULOP=3
                           000003  2259 	VSIZE=3
      000C8E                       2260 term:
      000C8E                       2261 	_vars VSIZE
      008C66 A1 00            [ 2]    1     sub sp,#VSIZE 
      008C68 27 20 A1         [ 4] 2262 	call factor
      008C6B 84               [ 1] 2263 	tnz a 
      008C6C 26 13            [ 1] 2264 	jreq term_exit 
      008C6E                       2265 term01:	 ; check for  operator 
      008C6E 84 90            [ 2] 2266 	ldw (N1,sp),x  ; save first factor 
      008C70 85 89 90         [ 4] 2267 	call next_token
      008C73 89 4C            [ 1] 2268 	ld (MULOP,sp),a
      008C75 88 CD            [ 1] 2269 	cp a,#CMD_END
      008C77 88 A8            [ 1] 2270 	jrult 8$
      008C79 A1 09            [ 1] 2271 	and a,#TK_GRP_MASK
      008C7B 27 E6            [ 1] 2272 	cp a,#TK_GRP_MULT
      008C7D A1 00            [ 1] 2273 	jreq 1$
      008C7F 27 09            [ 2] 2274 	jra 8$
      000CA9                       2275 1$:	; got *|/|%
      008C81 A1 08 27         [ 4] 2276 	call factor
      008C84 05 55            [ 1] 2277 	cp a,#TK_INTGR
      008C86 00 03            [ 1] 2278 	jreq 2$
      008C88 00 02 84         [ 2] 2279 	jp syntax_error
      008C8B 81 93            [ 1] 2280 2$:	ldw y,x 
      008C8C 1E 01            [ 2] 2281 	ldw x,(N1,sp)
      008C8C CD 8C            [ 1] 2282 	ld a,(MULOP,sp) 
      008C8E 5C A1            [ 1] 2283 	cp a,#TK_MULT 
      008C90 01 27            [ 1] 2284 	jrne 3$
      008C92 03 CC 87         [ 4] 2285 	call multiply 
      008C95 B9 85            [ 2] 2286 	jra term01
      008C97 C3 00            [ 1] 2287 3$: cp a,#TK_DIV 
      008C99 1F 23            [ 1] 2288 	jrne 4$ 
      008C9B 05 A6 0A         [ 4] 2289 	call divide 
      008C9E CC 87            [ 2] 2290 	jra term01 
      008CA0 BB 5D 27         [ 4] 2291 4$: call modulo
      008CA3 F8 58            [ 2] 2292 	jra term01 
      008CA5 89 AE            [ 1] 2293 8$: ld a,(MULOP,sp)
      008CA7 16 90            [ 1] 2294 	jreq 9$ 
      000CD4                       2295 	_unget_token
      008CA9 72 F0 01 5B 02   [ 1]    1      mov in,in.saved  
      008CAE A6 84            [ 2] 2296 9$: ldw x,(N1,sp)
      008CB0 81 84            [ 1] 2297 	ld a,#TK_INTGR 	
      008CB1                       2298 term_exit:
      000CDD                       2299 	_drop VSIZE 
      008CB1 52 01            [ 2]    1     addw sp,#VSIZE 
      008CB3 CD               [ 4] 2300 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2301 
                                   2302 ;-------------------------------
                                   2303 ;  expr ::= term [['+'|'-'] term]*
                                   2304 ;  result range {-32768..32767}
                                   2305 ;  output:
                                   2306 ;   A    token attribute 
                                   2307 ;   X	 integer   
                                   2308 ;-------------------------------
                           000001  2309 	N1=1
                           000003  2310 	N2=3 
                           000005  2311 	OP=5 
                           000005  2312 	VSIZE=5 
      000CE0                       2313 expression:
      000CE0                       2314 	_vars VSIZE 
      008CB4 88 A8            [ 2]    1     sub sp,#VSIZE 
      008CB6 A1 02 25         [ 4] 2315 	call term
      008CB9 3D               [ 1] 2316 	tnz a 
      008CBA 6B 01            [ 1] 2317 	jreq expr_exit 
      008CBC A4 30            [ 2] 2318 1$:	ldw (N1,sp),x 
      008CBE A1 10 27         [ 4] 2319 	call next_token
      008CC1 04 7B            [ 1] 2320 	ld (OP,sp),a 
      008CC3 01 20            [ 1] 2321 	cp a,#CMD_END 
      008CC5 03 26            [ 1] 2322 	jrult 8$ 
      008CC6 A4 30            [ 1] 2323 	and a,#TK_GRP_MASK
      008CC6 CD 88            [ 1] 2324 	cp a,#TK_GRP_ADD 
      008CC8 A8 02            [ 1] 2325 	jreq 2$ 
      008CC9 20 1E            [ 2] 2326 	jra 8$
      000CFB                       2327 2$: 
      008CC9 A1 81 26         [ 4] 2328 	call term
      008CCC 03 FD            [ 1] 2329 	cp a,#TK_INTGR
      008CCE 20 32            [ 1] 2330 	jreq 3$
      008CD0 CC 07 39         [ 2] 2331 	jp syntax_error
      008CD0 A1 84            [ 2] 2332 3$:	ldw (N2,sp),x 
      008CD2 26 02            [ 2] 2333 	ldw x,(N1,sp)
      008CD4 20 2C            [ 1] 2334 	ld a,(OP,sp)
      008CD6 A1 10            [ 1] 2335 	cp a,#TK_PLUS 
      008CD6 A1 06            [ 1] 2336 	jrne 4$
      008CD8 26 06 CD         [ 2] 2337 	addw x,(N2,sp)
      008CDB 8C 8C            [ 2] 2338 	jra 1$ 
      008CDD FE 20 22         [ 2] 2339 4$:	subw x,(N2,sp)
      008CE0 20 CF            [ 2] 2340 	jra 1$
      008CE0 A1 85            [ 1] 2341 8$: ld a,(OP,sp)
      008CE2 26 03            [ 1] 2342 	jreq 9$ 
      000D1D                       2343 	_unget_token	
      008CE4 FE 20 1B 00 01   [ 1]    1      mov in,in.saved  
      008CE7 1E 01            [ 2] 2344 9$: ldw x,(N1,sp)
      008CE7 A1 07            [ 1] 2345 	ld a,#TK_INTGR	
      000D26                       2346 expr_exit:
      000D26                       2347 	_drop VSIZE 
      008CE9 26 0C            [ 2]    1     addw sp,#VSIZE 
      008CEB CD               [ 4] 2348 	ret 
                                   2349 
                                   2350 ;---------------------------------------------
                                   2351 ; rel ::= expr rel_op expr
                                   2352 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2353 ;  relation return  integer , zero is false 
                                   2354 ;  output:
                                   2355 ;    A 		token attribute  
                                   2356 ;	 X		integer 
                                   2357 ;---------------------------------------------
                           000001  2358 	N1=1
                           000003  2359 	RELOP=3
                           000003  2360 	VSIZE=3 
      000D29                       2361 relation: 
      000D29                       2362 	_vars VSIZE
      008CEC 8D A9            [ 2]    1     sub sp,#VSIZE 
      008CEE 89 A6 08         [ 4] 2363 	call expression
      008CF1 CD               [ 1] 2364 	tnz a 
      008CF2 8C 4F            [ 1] 2365 	jreq rel_exit
      008CF4 85 20            [ 2] 2366 	ldw (N1,sp),x 
                                   2367 ; expect rel_op or leave 
      008CF6 0B 08 28         [ 4] 2368 	call next_token 
      008CF7 6B 03            [ 1] 2369 	ld (RELOP,sp),a 
      008CF7 4D 27            [ 1] 2370 	and a,#TK_GRP_MASK
      008CF9 11 55            [ 1] 2371 	cp a,#TK_GRP_RELOP 
      008CFB 00 03            [ 1] 2372 	jrne 8$
      000D3E                       2373 2$:	; expect another expression
      008CFD 00 02 4F         [ 4] 2374 	call expression
      008D00 20 09            [ 1] 2375 	cp a,#TK_INTGR
      008D02 27 03            [ 1] 2376 	jreq 3$
      008D02 A6 11 11         [ 2] 2377 	jp syntax_error 
      008D05 01 26 01         [ 2] 2378 3$:	ldw acc16,x 
      008D08 50 01            [ 2] 2379 	ldw x,(N1,sp) 
      008D09 72 B0 00 0C      [ 2] 2380 	subw x,acc16
      008D09 A6 84            [ 1] 2381 	jrne 4$
      008D0B 35 02 00 0D      [ 1] 2382 	mov acc8,#2 ; n1==n2
      008D0B 5B 01            [ 2] 2383 	jra 6$ 
      000D59                       2384 4$: 
      008D0D 81 06            [ 1] 2385 	jrsgt 5$  
      008D0E 35 04 00 0D      [ 1] 2386 	mov acc8,#4 ; n1<2 
      008D0E 52 03            [ 2] 2387 	jra 6$
      000D61                       2388 5$:
      008D10 CD 8C B1 4D      [ 1] 2389 	mov acc8,#1 ; n1>n2 
      000D65                       2390 6$:
      008D14 27               [ 1] 2391 	clrw x 
      008D15 47 00 0D         [ 1] 2392 	ld a, acc8  
      008D16 14 03            [ 1] 2393 	and a,(RELOP,sp)
      008D16 1F               [ 1] 2394 	tnz a 
      008D17 01 CD            [ 1] 2395 	jreq 10$
      008D19 88               [ 1] 2396 	incw x 
      008D1A A8 6B            [ 2] 2397 	jra 10$  	
      008D1C 03 A1            [ 1] 2398 8$: ld a,(RELOP,sp)
      008D1E 02 25            [ 1] 2399 	jreq 9$
      000D75                       2400 	_unget_token
      008D20 2F A4 30 A1 20   [ 1]    1      mov in,in.saved  
      000D7A                       2401 9$: 
      008D25 27 02            [ 2] 2402 	ldw x,(N1,sp)
      000D7C                       2403 10$:
      008D27 20 27            [ 1] 2404 	ld a,#TK_INTGR
      008D29                       2405 rel_exit:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      000D7E                       2406 	_drop VSIZE
      008D29 CD 8C            [ 2]    1     addw sp,#VSIZE 
      008D2B B1               [ 4] 2407 	ret 
                                   2408 
                                   2409 ;--------------------------------
                                   2410 ; BASIC: SHOW 
                                   2411 ; print stack content in hexadecimal bytes 
                                   2412 ; 16 bytes per row 
                                   2413 ;--------------------------------
      000D81                       2414 show:
      008D2C A1 84 27         [ 2] 2415 	ldw x,#cstk_prompt
      008D2F 03 CC 87         [ 4] 2416 	call puts 
      008D32 B9               [ 1] 2417 	ldw x,sp 
      008D33 90 93 1E         [ 2] 2418 	addw x,#3 ; ignore return address
      008D36 01 7B 03 A1      [ 2] 2419 	ldw y,#RAM_SIZE  
      008D3A 20 26 05         [ 2] 2420 	ldw acc16,x 
      008D3D CD 8B 12 20      [ 2] 2421 	subw y,acc16
      008D41 D4 A1 21         [ 4] 2422 	call hex_dump
      008D44 26               [ 1] 2423 	clr a 
      008D45 05               [ 4] 2424 	ret
                                   2425 
      008D46 CD 8B CB 20 CB CD 8B  2426 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             E1 20 C6 7B 03 27 05
             55 00 03 00 02 1E 01
             A6 84 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   2427 
                                   2428 
                                   2429 ;--------------------------------------------
                                   2430 ; BASIC: HEX 
                                   2431 ; select hexadecimal base for integer print
                                   2432 ;---------------------------------------------
      008D5D                       2433 hex_base:
      008D5D 5B 03 81 0A      [ 1] 2434 	mov base,#16 
      008D60 81               [ 4] 2435 	ret 
                                   2436 
                                   2437 ;--------------------------------------------
                                   2438 ; BASIC: DEC 
                                   2439 ; select decimal base for integer print
                                   2440 ;---------------------------------------------
      000DC7                       2441 dec_base:
      008D60 52 05 CD 8D      [ 1] 2442 	mov base,#10
      008D64 0E               [ 4] 2443 	ret 
                                   2444 
                                   2445 ;------------------------
                                   2446 ; BASIC: FREE 
                                   2447 ; return free size in RAM 
                                   2448 ; output:
                                   2449 ;   A 		TK_INTGR
                                   2450 ;   X 	    size integer
                                   2451 ;--------------------------
      000DCC                       2452 free:
      008D65 4D 27 3E         [ 2] 2453 	ldw x,#tib 
      008D68 1F 01 CD 88      [ 2] 2454 	ldw y,txtbgn 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D6C A8 6B 05 A1      [ 2] 2455 	cpw y,#app_space
      008D70 02 25            [ 1] 2456 	jrult 1$
      008D72 26 A4 30         [ 2] 2457 	subw x,#free_ram 
      008D75 A1 10            [ 2] 2458 	jra 2$ 
      000DDE                       2459 1$:	
      008D77 27 02 20 1E      [ 2] 2460 	subw x,txtend 
      008D7B A6 84            [ 1] 2461 2$:	ld a,#TK_INTGR
      008D7B CD               [ 4] 2462 	ret 
                                   2463 
                                   2464 
                                   2465 ;------------------------
                                   2466 ; BASIC: UBOUND  
                                   2467 ; return array variable size 
                                   2468 ; output:
                                   2469 ;   A 		TK_INTGR
                                   2470 ;   X 	    array size 
                                   2471 ;--------------------------
      000DE5                       2472 ubound:
      008D7C 8D 0E A1         [ 4] 2473 	call free 
      008D7F 84               [ 2] 2474 	srlw x 
      008D80 27 03 CC         [ 2] 2475 	ldw array_size,x
      008D83 87 B9            [ 1] 2476 	ld a,#TK_INTGR
      008D85 1F               [ 4] 2477 	ret 
                                   2478 
                                   2479 ;-----------------------------
                                   2480 ; BASIC: LET var=expr 
                                   2481 ; variable assignement 
                                   2482 ; output:
                                   2483 ;   A 		TK_NONE 
                                   2484 ;-----------------------------
      000DEF                       2485 let::
      008D86 03 1E 01         [ 4] 2486 	call next_token 
      008D89 7B 05            [ 1] 2487 	cp a,#TK_VAR 
      008D8B A1 10            [ 1] 2488 	jreq let_var
      008D8D 26 05            [ 1] 2489 	cp a,#TK_ARRAY 
      008D8F 72 FB            [ 1] 2490 	jreq  let_array
      008D91 03 20 D4         [ 2] 2491 	jp syntax_error
      000DFD                       2492 let_array:
      008D94 72 F0 03         [ 4] 2493 	call get_array_element
      000E00                       2494 let_var:
      008D97 20               [ 2] 2495 	pushw x  
      008D98 CF 7B 05         [ 4] 2496 	call next_token 
      008D9B 27 05            [ 1] 2497 	cp a,#TK_EQUAL
      008D9D 55 00            [ 1] 2498 	jreq 1$
      008D9F 03 00 02         [ 2] 2499 	jp syntax_error
      000E0B                       2500 1$:	
      008DA2 1E 01 A6         [ 4] 2501 	call relation   
      008DA5 84 84            [ 1] 2502 	cp a,#TK_INTGR 
      008DA6 27 03            [ 1] 2503 	jreq 2$
      008DA6 5B 05 81         [ 2] 2504 	jp syntax_error
      008DA9                       2505 2$:	
      008DA9 52 03            [ 1] 2506 	ldw y,x 
      008DAB CD               [ 2] 2507 	popw x   
      008DAC 8D               [ 2] 2508 	ldw (x),y   
      008DAD 60               [ 4] 2509 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2510 
                                   2511 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2512 ; return program size 
                                   2513 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E1A                       2514 prog_size:
      008DAE 4D 27 4D         [ 2] 2515 	ldw x,txtend 
      008DB1 1F 01 CD 88      [ 2] 2516 	subw x,txtbgn 
      008DB5 A8               [ 4] 2517 	ret 
                                   2518 
                                   2519 ;----------------------------
                                   2520 ; BASIC: LIST [[start][,end]]
                                   2521 ; list program lines 
                                   2522 ; form start to end 
                                   2523 ; if empty argument list then 
                                   2524 ; list all.
                                   2525 ;----------------------------
                           000001  2526 	FIRST=1
                           000003  2527 	LAST=3 
                           000005  2528 	LN_PTR=5
                           000006  2529 	VSIZE=6 
      000E22                       2530 list:
      008DB6 6B 03 A4         [ 2] 2531 	ldw x,txtbgn 
      008DB9 30 A1 30         [ 2] 2532 	cpw x,txtend 
      008DBC 26 33            [ 1] 2533 	jrmi 1$
      008DBE 81               [ 4] 2534 	ret 
      000E2B                       2535 1$:	
      008DBE CD 8D 60         [ 2] 2536 	ldw x,#PROG_SIZE
      008DC1 A1 84 27         [ 4] 2537 	call puts 
      008DC4 03 CC 87         [ 2] 2538 	ldw x,txtend 
      008DC7 B9 CF 00 0D      [ 2] 2539 	subw x,txtbgn 
      008DCB 1E 01 72         [ 4] 2540 	call print_int 
      008DCE B0 00 0D         [ 2] 2541 	ldw x,#STR_BYTES 
      008DD1 26 06 35         [ 4] 2542 	call puts 
      000E41                       2543 	_vars VSIZE
      008DD4 02 00            [ 2]    1     sub sp,#VSIZE 
      008DD6 0E 20 0C         [ 2] 2544 	ldw x,txtbgn 
      008DD9 1F 05            [ 2] 2545 	ldw (LN_PTR,sp),x 
      008DD9 2C               [ 2] 2546 	ldw x,(x) 
      008DDA 06 35            [ 2] 2547 	ldw (FIRST,sp),x ; list from first line 
      008DDC 04 00 0E         [ 2] 2548 	ldw x,#MAX_LINENO ; biggest line number 
      008DDF 20 04            [ 2] 2549 	ldw (LAST,sp),x 
      008DE1 CD 0B E1         [ 4] 2550 	call arg_list
      008DE1 35               [ 1] 2551 	tnz a
      008DE2 01 00            [ 1] 2552 	jreq list_loop 
      008DE4 0E 02            [ 1] 2553 	cp a,#2 
      008DE5 27 07            [ 1] 2554 	jreq 4$
      008DE5 5F C6            [ 1] 2555 	cp a,#1 
      008DE7 00 0E            [ 1] 2556 	jreq first_line 
      008DE9 14 03 4D         [ 2] 2557 	jp syntax_error 
      008DEC 27               [ 2] 2558 4$:	popw x 
      008DED 0E 5C            [ 2] 2559 	ldw (LAST+2,sp),x 
      000E64                       2560 first_line:
      008DEF 20               [ 2] 2561 	popw x
      008DF0 0B 7B            [ 2] 2562 	ldw (FIRST,sp),x 
      000E67                       2563 lines_skip:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008DF2 03 27 05         [ 2] 2564 	ldw x,txtbgn
      008DF5 55 00            [ 2] 2565 2$:	ldw (LN_PTR,sp),x 
      008DF7 03 00 02         [ 2] 2566 	cpw x,txtend 
      008DFA 2A 38            [ 1] 2567 	jrpl list_exit 
      008DFA 1E               [ 2] 2568 	ldw x,(x) ;line# 
      008DFB 01 01            [ 2] 2569 	cpw x,(FIRST,sp)
      008DFC 2A 11            [ 1] 2570 	jrpl list_loop 
      008DFC A6 84            [ 2] 2571 	ldw x,(LN_PTR,sp) 
      008DFE E6 02            [ 1] 2572 	ld a,(2,x)
      008DFE 5B 03 81         [ 1] 2573 	ld acc8,a 
      008E01 72 5F 00 0C      [ 1] 2574 	clr acc16 
      008E01 AE 8E 1B CD      [ 2] 2575 	addw x,acc16
      008E05 A0 74            [ 2] 2576 	jra 2$ 
                                   2577 ; print loop
      000E87                       2578 list_loop:
      008E07 96 1C            [ 2] 2579 	ldw x,(LN_PTR,sp)
      008E09 00 03            [ 1] 2580 	ld a,(2,x) 
      008E0B 90 AE 18         [ 4] 2581 	call prt_basic_line
      008E0E 00 CF            [ 2] 2582 	ldw x,(LN_PTR,sp)
      008E10 00 0D            [ 1] 2583 	ld a,(2,x)
      008E12 72 B2 00         [ 1] 2584 	ld acc8,a 
      008E15 0D CD 83 DE      [ 1] 2585 	clr acc16 
      008E19 4F 81 0A 63      [ 2] 2586 	addw x,acc16
      008E1D 6F 6E 74         [ 2] 2587 	cpw x,txtend 
      008E20 65 6E            [ 1] 2588 	jrpl list_exit
      008E22 74 20            [ 2] 2589 	ldw (LN_PTR,sp),x
      008E24 6F               [ 2] 2590 	ldw x,(x)
      008E25 66 20            [ 2] 2591 	cpw x,(LAST,sp)  
      008E27 73 74            [ 1] 2592 	jrslt list_loop
      000EA9                       2593 list_exit:
      008E29 61 63 6B 20 66   [ 1] 2594 	mov in,count 
      008E2E 72 6F 6D         [ 2] 2595 	ldw x,#pad 
      008E31 20 74 6F         [ 2] 2596 	ldw basicptr,x 
      000EB4                       2597 	_drop VSIZE 
      008E34 70 20            [ 2]    1     addw sp,#VSIZE 
      008E36 74               [ 4] 2598 	ret
                                   2599 
                                   2600 
                                   2601 ;--------------------------
                                   2602 ; BASIC: EDIT 
                                   2603 ;  copy program in FLASH 
                                   2604 ;  to RAM for edition 
                                   2605 ;-------------------------
      000EB7                       2606 edit:
      008E37 6F 20 62         [ 4] 2607 	call qsign 
      008E3A 6F 74            [ 1] 2608 	jreq 1$
      008E3C 74 6F 6D         [ 2] 2609 	ldw x,#NO_FLASH_APP 
      008E3F 3A 0A 00         [ 4] 2610 	call puts 
      008E42 81               [ 4] 2611 	ret 
      008E42 35 10 00         [ 2] 2612 1$: ldw x,app_size 
      008E45 0B 81 0C         [ 2] 2613 	ldw acc16,x 
      008E47 90 AE 2A 04      [ 2] 2614 	ldw y,#app 
      008E47 35 0A 00         [ 2] 2615 	ldw x,#free_ram
      008E4A 0B 81 C5         [ 4] 2616 	call move  
      008E4C AE 00 64         [ 2] 2617 	ldw x,#free_ram 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E4C AE 16 90         [ 2] 2618 	ldw txtbgn,x 
      008E4F 90 CE 00 1A      [ 2] 2619 	addw x,app_size 
      008E53 90 A3 AA         [ 2] 2620 	ldw txtend,x 
      008E56 80               [ 4] 2621 	ret 
                                   2622 
      008E57 25 05 1D 00 65 20 04  2623 NO_FLASH_APP: .asciz "No application stored in FLASH!"
             69 63 61 74 69 6F 6E
             20 73 74 6F 72 65 64
             20 69 6E 20 46 4C 41
             53 48 21 00
                                   2624 
                                   2625 ;--------------------------
                                   2626 ; decompile line from token list
                                   2627 ; and print it. 
                                   2628 ; input:
                                   2629 ;   A       stop at this position 
                                   2630 ;   X 		pointer at line
                                   2631 ; output:
                                   2632 ;   none 
                                   2633 ;--------------------------	
      008E5E                       2634 prt_basic_line:
      008E5E 72 B0 00         [ 1] 2635 	ld count,a 
      008E61 1C A6            [ 1] 2636 	ld a,(2,x)
      008E63 84 81 03         [ 1] 2637 	cp a,count 
      008E65 2A 03            [ 1] 2638 	jrpl 1$ 
      008E65 CD 8E 4C         [ 1] 2639 	ld count,a 
      008E68 54 CF 00         [ 2] 2640 1$:	ldw basicptr,x 
      008E6B 1F A6 84 81      [ 2] 2641 	ldw y,#tib  
      008E6F CD 27 ED         [ 4] 2642 	call decompile 
      008E6F CD 88 A8         [ 4] 2643 	call puts 
      008E72 A1 85            [ 1] 2644 	ld a,#CR 
      008E74 27 0A A1         [ 4] 2645 	call putc 
      008E77 06               [ 4] 2646 	ret 
                                   2647 
                                   2648 
                                   2649 
                                   2650 ;---------------------------------
                                   2651 ; BASIC: PRINT|? arg_list 
                                   2652 ; print values from argument list
                                   2653 ;----------------------------------
                           000001  2654 	CCOMMA=1
                           000001  2655 	VSIZE=1
      000F21                       2656 print:
      000F21                       2657 	_vars VSIZE 
      008E78 27 03            [ 2]    1     sub sp,#VSIZE 
      000F23                       2658 reset_comma:
      008E7A CC 87            [ 1] 2659 	clr (CCOMMA,sp)
      000F25                       2660 prt_loop:
      008E7C B9 08 28         [ 4] 2661 	call next_token
      008E7D A1 02            [ 1] 2662 	cp a,#CMD_END 
      008E7D CD 8C            [ 1] 2663 	jrult print_exit ; colon or end of line 
      008E7F 8C 02            [ 1] 2664 	cp a,#TK_QSTR
      008E80 27 12            [ 1] 2665 	jreq 1$
      008E80 89 CD            [ 1] 2666 	cp a,#TK_CHAR 
      008E82 88 A8            [ 1] 2667 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008E84 A1 32            [ 1] 2668 	cp a,#TK_CFUNC 
      008E86 27 03            [ 1] 2669 	jreq 3$
      008E88 CC 87            [ 1] 2670 	cp a,#TK_COMMA 
      008E8A B9 18            [ 1] 2671 	jreq 4$
      008E8B A1 0A            [ 1] 2672 	cp a,#TK_SHARP 
      008E8B CD 8D            [ 1] 2673 	jreq 5$
      008E8D A9 A1            [ 2] 2674 	jra 7$ 
      000F42                       2675 1$:	; print string 
      008E8F 84 27 03         [ 4] 2676 	call puts
      008E92 CC 87            [ 2] 2677 	jra reset_comma
      000F47                       2678 2$:	; print character 
      008E94 B9               [ 1] 2679 	ld a,xl 
      008E95 CD 02 C1         [ 4] 2680 	call putc 
      008E95 90 93            [ 2] 2681 	jra reset_comma 
      000F4D                       2682 3$: ; print character function value  	
      008E97 85               [ 4] 2683 	call (x)
      008E98 FF               [ 1] 2684 	ld a,xl 
      008E99 81 02 C1         [ 4] 2685 	call putc
      008E9A 20 CF            [ 2] 2686 	jra reset_comma 
      000F54                       2687 4$: ; set comma state 
      008E9A CE 00            [ 1] 2688 	cpl (CCOMMA,sp)
      008E9C 1C 72            [ 2] 2689 	jra prt_loop   
      000F58                       2690 5$: ; # character must be followed by an integer   
      008E9E B0 00 1A         [ 4] 2691 	call next_token
      008EA1 81 84            [ 1] 2692 	cp a,#TK_INTGR 
      008EA2 27 03            [ 1] 2693 	jreq 6$
      008EA2 CE 00 1A         [ 2] 2694 	jp syntax_error 
      000F62                       2695 6$: ; set tab width
      008EA5 C3               [ 1] 2696 	ld a,xl 
      008EA6 00 1C            [ 1] 2697 	and a,#15 
      008EA8 2B 01 81         [ 1] 2698 	ld tab_width,a 
      008EAB 20 B9            [ 2] 2699 	jra reset_comma 
      000F6A                       2700 7$:	
      000F6A                       2701 	_unget_token 
      008EAB AE 95 B0 CD A0   [ 1]    1      mov in,in.saved  
      008EB0 74 CE 00         [ 4] 2702 	call relation 
      008EB3 1C 72            [ 1] 2703 	cp a,#TK_INTGR 
      008EB5 B0 00            [ 1] 2704 	jrne print_exit 
      008EB7 1A CD 89         [ 4] 2705     call print_int 
      008EBA 03 AE            [ 2] 2706 	jra reset_comma 
      000F7B                       2707 print_exit:
      008EBC 95 BF            [ 1] 2708 	tnz (CCOMMA,sp)
      008EBE CD A0            [ 1] 2709 	jrne 9$
      008EC0 74 52            [ 1] 2710 	ld a,#CR 
      008EC2 06 CE 00         [ 4] 2711     call putc 
      000F84                       2712 9$:	_drop VSIZE 
      008EC5 1A 1F            [ 2]    1     addw sp,#VSIZE 
      008EC7 05               [ 4] 2713 	ret 
                                   2714 
                                   2715 ;----------------------
                                   2716 ; 'save_context' and
                                   2717 ; 'rest_context' must be 
                                   2718 ; called at the same 
                                   2719 ; call stack depth 
                                   2720 ; i.e. SP must have the 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2721 ; save value at  
                                   2722 ; entry point of both 
                                   2723 ; routine. 
                                   2724 ;---------------------
                           000004  2725 	CTXT_SIZE=4 ; size of saved data 
                                   2726 ;--------------------
                                   2727 ; save current BASIC
                                   2728 ; interpreter context 
                                   2729 ; on stack 
                                   2730 ;--------------------
      000F87                       2731 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000F87                       2732 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      000F87                       2733 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      000F87                       2734 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      000F87                       2735 save_context:
      008EC8 FE 1F 01         [ 2] 2736 	ldw x,basicptr 
      008ECB AE 7F            [ 2] 2737 	ldw (BPTR,sp),x
      008ECD FF 1F 03         [ 1] 2738 	ld a,in 
      008ED0 CD 8C            [ 1] 2739 	ld (IN,sp),a
      008ED2 61 4D 27         [ 1] 2740 	ld a,count 
      008ED5 31 A1            [ 1] 2741 	ld (CNT,sp),a  
      008ED7 02               [ 4] 2742 	ret
                                   2743 
                                   2744 ;-----------------------
                                   2745 ; restore previously saved 
                                   2746 ; BASIC interpreter context 
                                   2747 ; from stack 
                                   2748 ;-------------------------
      000F97                       2749 rest_context:
      008ED8 27 07            [ 2] 2750 	ldw x,(BPTR,sp)
      008EDA A1 01 27         [ 2] 2751 	ldw basicptr,x 
      008EDD 06 CC            [ 1] 2752 	ld a,(IN,sp)
      008EDF 87 B9 85         [ 1] 2753 	ld in,a
      008EE2 1F 05            [ 1] 2754 	ld a,(CNT,sp)
      008EE4 C7 00 03         [ 1] 2755 	ld count,a  
      008EE4 85               [ 4] 2756 	ret
                                   2757 
                                   2758 
                                   2759 
                                   2760 ;------------------------------------------
                                   2761 ; BASIC: INPUT [string]var[,[string]var]
                                   2762 ; input value in variables 
                                   2763 ; [string] optionally can be used as prompt 
                                   2764 ;-----------------------------------------
                           000001  2765 	CX_BPTR=1
                           000003  2766 	CX_IN=3
                           000004  2767 	CX_CNT=4
                           000005  2768 	SKIP=5
                           000006  2769 	VAR_ADDR=6
                           000007  2770 	VSIZE=7
      000FA7                       2771 input_var:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      000FA7                       2772 	_vars VSIZE 
      008EE5 1F 01            [ 2]    1     sub sp,#VSIZE 
      008EE7                       2773 input_loop:
      008EE7 CE 00            [ 1] 2774 	clr (SKIP,sp)
      008EE9 1A 1F 05         [ 4] 2775 	call next_token 
      008EEC C3 00            [ 1] 2776 	cp a,#TK_QSTR 
      008EEE 1C 2A            [ 1] 2777 	jrne 1$ 
      008EF0 38 FE 13         [ 4] 2778 	call puts 
      008EF3 01 2A            [ 1] 2779 	cpl (SKIP,sp)
      008EF5 11 1E 05         [ 4] 2780 	call next_token 
      008EF8 E6 02            [ 1] 2781 1$: cp a,#TK_VAR  
      008EFA C7 00            [ 1] 2782 	jreq 2$ 
      008EFC 0E 72 5F         [ 2] 2783 	jp syntax_error
      008EFF 00 0D            [ 2] 2784 2$:	ldw (VAR_ADDR,sp),x 
      008F01 72 BB            [ 1] 2785 	tnz (SKIP,sp)
      008F03 00 0D            [ 1] 2786 	jrne 21$ 
      008F05 20 E3 C4         [ 4] 2787 	call var_name 
      008F07 CD 02 C1         [ 4] 2788 	call putc   
      000FCD                       2789 21$:
      008F07 1E 05            [ 1] 2790 	ld a,#':
      008F09 E6 02 CD         [ 4] 2791 	call putc 
      008F0C 8F 81 1E         [ 4] 2792 	call save_context 
      008F0F 05 E6 02 C7      [ 1] 2793 	clr count  
      008F13 00 0E 72         [ 4] 2794 	call readln 
      008F16 5F 00 0D         [ 2] 2795 	ldw x,#tib 
      008F19 72 BB 00         [ 1] 2796 	push count
      008F1C 0D C3            [ 1] 2797 	push #0 
      008F1E 00 1C 2A         [ 2] 2798 	addw x,(1,sp)
      008F21 07               [ 1] 2799 	incw x 
      000FE8                       2800 	_drop 2 
      008F22 1F 05            [ 2]    1     addw sp,#2 
      008F24 FE 13 03 2F      [ 1] 2801 	clr in 
      008F28 DE 25 13         [ 4] 2802 	call get_token
      008F29 A1 84            [ 1] 2803 	cp a,#TK_INTGR
      008F29 55 00            [ 1] 2804 	jreq 3$ 
      008F2B 04 00 02         [ 4] 2805 	call rest_context 
      008F2E AE 16 E0         [ 2] 2806 	jp syntax_error
      008F31 CF 00            [ 2] 2807 3$: ldw y,(VAR_ADDR,sp) 
      008F33 05 5B            [ 2] 2808 	ldw (y),x 
      008F35 06 81 97         [ 4] 2809 	call rest_context
      008F37 CD 08 28         [ 4] 2810 	call next_token 
      008F37 CD 94            [ 1] 2811 	cp a,#TK_COMMA 
      008F39 D5 27            [ 1] 2812 	jreq input_loop
      008F3B 07 AE            [ 1] 2813 	cp a,#TK_NONE 
      008F3D 8F 61            [ 1] 2814 	jreq input_exit  
      008F3F CD A0            [ 1] 2815 	cp a,#TK_COLON 
      008F41 74 81            [ 1] 2816     jreq input_exit 
      008F43 CE AA 82         [ 2] 2817 	jp syntax_error 
      001014                       2818 input_exit:
      001014                       2819 	_drop VSIZE 
      008F46 CF 00            [ 2]    1     addw sp,#VSIZE 
      008F48 0D               [ 4] 2820 	ret 
                                   2821 
                                   2822 
                                   2823 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2824 ; BASIC: REMARK | ' 
                                   2825 ; skip comment to end of line 
                                   2826 ;---------------------- 
      001017                       2827 remark::
      008F49 90 AE AA 84 AE   [ 1] 2828 	mov in,count 
      008F4E 00               [ 4] 2829  	ret 
                                   2830 
                                   2831 
                                   2832 ;---------------------
                                   2833 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2834 ; read in loop 'addr'  
                                   2835 ; apply & 'mask' to value 
                                   2836 ; loop while result==0.  
                                   2837 ; 'xor_mask' is used to 
                                   2838 ; invert the wait logic.
                                   2839 ; i.e. loop while not 0.
                                   2840 ;---------------------
                           000001  2841 	XMASK=1 
                           000002  2842 	MASK=2
                           000003  2843 	ADDR=3
                           000004  2844 	VSIZE=4
      00101D                       2845 wait: 
      00101D                       2846 	_vars VSIZE
      008F4F 65 CD            [ 2]    1     sub sp,#VSIZE 
      008F51 84 45            [ 1] 2847 	clr (XMASK,sp) 
      008F53 AE 00 65         [ 4] 2848 	call arg_list 
      008F56 CF 00            [ 1] 2849 	cp a,#2
      008F58 1A 72            [ 1] 2850 	jruge 0$
      008F5A BB AA 82         [ 2] 2851 	jp syntax_error 
      008F5D CF 00            [ 1] 2852 0$:	cp a,#3
      008F5F 1C 81            [ 1] 2853 	jrult 1$
      008F61 4E               [ 2] 2854 	popw x 
      008F62 6F               [ 1] 2855 	ld a,xl
      008F63 20 61            [ 1] 2856 	ld (XMASK,sp),a 
      008F65 70               [ 2] 2857 1$: popw x ; mask 
      008F66 70               [ 1] 2858 	ld a,xl 
      008F67 6C 69            [ 1] 2859 	ld (MASK,sp),a 
      008F69 63               [ 2] 2860 	popw x ; address 
      008F6A 61               [ 1] 2861 2$:	ld a,(x)
      008F6B 74 69            [ 1] 2862 	and a,(MASK,sp)
      008F6D 6F 6E            [ 1] 2863 	xor a,(XMASK,sp)
      008F6F 20 73            [ 1] 2864 	jreq 2$ 
      00103F                       2865 	_drop VSIZE 
      008F71 74 6F            [ 2]    1     addw sp,#VSIZE 
      008F73 72               [ 4] 2866 	ret 
                                   2867 
                                   2868 ;---------------------
                                   2869 ; BASIC: BSET addr,mask
                                   2870 ; set bits at 'addr' corresponding 
                                   2871 ; to those of 'mask' that are at 1.
                                   2872 ; arguments:
                                   2873 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2874 ;   mask        mask|addr
                                   2875 ; output:
                                   2876 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2877 ;--------------------------
      001042                       2878 bit_set:
      008F74 65 64 20         [ 4] 2879 	call arg_list 
      008F77 69 6E            [ 1] 2880 	cp a,#2	 
      008F79 20 46            [ 1] 2881 	jreq 1$ 
      008F7B 4C 41 53         [ 2] 2882 	jp syntax_error
      00104C                       2883 1$: 
      008F7E 48               [ 2] 2884 	popw x ; mask 
      008F7F 21               [ 1] 2885 	ld a,xl 
      008F80 00               [ 2] 2886 	popw x ; addr  
      008F81 FA               [ 1] 2887 	or a,(x)
      008F81 C7               [ 1] 2888 	ld (x),a
      008F82 00               [ 4] 2889 	ret 
                                   2890 
                                   2891 ;---------------------
                                   2892 ; BASIC: BRES addr,mask
                                   2893 ; reset bits at 'addr' corresponding 
                                   2894 ; to those of 'mask' that are at 1.
                                   2895 ; arguments:
                                   2896 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2897 ;   mask	    ~mask&*addr  
                                   2898 ; output:
                                   2899 ;	none 
                                   2900 ;--------------------------
      001052                       2901 bit_reset:
      008F83 04 E6 02         [ 4] 2902 	call arg_list 
      008F86 C1 00            [ 1] 2903 	cp a,#2  
      008F88 04 2A            [ 1] 2904 	jreq 1$ 
      008F8A 03 C7 00         [ 2] 2905 	jp syntax_error
      00105C                       2906 1$: 
      008F8D 04               [ 2] 2907 	popw x ; mask 
      008F8E CF               [ 1] 2908 	ld a,xl 
      008F8F 00               [ 1] 2909 	cpl a 
      008F90 05               [ 2] 2910 	popw x ; addr  
      008F91 90               [ 1] 2911 	and a,(x)
      008F92 AE               [ 1] 2912 	ld (x),a 
      008F93 16               [ 4] 2913 	ret 
                                   2914 
                                   2915 ;---------------------
                                   2916 ; BASIC: BTOGL addr,mask
                                   2917 ; toggle bits at 'addr' corresponding 
                                   2918 ; to those of 'mask' that are at 1.
                                   2919 ; arguments:
                                   2920 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2921 ;   mask	    mask^*addr  
                                   2922 ; output:
                                   2923 ;	none 
                                   2924 ;--------------------------
      001063                       2925 bit_toggle:
      008F94 90 CD A8         [ 4] 2926 	call arg_list 
      008F97 6D CD            [ 1] 2927 	cp a,#2 
      008F99 A0 74            [ 1] 2928 	jreq 1$ 
      008F9B A6 0D CD         [ 2] 2929 	jp syntax_error
      008F9E 83               [ 2] 2930 1$: popw x ; mask 
      008F9F 41               [ 1] 2931 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008FA0 81               [ 2] 2932 	popw x ; addr  
      008FA1 F8               [ 1] 2933 	xor a,(x)
      008FA1 52               [ 1] 2934 	ld (x),a 
      008FA2 01               [ 4] 2935 	ret 
                                   2936 
                                   2937 
                                   2938 ;---------------------
                                   2939 ; BASIC: BTEST(addr,bit)
                                   2940 ; return bit value at 'addr' 
                                   2941 ; bit is in range {0..7}.
                                   2942 ; arguments:
                                   2943 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2944 ;   bit 	    bit position {0..7}  
                                   2945 ; output:
                                   2946 ;	none 
                                   2947 ;--------------------------
      008FA3                       2948 bit_test:
      008FA3 0F 01 DC         [ 4] 2949 	call func_args 
      008FA5 A1 02            [ 1] 2950 	cp a,#2
      008FA5 CD 88            [ 1] 2951 	jreq 0$
      008FA7 A8 A1 02         [ 2] 2952 	jp syntax_error
      00107D                       2953 0$:	
      008FAA 25               [ 2] 2954 	popw x 
      008FAB 4F               [ 1] 2955 	ld a,xl 
      008FAC A1 02            [ 1] 2956 	and a,#7
      008FAE 27               [ 1] 2957 	push a   
      008FAF 12 A1            [ 1] 2958 	ld a,#1 
      008FB1 03 27            [ 1] 2959 1$: tnz (1,sp)
      008FB3 13 A1            [ 1] 2960 	jreq 2$
      008FB5 82               [ 1] 2961 	sll a 
      008FB6 27 15            [ 1] 2962 	dec (1,sp)
      008FB8 A1 09            [ 2] 2963 	jra 1$
      00108D                       2964 2$: _drop 1 
      008FBA 27 18            [ 2]    1     addw sp,#1 
      008FBC A1               [ 2] 2965 	popw x 
      008FBD 0A               [ 1] 2966 	and a,(x)
      008FBE 27 18            [ 1] 2967 	jreq 3$
      008FC0 20 28            [ 1] 2968 	ld a,#1 
      008FC2 5F               [ 1] 2969 3$:	clrw x 
      008FC2 CD               [ 1] 2970 	ld xl,a 
      008FC3 A0 74            [ 1] 2971 	ld a,#TK_INTGR
      008FC5 20               [ 4] 2972 	ret
                                   2973 
                                   2974 
                                   2975 ;--------------------
                                   2976 ; BASIC: POKE addr,byte
                                   2977 ; put a byte at addr 
                                   2978 ;--------------------
      00109A                       2979 poke:
      008FC6 DC 0B E1         [ 4] 2980 	call arg_list 
      008FC7 A1 02            [ 1] 2981 	cp a,#2
      008FC7 9F CD            [ 1] 2982 	jreq 1$
      008FC9 83 41 20         [ 2] 2983 	jp syntax_error
      0010A4                       2984 1$:	
      008FCC D6               [ 2] 2985 	popw x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008FCD 9F               [ 1] 2986     ld a,xl 
      008FCD FD               [ 2] 2987 	popw x 
      008FCE 9F               [ 1] 2988 	ld (x),a 
      008FCF CD               [ 4] 2989 	ret 
                                   2990 
                                   2991 ;-----------------------
                                   2992 ; BASIC: PEEK(addr)
                                   2993 ; get the byte at addr 
                                   2994 ; input:
                                   2995 ;	none 
                                   2996 ; output:
                                   2997 ;	X 		value 
                                   2998 ;-----------------------
      0010A9                       2999 peek:
      008FD0 83 41 20         [ 4] 3000 	call func_args
      008FD3 CF 01            [ 1] 3001 	cp a,#1 
      008FD4 27 03            [ 1] 3002 	jreq 1$
      008FD4 03 01 20         [ 2] 3003 	jp syntax_error
      008FD7 CD               [ 2] 3004 1$: popw x 
      008FD8 F6               [ 1] 3005 	ld a,(x)
      008FD8 CD               [ 1] 3006 	clrw x 
      008FD9 88               [ 1] 3007 	ld xl,a 
      008FDA A8 A1            [ 1] 3008 	ld a,#TK_INTGR
      008FDC 84               [ 4] 3009 	ret 
                                   3010 
                                   3011 ;---------------------------
                                   3012 ; BASIC IF expr : instructions
                                   3013 ; evaluate expr and if true 
                                   3014 ; execute instructions on same line. 
                                   3015 ;----------------------------
      0010BA                       3016 if: 
      008FDD 27 03 CC         [ 4] 3017 	call relation 
      008FE0 87 B9            [ 1] 3018 	cp a,#TK_INTGR
      008FE2 27 03            [ 1] 3019 	jreq 1$ 
      008FE2 9F A4 0F         [ 2] 3020 	jp syntax_error
      008FE5 C7               [ 1] 3021 1$:	clr a 
      008FE6 00               [ 2] 3022 	tnzw x 
      008FE7 22 20            [ 1] 3023 	jrne 9$  
                                   3024 ;skip to next line
      008FE9 B9 00 03 00 01   [ 1] 3025 	mov in,count
      008FEA 81               [ 4] 3026 9$:	ret 
                                   3027 
                                   3028 ;------------------------
                                   3029 ; BASIC: FOR var=expr 
                                   3030 ; set variable to expression 
                                   3031 ; leave variable address 
                                   3032 ; on stack and set
                                   3033 ; FLOOP bit in 'flags'
                                   3034 ;-----------------
                           000001  3035 	RETL1=1 ; return address  
                           000003  3036 	FSTEP=3  ; variable increment
                           000005  3037 	LIMIT=5 ; loop limit 
                           000007  3038 	CVAR=7   ; control variable 
                           000009  3039 	INW=9   ;  in.w saved
                           00000B  3040 	BPTR=11 ; baseptr saved
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                           00000A  3041 	VSIZE=10  
      0010CE                       3042 for: ; { -- var_addr }
      008FEA 55               [ 2] 3043 	popw x ; call return address 
      0010CF                       3044 	_vars VSIZE 
      008FEB 00 03            [ 2]    1     sub sp,#VSIZE 
      008FED 00               [ 2] 3045 	pushw x  ; RETL1 
      008FEE 02 CD            [ 1] 3046 	ld a,#TK_VAR 
      008FF0 8D A9 A1         [ 4] 3047 	call expect
      008FF3 84 26            [ 2] 3048 	ldw (CVAR,sp),x  ; control variable 
      008FF5 05 CD 89         [ 4] 3049 	call let_var 
      008FF8 03 20 A8 20      [ 1] 3050 	bset flags,#FLOOP 
                                   3051 ; open space on stack for loop data 
      008FFB 5F               [ 1] 3052 	clrw x 
      008FFB 0D 01            [ 2] 3053 	ldw (BPTR,sp),x 
      008FFD 26 05            [ 2] 3054 	ldw (INW,sp),x 
      008FFF A6 0D CD         [ 4] 3055 	call next_token 
      009002 83 41            [ 1] 3056 	cp a,#TK_CMD 
      009004 5B 01            [ 1] 3057 	jreq 1$
      009006 81 07 39         [ 2] 3058 	jp syntax_error
      009007                       3059 1$:  
      009007 CE 00 05         [ 2] 3060 	cpw x,#to 
      00900A 1F 03            [ 1] 3061 	jreq to
      00900C C6 00 02         [ 2] 3062 	jp syntax_error 
                                   3063 
                                   3064 ;-----------------------------------
                                   3065 ; BASIC: TO expr 
                                   3066 ; second part of FOR loop initilization
                                   3067 ; leave limit on stack and set 
                                   3068 ; FTO bit in 'flags'
                                   3069 ;-----------------------------------
      0010F7                       3070 to: ; { var_addr -- var_addr limit step }
      00900F 6B 05 C6 00 04   [ 2] 3071 	btjt flags,#FLOOP,1$
      009014 6B 06 81         [ 2] 3072 	jp syntax_error
      009017 CD 0D 29         [ 4] 3073 1$: call relation  
      009017 1E 03            [ 1] 3074 	cp a,#TK_INTGR 
      009019 CF 00            [ 1] 3075 	jreq 2$ 
      00901B 05 7B 05         [ 2] 3076 	jp syntax_error
      00901E C7 00            [ 2] 3077 2$: ldw (LIMIT,sp),x
                                   3078 ;	ldw x,in.w 
      009020 02 7B 06         [ 4] 3079 	call next_token
      009023 C7 00            [ 1] 3080 	cp a,#TK_NONE  
      009025 04 81            [ 1] 3081 	jreq 4$ 
      009027 A1 80            [ 1] 3082 	cp a,#TK_CMD
      009027 52 07            [ 1] 3083 	jrne 3$
      009029 A3 11 27         [ 2] 3084 	cpw x,#step 
      009029 0F 05            [ 1] 3085 	jreq step
      00111B                       3086 3$:	
      00111B                       3087 	_unget_token   	 
      00902B CD 88 A8 A1 02   [ 1]    1      mov in,in.saved  
      001120                       3088 4$:	
      009030 26 08 CD         [ 2] 3089 	ldw x,#1   ; default step  
      009033 A0 74            [ 2] 3090 	ldw (FSTEP,sp),x 
      009035 03 05            [ 2] 3091 	jra store_loop_addr 
                                   3092 
                                   3093 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3094 ;----------------------------------
                                   3095 ; BASIC: STEP expr 
                                   3096 ; optional third par of FOR loop
                                   3097 ; initialization. 	
                                   3098 ;------------------------------------
      001127                       3099 step: ; {var limit -- var limit step}
      009037 CD 88 A8 A1 85   [ 2] 3100 	btjt flags,#FLOOP,1$
      00903C 27 03 CC         [ 2] 3101 	jp syntax_error
      00903F 87 B9 1F         [ 4] 3102 1$: call relation
      009042 06 0D            [ 1] 3103 	cp a,#TK_INTGR
      009044 05 26            [ 1] 3104 	jreq 2$
      009046 06 CD A8         [ 2] 3105 	jp syntax_error
      009049 44 CD            [ 2] 3106 2$:	ldw (FSTEP,sp),x ; step
                                   3107 ; leave loop back entry point on cstack 
                                   3108 ; cstack is 1 call deep from interpreter
      00113B                       3109 store_loop_addr:
      00904B 83 41 04         [ 2] 3110 	ldw x,basicptr  
      00904D 1F 0B            [ 2] 3111 	ldw (BPTR,sp),x 
      00904D A6 3A CD         [ 2] 3112 	ldw x,in.w 
      009050 83 41            [ 2] 3113 	ldw (INW,sp),x   
      009052 CD 90 07 72      [ 1] 3114 	bres flags,#FLOOP 
      009056 5F 00 04 CD      [ 1] 3115 	inc loop_depth  
      00905A A1               [ 4] 3116 	ret 
                                   3117 
                                   3118 ;--------------------------------
                                   3119 ; BASIC: NEXT var 
                                   3120 ; FOR loop control 
                                   3121 ; increment variable with step 
                                   3122 ; and compare with limit 
                                   3123 ; loop if threshold not crossed.
                                   3124 ; else stack. 
                                   3125 ; and decrement 'loop_depth' 
                                   3126 ;--------------------------------
      00114E                       3127 next: ; {var limit step retl1 -- [var limit step ] }
      00905B 79 AE 16 90      [ 1] 3128 	tnz loop_depth 
      00905F 3B 00            [ 1] 3129 	jrne 1$ 
      009061 04 4B 00         [ 2] 3130 	jp syntax_error 
      001157                       3131 1$: 
      009064 72 FB            [ 1] 3132 	ld a,#TK_VAR 
      009066 01 5C 5B         [ 4] 3133 	call expect
                                   3134 ; check for good variable after NEXT 	 
      009069 02 72            [ 2] 3135 	cpw x,(CVAR,sp)
      00906B 5F 00            [ 1] 3136 	jreq 2$  
      00906D 02 CD A5         [ 2] 3137 	jp syntax_error ; not the good one 
      001163                       3138 2$: ; increment variable 
      009070 93               [ 2] 3139 	ldw x,(x)  ; get var value 
      009071 A1 84 27         [ 2] 3140 	addw x,(FSTEP,sp) ; var+step 
      009074 06 CD            [ 2] 3141 	ldw y,(CVAR,sp)
      009076 90 17            [ 2] 3142 	ldw (y),x ; save var new value 
                                   3143 ; check sign of STEP  
      009078 CC 87            [ 1] 3144 	ld a,#0x80
      00907A B9 16            [ 1] 3145 	bcp a,(FSTEP,sp)
      00907C 06 90            [ 1] 3146 	jrpl 4$
                                   3147 ;negative step 
      00907E FF CD            [ 2] 3148 	cpw x,(LIMIT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009080 90 17            [ 1] 3149 	jrslt loop_done
      009082 CD 88            [ 2] 3150 	jra loop_back 
      001177                       3151 4$: ; positive step
      009084 A8 A1            [ 2] 3152 	cpw x,(LIMIT,sp)
      009086 09 27            [ 1] 3153 	jrsgt loop_done
      00117B                       3154 loop_back:
      009088 A0 A1            [ 2] 3155 	ldw x,(BPTR,sp)
      00908A 00 27 07         [ 2] 3156 	ldw basicptr,x 
      00908D A1 0B 27 03 CC   [ 2] 3157 	btjf flags,#FRUN,1$ 
      009092 87 B9            [ 1] 3158 	ld a,(2,x)
      009094 C7 00 03         [ 1] 3159 	ld count,a
      009094 5B 07            [ 2] 3160 1$:	ldw x,(INW,sp)
      009096 81 00 00         [ 2] 3161 	ldw in.w,x 
      009097 81               [ 4] 3162 	ret 
      001190                       3163 loop_done:
                                   3164 	; remove loop data from stack  
      009097 55               [ 2] 3165 	popw x
      001191                       3166 	_drop VSIZE 
      009098 00 04            [ 2]    1     addw sp,#VSIZE 
      00909A 00 02 81 1D      [ 1] 3167 	dec loop_depth 
                                   3168 ;	pushw x 
                                   3169 ;	ret 
      00909D FC               [ 2] 3170 	jp (x)
                                   3171 
                                   3172 ;----------------------------
                                   3173 ; called by goto/gosub
                                   3174 ; to get target line number 
                                   3175 ;---------------------------
      001198                       3176 get_target_line:
      00909D 52 04 0F         [ 4] 3177 	call relation 
      0090A0 01 CD            [ 1] 3178 	cp a,#TK_INTGR
      0090A2 8C 61            [ 1] 3179 	jreq 1$
      0090A4 A1 02 24         [ 2] 3180 	jp syntax_error
      0090A7 03               [ 1] 3181 1$:	clr a
      0090A8 CC 87 B9 A1      [ 2] 3182 	ldw y,basicptr 
      0090AC 03 25            [ 2] 3183 	ldw y,(y)
      0090AE 04 85            [ 2] 3184 	pushw y 
      0090B0 9F 6B            [ 2] 3185 	cpw x,(1,sp)
      0090B2 01 85            [ 2] 3186 	addw sp,#2 
      0090B4 9F 6B            [ 1] 3187 	jrult 11$
      0090B6 02               [ 1] 3188 	inc a 
      0011B2                       3189 11$:	
      0090B7 85 F6 14         [ 4] 3190 	call search_lineno  
      0090BA 02               [ 2] 3191 	tnzw x 
      0090BB 18 01            [ 1] 3192 	jrne 2$ 
      0090BD 27 F9            [ 1] 3193 	ld a,#ERR_NO_LINE 
      0090BF 5B 04 81         [ 2] 3194 	jp tb_error 
      0090C2 81               [ 4] 3195 2$:	ret 
                                   3196 
                                   3197 ;------------------------
                                   3198 ; BASIC: GOTO line# 
                                   3199 ; jump to line# 
                                   3200 ; here cstack is 2 call deep from interpreter 
                                   3201 ;------------------------
      0011BE                       3202 goto:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0090C2 CD 8C 61 A1 02   [ 2] 3203 	btjt flags,#FRUN,0$ 
      0090C7 27 03            [ 1] 3204 	ld a,#ERR_RUN_ONLY
      0090C9 CC 87 B9         [ 2] 3205 	jp tb_error 
      0090CC 81               [ 4] 3206 	ret 
      0090CC 85 9F 85         [ 4] 3207 0$:	call get_target_line
      0011CC                       3208 jp_to_target:
      0090CF FA F7 81         [ 2] 3209 	ldw basicptr,x 
      0090D2 E6 02            [ 1] 3210 	ld a,(2,x)
      0090D2 CD 8C 61         [ 1] 3211 	ld count,a 
      0090D5 A1 02 27 03      [ 1] 3212 	mov in,#3 
      0090D9 CC               [ 4] 3213 	ret 
                                   3214 
                                   3215 
                                   3216 ;--------------------
                                   3217 ; BASIC: GOSUB line#
                                   3218 ; basic subroutine call
                                   3219 ; actual line# and basicptr 
                                   3220 ; are saved on cstack
                                   3221 ; here cstack is 2 call deep from interpreter 
                                   3222 ;--------------------
                           000003  3223 	RET_ADDR=3
                           000005  3224 	RET_INW=5
                           000004  3225 	VSIZE=4  
      0011D9                       3226 gosub:
      0090DA 87 B9 00 20 06   [ 2] 3227 	btjt flags,#FRUN,0$ 
      0090DC A6 06            [ 1] 3228 	ld a,#ERR_RUN_ONLY
      0090DC 85 9F 43         [ 2] 3229 	jp tb_error 
      0090DF 85               [ 4] 3230 	ret 
      0090E0 F4               [ 2] 3231 0$:	popw x 
      0011E5                       3232 	_vars VSIZE  
      0090E1 F7 81            [ 2]    1     sub sp,#VSIZE 
      0090E3 89               [ 2] 3233 	pushw x 
      0090E3 CD 8C 61         [ 2] 3234 	ldw x,basicptr
      0090E6 A1 02            [ 2] 3235 	ldw (RET_ADDR,sp),x 
      0090E8 27 03 CC         [ 4] 3236 	call get_target_line  
      0090EB 87               [ 2] 3237 	pushw x 
      0090EC B9 85 9F         [ 2] 3238 	ldw x,in.w 
      0090EF 85 F8            [ 2] 3239 	ldw (RET_INW+2,sp),x
      0090F1 F7               [ 2] 3240 	popw x 
      0090F2 81 D3            [ 2] 3241 	jra jp_to_target
                                   3242 
                                   3243 ;------------------------
                                   3244 ; BASIC: RETURN 
                                   3245 ; exit from a subroutine 
                                   3246 ; 
                                   3247 ;------------------------
      0090F3                       3248 return:
      0090F3 CD 8C 5C A1 02   [ 2] 3249 	btjt flags,#FRUN,0$ 
      0090F8 27 03            [ 1] 3250 	ld a,#ERR_RUN_ONLY
      0090FA CC 87 B9         [ 2] 3251 	jp tb_error 
      0090FD                       3252 0$:	
      0090FD 85 9F            [ 2] 3253 	ldw x,(RET_ADDR,sp) 
      0090FF A4 07 88         [ 2] 3254 	ldw basicptr,x
      009102 A6 01            [ 1] 3255 	ld a,(2,x)
      009104 0D 01 27         [ 1] 3256 	ld count,a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009107 05 48            [ 2] 3257 	ldw x,(RET_INW,sp)
      009109 0A 01 20         [ 2] 3258 	ldw in.w,x 
      00910C F7               [ 2] 3259 	popw x 
      001213                       3260 	_drop VSIZE 
      00910D 5B 01            [ 2]    1     addw sp,#VSIZE 
      00910F 85               [ 2] 3261 	pushw x
      009110 F4               [ 4] 3262 	ret  
                                   3263 
                                   3264 
                                   3265 ;----------------------------------
                                   3266 ; BASIC: RUN
                                   3267 ; run BASIC program in RAM
                                   3268 ;----------------------------------- 
      001217                       3269 run: 
      009111 27 02 A6 01 5F   [ 2] 3270 	btjf flags,#FRUN,0$  
      009116 97               [ 1] 3271 	clr a 
      009117 A6               [ 4] 3272 	ret
      00121E                       3273 0$: 
      009118 84 81 00 20 12   [ 2] 3274 	btjf flags,#FBREAK,1$
      00911A                       3275 	_drop 2 
      00911A CD 8C            [ 2]    1     addw sp,#2 
      00911C 61 A1 02         [ 4] 3276 	call rest_context
      001228                       3277 	_drop CTXT_SIZE 
      00911F 27 03            [ 2]    1     addw sp,#CTXT_SIZE 
      009121 CC 87 B9 20      [ 1] 3278 	bres flags,#FBREAK 
      009124 72 10 00 20      [ 1] 3279 	bset flags,#FRUN 
      009124 85 9F 85         [ 2] 3280 	jp interpreter 
      009127 F7 81 19         [ 2] 3281 1$:	ldw x,txtbgn
      009129 C3 00 1B         [ 2] 3282 	cpw x,txtend 
      009129 CD 8C            [ 1] 3283 	jrmi run_it 
      00912B 5C A1 01         [ 2] 3284 	ldw x,#err_no_prog
      00912E 27 03 CC         [ 4] 3285 	call puts 
      009131 87 B9 85 F6 5F   [ 1] 3286 	mov in,count
      009136 97               [ 2] 3287 	popw x 
      009137 A6 84 81         [ 2] 3288 	jp run_app  
      00913A                       3289 run_it:	 
      00913A CD 8D A9         [ 4] 3290     call ubound 
      00124F                       3291 	_drop 2 ; drop return address 
      00913D A1 84            [ 2]    1     addw sp,#2 
                                   3292 ; clear data pointer 
      00913F 27               [ 1] 3293 	clrw x 
      009140 03 CC 87         [ 2] 3294 	ldw data_ptr,x 
      009143 B9 4F 5D 26      [ 1] 3295 	clr data_ofs 
      009147 05 55 00 04      [ 1] 3296 	clr data_len 
                                   3297 ; initialize BASIC pointer 
      00914B 00 02 81         [ 2] 3298 	ldw x,txtbgn 
      00914E CF 00 04         [ 2] 3299 	ldw basicptr,x 
      00914E 85 52            [ 1] 3300 	ld a,(2,x)
      009150 0A 89 A6         [ 1] 3301 	ld count,a
      009153 85 CD 8C 4F      [ 1] 3302 	mov in,#3	
      009157 1F 07 CD 8E      [ 1] 3303 	bset flags,#FRUN 
      00915B 80 72 14         [ 2] 3304 	jp interpreter 
                                   3305 
                                   3306 
                                   3307 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3308 ; BASIC: END
                                   3309 ; end running program
                                   3310 ;---------------------- 
      001273                       3311 cmd_end: 
                                   3312 ; clean stack 
      00915E 00 21 5F         [ 2] 3313 	ldw x,#STACK_EMPTY
      009161 1F               [ 1] 3314 	ldw sp,x 
      009162 0B 1F 09         [ 2] 3315 	jp warm_start
                                   3316 
                                   3317 ;-----------------
                                   3318 ; 1 Khz beep 
                                   3319 ;-----------------
      00127A                       3320 beep_1khz:: 
      009165 CD 88 A8         [ 2] 3321 	ldw x,#100
      009168 A1 80 27 03      [ 2] 3322 	ldw y,#1000
      00916C CC 87            [ 2] 3323 	jra beep
                                   3324 
                                   3325 ;-----------------------
                                   3326 ; BASIC: TONE expr1,expr2
                                   3327 ; used TIMER2 channel 1
                                   3328 ; to produce a tone 
                                   3329 ; arguments:
                                   3330 ;    expr1   frequency 
                                   3331 ;    expr2   duration msec.
                                   3332 ;---------------------------
      001283                       3333 tone:
      00916E B9 0B E1         [ 4] 3334 	call arg_list 
      00916F A1 02            [ 1] 3335 	cp a,#2 
      00916F A3 91            [ 1] 3336 	jreq 1$
      009171 77 27 03         [ 2] 3337 	jp syntax_error 
      00128D                       3338 1$: 
      009174 CC               [ 2] 3339 	popw x ; duration
      009175 87 B9            [ 2] 3340 	popw y ; frequency 
      009177                       3341 beep:  
      009177 72               [ 2] 3342 	pushw x 
      009178 04 00 21         [ 2] 3343 	ldw x,#TIM2_CLK_FREQ
      00917B 03               [ 2] 3344 	divw x,y 
                                   3345 ; round to nearest integer 
      00917C CC 87 B9 CD      [ 2] 3346 	cpw y,#TIM2_CLK_FREQ/2
      009180 8D A9            [ 1] 3347 	jrmi 2$
      009182 A1               [ 1] 3348 	incw x 
      00129C                       3349 2$:	 
      009183 84               [ 1] 3350 	ld a,xh 
      009184 27 03 CC         [ 1] 3351 	ld TIM2_ARRH,a 
      009187 87               [ 1] 3352 	ld a,xl 
      009188 B9 1F 05         [ 1] 3353 	ld TIM2_ARRL,a 
                                   3354 ; 50% duty cycle 
      00918B CD               [ 1] 3355 	ccf 
      00918C 88               [ 2] 3356 	rrcw x 
      00918D A8               [ 1] 3357 	ld a,xh 
      00918E A1 00 27         [ 1] 3358 	ld TIM2_CCR1H,a 
      009191 0E               [ 1] 3359 	ld a,xl
      009192 A1 80 26         [ 1] 3360 	ld TIM2_CCR1L,a
      009195 05 A3 91 A7      [ 1] 3361 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009199 27 0C 53 00      [ 1] 3362 	bset TIM2_CR1,#TIM2_CR1_CEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00919B 72 10 53 04      [ 1] 3363 	bset TIM2_EGR,#TIM2_EGR_UG
      00919B 55               [ 2] 3364 	popw x 
      00919C 00 03 00         [ 4] 3365 	call pause02
      00919F 02 11 53 08      [ 1] 3366 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0091A0 72 11 53 00      [ 1] 3367 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0091A0 AE               [ 4] 3368 	ret 
                                   3369 
                                   3370 ;-------------------------------
                                   3371 ; BASIC: ADCON 0|1 [,divisor]  
                                   3372 ; disable/enanble ADC 
                                   3373 ;-------------------------------
                           000003  3374 	ONOFF=3 
                           000001  3375 	DIVSOR=1
                           000004  3376 	VSIZE=4 
      0012C7                       3377 power_adc:
      0091A1 00 01 1F         [ 4] 3378 	call arg_list 
      0091A4 03 20            [ 1] 3379 	cp a,#2	
      0091A6 14 0B            [ 1] 3380 	jreq 1$
      0091A7 A1 01            [ 1] 3381 	cp a,#1 
      0091A7 72 04            [ 1] 3382 	jreq 0$ 
      0091A9 00 21 03         [ 2] 3383 	jp syntax_error 
      0091AC CC 87 B9         [ 2] 3384 0$: ldw x,#0
      0091AF CD               [ 2] 3385 	pushw x  ; divisor 
      0091B0 8D A9            [ 2] 3386 1$: ldw x,(ONOFF,sp)
      0091B2 A1               [ 2] 3387 	tnzw x 
      0091B3 84 27            [ 1] 3388 	jreq 2$ 
      0091B5 03 CC            [ 2] 3389 	ldw x,(DIVSOR,sp) ; divisor 
      0091B7 87               [ 1] 3390 	ld a,xl
      0091B8 B9 1F            [ 1] 3391 	and a,#7
      0091BA 03               [ 1] 3392 	swap a 
      0091BB C7 54 01         [ 1] 3393 	ld ADC_CR1,a
      0091BB CE 00 05 1F      [ 1] 3394 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0091BF 0B CE 00 01      [ 1] 3395 	bset ADC_CR1,#ADC_CR1_ADON 
      0012EF                       3396 	_usec_dly 7 
      0091C3 1F 09 72         [ 2]    1     ldw x,#(16*7-2)/4
      0091C6 15               [ 2]    2     decw x
      0091C7 00               [ 1]    3     nop 
      0091C8 21 72            [ 1]    4     jrne .-4
      0091CA 5C 00            [ 2] 3397 	jra 3$
      0091CC 1E 81 54 01      [ 1] 3398 2$: bres ADC_CR1,#ADC_CR1_ADON
      0091CE 72 17 50 CA      [ 1] 3399 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001300                       3400 3$:	_drop VSIZE 
      0091CE 72 5D            [ 2]    1     addw sp,#VSIZE 
      0091D0 00               [ 4] 3401 	ret
                                   3402 
                                   3403 ;-----------------------------
                                   3404 ; BASIC: ADCREAD (channel)
                                   3405 ; read adc channel {0..5}
                                   3406 ; output:
                                   3407 ;   A 		TK_INTGR 
                                   3408 ;   X 		value 
                                   3409 ;-----------------------------
      001303                       3410 analog_read:
      0091D1 1E 26 03         [ 4] 3411 	call func_args 
      0091D4 CC 87            [ 1] 3412 	cp a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0091D6 B9 03            [ 1] 3413 	jreq 1$
      0091D7 CC 07 39         [ 2] 3414 	jp syntax_error
      0091D7 A6               [ 2] 3415 1$: popw x 
      0091D8 85 CD 8C         [ 2] 3416 	cpw x,#5 
      0091DB 4F 13            [ 2] 3417 	jrule 2$
      0091DD 07 27            [ 1] 3418 	ld a,#ERR_BAD_VALUE
      0091DF 03 CC 87         [ 2] 3419 	jp tb_error 
      0091E2 B9               [ 1] 3420 2$: ld a,xl
      0091E3 C7 00 0D         [ 1] 3421 	ld acc8,a 
      0091E3 FE 72            [ 1] 3422 	ld a,#5
      0091E5 FB 03 16         [ 1] 3423 	sub a,acc8 
      0091E8 07 90 FF         [ 1] 3424 	ld ADC_CSR,a
      0091EB A6 80 15 03      [ 1] 3425 	bset ADC_CR2,#ADC_CR2_ALIGN
      0091EF 2A 06 13 05      [ 1] 3426 	bset ADC_CR1,#ADC_CR1_ADON
      0091F3 2F 1B 20 04 FB   [ 2] 3427 	btjf ADC_CSR,#ADC_CSR_EOC,.
      0091F7 CE 54 04         [ 2] 3428 	ldw x,ADC_DRH
      0091F7 13 05            [ 1] 3429 	ld a,#TK_INTGR
      0091F9 2C               [ 4] 3430 	ret 
                                   3431 
                                   3432 ;-----------------------
                                   3433 ; BASIC: DREAD(pin)
                                   3434 ; Arduino pins 
                                   3435 ; read state of a digital pin 
                                   3436 ; pin# {0..15}
                                   3437 ; output:
                                   3438 ;    A 		TK_INTGR
                                   3439 ;    X      0|1 
                                   3440 ;-------------------------
                           000001  3441 	PINNO=1
                           000001  3442 	VSIZE=1
      001337                       3443 digital_read:
      001337                       3444 	_vars VSIZE 
      0091FA 15 01            [ 2]    1     sub sp,#VSIZE 
      0091FB CD 0B DC         [ 4] 3445 	call func_args
      0091FB 1E 0B            [ 1] 3446 	cp a,#1
      0091FD CF 00            [ 1] 3447 	jreq 1$
      0091FF 05 72 01         [ 2] 3448 	jp syntax_error
      009202 00               [ 2] 3449 1$: popw x 
      009203 21 05 E6         [ 2] 3450 	cpw x,#15 
      009206 02 C7            [ 2] 3451 	jrule 2$
      009208 00 04            [ 1] 3452 	ld a,#ERR_BAD_VALUE
      00920A 1E 09 CF         [ 2] 3453 	jp tb_error 
      00920D 00 01 81         [ 4] 3454 2$:	call select_pin 
      009210 6B 01            [ 1] 3455 	ld (PINNO,sp),a
      009210 85 5B            [ 1] 3456 	ld a,(GPIO_IDR,x)
      009212 0A 72            [ 1] 3457 	tnz (PINNO,sp)
      009214 5A 00            [ 1] 3458 	jreq 8$
      009216 1E               [ 1] 3459 3$: srl a 
      009217 FC 01            [ 1] 3460 	dec (PINNO,sp)
      009218 26 FB            [ 1] 3461 	jrne 3$ 
      009218 CD 8D            [ 1] 3462 8$: and a,#1 
      00921A A9               [ 1] 3463 	clrw x 
      00921B A1               [ 1] 3464 	ld xl,a 
      00921C 84 27            [ 1] 3465 	ld a,#TK_INTGR
      001364                       3466 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00921E 03 CC            [ 2]    1     addw sp,#VSIZE 
      009220 87               [ 4] 3467 	ret
                                   3468 
                                   3469 
                                   3470 ;-----------------------
                                   3471 ; BASIC: DWRITE pin,0|1
                                   3472 ; Arduino pins 
                                   3473 ; write to a digital pin 
                                   3474 ; pin# {0..15}
                                   3475 ; output:
                                   3476 ;    A 		TK_INTGR
                                   3477 ;    X      0|1 
                                   3478 ;-------------------------
                           000001  3479 	PINNO=1
                           000002  3480 	PINVAL=2
                           000002  3481 	VSIZE=2
      001367                       3482 digital_write:
      001367                       3483 	_vars VSIZE 
      009221 B9 4F            [ 2]    1     sub sp,#VSIZE 
      009223 90 CE 00         [ 4] 3484 	call arg_list  
      009226 05 90            [ 1] 3485 	cp a,#2 
      009228 FE 90            [ 1] 3486 	jreq 1$
      00922A 89 13 01         [ 2] 3487 	jp syntax_error
      00922D 5B               [ 2] 3488 1$: popw x 
      00922E 02               [ 1] 3489 	ld a,xl 
      00922F 25 01            [ 1] 3490 	ld (PINVAL,sp),a
      009231 4C               [ 2] 3491 	popw x 
      009232 A3 00 0F         [ 2] 3492 	cpw x,#15 
      009232 CD A3            [ 2] 3493 	jrule 2$
      009234 5C 5D            [ 1] 3494 	ld a,#ERR_BAD_VALUE
      009236 26 05 A6         [ 2] 3495 	jp tb_error 
      009239 05 CC 87         [ 4] 3496 2$:	call select_pin 
      00923C BB 81            [ 1] 3497 	ld (PINNO,sp),a 
      00923E A6 01            [ 1] 3498 	ld a,#1
      00923E 72 00            [ 1] 3499 	tnz (PINNO,sp)
      009240 00 21            [ 1] 3500 	jreq 4$
      009242 06               [ 1] 3501 3$: sll a
      009243 A6 06            [ 1] 3502 	dec (PINNO,sp)
      009245 CC 87            [ 1] 3503 	jrne 3$
      009247 BB 81            [ 1] 3504 4$: tnz (PINVAL,sp)
      009249 CD 92            [ 1] 3505 	jrne 5$
      00924B 18               [ 1] 3506 	cpl a 
      00924C E4 00            [ 1] 3507 	and a,(GPIO_ODR,x)
      00924C CF 00            [ 2] 3508 	jra 8$
      00924E 05 E6            [ 1] 3509 5$: or a,(GPIO_ODR,x)
      009250 02 C7            [ 1] 3510 8$: ld (GPIO_ODR,x),a 
      00139F                       3511 	_drop VSIZE 
      009252 00 04            [ 2]    1     addw sp,#VSIZE 
      009254 35               [ 4] 3512 	ret
                                   3513 
                                   3514 
                                   3515 ;-----------------------
                                   3516 ; BASIC: STOP
                                   3517 ; stop progam execution  
                                   3518 ; without resetting pointers 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3519 ; the program is resumed
                                   3520 ; with RUN 
                                   3521 ;-------------------------
      0013A2                       3522 stop:
      009255 03 00 02 81 02   [ 2] 3523 	btjt flags,#FRUN,2$
      009259 4F               [ 1] 3524 	clr a
      009259 72               [ 4] 3525 	ret 
      0013A9                       3526 2$:	 
                                   3527 ; create space on cstack to save context 
      00925A 00 00 21         [ 2] 3528 	ldw x,#break_point 
      00925D 06 A6 06         [ 4] 3529 	call puts 
      0013AF                       3530 	_drop 2 ;drop return address 
      009260 CC 87            [ 2]    1     addw sp,#2 
      0013B1                       3531 	_vars CTXT_SIZE ; context size 
      009262 BB 81            [ 2]    1     sub sp,#CTXT_SIZE 
      009264 85 52 04         [ 4] 3532 	call save_context 
      009267 89 CE 00         [ 2] 3533 	ldw x,#tib 
      00926A 05 1F 03         [ 2] 3534 	ldw basicptr,x
      00926D CD               [ 1] 3535 	clr (x)
      00926E 92 18 89 CE      [ 1] 3536 	clr count  
      009272 00               [ 1] 3537 	clrw x 
      009273 01 1F 07         [ 2] 3538 	ldw in.w,x
      009276 85 20 D3 20      [ 1] 3539 	bres flags,#FRUN 
      009279 72 18 00 20      [ 1] 3540 	bset flags,#FBREAK
      009279 72 00 00         [ 2] 3541 	jp interpreter 
      00927C 21 05 A6 06 CC 87 BB  3542 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3543 
                                   3544 ;-----------------------
                                   3545 ; BASIC: NEW
                                   3546 ; from command line only 
                                   3547 ; free program memory
                                   3548 ; and clear variables 
                                   3549 ;------------------------
      009283                       3550 new: 
      009283 1E 03 CF 00 05   [ 2] 3551 	btjf flags,#FRUN,0$ 
      009288 E6               [ 4] 3552 	ret 
      0013F4                       3553 0$:	
      009289 02 C7 00         [ 4] 3554 	call clear_basic 
      00928C 04               [ 4] 3555 	ret 
                                   3556 
                                   3557 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3558 ;;;  flash memory operations
                                   3559 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3560 
                                   3561 ;--------------------------
                                   3562 ; align farptr to BLOCK_SIZE 
                                   3563 ;---------------------------
      0013F8                       3564 row_align:
      00928D 1E 05            [ 1] 3565 	ld a,#0x7f 
      00928F CF 00 01         [ 1] 3566 	and a,farptr+2 
      009292 85 5B            [ 1] 3567 	jreq 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009294 04 89 81         [ 2] 3568 	ldw x,farptr+1 
      009297 1C 00 80         [ 2] 3569 	addw x,#BLOCK_SIZE 
      009297 72 01            [ 1] 3570 	jrnc 0$
      009299 00 21 02 4F      [ 1] 3571 	inc farptr 
      00929D 81               [ 1] 3572 0$: ld a,xl 
      00929E A4 80            [ 1] 3573 	and a,#0x80
      00929E 72               [ 1] 3574 	ld xl,a
      00929F 09 00 21         [ 2] 3575 	ldw farptr+1,x  	
      0092A2 12               [ 4] 3576 1$:	ret
                                   3577 
                                   3578 ;--------------------
                                   3579 ; input:
                                   3580 ;   X     increment 
                                   3581 ; output:
                                   3582 ;   farptr  incremented 
                                   3583 ;---------------------
      001413                       3584 incr_farptr:
      0092A3 5B 02 CD 90      [ 2] 3585 	addw x,farptr+1 
      0092A7 17 5B            [ 1] 3586 	jrnc 1$
      0092A9 04 72 19 00      [ 1] 3587 	inc farptr 
      0092AD 21 72 10         [ 2] 3588 1$:	ldw farptr+1,x  
      0092B0 00               [ 4] 3589 	ret 
                                   3590 
                                   3591 ;-----------------------------------
                                   3592 ; scan block for non zero byte 
                                   3593 ; block are 128 bytes 
                                   3594 ; input:
                                   3595 ;    farptr     address block  
                                   3596 ; output:
                                   3597 ;     A     0 cleared, other not cleared  
                                   3598 ;-----------------------------------
      001421                       3599 scan_block:
      0092B1 21               [ 1] 3600 	clrw x 
      0092B2 CC 88 5C CE      [ 5] 3601 1$: ldf a,([farptr],x) 
      0092B6 00 1A            [ 1] 3602 	jrne 2$
      0092B8 C3               [ 1] 3603 	incw x 
      0092B9 00 1C 2B         [ 2] 3604 	cpw x,#BLOCK_SIZE 
      0092BC 0F AE            [ 1] 3605 	jrult 1$ 
      0092BE 87               [ 4] 3606 2$:	ret 
                                   3607 
                                   3608 
                                   3609 
                                   3610 ;-----------------------------------
                                   3611 ; BASIC: ERASE
                                   3612 ; erase all block in range from 
                                   3613 ;  'app_space' to RAM end (0x20000)
                                   3614 ; that contains a non zero byte.  
                                   3615 ;-----------------------------------
      00142F                       3616 erase:
                                   3617  ; operation done from RAM
                                   3618  ; copy code to RAM in tib   
      0092BF 52 CD A0         [ 4] 3619 	call move_erase_to_ram
                                   3620 	; first block 
      0092C2 74 55 00 04      [ 1] 3621 	clr farptr 
      0092C6 00 02 85         [ 2] 3622 	ldw x,#app_space
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0092C9 CC 85 9D         [ 2] 3623 	ldw farptr+1,x
      0092CC                       3624 1$:	 
      0092CC CD 8E 65         [ 4] 3625     call scan_block 
      0092CF 5B 02            [ 1] 3626 	jreq 2$
      0092D1 5F CF 00         [ 4] 3627 	call block_erase   
                                   3628 ; this block is clean, next  
      0092D4 07 72 5F         [ 2] 3629 2$:	ldw x,#BLOCK_SIZE
      0092D7 00 09 72         [ 4] 3630 	call incr_farptr
      0092DA 5F 00 0A         [ 1] 3631 	ld a,farptr
      0092DD CE 00            [ 1] 3632 	cp a,#2 
      0092DF 1A CF            [ 1] 3633 	jrult 1$ 
      0092E1 00 05 E6         [ 4] 3634 9$: call clear_basic
      0092E4 02               [ 4] 3635 	ret 
                                   3636 	
                                   3637 
                                   3638 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3639 ;  check for application signature 
                                   3640 ; output:
                                   3641 ;   Carry    0 app present 
                                   3642 ;            1 no app installed  
                                   3643 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001455                       3644 qsign: 
      0092E5 C7 00 04         [ 2] 3645 	ldw x,app_sign 
      0092E8 35 03 00         [ 2] 3646 	cpw x,#0x4243 ; "BC" 
      0092EB 02               [ 4] 3647 	ret 
                                   3648 
                                   3649 
                                   3650 ;---------------------------------------
                                   3651 ; BASIC: FLASHAPP  	
                                   3652 ; write application in RAM to FLASH 
                                   3653 ;--------------------------------------
      00145C                       3654 flash_app:
      0092EC 72 10 00         [ 4] 3655 	call qsign
      0092EF 21 CC            [ 1] 3656 	jrne 1$
      0092F1 88 5C DB         [ 2] 3657 	ldw x,#CANT_DO 
      0092F3 CD 1F F4         [ 4] 3658 	call puts 
      0092F3 AE 17            [ 2] 3659 	jra 9$
      001469                       3660 1$: 
      0092F5 FF 94 CC         [ 2] 3661 	ldw x,txtbgn
      0092F8 88 3D 1B         [ 2] 3662 	cpw x,txtend 
      0092FA 25 08            [ 1] 3663 	jrult 2$ 
      0092FA AE 00 64         [ 2] 3664 	ldw x,#NO_APP
      0092FD 90 AE 03         [ 4] 3665 	call puts 
      009300 E8 20            [ 2] 3666 	jra 9$
      001479                       3667 2$: 
                                   3668 ; PRG flash
                                   3669 ; must be done from RAM 
      009302 0D 01 70         [ 4] 3670 	call move_prg_to_ram
      009303 CD 00 FA         [ 4] 3671 	call unlock_flash 
                                   3672 ; initialize farptr 
      009303 CD 8C 61 A1      [ 1] 3673 	clr farptr 
      009307 02 27 03         [ 2] 3674 	ldw x,#app_sign 
      00930A CC 87 B9         [ 2] 3675 	ldw farptr+1,x
                                   3676 ; write signature
      00930D AE 42 43         [ 2] 3677 	ldw x,#0x4243 ; "BC" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00930D 85 90 85         [ 2] 3678 	ldw rsign,x 
      009310 CE 00 1B         [ 2] 3679 	ldw x,txtend 
      009310 89 AE F4 24      [ 2] 3680 	subw x,txtbgn 
      009314 65 90 A3         [ 2] 3681 	ldw rsize,x   
                                   3682 ; copy block to flash 
      009317 7A 12 2B         [ 2] 3683 	ldw x,#rsign  
      00931A 01 5C            [ 2] 3684 	ldw (1,sp),x   
      00931C 1E 01            [ 2] 3685 3$:	ldw x,(1,sp)
      00931C 9E C7 53         [ 4] 3686 	call write_row 
      00931F 0D 9F            [ 1] 3687 ld a,#'. 
      009321 C7 53 0E         [ 4] 3688 call putc 
      009324 8C 56            [ 2] 3689 	ldw x,(1,sp)
      009326 9E C7 53         [ 2] 3690 	addw x,#BLOCK_SIZE
      009329 0F 9F            [ 2] 3691 	ldw (1,sp),x  
      00932B C7 53 10         [ 2] 3692 	cpw x,txtend 
      00932E 72 10            [ 1] 3693 	jruge 8$
      009330 53 08 72         [ 2] 3694 	ldw x,#BLOCK_SIZE 
      009333 10 53 00         [ 4] 3695 	call incr_farptr
      009336 72 10            [ 2] 3696 	jra 3$ 
      0014BC                       3697 8$:	
      0014BC                       3698 	_drop 2   
      009338 53 04            [ 2]    1     addw sp,#2 
      00933A 85 CD 96         [ 2] 3699 	ldw x, #PROG_SIZE
      00933D C6 72 11         [ 4] 3700 	call puts 
      009340 53 08 72         [ 2] 3701 	ldw x,txtend 
      009343 11 53 00 81      [ 2] 3702 	subw x,txtbgn 
      009347 CD 08 83         [ 4] 3703 	call print_int
      009347 CD 8C 61         [ 2] 3704 	ldw x,#STR_BYTES
      00934A A1 02 27         [ 4] 3705 	call puts
      00934D 0B A1 01 27 03   [ 2] 3706 	btjf UART1_SR,#UART_SR_TC,.	
      009352 CC                    3707 	.byte 0x71 ; reset mcu 
      009353 87               [ 4] 3708 9$: ret 
                                   3709 
      009354 B9 AE 00 00 89 1E 03  3710 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE before"
             5D 27 1A 1E 01 9F A4
             07 4E C7 54 01 72 16
             50 CA 72 10 54 01 AE
             00 1B 5A 9D 26 FA 20
             08 72 11 54 01 72 17
             50 CA 5B 04 81 73 65
             20 45 52 41 53 45 20
             62 65 66 6F 72 65 00
      009383 4E 6F 20 61 70 70 6C  3711 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
      009383 CD 8C 5C A1 01 27 03  3712 PROG_SIZE: .asciz "program size: "
             CC 87 B9 85 A3 00 05
             23
      009392 05 A6 0A CC 87 BB 9F  3713 STR_BYTES: .asciz "bytes\n" 
                                   3714 
                                   3715 ;---------------------
                                   3716 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3717 ; write 1 or more byte to FLASH or EEPROM
                                   3718 ; starting at address  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal  C7-Bits]



                                   3719 ; input:
                                   3720 ;   expr1  	is address 
                                   3721 ;   expr2,...,exprn   are bytes to write
                                   3722 ; output:
                                   3723 ;   none 
                                   3724 ;---------------------
                           000001  3725 	ADDR=1
                           000002  3726 	VSIZ=2 
      001546                       3727 write:
      001546                       3728 	_vars VSIZE 
      00939A 00 0E            [ 2]    1     sub sp,#VSIZE 
      00939C A6 05 C0 00      [ 1] 3729 	clr farptr ; expect 16 bits address 
      0093A0 0E C7 54         [ 4] 3730 	call expression
      0093A3 00 72            [ 1] 3731 	cp a,#TK_INTGR 
      0093A5 16 54            [ 1] 3732 	jreq 0$
      0093A7 02 72 10         [ 2] 3733 	jp syntax_error
      0093AA 54 01            [ 2] 3734 0$: ldw (ADDR,sp),x 
      0093AC 72 0F 54         [ 4] 3735 	call next_token 
      0093AF 00 FB            [ 1] 3736 	cp a,#TK_COMMA 
      0093B1 CE 54            [ 1] 3737 	jreq 1$ 
      0093B3 04 A6            [ 2] 3738 	jra 9$ 
      0093B5 84 81 E0         [ 4] 3739 1$:	call expression
      0093B7 A1 84            [ 1] 3740 	cp a,#TK_INTGR
      0093B7 52 01            [ 1] 3741 	jreq 2$
      0093B9 CD 8C 5C         [ 2] 3742 	jp syntax_error
      0093BC A1               [ 1] 3743 2$:	ld a,xl 
      0093BD 01 27            [ 2] 3744 	ldw x,(ADDR,sp) 
      0093BF 03 CC 87         [ 2] 3745 	ldw farptr+1,x 
      0093C2 B9               [ 1] 3746 	clrw x 
      0093C3 85 A3 00         [ 4] 3747 	call write_byte
      0093C6 0F 23            [ 2] 3748 	ldw x,(ADDR,sp)
      0093C8 05               [ 1] 3749 	incw x 
      0093C9 A6 0A            [ 2] 3750 	jra 0$ 
      00157A                       3751 9$:
      00157A                       3752 	_drop VSIZE
      0093CB CC 87            [ 2]    1     addw sp,#VSIZE 
      0093CD BB               [ 4] 3753 	ret 
                                   3754 
                                   3755 
                                   3756 ;---------------------
                                   3757 ;BASIC: CHAR(expr)
                                   3758 ; évaluate expression 
                                   3759 ; and take the 7 least 
                                   3760 ; bits as ASCII character
                                   3761 ; return a TK_CHAR 
                                   3762 ;---------------------
      00157D                       3763 char:
      0093CE CD 98 04         [ 4] 3764 	call func_args 
      0093D1 6B 01            [ 1] 3765 	cp a,#1
      0093D3 E6 01            [ 1] 3766 	jreq 1$
      0093D5 0D 01 27         [ 2] 3767 	jp syntax_error
      0093D8 05               [ 2] 3768 1$:	popw x 
      0093D9 44               [ 1] 3769 	ld a,xl 
      0093DA 0A 01            [ 1] 3770 	and a,#0x7f 
      0093DC 26               [ 1] 3771 	ld xl,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0093DD FB A4            [ 1] 3772 	ld a,#TK_CHAR
      0093DF 01               [ 4] 3773 	ret
                                   3774 
                                   3775 ;---------------------
                                   3776 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3777 ; extract first character 
                                   3778 ; of string argument 
                                   3779 ; return it as TK_INTGR 
                                   3780 ;---------------------
      00158F                       3781 ascii:
      0093E0 5F 97            [ 1] 3782 	ld a,#TK_LPAREN
      0093E2 A6 84 5B         [ 4] 3783 	call expect 
      0093E5 01 81 28         [ 4] 3784 	call next_token 
      0093E7 A1 02            [ 1] 3785 	cp a,#TK_QSTR 
      0093E7 52 02            [ 1] 3786 	jreq 1$
      0093E9 CD 8C            [ 1] 3787 	cp a,#TK_CHAR 
      0093EB 61 A1            [ 1] 3788 	jreq 2$ 
      0093ED 02 27            [ 1] 3789 	cp a,#TK_CFUNC 
      0093EF 03 CC            [ 1] 3790 	jreq 0$
      0093F1 87 B9 85         [ 2] 3791 	jp syntax_error
      0093F4 9F               [ 4] 3792 0$: call (x)
      0093F5 6B 02            [ 2] 3793 	jra 2$
      0015A9                       3794 1$: 
      0093F7 85               [ 1] 3795 	ld a,(x) 
      0093F8 A3               [ 1] 3796 	clrw x
      0093F9 00               [ 1] 3797 	ld xl,a 
      0015AC                       3798 2$: 
      0093FA 0F               [ 2] 3799 	pushw x 
      0093FB 23 05            [ 1] 3800 	ld a,#TK_RPAREN 
      0093FD A6 0A CC         [ 4] 3801 	call expect
      009400 87               [ 2] 3802 	popw x 
      009401 BB CD            [ 1] 3803 	ld a,#TK_INTGR 
      009403 98               [ 4] 3804 	ret 
                                   3805 
                                   3806 ;---------------------
                                   3807 ;BASIC: KEY
                                   3808 ; wait for a character 
                                   3809 ; received from STDIN 
                                   3810 ; input:
                                   3811 ;	none 
                                   3812 ; output:
                                   3813 ;	X 		ASCII character 
                                   3814 ;---------------------
      0015B6                       3815 key:
      009404 04 6B 01         [ 4] 3816 	call getc 
      009407 A6               [ 1] 3817 	clrw x 
      009408 01               [ 1] 3818 	ld xl,a 
      009409 0D 01            [ 1] 3819 	ld a,#TK_INTGR
      00940B 27               [ 4] 3820 	ret
                                   3821 
                                   3822 ;----------------------
                                   3823 ; BASIC: QKEY
                                   3824 ; Return true if there 
                                   3825 ; is a character in 
                                   3826 ; waiting in STDIN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3827 ; input:
                                   3828 ;  none 
                                   3829 ; output:
                                   3830 ;   X 		0|-1 
                                   3831 ;-----------------------
      0015BE                       3832 qkey:: 
      00940C 05               [ 1] 3833 	clrw x 
      00940D 48 0A 01         [ 1] 3834 	ld a,rx1_head
      009410 26 FB 0D         [ 1] 3835 	cp a,rx1_tail 
      009413 02 26            [ 1] 3836 	jreq 9$ 
      009415 05               [ 2] 3837 	cplw x 
      009416 43 E4            [ 1] 3838 9$: ld a,#TK_INTGR
      009418 00               [ 4] 3839 	ret 
                                   3840 
                                   3841 ;---------------------
                                   3842 ; BASIC: GPIO(expr,reg)
                                   3843 ; return gpio address 
                                   3844 ; expr {0..8}
                                   3845 ; input:
                                   3846 ;   none 
                                   3847 ; output:
                                   3848 ;   X 		gpio register address
                                   3849 ;----------------------------
                           000003  3850 	PORT=3
                           000001  3851 	REG=1 
                           000004  3852 	VSIZE=4 
      0015CB                       3853 gpio:
      009419 20 02 EA         [ 4] 3854 	call func_args 
      00941C 00 E7            [ 1] 3855 	cp a,#2
      00941E 00 5B            [ 1] 3856 	jreq 1$
      009420 02 81 39         [ 2] 3857 	jp syntax_error  
      009422                       3858 1$:	
      009422 72 00            [ 2] 3859 	ldw x,(PORT,sp)
      009424 00 21            [ 1] 3860 	jrmi bad_port
      009426 02 4F 81         [ 2] 3861 	cpw x,#9
      009429 2A 12            [ 1] 3862 	jrpl bad_port
      009429 AE 94            [ 1] 3863 	ld a,#5
      00942B 50               [ 4] 3864 	mul x,a
      00942C CD A0 74         [ 2] 3865 	addw x,#GPIO_BASE 
      00942F 5B 02            [ 2] 3866 	ldw (PORT,sp),x  
      009431 52 04            [ 2] 3867 	ldw x,(REG,sp) 
      009433 CD 90 07         [ 2] 3868 	addw x,(PORT,sp)
      009436 AE 16            [ 1] 3869 	ld a,#TK_INTGR
      0015ED                       3870 	_drop VSIZE 
      009438 90 CF            [ 2]    1     addw sp,#VSIZE 
      00943A 00               [ 4] 3871 	ret
      0015F0                       3872 bad_port:
      00943B 05 7F            [ 1] 3873 	ld a,#ERR_BAD_VALUE
      00943D 72 5F 00         [ 2] 3874 	jp tb_error
                                   3875 
                                   3876 
                                   3877 ;-------------------------
                                   3878 ; BASIC: UFLASH 
                                   3879 ; return free flash address
                                   3880 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3881 ;  none 
                                   3882 ; output:
                                   3883 ;	A		TK_INTGR
                                   3884 ;   X 		free address 
                                   3885 ;---------------------------
      0015F5                       3886 uflash:
      009440 04 5F CF         [ 2] 3887 	ldw x,app_sign
      009443 00 01 72         [ 2] 3888 	cpw x,#4243 ; signature "BC" 
      009446 11 00            [ 1] 3889 	jreq 1$
      009448 21 72 18         [ 2] 3890 	ldw x,app_size 
      00944B 00 21 CC         [ 2] 3891 	addw x,#app
      00944E 88 5C            [ 2] 3892 	jra 2$
      009450 0A 62 72         [ 2] 3893 1$:	ldw x,#app_space 
      009453 65 61            [ 1] 3894 2$:	ld a,#TK_INTGR 
      009455 6B               [ 4] 3895 	ret 
                                   3896 
                                   3897 
                                   3898 ;---------------------
                                   3899 ; BASIC: USR(addr[,arg])
                                   3900 ; execute a function written 
                                   3901 ; in binary code.
                                   3902 ; binary fonction should 
                                   3903 ; return token attribute in A 
                                   3904 ; and value in X. 
                                   3905 ; input:
                                   3906 ;   addr	routine address 
                                   3907 ;   arg 	is an optional argument 
                                   3908 ; output:
                                   3909 ;   A 		token attribute 
                                   3910 ;   X       returned value 
                                   3911 ;---------------------
      00160B                       3912 usr:
      009456 20 70            [ 2] 3913 	pushw y 	
      009458 6F 69 6E         [ 4] 3914 	call func_args 
      00945B 74 2C            [ 1] 3915 	cp a,#1 
      00945D 20 52            [ 1] 3916 	jreq 2$
      00945F 55 4E            [ 1] 3917 	cp a,#2
      009461 20 74            [ 1] 3918 	jreq 2$  
      009463 6F 20 72         [ 2] 3919 	jp syntax_error 
      009466 65 73            [ 2] 3920 2$: popw y  ; arg|addr 
      009468 75 6D            [ 1] 3921 	cp a,#1
      00946A 65 2E            [ 1] 3922 	jreq 3$
      00946C 0A               [ 2] 3923 	popw x ; addr
      00946D 00               [ 1] 3924 	exgw x,y 
      00946E 90 FD            [ 4] 3925 3$: call (y)
      00946E 72 01            [ 2] 3926 	popw y 
      009470 00               [ 4] 3927 	ret 
                                   3928 
                                   3929 ;------------------------------
                                   3930 ; BASIC: BYE 
                                   3931 ; halt mcu in its lowest power mode 
                                   3932 ; wait for reset or external interrupt
                                   3933 ; do a cold start on wakeup.
                                   3934 ;------------------------------
      001628                       3935 bye:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009471 21 01 81 30 FB   [ 2] 3936 	btjf UART1_SR,#UART_SR_TC,.
      009474 8E               [10] 3937 	halt
      009474 CD 86 23         [ 2] 3938 	jp cold_start  
                                   3939 
                                   3940 ;----------------------------------
                                   3941 ; BASIC: SLEEP 
                                   3942 ; halt mcu until reset or external
                                   3943 ; interrupt.
                                   3944 ; Resume progam after SLEEP command
                                   3945 ;----------------------------------
      001631                       3946 sleep:
      009477 81 0D 52 30 FB   [ 2] 3947 	btjf UART1_SR,#UART_SR_TC,.
      009478 72 16 00 20      [ 1] 3948 	bset flags,#FSLEEP
      009478 A6               [10] 3949 	halt 
      009479 7F               [ 4] 3950 	ret 
                                   3951 
                                   3952 ;-------------------------------
                                   3953 ; BASIC: PAUSE expr 
                                   3954 ; suspend execution for n msec.
                                   3955 ; input:
                                   3956 ;	none
                                   3957 ; output:
                                   3958 ;	none 
                                   3959 ;------------------------------
      00163C                       3960 pause:
      00947A C4 00 19         [ 4] 3961 	call expression
      00947D 27 13            [ 1] 3962 	cp a,#TK_INTGR
      00947F CE 00            [ 1] 3963 	jreq pause02 
      009481 18 1C 00         [ 2] 3964 	jp syntax_error
      001646                       3965 pause02: 
      009484 80               [ 2] 3966 1$: tnzw x 
      009485 24 04            [ 1] 3967 	jreq 2$
      009487 72               [10] 3968 	wfi 
      009488 5C               [ 2] 3969 	decw x 
      009489 00 17            [ 1] 3970 	jrne 1$
      00948B 9F               [ 1] 3971 2$:	clr a 
      00948C A4               [ 4] 3972 	ret 
                                   3973 
                                   3974 ;------------------------------
                                   3975 ; BASIC: AWU expr
                                   3976 ; halt mcu for 'expr' milliseconds
                                   3977 ; use Auto wakeup peripheral
                                   3978 ; all oscillators stopped except LSI
                                   3979 ; range: 1ms - 511ms
                                   3980 ; input:
                                   3981 ;  none
                                   3982 ; output:
                                   3983 ;  none:
                                   3984 ;------------------------------
      00164F                       3985 awu:
      00948D 80 97 CF         [ 4] 3986   call expression
      009490 00 18            [ 1] 3987   cp a,#TK_INTGR
      009492 81 03            [ 1] 3988   jreq awu02
      009493 CC 07 39         [ 2] 3989   jp syntax_error
      001659                       3990 awu02:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009493 72 BB 00         [ 2] 3991   cpw x,#5120
      009496 18 24            [ 1] 3992   jrmi 1$ 
      009498 04 72 5C 00      [ 1] 3993   mov AWU_TBR,#15 
      00949C 17 CF            [ 1] 3994   ld a,#30
      00949E 00               [ 2] 3995   div x,a
      00949F 18 81            [ 1] 3996   ld a,#16
      0094A1 62               [ 2] 3997   div x,a 
      0094A1 5F 92            [ 2] 3998   jra 4$
      00166A                       3999 1$: 
      0094A3 AF 00 17         [ 2] 4000   cpw x,#2048
      0094A6 26 06            [ 1] 4001   jrmi 2$ 
      0094A8 5C A3 00 80      [ 1] 4002   mov AWU_TBR,#14
      0094AC 25 F4            [ 1] 4003   ld a,#80
      0094AE 81               [ 2] 4004   div x,a 
      0094AF 20 10            [ 2] 4005   jra 4$   
      001678                       4006 2$:
      0094AF CD 81 BC 72      [ 1] 4007   mov AWU_TBR,#7
      00167C                       4008 3$:  
                                   4009 ; while X > 64  divide by 2 and increment AWU_TBR 
      0094B3 5F 00 17         [ 2] 4010   cpw x,#64 
      0094B6 AE AA            [ 2] 4011   jrule 4$ 
      0094B8 80 CF 00 18      [ 1] 4012   inc AWU_TBR 
      0094BC 54               [ 2] 4013   srlw x 
      0094BC CD 94            [ 2] 4014   jra 3$ 
      001688                       4015 4$:
      0094BE A1               [ 1] 4016   ld a, xl
      0094BF 27               [ 1] 4017   dec a 
      0094C0 03 CD            [ 1] 4018   jreq 5$
      0094C2 82               [ 1] 4019   dec a 	
      00168D                       4020 5$: 
      0094C3 37 AE            [ 1] 4021   and a,#0x3e 
      0094C5 00 80 CD         [ 1] 4022   ld AWU_APR,a 
      0094C8 94 93 C6 00      [ 1] 4023   bset AWU_CSR,#AWU_CSR_AWUEN
      0094CC 17               [10] 4024   halt 
                                   4025 
      0094CD A1               [ 4] 4026   ret 
                                   4027 
                                   4028 ;------------------------------
                                   4029 ; BASIC: TICKS
                                   4030 ; return msec ticks counter value 
                                   4031 ; input:
                                   4032 ; 	none 
                                   4033 ; output:
                                   4034 ;	X 		TK_INTGR
                                   4035 ;-------------------------------
      001698                       4036 get_ticks:
      0094CE 02 25 EB         [ 2] 4037 	ldw x,ticks 
      0094D1 CD 86            [ 1] 4038 	ld a,#TK_INTGR
      0094D3 23               [ 4] 4039 	ret 
                                   4040 
                                   4041 
                                   4042 
                                   4043 ;------------------------------
                                   4044 ; BASIC: ABS(expr)
                                   4045 ; return absolute value of expr.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4046 ; input:
                                   4047 ;   none
                                   4048 ; output:
                                   4049 ;   X     	positive integer
                                   4050 ;-------------------------------
      00169E                       4051 abs:
      0094D4 81 0B DC         [ 4] 4052 	call func_args 
      0094D5 A1 01            [ 1] 4053 	cp a,#1 
      0094D5 CE AA            [ 1] 4054 	jreq 0$ 
      0094D7 80 A3 42         [ 2] 4055 	jp syntax_error
      0016A8                       4056 0$:  
      0094DA 43               [ 2] 4057     popw x   
      0094DB 81               [ 1] 4058 	ld a,xh 
      0094DC A5 80            [ 1] 4059 	bcp a,#0x80 
      0094DC CD 94            [ 1] 4060 	jreq 2$ 
      0094DE D5               [ 2] 4061 	negw x 
      0094DF 26 08            [ 1] 4062 2$: ld a,#TK_INTGR 
      0094E1 AE               [ 4] 4063 	ret 
                                   4064 
                                   4065 ;------------------------------
                                   4066 ; BASIC: AND(expr1,expr2)
                                   4067 ; Apply bit AND relation between
                                   4068 ; the 2 arguments, i.e expr1 & expr2 
                                   4069 ; output:
                                   4070 ; 	A 		TK_INTGR
                                   4071 ;   X 		result 
                                   4072 ;------------------------------
      0016B2                       4073 bit_and:
      0094E2 95 5B CD         [ 4] 4074 	call func_args 
      0094E5 A0 74            [ 1] 4075 	cp a,#2
      0094E7 20 71            [ 1] 4076 	jreq 1$
      0094E9 CC 07 39         [ 2] 4077 	jp syntax_error 
      0094E9 CE               [ 2] 4078 1$:	popw x 
      0094EA 00               [ 1] 4079 	ld a,xh 
      0094EB 1A C3            [ 1] 4080 	and a,(1,sp)
      0094ED 00               [ 1] 4081 	ld xh,a 
      0094EE 1C               [ 1] 4082 	ld a,xl
      0094EF 25 08            [ 1] 4083 	and a,(2,sp)
      0094F1 AE               [ 1] 4084 	ld xl,a 
      0016C5                       4085 	_drop 2 
      0094F2 95 9A            [ 2]    1     addw sp,#2 
      0094F4 CD A0            [ 1] 4086 	ld a,#TK_INTGR
      0094F6 74               [ 4] 4087 	ret
                                   4088 
                                   4089 ;------------------------------
                                   4090 ; BASIC: OR(expr1,expr2)
                                   4091 ; Apply bit OR relation between
                                   4092 ; the 2 arguments, i.e expr1 | expr2 
                                   4093 ; output:
                                   4094 ; 	A 		TK_INTGR
                                   4095 ;   X 		result 
                                   4096 ;------------------------------
      0016CA                       4097 bit_or:
      0094F7 20 61 DC         [ 4] 4098 	call func_args 
      0094F9 A1 02            [ 1] 4099 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0094F9 CD 81            [ 1] 4100 	jreq 1$
      0094FB F0 CD 81         [ 2] 4101 	jp syntax_error 
      0016D4                       4102 1$: 
      0094FE 7A               [ 2] 4103 	popw x 
      0094FF 72               [ 1] 4104 	ld a,xh 
      009500 5F 00            [ 1] 4105 	or a,(1,sp)
      009502 17               [ 1] 4106 	ld xh,a 
      009503 AE               [ 1] 4107 	ld a,xl 
      009504 AA 80            [ 1] 4108 	or a,(2,sp)
      009506 CF               [ 1] 4109 	ld xl,a 
      0016DD                       4110 	_drop 2 
      009507 00 18            [ 2]    1     addw sp,#2 
      009509 AE 42            [ 1] 4111 	ld a,#TK_INTGR 
      00950B 43               [ 4] 4112 	ret
                                   4113 
                                   4114 ;------------------------------
                                   4115 ; BASIC: XOR(expr1,expr2)
                                   4116 ; Apply bit XOR relation between
                                   4117 ; the 2 arguments, i.e expr1 ^ expr2 
                                   4118 ; output:
                                   4119 ; 	A 		TK_INTGR
                                   4120 ;   X 		result 
                                   4121 ;------------------------------
      0016E2                       4122 bit_xor:
      00950C CF 00 61         [ 4] 4123 	call func_args 
      00950F CE 00            [ 1] 4124 	cp a,#2
      009511 1C 72            [ 1] 4125 	jreq 1$
      009513 B0 00 1A         [ 2] 4126 	jp syntax_error 
      0016EC                       4127 1$: 
      009516 CF               [ 2] 4128 	popw x 
      009517 00               [ 1] 4129 	ld a,xh 
      009518 63 AE            [ 1] 4130 	xor a,(1,sp)
      00951A 00               [ 1] 4131 	ld xh,a 
      00951B 61               [ 1] 4132 	ld a,xl 
      00951C 1F 01            [ 1] 4133 	xor a,(2,sp)
      00951E 1E               [ 1] 4134 	ld xl,a 
      0016F5                       4135 	_drop 2 
      00951F 01 CD            [ 2]    1     addw sp,#2 
      009521 82 04            [ 1] 4136 	ld a,#TK_INTGR 
      009523 A6               [ 4] 4137 	ret 
                                   4138 
                                   4139 ;------------------------------
                                   4140 ; BASIC: LSHIFT(expr1,expr2)
                                   4141 ; logical shift left expr1 by 
                                   4142 ; expr2 bits 
                                   4143 ; output:
                                   4144 ; 	A 		TK_INTGR
                                   4145 ;   X 		result 
                                   4146 ;------------------------------
      0016FA                       4147 lshift:
      009524 2E CD 83         [ 4] 4148 	call func_args
      009527 41 1E            [ 1] 4149 	cp a,#2 
      009529 01 1C            [ 1] 4150 	jreq 1$
      00952B 00 80 1F         [ 2] 4151 	jp syntax_error
      00952E 01 C3            [ 2] 4152 1$: popw y   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009530 00               [ 2] 4153 	popw x 
      009531 1C 24            [ 2] 4154 	tnzw y 
      009533 08 AE            [ 1] 4155 	jreq 4$
      009535 00               [ 2] 4156 2$:	sllw x 
      009536 80 CD            [ 2] 4157 	decw y 
      009538 94 93            [ 1] 4158 	jrne 2$
      001710                       4159 4$:  
      00953A 20 E2            [ 1] 4160 	ld a,#TK_INTGR
      00953C 81               [ 4] 4161 	ret
                                   4162 
                                   4163 ;------------------------------
                                   4164 ; BASIC: RSHIFT(expr1,expr2)
                                   4165 ; logical shift right expr1 by 
                                   4166 ; expr2 bits.
                                   4167 ; output:
                                   4168 ; 	A 		TK_INTGR
                                   4169 ;   X 		result 
                                   4170 ;------------------------------
      001713                       4171 rshift:
      00953C 5B 02 AE         [ 4] 4172 	call func_args
      00953F 95 B0            [ 1] 4173 	cp a,#2 
      009541 CD A0            [ 1] 4174 	jreq 1$
      009543 74 CE 00         [ 2] 4175 	jp syntax_error
      009546 1C 72            [ 2] 4176 1$: popw y  
      009548 B0               [ 2] 4177 	popw x
      009549 00 1A            [ 2] 4178 	tnzw y 
      00954B CD 89            [ 1] 4179 	jreq 4$
      00954D 03               [ 2] 4180 2$:	srlw x 
      00954E AE 95            [ 2] 4181 	decw y 
      009550 BF CD            [ 1] 4182 	jrne 2$
      001729                       4183 4$:  
      009552 A0 74            [ 1] 4184 	ld a,#TK_INTGR
      009554 72               [ 4] 4185 	ret
                                   4186 
                                   4187 ;--------------------------
                                   4188 ; BASIC: FCPU integer
                                   4189 ; set CPU frequency 
                                   4190 ;-------------------------- 
                                   4191 
      00172C                       4192 fcpu:
      009555 0D 52            [ 1] 4193 	ld a,#TK_INTGR
      009557 30 FB 71         [ 4] 4194 	call expect 
      00955A 81               [ 1] 4195 	ld a,xl 
      00955B 43 61            [ 1] 4196 	and a,#7 
      00955D 6E 27 74         [ 1] 4197 	ld CLK_CKDIVR,a 
      009560 20               [ 4] 4198 	ret 
                                   4199 
                                   4200 ;------------------------------
                                   4201 ; BASIC: PMODE pin#, mode 
                                   4202 ; Arduino pin. 
                                   4203 ; define pin as input or output
                                   4204 ; pin#: {0..15}
                                   4205 ; mode: INPUT|OUTPUT  
                                   4206 ;------------------------------
                           000001  4207 	PINNO=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                           000001  4208 	VSIZE=1
      001738                       4209 pin_mode:
      001738                       4210 	_vars VSIZE 
      009561 66 6C            [ 2]    1     sub sp,#VSIZE 
      009563 61 73 68         [ 4] 4211 	call arg_list 
      009566 20 61            [ 1] 4212 	cp a,#2 
      009568 70 70            [ 1] 4213 	jreq 1$
      00956A 6C 69 63         [ 2] 4214 	jp syntax_error 
      00956D 61 74            [ 2] 4215 1$: popw y ; mode 
      00956F 69               [ 2] 4216 	popw x ; Dx pin 
      009570 6F 6E 2C         [ 4] 4217 	call select_pin 
      009573 20 61            [ 1] 4218 	ld (PINNO,sp),a  
      009575 6C 72            [ 1] 4219 	ld a,#1 
      009577 65 61            [ 1] 4220 	tnz (PINNO,sp)
      009579 64 79            [ 1] 4221 	jreq 4$
      00957B 20               [ 1] 4222 2$:	sll a 
      00957C 6F 6E            [ 1] 4223 	dec (PINNO,sp)
      00957E 65 20            [ 1] 4224 	jrne 2$ 
      009580 69 6E            [ 1] 4225 	ld (PINNO,sp),a
      009582 20 46            [ 1] 4226 	ld a,(PINNO,sp)
      009584 4C 41            [ 1] 4227 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009586 53 48            [ 1] 4228 	ld (GPIO_CR1,x),a 
      009588 0A 75 73 65      [ 2] 4229 4$:	cpw y,#OUTP 
      00958C 20 45            [ 1] 4230 	jreq 6$
                                   4231 ; input mode
                                   4232 ; disable external interrupt 
      00958E 52 41            [ 1] 4233 	ld a,(PINNO,sp)
      009590 53               [ 1] 4234 	cpl a 
      009591 45 20            [ 1] 4235 	and a,(GPIO_CR2,x)
      009593 62 65            [ 1] 4236 	ld (GPIO_CR2,x),a 
                                   4237 ;clear bit in DDR for input mode 
      009595 66 6F            [ 1] 4238 	ld a,(PINNO,sp)
      009597 72               [ 1] 4239 	cpl a 
      009598 65 00            [ 1] 4240 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00959A 4E 6F            [ 1] 4241 	ld (GPIO_DDR,x),a 
      00959C 20 61            [ 2] 4242 	jra 9$
      001775                       4243 6$: ;output mode  
      00959E 70 70            [ 1] 4244 	ld a,(PINNO,sp)
      0095A0 6C 69            [ 1] 4245 	or a,(GPIO_DDR,x) ; bit==1 for output 
      0095A2 63 61            [ 1] 4246 	ld (GPIO_DDR,x),a 
      0095A4 74 69            [ 1] 4247 	ld a,(PINNO,sp)
      0095A6 6F 6E            [ 1] 4248 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      0095A8 20 69            [ 1] 4249 	ld (GPIO_CR2,x),a 
      001781                       4250 9$:	
      001781                       4251 	_drop VSIZE 
      0095AA 6E 20            [ 2]    1     addw sp,#VSIZE 
      0095AC 52               [ 4] 4252 	ret
                                   4253 
                                   4254 ;------------------------
                                   4255 ; select Arduino pin 
                                   4256 ; input:
                                   4257 ;   X 	 {0..15} Arduino Dx 
                                   4258 ; output:
                                   4259 ;   A     stm8s208 pin 
                                   4260 ;   X     base address s208 GPIO port 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4261 ;---------------------------
      001784                       4262 select_pin:
      0095AD 41               [ 2] 4263 	sllw x 
      0095AE 4D 00 70         [ 2] 4264 	addw x,#arduino_to_8s208 
      0095B1 72               [ 2] 4265 	ldw x,(x)
      0095B2 6F               [ 1] 4266 	ld a,xl 
      0095B3 67               [ 1] 4267 	push a 
      0095B4 72               [ 1] 4268 	swapw x 
      0095B5 61 6D            [ 1] 4269 	ld a,#5 
      0095B7 20               [ 4] 4270 	mul x,a 
      0095B8 73 69 7A         [ 2] 4271 	addw x,#GPIO_BASE 
      0095BB 65               [ 1] 4272 	pop a 
      0095BC 3A               [ 4] 4273 	ret 
                                   4274 ; translation from Arduino D0..D15 to stm8s208rb 
      001794                       4275 arduino_to_8s208:
      0095BD 20 00                 4276 .byte 3,6 ; D0 
      0095BF 62 79                 4277 .byte 3,5 ; D1 
      0095C1 74 65                 4278 .byte 4,0 ; D2 
      0095C3 73 0A                 4279 .byte 2,1 ; D3
      0095C5 00 00                 4280 .byte 6,0 ; D4
      0095C6 02 02                 4281 .byte 2,2 ; D5
      0095C6 52 02                 4282 .byte 2,3 ; D6
      0095C8 72 5F                 4283 .byte 3,1 ; D7
      0095CA 00 17                 4284 .byte 3,3 ; D8
      0095CC CD 8D                 4285 .byte 2,4 ; D9
      0095CE 60 A1                 4286 .byte 4,5 ; D10
      0095D0 84 27                 4287 .byte 2,6 ; D11
      0095D2 03 CC                 4288 .byte 2,7 ; D12
      0095D4 87 B9                 4289 .byte 2,5 ; D13
      0095D6 1F 01                 4290 .byte 4,2 ; D14
      0095D8 CD 88                 4291 .byte 4,1 ; D15
                                   4292 
                                   4293 
                                   4294 ;------------------------------
                                   4295 ; BASIC: RND(expr)
                                   4296 ; return random number 
                                   4297 ; between 1 and expr inclusive
                                   4298 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4299 ; input:
                                   4300 ; 	none 
                                   4301 ; output:
                                   4302 ;	X 		random positive integer 
                                   4303 ;------------------------------
      0017B4                       4304 random:
      0095DA A8 A1 09         [ 4] 4305 	call func_args 
      0095DD 27 02            [ 1] 4306 	cp a,#1
      0095DF 20 19            [ 1] 4307 	jreq 1$
      0095E1 CD 8D 60         [ 2] 4308 	jp syntax_error
      0017BE                       4309 1$:  
      0095E4 A1 84            [ 1] 4310 	ld a,#0x80 
      0095E6 27 03            [ 1] 4311 	bcp a,(1,sp)
      0095E8 CC 87            [ 1] 4312 	jreq 2$
      0095EA B9 9F            [ 1] 4313 	ld a,#ERR_BAD_VALUE
      0095EC 1E 01 CF         [ 2] 4314 	jp tb_error
      0017C9                       4315 2$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4316 ; acc16=(x<<5)^x 
      0095EF 00 18 5F         [ 2] 4317 	ldw x,seedx 
      0095F2 CD               [ 2] 4318 	sllw x 
      0095F3 82               [ 2] 4319 	sllw x 
      0095F4 61               [ 2] 4320 	sllw x 
      0095F5 1E               [ 2] 4321 	sllw x 
      0095F6 01               [ 2] 4322 	sllw x 
      0095F7 5C               [ 1] 4323 	ld a,xh 
      0095F8 20 DC 12         [ 1] 4324 	xor a,seedx 
      0095FA C7 00 0C         [ 1] 4325 	ld acc16,a 
      0095FA 5B               [ 1] 4326 	ld a,xl 
      0095FB 02 81 13         [ 1] 4327 	xor a,seedx+1 
      0095FD C7 00 0D         [ 1] 4328 	ld acc8,a 
                                   4329 ; seedx=seedy 
      0095FD CD 8C 5C         [ 2] 4330 	ldw x,seedy 
      009600 A1 01 27         [ 2] 4331 	ldw seedx,x  
                                   4332 ; seedy=seedy^(seedy>>1)
      009603 03 CC            [ 2] 4333 	srlw y 
      009605 87 B9            [ 1] 4334 	ld a,yh 
      009607 85 9F A4         [ 1] 4335 	xor a,seedy 
      00960A 7F 97 A6         [ 1] 4336 	ld seedy,a  
      00960D 03 81            [ 1] 4337 	ld a,yl 
      00960F C8 00 15         [ 1] 4338 	xor a,seedy+1 
      00960F A6 07 CD         [ 1] 4339 	ld seedy+1,a 
                                   4340 ; acc16>>3 
      009612 8C 4F CD         [ 2] 4341 	ldw x,acc16 
      009615 88               [ 2] 4342 	srlw x 
      009616 A8               [ 2] 4343 	srlw x 
      009617 A1               [ 2] 4344 	srlw x 
                                   4345 ; x=acc16^x 
      009618 02               [ 1] 4346 	ld a,xh 
      009619 27 0E A1         [ 1] 4347 	xor a,acc16 
      00961C 03               [ 1] 4348 	ld xh,a 
      00961D 27               [ 1] 4349 	ld a,xl 
      00961E 0D A1 82         [ 1] 4350 	xor a,acc8 
      009621 27               [ 1] 4351 	ld xl,a 
                                   4352 ; seedy=x^seedy 
      009622 03 CC 87         [ 1] 4353 	xor a,seedy+1
      009625 B9               [ 1] 4354 	ld xl,a 
      009626 FD               [ 1] 4355 	ld a,xh 
      009627 20 03 14         [ 1] 4356 	xor a,seedy
      009629 95               [ 1] 4357 	ld xh,a 
      009629 F6 5F 97         [ 2] 4358 	ldw seedy,x 
                                   4359 ; return seedy modulo expr + 1 
      00962C 90 85            [ 2] 4360 	popw y 
      00962C 89               [ 2] 4361 	divw x,y 
      00962D A6               [ 1] 4362 	ldw x,y 
      00962E 08               [ 1] 4363 	incw x 
      001818                       4364 10$:
      00962F CD 8C            [ 1] 4365 	ld a,#TK_INTGR
      009631 4F               [ 4] 4366 	ret 
                                   4367 
                                   4368 ;---------------------------------
                                   4369 ; BASIC: WORDS 
                                   4370 ; affiche la listes des mots du
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4371 ; dictionnaire ainsi que le nombre
                                   4372 ; de mots.
                                   4373 ;---------------------------------
                           000001  4374 	WLEN=1 ; word length
                           000002  4375 	LLEN=2 ; character sent to console
                           000003  4376 	WCNT=3 ; count words printed 
                           000003  4377 	VSIZE=3 
      00181B                       4378 words:
      00181B                       4379 	_vars VSIZE
      009632 85 A6            [ 2]    1     sub sp,#VSIZE 
      009634 84 81            [ 1] 4380 	clr (LLEN,sp)
      009636 0F 03            [ 1] 4381 	clr (WCNT,sp)
      009636 CD 83 51 5F      [ 2] 4382 	ldw y,#kword_dict+2
      00963A 97               [ 1] 4383 0$:	ldw x,y
      00963B A6               [ 1] 4384 	ld a,(x)
      00963C 84 81            [ 1] 4385 	and a,#15 
      00963E 6B 01            [ 1] 4386 	ld (WLEN,sp),a 
      00963E 5F C6            [ 1] 4387 	inc (WCNT,sp)
      009640 00               [ 1] 4388 1$:	incw x 
      009641 2B               [ 1] 4389 	ld a,(x)
      009642 C1 00 2C         [ 4] 4390 	call putc 
      009645 27 01            [ 1] 4391 	inc (LLEN,sp)
      009647 53 A6            [ 1] 4392 	dec (WLEN,sp)
      009649 84 81            [ 1] 4393 	jrne 1$
      00964B A6 46            [ 1] 4394 	ld a,#70
      00964B CD 8C            [ 1] 4395 	cp a,(LLEN,sp)
      00964D 5C A1            [ 1] 4396 	jrmi 2$   
      00964F 02 27            [ 1] 4397 	ld a,#SPACE 
      009651 03 CC 87         [ 4] 4398 	call putc 
      009654 B9 02            [ 1] 4399 	inc (LLEN,sp) 
      009655 20 07            [ 2] 4400 	jra 3$
      009655 1E 03            [ 1] 4401 2$: ld a,#CR 
      009657 2B 17 A3         [ 4] 4402 	call putc 
      00965A 00 09            [ 1] 4403 	clr (LLEN,sp)
      00965C 2A 12 A6 05      [ 2] 4404 3$:	subw y,#2 
      009660 42 1C            [ 2] 4405 	ldw y,(y)
      009662 50 00            [ 1] 4406 	jrne 0$ 
      009664 1F 03            [ 1] 4407 	ld a,#CR 
      009666 1E 01 72         [ 4] 4408 	call putc  
      009669 FB               [ 1] 4409 	clrw x 
      00966A 03 A6            [ 1] 4410 	ld a,(WCNT,sp)
      00966C 84               [ 1] 4411 	ld xl,a 
      00966D 5B 04 81         [ 4] 4412 	call print_int 
      009670 AE 18 6B         [ 2] 4413 	ldw x,#words_count_msg
      009670 A6 0A CC         [ 4] 4414 	call puts 
      001868                       4415 	_drop VSIZE 
      009673 87 BB            [ 2]    1     addw sp,#VSIZE 
      009675 81               [ 4] 4416 	ret 
      009675 CE AA 80 A3 10 93 27  4417 words_count_msg: .asciz " words in dictionary\n"
             08 CE AA 82 1C AA 84
             20 03 AE AA 80 A6 84
             81
                                   4418 
                                   4419 
                                   4420 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4421 ; BASIC: TIMER expr 
                                   4422 ; initialize count down timer 
                                   4423 ;-----------------------------
      00968B                       4424 set_timer:
      00968B 90 89 CD         [ 4] 4425 	call arg_list
      00968E 8C 5C            [ 1] 4426 	cp a,#1 
      009690 A1 01            [ 1] 4427 	jreq 1$
      009692 27 07 A1         [ 2] 4428 	jp syntax_error
      00188B                       4429 1$: 
      009695 02               [ 2] 4430 	popw x 
      009696 27 03 CC         [ 2] 4431 	ldw timer,x 
      009699 87               [ 4] 4432 	ret 
                                   4433 
                                   4434 ;------------------------------
                                   4435 ; BASIC: TIMEOUT 
                                   4436 ; return state of timer 
                                   4437 ;------------------------------
      001890                       4438 timeout:
      00969A B9 90 85         [ 2] 4439 	ldw x,timer 
      001893                       4440 logical_complement:
      00969D A1               [ 2] 4441 	cplw x 
      00969E 01 27 02         [ 2] 4442 	cpw x,#-1
      0096A1 85 51            [ 1] 4443 	jreq 2$
      0096A3 90               [ 1] 4444 	clrw x 
      0096A4 FD 90            [ 1] 4445 2$:	ld a,#TK_INTGR
      0096A6 85               [ 4] 4446 	ret 
                                   4447 
                                   4448 ;--------------------------------
                                   4449 ; BASIC NOT(expr) 
                                   4450 ; return logical complement of expr
                                   4451 ;--------------------------------
      00189D                       4452 func_not:
      0096A7 81 0B DC         [ 4] 4453 	call func_args  
      0096A8 A1 01            [ 1] 4454 	cp a,#1
      0096A8 72 0D            [ 1] 4455 	jreq 1$
      0096AA 52 30 FB         [ 2] 4456 	jp syntax_error
      0096AD 8E               [ 2] 4457 1$:	popw x 
      0096AE CC 84            [ 2] 4458 	jra logical_complement
                                   4459 
                                   4460 
                                   4461 
                                   4462 ;-----------------------------------
                                   4463 ; BASIC: IWDGEN expr1 
                                   4464 ; enable independant watchdog timer
                                   4465 ; expr1 is delay in multiple of 62.5µsec
                                   4466 ; expr1 -> {1..16383}
                                   4467 ;-----------------------------------
      0018AA                       4468 enable_iwdg:
      0096B0 FE 0B E1         [ 4] 4469 	call arg_list
      0096B1 A1 01            [ 1] 4470 	cp a,#1 
      0096B1 72 0D            [ 1] 4471 	jreq 1$
      0096B3 52 30 FB         [ 2] 4472 	jp syntax_error 
      0096B6 72               [ 2] 4473 1$: popw x 
      0096B7 16 00            [ 1] 4474 	push #0
      0096B9 21 8E 81 E0      [ 1] 4475 	mov IWDG_KR,#IWDG_KEY_ENABLE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0096BC 9E               [ 1] 4476 	ld a,xh 
      0096BC CD 8D            [ 1] 4477 	and a,#0x3f
      0096BE 60               [ 1] 4478 	ld xh,a  
      0096BF A1 84 27         [ 2] 4479 2$:	cpw x,#255
      0096C2 03 CC            [ 2] 4480 	jrule 3$
      0096C4 87 B9            [ 1] 4481 	inc (1,sp)
      0096C6 98               [ 1] 4482 	rcf 
      0096C6 5D               [ 2] 4483 	rrcw x 
      0096C7 27 04            [ 2] 4484 	jra 2$
      0096C9 8F 5A 26 F9      [ 1] 4485 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      0096CD 4F               [ 1] 4486 	pop a  
      0096CE 81 50 E1         [ 1] 4487 	ld IWDG_PR,a 
      0096CF 9F               [ 1] 4488 	ld a,xl
      0096CF CD               [ 1] 4489 	dec a 
      0096D0 8D 60 A1 84      [ 1] 4490 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      0096D4 27 03 CC         [ 1] 4491 	ld IWDG_RLR,a 
      0096D7 87 B9 50 E0      [ 1] 4492 	mov IWDG_KR,#IWDG_KEY_REFRESH
      0096D9 81               [ 4] 4493 	ret 
                                   4494 
                                   4495 
                                   4496 ;-----------------------------------
                                   4497 ; BASIC: IWDGREF  
                                   4498 ; refresh independant watchdog count down 
                                   4499 ; timer before it reset MCU. 
                                   4500 ;-----------------------------------
      0018E0                       4501 refresh_iwdg:
      0096D9 A3 14 00 2B      [ 1] 4502 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      0096DD 0C               [ 4] 4503 	ret 
                                   4504 
                                   4505 
                                   4506 ;-------------------------------------
                                   4507 ; BASIC: LOG(expr)
                                   4508 ; return logarithm base 2 of expr 
                                   4509 ; this is the position of most significant
                                   4510 ; bit set. 
                                   4511 ; input: 
                                   4512 ; output:
                                   4513 ;   X     log2 
                                   4514 ;   A     TK_INTGR 
                                   4515 ;*********************************
      0018E5                       4516 log2:
      0096DE 35 0F 50         [ 4] 4517 	call func_args 
      0096E1 F2 A6            [ 1] 4518 	cp a,#1 
      0096E3 1E 62            [ 1] 4519 	jreq 1$
      0096E5 A6 10 62         [ 2] 4520 	jp syntax_error 
      0096E8 20               [ 2] 4521 1$: popw x 
      0018F0                       4522 leading_one:
      0096E9 1E               [ 2] 4523 	tnzw x 
      0096EA 27 0A            [ 1] 4524 	jreq 4$
      0096EA A3 08            [ 1] 4525 	ld a,#15 
      0096EC 00               [ 2] 4526 2$: rlcw x 
      0096ED 2B 09            [ 1] 4527     jrc 3$
      0096EF 35               [ 1] 4528 	dec a 
      0096F0 0E 50            [ 2] 4529 	jra 2$
      0096F2 F2               [ 1] 4530 3$: clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0096F3 A6               [ 1] 4531     ld xl,a
      0096F4 50 62            [ 1] 4532 4$:	ld a,#TK_INTGR
      0096F6 20               [ 4] 4533 	ret 
                                   4534 
                                   4535 ;-----------------------------------
                                   4536 ; BASIC: BIT(expr) 
                                   4537 ; expr ->{0..15}
                                   4538 ; return 2^expr 
                                   4539 ; output:
                                   4540 ;    x    2^expr 
                                   4541 ;-----------------------------------
      001900                       4542 bitmask:
      0096F7 10 0B DC         [ 4] 4543     call func_args 
      0096F8 A1 01            [ 1] 4544 	cp a,#1
      0096F8 35 07            [ 1] 4545 	jreq 1$
      0096FA 50 F2 39         [ 2] 4546 	jp syntax_error 
      0096FC 85               [ 2] 4547 1$: popw x 
      0096FC A3               [ 1] 4548 	ld a,xl 
      0096FD 00 40            [ 1] 4549 	and a,#15
      0096FF 23               [ 1] 4550 	clrw x 
      009700 07               [ 1] 4551 	incw x 
      009701 72               [ 1] 4552 2$: tnz a 
      009702 5C 50            [ 1] 4553 	jreq 3$
      009704 F2               [ 2] 4554 	slaw x 
      009705 54               [ 1] 4555 	dec a 
      009706 20 F4            [ 2] 4556 	jra 2$ 
      009708 A6 84            [ 1] 4557 3$: ld a,#TK_INTGR
      009708 9F               [ 4] 4558 	ret 
                                   4559 
                                   4560 ;------------------------------
                                   4561 ; BASIC: INVERT(expr)
                                   4562 ; 1's complement 
                                   4563 ;--------------------------------
      00191A                       4564 invert:
      009709 4A 27 01         [ 4] 4565 	call func_args
      00970C 4A 01            [ 1] 4566 	cp a,#1 
      00970D 27 03            [ 1] 4567 	jreq 1$
      00970D A4 3E C7         [ 2] 4568 	jp syntax_error
      009710 50               [ 2] 4569 1$: popw x  
      009711 F1               [ 2] 4570 	cplw x 
      009712 72 18            [ 1] 4571 	ld a,#TK_INTGR 
      009714 50               [ 4] 4572 	ret 
                                   4573 
                                   4574 ;------------------------------
                                   4575 ; BASIC: DO 
                                   4576 ; initiate a DO ... UNTIL loop 
                                   4577 ;------------------------------
                           000003  4578 	DOLP_ADR=3 
                           000005  4579 	DOLP_INW=5
                           000004  4580 	VSIZE=4 
      001929                       4581 do_loop:
      009715 F0               [ 2] 4582 	popw x 
      00192A                       4583 	_vars VSIZE 
      009716 8E 81            [ 2]    1     sub sp,#VSIZE 
      009718 89               [ 2] 4584 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009718 CE 00 0F A6      [ 2] 4585 	ldw y,basicptr 
      00971C 84 81            [ 2] 4586 	ldw (DOLP_ADR,sp),y
      00971E 90 CE 00 00      [ 2] 4587 	ldw y,in.w 
      00971E CD 8C            [ 2] 4588 	ldw (DOLP_INW,sp),y
      009720 5C A1 01 27      [ 1] 4589 	inc loop_depth 
      009724 03               [ 4] 4590 	ret 
                                   4591 
                                   4592 ;--------------------------------
                                   4593 ; BASIC: UNTIL expr 
                                   4594 ; loop if exprssion is false 
                                   4595 ; else terminate loop
                                   4596 ;--------------------------------
      00193E                       4597 until: 
      009725 CC 87 B9 1D      [ 1] 4598 	tnz loop_depth 
      009728 26 03            [ 1] 4599 	jrne 1$ 
      009728 85 9E A5         [ 2] 4600 	jp syntax_error 
      001947                       4601 1$: 
      00972B 80 27 01         [ 4] 4602 	call relation 
      00972E 50 A6            [ 1] 4603 	cp a,#TK_INTGR
      009730 84 81            [ 1] 4604 	jreq 2$
      009732 CC 07 39         [ 2] 4605 	jp syntax_error
      001951                       4606 2$: 
      009732 CD               [ 2] 4607 	tnzw x 
      009733 8C 5C            [ 1] 4608 	jrne 9$
      009735 A1 02            [ 2] 4609 	ldw x,(DOLP_ADR,sp)
      009737 27 03 CC         [ 2] 4610 	ldw basicptr,x 
      00973A 87 B9            [ 1] 4611 	ld a,(2,x)
      00973C 85 9E 14         [ 1] 4612 	ld count,a 
      00973F 01 95            [ 2] 4613 	ldw x,(DOLP_INW,sp)
      009741 9F 14 02         [ 2] 4614 	ldw in.w,x 
      009744 97               [ 4] 4615 	ret 
      001964                       4616 9$:	; remove loop data from stack  
      009745 5B               [ 2] 4617 	popw x
      001965                       4618 	_drop VSIZE
      009746 02 A6            [ 2]    1     addw sp,#VSIZE 
      009748 84 81 00 1D      [ 1] 4619 	dec loop_depth 
      00974A FC               [ 2] 4620 	jp (x)
                                   4621 
                                   4622 ;--------------------------
                                   4623 ; BASIC: PRTA...PRTI  
                                   4624 ;  return constant value 
                                   4625 ;  PORT  offset in GPIO
                                   4626 ;  array
                                   4627 ;---------------------------
      00196C                       4628 const_porta:
      00974A CD 8C 5C         [ 2] 4629 	ldw x,#0
      00974D A1 02            [ 1] 4630 	ld a,#TK_INTGR 
      00974F 27               [ 4] 4631 	ret 
      001972                       4632 const_portb:
      009750 03 CC 87         [ 2] 4633 	ldw x,#1
      009753 B9 84            [ 1] 4634 	ld a,#TK_INTGR 
      009754 81               [ 4] 4635 	ret 
      001978                       4636 const_portc:
      009754 85 9E 1A         [ 2] 4637 	ldw x,#2
      009757 01 95            [ 1] 4638 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009759 9F               [ 4] 4639 	ret 
      00197E                       4640 const_portd:
      00975A 1A 02 97         [ 2] 4641 	ldw x,#3
      00975D 5B 02            [ 1] 4642 	ld a,#TK_INTGR 
      00975F A6               [ 4] 4643 	ret 
      001984                       4644 const_porte:
      009760 84 81 04         [ 2] 4645 	ldw x,#4
      009762 A6 84            [ 1] 4646 	ld a,#TK_INTGR 
      009762 CD               [ 4] 4647 	ret 
      00198A                       4648 const_portf:
      009763 8C 5C A1         [ 2] 4649 	ldw x,#5
      009766 02 27            [ 1] 4650 	ld a,#TK_INTGR 
      009768 03               [ 4] 4651 	ret 
      001990                       4652 const_portg:
      009769 CC 87 B9         [ 2] 4653 	ldw x,#6
      00976C A6 84            [ 1] 4654 	ld a,#TK_INTGR 
      00976C 85               [ 4] 4655 	ret 
      001996                       4656 const_porth:
      00976D 9E 18 01         [ 2] 4657 	ldw x,#7
      009770 95 9F            [ 1] 4658 	ld a,#TK_INTGR 
      009772 18               [ 4] 4659 	ret 
      00199C                       4660 const_porti:
      009773 02 97 5B         [ 2] 4661 	ldw x,#8
      009776 02 A6            [ 1] 4662 	ld a,#TK_INTGR 
      009778 84               [ 4] 4663 	ret 
                                   4664 
                                   4665 ;-------------------------------
                                   4666 ; following return constant 
                                   4667 ; related to GPIO register offset 
                                   4668 ;---------------------------------
      0019A2                       4669 const_odr:
      009779 81 84            [ 1] 4670 	ld a,#TK_INTGR 
      00977A AE 00 00         [ 2] 4671 	ldw x,#GPIO_ODR
      00977A CD               [ 4] 4672 	ret 
      0019A8                       4673 const_idr:
      00977B 8C 5C            [ 1] 4674 	ld a,#TK_INTGR 
      00977D A1 02 27         [ 2] 4675 	ldw x,#GPIO_IDR
      009780 03               [ 4] 4676 	ret 
      0019AE                       4677 const_ddr:
      009781 CC 87            [ 1] 4678 	ld a,#TK_INTGR 
      009783 B9 90 85         [ 2] 4679 	ldw x,#GPIO_DDR
      009786 85               [ 4] 4680 	ret 
      0019B4                       4681 const_cr1:
      009787 90 5D            [ 1] 4682 	ld a,#TK_INTGR 
      009789 27 05 58         [ 2] 4683 	ldw x,#GPIO_CR1
      00978C 90               [ 4] 4684 	ret 
      0019BA                       4685 const_cr2:
      00978D 5A 26            [ 1] 4686 	ld a,#TK_INTGR 
      00978F FB 00 04         [ 2] 4687 	ldw x,#GPIO_CR2
      009790 81               [ 4] 4688 	ret 
                                   4689 ;-------------------------
                                   4690 ; BASIC: POUT 
                                   4691 ;  constant for port mode
                                   4692 ;  used by PMODE 
                                   4693 ;  to set pin as output
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4694 ;------------------------
      0019C0                       4695 const_output:
      009790 A6 84            [ 1] 4696 	ld a,#TK_INTGR 
      009792 81 00 01         [ 2] 4697 	ldw x,#OUTP
      009793 81               [ 4] 4698 	ret 
                                   4699 
                                   4700 ;-------------------------
                                   4701 ; BASIC: PINP 
                                   4702 ;  constant for port mode
                                   4703 ;  used by PMODE 
                                   4704 ;  to set pin as input
                                   4705 ;------------------------
      0019C6                       4706 const_input:
      009793 CD 8C            [ 1] 4707 	ld a,#TK_INTGR 
      009795 5C A1 02         [ 2] 4708 	ldw x,#INP 
      009798 27               [ 4] 4709 	ret 
                                   4710 	
                                   4711 ;-----------------------
                                   4712 ; memory area constants
                                   4713 ;-----------------------
      0019CC                       4714 const_eeprom_base:
      009799 03 CC            [ 1] 4715 	ld a,#TK_INTGR 
      00979B 87 B9 90         [ 2] 4716 	ldw x,#EEPROM_BASE 
      00979E 85               [ 4] 4717 	ret 
                                   4718 
                                   4719 ;---------------------------
                                   4720 ; BASIC: DATA 
                                   4721 ; when the interpreter find 
                                   4722 ; a DATA line it skip it.
                                   4723 ;---------------------------
      0019D2                       4724 data:
      00979F 85 90 5D 27 05   [ 1] 4725 	mov in,count 
      0097A4 54               [ 4] 4726 	ret 
                                   4727 
                                   4728 ;---------------------------
                                   4729 ; BASIC: DATLN  *expr*
                                   4730 ; set DATA pointer at line# 
                                   4731 ; specified by *expr* 
                                   4732 ;---------------------------
      0019D8                       4733 data_line:
      0097A5 90 5A 26         [ 4] 4734 	call expression
      0097A8 FB 84            [ 1] 4735 	cp a,#TK_INTGR
      0097A9 27 03            [ 1] 4736 	jreq 1$
      0097A9 A6 84 81         [ 2] 4737 	jp syntax_error  
      0097AC 4F               [ 1] 4738 1$: clr a 
      0097AC A6 84 CD         [ 4] 4739 	call search_lineno
      0097AF 8C               [ 2] 4740 	tnzw x 
      0097B0 4F 9F            [ 1] 4741 	jrne 3$
      0097B2 A4 07            [ 1] 4742 2$:	ld a,#ERR_NO_LINE 
      0097B4 C7 50 C6         [ 2] 4743 	jp tb_error
      0019EE                       4744 3$: ; check if valid data line 
      0097B7 81 93            [ 1] 4745     ldw y,x 
      0097B8 EE 04            [ 2] 4746 	ldw x,(4,x)
      0097B8 52 01 CD         [ 2] 4747 	cpw x,#data 
      0097BB 8C 61            [ 1] 4748 	jrne 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0097BD A1 02 27 03      [ 2] 4749 	ldw data_ptr,y
      0097C1 CC 87 B9         [ 1] 4750 	ld a,(2,y)
      0097C4 90 85 85         [ 1] 4751 	ld data_len,a 
      0097C7 CD 98 04 6B      [ 1] 4752 	mov data_ofs,#FIRST_DATA_ITEM 
      0097CB 01               [ 4] 4753 	ret
                                   4754 
                                   4755 ;---------------------------------
                                   4756 ; BASIC: RESTORE 
                                   4757 ; set data_ptr to first data line
                                   4758 ; if not DATA found pointer set to
                                   4759 ; zero 
                                   4760 ;---------------------------------
      001A06                       4761 restore:
      0097CC A6 01 0D 01      [ 1] 4762 	clr data_ptr 
      0097D0 27 0D 48 0A      [ 1] 4763 	clr data_ptr+1
      0097D4 01 26 FB 6B      [ 1] 4764 	clr data_ofs 
      0097D8 01 7B 01 EA      [ 1] 4765 	clr data_len
      0097DC 03 E7 03         [ 2] 4766 	ldw x,txtbgn
      001A19                       4767 data_search_loop: 	
      0097DF 90 A3 00         [ 2] 4768 	cpw x,txtend
      0097E2 01 27            [ 1] 4769 	jruge 9$
      0097E4 10 7B            [ 1] 4770 	ldw y,x 
      0097E6 01 43            [ 2] 4771 	ldw x,(4,x)
      0097E8 E4 04 E7         [ 2] 4772 	addw x,#code_addr
      0097EB 04               [ 2] 4773 	ldw x,(x)
      0097EC 7B 01 43         [ 2] 4774 	cpw x,#data 
      0097EF E4 02            [ 1] 4775 	jrne try_next_line 
      0097F1 E7 02 20 0C      [ 2] 4776 	ldw data_ptr,y 
      0097F5 90 E6 02         [ 1] 4777 	ld a,(2,y)
      0097F5 7B 01 EA         [ 1] 4778 	ld data_len,a 
      0097F8 02 E7 02 7B      [ 1] 4779 	mov data_ofs,#FIRST_DATA_ITEM
      0097FC 01 EA 04 E7      [ 1] 4780 9$:	tnz data_len 
      009800 04 05            [ 1] 4781     jrne 10$
      009801 A6 0C            [ 1] 4782 	ld a,#ERR_NO_DATA 
      009801 5B 01 81         [ 2] 4783 	jp tb_error 
      009804 81               [ 4] 4784 10$:ret
      001A45                       4785 try_next_line:
      009804 58               [ 1] 4786 	ldw x,y 
      009805 1C 98            [ 1] 4787 	ld a,(2,x)
      009807 14 FE 9F         [ 1] 4788 	ld acc8,a 
      00980A 88 5E A6 05      [ 1] 4789 	clr acc16 
      00980E 42 1C 50 00      [ 2] 4790 	addw x,acc16 
      009812 84 81            [ 2] 4791 	jra data_search_loop
                                   4792 
                                   4793 
                                   4794 ;---------------------------------
                                   4795 ; BASIC: READ 
                                   4796 ; return next data item | 0 
                                   4797 ;---------------------------------
                           000001  4798 	CTX_BPTR=1 
                           000003  4799 	CTX_IN=3 
                           000004  4800 	CTX_COUNT=4 
                           000005  4801 	XSAVE=5
                           000006  4802 	VSIZE=6
      009814                       4803 read:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      001A55                       4804 	_vars  VSIZE 
      009814 03 06            [ 2]    1     sub sp,#VSIZE 
      001A57                       4805 read01:	
      009816 03 05 04         [ 1] 4806 	ld a,data_ofs
      009819 00 02 01         [ 1] 4807 	cp a,data_len 
      00981C 06 00            [ 1] 4808 	jreq 2$ ; end of line  
      00981E 02 02 02         [ 4] 4809 	call save_context
      009821 03 03 01         [ 2] 4810 	ldw x,data_ptr 
      009824 03 03 02         [ 2] 4811 	ldw basicptr,x 
      009827 04 04 05 02 06   [ 1] 4812 	mov in,data_ofs 
      00982C 02 07 02 05 04   [ 1] 4813 	mov count,data_len  
      009831 02 04 01         [ 4] 4814 	call expression 
      009834 A1 84            [ 1] 4815 	cp a,#TK_INTGR 
      009834 CD 8C            [ 1] 4816 	jreq 1$ 
      009836 5C A1 01         [ 2] 4817 	jp syntax_error 
      001A7C                       4818 1$:
      009839 27 03            [ 2] 4819 	ldw (XSAVE,SP),x
      00983B CC 87 B9         [ 4] 4820 	call next_token ; skip comma
      00983E CE 00 04         [ 2] 4821 	ldw x,basicptr 
      00983E A6 80 15         [ 2] 4822 	ldw data_ptr,x 
      009841 01 27 05 A6 0A   [ 1] 4823 	mov data_ofs,in 
      009846 CC 87 BB         [ 4] 4824 	call rest_context
      009849 1E 05            [ 2] 4825 	ldw x,(XSAVE,sp)
      009849 CE 00            [ 1] 4826 	ld a,#TK_INTGR
      001A93                       4827 	_drop VSIZE 
      00984B 13 58            [ 2]    1     addw sp,#VSIZE 
      00984D 58               [ 4] 4828 	ret 
      001A96                       4829 2$: ; end of line reached 
      00984E 58 58 58 9E      [ 2] 4830 	ldw y, data_ptr 
      009852 C8 00 13 C7      [ 1] 4831 	clr data_ptr
      009856 00 0D 9F C8      [ 1] 4832 	clr data_ptr+1   
      00985A 00 14 C7 00      [ 1] 4833 	clr data_ofs 
      00985E 0E CE 00 15      [ 1] 4834 	clr data_len 
      009862 CF 00 13         [ 4] 4835 	call try_next_line 
      009865 90 54            [ 2] 4836 	jra read01
                                   4837 
                                   4838 
                                   4839 ;---------------------------------
                                   4840 ; BASIC: SPIEN clkdiv, 0|1  
                                   4841 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4842 ; if clkdiv==-1 disable SPI
                                   4843 ; 0|1 -> disable|enable  
                                   4844 ;--------------------------------- 
                           000005  4845 SPI_CS_BIT=5
      001AAF                       4846 spi_enable:
      009867 90 9E C8         [ 4] 4847 	call arg_list 
      00986A 00 15            [ 1] 4848 	cp a,#2
      00986C C7 00            [ 1] 4849 	jreq 1$
      00986E 15 90 9F         [ 2] 4850 	jp syntax_error 
      001AB9                       4851 1$: 
      009871 C8 00 16 C7      [ 1] 4852 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009875 00               [ 2] 4853 	popw x  
      009876 16               [ 2] 4854 	tnzw x 
      009877 CE 00            [ 1] 4855 	jreq spi_disable 
      009879 0D               [ 2] 4856 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      00987A 54 54            [ 1] 4857 	ld a,#(1<<SPI_CR1_BR)
      00987C 54               [ 4] 4858 	mul x,a 
      00987D 9E               [ 1] 4859 	ld a,xl 
      00987E C8 00 0D         [ 1] 4860 	ld SPI_CR1,a 
                                   4861 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009881 95 9F C8 00      [ 1] 4862 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009885 0E 97 C8 00      [ 1] 4863 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4864 ; configure SPI as master mode 0.	
      009889 16 97 9E C8      [ 1] 4865 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4866 ; ~CS line controlled by sofware 	
      00988D 00 15 95 CF      [ 1] 4867 	bset SPI_CR2,#SPI_CR2_SSM 
      009891 00 15 90 85      [ 1] 4868     bset SPI_CR2,#SPI_CR2_SSI 
                                   4869 ; enable SPI
      009895 65 93 5C 00      [ 1] 4870 	bset SPI_CR1,#SPI_CR1_SPE 	
      009898 81               [ 4] 4871 	ret 
      001AE2                       4872 spi_disable:
      001AE2                       4873 	_drop #2; throw first argument.
      009898 A6 84            [ 2]    1     addw sp,##2 
                                   4874 ; wait spi idle 
      00989A 81 82            [ 1] 4875 1$:	ld a,#0x82 
      00989B C4 52 03         [ 1] 4876 	and a,SPI_SR
      00989B 52 03            [ 1] 4877 	cp a,#2 
      00989D 0F 02            [ 1] 4878 	jrne 1$
      00989F 0F 03 90 AE      [ 1] 4879 	bres SPI_CR1,#SPI_CR1_SPE
      0098A3 9F 76 93 F6      [ 1] 4880 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      0098A7 A4 0F 6B 01      [ 1] 4881 	bres PE_DDR,#SPI_CS_BIT 
      0098AB 0C               [ 4] 4882 	ret 
                                   4883 
      001AFA                       4884 spi_clear_error:
      0098AC 03 5C            [ 1] 4885 	ld a,#0x78 
      0098AE F6 CD 83         [ 1] 4886 	bcp a,SPI_SR 
      0098B1 41 0C            [ 1] 4887 	jreq 1$
      0098B3 02 0A 01 26      [ 1] 4888 	clr SPI_SR 
      0098B7 F5               [ 4] 4889 1$: ret 
                                   4890 
      001B06                       4891 spi_send_byte:
      0098B8 A6               [ 1] 4892 	push a 
      0098B9 46 11 02         [ 4] 4893 	call spi_clear_error
      0098BC 2B               [ 1] 4894 	pop a 
      0098BD 09 A6 20 CD 83   [ 2] 4895 	btjf SPI_SR,#SPI_SR_TXE,.
      0098C2 41 0C 02         [ 1] 4896 	ld SPI_DR,a
      0098C5 20 07 A6 0D CD   [ 2] 4897 	btjf SPI_SR,#SPI_SR_RXNE,.  
      0098CA 83 41 0F         [ 1] 4898 	ld a,SPI_DR 
      0098CD 02               [ 4] 4899 	ret 
                                   4900 
      001B1C                       4901 spi_rcv_byte:
      0098CE 72 A2            [ 1] 4902 	ld a,#255
      0098D0 00 02 90 FE 26   [ 2] 4903 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      0098D5 CF A6 0D         [ 1] 4904 	ld a,SPI_DR 
      0098D8 CD               [ 4] 4905 	ret
                                   4906 
                                   4907 ;------------------------------
                                   4908 ; BASIC: SPIWR byte [,byte]
                                   4909 ; write 1 or more byte
                                   4910 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      001B27                       4911 spi_write:
      0098D9 83 41 5F         [ 4] 4912 	call expression
      0098DC 7B 03            [ 1] 4913 	cp a,#TK_INTGR 
      0098DE 97 CD            [ 1] 4914 	jreq 1$
      0098E0 89 03 AE         [ 2] 4915 	jp syntax_error 
      001B31                       4916 1$:	
      0098E3 98               [ 1] 4917 	ld a,xl 
      0098E4 EB CD A0         [ 4] 4918 	call spi_send_byte 
      0098E7 74 5B 03         [ 4] 4919 	call next_token 
      0098EA 81 20            [ 1] 4920 	cp a,#TK_COMMA 
      0098EC 77 6F            [ 1] 4921 	jrne 2$ 
      0098EE 72 64            [ 2] 4922 	jra spi_write 
      0098F0 73               [ 1] 4923 2$:	tnz a 
      0098F1 20 69            [ 1] 4924 	jreq 3$
      001B41                       4925 	_unget_token  
      0098F3 6E 20 64 69 63   [ 1]    1      mov in,in.saved  
      0098F8 74               [ 4] 4926 3$:	ret 
                                   4927 
                                   4928 
                                   4929 ;-------------------------------
                                   4930 ; BASIC: SPIRD 	
                                   4931 ; read one byte from SPI 
                                   4932 ;-------------------------------
      001B47                       4933 spi_read:
      0098F9 69 6F 6E         [ 4] 4934 	call spi_rcv_byte 
      0098FC 61               [ 1] 4935 	clrw x 
      0098FD 72               [ 1] 4936 	ld xl,a 
      0098FE 79 0A            [ 1] 4937 	ld a,#TK_INTGR 
      009900 00               [ 4] 4938 	ret 
                                   4939 
                                   4940 ;------------------------------
                                   4941 ; BASIC: SPISEL 0|1 
                                   4942 ; set state of ~CS line
                                   4943 ; 0|1 deselect|select  
                                   4944 ;------------------------------
      009901                       4945 spi_select:
      009901 CD 8C 61         [ 4] 4946 	call next_token 
      009904 A1 01            [ 1] 4947 	cp a,#TK_INTGR 
      009906 27 03            [ 1] 4948 	jreq 1$
      009908 CC 87 B9         [ 2] 4949 	jp syntax_error 
      00990B 5D               [ 2] 4950 1$: tnzw x  
      00990B 85 CF            [ 1] 4951 	jreq cs_high 
      00990D 00 11 81 14      [ 1] 4952 	bres PE_ODR,#SPI_CS_BIT
      009910 81               [ 4] 4953 	ret 
      001B61                       4954 cs_high: 
      009910 CE 00 11 14      [ 1] 4955 	bset PE_ODR,#SPI_CS_BIT
      009913 81               [ 4] 4956 	ret 
                                   4957 
                                   4958 ;-------------------------------
                                   4959 ; BASIC: PAD 
                                   4960 ; Return pad buffer address.
                                   4961 ;------------------------------
      001B66                       4962 pad_ref:
      009913 53 A3 FF         [ 2] 4963 	ldw x,#pad 
      009916 FF 27            [ 1] 4964 	ld a,TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009918 01               [ 4] 4965 	ret 
                                   4966 
                                   4967 
                                   4968 ;------------------------------
                                   4969 ;      dictionary 
                                   4970 ; format:
                                   4971 ;   link:   2 bytes 
                                   4972 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4973 ;   cmd_name: 16 byte max 
                                   4974 ;   cmd_index: 2 bytes 
                                   4975 ;------------------------------
                                   4976 	.macro _dict_entry len,name,cmd_idx 
                                   4977 	.word LINK 
                                   4978 	LINK=.
                                   4979 name:
                                   4980 	.byte len 	
                                   4981 	.ascii "name"
                                   4982 	.word cmd_idx 
                                   4983 	.endm 
                                   4984 
                           000000  4985 	LINK=0
                                   4986 ; respect alphabetic order for BASIC names from Z-A
                                   4987 ; this sort order is for a cleaner WORDS cmd output. 	
      001B6C                       4988 kword_end:
      001B6C                       4989 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      009919 5F A6                    1 	.word LINK 
                           001B6E     2 	LINK=.
      001B6E                          3 XOR:
      00991B 84                       4 	.byte 3+F_IFUNC 	
      00991C 81 4F 52                 5 	.ascii "XOR"
      00991D 00 C2                    6 	.word XOR_IDX 
      001B74                       4990 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00991D CD 8C                    1 	.word LINK 
                           001B76     2 	LINK=.
      001B76                          3 WRITE:
      00991F 5C                       4 	.byte 5 	
      009920 A1 01 27 03 CC           5 	.ascii "WRITE"
      009925 87 B9                    6 	.word WRITE_IDX 
      001B7E                       4991 	_dict_entry,5,WORDS,WORDS_IDX;words 
      009927 85 20                    1 	.word LINK 
                           001B80     2 	LINK=.
      001B80                          3 WORDS:
      009929 E9                       4 	.byte 5 	
      00992A 57 4F 52 44 53           5 	.ascii "WORDS"
      00992A CD 8C                    6 	.word WORDS_IDX 
      001B88                       4992 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00992C 61 A1                    1 	.word LINK 
                           001B8A     2 	LINK=.
      001B8A                          3 WAIT:
      00992E 01                       4 	.byte 4 	
      00992F 27 03 CC 87              5 	.ascii "WAIT"
      009933 B9 85                    6 	.word WAIT_IDX 
      001B91                       4993 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      009935 4B 00                    1 	.word LINK 
                           001B93     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      001B93                          3 USR:
      009937 35                       4 	.byte 3+F_IFUNC 	
      009938 CC 50 E0                 5 	.ascii "USR"
      00993B 9E A4                    6 	.word USR_IDX 
      001B99                       4994 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00993D 3F 95                    1 	.word LINK 
                           001B9B     2 	LINK=.
      001B9B                          3 UNTIL:
      00993F A3                       4 	.byte 5 	
      009940 00 FF 23 06 0C           5 	.ascii "UNTIL"
      009945 01 98                    6 	.word UNTIL_IDX 
      001BA3                       4995 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      009947 56 20                    1 	.word LINK 
                           001BA5     2 	LINK=.
      001BA5                          3 UFLASH:
      009949 F5                       4 	.byte 6+F_IFUNC 	
      00994A 35 55 50 E0 84 C7        5 	.ascii "UFLASH"
      009950 50 E1                    6 	.word UFLASH_IDX 
      001BAE                       4996 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      009952 9F 4A                    1 	.word LINK 
                           001BB0     2 	LINK=.
      001BB0                          3 UBOUND:
      009954 35                       4 	.byte 6+F_IFUNC 	
      009955 55 50 E0 C7 50 E2        5 	.ascii "UBOUND"
      00995B 35 AA                    6 	.word UBOUND_IDX 
      001BB9                       4997 	_dict_entry,4,TONE,TONE_IDX;tone  
      00995D 50 E0                    1 	.word LINK 
                           001BBB     2 	LINK=.
      001BBB                          3 TONE:
      00995F 81                       4 	.byte 4 	
      009960 54 4F 4E 45              5 	.ascii "TONE"
      009960 35 AA                    6 	.word TONE_IDX 
      001BC2                       4998 	_dict_entry,2,TO,TO_IDX;to
      009962 50 E0                    1 	.word LINK 
                           001BC4     2 	LINK=.
      001BC4                          3 TO:
      009964 81                       4 	.byte 2 	
      009965 54 4F                    5 	.ascii "TO"
      009965 CD 8C                    6 	.word TO_IDX 
      001BC9                       4999 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      009967 5C A1                    1 	.word LINK 
                           001BCB     2 	LINK=.
      001BCB                          3 TIMER:
      009969 01                       4 	.byte 5 	
      00996A 27 03 CC 87 B9           5 	.ascii "TIMER"
      00996F 85 AC                    6 	.word TIMER_IDX 
      009970                       5000 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      009970 5D 27                    1 	.word LINK 
                           001BD5     2 	LINK=.
      001BD5                          3 TIMEOUT:
      009972 0A                       4 	.byte 7+F_IFUNC 	
      009973 A6 0F 59 25 03 4A 20     5 	.ascii "TIMEOUT"
      00997A FA 5F                    6 	.word TMROUT_IDX 
      001BDF                       5001 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00997C 97 A6                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                           001BE1     2 	LINK=.
      001BE1                          3 TICKS:
      00997E 84                       4 	.byte 5+F_IFUNC 	
      00997F 81 49 43 4B 53           5 	.ascii "TICKS"
      009980 00 AA                    6 	.word TICKS_IDX 
      001BE9                       5002 	_dict_entry,4,STOP,STOP_IDX;stop 
      009980 CD 8C                    1 	.word LINK 
                           001BEB     2 	LINK=.
      001BEB                          3 STOP:
      009982 5C                       4 	.byte 4 	
      009983 A1 01 27 03              5 	.ascii "STOP"
      009987 CC 87                    6 	.word STOP_IDX 
      001BF2                       5003 	_dict_entry,4,STEP,STEP_IDX;step 
      009989 B9 85                    1 	.word LINK 
                           001BF4     2 	LINK=.
      001BF4                          3 STEP:
      00998B 9F                       4 	.byte 4 	
      00998C A4 0F 5F 5C              5 	.ascii "STEP"
      009990 4D 27                    6 	.word STEP_IDX 
      001BFB                       5004 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      009992 04 58                    1 	.word LINK 
                           001BFD     2 	LINK=.
      001BFD                          3 SPIWR:
      009994 4A                       4 	.byte 5 	
      009995 20 F9 A6 84 81           5 	.ascii "SPIWR"
      00999A 00 A4                    6 	.word SPIWR_IDX 
      001C05                       5005 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00999A CD 8C                    1 	.word LINK 
                           001C07     2 	LINK=.
      001C07                          3 SPISEL:
      00999C 5C                       4 	.byte 6 	
      00999D A1 01 27 03 CC 87        5 	.ascii "SPISEL"
      0099A3 B9 85                    6 	.word SPISEL_IDX 
      001C10                       5006 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      0099A5 53 A6                    1 	.word LINK 
                           001C12     2 	LINK=.
      001C12                          3 SPIRD:
      0099A7 84                       4 	.byte 5+F_IFUNC 	
      0099A8 81 50 49 52 44           5 	.ascii "SPIRD"
      0099A9 00 9E                    6 	.word SPIRD_IDX 
      001C1A                       5007 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      0099A9 85 52                    1 	.word LINK 
                           001C1C     2 	LINK=.
      001C1C                          3 SPIEN:
      0099AB 04                       4 	.byte 5 	
      0099AC 89 90 CE 00 05           5 	.ascii "SPIEN"
      0099B1 17 03                    6 	.word SPIEN_IDX 
      001C24                       5008 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      0099B3 90 CE                    1 	.word LINK 
                           001C26     2 	LINK=.
      001C26                          3 SLEEP:
      0099B5 00                       4 	.byte 5 	
      0099B6 01 17 05 72 5C           5 	.ascii "SLEEP"
      0099BB 00 1E                    6 	.word SLEEP_IDX 
      001C2E                       5009     _dict_entry,4,SHOW,SHOW_IDX;show 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      0099BD 81 26                    1 	.word LINK 
                           001C30     2 	LINK=.
      0099BE                          3 SHOW:
      0099BE 72                       4 	.byte 4 	
      0099BF 5D 00 1E 26              5 	.ascii "SHOW"
      0099C3 03 CC                    6 	.word SHOW_IDX 
      001C37                       5010 	_dict_entry 3,RUN,RUN_IDX;run
      0099C5 87 B9                    1 	.word LINK 
                           001C39     2 	LINK=.
      0099C7                          3 RUN:
      0099C7 CD                       4 	.byte 3 	
      0099C8 8D A9 A1                 5 	.ascii "RUN"
      0099CB 84 27                    6 	.word RUN_IDX 
      001C3F                       5011 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      0099CD 03 CC                    1 	.word LINK 
                           001C41     2 	LINK=.
      001C41                          3 RSHIFT:
      0099CF 87                       4 	.byte 6+F_IFUNC 	
      0099D0 B9 53 48 49 46 54        5 	.ascii "RSHIFT"
      0099D1 00 94                    6 	.word RSHIFT_IDX 
      001C4A                       5012 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      0099D1 5D 26                    1 	.word LINK 
                           001C4C     2 	LINK=.
      001C4C                          3 RND:
      0099D3 10                       4 	.byte 3+F_IFUNC 	
      0099D4 1E 03 CF                 5 	.ascii "RND"
      0099D7 00 05                    6 	.word RND_IDX 
      001C52                       5013 	_dict_entry,6,RETURN,RET_IDX;return 
      0099D9 E6 02                    1 	.word LINK 
                           001C54     2 	LINK=.
      001C54                          3 RETURN:
      0099DB C7                       4 	.byte 6 	
      0099DC 00 04 1E 05 CF 00        5 	.ascii "RETURN"
      0099E2 01 81                    6 	.word RET_IDX 
      0099E4                       5014 	_dict_entry,7,RESTORE,REST_IDX;restore 
      0099E4 85 5B                    1 	.word LINK 
                           001C5F     2 	LINK=.
      001C5F                          3 RESTORE:
      0099E6 04                       4 	.byte 7 	
      0099E7 72 5A 00 1E FC 52 45     5 	.ascii "RESTORE"
      0099EC 00 8E                    6 	.word REST_IDX 
      001C69                       5015 	_dict_entry 6,REMARK,REM_IDX;remark 
      0099EC AE 00                    1 	.word LINK 
                           001C6B     2 	LINK=.
      001C6B                          3 REMARK:
      0099EE 00                       4 	.byte 6 	
      0099EF A6 84 81 41 52 4B        5 	.ascii "REMARK"
      0099F2 00 8C                    6 	.word REM_IDX 
      001C74                       5016 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      0099F2 AE 00                    1 	.word LINK 
                           001C76     2 	LINK=.
      001C76                          3 REBOOT:
      0099F4 01                       4 	.byte 6 	
      0099F5 A6 84 81 4F 4F 54        5 	.ascii "REBOOT"
      0099F8 00 8A                    6 	.word RBT_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      001C7F                       5017 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      0099F8 AE 00                    1 	.word LINK 
                           001C81     2 	LINK=.
      001C81                          3 READ:
      0099FA 02                       4 	.byte 4+F_IFUNC 	
      0099FB A6 84 81 44              5 	.ascii "READ"
      0099FE 00 88                    6 	.word READ_IDX 
      001C88                       5018 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      0099FE AE 00                    1 	.word LINK 
                           001C8A     2 	LINK=.
      001C8A                          3 QKEY:
      009A00 03                       4 	.byte 4+F_IFUNC 	
      009A01 A6 84 81 59              5 	.ascii "QKEY"
      009A04 00 86                    6 	.word QKEY_IDX 
      001C91                       5019 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      009A04 AE 00                    1 	.word LINK 
                           001C93     2 	LINK=.
      001C93                          3 PRTI:
      009A06 04                       4 	.byte 4+F_IFUNC 	
      009A07 A6 84 81 49              5 	.ascii "PRTI"
      009A0A 00 84                    6 	.word PRTI_IDX 
      001C9A                       5020 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      009A0A AE 00                    1 	.word LINK 
                           001C9C     2 	LINK=.
      001C9C                          3 PRTH:
      009A0C 05                       4 	.byte 4+F_IFUNC 	
      009A0D A6 84 81 48              5 	.ascii "PRTH"
      009A10 00 82                    6 	.word PRTH_IDX 
      001CA3                       5021 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      009A10 AE 00                    1 	.word LINK 
                           001CA5     2 	LINK=.
      001CA5                          3 PRTG:
      009A12 06                       4 	.byte 4+F_IFUNC 	
      009A13 A6 84 81 47              5 	.ascii "PRTG"
      009A16 00 80                    6 	.word PRTG_IDX 
      001CAC                       5022 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      009A16 AE 00                    1 	.word LINK 
                           001CAE     2 	LINK=.
      001CAE                          3 PRTF:
      009A18 07                       4 	.byte 4+F_IFUNC 	
      009A19 A6 84 81 46              5 	.ascii "PRTF"
      009A1C 00 7E                    6 	.word PRTF_IDX 
      001CB5                       5023 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      009A1C AE 00                    1 	.word LINK 
                           001CB7     2 	LINK=.
      001CB7                          3 PRTE:
      009A1E 08                       4 	.byte 4+F_IFUNC 	
      009A1F A6 84 81 45              5 	.ascii "PRTE"
      009A22 00 7C                    6 	.word PRTE_IDX 
      001CBE                       5024 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      009A22 A6 84                    1 	.word LINK 
                           001CC0     2 	LINK=.
      001CC0                          3 PRTD:
      009A24 AE                       4 	.byte 4+F_IFUNC 	
      009A25 00 00 81 44              5 	.ascii "PRTD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009A28 00 7A                    6 	.word PRTD_IDX 
      001CC7                       5025 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      009A28 A6 84                    1 	.word LINK 
                           001CC9     2 	LINK=.
      001CC9                          3 PRTC:
      009A2A AE                       4 	.byte 4+F_IFUNC 	
      009A2B 00 01 81 43              5 	.ascii "PRTC"
      009A2E 00 78                    6 	.word PRTC_IDX 
      001CD0                       5026 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      009A2E A6 84                    1 	.word LINK 
                           001CD2     2 	LINK=.
      001CD2                          3 PRTB:
      009A30 AE                       4 	.byte 4+F_IFUNC 	
      009A31 00 02 81 42              5 	.ascii "PRTB"
      009A34 00 76                    6 	.word PRTB_IDX 
      001CD9                       5027 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      009A34 A6 84                    1 	.word LINK 
                           001CDB     2 	LINK=.
      001CDB                          3 PRTA:
      009A36 AE                       4 	.byte 4+F_IFUNC 	
      009A37 00 03 81 41              5 	.ascii "PRTA"
      009A3A 00 74                    6 	.word PRTA_IDX 
      001CE2                       5028 	_dict_entry 5,PRINT,PRT_IDX;print 
      009A3A A6 84                    1 	.word LINK 
                           001CE4     2 	LINK=.
      001CE4                          3 PRINT:
      009A3C AE                       4 	.byte 5 	
      009A3D 00 04 81 4E 54           5 	.ascii "PRINT"
      009A40 00 72                    6 	.word PRT_IDX 
      001CEC                       5029 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      009A40 A6 84                    1 	.word LINK 
                           001CEE     2 	LINK=.
      001CEE                          3 POUT:
      009A42 AE                       4 	.byte 4+F_IFUNC 	
      009A43 00 01 81 54              5 	.ascii "POUT"
      009A46 00 70                    6 	.word POUT_IDX 
      001CF5                       5030 	_dict_entry,4,POKE,POKE_IDX;poke 
      009A46 A6 84                    1 	.word LINK 
                           001CF7     2 	LINK=.
      001CF7                          3 POKE:
      009A48 AE                       4 	.byte 4 	
      009A49 00 00 81 45              5 	.ascii "POKE"
      009A4C 00 6E                    6 	.word POKE_IDX 
      001CFE                       5031 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      009A4C A6 84                    1 	.word LINK 
                           001D00     2 	LINK=.
      001D00                          3 PMODE:
      009A4E AE                       4 	.byte 5 	
      009A4F 40 00 81 44 45           5 	.ascii "PMODE"
      009A52 00 68                    6 	.word PMODE_IDX 
      001D08                       5032 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      009A52 55 00                    1 	.word LINK 
                           001D0A     2 	LINK=.
      001D0A                          3 PINP:
      009A54 04                       4 	.byte 4+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009A55 00 02 81 50              5 	.ascii "PINP"
      009A58 00 6C                    6 	.word PINP_IDX 
      001D11                       5033 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      009A58 CD 8D                    1 	.word LINK 
                           001D13     2 	LINK=.
      001D13                          3 PEEK:
      009A5A 60                       4 	.byte 4+F_IFUNC 	
      009A5B A1 84 27 03              5 	.ascii "PEEK"
      009A5F CC 87                    6 	.word PEEK_IDX 
      001D1A                       5034 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      009A61 B9 4F                    1 	.word LINK 
                           001D1C     2 	LINK=.
      001D1C                          3 PAUSE:
      009A63 CD                       4 	.byte 5 	
      009A64 A3 5C 5D 26 05           5 	.ascii "PAUSE"
      009A69 A6 05                    6 	.word PAUSE_IDX 
      001D24                       5035 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      009A6B CC 87                    1 	.word LINK 
                           001D26     2 	LINK=.
      001D26                          3 PAD:
      009A6D BB                       4 	.byte 3+F_IFUNC 	
      009A6E 50 41 44                 5 	.ascii "PAD"
      009A6E 90 93                    6 	.word PAD_IDX 
      001D2C                       5036 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      009A70 EE 04                    1 	.word LINK 
                           001D2E     2 	LINK=.
      001D2E                          3 OR:
      009A72 A3                       4 	.byte 2+F_IFUNC 	
      009A73 9A 52                    5 	.ascii "OR"
      009A75 26 F2                    6 	.word OR_IDX 
      001D33                       5037 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      009A77 90 CF                    1 	.word LINK 
                           001D35     2 	LINK=.
      001D35                          3 ODR:
      009A79 00                       4 	.byte 3+F_IFUNC 	
      009A7A 07 90 E6                 5 	.ascii "ODR"
      009A7D 02 C7                    6 	.word ODR_IDX 
      001D3B                       5038 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      009A7F 00 0A                    1 	.word LINK 
                           001D3D     2 	LINK=.
      001D3D                          3 NOT:
      009A81 35                       4 	.byte 3+F_IFUNC 	
      009A82 06 00 09                 5 	.ascii "NOT"
      009A85 81 5E                    6 	.word NOT_IDX 
      009A86                       5039 	_dict_entry,4,NEXT,NEXT_IDX;next 
      009A86 72 5F                    1 	.word LINK 
                           001D45     2 	LINK=.
      001D45                          3 NEXT:
      009A88 00                       4 	.byte 4 	
      009A89 07 72 5F 00              5 	.ascii "NEXT"
      009A8D 08 72                    6 	.word NEXT_IDX 
      001D4C                       5040 	_dict_entry,3,NEW,NEW_IDX;new
      009A8F 5F 00                    1 	.word LINK 
                           001D4E     2 	LINK=.
      001D4E                          3 NEW:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009A91 09                       4 	.byte 3 	
      009A92 72 5F 00                 5 	.ascii "NEW"
      009A95 0A CE                    6 	.word NEW_IDX 
      001D54                       5041 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      009A97 00 1A                    1 	.word LINK 
                           001D56     2 	LINK=.
      009A99                          3 MULDIV:
      009A99 C3                       4 	.byte 6+F_IFUNC 	
      009A9A 00 1C 24 1B 90 93        5 	.ascii "MULDIV"
      009AA0 EE 04                    6 	.word MULDIV_IDX 
      001D5F                       5042 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      009AA2 1C 9F                    1 	.word LINK 
                           001D61     2 	LINK=.
      001D61                          3 LSHIFT:
      009AA4 7C                       4 	.byte 6+F_IFUNC 	
      009AA5 FE A3 9A 52 26 1A        5 	.ascii "LSHIFT"
      009AAB 90 CF                    6 	.word LSHIFT_IDX 
      001D6A                       5043 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      009AAD 00 07                    1 	.word LINK 
                           001D6C     2 	LINK=.
      001D6C                          3 LOG:
      009AAF 90                       4 	.byte 3+F_IFUNC 	
      009AB0 E6 02 C7                 5 	.ascii "LOG"
      009AB3 00 0A                    6 	.word LOG_IDX 
      001D72                       5044 	_dict_entry 4,LIST,LIST_IDX;list
      009AB5 35 06                    1 	.word LINK 
                           001D74     2 	LINK=.
      001D74                          3 LIST:
      009AB7 00                       4 	.byte 4 	
      009AB8 09 72 5D 00              5 	.ascii "LIST"
      009ABC 0A 26                    6 	.word LIST_IDX 
      001D7B                       5045 	_dict_entry 3,LET,LET_IDX;let 
      009ABE 05 A6                    1 	.word LINK 
                           001D7D     2 	LINK=.
      001D7D                          3 LET:
      009AC0 0C                       4 	.byte 3 	
      009AC1 CC 87 BB                 5 	.ascii "LET"
      009AC4 81 50                    6 	.word LET_IDX 
      009AC5                       5046 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      009AC5 93 E6                    1 	.word LINK 
                           001D85     2 	LINK=.
      001D85                          3 KEY:
      009AC7 02                       4 	.byte 3+F_IFUNC 	
      009AC8 C7 00 0E                 5 	.ascii "KEY"
      009ACB 72 5F                    6 	.word KEY_IDX 
      001D8B                       5047 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      009ACD 00 0D                    1 	.word LINK 
                           001D8D     2 	LINK=.
      001D8D                          3 IWDGREF:
      009ACF 72                       4 	.byte 7 	
      009AD0 BB 00 0D 20 C4 45 46     5 	.ascii "IWDGREF"
      009AD5 00 4C                    6 	.word IWDGREF_IDX 
      001D97                       5048 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      009AD5 52 06                    1 	.word LINK 
                           001D99     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009AD7                          3 IWDGEN:
      009AD7 C6                       4 	.byte 6 	
      009AD8 00 09 C1 00 0A 27        5 	.ascii "IWDGEN"
      009ADE 37 CD                    6 	.word IWDGEN_IDX 
      001DA2                       5049 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      009AE0 90 07                    1 	.word LINK 
                           001DA4     2 	LINK=.
      001DA4                          3 INVERT:
      009AE2 CE                       4 	.byte 6+F_IFUNC 	
      009AE3 00 07 CF 00 05 55        5 	.ascii "INVERT"
      009AE9 00 09                    6 	.word INVERT_IDX 
      001DAD                       5050 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      009AEB 00 02                    1 	.word LINK 
                           001DAF     2 	LINK=.
      001DAF                          3 INPUT:
      009AED 55                       4 	.byte 5 	
      009AEE 00 0A 00 04 CD           5 	.ascii "INPUT"
      009AF3 8D 60                    6 	.word INPUT_IDX 
      001DB7                       5051 	_dict_entry,2,IF,IF_IDX;if 
      009AF5 A1 84                    1 	.word LINK 
                           001DB9     2 	LINK=.
      001DB9                          3 IF:
      009AF7 27                       4 	.byte 2 	
      009AF8 03 CC                    5 	.ascii "IF"
      009AFA 87 B9                    6 	.word IF_IDX 
      009AFC                       5052 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      009AFC 1F 05                    1 	.word LINK 
                           001DC0     2 	LINK=.
      001DC0                          3 IDR:
      009AFE CD                       4 	.byte 3+F_IFUNC 	
      009AFF 88 A8 CE                 5 	.ascii "IDR"
      009B02 00 05                    6 	.word IDR_IDX 
      001DC6                       5053 	_dict_entry,3,HEX,HEX_IDX;hex_base
      009B04 CF 00                    1 	.word LINK 
                           001DC8     2 	LINK=.
      001DC8                          3 HEX:
      009B06 07                       4 	.byte 3 	
      009B07 55 00 02                 5 	.ascii "HEX"
      009B0A 00 09                    6 	.word HEX_IDX 
      001DCE                       5054 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      009B0C CD 90                    1 	.word LINK 
                           001DD0     2 	LINK=.
      001DD0                          3 GPIO:
      009B0E 17                       4 	.byte 4+F_IFUNC 	
      009B0F 1E 05 A6 84              5 	.ascii "GPIO"
      009B13 5B 06                    6 	.word GPIO_IDX 
      001DD7                       5055 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      009B15 81 D0                    1 	.word LINK 
                           001DD9     2 	LINK=.
      009B16                          3 GOTO:
      009B16 90                       4 	.byte 4 	
      009B17 CE 00 07 72              5 	.ascii "GOTO"
      009B1B 5F 00                    6 	.word GOTO_IDX 
      001DE0                       5056 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      009B1D 07 72                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                           001DE2     2 	LINK=.
      001DE2                          3 GOSUB:
      009B1F 5F                       4 	.byte 5 	
      009B20 00 08 72 5F 00           5 	.ascii "GOSUB"
      009B25 09 72                    6 	.word GOSUB_IDX 
      001DEA                       5057 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      009B27 5F 00                    1 	.word LINK 
                           001DEC     2 	LINK=.
      001DEC                          3 FREE:
      009B29 0A                       4 	.byte 4+F_IFUNC 	
      009B2A CD 9A C5 20              5 	.ascii "FREE"
      009B2E A8 9A                    6 	.word FREE_IDX 
      009B2F                       5058 	_dict_entry,3,FOR,FOR_IDX;for 
      009B2F CD 8C                    1 	.word LINK 
                           001DF5     2 	LINK=.
      001DF5                          3 FOR:
      009B31 61                       4 	.byte 3 	
      009B32 A1 02 27                 5 	.ascii "FOR"
      009B35 03 CC                    6 	.word FOR_IDX 
      001DFB                       5059 	_dict_entry,8,FLASHAPP,FLASHAPP_IDX ;flash_app 
      009B37 87 B9                    1 	.word LINK 
                           001DFD     2 	LINK=.
      009B39                          3 FLASHAPP:
      009B39 72                       4 	.byte 8 	
      009B3A 12 50 C7 85 5D 27 21     5 	.ascii "FLASHAPP"
             85
      009B42 A6 08                    6 	.word FLASHAPP_IDX 
      001E08                       5060 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      009B44 42 9F                    1 	.word LINK 
                           001E0A     2 	LINK=.
      001E0A                          3 FCPU:
      009B46 C7                       4 	.byte 4 	
      009B47 52 00 72 1A              5 	.ascii "FCPU"
      009B4B 50 14                    6 	.word FCPU_IDX 
      001E11                       5061 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      009B4D 72 1A                    1 	.word LINK 
                           001E13     2 	LINK=.
      001E13                          3 ERASE:
      009B4F 50                       4 	.byte 5 	
      009B50 16 72 14 52 00           5 	.ascii "ERASE"
      009B55 72 12                    6 	.word ERASE_IDX 
      001E1B                       5062 	_dict_entry,3,END,END_IDX;cmd_end  
      009B57 52 01                    1 	.word LINK 
                           001E1D     2 	LINK=.
      001E1D                          3 END:
      009B59 72                       4 	.byte 3 	
      009B5A 10 52 01                 5 	.ascii "END"
      009B5D 72 1C                    6 	.word END_IDX 
      001E23                       5063 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      009B5F 52 00                    1 	.word LINK 
                           001E25     2 	LINK=.
      001E25                          3 EEPROM:
      009B61 81                       4 	.byte 6+F_IFUNC 	
      009B62 45 45 50 52 4F 4D        5 	.ascii "EEPROM"
      009B62 5B 02                    6 	.word EEPROM_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      001E2E                       5064 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      009B64 A6 82                    1 	.word LINK 
                           001E30     2 	LINK=.
      001E30                          3 EDIT:
      009B66 C4                       4 	.byte 4 	
      009B67 52 03 A1 02              5 	.ascii "EDIT"
      009B6B 26 F7                    6 	.word EDIT_IDX 
      001E37                       5065 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      009B6D 72 1D                    1 	.word LINK 
                           001E39     2 	LINK=.
      001E39                          3 DWRITE:
      009B6F 52                       4 	.byte 6+F_CMD 	
      009B70 00 72 13 50 C7 72        5 	.ascii "DWRITE"
      009B76 1B 50                    6 	.word DWRITE_IDX 
      001E42                       5066 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      009B78 16 81                    1 	.word LINK 
                           001E44     2 	LINK=.
      009B7A                          3 DREAD:
      009B7A A6                       4 	.byte 5+F_IFUNC 	
      009B7B 78 C5 52 03 27           5 	.ascii "DREAD"
      009B80 04 72                    6 	.word DREAD_IDX 
      001E4C                       5067 	_dict_entry,2,DO,DO_IDX;do_loop
      009B82 5F 52                    1 	.word LINK 
                           001E4E     2 	LINK=.
      001E4E                          3 DO:
      009B84 03                       4 	.byte 2 	
      009B85 81 4F                    5 	.ascii "DO"
      009B86 00 26                    6 	.word DO_IDX 
      001E53                       5068 	_dict_entry,3,DEC,DEC_IDX;dec_base
      009B86 88 CD                    1 	.word LINK 
                           001E55     2 	LINK=.
      001E55                          3 DEC:
      009B88 9B                       4 	.byte 3 	
      009B89 7A 84 72                 5 	.ascii "DEC"
      009B8C 03 52                    6 	.word DEC_IDX 
      001E5B                       5069 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      009B8E 03 FB                    1 	.word LINK 
                           001E5D     2 	LINK=.
      001E5D                          3 DDR:
      009B90 C7                       4 	.byte 3+F_IFUNC 	
      009B91 52 04 72                 5 	.ascii "DDR"
      009B94 01 52                    6 	.word DDR_IDX 
      001E63                       5070 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      009B96 03 FB                    1 	.word LINK 
                           001E65     2 	LINK=.
      001E65                          3 DATALN:
      009B98 C6                       4 	.byte 6 	
      009B99 52 04 81 41 4C 4E        5 	.ascii "DATALN"
      009B9C 00 20                    6 	.word DATALN_IDX 
      001E6E                       5071 	_dict_entry,4,DATA,DATA_IDX;data  
      009B9C A6 FF                    1 	.word LINK 
                           001E70     2 	LINK=.
      001E70                          3 DATA:
      009B9E 72                       4 	.byte 4 	
      009B9F 01 52 03 E3              5 	.ascii "DATA"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009BA3 C6 52                    6 	.word DATA_IDX 
      001E77                       5072 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      009BA5 04 81                    1 	.word LINK 
                           001E79     2 	LINK=.
      009BA7                          3 CRL:
      009BA7 CD                       4 	.byte 3+F_IFUNC 	
      009BA8 8D 60 A1                 5 	.ascii "CRL"
      009BAB 84 27                    6 	.word CRL_IDX 
      001E7F                       5073 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      009BAD 03 CC                    1 	.word LINK 
                           001E81     2 	LINK=.
      001E81                          3 CRH:
      009BAF 87                       4 	.byte 3+F_IFUNC 	
      009BB0 B9 52 48                 5 	.ascii "CRH"
      009BB1 00 1A                    6 	.word CRH_IDX 
      001E87                       5074 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      009BB1 9F CD                    1 	.word LINK 
                           001E89     2 	LINK=.
      001E89                          3 CHAR:
      009BB3 9B                       4 	.byte 4+F_CFUNC 	
      009BB4 86 CD 88 A8              5 	.ascii "CHAR"
      009BB8 A1 09                    6 	.word CHAR_IDX 
      001E90                       5075 	_dict_entry,3,BYE,BYE_IDX;bye 
      009BBA 26 02                    1 	.word LINK 
                           001E92     2 	LINK=.
      001E92                          3 BYE:
      009BBC 20                       4 	.byte 3 	
      009BBD E9 4D 27                 5 	.ascii "BYE"
      009BC0 05 55                    6 	.word BYE_IDX 
      001E98                       5076 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      009BC2 00 03                    1 	.word LINK 
                           001E9A     2 	LINK=.
      001E9A                          3 BTOGL:
      009BC4 00                       4 	.byte 5 	
      009BC5 02 81 4F 47 4C           5 	.ascii "BTOGL"
      009BC7 00 14                    6 	.word BTOGL_IDX 
      001EA2                       5077 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      009BC7 CD 9B                    1 	.word LINK 
                           001EA4     2 	LINK=.
      001EA4                          3 BTEST:
      009BC9 9C                       4 	.byte 5+F_IFUNC 	
      009BCA 5F 97 A6 84 81           5 	.ascii "BTEST"
      009BCF 00 12                    6 	.word BTEST_IDX 
      001EAC                       5078 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      009BCF CD 88                    1 	.word LINK 
                           001EAE     2 	LINK=.
      001EAE                          3 BSET:
      009BD1 A8                       4 	.byte 4 	
      009BD2 A1 84 27 03              5 	.ascii "BSET"
      009BD6 CC 87                    6 	.word BSET_IDX 
      001EB5                       5079 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      009BD8 B9 5D                    1 	.word LINK 
                           001EB7     2 	LINK=.
      001EB7                          3 BRES:
      009BDA 27                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009BDB 05 72 1B 50              5 	.ascii "BRES"
      009BDF 14 81                    6 	.word BRES_IDX 
      009BE1                       5080 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      009BE1 72 1A                    1 	.word LINK 
                           001EC0     2 	LINK=.
      001EC0                          3 BIT:
      009BE3 50                       4 	.byte 3+F_IFUNC 	
      009BE4 14 81 54                 5 	.ascii "BIT"
      009BE6 00 0C                    6 	.word BIT_IDX 
      001EC6                       5081 	_dict_entry,3,AWU,AWU_IDX;awu 
      009BE6 AE 16                    1 	.word LINK 
                           001EC8     2 	LINK=.
      001EC8                          3 AWU:
      009BE8 E0                       4 	.byte 3 	
      009BE9 B6 84 81                 5 	.ascii "AWU"
      009BEC 00 0A                    6 	.word AWU_IDX 
      001ECE                       5082 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      009BEC 00 00                    1 	.word LINK 
                           001ED0     2 	LINK=.
      009BEE                          3 ASC:
      009BEE 43                       4 	.byte 3+F_IFUNC 	
      009BEF 58 4F 52                 5 	.ascii "ASC"
      009BF2 00 C2                    6 	.word ASC_IDX 
      001ED6                       5083 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      009BF4 9B EE                    1 	.word LINK 
                           001ED8     2 	LINK=.
      009BF6                          3 AND:
      009BF6 05                       4 	.byte 3+F_IFUNC 	
      009BF7 57 52 49                 5 	.ascii "AND"
      009BFA 54 45                    6 	.word AND_IDX 
      001EDE                       5084 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      009BFC 00 C0                    1 	.word LINK 
                           001EE0     2 	LINK=.
      001EE0                          3 ADCREAD:
      009BFE 9B                       4 	.byte 7+F_IFUNC 	
      009BFF F6 44 43 52 45 41 44     5 	.ascii "ADCREAD"
      009C00 00 04                    6 	.word ADCREAD_IDX 
      001EEA                       5085 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      009C00 05 57                    1 	.word LINK 
                           001EEC     2 	LINK=.
      001EEC                          3 ADCON:
      009C02 4F                       4 	.byte 5 	
      009C03 52 44 53 00 BE           5 	.ascii "ADCON"
      009C08 9C 00                    6 	.word ADCON_IDX 
      009C0A                       5086 kword_dict::
      001EF4                       5087 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      009C0A 04 57                    1 	.word LINK 
                           001EF6     2 	LINK=.
      001EF6                          3 ABS:
      009C0C 41                       4 	.byte 3+F_IFUNC 	
      009C0D 49 54 00                 5 	.ascii "ABS"
      009C10 BC 9C                    6 	.word ABS_IDX 
                                   5088 
                                   5089 ;comands and fonctions address table 	
      001EFC                       5090 code_addr::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009C12 0A 9E 12 C7 13 03 16  5091 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             B2 15 8F 16 4F 19 00
      009C13 10 52 10 42 10 73 10  5092 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             63 16 28 15 7D 19 BA
      009C13 43 55 53 52 00 BA 9C  5093 	.word const_cr1,data,data_line,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             13 0D C7 19 29 13 37
             13 67
      009C1B 0E B7 19 CC 12 73 14  5094 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,flash_app,for,gosub,goto,gpio ; 24..31 
             2F 17 2C 14 5C 10 CE
             11 D9 11 BE 15 CB
      009C1B 05 55 4E 54 49 4C 00  5095 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             B8 9C 1B 18 AA 18 E0
             15 B6
      009C25 0D EF 0E 22 18 E5 16  5096 	.word let,list,log2,lshift,muldiv,next,new ; 40..47
             FA 0B 66 11 4E 13 EE
      009C25 46 55 46 4C 41 53 48  5097 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             00 B6 9C 25 38 10 A9
             19 C6
      009C30 10 9A 19 C0 0F 21 19  5098 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             6C 19 72 19 78 19 7E
             19 84
      009C30 46 55 42 4F 55 4E 44  5099 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             00 B4 9C 30 55 04 7E
             10 17
      009C3B 1A 06 11 F9 17 B4 17  5100 	.word restore,return, random,rshift,run,show,free ; 72..79
             13 12 17 0D 81 0D CC
      009C3B 04 54 4F 4E 45 00 B2  5101 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             9C 3B 27 11 27 13 A2
             16 98
      009C44 18 81 18 90 10 F7 12  5102 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             83 0D E5 15 F5 19 3E
             16 0B
      009C44 02 54 4F 00 B0 9C 44  5103 	.word wait,words,write,bit_xor ; 96..99
             E2
      009C4B 00 00                 5104 	.word 0 
                                   5105 
                                   5106 
                                   5107 
                                   5108 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                     56 
      009C4B 05 54 49 4D 45 52 00    57 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             AC 9C 4B 00 00
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
      009C55                         70 get_escape:
      009C55 47 54 49         [ 4]   71     call getc 
      009C58 4D 45            [ 1]   72     cp a,#'[ ; this character is expected after ESC 
      009C5A 4F 55            [ 1]   73     jreq 1$
      009C5C 54               [ 1]   74     clr a
      009C5D 00               [ 4]   75     ret
      009C5E AE 9C 55         [ 4]   76 1$: call getc 
      009C61 AE 1F C2         [ 2]   77     ldw x,#convert_table
      001FDD                         78 2$:
      009C61 45               [ 1]   79     cp a,(x)
      009C62 54 49            [ 1]   80     jreq 4$
      009C64 43 4B 53         [ 2]   81     addw x,#2
      009C67 00               [ 1]   82     tnz (x)
      009C68 AA 9C            [ 1]   83     jrne 2$
      009C6A 61               [ 1]   84     clr a
      009C6B 81               [ 4]   85     ret 
      009C6B 04               [ 1]   86 4$: incw x 
      009C6C 53               [ 1]   87     ld a,(x)
      009C6D 54 4F            [ 1]   88     cp a,#SUP
      009C6F 50 00            [ 1]   89     jrne 5$
      009C71 A8               [ 1]   90     push a 
      009C72 9C 6B D1         [ 4]   91     call getc
      009C74 84               [ 1]   92     pop a 
      001FF3                         93 5$:
      009C74 04               [ 4]   94     ret 
                                     95 
                                     96 
                                     97 ;-----------------------------
                                     98 ; send an ASCIZ string to UART1 
                                     99 ; input: 
                                    100 ;   x 		char * 
                                    101 ; output:
                                    102 ;   none 
                                    103 ;-------------------------------
      001FF4                        104 puts::
      009C75 53               [ 1]  105     ld a,(x)
      009C76 54 45            [ 1]  106 	jreq 1$
      009C78 50 00 A6         [ 4]  107 	call putc 
      009C7B 9C               [ 1]  108 	incw x 
      009C7C 74 F7            [ 2]  109 	jra puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009C7D 81               [ 4]  110 1$:	ret 
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
      001FFE                        121 bksp:
      009C7D 05 53            [ 1]  122 	ld a,#BS 
      009C7F 50 49 57         [ 4]  123 	call putc 
      009C82 52 00            [ 1]  124 	ld a,#SPACE 
      009C84 A4 9C 7D         [ 4]  125 	call putc 
      009C87 A6 08            [ 1]  126 	ld a,#BS 
      009C87 06 53 50         [ 4]  127 	call putc 
      009C8A 49               [ 4]  128 	ret 
                                    129 ;---------------------------
                                    130 ; delete n character left of cursor 
                                    131 ; at terminal.
                                    132 ; input: 
                                    133 ;   A   number of characters to delete.
                                    134 ; output:
                                    135 ;    none 
                                    136 ;--------------------------	
      00200E                        137 delete_nchar:
      009C8B 53               [ 1]  138 	push a 
      009C8C 45 4C            [ 1]  139 0$:	tnz (1,sp)
      009C8E 00 A2            [ 1]  140 	jreq 1$
      009C90 9C 87 FE         [ 4]  141 	call bksp 
      009C92 0A 01            [ 1]  142 	dec (1,sp)
      009C92 45 53            [ 2]  143 	jra 0$
      009C94 50               [ 1]  144 1$:	pop a 
      009C95 49               [ 4]  145 	ret
                                    146 
                                    147 ;--------------------------
                                    148 ; send ANSI escape sequence
                                    149 ; ANSI: ESC[
                                    150 ; note: ESC is ASCII 27
                                    151 ;       [   is ASCII 91  
                                    152 ;-------------------------- 
      00201C                        153 send_escape:
      009C96 52 44            [ 1]  154 	ld a,#ESC 
      009C98 00 9E 9C         [ 4]  155 	call putc 
      009C9B 92 5B            [ 1]  156 	ld a,#'[
      009C9C CD 02 C1         [ 4]  157 	call putc 
      009C9C 05               [ 4]  158 	ret 
                                    159 
                                    160 ;---------------------
                                    161 ;send ANSI parameter value
                                    162 ; ANSI parameter values are 
                                    163 ; sent as ASCII charater 
                                    164 ; not as binary number.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
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
      002027                        174 send_parameter:
      009C9D 53               [ 2]  175 	pushw x 
      009C9E 50               [ 1]  176 	clrw x 
      009C9F 49               [ 1]  177 	ld xl,a 
      009CA0 45 4E            [ 1]  178 	ld a,#10 
      009CA2 00               [ 2]  179 	div x,a 
      009CA3 A0               [ 1]  180 	ld xh,a 
      009CA4 9C               [ 1]  181 	ld a,xl
      009CA5 9C               [ 1]  182     tnz a 
      009CA6 27 0B            [ 1]  183     jreq 2$
      009CA6 05 53            [ 1]  184 	cp a,#9 
      009CA8 4C 45            [ 2]  185 	jrule 1$
      009CAA 45 50            [ 1]  186 	ld a,#'9
      002038                        187 1$:
      009CAC 00 9C            [ 1]  188 	add a,#'0 
      009CAE 9C A6 C1         [ 4]  189 	call putc
      009CB0 9E               [ 1]  190 2$:	ld a,xh 
      009CB0 04 53            [ 1]  191 	add a,#'0
      009CB2 48 4F 57         [ 4]  192 	call putc 
      009CB5 00               [ 2]  193 	popw x 
      009CB6 98               [ 4]  194 	ret 
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
      002045                        207 move_left:
      009CB7 9C               [ 1]  208 	push a 
      009CB8 B0 20 1C         [ 4]  209 	call send_escape
      009CB9 84               [ 1]  210     pop a
      009CB9 03 52 55         [ 4]  211 	call send_parameter 
      009CBC 4E 00            [ 1]  212 	ld a,#'D 
      009CBE 96 9C B9         [ 4]  213 	call putc 
      009CC1 81               [ 4]  214 	ret	
                                    215 
                                    216 
                                    217 ;--------------------------
                                    218 ; move cursor right n character 
                                    219 ; ANSI: ESC[PnC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                    220 ; input:
                                    221 ;   A     character count
                                    222 ; output:
                                    223 ;   none
                                    224 ;--------------------------
      002053                        225 move_right:
      009CC1 46               [ 1]  226 	push a 
      009CC2 52 53 48         [ 4]  227 	call send_escape
      009CC5 49               [ 1]  228     pop a
      009CC6 46 54 00         [ 4]  229 	call send_parameter 
      009CC9 94 9C            [ 1]  230 	ld a,#'C 
      009CCB C1 02 C1         [ 4]  231 	call putc 
      009CCC 81               [ 4]  232 	ret 
                                    233 
                                    234 
                                    235 ;--------------------------
                                    236 ; print n spaces on terminal
                                    237 ; input:
                                    238 ;  X 		number of spaces 
                                    239 ; output:
                                    240 ;	none 
                                    241 ;---------------------------
      002061                        242 spaces::
      009CCC 43 52            [ 1]  243 	ld a,#SPACE 
      009CCE 4E               [ 2]  244 1$:	tnzw x
      009CCF 44 00            [ 1]  245 	jreq 9$
      009CD1 92 9C CC         [ 4]  246 	call putc 
      009CD4 5A               [ 2]  247 	decw x
      009CD4 06 52            [ 2]  248 	jra 1$
      00206C                        249 9$: 
      009CD6 45               [ 4]  250 	ret 
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
      00206D                        267 insert_char: 
      00206D                        268 	_vars VSIZE 
      009CD7 54 55            [ 2]    1     sub sp,#VSIZE 
      009CD9 52 4E            [ 1]  269     ld (KCHAR,sp),a 
      009CDB 00               [ 1]  270     ld a,xh 
      009CDC 90 9C            [ 1]  271 	ld (IPOS,sp),a
      009CDE D4               [ 1]  272     ld a,xl 
      009CDF 6B 03            [ 1]  273     ld (LLEN,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009CDF 07               [ 1]  274     ldw x,y
      009CE0 52               [ 1]  275     incw x 
      009CE1 45 53            [ 1]  276     ld a,(LLEN,sp)
      009CE3 54 4F            [ 1]  277     sub a,(IPOS,sp)
      009CE5 52               [ 1]  278     inc a 
      009CE6 45 00 8E         [ 1]  279     ld acc8,a 
      009CE9 9C DF 00 0C      [ 1]  280     clr acc16
      009CEB CD 03 C5         [ 4]  281     call move
      009CEB 06 52 45 4D      [ 2]  282     ldw y,#tib 
      009CEF 41 52            [ 1]  283     ld a,(IPOS,sp)
      009CF1 4B 00 8C         [ 1]  284     ld acc8,a 
      009CF4 9C EB 00 0C      [ 2]  285     addw y,acc16 
      009CF6 7B 02            [ 1]  286     ld a,(KCHAR,sp)
      009CF6 06 52            [ 1]  287     ld (y),a
      009CF8 45 42            [ 1]  288     incw y  
      009CFA 4F 4F            [ 1]  289     ld a,(IPOS,sp)
      009CFC 54 00 8A         [ 4]  290     call move_left
      009CFF 9C F6 90         [ 2]  291     ldw x,#tib 
      009D01 CD 1F F4         [ 4]  292     call puts 
      009D01 44 52            [ 1]  293     ld a,(LLEN,sp)
      009D03 45 41            [ 1]  294     sub a,(IPOS,sp) 
      009D05 44 00 88         [ 4]  295     call move_left 
      0020AD                        296 	_drop VSIZE 
      009D08 9D 01            [ 2]    1     addw sp,#VSIZE 
      009D0A 81               [ 4]  297 	ret 
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
      0020B0                        310 delete_under:
      0020B0                        311 	_vars VSIZE 
      009D0A 44 51            [ 2]    1     sub sp,#VSIZE 
      009D0C 4B 45            [ 1]  312     ld (LLEN,sp),a 
      009D0E 59               [ 1]  313     ld a,xl 
      009D0F 00 86            [ 1]  314     ld (CPOS,sp),a 
      009D11 9D               [ 1]  315     ldw x,y ; move destination
      009D12 0A 5C            [ 1]  316     incw y  ; move source 
      009D13 7B 02            [ 1]  317     ld a,(LLEN,sp)
      009D13 44 50            [ 1]  318     sub a,(CPOS,sp)
      009D15 52               [ 1]  319     inc a ; move including zero at end.
      009D16 54 49 00         [ 1]  320     ld acc8,a 
      009D19 84 9D 13 0C      [ 1]  321     clr acc16 
      009D1C CD 03 C5         [ 4]  322 	call move 
      009D1C 44 50 52 54      [ 2]  323     ldw y,#tib 
      009D20 48 00            [ 1]  324     ld a,(CPOS,sp)
      009D22 82 9D 1C         [ 1]  325     ld acc8,a 
      009D25 72 B9 00 0C      [ 2]  326     addw y,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009D25 44               [ 1]  327     ldw x,y 
      009D26 50 52 54         [ 4]  328     call puts 
      009D29 47 00            [ 1]  329     ld a,#SPACE  
      009D2B 80 9D 25         [ 4]  330     call putc
      009D2E 7B 02            [ 1]  331     ld a,(LLEN,sp)
      009D2E 44 50            [ 1]  332     sub a,(CPOS,sp)
      009D30 52 54 46         [ 4]  333     call move_left 
      009D33 00 7E            [ 1]  334     dec (LLEN,sp)
      0020E8                        335 	_drop VSIZE 
      009D35 9D 2E            [ 2]    1     addw sp,#VSIZE 
      009D37 81               [ 4]  336 	ret 
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
      0020EB                        348 delete_line:
      009D37 44 50 52         [ 4]  349     call send_escape
      009D3A 54 45            [ 1]  350 	ld a,#'2
      009D3C 00 7C 9D         [ 4]  351 	call putc 
      009D3F 37 4B            [ 1]  352 	ld a,#'K 
      009D40 CD 02 C1         [ 4]  353 	call putc 
      009D40 44               [ 4]  354 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                           000001   381 	RXCHAR = 1 ; last char received
                           000002   382 	LL = 2  ; accepted line length
                           000003   383 	CPOS=3  ; cursor position 
                           000004   384 	OVRWR=4 ; overwrite flag 
                           000004   385 	VSIZE=4 
      0020F9                        386 readln::
      0020F9                        387 	_vars VSIZE 
      009D41 50 52            [ 2]    1     sub sp,#VSIZE 
      009D43 54               [ 1]  388 	clrw x 
      009D44 44 00            [ 2]  389 	ldw (LL,sp),x 
      009D46 7A 9D            [ 2]  390 	ldw (CPOS,sp),x 
      009D48 40 04            [ 1]  391 	cpl (OVRWR,sp) ; default to overwrite mode 
      009D49 90 AE 16 90      [ 2]  392  	ldw y,#tib ; input buffer
      002106                        393 readln_loop:
      009D49 44 50 52         [ 4]  394 	call getc
      009D4C 54 43            [ 1]  395 	ld (RXCHAR,sp),a
      009D4E 00 78            [ 1]  396     cp a,#ESC 
      009D50 9D 49            [ 1]  397     jrne 0$
      009D52 CD 1F CE         [ 4]  398     call get_escape 
      009D52 44 50            [ 1]  399     ld (RXCHAR,sp),a 
      009D54 52 54            [ 1]  400 0$:	cp a,#CR
      009D56 42 00            [ 1]  401 	jrne 1$
      009D58 76 9D 52         [ 2]  402 	jp readln_quit
      009D5B A1 0A            [ 1]  403 1$:	cp a,#LF 
      009D5B 44 50            [ 1]  404 	jrne 2$ 
      009D5D 52 54 41         [ 2]  405 	jp readln_quit
      002122                        406 2$:
      009D60 00 74            [ 1]  407 	cp a,#BS
      009D62 9D 5B            [ 1]  408 	jrne 3$
                                    409 ; delete left 
      009D64 0D 03            [ 1]  410     tnz (CPOS,sp)
      009D64 05 50            [ 1]  411     jreq readln_loop 
      009D66 52 49            [ 1]  412     ld a,#1 
      009D68 4E 54 00         [ 4]  413     call move_left
      009D6B 72 9D            [ 1]  414     dec (CPOS,sp)
      009D6D 64 5A            [ 2]  415     decw y 
      009D6E 7B 03            [ 1]  416     ld a,(CPOS,sp) 
      009D6E 44 50 4F         [ 2]  417     jp 12$
      002138                        418 3$:
      009D71 55 54            [ 1]  419 	cp a,#CTRL_D
      009D73 00 70            [ 1]  420 	jrne 4$
                                    421 ;delete line 
      009D75 9D 6E EB         [ 4]  422 	call delete_line 
      009D77 7B 03            [ 1]  423     ld a,(CPOS,sp)
      009D77 04               [ 1]  424     inc a 
      009D78 50 4F 4B         [ 4]  425     call move_left 
      009D7B 45 00            [ 1]  426 	ld a,#'> 
      009D7D 6E 9D 77         [ 4]  427 	call putc 
      009D80 90 AE 16 90      [ 2]  428 	ldw y,#tib
      009D80 05 50            [ 1]  429 	clr (y)
      009D82 4D 4F            [ 1]  430 	clr (LL,sp)
      009D84 44 45            [ 1]  431 	clr (CPOS,sp)
      009D86 00 68            [ 2]  432 	jra readln_loop
      002156                        433 4$:
      009D88 9D 80            [ 1]  434 	cp a,#CTRL_R 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009D8A 26 21            [ 1]  435 	jrne 5$
                                    436 ;reprint 
      009D8A 44 50            [ 1]  437 	tnz (LL,sp)
      009D8C 49 4E            [ 1]  438 	jrne readln_loop
      009D8E 50 00 6C         [ 2]  439 	ldw x,#tib 
      009D91 9D 8A 9B         [ 4]  440 	call strlen 
      009D93 90 AE 16 90      [ 2]  441 	ldw y,#tib 
      009D93 44 50            [ 1]  442 	jreq readln_loop
      009D95 45 45            [ 1]  443 	ld (LL,sp),a 
      009D97 4B 00            [ 1]  444     ld (CPOS,sp),a
      009D99 6A 9D 93         [ 2]  445 	ldw x,#tib 
      009D9C CD 1F F4         [ 4]  446 	call puts
      009D9C 05 50            [ 1]  447 	clr (LL_HB,sp)
      009D9E 41 55 53         [ 2]  448 	addw y,(LL_HB,sp)
      009DA1 45 00            [ 2]  449 	jra readln_loop 
      00217B                        450 5$:
      009DA3 66 9D            [ 1]  451 	cp a,#CTRL_E 
      009DA5 9C 49            [ 1]  452 	jrne 6$
                                    453 ;edit line number 
      009DA6 AE 16 90         [ 2]  454 	ldw x,#tib 
      009DA6 43 50 41         [ 4]  455 	call atoi24
      009DA9 44 00 64         [ 2]  456 	ldw x,acc16
      009DAC 9D A6 DC         [ 4]  457 	call search_lineno
      009DAE 5D               [ 2]  458 	tnzw x 
      009DAE 42 4F            [ 1]  459 	jrne 51$
      009DB0 52 00            [ 1]  460 	clr (LL,sp)
      009DB2 62 9D AE 90      [ 2]  461 	ldw y,#tib
      009DB5 90 7F            [ 1]  462     clr (y) 	
      009DB5 43 4F 44         [ 2]  463 	jp readln_quit  
      002199                        464 51$:
      009DB8 52 00 60         [ 2]  465 	ldw basicptr,x
      009DBB 9D B5            [ 1]  466 	ld a,(2,x)
      009DBD C7 00 03         [ 1]  467 	ld count,a 
      009DBD 43 4E 4F 54      [ 2]  468 	ldw y,#tib 
      009DC1 00 5E 9D         [ 4]  469 	call decompile 
      009DC4 BD 01            [ 1]  470 	clr (LL_HB,sp)
      009DC5 A6 0D            [ 1]  471 	ld a,#CR 
      009DC5 04 4E 45         [ 4]  472 	call putc 
      009DC8 58 54            [ 1]  473 	ld a,#'>
      009DCA 00 5A 9D         [ 4]  474 	call putc
      009DCD C5 16 90         [ 2]  475     ldw x,#tib  
      009DCE CD 03 9B         [ 4]  476 	call strlen 
      009DCE 03 4E            [ 1]  477 	ld (LL,sp),a 
      009DD0 45 57 00         [ 4]  478 	call puts 
      009DD3 5C 9D            [ 1]  479 	ldw y,x
      009DD5 CE 02            [ 1]  480     ld a,(LL,sp)
      009DD6 6B 03            [ 1]  481     ld (CPOS,sp),a  
      009DD6 46 4D 55         [ 2]  482 	jp readln_loop
      0021C8                        483 6$:
      009DD9 4C 44            [ 1]  484 	cp a,#ARROW_RIGHT
      009DDB 49 56            [ 1]  485    	jrne 7$ 
                                    486 ; right arrow
      009DDD 00 58            [ 1]  487 	ld a,(CPOS,sp)
      009DDF 9D D6            [ 1]  488     cp a,(LL,sp)
      009DE1 2B 03            [ 1]  489     jrmi 61$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009DE1 46 4C 53         [ 2]  490     jp readln_loop 
      0021D5                        491 61$:
      009DE4 48 49            [ 1]  492     ld a,#1 
      009DE6 46 54 00         [ 4]  493 	call move_right 
      009DE9 56 9D            [ 1]  494 	inc (CPOS,sp)
      009DEB E1 5C            [ 1]  495     incw y 
      009DEC CC 21 06         [ 2]  496     jp readln_loop 
      009DEC 43 4C            [ 1]  497 7$: cp a,#ARROW_LEFT  
      009DEE 4F 47            [ 1]  498 	jrne 8$
                                    499 ; left arrow 
      009DF0 00 54            [ 1]  500 	tnz (CPOS,sp)
      009DF2 9D EC            [ 1]  501 	jrne 71$
      009DF4 CC 21 06         [ 2]  502 	jp readln_loop
      0021EC                        503 71$:
      009DF4 04 4C            [ 1]  504     ld a,#1 
      009DF6 49 53 54         [ 4]  505 	call move_left 
      009DF9 00 52            [ 1]  506 	dec (CPOS,sp)
      009DFB 9D F4            [ 2]  507     decw y 
      009DFD CC 21 06         [ 2]  508 	jp readln_loop 
      009DFD 03 4C            [ 1]  509 8$: cp a,#HOME  
      009DFF 45 54            [ 1]  510 	jrne 9$
                                    511 ; HOME 
      009E01 00 50            [ 1]  512     ld a,(CPOS,sp)
      009E03 9D FD 45         [ 4]  513     call move_left 
      009E05 0F 03            [ 1]  514 	clr (CPOS,sp)
      009E05 43 4B 45 59      [ 2]  515     ldw y,#tib 
      009E09 00 4E 9E         [ 2]  516 	jp readln_loop  
      009E0C 05 83            [ 1]  517 9$: cp a,#KEY_END  
      009E0D 26 26            [ 1]  518 	jrne 10$
                                    519 ; KEY_END 
      009E0D 07 49            [ 1]  520 	ld a,(CPOS,sp)
      009E0F 57 44            [ 1]  521 	cp a,(LL,sp)
      009E11 47 52            [ 1]  522 	jrne 91$
      009E13 45 46 00         [ 2]  523 	jp readln_loop 
      002217                        524 91$:
      009E16 4C 9E            [ 1]  525 	ld a,(LL,sp)
      009E18 0D 03            [ 1]  526 	sub a,(CPOS,sp)
      009E19 CD 20 53         [ 4]  527 	call move_right 
      009E19 06 49            [ 1]  528 	ld a,(LL,sp)
      009E1B 57 44            [ 1]  529 	ld (CPOS,sp),a
      009E1D 47 45 4E 00      [ 2]  530     ldw y,#tib
      009E21 4A 9E 19 0C      [ 1]  531     clr acc16 
      009E24 C7 00 0D         [ 1]  532     ld acc8,a 
      009E24 46 49 4E 56      [ 2]  533     addw y,acc16  
      009E28 45 52 54         [ 2]  534 	jp readln_loop 
      009E2B 00 48            [ 1]  535 10$: cp a,#CTRL_O
      009E2D 9E 24            [ 1]  536 	jrne 11$ 
                                    537 ; toggle between insert/overwrite
      009E2F 03 04            [ 1]  538 	cpl (OVRWR,sp)
      009E2F 05 49            [ 2]  539 	pushw y 
      009E31 4E 50 55         [ 4]  540 	call beep_1khz
      009E34 54 00            [ 2]  541 	popw y 
      009E36 46 9E 2F         [ 2]  542 	jp readln_loop 
      009E39 A1 84            [ 1]  543 11$: cp a,#SUP 
      009E39 02 49            [ 1]  544     jrne final_test 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                    545 ; del character under cursor 
      009E3B 46 00            [ 1]  546     ld a,(CPOS,sp)
      009E3D 44 9E            [ 1]  547     cp a,(LL,sp)
      009E3F 39 08            [ 1]  548     jrpl 13$
      009E40                        549 12$:
      009E40 43               [ 1]  550     ld xl,a    ; cursor position 
      009E41 49 44            [ 1]  551     ld a,(LL,sp)  ; line length
      009E43 52 00 42         [ 4]  552     call delete_under
      009E46 9E 40            [ 1]  553     dec (LLEN,sp)
      009E48                        554 13$:
      009E48 03 48 45         [ 2]  555     jp readln_loop 
      002259                        556 final_test:
      009E4B 58 00            [ 1]  557 	cp a,#SPACE
      009E4D 40 9E            [ 1]  558 	jrpl accept_char
      009E4F 48 21 06         [ 2]  559 	jp readln_loop
      009E50                        560 accept_char:
      009E50 44 47            [ 1]  561 	ld a,#TIB_SIZE-1
      009E52 50 49            [ 1]  562 	cp a, (LL,sp)
      009E54 4F 00            [ 1]  563 	jrpl 1$
      009E56 3E 9E 50         [ 2]  564 	jp readln_loop
      009E59 0D 04            [ 1]  565 1$:	tnz (OVRWR,sp)
      009E59 04 47            [ 1]  566 	jrne overwrite
                                    567 ; insert mode 
      009E5B 4F 54            [ 1]  568     ld a,(CPOS,sp)
      009E5D 4F 00            [ 1]  569     cp a,(LL,sp)
      009E5F 3C 9E            [ 1]  570     jreq overwrite
      009E61 59 02            [ 1]  571     ld a,(LL,sp)
      009E62 97               [ 1]  572     ld xl,a 
      009E62 05 47            [ 1]  573     ld a,(CPOS,sp)
      009E64 4F               [ 1]  574     ld xh,a
      009E65 53 55            [ 1]  575     ld a,(RXCHAR,sp)
      009E67 42 00 3A         [ 4]  576     call insert_char
      009E6A 9E 62            [ 1]  577     inc (LLEN,sp)
      009E6C 0C 03            [ 1]  578     inc (CPOS,sp)
      009E6C 44 46 52         [ 2]  579     jp readln_loop 
      002285                        580 overwrite:
      009E6F 45 45            [ 1]  581 	ld a,(RXCHAR,sp)
      009E71 00 9A            [ 1]  582 	ld (y),a
      009E73 9E 6C            [ 1]  583     incw y
      009E75 CD 02 C1         [ 4]  584     call putc 
      009E75 03 46            [ 1]  585 	ld a,(CPOS,sp)
      009E77 4F 52            [ 1]  586 	cp a,(LL,sp)
      009E79 00 38            [ 1]  587 	jrmi 1$
      009E7B 9E 75            [ 1]  588 	clr (y)
      009E7D 0C 02            [ 1]  589 	inc (LL,sp)
      009E7D 08 46            [ 1]  590     inc (CPOS,sp)
      009E7F 4C 41 53         [ 2]  591 	jp readln_loop 
      00229D                        592 1$:	
      009E82 48 41            [ 1]  593 	inc (CPOS,sp)
      009E84 50 50 00         [ 2]  594 	jp readln_loop 
      0022A2                        595 readln_quit:
      009E87 36 9E 7D 90      [ 2]  596 	ldw y,#tib
      009E8A 0F 01            [ 1]  597     clr (LL_HB,sp) 
      009E8A 04 46 43         [ 2]  598     addw y,(LL_HB,sp)
      009E8D 50 55            [ 1]  599     clr (y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009E8F 00 34            [ 1]  600 	ld a,(LL,sp)
      009E91 9E 8A 03         [ 1]  601 	ld count,a 
      009E93 A6 0D            [ 1]  602 	ld a,#CR
      009E93 05 45 52         [ 4]  603 	call putc
      0022B7                        604 	_drop VSIZE 
      009E96 41 53            [ 2]    1     addw sp,#VSIZE 
      009E98 45               [ 4]  605 	ret
                                    606 
                                    607 ;------------------------------
                                    608 ; print byte  in hexadecimal 
                                    609 ; on console
                                    610 ; input:
                                    611 ;    A		byte to print
                                    612 ;------------------------------
      0022BA                        613 print_hex::
      009E99 00               [ 1]  614 	push a 
      009E9A 32               [ 1]  615 	swap a 
      009E9B 9E 93 D1         [ 4]  616 	call to_hex_char 
      009E9D CD 02 C1         [ 4]  617 	call putc 
      009E9D 03 45            [ 1]  618     ld a,(1,sp) 
      009E9F 4E 44 00         [ 4]  619 	call to_hex_char
      009EA2 30 9E 9D         [ 4]  620 	call putc
      009EA5 A6 20            [ 1]  621 	ld a,#SPACE 
      009EA5 46 45 45         [ 4]  622 	call putc 
      009EA8 50               [ 1]  623 	pop a 
      009EA9 52               [ 4]  624 	ret 
                                    625 
                                    626 ;----------------------------------
                                    627 ; convert to hexadecimal digit 
                                    628 ; input:
                                    629 ;   A       digit to convert 
                                    630 ; output:
                                    631 ;   A       hexdecimal character 
                                    632 ;----------------------------------
      0022D1                        633 to_hex_char::
      009EAA 4F 4D            [ 1]  634 	and a,#15 
      009EAC 00 2E            [ 1]  635 	cp a,#9 
      009EAE 9E A5            [ 2]  636 	jrule 1$ 
      009EB0 AB 07            [ 1]  637 	add a,#7
      009EB0 04 45            [ 1]  638 1$: add a,#'0 
      009EB2 44               [ 4]  639 	ret 
                                    640 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
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
      0022DC                         51 search_lineno::
      0022DC                         52 	_vars VSIZE
      009EB3 49 54            [ 2]    1     sub sp,#VSIZE 
      009EB5 00 2C            [ 1]   53 	clr (LL,sp)
      009EB7 9E B0 00 19      [ 2]   54 	ldw y,txtbgn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      009EB9 4D               [ 1]   55 	tnz a 
      009EB9 06 44            [ 1]   56 	jreq search_ln_loop
      009EBB 57 52 49 54      [ 2]   57 	ldw y,basicptr 
      0022EB                         58 search_ln_loop:
      009EBF 45 00 2A 9E      [ 2]   59 	cpw y,txtend 
      009EC3 B9 10            [ 1]   60 	jrpl 8$
      009EC4 90 F3            [ 1]   61 	cpw x,(y)
      009EC4 45 44            [ 1]   62 	jreq 9$
      009EC6 52 45            [ 1]   63 	jrmi 8$ 
      009EC8 41 44 00         [ 1]   64 	ld a,(2,y)
      009ECB 28 9E            [ 1]   65 	ld (LB,sp),a 
      009ECD C4 F9 01         [ 2]   66 	addw y,(LL,sp)
      009ECE 20 EA            [ 2]   67 	jra search_ln_loop 
      002301                         68 8$: 
      009ECE 02               [ 1]   69 	clrw x 	
      009ECF 44               [ 1]   70 	exgw x,y 
      002303                         71 9$: _drop VSIZE
      009ED0 4F 00            [ 2]    1     addw sp,#VSIZE 
      009ED2 26               [ 1]   72 	exgw x,y   
      009ED3 9E               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      002307                         83 del_line: 
      002307                         84 	_vars VSIZE 
      009ED4 CE 04            [ 2]    1     sub sp,#VSIZE 
      009ED5 E6 02            [ 1]   85 	ld a,(2,x) ; line length
      009ED5 03 44            [ 1]   86 	ld (LLEN+1,sp),a 
      009ED7 45 43            [ 1]   87 	clr (LLEN,sp)
      009ED9 00 24            [ 1]   88 	ldw y,x  
      009EDB 9E D5 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      009EDD 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      009EDD 43 44 44 52      [ 2]   91 	ldw y,txtend 
      009EE1 00 22 9E         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      009EE4 DD CF 00 0C      [ 2]   93 	ldw acc16,y 
      009EE5 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      009EE5 06 44 41         [ 4]   95 	call move
      009EE8 54 41 4C 4E      [ 2]   96 	ldw y,txtend 
      009EEC 00 20 9E         [ 2]   97 	subw y,(LLEN,sp)
      009EEF E5 CF 00 1B      [ 2]   98 	ldw txtend,y  
      009EF0                         99 	_drop VSIZE     
      009EF0 04 44            [ 2]    1     addw sp,#VSIZE 
      009EF2 41               [ 4]  100 	ret 
                                    101 
                                    102 ;---------------------------------------------
                                    103 ; create a gap in text area to 
                                    104 ; move new line in this gap
                                    105 ; input:
                                    106 ;    X 			addr gap start 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                                    107 ;    Y 			gap length 
                                    108 ; output:
                                    109 ;    X 			addr gap start 
                                    110 ;--------------------------------------------
                           000001   111 	DEST=1
                           000003   112 	SRC=3
                           000005   113 	LEN=5
                           000006   114 	VSIZE=6 
      002334                        115 create_gap:
      002334                        116 	_vars VSIZE
      009EF3 54 41            [ 2]    1     sub sp,#VSIZE 
      009EF5 00 1E            [ 2]  117 	ldw (SRC,sp),x 
      009EF7 9E F0            [ 2]  118 	ldw (LEN,sp),y 
      009EF9 90 CF 00 0C      [ 2]  119 	ldw acc16,y 
      009EF9 43 43            [ 1]  120 	ldw y,x ; SRC
      009EFB 52 4C 00 1C      [ 2]  121 	addw x,acc16  
      009EFF 9E F9            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      009F01 CE 00 1B         [ 2]  124 	ldw x,txtend 
      009F01 43 43 52         [ 2]  125 	subw x,(SRC,sp)
      009F04 48 00 1A         [ 2]  126 	ldw acc16,x ; size to move
      009F07 9F 01            [ 2]  127 	ldw x,(DEST,sp) 
      009F09 CD 03 C5         [ 4]  128 	call move
      009F09 84 43 48         [ 2]  129 	ldw x,txtend
      009F0C 41 52 00         [ 2]  130 	addw x,(LEN,sp)
      009F0F 18 9F 09         [ 2]  131 	ldw txtend,x
      009F12                        132 9$:	_drop VSIZE 
      009F12 03 42            [ 2]    1     addw sp,#VSIZE 
      009F14 59               [ 4]  133 	ret 
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
      002360                        150 insert_line:
      002360                        151 	_vars VSIZE 
      009F15 45 00            [ 2]    1     sub sp,#VSIZE 
      009F17 16 9F 12         [ 2]  152 	ldw x,txtend  
      009F1A C3 00 19         [ 2]  153 	cpw x,txtbgn 
      009F1A 05 42            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      009F1C 54 4F 47         [ 2]  156 	ldw x,#2 
      009F1F 4C 00 14 9F      [ 4]  157 	ld a,([ptr16],x)
      009F23 1A 03            [ 1]  158 	cp a,#3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      009F24 27 5A            [ 1]  159 	jreq insert_ln_exit
      009F24 45               [ 1]  160 	clrw x 
      009F25 42               [ 1]  161 	ld xl,a
      009F26 54 45            [ 2]  162 	ldw (LLEN,sp),x 
      009F28 53 54 00         [ 2]  163 	ldw x,txtbgn
      009F2B 12 9F            [ 2]  164 	ldw (DEST,sp),x 
      009F2D 24 00 1B         [ 2]  165 	ldw x,txtend 
      009F2E 20 38            [ 2]  166 	jra 4$
      009F2E 04 42 53 45      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      009F32 54 00            [ 2]  169 	ldw (LINENO,sp),x 
      009F34 10 9F 2E         [ 2]  170 	ldw x,#2 
      009F37 72 D6 00 17      [ 4]  171 	ld a,([ptr16],x)
      009F37 04               [ 1]  172 	ld xl,a
                                    173 ; line length
      009F38 42 52            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      009F3A 45 53            [ 2]  176 	ldw x,(LINENO,sp)
      009F3C 00               [ 1]  177 	clr a 
      009F3D 0E 9F 37         [ 4]  178 	call search_lineno 
      009F40 5D               [ 2]  179 	tnzw x 
      009F40 43 42            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      009F42 49 54            [ 2]  183 	ldw (DEST,sp),y 
      009F44 00 0C            [ 2]  184 	jra 3$
                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      009F46 9F 40            [ 2]  187 2$: ldw (DEST,sp),x 
      009F48 CD 23 07         [ 4]  188 	call del_line
      0023A5                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      009F48 03 41            [ 1]  192 	ld a,#3
      009F4A 57 55            [ 1]  193 	cp a,(LLEN+1,sp)
      009F4C 00 0A            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      009F4E 9F 48            [ 2]  197 	ldw x,(DEST,sp)
      009F50 C3 00 1B         [ 2]  198 	cpw x,txtend 
      009F50 43 41            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      009F52 53 43            [ 2]  202 	ldw x,(DEST,sp)
      009F54 00 08            [ 2]  203 	ldw y,(LLEN,sp)
      009F56 9F 50 34         [ 4]  204 	call create_gap
      009F58 20 06            [ 2]  205 	jra 5$
      0023BB                        206 4$: 
      009F58 43 41 4E         [ 2]  207 	addw x,(LLEN,sp)
      009F5B 44 00 06         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      009F5E 9F 58            [ 2]  210 5$:	ldw x,(LLEN,sp)
      009F60 CF 00 0C         [ 2]  211 	ldw acc16,x 
      009F60 47 41 44 43      [ 2]  212 	ldw y,#pad ;SRC 
      009F64 52 45            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      009F66 41 44 00         [ 4]  214 	call move 
      0023CF                        215 insert_ln_exit:	
      0023CF                        216 	_drop VSIZE
      009F69 04 9F            [ 2]    1     addw sp,#VSIZE 
      009F6B 60               [ 4]  217 	ret
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
      009F6C                        233 parse_quote: 
      0023D2                        234 	_vars VSIZE 
      009F6C 05 41            [ 2]    1     sub sp,#VSIZE 
      009F6E 44               [ 1]  235 	clr a
      009F6F 43 4F            [ 1]  236 1$:	ld (PREV,sp),a 
      0023D7                        237 2$:	
      009F71 4E 00 02         [ 4]  238 	ld a,([in.w],y)
      009F74 27 24            [ 1]  239 	jreq 6$
      009F74 9F 6C 00 01      [ 1]  240 	inc in 
      009F76 6B 02            [ 1]  241 	ld (CURR,sp),a 
      009F76 43 41            [ 1]  242 	ld a,#'\
      009F78 42 53            [ 1]  243 	cp a, (PREV,sp)
      009F7A 00 00            [ 1]  244 	jrne 3$
      009F7C 0F 01            [ 1]  245 	clr (PREV,sp)
      009F7C 97 1E            [ 1]  246 	ld a,(CURR,sp)
      009F7E 93 47            [ 4]  247 	callr convert_escape
      009F80 93               [ 1]  248 	ld (x),a 
      009F81 83               [ 1]  249 	incw x 
      009F82 97 32            [ 2]  250 	jra 2$
      0023F2                        251 3$:
      009F84 96 0F            [ 1]  252 	ld a,(CURR,sp)
      009F86 96 CF            [ 1]  253 	cp a,#'\'
      009F88 99 80            [ 1]  254 	jreq 1$
      009F8A 90 D2            [ 1]  255 	cp a,#'"
      009F8C 90 C2            [ 1]  256 	jreq 6$ 
      009F8E 90               [ 1]  257 	ld (x),a 
      009F8F F3               [ 1]  258 	incw x 
      009F90 90 E3            [ 2]  259 	jra 2$
      002400                        260 6$:
      009F92 96               [ 1]  261 	clr (x)
      009F93 A8               [ 1]  262 	incw x 
      009F94 95 FD            [ 1]  263 	ldw y,x 
      009F96 9A               [ 1]  264 	clrw x 
      009F97 3A 9A            [ 1]  265 	ld a,#TK_QSTR  
      002407                        266 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      009F99 34 9A            [ 2]    1     addw sp,#VSIZE 
      009F9B 52               [ 4]  267 	ret 
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
      00240A                        278 convert_escape:
      009F9C 9A               [ 2]  279 	pushw x 
      009F9D 58 9A 2E         [ 2]  280 	ldw x,#escaped 
      009FA0 8E               [ 1]  281 1$:	cp a,(x)
      009FA1 47 99            [ 1]  282 	jreq 2$
      009FA3 A9               [ 1]  283 	tnz (x)
      009FA4 93 B7            [ 1]  284 	jreq 3$
      009FA6 93               [ 1]  285 	incw x 
      009FA7 E7 8F            [ 2]  286 	jra 1$
      009FA9 37 9A 4C         [ 2]  287 2$: subw x,#escaped 
      009FAC 92               [ 1]  288 	ld a,xl 
      009FAD F3 94            [ 1]  289 	add a,#7
      009FAF AF               [ 2]  290 3$:	popw x 
      009FB0 97               [ 4]  291 	ret 
                                    292 
      009FB1 AC 94 DC 91 4E 92 59   293 escaped:: .asciz "abtnvfr"
             92
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
      002427                        310 parse_integer: ; { -- n }
      009FB9 3E               [ 2]  311 	pushw x 	
      009FBA 96 4B            [ 1]  312 	push #0 ; TCHAR
      009FBC 8E 42            [ 1]  313 	push #10 ; BASE=10
      009FBE 9A 28            [ 1]  314 	cp a,#'$
      009FC0 91 3A            [ 1]  315 	jrne 2$ 
      002430                        316     _drop #1
      009FC2 90 27            [ 2]    1     addw sp,##1 
      009FC4 99 9A            [ 1]  317 	push #16  ; BASE=16
      009FC6 99               [ 1]  318 2$:	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      009FC7 2A               [ 1]  319 	incw x 
      009FC8 99 60 96         [ 4]  320 	ld a,([in.w],y)
      009FCB 36 8E 6F 8E      [ 1]  321 	inc in 
      009FCF A2 99 65         [ 4]  322 	call to_upper 
      009FD2 97 7A            [ 1]  323 	ld (TCHAR,sp),a 
      009FD4 8B E6 91         [ 4]  324 	call is_digit 
      009FD7 CE 94            [ 1]  325 	jrc 2$
      009FD9 6E 99            [ 1]  326 	ld a,#16 
      009FDB 1D 9A            [ 1]  327 	cp a,(BASE,sp)
      009FDD 22 97            [ 1]  328 	jrne 3$ 
      009FDF 4A 9B            [ 1]  329 	ld a,(TCHAR,sp)
      009FE1 E6 96            [ 1]  330 	cp a,#'A 
      009FE3 BC 97            [ 1]  331 	jrmi 3$ 
      009FE5 B8 91            [ 1]  332 	cp a,#'G 
      009FE7 29 9A            [ 1]  333 	jrmi 2$ 
      009FE9 46 91 1A 9A      [ 1]  334 3$: dec in 	
      009FED 40               [ 1]  335     clr (x)
      009FEE 8F A1            [ 2]  336 	ldw x,(XSAVE,sp)
      009FF0 99 EC 99         [ 4]  337 	call atoi24
      009FF3 F2 99            [ 1]  338 	ldw y,x 
      009FF5 F8 99 FE         [ 2]  339 	ldw x,acc16 
      009FF8 9A 04            [ 1]  340 	ld a,#TK_INTGR
      009FFA 9A 0A            [ 2]  341 	ldw (y),x 
      009FFC 9A 10 9A 16      [ 2]  342 	addw y,#2
      00246E                        343 	_drop VSIZE  
      00A000 9A 1C            [ 2]    1     addw sp,#VSIZE 
      00A002 96               [ 4]  344 	ret 	
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
      002471                        361 parse_binary: ; { -- n }
      00A003 3E 9A            [ 1]  362 	push #0
      00A005 D5 84            [ 1]  363 	push #0
      00A007 FE 90            [ 1]  364 	push #0
      002477                        365 2$:	
      00A009 97 9A 86         [ 4]  366 	ld a,([in.w],y)
      00A00C 92 79 98 34      [ 1]  367 	inc in 
      00A010 97 93            [ 1]  368 	cp a,#'0 
      00A012 92 97            [ 1]  369 	jreq 3$
      00A014 8E 01            [ 1]  370 	cp a,#'1 
      00A016 8E 4C            [ 1]  371 	jreq 3$ 
      00A018 96 B1            [ 2]  372 	jra bin_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A01A 9B C7            [ 1]  373 3$: sub a,#'0 
      00A01C 9B               [ 1]  374 	rrc a
      00A01D 2F 9B            [ 1]  375 	rlc (BINARY+2,sp) 
      00A01F CF 9B            [ 1]  376 	rlc (BINARY+1,sp)
      00A021 A7 91            [ 1]  377 	rlc (BINARY,sp) 
      00A023 A7 94            [ 2]  378 	jra 2$  
      002493                        379 bin_exit:
      00A025 22 97 18 99      [ 1]  380 	dec in 
      00A029 01 99            [ 1]  381 	ldw y,x
      00A02B 10 91            [ 1]  382 	ld a,(BINARY,sp)
      00A02D 77 93 03         [ 1]  383 	ld acc24,a 
      00A030 8E 65            [ 2]  384 	ldw x,(BINARY+1,sp)
      00A032 96 75 99         [ 2]  385 	ldw acc16,x
      00A035 BE 96            [ 2]  386 	ldw (y),x 
      00A037 8B 90 9D 98      [ 2]  387 	addw y,#2  
      00A03B 9B 95            [ 1]  388 	ld a,#TK_INTGR 	
      0024AB                        389 	_drop VSIZE 
      00A03D C6 97            [ 2]    1     addw sp,#VSIZE 
      00A03F 62               [ 4]  390 	ret
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
      0024AE                        406 parse_keyword: 
      00A040 00               [ 2]  407 	pushw x 
      0024AF                        408 kw_loop:	
      00A041 00 43 81         [ 4]  409 	call to_upper 
      00A044 44               [ 1]  410 	ld (x),a 
      00A045 80               [ 1]  411 	incw x 
      00A046 48 82 46         [ 4]  412 	ld a,([in.w],y)
      00A049 83 33 84 00      [ 1]  413 	inc in 
      00A04D 00 04 15         [ 4]  414 	call is_alpha 
      00A04E 25 EF            [ 1]  415 	jrc kw_loop
      00A04E CD 83 51 A1      [ 1]  416 	dec in   
      00A052 5B               [ 1]  417 1$: clr (x)
      00A053 27 02            [ 2]  418 	ldw x,(XFIRST,sp) 
      00A055 4F 81            [ 1]  419 	ld a,(1,x)
      00A057 CD 83            [ 1]  420 	jrne 2$
                                    421 ; one letter variable name 
      00A059 51               [ 1]  422 	ld a,(x) 
      00A05A AE A0            [ 1]  423 	sub a,#'A 
      00A05C 42               [ 1]  424 	sll a 
      00A05D 88               [ 1]  425 	push a 
      00A05D F1 27            [ 1]  426 	push #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A05F 08 1C 00         [ 2]  427 	ldw x,#vars 
      00A062 02 7D 26         [ 2]  428 	addw x,(1,sp) ; X=var address 
      0024D8                        429 	_drop 2 
      00A065 F7 4F            [ 2]    1     addw sp,#2 
      00A067 81 5C            [ 1]  430 	ld a,#TK_VAR 
      00A069 F6 A1            [ 2]  431 	jra 4$ 
      0024DE                        432 2$: ; check for keyword, otherwise syntax error.
      0024DE                        433 	_ldx_dict kword_dict ; dictionary entry point
      00A06B 84 26 05         [ 2]    1     ldw x,#kword_dict+2
      00A06E 88 CD            [ 2]  434 	ldw y,(XFIRST,sp) ; name to search for
      00A070 83 51 84         [ 4]  435 	call search_dict
      00A073 4D               [ 1]  436 	tnz a
      00A073 81 03            [ 1]  437 	jrne 4$ 
      00A074 CC 07 39         [ 2]  438 	jp syntax_error
      0024EC                        439 4$:	
      00A074 F6 27            [ 2]  440 	ldw y,(XFIRST,sp)
      00A076 06 CD 83         [ 2]  441 	cpw x,#LET_IDX 
      00A079 41 5C            [ 1]  442 	jreq 5$  ; don't compile LET command 
      00A07B 20 F7            [ 1]  443 	ld (y),a 
      00A07D 81 5C            [ 1]  444 	incw y 
      00A07E 90 FF            [ 2]  445 	ldw (y),x
      00A07E A6 08 CD 83      [ 2]  446 	addw y,#2  
      0024FD                        447 5$:	_drop VSIZE 
      00A082 41 A6            [ 2]    1     addw sp,#VSIZE 
      00A084 20               [ 4]  448 	ret  	
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
      002500                        459 skip:
      00A085 CD               [ 1]  460 	push a
      00A086 83 41 A6         [ 4]  461 1$:	ld a,([in.w],y)
      00A089 08 CD            [ 1]  462 	jreq 2$
      00A08B 83 41            [ 1]  463 	cp a,(C,sp)
      00A08D 81 06            [ 1]  464 	jrne 2$
      00A08E 72 5C 00 01      [ 1]  465 	inc in
      00A08E 88 0D            [ 2]  466 	jra 1$
      002510                        467 2$: _drop 1 
      00A090 01 27            [ 2]    1     addw sp,#1 
      00A092 07               [ 4]  468 	ret
                                    469 	
                                    470 
                                    471 ;------------------------------------
                                    472 ; scan text for next token
                                    473 ; input: 
                                    474 ;	X 		pointer to buffer where 
                                    475 ;	        token id and value are copied 
                                    476 ; use:
                                    477 ;	Y   pointer to text in tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
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
      002513                        493 get_token:: 
      002513                        494 	_vars VSIZE
      00A093 CD A0            [ 2]    1     sub sp,#VSIZE 
                                    495 ;	ld a,in 
                                    496 ;	sub a,count
                                    497 ;   jrmi 0$
                                    498 ;	clr a 
                                    499 ;	ret 
      002515                        500 0$: 
      00A095 7E 0A 01 20      [ 2]  501 	ldw y,#tib    	
      00A099 F5 84            [ 1]  502 	ld a,#SPACE
      00A09B 81 25 00         [ 4]  503 	call skip
      00A09C 55 00 01 00 02   [ 1]  504 	mov in.saved,in 
      00A09C A6 1B CD         [ 4]  505 	ld a,([in.w],y)
      00A09F 83 41            [ 1]  506 	jrne 1$
      00A0A1 A6 5B            [ 1]  507 	ldw y,x 
      00A0A3 CD 83 41         [ 2]  508 	jp token_exit ; end of line 
      00A0A6 81 5C 00 01      [ 1]  509 1$:	inc in 
      00A0A7 CD 09 8F         [ 4]  510 	call to_upper 
      00A0A7 89 5F            [ 1]  511 	ld (TCHAR,sp),a 
                                    512 ; check for quoted string
      002536                        513 str_tst:  	
      002536                        514 	_case '"' nbr_tst
      00A0A9 97 A6            [ 1]    1 	ld a,#'"' 
      00A0AB 0A 62            [ 1]    2 	cp a,(TCHAR,sp) 
      00A0AD 95 9F            [ 1]    3 	jrne nbr_tst
      00A0AF 4D 27            [ 1]  515 	ld a,#TK_QSTR
      00A0B1 0B               [ 1]  516 	ld (x),a 
      00A0B2 A1               [ 1]  517 	incw x 
      00A0B3 09 23 02         [ 4]  518 	call parse_quote
      00A0B6 A6 39 CF         [ 2]  519 	jp token_exit
      00A0B8                        520 nbr_tst:
                                    521 ; check for hexadecimal number 
      00A0B8 AB 30            [ 1]  522 	ld a,#'$'
      00A0BA CD 83            [ 1]  523 	cp a,(TCHAR,sp) 
      00A0BC 41 9E            [ 1]  524 	jreq 1$
                                    525 ;check for binary number 
      00A0BE AB 30            [ 1]  526 	ld a,#'&
      00A0C0 CD 83            [ 1]  527 	cp a,(TCHAR,sp)
      00A0C2 41 85            [ 1]  528 	jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A0C4 81 84            [ 1]  529 	ld a,#TK_INTGR
      00A0C5 F7               [ 1]  530 	ld (x),a 
      00A0C5 88               [ 1]  531 	incw x 
      00A0C6 CD A0 9C         [ 4]  532 	call parse_binary ; expect binary integer 
      00A0C9 84 CD A0         [ 2]  533 	jp token_exit 
                                    534 ; check for decimal number 	
      00A0CC A7 A6            [ 1]  535 0$:	ld a,(TCHAR,sp)
      00A0CE 44 CD 83         [ 4]  536 	call is_digit
      00A0D1 41 81            [ 1]  537 	jrnc 3$
      00A0D3 A6 84            [ 1]  538 1$:	ld a,#TK_INTGR 
      00A0D3 88               [ 1]  539 	ld (x),a 
      00A0D4 CD               [ 1]  540 	incw x 
      00A0D5 A0 9C            [ 1]  541 	ld a,(TCHAR,sp)
      00A0D7 84 CD A0         [ 4]  542 	call parse_integer 
      00A0DA A7 A6 43         [ 2]  543 	jp token_exit 
      00256F                        544 3$: 
      00256F                        545 	_case '(' bkslsh_tst 
      00A0DD CD 83            [ 1]    1 	ld a,#'(' 
      00A0DF 41 81            [ 1]    2 	cp a,(TCHAR,sp) 
      00A0E1 26 05            [ 1]    3 	jrne bkslsh_tst
      00A0E1 A6 20            [ 1]  546 	ld a,#TK_LPAREN
      00A0E3 5D 27 06         [ 2]  547 	jp token_char   	
      00257A                        548 bkslsh_tst: ; character token 
      00257A                        549 	_case '\',rparnt_tst
      00A0E6 CD 83            [ 1]    1 	ld a,#'\' 
      00A0E8 41 5A            [ 1]    2 	cp a,(TCHAR,sp) 
      00A0EA 20 F7            [ 1]    3 	jrne rparnt_tst
      00A0EC A6 03            [ 1]  550 	ld a,#TK_CHAR 
      00A0EC 81               [ 1]  551 	ld (x),a 
      00A0ED 5C               [ 1]  552 	incw x 
      00A0ED 52 06 6B         [ 4]  553 	ld a,([in.w],y)
      00A0F0 02               [ 1]  554 	ld (x),a 
      00A0F1 9E               [ 1]  555 	incw x
      00A0F2 6B 01            [ 1]  556 	ldw y,x 	 
      00A0F4 9F 6B 03 93      [ 1]  557 	inc in  
      00A0F8 5C               [ 1]  558 	clrw x 
      00A0F9 7B               [ 1]  559 	ld xl,a 
      00A0FA 03 10            [ 1]  560 	ld a,#TK_CHAR 
      00A0FC 01 4C C7         [ 2]  561 	jp token_exit 
      002596                        562 rparnt_tst:		
      002596                        563 	_case ')' colon_tst 
      00A0FF 00 0E            [ 1]    1 	ld a,#')' 
      00A101 72 5F            [ 1]    2 	cp a,(TCHAR,sp) 
      00A103 00 0D            [ 1]    3 	jrne colon_tst
      00A105 CD 84            [ 1]  564 	ld a,#TK_RPAREN 
      00A107 45 90 AE         [ 2]  565 	jp token_char
      0025A1                        566 colon_tst:
      0025A1                        567 	_case ':' comma_tst 
      00A10A 16 90            [ 1]    1 	ld a,#':' 
      00A10C 7B 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A10E C7 00            [ 1]    3 	jrne comma_tst
      00A110 0E 72            [ 1]  568 	ld a,#TK_COLON 
      00A112 B9 00 0D         [ 2]  569 	jp token_char  
      0025AC                        570 comma_tst:
      0025AC                        571 	_case COMMA sharp_tst 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A115 7B 02            [ 1]    1 	ld a,#COMMA 
      00A117 90 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      00A119 90 5C            [ 1]    3 	jrne sharp_tst
      00A11B 7B 01            [ 1]  572 	ld a,#TK_COMMA
      00A11D CD A0 C5         [ 2]  573 	jp token_char
      0025B7                        574 sharp_tst:
      0025B7                        575 	_case SHARP dash_tst 
      00A120 AE 16            [ 1]    1 	ld a,#SHARP 
      00A122 90 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      00A124 A0 74            [ 1]    3 	jrne dash_tst
      00A126 7B 03            [ 1]  576 	ld a,#TK_SHARP
      00A128 10 01 CD         [ 2]  577 	jp token_char  	 	 
      0025C2                        578 dash_tst: 	
      0025C2                        579 	_case '-' at_tst 
      00A12B A0 C5            [ 1]    1 	ld a,#'-' 
      00A12D 5B 06            [ 1]    2 	cp a,(TCHAR,sp) 
      00A12F 81 05            [ 1]    3 	jrne at_tst
      00A130 A6 11            [ 1]  580 	ld a,#TK_MINUS  
      00A130 52 02 6B         [ 2]  581 	jp token_char 
      0025CD                        582 at_tst:
      0025CD                        583 	_case '@' qmark_tst 
      00A133 02 9F            [ 1]    1 	ld a,#'@' 
      00A135 6B 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00A137 93 90            [ 1]    3 	jrne qmark_tst
      00A139 5C 7B            [ 1]  584 	ld a,#TK_ARRAY 
      00A13B 02 10 01         [ 2]  585 	jp token_char
      0025D8                        586 qmark_tst:
      0025D8                        587 	_case '?' tick_tst 
      00A13E 4C C7            [ 1]    1 	ld a,#'?' 
      00A140 00 0E            [ 1]    2 	cp a,(TCHAR,sp) 
      00A142 72 5F            [ 1]    3 	jrne tick_tst
      00A144 00 0D            [ 1]  588 	ld a,#TK_CMD  
      00A146 CD               [ 1]  589 	ld (x),a 
      00A147 84               [ 1]  590 	incw x 
      00A148 45 90            [ 1]  591 	ldw y,x 
      00A14A AE 16 90         [ 2]  592 	ldw x,#PRT_IDX 
      00A14D 7B 01            [ 2]  593 	ldw (y),x 
      00A14F C7 00 0E 72      [ 2]  594 	addw y,#2
      00A153 B9 00 0D         [ 2]  595 	jp token_exit
      0025F0                        596 tick_tst: ; comment 
      0025F0                        597 	_case TICK plus_tst 
      00A156 93 CD            [ 1]    1 	ld a,#TICK 
      00A158 A0 74            [ 1]    2 	cp a,(TCHAR,sp) 
      00A15A A6 20            [ 1]    3 	jrne plus_tst
      00A15C CD 83            [ 1]  598 	ld a,#TK_CMD
      00A15E 41               [ 1]  599 	ld (x),a 
      00A15F 7B               [ 1]  600 	incw x
      00A160 02 10 01 CD      [ 2]  601 	ldw y,#REM_IDX
      00A164 A0               [ 2]  602 	ldw (x),y 
      00A165 C5 0A 02         [ 2]  603 	addw x,#2  
      002602                        604 copy_comment:
      00A168 5B 02 81 90      [ 2]  605 	ldw y,#tib 
      00A16B 72 B9 00 00      [ 2]  606 	addw y,in.w
      00A16B CD A0            [ 2]  607 	pushw y
      00A16D 9C A6 32         [ 4]  608 	call strcpy
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A170 CD 83 41         [ 2]  609     subw y,(1,sp)
      00A173 A6 4B            [ 1]  610 	ld a,yl 
      00A175 CD 83 41         [ 1]  611 	add a,in
      00A178 81 00 01         [ 1]  612 	ld in,a 
      00A179 1F 01            [ 2]  613 	ldw (1,sp),x
      00A179 52 04 5F         [ 2]  614 	addw y,(1,sp)
      00A17C 1F 02            [ 1]  615 	incw y 
      002621                        616 	_drop 2 
      00A17E 1F 03            [ 2]    1     addw sp,#2 
      00A180 03 04 90         [ 2]  617 	ldw x,#REM_IDX 
      00A183 AE 16            [ 1]  618 	ld a,#TK_CMD 
      00A185 90 26 CF         [ 2]  619 	jp token_exit 
      00A186                        620 plus_tst:
      00262B                        621 	_case '+' star_tst 
      00A186 CD 83            [ 1]    1 	ld a,#'+' 
      00A188 51 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      00A18A 01 A1            [ 1]    3 	jrne star_tst
      00A18C 1B 26            [ 1]  622 	ld a,#TK_PLUS  
      00A18E 05 CD A0         [ 2]  623 	jp token_char 
      002636                        624 star_tst:
      002636                        625 	_case '*' slash_tst 
      00A191 4E 6B            [ 1]    1 	ld a,#'*' 
      00A193 01 A1            [ 1]    2 	cp a,(TCHAR,sp) 
      00A195 0D 26            [ 1]    3 	jrne slash_tst
      00A197 03 CC            [ 1]  626 	ld a,#TK_MULT 
      00A199 A3 22 A1         [ 2]  627 	jp token_char 
      002641                        628 slash_tst: 
      002641                        629 	_case '/' prcnt_tst 
      00A19C 0A 26            [ 1]    1 	ld a,#'/' 
      00A19E 03 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      00A1A0 A3 22            [ 1]    3 	jrne prcnt_tst
      00A1A2 A6 21            [ 1]  630 	ld a,#TK_DIV 
      00A1A2 A1 08 26         [ 2]  631 	jp token_char 
      00264C                        632 prcnt_tst:
      00264C                        633 	_case '%' eql_tst 
      00A1A5 12 0D            [ 1]    1 	ld a,#'%' 
      00A1A7 03 27            [ 1]    2 	cp a,(TCHAR,sp) 
      00A1A9 DC A6            [ 1]    3 	jrne eql_tst
      00A1AB 01 CD            [ 1]  634 	ld a,#TK_MOD
      00A1AD A0 C5 0A         [ 2]  635 	jp token_char  
                                    636 ; 1 or 2 character tokens 	
      002657                        637 eql_tst:
      002657                        638 	_case '=' gt_tst 		
      00A1B0 03 90            [ 1]    1 	ld a,#'=' 
      00A1B2 5A 7B            [ 1]    2 	cp a,(TCHAR,sp) 
      00A1B4 03 CC            [ 1]    3 	jrne gt_tst
      00A1B6 A2 CE            [ 1]  639 	ld a,#TK_EQUAL
      00A1B8 CC 26 CB         [ 2]  640 	jp token_char 
      002662                        641 gt_tst:
      002662                        642 	_case '>' lt_tst 
      00A1B8 A1 04            [ 1]    1 	ld a,#'>' 
      00A1BA 26 1A            [ 1]    2 	cp a,(TCHAR,sp) 
      00A1BC CD A1            [ 1]    3 	jrne lt_tst
      00A1BE 6B 7B            [ 1]  643 	ld a,#TK_GT 
      00A1C0 03 4C            [ 1]  644 	ld (ATTRIB,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A1C2 CD A0 C5         [ 4]  645 	ld a,([in.w],y)
      00A1C5 A6 3E CD 83      [ 1]  646 	inc in 
      00A1C9 41 90            [ 1]  647 	cp a,#'=
      00A1CB AE 16            [ 1]  648 	jrne 1$
      00A1CD 90 90            [ 1]  649 	ld a,#TK_GE 
      00A1CF 7F 0F            [ 2]  650 	jra token_char  
      00A1D1 02 0F            [ 1]  651 1$: cp a,#'<
      00A1D3 03 20            [ 1]  652 	jrne 2$
      00A1D5 B0 35            [ 1]  653 	ld a,#TK_NE 
      00A1D6 20 48            [ 2]  654 	jra token_char 
      00A1D6 A1 12 26 21      [ 1]  655 2$: dec in
      00A1DA 0D 02            [ 1]  656 	ld a,(ATTRIB,sp)
      00A1DC 26 A8            [ 2]  657 	jra token_char 	 
      00268B                        658 lt_tst:
      00268B                        659 	_case '<' other
      00A1DE AE 16            [ 1]    1 	ld a,#'<' 
      00A1E0 90 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      00A1E2 84 1B            [ 1]    3 	jrne other
      00A1E4 90 AE            [ 1]  660 	ld a,#TK_LT 
      00A1E6 16 90            [ 1]  661 	ld (ATTRIB,sp),a 
      00A1E8 27 9C 6B         [ 4]  662 	ld a,([in.w],y)
      00A1EB 02 6B 03 AE      [ 1]  663 	inc in 
      00A1EF 16 90            [ 1]  664 	cp a,#'=
      00A1F1 CD A0            [ 1]  665 	jrne 1$
      00A1F3 74 0F            [ 1]  666 	ld a,#TK_LE 
      00A1F5 01 72            [ 2]  667 	jra token_char 
      00A1F7 F9 01            [ 1]  668 1$: cp a,#'>
      00A1F9 20 8B            [ 1]  669 	jrne 2$
      00A1FB A6 35            [ 1]  670 	ld a,#TK_NE 
      00A1FB A1 05            [ 2]  671 	jra token_char 
      00A1FD 26 49 AE 16      [ 1]  672 2$: dec in 
      00A201 90 CD            [ 1]  673 	ld a,(ATTRIB,sp)
      00A203 8A 1B            [ 2]  674 	jra token_char 	
      0026B4                        675 other: ; not a special character 	 
      00A205 CE 00            [ 1]  676 	ld a,(TCHAR,sp)
      00A207 0D CD A3         [ 4]  677 	call is_alpha 
      00A20A 5C 5D            [ 1]  678 	jrc 30$ 
      00A20C 26 0B 0F         [ 2]  679 	jp syntax_error 
      0026BE                        680 30$: 
      00A20F 02 90 AE         [ 4]  681 	call parse_keyword
      00A212 16 90 90         [ 2]  682 	cpw x,#remark 
      00A215 7F CC            [ 1]  683 	jrne token_exit 
      00A217 A3 22            [ 1]  684 	ldw y,x 
      00A219 CC 26 02         [ 2]  685 	jp copy_comment 
      0026CB                        686 token_char:
      00A219 CF               [ 1]  687 	ld (x),a 
      00A21A 00               [ 1]  688 	incw x
      00A21B 05 E6            [ 1]  689 	ldw y,x 
      0026CF                        690 token_exit:
      0026CF                        691 	_drop VSIZE 
      00A21D 02 C7            [ 2]    1     addw sp,#VSIZE 
      00A21F 00               [ 4]  692 	ret
                                    693 
                                    694 
                                    695 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
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
      0026D2                        712 compile::
      0026D2                        713 	_vars VSIZE 
      00A220 04 90            [ 2]    1     sub sp,#VSIZE 
      00A222 AE 16 90 CD A8   [ 1]  714 	mov basicptr,txtbgn
      00A227 6D 0F 01 A6      [ 1]  715 	bset flags,#FCOMP 
      00A22B 0D CD            [ 1]  716 	ld a,#0
      00A22D 83 41 A6         [ 2]  717 	ldw x,#0
      00A230 3E CD 83         [ 2]  718 	ldw pad,x ; destination buffer 
      00A233 41 AE 16         [ 1]  719 	ld pad+2,a ; count 
      00A236 90 CD 84         [ 2]  720 	ldw x,#pad+3
      00A239 1B 6B 02 CD      [ 1]  721 	clr in 
      00A23D A0 74 90         [ 4]  722 	call get_token
      00A240 93 7B            [ 1]  723 	cp a,#TK_INTGR
      00A242 02 6B            [ 1]  724 	jrne 2$
      00A244 03 CC A1         [ 2]  725 	cpw x,#1 
      00A247 86 05            [ 1]  726 	jrpl 1$
      00A248 A6 0A            [ 1]  727 	ld a,#ERR_BAD_VALUE
      00A248 A1 81 26         [ 2]  728 	jp tb_error
      00A24B 15 7B 03         [ 2]  729 1$:	ldw pad,x 
      00A24E 11 02 2B 03      [ 2]  730 	ldw y,#pad+3 
      00A252 CC A1 86 60      [ 2]  731 2$:	cpw y,#stack_full 
      00A255 25 05            [ 1]  732 	jrult 3$
      00A255 A6 01            [ 1]  733 	ld a,#ERR_BUF_FULL 
      00A257 CD A0 D3         [ 2]  734 	jp tb_error 
      002712                        735 3$:	
      00A25A 0C               [ 1]  736 	ldw x,y 
      00A25B 03 90 5C         [ 4]  737 	call get_token 
      00A25E CC A1            [ 1]  738 	cp a,#TK_NONE 
      00A260 86 A1            [ 1]  739 	jrne 2$ 
                                    740 ; compilation completed  
      00A262 80 26 13 0D      [ 2]  741 	subw y,#pad
      00A266 03 26            [ 1]  742     ld a,yl
      00A268 03 CC A1         [ 2]  743 	ldw x,#pad 
      00A26B 86 00 17         [ 2]  744 	ldw ptr16,x 
      00A26C E7 02            [ 1]  745 	ld (2,x),a 
      00A26C A6               [ 2]  746 	ldw x,(x)
      00A26D 01 CD            [ 1]  747 	jreq 10$
      00A26F A0 C5 0A         [ 4]  748 	call insert_line
      00A272 03 90 5A CC      [ 1]  749 	clr  count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A276 A1 86            [ 2]  750 	jra  11$ 
      002734                        751 10$: ; line# is zero 
      00A278 A1 82 26         [ 2]  752 	ldw x,ptr16  
      00A27B 0E 7B 03         [ 2]  753 	ldw basicptr,x 
      00A27E CD A0            [ 1]  754 	ld a,(2,x)
      00A280 C5 0F 03         [ 1]  755 	ld count,a 
      00A283 90 AE 16 90      [ 1]  756 	mov in,#3 
      002743                        757 11$:
      002743                        758 	_drop VSIZE 
      00A287 CC A1            [ 2]    1     addw sp,#VSIZE 
      00A289 86 A1 83 26      [ 1]  759 	bres flags,#FCOMP 
      00A28D 26               [ 4]  760 	ret 
                                    761 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
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
      00274A                         47 cpy_cmd_name:
      00A28E 7B               [ 1]   48 	ld a,(x)
      00A28F 03               [ 1]   49 	incw x
      00A290 11 02            [ 1]   50 	and a,#15  
      00A292 26               [ 1]   51 	push a 
      00A293 03 CC            [ 1]   52     tnz (1,sp) 
      00A295 A1 86            [ 1]   53 	jreq 9$
      00A297 F6               [ 1]   54 1$:	ld a,(x)
      00A297 7B 02            [ 1]   55 	ld (y),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00A299 10               [ 1]   56 	incw x
      00A29A 03 CD            [ 1]   57 	incw y 
      00A29C A0 D3            [ 1]   58 	dec (1,sp)	 
      00A29E 7B 02            [ 1]   59 	jrne 1$
      00A2A0 6B               [ 1]   60 9$: pop a 
      00A2A1 03               [ 4]   61 	ret	
                                     62 
                                     63 ;--------------------------
                                     64 ; add a space after letter or 
                                     65 ; digit.
                                     66 ; input:
                                     67 ;   Y     pointer to buffer 
                                     68 ; output:
                                     69 ;   Y    moved to end 
                                     70 ;--------------------------
      00275F                         71 add_space:
      00A2A2 90 AE            [ 2]   72 	decw y 
      00A2A4 16 90            [ 1]   73 	ld a,(y)
      00A2A6 72 5F            [ 1]   74 	incw y
      00A2A8 00 0D C7         [ 4]   75 	call is_alnum 
      00A2AB 00 0E            [ 1]   76 	jrnc 1$
      00A2AD 72 B9            [ 1]   77 	ld a,#SPACE 
      00A2AF 00 0D            [ 1]   78 	ld (y),a 
      00A2B1 CC A1            [ 1]   79 	incw y 
      00A2B3 86               [ 4]   80 1$: ret 
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
      002771                         92 right_align::
      00A2B4 A1               [ 1]   93 	push a 
      00A2B5 0F 26            [ 1]   94 0$: ld a,(1,sp)
      00A2B7 0C 03 04         [ 1]   95 	cp a,tab_width 
      00A2BA 90 89            [ 1]   96 	jrpl 1$
      00A2BC CD 92            [ 1]   97 	ld a,#SPACE 
      00A2BE FA               [ 2]   98 	decw x
      00A2BF 90               [ 1]   99 	ld (x),a  
      00A2C0 85 CC            [ 1]  100 	inc (1,sp)
      00A2C2 A1 86            [ 2]  101 	jra 0$ 
      00A2C4 A1               [ 1]  102 1$: pop a 	
      00A2C5 84               [ 4]  103 	ret 
                                    104 
                                    105 ;--------------------------
                                    106 ; print TK_QSTR
                                    107 ; converting control character
                                    108 ; to backslash sequence
                                    109 ; input:
                                    110 ;   X        char *
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                                    111 ;   Y        dest. buffer 
                                    112 ; output:
                                    113 ;   X        moved forward 
                                    114 ;   Y        moved forward 
                                    115 ;-----------------------------
      002783                        116 cpy_quote:
      00A2C6 26 11            [ 1]  117 	ld a,#'"
      00A2C8 7B 03            [ 1]  118 	ld (y),a 
      00A2CA 11 02            [ 1]  119 	incw y 
      00A2CC 2A               [ 1]  120 1$:	ld a,(x)
      00A2CD 08 30            [ 1]  121 	jreq 9$
      00A2CE 5C               [ 1]  122 	incw x 
      00A2CE 97 7B            [ 1]  123 	cp a,#SPACE 
      00A2D0 02 CD            [ 1]  124 	jrult 3$
      00A2D2 A1 30            [ 1]  125 	ld (y),a
      00A2D4 0A 02            [ 1]  126 	incw y 
      00A2D6 A1 5C            [ 1]  127 	cp a,#'\ 
      00A2D6 CC A1            [ 1]  128 	jrne 1$ 
      002799                        129 2$:
      00A2D8 86 F7            [ 1]  130 	ld (y),a
      00A2D9 90 5C            [ 1]  131 	incw y  
      00A2D9 A1 20            [ 2]  132 	jra 1$
      00A2DB 2A               [ 1]  133 3$: push a 
      00A2DC 03 CC            [ 1]  134 	ld a,#'\
      00A2DE A1 86            [ 1]  135 	ld (y),a 
      00A2E0 90 5C            [ 1]  136 	incw y  
      00A2E0 A6               [ 1]  137 	pop a 
      00A2E1 4F 11            [ 1]  138 	sub a,#7
      00A2E3 02 2A 03         [ 1]  139 	ld acc8,a 
      00A2E6 CC A1 86 0D      [ 1]  140 	clr acc16
      00A2EA 04               [ 2]  141 	pushw x
      00A2EB 26 18 7B         [ 2]  142 	ldw x,#escaped 
      00A2EE 03 11 02 27      [ 2]  143 	addw x,acc16 
      00A2F2 12               [ 1]  144 	ld a,(x)
      00A2F3 7B               [ 2]  145 	popw x
      00A2F4 02 97            [ 2]  146 	jra 2$
      00A2F6 7B 03            [ 1]  147 9$: ld a,#'"
      00A2F8 95 7B            [ 1]  148 	ld (y),a 
      00A2FA 01 CD            [ 1]  149 	incw y  
      00A2FC A0               [ 1]  150 	incw x 
      00A2FD ED               [ 4]  151 	ret
                                    152 
                                    153 ;--------------------------
                                    154 ; return variable name 
                                    155 ; from its address.
                                    156 ; input:
                                    157 ;   X    variable address
                                    158 ; output:
                                    159 ;   A     variable letter
                                    160 ;--------------------------
      0027C4                        161 var_name::
      00A2FE 0C 02 0C         [ 2]  162 		subw x,#vars 
      00A301 03               [ 1]  163 		ld a,xl 
      00A302 CC               [ 1]  164 		srl a 
      00A303 A1 86            [ 1]  165 		add a,#'A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A305 81               [ 4]  166 		ret 
                                    167 
                                    168 ;-----------------------------
                                    169 ; return cmd  idx from its 
                                    170 ; code address 
                                    171 ; input:
                                    172 ;   X      code address 
                                    173 ; output:
                                    174 ;   X      cmd_idx
                                    175 ;-----------------------------
      0027CC                        176 get_cmd_idx:
      00A305 7B 01            [ 2]  177 	pushw y
      00A307 90 F7 90 5C      [ 2]  178 	ldw y,#code_addr 
      00A30B CD 83 41 7B      [ 2]  179 	ldw ptr16,y 
      00A30F 03 11            [ 1]  180 	clrw y 
      00A311 02 2B 09         [ 5]  181 1$:	cpw x,([ptr16],y)
      00A314 90 7F            [ 1]  182 	jreq 3$ 
      00A316 0C 02            [ 1]  183 	incw y 
      00A318 0C 03 CC         [ 4]  184 	ld a,([ptr16],y)
      00A31B A1 86            [ 1]  185 	incw y
      00A31D 91 DA 17         [ 4]  186 	or a,([ptr16],y)	
      00A31D 0C 03            [ 1]  187 	jrne 1$
      00A31F CC               [ 1]  188 3$: ldw x,y 
      00A320 A1 86            [ 2]  189 	popw y 
      00A322 81               [ 4]  190 	ret
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
      0027ED                        206 decompile::
      0027ED                        207 	_vars VSIZE
      00A322 90 AE            [ 2]    1     sub sp,#VSIZE 
      00A324 16 90 0F         [ 1]  208 	ld a,base
      00A327 01 72            [ 1]  209 	ld (BASE_SAV,sp),a  
      00A329 F9 01 90         [ 1]  210 	ld a,tab_width 
      00A32C 7F 7B            [ 1]  211 	ld (WIDTH_SAV,sp),a 
      00A32E 02 C7            [ 2]  212 	ldw (STR,sp),y   
      00A330 00 04 A6 0D      [ 5]  213 	ldw x,[basicptr] ; line number 
      00A334 CD 83 41 5B      [ 1]  214 	mov base,#10
      00A338 04 81 00 21      [ 1]  215 	mov tab_width,#5
      00A33A 72 5F 00 0B      [ 1]  216 	clr acc24 
      00A33A 88 4E CD         [ 2]  217 	ldw acc16,x
      00A33D A3 51 CD         [ 4]  218 	call itoa  
      00A340 83 41 7B         [ 4]  219 	call right_align 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A343 01               [ 1]  220 	push a 
      00A344 CD A3            [ 1]  221 1$:	ldw y,x ; source
      00A346 51 CD            [ 2]  222 	ldw x,(STR+1,sp) ; destination
      00A348 83 41 A6         [ 4]  223 	call strcpy 
      00A34B 20 CD            [ 1]  224 	clrw y 
      00A34D 83               [ 1]  225 	pop a 
      00A34E 41 84            [ 1]  226 	ld yl,a 
      00A350 81 F9 03         [ 2]  227 	addw y,(STR,sp)
      00A351 A6 20            [ 1]  228 	ld a,#SPACE 
      00A351 A4 0F            [ 1]  229 	ld (y),a 
      00A353 A1 09            [ 1]  230 	incw y 
      00A355 23 02 AB 07      [ 1]  231 	clr tab_width
      00A359 AB 30 81         [ 2]  232 	ldw x,#3
      00A35C CF 00 00         [ 2]  233 	ldw in.w,x 
      002834                        234 decomp_loop:
      00A35C 52 02            [ 2]  235 	pushw y
      00A35E 0F 01 90         [ 4]  236 	call next_token 
      00A361 CE 00            [ 2]  237 	popw y 
      00A363 1A               [ 1]  238 	tnz a  
      00A364 4D 27            [ 1]  239 	jrne 1$
      00A366 04 90 CE         [ 2]  240 	jp 20$
      00A369 00 05            [ 1]  241 1$:	jrpl 6$
                                    242 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      00A36B A1 85            [ 1]  243 	cp a,#TK_VAR 
      00A36B 90 C3            [ 1]  244 	jrne 3$
                                    245 ;; TK_VAR 
      00A36D 00 1C 2A         [ 4]  246 	call add_space  
      00A370 10 90 F3         [ 4]  247 	call var_name
      00A373 27 0E            [ 1]  248 	ld (y),a 
      00A375 2B 0A            [ 1]  249 	incw y  
      00A377 90 E6            [ 2]  250 	jra decomp_loop
      002853                        251 3$:
      00A379 02 6B            [ 1]  252 	cp a,#TK_INTGR
      00A37B 02 72            [ 1]  253 	jrne 4$
                                    254 ;; TK_INTGR
      00A37D F9 01 20         [ 4]  255 	call add_space
      00A380 EA 5F 00 0B      [ 1]  256 	clr acc24 
      00A381 CF 00 0C         [ 2]  257 	ldw acc16,x 
      00A381 5F 51            [ 2]  258 	pushw y 
      00A383 5B 02 51         [ 4]  259 	call itoa  
      00A386 81 01            [ 2]  260 	ldw y,(1,sp) 
      00A387 88               [ 1]  261 	push a 
      00A387 52               [ 1]  262 	exgw x,y 
      00A388 04 E6 02         [ 4]  263 	call strcpy 
      00A38B 6B 02            [ 1]  264 	clrw y
      00A38D 0F               [ 1]  265 	pop a  
      00A38E 01 90            [ 1]  266 	ld yl,a 
      00A390 93 72 F9         [ 2]  267 	addw y,(1,sp)
      002875                        268 	_drop 2 
      00A393 01 17            [ 2]    1     addw sp,#2 
      00A395 03 90            [ 2]  269 	jra decomp_loop
                                    270 ;; dictionary keyword 
      002879                        271 4$:	
      00A397 CE 00 1C         [ 4]  272 	call get_cmd_idx 
      00A39A 72 F2 03         [ 2]  273 	cpw x,#REM_IDX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A39D 90 CF            [ 1]  274 	jrne 5$
      00A39F 00 0D 16         [ 2]  275 	ldw x,basicptr 
                                    276 ; copy comment to buffer 
      00A3A2 03 CD 84         [ 4]  277 	call add_space
      00A3A5 45 90            [ 1]  278 	ld a,#''
      00A3A7 CE 00            [ 1]  279 	ld (y),a 
      00A3A9 1C 72            [ 1]  280 	incw y 
      00288D                        281 41$:
      00A3AB F2 01 90 CF      [ 4]  282 	ld a,([in.w],x)
      00A3AF 00 1C 5B 04      [ 1]  283 	inc in  
      00A3B3 81 F7            [ 1]  284 	ld (y),a 
      00A3B4 90 5C            [ 1]  285 	incw y 
      00A3B4 52 06 1F         [ 1]  286 	ld a,in 
      00A3B7 03 17 05         [ 1]  287 	cp a,count 
      00A3BA 90 CF            [ 1]  288 	jrmi 41$
      00A3BC 00 0D            [ 2]  289 	jra 20$  
      00A3BE 90 93 72         [ 2]  290 5$: cpw x,#LET_IDX 
      00A3C1 BB 00            [ 1]  291 	jreq decomp_loop ; down display LET 	
                                    292 ; insert command name 
      00A3C3 0D 1F 01         [ 4]  293 	call add_space  
      00A3C6 CE 00            [ 2]  294 	pushw y
      00A3C8 1C 72 F0         [ 4]  295 	call cmd_name
      00A3CB 03 CF            [ 2]  296 	popw y 
      00A3CD 00 0D 1E         [ 4]  297 	call cpy_cmd_name
      00A3D0 01 CD 84         [ 2]  298 	jp decomp_loop 
      0028B8                        299 6$:
      00A3D3 45 CE            [ 1]  300 	cp a,#TK_QSTR 
      00A3D5 00 1C            [ 1]  301 	jrne 7$
                                    302 ;; TK_QSTR
      00A3D7 72 FB 05         [ 4]  303 	call cpy_quote  
      00A3DA CF 00 1C         [ 2]  304 	jp decomp_loop
      0028C2                        305 7$:
      00A3DD 5B 06            [ 1]  306 	cp a,#TK_CHAR 
      00A3DF 81 0E            [ 1]  307 	jrne 8$
                                    308 ;; TK_CHAR 
      00A3E0 A6 5C            [ 1]  309 	ld a,#'\ 
      00A3E0 52 08            [ 1]  310 	ld (y),a 
      00A3E2 CE 00            [ 1]  311 	incw y 
      00A3E4 1C               [ 1]  312 	ld a,xl 
      00A3E5 C3 00            [ 1]  313 	ld (y),a 
      00A3E7 1A 26            [ 1]  314 	incw y 
      00A3E9 19 AE 00         [ 2]  315 	jp decomp_loop
      00A3EC 02 72            [ 1]  316 8$: cp a,#TK_COLON 
      00A3EE D6 00            [ 1]  317 	jrne 9$
      00A3F0 18 A1            [ 1]  318 	ld a,#':
      0028DA                        319 81$:
      00A3F2 03 27            [ 1]  320 	ld (y),a 
      00A3F4 5A 5F            [ 1]  321 	incw y 
      0028DE                        322 82$:
      00A3F6 97 1F 07         [ 2]  323 	jp decomp_loop
      0028E1                        324 9$: 
      00A3F9 CE 00            [ 1]  325 	cp a,#TK_SHARP
      00A3FB 1A 1F            [ 1]  326 	jrugt 10$ 
      00A3FD 01 CE            [ 1]  327 	sub a,#TK_ARRAY 
      00A3FF 00               [ 1]  328 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00A400 1C               [ 1]  329 	ld xl,a
      00A401 20 38 72         [ 2]  330 	addw x,#single_char 
      00A404 CE               [ 1]  331 	ld a,(x)
      00A405 00 18            [ 2]  332 	jra 81$ 
      0028EF                        333 10$: 
      00A407 1F 05            [ 1]  334 	cp a,#TK_MINUS 
      00A409 AE 00            [ 1]  335 	jrugt 11$
      00A40B 02 72            [ 1]  336 	sub a,#TK_PLUS 
      00A40D D6               [ 1]  337 	clrw x 
      00A40E 00               [ 1]  338 	ld xl,a 
      00A40F 18 97 1F         [ 2]  339 	addw x,#add_char 
      00A412 07               [ 1]  340 	ld a,(x)
      00A413 1E 05            [ 2]  341 	jra 81$
      0028FD                        342 11$:
      00A415 4F CD            [ 1]  343     cp a,#TK_MOD 
      00A417 A3 5C            [ 1]  344 	jrugt 12$
      00A419 5D 26            [ 1]  345 	sub a,#TK_MULT
      00A41B 04               [ 1]  346 	clrw x 
      00A41C 17               [ 1]  347 	ld xl,a 
      00A41D 01 20 05         [ 2]  348 	addw x,#mul_char
      00A420 1F               [ 1]  349 	ld a,(x)
      00A421 01 CD            [ 2]  350 	jra 81$
      00290B                        351 12$:
      00A423 A3 87            [ 1]  352 	sub a,#TK_GT  
      00A425 48               [ 1]  353 	sll a 
      00A425 A6               [ 1]  354 	clrw x 
      00A426 03               [ 1]  355 	ld xl,a 
      00A427 11 08 27         [ 2]  356 	addw x,#relop_str 
      00A42A 24               [ 2]  357 	ldw x,(x)
      00A42B 1E               [ 1]  358 	ld a,(x)
      00A42C 01               [ 1]  359 	incw x 
      00A42D C3 00            [ 1]  360 	ld (y),a
      00A42F 1C 27            [ 1]  361 	incw y 
      00A431 09               [ 1]  362 	ld a,(x)
      00A432 1E 01            [ 1]  363 	jrne 81$
      00A434 16 07 CD         [ 2]  364 	jp decomp_loop 
      002920                        365 20$: 
      00A437 A3 B4            [ 1]  366 	clr (y)
      00A439 20 06            [ 2]  367 	ldw x,(STR,sp)
      00A43B 7B 01            [ 1]  368 	ld a,(BASE_SAV,sp)
      00A43B 72 FB 07         [ 1]  369 	ld base,a 
      00A43E CF 00            [ 1]  370 	ld a,(WIDTH_SAV,sp)
      00A440 1C 1E 07         [ 1]  371 	ld tab_width,a
      00A443 CF 00 0D         [ 2]  372 	subw y,(STR,sp) 
      00A446 90 AE            [ 1]  373 	ld a,yl 
      002933                        374 	_drop VSIZE 
      00A448 16 E0            [ 2]    1     addw sp,#VSIZE 
      00A44A 1E               [ 4]  375 	ret 
                                    376 
      00A44B 01 CD 84 45 23         377 single_char: .byte '@','(',')',',','#'
      00A44F 2B 2D                  378 add_char: .byte '+','-'
      00A44F 5B 08 81               379 mul_char: .byte '*','/','%'
      00A452 29 4C 29 4E 29 50 29   380 relop_str: .word gt,equal,ge,lt,le,ne 
             53 29 55 29 58
      00A452 52 02                  381 gt: .asciz ">"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A454 4F 6B                  382 equal: .asciz "="
      00A456 01 3D 00               383 ge: .asciz ">="
      00A457 3C 00                  384 lt: .asciz "<"
      00A457 91 D6 01               385 le: .asciz "<="
      00A45A 27 24 72               386 ne:  .asciz "<>"
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
      00295B                        399 cmd_name:
      00295B                        400 	_vars VSIZE 
      00A45D 5C 00            [ 2]    1     sub sp,#VSIZE 
      00A45F 02 6B 02 A6      [ 1]  401 	clr acc16 
      00A463 5C 11            [ 2]  402 	ldw (CMDX,sp),x  
      00A465 01 26 0A         [ 2]  403 	ldw x,#kword_dict	
      00A468 0F 01            [ 2]  404 1$:	ldw (LINK,sp),x
      00A46A 7B 02            [ 1]  405 	ld a,(2,x)
      00A46C AD 1C            [ 1]  406 	and a,#15 
      00A46E F7 5C 20         [ 1]  407 	ld acc8,a 
      00A471 E5 00 03         [ 2]  408 	addw x,#3
      00A472 72 BB 00 0C      [ 2]  409 	addw x,acc16
      00A472 7B               [ 2]  410 	ldw x,(x) ; command index  
      00A473 02 A1            [ 2]  411 	cpw x,(CMDX,sp)
      00A475 5C 27            [ 1]  412 	jreq 2$
      00A477 DD A1            [ 2]  413 	ldw x,(LINK,sp)
      00A479 22               [ 2]  414 	ldw x,(x) 
      00A47A 27 04 F7         [ 2]  415 	subw x,#2  
      00A47D 5C 20            [ 1]  416 	jrne 1$
      00A47F D7 05            [ 2]  417 	jra 9$
      00A480 1E 03            [ 2]  418 2$: ldw x,(LINK,sp)
      00A480 7F 5C 90         [ 2]  419 	addw x,#2 	
      00298A                        420 9$:	_drop VSIZE
      00A483 93 5F            [ 2]    1     addw sp,#VSIZE 
      00A485 A6               [ 4]  421 	ret
                                    422 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
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
      00A486 02 5B                   30 app_sign: .ascii "BC"  ; signature 
      00A488 02 81                   31 app_size:  .word 31
      00A48A                         32 app: 
                                     33 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     34 ;;  BASIC code demo 'BLINK.BAS' 
                                     35 ;; 10 do btogl $500a,32 pause 250 until qkey bres $500a,32 end 
                                     36 ;; byte code generated by compiler.
                                     37 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00A48A 89 AE A4 9F F1 27 06    38 .byte 0,10,31,128,0,38,128,0,20,132,80,10,9,132,0,32,128
             7D 27 09 5C 20 F7 1D
             A4 9F 9F
      00A49B AB 07 85 81 61 62 74    39 .byte 0,100,132,0,250,128,0,182,129,0,132,128,0,46
             6E 76 66 72 00 00 2E
                                     40 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        001EF6 R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   5 ADCON      001EEC R
    ADCON_ID=  000002     |   5 ADCREAD    001EE0 R   |     ADCREAD_=  000004 
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
  5 AND        001ED8 R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  5 ASC        001ED0 R   |     ASC_IDX =  000008     |     ATTRIB  =  000002 
    AUTORUN_=  004000     |   5 AWU        001EC8 R   |   5 AWUHandl   000001 R
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
    BELL    =  000007     |     BINARY  =  000001     |   5 BIT        001EC0 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000C 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   5 BRES       001EB7 R   |     BRES_IDX=  00000E 
    BS      =  000008     |     BSAVE   =  000001     |   5 BSET       001EAE R
    BSET_IDX=  000010     |     BSIZE   =  000005     |   5 BTEST      001EA4 R
    BTEST_ID=  000012     |   5 BTOGL      001E9A R   |     BTOGL_ID=  000014 
    BTW     =  000001     |   5 BYE        001E92 R   |     BYE_IDX =  000016 
    C       =  000001     |     CAN     =  000018     |   5 CANT_DO    0014DB R
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
  5 CHAR       001E89 R   |     CHAR_IDX=  000018     |     CLKOPT  =  004807 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
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
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        001E81 R
    CRH_IDX =  00001A     |   5 CRL        001E79 R   |     CRL_IDX =  00001C 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   5 DATA       001E70 R
  5 DATALN     001E65 R   |     DATALN_I=  000020     |     DATA_IDX=  00001E 
    DBG_A   =  000005     |     DBG_CC  =  000006     |     DBG_X   =  000003 
    DBG_Y   =  000001     |     DBL     =  000003     |     DBLDIVDN=  000006 
    DBLHI   =  000001     |     DBLLO   =  000003     |     DBL_SIZE=  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   5 DDR        001E5D R   |     DDR_IDX =  000022 
    DEBUG   =  000000     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
    DEBUG_PR=  000001     |   5 DEC        001E55 R   |     DEC_IDX =  000024 
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
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   5 DO         001E4E R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]

Symbol Table

  5 DREAD      001E44 R   |     DREAD_ID=  000028     |   5 DWRITE     001E39 R
    DWRITE_I=  00002A     |   5 EDIT       001E30 R   |     EDIT_IDX=  00002C 
  5 EEPROM     001E25 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002E     |     EEPROM_S=  000800     |     EM      =  000019 
  5 END        001E1D R   |     END_IDX =  000030     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   5 ERASE      001E13 R
    ERASE_ID=  000032     |     ERR_BAD_=  00000A     |     ERR_BUF_=  00000F 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FAUTORUN=  000006     |     FBREAK  =  000004 
    FCOMP   =  000005     |   5 FCPU       001E0A R   |     FCPU_IDX=  000034 
    FF      =  00000C     |     FHSE    =  7A1200     |     FHSI    =  F42400 
    FIRST   =  000001     |     FIRST_DA=  000006     |   5 FLASHAPP   001DFD R
    FLASHAPP=  000036     |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
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
  5 FOR        001DF5 R   |     FOR_IDX =  000038     |   5 FREE       001DEC R
    FREE_IDX=  00009A     |     FRUN    =  000000     |     FS      =  00001C 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      001DE2 R   |     GOSUB_ID=  00003A 
  5 GOTO       001DD9 R   |     GOTO_IDX=  00003C     |   5 GPIO       001DD0 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_IDX=  00003E 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  5 HEX        001DC8 R   |     HEX_IDX =  000040     |     HOME    =  000082 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]

Symbol Table

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
    I2C_WRIT=  000000     |   5 IDR        001DC0 R   |     IDR_IDX =  000042 
  5 IF         001DB9 R   |     IF_IDX  =  000044     |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   5 INPUT      001DAF R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_ID=  000046     |     INPUT_PU=  000001     |     INT_ADC2=  000016 
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
  5 INVERT     001DA4 R   |     INVERT_I=  000048     |     INW     =  000009 
    IPOS    =  000001     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
  5 IWDGEN     001D99 R   |     IWDGEN_I=  00004A     |   5 IWDGREF    001D8D R
    IWDGREF_=  00004C     |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |     KCHAR   =  000002     |   5 KEY        001D85 R
    KEY_END =  000083     |     KEY_IDX =  00004E     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000005     |   5 LET        001D7D R
    LET_IDX =  000050     |     LF      =  00000A     |     LIMIT   =  000005 
    LINENO  =  000005     |     LINK    =  000003     |   5 LIST       001D74 R
    LIST_IDX=  000052     |     LL      =  000001     |     LLEN    =  000007 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   5 LOG        001D6C R
    LOG_IDX =  000054     |   5 LSHIFT     001D61 R   |     LSHIFT_I=  000056 
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MAX_LINE=  007FFF     |     MINOR   =  000002     |   5 MULDIV     001D56 R
    MULDIV_I=  000058     |     MULOP   =  000003     |     N1      =  000001 
    N2      =  000003     |     NAFR    =  004804     |     NAK     =  000015 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        001D4E R
    NEW_IDX =  00005C     |   5 NEXT       001D45 R   |     NEXT_IDX=  00005A 
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]

Symbol Table

    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   5 NOT        001D3D R
    NOT_IDX =  00005E     |   5 NO_APP     00151A R   |   5 NO_FLASH   000EE1 R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000000 R   |   5 ODR        001D35 R   |     ODR_IDX =  000060 
    ONOFF   =  000003     |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         001D2E R   |     OR_IDX  =  000062     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    OVRWR   =  000004     |     PA      =  000000     |   5 PAD        001D26 R
    PAD_IDX =  000064     |     PAD_SIZE=  000080     |   5 PAUSE      001D1C R
    PAUSE_ID=  000066     |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   5 PEEK       001D13 R
    PEEK_IDX=  00006A     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       001D0A R   |     PINP_IDX=  00006C     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  5 PMODE      001D00 R   |     PMODE_ID=  000068     |   5 POKE       001CF7 R
    POKE_IDX=  00006E     |     PORT    =  000003     |   5 POUT       001CEE R
    POUT_IDX=  000070     |     PREV    =  000001     |   5 PRINT      001CE4 R
  5 PROG_SIZ   001530 R   |   5 PRTA       001CDB R   |     PRTA_IDX=  000074 
  5 PRTB       001CD2 R   |     PRTB_IDX=  000076     |   5 PRTC       001CC9 R
    PRTC_IDX=  000078     |   5 PRTD       001CC0 R   |     PRTD_IDX=  00007A 
  5 PRTE       001CB7 R   |     PRTE_IDX=  00007C     |   5 PRTF       001CAE R
    PRTF_IDX=  00007E     |   5 PRTG       001CA5 R   |     PRTG_IDX=  000080 
  5 PRTH       001C9C R   |     PRTH_IDX=  000082     |   5 PRTI       001C93 R
    PRTI_IDX=  000084     |     PRT_IDX =  000072     |     PSTR    =  000003 
  5 QKEY       001C8A R   |     QKEY_IDX=  000086     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |     RBT_IDX =  00008A 
  5 READ       001C81 R   |     READ_IDX=  000088     |   5 REBOOT     001C76 R
    REG     =  000001     |     REGA    =  000001     |     REGX    =  000003 
    REGY    =  000005     |     RELOP   =  000003     |   5 REMARK     001C6B R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]

Symbol Table

    REM_IDX =  00008C     |   5 RESTORE    001C5F R   |     REST_IDX=  00008E 
    RETL1   =  000001     |   5 RETURN     001C54 R   |     RET_ADDR=  000003 
    RET_IDX =  000090     |     RET_INW =  000005     |   5 RND        001C4C R
    RND_IDX =  000092     |     ROP     =  004800     |     RS      =  00001E 
  5 RSHIFT     001C41 R   |     RSHIFT_I=  000094     |     RST_SR  =  0050B3 
  5 RUN        001C39 R   |   5 RUNNING    00055A R   |     RUN_IDX =  000096 
    RXCHAR  =  000001     |     RX_QUEUE=  000008     |     SAVEB   =  000002 
    SDIVSR  =  000005     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       001C30 R   |     SHOW_IDX=  000098 
    SI      =  00000F     |     SIGN    =  000001     |     SKIP    =  000005 
  5 SLEEP      001C26 R   |     SLEEP_ID=  00009C     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   5 SPIEN      001C1C R
    SPIEN_ID=  0000A0     |   5 SPIRD      001C12 R   |     SPIRD_ID=  00009E 
  5 SPISEL     001C07 R   |     SPISEL_I=  0000A2     |   5 SPIWR      001BFD R
    SPIWR_ID=  0000A4     |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
    STACK_SI=  0000A0     |   5 STEP       001BF4 R   |     STEP_IDX=  0000A6 
  5 STOP       001BEB R   |     STOP_IDX=  0000A8     |     STR     =  000003 
  5 STR_BYTE   00153F R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      001BE1 R   |     TICKS_ID=  0000AA 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR_=  000000     |   5 TIMEOUT    001BD5 R   |   5 TIMER      001BCB R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]

Symbol Table

    TIMER_ID=  0000AC     |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
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
    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_PLUS =  000010 
    TK_QSTR =  000002     |     TK_RPARE=  000008     |     TK_SHARP=  00000A 
    TK_VAR  =  000085     |     TMROUT_I=  0000AE     |   5 TO         001BC4 R
  5 TONE       001BBB R   |     TONE_IDX=  0000B2     |     TO_IDX  =  0000B0 
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
  5 UBOUND     001BB0 R   |     UBOUND_I=  0000B4     |   5 UBTN_Han   000079 R
  5 UFLASH     001BA5 R   |     UFLASH_I=  0000B6     |   5 UNTIL      001B9B R
    UNTIL_ID=  0000B8     |     US      =  00001F     |   5 USER_ABO   00008C R
  5 USR        001B93 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000BA     |   5 Uart1RxH   00000F R
  5 UserButt   000055 R   |     VAR_ADDR=  000006     |     VSISE   =  000003 
    VSIZ    =  000002     |     VSIZE   =  000004     |     VT      =  00000B 
  5 WAIT       001B8A R   |     WAIT_IDX=  0000BC     |     WCNT    =  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]

Symbol Table

    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |   5 WORDS      001B80 R   |     WORDS_ID=  0000BE 
  5 WRITE      001B76 R   |     WRITE_ID=  0000C0     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   5 XOR        001B6E R
    XOR_IDX =  0000C2     |     XREG    =  000003     |     XSAVE   =  000001 
    YSAVE   =  000004     |   5 abs        00169E R   |   1 acc16      00000C GR
  1 acc24      00000B GR  |   1 acc8       00000D GR  |   5 accept_c   002260 R
  5 add_char   00293B R   |   5 add_spac   00275F R   |   5 analog_r   001303 R
  5 app        002A04 R   |   5 app_sign   002A00 R   |   5 app_size   002A02 R
  5 app_spac   002A00 GR  |   5 arduino_   001794 R   |   5 arg_list   000BE1 R
  1 array_si   00001E R   |   5 ascii      00158F R   |   5 at_tst     0025CD R
  5 atoi24     00099B GR  |   5 atoi_exi   000A01 R   |   5 awu        00164F R
  5 awu02      001659 R   |   5 bad_port   0015F0 R   |   1 base       00000A GR
  1 basicptr   000004 GR  |   5 beep       001290 R   |   5 beep_1kh   00127A GR
  5 bin_exit   002493 R   |   5 bit_and    0016B2 R   |   5 bit_or     0016CA R
  5 bit_rese   001052 R   |   5 bit_set    001042 R   |   5 bit_test   001073 R
  5 bit_togg   001063 R   |   5 bit_xor    0016E2 R   |   5 bitmask    001900 R
  5 bkslsh_t   00257A R   |   5 bksp       001FFE R   |   5 block_er   0001B7 R
  5 break_po   0013D0 R   |   5 bye        001628 R   |   5 char       00157D R
  5 clear_ba   0005A3 R   |   5 clear_va   000407 R   |   5 clock_in   0000A7 R
  5 cmd_end    001273 R   |   5 cmd_line   0007C0 R   |   5 cmd_name   00295B R
  5 code_add   001EFC GR  |   5 cold_sta   00047E R   |   5 colon_ts   0025A1 R
  5 comma_ts   0025AC R   |   5 comp_msg   000718 R   |   5 compile    0026D2 GR
  5 const_cr   0019B4 R   |   5 const_cr   0019BA R   |   5 const_dd   0019AE R
  5 const_ee   0019CC R   |   5 const_id   0019A8 R   |   5 const_in   0019C6 R
  5 const_od   0019A2 R   |   5 const_ou   0019C0 R   |   5 const_po   00196C R
  5 const_po   001972 R   |   5 const_po   001978 R   |   5 const_po   00197E R
  5 const_po   001984 R   |   5 const_po   00198A R   |   5 const_po   001990 R
  5 const_po   001996 R   |   5 const_po   00199C R   |   5 convert_   00240A R
  5 convert_   001FC2 R   |   5 copy_com   002602 R   |   1 count      000003 GR
  5 cp_loop    000B90 R   |   5 cpy_cmd_   00274A R   |   5 cpy_quot   002783 R
  5 create_g   002334 R   |   5 cs_high    001B61 R   |   5 cstk_pro   000D9B R
  5 dash_tst   0025C2 R   |   5 data       0019D2 R   |   1 data_len   000009 R
  5 data_lin   0019D8 R   |   1 data_ofs   000008 R   |   1 data_ptr   000006 R
  5 data_sea   001A19 R   |   5 dbl_sign   000AEA R   |   5 dec_base   000DC7 R
  5 decomp_l   002834 R   |   5 decompil   0027ED GR  |   5 del_line   002307 R
  5 delete_l   0020EB R   |   5 delete_n   00200E R   |   5 delete_u   0020B0 R
  5 digital_   001337 R   |   5 digital_   001367 R   |   5 div32_16   000AF4 R
  5 divide     000B4B R   |   5 divu24_8   00090A R   |   5 dneg       000ADF R
  5 do_loop    001929 R   |   5 do_progr   0001AA R   |   5 edit       000EB7 R
  5 enable_i   0018AA R   |   5 eql_tst    002657 R   |   5 equal      00294E R
  5 erase      00142F R   |   5 erase_fl   0001D6 R   |   5 err_bad_   000683 R
  5 err_buf_   0006F9 R   |   5 err_cmd_   000647 R   |   5 err_div0   00060C R
  5 err_dupl   000661 R   |   5 err_math   0005F3 R   |   5 err_mem_   0005D8 R
  5 err_msg    0005B8 R   |   5 err_no_a   00068F R   |   5 err_no_d   0006C2 R
  5 err_no_f   0006E6 R   |   5 err_no_l   00061B R   |   5 err_no_p   0006D2 R
  5 err_not_   000672 R   |   5 err_run_   000631 R   |   5 err_synt   0005E5 R
  5 escaped    00241F GR  |   5 expect     000BCF R   |   5 expr_exi   000D26 R
  5 expressi   000CE0 R   |   5 factor     000C31 R   |   1 farptr     000016 R
  5 fcpu       00172C R   |   5 final_te   002259 R   |   5 first_li   000E64 R
  1 flags      000020 GR  |   5 flash_ap   00145C R   |   5 for        0010CE R
  5 free       000DCC R   |   1 free_ram   000064 R   |   5 func_arg   000BDC R
  5 func_not   00189D R   |   5 ge         002950 R   |   5 get_arra   000C0C R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]

Symbol Table

  5 get_cmd_   0027CC R   |   5 get_esca   001FCE R   |   5 get_targ   001198 R
  5 get_tick   001698 R   |   5 get_toke   002513 GR  |   5 getc       0002D1 GR
  5 gosub      0011D9 R   |   5 goto       0011BE R   |   5 gpio       0015CB R
  5 gt         00294C R   |   5 gt_tst     002662 R   |   5 hex_base   000DC2 R
  5 hex_dump   00035E R   |   5 if         0010BA R   |   1 in         000001 GR
  1 in.saved   000002 GR  |   1 in.w       000000 GR  |   5 incr_far   001413 R
  5 input_ex   001014 R   |   5 input_lo   000FA9 R   |   5 input_va   000FA7 R
  5 insert_c   00206D R   |   5 insert_l   002360 R   |   5 insert_l   0023CF R
  5 interp_l   000801 R   |   5 interpre   0007DC R   |   5 invert     00191A R
  5 is_alnum   00042F GR  |   5 is_alpha   000415 GR  |   5 is_digit   000426 GR
  5 itoa       00089F GR  |   5 itoa_loo   0008C4 R   |   5 jp_to_ta   0011CC R
  5 key        0015B6 R   |   5 kw_loop    0024AF R   |   5 kword_di   001EF4 GR
  5 kword_en   001B6C R   |   5 le         002955 R   |   5 leading_   0018F0 R
  5 let        000DEF GR  |   5 let_arra   000DFD R   |   5 let_var    000E00 R
  5 lines_sk   000E67 R   |   5 list       000E22 R   |   5 list_exi   000EA9 R
  5 list_loo   000E87 R   |   5 log2       0018E5 R   |   5 logical_   001893 R
  5 long_div   000AC7 R   |   5 loop_bac   00117B R   |   1 loop_dep   00001D R
  5 loop_don   001190 R   |   5 lshift     0016FA R   |   5 lt         002953 R
  5 lt_tst     00268B R   |   5 modulo     000B61 R   |   5 move       0003C5 GR
  5 move_dow   0003E3 R   |   5 move_era   00013C R   |   5 move_exi   000404 R
  5 move_lef   002045 R   |   5 move_loo   0003E8 R   |   5 move_prg   000170 R
  5 move_rig   002053 R   |   5 move_up    0003D5 R   |   5 mul_char   00293D R
  5 muldiv     000B66 R   |   5 multiply   000A92 R   |   5 mulu24_8   000932 R
  5 nbr_tst    002546 R   |   5 ne         002958 R   |   5 neg_acc2   00096C R
  5 new        0013EE R   |   5 next       00114E R   |   5 next_lin   0007E4 R
  5 next_tok   000828 GR  |   5 no_match   000BA2 R   |   5 other      0026B4 R
  5 overwrit   002285 R   |   3 pad        0016E0 GR  |   5 pad_ref    001B66 R
  5 parse_bi   002471 R   |   5 parse_in   002427 R   |   5 parse_ke   0024AE R
  5 parse_qu   0023D2 R   |   5 pause      00163C R   |   5 pause02    001646 R
  5 peek       0010A9 R   |   5 pin_mode   001738 R   |   5 plus_tst   00262B R
  5 poke       00109A R   |   5 power_ad   0012C7 R   |   5 prcnt_ts   00264C R
  5 print      000F21 R   |   5 print_ex   000F7B R   |   5 print_he   0022BA GR
  5 print_in   000883 R   |   5 printxy    000A05 R   |   5 prog_siz   000E1A R
  5 program_   000150 R   |   5 program_   000170 R   |   5 prt_basi   000F01 R
  5 prt_loop   000F25 R   |   5 prt_tok    0002F0 R   |   5 prti24     000893 R
  1 ptr16      000017 GR  |   1 ptr8       000018 R   |   5 putc       0002C1 GR
  5 puts       001FF4 GR  |   5 qgetc      0002CA GR  |   5 qkey       0015BE GR
  5 qmark_ts   0025D8 R   |   5 qsign      001455 R   |   5 random     0017B4 R
  5 read       001A55 R   |   5 read01     001A57 R   |   5 readln     0020F9 GR
  5 readln_l   002106 R   |   5 readln_q   0022A2 R   |   5 refresh_   0018E0 R
  5 rel_exit   000D7E R   |   5 relation   000D29 R   |   5 relop_st   002940 R
  5 remark     001017 GR  |   5 reset_co   000F23 R   |   5 rest_con   000F97 R
  5 restore    001A06 R   |   5 return     0011F9 R   |   5 right_al   002771 GR
  5 row_alig   0013F8 R   |   5 row_eras   000115 R   |   5 row_eras   00013C R
  5 row_loop   000341 R   |   5 rparnt_t   002596 R   |   5 rshift     001713 R
  1 rsign      000060 R   |   1 rsize      000062 R   |   5 rt_msg     000706 R
  5 run        001217 R   |   5 run_app    00051D R   |   5 run_it     00124C R
  1 rx1_head   00002A R   |   1 rx1_queu   000022 R   |   1 rx1_tail   00002B R
  5 save_con   000F87 R   |   5 scan_blo   001421 R   |   5 search_d   000B82 GR
  5 search_e   000BCC R   |   5 search_l   0022DC GR  |   5 search_l   0022EB R
  5 search_n   000B86 R   |   1 seedx      000012 R   |   1 seedy      000014 R
  5 select_p   001784 R   |   5 send_esc   00201C R   |   5 send_par   002027 R
  5 set_time   001881 R   |   5 sharp_ts   0025B7 R   |   5 show       000D81 R
  5 show_row   00032F R   |   5 single_c   002936 R   |   5 skip       002500 R
  5 slash_ts   002641 R   |   5 sleep      001631 R   |   5 software   000438 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]

Symbol Table

  5 spaces     002061 GR  |   5 spi_clea   001AFA R   |   5 spi_disa   001AE2 R
  5 spi_enab   001AAF R   |   5 spi_rcv_   001B1C R   |   5 spi_read   001B47 R
  5 spi_sele   001B4F R   |   5 spi_send   001B06 R   |   5 spi_writ   001B27 R
  3 stack_fu   001760 GR  |   3 stack_un   001800 R   |   5 star_tst   002636 R
  5 step       001127 R   |   5 stop       0013A2 R   |   5 store_lo   00113B R
  5 str_matc   000BAF R   |   5 str_tst    002536 R   |   5 strcmp     0003A6 R
  5 strcpy     0003B7 GR  |   5 strlen     00039B GR  |   5 syntax_e   000739 GR
  1 tab_widt   000021 GR  |   5 tb_error   00073B GR  |   5 term       000C8E R
  5 term01     000C96 R   |   5 term_exi   000CDD R   |   3 tib        001690 GR
  5 tick_tst   0025F0 R   |   1 ticks      00000E R   |   5 timeout    001890 R
  1 timer      000010 GR  |   5 timer2_i   0000BD R   |   5 timer4_i   0000CA R
  5 tk_id      000729 R   |   5 to         0010F7 R   |   5 to_eepro   000193 R
  5 to_flash   0001A7 R   |   5 to_hex_c   0022D1 GR  |   5 to_upper   00098F GR
  5 token_ch   0026CB R   |   5 token_ex   0026CF R   |   5 token_ms   000327 R
  5 tone       001283 R   |   5 try_next   001A45 R   |   1 txtbgn     000019 GR
  1 txtend     00001B GR  |   5 uart1_ge   0002D1 GR  |   5 uart1_in   00027E R
  5 uart1_pu   0002C1 GR  |   5 uart1_qg   0002CA GR  |   5 uart1_se   00028E R
  5 ubound     000DE5 R   |   5 udiv32_1   000AB5 R   |   5 uflash     0015F5 R
  5 umstar     000A58 R   |   5 unlock_e   0000DF R   |   5 unlock_f   0000FA R
  5 until      00193E R   |   5 user_int   000068 R   |   5 usr        00160B R
  5 var_name   0027C4 GR  |   1 vars       00002C GR  |   5 wait       00101D R
  5 warm_ini   000585 R   |   5 warm_sta   0007BD R   |   5 words      00181B R
  5 words_co   00186B R   |   5 write      001546 R   |   5 write_bl   00025B R
  5 write_by   0001E1 R   |   5 write_ee   00021D R   |   5 write_ex   000256 R
  5 write_fl   000207 R   |   5 write_ro   000184 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     64   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   2A23   flags    0

