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
                                        ; to be used by uart_init
                                 
                                 
                                        
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
                                            ; parsed 
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
                                     34     .list 
                                     35 
                                     36 ;_dbg 
                                     37 
                                     38 ;--------------------------------------
                                     39     .area DATA 
                                     40 ;--------------------------------------	
                                     41 
                           000050    42 	TIB_SIZE=80
                           000080    43     PAD_SIZE=128
                           0000A0    44 	STACK_SIZE=160
                           0017FF    45 	STACK_EMPTY=RAM_SIZE-1  
                           000000    46 	FRUN=0 ; flags run code in variable flags
                           000001    47 	FTRAP=1 ; inside trap handler 
                           000002    48 	FLOOP=2 ; FOR loop in preparation 
                           000003    49 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    50 	FBREAK=4 ; break point flag 
                           000005    51 	FCOMP=5  ; compiling flags 
                           000006    52 	FAUTORUN=6; auto start program running 
                                     53 
                           004000    54 	AUTORUN_NAME=0x4000 ; address in EEPROM where auto run file name is saved 
                                     55 
                           000006    56     FIRST_DATA_ITEM=6 ; first DATA item offset on line.
                                     57 
                           007FFF    58 	MAX_LINENO=0x7fff; BASIC maximum line number 
                                     59 
      000001                         60 in.w:  .blkb 1 ; parser position in text line high-byte 
      000002                         61 in:    .blkb 1 ; low byte of in.w 
      000003                         62 in.saved: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000004                         63 count: .blkb 1 ; current BASIC line length and tib text length  
      000005                         64 basicptr:  .blkb 2  ; point to current BASIC line address.
      000007                         65 data_ptr:  .blkw 1  ; point to DATA address
      000009                         66 data_ofs:  .blkb 1  ; index to next data item 
      00000A                         67 data_len:  .blkb 1  ; length of data line 
      00000B                         68 base:  .blkb 1 ; nemeric base used to print integer 
      00000C                         69 acc24: .blkb 1 ; 24 bit accumulator upper-byte 
      00000D                         70 acc16: .blkb 1 ; 16 bit accumulator, acc24 high-byte
      00000E                         71 acc8:  .blkb 1 ;  8 bit accumulator, acc24 low-byte  
      00000F                         72 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000011                         73 timer: .blkw 1 ;  milliseconds count down timer 
      000013                         74 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000015                         75 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000017                         76 farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
      000018                         77 ptr16:  .blkb 1 ; 16 bits pointer , farptr high-byte 
      000019                         78 ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      00001A                         79 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001D                         80 txtbgn: .blkw 1 ; tokenized BASIC text beginning address 
      00001F                         81 txtend: .blkw 1 ; tokenized BASIC text end address 
      000021                         82 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000022                         83 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000024                         84 flags: .blkb 1 ; various boolean flags
      000025                         85 tab_width: .blkb 1 ; print colon width (default 4)
      000026                         86 rx_char: .blkb 1 ; last received character from UART1 
      000027                         87 vars: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     88 ; keep 'free_ram' as last variable 
      00005B                         89 free_ram: ; from here RAM free for BASIC text 
                                     90 
                                     91 ;;-----------------------------------
                                     92     .area SSEG (ABS)
                                     93 ;; working buffers and stack at end of RAM. 	
                                     94 ;;-----------------------------------
      001690                         95     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
      001690                         96 tib: .ds TIB_SIZE             ; transaction input buffer
      0016E0                         97 pad: .ds PAD_SIZE             ; working buffer
      001760                         98 stack_full: .ds STACK_SIZE   ; control stack 
      001800                         99 stack_unf: ; stack underflow ; control_stack bottom 
                                    100 
                                    101 ;;--------------------------------------
                                    102     .area HOME 
                                    103 ;; interrupt vector table at 0x8000
                                    104 ;;--------------------------------------
      008000 82 00 86 4B            105     int cold_start			; RESET vector 
                           000000   106 .if DEBUG
                                    107 	int TrapHandler 		;TRAP  software interrupt
                           000001   108 .else
      008004 82 00 80 80            109 	int NonHandledInterrupt ;TRAP  software interrupt
                                    110 .endif
      008008 82 00 80 80            111 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 81            112 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            113 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            114 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80            115 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80            116 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            117 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 CD            118 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80            119 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80            120 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80            121 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80            122 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80            123 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80            124 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80            125 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80            126 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80            127 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80            128 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 8F            129 	int Uart1RxHandler		;int18 UART1 RX full ; user communication channel.
      008054 82 00 80 80            130 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80            131 	int NonHandledInterrupt ;int20 UART1 TX completed
      00805C 82 00 80 80            132 	int NonHandledInterrupt ;int21 UART1 RX full
      008060 82 00 80 80            133 	int NonHandledInterrupt ;int22 ADC2 end of conversion
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008064 82 00 80 B7            134 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80            135 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80            136 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80            137 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80            138 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80            139 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80            140 	int NonHandledInterrupt ;int29  not used
                                    141 
                                    142 ;---------------------------------------
                                    143     .area CODE
                                    144 ;---------------------------------------
                           000000   145 .if DEBUG
                                    146 .asciz "STM8_TBI" ; I like to put module name here.
                                    147 .endif 
                                    148 
                                    149 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    150 ; non handled interrupt 
                                    151 ; reset MCU
                                    152 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                        153 NonHandledInterrupt:
      008080 71                     154     .byte 0x71  ; invalid opcode reinitialize MCU
                                    155 
                                    156 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    157 ; auto wakeup from halt
                                    158 ; at iret, program continue 
                                    159 ; after hatl instruction
                                    160 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008081                        161 AWUHandler:
      008081 72 19 50 F0      [ 1]  162 	bres AWU_CSR,#AWU_CSR_AWUEN
      008085 55 00 3F 50 F1   [ 1]  163 	mov AWU_APR,0x3F
      00808A 72 5F 50 F2      [ 1]  164 	clr AWU_TBR 
      00808E 80               [11]  165 	iret
                                    166 
                                    167 ;--------------------------
                                    168 ; UART1 receive character
                                    169 ; CTRL-C (ASCII 3)
                                    170 ; cancel program execution
                                    171 ; and fall back to command line
                                    172 ;--------------------------
      00808F                        173 Uart1RxHandler:
      00808F 72 0B 52 30 FB   [ 2]  174 	btjf UART1_SR,#UART_SR_RXNE,.
      008094 C6 52 31         [ 1]  175 	ld a,UART1_DR 
      008097 A1 03            [ 1]  176 	cp a,#CTRL_C 
      008099 26 07            [ 1]  177 	jrne 1$
      00809B 72 5F 00 26      [ 1]  178 	clr rx_char 
      00809F CC 80 E0         [ 2]  179 	jp user_interrupted
      0080A2                        180 1$:
      0080A2 A1 18            [ 1]  181 	cp a,#CAN ; CTRL_X 
      0080A4 26 03            [ 1]  182 	jrne 2$
      0080A6 CC 86 4B         [ 2]  183 	jp cold_start 	
      0080A9                        184 2$: 
      0080A9 A1 1A            [ 1]  185 	cp a,#CTRL_Z
      0080AB 26 06            [ 1]  186 	jrne 3$
      0080AD CD 87 14         [ 4]  187 	call cancel_autorun 
      0080B0 CC 86 4B         [ 2]  188 	jp cold_start 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      0080B3 C7 00 26         [ 1]  189 3$:	ld rx_char,a 	
      0080B6 80               [11]  190 	iret 
                                    191 
                                    192 ;------------------------------------
                                    193 ; software interrupt handler  
                                    194 ;------------------------------------
                           000000   195 .if DEBUG 
                                    196 TrapHandler:
                                    197 	bset flags,#FTRAP 
                                    198 	call print_registers
                                    199 	call cmd_itf
                                    200 	bres flags,#FTRAP 	
                                    201 	iret
                                    202 .endif 
                                    203 
                                    204 ;------------------------------
                                    205 ; TIMER 4 is used to maintain 
                                    206 ; a milliseconds 'ticks' counter
                                    207 ; and decrement 'timer' varaiable
                                    208 ;--------------------------------
      0080B7                        209 Timer4UpdateHandler:
      0080B7 72 5F 53 42      [ 1]  210 	clr TIM4_SR 
      0080BB CE 00 0F         [ 2]  211 	ldw x,ticks
      0080BE 5C               [ 2]  212 	incw x
      0080BF CF 00 0F         [ 2]  213 	ldw ticks,x 
      0080C2 CE 00 11         [ 2]  214 	ldw x,timer
      0080C5 5D               [ 2]  215 	tnzw x 
      0080C6 27 04            [ 1]  216 	jreq 1$
      0080C8 5A               [ 2]  217 	decw x 
      0080C9 CF 00 11         [ 2]  218 	ldw timer,x 
      0080CC                        219 1$:	
      0080CC 80               [11]  220 	iret 
                                    221 
                                    222 
                                    223 ;------------------------------------
                                    224 ; Triggered by pressing USER UserButton 
                                    225 ; on NUCLEO card.
                                    226 ; This is used to abort a progam lock 
                                    227 ; in infinite loop. 
                                    228 ;------------------------------------
      0080CD                        229 UserButtonHandler:
                                    230 ; wait button release
      0080CD 5F               [ 1]  231 	clrw x
      0080CE 5A               [ 2]  232 1$: decw x 
      0080CF 26 FD            [ 1]  233 	jrne 1$
      0080D1 72 09 50 15 F8   [ 2]  234 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    235 ; if MCU suspended by SLEEP resume program
      0080D6 72 07 00 24 05   [ 2]  236     btjf flags,#FSLEEP,2$
      0080DB 72 17 00 24      [ 1]  237 	bres flags,#FSLEEP 
      0080DF 80               [11]  238 	iret
      0080E0                        239 2$:	
      0080E0                        240 user_interrupted:
      0080E0 72 00 00 24 02   [ 2]  241     btjt flags,#FRUN,4$
      0080E5 20 13            [ 2]  242 	jra UBTN_Handler_exit 
      0080E7                        243 4$:	; program interrupted by user 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080E7 72 11 00 24      [ 1]  244 	bres flags,#FRUN 
      0080EB AE 81 02         [ 2]  245 	ldw x,#USER_ABORT
      0080EE CD 83 33         [ 4]  246 	call puts 
      0080F1 CE 00 05         [ 2]  247 	ldw x,basicptr 
      0080F4 C6 00 02         [ 1]  248 	ld a,in 
      0080F7 CD 94 10         [ 4]  249 	call prt_basic_line
      0080FA                        250 UBTN_Handler_exit:
      0080FA AE 17 FF         [ 2]  251     ldw x,#STACK_EMPTY 
      0080FD 94               [ 1]  252     ldw sp,x
      0080FE 9A               [ 1]  253 	rim 
      0080FF CC 89 7C         [ 2]  254 	jp warm_start
                                    255 
      008102 0A 50 72 6F 67 72 61   256 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    257 
                                    258 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    259 ;    peripherals initialization
                                    260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    261 
                                    262 ;----------------------------------------
                                    263 ; inialize MCU clock 
                                    264 ; input:
                                    265 ;   A 		source  HSI | 1 HSE 
                                    266 ;   XL      CLK_CKDIVR , clock divisor 
                                    267 ; output:
                                    268 ;   none 
                                    269 ;----------------------------------------
      00811D                        270 clock_init:	
      00811D C1 50 C3         [ 1]  271 	cp a,CLK_CMSR 
      008120 27 0C            [ 1]  272 	jreq 2$ ; no switching required 
                                    273 ; select clock source 
      008122 72 12 50 C5      [ 1]  274 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008126 C7 50 C4         [ 1]  275 	ld CLK_SWR,a
      008129 C1 50 C3         [ 1]  276 1$:	cp a,CLK_CMSR
      00812C 26 FB            [ 1]  277 	jrne 1$
      00812E                        278 2$: 	
                                    279 ; HSI and cpu clock divisor 
      00812E 9F               [ 1]  280 	ld a,xl 
      00812F C7 50 C6         [ 1]  281 	ld CLK_CKDIVR,a  
      008132 81               [ 4]  282 	ret
                                    283 
                                    284 ;----------------------------------
                                    285 ; TIMER2 used as audio tone output 
                                    286 ; on port D:5.
                                    287 ; channel 1 configured as PWM mode 1 
                                    288 ;-----------------------------------  
                           00F424   289 TIM2_CLK_FREQ=62500
      008133                        290 timer2_init:
      008133 72 1A 50 C7      [ 1]  291 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008137 35 60 53 05      [ 1]  292  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      00813B 35 08 53 0C      [ 1]  293 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      00813F 81               [ 4]  294 	ret 
                                    295 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    296 ;---------------------------------
                                    297 ; TIM4 is configured to generate an 
                                    298 ; interrupt every millisecond 
                                    299 ;----------------------------------
      008140                        300 timer4_init:
      008140 72 18 50 C7      [ 1]  301 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008144 35 07 53 45      [ 1]  302 	mov TIM4_PSCR,#7 ; prescale 128  
      008148 35 7D 53 46      [ 1]  303 	mov TIM4_ARR,#125 ; set for 1msec.
      00814C 35 05 53 40      [ 1]  304 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008150 72 10 53 41      [ 1]  305 	bset TIM4_IER,#TIM4_IER_UIE
      008154 81               [ 4]  306 	ret
                                    307 
                                    308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    309 ;  routines to write to FLASH, EEPROM 
                                    310 ;  and OPTION 
                                    311 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    312 
                                    313 ;----------------------------------
                                    314 ; unlock EEPROM/OPT for writing/erasing
                                    315 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    316 ; input:
                                    317 ;  none
                                    318 ; output:
                                    319 ;  none 
                                    320 ;----------------------------------
      008155                        321 unlock_eeprom:
      008155 35 00 50 5B      [ 1]  322 	mov FLASH_CR2,#0 
      008159 35 FF 50 5C      [ 1]  323 	mov FLASH_NCR2,#0xFF 
      00815D 35 AE 50 64      [ 1]  324 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008161 35 56 50 64      [ 1]  325     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008165 72 07 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00816A 81               [ 4]  327 	ret
                                    328 
                                    329 ;----------------------------------
                                    330 ; unlock FLASH for writing/erasing
                                    331 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    332 ; input:
                                    333 ;  none
                                    334 ; output:
                                    335 ;  none
                                    336 ;----------------------------------
      00816B                        337 unlock_flash:
      00816B 35 00 50 5B      [ 1]  338 	mov FLASH_CR2,#0 
      00816F 35 FF 50 5C      [ 1]  339 	mov FLASH_NCR2,#0xFF 
      008173 35 56 50 62      [ 1]  340 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008177 35 AE 50 62      [ 1]  341 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00817B 72 03 50 5F FB   [ 2]  342 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008180 81               [ 4]  343 	ret
                                    344 
                                    345 ;----------------------------
                                    346 ; erase block code must be 
                                    347 ; executed from RAM
                                    348 ; input:
                                    349 ;-----------------------------
      008181                        350 row_erase:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      008181 35 20 50 5B      [ 1]  351 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      008185 35 DF 50 5C      [ 1]  352 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      008189 4F               [ 1]  353 	clr a 
      00818A 90 5F            [ 1]  354 	clrw y 
      00818C 91 A7 00 17      [ 1]  355 	ldf ([farptr],y),a
      008190 90 5C            [ 2]  356     incw y
      008192 91 A7 00 17      [ 1]  357 	ldf ([farptr],y),a
      008196 90 5C            [ 2]  358     incw y
      008198 91 A7 00 17      [ 1]  359 	ldf ([farptr],y),a
      00819C 90 5C            [ 2]  360     incw y
      00819E 91 A7 00 17      [ 1]  361 	ldf ([farptr],y),a
      0081A2 72 05 50 5F FB   [ 2]  362 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081A7 81               [ 4]  363 	ret
      0081A8                        364 row_erase_end:
                                    365 
                                    366 ; copy erase_start in RAM 
      0081A8                        367 move_erase_to_ram:
      0081A8 AE 81 A8         [ 2]  368 	ldw x,#row_erase_end 
      0081AB 1D 81 81         [ 2]  369 	subw x,#row_erase
      0081AE CF 00 0D         [ 2]  370 	ldw acc16,x 
      0081B1 AE 16 90         [ 2]  371 	ldw x,#tib 
      0081B4 90 AE 81 81      [ 2]  372 	ldw y,#row_erase 
      0081B8 CD 84 3E         [ 4]  373 	call move 
      0081BB 81               [ 4]  374 	ret 
                                    375 
                                    376 ;-----------------------------------
                                    377 ; block programming must be 
                                    378 ; executed from RAM 
                                    379 ; initial contidions: 
                                    380 ; 	memory unlocked
                                    381 ;   bit PRG set in 
                                    382 ; input:
                                    383 ;   x        128 bytes row to program 
                                    384 ;   farptr   row address 
                                    385 ; output:
                                    386 ;   none 
                                    387 ;----------------------------------
                           000001   388 	BCNT=1 
      0081BC                        389 program_row:
      0081BC 4B 80            [ 1]  390 	push #BLOCK_SIZE  
                                    391 ;enable block programming 
      0081BE 72 10 50 5B      [ 1]  392 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0081C2 72 11 50 5C      [ 1]  393 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0081C6 90 5F            [ 1]  394 	clrw y 
      0081C8 F6               [ 1]  395 1$:	ld a,(x)
      0081C9 91 A7 00 17      [ 1]  396 	ldf ([farptr],y),a
      0081CD 5C               [ 2]  397 	incw x 
      0081CE 90 5C            [ 2]  398 	incw y 
      0081D0 0A 01            [ 1]  399 	dec (BCNT,sp)
      0081D2 26 F4            [ 1]  400 	jrne 1$
                                    401 ; wait EOP bit 
      0081D4 72 05 50 5F FB   [ 2]  402 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      000159                        403 	_drop 1 
      0081D9 5B 01            [ 2]    1     addw sp,#1 
      0081DB 81               [ 4]  404 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      0081DC                        405 program_row_end:
                                    406 
                                    407 ;-------------------------
                                    408 ; move program_row to RAM 
                                    409 ; at txtubound address 
                                    410 ;------------------------
      0081DC                        411 move_prg_to_ram:
      0081DC AE 81 DC         [ 2]  412 	ldw x,#program_row_end 
      0081DF 1D 81 BC         [ 2]  413 	subw x,#program_row 
      0081E2 CF 00 0D         [ 2]  414 	ldw acc16,x 
      0081E5 AE 16 90         [ 2]  415 	ldw x,#tib 
      0081E8 90 AE 81 BC      [ 2]  416 	ldw y,#program_row 
      0081EC CD 84 3E         [ 4]  417 	call move 
      0081EF 81               [ 4]  418 	ret 
                                    419 
                                    420 
                                    421 ;-----------------------------
                                    422 ; write a row in FLASH/EEPROM 
                                    423 ; input:
                                    424 ;    farptr   destination address 
                                    425 ;    x        source address 
                                    426 ;-----------------------------
      0081F0                        427 write_row:
      0081F0 89               [ 2]  428 	pushw x 
      0081F1 72 5D 00 17      [ 1]  429 	tnz farptr 
      0081F5 26 1C            [ 1]  430 	jrne to_flash 
      0081F7 AE 80 00         [ 2]  431 	ldw x,#FLASH_BASE 
      0081FA C3 00 18         [ 2]  432 	cpw x,farptr+1 
      0081FD 24 14            [ 1]  433 	jruge to_flash 
      0081FF                        434 to_eeprom:
      0081FF AE 40 00         [ 2]  435 	ldw x,#EEPROM_BASE 
      008202 C3 00 18         [ 2]  436 	cpw x,farptr+1 
      008205 24 01            [ 1]  437 	jruge 1$
      008207 81               [ 4]  438 	ret ; bad address 
      008208 AE 47 FF         [ 2]  439 1$: ldw x,#EEPROM_END 
      00820B 23 01            [ 2]  440 	jrule 2$ 
      00820D 81               [ 4]  441 	ret ; bad address 
      00820E CD 81 55         [ 4]  442 2$:	call unlock_eeprom
      008211 20 03            [ 2]  443 	jra do_programming
      008213                        444 to_flash:
      008213 CD 81 6B         [ 4]  445 	call unlock_flash 
      008216                        446 do_programming:
      008216 85               [ 2]  447 	popw x 
      008217 CD 16 90         [ 4]  448 	call tib
      00821A 72 13 50 5F      [ 1]  449 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      00821E 72 17 50 5F      [ 1]  450 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008222 81               [ 4]  451 	ret 
                                    452 
                                    453 
                                    454 ;-----------------------------------
                                    455 ; erase flash or EEPROM block
                                    456 ; a blow is 128 bytes 
                                    457 ; input:
                                    458 ;   farptr  address row begin
                                    459 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    460 ;   none
                                    461 ;--------------------------------------
      008223                        462 block_erase:
      008223 CE 00 18         [ 2]  463 	ldw x,farptr+1
      008226 A3 A7 80         [ 2]  464 	cpw x,#user_space 
      008229 2A 17            [ 1]  465 	jrpl erase_flash 
                                    466 ; erase eeprom block
      00822B A3 40 00         [ 2]  467 	cpw x,#EEPROM_BASE 
      00822E 24 01            [ 1]  468 	jruge 1$
      008230 81               [ 4]  469 	ret ; bad address 
      008231 AE 47 FF         [ 2]  470 1$: ldw x,#EEPROM_END 
      008234 23 01            [ 2]  471 	jrule 2$ 
      008236 81               [ 4]  472 	ret ; bad address 
      008237 CD 81 55         [ 4]  473 2$:	call unlock_eeprom 
      00823A CD 16 90         [ 4]  474 	call tib 
      00823D 72 17 50 5F      [ 1]  475 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008241 81               [ 4]  476 	ret 
                                    477 ; erase flash block:
      008242                        478 erase_flash:
      008242 CD 81 6B         [ 4]  479 	call unlock_flash 
      008245 CD 16 90         [ 4]  480 	call tib 
      008248 72 13 50 5F      [ 1]  481     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00824C 81               [ 4]  482 	ret 
                                    483 
                                    484 
                                    485 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    486 ; write a byte to FLASH or EEPROM/OPTION  
                                    487 ; input:
                                    488 ;    a  		byte to write
                                    489 ;    farptr  	address
                                    490 ;    x          farptr[x]
                                    491 ; output:
                                    492 ;    none
                                    493 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    494 	; variables locales
                           000001   495 	BTW = 1   ; byte to write offset on stack
                           000002   496 	OPT = 2   ; OPTION flag offset on stack
                           000002   497 	VSIZE = 2
      00824D                        498 write_byte:
      00824D 90 89            [ 2]  499 	pushw y
      0001CF                        500 	_vars VSIZE
      00824F 52 02            [ 2]    1     sub sp,#VSIZE 
      008251 6B 01            [ 1]  501 	ld (BTW,sp),a ; byte to write 
      008253 0F 02            [ 1]  502 	clr (OPT,sp)  ; OPTION flag
                                    503 ; put addr[15:0] in Y, for bounds check.
      008255 90 CE 00 18      [ 2]  504 	ldw y,farptr+1   ; Y=addr15:0
                                    505 ; check addr[23:16], if <> 0 then it is extened flash memory
      008259 72 5D 00 17      [ 1]  506 	tnz farptr 
      00825D 26 14            [ 1]  507 	jrne write_flash
      00825F 90 A3 A7 80      [ 2]  508     cpw y,#user_space
      008263 24 0E            [ 1]  509     jruge write_flash
      008265 90 A3 40 00      [ 2]  510 	cpw y,#EEPROM_BASE  
      008269 25 52            [ 1]  511     jrult write_exit
      00826B 90 A3 48 7F      [ 2]  512 	cpw y,#OPTION_END 
      00826F 22 4C            [ 1]  513 	jrugt write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      008271 20 16            [ 2]  514 	jra write_eeprom 
                                    515 ; write program memory
      008273                        516 write_flash:
      008273 CD 81 6B         [ 4]  517 	call unlock_flash 
      008276 9B               [ 1]  518 1$:	sim 
      008277 7B 01            [ 1]  519 	ld a,(BTW,sp)
      008279 92 A7 00 17      [ 4]  520 	ldf ([farptr],x),a ; farptr[x]=A
      00827D 72 05 50 5F FB   [ 2]  521 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008282 9A               [ 1]  522     rim 
      008283 72 13 50 5F      [ 1]  523     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008287 20 34            [ 2]  524     jra write_exit
                                    525 ; write eeprom and option
      008289                        526 write_eeprom:
      008289 CD 81 55         [ 4]  527 	call unlock_eeprom
                                    528 	; check for data eeprom or option eeprom
      00828C 90 A3 48 00      [ 2]  529 	cpw y,#OPTION_BASE
      008290 2B 08            [ 1]  530 	jrmi 1$
      008292 90 A3 48 80      [ 2]  531 	cpw y,#OPTION_END+1
      008296 2A 02            [ 1]  532 	jrpl 1$
      008298 03 02            [ 1]  533 	cpl (OPT,sp)
      00829A                        534 1$: 
      00829A 0D 02            [ 1]  535     tnz (OPT,sp)
      00829C 27 08            [ 1]  536     jreq 2$
                                    537 	; pour modifier une option il faut modifier ces 2 bits
      00829E 72 1E 50 5B      [ 1]  538     bset FLASH_CR2,#FLASH_CR2_OPT
      0082A2 72 1F 50 5C      [ 1]  539     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0082A6                        540 2$: 
      0082A6 7B 01            [ 1]  541     ld a,(BTW,sp)
      0082A8 92 A7 00 17      [ 4]  542     ldf ([farptr],x),a
      0082AC 0D 02            [ 1]  543     tnz (OPT,sp)
      0082AE 27 08            [ 1]  544     jreq 3$
      0082B0 5C               [ 2]  545     incw x
      0082B1 7B 01            [ 1]  546     ld a,(BTW,sp)
      0082B3 43               [ 1]  547     cpl a
      0082B4 92 A7 00 17      [ 4]  548     ldf ([farptr],x),a
      0082B8 72 05 50 5F FB   [ 2]  549 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082BD                        550 write_exit:
      00023D                        551 	_drop VSIZE 
      0082BD 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082BF 90 85            [ 2]  552 	popw y
      0082C1 81               [ 4]  553     ret
                                    554 
                                    555 ;--------------------------------------------
                                    556 ; write a data block to eeprom or flash 
                                    557 ; input:
                                    558 ;   Y        source address   
                                    559 ;   X        array index  destination  farptr[x]
                                    560 ;   BSIZE    block size bytes 
                                    561 ;   farptr   write address , byte* 
                                    562 ; output:
                                    563 ;	X 		after last byte written 
                                    564 ;   Y 		after last byte read 
                                    565 ;  farptr   point after block
                                    566 ;---------------------------------------------
      0082C2                        567 	_argofs 2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                           000004     1     ARG_OFS=2+2 
      000242                        568 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    569 	; local var 
                           000001   570 	XSAVE=1 
                           000002   571 	VSIZE=2 
      000242                        572 write_block:
      000242                        573 	_vars VSIZE
      0082C2 52 02            [ 2]    1     sub sp,#VSIZE 
      0082C4 1F 01            [ 2]  574 	ldw (XSAVE,sp),x 
      0082C6 1E 05            [ 2]  575 	ldw x,(BSIZE,sp) 
      0082C8 27 13            [ 1]  576 	jreq 9$
      0082CA 1E 01            [ 2]  577 1$:	ldw x,(XSAVE,sp)
      0082CC 90 F6            [ 1]  578 	ld a,(y)
      0082CE CD 82 4D         [ 4]  579 	call write_byte 
      0082D1 5C               [ 2]  580 	incw x 
      0082D2 90 5C            [ 2]  581 	incw y 
      0082D4 1F 01            [ 2]  582 	ldw (XSAVE,sp),x
      0082D6 1E 05            [ 2]  583 	ldw x,(BSIZE,sp)
      0082D8 5A               [ 2]  584 	decw x
      0082D9 1F 05            [ 2]  585 	ldw (BSIZE,sp),x 
      0082DB 26 ED            [ 1]  586 	jrne 1$
      0082DD                        587 9$:
      0082DD 1E 01            [ 2]  588 	ldw x,(XSAVE,sp)
      0082DF CD 9A 2E         [ 4]  589 	call incr_farptr
      000262                        590 	_drop VSIZE
      0082E2 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082E4 81               [ 4]  591 	ret 
                                    592 
                                    593 
                                    594 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    595 ;;   UART1 subroutines
                                    596 ;;   used for user interface 
                                    597 ;;   communication channel.
                                    598 ;;   settings: 
                                    599 ;;		115200 8N1 no flow control
                                    600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    601 
                                    602 ;---------------------------------------------
                                    603 ; initialize UART1, 115200 8N1
                                    604 ; input:
                                    605 ;	none
                                    606 ; output:
                                    607 ;   none
                                    608 ;---------------------------------------------
      0082E5                        609 uart1_init:
      0082E5 72 1A 50 02      [ 1]  610     bset PA_DDR,#UART1_TX_PIN
      0082E9 72 1A 50 03      [ 1]  611     bset PA_CR1,#UART1_TX_PIN 
      0082ED 72 1A 50 04      [ 1]  612     bset PA_CR2,#UART1_TX_PIN 
                                    613 ; enable UART1 clock
      0082F1 72 14 50 C7      [ 1]  614 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      0082F5                        615 uart1_set_baud: 
                                    616 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    617 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      0082F5 A6 E1            [ 1]  618 	ld a,#CLK_SWR_HSI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082F7 C1 50 C3         [ 1]  619 	cp a,CLK_CMSR 
      0082FA 27 0A            [ 1]  620 	jreq 2$ 
      0082FC                        621 1$: ; 8 Mhz 	
      0082FC 35 05 52 33      [ 1]  622 	mov UART1_BRR2,#0x05 ; must be loaded first
      008300 35 04 52 32      [ 1]  623 	mov UART1_BRR1,#0x4
      008304 20 08            [ 2]  624 	jra 3$
      008306                        625 2$: ; 16 Mhz 	
      008306 35 0B 52 33      [ 1]  626 	mov UART1_BRR2,#0x0b ; must be loaded first
      00830A 35 08 52 32      [ 1]  627 	mov UART1_BRR1,#0x08
      00830E                        628 3$:
      00830E 72 5F 52 31      [ 1]  629     clr UART1_DR
      008312 35 2C 52 35      [ 1]  630 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008316 72 10 52 35      [ 1]  631 	bset UART1_CR2,#UART_CR2_SBK
      00831A 72 0D 52 30 FB   [ 2]  632     btjf UART1_SR,#UART_SR_TC,.
      00831F 81               [ 4]  633     ret
                                    634 
                                    635 ;---------------------------------
                                    636 ; send character to UART1 
                                    637 ; input:
                                    638 ;   A 
                                    639 ; output:
                                    640 ;   none 
                                    641 ;--------------------------------	
      008320                        642 putc:
      008320 72 0F 52 30 FB   [ 2]  643 	btjf UART1_SR,#UART_SR_TXE,.
      008325 C7 52 31         [ 1]  644 	ld UART1_DR,a 
      008328 81               [ 4]  645 	ret 
                                    646 
                                    647 ;---------------------------------
                                    648 ; wait character from UART1 
                                    649 ; input:
                                    650 ;   none
                                    651 ; output:
                                    652 ;   A 			char  
                                    653 ;--------------------------------	
      008329                        654 getc:
      008329 C6 00 26         [ 1]  655 	ld a,rx_char 
      00832C 27 FB            [ 1]  656 	jreq getc 
      00832E 72 5F 00 26      [ 1]  657 	clr rx_char 
      008332 81               [ 4]  658 	ret 
                                    659 
                                    660 ;-----------------------------
                                    661 ; send an ASCIZ string to UART1 
                                    662 ; input: 
                                    663 ;   x 		char * 
                                    664 ; output:
                                    665 ;   none 
                                    666 ;-------------------------------
      008333                        667 puts:
      008333 F6               [ 1]  668     ld a,(x)
      008334 27 06            [ 1]  669 	jreq 1$
      008336 CD 83 20         [ 4]  670 	call putc 
      008339 5C               [ 2]  671 	incw x 
      00833A 20 F7            [ 2]  672 	jra puts 
      00833C 81               [ 4]  673 1$:	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    674 
                                    675 
                                    676 ;---------------------------
                                    677 ; delete character at left 
                                    678 ; of cursor on terminal 
                                    679 ; input:
                                    680 ;   none 
                                    681 ; output:
                                    682 ;	none 
                                    683 ;---------------------------
      00833D                        684 bksp:
      00833D A6 08            [ 1]  685 	ld a,#BS 
      00833F CD 83 20         [ 4]  686 	call putc 
      008342 A6 20            [ 1]  687 	ld a,#SPACE 
      008344 CD 83 20         [ 4]  688 	call putc 
      008347 A6 08            [ 1]  689 	ld a,#BS 
      008349 CD 83 20         [ 4]  690 	call putc 
      00834C 81               [ 4]  691 	ret 
                                    692 ;---------------------------
                                    693 ; delete n character left of cursor 
                                    694 ; at terminal.
                                    695 ; input: 
                                    696 ;   A   number of characters to delete.
                                    697 ; output:
                                    698 ;    none 
                                    699 ;--------------------------	
      00834D                        700 delete:
      00834D 88               [ 1]  701 	push a 
      00834E 0D 01            [ 1]  702 0$:	tnz (1,sp)
      008350 27 07            [ 1]  703 	jreq 1$
      008352 CD 83 3D         [ 4]  704 	call bksp 
      008355 0A 01            [ 1]  705 	dec (1,sp)
      008357 20 F5            [ 2]  706 	jra 0$
      008359 84               [ 1]  707 1$:	pop a 
      00835A 81               [ 4]  708 	ret
                                    709 
                                    710 ;--------------------------
                                    711 ; print n spaces on terminal
                                    712 ; input:
                                    713 ;  X 		number of spaces 
                                    714 ; output:
                                    715 ;	none 
                                    716 ;---------------------------
      00835B                        717 spaces:
      00835B A6 20            [ 1]  718 	ld a,#SPACE 
      00835D 5D               [ 2]  719 1$:	tnzw x
      00835E 27 06            [ 1]  720 	jreq 9$
      008360 CD 83 20         [ 4]  721 	call putc 
      008363 5A               [ 2]  722 	decw x
      008364 20 F7            [ 2]  723 	jra 1$
      008366                        724 9$: 
      008366 81               [ 4]  725 	ret 
                                    726 
                                    727 ;----------------------
                                    728 ; print token id && value
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    729 ; input:
                                    730 ;   A     token id 
                                    731 ;   X     token value 
                                    732 ;---------------------
                           000001   733 	BSAVE=1
                           000002   734 	AREG=2
                           000003   735 	XREG=3
                           000004   736 	VSIZE=4
      008367                        737 prt_tok:
      0002E7                        738 	_vars VSIZE 
      008367 52 04            [ 2]    1     sub sp,#VSIZE 
      008369 6B 02            [ 1]  739 	ld (AREG,sp),a 
      00836B 1F 03            [ 2]  740 	ldw (XREG,sp),x 
      00836D C6 00 0B         [ 1]  741 	ld a, base
      008370 6B 01            [ 1]  742 	ld (BSAVE,sp),a 
      008372 35 10 00 0B      [ 1]  743 	mov base,#16  
      008376 AE 83 9E         [ 2]  744 	ldw x,#token_msg
      008379 CD 83 33         [ 4]  745 	call puts 
      00837C 5F               [ 1]  746 	clrw x 
      00837D 7B 02            [ 1]  747 	ld a,(AREG,sp)
      00837F 97               [ 1]  748 	ld xl,a 
      008380 CD 8A 3C         [ 4]  749 	call print_int 
      008383 A6 20            [ 1]  750 	ld a,#SPACE
      008385 CD 83 20         [ 4]  751 	call putc 
      008388 1E 03            [ 2]  752 	ldw x,(XREG,sp)
      00838A CD 8A 3C         [ 4]  753 	call print_int 
      00838D A6 0D            [ 1]  754 	ld a,#CR 
      00838F CD 83 20         [ 4]  755 	call putc 
      008392 7B 01            [ 1]  756 	ld a,(BSAVE,sp)
      008394 C7 00 0B         [ 1]  757 	ld base,a 
      008397 7B 02            [ 1]  758 	ld a,(AREG,sp)
      008399 1E 03            [ 2]  759 	ldw x,(XREG,sp)
      00031B                        760 	_drop VSIZE 
      00839B 5B 04            [ 2]    1     addw sp,#VSIZE 
      00839D 81               [ 4]  761 	ret 
      00839E 74 6F 6B 65 6E 3A 20   762 token_msg: .asciz "token: "
             00
                                    763 
                                    764 
                                    765 ;---------------------
                                    766 ; display n bytes row 
                                    767 ; from memory.
                                    768 ; input:
                                    769 ;   A   bytes to print 
                                    770 ;	X   start address 
                                    771 ; output:
                                    772 ;   X   address after last shown  
                                    773 ;---------------------
                           000001   774 	CNT=1 
                           000002   775 	ADR=2 
                           000003   776 	VSIZE=3 
      0083A6                        777 show_row:
      0083A6 4D               [ 1]  778 	tnz a 
      0083A7 26 01            [ 1]  779 	jrne 1$
      0083A9 81               [ 4]  780 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083AA                        781 1$:	
      0083AA 89               [ 2]  782 	pushw x  
      0083AB 88               [ 1]  783 	push a 
      0083AC 35 04 00 25      [ 1]  784 	mov tab_width,#4 
      0083B0 CD 8A 3C         [ 4]  785 	call print_int 
      0083B3 A6 20            [ 1]  786 	ld a,#SPACE  
      0083B5 CD 83 20         [ 4]  787 	call putc
      0083B8                        788 row_loop:
      0083B8 1E 02            [ 2]  789 	ldw x,(ADR,sp)
      0083BA F6               [ 1]  790 	ld a,(x)
      0083BB 5F               [ 1]  791 	clrw x 
      0083BC 97               [ 1]  792 	ld xl,a 
      0083BD CD 8A 3C         [ 4]  793 	call print_int 
      0083C0 1E 02            [ 2]  794 	ldw x,(ADR,sp)
      0083C2 5C               [ 2]  795 	incw x 
      0083C3 1F 02            [ 2]  796 	ldw (ADR,sp),x 
      0083C5 0A 01            [ 1]  797 	dec (CNT,sp)
      0083C7 26 EF            [ 1]  798 	jrne row_loop
      000349                        799 	_drop VSIZE  		
      0083C9 5B 03            [ 2]    1     addw sp,#VSIZE 
      0083CB 35 04 00 25      [ 1]  800 	mov tab_width,#4
      0083CF A6 0D            [ 1]  801 	ld a,#CR 
      0083D1 CD 83 20         [ 4]  802 	call putc 
      0083D4 81               [ 4]  803 	ret 
                                    804 
                                    805 ;--------------------------
                                    806 ; print memory content 
                                    807 ; in hexadecimal format
                                    808 ;  input:
                                    809 ;    X    start address 
                                    810 ;    Y    count 
                                    811 ;--------------------------
                           000001   812 	BCNT=1
                           000003   813 	BASE=3
                           000004   814 	TABW=4
                           000004   815 	VSIZE=4   
      0083D5                        816 hex_dump:
      000355                        817 	_vars VSIZE
      0083D5 52 04            [ 2]    1     sub sp,#VSIZE 
      0083D7 C6 00 0B         [ 1]  818 	ld a,base
      0083DA 6B 03            [ 1]  819 	ld (BASE,sp),a 
      0083DC 35 10 00 0B      [ 1]  820 	mov base,#16
      0083E0 C6 00 25         [ 1]  821 	ld a,tab_width 
      0083E3 6B 04            [ 1]  822 	ld (TABW,sp),a
      0083E5 A6 0D            [ 1]  823 	ld a,#CR 
      0083E7 CD 83 20         [ 4]  824 	call putc 
      0083EA 17 01            [ 2]  825 1$: ldw (BCNT,sp),y
      0083EC A6 10            [ 1]  826 	ld a,#16
      0083EE 90 A3 00 10      [ 2]  827 	cpw y,#16
      0083F2 2A 02            [ 1]  828 	jrpl 2$
      0083F4 90 9F            [ 1]  829 	ld a,yl
      0083F6                        830 2$: 	
      0083F6 CD 83 A6         [ 4]  831 	call show_row 
      0083F9 16 01            [ 2]  832 	ldw y,(BCNT,sp) 
      0083FB 72 A2 00 10      [ 2]  833 	subw y,#16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      0083FF 90 A3 00 01      [ 2]  834 	cpw y,#1
      008403 2A E5            [ 1]  835 	jrpl 1$
      008405 7B 03            [ 1]  836 	ld a,(BASE,sp)
      008407 C7 00 0B         [ 1]  837 	ld base,a
      00840A 7B 04            [ 1]  838 	ld a,(TABW,sp)
      00840C C7 00 25         [ 1]  839 	ld tab_width,a 
      00038F                        840 	_drop VSIZE
      00840F 5B 04            [ 2]    1     addw sp,#VSIZE 
      008411 81               [ 4]  841 	ret 
                                    842 
                                    843 ;-------------------------------------
                                    844 ; retrun string length
                                    845 ; input:
                                    846 ;   X         .asciz  pointer 
                                    847 ; output:
                                    848 ;   X         length 
                                    849 ;-------------------------------------
      008412                        850 strlen:
      008412 90 93            [ 1]  851 	ldw y,x 
      008414 5F               [ 1]  852 	clrw x 
      008415 90 7D            [ 1]  853 1$:	tnz (y) 
      008417 27 05            [ 1]  854 	jreq 9$ 
      008419 5C               [ 2]  855 	incw x
      00841A 90 5C            [ 2]  856 	incw y 
      00841C 20 F7            [ 2]  857 	jra 1$ 
      00841E 81               [ 4]  858 9$: ret 
                                    859 
                                    860 ;------------------------------------
                                    861 ; compare 2 strings
                                    862 ; input:
                                    863 ;   X 		char* first string 
                                    864 ;   Y       char* second string 
                                    865 ; output:
                                    866 ;   A 		0|1 
                                    867 ;-------------------------------------
      00841F                        868 strcmp:
      00841F F6               [ 1]  869 	ld a,(x)
      008420 27 0B            [ 1]  870 	jreq 5$ 
      008422 90 F1            [ 1]  871 	cp a,(y) 
      008424 26 05            [ 1]  872 	jrne 4$ 
      008426 5C               [ 2]  873 	incw x 
      008427 90 5C            [ 2]  874 	incw y 
      008429 20 F4            [ 2]  875 	jra strcmp 
      00842B                        876 4$: ; not same  
      00842B 4F               [ 1]  877 	clr a 
      00842C 81               [ 4]  878 	ret 
      00842D                        879 5$: ; same 
      00842D A6 01            [ 1]  880 	ld a,#1 
      00842F 81               [ 4]  881 	ret 
                                    882 
                                    883 
                                    884 ;---------------------------------------
                                    885 ;  copy src to dest 
                                    886 ; input:
                                    887 ;   X 		dest 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    888 ;   Y 		src 
                                    889 ; output: 
                                    890 ;   X 		dest 
                                    891 ;----------------------------------
      008430                        892 strcpy:
      008430 89               [ 2]  893 	pushw x 
      008431 90 F6            [ 1]  894 1$: ld a,(y)
      008433 27 06            [ 1]  895 	jreq 9$ 
      008435 F7               [ 1]  896 	ld (x),a 
      008436 5C               [ 2]  897 	incw x 
      008437 90 5C            [ 2]  898 	incw y 
      008439 20 F6            [ 2]  899 	jra 1$ 
      00843B 7F               [ 1]  900 9$:	clr (x)
      00843C 85               [ 2]  901 	popw x 
      00843D 81               [ 4]  902 	ret 
                                    903 
                                    904 ;---------------------------------------
                                    905 ; move memory block 
                                    906 ; input:
                                    907 ;   X 		destination 
                                    908 ;   Y 	    source 
                                    909 ;   acc16	bytes count 
                                    910 ; output:
                                    911 ;   none 
                                    912 ;--------------------------------------
                           000001   913 	INCR=1 ; increament high byte 
                           000002   914 	LB=2 ; increament low byte 
                           000002   915 	VSIZE=2
      00843E                        916 move:
      0003BE                        917 	_vars VSIZE 
      00843E 52 02            [ 2]    1     sub sp,#VSIZE 
      008440 0F 01            [ 1]  918 	clr (INCR,sp)
      008442 0F 02            [ 1]  919 	clr (LB,sp)
      008444 90 89            [ 2]  920 	pushw y 
      008446 13 01            [ 2]  921 	cpw x,(1,sp) ; compare DEST to SRC 
      008448 90 85            [ 2]  922 	popw y 
      00844A 27 31            [ 1]  923 	jreq move_exit ; x==y 
      00844C 2B 0E            [ 1]  924 	jrmi move_down
      00844E                        925 move_up: ; start from top address with incr=-1
      00844E 72 BB 00 0D      [ 2]  926 	addw x,acc16
      008452 72 B9 00 0D      [ 2]  927 	addw y,acc16
      008456 03 01            [ 1]  928 	cpl (INCR,sp)
      008458 03 02            [ 1]  929 	cpl (LB,sp)   ; increment = -1 
      00845A 20 05            [ 2]  930 	jra move_loop  
      00845C                        931 move_down: ; start from bottom address with incr=1 
      00845C 5A               [ 2]  932     decw x 
      00845D 90 5A            [ 2]  933 	decw y
      00845F 0C 02            [ 1]  934 	inc (LB,sp) ; incr=1 
      008461                        935 move_loop:	
      008461 C6 00 0D         [ 1]  936     ld a, acc16 
      008464 CA 00 0E         [ 1]  937 	or a, acc8
      008467 27 14            [ 1]  938 	jreq move_exit 
      008469 72 FB 01         [ 2]  939 	addw x,(INCR,sp)
      00846C 72 F9 01         [ 2]  940 	addw y,(INCR,sp) 
      00846F 90 F6            [ 1]  941 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008471 F7               [ 1]  942 	ld (x),a 
      008472 89               [ 2]  943 	pushw x 
      008473 CE 00 0D         [ 2]  944 	ldw x,acc16 
      008476 5A               [ 2]  945 	decw x 
      008477 CF 00 0D         [ 2]  946 	ldw acc16,x 
      00847A 85               [ 2]  947 	popw x 
      00847B 20 E4            [ 2]  948 	jra move_loop
      00847D                        949 move_exit:
      0003FD                        950 	_drop VSIZE
      00847D 5B 02            [ 2]    1     addw sp,#VSIZE 
      00847F 81               [ 4]  951 	ret 	
                                    952 
                                    953 ;-------------------------------------
                                    954 ; search text area for a line#
                                    955 ; input:
                                    956 ;	X 			line# 
                                    957 ; output:
                                    958 ;   X 			addr of line | 0 
                                    959 ;   Y           line#|insert address if not found  
                                    960 ;-------------------------------------
                           000001   961 	LL=1 ; line length 
                           000002   962 	LB=2 ; line length low byte 
                           000002   963 	VSIZE=2 
      008480                        964 search_lineno:
      000400                        965 	_vars VSIZE
      008480 52 02            [ 2]    1     sub sp,#VSIZE 
      008482 0F 01            [ 1]  966 	clr (LL,sp)
      008484 90 CE 00 1D      [ 2]  967 	ldw y,txtbgn
      008488                        968 search_ln_loop:
      008488 90 C3 00 1F      [ 2]  969 	cpw y,txtend 
      00848C 2A 10            [ 1]  970 	jrpl 8$
      00848E 90 F3            [ 1]  971 	cpw x,(y)
      008490 27 0E            [ 1]  972 	jreq 9$
      008492 2B 0A            [ 1]  973 	jrmi 8$ 
      008494 90 E6 02         [ 1]  974 	ld a,(2,y)
      008497 6B 02            [ 1]  975 	ld (LB,sp),a 
      008499 72 F9 01         [ 2]  976 	addw y,(LL,sp)
      00849C 20 EA            [ 2]  977 	jra search_ln_loop 
      00849E                        978 8$: 
      00849E 5F               [ 1]  979 	clrw x 	
      00849F 51               [ 1]  980 	exgw x,y 
      000420                        981 9$: _drop VSIZE
      0084A0 5B 02            [ 2]    1     addw sp,#VSIZE 
      0084A2 51               [ 1]  982 	exgw x,y   
      0084A3 81               [ 4]  983 	ret 
                                    984 
                                    985 ;-------------------------------------
                                    986 ; delete line at addr
                                    987 ; input:
                                    988 ;   X 		addr of line i.e DEST for move 
                                    989 ;-------------------------------------
                           000001   990 	LLEN=1
                           000003   991 	SRC=3
                           000004   992 	VSIZE=4
      0084A4                        993 del_line: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      000424                        994 	_vars VSIZE 
      0084A4 52 04            [ 2]    1     sub sp,#VSIZE 
      0084A6 E6 02            [ 1]  995 	ld a,(2,x) ; line length
      0084A8 6B 02            [ 1]  996 	ld (LLEN+1,sp),a 
      0084AA 0F 01            [ 1]  997 	clr (LLEN,sp)
      0084AC 90 93            [ 1]  998 	ldw y,x  
      0084AE 72 F9 01         [ 2]  999 	addw y,(LLEN,sp) ;SRC  
      0084B1 17 03            [ 2] 1000 	ldw (SRC,sp),y  ;save source 
      0084B3 90 CE 00 1F      [ 2] 1001 	ldw y,txtend 
      0084B7 72 F2 03         [ 2] 1002 	subw y,(SRC,sp) ; y=count 
      0084BA 90 CF 00 0D      [ 2] 1003 	ldw acc16,y 
      0084BE 16 03            [ 2] 1004 	ldw y,(SRC,sp)    ; source
      0084C0 CD 84 3E         [ 4] 1005 	call move
      0084C3 90 CE 00 1F      [ 2] 1006 	ldw y,txtend 
      0084C7 72 F2 01         [ 2] 1007 	subw y,(LLEN,sp)
      0084CA 90 CF 00 1F      [ 2] 1008 	ldw txtend,y  
      00044E                       1009 	_drop VSIZE     
      0084CE 5B 04            [ 2]    1     addw sp,#VSIZE 
      0084D0 81               [ 4] 1010 	ret 
                                   1011 
                                   1012 ;---------------------------------------------
                                   1013 ; create a gap in text area to 
                                   1014 ; move new line in this gap
                                   1015 ; input:
                                   1016 ;    X 			addr gap start 
                                   1017 ;    Y 			gap length 
                                   1018 ; output:
                                   1019 ;    X 			addr gap start 
                                   1020 ;--------------------------------------------
                           000001  1021 	DEST=1
                           000003  1022 	SRC=3
                           000005  1023 	LEN=5
                           000006  1024 	VSIZE=6 
      0084D1                       1025 create_gap:
      000451                       1026 	_vars VSIZE
      0084D1 52 06            [ 2]    1     sub sp,#VSIZE 
      0084D3 1F 03            [ 2] 1027 	ldw (SRC,sp),x 
      0084D5 17 05            [ 2] 1028 	ldw (LEN,sp),y 
      0084D7 90 CF 00 0D      [ 2] 1029 	ldw acc16,y 
      0084DB 90 93            [ 1] 1030 	ldw y,x ; SRC
      0084DD 72 BB 00 0D      [ 2] 1031 	addw x,acc16  
      0084E1 1F 01            [ 2] 1032 	ldw (DEST,sp),x 
                                   1033 ;compute size to move 	
      0084E3 CE 00 1F         [ 2] 1034 	ldw x,txtend 
      0084E6 72 F0 03         [ 2] 1035 	subw x,(SRC,sp)
      0084E9 CF 00 0D         [ 2] 1036 	ldw acc16,x ; size to move
      0084EC 1E 01            [ 2] 1037 	ldw x,(DEST,sp) 
      0084EE CD 84 3E         [ 4] 1038 	call move
      0084F1 CE 00 1F         [ 2] 1039 	ldw x,txtend
      0084F4 72 FB 05         [ 2] 1040 	addw x,(LEN,sp)
      0084F7 CF 00 1F         [ 2] 1041 	ldw txtend,x
      00047A                       1042 9$:	_drop VSIZE 
      0084FA 5B 06            [ 2]    1     addw sp,#VSIZE 
      0084FC 81               [ 4] 1043 	ret 
                                   1044 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1045 ;--------------------------------------------
                                   1046 ; insert line in pad into text area 
                                   1047 ; first search for already existing 
                                   1048 ; replace existing 
                                   1049 ; if new line empty delete existing one. 
                                   1050 ; input:
                                   1051 ;   ptr16		pointer to tokenized line  
                                   1052 ; output:
                                   1053 ;   none
                                   1054 ;---------------------------------------------
                           000001  1055 	DEST=1  ; text area insertion address 
                           000003  1056 	SRC=3   ; str to insert address 
                           000005  1057 	LINENO=5 ; line number 
                           000007  1058 	LLEN=7 ; line length 
                           000008  1059 	VSIZE=8  
      0084FD                       1060 insert_line:
      00047D                       1061 	_vars VSIZE 
      0084FD 52 08            [ 2]    1     sub sp,#VSIZE 
      0084FF CE 00 1F         [ 2] 1062 	ldw x,txtend  
      008502 C3 00 1D         [ 2] 1063 	cpw x,txtbgn 
      008505 26 15            [ 1] 1064 	jrne 0$
                                   1065 ;first text line 
      008507 AE 00 02         [ 2] 1066 	ldw x,#2 
      00850A 72 D6 00 18      [ 4] 1067 	ld a,([ptr16],x)
      00850E 5F               [ 1] 1068 	clrw x 
      00850F 97               [ 1] 1069 	ld xl,a
      008510 1F 07            [ 2] 1070 	ldw (LLEN,sp),x 
      008512 CE 00 1D         [ 2] 1071 	ldw x,txtbgn
      008515 1F 01            [ 2] 1072 	ldw (DEST,sp),x 
      008517 CE 00 1F         [ 2] 1073 	ldw x,txtend 
      00851A 20 37            [ 2] 1074 	jra 4$
      00851C 72 CE 00 18      [ 5] 1075 0$:	ldw x,[ptr16]
                                   1076 ; line number
      008520 1F 05            [ 2] 1077 	ldw (LINENO,sp),x 
      008522 AE 00 02         [ 2] 1078 	ldw x,#2 
      008525 72 D6 00 18      [ 4] 1079 	ld a,([ptr16],x)
      008529 97               [ 1] 1080 	ld xl,a
                                   1081 ; line length
      00852A 1F 07            [ 2] 1082 	ldw (LLEN,sp),x
                                   1083 ; check if that line number already exit 	
      00852C 1E 05            [ 2] 1084 	ldw x,(LINENO,sp)
      00852E CD 84 80         [ 4] 1085 	call search_lineno 
      008531 5D               [ 2] 1086 	tnzw x 
      008532 26 04            [ 1] 1087 	jrne 2$
                                   1088 ; line doesn't exit
                                   1089 ; it will be inserted at this point.  	
      008534 17 01            [ 2] 1090 	ldw (DEST,sp),y 
      008536 20 05            [ 2] 1091 	jra 3$
                                   1092 ; line exit delete it.
                                   1093 ; it will be replaced by new one 	
      008538 1F 01            [ 2] 1094 2$: ldw (DEST,sp),x 
      00853A CD 84 A4         [ 4] 1095 	call del_line
      00853D                       1096 3$: 
                                   1097 ; insert new line or leave if LLEN==3
                                   1098 ; LLEN==3 means empty line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00853D A6 03            [ 1] 1099 	ld a,#3
      00853F 11 08            [ 1] 1100 	cp a,(LLEN+1,sp)
      008541 27 24            [ 1] 1101 	jreq insert_ln_exit ; empty line exit.
                                   1102 ; if insertion point at txtend 
                                   1103 ; move no need to create a gap 
      008543 1E 01            [ 2] 1104 	ldw x,(DEST,sp)
      008545 C3 00 1F         [ 2] 1105 	cpw x,txtend 
      008548 27 09            [ 1] 1106 	jreq 4$ 
                                   1107 ; must create a gap
                                   1108 ; at insertion point  
      00854A 1E 01            [ 2] 1109 	ldw x,(DEST,sp)
      00854C 16 07            [ 2] 1110 	ldw y,(LLEN,sp)
      00854E CD 84 D1         [ 4] 1111 	call create_gap
      008551 20 06            [ 2] 1112 	jra 5$
      008553                       1113 4$: 
      008553 72 FB 07         [ 2] 1114 	addw x,(LLEN,sp)
      008556 CF 00 1F         [ 2] 1115 	ldw txtend,x 	 
                                   1116 ; move new line in gap 
      008559 1E 07            [ 2] 1117 5$:	ldw x,(LLEN,sp)
      00855B CF 00 0D         [ 2] 1118 	ldw acc16,x 
      00855E 90 AE 16 E0      [ 2] 1119 	ldw y,#pad ;SRC 
      008562 1E 01            [ 2] 1120 	ldw x,(DEST,sp) ; dest address 
      008564 CD 84 3E         [ 4] 1121 	call move 
      008567                       1122 insert_ln_exit:	
      0004E7                       1123 	_drop VSIZE
      008567 5B 08            [ 2]    1     addw sp,#VSIZE 
      008569 81               [ 4] 1124 	ret
                                   1125 
                                   1126 ;-----------------------------------
                                   1127 ; create token list fromm text line 
                                   1128 ; save this list in pad buffer 
                                   1129 ;  compiled line format: 
                                   1130 ;    line_no  2 bytes {0...32767}
                                   1131 ;    count    1 byte  
                                   1132 ;    tokens   variable length 
                                   1133 ;   
                                   1134 ; input:
                                   1135 ;   none
                                   1136 ; modified variables:
                                   1137 ;   basicptr     token list buffer address 
                                   1138 ;   in.w  		 3|count, i.e. index in buffer
                                   1139 ;   count        length of line | 0  
                                   1140 ;-----------------------------------
                           000001  1141 	XSAVE=1
                           000002  1142 	VSIZE=2
      00856A                       1143 compile:
      0004EA                       1144 	_vars VSIZE 
      00856A 52 02            [ 2]    1     sub sp,#VSIZE 
      00856C 72 1A 00 24      [ 1] 1145 	bset flags,#FCOMP 
      008570 A6 00            [ 1] 1146 	ld a,#0
      008572 AE 00 00         [ 2] 1147 	ldw x,#0
      008575 CF 16 E0         [ 2] 1148 	ldw pad,x ; destination buffer 
      008578 C7 16 E2         [ 1] 1149 	ld pad+2,a ; count 
      00857B AE 16 E3         [ 2] 1150 	ldw x,#pad+3
      00857E 72 5F 00 02      [ 1] 1151 	clr in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      008582 CD 8C FE         [ 4] 1152 	call get_token
      008585 A1 84            [ 1] 1153 	cp a,#TK_INTGR
      008587 26 11            [ 1] 1154 	jrne 2$
      008589 A3 00 01         [ 2] 1155 	cpw x,#1 
      00858C 2A 05            [ 1] 1156 	jrpl 1$
      00858E A6 0A            [ 1] 1157 	ld a,#ERR_BAD_VALUE
      008590 CC 88 F7         [ 2] 1158 	jp tb_error
      008593 CF 16 E0         [ 2] 1159 1$:	ldw pad,x 
      008596 90 AE 16 E3      [ 2] 1160 	ldw y,#pad+3 
      00859A 90 A3 17 60      [ 2] 1161 2$:	cpw y,#stack_full 
      00859E 25 05            [ 1] 1162 	jrult 3$
      0085A0 A6 0F            [ 1] 1163 	ld a,#ERR_BUF_FULL 
      0085A2 CC 88 F7         [ 2] 1164 	jp tb_error 
      0085A5                       1165 3$:	
      0085A5 93               [ 1] 1166 	ldw x,y 
      0085A6 CD 8C FE         [ 4] 1167 	call get_token 
      0085A9 A1 00            [ 1] 1168 	cp a,#TK_NONE 
      0085AB 26 ED            [ 1] 1169 	jrne 2$ 
                                   1170 ; compilation completed  
      0085AD 72 A2 16 E0      [ 2] 1171 	subw y,#pad
      0085B1 90 9F            [ 1] 1172     ld a,yl
      0085B3 AE 16 E0         [ 2] 1173 	ldw x,#pad 
      0085B6 CF 00 18         [ 2] 1174 	ldw ptr16,x 
      0085B9 E7 02            [ 1] 1175 	ld (2,x),a 
      0085BB FE               [ 2] 1176 	ldw x,(x)
      0085BC 27 09            [ 1] 1177 	jreq 10$
      0085BE CD 84 FD         [ 4] 1178 	call insert_line
      0085C1 72 5F 00 04      [ 1] 1179 	clr  count 
      0085C5 20 0F            [ 2] 1180 	jra  11$ 
      0085C7                       1181 10$: ; line# is zero 
      0085C7 CE 00 18         [ 2] 1182 	ldw x,ptr16  
      0085CA CF 00 05         [ 2] 1183 	ldw basicptr,x 
      0085CD E6 02            [ 1] 1184 	ld a,(2,x)
      0085CF C7 00 04         [ 1] 1185 	ld count,a 
      0085D2 35 03 00 02      [ 1] 1186 	mov in,#3 
      0085D6                       1187 11$:
      000556                       1188 	_drop VSIZE 
      0085D6 5B 02            [ 2]    1     addw sp,#VSIZE 
      0085D8 72 1B 00 24      [ 1] 1189 	bres flags,#FCOMP 
      0085DC 81               [ 4] 1190 	ret 
                                   1191 
                                   1192 ;------------------------------------
                                   1193 ;  set all variables to zero 
                                   1194 ; input:
                                   1195 ;   none 
                                   1196 ; output:
                                   1197 ;	none
                                   1198 ;------------------------------------
      0085DD                       1199 clear_vars:
      0085DD AE 00 27         [ 2] 1200 	ldw x,#vars 
      0085E0 90 AE 00 34      [ 2] 1201 	ldw y,#2*26 
      0085E4 7F               [ 1] 1202 1$:	clr (x)
      0085E5 5C               [ 2] 1203 	incw x 
      0085E6 90 5A            [ 2] 1204 	decw y 
      0085E8 26 FA            [ 1] 1205 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0085EA 81               [ 4] 1206 	ret 
                                   1207 
                                   1208 ;-------------------------------------
                                   1209 ; check if A is a letter 
                                   1210 ; input:
                                   1211 ;   A 			character to test 
                                   1212 ; output:
                                   1213 ;   C flag      1 true, 0 false 
                                   1214 ;-------------------------------------
      0085EB                       1215 is_alpha:
      0085EB A1 41            [ 1] 1216 	cp a,#'A 
      0085ED 8C               [ 1] 1217 	ccf
      0085EE 24 0B            [ 1] 1218 	jrnc 9$ 
      0085F0 A1 5B            [ 1] 1219 	cp a,#'Z+1 
      0085F2 25 07            [ 1] 1220 	jrc 9$ 
      0085F4 A1 61            [ 1] 1221 	cp a,#'a 
      0085F6 8C               [ 1] 1222 	ccf 
      0085F7 24 02            [ 1] 1223 	jrnc 9$
      0085F9 A1 7B            [ 1] 1224 	cp a,#'z+1   
      0085FB 81               [ 4] 1225 9$: ret 	
                                   1226 
                                   1227 ;------------------------------------
                                   1228 ; check if character in {'0'..'9'}
                                   1229 ; input:
                                   1230 ;    A  character to test
                                   1231 ; output:
                                   1232 ;    Carry  0 not digit | 1 digit
                                   1233 ;------------------------------------
      0085FC                       1234 is_digit:
      0085FC A1 30            [ 1] 1235 	cp a,#'0
      0085FE 25 03            [ 1] 1236 	jrc 1$
      008600 A1 3A            [ 1] 1237     cp a,#'9+1
      008602 8C               [ 1] 1238 	ccf 
      008603 8C               [ 1] 1239 1$:	ccf 
      008604 81               [ 4] 1240     ret
                                   1241 
                                   1242 ;-------------------------------------
                                   1243 ;  program initialization entry point 
                                   1244 ;-------------------------------------
                           000001  1245 	MAJOR=1
                           000000  1246 	MINOR=0
      008605 0A 0A 54 69 6E 79 20  1247 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      00864B                       1248 cold_start:
                                   1249 ;set stack 
      00864B AE 17 FF         [ 2] 1250 	ldw x,#STACK_EMPTY
      00864E 94               [ 1] 1251 	ldw sp,x   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1252 ; clear all ram 
      00864F 7F               [ 1] 1253 0$: clr (x)
      008650 5A               [ 2] 1254 	decw x 
      008651 26 FC            [ 1] 1255 	jrne 0$
                                   1256 ; activate pull up on all inputs 
      008653 A6 FF            [ 1] 1257 	ld a,#255 
      008655 C7 50 03         [ 1] 1258 	ld PA_CR1,a 
      008658 C7 50 08         [ 1] 1259 	ld PB_CR1,a 
      00865B C7 50 0D         [ 1] 1260 	ld PC_CR1,a 
      00865E C7 50 12         [ 1] 1261 	ld PD_CR1,a 
      008661 C7 50 17         [ 1] 1262 	ld PE_CR1,a 
      008664 C7 50 1C         [ 1] 1263 	ld PF_CR1,a 
      008667 C7 50 21         [ 1] 1264 	ld PG_CR1,a 
      00866A C7 50 2B         [ 1] 1265 	ld PI_CR1,a
                                   1266 ; set LD2 pin as output and turn it on
      00866D 72 1A 50 0D      [ 1] 1267     bset PC_CR1,#LED2_BIT
      008671 72 1A 50 0E      [ 1] 1268     bset PC_CR2,#LED2_BIT
      008675 72 1A 50 0C      [ 1] 1269     bset PC_DDR,#LED2_BIT
      008679 72 1A 50 0A      [ 1] 1270 	bset PC_ODR,#LED2_BIT 
                                   1271 ; disable schmitt triggers on Arduino CN4 analog inputs
      00867D 55 00 3F 54 07   [ 1] 1272 	mov ADC_TDRL,0x3f
                                   1273 ; disable peripherals clocks
                                   1274 ;	clr CLK_PCKENR1 
                                   1275 ;	clr CLK_PCKENR2
      008682 72 5F 50 F2      [ 1] 1276 	clr AWU_TBR 
      008686 72 14 50 CA      [ 1] 1277 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1278 ; select internal clock no divisor: 16 Mhz 	
      00868A A6 E1            [ 1] 1279 	ld a,#CLK_SWR_HSI 
      00868C 5F               [ 1] 1280 	clrw x  
      00868D CD 81 1D         [ 4] 1281     call clock_init 
      008690 CD 81 40         [ 4] 1282 	call timer4_init
      008693 CD 81 33         [ 4] 1283 	call timer2_init
                                   1284 ; UART1 at 115200 BAUD
      008696 CD 82 E5         [ 4] 1285 	call uart1_init
                                   1286 ; activate PE_4 (user button interrupt)
      008699 72 18 50 18      [ 1] 1287     bset PE_CR2,#USR_BTN_BIT 
                                   1288 ; display system information
      00869D AE 86 05         [ 2] 1289 	ldw x,#software 
      0086A0 CD 83 33         [ 4] 1290 	call puts 
      0086A3 A6 01            [ 1] 1291 	ld a,#MAJOR 
      0086A5 C7 00 0E         [ 1] 1292 	ld acc8,a 
      0086A8 5F               [ 1] 1293 	clrw x 
      0086A9 CF 00 0C         [ 2] 1294 	ldw acc24,x
      0086AC 72 5F 00 25      [ 1] 1295 	clr tab_width  
      0086B0 35 0A 00 0B      [ 1] 1296 	mov base, #10 
      0086B4 CD 8A 4C         [ 4] 1297 	call prti24 
      0086B7 A6 2E            [ 1] 1298 	ld a,#'.
      0086B9 CD 83 20         [ 4] 1299 	call putc 
      0086BC A6 00            [ 1] 1300 	ld a,#MINOR 
      0086BE C7 00 0E         [ 1] 1301 	ld acc8,a 
      0086C1 5F               [ 1] 1302 	clrw x 
      0086C2 CF 00 0C         [ 2] 1303 	ldw acc24,x 
      0086C5 CD 8A 4C         [ 4] 1304 	call prti24
      0086C8 A6 0D            [ 1] 1305 	ld a,#CR 
      0086CA CD 83 20         [ 4] 1306 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0086CD CD 9A 3C         [ 4] 1307 	call seek_fdrive 
      0086D0 9A               [ 1] 1308 	rim 
      0086D1 72 5C 00 16      [ 1] 1309 	inc seedy+1 
      0086D5 72 5C 00 14      [ 1] 1310 	inc seedx+1 
      0086D9 CD 87 61         [ 4] 1311 	call clear_basic
      0086DC CD 92 F6         [ 4] 1312 	call ubound 
                                   1313 ;	jra 2$	
                                   1314 ; 150 msec beep 
      0086DF AE 00 96         [ 2] 1315 	ldw x,#150 
      0086E2 90 AE 03 E6      [ 2] 1316 	ldw y,#998 
      0086E6 CD 98 A0         [ 4] 1317 	call beep  
      0086E9 72 1B 50 0A      [ 1] 1318 2$:	bres PC_ODR,#LED2_BIT	
      0086ED CD 86 F6         [ 4] 1319 	call warm_init
      0086F0 CD 87 23         [ 4] 1320 	call load_autorun
      0086F3 CC 89 7F         [ 2] 1321     jp cmd_line  
                                   1322 
      0086F6                       1323 warm_init:
      0086F6 72 5F 00 24      [ 1] 1324 	clr flags 
      0086FA 72 5F 00 21      [ 1] 1325 	clr loop_depth 
      0086FE 35 04 00 25      [ 1] 1326 	mov tab_width,#TAB_WIDTH 
      008702 35 0A 00 0B      [ 1] 1327 	mov base,#10 
      008706 AE 00 00         [ 2] 1328 	ldw x,#0 
      008709 CF 00 05         [ 2] 1329 	ldw basicptr,x 
      00870C CF 00 01         [ 2] 1330 	ldw in.w,x 
      00870F 72 5F 00 04      [ 1] 1331 	clr count
      008713 81               [ 4] 1332 	ret 
                                   1333 
                                   1334 ;--------------------------
                                   1335 ; called by tb_error when
                                   1336 ; flag FAUTORUN is set.
                                   1337 ; There is a bug in autorun 
                                   1338 ; program so cancel it.
                                   1339 ;---------------------------
      008714                       1340 cancel_autorun:
      008714 AE 40 00         [ 2] 1341 	ldw x,#AUTORUN_NAME 
      008717 CF 00 18         [ 2] 1342 	ldw farptr+1,x 
      00871A 4F               [ 1] 1343 	clr a
      00871B 5F               [ 1] 1344 	clrw x  
      00871C C7 00 17         [ 1] 1345 	ld farptr,a 
      00871F CD 82 4D         [ 4] 1346 	call write_byte 
      008722 81               [ 4] 1347 	ret 
                                   1348 
                                   1349 
                                   1350 ;--------------------------
                                   1351 ; if autorun file defined 
                                   1352 ; in eeprom address AUTORUN_NAME 
                                   1353 ; load and run it.
                                   1354 ;-------------------------
      008723                       1355 load_autorun:
      008723 90 AE 40 00      [ 2] 1356 	ldw y,#AUTORUN_NAME
      008727 90 F6            [ 1] 1357 	ld a,(y)
      008729 27 20            [ 1] 1358 	jreq 9$
      00872B CD 9A A2         [ 4] 1359 	call search_file
      00872E 25 05            [ 1] 1360 	jrc 2$ 
                                   1361 ; if file doesn't exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008730 CD 87 14         [ 4] 1362 	call cancel_autorun
      008733 20 16            [ 2] 1363 	jra 9$ 
      008735 CD 9B B8         [ 4] 1364 2$:	call load_file
      008738 AE 40 00         [ 2] 1365 	ldw x,#AUTORUN_NAME 
      00873B CD 83 33         [ 4] 1366 	call puts
      00873E AE 87 4C         [ 2] 1367 	ldw x,#autorun_msg 
      008741 CD 83 33         [ 4] 1368 	call puts 
      008744 72 1C 00 24      [ 1] 1369 	bset flags,#FAUTORUN 
      008748 CC 98 65         [ 2] 1370 	jp run_it    
      00874B 81               [ 4] 1371 9$: ret 	
                                   1372 
      00874C 20 6C 6F 61 64 65 64  1373 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1374 ;---------------------------
                                   1375 ; reset BASIC text variables 
                                   1376 ; and clear variables 
                                   1377 ;---------------------------
      008761                       1378 clear_basic:
      008761 72 5F 00 04      [ 1] 1379 	clr count
      008765 72 5F 00 02      [ 1] 1380 	clr in  
      008769 AE 00 5B         [ 2] 1381 	ldw x,#free_ram 
      00876C CF 00 1D         [ 2] 1382 	ldw txtbgn,x 
      00876F CF 00 1F         [ 2] 1383 	ldw txtend,x 
      008772 CD 85 DD         [ 4] 1384 	call clear_vars 
      008775 81               [ 4] 1385 	ret 
                                   1386 
                                   1387 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1388 ;;   Tiny BASIC error messages     ;;
                                   1389 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008776                       1390 err_msg:
      008776 00 00 87 96 87 A3 87  1391 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             B1 87 CA 87 D9
      008782 87 EF 88 05 88 1F 88  1392 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             30 88 41
      00878C 88 4D 88 80 88 90 88  1393 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             A4 88 B7
                                   1394 
      008796 4D 65 6D 6F 72 79 20  1395 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      0087A3 73 79 6E 74 61 78 20  1396 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      0087B1 6D 61 74 68 20 6F 70  1397 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0087CA 64 69 76 69 73 69 6F  1398 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      0087D9 69 6E 76 61 6C 69 64  1399 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0087EF 72 75 6E 20 74 69 6D  1400 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal  75-Bits]



             75 73 61 67 65 2E 0A
             00
      0087FE 73 61 67 65 2E 0A 00  1401 err_cmd_only: .asciz "command line only usage.\n"
             63 6F 6D 6D 61 6E 64
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75
      008818 73 61 67 65 2E 0A 00  1402 err_duplicate: .asciz "duplicate name.\n"
             64 75 70 6C 69 63 61
             74 65 20
      008829 6E 61 6D 65 2E 0A 00  1403 err_not_file: .asciz "File not found.\n"
             46 69 6C 65 20 6E 6F
             74 20 66
      00883A 6F 75 6E 64 2E 0A 00  1404 err_bad_value: .asciz "bad value.\n"
             62 61 64 20 76
      008846 61 6C 75 65 2E 0A 00  1405 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             46 69 6C 65 20 69 6E
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74
      008879 68 65 72 65 2E 0A 00  1406 err_no_data: .asciz "No data found.\n"
             4E 6F 20 64 61 74 61
             20 66
      008889 6F 75 6E 64 2E 0A 00  1407 err_no_prog: .asciz "No program in RAM!\n"
             4E 6F 20 70 72 6F 67
             72 61 6D 20 69 6E
      00889D 20 52 41 4D 21 0A 00  1408 err_no_fspace: .asciz "File system full.\n" 
             46 69 6C 65 20 73 79
             73 74 65 6D 20
      0088B0 66 75 6C 6C 2E 0A 00  1409 err_buf_full: .asciz "Buffer full\n"
             42 75 66 66 65 72
                                   1410 
      0088BD 20 66 75 6C 6C 0A 00  1411 rt_msg: .asciz "run time error, "
             72 75 6E 20 74 69 6D
             65 20 65
      0088CE 72 72 6F 72 2C 20 00  1412 comp_msg: .asciz "compile error, "
             63 6F 6D 70 69 6C 65
             20 65
      0088DE 72 72 6F 72 2C 20 00  1413 tk_id: .asciz "last token id: "
             6C 61 73 74 20 74 6F
             6B 65
                                   1414 
      000875                       1415 syntax_error:
      0088EE 6E 20            [ 1] 1416 	ld a,#ERR_SYNTAX 
                                   1417 
      000877                       1418 tb_error:
      0088F0 69 64 3A 20 00   [ 2] 1419 	btjt flags,#FCOMP,1$
      0088F5 88               [ 1] 1420 	push a 
      0088F5 A6 02 44         [ 2] 1421 	ldw x, #rt_msg 
      0088F7 CD 02 B3         [ 4] 1422 	call puts 
      0088F7 72               [ 1] 1423 	pop a 
      0088F8 0A 00 24         [ 2] 1424 	ldw x, #err_msg 
      0088FB 47 88 AE 88      [ 1] 1425 	clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0088FF C4               [ 1] 1426 	sll a
      008900 CD 83 33 84      [ 1] 1427 	rlc acc16  
      008904 AE 87 76         [ 1] 1428 	ld acc8, a 
      008907 72 5F 00 0D      [ 2] 1429 	addw x,acc16 
      00890B 48               [ 2] 1430 	ldw x,(x)
      00890C 72 59 00         [ 4] 1431 	call puts
      00890F 0D C7 00         [ 2] 1432 	ldw x,basicptr
      008912 0E 72 BB         [ 1] 1433 	ld a,in 
      008915 00 0D FE         [ 4] 1434 	call prt_basic_line
      008918 CD 83 33         [ 2] 1435 	ldw x,#tk_id 
      00891B CE 00 05         [ 4] 1436 	call puts 
      00891E C6 00 02         [ 1] 1437 	ld a,in.saved 
      008921 CD               [ 1] 1438 	clrw x 
      008922 94               [ 1] 1439 	ld xl,a 
      008923 10 AE 88 E5      [ 2] 1440 	addw x,basicptr 
      008927 CD               [ 1] 1441 	ld a,(x)
      008928 83               [ 1] 1442 	clrw x 
      008929 33               [ 1] 1443 	ld xl,a 
      00892A C6 00 03         [ 4] 1444 	call print_int
      00892D 5F 97 72 BB 00   [ 2] 1445 	btjf flags,#FAUTORUN ,6$
      008932 05 F6 5F         [ 4] 1446 	call cancel_autorun  
      008935 97 CD            [ 2] 1447 	jra 6$
      0008C3                       1448 1$:	
      008937 8A               [ 1] 1449 	push a 
      008938 3C 72 0D         [ 2] 1450 	ldw x,#comp_msg
      00893B 00 24 3A         [ 4] 1451 	call puts 
      00893E CD               [ 1] 1452 	pop a 
      00893F 87 14 20         [ 2] 1453 	ldw x, #err_msg 
      008942 35 5F 00 0C      [ 1] 1454 	clr acc16 
      008943 48               [ 1] 1455 	sll a
      008943 88 AE 88 D5      [ 1] 1456 	rlc acc16  
      008947 CD 83 33         [ 1] 1457 	ld acc8, a 
      00894A 84 AE 87 76      [ 2] 1458 	addw x,acc16 
      00894E 72               [ 2] 1459 	ldw x,(x)
      00894F 5F 00 0D         [ 4] 1460 	call puts
      008952 48 72 59         [ 2] 1461 	ldw x,#tib
      008955 00 0D C7         [ 4] 1462 	call puts 
      008958 00 0E            [ 1] 1463 	ld a,#CR 
      00895A 72 BB 00         [ 4] 1464 	call putc
      00895D 0D FE CD         [ 2] 1465 	ldw x,in.w
      008960 83 33 AE         [ 4] 1466 	call spaces
      008963 16 90            [ 1] 1467 	ld a,#'^
      008965 CD 83 33         [ 4] 1468 	call putc 
      008968 A6 0D CD         [ 2] 1469 6$: ldw x,#STACK_EMPTY 
      00896B 83               [ 1] 1470     ldw sp,x
      0008FC                       1471 warm_start:
      00896C 20 CE 00         [ 4] 1472 	call warm_init
                                   1473 ;----------------------------
                                   1474 ;   BASIC interpreter
                                   1475 ;----------------------------
      0008FF                       1476 cmd_line: ; user interface 
      00896F 01 CD            [ 1] 1477 	ld a,#CR 
      008971 83 5B A6         [ 4] 1478 	call putc 
      008974 5E CD            [ 1] 1479 	ld a,#'> 
      008976 83 20 AE         [ 4] 1480 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      008979 17 FF 94         [ 4] 1481 	call readln
      00897C 72 5D 00 03      [ 1] 1482 	tnz count 
      00897C CD 86            [ 1] 1483 	jreq cmd_line
      00897E F6 04 EA         [ 4] 1484 	call compile
                                   1485 ; if text begin with a line number
                                   1486 ; the compiler set count to zero    
                                   1487 ; so code is not interpreted
      00897F 72 5D 00 03      [ 1] 1488 	tnz count 
      00897F A6 0D            [ 1] 1489 	jreq cmd_line
                                   1490 
                                   1491 ; if direct command 
                                   1492 ; it's ready to interpret 
                                   1493 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1494 ;; This is the interpreter loop
                                   1495 ;; for each BASIC code line. 
                                   1496 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00091B                       1497 interpreter: 
      008981 CD 83 20         [ 1] 1498 	ld a,in 
      008984 A6 3E CD         [ 1] 1499 	cp a,count 
      008987 83 20            [ 1] 1500 	jrmi interp_loop
      000923                       1501 next_line:
      008989 CD 8B 49 72 5D   [ 2] 1502 	btjf flags, #FRUN, cmd_line
      00898E 00 04 27         [ 2] 1503 	ldw x,basicptr
      008991 ED CD 85 6A      [ 2] 1504 	addw x,in.w 
      008995 72 5D 00         [ 2] 1505 	cpw x,txtend 
      008998 04 27            [ 1] 1506 	jrpl warm_start
      00899A E4 00 04         [ 2] 1507 	ldw basicptr,x ; start of next line  
      00899B E6 02            [ 1] 1508 	ld a,(2,x)
      00899B C6 00 02         [ 1] 1509 	ld count,a 
      00899E C1 00 04 2B      [ 1] 1510 	mov in,#3 ; skip first 3 bytes of line 
      000940                       1511 interp_loop: 
      0089A2 1D 09 67         [ 4] 1512 	call next_token
      0089A3 A1 00            [ 1] 1513 	cp a,#TK_NONE 
      0089A3 72 01            [ 1] 1514 	jreq next_line 
      0089A5 00 24            [ 1] 1515 	cp a,#TK_CMD
      0089A7 D7 CE            [ 1] 1516 	jrne 1$
      0089A9 00               [ 4] 1517 	call (x) 
      0089AA 05 72            [ 2] 1518 	jra interp_loop 
      00094E                       1519 1$:	 
      0089AC BB 00            [ 1] 1520 	cp a,#TK_VAR
      0089AE 01 C3            [ 1] 1521 	jrne 2$
      0089B0 00 1F 2A         [ 4] 1522 	call let_var  
      0089B3 C8 CF            [ 2] 1523 	jra interp_loop 
      000957                       1524 2$:	
      0089B5 00 05            [ 1] 1525 	cp a,#TK_ARRAY 
      0089B7 E6 02            [ 1] 1526 	jrne 3$
      0089B9 C7 00 04         [ 4] 1527 	call let_array 
      0089BC 35 03            [ 2] 1528 	jra interp_loop
      000960                       1529 3$:	
      0089BE 00 02            [ 1] 1530 	cp a,#TK_COLON 
      0089C0 27 DC            [ 1] 1531 	jreq interp_loop 
      0089C0 CD 89 E7         [ 2] 1532 	jp syntax_error 
                                   1533 
                                   1534 		
                                   1535 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1536 ; extract next token from
                                   1537 ; token list 
                                   1538 ; basicptr -> base address 
                                   1539 ; in  -> offset in list array 
                                   1540 ; output:
                                   1541 ;   A 		token attribute
                                   1542 ;   X 		token value if there is one
                                   1543 ;----------------------------------------
      000967                       1544 next_token:
      0089C3 A1               [ 1] 1545 	clrw x 
      0089C4 00 27 DC         [ 1] 1546 	ld a,in 
      0089C7 A1 80 26         [ 1] 1547 	sub a,count ; don't replace sub by cp!  
      0089CA 03 FD            [ 1] 1548 	jrmi 0$
      0089CC 20               [ 4] 1549 	ret  ; end of BASIC line 
      000971                       1550 0$: 
      0089CD F2 00 01 00 02   [ 1] 1551 	mov in.saved,in 
      0089CE 90 CE 00 04      [ 2] 1552 	ldw y,basicptr 
      0089CE A1 85 26         [ 4] 1553 	ld a,([in.w],y)
      0089D1 05 CD 93 29      [ 1] 1554 	inc in  
      0089D5 20               [ 1] 1555 	tnz a 
      0089D6 E9 2B            [ 1] 1556 	jrmi 6$
      0089D7 A1 06            [ 1] 1557 	cp a,#TK_ARRAY
      0089D7 A1 06            [ 1] 1558 	jrpl 9$  ; no attribute for these
      0089D9 26 05            [ 1] 1559 	cp a,#TK_COLON
      0089DB CD 93            [ 1] 1560 	jreq 9$  
      00098C                       1561 1$: ; 
      0089DD 26 20            [ 1] 1562 	cp a,#TK_CHAR
      0089DF E0 0B            [ 1] 1563 	jrne 2$
      0089E0 91 D6 00         [ 4] 1564 	ld a,([in.w],y)
      0089E0 A1 01 27 DC      [ 1] 1565 	inc in 
      0089E4 CC               [ 1] 1566 	exg a,xl  
      0089E5 88 F5            [ 1] 1567 	ld a,#TK_CHAR
      0089E7 81               [ 4] 1568 	ret
      0089E7 5F C6            [ 1] 1569 2$:	cp a,#TK_QSTR 
      0089E9 00 02            [ 1] 1570 	jrne 9$
      0089EB C0               [ 1] 1571 	ldw x,y 
      0089EC 00 04 2B 01      [ 2] 1572 	addw x,in.w ; pointer to string 
                                   1573 ; move pointer after string 
      0089F0 81 6D 00         [ 4] 1574 3$:	tnz ([in.w],y)
      0089F1 27 0E            [ 1] 1575 	jreq 8$
      0089F1 55 00 02 00      [ 1] 1576 	inc in 
      0089F5 03 90            [ 2] 1577 	jra 3$
      0009AF                       1578 6$: 
      0089F7 CE 00 05         [ 5] 1579 	ldw y,([in.w],y)
      0089FA 91               [ 1] 1580 	exgw x,y 
      0089FB D6 01 72 5C      [ 1] 1581 	inc in
      0089FF 00 02 4D 2B      [ 1] 1582 8$:	inc in 
      0009BB                       1583 9$: 
      008A03 2B               [ 4] 1584 	ret	
                                   1585 
                                   1586 ;-----------------------------------
                                   1587 ; print a 16 bit integer 
                                   1588 ; using variable 'base' as conversion
                                   1589 ; format.
                                   1590 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1591 ;   X       integer to print 
                                   1592 ;   'base'    conversion base 
                                   1593 ; output:
                                   1594 ;   none 
                                   1595 ;-----------------------------------
      0009BC                       1596 print_int:
      008A04 A1 06 2A 33      [ 1] 1597 	clr acc24 
      008A08 A1 01 27         [ 2] 1598 	ldw acc16,x 
      008A0B 2F 0F 00 0C 04   [ 2] 1599 	btjf acc16,#7,prti24
      008A0C 72 53 00 0B      [ 1] 1600 	cpl acc24 
                                   1601 
                                   1602 ;------------------------------------
                                   1603 ; print integer in acc24 
                                   1604 ; input:
                                   1605 ;	acc24 		integer to print 
                                   1606 ;	'base' 		numerical base for conversion 
                                   1607 ;   'tab_width' field width 
                                   1608 ;  output:
                                   1609 ;    none 
                                   1610 ;------------------------------------
                           000010  1611 	BUFF_LEN=16
                           000001  1612 	SPCNT=1
                           000002  1613 	BUFFER=2
                           000011  1614 	VSIZE=17 
      0009CC                       1615 prti24:
      008A0C A1               [ 1] 1616 	ldw x,sp 
      0009CD                       1617 	_vars VSIZE 
      008A0D 03 26            [ 2]    1     sub sp,#VSIZE 
      008A0F 0B 91 D6         [ 4] 1618     call itoa  ; conversion entier en  .asciz
      008A12 01 72            [ 1] 1619 	ld (SPCNT,sp),a 
      008A14 5C 00            [ 1] 1620 	ld a,#15 
      008A16 02 41 A6         [ 1] 1621 	and a,tab_width 
      008A19 03 81 A1         [ 1] 1622 	ld tab_width,a 
      008A1C 02 26            [ 1] 1623 1$: ld a,(SPCNT,sp)
      008A1E 1C 93 72         [ 1] 1624 	cp a,tab_width
      008A21 BB 00            [ 1] 1625 	jruge 4$
      008A23 01 91            [ 1] 1626 	ld  a,#SPACE
      008A25 6D               [ 2] 1627 	decw x
      008A26 01               [ 1] 1628     ld (x),a 
      008A27 27 0E            [ 1] 1629 	inc (SPCNT,sp)
      008A29 72 5C            [ 2] 1630 	jra 1$ 
      0009EB                       1631 4$: 
      008A2B 00 02 20         [ 4] 1632 	call puts 
      0009EE                       1633 5$: _drop VSIZE 
      008A2E F5 11            [ 2]    1     addw sp,#VSIZE 
      008A2F 81               [ 4] 1634     ret	
                                   1635 
                                   1636 ;------------------------------------
                                   1637 ; convert integer in acc24 to string
                                   1638 ; input:
                                   1639 ;   'base'	conversion base 
                                   1640 ;	acc24	integer to convert
                                   1641 ;   X       pointer to end of convertion buffer 
                                   1642 ; output:
                                   1643 ;   X  		pointer to first char of string
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1644 ;   A       string length
                                   1645 ;------------------------------------
                           000001  1646 	SIGN=1  ; integer sign 
                           000002  1647 	LEN=2 
                           000003  1648 	XSAVE=3
                           000004  1649 	VSIZE=4 ;locals size
      0009F1                       1650 itoa:
      0009F1                       1651 	_vars VSIZE
      008A2F 91 DE            [ 2]    1     sub sp,#VSIZE 
      008A31 01 51            [ 1] 1652 	clr (LEN,sp) ; string length  
      008A33 72 5C            [ 1] 1653 	clr (SIGN,sp)    ; sign
      008A35 00 02 72         [ 1] 1654 	ld a,base 
      008A38 5C 00            [ 1] 1655 	cp a,#10
      008A3A 02 0A            [ 1] 1656 	jrne 1$
                                   1657 	; base 10 string display with negative sign if bit 23==1
      008A3B 72 0F 00 0B 05   [ 2] 1658 	btjf acc24,#7,1$
      008A3B 81 01            [ 1] 1659 	cpl (SIGN,sp)
      008A3C CD 0A A6         [ 4] 1660 	call neg_acc24
      000A08                       1661 1$:
                                   1662 ; initialize string pointer 
      008A3C 72               [ 1] 1663 	clr (x)
      000A09                       1664 itoa_loop:
      008A3D 5F 00 0C         [ 1] 1665     ld a,base
      008A40 CF 00            [ 2] 1666 	ldw (XSAVE,sp),x 
      008A42 0D 72 0F         [ 4] 1667     call divu24_8 ; acc24/A 
      008A45 00 0D            [ 2] 1668 	ldw x,(XSAVE,sp)
      008A47 04 72            [ 1] 1669     add a,#'0  ; remainder of division
      008A49 53 00            [ 1] 1670     cp a,#'9+1
      008A4B 0C 02            [ 1] 1671     jrmi 2$
      008A4C AB 07            [ 1] 1672     add a,#7 
      000A1B                       1673 2$:	
      008A4C 96               [ 2] 1674 	decw x
      008A4D 52               [ 1] 1675     ld (x),a
      008A4E 11 CD            [ 1] 1676 	inc (LEN,sp)
                                   1677 	; if acc24==0 conversion done
      008A50 8A 71 6B         [ 1] 1678 	ld a,acc24
      008A53 01 A6 0F         [ 1] 1679 	or a,acc16
      008A56 C4 00 25         [ 1] 1680 	or a,acc8
      008A59 C7 00            [ 1] 1681     jrne itoa_loop
                                   1682 	;conversion done, next add '$' or '-' as required
      008A5B 25 7B 01         [ 1] 1683 	ld a,base 
      008A5E C1 00            [ 1] 1684 	cp a,#16
      008A60 25 24            [ 1] 1685 	jreq 8$
      008A62 08 A6            [ 1] 1686 	ld a,(SIGN,sp)
      008A64 20 5A            [ 1] 1687     jreq 10$
      008A66 F7 0C            [ 1] 1688     ld a,#'-
      008A68 01 20            [ 2] 1689 	jra 9$ 
      008A6A F1 24            [ 1] 1690 8$: ld a,#'$ 
      008A6B 5A               [ 2] 1691 9$: decw x
      008A6B CD               [ 1] 1692     ld (x),a
      008A6C 83 33            [ 1] 1693 	inc (LEN,sp)
      000A3F                       1694 10$:
      008A6E 5B 11            [ 1] 1695 	ld a,(LEN,sp)
      000A41                       1696 	_drop VSIZE
      008A70 81 04            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A71 81               [ 4] 1697 	ret
                                   1698 
                                   1699 ;-------------------------------------
                                   1700 ; divide uint24_t by uint8_t
                                   1701 ; used to convert uint24_t to string
                                   1702 ; input:
                                   1703 ;	acc24	dividend
                                   1704 ;   A 		divisor
                                   1705 ; output:
                                   1706 ;   acc24	quotient
                                   1707 ;   A		remainder
                                   1708 ;------------------------------------- 
                                   1709 ; offset  on sp of arguments and locals
                           000001  1710 	U8   = 1   ; divisor on stack
                           000001  1711 	VSIZE =1
      000A44                       1712 divu24_8:
      008A71 52               [ 2] 1713 	pushw x ; save x
      008A72 04               [ 1] 1714 	push a 
                                   1715 	; ld dividend UU:MM bytes in X
      008A73 0F 02 0F         [ 1] 1716 	ld a, acc24
      008A76 01               [ 1] 1717 	ld xh,a
      008A77 C6 00 0B         [ 1] 1718 	ld a,acc24+1
      008A7A A1               [ 1] 1719 	ld xl,a
      008A7B 0A 26            [ 1] 1720 	ld a,(U8,SP) ; divisor
      008A7D 0A               [ 2] 1721 	div x,a ; UU:MM/U8
      008A7E 72               [ 1] 1722 	push a  ;save remainder
      008A7F 0F               [ 1] 1723 	ld a,xh
      008A80 00 0C 05         [ 1] 1724 	ld acc24,a
      008A83 03               [ 1] 1725 	ld a,xl
      008A84 01 CD 8B         [ 1] 1726 	ld acc24+1,a
      008A87 26               [ 1] 1727 	pop a
      008A88 95               [ 1] 1728 	ld xh,a
      008A88 7F 00 0D         [ 1] 1729 	ld a,acc24+2
      008A89 97               [ 1] 1730 	ld xl,a
      008A89 C6 00            [ 1] 1731 	ld a,(U8,sp) ; divisor
      008A8B 0B               [ 2] 1732 	div x,a  ; R:LL/U8
      008A8C 1F 03            [ 1] 1733 	ld (U8,sp),a ; save remainder
      008A8E CD               [ 1] 1734 	ld a,xl
      008A8F 8A C4 1E         [ 1] 1735 	ld acc24+2,a
      008A92 03               [ 1] 1736 	pop a
      008A93 AB               [ 2] 1737 	popw x
      008A94 30               [ 4] 1738 	ret
                                   1739 
                                   1740 ;--------------------------------------
                                   1741 ; unsigned multiply uint24_t by uint8_t
                                   1742 ; use to convert numerical string to uint24_t
                                   1743 ; input:
                                   1744 ;	acc24	uint24_t 
                                   1745 ;   A		uint8_t
                                   1746 ; output:
                                   1747 ;   acc24   A*acc24
                                   1748 ;-------------------------------------
                                   1749 ; local variables offset  on sp
                           000003  1750 	U8   = 3   ; A pushed on stack
                           000002  1751 	OVFL = 2  ; multiplicaton overflow low byte
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           000001  1752 	OVFH = 1  ; multiplication overflow high byte
                           000003  1753 	VSIZE = 3
      000A6C                       1754 mulu24_8:
      008A95 A1               [ 2] 1755 	pushw x    ; save X
                                   1756 	; local variables
      008A96 3A               [ 1] 1757 	push a     ; U8
      008A97 2B               [ 1] 1758 	clrw x     ; initialize overflow to 0
      008A98 02               [ 2] 1759 	pushw x    ; multiplication overflow
                                   1760 ; multiply low byte.
      008A99 AB 07 0D         [ 1] 1761 	ld a,acc24+2
      008A9B 97               [ 1] 1762 	ld xl,a
      008A9B 5A F7            [ 1] 1763 	ld a,(U8,sp)
      008A9D 0C               [ 4] 1764 	mul x,a
      008A9E 02               [ 1] 1765 	ld a,xl
      008A9F C6 00 0C         [ 1] 1766 	ld acc24+2,a
      008AA2 CA               [ 1] 1767 	ld a, xh
      008AA3 00 0D            [ 1] 1768 	ld (OVFL,sp),a
                                   1769 ; multipy middle byte
      008AA5 CA 00 0E         [ 1] 1770 	ld a,acc24+1
      008AA8 26               [ 1] 1771 	ld xl,a
      008AA9 DF C6            [ 1] 1772 	ld a, (U8,sp)
      008AAB 00               [ 4] 1773 	mul x,a
                                   1774 ; add overflow to this partial product
      008AAC 0B A1 10         [ 2] 1775 	addw x,(OVFH,sp)
      008AAF 27               [ 1] 1776 	ld a,xl
      008AB0 08 7B 01         [ 1] 1777 	ld acc24+1,a
      008AB3 27               [ 1] 1778 	clr a
      008AB4 0A A6            [ 1] 1779 	adc a,#0
      008AB6 2D 20            [ 1] 1780 	ld (OVFH,sp),a
      008AB8 02               [ 1] 1781 	ld a,xh
      008AB9 A6 24            [ 1] 1782 	ld (OVFL,sp),a
                                   1783 ; multiply most signficant byte	
      008ABB 5A F7 0C         [ 1] 1784 	ld a, acc24
      008ABE 02               [ 1] 1785 	ld xl, a
      008ABF 7B 03            [ 1] 1786 	ld a, (U8,sp)
      008ABF 7B               [ 4] 1787 	mul x,a
      008AC0 02 5B 04         [ 2] 1788 	addw x, (OVFH,sp)
      008AC3 81               [ 1] 1789 	ld a, xl
      008AC4 C7 00 0B         [ 1] 1790 	ld acc24,a
      008AC4 89 88            [ 2] 1791     addw sp,#VSIZE
      008AC6 C6               [ 2] 1792 	popw x
      008AC7 00               [ 4] 1793 	ret
                                   1794 
                                   1795 ;------------------------------------
                                   1796 ;  two's complement acc24
                                   1797 ;  input:
                                   1798 ;		acc24 variable
                                   1799 ;  output:
                                   1800 ;		acc24 variable
                                   1801 ;-------------------------------------
      000AA6                       1802 neg_acc24:
      008AC8 0C 95 C6 00      [ 1] 1803 	cpl acc24+2
      008ACC 0D 97 7B 01      [ 1] 1804 	cpl acc24+1
      008AD0 62 88 9E C7      [ 1] 1805 	cpl acc24
      008AD4 00 0C            [ 1] 1806 	ld a,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008AD6 9F C7 00         [ 1] 1807 	add a,acc24+2
      008AD9 0D 84 95         [ 1] 1808 	ld acc24+2,a
      008ADC C6               [ 1] 1809 	clr a
      008ADD 00 0E 97         [ 1] 1810 	adc a,acc24+1
      008AE0 7B 01 62         [ 1] 1811 	ld acc24+1,a 
      008AE3 6B               [ 1] 1812 	clr a 
      008AE4 01 9F C7         [ 1] 1813 	adc a,acc24 
      008AE7 00 0E 84         [ 1] 1814 	ld acc24,a 
      008AEA 85               [ 4] 1815 	ret
                                   1816 
                                   1817 
                                   1818 ;------------------------------------
                                   1819 ; read a line of text from terminal
                                   1820 ; input:
                                   1821 ;	none
                                   1822 ; local variable on stack:
                                   1823 ;	LL  line length
                                   1824 ;   RXCHAR last received character 
                                   1825 ; output:
                                   1826 ;   text in tib  buffer
                                   1827 ;   count  line length 
                                   1828 ;------------------------------------
                                   1829 	; local variables
                           000001  1830 	LL_HB=1
                           000001  1831 	RXCHAR = 1 ; last char received
                           000002  1832 	LL = 2  ; accepted line length
                           000002  1833 	VSIZE=2 
      000AC9                       1834 readln:
      008AEB 81 00            [ 1] 1835 	push #0
      008AEC 4B 00            [ 1] 1836 	push #0  
      008AEC 89 88 5F 89      [ 2] 1837  	ldw y,#tib ; input buffer
      000AD1                       1838 readln_loop:
      008AF0 C6 00 0E         [ 4] 1839 	call getc
      008AF3 97 7B            [ 1] 1840 	ld (RXCHAR,sp),a
      008AF5 03 42            [ 1] 1841 	cp a,#CR
      008AF7 9F C7            [ 1] 1842 	jrne 1$
      008AF9 00 0E 9E         [ 2] 1843 	jp readln_quit
      008AFC 6B 02            [ 1] 1844 1$:	cp a,#LF 
      008AFE C6 00            [ 1] 1845 	jreq readln_quit
      008B00 0D 97            [ 1] 1846 	cp a,#BS
      008B02 7B 03            [ 1] 1847 	jreq del_back
      008B04 42 72            [ 1] 1848 	cp a,#CTRL_D
      008B06 FB 01            [ 1] 1849 	jreq del_ln
      008B08 9F C7            [ 1] 1850 	cp a,#CTRL_R 
      008B0A 00 0D            [ 1] 1851 	jreq reprint 
                                   1852 ;	cp a,#'[
                                   1853 ;	jreq ansi_seq
      000AED                       1854 final_test:
      008B0C 4F A9            [ 1] 1855 	cp a,#SPACE
      008B0E 00 6B            [ 1] 1856 	jrpl accept_char
      008B10 01 9E            [ 2] 1857 	jra readln_loop
      000AF3                       1858 ansi_seq:
                                   1859 ;	call getc
                                   1860 ;	cp a,#'C 
                                   1861 ;	jreq rigth_arrow
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1862 ;	cp a,#'D 
                                   1863 ;	jreq left_arrow 
                                   1864 ;	jra final_test
      000AF3                       1865 right_arrow:
                                   1866 ;	ld a,#BSP 
                                   1867 ;	call putc 
                                   1868 ;	jra realn_loop 
      000AF3                       1869 left_arrow:
                                   1870 ;	jra readln_loop
      000AF3                       1871 reprint: 
      008B12 6B 02            [ 1] 1872 	tnz (LL,sp)
      008B14 C6 00            [ 1] 1873 	jrne readln_loop
      008B16 0C 97 7B         [ 2] 1874 	ldw x,#tib 
      008B19 03 42 72         [ 4] 1875 	call strlen 
      008B1C FB 01 9F C7      [ 2] 1876 	ldw y,#tib 
      008B20 00               [ 1] 1877 	ld a,xl
      008B21 0C 5B            [ 1] 1878 	jreq readln_loop
      008B23 03 85            [ 1] 1879 	ld (LL,sp),a 
      008B25 81 16 90         [ 2] 1880 	ldw x,#tib 
      008B26 CD 02 B3         [ 4] 1881 	call puts
      008B26 72 53            [ 1] 1882 	clr (LL_HB,sp)
      008B28 00 0E 72         [ 2] 1883 	addw y,(LL_HB,sp)
      008B2B 53 00            [ 2] 1884 	jra readln_loop 
      000B13                       1885 del_ln:
      008B2D 0D 72            [ 1] 1886 	ld a,(LL,sp)
      008B2F 53 00 0C         [ 4] 1887 	call delete
      008B32 A6 01 CB 00      [ 2] 1888 	ldw y,#tib
      008B36 0E C7            [ 1] 1889 	clr (y)
      008B38 00 0E            [ 1] 1890 	clr (LL,sp)
      008B3A 4F C9            [ 2] 1891 	jra readln_loop
      000B22                       1892 del_back:
      008B3C 00 0D            [ 1] 1893     tnz (LL,sp)
      008B3E C7 00            [ 1] 1894     jreq readln_loop
      008B40 0D 4F            [ 1] 1895     dec (LL,sp)
      008B42 C9 00            [ 2] 1896     decw y
      008B44 0C C7            [ 1] 1897     clr  (y)
      008B46 00 0C 81         [ 4] 1898     call bksp 
      008B49 20 A0            [ 2] 1899     jra readln_loop	
      000B31                       1900 accept_char:
      008B49 4B 00            [ 1] 1901 	ld a,#TIB_SIZE-1
      008B4B 4B 00            [ 1] 1902 	cp a, (LL,sp)
      008B4D 90 AE            [ 1] 1903 	jreq readln_loop
      008B4F 16 90            [ 1] 1904 	ld a,(RXCHAR,sp)
      008B51 90 F7            [ 1] 1905 	ld (y),a
      008B51 CD 83            [ 1] 1906 	inc (LL,sp)
      008B53 29 6B            [ 2] 1907 	incw y
      008B55 01 A1            [ 1] 1908 	clr (y)
      008B57 0D 26 03         [ 4] 1909 	call putc 
      008B5A CC 8B            [ 2] 1910 	jra readln_loop
      000B46                       1911 readln_quit:
      008B5C C6 A1            [ 1] 1912 	clr (y)
      008B5E 0A 27            [ 1] 1913 	ld a,(LL,sp)
      008B60 65 A1 08         [ 1] 1914 	ld count,a 
      008B63 27 3D            [ 1] 1915 	ld a,#CR
      008B65 A1 04 27         [ 4] 1916 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      000B52                       1917 	_drop VSIZE 
      008B68 2A A1            [ 2]    1     addw sp,#VSIZE 
      008B6A 12               [ 4] 1918 	ret
                                   1919 
                                   1920 
                                   1921 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1922 ;; compiler routines        ;;
                                   1923 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1924 ;------------------------------------
                                   1925 ; parse quoted string 
                                   1926 ; input:
                                   1927 ;   Y 	pointer to tib 
                                   1928 ;   X   pointer to output buffer 
                                   1929 ; output:
                                   1930 ;	buffer   parsed string
                                   1931 ;------------------------------------
                           000001  1932 	PREV = 1
                           000002  1933 	CURR =2
                           000002  1934 	VSIZE=2
      000B55                       1935 parse_quote: 
      000B55                       1936 	_vars VSIZE 
      008B6B 27 06            [ 2]    1     sub sp,#VSIZE 
      008B6D 4F               [ 1] 1937 	clr a
      008B6D A1 20            [ 1] 1938 1$:	ld (PREV,sp),a 
      000B5A                       1939 2$:	
      008B6F 2A 40 20         [ 4] 1940 	ld a,([in.w],y)
      008B72 DE 24            [ 1] 1941 	jreq 6$
      008B73 72 5C 00 01      [ 1] 1942 	inc in 
      008B73 6B 02            [ 1] 1943 	ld (CURR,sp),a 
      008B73 A6 5C            [ 1] 1944 	ld a,#'\
      008B73 11 01            [ 1] 1945 	cp a, (PREV,sp)
      008B73 0D 02            [ 1] 1946 	jrne 3$
      008B75 26 DA            [ 1] 1947 	clr (PREV,sp)
      008B77 AE 16            [ 1] 1948 	ld a,(CURR,sp)
      008B79 90 CD            [ 4] 1949 	callr convert_escape
      008B7B 84               [ 1] 1950 	ld (x),a 
      008B7C 12               [ 2] 1951 	incw x 
      008B7D 90 AE            [ 2] 1952 	jra 2$
      000B75                       1953 3$:
      008B7F 16 90            [ 1] 1954 	ld a,(CURR,sp)
      008B81 9F 27            [ 1] 1955 	cp a,#'\'
      008B83 CD 6B            [ 1] 1956 	jreq 1$
      008B85 02 AE            [ 1] 1957 	cp a,#'"
      008B87 16 90            [ 1] 1958 	jreq 6$ 
      008B89 CD               [ 1] 1959 	ld (x),a 
      008B8A 83               [ 2] 1960 	incw x 
      008B8B 33 0F            [ 2] 1961 	jra 2$
      000B83                       1962 6$:
      008B8D 01               [ 1] 1963 	clr (x)
      008B8E 72               [ 2] 1964 	incw x 
      008B8F F9 01            [ 1] 1965 	ldw y,x 
      008B91 20               [ 1] 1966 	clrw x 
      008B92 BE 02            [ 1] 1967 	ld a,#TK_QSTR  
      008B93                       1968 	_drop VSIZE
      008B93 7B 02            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008B95 CD               [ 4] 1969 	ret 
                                   1970 
                                   1971 ;---------------------------------------
                                   1972 ; called by parse_quote
                                   1973 ; subtitute escaped character 
                                   1974 ; by their ASCII value .
                                   1975 ; input:
                                   1976 ;   A  character following '\'
                                   1977 ; output:
                                   1978 ;   A  substitued char or same if not valid.
                                   1979 ;---------------------------------------
      000B8D                       1980 convert_escape:
      008B96 83               [ 2] 1981 	pushw x 
      008B97 4D 90 AE         [ 2] 1982 	ldw x,#escaped 
      008B9A 16               [ 1] 1983 1$:	cp a,(x)
      008B9B 90 90            [ 1] 1984 	jreq 2$
      008B9D 7F               [ 1] 1985 	tnz (x)
      008B9E 0F 02            [ 1] 1986 	jreq 3$
      008BA0 20               [ 2] 1987 	incw x 
      008BA1 AF F7            [ 2] 1988 	jra 1$
      008BA2 1D 0B A2         [ 2] 1989 2$: subw x,#escaped 
      008BA2 0D               [ 1] 1990 	ld a,xl 
      008BA3 02 27            [ 1] 1991 	add a,#7
      008BA5 AB               [ 2] 1992 3$:	popw x 
      008BA6 0A               [ 4] 1993 	ret 
                                   1994 
      008BA7 02 90 5A 90 7F CD 83  1995 escaped: .asciz "abtnvfr"
             3D
                                   1996 
                                   1997 ;-------------------------
                                   1998 ; integer parser 
                                   1999 ; input:
                                   2000 ;   X 		point to output buffer  
                                   2001 ;   Y 		point to tib 
                                   2002 ;   A 	    first digit|'$' 
                                   2003 ; output:  
                                   2004 ;   X 		integer 
                                   2005 ;   A 		TK_INTGR
                                   2006 ;   acc24   24 bits integer 
                                   2007 ;-------------------------
                           000001  2008 	BASE=1
                           000002  2009 	TCHAR=2 
                           000003  2010 	XSAVE=3
                           000004  2011 	VSIZE=4 
      000BAA                       2012 parse_integer: ; { -- n }
      008BAF 20               [ 2] 2013 	pushw x 	
      008BB0 A0 00            [ 1] 2014 	push #0 ; TCHAR
      008BB1 4B 0A            [ 1] 2015 	push #10 ; BASE=10
      008BB1 A6 4F            [ 1] 2016 	cp a,#'$
      008BB3 11 02            [ 1] 2017 	jrne 2$ 
      000BB3                       2018     _drop #1
      008BB5 27 9A            [ 2]    1     addw sp,##1 
      008BB7 7B 01            [ 1] 2019 	push #16  ; BASE=16
      008BB9 90               [ 1] 2020 2$:	ld (x),a 
      008BBA F7               [ 2] 2021 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BBB 0C 02 90         [ 4] 2022 	ld a,([in.w],y)
      008BBE 5C 90 7F CD      [ 1] 2023 	inc in 
      008BC2 83 20 20         [ 4] 2024 	call to_upper 
      008BC5 8B 02            [ 1] 2025 	ld (TCHAR,sp),a 
      008BC6 CD 05 7C         [ 4] 2026 	call is_digit 
      008BC6 90 7F            [ 1] 2027 	jrc 2$
      008BC8 7B 02            [ 1] 2028 	ld a,#16 
      008BCA C7 00            [ 1] 2029 	cp a,(BASE,sp)
      008BCC 04 A6            [ 1] 2030 	jrne 3$ 
      008BCE 0D CD            [ 1] 2031 	ld a,(TCHAR,sp)
      008BD0 83 20            [ 1] 2032 	cp a,#'A 
      008BD2 5B 02            [ 1] 2033 	jrmi 3$ 
      008BD4 81 47            [ 1] 2034 	cp a,#'G 
      008BD5 2B DD            [ 1] 2035 	jrmi 2$ 
      008BD5 52 02 4F 6B      [ 1] 2036 3$: dec in 	
      008BD9 01               [ 1] 2037     clr (x)
      008BDA 1E 03            [ 2] 2038 	ldw x,(XSAVE,sp)
      008BDA 91 D6 01         [ 4] 2039 	call atoi24
      008BDD 27 24            [ 1] 2040 	ldw y,x 
      008BDF 72 5C 00         [ 2] 2041 	ldw x,acc16 
      008BE2 02 6B            [ 1] 2042 	ld a,#TK_INTGR
      008BE4 02 A6            [ 2] 2043 	ldw (y),x 
      008BE6 5C 11 01 26      [ 2] 2044 	addw y,#2
      000BF1                       2045 	_drop VSIZE  
      008BEA 0A 0F            [ 2]    1     addw sp,#VSIZE 
      008BEC 01               [ 4] 2046 	ret 	
                                   2047 
                                   2048 ;-------------------------
                                   2049 ; binary integer parser
                                   2050 ; build integer in acc24  
                                   2051 ; input:
                                   2052 ;   X 		point to output buffer  
                                   2053 ;   Y 		point to tib 
                                   2054 ;   A 	    '&' 
                                   2055 ; output:  
                                   2056 ;   buffer  TK_INTGR integer  
                                   2057 ;   X 		int16 
                                   2058 ;   A 		TK_INTGR
                                   2059 ;   acc24    int24 
                                   2060 ;-------------------------
                           000001  2061 	BINARY=1 ; 24 bits integer 
                           000003  2062 	VSIZE=3
      000BF4                       2063 parse_binary: ; { -- n }
      008BED 7B 02            [ 1] 2064 	push #0
      008BEF AD 1C            [ 1] 2065 	push #0
      008BF1 F7 5C            [ 1] 2066 	push #0
      000BFA                       2067 2$:	
      008BF3 20 E5 00         [ 4] 2068 	ld a,([in.w],y)
      008BF5 72 5C 00 01      [ 1] 2069 	inc in 
      008BF5 7B 02            [ 1] 2070 	cp a,#'0 
      008BF7 A1 5C            [ 1] 2071 	jreq 3$
      008BF9 27 DD            [ 1] 2072 	cp a,#'1 
      008BFB A1 22            [ 1] 2073 	jreq 3$ 
      008BFD 27 04            [ 2] 2074 	jra bin_exit 
      008BFF F7 5C            [ 1] 2075 3$: sub a,#'0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C01 20               [ 1] 2076 	rrc a
      008C02 D7 03            [ 1] 2077 	rlc (BINARY+2,sp) 
      008C03 09 02            [ 1] 2078 	rlc (BINARY+1,sp)
      008C03 7F 5C            [ 1] 2079 	rlc (BINARY,sp) 
      008C05 90 93            [ 2] 2080 	jra 2$  
      000C16                       2081 bin_exit:
      008C07 5F A6 02 5B      [ 1] 2082 	dec in 
      008C0B 02 81            [ 1] 2083 	ldw y,x
      008C0D 7B 01            [ 1] 2084 	ld a,(BINARY,sp)
      008C0D 89 AE 8C         [ 1] 2085 	ld acc24,a 
      008C10 22 F1            [ 2] 2086 	ldw x,(BINARY+1,sp)
      008C12 27 06 7D         [ 2] 2087 	ldw acc16,x
      008C15 27 09            [ 2] 2088 	ldw (y),x 
      008C17 5C 20 F7 1D      [ 2] 2089 	addw y,#2  
      008C1B 8C 22            [ 1] 2090 	ld a,#TK_INTGR 	
      000C2E                       2091 	_drop VSIZE 
      008C1D 9F AB            [ 2]    1     addw sp,#VSIZE 
      008C1F 07               [ 4] 2092 	ret
                                   2093 
                                   2094 ;---------------------------
                                   2095 ;  token begin with a letter,
                                   2096 ;  is keyword or variable. 	
                                   2097 ; input:
                                   2098 ;   X 		point to pad 
                                   2099 ;   Y 		point to text
                                   2100 ;   A 	    first letter  
                                   2101 ; output:
                                   2102 ;   X		exec_addr|var_addr 
                                   2103 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   2104 ;   pad 	keyword|var_name  
                                   2105 ;--------------------------  
                           000001  2106 	XFIRST=1
                           000002  2107 	VSIZE=2
      000C31                       2108 parse_keyword: 
      008C20 85               [ 2] 2109 	pushw x 
      000C32                       2110 kw_loop:	
      008C21 81 61 62         [ 4] 2111 	call to_upper 
      008C24 74               [ 1] 2112 	ld (x),a 
      008C25 6E               [ 2] 2113 	incw x 
      008C26 76 66 72         [ 4] 2114 	ld a,([in.w],y)
      008C29 00 5C 00 01      [ 1] 2115 	inc in 
      008C2A CD 05 6B         [ 4] 2116 	call is_alpha 
      008C2A 89 4B            [ 1] 2117 	jrc kw_loop
      008C2C 00 4B 0A A1      [ 1] 2118 	dec in   
      008C30 24               [ 1] 2119 1$: clr (x)
      008C31 26 04            [ 2] 2120 	ldw x,(XFIRST,sp) 
      008C33 5B 01            [ 1] 2121 	ld a,(1,x)
      008C35 4B 10            [ 1] 2122 	jrne 2$
                                   2123 ; one letter variable name 
      008C37 F7               [ 1] 2124 	ld a,(x) 
      008C38 5C 91            [ 1] 2125 	sub a,#'A 
      008C3A D6               [ 1] 2126 	sll a 
      008C3B 01               [ 1] 2127 	push a 
      008C3C 72 5C            [ 1] 2128 	push #0
      008C3E 00 02 CD         [ 2] 2129 	ldw x,#vars 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C41 8E BD 6B         [ 2] 2130 	addw x,(1,sp) ; X=var address 
      000C5B                       2131 	_drop 2 
      008C44 02 CD            [ 2]    1     addw sp,#2 
      008C46 85 FC            [ 1] 2132 	ld a,#TK_VAR 
      008C48 25 ED            [ 2] 2133 	jra 4$ 
      000C61                       2134 2$: ; check for keyword, otherwise syntax error.
      000C61                       2135 	_ldx_dict kword_dict ; dictionary entry point
      008C4A A6 10 11         [ 2]    1     ldw x,#kword_dict+2
      008C4D 01 26            [ 2] 2136 	ldw y,(XFIRST,sp) ; name to search for
      008C4F 0A 7B 02         [ 4] 2137 	call search_dict
      008C52 A1               [ 1] 2138 	tnz a
      008C53 41 2B            [ 1] 2139 	jrne 4$ 
      008C55 04 A1 47         [ 2] 2140 	jp syntax_error
      000C6F                       2141 4$:	
      008C58 2B DD            [ 2] 2142 	ldw y,(XFIRST,sp)
      008C5A 72 5A            [ 1] 2143 	ld (y),a 
      008C5C 00 02            [ 2] 2144 	incw y 
      008C5E 7F 1E            [ 2] 2145 	ldw (y),x
      008C60 03 CD 8E C9      [ 2] 2146 	addw y,#2  
      000C7B                       2147 	_drop VSIZE 
      008C64 90 93            [ 2]    1     addw sp,#VSIZE 
      008C66 CE               [ 4] 2148 	ret  	
                                   2149 
                                   2150 
                                   2151 ;------------------------------------
                                   2152 ; scan text for next token
                                   2153 ; input: 
                                   2154 ;	X 		pointer to buffer where 
                                   2155 ;	        token id and value are copied 
                                   2156 ; use:
                                   2157 ;	Y   pointer to text in tib 
                                   2158 ; output:
                                   2159 ;   A       token attribute 
                                   2160 ;   X 		token value
                                   2161 ;   Y       updated position in output buffer   
                                   2162 ;------------------------------------
                                   2163 	; use to check special character 
                                   2164 	.macro _case c t  
                                   2165 	ld a,#c 
                                   2166 	cp a,(TCHAR,sp) 
                                   2167 	jrne t
                                   2168 	.endm 
                                   2169 
                           000001  2170 	TCHAR=1
                           000002  2171 	ATTRIB=2
                           000002  2172 	VSIZE=2
      000C7E                       2173 get_token: 
      000C7E                       2174 	_vars VSIZE
      008C67 00 0D            [ 2]    1     sub sp,#VSIZE 
                                   2175 ;	ld a,in 
                                   2176 ;	sub a,count
                                   2177 ;   jrmi 0$
                                   2178 ;	clr a 
                                   2179 ;	ret 
      000C80                       2180 0$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008C69 A6 84 90 FF      [ 2] 2181 	ldw y,#tib    	
      008C6D 72 A9            [ 1] 2182 	ld a,#SPACE
      008C6F 00 02 5B         [ 4] 2183 	call skip
      008C72 04 81 01 00 02   [ 1] 2184 	mov in.saved,in 
      008C74 91 D6 00         [ 4] 2185 	ld a,([in.w],y)
      008C74 4B 00            [ 1] 2186 	jrne 1$
      008C76 4B 00            [ 1] 2187 	ldw y,x 
      008C78 4B 00 3A         [ 2] 2188 	jp token_exit ; end of line 
      008C7A 72 5C 00 01      [ 1] 2189 1$:	inc in 
      008C7A 91 D6 01         [ 4] 2190 	call to_upper 
      008C7D 72 5C            [ 1] 2191 	ld (TCHAR,sp),a 
                                   2192 ; check for quoted string
      000CA1                       2193 str_tst:  	
      000CA1                       2194 	_case '"' nbr_tst
      008C7F 00 02            [ 1]    1 	ld a,#'"' 
      008C81 A1 30            [ 1]    2 	cp a,(TCHAR,sp) 
      008C83 27 06            [ 1]    3 	jrne nbr_tst
      008C85 A1 31            [ 1] 2195 	ld a,#TK_QSTR
      008C87 27               [ 1] 2196 	ld (x),a 
      008C88 02               [ 2] 2197 	incw x 
      008C89 20 0B A0         [ 4] 2198 	call parse_quote
      008C8C 30 46 09         [ 2] 2199 	jp token_exit
      000CB1                       2200 nbr_tst:
                                   2201 ; check for hexadecimal number 
      008C8F 03 09            [ 1] 2202 	ld a,#'$'
      008C91 02 09            [ 1] 2203 	cp a,(TCHAR,sp) 
      008C93 01 20            [ 1] 2204 	jreq 1$
                                   2205 ;check for binary number 
      008C95 E4 26            [ 1] 2206 	ld a,#'&
      008C96 11 01            [ 1] 2207 	cp a,(TCHAR,sp)
      008C96 72 5A            [ 1] 2208 	jrne 0$
      008C98 00 02            [ 1] 2209 	ld a,#TK_INTGR
      008C9A 90               [ 1] 2210 	ld (x),a 
      008C9B 93               [ 2] 2211 	incw x 
      008C9C 7B 01 C7         [ 4] 2212 	call parse_binary ; expect binary integer 
      008C9F 00 0C 1E         [ 2] 2213 	jp token_exit 
                                   2214 ; check for decimal number 	
      008CA2 02 CF            [ 1] 2215 0$:	ld a,(TCHAR,sp)
      008CA4 00 0D 90         [ 4] 2216 	call is_digit
      008CA7 FF 72            [ 1] 2217 	jrnc 3$
      008CA9 A9 00            [ 1] 2218 1$:	ld a,#TK_INTGR 
      008CAB 02               [ 1] 2219 	ld (x),a 
      008CAC A6               [ 2] 2220 	incw x 
      008CAD 84 5B            [ 1] 2221 	ld a,(TCHAR,sp)
      008CAF 03 81 AA         [ 4] 2222 	call parse_integer 
      008CB1 CC 0E 3A         [ 2] 2223 	jp token_exit 
      000CDA                       2224 3$: 
      000CDA                       2225 	_case '(' bkslsh_tst 
      008CB1 89 28            [ 1]    1 	ld a,#'(' 
      008CB2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CB2 CD 8E            [ 1]    3 	jrne bkslsh_tst
      008CB4 BD F7            [ 1] 2226 	ld a,#TK_LPAREN
      008CB6 5C 91 D6         [ 2] 2227 	jp token_char   	
      000CE5                       2228 bkslsh_tst: ; character token 
      000CE5                       2229 	_case '\',rparnt_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008CB9 01 72            [ 1]    1 	ld a,#'\' 
      008CBB 5C 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008CBD 02 CD            [ 1]    3 	jrne rparnt_tst
      008CBF 85 EB            [ 1] 2230 	ld a,#TK_CHAR 
      008CC1 25               [ 1] 2231 	ld (x),a 
      008CC2 EF               [ 2] 2232 	incw x 
      008CC3 72 5A 00         [ 4] 2233 	ld a,([in.w],y)
      008CC6 02               [ 1] 2234 	ld (x),a 
      008CC7 7F               [ 2] 2235 	incw x
      008CC8 1E 01            [ 1] 2236 	ldw y,x 	 
      008CCA E6 01 26 13      [ 1] 2237 	inc in  
      008CCE F6               [ 1] 2238 	clrw x 
      008CCF A0               [ 1] 2239 	ld xl,a 
      008CD0 41 48            [ 1] 2240 	ld a,#TK_CHAR 
      008CD2 88 4B 00         [ 2] 2241 	jp token_exit 
      000D01                       2242 rparnt_tst:		
      000D01                       2243 	_case ')' colon_tst 
      008CD5 AE 00            [ 1]    1 	ld a,#')' 
      008CD7 27 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008CD9 FB 01            [ 1]    3 	jrne colon_tst
      008CDB 5B 02            [ 1] 2244 	ld a,#TK_RPAREN 
      008CDD A6 85 20         [ 2] 2245 	jp token_char
      000D0C                       2246 colon_tst:
      000D0C                       2247 	_case ':' comma_tst 
      008CE0 0E 3A            [ 1]    1 	ld a,#':' 
      008CE1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CE1 AE A7            [ 1]    3 	jrne comma_tst
      008CE3 3E 16            [ 1] 2248 	ld a,#TK_COLON 
      008CE5 01 CD 90         [ 2] 2249 	jp token_char  
      000D17                       2250 comma_tst:
      000D17                       2251 	_case COMMA sharp_tst 
      008CE8 A5 4D            [ 1]    1 	ld a,#COMMA 
      008CEA 26 03            [ 1]    2 	cp a,(TCHAR,sp) 
      008CEC CC 88            [ 1]    3 	jrne sharp_tst
      008CEE F5 09            [ 1] 2252 	ld a,#TK_COMMA
      008CEF CC 0E 36         [ 2] 2253 	jp token_char
      000D22                       2254 sharp_tst:
      000D22                       2255 	_case SHARP dash_tst 
      008CEF 16 01            [ 1]    1 	ld a,#SHARP 
      008CF1 90 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008CF3 90 5C            [ 1]    3 	jrne dash_tst
      008CF5 90 FF            [ 1] 2256 	ld a,#TK_SHARP
      008CF7 72 A9 00         [ 2] 2257 	jp token_char  	 	 
      000D2D                       2258 dash_tst: 	
      000D2D                       2259 	_case '-' at_tst 
      008CFA 02 5B            [ 1]    1 	ld a,#'-' 
      008CFC 02 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008CFE 26 05            [ 1]    3 	jrne at_tst
      008CFE 52 02            [ 1] 2260 	ld a,#TK_MINUS  
      008D00 CC 0E 36         [ 2] 2261 	jp token_char 
      000D38                       2262 at_tst:
      000D38                       2263 	_case '@' qmark_tst 
      008D00 90 AE            [ 1]    1 	ld a,#'@' 
      008D02 16 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008D04 A6 20            [ 1]    3 	jrne qmark_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D06 CD 8F            [ 1] 2264 	ld a,#TK_ARRAY 
      008D08 33 55 00         [ 2] 2265 	jp token_char
      000D43                       2266 qmark_tst:
      000D43                       2267 	_case '?' tick_tst 
      008D0B 02 00            [ 1]    1 	ld a,#'?' 
      008D0D 03 91            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0F D6 01            [ 1]    3 	jrne tick_tst
      008D11 26 05            [ 1] 2268 	ld a,#TK_CMD  
      008D13 90               [ 1] 2269 	ld (x),a 
      008D14 93               [ 2] 2270 	incw x 
      008D15 CC 8E            [ 1] 2271 	ldw y,x 
      008D17 BA 72 5C         [ 2] 2272 	ldw x,#print 
      008D1A 00 02            [ 2] 2273 	ldw (y),x 
      008D1C CD 8E BD 6B      [ 2] 2274 	addw y,#2
      008D20 01 0E 3A         [ 2] 2275 	jp token_exit
      008D21                       2276 tick_tst: ; comment 
      000D5B                       2277 	_case TICK plus_tst 
      008D21 A6 22            [ 1]    1 	ld a,#TICK 
      008D23 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D25 26 0A            [ 1]    3 	jrne plus_tst
      008D27 A6 02            [ 1] 2278 	ld a,#TK_CMD
      008D29 F7               [ 1] 2279 	ld (x),a 
      008D2A 5C               [ 2] 2280 	incw x
      008D2B CD 8B D5 CC      [ 2] 2281 	ldw y,#remark
      008D2F 8E               [ 2] 2282 	ldw (x),y 
      008D30 BA 00 02         [ 2] 2283 	addw x,#2  
      008D31                       2284 copy_comment:
      008D31 A6 24 11 01      [ 2] 2285 	ldw y,#tib 
      008D35 27 17 A6 26      [ 2] 2286 	addw y,in.w
      008D39 11 01            [ 2] 2287 	pushw y
      008D3B 26 0A A6         [ 4] 2288 	call strcpy
      008D3E 84 F7 5C         [ 2] 2289     subw y,(1,sp)
      008D41 CD 8C            [ 1] 2290 	ld a,yl 
      008D43 74 CC 8E         [ 1] 2291 	add a,in
      008D46 BA 7B 01         [ 1] 2292 	ld in,a 
      008D49 CD 85            [ 2] 2293 	ldw (1,sp),x
      008D4B FC 24 0C         [ 2] 2294 	addw y,(1,sp)
      008D4E A6 84            [ 2] 2295 	incw y 
      000D8C                       2296 	_drop 2 
      008D50 F7 5C            [ 2]    1     addw sp,#2 
      008D52 7B 01 CD         [ 2] 2297 	ldw x,#remark 
      008D55 8C 2A            [ 1] 2298 	ld a,#TK_CMD 
      008D57 CC 8E BA         [ 2] 2299 	jp token_exit 
      008D5A                       2300 plus_tst:
      000D96                       2301 	_case '+' star_tst 
      008D5A A6 28            [ 1]    1 	ld a,#'+' 
      008D5C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D5E 26 05            [ 1]    3 	jrne star_tst
      008D60 A6 07            [ 1] 2302 	ld a,#TK_PLUS  
      008D62 CC 8E B6         [ 2] 2303 	jp token_char 
      008D65                       2304 star_tst:
      000DA1                       2305 	_case '*' slash_tst 
      008D65 A6 5C            [ 1]    1 	ld a,#'*' 
      008D67 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D69 26 16            [ 1]    3 	jrne slash_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008D6B A6 03            [ 1] 2306 	ld a,#TK_MULT 
      008D6D F7 5C 91         [ 2] 2307 	jp token_char 
      000DAC                       2308 slash_tst: 
      000DAC                       2309 	_case '/' prcnt_tst 
      008D70 D6 01            [ 1]    1 	ld a,#'/' 
      008D72 F7 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008D74 90 93            [ 1]    3 	jrne prcnt_tst
      008D76 72 5C            [ 1] 2310 	ld a,#TK_DIV 
      008D78 00 02 5F         [ 2] 2311 	jp token_char 
      000DB7                       2312 prcnt_tst:
      000DB7                       2313 	_case '%' eql_tst 
      008D7B 97 A6            [ 1]    1 	ld a,#'%' 
      008D7D 03 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008D7F 8E BA            [ 1]    3 	jrne eql_tst
      008D81 A6 22            [ 1] 2314 	ld a,#TK_MOD
      008D81 A6 29 11         [ 2] 2315 	jp token_char  
                                   2316 ; 1 or 2 character tokens 	
      000DC2                       2317 eql_tst:
      000DC2                       2318 	_case '=' gt_tst 		
      008D84 01 26            [ 1]    1 	ld a,#'=' 
      008D86 05 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D88 08 CC            [ 1]    3 	jrne gt_tst
      008D8A 8E B6            [ 1] 2319 	ld a,#TK_EQUAL
      008D8C CC 0E 36         [ 2] 2320 	jp token_char 
      000DCD                       2321 gt_tst:
      000DCD                       2322 	_case '>' lt_tst 
      008D8C A6 3A            [ 1]    1 	ld a,#'>' 
      008D8E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D90 26 05            [ 1]    3 	jrne lt_tst
      008D92 A6 01            [ 1] 2323 	ld a,#TK_GT 
      008D94 CC 8E            [ 1] 2324 	ld (ATTRIB,sp),a 
      008D96 B6 5C 00 01      [ 1] 2325 	inc in 
      008D97 91 D6 00         [ 4] 2326 	ld a,([in.w],y)
      008D97 A6 2C            [ 1] 2327 	cp a,#'=
      008D99 11 01            [ 1] 2328 	jrne 1$
      008D9B 26 05            [ 1] 2329 	ld a,#TK_GE 
      008D9D A6 09            [ 2] 2330 	jra token_char  
      008D9F CC 8E            [ 1] 2331 1$: cp a,#'<
      008DA1 B6 04            [ 1] 2332 	jrne 2$
      008DA2 A6 35            [ 1] 2333 	ld a,#TK_NE 
      008DA2 A6 23            [ 2] 2334 	jra token_char 
      008DA4 11 01 26 05      [ 1] 2335 2$: dec in
      008DA8 A6 0A            [ 1] 2336 	ld a,(ATTRIB,sp)
      008DAA CC 8E            [ 2] 2337 	jra token_char 	 
      000DF6                       2338 lt_tst:
      000DF6                       2339 	_case '<' other
      008DAC B6 3C            [ 1]    1 	ld a,#'<' 
      008DAD 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DAD A6 2D            [ 1]    3 	jrne other
      008DAF 11 01            [ 1] 2340 	ld a,#TK_LT 
      008DB1 26 05            [ 1] 2341 	ld (ATTRIB,sp),a 
      008DB3 A6 11 CC 8E      [ 1] 2342 	inc in 
      008DB7 B6 D6 00         [ 4] 2343 	ld a,([in.w],y)
      008DB8 A1 3D            [ 1] 2344 	cp a,#'=
      008DB8 A6 40            [ 1] 2345 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DBA 11 01            [ 1] 2346 	ld a,#TK_LE 
      008DBC 26 05            [ 2] 2347 	jra token_char 
      008DBE A6 06            [ 1] 2348 1$: cp a,#'>
      008DC0 CC 8E            [ 1] 2349 	jrne 2$
      008DC2 B6 35            [ 1] 2350 	ld a,#TK_NE 
      008DC3 20 1F            [ 2] 2351 	jra token_char 
      008DC3 A6 3F 11 01      [ 1] 2352 2$: dec in 
      008DC7 26 12            [ 1] 2353 	ld a,(ATTRIB,sp)
      008DC9 A6 80            [ 2] 2354 	jra token_char 	
      000E1F                       2355 other: ; not a special character 	 
      008DCB F7 5C            [ 1] 2356 	ld a,(TCHAR,sp)
      008DCD 90 93 AE         [ 4] 2357 	call is_alpha 
      008DD0 95 46            [ 1] 2358 	jrc 30$ 
      008DD2 90 FF 72         [ 2] 2359 	jp syntax_error 
      000E29                       2360 30$: 
      008DD5 A9 00 02         [ 4] 2361 	call parse_keyword
      008DD8 CC 8E BA         [ 2] 2362 	cpw x,#remark 
      008DDB 26 09            [ 1] 2363 	jrne token_exit 
      008DDB A6 27            [ 1] 2364 	ldw y,x 
      008DDD 11 01 26         [ 2] 2365 	jp copy_comment 
      000E36                       2366 token_char:
      008DE0 35               [ 1] 2367 	ld (x),a 
      008DE1 A6               [ 2] 2368 	incw x
      008DE2 80 F7            [ 1] 2369 	ldw y,x 
      000E3A                       2370 token_exit:
      000E3A                       2371 	_drop VSIZE 
      008DE4 5C 90            [ 2]    1     addw sp,#VSIZE 
      008DE6 AE               [ 4] 2372 	ret
                                   2373 
                                   2374 
                                   2375 ;------------------------------------
                                   2376 ; convert alpha to uppercase
                                   2377 ; input:
                                   2378 ;    a  character to convert
                                   2379 ; output:
                                   2380 ;    a  uppercase character
                                   2381 ;------------------------------------
      000E3D                       2382 to_upper::
      008DE7 96 43            [ 1] 2383 	cp a,#'a
      008DE9 FF 1C            [ 1] 2384 	jrpl 1$
      008DEB 00               [ 4] 2385 0$:	ret
      008DEC 02 7A            [ 1] 2386 1$: cp a,#'z	
      008DED 22 FB            [ 1] 2387 	jrugt 0$
      008DED 90 AE            [ 1] 2388 	sub a,#32
      008DEF 16               [ 4] 2389 	ret
                                   2390 	
                                   2391 ;------------------------------------
                                   2392 ; convert pad content in integer
                                   2393 ; input:
                                   2394 ;    x		.asciz to convert
                                   2395 ; output:
                                   2396 ;    acc24      int24_t
                                   2397 ;------------------------------------
                                   2398 	; local variables
                           000001  2399 	SIGN=1 ; 1 byte, 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                           000002  2400 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2401 	TEMP=3 ; 1 byte, temporary storage
                           000003  2402 	VSIZE=3 ; 3 bytes reserved for local storage
      000E49                       2403 atoi24:
      008DF0 90               [ 2] 2404 	pushw x 
      000E4A                       2405 	_vars VSIZE
      008DF1 72 B9            [ 2]    1     sub sp,#VSIZE 
                                   2406 	; acc24=0 
      008DF3 00 01 90 89      [ 1] 2407 	clr acc24    
      008DF7 CD 84 30 72      [ 1] 2408 	clr acc16
      008DFB F2 01 90 9F      [ 1] 2409 	clr acc8 
      008DFF CB 00            [ 1] 2410 	clr (SIGN,sp)
      008E01 02 C7            [ 1] 2411 	ld a,#10
      008E03 00 02            [ 1] 2412 	ld (BASE,sp),a ; default base decimal
      008E05 1F               [ 1] 2413 	ld a,(x)
      008E06 01 72            [ 1] 2414 	jreq 9$  ; completed if 0
      008E08 F9 01            [ 1] 2415 	cp a,#'-
      008E0A 90 5C            [ 1] 2416 	jrne 1$
      008E0C 5B 02            [ 1] 2417 	cpl (SIGN,sp)
      008E0E AE 96            [ 2] 2418 	jra 2$
      008E10 43 A6            [ 1] 2419 1$: cp a,#'$
      008E12 80 CC            [ 1] 2420 	jrne 3$
      008E14 8E BA            [ 1] 2421 	ld a,#16
      008E16 6B 02            [ 1] 2422 	ld (BASE,sp),a
      008E16 A6               [ 2] 2423 2$:	incw x
      008E17 2B               [ 1] 2424 	ld a,(x)
      000E73                       2425 3$:	
      008E18 11 01            [ 1] 2426 	cp a,#'a
      008E1A 26 05            [ 1] 2427 	jrmi 4$
      008E1C A6 10            [ 1] 2428 	sub a,#32
      008E1E CC 8E            [ 1] 2429 4$:	cp a,#'0
      008E20 B6 2B            [ 1] 2430 	jrmi 9$
      008E21 A0 30            [ 1] 2431 	sub a,#'0
      008E21 A6 2A            [ 1] 2432 	cp a,#10
      008E23 11 01            [ 1] 2433 	jrmi 5$
      008E25 26 05            [ 1] 2434 	sub a,#7
      008E27 A6 20            [ 1] 2435 	cp a,(BASE,sp)
      008E29 CC 8E            [ 1] 2436 	jrpl 9$
      008E2B B6 03            [ 1] 2437 5$:	ld (TEMP,sp),a
      008E2C 7B 02            [ 1] 2438 	ld a,(BASE,sp)
      008E2C A6 2F 11         [ 4] 2439 	call mulu24_8
      008E2F 01 26            [ 1] 2440 	ld a,(TEMP,sp)
      008E31 05 A6 21         [ 1] 2441 	add a,acc24+2
      008E34 CC 8E B6         [ 1] 2442 	ld acc24+2,a
      008E37 4F               [ 1] 2443 	clr a
      008E37 A6 25 11         [ 1] 2444 	adc a,acc24+1
      008E3A 01 26 05         [ 1] 2445 	ld acc24+1,a
      008E3D A6               [ 1] 2446 	clr a
      008E3E 22 CC 8E         [ 1] 2447 	adc a,acc24
      008E41 B6 00 0B         [ 1] 2448 	ld acc24,a
      008E42 20 C9            [ 2] 2449 	jra 2$
      008E42 A6 3D            [ 1] 2450 9$:	tnz (SIGN,sp)
      008E44 11 01            [ 1] 2451     jreq atoi_exit
      008E46 26 05 A6         [ 4] 2452     call neg_acc24
      000EAF                       2453 atoi_exit: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      000EAF                       2454 	_drop VSIZE
      008E49 32 CC            [ 2]    1     addw sp,#VSIZE 
      008E4B 8E               [ 2] 2455 	popw x ; restore x
      008E4C B6               [ 4] 2456 	ret
                                   2457 
                                   2458 
                                   2459 ;------------------------------------
                                   2460 ; skip character c in text starting from 'in'
                                   2461 ; input:
                                   2462 ;	 y 		point to text buffer
                                   2463 ;    a 		character to skip
                                   2464 ; output:  
                                   2465 ;	'in' ajusted to new position
                                   2466 ;------------------------------------
                           000001  2467 	C = 1 ; local var
      008E4D                       2468 skip:
      008E4D A6               [ 1] 2469 	push a
      008E4E 3E 11 01         [ 4] 2470 1$:	ld a,([in.w],y)
      008E51 26 23            [ 1] 2471 	jreq 2$
      008E53 A6 31            [ 1] 2472 	cp a,(C,sp)
      008E55 6B 02            [ 1] 2473 	jrne 2$
      008E57 72 5C 00 02      [ 1] 2474 	inc in
      008E5B 91 D6            [ 2] 2475 	jra 1$
      000EC3                       2476 2$: _drop 1 
      008E5D 01 A1            [ 2]    1     addw sp,#1 
      008E5F 3D               [ 4] 2477 	ret
                                   2478 	
                                   2479 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2480 ;;   TINY BASIC  operators,
                                   2481 ;;   commands and functions 
                                   2482 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2483 
                                   2484 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2485 ;;  Arithmetic operators
                                   2486 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2487 
                                   2488 
                                   2489 ;--------------------------------------
                                   2490 ;  multiply 2 uint16_t return uint32_t
                                   2491 ;  input:
                                   2492 ;     x       uint16_t 
                                   2493 ;     y       uint16_t 
                                   2494 ;  output:
                                   2495 ;     x       product bits 15..0
                                   2496 ;     y       product bits 31..16 
                                   2497 ;---------------------------------------
                           000001  2498 		U1=1  ; uint16_t 
                           000003  2499 		DBL=3 ; uint32_t
                           000006  2500 		VSIZE=6
      000EC6                       2501 umstar:
      000EC6                       2502 	_vars VSIZE 
      008E60 26 04            [ 2]    1     sub sp,#VSIZE 
      008E62 A6 33            [ 2] 2503 	ldw (U1,sp),x 
                                   2504 ;initialize bits 31..16 of 
                                   2505 ;product to zero 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008E64 20 50            [ 1] 2506 	clr (DBL,sp)
      008E66 A1 3C            [ 1] 2507 	clr (DBL+1,sp)
                                   2508 ; produc U1L*U2L 
      008E68 26 04            [ 1] 2509 	ld a,yl 
      008E6A A6               [ 4] 2510 	mul x,a 
      008E6B 35 20            [ 2] 2511 	ldw (DBL+2,sp),x
                                   2512 ; product U1H*U2L 
      008E6D 48 72            [ 1] 2513 	ld a,(U1,sp) ; xh 
      008E6F 5A               [ 1] 2514 	ldw x,y
      008E70 00               [ 4] 2515 	mul x,a 
      008E71 02               [ 1] 2516 	clr a 
      008E72 7B 02 20         [ 2] 2517 	addw x,(DBL+1,sp) 
      008E75 40               [ 1] 2518 	clr a 
      008E76 19 03            [ 1] 2519 	adc a,(DBL,sp) 
      008E76 A6 3C            [ 1] 2520 	ld (DBL,sp),a ; bits 23..17 
      008E78 11 01            [ 2] 2521 	ldw (DBL+1,sp),x ; bits 15..0 
                                   2522 ; product U1L*U2H
      008E7A 26 23            [ 1] 2523 	swapw y 
      008E7C A6               [ 1] 2524 	ldw x,y
      008E7D 34 6B            [ 1] 2525 	ld a,(U1+1,sp)
      008E7F 02               [ 4] 2526 	mul x,a
      008E80 72 5C 00         [ 2] 2527 	addw x,(DBL+1,sp)
      008E83 02               [ 1] 2528 	clr a 
      008E84 91 D6            [ 1] 2529 	adc a,(DBL,sp)
      008E86 01 A1            [ 1] 2530 	ld (DBL,sp),a 
      008E88 3D 26            [ 2] 2531 	ldw (DBL+1,sp),x 
                                   2532 ; product U1H*U2H 	
      008E8A 04 A6            [ 1] 2533 	ld a,(U1,sp)
      008E8C 36               [ 1] 2534 	ldw x,y  
      008E8D 20               [ 4] 2535 	mul x,a 
      008E8E 27 A1 3E         [ 2] 2536 	addw x,(DBL,sp)
      008E91 26 04            [ 1] 2537 	ldw y,x 
      008E93 A6 35            [ 2] 2538 	ldw x,(DBL+2,sp)
      000EFD                       2539 	_drop VSIZE 
      008E95 20 1F            [ 2]    1     addw sp,#VSIZE 
      008E97 72               [ 4] 2540 	ret
                                   2541 
                                   2542 
                                   2543 ;-------------------------------------
                                   2544 ; multiply 2 integers
                                   2545 ; input:
                                   2546 ;  	x       n1 
                                   2547 ;   y 		n2 
                                   2548 ; output:
                                   2549 ;	X        N1*N2 bits 15..0
                                   2550 ;   Y        N1*N2 bits 31..16 
                                   2551 ;-------------------------------------
                           000001  2552 	SIGN=1
                           000001  2553 	VSIZE=1
      000F00                       2554 multiply:
      000F00                       2555 	_vars VSIZE 
      008E98 5A 00            [ 2]    1     sub sp,#VSIZE 
      008E9A 02 7B            [ 1] 2556 	clr (SIGN,sp)
      008E9C 02               [ 1] 2557 	ld a,xh 
      008E9D 20 17            [ 1] 2558 	jrpl 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008E9F 03 01            [ 1] 2559 	cpl (SIGN,sp)
      008E9F 7B               [ 2] 2560 	negw x 
      000F0A                       2561 1$:	
      008EA0 01 CD            [ 1] 2562 	ld a,yh 
      008EA2 85 EB            [ 1] 2563 	jrpl 2$ 
      008EA4 25 03            [ 1] 2564 	cpl (SIGN,sp)
      008EA6 CC 88            [ 2] 2565 	negw y 
      000F12                       2566 2$:	
      008EA8 F5 0E C6         [ 4] 2567 	call umstar
      008EA9 7B 01            [ 1] 2568 	ld a,(SIGN,sp)
      008EA9 CD 8C            [ 1] 2569 	jreq 3$
      008EAB B1               [ 2] 2570 	cplw x 
      008EAC A3 96            [ 2] 2571 	cplw y 
      008EAE 43 26 09         [ 2] 2572 	addw x,#1
      008EB1 90 93            [ 1] 2573 	jrnc 3$
      008EB3 CC 8D            [ 2] 2574 	incw y
      000F23                       2575 3$:	
      000F23                       2576 	_drop VSIZE 
      008EB5 ED 01            [ 2]    1     addw sp,#VSIZE 
      008EB6 81               [ 4] 2577 	ret
                                   2578 
                                   2579 ;--------------------------------------
                                   2580 ; divide uint32_t/uint16_t
                                   2581 ; return:  quotient and remainder 
                                   2582 ; quotient expected to be uint16_t 
                                   2583 ; input:
                                   2584 ;   DBLDIVDND    on stack 
                                   2585 ;   X            divisor 
                                   2586 ; output:
                                   2587 ;   X            quotient 
                                   2588 ;   Y            remainder 
                                   2589 ;---------------------------------------
                           000003  2590 	VSIZE=3
      000F26                       2591 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000F26                       2592 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   2593 	; local variables 
                           000001  2594 	DIVISOR=1 
                           000003  2595 	CNTR=3 
      000F26                       2596 udiv32_16:
      000F26                       2597 	_vars VSIZE 
      008EB6 F7 5C            [ 2]    1     sub sp,#VSIZE 
      008EB8 90 93            [ 2] 2598 	ldw (DIVISOR,sp),x	; save divisor 
      008EBA 1E 08            [ 2] 2599 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008EBA 5B 02            [ 2] 2600 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008EBC 81 5D            [ 2] 2601 	tnzw y
      008EBD 26 06            [ 1] 2602 	jrne long_division 
      008EBD A1 61            [ 2] 2603 	ldw y,(DIVISOR,sp)
      008EBF 2A               [ 2] 2604 	divw x,y
      000F35                       2605 	_drop VSIZE 
      008EC0 01 81            [ 2]    1     addw sp,#VSIZE 
      008EC2 A1               [ 4] 2606 	ret
      000F38                       2607 long_division:
      008EC3 7A               [ 1] 2608 	exgw x,y ; hi in x, lo in y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008EC4 22 FB            [ 1] 2609 	ld a,#17 
      008EC6 A0 20            [ 1] 2610 	ld (CNTR,sp),a
      000F3D                       2611 1$:
      008EC8 81 01            [ 2] 2612 	cpw x,(DIVISOR,sp)
      008EC9 2B 03            [ 1] 2613 	jrmi 2$
      008EC9 89 52 03         [ 2] 2614 	subw x,(DIVISOR,sp)
      008ECC 72               [ 1] 2615 2$:	ccf 
      008ECD 5F 00            [ 2] 2616 	rlcw y 
      008ECF 0C               [ 2] 2617 	rlcw x 
      008ED0 72 5F            [ 1] 2618 	dec (CNTR,sp)
      008ED2 00 0D            [ 1] 2619 	jrne 1$
      008ED4 72               [ 1] 2620 	exgw x,y 
      000F4D                       2621 	_drop VSIZE 
      008ED5 5F 00            [ 2]    1     addw sp,#VSIZE 
      008ED7 0E               [ 4] 2622 	ret
                                   2623 
                                   2624 ;-----------------------------
                                   2625 ; negate double int.
                                   2626 ; input:
                                   2627 ;   x     bits 15..0
                                   2628 ;   y     bits 31..16
                                   2629 ; output: 
                                   2630 ;   x     bits 15..0
                                   2631 ;   y     bits 31..16
                                   2632 ;-----------------------------
      000F50                       2633 dneg:
      008ED8 0F               [ 2] 2634 	cplw x 
      008ED9 01 A6            [ 2] 2635 	cplw y 
      008EDB 0A 6B 02         [ 2] 2636 	addw x,#1 
      008EDE F6 27            [ 1] 2637 	jrnc 1$
      008EE0 47 A1            [ 2] 2638 	incw y 
      008EE2 2D               [ 4] 2639 1$: ret 
                                   2640 
                                   2641 
                                   2642 ;--------------------------------
                                   2643 ; sign extend single to double
                                   2644 ; input:
                                   2645 ;   x    int16_t
                                   2646 ; output:
                                   2647 ;   x    int32_t bits 15..0
                                   2648 ;   y    int32_t bits 31..16
                                   2649 ;--------------------------------
      000F5B                       2650 dbl_sign_extend:
      008EE3 26 04            [ 1] 2651 	clrw y
      008EE5 03               [ 1] 2652 	ld a,xh 
      008EE6 01 20            [ 1] 2653 	and a,#0x80 
      008EE8 08 A1            [ 1] 2654 	jreq 1$
      008EEA 24 26            [ 2] 2655 	cplw y
      008EEC 06               [ 4] 2656 1$: ret 	
                                   2657 
                                   2658 
                                   2659 ;----------------------------------
                                   2660 ;  euclidian divide dbl/n1 
                                   2661 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   2662 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2663 ;    dbl    int32_t on stack 
                                   2664 ;    x 		n1   int16_t  disivor  
                                   2665 ; output:
                                   2666 ;    X      dbl/n2  int16_t 
                                   2667 ;    Y      remainder int16_t 
                                   2668 ;----------------------------------
                           000008  2669 	VSIZE=8
      000F65                       2670 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000F65                       2671 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000F65                       2672 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   2673 	; local variables
                           000001  2674 	DBLHI=1
                           000003  2675 	DBLLO=3 
                           000005  2676 	SDIVSR=5 ; sign divisor
                           000006  2677 	SQUOT=6 ; sign dividend 
                           000007  2678 	DIVISR=7 ; divisor 
      000F65                       2679 div32_16:
      000F65                       2680 	_vars VSIZE 
      008EED A6 10            [ 2]    1     sub sp,#VSIZE 
      008EEF 6B 02            [ 1] 2681 	clr (SDIVSR,sp)
      008EF1 5C F6            [ 1] 2682 	clr (SQUOT,sp)
                                   2683 ; copy arguments 
      008EF3 16 0B            [ 2] 2684 	ldw y,(DIVDNDHI,sp)
      008EF3 A1 61            [ 2] 2685 	ldw (DBLHI,sp),y
      008EF5 2B 02            [ 2] 2686 	ldw y,(DIVDNDLO,sp)
      008EF7 A0 20            [ 2] 2687 	ldw (DBLLO,sp),y 
                                   2688 ; check for 0 divisor
      008EF9 A1               [ 2] 2689 	tnzw x 
      008EFA 30 2B            [ 1] 2690     jrne 0$
      008EFC 2B A0            [ 1] 2691 	ld a,#ERR_DIV0 
      008EFE 30 A1 0A         [ 2] 2692 	jp tb_error 
                                   2693 ; check divisor sign 	
      008F01 2B               [ 1] 2694 0$:	ld a,xh 
      008F02 06 A0            [ 1] 2695 	and a,#0x80 
      008F04 07 11            [ 1] 2696 	jreq 1$
      008F06 02 2A            [ 1] 2697 	cpl (SDIVSR,sp)
      008F08 1F 6B            [ 1] 2698 	cpl (SQUOT,sp)
      008F0A 03               [ 2] 2699 	negw x
      008F0B 7B 02            [ 2] 2700 1$:	ldw (DIVISR,sp),x
                                   2701 ; check dividend sign 	 
      008F0D CD 8A            [ 1] 2702  	ld a,(DBLHI,sp) 
      008F0F EC 7B            [ 1] 2703 	and a,#0x80 
      008F11 03 CB            [ 1] 2704 	jreq 2$ 
      008F13 00 0E            [ 1] 2705 	cpl (SQUOT,sp)
      008F15 C7 00            [ 2] 2706 	ldw x,(DBLLO,sp)
      008F17 0E 4F            [ 2] 2707 	ldw y,(DBLHI,sp)
      008F19 C9 00 0D         [ 4] 2708 	call dneg 
      008F1C C7 00            [ 2] 2709 	ldw (DBLLO,sp),x 
      008F1E 0D 4F            [ 2] 2710 	ldw (DBLHI,sp),y 
      008F20 C9 00            [ 2] 2711 2$:	ldw x,(DIVISR,sp)
      008F22 0C C7 00         [ 4] 2712 	call udiv32_16
      008F25 0C 20            [ 2] 2713 	tnzw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F27 C9 0D            [ 1] 2714 	jreq 3$ 
                                   2715 ; x=quotient 
                                   2716 ; y=remainder 
                                   2717 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008F29 01 27            [ 1] 2718 	ld a,(SQUOT,sp)
      008F2B 03 CD            [ 1] 2719 	xor a,(SDIVSR,sp)
      008F2D 8B 26            [ 1] 2720 	jreq 3$
      008F2F 5C               [ 2] 2721 	incw x 
      008F2F 5B 03 85 81      [ 2] 2722 	ldw acc16,y 
      008F33 16 07            [ 2] 2723 	ldw y,(DIVISR,sp)
      008F33 88 91 D6 01      [ 2] 2724 	subw y,acc16
                                   2725 ; sign quotient
      008F37 27 0A            [ 1] 2726 3$:	ld a,(SQUOT,sp)
      008F39 11 01            [ 1] 2727 	jreq 4$
      008F3B 26               [ 2] 2728 	negw x 
      000FB9                       2729 4$:	
      000FB9                       2730 	_drop VSIZE 
      008F3C 06 72            [ 2]    1     addw sp,#VSIZE 
      008F3E 5C               [ 4] 2731 	ret 
                                   2732 
                                   2733 
                                   2734 
                                   2735 ;----------------------------------
                                   2736 ; division x/y 
                                   2737 ; input:
                                   2738 ;    X       dividend
                                   2739 ;    Y       divisor 
                                   2740 ; output:
                                   2741 ;    X       quotient
                                   2742 ;    Y       remainder 
                                   2743 ;-----------------------------------
                           000004  2744 	VSIZE=4 
                                   2745 	; local variables 
                           000001  2746 	DBLHI=1
                           000003  2747 	DBLLO=3
      000FBC                       2748 divide: 
      000FBC                       2749 	_vars VSIZE 
      008F3F 00 02            [ 2]    1     sub sp,#VSIZE 
      008F41 20 F1 5B 01      [ 2] 2750 	ldw acc16,y
      008F45 81 0F 5B         [ 4] 2751 	call dbl_sign_extend
      008F46 1F 03            [ 2] 2752 	ldw (DBLLO,sp),x 
      008F46 52 06            [ 2] 2753 	ldw (DBLHI,sp),y 
      008F48 1F 01 0F         [ 2] 2754 	ldw x,acc16 
      008F4B 03 0F 04         [ 4] 2755 	call div32_16 
      000FCF                       2756 	_drop VSIZE 
      008F4E 90 9F            [ 2]    1     addw sp,#VSIZE 
      008F50 42               [ 4] 2757 	ret
                                   2758 
                                   2759 
                                   2760 ;----------------------------------
                                   2761 ;  remainder resulting from euclidian 
                                   2762 ;  division of x/y 
                                   2763 ; input:
                                   2764 ;   x   	dividend int16_t 
                                   2765 ;   y 		divisor int16_t
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2766 ; output:
                                   2767 ;   X       n1%n2 
                                   2768 ;----------------------------------
      000FD2                       2769 modulo:
      008F51 1F 05 7B         [ 4] 2770 	call divide
      008F54 01               [ 1] 2771 	ldw x,y 
      008F55 93               [ 4] 2772 	ret 
                                   2773 
                                   2774 ;----------------------------------
                                   2775 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2776 ; return expr1*expr2/expr3 
                                   2777 ; product result is int32_t and 
                                   2778 ; divisiont is int32_t/int16_t
                                   2779 ;----------------------------------
                           000004  2780 	DBL_SIZE=4 
      000FD7                       2781 muldiv:
      008F56 42 4F 72         [ 4] 2782 	call func_args 
      008F59 FB 04            [ 1] 2783 	cp a,#3 
      008F5B 4F 19            [ 1] 2784 	jreq 1$
      008F5D 03 6B 03         [ 2] 2785 	jp syntax_error
      000FE1                       2786 1$: 
      008F60 1F 04            [ 2] 2787 	ldw x,(5,sp) ; expr1
      008F62 90 5E            [ 2] 2788 	ldw y,(3,sp) ; expr2
      008F64 93 7B 02         [ 4] 2789 	call multiply 
      008F67 42 72            [ 2] 2790 	ldw (5,sp),x  ;int32_t 15..0
      008F69 FB 04            [ 2] 2791 	ldw (3,sp),y  ;int32_t 31..16
      008F6B 4F               [ 2] 2792 	popw x        ; expr3 
      008F6C 19 03 6B         [ 4] 2793 	call div32_16 ; int32_t/expr3 
      000FF0                       2794 	_drop DBL_SIZE
      008F6F 03 1F            [ 2]    1     addw sp,#DBL_SIZE 
      008F71 04               [ 4] 2795 	ret 
                                   2796 
                                   2797 
                                   2798 ;----------------------------------
                                   2799 ; search in kword_dict name
                                   2800 ; from its execution address 
                                   2801 ; input:
                                   2802 ;   X       	execution address 
                                   2803 ; output:
                                   2804 ;   X 			cstr*  | 0 
                                   2805 ;--------------------------------
                           000001  2806 	XADR=1 
                           000003  2807 	LINK=3 
                           000004  2808 	VSIZE=4
      000FF3                       2809 cmd_name:
      000FF3                       2810 	_vars VSIZE 
      008F72 7B 01            [ 2]    1     sub sp,#VSIZE 
      008F74 93 42 72 FB      [ 1] 2811 	clr acc16 
      008F78 03 90            [ 2] 2812 	ldw (XADR,sp),x  
      008F7A 93 1E 05         [ 2] 2813 	ldw x,#kword_dict	
      008F7D 5B 06            [ 2] 2814 1$:	ldw (LINK,sp),x
      008F7F 81 02            [ 1] 2815 	ld a,(2,x)
      008F80 A4 0F            [ 1] 2816 	and a,#15 
      008F80 52 01 0F         [ 1] 2817 	ld acc8,a 
      008F83 01 9E 2A         [ 2] 2818 	addw x,#3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008F86 03 03 01 50      [ 2] 2819 	addw x,acc16
      008F8A FE               [ 2] 2820 	ldw x,(x) ; execution address 
      008F8A 90 9E            [ 2] 2821 	cpw x,(XADR,sp)
      008F8C 2A 04            [ 1] 2822 	jreq 2$
      008F8E 03 01            [ 2] 2823 	ldw x,(LINK,sp)
      008F90 90               [ 2] 2824 	ldw x,(x) 
      008F91 50 00 02         [ 2] 2825 	subw x,#2  
      008F92 26 E3            [ 1] 2826 	jrne 1$
      008F92 CD 8F            [ 2] 2827 	jra 9$
      008F94 46 7B            [ 2] 2828 2$: ldw x,(LINK,sp)
      008F96 01 27 0A         [ 2] 2829 	addw x,#2 	
      001022                       2830 9$:	_drop VSIZE
      008F99 53 90            [ 2]    1     addw sp,#VSIZE 
      008F9B 53               [ 4] 2831 	ret
                                   2832 
                                   2833 
                                   2834 ;---------------------------------
                                   2835 ; dictionary search 
                                   2836 ; input:
                                   2837 ;	X 		dictionary entry point, name field  
                                   2838 ;   y		.asciz name to search 
                                   2839 ; output:
                                   2840 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2841 ;  X		execution address | 0 
                                   2842 ;---------------------------------
                           000001  2843 	NLEN=1 ; cmd length 
                           000002  2844 	XSAVE=2
                           000004  2845 	YSAVE=4
                           000005  2846 	VSIZE=5 
      001025                       2847 search_dict:
      001025                       2848 	_vars VSIZE 
      008F9C 1C 00            [ 2]    1     sub sp,#VSIZE 
                                   2849 
      008F9E 01 24            [ 2] 2850 	ldw (YSAVE,sp),y 
      001029                       2851 search_next:
      008FA0 02 90            [ 2] 2852 	ldw (XSAVE,sp),x 
                                   2853 ; get name length in dictionary	
      008FA2 5C               [ 1] 2854 	ld a,(x)
      008FA3 A4 0F            [ 1] 2855 	and a,#0xf 
      008FA3 5B 01            [ 1] 2856 	ld (NLEN,sp),a  
      008FA5 81 04            [ 2] 2857 	ldw y,(YSAVE,sp) ; name pointer 
      008FA6 5C               [ 2] 2858 	incw x 
      001033                       2859 cp_loop:
      008FA6 52 03            [ 1] 2860 	ld a,(y)
      008FA8 1F 01            [ 1] 2861 	jreq str_match 
      008FAA 1E 08            [ 1] 2862 	tnz (NLEN,sp)
      008FAC 16 06            [ 1] 2863 	jreq no_match  
      008FAE 90               [ 1] 2864 	cp a,(x)
      008FAF 5D 26            [ 1] 2865 	jrne no_match 
      008FB1 06 16            [ 2] 2866 	incw y 
      008FB3 01               [ 2] 2867 	incw x
      008FB4 65 5B            [ 1] 2868 	dec (NLEN,sp)
      008FB6 03 81            [ 2] 2869 	jra cp_loop 
      008FB8                       2870 no_match:
      008FB8 51 A6            [ 2] 2871 	ldw x,(XSAVE,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008FBA 11 6B 03         [ 2] 2872 	subw x,#2 ; move X to link field
      008FBD 4B 00            [ 1] 2873 	push #TK_NONE 
      008FBD 13               [ 2] 2874 	ldw x,(x) ; next word link 
      008FBE 01               [ 1] 2875 	pop a ; TK_NONE 
      008FBF 2B 03            [ 1] 2876 	jreq search_exit  ; not found  
                                   2877 ;try next 
      008FC1 72 F0            [ 2] 2878 	jra search_next
      001052                       2879 str_match:
      008FC3 01 8C            [ 2] 2880 	ldw x,(XSAVE,sp)
      008FC5 90               [ 1] 2881 	ld a,(X)
      008FC6 59 59            [ 1] 2882 	ld (NLEN,sp),a ; needed to test keyword type  
      008FC8 0A 03            [ 1] 2883 	and a,#0xf 
                                   2884 ; move x to procedure address field 	
      008FCA 26               [ 1] 2885 	inc a 
      008FCB F1 51 5B         [ 1] 2886 	ld acc8,a 
      008FCE 03 81 00 0C      [ 1] 2887 	clr acc16 
      008FD0 72 BB 00 0C      [ 2] 2888 	addw x,acc16 
      008FD0 53               [ 2] 2889 	ldw x,(x) ; routine entry point 
                                   2890 ;determine keyword type bits 7:6 
      008FD1 90 53            [ 1] 2891 	ld a,(NLEN,sp)
      008FD3 1C               [ 1] 2892 	swap a 
      008FD4 00 01            [ 1] 2893 	and a,#0xc
      008FD6 24               [ 1] 2894 	srl a
      008FD7 02               [ 1] 2895 	srl a 
      008FD8 90 5C            [ 1] 2896 	add a,#128
      00106F                       2897 search_exit: 
      00106F                       2898 	_drop VSIZE 	 
      008FDA 81 05            [ 2]    1     addw sp,#VSIZE 
      008FDB 81               [ 4] 2899 	ret 
                                   2900 
                                   2901 ;---------------------
                                   2902 ; check if next token
                                   2903 ;  is of expected type 
                                   2904 ; input:
                                   2905 ;   A 		 expected token attribute
                                   2906 ;  ouput:
                                   2907 ;   none     if fail call syntax_error 
                                   2908 ;--------------------
      001072                       2909 expect:
      008FDB 90               [ 1] 2910 	push a 
      008FDC 5F 9E A4         [ 4] 2911 	call next_token 
      008FDF 80 27            [ 1] 2912 	cp a,(1,sp)
      008FE1 02 90            [ 1] 2913 	jreq 1$
      008FE3 53 81 75         [ 2] 2914 	jp syntax_error
      008FE5 84               [ 1] 2915 1$: pop a 
      008FE5 52               [ 4] 2916 	ret 
                                   2917 
                                   2918 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2919 ; parse arguments list 
                                   2920 ; between ()
                                   2921 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00107F                       2922 func_args:
      008FE6 08 0F            [ 1] 2923 	ld a,#TK_LPAREN 
      008FE8 05 0F 06         [ 4] 2924 	call expect 
                                   2925 ; expected to continue in arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2926 ; caller must check for TK_RPAREN 
                                   2927 
                                   2928 ;-------------------------------
                                   2929 ; parse embedded BASIC routines 
                                   2930 ; arguments list.
                                   2931 ; arg_list::=  rel[','rel]*
                                   2932 ; all arguments are of integer type
                                   2933 ; and pushed on stack 
                                   2934 ; input:
                                   2935 ;   none
                                   2936 ; output:
                                   2937 ;   stack{n}   arguments pushed on stack
                                   2938 ;   A 	number of arguments pushed on stack  
                                   2939 ;--------------------------------
      001084                       2940 arg_list:
      008FEB 16 0B            [ 1] 2941 	push #0  
      008FED 17 01 16         [ 4] 2942 1$: call relation
      008FF0 0D 17            [ 1] 2943 	cp a,#TK_NONE 
      008FF2 03 5D            [ 1] 2944 	jreq 5$
      008FF4 26 05            [ 1] 2945 	cp a,#TK_INTGR
      008FF6 A6 04            [ 1] 2946 	jrne 4$
      001091                       2947 3$: 
                                   2948 ; swap return address with argument
      008FF8 CC               [ 1] 2949 	pop a ; arg_count
      008FF9 88 F7            [ 2] 2950 	popw y ; return address 
      008FFB 9E               [ 2] 2951 	pushw x ; new argument 
      008FFC A4 80            [ 2] 2952 	pushw y 
      008FFE 27               [ 1] 2953     inc a
      008FFF 05               [ 1] 2954 	push a 
      009000 03 05 03         [ 4] 2955 	call next_token 
      009003 06 50            [ 1] 2956 	cp a,#TK_COMMA 
      009005 1F 07            [ 1] 2957 	jreq 1$ 
      009007 7B 01            [ 1] 2958 	cp a,#TK_NONE 
      009009 A4 80            [ 1] 2959 	jreq 5$ 
      00900B 27 0D            [ 1] 2960 4$:	cp a,#TK_RPAREN 
      00900D 03 06            [ 1] 2961 	jreq 5$
      0010A8                       2962 	_unget_token 
      00900F 1E 03 16 01 CD   [ 1]    1     mov in,in.saved
      009014 8F               [ 1] 2963 5$:	pop a  
      009015 D0               [ 4] 2964 	ret 
                                   2965 
                                   2966 ;--------------------------------
                                   2967 ;   BASIC commnands 
                                   2968 ;--------------------------------
                                   2969 
                                   2970 ;--------------------------------
                                   2971 ;  arithmetic and relational 
                                   2972 ;  routines
                                   2973 ;  operators precedence
                                   2974 ;  highest to lowest
                                   2975 ;  operators on same row have 
                                   2976 ;  same precedence and are executed
                                   2977 ;  from left to right.
                                   2978 ;	'*','/','%'
                                   2979 ;   '-','+'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2980 ;   '=','>','<','>=','<=','<>','><'
                                   2981 ;   '<>' and '><' are equivalent for not equal.
                                   2982 ;--------------------------------
                                   2983 
                                   2984 ;---------------------
                                   2985 ; return array element
                                   2986 ; address from @(expr)
                                   2987 ; input:
                                   2988 ;   A 		TK_ARRAY
                                   2989 ; output:
                                   2990 ;   A 		TK_INTGR
                                   2991 ;	X 		element address 
                                   2992 ;----------------------
      0010AF                       2993 get_array_element:
      009016 1F 03 17         [ 4] 2994 	call func_args 
      009019 01 1E            [ 1] 2995 	cp a,#1
      00901B 07 CD            [ 1] 2996 	jreq 1$
      00901D 8F A6 90         [ 2] 2997 	jp syntax_error
      009020 5D               [ 2] 2998 1$: popw x 
                                   2999 	; check for bounds 
      009021 27 11 7B         [ 2] 3000 	cpw x,array_size 
      009024 06 18            [ 2] 3001 	jrule 3$
                                   3002 ; bounds {1..array_size}	
      009026 05 27            [ 1] 3003 2$: ld a,#ERR_BAD_VALUE 
      009028 0B 5C 90         [ 2] 3004 	jp tb_error 
      00902B CF               [ 2] 3005 3$: tnzw  x
      00902C 00 0D            [ 1] 3006 	jreq 2$ 
      00902E 16               [ 2] 3007 	sllw x 
      00902F 07               [ 2] 3008 	pushw x 
      009030 72 B2 00         [ 2] 3009 	ldw x,#tib
      009033 0D 7B 06         [ 2] 3010 	subw x,(1,sp)
      0010CF                       3011 	_drop 2   
      009036 27 01            [ 2]    1     addw sp,#2 
      009038 50 84            [ 1] 3012 	ld a,#TK_INTGR
      009039 81               [ 4] 3013 	ret 
                                   3014 
                                   3015 
                                   3016 ;***********************************
                                   3017 ;   expression parse,execute 
                                   3018 ;***********************************
                                   3019 ;-----------------------------------
                                   3020 ; factor ::= ['+'|'-'|e]  var | @ |
                                   3021 ;			 integer | function |
                                   3022 ;			 '('relation')' 
                                   3023 ; output:
                                   3024 ;   A    token attribute 
                                   3025 ;   X 	 integer
                                   3026 ; ---------------------------------
                           000001  3027 	NEG=1
                           000001  3028 	VSIZE=1
      0010D4                       3029 factor:
      0010D4                       3030 	_vars VSIZE 
      009039 5B 08            [ 2]    1     sub sp,#VSIZE 
      00903B 81 09 67         [ 4] 3031 	call next_token
      00903C A1 02            [ 1] 3032 	cp a,#CMD_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00903C 52 04            [ 1] 3033 	jrult 20$
      00903E 90 CF            [ 1] 3034 1$:	ld (NEG,sp),a 
      009040 00 0D            [ 1] 3035 	and a,#TK_GRP_MASK
      009042 CD 8F            [ 1] 3036 	cp a,#TK_GRP_ADD 
      009044 DB 1F            [ 1] 3037 	jreq 2$
      009046 03 17            [ 1] 3038 	ld a,(NEG,sp)
      009048 01 CE            [ 2] 3039 	jra 4$  
      0010E9                       3040 2$:	
      00904A 00 0D CD         [ 4] 3041 	call next_token 
      0010EC                       3042 4$:	
      00904D 8F E5            [ 1] 3043 	cp a,#TK_IFUNC 
      00904F 5B 04            [ 1] 3044 	jrne 5$ 
      009051 81               [ 4] 3045 	call (x) 
      009052 20 2F            [ 2] 3046 	jra 18$ 
      0010F3                       3047 5$:
      009052 CD 90            [ 1] 3048 	cp a,#TK_INTGR
      009054 3C 93            [ 1] 3049 	jrne 6$
      009056 81 29            [ 2] 3050 	jra 18$
      009057                       3051 6$:
      009057 CD 90            [ 1] 3052 	cp a,#TK_ARRAY
      009059 FF A1            [ 1] 3053 	jrne 10$
      00905B 03 27 03         [ 4] 3054 	call get_array_element
      00905E CC               [ 2] 3055 	ldw x,(x)
      00905F 88 F5            [ 2] 3056 	jra 18$ 
      009061                       3057 10$:
      009061 1E 05            [ 1] 3058 	cp a,#TK_VAR 
      009063 16 03            [ 1] 3059 	jrne 12$
      009065 CD               [ 2] 3060 	ldw x,(x)
      009066 8F 80            [ 2] 3061 	jra 18$
      00110A                       3062 12$:			
      009068 1F 05            [ 1] 3063 	cp a,#TK_LPAREN
      00906A 17 03            [ 1] 3064 	jrne 16$
      00906C 85 CD 8F         [ 4] 3065 	call relation
      00906F E5               [ 2] 3066 	pushw x 
      009070 5B 04            [ 1] 3067 	ld a,#TK_RPAREN 
      009072 81 10 72         [ 4] 3068 	call expect
      009073 85               [ 2] 3069 	popw x 
      009073 52 04            [ 2] 3070 	jra 18$	
      00111A                       3071 16$:
      00111A                       3072 	_unget_token
      009075 72 5F 00 0D 1F   [ 1]    1     mov in,in.saved
      00907A 01               [ 1] 3073 	clr a 
      00907B AE A7            [ 2] 3074 	jra 20$ 
      001122                       3075 18$: 
      00907D 3C 1F            [ 1] 3076 	ld a,#TK_MINUS 
      00907F 03 E6            [ 1] 3077 	cp a,(NEG,sp)
      009081 02 A4            [ 1] 3078 	jrne 19$
      009083 0F               [ 2] 3079 	negw x
      001129                       3080 19$:
      009084 C7 00            [ 1] 3081 	ld a,#TK_INTGR
      00112B                       3082 20$:
      00112B                       3083 	_drop VSIZE
      009086 0E 1C            [ 2]    1     addw sp,#VSIZE 
      009088 00               [ 4] 3084 	ret
                                   3085 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3086 ;-----------------------------------
                                   3087 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3088 ; output:
                                   3089 ;   A    	token attribute 
                                   3090 ;	X		integer
                                   3091 ;-----------------------------------
                           000001  3092 	N1=1   ; int16_t
                           000003  3093 	MULOP=3
                           000003  3094 	VSIZE=3
      00112E                       3095 term:
      00112E                       3096 	_vars VSIZE
      009089 03 72            [ 2]    1     sub sp,#VSIZE 
      00908B BB 00 0D         [ 4] 3097 	call factor
      00908E FE 13            [ 1] 3098 	cp a,#CMD_END
      009090 01 27            [ 1] 3099 	jrult term_exit
      001137                       3100 term01:	 ; check for  operator 
      009092 0A 1E            [ 2] 3101 	ldw (N1,sp),x  ; save first factor 
      009094 03 FE 1D         [ 4] 3102 	call next_token
      009097 00 02            [ 1] 3103 	cp a,#CMD_END
      009099 26 E3            [ 1] 3104 	jrult 9$
      00909B 20 05            [ 1] 3105 0$:	ld (MULOP,sp),a
      00909D 1E 03            [ 1] 3106 	and a,#TK_GRP_MASK
      00909F 1C 00            [ 1] 3107 	cp a,#TK_GRP_MULT
      0090A1 02 5B            [ 1] 3108 	jreq 1$
      001148                       3109 	_unget_token 
      0090A3 04 81 02 00 01   [ 1]    1     mov in,in.saved
      0090A5 20 27            [ 2] 3110 	jra 9$
      00114F                       3111 1$:	; got *|/|%
      0090A5 52 05 17         [ 4] 3112 	call factor
      0090A8 04 84            [ 1] 3113 	cp a,#TK_INTGR
      0090A9 27 03            [ 1] 3114 	jreq 2$ 
      0090A9 1F 02 F6         [ 2] 3115 	jp syntax_error
      0090AC A4 0F            [ 1] 3116 2$:	ldw y,x 
      0090AE 6B 01            [ 2] 3117 	ldw x,(N1,sp)
      0090B0 16 04            [ 1] 3118 	ld a,(MULOP,sp) 
      0090B2 5C 20            [ 1] 3119 	cp a,#TK_MULT 
      0090B3 26 05            [ 1] 3120 	jrne 3$
      0090B3 90 F6 27         [ 4] 3121 	call multiply 
      0090B6 1B 0D            [ 2] 3122 	jra term01
      0090B8 01 27            [ 1] 3123 3$: cp a,#TK_DIV 
      0090BA 0A F1            [ 1] 3124 	jrne 4$ 
      0090BC 26 07 90         [ 4] 3125 	call divide 
      0090BF 5C 5C            [ 2] 3126 	jra term01 
      0090C1 0A 01 20         [ 4] 3127 4$: call modulo
      0090C4 EE C1            [ 2] 3128 	jra term01 
      0090C5 1E 01            [ 2] 3129 9$: ldw x,(N1,sp)
      0090C5 1E 02            [ 1] 3130 	ld a,#TK_INTGR 	
      00117A                       3131 term_exit:
      00117A                       3132 	_drop VSIZE 
      0090C7 1D 00            [ 2]    1     addw sp,#VSIZE 
      0090C9 02               [ 4] 3133 	ret 
                                   3134 
                                   3135 ;-------------------------------
                                   3136 ;  expr ::= term [['+'|'-'] term]*
                                   3137 ;  result range {-32768..32767}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3138 ;  output:
                                   3139 ;   A    token attribute 
                                   3140 ;   X	 integer   
                                   3141 ;-------------------------------
                           000001  3142 	N1=1 
                           000003  3143 	OP=3 
                           000003  3144 	VSIZE=3 
      00117D                       3145 expression:
      00117D                       3146 	_vars VSIZE 
      0090CA 4B 00            [ 2]    1     sub sp,#VSIZE 
      0090CC FE 84 27         [ 4] 3147 	call term
      0090CF 1F 20            [ 1] 3148 	cp a,#CMD_END 
      0090D1 D7 3D            [ 1] 3149 	jrult expr_exit 
      0090D2 1F 01            [ 2] 3150 0$:	ldw (N1,sp),x 
      0090D2 1E 02 F6         [ 4] 3151 	call next_token
      0090D5 6B 01            [ 1] 3152 	cp a,#CMD_END 
      0090D7 A4 0F            [ 1] 3153 	jrult 9$ 
      0090D9 4C C7            [ 1] 3154 1$:	ld (OP,sp),a  
      0090DB 00 0E            [ 1] 3155 	and a,#TK_GRP_MASK
      0090DD 72 5F            [ 1] 3156 	cp a,#TK_GRP_ADD 
      0090DF 00 0D            [ 1] 3157 	jreq 2$ 
      001197                       3158 	_unget_token
      0090E1 72 BB 00 0D FE   [ 1]    1     mov in,in.saved
      0090E6 7B 01            [ 2] 3159 	jra 9$
      00119E                       3160 2$: 
      0090E8 4E A4 0C         [ 4] 3161 	call term
      0090EB 44 44            [ 1] 3162 	cp a,#TK_INTGR 
      0090ED AB 80            [ 1] 3163 	jreq 3$
      0090EF CC 08 75         [ 2] 3164 	jp syntax_error
      0090EF 5B 05 81         [ 2] 3165 3$:	ldw acc16,x 
      0090F2 1E 01            [ 2] 3166 	ldw x,(N1,sp)
      0090F2 88 CD            [ 1] 3167 	ld a,(OP,sp)
      0090F4 89 E7            [ 1] 3168 	cp a,#TK_PLUS 
      0090F6 11 01            [ 1] 3169 	jrne 4$
      0090F8 27 03 CC 88      [ 2] 3170 	addw x,acc16
      0090FC F5 84            [ 2] 3171 	jra 0$ 
      0090FE 81 B0 00 0C      [ 2] 3172 4$:	subw x,acc16
      0090FF 20 C7            [ 2] 3173 	jra 0$
      0090FF A6 07            [ 2] 3174 9$: ldw x,(N1,sp)
      009101 CD 90            [ 1] 3175 	ld a,#TK_INTGR	
      0011C3                       3176 expr_exit:
      0011C3                       3177 	_drop VSIZE 
      009103 F2 03            [ 2]    1     addw sp,#VSIZE 
      009104 81               [ 4] 3178 	ret 
                                   3179 
                                   3180 ;---------------------------------------------
                                   3181 ; rel ::= expr rel_op expr
                                   3182 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3183 ;  relation return  integer , zero is false 
                                   3184 ;  output:
                                   3185 ;    A 		token attribute  
                                   3186 ;	 X		integer 
                                   3187 ;---------------------------------------------
                           000001  3188 	N1=1
                           000003  3189 	RELOP=3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                           000003  3190 	VSIZE=3 
      0011C6                       3191 relation: 
      0011C6                       3192 	_vars VSIZE
      009104 4B 00            [ 2]    1     sub sp,#VSIZE 
      009106 CD 92 46         [ 4] 3193 	call expression
      009109 A1 00            [ 1] 3194 	cp a,#CMD_END  
      00910B 27 20            [ 1] 3195 	jrult rel_exit 
                                   3196 	; expect rel_op or leave 
      00910D A1 84            [ 2] 3197 	ldw (N1,sp),x 
      00910F 26 13 67         [ 4] 3198 	call next_token 
      009111 A1 02            [ 1] 3199 	cp a,#CMD_END 
      009111 84 90            [ 1] 3200 	jrult 9$
      0011D8                       3201 1$:	
      009113 85 89            [ 1] 3202 	ld (RELOP,sp),a 
      009115 90 89            [ 1] 3203 	and a,#TK_GRP_MASK
      009117 4C 88            [ 1] 3204 	cp a,#TK_GRP_RELOP 
      009119 CD 89            [ 1] 3205 	jreq 2$
      0011E0                       3206 	_unget_token  
      00911B E7 A1 09 27 E6   [ 1]    1     mov in,in.saved
      009120 A1 00            [ 2] 3207 	jra 9$
      0011E7                       3208 2$:	; expect another expression or error 
      009122 27 09 A1         [ 4] 3209 	call expression
      009125 08 27            [ 1] 3210 	cp a,#TK_INTGR 
      009127 05 55            [ 1] 3211 	jreq 3$
      009129 00 03 00         [ 2] 3212 	jp syntax_error 
      00912C 02 84 81         [ 2] 3213 3$:	ldw acc16,x 
      00912F 1E 01            [ 2] 3214 	ldw x,(N1,sp) 
      00912F CD 90 FF A1      [ 2] 3215 	subw x,acc16
      009133 01 27            [ 1] 3216 	jrne 4$
      009135 03 CC 88 F5      [ 1] 3217 	mov acc8,#2 ; n1==n2
      009139 85 C3            [ 2] 3218 	jra 6$ 
      001202                       3219 4$: 
      00913B 00 22            [ 1] 3220 	jrsgt 5$  
      00913D 23 05 A6 0A      [ 1] 3221 	mov acc8,#4 ; n1<2 
      009141 CC 88            [ 2] 3222 	jra 6$
      00120A                       3223 5$:
      009143 F7 5D 27 F8      [ 1] 3224 	mov acc8,#1 ; n1>n2 
      00120E                       3225 6$:
      009147 58               [ 1] 3226 	clrw x 
      009148 89 AE 16         [ 1] 3227 	ld a, acc8  
      00914B 90 72            [ 1] 3228 	and a,(RELOP,sp)
      00914D F0               [ 1] 3229 	tnz a 
      00914E 01 5B            [ 1] 3230 	jreq 10$
      009150 02               [ 2] 3231 	incw x 
      001218                       3232 7$:	 
      009151 A6 84            [ 2] 3233 	jra 10$  	
      009153 81 01            [ 2] 3234 9$: ldw x,(N1,sp)
      009154                       3235 10$:
      009154 52 01            [ 1] 3236 	ld a,#TK_INTGR
      00121E                       3237 rel_exit: 	 
      00121E                       3238 	_drop VSIZE
      009156 CD 89            [ 2]    1     addw sp,#VSIZE 
      009158 E7               [ 4] 3239 	ret 
                                   3240 
                                   3241 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3242 ; BASIC: SHOW 
                                   3243 ; print stack content in hexadecimal bytes 
                                   3244 ; 16 bytes per row 
                                   3245 ;--------------------------------
      001221                       3246 show:
      009159 A1 02 25         [ 2] 3247 	ldw x,#cstk_prompt
      00915C 4E 6B 01         [ 4] 3248 	call puts 
      00915F A4               [ 1] 3249 	ldw x,sp 
      009160 30 A1 10         [ 2] 3250 	addw x,#3 ; ignore return address
      009163 27 04 7B 01      [ 2] 3251 	ldw y,#RAM_SIZE  
      009167 20 03 0C         [ 2] 3252 	ldw acc16,x 
      009169 72 B2 00 0C      [ 2] 3253 	subw y,acc16
      009169 CD 89 E7         [ 4] 3254 	call hex_dump
      00916C 4F               [ 1] 3255 	clr a 
      00916C A1               [ 4] 3256 	ret
                                   3257 
      00916D 81 26 03 FD 20 2F 6E  3258 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3259 
                                   3260 
                                   3261 ;--------------------------------------------
                                   3262 ; BASIC: HEX 
                                   3263 ; select hexadecimal base for integer print
                                   3264 ;---------------------------------------------
      009173                       3265 hex_base:
      009173 A1 84 26 02      [ 1] 3266 	mov base,#16 
      009177 20               [ 4] 3267 	ret 
                                   3268 
                                   3269 ;--------------------------------------------
                                   3270 ; BASIC: DEC 
                                   3271 ; select decimal base for integer print
                                   3272 ;---------------------------------------------
      001267                       3273 dec_base:
      009178 29 0A 00 0A      [ 1] 3274 	mov base,#10
      009179 81               [ 4] 3275 	ret 
                                   3276 
                                   3277 ;------------------------
                                   3278 ; BASIC: SIZE 
                                   3279 ; return free size in text area
                                   3280 ; output:
                                   3281 ;   A 		TK_INTGR
                                   3282 ;   X 	    size integer
                                   3283 ;--------------------------
      00126C                       3284 size:
      009179 A1 06 26         [ 2] 3285 	ldw x,#tib 
      00917C 06 CD 91 2F      [ 2] 3286 	subw x,txtend 
      009180 FE 20            [ 1] 3287 	ld a,#TK_INTGR
      009182 1F               [ 4] 3288 	ret 
                                   3289 
                                   3290 
                                   3291 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3292 ; BASIC: UBOUND  
                                   3293 ; return array variable size 
                                   3294 ; output:
                                   3295 ;   A 		TK_INTGR
                                   3296 ;   X 	    array size 
                                   3297 ;--------------------------
      009183                       3298 ubound:
      009183 A1 85 26         [ 2] 3299 	ldw x,#tib
      009186 03 FE 20 18      [ 2] 3300 	subw x,txtend 
      00918A 90 CE 00 04      [ 2] 3301 	ldw y,basicptr 
      00918A A1 07 26 0C      [ 2] 3302 	cpw y,txtend 
      00918E CD 92            [ 1] 3303 	jrult 1$
      009190 46 89 A6         [ 1] 3304 	push count 
      009193 08 CD            [ 1] 3305 	push #0 
      009195 90 F2 85         [ 2] 3306 	subw x,(1,sp)
      00128F                       3307 	_drop 2 
      009198 20 08            [ 2]    1     addw sp,#2 
      00919A 54               [ 2] 3308 1$:	srlw x 
      00919A 55 00 03         [ 2] 3309 	ldw array_size,x
      00919D 00 02            [ 1] 3310 	ld a,#TK_INTGR
      00919F 4F               [ 4] 3311 	ret 
                                   3312 
                                   3313 ;-----------------------------
                                   3314 ; BASIC: LET var=expr 
                                   3315 ; variable assignement 
                                   3316 ; output:
                                   3317 ;   A 		TK_NONE 
                                   3318 ;-----------------------------
      001298                       3319 let:
      0091A0 20 09 67         [ 4] 3320 	call next_token 
      0091A2 A1 85            [ 1] 3321 	cp a,#TK_VAR 
      0091A2 A6 11            [ 1] 3322 	jreq let_var
      0091A4 11 01            [ 1] 3323 	cp a,#TK_ARRAY 
      0091A6 26 01            [ 1] 3324 	jreq  let_array
      0091A8 50 08 75         [ 2] 3325 	jp syntax_error
      0091A9                       3326 let_array:
      0091A9 A6 84 AF         [ 4] 3327 	call get_array_element
      0091AB                       3328 let_var:
      0091AB 5B               [ 2] 3329 	pushw x  
      0091AC 01 81 67         [ 4] 3330 	call next_token 
      0091AE A1 32            [ 1] 3331 	cp a,#TK_EQUAL
      0091AE 52 03            [ 1] 3332 	jreq 1$
      0091B0 CD 91 54         [ 2] 3333 	jp syntax_error
      0012B4                       3334 1$:	
      0091B3 A1 02 25         [ 4] 3335 	call relation   
      0091B6 43 84            [ 1] 3336 	cp a,#TK_INTGR 
      0091B7 27 03            [ 1] 3337 	jreq 2$
      0091B7 1F 01 CD         [ 2] 3338 	jp syntax_error
      0012BE                       3339 2$:	
      0091BA 89 E7            [ 1] 3340 	ldw y,x 
      0091BC A1               [ 2] 3341 	popw x   
      0091BD 02               [ 2] 3342 	ldw (x),y   
      0091BE 25               [ 4] 3343 	ret 
                                   3344 
                                   3345 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3346 ; BASIC: LIST [[start][,end]]
                                   3347 ; list program lines 
                                   3348 ; form start to end 
                                   3349 ; if empty argument list then 
                                   3350 ; list all.
                                   3351 ;----------------------------
                           000001  3352 	FIRST=1
                           000003  3353 	LAST=3 
                           000005  3354 	LN_PTR=5
                           000006  3355 	VSIZE=6 
      0012C3                       3356 list:
      0091BF 36 6B 03         [ 2] 3357 	ldw x,txtbgn 
      0091C2 A4 30 A1         [ 2] 3358 	cpw x,txtend 
      0091C5 20 27            [ 1] 3359 	jrmi 1$
      0091C7 07               [ 4] 3360 	ret 
      0012CC                       3361 1$:	
      0012CC                       3362 	_vars VSIZE
      0091C8 55 00            [ 2]    1     sub sp,#VSIZE 
      0091CA 03 00            [ 2] 3363 	ldw (LN_PTR,sp),x 
      0091CC 02               [ 2] 3364 	ldw x,(x) 
      0091CD 20 27            [ 2] 3365 	ldw (FIRST,sp),x ; list from first line 
      0091CF AE 7F FF         [ 2] 3366 	ldw x,#MAX_LINENO ; biggest line number 
      0091CF CD 91            [ 2] 3367 	ldw (LAST,sp),x 
      0091D1 54 A1 84         [ 4] 3368 	call arg_list
      0091D4 27               [ 1] 3369 	tnz a
      0091D5 03 CC            [ 1] 3370 	jreq list_start 
      0091D7 88 F5            [ 1] 3371 	cp a,#2 
      0091D9 90 93            [ 1] 3372 	jreq 4$
      0091DB 1E 01            [ 1] 3373 	cp a,#1 
      0091DD 7B 03            [ 1] 3374 	jreq first_line 
      0091DF A1 20 26         [ 2] 3375 	jp syntax_error 
      0091E2 05               [ 2] 3376 4$:	popw x 
      0091E3 CD 8F            [ 2] 3377 	ldw (LAST+2,sp),x 
      0012EC                       3378 first_line:
      0091E5 80               [ 2] 3379 	popw x
      0091E6 20 CF            [ 2] 3380 	ldw (FIRST,sp),x 
      0012EF                       3381 lines_skip:
      0091E8 A1 21 26         [ 2] 3382 	ldw x,txtbgn
      0091EB 05 CD            [ 2] 3383 2$:	ldw (LN_PTR,sp),x 
      0091ED 90 3C 20         [ 2] 3384 	cpw x,txtend 
      0091F0 C6 CD            [ 1] 3385 	jrpl list_exit 
      0091F2 90               [ 2] 3386 	ldw x,(x) ;line# 
      0091F3 52 20            [ 2] 3387 	cpw x,(FIRST,sp)
      0091F5 C1 1E            [ 1] 3388 	jrpl list_start 
      0091F7 01 A6            [ 2] 3389 	ldw x,(LN_PTR,sp) 
      0091F9 84 02            [ 1] 3390 	ld a,(2,x)
      0091FA C7 00 0D         [ 1] 3391 	ld acc8,a 
      0091FA 5B 03 81 0C      [ 1] 3392 	clr acc16 
      0091FD 72 BB 00 0C      [ 2] 3393 	addw x,acc16
      0091FD 52 03            [ 2] 3394 	jra 2$ 
                                   3395 ; print loop
      00130F                       3396 list_start:
      0091FF CD 91            [ 2] 3397 	ldw x,(LN_PTR,sp)
      009201 AE A1            [ 1] 3398 3$:	ld a,(2,x) 
      009203 02 25 3D         [ 4] 3399 	call prt_basic_line
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009206 1F 01            [ 2] 3400 	ldw x,(LN_PTR,sp)
      009208 CD 89            [ 1] 3401 	ld a,(2,x)
      00920A E7 A1 02         [ 1] 3402 	ld acc8,a 
      00920D 25 30 6B 03      [ 1] 3403 	clr acc16 
      009211 A4 30 A1 10      [ 2] 3404 	addw x,acc16
      009215 27 07 55         [ 2] 3405 	cpw x,txtend 
      009218 00 03            [ 1] 3406 	jrpl list_exit
      00921A 00 02            [ 2] 3407 	ldw (LN_PTR,sp),x
      00921C 20               [ 2] 3408 	ldw x,(x)
      00921D 21 03            [ 2] 3409 	cpw x,(LAST,sp)  
      00921E 2C 04            [ 1] 3410 	jrsgt list_exit 
      00921E CD 91            [ 2] 3411 	ldw x,(LN_PTR,sp)
      009220 AE A1            [ 2] 3412 	jra 3$
      001335                       3413 list_exit:
      001335                       3414 	_drop VSIZE 
      009222 84 27            [ 2]    1     addw sp,#VSIZE 
      009224 03               [ 4] 3415 	ret
                                   3416 
                                   3417 ;-------------------------
                                   3418 ; print counted string 
                                   3419 ; input:
                                   3420 ;   X 	address of string
                                   3421 ;--------------------------
      001338                       3422 prt_cmd_name:
      009225 CC               [ 1] 3423 	ld a,(x)
      009226 88               [ 2] 3424 	incw x
      009227 F5 CF            [ 1] 3425 	and a,#15  
      009229 00               [ 1] 3426 	push a 
      00922A 0D 1E            [ 1] 3427 1$: tnz (1,sp) 
      00922C 01 7B            [ 1] 3428 	jreq 9$
      00922E 03               [ 1] 3429 	ld a,(x)
      00922F A1 10 26         [ 4] 3430 	call putc 
      009232 06               [ 2] 3431 	incw x
      009233 72 BB            [ 1] 3432 	dec (1,sp)	 
      009235 00 0D            [ 2] 3433 	jra 1$
      009237 20               [ 1] 3434 9$: pop a 
      009238 CD               [ 4] 3435 	ret	
                                   3436 
                                   3437 ;--------------------------
                                   3438 ; print TK_QSTR
                                   3439 ; converting control character
                                   3440 ; to backslash sequence
                                   3441 ; input:
                                   3442 ;   X        char *
                                   3443 ;-----------------------------
      00134C                       3444 prt_quote:
      009239 72 B0            [ 1] 3445 	ld a,#'"
      00923B 00 0D 20         [ 4] 3446 	call putc 
      00923E C7               [ 1] 3447 1$:	ld a,(x)
      00923F 1E 01            [ 1] 3448 	jreq 9$
      009241 A6               [ 2] 3449 	incw x 
      009242 84 20            [ 1] 3450 	cp a,#SPACE 
      009243 25 0C            [ 1] 3451 	jrult 3$
      009243 5B 03 81         [ 4] 3452 	call putc
      009246 A1 5C            [ 1] 3453 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009246 52 03            [ 1] 3454 	jrne 1$ 
      001360                       3455 2$:
      009248 CD 91 FD         [ 4] 3456 	call putc 
      00924B A1 02            [ 2] 3457 	jra 1$
      00924D 25               [ 1] 3458 3$: push a 
      00924E 4F 1F            [ 1] 3459 	ld a,#'\
      009250 01 CD 89         [ 4] 3460 	call putc 
      009253 E7               [ 1] 3461 	pop a 
      009254 A1 02            [ 1] 3462 	sub a,#7
      009256 25 42 0D         [ 1] 3463 	ld acc8,a 
      009258 72 5F 00 0C      [ 1] 3464 	clr acc16
      009258 6B 03 A4 30      [ 2] 3465 	ldw y,#escaped 
      00925C A1 30 27 07      [ 2] 3466 	addw y,acc16 
      009260 55 00            [ 1] 3467 	ld a,(y)
      009262 03 00            [ 2] 3468 	jra 2$
      009264 02 20            [ 1] 3469 9$: ld a,#'"
      009266 33 02 A0         [ 4] 3470 	call putc 
      009267 5C               [ 2] 3471 	incw x 
      009267 CD               [ 4] 3472 	ret
                                   3473 
                                   3474 ;--------------------------
                                   3475 ; return variable name 
                                   3476 ; from its address.
                                   3477 ; input:
                                   3478 ;   X    variable address
                                   3479 ; output:
                                   3480 ;   A     variable letter
                                   3481 ;--------------------------
      001388                       3482 var_name:
      009268 91 FD A1         [ 2] 3483 		subw x,#vars 
      00926B 84               [ 1] 3484 		ld a,xl 
      00926C 27               [ 1] 3485 		srl a 
      00926D 03 CC            [ 1] 3486 		add a,#'A 
      00926F 88               [ 4] 3487 		ret 
                                   3488 
                                   3489 
                                   3490 ;--------------------------
                                   3491 ; decompile line from token list 
                                   3492 ; input:
                                   3493 ;   A       stop at this position 
                                   3494 ;   X 		pointer at line
                                   3495 ; output:
                                   3496 ;   none 
                                   3497 ;--------------------------	
                           000001  3498 	BASE_SAV=1
                           000002  3499 	WIDTH_SAV=2
                           000003  3500 	XSAVE=3
                           000005  3501 	LLEN=5
                           000005  3502 	VSIZE=5 
      001390                       3503 prt_basic_line:
      001390                       3504 	_vars VSIZE
      009270 F5 CF            [ 2]    1     sub sp,#VSIZE 
      009272 00 0D            [ 1] 3505 	ld (LLEN,sp),a  
      009274 1E 01 72         [ 1] 3506 	ld a,base
      009277 B0 00            [ 1] 3507 	ld (BASE_SAV,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009279 0D 26 06         [ 1] 3508 	ld a,tab_width 
      00927C 35 02            [ 1] 3509 	ld (WIDTH_SAV,sp),a 
      00927E 00 0E 20         [ 2] 3510 	ldw ptr16,x
      009281 0C               [ 2] 3511 	ldw x,(x)
      009282 35 0A 00 0A      [ 1] 3512 	mov base,#10
      009282 2C 06 35 04      [ 1] 3513 	mov tab_width,#5
      009286 00 0E 20         [ 4] 3514 	call print_int ; print line number 
      009289 04 20            [ 1] 3515 	ld a,#SPACE 
      00928A CD 02 A0         [ 4] 3516 	call putc 
      00928A 35 01 00 0E      [ 1] 3517 	clr tab_width
      00928E AE 00 03         [ 2] 3518 	ldw x,#3
      00928E 5F               [ 1] 3519 1$:	ld a,xl 
      00928F C6 00            [ 1] 3520 	cp a,(LLEN,sp)
      009291 0E 14            [ 1] 3521 	jrmi 2$
      009293 03 4D 27         [ 2] 3522 	jp 20$
      0013C1                       3523 2$:	 
      009296 05 5C 00 17      [ 4] 3524 	ld a,([ptr16],x)
      009298 5C               [ 2] 3525 	incw x 
      009298 20 02            [ 2] 3526 	ldw (XSAVE,sp),x 
      00929A 1E 01 00 17      [ 5] 3527 	ldw x,([ptr16],x)
      00929C 4D               [ 1] 3528 	tnz a 
      00929C A6 84            [ 1] 3529 	jrmi 3$
      00929E A1 02            [ 1] 3530 	cp a,#TK_QSTR 
      00929E 5B 03            [ 1] 3531 	jreq 6$
      0092A0 81 03            [ 1] 3532 	cp a,#TK_CHAR 
      0092A1 27 57            [ 1] 3533 	jreq 7$
      0092A1 AE 92            [ 2] 3534 	jra 8$
                                   3535 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST
      0013D9                       3536 3$:	
      0092A3 BB CD            [ 1] 3537 	cp a,#TK_VAR 
      0092A5 83 33            [ 1] 3538 	jreq 4$
      0092A7 96 1C            [ 1] 3539 	cp a,#TK_INTGR
      0092A9 00 03            [ 1] 3540 	jreq 5$
      0092AB 90 AE 18         [ 2] 3541 	cpw x,#remark 
      0092AE 00 CF            [ 1] 3542 	jrne 30$
      0092B0 00 0D            [ 1] 3543 	ld a,#''
      0092B2 72 B2 00         [ 4] 3544 	call putc 
      0092B5 0D CD            [ 2] 3545 	ldw x,(XSAVE,sp)
      0092B7 83 D5 4F         [ 2] 3546 	addw x,#2
      0092BA 81 0A 63 6F      [ 2] 3547 	addw x,ptr16  
      0092BE 6E 74 65         [ 4] 3548 	call puts 
      0092C1 6E 74 20         [ 2] 3549 	jp 20$ 
      0013FA                       3550 30$:
      0092C4 6F 66            [ 1] 3551 	ld a,#SPACE 
      0092C6 20 73 74         [ 4] 3552 	call putc 
      0092C9 61 63 6B         [ 4] 3553 	call cmd_name
      0092CC 20 66 72         [ 4] 3554 	call prt_cmd_name
      0092CF 6F 6D            [ 1] 3555 	ld a,#SPACE 
      0092D1 20 74 6F         [ 4] 3556 	call putc 
      00140A                       3557 31$:
      0092D4 70 20            [ 2] 3558 	ldw x,(XSAVE,sp)
      0092D6 74 6F 20         [ 2] 3559 	addw x,#2
      0092D9 62 6F            [ 2] 3560 	jra 1$
                                   3561 ;; TK_VAR 
      001411                       3562 4$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3563 ;	ld a,#SPACE 
                                   3564 ;	call putc 
      0092DB 74 74 6F         [ 4] 3565 	call var_name
      0092DE 6D 3A 0A         [ 4] 3566 	call putc 
      0092E1 00 F1            [ 2] 3567 	jra 31$
                                   3568 ;; TK_INTGR
      0092E2                       3569 5$:
                                   3570 ;	ld a,#SPACE 
                                   3571 ;	call putc
      0092E2 35 10 00         [ 4] 3572 	call print_int 
      0092E5 0B 81            [ 2] 3573 	jra 31$
                                   3574 ;; TK_QSTR
      0092E7                       3575 6$:
      0092E7 35 0A            [ 2] 3576 	ldw x,(XSAVE,sp)
      0092E9 00 0B 81 17      [ 2] 3577 	addw x,ptr16 
      0092EC CD 13 4C         [ 4] 3578 	call prt_quote  
      0092EC AE 16 90 72      [ 2] 3579 	subw x,ptr16  
      0092F0 B0 00 1F         [ 2] 3580 	jp 1$
                                   3581 ;; TK_CHAR 
      00142E                       3582 7$:
      0092F3 A6 84            [ 1] 3583 	ld a,#'\ 
      0092F5 81 02 A0         [ 4] 3584 	call putc 
      0092F6 9E               [ 1] 3585 	ld a,xh 
      0092F6 AE 16 90         [ 4] 3586 	call putc 
      0092F9 72 B0            [ 2] 3587 	ldw x,(XSAVE,sp)
      0092FB 00               [ 2] 3588 	incw x 
      0092FC 1F 90 CE         [ 2] 3589 	jp 1$ 
      0092FF 00 05            [ 1] 3590 8$: cp a,#TK_COLON 
      009301 90 C3            [ 1] 3591 	jrne 9$
      009303 00 1F            [ 1] 3592 	ld a,#':
      001443                       3593 81$:
      009305 25 0A 3B         [ 4] 3594 	call putc
      001446                       3595 82$:
      009308 00 04            [ 2] 3596 	ldw x,(XSAVE,sp)
      00930A 4B 00 72         [ 2] 3597 	jp 1$ 
      00144B                       3598 9$: 
      00930D F0 01            [ 1] 3599 	cp a,#TK_SHARP
      00930F 5B 02            [ 1] 3600 	jrugt 10$ 
      009311 54 CF            [ 1] 3601 	sub a,#TK_ARRAY 
      009313 00 22            [ 1] 3602 	clrw y 
      009315 A6 84            [ 1] 3603 	ld yl,a
      009317 81 A9 14 A1      [ 2] 3604 	addw y,#single_char 
      009318 90 F6            [ 1] 3605 	ld a,(y)
      009318 CD 89            [ 2] 3606 	jra 81$ 
      00145D                       3607 10$: 
      00931A E7 A1            [ 1] 3608 	cp a,#TK_MINUS 
      00931C 85 27            [ 1] 3609 	jrugt 11$
      00931E 0A A1            [ 1] 3610 	sub a,#TK_PLUS 
      009320 06 27            [ 1] 3611 	clrw y 
      009322 03 CC            [ 1] 3612 	ld yl,a 
      009324 88 F5 14 A6      [ 2] 3613 	addw y,#add_char 
      009326 90 F6            [ 1] 3614 	ld a,(y)
      009326 CD 91            [ 2] 3615 	jra 81$
      00146F                       3616 11$:
      009328 2F 22            [ 1] 3617     cp a,#TK_MOD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009329 22 0E            [ 1] 3618 	jrugt 12$
      009329 89 CD            [ 1] 3619 	sub a,#TK_MULT
      00932B 89 E7            [ 1] 3620 	clrw y 
      00932D A1 32            [ 1] 3621 	ld yl,a 
      00932F 27 03 CC 88      [ 2] 3622 	addw y,#mul_char
      009333 F5 F6            [ 1] 3623 	ld a,(y)
      009334 20 C2            [ 2] 3624 	jra 81$
      001481                       3625 12$:
      009334 CD 92            [ 1] 3626 	sub a,#TK_GT  
      009336 46               [ 1] 3627 	sll a 
      009337 A1               [ 1] 3628 	clrw x 
      009338 84               [ 1] 3629 	ld xl,a 
      009339 27 03 CC         [ 2] 3630 	addw x,#relop_str 
      00933C 88               [ 2] 3631 	ldw x,(x)
      00933D F5 02 B3         [ 4] 3632 	call puts 
      00933E 20 B7            [ 2] 3633 	jra 82$
      00148F                       3634 20$: 
      00933E 90 93            [ 1] 3635 	ld a,#CR 
      009340 85 FF 81         [ 4] 3636 	call putc
      009343 7B 02            [ 1] 3637 	ld a,(WIDTH_SAV,sp) 
      009343 CE 00 1D         [ 1] 3638 	ld tab_width,a 
      009346 C3 00            [ 1] 3639 	ld a,(BASE_SAV,sp) 
      009348 1F 2B 01         [ 1] 3640 	ld base,a
      00149E                       3641 	_drop VSIZE 
      00934B 81 05            [ 2]    1     addw sp,#VSIZE 
      00934C 81               [ 4] 3642 	ret 
                                   3643 
      00934C 52 06 1F 05 FE        3644 single_char: .byte '@','(',')',',','#'
      009351 1F 01                 3645 add_char: .byte '+','-'
      009353 AE 7F FF              3646 mul_char: .byte '*','/','%'
      009356 1F 03 CD 91 04 4D 27  3647 relop_str: .word gt,equal,ge,lt,le,ne 
             31 A1 02 27 07
      009362 A1 01                 3648 gt: .asciz ">"
      009364 27 06                 3649 equal: .asciz "="
      009366 CC 88 F5              3650 ge: .asciz ">="
      009369 85 1F                 3651 lt: .asciz "<"
      00936B 05 3D 00              3652 le: .asciz "<="
      00936C 3C 3E 00              3653 ne:  .asciz "<>"
                                   3654 
                                   3655 
                                   3656 ;---------------------------------
                                   3657 ; BASIC: PRINT|? arg_list 
                                   3658 ; print values from argument list
                                   3659 ;----------------------------------
                           000001  3660 	COMMA=1
                           000001  3661 	VSIZE=1
      0014C6                       3662 print:
      00936C 85 1F            [ 1] 3663 push #0 ; local variable COMMA 
      0014C8                       3664 reset_comma:
      00936E 01 01            [ 1] 3665 	clr (COMMA,sp)
      00936F                       3666 prt_loop:
      00936F CE 00 1D         [ 4] 3667 	call next_token
      009372 1F 05            [ 1] 3668 	cp a,#CMD_END 
      009374 C3 00            [ 1] 3669 	jrult print_exit ; colon or end of line 
      009376 1F 2A            [ 1] 3670 	cp a,#TK_QSTR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009378 3C FE            [ 1] 3671 	jreq 1$
      00937A 13 01            [ 1] 3672 	cp a,#TK_CHAR 
      00937C 2A 11            [ 1] 3673 	jreq 2$ 
      00937E 1E 05            [ 1] 3674 	cp a,#TK_CFUNC 
      009380 E6 02            [ 1] 3675 	jreq 3$
      009382 C7 00            [ 1] 3676 	cp a,#TK_COMMA 
      009384 0E 72            [ 1] 3677 	jreq 4$
      009386 5F 00            [ 1] 3678 	cp a,#TK_SHARP 
      009388 0D 72            [ 1] 3679 	jreq 5$
      00938A BB 00            [ 2] 3680 	jra 7$ 
      0014E7                       3681 1$:	; print string 
      00938C 0D 20 E3         [ 4] 3682 	call puts
      00938F 20 DC            [ 2] 3683 	jra reset_comma
      0014EC                       3684 2$:	; print character 
      00938F 1E               [ 1] 3685 	ld a,xl 
      009390 05 E6 02         [ 4] 3686 	call putc 
      009393 CD 94            [ 2] 3687 	jra reset_comma 
      0014F2                       3688 3$: ; print character function value  	
      009395 10               [ 4] 3689 	call (x)
      009396 1E               [ 1] 3690 	ld a,xl 
      009397 05 E6 02         [ 4] 3691 	call putc
      00939A C7 00            [ 2] 3692 	jra reset_comma 
      0014F9                       3693 4$: ; set comma state 
      00939C 0E 72            [ 1] 3694 	ld a,#255 
      00939E 5F 00            [ 1] 3695 	ld (COMMA,sp),a  
      0093A0 0D 72 BB         [ 2] 3696 	jp prt_loop   
      001500                       3697 5$: ; # character must be followed by an integer   
      0093A3 00 0D C3         [ 4] 3698 	call next_token
      0093A6 00 1F            [ 1] 3699 	cp a,#TK_INTGR 
      0093A8 2A 0B            [ 1] 3700 	jreq 6$
      0093AA 1F 05 FE         [ 2] 3701 	jp syntax_error 
      00150A                       3702 6$: ; set tab width
      0093AD 13               [ 1] 3703 	ld a,xl 
      0093AE 03 2C            [ 1] 3704 	and a,#15 
      0093B0 04 1E 05         [ 1] 3705 	ld tab_width,a 
      0093B3 20 DC            [ 2] 3706 	jra reset_comma 
      0093B5                       3707 7$:	
      001512                       3708 	_unget_token
      0093B5 5B 06 81 00 01   [ 1]    1     mov in,in.saved
      0093B8 CD 11 C6         [ 4] 3709 	call relation 
      0093B8 F6 5C            [ 1] 3710 	cp a,#TK_INTGR
      0093BA A4 0F            [ 1] 3711 	jreq 8$
      00151E                       3712 	_unget_token
      0093BC 88 0D 01 27 09   [ 1]    1     mov in,in.saved
      0093C1 F6 CD 83         [ 2] 3713 	jp print_exit 
      0093C4 20 5C 0A         [ 4] 3714 8$: call print_int 
      0093C7 01 20            [ 2] 3715 	jra reset_comma 
      00152B                       3716 print_exit:
      0093C9 F3 84            [ 1] 3717 	tnz (COMMA,sp)
      0093CB 81 05            [ 1] 3718 	jrne 9$
      0093CC A6 0D            [ 1] 3719 	ld a,#CR 
      0093CC A6 22 CD         [ 4] 3720     call putc 
      001534                       3721 9$:	_drop VSIZE 
      0093CF 83 20            [ 2]    1     addw sp,#VSIZE 
      0093D1 F6               [ 4] 3722 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3723 
      001537                       3724 print_type: 
                                   3725 
                                   3726 ;----------------------
                                   3727 ; 'save_context' and
                                   3728 ; 'rest_context' must be 
                                   3729 ; called at the same 
                                   3730 ; call stack depth 
                                   3731 ; i.e. SP must have the 
                                   3732 ; save value at  
                                   3733 ; entry point of both 
                                   3734 ; routine. 
                                   3735 ;---------------------
                           000004  3736 	CTXT_SIZE=4 ; size of saved data 
                                   3737 ;--------------------
                                   3738 ; save current BASIC
                                   3739 ; interpreter context 
                                   3740 ; on stack 
                                   3741 ;--------------------
      001537                       3742 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001537                       3743 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001537                       3744 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001537                       3745 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001537                       3746 save_context:
      0093D2 27 2D 5C         [ 2] 3747 	ldw x,basicptr 
      0093D5 A1 20            [ 2] 3748 	ldw (BPTR,sp),x
      0093D7 25 0C CD         [ 1] 3749 	ld a,in 
      0093DA 83 20            [ 1] 3750 	ld (IN,sp),a
      0093DC A1 5C 26         [ 1] 3751 	ld a,count 
      0093DF F1 06            [ 1] 3752 	ld (CNT,sp),a  
      0093E0 81               [ 4] 3753 	ret
                                   3754 
                                   3755 ;-----------------------
                                   3756 ; restore previously saved 
                                   3757 ; BASIC interpreter context 
                                   3758 ; from stack 
                                   3759 ;-------------------------
      001547                       3760 rest_context:
      0093E0 CD 83            [ 2] 3761 	ldw x,(BPTR,sp)
      0093E2 20 20 EC         [ 2] 3762 	ldw basicptr,x 
      0093E5 88 A6            [ 1] 3763 	ld a,(IN,sp)
      0093E7 5C CD 83         [ 1] 3764 	ld in,a
      0093EA 20 84            [ 1] 3765 	ld a,(CNT,sp)
      0093EC A0 07 C7         [ 1] 3766 	ld count,a  
      0093EF 00               [ 4] 3767 	ret
                                   3768 
                                   3769 
                                   3770 
                                   3771 ;------------------------------------------
                                   3772 ; BASIC: INPUT [string]var[,[string]var]
                                   3773 ; input value in variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3774 ; [string] optionally can be used as prompt 
                                   3775 ;-----------------------------------------
                           000001  3776 	CX_BPTR=1
                           000003  3777 	CX_IN=3
                           000004  3778 	CX_CNT=4
                           000005  3779 	SKIP=5
                           000006  3780 	VAR_ADDR=6
                           000007  3781 	VSIZE=7
      001557                       3782 input_var:
      001557                       3783 	_vars VSIZE 
      0093F0 0E 72            [ 2]    1     sub sp,#VSIZE 
      001559                       3784 input_loop:
      0093F2 5F 00            [ 1] 3785 	clr (SKIP,sp)
      0093F4 0D 90 AE         [ 4] 3786 	call next_token 
      0093F7 8C 22            [ 1] 3787 	cp a,#TK_QSTR 
      0093F9 72 B9            [ 1] 3788 	jrne 1$ 
      0093FB 00 0D 90         [ 4] 3789 	call puts 
      0093FE F6 20            [ 1] 3790 	cpl (SKIP,sp)
      009400 DF A6 22         [ 4] 3791 	call next_token 
      009403 CD 83            [ 1] 3792 1$: cp a,#TK_VAR  
      009405 20 5C            [ 1] 3793 	jreq 2$ 
      009407 81 08 75         [ 2] 3794 	jp syntax_error
      009408 1F 06            [ 2] 3795 2$:	ldw (VAR_ADDR,sp),x 
      009408 1D 00            [ 1] 3796 	tnz (SKIP,sp)
      00940A 27 9F            [ 1] 3797 	jrne 21$ 
      00940C 44 AB 41         [ 4] 3798 	call var_name 
      00940F 81 02 A0         [ 4] 3799 	call putc   
      009410                       3800 21$:
      009410 52 05            [ 1] 3801 	ld a,#':
      009412 6B 05 C6         [ 4] 3802 	call putc 
      009415 00 0B 6B         [ 4] 3803 	call save_context 
      009418 01 C6 00 25      [ 1] 3804 	clr count  
      00941C 6B 02 CF         [ 4] 3805 	call readln 
      00941F 00 18 FE         [ 2] 3806 	ldw x,#tib 
      009422 35 0A 00         [ 1] 3807 	push count
      009425 0B 35            [ 1] 3808 	push #0 
      009427 05 00 25         [ 2] 3809 	addw x,(1,sp)
      00942A CD               [ 2] 3810 	incw x 
      001598                       3811 	_drop 2 
      00942B 8A 3C            [ 2]    1     addw sp,#2 
      00942D A6 20 CD 83      [ 1] 3812 	clr in 
      009431 20 72 5F         [ 4] 3813 	call get_token
      009434 00 25            [ 1] 3814 	cp a,#TK_INTGR
      009436 AE 00            [ 1] 3815 	jreq 3$ 
      009438 03 9F 11         [ 4] 3816 	call rest_context 
      00943B 05 2B 03         [ 2] 3817 	jp syntax_error
      00943E CC 95            [ 2] 3818 3$: ldw y,(VAR_ADDR,sp) 
      009440 0F FF            [ 2] 3819 	ldw (y),x 
      009441 CD 15 47         [ 4] 3820 	call rest_context
      009441 72 D6 00         [ 4] 3821 	call next_token 
      009444 18 5C            [ 1] 3822 	cp a,#TK_COMMA 
      009446 1F 03            [ 1] 3823 	jreq input_loop 
      009448 72 DE            [ 1] 3824 	cp a,#TK_COLON 
      00944A 00 18            [ 2] 3825     jrule input_exit 
      00944C 4D 2B 0A         [ 2] 3826 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0015C0                       3827 input_exit:
      0015C0                       3828 	_drop VSIZE 
      00944F A1 02            [ 2]    1     addw sp,#VSIZE 
      009451 27               [ 4] 3829 	ret 
                                   3830 
                                   3831 
                                   3832 ;---------------------
                                   3833 ; BASIC: REMARK | ' 
                                   3834 ; skip comment to end of line 
                                   3835 ;---------------------- 
      0015C3                       3836 remark:
      009452 4B A1 03 27 57   [ 1] 3837 	mov in,count 
      009457 20               [ 4] 3838  	ret 
                                   3839 
                                   3840 
                                   3841 ;---------------------
                                   3842 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3843 ; read in loop 'addr'  
                                   3844 ; apply & 'mask' to value 
                                   3845 ; loop while result==0.  
                                   3846 ; 'xor_mask' is used to 
                                   3847 ; invert the wait logic.
                                   3848 ; i.e. loop while not 0.
                                   3849 ;---------------------
                           000001  3850 	XMASK=1 
                           000002  3851 	MASK=2
                           000003  3852 	ADDR=3
                           000004  3853 	VSIZE=4
      0015C9                       3854 wait: 
      0015C9                       3855 	_vars VSIZE
      009458 64 04            [ 2]    1     sub sp,#VSIZE 
      009459 0F 01            [ 1] 3856 	clr (XMASK,sp) 
      009459 A1 85 27         [ 4] 3857 	call arg_list 
      00945C 34 A1            [ 1] 3858 	cp a,#2
      00945E 84 27            [ 1] 3859 	jruge 0$
      009460 38 A3 96         [ 2] 3860 	jp syntax_error 
      009463 43 26            [ 1] 3861 0$:	cp a,#3
      009465 14 A6            [ 1] 3862 	jrult 1$
      009467 27               [ 2] 3863 	popw x 
      009468 CD               [ 1] 3864 	ld a,xl
      009469 83 20            [ 1] 3865 	ld (XMASK,sp),a 
      00946B 1E               [ 2] 3866 1$: popw x ; mask 
      00946C 03               [ 1] 3867 	ld a,xl 
      00946D 1C 00            [ 1] 3868 	ld (MASK,sp),a 
      00946F 02               [ 2] 3869 	popw x ; address 
      009470 72               [ 1] 3870 2$:	ld a,(x)
      009471 BB 00            [ 1] 3871 	and a,(MASK,sp)
      009473 18 CD            [ 1] 3872 	xor a,(XMASK,sp)
      009475 83 33            [ 1] 3873 	jreq 2$ 
      0015EB                       3874 	_drop VSIZE 
      009477 CC 95            [ 2]    1     addw sp,#VSIZE 
      009479 0F               [ 4] 3875 	ret 
                                   3876 
                                   3877 ;---------------------
                                   3878 ; BASIC: BSET addr,mask
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3879 ; set bits at 'addr' corresponding 
                                   3880 ; to those of 'mask' that are at 1.
                                   3881 ; arguments:
                                   3882 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3883 ;   mask        mask|addr
                                   3884 ; output:
                                   3885 ;	none 
                                   3886 ;--------------------------
      00947A                       3887 bit_set:
      00947A A6 20 CD         [ 4] 3888 	call arg_list 
      00947D 83 20            [ 1] 3889 	cp a,#2	 
      00947F CD 90            [ 1] 3890 	jreq 1$ 
      009481 73 CD 93         [ 2] 3891 	jp syntax_error
      0015F8                       3892 1$: 
      009484 B8               [ 2] 3893 	popw x ; mask 
      009485 A6               [ 1] 3894 	ld a,xl 
      009486 20               [ 2] 3895 	popw x ; addr  
      009487 CD               [ 1] 3896 	or a,(x)
      009488 83               [ 1] 3897 	ld (x),a
      009489 20               [ 4] 3898 	ret 
                                   3899 
                                   3900 ;---------------------
                                   3901 ; BASIC: BRES addr,mask
                                   3902 ; reset bits at 'addr' corresponding 
                                   3903 ; to those of 'mask' that are at 1.
                                   3904 ; arguments:
                                   3905 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3906 ;   mask	    ~mask&*addr  
                                   3907 ; output:
                                   3908 ;	none 
                                   3909 ;--------------------------
      00948A                       3910 bit_reset:
      00948A 1E 03 1C         [ 4] 3911 	call arg_list 
      00948D 00 02            [ 1] 3912 	cp a,#2  
      00948F 20 A8            [ 1] 3913 	jreq 1$ 
      009491 CC 08 75         [ 2] 3914 	jp syntax_error
      001608                       3915 1$: 
      009491 CD               [ 2] 3916 	popw x ; mask 
      009492 94               [ 1] 3917 	ld a,xl 
      009493 08               [ 1] 3918 	cpl a 
      009494 CD               [ 2] 3919 	popw x ; addr  
      009495 83               [ 1] 3920 	and a,(x)
      009496 20               [ 1] 3921 	ld (x),a 
      009497 20               [ 4] 3922 	ret 
                                   3923 
                                   3924 ;---------------------
                                   3925 ; BASIC: BTOGL addr,mask
                                   3926 ; toggle bits at 'addr' corresponding 
                                   3927 ; to those of 'mask' that are at 1.
                                   3928 ; arguments:
                                   3929 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3930 ;   mask	    mask^*addr  
                                   3931 ; output:
                                   3932 ;	none 
                                   3933 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00160F                       3934 bit_toggle:
      009498 F1 10 84         [ 4] 3935 	call arg_list 
      009499 A1 02            [ 1] 3936 	cp a,#2 
      009499 CD 8A            [ 1] 3937 	jreq 1$ 
      00949B 3C 20 EC         [ 2] 3938 	jp syntax_error
      00949E 85               [ 2] 3939 1$: popw x ; mask 
      00949E 1E               [ 1] 3940 	ld a,xl 
      00949F 03               [ 2] 3941 	popw x ; addr  
      0094A0 72               [ 1] 3942 	xor a,(x)
      0094A1 BB               [ 1] 3943 	ld (x),a 
      0094A2 00               [ 4] 3944 	ret 
                                   3945 
                                   3946 
                                   3947 ;---------------------
                                   3948 ; BASIC: BTEST(addr,bit)
                                   3949 ; return bit value at 'addr' 
                                   3950 ; bit is in range {0..7}.
                                   3951 ; arguments:
                                   3952 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3953 ;   bit 	    bit position {0..7}  
                                   3954 ; output:
                                   3955 ;	none 
                                   3956 ;--------------------------
      00161F                       3957 bit_test:
      0094A3 18 CD 93         [ 4] 3958 	call func_args 
      0094A6 CC 72            [ 1] 3959 	cp a,#2
      0094A8 B0 00            [ 1] 3960 	jreq 0$
      0094AA 18 CC 94         [ 2] 3961 	jp syntax_error
      001629                       3962 0$:	
      0094AD 39               [ 2] 3963 	popw x 
      0094AE 9F               [ 1] 3964 	ld a,xl 
      0094AE A6 5C            [ 1] 3965 	and a,#7
      0094B0 CD               [ 1] 3966 	push a   
      0094B1 83 20            [ 1] 3967 	ld a,#1 
      0094B3 9E CD            [ 1] 3968 1$: tnz (1,sp)
      0094B5 83 20            [ 1] 3969 	jreq 2$
      0094B7 1E               [ 1] 3970 	sll a 
      0094B8 03 5C            [ 1] 3971 	dec (1,sp)
      0094BA CC 94            [ 2] 3972 	jra 1$
      001639                       3973 2$: _drop 1 
      0094BC 39 A1            [ 2]    1     addw sp,#1 
      0094BE 01               [ 2] 3974 	popw x 
      0094BF 26               [ 1] 3975 	and a,(x)
      0094C0 0A A6            [ 1] 3976 	jreq 3$
      0094C2 3A 01            [ 1] 3977 	ld a,#1 
      0094C3 5F               [ 1] 3978 3$:	clrw x 
      0094C3 CD               [ 1] 3979 	ld xl,a 
      0094C4 83 20            [ 1] 3980 	ld a,#TK_INTGR
      0094C6 81               [ 4] 3981 	ret
                                   3982 
                                   3983 
                                   3984 ;--------------------
                                   3985 ; BASIC: POKE addr,byte
                                   3986 ; put a byte at addr 
                                   3987 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      001646                       3988 poke:
      0094C6 1E 03 CC         [ 4] 3989 	call arg_list 
      0094C9 94 39            [ 1] 3990 	cp a,#2
      0094CB 27 03            [ 1] 3991 	jreq 1$
      0094CB A1 0A 22         [ 2] 3992 	jp syntax_error
      001650                       3993 1$:	
      0094CE 0E               [ 2] 3994 	popw x  
      0094CF A0               [ 1] 3995     ld a,xl 
      0094D0 06               [ 2] 3996 	popw x 
      0094D1 90               [ 1] 3997 	ld (x),a 
      0094D2 5F               [ 4] 3998 	ret 
                                   3999 
                                   4000 ;-----------------------
                                   4001 ; BASIC: PEEK(addr)
                                   4002 ; get the byte at addr 
                                   4003 ; input:
                                   4004 ;	none 
                                   4005 ; output:
                                   4006 ;	X 		value 
                                   4007 ;-----------------------
      001655                       4008 peek:
      0094D3 90 97 72         [ 4] 4009 	call func_args
      0094D6 A9 95            [ 1] 4010 	cp a,#1 
      0094D8 21 90            [ 1] 4011 	jreq 1$
      0094DA F6 20 E6         [ 2] 4012 	jp syntax_error
      0094DD 85               [ 2] 4013 1$: popw x 
      0094DD A1               [ 1] 4014 	ld a,(x)
      0094DE 11               [ 1] 4015 	clrw x 
      0094DF 22               [ 1] 4016 	ld xl,a 
      0094E0 0E A0            [ 1] 4017 	ld a,#TK_INTGR
      0094E2 10               [ 4] 4018 	ret 
                                   4019 
                                   4020 ;---------------------------
                                   4021 ; BASIC IF expr : instructions
                                   4022 ; evaluate expr and if true 
                                   4023 ; execute instructions on same line. 
                                   4024 ;----------------------------
      001666                       4025 if: 
      0094E3 90 5F 90         [ 4] 4026 	call relation 
      0094E6 97 72            [ 1] 4027 	cp a,#TK_INTGR
      0094E8 A9 95            [ 1] 4028 	jreq 1$ 
      0094EA 26 90 F6         [ 2] 4029 	jp syntax_error
      0094ED 20               [ 1] 4030 1$:	clr a 
      0094EE D4               [ 2] 4031 	tnzw x 
      0094EF 26 05            [ 1] 4032 	jrne 9$  
                                   4033 ;skip to next line
      0094EF A1 22 22 0E A0   [ 1] 4034 	mov in,count
      0094F4 20               [ 4] 4035 9$:	ret 
                                   4036 
                                   4037 ;------------------------
                                   4038 ; BASIC: FOR var=expr 
                                   4039 ; set variable to expression 
                                   4040 ; leave variable address 
                                   4041 ; on stack and set
                                   4042 ; FLOOP bit in 'flags'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4043 ;-----------------
                           000001  4044 	RETL1=1 ; return address  
                           000003  4045 	FSTEP=3  ; variable increment
                           000005  4046 	LIMIT=5 ; loop limit 
                           000007  4047 	CVAR=7   ; control variable 
                           000009  4048 	INW=9   ;  in.w saved
                           00000B  4049 	BPTR=11 ; baseptr saved
                           00000A  4050 	VSIZE=10  
      00167A                       4051 for: ; { -- var_addr }
      0094F5 90               [ 2] 4052 	popw x ; call return address 
      00167B                       4053 	_vars VSIZE 
      0094F6 5F 90            [ 2]    1     sub sp,#VSIZE 
      0094F8 97               [ 2] 4054 	pushw x  ; RETL1 
      0094F9 72 A9            [ 1] 4055 	ld a,#TK_VAR 
      0094FB 95 28 90         [ 4] 4056 	call expect
      0094FE F6 20            [ 2] 4057 	ldw (CVAR,sp),x  ; control variable 
      009500 C2 12 A9         [ 4] 4058 	call let_var 
      009501 72 14 00 23      [ 1] 4059 	bset flags,#FLOOP 
                                   4060 ; open space on stack for loop data 
      009501 A0               [ 1] 4061 	clrw x 
      009502 31 48            [ 2] 4062 	ldw (BPTR,sp),x 
      009504 5F 97            [ 2] 4063 	ldw (INW,sp),x 
      009506 1C 95 2B         [ 4] 4064 	call next_token 
      009509 FE CD            [ 1] 4065 	cp a,#TK_CMD 
      00950B 83 33            [ 1] 4066 	jreq 1$
      00950D 20 B7 75         [ 2] 4067 	jp syntax_error
      00950F                       4068 1$:  
      00950F A6 0D CD         [ 2] 4069 	cpw x,#to 
      009512 83 20            [ 1] 4070 	jreq to
      009514 7B 02 C7         [ 2] 4071 	jp syntax_error 
                                   4072 
                                   4073 ;-----------------------------------
                                   4074 ; BASIC: TO expr 
                                   4075 ; second part of FOR loop initilization
                                   4076 ; leave limit on stack and set 
                                   4077 ; FTO bit in 'flags'
                                   4078 ;-----------------------------------
      0016A3                       4079 to: ; { var_addr -- var_addr limit step }
      009517 00 25 7B 01 C7   [ 2] 4080 	btjt flags,#FLOOP,1$
      00951C 00 0B 5B         [ 2] 4081 	jp syntax_error
      00951F 05 81 40         [ 4] 4082 1$: call relation  
      009522 28 29            [ 1] 4083 	cp a,#TK_INTGR 
      009524 2C 23            [ 1] 4084 	jreq 2$ 
      009526 2B 2D 2A         [ 2] 4085 	jp syntax_error
      009529 2F 25            [ 2] 4086 2$: ldw (LIMIT,sp),x
                                   4087 ;	ldw x,in.w 
      00952B 95 37 95         [ 4] 4088 	call next_token
      00952E 39 95            [ 1] 4089 	cp a,#TK_NONE  
      009530 3B 95            [ 1] 4090 	jreq 4$ 
      009532 3E 95            [ 1] 4091 	cp a,#TK_CMD
      009534 40 95            [ 1] 4092 	jrne 3$
      009536 43 3E 00         [ 2] 4093 	cpw x,#step 
      009539 3D 00            [ 1] 4094 	jreq step
      0016C7                       4095 3$:	
      0016C7                       4096 	_unget_token   	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00953B 3E 3D 00 3C 00   [ 1]    1     mov in,in.saved
      0016CC                       4097 4$:	
      009540 3C 3D 00         [ 2] 4098 	ldw x,#1   ; default step  
      009543 3C 3E            [ 2] 4099 	ldw (FSTEP,sp),x 
      009545 00 14            [ 2] 4100 	jra store_loop_addr 
                                   4101 
                                   4102 
                                   4103 ;----------------------------------
                                   4104 ; BASIC: STEP expr 
                                   4105 ; optional third par of FOR loop
                                   4106 ; initialization. 	
                                   4107 ;------------------------------------
      009546                       4108 step: ; {var limit -- var limit step}
      009546 4B 00 00 23 03   [ 2] 4109 	btjt flags,#FLOOP,1$
      009548 CC 08 75         [ 2] 4110 	jp syntax_error
      009548 0F 01 C6         [ 4] 4111 1$: call relation
      00954A A1 84            [ 1] 4112 	cp a,#TK_INTGR
      00954A CD 89            [ 1] 4113 	jreq 2$
      00954C E7 A1 02         [ 2] 4114 	jp syntax_error
      00954F 25 5A            [ 2] 4115 2$:	ldw (FSTEP,sp),x ; step
                                   4116 ; leave loop back entry point on cstack 
                                   4117 ; cstack is 1 call deep from interpreter
      0016E7                       4118 store_loop_addr:
      009551 A1 02 27         [ 2] 4119 	ldw x,basicptr  
      009554 12 A1            [ 2] 4120 	ldw (BPTR,sp),x 
      009556 03 27 13         [ 2] 4121 	ldw x,in.w 
      009559 A1 82            [ 2] 4122 	ldw (INW,sp),x   
      00955B 27 15 A1 09      [ 1] 4123 	bres flags,#FLOOP 
      00955F 27 18 A1 0A      [ 1] 4124 	inc loop_depth  
      009563 27               [ 4] 4125 	ret 
                                   4126 
                                   4127 ;--------------------------------
                                   4128 ; BASIC: NEXT var 
                                   4129 ; FOR loop control 
                                   4130 ; increment variable with step 
                                   4131 ; and compare with limit 
                                   4132 ; loop if threshold not crossed.
                                   4133 ; else stack. 
                                   4134 ; and decrement 'loop_depth' 
                                   4135 ;--------------------------------
      0016FA                       4136 next: ; {var limit step retl1 -- [var limit step ] }
      009564 1B 20 2B 20      [ 1] 4137 	tnz loop_depth 
      009567 26 03            [ 1] 4138 	jrne 1$ 
      009567 CD 83 33         [ 2] 4139 	jp syntax_error 
      001703                       4140 1$: 
      00956A 20 DC            [ 1] 4141 	ld a,#TK_VAR 
      00956C CD 10 72         [ 4] 4142 	call expect
                                   4143 ; check for good variable after NEXT 	 
      00956C 9F CD            [ 2] 4144 	cpw x,(CVAR,sp)
      00956E 83 20            [ 1] 4145 	jreq 2$  
      009570 20 D6 75         [ 2] 4146 	jp syntax_error ; not the good one 
      009572                       4147 2$: ; increment variable 
      009572 FD               [ 2] 4148 	ldw x,(x)  ; get var value 
      009573 9F CD 83         [ 2] 4149 	addw x,(FSTEP,sp) ; var+step 
      009576 20 20            [ 2] 4150 	ldw y,(CVAR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009578 CF FF            [ 2] 4151 	ldw (y),x ; save var new value 
                                   4152 ; check sign of STEP  
      009579 A6 80            [ 1] 4153 	ld a,#0x80
      009579 A6 FF            [ 1] 4154 	bcp a,(FSTEP,sp)
      00957B 6B 01            [ 1] 4155 	jrpl 4$
                                   4156 ;negative step 
      00957D CC 95            [ 2] 4157 	cpw x,(LIMIT,sp)
      00957F 4A 1B            [ 1] 4158 	jrslt loop_done
      009580 20 04            [ 2] 4159 	jra loop_back 
      001723                       4160 4$: ; positive step
      009580 CD 89            [ 2] 4161 	cpw x,(LIMIT,sp)
      009582 E7 A1            [ 1] 4162 	jrsgt loop_done
      001727                       4163 loop_back:
      009584 84 27            [ 2] 4164 	ldw x,(BPTR,sp)
      009586 03 CC 88         [ 2] 4165 	ldw basicptr,x 
      009589 F5 01 00 23 05   [ 2] 4166 	btjf flags,#FRUN,1$ 
      00958A E6 02            [ 1] 4167 	ld a,(2,x)
      00958A 9F A4 0F         [ 1] 4168 	ld count,a
      00958D C7 00            [ 2] 4169 1$:	ldw x,(INW,sp)
      00958F 25 20 B6         [ 2] 4170 	ldw in.w,x 
      009592 81               [ 4] 4171 	ret 
      00173C                       4172 loop_done:
                                   4173 	; remove loop data from stack  
      009592 55               [ 2] 4174 	popw x
      00173D                       4175 	_drop VSIZE 
      009593 00 03            [ 2]    1     addw sp,#VSIZE 
      009595 00 02 CD 92      [ 1] 4176 	dec loop_depth 
                                   4177 ;	pushw x 
                                   4178 ;	ret 
      009599 46               [ 2] 4179 	jp (x)
                                   4180 
                                   4181 ;----------------------------
                                   4182 ; called by goto/gosub
                                   4183 ; to get target line number 
                                   4184 ;---------------------------
      001744                       4185 get_target_line:
      00959A A1 84 27         [ 4] 4186 	call relation 
      00959D 08 55            [ 1] 4187 	cp a,#TK_INTGR
      00959F 00 03            [ 1] 4188 	jreq 1$
      0095A1 00 02 CC         [ 2] 4189 	jp syntax_error
      0095A4 95 AB CD         [ 4] 4190 1$:	call search_lineno  
      0095A7 8A               [ 2] 4191 	tnzw x 
      0095A8 3C 20            [ 1] 4192 	jrne 2$ 
      0095AA 9D 05            [ 1] 4193 	ld a,#ERR_NO_LINE 
      0095AB CC 08 77         [ 2] 4194 	jp tb_error 
      0095AB 0D               [ 4] 4195 2$:	ret 
                                   4196 
                                   4197 ;------------------------
                                   4198 ; BASIC: GOTO line# 
                                   4199 ; jump to line# 
                                   4200 ; here cstack is 2 call deep from interpreter 
                                   4201 ;------------------------
      00175A                       4202 goto:
      0095AC 01 26 05 A6 0D   [ 2] 4203 	btjt flags,#FRUN,0$ 
      0095B1 CD 83            [ 1] 4204 	ld a,#ERR_RUN_ONLY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0095B3 20 5B 01         [ 2] 4205 	jp tb_error 
      0095B6 81               [ 4] 4206 	ret 
      0095B7 CD 17 44         [ 4] 4207 0$:	call get_target_line
      0095B7                       4208 jp_to_target:
      0095B7 CE 00 05         [ 2] 4209 	ldw basicptr,x 
      0095BA 1F 03            [ 1] 4210 	ld a,(2,x)
      0095BC C6 00 02         [ 1] 4211 	ld count,a 
      0095BF 6B 05 C6 00      [ 1] 4212 	mov in,#3 
      0095C3 04               [ 4] 4213 	ret 
                                   4214 
                                   4215 
                                   4216 ;--------------------
                                   4217 ; BASIC: GOSUB line#
                                   4218 ; basic subroutine call
                                   4219 ; actual line# and basicptr 
                                   4220 ; are saved on cstack
                                   4221 ; here cstack is 2 call deep from interpreter 
                                   4222 ;--------------------
                           000003  4223 	RET_ADDR=3
                           000005  4224 	RET_INW=5
                           000004  4225 	VSIZE=4  
      001775                       4226 gosub:
      0095C4 6B 06 81 23 06   [ 2] 4227 	btjt flags,#FRUN,0$ 
      0095C7 A6 06            [ 1] 4228 	ld a,#ERR_RUN_ONLY
      0095C7 1E 03 CF         [ 2] 4229 	jp tb_error 
      0095CA 00               [ 4] 4230 	ret 
      0095CB 05               [ 2] 4231 0$:	popw x 
      001781                       4232 	_vars VSIZE  
      0095CC 7B 05            [ 2]    1     sub sp,#VSIZE 
      0095CE C7               [ 2] 4233 	pushw x 
      0095CF 00 02 7B         [ 2] 4234 	ldw x,basicptr
      0095D2 06 C7            [ 2] 4235 	ldw (RET_ADDR,sp),x 
      0095D4 00 04 81         [ 4] 4236 	call get_target_line  
      0095D7 89               [ 2] 4237 	pushw x 
      0095D7 52 07 00         [ 2] 4238 	ldw x,in.w 
      0095D9 1F 07            [ 2] 4239 	ldw (RET_INW+2,sp),x
      0095D9 0F               [ 2] 4240 	popw x 
      0095DA 05 CD            [ 2] 4241 	jra jp_to_target
                                   4242 
                                   4243 ;------------------------
                                   4244 ; BASIC: RETURN 
                                   4245 ; exit from a subroutine 
                                   4246 ; 
                                   4247 ;------------------------
      001795                       4248 return:
      0095DC 89 E7 A1 02 26   [ 2] 4249 	btjt flags,#FRUN,0$ 
      0095E1 08 CD            [ 1] 4250 	ld a,#ERR_RUN_ONLY
      0095E3 83 33 03         [ 2] 4251 	jp tb_error 
      00179F                       4252 0$:	
      0095E6 05 CD            [ 2] 4253 	ldw x,(RET_ADDR,sp) 
      0095E8 89 E7 A1         [ 2] 4254 	ldw basicptr,x
      0095EB 85 27            [ 1] 4255 	ld a,(2,x)
      0095ED 03 CC 88         [ 1] 4256 	ld count,a  
      0095F0 F5 1F            [ 2] 4257 	ldw x,(RET_INW,sp)
      0095F2 06 0D 05         [ 2] 4258 	ldw in.w,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0095F5 26               [ 2] 4259 	popw x 
      0017AF                       4260 	_drop VSIZE 
      0095F6 06 CD            [ 2]    1     addw sp,#VSIZE 
      0095F8 94               [ 2] 4261 	pushw x
      0095F9 08               [ 4] 4262 	ret  
                                   4263 
                                   4264 
                                   4265 ;----------------------------------
                                   4266 ; BASIC: RUN
                                   4267 ; run BASIC program in RAM
                                   4268 ;----------------------------------- 
      0017B3                       4269 run: 
      0095FA CD 83 20 23 02   [ 2] 4270 	btjf flags,#FRUN,0$  
      0095FD 4F               [ 1] 4271 	clr a 
      0095FD A6               [ 4] 4272 	ret
      0017BA                       4273 0$: 
      0095FE 3A CD 83 20 CD   [ 2] 4274 	btjf flags,#FBREAK,1$
      0017BF                       4275 	_drop 2 
      009603 95 B7            [ 2]    1     addw sp,#2 
      009605 72 5F 00         [ 4] 4276 	call rest_context
      0017C4                       4277 	_drop CTXT_SIZE 
      009608 04 CD            [ 2]    1     addw sp,#CTXT_SIZE 
      00960A 8B 49 AE 16      [ 1] 4278 	bres flags,#FBREAK 
      00960E 90 3B 00 04      [ 1] 4279 	bset flags,#FRUN 
      009612 4B 00 72         [ 2] 4280 	jp interpreter 
      009615 FB 01 5C         [ 2] 4281 1$:	ldw x,txtbgn
      009618 5B 02 72         [ 2] 4282 	cpw x,txtend 
      00961B 5F 00            [ 1] 4283 	jrmi run_it 
      00961D 02 CD 8C         [ 2] 4284 	ldw x,#err_no_prog
      009620 FE A1 84         [ 4] 4285 	call puts 
      009623 27 06 CD 95 C7   [ 1] 4286 	mov in,count
      009628 CC               [ 4] 4287 	ret 
      0017E5                       4288 run_it:	 
      009629 88 F5 16         [ 4] 4289     call ubound 
      0017E8                       4290 	_drop 2 ; drop return address 
      00962C 06 90            [ 2]    1     addw sp,#2 
                                   4291 ; clear data pointer 
      00962E FF               [ 1] 4292 	clrw x 
      00962F CD 95 C7         [ 2] 4293 	ldw data_ptr,x 
      009632 CD 89 E7 A1      [ 1] 4294 	clr data_ofs 
      009636 09 27 A0 A1      [ 1] 4295 	clr data_len 
                                   4296 ; initialize BASIC pointer 
      00963A 01 23 03         [ 2] 4297 	ldw x,txtbgn 
      00963D CC 88 F5         [ 2] 4298 	ldw basicptr,x 
      009640 E6 02            [ 1] 4299 	ld a,(2,x)
      009640 5B 07 81         [ 1] 4300 	ld count,a
      009643 35 03 00 01      [ 1] 4301 	mov in,#3	
      009643 55 00 04 00      [ 1] 4302 	bset flags,#FRUN 
      009647 02 81 1B         [ 2] 4303 	jp interpreter 
                                   4304 
                                   4305 
                                   4306 ;----------------------
                                   4307 ; BASIC: END
                                   4308 ; end running program
                                   4309 ;---------------------- 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009649                       4310 cmd_end: 
                                   4311 ; clean stack 
      009649 52 04 0F         [ 2] 4312 	ldw x,#STACK_EMPTY
      00964C 01               [ 1] 4313 	ldw sp,x 
      00964D CD 91 04         [ 2] 4314 	jp warm_start
                                   4315 
                                   4316 
                                   4317 ;-----------------------
                                   4318 ; BASIC: TONE expr1,expr2
                                   4319 ; used TIMER2 channel 1
                                   4320 ; to produce a tone 
                                   4321 ; arguments:
                                   4322 ;    expr1   frequency 
                                   4323 ;    expr2   duration msec.
                                   4324 ;---------------------------
      001813                       4325 tone:
      009650 A1 02 24         [ 4] 4326 	call arg_list 
      009653 03 CC            [ 1] 4327 	cp a,#2 
      009655 88 F5            [ 1] 4328 	jreq 1$
      009657 A1 03 25         [ 2] 4329 	jp syntax_error 
      00181D                       4330 1$: 
      00965A 04               [ 2] 4331 	popw x ; duration
      00965B 85 9F            [ 2] 4332 	popw y ; frequency 
      001820                       4333 beep:  
      00965D 6B               [ 2] 4334 	pushw x 
      00965E 01 85 9F         [ 2] 4335 	ldw x,#TIM2_CLK_FREQ
      009661 6B               [ 2] 4336 	divw x,y 
                                   4337 ; round to nearest integer 
      009662 02 85 F6 14      [ 2] 4338 	cpw y,#TIM2_CLK_FREQ/2
      009666 02 18            [ 1] 4339 	jrmi 2$
      009668 01               [ 2] 4340 	incw x 
      00182C                       4341 2$:	 
      009669 27               [ 1] 4342 	ld a,xh 
      00966A F9 5B 04         [ 1] 4343 	ld TIM2_ARRH,a 
      00966D 81               [ 1] 4344 	ld a,xl 
      00966E C7 53 0E         [ 1] 4345 	ld TIM2_ARRL,a 
                                   4346 ; 50% duty cycle 
      00966E CD               [ 1] 4347 	ccf 
      00966F 91               [ 2] 4348 	rrcw x 
      009670 04               [ 1] 4349 	ld a,xh 
      009671 A1 02 27         [ 1] 4350 	ld TIM2_CCR1H,a 
      009674 03               [ 1] 4351 	ld a,xl
      009675 CC 88 F5         [ 1] 4352 	ld TIM2_CCR1L,a
      009678 72 10 53 08      [ 1] 4353 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009678 85 9F 85 FA      [ 1] 4354 	bset TIM2_CR1,#TIM2_CR1_CEN
      00967C F7 81 53 04      [ 1] 4355 	bset TIM2_EGR,#TIM2_EGR_UG
      00967E 85               [ 2] 4356 	popw x 
      00967E CD 91 04         [ 4] 4357 	call pause02
      009681 A1 02 27 03      [ 1] 4358 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009685 CC 88 F5 00      [ 1] 4359 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009688 81               [ 4] 4360 	ret 
                                   4361 
                                   4362 ;-------------------------------
                                   4363 ; BASIC: ADCON 0|1 [,divisor]  
                                   4364 ; disable/enanble ADC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4365 ;-------------------------------
                           000003  4366 	ONOFF=3 
                           000001  4367 	DIVSOR=1
                           000004  4368 	VSIZE=4 
      001857                       4369 power_adc:
      009688 85 9F 43         [ 4] 4370 	call arg_list 
      00968B 85 F4            [ 1] 4371 	cp a,#2	
      00968D F7 81            [ 1] 4372 	jreq 1$
      00968F A1 01            [ 1] 4373 	cp a,#1 
      00968F CD 91            [ 1] 4374 	jreq 0$ 
      009691 04 A1 02         [ 2] 4375 	jp syntax_error 
      009694 27 03 CC         [ 2] 4376 0$: ldw x,#0
      009697 88               [ 2] 4377 	pushw x  ; divisor 
      009698 F5 85            [ 2] 4378 1$: ldw x,(ONOFF,sp)
      00969A 9F               [ 2] 4379 	tnzw x 
      00969B 85 F8            [ 1] 4380 	jreq 2$ 
      00969D F7 81            [ 2] 4381 	ldw x,(DIVSOR,sp) ; divisor 
      00969F 9F               [ 1] 4382 	ld a,xl
      00969F CD 90            [ 1] 4383 	and a,#7
      0096A1 FF               [ 1] 4384 	swap a 
      0096A2 A1 02 27         [ 1] 4385 	ld ADC_CR1,a
      0096A5 03 CC 88 F5      [ 1] 4386 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0096A9 72 10 54 01      [ 1] 4387 	bset ADC_CR1,#ADC_CR1_ADON 
      00187F                       4388 	_usec_dly 7 
      0096A9 85 9F A4         [ 2]    1     ldw x,#(16*7-2)/4
      0096AC 07               [ 2]    2     decw x
      0096AD 88               [ 1]    3     nop 
      0096AE A6 01            [ 1]    4     jrne .-4
      0096B0 0D 01            [ 2] 4389 	jra 3$
      0096B2 27 05 48 0A      [ 1] 4390 2$: bres ADC_CR1,#ADC_CR1_ADON
      0096B6 01 20 F7 5B      [ 1] 4391 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001890                       4392 3$:	_drop VSIZE 
      0096BA 01 85            [ 2]    1     addw sp,#VSIZE 
      0096BC F4               [ 4] 4393 	ret
                                   4394 
                                   4395 ;-----------------------------
                                   4396 ; BASIC: ADCREAD (channel)
                                   4397 ; read adc channel {0..5}
                                   4398 ; output:
                                   4399 ;   A 		TK_INTGR 
                                   4400 ;   X 		value 
                                   4401 ;-----------------------------
      001893                       4402 analog_read:
      0096BD 27 02 A6         [ 4] 4403 	call func_args 
      0096C0 01 5F            [ 1] 4404 	cp a,#1 
      0096C2 97 A6            [ 1] 4405 	jreq 1$
      0096C4 84 81 75         [ 2] 4406 	jp syntax_error
      0096C6 85               [ 2] 4407 1$: popw x 
      0096C6 CD 91 04         [ 2] 4408 	cpw x,#5 
      0096C9 A1 02            [ 2] 4409 	jrule 2$
      0096CB 27 03            [ 1] 4410 	ld a,#ERR_BAD_VALUE
      0096CD CC 88 F5         [ 2] 4411 	jp tb_error 
      0096D0 9F               [ 1] 4412 2$: ld a,xl
      0096D0 85 9F 85         [ 1] 4413 	ld acc8,a 
      0096D3 F7 81            [ 1] 4414 	ld a,#5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0096D5 C0 00 0D         [ 1] 4415 	sub a,acc8 
      0096D5 CD 90 FF         [ 1] 4416 	ld ADC_CSR,a
      0096D8 A1 01 27 03      [ 1] 4417 	bset ADC_CR2,#ADC_CR2_ALIGN
      0096DC CC 88 F5 85      [ 1] 4418 	bset ADC_CR1,#ADC_CR1_ADON
      0096E0 F6 5F 97 A6 84   [ 2] 4419 	btjf ADC_CSR,#ADC_CSR_EOC,.
      0096E5 81 54 04         [ 2] 4420 	ldw x,ADC_DRH
      0096E6 A6 84            [ 1] 4421 	ld a,#TK_INTGR
      0096E6 CD               [ 4] 4422 	ret 
                                   4423 
                                   4424 ;-----------------------
                                   4425 ; BASIC: DREAD(pin)
                                   4426 ; Arduino pins 
                                   4427 ; read state of a digital pin 
                                   4428 ; pin# {0..15}
                                   4429 ; output:
                                   4430 ;    A 		TK_INTGR
                                   4431 ;    X      0|1 
                                   4432 ;-------------------------
                           000001  4433 	PINNO=1
                           000001  4434 	VSIZE=1
      0018C7                       4435 digital_read:
      0018C7                       4436 	_vars VSIZE 
      0096E7 92 46            [ 2]    1     sub sp,#VSIZE 
      0096E9 A1 84 27         [ 4] 4437 	call func_args
      0096EC 03 CC            [ 1] 4438 	cp a,#1
      0096EE 88 F5            [ 1] 4439 	jreq 1$
      0096F0 4F 5D 26         [ 2] 4440 	jp syntax_error
      0096F3 05               [ 2] 4441 1$: popw x 
      0096F4 55 00 04         [ 2] 4442 	cpw x,#15 
      0096F7 00 02            [ 2] 4443 	jrule 2$
      0096F9 81 0A            [ 1] 4444 	ld a,#ERR_BAD_VALUE
      0096FA CC 08 77         [ 2] 4445 	jp tb_error 
      0096FA 85 52 0A         [ 4] 4446 2$:	call select_pin 
      0096FD 89 A6            [ 1] 4447 	ld (PINNO,sp),a
      0096FF 85 CD            [ 1] 4448 	ld a,(GPIO_IDR,x)
      009701 90 F2            [ 1] 4449 	tnz (PINNO,sp)
      009703 1F 07            [ 1] 4450 	jreq 8$
      009705 CD               [ 1] 4451 3$: srl a 
      009706 93 29            [ 1] 4452 	dec (PINNO,sp)
      009708 72 14            [ 1] 4453 	jrne 3$ 
      00970A 00 24            [ 1] 4454 8$: and a,#1 
      00970C 5F               [ 1] 4455 	clrw x 
      00970D 1F               [ 1] 4456 	ld xl,a 
      00970E 0B 1F            [ 1] 4457 	ld a,#TK_INTGR
      0018F4                       4458 	_drop VSIZE
      009710 09 CD            [ 2]    1     addw sp,#VSIZE 
      009712 89               [ 4] 4459 	ret
                                   4460 
                                   4461 ;-----------------------
                                   4462 ; BASIC: DWRITE pin,0|1
                                   4463 ; Arduino pins 
                                   4464 ; write to a digital pin 
                                   4465 ; pin# {0..15}
                                   4466 ; output:
                                   4467 ;    A 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4468 ;    X      0|1 
                                   4469 ;-------------------------
                           000001  4470 	PINNO=1
                           000002  4471 	PINVAL=2
                           000002  4472 	VSIZE=2
      0018F7                       4473 digital_write:
      0018F7                       4474 	_vars VSIZE 
      009713 E7 A1            [ 2]    1     sub sp,#VSIZE 
      009715 80 27 03         [ 4] 4475 	call arg_list  
      009718 CC 88            [ 1] 4476 	cp a,#2 
      00971A F5 03            [ 1] 4477 	jreq 1$
      00971B CC 08 75         [ 2] 4478 	jp syntax_error
      00971B A3               [ 2] 4479 1$: popw x 
      00971C 97               [ 1] 4480 	ld a,xl 
      00971D 23 27            [ 1] 4481 	ld (PINVAL,sp),a
      00971F 03               [ 2] 4482 	popw x 
      009720 CC 88 F5         [ 2] 4483 	cpw x,#15 
      009723 23 05            [ 2] 4484 	jrule 2$
      009723 72 04            [ 1] 4485 	ld a,#ERR_BAD_VALUE
      009725 00 24 03         [ 2] 4486 	jp tb_error 
      009728 CC 88 F5         [ 4] 4487 2$:	call select_pin 
      00972B CD 92            [ 1] 4488 	ld (PINNO,sp),a 
      00972D 46 A1            [ 1] 4489 	ld a,#1
      00972F 84 27            [ 1] 4490 	tnz (PINNO,sp)
      009731 03 CC            [ 1] 4491 	jreq 4$
      009733 88               [ 1] 4492 3$: sll a
      009734 F5 1F            [ 1] 4493 	dec (PINNO,sp)
      009736 05 CD            [ 1] 4494 	jrne 3$
      009738 89 E7            [ 1] 4495 4$: tnz (PINVAL,sp)
      00973A A1 00            [ 1] 4496 	jrne 5$
      00973C 27               [ 1] 4497 	cpl a 
      00973D 0E A1            [ 1] 4498 	and a,(GPIO_ODR,x)
      00973F 80 26            [ 2] 4499 	jra 8$
      009741 05 A3            [ 1] 4500 5$: or a,(GPIO_ODR,x)
      009743 97 53            [ 1] 4501 8$: ld (GPIO_ODR,x),a 
      00192F                       4502 	_drop VSIZE 
      009745 27 0C            [ 2]    1     addw sp,#VSIZE 
      009747 81               [ 4] 4503 	ret
                                   4504 
                                   4505 
                                   4506 ;-----------------------
                                   4507 ; BASIC: STOP
                                   4508 ; stop progam execution  
                                   4509 ; without resetting pointers 
                                   4510 ; the program is resumed
                                   4511 ; with RUN 
                                   4512 ;-------------------------
      001932                       4513 stop:
      009747 55 00 03 00 02   [ 2] 4514 	btjt flags,#FRUN,2$
      00974C 4F               [ 1] 4515 	clr a
      00974C AE               [ 4] 4516 	ret 
      001939                       4517 2$:	 
                                   4518 ; create space on cstack to save context 
      00974D 00 01 1F         [ 2] 4519 	ldw x,#break_point 
      009750 03 20 14         [ 4] 4520 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009753                       4521 	_drop 2 ;drop return address 
      009753 72 04            [ 2]    1     addw sp,#2 
      001941                       4522 	_vars CTXT_SIZE ; context size 
      009755 00 24            [ 2]    1     sub sp,#CTXT_SIZE 
      009757 03 CC 88         [ 4] 4523 	call save_context 
      00975A F5 CD 92         [ 2] 4524 	ldw x,#tib 
      00975D 46 A1 84         [ 2] 4525 	ldw basicptr,x
      009760 27               [ 1] 4526 	clr (x)
      009761 03 CC 88 F5      [ 1] 4527 	clr count  
      009765 1F               [ 1] 4528 	clrw x 
      009766 03 00 00         [ 2] 4529 	ldw in.w,x
      009767 72 11 00 23      [ 1] 4530 	bres flags,#FRUN 
      009767 CE 00 05 1F      [ 1] 4531 	bset flags,#FBREAK
      00976B 0B CE 00         [ 2] 4532 	jp interpreter 
      00976E 01 1F 09 72 15 00 24  4533 break_point: .asciz "\nbreak point, RUN to resume.\n"
             72 5C 00 21 81 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4534 
                                   4535 ;-----------------------
                                   4536 ; BASIC: NEW
                                   4537 ; from command line only 
                                   4538 ; free program memory
                                   4539 ; and clear variables 
                                   4540 ;------------------------
      00977A                       4541 new: 
      00977A 72 5D 00 21 26   [ 2] 4542 	btjf flags,#FRUN,0$ 
      00977F 03               [ 4] 4543 	ret 
      001984                       4544 0$:	
      009780 CC 88 F5         [ 4] 4545 	call clear_basic 
      009783 81               [ 4] 4546 	ret 
                                   4547 	 
                                   4548 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4549 ;  file system routines
                                   4550 ;  MCU flash memory from
                                   4551 ;  0x10000-0x27fff is 
                                   4552 ;  used to store BASIC 
                                   4553 ;  program files. 
                                   4554 ;  use 128 bytes sectors
                                   4555 ;  because this is the MCU 
                                   4556 ;  row size.
                                   4557 ;  file entry aligned to row
                                   4558 ;  	name  variable length
                                   4559 ;  	size  2 bytes  
                                   4560 ; 	data  variable length 
                                   4561 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4562 
                                   4563 ;---------------------------
                                   4564 ; fill pad with zeros 
                                   4565 ;--------------------------
      001988                       4566 zero_pad:
      009783 A6 85 CD         [ 2] 4567 	ldw x,#pad 
      009786 90 F2            [ 1] 4568 	ld a,#PAD_SIZE 
      009788 13               [ 1] 4569 1$:	clr (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009789 07               [ 2] 4570 	incw x 
      00978A 27               [ 1] 4571 	dec a 
      00978B 03 CC            [ 1] 4572 	jrne 1$
      00978D 88               [ 4] 4573 	ret 
                                   4574 
                                   4575 ;--------------------------
                                   4576 ; align farptr to BLOCK_SIZE 
                                   4577 ;---------------------------
      001993                       4578 row_align:
      00978E F5 7F            [ 1] 4579 	ld a,#0x7f 
      00978F C4 00 18         [ 1] 4580 	and a,farptr+2 
      00978F FE 72            [ 1] 4581 	jreq 1$ 
      009791 FB 03 16         [ 2] 4582 	ldw x,farptr+1 
      009794 07 90 FF         [ 2] 4583 	addw x,#BLOCK_SIZE 
      009797 A6 80            [ 1] 4584 	jrnc 0$
      009799 15 03 2A 06      [ 1] 4585 	inc farptr 
      00979D 13               [ 1] 4586 0$: ld a,xl 
      00979E 05 2F            [ 1] 4587 	and a,#0x80
      0097A0 1B               [ 1] 4588 	ld xl,a
      0097A1 20 04 17         [ 2] 4589 	ldw farptr+1,x  	
      0097A3 81               [ 4] 4590 1$:	ret
                                   4591 
                                   4592 ;--------------------
                                   4593 ; input:
                                   4594 ;   X     increment 
                                   4595 ; output:
                                   4596 ;   farptr  incremented 
                                   4597 ;---------------------
      0019AE                       4598 incr_farptr:
      0097A3 13 05 2C 15      [ 2] 4599 	addw x,farptr+1 
      0097A7 24 04            [ 1] 4600 	jrnc 1$
      0097A7 1E 0B CF 00      [ 1] 4601 	inc farptr 
      0097AB 05 72 01         [ 2] 4602 1$:	ldw farptr+1,x  
      0097AE 00               [ 4] 4603 	ret 
                                   4604 
                                   4605 ;------------------------------
                                   4606 ; extended flash memory used as FLASH_DRIVE 
                                   4607 ; seek end of used flash drive   
                                   4608 ; starting at 0x10000 address.
                                   4609 ; 4 consecutives 0 bytes signal free space. 
                                   4610 ; input:
                                   4611 ;	none
                                   4612 ; output:
                                   4613 ;   ffree     free_addr| 0 if memory full.
                                   4614 ;------------------------------
      0019BC                       4615 seek_fdrive:
                                   4616 ; start scan at 0x10000 address 
      0097AF 24 05            [ 1] 4617 	ld a,#1
      0097B1 E6 02 C7         [ 1] 4618 	ld farptr,a 
      0097B4 00               [ 1] 4619 	clrw x 
      0097B5 04 1E 09         [ 2] 4620 	ldw farptr+1,x 
      0019C5                       4621 1$:
      0097B8 CF 00 01         [ 2] 4622 	ldw x,#3  
      0097BB 81 AF 00 16      [ 5] 4623 2$:	ldf a,([farptr],x) 
      0097BC 26 05            [ 1] 4624 	jrne 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0097BC 85               [ 2] 4625 	decw x
      0097BD 5B 0A            [ 1] 4626 	jrpl 2$
      0097BF 72 5A            [ 2] 4627 	jra 4$ 
      0097C1 00 21 FC         [ 2] 4628 3$:	ldw x,#BLOCK_SIZE 
      0097C4 CD 19 AE         [ 4] 4629 	call incr_farptr
      0097C4 CD 92 46         [ 2] 4630 	ldw x,#0x280  
      0097C7 A1 84 27         [ 2] 4631 	cpw x,farptr
      0097CA 03 CC            [ 1] 4632 	jrmi 1$
      0019E1                       4633 4$: ; copy farptr to ffree	 
      0097CC 88 F5 CD         [ 2] 4634 	ldw x,farptr 
      0097CF 84 80 5D         [ 1] 4635 	ld a,farptr+2 
      0097D2 26 05 A6         [ 2] 4636 	ldw ffree,x 
      0097D5 05 CC 88         [ 1] 4637 	ld ffree+2,a  
      0097D8 F7               [ 4] 4638 	ret 
                                   4639 
                                   4640 ;-----------------------
                                   4641 ; return amount of free 
                                   4642 ; space on flash drive
                                   4643 ; input:
                                   4644 ;   none
                                   4645 ; output:
                                   4646 ;   acc24   free space 
                                   4647 ;-----------------------
      0019EE                       4648 disk_free:
      0097D9 81 80 00         [ 2] 4649 	ldw x,#0x8000
      0097DA 72 B0 00 1A      [ 2] 4650 	subw x,ffree+1
      0097DA 72 00            [ 1] 4651 	ld a,#2
      0097DC 00 24 06         [ 1] 4652 	sbc a,ffree 
      0097DF A6 06 CC         [ 1] 4653 	ld acc24,a 
      0097E2 88 F7 81         [ 2] 4654 	ldw acc16,x 
      0097E5 CD               [ 4] 4655 	ret 
                                   4656 
                                   4657 ;-----------------------
                                   4658 ; compare file name 
                                   4659 ; with name pointed by Y  
                                   4660 ; input:
                                   4661 ;   farptr   file name 
                                   4662 ;   Y        target name 
                                   4663 ; output:
                                   4664 ;   farptr 	 at file_name
                                   4665 ;   X 		 farptr[x] point at size field  
                                   4666 ;   Carry    0|1 no match|match  
                                   4667 ;----------------------
      001A01                       4668 cmp_name:
      0097E6 97               [ 1] 4669 	clrw x
      0097E7 C4 AF 00 16      [ 5] 4670 1$:	ldf a,([farptr],x)
      0097E8 90 F1            [ 1] 4671 	cp a,(y)
      0097E8 CF 00            [ 1] 4672 	jrne 4$
      0097EA 05               [ 1] 4673 	tnz a 
      0097EB E6 02            [ 1] 4674 	jreq 9$ 
      0097ED C7               [ 2] 4675     incw x 
      0097EE 00 04            [ 2] 4676 	incw y 
      0097F0 35 03            [ 2] 4677 	jra 1$
      001A12                       4678 4$: ;no match 
      0097F2 00               [ 1] 4679 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0097F3 02 81            [ 1] 4680 	jreq 5$
      0097F5 5C               [ 2] 4681 	incw x 
      0097F5 72 00 00 24      [ 5] 4682 	ldf a,([farptr],x)
      0097F9 06 A6            [ 2] 4683 	jra 4$  
      0097FB 06               [ 2] 4684 5$:	incw x ; farptr[x] point at 'size' field 
      0097FC CC               [ 1] 4685 	rcf 
      0097FD 88               [ 4] 4686 	ret
      001A1F                       4687 9$: ; match  
      0097FE F7               [ 2] 4688 	incw x  ; farptr[x] at 'size' field 
      0097FF 81               [ 1] 4689 	scf 
      009800 85               [ 4] 4690 	ret 
                                   4691 
                                   4692 ;-----------------------
                                   4693 ; search file in 
                                   4694 ; flash memory 
                                   4695 ; input:
                                   4696 ;   Y       file name  
                                   4697 ; output:
                                   4698 ;   farptr  addr at name|0
                                   4699 ;   X       offset to size field
                                   4700 ;-----------------------
                           000001  4701 	FSIZE=1
                           000003  4702 	YSAVE=3
                           000004  4703 	VSIZE=4 
      001A22                       4704 search_file: 
      001A22                       4705 	_vars VSIZE
      009801 52 04            [ 2]    1     sub sp,#VSIZE 
      009803 89 CE            [ 2] 4706 	ldw (YSAVE,sp),y  
      009805 00               [ 1] 4707 	clrw x 
      009806 05 1F 03         [ 2] 4708 	ldw farptr+1,x 
      009809 CD 97 C4 89      [ 1] 4709 	mov farptr,#1
      001A2E                       4710 1$:	
                                   4711 ; check if farptr is after any file 
                                   4712 ; if  0 then so.
      00980D CE 00 01 1F      [ 5] 4713 	ldf a,[farptr]
      009811 07 85            [ 1] 4714 	jreq 6$
      009813 20               [ 1] 4715 2$: clrw x 	
      009814 D3 03            [ 2] 4716 	ldw y,(YSAVE,sp) 
      009815 CD 1A 01         [ 4] 4717 	call cmp_name
      009815 72 00            [ 1] 4718 	jrc 9$
      009817 00 24 05 A6      [ 5] 4719 	ldf a,([farptr],x)
      00981B 06 CC            [ 1] 4720 	ld (FSIZE,sp),a 
      00981D 88               [ 2] 4721 	incw x 
      00981E F7 AF 00 16      [ 5] 4722 	ldf a,([farptr],x)
      00981F 6B 02            [ 1] 4723 	ld (FSIZE+1,sp),a 
      00981F 1E               [ 2] 4724 	incw x 
      009820 03 CF 00         [ 2] 4725 	addw x,(FSIZE,sp) ; skip over file data
      009823 05 E6 02         [ 4] 4726 	call incr_farptr
      009826 C7 00 04         [ 4] 4727 	call row_align  
      009829 1E 05 CF         [ 2] 4728 	ldw x,#0x280
      00982C 00 01 85         [ 2] 4729 	cpw x,farptr 
      00982F 5B 04            [ 1] 4730 	jrpl 1$
      001A5B                       4731 6$: ; file not found 
      009831 89 81 00 16      [ 1] 4732 	clr farptr
      009833 72 5F 00 17      [ 1] 4733 	clr farptr+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009833 72 01 00 24      [ 1] 4734 	clr farptr+2 
      001A67                       4735 	_drop VSIZE 
      009837 02 4F            [ 2]    1     addw sp,#VSIZE 
      009839 81               [ 1] 4736 	rcf
      00983A 81               [ 4] 4737 	ret
      001A6B                       4738 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001A6B                       4739 	_drop VSIZE 
      00983A 72 09            [ 2]    1     addw sp,#VSIZE 
      00983C 00               [ 1] 4740 	scf 	
      00983D 24               [ 4] 4741 	ret
                                   4742 
                                   4743 ;--------------------------------
                                   4744 ; BASIC: SAVE "name" 
                                   4745 ; save text program in 
                                   4746 ; flash memory used as permanent
                                   4747 ; storage from address 0x10000-0x27fff 
                                   4748 ;--------------------------------
                           000001  4749 	BSIZE=1
                           000003  4750 	NAMEPTR=3
                           000005  4751 	XSAVE=5
                           000007  4752 	YSAVE=7
                           000008  4753 	VSIZE=8 
      001A6F                       4754 save:
      00983E 12 5B 02 CD 95   [ 2] 4755 	btjf flags,#FRUN,0$ 
      009843 C7 5B            [ 1] 4756 	ld a,#ERR_CMD_ONLY 
      009845 04 72 19         [ 2] 4757 	jp tb_error
      001A79                       4758 0$:	 
      009848 00 24 72         [ 2] 4759 	ldw x,txtend 
      00984B 10 00 24 CC      [ 2] 4760 	subw x,txtbgn
      00984F 89 9B            [ 1] 4761 	jrne 1$
                                   4762 ; nothing to save 
      009851 CE 00 1D         [ 2] 4763 	ldw x,#err_no_prog 
      009854 C3 00 1F         [ 4] 4764 	call puts 
      009857 2B 0C AE 88 90   [ 1] 4765 	mov in,count 
      00985C CD               [ 4] 4766 	ret  	
      001A8E                       4767 1$:	
      001A8E                       4768 	_vars VSIZE 
      00985D 83 33            [ 2]    1     sub sp,#VSIZE 
      00985F 55 00            [ 2] 4769 	ldw (BSIZE,sp),x 
      009861 04 00 02         [ 4] 4770 	call next_token	
      009864 81 02            [ 1] 4771 	cp a,#TK_QSTR
      009865 27 03            [ 1] 4772 	jreq 2$
      009865 CD 92 F6         [ 2] 4773 	jp syntax_error
      001A9C                       4774 2$: 
      009868 5B 02            [ 2] 4775 	ldw (NAMEPTR,sp),x  
      00986A 5F CF 00         [ 4] 4776 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4777 ; check if enough free space 
      00986D 07 72 5F         [ 4] 4778 	call strlen 
      009870 00 09 72         [ 2] 4779 	addw x,#3 
      009873 5F 00 0A         [ 2] 4780 	addw x,(BSIZE,sp)
      009876 CE               [ 1] 4781 	clr a 
      009877 00 1D CF 00      [ 2] 4782 	addw x,ffree+1 
      00987B 05 E6 02         [ 1] 4783 	adc a,ffree 
      00987E C7 00            [ 1] 4784 	cp a,#2
      009880 04 35            [ 1] 4785 	jrmi 21$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009882 03 00 02         [ 2] 4786 	cpw x,#0x8000
      009885 72 10            [ 1] 4787 	jrmi 21$
      009887 00 24            [ 1] 4788 	ld a,#ERR_NO_FSPACE  
      009889 CC 89 9B         [ 2] 4789 	jp tb_error
      00988C                       4790 21$: 
                                   4791 ; check for existing file of that name 
      00988C AE 17            [ 2] 4792 	ldw y,(NAMEPTR,sp)	
      00988E FF 94 CC         [ 4] 4793 	call search_file 
      009891 89 7C            [ 1] 4794 	jrnc 3$ 
      009893 A6 08            [ 1] 4795 	ld a,#ERR_DUPLICATE 
      009893 CD 91 04         [ 2] 4796 	jp tb_error 
      001ACC                       4797 3$:	; initialize farptr 
      009896 A1 02 27         [ 2] 4798 	ldw x,ffree 
      009899 03 CC 88         [ 1] 4799 	ld a,ffree+2 
      00989C F5 00 16         [ 2] 4800 	ldw farptr,x 
      00989D C7 00 18         [ 1] 4801 	ld farptr+2,a 
                                   4802 ;** write file name to row buffer **	
      00989D 85 90            [ 2] 4803 	ldw y,(NAMEPTR,sp)  
      00989F 85 16 E0         [ 2] 4804 	ldw x,#pad 
      0098A0 CD 03 B0         [ 4] 4805 	call strcpy
      0098A0 89 AE F4         [ 4] 4806 	call strlen 
      0098A3 24               [ 2] 4807 	incw  x
      0098A4 65 90 A3         [ 2] 4808 	addw x,#pad 
                                   4809 ; ** write file size to row buffer 
      0098A7 7A 12            [ 2] 4810 	ldw y,(BSIZE,sp)
      0098A9 2B               [ 2] 4811 	ldw (x),y 
      0098AA 01 5C 02         [ 2] 4812 	addw x,#2 
                                   4813 ; ** write file data to row buffer 
      0098AC 90 CE 00 1C      [ 2] 4814 	ldw y,txtbgn 
      0098AC 9E C7            [ 1] 4815 6$:	ld a,(y)
      0098AE 53 0D            [ 2] 4816 	incw y
      0098B0 9F               [ 1] 4817 	ld (x),a 
      0098B1 C7               [ 2] 4818 	incw x
      0098B2 53 0E 8C 56      [ 2] 4819 	cpw y,txtend 
      0098B6 9E C7            [ 1] 4820 	jreq 12$
      0098B8 53 0F 9F         [ 2] 4821 	cpw x,#stack_full 
      0098BB C7 53            [ 1] 4822 	jrmi 6$
      001B02                       4823 12$:
      0098BD 10 72            [ 2] 4824 	ldw (YSAVE,sp),y 
      001B04                       4825 14$: ; zero buffer end 
      0098BF 10 53 08         [ 2] 4826 	cpw x,#stack_full
      0098C2 72 10            [ 1] 4827 	jreq 16$
      0098C4 53               [ 1] 4828 	clr (x)
      0098C5 00               [ 2] 4829 	incw x 
      0098C6 72 10            [ 2] 4830 	jra 14$
      001B0D                       4831 16$:
      0098C8 53 04 85         [ 2] 4832 	ldw x,#pad 
      0098CB CD 9E 41         [ 4] 4833 	call write_row 
      0098CE 72 11 53         [ 2] 4834 	ldw x,#BLOCK_SIZE 
      0098D1 08 72 11         [ 4] 4835 	call incr_farptr
      0098D4 53 00 81         [ 2] 4836 	ldw x,#pad 
      0098D7 16 07            [ 2] 4837 	ldw y,(YSAVE,sp)
      0098D7 CD 91 04 A1      [ 2] 4838 	cpw y,txtend 
      0098DB 02 27            [ 1] 4839 	jrmi 6$
                                   4840 ; save farptr in ffree
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098DD 0B A1 01         [ 2] 4841 	ldw x,farptr 
      0098E0 27 03 CC         [ 1] 4842 	ld a,farptr+2 
      0098E3 88 F5 AE         [ 2] 4843 	ldw ffree,x 
      0098E6 00 00 89         [ 1] 4844 	ld ffree+2,a
                                   4845 ; print file size 	
      0098E9 1E 03            [ 2] 4846 	ldw x,(BSIZE,sp) 
      0098EB 5D 27 1A         [ 4] 4847 	call print_int 
      001B35                       4848 	_drop VSIZE 
      0098EE 1E 01            [ 2]    1     addw sp,#VSIZE 
      0098F0 9F               [ 4] 4849 	ret 
                                   4850 
                                   4851 ;----------------------
                                   4852 ; load file in RAM memory
                                   4853 ; input:
                                   4854 ;    farptr point at file size 
                                   4855 ; output:
                                   4856 ;   y point after BASIC program in RAM.
                                   4857 ;------------------------
      001B38                       4858 load_file:
      0098F1 A4 07 4E         [ 4] 4859 	call incr_farptr  
      0098F4 C7 54 01         [ 4] 4860 	call clear_basic  
      0098F7 72               [ 1] 4861 	clrw x
      0098F8 16 50 CA 72      [ 5] 4862 	ldf a,([farptr],x)
      0098FC 10 54            [ 1] 4863 	ld yh,a 
      0098FE 01               [ 2] 4864 	incw x  
      0098FF AE 00 1B 5A      [ 5] 4865 	ldf a,([farptr],x)
      009903 9D               [ 2] 4866 	incw x 
      009904 26 FA            [ 1] 4867 	ld yl,a 
      009906 20 08 72 11      [ 2] 4868 	addw y,txtbgn
      00990A 54 01 72 17      [ 2] 4869 	ldw txtend,y
      00990E 50 CA 5B 04      [ 2] 4870 	ldw y,txtbgn
      001B59                       4871 3$:	; load BASIC text 	
      009912 81 AF 00 16      [ 5] 4872 	ldf a,([farptr],x)
      009913 90 F7            [ 1] 4873 	ld (y),a 
      009913 CD               [ 2] 4874 	incw x 
      009914 90 FF            [ 2] 4875 	incw y 
      009916 A1 01 27 03      [ 2] 4876 	cpw y,txtend 
      00991A CC 88            [ 1] 4877 	jrmi 3$
      00991C F5               [ 4] 4878 	ret 
                                   4879 
                                   4880 ;------------------------
                                   4881 ; BASIC: LOAD "file" 
                                   4882 ; load file to RAM 
                                   4883 ; for execution 
                                   4884 ;------------------------
      001B69                       4885 load:
      00991D 85 A3 00 05 23   [ 2] 4886 	btjf flags,#FRUN,0$ 
      009922 05 A6            [ 1] 4887 	jreq 0$ 
      009924 0A CC            [ 1] 4888 	ld a,#ERR_CMD_ONLY 
      009926 88 F7 9F         [ 2] 4889 	jp tb_error 
      001B75                       4890 0$:	
      009929 C7 00 0E         [ 4] 4891 	call next_token 
      00992C A6 05            [ 1] 4892 	cp a,#TK_QSTR
      00992E C0 00            [ 1] 4893 	jreq 1$
      009930 0E C7 54         [ 2] 4894 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009933 00 72            [ 1] 4895 1$:	ldw y,x 
      009935 16 54 02         [ 4] 4896 	call search_file 
      009938 72 10            [ 1] 4897 	jrc 2$ 
      00993A 54 01            [ 1] 4898 	ld a,#ERR_NOT_FILE
      00993C 72 0F 54         [ 2] 4899 	jp tb_error  
      001B8B                       4900 2$:
      00993F 00 FB CE         [ 4] 4901 	call load_file
                                   4902 ; print loaded size 	 
      009942 54 04 A6         [ 2] 4903 	ldw x,txtend 
      009945 84 81 00 1C      [ 2] 4904 	subw x,txtbgn
      009947 CD 09 BC         [ 4] 4905 	call print_int 
      009947 52               [ 4] 4906 	ret 
                                   4907 
                                   4908 ;-----------------------------------
                                   4909 ; BASIC: FORGET ["file_name"] 
                                   4910 ; erase file_name and all others 
                                   4911 ; after it. 
                                   4912 ; without argument erase all files 
                                   4913 ;-----------------------------------
                           000001  4914 	NEW_FREE=1 
                           000003  4915 	VSIZE=3 
      001B99                       4916 forget:
      001B99                       4917 	_vars VSIZE 
      009948 01 CD            [ 2]    1     sub sp,#VSIZE 
      00994A 90 FF A1         [ 4] 4918 	call next_token 
      00994D 01 27            [ 1] 4919 	cp a,#TK_NONE 
      00994F 03 CC            [ 1] 4920 	jreq 3$ 
      009951 88 F5            [ 1] 4921 	cp a,#TK_QSTR
      009953 85 A3            [ 1] 4922 	jreq 1$
      009955 00 0F 23         [ 2] 4923 	jp syntax_error
      009958 05 A6            [ 1] 4924 1$: ldw y,x 
      00995A 0A CC 88 F7 CD   [ 1] 4925 	mov in,count 
      00995F 9F 74 6B         [ 4] 4926 	call search_file
      009962 01 E6            [ 1] 4927 	jrc 2$
      009964 01 0D            [ 1] 4928 	ld a,#ERR_NOT_FILE 
      009966 01 27 05         [ 2] 4929 	jp tb_error 
      001BBA                       4930 2$: 
      009969 44 0A 01         [ 2] 4931 	ldw x,farptr
      00996C 26 FB A4         [ 1] 4932 	ld a,farptr+2
      00996F 01 5F            [ 2] 4933 	jra 4$ 
      001BC2                       4934 3$: ; forget all files 
      009971 97 A6 84         [ 2] 4935 	ldw x,#0x100
      009974 5B               [ 1] 4936 	clr a 
      009975 01 81 16         [ 2] 4937 	ldw farptr,x 
      009977 C7 00 18         [ 1] 4938 	ld farptr+2,a 
      001BCC                       4939 4$:	; save new free address 
      009977 52 02            [ 2] 4940 	ldw (NEW_FREE,sp),x
      009979 CD 91            [ 1] 4941 	ld (NEW_FREE+2,sp),a 
      00997B 04 A1 02         [ 4] 4942 	call move_erase_to_ram
      00997E 27 03 CC         [ 4] 4943 5$: call block_erase 
      009981 88 F5 85         [ 2] 4944 	ldw x,#BLOCK_SIZE 
      009984 9F 6B 02         [ 4] 4945 	call incr_farptr 
      009987 85 A3 00         [ 4] 4946 	call row_align 
                                   4947 ; check if all blocks erased
      00998A 0F 23 05         [ 1] 4948 	ld a,farptr+2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      00998D A6 0A CC         [ 1] 4949 	sub a,ffree+2
      009990 88 F7 CD         [ 1] 4950 	ld a,farptr+1 
      009993 9F 74 6B         [ 1] 4951 	sbc a,ffree+1 
      009996 01 A6 01         [ 1] 4952 	ld a,farptr 
      009999 0D 01 27         [ 1] 4953 	sbc a,ffree 
      00999C 05 48            [ 1] 4954 	jrmi 5$ 
      00999E 0A 01            [ 1] 4955 	ld a,(NEW_FREE+2,sp)
      0099A0 26 FB            [ 2] 4956 	ldw x,(NEW_FREE,sp)
      0099A2 0D 02 26         [ 1] 4957 	ld ffree+2,a 
      0099A5 05 43 E4         [ 2] 4958 	ldw ffree,x 
      001BFD                       4959 	_drop VSIZE 
      0099A8 00 20            [ 2]    1     addw sp,#VSIZE 
      0099AA 02               [ 4] 4960 	ret 
                                   4961 
                                   4962 ;----------------------
                                   4963 ; BASIC: DIR 
                                   4964 ; list saved files 
                                   4965 ;----------------------
                           000001  4966 	COUNT=1 ; files counter 
                           000002  4967 	VSIZE=2 
      001C00                       4968 directory:
      001C00                       4969 	_vars VSIZE 
      0099AB EA 00            [ 2]    1     sub sp,#VSIZE 
      0099AD E7               [ 1] 4970 	clrw x 
      0099AE 00 5B            [ 2] 4971 	ldw (COUNT,sp),x 
      0099B0 02 81 17         [ 2] 4972 	ldw farptr+1,x 
      0099B2 35 01 00 16      [ 1] 4973 	mov farptr,#1 
      001C0C                       4974 dir_loop:
      0099B2 72               [ 1] 4975 	clrw x 
      0099B3 00 00 24 02      [ 5] 4976 	ldf a,([farptr],x)
      0099B7 4F 81            [ 1] 4977 	jreq 8$ 
      0099B9                       4978 1$: ;name loop 	
      0099B9 AE 99 E0 CD      [ 5] 4979 	ldf a,([farptr],x)
      0099BD 83 33            [ 1] 4980 	jreq 2$ 
      0099BF 5B 02 52         [ 4] 4981 	call putc 
      0099C2 04               [ 2] 4982 	incw x 
      0099C3 CD 95            [ 2] 4983 	jra 1$
      0099C5 B7               [ 2] 4984 2$: incw x ; skip ending 0. 
      0099C6 AE 16            [ 1] 4985 	ld a,#SPACE 
      0099C8 90 CF 00         [ 4] 4986 	call putc 
                                   4987 ; get file size 	
      0099CB 05 7F 72 5F      [ 5] 4988 	ldf a,([farptr],x)
      0099CF 00 04            [ 1] 4989 	ld yh,a 
      0099D1 5F               [ 2] 4990 	incw x 
      0099D2 CF 00 01 72      [ 5] 4991 	ldf a,([farptr],x)
      0099D6 11               [ 2] 4992 	incw x 
      0099D7 00 24            [ 1] 4993 	ld yl,a 
      0099D9 72 18            [ 2] 4994 	pushw y 
      0099DB 00 24 CC         [ 2] 4995 	addw x,(1,sp)
                                   4996 ; skip to next file 
      0099DE 89 9B 0A         [ 4] 4997 	call incr_farptr
      0099E1 62 72 65         [ 4] 4998 	call row_align
                                   4999 ; print file size 
      0099E4 61               [ 2] 5000 	popw x ; file size 
      0099E5 6B 20 70         [ 4] 5001 	call print_int 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0099E8 6F 69            [ 1] 5002 	ld a,#CR 
      0099EA 6E 74 2C         [ 4] 5003 	call putc
      0099ED 20 52            [ 2] 5004 	ldw x,(COUNT,sp)
      0099EF 55               [ 2] 5005 	incw x
      0099F0 4E 20            [ 2] 5006 	ldw (COUNT,sp),x  
      0099F2 74 6F            [ 2] 5007 	jra dir_loop
      001C4E                       5008 8$: ; print number of files 
      0099F4 20 72            [ 2] 5009 	ldw x,(COUNT,sp)
      0099F6 65 73 75         [ 4] 5010 	call print_int 
      0099F9 6D 65 2E         [ 2] 5011 	ldw x,#file_count 
      0099FC 0A 00 B3         [ 4] 5012 	call puts  
                                   5013 ; print drive free space 	
      0099FE CD 19 EE         [ 4] 5014 	call disk_free
      0099FE 72               [ 1] 5015 	clrw x  
      0099FF 01 00 24 01      [ 1] 5016 	mov base,#10 
      009A03 81 09 CC         [ 4] 5017 	call prti24 
      009A04 AE 1C 75         [ 2] 5018 	ldw x,#drive_free
      009A04 CD 87 61         [ 4] 5019 	call puts 
      001C6A                       5020 	_drop VSIZE 
      009A07 81 02            [ 2]    1     addw sp,#VSIZE 
      009A08 81               [ 4] 5021 	ret
      009A08 AE 16 E0 A6 80 7F 5C  5022 file_count: .asciz " files\n"
             4A
      009A10 26 FB 81 74 65 73 20  5023 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5024 
                                   5025 ;---------------------
                                   5026 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5027 ; write 1 or more byte to FLASH or EEPROM
                                   5028 ; starting at address  
                                   5029 ; input:
                                   5030 ;   expr1  	is address 
                                   5031 ;   expr2,...,exprn   are bytes to write
                                   5032 ; output:
                                   5033 ;   none 
                                   5034 ;---------------------
                           000001  5035 	ADDR=1
                           000002  5036 	VSIZ=2 
      009A13                       5037 write:
      001C82                       5038 	_vars VSIZE 
      009A13 A6 7F            [ 2]    1     sub sp,#VSIZE 
      009A15 C4 00 19 27      [ 1] 5039 	clr farptr ; expect 16 bits address 
      009A19 13 CE 00         [ 4] 5040 	call expression
      009A1C 18 1C            [ 1] 5041 	cp a,#TK_INTGR 
      009A1E 00 80            [ 1] 5042 	jreq 0$
      009A20 24 04 72         [ 2] 5043 	jp syntax_error
      009A23 5C 00            [ 2] 5044 0$: ldw (ADDR,sp),x 
      009A25 17 9F A4         [ 4] 5045 	call next_token 
      009A28 80 97            [ 1] 5046 	cp a,#TK_COMMA 
      009A2A CF 00            [ 1] 5047 	jreq 1$ 
      009A2C 18 81            [ 2] 5048 	jra 9$ 
      009A2E CD 11 7D         [ 4] 5049 1$:	call expression
      009A2E 72 BB            [ 1] 5050 	cp a,#TK_INTGR
      009A30 00 18            [ 1] 5051 	jreq 2$
      009A32 24 04 72         [ 2] 5052 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A35 5C               [ 1] 5053 2$:	ld a,xl 
      009A36 00 17            [ 2] 5054 	ldw x,(ADDR,sp) 
      009A38 CF 00 18         [ 2] 5055 	ldw farptr+1,x 
      009A3B 81               [ 1] 5056 	clrw x 
      009A3C CD 01 CD         [ 4] 5057 	call write_byte
      009A3C A6 01            [ 2] 5058 	ldw x,(ADDR,sp)
      009A3E C7               [ 2] 5059 	incw x 
      009A3F 00 17            [ 2] 5060 	jra 0$ 
      001CB6                       5061 9$:
      001CB6                       5062 	_drop VSIZE
      009A41 5F CF            [ 2]    1     addw sp,#VSIZE 
      009A43 00               [ 4] 5063 	ret 
                                   5064 
                                   5065 
                                   5066 ;---------------------
                                   5067 ;BASIC: CHAR(expr)
                                   5068 ; évaluate expression 
                                   5069 ; and take the 7 least 
                                   5070 ; bits as ASCII character
                                   5071 ;---------------------
      001CB9                       5072 char:
      009A44 18 10 7F         [ 4] 5073 	call func_args 
      009A45 A1 01            [ 1] 5074 	cp a,#1
      009A45 AE 00            [ 1] 5075 	jreq 1$
      009A47 03 92 AF         [ 2] 5076 	jp syntax_error
      009A4A 00               [ 2] 5077 1$:	popw x 
      009A4B 17               [ 1] 5078 	ld a,xl 
      009A4C 26 05            [ 1] 5079 	and a,#0x7f 
      009A4E 5A               [ 1] 5080 	ld xl,a
      009A4F 2A F7            [ 1] 5081 	ld a,#TK_CHAR
      009A51 20               [ 4] 5082 	ret
                                   5083 
                                   5084 ;---------------------
                                   5085 ; BASIC: ASC(string|char)
                                   5086 ; extract first character 
                                   5087 ; of string argument 
                                   5088 ; return it as TK_INTGR 
                                   5089 ;---------------------
      001CCB                       5090 ascii:
      009A52 0E AE            [ 1] 5091 	ld a,#TK_LPAREN
      009A54 00 80 CD         [ 4] 5092 	call expect 
      009A57 9A 2E AE         [ 4] 5093 	call next_token 
      009A5A 02 80            [ 1] 5094 	cp a,#TK_QSTR 
      009A5C C3 00            [ 1] 5095 	jreq 1$
      009A5E 17 2B            [ 1] 5096 	cp a,#TK_CHAR 
      009A60 E4 06            [ 1] 5097 	jreq 2$ 
      009A61 CC 08 75         [ 2] 5098 	jp syntax_error
      001CDE                       5099 1$: 
      009A61 CE               [ 1] 5100 	ld a,(x) 
      009A62 00               [ 1] 5101 	clrw x
      009A63 17               [ 1] 5102 	ld xl,a 
      001CE1                       5103 2$: 
      009A64 C6               [ 2] 5104 	pushw x 
      009A65 00 19            [ 1] 5105 	ld a,#TK_RPAREN 
      009A67 CF 00 1A         [ 4] 5106 	call expect
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A6A C7               [ 2] 5107 	popw x 
      009A6B 00 1C            [ 1] 5108 	ld a,#TK_INTGR 
      009A6D 81               [ 4] 5109 	ret 
                                   5110 
                                   5111 ;---------------------
                                   5112 ;BASIC: KEY
                                   5113 ; wait for a character 
                                   5114 ; received from STDIN 
                                   5115 ; input:
                                   5116 ;	none 
                                   5117 ; output:
                                   5118 ;	X 		ASCII character 
                                   5119 ;---------------------
      009A6E                       5120 key:
      009A6E AE 80 00         [ 4] 5121 	call getc 
      009A71 72               [ 1] 5122 	clrw x 
      009A72 B0               [ 1] 5123 	ld xl,a 
      009A73 00 1B            [ 1] 5124 	ld a,#TK_INTGR
      009A75 A6               [ 4] 5125 	ret
                                   5126 
                                   5127 ;----------------------
                                   5128 ; BASIC: QKEY
                                   5129 ; Return true if there 
                                   5130 ; is a character in 
                                   5131 ; waiting in STDIN 
                                   5132 ; input:
                                   5133 ;  none 
                                   5134 ; output:
                                   5135 ;   X 		0|-1 
                                   5136 ;-----------------------
      001CF3                       5137 qkey:: 
      009A76 02               [ 1] 5138 	clrw x 
      009A77 C2 00 1A C7      [ 1] 5139 	tnz rx_char
      009A7B 00 0C            [ 1] 5140 	jreq 9$ 
      009A7D CF               [ 2] 5141 	cplw x 
      009A7E 00 0D            [ 1] 5142 9$: ld a,#TK_INTGR
      009A80 81               [ 4] 5143 	ret 
                                   5144 
                                   5145 ;---------------------
                                   5146 ; BASIC: GPIO(expr,reg)
                                   5147 ; return gpio address 
                                   5148 ; expr {0..8}
                                   5149 ; input:
                                   5150 ;   none 
                                   5151 ; output:
                                   5152 ;   X 		gpio register address
                                   5153 ;----------------------------
                           000003  5154 	PORT=3
                           000001  5155 	REG=1 
                           000004  5156 	VSIZE=4 
      009A81                       5157 gpio:
      009A81 5F 92 AF         [ 4] 5158 	call func_args 
      009A84 00 17            [ 1] 5159 	cp a,#2
      009A86 90 F1            [ 1] 5160 	jreq 1$
      009A88 26 08 4D         [ 2] 5161 	jp syntax_error  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      001D08                       5162 1$:	
      009A8B 27 12            [ 2] 5163 	ldw x,(PORT,sp)
      009A8D 5C 90            [ 1] 5164 	jrmi bad_port
      009A8F 5C 20 F0         [ 2] 5165 	cpw x,#9
      009A92 2A 12            [ 1] 5166 	jrpl bad_port
      009A92 4D 27            [ 1] 5167 	ld a,#5
      009A94 07               [ 4] 5168 	mul x,a
      009A95 5C 92 AF         [ 2] 5169 	addw x,#GPIO_BASE 
      009A98 00 17            [ 2] 5170 	ldw (PORT,sp),x  
      009A9A 20 F6            [ 2] 5171 	ldw x,(REG,sp) 
      009A9C 5C 98 81         [ 2] 5172 	addw x,(PORT,sp)
      009A9F A6 84            [ 1] 5173 	ld a,#TK_INTGR
      001D20                       5174 	_drop VSIZE 
      009A9F 5C 99            [ 2]    1     addw sp,#VSIZE 
      009AA1 81               [ 4] 5175 	ret
      009AA2                       5176 bad_port:
      009AA2 52 04            [ 1] 5177 	ld a,#ERR_BAD_VALUE
      009AA4 17 03 5F         [ 2] 5178 	jp tb_error
                                   5179 
                                   5180 
                                   5181 ;-------------------------
                                   5182 ; BASIC: UFLASH 
                                   5183 ; return user flash address
                                   5184 ; input:
                                   5185 ;  none 
                                   5186 ; output:
                                   5187 ;	A		TK_INTGR
                                   5188 ;   X 		user address 
                                   5189 ;---------------------------
      001D28                       5190 uflash:
      009AA7 CF 00 18         [ 2] 5191 	ldw x,#user_space 
      009AAA 35 01            [ 1] 5192 	ld a,#TK_INTGR 
      009AAC 00               [ 4] 5193 	ret 
                                   5194 
                                   5195 
                                   5196 ;---------------------
                                   5197 ; BASIC: USR(addr[,arg])
                                   5198 ; execute a function written 
                                   5199 ; in binary code.
                                   5200 ; binary fonction should 
                                   5201 ; return token attribute in A 
                                   5202 ; and value in X. 
                                   5203 ; input:
                                   5204 ;   addr	routine address 
                                   5205 ;   arg 	is an optional argument 
                                   5206 ; output:
                                   5207 ;   A 		token attribute 
                                   5208 ;   X       returned value 
                                   5209 ;---------------------
      001D2E                       5210 usr:
      009AAD 17 89            [ 2] 5211 	pushw y 	
      009AAE CD 10 7F         [ 4] 5212 	call func_args 
      009AAE 92 BC            [ 1] 5213 	cp a,#1 
      009AB0 00 17            [ 1] 5214 	jreq 2$
      009AB2 27 27            [ 1] 5215 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009AB4 5F 16            [ 1] 5216 	jreq 2$  
      009AB6 03 CD 9A         [ 2] 5217 	jp syntax_error 
      009AB9 81 25            [ 2] 5218 2$: popw y  ; arg|addr 
      009ABB 2F 92            [ 1] 5219 	cp a,#1
      009ABD AF 00            [ 1] 5220 	jreq 3$
      009ABF 17               [ 2] 5221 	popw x ; addr
      009AC0 6B               [ 1] 5222 	exgw x,y 
      009AC1 01 5C            [ 4] 5223 3$: call (y)
      009AC3 92 AF            [ 2] 5224 	popw y 
      009AC5 00               [ 4] 5225 	ret 
                                   5226 
                                   5227 ;------------------------------
                                   5228 ; BASIC: BYE 
                                   5229 ; halt mcu in its lowest power mode 
                                   5230 ; wait for reset or external interrupt
                                   5231 ; do a cold start on wakeup.
                                   5232 ;------------------------------
      001D4B                       5233 bye:
      009AC6 17 6B 02 5C 72   [ 2] 5234 	btjf UART1_SR,#UART_SR_TC,.
      009ACB FB               [10] 5235 	halt
      009ACC 01 CD 9A         [ 2] 5236 	jp cold_start  
                                   5237 
                                   5238 ;----------------------------------
                                   5239 ; BASIC: AUTORUN ["file_name"] 
                                   5240 ; record in eeprom at adrress AUTORUN_NAME
                                   5241 ; the name of file to load and execute
                                   5242 ; at startup. 
                                   5243 ; empty string delete autorun name 
                                   5244 ; no argument display autorun name  
                                   5245 ; input:
                                   5246 ;   file_name   file to execute 
                                   5247 ; output:
                                   5248 ;   none
                                   5249 ;-----------------------------------
      001D54                       5250 autorun: 
      009ACF 2E CD 9A 13 AE   [ 2] 5251 	btjf flags,#FRUN,0$ 
      009AD4 02 80            [ 1] 5252 	jreq 0$ 
      009AD6 C3 00            [ 1] 5253 	ld a,#ERR_CMD_ONLY 
      009AD8 17 2A D3         [ 2] 5254 	jp tb_error 
      009ADB                       5255 0$:	
      009ADB 72 5F 00         [ 4] 5256 	call next_token
      009ADE 17 72            [ 1] 5257 	jrne 1$
      009AE0 5F 00 18         [ 2] 5258 	ldw x,#AUTORUN_NAME
      009AE3 72 5F 00         [ 4] 5259 	call puts 
      009AE6 19               [ 1] 5260 	clr a 
      009AE7 5B               [ 4] 5261 	ret 
      001D6D                       5262 1$:
      009AE8 04 98            [ 1] 5263 	cp a,#TK_QSTR
      009AEA 81 03            [ 1] 5264 	jreq 2$
      009AEB CC 08 75         [ 2] 5265 	jp syntax_error 
      001D74                       5266 2$:	
      009AEB 5B               [ 1] 5267 	tnz (x) 
      009AEC 04 99            [ 1] 5268 	jrne 3$
                                   5269 ; empty string, delete autorun 	
      009AEE 81 06 94         [ 4] 5270 	call cancel_autorun
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009AEF 55 00 03 00 01   [ 1] 5271 	mov in,count 
      009AEF 72               [ 4] 5272 	ret 
      009AF0 01               [ 2] 5273 3$:	pushw x 
      009AF1 00 24            [ 1] 5274 	ldw y,x  
      009AF3 05 A6 07         [ 4] 5275 	call search_file 
      009AF6 CC 88            [ 1] 5276 	jrc 4$ 
      009AF8 F7 09            [ 1] 5277 	ld a,#ERR_NOT_FILE
      009AF9 CC 08 77         [ 2] 5278 	jp tb_error  
      001D8D                       5279 4$: 
      009AF9 CE 00 1F 72 B0   [ 1] 5280 	mov in,count 
      009AFE 00 1D 26 0C      [ 1] 5281 	clr farptr 
      009B02 AE 88 90         [ 2] 5282 	ldw x,#AUTORUN_NAME
      009B05 CD 83 33         [ 2] 5283 	ldw farptr+1,x 
      009B08 55 00            [ 2] 5284 	ldw x,(1,sp)  
      009B0A 04 00 02         [ 4] 5285 	call strlen  ; return length in X 
      009B0D 81               [ 2] 5286 	incw x 
      009B0E 90 85            [ 2] 5287 	popw y 
      009B0E 52               [ 2] 5288 	pushw x 
      009B0F 08               [ 1] 5289 	clrw x 
      009B10 1F 01 CD         [ 4] 5290 	call write_block 
      001DA9                       5291 	_drop 2 
      009B13 89 E7            [ 2]    1     addw sp,#2 
      009B15 A1               [ 4] 5292 	ret 
                                   5293 
                                   5294 ;----------------------------------
                                   5295 ; BASIC: SLEEP 
                                   5296 ; halt mcu until reset or external
                                   5297 ; interrupt.
                                   5298 ; Resume progam after SLEEP command
                                   5299 ;----------------------------------
      001DAC                       5300 sleep:
      009B16 02 27 03 CC 88   [ 2] 5301 	btjf UART1_SR,#UART_SR_TC,.
      009B1B F5 16 00 23      [ 1] 5302 	bset flags,#FSLEEP
      009B1C 8E               [10] 5303 	halt 
      009B1C 1F               [ 4] 5304 	ret 
                                   5305 
                                   5306 ;-------------------------------
                                   5307 ; BASIC: PAUSE expr 
                                   5308 ; suspend execution for n msec.
                                   5309 ; input:
                                   5310 ;	none
                                   5311 ; output:
                                   5312 ;	none 
                                   5313 ;------------------------------
      001DB7                       5314 pause:
      009B1D 03 CD 81         [ 4] 5315 	call expression
      009B20 DC CD            [ 1] 5316 	cp a,#TK_INTGR
      009B22 84 12            [ 1] 5317 	jreq pause02 
      009B24 1C 00 03         [ 2] 5318 	jp syntax_error
      001DC1                       5319 pause02: 
      009B27 72               [ 2] 5320 1$: tnzw x 
      009B28 FB 01            [ 1] 5321 	jreq 2$
      009B2A 4F               [10] 5322 	wfi 
      009B2B 72               [ 2] 5323 	decw x 
      009B2C BB 00            [ 1] 5324 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B2E 1B               [ 1] 5325 2$:	clr a 
      009B2F C9               [ 4] 5326 	ret 
                                   5327 
                                   5328 ;------------------------------
                                   5329 ; BASIC: AWU expr
                                   5330 ; halt mcu for 'expr' milliseconds
                                   5331 ; use Auto wakeup peripheral
                                   5332 ; all oscillators stopped except LSI
                                   5333 ; range: 1ms - 511ms
                                   5334 ; input:
                                   5335 ;  none
                                   5336 ; output:
                                   5337 ;  none:
                                   5338 ;------------------------------
      001DCA                       5339 awu:
      009B30 00 1A A1         [ 4] 5340   call expression
      009B33 02 2B            [ 1] 5341   cp a,#TK_INTGR
      009B35 0A A3            [ 1] 5342   jreq awu02
      009B37 80 00 2B         [ 2] 5343   jp syntax_error
      001DD4                       5344 awu02:
      009B3A 05 A6 0E         [ 2] 5345   cpw x,#5120
      009B3D CC 88            [ 1] 5346   jrmi 1$ 
      009B3F F7 0F 50 F2      [ 1] 5347   mov AWU_TBR,#15 
      009B40 A6 1E            [ 1] 5348   ld a,#30
      009B40 16               [ 2] 5349   div x,a
      009B41 03 CD            [ 1] 5350   ld a,#16
      009B43 9A               [ 2] 5351   div x,a 
      009B44 A2 24            [ 2] 5352   jra 4$
      001DE5                       5353 1$: 
      009B46 05 A6 08         [ 2] 5354   cpw x,#2048
      009B49 CC 88            [ 1] 5355   jrmi 2$ 
      009B4B F7 0E 50 F2      [ 1] 5356   mov AWU_TBR,#14
      009B4C A6 50            [ 1] 5357   ld a,#80
      009B4C CE               [ 2] 5358   div x,a 
      009B4D 00 1A            [ 2] 5359   jra 4$   
      001DF3                       5360 2$:
      009B4F C6 00 1C CF      [ 1] 5361   mov AWU_TBR,#7
      001DF7                       5362 3$:  
                                   5363 ; while X > 64  divide by 2 and increment AWU_TBR 
      009B53 00 17 C7         [ 2] 5364   cpw x,#64 
      009B56 00 19            [ 2] 5365   jrule 4$ 
      009B58 16 03 AE 16      [ 1] 5366   inc AWU_TBR 
      009B5C E0               [ 2] 5367   srlw x 
      009B5D CD 84            [ 2] 5368   jra 3$ 
      001E03                       5369 4$:
      009B5F 30               [ 1] 5370   ld a, xl
      009B60 CD               [ 1] 5371   dec a 
      009B61 84 12            [ 1] 5372   jreq 5$
      009B63 5C               [ 1] 5373   dec a 	
      001E08                       5374 5$: 
      009B64 1C 16            [ 1] 5375   and a,#0x3e 
      009B66 E0 16 01         [ 1] 5376   ld AWU_APR,a 
      009B69 FF 1C 00 02      [ 1] 5377   bset AWU_CSR,#AWU_CSR_AWUEN
      009B6D 90               [10] 5378   halt 
                                   5379 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009B6E CE               [ 4] 5380   ret 
                                   5381 
                                   5382 ;------------------------------
                                   5383 ; BASIC: TICKS
                                   5384 ; return msec ticks counter value 
                                   5385 ; input:
                                   5386 ; 	none 
                                   5387 ; output:
                                   5388 ;	X 		TK_INTGR
                                   5389 ;-------------------------------
      001E13                       5390 get_ticks:
      009B6F 00 1D 90         [ 2] 5391 	ldw x,ticks 
      009B72 F6 90            [ 1] 5392 	ld a,#TK_INTGR
      009B74 5C               [ 4] 5393 	ret 
                                   5394 
                                   5395 
                                   5396 
                                   5397 ;------------------------------
                                   5398 ; BASIC: ABS(expr)
                                   5399 ; return absolute value of expr.
                                   5400 ; input:
                                   5401 ;   none
                                   5402 ; output:
                                   5403 ;   X     	positive integer
                                   5404 ;-------------------------------
      001E19                       5405 abs:
      009B75 F7 5C 90         [ 4] 5406 	call func_args 
      009B78 C3 00            [ 1] 5407 	cp a,#1 
      009B7A 1F 27            [ 1] 5408 	jreq 0$ 
      009B7C 05 A3 17         [ 2] 5409 	jp syntax_error
      001E23                       5410 0$:  
      009B7F 60               [ 2] 5411     popw x   
      009B80 2B               [ 1] 5412 	ld a,xh 
      009B81 EF 80            [ 1] 5413 	bcp a,#0x80 
      009B82 27 01            [ 1] 5414 	jreq 2$ 
      009B82 17               [ 2] 5415 	negw x 
      009B83 07 84            [ 1] 5416 2$: ld a,#TK_INTGR 
      009B84 81               [ 4] 5417 	ret 
                                   5418 
                                   5419 ;------------------------------
                                   5420 ; BASIC: AND(expr1,expr2)
                                   5421 ; Apply bit AND relation between
                                   5422 ; the 2 arguments, i.e expr1 & expr2 
                                   5423 ; output:
                                   5424 ; 	A 		TK_INTGR
                                   5425 ;   X 		result 
                                   5426 ;------------------------------
      001E2D                       5427 bit_and:
      009B84 A3 17 60         [ 4] 5428 	call func_args 
      009B87 27 04            [ 1] 5429 	cp a,#2
      009B89 7F 5C            [ 1] 5430 	jreq 1$
      009B8B 20 F7 75         [ 2] 5431 	jp syntax_error 
      009B8D 85               [ 2] 5432 1$:	popw x 
      009B8D AE               [ 1] 5433 	ld a,xh 
      009B8E 16 E0            [ 1] 5434 	and a,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009B90 CD               [ 1] 5435 	ld xh,a 
      009B91 81               [ 1] 5436 	ld a,xl
      009B92 F0 AE            [ 1] 5437 	and a,(2,sp)
      009B94 00               [ 1] 5438 	ld xl,a 
      001E40                       5439 	_drop 2 
      009B95 80 CD            [ 2]    1     addw sp,#2 
      009B97 9A 2E            [ 1] 5440 	ld a,#TK_INTGR
      009B99 AE               [ 4] 5441 	ret
                                   5442 
                                   5443 ;------------------------------
                                   5444 ; BASIC: OR(expr1,expr2)
                                   5445 ; Apply bit OR relation between
                                   5446 ; the 2 arguments, i.e expr1 | expr2 
                                   5447 ; output:
                                   5448 ; 	A 		TK_INTGR
                                   5449 ;   X 		result 
                                   5450 ;------------------------------
      001E45                       5451 bit_or:
      009B9A 16 E0 16         [ 4] 5452 	call func_args 
      009B9D 07 90            [ 1] 5453 	cp a,#2
      009B9F C3 00            [ 1] 5454 	jreq 1$
      009BA1 1F 2B CD         [ 2] 5455 	jp syntax_error 
      001E4F                       5456 1$: 
      009BA4 CE               [ 2] 5457 	popw x 
      009BA5 00               [ 1] 5458 	ld a,xh 
      009BA6 17 C6            [ 1] 5459 	or a,(1,sp)
      009BA8 00               [ 1] 5460 	ld xh,a 
      009BA9 19               [ 1] 5461 	ld a,xl 
      009BAA CF 00            [ 1] 5462 	or a,(2,sp)
      009BAC 1A               [ 1] 5463 	ld xl,a 
      001E58                       5464 	_drop 2 
      009BAD C7 00            [ 2]    1     addw sp,#2 
      009BAF 1C 1E            [ 1] 5465 	ld a,#TK_INTGR 
      009BB1 01               [ 4] 5466 	ret
                                   5467 
                                   5468 ;------------------------------
                                   5469 ; BASIC: XOR(expr1,expr2)
                                   5470 ; Apply bit XOR relation between
                                   5471 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5472 ; output:
                                   5473 ; 	A 		TK_INTGR
                                   5474 ;   X 		result 
                                   5475 ;------------------------------
      001E5D                       5476 bit_xor:
      009BB2 CD 8A 3C         [ 4] 5477 	call func_args 
      009BB5 5B 08            [ 1] 5478 	cp a,#2
      009BB7 81 03            [ 1] 5479 	jreq 1$
      009BB8 CC 08 75         [ 2] 5480 	jp syntax_error 
      001E67                       5481 1$: 
      009BB8 CD               [ 2] 5482 	popw x 
      009BB9 9A               [ 1] 5483 	ld a,xh 
      009BBA 2E CD            [ 1] 5484 	xor a,(1,sp)
      009BBC 87               [ 1] 5485 	ld xh,a 
      009BBD 61               [ 1] 5486 	ld a,xl 
      009BBE 5F 92            [ 1] 5487 	xor a,(2,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009BC0 AF               [ 1] 5488 	ld xl,a 
      001E70                       5489 	_drop 2 
      009BC1 00 17            [ 2]    1     addw sp,#2 
      009BC3 90 95            [ 1] 5490 	ld a,#TK_INTGR 
      009BC5 5C               [ 4] 5491 	ret 
                                   5492 
                                   5493 ;------------------------------
                                   5494 ; BASIC: LSHIFT(expr1,expr2)
                                   5495 ; logical shift left expr1 by 
                                   5496 ; expr2 bits 
                                   5497 ; output:
                                   5498 ; 	A 		TK_INTGR
                                   5499 ;   X 		result 
                                   5500 ;------------------------------
      001E75                       5501 lshift:
      009BC6 92 AF 00         [ 4] 5502 	call func_args
      009BC9 17 5C            [ 1] 5503 	cp a,#2 
      009BCB 90 97            [ 1] 5504 	jreq 1$
      009BCD 72 B9 00         [ 2] 5505 	jp syntax_error
      009BD0 1D 90            [ 2] 5506 1$: popw y   
      009BD2 CF               [ 2] 5507 	popw x 
      009BD3 00 1F            [ 2] 5508 	tnzw y 
      009BD5 90 CE            [ 1] 5509 	jreq 4$
      009BD7 00               [ 2] 5510 2$:	sllw x 
      009BD8 1D 5A            [ 2] 5511 	decw y 
      009BD9 26 FB            [ 1] 5512 	jrne 2$
      001E8B                       5513 4$:  
      009BD9 92 AF            [ 1] 5514 	ld a,#TK_INTGR
      009BDB 00               [ 4] 5515 	ret
                                   5516 
                                   5517 ;------------------------------
                                   5518 ; BASIC: RSHIFT(expr1,expr2)
                                   5519 ; logical shift right expr1 by 
                                   5520 ; expr2 bits.
                                   5521 ; output:
                                   5522 ; 	A 		TK_INTGR
                                   5523 ;   X 		result 
                                   5524 ;------------------------------
      001E8E                       5525 rshift:
      009BDC 17 90 F7         [ 4] 5526 	call func_args
      009BDF 5C 90            [ 1] 5527 	cp a,#2 
      009BE1 5C 90            [ 1] 5528 	jreq 1$
      009BE3 C3 00 1F         [ 2] 5529 	jp syntax_error
      009BE6 2B F1            [ 2] 5530 1$: popw y  
      009BE8 81               [ 2] 5531 	popw x
      009BE9 90 5D            [ 2] 5532 	tnzw y 
      009BE9 72 01            [ 1] 5533 	jreq 4$
      009BEB 00               [ 2] 5534 2$:	srlw x 
      009BEC 24 07            [ 2] 5535 	decw y 
      009BEE 27 05            [ 1] 5536 	jrne 2$
      001EA4                       5537 4$:  
      009BF0 A6 07            [ 1] 5538 	ld a,#TK_INTGR
      009BF2 CC               [ 4] 5539 	ret
                                   5540 
                                   5541 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   5542 ; BASIC: FCPU integer
                                   5543 ; set CPU frequency 
                                   5544 ;-------------------------- 
                                   5545 
      001EA7                       5546 fcpu:
      009BF3 88 F7            [ 1] 5547 	ld a,#TK_INTGR
      009BF5 CD 10 72         [ 4] 5548 	call expect 
      009BF5 CD               [ 1] 5549 	ld a,xl 
      009BF6 89 E7            [ 1] 5550 	and a,#7 
      009BF8 A1 02 27         [ 1] 5551 	ld CLK_CKDIVR,a 
      009BFB 03               [ 4] 5552 	ret 
                                   5553 
                                   5554 ;------------------------------
                                   5555 ; BASIC: PMODE pin#, mode 
                                   5556 ; Arduino pin. 
                                   5557 ; define pin as input or output
                                   5558 ; pin#: {0..15}
                                   5559 ; mode: INPUT|OUTPUT  
                                   5560 ;------------------------------
                           000001  5561 	PINNO=1
                           000001  5562 	VSIZE=1
      001EB3                       5563 pin_mode:
      001EB3                       5564 	_vars VSIZE 
      009BFC CC 88            [ 2]    1     sub sp,#VSIZE 
      009BFE F5 90 93         [ 4] 5565 	call arg_list 
      009C01 CD 9A            [ 1] 5566 	cp a,#2 
      009C03 A2 25            [ 1] 5567 	jreq 1$
      009C05 05 A6 09         [ 2] 5568 	jp syntax_error 
      009C08 CC 88            [ 2] 5569 1$: popw y ; mode 
      009C0A F7               [ 2] 5570 	popw x ; Dx pin 
      009C0B CD 1E F4         [ 4] 5571 	call select_pin 
      009C0B CD 9B            [ 1] 5572 	ld (PINNO,sp),a  
      009C0D B8 CE            [ 1] 5573 	ld a,#1 
      009C0F 00 1F            [ 1] 5574 	tnz (PINNO,sp)
      009C11 72 B0            [ 1] 5575 	jreq 4$
      009C13 00               [ 1] 5576 2$:	sll a 
      009C14 1D CD            [ 1] 5577 	dec (PINNO,sp)
      009C16 8A 3C            [ 1] 5578 	jrne 2$ 
      009C18 81 01            [ 1] 5579 	ld (PINNO,sp),a
      009C19 EA 03            [ 1] 5580 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009C19 52 03            [ 1] 5581 	ld (GPIO_CR1,x),a 
      009C1B CD 89 E7 A1      [ 2] 5582 4$:	cpw y,#OUTP 
      009C1F 00 27            [ 1] 5583 	jreq 6$
                                   5584 ; input mode
      009C21 20 A1            [ 1] 5585 	ld a,(PINNO,sp)
      009C23 02               [ 1] 5586 	cpl a 
      009C24 27 03            [ 1] 5587 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009C26 CC 88            [ 2] 5588 	jra 9$
      001EE5                       5589 6$: ;output mode  
      009C28 F5 90            [ 1] 5590 	ld a,(PINNO,sp)
      009C2A 93 55            [ 1] 5591 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009C2C 00 04            [ 1] 5592 	ld (GPIO_CR2,x),a 
      009C2E 00 02            [ 1] 5593 	ld a,(PINNO,sp)
      009C30 CD 9A            [ 1] 5594 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009C32 A2 25            [ 1] 5595 9$:	ld (GPIO_DDR,x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      001EF1                       5596 	_drop VSIZE 
      009C34 05 A6            [ 2]    1     addw sp,#VSIZE 
      009C36 09               [ 4] 5597 	ret
                                   5598 
                                   5599 ;------------------------
                                   5600 ; select Arduino pin 
                                   5601 ; input:
                                   5602 ;   X 	 {0..15} Arduino Dx 
                                   5603 ; output:
                                   5604 ;   A     stm8s208 pin 
                                   5605 ;   X     base address s208 GPIO port 
                                   5606 ;---------------------------
      001EF4                       5607 select_pin:
      009C37 CC               [ 2] 5608 	sllw x 
      009C38 88 F7 04         [ 2] 5609 	addw x,#arduino_to_8s208 
      009C3A FE               [ 2] 5610 	ldw x,(x)
      009C3A CE               [ 1] 5611 	ld a,xl 
      009C3B 00               [ 1] 5612 	push a 
      009C3C 17               [ 1] 5613 	swapw x 
      009C3D C6 00            [ 1] 5614 	ld a,#5 
      009C3F 19               [ 4] 5615 	mul x,a 
      009C40 20 0A 00         [ 2] 5616 	addw x,#GPIO_BASE 
      009C42 84               [ 1] 5617 	pop a 
      009C42 AE               [ 4] 5618 	ret 
                                   5619 ; translation from Arduino D0..D15 to stm8s208rb 
      001F04                       5620 arduino_to_8s208:
      009C43 01 00                 5621 .byte 3,6 ; D0 
      009C45 4F CF                 5622 .byte 3,5 ; D1 
      009C47 00 17                 5623 .byte 4,0 ; D2 
      009C49 C7 00                 5624 .byte 2,1 ; D3
      009C4B 19 00                 5625 .byte 6,0 ; D4
      009C4C 02 02                 5626 .byte 2,2 ; D5
      009C4C 1F 01                 5627 .byte 2,3 ; D6
      009C4E 6B 03                 5628 .byte 3,1 ; D7
      009C50 CD 81                 5629 .byte 3,3 ; D8
      009C52 A8 CD                 5630 .byte 2,4 ; D9
      009C54 82 23                 5631 .byte 4,5 ; D10
      009C56 AE 00                 5632 .byte 2,6 ; D11
      009C58 80 CD                 5633 .byte 2,7 ; D12
      009C5A 9A 2E                 5634 .byte 2,5 ; D13
      009C5C CD 9A                 5635 .byte 4,2 ; D14
      009C5E 13 C6                 5636 .byte 4,1 ; D15
                                   5637 
                                   5638 
                                   5639 ;------------------------------
                                   5640 ; BASIC: RND(expr)
                                   5641 ; return random number 
                                   5642 ; between 1 and expr inclusive
                                   5643 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5644 ; input:
                                   5645 ; 	none 
                                   5646 ; output:
                                   5647 ;	X 		random positive integer 
                                   5648 ;------------------------------
      001F24                       5649 random:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009C60 00 19 C0         [ 4] 5650 	call func_args 
      009C63 00 1C            [ 1] 5651 	cp a,#1
      009C65 C6 00            [ 1] 5652 	jreq 1$
      009C67 18 C2 00         [ 2] 5653 	jp syntax_error
      001F2E                       5654 1$:  
      009C6A 1B C6            [ 1] 5655 	ld a,#0x80 
      009C6C 00 17            [ 1] 5656 	bcp a,(1,sp)
      009C6E C2 00            [ 1] 5657 	jreq 2$
      009C70 1A 2B            [ 1] 5658 	ld a,#ERR_BAD_VALUE
      009C72 E0 7B 03         [ 2] 5659 	jp tb_error
      001F39                       5660 2$: 
                                   5661 ; acc16=(x<<5)^x 
      009C75 1E 01 C7         [ 2] 5662 	ldw x,seedx 
      009C78 00               [ 2] 5663 	sllw x 
      009C79 1C               [ 2] 5664 	sllw x 
      009C7A CF               [ 2] 5665 	sllw x 
      009C7B 00               [ 2] 5666 	sllw x 
      009C7C 1A               [ 2] 5667 	sllw x 
      009C7D 5B               [ 1] 5668 	ld a,xh 
      009C7E 03 81 12         [ 1] 5669 	xor a,seedx 
      009C80 C7 00 0C         [ 1] 5670 	ld acc16,a 
      009C80 52               [ 1] 5671 	ld a,xl 
      009C81 02 5F 1F         [ 1] 5672 	xor a,seedx+1 
      009C84 01 CF 00         [ 1] 5673 	ld acc8,a 
                                   5674 ; seedx=seedy 
      009C87 18 35 01         [ 2] 5675 	ldw x,seedy 
      009C8A 00 17 12         [ 2] 5676 	ldw seedx,x  
                                   5677 ; seedy=seedy^(seedy>>1)
      009C8C 90 54            [ 2] 5678 	srlw y 
      009C8C 5F 92            [ 1] 5679 	ld a,yh 
      009C8E AF 00 17         [ 1] 5680 	xor a,seedy 
      009C91 27 3B 14         [ 1] 5681 	ld seedy,a  
      009C93 90 9F            [ 1] 5682 	ld a,yl 
      009C93 92 AF 00         [ 1] 5683 	xor a,seedy+1 
      009C96 17 27 06         [ 1] 5684 	ld seedy+1,a 
                                   5685 ; acc16>>3 
      009C99 CD 83 20         [ 2] 5686 	ldw x,acc16 
      009C9C 5C               [ 2] 5687 	srlw x 
      009C9D 20               [ 2] 5688 	srlw x 
      009C9E F4               [ 2] 5689 	srlw x 
                                   5690 ; x=acc16^x 
      009C9F 5C               [ 1] 5691 	ld a,xh 
      009CA0 A6 20 CD         [ 1] 5692 	xor a,acc16 
      009CA3 83               [ 1] 5693 	ld xh,a 
      009CA4 20               [ 1] 5694 	ld a,xl 
      009CA5 92 AF 00         [ 1] 5695 	xor a,acc8 
      009CA8 17               [ 1] 5696 	ld xl,a 
                                   5697 ; seedy=x^seedy 
      009CA9 90 95 5C         [ 1] 5698 	xor a,seedy+1
      009CAC 92               [ 1] 5699 	ld xl,a 
      009CAD AF               [ 1] 5700 	ld a,xh 
      009CAE 00 17 5C         [ 1] 5701 	xor a,seedy
      009CB1 90               [ 1] 5702 	ld xh,a 
      009CB2 97 90 89         [ 2] 5703 	ldw seedy,x 
                                   5704 ; return seedy modulo expr + 1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009CB5 72 FB            [ 2] 5705 	popw y 
      009CB7 01               [ 2] 5706 	divw x,y 
      009CB8 CD               [ 1] 5707 	ldw x,y 
      009CB9 9A               [ 2] 5708 	incw x 
      001F88                       5709 10$:
      009CBA 2E CD            [ 1] 5710 	ld a,#TK_INTGR
      009CBC 9A               [ 4] 5711 	ret 
                                   5712 
                                   5713 ;---------------------------------
                                   5714 ; BASIC: WORDS 
                                   5715 ; affiche la listes des mots du
                                   5716 ; dictionnaire ainsi que le nombre
                                   5717 ; de mots.
                                   5718 ;---------------------------------
                           000001  5719 	WLEN=1 ; word length
                           000002  5720 	LLEN=2 ; character sent to console
                           000003  5721 	WCNT=3 ; count words printed 
                           000003  5722 	VSIZE=3 
      001F8B                       5723 words:
      001F8B                       5724 	_vars VSIZE
      009CBD 13 85            [ 2]    1     sub sp,#VSIZE 
      009CBF CD 8A            [ 1] 5725 	clr (LLEN,sp)
      009CC1 3C A6            [ 1] 5726 	clr (WCNT,sp)
      009CC3 0D CD 83 20      [ 2] 5727 	ldw y,#kword_dict+2
      009CC7 1E               [ 1] 5728 0$:	ldw x,y
      009CC8 01               [ 1] 5729 	ld a,(x)
      009CC9 5C 1F            [ 1] 5730 	and a,#15 
      009CCB 01 20            [ 1] 5731 	ld (WLEN,sp),a 
      009CCD BE 03            [ 1] 5732 	inc (WCNT,sp)
      009CCE 5C               [ 2] 5733 1$:	incw x 
      009CCE 1E               [ 1] 5734 	ld a,(x)
      009CCF 01 CD 8A         [ 4] 5735 	call putc 
      009CD2 3C AE            [ 1] 5736 	inc (LLEN,sp)
      009CD4 9C ED            [ 1] 5737 	dec (WLEN,sp)
      009CD6 CD 83            [ 1] 5738 	jrne 1$
      009CD8 33 CD            [ 1] 5739 	ld a,#70
      009CDA 9A 6E            [ 1] 5740 	cp a,(LLEN,sp)
      009CDC 5F 35            [ 1] 5741 	jrmi 2$   
      009CDE 0A 00            [ 1] 5742 	ld a,#SPACE 
      009CE0 0B CD 8A         [ 4] 5743 	call putc 
      009CE3 4C AE            [ 1] 5744 	inc (LLEN,sp) 
      009CE5 9C F5            [ 2] 5745 	jra 3$
      009CE7 CD 83            [ 1] 5746 2$: ld a,#CR 
      009CE9 33 5B 02         [ 4] 5747 	call putc 
      009CEC 81 20            [ 1] 5748 	clr (LLEN,sp)
      009CEE 66 69 6C 65      [ 2] 5749 3$:	subw y,#2 
      009CF2 73 0A            [ 2] 5750 	ldw y,(y)
      009CF4 00 20            [ 1] 5751 	jrne 0$ 
      009CF6 62 79            [ 1] 5752 	ld a,#CR 
      009CF8 74 65 73         [ 4] 5753 	call putc  
      009CFB 20               [ 1] 5754 	clrw x 
      009CFC 66 72            [ 1] 5755 	ld a,(WCNT,sp)
      009CFE 65               [ 1] 5756 	ld xl,a 
      009CFF 65 0A 00         [ 4] 5757 	call print_int 
      009D02 AE 1F DB         [ 2] 5758 	ldw x,#words_count_msg
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009D02 52 02 72         [ 4] 5759 	call puts 
      001FD8                       5760 	_drop VSIZE 
      009D05 5F 00            [ 2]    1     addw sp,#VSIZE 
      009D07 17               [ 4] 5761 	ret 
      009D08 CD 91 FD A1 84 27 03  5762 words_count_msg: .asciz " words in dictionary\n"
             CC 88 F5 1F 01 CD 89
             E7 A1 09 27 02 20 19
             CD
                                   5763 
                                   5764 
                                   5765 ;-----------------------------
                                   5766 ; BASIC: TIMER expr 
                                   5767 ; initialize count down timer 
                                   5768 ;-----------------------------
      001FF1                       5769 set_timer:
      009D1E 91 FD A1         [ 4] 5770 	call arg_list
      009D21 84 27            [ 1] 5771 	cp a,#1 
      009D23 03 CC            [ 1] 5772 	jreq 1$
      009D25 88 F5 9F         [ 2] 5773 	jp syntax_error
      001FFB                       5774 1$: 
      009D28 1E               [ 2] 5775 	popw x 
      009D29 01 CF 00         [ 2] 5776 	ldw timer,x 
      009D2C 18               [ 4] 5777 	ret 
                                   5778 
                                   5779 ;------------------------------
                                   5780 ; BASIC: TIMEOUT 
                                   5781 ; return state of timer 
                                   5782 ;------------------------------
      002000                       5783 timeout:
      009D2D 5F CD 82         [ 2] 5784 	ldw x,timer 
      002003                       5785 logical_complement:
      009D30 4D               [ 2] 5786 	cplw x 
      009D31 1E 01 5C         [ 2] 5787 	cpw x,#-1
      009D34 20 DC            [ 1] 5788 	jreq 2$
      009D36 5F               [ 1] 5789 	clrw x 
      009D36 5B 02            [ 1] 5790 2$:	ld a,#TK_INTGR
      009D38 81               [ 4] 5791 	ret 
                                   5792 
                                   5793 ;--------------------------------
                                   5794 ; BASIC NOT(expr) 
                                   5795 ; return logical complement of expr
                                   5796 ;--------------------------------
      009D39                       5797 func_not:
      009D39 CD 90 FF         [ 4] 5798 	call func_args  
      009D3C A1 01            [ 1] 5799 	cp a,#1
      009D3E 27 03            [ 1] 5800 	jreq 1$
      009D40 CC 88 F5         [ 2] 5801 	jp syntax_error
      009D43 85               [ 2] 5802 1$:	popw x 
      009D44 9F A4            [ 2] 5803 	jra logical_complement
                                   5804 
                                   5805 
                                   5806 
                                   5807 ;-----------------------------------
                                   5808 ; BASIC: IWDGEN expr1 
                                   5809 ; enable independant watchdog timer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   5810 ; expr1 is delay in multiple of 62.5µsec
                                   5811 ; expr1 -> {1..16383}
                                   5812 ;-----------------------------------
      00201A                       5813 enable_iwdg:
      009D46 7F 97 A6         [ 4] 5814 	call arg_list
      009D49 03 81            [ 1] 5815 	cp a,#1 
      009D4B 27 03            [ 1] 5816 	jreq 1$
      009D4B A6 07 CD         [ 2] 5817 	jp syntax_error 
      009D4E 90               [ 2] 5818 1$: popw x 
      009D4F F2 CD            [ 1] 5819 	push #0
      009D51 89 E7 A1 02      [ 1] 5820 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009D55 27               [ 1] 5821 	ld a,xh 
      009D56 07 A1            [ 1] 5822 	and a,#0x3f
      009D58 03               [ 1] 5823 	ld xh,a  
      009D59 27 06 CC         [ 2] 5824 2$:	cpw x,#255
      009D5C 88 F5            [ 2] 5825 	jrule 3$
      009D5E 0C 01            [ 1] 5826 	inc (1,sp)
      009D5E F6               [ 1] 5827 	rcf 
      009D5F 5F               [ 2] 5828 	rrcw x 
      009D60 97 F5            [ 2] 5829 	jra 2$
      009D61 35 55 50 E0      [ 1] 5830 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009D61 89               [ 1] 5831 	pop a  
      009D62 A6 08 CD         [ 1] 5832 	ld IWDG_PR,a 
      009D65 90               [ 1] 5833 	ld a,xl
      009D66 F2               [ 1] 5834 	dec a 
      009D67 85 A6 84 81      [ 1] 5835 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009D6B C7 50 E2         [ 1] 5836 	ld IWDG_RLR,a 
      009D6B CD 83 29 5F      [ 1] 5837 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009D6F 97               [ 4] 5838 	ret 
                                   5839 
                                   5840 
                                   5841 ;-----------------------------------
                                   5842 ; BASIC: IWDGREF  
                                   5843 ; refresh independant watchdog count down 
                                   5844 ; timer before it reset MCU. 
                                   5845 ;-----------------------------------
      002050                       5846 refresh_iwdg:
      009D70 A6 84 81 E0      [ 1] 5847 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009D73 81               [ 4] 5848 	ret 
                                   5849 
                                   5850 
                                   5851 ;-------------------------------------
                                   5852 ; BASIC: LOG(expr)
                                   5853 ; return logarithm base 2 of expr 
                                   5854 ; this is the position of most significant
                                   5855 ; bit set. 
                                   5856 ; input: 
                                   5857 ; output:
                                   5858 ;   X     log2 
                                   5859 ;   A     TK_INTGR 
                                   5860 ;*********************************
      002055                       5861 log2:
      009D73 5F 72 5D         [ 4] 5862 	call func_args 
      009D76 00 26            [ 1] 5863 	cp a,#1 
      009D78 27 01            [ 1] 5864 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009D7A 53 A6 84         [ 2] 5865 	jp syntax_error 
      009D7D 81               [ 2] 5866 1$: popw x 
      009D7E                       5867 leading_one:
      009D7E CD               [ 2] 5868 	tnzw x 
      009D7F 90 FF            [ 1] 5869 	jreq 4$
      009D81 A1 02            [ 1] 5870 	ld a,#15 
      009D83 27               [ 2] 5871 2$: rlcw x 
      009D84 03 CC            [ 1] 5872     jrc 3$
      009D86 88               [ 1] 5873 	dec a 
      009D87 F5 FA            [ 2] 5874 	jra 2$
      009D88 5F               [ 1] 5875 3$: clrw x 
      009D88 1E               [ 1] 5876     ld xl,a
      009D89 03 2B            [ 1] 5877 4$:	ld a,#TK_INTGR
      009D8B 17               [ 4] 5878 	ret 
                                   5879 
                                   5880 ;-----------------------------------
                                   5881 ; BASIC: BIT(expr) 
                                   5882 ; expr ->{0..15}
                                   5883 ; return 2^expr 
                                   5884 ; output:
                                   5885 ;    x    2^expr 
                                   5886 ;-----------------------------------
      002070                       5887 bitmask:
      009D8C A3 00 09         [ 4] 5888     call func_args 
      009D8F 2A 12            [ 1] 5889 	cp a,#1
      009D91 A6 05            [ 1] 5890 	jreq 1$
      009D93 42 1C 50         [ 2] 5891 	jp syntax_error 
      009D96 00               [ 2] 5892 1$: popw x 
      009D97 1F               [ 1] 5893 	ld a,xl 
      009D98 03 1E            [ 1] 5894 	and a,#15
      009D9A 01               [ 1] 5895 	clrw x 
      009D9B 72               [ 2] 5896 	incw x 
      009D9C FB               [ 1] 5897 2$: tnz a 
      009D9D 03 A6            [ 1] 5898 	jreq 3$
      009D9F 84               [ 2] 5899 	slaw x 
      009DA0 5B               [ 1] 5900 	dec a 
      009DA1 04 81            [ 2] 5901 	jra 2$ 
      009DA3 A6 84            [ 1] 5902 3$: ld a,#TK_INTGR
      009DA3 A6               [ 4] 5903 	ret 
                                   5904 
                                   5905 ;------------------------------
                                   5906 ; BASIC: INVERT(expr)
                                   5907 ; 1's complement 
                                   5908 ;--------------------------------
      00208A                       5909 invert:
      009DA4 0A CC 88         [ 4] 5910 	call func_args
      009DA7 F7 01            [ 1] 5911 	cp a,#1 
      009DA8 27 03            [ 1] 5912 	jreq 1$
      009DA8 AE A7 80         [ 2] 5913 	jp syntax_error
      009DAB A6               [ 2] 5914 1$: popw x  
      009DAC 84               [ 2] 5915 	cplw x 
      009DAD 81 84            [ 1] 5916 	ld a,#TK_INTGR 
      009DAE 81               [ 4] 5917 	ret 
                                   5918 
                                   5919 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   5920 ; BASIC: DO 
                                   5921 ; initiate a DO ... UNTIL loop 
                                   5922 ;------------------------------
                           000003  5923 	DOLP_ADR=3 
                           000005  5924 	DOLP_INW=5
                           000004  5925 	VSIZE=4 
      002099                       5926 do_loop:
      009DAE 90               [ 2] 5927 	popw x 
      00209A                       5928 	_vars VSIZE 
      009DAF 89 CD            [ 2]    1     sub sp,#VSIZE 
      009DB1 90               [ 2] 5929 	pushw x 
      009DB2 FF A1 01 27      [ 2] 5930 	ldw y,basicptr 
      009DB6 07 A1            [ 2] 5931 	ldw (DOLP_ADR,sp),y
      009DB8 02 27 03 CC      [ 2] 5932 	ldw y,in.w 
      009DBC 88 F5            [ 2] 5933 	ldw (DOLP_INW,sp),y
      009DBE 90 85 A1 01      [ 1] 5934 	inc loop_depth 
      009DC2 27               [ 4] 5935 	ret 
                                   5936 
                                   5937 ;--------------------------------
                                   5938 ; BASIC: UNTIL expr 
                                   5939 ; loop if exprssion is false 
                                   5940 ; else terminate loop
                                   5941 ;--------------------------------
      0020AE                       5942 until: 
      009DC3 02 85 51 90      [ 1] 5943 	tnz loop_depth 
      009DC7 FD 90            [ 1] 5944 	jrne 1$ 
      009DC9 85 81 75         [ 2] 5945 	jp syntax_error 
      009DCB                       5946 1$: 
      009DCB 72 0D 52         [ 4] 5947 	call relation 
      009DCE 30 FB            [ 1] 5948 	cp a,#TK_INTGR
      009DD0 8E CC            [ 1] 5949 	jreq 2$
      009DD2 86 4B 75         [ 2] 5950 	jp syntax_error
      009DD4                       5951 2$: 
      009DD4 72               [ 2] 5952 	tnzw x 
      009DD5 01 00            [ 1] 5953 	jrne 9$
      009DD7 24 07            [ 2] 5954 	ldw x,(DOLP_ADR,sp)
      009DD9 27 05 A6         [ 2] 5955 	ldw basicptr,x 
      009DDC 07 CC            [ 1] 5956 	ld a,(2,x)
      009DDE 88 F7 03         [ 1] 5957 	ld count,a 
      009DE0 1E 05            [ 2] 5958 	ldw x,(DOLP_INW,sp)
      009DE0 CD 89 E7         [ 2] 5959 	ldw in.w,x 
      009DE3 26               [ 4] 5960 	ret 
      0020D4                       5961 9$:	; remove loop data from stack  
      009DE4 08               [ 2] 5962 	popw x
      0020D5                       5963 	_drop VSIZE
      009DE5 AE 40            [ 2]    1     addw sp,#VSIZE 
      009DE7 00 CD 83 33      [ 1] 5964 	dec loop_depth 
      009DEB 4F               [ 2] 5965 	jp (x)
                                   5966 
                                   5967 ;--------------------------
                                   5968 ; BASIC: PRTA...PRTI  
                                   5969 ;  return constant value 
                                   5970 ;  PORT  offset in GPIO
                                   5971 ;  array
                                   5972 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      0020DC                       5973 const_porta:
      009DEC 81 00 00         [ 2] 5974 	ldw x,#0
      009DED A6 84            [ 1] 5975 	ld a,#TK_INTGR 
      009DED A1               [ 4] 5976 	ret 
      0020E2                       5977 const_portb:
      009DEE 02 27 03         [ 2] 5978 	ldw x,#1
      009DF1 CC 88            [ 1] 5979 	ld a,#TK_INTGR 
      009DF3 F5               [ 4] 5980 	ret 
      009DF4                       5981 const_portc:
      009DF4 7D 26 09         [ 2] 5982 	ldw x,#2
      009DF7 CD 87            [ 1] 5983 	ld a,#TK_INTGR 
      009DF9 14               [ 4] 5984 	ret 
      0020EE                       5985 const_portd:
      009DFA 55 00 04         [ 2] 5986 	ldw x,#3
      009DFD 00 02            [ 1] 5987 	ld a,#TK_INTGR 
      009DFF 81               [ 4] 5988 	ret 
      0020F4                       5989 const_porte:
      009E00 89 90 93         [ 2] 5990 	ldw x,#4
      009E03 CD 9A            [ 1] 5991 	ld a,#TK_INTGR 
      009E05 A2               [ 4] 5992 	ret 
      0020FA                       5993 const_portf:
      009E06 25 05 A6         [ 2] 5994 	ldw x,#5
      009E09 09 CC            [ 1] 5995 	ld a,#TK_INTGR 
      009E0B 88               [ 4] 5996 	ret 
      002100                       5997 const_portg:
      009E0C F7 00 06         [ 2] 5998 	ldw x,#6
      009E0D A6 84            [ 1] 5999 	ld a,#TK_INTGR 
      009E0D 55               [ 4] 6000 	ret 
      002106                       6001 const_porth:
      009E0E 00 04 00         [ 2] 6002 	ldw x,#7
      009E11 02 72            [ 1] 6003 	ld a,#TK_INTGR 
      009E13 5F               [ 4] 6004 	ret 
      00210C                       6005 const_porti:
      009E14 00 17 AE         [ 2] 6006 	ldw x,#8
      009E17 40 00            [ 1] 6007 	ld a,#TK_INTGR 
      009E19 CF               [ 4] 6008 	ret 
                                   6009 
                                   6010 ;-------------------------------
                                   6011 ; following return constant 
                                   6012 ; related to GPIO register offset 
                                   6013 ;---------------------------------
      002112                       6014 const_odr:
      009E1A 00 18            [ 1] 6015 	ld a,#TK_INTGR 
      009E1C 1E 01 CD         [ 2] 6016 	ldw x,#GPIO_ODR
      009E1F 84               [ 4] 6017 	ret 
      002118                       6018 const_idr:
      009E20 12 5C            [ 1] 6019 	ld a,#TK_INTGR 
      009E22 90 85 89         [ 2] 6020 	ldw x,#GPIO_IDR
      009E25 5F               [ 4] 6021 	ret 
      00211E                       6022 const_ddr:
      009E26 CD 82            [ 1] 6023 	ld a,#TK_INTGR 
      009E28 C2 5B 02         [ 2] 6024 	ldw x,#GPIO_DDR
      009E2B 81               [ 4] 6025 	ret 
      009E2C                       6026 const_cr1:
      009E2C 72 0D            [ 1] 6027 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009E2E 52 30 FB         [ 2] 6028 	ldw x,#GPIO_CR1
      009E31 72               [ 4] 6029 	ret 
      00212A                       6030 const_cr2:
      009E32 16 00            [ 1] 6031 	ld a,#TK_INTGR 
      009E34 24 8E 81         [ 2] 6032 	ldw x,#GPIO_CR2
      009E37 81               [ 4] 6033 	ret 
                                   6034 ;-------------------------
                                   6035 ;  constant for port mode
                                   6036 ;  used by PMODE 
                                   6037 ;  input or output
                                   6038 ;------------------------
      002130                       6039 const_output:
      009E37 CD 91            [ 1] 6040 	ld a,#TK_INTGR 
      009E39 FD A1 84         [ 2] 6041 	ldw x,#OUTP
      009E3C 27               [ 4] 6042 	ret 
      002136                       6043 const_input:
      009E3D 03 CC            [ 1] 6044 	ld a,#TK_INTGR 
      009E3F 88 F5 00         [ 2] 6045 	ldw x,#INP 
      009E41 81               [ 4] 6046 	ret 
                                   6047 ;-----------------------
                                   6048 ; memory area constants
                                   6049 ;-----------------------
      00213C                       6050 const_eeprom_base:
      009E41 5D 27            [ 1] 6051 	ld a,#TK_INTGR 
      009E43 04 8F 5A         [ 2] 6052 	ldw x,#EEPROM_BASE 
      009E46 26               [ 4] 6053 	ret 
                                   6054 
                                   6055 ;---------------------------
                                   6056 ; BASIC: DATA 
                                   6057 ; when the interpreter find 
                                   6058 ; a DATA line it skip it.
                                   6059 ;---------------------------
      002142                       6060 data:
      009E47 F9 4F 81 00 01   [ 1] 6061 	mov in,count 
      009E4A 81               [ 4] 6062 	ret 
                                   6063 
                                   6064 ;---------------------------
                                   6065 ; BASIC: DATLN  *expr*
                                   6066 ; set DATA pointer at line# 
                                   6067 ; specified by *expr* 
                                   6068 ;---------------------------
      002148                       6069 data_line:
      009E4A CD 91 FD         [ 4] 6070 	call expression
      009E4D A1 84            [ 1] 6071 	cp a,#TK_INTGR
      009E4F 27 03            [ 1] 6072 	jreq 1$
      009E51 CC 88 F5         [ 2] 6073 	jp syntax_error 
      009E54 CD 04 00         [ 4] 6074 1$: call search_lineno
      009E54 A3               [ 2] 6075 	tnzw x 
      009E55 14 00            [ 1] 6076 	jrne 3$
      009E57 2B 0C            [ 1] 6077 2$:	ld a,#ERR_NO_LINE 
      009E59 35 0F 50         [ 2] 6078 	jp tb_error
      00215D                       6079 3$: ; check if valid data line 
      009E5C F2 A6            [ 1] 6080     ldw y,x 
      009E5E 1E 62            [ 2] 6081 	ldw x,(4,x)
      009E60 A6 10 62         [ 2] 6082 	cpw x,#data 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009E63 20 1E            [ 1] 6083 	jrne 2$ 
      009E65 90 CF 00 06      [ 2] 6084 	ldw data_ptr,y
      009E65 A3 08 00         [ 1] 6085 	ld a,(2,y)
      009E68 2B 09 35         [ 1] 6086 	ld data_len,a 
      009E6B 0E 50 F2 A6      [ 1] 6087 	mov data_ofs,#FIRST_DATA_ITEM 
      009E6F 50               [ 4] 6088 	ret
                                   6089 
                                   6090 ;---------------------------------
                                   6091 ; BASIC: RESTORE 
                                   6092 ; set data_ptr to first data line
                                   6093 ; if not DATA found pointer set to
                                   6094 ; zero 
                                   6095 ;---------------------------------
      002175                       6096 restore:
      009E70 62 20 10 06      [ 1] 6097 	clr data_ptr 
      009E73 72 5F 00 07      [ 1] 6098 	clr data_ptr+1
      009E73 35 07 50 F2      [ 1] 6099 	clr data_ofs 
      009E77 72 5F 00 09      [ 1] 6100 	clr data_len
      009E77 A3 00 40         [ 2] 6101 	ldw x,txtbgn
      002188                       6102 data_search_loop: 	
      009E7A 23 07 72         [ 2] 6103 	cpw x,txtend
      009E7D 5C 50            [ 1] 6104 	jruge 9$
      009E7F F2 54            [ 1] 6105 	ldw y,x 
      009E81 20 F4            [ 2] 6106 	ldw x,(4,x)
      009E83 A3 21 42         [ 2] 6107 	cpw x,#data 
      009E83 9F 4A            [ 1] 6108 	jrne try_next_line 
      009E85 27 01 4A 06      [ 2] 6109 	ldw data_ptr,y 
      009E88 90 E6 02         [ 1] 6110 	ld a,(2,y)
      009E88 A4 3E C7         [ 1] 6111 	ld data_len,a 
      009E8B 50 F1 72 18      [ 1] 6112 	mov data_ofs,#FIRST_DATA_ITEM
      009E8F 50 F0 8E 81      [ 1] 6113 9$:	tnz data_len 
      009E93 26 05            [ 1] 6114     jrne 10$
      009E93 CE 00            [ 1] 6115 	ld a,#ERR_NO_DATA 
      009E95 0F A6 84         [ 2] 6116 	jp tb_error 
      009E98 81               [ 4] 6117 10$:ret
      009E99                       6118 try_next_line:
      009E99 CD               [ 1] 6119 	ldw x,y 
      009E9A 90 FF            [ 1] 6120 	ld a,(2,x)
      009E9C A1 01 27         [ 1] 6121 	ld acc8,a 
      009E9F 03 CC 88 F5      [ 1] 6122 	clr acc16 
      009EA3 72 BB 00 0C      [ 2] 6123 	addw x,acc16 
      009EA3 85 9E            [ 2] 6124 	jra data_search_loop
                                   6125 
                                   6126 
                                   6127 ;---------------------------------
                                   6128 ; BASIC: READ 
                                   6129 ; return next data item | 0 
                                   6130 ;---------------------------------
                           000001  6131 	CTX_BPTR=1 
                           000003  6132 	CTX_IN=3 
                           000004  6133 	CTX_COUNT=4 
                           000005  6134 	XSAVE=5
                           000006  6135 	VSIZE=6
      0021C0                       6136 read:
      0021C0                       6137 	_vars  VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009EA5 A5 80            [ 2]    1     sub sp,#VSIZE 
      0021C2                       6138 read01:	
      009EA7 27 01 50         [ 1] 6139 	ld a,data_ofs
      009EAA A6 84 81         [ 1] 6140 	cp a,data_len 
      009EAD 27 37            [ 1] 6141 	jreq 2$ ; end of line  
      009EAD CD 90 FF         [ 4] 6142 	call save_context
      009EB0 A1 02 27         [ 2] 6143 	ldw x,data_ptr 
      009EB3 03 CC 88         [ 2] 6144 	ldw basicptr,x 
      009EB6 F5 85 9E 14 01   [ 1] 6145 	mov in,data_ofs 
      009EBB 95 9F 14 02 97   [ 1] 6146 	mov count,data_len  
      009EC0 5B 02 A6         [ 4] 6147 	call expression 
      009EC3 84 81            [ 1] 6148 	cp a,#TK_INTGR 
      009EC5 27 03            [ 1] 6149 	jreq 1$ 
      009EC5 CD 90 FF         [ 2] 6150 	jp syntax_error 
      0021E7                       6151 1$:
      009EC8 A1 02            [ 2] 6152 	ldw (XSAVE,SP),x
      009ECA 27 03 CC         [ 4] 6153 	call next_token ; skip comma
      009ECD 88 F5 04         [ 2] 6154 	ldw x,basicptr 
      009ECF CF 00 06         [ 2] 6155 	ldw data_ptr,x 
      009ECF 85 9E 1A 01 95   [ 1] 6156 	mov data_ofs,in 
      009ED4 9F 1A 02         [ 4] 6157 	call rest_context
      009ED7 97 5B            [ 2] 6158 	ldw x,(XSAVE,sp)
      009ED9 02 A6            [ 1] 6159 	ld a,#TK_INTGR
      0021FE                       6160 	_drop VSIZE 
      009EDB 84 81            [ 2]    1     addw sp,#VSIZE 
      009EDD 81               [ 4] 6161 	ret 
      002201                       6162 2$: ; end of line reached 
      009EDD CD 90 FF A1      [ 2] 6163 	ldw y, data_ptr 
      009EE1 02 27 03 CC      [ 1] 6164 	clr data_ptr
      009EE5 88 F5 00 07      [ 1] 6165 	clr data_ptr+1   
      009EE7 72 5F 00 08      [ 1] 6166 	clr data_ofs 
      009EE7 85 9E 18 01      [ 1] 6167 	clr data_len 
      009EEB 95 9F 18         [ 4] 6168 	call try_next_line 
      009EEE 02 97            [ 2] 6169 	jra read01
                                   6170 
                                   6171 
                                   6172 ;---------------------------------
                                   6173 ; BASIC: SPIEN clkdiv, 0|1  
                                   6174 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6175 ; if clkdiv==-1 disable SPI
                                   6176 ; 0|1 -> disable|enable  
                                   6177 ;--------------------------------- 
                           000005  6178 SPI_CS_BIT=5
      00221A                       6179 spi_enable:
      009EF0 5B 02 A6         [ 4] 6180 	call arg_list 
      009EF3 84 81            [ 1] 6181 	cp a,#2
      009EF5 27 03            [ 1] 6182 	jreq 1$
      009EF5 CD 90 FF         [ 2] 6183 	jp syntax_error 
      002224                       6184 1$: 
      009EF8 A1 02 27 03      [ 1] 6185 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009EFC CC               [ 2] 6186 	popw x  
      009EFD 88               [ 2] 6187 	tnzw x 
      009EFE F5 90            [ 1] 6188 	jreq spi_disable 
      009F00 85               [ 2] 6189 	popw x 
      009F01 85 90            [ 1] 6190 	ld a,#(1<<SPI_CR1_BR)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009F03 5D               [ 4] 6191 	mul x,a 
      009F04 27               [ 1] 6192 	ld a,xl 
      009F05 05 58 90         [ 1] 6193 	ld SPI_CR1,a 
                                   6194 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009F08 5A 26 FB 14      [ 1] 6195 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009F0B 72 1A 50 16      [ 1] 6196 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6197 ; configure SPI as master mode 0.	
      009F0B A6 84 81 00      [ 1] 6198 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6199 ; ~CS line controlled by sofware 	
      009F0E 72 12 52 01      [ 1] 6200 	bset SPI_CR2,#SPI_CR2_SSM 
      009F0E CD 90 FF A1      [ 1] 6201     bset SPI_CR2,#SPI_CR2_SSI 
                                   6202 ; enable SPI
      009F12 02 27 03 CC      [ 1] 6203 	bset SPI_CR1,#SPI_CR1_SPE 	
      009F16 88               [ 4] 6204 	ret 
      00224D                       6205 spi_disable:
      00224D                       6206 	_drop #2; throw first argument.
      009F17 F5 90            [ 2]    1     addw sp,##2 
                                   6207 ; wait spi idle 
      009F19 85 85            [ 1] 6208 1$:	ld a,#0x82 
      009F1B 90 5D 27         [ 1] 6209 	and a,SPI_SR
      009F1E 05 54            [ 1] 6210 	cp a,#2 
      009F20 90 5A            [ 1] 6211 	jrne 1$
      009F22 26 FB 52 00      [ 1] 6212 	bres SPI_CR1,#SPI_CR1_SPE
      009F24 72 13 50 C7      [ 1] 6213 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009F24 A6 84 81 16      [ 1] 6214 	bres PE_DDR,#SPI_CS_BIT 
      009F27 81               [ 4] 6215 	ret 
                                   6216 
      002265                       6217 spi_clear_error:
      009F27 A6 84            [ 1] 6218 	ld a,#0x78 
      009F29 CD 90 F2         [ 1] 6219 	bcp a,SPI_SR 
      009F2C 9F A4            [ 1] 6220 	jreq 1$
      009F2E 07 C7 50 C6      [ 1] 6221 	clr SPI_SR 
      009F32 81               [ 4] 6222 1$: ret 
                                   6223 
      009F33                       6224 spi_send_byte:
      009F33 52               [ 1] 6225 	push a 
      009F34 01 CD 91         [ 4] 6226 	call spi_clear_error
      009F37 04               [ 1] 6227 	pop a 
      009F38 A1 02 27 03 CC   [ 2] 6228 	btjf SPI_SR,#SPI_SR_TXE,.
      009F3D 88 F5 90         [ 1] 6229 	ld SPI_DR,a
      009F40 85 85 CD 9F 74   [ 2] 6230 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009F45 6B 01 A6         [ 1] 6231 	ld a,SPI_DR 
      009F48 01               [ 4] 6232 	ret 
                                   6233 
      002287                       6234 spi_rcv_byte:
      009F49 0D 01            [ 1] 6235 	ld a,#255
      009F4B 27 0B 48 0A 01   [ 2] 6236 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009F50 26 FB 6B         [ 1] 6237 	ld a,SPI_DR 
      009F53 01               [ 4] 6238 	ret
                                   6239 
                                   6240 ;------------------------------
                                   6241 ; BASIC: SPIWR byte [,byte]
                                   6242 ; write 1 or more byte
                                   6243 ;------------------------------
      002292                       6244 spi_write:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009F54 EA 03 E7         [ 4] 6245 	call expression
      009F57 03 90            [ 1] 6246 	cp a,#TK_INTGR 
      009F59 A3 00            [ 1] 6247 	jreq 1$
      009F5B 01 27 07         [ 2] 6248 	jp syntax_error 
      00229C                       6249 1$:	
      009F5E 7B               [ 1] 6250 	ld a,xl 
      009F5F 01 43 E4         [ 4] 6251 	call spi_send_byte 
      009F62 02 20 0A         [ 4] 6252 	call next_token 
      009F65 A1 09            [ 1] 6253 	cp a,#TK_COMMA 
      009F65 7B 01            [ 1] 6254 	jrne 2$ 
      009F67 EA 04            [ 2] 6255 	jra spi_write 
      009F69 E7               [ 1] 6256 2$:	tnz a 
      009F6A 04 7B            [ 1] 6257 	jreq 3$
      0022AC                       6258 	_unget_token  
      009F6C 01 EA 02 E7 02   [ 1]    1     mov in,in.saved
      009F71 5B               [ 4] 6259 3$:	ret 
                                   6260 
                                   6261 
                                   6262 ;-------------------------------
                                   6263 ; BASIC: SPIRD 	
                                   6264 ; read one byte from SPI 
                                   6265 ;-------------------------------
      0022B2                       6266 spi_read:
      009F72 01 81 87         [ 4] 6267 	call spi_rcv_byte 
      009F74 5F               [ 1] 6268 	clrw x 
      009F74 58               [ 1] 6269 	ld xl,a 
      009F75 1C 9F            [ 1] 6270 	ld a,#TK_INTGR 
      009F77 84               [ 4] 6271 	ret 
                                   6272 
                                   6273 ;------------------------------
                                   6274 ; BASIC: SPISEL 0|1 
                                   6275 ; set state of ~CS line
                                   6276 ; 0|1 deselect|select  
                                   6277 ;------------------------------
      0022BA                       6278 spi_select:
      009F78 FE 9F 88         [ 4] 6279 	call next_token 
      009F7B 5E A6            [ 1] 6280 	cp a,#TK_INTGR 
      009F7D 05 42            [ 1] 6281 	jreq 1$
      009F7F 1C 50 00         [ 2] 6282 	jp syntax_error 
      009F82 84               [ 2] 6283 1$: tnzw x  
      009F83 81 05            [ 1] 6284 	jreq cs_high 
      009F84 72 1B 50 14      [ 1] 6285 	bres PE_ODR,#SPI_CS_BIT
      009F84 03               [ 4] 6286 	ret 
      0022CC                       6287 cs_high: 
      009F85 06 03 05 04      [ 1] 6288 	bset PE_ODR,#SPI_CS_BIT
      009F89 00               [ 4] 6289 	ret 
                                   6290 
                                   6291 
                                   6292 ;------------------------------
                                   6293 ; BASIC: FILERX
                                   6294 ; Use to receive a BASIC program
                                   6295 ; from the PC using XMODEM 
                                   6296 ; protocol. The file is store in
                                   6297 ; Each line received is compiled
                                   6298 ; then stored in RAM. When reception 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   6299 ; is completed with success  the 
                                   6300 ; program is ready to be executed 
                                   6301 ; or save as local file.
                                   6302 ;--------------------------------
      0022D1                       6303 file_receive:
      009F8A 02 01 06 00 02   [ 2] 6304 	btjf flags,#FRUN,1$
      009F8F 02 02            [ 1] 6305 	ld a,#ERR_CMD_ONLY
      009F91 03 03 01         [ 2] 6306 	jp tb_error 
      0022DB                       6307 1$:	
      009F94 03 03 02         [ 4] 6308 	call clear_basic
      009F97 04 04 05         [ 2] 6309 	ldw x, txtbgn
      009F9A 02 06 02         [ 4] 6310 	call xreceive 
      009F9D 07 02 05 04      [ 2] 6311 	addw x,txtbgn 
      009FA1 02 04 01         [ 2] 6312 	ldw txtend,x 
      009FA4 CD 09 BC         [ 4] 6313 	call print_int 
      009FA4 CD 90 FF         [ 2] 6314 	ldw x,#fsize_msg 
      009FA7 A1 01 27         [ 4] 6315 	call puts 
      009FAA 03               [ 4] 6316 	ret 
      009FAB CC 88 F5 74 65 73 20  6317 fsize_msg: .asciz " bytes received\n"
             72 65 63 65 69 76 65
             64 0A 00
                                   6318 
                                   6319 ;------------------------------
                                   6320 ; BASIC: FILETX "file_name" 
                                   6321 ; Transmit the program in RAM 
                                   6322 ; To the PC using XMODEM protocol.
                                   6323 ; The file transmitted as source 
                                   6324 ; file not tokenized. 
                                   6325 ;-------------------------------
      009FAE                       6326 file_transmit:
                                   6327 
      009FAE A6               [ 4] 6328 	ret 
                                   6329 
                                   6330 ;-------------------------------
                                   6331 ; BASIC: PAD 
                                   6332 ; Return pad buffer address.
                                   6333 ;------------------------------
      002307                       6334 pad_ref:
      009FAF 80 15 01         [ 2] 6335 	ldw x,#pad 
      009FB2 27 05            [ 1] 6336 	ld a,TK_INTGR
      009FB4 A6               [ 4] 6337 	ret 
                                   6338 
                                   6339 ;------------------------------
                                   6340 ;      dictionary 
                                   6341 ; format:
                                   6342 ;   link:   2 bytes 
                                   6343 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6344 ;   cmd_name: 16 byte max 
                                   6345 ;   code_address: 2 bytes 
                                   6346 ;------------------------------
                                   6347 	.macro _dict_entry len,name,cmd 
                                   6348 	.word LINK 
                                   6349 	LINK=.
                                   6350 name:
                                   6351 	.byte len 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                   6352 	.ascii "name"
                                   6353 	.word cmd 
                                   6354 	.endm 
                                   6355 
                           000000  6356 	LINK=0
                                   6357 ; respect alphabetic order for BASIC names from Z-A
                                   6358 ; this sort order is for a cleaner WORDS cmd output. 	
      00230D                       6359 kword_end:
      00230D                       6360 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009FB5 0A CC                    1 	.word LINK 
                           00230F     2 	LINK=.
      00230F                          3 XOR:
      009FB7 88                       4 	.byte 3+F_IFUNC 	
      009FB8 F7 4F 52                 5 	.ascii "XOR"
      009FB9 1E 5D                    6 	.word bit_xor 
      002315                       6361 	_dict_entry,5,WRITE,write  
      009FB9 CE 00                    1 	.word LINK 
                           002317     2 	LINK=.
      002317                          3 WRITE:
      009FBB 13                       4 	.byte 5 	
      009FBC 58 58 58 58 58           5 	.ascii "WRITE"
      009FC1 9E C8                    6 	.word write 
      00231F                       6362 	_dict_entry,5,WORDS,words 
      009FC3 00 13                    1 	.word LINK 
                           002321     2 	LINK=.
      002321                          3 WORDS:
      009FC5 C7                       4 	.byte 5 	
      009FC6 00 0D 9F C8 00           5 	.ascii "WORDS"
      009FCB 14 C7                    6 	.word words 
      002329                       6363 	_dict_entry 4,WAIT,wait 
      009FCD 00 0E                    1 	.word LINK 
                           00232B     2 	LINK=.
      00232B                          3 WAIT:
      009FCF CE                       4 	.byte 4 	
      009FD0 00 15 CF 00              5 	.ascii "WAIT"
      009FD4 13 90                    6 	.word wait 
      002332                       6364 	_dict_entry,3+F_IFUNC,USR,usr
      009FD6 54 90                    1 	.word LINK 
                           002334     2 	LINK=.
      002334                          3 USR:
      009FD8 9E                       4 	.byte 3+F_IFUNC 	
      009FD9 C8 00 15                 5 	.ascii "USR"
      009FDC C7 00                    6 	.word usr 
      00233A                       6365 	_dict_entry,5,UNTIL,until 
      009FDE 15 90                    1 	.word LINK 
                           00233C     2 	LINK=.
      00233C                          3 UNTIL:
      009FE0 9F                       4 	.byte 5 	
      009FE1 C8 00 16 C7 00           5 	.ascii "UNTIL"
      009FE6 16 CE                    6 	.word until 
      002344                       6366 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009FE8 00 0D                    1 	.word LINK 
                           002346     2 	LINK=.
      002346                          3 UFLASH:
      009FEA 54                       4 	.byte 6+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      009FEB 54 54 9E C8 00 0D        5 	.ascii "UFLASH"
      009FF1 95 9F                    6 	.word uflash 
      00234F                       6367 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009FF3 C8 00                    1 	.word LINK 
                           002351     2 	LINK=.
      002351                          3 UBOUND:
      009FF5 0E                       4 	.byte 6+F_IFUNC 	
      009FF6 97 C8 00 16 97 9E        5 	.ascii "UBOUND"
      009FFC C8 00                    6 	.word ubound 
      00235A                       6368 	_dict_entry,4,TONE,tone  
      009FFE 15 95                    1 	.word LINK 
                           00235C     2 	LINK=.
      00235C                          3 TONE:
      00A000 CF                       4 	.byte 4 	
      00A001 00 15 90 85              5 	.ascii "TONE"
      00A005 65 93                    6 	.word tone 
      002363                       6369 	_dict_entry,2,TO,to
      00A007 5C 5C                    1 	.word LINK 
                           002365     2 	LINK=.
      00A008                          3 TO:
      00A008 A6                       4 	.byte 2 	
      00A009 84 81                    5 	.ascii "TO"
      00A00B 16 A3                    6 	.word to 
      00236A                       6370 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A00B 52 03                    1 	.word LINK 
                           00236C     2 	LINK=.
      00236C                          3 TIMEOUT:
      00A00D 0F                       4 	.byte 7+F_IFUNC 	
      00A00E 02 0F 03 90 AE A7 3E     5 	.ascii "TIMEOUT"
      00A015 93 F6                    6 	.word timeout 
      002376                       6371 	_dict_entry,5,TIMER,set_timer
      00A017 A4 0F                    1 	.word LINK 
                           002378     2 	LINK=.
      002378                          3 TIMER:
      00A019 6B                       4 	.byte 5 	
      00A01A 01 0C 03 5C F6           5 	.ascii "TIMER"
      00A01F CD 83                    6 	.word set_timer 
      002380                       6372 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A021 20 0C                    1 	.word LINK 
                           002382     2 	LINK=.
      002382                          3 TICKS:
      00A023 02                       4 	.byte 5+F_IFUNC 	
      00A024 0A 01 26 F5 A6           5 	.ascii "TICKS"
      00A029 46 11                    6 	.word get_ticks 
      00238A                       6373 	_dict_entry,4,STOP,stop 
      00A02B 02 2B                    1 	.word LINK 
                           00238C     2 	LINK=.
      00238C                          3 STOP:
      00A02D 09                       4 	.byte 4 	
      00A02E A6 20 CD 83              5 	.ascii "STOP"
      00A032 20 0C                    6 	.word stop 
      002393                       6374 	_dict_entry,4,STEP,step 
      00A034 02 20                    1 	.word LINK 
                           002395     2 	LINK=.
      002395                          3 STEP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A036 07                       4 	.byte 4 	
      00A037 A6 0D CD 83              5 	.ascii "STEP"
      00A03B 20 0F                    6 	.word step 
      00239C                       6375 	_dict_entry,5,SPIWR,spi_write
      00A03D 02 72                    1 	.word LINK 
                           00239E     2 	LINK=.
      00239E                          3 SPIWR:
      00A03F A2                       4 	.byte 5 	
      00A040 00 02 90 FE 26           5 	.ascii "SPIWR"
      00A045 CF A6                    6 	.word spi_write 
      0023A6                       6376 	_dict_entry,6,SPISEL,spi_select
      00A047 0D CD                    1 	.word LINK 
                           0023A8     2 	LINK=.
      0023A8                          3 SPISEL:
      00A049 83                       4 	.byte 6 	
      00A04A 20 5F 7B 03 97 CD        5 	.ascii "SPISEL"
      00A050 8A 3C                    6 	.word spi_select 
      0023B1                       6377 	_dict_entry,5,SPIEN,spi_enable 
      00A052 AE A0                    1 	.word LINK 
                           0023B3     2 	LINK=.
      0023B3                          3 SPIEN:
      00A054 5B                       4 	.byte 5 	
      00A055 CD 83 33 5B 03           5 	.ascii "SPIEN"
      00A05A 81 20                    6 	.word spi_enable 
      0023BB                       6378 	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
      00A05C 77 6F                    1 	.word LINK 
                           0023BD     2 	LINK=.
      0023BD                          3 SPIRD:
      00A05E 72                       4 	.byte 5+F_IFUNC 	
      00A05F 64 73 20 69 6E           5 	.ascii "SPIRD"
      00A064 20 64                    6 	.word spi_read 
      0023C5                       6379 	_dict_entry,5,SLEEP,sleep 
      00A066 69 63                    1 	.word LINK 
                           0023C7     2 	LINK=.
      0023C7                          3 SLEEP:
      00A068 74                       4 	.byte 5 	
      00A069 69 6F 6E 61 72           5 	.ascii "SLEEP"
      00A06E 79 0A                    6 	.word sleep 
      0023CF                       6380 	_dict_entry,4+F_IFUNC,SIZE,size
      00A070 00 C7                    1 	.word LINK 
                           0023D1     2 	LINK=.
      00A071                          3 SIZE:
      00A071 CD                       4 	.byte 4+F_IFUNC 	
      00A072 91 04 A1 01              5 	.ascii "SIZE"
      00A076 27 03                    6 	.word size 
      0023D8                       6381     _dict_entry,4,SHOW,show 
      00A078 CC 88                    1 	.word LINK 
                           0023DA     2 	LINK=.
      0023DA                          3 SHOW:
      00A07A F5                       4 	.byte 4 	
      00A07B 53 48 4F 57              5 	.ascii "SHOW"
      00A07B 85 CF                    6 	.word show 
      0023E1                       6382 	_dict_entry,4,SAVE,save
      00A07D 00 11                    1 	.word LINK 
                           0023E3     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      0023E3                          3 SAVE:
      00A07F 81                       4 	.byte 4 	
      00A080 53 41 56 45              5 	.ascii "SAVE"
      00A080 CE 00                    6 	.word save 
      0023EA                       6383 	_dict_entry 3,RUN,run
      00A082 11 E3                    1 	.word LINK 
                           0023EC     2 	LINK=.
      00A083                          3 RUN:
      00A083 53                       4 	.byte 3 	
      00A084 A3 FF FF                 5 	.ascii "RUN"
      00A087 27 01                    6 	.word run 
      0023F2                       6384 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A089 5F A6                    1 	.word LINK 
                           0023F4     2 	LINK=.
      0023F4                          3 RSHIFT:
      00A08B 84                       4 	.byte 6+F_IFUNC 	
      00A08C 81 53 48 49 46 54        5 	.ascii "RSHIFT"
      00A08D 1E 8E                    6 	.word rshift 
      0023FD                       6385 	_dict_entry,3+F_IFUNC,RND,random 
      00A08D CD 90                    1 	.word LINK 
                           0023FF     2 	LINK=.
      0023FF                          3 RND:
      00A08F FF                       4 	.byte 3+F_IFUNC 	
      00A090 A1 01 27                 5 	.ascii "RND"
      00A093 03 CC                    6 	.word random 
      002405                       6386 	_dict_entry,6,RETURN,return 
      00A095 88 F5                    1 	.word LINK 
                           002407     2 	LINK=.
      002407                          3 RETURN:
      00A097 85                       4 	.byte 6 	
      00A098 20 E9 54 55 52 4E        5 	.ascii "RETURN"
      00A09A 17 95                    6 	.word return 
      002410                       6387 	_dict_entry,7,RESTORE,restore 
      00A09A CD 91                    1 	.word LINK 
                           002412     2 	LINK=.
      002412                          3 RESTORE:
      00A09C 04                       4 	.byte 7 	
      00A09D A1 01 27 03 CC 88 F5     5 	.ascii "RESTORE"
      00A0A4 85 4B                    6 	.word restore 
      00241C                       6388 	_dict_entry 6,REMARK,remark 
      00A0A6 00 35                    1 	.word LINK 
                           00241E     2 	LINK=.
      00241E                          3 REMARK:
      00A0A8 CC                       4 	.byte 6 	
      00A0A9 50 E0 9E A4 3F 95        5 	.ascii "REMARK"
      00A0AF A3 00                    6 	.word remark 
      002427                       6389 	_dict_entry,6,REBOOT,cold_start
      00A0B1 FF 23                    1 	.word LINK 
                           002429     2 	LINK=.
      002429                          3 REBOOT:
      00A0B3 06                       4 	.byte 6 	
      00A0B4 0C 01 98 56 20 F5        5 	.ascii "REBOOT"
      00A0BA 35 55                    6 	.word cold_start 
      002432                       6390 	_dict_entry,4+F_IFUNC,READ,read  
      00A0BC 50 E0                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                           002434     2 	LINK=.
      002434                          3 READ:
      00A0BE 84                       4 	.byte 4+F_IFUNC 	
      00A0BF C7 50 E1 9F              5 	.ascii "READ"
      00A0C3 4A 35                    6 	.word read 
      00243B                       6391 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A0C5 55 50                    1 	.word LINK 
                           00243D     2 	LINK=.
      00243D                          3 QKEY:
      00A0C7 E0                       4 	.byte 4+F_IFUNC 	
      00A0C8 C7 50 E2 35              5 	.ascii "QKEY"
      00A0CC AA 50                    6 	.word qkey 
      002444                       6392 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      00A0CE E0 81                    1 	.word LINK 
                           002446     2 	LINK=.
      00A0D0                          3 PRTI:
      00A0D0 35                       4 	.byte 4+F_IFUNC 	
      00A0D1 AA 50 E0 81              5 	.ascii "PRTI"
      00A0D5 21 0C                    6 	.word const_porti 
      00244D                       6393 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      00A0D5 CD 90                    1 	.word LINK 
                           00244F     2 	LINK=.
      00244F                          3 PRTH:
      00A0D7 FF                       4 	.byte 4+F_IFUNC 	
      00A0D8 A1 01 27 03              5 	.ascii "PRTH"
      00A0DC CC 88                    6 	.word const_porth 
      002456                       6394 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      00A0DE F5 85                    1 	.word LINK 
                           002458     2 	LINK=.
      00A0E0                          3 PRTG:
      00A0E0 5D                       4 	.byte 4+F_IFUNC 	
      00A0E1 27 0A A6 0F              5 	.ascii "PRTG"
      00A0E5 59 25                    6 	.word const_portg 
      00245F                       6395 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      00A0E7 03 4A                    1 	.word LINK 
                           002461     2 	LINK=.
      002461                          3 PRTF:
      00A0E9 20                       4 	.byte 4+F_IFUNC 	
      00A0EA FA 5F 97 A6              5 	.ascii "PRTF"
      00A0EE 84 81                    6 	.word const_portf 
      00A0F0                       6396 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      00A0F0 CD 90                    1 	.word LINK 
                           00246A     2 	LINK=.
      00246A                          3 PRTE:
      00A0F2 FF                       4 	.byte 4+F_IFUNC 	
      00A0F3 A1 01 27 03              5 	.ascii "PRTE"
      00A0F7 CC 88                    6 	.word const_porte 
      002471                       6397 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A0F9 F5 85                    1 	.word LINK 
                           002473     2 	LINK=.
      002473                          3 PRTD:
      00A0FB 9F                       4 	.byte 4+F_IFUNC 	
      00A0FC A4 0F 5F 5C              5 	.ascii "PRTD"
      00A100 4D 27                    6 	.word const_portd 
      00247A                       6398 	_dict_entry,4+F_IFUNC,PRTC,const_portc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A102 04 58                    1 	.word LINK 
                           00247C     2 	LINK=.
      00247C                          3 PRTC:
      00A104 4A                       4 	.byte 4+F_IFUNC 	
      00A105 20 F9 A6 84              5 	.ascii "PRTC"
      00A109 81 E8                    6 	.word const_portc 
      00A10A                       6399 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A10A CD 90                    1 	.word LINK 
                           002485     2 	LINK=.
      002485                          3 PRTB:
      00A10C FF                       4 	.byte 4+F_IFUNC 	
      00A10D A1 01 27 03              5 	.ascii "PRTB"
      00A111 CC 88                    6 	.word const_portb 
      00248C                       6400 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A113 F5 85                    1 	.word LINK 
                           00248E     2 	LINK=.
      00248E                          3 PRTA:
      00A115 53                       4 	.byte 4+F_IFUNC 	
      00A116 A6 84 81 41              5 	.ascii "PRTA"
      00A119 20 DC                    6 	.word const_porta 
      002495                       6401 	_dict_entry 5,PRINT,print 
      00A119 85 52                    1 	.word LINK 
                           002497     2 	LINK=.
      002497                          3 PRINT:
      00A11B 04                       4 	.byte 5 	
      00A11C 89 90 CE 00 05           5 	.ascii "PRINT"
      00A121 17 03                    6 	.word print 
      00249F                       6402 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A123 90 CE                    1 	.word LINK 
                           0024A1     2 	LINK=.
      0024A1                          3 POUT:
      00A125 00                       4 	.byte 4+F_IFUNC 	
      00A126 01 17 05 72              5 	.ascii "POUT"
      00A12A 5C 00                    6 	.word const_output 
      0024A8                       6403 	_dict_entry,4,POKE,poke 
      00A12C 21 81                    1 	.word LINK 
                           0024AA     2 	LINK=.
      00A12E                          3 POKE:
      00A12E 72                       4 	.byte 4 	
      00A12F 5D 00 21 26              5 	.ascii "POKE"
      00A133 03 CC                    6 	.word poke 
      0024B1                       6404 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A135 88 F5                    1 	.word LINK 
                           0024B3     2 	LINK=.
      00A137                          3 PINP:
      00A137 CD                       4 	.byte 4+F_IFUNC 	
      00A138 92 46 A1 84              5 	.ascii "PINP"
      00A13C 27 03                    6 	.word const_input 
      0024BA                       6405 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A13E CC 88                    1 	.word LINK 
                           0024BC     2 	LINK=.
      0024BC                          3 PEEK:
      00A140 F5                       4 	.byte 4+F_IFUNC 	
      00A141 50 45 45 4B              5 	.ascii "PEEK"
      00A141 5D 26                    6 	.word peek 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0024C3                       6406 	_dict_entry,5,PMODE,pin_mode 
      00A143 10 1E                    1 	.word LINK 
                           0024C5     2 	LINK=.
      0024C5                          3 PMODE:
      00A145 03                       4 	.byte 5 	
      00A146 CF 00 05 E6 02           5 	.ascii "PMODE"
      00A14B C7 00                    6 	.word pin_mode 
      0024CD                       6407 	_dict_entry,5,PAUSE,pause 
      00A14D 04 1E                    1 	.word LINK 
                           0024CF     2 	LINK=.
      0024CF                          3 PAUSE:
      00A14F 05                       4 	.byte 5 	
      00A150 CF 00 01 81 45           5 	.ascii "PAUSE"
      00A154 1D B7                    6 	.word pause 
      0024D7                       6408 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00A154 85 5B                    1 	.word LINK 
                           0024D9     2 	LINK=.
      0024D9                          3 PAD:
      00A156 04                       4 	.byte 3+F_IFUNC 	
      00A157 72 5A 00                 5 	.ascii "PAD"
      00A15A 21 FC                    6 	.word pad_ref 
      00A15C                       6409 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A15C AE 00                    1 	.word LINK 
                           0024E1     2 	LINK=.
      0024E1                          3 OR:
      00A15E 00                       4 	.byte 2+F_IFUNC 	
      00A15F A6 84                    5 	.ascii "OR"
      00A161 81 45                    6 	.word bit_or 
      00A162                       6410 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A162 AE 00                    1 	.word LINK 
                           0024E8     2 	LINK=.
      0024E8                          3 ODR:
      00A164 01                       4 	.byte 3+F_IFUNC 	
      00A165 A6 84 81                 5 	.ascii "ODR"
      00A168 21 12                    6 	.word const_odr 
      0024EE                       6411 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A168 AE 00                    1 	.word LINK 
                           0024F0     2 	LINK=.
      0024F0                          3 NOT:
      00A16A 02                       4 	.byte 3+F_IFUNC 	
      00A16B A6 84 81                 5 	.ascii "NOT"
      00A16E 20 0D                    6 	.word func_not 
      0024F6                       6412 	_dict_entry,3,NEW,new
      00A16E AE 00                    1 	.word LINK 
                           0024F8     2 	LINK=.
      0024F8                          3 NEW:
      00A170 03                       4 	.byte 3 	
      00A171 A6 84 81                 5 	.ascii "NEW"
      00A174 19 7E                    6 	.word new 
      0024FE                       6413 	_dict_entry,4,NEXT,next 
      00A174 AE 00                    1 	.word LINK 
                           002500     2 	LINK=.
      002500                          3 NEXT:
      00A176 04                       4 	.byte 4 	
      00A177 A6 84 81 54              5 	.ascii "NEXT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A17A 16 FA                    6 	.word next 
      002507                       6414 	_dict_entry,6+F_IFUNC,MULDIV,muldiv 
      00A17A AE 00                    1 	.word LINK 
                           002509     2 	LINK=.
      002509                          3 MULDIV:
      00A17C 05                       4 	.byte 6+F_IFUNC 	
      00A17D A6 84 81 44 49 56        5 	.ascii "MULDIV"
      00A180 0F D7                    6 	.word muldiv 
      002512                       6415 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A180 AE 00                    1 	.word LINK 
                           002514     2 	LINK=.
      002514                          3 LSHIFT:
      00A182 06                       4 	.byte 6+F_IFUNC 	
      00A183 A6 84 81 49 46 54        5 	.ascii "LSHIFT"
      00A186 1E 75                    6 	.word lshift 
      00251D                       6416 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A186 AE 00                    1 	.word LINK 
                           00251F     2 	LINK=.
      00251F                          3 LOG:
      00A188 07                       4 	.byte 3+F_IFUNC 	
      00A189 A6 84 81                 5 	.ascii "LOG"
      00A18C 20 55                    6 	.word log2 
      002525                       6417 	_dict_entry,4,LOAD,load 
      00A18C AE 00                    1 	.word LINK 
                           002527     2 	LINK=.
      002527                          3 LOAD:
      00A18E 08                       4 	.byte 4 	
      00A18F A6 84 81 44              5 	.ascii "LOAD"
      00A192 1B 69                    6 	.word load 
      00252E                       6418 	_dict_entry 4,LIST,list
      00A192 A6 84                    1 	.word LINK 
                           002530     2 	LINK=.
      002530                          3 LIST:
      00A194 AE                       4 	.byte 4 	
      00A195 00 00 81 54              5 	.ascii "LIST"
      00A198 12 C3                    6 	.word list 
      002537                       6419 	_dict_entry 3,LET,let 
      00A198 A6 84                    1 	.word LINK 
                           002539     2 	LINK=.
      002539                          3 LET:
      00A19A AE                       4 	.byte 3 	
      00A19B 00 01 81                 5 	.ascii "LET"
      00A19E 12 98                    6 	.word let 
      00253F                       6420 	_dict_entry,3+F_IFUNC,KEY,key 
      00A19E A6 84                    1 	.word LINK 
                           002541     2 	LINK=.
      002541                          3 KEY:
      00A1A0 AE                       4 	.byte 3+F_IFUNC 	
      00A1A1 00 02 81                 5 	.ascii "KEY"
      00A1A4 1C EB                    6 	.word key 
      002547                       6421 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A1A4 A6 84                    1 	.word LINK 
                           002549     2 	LINK=.
      002549                          3 IWDGREF:
      00A1A6 AE                       4 	.byte 7 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A1A7 00 03 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A1AA 20 50                    6 	.word refresh_iwdg 
      002553                       6422 	_dict_entry,6,IWDGEN,enable_iwdg
      00A1AA A6 84                    1 	.word LINK 
                           002555     2 	LINK=.
      002555                          3 IWDGEN:
      00A1AC AE                       4 	.byte 6 	
      00A1AD 00 04 81 47 45 4E        5 	.ascii "IWDGEN"
      00A1B0 20 1A                    6 	.word enable_iwdg 
      00255E                       6423 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A1B0 A6 84                    1 	.word LINK 
                           002560     2 	LINK=.
      002560                          3 INVERT:
      00A1B2 AE                       4 	.byte 6+F_IFUNC 	
      00A1B3 00 01 81 45 52 54        5 	.ascii "INVERT"
      00A1B6 20 8A                    6 	.word invert 
      002569                       6424 	_dict_entry,5,INPUT,input_var  
      00A1B6 A6 84                    1 	.word LINK 
                           00256B     2 	LINK=.
      00256B                          3 INPUT:
      00A1B8 AE                       4 	.byte 5 	
      00A1B9 00 00 81 55 54           5 	.ascii "INPUT"
      00A1BC 15 57                    6 	.word input_var 
      002573                       6425 	_dict_entry,2,IF,if 
      00A1BC A6 84                    1 	.word LINK 
                           002575     2 	LINK=.
      002575                          3 IF:
      00A1BE AE                       4 	.byte 2 	
      00A1BF 40 00                    5 	.ascii "IF"
      00A1C1 81 66                    6 	.word if 
      00A1C2                       6426 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A1C2 55 00                    1 	.word LINK 
                           00257C     2 	LINK=.
      00257C                          3 IDR:
      00A1C4 04                       4 	.byte 3+F_IFUNC 	
      00A1C5 00 02 81                 5 	.ascii "IDR"
      00A1C8 21 18                    6 	.word const_idr 
      002582                       6427 	_dict_entry,3,HEX,hex_base
      00A1C8 CD 91                    1 	.word LINK 
                           002584     2 	LINK=.
      002584                          3 HEX:
      00A1CA FD                       4 	.byte 3 	
      00A1CB A1 84 27                 5 	.ascii "HEX"
      00A1CE 03 CC                    6 	.word hex_base 
      00258A                       6428 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A1D0 88 F5                    1 	.word LINK 
                           00258C     2 	LINK=.
      00258C                          3 GPIO:
      00A1D2 CD                       4 	.byte 4+F_IFUNC 	
      00A1D3 84 80 5D 26              5 	.ascii "GPIO"
      00A1D7 05 A6                    6 	.word gpio 
      002593                       6429 	_dict_entry,4,GOTO,goto 
      00A1D9 05 CC                    1 	.word LINK 
                           002595     2 	LINK=.
      002595                          3 GOTO:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A1DB 88                       4 	.byte 4 	
      00A1DC F7 4F 54 4F              5 	.ascii "GOTO"
      00A1DD 17 5A                    6 	.word goto 
      00259C                       6430 	_dict_entry,5,GOSUB,gosub 
      00A1DD 90 93                    1 	.word LINK 
                           00259E     2 	LINK=.
      00259E                          3 GOSUB:
      00A1DF EE                       4 	.byte 5 	
      00A1E0 04 A3 A1 C2 26           5 	.ascii "GOSUB"
      00A1E5 F2 90                    6 	.word gosub 
      0025A6                       6431 	_dict_entry,6,FORGET,forget 
      00A1E7 CF 00                    1 	.word LINK 
                           0025A8     2 	LINK=.
      0025A8                          3 FORGET:
      00A1E9 07                       4 	.byte 6 	
      00A1EA 90 E6 02 C7 00 0A        5 	.ascii "FORGET"
      00A1F0 35 06                    6 	.word forget 
      0025B1                       6432 	_dict_entry,3,FOR,for 
      00A1F2 00 09                    1 	.word LINK 
                           0025B3     2 	LINK=.
      0025B3                          3 FOR:
      00A1F4 81                       4 	.byte 3 	
      00A1F5 46 4F 52                 5 	.ascii "FOR"
      00A1F5 72 5F                    6 	.word for 
      0025B9                       6433 	_dict_entry,6,FILETX,file_transmit
      00A1F7 00 07                    1 	.word LINK 
                           0025BB     2 	LINK=.
      0025BB                          3 FILETX:
      00A1F9 72                       4 	.byte 6 	
      00A1FA 5F 00 08 72 5F 00        5 	.ascii "FILETX"
      00A200 09 72                    6 	.word file_transmit 
      0025C4                       6434 	_dict_entry,6,FILERX,file_receive 
      00A202 5F 00                    1 	.word LINK 
                           0025C6     2 	LINK=.
      0025C6                          3 FILERX:
      00A204 0A                       4 	.byte 6 	
      00A205 CE 00 1D 45 52 58        5 	.ascii "FILERX"
      00A208 22 D1                    6 	.word file_receive 
      0025CF                       6435 	_dict_entry,4,FCPU,fcpu 
      00A208 C3 00                    1 	.word LINK 
                           0025D1     2 	LINK=.
      0025D1                          3 FCPU:
      00A20A 1F                       4 	.byte 4 	
      00A20B 24 17 90 93              5 	.ascii "FCPU"
      00A20F EE 04                    6 	.word fcpu 
      0025D8                       6436 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A211 A3 A1                    1 	.word LINK 
                           0025DA     2 	LINK=.
      0025DA                          3 EEPROM:
      00A213 C2                       4 	.byte 6+F_IFUNC 	
      00A214 26 1A 90 CF 00 07        5 	.ascii "EEPROM"
      00A21A 90 E6                    6 	.word const_eeprom_base 
      0025E3                       6437 	_dict_entry,3,END,cmd_end  
      00A21C 02 C7                    1 	.word LINK 
                           0025E5     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0025E5                          3 END:
      00A21E 00                       4 	.byte 3 	
      00A21F 0A 35 06                 5 	.ascii "END"
      00A222 00 09                    6 	.word cmd_end 
      0025EB                       6438 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A224 72 5D                    1 	.word LINK 
                           0025ED     2 	LINK=.
      0025ED                          3 DWRITE:
      00A226 00                       4 	.byte 6+F_CMD 	
      00A227 0A 26 05 A6 0C CC        5 	.ascii "DWRITE"
      00A22D 88 F7                    6 	.word digital_write 
      0025F6                       6439 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A22F 81 ED                    1 	.word LINK 
                           0025F8     2 	LINK=.
      00A230                          3 DREAD:
      00A230 93                       4 	.byte 5+F_IFUNC 	
      00A231 E6 02 C7 00 0E           5 	.ascii "DREAD"
      00A236 72 5F                    6 	.word digital_read 
      002600                       6440 	_dict_entry,2,DO,do_loop
      00A238 00 0D                    1 	.word LINK 
                           002602     2 	LINK=.
      002602                          3 DO:
      00A23A 72                       4 	.byte 2 	
      00A23B BB 00                    5 	.ascii "DO"
      00A23D 0D 20                    6 	.word do_loop 
      002607                       6441 	_dict_entry,3,DIR,directory 
      00A23F C8 02                    1 	.word LINK 
                           002609     2 	LINK=.
      00A240                          3 DIR:
      00A240 52                       4 	.byte 3 	
      00A241 06 49 52                 5 	.ascii "DIR"
      00A242 1C 00                    6 	.word directory 
      00260F                       6442 	_dict_entry,3,DEC,dec_base
      00A242 C6 00                    1 	.word LINK 
                           002611     2 	LINK=.
      002611                          3 DEC:
      00A244 09                       4 	.byte 3 	
      00A245 C1 00 0A                 5 	.ascii "DEC"
      00A248 27 37                    6 	.word dec_base 
      002617                       6443 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A24A CD 95                    1 	.word LINK 
                           002619     2 	LINK=.
      002619                          3 DDR:
      00A24C B7                       4 	.byte 3+F_IFUNC 	
      00A24D CE 00 07                 5 	.ascii "DDR"
      00A250 CF 00                    6 	.word const_ddr 
      00261F                       6444 	_dict_entry,6,DATALN,data_line  
      00A252 05 55                    1 	.word LINK 
                           002621     2 	LINK=.
      002621                          3 DATALN:
      00A254 00                       4 	.byte 6 	
      00A255 09 00 02 55 00 0A        5 	.ascii "DATALN"
      00A25B 00 04                    6 	.word data_line 
      00262A                       6445 	_dict_entry,4,DATA,data  
      00A25D CD 91                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                           00262C     2 	LINK=.
      00262C                          3 DATA:
      00A25F FD                       4 	.byte 4 	
      00A260 A1 84 27 03              5 	.ascii "DATA"
      00A264 CC 88                    6 	.word data 
      002633                       6446 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A266 F5 2C                    1 	.word LINK 
                           002635     2 	LINK=.
      00A267                          3 CRL:
      00A267 1F                       4 	.byte 3+F_IFUNC 	
      00A268 05 CD 89                 5 	.ascii "CRL"
      00A26B E7 CE                    6 	.word const_cr1 
      00263B                       6447 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A26D 00 05                    1 	.word LINK 
                           00263D     2 	LINK=.
      00263D                          3 CRH:
      00A26F CF                       4 	.byte 3+F_IFUNC 	
      00A270 00 07 55                 5 	.ascii "CRH"
      00A273 00 02                    6 	.word const_cr2 
      002643                       6448 	_dict_entry,4+F_CFUNC,CHAR,char
      00A275 00 09                    1 	.word LINK 
                           002645     2 	LINK=.
      002645                          3 CHAR:
      00A277 CD                       4 	.byte 4+F_CFUNC 	
      00A278 95 C7 1E 05              5 	.ascii "CHAR"
      00A27C A6 84                    6 	.word char 
      00264C                       6449 	_dict_entry,3,BYE,bye 
      00A27E 5B 06                    1 	.word LINK 
                           00264E     2 	LINK=.
      00264E                          3 BYE:
      00A280 81                       4 	.byte 3 	
      00A281 42 59 45                 5 	.ascii "BYE"
      00A281 90 CE                    6 	.word bye 
      002654                       6450 	_dict_entry,5,BTOGL,bit_toggle
      00A283 00 07                    1 	.word LINK 
                           002656     2 	LINK=.
      002656                          3 BTOGL:
      00A285 72                       4 	.byte 5 	
      00A286 5F 00 07 72 5F           5 	.ascii "BTOGL"
      00A28B 00 08                    6 	.word bit_toggle 
      00265E                       6451 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A28D 72 5F                    1 	.word LINK 
                           002660     2 	LINK=.
      002660                          3 BTEST:
      00A28F 00                       4 	.byte 5+F_IFUNC 	
      00A290 09 72 5F 00 0A           5 	.ascii "BTEST"
      00A295 CD A2                    6 	.word bit_test 
      002668                       6452 	_dict_entry,4,BSET,bit_set 
      00A297 30 20                    1 	.word LINK 
                           00266A     2 	LINK=.
      00266A                          3 BSET:
      00A299 A8                       4 	.byte 4 	
      00A29A 42 53 45 54              5 	.ascii "BSET"
      00A29A CD 91                    6 	.word bit_set 
      002671                       6453 	_dict_entry,4,BRES,bit_reset
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A29C 04 A1                    1 	.word LINK 
                           002673     2 	LINK=.
      002673                          3 BRES:
      00A29E 02                       4 	.byte 4 	
      00A29F 27 03 CC 88              5 	.ascii "BRES"
      00A2A3 F5 FE                    6 	.word bit_reset 
      00A2A4                       6454 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A2A4 72 12                    1 	.word LINK 
                           00267C     2 	LINK=.
      00267C                          3 BIT:
      00A2A6 50                       4 	.byte 3+F_IFUNC 	
      00A2A7 C7 85 5D                 5 	.ascii "BIT"
      00A2AA 27 21                    6 	.word bitmask 
      002682                       6455 	_dict_entry,3,AWU,awu 
      00A2AC 85 A6                    1 	.word LINK 
                           002684     2 	LINK=.
      002684                          3 AWU:
      00A2AE 08                       4 	.byte 3 	
      00A2AF 42 9F C7                 5 	.ascii "AWU"
      00A2B2 52 00                    6 	.word awu 
      00268A                       6456 	_dict_entry,7,AUTORUN,autorun
      00A2B4 72 1A                    1 	.word LINK 
                           00268C     2 	LINK=.
      00268C                          3 AUTORUN:
      00A2B6 50                       4 	.byte 7 	
      00A2B7 14 72 1A 50 16 72 14     5 	.ascii "AUTORUN"
      00A2BE 52 00                    6 	.word autorun 
      002696                       6457 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A2C0 72 12                    1 	.word LINK 
                           002698     2 	LINK=.
      002698                          3 ASC:
      00A2C2 52                       4 	.byte 3+F_IFUNC 	
      00A2C3 01 72 10                 5 	.ascii "ASC"
      00A2C6 52 01                    6 	.word ascii 
      00269E                       6458 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A2C8 72 1C                    1 	.word LINK 
                           0026A0     2 	LINK=.
      0026A0                          3 AND:
      00A2CA 52                       4 	.byte 3+F_IFUNC 	
      00A2CB 00 81 44                 5 	.ascii "AND"
      00A2CD 1E 2D                    6 	.word bit_and 
      0026A6                       6459 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A2CD 5B 02                    1 	.word LINK 
                           0026A8     2 	LINK=.
      0026A8                          3 ADCREAD:
      00A2CF A6                       4 	.byte 7+F_IFUNC 	
      00A2D0 82 C4 52 03 A1 02 26     5 	.ascii "ADCREAD"
      00A2D7 F7 72                    6 	.word analog_read 
      0026B2                       6460 	_dict_entry,5,ADCON,power_adc 
      00A2D9 1D 52                    1 	.word LINK 
                           0026B4     2 	LINK=.
      0026B4                          3 ADCON:
      00A2DB 00                       4 	.byte 5 	
      00A2DC 72 13 50 C7 72           5 	.ascii "ADCON"
      00A2E1 1B 50                    6 	.word power_adc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      0026BC                       6461 kword_dict:
      0026BC                       6462 	_dict_entry,3+F_IFUNC,ABS,abs
      00A2E3 16 81                    1 	.word LINK 
                           0026BE     2 	LINK=.
      00A2E5                          3 ABS:
      00A2E5 A6                       4 	.byte 3+F_IFUNC 	
      00A2E6 78 C5 52                 5 	.ascii "ABS"
      00A2E9 03 27                    6 	.word abs 
                                   6463 	
                                   6464 
      002700                       6465 	.bndry 128 ; align on FLASH block.
                                   6466 ; free space for user application  
      002700                       6467 user_space:
                                   6468 ; USR() function test
      00A2EB 04               [ 2] 6469 	pushw x 
      00A2EC 72 5F 52 03      [ 1] 6470 	bset PC_ODR,#5 
      00A2F0 81               [ 2] 6471 	popw x 
      00A2F1 CD 1D C1         [ 4] 6472 	call pause02 
      00A2F1 88 CD A2 E5      [ 1] 6473 	bres PC_ODR,#5 
      00A2F5 84               [ 4] 6474 	ret
                                   6475 
                                   6476 	.area FLASH_DRIVE (ABS)
      010000                       6477 	.org 0x10000
      010000                       6478 fdrive:
                                   6479 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        0026BE R   |     ACK     =  000006 
  5 ADCON      0026B4 R   |   5 ADCREAD    0026A8 R   |     ADC_CR1 =  005401 
    ADC_CR1_=  000000     |     ADC_CR1_=  000001     |     ADC_CR1_=  000004 
    ADC_CR1_=  000005     |     ADC_CR1_=  000006     |     ADC_CR2 =  005402 
    ADC_CR2_=  000003     |     ADC_CR2_=  000004     |     ADC_CR2_=  000005 
    ADC_CR2_=  000006     |     ADC_CR2_=  000001     |     ADC_CR3 =  005403 
    ADC_CR3_=  000007     |     ADC_CR3_=  000006     |     ADC_CSR =  005400 
    ADC_CSR_=  000006     |     ADC_CSR_=  000004     |     ADC_CSR_=  000000 
    ADC_CSR_=  000001     |     ADC_CSR_=  000002     |     ADC_CSR_=  000003 
    ADC_CSR_=  000007     |     ADC_CSR_=  000005     |     ADC_DRH =  005404 
    ADC_DRL =  005405     |     ADC_TDRH=  005406     |     ADC_TDRL=  005407 
    ADDR    =  000001     |     ADR     =  000002     |     AFR     =  004803 
    AFR0_ADC=  000000     |     AFR1_TIM=  000001     |     AFR2_CCO=  000002 
    AFR3_TIM=  000003     |     AFR4_TIM=  000004     |     AFR5_TIM=  000005 
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        0026A0 R
    AREG    =  000002     |     ARG_OFS =  000002     |   5 ASC        002698 R
    ATTRIB  =  000002     |   5 AUTORUN    00268C R   |     AUTORUN_=  004000 
  5 AWU        002684 R   |   5 AWUHandl   000001 R   |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_CSR_=  000004     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BASE_SAV=  000001     |     BCNT    =  000001 
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |     BINARY  =  000001 
  5 BIT        00267C R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   5 BRES       002673 R   |     BS      =  000008 
    BSAVE   =  000001     |   5 BSET       00266A R   |     BSIZE   =  000001 
  5 BTEST      002660 R   |   5 BTOGL      002656 R   |     BTW     =  000001 
    BUFFER  =  000002     |     BUFF_LEN=  000010     |   5 BYE        00264E R
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
    CFG_GCR_=  000000     |   5 CHAR       002645 R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]

Symbol Table

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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |     CMD_END =  000002 
    CNT     =  000006     |     CNTR    =  000003     |     COMMA   =  000001 
    COUNT   =  000001     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   5 CRH        00263D R   |   5 CRL        002635 R
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   5 DATA       00262C R
  5 DATALN     002621 R   |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |     DBL     =  000003 
    DBLDIVDN=  000006     |     DBLHI   =  000001     |     DBLLO   =  000003 
    DBL_SIZE=  000004     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |   5 DDR        002619 R
    DEBUG   =  000000     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        002611 R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        002609 R   |     DIVDNDHI=  00000B 
    DIVDNDLO=  00000D     |     DIVISOR =  000001     |     DIVISR  =  000007 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   5 DO         002602 R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |   5 DREAD      0025F8 R   |   5 DWRITE     0025ED R
  5 EEPROM     0025DA R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |     EM      =  000019     |   5 END        0025E5 R
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FAUTORUN=  000006     |     FBREAK  =  000004     |     FCOMP   =  000005 
  5 FCPU       0025D1 R   |     FF      =  00000C     |     FHSE    =  7A1200 
    FHSI    =  F42400     |   5 FILERX     0025C6 R   |   5 FILETX     0025BB R
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
    FLSI    =  01F400     |   5 FOR        0025B3 R   |   5 FORGET     0025A8 R
    FRUN    =  000000     |     FS      =  00001C     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      00259E R   |   5 GOTO       002595 R
  5 GPIO       00258C R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  5 HEX        002584 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_SR1_=  000001     |     I2C_SR1_=  000002     |     I2C_SR1_=  000006 
    I2C_SR1_=  000000     |     I2C_SR1_=  000004     |     I2C_SR1_=  000007 
    I2C_SR2 =  005218     |     I2C_SR2_=  000002     |     I2C_SR2_=  000001 
    I2C_SR2_=  000000     |     I2C_SR2_=  000003     |     I2C_SR2_=  000005 
    I2C_SR3 =  005219     |     I2C_SR3_=  000001     |     I2C_SR3_=  000007 
    I2C_SR3_=  000004     |     I2C_SR3_=  000000     |     I2C_SR3_=  000002 
    I2C_TRIS=  00521D     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        00257C R
  5 IF         002575 R   |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      00256B R   |     INPUT_DI=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
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
    INT_VECT=  008058     |   5 INVERT     002560 R   |     INW     =  000009 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     002555 R
  5 IWDGREF    002549 R   |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   5 KEY        002541 R   |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   5 LET        002539 R
    LF      =  00000A     |     LIMIT   =  000005     |     LINENO  =  000005 
  5 LINK    =  0026BE R   |   5 LIST       002530 R   |     LL      =  000002 
    LLEN    =  000002     |     LL_HB   =  000001     |     LN_PTR  =  000005 
  5 LOAD       002527 R   |   5 LOG        00251F R   |   5 LSHIFT     002514 R
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |   5 MULDIV     002509 R
    MULOP   =  000003     |     N1      =  000001     |     NAFR    =  004804 
    NAK     =  000015     |     NAMEPTR =  000003     |     NCLKOPT =  004808 
    NEG     =  000001     |   5 NEW        0024F8 R   |     NEW_FREE=  000001 
  5 NEXT       002500 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  5 NOT        0024F0 R   |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R   |   5 ODR        0024E8 R
    ONOFF   =  000003     |     OP      =  000003     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         0024E1 R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
  5 PAD        0024D9 R   |     PAD_SIZE=  000080     |   5 PAUSE      0024CF R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       0024BC R   |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   5 PINP       0024B3 R   |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  5 PMODE      0024C5 R   |   5 POKE       0024AA R   |     PORT    =  000003 
  5 POUT       0024A1 R   |     PREV    =  000001     |   5 PRINT      002497 R
  5 PRTA       00248E R   |   5 PRTB       002485 R   |   5 PRTC       00247C R
  5 PRTD       002473 R   |   5 PRTE       00246A R   |   5 PRTF       002461 R
  5 PRTG       002458 R   |   5 PRTH       00244F R   |   5 PRTI       002446 R
  5 QKEY       00243D R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 READ       002434 R   |   5 REBOOT     002429 R
    REG     =  000001     |     RELOP   =  000003     |   5 REMARK     00241E R
  5 RESTORE    002412 R   |     RETL1   =  000001     |   5 RETURN     002407 R
    RET_ADDR=  000003     |     RET_INW =  000005     |   5 RND        0023FF R
    ROP     =  004800     |     RS      =  00001E     |   5 RSHIFT     0023F4 R
    RST_SR  =  0050B3     |   5 RUN        0023EC R   |     RXCHAR  =  000001 
  5 SAVE       0023E3 R   |     SDIVSR  =  000005     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       0023DA R
    SI      =  00000F     |     SIGN    =  000001     |   5 SIZE       0023D1 R
    SKIP    =  000005     |   5 SLEEP      0023C7 R   |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |     SPCNT   =  000001 
  5 SPIEN      0023B3 R   |   5 SPIRD      0023BD R   |   5 SPISEL     0023A8 R
  5 SPIWR      00239E R   |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
    STACK_SI=  0000A0     |   5 STEP       002395 R   |   5 STOP       00238C R
    STX     =  000002     |     SUB     =  00001A     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      002382 R
    TIM1_ARR=  005262     |     TIM1_ARR=  005263     |     TIM1_BKR=  00526D 
    TIM1_CCE=  00525C     |     TIM1_CCE=  00525D     |     TIM1_CCM=  005258 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR_=  000000     |   5 TIMEOUT    00236C R   |   5 TIMER      002378 R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
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
  5 TO         002365 R   |   5 TONE       00235C R   |   5 Timer4Up   000037 R
    U1      =  000001     |     U8      =  000003     |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
    UART1_RX=  000004     |     UART1_SR=  005230     |     UART1_TX=  000005 
    UART3   =  000001     |     UART3_BA=  005240     |     UART3_BR=  005242 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

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
    UBC     =  004801     |   5 UBOUND     002351 R   |   5 UBTN_Han   00007A R
  5 UFLASH     002346 R   |   5 UNTIL      00233C R   |     US      =  00001F 
  5 USER_ABO   000082 R   |   5 USR        002334 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 Uart1RxH   00000F R
  5 UserButt   00004D R   |     VAR_ADDR=  000006     |     VSIZ    =  000002 
    VSIZE   =  000006     |     VT      =  00000B     |   5 WAIT       00232B R
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   5 WORDS      002321 R
  5 WRITE      002317 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XADR    =  000001     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   5 XOR        00230F R
    XREG    =  000003     |     XSAVE   =  000005     |     YSAVE   =  000007 
  5 abs        001E19 R   |   1 acc16      00000C R   |   1 acc24      00000B R
  1 acc8       00000D R   |   5 accept_c   000B31 R   |   5 add_char   0014A6 R
  5 analog_r   001893 R   |   5 ansi_seq   000AF3 R   |   5 arduino_   001F04 R
  5 arg_list   001084 R   |   1 array_si   000021 R   |   5 ascii      001CCB R
  5 at_tst     000D38 R   |   5 atoi24     000E49 R   |   5 atoi_exi   000EAF R
  5 autorun    001D54 R   |   5 autorun_   0006CC R   |   5 awu        001DCA R
  5 awu02      001DD4 R   |   5 bad_port   001D23 R   |   1 base       00000A R
  1 basicptr   000004 R   |   5 beep       001820 R   |   5 bin_exit   000C16 R
  5 bit_and    001E2D R   |   5 bit_or     001E45 R   |   5 bit_rese   0015FE R
  5 bit_set    0015EE R   |   5 bit_test   00161F R   |   5 bit_togg   00160F R
  5 bit_xor    001E5D R   |   5 bitmask    002070 R   |   5 bkslsh_t   000CE5 R
  5 bksp       0002BD R   |   5 block_er   0001A3 R   |   5 break_po   001960 R
  5 bye        001D4B R   |   5 cancel_a   000694 R   |   5 char       001CB9 R
  5 clear_ba   0006E1 R   |   5 clear_va   00055D R   |   5 clock_in   00009D R
  5 cmd_end    00180C R   |   5 cmd_line   0008FF R   |   5 cmd_name   000FF3 R
  5 cmp_name   001A01 R   |   5 cold_sta   0005CB R   |   5 colon_ts   000D0C R
  5 comma_ts   000D17 R   |   5 comp_msg   000855 R   |   5 compile    0004EA R
  5 const_cr   002124 R   |   5 const_cr   00212A R   |   5 const_dd   00211E R
  5 const_ee   00213C R   |   5 const_id   002118 R   |   5 const_in   002136 R
  5 const_od   002112 R   |   5 const_ou   002130 R   |   5 const_po   0020DC R
  5 const_po   0020E2 R   |   5 const_po   0020E8 R   |   5 const_po   0020EE R
  5 const_po   0020F4 R   |   5 const_po   0020FA R   |   5 const_po   002100 R
  5 const_po   002106 R   |   5 const_po   00210C R   |   5 convert_   000B8D R
  5 copy_com   000D6D R   |   1 count      000003 R   |   5 cp_loop    001033 R
  5 create_g   000451 R   |   5 cs_high    0022CC R   |   5 cstk_pro   00123B R
  5 dash_tst   000D2D R   |   5 data       002142 R   |   1 data_len   000009 R
  5 data_lin   002148 R   |   1 data_ofs   000008 R   |   1 data_ptr   000006 R
  5 data_sea   002188 R   |   5 dbl_sign   000F5B R   |   5 dec_base   001267 R
  5 del_back   000B22 R   |   5 del_line   000424 R   |   5 del_ln     000B13 R
  5 delete     0002CD R   |   5 digital_   0018C7 R   |   5 digital_   0018F7 R
  5 dir_loop   001C0C R   |   5 director   001C00 R   |   5 disk_fre   0019EE R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

  5 div32_16   000F65 R   |   5 divide     000FBC R   |   5 divu24_8   000A44 R
  5 dneg       000F50 R   |   5 do_loop    002099 R   |   5 do_progr   000196 R
  5 drive_fr   001C75 R   |   5 enable_i   00201A R   |   5 eql_tst    000DC2 R
  5 equal      0014B9 R   |   5 erase_fl   0001C2 R   |   5 err_bad_   0007C1 R
  5 err_buf_   000837 R   |   5 err_cmd_   000785 R   |   5 err_div0   00074A R
  5 err_dupl   00079F R   |   5 err_math   000731 R   |   5 err_mem_   000716 R
  5 err_msg    0006F6 R   |   5 err_no_a   0007CD R   |   5 err_no_d   000800 R
  5 err_no_f   000824 R   |   5 err_no_l   000759 R   |   5 err_no_p   000810 R
  5 err_not_   0007B0 R   |   5 err_run_   00076F R   |   5 err_synt   000723 R
  5 escaped    000BA2 R   |   5 expect     001072 R   |   5 expr_exi   0011C3 R
  5 expressi   00117D R   |   5 factor     0010D4 R   |   1 farptr     000016 R
  5 fcpu       001EA7 R   |   7 fdrive     010000 R   |   1 ffree      000019 R
  5 file_cou   001C6D R   |   5 file_rec   0022D1 R   |   5 file_tra   002306 R
  5 final_te   000AED R   |   5 first_li   0012EC R   |   1 flags      000023 R
  5 for        00167A R   |   5 forget     001B99 R   |   1 free_ram   00005A R
  5 fsize_ms   0022F5 R   |   5 func_arg   00107F R   |   5 func_not   00200D R
  5 ge         0014BB R   |   5 get_arra   0010AF R   |   5 get_targ   001744 R
  5 get_tick   001E13 R   |   5 get_toke   000C7E R   |   5 getc       0002A9 R
  5 gosub      001775 R   |   5 goto       00175A R   |   5 gpio       001CFE R
  5 gt         0014B7 R   |   5 gt_tst     000DCD R   |   5 hex_base   001262 R
  5 hex_dump   000355 R   |   5 if         001666 R   |   1 in         000001 R
  1 in.saved   000002 R   |   1 in.w       000000 R   |   5 incr_far   0019AE R
  5 input_ex   0015C0 R   |   5 input_lo   001559 R   |   5 input_va   001557 R
  5 insert_l   00047D R   |   5 insert_l   0004E7 R   |   5 interp_l   000940 R
  5 interpre   00091B R   |   5 invert     00208A R   |   5 is_alpha   00056B R
  5 is_digit   00057C R   |   5 itoa       0009F1 R   |   5 itoa_loo   000A09 R
  5 jp_to_ta   001768 R   |   5 key        001CEB R   |   5 kw_loop    000C32 R
  5 kword_di   0026BC R   |   5 kword_en   00230D R   |   5 le         0014C0 R
  5 leading_   002060 R   |   5 left_arr   000AF3 R   |   5 let        001298 R
  5 let_arra   0012A6 R   |   5 let_var    0012A9 R   |   5 lines_sk   0012EF R
  5 list       0012C3 R   |   5 list_exi   001335 R   |   5 list_sta   00130F R
  5 load       001B69 R   |   5 load_aut   0006A3 R   |   5 load_fil   001B38 R
  5 log2       002055 R   |   5 logical_   002003 R   |   5 long_div   000F38 R
  5 loop_bac   001727 R   |   1 loop_dep   000020 R   |   5 loop_don   00173C R
  5 lshift     001E75 R   |   5 lt         0014BE R   |   5 lt_tst     000DF6 R
  5 modulo     000FD2 R   |   5 move       0003BE R   |   5 move_dow   0003DC R
  5 move_era   000128 R   |   5 move_exi   0003FD R   |   5 move_loo   0003E1 R
  5 move_prg   00015C R   |   5 move_up    0003CE R   |   5 mul_char   0014A8 R
  5 muldiv     000FD7 R   |   5 multiply   000F00 R   |   5 mulu24_8   000A6C R
  5 nbr_tst    000CB1 R   |   5 ne         0014C3 R   |   5 neg_acc2   000AA6 R
  5 new        00197E R   |   5 next       0016FA R   |   5 next_lin   000923 R
  5 next_tok   000967 R   |   5 no_match   001045 R   |   5 other      000E1F R
  3 pad        0016E0 R   |   5 pad_ref    002307 R   |   5 parse_bi   000BF4 R
  5 parse_in   000BAA R   |   5 parse_ke   000C31 R   |   5 parse_qu   000B55 R
  5 pause      001DB7 R   |   5 pause02    001DC1 R   |   5 peek       001655 R
  5 pin_mode   001EB3 R   |   5 plus_tst   000D96 R   |   5 poke       001646 R
  5 power_ad   001857 R   |   5 prcnt_ts   000DB7 R   |   5 print      0014C6 R
  5 print_ex   00152B R   |   5 print_in   0009BC R   |   5 print_ty   001537 R
  5 program_   00013C R   |   5 program_   00015C R   |   5 prt_basi   001390 R
  5 prt_cmd_   001338 R   |   5 prt_loop   0014CA R   |   5 prt_quot   00134C R
  5 prt_tok    0002E7 R   |   5 prti24     0009CC R   |   1 ptr16      000017 R
  1 ptr8       000018 R   |   5 putc       0002A0 R   |   5 puts       0002B3 R
  5 qkey       001CF3 GR  |   5 qmark_ts   000D43 R   |   5 random     001F24 R
  5 read       0021C0 R   |   5 read01     0021C2 R   |   5 readln     000AC9 R
  5 readln_l   000AD1 R   |   5 readln_q   000B46 R   |   5 refresh_   002050 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

  5 rel_exit   00121E R   |   5 relation   0011C6 R   |   5 relop_st   0014AB R
  5 remark     0015C3 R   |   5 reprint    000AF3 R   |   5 reset_co   0014C8 R
  5 rest_con   001547 R   |   5 restore    002175 R   |   5 return     001795 R
  5 right_ar   000AF3 R   |   5 row_alig   001993 R   |   5 row_eras   000101 R
  5 row_eras   000128 R   |   5 row_loop   000338 R   |   5 rparnt_t   000D01 R
  5 rshift     001E8E R   |   5 rt_msg     000844 R   |   5 run        0017B3 R
  5 run_it     0017E5 R   |   1 rx_char    000025 R   |   5 save       001A6F R
  5 save_con   001537 R   |   5 search_d   001025 R   |   5 search_e   00106F R
  5 search_f   001A22 R   |   5 search_l   000400 R   |   5 search_l   000408 R
  5 search_n   001029 R   |   1 seedx      000012 R   |   1 seedy      000014 R
  5 seek_fdr   0019BC R   |   5 select_p   001EF4 R   |   5 set_time   001FF1 R
  5 sharp_ts   000D22 R   |   5 show       001221 R   |   5 show_row   000326 R
  5 single_c   0014A1 R   |   5 size       00126C R   |   5 skip       000EB3 R
  5 slash_ts   000DAC R   |   5 sleep      001DAC R   |   5 software   000585 R
  5 spaces     0002DB R   |   5 spi_clea   002265 R   |   5 spi_disa   00224D R
  5 spi_enab   00221A R   |   5 spi_rcv_   002287 R   |   5 spi_read   0022B2 R
  5 spi_sele   0022BA R   |   5 spi_send   002271 R   |   5 spi_writ   002292 R
  3 stack_fu   001760 R   |   3 stack_un   001800 R   |   5 star_tst   000DA1 R
  5 step       0016D3 R   |   5 stop       001932 R   |   5 store_lo   0016E7 R
  5 str_matc   001052 R   |   5 str_tst    000CA1 R   |   5 strcmp     00039F R
  5 strcpy     0003B0 R   |   5 strlen     000392 R   |   5 syntax_e   000875 R
  1 tab_widt   000024 R   |   5 tb_error   000877 R   |   5 term       00112E R
  5 term01     001137 R   |   5 term_exi   00117A R   |   3 tib        001690 R
  5 tick_tst   000D5B R   |   1 ticks      00000E R   |   5 timeout    002000 R
  1 timer      000010 R   |   5 timer2_i   0000B3 R   |   5 timer4_i   0000C0 R
  5 tk_id      000865 R   |   5 to         0016A3 R   |   5 to_eepro   00017F R
  5 to_flash   000193 R   |   5 to_upper   000E3D GR  |   5 token_ch   000E36 R
  5 token_ex   000E3A R   |   5 token_ms   00031E R   |   5 tone       001813 R
  5 try_next   0021B0 R   |   1 txtbgn     00001C R   |   1 txtend     00001E R
  5 uart1_in   000265 R   |   5 uart1_se   000275 R   |   5 ubound     001276 R
  5 udiv32_1   000F26 R   |   5 uflash     001D28 R   |   5 umstar     000EC6 R
  5 unlock_e   0000D5 R   |   5 unlock_f   0000EB R   |   5 until      0020AE R
  5 user_int   000060 R   |   5 user_spa   002700 R   |   5 usr        001D2E R
  5 var_name   001388 R   |   1 vars       000026 R   |   5 wait       0015C9 R
  5 warm_ini   000676 R   |   5 warm_sta   0008FC R   |   5 words      001F8B R
  5 words_co   001FDB R   |   5 write      001C82 R   |   5 write_bl   000242 R
  5 write_by   0001CD R   |   5 write_ee   000209 R   |   5 write_ex   00023D R
  5 write_fl   0001F3 R   |   5 write_ro   000170 R   |     xreceive   ****** GX
  5 zero_pad   001988 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5A   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   270E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

