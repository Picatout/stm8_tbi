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
      008000 82 00 86 B9            111     int cold_start			; RESET vector 
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
      0080B9 CC 86 B9         [ 2]  197 	jp cold_start 	
      0080BC                        198 3$: 
      0080BC A1 1A            [ 1]  199 	cp a,#CTRL_Z
      0080BE 26 06            [ 1]  200 	jrne 4$
      0080C0 CD 87 82         [ 4]  201 	call cancel_autorun 
      0080C3 CC 86 B9         [ 2]  202 	jp cold_start 
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
      008115 CD AA 40         [ 4]  270 	call puts 
      008118 CE 00 05         [ 2]  271 	ldw x,basicptr 
      00811B C6 00 02         [ 1]  272 	ld a,in 
      00811E CD 96 09         [ 4]  273 	call prt_basic_line
      008121                        274 UBTN_Handler_exit:
      008121 AE 17 FF         [ 2]  275     ldw x,#STACK_EMPTY 
      008124 94               [ 1]  276     ldw sp,x
      008125 9A               [ 1]  277 	rim 
      008126 CC 89 EC         [ 2]  278 	jp warm_start
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
      0081DF CD 84 9F         [ 4]  397 	call move 
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
      008213 CD 84 9F         [ 4]  441 	call move 
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
      00824D A3 AA 00         [ 2]  488 	cpw x,#user_space 
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
      008286 90 A3 AA 00      [ 2]  532     cpw y,#user_space
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
      008306 CD 9B 0F         [ 4]  613 	call incr_farptr
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
                                    713 ;---------------------------------
      0083A4                        714 qgetc::
      0083A4 C6 00 2E         [ 1]  715 	ld a,rx_head 
      0083A7 C1 00 2F         [ 1]  716 	cp a,rx_tail 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      0083AA 81               [ 4]  717 	ret 
                                    718 
                                    719 ;---------------------------------
                                    720 ; wait character from UART1 
                                    721 ; input:
                                    722 ;   none
                                    723 ; output:
                                    724 ;   A 			char  
                                    725 ;--------------------------------	
      0083AB                        726 getc::
      0083AB CD 83 A4         [ 4]  727 	call qgetc
      0083AE 27 FB            [ 1]  728 	jreq getc 
      0083B0 89               [ 2]  729 	pushw x 
      0083B1 AE 00 26         [ 2]  730 	ldw x,#rx_queue
      0083B4 9F               [ 1]  731 	ld a,xl 
      0083B5 CB 00 2E         [ 1]  732 	add a,rx_head 
      0083B8 97               [ 1]  733 	ld xl,a 
      0083B9 F6               [ 1]  734 	ld a,(x)
      0083BA 85               [ 2]  735 	popw x
      0083BB 88               [ 1]  736 	push a
      0083BC 72 5C 00 2E      [ 1]  737 	inc rx_head 
      0083C0 A6 07            [ 1]  738 	ld a,#RX_QUEUE_SIZE-1 
      0083C2 C4 00 2E         [ 1]  739 	and a,rx_head 
      0083C5 C7 00 2E         [ 1]  740 	ld rx_head,a 
      0083C8 84               [ 1]  741 	pop a  
      0083C9 81               [ 4]  742 	ret 
                                    743 
                                    744 ;----------------------
                                    745 ; print token id && value
                                    746 ; input:
                                    747 ;   A     token id 
                                    748 ;   X     token value 
                                    749 ;---------------------
                           000001   750 	BSAVE=1
                           000002   751 	AREG=2
                           000003   752 	XREG=3
                           000004   753 	VSIZE=4
      0083CA                        754 prt_tok:
      00034A                        755 	_vars VSIZE 
      0083CA 52 04            [ 2]    1     sub sp,#VSIZE 
      0083CC 6B 02            [ 1]  756 	ld (AREG,sp),a 
      0083CE 1F 03            [ 2]  757 	ldw (XREG,sp),x 
      0083D0 C6 00 0B         [ 1]  758 	ld a, base
      0083D3 6B 01            [ 1]  759 	ld (BSAVE,sp),a 
      0083D5 35 10 00 0B      [ 1]  760 	mov base,#16  
      0083D9 AE 84 01         [ 2]  761 	ldw x,#token_msg
      0083DC CD AA 40         [ 4]  762 	call puts 
      0083DF 5F               [ 1]  763 	clrw x 
      0083E0 7B 02            [ 1]  764 	ld a,(AREG,sp)
      0083E2 97               [ 1]  765 	ld xl,a 
      0083E3 CD 8A B8         [ 4]  766 	call print_int 
      0083E6 A6 20            [ 1]  767 	ld a,#SPACE
      0083E8 CD 83 8A         [ 4]  768 	call putc 
      0083EB 1E 03            [ 2]  769 	ldw x,(XREG,sp)
      0083ED CD 8A B8         [ 4]  770 	call print_int 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083F0 A6 0D            [ 1]  771 	ld a,#CR 
      0083F2 CD 83 8A         [ 4]  772 	call putc 
      0083F5 7B 01            [ 1]  773 	ld a,(BSAVE,sp)
      0083F7 C7 00 0B         [ 1]  774 	ld base,a 
      0083FA 7B 02            [ 1]  775 	ld a,(AREG,sp)
      0083FC 1E 03            [ 2]  776 	ldw x,(XREG,sp)
      00037E                        777 	_drop VSIZE 
      0083FE 5B 04            [ 2]    1     addw sp,#VSIZE 
      008400 81               [ 4]  778 	ret 
      008401 74 6F 6B 65 6E 3A 20   779 token_msg: .asciz "token: "
             00
                                    780 
                                    781 
                                    782 ;---------------------
                                    783 ; display n bytes row 
                                    784 ; from memory.
                                    785 ; input:
                                    786 ;   A   bytes to print 
                                    787 ;	X   start address 
                                    788 ; output:
                                    789 ;   X   address after last shown  
                                    790 ;---------------------
                           000001   791 	CNT=1 
                           000002   792 	ADR=2 
                           000003   793 	VSIZE=3 
      008409                        794 show_row:
      008409 4D               [ 1]  795 	tnz a 
      00840A 26 01            [ 1]  796 	jrne 1$
      00840C 81               [ 4]  797 	ret 
      00840D                        798 1$:	
      00840D 89               [ 2]  799 	pushw x  
      00840E 88               [ 1]  800 	push a 
      00840F 35 04 00 25      [ 1]  801 	mov tab_width,#4 
      008413 CD 8A B8         [ 4]  802 	call print_int 
      008416 A6 20            [ 1]  803 	ld a,#SPACE  
      008418 CD 83 8A         [ 4]  804 	call putc
      00841B                        805 row_loop:
      00841B 1E 02            [ 2]  806 	ldw x,(ADR,sp)
      00841D F6               [ 1]  807 	ld a,(x)
      00841E 5F               [ 1]  808 	clrw x 
      00841F 97               [ 1]  809 	ld xl,a 
      008420 CD 8A B8         [ 4]  810 	call print_int 
      008423 1E 02            [ 2]  811 	ldw x,(ADR,sp)
      008425 5C               [ 1]  812 	incw x 
      008426 1F 02            [ 2]  813 	ldw (ADR,sp),x 
      008428 0A 01            [ 1]  814 	dec (CNT,sp)
      00842A 26 EF            [ 1]  815 	jrne row_loop
      0003AC                        816 	_drop VSIZE  		
      00842C 5B 03            [ 2]    1     addw sp,#VSIZE 
      00842E 35 04 00 25      [ 1]  817 	mov tab_width,#4
      008432 A6 0D            [ 1]  818 	ld a,#CR 
      008434 CD 83 8A         [ 4]  819 	call putc 
      008437 81               [ 4]  820 	ret 
                                    821 
                                    822 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    823 ; print memory content 
                                    824 ; in hexadecimal format
                                    825 ;  input:
                                    826 ;    X    start address 
                                    827 ;    Y    count 
                                    828 ;--------------------------
                           000001   829 	BCNT=1
                           000003   830 	BASE=3
                           000004   831 	TABW=4
                           000004   832 	VSIZE=4   
      008438                        833 hex_dump:
      0003B8                        834 	_vars VSIZE
      008438 52 04            [ 2]    1     sub sp,#VSIZE 
      00843A C6 00 0B         [ 1]  835 	ld a,base
      00843D 6B 03            [ 1]  836 	ld (BASE,sp),a 
      00843F 35 10 00 0B      [ 1]  837 	mov base,#16
      008443 C6 00 25         [ 1]  838 	ld a,tab_width 
      008446 6B 04            [ 1]  839 	ld (TABW,sp),a
      008448 A6 0D            [ 1]  840 	ld a,#CR 
      00844A CD 83 8A         [ 4]  841 	call putc 
      00844D 17 01            [ 2]  842 1$: ldw (BCNT,sp),y
      00844F A6 10            [ 1]  843 	ld a,#16
      008451 90 A3 00 10      [ 2]  844 	cpw y,#16
      008455 2A 02            [ 1]  845 	jrpl 2$
      008457 90 9F            [ 1]  846 	ld a,yl
      008459                        847 2$: 	
      008459 CD 84 09         [ 4]  848 	call show_row 
      00845C 16 01            [ 2]  849 	ldw y,(BCNT,sp) 
      00845E 72 A2 00 10      [ 2]  850 	subw y,#16 
      008462 90 A3 00 01      [ 2]  851 	cpw y,#1
      008466 2A E5            [ 1]  852 	jrpl 1$
      008468 7B 03            [ 1]  853 	ld a,(BASE,sp)
      00846A C7 00 0B         [ 1]  854 	ld base,a
      00846D 7B 04            [ 1]  855 	ld a,(TABW,sp)
      00846F C7 00 25         [ 1]  856 	ld tab_width,a 
      0003F2                        857 	_drop VSIZE
      008472 5B 04            [ 2]    1     addw sp,#VSIZE 
      008474 81               [ 4]  858 	ret 
                                    859 
                                    860 ;-------------------------------------
                                    861 ; retrun string length
                                    862 ; input:
                                    863 ;   X         .asciz  pointer 
                                    864 ; output:
                                    865 ;   X         not affected 
                                    866 ;   A         length 
                                    867 ;-------------------------------------
      008475                        868 strlen::
      008475 89               [ 2]  869 	pushw x 
      008476 4F               [ 1]  870 	clr a
      008477 7D               [ 1]  871 1$:	tnz (x) 
      008478 27 04            [ 1]  872 	jreq 9$ 
      00847A 4C               [ 1]  873 	inc a 
      00847B 5C               [ 1]  874 	incw x 
      00847C 20 F9            [ 2]  875 	jra 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      00847E 85               [ 2]  876 9$:	popw x 
      00847F 81               [ 4]  877 	ret 
                                    878 
                                    879 ;------------------------------------
                                    880 ; compare 2 strings
                                    881 ; input:
                                    882 ;   X 		char* first string 
                                    883 ;   Y       char* second string 
                                    884 ; output:
                                    885 ;   A 		0|1 
                                    886 ;-------------------------------------
      008480                        887 strcmp:
      008480 F6               [ 1]  888 	ld a,(x)
      008481 27 0B            [ 1]  889 	jreq 5$ 
      008483 90 F1            [ 1]  890 	cp a,(y) 
      008485 26 05            [ 1]  891 	jrne 4$ 
      008487 5C               [ 1]  892 	incw x 
      008488 90 5C            [ 1]  893 	incw y 
      00848A 20 F4            [ 2]  894 	jra strcmp 
      00848C                        895 4$: ; not same  
      00848C 4F               [ 1]  896 	clr a 
      00848D 81               [ 4]  897 	ret 
      00848E                        898 5$: ; same 
      00848E A6 01            [ 1]  899 	ld a,#1 
      008490 81               [ 4]  900 	ret 
                                    901 
                                    902 
                                    903 ;---------------------------------------
                                    904 ;  copy src to dest 
                                    905 ; input:
                                    906 ;   X 		dest 
                                    907 ;   Y 		src 
                                    908 ; output: 
                                    909 ;   X 		dest 
                                    910 ;----------------------------------
      008491                        911 strcpy:
      008491 89               [ 2]  912 	pushw x 
      008492 90 F6            [ 1]  913 1$: ld a,(y)
      008494 27 06            [ 1]  914 	jreq 9$ 
      008496 F7               [ 1]  915 	ld (x),a 
      008497 5C               [ 1]  916 	incw x 
      008498 90 5C            [ 1]  917 	incw y 
      00849A 20 F6            [ 2]  918 	jra 1$ 
      00849C 7F               [ 1]  919 9$:	clr (x)
      00849D 85               [ 2]  920 	popw x 
      00849E 81               [ 4]  921 	ret 
                                    922 
                                    923 ;---------------------------------------
                                    924 ; move memory block 
                                    925 ; input:
                                    926 ;   X 		destination 
                                    927 ;   Y 	    source 
                                    928 ;   acc16	bytes count 
                                    929 ; output:
                                    930 ;   none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    931 ;--------------------------------------
                           000001   932 	INCR=1 ; increament high byte 
                           000002   933 	LB=2 ; increament low byte 
                           000002   934 	VSIZE=2
      00849F                        935 move::
      00041F                        936 	_vars VSIZE 
      00849F 52 02            [ 2]    1     sub sp,#VSIZE 
      0084A1 0F 01            [ 1]  937 	clr (INCR,sp)
      0084A3 0F 02            [ 1]  938 	clr (LB,sp)
      0084A5 90 89            [ 2]  939 	pushw y 
      0084A7 13 01            [ 2]  940 	cpw x,(1,sp) ; compare DEST to SRC 
      0084A9 90 85            [ 2]  941 	popw y 
      0084AB 27 31            [ 1]  942 	jreq move_exit ; x==y 
      0084AD 2B 0E            [ 1]  943 	jrmi move_down
      0084AF                        944 move_up: ; start from top address with incr=-1
      0084AF 72 BB 00 0D      [ 2]  945 	addw x,acc16
      0084B3 72 B9 00 0D      [ 2]  946 	addw y,acc16
      0084B7 03 01            [ 1]  947 	cpl (INCR,sp)
      0084B9 03 02            [ 1]  948 	cpl (LB,sp)   ; increment = -1 
      0084BB 20 05            [ 2]  949 	jra move_loop  
      0084BD                        950 move_down: ; start from bottom address with incr=1 
      0084BD 5A               [ 2]  951     decw x 
      0084BE 90 5A            [ 2]  952 	decw y
      0084C0 0C 02            [ 1]  953 	inc (LB,sp) ; incr=1 
      0084C2                        954 move_loop:	
      0084C2 C6 00 0D         [ 1]  955     ld a, acc16 
      0084C5 CA 00 0E         [ 1]  956 	or a, acc8
      0084C8 27 14            [ 1]  957 	jreq move_exit 
      0084CA 72 FB 01         [ 2]  958 	addw x,(INCR,sp)
      0084CD 72 F9 01         [ 2]  959 	addw y,(INCR,sp) 
      0084D0 90 F6            [ 1]  960 	ld a,(y)
      0084D2 F7               [ 1]  961 	ld (x),a 
      0084D3 89               [ 2]  962 	pushw x 
      0084D4 CE 00 0D         [ 2]  963 	ldw x,acc16 
      0084D7 5A               [ 2]  964 	decw x 
      0084D8 CF 00 0D         [ 2]  965 	ldw acc16,x 
      0084DB 85               [ 2]  966 	popw x 
      0084DC 20 E4            [ 2]  967 	jra move_loop
      0084DE                        968 move_exit:
      00045E                        969 	_drop VSIZE
      0084DE 5B 02            [ 2]    1     addw sp,#VSIZE 
      0084E0 81               [ 4]  970 	ret 	
                                    971 
                                    972 ;-------------------------------------
                                    973 ; search text area for a line#
                                    974 ; input:
                                    975 ;	X 			line# 
                                    976 ; output:
                                    977 ;   X 			addr of line | 0 
                                    978 ;   Y           line#|insert address if not found  
                                    979 ;-------------------------------------
                           000001   980 	LL=1 ; line length 
                           000002   981 	LB=2 ; line length low byte 
                           000002   982 	VSIZE=2 
      0084E1                        983 search_lineno::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      000461                        984 	_vars VSIZE
      0084E1 52 02            [ 2]    1     sub sp,#VSIZE 
      0084E3 0F 01            [ 1]  985 	clr (LL,sp)
      0084E5 90 CE 00 1D      [ 2]  986 	ldw y,txtbgn
      0084E9                        987 search_ln_loop:
      0084E9 90 C3 00 1F      [ 2]  988 	cpw y,txtend 
      0084ED 2A 10            [ 1]  989 	jrpl 8$
      0084EF 90 F3            [ 1]  990 	cpw x,(y)
      0084F1 27 0E            [ 1]  991 	jreq 9$
      0084F3 2B 0A            [ 1]  992 	jrmi 8$ 
      0084F5 90 E6 02         [ 1]  993 	ld a,(2,y)
      0084F8 6B 02            [ 1]  994 	ld (LB,sp),a 
      0084FA 72 F9 01         [ 2]  995 	addw y,(LL,sp)
      0084FD 20 EA            [ 2]  996 	jra search_ln_loop 
      0084FF                        997 8$: 
      0084FF 5F               [ 1]  998 	clrw x 	
      008500 51               [ 1]  999 	exgw x,y 
      000481                       1000 9$: _drop VSIZE
      008501 5B 02            [ 2]    1     addw sp,#VSIZE 
      008503 51               [ 1] 1001 	exgw x,y   
      008504 81               [ 4] 1002 	ret 
                                   1003 
                                   1004 ;-------------------------------------
                                   1005 ; delete line at addr
                                   1006 ; input:
                                   1007 ;   X 		addr of line i.e DEST for move 
                                   1008 ;-------------------------------------
                           000001  1009 	LLEN=1
                           000003  1010 	SRC=3
                           000004  1011 	VSIZE=4
      008505                       1012 del_line: 
      000485                       1013 	_vars VSIZE 
      008505 52 04            [ 2]    1     sub sp,#VSIZE 
      008507 E6 02            [ 1] 1014 	ld a,(2,x) ; line length
      008509 6B 02            [ 1] 1015 	ld (LLEN+1,sp),a 
      00850B 0F 01            [ 1] 1016 	clr (LLEN,sp)
      00850D 90 93            [ 1] 1017 	ldw y,x  
      00850F 72 F9 01         [ 2] 1018 	addw y,(LLEN,sp) ;SRC  
      008512 17 03            [ 2] 1019 	ldw (SRC,sp),y  ;save source 
      008514 90 CE 00 1F      [ 2] 1020 	ldw y,txtend 
      008518 72 F2 03         [ 2] 1021 	subw y,(SRC,sp) ; y=count 
      00851B 90 CF 00 0D      [ 2] 1022 	ldw acc16,y 
      00851F 16 03            [ 2] 1023 	ldw y,(SRC,sp)    ; source
      008521 CD 84 9F         [ 4] 1024 	call move
      008524 90 CE 00 1F      [ 2] 1025 	ldw y,txtend 
      008528 72 F2 01         [ 2] 1026 	subw y,(LLEN,sp)
      00852B 90 CF 00 1F      [ 2] 1027 	ldw txtend,y  
      0004AF                       1028 	_drop VSIZE     
      00852F 5B 04            [ 2]    1     addw sp,#VSIZE 
      008531 81               [ 4] 1029 	ret 
                                   1030 
                                   1031 ;---------------------------------------------
                                   1032 ; create a gap in text area to 
                                   1033 ; move new line in this gap
                                   1034 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1035 ;    X 			addr gap start 
                                   1036 ;    Y 			gap length 
                                   1037 ; output:
                                   1038 ;    X 			addr gap start 
                                   1039 ;--------------------------------------------
                           000001  1040 	DEST=1
                           000003  1041 	SRC=3
                           000005  1042 	LEN=5
                           000006  1043 	VSIZE=6 
      008532                       1044 create_gap:
      0004B2                       1045 	_vars VSIZE
      008532 52 06            [ 2]    1     sub sp,#VSIZE 
      008534 1F 03            [ 2] 1046 	ldw (SRC,sp),x 
      008536 17 05            [ 2] 1047 	ldw (LEN,sp),y 
      008538 90 CF 00 0D      [ 2] 1048 	ldw acc16,y 
      00853C 90 93            [ 1] 1049 	ldw y,x ; SRC
      00853E 72 BB 00 0D      [ 2] 1050 	addw x,acc16  
      008542 1F 01            [ 2] 1051 	ldw (DEST,sp),x 
                                   1052 ;compute size to move 	
      008544 CE 00 1F         [ 2] 1053 	ldw x,txtend 
      008547 72 F0 03         [ 2] 1054 	subw x,(SRC,sp)
      00854A CF 00 0D         [ 2] 1055 	ldw acc16,x ; size to move
      00854D 1E 01            [ 2] 1056 	ldw x,(DEST,sp) 
      00854F CD 84 9F         [ 4] 1057 	call move
      008552 CE 00 1F         [ 2] 1058 	ldw x,txtend
      008555 72 FB 05         [ 2] 1059 	addw x,(LEN,sp)
      008558 CF 00 1F         [ 2] 1060 	ldw txtend,x
      0004DB                       1061 9$:	_drop VSIZE 
      00855B 5B 06            [ 2]    1     addw sp,#VSIZE 
      00855D 81               [ 4] 1062 	ret 
                                   1063 
                                   1064 ;--------------------------------------------
                                   1065 ; insert line in pad into text area 
                                   1066 ; first search for already existing 
                                   1067 ; replace existing 
                                   1068 ; if new line empty delete existing one. 
                                   1069 ; input:
                                   1070 ;   ptr16		pointer to tokenized line  
                                   1071 ; output:
                                   1072 ;   none
                                   1073 ;---------------------------------------------
                           000001  1074 	DEST=1  ; text area insertion address 
                           000003  1075 	SRC=3   ; str to insert address 
                           000005  1076 	LINENO=5 ; line number 
                           000007  1077 	LLEN=7 ; line length 
                           000008  1078 	VSIZE=8  
      00855E                       1079 insert_line:
      0004DE                       1080 	_vars VSIZE 
      00855E 52 08            [ 2]    1     sub sp,#VSIZE 
      008560 CE 00 1F         [ 2] 1081 	ldw x,txtend  
      008563 C3 00 1D         [ 2] 1082 	cpw x,txtbgn 
      008566 26 19            [ 1] 1083 	jrne 0$
                                   1084 ;first text line 
      008568 AE 00 02         [ 2] 1085 	ldw x,#2 
      00856B 72 D6 00 18      [ 4] 1086 	ld a,([ptr16],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00856F A1 03            [ 1] 1087 	cp a,#3
      008571 27 59            [ 1] 1088 	jreq insert_ln_exit
      008573 5F               [ 1] 1089 	clrw x 
      008574 97               [ 1] 1090 	ld xl,a
      008575 1F 07            [ 2] 1091 	ldw (LLEN,sp),x 
      008577 CE 00 1D         [ 2] 1092 	ldw x,txtbgn
      00857A 1F 01            [ 2] 1093 	ldw (DEST,sp),x 
      00857C CE 00 1F         [ 2] 1094 	ldw x,txtend 
      00857F 20 37            [ 2] 1095 	jra 4$
      008581 72 CE 00 18      [ 5] 1096 0$:	ldw x,[ptr16]
                                   1097 ; line number
      008585 1F 05            [ 2] 1098 	ldw (LINENO,sp),x 
      008587 AE 00 02         [ 2] 1099 	ldw x,#2 
      00858A 72 D6 00 18      [ 4] 1100 	ld a,([ptr16],x)
      00858E 97               [ 1] 1101 	ld xl,a
                                   1102 ; line length
      00858F 1F 07            [ 2] 1103 	ldw (LLEN,sp),x
                                   1104 ; check if that line number already exit 	
      008591 1E 05            [ 2] 1105 	ldw x,(LINENO,sp)
      008593 CD 84 E1         [ 4] 1106 	call search_lineno 
      008596 5D               [ 2] 1107 	tnzw x 
      008597 26 04            [ 1] 1108 	jrne 2$
                                   1109 ; line doesn't exit
                                   1110 ; it will be inserted at this point.  	
      008599 17 01            [ 2] 1111 	ldw (DEST,sp),y 
      00859B 20 05            [ 2] 1112 	jra 3$
                                   1113 ; line exit delete it.
                                   1114 ; it will be replaced by new one 	
      00859D 1F 01            [ 2] 1115 2$: ldw (DEST,sp),x 
      00859F CD 85 05         [ 4] 1116 	call del_line
      0085A2                       1117 3$: 
                                   1118 ; insert new line or leave if LLEN==3
                                   1119 ; LLEN==3 means empty line 
      0085A2 A6 03            [ 1] 1120 	ld a,#3
      0085A4 11 08            [ 1] 1121 	cp a,(LLEN+1,sp)
      0085A6 27 24            [ 1] 1122 	jreq insert_ln_exit ; empty line exit.
                                   1123 ; if insertion point at txtend 
                                   1124 ; move no need to create a gap 
      0085A8 1E 01            [ 2] 1125 	ldw x,(DEST,sp)
      0085AA C3 00 1F         [ 2] 1126 	cpw x,txtend 
      0085AD 27 09            [ 1] 1127 	jreq 4$ 
                                   1128 ; must create a gap
                                   1129 ; at insertion point  
      0085AF 1E 01            [ 2] 1130 	ldw x,(DEST,sp)
      0085B1 16 07            [ 2] 1131 	ldw y,(LLEN,sp)
      0085B3 CD 85 32         [ 4] 1132 	call create_gap
      0085B6 20 06            [ 2] 1133 	jra 5$
      0085B8                       1134 4$: 
      0085B8 72 FB 07         [ 2] 1135 	addw x,(LLEN,sp)
      0085BB CF 00 1F         [ 2] 1136 	ldw txtend,x 	 
                                   1137 ; move new line in gap 
      0085BE 1E 07            [ 2] 1138 5$:	ldw x,(LLEN,sp)
      0085C0 CF 00 0D         [ 2] 1139 	ldw acc16,x 
      0085C3 90 AE 16 E0      [ 2] 1140 	ldw y,#pad ;SRC 
      0085C7 1E 01            [ 2] 1141 	ldw x,(DEST,sp) ; dest address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0085C9 CD 84 9F         [ 4] 1142 	call move 
      0085CC                       1143 insert_ln_exit:	
      00054C                       1144 	_drop VSIZE
      0085CC 5B 08            [ 2]    1     addw sp,#VSIZE 
      0085CE 81               [ 4] 1145 	ret
                                   1146 
                                   1147 ;-----------------------------------
                                   1148 ; create token list fromm text line 
                                   1149 ; save this list in pad buffer 
                                   1150 ;  compiled line format: 
                                   1151 ;    line_no  2 bytes {0...32767}
                                   1152 ;    count    1 byte  
                                   1153 ;    tokens   variable length 
                                   1154 ;   
                                   1155 ; input:
                                   1156 ;   none
                                   1157 ; modified variables:
                                   1158 ;   basicptr     token list buffer address 
                                   1159 ;   in.w  		 3|count, i.e. index in buffer
                                   1160 ;   count        length of line | 0  
                                   1161 ;-----------------------------------
                           000001  1162 	XSAVE=1
                           000002  1163 	VSIZE=2
      0085CF                       1164 compile:
      00054F                       1165 	_vars VSIZE 
      0085CF 52 02            [ 2]    1     sub sp,#VSIZE 
      0085D1 72 1A 00 24      [ 1] 1166 	bset flags,#FCOMP 
      0085D5 A6 00            [ 1] 1167 	ld a,#0
      0085D7 AE 00 00         [ 2] 1168 	ldw x,#0
      0085DA CF 16 E0         [ 2] 1169 	ldw pad,x ; destination buffer 
      0085DD C7 16 E2         [ 1] 1170 	ld pad+2,a ; count 
      0085E0 AE 16 E3         [ 2] 1171 	ldw x,#pad+3
      0085E3 72 5F 00 02      [ 1] 1172 	clr in 
      0085E7 CD 8C E7         [ 4] 1173 	call get_token
      0085EA A1 84            [ 1] 1174 	cp a,#TK_INTGR
      0085EC 26 11            [ 1] 1175 	jrne 2$
      0085EE A3 00 01         [ 2] 1176 	cpw x,#1 
      0085F1 2A 05            [ 1] 1177 	jrpl 1$
      0085F3 A6 0A            [ 1] 1178 	ld a,#ERR_BAD_VALUE
      0085F5 CC 89 67         [ 2] 1179 	jp tb_error
      0085F8 CF 16 E0         [ 2] 1180 1$:	ldw pad,x 
      0085FB 90 AE 16 E3      [ 2] 1181 	ldw y,#pad+3 
      0085FF 90 A3 17 60      [ 2] 1182 2$:	cpw y,#stack_full 
      008603 25 05            [ 1] 1183 	jrult 3$
      008605 A6 0F            [ 1] 1184 	ld a,#ERR_BUF_FULL 
      008607 CC 89 67         [ 2] 1185 	jp tb_error 
      00860A                       1186 3$:	
      00860A 93               [ 1] 1187 	ldw x,y 
      00860B CD 8C E7         [ 4] 1188 	call get_token 
      00860E A1 00            [ 1] 1189 	cp a,#TK_NONE 
      008610 26 ED            [ 1] 1190 	jrne 2$ 
                                   1191 ; compilation completed  
      008612 72 A2 16 E0      [ 2] 1192 	subw y,#pad
      008616 90 9F            [ 1] 1193     ld a,yl
      008618 AE 16 E0         [ 2] 1194 	ldw x,#pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      00861B CF 00 18         [ 2] 1195 	ldw ptr16,x 
      00861E E7 02            [ 1] 1196 	ld (2,x),a 
      008620 FE               [ 2] 1197 	ldw x,(x)
      008621 27 09            [ 1] 1198 	jreq 10$
      008623 CD 85 5E         [ 4] 1199 	call insert_line
      008626 72 5F 00 04      [ 1] 1200 	clr  count 
      00862A 20 0F            [ 2] 1201 	jra  11$ 
      00862C                       1202 10$: ; line# is zero 
      00862C CE 00 18         [ 2] 1203 	ldw x,ptr16  
      00862F CF 00 05         [ 2] 1204 	ldw basicptr,x 
      008632 E6 02            [ 1] 1205 	ld a,(2,x)
      008634 C7 00 04         [ 1] 1206 	ld count,a 
      008637 35 03 00 02      [ 1] 1207 	mov in,#3 
      00863B                       1208 11$:
      0005BB                       1209 	_drop VSIZE 
      00863B 5B 02            [ 2]    1     addw sp,#VSIZE 
      00863D 72 1B 00 24      [ 1] 1210 	bres flags,#FCOMP 
      008641 81               [ 4] 1211 	ret 
                                   1212 
                                   1213 ;------------------------------------
                                   1214 ;  set all variables to zero 
                                   1215 ; input:
                                   1216 ;   none 
                                   1217 ; output:
                                   1218 ;	none
                                   1219 ;------------------------------------
      008642                       1220 clear_vars:
      008642 AE 00 31         [ 2] 1221 	ldw x,#vars 
      008645 90 AE 00 34      [ 2] 1222 	ldw y,#2*26 
      008649 7F               [ 1] 1223 1$:	clr (x)
      00864A 5C               [ 1] 1224 	incw x 
      00864B 90 5A            [ 2] 1225 	decw y 
      00864D 26 FA            [ 1] 1226 	jrne 1$
      00864F 81               [ 4] 1227 	ret 
                                   1228 
                                   1229 ;-------------------------------------
                                   1230 ; check if A is a letter 
                                   1231 ; input:
                                   1232 ;   A 			character to test 
                                   1233 ; output:
                                   1234 ;   C flag      1 true, 0 false 
                                   1235 ;-------------------------------------
      008650                       1236 is_alpha:
      008650 A1 41            [ 1] 1237 	cp a,#'A 
      008652 8C               [ 1] 1238 	ccf 
      008653 24 0B            [ 1] 1239 	jrnc 9$ 
      008655 A1 5B            [ 1] 1240 	cp a,#'Z+1 
      008657 25 07            [ 1] 1241 	jrc 9$ 
      008659 A1 61            [ 1] 1242 	cp a,#'a 
      00865B 8C               [ 1] 1243 	ccf 
      00865C 24 02            [ 1] 1244 	jrnc 9$
      00865E A1 7B            [ 1] 1245 	cp a,#'z+1
      008660 81               [ 4] 1246 9$: ret 	
                                   1247 
                                   1248 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1249 ; check if character in {'0'..'9'}
                                   1250 ; input:
                                   1251 ;    A  character to test
                                   1252 ; output:
                                   1253 ;    Carry  0 not digit | 1 digit
                                   1254 ;------------------------------------
      008661                       1255 is_digit:
      008661 A1 30            [ 1] 1256 	cp a,#'0
      008663 25 03            [ 1] 1257 	jrc 1$
      008665 A1 3A            [ 1] 1258     cp a,#'9+1
      008667 8C               [ 1] 1259 	ccf 
      008668 8C               [ 1] 1260 1$:	ccf 
      008669 81               [ 4] 1261     ret
                                   1262 
                                   1263 ;-------------------------------------
                                   1264 ; return true if character in  A 
                                   1265 ; is letter or digit.
                                   1266 ; input:
                                   1267 ;   A     ASCII character 
                                   1268 ; output:
                                   1269 ;   A     no change 
                                   1270 ;   Carry    0 false| 1 true 
                                   1271 ;--------------------------------------
      00866A                       1272 is_alnum:
      00866A CD 86 61         [ 4] 1273 	call is_digit
      00866D 25 03            [ 1] 1274 	jrc 1$ 
      00866F CD 86 50         [ 4] 1275 	call is_alpha
      008672 81               [ 4] 1276 1$:	ret 
                                   1277 
                                   1278 
                                   1279 ;-------------------------------------
                                   1280 ;  program initialization entry point 
                                   1281 ;-------------------------------------
                           000001  1282 	MAJOR=1
                           000000  1283 	MINOR=0
      008673 0A 0A 54 69 6E 79 20  1284 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0086B9                       1285 cold_start:
                                   1286 ;set stack 
      0086B9 AE 17 FF         [ 2] 1287 	ldw x,#STACK_EMPTY
      0086BC 94               [ 1] 1288 	ldw sp,x   
                                   1289 ; clear all ram 
      0086BD 7F               [ 1] 1290 0$: clr (x)
      0086BE 5A               [ 2] 1291 	decw x 
      0086BF 26 FC            [ 1] 1292 	jrne 0$
                                   1293 ; activate pull up on all inputs 
      0086C1 A6 FF            [ 1] 1294 	ld a,#255 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0086C3 C7 50 03         [ 1] 1295 	ld PA_CR1,a 
      0086C6 C7 50 08         [ 1] 1296 	ld PB_CR1,a 
      0086C9 C7 50 0D         [ 1] 1297 	ld PC_CR1,a 
      0086CC C7 50 12         [ 1] 1298 	ld PD_CR1,a 
      0086CF C7 50 17         [ 1] 1299 	ld PE_CR1,a 
      0086D2 C7 50 1C         [ 1] 1300 	ld PF_CR1,a 
      0086D5 C7 50 21         [ 1] 1301 	ld PG_CR1,a 
      0086D8 C7 50 2B         [ 1] 1302 	ld PI_CR1,a
                                   1303 ; set LD2 pin as output and turn it on
      0086DB 72 1A 50 0D      [ 1] 1304     bset PC_CR1,#LED2_BIT
      0086DF 72 1A 50 0E      [ 1] 1305     bset PC_CR2,#LED2_BIT
      0086E3 72 1A 50 0C      [ 1] 1306     bset PC_DDR,#LED2_BIT
      0086E7 72 1A 50 0A      [ 1] 1307 	bset PC_ODR,#LED2_BIT 
                                   1308 ; disable schmitt triggers on Arduino CN4 analog inputs
      0086EB 55 00 3F 54 07   [ 1] 1309 	mov ADC_TDRL,0x3f
                                   1310 ; disable peripherals clocks
                                   1311 ;	clr CLK_PCKENR1 
                                   1312 ;	clr CLK_PCKENR2
      0086F0 72 5F 50 F2      [ 1] 1313 	clr AWU_TBR 
      0086F4 72 14 50 CA      [ 1] 1314 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1315 ; select internal clock no divisor: 16 Mhz 	
      0086F8 A6 E1            [ 1] 1316 	ld a,#CLK_SWR_HSI 
      0086FA 5F               [ 1] 1317 	clrw x  
      0086FB CD 81 44         [ 4] 1318     call clock_init 
      0086FE CD 81 67         [ 4] 1319 	call timer4_init
      008701 CD 81 5A         [ 4] 1320 	call timer2_init
                                   1321 ; UART1 at 115200 BAUD
      008704 CD 83 47         [ 4] 1322 	call uart1_init
                                   1323 ; UART3 at 115200 BAUD 
      008707 CD 83 0C         [ 4] 1324 	call uart3_init	
      00870A 72 5F 00 30      [ 1] 1325 	clr comm ; default to UART1
                                   1326 ; activate PE_4 (user button interrupt)
      00870E 72 18 50 18      [ 1] 1327     bset PE_CR2,#USR_BTN_BIT 
                                   1328 ; display system information
      008712 AE 86 73         [ 2] 1329 	ldw x,#software 
      008715 CD AA 40         [ 4] 1330 	call puts 
      008718 A6 01            [ 1] 1331 	ld a,#MAJOR 
      00871A C7 00 0E         [ 1] 1332 	ld acc8,a 
      00871D 5F               [ 1] 1333 	clrw x 
      00871E CF 00 0C         [ 2] 1334 	ldw acc24,x
      008721 72 5F 00 25      [ 1] 1335 	clr tab_width  
      008725 35 0A 00 0B      [ 1] 1336 	mov base, #10 
      008729 CD 8A C8         [ 4] 1337 	call prti24 
      00872C A6 2E            [ 1] 1338 	ld a,#'.
      00872E CD 83 8A         [ 4] 1339 	call putc 
      008731 A6 00            [ 1] 1340 	ld a,#MINOR 
      008733 C7 00 0E         [ 1] 1341 	ld acc8,a 
      008736 5F               [ 1] 1342 	clrw x 
      008737 CF 00 0C         [ 2] 1343 	ldw acc24,x 
      00873A CD 8A C8         [ 4] 1344 	call prti24
      00873D A6 0D            [ 1] 1345 	ld a,#CR 
      00873F CD 83 8A         [ 4] 1346 	call putc
      008742 CD 9B 1D         [ 4] 1347 	call seek_fdrive 
      008745 9A               [ 1] 1348 	rim 
      008746 72 5C 00 16      [ 1] 1349 	inc seedy+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      00874A 72 5C 00 14      [ 1] 1350 	inc seedx+1 
      00874E CD 87 CF         [ 4] 1351 	call clear_basic
      008751 CD 93 35         [ 4] 1352 	call ubound 
                                   1353 ;	jra 2$	
      008754 CD 99 6B         [ 4] 1354 	call beep_1khz  
      008757 72 1B 50 0A      [ 1] 1355 2$:	bres PC_ODR,#LED2_BIT	
      00875B CD 87 64         [ 4] 1356 	call warm_init
      00875E CD 87 91         [ 4] 1357 	call load_autorun
      008761 CC 89 EF         [ 2] 1358     jp cmd_line  
                                   1359 
      008764                       1360 warm_init:
      008764 72 5F 00 24      [ 1] 1361 	clr flags 
      008768 72 5F 00 21      [ 1] 1362 	clr loop_depth 
      00876C 35 04 00 25      [ 1] 1363 	mov tab_width,#TAB_WIDTH 
      008770 35 0A 00 0B      [ 1] 1364 	mov base,#10 
      008774 AE 00 00         [ 2] 1365 	ldw x,#0 
      008777 CF 00 05         [ 2] 1366 	ldw basicptr,x 
      00877A CF 00 01         [ 2] 1367 	ldw in.w,x 
      00877D 72 5F 00 04      [ 1] 1368 	clr count
      008781 81               [ 4] 1369 	ret 
                                   1370 
                                   1371 ;--------------------------
                                   1372 ; called by tb_error when
                                   1373 ; flag FAUTORUN is set.
                                   1374 ; There is a bug in autorun 
                                   1375 ; program so cancel it.
                                   1376 ;---------------------------
      008782                       1377 cancel_autorun:
      008782 AE 40 00         [ 2] 1378 	ldw x,#AUTORUN_NAME 
      008785 CF 00 18         [ 2] 1379 	ldw farptr+1,x 
      008788 4F               [ 1] 1380 	clr a
      008789 5F               [ 1] 1381 	clrw x  
      00878A C7 00 17         [ 1] 1382 	ld farptr,a 
      00878D CD 82 74         [ 4] 1383 	call write_byte 
      008790 81               [ 4] 1384 	ret 
                                   1385 
                                   1386 
                                   1387 ;--------------------------
                                   1388 ; if autorun file defined 
                                   1389 ; in eeprom address AUTORUN_NAME 
                                   1390 ; load and run it.
                                   1391 ;-------------------------
      008791                       1392 load_autorun:
      008791 90 AE 40 00      [ 2] 1393 	ldw y,#AUTORUN_NAME
      008795 90 F6            [ 1] 1394 	ld a,(y)
      008797 27 20            [ 1] 1395 	jreq 9$
      008799 CD 9B 83         [ 4] 1396 	call search_file
      00879C 25 05            [ 1] 1397 	jrc 2$ 
                                   1398 ; if file doesn't exit
      00879E CD 87 82         [ 4] 1399 	call cancel_autorun
      0087A1 20 16            [ 2] 1400 	jra 9$ 
      0087A3 CD 9C 9C         [ 4] 1401 2$:	call load_file
      0087A6 AE 40 00         [ 2] 1402 	ldw x,#AUTORUN_NAME 
      0087A9 CD AA 40         [ 4] 1403 	call puts
      0087AC AE 87 BA         [ 2] 1404 	ldw x,#autorun_msg 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0087AF CD AA 40         [ 4] 1405 	call puts 
      0087B2 72 1C 00 24      [ 1] 1406 	bset flags,#FAUTORUN 
      0087B6 CC 99 3D         [ 2] 1407 	jp run_it    
      0087B9 81               [ 4] 1408 9$: ret 	
                                   1409 
      0087BA 20 6C 6F 61 64 65 64  1410 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1411 ;---------------------------
                                   1412 ; reset BASIC text variables 
                                   1413 ; and clear variables 
                                   1414 ;---------------------------
      0087CF                       1415 clear_basic:
      0087CF 72 5F 00 04      [ 1] 1416 	clr count
      0087D3 72 5F 00 02      [ 1] 1417 	clr in  
      0087D7 AE 00 65         [ 2] 1418 	ldw x,#free_ram 
      0087DA CF 00 1D         [ 2] 1419 	ldw txtbgn,x 
      0087DD CF 00 1F         [ 2] 1420 	ldw txtend,x 
      0087E0 CD 86 42         [ 4] 1421 	call clear_vars 
      0087E3 81               [ 4] 1422 	ret 
                                   1423 
                                   1424 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1425 ;;   Tiny BASIC error messages     ;;
                                   1426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0087E4                       1427 err_msg:
      0087E4 00 00 88 04 88 11 88  1428 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             1F 88 38 88 47
      0087F0 88 5D 88 73 88 8D 88  1429 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             9E 88 AF
      0087FA 88 BB 88 EE 88 FE 89  1430 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             12 89 25
                                   1431 
      008804 4D 65 6D 6F 72 79 20  1432 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      008811 73 79 6E 74 61 78 20  1433 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      00881F 6D 61 74 68 20 6F 70  1434 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      008838 64 69 76 69 73 69 6F  1435 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      008847 69 6E 76 61 6C 69 64  1436 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      00885D 72 75 6E 20 74 69 6D  1437 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      008873 63 6F 6D 6D 61 6E 64  1438 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      00888D 64 75 70 6C 69 63 61  1439 err_duplicate: .asciz "duplicate name.\n"
             74 65 20 6E 61 6D 65
             2E 0A 00
      00889E 46 69 6C 65 20 6E 6F  1440 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      0088AF 62 61 64 20 76 61 6C  1441 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      0088BB 46 69 6C 65 20 69 6E  1442 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      0088EE 4E 6F 20 64 61 74 61  1443 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      0088FE 4E 6F 20 70 72 6F 67  1444 err_no_prog: .asciz "No program in RAM!\n"
             72 61 6D 20 69 6E 20
             52 41 4D 21 0A 00
      008912 46 69 6C 65 20 73 79  1445 err_no_fspace: .asciz "File system full.\n" 
             73 74 65 6D 20 66 75
             6C 6C 2E 0A 00
      008925 42 75 66 66 65 72 20  1446 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
                                   1447 
      008932 0A 72 75 6E 20 74 69  1448 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
      008944 0A 63 6F 6D 70 69 6C  1449 comp_msg: .asciz "\ncompile error, "
             65 20 65 72 72 6F 72
             2C 20 00
      008955 6C 61 73 74 20 74 6F  1450 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                   1451 
      008965                       1452 syntax_error:
      008965 A6 02            [ 1] 1453 	ld a,#ERR_SYNTAX 
                                   1454 
      008967                       1455 tb_error:
      008967 72 0A 00 24 47   [ 2] 1456 	btjt flags,#FCOMP,1$
      00896C 88               [ 1] 1457 	push a 
      00896D AE 89 32         [ 2] 1458 	ldw x, #rt_msg 
      008970 CD AA 40         [ 4] 1459 	call puts 
      008973 84               [ 1] 1460 	pop a 
      008974 AE 87 E4         [ 2] 1461 	ldw x, #err_msg 
      008977 72 5F 00 0D      [ 1] 1462 	clr acc16 
      00897B 48               [ 1] 1463 	sll a
      00897C 72 59 00 0D      [ 1] 1464 	rlc acc16  
      008980 C7 00 0E         [ 1] 1465 	ld acc8, a 
      008983 72 BB 00 0D      [ 2] 1466 	addw x,acc16 
      008987 FE               [ 2] 1467 	ldw x,(x)
      008988 CD AA 40         [ 4] 1468 	call puts
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      00898B CE 00 05         [ 2] 1469 	ldw x,basicptr
      00898E C6 00 02         [ 1] 1470 	ld a,in 
      008991 CD 96 09         [ 4] 1471 	call prt_basic_line
      008994 AE 89 55         [ 2] 1472 	ldw x,#tk_id 
      008997 CD AA 40         [ 4] 1473 	call puts 
      00899A C6 00 03         [ 1] 1474 	ld a,in.saved 
      00899D 5F               [ 1] 1475 	clrw x 
      00899E 97               [ 1] 1476 	ld xl,a 
      00899F 72 BB 00 05      [ 2] 1477 	addw x,basicptr 
      0089A3 F6               [ 1] 1478 	ld a,(x)
      0089A4 5F               [ 1] 1479 	clrw x 
      0089A5 97               [ 1] 1480 	ld xl,a 
      0089A6 CD 8A B8         [ 4] 1481 	call print_int
      0089A9 72 0D 00 24 3A   [ 2] 1482 	btjf flags,#FAUTORUN ,6$
      0089AE CD 87 82         [ 4] 1483 	call cancel_autorun  
      0089B1 20 35            [ 2] 1484 	jra 6$
      0089B3                       1485 1$:	
      0089B3 88               [ 1] 1486 	push a 
      0089B4 AE 89 44         [ 2] 1487 	ldw x,#comp_msg
      0089B7 CD AA 40         [ 4] 1488 	call puts 
      0089BA 84               [ 1] 1489 	pop a 
      0089BB AE 87 E4         [ 2] 1490 	ldw x, #err_msg 
      0089BE 72 5F 00 0D      [ 1] 1491 	clr acc16 
      0089C2 48               [ 1] 1492 	sll a
      0089C3 72 59 00 0D      [ 1] 1493 	rlc acc16  
      0089C7 C7 00 0E         [ 1] 1494 	ld acc8, a 
      0089CA 72 BB 00 0D      [ 2] 1495 	addw x,acc16 
      0089CE FE               [ 2] 1496 	ldw x,(x)
      0089CF CD AA 40         [ 4] 1497 	call puts
      0089D2 AE 16 90         [ 2] 1498 	ldw x,#tib
      0089D5 CD AA 40         [ 4] 1499 	call puts 
      0089D8 A6 0D            [ 1] 1500 	ld a,#CR 
      0089DA CD 83 8A         [ 4] 1501 	call putc
      0089DD CE 00 01         [ 2] 1502 	ldw x,in.w
      0089E0 CD AA AD         [ 4] 1503 	call spaces
      0089E3 A6 5E            [ 1] 1504 	ld a,#'^
      0089E5 CD 83 8A         [ 4] 1505 	call putc 
      0089E8 AE 17 FF         [ 2] 1506 6$: ldw x,#STACK_EMPTY 
      0089EB 94               [ 1] 1507     ldw sp,x
      0089EC                       1508 warm_start:
      0089EC CD 87 64         [ 4] 1509 	call warm_init
                                   1510 ;----------------------------
                                   1511 ;   BASIC interpreter
                                   1512 ;----------------------------
      0089EF                       1513 cmd_line: ; user interface 
      0089EF A6 0D            [ 1] 1514 	ld a,#CR 
      0089F1 CD 83 8A         [ 4] 1515 	call putc 
      0089F4 A6 3E            [ 1] 1516 	ld a,#'> 
      0089F6 CD 83 8A         [ 4] 1517 	call putc
      0089F9 CD AB 45         [ 4] 1518 	call readln
      0089FC 72 5D 00 04      [ 1] 1519 	tnz count 
      008A00 27 ED            [ 1] 1520 	jreq cmd_line
      008A02 CD 85 CF         [ 4] 1521 	call compile
                                   1522 ; if text begin with a line number
                                   1523 ; the compiler set count to zero    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1524 ; so code is not interpreted
      008A05 72 5D 00 04      [ 1] 1525 	tnz count 
      008A09 27 E4            [ 1] 1526 	jreq cmd_line
                                   1527 
                                   1528 ; if direct command 
                                   1529 ; it's ready to interpret 
                                   1530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1531 ;; This is the interpreter loop
                                   1532 ;; for each BASIC code line. 
                                   1533 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      008A0B                       1534 interpreter: 
      008A0B C6 00 02         [ 1] 1535 	ld a,in 
      008A0E C1 00 04         [ 1] 1536 	cp a,count 
      008A11 2B 1D            [ 1] 1537 	jrmi interp_loop
      008A13                       1538 next_line:
      008A13 72 01 00 24 D7   [ 2] 1539 	btjf flags, #FRUN, cmd_line
      008A18 CE 00 05         [ 2] 1540 	ldw x,basicptr
      008A1B 72 BB 00 01      [ 2] 1541 	addw x,in.w 
      008A1F C3 00 1F         [ 2] 1542 	cpw x,txtend 
      008A22 2A C8            [ 1] 1543 	jrpl warm_start
      008A24 CF 00 05         [ 2] 1544 	ldw basicptr,x ; start of next line  
      008A27 E6 02            [ 1] 1545 	ld a,(2,x)
      008A29 C7 00 04         [ 1] 1546 	ld count,a 
      008A2C 35 03 00 02      [ 1] 1547 	mov in,#3 ; skip first 3 bytes of line 
      008A30                       1548 interp_loop: 
      008A30 CD 8A 57         [ 4] 1549 	call next_token
      008A33 A1 00            [ 1] 1550 	cp a,#TK_NONE 
      008A35 27 DC            [ 1] 1551 	jreq next_line 
      008A37 A1 80            [ 1] 1552 	cp a,#TK_CMD
      008A39 26 03            [ 1] 1553 	jrne 1$
      008A3B FD               [ 4] 1554 	call (x) 
      008A3C 20 F2            [ 2] 1555 	jra interp_loop 
      008A3E                       1556 1$:	 
      008A3E A1 85            [ 1] 1557 	cp a,#TK_VAR
      008A40 26 05            [ 1] 1558 	jrne 2$
      008A42 CD 93 68         [ 4] 1559 	call let_var  
      008A45 20 E9            [ 2] 1560 	jra interp_loop 
      008A47                       1561 2$:	
      008A47 A1 06            [ 1] 1562 	cp a,#TK_ARRAY 
      008A49 26 05            [ 1] 1563 	jrne 3$
      008A4B CD 93 65         [ 4] 1564 	call let_array 
      008A4E 20 E0            [ 2] 1565 	jra interp_loop
      008A50                       1566 3$:	
      008A50 A1 01            [ 1] 1567 	cp a,#TK_COLON 
      008A52 27 DC            [ 1] 1568 	jreq interp_loop 
      008A54 CC 89 65         [ 2] 1569 	jp syntax_error 
                                   1570 
                                   1571 		
                                   1572 ;--------------------------
                                   1573 ; extract next token from
                                   1574 ; token list 
                                   1575 ; basicptr -> base address 
                                   1576 ; in  -> offset in list array 
                                   1577 ; output:
                                   1578 ;   A 		token attribute
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1579 ;   X 		token value if there is one
                                   1580 ;----------------------------------------
      008A57                       1581 next_token:
      008A57 5F               [ 1] 1582 	clrw x 
      008A58 C6 00 02         [ 1] 1583 	ld a,in 
      008A5B C0 00 04         [ 1] 1584 	sub a,count ; don't replace sub by cp!  
      008A5E 2B 01            [ 1] 1585 	jrmi 0$
      008A60 81               [ 4] 1586 	ret  ; end of BASIC line 
      008A61                       1587 0$: 
      008A61 55 00 02 00 03   [ 1] 1588 	mov in.saved,in 
      008A66 90 CE 00 05      [ 2] 1589 	ldw y,basicptr 
      008A6A 91 D6 01         [ 4] 1590 	ld a,([in.w],y)
      008A6D 72 5C 00 02      [ 1] 1591 	inc in  
      008A71 4D               [ 1] 1592 	tnz a 
      008A72 2B 2A            [ 1] 1593 	jrmi 6$
      008A74 A1 06            [ 1] 1594 	cp a,#TK_ARRAY
      008A76 2A 3F            [ 1] 1595 	jrpl 9$  ; no attribute for these
      008A78 A1 01            [ 1] 1596 	cp a,#TK_COLON
      008A7A 27 3B            [ 1] 1597 	jreq 9$  
      008A7C                       1598 1$: ; 
      008A7C A1 03            [ 1] 1599 	cp a,#TK_CHAR
      008A7E 26 0A            [ 1] 1600 	jrne 2$
      008A80 41               [ 1] 1601 	exg a,xl
      008A81 91 D6 01         [ 4] 1602 	ld a,([in.w],y)
      008A84 72 5C 00 02      [ 1] 1603 	inc in 
      008A88 41               [ 1] 1604 	exg a,xl  
      008A89 81               [ 4] 1605 	ret
      008A8A A1 02            [ 1] 1606 2$:	cp a,#TK_QSTR 
      008A8C 26 29            [ 1] 1607 	jrne 9$
      008A8E 93               [ 1] 1608 	ldw x,y 
      008A8F 72 BB 00 01      [ 2] 1609 	addw x,in.w ; pointer to string 
                                   1610 ; move pointer after string 
      008A93 91 6D 01         [ 4] 1611 3$:	tnz ([in.w],y)
      008A96 27 1B            [ 1] 1612 	jreq 8$
      008A98 72 5C 00 02      [ 1] 1613 	inc in 
      008A9C 20 F5            [ 2] 1614 	jra 3$
      008A9E                       1615 6$: 
      008A9E 72 B9 00 01      [ 2] 1616 	addw y,in.w 
      008AA2 90 FE            [ 2] 1617 	ldw y,(y)
      008AA4 A1 84            [ 1] 1618 	cp a,#TK_INTGR
      008AA6 2A 06            [ 1] 1619 	jrpl 7$
      008AA8 72 A9 A9 16      [ 2] 1620 	addw y,#code_addr
      008AAC 90 FE            [ 2] 1621 	ldw y,(y) 
      008AAE 51               [ 1] 1622 7$:	exgw x,y 
      008AAF 72 5C 00 02      [ 1] 1623 	inc in
      008AB3 72 5C 00 02      [ 1] 1624 8$:	inc in 
      008AB7                       1625 9$: 
      008AB7 81               [ 4] 1626 	ret	
                                   1627 
                                   1628 ;-----------------------------------
                                   1629 ; print a 16 bit integer 
                                   1630 ; using variable 'base' as conversion
                                   1631 ; format.
                                   1632 ; input:
                                   1633 ;   X       integer to print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1634 ;   'base'    conversion base 
                                   1635 ; output:
                                   1636 ;   none 
                                   1637 ;-----------------------------------
      008AB8                       1638 print_int:
      008AB8 72 5F 00 0C      [ 1] 1639 	clr acc24 
      008ABC CF 00 0D         [ 2] 1640 	ldw acc16,x 
      008ABF 72 0F 00 0D 04   [ 2] 1641 	btjf acc16,#7,prti24
      008AC4 72 53 00 0C      [ 1] 1642 	cpl acc24 
                                   1643 
                                   1644 ;------------------------------------
                                   1645 ; print integer in acc24 
                                   1646 ; input:
                                   1647 ;	acc24 		integer to print 
                                   1648 ;	'base' 		numerical base for conversion 
                                   1649 ;   'tab_width' field width 
                                   1650 ;  output:
                                   1651 ;    A          string length
                                   1652 ;------------------------------------
      008AC8                       1653 prti24:
      008AC8 CD 8A D4         [ 4] 1654     call itoa  ; conversion entier en  .asciz
      008ACB CD 94 25         [ 4] 1655 	call right_align  
      008ACE 88               [ 1] 1656 	push a 
      008ACF CD AA 40         [ 4] 1657 	call puts
      008AD2 84               [ 1] 1658 	pop a 
      008AD3 81               [ 4] 1659     ret	
                                   1660 
                                   1661 ;------------------------------------
                                   1662 ; convert integer in acc24 to string
                                   1663 ; input:
                                   1664 ;   'base'	conversion base 
                                   1665 ;	acc24	integer to convert
                                   1666 ; output:
                                   1667 ;   X  		pointer to first char of string
                                   1668 ;   A       string length
                                   1669 ;------------------------------------
                           000001  1670 	SIGN=1  ; integer sign 
                           000002  1671 	LEN=2 
                           000003  1672 	PSTR=3
                           000004  1673 	VSIZE=4 ;locals size
      008AD4                       1674 itoa:
      000A54                       1675 	_vars VSIZE
      008AD4 52 04            [ 2]    1     sub sp,#VSIZE 
      008AD6 0F 02            [ 1] 1676 	clr (LEN,sp) ; string length  
      008AD8 0F 01            [ 1] 1677 	clr (SIGN,sp)    ; sign
      008ADA C6 00 0B         [ 1] 1678 	ld a,base 
      008ADD A1 0A            [ 1] 1679 	cp a,#10
      008ADF 26 0A            [ 1] 1680 	jrne 1$
                                   1681 	; base 10 string display with negative sign if bit 23==1
      008AE1 72 0F 00 0C 05   [ 2] 1682 	btjf acc24,#7,1$
      008AE6 03 01            [ 1] 1683 	cpl (SIGN,sp)
      008AE8 CD 8B 9B         [ 4] 1684 	call neg_acc24
      008AEB                       1685 1$:
                                   1686 ; initialize string pointer 
      008AEB AE 16 90         [ 2] 1687 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008AEE 1C 00 50         [ 2] 1688 	addw x,#TIB_SIZE
      008AF1 5A               [ 2] 1689 	decw x 
      008AF2 7F               [ 1] 1690 	clr (x)
      008AF3                       1691 itoa_loop:
      008AF3 C6 00 0B         [ 1] 1692     ld a,base
      008AF6 1F 03            [ 2] 1693 	ldw (PSTR,sp),x 
      008AF8 CD 8B 39         [ 4] 1694     call divu24_8 ; acc24/A 
      008AFB 1E 03            [ 2] 1695 	ldw x,(PSTR,sp)
      008AFD AB 30            [ 1] 1696     add a,#'0  ; remainder of division
      008AFF A1 3A            [ 1] 1697     cp a,#'9+1
      008B01 2B 02            [ 1] 1698     jrmi 2$
      008B03 AB 07            [ 1] 1699     add a,#7 
      008B05                       1700 2$:	
      008B05 5A               [ 2] 1701 	decw x
      008B06 F7               [ 1] 1702     ld (x),a
      008B07 0C 02            [ 1] 1703 	inc (LEN,sp)
                                   1704 	; if acc24==0 conversion done
      008B09 C6 00 0C         [ 1] 1705 	ld a,acc24
      008B0C CA 00 0D         [ 1] 1706 	or a,acc16
      008B0F CA 00 0E         [ 1] 1707 	or a,acc8
      008B12 26 DF            [ 1] 1708     jrne itoa_loop
                                   1709 	;conversion done, next add '$' or '-' as required
      008B14 C6 00 0B         [ 1] 1710 	ld a,base 
      008B17 A1 10            [ 1] 1711 	cp a,#16
      008B19 27 08            [ 1] 1712 	jreq 8$
      008B1B 7B 01            [ 1] 1713 	ld a,(SIGN,sp)
      008B1D 27 15            [ 1] 1714     jreq 10$
      008B1F A6 2D            [ 1] 1715     ld a,#'-
      008B21 20 0D            [ 2] 1716 	jra 9$ 
                                   1717 ; don't print more than 4 digits
                                   1718 ; in hexadecimal to avoid '-' sign 
                                   1719 ; extend display 	
      008B23 7B 02            [ 1] 1720 8$: ld a,(LEN,sp) 
      008B25 A1 05            [ 1] 1721 	cp a,#5 
      008B27 2B 05            [ 1] 1722 	jrmi 81$
      008B29 5C               [ 1] 1723 	incw x
      008B2A 0A 02            [ 1] 1724 	dec (LEN,sp)
      008B2C 20 F5            [ 2] 1725 	jra 8$
      008B2E                       1726 81$:	
      008B2E A6 24            [ 1] 1727 	ld a,#'$ 
      008B30 5A               [ 2] 1728 9$: decw x
      008B31 F7               [ 1] 1729     ld (x),a
      008B32 0C 02            [ 1] 1730 	inc (LEN,sp)
      008B34                       1731 10$:
      008B34 7B 02            [ 1] 1732 	ld a,(LEN,sp)
      000AB6                       1733 	_drop VSIZE
      008B36 5B 04            [ 2]    1     addw sp,#VSIZE 
      008B38 81               [ 4] 1734 	ret
                                   1735 
                                   1736 ;-------------------------------------
                                   1737 ; divide uint24_t by uint8_t
                                   1738 ; used to convert uint24_t to string
                                   1739 ; input:
                                   1740 ;	acc24	dividend
                                   1741 ;   A 		divisor
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1742 ; output:
                                   1743 ;   acc24	quotient
                                   1744 ;   A		remainder
                                   1745 ;------------------------------------- 
                                   1746 ; offset  on sp of arguments and locals
                           000001  1747 	U8   = 1   ; divisor on stack
                           000001  1748 	VSIZE =1
      008B39                       1749 divu24_8:
      008B39 89               [ 2] 1750 	pushw x ; save x
      008B3A 88               [ 1] 1751 	push a 
                                   1752 	; ld dividend UU:MM bytes in X
      008B3B C6 00 0C         [ 1] 1753 	ld a, acc24
      008B3E 95               [ 1] 1754 	ld xh,a
      008B3F C6 00 0D         [ 1] 1755 	ld a,acc24+1
      008B42 97               [ 1] 1756 	ld xl,a
      008B43 7B 01            [ 1] 1757 	ld a,(U8,SP) ; divisor
      008B45 62               [ 2] 1758 	div x,a ; UU:MM/U8
      008B46 88               [ 1] 1759 	push a  ;save remainder
      008B47 9E               [ 1] 1760 	ld a,xh
      008B48 C7 00 0C         [ 1] 1761 	ld acc24,a
      008B4B 9F               [ 1] 1762 	ld a,xl
      008B4C C7 00 0D         [ 1] 1763 	ld acc24+1,a
      008B4F 84               [ 1] 1764 	pop a
      008B50 95               [ 1] 1765 	ld xh,a
      008B51 C6 00 0E         [ 1] 1766 	ld a,acc24+2
      008B54 97               [ 1] 1767 	ld xl,a
      008B55 7B 01            [ 1] 1768 	ld a,(U8,sp) ; divisor
      008B57 62               [ 2] 1769 	div x,a  ; R:LL/U8
      008B58 6B 01            [ 1] 1770 	ld (U8,sp),a ; save remainder
      008B5A 9F               [ 1] 1771 	ld a,xl
      008B5B C7 00 0E         [ 1] 1772 	ld acc24+2,a
      008B5E 84               [ 1] 1773 	pop a
      008B5F 85               [ 2] 1774 	popw x
      008B60 81               [ 4] 1775 	ret
                                   1776 
                                   1777 ;--------------------------------------
                                   1778 ; unsigned multiply uint24_t by uint8_t
                                   1779 ; use to convert numerical string to uint24_t
                                   1780 ; input:
                                   1781 ;	acc24	uint24_t 
                                   1782 ;   A		uint8_t
                                   1783 ; output:
                                   1784 ;   acc24   A*acc24
                                   1785 ;-------------------------------------
                                   1786 ; local variables offset  on sp
                           000003  1787 	U8   = 3   ; A pushed on stack
                           000002  1788 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1789 	OVFH = 1  ; multiplication overflow high byte
                           000003  1790 	VSIZE = 3
      008B61                       1791 mulu24_8:
      008B61 89               [ 2] 1792 	pushw x    ; save X
                                   1793 	; local variables
      008B62 88               [ 1] 1794 	push a     ; U8
      008B63 5F               [ 1] 1795 	clrw x     ; initialize overflow to 0
      008B64 89               [ 2] 1796 	pushw x    ; multiplication overflow
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1797 ; multiply low byte.
      008B65 C6 00 0E         [ 1] 1798 	ld a,acc24+2
      008B68 97               [ 1] 1799 	ld xl,a
      008B69 7B 03            [ 1] 1800 	ld a,(U8,sp)
      008B6B 42               [ 4] 1801 	mul x,a
      008B6C 9F               [ 1] 1802 	ld a,xl
      008B6D C7 00 0E         [ 1] 1803 	ld acc24+2,a
      008B70 9E               [ 1] 1804 	ld a, xh
      008B71 6B 02            [ 1] 1805 	ld (OVFL,sp),a
                                   1806 ; multipy middle byte
      008B73 C6 00 0D         [ 1] 1807 	ld a,acc24+1
      008B76 97               [ 1] 1808 	ld xl,a
      008B77 7B 03            [ 1] 1809 	ld a, (U8,sp)
      008B79 42               [ 4] 1810 	mul x,a
                                   1811 ; add overflow to this partial product
      008B7A 72 FB 01         [ 2] 1812 	addw x,(OVFH,sp)
      008B7D 9F               [ 1] 1813 	ld a,xl
      008B7E C7 00 0D         [ 1] 1814 	ld acc24+1,a
      008B81 4F               [ 1] 1815 	clr a
      008B82 A9 00            [ 1] 1816 	adc a,#0
      008B84 6B 01            [ 1] 1817 	ld (OVFH,sp),a
      008B86 9E               [ 1] 1818 	ld a,xh
      008B87 6B 02            [ 1] 1819 	ld (OVFL,sp),a
                                   1820 ; multiply most signficant byte	
      008B89 C6 00 0C         [ 1] 1821 	ld a, acc24
      008B8C 97               [ 1] 1822 	ld xl, a
      008B8D 7B 03            [ 1] 1823 	ld a, (U8,sp)
      008B8F 42               [ 4] 1824 	mul x,a
      008B90 72 FB 01         [ 2] 1825 	addw x, (OVFH,sp)
      008B93 9F               [ 1] 1826 	ld a, xl
      008B94 C7 00 0C         [ 1] 1827 	ld acc24,a
      008B97 5B 03            [ 2] 1828     addw sp,#VSIZE
      008B99 85               [ 2] 1829 	popw x
      008B9A 81               [ 4] 1830 	ret
                                   1831 
                                   1832 ;------------------------------------
                                   1833 ;  two's complement acc24
                                   1834 ;  input:
                                   1835 ;		acc24 variable
                                   1836 ;  output:
                                   1837 ;		acc24 variable
                                   1838 ;-------------------------------------
      008B9B                       1839 neg_acc24:
      008B9B 72 53 00 0E      [ 1] 1840 	cpl acc24+2
      008B9F 72 53 00 0D      [ 1] 1841 	cpl acc24+1
      008BA3 72 53 00 0C      [ 1] 1842 	cpl acc24
      008BA7 A6 01            [ 1] 1843 	ld a,#1
      008BA9 CB 00 0E         [ 1] 1844 	add a,acc24+2
      008BAC C7 00 0E         [ 1] 1845 	ld acc24+2,a
      008BAF 4F               [ 1] 1846 	clr a
      008BB0 C9 00 0D         [ 1] 1847 	adc a,acc24+1
      008BB3 C7 00 0D         [ 1] 1848 	ld acc24+1,a 
      008BB6 4F               [ 1] 1849 	clr a 
      008BB7 C9 00 0C         [ 1] 1850 	adc a,acc24 
      008BBA C7 00 0C         [ 1] 1851 	ld acc24,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008BBD 81               [ 4] 1852 	ret
                                   1853 
                                   1854 
                                   1855 
                                   1856 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1857 ;; compiler routines        ;;
                                   1858 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1859 ;------------------------------------
                                   1860 ; parse quoted string 
                                   1861 ; input:
                                   1862 ;   Y 	pointer to tib 
                                   1863 ;   X   pointer to output buffer 
                                   1864 ; output:
                                   1865 ;	buffer   parsed string
                                   1866 ;------------------------------------
                           000001  1867 	PREV = 1
                           000002  1868 	CURR =2
                           000002  1869 	VSIZE=2
      008BBE                       1870 parse_quote: 
      000B3E                       1871 	_vars VSIZE 
      008BBE 52 02            [ 2]    1     sub sp,#VSIZE 
      008BC0 4F               [ 1] 1872 	clr a
      008BC1 6B 01            [ 1] 1873 1$:	ld (PREV,sp),a 
      008BC3                       1874 2$:	
      008BC3 91 D6 01         [ 4] 1875 	ld a,([in.w],y)
      008BC6 27 24            [ 1] 1876 	jreq 6$
      008BC8 72 5C 00 02      [ 1] 1877 	inc in 
      008BCC 6B 02            [ 1] 1878 	ld (CURR,sp),a 
      008BCE A6 5C            [ 1] 1879 	ld a,#'\
      008BD0 11 01            [ 1] 1880 	cp a, (PREV,sp)
      008BD2 26 0A            [ 1] 1881 	jrne 3$
      008BD4 0F 01            [ 1] 1882 	clr (PREV,sp)
      008BD6 7B 02            [ 1] 1883 	ld a,(CURR,sp)
      008BD8 AD 1C            [ 4] 1884 	callr convert_escape
      008BDA F7               [ 1] 1885 	ld (x),a 
      008BDB 5C               [ 1] 1886 	incw x 
      008BDC 20 E5            [ 2] 1887 	jra 2$
      008BDE                       1888 3$:
      008BDE 7B 02            [ 1] 1889 	ld a,(CURR,sp)
      008BE0 A1 5C            [ 1] 1890 	cp a,#'\'
      008BE2 27 DD            [ 1] 1891 	jreq 1$
      008BE4 A1 22            [ 1] 1892 	cp a,#'"
      008BE6 27 04            [ 1] 1893 	jreq 6$ 
      008BE8 F7               [ 1] 1894 	ld (x),a 
      008BE9 5C               [ 1] 1895 	incw x 
      008BEA 20 D7            [ 2] 1896 	jra 2$
      008BEC                       1897 6$:
      008BEC 7F               [ 1] 1898 	clr (x)
      008BED 5C               [ 1] 1899 	incw x 
      008BEE 90 93            [ 1] 1900 	ldw y,x 
      008BF0 5F               [ 1] 1901 	clrw x 
      008BF1 A6 02            [ 1] 1902 	ld a,#TK_QSTR  
      000B73                       1903 	_drop VSIZE
      008BF3 5B 02            [ 2]    1     addw sp,#VSIZE 
      008BF5 81               [ 4] 1904 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1905 
                                   1906 ;---------------------------------------
                                   1907 ; called by parse_quote
                                   1908 ; subtitute escaped character 
                                   1909 ; by their ASCII value .
                                   1910 ; input:
                                   1911 ;   A  character following '\'
                                   1912 ; output:
                                   1913 ;   A  substitued char or same if not valid.
                                   1914 ;---------------------------------------
      008BF6                       1915 convert_escape:
      008BF6 89               [ 2] 1916 	pushw x 
      008BF7 AE 8C 0B         [ 2] 1917 	ldw x,#escaped 
      008BFA F1               [ 1] 1918 1$:	cp a,(x)
      008BFB 27 06            [ 1] 1919 	jreq 2$
      008BFD 7D               [ 1] 1920 	tnz (x)
      008BFE 27 09            [ 1] 1921 	jreq 3$
      008C00 5C               [ 1] 1922 	incw x 
      008C01 20 F7            [ 2] 1923 	jra 1$
      008C03 1D 8C 0B         [ 2] 1924 2$: subw x,#escaped 
      008C06 9F               [ 1] 1925 	ld a,xl 
      008C07 AB 07            [ 1] 1926 	add a,#7
      008C09 85               [ 2] 1927 3$:	popw x 
      008C0A 81               [ 4] 1928 	ret 
                                   1929 
      008C0B 61 62 74 6E 76 66 72  1930 escaped: .asciz "abtnvfr"
             00
                                   1931 
                                   1932 ;-------------------------
                                   1933 ; integer parser 
                                   1934 ; input:
                                   1935 ;   X 		point to output buffer  
                                   1936 ;   Y 		point to tib 
                                   1937 ;   A 	    first digit|'$' 
                                   1938 ; output:  
                                   1939 ;   X 		integer 
                                   1940 ;   A 		TK_INTGR
                                   1941 ;   acc24   24 bits integer 
                                   1942 ;-------------------------
                           000001  1943 	BASE=1
                           000002  1944 	TCHAR=2 
                           000003  1945 	XSAVE=3
                           000004  1946 	VSIZE=4 
      008C13                       1947 parse_integer: ; { -- n }
      008C13 89               [ 2] 1948 	pushw x 	
      008C14 4B 00            [ 1] 1949 	push #0 ; TCHAR
      008C16 4B 0A            [ 1] 1950 	push #10 ; BASE=10
      008C18 A1 24            [ 1] 1951 	cp a,#'$
      008C1A 26 04            [ 1] 1952 	jrne 2$ 
      000B9C                       1953     _drop #1
      008C1C 5B 01            [ 2]    1     addw sp,##1 
      008C1E 4B 10            [ 1] 1954 	push #16  ; BASE=16
      008C20 F7               [ 1] 1955 2$:	ld (x),a 
      008C21 5C               [ 1] 1956 	incw x 
      008C22 91 D6 01         [ 4] 1957 	ld a,([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008C25 72 5C 00 02      [ 1] 1958 	inc in 
      008C29 CD 8E A6         [ 4] 1959 	call to_upper 
      008C2C 6B 02            [ 1] 1960 	ld (TCHAR,sp),a 
      008C2E CD 86 61         [ 4] 1961 	call is_digit 
      008C31 25 ED            [ 1] 1962 	jrc 2$
      008C33 A6 10            [ 1] 1963 	ld a,#16 
      008C35 11 01            [ 1] 1964 	cp a,(BASE,sp)
      008C37 26 0A            [ 1] 1965 	jrne 3$ 
      008C39 7B 02            [ 1] 1966 	ld a,(TCHAR,sp)
      008C3B A1 41            [ 1] 1967 	cp a,#'A 
      008C3D 2B 04            [ 1] 1968 	jrmi 3$ 
      008C3F A1 47            [ 1] 1969 	cp a,#'G 
      008C41 2B DD            [ 1] 1970 	jrmi 2$ 
      008C43 72 5A 00 02      [ 1] 1971 3$: dec in 	
      008C47 7F               [ 1] 1972     clr (x)
      008C48 1E 03            [ 2] 1973 	ldw x,(XSAVE,sp)
      008C4A CD 8E B2         [ 4] 1974 	call atoi24
      008C4D 90 93            [ 1] 1975 	ldw y,x 
      008C4F CE 00 0D         [ 2] 1976 	ldw x,acc16 
      008C52 A6 84            [ 1] 1977 	ld a,#TK_INTGR
      008C54 90 FF            [ 2] 1978 	ldw (y),x 
      008C56 72 A9 00 02      [ 2] 1979 	addw y,#2
      000BDA                       1980 	_drop VSIZE  
      008C5A 5B 04            [ 2]    1     addw sp,#VSIZE 
      008C5C 81               [ 4] 1981 	ret 	
                                   1982 
                                   1983 ;-------------------------
                                   1984 ; binary integer parser
                                   1985 ; build integer in acc24  
                                   1986 ; input:
                                   1987 ;   X 		point to output buffer  
                                   1988 ;   Y 		point to tib 
                                   1989 ;   A 	    '&' 
                                   1990 ; output:  
                                   1991 ;   buffer  TK_INTGR integer  
                                   1992 ;   X 		int16 
                                   1993 ;   A 		TK_INTGR
                                   1994 ;   acc24    int24 
                                   1995 ;-------------------------
                           000001  1996 	BINARY=1 ; 24 bits integer 
                           000003  1997 	VSIZE=3
      008C5D                       1998 parse_binary: ; { -- n }
      008C5D 4B 00            [ 1] 1999 	push #0
      008C5F 4B 00            [ 1] 2000 	push #0
      008C61 4B 00            [ 1] 2001 	push #0
      008C63                       2002 2$:	
      008C63 91 D6 01         [ 4] 2003 	ld a,([in.w],y)
      008C66 72 5C 00 02      [ 1] 2004 	inc in 
      008C6A A1 30            [ 1] 2005 	cp a,#'0 
      008C6C 27 06            [ 1] 2006 	jreq 3$
      008C6E A1 31            [ 1] 2007 	cp a,#'1 
      008C70 27 02            [ 1] 2008 	jreq 3$ 
      008C72 20 0B            [ 2] 2009 	jra bin_exit 
      008C74 A0 30            [ 1] 2010 3$: sub a,#'0 
      008C76 46               [ 1] 2011 	rrc a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008C77 09 03            [ 1] 2012 	rlc (BINARY+2,sp) 
      008C79 09 02            [ 1] 2013 	rlc (BINARY+1,sp)
      008C7B 09 01            [ 1] 2014 	rlc (BINARY,sp) 
      008C7D 20 E4            [ 2] 2015 	jra 2$  
      008C7F                       2016 bin_exit:
      008C7F 72 5A 00 02      [ 1] 2017 	dec in 
      008C83 90 93            [ 1] 2018 	ldw y,x
      008C85 7B 01            [ 1] 2019 	ld a,(BINARY,sp)
      008C87 C7 00 0C         [ 1] 2020 	ld acc24,a 
      008C8A 1E 02            [ 2] 2021 	ldw x,(BINARY+1,sp)
      008C8C CF 00 0D         [ 2] 2022 	ldw acc16,x
      008C8F 90 FF            [ 2] 2023 	ldw (y),x 
      008C91 72 A9 00 02      [ 2] 2024 	addw y,#2  
      008C95 A6 84            [ 1] 2025 	ld a,#TK_INTGR 	
      000C17                       2026 	_drop VSIZE 
      008C97 5B 03            [ 2]    1     addw sp,#VSIZE 
      008C99 81               [ 4] 2027 	ret
                                   2028 
                                   2029 ;---------------------------
                                   2030 ;  token begin with a letter,
                                   2031 ;  is keyword or variable. 	
                                   2032 ; input:
                                   2033 ;   X 		point to pad 
                                   2034 ;   Y 		point to text
                                   2035 ;   A 	    first letter  
                                   2036 ; output:
                                   2037 ;   X		exec_addr|var_addr 
                                   2038 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   2039 ;   pad 	keyword|var_name  
                                   2040 ;--------------------------  
                           000001  2041 	XFIRST=1
                           000002  2042 	VSIZE=2
      008C9A                       2043 parse_keyword: 
      008C9A 89               [ 2] 2044 	pushw x 
      008C9B                       2045 kw_loop:	
      008C9B CD 8E A6         [ 4] 2046 	call to_upper 
      008C9E F7               [ 1] 2047 	ld (x),a 
      008C9F 5C               [ 1] 2048 	incw x 
      008CA0 91 D6 01         [ 4] 2049 	ld a,([in.w],y)
      008CA3 72 5C 00 02      [ 1] 2050 	inc in 
      008CA7 CD 86 50         [ 4] 2051 	call is_alpha 
      008CAA 25 EF            [ 1] 2052 	jrc kw_loop
      008CAC 72 5A 00 02      [ 1] 2053 	dec in   
      008CB0 7F               [ 1] 2054 1$: clr (x)
      008CB1 1E 01            [ 2] 2055 	ldw x,(XFIRST,sp) 
      008CB3 E6 01            [ 1] 2056 	ld a,(1,x)
      008CB5 26 13            [ 1] 2057 	jrne 2$
                                   2058 ; one letter variable name 
      008CB7 F6               [ 1] 2059 	ld a,(x) 
      008CB8 A0 41            [ 1] 2060 	sub a,#'A 
      008CBA 48               [ 1] 2061 	sll a 
      008CBB 88               [ 1] 2062 	push a 
      008CBC 4B 00            [ 1] 2063 	push #0
      008CBE AE 00 31         [ 2] 2064 	ldw x,#vars 
      008CC1 72 FB 01         [ 2] 2065 	addw x,(1,sp) ; X=var address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      000C44                       2066 	_drop 2 
      008CC4 5B 02            [ 2]    1     addw sp,#2 
      008CC6 A6 85            [ 1] 2067 	ld a,#TK_VAR 
      008CC8 20 0E            [ 2] 2068 	jra 4$ 
      008CCA                       2069 2$: ; check for keyword, otherwise syntax error.
      000C4A                       2070 	_ldx_dict kword_dict ; dictionary entry point
      008CCA AE A9 10         [ 2]    1     ldw x,#kword_dict+2
      008CCD 16 01            [ 2] 2071 	ldw y,(XFIRST,sp) ; name to search for
      008CCF CD 90 DE         [ 4] 2072 	call search_dict
      008CD2 4D               [ 1] 2073 	tnz a
      008CD3 26 03            [ 1] 2074 	jrne 4$ 
      008CD5 CC 89 65         [ 2] 2075 	jp syntax_error
      008CD8                       2076 4$:	
      008CD8 16 01            [ 2] 2077 	ldw y,(XFIRST,sp)
      008CDA 90 F7            [ 1] 2078 	ld (y),a 
      008CDC 90 5C            [ 1] 2079 	incw y 
      008CDE 90 FF            [ 2] 2080 	ldw (y),x
      008CE0 72 A9 00 02      [ 2] 2081 	addw y,#2  
      000C64                       2082 	_drop VSIZE 
      008CE4 5B 02            [ 2]    1     addw sp,#VSIZE 
      008CE6 81               [ 4] 2083 	ret  	
                                   2084 
                                   2085 
                                   2086 ;------------------------------------
                                   2087 ; scan text for next token
                                   2088 ; input: 
                                   2089 ;	X 		pointer to buffer where 
                                   2090 ;	        token id and value are copied 
                                   2091 ; use:
                                   2092 ;	Y   pointer to text in tib 
                                   2093 ; output:
                                   2094 ;   A       token attribute 
                                   2095 ;   X 		token value
                                   2096 ;   Y       updated position in output buffer   
                                   2097 ;------------------------------------
                                   2098 	; use to check special character 
                                   2099 	.macro _case c t  
                                   2100 	ld a,#c 
                                   2101 	cp a,(TCHAR,sp) 
                                   2102 	jrne t
                                   2103 	.endm 
                                   2104 
                           000001  2105 	TCHAR=1
                           000002  2106 	ATTRIB=2
                           000002  2107 	VSIZE=2
      008CE7                       2108 get_token: 
      000C67                       2109 	_vars VSIZE
      008CE7 52 02            [ 2]    1     sub sp,#VSIZE 
                                   2110 ;	ld a,in 
                                   2111 ;	sub a,count
                                   2112 ;   jrmi 0$
                                   2113 ;	clr a 
                                   2114 ;	ret 
      008CE9                       2115 0$: 
      008CE9 90 AE 16 90      [ 2] 2116 	ldw y,#tib    	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008CED A6 20            [ 1] 2117 	ld a,#SPACE
      008CEF CD 8F 1C         [ 4] 2118 	call skip
      008CF2 55 00 02 00 03   [ 1] 2119 	mov in.saved,in 
      008CF7 91 D6 01         [ 4] 2120 	ld a,([in.w],y)
      008CFA 26 05            [ 1] 2121 	jrne 1$
      008CFC 90 93            [ 1] 2122 	ldw y,x 
      008CFE CC 8E A3         [ 2] 2123 	jp token_exit ; end of line 
      008D01 72 5C 00 02      [ 1] 2124 1$:	inc in 
      008D05 CD 8E A6         [ 4] 2125 	call to_upper 
      008D08 6B 01            [ 1] 2126 	ld (TCHAR,sp),a 
                                   2127 ; check for quoted string
      008D0A                       2128 str_tst:  	
      000C8A                       2129 	_case '"' nbr_tst
      008D0A A6 22            [ 1]    1 	ld a,#'"' 
      008D0C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0E 26 0A            [ 1]    3 	jrne nbr_tst
      008D10 A6 02            [ 1] 2130 	ld a,#TK_QSTR
      008D12 F7               [ 1] 2131 	ld (x),a 
      008D13 5C               [ 1] 2132 	incw x 
      008D14 CD 8B BE         [ 4] 2133 	call parse_quote
      008D17 CC 8E A3         [ 2] 2134 	jp token_exit
      008D1A                       2135 nbr_tst:
                                   2136 ; check for hexadecimal number 
      008D1A A6 24            [ 1] 2137 	ld a,#'$'
      008D1C 11 01            [ 1] 2138 	cp a,(TCHAR,sp) 
      008D1E 27 17            [ 1] 2139 	jreq 1$
                                   2140 ;check for binary number 
      008D20 A6 26            [ 1] 2141 	ld a,#'&
      008D22 11 01            [ 1] 2142 	cp a,(TCHAR,sp)
      008D24 26 0A            [ 1] 2143 	jrne 0$
      008D26 A6 84            [ 1] 2144 	ld a,#TK_INTGR
      008D28 F7               [ 1] 2145 	ld (x),a 
      008D29 5C               [ 1] 2146 	incw x 
      008D2A CD 8C 5D         [ 4] 2147 	call parse_binary ; expect binary integer 
      008D2D CC 8E A3         [ 2] 2148 	jp token_exit 
                                   2149 ; check for decimal number 	
      008D30 7B 01            [ 1] 2150 0$:	ld a,(TCHAR,sp)
      008D32 CD 86 61         [ 4] 2151 	call is_digit
      008D35 24 0C            [ 1] 2152 	jrnc 3$
      008D37 A6 84            [ 1] 2153 1$:	ld a,#TK_INTGR 
      008D39 F7               [ 1] 2154 	ld (x),a 
      008D3A 5C               [ 1] 2155 	incw x 
      008D3B 7B 01            [ 1] 2156 	ld a,(TCHAR,sp)
      008D3D CD 8C 13         [ 4] 2157 	call parse_integer 
      008D40 CC 8E A3         [ 2] 2158 	jp token_exit 
      008D43                       2159 3$: 
      000CC3                       2160 	_case '(' bkslsh_tst 
      008D43 A6 28            [ 1]    1 	ld a,#'(' 
      008D45 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D47 26 05            [ 1]    3 	jrne bkslsh_tst
      008D49 A6 07            [ 1] 2161 	ld a,#TK_LPAREN
      008D4B CC 8E 9F         [ 2] 2162 	jp token_char   	
      008D4E                       2163 bkslsh_tst: ; character token 
      000CCE                       2164 	_case '\',rparnt_tst
      008D4E A6 5C            [ 1]    1 	ld a,#'\' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008D50 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D52 26 16            [ 1]    3 	jrne rparnt_tst
      008D54 A6 03            [ 1] 2165 	ld a,#TK_CHAR 
      008D56 F7               [ 1] 2166 	ld (x),a 
      008D57 5C               [ 1] 2167 	incw x 
      008D58 91 D6 01         [ 4] 2168 	ld a,([in.w],y)
      008D5B F7               [ 1] 2169 	ld (x),a 
      008D5C 5C               [ 1] 2170 	incw x
      008D5D 90 93            [ 1] 2171 	ldw y,x 	 
      008D5F 72 5C 00 02      [ 1] 2172 	inc in  
      008D63 5F               [ 1] 2173 	clrw x 
      008D64 97               [ 1] 2174 	ld xl,a 
      008D65 A6 03            [ 1] 2175 	ld a,#TK_CHAR 
      008D67 CC 8E A3         [ 2] 2176 	jp token_exit 
      008D6A                       2177 rparnt_tst:		
      000CEA                       2178 	_case ')' colon_tst 
      008D6A A6 29            [ 1]    1 	ld a,#')' 
      008D6C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D6E 26 05            [ 1]    3 	jrne colon_tst
      008D70 A6 08            [ 1] 2179 	ld a,#TK_RPAREN 
      008D72 CC 8E 9F         [ 2] 2180 	jp token_char
      008D75                       2181 colon_tst:
      000CF5                       2182 	_case ':' comma_tst 
      008D75 A6 3A            [ 1]    1 	ld a,#':' 
      008D77 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D79 26 05            [ 1]    3 	jrne comma_tst
      008D7B A6 01            [ 1] 2183 	ld a,#TK_COLON 
      008D7D CC 8E 9F         [ 2] 2184 	jp token_char  
      008D80                       2185 comma_tst:
      000D00                       2186 	_case COMMA sharp_tst 
      008D80 A6 2C            [ 1]    1 	ld a,#COMMA 
      008D82 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D84 26 05            [ 1]    3 	jrne sharp_tst
      008D86 A6 09            [ 1] 2187 	ld a,#TK_COMMA
      008D88 CC 8E 9F         [ 2] 2188 	jp token_char
      008D8B                       2189 sharp_tst:
      000D0B                       2190 	_case SHARP dash_tst 
      008D8B A6 23            [ 1]    1 	ld a,#SHARP 
      008D8D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D8F 26 05            [ 1]    3 	jrne dash_tst
      008D91 A6 0A            [ 1] 2191 	ld a,#TK_SHARP
      008D93 CC 8E 9F         [ 2] 2192 	jp token_char  	 	 
      008D96                       2193 dash_tst: 	
      000D16                       2194 	_case '-' at_tst 
      008D96 A6 2D            [ 1]    1 	ld a,#'-' 
      008D98 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D9A 26 05            [ 1]    3 	jrne at_tst
      008D9C A6 11            [ 1] 2195 	ld a,#TK_MINUS  
      008D9E CC 8E 9F         [ 2] 2196 	jp token_char 
      008DA1                       2197 at_tst:
      000D21                       2198 	_case '@' qmark_tst 
      008DA1 A6 40            [ 1]    1 	ld a,#'@' 
      008DA3 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA5 26 05            [ 1]    3 	jrne qmark_tst
      008DA7 A6 06            [ 1] 2199 	ld a,#TK_ARRAY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008DA9 CC 8E 9F         [ 2] 2200 	jp token_char
      008DAC                       2201 qmark_tst:
      000D2C                       2202 	_case '?' tick_tst 
      008DAC A6 3F            [ 1]    1 	ld a,#'?' 
      008DAE 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB0 26 12            [ 1]    3 	jrne tick_tst
      008DB2 A6 80            [ 1] 2203 	ld a,#TK_CMD  
      008DB4 F7               [ 1] 2204 	ld (x),a 
      008DB5 5C               [ 1] 2205 	incw x 
      008DB6 90 93            [ 1] 2206 	ldw y,x 
      008DB8 AE 00 74         [ 2] 2207 	ldw x,#PRT_IDX 
      008DBB 90 FF            [ 2] 2208 	ldw (y),x 
      008DBD 72 A9 00 02      [ 2] 2209 	addw y,#2
      008DC1 CC 8E A3         [ 2] 2210 	jp token_exit
      008DC4                       2211 tick_tst: ; comment 
      000D44                       2212 	_case TICK plus_tst 
      008DC4 A6 27            [ 1]    1 	ld a,#TICK 
      008DC6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC8 26 35            [ 1]    3 	jrne plus_tst
      008DCA A6 80            [ 1] 2213 	ld a,#TK_CMD
      008DCC F7               [ 1] 2214 	ld (x),a 
      008DCD 5C               [ 1] 2215 	incw x
      008DCE 90 AE 00 8E      [ 2] 2216 	ldw y,#REM_IDX
      008DD2 FF               [ 2] 2217 	ldw (x),y 
      008DD3 1C 00 02         [ 2] 2218 	addw x,#2  
      008DD6                       2219 copy_comment:
      008DD6 90 AE 16 90      [ 2] 2220 	ldw y,#tib 
      008DDA 72 B9 00 01      [ 2] 2221 	addw y,in.w
      008DDE 90 89            [ 2] 2222 	pushw y
      008DE0 CD 84 91         [ 4] 2223 	call strcpy
      008DE3 72 F2 01         [ 2] 2224     subw y,(1,sp)
      008DE6 90 9F            [ 1] 2225 	ld a,yl 
      008DE8 CB 00 02         [ 1] 2226 	add a,in
      008DEB C7 00 02         [ 1] 2227 	ld in,a 
      008DEE 1F 01            [ 2] 2228 	ldw (1,sp),x
      008DF0 72 F9 01         [ 2] 2229 	addw y,(1,sp)
      008DF3 90 5C            [ 1] 2230 	incw y 
      000D75                       2231 	_drop 2 
      008DF5 5B 02            [ 2]    1     addw sp,#2 
      008DF7 AE 00 8E         [ 2] 2232 	ldw x,#REM_IDX 
      008DFA A6 80            [ 1] 2233 	ld a,#TK_CMD 
      008DFC CC 8E A3         [ 2] 2234 	jp token_exit 
      008DFF                       2235 plus_tst:
      000D7F                       2236 	_case '+' star_tst 
      008DFF A6 2B            [ 1]    1 	ld a,#'+' 
      008E01 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E03 26 05            [ 1]    3 	jrne star_tst
      008E05 A6 10            [ 1] 2237 	ld a,#TK_PLUS  
      008E07 CC 8E 9F         [ 2] 2238 	jp token_char 
      008E0A                       2239 star_tst:
      000D8A                       2240 	_case '*' slash_tst 
      008E0A A6 2A            [ 1]    1 	ld a,#'*' 
      008E0C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E0E 26 05            [ 1]    3 	jrne slash_tst
      008E10 A6 20            [ 1] 2241 	ld a,#TK_MULT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008E12 CC 8E 9F         [ 2] 2242 	jp token_char 
      008E15                       2243 slash_tst: 
      000D95                       2244 	_case '/' prcnt_tst 
      008E15 A6 2F            [ 1]    1 	ld a,#'/' 
      008E17 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E19 26 05            [ 1]    3 	jrne prcnt_tst
      008E1B A6 21            [ 1] 2245 	ld a,#TK_DIV 
      008E1D CC 8E 9F         [ 2] 2246 	jp token_char 
      008E20                       2247 prcnt_tst:
      000DA0                       2248 	_case '%' eql_tst 
      008E20 A6 25            [ 1]    1 	ld a,#'%' 
      008E22 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E24 26 05            [ 1]    3 	jrne eql_tst
      008E26 A6 22            [ 1] 2249 	ld a,#TK_MOD
      008E28 CC 8E 9F         [ 2] 2250 	jp token_char  
                                   2251 ; 1 or 2 character tokens 	
      008E2B                       2252 eql_tst:
      000DAB                       2253 	_case '=' gt_tst 		
      008E2B A6 3D            [ 1]    1 	ld a,#'=' 
      008E2D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E2F 26 05            [ 1]    3 	jrne gt_tst
      008E31 A6 32            [ 1] 2254 	ld a,#TK_EQUAL
      008E33 CC 8E 9F         [ 2] 2255 	jp token_char 
      008E36                       2256 gt_tst:
      000DB6                       2257 	_case '>' lt_tst 
      008E36 A6 3E            [ 1]    1 	ld a,#'>' 
      008E38 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E3A 26 23            [ 1]    3 	jrne lt_tst
      008E3C A6 31            [ 1] 2258 	ld a,#TK_GT 
      008E3E 6B 02            [ 1] 2259 	ld (ATTRIB,sp),a 
      008E40 91 D6 01         [ 4] 2260 	ld a,([in.w],y)
      008E43 72 5C 00 02      [ 1] 2261 	inc in 
      008E47 A1 3D            [ 1] 2262 	cp a,#'=
      008E49 26 04            [ 1] 2263 	jrne 1$
      008E4B A6 33            [ 1] 2264 	ld a,#TK_GE 
      008E4D 20 50            [ 2] 2265 	jra token_char  
      008E4F A1 3C            [ 1] 2266 1$: cp a,#'<
      008E51 26 04            [ 1] 2267 	jrne 2$
      008E53 A6 35            [ 1] 2268 	ld a,#TK_NE 
      008E55 20 48            [ 2] 2269 	jra token_char 
      008E57 72 5A 00 02      [ 1] 2270 2$: dec in
      008E5B 7B 02            [ 1] 2271 	ld a,(ATTRIB,sp)
      008E5D 20 40            [ 2] 2272 	jra token_char 	 
      008E5F                       2273 lt_tst:
      000DDF                       2274 	_case '<' other
      008E5F A6 3C            [ 1]    1 	ld a,#'<' 
      008E61 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E63 26 23            [ 1]    3 	jrne other
      008E65 A6 34            [ 1] 2275 	ld a,#TK_LT 
      008E67 6B 02            [ 1] 2276 	ld (ATTRIB,sp),a 
      008E69 91 D6 01         [ 4] 2277 	ld a,([in.w],y)
      008E6C 72 5C 00 02      [ 1] 2278 	inc in 
      008E70 A1 3D            [ 1] 2279 	cp a,#'=
      008E72 26 04            [ 1] 2280 	jrne 1$
      008E74 A6 36            [ 1] 2281 	ld a,#TK_LE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008E76 20 27            [ 2] 2282 	jra token_char 
      008E78 A1 3E            [ 1] 2283 1$: cp a,#'>
      008E7A 26 04            [ 1] 2284 	jrne 2$
      008E7C A6 35            [ 1] 2285 	ld a,#TK_NE 
      008E7E 20 1F            [ 2] 2286 	jra token_char 
      008E80 72 5A 00 02      [ 1] 2287 2$: dec in 
      008E84 7B 02            [ 1] 2288 	ld a,(ATTRIB,sp)
      008E86 20 17            [ 2] 2289 	jra token_char 	
      008E88                       2290 other: ; not a special character 	 
      008E88 7B 01            [ 1] 2291 	ld a,(TCHAR,sp)
      008E8A CD 86 50         [ 4] 2292 	call is_alpha 
      008E8D 25 03            [ 1] 2293 	jrc 30$ 
      008E8F CC 89 65         [ 2] 2294 	jp syntax_error 
      008E92                       2295 30$: 
      008E92 CD 8C 9A         [ 4] 2296 	call parse_keyword
      008E95 A3 97 1B         [ 2] 2297 	cpw x,#remark 
      008E98 26 09            [ 1] 2298 	jrne token_exit 
      008E9A 90 93            [ 1] 2299 	ldw y,x 
      008E9C CC 8D D6         [ 2] 2300 	jp copy_comment 
      008E9F                       2301 token_char:
      008E9F F7               [ 1] 2302 	ld (x),a 
      008EA0 5C               [ 1] 2303 	incw x
      008EA1 90 93            [ 1] 2304 	ldw y,x 
      008EA3                       2305 token_exit:
      000E23                       2306 	_drop VSIZE 
      008EA3 5B 02            [ 2]    1     addw sp,#VSIZE 
      008EA5 81               [ 4] 2307 	ret
                                   2308 
                                   2309 
                                   2310 ;------------------------------------
                                   2311 ; convert alpha to uppercase
                                   2312 ; input:
                                   2313 ;    a  character to convert
                                   2314 ; output:
                                   2315 ;    a  uppercase character
                                   2316 ;------------------------------------
      008EA6                       2317 to_upper::
      008EA6 A1 61            [ 1] 2318 	cp a,#'a
      008EA8 2A 01            [ 1] 2319 	jrpl 1$
      008EAA 81               [ 4] 2320 0$:	ret
      008EAB A1 7A            [ 1] 2321 1$: cp a,#'z	
      008EAD 22 FB            [ 1] 2322 	jrugt 0$
      008EAF A0 20            [ 1] 2323 	sub a,#32
      008EB1 81               [ 4] 2324 	ret
                                   2325 	
                                   2326 ;------------------------------------
                                   2327 ; convert pad content in integer
                                   2328 ; input:
                                   2329 ;    x		.asciz to convert
                                   2330 ; output:
                                   2331 ;    acc24      int24_t
                                   2332 ;------------------------------------
                                   2333 	; local variables
                           000001  2334 	SIGN=1 ; 1 byte, 
                           000002  2335 	BASE=2 ; 1 byte, numeric base used in conversion
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                           000003  2336 	TEMP=3 ; 1 byte, temporary storage
                           000003  2337 	VSIZE=3 ; 3 bytes reserved for local storage
      008EB2                       2338 atoi24::
      008EB2 89               [ 2] 2339 	pushw x 
      000E33                       2340 	_vars VSIZE
      008EB3 52 03            [ 2]    1     sub sp,#VSIZE 
                                   2341 	; acc24=0 
      008EB5 72 5F 00 0C      [ 1] 2342 	clr acc24    
      008EB9 72 5F 00 0D      [ 1] 2343 	clr acc16
      008EBD 72 5F 00 0E      [ 1] 2344 	clr acc8 
      008EC1 0F 01            [ 1] 2345 	clr (SIGN,sp)
      008EC3 A6 0A            [ 1] 2346 	ld a,#10
      008EC5 6B 02            [ 1] 2347 	ld (BASE,sp),a ; default base decimal
      008EC7 F6               [ 1] 2348 	ld a,(x)
      008EC8 27 47            [ 1] 2349 	jreq 9$  ; completed if 0
      008ECA A1 2D            [ 1] 2350 	cp a,#'-
      008ECC 26 04            [ 1] 2351 	jrne 1$
      008ECE 03 01            [ 1] 2352 	cpl (SIGN,sp)
      008ED0 20 08            [ 2] 2353 	jra 2$
      008ED2 A1 24            [ 1] 2354 1$: cp a,#'$
      008ED4 26 06            [ 1] 2355 	jrne 3$
      008ED6 A6 10            [ 1] 2356 	ld a,#16
      008ED8 6B 02            [ 1] 2357 	ld (BASE,sp),a
      008EDA 5C               [ 1] 2358 2$:	incw x
      008EDB F6               [ 1] 2359 	ld a,(x)
      008EDC                       2360 3$:	
      008EDC A1 61            [ 1] 2361 	cp a,#'a
      008EDE 2B 02            [ 1] 2362 	jrmi 4$
      008EE0 A0 20            [ 1] 2363 	sub a,#32
      008EE2 A1 30            [ 1] 2364 4$:	cp a,#'0
      008EE4 2B 2B            [ 1] 2365 	jrmi 9$
      008EE6 A0 30            [ 1] 2366 	sub a,#'0
      008EE8 A1 0A            [ 1] 2367 	cp a,#10
      008EEA 2B 06            [ 1] 2368 	jrmi 5$
      008EEC A0 07            [ 1] 2369 	sub a,#7
      008EEE 11 02            [ 1] 2370 	cp a,(BASE,sp)
      008EF0 2A 1F            [ 1] 2371 	jrpl 9$
      008EF2 6B 03            [ 1] 2372 5$:	ld (TEMP,sp),a
      008EF4 7B 02            [ 1] 2373 	ld a,(BASE,sp)
      008EF6 CD 8B 61         [ 4] 2374 	call mulu24_8
      008EF9 7B 03            [ 1] 2375 	ld a,(TEMP,sp)
      008EFB CB 00 0E         [ 1] 2376 	add a,acc24+2
      008EFE C7 00 0E         [ 1] 2377 	ld acc24+2,a
      008F01 4F               [ 1] 2378 	clr a
      008F02 C9 00 0D         [ 1] 2379 	adc a,acc24+1
      008F05 C7 00 0D         [ 1] 2380 	ld acc24+1,a
      008F08 4F               [ 1] 2381 	clr a
      008F09 C9 00 0C         [ 1] 2382 	adc a,acc24
      008F0C C7 00 0C         [ 1] 2383 	ld acc24,a
      008F0F 20 C9            [ 2] 2384 	jra 2$
      008F11 0D 01            [ 1] 2385 9$:	tnz (SIGN,sp)
      008F13 27 03            [ 1] 2386     jreq atoi_exit
      008F15 CD 8B 9B         [ 4] 2387     call neg_acc24
      008F18                       2388 atoi_exit: 
      000E98                       2389 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008F18 5B 03            [ 2]    1     addw sp,#VSIZE 
      008F1A 85               [ 2] 2390 	popw x ; restore x
      008F1B 81               [ 4] 2391 	ret
                                   2392 
                                   2393 
                                   2394 ;------------------------------------
                                   2395 ; skip character c in text starting from 'in'
                                   2396 ; input:
                                   2397 ;	 y 		point to text buffer
                                   2398 ;    a 		character to skip
                                   2399 ; output:  
                                   2400 ;	'in' ajusted to new position
                                   2401 ;------------------------------------
                           000001  2402 	C = 1 ; local var
      008F1C                       2403 skip:
      008F1C 88               [ 1] 2404 	push a
      008F1D 91 D6 01         [ 4] 2405 1$:	ld a,([in.w],y)
      008F20 27 0A            [ 1] 2406 	jreq 2$
      008F22 11 01            [ 1] 2407 	cp a,(C,sp)
      008F24 26 06            [ 1] 2408 	jrne 2$
      008F26 72 5C 00 02      [ 1] 2409 	inc in
      008F2A 20 F1            [ 2] 2410 	jra 1$
      000EAC                       2411 2$: _drop 1 
      008F2C 5B 01            [ 2]    1     addw sp,#1 
      008F2E 81               [ 4] 2412 	ret
                                   2413 	
                                   2414 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2415 ;;   TINY BASIC  operators,
                                   2416 ;;   commands and functions 
                                   2417 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2418 
                                   2419 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2420 ;;  Arithmetic operators
                                   2421 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2422 
                                   2423 ;debug support
                           000001  2424 DEBUG_PRT=1
                           000001  2425 .if DEBUG_PRT 
                           000001  2426 	REGA=1
                           000002  2427 	SAVEB=2
                           000003  2428 	REGX=3
                           000005  2429 	REGY=5
                           000007  2430 	ACC24=7
                           000009  2431 	VSIZE=9 
      008F2F                       2432 printxy:
      000EAF                       2433 	_vars VSIZE 
      008F2F 52 09            [ 2]    1     sub sp,#VSIZE 
      008F31 6B 01            [ 1] 2434 	ld (REGA,sp),a 
      008F33 C6 00 0B         [ 1] 2435 	ld a,base 
      008F36 6B 02            [ 1] 2436 	ld (SAVEB,sp),a
      008F38 1F 03            [ 2] 2437 	ldw (REGX,sp),x
      008F3A 17 05            [ 2] 2438 	ldw (REGY,sp),y
      008F3C CE 00 0C         [ 2] 2439 	ldw x,acc24 
      008F3F C6 00 0E         [ 1] 2440 	ld a,acc8 
      008F42 1F 07            [ 2] 2441 	ldw (ACC24,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008F44 6B 09            [ 1] 2442 	ld (ACC24+2,sp),a 
      008F46 35 10 00 0B      [ 1] 2443 	mov base,#16 
      008F4A 5F               [ 1] 2444 	clrw x 
      008F4B 7B 01            [ 1] 2445 	ld a,(REGA,sp)
      008F4D 97               [ 1] 2446 	ld xl,a 
      008F4E CD 8A B8         [ 4] 2447 	call print_int
      008F51 A6 20            [ 1] 2448 	ld a,#SPACE 
      008F53 CD 83 8A         [ 4] 2449 	call putc  
      008F56 1E 03            [ 2] 2450 	ldw x,(REGX,sp)
      008F58 CD 8A B8         [ 4] 2451 	call print_int 
      008F5B A6 20            [ 1] 2452 	ld a,#SPACE 
      008F5D CD 83 8A         [ 4] 2453 	call putc  
      008F60 1E 05            [ 2] 2454 	ldw x,(REGY,sp)
      008F62 CD 8A B8         [ 4] 2455 	call print_int 
      008F65 A6 0D            [ 1] 2456 	ld a,#CR 
      008F67 CD 83 8A         [ 4] 2457 	call putc 
      008F6A 7B 09            [ 1] 2458 	ld a,(ACC24+2,sp)
      008F6C 1E 07            [ 2] 2459 	ldw x,(ACC24,sp)
      008F6E CF 00 0C         [ 2] 2460 	ldw acc24,x 
      008F71 C7 00 0E         [ 1] 2461 	ld acc8,a
      008F74 7B 02            [ 1] 2462 	ld a,(SAVEB,sp)
      008F76 C7 00 0B         [ 1] 2463 	ld base,a 
      008F79 7B 01            [ 1] 2464 	ld a,(REGA,sp)
      008F7B 1E 03            [ 2] 2465 	ldw x,(REGX,sp)
      008F7D 16 05            [ 2] 2466 	ldw y,(REGY,sp)
      000EFF                       2467 	_drop VSIZE 
      008F7F 5B 09            [ 2]    1     addw sp,#VSIZE 
      008F81 81               [ 4] 2468 	ret 
                                   2469 .endif 
                                   2470 
                                   2471 
                                   2472 ;--------------------------------------
                                   2473 ;  multiply 2 uint16_t return uint32_t
                                   2474 ;  input:
                                   2475 ;     x       uint16_t 
                                   2476 ;     y       uint16_t 
                                   2477 ;  output:
                                   2478 ;     x       product bits 15..0
                                   2479 ;     y       product bits 31..16 
                                   2480 ;---------------------------------------
                           000001  2481 		U1=1  ; uint16_t 
                           000003  2482 		DBL=3 ; uint32_t
                           000006  2483 		VSIZE=6
      008F82                       2484 umstar:
      000F02                       2485 	_vars VSIZE 
      008F82 52 06            [ 2]    1     sub sp,#VSIZE 
      008F84 1F 01            [ 2] 2486 	ldw (U1,sp),x 
                                   2487 ;initialize bits 31..16 of 
                                   2488 ;product to zero 
      008F86 0F 03            [ 1] 2489 	clr (DBL,sp)
      008F88 0F 04            [ 1] 2490 	clr (DBL+1,sp)
                                   2491 ; produc U1L*U2L 
      008F8A 90 9F            [ 1] 2492 	ld a,yl 
      008F8C 42               [ 4] 2493 	mul x,a 
      008F8D 1F 05            [ 2] 2494 	ldw (DBL+2,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2495 ; product U1H*U2L 
      008F8F 7B 01            [ 1] 2496 	ld a,(U1,sp) ; xh 
      008F91 93               [ 1] 2497 	ldw x,y
      008F92 42               [ 4] 2498 	mul x,a 
      008F93 4F               [ 1] 2499 	clr a 
      008F94 72 FB 04         [ 2] 2500 	addw x,(DBL+1,sp) 
      008F97 4F               [ 1] 2501 	clr a 
      008F98 19 03            [ 1] 2502 	adc a,(DBL,sp) 
      008F9A 6B 03            [ 1] 2503 	ld (DBL,sp),a ; bits 23..17 
      008F9C 1F 04            [ 2] 2504 	ldw (DBL+1,sp),x ; bits 15..0 
                                   2505 ; product U1L*U2H
      008F9E 90 5E            [ 1] 2506 	swapw y 
      008FA0 93               [ 1] 2507 	ldw x,y
      008FA1 7B 02            [ 1] 2508 	ld a,(U1+1,sp)
      008FA3 42               [ 4] 2509 	mul x,a
      008FA4 72 FB 04         [ 2] 2510 	addw x,(DBL+1,sp)
      008FA7 4F               [ 1] 2511 	clr a 
      008FA8 19 03            [ 1] 2512 	adc a,(DBL,sp)
      008FAA 6B 03            [ 1] 2513 	ld (DBL,sp),a 
      008FAC 1F 04            [ 2] 2514 	ldw (DBL+1,sp),x 
                                   2515 ; product U1H*U2H 	
      008FAE 7B 01            [ 1] 2516 	ld a,(U1,sp)
      008FB0 93               [ 1] 2517 	ldw x,y  
      008FB1 42               [ 4] 2518 	mul x,a 
      008FB2 72 FB 03         [ 2] 2519 	addw x,(DBL,sp)
      008FB5 90 93            [ 1] 2520 	ldw y,x 
      008FB7 1E 05            [ 2] 2521 	ldw x,(DBL+2,sp)
      000F39                       2522 	_drop VSIZE 
      008FB9 5B 06            [ 2]    1     addw sp,#VSIZE 
      008FBB 81               [ 4] 2523 	ret
                                   2524 
                                   2525 
                                   2526 ;-------------------------------------
                                   2527 ; multiply 2 integers
                                   2528 ; input:
                                   2529 ;  	x       n1 
                                   2530 ;   y 		n2 
                                   2531 ; output:
                                   2532 ;	X        N1*N2 bits 15..0
                                   2533 ;   Y        N1*N2 bits 31..16 
                                   2534 ;-------------------------------------
                           000001  2535 	SIGN=1
                           000001  2536 	VSIZE=1
      008FBC                       2537 multiply:
      000F3C                       2538 	_vars VSIZE 
      008FBC 52 01            [ 2]    1     sub sp,#VSIZE 
      008FBE 0F 01            [ 1] 2539 	clr (SIGN,sp)
      008FC0 9E               [ 1] 2540 	ld a,xh 
      008FC1 A4 80            [ 1] 2541 	and a,#0x80
      008FC3 2A 03            [ 1] 2542 	jrpl 1$
      008FC5 03 01            [ 1] 2543 	cpl (SIGN,sp)
      008FC7 50               [ 2] 2544 	negw x 
      008FC8                       2545 1$:	
      008FC8 90 9E            [ 1] 2546 	ld a,yh
      008FCA A4 80            [ 1] 2547 	and a,#0x80  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008FCC 2A 04            [ 1] 2548 	jrpl 2$ 
      008FCE 03 01            [ 1] 2549 	cpl (SIGN,sp)
      008FD0 90 50            [ 2] 2550 	negw y 
      008FD2                       2551 2$:	
      008FD2 CD 8F 82         [ 4] 2552 	call umstar
      008FD5 7B 01            [ 1] 2553 	ld a,(SIGN,sp)
      008FD7 27 03            [ 1] 2554 	jreq 3$
      008FD9 CD 90 09         [ 4] 2555 	call dneg 
      008FDC                       2556 3$:	
      000F5C                       2557 	_drop VSIZE 
      008FDC 5B 01            [ 2]    1     addw sp,#VSIZE 
      008FDE 81               [ 4] 2558 	ret
                                   2559 
                                   2560 ;--------------------------------------
                                   2561 ; divide uint32_t/uint16_t
                                   2562 ; return:  quotient and remainder 
                                   2563 ; quotient expected to be uint16_t 
                                   2564 ; input:
                                   2565 ;   DBLDIVDND    on stack 
                                   2566 ;   X            divisor 
                                   2567 ; output:
                                   2568 ;   X            quotient 
                                   2569 ;   Y            remainder 
                                   2570 ;---------------------------------------
                           000003  2571 	VSIZE=3
      008FDF                       2572 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000F5F                       2573 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   2574 	; local variables 
                           000001  2575 	DIVISOR=1 
                           000003  2576 	CNTR=3 
      000F5F                       2577 udiv32_16:
      000F5F                       2578 	_vars VSIZE 
      008FDF 52 03            [ 2]    1     sub sp,#VSIZE 
      008FE1 1F 01            [ 2] 2579 	ldw (DIVISOR,sp),x	; save divisor 
      008FE3 1E 08            [ 2] 2580 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008FE5 16 06            [ 2] 2581 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008FE7 90 5D            [ 2] 2582 	tnzw y
      008FE9 26 06            [ 1] 2583 	jrne long_division 
      008FEB 16 01            [ 2] 2584 	ldw y,(DIVISOR,sp)
      008FED 65               [ 2] 2585 	divw x,y
      000F6E                       2586 	_drop VSIZE 
      008FEE 5B 03            [ 2]    1     addw sp,#VSIZE 
      008FF0 81               [ 4] 2587 	ret
      008FF1                       2588 long_division:
      008FF1 51               [ 1] 2589 	exgw x,y ; hi in x, lo in y 
      008FF2 A6 11            [ 1] 2590 	ld a,#17 
      008FF4 6B 03            [ 1] 2591 	ld (CNTR,sp),a
      008FF6                       2592 1$:
      008FF6 13 01            [ 2] 2593 	cpw x,(DIVISOR,sp)
      008FF8 2B 03            [ 1] 2594 	jrmi 2$
      008FFA 72 F0 01         [ 2] 2595 	subw x,(DIVISOR,sp)
      008FFD 8C               [ 1] 2596 2$:	ccf 
      008FFE 90 59            [ 2] 2597 	rlcw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      009000 59               [ 2] 2598 	rlcw x 
      009001 0A 03            [ 1] 2599 	dec (CNTR,sp)
      009003 26 F1            [ 1] 2600 	jrne 1$
      009005 51               [ 1] 2601 	exgw x,y 
      000F86                       2602 	_drop VSIZE 
      009006 5B 03            [ 2]    1     addw sp,#VSIZE 
      009008 81               [ 4] 2603 	ret
                                   2604 
                                   2605 ;-----------------------------
                                   2606 ; negate double int.
                                   2607 ; input:
                                   2608 ;   x     bits 15..0
                                   2609 ;   y     bits 31..16
                                   2610 ; output: 
                                   2611 ;   x     bits 15..0
                                   2612 ;   y     bits 31..16
                                   2613 ;-----------------------------
      009009                       2614 dneg:
      009009 53               [ 2] 2615 	cplw x 
      00900A 90 53            [ 2] 2616 	cplw y 
      00900C 1C 00 01         [ 2] 2617 	addw x,#1 
      00900F 24 02            [ 1] 2618 	jrnc 1$
      009011 90 5C            [ 1] 2619 	incw y 
      009013 81               [ 4] 2620 1$: ret 
                                   2621 
                                   2622 
                                   2623 ;--------------------------------
                                   2624 ; sign extend single to double
                                   2625 ; input:
                                   2626 ;   x    int16_t
                                   2627 ; output:
                                   2628 ;   x    int32_t bits 15..0
                                   2629 ;   y    int32_t bits 31..16
                                   2630 ;--------------------------------
      009014                       2631 dbl_sign_extend:
      009014 90 5F            [ 1] 2632 	clrw y
      009016 9E               [ 1] 2633 	ld a,xh 
      009017 A4 80            [ 1] 2634 	and a,#0x80 
      009019 27 02            [ 1] 2635 	jreq 1$
      00901B 90 53            [ 2] 2636 	cplw y
      00901D 81               [ 4] 2637 1$: ret 	
                                   2638 
                                   2639 
                                   2640 ;----------------------------------
                                   2641 ;  euclidian divide dbl/n1 
                                   2642 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   2643 ; input:
                                   2644 ;    dbl    int32_t on stack 
                                   2645 ;    x 		n1   int16_t  disivor  
                                   2646 ; output:
                                   2647 ;    X      dbl/x  int16_t 
                                   2648 ;    Y      remainder int16_t 
                                   2649 ;----------------------------------
                           000008  2650 	VSIZE=8
      00901E                       2651 	_argofs VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                           00000A     1     ARG_OFS=2+VSIZE 
      000F9E                       2652 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000F9E                       2653 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   2654 	; local variables
                           000001  2655 	DBLHI=1
                           000003  2656 	DBLLO=3 
                           000005  2657 	SDIVSR=5 ; sign divisor
                           000006  2658 	SQUOT=6 ; sign dividend 
                           000007  2659 	DIVISR=7 ; divisor 
      000F9E                       2660 div32_16:
      000F9E                       2661 	_vars VSIZE 
      00901E 52 08            [ 2]    1     sub sp,#VSIZE 
      009020 0F 05            [ 1] 2662 	clr (SDIVSR,sp)
      009022 0F 06            [ 1] 2663 	clr (SQUOT,sp)
                                   2664 ; copy arguments 
      009024 16 0B            [ 2] 2665 	ldw y,(DIVDNDHI,sp)
      009026 17 01            [ 2] 2666 	ldw (DBLHI,sp),y
      009028 16 0D            [ 2] 2667 	ldw y,(DIVDNDLO,sp)
      00902A 17 03            [ 2] 2668 	ldw (DBLLO,sp),y 
                                   2669 ; check for 0 divisor
      00902C 5D               [ 2] 2670 	tnzw x 
      00902D 26 05            [ 1] 2671     jrne 0$
      00902F A6 04            [ 1] 2672 	ld a,#ERR_DIV0 
      009031 CC 89 67         [ 2] 2673 	jp tb_error 
                                   2674 ; check divisor sign 	
      009034 9E               [ 1] 2675 0$:	ld a,xh 
      009035 A4 80            [ 1] 2676 	and a,#0x80 
      009037 27 05            [ 1] 2677 	jreq 1$
      009039 03 05            [ 1] 2678 	cpl (SDIVSR,sp)
      00903B 03 06            [ 1] 2679 	cpl (SQUOT,sp)
      00903D 50               [ 2] 2680 	negw x
      00903E 1F 07            [ 2] 2681 1$:	ldw (DIVISR,sp),x
                                   2682 ; check dividend sign 	 
      009040 7B 01            [ 1] 2683  	ld a,(DBLHI,sp) 
      009042 A4 80            [ 1] 2684 	and a,#0x80 
      009044 27 0D            [ 1] 2685 	jreq 2$ 
      009046 03 06            [ 1] 2686 	cpl (SQUOT,sp)
      009048 1E 03            [ 2] 2687 	ldw x,(DBLLO,sp)
      00904A 16 01            [ 2] 2688 	ldw y,(DBLHI,sp)
      00904C CD 90 09         [ 4] 2689 	call dneg 
      00904F 1F 03            [ 2] 2690 	ldw (DBLLO,sp),x 
      009051 17 01            [ 2] 2691 	ldw (DBLHI,sp),y 
      009053 1E 07            [ 2] 2692 2$:	ldw x,(DIVISR,sp)
      009055 CD 8F DF         [ 4] 2693 	call udiv32_16
      009058 90 5D            [ 2] 2694 	tnzw y 
      00905A 27 11            [ 1] 2695 	jreq 3$ 
                                   2696 ; x=quotient 
                                   2697 ; y=remainder 
                                   2698 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      00905C 7B 06            [ 1] 2699 	ld a,(SQUOT,sp)
      00905E 18 05            [ 1] 2700 	xor a,(SDIVSR,sp)
      009060 27 0B            [ 1] 2701 	jreq 3$
      009062 5C               [ 1] 2702 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      009063 90 CF 00 0D      [ 2] 2703 	ldw acc16,y 
      009067 16 07            [ 2] 2704 	ldw y,(DIVISR,sp)
      009069 72 B2 00 0D      [ 2] 2705 	subw y,acc16
                                   2706 ; sign quotient
      00906D 7B 06            [ 1] 2707 3$:	ld a,(SQUOT,sp)
      00906F 27 01            [ 1] 2708 	jreq 4$
      009071 50               [ 2] 2709 	negw x 
      009072                       2710 4$:	
      000FF2                       2711 	_drop VSIZE 
      009072 5B 08            [ 2]    1     addw sp,#VSIZE 
      009074 81               [ 4] 2712 	ret 
                                   2713 
                                   2714 
                                   2715 
                                   2716 ;----------------------------------
                                   2717 ; division x/y 
                                   2718 ; input:
                                   2719 ;    X       dividend
                                   2720 ;    Y       divisor 
                                   2721 ; output:
                                   2722 ;    X       quotient
                                   2723 ;    Y       remainder 
                                   2724 ;-----------------------------------
                           000004  2725 	VSIZE=4 
                                   2726 	; local variables 
                           000001  2727 	DBLHI=1
                           000003  2728 	DBLLO=3
      009075                       2729 divide: 
      000FF5                       2730 	_vars VSIZE 
      009075 52 04            [ 2]    1     sub sp,#VSIZE 
      009077 90 CF 00 0D      [ 2] 2731 	ldw acc16,y
      00907B CD 90 14         [ 4] 2732 	call dbl_sign_extend
      00907E 1F 03            [ 2] 2733 	ldw (DBLLO,sp),x 
      009080 17 01            [ 2] 2734 	ldw (DBLHI,sp),y 
      009082 CE 00 0D         [ 2] 2735 	ldw x,acc16 
      009085 CD 90 1E         [ 4] 2736 	call div32_16 
      001008                       2737 	_drop VSIZE 
      009088 5B 04            [ 2]    1     addw sp,#VSIZE 
      00908A 81               [ 4] 2738 	ret
                                   2739 
                                   2740 
                                   2741 ;----------------------------------
                                   2742 ;  remainder resulting from euclidian 
                                   2743 ;  division of x/y 
                                   2744 ; input:
                                   2745 ;   x   	dividend int16_t 
                                   2746 ;   y 		divisor int16_t
                                   2747 ; output:
                                   2748 ;   X       n1%n2 
                                   2749 ;----------------------------------
      00908B                       2750 modulo:
      00908B CD 90 75         [ 4] 2751 	call divide
      00908E 93               [ 1] 2752 	ldw x,y 
      00908F 81               [ 4] 2753 	ret 
                                   2754 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2755 ;----------------------------------
                                   2756 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2757 ; return expr1*expr2/expr3 
                                   2758 ; product result is int32_t and 
                                   2759 ; divisiont is int32_t/int16_t
                                   2760 ;----------------------------------
                           000004  2761 	DBL_SIZE=4 
      009090                       2762 muldiv:
      009090 CD 91 38         [ 4] 2763 	call func_args 
      009093 A1 03            [ 1] 2764 	cp a,#3 
      009095 27 03            [ 1] 2765 	jreq 1$
      009097 CC 89 65         [ 2] 2766 	jp syntax_error
      00909A                       2767 1$: 
      00909A 1E 05            [ 2] 2768 	ldw x,(5,sp) ; expr1
      00909C 16 03            [ 2] 2769 	ldw y,(3,sp) ; expr2
      00909E CD 8F BC         [ 4] 2770 	call multiply 
      0090A1 1F 05            [ 2] 2771 	ldw (5,sp),x  ;int32_t 15..0
      0090A3 17 03            [ 2] 2772 	ldw (3,sp),y  ;int32_t 31..16
      0090A5 85               [ 2] 2773 	popw x        ; expr3 
      0090A6 CD 90 1E         [ 4] 2774 	call div32_16 ; int32_t/expr3 
      001029                       2775 	_drop DBL_SIZE
      0090A9 5B 04            [ 2]    1     addw sp,#DBL_SIZE 
      0090AB 81               [ 4] 2776 	ret 
                                   2777 
                                   2778 
                                   2779 ;----------------------------------
                                   2780 ; search in kword_dict name
                                   2781 ; from its execution address 
                                   2782 ; input:
                                   2783 ;   X       	cmd_index 
                                   2784 ; output:
                                   2785 ;   X 			cstr*  | 0 
                                   2786 ;--------------------------------
                           000001  2787 	CMDX=1 
                           000003  2788 	LINK=3 
                           000004  2789 	VSIZE=4
      0090AC                       2790 cmd_name:
      00102C                       2791 	_vars VSIZE 
      0090AC 52 04            [ 2]    1     sub sp,#VSIZE 
      0090AE 72 5F 00 0D      [ 1] 2792 	clr acc16 
      0090B2 1F 01            [ 2] 2793 	ldw (CMDX,sp),x  
      0090B4 AE A9 0E         [ 2] 2794 	ldw x,#kword_dict	
      0090B7 1F 03            [ 2] 2795 1$:	ldw (LINK,sp),x
      0090B9 E6 02            [ 1] 2796 	ld a,(2,x)
      0090BB A4 0F            [ 1] 2797 	and a,#15 
      0090BD C7 00 0E         [ 1] 2798 	ld acc8,a 
      0090C0 1C 00 03         [ 2] 2799 	addw x,#3
      0090C3 72 BB 00 0D      [ 2] 2800 	addw x,acc16
      0090C7 FE               [ 2] 2801 	ldw x,(x) ; command index  
      0090C8 13 01            [ 2] 2802 	cpw x,(CMDX,sp)
      0090CA 27 0A            [ 1] 2803 	jreq 2$
      0090CC 1E 03            [ 2] 2804 	ldw x,(LINK,sp)
      0090CE FE               [ 2] 2805 	ldw x,(x) 
      0090CF 1D 00 02         [ 2] 2806 	subw x,#2  
      0090D2 26 E3            [ 1] 2807 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      0090D4 20 05            [ 2] 2808 	jra 9$
      0090D6 1E 03            [ 2] 2809 2$: ldw x,(LINK,sp)
      0090D8 1C 00 02         [ 2] 2810 	addw x,#2 	
      00105B                       2811 9$:	_drop VSIZE
      0090DB 5B 04            [ 2]    1     addw sp,#VSIZE 
      0090DD 81               [ 4] 2812 	ret
                                   2813 
                                   2814 
                                   2815 ;---------------------------------
                                   2816 ; dictionary search 
                                   2817 ; input:
                                   2818 ;	X 		dictionary entry point, name field  
                                   2819 ;   y		.asciz name to search 
                                   2820 ; output:
                                   2821 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2822 ;  X		cmd_index ; execution address | 0 
                                   2823 ;---------------------------------
                           000001  2824 	NLEN=1 ; cmd length 
                           000002  2825 	XSAVE=2
                           000004  2826 	YSAVE=4
                           000005  2827 	VSIZE=5 
      0090DE                       2828 search_dict:
      00105E                       2829 	_vars VSIZE 
      0090DE 52 05            [ 2]    1     sub sp,#VSIZE 
                                   2830 
      0090E0 17 04            [ 2] 2831 	ldw (YSAVE,sp),y 
      0090E2                       2832 search_next:
      0090E2 1F 02            [ 2] 2833 	ldw (XSAVE,sp),x 
                                   2834 ; get name length in dictionary	
      0090E4 F6               [ 1] 2835 	ld a,(x)
      0090E5 A4 0F            [ 1] 2836 	and a,#0xf 
      0090E7 6B 01            [ 1] 2837 	ld (NLEN,sp),a  
      0090E9 16 04            [ 2] 2838 	ldw y,(YSAVE,sp) ; name pointer 
      0090EB 5C               [ 1] 2839 	incw x 
      0090EC                       2840 cp_loop:
      0090EC 90 F6            [ 1] 2841 	ld a,(y)
      0090EE 27 1B            [ 1] 2842 	jreq str_match 
      0090F0 0D 01            [ 1] 2843 	tnz (NLEN,sp)
      0090F2 27 0A            [ 1] 2844 	jreq no_match  
      0090F4 F1               [ 1] 2845 	cp a,(x)
      0090F5 26 07            [ 1] 2846 	jrne no_match 
      0090F7 90 5C            [ 1] 2847 	incw y 
      0090F9 5C               [ 1] 2848 	incw x
      0090FA 0A 01            [ 1] 2849 	dec (NLEN,sp)
      0090FC 20 EE            [ 2] 2850 	jra cp_loop 
      0090FE                       2851 no_match:
      0090FE 1E 02            [ 2] 2852 	ldw x,(XSAVE,sp) 
      009100 1D 00 02         [ 2] 2853 	subw x,#2 ; move X to link field
      009103 4B 00            [ 1] 2854 	push #TK_NONE 
      009105 FE               [ 2] 2855 	ldw x,(x) ; next word link 
      009106 84               [ 1] 2856 	pop a ; TK_NONE 
      009107 27 1F            [ 1] 2857 	jreq search_exit  ; not found  
                                   2858 ;try next 
      009109 20 D7            [ 2] 2859 	jra search_next
      00910B                       2860 str_match:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      00910B 1E 02            [ 2] 2861 	ldw x,(XSAVE,sp)
      00910D F6               [ 1] 2862 	ld a,(X)
      00910E 6B 01            [ 1] 2863 	ld (NLEN,sp),a ; needed to test keyword type  
      009110 A4 0F            [ 1] 2864 	and a,#0xf 
                                   2865 ; move x to procedure address field 	
      009112 4C               [ 1] 2866 	inc a 
      009113 C7 00 0E         [ 1] 2867 	ld acc8,a 
      009116 72 5F 00 0D      [ 1] 2868 	clr acc16 
      00911A 72 BB 00 0D      [ 2] 2869 	addw x,acc16 
      00911E FE               [ 2] 2870 	ldw x,(x) ; routine index  
                                   2871 ;determine keyword type bits 7:6 
      00911F 7B 01            [ 1] 2872 	ld a,(NLEN,sp)
      009121 4E               [ 1] 2873 	swap a 
      009122 A4 0C            [ 1] 2874 	and a,#0xc
      009124 44               [ 1] 2875 	srl a
      009125 44               [ 1] 2876 	srl a 
      009126 AB 80            [ 1] 2877 	add a,#128
      009128                       2878 search_exit: 
      0010A8                       2879 	_drop VSIZE 	 
      009128 5B 05            [ 2]    1     addw sp,#VSIZE 
      00912A 81               [ 4] 2880 	ret 
                                   2881 
                                   2882 ;---------------------
                                   2883 ; check if next token
                                   2884 ;  is of expected type 
                                   2885 ; input:
                                   2886 ;   A 		 expected token attribute
                                   2887 ;  ouput:
                                   2888 ;   none     if fail call syntax_error 
                                   2889 ;--------------------
      00912B                       2890 expect:
      00912B 88               [ 1] 2891 	push a 
      00912C CD 8A 57         [ 4] 2892 	call next_token 
      00912F 11 01            [ 1] 2893 	cp a,(1,sp)
      009131 27 03            [ 1] 2894 	jreq 1$
      009133 CC 89 65         [ 2] 2895 	jp syntax_error
      009136 84               [ 1] 2896 1$: pop a 
      009137 81               [ 4] 2897 	ret 
                                   2898 
                                   2899 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2900 ; parse arguments list 
                                   2901 ; between ()
                                   2902 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      009138                       2903 func_args:
      009138 A6 07            [ 1] 2904 	ld a,#TK_LPAREN 
      00913A CD 91 2B         [ 4] 2905 	call expect 
                                   2906 ; expected to continue in arg_list 
                                   2907 ; caller must check for TK_RPAREN 
                                   2908 
                                   2909 ;-------------------------------
                                   2910 ; parse embedded BASIC routines 
                                   2911 ; arguments list.
                                   2912 ; arg_list::=  rel[','rel]*
                                   2913 ; all arguments are of integer type
                                   2914 ; and pushed on stack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2915 ; input:
                                   2916 ;   none
                                   2917 ; output:
                                   2918 ;   stack{n}   arguments pushed on stack
                                   2919 ;   A 	number of arguments pushed on stack  
                                   2920 ;--------------------------------
      00913D                       2921 arg_list:
      00913D 4B 00            [ 1] 2922 	push #0  
      00913F CD 92 88         [ 4] 2923 1$: call relation
      009142 A1 00            [ 1] 2924 	cp a,#TK_NONE 
      009144 27 20            [ 1] 2925 	jreq 5$
      009146 A1 84            [ 1] 2926 	cp a,#TK_INTGR
      009148 26 13            [ 1] 2927 	jrne 4$
      00914A                       2928 3$: 
                                   2929 ; swap return address with argument
      00914A 84               [ 1] 2930 	pop a ; arg_count
      00914B 90 85            [ 2] 2931 	popw y ; return address 
      00914D 89               [ 2] 2932 	pushw x ; new argument 
      00914E 90 89            [ 2] 2933 	pushw y 
      009150 4C               [ 1] 2934     inc a
      009151 88               [ 1] 2935 	push a 
      009152 CD 8A 57         [ 4] 2936 	call next_token 
      009155 A1 09            [ 1] 2937 	cp a,#TK_COMMA 
      009157 27 E6            [ 1] 2938 	jreq 1$ 
      009159 A1 00            [ 1] 2939 	cp a,#TK_NONE 
      00915B 27 09            [ 1] 2940 	jreq 5$ 
      00915D A1 08            [ 1] 2941 4$:	cp a,#TK_RPAREN 
      00915F 27 05            [ 1] 2942 	jreq 5$
      0010E1                       2943 	_unget_token 
      009161 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      009166 84               [ 1] 2944 5$:	pop a  
      009167 81               [ 4] 2945 	ret 
                                   2946 
                                   2947 ;--------------------------------
                                   2948 ;   BASIC commnands 
                                   2949 ;--------------------------------
                                   2950 
                                   2951 ;--------------------------------
                                   2952 ;  arithmetic and relational 
                                   2953 ;  routines
                                   2954 ;  operators precedence
                                   2955 ;  highest to lowest
                                   2956 ;  operators on same row have 
                                   2957 ;  same precedence and are executed
                                   2958 ;  from left to right.
                                   2959 ;	'*','/','%'
                                   2960 ;   '-','+'
                                   2961 ;   '=','>','<','>=','<=','<>','><'
                                   2962 ;   '<>' and '><' are equivalent for not equal.
                                   2963 ;--------------------------------
                                   2964 
                                   2965 ;---------------------
                                   2966 ; return array element
                                   2967 ; address from @(expr)
                                   2968 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2969 ;   A 		TK_ARRAY
                                   2970 ; output:
                                   2971 ;   A 		TK_INTGR
                                   2972 ;	X 		element address 
                                   2973 ;----------------------
      009168                       2974 get_array_element:
      009168 CD 91 38         [ 4] 2975 	call func_args 
      00916B A1 01            [ 1] 2976 	cp a,#1
      00916D 27 03            [ 1] 2977 	jreq 1$
      00916F CC 89 65         [ 2] 2978 	jp syntax_error
      009172 85               [ 2] 2979 1$: popw x 
                                   2980 	; check for bounds 
      009173 C3 00 22         [ 2] 2981 	cpw x,array_size 
      009176 23 05            [ 2] 2982 	jrule 3$
                                   2983 ; bounds {1..array_size}	
      009178 A6 0A            [ 1] 2984 2$: ld a,#ERR_BAD_VALUE 
      00917A CC 89 67         [ 2] 2985 	jp tb_error 
      00917D 5D               [ 2] 2986 3$: tnzw  x
      00917E 27 F8            [ 1] 2987 	jreq 2$ 
      009180 58               [ 2] 2988 	sllw x 
      009181 89               [ 2] 2989 	pushw x 
      009182 AE 16 90         [ 2] 2990 	ldw x,#tib
      009185 72 F0 01         [ 2] 2991 	subw x,(1,sp)
      001108                       2992 	_drop 2   
      009188 5B 02            [ 2]    1     addw sp,#2 
      00918A A6 84            [ 1] 2993 	ld a,#TK_INTGR
      00918C 81               [ 4] 2994 	ret 
                                   2995 
                                   2996 
                                   2997 ;***********************************
                                   2998 ;   expression parse,execute 
                                   2999 ;***********************************
                                   3000 ;-----------------------------------
                                   3001 ; factor ::= ['+'|'-'|e]  var | @ |
                                   3002 ;			 integer | function |
                                   3003 ;			 '('relation')' 
                                   3004 ; output:
                                   3005 ;   A    token attribute 
                                   3006 ;   X 	 integer
                                   3007 ; ---------------------------------
                           000001  3008 	NEG=1
                           000001  3009 	VSIZE=1
      00918D                       3010 factor:
      00110D                       3011 	_vars VSIZE 
      00918D 52 01            [ 2]    1     sub sp,#VSIZE 
      00918F CD 8A 57         [ 4] 3012 	call next_token
      009192 A1 02            [ 1] 3013 	cp a,#CMD_END  
      009194 25 3D            [ 1] 3014 	jrult 16$
      009196 6B 01            [ 1] 3015 1$:	ld (NEG,sp),a 
      009198 A4 30            [ 1] 3016 	and a,#TK_GRP_MASK
      00919A A1 10            [ 1] 3017 	cp a,#TK_GRP_ADD 
      00919C 27 04            [ 1] 3018 	jreq 2$
      00919E 7B 01            [ 1] 3019 	ld a,(NEG,sp)
      0091A0 20 03            [ 2] 3020 	jra 4$  
      0091A2                       3021 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0091A2 CD 8A 57         [ 4] 3022 	call next_token 
      0091A5                       3023 4$:	
      0091A5 A1 81            [ 1] 3024 	cp a,#TK_IFUNC 
      0091A7 26 03            [ 1] 3025 	jrne 5$ 
      0091A9 FD               [ 4] 3026 	call (x) 
      0091AA 20 32            [ 2] 3027 	jra 18$ 
      0091AC                       3028 5$:
      0091AC A1 84            [ 1] 3029 	cp a,#TK_INTGR
      0091AE 26 02            [ 1] 3030 	jrne 6$
      0091B0 20 2C            [ 2] 3031 	jra 18$
      0091B2                       3032 6$:
      0091B2 A1 06            [ 1] 3033 	cp a,#TK_ARRAY
      0091B4 26 06            [ 1] 3034 	jrne 10$
      0091B6 CD 91 68         [ 4] 3035 	call get_array_element
      0091B9 FE               [ 2] 3036 	ldw x,(x)
      0091BA 20 22            [ 2] 3037 	jra 18$ 
      0091BC                       3038 10$:
      0091BC A1 85            [ 1] 3039 	cp a,#TK_VAR 
      0091BE 26 03            [ 1] 3040 	jrne 12$
      0091C0 FE               [ 2] 3041 	ldw x,(x)
      0091C1 20 1B            [ 2] 3042 	jra 18$
      0091C3                       3043 12$:			
      0091C3 A1 07            [ 1] 3044 	cp a,#TK_LPAREN
      0091C5 26 0C            [ 1] 3045 	jrne 16$
      0091C7 CD 92 88         [ 4] 3046 	call relation
      0091CA 89               [ 2] 3047 	pushw x 
      0091CB A6 08            [ 1] 3048 	ld a,#TK_RPAREN 
      0091CD CD 91 2B         [ 4] 3049 	call expect
      0091D0 85               [ 2] 3050 	popw x 
      0091D1 20 0B            [ 2] 3051 	jra 18$	
      0091D3                       3052 16$:
      0091D3 4D               [ 1] 3053 	tnz a 
      0091D4 27 11            [ 1] 3054 	jreq 20$ 
      001156                       3055 	_unget_token
      0091D6 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      0091DB 4F               [ 1] 3056 	clr a 
      0091DC 20 09            [ 2] 3057 	jra 20$ 
      0091DE                       3058 18$: 
      0091DE A6 11            [ 1] 3059 	ld a,#TK_MINUS 
      0091E0 11 01            [ 1] 3060 	cp a,(NEG,sp)
      0091E2 26 01            [ 1] 3061 	jrne 19$
      0091E4 50               [ 2] 3062 	negw x
      0091E5                       3063 19$:
      0091E5 A6 84            [ 1] 3064 	ld a,#TK_INTGR
      0091E7                       3065 20$:
      001167                       3066 	_drop VSIZE
      0091E7 5B 01            [ 2]    1     addw sp,#VSIZE 
      0091E9 81               [ 4] 3067 	ret
                                   3068 
                                   3069 ;-----------------------------------
                                   3070 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3071 ; output:
                                   3072 ;   A    	token attribute 
                                   3073 ;	X		integer
                                   3074 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                           000001  3075 	N1=1   ; int16_t
                           000003  3076 	MULOP=3
                           000003  3077 	VSIZE=3
      0091EA                       3078 term:
      00116A                       3079 	_vars VSIZE
      0091EA 52 03            [ 2]    1     sub sp,#VSIZE 
      0091EC CD 91 8D         [ 4] 3080 	call factor
      0091EF 4D               [ 1] 3081 	tnz a 
      0091F0 27 47            [ 1] 3082 	jreq term_exit 
      0091F2                       3083 term01:	 ; check for  operator 
      0091F2 1F 01            [ 2] 3084 	ldw (N1,sp),x  ; save first factor 
      0091F4 CD 8A 57         [ 4] 3085 	call next_token
      0091F7 6B 03            [ 1] 3086 	ld (MULOP,sp),a
      0091F9 A1 02            [ 1] 3087 	cp a,#CMD_END
      0091FB 25 2F            [ 1] 3088 	jrult 8$
      0091FD A4 30            [ 1] 3089 	and a,#TK_GRP_MASK
      0091FF A1 20            [ 1] 3090 	cp a,#TK_GRP_MULT
      009201 27 02            [ 1] 3091 	jreq 1$
      009203 20 27            [ 2] 3092 	jra 8$
      009205                       3093 1$:	; got *|/|%
      009205 CD 91 8D         [ 4] 3094 	call factor
      009208 A1 84            [ 1] 3095 	cp a,#TK_INTGR
      00920A 27 03            [ 1] 3096 	jreq 2$
      00920C CC 89 65         [ 2] 3097 	jp syntax_error
      00920F 90 93            [ 1] 3098 2$:	ldw y,x 
      009211 1E 01            [ 2] 3099 	ldw x,(N1,sp)
      009213 7B 03            [ 1] 3100 	ld a,(MULOP,sp) 
      009215 A1 20            [ 1] 3101 	cp a,#TK_MULT 
      009217 26 05            [ 1] 3102 	jrne 3$
      009219 CD 8F BC         [ 4] 3103 	call multiply 
      00921C 20 D4            [ 2] 3104 	jra term01
      00921E A1 21            [ 1] 3105 3$: cp a,#TK_DIV 
      009220 26 05            [ 1] 3106 	jrne 4$ 
      009222 CD 90 75         [ 4] 3107 	call divide 
      009225 20 CB            [ 2] 3108 	jra term01 
      009227 CD 90 8B         [ 4] 3109 4$: call modulo
      00922A 20 C6            [ 2] 3110 	jra term01 
      00922C 7B 03            [ 1] 3111 8$: ld a,(MULOP,sp)
      00922E 27 05            [ 1] 3112 	jreq 9$ 
      0011B0                       3113 	_unget_token
      009230 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      009235 1E 01            [ 2] 3114 9$: ldw x,(N1,sp)
      009237 A6 84            [ 1] 3115 	ld a,#TK_INTGR 	
      009239                       3116 term_exit:
      0011B9                       3117 	_drop VSIZE 
      009239 5B 03            [ 2]    1     addw sp,#VSIZE 
      00923B 81               [ 4] 3118 	ret 
                                   3119 
                                   3120 ;-------------------------------
                                   3121 ;  expr ::= term [['+'|'-'] term]*
                                   3122 ;  result range {-32768..32767}
                                   3123 ;  output:
                                   3124 ;   A    token attribute 
                                   3125 ;   X	 integer   
                                   3126 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                           000001  3127 	N1=1 
                           000003  3128 	OP=3 
                           000003  3129 	VSIZE=3 
      00923C                       3130 expression:
      0011BC                       3131 	_vars VSIZE 
      00923C 52 03            [ 2]    1     sub sp,#VSIZE 
      00923E CD 91 EA         [ 4] 3132 	call term
      009241 4D               [ 1] 3133 	tnz a 
      009242 27 41            [ 1] 3134 	jreq expr_exit 
      009244 1F 01            [ 2] 3135 1$:	ldw (N1,sp),x 
      009246 CD 8A 57         [ 4] 3136 	call next_token
      009249 6B 03            [ 1] 3137 	ld (OP,sp),a 
      00924B A1 02            [ 1] 3138 	cp a,#CMD_END 
      00924D 25 29            [ 1] 3139 	jrult 8$ 
      00924F A4 30            [ 1] 3140 	and a,#TK_GRP_MASK
      009251 A1 10            [ 1] 3141 	cp a,#TK_GRP_ADD 
      009253 27 02            [ 1] 3142 	jreq 2$ 
      009255 20 21            [ 2] 3143 	jra 8$
      009257                       3144 2$: 
      009257 CD 91 EA         [ 4] 3145 	call term
      00925A A1 84            [ 1] 3146 	cp a,#TK_INTGR
      00925C 27 03            [ 1] 3147 	jreq 3$
      00925E CC 89 65         [ 2] 3148 	jp syntax_error
      009261 CF 00 0D         [ 2] 3149 3$:	ldw acc16,x 
      009264 1E 01            [ 2] 3150 	ldw x,(N1,sp)
      009266 7B 03            [ 1] 3151 	ld a,(OP,sp)
      009268 A1 10            [ 1] 3152 	cp a,#TK_PLUS 
      00926A 26 06            [ 1] 3153 	jrne 4$
      00926C 72 BB 00 0D      [ 2] 3154 	addw x,acc16
      009270 20 D2            [ 2] 3155 	jra 1$ 
      009272 72 B0 00 0D      [ 2] 3156 4$:	subw x,acc16
      009276 20 CC            [ 2] 3157 	jra 1$
      009278 7B 03            [ 1] 3158 8$: ld a,(OP,sp)
      00927A 27 05            [ 1] 3159 	jreq 9$ 
      0011FC                       3160 	_unget_token	
      00927C 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      009281 1E 01            [ 2] 3161 9$: ldw x,(N1,sp)
      009283 A6 84            [ 1] 3162 	ld a,#TK_INTGR	
      009285                       3163 expr_exit:
      001205                       3164 	_drop VSIZE 
      009285 5B 03            [ 2]    1     addw sp,#VSIZE 
      009287 81               [ 4] 3165 	ret 
                                   3166 
                                   3167 ;---------------------------------------------
                                   3168 ; rel ::= expr rel_op expr
                                   3169 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3170 ;  relation return  integer , zero is false 
                                   3171 ;  output:
                                   3172 ;    A 		token attribute  
                                   3173 ;	 X		integer 
                                   3174 ;---------------------------------------------
                           000001  3175 	N1=1
                           000003  3176 	RELOP=3
                           000003  3177 	VSIZE=3 
      009288                       3178 relation: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      001208                       3179 	_vars VSIZE
      009288 52 03            [ 2]    1     sub sp,#VSIZE 
      00928A CD 92 3C         [ 4] 3180 	call expression
      00928D 4D               [ 1] 3181 	tnz a 
      00928E 27 4D            [ 1] 3182 	jreq rel_exit
      009290 1F 01            [ 2] 3183 	ldw (N1,sp),x 
                                   3184 ; expect rel_op or leave 
      009292 CD 8A 57         [ 4] 3185 	call next_token 
      009295 6B 03            [ 1] 3186 	ld (RELOP,sp),a 
      009297 A4 30            [ 1] 3187 	and a,#TK_GRP_MASK
      009299 A1 30            [ 1] 3188 	cp a,#TK_GRP_RELOP 
      00929B 26 33            [ 1] 3189 	jrne 8$
      00929D                       3190 2$:	; expect another expression
      00929D CD 92 3C         [ 4] 3191 	call expression
      0092A0 A1 84            [ 1] 3192 	cp a,#TK_INTGR
      0092A2 27 03            [ 1] 3193 	jreq 3$
      0092A4 CC 89 65         [ 2] 3194 	jp syntax_error 
      0092A7 CF 00 0D         [ 2] 3195 3$:	ldw acc16,x 
      0092AA 1E 01            [ 2] 3196 	ldw x,(N1,sp) 
      0092AC 72 B0 00 0D      [ 2] 3197 	subw x,acc16
      0092B0 26 06            [ 1] 3198 	jrne 4$
      0092B2 35 02 00 0E      [ 1] 3199 	mov acc8,#2 ; n1==n2
      0092B6 20 0C            [ 2] 3200 	jra 6$ 
      0092B8                       3201 4$: 
      0092B8 2C 06            [ 1] 3202 	jrsgt 5$  
      0092BA 35 04 00 0E      [ 1] 3203 	mov acc8,#4 ; n1<2 
      0092BE 20 04            [ 2] 3204 	jra 6$
      0092C0                       3205 5$:
      0092C0 35 01 00 0E      [ 1] 3206 	mov acc8,#1 ; n1>n2 
      0092C4                       3207 6$:
      0092C4 5F               [ 1] 3208 	clrw x 
      0092C5 C6 00 0E         [ 1] 3209 	ld a, acc8  
      0092C8 14 03            [ 1] 3210 	and a,(RELOP,sp)
      0092CA 4D               [ 1] 3211 	tnz a 
      0092CB 27 0E            [ 1] 3212 	jreq 10$
      0092CD 5C               [ 1] 3213 	incw x 
      0092CE 20 0B            [ 2] 3214 	jra 10$  	
      0092D0 7B 03            [ 1] 3215 8$: ld a,(RELOP,sp)
      0092D2 27 05            [ 1] 3216 	jreq 9$
      001254                       3217 	_unget_token
      0092D4 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      0092D9                       3218 9$: 
      0092D9 1E 01            [ 2] 3219 	ldw x,(N1,sp)
      0092DB                       3220 10$:
      0092DB A6 84            [ 1] 3221 	ld a,#TK_INTGR
      0092DD                       3222 rel_exit:
      00125D                       3223 	_drop VSIZE
      0092DD 5B 03            [ 2]    1     addw sp,#VSIZE 
      0092DF 81               [ 4] 3224 	ret 
                                   3225 
                                   3226 ;--------------------------------
                                   3227 ; BASIC: SHOW 
                                   3228 ; print stack content in hexadecimal bytes 
                                   3229 ; 16 bytes per row 
                                   3230 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0092E0                       3231 show:
      0092E0 AE 92 FA         [ 2] 3232 	ldw x,#cstk_prompt
      0092E3 CD AA 40         [ 4] 3233 	call puts 
      0092E6 96               [ 1] 3234 	ldw x,sp 
      0092E7 1C 00 03         [ 2] 3235 	addw x,#3 ; ignore return address
      0092EA 90 AE 18 00      [ 2] 3236 	ldw y,#RAM_SIZE  
      0092EE CF 00 0D         [ 2] 3237 	ldw acc16,x 
      0092F1 72 B2 00 0D      [ 2] 3238 	subw y,acc16
      0092F5 CD 84 38         [ 4] 3239 	call hex_dump
      0092F8 4F               [ 1] 3240 	clr a 
      0092F9 81               [ 4] 3241 	ret
                                   3242 
      0092FA 0A 63 6F 6E 74 65 6E  3243 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3244 
                                   3245 
                                   3246 ;--------------------------------------------
                                   3247 ; BASIC: HEX 
                                   3248 ; select hexadecimal base for integer print
                                   3249 ;---------------------------------------------
      009321                       3250 hex_base:
      009321 35 10 00 0B      [ 1] 3251 	mov base,#16 
      009325 81               [ 4] 3252 	ret 
                                   3253 
                                   3254 ;--------------------------------------------
                                   3255 ; BASIC: DEC 
                                   3256 ; select decimal base for integer print
                                   3257 ;---------------------------------------------
      009326                       3258 dec_base:
      009326 35 0A 00 0B      [ 1] 3259 	mov base,#10
      00932A 81               [ 4] 3260 	ret 
                                   3261 
                                   3262 ;------------------------
                                   3263 ; BASIC: SIZE 
                                   3264 ; return free size in text area
                                   3265 ; output:
                                   3266 ;   A 		TK_INTGR
                                   3267 ;   X 	    size integer
                                   3268 ;--------------------------
      00932B                       3269 size:
      00932B AE 16 90         [ 2] 3270 	ldw x,#tib 
      00932E 72 B0 00 1F      [ 2] 3271 	subw x,txtend 
      009332 A6 84            [ 1] 3272 	ld a,#TK_INTGR
      009334 81               [ 4] 3273 	ret 
                                   3274 
                                   3275 
                                   3276 ;------------------------
                                   3277 ; BASIC: UBOUND  
                                   3278 ; return array variable size 
                                   3279 ; output:
                                   3280 ;   A 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3281 ;   X 	    array size 
                                   3282 ;--------------------------
      009335                       3283 ubound:
      009335 AE 16 90         [ 2] 3284 	ldw x,#tib
      009338 72 B0 00 1F      [ 2] 3285 	subw x,txtend 
      00933C 90 CE 00 05      [ 2] 3286 	ldw y,basicptr 
      009340 90 C3 00 1F      [ 2] 3287 	cpw y,txtend 
      009344 25 0A            [ 1] 3288 	jrult 1$
      009346 3B 00 04         [ 1] 3289 	push count 
      009349 4B 00            [ 1] 3290 	push #0 
      00934B 72 F0 01         [ 2] 3291 	subw x,(1,sp)
      0012CE                       3292 	_drop 2 
      00934E 5B 02            [ 2]    1     addw sp,#2 
      009350 54               [ 2] 3293 1$:	srlw x 
      009351 CF 00 22         [ 2] 3294 	ldw array_size,x
      009354 A6 84            [ 1] 3295 	ld a,#TK_INTGR
      009356 81               [ 4] 3296 	ret 
                                   3297 
                                   3298 ;-----------------------------
                                   3299 ; BASIC: LET var=expr 
                                   3300 ; variable assignement 
                                   3301 ; output:
                                   3302 ;   A 		TK_NONE 
                                   3303 ;-----------------------------
      009357                       3304 let:
      009357 CD 8A 57         [ 4] 3305 	call next_token 
      00935A A1 85            [ 1] 3306 	cp a,#TK_VAR 
      00935C 27 0A            [ 1] 3307 	jreq let_var
      00935E A1 06            [ 1] 3308 	cp a,#TK_ARRAY 
      009360 27 03            [ 1] 3309 	jreq  let_array
      009362 CC 89 65         [ 2] 3310 	jp syntax_error
      009365                       3311 let_array:
      009365 CD 91 68         [ 4] 3312 	call get_array_element
      009368                       3313 let_var:
      009368 89               [ 2] 3314 	pushw x  
      009369 CD 8A 57         [ 4] 3315 	call next_token 
      00936C A1 32            [ 1] 3316 	cp a,#TK_EQUAL
      00936E 27 03            [ 1] 3317 	jreq 1$
      009370 CC 89 65         [ 2] 3318 	jp syntax_error
      009373                       3319 1$:	
      009373 CD 92 88         [ 4] 3320 	call relation   
      009376 A1 84            [ 1] 3321 	cp a,#TK_INTGR 
      009378 27 03            [ 1] 3322 	jreq 2$
      00937A CC 89 65         [ 2] 3323 	jp syntax_error
      00937D                       3324 2$:	
      00937D 90 93            [ 1] 3325 	ldw y,x 
      00937F 85               [ 2] 3326 	popw x   
      009380 FF               [ 2] 3327 	ldw (x),y   
      009381 81               [ 4] 3328 	ret 
                                   3329 
                                   3330 ;----------------------------
                                   3331 ; BASIC: LIST [[start][,end]]
                                   3332 ; list program lines 
                                   3333 ; form start to end 
                                   3334 ; if empty argument list then 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3335 ; list all.
                                   3336 ;----------------------------
                           000001  3337 	FIRST=1
                           000003  3338 	LAST=3 
                           000005  3339 	LN_PTR=5
                           000006  3340 	VSIZE=6 
      009382                       3341 list:
      009382 CE 00 1D         [ 2] 3342 	ldw x,txtbgn 
      009385 C3 00 1F         [ 2] 3343 	cpw x,txtend 
      009388 2B 01            [ 1] 3344 	jrmi 1$
      00938A 81               [ 4] 3345 	ret 
      00938B                       3346 1$:	
      00130B                       3347 	_vars VSIZE
      00938B 52 06            [ 2]    1     sub sp,#VSIZE 
      00938D 1F 05            [ 2] 3348 	ldw (LN_PTR,sp),x 
      00938F FE               [ 2] 3349 	ldw x,(x) 
      009390 1F 01            [ 2] 3350 	ldw (FIRST,sp),x ; list from first line 
      009392 AE 7F FF         [ 2] 3351 	ldw x,#MAX_LINENO ; biggest line number 
      009395 1F 03            [ 2] 3352 	ldw (LAST,sp),x 
      009397 CD 91 3D         [ 4] 3353 	call arg_list
      00939A 4D               [ 1] 3354 	tnz a
      00939B 27 31            [ 1] 3355 	jreq list_loop 
      00939D A1 02            [ 1] 3356 	cp a,#2 
      00939F 27 07            [ 1] 3357 	jreq 4$
      0093A1 A1 01            [ 1] 3358 	cp a,#1 
      0093A3 27 06            [ 1] 3359 	jreq first_line 
      0093A5 CC 89 65         [ 2] 3360 	jp syntax_error 
      0093A8 85               [ 2] 3361 4$:	popw x 
      0093A9 1F 05            [ 2] 3362 	ldw (LAST+2,sp),x 
      0093AB                       3363 first_line:
      0093AB 85               [ 2] 3364 	popw x
      0093AC 1F 01            [ 2] 3365 	ldw (FIRST,sp),x 
      0093AE                       3366 lines_skip:
      0093AE CE 00 1D         [ 2] 3367 	ldw x,txtbgn
      0093B1 1F 05            [ 2] 3368 2$:	ldw (LN_PTR,sp),x 
      0093B3 C3 00 1F         [ 2] 3369 	cpw x,txtend 
      0093B6 2A 38            [ 1] 3370 	jrpl list_exit 
      0093B8 FE               [ 2] 3371 	ldw x,(x) ;line# 
      0093B9 13 01            [ 2] 3372 	cpw x,(FIRST,sp)
      0093BB 2A 11            [ 1] 3373 	jrpl list_loop 
      0093BD 1E 05            [ 2] 3374 	ldw x,(LN_PTR,sp) 
      0093BF E6 02            [ 1] 3375 	ld a,(2,x)
      0093C1 C7 00 0E         [ 1] 3376 	ld acc8,a 
      0093C4 72 5F 00 0D      [ 1] 3377 	clr acc16 
      0093C8 72 BB 00 0D      [ 2] 3378 	addw x,acc16
      0093CC 20 E3            [ 2] 3379 	jra 2$ 
                                   3380 ; print loop
      0093CE                       3381 list_loop:
      0093CE 1E 05            [ 2] 3382 	ldw x,(LN_PTR,sp)
      0093D0 E6 02            [ 1] 3383 	ld a,(2,x) 
      0093D2 CD 96 09         [ 4] 3384 	call prt_basic_line
      0093D5 1E 05            [ 2] 3385 	ldw x,(LN_PTR,sp)
      0093D7 E6 02            [ 1] 3386 	ld a,(2,x)
      0093D9 C7 00 0E         [ 1] 3387 	ld acc8,a 
      0093DC 72 5F 00 0D      [ 1] 3388 	clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0093E0 72 BB 00 0D      [ 2] 3389 	addw x,acc16
      0093E4 C3 00 1F         [ 2] 3390 	cpw x,txtend 
      0093E7 2A 07            [ 1] 3391 	jrpl list_exit
      0093E9 1F 05            [ 2] 3392 	ldw (LN_PTR,sp),x
      0093EB FE               [ 2] 3393 	ldw x,(x)
      0093EC 13 03            [ 2] 3394 	cpw x,(LAST,sp)  
      0093EE 2F DE            [ 1] 3395 	jrslt list_loop
      0093F0                       3396 list_exit:
      0093F0 55 00 04 00 02   [ 1] 3397 	mov in,count 
      0093F5 AE 16 E0         [ 2] 3398 	ldw x,#pad 
      0093F8 CF 00 05         [ 2] 3399 	ldw basicptr,x 
      00137B                       3400 	_drop VSIZE 
      0093FB 5B 06            [ 2]    1     addw sp,#VSIZE 
      0093FD 81               [ 4] 3401 	ret
                                   3402 
                                   3403 ;-------------------------
                                   3404 ; copy command name to buffer  
                                   3405 ; input:
                                   3406 ;   X 	name address 
                                   3407 ;   Y   destination buffer 
                                   3408 ; output:
                                   3409 ;   Y   point after name  
                                   3410 ;--------------------------
      0093FE                       3411 cpy_cmd_name:
      0093FE F6               [ 1] 3412 	ld a,(x)
      0093FF 5C               [ 1] 3413 	incw x
      009400 A4 0F            [ 1] 3414 	and a,#15  
      009402 88               [ 1] 3415 	push a 
      009403 0D 01            [ 1] 3416     tnz (1,sp) 
      009405 27 0A            [ 1] 3417 	jreq 9$
      009407 F6               [ 1] 3418 1$:	ld a,(x)
      009408 90 F7            [ 1] 3419 	ld (y),a  
      00940A 5C               [ 1] 3420 	incw x
      00940B 90 5C            [ 1] 3421 	incw y 
      00940D 0A 01            [ 1] 3422 	dec (1,sp)	 
      00940F 26 F6            [ 1] 3423 	jrne 1$
      009411 84               [ 1] 3424 9$: pop a 
      009412 81               [ 4] 3425 	ret	
                                   3426 
                                   3427 ;--------------------------
                                   3428 ; add a space after letter or 
                                   3429 ; digit.
                                   3430 ; input:
                                   3431 ;   Y     pointer to buffer 
                                   3432 ; output:
                                   3433 ;   Y    moved to end 
                                   3434 ;--------------------------
      009413                       3435 add_space:
      009413 90 5A            [ 2] 3436 	decw y 
      009415 90 F6            [ 1] 3437 	ld a,(y)
      009417 90 5C            [ 1] 3438 	incw y
      009419 CD 86 6A         [ 4] 3439 	call is_alnum 
      00941C 24 06            [ 1] 3440 	jrnc 1$
      00941E A6 20            [ 1] 3441 	ld a,#SPACE 
      009420 90 F7            [ 1] 3442 	ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009422 90 5C            [ 1] 3443 	incw y 
      009424 81               [ 4] 3444 1$: ret 
                                   3445 
                                   3446 ;--------------------------
                                   3447 ;  align text in buffer 
                                   3448 ;  to tab_width padding 
                                   3449 ;  left with  SPACE 
                                   3450 ; input:
                                   3451 ;   X      str*
                                   3452 ;   A      str_length 
                                   3453 ; output:
                                   3454 ;   X      ajusted
                                   3455 ;--------------------------
      009425                       3456 right_align:
      009425 88               [ 1] 3457 	push a 
      009426 7B 01            [ 1] 3458 0$: ld a,(1,sp)
      009428 C1 00 25         [ 1] 3459 	cp a,tab_width 
      00942B 2A 08            [ 1] 3460 	jrpl 1$
      00942D A6 20            [ 1] 3461 	ld a,#SPACE 
      00942F 5A               [ 2] 3462 	decw x
      009430 F7               [ 1] 3463 	ld (x),a  
      009431 0C 01            [ 1] 3464 	inc (1,sp)
      009433 20 F1            [ 2] 3465 	jra 0$ 
      009435 84               [ 1] 3466 1$: pop a 	
      009436 81               [ 4] 3467 	ret 
                                   3468 
                                   3469 ;--------------------------
                                   3470 ; print TK_QSTR
                                   3471 ; converting control character
                                   3472 ; to backslash sequence
                                   3473 ; input:
                                   3474 ;   X        char *
                                   3475 ;   Y        dest. buffer 
                                   3476 ; output:
                                   3477 ;   X        moved forward 
                                   3478 ;   Y        moved forward 
                                   3479 ;-----------------------------
      009437                       3480 cpy_quote:
      009437 A6 22            [ 1] 3481 	ld a,#'"
      009439 90 F7            [ 1] 3482 	ld (y),a 
      00943B 90 5C            [ 1] 3483 	incw y 
      00943D F6               [ 1] 3484 1$:	ld a,(x)
      00943E 27 30            [ 1] 3485 	jreq 9$
      009440 5C               [ 1] 3486 	incw x 
      009441 A1 20            [ 1] 3487 	cp a,#SPACE 
      009443 25 0E            [ 1] 3488 	jrult 3$
      009445 90 F7            [ 1] 3489 	ld (y),a
      009447 90 5C            [ 1] 3490 	incw y 
      009449 A1 5C            [ 1] 3491 	cp a,#'\ 
      00944B 26 F0            [ 1] 3492 	jrne 1$ 
      00944D                       3493 2$:
      00944D 90 F7            [ 1] 3494 	ld (y),a
      00944F 90 5C            [ 1] 3495 	incw y  
      009451 20 EA            [ 2] 3496 	jra 1$
      009453 88               [ 1] 3497 3$: push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009454 A6 5C            [ 1] 3498 	ld a,#'\
      009456 90 F7            [ 1] 3499 	ld (y),a 
      009458 90 5C            [ 1] 3500 	incw y  
      00945A 84               [ 1] 3501 	pop a 
      00945B A0 07            [ 1] 3502 	sub a,#7
      00945D C7 00 0E         [ 1] 3503 	ld acc8,a 
      009460 72 5F 00 0D      [ 1] 3504 	clr acc16
      009464 89               [ 2] 3505 	pushw x
      009465 AE 8C 0B         [ 2] 3506 	ldw x,#escaped 
      009468 72 BB 00 0D      [ 2] 3507 	addw x,acc16 
      00946C F6               [ 1] 3508 	ld a,(x)
      00946D 85               [ 2] 3509 	popw x
      00946E 20 DD            [ 2] 3510 	jra 2$
      009470 A6 22            [ 1] 3511 9$: ld a,#'"
      009472 90 F7            [ 1] 3512 	ld (y),a 
      009474 90 5C            [ 1] 3513 	incw y  
      009476 5C               [ 1] 3514 	incw x 
      009477 81               [ 4] 3515 	ret
                                   3516 
                                   3517 ;--------------------------
                                   3518 ; return variable name 
                                   3519 ; from its address.
                                   3520 ; input:
                                   3521 ;   X    variable address
                                   3522 ; output:
                                   3523 ;   A     variable letter
                                   3524 ;--------------------------
      009478                       3525 var_name:
      009478 1D 00 31         [ 2] 3526 		subw x,#vars 
      00947B 9F               [ 1] 3527 		ld a,xl 
      00947C 44               [ 1] 3528 		srl a 
      00947D AB 41            [ 1] 3529 		add a,#'A 
      00947F 81               [ 4] 3530 		ret 
                                   3531 
                                   3532 ;-----------------------------
                                   3533 ; return cmd  idx from its 
                                   3534 ; code address 
                                   3535 ; input:
                                   3536 ;   X      code address 
                                   3537 ; output:
                                   3538 ;   X      cmd_idx
                                   3539 ;-----------------------------
      009480                       3540 get_cmd_idx:
      009480 90 89            [ 2] 3541 	pushw y
      009482 90 AE A9 16      [ 2] 3542 	ldw y,#code_addr 
      009486 90 CF 00 18      [ 2] 3543 	ldw ptr16,y 
      00948A 90 5F            [ 1] 3544 	clrw y 
      00948C 91 D3 18         [ 5] 3545 1$:	cpw x,([ptr16],y)
      00948F 27 0C            [ 1] 3546 	jreq 3$ 
      009491 90 5C            [ 1] 3547 	incw y 
      009493 91 D6 18         [ 4] 3548 	ld a,([ptr16],y)
      009496 90 5C            [ 1] 3549 	incw y
      009498 91 DA 18         [ 4] 3550 	or a,([ptr16],y)	
      00949B 26 EF            [ 1] 3551 	jrne 1$
      00949D 93               [ 1] 3552 3$: ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00949E 90 85            [ 2] 3553 	popw y 
      0094A0 81               [ 4] 3554 	ret
                                   3555 
                                   3556 ;-------------------------------------
                                   3557 ; decompile tokens list 
                                   3558 ; to original text line 
                                   3559 ; input:
                                   3560 ;   [basicptr]  pointer at line 
                                   3561 ;   Y           destination buffer
                                   3562 ; output:
                                   3563 ;   A           length 
                                   3564 ;   Y           after string  
                                   3565 ;------------------------------------
                           000001  3566 	BASE_SAV=1
                           000002  3567 	WIDTH_SAV=2
                           000003  3568 	STR=3
                           000004  3569 	VSIZE=4 
      0094A1                       3570 decompile::
      001421                       3571 	_vars VSIZE
      0094A1 52 04            [ 2]    1     sub sp,#VSIZE 
      0094A3 C6 00 0B         [ 1] 3572 	ld a,base
      0094A6 6B 01            [ 1] 3573 	ld (BASE_SAV,sp),a  
      0094A8 C6 00 25         [ 1] 3574 	ld a,tab_width 
      0094AB 6B 02            [ 1] 3575 	ld (WIDTH_SAV,sp),a 
      0094AD 17 03            [ 2] 3576 	ldw (STR,sp),y   
      0094AF 72 CE 00 05      [ 5] 3577 	ldw x,[basicptr] ; line number 
      0094B3 35 0A 00 0B      [ 1] 3578 	mov base,#10
      0094B7 35 05 00 25      [ 1] 3579 	mov tab_width,#5
      0094BB 72 5F 00 0C      [ 1] 3580 	clr acc24 
      0094BF CF 00 0D         [ 2] 3581 	ldw acc16,x
      0094C2 CD 8A D4         [ 4] 3582 	call itoa  
      0094C5 CD 94 25         [ 4] 3583 	call right_align 
      0094C8 88               [ 1] 3584 	push a 
      0094C9 90 93            [ 1] 3585 1$:	ldw y,x ; source
      0094CB 1E 04            [ 2] 3586 	ldw x,(STR+1,sp) ; destination
      0094CD CD 84 91         [ 4] 3587 	call strcpy 
      0094D0 90 5F            [ 1] 3588 	clrw y 
      0094D2 84               [ 1] 3589 	pop a 
      0094D3 90 97            [ 1] 3590 	ld yl,a 
      0094D5 72 F9 03         [ 2] 3591 	addw y,(STR,sp)
      0094D8 A6 20            [ 1] 3592 	ld a,#SPACE 
      0094DA 90 F7            [ 1] 3593 	ld (y),a 
      0094DC 90 5C            [ 1] 3594 	incw y 
      0094DE 72 5F 00 25      [ 1] 3595 	clr tab_width
      0094E2 AE 00 03         [ 2] 3596 	ldw x,#3
      0094E5 CF 00 01         [ 2] 3597 	ldw in.w,x 
      0094E8                       3598 decomp_loop:
      0094E8 90 89            [ 2] 3599 	pushw y
      0094EA CD 8A 57         [ 4] 3600 	call next_token 
      0094ED 90 85            [ 2] 3601 	popw y 
      0094EF 4D               [ 1] 3602 	tnz a  
      0094F0 26 03            [ 1] 3603 	jrne 1$
      0094F2 CC 95 CE         [ 2] 3604 	jp 20$
      0094F5 2A 6F            [ 1] 3605 1$:	jrpl 6$
                                   3606 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0094F7 A1 85            [ 1] 3607 	cp a,#TK_VAR 
      0094F9 26 0C            [ 1] 3608 	jrne 3$
                                   3609 ;; TK_VAR 
      0094FB CD 94 13         [ 4] 3610 	call add_space  
      0094FE CD 94 78         [ 4] 3611 	call var_name
      009501 90 F7            [ 1] 3612 	ld (y),a 
      009503 90 5C            [ 1] 3613 	incw y  
      009505 20 E1            [ 2] 3614 	jra decomp_loop
      009507                       3615 3$:
      009507 A1 84            [ 1] 3616 	cp a,#TK_INTGR
      009509 26 22            [ 1] 3617 	jrne 4$
                                   3618 ;; TK_INTGR
      00950B CD 94 13         [ 4] 3619 	call add_space
      00950E 72 5F 00 0C      [ 1] 3620 	clr acc24 
      009512 CF 00 0D         [ 2] 3621 	ldw acc16,x 
      009515 90 89            [ 2] 3622 	pushw y 
      009517 CD 8A D4         [ 4] 3623 	call itoa  
      00951A 16 01            [ 2] 3624 	ldw y,(1,sp) 
      00951C 88               [ 1] 3625 	push a 
      00951D 51               [ 1] 3626 	exgw x,y 
      00951E CD 84 91         [ 4] 3627 	call strcpy 
      009521 90 5F            [ 1] 3628 	clrw y
      009523 84               [ 1] 3629 	pop a  
      009524 90 97            [ 1] 3630 	ld yl,a 
      009526 72 F9 01         [ 2] 3631 	addw y,(1,sp)
      0014A9                       3632 	_drop 2 
      009529 5B 02            [ 2]    1     addw sp,#2 
      00952B 20 BB            [ 2] 3633 	jra decomp_loop
                                   3634 ;; dictionary keyword 
      00952D                       3635 4$:	
      00952D CD 94 80         [ 4] 3636 	call get_cmd_idx 
      009530 A3 00 8E         [ 2] 3637 	cpw x,#REM_IDX
      009533 26 22            [ 1] 3638 	jrne 5$
      009535 CE 00 05         [ 2] 3639 	ldw x,basicptr 
                                   3640 ; copy comment to buffer 
      009538 CD 94 13         [ 4] 3641 	call add_space
      00953B A6 27            [ 1] 3642 	ld a,#''
      00953D 90 F7            [ 1] 3643 	ld (y),a 
      00953F 90 5C            [ 1] 3644 	incw y 
      009541                       3645 41$:
      009541 72 D6 00 01      [ 4] 3646 	ld a,([in.w],x)
      009545 72 5C 00 02      [ 1] 3647 	inc in  
      009549 90 F7            [ 1] 3648 	ld (y),a 
      00954B 90 5C            [ 1] 3649 	incw y 
      00954D C6 00 02         [ 1] 3650 	ld a,in 
      009550 C1 00 04         [ 1] 3651 	cp a,count 
      009553 2B EC            [ 1] 3652 	jrmi 41$
      009555 20 77            [ 2] 3653 	jra 20$  
                                   3654 ; insert command name 
      009557                       3655 5$:
      009557 CD 94 13         [ 4] 3656 	call add_space  
      00955A 90 89            [ 2] 3657 	pushw y
      00955C CD 90 AC         [ 4] 3658 	call cmd_name
      00955F 90 85            [ 2] 3659 	popw y 
      009561 CD 93 FE         [ 4] 3660 	call cpy_cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009564 20 82            [ 2] 3661 	jra decomp_loop 
      009566                       3662 6$:
      009566 A1 02            [ 1] 3663 	cp a,#TK_QSTR 
      009568 26 06            [ 1] 3664 	jrne 7$
                                   3665 ;; TK_QSTR
      00956A CD 94 37         [ 4] 3666 	call cpy_quote  
      00956D CC 94 E8         [ 2] 3667 	jp decomp_loop
      009570                       3668 7$:
      009570 A1 03            [ 1] 3669 	cp a,#TK_CHAR 
      009572 26 0E            [ 1] 3670 	jrne 8$
                                   3671 ;; TK_CHAR 
      009574 A6 5C            [ 1] 3672 	ld a,#'\ 
      009576 90 F7            [ 1] 3673 	ld (y),a 
      009578 90 5C            [ 1] 3674 	incw y 
      00957A 9F               [ 1] 3675 	ld a,xl 
      00957B 90 F7            [ 1] 3676 	ld (y),a 
      00957D 90 5C            [ 1] 3677 	incw y 
      00957F CC 94 E8         [ 2] 3678 	jp decomp_loop
      009582 A1 01            [ 1] 3679 8$: cp a,#TK_COLON 
      009584 26 09            [ 1] 3680 	jrne 9$
      009586 A6 3A            [ 1] 3681 	ld a,#':
      009588                       3682 81$:
      009588 90 F7            [ 1] 3683 	ld (y),a 
      00958A 90 5C            [ 1] 3684 	incw y 
      00958C                       3685 82$:
      00958C CC 94 E8         [ 2] 3686 	jp decomp_loop
      00958F                       3687 9$: 
      00958F A1 0A            [ 1] 3688 	cp a,#TK_SHARP
      009591 22 0A            [ 1] 3689 	jrugt 10$ 
      009593 A0 06            [ 1] 3690 	sub a,#TK_ARRAY 
      009595 5F               [ 1] 3691 	clrw x 
      009596 97               [ 1] 3692 	ld xl,a
      009597 1C 95 E4         [ 2] 3693 	addw x,#single_char 
      00959A F6               [ 1] 3694 	ld a,(x)
      00959B 20 EB            [ 2] 3695 	jra 81$ 
      00959D                       3696 10$: 
      00959D A1 11            [ 1] 3697 	cp a,#TK_MINUS 
      00959F 22 0A            [ 1] 3698 	jrugt 11$
      0095A1 A0 10            [ 1] 3699 	sub a,#TK_PLUS 
      0095A3 5F               [ 1] 3700 	clrw x 
      0095A4 97               [ 1] 3701 	ld xl,a 
      0095A5 1C 95 E9         [ 2] 3702 	addw x,#add_char 
      0095A8 F6               [ 1] 3703 	ld a,(x)
      0095A9 20 DD            [ 2] 3704 	jra 81$
      0095AB                       3705 11$:
      0095AB A1 22            [ 1] 3706     cp a,#TK_MOD 
      0095AD 22 0A            [ 1] 3707 	jrugt 12$
      0095AF A0 20            [ 1] 3708 	sub a,#TK_MULT
      0095B1 5F               [ 1] 3709 	clrw x 
      0095B2 97               [ 1] 3710 	ld xl,a 
      0095B3 1C 95 EB         [ 2] 3711 	addw x,#mul_char
      0095B6 F6               [ 1] 3712 	ld a,(x)
      0095B7 20 CF            [ 2] 3713 	jra 81$
      0095B9                       3714 12$:
      0095B9 A0 31            [ 1] 3715 	sub a,#TK_GT  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0095BB 48               [ 1] 3716 	sll a 
      0095BC 5F               [ 1] 3717 	clrw x 
      0095BD 97               [ 1] 3718 	ld xl,a 
      0095BE 1C 95 EE         [ 2] 3719 	addw x,#relop_str 
      0095C1 FE               [ 2] 3720 	ldw x,(x)
      0095C2 F6               [ 1] 3721 	ld a,(x)
      0095C3 5C               [ 1] 3722 	incw x 
      0095C4 90 F7            [ 1] 3723 	ld (y),a
      0095C6 90 5C            [ 1] 3724 	incw y 
      0095C8 F6               [ 1] 3725 	ld a,(x)
      0095C9 26 BD            [ 1] 3726 	jrne 81$
      0095CB CC 94 E8         [ 2] 3727 	jp decomp_loop 
      0095CE                       3728 20$: 
      0095CE 90 7F            [ 1] 3729 	clr (y)
      0095D0 1E 03            [ 2] 3730 	ldw x,(STR,sp)
      0095D2 7B 01            [ 1] 3731 	ld a,(BASE_SAV,sp)
      0095D4 C7 00 0B         [ 1] 3732 	ld base,a 
      0095D7 7B 02            [ 1] 3733 	ld a,(WIDTH_SAV,sp)
      0095D9 C7 00 25         [ 1] 3734 	ld tab_width,a
      0095DC 72 F2 03         [ 2] 3735 	subw y,(STR,sp) 
      0095DF 90 9F            [ 1] 3736 	ld a,yl 
      001561                       3737 	_drop VSIZE 
      0095E1 5B 04            [ 2]    1     addw sp,#VSIZE 
      0095E3 81               [ 4] 3738 	ret 
                                   3739 
      0095E4 40 28 29 2C 23        3740 single_char: .byte '@','(',')',',','#'
      0095E9 2B 2D                 3741 add_char: .byte '+','-'
      0095EB 2A 2F 25              3742 mul_char: .byte '*','/','%'
      0095EE 95 FA 95 FC 95 FE 96  3743 relop_str: .word gt,equal,ge,lt,le,ne 
             01 96 03 96 06
      0095FA 3E 00                 3744 gt: .asciz ">"
      0095FC 3D 00                 3745 equal: .asciz "="
      0095FE 3E 3D 00              3746 ge: .asciz ">="
      009601 3C 00                 3747 lt: .asciz "<"
      009603 3C 3D 00              3748 le: .asciz "<="
      009606 3C 3E 00              3749 ne:  .asciz "<>"
                                   3750 
                                   3751 
                                   3752 ;--------------------------
                                   3753 ; decompile line from token list
                                   3754 ; and print it. 
                                   3755 ; input:
                                   3756 ;   A       stop at this position 
                                   3757 ;   X 		pointer at line
                                   3758 ; output:
                                   3759 ;   none 
                                   3760 ;--------------------------	
      009609                       3761 prt_basic_line:
      009609 C7 00 04         [ 1] 3762 	ld count,a 
      00960C E6 02            [ 1] 3763 	ld a,(2,x)
      00960E C1 00 04         [ 1] 3764 	cp a,count 
      009611 2A 03            [ 1] 3765 	jrpl 1$ 
      009613 C7 00 04         [ 1] 3766 	ld count,a 
      009616 CF 00 05         [ 2] 3767 1$:	ldw basicptr,x 
      009619 90 AE 16 90      [ 2] 3768 	ldw y,#tib  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00961D CD 94 A1         [ 4] 3769 	call decompile 
      009620 CD AA 40         [ 4] 3770 	call puts 
      009623 A6 0D            [ 1] 3771 	ld a,#CR 
      009625 CD 83 8A         [ 4] 3772 	call putc 
      009628 81               [ 4] 3773 	ret 
                                   3774 
                                   3775 
                                   3776 
                                   3777 ;---------------------------------
                                   3778 ; BASIC: PRINT|? arg_list 
                                   3779 ; print values from argument list
                                   3780 ;----------------------------------
                           000001  3781 	COMMA=1
                           000001  3782 	VSIZE=1
      009629                       3783 print:
      0015A9                       3784 	_vars VSIZE 
      009629 52 01            [ 2]    1     sub sp,#VSIZE 
      00962B                       3785 reset_comma:
      00962B 0F 01            [ 1] 3786 	clr (COMMA,sp)
      00962D                       3787 prt_loop:
      00962D CD 8A 57         [ 4] 3788 	call next_token
      009630 A1 02            [ 1] 3789 	cp a,#CMD_END 
      009632 25 4F            [ 1] 3790 	jrult print_exit ; colon or end of line 
      009634 A1 02            [ 1] 3791 	cp a,#TK_QSTR
      009636 27 12            [ 1] 3792 	jreq 1$
      009638 A1 03            [ 1] 3793 	cp a,#TK_CHAR 
      00963A 27 13            [ 1] 3794 	jreq 2$ 
      00963C A1 82            [ 1] 3795 	cp a,#TK_CFUNC 
      00963E 27 15            [ 1] 3796 	jreq 3$
      009640 A1 09            [ 1] 3797 	cp a,#TK_COMMA 
      009642 27 18            [ 1] 3798 	jreq 4$
      009644 A1 0A            [ 1] 3799 	cp a,#TK_SHARP 
      009646 27 18            [ 1] 3800 	jreq 5$
      009648 20 28            [ 2] 3801 	jra 7$ 
      00964A                       3802 1$:	; print string 
      00964A CD AA 40         [ 4] 3803 	call puts
      00964D 20 DC            [ 2] 3804 	jra reset_comma
      00964F                       3805 2$:	; print character 
      00964F 9F               [ 1] 3806 	ld a,xl 
      009650 CD 83 8A         [ 4] 3807 	call putc 
      009653 20 D6            [ 2] 3808 	jra reset_comma 
      009655                       3809 3$: ; print character function value  	
      009655 FD               [ 4] 3810 	call (x)
      009656 9F               [ 1] 3811 	ld a,xl 
      009657 CD 83 8A         [ 4] 3812 	call putc
      00965A 20 CF            [ 2] 3813 	jra reset_comma 
      00965C                       3814 4$: ; set comma state 
      00965C 03 01            [ 1] 3815 	cpl (COMMA,sp)
      00965E 20 CD            [ 2] 3816 	jra prt_loop   
      009660                       3817 5$: ; # character must be followed by an integer   
      009660 CD 8A 57         [ 4] 3818 	call next_token
      009663 A1 84            [ 1] 3819 	cp a,#TK_INTGR 
      009665 27 03            [ 1] 3820 	jreq 6$
      009667 CC 89 65         [ 2] 3821 	jp syntax_error 
      00966A                       3822 6$: ; set tab width
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00966A 9F               [ 1] 3823 	ld a,xl 
      00966B A4 0F            [ 1] 3824 	and a,#15 
      00966D C7 00 25         [ 1] 3825 	ld tab_width,a 
      009670 20 B9            [ 2] 3826 	jra reset_comma 
      009672                       3827 7$:	
      0015F2                       3828 	_unget_token 
      009672 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      009677 CD 92 88         [ 4] 3829 	call relation 
      00967A A1 84            [ 1] 3830 	cp a,#TK_INTGR 
      00967C 26 05            [ 1] 3831 	jrne print_exit 
      00967E CD 8A B8         [ 4] 3832     call print_int 
      009681 20 A8            [ 2] 3833 	jra reset_comma 
      009683                       3834 print_exit:
      009683 0D 01            [ 1] 3835 	tnz (COMMA,sp)
      009685 26 05            [ 1] 3836 	jrne 9$
      009687 A6 0D            [ 1] 3837 	ld a,#CR 
      009689 CD 83 8A         [ 4] 3838     call putc 
      00160C                       3839 9$:	_drop VSIZE 
      00968C 5B 01            [ 2]    1     addw sp,#VSIZE 
      00968E 81               [ 4] 3840 	ret 
                                   3841 
                                   3842 ;----------------------
                                   3843 ; 'save_context' and
                                   3844 ; 'rest_context' must be 
                                   3845 ; called at the same 
                                   3846 ; call stack depth 
                                   3847 ; i.e. SP must have the 
                                   3848 ; save value at  
                                   3849 ; entry point of both 
                                   3850 ; routine. 
                                   3851 ;---------------------
                           000004  3852 	CTXT_SIZE=4 ; size of saved data 
                                   3853 ;--------------------
                                   3854 ; save current BASIC
                                   3855 ; interpreter context 
                                   3856 ; on stack 
                                   3857 ;--------------------
      00968F                       3858 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00160F                       3859 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00160F                       3860 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00160F                       3861 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00160F                       3862 save_context:
      00968F CE 00 05         [ 2] 3863 	ldw x,basicptr 
      009692 1F 03            [ 2] 3864 	ldw (BPTR,sp),x
      009694 C6 00 02         [ 1] 3865 	ld a,in 
      009697 6B 05            [ 1] 3866 	ld (IN,sp),a
      009699 C6 00 04         [ 1] 3867 	ld a,count 
      00969C 6B 06            [ 1] 3868 	ld (CNT,sp),a  
      00969E 81               [ 4] 3869 	ret
                                   3870 
                                   3871 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3872 ; restore previously saved 
                                   3873 ; BASIC interpreter context 
                                   3874 ; from stack 
                                   3875 ;-------------------------
      00969F                       3876 rest_context:
      00969F 1E 03            [ 2] 3877 	ldw x,(BPTR,sp)
      0096A1 CF 00 05         [ 2] 3878 	ldw basicptr,x 
      0096A4 7B 05            [ 1] 3879 	ld a,(IN,sp)
      0096A6 C7 00 02         [ 1] 3880 	ld in,a
      0096A9 7B 06            [ 1] 3881 	ld a,(CNT,sp)
      0096AB C7 00 04         [ 1] 3882 	ld count,a  
      0096AE 81               [ 4] 3883 	ret
                                   3884 
                                   3885 
                                   3886 
                                   3887 ;------------------------------------------
                                   3888 ; BASIC: INPUT [string]var[,[string]var]
                                   3889 ; input value in variables 
                                   3890 ; [string] optionally can be used as prompt 
                                   3891 ;-----------------------------------------
                           000001  3892 	CX_BPTR=1
                           000003  3893 	CX_IN=3
                           000004  3894 	CX_CNT=4
                           000005  3895 	SKIP=5
                           000006  3896 	VAR_ADDR=6
                           000007  3897 	VSIZE=7
      0096AF                       3898 input_var:
      00162F                       3899 	_vars VSIZE 
      0096AF 52 07            [ 2]    1     sub sp,#VSIZE 
      0096B1                       3900 input_loop:
      0096B1 0F 05            [ 1] 3901 	clr (SKIP,sp)
      0096B3 CD 8A 57         [ 4] 3902 	call next_token 
      0096B6 A1 02            [ 1] 3903 	cp a,#TK_QSTR 
      0096B8 26 08            [ 1] 3904 	jrne 1$ 
      0096BA CD AA 40         [ 4] 3905 	call puts 
      0096BD 03 05            [ 1] 3906 	cpl (SKIP,sp)
      0096BF CD 8A 57         [ 4] 3907 	call next_token 
      0096C2 A1 85            [ 1] 3908 1$: cp a,#TK_VAR  
      0096C4 27 03            [ 1] 3909 	jreq 2$ 
      0096C6 CC 89 65         [ 2] 3910 	jp syntax_error
      0096C9 1F 06            [ 2] 3911 2$:	ldw (VAR_ADDR,sp),x 
      0096CB 0D 05            [ 1] 3912 	tnz (SKIP,sp)
      0096CD 26 06            [ 1] 3913 	jrne 21$ 
      0096CF CD 94 78         [ 4] 3914 	call var_name 
      0096D2 CD 83 8A         [ 4] 3915 	call putc   
      0096D5                       3916 21$:
      0096D5 A6 3A            [ 1] 3917 	ld a,#':
      0096D7 CD 83 8A         [ 4] 3918 	call putc 
      0096DA CD 96 8F         [ 4] 3919 	call save_context 
      0096DD 72 5F 00 04      [ 1] 3920 	clr count  
      0096E1 CD AB 45         [ 4] 3921 	call readln 
      0096E4 AE 16 90         [ 2] 3922 	ldw x,#tib 
      0096E7 3B 00 04         [ 1] 3923 	push count
      0096EA 4B 00            [ 1] 3924 	push #0 
      0096EC 72 FB 01         [ 2] 3925 	addw x,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0096EF 5C               [ 1] 3926 	incw x 
      001670                       3927 	_drop 2 
      0096F0 5B 02            [ 2]    1     addw sp,#2 
      0096F2 72 5F 00 02      [ 1] 3928 	clr in 
      0096F6 CD 8C E7         [ 4] 3929 	call get_token
      0096F9 A1 84            [ 1] 3930 	cp a,#TK_INTGR
      0096FB 27 06            [ 1] 3931 	jreq 3$ 
      0096FD CD 96 9F         [ 4] 3932 	call rest_context 
      009700 CC 89 65         [ 2] 3933 	jp syntax_error
      009703 16 06            [ 2] 3934 3$: ldw y,(VAR_ADDR,sp) 
      009705 90 FF            [ 2] 3935 	ldw (y),x 
      009707 CD 96 9F         [ 4] 3936 	call rest_context
      00970A CD 8A 57         [ 4] 3937 	call next_token 
      00970D A1 09            [ 1] 3938 	cp a,#TK_COMMA 
      00970F 27 A0            [ 1] 3939 	jreq input_loop 
      009711 A1 01            [ 1] 3940 	cp a,#TK_COLON 
      009713 23 03            [ 2] 3941     jrule input_exit 
      009715 CC 89 65         [ 2] 3942 	jp syntax_error 
      009718                       3943 input_exit:
      001698                       3944 	_drop VSIZE 
      009718 5B 07            [ 2]    1     addw sp,#VSIZE 
      00971A 81               [ 4] 3945 	ret 
                                   3946 
                                   3947 
                                   3948 ;---------------------
                                   3949 ; BASIC: REMARK | ' 
                                   3950 ; skip comment to end of line 
                                   3951 ;---------------------- 
      00971B                       3952 remark:
      00971B 55 00 04 00 02   [ 1] 3953 	mov in,count 
      009720 81               [ 4] 3954  	ret 
                                   3955 
                                   3956 
                                   3957 ;---------------------
                                   3958 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3959 ; read in loop 'addr'  
                                   3960 ; apply & 'mask' to value 
                                   3961 ; loop while result==0.  
                                   3962 ; 'xor_mask' is used to 
                                   3963 ; invert the wait logic.
                                   3964 ; i.e. loop while not 0.
                                   3965 ;---------------------
                           000001  3966 	XMASK=1 
                           000002  3967 	MASK=2
                           000003  3968 	ADDR=3
                           000004  3969 	VSIZE=4
      009721                       3970 wait: 
      0016A1                       3971 	_vars VSIZE
      009721 52 04            [ 2]    1     sub sp,#VSIZE 
      009723 0F 01            [ 1] 3972 	clr (XMASK,sp) 
      009725 CD 91 3D         [ 4] 3973 	call arg_list 
      009728 A1 02            [ 1] 3974 	cp a,#2
      00972A 24 03            [ 1] 3975 	jruge 0$
      00972C CC 89 65         [ 2] 3976 	jp syntax_error 
      00972F A1 03            [ 1] 3977 0$:	cp a,#3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009731 25 04            [ 1] 3978 	jrult 1$
      009733 85               [ 2] 3979 	popw x 
      009734 9F               [ 1] 3980 	ld a,xl
      009735 6B 01            [ 1] 3981 	ld (XMASK,sp),a 
      009737 85               [ 2] 3982 1$: popw x ; mask 
      009738 9F               [ 1] 3983 	ld a,xl 
      009739 6B 02            [ 1] 3984 	ld (MASK,sp),a 
      00973B 85               [ 2] 3985 	popw x ; address 
      00973C F6               [ 1] 3986 2$:	ld a,(x)
      00973D 14 02            [ 1] 3987 	and a,(MASK,sp)
      00973F 18 01            [ 1] 3988 	xor a,(XMASK,sp)
      009741 27 F9            [ 1] 3989 	jreq 2$ 
      0016C3                       3990 	_drop VSIZE 
      009743 5B 04            [ 2]    1     addw sp,#VSIZE 
      009745 81               [ 4] 3991 	ret 
                                   3992 
                                   3993 ;---------------------
                                   3994 ; BASIC: BSET addr,mask
                                   3995 ; set bits at 'addr' corresponding 
                                   3996 ; to those of 'mask' that are at 1.
                                   3997 ; arguments:
                                   3998 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3999 ;   mask        mask|addr
                                   4000 ; output:
                                   4001 ;	none 
                                   4002 ;--------------------------
      009746                       4003 bit_set:
      009746 CD 91 3D         [ 4] 4004 	call arg_list 
      009749 A1 02            [ 1] 4005 	cp a,#2	 
      00974B 27 03            [ 1] 4006 	jreq 1$ 
      00974D CC 89 65         [ 2] 4007 	jp syntax_error
      009750                       4008 1$: 
      009750 85               [ 2] 4009 	popw x ; mask 
      009751 9F               [ 1] 4010 	ld a,xl 
      009752 85               [ 2] 4011 	popw x ; addr  
      009753 FA               [ 1] 4012 	or a,(x)
      009754 F7               [ 1] 4013 	ld (x),a
      009755 81               [ 4] 4014 	ret 
                                   4015 
                                   4016 ;---------------------
                                   4017 ; BASIC: BRES addr,mask
                                   4018 ; reset bits at 'addr' corresponding 
                                   4019 ; to those of 'mask' that are at 1.
                                   4020 ; arguments:
                                   4021 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4022 ;   mask	    ~mask&*addr  
                                   4023 ; output:
                                   4024 ;	none 
                                   4025 ;--------------------------
      009756                       4026 bit_reset:
      009756 CD 91 3D         [ 4] 4027 	call arg_list 
      009759 A1 02            [ 1] 4028 	cp a,#2  
      00975B 27 03            [ 1] 4029 	jreq 1$ 
      00975D CC 89 65         [ 2] 4030 	jp syntax_error
      009760                       4031 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009760 85               [ 2] 4032 	popw x ; mask 
      009761 9F               [ 1] 4033 	ld a,xl 
      009762 43               [ 1] 4034 	cpl a 
      009763 85               [ 2] 4035 	popw x ; addr  
      009764 F4               [ 1] 4036 	and a,(x)
      009765 F7               [ 1] 4037 	ld (x),a 
      009766 81               [ 4] 4038 	ret 
                                   4039 
                                   4040 ;---------------------
                                   4041 ; BASIC: BTOGL addr,mask
                                   4042 ; toggle bits at 'addr' corresponding 
                                   4043 ; to those of 'mask' that are at 1.
                                   4044 ; arguments:
                                   4045 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4046 ;   mask	    mask^*addr  
                                   4047 ; output:
                                   4048 ;	none 
                                   4049 ;--------------------------
      009767                       4050 bit_toggle:
      009767 CD 91 3D         [ 4] 4051 	call arg_list 
      00976A A1 02            [ 1] 4052 	cp a,#2 
      00976C 27 03            [ 1] 4053 	jreq 1$ 
      00976E CC 89 65         [ 2] 4054 	jp syntax_error
      009771 85               [ 2] 4055 1$: popw x ; mask 
      009772 9F               [ 1] 4056 	ld a,xl 
      009773 85               [ 2] 4057 	popw x ; addr  
      009774 F8               [ 1] 4058 	xor a,(x)
      009775 F7               [ 1] 4059 	ld (x),a 
      009776 81               [ 4] 4060 	ret 
                                   4061 
                                   4062 
                                   4063 ;---------------------
                                   4064 ; BASIC: BTEST(addr,bit)
                                   4065 ; return bit value at 'addr' 
                                   4066 ; bit is in range {0..7}.
                                   4067 ; arguments:
                                   4068 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4069 ;   bit 	    bit position {0..7}  
                                   4070 ; output:
                                   4071 ;	none 
                                   4072 ;--------------------------
      009777                       4073 bit_test:
      009777 CD 91 38         [ 4] 4074 	call func_args 
      00977A A1 02            [ 1] 4075 	cp a,#2
      00977C 27 03            [ 1] 4076 	jreq 0$
      00977E CC 89 65         [ 2] 4077 	jp syntax_error
      009781                       4078 0$:	
      009781 85               [ 2] 4079 	popw x 
      009782 9F               [ 1] 4080 	ld a,xl 
      009783 A4 07            [ 1] 4081 	and a,#7
      009785 88               [ 1] 4082 	push a   
      009786 A6 01            [ 1] 4083 	ld a,#1 
      009788 0D 01            [ 1] 4084 1$: tnz (1,sp)
      00978A 27 05            [ 1] 4085 	jreq 2$
      00978C 48               [ 1] 4086 	sll a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00978D 0A 01            [ 1] 4087 	dec (1,sp)
      00978F 20 F7            [ 2] 4088 	jra 1$
      001711                       4089 2$: _drop 1 
      009791 5B 01            [ 2]    1     addw sp,#1 
      009793 85               [ 2] 4090 	popw x 
      009794 F4               [ 1] 4091 	and a,(x)
      009795 27 02            [ 1] 4092 	jreq 3$
      009797 A6 01            [ 1] 4093 	ld a,#1 
      009799 5F               [ 1] 4094 3$:	clrw x 
      00979A 97               [ 1] 4095 	ld xl,a 
      00979B A6 84            [ 1] 4096 	ld a,#TK_INTGR
      00979D 81               [ 4] 4097 	ret
                                   4098 
                                   4099 
                                   4100 ;--------------------
                                   4101 ; BASIC: POKE addr,byte
                                   4102 ; put a byte at addr 
                                   4103 ;--------------------
      00979E                       4104 poke:
      00979E CD 91 3D         [ 4] 4105 	call arg_list 
      0097A1 A1 02            [ 1] 4106 	cp a,#2
      0097A3 27 03            [ 1] 4107 	jreq 1$
      0097A5 CC 89 65         [ 2] 4108 	jp syntax_error
      0097A8                       4109 1$:	
      0097A8 85               [ 2] 4110 	popw x  
      0097A9 9F               [ 1] 4111     ld a,xl 
      0097AA 85               [ 2] 4112 	popw x 
      0097AB F7               [ 1] 4113 	ld (x),a 
      0097AC 81               [ 4] 4114 	ret 
                                   4115 
                                   4116 ;-----------------------
                                   4117 ; BASIC: PEEK(addr)
                                   4118 ; get the byte at addr 
                                   4119 ; input:
                                   4120 ;	none 
                                   4121 ; output:
                                   4122 ;	X 		value 
                                   4123 ;-----------------------
      0097AD                       4124 peek:
      0097AD CD 91 38         [ 4] 4125 	call func_args
      0097B0 A1 01            [ 1] 4126 	cp a,#1 
      0097B2 27 03            [ 1] 4127 	jreq 1$
      0097B4 CC 89 65         [ 2] 4128 	jp syntax_error
      0097B7 85               [ 2] 4129 1$: popw x 
      0097B8 F6               [ 1] 4130 	ld a,(x)
      0097B9 5F               [ 1] 4131 	clrw x 
      0097BA 97               [ 1] 4132 	ld xl,a 
      0097BB A6 84            [ 1] 4133 	ld a,#TK_INTGR
      0097BD 81               [ 4] 4134 	ret 
                                   4135 
                                   4136 ;---------------------------
                                   4137 ; BASIC IF expr : instructions
                                   4138 ; evaluate expr and if true 
                                   4139 ; execute instructions on same line. 
                                   4140 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0097BE                       4141 if: 
      0097BE CD 92 88         [ 4] 4142 	call relation 
      0097C1 A1 84            [ 1] 4143 	cp a,#TK_INTGR
      0097C3 27 03            [ 1] 4144 	jreq 1$ 
      0097C5 CC 89 65         [ 2] 4145 	jp syntax_error
      0097C8 4F               [ 1] 4146 1$:	clr a 
      0097C9 5D               [ 2] 4147 	tnzw x 
      0097CA 26 05            [ 1] 4148 	jrne 9$  
                                   4149 ;skip to next line
      0097CC 55 00 04 00 02   [ 1] 4150 	mov in,count
      0097D1 81               [ 4] 4151 9$:	ret 
                                   4152 
                                   4153 ;------------------------
                                   4154 ; BASIC: FOR var=expr 
                                   4155 ; set variable to expression 
                                   4156 ; leave variable address 
                                   4157 ; on stack and set
                                   4158 ; FLOOP bit in 'flags'
                                   4159 ;-----------------
                           000001  4160 	RETL1=1 ; return address  
                           000003  4161 	FSTEP=3  ; variable increment
                           000005  4162 	LIMIT=5 ; loop limit 
                           000007  4163 	CVAR=7   ; control variable 
                           000009  4164 	INW=9   ;  in.w saved
                           00000B  4165 	BPTR=11 ; baseptr saved
                           00000A  4166 	VSIZE=10  
      0097D2                       4167 for: ; { -- var_addr }
      0097D2 85               [ 2] 4168 	popw x ; call return address 
      001753                       4169 	_vars VSIZE 
      0097D3 52 0A            [ 2]    1     sub sp,#VSIZE 
      0097D5 89               [ 2] 4170 	pushw x  ; RETL1 
      0097D6 A6 85            [ 1] 4171 	ld a,#TK_VAR 
      0097D8 CD 91 2B         [ 4] 4172 	call expect
      0097DB 1F 07            [ 2] 4173 	ldw (CVAR,sp),x  ; control variable 
      0097DD CD 93 68         [ 4] 4174 	call let_var 
      0097E0 72 14 00 24      [ 1] 4175 	bset flags,#FLOOP 
                                   4176 ; open space on stack for loop data 
      0097E4 5F               [ 1] 4177 	clrw x 
      0097E5 1F 0B            [ 2] 4178 	ldw (BPTR,sp),x 
      0097E7 1F 09            [ 2] 4179 	ldw (INW,sp),x 
      0097E9 CD 8A 57         [ 4] 4180 	call next_token 
      0097EC A1 80            [ 1] 4181 	cp a,#TK_CMD 
      0097EE 27 03            [ 1] 4182 	jreq 1$
      0097F0 CC 89 65         [ 2] 4183 	jp syntax_error
      0097F3                       4184 1$:  
      0097F3 A3 97 FB         [ 2] 4185 	cpw x,#to 
      0097F6 27 03            [ 1] 4186 	jreq to
      0097F8 CC 89 65         [ 2] 4187 	jp syntax_error 
                                   4188 
                                   4189 ;-----------------------------------
                                   4190 ; BASIC: TO expr 
                                   4191 ; second part of FOR loop initilization
                                   4192 ; leave limit on stack and set 
                                   4193 ; FTO bit in 'flags'
                                   4194 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0097FB                       4195 to: ; { var_addr -- var_addr limit step }
      0097FB 72 04 00 24 03   [ 2] 4196 	btjt flags,#FLOOP,1$
      009800 CC 89 65         [ 2] 4197 	jp syntax_error
      009803 CD 92 88         [ 4] 4198 1$: call relation  
      009806 A1 84            [ 1] 4199 	cp a,#TK_INTGR 
      009808 27 03            [ 1] 4200 	jreq 2$ 
      00980A CC 89 65         [ 2] 4201 	jp syntax_error
      00980D 1F 05            [ 2] 4202 2$: ldw (LIMIT,sp),x
                                   4203 ;	ldw x,in.w 
      00980F CD 8A 57         [ 4] 4204 	call next_token
      009812 A1 00            [ 1] 4205 	cp a,#TK_NONE  
      009814 27 0E            [ 1] 4206 	jreq 4$ 
      009816 A1 80            [ 1] 4207 	cp a,#TK_CMD
      009818 26 05            [ 1] 4208 	jrne 3$
      00981A A3 98 2B         [ 2] 4209 	cpw x,#step 
      00981D 27 0C            [ 1] 4210 	jreq step
      00981F                       4211 3$:	
      00179F                       4212 	_unget_token   	 
      00981F 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      009824                       4213 4$:	
      009824 AE 00 01         [ 2] 4214 	ldw x,#1   ; default step  
      009827 1F 03            [ 2] 4215 	ldw (FSTEP,sp),x 
      009829 20 14            [ 2] 4216 	jra store_loop_addr 
                                   4217 
                                   4218 
                                   4219 ;----------------------------------
                                   4220 ; BASIC: STEP expr 
                                   4221 ; optional third par of FOR loop
                                   4222 ; initialization. 	
                                   4223 ;------------------------------------
      00982B                       4224 step: ; {var limit -- var limit step}
      00982B 72 04 00 24 03   [ 2] 4225 	btjt flags,#FLOOP,1$
      009830 CC 89 65         [ 2] 4226 	jp syntax_error
      009833 CD 92 88         [ 4] 4227 1$: call relation
      009836 A1 84            [ 1] 4228 	cp a,#TK_INTGR
      009838 27 03            [ 1] 4229 	jreq 2$
      00983A CC 89 65         [ 2] 4230 	jp syntax_error
      00983D 1F 03            [ 2] 4231 2$:	ldw (FSTEP,sp),x ; step
                                   4232 ; leave loop back entry point on cstack 
                                   4233 ; cstack is 1 call deep from interpreter
      00983F                       4234 store_loop_addr:
      00983F CE 00 05         [ 2] 4235 	ldw x,basicptr  
      009842 1F 0B            [ 2] 4236 	ldw (BPTR,sp),x 
      009844 CE 00 01         [ 2] 4237 	ldw x,in.w 
      009847 1F 09            [ 2] 4238 	ldw (INW,sp),x   
      009849 72 15 00 24      [ 1] 4239 	bres flags,#FLOOP 
      00984D 72 5C 00 21      [ 1] 4240 	inc loop_depth  
      009851 81               [ 4] 4241 	ret 
                                   4242 
                                   4243 ;--------------------------------
                                   4244 ; BASIC: NEXT var 
                                   4245 ; FOR loop control 
                                   4246 ; increment variable with step 
                                   4247 ; and compare with limit 
                                   4248 ; loop if threshold not crossed.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4249 ; else stack. 
                                   4250 ; and decrement 'loop_depth' 
                                   4251 ;--------------------------------
      009852                       4252 next: ; {var limit step retl1 -- [var limit step ] }
      009852 72 5D 00 21      [ 1] 4253 	tnz loop_depth 
      009856 26 03            [ 1] 4254 	jrne 1$ 
      009858 CC 89 65         [ 2] 4255 	jp syntax_error 
      00985B                       4256 1$: 
      00985B A6 85            [ 1] 4257 	ld a,#TK_VAR 
      00985D CD 91 2B         [ 4] 4258 	call expect
                                   4259 ; check for good variable after NEXT 	 
      009860 13 07            [ 2] 4260 	cpw x,(CVAR,sp)
      009862 27 03            [ 1] 4261 	jreq 2$  
      009864 CC 89 65         [ 2] 4262 	jp syntax_error ; not the good one 
      009867                       4263 2$: ; increment variable 
      009867 FE               [ 2] 4264 	ldw x,(x)  ; get var value 
      009868 72 FB 03         [ 2] 4265 	addw x,(FSTEP,sp) ; var+step 
      00986B 16 07            [ 2] 4266 	ldw y,(CVAR,sp)
      00986D 90 FF            [ 2] 4267 	ldw (y),x ; save var new value 
                                   4268 ; check sign of STEP  
      00986F A6 80            [ 1] 4269 	ld a,#0x80
      009871 15 03            [ 1] 4270 	bcp a,(FSTEP,sp)
      009873 2A 06            [ 1] 4271 	jrpl 4$
                                   4272 ;negative step 
      009875 13 05            [ 2] 4273 	cpw x,(LIMIT,sp)
      009877 2F 1B            [ 1] 4274 	jrslt loop_done
      009879 20 04            [ 2] 4275 	jra loop_back 
      00987B                       4276 4$: ; positive step
      00987B 13 05            [ 2] 4277 	cpw x,(LIMIT,sp)
      00987D 2C 15            [ 1] 4278 	jrsgt loop_done
      00987F                       4279 loop_back:
      00987F 1E 0B            [ 2] 4280 	ldw x,(BPTR,sp)
      009881 CF 00 05         [ 2] 4281 	ldw basicptr,x 
      009884 72 01 00 24 05   [ 2] 4282 	btjf flags,#FRUN,1$ 
      009889 E6 02            [ 1] 4283 	ld a,(2,x)
      00988B C7 00 04         [ 1] 4284 	ld count,a
      00988E 1E 09            [ 2] 4285 1$:	ldw x,(INW,sp)
      009890 CF 00 01         [ 2] 4286 	ldw in.w,x 
      009893 81               [ 4] 4287 	ret 
      009894                       4288 loop_done:
                                   4289 	; remove loop data from stack  
      009894 85               [ 2] 4290 	popw x
      001815                       4291 	_drop VSIZE 
      009895 5B 0A            [ 2]    1     addw sp,#VSIZE 
      009897 72 5A 00 21      [ 1] 4292 	dec loop_depth 
                                   4293 ;	pushw x 
                                   4294 ;	ret 
      00989B FC               [ 2] 4295 	jp (x)
                                   4296 
                                   4297 ;----------------------------
                                   4298 ; called by goto/gosub
                                   4299 ; to get target line number 
                                   4300 ;---------------------------
      00989C                       4301 get_target_line:
      00989C CD 92 88         [ 4] 4302 	call relation 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      00989F A1 84            [ 1] 4303 	cp a,#TK_INTGR
      0098A1 27 03            [ 1] 4304 	jreq 1$
      0098A3 CC 89 65         [ 2] 4305 	jp syntax_error
      0098A6 CD 84 E1         [ 4] 4306 1$:	call search_lineno  
      0098A9 5D               [ 2] 4307 	tnzw x 
      0098AA 26 05            [ 1] 4308 	jrne 2$ 
      0098AC A6 05            [ 1] 4309 	ld a,#ERR_NO_LINE 
      0098AE CC 89 67         [ 2] 4310 	jp tb_error 
      0098B1 81               [ 4] 4311 2$:	ret 
                                   4312 
                                   4313 ;------------------------
                                   4314 ; BASIC: GOTO line# 
                                   4315 ; jump to line# 
                                   4316 ; here cstack is 2 call deep from interpreter 
                                   4317 ;------------------------
      0098B2                       4318 goto:
      0098B2 72 00 00 24 06   [ 2] 4319 	btjt flags,#FRUN,0$ 
      0098B7 A6 06            [ 1] 4320 	ld a,#ERR_RUN_ONLY
      0098B9 CC 89 67         [ 2] 4321 	jp tb_error 
      0098BC 81               [ 4] 4322 	ret 
      0098BD CD 98 9C         [ 4] 4323 0$:	call get_target_line
      0098C0                       4324 jp_to_target:
      0098C0 CF 00 05         [ 2] 4325 	ldw basicptr,x 
      0098C3 E6 02            [ 1] 4326 	ld a,(2,x)
      0098C5 C7 00 04         [ 1] 4327 	ld count,a 
      0098C8 35 03 00 02      [ 1] 4328 	mov in,#3 
      0098CC 81               [ 4] 4329 	ret 
                                   4330 
                                   4331 
                                   4332 ;--------------------
                                   4333 ; BASIC: GOSUB line#
                                   4334 ; basic subroutine call
                                   4335 ; actual line# and basicptr 
                                   4336 ; are saved on cstack
                                   4337 ; here cstack is 2 call deep from interpreter 
                                   4338 ;--------------------
                           000003  4339 	RET_ADDR=3
                           000005  4340 	RET_INW=5
                           000004  4341 	VSIZE=4  
      0098CD                       4342 gosub:
      0098CD 72 00 00 24 06   [ 2] 4343 	btjt flags,#FRUN,0$ 
      0098D2 A6 06            [ 1] 4344 	ld a,#ERR_RUN_ONLY
      0098D4 CC 89 67         [ 2] 4345 	jp tb_error 
      0098D7 81               [ 4] 4346 	ret 
      0098D8 85               [ 2] 4347 0$:	popw x 
      001859                       4348 	_vars VSIZE  
      0098D9 52 04            [ 2]    1     sub sp,#VSIZE 
      0098DB 89               [ 2] 4349 	pushw x 
      0098DC CE 00 05         [ 2] 4350 	ldw x,basicptr
      0098DF 1F 03            [ 2] 4351 	ldw (RET_ADDR,sp),x 
      0098E1 CD 98 9C         [ 4] 4352 	call get_target_line  
      0098E4 89               [ 2] 4353 	pushw x 
      0098E5 CE 00 01         [ 2] 4354 	ldw x,in.w 
      0098E8 1F 07            [ 2] 4355 	ldw (RET_INW+2,sp),x
      0098EA 85               [ 2] 4356 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0098EB 20 D3            [ 2] 4357 	jra jp_to_target
                                   4358 
                                   4359 ;------------------------
                                   4360 ; BASIC: RETURN 
                                   4361 ; exit from a subroutine 
                                   4362 ; 
                                   4363 ;------------------------
      0098ED                       4364 return:
      0098ED 72 00 00 24 05   [ 2] 4365 	btjt flags,#FRUN,0$ 
      0098F2 A6 06            [ 1] 4366 	ld a,#ERR_RUN_ONLY
      0098F4 CC 89 67         [ 2] 4367 	jp tb_error 
      0098F7                       4368 0$:	
      0098F7 1E 03            [ 2] 4369 	ldw x,(RET_ADDR,sp) 
      0098F9 CF 00 05         [ 2] 4370 	ldw basicptr,x
      0098FC E6 02            [ 1] 4371 	ld a,(2,x)
      0098FE C7 00 04         [ 1] 4372 	ld count,a  
      009901 1E 05            [ 2] 4373 	ldw x,(RET_INW,sp)
      009903 CF 00 01         [ 2] 4374 	ldw in.w,x 
      009906 85               [ 2] 4375 	popw x 
      001887                       4376 	_drop VSIZE 
      009907 5B 04            [ 2]    1     addw sp,#VSIZE 
      009909 89               [ 2] 4377 	pushw x
      00990A 81               [ 4] 4378 	ret  
                                   4379 
                                   4380 
                                   4381 ;----------------------------------
                                   4382 ; BASIC: RUN
                                   4383 ; run BASIC program in RAM
                                   4384 ;----------------------------------- 
      00990B                       4385 run: 
      00990B 72 01 00 24 02   [ 2] 4386 	btjf flags,#FRUN,0$  
      009910 4F               [ 1] 4387 	clr a 
      009911 81               [ 4] 4388 	ret
      009912                       4389 0$: 
      009912 72 09 00 24 12   [ 2] 4390 	btjf flags,#FBREAK,1$
      001897                       4391 	_drop 2 
      009917 5B 02            [ 2]    1     addw sp,#2 
      009919 CD 96 9F         [ 4] 4392 	call rest_context
      00189C                       4393 	_drop CTXT_SIZE 
      00991C 5B 04            [ 2]    1     addw sp,#CTXT_SIZE 
      00991E 72 19 00 24      [ 1] 4394 	bres flags,#FBREAK 
      009922 72 10 00 24      [ 1] 4395 	bset flags,#FRUN 
      009926 CC 8A 0B         [ 2] 4396 	jp interpreter 
      009929 CE 00 1D         [ 2] 4397 1$:	ldw x,txtbgn
      00992C C3 00 1F         [ 2] 4398 	cpw x,txtend 
      00992F 2B 0C            [ 1] 4399 	jrmi run_it 
      009931 AE 88 FE         [ 2] 4400 	ldw x,#err_no_prog
      009934 CD AA 40         [ 4] 4401 	call puts 
      009937 55 00 04 00 02   [ 1] 4402 	mov in,count
      00993C 81               [ 4] 4403 	ret 
      00993D                       4404 run_it:	 
      00993D CD 93 35         [ 4] 4405     call ubound 
      0018C0                       4406 	_drop 2 ; drop return address 
      009940 5B 02            [ 2]    1     addw sp,#2 
                                   4407 ; clear data pointer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009942 5F               [ 1] 4408 	clrw x 
      009943 CF 00 07         [ 2] 4409 	ldw data_ptr,x 
      009946 72 5F 00 09      [ 1] 4410 	clr data_ofs 
      00994A 72 5F 00 0A      [ 1] 4411 	clr data_len 
                                   4412 ; initialize BASIC pointer 
      00994E CE 00 1D         [ 2] 4413 	ldw x,txtbgn 
      009951 CF 00 05         [ 2] 4414 	ldw basicptr,x 
      009954 E6 02            [ 1] 4415 	ld a,(2,x)
      009956 C7 00 04         [ 1] 4416 	ld count,a
      009959 35 03 00 02      [ 1] 4417 	mov in,#3	
      00995D 72 10 00 24      [ 1] 4418 	bset flags,#FRUN 
      009961 CC 8A 0B         [ 2] 4419 	jp interpreter 
                                   4420 
                                   4421 
                                   4422 ;----------------------
                                   4423 ; BASIC: END
                                   4424 ; end running program
                                   4425 ;---------------------- 
      009964                       4426 cmd_end: 
                                   4427 ; clean stack 
      009964 AE 17 FF         [ 2] 4428 	ldw x,#STACK_EMPTY
      009967 94               [ 1] 4429 	ldw sp,x 
      009968 CC 89 EC         [ 2] 4430 	jp warm_start
                                   4431 
                                   4432 ;-----------------
                                   4433 ; 1 Khz beep 
                                   4434 ;-----------------
      00996B                       4435 beep_1khz:: 
      00996B AE 00 64         [ 2] 4436 	ldw x,#100
      00996E 90 AE 03 E8      [ 2] 4437 	ldw y,#1000
      009972 20 0D            [ 2] 4438 	jra beep
                                   4439 
                                   4440 ;-----------------------
                                   4441 ; BASIC: TONE expr1,expr2
                                   4442 ; used TIMER2 channel 1
                                   4443 ; to produce a tone 
                                   4444 ; arguments:
                                   4445 ;    expr1   frequency 
                                   4446 ;    expr2   duration msec.
                                   4447 ;---------------------------
      009974                       4448 tone:
      009974 CD 91 3D         [ 4] 4449 	call arg_list 
      009977 A1 02            [ 1] 4450 	cp a,#2 
      009979 27 03            [ 1] 4451 	jreq 1$
      00997B CC 89 65         [ 2] 4452 	jp syntax_error 
      00997E                       4453 1$: 
      00997E 85               [ 2] 4454 	popw x ; duration
      00997F 90 85            [ 2] 4455 	popw y ; frequency 
      009981                       4456 beep:  
      009981 89               [ 2] 4457 	pushw x 
      009982 AE F4 24         [ 2] 4458 	ldw x,#TIM2_CLK_FREQ
      009985 65               [ 2] 4459 	divw x,y 
                                   4460 ; round to nearest integer 
      009986 90 A3 7A 12      [ 2] 4461 	cpw y,#TIM2_CLK_FREQ/2
      00998A 2B 01            [ 1] 4462 	jrmi 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00998C 5C               [ 1] 4463 	incw x 
      00998D                       4464 2$:	 
      00998D 9E               [ 1] 4465 	ld a,xh 
      00998E C7 53 0D         [ 1] 4466 	ld TIM2_ARRH,a 
      009991 9F               [ 1] 4467 	ld a,xl 
      009992 C7 53 0E         [ 1] 4468 	ld TIM2_ARRL,a 
                                   4469 ; 50% duty cycle 
      009995 8C               [ 1] 4470 	ccf 
      009996 56               [ 2] 4471 	rrcw x 
      009997 9E               [ 1] 4472 	ld a,xh 
      009998 C7 53 0F         [ 1] 4473 	ld TIM2_CCR1H,a 
      00999B 9F               [ 1] 4474 	ld a,xl
      00999C C7 53 10         [ 1] 4475 	ld TIM2_CCR1L,a
      00999F 72 10 53 08      [ 1] 4476 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0099A3 72 10 53 00      [ 1] 4477 	bset TIM2_CR1,#TIM2_CR1_CEN
      0099A7 72 10 53 04      [ 1] 4478 	bset TIM2_EGR,#TIM2_EGR_UG
      0099AB 85               [ 2] 4479 	popw x 
      0099AC CD 9F 31         [ 4] 4480 	call pause02
      0099AF 72 11 53 08      [ 1] 4481 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0099B3 72 11 53 00      [ 1] 4482 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0099B7 81               [ 4] 4483 	ret 
                                   4484 
                                   4485 ;-------------------------------
                                   4486 ; BASIC: ADCON 0|1 [,divisor]  
                                   4487 ; disable/enanble ADC 
                                   4488 ;-------------------------------
                           000003  4489 	ONOFF=3 
                           000001  4490 	DIVSOR=1
                           000004  4491 	VSIZE=4 
      0099B8                       4492 power_adc:
      0099B8 CD 91 3D         [ 4] 4493 	call arg_list 
      0099BB A1 02            [ 1] 4494 	cp a,#2	
      0099BD 27 0B            [ 1] 4495 	jreq 1$
      0099BF A1 01            [ 1] 4496 	cp a,#1 
      0099C1 27 03            [ 1] 4497 	jreq 0$ 
      0099C3 CC 89 65         [ 2] 4498 	jp syntax_error 
      0099C6 AE 00 00         [ 2] 4499 0$: ldw x,#0
      0099C9 89               [ 2] 4500 	pushw x  ; divisor 
      0099CA 1E 03            [ 2] 4501 1$: ldw x,(ONOFF,sp)
      0099CC 5D               [ 2] 4502 	tnzw x 
      0099CD 27 1A            [ 1] 4503 	jreq 2$ 
      0099CF 1E 01            [ 2] 4504 	ldw x,(DIVSOR,sp) ; divisor 
      0099D1 9F               [ 1] 4505 	ld a,xl
      0099D2 A4 07            [ 1] 4506 	and a,#7
      0099D4 4E               [ 1] 4507 	swap a 
      0099D5 C7 54 01         [ 1] 4508 	ld ADC_CR1,a
      0099D8 72 16 50 CA      [ 1] 4509 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0099DC 72 10 54 01      [ 1] 4510 	bset ADC_CR1,#ADC_CR1_ADON 
      001960                       4511 	_usec_dly 7 
      0099E0 AE 00 1B         [ 2]    1     ldw x,#(16*7-2)/4
      0099E3 5A               [ 2]    2     decw x
      0099E4 9D               [ 1]    3     nop 
      0099E5 26 FA            [ 1]    4     jrne .-4
      0099E7 20 08            [ 2] 4512 	jra 3$
      0099E9 72 11 54 01      [ 1] 4513 2$: bres ADC_CR1,#ADC_CR1_ADON
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0099ED 72 17 50 CA      [ 1] 4514 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001971                       4515 3$:	_drop VSIZE 
      0099F1 5B 04            [ 2]    1     addw sp,#VSIZE 
      0099F3 81               [ 4] 4516 	ret
                                   4517 
                                   4518 ;-----------------------------
                                   4519 ; BASIC: ADCREAD (channel)
                                   4520 ; read adc channel {0..5}
                                   4521 ; output:
                                   4522 ;   A 		TK_INTGR 
                                   4523 ;   X 		value 
                                   4524 ;-----------------------------
      0099F4                       4525 analog_read:
      0099F4 CD 91 38         [ 4] 4526 	call func_args 
      0099F7 A1 01            [ 1] 4527 	cp a,#1 
      0099F9 27 03            [ 1] 4528 	jreq 1$
      0099FB CC 89 65         [ 2] 4529 	jp syntax_error
      0099FE 85               [ 2] 4530 1$: popw x 
      0099FF A3 00 05         [ 2] 4531 	cpw x,#5 
      009A02 23 05            [ 2] 4532 	jrule 2$
      009A04 A6 0A            [ 1] 4533 	ld a,#ERR_BAD_VALUE
      009A06 CC 89 67         [ 2] 4534 	jp tb_error 
      009A09 9F               [ 1] 4535 2$: ld a,xl
      009A0A C7 00 0E         [ 1] 4536 	ld acc8,a 
      009A0D A6 05            [ 1] 4537 	ld a,#5
      009A0F C0 00 0E         [ 1] 4538 	sub a,acc8 
      009A12 C7 54 00         [ 1] 4539 	ld ADC_CSR,a
      009A15 72 16 54 02      [ 1] 4540 	bset ADC_CR2,#ADC_CR2_ALIGN
      009A19 72 10 54 01      [ 1] 4541 	bset ADC_CR1,#ADC_CR1_ADON
      009A1D 72 0F 54 00 FB   [ 2] 4542 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009A22 CE 54 04         [ 2] 4543 	ldw x,ADC_DRH
      009A25 A6 84            [ 1] 4544 	ld a,#TK_INTGR
      009A27 81               [ 4] 4545 	ret 
                                   4546 
                                   4547 ;-----------------------
                                   4548 ; BASIC: DREAD(pin)
                                   4549 ; Arduino pins 
                                   4550 ; read state of a digital pin 
                                   4551 ; pin# {0..15}
                                   4552 ; output:
                                   4553 ;    A 		TK_INTGR
                                   4554 ;    X      0|1 
                                   4555 ;-------------------------
                           000001  4556 	PINNO=1
                           000001  4557 	VSIZE=1
      009A28                       4558 digital_read:
      0019A8                       4559 	_vars VSIZE 
      009A28 52 01            [ 2]    1     sub sp,#VSIZE 
      009A2A CD 91 38         [ 4] 4560 	call func_args
      009A2D A1 01            [ 1] 4561 	cp a,#1
      009A2F 27 03            [ 1] 4562 	jreq 1$
      009A31 CC 89 65         [ 2] 4563 	jp syntax_error
      009A34 85               [ 2] 4564 1$: popw x 
      009A35 A3 00 0F         [ 2] 4565 	cpw x,#15 
      009A38 23 05            [ 2] 4566 	jrule 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009A3A A6 0A            [ 1] 4567 	ld a,#ERR_BAD_VALUE
      009A3C CC 89 67         [ 2] 4568 	jp tb_error 
      009A3F CD A0 6F         [ 4] 4569 2$:	call select_pin 
      009A42 6B 01            [ 1] 4570 	ld (PINNO,sp),a
      009A44 E6 01            [ 1] 4571 	ld a,(GPIO_IDR,x)
      009A46 0D 01            [ 1] 4572 	tnz (PINNO,sp)
      009A48 27 05            [ 1] 4573 	jreq 8$
      009A4A 44               [ 1] 4574 3$: srl a 
      009A4B 0A 01            [ 1] 4575 	dec (PINNO,sp)
      009A4D 26 FB            [ 1] 4576 	jrne 3$ 
      009A4F A4 01            [ 1] 4577 8$: and a,#1 
      009A51 5F               [ 1] 4578 	clrw x 
      009A52 97               [ 1] 4579 	ld xl,a 
      009A53 A6 84            [ 1] 4580 	ld a,#TK_INTGR
      0019D5                       4581 	_drop VSIZE
      009A55 5B 01            [ 2]    1     addw sp,#VSIZE 
      009A57 81               [ 4] 4582 	ret
                                   4583 
                                   4584 ;-----------------------
                                   4585 ; BASIC: DWRITE pin,0|1
                                   4586 ; Arduino pins 
                                   4587 ; write to a digital pin 
                                   4588 ; pin# {0..15}
                                   4589 ; output:
                                   4590 ;    A 		TK_INTGR
                                   4591 ;    X      0|1 
                                   4592 ;-------------------------
                           000001  4593 	PINNO=1
                           000002  4594 	PINVAL=2
                           000002  4595 	VSIZE=2
      009A58                       4596 digital_write:
      0019D8                       4597 	_vars VSIZE 
      009A58 52 02            [ 2]    1     sub sp,#VSIZE 
      009A5A CD 91 3D         [ 4] 4598 	call arg_list  
      009A5D A1 02            [ 1] 4599 	cp a,#2 
      009A5F 27 03            [ 1] 4600 	jreq 1$
      009A61 CC 89 65         [ 2] 4601 	jp syntax_error
      009A64 85               [ 2] 4602 1$: popw x 
      009A65 9F               [ 1] 4603 	ld a,xl 
      009A66 6B 02            [ 1] 4604 	ld (PINVAL,sp),a
      009A68 85               [ 2] 4605 	popw x 
      009A69 A3 00 0F         [ 2] 4606 	cpw x,#15 
      009A6C 23 05            [ 2] 4607 	jrule 2$
      009A6E A6 0A            [ 1] 4608 	ld a,#ERR_BAD_VALUE
      009A70 CC 89 67         [ 2] 4609 	jp tb_error 
      009A73 CD A0 6F         [ 4] 4610 2$:	call select_pin 
      009A76 6B 01            [ 1] 4611 	ld (PINNO,sp),a 
      009A78 A6 01            [ 1] 4612 	ld a,#1
      009A7A 0D 01            [ 1] 4613 	tnz (PINNO,sp)
      009A7C 27 05            [ 1] 4614 	jreq 4$
      009A7E 48               [ 1] 4615 3$: sll a
      009A7F 0A 01            [ 1] 4616 	dec (PINNO,sp)
      009A81 26 FB            [ 1] 4617 	jrne 3$
      009A83 0D 02            [ 1] 4618 4$: tnz (PINVAL,sp)
      009A85 26 05            [ 1] 4619 	jrne 5$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009A87 43               [ 1] 4620 	cpl a 
      009A88 E4 00            [ 1] 4621 	and a,(GPIO_ODR,x)
      009A8A 20 02            [ 2] 4622 	jra 8$
      009A8C EA 00            [ 1] 4623 5$: or a,(GPIO_ODR,x)
      009A8E E7 00            [ 1] 4624 8$: ld (GPIO_ODR,x),a 
      001A10                       4625 	_drop VSIZE 
      009A90 5B 02            [ 2]    1     addw sp,#VSIZE 
      009A92 81               [ 4] 4626 	ret
                                   4627 
                                   4628 
                                   4629 ;-----------------------
                                   4630 ; BASIC: STOP
                                   4631 ; stop progam execution  
                                   4632 ; without resetting pointers 
                                   4633 ; the program is resumed
                                   4634 ; with RUN 
                                   4635 ;-------------------------
      009A93                       4636 stop:
      009A93 72 00 00 24 02   [ 2] 4637 	btjt flags,#FRUN,2$
      009A98 4F               [ 1] 4638 	clr a
      009A99 81               [ 4] 4639 	ret 
      009A9A                       4640 2$:	 
                                   4641 ; create space on cstack to save context 
      009A9A AE 9A C1         [ 2] 4642 	ldw x,#break_point 
      009A9D CD AA 40         [ 4] 4643 	call puts 
      001A20                       4644 	_drop 2 ;drop return address 
      009AA0 5B 02            [ 2]    1     addw sp,#2 
      001A22                       4645 	_vars CTXT_SIZE ; context size 
      009AA2 52 04            [ 2]    1     sub sp,#CTXT_SIZE 
      009AA4 CD 96 8F         [ 4] 4646 	call save_context 
      009AA7 AE 16 90         [ 2] 4647 	ldw x,#tib 
      009AAA CF 00 05         [ 2] 4648 	ldw basicptr,x
      009AAD 7F               [ 1] 4649 	clr (x)
      009AAE 72 5F 00 04      [ 1] 4650 	clr count  
      009AB2 5F               [ 1] 4651 	clrw x 
      009AB3 CF 00 01         [ 2] 4652 	ldw in.w,x
      009AB6 72 11 00 24      [ 1] 4653 	bres flags,#FRUN 
      009ABA 72 18 00 24      [ 1] 4654 	bset flags,#FBREAK
      009ABE CC 8A 0B         [ 2] 4655 	jp interpreter 
      009AC1 0A 62 72 65 61 6B 20  4656 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4657 
                                   4658 ;-----------------------
                                   4659 ; BASIC: NEW
                                   4660 ; from command line only 
                                   4661 ; free program memory
                                   4662 ; and clear variables 
                                   4663 ;------------------------
      009ADF                       4664 new: 
      009ADF 72 01 00 24 01   [ 2] 4665 	btjf flags,#FRUN,0$ 
      009AE4 81               [ 4] 4666 	ret 
      009AE5                       4667 0$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009AE5 CD 87 CF         [ 4] 4668 	call clear_basic 
      009AE8 81               [ 4] 4669 	ret 
                                   4670 	 
                                   4671 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4672 ;  file system routines
                                   4673 ;  MCU flash memory from
                                   4674 ;  0x10000-0x27fff is 
                                   4675 ;  used to store BASIC 
                                   4676 ;  program files. 
                                   4677 ;  use 128 bytes sectors
                                   4678 ;  because this is the MCU 
                                   4679 ;  row size.
                                   4680 ;  file entry aligned to row
                                   4681 ;  	name  variable length
                                   4682 ;  	size  2 bytes  
                                   4683 ; 	data  variable length 
                                   4684 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4685 
                                   4686 ;---------------------------
                                   4687 ; fill pad with zeros 
                                   4688 ;--------------------------
      009AE9                       4689 zero_pad:
      009AE9 AE 16 E0         [ 2] 4690 	ldw x,#pad 
      009AEC A6 80            [ 1] 4691 	ld a,#PAD_SIZE 
      009AEE 7F               [ 1] 4692 1$:	clr (x)
      009AEF 5C               [ 1] 4693 	incw x 
      009AF0 4A               [ 1] 4694 	dec a 
      009AF1 26 FB            [ 1] 4695 	jrne 1$
      009AF3 81               [ 4] 4696 	ret 
                                   4697 
                                   4698 ;--------------------------
                                   4699 ; align farptr to BLOCK_SIZE 
                                   4700 ;---------------------------
      009AF4                       4701 row_align:
      009AF4 A6 7F            [ 1] 4702 	ld a,#0x7f 
      009AF6 C4 00 19         [ 1] 4703 	and a,farptr+2 
      009AF9 27 13            [ 1] 4704 	jreq 1$ 
      009AFB CE 00 18         [ 2] 4705 	ldw x,farptr+1 
      009AFE 1C 00 80         [ 2] 4706 	addw x,#BLOCK_SIZE 
      009B01 24 04            [ 1] 4707 	jrnc 0$
      009B03 72 5C 00 17      [ 1] 4708 	inc farptr 
      009B07 9F               [ 1] 4709 0$: ld a,xl 
      009B08 A4 80            [ 1] 4710 	and a,#0x80
      009B0A 97               [ 1] 4711 	ld xl,a
      009B0B CF 00 18         [ 2] 4712 	ldw farptr+1,x  	
      009B0E 81               [ 4] 4713 1$:	ret
                                   4714 
                                   4715 ;--------------------
                                   4716 ; input:
                                   4717 ;   X     increment 
                                   4718 ; output:
                                   4719 ;   farptr  incremented 
                                   4720 ;---------------------
      009B0F                       4721 incr_farptr:
      009B0F 72 BB 00 18      [ 2] 4722 	addw x,farptr+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009B13 24 04            [ 1] 4723 	jrnc 1$
      009B15 72 5C 00 17      [ 1] 4724 	inc farptr 
      009B19 CF 00 18         [ 2] 4725 1$:	ldw farptr+1,x  
      009B1C 81               [ 4] 4726 	ret 
                                   4727 
                                   4728 ;------------------------------
                                   4729 ; extended flash memory used as FLASH_DRIVE 
                                   4730 ; seek end of used flash drive   
                                   4731 ; starting at 0x10000 address.
                                   4732 ; 4 consecutives 0 bytes signal free space. 
                                   4733 ; input:
                                   4734 ;	none
                                   4735 ; output:
                                   4736 ;   ffree     free_addr| 0 if memory full.
                                   4737 ;------------------------------
      009B1D                       4738 seek_fdrive:
                                   4739 ; start scan at 0x10000 address 
      009B1D A6 01            [ 1] 4740 	ld a,#1
      009B1F C7 00 17         [ 1] 4741 	ld farptr,a 
      009B22 5F               [ 1] 4742 	clrw x 
      009B23 CF 00 18         [ 2] 4743 	ldw farptr+1,x 
      009B26                       4744 1$:
      009B26 AE 00 03         [ 2] 4745 	ldw x,#3  
      009B29 92 AF 00 17      [ 5] 4746 2$:	ldf a,([farptr],x) 
      009B2D 26 05            [ 1] 4747 	jrne 3$
      009B2F 5A               [ 2] 4748 	decw x
      009B30 2A F7            [ 1] 4749 	jrpl 2$
      009B32 20 0E            [ 2] 4750 	jra 4$ 
      009B34 AE 00 80         [ 2] 4751 3$:	ldw x,#BLOCK_SIZE 
      009B37 CD 9B 0F         [ 4] 4752 	call incr_farptr
      009B3A AE 02 80         [ 2] 4753 	ldw x,#0x280  
      009B3D C3 00 17         [ 2] 4754 	cpw x,farptr
      009B40 2B E4            [ 1] 4755 	jrmi 1$
      009B42                       4756 4$: ; copy farptr to ffree	 
      009B42 CE 00 17         [ 2] 4757 	ldw x,farptr 
      009B45 C6 00 19         [ 1] 4758 	ld a,farptr+2 
      009B48 CF 00 1A         [ 2] 4759 	ldw ffree,x 
      009B4B C7 00 1C         [ 1] 4760 	ld ffree+2,a  
      009B4E 81               [ 4] 4761 	ret 
                                   4762 
                                   4763 ;-----------------------
                                   4764 ; return amount of free 
                                   4765 ; space on flash drive
                                   4766 ; input:
                                   4767 ;   none
                                   4768 ; output:
                                   4769 ;   acc24   free space 
                                   4770 ;-----------------------
      009B4F                       4771 disk_free:
      009B4F AE 80 00         [ 2] 4772 	ldw x,#0x8000
      009B52 72 B0 00 1B      [ 2] 4773 	subw x,ffree+1
      009B56 A6 02            [ 1] 4774 	ld a,#2
      009B58 C2 00 1A         [ 1] 4775 	sbc a,ffree 
      009B5B C7 00 0C         [ 1] 4776 	ld acc24,a 
      009B5E CF 00 0D         [ 2] 4777 	ldw acc16,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009B61 81               [ 4] 4778 	ret 
                                   4779 
                                   4780 ;-----------------------
                                   4781 ; compare file name 
                                   4782 ; with name pointed by Y  
                                   4783 ; input:
                                   4784 ;   farptr   file name 
                                   4785 ;   Y        target name 
                                   4786 ; output:
                                   4787 ;   farptr 	 at file_name
                                   4788 ;   X 		 farptr[x] point at size field  
                                   4789 ;   Carry    0|1 no match|match  
                                   4790 ;----------------------
      009B62                       4791 cmp_name:
      009B62 5F               [ 1] 4792 	clrw x
      009B63 92 AF 00 17      [ 5] 4793 1$:	ldf a,([farptr],x)
      009B67 90 F1            [ 1] 4794 	cp a,(y)
      009B69 26 08            [ 1] 4795 	jrne 4$
      009B6B 4D               [ 1] 4796 	tnz a 
      009B6C 27 12            [ 1] 4797 	jreq 9$ 
      009B6E 5C               [ 1] 4798     incw x 
      009B6F 90 5C            [ 1] 4799 	incw y 
      009B71 20 F0            [ 2] 4800 	jra 1$
      009B73                       4801 4$: ;no match 
      009B73 4D               [ 1] 4802 	tnz a 
      009B74 27 07            [ 1] 4803 	jreq 5$
      009B76 5C               [ 1] 4804 	incw x 
      009B77 92 AF 00 17      [ 5] 4805 	ldf a,([farptr],x)
      009B7B 20 F6            [ 2] 4806 	jra 4$  
      009B7D 5C               [ 1] 4807 5$:	incw x ; farptr[x] point at 'size' field 
      009B7E 98               [ 1] 4808 	rcf 
      009B7F 81               [ 4] 4809 	ret
      009B80                       4810 9$: ; match  
      009B80 5C               [ 1] 4811 	incw x  ; farptr[x] at 'size' field 
      009B81 99               [ 1] 4812 	scf 
      009B82 81               [ 4] 4813 	ret 
                                   4814 
                                   4815 ;-----------------------
                                   4816 ; search file in 
                                   4817 ; flash memory 
                                   4818 ; input:
                                   4819 ;   Y       file name  
                                   4820 ; output:
                                   4821 ;   farptr  addr at name|0
                                   4822 ;   X       offset to size field
                                   4823 ;-----------------------
                           000001  4824 	FSIZE=1
                           000003  4825 	YSAVE=3
                           000004  4826 	VSIZE=4 
      009B83                       4827 search_file: 
      001B03                       4828 	_vars VSIZE
      009B83 52 04            [ 2]    1     sub sp,#VSIZE 
      009B85 17 03            [ 2] 4829 	ldw (YSAVE,sp),y  
      009B87 5F               [ 1] 4830 	clrw x 
      009B88 CF 00 18         [ 2] 4831 	ldw farptr+1,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009B8B 35 01 00 17      [ 1] 4832 	mov farptr,#1
      009B8F                       4833 1$:	
                                   4834 ; check if farptr is after any file 
                                   4835 ; if  0 then so.
      009B8F 92 BC 00 17      [ 5] 4836 	ldf a,[farptr]
      009B93 27 27            [ 1] 4837 	jreq 6$
      009B95 5F               [ 1] 4838 2$: clrw x 	
      009B96 16 03            [ 2] 4839 	ldw y,(YSAVE,sp) 
      009B98 CD 9B 62         [ 4] 4840 	call cmp_name
      009B9B 25 2F            [ 1] 4841 	jrc 9$
      009B9D 92 AF 00 17      [ 5] 4842 	ldf a,([farptr],x)
      009BA1 6B 01            [ 1] 4843 	ld (FSIZE,sp),a 
      009BA3 5C               [ 1] 4844 	incw x 
      009BA4 92 AF 00 17      [ 5] 4845 	ldf a,([farptr],x)
      009BA8 6B 02            [ 1] 4846 	ld (FSIZE+1,sp),a 
      009BAA 5C               [ 1] 4847 	incw x 
      009BAB 72 FB 01         [ 2] 4848 	addw x,(FSIZE,sp) ; skip over file data
      009BAE CD 9B 0F         [ 4] 4849 	call incr_farptr
      009BB1 CD 9A F4         [ 4] 4850 	call row_align  
      009BB4 AE 02 80         [ 2] 4851 	ldw x,#0x280
      009BB7 C3 00 17         [ 2] 4852 	cpw x,farptr 
      009BBA 2A D3            [ 1] 4853 	jrpl 1$
      009BBC                       4854 6$: ; file not found 
      009BBC 72 5F 00 17      [ 1] 4855 	clr farptr
      009BC0 72 5F 00 18      [ 1] 4856 	clr farptr+1 
      009BC4 72 5F 00 19      [ 1] 4857 	clr farptr+2 
      001B48                       4858 	_drop VSIZE 
      009BC8 5B 04            [ 2]    1     addw sp,#VSIZE 
      009BCA 98               [ 1] 4859 	rcf
      009BCB 81               [ 4] 4860 	ret
      009BCC                       4861 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001B4C                       4862 	_drop VSIZE 
      009BCC 5B 04            [ 2]    1     addw sp,#VSIZE 
      009BCE 99               [ 1] 4863 	scf 	
      009BCF 81               [ 4] 4864 	ret
                                   4865 
                                   4866 ;--------------------------------
                                   4867 ; BASIC: SAVE "name" 
                                   4868 ; save text program in 
                                   4869 ; flash memory used as permanent
                                   4870 ; storage from address 0x10000-0x27fff 
                                   4871 ;--------------------------------
                           000001  4872 	BSIZE=1
                           000003  4873 	NAMEPTR=3
                           000005  4874 	XSAVE=5
                           000007  4875 	YSAVE=7
                           000008  4876 	VSIZE=8 
      009BD0                       4877 save:
      009BD0 72 01 00 24 05   [ 2] 4878 	btjf flags,#FRUN,0$ 
      009BD5 A6 07            [ 1] 4879 	ld a,#ERR_CMD_ONLY 
      009BD7 CC 89 67         [ 2] 4880 	jp tb_error
      009BDA                       4881 0$:	 
      009BDA CE 00 1F         [ 2] 4882 	ldw x,txtend 
      009BDD 72 B0 00 1D      [ 2] 4883 	subw x,txtbgn
      009BE1 26 0C            [ 1] 4884 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                   4885 ; nothing to save 
      009BE3 AE 88 FE         [ 2] 4886 	ldw x,#err_no_prog 
      009BE6 CD AA 40         [ 4] 4887 	call puts 
      009BE9 55 00 04 00 02   [ 1] 4888 	mov in,count 
      009BEE 81               [ 4] 4889 	ret  	
      009BEF                       4890 1$:	
      001B6F                       4891 	_vars VSIZE 
      009BEF 52 08            [ 2]    1     sub sp,#VSIZE 
      009BF1 1F 01            [ 2] 4892 	ldw (BSIZE,sp),x 
      009BF3 CD 8A 57         [ 4] 4893 	call next_token	
      009BF6 A1 02            [ 1] 4894 	cp a,#TK_QSTR
      009BF8 27 03            [ 1] 4895 	jreq 2$
      009BFA CC 89 65         [ 2] 4896 	jp syntax_error
      009BFD                       4897 2$: 
      009BFD 1F 03            [ 2] 4898 	ldw (NAMEPTR,sp),x  
      009BFF CD 82 03         [ 4] 4899 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4900 ; check if enough free space 
      009C02 CD 84 75         [ 4] 4901 	call strlen 
      009C05 AB 03            [ 1] 4902 	add a,#3
      009C07 5F               [ 1] 4903 	clrw x 
      009C08 97               [ 1] 4904 	ld xl,a 
      009C09 72 FB 01         [ 2] 4905 	addw x,(BSIZE,sp)
      009C0C 4F               [ 1] 4906 	clr a 
      009C0D 72 BB 00 1B      [ 2] 4907 	addw x,ffree+1 
      009C11 C9 00 1A         [ 1] 4908 	adc a,ffree 
      009C14 A1 02            [ 1] 4909 	cp a,#2
      009C16 2B 0A            [ 1] 4910 	jrmi 21$
      009C18 A3 80 00         [ 2] 4911 	cpw x,#0x8000
      009C1B 2B 05            [ 1] 4912 	jrmi 21$
      009C1D A6 0E            [ 1] 4913 	ld a,#ERR_NO_FSPACE  
      009C1F CC 89 67         [ 2] 4914 	jp tb_error
      009C22                       4915 21$: 
                                   4916 ; check for existing file of that name 
      009C22 16 03            [ 2] 4917 	ldw y,(NAMEPTR,sp)	
      009C24 CD 9B 83         [ 4] 4918 	call search_file 
      009C27 24 05            [ 1] 4919 	jrnc 3$ 
      009C29 A6 08            [ 1] 4920 	ld a,#ERR_DUPLICATE 
      009C2B CC 89 67         [ 2] 4921 	jp tb_error 
      009C2E                       4922 3$:	; initialize farptr 
      009C2E CE 00 1A         [ 2] 4923 	ldw x,ffree 
      009C31 C6 00 1C         [ 1] 4924 	ld a,ffree+2 
      009C34 CF 00 17         [ 2] 4925 	ldw farptr,x 
      009C37 C7 00 19         [ 1] 4926 	ld farptr+2,a 
                                   4927 ;** write file name to row buffer **	
      009C3A 16 03            [ 2] 4928 	ldw y,(NAMEPTR,sp)  
      009C3C AE 16 E0         [ 2] 4929 	ldw x,#pad 
      009C3F CD 84 91         [ 4] 4930 	call strcpy
      009C42 CD 84 75         [ 4] 4931 	call strlen 
      009C45 5F               [ 1] 4932 	clrw x 
      009C46 97               [ 1] 4933 	ld xl,a 
      009C47 5C               [ 1] 4934 	incw  x
      009C48 1C 16 E0         [ 2] 4935 	addw x,#pad 
                                   4936 ; ** write file size to row buffer 
      009C4B 16 01            [ 2] 4937 	ldw y,(BSIZE,sp)
      009C4D FF               [ 2] 4938 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009C4E 1C 00 02         [ 2] 4939 	addw x,#2 
                                   4940 ; ** write file data to row buffer 
      009C51 90 CE 00 1D      [ 2] 4941 	ldw y,txtbgn 
      009C55 90 F6            [ 1] 4942 6$:	ld a,(y)
      009C57 90 5C            [ 1] 4943 	incw y
      009C59 F7               [ 1] 4944 	ld (x),a 
      009C5A 5C               [ 1] 4945 	incw x
      009C5B 90 C3 00 1F      [ 2] 4946 	cpw y,txtend 
      009C5F 27 05            [ 1] 4947 	jreq 12$
      009C61 A3 17 60         [ 2] 4948 	cpw x,#stack_full 
      009C64 2B EF            [ 1] 4949 	jrmi 6$
      009C66                       4950 12$:
      009C66 17 07            [ 2] 4951 	ldw (YSAVE,sp),y 
      009C68                       4952 14$: ; zero buffer end 
      009C68 A3 17 60         [ 2] 4953 	cpw x,#stack_full
      009C6B 27 04            [ 1] 4954 	jreq 16$
      009C6D 7F               [ 1] 4955 	clr (x)
      009C6E 5C               [ 1] 4956 	incw x 
      009C6F 20 F7            [ 2] 4957 	jra 14$
      009C71                       4958 16$:
      009C71 AE 16 E0         [ 2] 4959 	ldw x,#pad 
      009C74 CD 82 17         [ 4] 4960 	call write_row 
      009C77 AE 00 80         [ 2] 4961 	ldw x,#BLOCK_SIZE 
      009C7A CD 9B 0F         [ 4] 4962 	call incr_farptr
      009C7D AE 16 E0         [ 2] 4963 	ldw x,#pad 
      009C80 16 07            [ 2] 4964 	ldw y,(YSAVE,sp)
      009C82 90 C3 00 1F      [ 2] 4965 	cpw y,txtend 
      009C86 2B CD            [ 1] 4966 	jrmi 6$
                                   4967 ; save farptr in ffree
      009C88 CE 00 17         [ 2] 4968 	ldw x,farptr 
      009C8B C6 00 19         [ 1] 4969 	ld a,farptr+2 
      009C8E CF 00 1A         [ 2] 4970 	ldw ffree,x 
      009C91 C7 00 1C         [ 1] 4971 	ld ffree+2,a
                                   4972 ; print file size 	
      009C94 1E 01            [ 2] 4973 	ldw x,(BSIZE,sp) 
      009C96 CD 8A B8         [ 4] 4974 	call print_int 
      001C19                       4975 	_drop VSIZE 
      009C99 5B 08            [ 2]    1     addw sp,#VSIZE 
      009C9B 81               [ 4] 4976 	ret 
                                   4977 
                                   4978 ;----------------------
                                   4979 ; load file in RAM memory
                                   4980 ; input:
                                   4981 ;    farptr point at file size 
                                   4982 ; output:
                                   4983 ;   y point after BASIC program in RAM.
                                   4984 ;------------------------
      009C9C                       4985 load_file:
      009C9C CD 9B 0F         [ 4] 4986 	call incr_farptr  
      009C9F CD 87 CF         [ 4] 4987 	call clear_basic  
      009CA2 5F               [ 1] 4988 	clrw x
      009CA3 92 AF 00 17      [ 5] 4989 	ldf a,([farptr],x)
      009CA7 90 95            [ 1] 4990 	ld yh,a 
      009CA9 5C               [ 1] 4991 	incw x  
      009CAA 92 AF 00 17      [ 5] 4992 	ldf a,([farptr],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009CAE 5C               [ 1] 4993 	incw x 
      009CAF 90 97            [ 1] 4994 	ld yl,a 
      009CB1 72 B9 00 1D      [ 2] 4995 	addw y,txtbgn
      009CB5 90 CF 00 1F      [ 2] 4996 	ldw txtend,y
      009CB9 90 CE 00 1D      [ 2] 4997 	ldw y,txtbgn
      009CBD                       4998 3$:	; load BASIC text 	
      009CBD 92 AF 00 17      [ 5] 4999 	ldf a,([farptr],x)
      009CC1 90 F7            [ 1] 5000 	ld (y),a 
      009CC3 5C               [ 1] 5001 	incw x 
      009CC4 90 5C            [ 1] 5002 	incw y 
      009CC6 90 C3 00 1F      [ 2] 5003 	cpw y,txtend 
      009CCA 2B F1            [ 1] 5004 	jrmi 3$
      009CCC 81               [ 4] 5005 	ret 
                                   5006 
                                   5007 ;------------------------
                                   5008 ; BASIC: LOAD "file" 
                                   5009 ; load file to RAM 
                                   5010 ; for execution 
                                   5011 ;------------------------
      009CCD                       5012 load:
      009CCD 72 01 00 24 07   [ 2] 5013 	btjf flags,#FRUN,0$ 
      009CD2 27 05            [ 1] 5014 	jreq 0$ 
      009CD4 A6 07            [ 1] 5015 	ld a,#ERR_CMD_ONLY 
      009CD6 CC 89 67         [ 2] 5016 	jp tb_error 
      009CD9                       5017 0$:	
      009CD9 CD 8A 57         [ 4] 5018 	call next_token 
      009CDC A1 02            [ 1] 5019 	cp a,#TK_QSTR
      009CDE 27 03            [ 1] 5020 	jreq 1$
      009CE0 CC 89 65         [ 2] 5021 	jp syntax_error 
      009CE3 90 93            [ 1] 5022 1$:	ldw y,x 
      009CE5 CD 9B 83         [ 4] 5023 	call search_file 
      009CE8 25 05            [ 1] 5024 	jrc 2$ 
      009CEA A6 09            [ 1] 5025 	ld a,#ERR_NOT_FILE
      009CEC CC 89 67         [ 2] 5026 	jp tb_error  
      009CEF                       5027 2$:
      009CEF CD 9C 9C         [ 4] 5028 	call load_file
                                   5029 ; print loaded size 	 
      009CF2 CE 00 1F         [ 2] 5030 	ldw x,txtend 
      009CF5 72 B0 00 1D      [ 2] 5031 	subw x,txtbgn
      009CF9 CD 8A B8         [ 4] 5032 	call print_int 
      009CFC 81               [ 4] 5033 	ret 
                                   5034 
                                   5035 ;-----------------------------------
                                   5036 ; BASIC: FORGET ["file_name"] 
                                   5037 ; erase file_name and all others 
                                   5038 ; after it. 
                                   5039 ; without argument erase all files 
                                   5040 ;-----------------------------------
                           000001  5041 	NEW_FREE=1 
                           000003  5042 	VSIZE=3 
      009CFD                       5043 forget:
      001C7D                       5044 	_vars VSIZE 
      009CFD 52 03            [ 2]    1     sub sp,#VSIZE 
      009CFF CD 8A 57         [ 4] 5045 	call next_token 
      009D02 A1 00            [ 1] 5046 	cp a,#TK_NONE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009D04 27 20            [ 1] 5047 	jreq 3$ 
      009D06 A1 02            [ 1] 5048 	cp a,#TK_QSTR
      009D08 27 03            [ 1] 5049 	jreq 1$
      009D0A CC 89 65         [ 2] 5050 	jp syntax_error
      009D0D 90 93            [ 1] 5051 1$: ldw y,x 
      009D0F 55 00 04 00 02   [ 1] 5052 	mov in,count 
      009D14 CD 9B 83         [ 4] 5053 	call search_file
      009D17 25 05            [ 1] 5054 	jrc 2$
      009D19 A6 09            [ 1] 5055 	ld a,#ERR_NOT_FILE 
      009D1B CC 89 67         [ 2] 5056 	jp tb_error 
      009D1E                       5057 2$: 
      009D1E CE 00 17         [ 2] 5058 	ldw x,farptr
      009D21 C6 00 19         [ 1] 5059 	ld a,farptr+2
      009D24 20 0A            [ 2] 5060 	jra 4$ 
      009D26                       5061 3$: ; forget all files 
      009D26 AE 01 00         [ 2] 5062 	ldw x,#0x100
      009D29 4F               [ 1] 5063 	clr a 
      009D2A CF 00 17         [ 2] 5064 	ldw farptr,x 
      009D2D C7 00 19         [ 1] 5065 	ld farptr+2,a 
      009D30                       5066 4$:	; save new free address 
      009D30 1F 01            [ 2] 5067 	ldw (NEW_FREE,sp),x
      009D32 6B 03            [ 1] 5068 	ld (NEW_FREE+2,sp),a 
      009D34 CD 81 CF         [ 4] 5069 	call move_erase_to_ram
      009D37 CD 82 4A         [ 4] 5070 5$: call block_erase 
      009D3A AE 00 80         [ 2] 5071 	ldw x,#BLOCK_SIZE 
      009D3D CD 9B 0F         [ 4] 5072 	call incr_farptr 
      009D40 CD 9A F4         [ 4] 5073 	call row_align 
                                   5074 ; check if all blocks erased
      009D43 C6 00 19         [ 1] 5075 	ld a,farptr+2  
      009D46 C0 00 1C         [ 1] 5076 	sub a,ffree+2
      009D49 C6 00 18         [ 1] 5077 	ld a,farptr+1 
      009D4C C2 00 1B         [ 1] 5078 	sbc a,ffree+1 
      009D4F C6 00 17         [ 1] 5079 	ld a,farptr 
      009D52 C2 00 1A         [ 1] 5080 	sbc a,ffree 
      009D55 2B E0            [ 1] 5081 	jrmi 5$ 
      009D57 7B 03            [ 1] 5082 	ld a,(NEW_FREE+2,sp)
      009D59 1E 01            [ 2] 5083 	ldw x,(NEW_FREE,sp)
      009D5B C7 00 1C         [ 1] 5084 	ld ffree+2,a 
      009D5E CF 00 1A         [ 2] 5085 	ldw ffree,x 
      001CE1                       5086 	_drop VSIZE 
      009D61 5B 03            [ 2]    1     addw sp,#VSIZE 
      009D63 81               [ 4] 5087 	ret 
                                   5088 
                                   5089 ;----------------------
                                   5090 ; BASIC: DIR 
                                   5091 ; list saved files 
                                   5092 ;----------------------
                           000001  5093 	COUNT=1 ; files counter 
                           000002  5094 	VSIZE=2 
      009D64                       5095 directory:
      001CE4                       5096 	_vars VSIZE 
      009D64 52 02            [ 2]    1     sub sp,#VSIZE 
      009D66 5F               [ 1] 5097 	clrw x 
      009D67 1F 01            [ 2] 5098 	ldw (COUNT,sp),x 
      009D69 CF 00 18         [ 2] 5099 	ldw farptr+1,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009D6C 35 01 00 17      [ 1] 5100 	mov farptr,#1 
      009D70                       5101 dir_loop:
      009D70 5F               [ 1] 5102 	clrw x 
      009D71 92 AF 00 17      [ 5] 5103 	ldf a,([farptr],x)
      009D75 27 3B            [ 1] 5104 	jreq 8$ 
      009D77                       5105 1$: ;name loop 	
      009D77 92 AF 00 17      [ 5] 5106 	ldf a,([farptr],x)
      009D7B 27 06            [ 1] 5107 	jreq 2$ 
      009D7D CD 83 8A         [ 4] 5108 	call putc 
      009D80 5C               [ 1] 5109 	incw x 
      009D81 20 F4            [ 2] 5110 	jra 1$
      009D83 5C               [ 1] 5111 2$: incw x ; skip ending 0. 
      009D84 A6 20            [ 1] 5112 	ld a,#SPACE 
      009D86 CD 83 8A         [ 4] 5113 	call putc 
                                   5114 ; get file size 	
      009D89 92 AF 00 17      [ 5] 5115 	ldf a,([farptr],x)
      009D8D 90 95            [ 1] 5116 	ld yh,a 
      009D8F 5C               [ 1] 5117 	incw x 
      009D90 92 AF 00 17      [ 5] 5118 	ldf a,([farptr],x)
      009D94 5C               [ 1] 5119 	incw x 
      009D95 90 97            [ 1] 5120 	ld yl,a 
      009D97 90 89            [ 2] 5121 	pushw y 
      009D99 72 FB 01         [ 2] 5122 	addw x,(1,sp)
                                   5123 ; skip to next file 
      009D9C CD 9B 0F         [ 4] 5124 	call incr_farptr
      009D9F CD 9A F4         [ 4] 5125 	call row_align
                                   5126 ; print file size 
      009DA2 85               [ 2] 5127 	popw x ; file size 
      009DA3 CD 8A B8         [ 4] 5128 	call print_int 
      009DA6 A6 0D            [ 1] 5129 	ld a,#CR 
      009DA8 CD 83 8A         [ 4] 5130 	call putc
      009DAB 1E 01            [ 2] 5131 	ldw x,(COUNT,sp)
      009DAD 5C               [ 1] 5132 	incw x
      009DAE 1F 01            [ 2] 5133 	ldw (COUNT,sp),x  
      009DB0 20 BE            [ 2] 5134 	jra dir_loop
      009DB2                       5135 8$: ; print number of files 
      009DB2 1E 01            [ 2] 5136 	ldw x,(COUNT,sp)
      009DB4 CD 8A B8         [ 4] 5137 	call print_int 
      009DB7 AE 9D D1         [ 2] 5138 	ldw x,#file_count 
      009DBA CD AA 40         [ 4] 5139 	call puts  
                                   5140 ; print drive free space 	
      009DBD CD 9B 4F         [ 4] 5141 	call disk_free
      009DC0 5F               [ 1] 5142 	clrw x  
      009DC1 35 0A 00 0B      [ 1] 5143 	mov base,#10 
      009DC5 CD 8A C8         [ 4] 5144 	call prti24 
      009DC8 AE 9D D9         [ 2] 5145 	ldw x,#drive_free
      009DCB CD AA 40         [ 4] 5146 	call puts 
      001D4E                       5147 	_drop VSIZE 
      009DCE 5B 02            [ 2]    1     addw sp,#VSIZE 
      009DD0 81               [ 4] 5148 	ret
      009DD1 20 66 69 6C 65 73 0A  5149 file_count: .asciz " files\n"
             00
      009DD9 20 62 79 74 65 73 20  5150 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5151 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5152 ;---------------------
                                   5153 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5154 ; write 1 or more byte to FLASH or EEPROM
                                   5155 ; starting at address  
                                   5156 ; input:
                                   5157 ;   expr1  	is address 
                                   5158 ;   expr2,...,exprn   are bytes to write
                                   5159 ; output:
                                   5160 ;   none 
                                   5161 ;---------------------
                           000001  5162 	ADDR=1
                           000002  5163 	VSIZ=2 
      009DE6                       5164 write:
      001D66                       5165 	_vars VSIZE 
      009DE6 52 02            [ 2]    1     sub sp,#VSIZE 
      009DE8 72 5F 00 17      [ 1] 5166 	clr farptr ; expect 16 bits address 
      009DEC CD 92 3C         [ 4] 5167 	call expression
      009DEF A1 84            [ 1] 5168 	cp a,#TK_INTGR 
      009DF1 27 03            [ 1] 5169 	jreq 0$
      009DF3 CC 89 65         [ 2] 5170 	jp syntax_error
      009DF6 1F 01            [ 2] 5171 0$: ldw (ADDR,sp),x 
      009DF8 CD 8A 57         [ 4] 5172 	call next_token 
      009DFB A1 09            [ 1] 5173 	cp a,#TK_COMMA 
      009DFD 27 02            [ 1] 5174 	jreq 1$ 
      009DFF 20 19            [ 2] 5175 	jra 9$ 
      009E01 CD 92 3C         [ 4] 5176 1$:	call expression
      009E04 A1 84            [ 1] 5177 	cp a,#TK_INTGR
      009E06 27 03            [ 1] 5178 	jreq 2$
      009E08 CC 89 65         [ 2] 5179 	jp syntax_error
      009E0B 9F               [ 1] 5180 2$:	ld a,xl 
      009E0C 1E 01            [ 2] 5181 	ldw x,(ADDR,sp) 
      009E0E CF 00 18         [ 2] 5182 	ldw farptr+1,x 
      009E11 5F               [ 1] 5183 	clrw x 
      009E12 CD 82 74         [ 4] 5184 	call write_byte
      009E15 1E 01            [ 2] 5185 	ldw x,(ADDR,sp)
      009E17 5C               [ 1] 5186 	incw x 
      009E18 20 DC            [ 2] 5187 	jra 0$ 
      009E1A                       5188 9$:
      001D9A                       5189 	_drop VSIZE
      009E1A 5B 02            [ 2]    1     addw sp,#VSIZE 
      009E1C 81               [ 4] 5190 	ret 
                                   5191 
                                   5192 
                                   5193 ;---------------------
                                   5194 ;BASIC: CHAR(expr)
                                   5195 ; évaluate expression 
                                   5196 ; and take the 7 least 
                                   5197 ; bits as ASCII character
                                   5198 ; return a TK_CHAR 
                                   5199 ;---------------------
      009E1D                       5200 char:
      009E1D CD 91 38         [ 4] 5201 	call func_args 
      009E20 A1 01            [ 1] 5202 	cp a,#1
      009E22 27 03            [ 1] 5203 	jreq 1$
      009E24 CC 89 65         [ 2] 5204 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009E27 85               [ 2] 5205 1$:	popw x 
      009E28 9F               [ 1] 5206 	ld a,xl 
      009E29 A4 7F            [ 1] 5207 	and a,#0x7f 
      009E2B 97               [ 1] 5208 	ld xl,a
      009E2C A6 03            [ 1] 5209 	ld a,#TK_CHAR
      009E2E 81               [ 4] 5210 	ret
                                   5211 
                                   5212 ;---------------------
                                   5213 ; BASIC: ASC(string|char|TK_CFUNC)
                                   5214 ; extract first character 
                                   5215 ; of string argument 
                                   5216 ; return it as TK_INTGR 
                                   5217 ;---------------------
      009E2F                       5218 ascii:
      009E2F A6 07            [ 1] 5219 	ld a,#TK_LPAREN
      009E31 CD 91 2B         [ 4] 5220 	call expect 
      009E34 CD 8A 57         [ 4] 5221 	call next_token 
      009E37 A1 02            [ 1] 5222 	cp a,#TK_QSTR 
      009E39 27 0E            [ 1] 5223 	jreq 1$
      009E3B A1 03            [ 1] 5224 	cp a,#TK_CHAR 
      009E3D 27 0D            [ 1] 5225 	jreq 2$ 
      009E3F A1 82            [ 1] 5226 	cp a,#TK_CFUNC 
      009E41 27 03            [ 1] 5227 	jreq 0$
      009E43 CC 89 65         [ 2] 5228 	jp syntax_error
      009E46 FD               [ 4] 5229 0$: call (x)
      009E47 20 03            [ 2] 5230 	jra 2$
      009E49                       5231 1$: 
      009E49 F6               [ 1] 5232 	ld a,(x) 
      009E4A 5F               [ 1] 5233 	clrw x
      009E4B 97               [ 1] 5234 	ld xl,a 
      009E4C                       5235 2$: 
      009E4C 89               [ 2] 5236 	pushw x 
      009E4D A6 08            [ 1] 5237 	ld a,#TK_RPAREN 
      009E4F CD 91 2B         [ 4] 5238 	call expect
      009E52 85               [ 2] 5239 	popw x 
      009E53 A6 84            [ 1] 5240 	ld a,#TK_INTGR 
      009E55 81               [ 4] 5241 	ret 
                                   5242 
                                   5243 ;---------------------
                                   5244 ;BASIC: KEY
                                   5245 ; wait for a character 
                                   5246 ; received from STDIN 
                                   5247 ; input:
                                   5248 ;	none 
                                   5249 ; output:
                                   5250 ;	X 		ASCII character 
                                   5251 ;---------------------
      009E56                       5252 key:
      009E56 CD 83 AB         [ 4] 5253 	call getc 
      009E59 5F               [ 1] 5254 	clrw x 
      009E5A 97               [ 1] 5255 	ld xl,a 
      009E5B A6 84            [ 1] 5256 	ld a,#TK_INTGR
      009E5D 81               [ 4] 5257 	ret
                                   5258 
                                   5259 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5260 ; BASIC: QKEY
                                   5261 ; Return true if there 
                                   5262 ; is a character in 
                                   5263 ; waiting in STDIN 
                                   5264 ; input:
                                   5265 ;  none 
                                   5266 ; output:
                                   5267 ;   X 		0|-1 
                                   5268 ;-----------------------
      009E5E                       5269 qkey:: 
      009E5E 5F               [ 1] 5270 	clrw x 
      009E5F C6 00 2E         [ 1] 5271 	ld a,rx_head
      009E62 C1 00 2F         [ 1] 5272 	cp a,rx_tail 
      009E65 27 01            [ 1] 5273 	jreq 9$ 
      009E67 53               [ 2] 5274 	cplw x 
      009E68 A6 84            [ 1] 5275 9$: ld a,#TK_INTGR
      009E6A 81               [ 4] 5276 	ret 
                                   5277 
                                   5278 ;---------------------
                                   5279 ; BASIC: GPIO(expr,reg)
                                   5280 ; return gpio address 
                                   5281 ; expr {0..8}
                                   5282 ; input:
                                   5283 ;   none 
                                   5284 ; output:
                                   5285 ;   X 		gpio register address
                                   5286 ;----------------------------
                           000003  5287 	PORT=3
                           000001  5288 	REG=1 
                           000004  5289 	VSIZE=4 
      009E6B                       5290 gpio:
      009E6B CD 91 38         [ 4] 5291 	call func_args 
      009E6E A1 02            [ 1] 5292 	cp a,#2
      009E70 27 03            [ 1] 5293 	jreq 1$
      009E72 CC 89 65         [ 2] 5294 	jp syntax_error  
      009E75                       5295 1$:	
      009E75 1E 03            [ 2] 5296 	ldw x,(PORT,sp)
      009E77 2B 17            [ 1] 5297 	jrmi bad_port
      009E79 A3 00 09         [ 2] 5298 	cpw x,#9
      009E7C 2A 12            [ 1] 5299 	jrpl bad_port
      009E7E A6 05            [ 1] 5300 	ld a,#5
      009E80 42               [ 4] 5301 	mul x,a
      009E81 1C 50 00         [ 2] 5302 	addw x,#GPIO_BASE 
      009E84 1F 03            [ 2] 5303 	ldw (PORT,sp),x  
      009E86 1E 01            [ 2] 5304 	ldw x,(REG,sp) 
      009E88 72 FB 03         [ 2] 5305 	addw x,(PORT,sp)
      009E8B A6 84            [ 1] 5306 	ld a,#TK_INTGR
      001E0D                       5307 	_drop VSIZE 
      009E8D 5B 04            [ 2]    1     addw sp,#VSIZE 
      009E8F 81               [ 4] 5308 	ret
      009E90                       5309 bad_port:
      009E90 A6 0A            [ 1] 5310 	ld a,#ERR_BAD_VALUE
      009E92 CC 89 67         [ 2] 5311 	jp tb_error
                                   5312 
                                   5313 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   5314 ;-------------------------
                                   5315 ; BASIC: UFLASH 
                                   5316 ; return user flash address
                                   5317 ; input:
                                   5318 ;  none 
                                   5319 ; output:
                                   5320 ;	A		TK_INTGR
                                   5321 ;   X 		user address 
                                   5322 ;---------------------------
      009E95                       5323 uflash:
      009E95 AE AA 00         [ 2] 5324 	ldw x,#user_space 
      009E98 A6 84            [ 1] 5325 	ld a,#TK_INTGR 
      009E9A 81               [ 4] 5326 	ret 
                                   5327 
                                   5328 
                                   5329 ;---------------------
                                   5330 ; BASIC: USR(addr[,arg])
                                   5331 ; execute a function written 
                                   5332 ; in binary code.
                                   5333 ; binary fonction should 
                                   5334 ; return token attribute in A 
                                   5335 ; and value in X. 
                                   5336 ; input:
                                   5337 ;   addr	routine address 
                                   5338 ;   arg 	is an optional argument 
                                   5339 ; output:
                                   5340 ;   A 		token attribute 
                                   5341 ;   X       returned value 
                                   5342 ;---------------------
      009E9B                       5343 usr:
      009E9B 90 89            [ 2] 5344 	pushw y 	
      009E9D CD 91 38         [ 4] 5345 	call func_args 
      009EA0 A1 01            [ 1] 5346 	cp a,#1 
      009EA2 27 07            [ 1] 5347 	jreq 2$
      009EA4 A1 02            [ 1] 5348 	cp a,#2
      009EA6 27 03            [ 1] 5349 	jreq 2$  
      009EA8 CC 89 65         [ 2] 5350 	jp syntax_error 
      009EAB 90 85            [ 2] 5351 2$: popw y  ; arg|addr 
      009EAD A1 01            [ 1] 5352 	cp a,#1
      009EAF 27 02            [ 1] 5353 	jreq 3$
      009EB1 85               [ 2] 5354 	popw x ; addr
      009EB2 51               [ 1] 5355 	exgw x,y 
      009EB3 90 FD            [ 4] 5356 3$: call (y)
      009EB5 90 85            [ 2] 5357 	popw y 
      009EB7 81               [ 4] 5358 	ret 
                                   5359 
                                   5360 ;------------------------------
                                   5361 ; BASIC: BYE 
                                   5362 ; halt mcu in its lowest power mode 
                                   5363 ; wait for reset or external interrupt
                                   5364 ; do a cold start on wakeup.
                                   5365 ;------------------------------
      009EB8                       5366 bye:
      009EB8 72 0D 52 30 FB   [ 2] 5367 	btjf UART1_SR,#UART_SR_TC,.
      009EBD 8E               [10] 5368 	halt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009EBE CC 86 B9         [ 2] 5369 	jp cold_start  
                                   5370 
                                   5371 ;----------------------------------
                                   5372 ; BASIC: AUTORUN ["file_name"] 
                                   5373 ; record in eeprom at adrress AUTORUN_NAME
                                   5374 ; the name of file to load and execute
                                   5375 ; at startup. 
                                   5376 ; empty string delete autorun name 
                                   5377 ; no argument display autorun name  
                                   5378 ; input:
                                   5379 ;   file_name   file to execute 
                                   5380 ; output:
                                   5381 ;   none
                                   5382 ;-----------------------------------
      009EC1                       5383 autorun: 
      009EC1 72 01 00 24 07   [ 2] 5384 	btjf flags,#FRUN,0$ 
      009EC6 27 05            [ 1] 5385 	jreq 0$ 
      009EC8 A6 07            [ 1] 5386 	ld a,#ERR_CMD_ONLY 
      009ECA CC 89 67         [ 2] 5387 	jp tb_error 
      009ECD                       5388 0$:	
      009ECD CD 8A 57         [ 4] 5389 	call next_token
      009ED0 4D               [ 1] 5390 	tnz a 
      009ED1 26 08            [ 1] 5391 	jrne 1$
      009ED3 AE 40 00         [ 2] 5392 	ldw x,#AUTORUN_NAME
      009ED6 CD AA 40         [ 4] 5393 	call puts 
      009ED9 4F               [ 1] 5394 	clr a 
      009EDA 81               [ 4] 5395 	ret 
      009EDB                       5396 1$:
      009EDB A1 02            [ 1] 5397 	cp a,#TK_QSTR
      009EDD 27 03            [ 1] 5398 	jreq 2$
      009EDF CC 89 65         [ 2] 5399 	jp syntax_error 
      009EE2                       5400 2$:	
      009EE2 7D               [ 1] 5401 	tnz (x) 
      009EE3 26 09            [ 1] 5402 	jrne 3$
                                   5403 ; empty string, delete autorun 	
      009EE5 CD 87 82         [ 4] 5404 	call cancel_autorun
      009EE8 55 00 04 00 02   [ 1] 5405 	mov in,count 
      009EED 81               [ 4] 5406 	ret 
      009EEE 89               [ 2] 5407 3$:	pushw x 
      009EEF 90 93            [ 1] 5408 	ldw y,x  
      009EF1 CD 9B 83         [ 4] 5409 	call search_file 
      009EF4 25 05            [ 1] 5410 	jrc 4$ 
      009EF6 A6 09            [ 1] 5411 	ld a,#ERR_NOT_FILE
      009EF8 CC 89 67         [ 2] 5412 	jp tb_error  
      009EFB                       5413 4$: 
      009EFB 55 00 04 00 02   [ 1] 5414 	mov in,count 
      009F00 72 5F 00 17      [ 1] 5415 	clr farptr 
      009F04 AE 40 00         [ 2] 5416 	ldw x,#AUTORUN_NAME
      009F07 CF 00 18         [ 2] 5417 	ldw farptr+1,x 
      009F0A 1E 01            [ 2] 5418 	ldw x,(1,sp)  
      009F0C CD 84 75         [ 4] 5419 	call strlen  ; return length in A 
      009F0F 5F               [ 1] 5420 	clrw x 
      009F10 97               [ 1] 5421 	ld xl,a 
      009F11 5C               [ 1] 5422 	incw x 
      009F12 90 85            [ 2] 5423 	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009F14 89               [ 2] 5424 	pushw x 
      009F15 5F               [ 1] 5425 	clrw x 
      009F16 CD 82 E9         [ 4] 5426 	call write_block 
      001E99                       5427 	_drop 2 
      009F19 5B 02            [ 2]    1     addw sp,#2 
      009F1B 81               [ 4] 5428 	ret 
                                   5429 
                                   5430 ;----------------------------------
                                   5431 ; BASIC: SLEEP 
                                   5432 ; halt mcu until reset or external
                                   5433 ; interrupt.
                                   5434 ; Resume progam after SLEEP command
                                   5435 ;----------------------------------
      009F1C                       5436 sleep:
      009F1C 72 0D 52 30 FB   [ 2] 5437 	btjf UART1_SR,#UART_SR_TC,.
      009F21 72 16 00 24      [ 1] 5438 	bset flags,#FSLEEP
      009F25 8E               [10] 5439 	halt 
      009F26 81               [ 4] 5440 	ret 
                                   5441 
                                   5442 ;-------------------------------
                                   5443 ; BASIC: PAUSE expr 
                                   5444 ; suspend execution for n msec.
                                   5445 ; input:
                                   5446 ;	none
                                   5447 ; output:
                                   5448 ;	none 
                                   5449 ;------------------------------
      009F27                       5450 pause:
      009F27 CD 92 3C         [ 4] 5451 	call expression
      009F2A A1 84            [ 1] 5452 	cp a,#TK_INTGR
      009F2C 27 03            [ 1] 5453 	jreq pause02 
      009F2E CC 89 65         [ 2] 5454 	jp syntax_error
      009F31                       5455 pause02: 
      009F31 5D               [ 2] 5456 1$: tnzw x 
      009F32 27 04            [ 1] 5457 	jreq 2$
      009F34 8F               [10] 5458 	wfi 
      009F35 5A               [ 2] 5459 	decw x 
      009F36 26 F9            [ 1] 5460 	jrne 1$
      009F38 4F               [ 1] 5461 2$:	clr a 
      009F39 81               [ 4] 5462 	ret 
                                   5463 
                                   5464 ;------------------------------
                                   5465 ; BASIC: AWU expr
                                   5466 ; halt mcu for 'expr' milliseconds
                                   5467 ; use Auto wakeup peripheral
                                   5468 ; all oscillators stopped except LSI
                                   5469 ; range: 1ms - 511ms
                                   5470 ; input:
                                   5471 ;  none
                                   5472 ; output:
                                   5473 ;  none:
                                   5474 ;------------------------------
      009F3A                       5475 awu:
      009F3A CD 92 3C         [ 4] 5476   call expression
      009F3D A1 84            [ 1] 5477   cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009F3F 27 03            [ 1] 5478   jreq awu02
      009F41 CC 89 65         [ 2] 5479   jp syntax_error
      009F44                       5480 awu02:
      009F44 A3 14 00         [ 2] 5481   cpw x,#5120
      009F47 2B 0C            [ 1] 5482   jrmi 1$ 
      009F49 35 0F 50 F2      [ 1] 5483   mov AWU_TBR,#15 
      009F4D A6 1E            [ 1] 5484   ld a,#30
      009F4F 62               [ 2] 5485   div x,a
      009F50 A6 10            [ 1] 5486   ld a,#16
      009F52 62               [ 2] 5487   div x,a 
      009F53 20 1E            [ 2] 5488   jra 4$
      009F55                       5489 1$: 
      009F55 A3 08 00         [ 2] 5490   cpw x,#2048
      009F58 2B 09            [ 1] 5491   jrmi 2$ 
      009F5A 35 0E 50 F2      [ 1] 5492   mov AWU_TBR,#14
      009F5E A6 50            [ 1] 5493   ld a,#80
      009F60 62               [ 2] 5494   div x,a 
      009F61 20 10            [ 2] 5495   jra 4$   
      009F63                       5496 2$:
      009F63 35 07 50 F2      [ 1] 5497   mov AWU_TBR,#7
      009F67                       5498 3$:  
                                   5499 ; while X > 64  divide by 2 and increment AWU_TBR 
      009F67 A3 00 40         [ 2] 5500   cpw x,#64 
      009F6A 23 07            [ 2] 5501   jrule 4$ 
      009F6C 72 5C 50 F2      [ 1] 5502   inc AWU_TBR 
      009F70 54               [ 2] 5503   srlw x 
      009F71 20 F4            [ 2] 5504   jra 3$ 
      009F73                       5505 4$:
      009F73 9F               [ 1] 5506   ld a, xl
      009F74 4A               [ 1] 5507   dec a 
      009F75 27 01            [ 1] 5508   jreq 5$
      009F77 4A               [ 1] 5509   dec a 	
      009F78                       5510 5$: 
      009F78 A4 3E            [ 1] 5511   and a,#0x3e 
      009F7A C7 50 F1         [ 1] 5512   ld AWU_APR,a 
      009F7D 72 18 50 F0      [ 1] 5513   bset AWU_CSR,#AWU_CSR_AWUEN
      009F81 8E               [10] 5514   halt 
                                   5515 
      009F82 81               [ 4] 5516   ret 
                                   5517 
                                   5518 ;------------------------------
                                   5519 ; BASIC: TICKS
                                   5520 ; return msec ticks counter value 
                                   5521 ; input:
                                   5522 ; 	none 
                                   5523 ; output:
                                   5524 ;	X 		TK_INTGR
                                   5525 ;-------------------------------
      009F83                       5526 get_ticks:
      009F83 CE 00 0F         [ 2] 5527 	ldw x,ticks 
      009F86 A6 84            [ 1] 5528 	ld a,#TK_INTGR
      009F88 81               [ 4] 5529 	ret 
                                   5530 
                                   5531 
                                   5532 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   5533 ;------------------------------
                                   5534 ; BASIC: ABS(expr)
                                   5535 ; return absolute value of expr.
                                   5536 ; input:
                                   5537 ;   none
                                   5538 ; output:
                                   5539 ;   X     	positive integer
                                   5540 ;-------------------------------
      009F89                       5541 abs:
      009F89 CD 91 38         [ 4] 5542 	call func_args 
      009F8C A1 01            [ 1] 5543 	cp a,#1 
      009F8E 27 03            [ 1] 5544 	jreq 0$ 
      009F90 CC 89 65         [ 2] 5545 	jp syntax_error
      009F93                       5546 0$:  
      009F93 85               [ 2] 5547     popw x   
      009F94 9E               [ 1] 5548 	ld a,xh 
      009F95 A5 80            [ 1] 5549 	bcp a,#0x80 
      009F97 27 01            [ 1] 5550 	jreq 2$ 
      009F99 50               [ 2] 5551 	negw x 
      009F9A A6 84            [ 1] 5552 2$: ld a,#TK_INTGR 
      009F9C 81               [ 4] 5553 	ret 
                                   5554 
                                   5555 ;------------------------------
                                   5556 ; BASIC: AND(expr1,expr2)
                                   5557 ; Apply bit AND relation between
                                   5558 ; the 2 arguments, i.e expr1 & expr2 
                                   5559 ; output:
                                   5560 ; 	A 		TK_INTGR
                                   5561 ;   X 		result 
                                   5562 ;------------------------------
      009F9D                       5563 bit_and:
      009F9D CD 91 38         [ 4] 5564 	call func_args 
      009FA0 A1 02            [ 1] 5565 	cp a,#2
      009FA2 27 03            [ 1] 5566 	jreq 1$
      009FA4 CC 89 65         [ 2] 5567 	jp syntax_error 
      009FA7 85               [ 2] 5568 1$:	popw x 
      009FA8 9E               [ 1] 5569 	ld a,xh 
      009FA9 14 01            [ 1] 5570 	and a,(1,sp)
      009FAB 95               [ 1] 5571 	ld xh,a 
      009FAC 9F               [ 1] 5572 	ld a,xl
      009FAD 14 02            [ 1] 5573 	and a,(2,sp)
      009FAF 97               [ 1] 5574 	ld xl,a 
      001F30                       5575 	_drop 2 
      009FB0 5B 02            [ 2]    1     addw sp,#2 
      009FB2 A6 84            [ 1] 5576 	ld a,#TK_INTGR
      009FB4 81               [ 4] 5577 	ret
                                   5578 
                                   5579 ;------------------------------
                                   5580 ; BASIC: OR(expr1,expr2)
                                   5581 ; Apply bit OR relation between
                                   5582 ; the 2 arguments, i.e expr1 | expr2 
                                   5583 ; output:
                                   5584 ; 	A 		TK_INTGR
                                   5585 ;   X 		result 
                                   5586 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009FB5                       5587 bit_or:
      009FB5 CD 91 38         [ 4] 5588 	call func_args 
      009FB8 A1 02            [ 1] 5589 	cp a,#2
      009FBA 27 03            [ 1] 5590 	jreq 1$
      009FBC CC 89 65         [ 2] 5591 	jp syntax_error 
      009FBF                       5592 1$: 
      009FBF 85               [ 2] 5593 	popw x 
      009FC0 9E               [ 1] 5594 	ld a,xh 
      009FC1 1A 01            [ 1] 5595 	or a,(1,sp)
      009FC3 95               [ 1] 5596 	ld xh,a 
      009FC4 9F               [ 1] 5597 	ld a,xl 
      009FC5 1A 02            [ 1] 5598 	or a,(2,sp)
      009FC7 97               [ 1] 5599 	ld xl,a 
      001F48                       5600 	_drop 2 
      009FC8 5B 02            [ 2]    1     addw sp,#2 
      009FCA A6 84            [ 1] 5601 	ld a,#TK_INTGR 
      009FCC 81               [ 4] 5602 	ret
                                   5603 
                                   5604 ;------------------------------
                                   5605 ; BASIC: XOR(expr1,expr2)
                                   5606 ; Apply bit XOR relation between
                                   5607 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5608 ; output:
                                   5609 ; 	A 		TK_INTGR
                                   5610 ;   X 		result 
                                   5611 ;------------------------------
      009FCD                       5612 bit_xor:
      009FCD CD 91 38         [ 4] 5613 	call func_args 
      009FD0 A1 02            [ 1] 5614 	cp a,#2
      009FD2 27 03            [ 1] 5615 	jreq 1$
      009FD4 CC 89 65         [ 2] 5616 	jp syntax_error 
      009FD7                       5617 1$: 
      009FD7 85               [ 2] 5618 	popw x 
      009FD8 9E               [ 1] 5619 	ld a,xh 
      009FD9 18 01            [ 1] 5620 	xor a,(1,sp)
      009FDB 95               [ 1] 5621 	ld xh,a 
      009FDC 9F               [ 1] 5622 	ld a,xl 
      009FDD 18 02            [ 1] 5623 	xor a,(2,sp)
      009FDF 97               [ 1] 5624 	ld xl,a 
      001F60                       5625 	_drop 2 
      009FE0 5B 02            [ 2]    1     addw sp,#2 
      009FE2 A6 84            [ 1] 5626 	ld a,#TK_INTGR 
      009FE4 81               [ 4] 5627 	ret 
                                   5628 
                                   5629 ;------------------------------
                                   5630 ; BASIC: LSHIFT(expr1,expr2)
                                   5631 ; logical shift left expr1 by 
                                   5632 ; expr2 bits 
                                   5633 ; output:
                                   5634 ; 	A 		TK_INTGR
                                   5635 ;   X 		result 
                                   5636 ;------------------------------
      009FE5                       5637 lshift:
      009FE5 CD 91 38         [ 4] 5638 	call func_args
      009FE8 A1 02            [ 1] 5639 	cp a,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009FEA 27 03            [ 1] 5640 	jreq 1$
      009FEC CC 89 65         [ 2] 5641 	jp syntax_error
      009FEF 90 85            [ 2] 5642 1$: popw y   
      009FF1 85               [ 2] 5643 	popw x 
      009FF2 90 5D            [ 2] 5644 	tnzw y 
      009FF4 27 05            [ 1] 5645 	jreq 4$
      009FF6 58               [ 2] 5646 2$:	sllw x 
      009FF7 90 5A            [ 2] 5647 	decw y 
      009FF9 26 FB            [ 1] 5648 	jrne 2$
      009FFB                       5649 4$:  
      009FFB A6 84            [ 1] 5650 	ld a,#TK_INTGR
      009FFD 81               [ 4] 5651 	ret
                                   5652 
                                   5653 ;------------------------------
                                   5654 ; BASIC: RSHIFT(expr1,expr2)
                                   5655 ; logical shift right expr1 by 
                                   5656 ; expr2 bits.
                                   5657 ; output:
                                   5658 ; 	A 		TK_INTGR
                                   5659 ;   X 		result 
                                   5660 ;------------------------------
      009FFE                       5661 rshift:
      009FFE CD 91 38         [ 4] 5662 	call func_args
      00A001 A1 02            [ 1] 5663 	cp a,#2 
      00A003 27 03            [ 1] 5664 	jreq 1$
      00A005 CC 89 65         [ 2] 5665 	jp syntax_error
      00A008 90 85            [ 2] 5666 1$: popw y  
      00A00A 85               [ 2] 5667 	popw x
      00A00B 90 5D            [ 2] 5668 	tnzw y 
      00A00D 27 05            [ 1] 5669 	jreq 4$
      00A00F 54               [ 2] 5670 2$:	srlw x 
      00A010 90 5A            [ 2] 5671 	decw y 
      00A012 26 FB            [ 1] 5672 	jrne 2$
      00A014                       5673 4$:  
      00A014 A6 84            [ 1] 5674 	ld a,#TK_INTGR
      00A016 81               [ 4] 5675 	ret
                                   5676 
                                   5677 ;--------------------------
                                   5678 ; BASIC: FCPU integer
                                   5679 ; set CPU frequency 
                                   5680 ;-------------------------- 
                                   5681 
      00A017                       5682 fcpu:
      00A017 A6 84            [ 1] 5683 	ld a,#TK_INTGR
      00A019 CD 91 2B         [ 4] 5684 	call expect 
      00A01C 9F               [ 1] 5685 	ld a,xl 
      00A01D A4 07            [ 1] 5686 	and a,#7 
      00A01F C7 50 C6         [ 1] 5687 	ld CLK_CKDIVR,a 
      00A022 81               [ 4] 5688 	ret 
                                   5689 
                                   5690 ;------------------------------
                                   5691 ; BASIC: PMODE pin#, mode 
                                   5692 ; Arduino pin. 
                                   5693 ; define pin as input or output
                                   5694 ; pin#: {0..15}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                   5695 ; mode: INPUT|OUTPUT  
                                   5696 ;------------------------------
                           000001  5697 	PINNO=1
                           000001  5698 	VSIZE=1
      00A023                       5699 pin_mode:
      001FA3                       5700 	_vars VSIZE 
      00A023 52 01            [ 2]    1     sub sp,#VSIZE 
      00A025 CD 91 3D         [ 4] 5701 	call arg_list 
      00A028 A1 02            [ 1] 5702 	cp a,#2 
      00A02A 27 03            [ 1] 5703 	jreq 1$
      00A02C CC 89 65         [ 2] 5704 	jp syntax_error 
      00A02F 90 85            [ 2] 5705 1$: popw y ; mode 
      00A031 85               [ 2] 5706 	popw x ; Dx pin 
      00A032 CD A0 6F         [ 4] 5707 	call select_pin 
      00A035 6B 01            [ 1] 5708 	ld (PINNO,sp),a  
      00A037 A6 01            [ 1] 5709 	ld a,#1 
      00A039 0D 01            [ 1] 5710 	tnz (PINNO,sp)
      00A03B 27 0D            [ 1] 5711 	jreq 4$
      00A03D 48               [ 1] 5712 2$:	sll a 
      00A03E 0A 01            [ 1] 5713 	dec (PINNO,sp)
      00A040 26 FB            [ 1] 5714 	jrne 2$ 
      00A042 6B 01            [ 1] 5715 	ld (PINNO,sp),a
      00A044 7B 01            [ 1] 5716 	ld a,(PINNO,sp)
      00A046 EA 03            [ 1] 5717 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A048 E7 03            [ 1] 5718 	ld (GPIO_CR1,x),a 
      00A04A 90 A3 00 01      [ 2] 5719 4$:	cpw y,#OUTP 
      00A04E 27 10            [ 1] 5720 	jreq 6$
                                   5721 ; input mode
                                   5722 ; disable external interrupt 
      00A050 7B 01            [ 1] 5723 	ld a,(PINNO,sp)
      00A052 43               [ 1] 5724 	cpl a 
      00A053 E4 04            [ 1] 5725 	and a,(GPIO_CR2,x)
      00A055 E7 04            [ 1] 5726 	ld (GPIO_CR2,x),a 
                                   5727 ;clear bit in DDR for input mode 
      00A057 7B 01            [ 1] 5728 	ld a,(PINNO,sp)
      00A059 43               [ 1] 5729 	cpl a 
      00A05A E4 02            [ 1] 5730 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A05C E7 02            [ 1] 5731 	ld (GPIO_DDR,x),a 
      00A05E 20 0C            [ 2] 5732 	jra 9$
      00A060                       5733 6$: ;output mode  
      00A060 7B 01            [ 1] 5734 	ld a,(PINNO,sp)
      00A062 EA 02            [ 1] 5735 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A064 E7 02            [ 1] 5736 	ld (GPIO_DDR,x),a 
      00A066 7B 01            [ 1] 5737 	ld a,(PINNO,sp)
      00A068 EA 04            [ 1] 5738 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A06A E7 04            [ 1] 5739 	ld (GPIO_CR2,x),a 
      00A06C                       5740 9$:	
      001FEC                       5741 	_drop VSIZE 
      00A06C 5B 01            [ 2]    1     addw sp,#VSIZE 
      00A06E 81               [ 4] 5742 	ret
                                   5743 
                                   5744 ;------------------------
                                   5745 ; select Arduino pin 
                                   5746 ; input:
                                   5747 ;   X 	 {0..15} Arduino Dx 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                   5748 ; output:
                                   5749 ;   A     stm8s208 pin 
                                   5750 ;   X     base address s208 GPIO port 
                                   5751 ;---------------------------
      00A06F                       5752 select_pin:
      00A06F 58               [ 2] 5753 	sllw x 
      00A070 1C A0 7F         [ 2] 5754 	addw x,#arduino_to_8s208 
      00A073 FE               [ 2] 5755 	ldw x,(x)
      00A074 9F               [ 1] 5756 	ld a,xl 
      00A075 88               [ 1] 5757 	push a 
      00A076 5E               [ 1] 5758 	swapw x 
      00A077 A6 05            [ 1] 5759 	ld a,#5 
      00A079 42               [ 4] 5760 	mul x,a 
      00A07A 1C 50 00         [ 2] 5761 	addw x,#GPIO_BASE 
      00A07D 84               [ 1] 5762 	pop a 
      00A07E 81               [ 4] 5763 	ret 
                                   5764 ; translation from Arduino D0..D15 to stm8s208rb 
      00A07F                       5765 arduino_to_8s208:
      00A07F 03 06                 5766 .byte 3,6 ; D0 
      00A081 03 05                 5767 .byte 3,5 ; D1 
      00A083 04 00                 5768 .byte 4,0 ; D2 
      00A085 02 01                 5769 .byte 2,1 ; D3
      00A087 06 00                 5770 .byte 6,0 ; D4
      00A089 02 02                 5771 .byte 2,2 ; D5
      00A08B 02 03                 5772 .byte 2,3 ; D6
      00A08D 03 01                 5773 .byte 3,1 ; D7
      00A08F 03 03                 5774 .byte 3,3 ; D8
      00A091 02 04                 5775 .byte 2,4 ; D9
      00A093 04 05                 5776 .byte 4,5 ; D10
      00A095 02 06                 5777 .byte 2,6 ; D11
      00A097 02 07                 5778 .byte 2,7 ; D12
      00A099 02 05                 5779 .byte 2,5 ; D13
      00A09B 04 02                 5780 .byte 4,2 ; D14
      00A09D 04 01                 5781 .byte 4,1 ; D15
                                   5782 
                                   5783 
                                   5784 ;------------------------------
                                   5785 ; BASIC: RND(expr)
                                   5786 ; return random number 
                                   5787 ; between 1 and expr inclusive
                                   5788 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5789 ; input:
                                   5790 ; 	none 
                                   5791 ; output:
                                   5792 ;	X 		random positive integer 
                                   5793 ;------------------------------
      00A09F                       5794 random:
      00A09F CD 91 38         [ 4] 5795 	call func_args 
      00A0A2 A1 01            [ 1] 5796 	cp a,#1
      00A0A4 27 03            [ 1] 5797 	jreq 1$
      00A0A6 CC 89 65         [ 2] 5798 	jp syntax_error
      00A0A9                       5799 1$:  
      00A0A9 A6 80            [ 1] 5800 	ld a,#0x80 
      00A0AB 15 01            [ 1] 5801 	bcp a,(1,sp)
      00A0AD 27 05            [ 1] 5802 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      00A0AF A6 0A            [ 1] 5803 	ld a,#ERR_BAD_VALUE
      00A0B1 CC 89 67         [ 2] 5804 	jp tb_error
      00A0B4                       5805 2$: 
                                   5806 ; acc16=(x<<5)^x 
      00A0B4 CE 00 13         [ 2] 5807 	ldw x,seedx 
      00A0B7 58               [ 2] 5808 	sllw x 
      00A0B8 58               [ 2] 5809 	sllw x 
      00A0B9 58               [ 2] 5810 	sllw x 
      00A0BA 58               [ 2] 5811 	sllw x 
      00A0BB 58               [ 2] 5812 	sllw x 
      00A0BC 9E               [ 1] 5813 	ld a,xh 
      00A0BD C8 00 13         [ 1] 5814 	xor a,seedx 
      00A0C0 C7 00 0D         [ 1] 5815 	ld acc16,a 
      00A0C3 9F               [ 1] 5816 	ld a,xl 
      00A0C4 C8 00 14         [ 1] 5817 	xor a,seedx+1 
      00A0C7 C7 00 0E         [ 1] 5818 	ld acc8,a 
                                   5819 ; seedx=seedy 
      00A0CA CE 00 15         [ 2] 5820 	ldw x,seedy 
      00A0CD CF 00 13         [ 2] 5821 	ldw seedx,x  
                                   5822 ; seedy=seedy^(seedy>>1)
      00A0D0 90 54            [ 2] 5823 	srlw y 
      00A0D2 90 9E            [ 1] 5824 	ld a,yh 
      00A0D4 C8 00 15         [ 1] 5825 	xor a,seedy 
      00A0D7 C7 00 15         [ 1] 5826 	ld seedy,a  
      00A0DA 90 9F            [ 1] 5827 	ld a,yl 
      00A0DC C8 00 16         [ 1] 5828 	xor a,seedy+1 
      00A0DF C7 00 16         [ 1] 5829 	ld seedy+1,a 
                                   5830 ; acc16>>3 
      00A0E2 CE 00 0D         [ 2] 5831 	ldw x,acc16 
      00A0E5 54               [ 2] 5832 	srlw x 
      00A0E6 54               [ 2] 5833 	srlw x 
      00A0E7 54               [ 2] 5834 	srlw x 
                                   5835 ; x=acc16^x 
      00A0E8 9E               [ 1] 5836 	ld a,xh 
      00A0E9 C8 00 0D         [ 1] 5837 	xor a,acc16 
      00A0EC 95               [ 1] 5838 	ld xh,a 
      00A0ED 9F               [ 1] 5839 	ld a,xl 
      00A0EE C8 00 0E         [ 1] 5840 	xor a,acc8 
      00A0F1 97               [ 1] 5841 	ld xl,a 
                                   5842 ; seedy=x^seedy 
      00A0F2 C8 00 16         [ 1] 5843 	xor a,seedy+1
      00A0F5 97               [ 1] 5844 	ld xl,a 
      00A0F6 9E               [ 1] 5845 	ld a,xh 
      00A0F7 C8 00 15         [ 1] 5846 	xor a,seedy
      00A0FA 95               [ 1] 5847 	ld xh,a 
      00A0FB CF 00 15         [ 2] 5848 	ldw seedy,x 
                                   5849 ; return seedy modulo expr + 1 
      00A0FE 90 85            [ 2] 5850 	popw y 
      00A100 65               [ 2] 5851 	divw x,y 
      00A101 93               [ 1] 5852 	ldw x,y 
      00A102 5C               [ 1] 5853 	incw x 
      00A103                       5854 10$:
      00A103 A6 84            [ 1] 5855 	ld a,#TK_INTGR
      00A105 81               [ 4] 5856 	ret 
                                   5857 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   5858 ;---------------------------------
                                   5859 ; BASIC: WORDS 
                                   5860 ; affiche la listes des mots du
                                   5861 ; dictionnaire ainsi que le nombre
                                   5862 ; de mots.
                                   5863 ;---------------------------------
                           000001  5864 	WLEN=1 ; word length
                           000002  5865 	LLEN=2 ; character sent to console
                           000003  5866 	WCNT=3 ; count words printed 
                           000003  5867 	VSIZE=3 
      00A106                       5868 words:
      002086                       5869 	_vars VSIZE
      00A106 52 03            [ 2]    1     sub sp,#VSIZE 
      00A108 0F 02            [ 1] 5870 	clr (LLEN,sp)
      00A10A 0F 03            [ 1] 5871 	clr (WCNT,sp)
      00A10C 90 AE A9 10      [ 2] 5872 	ldw y,#kword_dict+2
      00A110 93               [ 1] 5873 0$:	ldw x,y
      00A111 F6               [ 1] 5874 	ld a,(x)
      00A112 A4 0F            [ 1] 5875 	and a,#15 
      00A114 6B 01            [ 1] 5876 	ld (WLEN,sp),a 
      00A116 0C 03            [ 1] 5877 	inc (WCNT,sp)
      00A118 5C               [ 1] 5878 1$:	incw x 
      00A119 F6               [ 1] 5879 	ld a,(x)
      00A11A CD 83 8A         [ 4] 5880 	call putc 
      00A11D 0C 02            [ 1] 5881 	inc (LLEN,sp)
      00A11F 0A 01            [ 1] 5882 	dec (WLEN,sp)
      00A121 26 F5            [ 1] 5883 	jrne 1$
      00A123 A6 46            [ 1] 5884 	ld a,#70
      00A125 11 02            [ 1] 5885 	cp a,(LLEN,sp)
      00A127 2B 09            [ 1] 5886 	jrmi 2$   
      00A129 A6 20            [ 1] 5887 	ld a,#SPACE 
      00A12B CD 83 8A         [ 4] 5888 	call putc 
      00A12E 0C 02            [ 1] 5889 	inc (LLEN,sp) 
      00A130 20 07            [ 2] 5890 	jra 3$
      00A132 A6 0D            [ 1] 5891 2$: ld a,#CR 
      00A134 CD 83 8A         [ 4] 5892 	call putc 
      00A137 0F 02            [ 1] 5893 	clr (LLEN,sp)
      00A139 72 A2 00 02      [ 2] 5894 3$:	subw y,#2 
      00A13D 90 FE            [ 2] 5895 	ldw y,(y)
      00A13F 26 CF            [ 1] 5896 	jrne 0$ 
      00A141 A6 0D            [ 1] 5897 	ld a,#CR 
      00A143 CD 83 8A         [ 4] 5898 	call putc  
      00A146 5F               [ 1] 5899 	clrw x 
      00A147 7B 03            [ 1] 5900 	ld a,(WCNT,sp)
      00A149 97               [ 1] 5901 	ld xl,a 
      00A14A CD 8A B8         [ 4] 5902 	call print_int 
      00A14D AE A1 56         [ 2] 5903 	ldw x,#words_count_msg
      00A150 CD AA 40         [ 4] 5904 	call puts 
      0020D3                       5905 	_drop VSIZE 
      00A153 5B 03            [ 2]    1     addw sp,#VSIZE 
      00A155 81               [ 4] 5906 	ret 
      00A156 20 77 6F 72 64 73 20  5907 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   5908 
                                   5909 
                                   5910 ;-----------------------------
                                   5911 ; BASIC: TIMER expr 
                                   5912 ; initialize count down timer 
                                   5913 ;-----------------------------
      00A16C                       5914 set_timer:
      00A16C CD 91 3D         [ 4] 5915 	call arg_list
      00A16F A1 01            [ 1] 5916 	cp a,#1 
      00A171 27 03            [ 1] 5917 	jreq 1$
      00A173 CC 89 65         [ 2] 5918 	jp syntax_error
      00A176                       5919 1$: 
      00A176 85               [ 2] 5920 	popw x 
      00A177 CF 00 11         [ 2] 5921 	ldw timer,x 
      00A17A 81               [ 4] 5922 	ret 
                                   5923 
                                   5924 ;------------------------------
                                   5925 ; BASIC: TIMEOUT 
                                   5926 ; return state of timer 
                                   5927 ;------------------------------
      00A17B                       5928 timeout:
      00A17B CE 00 11         [ 2] 5929 	ldw x,timer 
      00A17E                       5930 logical_complement:
      00A17E 53               [ 2] 5931 	cplw x 
      00A17F A3 FF FF         [ 2] 5932 	cpw x,#-1
      00A182 27 01            [ 1] 5933 	jreq 2$
      00A184 5F               [ 1] 5934 	clrw x 
      00A185 A6 84            [ 1] 5935 2$:	ld a,#TK_INTGR
      00A187 81               [ 4] 5936 	ret 
                                   5937 
                                   5938 ;--------------------------------
                                   5939 ; BASIC NOT(expr) 
                                   5940 ; return logical complement of expr
                                   5941 ;--------------------------------
      00A188                       5942 func_not:
      00A188 CD 91 38         [ 4] 5943 	call func_args  
      00A18B A1 01            [ 1] 5944 	cp a,#1
      00A18D 27 03            [ 1] 5945 	jreq 1$
      00A18F CC 89 65         [ 2] 5946 	jp syntax_error
      00A192 85               [ 2] 5947 1$:	popw x 
      00A193 20 E9            [ 2] 5948 	jra logical_complement
                                   5949 
                                   5950 
                                   5951 
                                   5952 ;-----------------------------------
                                   5953 ; BASIC: IWDGEN expr1 
                                   5954 ; enable independant watchdog timer
                                   5955 ; expr1 is delay in multiple of 62.5µsec
                                   5956 ; expr1 -> {1..16383}
                                   5957 ;-----------------------------------
      00A195                       5958 enable_iwdg:
      00A195 CD 91 3D         [ 4] 5959 	call arg_list
      00A198 A1 01            [ 1] 5960 	cp a,#1 
      00A19A 27 03            [ 1] 5961 	jreq 1$
      00A19C CC 89 65         [ 2] 5962 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00A19F 85               [ 2] 5963 1$: popw x 
      00A1A0 4B 00            [ 1] 5964 	push #0
      00A1A2 35 CC 50 E0      [ 1] 5965 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A1A6 9E               [ 1] 5966 	ld a,xh 
      00A1A7 A4 3F            [ 1] 5967 	and a,#0x3f
      00A1A9 95               [ 1] 5968 	ld xh,a  
      00A1AA A3 00 FF         [ 2] 5969 2$:	cpw x,#255
      00A1AD 23 06            [ 2] 5970 	jrule 3$
      00A1AF 0C 01            [ 1] 5971 	inc (1,sp)
      00A1B1 98               [ 1] 5972 	rcf 
      00A1B2 56               [ 2] 5973 	rrcw x 
      00A1B3 20 F5            [ 2] 5974 	jra 2$
      00A1B5 35 55 50 E0      [ 1] 5975 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A1B9 84               [ 1] 5976 	pop a  
      00A1BA C7 50 E1         [ 1] 5977 	ld IWDG_PR,a 
      00A1BD 9F               [ 1] 5978 	ld a,xl
      00A1BE 4A               [ 1] 5979 	dec a 
      00A1BF 35 55 50 E0      [ 1] 5980 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A1C3 C7 50 E2         [ 1] 5981 	ld IWDG_RLR,a 
      00A1C6 35 AA 50 E0      [ 1] 5982 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A1CA 81               [ 4] 5983 	ret 
                                   5984 
                                   5985 
                                   5986 ;-----------------------------------
                                   5987 ; BASIC: IWDGREF  
                                   5988 ; refresh independant watchdog count down 
                                   5989 ; timer before it reset MCU. 
                                   5990 ;-----------------------------------
      00A1CB                       5991 refresh_iwdg:
      00A1CB 35 AA 50 E0      [ 1] 5992 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A1CF 81               [ 4] 5993 	ret 
                                   5994 
                                   5995 
                                   5996 ;-------------------------------------
                                   5997 ; BASIC: LOG(expr)
                                   5998 ; return logarithm base 2 of expr 
                                   5999 ; this is the position of most significant
                                   6000 ; bit set. 
                                   6001 ; input: 
                                   6002 ; output:
                                   6003 ;   X     log2 
                                   6004 ;   A     TK_INTGR 
                                   6005 ;*********************************
      00A1D0                       6006 log2:
      00A1D0 CD 91 38         [ 4] 6007 	call func_args 
      00A1D3 A1 01            [ 1] 6008 	cp a,#1 
      00A1D5 27 03            [ 1] 6009 	jreq 1$
      00A1D7 CC 89 65         [ 2] 6010 	jp syntax_error 
      00A1DA 85               [ 2] 6011 1$: popw x 
      00A1DB                       6012 leading_one:
      00A1DB 5D               [ 2] 6013 	tnzw x 
      00A1DC 27 0A            [ 1] 6014 	jreq 4$
      00A1DE A6 0F            [ 1] 6015 	ld a,#15 
      00A1E0 59               [ 2] 6016 2$: rlcw x 
      00A1E1 25 03            [ 1] 6017     jrc 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      00A1E3 4A               [ 1] 6018 	dec a 
      00A1E4 20 FA            [ 2] 6019 	jra 2$
      00A1E6 5F               [ 1] 6020 3$: clrw x 
      00A1E7 97               [ 1] 6021     ld xl,a
      00A1E8 A6 84            [ 1] 6022 4$:	ld a,#TK_INTGR
      00A1EA 81               [ 4] 6023 	ret 
                                   6024 
                                   6025 ;-----------------------------------
                                   6026 ; BASIC: BIT(expr) 
                                   6027 ; expr ->{0..15}
                                   6028 ; return 2^expr 
                                   6029 ; output:
                                   6030 ;    x    2^expr 
                                   6031 ;-----------------------------------
      00A1EB                       6032 bitmask:
      00A1EB CD 91 38         [ 4] 6033     call func_args 
      00A1EE A1 01            [ 1] 6034 	cp a,#1
      00A1F0 27 03            [ 1] 6035 	jreq 1$
      00A1F2 CC 89 65         [ 2] 6036 	jp syntax_error 
      00A1F5 85               [ 2] 6037 1$: popw x 
      00A1F6 9F               [ 1] 6038 	ld a,xl 
      00A1F7 A4 0F            [ 1] 6039 	and a,#15
      00A1F9 5F               [ 1] 6040 	clrw x 
      00A1FA 5C               [ 1] 6041 	incw x 
      00A1FB 4D               [ 1] 6042 2$: tnz a 
      00A1FC 27 04            [ 1] 6043 	jreq 3$
      00A1FE 58               [ 2] 6044 	slaw x 
      00A1FF 4A               [ 1] 6045 	dec a 
      00A200 20 F9            [ 2] 6046 	jra 2$ 
      00A202 A6 84            [ 1] 6047 3$: ld a,#TK_INTGR
      00A204 81               [ 4] 6048 	ret 
                                   6049 
                                   6050 ;------------------------------
                                   6051 ; BASIC: INVERT(expr)
                                   6052 ; 1's complement 
                                   6053 ;--------------------------------
      00A205                       6054 invert:
      00A205 CD 91 38         [ 4] 6055 	call func_args
      00A208 A1 01            [ 1] 6056 	cp a,#1 
      00A20A 27 03            [ 1] 6057 	jreq 1$
      00A20C CC 89 65         [ 2] 6058 	jp syntax_error
      00A20F 85               [ 2] 6059 1$: popw x  
      00A210 53               [ 2] 6060 	cplw x 
      00A211 A6 84            [ 1] 6061 	ld a,#TK_INTGR 
      00A213 81               [ 4] 6062 	ret 
                                   6063 
                                   6064 ;------------------------------
                                   6065 ; BASIC: DO 
                                   6066 ; initiate a DO ... UNTIL loop 
                                   6067 ;------------------------------
                           000003  6068 	DOLP_ADR=3 
                           000005  6069 	DOLP_INW=5
                           000004  6070 	VSIZE=4 
      00A214                       6071 do_loop:
      00A214 85               [ 2] 6072 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      002195                       6073 	_vars VSIZE 
      00A215 52 04            [ 2]    1     sub sp,#VSIZE 
      00A217 89               [ 2] 6074 	pushw x 
      00A218 90 CE 00 05      [ 2] 6075 	ldw y,basicptr 
      00A21C 17 03            [ 2] 6076 	ldw (DOLP_ADR,sp),y
      00A21E 90 CE 00 01      [ 2] 6077 	ldw y,in.w 
      00A222 17 05            [ 2] 6078 	ldw (DOLP_INW,sp),y
      00A224 72 5C 00 21      [ 1] 6079 	inc loop_depth 
      00A228 81               [ 4] 6080 	ret 
                                   6081 
                                   6082 ;--------------------------------
                                   6083 ; BASIC: UNTIL expr 
                                   6084 ; loop if exprssion is false 
                                   6085 ; else terminate loop
                                   6086 ;--------------------------------
      00A229                       6087 until: 
      00A229 72 5D 00 21      [ 1] 6088 	tnz loop_depth 
      00A22D 26 03            [ 1] 6089 	jrne 1$ 
      00A22F CC 89 65         [ 2] 6090 	jp syntax_error 
      00A232                       6091 1$: 
      00A232 CD 92 88         [ 4] 6092 	call relation 
      00A235 A1 84            [ 1] 6093 	cp a,#TK_INTGR
      00A237 27 03            [ 1] 6094 	jreq 2$
      00A239 CC 89 65         [ 2] 6095 	jp syntax_error
      00A23C                       6096 2$: 
      00A23C 5D               [ 2] 6097 	tnzw x 
      00A23D 26 10            [ 1] 6098 	jrne 9$
      00A23F 1E 03            [ 2] 6099 	ldw x,(DOLP_ADR,sp)
      00A241 CF 00 05         [ 2] 6100 	ldw basicptr,x 
      00A244 E6 02            [ 1] 6101 	ld a,(2,x)
      00A246 C7 00 04         [ 1] 6102 	ld count,a 
      00A249 1E 05            [ 2] 6103 	ldw x,(DOLP_INW,sp)
      00A24B CF 00 01         [ 2] 6104 	ldw in.w,x 
      00A24E 81               [ 4] 6105 	ret 
      00A24F                       6106 9$:	; remove loop data from stack  
      00A24F 85               [ 2] 6107 	popw x
      0021D0                       6108 	_drop VSIZE
      00A250 5B 04            [ 2]    1     addw sp,#VSIZE 
      00A252 72 5A 00 21      [ 1] 6109 	dec loop_depth 
      00A256 FC               [ 2] 6110 	jp (x)
                                   6111 
                                   6112 ;--------------------------
                                   6113 ; BASIC: PRTA...PRTI  
                                   6114 ;  return constant value 
                                   6115 ;  PORT  offset in GPIO
                                   6116 ;  array
                                   6117 ;---------------------------
      00A257                       6118 const_porta:
      00A257 AE 00 00         [ 2] 6119 	ldw x,#0
      00A25A A6 84            [ 1] 6120 	ld a,#TK_INTGR 
      00A25C 81               [ 4] 6121 	ret 
      00A25D                       6122 const_portb:
      00A25D AE 00 01         [ 2] 6123 	ldw x,#1
      00A260 A6 84            [ 1] 6124 	ld a,#TK_INTGR 
      00A262 81               [ 4] 6125 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00A263                       6126 const_portc:
      00A263 AE 00 02         [ 2] 6127 	ldw x,#2
      00A266 A6 84            [ 1] 6128 	ld a,#TK_INTGR 
      00A268 81               [ 4] 6129 	ret 
      00A269                       6130 const_portd:
      00A269 AE 00 03         [ 2] 6131 	ldw x,#3
      00A26C A6 84            [ 1] 6132 	ld a,#TK_INTGR 
      00A26E 81               [ 4] 6133 	ret 
      00A26F                       6134 const_porte:
      00A26F AE 00 04         [ 2] 6135 	ldw x,#4
      00A272 A6 84            [ 1] 6136 	ld a,#TK_INTGR 
      00A274 81               [ 4] 6137 	ret 
      00A275                       6138 const_portf:
      00A275 AE 00 05         [ 2] 6139 	ldw x,#5
      00A278 A6 84            [ 1] 6140 	ld a,#TK_INTGR 
      00A27A 81               [ 4] 6141 	ret 
      00A27B                       6142 const_portg:
      00A27B AE 00 06         [ 2] 6143 	ldw x,#6
      00A27E A6 84            [ 1] 6144 	ld a,#TK_INTGR 
      00A280 81               [ 4] 6145 	ret 
      00A281                       6146 const_porth:
      00A281 AE 00 07         [ 2] 6147 	ldw x,#7
      00A284 A6 84            [ 1] 6148 	ld a,#TK_INTGR 
      00A286 81               [ 4] 6149 	ret 
      00A287                       6150 const_porti:
      00A287 AE 00 08         [ 2] 6151 	ldw x,#8
      00A28A A6 84            [ 1] 6152 	ld a,#TK_INTGR 
      00A28C 81               [ 4] 6153 	ret 
                                   6154 
                                   6155 ;-------------------------------
                                   6156 ; following return constant 
                                   6157 ; related to GPIO register offset 
                                   6158 ;---------------------------------
      00A28D                       6159 const_odr:
      00A28D A6 84            [ 1] 6160 	ld a,#TK_INTGR 
      00A28F AE 00 00         [ 2] 6161 	ldw x,#GPIO_ODR
      00A292 81               [ 4] 6162 	ret 
      00A293                       6163 const_idr:
      00A293 A6 84            [ 1] 6164 	ld a,#TK_INTGR 
      00A295 AE 00 01         [ 2] 6165 	ldw x,#GPIO_IDR
      00A298 81               [ 4] 6166 	ret 
      00A299                       6167 const_ddr:
      00A299 A6 84            [ 1] 6168 	ld a,#TK_INTGR 
      00A29B AE 00 02         [ 2] 6169 	ldw x,#GPIO_DDR
      00A29E 81               [ 4] 6170 	ret 
      00A29F                       6171 const_cr1:
      00A29F A6 84            [ 1] 6172 	ld a,#TK_INTGR 
      00A2A1 AE 00 03         [ 2] 6173 	ldw x,#GPIO_CR1
      00A2A4 81               [ 4] 6174 	ret 
      00A2A5                       6175 const_cr2:
      00A2A5 A6 84            [ 1] 6176 	ld a,#TK_INTGR 
      00A2A7 AE 00 04         [ 2] 6177 	ldw x,#GPIO_CR2
      00A2AA 81               [ 4] 6178 	ret 
                                   6179 ;-------------------------
                                   6180 ;  constant for port mode
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                   6181 ;  used by PMODE 
                                   6182 ;  input or output
                                   6183 ;------------------------
      00A2AB                       6184 const_output:
      00A2AB A6 84            [ 1] 6185 	ld a,#TK_INTGR 
      00A2AD AE 00 01         [ 2] 6186 	ldw x,#OUTP
      00A2B0 81               [ 4] 6187 	ret 
      00A2B1                       6188 const_input:
      00A2B1 A6 84            [ 1] 6189 	ld a,#TK_INTGR 
      00A2B3 AE 00 00         [ 2] 6190 	ldw x,#INP 
      00A2B6 81               [ 4] 6191 	ret 
                                   6192 ;-----------------------
                                   6193 ; memory area constants
                                   6194 ;-----------------------
      00A2B7                       6195 const_eeprom_base:
      00A2B7 A6 84            [ 1] 6196 	ld a,#TK_INTGR 
      00A2B9 AE 40 00         [ 2] 6197 	ldw x,#EEPROM_BASE 
      00A2BC 81               [ 4] 6198 	ret 
                                   6199 
                                   6200 ;---------------------------
                                   6201 ; BASIC: DATA 
                                   6202 ; when the interpreter find 
                                   6203 ; a DATA line it skip it.
                                   6204 ;---------------------------
      00A2BD                       6205 data:
      00A2BD 55 00 04 00 02   [ 1] 6206 	mov in,count 
      00A2C2 81               [ 4] 6207 	ret 
                                   6208 
                                   6209 ;---------------------------
                                   6210 ; BASIC: DATLN  *expr*
                                   6211 ; set DATA pointer at line# 
                                   6212 ; specified by *expr* 
                                   6213 ;---------------------------
      00A2C3                       6214 data_line:
      00A2C3 CD 92 3C         [ 4] 6215 	call expression
      00A2C6 A1 84            [ 1] 6216 	cp a,#TK_INTGR
      00A2C8 27 03            [ 1] 6217 	jreq 1$
      00A2CA CC 89 65         [ 2] 6218 	jp syntax_error 
      00A2CD CD 84 E1         [ 4] 6219 1$: call search_lineno
      00A2D0 5D               [ 2] 6220 	tnzw x 
      00A2D1 26 05            [ 1] 6221 	jrne 3$
      00A2D3 A6 05            [ 1] 6222 2$:	ld a,#ERR_NO_LINE 
      00A2D5 CC 89 67         [ 2] 6223 	jp tb_error
      00A2D8                       6224 3$: ; check if valid data line 
      00A2D8 90 93            [ 1] 6225     ldw y,x 
      00A2DA EE 04            [ 2] 6226 	ldw x,(4,x)
      00A2DC A3 A2 BD         [ 2] 6227 	cpw x,#data 
      00A2DF 26 F2            [ 1] 6228 	jrne 2$ 
      00A2E1 90 CF 00 07      [ 2] 6229 	ldw data_ptr,y
      00A2E5 90 E6 02         [ 1] 6230 	ld a,(2,y)
      00A2E8 C7 00 0A         [ 1] 6231 	ld data_len,a 
      00A2EB 35 06 00 09      [ 1] 6232 	mov data_ofs,#FIRST_DATA_ITEM 
      00A2EF 81               [ 4] 6233 	ret
                                   6234 
                                   6235 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                   6236 ; BASIC: RESTORE 
                                   6237 ; set data_ptr to first data line
                                   6238 ; if not DATA found pointer set to
                                   6239 ; zero 
                                   6240 ;---------------------------------
      00A2F0                       6241 restore:
      00A2F0 72 5F 00 07      [ 1] 6242 	clr data_ptr 
      00A2F4 72 5F 00 08      [ 1] 6243 	clr data_ptr+1
      00A2F8 72 5F 00 09      [ 1] 6244 	clr data_ofs 
      00A2FC 72 5F 00 0A      [ 1] 6245 	clr data_len
      00A300 CE 00 1D         [ 2] 6246 	ldw x,txtbgn
      00A303                       6247 data_search_loop: 	
      00A303 C3 00 1F         [ 2] 6248 	cpw x,txtend
      00A306 24 1B            [ 1] 6249 	jruge 9$
      00A308 90 93            [ 1] 6250 	ldw y,x 
      00A30A EE 04            [ 2] 6251 	ldw x,(4,x)
      00A30C 1C A9 16         [ 2] 6252 	addw x,#code_addr
      00A30F FE               [ 2] 6253 	ldw x,(x)
      00A310 A3 A2 BD         [ 2] 6254 	cpw x,#data 
      00A313 26 1A            [ 1] 6255 	jrne try_next_line 
      00A315 90 CF 00 07      [ 2] 6256 	ldw data_ptr,y 
      00A319 90 E6 02         [ 1] 6257 	ld a,(2,y)
      00A31C C7 00 0A         [ 1] 6258 	ld data_len,a 
      00A31F 35 06 00 09      [ 1] 6259 	mov data_ofs,#FIRST_DATA_ITEM
      00A323 72 5D 00 0A      [ 1] 6260 9$:	tnz data_len 
      00A327 26 05            [ 1] 6261     jrne 10$
      00A329 A6 0C            [ 1] 6262 	ld a,#ERR_NO_DATA 
      00A32B CC 89 67         [ 2] 6263 	jp tb_error 
      00A32E 81               [ 4] 6264 10$:ret
      00A32F                       6265 try_next_line:
      00A32F 93               [ 1] 6266 	ldw x,y 
      00A330 E6 02            [ 1] 6267 	ld a,(2,x)
      00A332 C7 00 0E         [ 1] 6268 	ld acc8,a 
      00A335 72 5F 00 0D      [ 1] 6269 	clr acc16 
      00A339 72 BB 00 0D      [ 2] 6270 	addw x,acc16 
      00A33D 20 C4            [ 2] 6271 	jra data_search_loop
                                   6272 
                                   6273 
                                   6274 ;---------------------------------
                                   6275 ; BASIC: READ 
                                   6276 ; return next data item | 0 
                                   6277 ;---------------------------------
                           000001  6278 	CTX_BPTR=1 
                           000003  6279 	CTX_IN=3 
                           000004  6280 	CTX_COUNT=4 
                           000005  6281 	XSAVE=5
                           000006  6282 	VSIZE=6
      00A33F                       6283 read:
      0022BF                       6284 	_vars  VSIZE 
      00A33F 52 06            [ 2]    1     sub sp,#VSIZE 
      00A341                       6285 read01:	
      00A341 C6 00 09         [ 1] 6286 	ld a,data_ofs
      00A344 C1 00 0A         [ 1] 6287 	cp a,data_len 
      00A347 27 37            [ 1] 6288 	jreq 2$ ; end of line  
      00A349 CD 96 8F         [ 4] 6289 	call save_context
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      00A34C CE 00 07         [ 2] 6290 	ldw x,data_ptr 
      00A34F CF 00 05         [ 2] 6291 	ldw basicptr,x 
      00A352 55 00 09 00 02   [ 1] 6292 	mov in,data_ofs 
      00A357 55 00 0A 00 04   [ 1] 6293 	mov count,data_len  
      00A35C CD 92 3C         [ 4] 6294 	call expression 
      00A35F A1 84            [ 1] 6295 	cp a,#TK_INTGR 
      00A361 27 03            [ 1] 6296 	jreq 1$ 
      00A363 CC 89 65         [ 2] 6297 	jp syntax_error 
      00A366                       6298 1$:
      00A366 1F 05            [ 2] 6299 	ldw (XSAVE,SP),x
      00A368 CD 8A 57         [ 4] 6300 	call next_token ; skip comma
      00A36B CE 00 05         [ 2] 6301 	ldw x,basicptr 
      00A36E CF 00 07         [ 2] 6302 	ldw data_ptr,x 
      00A371 55 00 02 00 09   [ 1] 6303 	mov data_ofs,in 
      00A376 CD 96 9F         [ 4] 6304 	call rest_context
      00A379 1E 05            [ 2] 6305 	ldw x,(XSAVE,sp)
      00A37B A6 84            [ 1] 6306 	ld a,#TK_INTGR
      0022FD                       6307 	_drop VSIZE 
      00A37D 5B 06            [ 2]    1     addw sp,#VSIZE 
      00A37F 81               [ 4] 6308 	ret 
      00A380                       6309 2$: ; end of line reached 
      00A380 90 CE 00 07      [ 2] 6310 	ldw y, data_ptr 
      00A384 72 5F 00 07      [ 1] 6311 	clr data_ptr
      00A388 72 5F 00 08      [ 1] 6312 	clr data_ptr+1   
      00A38C 72 5F 00 09      [ 1] 6313 	clr data_ofs 
      00A390 72 5F 00 0A      [ 1] 6314 	clr data_len 
      00A394 CD A3 2F         [ 4] 6315 	call try_next_line 
      00A397 20 A8            [ 2] 6316 	jra read01
                                   6317 
                                   6318 
                                   6319 ;---------------------------------
                                   6320 ; BASIC: SPIEN clkdiv, 0|1  
                                   6321 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6322 ; if clkdiv==-1 disable SPI
                                   6323 ; 0|1 -> disable|enable  
                                   6324 ;--------------------------------- 
                           000005  6325 SPI_CS_BIT=5
      00A399                       6326 spi_enable:
      00A399 CD 91 3D         [ 4] 6327 	call arg_list 
      00A39C A1 02            [ 1] 6328 	cp a,#2
      00A39E 27 03            [ 1] 6329 	jreq 1$
      00A3A0 CC 89 65         [ 2] 6330 	jp syntax_error 
      00A3A3                       6331 1$: 
      00A3A3 72 12 50 C7      [ 1] 6332 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A3A7 85               [ 2] 6333 	popw x  
      00A3A8 5D               [ 2] 6334 	tnzw x 
      00A3A9 27 21            [ 1] 6335 	jreq spi_disable 
      00A3AB 85               [ 2] 6336 	popw x 
      00A3AC A6 08            [ 1] 6337 	ld a,#(1<<SPI_CR1_BR)
      00A3AE 42               [ 4] 6338 	mul x,a 
      00A3AF 9F               [ 1] 6339 	ld a,xl 
      00A3B0 C7 52 00         [ 1] 6340 	ld SPI_CR1,a 
                                   6341 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A3B3 72 1A 50 14      [ 1] 6342 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A3B7 72 1A 50 16      [ 1] 6343 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                   6344 ; configure SPI as master mode 0.	
      00A3BB 72 14 52 00      [ 1] 6345 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6346 ; ~CS line controlled by sofware 	
      00A3BF 72 12 52 01      [ 1] 6347 	bset SPI_CR2,#SPI_CR2_SSM 
      00A3C3 72 10 52 01      [ 1] 6348     bset SPI_CR2,#SPI_CR2_SSI 
                                   6349 ; enable SPI
      00A3C7 72 1C 52 00      [ 1] 6350 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A3CB 81               [ 4] 6351 	ret 
      00A3CC                       6352 spi_disable:
      00234C                       6353 	_drop #2; throw first argument.
      00A3CC 5B 02            [ 2]    1     addw sp,##2 
                                   6354 ; wait spi idle 
      00A3CE A6 82            [ 1] 6355 1$:	ld a,#0x82 
      00A3D0 C4 52 03         [ 1] 6356 	and a,SPI_SR
      00A3D3 A1 02            [ 1] 6357 	cp a,#2 
      00A3D5 26 F7            [ 1] 6358 	jrne 1$
      00A3D7 72 1D 52 00      [ 1] 6359 	bres SPI_CR1,#SPI_CR1_SPE
      00A3DB 72 13 50 C7      [ 1] 6360 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A3DF 72 1B 50 16      [ 1] 6361 	bres PE_DDR,#SPI_CS_BIT 
      00A3E3 81               [ 4] 6362 	ret 
                                   6363 
      00A3E4                       6364 spi_clear_error:
      00A3E4 A6 78            [ 1] 6365 	ld a,#0x78 
      00A3E6 C5 52 03         [ 1] 6366 	bcp a,SPI_SR 
      00A3E9 27 04            [ 1] 6367 	jreq 1$
      00A3EB 72 5F 52 03      [ 1] 6368 	clr SPI_SR 
      00A3EF 81               [ 4] 6369 1$: ret 
                                   6370 
      00A3F0                       6371 spi_send_byte:
      00A3F0 88               [ 1] 6372 	push a 
      00A3F1 CD A3 E4         [ 4] 6373 	call spi_clear_error
      00A3F4 84               [ 1] 6374 	pop a 
      00A3F5 72 03 52 03 FB   [ 2] 6375 	btjf SPI_SR,#SPI_SR_TXE,.
      00A3FA C7 52 04         [ 1] 6376 	ld SPI_DR,a
      00A3FD 72 01 52 03 FB   [ 2] 6377 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A402 C6 52 04         [ 1] 6378 	ld a,SPI_DR 
      00A405 81               [ 4] 6379 	ret 
                                   6380 
      00A406                       6381 spi_rcv_byte:
      00A406 A6 FF            [ 1] 6382 	ld a,#255
      00A408 72 01 52 03 E3   [ 2] 6383 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A40D C6 52 04         [ 1] 6384 	ld a,SPI_DR 
      00A410 81               [ 4] 6385 	ret
                                   6386 
                                   6387 ;------------------------------
                                   6388 ; BASIC: SPIWR byte [,byte]
                                   6389 ; write 1 or more byte
                                   6390 ;------------------------------
      00A411                       6391 spi_write:
      00A411 CD 92 3C         [ 4] 6392 	call expression
      00A414 A1 84            [ 1] 6393 	cp a,#TK_INTGR 
      00A416 27 03            [ 1] 6394 	jreq 1$
      00A418 CC 89 65         [ 2] 6395 	jp syntax_error 
      00A41B                       6396 1$:	
      00A41B 9F               [ 1] 6397 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A41C CD A3 F0         [ 4] 6398 	call spi_send_byte 
      00A41F CD 8A 57         [ 4] 6399 	call next_token 
      00A422 A1 09            [ 1] 6400 	cp a,#TK_COMMA 
      00A424 26 02            [ 1] 6401 	jrne 2$ 
      00A426 20 E9            [ 2] 6402 	jra spi_write 
      00A428 4D               [ 1] 6403 2$:	tnz a 
      00A429 27 05            [ 1] 6404 	jreq 3$
      0023AB                       6405 	_unget_token  
      00A42B 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      00A430 81               [ 4] 6406 3$:	ret 
                                   6407 
                                   6408 
                                   6409 ;-------------------------------
                                   6410 ; BASIC: SPIRD 	
                                   6411 ; read one byte from SPI 
                                   6412 ;-------------------------------
      00A431                       6413 spi_read:
      00A431 CD A4 06         [ 4] 6414 	call spi_rcv_byte 
      00A434 5F               [ 1] 6415 	clrw x 
      00A435 97               [ 1] 6416 	ld xl,a 
      00A436 A6 84            [ 1] 6417 	ld a,#TK_INTGR 
      00A438 81               [ 4] 6418 	ret 
                                   6419 
                                   6420 ;------------------------------
                                   6421 ; BASIC: SPISEL 0|1 
                                   6422 ; set state of ~CS line
                                   6423 ; 0|1 deselect|select  
                                   6424 ;------------------------------
      00A439                       6425 spi_select:
      00A439 CD 8A 57         [ 4] 6426 	call next_token 
      00A43C A1 84            [ 1] 6427 	cp a,#TK_INTGR 
      00A43E 27 03            [ 1] 6428 	jreq 1$
      00A440 CC 89 65         [ 2] 6429 	jp syntax_error 
      00A443 5D               [ 2] 6430 1$: tnzw x  
      00A444 27 05            [ 1] 6431 	jreq cs_high 
      00A446 72 1B 50 14      [ 1] 6432 	bres PE_ODR,#SPI_CS_BIT
      00A44A 81               [ 4] 6433 	ret 
      00A44B                       6434 cs_high: 
      00A44B 72 1A 50 14      [ 1] 6435 	bset PE_ODR,#SPI_CS_BIT
      00A44F 81               [ 4] 6436 	ret 
                                   6437 
                                   6438 
                                   6439 ;-------------------------------
                                   6440 ; BASIC: PAD 
                                   6441 ; Return pad buffer address.
                                   6442 ;------------------------------
      00A450                       6443 pad_ref:
      00A450 AE 16 E0         [ 2] 6444 	ldw x,#pad 
      00A453 B6 84            [ 1] 6445 	ld a,TK_INTGR
      00A455 81               [ 4] 6446 	ret 
                                   6447 
                                   6448 ;------------------------------
                                   6449 ; BASIC; XTRMT  
                                   6450 ; transmit file using xmodem protocol
                                   6451 ; via terminal serial port 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                                   6452 ;------------------------------------
                           000001  6453 	SERIAL=1 ;packet serial number
                           000001  6454 	VAR_SIZE=1
      00A456                       6455 transmit:
      0023D6                       6456 	_vars VAR_SIZE
      00A456 52 01            [ 2]    1     sub sp,#VAR_SIZE 
                                   6457 ; transmit on other channel 	
      00A458 A6 02            [ 1] 6458 	ld a,#UART3 
      00A45A C0 00 30         [ 1] 6459 	sub a,comm 
      00A45D CD A5 0D         [ 4] 6460 	call con_sel  
      00A460 90 AE 27 10      [ 2] 6461 	ldw y,#10000
      00A464 CD AD 06         [ 4] 6462 	call wait_ack ; receiver must send NAK  
      00A467 A1 15            [ 1] 6463 	cp a,#NAK 
      00A469 26 2E            [ 1] 6464 	jrne tx_failed
      00A46B 0F 01            [ 1] 6465 	clr (SERIAL,sp)
      00A46D CE 00 1D         [ 2] 6466 	ldw x,txtbgn
      00A470                       6467 tx_loop:
      00A470 7B 01            [ 1] 6468 	ld a,(SERIAL,sp)
      00A472 4C               [ 1] 6469 	inc a
      00A473 6B 01            [ 1] 6470 	ld (SERIAL,sp),a 
      00A475 CD AD 29         [ 4] 6471 	call xtrmt_block
      00A478 A1 15            [ 1] 6472 	cp a,#NAK 
      00A47A 27 1D            [ 1] 6473 	jreq tx_failed 
      00A47C C3 00 1F         [ 2] 6474 	cpw x,txtend
      00A47F 25 EF            [ 1] 6475 	jrult tx_loop 
      00A481                       6476 tx_success:
      00A481 A6 04            [ 1] 6477 	ld a,#EOT 
      00A483 CD 83 8A         [ 4] 6478 	call putc 
      00A486 CD AD 06         [ 4] 6479 	call wait_ack 
      00A489 A6 02            [ 1] 6480 	ld a,#UART3 
      00A48B C0 00 30         [ 1] 6481 	sub a,comm 
      00A48E CD A5 0D         [ 4] 6482 	call con_sel 		
      00A491 AE A4 AA         [ 2] 6483 	ldw x,#xtrmt_success 
      00A494 CD AA 40         [ 4] 6484 	call puts 
      00A497 20 0E            [ 2] 6485 	jra tx_exit
      00A499                       6486 tx_failed:
      00A499 A6 02            [ 1] 6487 	ld a,#UART3 
      00A49B C0 00 30         [ 1] 6488 	sub a,comm 
      00A49E CD A5 0D         [ 4] 6489 	call con_sel 		
      00A4A1 AE A4 C6         [ 2] 6490 	ldw x,#xtrmt_failed 
      00A4A4 CD AA 40         [ 4] 6491 	call puts 
      00A4A7                       6492 tx_exit:
      002427                       6493 	_drop VAR_SIZE 
      00A4A7 5B 01            [ 2]    1     addw sp,#VAR_SIZE 
      00A4A9 81               [ 4] 6494 	ret 
      00A4AA 58 4D 4F 44 45 4D 20  6495 xtrmt_success: .asciz "XMODEM transmit succeeded.\n"
             74 72 61 6E 73 6D 69
             74 20 73 75 63 63 65
             65 64 65 64 2E 0A 00
      00A4C6 58 4D 4F 44 45 4D 20  6496 xtrmt_failed: .asciz "XMODEM transmit failed.\n"
             74 72 61 6E 73 6D 69
             74 20 66 61 69 6C 65
             64 2E 0A 00
                                   6497 
                                   6498 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                   6499 ;------------------------------
                                   6500 ; BASIC: XRCV file_name 
                                   6501 ; receive a basic file using
                                   6502 ; xmodem protocol
                                   6503 ; via terminal serial port 
                                   6504 ;------------------------------
      00A4DF                       6505 receive: 
      00A4DF AE A4 E6         [ 2] 6506 	ldw x,#xrcv_msg 
      00A4E2 CD AA 40         [ 4] 6507 	call puts 
      00A4E5 81               [ 4] 6508 	ret
      00A4E6 58 4D 4F 44 45 4D 20  6509 xrcv_msg: .asciz "XMODEM receive"
             72 65 63 65 69 76 65
             00
                                   6510 
                                   6511 ;------------------------------
                                   6512 ; BASIC: COMA  
                                   6513 ; return device id of UART1 
                                   6514 ;------------------------------
      00A4F5                       6515 const_coma:
      00A4F5 A6 84            [ 1] 6516 	ld a,#TK_INTGR
      00A4F7 AE 00 00         [ 2] 6517 	ldw x,#UART1 
      00A4FA 81               [ 4] 6518 	ret
                                   6519 
                                   6520 ;------------------------------
                                   6521 ; BASIC: COMC 
                                   6522 ; return device id of UART3
                                   6523 ;------------------------------
      00A4FB                       6524 const_comc:
      00A4FB A6 84            [ 1] 6525 	ld a,#TK_INTGR
      00A4FD AE 00 02         [ 2] 6526 	ldw x,#UART3 
      00A500 81               [ 4] 6527 	ret 	 
                                   6528 
                                   6529 ;------------------------------
                                   6530 ; BASIC: CONSOLE COMA|COMC
                                   6531 ; select communication channel 
                                   6532 ; default is COMA
                                   6533 ;------------------------------
      00A501                       6534 console_select:
      00A501 CD 8A 57         [ 4] 6535 	call next_token 
      00A504 A1 81            [ 1] 6536 	cp a,#TK_IFUNC
      00A506 27 03            [ 1] 6537 	jreq 1$
      00A508 CC 89 65         [ 2] 6538 	jp syntax_error
      00A50B FD               [ 4] 6539 1$: call (x)
      00A50C 9F               [ 1] 6540 	ld a,xl 
                                   6541 ;-----------------------------
                                   6542 ; comm_sel 
                                   6543 ; input:
                                   6544 ;    A    channel UART1|UART3	
                                   6545 ;----------------------------
      00A50D                       6546 con_sel:: 
      00A50D A1 00            [ 1] 6547 	cp a,#UART1 
      00A50F 27 07            [ 1] 6548 	jreq 4$
      00A511 A1 02            [ 1] 6549 	cp a,#UART3 
      00A513 27 19            [ 1] 6550 	jreq 6$
      00A515 CC 89 65         [ 2] 6551 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A518 C7 00 30         [ 1] 6552 4$: ld comm,a  
      00A51B 72 1B 52 45      [ 1] 6553 	bres UART3_CR2,#UART_CR2_RIEN
      00A51F 72 5F 00 2E      [ 1] 6554 	clr rx_head 
      00A523 72 5F 00 2F      [ 1] 6555 	clr rx_tail  
      00A527 A6 31            [ 1] 6556 	ld a,#UART1_DR
      00A529 72 1A 52 35      [ 1] 6557 	bset UART1_CR2,#UART_CR2_RIEN 
      00A52D 81               [ 4] 6558 	ret 
      00A52E C7 00 30         [ 1] 6559 6$: ld comm,a 
      00A531 72 1B 52 35      [ 1] 6560 	bres UART1_CR2,#UART_CR2_RIEN
      00A535 72 5F 00 2E      [ 1] 6561 	clr rx_head 
      00A539 72 5F 00 2F      [ 1] 6562 	clr rx_tail 
      00A53D A6 41            [ 1] 6563 	ld a,#UART3_DR  
      00A53F 72 1A 52 45      [ 1] 6564 	bset UART3_CR2,#UART_CR2_RIEN 
      00A543 81               [ 4] 6565 	ret 
                                   6566 
                                   6567 ;------------------------------
                                   6568 ;      dictionary 
                                   6569 ; format:
                                   6570 ;   link:   2 bytes 
                                   6571 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6572 ;   cmd_name: 16 byte max 
                                   6573 ;   cmd_index: 2 bytes 
                                   6574 ;------------------------------
                                   6575 	.macro _dict_entry len,name,cmd_idx 
                                   6576 	.word LINK 
                                   6577 	LINK=.
                                   6578 name:
                                   6579 	.byte len 	
                                   6580 	.ascii "name"
                                   6581 	.word cmd_idx 
                                   6582 	.endm 
                                   6583 
                           000000  6584 	LINK=0
                                   6585 ; respect alphabetic order for BASIC names from Z-A
                                   6586 ; this sort order is for a cleaner WORDS cmd output. 	
      00A544                       6587 kword_end:
      0024C4                       6588 	_dict_entry,5,XTRMT,XTRMT_IDX ; xmodem transmit
      00A544 00 00                    1 	.word LINK 
                           0024C6     2 	LINK=.
      00A546                          3 XTRMT:
      00A546 05                       4 	.byte 5 	
      00A547 58 54 52 4D 54           5 	.ascii "XTRMT"
      00A54C 00 C8                    6 	.word XTRMT_IDX 
      0024CE                       6589 	_dict_entry,4,XRCV,XRCV_IDX ; xmodem receive
      00A54E A5 46                    1 	.word LINK 
                           0024D0     2 	LINK=.
      00A550                          3 XRCV:
      00A550 04                       4 	.byte 4 	
      00A551 58 52 43 56              5 	.ascii "XRCV"
      00A555 00 CA                    6 	.word XRCV_IDX 
      0024D7                       6590 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00A557 A5 50                    1 	.word LINK 
                           0024D9     2 	LINK=.
      00A559                          3 XOR:
      00A559 43                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A55A 58 4F 52                 5 	.ascii "XOR"
      00A55D 00 C6                    6 	.word XOR_IDX 
      0024DF                       6591 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A55F A5 59                    1 	.word LINK 
                           0024E1     2 	LINK=.
      00A561                          3 WRITE:
      00A561 05                       4 	.byte 5 	
      00A562 57 52 49 54 45           5 	.ascii "WRITE"
      00A567 00 C4                    6 	.word WRITE_IDX 
      0024E9                       6592 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A569 A5 61                    1 	.word LINK 
                           0024EB     2 	LINK=.
      00A56B                          3 WORDS:
      00A56B 05                       4 	.byte 5 	
      00A56C 57 4F 52 44 53           5 	.ascii "WORDS"
      00A571 00 C2                    6 	.word WORDS_IDX 
      0024F3                       6593 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A573 A5 6B                    1 	.word LINK 
                           0024F5     2 	LINK=.
      00A575                          3 WAIT:
      00A575 04                       4 	.byte 4 	
      00A576 57 41 49 54              5 	.ascii "WAIT"
      00A57A 00 C0                    6 	.word WAIT_IDX 
      0024FC                       6594 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A57C A5 75                    1 	.word LINK 
                           0024FE     2 	LINK=.
      00A57E                          3 USR:
      00A57E 43                       4 	.byte 3+F_IFUNC 	
      00A57F 55 53 52                 5 	.ascii "USR"
      00A582 00 BE                    6 	.word USR_IDX 
      002504                       6595 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A584 A5 7E                    1 	.word LINK 
                           002506     2 	LINK=.
      00A586                          3 UNTIL:
      00A586 05                       4 	.byte 5 	
      00A587 55 4E 54 49 4C           5 	.ascii "UNTIL"
      00A58C 00 BC                    6 	.word UNTIL_IDX 
      00250E                       6596 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A58E A5 86                    1 	.word LINK 
                           002510     2 	LINK=.
      00A590                          3 UFLASH:
      00A590 46                       4 	.byte 6+F_IFUNC 	
      00A591 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      00A597 00 BA                    6 	.word UFLASH_IDX 
      002519                       6597 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A599 A5 90                    1 	.word LINK 
                           00251B     2 	LINK=.
      00A59B                          3 UBOUND:
      00A59B 46                       4 	.byte 6+F_IFUNC 	
      00A59C 55 42 4F 55 4E 44        5 	.ascii "UBOUND"
      00A5A2 00 B8                    6 	.word UBOUND_IDX 
      002524                       6598 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A5A4 A5 9B                    1 	.word LINK 
                           002526     2 	LINK=.
      00A5A6                          3 TONE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A5A6 04                       4 	.byte 4 	
      00A5A7 54 4F 4E 45              5 	.ascii "TONE"
      00A5AB 00 B6                    6 	.word TONE_IDX 
      00252D                       6599 	_dict_entry,2,TO,TO_IDX;to
      00A5AD A5 A6                    1 	.word LINK 
                           00252F     2 	LINK=.
      00A5AF                          3 TO:
      00A5AF 02                       4 	.byte 2 	
      00A5B0 54 4F                    5 	.ascii "TO"
      00A5B2 00 B4                    6 	.word TO_IDX 
      002534                       6600 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A5B4 A5 AF                    1 	.word LINK 
                           002536     2 	LINK=.
      00A5B6                          3 TIMEOUT:
      00A5B6 47                       4 	.byte 7+F_IFUNC 	
      00A5B7 54 49 4D 45 4F 55 54     5 	.ascii "TIMEOUT"
      00A5BE 00 B2                    6 	.word TMROUT_IDX 
      002540                       6601 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A5C0 A5 B6                    1 	.word LINK 
                           002542     2 	LINK=.
      00A5C2                          3 TIMER:
      00A5C2 05                       4 	.byte 5 	
      00A5C3 54 49 4D 45 52           5 	.ascii "TIMER"
      00A5C8 00 B0                    6 	.word TIMER_IDX 
      00254A                       6602 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A5CA A5 C2                    1 	.word LINK 
                           00254C     2 	LINK=.
      00A5CC                          3 TICKS:
      00A5CC 45                       4 	.byte 5+F_IFUNC 	
      00A5CD 54 49 43 4B 53           5 	.ascii "TICKS"
      00A5D2 00 AE                    6 	.word TICKS_IDX 
      002554                       6603 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A5D4 A5 CC                    1 	.word LINK 
                           002556     2 	LINK=.
      00A5D6                          3 STOP:
      00A5D6 04                       4 	.byte 4 	
      00A5D7 53 54 4F 50              5 	.ascii "STOP"
      00A5DB 00 AC                    6 	.word STOP_IDX 
      00255D                       6604 	_dict_entry,4,STEP,STEP_IDX;step 
      00A5DD A5 D6                    1 	.word LINK 
                           00255F     2 	LINK=.
      00A5DF                          3 STEP:
      00A5DF 04                       4 	.byte 4 	
      00A5E0 53 54 45 50              5 	.ascii "STEP"
      00A5E4 00 AA                    6 	.word STEP_IDX 
      002566                       6605 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A5E6 A5 DF                    1 	.word LINK 
                           002568     2 	LINK=.
      00A5E8                          3 SPIWR:
      00A5E8 05                       4 	.byte 5 	
      00A5E9 53 50 49 57 52           5 	.ascii "SPIWR"
      00A5EE 00 A8                    6 	.word SPIWR_IDX 
      002570                       6606 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A5F0 A5 E8                    1 	.word LINK 
                           002572     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A5F2                          3 SPISEL:
      00A5F2 06                       4 	.byte 6 	
      00A5F3 53 50 49 53 45 4C        5 	.ascii "SPISEL"
      00A5F9 00 A6                    6 	.word SPISEL_IDX 
      00257B                       6607 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A5FB A5 F2                    1 	.word LINK 
                           00257D     2 	LINK=.
      00A5FD                          3 SPIEN:
      00A5FD 05                       4 	.byte 5 	
      00A5FE 53 50 49 45 4E           5 	.ascii "SPIEN"
      00A603 00 A4                    6 	.word SPIEN_IDX 
      002585                       6608 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A605 A5 FD                    1 	.word LINK 
                           002587     2 	LINK=.
      00A607                          3 SPIRD:
      00A607 45                       4 	.byte 5+F_IFUNC 	
      00A608 53 50 49 52 44           5 	.ascii "SPIRD"
      00A60D 00 A2                    6 	.word SPIRD_IDX 
      00258F                       6609 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A60F A6 07                    1 	.word LINK 
                           002591     2 	LINK=.
      00A611                          3 SLEEP:
      00A611 05                       4 	.byte 5 	
      00A612 53 4C 45 45 50           5 	.ascii "SLEEP"
      00A617 00 A0                    6 	.word SLEEP_IDX 
      002599                       6610 	_dict_entry,4+F_IFUNC,SIZE,SIZE_IDX;size
      00A619 A6 11                    1 	.word LINK 
                           00259B     2 	LINK=.
      00A61B                          3 SIZE:
      00A61B 44                       4 	.byte 4+F_IFUNC 	
      00A61C 53 49 5A 45              5 	.ascii "SIZE"
      00A620 00 9E                    6 	.word SIZE_IDX 
      0025A2                       6611     _dict_entry,4,SHOW,SHOW_IDX;show 
      00A622 A6 1B                    1 	.word LINK 
                           0025A4     2 	LINK=.
      00A624                          3 SHOW:
      00A624 04                       4 	.byte 4 	
      00A625 53 48 4F 57              5 	.ascii "SHOW"
      00A629 00 9C                    6 	.word SHOW_IDX 
      0025AB                       6612 	_dict_entry,4,SAVE,SAVE_IDX;save
      00A62B A6 24                    1 	.word LINK 
                           0025AD     2 	LINK=.
      00A62D                          3 SAVE:
      00A62D 04                       4 	.byte 4 	
      00A62E 53 41 56 45              5 	.ascii "SAVE"
      00A632 00 9A                    6 	.word SAVE_IDX 
      0025B4                       6613 	_dict_entry 3,RUN,RUN_IDX;run
      00A634 A6 2D                    1 	.word LINK 
                           0025B6     2 	LINK=.
      00A636                          3 RUN:
      00A636 03                       4 	.byte 3 	
      00A637 52 55 4E                 5 	.ascii "RUN"
      00A63A 00 98                    6 	.word RUN_IDX 
      0025BC                       6614 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A63C A6 36                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                           0025BE     2 	LINK=.
      00A63E                          3 RSHIFT:
      00A63E 46                       4 	.byte 6+F_IFUNC 	
      00A63F 52 53 48 49 46 54        5 	.ascii "RSHIFT"
      00A645 00 96                    6 	.word RSHIFT_IDX 
      0025C7                       6615 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A647 A6 3E                    1 	.word LINK 
                           0025C9     2 	LINK=.
      00A649                          3 RND:
      00A649 43                       4 	.byte 3+F_IFUNC 	
      00A64A 52 4E 44                 5 	.ascii "RND"
      00A64D 00 94                    6 	.word RND_IDX 
      0025CF                       6616 	_dict_entry,6,RETURN,RET_IDX;return 
      00A64F A6 49                    1 	.word LINK 
                           0025D1     2 	LINK=.
      00A651                          3 RETURN:
      00A651 06                       4 	.byte 6 	
      00A652 52 45 54 55 52 4E        5 	.ascii "RETURN"
      00A658 00 92                    6 	.word RET_IDX 
      0025DA                       6617 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A65A A6 51                    1 	.word LINK 
                           0025DC     2 	LINK=.
      00A65C                          3 RESTORE:
      00A65C 07                       4 	.byte 7 	
      00A65D 52 45 53 54 4F 52 45     5 	.ascii "RESTORE"
      00A664 00 90                    6 	.word REST_IDX 
      0025E6                       6618 	_dict_entry 6,REMARK,REM_IDX;remark 
      00A666 A6 5C                    1 	.word LINK 
                           0025E8     2 	LINK=.
      00A668                          3 REMARK:
      00A668 06                       4 	.byte 6 	
      00A669 52 45 4D 41 52 4B        5 	.ascii "REMARK"
      00A66F 00 8E                    6 	.word REM_IDX 
      0025F1                       6619 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A671 A6 68                    1 	.word LINK 
                           0025F3     2 	LINK=.
      00A673                          3 REBOOT:
      00A673 06                       4 	.byte 6 	
      00A674 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      00A67A 00 8C                    6 	.word RBT_IDX 
      0025FC                       6620 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A67C A6 73                    1 	.word LINK 
                           0025FE     2 	LINK=.
      00A67E                          3 READ:
      00A67E 44                       4 	.byte 4+F_IFUNC 	
      00A67F 52 45 41 44              5 	.ascii "READ"
      00A683 00 8A                    6 	.word READ_IDX 
      002605                       6621 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A685 A6 7E                    1 	.word LINK 
                           002607     2 	LINK=.
      00A687                          3 QKEY:
      00A687 44                       4 	.byte 4+F_IFUNC 	
      00A688 51 4B 45 59              5 	.ascii "QKEY"
      00A68C 00 88                    6 	.word QKEY_IDX 
      00260E                       6622 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A68E A6 87                    1 	.word LINK 
                           002610     2 	LINK=.
      00A690                          3 PRTI:
      00A690 44                       4 	.byte 4+F_IFUNC 	
      00A691 50 52 54 49              5 	.ascii "PRTI"
      00A695 00 86                    6 	.word PRTI_IDX 
      002617                       6623 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00A697 A6 90                    1 	.word LINK 
                           002619     2 	LINK=.
      00A699                          3 PRTH:
      00A699 44                       4 	.byte 4+F_IFUNC 	
      00A69A 50 52 54 48              5 	.ascii "PRTH"
      00A69E 00 84                    6 	.word PRTH_IDX 
      002620                       6624 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00A6A0 A6 99                    1 	.word LINK 
                           002622     2 	LINK=.
      00A6A2                          3 PRTG:
      00A6A2 44                       4 	.byte 4+F_IFUNC 	
      00A6A3 50 52 54 47              5 	.ascii "PRTG"
      00A6A7 00 82                    6 	.word PRTG_IDX 
      002629                       6625 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00A6A9 A6 A2                    1 	.word LINK 
                           00262B     2 	LINK=.
      00A6AB                          3 PRTF:
      00A6AB 44                       4 	.byte 4+F_IFUNC 	
      00A6AC 50 52 54 46              5 	.ascii "PRTF"
      00A6B0 00 80                    6 	.word PRTF_IDX 
      002632                       6626 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00A6B2 A6 AB                    1 	.word LINK 
                           002634     2 	LINK=.
      00A6B4                          3 PRTE:
      00A6B4 44                       4 	.byte 4+F_IFUNC 	
      00A6B5 50 52 54 45              5 	.ascii "PRTE"
      00A6B9 00 7E                    6 	.word PRTE_IDX 
      00263B                       6627 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00A6BB A6 B4                    1 	.word LINK 
                           00263D     2 	LINK=.
      00A6BD                          3 PRTD:
      00A6BD 44                       4 	.byte 4+F_IFUNC 	
      00A6BE 50 52 54 44              5 	.ascii "PRTD"
      00A6C2 00 7C                    6 	.word PRTD_IDX 
      002644                       6628 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00A6C4 A6 BD                    1 	.word LINK 
                           002646     2 	LINK=.
      00A6C6                          3 PRTC:
      00A6C6 44                       4 	.byte 4+F_IFUNC 	
      00A6C7 50 52 54 43              5 	.ascii "PRTC"
      00A6CB 00 7A                    6 	.word PRTC_IDX 
      00264D                       6629 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00A6CD A6 C6                    1 	.word LINK 
                           00264F     2 	LINK=.
      00A6CF                          3 PRTB:
      00A6CF 44                       4 	.byte 4+F_IFUNC 	
      00A6D0 50 52 54 42              5 	.ascii "PRTB"
      00A6D4 00 78                    6 	.word PRTB_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      002656                       6630 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00A6D6 A6 CF                    1 	.word LINK 
                           002658     2 	LINK=.
      00A6D8                          3 PRTA:
      00A6D8 44                       4 	.byte 4+F_IFUNC 	
      00A6D9 50 52 54 41              5 	.ascii "PRTA"
      00A6DD 00 76                    6 	.word PRTA_IDX 
      00265F                       6631 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A6DF A6 D8                    1 	.word LINK 
                           002661     2 	LINK=.
      00A6E1                          3 PRINT:
      00A6E1 05                       4 	.byte 5 	
      00A6E2 50 52 49 4E 54           5 	.ascii "PRINT"
      00A6E7 00 74                    6 	.word PRT_IDX 
      002669                       6632 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A6E9 A6 E1                    1 	.word LINK 
                           00266B     2 	LINK=.
      00A6EB                          3 POUT:
      00A6EB 44                       4 	.byte 4+F_IFUNC 	
      00A6EC 50 4F 55 54              5 	.ascii "POUT"
      00A6F0 00 72                    6 	.word POUT_IDX 
      002672                       6633 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A6F2 A6 EB                    1 	.word LINK 
                           002674     2 	LINK=.
      00A6F4                          3 POKE:
      00A6F4 04                       4 	.byte 4 	
      00A6F5 50 4F 4B 45              5 	.ascii "POKE"
      00A6F9 00 70                    6 	.word POKE_IDX 
      00267B                       6634 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A6FB A6 F4                    1 	.word LINK 
                           00267D     2 	LINK=.
      00A6FD                          3 PINP:
      00A6FD 44                       4 	.byte 4+F_IFUNC 	
      00A6FE 50 49 4E 50              5 	.ascii "PINP"
      00A702 00 6E                    6 	.word PINP_IDX 
      002684                       6635 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A704 A6 FD                    1 	.word LINK 
                           002686     2 	LINK=.
      00A706                          3 PEEK:
      00A706 44                       4 	.byte 4+F_IFUNC 	
      00A707 50 45 45 4B              5 	.ascii "PEEK"
      00A70B 00 6C                    6 	.word PEEK_IDX 
      00268D                       6636 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A70D A7 06                    1 	.word LINK 
                           00268F     2 	LINK=.
      00A70F                          3 PMODE:
      00A70F 05                       4 	.byte 5 	
      00A710 50 4D 4F 44 45           5 	.ascii "PMODE"
      00A715 00 6A                    6 	.word PMODE_IDX 
      002697                       6637 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00A717 A7 0F                    1 	.word LINK 
                           002699     2 	LINK=.
      00A719                          3 PAUSE:
      00A719 05                       4 	.byte 5 	
      00A71A 50 41 55 53 45           5 	.ascii "PAUSE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A71F 00 68                    6 	.word PAUSE_IDX 
      0026A1                       6638 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A721 A7 19                    1 	.word LINK 
                           0026A3     2 	LINK=.
      00A723                          3 PAD:
      00A723 43                       4 	.byte 3+F_IFUNC 	
      00A724 50 41 44                 5 	.ascii "PAD"
      00A727 00 66                    6 	.word PAD_IDX 
      0026A9                       6639 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A729 A7 23                    1 	.word LINK 
                           0026AB     2 	LINK=.
      00A72B                          3 OR:
      00A72B 42                       4 	.byte 2+F_IFUNC 	
      00A72C 4F 52                    5 	.ascii "OR"
      00A72E 00 64                    6 	.word OR_IDX 
      0026B0                       6640 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00A730 A7 2B                    1 	.word LINK 
                           0026B2     2 	LINK=.
      00A732                          3 ODR:
      00A732 43                       4 	.byte 3+F_IFUNC 	
      00A733 4F 44 52                 5 	.ascii "ODR"
      00A736 00 62                    6 	.word ODR_IDX 
      0026B8                       6641 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A738 A7 32                    1 	.word LINK 
                           0026BA     2 	LINK=.
      00A73A                          3 NOT:
      00A73A 43                       4 	.byte 3+F_IFUNC 	
      00A73B 4E 4F 54                 5 	.ascii "NOT"
      00A73E 00 60                    6 	.word NOT_IDX 
      0026C0                       6642 	_dict_entry,3,NEW,NEW_IDX;new
      00A740 A7 3A                    1 	.word LINK 
                           0026C2     2 	LINK=.
      00A742                          3 NEW:
      00A742 03                       4 	.byte 3 	
      00A743 4E 45 57                 5 	.ascii "NEW"
      00A746 00 5E                    6 	.word NEW_IDX 
      0026C8                       6643 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A748 A7 42                    1 	.word LINK 
                           0026CA     2 	LINK=.
      00A74A                          3 NEXT:
      00A74A 04                       4 	.byte 4 	
      00A74B 4E 45 58 54              5 	.ascii "NEXT"
      00A74F 00 5C                    6 	.word NEXT_IDX 
      0026D1                       6644 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00A751 A7 4A                    1 	.word LINK 
                           0026D3     2 	LINK=.
      00A753                          3 MULDIV:
      00A753 46                       4 	.byte 6+F_IFUNC 	
      00A754 4D 55 4C 44 49 56        5 	.ascii "MULDIV"
      00A75A 00 5A                    6 	.word MULDIV_IDX 
      0026DC                       6645 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00A75C A7 53                    1 	.word LINK 
                           0026DE     2 	LINK=.
      00A75E                          3 LSHIFT:
      00A75E 46                       4 	.byte 6+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A75F 4C 53 48 49 46 54        5 	.ascii "LSHIFT"
      00A765 00 58                    6 	.word LSHIFT_IDX 
      0026E7                       6646 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00A767 A7 5E                    1 	.word LINK 
                           0026E9     2 	LINK=.
      00A769                          3 LOG:
      00A769 43                       4 	.byte 3+F_IFUNC 	
      00A76A 4C 4F 47                 5 	.ascii "LOG"
      00A76D 00 56                    6 	.word LOG_IDX 
      0026EF                       6647 	_dict_entry,4,LOAD,LOAD_IDX;load 
      00A76F A7 69                    1 	.word LINK 
                           0026F1     2 	LINK=.
      00A771                          3 LOAD:
      00A771 04                       4 	.byte 4 	
      00A772 4C 4F 41 44              5 	.ascii "LOAD"
      00A776 00 54                    6 	.word LOAD_IDX 
      0026F8                       6648 	_dict_entry 4,LIST,LIST_IDX;list
      00A778 A7 71                    1 	.word LINK 
                           0026FA     2 	LINK=.
      00A77A                          3 LIST:
      00A77A 04                       4 	.byte 4 	
      00A77B 4C 49 53 54              5 	.ascii "LIST"
      00A77F 00 52                    6 	.word LIST_IDX 
      002701                       6649 	_dict_entry 3,LET,LET_IDX;let 
      00A781 A7 7A                    1 	.word LINK 
                           002703     2 	LINK=.
      00A783                          3 LET:
      00A783 03                       4 	.byte 3 	
      00A784 4C 45 54                 5 	.ascii "LET"
      00A787 00 50                    6 	.word LET_IDX 
      002709                       6650 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      00A789 A7 83                    1 	.word LINK 
                           00270B     2 	LINK=.
      00A78B                          3 KEY:
      00A78B 43                       4 	.byte 3+F_IFUNC 	
      00A78C 4B 45 59                 5 	.ascii "KEY"
      00A78F 00 4E                    6 	.word KEY_IDX 
      002711                       6651 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00A791 A7 8B                    1 	.word LINK 
                           002713     2 	LINK=.
      00A793                          3 IWDGREF:
      00A793 07                       4 	.byte 7 	
      00A794 49 57 44 47 52 45 46     5 	.ascii "IWDGREF"
      00A79B 00 4C                    6 	.word IWDGREF_IDX 
      00271D                       6652 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00A79D A7 93                    1 	.word LINK 
                           00271F     2 	LINK=.
      00A79F                          3 IWDGEN:
      00A79F 06                       4 	.byte 6 	
      00A7A0 49 57 44 47 45 4E        5 	.ascii "IWDGEN"
      00A7A6 00 4A                    6 	.word IWDGEN_IDX 
      002728                       6653 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00A7A8 A7 9F                    1 	.word LINK 
                           00272A     2 	LINK=.
      00A7AA                          3 INVERT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A7AA 46                       4 	.byte 6+F_IFUNC 	
      00A7AB 49 4E 56 45 52 54        5 	.ascii "INVERT"
      00A7B1 00 48                    6 	.word INVERT_IDX 
      002733                       6654 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00A7B3 A7 AA                    1 	.word LINK 
                           002735     2 	LINK=.
      00A7B5                          3 INPUT:
      00A7B5 05                       4 	.byte 5 	
      00A7B6 49 4E 50 55 54           5 	.ascii "INPUT"
      00A7BB 00 46                    6 	.word INPUT_IDX 
      00273D                       6655 	_dict_entry,2,IF,IF_IDX;if 
      00A7BD A7 B5                    1 	.word LINK 
                           00273F     2 	LINK=.
      00A7BF                          3 IF:
      00A7BF 02                       4 	.byte 2 	
      00A7C0 49 46                    5 	.ascii "IF"
      00A7C2 00 44                    6 	.word IF_IDX 
      002744                       6656 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00A7C4 A7 BF                    1 	.word LINK 
                           002746     2 	LINK=.
      00A7C6                          3 IDR:
      00A7C6 43                       4 	.byte 3+F_IFUNC 	
      00A7C7 49 44 52                 5 	.ascii "IDR"
      00A7CA 00 42                    6 	.word IDR_IDX 
      00274C                       6657 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00A7CC A7 C6                    1 	.word LINK 
                           00274E     2 	LINK=.
      00A7CE                          3 HEX:
      00A7CE 03                       4 	.byte 3 	
      00A7CF 48 45 58                 5 	.ascii "HEX"
      00A7D2 00 40                    6 	.word HEX_IDX 
      002754                       6658 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00A7D4 A7 CE                    1 	.word LINK 
                           002756     2 	LINK=.
      00A7D6                          3 GPIO:
      00A7D6 44                       4 	.byte 4+F_IFUNC 	
      00A7D7 47 50 49 4F              5 	.ascii "GPIO"
      00A7DB 00 3E                    6 	.word GPIO_IDX 
      00275D                       6659 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00A7DD A7 D6                    1 	.word LINK 
                           00275F     2 	LINK=.
      00A7DF                          3 GOTO:
      00A7DF 04                       4 	.byte 4 	
      00A7E0 47 4F 54 4F              5 	.ascii "GOTO"
      00A7E4 00 3C                    6 	.word GOTO_IDX 
      002766                       6660 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00A7E6 A7 DF                    1 	.word LINK 
                           002768     2 	LINK=.
      00A7E8                          3 GOSUB:
      00A7E8 05                       4 	.byte 5 	
      00A7E9 47 4F 53 55 42           5 	.ascii "GOSUB"
      00A7EE 00 3A                    6 	.word GOSUB_IDX 
      002770                       6661 	_dict_entry,6,FORGET,FORGET_IDX;forget 
      00A7F0 A7 E8                    1 	.word LINK 
                           002772     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A7F2                          3 FORGET:
      00A7F2 06                       4 	.byte 6 	
      00A7F3 46 4F 52 47 45 54        5 	.ascii "FORGET"
      00A7F9 00 38                    6 	.word FORGET_IDX 
      00277B                       6662 	_dict_entry,3,FOR,FOR_IDX;for 
      00A7FB A7 F2                    1 	.word LINK 
                           00277D     2 	LINK=.
      00A7FD                          3 FOR:
      00A7FD 03                       4 	.byte 3 	
      00A7FE 46 4F 52                 5 	.ascii "FOR"
      00A801 00 36                    6 	.word FOR_IDX 
      002783                       6663 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00A803 A7 FD                    1 	.word LINK 
                           002785     2 	LINK=.
      00A805                          3 FCPU:
      00A805 04                       4 	.byte 4 	
      00A806 46 43 50 55              5 	.ascii "FCPU"
      00A80A 00 34                    6 	.word FCPU_IDX 
      00278C                       6664 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00A80C A8 05                    1 	.word LINK 
                           00278E     2 	LINK=.
      00A80E                          3 EEPROM:
      00A80E 46                       4 	.byte 6+F_IFUNC 	
      00A80F 45 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00A815 00 32                    6 	.word EEPROM_IDX 
      002797                       6665 	_dict_entry,3,END,END_IDX;cmd_end  
      00A817 A8 0E                    1 	.word LINK 
                           002799     2 	LINK=.
      00A819                          3 END:
      00A819 03                       4 	.byte 3 	
      00A81A 45 4E 44                 5 	.ascii "END"
      00A81D 00 30                    6 	.word END_IDX 
      00279F                       6666 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00A81F A8 19                    1 	.word LINK 
                           0027A1     2 	LINK=.
      00A821                          3 DWRITE:
      00A821 06                       4 	.byte 6+F_CMD 	
      00A822 44 57 52 49 54 45        5 	.ascii "DWRITE"
      00A828 00 2E                    6 	.word DWRITE_IDX 
      0027AA                       6667 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00A82A A8 21                    1 	.word LINK 
                           0027AC     2 	LINK=.
      00A82C                          3 DREAD:
      00A82C 45                       4 	.byte 5+F_IFUNC 	
      00A82D 44 52 45 41 44           5 	.ascii "DREAD"
      00A832 00 2C                    6 	.word DREAD_IDX 
      0027B4                       6668 	_dict_entry,2,DO,DO_IDX;do_loop
      00A834 A8 2C                    1 	.word LINK 
                           0027B6     2 	LINK=.
      00A836                          3 DO:
      00A836 02                       4 	.byte 2 	
      00A837 44 4F                    5 	.ascii "DO"
      00A839 00 2A                    6 	.word DO_IDX 
      0027BB                       6669 	_dict_entry,3,DIR,DIR_IDX;directory 
      00A83B A8 36                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                           0027BD     2 	LINK=.
      00A83D                          3 DIR:
      00A83D 03                       4 	.byte 3 	
      00A83E 44 49 52                 5 	.ascii "DIR"
      00A841 00 28                    6 	.word DIR_IDX 
      0027C3                       6670 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00A843 A8 3D                    1 	.word LINK 
                           0027C5     2 	LINK=.
      00A845                          3 DEC:
      00A845 03                       4 	.byte 3 	
      00A846 44 45 43                 5 	.ascii "DEC"
      00A849 00 26                    6 	.word DEC_IDX 
      0027CB                       6671 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00A84B A8 45                    1 	.word LINK 
                           0027CD     2 	LINK=.
      00A84D                          3 DDR:
      00A84D 43                       4 	.byte 3+F_IFUNC 	
      00A84E 44 44 52                 5 	.ascii "DDR"
      00A851 00 24                    6 	.word DDR_IDX 
      0027D3                       6672 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      00A853 A8 4D                    1 	.word LINK 
                           0027D5     2 	LINK=.
      00A855                          3 DATALN:
      00A855 06                       4 	.byte 6 	
      00A856 44 41 54 41 4C 4E        5 	.ascii "DATALN"
      00A85C 00 22                    6 	.word DATALN_IDX 
      0027DE                       6673 	_dict_entry,4,DATA,DATA_IDX;data  
      00A85E A8 55                    1 	.word LINK 
                           0027E0     2 	LINK=.
      00A860                          3 DATA:
      00A860 04                       4 	.byte 4 	
      00A861 44 41 54 41              5 	.ascii "DATA"
      00A865 00 20                    6 	.word DATA_IDX 
      0027E7                       6674 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00A867 A8 60                    1 	.word LINK 
                           0027E9     2 	LINK=.
      00A869                          3 CRL:
      00A869 43                       4 	.byte 3+F_IFUNC 	
      00A86A 43 52 4C                 5 	.ascii "CRL"
      00A86D 00 1E                    6 	.word CRL_IDX 
      0027EF                       6675 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00A86F A8 69                    1 	.word LINK 
                           0027F1     2 	LINK=.
      00A871                          3 CRH:
      00A871 43                       4 	.byte 3+F_IFUNC 	
      00A872 43 52 48                 5 	.ascii "CRH"
      00A875 00 1C                    6 	.word CRH_IDX 
      0027F7                       6676 	_dict_entry,7,CONSOLE,CONS_IDX ; console_select
      00A877 A8 71                    1 	.word LINK 
                           0027F9     2 	LINK=.
      00A879                          3 CONSOLE:
      00A879 07                       4 	.byte 7 	
      00A87A 43 4F 4E 53 4F 4C 45     5 	.ascii "CONSOLE"
      00A881 00 D0                    6 	.word CONS_IDX 
      002803                       6677 	_dict_entry,4+F_IFUNC,COMC,COMC_IDX ; const_uarta
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A883 A8 79                    1 	.word LINK 
                           002805     2 	LINK=.
      00A885                          3 COMC:
      00A885 44                       4 	.byte 4+F_IFUNC 	
      00A886 43 4F 4D 43              5 	.ascii "COMC"
      00A88A 00 CE                    6 	.word COMC_IDX 
      00280C                       6678 	_dict_entry,4+F_IFUNC,COMA,COMA_IDX ; const_uartc 
      00A88C A8 85                    1 	.word LINK 
                           00280E     2 	LINK=.
      00A88E                          3 COMA:
      00A88E 44                       4 	.byte 4+F_IFUNC 	
      00A88F 43 4F 4D 41              5 	.ascii "COMA"
      00A893 00 CC                    6 	.word COMA_IDX 
      002815                       6679 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00A895 A8 8E                    1 	.word LINK 
                           002817     2 	LINK=.
      00A897                          3 CHAR:
      00A897 84                       4 	.byte 4+F_CFUNC 	
      00A898 43 48 41 52              5 	.ascii "CHAR"
      00A89C 00 1A                    6 	.word CHAR_IDX 
      00281E                       6680 	_dict_entry,3,BYE,BYE_IDX;bye 
      00A89E A8 97                    1 	.word LINK 
                           002820     2 	LINK=.
      00A8A0                          3 BYE:
      00A8A0 03                       4 	.byte 3 	
      00A8A1 42 59 45                 5 	.ascii "BYE"
      00A8A4 00 18                    6 	.word BYE_IDX 
      002826                       6681 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00A8A6 A8 A0                    1 	.word LINK 
                           002828     2 	LINK=.
      00A8A8                          3 BTOGL:
      00A8A8 05                       4 	.byte 5 	
      00A8A9 42 54 4F 47 4C           5 	.ascii "BTOGL"
      00A8AE 00 16                    6 	.word BTOGL_IDX 
      002830                       6682 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00A8B0 A8 A8                    1 	.word LINK 
                           002832     2 	LINK=.
      00A8B2                          3 BTEST:
      00A8B2 45                       4 	.byte 5+F_IFUNC 	
      00A8B3 42 54 45 53 54           5 	.ascii "BTEST"
      00A8B8 00 14                    6 	.word BTEST_IDX 
      00283A                       6683 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00A8BA A8 B2                    1 	.word LINK 
                           00283C     2 	LINK=.
      00A8BC                          3 BSET:
      00A8BC 04                       4 	.byte 4 	
      00A8BD 42 53 45 54              5 	.ascii "BSET"
      00A8C1 00 12                    6 	.word BSET_IDX 
      002843                       6684 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00A8C3 A8 BC                    1 	.word LINK 
                           002845     2 	LINK=.
      00A8C5                          3 BRES:
      00A8C5 04                       4 	.byte 4 	
      00A8C6 42 52 45 53              5 	.ascii "BRES"
      00A8CA 00 10                    6 	.word BRES_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00284C                       6685 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00A8CC A8 C5                    1 	.word LINK 
                           00284E     2 	LINK=.
      00A8CE                          3 BIT:
      00A8CE 43                       4 	.byte 3+F_IFUNC 	
      00A8CF 42 49 54                 5 	.ascii "BIT"
      00A8D2 00 0E                    6 	.word BIT_IDX 
      002854                       6686 	_dict_entry,3,AWU,AWU_IDX;awu 
      00A8D4 A8 CE                    1 	.word LINK 
                           002856     2 	LINK=.
      00A8D6                          3 AWU:
      00A8D6 03                       4 	.byte 3 	
      00A8D7 41 57 55                 5 	.ascii "AWU"
      00A8DA 00 0C                    6 	.word AWU_IDX 
      00285C                       6687 	_dict_entry,7,AUTORUN,AUTORUN_IDX;autorun
      00A8DC A8 D6                    1 	.word LINK 
                           00285E     2 	LINK=.
      00A8DE                          3 AUTORUN:
      00A8DE 07                       4 	.byte 7 	
      00A8DF 41 55 54 4F 52 55 4E     5 	.ascii "AUTORUN"
      00A8E6 00 0A                    6 	.word AUTORUN_IDX 
      002868                       6688 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00A8E8 A8 DE                    1 	.word LINK 
                           00286A     2 	LINK=.
      00A8EA                          3 ASC:
      00A8EA 43                       4 	.byte 3+F_IFUNC 	
      00A8EB 41 53 43                 5 	.ascii "ASC"
      00A8EE 00 08                    6 	.word ASC_IDX 
      002870                       6689 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00A8F0 A8 EA                    1 	.word LINK 
                           002872     2 	LINK=.
      00A8F2                          3 AND:
      00A8F2 43                       4 	.byte 3+F_IFUNC 	
      00A8F3 41 4E 44                 5 	.ascii "AND"
      00A8F6 00 06                    6 	.word AND_IDX 
      002878                       6690 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00A8F8 A8 F2                    1 	.word LINK 
                           00287A     2 	LINK=.
      00A8FA                          3 ADCREAD:
      00A8FA 47                       4 	.byte 7+F_IFUNC 	
      00A8FB 41 44 43 52 45 41 44     5 	.ascii "ADCREAD"
      00A902 00 04                    6 	.word ADCREAD_IDX 
      002884                       6691 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00A904 A8 FA                    1 	.word LINK 
                           002886     2 	LINK=.
      00A906                          3 ADCON:
      00A906 05                       4 	.byte 5 	
      00A907 41 44 43 4F 4E           5 	.ascii "ADCON"
      00A90C 00 02                    6 	.word ADCON_IDX 
      00A90E                       6692 kword_dict:
      00288E                       6693 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00A90E A9 06                    1 	.word LINK 
                           002890     2 	LINK=.
      00A910                          3 ABS:
      00A910 43                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A911 41 42 53                 5 	.ascii "ABS"
      00A914 00 00                    6 	.word ABS_IDX 
                                   6694 
                                   6695 ;comands and fonctions address table 	
      00A916                       6696 code_addr:
      00A916 9F 89 99 B8 99 F4 9F  6697 	.word abs,power_adc,analog_read,bit_and,ascii,autorun,awu,bitmask ; 0..7
             9D 9E 2F 9E C1 9F 3A
             A1 EB
      00A926 97 56 97 46 97 77 97  6698 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             67 9E B8 9E 1D A2 A5
      00A934 A2 9F A2 BD A2 C3 A2  6699 	.word const_cr1,data,data_line,const_ddr,dec_base,directory,do_loop,digital_read,digital_write ;16..23 
             99 93 26 9D 64 A2 14
             9A 28 9A 58
      00A946 99 64 A2 B7 A0 17 97  6700 	.word cmd_end,const_eeprom_base,fcpu,for,forget,gosub,goto,gpio ; 24..31 
             D2 9C FD 98 CD 98 B2
             9E 6B
      00A956 93 21 A2 93 97 BE 96  6701 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             AF A2 05 A1 95 A1 CB
             9E 56
      00A966 93 57 93 82 9C CD A1  6702 	.word let,list,load,log2,lshift,muldiv,next,new ; 40..47
             D0 9F E5 90 90 98 52
             9A DF
      00A976 A1 88 A2 8D 9F B5 A4  6703 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             50 9F 27 A0 23 97 AD
             A2 B1
      00A986 97 9E A2 AB 96 29 A2  6704 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             57 A2 5D A2 63 A2 69
             A2 6F
      00A996 A2 75 A2 7B A2 81 A2  6705 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             87 9E 5E A3 3F 86 B9
             97 1B
      00A9A6 A2 F0 98 ED A0 9F 9F  6706 	.word restore,return, random,rshift,run,save,show,size ; 72..79
             FE 99 0B 9B D0 92 E0
             93 2B
      00A9B6 9F 1C A4 31 A3 99 A4  6707 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             39 A4 11 98 2B 9A 93
             9F 83
      00A9C6 A1 6C A1 7B 97 FB 99  6708 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             74 93 35 9E 95 A2 29
             9E 9B
      00A9D6 97 21 A1 06 9D E6 9F  6709 	.word wait,words,write,bit_xor,transmit,receive,const_coma,const_comc ; 96..103 
             CD A4 56 A4 DF A4 F5
             A4 FB
      00A9E6 A5 01 00 00           6710 	.word console_select,0 
                                   6711 
      00AA00                       6712 	.bndry 128 ; align on FLASH block.
                                   6713 ; free space for user application  
      00AA00                       6714 user_space:
                                   6715 ; USR() function test
      00AA00 89               [ 2] 6716 	pushw x 
      00AA01 72 1A 50 0A      [ 1] 6717 	bset PC_ODR,#5 
      00AA05 85               [ 2] 6718 	popw x 
      00AA06 CD 9F 31         [ 4] 6719 	call pause02 
      00AA09 72 1B 50 0A      [ 1] 6720 	bres PC_ODR,#5 
      00AA0D 81               [ 4] 6721 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



                                   6722 
                                   6723 	.area FLASH_DRIVE (ABS)
      010000                       6724 	.org 0x10000
      010000                       6725 fdrive:
                                   6726 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002890 R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   5 ADCON      002886 R
    ADCON_ID=  000002     |   5 ADCREAD    00287A R   |     ADCREAD_=  000004 
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
  5 AND        002872 R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |   5 ASC        00286A R   |     ASC_IDX =  000008 
    ATTRIB  =  000002     |   5 AUTORUN    00285E R   |     AUTORUN_=  00000A 
    AUTORUN_=  004000     |   5 AWU        002856 R   |   5 AWUHandl   000001 R
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
    BELL    =  000007     |     BINARY  =  000001     |   5 BIT        00284E R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000E 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   5 BRES       002845 R   |     BRES_IDX=  000010 
    BS      =  000008     |     BSAVE   =  000001     |   5 BSET       00283C R
    BSET_IDX=  000012     |     BSIZE   =  000001     |   5 BTEST      002832 R
    BTEST_ID=  000014     |   5 BTOGL      002828 R   |     BTOGL_ID=  000016 
    BTW     =  000001     |   5 BYE        002820 R   |     BYE_IDX =  000018 
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
    CFG_GCR_=  000000     |   5 CHAR       002817 R   |     CHAR_IDX=  00001A 
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
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
    CNTR    =  000003     |   5 COMA       00280E R   |     COMA_IDX=  0000CC 
  5 COMC       002805 R   |     COMC_IDX=  0000CE     |     COMMA   =  000001 
  5 CONSOLE    0027F9 R   |     CONS_IDX=  0000D0     |     COUNT   =  000001 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  5 CRH        0027F1 R   |     CRH_IDX =  00001C     |   5 CRL        0027E9 R
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
  5 DATA       0027E0 R   |   5 DATALN     0027D5 R   |     DATALN_I=  000022 
    DATA_IDX=  000020     |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |     DBL     =  000003 
    DBLDIVDN=  000006     |     DBLHI   =  000001     |     DBLLO   =  000003 
    DBL_SIZE=  000004     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |   5 DDR        0027CD R
    DDR_IDX =  000024     |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |     DEBUG_PR=  000001     |   5 DEC        0027C5 R
    DEC_IDX =  000026     |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        0027BD R   |     DIR_IDX =  000028 
    DIVDNDHI=  00000B     |     DIVDNDLO=  00000D     |     DIVISOR =  000001 
    DIVISR  =  000007     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   5 DO         0027B6 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  00002A 
  5 DREAD      0027AC R   |     DREAD_ID=  00002C     |   5 DWRITE     0027A1 R
    DWRITE_I=  00002E     |   5 EEPROM     00278E R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  000032     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        002799 R   |     END_IDX =  000030 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FAUTORUN=  000006     |     FBREAK  =  000004     |     FCOMP   =  000005 
  5 FCPU       002785 R   |     FCPU_IDX=  000034     |     FF      =  00000C 
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
  5 FOR        00277D R   |   5 FORGET     002772 R   |     FORGET_I=  000038 
    FOR_IDX =  000036     |     FRUN    =  000000     |     FS      =  00001C 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   5 GOSUB      002768 R
    GOSUB_ID=  00003A     |   5 GOTO       00275F R   |     GOTO_IDX=  00003C 
  5 GPIO       002756 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_IDX=  00003E     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   5 HEX        00274E R   |     HEX_IDX =  000040 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
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
    I2C_WRIT=  000000     |   5 IDR        002746 R   |     IDR_IDX =  000042 
  5 IF         00273F R   |     IF_IDX  =  000044     |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   5 INPUT      002735 R
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
  5 INVERT     00272A R   |     INVERT_I=  000048     |     INW     =  000009 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     00271F R
    IWDGEN_I=  00004A     |   5 IWDGREF    002713 R   |     IWDGREF_=  00004C 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        00270B R   |     KEY_IDX =  00004E     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   5 LET        002703 R
    LET_IDX =  000050     |     LF      =  00000A     |     LIMIT   =  000005 
    LINENO  =  000005     |   5 LINK    =  002890 R   |   5 LIST       0026FA R
    LIST_IDX=  000052     |     LL      =  000001     |     LLEN    =  000002 
    LN_PTR  =  000005     |   5 LOAD       0026F1 R   |     LOAD_IDX=  000054 
  5 LOG        0026E9 R   |     LOG_IDX =  000056     |   5 LSHIFT     0026DE R
    LSHIFT_I=  000058     |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
  5 MULDIV     0026D3 R   |     MULDIV_I=  00005A     |     MULOP   =  000003 
    N1      =  000001     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        0026C2 R   |     NEW_FREE=  000001     |     NEW_IDX =  00005E 
  5 NEXT       0026CA R   |     NEXT_IDX=  00005C     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NOPT1   =  004802 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   5 NOT        0026BA R   |     NOT_IDX =  000060 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000000 R   |   5 ODR        0026B2 R   |     ODR_IDX =  000062 
    ONOFF   =  000003     |     OP      =  000003     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         0026AB R   |     OR_IDX  =  000064     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |   5 PAD        0026A3 R   |     PAD_IDX =  000066 
    PAD_SIZE=  000080     |   5 PAUSE      002699 R   |     PAUSE_ID=  000068 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       002686 R   |     PEEK_IDX=  00006C 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   5 PINP       00267D R
    PINP_IDX=  00006E     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      00268F R
    PMODE_ID=  00006A     |   5 POKE       002674 R   |     POKE_IDX=  000070 
    PORT    =  000003     |   5 POUT       00266B R   |     POUT_IDX=  000072 
    PREV    =  000001     |   5 PRINT      002661 R   |   5 PRTA       002658 R
    PRTA_IDX=  000076     |   5 PRTB       00264F R   |     PRTB_IDX=  000078 
  5 PRTC       002646 R   |     PRTC_IDX=  00007A     |   5 PRTD       00263D R
    PRTD_IDX=  00007C     |   5 PRTE       002634 R   |     PRTE_IDX=  00007E 
  5 PRTF       00262B R   |     PRTF_IDX=  000080     |   5 PRTG       002622 R
    PRTG_IDX=  000082     |   5 PRTH       002619 R   |     PRTH_IDX=  000084 
  5 PRTI       002610 R   |     PRTI_IDX=  000086     |     PRT_IDX =  000074 
    PSTR    =  000003     |   5 QKEY       002607 R   |     QKEY_IDX=  000088 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
    RBT_IDX =  00008C     |   5 READ       0025FE R   |     READ_IDX=  00008A 
  5 REBOOT     0025F3 R   |     REG     =  000001     |     REGA    =  000001 
    REGX    =  000003     |     REGY    =  000005     |     RELOP   =  000003 
  5 REMARK     0025E8 R   |     REM_IDX =  00008E     |   5 RESTORE    0025DC R
    REST_IDX=  000090     |     RETL1   =  000001     |   5 RETURN     0025D1 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

    RET_ADDR=  000003     |     RET_IDX =  000092     |     RET_INW =  000005 
  5 RND        0025C9 R   |     RND_IDX =  000094     |     ROP     =  004800 
    RS      =  00001E     |   5 RSHIFT     0025BE R   |     RSHIFT_I=  000096 
    RST_SR  =  0050B3     |   5 RUN        0025B6 R   |     RUN_IDX =  000098 
    RX_QUEUE=  000008     |   5 SAVE       0025AD R   |     SAVEB   =  000002 
    SAVE_IDX=  00009A     |     SDIVSR  =  000005     |     SERIAL  =  000001 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       0025A4 R   |     SHOW_IDX=  00009C     |     SI      =  00000F 
    SIGN    =  000001     |   5 SIZE       00259B R   |     SIZE_IDX=  00009E 
    SKIP    =  000005     |   5 SLEEP      002591 R   |     SLEEP_ID=  0000A0 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  5 SPIEN      00257D R   |     SPIEN_ID=  0000A4     |   5 SPIRD      002587 R
    SPIRD_ID=  0000A2     |   5 SPISEL     002572 R   |     SPISEL_I=  0000A6 
  5 SPIWR      002568 R   |     SPIWR_ID=  0000A8     |     SPI_CR1 =  005200 
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
    STACK_EM=  0017FF     |     STACK_SI=  0000A0     |   5 STEP       00255F R
    STEP_IDX=  0000AA     |   5 STOP       002556 R   |     STOP_IDX=  0000AC 
    STR     =  000003     |     STX     =  000002     |     SUB     =  00001A 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      00254C R   |     TICKS_ID=  0000AE     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
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
  5 TIMEOUT    002536 R   |   5 TIMER      002542 R   |     TIMER_ID=  0000B0 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
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
    TMROUT_I=  0000B2     |   5 TO         00252F R   |   5 TONE       002526 R
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
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     00251B R
    UBOUND_I=  0000B8     |   5 UBTN_Han   0000A1 R   |   5 UFLASH     002510 R
    UFLASH_I=  0000BA     |   5 UNTIL      002506 R   |     UNTIL_ID=  0000BC 
    US      =  00001F     |   5 USER_ABO   0000A9 R   |   5 USR        0024FE R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000BE     |   5 UartRxHa   00000F R   |   5 UserButt   000074 R
    VAR_ADDR=  000006     |     VAR_SIZE=  000001     |     VSIZ    =  000002 
    VSIZE   =  000006     |     VT      =  00000B     |   5 WAIT       0024F5 R
    WAIT_IDX=  0000C0     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]

Symbol Table

    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      0024EB R   |     WORDS_ID=  0000C2     |   5 WRITE      0024E1 R
    WRITE_ID=  0000C4     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   5 XOR        0024D9 R   |     XOR_IDX =  0000C6 
  5 XRCV       0024D0 R   |     XRCV_IDX=  0000CA     |     XREG    =  000003 
    XSAVE   =  000005     |   5 XTRMT      0024C6 R   |     XTRMT_ID=  0000C8 
    YSAVE   =  000007     |   5 abs        001F09 R   |   1 acc16      00000C GR
  1 acc24      00000B GR  |   1 acc8       00000D GR  |   5 add_char   001569 R
  5 add_spac   001393 R   |   5 analog_r   001974 R   |   5 arduino_   001FFF R
  5 arg_list   0010BD R   |   1 array_si   000021 R   |   5 ascii      001DAF R
  5 at_tst     000D21 R   |   5 atoi24     000E32 GR  |   5 atoi_exi   000E98 R
  5 autorun    001E41 R   |   5 autorun_   00073A R   |   5 awu        001EBA R
  5 awu02      001EC4 R   |   5 bad_port   001E10 R   |   1 base       00000A R
  1 basicptr   000004 GR  |   5 beep       001901 R   |   5 beep_1kh   0018EB GR
  5 bin_exit   000BFF R   |   5 bit_and    001F1D R   |   5 bit_or     001F35 R
  5 bit_rese   0016D6 R   |   5 bit_set    0016C6 R   |   5 bit_test   0016F7 R
  5 bit_togg   0016E7 R   |   5 bit_xor    001F4D R   |   5 bitmask    00216B R
  5 bkslsh_t   000CCE R   |   5 block_er   0001CA R   |   5 break_po   001A41 R
  5 bye        001E38 R   |   5 cancel_a   000702 R   |   5 char       001D9D R
  5 clear_ba   00074F R   |   5 clear_va   0005C2 R   |   5 clock_in   0000C4 R
  5 cmd_end    0018E4 R   |   5 cmd_line   00096F R   |   5 cmd_name   00102C R
  5 cmp_name   001AE2 R   |   5 code_add   002896 R   |   5 cold_sta   000639 R
  5 colon_ts   000CF5 R   |   1 comm       00002F R   |   5 comma_ts   000D00 R
  5 comp_msg   0008C4 R   |   5 compile    00054F R   |   5 con_sel    00248D GR
  5 console_   002481 R   |   5 const_co   002475 R   |   5 const_co   00247B R
  5 const_cr   00221F R   |   5 const_cr   002225 R   |   5 const_dd   002219 R
  5 const_ee   002237 R   |   5 const_id   002213 R   |   5 const_in   002231 R
  5 const_od   00220D R   |   5 const_ou   00222B R   |   5 const_po   0021D7 R
  5 const_po   0021DD R   |   5 const_po   0021E3 R   |   5 const_po   0021E9 R
  5 const_po   0021EF R   |   5 const_po   0021F5 R   |   5 const_po   0021FB R
  5 const_po   002201 R   |   5 const_po   002207 R   |   5 convert_   000B76 R
  5 copy_com   000D56 R   |   1 count      000003 GR  |   5 cp_loop    00106C R
  5 cpy_cmd_   00137E R   |   5 cpy_quot   0013B7 R   |   5 create_g   0004B2 R
  5 cs_high    0023CB R   |   5 cstk_pro   00127A R   |   5 dash_tst   000D16 R
  5 data       00223D R   |   1 data_len   000009 R   |   5 data_lin   002243 R
  1 data_ofs   000008 R   |   1 data_ptr   000006 R   |   5 data_sea   002283 R
  5 dbl_sign   000F94 R   |   5 dec_base   0012A6 R   |   5 decomp_l   001468 R
  5 decompil   001421 GR  |   5 del_line   000485 R   |   5 digital_   0019A8 R
  5 digital_   0019D8 R   |   5 dir_loop   001CF0 R   |   5 director   001CE4 R
  5 disk_fre   001ACF R   |   5 div32_16   000F9E R   |   5 divide     000FF5 R
  5 divu24_8   000AB9 R   |   5 dneg       000F89 R   |   5 do_loop    002194 R
  5 do_progr   0001BD R   |   5 drive_fr   001D59 R   |   5 enable_i   002115 R
  5 eql_tst    000DAB R   |   5 equal      00157C R   |   5 erase_fl   0001E9 R
  5 err_bad_   00082F R   |   5 err_buf_   0008A5 R   |   5 err_cmd_   0007F3 R
  5 err_div0   0007B8 R   |   5 err_dupl   00080D R   |   5 err_math   00079F R
  5 err_mem_   000784 R   |   5 err_msg    000764 R   |   5 err_no_a   00083B R
  5 err_no_d   00086E R   |   5 err_no_f   000892 R   |   5 err_no_l   0007C7 R
  5 err_no_p   00087E R   |   5 err_not_   00081E R   |   5 err_run_   0007DD R
  5 err_synt   000791 R   |   5 escaped    000B8B R   |   5 expect     0010AB R
  5 expr_exi   001205 R   |   5 expressi   0011BC R   |   5 factor     00110D R
  1 farptr     000016 R   |   5 fcpu       001F97 R   |   7 fdrive     010000 R
  1 ffree      000019 R   |   5 file_cou   001D51 R   |   5 first_li   00132B R
  1 flags      000023 R   |   5 for        001752 R   |   5 forget     001C7D R
  1 free_ram   000064 R   |   5 func_arg   0010B8 R   |   5 func_not   002108 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]

Symbol Table

  5 ge         00157E R   |   5 get_arra   0010E8 R   |   5 get_cmd_   001400 R
  5 get_targ   00181C R   |   5 get_tick   001F03 R   |   5 get_toke   000C67 R
  5 getc       00032B GR  |   5 gosub      00184D R   |   5 goto       001832 R
  5 gpio       001DEB R   |   5 gt         00157A R   |   5 gt_tst     000DB6 R
  5 hex_base   0012A1 R   |   5 hex_dump   0003B8 R   |   5 if         00173E R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
  5 incr_far   001A8F R   |   5 input_ex   001698 R   |   5 input_lo   001631 R
  5 input_va   00162F R   |   5 insert_l   0004DE R   |   5 insert_l   00054C R
  5 interp_l   0009B0 R   |   5 interpre   00098B R   |   5 invert     002185 R
  5 is_alnum   0005EA R   |   5 is_alpha   0005D0 R   |   5 is_digit   0005E1 R
  5 itoa       000A54 R   |   5 itoa_loo   000A73 R   |   5 jp_to_ta   001840 R
  5 key        001DD6 R   |   5 kw_loop    000C1B R   |   5 kword_di   00288E R
  5 kword_en   0024C4 R   |   5 le         001583 R   |   5 leading_   00215B R
  5 let        0012D7 R   |   5 let_arra   0012E5 R   |   5 let_var    0012E8 R
  5 lines_sk   00132E R   |   5 list       001302 R   |   5 list_exi   001370 R
  5 list_loo   00134E R   |   5 load       001C4D R   |   5 load_aut   000711 R
  5 load_fil   001C1C R   |   5 log2       002150 R   |   5 logical_   0020FE R
  5 long_div   000F71 R   |   5 loop_bac   0017FF R   |   1 loop_dep   000020 R
  5 loop_don   001814 R   |   5 lshift     001F65 R   |   5 lt         001581 R
  5 lt_tst     000DDF R   |   5 modulo     00100B R   |   5 move       00041F GR
  5 move_dow   00043D R   |   5 move_era   00014F R   |   5 move_exi   00045E R
  5 move_loo   000442 R   |   5 move_prg   000183 R   |   5 move_up    00042F R
  5 mul_char   00156B R   |   5 muldiv     001010 R   |   5 multiply   000F3C R
  5 mulu24_8   000AE1 R   |   5 nbr_tst    000C9A R   |   5 ne         001586 R
  5 neg_acc2   000B1B R   |   5 new        001A5F R   |   5 next       0017D2 R
  5 next_lin   000993 R   |   5 next_tok   0009D7 R   |   5 no_match   00107E R
  5 other      000E08 R   |   3 pad        0016E0 R   |   5 pad_ref    0023D0 R
  5 parse_bi   000BDD R   |   5 parse_in   000B93 R   |   5 parse_ke   000C1A R
  5 parse_qu   000B3E R   |   5 pause      001EA7 R   |   5 pause02    001EB1 R
  5 peek       00172D R   |   5 pin_mode   001FA3 R   |   5 plus_tst   000D7F R
  5 poke       00171E R   |   5 power_ad   001938 R   |   5 prcnt_ts   000DA0 R
  5 print      0015A9 R   |   5 print_ex   001603 R   |   5 print_in   000A38 R
  5 printxy    000EAF R   |   5 program_   000163 R   |   5 program_   000183 R
  5 prt_basi   001589 R   |   5 prt_loop   0015AD R   |   5 prt_tok    00034A R
  5 prti24     000A48 R   |   1 ptr16      000017 R   |   1 ptr8       000018 R
  5 putc       00030A GR  |   5 putc1      000310 R   |   5 putc3      00031A R
    puts       ****** GX  |   5 qgetc      000324 GR  |   5 qkey       001DDE GR
  5 qmark_ts   000D2C R   |   5 random     00201F R   |   5 read       0022BF R
  5 read01     0022C1 R   |     readln     ****** GX  |   5 receive    00245F R
  5 refresh_   00214B R   |   5 rel_exit   00125D R   |   5 relation   001208 R
  5 relop_st   00156E R   |   5 remark     00169B R   |   5 reset_co   0015AB R
  5 rest_con   00161F R   |   5 restore    002270 R   |   5 return     00186D R
  5 right_al   0013A5 R   |   5 row_alig   001A74 R   |   5 row_eras   000128 R
  5 row_eras   00014F R   |   5 row_loop   00039B R   |   5 rparnt_t   000CEA R
  5 rshift     001F7E R   |   5 rt_msg     0008B2 R   |   5 run        00188B R
  5 run_it     0018BD R   |   1 rx_head    00002D R   |   1 rx_queue   000025 R
  1 rx_tail    00002E R   |   5 save       001B50 R   |   5 save_con   00160F R
  5 search_d   00105E R   |   5 search_e   0010A8 R   |   5 search_f   001B03 R
  5 search_l   000461 GR  |   5 search_l   000469 R   |   5 search_n   001062 R
  1 seedx      000012 R   |   1 seedy      000014 R   |   5 seek_fdr   001A9D R
  5 select_p   001FEF R   |   5 set_time   0020EC R   |   5 sharp_ts   000D0B R
  5 show       001260 R   |   5 show_row   000389 R   |   5 single_c   001564 R
  5 size       0012AB R   |   5 skip       000E9C R   |   5 slash_ts   000D95 R
  5 sleep      001E9C R   |   5 software   0005F3 R   |     spaces     ****** GX
  5 spi_clea   002364 R   |   5 spi_disa   00234C R   |   5 spi_enab   002319 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]

Symbol Table

  5 spi_rcv_   002386 R   |   5 spi_read   0023B1 R   |   5 spi_sele   0023B9 R
  5 spi_send   002370 R   |   5 spi_writ   002391 R   |   3 stack_fu   001760 R
  3 stack_un   001800 R   |   5 star_tst   000D8A R   |   5 step       0017AB R
  5 stop       001A13 R   |   5 store_lo   0017BF R   |   5 str_matc   00108B R
  5 str_tst    000C8A R   |   5 strcmp     000400 R   |   5 strcpy     000411 R
  5 strlen     0003F5 GR  |   5 syntax_e   0008E5 R   |   1 tab_widt   000024 R
  5 tb_error   0008E7 R   |   5 term       00116A R   |   5 term01     001172 R
  5 term_exi   0011B9 R   |   3 tib        001690 GR  |   5 tick_tst   000D44 R
  1 ticks      00000E R   |   5 timeout    0020FB R   |   1 timer      000010 GR
  5 timer2_i   0000DA R   |   5 timer4_i   0000E7 R   |   5 tk_id      0008D5 R
  5 to         00177B R   |   5 to_eepro   0001A6 R   |   5 to_flash   0001BA R
  5 to_upper   000E26 GR  |   5 token_ch   000E1F R   |   5 token_ex   000E23 R
  5 token_ms   000381 R   |   5 tone       0018F4 R   |   5 transmit   0023D6 R
  5 try_next   0022AF R   |   5 tx_exit    002427 R   |   5 tx_faile   002419 R
  5 tx_loop    0023F0 R   |   5 tx_succe   002401 R   |   1 txtbgn     00001C R
  1 txtend     00001E R   |   5 uart1_in   0002C7 R   |   5 uart1_se   0002D7 R
  5 uart3_in   00028C R   |   5 uart3_se   00029C R   |   5 ubound     0012B5 R
  5 udiv32_1   000F5F R   |   5 uflash     001E15 R   |   5 umstar     000F02 R
  5 unlock_e   0000FC R   |   5 unlock_f   000112 R   |   5 until      0021A9 R
  5 user_int   000087 R   |   5 user_spa   002980 R   |   5 usr        001E1B R
  5 var_name   0013F8 R   |   1 vars       000030 R   |   5 wait       0016A1 R
    wait_ack   ****** GX  |   5 warm_ini   0006E4 R   |   5 warm_sta   00096C R
  5 words      002086 R   |   5 words_co   0020D6 R   |   5 write      001D66 R
  5 write_bl   000269 R   |   5 write_by   0001F4 R   |   5 write_ee   000230 R
  5 write_ex   000264 R   |   5 write_fl   00021A R   |   5 write_ro   000197 R
  5 xrcv_msg   002466 R   |     xtrmt_bl   ****** GX  |   5 xtrmt_fa   002446 R
  5 xtrmt_su   00242A R   |   5 zero_pad   001A69 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     64   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   298E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

