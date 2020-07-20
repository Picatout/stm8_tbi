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
                                     26     .module STM8_TBI
                                     27 
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
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                     35     .list 
                                     36 
                                     37 ;_dbg 
                                     38 
                                     39 ;--------------------------------------
                                     40     .area DATA 
                                     41 ;--------------------------------------	
                                     42 
                           0000A0    43 	STACK_SIZE=160
                           0017FF    44 	STACK_EMPTY=RAM_SIZE-1  
                           000000    45 	FRUN=0 ; flags run code in variable flags
                           000001    46 	FTRAP=1 ; inside trap handler 
                           000002    47 	FLOOP=2 ; FOR loop in preparation 
                           000003    48 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    49 	FBREAK=4 ; break point flag 
                           000005    50 	FCOMP=5  ; compiling flags 
                           000006    51 	FAUTORUN=6; auto start program running 
                                     52 
                           004000    53 	AUTORUN_NAME=0x4000 ; address in EEPROM where auto run file name is saved 
                                     54 
                           000006    55     FIRST_DATA_ITEM=6 ; first DATA item offset on line.
                                     56 
                           007FFF    57 	MAX_LINENO=0x7fff; BASIC maximum line number 
                                     58 
                           000008    59 	RX_QUEUE_SIZE=8 
                                     60 
                                     61 
      000001                         62 in.w:  .blkb 1 ; parser position in text line high-byte 
      000002                         63 in:    .blkb 1 ; low byte of in.w 
      000003                         64 in.saved: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000004                         65 count:: .blkb 1 ; current BASIC line length and tib text length  
      000005                         66 basicptr::  .blkb 2  ; point to current BASIC line address.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      000007                         67 data_ptr:  .blkw 1  ; point to DATA address
      000009                         68 data_ofs:  .blkb 1  ; index to next data item 
      00000A                         69 data_len:  .blkb 1  ; length of data line 
      00000B                         70 base:  .blkb 1 ; nemeric base used to print integer 
      00000C                         71 acc24:: .blkb 1 ; 24 bit accumulator upper-byte 
      00000D                         72 acc16:: .blkb 1 ; 16 bit accumulator, acc24 high-byte
      00000E                         73 acc8::  .blkb 1 ;  8 bit accumulator, acc24 low-byte  
      00000F                         74 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000011                         75 timer:: .blkw 1 ;  milliseconds count down timer 
      000013                         76 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000015                         77 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000017                         78 farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
      000018                         79 ptr16:  .blkb 1 ; 16 bits pointer , farptr high-byte 
      000019                         80 ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
      00001A                         81 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001D                         82 txtbgn: .blkw 1 ; tokenized BASIC text beginning address 
      00001F                         83 txtend: .blkw 1 ; tokenized BASIC text end address 
      000021                         84 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000022                         85 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000024                         86 flags: .blkb 1 ; various boolean flags
      000025                         87 tab_width: .blkb 1 ; print colon width (default 4)
      000026                         88 rx_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
      00002E                         89 rx_head:  .blkb 1 ; rx_queue head pointer
      00002F                         90 rx_tail:   .blkb 1 ; rx_queue tail pointer  
      000030                         91 comm: .blkb 1 ; active communication UART1|UART3 
                                     92 
      000031                         93 vars: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     94 ; keep 'free_ram' as last variable 
      000065                         95 free_ram: ; from here RAM free for BASIC text 
                                     96 
                                     97 ;;-----------------------------------
                                     98     .area SSEG (ABS)
                                     99 ;; working buffers and stack at end of RAM. 	
                                    100 ;;-----------------------------------
      001690                        101     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
      001690                        102 tib:: .ds TIB_SIZE             ; transaction input buffer
      0016E0                        103 pad: .ds PAD_SIZE             ; working buffer
      001760                        104 stack_full: .ds STACK_SIZE   ; control stack 
      001800                        105 stack_unf: ; stack underflow ; control_stack bottom 
                                    106 
                                    107 ;;--------------------------------------
                                    108     .area HOME 
                                    109 ;; interrupt vector table at 0x8000
                                    110 ;;--------------------------------------
      008000 82 00 86 CE            111     int cold_start			; RESET vector 
                           000000   112 .if DEBUG
                                    113 	int TrapHandler 		;TRAP  software interrupt
                           000001   114 .else
      008004 82 00 80 80            115 	int NonHandledInterrupt ;TRAP  software interrupt
                                    116 .endif
      008008 82 00 80 80            117 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 81            118 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            119 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            120 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80            121 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      00801C 82 00 80 80            122 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            123 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 F4            124 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80            125 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80            126 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80            127 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80            128 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80            129 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80            130 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80            131 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80            132 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80            133 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80            134 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 8F            135 	int UartRxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80            136 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80            137 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 8F            138 	int UartRxHandler       ;int21 UART3 RX full
      008060 82 00 80 80            139 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 DE            140 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80            141 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80            142 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80            143 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80            144 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80            145 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80            146 	int NonHandledInterrupt ;int29  not used
                                    147 
                                    148 ;---------------------------------------
                                    149     .area CODE
                                    150 ;---------------------------------------
                           000000   151 .if DEBUG
                                    152 .asciz "STM8_TBI" ; I like to put module name here.
                                    153 .endif 
                                    154 
                                    155 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    156 ; non handled interrupt 
                                    157 ; reset MCU
                                    158 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                        159 NonHandledInterrupt:
      008080 71                     160     .byte 0x71  ; invalid opcode reinitialize MCU
                                    161 
                                    162 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    163 ; auto wakeup from halt
                                    164 ; at iret, program continue 
                                    165 ; after hatl instruction
                                    166 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008081                        167 AWUHandler:
      008081 72 19 50 F0      [ 1]  168 	bres AWU_CSR,#AWU_CSR_AWUEN
      008085 55 00 3F 50 F1   [ 1]  169 	mov AWU_APR,0x3F
      00808A 72 5F 50 F2      [ 1]  170 	clr AWU_TBR 
      00808E 80               [11]  171 	iret
                                    172 
                                    173 ;--------------------------
                                    174 ; UART receive character
                                    175 ; CTRL-C (ASCII 3)
                                    176 ; cancel program execution
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    177 ; and fall back to command line
                                    178 ;--------------------------
      00808F                        179 UartRxHandler:
      00808F C6 00 30         [ 1]  180 	ld a,comm 
      008092 26 0A            [ 1]  181 	jrne 0$ 
      008094 72 0B 52 30 FB   [ 2]  182 	btjf UART1_SR,#UART_SR_RXNE,.
      008099 C6 52 31         [ 1]  183 	ld a,UART1_DR 
      00809C 20 08            [ 2]  184 	jra 1$
      00809E                        185 0$:	
      00809E 72 0B 52 40 FB   [ 2]  186 	btjf UART3_SR,#UART_SR_RXNE,.
      0080A3 C6 52 41         [ 1]  187 	ld a,UART3_DR 
      0080A6                        188 1$:
      0080A6 A1 03            [ 1]  189 	cp a,#CTRL_C 
      0080A8 26 0B            [ 1]  190 	jrne 2$
      0080AA 72 5F 00 2E      [ 1]  191 	clr rx_head 
      0080AE 72 5F 00 2F      [ 1]  192 	clr rx_tail 
      0080B2 CC 81 07         [ 2]  193 	jp user_interrupted
      0080B5                        194 2$:
      0080B5 A1 18            [ 1]  195 	cp a,#CAN ; CTRL_X 
      0080B7 26 03            [ 1]  196 	jrne 3$
      0080B9 CC 86 CE         [ 2]  197 	jp cold_start 	
      0080BC                        198 3$: 
      0080BC A1 1A            [ 1]  199 	cp a,#CTRL_Z
      0080BE 26 06            [ 1]  200 	jrne 4$
      0080C0 CD 87 97         [ 4]  201 	call cancel_autorun 
      0080C3 CC 86 CE         [ 2]  202 	jp cold_start 
      0080C6 AE 00 26         [ 2]  203 4$:	ldw x,#rx_queue  
      0080C9 88               [ 1]  204 	push a 
      0080CA 9F               [ 1]  205 	ld a,xl 
      0080CB CB 00 2F         [ 1]  206 	add a,rx_tail 
      0080CE 97               [ 1]  207 	ld xl,a
      0080CF 84               [ 1]  208 	pop a  
      0080D0 F7               [ 1]  209 	ld (x),a
      0080D1 72 5C 00 2F      [ 1]  210 	inc rx_tail 
      0080D5 A6 07            [ 1]  211 	ld a,#RX_QUEUE_SIZE-1
      0080D7 C4 00 2F         [ 1]  212 	and a,rx_tail 
      0080DA C7 00 2F         [ 1]  213 	ld rx_tail,a  	
      0080DD 80               [11]  214 	iret 
                                    215 
                                    216 ;------------------------------------
                                    217 ; software interrupt handler  
                                    218 ;------------------------------------
                           000000   219 .if DEBUG 
                                    220 TrapHandler:
                                    221 	bset flags,#FTRAP 
                                    222 	call print_registers
                                    223 	call cmd_itf
                                    224 	bres flags,#FTRAP 	
                                    225 	iret
                                    226 .endif 
                                    227 
                                    228 ;------------------------------
                                    229 ; TIMER 4 is used to maintain 
                                    230 ; a milliseconds 'ticks' counter
                                    231 ; and decrement 'timer' varaiable
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    232 ;--------------------------------
      0080DE                        233 Timer4UpdateHandler:
      0080DE 72 5F 53 42      [ 1]  234 	clr TIM4_SR 
      0080E2 CE 00 0F         [ 2]  235 	ldw x,ticks
      0080E5 5C               [ 1]  236 	incw x
      0080E6 CF 00 0F         [ 2]  237 	ldw ticks,x 
      0080E9 CE 00 11         [ 2]  238 	ldw x,timer
      0080EC 5D               [ 2]  239 	tnzw x 
      0080ED 27 04            [ 1]  240 	jreq 1$
      0080EF 5A               [ 2]  241 	decw x 
      0080F0 CF 00 11         [ 2]  242 	ldw timer,x 
      0080F3                        243 1$:	
      0080F3 80               [11]  244 	iret 
                                    245 
                                    246 
                                    247 ;------------------------------------
                                    248 ; Triggered by pressing USER UserButton 
                                    249 ; on NUCLEO card.
                                    250 ; This is used to abort a progam lock 
                                    251 ; in infinite loop. 
                                    252 ;------------------------------------
      0080F4                        253 UserButtonHandler:
                                    254 ; wait button release
      0080F4 5F               [ 1]  255 	clrw x
      0080F5 5A               [ 2]  256 1$: decw x 
      0080F6 26 FD            [ 1]  257 	jrne 1$
      0080F8 72 09 50 15 F8   [ 2]  258 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    259 ; if MCU suspended by SLEEP resume program
      0080FD 72 07 00 24 05   [ 2]  260     btjf flags,#FSLEEP,2$
      008102 72 17 00 24      [ 1]  261 	bres flags,#FSLEEP 
      008106 80               [11]  262 	iret
      008107                        263 2$:	
      008107                        264 user_interrupted:
      008107 72 00 00 24 02   [ 2]  265     btjt flags,#FRUN,4$
      00810C 20 13            [ 2]  266 	jra UBTN_Handler_exit 
      00810E                        267 4$:	; program interrupted by user 
      00810E 72 11 00 24      [ 1]  268 	bres flags,#FRUN 
      008112 AE 81 29         [ 2]  269 	ldw x,#USER_ABORT
      008115 CD AA C0         [ 4]  270 	call puts 
      008118 CE 00 05         [ 2]  271 	ldw x,basicptr 
      00811B C6 00 02         [ 1]  272 	ld a,in 
      00811E CD 96 1E         [ 4]  273 	call prt_basic_line
      008121                        274 UBTN_Handler_exit:
      008121 AE 17 FF         [ 2]  275     ldw x,#STACK_EMPTY 
      008124 94               [ 1]  276     ldw sp,x
      008125 9A               [ 1]  277 	rim 
      008126 CC 8A 01         [ 2]  278 	jp warm_start
                                    279 
      008129 0A 50 72 6F 67 72 61   280 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    281 
                                    282 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    283 ;    peripherals initialization
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    284 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    285 
                                    286 ;----------------------------------------
                                    287 ; inialize MCU clock 
                                    288 ; input:
                                    289 ;   A 		source  HSI | 1 HSE 
                                    290 ;   XL      CLK_CKDIVR , clock divisor 
                                    291 ; output:
                                    292 ;   none 
                                    293 ;----------------------------------------
      008144                        294 clock_init:	
      008144 C1 50 C3         [ 1]  295 	cp a,CLK_CMSR 
      008147 27 0C            [ 1]  296 	jreq 2$ ; no switching required 
                                    297 ; select clock source 
      008149 72 12 50 C5      [ 1]  298 	bset CLK_SWCR,#CLK_SWCR_SWEN
      00814D C7 50 C4         [ 1]  299 	ld CLK_SWR,a
      008150 C1 50 C3         [ 1]  300 1$:	cp a,CLK_CMSR
      008153 26 FB            [ 1]  301 	jrne 1$
      008155                        302 2$: 	
                                    303 ; HSI and cpu clock divisor 
      008155 9F               [ 1]  304 	ld a,xl 
      008156 C7 50 C6         [ 1]  305 	ld CLK_CKDIVR,a  
      008159 81               [ 4]  306 	ret
                                    307 
                                    308 ;----------------------------------
                                    309 ; TIMER2 used as audio tone output 
                                    310 ; on port D:5.
                                    311 ; channel 1 configured as PWM mode 1 
                                    312 ;-----------------------------------  
                           00F424   313 TIM2_CLK_FREQ=62500
      00815A                        314 timer2_init:
      00815A 72 1A 50 C7      [ 1]  315 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      00815E 35 60 53 05      [ 1]  316  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008162 35 08 53 0C      [ 1]  317 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008166 81               [ 4]  318 	ret 
                                    319 
                                    320 ;---------------------------------
                                    321 ; TIM4 is configured to generate an 
                                    322 ; interrupt every millisecond 
                                    323 ;----------------------------------
      008167                        324 timer4_init:
      008167 72 18 50 C7      [ 1]  325 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00816B 35 07 53 45      [ 1]  326 	mov TIM4_PSCR,#7 ; prescale 128  
      00816F 35 7D 53 46      [ 1]  327 	mov TIM4_ARR,#125 ; set for 1msec.
      008173 35 05 53 40      [ 1]  328 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008177 72 10 53 41      [ 1]  329 	bset TIM4_IER,#TIM4_IER_UIE
      00817B 81               [ 4]  330 	ret
                                    331 
                                    332 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    333 ;  routines to write to FLASH, EEPROM 
                                    334 ;  and OPTION 
                                    335 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    336 
                                    337 ;----------------------------------
                                    338 ; unlock EEPROM/OPT for writing/erasing
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    339 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    340 ; input:
                                    341 ;  none
                                    342 ; output:
                                    343 ;  none 
                                    344 ;----------------------------------
      00817C                        345 unlock_eeprom:
      00817C 35 00 50 5B      [ 1]  346 	mov FLASH_CR2,#0 
      008180 35 FF 50 5C      [ 1]  347 	mov FLASH_NCR2,#0xFF 
      008184 35 AE 50 64      [ 1]  348 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008188 35 56 50 64      [ 1]  349     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00818C 72 07 50 5F FB   [ 2]  350 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008191 81               [ 4]  351 	ret
                                    352 
                                    353 ;----------------------------------
                                    354 ; unlock FLASH for writing/erasing
                                    355 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    356 ; input:
                                    357 ;  none
                                    358 ; output:
                                    359 ;  none
                                    360 ;----------------------------------
      008192                        361 unlock_flash:
      008192 35 00 50 5B      [ 1]  362 	mov FLASH_CR2,#0 
      008196 35 FF 50 5C      [ 1]  363 	mov FLASH_NCR2,#0xFF 
      00819A 35 56 50 62      [ 1]  364 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00819E 35 AE 50 62      [ 1]  365 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      0081A2 72 03 50 5F FB   [ 2]  366 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      0081A7 81               [ 4]  367 	ret
                                    368 
                                    369 ;----------------------------
                                    370 ; erase block code must be 
                                    371 ; executed from RAM
                                    372 ; input:
                                    373 ;-----------------------------
      0081A8                        374 row_erase:
      0081A8 35 20 50 5B      [ 1]  375 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      0081AC 35 DF 50 5C      [ 1]  376 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      0081B0 4F               [ 1]  377 	clr a 
      0081B1 90 5F            [ 1]  378 	clrw y 
      0081B3 91 A7 00 17      [ 1]  379 	ldf ([farptr],y),a
      0081B7 90 5C            [ 1]  380     incw y
      0081B9 91 A7 00 17      [ 1]  381 	ldf ([farptr],y),a
      0081BD 90 5C            [ 1]  382     incw y
      0081BF 91 A7 00 17      [ 1]  383 	ldf ([farptr],y),a
      0081C3 90 5C            [ 1]  384     incw y
      0081C5 91 A7 00 17      [ 1]  385 	ldf ([farptr],y),a
      0081C9 72 05 50 5F FB   [ 2]  386 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081CE 81               [ 4]  387 	ret
      0081CF                        388 row_erase_end:
                                    389 
                                    390 ; copy erase_start in RAM 
      0081CF                        391 move_erase_to_ram:
      0081CF AE 81 CF         [ 2]  392 	ldw x,#row_erase_end 
      0081D2 1D 81 A8         [ 2]  393 	subw x,#row_erase
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      0081D5 CF 00 0D         [ 2]  394 	ldw acc16,x 
      0081D8 AE 16 90         [ 2]  395 	ldw x,#tib 
      0081DB 90 AE 81 A8      [ 2]  396 	ldw y,#row_erase 
      0081DF CD 84 B4         [ 4]  397 	call move 
      0081E2 81               [ 4]  398 	ret 
                                    399 
                                    400 ;-----------------------------------
                                    401 ; block programming must be 
                                    402 ; executed from RAM 
                                    403 ; initial contidions: 
                                    404 ; 	memory unlocked
                                    405 ;   bit PRG set in 
                                    406 ; input:
                                    407 ;   x        128 bytes row to program 
                                    408 ;   farptr   row address 
                                    409 ; output:
                                    410 ;   none 
                                    411 ;----------------------------------
                           000001   412 	BCNT=1 
      0081E3                        413 program_row:
      0081E3 4B 80            [ 1]  414 	push #BLOCK_SIZE  
                                    415 ;enable block programming 
      0081E5 72 10 50 5B      [ 1]  416 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0081E9 72 11 50 5C      [ 1]  417 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0081ED 90 5F            [ 1]  418 	clrw y 
      0081EF F6               [ 1]  419 1$:	ld a,(x)
      0081F0 91 A7 00 17      [ 1]  420 	ldf ([farptr],y),a
      0081F4 5C               [ 1]  421 	incw x 
      0081F5 90 5C            [ 1]  422 	incw y 
      0081F7 0A 01            [ 1]  423 	dec (BCNT,sp)
      0081F9 26 F4            [ 1]  424 	jrne 1$
                                    425 ; wait EOP bit 
      0081FB 72 05 50 5F FB   [ 2]  426 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      000180                        427 	_drop 1 
      008200 5B 01            [ 2]    1     addw sp,#1 
      008202 81               [ 4]  428 	ret 
      008203                        429 program_row_end:
                                    430 
                                    431 ;-------------------------
                                    432 ; move program_row to RAM 
                                    433 ; at txtubound address 
                                    434 ;------------------------
      008203                        435 move_prg_to_ram:
      008203 AE 82 03         [ 2]  436 	ldw x,#program_row_end 
      008206 1D 81 E3         [ 2]  437 	subw x,#program_row 
      008209 CF 00 0D         [ 2]  438 	ldw acc16,x 
      00820C AE 16 90         [ 2]  439 	ldw x,#tib 
      00820F 90 AE 81 E3      [ 2]  440 	ldw y,#program_row 
      008213 CD 84 B4         [ 4]  441 	call move 
      008216 81               [ 4]  442 	ret 
                                    443 
                                    444 
                                    445 ;-----------------------------
                                    446 ; write a row in FLASH/EEPROM 
                                    447 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    448 ;    farptr   destination address 
                                    449 ;    x        source address 
                                    450 ;-----------------------------
      008217                        451 write_row:
      008217 89               [ 2]  452 	pushw x 
      008218 72 5D 00 17      [ 1]  453 	tnz farptr 
      00821C 26 1C            [ 1]  454 	jrne to_flash 
      00821E AE 80 00         [ 2]  455 	ldw x,#FLASH_BASE 
      008221 C3 00 18         [ 2]  456 	cpw x,farptr+1 
      008224 24 14            [ 1]  457 	jruge to_flash 
      008226                        458 to_eeprom:
      008226 AE 40 00         [ 2]  459 	ldw x,#EEPROM_BASE 
      008229 C3 00 18         [ 2]  460 	cpw x,farptr+1 
      00822C 24 01            [ 1]  461 	jruge 1$
      00822E 81               [ 4]  462 	ret ; bad address 
      00822F AE 47 FF         [ 2]  463 1$: ldw x,#EEPROM_END 
      008232 23 01            [ 2]  464 	jrule 2$ 
      008234 81               [ 4]  465 	ret ; bad address 
      008235 CD 81 7C         [ 4]  466 2$:	call unlock_eeprom
      008238 20 03            [ 2]  467 	jra do_programming
      00823A                        468 to_flash:
      00823A CD 81 92         [ 4]  469 	call unlock_flash 
      00823D                        470 do_programming:
      00823D 85               [ 2]  471 	popw x 
      00823E CD 16 90         [ 4]  472 	call tib
      008241 72 13 50 5F      [ 1]  473 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008245 72 17 50 5F      [ 1]  474 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008249 81               [ 4]  475 	ret 
                                    476 
                                    477 
                                    478 ;-----------------------------------
                                    479 ; erase flash or EEPROM block
                                    480 ; a blow is 128 bytes 
                                    481 ; input:
                                    482 ;   farptr  address row begin
                                    483 ; output:
                                    484 ;   none
                                    485 ;--------------------------------------
      00824A                        486 block_erase:
      00824A CE 00 18         [ 2]  487 	ldw x,farptr+1
      00824D A3 AA 80         [ 2]  488 	cpw x,#user_space 
      008250 2A 17            [ 1]  489 	jrpl erase_flash 
                                    490 ; erase eeprom block
      008252 A3 40 00         [ 2]  491 	cpw x,#EEPROM_BASE 
      008255 24 01            [ 1]  492 	jruge 1$
      008257 81               [ 4]  493 	ret ; bad address 
      008258 AE 47 FF         [ 2]  494 1$: ldw x,#EEPROM_END 
      00825B 23 01            [ 2]  495 	jrule 2$ 
      00825D 81               [ 4]  496 	ret ; bad address 
      00825E CD 81 7C         [ 4]  497 2$:	call unlock_eeprom 
      008261 CD 16 90         [ 4]  498 	call tib 
      008264 72 17 50 5F      [ 1]  499 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008268 81               [ 4]  500 	ret 
                                    501 ; erase flash block:
      008269                        502 erase_flash:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      008269 CD 81 92         [ 4]  503 	call unlock_flash 
      00826C CD 16 90         [ 4]  504 	call tib 
      00826F 72 13 50 5F      [ 1]  505     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008273 81               [ 4]  506 	ret 
                                    507 
                                    508 
                                    509 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    510 ; write a byte to FLASH or EEPROM/OPTION  
                                    511 ; input:
                                    512 ;    a  		byte to write
                                    513 ;    farptr  	address
                                    514 ;    x          farptr[x]
                                    515 ; output:
                                    516 ;    none
                                    517 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    518 	; variables locales
                           000001   519 	BTW = 1   ; byte to write offset on stack
                           000002   520 	OPT = 2   ; OPTION flag offset on stack
                           000002   521 	VSIZE = 2
      008274                        522 write_byte:
      008274 90 89            [ 2]  523 	pushw y
      0001F6                        524 	_vars VSIZE
      008276 52 02            [ 2]    1     sub sp,#VSIZE 
      008278 6B 01            [ 1]  525 	ld (BTW,sp),a ; byte to write 
      00827A 0F 02            [ 1]  526 	clr (OPT,sp)  ; OPTION flag
                                    527 ; put addr[15:0] in Y, for bounds check.
      00827C 90 CE 00 18      [ 2]  528 	ldw y,farptr+1   ; Y=addr15:0
                                    529 ; check addr[23:16], if <> 0 then it is extened flash memory
      008280 72 5D 00 17      [ 1]  530 	tnz farptr 
      008284 26 14            [ 1]  531 	jrne write_flash
      008286 90 A3 AA 80      [ 2]  532     cpw y,#user_space
      00828A 24 0E            [ 1]  533     jruge write_flash
      00828C 90 A3 40 00      [ 2]  534 	cpw y,#EEPROM_BASE  
      008290 25 52            [ 1]  535     jrult write_exit
      008292 90 A3 48 7F      [ 2]  536 	cpw y,#OPTION_END 
      008296 22 4C            [ 1]  537 	jrugt write_exit
      008298 20 16            [ 2]  538 	jra write_eeprom 
                                    539 ; write program memory
      00829A                        540 write_flash:
      00829A CD 81 92         [ 4]  541 	call unlock_flash 
      00829D 9B               [ 1]  542 1$:	sim 
      00829E 7B 01            [ 1]  543 	ld a,(BTW,sp)
      0082A0 92 A7 00 17      [ 4]  544 	ldf ([farptr],x),a ; farptr[x]=A
      0082A4 72 05 50 5F FB   [ 2]  545 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082A9 9A               [ 1]  546     rim 
      0082AA 72 13 50 5F      [ 1]  547     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0082AE 20 34            [ 2]  548     jra write_exit
                                    549 ; write eeprom and option
      0082B0                        550 write_eeprom:
      0082B0 CD 81 7C         [ 4]  551 	call unlock_eeprom
                                    552 	; check for data eeprom or option eeprom
      0082B3 90 A3 48 00      [ 2]  553 	cpw y,#OPTION_BASE
      0082B7 2B 08            [ 1]  554 	jrmi 1$
      0082B9 90 A3 48 80      [ 2]  555 	cpw y,#OPTION_END+1
      0082BD 2A 02            [ 1]  556 	jrpl 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0082BF 03 02            [ 1]  557 	cpl (OPT,sp)
      0082C1                        558 1$: 
      0082C1 0D 02            [ 1]  559     tnz (OPT,sp)
      0082C3 27 08            [ 1]  560     jreq 2$
                                    561 	; pour modifier une option il faut modifier ces 2 bits
      0082C5 72 1E 50 5B      [ 1]  562     bset FLASH_CR2,#FLASH_CR2_OPT
      0082C9 72 1F 50 5C      [ 1]  563     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0082CD                        564 2$: 
      0082CD 7B 01            [ 1]  565     ld a,(BTW,sp)
      0082CF 92 A7 00 17      [ 4]  566     ldf ([farptr],x),a
      0082D3 0D 02            [ 1]  567     tnz (OPT,sp)
      0082D5 27 08            [ 1]  568     jreq 3$
      0082D7 5C               [ 1]  569     incw x
      0082D8 7B 01            [ 1]  570     ld a,(BTW,sp)
      0082DA 43               [ 1]  571     cpl a
      0082DB 92 A7 00 17      [ 4]  572     ldf ([farptr],x),a
      0082DF 72 05 50 5F FB   [ 2]  573 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082E4                        574 write_exit:
      000264                        575 	_drop VSIZE 
      0082E4 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082E6 90 85            [ 2]  576 	popw y
      0082E8 81               [ 4]  577     ret
                                    578 
                                    579 ;--------------------------------------------
                                    580 ; write a data block to eeprom or flash 
                                    581 ; input:
                                    582 ;   Y        source address   
                                    583 ;   X        array index  destination  farptr[x]
                                    584 ;   BSIZE    block size bytes 
                                    585 ;   farptr   write address , byte* 
                                    586 ; output:
                                    587 ;	X 		after last byte written 
                                    588 ;   Y 		after last byte read 
                                    589 ;  farptr   point after block
                                    590 ;---------------------------------------------
      0082E9                        591 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000269                        592 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    593 	; local var 
                           000001   594 	XSAVE=1 
                           000002   595 	VSIZE=2 
      000269                        596 write_block:
      000269                        597 	_vars VSIZE
      0082E9 52 02            [ 2]    1     sub sp,#VSIZE 
      0082EB 1F 01            [ 2]  598 	ldw (XSAVE,sp),x 
      0082ED 1E 05            [ 2]  599 	ldw x,(BSIZE,sp) 
      0082EF 27 13            [ 1]  600 	jreq 9$
      0082F1 1E 01            [ 2]  601 1$:	ldw x,(XSAVE,sp)
      0082F3 90 F6            [ 1]  602 	ld a,(y)
      0082F5 CD 82 74         [ 4]  603 	call write_byte 
      0082F8 5C               [ 1]  604 	incw x 
      0082F9 90 5C            [ 1]  605 	incw y 
      0082FB 1F 01            [ 2]  606 	ldw (XSAVE,sp),x
      0082FD 1E 05            [ 2]  607 	ldw x,(BSIZE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082FF 5A               [ 2]  608 	decw x
      008300 1F 05            [ 2]  609 	ldw (BSIZE,sp),x 
      008302 26 ED            [ 1]  610 	jrne 1$
      008304                        611 9$:
      008304 1E 01            [ 2]  612 	ldw x,(XSAVE,sp)
      008306 CD 9B 24         [ 4]  613 	call incr_farptr
      000289                        614 	_drop VSIZE
      008309 5B 02            [ 2]    1     addw sp,#VSIZE 
      00830B 81               [ 4]  615 	ret 
                                    616 
                                    617 
                                    618 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    619 ;;   UART1 subroutines
                                    620 ;;   used for user interface 
                                    621 ;;   communication channel.
                                    622 ;;   settings: 
                                    623 ;;		115200 8N1 no flow control
                                    624 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    625 
                                    626 ;--------------------------------
                                    627 ; initialize UART3, 115200 8N1 
                                    628 ;--------------------------------
      00830C                        629 uart3_init: 
      00830C 72 1A 50 11      [ 1]  630 	bset PD_DDR,#UART3_TX_PIN
      008310 72 1A 50 12      [ 1]  631 	bset PD_CR1,#UART3_TX_PIN 
      008314 72 1A 50 13      [ 1]  632 	bset PD_CR2,#UART3_TX_PIN 
      008318 72 16 50 C7      [ 1]  633 	bset CLK_PCKENR1,#CLK_PCKENR1_UART3
      00831C                        634 uart3_set_baud: 
                                    635 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    636 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      00831C A6 E1            [ 1]  637 	ld a,#CLK_SWR_HSI
      00831E C1 50 C3         [ 1]  638 	cp a,CLK_CMSR 
      008321 27 0A            [ 1]  639 	jreq 2$ 
      008323                        640 1$: ; 8 Mhz 	
      008323 35 05 52 43      [ 1]  641 	mov UART3_BRR2,#0x05 ; must be loaded first
      008327 35 04 52 42      [ 1]  642 	mov UART3_BRR1,#0x4
      00832B 20 08            [ 2]  643 	jra 3$
      00832D                        644 2$: ; 16 Mhz 	
      00832D 35 0B 52 43      [ 1]  645 	mov UART3_BRR2,#0x0b ; must be loaded first
      008331 35 08 52 42      [ 1]  646 	mov UART3_BRR1,#0x08
      008335                        647 3$:
      008335 72 5F 52 41      [ 1]  648     clr UART3_DR
      008339 35 2C 52 45      [ 1]  649 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00833D 72 10 52 45      [ 1]  650 	bset UART3_CR2,#UART_CR2_SBK
      008341 72 0D 52 40 FB   [ 2]  651     btjf UART3_SR,#UART_SR_TC,.
      008346 81               [ 4]  652 	ret 
                                    653 
                                    654 ;---------------------------------------------
                                    655 ; initialize UART1, 115200 8N1
                                    656 ; input:
                                    657 ;	none
                                    658 ; output:
                                    659 ;   none
                                    660 ;---------------------------------------------
      008347                        661 uart1_init:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008347 72 1A 50 02      [ 1]  662     bset PA_DDR,#UART1_TX_PIN
      00834B 72 1A 50 03      [ 1]  663     bset PA_CR1,#UART1_TX_PIN 
      00834F 72 1A 50 04      [ 1]  664     bset PA_CR2,#UART1_TX_PIN 
                                    665 ; enable UART1 clock
      008353 72 14 50 C7      [ 1]  666 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008357                        667 uart1_set_baud: 
                                    668 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    669 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008357 A6 E1            [ 1]  670 	ld a,#CLK_SWR_HSI
      008359 C1 50 C3         [ 1]  671 	cp a,CLK_CMSR 
      00835C 27 0A            [ 1]  672 	jreq 2$ 
      00835E                        673 1$: ; 8 Mhz 	
      00835E 35 05 52 33      [ 1]  674 	mov UART1_BRR2,#0x05 ; must be loaded first
      008362 35 04 52 32      [ 1]  675 	mov UART1_BRR1,#0x4
      008366 20 08            [ 2]  676 	jra 3$
      008368                        677 2$: ; 16 Mhz 	
      008368 35 0B 52 33      [ 1]  678 	mov UART1_BRR2,#0x0b ; must be loaded first
      00836C 35 08 52 32      [ 1]  679 	mov UART1_BRR1,#0x08
      008370                        680 3$:
      008370 72 5F 52 31      [ 1]  681     clr UART1_DR
      008374 35 2C 52 35      [ 1]  682 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008378 72 10 52 35      [ 1]  683 	bset UART1_CR2,#UART_CR2_SBK
      00837C 72 0D 52 30 FB   [ 2]  684     btjf UART1_SR,#UART_SR_TC,.
      008381 72 5F 00 2E      [ 1]  685     clr rx_head 
      008385 72 5F 00 2F      [ 1]  686 	clr rx_tail 
      008389 81               [ 4]  687 	ret
                                    688 
                                    689 ;---------------------------------
                                    690 ; send character to UART1 
                                    691 ; input:
                                    692 ;   A 
                                    693 ; output:
                                    694 ;   none 
                                    695 ;--------------------------------	
      00838A                        696 putc::
      00838A 88               [ 1]  697 	push a 
      00838B C6 00 30         [ 1]  698 	ld a,comm 
      00838E 26 0A            [ 1]  699 	jrne putc3
      008390                        700 putc1: 
      008390 84               [ 1]  701 	pop a 
      008391 72 0F 52 30 FB   [ 2]  702 	btjf UART1_SR,#UART_SR_TXE,.
      008396 C7 52 31         [ 1]  703 	ld UART1_DR,a 
      008399 81               [ 4]  704 	ret 
      00839A                        705 putc3:
      00839A 84               [ 1]  706 	pop a 
      00839B 72 0F 52 40 FB   [ 2]  707 	btjf UART3_SR,#UART_SR_TXE,.
      0083A0 C7 52 41         [ 1]  708 	ld UART3_DR,a 
      0083A3 81               [ 4]  709 	ret 
                                    710 
                                    711 ;---------------------------------
                                    712 ; Query for character in rx_queue
                                    713 ; input:
                                    714 ;   none 
                                    715 ; output:
                                    716 ;   A     0 no charcter available
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    717 ;   Z     1 no character available
                                    718 ;---------------------------------
      0083A4                        719 qgetc::
      0083A4 C6 00 2E         [ 1]  720 	ld a,rx_head 
      0083A7 C0 00 2F         [ 1]  721 	sub a,rx_tail 
      0083AA 81               [ 4]  722 	ret 
                                    723 
                                    724 ;---------------------------------
                                    725 ; wait character from UART1 
                                    726 ; input:
                                    727 ;   none
                                    728 ; output:
                                    729 ;   A 			char  
                                    730 ;--------------------------------	
      0083AB                        731 getc::
      0083AB CD 83 A4         [ 4]  732 	call qgetc
      0083AE 27 FB            [ 1]  733 	jreq getc 
      0083B0 89               [ 2]  734 	pushw x 
      0083B1 AE 00 26         [ 2]  735 	ldw x,#rx_queue
      0083B4 9F               [ 1]  736 	ld a,xl 
      0083B5 CB 00 2E         [ 1]  737 	add a,rx_head 
      0083B8 97               [ 1]  738 	ld xl,a 
      0083B9 F6               [ 1]  739 	ld a,(x)
      0083BA 85               [ 2]  740 	popw x
      0083BB 88               [ 1]  741 	push a
      0083BC 72 5C 00 2E      [ 1]  742 	inc rx_head 
      0083C0 A6 07            [ 1]  743 	ld a,#RX_QUEUE_SIZE-1 
      0083C2 C4 00 2E         [ 1]  744 	and a,rx_head 
      0083C5 C7 00 2E         [ 1]  745 	ld rx_head,a 
      0083C8 84               [ 1]  746 	pop a  
      0083C9 81               [ 4]  747 	ret 
                                    748 
                                    749 ;-----------------------------
                                    750 ; drop all characters 
                                    751 ; received in the 
                                    752 ; next Y msec 
                                    753 ; input:
                                    754 ;   Y    drain time msec 
                                    755 ; output:
                                    756 ;   none 
                                    757 ;----------------------------
      0083CA                        758 drain::
      0083CA 90 CF 00 11      [ 2]  759 	ldw timer,y 
      0083CE 90 CE 00 11      [ 2]  760 1$: ldw y,timer 
      0083D2 26 01            [ 1]  761 	jrne 2$
      0083D4 81               [ 4]  762 	ret
      0083D5 CD 83 A4         [ 4]  763 2$:	call qgetc 
      0083D8 27 F4            [ 1]  764 	jreq 1$ 
      0083DA CD 83 AB         [ 4]  765 	call getc 
      0083DD 20 EF            [ 2]  766 	jra 1$
                                    767 
                                    768 
                                    769 ;----------------------
                                    770 ; print token id && value
                                    771 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                                    772 ;   A     token id 
                                    773 ;   X     token value 
                                    774 ;---------------------
                           000001   775 	BSAVE=1
                           000002   776 	AREG=2
                           000003   777 	XREG=3
                           000004   778 	VSIZE=4
      0083DF                        779 prt_tok:
      00035F                        780 	_vars VSIZE 
      0083DF 52 04            [ 2]    1     sub sp,#VSIZE 
      0083E1 6B 02            [ 1]  781 	ld (AREG,sp),a 
      0083E3 1F 03            [ 2]  782 	ldw (XREG,sp),x 
      0083E5 C6 00 0B         [ 1]  783 	ld a, base
      0083E8 6B 01            [ 1]  784 	ld (BSAVE,sp),a 
      0083EA 35 10 00 0B      [ 1]  785 	mov base,#16  
      0083EE AE 84 16         [ 2]  786 	ldw x,#token_msg
      0083F1 CD AA C0         [ 4]  787 	call puts 
      0083F4 5F               [ 1]  788 	clrw x 
      0083F5 7B 02            [ 1]  789 	ld a,(AREG,sp)
      0083F7 97               [ 1]  790 	ld xl,a 
      0083F8 CD 8A CD         [ 4]  791 	call print_int 
      0083FB A6 20            [ 1]  792 	ld a,#SPACE
      0083FD CD 83 8A         [ 4]  793 	call putc 
      008400 1E 03            [ 2]  794 	ldw x,(XREG,sp)
      008402 CD 8A CD         [ 4]  795 	call print_int 
      008405 A6 0D            [ 1]  796 	ld a,#CR 
      008407 CD 83 8A         [ 4]  797 	call putc 
      00840A 7B 01            [ 1]  798 	ld a,(BSAVE,sp)
      00840C C7 00 0B         [ 1]  799 	ld base,a 
      00840F 7B 02            [ 1]  800 	ld a,(AREG,sp)
      008411 1E 03            [ 2]  801 	ldw x,(XREG,sp)
      000393                        802 	_drop VSIZE 
      008413 5B 04            [ 2]    1     addw sp,#VSIZE 
      008415 81               [ 4]  803 	ret 
      008416 74 6F 6B 65 6E 3A 20   804 token_msg: .asciz "token: "
             00
                                    805 
                                    806 
                                    807 ;---------------------
                                    808 ; display n bytes row 
                                    809 ; from memory.
                                    810 ; input:
                                    811 ;   A   bytes to print 
                                    812 ;	X   start address 
                                    813 ; output:
                                    814 ;   X   address after last shown  
                                    815 ;---------------------
                           000001   816 	CNT=1 
                           000002   817 	ADR=2 
                           000003   818 	VSIZE=3 
      00841E                        819 show_row:
      00841E 4D               [ 1]  820 	tnz a 
      00841F 26 01            [ 1]  821 	jrne 1$
      008421 81               [ 4]  822 	ret 
      008422                        823 1$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      008422 89               [ 2]  824 	pushw x  
      008423 88               [ 1]  825 	push a 
      008424 35 04 00 25      [ 1]  826 	mov tab_width,#4 
      008428 CD 8A CD         [ 4]  827 	call print_int 
      00842B A6 20            [ 1]  828 	ld a,#SPACE  
      00842D CD 83 8A         [ 4]  829 	call putc
      008430                        830 row_loop:
      008430 1E 02            [ 2]  831 	ldw x,(ADR,sp)
      008432 F6               [ 1]  832 	ld a,(x)
      008433 5F               [ 1]  833 	clrw x 
      008434 97               [ 1]  834 	ld xl,a 
      008435 CD 8A CD         [ 4]  835 	call print_int 
      008438 1E 02            [ 2]  836 	ldw x,(ADR,sp)
      00843A 5C               [ 1]  837 	incw x 
      00843B 1F 02            [ 2]  838 	ldw (ADR,sp),x 
      00843D 0A 01            [ 1]  839 	dec (CNT,sp)
      00843F 26 EF            [ 1]  840 	jrne row_loop
      0003C1                        841 	_drop VSIZE  		
      008441 5B 03            [ 2]    1     addw sp,#VSIZE 
      008443 35 04 00 25      [ 1]  842 	mov tab_width,#4
      008447 A6 0D            [ 1]  843 	ld a,#CR 
      008449 CD 83 8A         [ 4]  844 	call putc 
      00844C 81               [ 4]  845 	ret 
                                    846 
                                    847 ;--------------------------
                                    848 ; print memory content 
                                    849 ; in hexadecimal format
                                    850 ;  input:
                                    851 ;    X    start address 
                                    852 ;    Y    count 
                                    853 ;--------------------------
                           000001   854 	BCNT=1
                           000003   855 	BASE=3
                           000004   856 	TABW=4
                           000004   857 	VSIZE=4   
      00844D                        858 hex_dump:
      0003CD                        859 	_vars VSIZE
      00844D 52 04            [ 2]    1     sub sp,#VSIZE 
      00844F C6 00 0B         [ 1]  860 	ld a,base
      008452 6B 03            [ 1]  861 	ld (BASE,sp),a 
      008454 35 10 00 0B      [ 1]  862 	mov base,#16
      008458 C6 00 25         [ 1]  863 	ld a,tab_width 
      00845B 6B 04            [ 1]  864 	ld (TABW,sp),a
      00845D A6 0D            [ 1]  865 	ld a,#CR 
      00845F CD 83 8A         [ 4]  866 	call putc 
      008462 17 01            [ 2]  867 1$: ldw (BCNT,sp),y
      008464 A6 10            [ 1]  868 	ld a,#16
      008466 90 A3 00 10      [ 2]  869 	cpw y,#16
      00846A 2A 02            [ 1]  870 	jrpl 2$
      00846C 90 9F            [ 1]  871 	ld a,yl
      00846E                        872 2$: 	
      00846E CD 84 1E         [ 4]  873 	call show_row 
      008471 16 01            [ 2]  874 	ldw y,(BCNT,sp) 
      008473 72 A2 00 10      [ 2]  875 	subw y,#16 
      008477 90 A3 00 01      [ 2]  876 	cpw y,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      00847B 2A E5            [ 1]  877 	jrpl 1$
      00847D 7B 03            [ 1]  878 	ld a,(BASE,sp)
      00847F C7 00 0B         [ 1]  879 	ld base,a
      008482 7B 04            [ 1]  880 	ld a,(TABW,sp)
      008484 C7 00 25         [ 1]  881 	ld tab_width,a 
      000407                        882 	_drop VSIZE
      008487 5B 04            [ 2]    1     addw sp,#VSIZE 
      008489 81               [ 4]  883 	ret 
                                    884 
                                    885 ;-------------------------------------
                                    886 ; retrun string length
                                    887 ; input:
                                    888 ;   X         .asciz  pointer 
                                    889 ; output:
                                    890 ;   X         not affected 
                                    891 ;   A         length 
                                    892 ;-------------------------------------
      00848A                        893 strlen::
      00848A 89               [ 2]  894 	pushw x 
      00848B 4F               [ 1]  895 	clr a
      00848C 7D               [ 1]  896 1$:	tnz (x) 
      00848D 27 04            [ 1]  897 	jreq 9$ 
      00848F 4C               [ 1]  898 	inc a 
      008490 5C               [ 1]  899 	incw x 
      008491 20 F9            [ 2]  900 	jra 1$ 
      008493 85               [ 2]  901 9$:	popw x 
      008494 81               [ 4]  902 	ret 
                                    903 
                                    904 ;------------------------------------
                                    905 ; compare 2 strings
                                    906 ; input:
                                    907 ;   X 		char* first string 
                                    908 ;   Y       char* second string 
                                    909 ; output:
                                    910 ;   A 		0|1 
                                    911 ;-------------------------------------
      008495                        912 strcmp:
      008495 F6               [ 1]  913 	ld a,(x)
      008496 27 0B            [ 1]  914 	jreq 5$ 
      008498 90 F1            [ 1]  915 	cp a,(y) 
      00849A 26 05            [ 1]  916 	jrne 4$ 
      00849C 5C               [ 1]  917 	incw x 
      00849D 90 5C            [ 1]  918 	incw y 
      00849F 20 F4            [ 2]  919 	jra strcmp 
      0084A1                        920 4$: ; not same  
      0084A1 4F               [ 1]  921 	clr a 
      0084A2 81               [ 4]  922 	ret 
      0084A3                        923 5$: ; same 
      0084A3 A6 01            [ 1]  924 	ld a,#1 
      0084A5 81               [ 4]  925 	ret 
                                    926 
                                    927 
                                    928 ;---------------------------------------
                                    929 ;  copy src to dest 
                                    930 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    931 ;   X 		dest 
                                    932 ;   Y 		src 
                                    933 ; output: 
                                    934 ;   X 		dest 
                                    935 ;----------------------------------
      0084A6                        936 strcpy:
      0084A6 89               [ 2]  937 	pushw x 
      0084A7 90 F6            [ 1]  938 1$: ld a,(y)
      0084A9 27 06            [ 1]  939 	jreq 9$ 
      0084AB F7               [ 1]  940 	ld (x),a 
      0084AC 5C               [ 1]  941 	incw x 
      0084AD 90 5C            [ 1]  942 	incw y 
      0084AF 20 F6            [ 2]  943 	jra 1$ 
      0084B1 7F               [ 1]  944 9$:	clr (x)
      0084B2 85               [ 2]  945 	popw x 
      0084B3 81               [ 4]  946 	ret 
                                    947 
                                    948 ;---------------------------------------
                                    949 ; move memory block 
                                    950 ; input:
                                    951 ;   X 		destination 
                                    952 ;   Y 	    source 
                                    953 ;   acc16	bytes count 
                                    954 ; output:
                                    955 ;   none 
                                    956 ;--------------------------------------
                           000001   957 	INCR=1 ; increament high byte 
                           000002   958 	LB=2 ; increament low byte 
                           000002   959 	VSIZE=2
      0084B4                        960 move::
      000434                        961 	_vars VSIZE 
      0084B4 52 02            [ 2]    1     sub sp,#VSIZE 
      0084B6 0F 01            [ 1]  962 	clr (INCR,sp)
      0084B8 0F 02            [ 1]  963 	clr (LB,sp)
      0084BA 90 89            [ 2]  964 	pushw y 
      0084BC 13 01            [ 2]  965 	cpw x,(1,sp) ; compare DEST to SRC 
      0084BE 90 85            [ 2]  966 	popw y 
      0084C0 27 31            [ 1]  967 	jreq move_exit ; x==y 
      0084C2 2B 0E            [ 1]  968 	jrmi move_down
      0084C4                        969 move_up: ; start from top address with incr=-1
      0084C4 72 BB 00 0D      [ 2]  970 	addw x,acc16
      0084C8 72 B9 00 0D      [ 2]  971 	addw y,acc16
      0084CC 03 01            [ 1]  972 	cpl (INCR,sp)
      0084CE 03 02            [ 1]  973 	cpl (LB,sp)   ; increment = -1 
      0084D0 20 05            [ 2]  974 	jra move_loop  
      0084D2                        975 move_down: ; start from bottom address with incr=1 
      0084D2 5A               [ 2]  976     decw x 
      0084D3 90 5A            [ 2]  977 	decw y
      0084D5 0C 02            [ 1]  978 	inc (LB,sp) ; incr=1 
      0084D7                        979 move_loop:	
      0084D7 C6 00 0D         [ 1]  980     ld a, acc16 
      0084DA CA 00 0E         [ 1]  981 	or a, acc8
      0084DD 27 14            [ 1]  982 	jreq move_exit 
      0084DF 72 FB 01         [ 2]  983 	addw x,(INCR,sp)
      0084E2 72 F9 01         [ 2]  984 	addw y,(INCR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084E5 90 F6            [ 1]  985 	ld a,(y)
      0084E7 F7               [ 1]  986 	ld (x),a 
      0084E8 89               [ 2]  987 	pushw x 
      0084E9 CE 00 0D         [ 2]  988 	ldw x,acc16 
      0084EC 5A               [ 2]  989 	decw x 
      0084ED CF 00 0D         [ 2]  990 	ldw acc16,x 
      0084F0 85               [ 2]  991 	popw x 
      0084F1 20 E4            [ 2]  992 	jra move_loop
      0084F3                        993 move_exit:
      000473                        994 	_drop VSIZE
      0084F3 5B 02            [ 2]    1     addw sp,#VSIZE 
      0084F5 81               [ 4]  995 	ret 	
                                    996 
                                    997 ;-------------------------------------
                                    998 ; search text area for a line#
                                    999 ; input:
                                   1000 ;	X 			line# 
                                   1001 ; output:
                                   1002 ;   X 			addr of line | 0 
                                   1003 ;   Y           line#|insert address if not found  
                                   1004 ;-------------------------------------
                           000001  1005 	LL=1 ; line length 
                           000002  1006 	LB=2 ; line length low byte 
                           000002  1007 	VSIZE=2 
      0084F6                       1008 search_lineno::
      000476                       1009 	_vars VSIZE
      0084F6 52 02            [ 2]    1     sub sp,#VSIZE 
      0084F8 0F 01            [ 1] 1010 	clr (LL,sp)
      0084FA 90 CE 00 1D      [ 2] 1011 	ldw y,txtbgn
      0084FE                       1012 search_ln_loop:
      0084FE 90 C3 00 1F      [ 2] 1013 	cpw y,txtend 
      008502 2A 10            [ 1] 1014 	jrpl 8$
      008504 90 F3            [ 1] 1015 	cpw x,(y)
      008506 27 0E            [ 1] 1016 	jreq 9$
      008508 2B 0A            [ 1] 1017 	jrmi 8$ 
      00850A 90 E6 02         [ 1] 1018 	ld a,(2,y)
      00850D 6B 02            [ 1] 1019 	ld (LB,sp),a 
      00850F 72 F9 01         [ 2] 1020 	addw y,(LL,sp)
      008512 20 EA            [ 2] 1021 	jra search_ln_loop 
      008514                       1022 8$: 
      008514 5F               [ 1] 1023 	clrw x 	
      008515 51               [ 1] 1024 	exgw x,y 
      000496                       1025 9$: _drop VSIZE
      008516 5B 02            [ 2]    1     addw sp,#VSIZE 
      008518 51               [ 1] 1026 	exgw x,y   
      008519 81               [ 4] 1027 	ret 
                                   1028 
                                   1029 ;-------------------------------------
                                   1030 ; delete line at addr
                                   1031 ; input:
                                   1032 ;   X 		addr of line i.e DEST for move 
                                   1033 ;-------------------------------------
                           000001  1034 	LLEN=1
                           000003  1035 	SRC=3
                           000004  1036 	VSIZE=4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      00851A                       1037 del_line: 
      00049A                       1038 	_vars VSIZE 
      00851A 52 04            [ 2]    1     sub sp,#VSIZE 
      00851C E6 02            [ 1] 1039 	ld a,(2,x) ; line length
      00851E 6B 02            [ 1] 1040 	ld (LLEN+1,sp),a 
      008520 0F 01            [ 1] 1041 	clr (LLEN,sp)
      008522 90 93            [ 1] 1042 	ldw y,x  
      008524 72 F9 01         [ 2] 1043 	addw y,(LLEN,sp) ;SRC  
      008527 17 03            [ 2] 1044 	ldw (SRC,sp),y  ;save source 
      008529 90 CE 00 1F      [ 2] 1045 	ldw y,txtend 
      00852D 72 F2 03         [ 2] 1046 	subw y,(SRC,sp) ; y=count 
      008530 90 CF 00 0D      [ 2] 1047 	ldw acc16,y 
      008534 16 03            [ 2] 1048 	ldw y,(SRC,sp)    ; source
      008536 CD 84 B4         [ 4] 1049 	call move
      008539 90 CE 00 1F      [ 2] 1050 	ldw y,txtend 
      00853D 72 F2 01         [ 2] 1051 	subw y,(LLEN,sp)
      008540 90 CF 00 1F      [ 2] 1052 	ldw txtend,y  
      0004C4                       1053 	_drop VSIZE     
      008544 5B 04            [ 2]    1     addw sp,#VSIZE 
      008546 81               [ 4] 1054 	ret 
                                   1055 
                                   1056 ;---------------------------------------------
                                   1057 ; create a gap in text area to 
                                   1058 ; move new line in this gap
                                   1059 ; input:
                                   1060 ;    X 			addr gap start 
                                   1061 ;    Y 			gap length 
                                   1062 ; output:
                                   1063 ;    X 			addr gap start 
                                   1064 ;--------------------------------------------
                           000001  1065 	DEST=1
                           000003  1066 	SRC=3
                           000005  1067 	LEN=5
                           000006  1068 	VSIZE=6 
      008547                       1069 create_gap:
      0004C7                       1070 	_vars VSIZE
      008547 52 06            [ 2]    1     sub sp,#VSIZE 
      008549 1F 03            [ 2] 1071 	ldw (SRC,sp),x 
      00854B 17 05            [ 2] 1072 	ldw (LEN,sp),y 
      00854D 90 CF 00 0D      [ 2] 1073 	ldw acc16,y 
      008551 90 93            [ 1] 1074 	ldw y,x ; SRC
      008553 72 BB 00 0D      [ 2] 1075 	addw x,acc16  
      008557 1F 01            [ 2] 1076 	ldw (DEST,sp),x 
                                   1077 ;compute size to move 	
      008559 CE 00 1F         [ 2] 1078 	ldw x,txtend 
      00855C 72 F0 03         [ 2] 1079 	subw x,(SRC,sp)
      00855F CF 00 0D         [ 2] 1080 	ldw acc16,x ; size to move
      008562 1E 01            [ 2] 1081 	ldw x,(DEST,sp) 
      008564 CD 84 B4         [ 4] 1082 	call move
      008567 CE 00 1F         [ 2] 1083 	ldw x,txtend
      00856A 72 FB 05         [ 2] 1084 	addw x,(LEN,sp)
      00856D CF 00 1F         [ 2] 1085 	ldw txtend,x
      0004F0                       1086 9$:	_drop VSIZE 
      008570 5B 06            [ 2]    1     addw sp,#VSIZE 
      008572 81               [ 4] 1087 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1088 
                                   1089 ;--------------------------------------------
                                   1090 ; insert line in pad into text area 
                                   1091 ; first search for already existing 
                                   1092 ; replace existing 
                                   1093 ; if new line empty delete existing one. 
                                   1094 ; input:
                                   1095 ;   ptr16		pointer to tokenized line  
                                   1096 ; output:
                                   1097 ;   none
                                   1098 ;---------------------------------------------
                           000001  1099 	DEST=1  ; text area insertion address 
                           000003  1100 	SRC=3   ; str to insert address 
                           000005  1101 	LINENO=5 ; line number 
                           000007  1102 	LLEN=7 ; line length 
                           000008  1103 	VSIZE=8  
      008573                       1104 insert_line:
      0004F3                       1105 	_vars VSIZE 
      008573 52 08            [ 2]    1     sub sp,#VSIZE 
      008575 CE 00 1F         [ 2] 1106 	ldw x,txtend  
      008578 C3 00 1D         [ 2] 1107 	cpw x,txtbgn 
      00857B 26 19            [ 1] 1108 	jrne 0$
                                   1109 ;first text line 
      00857D AE 00 02         [ 2] 1110 	ldw x,#2 
      008580 72 D6 00 18      [ 4] 1111 	ld a,([ptr16],x)
      008584 A1 03            [ 1] 1112 	cp a,#3
      008586 27 59            [ 1] 1113 	jreq insert_ln_exit
      008588 5F               [ 1] 1114 	clrw x 
      008589 97               [ 1] 1115 	ld xl,a
      00858A 1F 07            [ 2] 1116 	ldw (LLEN,sp),x 
      00858C CE 00 1D         [ 2] 1117 	ldw x,txtbgn
      00858F 1F 01            [ 2] 1118 	ldw (DEST,sp),x 
      008591 CE 00 1F         [ 2] 1119 	ldw x,txtend 
      008594 20 37            [ 2] 1120 	jra 4$
      008596 72 CE 00 18      [ 5] 1121 0$:	ldw x,[ptr16]
                                   1122 ; line number
      00859A 1F 05            [ 2] 1123 	ldw (LINENO,sp),x 
      00859C AE 00 02         [ 2] 1124 	ldw x,#2 
      00859F 72 D6 00 18      [ 4] 1125 	ld a,([ptr16],x)
      0085A3 97               [ 1] 1126 	ld xl,a
                                   1127 ; line length
      0085A4 1F 07            [ 2] 1128 	ldw (LLEN,sp),x
                                   1129 ; check if that line number already exit 	
      0085A6 1E 05            [ 2] 1130 	ldw x,(LINENO,sp)
      0085A8 CD 84 F6         [ 4] 1131 	call search_lineno 
      0085AB 5D               [ 2] 1132 	tnzw x 
      0085AC 26 04            [ 1] 1133 	jrne 2$
                                   1134 ; line doesn't exit
                                   1135 ; it will be inserted at this point.  	
      0085AE 17 01            [ 2] 1136 	ldw (DEST,sp),y 
      0085B0 20 05            [ 2] 1137 	jra 3$
                                   1138 ; line exit delete it.
                                   1139 ; it will be replaced by new one 	
      0085B2 1F 01            [ 2] 1140 2$: ldw (DEST,sp),x 
      0085B4 CD 85 1A         [ 4] 1141 	call del_line
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0085B7                       1142 3$: 
                                   1143 ; insert new line or leave if LLEN==3
                                   1144 ; LLEN==3 means empty line 
      0085B7 A6 03            [ 1] 1145 	ld a,#3
      0085B9 11 08            [ 1] 1146 	cp a,(LLEN+1,sp)
      0085BB 27 24            [ 1] 1147 	jreq insert_ln_exit ; empty line exit.
                                   1148 ; if insertion point at txtend 
                                   1149 ; move no need to create a gap 
      0085BD 1E 01            [ 2] 1150 	ldw x,(DEST,sp)
      0085BF C3 00 1F         [ 2] 1151 	cpw x,txtend 
      0085C2 27 09            [ 1] 1152 	jreq 4$ 
                                   1153 ; must create a gap
                                   1154 ; at insertion point  
      0085C4 1E 01            [ 2] 1155 	ldw x,(DEST,sp)
      0085C6 16 07            [ 2] 1156 	ldw y,(LLEN,sp)
      0085C8 CD 85 47         [ 4] 1157 	call create_gap
      0085CB 20 06            [ 2] 1158 	jra 5$
      0085CD                       1159 4$: 
      0085CD 72 FB 07         [ 2] 1160 	addw x,(LLEN,sp)
      0085D0 CF 00 1F         [ 2] 1161 	ldw txtend,x 	 
                                   1162 ; move new line in gap 
      0085D3 1E 07            [ 2] 1163 5$:	ldw x,(LLEN,sp)
      0085D5 CF 00 0D         [ 2] 1164 	ldw acc16,x 
      0085D8 90 AE 16 E0      [ 2] 1165 	ldw y,#pad ;SRC 
      0085DC 1E 01            [ 2] 1166 	ldw x,(DEST,sp) ; dest address 
      0085DE CD 84 B4         [ 4] 1167 	call move 
      0085E1                       1168 insert_ln_exit:	
      000561                       1169 	_drop VSIZE
      0085E1 5B 08            [ 2]    1     addw sp,#VSIZE 
      0085E3 81               [ 4] 1170 	ret
                                   1171 
                                   1172 ;-----------------------------------
                                   1173 ; create token list fromm text line 
                                   1174 ; save this list in pad buffer 
                                   1175 ;  compiled line format: 
                                   1176 ;    line_no  2 bytes {0...32767}
                                   1177 ;    count    1 byte  
                                   1178 ;    tokens   variable length 
                                   1179 ;   
                                   1180 ; input:
                                   1181 ;   none
                                   1182 ; modified variables:
                                   1183 ;   basicptr     token list buffer address 
                                   1184 ;   in.w  		 3|count, i.e. index in buffer
                                   1185 ;   count        length of line | 0  
                                   1186 ;-----------------------------------
                           000001  1187 	XSAVE=1
                           000002  1188 	VSIZE=2
      0085E4                       1189 compile:
      000564                       1190 	_vars VSIZE 
      0085E4 52 02            [ 2]    1     sub sp,#VSIZE 
      0085E6 72 1A 00 24      [ 1] 1191 	bset flags,#FCOMP 
      0085EA A6 00            [ 1] 1192 	ld a,#0
      0085EC AE 00 00         [ 2] 1193 	ldw x,#0
      0085EF CF 16 E0         [ 2] 1194 	ldw pad,x ; destination buffer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0085F2 C7 16 E2         [ 1] 1195 	ld pad+2,a ; count 
      0085F5 AE 16 E3         [ 2] 1196 	ldw x,#pad+3
      0085F8 72 5F 00 02      [ 1] 1197 	clr in 
      0085FC CD 8C FC         [ 4] 1198 	call get_token
      0085FF A1 84            [ 1] 1199 	cp a,#TK_INTGR
      008601 26 11            [ 1] 1200 	jrne 2$
      008603 A3 00 01         [ 2] 1201 	cpw x,#1 
      008606 2A 05            [ 1] 1202 	jrpl 1$
      008608 A6 0A            [ 1] 1203 	ld a,#ERR_BAD_VALUE
      00860A CC 89 7C         [ 2] 1204 	jp tb_error
      00860D CF 16 E0         [ 2] 1205 1$:	ldw pad,x 
      008610 90 AE 16 E3      [ 2] 1206 	ldw y,#pad+3 
      008614 90 A3 17 60      [ 2] 1207 2$:	cpw y,#stack_full 
      008618 25 05            [ 1] 1208 	jrult 3$
      00861A A6 0F            [ 1] 1209 	ld a,#ERR_BUF_FULL 
      00861C CC 89 7C         [ 2] 1210 	jp tb_error 
      00861F                       1211 3$:	
      00861F 93               [ 1] 1212 	ldw x,y 
      008620 CD 8C FC         [ 4] 1213 	call get_token 
      008623 A1 00            [ 1] 1214 	cp a,#TK_NONE 
      008625 26 ED            [ 1] 1215 	jrne 2$ 
                                   1216 ; compilation completed  
      008627 72 A2 16 E0      [ 2] 1217 	subw y,#pad
      00862B 90 9F            [ 1] 1218     ld a,yl
      00862D AE 16 E0         [ 2] 1219 	ldw x,#pad 
      008630 CF 00 18         [ 2] 1220 	ldw ptr16,x 
      008633 E7 02            [ 1] 1221 	ld (2,x),a 
      008635 FE               [ 2] 1222 	ldw x,(x)
      008636 27 09            [ 1] 1223 	jreq 10$
      008638 CD 85 73         [ 4] 1224 	call insert_line
      00863B 72 5F 00 04      [ 1] 1225 	clr  count 
      00863F 20 0F            [ 2] 1226 	jra  11$ 
      008641                       1227 10$: ; line# is zero 
      008641 CE 00 18         [ 2] 1228 	ldw x,ptr16  
      008644 CF 00 05         [ 2] 1229 	ldw basicptr,x 
      008647 E6 02            [ 1] 1230 	ld a,(2,x)
      008649 C7 00 04         [ 1] 1231 	ld count,a 
      00864C 35 03 00 02      [ 1] 1232 	mov in,#3 
      008650                       1233 11$:
      0005D0                       1234 	_drop VSIZE 
      008650 5B 02            [ 2]    1     addw sp,#VSIZE 
      008652 72 1B 00 24      [ 1] 1235 	bres flags,#FCOMP 
      008656 81               [ 4] 1236 	ret 
                                   1237 
                                   1238 ;------------------------------------
                                   1239 ;  set all variables to zero 
                                   1240 ; input:
                                   1241 ;   none 
                                   1242 ; output:
                                   1243 ;	none
                                   1244 ;------------------------------------
      008657                       1245 clear_vars:
      008657 AE 00 31         [ 2] 1246 	ldw x,#vars 
      00865A 90 AE 00 34      [ 2] 1247 	ldw y,#2*26 
      00865E 7F               [ 1] 1248 1$:	clr (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00865F 5C               [ 1] 1249 	incw x 
      008660 90 5A            [ 2] 1250 	decw y 
      008662 26 FA            [ 1] 1251 	jrne 1$
      008664 81               [ 4] 1252 	ret 
                                   1253 
                                   1254 ;-------------------------------------
                                   1255 ; check if A is a letter 
                                   1256 ; input:
                                   1257 ;   A 			character to test 
                                   1258 ; output:
                                   1259 ;   C flag      1 true, 0 false 
                                   1260 ;-------------------------------------
      008665                       1261 is_alpha:
      008665 A1 41            [ 1] 1262 	cp a,#'A 
      008667 8C               [ 1] 1263 	ccf 
      008668 24 0B            [ 1] 1264 	jrnc 9$ 
      00866A A1 5B            [ 1] 1265 	cp a,#'Z+1 
      00866C 25 07            [ 1] 1266 	jrc 9$ 
      00866E A1 61            [ 1] 1267 	cp a,#'a 
      008670 8C               [ 1] 1268 	ccf 
      008671 24 02            [ 1] 1269 	jrnc 9$
      008673 A1 7B            [ 1] 1270 	cp a,#'z+1
      008675 81               [ 4] 1271 9$: ret 	
                                   1272 
                                   1273 ;------------------------------------
                                   1274 ; check if character in {'0'..'9'}
                                   1275 ; input:
                                   1276 ;    A  character to test
                                   1277 ; output:
                                   1278 ;    Carry  0 not digit | 1 digit
                                   1279 ;------------------------------------
      008676                       1280 is_digit:
      008676 A1 30            [ 1] 1281 	cp a,#'0
      008678 25 03            [ 1] 1282 	jrc 1$
      00867A A1 3A            [ 1] 1283     cp a,#'9+1
      00867C 8C               [ 1] 1284 	ccf 
      00867D 8C               [ 1] 1285 1$:	ccf 
      00867E 81               [ 4] 1286     ret
                                   1287 
                                   1288 ;-------------------------------------
                                   1289 ; return true if character in  A 
                                   1290 ; is letter or digit.
                                   1291 ; input:
                                   1292 ;   A     ASCII character 
                                   1293 ; output:
                                   1294 ;   A     no change 
                                   1295 ;   Carry    0 false| 1 true 
                                   1296 ;--------------------------------------
      00867F                       1297 is_alnum:
      00867F CD 86 76         [ 4] 1298 	call is_digit
      008682 25 03            [ 1] 1299 	jrc 1$ 
      008684 CD 86 65         [ 4] 1300 	call is_alpha
      008687 81               [ 4] 1301 1$:	ret 
                                   1302 
                                   1303 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1304 ;-------------------------------------
                                   1305 ;  program initialization entry point 
                                   1306 ;-------------------------------------
                           000001  1307 	MAJOR=1
                           000000  1308 	MINOR=0
      008688 0A 0A 54 69 6E 79 20  1309 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0086CE                       1310 cold_start:
                                   1311 ;set stack 
      0086CE AE 17 FF         [ 2] 1312 	ldw x,#STACK_EMPTY
      0086D1 94               [ 1] 1313 	ldw sp,x   
                                   1314 ; clear all ram 
      0086D2 7F               [ 1] 1315 0$: clr (x)
      0086D3 5A               [ 2] 1316 	decw x 
      0086D4 26 FC            [ 1] 1317 	jrne 0$
                                   1318 ; activate pull up on all inputs 
      0086D6 A6 FF            [ 1] 1319 	ld a,#255 
      0086D8 C7 50 03         [ 1] 1320 	ld PA_CR1,a 
      0086DB C7 50 08         [ 1] 1321 	ld PB_CR1,a 
      0086DE C7 50 0D         [ 1] 1322 	ld PC_CR1,a 
      0086E1 C7 50 12         [ 1] 1323 	ld PD_CR1,a 
      0086E4 C7 50 17         [ 1] 1324 	ld PE_CR1,a 
      0086E7 C7 50 1C         [ 1] 1325 	ld PF_CR1,a 
      0086EA C7 50 21         [ 1] 1326 	ld PG_CR1,a 
      0086ED C7 50 2B         [ 1] 1327 	ld PI_CR1,a
                                   1328 ; set LD2 pin as output and turn it on
      0086F0 72 1A 50 0D      [ 1] 1329     bset PC_CR1,#LED2_BIT
      0086F4 72 1A 50 0E      [ 1] 1330     bset PC_CR2,#LED2_BIT
      0086F8 72 1A 50 0C      [ 1] 1331     bset PC_DDR,#LED2_BIT
      0086FC 72 1A 50 0A      [ 1] 1332 	bset PC_ODR,#LED2_BIT 
                                   1333 ; disable schmitt triggers on Arduino CN4 analog inputs
      008700 55 00 3F 54 07   [ 1] 1334 	mov ADC_TDRL,0x3f
                                   1335 ; disable peripherals clocks
                                   1336 ;	clr CLK_PCKENR1 
                                   1337 ;	clr CLK_PCKENR2
      008705 72 5F 50 F2      [ 1] 1338 	clr AWU_TBR 
      008709 72 14 50 CA      [ 1] 1339 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1340 ; select internal clock no divisor: 16 Mhz 	
      00870D A6 E1            [ 1] 1341 	ld a,#CLK_SWR_HSI 
      00870F 5F               [ 1] 1342 	clrw x  
      008710 CD 81 44         [ 4] 1343     call clock_init 
      008713 CD 81 67         [ 4] 1344 	call timer4_init
      008716 CD 81 5A         [ 4] 1345 	call timer2_init
                                   1346 ; UART1 at 115200 BAUD
      008719 CD 83 47         [ 4] 1347 	call uart1_init
                                   1348 ; UART3 at 115200 BAUD 
      00871C CD 83 0C         [ 4] 1349 	call uart3_init	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      00871F 72 5F 00 30      [ 1] 1350 	clr comm ; default to UART1
                                   1351 ; activate PE_4 (user button interrupt)
      008723 72 18 50 18      [ 1] 1352     bset PE_CR2,#USR_BTN_BIT 
                                   1353 ; display system information
      008727 AE 86 88         [ 2] 1354 	ldw x,#software 
      00872A CD AA C0         [ 4] 1355 	call puts 
      00872D A6 01            [ 1] 1356 	ld a,#MAJOR 
      00872F C7 00 0E         [ 1] 1357 	ld acc8,a 
      008732 5F               [ 1] 1358 	clrw x 
      008733 CF 00 0C         [ 2] 1359 	ldw acc24,x
      008736 72 5F 00 25      [ 1] 1360 	clr tab_width  
      00873A 35 0A 00 0B      [ 1] 1361 	mov base, #10 
      00873E CD 8A DD         [ 4] 1362 	call prti24 
      008741 A6 2E            [ 1] 1363 	ld a,#'.
      008743 CD 83 8A         [ 4] 1364 	call putc 
      008746 A6 00            [ 1] 1365 	ld a,#MINOR 
      008748 C7 00 0E         [ 1] 1366 	ld acc8,a 
      00874B 5F               [ 1] 1367 	clrw x 
      00874C CF 00 0C         [ 2] 1368 	ldw acc24,x 
      00874F CD 8A DD         [ 4] 1369 	call prti24
      008752 A6 0D            [ 1] 1370 	ld a,#CR 
      008754 CD 83 8A         [ 4] 1371 	call putc
      008757 CD 9B 32         [ 4] 1372 	call seek_fdrive 
      00875A 9A               [ 1] 1373 	rim 
      00875B 72 5C 00 16      [ 1] 1374 	inc seedy+1 
      00875F 72 5C 00 14      [ 1] 1375 	inc seedx+1 
      008763 CD 87 E4         [ 4] 1376 	call clear_basic
      008766 CD 93 4A         [ 4] 1377 	call ubound 
                                   1378 ;	jra 2$	
      008769 CD 99 80         [ 4] 1379 	call beep_1khz  
      00876C 72 1B 50 0A      [ 1] 1380 2$:	bres PC_ODR,#LED2_BIT	
      008770 CD 87 79         [ 4] 1381 	call warm_init
      008773 CD 87 A6         [ 4] 1382 	call load_autorun
      008776 CC 8A 04         [ 2] 1383     jp cmd_line  
                                   1384 
      008779                       1385 warm_init:
      008779 72 5F 00 24      [ 1] 1386 	clr flags 
      00877D 72 5F 00 21      [ 1] 1387 	clr loop_depth 
      008781 35 04 00 25      [ 1] 1388 	mov tab_width,#TAB_WIDTH 
      008785 35 0A 00 0B      [ 1] 1389 	mov base,#10 
      008789 AE 00 00         [ 2] 1390 	ldw x,#0 
      00878C CF 00 05         [ 2] 1391 	ldw basicptr,x 
      00878F CF 00 01         [ 2] 1392 	ldw in.w,x 
      008792 72 5F 00 04      [ 1] 1393 	clr count
      008796 81               [ 4] 1394 	ret 
                                   1395 
                                   1396 ;--------------------------
                                   1397 ; called by tb_error when
                                   1398 ; flag FAUTORUN is set.
                                   1399 ; There is a bug in autorun 
                                   1400 ; program so cancel it.
                                   1401 ;---------------------------
      008797                       1402 cancel_autorun:
      008797 AE 40 00         [ 2] 1403 	ldw x,#AUTORUN_NAME 
      00879A CF 00 18         [ 2] 1404 	ldw farptr+1,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      00879D 4F               [ 1] 1405 	clr a
      00879E 5F               [ 1] 1406 	clrw x  
      00879F C7 00 17         [ 1] 1407 	ld farptr,a 
      0087A2 CD 82 74         [ 4] 1408 	call write_byte 
      0087A5 81               [ 4] 1409 	ret 
                                   1410 
                                   1411 
                                   1412 ;--------------------------
                                   1413 ; if autorun file defined 
                                   1414 ; in eeprom address AUTORUN_NAME 
                                   1415 ; load and run it.
                                   1416 ;-------------------------
      0087A6                       1417 load_autorun:
      0087A6 90 AE 40 00      [ 2] 1418 	ldw y,#AUTORUN_NAME
      0087AA 90 F6            [ 1] 1419 	ld a,(y)
      0087AC 27 20            [ 1] 1420 	jreq 9$
      0087AE CD 9B 98         [ 4] 1421 	call search_file
      0087B1 25 05            [ 1] 1422 	jrc 2$ 
                                   1423 ; if file doesn't exit
      0087B3 CD 87 97         [ 4] 1424 	call cancel_autorun
      0087B6 20 16            [ 2] 1425 	jra 9$ 
      0087B8 CD 9C B1         [ 4] 1426 2$:	call load_file
      0087BB AE 40 00         [ 2] 1427 	ldw x,#AUTORUN_NAME 
      0087BE CD AA C0         [ 4] 1428 	call puts
      0087C1 AE 87 CF         [ 2] 1429 	ldw x,#autorun_msg 
      0087C4 CD AA C0         [ 4] 1430 	call puts 
      0087C7 72 1C 00 24      [ 1] 1431 	bset flags,#FAUTORUN 
      0087CB CC 99 52         [ 2] 1432 	jp run_it    
      0087CE 81               [ 4] 1433 9$: ret 	
                                   1434 
      0087CF 20 6C 6F 61 64 65 64  1435 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1436 ;---------------------------
                                   1437 ; reset BASIC text variables 
                                   1438 ; and clear variables 
                                   1439 ;---------------------------
      0087E4                       1440 clear_basic:
      0087E4 72 5F 00 04      [ 1] 1441 	clr count
      0087E8 72 5F 00 02      [ 1] 1442 	clr in  
      0087EC AE 00 65         [ 2] 1443 	ldw x,#free_ram 
      0087EF CF 00 1D         [ 2] 1444 	ldw txtbgn,x 
      0087F2 CF 00 1F         [ 2] 1445 	ldw txtend,x 
      0087F5 CD 86 57         [ 4] 1446 	call clear_vars 
      0087F8 81               [ 4] 1447 	ret 
                                   1448 
                                   1449 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1450 ;;   Tiny BASIC error messages     ;;
                                   1451 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0087F9                       1452 err_msg:
      0087F9 00 00 88 19 88 26 88  1453 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             34 88 4D 88 5C
      008805 88 72 88 88 88 A2 88  1454 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             B3 88 C4
      00880F 88 D0 89 03 89 13 89  1455 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal  27-Bits]



             A7 08 BA
                                   1456 
      008817 89 3A 4D 65 6D 6F 72  1457 err_mem_full: .asciz "Memory full\n" 
             79 20 66 75 6C 6C
      008824 0A 00 73 79 6E 74 61  1458 err_syntax: .asciz "syntax error\n" 
             78 20 65 72 72 6F 72
      008832 0A 00 6D 61 74 68 20  1459 err_math_ovf: .asciz "math operation overflow\n"
             6F 70 65 72 61 74 69
             6F 6E 20 6F 76 65 72
             66 6C 6F 77
      00884B 0A 00 64 69 76 69 73  1460 err_div0: .asciz "division by 0\n" 
             69 6F 6E 20 62 79 20
             30
      00885A 0A 00 69 6E 76 61 6C  1461 err_no_line: .asciz "invalid line number.\n"
             69 64 20 6C 69 6E 65
             20 6E 75 6D 62 65 72
             2E
      008870 0A 00 72 75 6E 20 74  1462 err_run_only: .asciz "run time only usage.\n" 
             69 6D 65 20 6F 6E 6C
             79 20 75 73 61 67 65
             2E
      008886 0A 00 63 6F 6D 6D 61  1463 err_cmd_only: .asciz "command line only usage.\n"
             6E 64 20 6C 69 6E 65
             20 6F 6E 6C 79 20 75
             73 61 67 65 2E
      0088A0 0A 00 64 75 70 6C 69  1464 err_duplicate: .asciz "duplicate name.\n"
             63 61 74 65 20 6E 61
             6D 65 2E
      0088B1 0A 00 46 69 6C 65 20  1465 err_not_file: .asciz "File not found.\n"
             6E 6F 74 20 66 6F 75
             6E 64 2E
      0088C2 0A 00 62 61 64 20 76  1466 err_bad_value: .asciz "bad value.\n"
             61 6C 75 65 2E
      0088CE 0A 00 46 69 6C 65 20  1467 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             69 6E 20 65 78 74 65
             6E 64 65 64 20 6D 65
             6D 6F 72 79 2C 20 63
             61 6E 27 74 20 62 65
             20 72 75 6E 20 66 72
             6F 6D 20 74 68 65 72
             65 2E
      008901 0A 00 4E 6F 20 64 61  1468 err_no_data: .asciz "No data found.\n"
             74 61 20 66 6F 75 6E
             64 2E
      008911 0A 00 4E 6F 20 70 72  1469 err_no_prog: .asciz "No program in RAM!\n"
             6F 67 72 61 6D 20 69
             6E 20 52 41 4D 21
      008925 0A 00 46 69 6C 65 20  1470 err_no_fspace: .asciz "File system full.\n" 
             73 79 73 74 65 6D 20
             66 75 6C 6C 2E
      008938 0A 00 42 75 66 66 65  1471 err_buf_full: .asciz "Buffer full\n"
             72 20 66 75 6C 6C
                                   1472 
      008945 0A 00 0A 72 75 6E 20  1473 rt_msg: .asciz "\nrun time error, "
             74 69 6D 65 20 65 72
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal  72-Bits]



             72 2C 20 00
      008954 6F 72 2C 20 00 0A 63  1474 comp_msg: .asciz "\ncompile error, "
             6F 6D 70 69 6C 65 20
             65 72 72
      008965 6F 72 2C 20 00 6C 61  1475 tk_id: .asciz "last token id: "
             73 74 20 74 6F 6B 65
             6E 20
                                   1476 
      0008FA                       1477 syntax_error:
      008975 69 64            [ 1] 1478 	ld a,#ERR_SYNTAX 
                                   1479 
      0008FC                       1480 tb_error:
      008977 3A 20 00 23 47   [ 2] 1481 	btjt flags,#FCOMP,1$
      00897A 88               [ 1] 1482 	push a 
      00897A A6 02 C7         [ 2] 1483 	ldw x, #rt_msg 
      00897C CD 00 00         [ 4] 1484 	call puts 
      00897C 72               [ 1] 1485 	pop a 
      00897D 0A 00 24         [ 2] 1486 	ldw x, #err_msg 
      008980 47 88 AE 89      [ 1] 1487 	clr acc16 
      008984 47               [ 1] 1488 	sll a
      008985 CD AA C0 84      [ 1] 1489 	rlc acc16  
      008989 AE 87 F9         [ 1] 1490 	ld acc8, a 
      00898C 72 5F 00 0D      [ 2] 1491 	addw x,acc16 
      008990 48               [ 2] 1492 	ldw x,(x)
      008991 72 59 00         [ 4] 1493 	call puts
      008994 0D C7 00         [ 2] 1494 	ldw x,basicptr
      008997 0E 72 BB         [ 1] 1495 	ld a,in 
      00899A 00 0D FE         [ 4] 1496 	call prt_basic_line
      00899D CD AA C0         [ 2] 1497 	ldw x,#tk_id 
      0089A0 CE 00 05         [ 4] 1498 	call puts 
      0089A3 C6 00 02         [ 1] 1499 	ld a,in.saved 
      0089A6 CD               [ 1] 1500 	clrw x 
      0089A7 96               [ 1] 1501 	ld xl,a 
      0089A8 1E AE 89 6A      [ 2] 1502 	addw x,basicptr 
      0089AC CD               [ 1] 1503 	ld a,(x)
      0089AD AA               [ 1] 1504 	clrw x 
      0089AE C0               [ 1] 1505 	ld xl,a 
      0089AF C6 00 03         [ 4] 1506 	call print_int
      0089B2 5F 97 72 BB 00   [ 2] 1507 	btjf flags,#FAUTORUN ,6$
      0089B7 05 F6 5F         [ 4] 1508 	call cancel_autorun  
      0089BA 97 CD            [ 2] 1509 	jra 6$
      000948                       1510 1$:	
      0089BC 8A               [ 1] 1511 	push a 
      0089BD CD 72 0D         [ 2] 1512 	ldw x,#comp_msg
      0089C0 00 24 3A         [ 4] 1513 	call puts 
      0089C3 CD               [ 1] 1514 	pop a 
      0089C4 87 97 20         [ 2] 1515 	ldw x, #err_msg 
      0089C7 35 5F 00 0C      [ 1] 1516 	clr acc16 
      0089C8 48               [ 1] 1517 	sll a
      0089C8 88 AE 89 59      [ 1] 1518 	rlc acc16  
      0089CC CD AA C0         [ 1] 1519 	ld acc8, a 
      0089CF 84 AE 87 F9      [ 2] 1520 	addw x,acc16 
      0089D3 72               [ 2] 1521 	ldw x,(x)
      0089D4 5F 00 0D         [ 4] 1522 	call puts
      0089D7 48 72 59         [ 2] 1523 	ldw x,#tib
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0089DA 00 0D C7         [ 4] 1524 	call puts 
      0089DD 00 0E            [ 1] 1525 	ld a,#CR 
      0089DF 72 BB 00         [ 4] 1526 	call putc
      0089E2 0D FE CD         [ 2] 1527 	ldw x,in.w
      0089E5 AA C0 AE         [ 4] 1528 	call spaces
      0089E8 16 90            [ 1] 1529 	ld a,#'^
      0089EA CD AA C0         [ 4] 1530 	call putc 
      0089ED A6 0D CD         [ 2] 1531 6$: ldw x,#STACK_EMPTY 
      0089F0 83               [ 1] 1532     ldw sp,x
      000981                       1533 warm_start:
      0089F1 8A CE 00         [ 4] 1534 	call warm_init
                                   1535 ;----------------------------
                                   1536 ;   BASIC interpreter
                                   1537 ;----------------------------
      000984                       1538 cmd_line: ; user interface 
      0089F4 01 CD            [ 1] 1539 	ld a,#CR 
      0089F6 AB 2D A6         [ 4] 1540 	call putc 
      0089F9 5E CD            [ 1] 1541 	ld a,#'> 
      0089FB 83 8A AE         [ 4] 1542 	call putc
      0089FE 17 FF 94         [ 4] 1543 	call readln
      008A01 72 5D 00 03      [ 1] 1544 	tnz count 
      008A01 CD 87            [ 1] 1545 	jreq cmd_line
      008A03 79 05 64         [ 4] 1546 	call compile
                                   1547 ; if text begin with a line number
                                   1548 ; the compiler set count to zero    
                                   1549 ; so code is not interpreted
      008A04 72 5D 00 03      [ 1] 1550 	tnz count 
      008A04 A6 0D            [ 1] 1551 	jreq cmd_line
                                   1552 
                                   1553 ; if direct command 
                                   1554 ; it's ready to interpret 
                                   1555 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1556 ;; This is the interpreter loop
                                   1557 ;; for each BASIC code line. 
                                   1558 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0009A0                       1559 interpreter: 
      008A06 CD 83 8A         [ 1] 1560 	ld a,in 
      008A09 A6 3E CD         [ 1] 1561 	cp a,count 
      008A0C 83 8A            [ 1] 1562 	jrmi interp_loop
      0009A8                       1563 next_line:
      008A0E CD AB C5 72 5D   [ 2] 1564 	btjf flags, #FRUN, cmd_line
      008A13 00 04 27         [ 2] 1565 	ldw x,basicptr
      008A16 ED CD 85 E4      [ 2] 1566 	addw x,in.w 
      008A1A 72 5D 00         [ 2] 1567 	cpw x,txtend 
      008A1D 04 27            [ 1] 1568 	jrpl warm_start
      008A1F E4 00 04         [ 2] 1569 	ldw basicptr,x ; start of next line  
      008A20 E6 02            [ 1] 1570 	ld a,(2,x)
      008A20 C6 00 02         [ 1] 1571 	ld count,a 
      008A23 C1 00 04 2B      [ 1] 1572 	mov in,#3 ; skip first 3 bytes of line 
      0009C5                       1573 interp_loop: 
      008A27 1D 09 EC         [ 4] 1574 	call next_token
      008A28 A1 00            [ 1] 1575 	cp a,#TK_NONE 
      008A28 72 01            [ 1] 1576 	jreq next_line 
      008A2A 00 24            [ 1] 1577 	cp a,#TK_CMD
      008A2C D7 CE            [ 1] 1578 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008A2E 00               [ 4] 1579 	call (x) 
      008A2F 05 72            [ 2] 1580 	jra interp_loop 
      0009D3                       1581 1$:	 
      008A31 BB 00            [ 1] 1582 	cp a,#TK_VAR
      008A33 01 C3            [ 1] 1583 	jrne 2$
      008A35 00 1F 2A         [ 4] 1584 	call let_var  
      008A38 C8 CF            [ 2] 1585 	jra interp_loop 
      0009DC                       1586 2$:	
      008A3A 00 05            [ 1] 1587 	cp a,#TK_ARRAY 
      008A3C E6 02            [ 1] 1588 	jrne 3$
      008A3E C7 00 04         [ 4] 1589 	call let_array 
      008A41 35 03            [ 2] 1590 	jra interp_loop
      0009E5                       1591 3$:	
      008A43 00 02            [ 1] 1592 	cp a,#TK_COLON 
      008A45 27 DC            [ 1] 1593 	jreq interp_loop 
      008A45 CD 8A 6C         [ 2] 1594 	jp syntax_error 
                                   1595 
                                   1596 		
                                   1597 ;--------------------------
                                   1598 ; extract next token from
                                   1599 ; token list 
                                   1600 ; basicptr -> base address 
                                   1601 ; in  -> offset in list array 
                                   1602 ; output:
                                   1603 ;   A 		token attribute
                                   1604 ;   X 		token value if there is one
                                   1605 ;----------------------------------------
      0009EC                       1606 next_token:
      008A48 A1               [ 1] 1607 	clrw x 
      008A49 00 27 DC         [ 1] 1608 	ld a,in 
      008A4C A1 80 26         [ 1] 1609 	sub a,count ; don't replace sub by cp!  
      008A4F 03 FD            [ 1] 1610 	jrmi 0$
      008A51 20               [ 4] 1611 	ret  ; end of BASIC line 
      0009F6                       1612 0$: 
      008A52 F2 00 01 00 02   [ 1] 1613 	mov in.saved,in 
      008A53 90 CE 00 04      [ 2] 1614 	ldw y,basicptr 
      008A53 A1 85 26         [ 4] 1615 	ld a,([in.w],y)
      008A56 05 CD 93 7D      [ 1] 1616 	inc in  
      008A5A 20               [ 1] 1617 	tnz a 
      008A5B E9 2A            [ 1] 1618 	jrmi 6$
      008A5C A1 06            [ 1] 1619 	cp a,#TK_ARRAY
      008A5C A1 06            [ 1] 1620 	jrpl 9$  ; no attribute for these
      008A5E 26 05            [ 1] 1621 	cp a,#TK_COLON
      008A60 CD 93            [ 1] 1622 	jreq 9$  
      000A11                       1623 1$: ; 
      008A62 7A 20            [ 1] 1624 	cp a,#TK_CHAR
      008A64 E0 0A            [ 1] 1625 	jrne 2$
      008A65 41               [ 1] 1626 	exg a,xl
      008A65 A1 01 27         [ 4] 1627 	ld a,([in.w],y)
      008A68 DC CC 89 7A      [ 1] 1628 	inc in 
      008A6C 41               [ 1] 1629 	exg a,xl  
      008A6C 5F               [ 4] 1630 	ret
      008A6D C6 00            [ 1] 1631 2$:	cp a,#TK_QSTR 
      008A6F 02 C0            [ 1] 1632 	jrne 9$
      008A71 00               [ 1] 1633 	ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A72 04 2B 01 81      [ 2] 1634 	addw x,in.w ; pointer to string 
                                   1635 ; move pointer after string 
      008A76 91 6D 00         [ 4] 1636 3$:	tnz ([in.w],y)
      008A76 55 00            [ 1] 1637 	jreq 8$
      008A78 02 00 03 90      [ 1] 1638 	inc in 
      008A7C CE 00            [ 2] 1639 	jra 3$
      000A33                       1640 6$: 
      008A7E 05 91 D6 01      [ 2] 1641 	addw y,in.w 
      008A82 72 5C            [ 2] 1642 	ldw y,(y)
      008A84 00 02            [ 1] 1643 	cp a,#TK_INTGR
      008A86 4D 2B            [ 1] 1644 	jrpl 7$
      008A88 2A A1 06 2A      [ 2] 1645 	addw y,#code_addr
      008A8C 3F A1            [ 2] 1646 	ldw y,(y) 
      008A8E 01               [ 1] 1647 7$:	exgw x,y 
      008A8F 27 3B 00 01      [ 1] 1648 	inc in
      008A91 72 5C 00 01      [ 1] 1649 8$:	inc in 
      000A4C                       1650 9$: 
      008A91 A1               [ 4] 1651 	ret	
                                   1652 
                                   1653 ;-----------------------------------
                                   1654 ; print a 16 bit integer 
                                   1655 ; using variable 'base' as conversion
                                   1656 ; format.
                                   1657 ; input:
                                   1658 ;   X       integer to print 
                                   1659 ;   'base'    conversion base 
                                   1660 ; output:
                                   1661 ;   none 
                                   1662 ;-----------------------------------
      000A4D                       1663 print_int:
      008A92 03 26 0A 41      [ 1] 1664 	clr acc24 
      008A96 91 D6 01         [ 2] 1665 	ldw acc16,x 
      008A99 72 5C 00 02 41   [ 2] 1666 	btjf acc16,#7,prti24
      008A9E 81 A1 02 26      [ 1] 1667 	cpl acc24 
                                   1668 
                                   1669 ;------------------------------------
                                   1670 ; print integer in acc24 
                                   1671 ; input:
                                   1672 ;	acc24 		integer to print 
                                   1673 ;	'base' 		numerical base for conversion 
                                   1674 ;   'tab_width' field width 
                                   1675 ;  output:
                                   1676 ;    A          string length
                                   1677 ;------------------------------------
      000A5D                       1678 prti24:
      008AA2 29 93 72         [ 4] 1679     call itoa  ; conversion entier en  .asciz
      008AA5 BB 00 01         [ 4] 1680 	call right_align  
      008AA8 91               [ 1] 1681 	push a 
      008AA9 6D 01 27         [ 4] 1682 	call puts
      008AAC 1B               [ 1] 1683 	pop a 
      008AAD 72               [ 4] 1684     ret	
                                   1685 
                                   1686 ;------------------------------------
                                   1687 ; convert integer in acc24 to string
                                   1688 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1689 ;   'base'	conversion base 
                                   1690 ;	acc24	integer to convert
                                   1691 ; output:
                                   1692 ;   X  		pointer to first char of string
                                   1693 ;   A       string length
                                   1694 ;------------------------------------
                           000001  1695 	SIGN=1  ; integer sign 
                           000002  1696 	LEN=2 
                           000003  1697 	PSTR=3
                           000004  1698 	VSIZE=4 ;locals size
      000A69                       1699 itoa:
      000A69                       1700 	_vars VSIZE
      008AAE 5C 00            [ 2]    1     sub sp,#VSIZE 
      008AB0 02 20            [ 1] 1701 	clr (LEN,sp) ; string length  
      008AB2 F5 01            [ 1] 1702 	clr (SIGN,sp)    ; sign
      008AB3 C6 00 0A         [ 1] 1703 	ld a,base 
      008AB3 72 B9            [ 1] 1704 	cp a,#10
      008AB5 00 01            [ 1] 1705 	jrne 1$
                                   1706 	; base 10 string display with negative sign if bit 23==1
      008AB7 90 FE A1 84 2A   [ 2] 1707 	btjf acc24,#7,1$
      008ABC 06 72            [ 1] 1708 	cpl (SIGN,sp)
      008ABE A9 A9 93         [ 4] 1709 	call neg_acc24
      000A80                       1710 1$:
                                   1711 ; initialize string pointer 
      008AC1 90 FE 51         [ 2] 1712 	ldw x,#tib 
      008AC4 72 5C 00         [ 2] 1713 	addw x,#TIB_SIZE
      008AC7 02               [ 2] 1714 	decw x 
      008AC8 72               [ 1] 1715 	clr (x)
      000A88                       1716 itoa_loop:
      008AC9 5C 00 02         [ 1] 1717     ld a,base
      008ACC 1F 03            [ 2] 1718 	ldw (PSTR,sp),x 
      008ACC 81 0A CE         [ 4] 1719     call divu24_8 ; acc24/A 
      008ACD 1E 03            [ 2] 1720 	ldw x,(PSTR,sp)
      008ACD 72 5F            [ 1] 1721     add a,#'0  ; remainder of division
      008ACF 00 0C            [ 1] 1722     cp a,#'9+1
      008AD1 CF 00            [ 1] 1723     jrmi 2$
      008AD3 0D 72            [ 1] 1724     add a,#7 
      000A9A                       1725 2$:	
      008AD5 0F               [ 2] 1726 	decw x
      008AD6 00               [ 1] 1727     ld (x),a
      008AD7 0D 04            [ 1] 1728 	inc (LEN,sp)
                                   1729 	; if acc24==0 conversion done
      008AD9 72 53 00         [ 1] 1730 	ld a,acc24
      008ADC 0C 00 0C         [ 1] 1731 	or a,acc16
      008ADD CA 00 0D         [ 1] 1732 	or a,acc8
      008ADD CD 8A            [ 1] 1733     jrne itoa_loop
                                   1734 	;conversion done, next add '$' or '-' as required
      008ADF E9 CD 94         [ 1] 1735 	ld a,base 
      008AE2 3A 88            [ 1] 1736 	cp a,#16
      008AE4 CD AA            [ 1] 1737 	jreq 8$
      008AE6 C0 84            [ 1] 1738 	ld a,(SIGN,sp)
      008AE8 81 15            [ 1] 1739     jreq 10$
      008AE9 A6 2D            [ 1] 1740     ld a,#'-
      008AE9 52 04            [ 2] 1741 	jra 9$ 
                                   1742 ; don't print more than 4 digits
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1743 ; in hexadecimal to avoid '-' sign 
                                   1744 ; extend display 	
      008AEB 0F 02            [ 1] 1745 8$: ld a,(LEN,sp) 
      008AED 0F 01            [ 1] 1746 	cp a,#5 
      008AEF C6 00            [ 1] 1747 	jrmi 81$
      008AF1 0B               [ 1] 1748 	incw x
      008AF2 A1 0A            [ 1] 1749 	dec (LEN,sp)
      008AF4 26 0A            [ 2] 1750 	jra 8$
      000AC3                       1751 81$:	
      008AF6 72 0F            [ 1] 1752 	ld a,#'$ 
      008AF8 00               [ 2] 1753 9$: decw x
      008AF9 0C               [ 1] 1754     ld (x),a
      008AFA 05 03            [ 1] 1755 	inc (LEN,sp)
      000AC9                       1756 10$:
      008AFC 01 CD            [ 1] 1757 	ld a,(LEN,sp)
      000ACB                       1758 	_drop VSIZE
      008AFE 8B B0            [ 2]    1     addw sp,#VSIZE 
      008B00 81               [ 4] 1759 	ret
                                   1760 
                                   1761 ;-------------------------------------
                                   1762 ; divide uint24_t by uint8_t
                                   1763 ; used to convert uint24_t to string
                                   1764 ; input:
                                   1765 ;	acc24	dividend
                                   1766 ;   A 		divisor
                                   1767 ; output:
                                   1768 ;   acc24	quotient
                                   1769 ;   A		remainder
                                   1770 ;------------------------------------- 
                                   1771 ; offset  on sp of arguments and locals
                           000001  1772 	U8   = 1   ; divisor on stack
                           000001  1773 	VSIZE =1
      000ACE                       1774 divu24_8:
      008B00 AE               [ 2] 1775 	pushw x ; save x
      008B01 16               [ 1] 1776 	push a 
                                   1777 	; ld dividend UU:MM bytes in X
      008B02 90 1C 00         [ 1] 1778 	ld a, acc24
      008B05 50               [ 1] 1779 	ld xh,a
      008B06 5A 7F 0C         [ 1] 1780 	ld a,acc24+1
      008B08 97               [ 1] 1781 	ld xl,a
      008B08 C6 00            [ 1] 1782 	ld a,(U8,SP) ; divisor
      008B0A 0B               [ 2] 1783 	div x,a ; UU:MM/U8
      008B0B 1F               [ 1] 1784 	push a  ;save remainder
      008B0C 03               [ 1] 1785 	ld a,xh
      008B0D CD 8B 4E         [ 1] 1786 	ld acc24,a
      008B10 1E               [ 1] 1787 	ld a,xl
      008B11 03 AB 30         [ 1] 1788 	ld acc24+1,a
      008B14 A1               [ 1] 1789 	pop a
      008B15 3A               [ 1] 1790 	ld xh,a
      008B16 2B 02 AB         [ 1] 1791 	ld a,acc24+2
      008B19 07               [ 1] 1792 	ld xl,a
      008B1A 7B 01            [ 1] 1793 	ld a,(U8,sp) ; divisor
      008B1A 5A               [ 2] 1794 	div x,a  ; R:LL/U8
      008B1B F7 0C            [ 1] 1795 	ld (U8,sp),a ; save remainder
      008B1D 02               [ 1] 1796 	ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008B1E C6 00 0C         [ 1] 1797 	ld acc24+2,a
      008B21 CA               [ 1] 1798 	pop a
      008B22 00               [ 2] 1799 	popw x
      008B23 0D               [ 4] 1800 	ret
                                   1801 
                                   1802 ;--------------------------------------
                                   1803 ; unsigned multiply uint24_t by uint8_t
                                   1804 ; use to convert numerical string to uint24_t
                                   1805 ; input:
                                   1806 ;	acc24	uint24_t 
                                   1807 ;   A		uint8_t
                                   1808 ; output:
                                   1809 ;   acc24   A*acc24
                                   1810 ;-------------------------------------
                                   1811 ; local variables offset  on sp
                           000003  1812 	U8   = 3   ; A pushed on stack
                           000002  1813 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1814 	OVFH = 1  ; multiplication overflow high byte
                           000003  1815 	VSIZE = 3
      000AF6                       1816 mulu24_8:
      008B24 CA               [ 2] 1817 	pushw x    ; save X
                                   1818 	; local variables
      008B25 00               [ 1] 1819 	push a     ; U8
      008B26 0E               [ 1] 1820 	clrw x     ; initialize overflow to 0
      008B27 26               [ 2] 1821 	pushw x    ; multiplication overflow
                                   1822 ; multiply low byte.
      008B28 DF C6 00         [ 1] 1823 	ld a,acc24+2
      008B2B 0B               [ 1] 1824 	ld xl,a
      008B2C A1 10            [ 1] 1825 	ld a,(U8,sp)
      008B2E 27               [ 4] 1826 	mul x,a
      008B2F 08               [ 1] 1827 	ld a,xl
      008B30 7B 01 27         [ 1] 1828 	ld acc24+2,a
      008B33 15               [ 1] 1829 	ld a, xh
      008B34 A6 2D            [ 1] 1830 	ld (OVFL,sp),a
                                   1831 ; multipy middle byte
      008B36 20 0D 7B         [ 1] 1832 	ld a,acc24+1
      008B39 02               [ 1] 1833 	ld xl,a
      008B3A A1 05            [ 1] 1834 	ld a, (U8,sp)
      008B3C 2B               [ 4] 1835 	mul x,a
                                   1836 ; add overflow to this partial product
      008B3D 05 5C 0A         [ 2] 1837 	addw x,(OVFH,sp)
      008B40 02               [ 1] 1838 	ld a,xl
      008B41 20 F5 0C         [ 1] 1839 	ld acc24+1,a
      008B43 4F               [ 1] 1840 	clr a
      008B43 A6 24            [ 1] 1841 	adc a,#0
      008B45 5A F7            [ 1] 1842 	ld (OVFH,sp),a
      008B47 0C               [ 1] 1843 	ld a,xh
      008B48 02 02            [ 1] 1844 	ld (OVFL,sp),a
                                   1845 ; multiply most signficant byte	
      008B49 C6 00 0B         [ 1] 1846 	ld a, acc24
      008B49 7B               [ 1] 1847 	ld xl, a
      008B4A 02 5B            [ 1] 1848 	ld a, (U8,sp)
      008B4C 04               [ 4] 1849 	mul x,a
      008B4D 81 FB 01         [ 2] 1850 	addw x, (OVFH,sp)
      008B4E 9F               [ 1] 1851 	ld a, xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B4E 89 88 C6         [ 1] 1852 	ld acc24,a
      008B51 00 0C            [ 2] 1853     addw sp,#VSIZE
      008B53 95               [ 2] 1854 	popw x
      008B54 C6               [ 4] 1855 	ret
                                   1856 
                                   1857 ;------------------------------------
                                   1858 ;  two's complement acc24
                                   1859 ;  input:
                                   1860 ;		acc24 variable
                                   1861 ;  output:
                                   1862 ;		acc24 variable
                                   1863 ;-------------------------------------
      000B30                       1864 neg_acc24:
      008B55 00 0D 97 7B      [ 1] 1865 	cpl acc24+2
      008B59 01 62 88 9E      [ 1] 1866 	cpl acc24+1
      008B5D C7 00 0C 9F      [ 1] 1867 	cpl acc24
      008B61 C7 00            [ 1] 1868 	ld a,#1
      008B63 0D 84 95         [ 1] 1869 	add a,acc24+2
      008B66 C6 00 0E         [ 1] 1870 	ld acc24+2,a
      008B69 97               [ 1] 1871 	clr a
      008B6A 7B 01 62         [ 1] 1872 	adc a,acc24+1
      008B6D 6B 01 9F         [ 1] 1873 	ld acc24+1,a 
      008B70 C7               [ 1] 1874 	clr a 
      008B71 00 0E 84         [ 1] 1875 	adc a,acc24 
      008B74 85 81 0B         [ 1] 1876 	ld acc24,a 
      008B76 81               [ 4] 1877 	ret
                                   1878 
                                   1879 
                                   1880 
                                   1881 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1882 ;; compiler routines        ;;
                                   1883 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1884 ;------------------------------------
                                   1885 ; parse quoted string 
                                   1886 ; input:
                                   1887 ;   Y 	pointer to tib 
                                   1888 ;   X   pointer to output buffer 
                                   1889 ; output:
                                   1890 ;	buffer   parsed string
                                   1891 ;------------------------------------
                           000001  1892 	PREV = 1
                           000002  1893 	CURR =2
                           000002  1894 	VSIZE=2
      000B53                       1895 parse_quote: 
      000B53                       1896 	_vars VSIZE 
      008B76 89 88            [ 2]    1     sub sp,#VSIZE 
      008B78 5F               [ 1] 1897 	clr a
      008B79 89 C6            [ 1] 1898 1$:	ld (PREV,sp),a 
      000B58                       1899 2$:	
      008B7B 00 0E 97         [ 4] 1900 	ld a,([in.w],y)
      008B7E 7B 03            [ 1] 1901 	jreq 6$
      008B80 42 9F C7 00      [ 1] 1902 	inc in 
      008B84 0E 9E            [ 1] 1903 	ld (CURR,sp),a 
      008B86 6B 02            [ 1] 1904 	ld a,#'\
      008B88 C6 00            [ 1] 1905 	cp a, (PREV,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B8A 0D 97            [ 1] 1906 	jrne 3$
      008B8C 7B 03            [ 1] 1907 	clr (PREV,sp)
      008B8E 42 72            [ 1] 1908 	ld a,(CURR,sp)
      008B90 FB 01            [ 4] 1909 	callr convert_escape
      008B92 9F               [ 1] 1910 	ld (x),a 
      008B93 C7               [ 1] 1911 	incw x 
      008B94 00 0D            [ 2] 1912 	jra 2$
      000B73                       1913 3$:
      008B96 4F A9            [ 1] 1914 	ld a,(CURR,sp)
      008B98 00 6B            [ 1] 1915 	cp a,#'\'
      008B9A 01 9E            [ 1] 1916 	jreq 1$
      008B9C 6B 02            [ 1] 1917 	cp a,#'"
      008B9E C6 00            [ 1] 1918 	jreq 6$ 
      008BA0 0C               [ 1] 1919 	ld (x),a 
      008BA1 97               [ 1] 1920 	incw x 
      008BA2 7B 03            [ 2] 1921 	jra 2$
      000B81                       1922 6$:
      008BA4 42               [ 1] 1923 	clr (x)
      008BA5 72               [ 1] 1924 	incw x 
      008BA6 FB 01            [ 1] 1925 	ldw y,x 
      008BA8 9F               [ 1] 1926 	clrw x 
      008BA9 C7 00            [ 1] 1927 	ld a,#TK_QSTR  
      000B88                       1928 	_drop VSIZE
      008BAB 0C 5B            [ 2]    1     addw sp,#VSIZE 
      008BAD 03               [ 4] 1929 	ret 
                                   1930 
                                   1931 ;---------------------------------------
                                   1932 ; called by parse_quote
                                   1933 ; subtitute escaped character 
                                   1934 ; by their ASCII value .
                                   1935 ; input:
                                   1936 ;   A  character following '\'
                                   1937 ; output:
                                   1938 ;   A  substitued char or same if not valid.
                                   1939 ;---------------------------------------
      000B8B                       1940 convert_escape:
      008BAE 85               [ 2] 1941 	pushw x 
      008BAF 81 0B A0         [ 2] 1942 	ldw x,#escaped 
      008BB0 F1               [ 1] 1943 1$:	cp a,(x)
      008BB0 72 53            [ 1] 1944 	jreq 2$
      008BB2 00               [ 1] 1945 	tnz (x)
      008BB3 0E 72            [ 1] 1946 	jreq 3$
      008BB5 53               [ 1] 1947 	incw x 
      008BB6 00 0D            [ 2] 1948 	jra 1$
      008BB8 72 53 00         [ 2] 1949 2$: subw x,#escaped 
      008BBB 0C               [ 1] 1950 	ld a,xl 
      008BBC A6 01            [ 1] 1951 	add a,#7
      008BBE CB               [ 2] 1952 3$:	popw x 
      008BBF 00               [ 4] 1953 	ret 
                                   1954 
      008BC0 0E C7 00 0E 4F C9 00  1955 escaped: .asciz "abtnvfr"
             0D
                                   1956 
                                   1957 ;-------------------------
                                   1958 ; integer parser 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1959 ; input:
                                   1960 ;   X 		point to output buffer  
                                   1961 ;   Y 		point to tib 
                                   1962 ;   A 	    first digit|'$' 
                                   1963 ; output:  
                                   1964 ;   X 		integer 
                                   1965 ;   A 		TK_INTGR
                                   1966 ;   acc24   24 bits integer 
                                   1967 ;-------------------------
                           000001  1968 	BASE=1
                           000002  1969 	TCHAR=2 
                           000003  1970 	XSAVE=3
                           000004  1971 	VSIZE=4 
      000BA8                       1972 parse_integer: ; { -- n }
      008BC8 C7               [ 2] 1973 	pushw x 	
      008BC9 00 0D            [ 1] 1974 	push #0 ; TCHAR
      008BCB 4F C9            [ 1] 1975 	push #10 ; BASE=10
      008BCD 00 0C            [ 1] 1976 	cp a,#'$
      008BCF C7 00            [ 1] 1977 	jrne 2$ 
      000BB1                       1978     _drop #1
      008BD1 0C 81            [ 2]    1     addw sp,##1 
      008BD3 4B 10            [ 1] 1979 	push #16  ; BASE=16
      008BD3 52               [ 1] 1980 2$:	ld (x),a 
      008BD4 02               [ 1] 1981 	incw x 
      008BD5 4F 6B 01         [ 4] 1982 	ld a,([in.w],y)
      008BD8 72 5C 00 01      [ 1] 1983 	inc in 
      008BD8 91 D6 01         [ 4] 1984 	call to_upper 
      008BDB 27 24            [ 1] 1985 	ld (TCHAR,sp),a 
      008BDD 72 5C 00         [ 4] 1986 	call is_digit 
      008BE0 02 6B            [ 1] 1987 	jrc 2$
      008BE2 02 A6            [ 1] 1988 	ld a,#16 
      008BE4 5C 11            [ 1] 1989 	cp a,(BASE,sp)
      008BE6 01 26            [ 1] 1990 	jrne 3$ 
      008BE8 0A 0F            [ 1] 1991 	ld a,(TCHAR,sp)
      008BEA 01 7B            [ 1] 1992 	cp a,#'A 
      008BEC 02 AD            [ 1] 1993 	jrmi 3$ 
      008BEE 1C F7            [ 1] 1994 	cp a,#'G 
      008BF0 5C 20            [ 1] 1995 	jrmi 2$ 
      008BF2 E5 5A 00 01      [ 1] 1996 3$: dec in 	
      008BF3 7F               [ 1] 1997     clr (x)
      008BF3 7B 02            [ 2] 1998 	ldw x,(XSAVE,sp)
      008BF5 A1 5C 27         [ 4] 1999 	call atoi24
      008BF8 DD A1            [ 1] 2000 	ldw y,x 
      008BFA 22 27 04         [ 2] 2001 	ldw x,acc16 
      008BFD F7 5C            [ 1] 2002 	ld a,#TK_INTGR
      008BFF 20 D7            [ 2] 2003 	ldw (y),x 
      008C01 72 A9 00 02      [ 2] 2004 	addw y,#2
      000BEF                       2005 	_drop VSIZE  
      008C01 7F 5C            [ 2]    1     addw sp,#VSIZE 
      008C03 90               [ 4] 2006 	ret 	
                                   2007 
                                   2008 ;-------------------------
                                   2009 ; binary integer parser
                                   2010 ; build integer in acc24  
                                   2011 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2012 ;   X 		point to output buffer  
                                   2013 ;   Y 		point to tib 
                                   2014 ;   A 	    '&' 
                                   2015 ; output:  
                                   2016 ;   buffer  TK_INTGR integer  
                                   2017 ;   X 		int16 
                                   2018 ;   A 		TK_INTGR
                                   2019 ;   acc24    int24 
                                   2020 ;-------------------------
                           000001  2021 	BINARY=1 ; 24 bits integer 
                           000003  2022 	VSIZE=3
      000BF2                       2023 parse_binary: ; { -- n }
      008C04 93 5F            [ 1] 2024 	push #0
      008C06 A6 02            [ 1] 2025 	push #0
      008C08 5B 02            [ 1] 2026 	push #0
      000BF8                       2027 2$:	
      008C0A 81 D6 00         [ 4] 2028 	ld a,([in.w],y)
      008C0B 72 5C 00 01      [ 1] 2029 	inc in 
      008C0B 89 AE            [ 1] 2030 	cp a,#'0 
      008C0D 8C 20            [ 1] 2031 	jreq 3$
      008C0F F1 27            [ 1] 2032 	cp a,#'1 
      008C11 06 7D            [ 1] 2033 	jreq 3$ 
      008C13 27 09            [ 2] 2034 	jra bin_exit 
      008C15 5C 20            [ 1] 2035 3$: sub a,#'0 
      008C17 F7               [ 1] 2036 	rrc a
      008C18 1D 8C            [ 1] 2037 	rlc (BINARY+2,sp) 
      008C1A 20 9F            [ 1] 2038 	rlc (BINARY+1,sp)
      008C1C AB 07            [ 1] 2039 	rlc (BINARY,sp) 
      008C1E 85 81            [ 2] 2040 	jra 2$  
      000C14                       2041 bin_exit:
      008C20 61 62 74 6E      [ 1] 2042 	dec in 
      008C24 76 66            [ 1] 2043 	ldw y,x
      008C26 72 00            [ 1] 2044 	ld a,(BINARY,sp)
      008C28 C7 00 0B         [ 1] 2045 	ld acc24,a 
      008C28 89 4B            [ 2] 2046 	ldw x,(BINARY+1,sp)
      008C2A 00 4B 0A         [ 2] 2047 	ldw acc16,x
      008C2D A1 24            [ 2] 2048 	ldw (y),x 
      008C2F 26 04 5B 01      [ 2] 2049 	addw y,#2  
      008C33 4B 10            [ 1] 2050 	ld a,#TK_INTGR 	
      000C2C                       2051 	_drop VSIZE 
      008C35 F7 5C            [ 2]    1     addw sp,#VSIZE 
      008C37 91               [ 4] 2052 	ret
                                   2053 
                                   2054 ;---------------------------
                                   2055 ;  token begin with a letter,
                                   2056 ;  is keyword or variable. 	
                                   2057 ; input:
                                   2058 ;   X 		point to pad 
                                   2059 ;   Y 		point to text
                                   2060 ;   A 	    first letter  
                                   2061 ; output:
                                   2062 ;   X		exec_addr|var_addr 
                                   2063 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   2064 ;   pad 	keyword|var_name  
                                   2065 ;--------------------------  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                           000001  2066 	XFIRST=1
                           000002  2067 	VSIZE=2
      000C2F                       2068 parse_keyword: 
      008C38 D6               [ 2] 2069 	pushw x 
      000C30                       2070 kw_loop:	
      008C39 01 72 5C         [ 4] 2071 	call to_upper 
      008C3C 00               [ 1] 2072 	ld (x),a 
      008C3D 02               [ 1] 2073 	incw x 
      008C3E CD 8E BB         [ 4] 2074 	ld a,([in.w],y)
      008C41 6B 02 CD 86      [ 1] 2075 	inc in 
      008C45 76 25 ED         [ 4] 2076 	call is_alpha 
      008C48 A6 10            [ 1] 2077 	jrc kw_loop
      008C4A 11 01 26 0A      [ 1] 2078 	dec in   
      008C4E 7B               [ 1] 2079 1$: clr (x)
      008C4F 02 A1            [ 2] 2080 	ldw x,(XFIRST,sp) 
      008C51 41 2B            [ 1] 2081 	ld a,(1,x)
      008C53 04 A1            [ 1] 2082 	jrne 2$
                                   2083 ; one letter variable name 
      008C55 47               [ 1] 2084 	ld a,(x) 
      008C56 2B DD            [ 1] 2085 	sub a,#'A 
      008C58 72               [ 1] 2086 	sll a 
      008C59 5A               [ 1] 2087 	push a 
      008C5A 00 02            [ 1] 2088 	push #0
      008C5C 7F 1E 03         [ 2] 2089 	ldw x,#vars 
      008C5F CD 8E C7         [ 2] 2090 	addw x,(1,sp) ; X=var address 
      000C59                       2091 	_drop 2 
      008C62 90 93            [ 2]    1     addw sp,#2 
      008C64 CE 00            [ 1] 2092 	ld a,#TK_VAR 
      008C66 0D A6            [ 2] 2093 	jra 4$ 
      000C5F                       2094 2$: ; check for keyword, otherwise syntax error.
      000C5F                       2095 	_ldx_dict kword_dict ; dictionary entry point
      008C68 84 90 FF         [ 2]    1     ldw x,#kword_dict+2
      008C6B 72 A9            [ 2] 2096 	ldw y,(XFIRST,sp) ; name to search for
      008C6D 00 02 5B         [ 4] 2097 	call search_dict
      008C70 04               [ 1] 2098 	tnz a
      008C71 81 03            [ 1] 2099 	jrne 4$ 
      008C72 CC 08 FA         [ 2] 2100 	jp syntax_error
      000C6D                       2101 4$:	
      008C72 4B 00            [ 2] 2102 	ldw y,(XFIRST,sp)
      008C74 4B 00            [ 1] 2103 	ld (y),a 
      008C76 4B 00            [ 1] 2104 	incw y 
      008C78 90 FF            [ 2] 2105 	ldw (y),x
      008C78 91 D6 01 72      [ 2] 2106 	addw y,#2  
      000C79                       2107 	_drop VSIZE 
      008C7C 5C 00            [ 2]    1     addw sp,#VSIZE 
      008C7E 02               [ 4] 2108 	ret  	
                                   2109 
                                   2110 
                                   2111 ;------------------------------------
                                   2112 ; scan text for next token
                                   2113 ; input: 
                                   2114 ;	X 		pointer to buffer where 
                                   2115 ;	        token id and value are copied 
                                   2116 ; use:
                                   2117 ;	Y   pointer to text in tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2118 ; output:
                                   2119 ;   A       token attribute 
                                   2120 ;   X 		token value
                                   2121 ;   Y       updated position in output buffer   
                                   2122 ;------------------------------------
                                   2123 	; use to check special character 
                                   2124 	.macro _case c t  
                                   2125 	ld a,#c 
                                   2126 	cp a,(TCHAR,sp) 
                                   2127 	jrne t
                                   2128 	.endm 
                                   2129 
                           000001  2130 	TCHAR=1
                           000002  2131 	ATTRIB=2
                           000002  2132 	VSIZE=2
      000C7C                       2133 get_token: 
      000C7C                       2134 	_vars VSIZE
      008C7F A1 30            [ 2]    1     sub sp,#VSIZE 
                                   2135 ;	ld a,in 
                                   2136 ;	sub a,count
                                   2137 ;   jrmi 0$
                                   2138 ;	clr a 
                                   2139 ;	ret 
      000C7E                       2140 0$: 
      008C81 27 06 A1 31      [ 2] 2141 	ldw y,#tib    	
      008C85 27 02            [ 1] 2142 	ld a,#SPACE
      008C87 20 0B A0         [ 4] 2143 	call skip
      008C8A 30 46 09 03 09   [ 1] 2144 	mov in.saved,in 
      008C8F 02 09 01         [ 4] 2145 	ld a,([in.w],y)
      008C92 20 E4            [ 1] 2146 	jrne 1$
      008C94 90 93            [ 1] 2147 	ldw y,x 
      008C94 72 5A 00         [ 2] 2148 	jp token_exit ; end of line 
      008C97 02 90 93 7B      [ 1] 2149 1$:	inc in 
      008C9B 01 C7 00         [ 4] 2150 	call to_upper 
      008C9E 0C 1E            [ 1] 2151 	ld (TCHAR,sp),a 
                                   2152 ; check for quoted string
      000C9F                       2153 str_tst:  	
      000C9F                       2154 	_case '"' nbr_tst
      008CA0 02 CF            [ 1]    1 	ld a,#'"' 
      008CA2 00 0D            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA4 90 FF            [ 1]    3 	jrne nbr_tst
      008CA6 72 A9            [ 1] 2155 	ld a,#TK_QSTR
      008CA8 00               [ 1] 2156 	ld (x),a 
      008CA9 02               [ 1] 2157 	incw x 
      008CAA A6 84 5B         [ 4] 2158 	call parse_quote
      008CAD 03 81 38         [ 2] 2159 	jp token_exit
      008CAF                       2160 nbr_tst:
                                   2161 ; check for hexadecimal number 
      008CAF 89 24            [ 1] 2162 	ld a,#'$'
      008CB0 11 01            [ 1] 2163 	cp a,(TCHAR,sp) 
      008CB0 CD 8E            [ 1] 2164 	jreq 1$
                                   2165 ;check for binary number 
      008CB2 BB F7            [ 1] 2166 	ld a,#'&
      008CB4 5C 91            [ 1] 2167 	cp a,(TCHAR,sp)
      008CB6 D6 01            [ 1] 2168 	jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CB8 72 5C            [ 1] 2169 	ld a,#TK_INTGR
      008CBA 00               [ 1] 2170 	ld (x),a 
      008CBB 02               [ 1] 2171 	incw x 
      008CBC CD 86 65         [ 4] 2172 	call parse_binary ; expect binary integer 
      008CBF 25 EF 72         [ 2] 2173 	jp token_exit 
                                   2174 ; check for decimal number 	
      008CC2 5A 00            [ 1] 2175 0$:	ld a,(TCHAR,sp)
      008CC4 02 7F 1E         [ 4] 2176 	call is_digit
      008CC7 01 E6            [ 1] 2177 	jrnc 3$
      008CC9 01 26            [ 1] 2178 1$:	ld a,#TK_INTGR 
      008CCB 13               [ 1] 2179 	ld (x),a 
      008CCC F6               [ 1] 2180 	incw x 
      008CCD A0 41            [ 1] 2181 	ld a,(TCHAR,sp)
      008CCF 48 88 4B         [ 4] 2182 	call parse_integer 
      008CD2 00 AE 00         [ 2] 2183 	jp token_exit 
      000CD8                       2184 3$: 
      000CD8                       2185 	_case '(' bkslsh_tst 
      008CD5 31 72            [ 1]    1 	ld a,#'(' 
      008CD7 FB 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CD9 5B 02            [ 1]    3 	jrne bkslsh_tst
      008CDB A6 85            [ 1] 2186 	ld a,#TK_LPAREN
      008CDD 20 0E 34         [ 2] 2187 	jp token_char   	
      008CDF                       2188 bkslsh_tst: ; character token 
      000CE3                       2189 	_case '\',rparnt_tst
      008CDF AE A9            [ 1]    1 	ld a,#'\' 
      008CE1 8D 16            [ 1]    2 	cp a,(TCHAR,sp) 
      008CE3 01 CD            [ 1]    3 	jrne rparnt_tst
      008CE5 90 F3            [ 1] 2190 	ld a,#TK_CHAR 
      008CE7 4D               [ 1] 2191 	ld (x),a 
      008CE8 26               [ 1] 2192 	incw x 
      008CE9 03 CC 89         [ 4] 2193 	ld a,([in.w],y)
      008CEC 7A               [ 1] 2194 	ld (x),a 
      008CED 5C               [ 1] 2195 	incw x
      008CED 16 01            [ 1] 2196 	ldw y,x 	 
      008CEF 90 F7 90 5C      [ 1] 2197 	inc in  
      008CF3 90               [ 1] 2198 	clrw x 
      008CF4 FF               [ 1] 2199 	ld xl,a 
      008CF5 72 A9            [ 1] 2200 	ld a,#TK_CHAR 
      008CF7 00 02 5B         [ 2] 2201 	jp token_exit 
      000CFF                       2202 rparnt_tst:		
      000CFF                       2203 	_case ')' colon_tst 
      008CFA 02 81            [ 1]    1 	ld a,#')' 
      008CFC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CFC 52 02            [ 1]    3 	jrne colon_tst
      008CFE A6 08            [ 1] 2204 	ld a,#TK_RPAREN 
      008CFE 90 AE 16         [ 2] 2205 	jp token_char
      000D0A                       2206 colon_tst:
      000D0A                       2207 	_case ':' comma_tst 
      008D01 90 A6            [ 1]    1 	ld a,#':' 
      008D03 20 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008D05 8F 31            [ 1]    3 	jrne comma_tst
      008D07 55 00            [ 1] 2208 	ld a,#TK_COLON 
      008D09 02 00 03         [ 2] 2209 	jp token_char  
      000D15                       2210 comma_tst:
      000D15                       2211 	_case COMMA sharp_tst 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008D0C 91 D6            [ 1]    1 	ld a,#COMMA 
      008D0E 01 26            [ 1]    2 	cp a,(TCHAR,sp) 
      008D10 05 90            [ 1]    3 	jrne sharp_tst
      008D12 93 CC            [ 1] 2212 	ld a,#TK_COMMA
      008D14 8E B8 72         [ 2] 2213 	jp token_char
      000D20                       2214 sharp_tst:
      000D20                       2215 	_case SHARP dash_tst 
      008D17 5C 00            [ 1]    1 	ld a,#SHARP 
      008D19 02 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008D1B 8E BB            [ 1]    3 	jrne dash_tst
      008D1D 6B 01            [ 1] 2216 	ld a,#TK_SHARP
      008D1F CC 0E 34         [ 2] 2217 	jp token_char  	 	 
      000D2B                       2218 dash_tst: 	
      000D2B                       2219 	_case '-' at_tst 
      008D1F A6 22            [ 1]    1 	ld a,#'-' 
      008D21 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D23 26 0A            [ 1]    3 	jrne at_tst
      008D25 A6 02            [ 1] 2220 	ld a,#TK_MINUS  
      008D27 F7 5C CD         [ 2] 2221 	jp token_char 
      000D36                       2222 at_tst:
      000D36                       2223 	_case '@' qmark_tst 
      008D2A 8B D3            [ 1]    1 	ld a,#'@' 
      008D2C CC 8E            [ 1]    2 	cp a,(TCHAR,sp) 
      008D2E B8 05            [ 1]    3 	jrne qmark_tst
      008D2F A6 06            [ 1] 2224 	ld a,#TK_ARRAY 
      008D2F A6 24 11         [ 2] 2225 	jp token_char
      000D41                       2226 qmark_tst:
      000D41                       2227 	_case '?' tick_tst 
      008D32 01 27            [ 1]    1 	ld a,#'?' 
      008D34 17 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D36 26 11            [ 1]    3 	jrne tick_tst
      008D38 01 26            [ 1] 2228 	ld a,#TK_CMD  
      008D3A 0A               [ 1] 2229 	ld (x),a 
      008D3B A6               [ 1] 2230 	incw x 
      008D3C 84 F7            [ 1] 2231 	ldw y,x 
      008D3E 5C CD 8C         [ 2] 2232 	ldw x,#PRT_IDX 
      008D41 72 CC            [ 2] 2233 	ldw (y),x 
      008D43 8E B8 7B 01      [ 2] 2234 	addw y,#2
      008D47 CD 86 76         [ 2] 2235 	jp token_exit
      000D59                       2236 tick_tst: ; comment 
      000D59                       2237 	_case TICK plus_tst 
      008D4A 24 0C            [ 1]    1 	ld a,#TICK 
      008D4C A6 84            [ 1]    2 	cp a,(TCHAR,sp) 
      008D4E F7 5C            [ 1]    3 	jrne plus_tst
      008D50 7B 01            [ 1] 2238 	ld a,#TK_CMD
      008D52 CD               [ 1] 2239 	ld (x),a 
      008D53 8C               [ 1] 2240 	incw x
      008D54 28 CC 8E B8      [ 2] 2241 	ldw y,#REM_IDX
      008D58 FF               [ 2] 2242 	ldw (x),y 
      008D58 A6 28 11         [ 2] 2243 	addw x,#2  
      000D6B                       2244 copy_comment:
      008D5B 01 26 05 A6      [ 2] 2245 	ldw y,#tib 
      008D5F 07 CC 8E B4      [ 2] 2246 	addw y,in.w
      008D63 90 89            [ 2] 2247 	pushw y
      008D63 A6 5C 11         [ 4] 2248 	call strcpy
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D66 01 26 16         [ 2] 2249     subw y,(1,sp)
      008D69 A6 03            [ 1] 2250 	ld a,yl 
      008D6B F7 5C 91         [ 1] 2251 	add a,in
      008D6E D6 01 F7         [ 1] 2252 	ld in,a 
      008D71 5C 90            [ 2] 2253 	ldw (1,sp),x
      008D73 93 72 5C         [ 2] 2254 	addw y,(1,sp)
      008D76 00 02            [ 1] 2255 	incw y 
      000D8A                       2256 	_drop 2 
      008D78 5F 97            [ 2]    1     addw sp,#2 
      008D7A A6 03 CC         [ 2] 2257 	ldw x,#REM_IDX 
      008D7D 8E B8            [ 1] 2258 	ld a,#TK_CMD 
      008D7F CC 0E 38         [ 2] 2259 	jp token_exit 
      000D94                       2260 plus_tst:
      000D94                       2261 	_case '+' star_tst 
      008D7F A6 29            [ 1]    1 	ld a,#'+' 
      008D81 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D83 26 05            [ 1]    3 	jrne star_tst
      008D85 A6 08            [ 1] 2262 	ld a,#TK_PLUS  
      008D87 CC 8E B4         [ 2] 2263 	jp token_char 
      008D8A                       2264 star_tst:
      000D9F                       2265 	_case '*' slash_tst 
      008D8A A6 3A            [ 1]    1 	ld a,#'*' 
      008D8C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D8E 26 05            [ 1]    3 	jrne slash_tst
      008D90 A6 01            [ 1] 2266 	ld a,#TK_MULT 
      008D92 CC 8E B4         [ 2] 2267 	jp token_char 
      008D95                       2268 slash_tst: 
      000DAA                       2269 	_case '/' prcnt_tst 
      008D95 A6 2C            [ 1]    1 	ld a,#'/' 
      008D97 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D99 26 05            [ 1]    3 	jrne prcnt_tst
      008D9B A6 09            [ 1] 2270 	ld a,#TK_DIV 
      008D9D CC 8E B4         [ 2] 2271 	jp token_char 
      008DA0                       2272 prcnt_tst:
      000DB5                       2273 	_case '%' eql_tst 
      008DA0 A6 23            [ 1]    1 	ld a,#'%' 
      008DA2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA4 26 05            [ 1]    3 	jrne eql_tst
      008DA6 A6 0A            [ 1] 2274 	ld a,#TK_MOD
      008DA8 CC 8E B4         [ 2] 2275 	jp token_char  
                                   2276 ; 1 or 2 character tokens 	
      008DAB                       2277 eql_tst:
      000DC0                       2278 	_case '=' gt_tst 		
      008DAB A6 2D            [ 1]    1 	ld a,#'=' 
      008DAD 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DAF 26 05            [ 1]    3 	jrne gt_tst
      008DB1 A6 11            [ 1] 2279 	ld a,#TK_EQUAL
      008DB3 CC 8E B4         [ 2] 2280 	jp token_char 
      008DB6                       2281 gt_tst:
      000DCB                       2282 	_case '>' lt_tst 
      008DB6 A6 40            [ 1]    1 	ld a,#'>' 
      008DB8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DBA 26 05            [ 1]    3 	jrne lt_tst
      008DBC A6 06            [ 1] 2283 	ld a,#TK_GT 
      008DBE CC 8E            [ 1] 2284 	ld (ATTRIB,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008DC0 B4 D6 00         [ 4] 2285 	ld a,([in.w],y)
      008DC1 72 5C 00 01      [ 1] 2286 	inc in 
      008DC1 A6 3F            [ 1] 2287 	cp a,#'=
      008DC3 11 01            [ 1] 2288 	jrne 1$
      008DC5 26 12            [ 1] 2289 	ld a,#TK_GE 
      008DC7 A6 80            [ 2] 2290 	jra token_char  
      008DC9 F7 5C            [ 1] 2291 1$: cp a,#'<
      008DCB 90 93            [ 1] 2292 	jrne 2$
      008DCD AE 00            [ 1] 2293 	ld a,#TK_NE 
      008DCF 74 90            [ 2] 2294 	jra token_char 
      008DD1 FF 72 A9 00      [ 1] 2295 2$: dec in
      008DD5 02 CC            [ 1] 2296 	ld a,(ATTRIB,sp)
      008DD7 8E B8            [ 2] 2297 	jra token_char 	 
      008DD9                       2298 lt_tst:
      000DF4                       2299 	_case '<' other
      008DD9 A6 27            [ 1]    1 	ld a,#'<' 
      008DDB 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DDD 26 35            [ 1]    3 	jrne other
      008DDF A6 80            [ 1] 2300 	ld a,#TK_LT 
      008DE1 F7 5C            [ 1] 2301 	ld (ATTRIB,sp),a 
      008DE3 90 AE 00         [ 4] 2302 	ld a,([in.w],y)
      008DE6 8E FF 1C 00      [ 1] 2303 	inc in 
      008DEA 02 3D            [ 1] 2304 	cp a,#'=
      008DEB 26 04            [ 1] 2305 	jrne 1$
      008DEB 90 AE            [ 1] 2306 	ld a,#TK_LE 
      008DED 16 90            [ 2] 2307 	jra token_char 
      008DEF 72 B9            [ 1] 2308 1$: cp a,#'>
      008DF1 00 01            [ 1] 2309 	jrne 2$
      008DF3 90 89            [ 1] 2310 	ld a,#TK_NE 
      008DF5 CD 84            [ 2] 2311 	jra token_char 
      008DF7 A6 72 F2 01      [ 1] 2312 2$: dec in 
      008DFB 90 9F            [ 1] 2313 	ld a,(ATTRIB,sp)
      008DFD CB 00            [ 2] 2314 	jra token_char 	
      000E1D                       2315 other: ; not a special character 	 
      008DFF 02 C7            [ 1] 2316 	ld a,(TCHAR,sp)
      008E01 00 02 1F         [ 4] 2317 	call is_alpha 
      008E04 01 72            [ 1] 2318 	jrc 30$ 
      008E06 F9 01 90         [ 2] 2319 	jp syntax_error 
      000E27                       2320 30$: 
      008E09 5C 5B 02         [ 4] 2321 	call parse_keyword
      008E0C AE 00 8E         [ 2] 2322 	cpw x,#remark 
      008E0F A6 80            [ 1] 2323 	jrne token_exit 
      008E11 CC 8E            [ 1] 2324 	ldw y,x 
      008E13 B8 0D 6B         [ 2] 2325 	jp copy_comment 
      008E14                       2326 token_char:
      008E14 A6               [ 1] 2327 	ld (x),a 
      008E15 2B               [ 1] 2328 	incw x
      008E16 11 01            [ 1] 2329 	ldw y,x 
      000E38                       2330 token_exit:
      000E38                       2331 	_drop VSIZE 
      008E18 26 05            [ 2]    1     addw sp,#VSIZE 
      008E1A A6               [ 4] 2332 	ret
                                   2333 
                                   2334 
                                   2335 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2336 ; convert alpha to uppercase
                                   2337 ; input:
                                   2338 ;    a  character to convert
                                   2339 ; output:
                                   2340 ;    a  uppercase character
                                   2341 ;------------------------------------
      000E3B                       2342 to_upper::
      008E1B 10 CC            [ 1] 2343 	cp a,#'a
      008E1D 8E B4            [ 1] 2344 	jrpl 1$
      008E1F 81               [ 4] 2345 0$:	ret
      008E1F A6 2A            [ 1] 2346 1$: cp a,#'z	
      008E21 11 01            [ 1] 2347 	jrugt 0$
      008E23 26 05            [ 1] 2348 	sub a,#32
      008E25 A6               [ 4] 2349 	ret
                                   2350 	
                                   2351 ;------------------------------------
                                   2352 ; convert pad content in integer
                                   2353 ; input:
                                   2354 ;    x		.asciz to convert
                                   2355 ; output:
                                   2356 ;    acc24      int24_t
                                   2357 ;------------------------------------
                                   2358 	; local variables
                           000001  2359 	SIGN=1 ; 1 byte, 
                           000002  2360 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2361 	TEMP=3 ; 1 byte, temporary storage
                           000003  2362 	VSIZE=3 ; 3 bytes reserved for local storage
      000E47                       2363 atoi24::
      008E26 20               [ 2] 2364 	pushw x 
      000E48                       2365 	_vars VSIZE
      008E27 CC 8E            [ 2]    1     sub sp,#VSIZE 
                                   2366 	; acc24=0 
      008E29 B4 5F 00 0B      [ 1] 2367 	clr acc24    
      008E2A 72 5F 00 0C      [ 1] 2368 	clr acc16
      008E2A A6 2F 11 01      [ 1] 2369 	clr acc8 
      008E2E 26 05            [ 1] 2370 	clr (SIGN,sp)
      008E30 A6 21            [ 1] 2371 	ld a,#10
      008E32 CC 8E            [ 1] 2372 	ld (BASE,sp),a ; default base decimal
      008E34 B4               [ 1] 2373 	ld a,(x)
      008E35 27 47            [ 1] 2374 	jreq 9$  ; completed if 0
      008E35 A6 25            [ 1] 2375 	cp a,#'-
      008E37 11 01            [ 1] 2376 	jrne 1$
      008E39 26 05            [ 1] 2377 	cpl (SIGN,sp)
      008E3B A6 22            [ 2] 2378 	jra 2$
      008E3D CC 8E            [ 1] 2379 1$: cp a,#'$
      008E3F B4 06            [ 1] 2380 	jrne 3$
      008E40 A6 10            [ 1] 2381 	ld a,#16
      008E40 A6 3D            [ 1] 2382 	ld (BASE,sp),a
      008E42 11               [ 1] 2383 2$:	incw x
      008E43 01               [ 1] 2384 	ld a,(x)
      000E71                       2385 3$:	
      008E44 26 05            [ 1] 2386 	cp a,#'a
      008E46 A6 32            [ 1] 2387 	jrmi 4$
      008E48 CC 8E            [ 1] 2388 	sub a,#32
      008E4A B4 30            [ 1] 2389 4$:	cp a,#'0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E4B 2B 2B            [ 1] 2390 	jrmi 9$
      008E4B A6 3E            [ 1] 2391 	sub a,#'0
      008E4D 11 01            [ 1] 2392 	cp a,#10
      008E4F 26 23            [ 1] 2393 	jrmi 5$
      008E51 A6 31            [ 1] 2394 	sub a,#7
      008E53 6B 02            [ 1] 2395 	cp a,(BASE,sp)
      008E55 91 D6            [ 1] 2396 	jrpl 9$
      008E57 01 72            [ 1] 2397 5$:	ld (TEMP,sp),a
      008E59 5C 00            [ 1] 2398 	ld a,(BASE,sp)
      008E5B 02 A1 3D         [ 4] 2399 	call mulu24_8
      008E5E 26 04            [ 1] 2400 	ld a,(TEMP,sp)
      008E60 A6 33 20         [ 1] 2401 	add a,acc24+2
      008E63 50 A1 3C         [ 1] 2402 	ld acc24+2,a
      008E66 26               [ 1] 2403 	clr a
      008E67 04 A6 35         [ 1] 2404 	adc a,acc24+1
      008E6A 20 48 72         [ 1] 2405 	ld acc24+1,a
      008E6D 5A               [ 1] 2406 	clr a
      008E6E 00 02 7B         [ 1] 2407 	adc a,acc24
      008E71 02 20 40         [ 1] 2408 	ld acc24,a
      008E74 20 C9            [ 2] 2409 	jra 2$
      008E74 A6 3C            [ 1] 2410 9$:	tnz (SIGN,sp)
      008E76 11 01            [ 1] 2411     jreq atoi_exit
      008E78 26 23 A6         [ 4] 2412     call neg_acc24
      000EAD                       2413 atoi_exit: 
      000EAD                       2414 	_drop VSIZE
      008E7B 34 6B            [ 2]    1     addw sp,#VSIZE 
      008E7D 02               [ 2] 2415 	popw x ; restore x
      008E7E 91               [ 4] 2416 	ret
                                   2417 
                                   2418 
                                   2419 ;------------------------------------
                                   2420 ; skip character c in text starting from 'in'
                                   2421 ; input:
                                   2422 ;	 y 		point to text buffer
                                   2423 ;    a 		character to skip
                                   2424 ; output:  
                                   2425 ;	'in' ajusted to new position
                                   2426 ;------------------------------------
                           000001  2427 	C = 1 ; local var
      000EB1                       2428 skip:
      008E7F D6               [ 1] 2429 	push a
      008E80 01 72 5C         [ 4] 2430 1$:	ld a,([in.w],y)
      008E83 00 02            [ 1] 2431 	jreq 2$
      008E85 A1 3D            [ 1] 2432 	cp a,(C,sp)
      008E87 26 04            [ 1] 2433 	jrne 2$
      008E89 A6 36 20 27      [ 1] 2434 	inc in
      008E8D A1 3E            [ 2] 2435 	jra 1$
      000EC1                       2436 2$: _drop 1 
      008E8F 26 04            [ 2]    1     addw sp,#1 
      008E91 A6               [ 4] 2437 	ret
                                   2438 	
                                   2439 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2440 ;;   TINY BASIC  operators,
                                   2441 ;;   commands and functions 
                                   2442 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2443 
                                   2444 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2445 ;;  Arithmetic operators
                                   2446 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2447 
                                   2448 ;debug support
                           000001  2449 DEBUG_PRT=1
                           000001  2450 .if DEBUG_PRT 
                           000001  2451 	REGA=1
                           000002  2452 	SAVEB=2
                           000003  2453 	REGX=3
                           000005  2454 	REGY=5
                           000007  2455 	ACC24=7
                           000009  2456 	VSIZE=9 
      000EC4                       2457 printxy:
      000EC4                       2458 	_vars VSIZE 
      008E92 35 20            [ 2]    1     sub sp,#VSIZE 
      008E94 1F 72            [ 1] 2459 	ld (REGA,sp),a 
      008E96 5A 00 02         [ 1] 2460 	ld a,base 
      008E99 7B 02            [ 1] 2461 	ld (SAVEB,sp),a
      008E9B 20 17            [ 2] 2462 	ldw (REGX,sp),x
      008E9D 17 05            [ 2] 2463 	ldw (REGY,sp),y
      008E9D 7B 01 CD         [ 2] 2464 	ldw x,acc24 
      008EA0 86 65 25         [ 1] 2465 	ld a,acc8 
      008EA3 03 CC            [ 2] 2466 	ldw (ACC24,sp),x 
      008EA5 89 7A            [ 1] 2467 	ld (ACC24+2,sp),a 
      008EA7 35 10 00 0A      [ 1] 2468 	mov base,#16 
      008EA7 CD               [ 1] 2469 	clrw x 
      008EA8 8C AF            [ 1] 2470 	ld a,(REGA,sp)
      008EAA A3               [ 1] 2471 	ld xl,a 
      008EAB 97 30 26         [ 4] 2472 	call print_int
      008EAE 09 90            [ 1] 2473 	ld a,#SPACE 
      008EB0 93 CC 8D         [ 4] 2474 	call putc  
      008EB3 EB 03            [ 2] 2475 	ldw x,(REGX,sp)
      008EB4 CD 0A 4D         [ 4] 2476 	call print_int 
      008EB4 F7 5C            [ 1] 2477 	ld a,#SPACE 
      008EB6 90 93 0A         [ 4] 2478 	call putc  
      008EB8 1E 05            [ 2] 2479 	ldw x,(REGY,sp)
      008EB8 5B 02 81         [ 4] 2480 	call print_int 
      008EBB A6 0D            [ 1] 2481 	ld a,#CR 
      008EBB A1 61 2A         [ 4] 2482 	call putc 
      008EBE 01 81            [ 1] 2483 	ld a,(ACC24+2,sp)
      008EC0 A1 7A            [ 2] 2484 	ldw x,(ACC24,sp)
      008EC2 22 FB A0         [ 2] 2485 	ldw acc24,x 
      008EC5 20 81 0D         [ 1] 2486 	ld acc8,a
      008EC7 7B 02            [ 1] 2487 	ld a,(SAVEB,sp)
      008EC7 89 52 03         [ 1] 2488 	ld base,a 
      008ECA 72 5F            [ 1] 2489 	ld a,(REGA,sp)
      008ECC 00 0C            [ 2] 2490 	ldw x,(REGX,sp)
      008ECE 72 5F            [ 2] 2491 	ldw y,(REGY,sp)
      000F14                       2492 	_drop VSIZE 
      008ED0 00 0D            [ 2]    1     addw sp,#VSIZE 
      008ED2 72               [ 4] 2493 	ret 
                                   2494 .endif 
                                   2495 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2496 
                                   2497 ;--------------------------------------
                                   2498 ;  multiply 2 uint16_t return uint32_t
                                   2499 ;  input:
                                   2500 ;     x       uint16_t 
                                   2501 ;     y       uint16_t 
                                   2502 ;  output:
                                   2503 ;     x       product bits 15..0
                                   2504 ;     y       product bits 31..16 
                                   2505 ;---------------------------------------
                           000001  2506 		U1=1  ; uint16_t 
                           000003  2507 		DBL=3 ; uint32_t
                           000006  2508 		VSIZE=6
      000F17                       2509 umstar:
      000F17                       2510 	_vars VSIZE 
      008ED3 5F 00            [ 2]    1     sub sp,#VSIZE 
      008ED5 0E 0F            [ 2] 2511 	ldw (U1,sp),x 
                                   2512 ;initialize bits 31..16 of 
                                   2513 ;product to zero 
      008ED7 01 A6            [ 1] 2514 	clr (DBL,sp)
      008ED9 0A 6B            [ 1] 2515 	clr (DBL+1,sp)
                                   2516 ; produc U1L*U2L 
      008EDB 02 F6            [ 1] 2517 	ld a,yl 
      008EDD 27               [ 4] 2518 	mul x,a 
      008EDE 47 A1            [ 2] 2519 	ldw (DBL+2,sp),x
                                   2520 ; product U1H*U2L 
      008EE0 2D 26            [ 1] 2521 	ld a,(U1,sp) ; xh 
      008EE2 04               [ 1] 2522 	ldw x,y
      008EE3 03               [ 4] 2523 	mul x,a 
      008EE4 01               [ 1] 2524 	clr a 
      008EE5 20 08 A1         [ 2] 2525 	addw x,(DBL+1,sp) 
      008EE8 24               [ 1] 2526 	clr a 
      008EE9 26 06            [ 1] 2527 	adc a,(DBL,sp) 
      008EEB A6 10            [ 1] 2528 	ld (DBL,sp),a ; bits 23..17 
      008EED 6B 02            [ 2] 2529 	ldw (DBL+1,sp),x ; bits 15..0 
                                   2530 ; product U1L*U2H
      008EEF 5C F6            [ 1] 2531 	swapw y 
      008EF1 93               [ 1] 2532 	ldw x,y
      008EF1 A1 61            [ 1] 2533 	ld a,(U1+1,sp)
      008EF3 2B               [ 4] 2534 	mul x,a
      008EF4 02 A0 20         [ 2] 2535 	addw x,(DBL+1,sp)
      008EF7 A1               [ 1] 2536 	clr a 
      008EF8 30 2B            [ 1] 2537 	adc a,(DBL,sp)
      008EFA 2B A0            [ 1] 2538 	ld (DBL,sp),a 
      008EFC 30 A1            [ 2] 2539 	ldw (DBL+1,sp),x 
                                   2540 ; product U1H*U2H 	
      008EFE 0A 2B            [ 1] 2541 	ld a,(U1,sp)
      008F00 06               [ 1] 2542 	ldw x,y  
      008F01 A0               [ 4] 2543 	mul x,a 
      008F02 07 11 02         [ 2] 2544 	addw x,(DBL,sp)
      008F05 2A 1F            [ 1] 2545 	ldw y,x 
      008F07 6B 03            [ 2] 2546 	ldw x,(DBL+2,sp)
      000F4E                       2547 	_drop VSIZE 
      008F09 7B 02            [ 2]    1     addw sp,#VSIZE 
      008F0B CD               [ 4] 2548 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2549 
                                   2550 
                                   2551 ;-------------------------------------
                                   2552 ; multiply 2 integers
                                   2553 ; input:
                                   2554 ;  	x       n1 
                                   2555 ;   y 		n2 
                                   2556 ; output:
                                   2557 ;	X        N1*N2 bits 15..0
                                   2558 ;   Y        N1*N2 bits 31..16 
                                   2559 ;-------------------------------------
                           000001  2560 	SIGN=1
                           000001  2561 	VSIZE=1
      000F51                       2562 multiply:
      000F51                       2563 	_vars VSIZE 
      008F0C 8B 76            [ 2]    1     sub sp,#VSIZE 
      008F0E 7B 03            [ 1] 2564 	clr (SIGN,sp)
      008F10 CB               [ 1] 2565 	ld a,xh 
      008F11 00 0E            [ 1] 2566 	and a,#0x80
      008F13 C7 00            [ 1] 2567 	jrpl 1$
      008F15 0E 4F            [ 1] 2568 	cpl (SIGN,sp)
      008F17 C9               [ 2] 2569 	negw x 
      000F5D                       2570 1$:	
      008F18 00 0D            [ 1] 2571 	ld a,yh
      008F1A C7 00            [ 1] 2572 	and a,#0x80  
      008F1C 0D 4F            [ 1] 2573 	jrpl 2$ 
      008F1E C9 00            [ 1] 2574 	cpl (SIGN,sp)
      008F20 0C C7            [ 2] 2575 	negw y 
      000F67                       2576 2$:	
      008F22 00 0C 20         [ 4] 2577 	call umstar
      008F25 C9 0D            [ 1] 2578 	ld a,(SIGN,sp)
      008F27 01 27            [ 1] 2579 	jreq 3$
      008F29 03 CD 8B         [ 4] 2580 	call dneg 
      000F71                       2581 3$:	
      000F71                       2582 	_drop VSIZE 
      008F2C B0 01            [ 2]    1     addw sp,#VSIZE 
      008F2D 81               [ 4] 2583 	ret
                                   2584 
                                   2585 ;--------------------------------------
                                   2586 ; divide uint32_t/uint16_t
                                   2587 ; return:  quotient and remainder 
                                   2588 ; quotient expected to be uint16_t 
                                   2589 ; input:
                                   2590 ;   DBLDIVDND    on stack 
                                   2591 ;   X            divisor 
                                   2592 ; output:
                                   2593 ;   X            quotient 
                                   2594 ;   Y            remainder 
                                   2595 ;---------------------------------------
                           000003  2596 	VSIZE=3
      000F74                       2597 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000F74                       2598 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   2599 	; local variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                           000001  2600 	DIVISOR=1 
                           000003  2601 	CNTR=3 
      000F74                       2602 udiv32_16:
      000F74                       2603 	_vars VSIZE 
      008F2D 5B 03            [ 2]    1     sub sp,#VSIZE 
      008F2F 85 81            [ 2] 2604 	ldw (DIVISOR,sp),x	; save divisor 
      008F31 1E 08            [ 2] 2605 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008F31 88 91            [ 2] 2606 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008F33 D6 01            [ 2] 2607 	tnzw y
      008F35 27 0A            [ 1] 2608 	jrne long_division 
      008F37 11 01            [ 2] 2609 	ldw y,(DIVISOR,sp)
      008F39 26               [ 2] 2610 	divw x,y
      000F83                       2611 	_drop VSIZE 
      008F3A 06 72            [ 2]    1     addw sp,#VSIZE 
      008F3C 5C               [ 4] 2612 	ret
      000F86                       2613 long_division:
      008F3D 00               [ 1] 2614 	exgw x,y ; hi in x, lo in y 
      008F3E 02 20            [ 1] 2615 	ld a,#17 
      008F40 F1 5B            [ 1] 2616 	ld (CNTR,sp),a
      000F8B                       2617 1$:
      008F42 01 81            [ 2] 2618 	cpw x,(DIVISOR,sp)
      008F44 2B 03            [ 1] 2619 	jrmi 2$
      008F44 52 09 6B         [ 2] 2620 	subw x,(DIVISOR,sp)
      008F47 01               [ 1] 2621 2$:	ccf 
      008F48 C6 00            [ 2] 2622 	rlcw y 
      008F4A 0B               [ 2] 2623 	rlcw x 
      008F4B 6B 02            [ 1] 2624 	dec (CNTR,sp)
      008F4D 1F 03            [ 1] 2625 	jrne 1$
      008F4F 17               [ 1] 2626 	exgw x,y 
      000F9B                       2627 	_drop VSIZE 
      008F50 05 CE            [ 2]    1     addw sp,#VSIZE 
      008F52 00               [ 4] 2628 	ret
                                   2629 
                                   2630 ;-----------------------------
                                   2631 ; negate double int.
                                   2632 ; input:
                                   2633 ;   x     bits 15..0
                                   2634 ;   y     bits 31..16
                                   2635 ; output: 
                                   2636 ;   x     bits 15..0
                                   2637 ;   y     bits 31..16
                                   2638 ;-----------------------------
      000F9E                       2639 dneg:
      008F53 0C               [ 2] 2640 	cplw x 
      008F54 C6 00            [ 2] 2641 	cplw y 
      008F56 0E 1F 07         [ 2] 2642 	addw x,#1 
      008F59 6B 09            [ 1] 2643 	jrnc 1$
      008F5B 35 10            [ 1] 2644 	incw y 
      008F5D 00               [ 4] 2645 1$: ret 
                                   2646 
                                   2647 
                                   2648 ;--------------------------------
                                   2649 ; sign extend single to double
                                   2650 ; input:
                                   2651 ;   x    int16_t
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2652 ; output:
                                   2653 ;   x    int32_t bits 15..0
                                   2654 ;   y    int32_t bits 31..16
                                   2655 ;--------------------------------
      000FA9                       2656 dbl_sign_extend:
      008F5E 0B 5F            [ 1] 2657 	clrw y
      008F60 7B               [ 1] 2658 	ld a,xh 
      008F61 01 97            [ 1] 2659 	and a,#0x80 
      008F63 CD 8A            [ 1] 2660 	jreq 1$
      008F65 CD A6            [ 2] 2661 	cplw y
      008F67 20               [ 4] 2662 1$: ret 	
                                   2663 
                                   2664 
                                   2665 ;----------------------------------
                                   2666 ;  euclidian divide dbl/n1 
                                   2667 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   2668 ; input:
                                   2669 ;    dbl    int32_t on stack 
                                   2670 ;    x 		n1   int16_t  disivor  
                                   2671 ; output:
                                   2672 ;    X      dbl/x  int16_t 
                                   2673 ;    Y      remainder int16_t 
                                   2674 ;----------------------------------
                           000008  2675 	VSIZE=8
      000FB3                       2676 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000FB3                       2677 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000FB3                       2678 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   2679 	; local variables
                           000001  2680 	DBLHI=1
                           000003  2681 	DBLLO=3 
                           000005  2682 	SDIVSR=5 ; sign divisor
                           000006  2683 	SQUOT=6 ; sign dividend 
                           000007  2684 	DIVISR=7 ; divisor 
      000FB3                       2685 div32_16:
      000FB3                       2686 	_vars VSIZE 
      008F68 CD 83            [ 2]    1     sub sp,#VSIZE 
      008F6A 8A 1E            [ 1] 2687 	clr (SDIVSR,sp)
      008F6C 03 CD            [ 1] 2688 	clr (SQUOT,sp)
                                   2689 ; copy arguments 
      008F6E 8A CD            [ 2] 2690 	ldw y,(DIVDNDHI,sp)
      008F70 A6 20            [ 2] 2691 	ldw (DBLHI,sp),y
      008F72 CD 83            [ 2] 2692 	ldw y,(DIVDNDLO,sp)
      008F74 8A 1E            [ 2] 2693 	ldw (DBLLO,sp),y 
                                   2694 ; check for 0 divisor
      008F76 05               [ 2] 2695 	tnzw x 
      008F77 CD 8A            [ 1] 2696     jrne 0$
      008F79 CD A6            [ 1] 2697 	ld a,#ERR_DIV0 
      008F7B 0D CD 83         [ 2] 2698 	jp tb_error 
                                   2699 ; check divisor sign 	
      008F7E 8A               [ 1] 2700 0$:	ld a,xh 
      008F7F 7B 09            [ 1] 2701 	and a,#0x80 
      008F81 1E 07            [ 1] 2702 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F83 CF 00            [ 1] 2703 	cpl (SDIVSR,sp)
      008F85 0C C7            [ 1] 2704 	cpl (SQUOT,sp)
      008F87 00               [ 2] 2705 	negw x
      008F88 0E 7B            [ 2] 2706 1$:	ldw (DIVISR,sp),x
                                   2707 ; check dividend sign 	 
      008F8A 02 C7            [ 1] 2708  	ld a,(DBLHI,sp) 
      008F8C 00 0B            [ 1] 2709 	and a,#0x80 
      008F8E 7B 01            [ 1] 2710 	jreq 2$ 
      008F90 1E 03            [ 1] 2711 	cpl (SQUOT,sp)
      008F92 16 05            [ 2] 2712 	ldw x,(DBLLO,sp)
      008F94 5B 09            [ 2] 2713 	ldw y,(DBLHI,sp)
      008F96 81 0F 9E         [ 4] 2714 	call dneg 
      008F97 1F 03            [ 2] 2715 	ldw (DBLLO,sp),x 
      008F97 52 06            [ 2] 2716 	ldw (DBLHI,sp),y 
      008F99 1F 01            [ 2] 2717 2$:	ldw x,(DIVISR,sp)
      008F9B 0F 03 0F         [ 4] 2718 	call udiv32_16
      008F9E 04 90            [ 2] 2719 	tnzw y 
      008FA0 9F 42            [ 1] 2720 	jreq 3$ 
                                   2721 ; x=quotient 
                                   2722 ; y=remainder 
                                   2723 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008FA2 1F 05            [ 1] 2724 	ld a,(SQUOT,sp)
      008FA4 7B 01            [ 1] 2725 	xor a,(SDIVSR,sp)
      008FA6 93 42            [ 1] 2726 	jreq 3$
      008FA8 4F               [ 1] 2727 	incw x 
      008FA9 72 FB 04 4F      [ 2] 2728 	ldw acc16,y 
      008FAD 19 03            [ 2] 2729 	ldw y,(DIVISR,sp)
      008FAF 6B 03 1F 04      [ 2] 2730 	subw y,acc16
                                   2731 ; sign quotient
      008FB3 90 5E            [ 1] 2732 3$:	ld a,(SQUOT,sp)
      008FB5 93 7B            [ 1] 2733 	jreq 4$
      008FB7 02               [ 2] 2734 	negw x 
      001007                       2735 4$:	
      001007                       2736 	_drop VSIZE 
      008FB8 42 72            [ 2]    1     addw sp,#VSIZE 
      008FBA FB               [ 4] 2737 	ret 
                                   2738 
                                   2739 
                                   2740 
                                   2741 ;----------------------------------
                                   2742 ; division x/y 
                                   2743 ; input:
                                   2744 ;    X       dividend
                                   2745 ;    Y       divisor 
                                   2746 ; output:
                                   2747 ;    X       quotient
                                   2748 ;    Y       remainder 
                                   2749 ;-----------------------------------
                           000004  2750 	VSIZE=4 
                                   2751 	; local variables 
                           000001  2752 	DBLHI=1
                           000003  2753 	DBLLO=3
      00100A                       2754 divide: 
      00100A                       2755 	_vars VSIZE 
      008FBB 04 4F            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008FBD 19 03 6B 03      [ 2] 2756 	ldw acc16,y
      008FC1 1F 04 7B         [ 4] 2757 	call dbl_sign_extend
      008FC4 01 93            [ 2] 2758 	ldw (DBLLO,sp),x 
      008FC6 42 72            [ 2] 2759 	ldw (DBLHI,sp),y 
      008FC8 FB 03 90         [ 2] 2760 	ldw x,acc16 
      008FCB 93 1E 05         [ 4] 2761 	call div32_16 
      00101D                       2762 	_drop VSIZE 
      008FCE 5B 06            [ 2]    1     addw sp,#VSIZE 
      008FD0 81               [ 4] 2763 	ret
                                   2764 
                                   2765 
                                   2766 ;----------------------------------
                                   2767 ;  remainder resulting from euclidian 
                                   2768 ;  division of x/y 
                                   2769 ; input:
                                   2770 ;   x   	dividend int16_t 
                                   2771 ;   y 		divisor int16_t
                                   2772 ; output:
                                   2773 ;   X       n1%n2 
                                   2774 ;----------------------------------
      008FD1                       2775 modulo:
      008FD1 52 01 0F         [ 4] 2776 	call divide
      008FD4 01               [ 1] 2777 	ldw x,y 
      008FD5 9E               [ 4] 2778 	ret 
                                   2779 
                                   2780 ;----------------------------------
                                   2781 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2782 ; return expr1*expr2/expr3 
                                   2783 ; product result is int32_t and 
                                   2784 ; divisiont is int32_t/int16_t
                                   2785 ;----------------------------------
                           000004  2786 	DBL_SIZE=4 
      001025                       2787 muldiv:
      008FD6 A4 80 2A         [ 4] 2788 	call func_args 
      008FD9 03 03            [ 1] 2789 	cp a,#3 
      008FDB 01 50            [ 1] 2790 	jreq 1$
      008FDD CC 08 FA         [ 2] 2791 	jp syntax_error
      00102F                       2792 1$: 
      008FDD 90 9E            [ 2] 2793 	ldw x,(5,sp) ; expr1
      008FDF A4 80            [ 2] 2794 	ldw y,(3,sp) ; expr2
      008FE1 2A 04 03         [ 4] 2795 	call multiply 
      008FE4 01 90            [ 2] 2796 	ldw (5,sp),x  ;int32_t 15..0
      008FE6 50 03            [ 2] 2797 	ldw (3,sp),y  ;int32_t 31..16
      008FE7 85               [ 2] 2798 	popw x        ; expr3 
      008FE7 CD 8F 97         [ 4] 2799 	call div32_16 ; int32_t/expr3 
      00103E                       2800 	_drop DBL_SIZE
      008FEA 7B 01            [ 2]    1     addw sp,#DBL_SIZE 
      008FEC 27               [ 4] 2801 	ret 
                                   2802 
                                   2803 
                                   2804 ;----------------------------------
                                   2805 ; search in kword_dict name
                                   2806 ; from its execution address 
                                   2807 ; input:
                                   2808 ;   X       	cmd_index 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2809 ; output:
                                   2810 ;   X 			cstr*  | 0 
                                   2811 ;--------------------------------
                           000001  2812 	CMDX=1 
                           000003  2813 	LINK=3 
                           000004  2814 	VSIZE=4
      001041                       2815 cmd_name:
      001041                       2816 	_vars VSIZE 
      008FED 03 CD            [ 2]    1     sub sp,#VSIZE 
      008FEF 90 1E 00 0C      [ 1] 2817 	clr acc16 
      008FF1 1F 01            [ 2] 2818 	ldw (CMDX,sp),x  
      008FF1 5B 01 81         [ 2] 2819 	ldw x,#kword_dict	
      008FF4 1F 03            [ 2] 2820 1$:	ldw (LINK,sp),x
      008FF4 52 03            [ 1] 2821 	ld a,(2,x)
      008FF6 1F 01            [ 1] 2822 	and a,#15 
      008FF8 1E 08 16         [ 1] 2823 	ld acc8,a 
      008FFB 06 90 5D         [ 2] 2824 	addw x,#3
      008FFE 26 06 16 01      [ 2] 2825 	addw x,acc16
      009002 65               [ 2] 2826 	ldw x,(x) ; command index  
      009003 5B 03            [ 2] 2827 	cpw x,(CMDX,sp)
      009005 81 0A            [ 1] 2828 	jreq 2$
      009006 1E 03            [ 2] 2829 	ldw x,(LINK,sp)
      009006 51               [ 2] 2830 	ldw x,(x) 
      009007 A6 11 6B         [ 2] 2831 	subw x,#2  
      00900A 03 E3            [ 1] 2832 	jrne 1$
      00900B 20 05            [ 2] 2833 	jra 9$
      00900B 13 01            [ 2] 2834 2$: ldw x,(LINK,sp)
      00900D 2B 03 72         [ 2] 2835 	addw x,#2 	
      001070                       2836 9$:	_drop VSIZE
      009010 F0 01            [ 2]    1     addw sp,#VSIZE 
      009012 8C               [ 4] 2837 	ret
                                   2838 
                                   2839 
                                   2840 ;---------------------------------
                                   2841 ; dictionary search 
                                   2842 ; input:
                                   2843 ;	X 		dictionary entry point, name field  
                                   2844 ;   y		.asciz name to search 
                                   2845 ; output:
                                   2846 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2847 ;  X		cmd_index ; execution address | 0 
                                   2848 ;---------------------------------
                           000001  2849 	NLEN=1 ; cmd length 
                           000002  2850 	XSAVE=2
                           000004  2851 	YSAVE=4
                           000005  2852 	VSIZE=5 
      001073                       2853 search_dict:
      001073                       2854 	_vars VSIZE 
      009013 90 59            [ 2]    1     sub sp,#VSIZE 
                                   2855 
      009015 59 0A            [ 2] 2856 	ldw (YSAVE,sp),y 
      001077                       2857 search_next:
      009017 03 26            [ 2] 2858 	ldw (XSAVE,sp),x 
                                   2859 ; get name length in dictionary	
      009019 F1               [ 1] 2860 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      00901A 51 5B            [ 1] 2861 	and a,#0xf 
      00901C 03 81            [ 1] 2862 	ld (NLEN,sp),a  
      00901E 16 04            [ 2] 2863 	ldw y,(YSAVE,sp) ; name pointer 
      00901E 53               [ 1] 2864 	incw x 
      001081                       2865 cp_loop:
      00901F 90 53            [ 1] 2866 	ld a,(y)
      009021 1C 00            [ 1] 2867 	jreq str_match 
      009023 01 24            [ 1] 2868 	tnz (NLEN,sp)
      009025 02 90            [ 1] 2869 	jreq no_match  
      009027 5C               [ 1] 2870 	cp a,(x)
      009028 81 07            [ 1] 2871 	jrne no_match 
      009029 90 5C            [ 1] 2872 	incw y 
      009029 90               [ 1] 2873 	incw x
      00902A 5F 9E            [ 1] 2874 	dec (NLEN,sp)
      00902C A4 80            [ 2] 2875 	jra cp_loop 
      001093                       2876 no_match:
      00902E 27 02            [ 2] 2877 	ldw x,(XSAVE,sp) 
      009030 90 53 81         [ 2] 2878 	subw x,#2 ; move X to link field
      009033 4B 00            [ 1] 2879 	push #TK_NONE 
      009033 52               [ 2] 2880 	ldw x,(x) ; next word link 
      009034 08               [ 1] 2881 	pop a ; TK_NONE 
      009035 0F 05            [ 1] 2882 	jreq search_exit  ; not found  
                                   2883 ;try next 
      009037 0F 06            [ 2] 2884 	jra search_next
      0010A0                       2885 str_match:
      009039 16 0B            [ 2] 2886 	ldw x,(XSAVE,sp)
      00903B 17               [ 1] 2887 	ld a,(X)
      00903C 01 16            [ 1] 2888 	ld (NLEN,sp),a ; needed to test keyword type  
      00903E 0D 17            [ 1] 2889 	and a,#0xf 
                                   2890 ; move x to procedure address field 	
      009040 03               [ 1] 2891 	inc a 
      009041 5D 26 05         [ 1] 2892 	ld acc8,a 
      009044 A6 04 CC 89      [ 1] 2893 	clr acc16 
      009048 7C 9E A4 80      [ 2] 2894 	addw x,acc16 
      00904C 27               [ 2] 2895 	ldw x,(x) ; routine index  
                                   2896 ;determine keyword type bits 7:6 
      00904D 05 03            [ 1] 2897 	ld a,(NLEN,sp)
      00904F 05               [ 1] 2898 	swap a 
      009050 03 06            [ 1] 2899 	and a,#0xc
      009052 50               [ 1] 2900 	srl a
      009053 1F               [ 1] 2901 	srl a 
      009054 07 7B            [ 1] 2902 	add a,#128
      0010BD                       2903 search_exit: 
      0010BD                       2904 	_drop VSIZE 	 
      009056 01 A4            [ 2]    1     addw sp,#VSIZE 
      009058 80               [ 4] 2905 	ret 
                                   2906 
                                   2907 ;---------------------
                                   2908 ; check if next token
                                   2909 ;  is of expected type 
                                   2910 ; input:
                                   2911 ;   A 		 expected token attribute
                                   2912 ;  ouput:
                                   2913 ;   none     if fail call syntax_error 
                                   2914 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0010C0                       2915 expect:
      009059 27               [ 1] 2916 	push a 
      00905A 0D 03 06         [ 4] 2917 	call next_token 
      00905D 1E 03            [ 1] 2918 	cp a,(1,sp)
      00905F 16 01            [ 1] 2919 	jreq 1$
      009061 CD 90 1E         [ 2] 2920 	jp syntax_error
      009064 1F               [ 1] 2921 1$: pop a 
      009065 03               [ 4] 2922 	ret 
                                   2923 
                                   2924 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2925 ; parse arguments list 
                                   2926 ; between ()
                                   2927 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0010CD                       2928 func_args:
      009066 17 01            [ 1] 2929 	ld a,#TK_LPAREN 
      009068 1E 07 CD         [ 4] 2930 	call expect 
                                   2931 ; expected to continue in arg_list 
                                   2932 ; caller must check for TK_RPAREN 
                                   2933 
                                   2934 ;-------------------------------
                                   2935 ; parse embedded BASIC routines 
                                   2936 ; arguments list.
                                   2937 ; arg_list::=  rel[','rel]*
                                   2938 ; all arguments are of integer type
                                   2939 ; and pushed on stack 
                                   2940 ; input:
                                   2941 ;   none
                                   2942 ; output:
                                   2943 ;   stack{n}   arguments pushed on stack
                                   2944 ;   A 	number of arguments pushed on stack  
                                   2945 ;--------------------------------
      0010D2                       2946 arg_list:
      00906B 8F F4            [ 1] 2947 	push #0  
      00906D 90 5D 27         [ 4] 2948 1$: call relation
      009070 11 7B            [ 1] 2949 	cp a,#TK_NONE 
      009072 06 18            [ 1] 2950 	jreq 5$
      009074 05 27            [ 1] 2951 	cp a,#TK_INTGR
      009076 0B 5C            [ 1] 2952 	jrne 4$
      0010DF                       2953 3$: 
                                   2954 ; swap return address with argument
      009078 90               [ 1] 2955 	pop a ; arg_count
      009079 CF 00            [ 2] 2956 	popw y ; return address 
      00907B 0D               [ 2] 2957 	pushw x ; new argument 
      00907C 16 07            [ 2] 2958 	pushw y 
      00907E 72               [ 1] 2959     inc a
      00907F B2               [ 1] 2960 	push a 
      009080 00 0D 7B         [ 4] 2961 	call next_token 
      009083 06 27            [ 1] 2962 	cp a,#TK_COMMA 
      009085 01 50            [ 1] 2963 	jreq 1$ 
      009087 A1 00            [ 1] 2964 	cp a,#TK_NONE 
      009087 5B 08            [ 1] 2965 	jreq 5$ 
      009089 81 08            [ 1] 2966 4$:	cp a,#TK_RPAREN 
      00908A 27 05            [ 1] 2967 	jreq 5$
      0010F6                       2968 	_unget_token 
      00908A 52 04 90 CF 00   [ 1]    1      mov in,in.saved  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00908F 0D               [ 1] 2969 5$:	pop a  
      009090 CD               [ 4] 2970 	ret 
                                   2971 
                                   2972 ;--------------------------------
                                   2973 ;   BASIC commnands 
                                   2974 ;--------------------------------
                                   2975 
                                   2976 ;--------------------------------
                                   2977 ;  arithmetic and relational 
                                   2978 ;  routines
                                   2979 ;  operators precedence
                                   2980 ;  highest to lowest
                                   2981 ;  operators on same row have 
                                   2982 ;  same precedence and are executed
                                   2983 ;  from left to right.
                                   2984 ;	'*','/','%'
                                   2985 ;   '-','+'
                                   2986 ;   '=','>','<','>=','<=','<>','><'
                                   2987 ;   '<>' and '><' are equivalent for not equal.
                                   2988 ;--------------------------------
                                   2989 
                                   2990 ;---------------------
                                   2991 ; return array element
                                   2992 ; address from @(expr)
                                   2993 ; input:
                                   2994 ;   A 		TK_ARRAY
                                   2995 ; output:
                                   2996 ;   A 		TK_INTGR
                                   2997 ;	X 		element address 
                                   2998 ;----------------------
      0010FD                       2999 get_array_element:
      009091 90 29 1F         [ 4] 3000 	call func_args 
      009094 03 17            [ 1] 3001 	cp a,#1
      009096 01 CE            [ 1] 3002 	jreq 1$
      009098 00 0D CD         [ 2] 3003 	jp syntax_error
      00909B 90               [ 2] 3004 1$: popw x 
                                   3005 	; check for bounds 
      00909C 33 5B 04         [ 2] 3006 	cpw x,array_size 
      00909F 81 05            [ 2] 3007 	jrule 3$
                                   3008 ; bounds {1..array_size}	
      0090A0 A6 0A            [ 1] 3009 2$: ld a,#ERR_BAD_VALUE 
      0090A0 CD 90 8A         [ 2] 3010 	jp tb_error 
      0090A3 93               [ 2] 3011 3$: tnzw  x
      0090A4 81 F8            [ 1] 3012 	jreq 2$ 
      0090A5 58               [ 2] 3013 	sllw x 
      0090A5 CD               [ 2] 3014 	pushw x 
      0090A6 91 4D A1         [ 2] 3015 	ldw x,#tib
      0090A9 03 27 03         [ 2] 3016 	subw x,(1,sp)
      00111D                       3017 	_drop 2   
      0090AC CC 89            [ 2]    1     addw sp,#2 
      0090AE 7A 84            [ 1] 3018 	ld a,#TK_INTGR
      0090AF 81               [ 4] 3019 	ret 
                                   3020 
                                   3021 
                                   3022 ;***********************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3023 ;   expression parse,execute 
                                   3024 ;***********************************
                                   3025 ;-----------------------------------
                                   3026 ; factor ::= ['+'|'-'|e]  var | @ |
                                   3027 ;			 integer | function |
                                   3028 ;			 '('relation')' 
                                   3029 ; output:
                                   3030 ;   A    token attribute 
                                   3031 ;   X 	 integer
                                   3032 ; ---------------------------------
                           000001  3033 	NEG=1
                           000001  3034 	VSIZE=1
      001122                       3035 factor:
      001122                       3036 	_vars VSIZE 
      0090AF 1E 05            [ 2]    1     sub sp,#VSIZE 
      0090B1 16 03 CD         [ 4] 3037 	call next_token
      0090B4 8F D1            [ 1] 3038 	cp a,#CMD_END  
      0090B6 1F 05            [ 1] 3039 	jrult 16$
      0090B8 17 03            [ 1] 3040 1$:	ld (NEG,sp),a 
      0090BA 85 CD            [ 1] 3041 	and a,#TK_GRP_MASK
      0090BC 90 33            [ 1] 3042 	cp a,#TK_GRP_ADD 
      0090BE 5B 04            [ 1] 3043 	jreq 2$
      0090C0 81 01            [ 1] 3044 	ld a,(NEG,sp)
      0090C1 20 03            [ 2] 3045 	jra 4$  
      001137                       3046 2$:	
      0090C1 52 04 72         [ 4] 3047 	call next_token 
      00113A                       3048 4$:	
      0090C4 5F 00            [ 1] 3049 	cp a,#TK_IFUNC 
      0090C6 0D 1F            [ 1] 3050 	jrne 5$ 
      0090C8 01               [ 4] 3051 	call (x) 
      0090C9 AE A9            [ 2] 3052 	jra 18$ 
      001141                       3053 5$:
      0090CB 8B 1F            [ 1] 3054 	cp a,#TK_INTGR
      0090CD 03 E6            [ 1] 3055 	jrne 6$
      0090CF 02 A4            [ 2] 3056 	jra 18$
      001147                       3057 6$:
      0090D1 0F C7            [ 1] 3058 	cp a,#TK_ARRAY
      0090D3 00 0E            [ 1] 3059 	jrne 10$
      0090D5 1C 00 03         [ 4] 3060 	call get_array_element
      0090D8 72               [ 2] 3061 	ldw x,(x)
      0090D9 BB 00            [ 2] 3062 	jra 18$ 
      001151                       3063 10$:
      0090DB 0D FE            [ 1] 3064 	cp a,#TK_VAR 
      0090DD 13 01            [ 1] 3065 	jrne 12$
      0090DF 27               [ 2] 3066 	ldw x,(x)
      0090E0 0A 1E            [ 2] 3067 	jra 18$
      001158                       3068 12$:			
      0090E2 03 FE            [ 1] 3069 	cp a,#TK_LPAREN
      0090E4 1D 00            [ 1] 3070 	jrne 16$
      0090E6 02 26 E3         [ 4] 3071 	call relation
      0090E9 20               [ 2] 3072 	pushw x 
      0090EA 05 1E            [ 1] 3073 	ld a,#TK_RPAREN 
      0090EC 03 1C 00         [ 4] 3074 	call expect
      0090EF 02               [ 2] 3075 	popw x 
      0090F0 5B 04            [ 2] 3076 	jra 18$	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      001168                       3077 16$:
      0090F2 81               [ 1] 3078 	tnz a 
      0090F3 27 11            [ 1] 3079 	jreq 20$ 
      00116B                       3080 	_unget_token
      0090F3 52 05 17 04 01   [ 1]    1      mov in,in.saved  
      0090F7 4F               [ 1] 3081 	clr a 
      0090F7 1F 02            [ 2] 3082 	jra 20$ 
      001173                       3083 18$: 
      0090F9 F6 A4            [ 1] 3084 	ld a,#TK_MINUS 
      0090FB 0F 6B            [ 1] 3085 	cp a,(NEG,sp)
      0090FD 01 16            [ 1] 3086 	jrne 19$
      0090FF 04               [ 2] 3087 	negw x
      00117A                       3088 19$:
      009100 5C 84            [ 1] 3089 	ld a,#TK_INTGR
      009101                       3090 20$:
      00117C                       3091 	_drop VSIZE
      009101 90 F6            [ 2]    1     addw sp,#VSIZE 
      009103 27               [ 4] 3092 	ret
                                   3093 
                                   3094 ;-----------------------------------
                                   3095 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3096 ; output:
                                   3097 ;   A    	token attribute 
                                   3098 ;	X		integer
                                   3099 ;-----------------------------------
                           000001  3100 	N1=1   ; int16_t
                           000003  3101 	MULOP=3
                           000003  3102 	VSIZE=3
      00117F                       3103 term:
      00117F                       3104 	_vars VSIZE
      009104 1B 0D            [ 2]    1     sub sp,#VSIZE 
      009106 01 27 0A         [ 4] 3105 	call factor
      009109 F1               [ 1] 3106 	tnz a 
      00910A 26 07            [ 1] 3107 	jreq term_exit 
      001187                       3108 term01:	 ; check for  operator 
      00910C 90 5C            [ 2] 3109 	ldw (N1,sp),x  ; save first factor 
      00910E 5C 0A 01         [ 4] 3110 	call next_token
      009111 20 EE            [ 1] 3111 	ld (MULOP,sp),a
      009113 A1 02            [ 1] 3112 	cp a,#CMD_END
      009113 1E 02            [ 1] 3113 	jrult 8$
      009115 1D 00            [ 1] 3114 	and a,#TK_GRP_MASK
      009117 02 4B            [ 1] 3115 	cp a,#TK_GRP_MULT
      009119 00 FE            [ 1] 3116 	jreq 1$
      00911B 84 27            [ 2] 3117 	jra 8$
      00119A                       3118 1$:	; got *|/|%
      00911D 1F 20 D7         [ 4] 3119 	call factor
      009120 A1 84            [ 1] 3120 	cp a,#TK_INTGR
      009120 1E 02            [ 1] 3121 	jreq 2$
      009122 F6 6B 01         [ 2] 3122 	jp syntax_error
      009125 A4 0F            [ 1] 3123 2$:	ldw y,x 
      009127 4C C7            [ 2] 3124 	ldw x,(N1,sp)
      009129 00 0E            [ 1] 3125 	ld a,(MULOP,sp) 
      00912B 72 5F            [ 1] 3126 	cp a,#TK_MULT 
      00912D 00 0D            [ 1] 3127 	jrne 3$
      00912F 72 BB 00         [ 4] 3128 	call multiply 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009132 0D FE            [ 2] 3129 	jra term01
      009134 7B 01            [ 1] 3130 3$: cp a,#TK_DIV 
      009136 4E A4            [ 1] 3131 	jrne 4$ 
      009138 0C 44 44         [ 4] 3132 	call divide 
      00913B AB 80            [ 2] 3133 	jra term01 
      00913D CD 10 20         [ 4] 3134 4$: call modulo
      00913D 5B 05            [ 2] 3135 	jra term01 
      00913F 81 03            [ 1] 3136 8$: ld a,(MULOP,sp)
      009140 27 05            [ 1] 3137 	jreq 9$ 
      0011C5                       3138 	_unget_token
      009140 88 CD 8A 6C 11   [ 1]    1      mov in,in.saved  
      009145 01 27            [ 2] 3139 9$: ldw x,(N1,sp)
      009147 03 CC            [ 1] 3140 	ld a,#TK_INTGR 	
      0011CE                       3141 term_exit:
      0011CE                       3142 	_drop VSIZE 
      009149 89 7A            [ 2]    1     addw sp,#VSIZE 
      00914B 84               [ 4] 3143 	ret 
                                   3144 
                                   3145 ;-------------------------------
                                   3146 ;  expr ::= term [['+'|'-'] term]*
                                   3147 ;  result range {-32768..32767}
                                   3148 ;  output:
                                   3149 ;   A    token attribute 
                                   3150 ;   X	 integer   
                                   3151 ;-------------------------------
                           000001  3152 	N1=1 
                           000003  3153 	OP=3 
                           000003  3154 	VSIZE=3 
      0011D1                       3155 expression:
      0011D1                       3156 	_vars VSIZE 
      00914C 81 03            [ 2]    1     sub sp,#VSIZE 
      00914D CD 11 7F         [ 4] 3157 	call term
      00914D A6               [ 1] 3158 	tnz a 
      00914E 07 CD            [ 1] 3159 	jreq expr_exit 
      009150 91 40            [ 2] 3160 1$:	ldw (N1,sp),x 
      009152 CD 09 EC         [ 4] 3161 	call next_token
      009152 4B 00            [ 1] 3162 	ld (OP,sp),a 
      009154 CD 92            [ 1] 3163 	cp a,#CMD_END 
      009156 9D A1            [ 1] 3164 	jrult 8$ 
      009158 00 27            [ 1] 3165 	and a,#TK_GRP_MASK
      00915A 20 A1            [ 1] 3166 	cp a,#TK_GRP_ADD 
      00915C 84 26            [ 1] 3167 	jreq 2$ 
      00915E 13 21            [ 2] 3168 	jra 8$
      00915F                       3169 2$: 
      00915F 84 90 85         [ 4] 3170 	call term
      009162 89 90            [ 1] 3171 	cp a,#TK_INTGR
      009164 89 4C            [ 1] 3172 	jreq 3$
      009166 88 CD 8A         [ 2] 3173 	jp syntax_error
      009169 6C A1 09         [ 2] 3174 3$:	ldw acc16,x 
      00916C 27 E6            [ 2] 3175 	ldw x,(N1,sp)
      00916E A1 00            [ 1] 3176 	ld a,(OP,sp)
      009170 27 09            [ 1] 3177 	cp a,#TK_PLUS 
      009172 A1 08            [ 1] 3178 	jrne 4$
      009174 27 05 55 00      [ 2] 3179 	addw x,acc16
      009178 03 00            [ 2] 3180 	jra 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      00917A 02 84 81 0C      [ 2] 3181 4$:	subw x,acc16
      00917D 20 CC            [ 2] 3182 	jra 1$
      00917D CD 91            [ 1] 3183 8$: ld a,(OP,sp)
      00917F 4D A1            [ 1] 3184 	jreq 9$ 
      001211                       3185 	_unget_token	
      009181 01 27 03 CC 89   [ 1]    1      mov in,in.saved  
      009186 7A 85            [ 2] 3186 9$: ldw x,(N1,sp)
      009188 C3 00            [ 1] 3187 	ld a,#TK_INTGR	
      00121A                       3188 expr_exit:
      00121A                       3189 	_drop VSIZE 
      00918A 22 23            [ 2]    1     addw sp,#VSIZE 
      00918C 05               [ 4] 3190 	ret 
                                   3191 
                                   3192 ;---------------------------------------------
                                   3193 ; rel ::= expr rel_op expr
                                   3194 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3195 ;  relation return  integer , zero is false 
                                   3196 ;  output:
                                   3197 ;    A 		token attribute  
                                   3198 ;	 X		integer 
                                   3199 ;---------------------------------------------
                           000001  3200 	N1=1
                           000003  3201 	RELOP=3
                           000003  3202 	VSIZE=3 
      00121D                       3203 relation: 
      00121D                       3204 	_vars VSIZE
      00918D A6 0A            [ 2]    1     sub sp,#VSIZE 
      00918F CC 89 7C         [ 4] 3205 	call expression
      009192 5D               [ 1] 3206 	tnz a 
      009193 27 F8            [ 1] 3207 	jreq rel_exit
      009195 58 89            [ 2] 3208 	ldw (N1,sp),x 
                                   3209 ; expect rel_op or leave 
      009197 AE 16 90         [ 4] 3210 	call next_token 
      00919A 72 F0            [ 1] 3211 	ld (RELOP,sp),a 
      00919C 01 5B            [ 1] 3212 	and a,#TK_GRP_MASK
      00919E 02 A6            [ 1] 3213 	cp a,#TK_GRP_RELOP 
      0091A0 84 81            [ 1] 3214 	jrne 8$
      0091A2                       3215 2$:	; expect another expression
      0091A2 52 01 CD         [ 4] 3216 	call expression
      0091A5 8A 6C            [ 1] 3217 	cp a,#TK_INTGR
      0091A7 A1 02            [ 1] 3218 	jreq 3$
      0091A9 25 3D 6B         [ 2] 3219 	jp syntax_error 
      0091AC 01 A4 30         [ 2] 3220 3$:	ldw acc16,x 
      0091AF A1 10            [ 2] 3221 	ldw x,(N1,sp) 
      0091B1 27 04 7B 01      [ 2] 3222 	subw x,acc16
      0091B5 20 03            [ 1] 3223 	jrne 4$
      0091B7 35 02 00 0D      [ 1] 3224 	mov acc8,#2 ; n1==n2
      0091B7 CD 8A            [ 2] 3225 	jra 6$ 
      00124D                       3226 4$: 
      0091B9 6C 06            [ 1] 3227 	jrsgt 5$  
      0091BA 35 04 00 0D      [ 1] 3228 	mov acc8,#4 ; n1<2 
      0091BA A1 81            [ 2] 3229 	jra 6$
      001255                       3230 5$:
      0091BC 26 03 FD 20      [ 1] 3231 	mov acc8,#1 ; n1>n2 
      001259                       3232 6$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0091C0 32               [ 1] 3233 	clrw x 
      0091C1 C6 00 0D         [ 1] 3234 	ld a, acc8  
      0091C1 A1 84            [ 1] 3235 	and a,(RELOP,sp)
      0091C3 26               [ 1] 3236 	tnz a 
      0091C4 02 20            [ 1] 3237 	jreq 10$
      0091C6 2C               [ 1] 3238 	incw x 
      0091C7 20 0B            [ 2] 3239 	jra 10$  	
      0091C7 A1 06            [ 1] 3240 8$: ld a,(RELOP,sp)
      0091C9 26 06            [ 1] 3241 	jreq 9$
      001269                       3242 	_unget_token
      0091CB CD 91 7D FE 20   [ 1]    1      mov in,in.saved  
      00126E                       3243 9$: 
      0091D0 22 01            [ 2] 3244 	ldw x,(N1,sp)
      0091D1                       3245 10$:
      0091D1 A1 85            [ 1] 3246 	ld a,#TK_INTGR
      001272                       3247 rel_exit:
      001272                       3248 	_drop VSIZE
      0091D3 26 03            [ 2]    1     addw sp,#VSIZE 
      0091D5 FE               [ 4] 3249 	ret 
                                   3250 
                                   3251 ;--------------------------------
                                   3252 ; BASIC: SHOW 
                                   3253 ; print stack content in hexadecimal bytes 
                                   3254 ; 16 bytes per row 
                                   3255 ;--------------------------------
      001275                       3256 show:
      0091D6 20 1B 8F         [ 2] 3257 	ldw x,#cstk_prompt
      0091D8 CD 00 00         [ 4] 3258 	call puts 
      0091D8 A1               [ 1] 3259 	ldw x,sp 
      0091D9 07 26 0C         [ 2] 3260 	addw x,#3 ; ignore return address
      0091DC CD 92 9D 89      [ 2] 3261 	ldw y,#RAM_SIZE  
      0091E0 A6 08 CD         [ 2] 3262 	ldw acc16,x 
      0091E3 91 40 85 20      [ 2] 3263 	subw y,acc16
      0091E7 0B 03 CD         [ 4] 3264 	call hex_dump
      0091E8 4F               [ 1] 3265 	clr a 
      0091E8 4D               [ 4] 3266 	ret
                                   3267 
      0091E9 27 11 55 00 03 00 02  3268 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             4F 20 09 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3269 
                                   3270 
                                   3271 ;--------------------------------------------
                                   3272 ; BASIC: HEX 
                                   3273 ; select hexadecimal base for integer print
                                   3274 ;---------------------------------------------
      0091F3                       3275 hex_base:
      0091F3 A6 11 11 01      [ 1] 3276 	mov base,#16 
      0091F7 26               [ 4] 3277 	ret 
                                   3278 
                                   3279 ;--------------------------------------------
                                   3280 ; BASIC: DEC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3281 ; select decimal base for integer print
                                   3282 ;---------------------------------------------
      0012BB                       3283 dec_base:
      0091F8 01 50 00 0A      [ 1] 3284 	mov base,#10
      0091FA 81               [ 4] 3285 	ret 
                                   3286 
                                   3287 ;------------------------
                                   3288 ; BASIC: SIZE 
                                   3289 ; return free size in text area
                                   3290 ; output:
                                   3291 ;   A 		TK_INTGR
                                   3292 ;   X 	    size integer
                                   3293 ;--------------------------
      0012C0                       3294 size:
      0091FA A6 84 90         [ 2] 3295 	ldw x,#tib 
      0091FC 72 B0 00 1E      [ 2] 3296 	subw x,txtend 
      0091FC 5B 01            [ 1] 3297 	ld a,#TK_INTGR
      0091FE 81               [ 4] 3298 	ret 
                                   3299 
                                   3300 
                                   3301 ;------------------------
                                   3302 ; BASIC: UBOUND  
                                   3303 ; return array variable size 
                                   3304 ; output:
                                   3305 ;   A 		TK_INTGR
                                   3306 ;   X 	    array size 
                                   3307 ;--------------------------
      0091FF                       3308 ubound:
      0091FF 52 03 CD         [ 2] 3309 	ldw x,#tib
      009202 91 A2 4D 27      [ 2] 3310 	subw x,txtend 
      009206 47 CE 00 04      [ 2] 3311 	ldw y,basicptr 
      009207 90 C3 00 1E      [ 2] 3312 	cpw y,txtend 
      009207 1F 01            [ 1] 3313 	jrult 1$
      009209 CD 8A 6C         [ 1] 3314 	push count 
      00920C 6B 03            [ 1] 3315 	push #0 
      00920E A1 02 25         [ 2] 3316 	subw x,(1,sp)
      0012E3                       3317 	_drop 2 
      009211 2F A4            [ 2]    1     addw sp,#2 
      009213 30               [ 2] 3318 1$:	srlw x 
      009214 A1 20 27         [ 2] 3319 	ldw array_size,x
      009217 02 20            [ 1] 3320 	ld a,#TK_INTGR
      009219 27               [ 4] 3321 	ret 
                                   3322 
                                   3323 ;-----------------------------
                                   3324 ; BASIC: LET var=expr 
                                   3325 ; variable assignement 
                                   3326 ; output:
                                   3327 ;   A 		TK_NONE 
                                   3328 ;-----------------------------
      00921A                       3329 let:
      00921A CD 91 A2         [ 4] 3330 	call next_token 
      00921D A1 84            [ 1] 3331 	cp a,#TK_VAR 
      00921F 27 03            [ 1] 3332 	jreq let_var
      009221 CC 89            [ 1] 3333 	cp a,#TK_ARRAY 
      009223 7A 90            [ 1] 3334 	jreq  let_array
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      009225 93 1E 01         [ 2] 3335 	jp syntax_error
      0012FA                       3336 let_array:
      009228 7B 03 A1         [ 4] 3337 	call get_array_element
      0012FD                       3338 let_var:
      00922B 20               [ 2] 3339 	pushw x  
      00922C 26 05 CD         [ 4] 3340 	call next_token 
      00922F 8F D1            [ 1] 3341 	cp a,#TK_EQUAL
      009231 20 D4            [ 1] 3342 	jreq 1$
      009233 A1 21 26         [ 2] 3343 	jp syntax_error
      001308                       3344 1$:	
      009236 05 CD 90         [ 4] 3345 	call relation   
      009239 8A 20            [ 1] 3346 	cp a,#TK_INTGR 
      00923B CB CD            [ 1] 3347 	jreq 2$
      00923D 90 A0 20         [ 2] 3348 	jp syntax_error
      001312                       3349 2$:	
      009240 C6 7B            [ 1] 3350 	ldw y,x 
      009242 03               [ 2] 3351 	popw x   
      009243 27               [ 2] 3352 	ldw (x),y   
      009244 05               [ 4] 3353 	ret 
                                   3354 
                                   3355 ;----------------------------
                                   3356 ; BASIC: LIST [[start][,end]]
                                   3357 ; list program lines 
                                   3358 ; form start to end 
                                   3359 ; if empty argument list then 
                                   3360 ; list all.
                                   3361 ;----------------------------
                           000001  3362 	FIRST=1
                           000003  3363 	LAST=3 
                           000005  3364 	LN_PTR=5
                           000006  3365 	VSIZE=6 
      001317                       3366 list:
      009245 55 00 03         [ 2] 3367 	ldw x,txtbgn 
      009248 00 02 1E         [ 2] 3368 	cpw x,txtend 
      00924B 01 A6            [ 1] 3369 	jrmi 1$
      00924D 84               [ 4] 3370 	ret 
      00924E                       3371 1$:	
      001320                       3372 	_vars VSIZE
      00924E 5B 03            [ 2]    1     sub sp,#VSIZE 
      009250 81 05            [ 2] 3373 	ldw (LN_PTR,sp),x 
      009251 FE               [ 2] 3374 	ldw x,(x) 
      009251 52 03            [ 2] 3375 	ldw (FIRST,sp),x ; list from first line 
      009253 CD 91 FF         [ 2] 3376 	ldw x,#MAX_LINENO ; biggest line number 
      009256 4D 27            [ 2] 3377 	ldw (LAST,sp),x 
      009258 41 1F 01         [ 4] 3378 	call arg_list
      00925B CD               [ 1] 3379 	tnz a
      00925C 8A 6C            [ 1] 3380 	jreq list_loop 
      00925E 6B 03            [ 1] 3381 	cp a,#2 
      009260 A1 02            [ 1] 3382 	jreq 4$
      009262 25 29            [ 1] 3383 	cp a,#1 
      009264 A4 30            [ 1] 3384 	jreq first_line 
      009266 A1 10 27         [ 2] 3385 	jp syntax_error 
      009269 02               [ 2] 3386 4$:	popw x 
      00926A 20 21            [ 2] 3387 	ldw (LAST+2,sp),x 
      00926C                       3388 first_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00926C CD               [ 2] 3389 	popw x
      00926D 91 FF            [ 2] 3390 	ldw (FIRST,sp),x 
      001343                       3391 lines_skip:
      00926F A1 84 27         [ 2] 3392 	ldw x,txtbgn
      009272 03 CC            [ 2] 3393 2$:	ldw (LN_PTR,sp),x 
      009274 89 7A CF         [ 2] 3394 	cpw x,txtend 
      009277 00 0D            [ 1] 3395 	jrpl list_exit 
      009279 1E               [ 2] 3396 	ldw x,(x) ;line# 
      00927A 01 7B            [ 2] 3397 	cpw x,(FIRST,sp)
      00927C 03 A1            [ 1] 3398 	jrpl list_loop 
      00927E 10 26            [ 2] 3399 	ldw x,(LN_PTR,sp) 
      009280 06 72            [ 1] 3400 	ld a,(2,x)
      009282 BB 00 0D         [ 1] 3401 	ld acc8,a 
      009285 20 D2 72 B0      [ 1] 3402 	clr acc16 
      009289 00 0D 20 CC      [ 2] 3403 	addw x,acc16
      00928D 7B 03            [ 2] 3404 	jra 2$ 
                                   3405 ; print loop
      001363                       3406 list_loop:
      00928F 27 05            [ 2] 3407 	ldw x,(LN_PTR,sp)
      009291 55 00            [ 1] 3408 	ld a,(2,x) 
      009293 03 00 02         [ 4] 3409 	call prt_basic_line
      009296 1E 01            [ 2] 3410 	ldw x,(LN_PTR,sp)
      009298 A6 84            [ 1] 3411 	ld a,(2,x)
      00929A C7 00 0D         [ 1] 3412 	ld acc8,a 
      00929A 5B 03 81 0C      [ 1] 3413 	clr acc16 
      00929D 72 BB 00 0C      [ 2] 3414 	addw x,acc16
      00929D 52 03 CD         [ 2] 3415 	cpw x,txtend 
      0092A0 92 51            [ 1] 3416 	jrpl list_exit
      0092A2 4D 27            [ 2] 3417 	ldw (LN_PTR,sp),x
      0092A4 4D               [ 2] 3418 	ldw x,(x)
      0092A5 1F 01            [ 2] 3419 	cpw x,(LAST,sp)  
      0092A7 CD 8A            [ 1] 3420 	jrslt list_loop
      001385                       3421 list_exit:
      0092A9 6C 6B 03 A4 30   [ 1] 3422 	mov in,count 
      0092AE A1 30 26         [ 2] 3423 	ldw x,#pad 
      0092B1 33 00 04         [ 2] 3424 	ldw basicptr,x 
      0092B2                       3425 	_drop VSIZE 
      0092B2 CD 92            [ 2]    1     addw sp,#VSIZE 
      0092B4 51               [ 4] 3426 	ret
                                   3427 
                                   3428 ;-------------------------
                                   3429 ; copy command name to buffer  
                                   3430 ; input:
                                   3431 ;   X 	name address 
                                   3432 ;   Y   destination buffer 
                                   3433 ; output:
                                   3434 ;   Y   point after name  
                                   3435 ;--------------------------
      001393                       3436 cpy_cmd_name:
      0092B5 A1               [ 1] 3437 	ld a,(x)
      0092B6 84               [ 1] 3438 	incw x
      0092B7 27 03            [ 1] 3439 	and a,#15  
      0092B9 CC               [ 1] 3440 	push a 
      0092BA 89 7A            [ 1] 3441     tnz (1,sp) 
      0092BC CF 00            [ 1] 3442 	jreq 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0092BE 0D               [ 1] 3443 1$:	ld a,(x)
      0092BF 1E 01            [ 1] 3444 	ld (y),a  
      0092C1 72               [ 1] 3445 	incw x
      0092C2 B0 00            [ 1] 3446 	incw y 
      0092C4 0D 26            [ 1] 3447 	dec (1,sp)	 
      0092C6 06 35            [ 1] 3448 	jrne 1$
      0092C8 02               [ 1] 3449 9$: pop a 
      0092C9 00               [ 4] 3450 	ret	
                                   3451 
                                   3452 ;--------------------------
                                   3453 ; add a space after letter or 
                                   3454 ; digit.
                                   3455 ; input:
                                   3456 ;   Y     pointer to buffer 
                                   3457 ; output:
                                   3458 ;   Y    moved to end 
                                   3459 ;--------------------------
      0013A8                       3460 add_space:
      0092CA 0E 20            [ 2] 3461 	decw y 
      0092CC 0C F6            [ 1] 3462 	ld a,(y)
      0092CD 90 5C            [ 1] 3463 	incw y
      0092CD 2C 06 35         [ 4] 3464 	call is_alnum 
      0092D0 04 00            [ 1] 3465 	jrnc 1$
      0092D2 0E 20            [ 1] 3466 	ld a,#SPACE 
      0092D4 04 F7            [ 1] 3467 	ld (y),a 
      0092D5 90 5C            [ 1] 3468 	incw y 
      0092D5 35               [ 4] 3469 1$: ret 
                                   3470 
                                   3471 ;--------------------------
                                   3472 ;  align text in buffer 
                                   3473 ;  to tab_width padding 
                                   3474 ;  left with  SPACE 
                                   3475 ; input:
                                   3476 ;   X      str*
                                   3477 ;   A      str_length 
                                   3478 ; output:
                                   3479 ;   X      ajusted
                                   3480 ;--------------------------
      0013BA                       3481 right_align:
      0092D6 01               [ 1] 3482 	push a 
      0092D7 00 0E            [ 1] 3483 0$: ld a,(1,sp)
      0092D9 C1 00 24         [ 1] 3484 	cp a,tab_width 
      0092D9 5F C6            [ 1] 3485 	jrpl 1$
      0092DB 00 0E            [ 1] 3486 	ld a,#SPACE 
      0092DD 14               [ 2] 3487 	decw x
      0092DE 03               [ 1] 3488 	ld (x),a  
      0092DF 4D 27            [ 1] 3489 	inc (1,sp)
      0092E1 0E 5C            [ 2] 3490 	jra 0$ 
      0092E3 20               [ 1] 3491 1$: pop a 	
      0092E4 0B               [ 4] 3492 	ret 
                                   3493 
                                   3494 ;--------------------------
                                   3495 ; print TK_QSTR
                                   3496 ; converting control character
                                   3497 ; to backslash sequence
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3498 ; input:
                                   3499 ;   X        char *
                                   3500 ;   Y        dest. buffer 
                                   3501 ; output:
                                   3502 ;   X        moved forward 
                                   3503 ;   Y        moved forward 
                                   3504 ;-----------------------------
      0013CC                       3505 cpy_quote:
      0092E5 7B 03            [ 1] 3506 	ld a,#'"
      0092E7 27 05            [ 1] 3507 	ld (y),a 
      0092E9 55 00            [ 1] 3508 	incw y 
      0092EB 03               [ 1] 3509 1$:	ld a,(x)
      0092EC 00 02            [ 1] 3510 	jreq 9$
      0092EE 5C               [ 1] 3511 	incw x 
      0092EE 1E 01            [ 1] 3512 	cp a,#SPACE 
      0092F0 25 0E            [ 1] 3513 	jrult 3$
      0092F0 A6 84            [ 1] 3514 	ld (y),a
      0092F2 90 5C            [ 1] 3515 	incw y 
      0092F2 5B 03            [ 1] 3516 	cp a,#'\ 
      0092F4 81 F0            [ 1] 3517 	jrne 1$ 
      0092F5                       3518 2$:
      0092F5 AE 93            [ 1] 3519 	ld (y),a
      0092F7 0F CD            [ 1] 3520 	incw y  
      0092F9 AA C0            [ 2] 3521 	jra 1$
      0092FB 96               [ 1] 3522 3$: push a 
      0092FC 1C 00            [ 1] 3523 	ld a,#'\
      0092FE 03 90            [ 1] 3524 	ld (y),a 
      009300 AE 18            [ 1] 3525 	incw y  
      009302 00               [ 1] 3526 	pop a 
      009303 CF 00            [ 1] 3527 	sub a,#7
      009305 0D 72 B2         [ 1] 3528 	ld acc8,a 
      009308 00 0D CD 84      [ 1] 3529 	clr acc16
      00930C 4D               [ 2] 3530 	pushw x
      00930D 4F 81 0A         [ 2] 3531 	ldw x,#escaped 
      009310 63 6F 6E 74      [ 2] 3532 	addw x,acc16 
      009314 65               [ 1] 3533 	ld a,(x)
      009315 6E               [ 2] 3534 	popw x
      009316 74 20            [ 2] 3535 	jra 2$
      009318 6F 66            [ 1] 3536 9$: ld a,#'"
      00931A 20 73            [ 1] 3537 	ld (y),a 
      00931C 74 61            [ 1] 3538 	incw y  
      00931E 63               [ 1] 3539 	incw x 
      00931F 6B               [ 4] 3540 	ret
                                   3541 
                                   3542 ;--------------------------
                                   3543 ; return variable name 
                                   3544 ; from its address.
                                   3545 ; input:
                                   3546 ;   X    variable address
                                   3547 ; output:
                                   3548 ;   A     variable letter
                                   3549 ;--------------------------
      00140D                       3550 var_name:
      009320 20 66 72         [ 2] 3551 		subw x,#vars 
      009323 6F               [ 1] 3552 		ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009324 6D               [ 1] 3553 		srl a 
      009325 20 74            [ 1] 3554 		add a,#'A 
      009327 6F               [ 4] 3555 		ret 
                                   3556 
                                   3557 ;-----------------------------
                                   3558 ; return cmd  idx from its 
                                   3559 ; code address 
                                   3560 ; input:
                                   3561 ;   X      code address 
                                   3562 ; output:
                                   3563 ;   X      cmd_idx
                                   3564 ;-----------------------------
      001415                       3565 get_cmd_idx:
      009328 70 20            [ 2] 3566 	pushw y
      00932A 74 6F 20 62      [ 2] 3567 	ldw y,#code_addr 
      00932E 6F 74 74 6F      [ 2] 3568 	ldw ptr16,y 
      009332 6D 3A            [ 1] 3569 	clrw y 
      009334 0A 00 17         [ 5] 3570 1$:	cpw x,([ptr16],y)
      009336 27 0C            [ 1] 3571 	jreq 3$ 
      009336 35 10            [ 1] 3572 	incw y 
      009338 00 0B 81         [ 4] 3573 	ld a,([ptr16],y)
      00933B 90 5C            [ 1] 3574 	incw y
      00933B 35 0A 00         [ 4] 3575 	or a,([ptr16],y)	
      00933E 0B 81            [ 1] 3576 	jrne 1$
      009340 93               [ 1] 3577 3$: ldw x,y 
      009340 AE 16            [ 2] 3578 	popw y 
      009342 90               [ 4] 3579 	ret
                                   3580 
                                   3581 ;-------------------------------------
                                   3582 ; decompile tokens list 
                                   3583 ; to original text line 
                                   3584 ; input:
                                   3585 ;   [basicptr]  pointer at line 
                                   3586 ;   Y           destination buffer
                                   3587 ; output:
                                   3588 ;   A           length 
                                   3589 ;   Y           after string  
                                   3590 ;------------------------------------
                           000001  3591 	BASE_SAV=1
                           000002  3592 	WIDTH_SAV=2
                           000003  3593 	STR=3
                           000004  3594 	VSIZE=4 
      001436                       3595 decompile::
      001436                       3596 	_vars VSIZE
      009343 72 B0            [ 2]    1     sub sp,#VSIZE 
      009345 00 1F A6         [ 1] 3597 	ld a,base
      009348 84 81            [ 1] 3598 	ld (BASE_SAV,sp),a  
      00934A C6 00 24         [ 1] 3599 	ld a,tab_width 
      00934A AE 16            [ 1] 3600 	ld (WIDTH_SAV,sp),a 
      00934C 90 72            [ 2] 3601 	ldw (STR,sp),y   
      00934E B0 00 1F 90      [ 5] 3602 	ldw x,[basicptr] ; line number 
      009352 CE 00 05 90      [ 1] 3603 	mov base,#10
      009356 C3 00 1F 25      [ 1] 3604 	mov tab_width,#5
      00935A 0A 3B 00 04      [ 1] 3605 	clr acc24 
      00935E 4B 00 72         [ 2] 3606 	ldw acc16,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009361 F0 01 5B         [ 4] 3607 	call itoa  
      009364 02 54 CF         [ 4] 3608 	call right_align 
      009367 00               [ 1] 3609 	push a 
      009368 22 A6            [ 1] 3610 1$:	ldw y,x ; source
      00936A 84 81            [ 2] 3611 	ldw x,(STR+1,sp) ; destination
      00936C CD 04 26         [ 4] 3612 	call strcpy 
      00936C CD 8A            [ 1] 3613 	clrw y 
      00936E 6C               [ 1] 3614 	pop a 
      00936F A1 85            [ 1] 3615 	ld yl,a 
      009371 27 0A A1         [ 2] 3616 	addw y,(STR,sp)
      009374 06 27            [ 1] 3617 	ld a,#SPACE 
      009376 03 CC            [ 1] 3618 	ld (y),a 
      009378 89 7A            [ 1] 3619 	incw y 
      00937A 72 5F 00 24      [ 1] 3620 	clr tab_width
      00937A CD 91 7D         [ 2] 3621 	ldw x,#3
      00937D CF 00 00         [ 2] 3622 	ldw in.w,x 
      00147D                       3623 decomp_loop:
      00937D 89 CD            [ 2] 3624 	pushw y
      00937F 8A 6C A1         [ 4] 3625 	call next_token 
      009382 32 27            [ 2] 3626 	popw y 
      009384 03               [ 1] 3627 	tnz a  
      009385 CC 89            [ 1] 3628 	jrne 1$
      009387 7A 15 63         [ 2] 3629 	jp 20$
      009388 2A 6F            [ 1] 3630 1$:	jrpl 6$
                                   3631 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      009388 CD 92            [ 1] 3632 	cp a,#TK_VAR 
      00938A 9D A1            [ 1] 3633 	jrne 3$
                                   3634 ;; TK_VAR 
      00938C 84 27 03         [ 4] 3635 	call add_space  
      00938F CC 89 7A         [ 4] 3636 	call var_name
      009392 90 F7            [ 1] 3637 	ld (y),a 
      009392 90 93            [ 1] 3638 	incw y  
      009394 85 FF            [ 2] 3639 	jra decomp_loop
      00149C                       3640 3$:
      009396 81 84            [ 1] 3641 	cp a,#TK_INTGR
      009397 26 22            [ 1] 3642 	jrne 4$
                                   3643 ;; TK_INTGR
      009397 CE 00 1D         [ 4] 3644 	call add_space
      00939A C3 00 1F 2B      [ 1] 3645 	clr acc24 
      00939E 01 81 0C         [ 2] 3646 	ldw acc16,x 
      0093A0 90 89            [ 2] 3647 	pushw y 
      0093A0 52 06 1F         [ 4] 3648 	call itoa  
      0093A3 05 FE            [ 2] 3649 	ldw y,(1,sp) 
      0093A5 1F               [ 1] 3650 	push a 
      0093A6 01               [ 1] 3651 	exgw x,y 
      0093A7 AE 7F FF         [ 4] 3652 	call strcpy 
      0093AA 1F 03            [ 1] 3653 	clrw y
      0093AC CD               [ 1] 3654 	pop a  
      0093AD 91 52            [ 1] 3655 	ld yl,a 
      0093AF 4D 27 31         [ 2] 3656 	addw y,(1,sp)
      0014BE                       3657 	_drop 2 
      0093B2 A1 02            [ 2]    1     addw sp,#2 
      0093B4 27 07            [ 2] 3658 	jra decomp_loop
                                   3659 ;; dictionary keyword 
      0014C2                       3660 4$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0093B6 A1 01 27         [ 4] 3661 	call get_cmd_idx 
      0093B9 06 CC 89         [ 2] 3662 	cpw x,#REM_IDX
      0093BC 7A 85            [ 1] 3663 	jrne 5$
      0093BE 1F 05 04         [ 2] 3664 	ldw x,basicptr 
                                   3665 ; copy comment to buffer 
      0093C0 CD 13 A8         [ 4] 3666 	call add_space
      0093C0 85 1F            [ 1] 3667 	ld a,#''
      0093C2 01 F7            [ 1] 3668 	ld (y),a 
      0093C3 90 5C            [ 1] 3669 	incw y 
      0014D6                       3670 41$:
      0093C3 CE 00 1D 1F      [ 4] 3671 	ld a,([in.w],x)
      0093C7 05 C3 00 1F      [ 1] 3672 	inc in  
      0093CB 2A 38            [ 1] 3673 	ld (y),a 
      0093CD FE 13            [ 1] 3674 	incw y 
      0093CF 01 2A 11         [ 1] 3675 	ld a,in 
      0093D2 1E 05 E6         [ 1] 3676 	cp a,count 
      0093D5 02 C7            [ 1] 3677 	jrmi 41$
      0093D7 00 0E            [ 2] 3678 	jra 20$  
                                   3679 ; insert command name 
      0014EC                       3680 5$:
      0093D9 72 5F 00         [ 4] 3681 	call add_space  
      0093DC 0D 72            [ 2] 3682 	pushw y
      0093DE BB 00 0D         [ 4] 3683 	call cmd_name
      0093E1 20 E3            [ 2] 3684 	popw y 
      0093E3 CD 13 93         [ 4] 3685 	call cpy_cmd_name
      0093E3 1E 05            [ 2] 3686 	jra decomp_loop 
      0014FB                       3687 6$:
      0093E5 E6 02            [ 1] 3688 	cp a,#TK_QSTR 
      0093E7 CD 96            [ 1] 3689 	jrne 7$
                                   3690 ;; TK_QSTR
      0093E9 1E 1E 05         [ 4] 3691 	call cpy_quote  
      0093EC E6 02 C7         [ 2] 3692 	jp decomp_loop
      001505                       3693 7$:
      0093EF 00 0E            [ 1] 3694 	cp a,#TK_CHAR 
      0093F1 72 5F            [ 1] 3695 	jrne 8$
                                   3696 ;; TK_CHAR 
      0093F3 00 0D            [ 1] 3697 	ld a,#'\ 
      0093F5 72 BB            [ 1] 3698 	ld (y),a 
      0093F7 00 0D            [ 1] 3699 	incw y 
      0093F9 C3               [ 1] 3700 	ld a,xl 
      0093FA 00 1F            [ 1] 3701 	ld (y),a 
      0093FC 2A 07            [ 1] 3702 	incw y 
      0093FE 1F 05 FE         [ 2] 3703 	jp decomp_loop
      009401 13 03            [ 1] 3704 8$: cp a,#TK_COLON 
      009403 2F DE            [ 1] 3705 	jrne 9$
      009405 A6 3A            [ 1] 3706 	ld a,#':
      00151D                       3707 81$:
      009405 55 00            [ 1] 3708 	ld (y),a 
      009407 04 00            [ 1] 3709 	incw y 
      001521                       3710 82$:
      009409 02 AE 16         [ 2] 3711 	jp decomp_loop
      001524                       3712 9$: 
      00940C E0 CF            [ 1] 3713 	cp a,#TK_SHARP
      00940E 00 05            [ 1] 3714 	jrugt 10$ 
      009410 5B 06            [ 1] 3715 	sub a,#TK_ARRAY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009412 81               [ 1] 3716 	clrw x 
      009413 97               [ 1] 3717 	ld xl,a
      009413 F6 5C A4         [ 2] 3718 	addw x,#single_char 
      009416 0F               [ 1] 3719 	ld a,(x)
      009417 88 0D            [ 2] 3720 	jra 81$ 
      001532                       3721 10$: 
      009419 01 27            [ 1] 3722 	cp a,#TK_MINUS 
      00941B 0A F6            [ 1] 3723 	jrugt 11$
      00941D 90 F7            [ 1] 3724 	sub a,#TK_PLUS 
      00941F 5C               [ 1] 3725 	clrw x 
      009420 90               [ 1] 3726 	ld xl,a 
      009421 5C 0A 01         [ 2] 3727 	addw x,#add_char 
      009424 26               [ 1] 3728 	ld a,(x)
      009425 F6 84            [ 2] 3729 	jra 81$
      001540                       3730 11$:
      009427 81 22            [ 1] 3731     cp a,#TK_MOD 
      009428 22 0A            [ 1] 3732 	jrugt 12$
      009428 90 5A            [ 1] 3733 	sub a,#TK_MULT
      00942A 90               [ 1] 3734 	clrw x 
      00942B F6               [ 1] 3735 	ld xl,a 
      00942C 90 5C CD         [ 2] 3736 	addw x,#mul_char
      00942F 86               [ 1] 3737 	ld a,(x)
      009430 7F 24            [ 2] 3738 	jra 81$
      00154E                       3739 12$:
      009432 06 A6            [ 1] 3740 	sub a,#TK_GT  
      009434 20               [ 1] 3741 	sll a 
      009435 90               [ 1] 3742 	clrw x 
      009436 F7               [ 1] 3743 	ld xl,a 
      009437 90 5C 81         [ 2] 3744 	addw x,#relop_str 
      00943A FE               [ 2] 3745 	ldw x,(x)
      00943A 88               [ 1] 3746 	ld a,(x)
      00943B 7B               [ 1] 3747 	incw x 
      00943C 01 C1            [ 1] 3748 	ld (y),a
      00943E 00 25            [ 1] 3749 	incw y 
      009440 2A               [ 1] 3750 	ld a,(x)
      009441 08 A6            [ 1] 3751 	jrne 81$
      009443 20 5A F7         [ 2] 3752 	jp decomp_loop 
      001563                       3753 20$: 
      009446 0C 01            [ 1] 3754 	clr (y)
      009448 20 F1            [ 2] 3755 	ldw x,(STR,sp)
      00944A 84 81            [ 1] 3756 	ld a,(BASE_SAV,sp)
      00944C C7 00 0A         [ 1] 3757 	ld base,a 
      00944C A6 22            [ 1] 3758 	ld a,(WIDTH_SAV,sp)
      00944E 90 F7 90         [ 1] 3759 	ld tab_width,a
      009451 5C F6 27         [ 2] 3760 	subw y,(STR,sp) 
      009454 30 5C            [ 1] 3761 	ld a,yl 
      001576                       3762 	_drop VSIZE 
      009456 A1 20            [ 2]    1     addw sp,#VSIZE 
      009458 25               [ 4] 3763 	ret 
                                   3764 
      009459 0E 90 F7 90 5C        3765 single_char: .byte '@','(',')',',','#'
      00945E A1 5C                 3766 add_char: .byte '+','-'
      009460 26 F0 25              3767 mul_char: .byte '*','/','%'
      009462 15 8F 15 91 15 93 15  3768 relop_str: .word gt,equal,ge,lt,le,ne 
             96 15 98 15 9B
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009462 90 F7                 3769 gt: .asciz ">"
      009464 90 5C                 3770 equal: .asciz "="
      009466 20 EA 88              3771 ge: .asciz ">="
      009469 A6 5C                 3772 lt: .asciz "<"
      00946B 90 F7 90              3773 le: .asciz "<="
      00946E 5C 84 A0              3774 ne:  .asciz "<>"
                                   3775 
                                   3776 
                                   3777 ;--------------------------
                                   3778 ; decompile line from token list
                                   3779 ; and print it. 
                                   3780 ; input:
                                   3781 ;   A       stop at this position 
                                   3782 ;   X 		pointer at line
                                   3783 ; output:
                                   3784 ;   none 
                                   3785 ;--------------------------	
      00159E                       3786 prt_basic_line:
      009471 07 C7 00         [ 1] 3787 	ld count,a 
      009474 0E 72            [ 1] 3788 	ld a,(2,x)
      009476 5F 00 0D         [ 1] 3789 	cp a,count 
      009479 89 AE            [ 1] 3790 	jrpl 1$ 
      00947B 8C 20 72         [ 1] 3791 	ld count,a 
      00947E BB 00 0D         [ 2] 3792 1$:	ldw basicptr,x 
      009481 F6 85 20 DD      [ 2] 3793 	ldw y,#tib  
      009485 A6 22 90         [ 4] 3794 	call decompile 
      009488 F7 90 5C         [ 4] 3795 	call puts 
      00948B 5C 81            [ 1] 3796 	ld a,#CR 
      00948D CD 03 0A         [ 4] 3797 	call putc 
      00948D 1D               [ 4] 3798 	ret 
                                   3799 
                                   3800 
                                   3801 
                                   3802 ;---------------------------------
                                   3803 ; BASIC: PRINT|? arg_list 
                                   3804 ; print values from argument list
                                   3805 ;----------------------------------
                           000001  3806 	COMMA=1
                           000001  3807 	VSIZE=1
      0015BE                       3808 print:
      0015BE                       3809 	_vars VSIZE 
      00948E 00 31            [ 2]    1     sub sp,#VSIZE 
      0015C0                       3810 reset_comma:
      009490 9F 44            [ 1] 3811 	clr (COMMA,sp)
      0015C2                       3812 prt_loop:
      009492 AB 41 81         [ 4] 3813 	call next_token
      009495 A1 02            [ 1] 3814 	cp a,#CMD_END 
      009495 90 89            [ 1] 3815 	jrult print_exit ; colon or end of line 
      009497 90 AE            [ 1] 3816 	cp a,#TK_QSTR
      009499 A9 93            [ 1] 3817 	jreq 1$
      00949B 90 CF            [ 1] 3818 	cp a,#TK_CHAR 
      00949D 00 18            [ 1] 3819 	jreq 2$ 
      00949F 90 5F            [ 1] 3820 	cp a,#TK_CFUNC 
      0094A1 91 D3            [ 1] 3821 	jreq 3$
      0094A3 18 27            [ 1] 3822 	cp a,#TK_COMMA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0094A5 0C 90            [ 1] 3823 	jreq 4$
      0094A7 5C 91            [ 1] 3824 	cp a,#TK_SHARP 
      0094A9 D6 18            [ 1] 3825 	jreq 5$
      0094AB 90 5C            [ 2] 3826 	jra 7$ 
      0015DF                       3827 1$:	; print string 
      0094AD 91 DA 18         [ 4] 3828 	call puts
      0094B0 26 EF            [ 2] 3829 	jra reset_comma
      0015E4                       3830 2$:	; print character 
      0094B2 93               [ 1] 3831 	ld a,xl 
      0094B3 90 85 81         [ 4] 3832 	call putc 
      0094B6 20 D6            [ 2] 3833 	jra reset_comma 
      0015EA                       3834 3$: ; print character function value  	
      0094B6 52               [ 4] 3835 	call (x)
      0094B7 04               [ 1] 3836 	ld a,xl 
      0094B8 C6 00 0B         [ 4] 3837 	call putc
      0094BB 6B 01            [ 2] 3838 	jra reset_comma 
      0015F1                       3839 4$: ; set comma state 
      0094BD C6 00            [ 1] 3840 	cpl (COMMA,sp)
      0094BF 25 6B            [ 2] 3841 	jra prt_loop   
      0015F5                       3842 5$: ; # character must be followed by an integer   
      0094C1 02 17 03         [ 4] 3843 	call next_token
      0094C4 72 CE            [ 1] 3844 	cp a,#TK_INTGR 
      0094C6 00 05            [ 1] 3845 	jreq 6$
      0094C8 35 0A 00         [ 2] 3846 	jp syntax_error 
      0015FF                       3847 6$: ; set tab width
      0094CB 0B               [ 1] 3848 	ld a,xl 
      0094CC 35 05            [ 1] 3849 	and a,#15 
      0094CE 00 25 72         [ 1] 3850 	ld tab_width,a 
      0094D1 5F 00            [ 2] 3851 	jra reset_comma 
      001607                       3852 7$:	
      001607                       3853 	_unget_token 
      0094D3 0C CF 00 0D CD   [ 1]    1      mov in,in.saved  
      0094D8 8A E9 CD         [ 4] 3854 	call relation 
      0094DB 94 3A            [ 1] 3855 	cp a,#TK_INTGR 
      0094DD 88 90            [ 1] 3856 	jrne print_exit 
      0094DF 93 1E 04         [ 4] 3857     call print_int 
      0094E2 CD 84            [ 2] 3858 	jra reset_comma 
      001618                       3859 print_exit:
      0094E4 A6 90            [ 1] 3860 	tnz (COMMA,sp)
      0094E6 5F 84            [ 1] 3861 	jrne 9$
      0094E8 90 97            [ 1] 3862 	ld a,#CR 
      0094EA 72 F9 03         [ 4] 3863     call putc 
      001621                       3864 9$:	_drop VSIZE 
      0094ED A6 20            [ 2]    1     addw sp,#VSIZE 
      0094EF 90               [ 4] 3865 	ret 
                                   3866 
                                   3867 ;----------------------
                                   3868 ; 'save_context' and
                                   3869 ; 'rest_context' must be 
                                   3870 ; called at the same 
                                   3871 ; call stack depth 
                                   3872 ; i.e. SP must have the 
                                   3873 ; save value at  
                                   3874 ; entry point of both 
                                   3875 ; routine. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3876 ;---------------------
                           000004  3877 	CTXT_SIZE=4 ; size of saved data 
                                   3878 ;--------------------
                                   3879 ; save current BASIC
                                   3880 ; interpreter context 
                                   3881 ; on stack 
                                   3882 ;--------------------
      001624                       3883 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001624                       3884 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001624                       3885 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001624                       3886 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001624                       3887 save_context:
      0094F0 F7 90 5C         [ 2] 3888 	ldw x,basicptr 
      0094F3 72 5F            [ 2] 3889 	ldw (BPTR,sp),x
      0094F5 00 25 AE         [ 1] 3890 	ld a,in 
      0094F8 00 03            [ 1] 3891 	ld (IN,sp),a
      0094FA CF 00 01         [ 1] 3892 	ld a,count 
      0094FD 6B 06            [ 1] 3893 	ld (CNT,sp),a  
      0094FD 90               [ 4] 3894 	ret
                                   3895 
                                   3896 ;-----------------------
                                   3897 ; restore previously saved 
                                   3898 ; BASIC interpreter context 
                                   3899 ; from stack 
                                   3900 ;-------------------------
      001634                       3901 rest_context:
      0094FE 89 CD            [ 2] 3902 	ldw x,(BPTR,sp)
      009500 8A 6C 90         [ 2] 3903 	ldw basicptr,x 
      009503 85 4D            [ 1] 3904 	ld a,(IN,sp)
      009505 26 03 CC         [ 1] 3905 	ld in,a
      009508 95 E3            [ 1] 3906 	ld a,(CNT,sp)
      00950A 2A 6F A1         [ 1] 3907 	ld count,a  
      00950D 85               [ 4] 3908 	ret
                                   3909 
                                   3910 
                                   3911 
                                   3912 ;------------------------------------------
                                   3913 ; BASIC: INPUT [string]var[,[string]var]
                                   3914 ; input value in variables 
                                   3915 ; [string] optionally can be used as prompt 
                                   3916 ;-----------------------------------------
                           000001  3917 	CX_BPTR=1
                           000003  3918 	CX_IN=3
                           000004  3919 	CX_CNT=4
                           000005  3920 	SKIP=5
                           000006  3921 	VAR_ADDR=6
                           000007  3922 	VSIZE=7
      001644                       3923 input_var:
      001644                       3924 	_vars VSIZE 
      00950E 26 0C            [ 2]    1     sub sp,#VSIZE 
      001646                       3925 input_loop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009510 CD 94            [ 1] 3926 	clr (SKIP,sp)
      009512 28 CD 94         [ 4] 3927 	call next_token 
      009515 8D 90            [ 1] 3928 	cp a,#TK_QSTR 
      009517 F7 90            [ 1] 3929 	jrne 1$ 
      009519 5C 20 E1         [ 4] 3930 	call puts 
      00951C 03 05            [ 1] 3931 	cpl (SKIP,sp)
      00951C A1 84 26         [ 4] 3932 	call next_token 
      00951F 22 CD            [ 1] 3933 1$: cp a,#TK_VAR  
      009521 94 28            [ 1] 3934 	jreq 2$ 
      009523 72 5F 00         [ 2] 3935 	jp syntax_error
      009526 0C CF            [ 2] 3936 2$:	ldw (VAR_ADDR,sp),x 
      009528 00 0D            [ 1] 3937 	tnz (SKIP,sp)
      00952A 90 89            [ 1] 3938 	jrne 21$ 
      00952C CD 8A E9         [ 4] 3939 	call var_name 
      00952F 16 01 88         [ 4] 3940 	call putc   
      00166A                       3941 21$:
      009532 51 CD            [ 1] 3942 	ld a,#':
      009534 84 A6 90         [ 4] 3943 	call putc 
      009537 5F 84 90         [ 4] 3944 	call save_context 
      00953A 97 72 F9 01      [ 1] 3945 	clr count  
      00953E 5B 02 20         [ 4] 3946 	call readln 
      009541 BB 16 90         [ 2] 3947 	ldw x,#tib 
      009542 3B 00 03         [ 1] 3948 	push count
      009542 CD 94            [ 1] 3949 	push #0 
      009544 95 A3 00         [ 2] 3950 	addw x,(1,sp)
      009547 8E               [ 1] 3951 	incw x 
      001685                       3952 	_drop 2 
      009548 26 22            [ 2]    1     addw sp,#2 
      00954A CE 00 05 CD      [ 1] 3953 	clr in 
      00954E 94 28 A6         [ 4] 3954 	call get_token
      009551 27 90            [ 1] 3955 	cp a,#TK_INTGR
      009553 F7 90            [ 1] 3956 	jreq 3$ 
      009555 5C 16 34         [ 4] 3957 	call rest_context 
      009556 CC 08 FA         [ 2] 3958 	jp syntax_error
      009556 72 D6            [ 2] 3959 3$: ldw y,(VAR_ADDR,sp) 
      009558 00 01            [ 2] 3960 	ldw (y),x 
      00955A 72 5C 00         [ 4] 3961 	call rest_context
      00955D 02 90 F7         [ 4] 3962 	call next_token 
      009560 90 5C            [ 1] 3963 	cp a,#TK_COMMA 
      009562 C6 00            [ 1] 3964 	jreq input_loop 
      009564 02 C1            [ 1] 3965 	cp a,#TK_COLON 
      009566 00 04            [ 2] 3966     jrule input_exit 
      009568 2B EC 20         [ 2] 3967 	jp syntax_error 
      0016AD                       3968 input_exit:
      0016AD                       3969 	_drop VSIZE 
      00956B 77 07            [ 2]    1     addw sp,#VSIZE 
      00956C 81               [ 4] 3970 	ret 
                                   3971 
                                   3972 
                                   3973 ;---------------------
                                   3974 ; BASIC: REMARK | ' 
                                   3975 ; skip comment to end of line 
                                   3976 ;---------------------- 
      0016B0                       3977 remark:
      00956C CD 94 28 90 89   [ 1] 3978 	mov in,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009571 CD               [ 4] 3979  	ret 
                                   3980 
                                   3981 
                                   3982 ;---------------------
                                   3983 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3984 ; read in loop 'addr'  
                                   3985 ; apply & 'mask' to value 
                                   3986 ; loop while result==0.  
                                   3987 ; 'xor_mask' is used to 
                                   3988 ; invert the wait logic.
                                   3989 ; i.e. loop while not 0.
                                   3990 ;---------------------
                           000001  3991 	XMASK=1 
                           000002  3992 	MASK=2
                           000003  3993 	ADDR=3
                           000004  3994 	VSIZE=4
      0016B6                       3995 wait: 
      0016B6                       3996 	_vars VSIZE
      009572 90 C1            [ 2]    1     sub sp,#VSIZE 
      009574 90 85            [ 1] 3997 	clr (XMASK,sp) 
      009576 CD 94 13         [ 4] 3998 	call arg_list 
      009579 20 82            [ 1] 3999 	cp a,#2
      00957B 24 03            [ 1] 4000 	jruge 0$
      00957B A1 02 26         [ 2] 4001 	jp syntax_error 
      00957E 06 CD            [ 1] 4002 0$:	cp a,#3
      009580 94 4C            [ 1] 4003 	jrult 1$
      009582 CC               [ 2] 4004 	popw x 
      009583 94               [ 1] 4005 	ld a,xl
      009584 FD 01            [ 1] 4006 	ld (XMASK,sp),a 
      009585 85               [ 2] 4007 1$: popw x ; mask 
      009585 A1               [ 1] 4008 	ld a,xl 
      009586 03 26            [ 1] 4009 	ld (MASK,sp),a 
      009588 0E               [ 2] 4010 	popw x ; address 
      009589 A6               [ 1] 4011 2$:	ld a,(x)
      00958A 5C 90            [ 1] 4012 	and a,(MASK,sp)
      00958C F7 90            [ 1] 4013 	xor a,(XMASK,sp)
      00958E 5C 9F            [ 1] 4014 	jreq 2$ 
      0016D8                       4015 	_drop VSIZE 
      009590 90 F7            [ 2]    1     addw sp,#VSIZE 
      009592 90               [ 4] 4016 	ret 
                                   4017 
                                   4018 ;---------------------
                                   4019 ; BASIC: BSET addr,mask
                                   4020 ; set bits at 'addr' corresponding 
                                   4021 ; to those of 'mask' that are at 1.
                                   4022 ; arguments:
                                   4023 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4024 ;   mask        mask|addr
                                   4025 ; output:
                                   4026 ;	none 
                                   4027 ;--------------------------
      0016DB                       4028 bit_set:
      009593 5C CC 94         [ 4] 4029 	call arg_list 
      009596 FD A1            [ 1] 4030 	cp a,#2	 
      009598 01 26            [ 1] 4031 	jreq 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      00959A 09 A6 3A         [ 2] 4032 	jp syntax_error
      00959D                       4033 1$: 
      00959D 90               [ 2] 4034 	popw x ; mask 
      00959E F7               [ 1] 4035 	ld a,xl 
      00959F 90               [ 2] 4036 	popw x ; addr  
      0095A0 5C               [ 1] 4037 	or a,(x)
      0095A1 F7               [ 1] 4038 	ld (x),a
      0095A1 CC               [ 4] 4039 	ret 
                                   4040 
                                   4041 ;---------------------
                                   4042 ; BASIC: BRES addr,mask
                                   4043 ; reset bits at 'addr' corresponding 
                                   4044 ; to those of 'mask' that are at 1.
                                   4045 ; arguments:
                                   4046 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4047 ;   mask	    ~mask&*addr  
                                   4048 ; output:
                                   4049 ;	none 
                                   4050 ;--------------------------
      0016EB                       4051 bit_reset:
      0095A2 94 FD D2         [ 4] 4052 	call arg_list 
      0095A4 A1 02            [ 1] 4053 	cp a,#2  
      0095A4 A1 0A            [ 1] 4054 	jreq 1$ 
      0095A6 22 0A A0         [ 2] 4055 	jp syntax_error
      0016F5                       4056 1$: 
      0095A9 06               [ 2] 4057 	popw x ; mask 
      0095AA 5F               [ 1] 4058 	ld a,xl 
      0095AB 97               [ 1] 4059 	cpl a 
      0095AC 1C               [ 2] 4060 	popw x ; addr  
      0095AD 95               [ 1] 4061 	and a,(x)
      0095AE F9               [ 1] 4062 	ld (x),a 
      0095AF F6               [ 4] 4063 	ret 
                                   4064 
                                   4065 ;---------------------
                                   4066 ; BASIC: BTOGL addr,mask
                                   4067 ; toggle bits at 'addr' corresponding 
                                   4068 ; to those of 'mask' that are at 1.
                                   4069 ; arguments:
                                   4070 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4071 ;   mask	    mask^*addr  
                                   4072 ; output:
                                   4073 ;	none 
                                   4074 ;--------------------------
      0016FC                       4075 bit_toggle:
      0095B0 20 EB D2         [ 4] 4076 	call arg_list 
      0095B2 A1 02            [ 1] 4077 	cp a,#2 
      0095B2 A1 11            [ 1] 4078 	jreq 1$ 
      0095B4 22 0A A0         [ 2] 4079 	jp syntax_error
      0095B7 10               [ 2] 4080 1$: popw x ; mask 
      0095B8 5F               [ 1] 4081 	ld a,xl 
      0095B9 97               [ 2] 4082 	popw x ; addr  
      0095BA 1C               [ 1] 4083 	xor a,(x)
      0095BB 95               [ 1] 4084 	ld (x),a 
      0095BC FE               [ 4] 4085 	ret 
                                   4086 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4087 
                                   4088 ;---------------------
                                   4089 ; BASIC: BTEST(addr,bit)
                                   4090 ; return bit value at 'addr' 
                                   4091 ; bit is in range {0..7}.
                                   4092 ; arguments:
                                   4093 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4094 ;   bit 	    bit position {0..7}  
                                   4095 ; output:
                                   4096 ;	none 
                                   4097 ;--------------------------
      00170C                       4098 bit_test:
      0095BD F6 20 DD         [ 4] 4099 	call func_args 
      0095C0 A1 02            [ 1] 4100 	cp a,#2
      0095C0 A1 22            [ 1] 4101 	jreq 0$
      0095C2 22 0A A0         [ 2] 4102 	jp syntax_error
      001716                       4103 0$:	
      0095C5 20               [ 2] 4104 	popw x 
      0095C6 5F               [ 1] 4105 	ld a,xl 
      0095C7 97 1C            [ 1] 4106 	and a,#7
      0095C9 96               [ 1] 4107 	push a   
      0095CA 00 F6            [ 1] 4108 	ld a,#1 
      0095CC 20 CF            [ 1] 4109 1$: tnz (1,sp)
      0095CE 27 05            [ 1] 4110 	jreq 2$
      0095CE A0               [ 1] 4111 	sll a 
      0095CF 31 48            [ 1] 4112 	dec (1,sp)
      0095D1 5F 97            [ 2] 4113 	jra 1$
      001726                       4114 2$: _drop 1 
      0095D3 1C 96            [ 2]    1     addw sp,#1 
      0095D5 03               [ 2] 4115 	popw x 
      0095D6 FE               [ 1] 4116 	and a,(x)
      0095D7 F6 5C            [ 1] 4117 	jreq 3$
      0095D9 90 F7            [ 1] 4118 	ld a,#1 
      0095DB 90               [ 1] 4119 3$:	clrw x 
      0095DC 5C               [ 1] 4120 	ld xl,a 
      0095DD F6 26            [ 1] 4121 	ld a,#TK_INTGR
      0095DF BD               [ 4] 4122 	ret
                                   4123 
                                   4124 
                                   4125 ;--------------------
                                   4126 ; BASIC: POKE addr,byte
                                   4127 ; put a byte at addr 
                                   4128 ;--------------------
      001733                       4129 poke:
      0095E0 CC 94 FD         [ 4] 4130 	call arg_list 
      0095E3 A1 02            [ 1] 4131 	cp a,#2
      0095E3 90 7F            [ 1] 4132 	jreq 1$
      0095E5 1E 03 7B         [ 2] 4133 	jp syntax_error
      00173D                       4134 1$:	
      0095E8 01               [ 2] 4135 	popw x  
      0095E9 C7               [ 1] 4136     ld a,xl 
      0095EA 00               [ 2] 4137 	popw x 
      0095EB 0B               [ 1] 4138 	ld (x),a 
      0095EC 7B               [ 4] 4139 	ret 
                                   4140 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4141 ;-----------------------
                                   4142 ; BASIC: PEEK(addr)
                                   4143 ; get the byte at addr 
                                   4144 ; input:
                                   4145 ;	none 
                                   4146 ; output:
                                   4147 ;	X 		value 
                                   4148 ;-----------------------
      001742                       4149 peek:
      0095ED 02 C7 00         [ 4] 4150 	call func_args
      0095F0 25 72            [ 1] 4151 	cp a,#1 
      0095F2 F2 03            [ 1] 4152 	jreq 1$
      0095F4 90 9F 5B         [ 2] 4153 	jp syntax_error
      0095F7 04               [ 2] 4154 1$: popw x 
      0095F8 81               [ 1] 4155 	ld a,(x)
      0095F9 40               [ 1] 4156 	clrw x 
      0095FA 28               [ 1] 4157 	ld xl,a 
      0095FB 29 2C            [ 1] 4158 	ld a,#TK_INTGR
      0095FD 23               [ 4] 4159 	ret 
                                   4160 
                                   4161 ;---------------------------
                                   4162 ; BASIC IF expr : instructions
                                   4163 ; evaluate expr and if true 
                                   4164 ; execute instructions on same line. 
                                   4165 ;----------------------------
      001753                       4166 if: 
      0095FE 2B 2D 2A         [ 4] 4167 	call relation 
      009601 2F 25            [ 1] 4168 	cp a,#TK_INTGR
      009603 96 0F            [ 1] 4169 	jreq 1$ 
      009605 96 11 96         [ 2] 4170 	jp syntax_error
      009608 13               [ 1] 4171 1$:	clr a 
      009609 96               [ 2] 4172 	tnzw x 
      00960A 16 96            [ 1] 4173 	jrne 9$  
                                   4174 ;skip to next line
      00960C 18 96 1B 3E 00   [ 1] 4175 	mov in,count
      009611 3D               [ 4] 4176 9$:	ret 
                                   4177 
                                   4178 ;------------------------
                                   4179 ; BASIC: FOR var=expr 
                                   4180 ; set variable to expression 
                                   4181 ; leave variable address 
                                   4182 ; on stack and set
                                   4183 ; FLOOP bit in 'flags'
                                   4184 ;-----------------
                           000001  4185 	RETL1=1 ; return address  
                           000003  4186 	FSTEP=3  ; variable increment
                           000005  4187 	LIMIT=5 ; loop limit 
                           000007  4188 	CVAR=7   ; control variable 
                           000009  4189 	INW=9   ;  in.w saved
                           00000B  4190 	BPTR=11 ; baseptr saved
                           00000A  4191 	VSIZE=10  
      001767                       4192 for: ; { -- var_addr }
      009612 00               [ 2] 4193 	popw x ; call return address 
      001768                       4194 	_vars VSIZE 
      009613 3E 3D            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009615 00               [ 2] 4195 	pushw x  ; RETL1 
      009616 3C 00            [ 1] 4196 	ld a,#TK_VAR 
      009618 3C 3D 00         [ 4] 4197 	call expect
      00961B 3C 3E            [ 2] 4198 	ldw (CVAR,sp),x  ; control variable 
      00961D 00 12 FD         [ 4] 4199 	call let_var 
      00961E 72 14 00 23      [ 1] 4200 	bset flags,#FLOOP 
                                   4201 ; open space on stack for loop data 
      00961E C7               [ 1] 4202 	clrw x 
      00961F 00 04            [ 2] 4203 	ldw (BPTR,sp),x 
      009621 E6 02            [ 2] 4204 	ldw (INW,sp),x 
      009623 C1 00 04         [ 4] 4205 	call next_token 
      009626 2A 03            [ 1] 4206 	cp a,#TK_CMD 
      009628 C7 00            [ 1] 4207 	jreq 1$
      00962A 04 CF 00         [ 2] 4208 	jp syntax_error
      001788                       4209 1$:  
      00962D 05 90 AE         [ 2] 4210 	cpw x,#to 
      009630 16 90            [ 1] 4211 	jreq to
      009632 CD 94 B6         [ 2] 4212 	jp syntax_error 
                                   4213 
                                   4214 ;-----------------------------------
                                   4215 ; BASIC: TO expr 
                                   4216 ; second part of FOR loop initilization
                                   4217 ; leave limit on stack and set 
                                   4218 ; FTO bit in 'flags'
                                   4219 ;-----------------------------------
      001790                       4220 to: ; { var_addr -- var_addr limit step }
      009635 CD AA C0 A6 0D   [ 2] 4221 	btjt flags,#FLOOP,1$
      00963A CD 83 8A         [ 2] 4222 	jp syntax_error
      00963D 81 12 1D         [ 4] 4223 1$: call relation  
      00963E A1 84            [ 1] 4224 	cp a,#TK_INTGR 
      00963E 52 01            [ 1] 4225 	jreq 2$ 
      009640 CC 08 FA         [ 2] 4226 	jp syntax_error
      009640 0F 01            [ 2] 4227 2$: ldw (LIMIT,sp),x
                                   4228 ;	ldw x,in.w 
      009642 CD 09 EC         [ 4] 4229 	call next_token
      009642 CD 8A            [ 1] 4230 	cp a,#TK_NONE  
      009644 6C A1            [ 1] 4231 	jreq 4$ 
      009646 02 25            [ 1] 4232 	cp a,#TK_CMD
      009648 4F A1            [ 1] 4233 	jrne 3$
      00964A 02 27 12         [ 2] 4234 	cpw x,#step 
      00964D A1 03            [ 1] 4235 	jreq step
      0017B4                       4236 3$:	
      0017B4                       4237 	_unget_token   	 
      00964F 27 13 A1 82 27   [ 1]    1      mov in,in.saved  
      0017B9                       4238 4$:	
      009654 15 A1 09         [ 2] 4239 	ldw x,#1   ; default step  
      009657 27 18            [ 2] 4240 	ldw (FSTEP,sp),x 
      009659 A1 0A            [ 2] 4241 	jra store_loop_addr 
                                   4242 
                                   4243 
                                   4244 ;----------------------------------
                                   4245 ; BASIC: STEP expr 
                                   4246 ; optional third par of FOR loop
                                   4247 ; initialization. 	
                                   4248 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0017C0                       4249 step: ; {var limit -- var limit step}
      00965B 27 18 20 28 03   [ 2] 4250 	btjt flags,#FLOOP,1$
      00965F CC 08 FA         [ 2] 4251 	jp syntax_error
      00965F CD AA C0         [ 4] 4252 1$: call relation
      009662 20 DC            [ 1] 4253 	cp a,#TK_INTGR
      009664 27 03            [ 1] 4254 	jreq 2$
      009664 9F CD 83         [ 2] 4255 	jp syntax_error
      009667 8A 20            [ 2] 4256 2$:	ldw (FSTEP,sp),x ; step
                                   4257 ; leave loop back entry point on cstack 
                                   4258 ; cstack is 1 call deep from interpreter
      0017D4                       4259 store_loop_addr:
      009669 D6 00 04         [ 2] 4260 	ldw x,basicptr  
      00966A 1F 0B            [ 2] 4261 	ldw (BPTR,sp),x 
      00966A FD 9F CD         [ 2] 4262 	ldw x,in.w 
      00966D 83 8A            [ 2] 4263 	ldw (INW,sp),x   
      00966F 20 CF 00 23      [ 1] 4264 	bres flags,#FLOOP 
      009671 72 5C 00 20      [ 1] 4265 	inc loop_depth  
      009671 03               [ 4] 4266 	ret 
                                   4267 
                                   4268 ;--------------------------------
                                   4269 ; BASIC: NEXT var 
                                   4270 ; FOR loop control 
                                   4271 ; increment variable with step 
                                   4272 ; and compare with limit 
                                   4273 ; loop if threshold not crossed.
                                   4274 ; else stack. 
                                   4275 ; and decrement 'loop_depth' 
                                   4276 ;--------------------------------
      0017E7                       4277 next: ; {var limit step retl1 -- [var limit step ] }
      009672 01 20 CD 20      [ 1] 4278 	tnz loop_depth 
      009675 26 03            [ 1] 4279 	jrne 1$ 
      009675 CD 8A 6C         [ 2] 4280 	jp syntax_error 
      0017F0                       4281 1$: 
      009678 A1 84            [ 1] 4282 	ld a,#TK_VAR 
      00967A 27 03 CC         [ 4] 4283 	call expect
                                   4284 ; check for good variable after NEXT 	 
      00967D 89 7A            [ 2] 4285 	cpw x,(CVAR,sp)
      00967F 27 03            [ 1] 4286 	jreq 2$  
      00967F 9F A4 0F         [ 2] 4287 	jp syntax_error ; not the good one 
      0017FC                       4288 2$: ; increment variable 
      009682 C7               [ 2] 4289 	ldw x,(x)  ; get var value 
      009683 00 25 20         [ 2] 4290 	addw x,(FSTEP,sp) ; var+step 
      009686 B9 07            [ 2] 4291 	ldw y,(CVAR,sp)
      009687 90 FF            [ 2] 4292 	ldw (y),x ; save var new value 
                                   4293 ; check sign of STEP  
      009687 55 00            [ 1] 4294 	ld a,#0x80
      009689 03 00            [ 1] 4295 	bcp a,(FSTEP,sp)
      00968B 02 CD            [ 1] 4296 	jrpl 4$
                                   4297 ;negative step 
      00968D 92 9D            [ 2] 4298 	cpw x,(LIMIT,sp)
      00968F A1 84            [ 1] 4299 	jrslt loop_done
      009691 26 05            [ 2] 4300 	jra loop_back 
      001810                       4301 4$: ; positive step
      009693 CD 8A            [ 2] 4302 	cpw x,(LIMIT,sp)
      009695 CD 20            [ 1] 4303 	jrsgt loop_done
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      001814                       4304 loop_back:
      009697 A8 0B            [ 2] 4305 	ldw x,(BPTR,sp)
      009698 CF 00 04         [ 2] 4306 	ldw basicptr,x 
      009698 0D 01 26 05 A6   [ 2] 4307 	btjf flags,#FRUN,1$ 
      00969D 0D CD            [ 1] 4308 	ld a,(2,x)
      00969F 83 8A 5B         [ 1] 4309 	ld count,a
      0096A2 01 81            [ 2] 4310 1$:	ldw x,(INW,sp)
      0096A4 CF 00 00         [ 2] 4311 	ldw in.w,x 
      0096A4 CE               [ 4] 4312 	ret 
      001829                       4313 loop_done:
                                   4314 	; remove loop data from stack  
      0096A5 00               [ 2] 4315 	popw x
      00182A                       4316 	_drop VSIZE 
      0096A6 05 1F            [ 2]    1     addw sp,#VSIZE 
      0096A8 03 C6 00 02      [ 1] 4317 	dec loop_depth 
                                   4318 ;	pushw x 
                                   4319 ;	ret 
      0096AC 6B               [ 2] 4320 	jp (x)
                                   4321 
                                   4322 ;----------------------------
                                   4323 ; called by goto/gosub
                                   4324 ; to get target line number 
                                   4325 ;---------------------------
      001831                       4326 get_target_line:
      0096AD 05 C6 00         [ 4] 4327 	call relation 
      0096B0 04 6B            [ 1] 4328 	cp a,#TK_INTGR
      0096B2 06 81            [ 1] 4329 	jreq 1$
      0096B4 CC 08 FA         [ 2] 4330 	jp syntax_error
      0096B4 1E 03 CF         [ 4] 4331 1$:	call search_lineno  
      0096B7 00               [ 2] 4332 	tnzw x 
      0096B8 05 7B            [ 1] 4333 	jrne 2$ 
      0096BA 05 C7            [ 1] 4334 	ld a,#ERR_NO_LINE 
      0096BC 00 02 7B         [ 2] 4335 	jp tb_error 
      0096BF 06               [ 4] 4336 2$:	ret 
                                   4337 
                                   4338 ;------------------------
                                   4339 ; BASIC: GOTO line# 
                                   4340 ; jump to line# 
                                   4341 ; here cstack is 2 call deep from interpreter 
                                   4342 ;------------------------
      001847                       4343 goto:
      0096C0 C7 00 04 81 06   [ 2] 4344 	btjt flags,#FRUN,0$ 
      0096C4 A6 06            [ 1] 4345 	ld a,#ERR_RUN_ONLY
      0096C4 52 07 FC         [ 2] 4346 	jp tb_error 
      0096C6 81               [ 4] 4347 	ret 
      0096C6 0F 05 CD         [ 4] 4348 0$:	call get_target_line
      001855                       4349 jp_to_target:
      0096C9 8A 6C A1         [ 2] 4350 	ldw basicptr,x 
      0096CC 02 26            [ 1] 4351 	ld a,(2,x)
      0096CE 08 CD AA         [ 1] 4352 	ld count,a 
      0096D1 C0 03 05 CD      [ 1] 4353 	mov in,#3 
      0096D5 8A               [ 4] 4354 	ret 
                                   4355 
                                   4356 
                                   4357 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4358 ; BASIC: GOSUB line#
                                   4359 ; basic subroutine call
                                   4360 ; actual line# and basicptr 
                                   4361 ; are saved on cstack
                                   4362 ; here cstack is 2 call deep from interpreter 
                                   4363 ;--------------------
                           000003  4364 	RET_ADDR=3
                           000005  4365 	RET_INW=5
                           000004  4366 	VSIZE=4  
      001862                       4367 gosub:
      0096D6 6C A1 85 27 03   [ 2] 4368 	btjt flags,#FRUN,0$ 
      0096DB CC 89            [ 1] 4369 	ld a,#ERR_RUN_ONLY
      0096DD 7A 1F 06         [ 2] 4370 	jp tb_error 
      0096E0 0D               [ 4] 4371 	ret 
      0096E1 05               [ 2] 4372 0$:	popw x 
      00186E                       4373 	_vars VSIZE  
      0096E2 26 06            [ 2]    1     sub sp,#VSIZE 
      0096E4 CD               [ 2] 4374 	pushw x 
      0096E5 94 8D CD         [ 2] 4375 	ldw x,basicptr
      0096E8 83 8A            [ 2] 4376 	ldw (RET_ADDR,sp),x 
      0096EA CD 18 31         [ 4] 4377 	call get_target_line  
      0096EA A6               [ 2] 4378 	pushw x 
      0096EB 3A CD 83         [ 2] 4379 	ldw x,in.w 
      0096EE 8A CD            [ 2] 4380 	ldw (RET_INW+2,sp),x
      0096F0 96               [ 2] 4381 	popw x 
      0096F1 A4 72            [ 2] 4382 	jra jp_to_target
                                   4383 
                                   4384 ;------------------------
                                   4385 ; BASIC: RETURN 
                                   4386 ; exit from a subroutine 
                                   4387 ; 
                                   4388 ;------------------------
      001882                       4389 return:
      0096F3 5F 00 04 CD AB   [ 2] 4390 	btjt flags,#FRUN,0$ 
      0096F8 C5 AE            [ 1] 4391 	ld a,#ERR_RUN_ONLY
      0096FA 16 90 3B         [ 2] 4392 	jp tb_error 
      00188C                       4393 0$:	
      0096FD 00 04            [ 2] 4394 	ldw x,(RET_ADDR,sp) 
      0096FF 4B 00 72         [ 2] 4395 	ldw basicptr,x
      009702 FB 01            [ 1] 4396 	ld a,(2,x)
      009704 5C 5B 02         [ 1] 4397 	ld count,a  
      009707 72 5F            [ 2] 4398 	ldw x,(RET_INW,sp)
      009709 00 02 CD         [ 2] 4399 	ldw in.w,x 
      00970C 8C               [ 2] 4400 	popw x 
      00189C                       4401 	_drop VSIZE 
      00970D FC A1            [ 2]    1     addw sp,#VSIZE 
      00970F 84               [ 2] 4402 	pushw x
      009710 27               [ 4] 4403 	ret  
                                   4404 
                                   4405 
                                   4406 ;----------------------------------
                                   4407 ; BASIC: RUN
                                   4408 ; run BASIC program in RAM
                                   4409 ;----------------------------------- 
      0018A0                       4410 run: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009711 06 CD 96 B4 CC   [ 2] 4411 	btjf flags,#FRUN,0$  
      009716 89               [ 1] 4412 	clr a 
      009717 7A               [ 4] 4413 	ret
      0018A7                       4414 0$: 
      009718 16 06 90 FF CD   [ 2] 4415 	btjf flags,#FBREAK,1$
      0018AC                       4416 	_drop 2 
      00971D 96 B4            [ 2]    1     addw sp,#2 
      00971F CD 8A 6C         [ 4] 4417 	call rest_context
      0018B1                       4418 	_drop CTXT_SIZE 
      009722 A1 09            [ 2]    1     addw sp,#CTXT_SIZE 
      009724 27 A0 A1 01      [ 1] 4419 	bres flags,#FBREAK 
      009728 23 03 CC 89      [ 1] 4420 	bset flags,#FRUN 
      00972C 7A 09 A0         [ 2] 4421 	jp interpreter 
      00972D CE 00 1C         [ 2] 4422 1$:	ldw x,txtbgn
      00972D 5B 07 81         [ 2] 4423 	cpw x,txtend 
      009730 2B 0C            [ 1] 4424 	jrmi run_it 
      009730 55 00 04         [ 2] 4425 	ldw x,#err_no_prog
      009733 00 02 81         [ 4] 4426 	call puts 
      009736 55 00 03 00 01   [ 1] 4427 	mov in,count
      009736 52               [ 4] 4428 	ret 
      0018D2                       4429 run_it:	 
      009737 04 0F 01         [ 4] 4430     call ubound 
      0018D5                       4431 	_drop 2 ; drop return address 
      00973A CD 91            [ 2]    1     addw sp,#2 
                                   4432 ; clear data pointer 
      00973C 52               [ 1] 4433 	clrw x 
      00973D A1 02 24         [ 2] 4434 	ldw data_ptr,x 
      009740 03 CC 89 7A      [ 1] 4435 	clr data_ofs 
      009744 A1 03 25 04      [ 1] 4436 	clr data_len 
                                   4437 ; initialize BASIC pointer 
      009748 85 9F 6B         [ 2] 4438 	ldw x,txtbgn 
      00974B 01 85 9F         [ 2] 4439 	ldw basicptr,x 
      00974E 6B 02            [ 1] 4440 	ld a,(2,x)
      009750 85 F6 14         [ 1] 4441 	ld count,a
      009753 02 18 01 27      [ 1] 4442 	mov in,#3	
      009757 F9 5B 04 81      [ 1] 4443 	bset flags,#FRUN 
      00975B CC 09 A0         [ 2] 4444 	jp interpreter 
                                   4445 
                                   4446 
                                   4447 ;----------------------
                                   4448 ; BASIC: END
                                   4449 ; end running program
                                   4450 ;---------------------- 
      0018F9                       4451 cmd_end: 
                                   4452 ; clean stack 
      00975B CD 91 52         [ 2] 4453 	ldw x,#STACK_EMPTY
      00975E A1               [ 1] 4454 	ldw sp,x 
      00975F 02 27 03         [ 2] 4455 	jp warm_start
                                   4456 
                                   4457 ;-----------------
                                   4458 ; 1 Khz beep 
                                   4459 ;-----------------
      001900                       4460 beep_1khz:: 
      009762 CC 89 7A         [ 2] 4461 	ldw x,#100
      009765 90 AE 03 E8      [ 2] 4462 	ldw y,#1000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009765 85 9F            [ 2] 4463 	jra beep
                                   4464 
                                   4465 ;-----------------------
                                   4466 ; BASIC: TONE expr1,expr2
                                   4467 ; used TIMER2 channel 1
                                   4468 ; to produce a tone 
                                   4469 ; arguments:
                                   4470 ;    expr1   frequency 
                                   4471 ;    expr2   duration msec.
                                   4472 ;---------------------------
      001909                       4473 tone:
      009767 85 FA F7         [ 4] 4474 	call arg_list 
      00976A 81 02            [ 1] 4475 	cp a,#2 
      00976B 27 03            [ 1] 4476 	jreq 1$
      00976B CD 91 52         [ 2] 4477 	jp syntax_error 
      001913                       4478 1$: 
      00976E A1               [ 2] 4479 	popw x ; duration
      00976F 02 27            [ 2] 4480 	popw y ; frequency 
      001916                       4481 beep:  
      009771 03               [ 2] 4482 	pushw x 
      009772 CC 89 7A         [ 2] 4483 	ldw x,#TIM2_CLK_FREQ
      009775 65               [ 2] 4484 	divw x,y 
                                   4485 ; round to nearest integer 
      009775 85 9F 43 85      [ 2] 4486 	cpw y,#TIM2_CLK_FREQ/2
      009779 F4 F7            [ 1] 4487 	jrmi 2$
      00977B 81               [ 1] 4488 	incw x 
      00977C                       4489 2$:	 
      00977C CD               [ 1] 4490 	ld a,xh 
      00977D 91 52 A1         [ 1] 4491 	ld TIM2_ARRH,a 
      009780 02               [ 1] 4492 	ld a,xl 
      009781 27 03 CC         [ 1] 4493 	ld TIM2_ARRL,a 
                                   4494 ; 50% duty cycle 
      009784 89               [ 1] 4495 	ccf 
      009785 7A               [ 2] 4496 	rrcw x 
      009786 85               [ 1] 4497 	ld a,xh 
      009787 9F 85 F8         [ 1] 4498 	ld TIM2_CCR1H,a 
      00978A F7               [ 1] 4499 	ld a,xl
      00978B 81 53 10         [ 1] 4500 	ld TIM2_CCR1L,a
      00978C 72 10 53 08      [ 1] 4501 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00978C CD 91 4D A1      [ 1] 4502 	bset TIM2_CR1,#TIM2_CR1_CEN
      009790 02 27 03 CC      [ 1] 4503 	bset TIM2_EGR,#TIM2_EGR_UG
      009794 89               [ 2] 4504 	popw x 
      009795 7A 1E C6         [ 4] 4505 	call pause02
      009796 72 11 53 08      [ 1] 4506 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009796 85 9F A4 07      [ 1] 4507 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00979A 88               [ 4] 4508 	ret 
                                   4509 
                                   4510 ;-------------------------------
                                   4511 ; BASIC: ADCON 0|1 [,divisor]  
                                   4512 ; disable/enanble ADC 
                                   4513 ;-------------------------------
                           000003  4514 	ONOFF=3 
                           000001  4515 	DIVSOR=1
                           000004  4516 	VSIZE=4 
      00194D                       4517 power_adc:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      00979B A6 01 0D         [ 4] 4518 	call arg_list 
      00979E 01 27            [ 1] 4519 	cp a,#2	
      0097A0 05 48            [ 1] 4520 	jreq 1$
      0097A2 0A 01            [ 1] 4521 	cp a,#1 
      0097A4 20 F7            [ 1] 4522 	jreq 0$ 
      0097A6 5B 01 85         [ 2] 4523 	jp syntax_error 
      0097A9 F4 27 02         [ 2] 4524 0$: ldw x,#0
      0097AC A6               [ 2] 4525 	pushw x  ; divisor 
      0097AD 01 5F            [ 2] 4526 1$: ldw x,(ONOFF,sp)
      0097AF 97               [ 2] 4527 	tnzw x 
      0097B0 A6 84            [ 1] 4528 	jreq 2$ 
      0097B2 81 01            [ 2] 4529 	ldw x,(DIVSOR,sp) ; divisor 
      0097B3 9F               [ 1] 4530 	ld a,xl
      0097B3 CD 91            [ 1] 4531 	and a,#7
      0097B5 52               [ 1] 4532 	swap a 
      0097B6 A1 02 27         [ 1] 4533 	ld ADC_CR1,a
      0097B9 03 CC 89 7A      [ 1] 4534 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0097BD 72 10 54 01      [ 1] 4535 	bset ADC_CR1,#ADC_CR1_ADON 
      001975                       4536 	_usec_dly 7 
      0097BD 85 9F 85         [ 2]    1     ldw x,#(16*7-2)/4
      0097C0 F7               [ 2]    2     decw x
      0097C1 81               [ 1]    3     nop 
      0097C2 26 FA            [ 1]    4     jrne .-4
      0097C2 CD 91            [ 2] 4537 	jra 3$
      0097C4 4D A1 01 27      [ 1] 4538 2$: bres ADC_CR1,#ADC_CR1_ADON
      0097C8 03 CC 89 7A      [ 1] 4539 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001986                       4540 3$:	_drop VSIZE 
      0097CC 85 F6            [ 2]    1     addw sp,#VSIZE 
      0097CE 5F               [ 4] 4541 	ret
                                   4542 
                                   4543 ;-----------------------------
                                   4544 ; BASIC: ADCREAD (channel)
                                   4545 ; read adc channel {0..5}
                                   4546 ; output:
                                   4547 ;   A 		TK_INTGR 
                                   4548 ;   X 		value 
                                   4549 ;-----------------------------
      001989                       4550 analog_read:
      0097CF 97 A6 84         [ 4] 4551 	call func_args 
      0097D2 81 01            [ 1] 4552 	cp a,#1 
      0097D3 27 03            [ 1] 4553 	jreq 1$
      0097D3 CD 92 9D         [ 2] 4554 	jp syntax_error
      0097D6 A1               [ 2] 4555 1$: popw x 
      0097D7 84 27 03         [ 2] 4556 	cpw x,#5 
      0097DA CC 89            [ 2] 4557 	jrule 2$
      0097DC 7A 4F            [ 1] 4558 	ld a,#ERR_BAD_VALUE
      0097DE 5D 26 05         [ 2] 4559 	jp tb_error 
      0097E1 55               [ 1] 4560 2$: ld a,xl
      0097E2 00 04 00         [ 1] 4561 	ld acc8,a 
      0097E5 02 81            [ 1] 4562 	ld a,#5
      0097E7 C0 00 0D         [ 1] 4563 	sub a,acc8 
      0097E7 85 52 0A         [ 1] 4564 	ld ADC_CSR,a
      0097EA 89 A6 85 CD      [ 1] 4565 	bset ADC_CR2,#ADC_CR2_ALIGN
      0097EE 91 40 1F 07      [ 1] 4566 	bset ADC_CR1,#ADC_CR1_ADON
      0097F2 CD 93 7D 72 14   [ 2] 4567 	btjf ADC_CSR,#ADC_CSR_EOC,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0097F7 00 24 5F         [ 2] 4568 	ldw x,ADC_DRH
      0097FA 1F 0B            [ 1] 4569 	ld a,#TK_INTGR
      0097FC 1F               [ 4] 4570 	ret 
                                   4571 
                                   4572 ;-----------------------
                                   4573 ; BASIC: DREAD(pin)
                                   4574 ; Arduino pins 
                                   4575 ; read state of a digital pin 
                                   4576 ; pin# {0..15}
                                   4577 ; output:
                                   4578 ;    A 		TK_INTGR
                                   4579 ;    X      0|1 
                                   4580 ;-------------------------
                           000001  4581 	PINNO=1
                           000001  4582 	VSIZE=1
      0019BD                       4583 digital_read:
      0019BD                       4584 	_vars VSIZE 
      0097FD 09 CD            [ 2]    1     sub sp,#VSIZE 
      0097FF 8A 6C A1         [ 4] 4585 	call func_args
      009802 80 27            [ 1] 4586 	cp a,#1
      009804 03 CC            [ 1] 4587 	jreq 1$
      009806 89 7A FA         [ 2] 4588 	jp syntax_error
      009808 85               [ 2] 4589 1$: popw x 
      009808 A3 98 10         [ 2] 4590 	cpw x,#15 
      00980B 27 03            [ 2] 4591 	jrule 2$
      00980D CC 89            [ 1] 4592 	ld a,#ERR_BAD_VALUE
      00980F 7A 08 FC         [ 2] 4593 	jp tb_error 
      009810 CD 20 04         [ 4] 4594 2$:	call select_pin 
      009810 72 04            [ 1] 4595 	ld (PINNO,sp),a
      009812 00 24            [ 1] 4596 	ld a,(GPIO_IDR,x)
      009814 03 CC            [ 1] 4597 	tnz (PINNO,sp)
      009816 89 7A            [ 1] 4598 	jreq 8$
      009818 CD               [ 1] 4599 3$: srl a 
      009819 92 9D            [ 1] 4600 	dec (PINNO,sp)
      00981B A1 84            [ 1] 4601 	jrne 3$ 
      00981D 27 03            [ 1] 4602 8$: and a,#1 
      00981F CC               [ 1] 4603 	clrw x 
      009820 89               [ 1] 4604 	ld xl,a 
      009821 7A 1F            [ 1] 4605 	ld a,#TK_INTGR
      0019EA                       4606 	_drop VSIZE
      009823 05 CD            [ 2]    1     addw sp,#VSIZE 
      009825 8A               [ 4] 4607 	ret
                                   4608 
                                   4609 ;-----------------------
                                   4610 ; BASIC: DWRITE pin,0|1
                                   4611 ; Arduino pins 
                                   4612 ; write to a digital pin 
                                   4613 ; pin# {0..15}
                                   4614 ; output:
                                   4615 ;    A 		TK_INTGR
                                   4616 ;    X      0|1 
                                   4617 ;-------------------------
                           000001  4618 	PINNO=1
                           000002  4619 	PINVAL=2
                           000002  4620 	VSIZE=2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0019ED                       4621 digital_write:
      0019ED                       4622 	_vars VSIZE 
      009826 6C A1            [ 2]    1     sub sp,#VSIZE 
      009828 00 27 0E         [ 4] 4623 	call arg_list  
      00982B A1 80            [ 1] 4624 	cp a,#2 
      00982D 26 05            [ 1] 4625 	jreq 1$
      00982F A3 98 40         [ 2] 4626 	jp syntax_error
      009832 27               [ 2] 4627 1$: popw x 
      009833 0C               [ 1] 4628 	ld a,xl 
      009834 6B 02            [ 1] 4629 	ld (PINVAL,sp),a
      009834 55               [ 2] 4630 	popw x 
      009835 00 03 00         [ 2] 4631 	cpw x,#15 
      009838 02 05            [ 2] 4632 	jrule 2$
      009839 A6 0A            [ 1] 4633 	ld a,#ERR_BAD_VALUE
      009839 AE 00 01         [ 2] 4634 	jp tb_error 
      00983C 1F 03 20         [ 4] 4635 2$:	call select_pin 
      00983F 14 01            [ 1] 4636 	ld (PINNO,sp),a 
      009840 A6 01            [ 1] 4637 	ld a,#1
      009840 72 04            [ 1] 4638 	tnz (PINNO,sp)
      009842 00 24            [ 1] 4639 	jreq 4$
      009844 03               [ 1] 4640 3$: sll a
      009845 CC 89            [ 1] 4641 	dec (PINNO,sp)
      009847 7A CD            [ 1] 4642 	jrne 3$
      009849 92 9D            [ 1] 4643 4$: tnz (PINVAL,sp)
      00984B A1 84            [ 1] 4644 	jrne 5$
      00984D 27               [ 1] 4645 	cpl a 
      00984E 03 CC            [ 1] 4646 	and a,(GPIO_ODR,x)
      009850 89 7A            [ 2] 4647 	jra 8$
      009852 1F 03            [ 1] 4648 5$: or a,(GPIO_ODR,x)
      009854 E7 00            [ 1] 4649 8$: ld (GPIO_ODR,x),a 
      001A25                       4650 	_drop VSIZE 
      009854 CE 00            [ 2]    1     addw sp,#VSIZE 
      009856 05               [ 4] 4651 	ret
                                   4652 
                                   4653 
                                   4654 ;-----------------------
                                   4655 ; BASIC: STOP
                                   4656 ; stop progam execution  
                                   4657 ; without resetting pointers 
                                   4658 ; the program is resumed
                                   4659 ; with RUN 
                                   4660 ;-------------------------
      001A28                       4661 stop:
      009857 1F 0B CE 00 01   [ 2] 4662 	btjt flags,#FRUN,2$
      00985C 1F               [ 1] 4663 	clr a
      00985D 09               [ 4] 4664 	ret 
      001A2F                       4665 2$:	 
                                   4666 ; create space on cstack to save context 
      00985E 72 15 00         [ 2] 4667 	ldw x,#break_point 
      009861 24 72 5C         [ 4] 4668 	call puts 
      001A35                       4669 	_drop 2 ;drop return address 
      009864 00 21            [ 2]    1     addw sp,#2 
      001A37                       4670 	_vars CTXT_SIZE ; context size 
      009866 81 04            [ 2]    1     sub sp,#CTXT_SIZE 
      009867 CD 16 24         [ 4] 4671 	call save_context 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009867 72 5D 00         [ 2] 4672 	ldw x,#tib 
      00986A 21 26 03         [ 2] 4673 	ldw basicptr,x
      00986D CC               [ 1] 4674 	clr (x)
      00986E 89 7A 00 03      [ 1] 4675 	clr count  
      009870 5F               [ 1] 4676 	clrw x 
      009870 A6 85 CD         [ 2] 4677 	ldw in.w,x
      009873 91 40 13 07      [ 1] 4678 	bres flags,#FRUN 
      009877 27 03 CC 89      [ 1] 4679 	bset flags,#FBREAK
      00987B 7A 09 A0         [ 2] 4680 	jp interpreter 
      00987C 0A 62 72 65 61 6B 20  4681 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4682 
                                   4683 ;-----------------------
                                   4684 ; BASIC: NEW
                                   4685 ; from command line only 
                                   4686 ; free program memory
                                   4687 ; and clear variables 
                                   4688 ;------------------------
      001A74                       4689 new: 
      00987C FE 72 FB 03 16   [ 2] 4690 	btjf flags,#FRUN,0$ 
      009881 07               [ 4] 4691 	ret 
      001A7A                       4692 0$:	
      009882 90 FF A6         [ 4] 4693 	call clear_basic 
      009885 80               [ 4] 4694 	ret 
                                   4695 	 
                                   4696 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4697 ;  file system routines
                                   4698 ;  MCU flash memory from
                                   4699 ;  0x10000-0x27fff is 
                                   4700 ;  used to store BASIC 
                                   4701 ;  program files. 
                                   4702 ;  use 128 bytes sectors
                                   4703 ;  because this is the MCU 
                                   4704 ;  row size.
                                   4705 ;  file entry aligned to row
                                   4706 ;  	name  variable length
                                   4707 ;  	size  2 bytes  
                                   4708 ; 	data  variable length 
                                   4709 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4710 
                                   4711 ;---------------------------
                                   4712 ; fill pad with zeros 
                                   4713 ;--------------------------
      001A7E                       4714 zero_pad:
      009886 15 03 2A         [ 2] 4715 	ldw x,#pad 
      009889 06 13            [ 1] 4716 	ld a,#PAD_SIZE 
      00988B 05               [ 1] 4717 1$:	clr (x)
      00988C 2F               [ 1] 4718 	incw x 
      00988D 1B               [ 1] 4719 	dec a 
      00988E 20 04            [ 1] 4720 	jrne 1$
      009890 81               [ 4] 4721 	ret 
                                   4722 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4723 ;--------------------------
                                   4724 ; align farptr to BLOCK_SIZE 
                                   4725 ;---------------------------
      001A89                       4726 row_align:
      009890 13 05            [ 1] 4727 	ld a,#0x7f 
      009892 2C 15 18         [ 1] 4728 	and a,farptr+2 
      009894 27 13            [ 1] 4729 	jreq 1$ 
      009894 1E 0B CF         [ 2] 4730 	ldw x,farptr+1 
      009897 00 05 72         [ 2] 4731 	addw x,#BLOCK_SIZE 
      00989A 01 00            [ 1] 4732 	jrnc 0$
      00989C 24 05 E6 02      [ 1] 4733 	inc farptr 
      0098A0 C7               [ 1] 4734 0$: ld a,xl 
      0098A1 00 04            [ 1] 4735 	and a,#0x80
      0098A3 1E               [ 1] 4736 	ld xl,a
      0098A4 09 CF 00         [ 2] 4737 	ldw farptr+1,x  	
      0098A7 01               [ 4] 4738 1$:	ret
                                   4739 
                                   4740 ;--------------------
                                   4741 ; input:
                                   4742 ;   X     increment 
                                   4743 ; output:
                                   4744 ;   farptr  incremented 
                                   4745 ;---------------------
      001AA4                       4746 incr_farptr:
      0098A8 81 BB 00 17      [ 2] 4747 	addw x,farptr+1 
      0098A9 24 04            [ 1] 4748 	jrnc 1$
      0098A9 85 5B 0A 72      [ 1] 4749 	inc farptr 
      0098AD 5A 00 21         [ 2] 4750 1$:	ldw farptr+1,x  
      0098B0 FC               [ 4] 4751 	ret 
                                   4752 
                                   4753 ;------------------------------
                                   4754 ; extended flash memory used as FLASH_DRIVE 
                                   4755 ; seek end of used flash drive   
                                   4756 ; starting at 0x10000 address.
                                   4757 ; 4 consecutives 0 bytes signal free space. 
                                   4758 ; input:
                                   4759 ;	none
                                   4760 ; output:
                                   4761 ;   ffree     free_addr| 0 if memory full.
                                   4762 ;------------------------------
      0098B1                       4763 seek_fdrive:
                                   4764 ; start scan at 0x10000 address 
      0098B1 CD 92            [ 1] 4765 	ld a,#1
      0098B3 9D A1 84         [ 1] 4766 	ld farptr,a 
      0098B6 27               [ 1] 4767 	clrw x 
      0098B7 03 CC 89         [ 2] 4768 	ldw farptr+1,x 
      001ABB                       4769 1$:
      0098BA 7A CD 84         [ 2] 4770 	ldw x,#3  
      0098BD F6 5D 26 05      [ 5] 4771 2$:	ldf a,([farptr],x) 
      0098C1 A6 05            [ 1] 4772 	jrne 3$
      0098C3 CC               [ 2] 4773 	decw x
      0098C4 89 7C            [ 1] 4774 	jrpl 2$
      0098C6 81 0E            [ 2] 4775 	jra 4$ 
      0098C7 AE 00 80         [ 2] 4776 3$:	ldw x,#BLOCK_SIZE 
      0098C7 72 00 00         [ 4] 4777 	call incr_farptr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0098CA 24 06 A6         [ 2] 4778 	ldw x,#0x280  
      0098CD 06 CC 89         [ 2] 4779 	cpw x,farptr
      0098D0 7C 81            [ 1] 4780 	jrmi 1$
      001AD7                       4781 4$: ; copy farptr to ffree	 
      0098D2 CD 98 B1         [ 2] 4782 	ldw x,farptr 
      0098D5 C6 00 18         [ 1] 4783 	ld a,farptr+2 
      0098D5 CF 00 05         [ 2] 4784 	ldw ffree,x 
      0098D8 E6 02 C7         [ 1] 4785 	ld ffree+2,a  
      0098DB 00               [ 4] 4786 	ret 
                                   4787 
                                   4788 ;-----------------------
                                   4789 ; return amount of free 
                                   4790 ; space on flash drive
                                   4791 ; input:
                                   4792 ;   none
                                   4793 ; output:
                                   4794 ;   acc24   free space 
                                   4795 ;-----------------------
      001AE4                       4796 disk_free:
      0098DC 04 35 03         [ 2] 4797 	ldw x,#0x8000
      0098DF 00 02 81 1A      [ 2] 4798 	subw x,ffree+1
      0098E2 A6 02            [ 1] 4799 	ld a,#2
      0098E2 72 00 00         [ 1] 4800 	sbc a,ffree 
      0098E5 24 06 A6         [ 1] 4801 	ld acc24,a 
      0098E8 06 CC 89         [ 2] 4802 	ldw acc16,x 
      0098EB 7C               [ 4] 4803 	ret 
                                   4804 
                                   4805 ;-----------------------
                                   4806 ; compare file name 
                                   4807 ; with name pointed by Y  
                                   4808 ; input:
                                   4809 ;   farptr   file name 
                                   4810 ;   Y        target name 
                                   4811 ; output:
                                   4812 ;   farptr 	 at file_name
                                   4813 ;   X 		 farptr[x] point at size field  
                                   4814 ;   Carry    0|1 no match|match  
                                   4815 ;----------------------
      001AF7                       4816 cmp_name:
      0098EC 81               [ 1] 4817 	clrw x
      0098ED 85 52 04 89      [ 5] 4818 1$:	ldf a,([farptr],x)
      0098F1 CE 00            [ 1] 4819 	cp a,(y)
      0098F3 05 1F            [ 1] 4820 	jrne 4$
      0098F5 03               [ 1] 4821 	tnz a 
      0098F6 CD 98            [ 1] 4822 	jreq 9$ 
      0098F8 B1               [ 1] 4823     incw x 
      0098F9 89 CE            [ 1] 4824 	incw y 
      0098FB 00 01            [ 2] 4825 	jra 1$
      001B08                       4826 4$: ;no match 
      0098FD 1F               [ 1] 4827 	tnz a 
      0098FE 07 85            [ 1] 4828 	jreq 5$
      009900 20               [ 1] 4829 	incw x 
      009901 D3 AF 00 16      [ 5] 4830 	ldf a,([farptr],x)
      009902 20 F6            [ 2] 4831 	jra 4$  
      009902 72               [ 1] 4832 5$:	incw x ; farptr[x] point at 'size' field 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009903 00               [ 1] 4833 	rcf 
      009904 00               [ 4] 4834 	ret
      001B15                       4835 9$: ; match  
      009905 24               [ 1] 4836 	incw x  ; farptr[x] at 'size' field 
      009906 05               [ 1] 4837 	scf 
      009907 A6               [ 4] 4838 	ret 
                                   4839 
                                   4840 ;-----------------------
                                   4841 ; search file in 
                                   4842 ; flash memory 
                                   4843 ; input:
                                   4844 ;   Y       file name  
                                   4845 ; output:
                                   4846 ;   farptr  addr at name|0
                                   4847 ;   X       offset to size field
                                   4848 ;-----------------------
                           000001  4849 	FSIZE=1
                           000003  4850 	YSAVE=3
                           000004  4851 	VSIZE=4 
      001B18                       4852 search_file: 
      001B18                       4853 	_vars VSIZE
      009908 06 CC            [ 2]    1     sub sp,#VSIZE 
      00990A 89 7C            [ 2] 4854 	ldw (YSAVE,sp),y  
      00990C 5F               [ 1] 4855 	clrw x 
      00990C 1E 03 CF         [ 2] 4856 	ldw farptr+1,x 
      00990F 00 05 E6 02      [ 1] 4857 	mov farptr,#1
      001B24                       4858 1$:	
                                   4859 ; check if farptr is after any file 
                                   4860 ; if  0 then so.
      009913 C7 00 04 1E      [ 5] 4861 	ldf a,[farptr]
      009917 05 CF            [ 1] 4862 	jreq 6$
      009919 00               [ 1] 4863 2$: clrw x 	
      00991A 01 85            [ 2] 4864 	ldw y,(YSAVE,sp) 
      00991C 5B 04 89         [ 4] 4865 	call cmp_name
      00991F 81 2F            [ 1] 4866 	jrc 9$
      009920 92 AF 00 16      [ 5] 4867 	ldf a,([farptr],x)
      009920 72 01            [ 1] 4868 	ld (FSIZE,sp),a 
      009922 00               [ 1] 4869 	incw x 
      009923 24 02 4F 81      [ 5] 4870 	ldf a,([farptr],x)
      009927 6B 02            [ 1] 4871 	ld (FSIZE+1,sp),a 
      009927 72               [ 1] 4872 	incw x 
      009928 09 00 24         [ 2] 4873 	addw x,(FSIZE,sp) ; skip over file data
      00992B 12 5B 02         [ 4] 4874 	call incr_farptr
      00992E CD 96 B4         [ 4] 4875 	call row_align  
      009931 5B 04 72         [ 2] 4876 	ldw x,#0x280
      009934 19 00 24         [ 2] 4877 	cpw x,farptr 
      009937 72 10            [ 1] 4878 	jrpl 1$
      001B51                       4879 6$: ; file not found 
      009939 00 24 CC 8A      [ 1] 4880 	clr farptr
      00993D 20 CE 00 1D      [ 1] 4881 	clr farptr+1 
      009941 C3 00 1F 2B      [ 1] 4882 	clr farptr+2 
      001B5D                       4883 	_drop VSIZE 
      009945 0C AE            [ 2]    1     addw sp,#VSIZE 
      009947 89               [ 1] 4884 	rcf
      009948 13               [ 4] 4885 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      001B61                       4886 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001B61                       4887 	_drop VSIZE 
      009949 CD AA            [ 2]    1     addw sp,#VSIZE 
      00994B C0               [ 1] 4888 	scf 	
      00994C 55               [ 4] 4889 	ret
                                   4890 
                                   4891 ;--------------------------------
                                   4892 ; BASIC: SAVE "name" 
                                   4893 ; save text program in 
                                   4894 ; flash memory used as permanent
                                   4895 ; storage from address 0x10000-0x27fff 
                                   4896 ;--------------------------------
                           000001  4897 	BSIZE=1
                           000003  4898 	NAMEPTR=3
                           000005  4899 	XSAVE=5
                           000007  4900 	YSAVE=7
                           000008  4901 	VSIZE=8 
      001B65                       4902 save:
      00994D 00 04 00 02 81   [ 2] 4903 	btjf flags,#FRUN,0$ 
      009952 A6 07            [ 1] 4904 	ld a,#ERR_CMD_ONLY 
      009952 CD 93 4A         [ 2] 4905 	jp tb_error
      001B6F                       4906 0$:	 
      009955 5B 02 5F         [ 2] 4907 	ldw x,txtend 
      009958 CF 00 07 72      [ 2] 4908 	subw x,txtbgn
      00995C 5F 00            [ 1] 4909 	jrne 1$
                                   4910 ; nothing to save 
      00995E 09 72 5F         [ 2] 4911 	ldw x,#err_no_prog 
      009961 00 0A CE         [ 4] 4912 	call puts 
      009964 00 1D CF 00 05   [ 1] 4913 	mov in,count 
      009969 E6               [ 4] 4914 	ret  	
      001B84                       4915 1$:	
      001B84                       4916 	_vars VSIZE 
      00996A 02 C7            [ 2]    1     sub sp,#VSIZE 
      00996C 00 04            [ 2] 4917 	ldw (BSIZE,sp),x 
      00996E 35 03 00         [ 4] 4918 	call next_token	
      009971 02 72            [ 1] 4919 	cp a,#TK_QSTR
      009973 10 00            [ 1] 4920 	jreq 2$
      009975 24 CC 8A         [ 2] 4921 	jp syntax_error
      001B92                       4922 2$: 
      009978 20 03            [ 2] 4923 	ldw (NAMEPTR,sp),x  
      009979 CD 01 83         [ 4] 4924 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4925 ; check if enough free space 
      009979 AE 17 FF         [ 4] 4926 	call strlen 
      00997C 94 CC            [ 1] 4927 	add a,#3
      00997E 8A               [ 1] 4928 	clrw x 
      00997F 01               [ 1] 4929 	ld xl,a 
      009980 72 FB 01         [ 2] 4930 	addw x,(BSIZE,sp)
      009980 AE               [ 1] 4931 	clr a 
      009981 00 64 90 AE      [ 2] 4932 	addw x,ffree+1 
      009985 03 E8 20         [ 1] 4933 	adc a,ffree 
      009988 0D 02            [ 1] 4934 	cp a,#2
      009989 2B 0A            [ 1] 4935 	jrmi 21$
      009989 CD 91 52         [ 2] 4936 	cpw x,#0x8000
      00998C A1 02            [ 1] 4937 	jrmi 21$
      00998E 27 03            [ 1] 4938 	ld a,#ERR_NO_FSPACE  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009990 CC 89 7A         [ 2] 4939 	jp tb_error
      009993                       4940 21$: 
                                   4941 ; check for existing file of that name 
      009993 85 90            [ 2] 4942 	ldw y,(NAMEPTR,sp)	
      009995 85 1B 18         [ 4] 4943 	call search_file 
      009996 24 05            [ 1] 4944 	jrnc 3$ 
      009996 89 AE            [ 1] 4945 	ld a,#ERR_DUPLICATE 
      009998 F4 24 65         [ 2] 4946 	jp tb_error 
      001BC3                       4947 3$:	; initialize farptr 
      00999B 90 A3 7A         [ 2] 4948 	ldw x,ffree 
      00999E 12 2B 01         [ 1] 4949 	ld a,ffree+2 
      0099A1 5C 00 16         [ 2] 4950 	ldw farptr,x 
      0099A2 C7 00 18         [ 1] 4951 	ld farptr+2,a 
                                   4952 ;** write file name to row buffer **	
      0099A2 9E C7            [ 2] 4953 	ldw y,(NAMEPTR,sp)  
      0099A4 53 0D 9F         [ 2] 4954 	ldw x,#pad 
      0099A7 C7 53 0E         [ 4] 4955 	call strcpy
      0099AA 8C 56 9E         [ 4] 4956 	call strlen 
      0099AD C7               [ 1] 4957 	clrw x 
      0099AE 53               [ 1] 4958 	ld xl,a 
      0099AF 0F               [ 1] 4959 	incw  x
      0099B0 9F C7 53         [ 2] 4960 	addw x,#pad 
                                   4961 ; ** write file size to row buffer 
      0099B3 10 72            [ 2] 4962 	ldw y,(BSIZE,sp)
      0099B5 10               [ 2] 4963 	ldw (x),y 
      0099B6 53 08 72         [ 2] 4964 	addw x,#2 
                                   4965 ; ** write file data to row buffer 
      0099B9 10 53 00 72      [ 2] 4966 	ldw y,txtbgn 
      0099BD 10 53            [ 1] 4967 6$:	ld a,(y)
      0099BF 04 85            [ 1] 4968 	incw y
      0099C1 CD               [ 1] 4969 	ld (x),a 
      0099C2 9F               [ 1] 4970 	incw x
      0099C3 46 72 11 53      [ 2] 4971 	cpw y,txtend 
      0099C7 08 72            [ 1] 4972 	jreq 12$
      0099C9 11 53 00         [ 2] 4973 	cpw x,#stack_full 
      0099CC 81 EF            [ 1] 4974 	jrmi 6$
      0099CD                       4975 12$:
      0099CD CD 91            [ 2] 4976 	ldw (YSAVE,sp),y 
      001BFD                       4977 14$: ; zero buffer end 
      0099CF 52 A1 02         [ 2] 4978 	cpw x,#stack_full
      0099D2 27 0B            [ 1] 4979 	jreq 16$
      0099D4 A1               [ 1] 4980 	clr (x)
      0099D5 01               [ 1] 4981 	incw x 
      0099D6 27 03            [ 2] 4982 	jra 14$
      001C06                       4983 16$:
      0099D8 CC 89 7A         [ 2] 4984 	ldw x,#pad 
      0099DB AE 00 00         [ 4] 4985 	call write_row 
      0099DE 89 1E 03         [ 2] 4986 	ldw x,#BLOCK_SIZE 
      0099E1 5D 27 1A         [ 4] 4987 	call incr_farptr
      0099E4 1E 01 9F         [ 2] 4988 	ldw x,#pad 
      0099E7 A4 07            [ 2] 4989 	ldw y,(YSAVE,sp)
      0099E9 4E C7 54 01      [ 2] 4990 	cpw y,txtend 
      0099ED 72 16            [ 1] 4991 	jrmi 6$
                                   4992 ; save farptr in ffree
      0099EF 50 CA 72         [ 2] 4993 	ldw x,farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0099F2 10 54 01         [ 1] 4994 	ld a,farptr+2 
      0099F5 AE 00 1B         [ 2] 4995 	ldw ffree,x 
      0099F8 5A 9D 26         [ 1] 4996 	ld ffree+2,a
                                   4997 ; print file size 	
      0099FB FA 20            [ 2] 4998 	ldw x,(BSIZE,sp) 
      0099FD 08 72 11         [ 4] 4999 	call print_int 
      001C2E                       5000 	_drop VSIZE 
      009A00 54 01            [ 2]    1     addw sp,#VSIZE 
      009A02 72               [ 4] 5001 	ret 
                                   5002 
                                   5003 ;----------------------
                                   5004 ; load file in RAM memory
                                   5005 ; input:
                                   5006 ;    farptr point at file size 
                                   5007 ; output:
                                   5008 ;   y point after BASIC program in RAM.
                                   5009 ;------------------------
      001C31                       5010 load_file:
      009A03 17 50 CA         [ 4] 5011 	call incr_farptr  
      009A06 5B 04 81         [ 4] 5012 	call clear_basic  
      009A09 5F               [ 1] 5013 	clrw x
      009A09 CD 91 4D A1      [ 5] 5014 	ldf a,([farptr],x)
      009A0D 01 27            [ 1] 5015 	ld yh,a 
      009A0F 03               [ 1] 5016 	incw x  
      009A10 CC 89 7A 85      [ 5] 5017 	ldf a,([farptr],x)
      009A14 A3               [ 1] 5018 	incw x 
      009A15 00 05            [ 1] 5019 	ld yl,a 
      009A17 23 05 A6 0A      [ 2] 5020 	addw y,txtbgn
      009A1B CC 89 7C 9F      [ 2] 5021 	ldw txtend,y
      009A1F C7 00 0E A6      [ 2] 5022 	ldw y,txtbgn
      001C52                       5023 3$:	; load BASIC text 	
      009A23 05 C0 00 0E      [ 5] 5024 	ldf a,([farptr],x)
      009A27 C7 54            [ 1] 5025 	ld (y),a 
      009A29 00               [ 1] 5026 	incw x 
      009A2A 72 16            [ 1] 5027 	incw y 
      009A2C 54 02 72 10      [ 2] 5028 	cpw y,txtend 
      009A30 54 01            [ 1] 5029 	jrmi 3$
      009A32 72               [ 4] 5030 	ret 
                                   5031 
                                   5032 ;------------------------
                                   5033 ; BASIC: LOAD "file" 
                                   5034 ; load file to RAM 
                                   5035 ; for execution 
                                   5036 ;------------------------
      001C62                       5037 load:
      009A33 0F 54 00 FB CE   [ 2] 5038 	btjf flags,#FRUN,0$ 
      009A38 54 04            [ 1] 5039 	jreq 0$ 
      009A3A A6 84            [ 1] 5040 	ld a,#ERR_CMD_ONLY 
      009A3C 81 08 FC         [ 2] 5041 	jp tb_error 
      009A3D                       5042 0$:	
      009A3D 52 01 CD         [ 4] 5043 	call next_token 
      009A40 91 4D            [ 1] 5044 	cp a,#TK_QSTR
      009A42 A1 01            [ 1] 5045 	jreq 1$
      009A44 27 03 CC         [ 2] 5046 	jp syntax_error 
      009A47 89 7A            [ 1] 5047 1$:	ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A49 85 A3 00         [ 4] 5048 	call search_file 
      009A4C 0F 23            [ 1] 5049 	jrc 2$ 
      009A4E 05 A6            [ 1] 5050 	ld a,#ERR_NOT_FILE
      009A50 0A CC 89         [ 2] 5051 	jp tb_error  
      001C84                       5052 2$:
      009A53 7C CD A0         [ 4] 5053 	call load_file
                                   5054 ; print loaded size 	 
      009A56 84 6B 01         [ 2] 5055 	ldw x,txtend 
      009A59 E6 01 0D 01      [ 2] 5056 	subw x,txtbgn
      009A5D 27 05 44         [ 4] 5057 	call print_int 
      009A60 0A               [ 4] 5058 	ret 
                                   5059 
                                   5060 ;-----------------------------------
                                   5061 ; BASIC: FORGET ["file_name"] 
                                   5062 ; erase file_name and all others 
                                   5063 ; after it. 
                                   5064 ; without argument erase all files 
                                   5065 ;-----------------------------------
                           000001  5066 	NEW_FREE=1 
                           000003  5067 	VSIZE=3 
      001C92                       5068 forget:
      001C92                       5069 	_vars VSIZE 
      009A61 01 26            [ 2]    1     sub sp,#VSIZE 
      009A63 FB A4 01         [ 4] 5070 	call next_token 
      009A66 5F 97            [ 1] 5071 	cp a,#TK_NONE 
      009A68 A6 84            [ 1] 5072 	jreq 3$ 
      009A6A 5B 01            [ 1] 5073 	cp a,#TK_QSTR
      009A6C 81 03            [ 1] 5074 	jreq 1$
      009A6D CC 08 FA         [ 2] 5075 	jp syntax_error
      009A6D 52 02            [ 1] 5076 1$: ldw y,x 
      009A6F CD 91 52 A1 02   [ 1] 5077 	mov in,count 
      009A74 27 03 CC         [ 4] 5078 	call search_file
      009A77 89 7A            [ 1] 5079 	jrc 2$
      009A79 85 9F            [ 1] 5080 	ld a,#ERR_NOT_FILE 
      009A7B 6B 02 85         [ 2] 5081 	jp tb_error 
      001CB3                       5082 2$: 
      009A7E A3 00 0F         [ 2] 5083 	ldw x,farptr
      009A81 23 05 A6         [ 1] 5084 	ld a,farptr+2
      009A84 0A CC            [ 2] 5085 	jra 4$ 
      001CBB                       5086 3$: ; forget all files 
      009A86 89 7C CD         [ 2] 5087 	ldw x,#0x100
      009A89 A0               [ 1] 5088 	clr a 
      009A8A 84 6B 01         [ 2] 5089 	ldw farptr,x 
      009A8D A6 01 0D         [ 1] 5090 	ld farptr+2,a 
      001CC5                       5091 4$:	; save new free address 
      009A90 01 27            [ 2] 5092 	ldw (NEW_FREE,sp),x
      009A92 05 48            [ 1] 5093 	ld (NEW_FREE+2,sp),a 
      009A94 0A 01 26         [ 4] 5094 	call move_erase_to_ram
      009A97 FB 0D 02         [ 4] 5095 5$: call block_erase 
      009A9A 26 05 43         [ 2] 5096 	ldw x,#BLOCK_SIZE 
      009A9D E4 00 20         [ 4] 5097 	call incr_farptr 
      009AA0 02 EA 00         [ 4] 5098 	call row_align 
                                   5099 ; check if all blocks erased
      009AA3 E7 00 5B         [ 1] 5100 	ld a,farptr+2  
      009AA6 02 81 1B         [ 1] 5101 	sub a,ffree+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009AA8 C6 00 17         [ 1] 5102 	ld a,farptr+1 
      009AA8 72 00 00         [ 1] 5103 	sbc a,ffree+1 
      009AAB 24 02 4F         [ 1] 5104 	ld a,farptr 
      009AAE 81 00 19         [ 1] 5105 	sbc a,ffree 
      009AAF 2B E0            [ 1] 5106 	jrmi 5$ 
      009AAF AE 9A            [ 1] 5107 	ld a,(NEW_FREE+2,sp)
      009AB1 D6 CD            [ 2] 5108 	ldw x,(NEW_FREE,sp)
      009AB3 AA C0 5B         [ 1] 5109 	ld ffree+2,a 
      009AB6 02 52 04         [ 2] 5110 	ldw ffree,x 
      001CF6                       5111 	_drop VSIZE 
      009AB9 CD 96            [ 2]    1     addw sp,#VSIZE 
      009ABB A4               [ 4] 5112 	ret 
                                   5113 
                                   5114 ;----------------------
                                   5115 ; BASIC: DIR 
                                   5116 ; list saved files 
                                   5117 ;----------------------
                           000001  5118 	COUNT=1 ; files counter 
                           000002  5119 	VSIZE=2 
      001CF9                       5120 directory:
      001CF9                       5121 	_vars VSIZE 
      009ABC AE 16            [ 2]    1     sub sp,#VSIZE 
      009ABE 90               [ 1] 5122 	clrw x 
      009ABF CF 00            [ 2] 5123 	ldw (COUNT,sp),x 
      009AC1 05 7F 72         [ 2] 5124 	ldw farptr+1,x 
      009AC4 5F 00 04 5F      [ 1] 5125 	mov farptr,#1 
      001D05                       5126 dir_loop:
      009AC8 CF               [ 1] 5127 	clrw x 
      009AC9 00 01 72 11      [ 5] 5128 	ldf a,([farptr],x)
      009ACD 00 24            [ 1] 5129 	jreq 8$ 
      001D0C                       5130 1$: ;name loop 	
      009ACF 72 18 00 24      [ 5] 5131 	ldf a,([farptr],x)
      009AD3 CC 8A            [ 1] 5132 	jreq 2$ 
      009AD5 20 0A 62         [ 4] 5133 	call putc 
      009AD8 72               [ 1] 5134 	incw x 
      009AD9 65 61            [ 2] 5135 	jra 1$
      009ADB 6B               [ 1] 5136 2$: incw x ; skip ending 0. 
      009ADC 20 70            [ 1] 5137 	ld a,#SPACE 
      009ADE 6F 69 6E         [ 4] 5138 	call putc 
                                   5139 ; get file size 	
      009AE1 74 2C 20 52      [ 5] 5140 	ldf a,([farptr],x)
      009AE5 55 4E            [ 1] 5141 	ld yh,a 
      009AE7 20               [ 1] 5142 	incw x 
      009AE8 74 6F 20 72      [ 5] 5143 	ldf a,([farptr],x)
      009AEC 65               [ 1] 5144 	incw x 
      009AED 73 75            [ 1] 5145 	ld yl,a 
      009AEF 6D 65            [ 2] 5146 	pushw y 
      009AF1 2E 0A 00         [ 2] 5147 	addw x,(1,sp)
                                   5148 ; skip to next file 
      009AF4 CD 1A A4         [ 4] 5149 	call incr_farptr
      009AF4 72 01 00         [ 4] 5150 	call row_align
                                   5151 ; print file size 
      009AF7 24               [ 2] 5152 	popw x ; file size 
      009AF8 01 81 4D         [ 4] 5153 	call print_int 
      009AFA A6 0D            [ 1] 5154 	ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009AFA CD 87 E4         [ 4] 5155 	call putc
      009AFD 81 01            [ 2] 5156 	ldw x,(COUNT,sp)
      009AFE 5C               [ 1] 5157 	incw x
      009AFE AE 16            [ 2] 5158 	ldw (COUNT,sp),x  
      009B00 E0 A6            [ 2] 5159 	jra dir_loop
      001D47                       5160 8$: ; print number of files 
      009B02 80 7F            [ 2] 5161 	ldw x,(COUNT,sp)
      009B04 5C 4A 26         [ 4] 5162 	call print_int 
      009B07 FB 81 66         [ 2] 5163 	ldw x,#file_count 
      009B09 CD 00 00         [ 4] 5164 	call puts  
                                   5165 ; print drive free space 	
      009B09 A6 7F C4         [ 4] 5166 	call disk_free
      009B0C 00               [ 1] 5167 	clrw x  
      009B0D 19 27 13 CE      [ 1] 5168 	mov base,#10 
      009B11 00 18 1C         [ 4] 5169 	call prti24 
      009B14 00 80 24         [ 2] 5170 	ldw x,#drive_free
      009B17 04 72 5C         [ 4] 5171 	call puts 
      001D63                       5172 	_drop VSIZE 
      009B1A 00 17            [ 2]    1     addw sp,#VSIZE 
      009B1C 9F               [ 4] 5173 	ret
      009B1D A4 80 97 CF 00 18 81  5174 file_count: .asciz " files\n"
             00
      009B24 20 62 79 74 65 73 20  5175 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5176 
                                   5177 ;---------------------
                                   5178 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5179 ; write 1 or more byte to FLASH or EEPROM
                                   5180 ; starting at address  
                                   5181 ; input:
                                   5182 ;   expr1  	is address 
                                   5183 ;   expr2,...,exprn   are bytes to write
                                   5184 ; output:
                                   5185 ;   none 
                                   5186 ;---------------------
                           000001  5187 	ADDR=1
                           000002  5188 	VSIZ=2 
      001D7B                       5189 write:
      001D7B                       5190 	_vars VSIZE 
      009B24 72 BB            [ 2]    1     sub sp,#VSIZE 
      009B26 00 18 24 04      [ 1] 5191 	clr farptr ; expect 16 bits address 
      009B2A 72 5C 00         [ 4] 5192 	call expression
      009B2D 17 CF            [ 1] 5193 	cp a,#TK_INTGR 
      009B2F 00 18            [ 1] 5194 	jreq 0$
      009B31 81 08 FA         [ 2] 5195 	jp syntax_error
      009B32 1F 01            [ 2] 5196 0$: ldw (ADDR,sp),x 
      009B32 A6 01 C7         [ 4] 5197 	call next_token 
      009B35 00 17            [ 1] 5198 	cp a,#TK_COMMA 
      009B37 5F CF            [ 1] 5199 	jreq 1$ 
      009B39 00 18            [ 2] 5200 	jra 9$ 
      009B3B CD 11 D1         [ 4] 5201 1$:	call expression
      009B3B AE 00            [ 1] 5202 	cp a,#TK_INTGR
      009B3D 03 92            [ 1] 5203 	jreq 2$
      009B3F AF 00 17         [ 2] 5204 	jp syntax_error
      009B42 26               [ 1] 5205 2$:	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009B43 05 5A            [ 2] 5206 	ldw x,(ADDR,sp) 
      009B45 2A F7 20         [ 2] 5207 	ldw farptr+1,x 
      009B48 0E               [ 1] 5208 	clrw x 
      009B49 AE 00 80         [ 4] 5209 	call write_byte
      009B4C CD 9B            [ 2] 5210 	ldw x,(ADDR,sp)
      009B4E 24               [ 1] 5211 	incw x 
      009B4F AE 02            [ 2] 5212 	jra 0$ 
      001DAF                       5213 9$:
      001DAF                       5214 	_drop VSIZE
      009B51 80 C3            [ 2]    1     addw sp,#VSIZE 
      009B53 00               [ 4] 5215 	ret 
                                   5216 
                                   5217 
                                   5218 ;---------------------
                                   5219 ;BASIC: CHAR(expr)
                                   5220 ; évaluate expression 
                                   5221 ; and take the 7 least 
                                   5222 ; bits as ASCII character
                                   5223 ; return a TK_CHAR 
                                   5224 ;---------------------
      001DB2                       5225 char:
      009B54 17 2B E4         [ 4] 5226 	call func_args 
      009B57 A1 01            [ 1] 5227 	cp a,#1
      009B57 CE 00            [ 1] 5228 	jreq 1$
      009B59 17 C6 00         [ 2] 5229 	jp syntax_error
      009B5C 19               [ 2] 5230 1$:	popw x 
      009B5D CF               [ 1] 5231 	ld a,xl 
      009B5E 00 1A            [ 1] 5232 	and a,#0x7f 
      009B60 C7               [ 1] 5233 	ld xl,a
      009B61 00 1C            [ 1] 5234 	ld a,#TK_CHAR
      009B63 81               [ 4] 5235 	ret
                                   5236 
                                   5237 ;---------------------
                                   5238 ; BASIC: ASC(string|char|TK_CFUNC)
                                   5239 ; extract first character 
                                   5240 ; of string argument 
                                   5241 ; return it as TK_INTGR 
                                   5242 ;---------------------
      009B64                       5243 ascii:
      009B64 AE 80            [ 1] 5244 	ld a,#TK_LPAREN
      009B66 00 72 B0         [ 4] 5245 	call expect 
      009B69 00 1B A6         [ 4] 5246 	call next_token 
      009B6C 02 C2            [ 1] 5247 	cp a,#TK_QSTR 
      009B6E 00 1A            [ 1] 5248 	jreq 1$
      009B70 C7 00            [ 1] 5249 	cp a,#TK_CHAR 
      009B72 0C CF            [ 1] 5250 	jreq 2$ 
      009B74 00 0D            [ 1] 5251 	cp a,#TK_CFUNC 
      009B76 81 03            [ 1] 5252 	jreq 0$
      009B77 CC 08 FA         [ 2] 5253 	jp syntax_error
      009B77 5F               [ 4] 5254 0$: call (x)
      009B78 92 AF            [ 2] 5255 	jra 2$
      001DDE                       5256 1$: 
      009B7A 00               [ 1] 5257 	ld a,(x) 
      009B7B 17               [ 1] 5258 	clrw x
      009B7C 90               [ 1] 5259 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      001DE1                       5260 2$: 
      009B7D F1               [ 2] 5261 	pushw x 
      009B7E 26 08            [ 1] 5262 	ld a,#TK_RPAREN 
      009B80 4D 27 12         [ 4] 5263 	call expect
      009B83 5C               [ 2] 5264 	popw x 
      009B84 90 5C            [ 1] 5265 	ld a,#TK_INTGR 
      009B86 20               [ 4] 5266 	ret 
                                   5267 
                                   5268 ;---------------------
                                   5269 ;BASIC: KEY
                                   5270 ; wait for a character 
                                   5271 ; received from STDIN 
                                   5272 ; input:
                                   5273 ;	none 
                                   5274 ; output:
                                   5275 ;	X 		ASCII character 
                                   5276 ;---------------------
      001DEB                       5277 key:
      009B87 F0 03 2B         [ 4] 5278 	call getc 
      009B88 5F               [ 1] 5279 	clrw x 
      009B88 4D               [ 1] 5280 	ld xl,a 
      009B89 27 07            [ 1] 5281 	ld a,#TK_INTGR
      009B8B 5C               [ 4] 5282 	ret
                                   5283 
                                   5284 ;----------------------
                                   5285 ; BASIC: QKEY
                                   5286 ; Return true if there 
                                   5287 ; is a character in 
                                   5288 ; waiting in STDIN 
                                   5289 ; input:
                                   5290 ;  none 
                                   5291 ; output:
                                   5292 ;   X 		0|-1 
                                   5293 ;-----------------------
      001DF3                       5294 qkey:: 
      009B8C 92               [ 1] 5295 	clrw x 
      009B8D AF 00 17         [ 1] 5296 	ld a,rx_head
      009B90 20 F6 5C         [ 1] 5297 	cp a,rx_tail 
      009B93 98 81            [ 1] 5298 	jreq 9$ 
      009B95 53               [ 2] 5299 	cplw x 
      009B95 5C 99            [ 1] 5300 9$: ld a,#TK_INTGR
      009B97 81               [ 4] 5301 	ret 
                                   5302 
                                   5303 ;---------------------
                                   5304 ; BASIC: GPIO(expr,reg)
                                   5305 ; return gpio address 
                                   5306 ; expr {0..8}
                                   5307 ; input:
                                   5308 ;   none 
                                   5309 ; output:
                                   5310 ;   X 		gpio register address
                                   5311 ;----------------------------
                           000003  5312 	PORT=3
                           000001  5313 	REG=1 
                           000004  5314 	VSIZE=4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B98                       5315 gpio:
      009B98 52 04 17         [ 4] 5316 	call func_args 
      009B9B 03 5F            [ 1] 5317 	cp a,#2
      009B9D CF 00            [ 1] 5318 	jreq 1$
      009B9F 18 35 01         [ 2] 5319 	jp syntax_error  
      001E0A                       5320 1$:	
      009BA2 00 17            [ 2] 5321 	ldw x,(PORT,sp)
      009BA4 2B 17            [ 1] 5322 	jrmi bad_port
      009BA4 92 BC 00         [ 2] 5323 	cpw x,#9
      009BA7 17 27            [ 1] 5324 	jrpl bad_port
      009BA9 27 5F            [ 1] 5325 	ld a,#5
      009BAB 16               [ 4] 5326 	mul x,a
      009BAC 03 CD 9B         [ 2] 5327 	addw x,#GPIO_BASE 
      009BAF 77 25            [ 2] 5328 	ldw (PORT,sp),x  
      009BB1 2F 92            [ 2] 5329 	ldw x,(REG,sp) 
      009BB3 AF 00 17         [ 2] 5330 	addw x,(PORT,sp)
      009BB6 6B 01            [ 1] 5331 	ld a,#TK_INTGR
      001E22                       5332 	_drop VSIZE 
      009BB8 5C 92            [ 2]    1     addw sp,#VSIZE 
      009BBA AF               [ 4] 5333 	ret
      001E25                       5334 bad_port:
      009BBB 00 17            [ 1] 5335 	ld a,#ERR_BAD_VALUE
      009BBD 6B 02 5C         [ 2] 5336 	jp tb_error
                                   5337 
                                   5338 
                                   5339 ;-------------------------
                                   5340 ; BASIC: UFLASH 
                                   5341 ; return user flash address
                                   5342 ; input:
                                   5343 ;  none 
                                   5344 ; output:
                                   5345 ;	A		TK_INTGR
                                   5346 ;   X 		user address 
                                   5347 ;---------------------------
      001E2A                       5348 uflash:
      009BC0 72 FB 01         [ 2] 5349 	ldw x,#user_space 
      009BC3 CD 9B            [ 1] 5350 	ld a,#TK_INTGR 
      009BC5 24               [ 4] 5351 	ret 
                                   5352 
                                   5353 
                                   5354 ;---------------------
                                   5355 ; BASIC: USR(addr[,arg])
                                   5356 ; execute a function written 
                                   5357 ; in binary code.
                                   5358 ; binary fonction should 
                                   5359 ; return token attribute in A 
                                   5360 ; and value in X. 
                                   5361 ; input:
                                   5362 ;   addr	routine address 
                                   5363 ;   arg 	is an optional argument 
                                   5364 ; output:
                                   5365 ;   A 		token attribute 
                                   5366 ;   X       returned value 
                                   5367 ;---------------------
      001E30                       5368 usr:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009BC6 CD 9B            [ 2] 5369 	pushw y 	
      009BC8 09 AE 02         [ 4] 5370 	call func_args 
      009BCB 80 C3            [ 1] 5371 	cp a,#1 
      009BCD 00 17            [ 1] 5372 	jreq 2$
      009BCF 2A D3            [ 1] 5373 	cp a,#2
      009BD1 27 03            [ 1] 5374 	jreq 2$  
      009BD1 72 5F 00         [ 2] 5375 	jp syntax_error 
      009BD4 17 72            [ 2] 5376 2$: popw y  ; arg|addr 
      009BD6 5F 00            [ 1] 5377 	cp a,#1
      009BD8 18 72            [ 1] 5378 	jreq 3$
      009BDA 5F               [ 2] 5379 	popw x ; addr
      009BDB 00               [ 1] 5380 	exgw x,y 
      009BDC 19 5B            [ 4] 5381 3$: call (y)
      009BDE 04 98            [ 2] 5382 	popw y 
      009BE0 81               [ 4] 5383 	ret 
                                   5384 
                                   5385 ;------------------------------
                                   5386 ; BASIC: BYE 
                                   5387 ; halt mcu in its lowest power mode 
                                   5388 ; wait for reset or external interrupt
                                   5389 ; do a cold start on wakeup.
                                   5390 ;------------------------------
      009BE1                       5391 bye:
      009BE1 5B 04 99 81 FB   [ 2] 5392 	btjf UART1_SR,#UART_SR_TC,.
      009BE5 8E               [10] 5393 	halt
      009BE5 72 01 00         [ 2] 5394 	jp cold_start  
                                   5395 
                                   5396 ;----------------------------------
                                   5397 ; BASIC: AUTORUN ["file_name"] 
                                   5398 ; record in eeprom at adrress AUTORUN_NAME
                                   5399 ; the name of file to load and execute
                                   5400 ; at startup. 
                                   5401 ; empty string delete autorun name 
                                   5402 ; no argument display autorun name  
                                   5403 ; input:
                                   5404 ;   file_name   file to execute 
                                   5405 ; output:
                                   5406 ;   none
                                   5407 ;-----------------------------------
      001E56                       5408 autorun: 
      009BE8 24 05 A6 07 CC   [ 2] 5409 	btjf flags,#FRUN,0$ 
      009BED 89 7C            [ 1] 5410 	jreq 0$ 
      009BEF A6 07            [ 1] 5411 	ld a,#ERR_CMD_ONLY 
      009BEF CE 00 1F         [ 2] 5412 	jp tb_error 
      001E62                       5413 0$:	
      009BF2 72 B0 00         [ 4] 5414 	call next_token
      009BF5 1D               [ 1] 5415 	tnz a 
      009BF6 26 0C            [ 1] 5416 	jrne 1$
      009BF8 AE 89 13         [ 2] 5417 	ldw x,#AUTORUN_NAME
      009BFB CD AA C0         [ 4] 5418 	call puts 
      009BFE 55               [ 1] 5419 	clr a 
      009BFF 00               [ 4] 5420 	ret 
      001E70                       5421 1$:
      009C00 04 00            [ 1] 5422 	cp a,#TK_QSTR
      009C02 02 81            [ 1] 5423 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009C04 CC 08 FA         [ 2] 5424 	jp syntax_error 
      001E77                       5425 2$:	
      009C04 52               [ 1] 5426 	tnz (x) 
      009C05 08 1F            [ 1] 5427 	jrne 3$
                                   5428 ; empty string, delete autorun 	
      009C07 01 CD 8A         [ 4] 5429 	call cancel_autorun
      009C0A 6C A1 02 27 03   [ 1] 5430 	mov in,count 
      009C0F CC               [ 4] 5431 	ret 
      009C10 89               [ 2] 5432 3$:	pushw x 
      009C11 7A 93            [ 1] 5433 	ldw y,x  
      009C12 CD 1B 18         [ 4] 5434 	call search_file 
      009C12 1F 03            [ 1] 5435 	jrc 4$ 
      009C14 CD 82            [ 1] 5436 	ld a,#ERR_NOT_FILE
      009C16 03 CD 84         [ 2] 5437 	jp tb_error  
      001E90                       5438 4$: 
      009C19 8A AB 03 5F 97   [ 1] 5439 	mov in,count 
      009C1E 72 FB 01 4F      [ 1] 5440 	clr farptr 
      009C22 72 BB 00         [ 2] 5441 	ldw x,#AUTORUN_NAME
      009C25 1B C9 00         [ 2] 5442 	ldw farptr+1,x 
      009C28 1A A1            [ 2] 5443 	ldw x,(1,sp)  
      009C2A 02 2B 0A         [ 4] 5444 	call strlen  ; return length in A 
      009C2D A3               [ 1] 5445 	clrw x 
      009C2E 80               [ 1] 5446 	ld xl,a 
      009C2F 00               [ 1] 5447 	incw x 
      009C30 2B 05            [ 2] 5448 	popw y 
      009C32 A6               [ 2] 5449 	pushw x 
      009C33 0E               [ 1] 5450 	clrw x 
      009C34 CC 89 7C         [ 4] 5451 	call write_block 
      009C37                       5452 	_drop 2 
      009C37 16 03            [ 2]    1     addw sp,#2 
      009C39 CD               [ 4] 5453 	ret 
                                   5454 
                                   5455 ;----------------------------------
                                   5456 ; BASIC: SLEEP 
                                   5457 ; halt mcu until reset or external
                                   5458 ; interrupt.
                                   5459 ; Resume progam after SLEEP command
                                   5460 ;----------------------------------
      001EB1                       5461 sleep:
      009C3A 9B 98 24 05 A6   [ 2] 5462 	btjf UART1_SR,#UART_SR_TC,.
      009C3F 08 CC 89 7C      [ 1] 5463 	bset flags,#FSLEEP
      009C43 8E               [10] 5464 	halt 
      009C43 CE               [ 4] 5465 	ret 
                                   5466 
                                   5467 ;-------------------------------
                                   5468 ; BASIC: PAUSE expr 
                                   5469 ; suspend execution for n msec.
                                   5470 ; input:
                                   5471 ;	none
                                   5472 ; output:
                                   5473 ;	none 
                                   5474 ;------------------------------
      001EBC                       5475 pause:
      009C44 00 1A C6         [ 4] 5476 	call expression
      009C47 00 1C            [ 1] 5477 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009C49 CF 00            [ 1] 5478 	jreq pause02 
      009C4B 17 C7 00         [ 2] 5479 	jp syntax_error
      001EC6                       5480 pause02: 
      009C4E 19               [ 2] 5481 1$: tnzw x 
      009C4F 16 03            [ 1] 5482 	jreq 2$
      009C51 AE               [10] 5483 	wfi 
      009C52 16               [ 2] 5484 	decw x 
      009C53 E0 CD            [ 1] 5485 	jrne 1$
      009C55 84               [ 1] 5486 2$:	clr a 
      009C56 A6               [ 4] 5487 	ret 
                                   5488 
                                   5489 ;------------------------------
                                   5490 ; BASIC: AWU expr
                                   5491 ; halt mcu for 'expr' milliseconds
                                   5492 ; use Auto wakeup peripheral
                                   5493 ; all oscillators stopped except LSI
                                   5494 ; range: 1ms - 511ms
                                   5495 ; input:
                                   5496 ;  none
                                   5497 ; output:
                                   5498 ;  none:
                                   5499 ;------------------------------
      001ECF                       5500 awu:
      009C57 CD 84 8A         [ 4] 5501   call expression
      009C5A 5F 97            [ 1] 5502   cp a,#TK_INTGR
      009C5C 5C 1C            [ 1] 5503   jreq awu02
      009C5E 16 E0 16         [ 2] 5504   jp syntax_error
      001ED9                       5505 awu02:
      009C61 01 FF 1C         [ 2] 5506   cpw x,#5120
      009C64 00 02            [ 1] 5507   jrmi 1$ 
      009C66 90 CE 00 1D      [ 1] 5508   mov AWU_TBR,#15 
      009C6A 90 F6            [ 1] 5509   ld a,#30
      009C6C 90               [ 2] 5510   div x,a
      009C6D 5C F7            [ 1] 5511   ld a,#16
      009C6F 5C               [ 2] 5512   div x,a 
      009C70 90 C3            [ 2] 5513   jra 4$
      001EEA                       5514 1$: 
      009C72 00 1F 27         [ 2] 5515   cpw x,#2048
      009C75 05 A3            [ 1] 5516   jrmi 2$ 
      009C77 17 60 2B EF      [ 1] 5517   mov AWU_TBR,#14
      009C7B A6 50            [ 1] 5518   ld a,#80
      009C7B 17               [ 2] 5519   div x,a 
      009C7C 07 10            [ 2] 5520   jra 4$   
      009C7D                       5521 2$:
      009C7D A3 17 60 27      [ 1] 5522   mov AWU_TBR,#7
      001EFC                       5523 3$:  
                                   5524 ; while X > 64  divide by 2 and increment AWU_TBR 
      009C81 04 7F 5C         [ 2] 5525   cpw x,#64 
      009C84 20 F7            [ 2] 5526   jrule 4$ 
      009C86 72 5C 50 F2      [ 1] 5527   inc AWU_TBR 
      009C86 AE               [ 2] 5528   srlw x 
      009C87 16 E0            [ 2] 5529   jra 3$ 
      001F08                       5530 4$:
      009C89 CD               [ 1] 5531   ld a, xl
      009C8A 82               [ 1] 5532   dec a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C8B 17 AE            [ 1] 5533   jreq 5$
      009C8D 00               [ 1] 5534   dec a 	
      001F0D                       5535 5$: 
      009C8E 80 CD            [ 1] 5536   and a,#0x3e 
      009C90 9B 24 AE         [ 1] 5537   ld AWU_APR,a 
      009C93 16 E0 16 07      [ 1] 5538   bset AWU_CSR,#AWU_CSR_AWUEN
      009C97 90               [10] 5539   halt 
                                   5540 
      009C98 C3               [ 4] 5541   ret 
                                   5542 
                                   5543 ;------------------------------
                                   5544 ; BASIC: TICKS
                                   5545 ; return msec ticks counter value 
                                   5546 ; input:
                                   5547 ; 	none 
                                   5548 ; output:
                                   5549 ;	X 		TK_INTGR
                                   5550 ;-------------------------------
      001F18                       5551 get_ticks:
      009C99 00 1F 2B         [ 2] 5552 	ldw x,ticks 
      009C9C CD CE            [ 1] 5553 	ld a,#TK_INTGR
      009C9E 00               [ 4] 5554 	ret 
                                   5555 
                                   5556 
                                   5557 
                                   5558 ;------------------------------
                                   5559 ; BASIC: ABS(expr)
                                   5560 ; return absolute value of expr.
                                   5561 ; input:
                                   5562 ;   none
                                   5563 ; output:
                                   5564 ;   X     	positive integer
                                   5565 ;-------------------------------
      001F1E                       5566 abs:
      009C9F 17 C6 00         [ 4] 5567 	call func_args 
      009CA2 19 CF            [ 1] 5568 	cp a,#1 
      009CA4 00 1A            [ 1] 5569 	jreq 0$ 
      009CA6 C7 00 1C         [ 2] 5570 	jp syntax_error
      001F28                       5571 0$:  
      009CA9 1E               [ 2] 5572     popw x   
      009CAA 01               [ 1] 5573 	ld a,xh 
      009CAB CD 8A            [ 1] 5574 	bcp a,#0x80 
      009CAD CD 5B            [ 1] 5575 	jreq 2$ 
      009CAF 08               [ 2] 5576 	negw x 
      009CB0 81 84            [ 1] 5577 2$: ld a,#TK_INTGR 
      009CB1 81               [ 4] 5578 	ret 
                                   5579 
                                   5580 ;------------------------------
                                   5581 ; BASIC: AND(expr1,expr2)
                                   5582 ; Apply bit AND relation between
                                   5583 ; the 2 arguments, i.e expr1 & expr2 
                                   5584 ; output:
                                   5585 ; 	A 		TK_INTGR
                                   5586 ;   X 		result 
                                   5587 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      001F32                       5588 bit_and:
      009CB1 CD 9B 24         [ 4] 5589 	call func_args 
      009CB4 CD 87            [ 1] 5590 	cp a,#2
      009CB6 E4 5F            [ 1] 5591 	jreq 1$
      009CB8 92 AF 00         [ 2] 5592 	jp syntax_error 
      009CBB 17               [ 2] 5593 1$:	popw x 
      009CBC 90               [ 1] 5594 	ld a,xh 
      009CBD 95 5C            [ 1] 5595 	and a,(1,sp)
      009CBF 92               [ 1] 5596 	ld xh,a 
      009CC0 AF               [ 1] 5597 	ld a,xl
      009CC1 00 17            [ 1] 5598 	and a,(2,sp)
      009CC3 5C               [ 1] 5599 	ld xl,a 
      001F45                       5600 	_drop 2 
      009CC4 90 97            [ 2]    1     addw sp,#2 
      009CC6 72 B9            [ 1] 5601 	ld a,#TK_INTGR
      009CC8 00               [ 4] 5602 	ret
                                   5603 
                                   5604 ;------------------------------
                                   5605 ; BASIC: OR(expr1,expr2)
                                   5606 ; Apply bit OR relation between
                                   5607 ; the 2 arguments, i.e expr1 | expr2 
                                   5608 ; output:
                                   5609 ; 	A 		TK_INTGR
                                   5610 ;   X 		result 
                                   5611 ;------------------------------
      001F4A                       5612 bit_or:
      009CC9 1D 90 CF         [ 4] 5613 	call func_args 
      009CCC 00 1F            [ 1] 5614 	cp a,#2
      009CCE 90 CE            [ 1] 5615 	jreq 1$
      009CD0 00 1D FA         [ 2] 5616 	jp syntax_error 
      009CD2                       5617 1$: 
      009CD2 92               [ 2] 5618 	popw x 
      009CD3 AF               [ 1] 5619 	ld a,xh 
      009CD4 00 17            [ 1] 5620 	or a,(1,sp)
      009CD6 90               [ 1] 5621 	ld xh,a 
      009CD7 F7               [ 1] 5622 	ld a,xl 
      009CD8 5C 90            [ 1] 5623 	or a,(2,sp)
      009CDA 5C               [ 1] 5624 	ld xl,a 
      001F5D                       5625 	_drop 2 
      009CDB 90 C3            [ 2]    1     addw sp,#2 
      009CDD 00 1F            [ 1] 5626 	ld a,#TK_INTGR 
      009CDF 2B               [ 4] 5627 	ret
                                   5628 
                                   5629 ;------------------------------
                                   5630 ; BASIC: XOR(expr1,expr2)
                                   5631 ; Apply bit XOR relation between
                                   5632 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5633 ; output:
                                   5634 ; 	A 		TK_INTGR
                                   5635 ;   X 		result 
                                   5636 ;------------------------------
      001F62                       5637 bit_xor:
      009CE0 F1 81 CD         [ 4] 5638 	call func_args 
      009CE2 A1 02            [ 1] 5639 	cp a,#2
      009CE2 72 01            [ 1] 5640 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009CE4 00 24 07         [ 2] 5641 	jp syntax_error 
      001F6C                       5642 1$: 
      009CE7 27               [ 2] 5643 	popw x 
      009CE8 05               [ 1] 5644 	ld a,xh 
      009CE9 A6 07            [ 1] 5645 	xor a,(1,sp)
      009CEB CC               [ 1] 5646 	ld xh,a 
      009CEC 89               [ 1] 5647 	ld a,xl 
      009CED 7C 02            [ 1] 5648 	xor a,(2,sp)
      009CEE 97               [ 1] 5649 	ld xl,a 
      001F75                       5650 	_drop 2 
      009CEE CD 8A            [ 2]    1     addw sp,#2 
      009CF0 6C A1            [ 1] 5651 	ld a,#TK_INTGR 
      009CF2 02               [ 4] 5652 	ret 
                                   5653 
                                   5654 ;------------------------------
                                   5655 ; BASIC: LSHIFT(expr1,expr2)
                                   5656 ; logical shift left expr1 by 
                                   5657 ; expr2 bits 
                                   5658 ; output:
                                   5659 ; 	A 		TK_INTGR
                                   5660 ;   X 		result 
                                   5661 ;------------------------------
      001F7A                       5662 lshift:
      009CF3 27 03 CC         [ 4] 5663 	call func_args
      009CF6 89 7A            [ 1] 5664 	cp a,#2 
      009CF8 90 93            [ 1] 5665 	jreq 1$
      009CFA CD 9B 98         [ 2] 5666 	jp syntax_error
      009CFD 25 05            [ 2] 5667 1$: popw y   
      009CFF A6               [ 2] 5668 	popw x 
      009D00 09 CC            [ 2] 5669 	tnzw y 
      009D02 89 7C            [ 1] 5670 	jreq 4$
      009D04 58               [ 2] 5671 2$:	sllw x 
      009D04 CD 9C            [ 2] 5672 	decw y 
      009D06 B1 CE            [ 1] 5673 	jrne 2$
      001F90                       5674 4$:  
      009D08 00 1F            [ 1] 5675 	ld a,#TK_INTGR
      009D0A 72               [ 4] 5676 	ret
                                   5677 
                                   5678 ;------------------------------
                                   5679 ; BASIC: RSHIFT(expr1,expr2)
                                   5680 ; logical shift right expr1 by 
                                   5681 ; expr2 bits.
                                   5682 ; output:
                                   5683 ; 	A 		TK_INTGR
                                   5684 ;   X 		result 
                                   5685 ;------------------------------
      001F93                       5686 rshift:
      009D0B B0 00 1D         [ 4] 5687 	call func_args
      009D0E CD 8A            [ 1] 5688 	cp a,#2 
      009D10 CD 81            [ 1] 5689 	jreq 1$
      009D12 CC 08 FA         [ 2] 5690 	jp syntax_error
      009D12 52 03            [ 2] 5691 1$: popw y  
      009D14 CD               [ 2] 5692 	popw x
      009D15 8A 6C            [ 2] 5693 	tnzw y 
      009D17 A1 00            [ 1] 5694 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009D19 27               [ 2] 5695 2$:	srlw x 
      009D1A 20 A1            [ 2] 5696 	decw y 
      009D1C 02 27            [ 1] 5697 	jrne 2$
      001FA9                       5698 4$:  
      009D1E 03 CC            [ 1] 5699 	ld a,#TK_INTGR
      009D20 89               [ 4] 5700 	ret
                                   5701 
                                   5702 ;--------------------------
                                   5703 ; BASIC: FCPU integer
                                   5704 ; set CPU frequency 
                                   5705 ;-------------------------- 
                                   5706 
      001FAC                       5707 fcpu:
      009D21 7A 90            [ 1] 5708 	ld a,#TK_INTGR
      009D23 93 55 00         [ 4] 5709 	call expect 
      009D26 04               [ 1] 5710 	ld a,xl 
      009D27 00 02            [ 1] 5711 	and a,#7 
      009D29 CD 9B 98         [ 1] 5712 	ld CLK_CKDIVR,a 
      009D2C 25               [ 4] 5713 	ret 
                                   5714 
                                   5715 ;------------------------------
                                   5716 ; BASIC: PMODE pin#, mode 
                                   5717 ; Arduino pin. 
                                   5718 ; define pin as input or output
                                   5719 ; pin#: {0..15}
                                   5720 ; mode: INPUT|OUTPUT  
                                   5721 ;------------------------------
                           000001  5722 	PINNO=1
                           000001  5723 	VSIZE=1
      001FB8                       5724 pin_mode:
      001FB8                       5725 	_vars VSIZE 
      009D2D 05 A6            [ 2]    1     sub sp,#VSIZE 
      009D2F 09 CC 89         [ 4] 5726 	call arg_list 
      009D32 7C 02            [ 1] 5727 	cp a,#2 
      009D33 27 03            [ 1] 5728 	jreq 1$
      009D33 CE 00 17         [ 2] 5729 	jp syntax_error 
      009D36 C6 00            [ 2] 5730 1$: popw y ; mode 
      009D38 19               [ 2] 5731 	popw x ; Dx pin 
      009D39 20 0A 04         [ 4] 5732 	call select_pin 
      009D3B 6B 01            [ 1] 5733 	ld (PINNO,sp),a  
      009D3B AE 01            [ 1] 5734 	ld a,#1 
      009D3D 00 4F            [ 1] 5735 	tnz (PINNO,sp)
      009D3F CF 00            [ 1] 5736 	jreq 4$
      009D41 17               [ 1] 5737 2$:	sll a 
      009D42 C7 00            [ 1] 5738 	dec (PINNO,sp)
      009D44 19 FB            [ 1] 5739 	jrne 2$ 
      009D45 6B 01            [ 1] 5740 	ld (PINNO,sp),a
      009D45 1F 01            [ 1] 5741 	ld a,(PINNO,sp)
      009D47 6B 03            [ 1] 5742 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009D49 CD 81            [ 1] 5743 	ld (GPIO_CR1,x),a 
      009D4B CF CD 82 4A      [ 2] 5744 4$:	cpw y,#OUTP 
      009D4F AE 00            [ 1] 5745 	jreq 6$
                                   5746 ; input mode
                                   5747 ; disable external interrupt 
      009D51 80 CD            [ 1] 5748 	ld a,(PINNO,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009D53 9B               [ 1] 5749 	cpl a 
      009D54 24 CD            [ 1] 5750 	and a,(GPIO_CR2,x)
      009D56 9B 09            [ 1] 5751 	ld (GPIO_CR2,x),a 
                                   5752 ;clear bit in DDR for input mode 
      009D58 C6 00            [ 1] 5753 	ld a,(PINNO,sp)
      009D5A 19               [ 1] 5754 	cpl a 
      009D5B C0 00            [ 1] 5755 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009D5D 1C C6            [ 1] 5756 	ld (GPIO_DDR,x),a 
      009D5F 00 18            [ 2] 5757 	jra 9$
      001FF5                       5758 6$: ;output mode  
      009D61 C2 00            [ 1] 5759 	ld a,(PINNO,sp)
      009D63 1B C6            [ 1] 5760 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009D65 00 17            [ 1] 5761 	ld (GPIO_DDR,x),a 
      009D67 C2 00            [ 1] 5762 	ld a,(PINNO,sp)
      009D69 1A 2B            [ 1] 5763 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009D6B E0 7B            [ 1] 5764 	ld (GPIO_CR2,x),a 
      002001                       5765 9$:	
      002001                       5766 	_drop VSIZE 
      009D6D 03 1E            [ 2]    1     addw sp,#VSIZE 
      009D6F 01               [ 4] 5767 	ret
                                   5768 
                                   5769 ;------------------------
                                   5770 ; select Arduino pin 
                                   5771 ; input:
                                   5772 ;   X 	 {0..15} Arduino Dx 
                                   5773 ; output:
                                   5774 ;   A     stm8s208 pin 
                                   5775 ;   X     base address s208 GPIO port 
                                   5776 ;---------------------------
      002004                       5777 select_pin:
      009D70 C7               [ 2] 5778 	sllw x 
      009D71 00 1C CF         [ 2] 5779 	addw x,#arduino_to_8s208 
      009D74 00               [ 2] 5780 	ldw x,(x)
      009D75 1A               [ 1] 5781 	ld a,xl 
      009D76 5B               [ 1] 5782 	push a 
      009D77 03               [ 1] 5783 	swapw x 
      009D78 81 05            [ 1] 5784 	ld a,#5 
      009D79 42               [ 4] 5785 	mul x,a 
      009D79 52 02 5F         [ 2] 5786 	addw x,#GPIO_BASE 
      009D7C 1F               [ 1] 5787 	pop a 
      009D7D 01               [ 4] 5788 	ret 
                                   5789 ; translation from Arduino D0..D15 to stm8s208rb 
      002014                       5790 arduino_to_8s208:
      009D7E CF 00                 5791 .byte 3,6 ; D0 
      009D80 18 35                 5792 .byte 3,5 ; D1 
      009D82 01 00                 5793 .byte 4,0 ; D2 
      009D84 17 01                 5794 .byte 2,1 ; D3
      009D85 06 00                 5795 .byte 6,0 ; D4
      009D85 5F 92                 5796 .byte 2,2 ; D5
      009D87 AF 00                 5797 .byte 2,3 ; D6
      009D89 17 27                 5798 .byte 3,1 ; D7
      009D8B 3B 03                 5799 .byte 3,3 ; D8
      009D8C 02 04                 5800 .byte 2,4 ; D9
      009D8C 92 AF                 5801 .byte 4,5 ; D10
      009D8E 00 17                 5802 .byte 2,6 ; D11
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009D90 27 06                 5803 .byte 2,7 ; D12
      009D92 CD 83                 5804 .byte 2,5 ; D13
      009D94 8A 5C                 5805 .byte 4,2 ; D14
      009D96 20 F4                 5806 .byte 4,1 ; D15
                                   5807 
                                   5808 
                                   5809 ;------------------------------
                                   5810 ; BASIC: RND(expr)
                                   5811 ; return random number 
                                   5812 ; between 1 and expr inclusive
                                   5813 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5814 ; input:
                                   5815 ; 	none 
                                   5816 ; output:
                                   5817 ;	X 		random positive integer 
                                   5818 ;------------------------------
      002034                       5819 random:
      009D98 5C A6 20         [ 4] 5820 	call func_args 
      009D9B CD 83            [ 1] 5821 	cp a,#1
      009D9D 8A 92            [ 1] 5822 	jreq 1$
      009D9F AF 00 17         [ 2] 5823 	jp syntax_error
      00203E                       5824 1$:  
      009DA2 90 95            [ 1] 5825 	ld a,#0x80 
      009DA4 5C 92            [ 1] 5826 	bcp a,(1,sp)
      009DA6 AF 00            [ 1] 5827 	jreq 2$
      009DA8 17 5C            [ 1] 5828 	ld a,#ERR_BAD_VALUE
      009DAA 90 97 90         [ 2] 5829 	jp tb_error
      002049                       5830 2$: 
                                   5831 ; acc16=(x<<5)^x 
      009DAD 89 72 FB         [ 2] 5832 	ldw x,seedx 
      009DB0 01               [ 2] 5833 	sllw x 
      009DB1 CD               [ 2] 5834 	sllw x 
      009DB2 9B               [ 2] 5835 	sllw x 
      009DB3 24               [ 2] 5836 	sllw x 
      009DB4 CD               [ 2] 5837 	sllw x 
      009DB5 9B               [ 1] 5838 	ld a,xh 
      009DB6 09 85 CD         [ 1] 5839 	xor a,seedx 
      009DB9 8A CD A6         [ 1] 5840 	ld acc16,a 
      009DBC 0D               [ 1] 5841 	ld a,xl 
      009DBD CD 83 8A         [ 1] 5842 	xor a,seedx+1 
      009DC0 1E 01 5C         [ 1] 5843 	ld acc8,a 
                                   5844 ; seedx=seedy 
      009DC3 1F 01 20         [ 2] 5845 	ldw x,seedy 
      009DC6 BE 00 12         [ 2] 5846 	ldw seedx,x  
                                   5847 ; seedy=seedy^(seedy>>1)
      009DC7 90 54            [ 2] 5848 	srlw y 
      009DC7 1E 01            [ 1] 5849 	ld a,yh 
      009DC9 CD 8A CD         [ 1] 5850 	xor a,seedy 
      009DCC AE 9D E6         [ 1] 5851 	ld seedy,a  
      009DCF CD AA            [ 1] 5852 	ld a,yl 
      009DD1 C0 CD 9B         [ 1] 5853 	xor a,seedy+1 
      009DD4 64 5F 35         [ 1] 5854 	ld seedy+1,a 
                                   5855 ; acc16>>3 
      009DD7 0A 00 0B         [ 2] 5856 	ldw x,acc16 
      009DDA CD               [ 2] 5857 	srlw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009DDB 8A               [ 2] 5858 	srlw x 
      009DDC DD               [ 2] 5859 	srlw x 
                                   5860 ; x=acc16^x 
      009DDD AE               [ 1] 5861 	ld a,xh 
      009DDE 9D EE CD         [ 1] 5862 	xor a,acc16 
      009DE1 AA               [ 1] 5863 	ld xh,a 
      009DE2 C0               [ 1] 5864 	ld a,xl 
      009DE3 5B 02 81         [ 1] 5865 	xor a,acc8 
      009DE6 20               [ 1] 5866 	ld xl,a 
                                   5867 ; seedy=x^seedy 
      009DE7 66 69 6C         [ 1] 5868 	xor a,seedy+1
      009DEA 65               [ 1] 5869 	ld xl,a 
      009DEB 73               [ 1] 5870 	ld a,xh 
      009DEC 0A 00 20         [ 1] 5871 	xor a,seedy
      009DEF 62               [ 1] 5872 	ld xh,a 
      009DF0 79 74 65         [ 2] 5873 	ldw seedy,x 
                                   5874 ; return seedy modulo expr + 1 
      009DF3 73 20            [ 2] 5875 	popw y 
      009DF5 66               [ 2] 5876 	divw x,y 
      009DF6 72               [ 1] 5877 	ldw x,y 
      009DF7 65               [ 1] 5878 	incw x 
      002098                       5879 10$:
      009DF8 65 0A            [ 1] 5880 	ld a,#TK_INTGR
      009DFA 00               [ 4] 5881 	ret 
                                   5882 
                                   5883 ;---------------------------------
                                   5884 ; BASIC: WORDS 
                                   5885 ; affiche la listes des mots du
                                   5886 ; dictionnaire ainsi que le nombre
                                   5887 ; de mots.
                                   5888 ;---------------------------------
                           000001  5889 	WLEN=1 ; word length
                           000002  5890 	LLEN=2 ; character sent to console
                           000003  5891 	WCNT=3 ; count words printed 
                           000003  5892 	VSIZE=3 
      009DFB                       5893 words:
      00209B                       5894 	_vars VSIZE
      009DFB 52 02            [ 2]    1     sub sp,#VSIZE 
      009DFD 72 5F            [ 1] 5895 	clr (LLEN,sp)
      009DFF 00 17            [ 1] 5896 	clr (WCNT,sp)
      009E01 CD 92 51 A1      [ 2] 5897 	ldw y,#kword_dict+2
      009E05 84               [ 1] 5898 0$:	ldw x,y
      009E06 27               [ 1] 5899 	ld a,(x)
      009E07 03 CC            [ 1] 5900 	and a,#15 
      009E09 89 7A            [ 1] 5901 	ld (WLEN,sp),a 
      009E0B 1F 01            [ 1] 5902 	inc (WCNT,sp)
      009E0D CD               [ 1] 5903 1$:	incw x 
      009E0E 8A               [ 1] 5904 	ld a,(x)
      009E0F 6C A1 09         [ 4] 5905 	call putc 
      009E12 27 02            [ 1] 5906 	inc (LLEN,sp)
      009E14 20 19            [ 1] 5907 	dec (WLEN,sp)
      009E16 CD 92            [ 1] 5908 	jrne 1$
      009E18 51 A1            [ 1] 5909 	ld a,#70
      009E1A 84 27            [ 1] 5910 	cp a,(LLEN,sp)
      009E1C 03 CC            [ 1] 5911 	jrmi 2$   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009E1E 89 7A            [ 1] 5912 	ld a,#SPACE 
      009E20 9F 1E 01         [ 4] 5913 	call putc 
      009E23 CF 00            [ 1] 5914 	inc (LLEN,sp) 
      009E25 18 5F            [ 2] 5915 	jra 3$
      009E27 CD 82            [ 1] 5916 2$: ld a,#CR 
      009E29 74 1E 01         [ 4] 5917 	call putc 
      009E2C 5C 20            [ 1] 5918 	clr (LLEN,sp)
      009E2E DC A2 00 02      [ 2] 5919 3$:	subw y,#2 
      009E2F 90 FE            [ 2] 5920 	ldw y,(y)
      009E2F 5B 02            [ 1] 5921 	jrne 0$ 
      009E31 81 0D            [ 1] 5922 	ld a,#CR 
      009E32 CD 03 0A         [ 4] 5923 	call putc  
      009E32 CD               [ 1] 5924 	clrw x 
      009E33 91 4D            [ 1] 5925 	ld a,(WCNT,sp)
      009E35 A1               [ 1] 5926 	ld xl,a 
      009E36 01 27 03         [ 4] 5927 	call print_int 
      009E39 CC 89 7A         [ 2] 5928 	ldw x,#words_count_msg
      009E3C 85 9F A4         [ 4] 5929 	call puts 
      0020E8                       5930 	_drop VSIZE 
      009E3F 7F 97            [ 2]    1     addw sp,#VSIZE 
      009E41 A6               [ 4] 5931 	ret 
      009E42 03 81 6F 72 64 73 20  5932 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   5933 
                                   5934 
                                   5935 ;-----------------------------
                                   5936 ; BASIC: TIMER expr 
                                   5937 ; initialize count down timer 
                                   5938 ;-----------------------------
      009E44                       5939 set_timer:
      009E44 A6 07 CD         [ 4] 5940 	call arg_list
      009E47 91 40            [ 1] 5941 	cp a,#1 
      009E49 CD 8A            [ 1] 5942 	jreq 1$
      009E4B 6C A1 02         [ 2] 5943 	jp syntax_error
      00210B                       5944 1$: 
      009E4E 27               [ 2] 5945 	popw x 
      009E4F 0E A1 03         [ 2] 5946 	ldw timer,x 
      009E52 27               [ 4] 5947 	ret 
                                   5948 
                                   5949 ;------------------------------
                                   5950 ; BASIC: TIMEOUT 
                                   5951 ; return state of timer 
                                   5952 ;------------------------------
      002110                       5953 timeout:
      009E53 0D A1 82         [ 2] 5954 	ldw x,timer 
      002113                       5955 logical_complement:
      009E56 27               [ 2] 5956 	cplw x 
      009E57 03 CC 89         [ 2] 5957 	cpw x,#-1
      009E5A 7A FD            [ 1] 5958 	jreq 2$
      009E5C 20               [ 1] 5959 	clrw x 
      009E5D 03 84            [ 1] 5960 2$:	ld a,#TK_INTGR
      009E5E 81               [ 4] 5961 	ret 
                                   5962 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                   5963 ;--------------------------------
                                   5964 ; BASIC NOT(expr) 
                                   5965 ; return logical complement of expr
                                   5966 ;--------------------------------
      00211D                       5967 func_not:
      009E5E F6 5F 97         [ 4] 5968 	call func_args  
      009E61 A1 01            [ 1] 5969 	cp a,#1
      009E61 89 A6            [ 1] 5970 	jreq 1$
      009E63 08 CD 91         [ 2] 5971 	jp syntax_error
      009E66 40               [ 2] 5972 1$:	popw x 
      009E67 85 A6            [ 2] 5973 	jra logical_complement
                                   5974 
                                   5975 
                                   5976 
                                   5977 ;-----------------------------------
                                   5978 ; BASIC: IWDGEN expr1 
                                   5979 ; enable independant watchdog timer
                                   5980 ; expr1 is delay in multiple of 62.5µsec
                                   5981 ; expr1 -> {1..16383}
                                   5982 ;-----------------------------------
      00212A                       5983 enable_iwdg:
      009E69 84 81 D2         [ 4] 5984 	call arg_list
      009E6B A1 01            [ 1] 5985 	cp a,#1 
      009E6B CD 83            [ 1] 5986 	jreq 1$
      009E6D AB 5F 97         [ 2] 5987 	jp syntax_error 
      009E70 A6               [ 2] 5988 1$: popw x 
      009E71 84 81            [ 1] 5989 	push #0
      009E73 35 CC 50 E0      [ 1] 5990 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009E73 5F               [ 1] 5991 	ld a,xh 
      009E74 C6 00            [ 1] 5992 	and a,#0x3f
      009E76 2E               [ 1] 5993 	ld xh,a  
      009E77 C1 00 2F         [ 2] 5994 2$:	cpw x,#255
      009E7A 27 01            [ 2] 5995 	jrule 3$
      009E7C 53 A6            [ 1] 5996 	inc (1,sp)
      009E7E 84               [ 1] 5997 	rcf 
      009E7F 81               [ 2] 5998 	rrcw x 
      009E80 20 F5            [ 2] 5999 	jra 2$
      009E80 CD 91 4D A1      [ 1] 6000 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009E84 02               [ 1] 6001 	pop a  
      009E85 27 03 CC         [ 1] 6002 	ld IWDG_PR,a 
      009E88 89               [ 1] 6003 	ld a,xl
      009E89 7A               [ 1] 6004 	dec a 
      009E8A 35 55 50 E0      [ 1] 6005 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009E8A 1E 03 2B         [ 1] 6006 	ld IWDG_RLR,a 
      009E8D 17 A3 00 09      [ 1] 6007 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009E91 2A               [ 4] 6008 	ret 
                                   6009 
                                   6010 
                                   6011 ;-----------------------------------
                                   6012 ; BASIC: IWDGREF  
                                   6013 ; refresh independant watchdog count down 
                                   6014 ; timer before it reset MCU. 
                                   6015 ;-----------------------------------
      002160                       6016 refresh_iwdg:
      009E92 12 A6 05 42      [ 1] 6017 	mov IWDG_KR,#IWDG_KEY_REFRESH 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009E96 1C               [ 4] 6018 	ret 
                                   6019 
                                   6020 
                                   6021 ;-------------------------------------
                                   6022 ; BASIC: LOG(expr)
                                   6023 ; return logarithm base 2 of expr 
                                   6024 ; this is the position of most significant
                                   6025 ; bit set. 
                                   6026 ; input: 
                                   6027 ; output:
                                   6028 ;   X     log2 
                                   6029 ;   A     TK_INTGR 
                                   6030 ;*********************************
      002165                       6031 log2:
      009E97 50 00 1F         [ 4] 6032 	call func_args 
      009E9A 03 1E            [ 1] 6033 	cp a,#1 
      009E9C 01 72            [ 1] 6034 	jreq 1$
      009E9E FB 03 A6         [ 2] 6035 	jp syntax_error 
      009EA1 84               [ 2] 6036 1$: popw x 
      002170                       6037 leading_one:
      009EA2 5B               [ 2] 6038 	tnzw x 
      009EA3 04 81            [ 1] 6039 	jreq 4$
      009EA5 A6 0F            [ 1] 6040 	ld a,#15 
      009EA5 A6               [ 2] 6041 2$: rlcw x 
      009EA6 0A CC            [ 1] 6042     jrc 3$
      009EA8 89               [ 1] 6043 	dec a 
      009EA9 7C FA            [ 2] 6044 	jra 2$
      009EAA 5F               [ 1] 6045 3$: clrw x 
      009EAA AE               [ 1] 6046     ld xl,a
      009EAB AA 80            [ 1] 6047 4$:	ld a,#TK_INTGR
      009EAD A6               [ 4] 6048 	ret 
                                   6049 
                                   6050 ;-----------------------------------
                                   6051 ; BASIC: BIT(expr) 
                                   6052 ; expr ->{0..15}
                                   6053 ; return 2^expr 
                                   6054 ; output:
                                   6055 ;    x    2^expr 
                                   6056 ;-----------------------------------
      002180                       6057 bitmask:
      009EAE 84 81 CD         [ 4] 6058     call func_args 
      009EB0 A1 01            [ 1] 6059 	cp a,#1
      009EB0 90 89            [ 1] 6060 	jreq 1$
      009EB2 CD 91 4D         [ 2] 6061 	jp syntax_error 
      009EB5 A1               [ 2] 6062 1$: popw x 
      009EB6 01               [ 1] 6063 	ld a,xl 
      009EB7 27 07            [ 1] 6064 	and a,#15
      009EB9 A1               [ 1] 6065 	clrw x 
      009EBA 02               [ 1] 6066 	incw x 
      009EBB 27               [ 1] 6067 2$: tnz a 
      009EBC 03 CC            [ 1] 6068 	jreq 3$
      009EBE 89               [ 2] 6069 	slaw x 
      009EBF 7A               [ 1] 6070 	dec a 
      009EC0 90 85            [ 2] 6071 	jra 2$ 
      009EC2 A1 01            [ 1] 6072 3$: ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009EC4 27               [ 4] 6073 	ret 
                                   6074 
                                   6075 ;------------------------------
                                   6076 ; BASIC: INVERT(expr)
                                   6077 ; 1's complement 
                                   6078 ;--------------------------------
      00219A                       6079 invert:
      009EC5 02 85 51         [ 4] 6080 	call func_args
      009EC8 90 FD            [ 1] 6081 	cp a,#1 
      009ECA 90 85            [ 1] 6082 	jreq 1$
      009ECC 81 08 FA         [ 2] 6083 	jp syntax_error
      009ECD 85               [ 2] 6084 1$: popw x  
      009ECD 72               [ 2] 6085 	cplw x 
      009ECE 0D 52            [ 1] 6086 	ld a,#TK_INTGR 
      009ED0 30               [ 4] 6087 	ret 
                                   6088 
                                   6089 ;------------------------------
                                   6090 ; BASIC: DO 
                                   6091 ; initiate a DO ... UNTIL loop 
                                   6092 ;------------------------------
                           000003  6093 	DOLP_ADR=3 
                           000005  6094 	DOLP_INW=5
                           000004  6095 	VSIZE=4 
      0021A9                       6096 do_loop:
      009ED1 FB               [ 2] 6097 	popw x 
      0021AA                       6098 	_vars VSIZE 
      009ED2 8E CC            [ 2]    1     sub sp,#VSIZE 
      009ED4 86               [ 2] 6099 	pushw x 
      009ED5 CE CE 00 04      [ 2] 6100 	ldw y,basicptr 
      009ED6 17 03            [ 2] 6101 	ldw (DOLP_ADR,sp),y
      009ED6 72 01 00 24      [ 2] 6102 	ldw y,in.w 
      009EDA 07 27            [ 2] 6103 	ldw (DOLP_INW,sp),y
      009EDC 05 A6 07 CC      [ 1] 6104 	inc loop_depth 
      009EE0 89               [ 4] 6105 	ret 
                                   6106 
                                   6107 ;--------------------------------
                                   6108 ; BASIC: UNTIL expr 
                                   6109 ; loop if exprssion is false 
                                   6110 ; else terminate loop
                                   6111 ;--------------------------------
      0021BE                       6112 until: 
      009EE1 7C 5D 00 20      [ 1] 6113 	tnz loop_depth 
      009EE2 26 03            [ 1] 6114 	jrne 1$ 
      009EE2 CD 8A 6C         [ 2] 6115 	jp syntax_error 
      0021C7                       6116 1$: 
      009EE5 4D 26 08         [ 4] 6117 	call relation 
      009EE8 AE 40            [ 1] 6118 	cp a,#TK_INTGR
      009EEA 00 CD            [ 1] 6119 	jreq 2$
      009EEC AA C0 4F         [ 2] 6120 	jp syntax_error
      0021D1                       6121 2$: 
      009EEF 81               [ 2] 6122 	tnzw x 
      009EF0 26 10            [ 1] 6123 	jrne 9$
      009EF0 A1 02            [ 2] 6124 	ldw x,(DOLP_ADR,sp)
      009EF2 27 03 CC         [ 2] 6125 	ldw basicptr,x 
      009EF5 89 7A            [ 1] 6126 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009EF7 C7 00 03         [ 1] 6127 	ld count,a 
      009EF7 7D 26            [ 2] 6128 	ldw x,(DOLP_INW,sp)
      009EF9 09 CD 87         [ 2] 6129 	ldw in.w,x 
      009EFC 97               [ 4] 6130 	ret 
      0021E4                       6131 9$:	; remove loop data from stack  
      009EFD 55               [ 2] 6132 	popw x
      0021E5                       6133 	_drop VSIZE
      009EFE 00 04            [ 2]    1     addw sp,#VSIZE 
      009F00 00 02 81 89      [ 1] 6134 	dec loop_depth 
      009F04 90               [ 2] 6135 	jp (x)
                                   6136 
                                   6137 ;--------------------------
                                   6138 ; BASIC: PRTA...PRTI  
                                   6139 ;  return constant value 
                                   6140 ;  PORT  offset in GPIO
                                   6141 ;  array
                                   6142 ;---------------------------
      0021EC                       6143 const_porta:
      009F05 93 CD 9B         [ 2] 6144 	ldw x,#0
      009F08 98 25            [ 1] 6145 	ld a,#TK_INTGR 
      009F0A 05               [ 4] 6146 	ret 
      0021F2                       6147 const_portb:
      009F0B A6 09 CC         [ 2] 6148 	ldw x,#1
      009F0E 89 7C            [ 1] 6149 	ld a,#TK_INTGR 
      009F10 81               [ 4] 6150 	ret 
      0021F8                       6151 const_portc:
      009F10 55 00 04         [ 2] 6152 	ldw x,#2
      009F13 00 02            [ 1] 6153 	ld a,#TK_INTGR 
      009F15 72               [ 4] 6154 	ret 
      0021FE                       6155 const_portd:
      009F16 5F 00 17         [ 2] 6156 	ldw x,#3
      009F19 AE 40            [ 1] 6157 	ld a,#TK_INTGR 
      009F1B 00               [ 4] 6158 	ret 
      002204                       6159 const_porte:
      009F1C CF 00 18         [ 2] 6160 	ldw x,#4
      009F1F 1E 01            [ 1] 6161 	ld a,#TK_INTGR 
      009F21 CD               [ 4] 6162 	ret 
      00220A                       6163 const_portf:
      009F22 84 8A 5F         [ 2] 6164 	ldw x,#5
      009F25 97 5C            [ 1] 6165 	ld a,#TK_INTGR 
      009F27 90               [ 4] 6166 	ret 
      002210                       6167 const_portg:
      009F28 85 89 5F         [ 2] 6168 	ldw x,#6
      009F2B CD 82            [ 1] 6169 	ld a,#TK_INTGR 
      009F2D E9               [ 4] 6170 	ret 
      002216                       6171 const_porth:
      009F2E 5B 02 81         [ 2] 6172 	ldw x,#7
      009F31 A6 84            [ 1] 6173 	ld a,#TK_INTGR 
      009F31 72               [ 4] 6174 	ret 
      00221C                       6175 const_porti:
      009F32 0D 52 30         [ 2] 6176 	ldw x,#8
      009F35 FB 72            [ 1] 6177 	ld a,#TK_INTGR 
      009F37 16               [ 4] 6178 	ret 
                                   6179 
                                   6180 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                   6181 ; following return constant 
                                   6182 ; related to GPIO register offset 
                                   6183 ;---------------------------------
      002222                       6184 const_odr:
      009F38 00 24            [ 1] 6185 	ld a,#TK_INTGR 
      009F3A 8E 81 00         [ 2] 6186 	ldw x,#GPIO_ODR
      009F3C 81               [ 4] 6187 	ret 
      002228                       6188 const_idr:
      009F3C CD 92            [ 1] 6189 	ld a,#TK_INTGR 
      009F3E 51 A1 84         [ 2] 6190 	ldw x,#GPIO_IDR
      009F41 27               [ 4] 6191 	ret 
      00222E                       6192 const_ddr:
      009F42 03 CC            [ 1] 6193 	ld a,#TK_INTGR 
      009F44 89 7A 02         [ 2] 6194 	ldw x,#GPIO_DDR
      009F46 81               [ 4] 6195 	ret 
      002234                       6196 const_cr1:
      009F46 5D 27            [ 1] 6197 	ld a,#TK_INTGR 
      009F48 04 8F 5A         [ 2] 6198 	ldw x,#GPIO_CR1
      009F4B 26               [ 4] 6199 	ret 
      00223A                       6200 const_cr2:
      009F4C F9 4F            [ 1] 6201 	ld a,#TK_INTGR 
      009F4E 81 00 04         [ 2] 6202 	ldw x,#GPIO_CR2
      009F4F 81               [ 4] 6203 	ret 
                                   6204 ;-------------------------
                                   6205 ;  constant for port mode
                                   6206 ;  used by PMODE 
                                   6207 ;  input or output
                                   6208 ;------------------------
      002240                       6209 const_output:
      009F4F CD 92            [ 1] 6210 	ld a,#TK_INTGR 
      009F51 51 A1 84         [ 2] 6211 	ldw x,#OUTP
      009F54 27               [ 4] 6212 	ret 
      002246                       6213 const_input:
      009F55 03 CC            [ 1] 6214 	ld a,#TK_INTGR 
      009F57 89 7A 00         [ 2] 6215 	ldw x,#INP 
      009F59 81               [ 4] 6216 	ret 
                                   6217 ;-----------------------
                                   6218 ; memory area constants
                                   6219 ;-----------------------
      00224C                       6220 const_eeprom_base:
      009F59 A3 14            [ 1] 6221 	ld a,#TK_INTGR 
      009F5B 00 2B 0C         [ 2] 6222 	ldw x,#EEPROM_BASE 
      009F5E 35               [ 4] 6223 	ret 
                                   6224 
                                   6225 ;---------------------------
                                   6226 ; BASIC: DATA 
                                   6227 ; when the interpreter find 
                                   6228 ; a DATA line it skip it.
                                   6229 ;---------------------------
      002252                       6230 data:
      009F5F 0F 50 F2 A6 1E   [ 1] 6231 	mov in,count 
      009F64 62               [ 4] 6232 	ret 
                                   6233 
                                   6234 ;---------------------------
                                   6235 ; BASIC: DATLN  *expr*
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                   6236 ; set DATA pointer at line# 
                                   6237 ; specified by *expr* 
                                   6238 ;---------------------------
      002258                       6239 data_line:
      009F65 A6 10 62         [ 4] 6240 	call expression
      009F68 20 1E            [ 1] 6241 	cp a,#TK_INTGR
      009F6A 27 03            [ 1] 6242 	jreq 1$
      009F6A A3 08 00         [ 2] 6243 	jp syntax_error 
      009F6D 2B 09 35         [ 4] 6244 1$: call search_lineno
      009F70 0E               [ 2] 6245 	tnzw x 
      009F71 50 F2            [ 1] 6246 	jrne 3$
      009F73 A6 50            [ 1] 6247 2$:	ld a,#ERR_NO_LINE 
      009F75 62 20 10         [ 2] 6248 	jp tb_error
      009F78                       6249 3$: ; check if valid data line 
      009F78 35 07            [ 1] 6250     ldw y,x 
      009F7A 50 F2            [ 2] 6251 	ldw x,(4,x)
      009F7C A3 22 52         [ 2] 6252 	cpw x,#data 
      009F7C A3 00            [ 1] 6253 	jrne 2$ 
      009F7E 40 23 07 72      [ 2] 6254 	ldw data_ptr,y
      009F82 5C 50 F2         [ 1] 6255 	ld a,(2,y)
      009F85 54 20 F4         [ 1] 6256 	ld data_len,a 
      009F88 35 06 00 08      [ 1] 6257 	mov data_ofs,#FIRST_DATA_ITEM 
      009F88 9F               [ 4] 6258 	ret
                                   6259 
                                   6260 ;---------------------------------
                                   6261 ; BASIC: RESTORE 
                                   6262 ; set data_ptr to first data line
                                   6263 ; if not DATA found pointer set to
                                   6264 ; zero 
                                   6265 ;---------------------------------
      002285                       6266 restore:
      009F89 4A 27 01 4A      [ 1] 6267 	clr data_ptr 
      009F8D 72 5F 00 07      [ 1] 6268 	clr data_ptr+1
      009F8D A4 3E C7 50      [ 1] 6269 	clr data_ofs 
      009F91 F1 72 18 50      [ 1] 6270 	clr data_len
      009F95 F0 8E 81         [ 2] 6271 	ldw x,txtbgn
      009F98                       6272 data_search_loop: 	
      009F98 CE 00 0F         [ 2] 6273 	cpw x,txtend
      009F9B A6 84            [ 1] 6274 	jruge 9$
      009F9D 81 93            [ 1] 6275 	ldw y,x 
      009F9E EE 04            [ 2] 6276 	ldw x,(4,x)
      009F9E CD 91 4D         [ 2] 6277 	addw x,#code_addr
      009FA1 A1               [ 2] 6278 	ldw x,(x)
      009FA2 01 27 03         [ 2] 6279 	cpw x,#data 
      009FA5 CC 89            [ 1] 6280 	jrne try_next_line 
      009FA7 7A CF 00 06      [ 2] 6281 	ldw data_ptr,y 
      009FA8 90 E6 02         [ 1] 6282 	ld a,(2,y)
      009FA8 85 9E A5         [ 1] 6283 	ld data_len,a 
      009FAB 80 27 01 50      [ 1] 6284 	mov data_ofs,#FIRST_DATA_ITEM
      009FAF A6 84 81 09      [ 1] 6285 9$:	tnz data_len 
      009FB2 26 05            [ 1] 6286     jrne 10$
      009FB2 CD 91            [ 1] 6287 	ld a,#ERR_NO_DATA 
      009FB4 4D A1 02         [ 2] 6288 	jp tb_error 
      009FB7 27               [ 4] 6289 10$:ret
      0022C4                       6290 try_next_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009FB8 03               [ 1] 6291 	ldw x,y 
      009FB9 CC 89            [ 1] 6292 	ld a,(2,x)
      009FBB 7A 85 9E         [ 1] 6293 	ld acc8,a 
      009FBE 14 01 95 9F      [ 1] 6294 	clr acc16 
      009FC2 14 02 97 5B      [ 2] 6295 	addw x,acc16 
      009FC6 02 A6            [ 2] 6296 	jra data_search_loop
                                   6297 
                                   6298 
                                   6299 ;---------------------------------
                                   6300 ; BASIC: READ 
                                   6301 ; return next data item | 0 
                                   6302 ;---------------------------------
                           000001  6303 	CTX_BPTR=1 
                           000003  6304 	CTX_IN=3 
                           000004  6305 	CTX_COUNT=4 
                           000005  6306 	XSAVE=5
                           000006  6307 	VSIZE=6
      0022D4                       6308 read:
      0022D4                       6309 	_vars  VSIZE 
      009FC8 84 81            [ 2]    1     sub sp,#VSIZE 
      009FCA                       6310 read01:	
      009FCA CD 91 4D         [ 1] 6311 	ld a,data_ofs
      009FCD A1 02 27         [ 1] 6312 	cp a,data_len 
      009FD0 03 CC            [ 1] 6313 	jreq 2$ ; end of line  
      009FD2 89 7A 24         [ 4] 6314 	call save_context
      009FD4 CE 00 06         [ 2] 6315 	ldw x,data_ptr 
      009FD4 85 9E 1A         [ 2] 6316 	ldw basicptr,x 
      009FD7 01 95 9F 1A 02   [ 1] 6317 	mov in,data_ofs 
      009FDC 97 5B 02 A6 84   [ 1] 6318 	mov count,data_len  
      009FE1 81 11 D1         [ 4] 6319 	call expression 
      009FE2 A1 84            [ 1] 6320 	cp a,#TK_INTGR 
      009FE2 CD 91            [ 1] 6321 	jreq 1$ 
      009FE4 4D A1 02         [ 2] 6322 	jp syntax_error 
      0022FB                       6323 1$:
      009FE7 27 03            [ 2] 6324 	ldw (XSAVE,SP),x
      009FE9 CC 89 7A         [ 4] 6325 	call next_token ; skip comma
      009FEC CE 00 04         [ 2] 6326 	ldw x,basicptr 
      009FEC 85 9E 18         [ 2] 6327 	ldw data_ptr,x 
      009FEF 01 95 9F 18 02   [ 1] 6328 	mov data_ofs,in 
      009FF4 97 5B 02         [ 4] 6329 	call rest_context
      009FF7 A6 84            [ 2] 6330 	ldw x,(XSAVE,sp)
      009FF9 81 84            [ 1] 6331 	ld a,#TK_INTGR
      009FFA                       6332 	_drop VSIZE 
      009FFA CD 91            [ 2]    1     addw sp,#VSIZE 
      009FFC 4D               [ 4] 6333 	ret 
      002315                       6334 2$: ; end of line reached 
      009FFD A1 02 27 03      [ 2] 6335 	ldw y, data_ptr 
      00A001 CC 89 7A 90      [ 1] 6336 	clr data_ptr
      00A005 85 85 90 5D      [ 1] 6337 	clr data_ptr+1   
      00A009 27 05 58 90      [ 1] 6338 	clr data_ofs 
      00A00D 5A 26 FB 09      [ 1] 6339 	clr data_len 
      00A010 CD 22 C4         [ 4] 6340 	call try_next_line 
      00A010 A6 84            [ 2] 6341 	jra read01
                                   6342 
                                   6343 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                   6344 ;---------------------------------
                                   6345 ; BASIC: SPIEN clkdiv, 0|1  
                                   6346 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6347 ; if clkdiv==-1 disable SPI
                                   6348 ; 0|1 -> disable|enable  
                                   6349 ;--------------------------------- 
                           000005  6350 SPI_CS_BIT=5
      00232E                       6351 spi_enable:
      00A012 81 10 D2         [ 4] 6352 	call arg_list 
      00A013 A1 02            [ 1] 6353 	cp a,#2
      00A013 CD 91            [ 1] 6354 	jreq 1$
      00A015 4D A1 02         [ 2] 6355 	jp syntax_error 
      002338                       6356 1$: 
      00A018 27 03 CC 89      [ 1] 6357 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A01C 7A               [ 2] 6358 	popw x  
      00A01D 90               [ 2] 6359 	tnzw x 
      00A01E 85 85            [ 1] 6360 	jreq spi_disable 
      00A020 90               [ 2] 6361 	popw x 
      00A021 5D 27            [ 1] 6362 	ld a,#(1<<SPI_CR1_BR)
      00A023 05               [ 4] 6363 	mul x,a 
      00A024 54               [ 1] 6364 	ld a,xl 
      00A025 90 5A 26         [ 1] 6365 	ld SPI_CR1,a 
                                   6366 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A028 FB 1A 50 14      [ 1] 6367 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A029 72 1A 50 16      [ 1] 6368 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6369 ; configure SPI as master mode 0.	
      00A029 A6 84 81 00      [ 1] 6370 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6371 ; ~CS line controlled by sofware 	
      00A02C 72 12 52 01      [ 1] 6372 	bset SPI_CR2,#SPI_CR2_SSM 
      00A02C A6 84 CD 91      [ 1] 6373     bset SPI_CR2,#SPI_CR2_SSI 
                                   6374 ; enable SPI
      00A030 40 9F A4 07      [ 1] 6375 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A034 C7               [ 4] 6376 	ret 
      002361                       6377 spi_disable:
      002361                       6378 	_drop #2; throw first argument.
      00A035 50 C6            [ 2]    1     addw sp,##2 
                                   6379 ; wait spi idle 
      00A037 81 82            [ 1] 6380 1$:	ld a,#0x82 
      00A038 C4 52 03         [ 1] 6381 	and a,SPI_SR
      00A038 52 01            [ 1] 6382 	cp a,#2 
      00A03A CD 91            [ 1] 6383 	jrne 1$
      00A03C 52 A1 02 27      [ 1] 6384 	bres SPI_CR1,#SPI_CR1_SPE
      00A040 03 CC 89 7A      [ 1] 6385 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A044 90 85 85 CD      [ 1] 6386 	bres PE_DDR,#SPI_CS_BIT 
      00A048 A0               [ 4] 6387 	ret 
                                   6388 
      002379                       6389 spi_clear_error:
      00A049 84 6B            [ 1] 6390 	ld a,#0x78 
      00A04B 01 A6 01         [ 1] 6391 	bcp a,SPI_SR 
      00A04E 0D 01            [ 1] 6392 	jreq 1$
      00A050 27 0D 48 0A      [ 1] 6393 	clr SPI_SR 
      00A054 01               [ 4] 6394 1$: ret 
                                   6395 
      002385                       6396 spi_send_byte:
      00A055 26               [ 1] 6397 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A056 FB 6B 01         [ 4] 6398 	call spi_clear_error
      00A059 7B               [ 1] 6399 	pop a 
      00A05A 01 EA 03 E7 03   [ 2] 6400 	btjf SPI_SR,#SPI_SR_TXE,.
      00A05F 90 A3 00         [ 1] 6401 	ld SPI_DR,a
      00A062 01 27 10 7B 01   [ 2] 6402 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A067 43 E4 04         [ 1] 6403 	ld a,SPI_DR 
      00A06A E7               [ 4] 6404 	ret 
                                   6405 
      00239B                       6406 spi_rcv_byte:
      00A06B 04 7B            [ 1] 6407 	ld a,#255
      00A06D 01 43 E4 02 E7   [ 2] 6408 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A072 02 20 0C         [ 1] 6409 	ld a,SPI_DR 
      00A075 81               [ 4] 6410 	ret
                                   6411 
                                   6412 ;------------------------------
                                   6413 ; BASIC: SPIWR byte [,byte]
                                   6414 ; write 1 or more byte
                                   6415 ;------------------------------
      0023A6                       6416 spi_write:
      00A075 7B 01 EA         [ 4] 6417 	call expression
      00A078 02 E7            [ 1] 6418 	cp a,#TK_INTGR 
      00A07A 02 7B            [ 1] 6419 	jreq 1$
      00A07C 01 EA 04         [ 2] 6420 	jp syntax_error 
      0023B0                       6421 1$:	
      00A07F E7               [ 1] 6422 	ld a,xl 
      00A080 04 23 85         [ 4] 6423 	call spi_send_byte 
      00A081 CD 09 EC         [ 4] 6424 	call next_token 
      00A081 5B 01            [ 1] 6425 	cp a,#TK_COMMA 
      00A083 81 02            [ 1] 6426 	jrne 2$ 
      00A084 20 E9            [ 2] 6427 	jra spi_write 
      00A084 58               [ 1] 6428 2$:	tnz a 
      00A085 1C A0            [ 1] 6429 	jreq 3$
      0023C0                       6430 	_unget_token  
      00A087 94 FE 9F 88 5E   [ 1]    1      mov in,in.saved  
      00A08C A6               [ 4] 6431 3$:	ret 
                                   6432 
                                   6433 
                                   6434 ;-------------------------------
                                   6435 ; BASIC: SPIRD 	
                                   6436 ; read one byte from SPI 
                                   6437 ;-------------------------------
      0023C6                       6438 spi_read:
      00A08D 05 42 1C         [ 4] 6439 	call spi_rcv_byte 
      00A090 50               [ 1] 6440 	clrw x 
      00A091 00               [ 1] 6441 	ld xl,a 
      00A092 84 81            [ 1] 6442 	ld a,#TK_INTGR 
      00A094 81               [ 4] 6443 	ret 
                                   6444 
                                   6445 ;------------------------------
                                   6446 ; BASIC: SPISEL 0|1 
                                   6447 ; set state of ~CS line
                                   6448 ; 0|1 deselect|select  
                                   6449 ;------------------------------
      0023CE                       6450 spi_select:
      00A094 03 06 03         [ 4] 6451 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A097 05 04            [ 1] 6452 	cp a,#TK_INTGR 
      00A099 00 02            [ 1] 6453 	jreq 1$
      00A09B 01 06 00         [ 2] 6454 	jp syntax_error 
      00A09E 02               [ 2] 6455 1$: tnzw x  
      00A09F 02 02            [ 1] 6456 	jreq cs_high 
      00A0A1 03 03 01 03      [ 1] 6457 	bres PE_ODR,#SPI_CS_BIT
      00A0A5 03               [ 4] 6458 	ret 
      0023E0                       6459 cs_high: 
      00A0A6 02 04 04 05      [ 1] 6460 	bset PE_ODR,#SPI_CS_BIT
      00A0AA 02               [ 4] 6461 	ret 
                                   6462 
                                   6463 
                                   6464 
                                   6465 ;-------------------------------
                                   6466 ; BASIC: PAD 
                                   6467 ; Return pad buffer address.
                                   6468 ;------------------------------
      0023E5                       6469 pad_ref:
      00A0AB 06 02 07         [ 2] 6470 	ldw x,#pad 
      00A0AE 02 05            [ 1] 6471 	ld a,TK_INTGR
      00A0B0 04               [ 4] 6472 	ret 
                                   6473 
                                   6474 ;------------------------------
                                   6475 ; BASIC; XTRMT  
                                   6476 ; transmit file using xmodem protocol
                                   6477 ; via terminal serial port 
                                   6478 ;------------------------------------
                           000001  6479 	SERIAL=1 ;packet serial number
                           000001  6480 	VAR_SIZE=1
      0023EB                       6481 transmit:
      0023EB                       6482 	_vars VAR_SIZE
      00A0B1 02 04            [ 2]    1     sub sp,#VAR_SIZE 
      00A0B3 01 24 6B         [ 2] 6483 	ldw x,#xtrmt_msg 
      00A0B4 CD 00 00         [ 4] 6484 	call puts 
                                   6485 ; end of file marker 
      00A0B4 CD 91 4D         [ 2] 6486 	ldw x,txtend 
      00A0B7 A1 01 27 03      [ 2] 6487 	ldw y,#END_IDX 
      00A0BB CC               [ 2] 6488 	ldw (x),y 
                                   6489 ; zeroes end of file 
      00A0BC 89 7A 02         [ 2] 6490 	addw x,#2 
      00A0BE 89               [ 2] 6491 	pushw x 
      00A0BE A6 80 15 01      [ 2] 6492 	subw x,txtbgn 
      00A0C2 27               [ 1] 6493 	ld a,xl 
      00A0C3 05 A6 0A         [ 1] 6494 	ld acc8,a 
      00A0C6 CC 89            [ 1] 6495 	ld a,#128 
      00A0C8 7C 00 0D         [ 1] 6496 	sub a,acc8 
      00A0C9 C7 00 0D         [ 1] 6497 	ld acc8,a 
      00A0C9 CE               [ 2] 6498 	popw x 
      00A0CA 00               [ 1] 6499 1$:	clr (x)
      00A0CB 13               [ 1] 6500 	incw x 
      00A0CC 58 58 58 58      [ 1] 6501 	dec acc8  
      00A0D0 58 9E            [ 1] 6502 	jrne 1$ 
                                   6503 ; transmit on other channel 	
      00A0D2 C8 00 13         [ 4] 6504 	call console_toggle  
      00A0D5 C7 00 0D 9F      [ 2] 6505 	ldw y,#10000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A0D9 C8 00 14         [ 4] 6506 	call getc_to ; receiver must send NAK  
      00A0DC C7 00            [ 1] 6507 	cp a,#NAK 
      00A0DE 0E CE            [ 1] 6508 	jrne tx_failed
      00A0E0 00 15            [ 1] 6509 	clr (SERIAL,sp)
      00A0E2 CF 00 13         [ 2] 6510 	ldw x,txtbgn
      00242B                       6511 tx_loop:
      00A0E5 90 54            [ 1] 6512 	ld a,(SERIAL,sp)
      00A0E7 90               [ 1] 6513 	inc a
      00A0E8 9E C8            [ 1] 6514 	ld (SERIAL,sp),a 
      00A0EA 00 15 C7         [ 4] 6515 	call xtrmt_block
      00A0ED 00 15            [ 1] 6516 	cp a,#NAK 
      00A0EF 90 9F            [ 1] 6517 	jreq tx_failed 
      00A0F1 C8 00 16         [ 2] 6518 	cpw x,txtend
      00A0F4 C7 00            [ 1] 6519 	jrult tx_loop 
      00243C                       6520 tx_success:
      00A0F6 16 CE            [ 1] 6521 	ld a,#EOT 
      00A0F8 00 0D 54         [ 4] 6522 	call putc 
      00A0FB 54 54 9E C8      [ 2] 6523 	ldw y,#1000
      00A0FF 00 0D 95         [ 4] 6524 	call getc_to  
      00A102 9F C8 00         [ 4] 6525 	call console_toggle
      00A105 0E 97 C8         [ 2] 6526 	ldw x,#x_success 
      00A108 00 16 97         [ 4] 6527 	call puts 
      00A10B 9E C8            [ 2] 6528 	jra tx_exit
      002453                       6529 tx_failed:
      00A10D 00 15            [ 1] 6530 	ld a,#CAN 
      00A10F 95 CF 00         [ 4] 6531 	call putc 
      00A112 15 90 85 65      [ 2] 6532 	ldw y,#1000 
      00A116 93 5C 4A         [ 4] 6533 	call drain 
      00A118 CD 24 F6         [ 4] 6534 	call console_toggle 
      00A118 A6 84 81         [ 2] 6535 	ldw x,#x_fail 
      00A11B CD 00 00         [ 4] 6536 	call puts 
      002468                       6537 tx_exit:
      002468                       6538 	_drop VAR_SIZE 
      00A11B 52 03            [ 2]    1     addw sp,#VAR_SIZE 
      00A11D 0F               [ 4] 6539 	ret
      00A11E 02 0F 03 90 AE A9 8D  6540 xtrmt_msg: .asciz "XMODEM transmit "	 
             93 F6 A4 0F 6B 01 0C
             03 5C F6
      00A12F CD 83 8A 0C 02 0A 01  6541 x_success: .asciz "succeeded.\n"
             26 F5 A6 46 11
      00A13B 02 2B 09 A6 20 CD 83  6542 x_fail: .asciz "failed.\n"
             8A 0C
                                   6543 
                                   6544 
                                   6545 ;------------------------------
                                   6546 ; BASIC: XRCV file_name 
                                   6547 ; receive a basic file using
                                   6548 ; xmodem protocol
                                   6549 ; via terminal serial port
                                   6550 ; file is expected to be tokenized 
                                   6551 ; BASIC file and is stored in RAM. 
                                   6552 ;------------------------------
      002491                       6553 receive: 
      00A144 02 20 07         [ 2] 6554 	ldw x,#xrcv_msg 
      00A147 A6 0D CD         [ 4] 6555 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                                   6556 ; wait 10 second for sender setup
                                   6557 ; drop characters while waiting 
      00A14A 83 8A 0F 02      [ 2] 6558 	ldw y,#10000
      00A14E 72 A2 00         [ 4] 6559 	call drain 
      00A151 02 90            [ 1] 6560 	ld a,#NAK 
      00A153 FE 26 CF         [ 4] 6561 	call putc 
      00A156 A6 0D CD         [ 2] 6562 	ldw x,txtbgn
      0024A6                       6563 rx_loop:
      00A159 83 8A 5F         [ 4] 6564 	call xrcv_block
      00A15C 7B 03            [ 1] 6565 	cp a,#EOT
      00A15E 97 CD            [ 1] 6566 	jreq rx_success 	
      00A160 8A CD            [ 1] 6567 	cp a,#NAK 
      00A162 AE A1            [ 1] 6568 	jreq rx_failed
      00A164 6B CD            [ 1] 6569 	cp a,#CAN 
      00A166 AA C0            [ 1] 6570 	jreq rx_failed 
      00A168 5B 03            [ 2] 6571 	jra rx_loop
      0024B7                       6572 rx_success:
                                   6573 ;back to END_IDX 	
      00A16A 81 20 77         [ 2] 6574 	cpw x,txtbgn
      00A16D 6F 72            [ 1] 6575 	jreq 1$ 
      00A16F 64 73            [ 1] 6576 	ldw y,x 
      00A171 20 69            [ 2] 6577 	ldw y,(y)
      00A173 6E 20 64 69      [ 2] 6578 	cpw y,#END_IDX 
      00A177 63 74            [ 1] 6579 	jreq 1$
      00A179 69               [ 2] 6580 	decw x 
      00A17A 6F 6E            [ 2] 6581 	jra rx_success
      00A17C 61 72 79         [ 2] 6582 1$:	ldw txtend,x 
      00A17F 0A 00 7C         [ 2] 6583 	ldw x,#x_success
      00A181 CD 00 00         [ 4] 6584 	call puts 
      00A181 CD               [ 4] 6585 	ret
      0024D3                       6586 rx_failed:
      00A182 91 52 A1         [ 2] 6587 	ldw x,#x_fail 
      00A185 01 27 03         [ 4] 6588 	call puts 
      00A188 CC               [ 4] 6589 	ret 
      00A189 89 7A 4F 44 45 4D 20  6590 xrcv_msg: .asciz "XMODEM receive "
             72 65 63 65 69 76 65
             20 00
                                   6591 
                                   6592 ;------------------------------
                                   6593 ; BASIC: COMA  
                                   6594 ; return device id of UART1 
                                   6595 ;------------------------------
      00A18B                       6596 const_coma:
      00A18B 85 CF            [ 1] 6597 	ld a,#TK_INTGR
      00A18D 00 11 81         [ 2] 6598 	ldw x,#UART1 
      00A190 81               [ 4] 6599 	ret
                                   6600 
                                   6601 ;------------------------------
                                   6602 ; BASIC: COMC 
                                   6603 ; return device id of UART3
                                   6604 ;------------------------------
      0024F0                       6605 const_comc:
      00A190 CE 00            [ 1] 6606 	ld a,#TK_INTGR
      00A192 11 00 02         [ 2] 6607 	ldw x,#UART3 
      00A193 81               [ 4] 6608 	ret 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



                                   6609 
                                   6610 ;-------------------------
                                   6611 ; console_toggle
                                   6612 ; switch to other console 
                                   6613 ; channel
                                   6614 ;-------------------------
      0024F6                       6615 console_toggle:
      00A193 53 A3            [ 1] 6616 	ld a,#UART3 
      00A195 FF FF 27         [ 1] 6617 	sub a,comm 
      00A198 01 5F A6         [ 2] 6618 	jp con_sel
                                   6619 
                                   6620 ;------------------------------
                                   6621 ; BASIC: CONSOLE COMA|COMC
                                   6622 ; select communication channel 
                                   6623 ; default is COMA
                                   6624 ;------------------------------
      0024FE                       6625 console_select:
      00A19B 84 81 EC         [ 4] 6626 	call next_token 
      00A19D A1 81            [ 1] 6627 	cp a,#TK_IFUNC
      00A19D CD 91            [ 1] 6628 	jreq 1$
      00A19F 4D A1 01         [ 2] 6629 	jp syntax_error
      00A1A2 27               [ 4] 6630 1$: call (x)
      00A1A3 03               [ 1] 6631 	ld a,xl 
                                   6632 ;-----------------------------
                                   6633 ; comm_sel 
                                   6634 ; input:
                                   6635 ;    A    channel UART1|UART3	
                                   6636 ;----------------------------
      00250A                       6637 con_sel:: 
      00A1A4 CC 89            [ 1] 6638 	cp a,#UART1 
      00A1A6 7A 85            [ 1] 6639 	jreq 4$
      00A1A8 20 E9            [ 1] 6640 	cp a,#UART3 
      00A1AA 27 19            [ 1] 6641 	jreq 6$
      00A1AA CD 91 52         [ 2] 6642 	jp syntax_error 
      00A1AD A1 01 27         [ 1] 6643 4$: ld comm,a  
      00A1B0 03 CC 89 7A      [ 1] 6644 	bres UART3_CR2,#UART_CR2_RIEN
      00A1B4 85 4B 00 35      [ 1] 6645 	clr rx_head 
      00A1B8 CC 50 E0 9E      [ 1] 6646 	clr rx_tail  
      00A1BC A4 3F            [ 1] 6647 	ld a,#UART1_DR
      00A1BE 95 A3 00 FF      [ 1] 6648 	bset UART1_CR2,#UART_CR2_RIEN 
      00A1C2 23               [ 4] 6649 	ret 
      00A1C3 06 0C 01         [ 1] 6650 6$: ld comm,a 
      00A1C6 98 56 20 F5      [ 1] 6651 	bres UART1_CR2,#UART_CR2_RIEN
      00A1CA 35 55 50 E0      [ 1] 6652 	clr rx_head 
      00A1CE 84 C7 50 E1      [ 1] 6653 	clr rx_tail 
      00A1D2 9F 4A            [ 1] 6654 	ld a,#UART3_DR  
      00A1D4 35 55 50 E0      [ 1] 6655 	bset UART3_CR2,#UART_CR2_RIEN 
      00A1D8 C7               [ 4] 6656 	ret 
                                   6657 
                                   6658 ;------------------------------
                                   6659 ;      dictionary 
                                   6660 ; format:
                                   6661 ;   link:   2 bytes 
                                   6662 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6663 ;   cmd_name: 16 byte max 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                                   6664 ;   cmd_index: 2 bytes 
                                   6665 ;------------------------------
                                   6666 	.macro _dict_entry len,name,cmd_idx 
                                   6667 	.word LINK 
                                   6668 	LINK=.
                                   6669 name:
                                   6670 	.byte len 	
                                   6671 	.ascii "name"
                                   6672 	.word cmd_idx 
                                   6673 	.endm 
                                   6674 
                           000000  6675 	LINK=0
                                   6676 ; respect alphabetic order for BASIC names from Z-A
                                   6677 ; this sort order is for a cleaner WORDS cmd output. 	
      002541                       6678 kword_end:
      002541                       6679 	_dict_entry,5,XTRMT,XTRMT_IDX ; xmodem transmit
      00A1D9 50 E2                    1 	.word LINK 
                           002543     2 	LINK=.
      002543                          3 XTRMT:
      00A1DB 35                       4 	.byte 5 	
      00A1DC AA 50 E0 81 54           5 	.ascii "XTRMT"
      00A1E0 00 C8                    6 	.word XTRMT_IDX 
      00254B                       6680 	_dict_entry,4,XRCV,XRCV_IDX ; xmodem receive
      00A1E0 35 AA                    1 	.word LINK 
                           00254D     2 	LINK=.
      00254D                          3 XRCV:
      00A1E2 50                       4 	.byte 4 	
      00A1E3 E0 81 43 56              5 	.ascii "XRCV"
      00A1E5 00 CA                    6 	.word XRCV_IDX 
      002554                       6681 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00A1E5 CD 91                    1 	.word LINK 
                           002556     2 	LINK=.
      002556                          3 XOR:
      00A1E7 4D                       4 	.byte 3+F_IFUNC 	
      00A1E8 A1 01 27                 5 	.ascii "XOR"
      00A1EB 03 CC                    6 	.word XOR_IDX 
      00255C                       6682 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A1ED 89 7A                    1 	.word LINK 
                           00255E     2 	LINK=.
      00255E                          3 WRITE:
      00A1EF 85                       4 	.byte 5 	
      00A1F0 57 52 49 54 45           5 	.ascii "WRITE"
      00A1F0 5D 27                    6 	.word WRITE_IDX 
      002566                       6683 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A1F2 0A A6                    1 	.word LINK 
                           002568     2 	LINK=.
      002568                          3 WORDS:
      00A1F4 0F                       4 	.byte 5 	
      00A1F5 59 25 03 4A 20           5 	.ascii "WORDS"
      00A1FA FA 5F                    6 	.word WORDS_IDX 
      002570                       6684 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A1FC 97 A6                    1 	.word LINK 
                           002572     2 	LINK=.
      002572                          3 WAIT:
      00A1FE 84                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A1FF 81 41 49 54              5 	.ascii "WAIT"
      00A200 00 C0                    6 	.word WAIT_IDX 
      002579                       6685 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A200 CD 91                    1 	.word LINK 
                           00257B     2 	LINK=.
      00257B                          3 USR:
      00A202 4D                       4 	.byte 3+F_IFUNC 	
      00A203 A1 01 27                 5 	.ascii "USR"
      00A206 03 CC                    6 	.word USR_IDX 
      002581                       6686 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A208 89 7A                    1 	.word LINK 
                           002583     2 	LINK=.
      002583                          3 UNTIL:
      00A20A 85                       4 	.byte 5 	
      00A20B 9F A4 0F 5F 5C           5 	.ascii "UNTIL"
      00A210 4D 27                    6 	.word UNTIL_IDX 
      00258B                       6687 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A212 04 58                    1 	.word LINK 
                           00258D     2 	LINK=.
      00258D                          3 UFLASH:
      00A214 4A                       4 	.byte 6+F_IFUNC 	
      00A215 20 F9 A6 84 81 48        5 	.ascii "UFLASH"
      00A21A 00 BA                    6 	.word UFLASH_IDX 
      002596                       6688 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A21A CD 91                    1 	.word LINK 
                           002598     2 	LINK=.
      002598                          3 UBOUND:
      00A21C 4D                       4 	.byte 6+F_IFUNC 	
      00A21D A1 01 27 03 CC 89        5 	.ascii "UBOUND"
      00A223 7A 85                    6 	.word UBOUND_IDX 
      0025A1                       6689 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A225 53 A6                    1 	.word LINK 
                           0025A3     2 	LINK=.
      0025A3                          3 TONE:
      00A227 84                       4 	.byte 4 	
      00A228 81 4F 4E 45              5 	.ascii "TONE"
      00A229 00 B6                    6 	.word TONE_IDX 
      0025AA                       6690 	_dict_entry,2,TO,TO_IDX;to
      00A229 85 52                    1 	.word LINK 
                           0025AC     2 	LINK=.
      0025AC                          3 TO:
      00A22B 04                       4 	.byte 2 	
      00A22C 89 90                    5 	.ascii "TO"
      00A22E CE 00                    6 	.word TO_IDX 
      0025B1                       6691 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A230 05 17                    1 	.word LINK 
                           0025B3     2 	LINK=.
      0025B3                          3 TIMEOUT:
      00A232 03                       4 	.byte 7+F_IFUNC 	
      00A233 90 CE 00 01 17 05 72     5 	.ascii "TIMEOUT"
      00A23A 5C 00                    6 	.word TMROUT_IDX 
      0025BD                       6692 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A23C 21 81                    1 	.word LINK 
                           0025BF     2 	LINK=.
      00A23E                          3 TIMER:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A23E 72                       4 	.byte 5 	
      00A23F 5D 00 21 26 03           5 	.ascii "TIMER"
      00A244 CC 89                    6 	.word TIMER_IDX 
      0025C7                       6693 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A246 7A BF                    1 	.word LINK 
                           0025C9     2 	LINK=.
      00A247                          3 TICKS:
      00A247 CD                       4 	.byte 5+F_IFUNC 	
      00A248 92 9D A1 84 27           5 	.ascii "TICKS"
      00A24D 03 CC                    6 	.word TICKS_IDX 
      0025D1                       6694 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A24F 89 7A                    1 	.word LINK 
                           0025D3     2 	LINK=.
      00A251                          3 STOP:
      00A251 5D                       4 	.byte 4 	
      00A252 26 10 1E 03              5 	.ascii "STOP"
      00A256 CF 00                    6 	.word STOP_IDX 
      0025DA                       6695 	_dict_entry,4,STEP,STEP_IDX;step 
      00A258 05 E6                    1 	.word LINK 
                           0025DC     2 	LINK=.
      0025DC                          3 STEP:
      00A25A 02                       4 	.byte 4 	
      00A25B C7 00 04 1E              5 	.ascii "STEP"
      00A25F 05 CF                    6 	.word STEP_IDX 
      0025E3                       6696 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A261 00 01                    1 	.word LINK 
                           0025E5     2 	LINK=.
      0025E5                          3 SPIWR:
      00A263 81                       4 	.byte 5 	
      00A264 53 50 49 57 52           5 	.ascii "SPIWR"
      00A264 85 5B                    6 	.word SPIWR_IDX 
      0025ED                       6697 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A266 04 72                    1 	.word LINK 
                           0025EF     2 	LINK=.
      0025EF                          3 SPISEL:
      00A268 5A                       4 	.byte 6 	
      00A269 00 21 FC 53 45 4C        5 	.ascii "SPISEL"
      00A26C 00 A6                    6 	.word SPISEL_IDX 
      0025F8                       6698 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A26C AE 00                    1 	.word LINK 
                           0025FA     2 	LINK=.
      0025FA                          3 SPIEN:
      00A26E 00                       4 	.byte 5 	
      00A26F A6 84 81 45 4E           5 	.ascii "SPIEN"
      00A272 00 A4                    6 	.word SPIEN_IDX 
      002602                       6699 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A272 AE 00                    1 	.word LINK 
                           002604     2 	LINK=.
      002604                          3 SPIRD:
      00A274 01                       4 	.byte 5+F_IFUNC 	
      00A275 A6 84 81 52 44           5 	.ascii "SPIRD"
      00A278 00 A2                    6 	.word SPIRD_IDX 
      00260C                       6700 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A278 AE 00                    1 	.word LINK 
                           00260E     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00260E                          3 SLEEP:
      00A27A 02                       4 	.byte 5 	
      00A27B A6 84 81 45 50           5 	.ascii "SLEEP"
      00A27E 00 A0                    6 	.word SLEEP_IDX 
      002616                       6701 	_dict_entry,4+F_IFUNC,SIZE,SIZE_IDX;size
      00A27E AE 00                    1 	.word LINK 
                           002618     2 	LINK=.
      002618                          3 SIZE:
      00A280 03                       4 	.byte 4+F_IFUNC 	
      00A281 A6 84 81 45              5 	.ascii "SIZE"
      00A284 00 9E                    6 	.word SIZE_IDX 
      00261F                       6702     _dict_entry,4,SHOW,SHOW_IDX;show 
      00A284 AE 00                    1 	.word LINK 
                           002621     2 	LINK=.
      002621                          3 SHOW:
      00A286 04                       4 	.byte 4 	
      00A287 A6 84 81 57              5 	.ascii "SHOW"
      00A28A 00 9C                    6 	.word SHOW_IDX 
      002628                       6703 	_dict_entry,4,SAVE,SAVE_IDX;save
      00A28A AE 00                    1 	.word LINK 
                           00262A     2 	LINK=.
      00262A                          3 SAVE:
      00A28C 05                       4 	.byte 4 	
      00A28D A6 84 81 45              5 	.ascii "SAVE"
      00A290 00 9A                    6 	.word SAVE_IDX 
      002631                       6704 	_dict_entry 3,RUN,RUN_IDX;run
      00A290 AE 00                    1 	.word LINK 
                           002633     2 	LINK=.
      002633                          3 RUN:
      00A292 06                       4 	.byte 3 	
      00A293 A6 84 81                 5 	.ascii "RUN"
      00A296 00 98                    6 	.word RUN_IDX 
      002639                       6705 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A296 AE 00                    1 	.word LINK 
                           00263B     2 	LINK=.
      00263B                          3 RSHIFT:
      00A298 07                       4 	.byte 6+F_IFUNC 	
      00A299 A6 84 81 49 46 54        5 	.ascii "RSHIFT"
      00A29C 00 96                    6 	.word RSHIFT_IDX 
      002644                       6706 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A29C AE 00                    1 	.word LINK 
                           002646     2 	LINK=.
      002646                          3 RND:
      00A29E 08                       4 	.byte 3+F_IFUNC 	
      00A29F A6 84 81                 5 	.ascii "RND"
      00A2A2 00 94                    6 	.word RND_IDX 
      00264C                       6707 	_dict_entry,6,RETURN,RET_IDX;return 
      00A2A2 A6 84                    1 	.word LINK 
                           00264E     2 	LINK=.
      00264E                          3 RETURN:
      00A2A4 AE                       4 	.byte 6 	
      00A2A5 00 00 81 55 52 4E        5 	.ascii "RETURN"
      00A2A8 00 92                    6 	.word RET_IDX 
      002657                       6708 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A2A8 A6 84                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                           002659     2 	LINK=.
      002659                          3 RESTORE:
      00A2AA AE                       4 	.byte 7 	
      00A2AB 00 01 81 54 4F 52 45     5 	.ascii "RESTORE"
      00A2AE 00 90                    6 	.word REST_IDX 
      002663                       6709 	_dict_entry 6,REMARK,REM_IDX;remark 
      00A2AE A6 84                    1 	.word LINK 
                           002665     2 	LINK=.
      002665                          3 REMARK:
      00A2B0 AE                       4 	.byte 6 	
      00A2B1 00 02 81 41 52 4B        5 	.ascii "REMARK"
      00A2B4 00 8E                    6 	.word REM_IDX 
      00266E                       6710 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A2B4 A6 84                    1 	.word LINK 
                           002670     2 	LINK=.
      002670                          3 REBOOT:
      00A2B6 AE                       4 	.byte 6 	
      00A2B7 00 03 81 4F 4F 54        5 	.ascii "REBOOT"
      00A2BA 00 8C                    6 	.word RBT_IDX 
      002679                       6711 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A2BA A6 84                    1 	.word LINK 
                           00267B     2 	LINK=.
      00267B                          3 READ:
      00A2BC AE                       4 	.byte 4+F_IFUNC 	
      00A2BD 00 04 81 44              5 	.ascii "READ"
      00A2C0 00 8A                    6 	.word READ_IDX 
      002682                       6712 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A2C0 A6 84                    1 	.word LINK 
                           002684     2 	LINK=.
      002684                          3 QKEY:
      00A2C2 AE                       4 	.byte 4+F_IFUNC 	
      00A2C3 00 01 81 59              5 	.ascii "QKEY"
      00A2C6 00 88                    6 	.word QKEY_IDX 
      00268B                       6713 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00A2C6 A6 84                    1 	.word LINK 
                           00268D     2 	LINK=.
      00268D                          3 PRTI:
      00A2C8 AE                       4 	.byte 4+F_IFUNC 	
      00A2C9 00 00 81 49              5 	.ascii "PRTI"
      00A2CC 00 86                    6 	.word PRTI_IDX 
      002694                       6714 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00A2CC A6 84                    1 	.word LINK 
                           002696     2 	LINK=.
      002696                          3 PRTH:
      00A2CE AE                       4 	.byte 4+F_IFUNC 	
      00A2CF 40 00 81 48              5 	.ascii "PRTH"
      00A2D2 00 84                    6 	.word PRTH_IDX 
      00269D                       6715 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00A2D2 55 00                    1 	.word LINK 
                           00269F     2 	LINK=.
      00269F                          3 PRTG:
      00A2D4 04                       4 	.byte 4+F_IFUNC 	
      00A2D5 00 02 81 47              5 	.ascii "PRTG"
      00A2D8 00 82                    6 	.word PRTG_IDX 
      0026A6                       6716 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A2D8 CD 92                    1 	.word LINK 
                           0026A8     2 	LINK=.
      0026A8                          3 PRTF:
      00A2DA 51                       4 	.byte 4+F_IFUNC 	
      00A2DB A1 84 27 03              5 	.ascii "PRTF"
      00A2DF CC 89                    6 	.word PRTF_IDX 
      0026AF                       6717 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00A2E1 7A CD                    1 	.word LINK 
                           0026B1     2 	LINK=.
      0026B1                          3 PRTE:
      00A2E3 84                       4 	.byte 4+F_IFUNC 	
      00A2E4 F6 5D 26 05              5 	.ascii "PRTE"
      00A2E8 A6 05                    6 	.word PRTE_IDX 
      0026B8                       6718 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00A2EA CC 89                    1 	.word LINK 
                           0026BA     2 	LINK=.
      0026BA                          3 PRTD:
      00A2EC 7C                       4 	.byte 4+F_IFUNC 	
      00A2ED 50 52 54 44              5 	.ascii "PRTD"
      00A2ED 90 93                    6 	.word PRTD_IDX 
      0026C1                       6719 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00A2EF EE 04                    1 	.word LINK 
                           0026C3     2 	LINK=.
      0026C3                          3 PRTC:
      00A2F1 A3                       4 	.byte 4+F_IFUNC 	
      00A2F2 A2 D2 26 F2              5 	.ascii "PRTC"
      00A2F6 90 CF                    6 	.word PRTC_IDX 
      0026CA                       6720 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00A2F8 00 07                    1 	.word LINK 
                           0026CC     2 	LINK=.
      0026CC                          3 PRTB:
      00A2FA 90                       4 	.byte 4+F_IFUNC 	
      00A2FB E6 02 C7 00              5 	.ascii "PRTB"
      00A2FF 0A 35                    6 	.word PRTB_IDX 
      0026D3                       6721 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00A301 06 00                    1 	.word LINK 
                           0026D5     2 	LINK=.
      0026D5                          3 PRTA:
      00A303 09                       4 	.byte 4+F_IFUNC 	
      00A304 81 52 54 41              5 	.ascii "PRTA"
      00A305 00 76                    6 	.word PRTA_IDX 
      0026DC                       6722 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A305 72 5F                    1 	.word LINK 
                           0026DE     2 	LINK=.
      0026DE                          3 PRINT:
      00A307 00                       4 	.byte 5 	
      00A308 07 72 5F 00 08           5 	.ascii "PRINT"
      00A30D 72 5F                    6 	.word PRT_IDX 
      0026E6                       6723 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A30F 00 09                    1 	.word LINK 
                           0026E8     2 	LINK=.
      0026E8                          3 POUT:
      00A311 72                       4 	.byte 4+F_IFUNC 	
      00A312 5F 00 0A CE              5 	.ascii "POUT"
      00A316 00 1D                    6 	.word POUT_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A318                       6724 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A318 C3 00                    1 	.word LINK 
                           0026F1     2 	LINK=.
      0026F1                          3 POKE:
      00A31A 1F                       4 	.byte 4 	
      00A31B 24 1B 90 93              5 	.ascii "POKE"
      00A31F EE 04                    6 	.word POKE_IDX 
      0026F8                       6725 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A321 1C A9                    1 	.word LINK 
                           0026FA     2 	LINK=.
      0026FA                          3 PINP:
      00A323 93                       4 	.byte 4+F_IFUNC 	
      00A324 FE A3 A2 D2              5 	.ascii "PINP"
      00A328 26 1A                    6 	.word PINP_IDX 
      002701                       6726 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A32A 90 CF                    1 	.word LINK 
                           002703     2 	LINK=.
      002703                          3 PEEK:
      00A32C 00                       4 	.byte 4+F_IFUNC 	
      00A32D 07 90 E6 02              5 	.ascii "PEEK"
      00A331 C7 00                    6 	.word PEEK_IDX 
      00270A                       6727 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A333 0A 35                    1 	.word LINK 
                           00270C     2 	LINK=.
      00270C                          3 PMODE:
      00A335 06                       4 	.byte 5 	
      00A336 00 09 72 5D 00           5 	.ascii "PMODE"
      00A33B 0A 26                    6 	.word PMODE_IDX 
      002714                       6728 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00A33D 05 A6                    1 	.word LINK 
                           002716     2 	LINK=.
      002716                          3 PAUSE:
      00A33F 0C                       4 	.byte 5 	
      00A340 CC 89 7C 81 45           5 	.ascii "PAUSE"
      00A344 00 68                    6 	.word PAUSE_IDX 
      00271E                       6729 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A344 93 E6                    1 	.word LINK 
                           002720     2 	LINK=.
      002720                          3 PAD:
      00A346 02                       4 	.byte 3+F_IFUNC 	
      00A347 C7 00 0E                 5 	.ascii "PAD"
      00A34A 72 5F                    6 	.word PAD_IDX 
      002726                       6730 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A34C 00 0D                    1 	.word LINK 
                           002728     2 	LINK=.
      002728                          3 OR:
      00A34E 72                       4 	.byte 2+F_IFUNC 	
      00A34F BB 00                    5 	.ascii "OR"
      00A351 0D 20                    6 	.word OR_IDX 
      00272D                       6731 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00A353 C4 28                    1 	.word LINK 
                           00272F     2 	LINK=.
      00A354                          3 ODR:
      00A354 52                       4 	.byte 3+F_IFUNC 	
      00A355 06 44 52                 5 	.ascii "ODR"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A356 00 62                    6 	.word ODR_IDX 
      002735                       6732 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A356 C6 00                    1 	.word LINK 
                           002737     2 	LINK=.
      002737                          3 NOT:
      00A358 09                       4 	.byte 3+F_IFUNC 	
      00A359 C1 00 0A                 5 	.ascii "NOT"
      00A35C 27 37                    6 	.word NOT_IDX 
      00273D                       6733 	_dict_entry,3,NEW,NEW_IDX;new
      00A35E CD 96                    1 	.word LINK 
                           00273F     2 	LINK=.
      00273F                          3 NEW:
      00A360 A4                       4 	.byte 3 	
      00A361 CE 00 07                 5 	.ascii "NEW"
      00A364 CF 00                    6 	.word NEW_IDX 
      002745                       6734 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A366 05 55                    1 	.word LINK 
                           002747     2 	LINK=.
      002747                          3 NEXT:
      00A368 00                       4 	.byte 4 	
      00A369 09 00 02 55              5 	.ascii "NEXT"
      00A36D 00 0A                    6 	.word NEXT_IDX 
      00274E                       6735 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00A36F 00 04                    1 	.word LINK 
                           002750     2 	LINK=.
      002750                          3 MULDIV:
      00A371 CD                       4 	.byte 6+F_IFUNC 	
      00A372 92 51 A1 84 27 03        5 	.ascii "MULDIV"
      00A378 CC 89                    6 	.word MULDIV_IDX 
      002759                       6736 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00A37A 7A 50                    1 	.word LINK 
                           00275B     2 	LINK=.
      00A37B                          3 LSHIFT:
      00A37B 1F                       4 	.byte 6+F_IFUNC 	
      00A37C 05 CD 8A 6C CE 00        5 	.ascii "LSHIFT"
      00A382 05 CF                    6 	.word LSHIFT_IDX 
      002764                       6737 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00A384 00 07                    1 	.word LINK 
                           002766     2 	LINK=.
      002766                          3 LOG:
      00A386 55                       4 	.byte 3+F_IFUNC 	
      00A387 00 02 00                 5 	.ascii "LOG"
      00A38A 09 CD                    6 	.word LOG_IDX 
      00276C                       6738 	_dict_entry,4,LOAD,LOAD_IDX;load 
      00A38C 96 B4                    1 	.word LINK 
                           00276E     2 	LINK=.
      00276E                          3 LOAD:
      00A38E 1E                       4 	.byte 4 	
      00A38F 05 A6 84 5B              5 	.ascii "LOAD"
      00A393 06 81                    6 	.word LOAD_IDX 
      00A395                       6739 	_dict_entry 4,LIST,LIST_IDX;list
      00A395 90 CE                    1 	.word LINK 
                           002777     2 	LINK=.
      002777                          3 LIST:
      00A397 00                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A398 07 72 5F 00              5 	.ascii "LIST"
      00A39C 07 72                    6 	.word LIST_IDX 
      00277E                       6740 	_dict_entry 3,LET,LET_IDX;let 
      00A39E 5F 00                    1 	.word LINK 
                           002780     2 	LINK=.
      002780                          3 LET:
      00A3A0 08                       4 	.byte 3 	
      00A3A1 72 5F 00                 5 	.ascii "LET"
      00A3A4 09 72                    6 	.word LET_IDX 
      002786                       6741 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      00A3A6 5F 00                    1 	.word LINK 
                           002788     2 	LINK=.
      002788                          3 KEY:
      00A3A8 0A                       4 	.byte 3+F_IFUNC 	
      00A3A9 CD A3 44                 5 	.ascii "KEY"
      00A3AC 20 A8                    6 	.word KEY_IDX 
      00A3AE                       6742 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00A3AE CD 91                    1 	.word LINK 
                           002790     2 	LINK=.
      002790                          3 IWDGREF:
      00A3B0 52                       4 	.byte 7 	
      00A3B1 A1 02 27 03 CC 89 7A     5 	.ascii "IWDGREF"
      00A3B8 00 4C                    6 	.word IWDGREF_IDX 
      00279A                       6743 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00A3B8 72 12                    1 	.word LINK 
                           00279C     2 	LINK=.
      00279C                          3 IWDGEN:
      00A3BA 50                       4 	.byte 6 	
      00A3BB C7 85 5D 27 21 85        5 	.ascii "IWDGEN"
      00A3C1 A6 08                    6 	.word IWDGEN_IDX 
      0027A5                       6744 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00A3C3 42 9F                    1 	.word LINK 
                           0027A7     2 	LINK=.
      0027A7                          3 INVERT:
      00A3C5 C7                       4 	.byte 6+F_IFUNC 	
      00A3C6 52 00 72 1A 50 14        5 	.ascii "INVERT"
      00A3CC 72 1A                    6 	.word INVERT_IDX 
      0027B0                       6745 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00A3CE 50 16                    1 	.word LINK 
                           0027B2     2 	LINK=.
      0027B2                          3 INPUT:
      00A3D0 72                       4 	.byte 5 	
      00A3D1 14 52 00 72 12           5 	.ascii "INPUT"
      00A3D6 52 01                    6 	.word INPUT_IDX 
      0027BA                       6746 	_dict_entry,2,IF,IF_IDX;if 
      00A3D8 72 10                    1 	.word LINK 
                           0027BC     2 	LINK=.
      0027BC                          3 IF:
      00A3DA 52                       4 	.byte 2 	
      00A3DB 01 72                    5 	.ascii "IF"
      00A3DD 1C 52                    6 	.word IF_IDX 
      0027C1                       6747 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00A3DF 00 81                    1 	.word LINK 
                           0027C3     2 	LINK=.
      00A3E1                          3 IDR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A3E1 5B                       4 	.byte 3+F_IFUNC 	
      00A3E2 02 A6 82                 5 	.ascii "IDR"
      00A3E5 C4 52                    6 	.word IDR_IDX 
      0027C9                       6748 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00A3E7 03 A1                    1 	.word LINK 
                           0027CB     2 	LINK=.
      0027CB                          3 HEX:
      00A3E9 02                       4 	.byte 3 	
      00A3EA 26 F7 72                 5 	.ascii "HEX"
      00A3ED 1D 52                    6 	.word HEX_IDX 
      0027D1                       6749 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00A3EF 00 72                    1 	.word LINK 
                           0027D3     2 	LINK=.
      0027D3                          3 GPIO:
      00A3F1 13                       4 	.byte 4+F_IFUNC 	
      00A3F2 50 C7 72 1B              5 	.ascii "GPIO"
      00A3F6 50 16                    6 	.word GPIO_IDX 
      0027DA                       6750 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00A3F8 81 D3                    1 	.word LINK 
                           0027DC     2 	LINK=.
      00A3F9                          3 GOTO:
      00A3F9 A6                       4 	.byte 4 	
      00A3FA 78 C5 52 03              5 	.ascii "GOTO"
      00A3FE 27 04                    6 	.word GOTO_IDX 
      0027E3                       6751 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00A400 72 5F                    1 	.word LINK 
                           0027E5     2 	LINK=.
      0027E5                          3 GOSUB:
      00A402 52                       4 	.byte 5 	
      00A403 03 81 53 55 42           5 	.ascii "GOSUB"
      00A405 00 3A                    6 	.word GOSUB_IDX 
      0027ED                       6752 	_dict_entry,6,FORGET,FORGET_IDX;forget 
      00A405 88 CD                    1 	.word LINK 
                           0027EF     2 	LINK=.
      0027EF                          3 FORGET:
      00A407 A3                       4 	.byte 6 	
      00A408 F9 84 72 03 52 03        5 	.ascii "FORGET"
      00A40E FB C7                    6 	.word FORGET_IDX 
      0027F8                       6753 	_dict_entry,3,FOR,FOR_IDX;for 
      00A410 52 04                    1 	.word LINK 
                           0027FA     2 	LINK=.
      0027FA                          3 FOR:
      00A412 72                       4 	.byte 3 	
      00A413 01 52 03                 5 	.ascii "FOR"
      00A416 FB C6                    6 	.word FOR_IDX 
      002800                       6754 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00A418 52 04                    1 	.word LINK 
                           002802     2 	LINK=.
      002802                          3 FCPU:
      00A41A 81                       4 	.byte 4 	
      00A41B 46 43 50 55              5 	.ascii "FCPU"
      00A41B A6 FF                    6 	.word FCPU_IDX 
      002809                       6755 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00A41D 72 01                    1 	.word LINK 
                           00280B     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00280B                          3 EEPROM:
      00A41F 52                       4 	.byte 6+F_IFUNC 	
      00A420 03 E3 C6 52 04 81        5 	.ascii "EEPROM"
      00A426 00 32                    6 	.word EEPROM_IDX 
      002814                       6756 	_dict_entry,3,END,END_IDX;cmd_end  
      00A426 CD 92                    1 	.word LINK 
                           002816     2 	LINK=.
      002816                          3 END:
      00A428 51                       4 	.byte 3 	
      00A429 A1 84 27                 5 	.ascii "END"
      00A42C 03 CC                    6 	.word END_IDX 
      00281C                       6757 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00A42E 89 7A                    1 	.word LINK 
                           00281E     2 	LINK=.
      00A430                          3 DWRITE:
      00A430 9F                       4 	.byte 6+F_CMD 	
      00A431 CD A4 05 CD 8A 6C        5 	.ascii "DWRITE"
      00A437 A1 09                    6 	.word DWRITE_IDX 
      002827                       6758 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00A439 26 02                    1 	.word LINK 
                           002829     2 	LINK=.
      002829                          3 DREAD:
      00A43B 20                       4 	.byte 5+F_IFUNC 	
      00A43C E9 4D 27 05 55           5 	.ascii "DREAD"
      00A441 00 03                    6 	.word DREAD_IDX 
      002831                       6759 	_dict_entry,2,DO,DO_IDX;do_loop
      00A443 00 02                    1 	.word LINK 
                           002833     2 	LINK=.
      002833                          3 DO:
      00A445 81                       4 	.byte 2 	
      00A446 44 4F                    5 	.ascii "DO"
      00A446 CD A4                    6 	.word DO_IDX 
      002838                       6760 	_dict_entry,3,DIR,DIR_IDX;directory 
      00A448 1B 5F                    1 	.word LINK 
                           00283A     2 	LINK=.
      00283A                          3 DIR:
      00A44A 97                       4 	.byte 3 	
      00A44B A6 84 81                 5 	.ascii "DIR"
      00A44E 00 28                    6 	.word DIR_IDX 
      002840                       6761 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00A44E CD 8A                    1 	.word LINK 
                           002842     2 	LINK=.
      002842                          3 DEC:
      00A450 6C                       4 	.byte 3 	
      00A451 A1 84 27                 5 	.ascii "DEC"
      00A454 03 CC                    6 	.word DEC_IDX 
      002848                       6762 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00A456 89 7A                    1 	.word LINK 
                           00284A     2 	LINK=.
      00284A                          3 DDR:
      00A458 5D                       4 	.byte 3+F_IFUNC 	
      00A459 27 05 72                 5 	.ascii "DDR"
      00A45C 1B 50                    6 	.word DDR_IDX 
      002850                       6763 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      00A45E 14 81                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                           002852     2 	LINK=.
      00A460                          3 DATALN:
      00A460 72                       4 	.byte 6 	
      00A461 1A 50 14 81 4C 4E        5 	.ascii "DATALN"
      00A465 00 22                    6 	.word DATALN_IDX 
      00285B                       6764 	_dict_entry,4,DATA,DATA_IDX;data  
      00A465 AE 16                    1 	.word LINK 
                           00285D     2 	LINK=.
      00285D                          3 DATA:
      00A467 E0                       4 	.byte 4 	
      00A468 B6 84 81 41              5 	.ascii "DATA"
      00A46B 00 20                    6 	.word DATA_IDX 
      002864                       6765 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00A46B 52 01                    1 	.word LINK 
                           002866     2 	LINK=.
      002866                          3 CRL:
      00A46D AE                       4 	.byte 3+F_IFUNC 	
      00A46E A4 EB CD                 5 	.ascii "CRL"
      00A471 AA C0                    6 	.word CRL_IDX 
      00286C                       6766 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00A473 CE 00                    1 	.word LINK 
                           00286E     2 	LINK=.
      00286E                          3 CRH:
      00A475 1F                       4 	.byte 3+F_IFUNC 	
      00A476 90 AE 00                 5 	.ascii "CRH"
      00A479 30 FF                    6 	.word CRH_IDX 
      002874                       6767 	_dict_entry,7,CONSOLE,CONS_IDX ; console_select
      00A47B 1C 00                    1 	.word LINK 
                           002876     2 	LINK=.
      002876                          3 CONSOLE:
      00A47D 02                       4 	.byte 7 	
      00A47E 89 72 B0 00 1D 9F C7     5 	.ascii "CONSOLE"
      00A485 00 0E                    6 	.word CONS_IDX 
      002880                       6768 	_dict_entry,4+F_IFUNC,COMC,COMC_IDX ; const_uarta
      00A487 A6 80                    1 	.word LINK 
                           002882     2 	LINK=.
      002882                          3 COMC:
      00A489 C0                       4 	.byte 4+F_IFUNC 	
      00A48A 00 0E C7 00              5 	.ascii "COMC"
      00A48E 0E 85                    6 	.word COMC_IDX 
      002889                       6769 	_dict_entry,4+F_IFUNC,COMA,COMA_IDX ; const_uartc 
      00A490 7F 5C                    1 	.word LINK 
                           00288B     2 	LINK=.
      00288B                          3 COMA:
      00A492 72                       4 	.byte 4+F_IFUNC 	
      00A493 5A 00 0E 26              5 	.ascii "COMA"
      00A497 F8 CD                    6 	.word COMA_IDX 
      002892                       6770 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00A499 A5 76                    1 	.word LINK 
                           002894     2 	LINK=.
      002894                          3 CHAR:
      00A49B 90                       4 	.byte 4+F_CFUNC 	
      00A49C AE 27 10 CD              5 	.ascii "CHAR"
      00A4A0 AD 8A                    6 	.word CHAR_IDX 
      00289B                       6771 	_dict_entry,3,BYE,BYE_IDX;bye 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A4A2 A1 15                    1 	.word LINK 
                           00289D     2 	LINK=.
      00289D                          3 BYE:
      00A4A4 26                       4 	.byte 3 	
      00A4A5 2D 0F 01                 5 	.ascii "BYE"
      00A4A8 CE 00                    6 	.word BYE_IDX 
      0028A3                       6772 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00A4AA 1D 9D                    1 	.word LINK 
                           0028A5     2 	LINK=.
      00A4AB                          3 BTOGL:
      00A4AB 7B                       4 	.byte 5 	
      00A4AC 01 4C 6B 01 CD           5 	.ascii "BTOGL"
      00A4B1 AD E7                    6 	.word BTOGL_IDX 
      0028AD                       6773 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00A4B3 A1 15                    1 	.word LINK 
                           0028AF     2 	LINK=.
      0028AF                          3 BTEST:
      00A4B5 27                       4 	.byte 5+F_IFUNC 	
      00A4B6 1C C3 00 1F 25           5 	.ascii "BTEST"
      00A4BB EF 14                    6 	.word BTEST_IDX 
      00A4BC                       6774 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00A4BC A6 04                    1 	.word LINK 
                           0028B9     2 	LINK=.
      0028B9                          3 BSET:
      00A4BE CD                       4 	.byte 4 	
      00A4BF 83 8A 90 AE              5 	.ascii "BSET"
      00A4C3 03 E8                    6 	.word BSET_IDX 
      0028C0                       6775 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00A4C5 CD AD                    1 	.word LINK 
                           0028C2     2 	LINK=.
      0028C2                          3 BRES:
      00A4C7 8A                       4 	.byte 4 	
      00A4C8 CD A5 76 AE              5 	.ascii "BRES"
      00A4CC A4 FC                    6 	.word BRES_IDX 
      0028C9                       6776 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00A4CE CD AA                    1 	.word LINK 
                           0028CB     2 	LINK=.
      0028CB                          3 BIT:
      00A4D0 C0                       4 	.byte 3+F_IFUNC 	
      00A4D1 20 15 54                 5 	.ascii "BIT"
      00A4D3 00 0E                    6 	.word BIT_IDX 
      0028D1                       6777 	_dict_entry,3,AWU,AWU_IDX;awu 
      00A4D3 A6 18                    1 	.word LINK 
                           0028D3     2 	LINK=.
      0028D3                          3 AWU:
      00A4D5 CD                       4 	.byte 3 	
      00A4D6 83 8A 90                 5 	.ascii "AWU"
      00A4D9 AE 03                    6 	.word AWU_IDX 
      0028D9                       6778 	_dict_entry,7,AUTORUN,AUTORUN_IDX;autorun
      00A4DB E8 CD                    1 	.word LINK 
                           0028DB     2 	LINK=.
      0028DB                          3 AUTORUN:
      00A4DD 83                       4 	.byte 7 	
      00A4DE CA CD A5 76 AE A5 08     5 	.ascii "AUTORUN"
      00A4E5 CD AA                    6 	.word AUTORUN_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      0028E5                       6779 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00A4E7 C0 DB                    1 	.word LINK 
                           0028E7     2 	LINK=.
      00A4E8                          3 ASC:
      00A4E8 5B                       4 	.byte 3+F_IFUNC 	
      00A4E9 01 81 58                 5 	.ascii "ASC"
      00A4EC 4D 4F                    6 	.word ASC_IDX 
      0028ED                       6780 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00A4EE 44 45                    1 	.word LINK 
                           0028EF     2 	LINK=.
      0028EF                          3 AND:
      00A4F0 4D                       4 	.byte 3+F_IFUNC 	
      00A4F1 20 74 72                 5 	.ascii "AND"
      00A4F4 61 6E                    6 	.word AND_IDX 
      0028F5                       6781 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00A4F6 73 6D                    1 	.word LINK 
                           0028F7     2 	LINK=.
      0028F7                          3 ADCREAD:
      00A4F8 69                       4 	.byte 7+F_IFUNC 	
      00A4F9 74 20 00 73 75 63 63     5 	.ascii "ADCREAD"
      00A500 65 65                    6 	.word ADCREAD_IDX 
      002901                       6782 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00A502 64 65                    1 	.word LINK 
                           002903     2 	LINK=.
      002903                          3 ADCON:
      00A504 64                       4 	.byte 5 	
      00A505 2E 0A 00 66 61           5 	.ascii "ADCON"
      00A50A 69 6C                    6 	.word ADCON_IDX 
      00290B                       6783 kword_dict:
      00290B                       6784 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00A50C 65 64                    1 	.word LINK 
                           00290D     2 	LINK=.
      00290D                          3 ABS:
      00A50E 2E                       4 	.byte 3+F_IFUNC 	
      00A50F 0A 00 53                 5 	.ascii "ABS"
      00A511 00 00                    6 	.word ABS_IDX 
                                   6785 
                                   6786 ;comands and fonctions address table 	
      002913                       6787 code_addr:
      00A511 AE A5 5A CD AA C0 90  6788 	.word abs,power_adc,analog_read,bit_and,ascii,autorun,awu,bitmask ; 0..7
             AE 27 10 CD 83 CA A6
             15 CD
      00A521 83 8A CE 00 1D 0C 16  6789 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             FC 1E 4D 1D B2 22 3A
      00A526 22 34 22 52 22 58 22  6790 	.word const_cr1,data,data_line,const_ddr,dec_base,directory,do_loop,digital_read,digital_write ;16..23 
             2E 12 BB 1C F9 21 A9
             19 BD 19 ED
      00A526 CD AD 9F A1 04 27 0A  6791 	.word cmd_end,const_eeprom_base,fcpu,for,forget,gosub,goto,gpio ; 24..31 
             A1 15 27 22 A1 18 27
             1E 20
      00A536 EF B6 22 28 17 53 16  6792 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             44 21 9A 21 2A 21 60
             1D EB
      00A537 12 EC 13 17 1C 62 21  6793 	.word let,list,load,log2,lshift,muldiv,next,new ; 40..47
             65 1F 7A 10 25 17 E7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



             1A 74
      00A537 C3 00 1D 27 0D 90 93  6794 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             90 FE 90 A3 00 30 27
             03 5A
      00A547 20 EE CF 00 1F AE A4  6795 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             FC CD AA C0 81 21 FE
             22 04
      00A553 22 0A 22 10 22 16 22  6796 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             1C 1D F3 22 D4 06 4E
             16 B0
      00A553 AE A5 08 CD AA C0 81  6797 	.word restore,return, random,rshift,run,save,show,size ; 72..79
             58 4D 4F 44 45 4D 20
             72 65
      00A563 63 65 69 76 65 20 00  6798 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             CE 23 A6 17 C0 1A 28
             1F 18
      00A56A 21 01 21 10 17 90 19  6799 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             09 12 CA 1E 2A 21 BE
             1E 30
      00A56A A6 84 AE 00 00 81 1F  6800 	.word wait,words,write,bit_xor,transmit,receive,const_coma,const_comc ; 96..103 
             62 23 EB 24 91 24 EA
             24 F0
      00A570 24 FE 00 00           6801 	.word console_select,0 
                                   6802 
      002A00                       6803 	.bndry 128 ; align on FLASH block.
                                   6804 ; free space for user application  
      002A00                       6805 user_space:
                                   6806 ; USR() function test
      00A570 A6               [ 2] 6807 	pushw x 
      00A571 84 AE 00 02      [ 1] 6808 	bset PC_ODR,#5 
      00A575 81               [ 2] 6809 	popw x 
      00A576 CD 1E C6         [ 4] 6810 	call pause02 
      00A576 A6 02 C0 00      [ 1] 6811 	bres PC_ODR,#5 
      00A57A 30               [ 4] 6812 	ret
                                   6813 
                                   6814 	.area FLASH_DRIVE (ABS)
      010000                       6815 	.org 0x10000
      010000                       6816 fdrive:
                                   6817 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        00290D R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   5 ADCON      002903 R
    ADCON_ID=  000002     |   5 ADCREAD    0028F7 R   |     ADCREAD_=  000004 
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
  5 AND        0028EF R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |   5 ASC        0028E7 R   |     ASC_IDX =  000008 
    ATTRIB  =  000002     |   5 AUTORUN    0028DB R   |     AUTORUN_=  00000A 
    AUTORUN_=  004000     |   5 AWU        0028D3 R   |   5 AWUHandl   000001 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_CSR_=  000004 
    AWU_IDX =  00000C     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |     BASE    =  000002 
    BASE_SAV=  000001     |     BCNT    =  000001     |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |   5 BIT        0028CB R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000E 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   5 BRES       0028C2 R   |     BRES_IDX=  000010 
    BS      =  000008     |     BSAVE   =  000001     |   5 BSET       0028B9 R
    BSET_IDX=  000012     |     BSIZE   =  000001     |   5 BTEST      0028AF R
    BTEST_ID=  000014     |   5 BTOGL      0028A5 R   |     BTOGL_ID=  000016 
    BTW     =  000001     |   5 BYE        00289D R   |     BYE_IDX =  000018 
    C       =  000001     |     CAN     =  000018     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000000     |   5 CHAR       002894 R   |     CHAR_IDX=  00001A 
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
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
    CMDX    =  000001     |     CMD_END =  000002     |     CNT     =  000006 
    CNTR    =  000003     |   5 COMA       00288B R   |     COMA_IDX=  0000CC 
  5 COMC       002882 R   |     COMC_IDX=  0000CE     |     COMMA   =  000001 
  5 CONSOLE    002876 R   |     CONS_IDX=  0000D0     |     COUNT   =  000001 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  5 CRH        00286E R   |     CRH_IDX =  00001C     |   5 CRL        002866 R
    CRL_IDX =  00001E     |     CTRL_A  =  000001     |     CTRL_B  =  000002 
    CTRL_C  =  000003     |     CTRL_D  =  000004     |     CTRL_E  =  000005 
    CTRL_F  =  000006     |     CTRL_G  =  000007     |     CTRL_H  =  000008 
    CTRL_I  =  000009     |     CTRL_J  =  00000A     |     CTRL_K  =  00000B 
    CTRL_L  =  00000C     |     CTRL_M  =  00000D     |     CTRL_N  =  00000E 
    CTRL_O  =  00000F     |     CTRL_P  =  000010     |     CTRL_Q  =  000011 
    CTRL_R  =  000012     |     CTRL_S  =  000013     |     CTRL_T  =  000014 
    CTRL_U  =  000015     |     CTRL_V  =  000016     |     CTRL_W  =  000017 
    CTRL_X  =  000018     |     CTRL_Y  =  000019     |     CTRL_Z  =  00001A 
    CTXT_SIZ=  000004     |     CTX_BPTR=  000001     |     CTX_COUN=  000004 
    CTX_IN  =  000003     |     CURR    =  000002     |     CVAR    =  000007 
    CX_BPTR =  000001     |     CX_CNT  =  000004     |     CX_IN   =  000003 
  5 DATA       00285D R   |   5 DATALN     002852 R   |     DATALN_I=  000022 
    DATA_IDX=  000020     |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |     DBL     =  000003 
    DBLDIVDN=  000006     |     DBLHI   =  000001     |     DBLLO   =  000003 
    DBL_SIZE=  000004     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |   5 DDR        00284A R
    DDR_IDX =  000024     |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |     DEBUG_PR=  000001     |   5 DEC        002842 R
    DEC_IDX =  000026     |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        00283A R   |     DIR_IDX =  000028 
    DIVDNDHI=  00000B     |     DIVDNDLO=  00000D     |     DIVISOR =  000001 
    DIVISR  =  000007     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   5 DO         002833 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  00002A 
  5 DREAD      002829 R   |     DREAD_ID=  00002C     |   5 DWRITE     00281E R
    DWRITE_I=  00002E     |   5 EEPROM     00280B R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  000032     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        002816 R   |     END_IDX =  000030 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FAUTORUN=  000006     |     FBREAK  =  000004     |     FCOMP   =  000005 
  5 FCPU       002802 R   |     FCPU_IDX=  000034     |     FF      =  00000C 
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
  5 FOR        0027FA R   |   5 FORGET     0027EF R   |     FORGET_I=  000038 
    FOR_IDX =  000036     |     FRUN    =  000000     |     FS      =  00001C 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   5 GOSUB      0027E5 R
    GOSUB_ID=  00003A     |   5 GOTO       0027DC R   |     GOTO_IDX=  00003C 
  5 GPIO       0027D3 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_IDX=  00003E     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   5 HEX        0027CB R   |     HEX_IDX =  000040 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
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
    I2C_WRIT=  000000     |   5 IDR        0027C3 R   |     IDR_IDX =  000042 
  5 IF         0027BC R   |     IF_IDX  =  000044     |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   5 INPUT      0027B2 R
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
  5 INVERT     0027A7 R   |     INVERT_I=  000048     |     INW     =  000009 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     00279C R
    IWDGEN_I=  00004A     |   5 IWDGREF    002790 R   |     IWDGREF_=  00004C 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        002788 R   |     KEY_IDX =  00004E     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   5 LET        002780 R
    LET_IDX =  000050     |     LF      =  00000A     |     LIMIT   =  000005 
    LINENO  =  000005     |   5 LINK    =  00290D R   |   5 LIST       002777 R
    LIST_IDX=  000052     |     LL      =  000001     |     LLEN    =  000002 
    LN_PTR  =  000005     |   5 LOAD       00276E R   |     LOAD_IDX=  000054 
  5 LOG        002766 R   |     LOG_IDX =  000056     |   5 LSHIFT     00275B R
    LSHIFT_I=  000058     |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
  5 MULDIV     002750 R   |     MULDIV_I=  00005A     |     MULOP   =  000003 
    N1      =  000001     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        00273F R   |     NEW_FREE=  000001     |     NEW_IDX =  00005E 
  5 NEXT       002747 R   |     NEXT_IDX=  00005C     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NOPT1   =  004802 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   5 NOT        002737 R   |     NOT_IDX =  000060 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000000 R   |   5 ODR        00272F R   |     ODR_IDX =  000062 
    ONOFF   =  000003     |     OP      =  000003     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         002728 R   |     OR_IDX  =  000064     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |   5 PAD        002720 R   |     PAD_IDX =  000066 
    PAD_SIZE=  000080     |   5 PAUSE      002716 R   |     PAUSE_ID=  000068 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       002703 R   |     PEEK_IDX=  00006C 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   5 PINP       0026FA R
    PINP_IDX=  00006E     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      00270C R
    PMODE_ID=  00006A     |   5 POKE       0026F1 R   |     POKE_IDX=  000070 
    PORT    =  000003     |   5 POUT       0026E8 R   |     POUT_IDX=  000072 
    PREV    =  000001     |   5 PRINT      0026DE R   |   5 PRTA       0026D5 R
    PRTA_IDX=  000076     |   5 PRTB       0026CC R   |     PRTB_IDX=  000078 
  5 PRTC       0026C3 R   |     PRTC_IDX=  00007A     |   5 PRTD       0026BA R
    PRTD_IDX=  00007C     |   5 PRTE       0026B1 R   |     PRTE_IDX=  00007E 
  5 PRTF       0026A8 R   |     PRTF_IDX=  000080     |   5 PRTG       00269F R
    PRTG_IDX=  000082     |   5 PRTH       002696 R   |     PRTH_IDX=  000084 
  5 PRTI       00268D R   |     PRTI_IDX=  000086     |     PRT_IDX =  000074 
    PSTR    =  000003     |   5 QKEY       002684 R   |     QKEY_IDX=  000088 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
    RBT_IDX =  00008C     |   5 READ       00267B R   |     READ_IDX=  00008A 
  5 REBOOT     002670 R   |     REG     =  000001     |     REGA    =  000001 
    REGX    =  000003     |     REGY    =  000005     |     RELOP   =  000003 
  5 REMARK     002665 R   |     REM_IDX =  00008E     |   5 RESTORE    002659 R
    REST_IDX=  000090     |     RETL1   =  000001     |   5 RETURN     00264E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]

Symbol Table

    RET_ADDR=  000003     |     RET_IDX =  000092     |     RET_INW =  000005 
  5 RND        002646 R   |     RND_IDX =  000094     |     ROP     =  004800 
    RS      =  00001E     |   5 RSHIFT     00263B R   |     RSHIFT_I=  000096 
    RST_SR  =  0050B3     |   5 RUN        002633 R   |     RUN_IDX =  000098 
    RX_QUEUE=  000008     |   5 SAVE       00262A R   |     SAVEB   =  000002 
    SAVE_IDX=  00009A     |     SDIVSR  =  000005     |     SERIAL  =  000001 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       002621 R   |     SHOW_IDX=  00009C     |     SI      =  00000F 
    SIGN    =  000001     |   5 SIZE       002618 R   |     SIZE_IDX=  00009E 
    SKIP    =  000005     |   5 SLEEP      00260E R   |     SLEEP_ID=  0000A0 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  5 SPIEN      0025FA R   |     SPIEN_ID=  0000A4     |   5 SPIRD      002604 R
    SPIRD_ID=  0000A2     |   5 SPISEL     0025EF R   |     SPISEL_I=  0000A6 
  5 SPIWR      0025E5 R   |     SPIWR_ID=  0000A8     |     SPI_CR1 =  005200 
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
    STACK_EM=  0017FF     |     STACK_SI=  0000A0     |   5 STEP       0025DC R
    STEP_IDX=  0000AA     |   5 STOP       0025D3 R   |     STOP_IDX=  0000AC 
    STR     =  000003     |     STX     =  000002     |     SUB     =  00001A 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      0025C9 R   |     TICKS_ID=  0000AE     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
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
  5 TIMEOUT    0025B3 R   |   5 TIMER      0025BF R   |     TIMER_ID=  0000B0 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]

Symbol Table

    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_ARRAY=  000006 
    TK_CFUNC=  000082     |     TK_CHAR =  000003     |     TK_CMD  =  000080 
    TK_COLON=  000001     |     TK_COMMA=  000009     |     TK_CONST=  000083 
    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_IFUNC=  000081     |     TK_INTGR=  000084     |     TK_LE   =  000036 
    TK_LPARE=  000007     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_PLUS =  000010     |     TK_QSTR =  000002 
    TK_RPARE=  000008     |     TK_SHARP=  00000A     |     TK_VAR  =  000085 
    TMROUT_I=  0000B2     |   5 TO         0025AC R   |   5 TONE       0025A3 R
    TONE_IDX=  0000B6     |     TO_IDX  =  0000B4     |   5 Timer4Up   00005E R
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
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     002598 R
    UBOUND_I=  0000B8     |   5 UBTN_Han   0000A1 R   |   5 UFLASH     00258D R
    UFLASH_I=  0000BA     |   5 UNTIL      002583 R   |     UNTIL_ID=  0000BC 
    US      =  00001F     |   5 USER_ABO   0000A9 R   |   5 USR        00257B R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000BE     |   5 UartRxHa   00000F R   |   5 UserButt   000074 R
    VAR_ADDR=  000006     |     VAR_SIZE=  000001     |     VSIZ    =  000002 
    VSIZE   =  000006     |     VT      =  00000B     |   5 WAIT       002572 R
    WAIT_IDX=  0000C0     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]

Symbol Table

    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      002568 R   |     WORDS_ID=  0000C2     |   5 WRITE      00255E R
    WRITE_ID=  0000C4     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   5 XOR        002556 R   |     XOR_IDX =  0000C6 
  5 XRCV       00254D R   |     XRCV_IDX=  0000CA     |     XREG    =  000003 
    XSAVE   =  000005     |   5 XTRMT      002543 R   |     XTRMT_ID=  0000C8 
    YSAVE   =  000007     |   5 abs        001F1E R   |   1 acc16      00000C GR
  1 acc24      00000B GR  |   1 acc8       00000D GR  |   5 add_char   00157E R
  5 add_spac   0013A8 R   |   5 analog_r   001989 R   |   5 arduino_   002014 R
  5 arg_list   0010D2 R   |   1 array_si   000021 R   |   5 ascii      001DC4 R
  5 at_tst     000D36 R   |   5 atoi24     000E47 GR  |   5 atoi_exi   000EAD R
  5 autorun    001E56 R   |   5 autorun_   00074F R   |   5 awu        001ECF R
  5 awu02      001ED9 R   |   5 bad_port   001E25 R   |   1 base       00000A R
  1 basicptr   000004 GR  |   5 beep       001916 R   |   5 beep_1kh   001900 GR
  5 bin_exit   000C14 R   |   5 bit_and    001F32 R   |   5 bit_or     001F4A R
  5 bit_rese   0016EB R   |   5 bit_set    0016DB R   |   5 bit_test   00170C R
  5 bit_togg   0016FC R   |   5 bit_xor    001F62 R   |   5 bitmask    002180 R
  5 bkslsh_t   000CE3 R   |   5 block_er   0001CA R   |   5 break_po   001A56 R
  5 bye        001E4D R   |   5 cancel_a   000717 R   |   5 char       001DB2 R
  5 clear_ba   000764 R   |   5 clear_va   0005D7 R   |   5 clock_in   0000C4 R
  5 cmd_end    0018F9 R   |   5 cmd_line   000984 R   |   5 cmd_name   001041 R
  5 cmp_name   001AF7 R   |   5 code_add   002913 R   |   5 cold_sta   00064E R
  5 colon_ts   000D0A R   |   1 comm       00002F R   |   5 comma_ts   000D15 R
  5 comp_msg   0008D9 R   |   5 compile    000564 R   |   5 con_sel    00250A GR
  5 console_   0024FE R   |   5 console_   0024F6 R   |   5 const_co   0024EA R
  5 const_co   0024F0 R   |   5 const_cr   002234 R   |   5 const_cr   00223A R
  5 const_dd   00222E R   |   5 const_ee   00224C R   |   5 const_id   002228 R
  5 const_in   002246 R   |   5 const_od   002222 R   |   5 const_ou   002240 R
  5 const_po   0021EC R   |   5 const_po   0021F2 R   |   5 const_po   0021F8 R
  5 const_po   0021FE R   |   5 const_po   002204 R   |   5 const_po   00220A R
  5 const_po   002210 R   |   5 const_po   002216 R   |   5 const_po   00221C R
  5 convert_   000B8B R   |   5 copy_com   000D6B R   |   1 count      000003 GR
  5 cp_loop    001081 R   |   5 cpy_cmd_   001393 R   |   5 cpy_quot   0013CC R
  5 create_g   0004C7 R   |   5 cs_high    0023E0 R   |   5 cstk_pro   00128F R
  5 dash_tst   000D2B R   |   5 data       002252 R   |   1 data_len   000009 R
  5 data_lin   002258 R   |   1 data_ofs   000008 R   |   1 data_ptr   000006 R
  5 data_sea   002298 R   |   5 dbl_sign   000FA9 R   |   5 dec_base   0012BB R
  5 decomp_l   00147D R   |   5 decompil   001436 GR  |   5 del_line   00049A R
  5 digital_   0019BD R   |   5 digital_   0019ED R   |   5 dir_loop   001D05 R
  5 director   001CF9 R   |   5 disk_fre   001AE4 R   |   5 div32_16   000FB3 R
  5 divide     00100A R   |   5 divu24_8   000ACE R   |   5 dneg       000F9E R
  5 do_loop    0021A9 R   |   5 do_progr   0001BD R   |   5 drain      00034A GR
  5 drive_fr   001D6E R   |   5 enable_i   00212A R   |   5 eql_tst    000DC0 R
  5 equal      001591 R   |   5 erase_fl   0001E9 R   |   5 err_bad_   000844 R
  5 err_buf_   0008BA R   |   5 err_cmd_   000808 R   |   5 err_div0   0007CD R
  5 err_dupl   000822 R   |   5 err_math   0007B4 R   |   5 err_mem_   000799 R
  5 err_msg    000779 R   |   5 err_no_a   000850 R   |   5 err_no_d   000883 R
  5 err_no_f   0008A7 R   |   5 err_no_l   0007DC R   |   5 err_no_p   000893 R
  5 err_not_   000833 R   |   5 err_run_   0007F2 R   |   5 err_synt   0007A6 R
  5 escaped    000BA0 R   |   5 expect     0010C0 R   |   5 expr_exi   00121A R
  5 expressi   0011D1 R   |   5 factor     001122 R   |   1 farptr     000016 R
  5 fcpu       001FAC R   |   7 fdrive     010000 R   |   1 ffree      000019 R
  5 file_cou   001D66 R   |   5 first_li   001340 R   |   1 flags      000023 R
  5 for        001767 R   |   5 forget     001C92 R   |   1 free_ram   000064 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]

Symbol Table

  5 func_arg   0010CD R   |   5 func_not   00211D R   |   5 ge         001593 R
  5 get_arra   0010FD R   |   5 get_cmd_   001415 R   |   5 get_targ   001831 R
  5 get_tick   001F18 R   |   5 get_toke   000C7C R   |   5 getc       00032B GR
    getc_to    ****** GX  |   5 gosub      001862 R   |   5 goto       001847 R
  5 gpio       001E00 R   |   5 gt         00158F R   |   5 gt_tst     000DCB R
  5 hex_base   0012B6 R   |   5 hex_dump   0003CD R   |   5 if         001753 R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
  5 incr_far   001AA4 R   |   5 input_ex   0016AD R   |   5 input_lo   001646 R
  5 input_va   001644 R   |   5 insert_l   0004F3 R   |   5 insert_l   000561 R
  5 interp_l   0009C5 R   |   5 interpre   0009A0 R   |   5 invert     00219A R
  5 is_alnum   0005FF R   |   5 is_alpha   0005E5 R   |   5 is_digit   0005F6 R
  5 itoa       000A69 R   |   5 itoa_loo   000A88 R   |   5 jp_to_ta   001855 R
  5 key        001DEB R   |   5 kw_loop    000C30 R   |   5 kword_di   00290B R
  5 kword_en   002541 R   |   5 le         001598 R   |   5 leading_   002170 R
  5 let        0012EC R   |   5 let_arra   0012FA R   |   5 let_var    0012FD R
  5 lines_sk   001343 R   |   5 list       001317 R   |   5 list_exi   001385 R
  5 list_loo   001363 R   |   5 load       001C62 R   |   5 load_aut   000726 R
  5 load_fil   001C31 R   |   5 log2       002165 R   |   5 logical_   002113 R
  5 long_div   000F86 R   |   5 loop_bac   001814 R   |   1 loop_dep   000020 R
  5 loop_don   001829 R   |   5 lshift     001F7A R   |   5 lt         001596 R
  5 lt_tst     000DF4 R   |   5 modulo     001020 R   |   5 move       000434 GR
  5 move_dow   000452 R   |   5 move_era   00014F R   |   5 move_exi   000473 R
  5 move_loo   000457 R   |   5 move_prg   000183 R   |   5 move_up    000444 R
  5 mul_char   001580 R   |   5 muldiv     001025 R   |   5 multiply   000F51 R
  5 mulu24_8   000AF6 R   |   5 nbr_tst    000CAF R   |   5 ne         00159B R
  5 neg_acc2   000B30 R   |   5 new        001A74 R   |   5 next       0017E7 R
  5 next_lin   0009A8 R   |   5 next_tok   0009EC R   |   5 no_match   001093 R
  5 other      000E1D R   |   3 pad        0016E0 R   |   5 pad_ref    0023E5 R
  5 parse_bi   000BF2 R   |   5 parse_in   000BA8 R   |   5 parse_ke   000C2F R
  5 parse_qu   000B53 R   |   5 pause      001EBC R   |   5 pause02    001EC6 R
  5 peek       001742 R   |   5 pin_mode   001FB8 R   |   5 plus_tst   000D94 R
  5 poke       001733 R   |   5 power_ad   00194D R   |   5 prcnt_ts   000DB5 R
  5 print      0015BE R   |   5 print_ex   001618 R   |   5 print_in   000A4D R
  5 printxy    000EC4 R   |   5 program_   000163 R   |   5 program_   000183 R
  5 prt_basi   00159E R   |   5 prt_loop   0015C2 R   |   5 prt_tok    00035F R
  5 prti24     000A5D R   |   1 ptr16      000017 R   |   1 ptr8       000018 R
  5 putc       00030A GR  |   5 putc1      000310 R   |   5 putc3      00031A R
    puts       ****** GX  |   5 qgetc      000324 GR  |   5 qkey       001DF3 GR
  5 qmark_ts   000D41 R   |   5 random     002034 R   |   5 read       0022D4 R
  5 read01     0022D6 R   |     readln     ****** GX  |   5 receive    002491 R
  5 refresh_   002160 R   |   5 rel_exit   001272 R   |   5 relation   00121D R
  5 relop_st   001583 R   |   5 remark     0016B0 R   |   5 reset_co   0015C0 R
  5 rest_con   001634 R   |   5 restore    002285 R   |   5 return     001882 R
  5 right_al   0013BA R   |   5 row_alig   001A89 R   |   5 row_eras   000128 R
  5 row_eras   00014F R   |   5 row_loop   0003B0 R   |   5 rparnt_t   000CFF R
  5 rshift     001F93 R   |   5 rt_msg     0008C7 R   |   5 run        0018A0 R
  5 run_it     0018D2 R   |   5 rx_faile   0024D3 R   |   1 rx_head    00002D R
  5 rx_loop    0024A6 R   |   1 rx_queue   000025 R   |   5 rx_succe   0024B7 R
  1 rx_tail    00002E R   |   5 save       001B65 R   |   5 save_con   001624 R
  5 search_d   001073 R   |   5 search_e   0010BD R   |   5 search_f   001B18 R
  5 search_l   000476 GR  |   5 search_l   00047E R   |   5 search_n   001077 R
  1 seedx      000012 R   |   1 seedy      000014 R   |   5 seek_fdr   001AB2 R
  5 select_p   002004 R   |   5 set_time   002101 R   |   5 sharp_ts   000D20 R
  5 show       001275 R   |   5 show_row   00039E R   |   5 single_c   001579 R
  5 size       0012C0 R   |   5 skip       000EB1 R   |   5 slash_ts   000DAA R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]

Symbol Table

  5 sleep      001EB1 R   |   5 software   000608 R   |     spaces     ****** GX
  5 spi_clea   002379 R   |   5 spi_disa   002361 R   |   5 spi_enab   00232E R
  5 spi_rcv_   00239B R   |   5 spi_read   0023C6 R   |   5 spi_sele   0023CE R
  5 spi_send   002385 R   |   5 spi_writ   0023A6 R   |   3 stack_fu   001760 R
  3 stack_un   001800 R   |   5 star_tst   000D9F R   |   5 step       0017C0 R
  5 stop       001A28 R   |   5 store_lo   0017D4 R   |   5 str_matc   0010A0 R
  5 str_tst    000C9F R   |   5 strcmp     000415 R   |   5 strcpy     000426 R
  5 strlen     00040A GR  |   5 syntax_e   0008FA R   |   1 tab_widt   000024 R
  5 tb_error   0008FC R   |   5 term       00117F R   |   5 term01     001187 R
  5 term_exi   0011CE R   |   3 tib        001690 GR  |   5 tick_tst   000D59 R
  1 ticks      00000E R   |   5 timeout    002110 R   |   1 timer      000010 GR
  5 timer2_i   0000DA R   |   5 timer4_i   0000E7 R   |   5 tk_id      0008EA R
  5 to         001790 R   |   5 to_eepro   0001A6 R   |   5 to_flash   0001BA R
  5 to_upper   000E3B GR  |   5 token_ch   000E34 R   |   5 token_ex   000E38 R
  5 token_ms   000396 R   |   5 tone       001909 R   |   5 transmit   0023EB R
  5 try_next   0022C4 R   |   5 tx_exit    002468 R   |   5 tx_faile   002453 R
  5 tx_loop    00242B R   |   5 tx_succe   00243C R   |   1 txtbgn     00001C R
  1 txtend     00001E R   |   5 uart1_in   0002C7 R   |   5 uart1_se   0002D7 R
  5 uart3_in   00028C R   |   5 uart3_se   00029C R   |   5 ubound     0012CA R
  5 udiv32_1   000F74 R   |   5 uflash     001E2A R   |   5 umstar     000F17 R
  5 unlock_e   0000FC R   |   5 unlock_f   000112 R   |   5 until      0021BE R
  5 user_int   000087 R   |   5 user_spa   002A00 R   |   5 usr        001E30 R
  5 var_name   00140D R   |   1 vars       000030 R   |   5 wait       0016B6 R
  5 warm_ini   0006F9 R   |   5 warm_sta   000981 R   |   5 words      00209B R
  5 words_co   0020EB R   |   5 write      001D7B R   |   5 write_bl   000269 R
  5 write_by   0001F4 R   |   5 write_ee   000230 R   |   5 write_ex   000264 R
  5 write_fl   00021A R   |   5 write_ro   000197 R   |   5 x_fail     002488 R
  5 x_succes   00247C R   |     xrcv_blo   ****** GX  |   5 xrcv_msg   0024DA R
    xtrmt_bl   ****** GX  |   5 xtrmt_ms   00246B R   |   5 zero_pad   001A7E R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     64   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   2A0E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

