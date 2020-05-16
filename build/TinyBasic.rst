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
      000007                         67 data_ptr:  .blkw 1  ; point to DATA address
      000009                         68 data_ofs:  .blkb 1  ; index to next data item 
      00000A                         69 data_len:  .blkb 1  ; length of data line 
      00000B                         70 base:  .blkb 1 ; nemeric base used to print integer 
      00000C                         71 acc24:: .blkb 1 ; 24 bit accumulator upper-byte 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      00000D                         72 acc16:: .blkb 1 ; 16 bit accumulator, acc24 high-byte
      00000E                         73 acc8::  .blkb 1 ;  8 bit accumulator, acc24 low-byte  
      00000F                         74 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000011                         75 timer: .blkw 1 ;  milliseconds count down timer 
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
      000030                         91 vars: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     92 ; keep 'free_ram' as last variable 
      000064                         93 free_ram: ; from here RAM free for BASIC text 
                                     94 
                                     95 ;;-----------------------------------
                                     96     .area SSEG (ABS)
                                     97 ;; working buffers and stack at end of RAM. 	
                                     98 ;;-----------------------------------
      001690                         99     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
      001690                        100 tib:: .ds TIB_SIZE             ; transaction input buffer
      0016E0                        101 pad: .ds PAD_SIZE             ; working buffer
      001760                        102 stack_full: .ds STACK_SIZE   ; control stack 
      001800                        103 stack_unf: ; stack underflow ; control_stack bottom 
                                    104 
                                    105 ;;--------------------------------------
                                    106     .area HOME 
                                    107 ;; interrupt vector table at 0x8000
                                    108 ;;--------------------------------------
      008000 82 00 86 5A            109     int cold_start			; RESET vector 
                           000000   110 .if DEBUG
                                    111 	int TrapHandler 		;TRAP  software interrupt
                           000001   112 .else
      008004 82 00 80 80            113 	int NonHandledInterrupt ;TRAP  software interrupt
                                    114 .endif
      008008 82 00 80 80            115 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 81            116 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            117 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            118 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80            119 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80            120 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            121 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 E5            122 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80            123 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80            124 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80            125 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80            126 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008038 82 00 80 80            127 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80            128 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80            129 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80            130 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80            131 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80            132 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 8F            133 	int Uart1RxHandler		;int18 UART1 RX full ; user communication channel.
      008054 82 00 80 80            134 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80            135 	int NonHandledInterrupt ;int20 UART1 TX completed
      00805C 82 00 80 80            136 	int NonHandledInterrupt ;int21 UART1 RX full
      008060 82 00 80 80            137 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 CF            138 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80            139 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80            140 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80            141 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80            142 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80            143 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80            144 	int NonHandledInterrupt ;int29  not used
                                    145 
                                    146 ;---------------------------------------
                                    147     .area CODE
                                    148 ;---------------------------------------
                           000000   149 .if DEBUG
                                    150 .asciz "STM8_TBI" ; I like to put module name here.
                                    151 .endif 
                                    152 
                                    153 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    154 ; non handled interrupt 
                                    155 ; reset MCU
                                    156 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                        157 NonHandledInterrupt:
      008080 71                     158     .byte 0x71  ; invalid opcode reinitialize MCU
                                    159 
                                    160 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    161 ; auto wakeup from halt
                                    162 ; at iret, program continue 
                                    163 ; after hatl instruction
                                    164 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008081                        165 AWUHandler:
      008081 72 19 50 F0      [ 1]  166 	bres AWU_CSR,#AWU_CSR_AWUEN
      008085 55 00 3F 50 F1   [ 1]  167 	mov AWU_APR,0x3F
      00808A 72 5F 50 F2      [ 1]  168 	clr AWU_TBR 
      00808E 80               [11]  169 	iret
                                    170 
                                    171 ;--------------------------
                                    172 ; UART1 receive character
                                    173 ; CTRL-C (ASCII 3)
                                    174 ; cancel program execution
                                    175 ; and fall back to command line
                                    176 ;--------------------------
      00808F                        177 Uart1RxHandler:
      00808F 72 0B 52 30 FB   [ 2]  178 	btjf UART1_SR,#UART_SR_RXNE,.
      008094 C6 52 31         [ 1]  179 	ld a,UART1_DR 
      008097 A1 03            [ 1]  180 	cp a,#CTRL_C 
      008099 26 0B            [ 1]  181 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      00809B 72 5F 00 2E      [ 1]  182 	clr rx_head 
      00809F 72 5F 00 2F      [ 1]  183 	clr rx_tail 
      0080A3 CC 80 F8         [ 2]  184 	jp user_interrupted
      0080A6                        185 1$:
      0080A6 A1 18            [ 1]  186 	cp a,#CAN ; CTRL_X 
      0080A8 26 03            [ 1]  187 	jrne 2$
      0080AA CC 86 5A         [ 2]  188 	jp cold_start 	
      0080AD                        189 2$: 
      0080AD A1 1A            [ 1]  190 	cp a,#CTRL_Z
      0080AF 26 06            [ 1]  191 	jrne 3$
      0080B1 CD 87 1C         [ 4]  192 	call cancel_autorun 
      0080B4 CC 86 5A         [ 2]  193 	jp cold_start 
      0080B7 AE 00 26         [ 2]  194 3$:	ldw x,#rx_queue  
      0080BA 88               [ 1]  195 	push a 
      0080BB 9F               [ 1]  196 	ld a,xl 
      0080BC CB 00 2F         [ 1]  197 	add a,rx_tail 
      0080BF 97               [ 1]  198 	ld xl,a
      0080C0 84               [ 1]  199 	pop a  
      0080C1 F7               [ 1]  200 	ld (x),a
      0080C2 72 5C 00 2F      [ 1]  201 	inc rx_tail 
      0080C6 A6 07            [ 1]  202 	ld a,#RX_QUEUE_SIZE-1
      0080C8 C4 00 2F         [ 1]  203 	and a,rx_tail 
      0080CB C7 00 2F         [ 1]  204 	ld rx_tail,a  	
      0080CE 80               [11]  205 	iret 
                                    206 
                                    207 ;------------------------------------
                                    208 ; software interrupt handler  
                                    209 ;------------------------------------
                           000000   210 .if DEBUG 
                                    211 TrapHandler:
                                    212 	bset flags,#FTRAP 
                                    213 	call print_registers
                                    214 	call cmd_itf
                                    215 	bres flags,#FTRAP 	
                                    216 	iret
                                    217 .endif 
                                    218 
                                    219 ;------------------------------
                                    220 ; TIMER 4 is used to maintain 
                                    221 ; a milliseconds 'ticks' counter
                                    222 ; and decrement 'timer' varaiable
                                    223 ;--------------------------------
      0080CF                        224 Timer4UpdateHandler:
      0080CF 72 5F 53 42      [ 1]  225 	clr TIM4_SR 
      0080D3 CE 00 0F         [ 2]  226 	ldw x,ticks
      0080D6 5C               [ 2]  227 	incw x
      0080D7 CF 00 0F         [ 2]  228 	ldw ticks,x 
      0080DA CE 00 11         [ 2]  229 	ldw x,timer
      0080DD 5D               [ 2]  230 	tnzw x 
      0080DE 27 04            [ 1]  231 	jreq 1$
      0080E0 5A               [ 2]  232 	decw x 
      0080E1 CF 00 11         [ 2]  233 	ldw timer,x 
      0080E4                        234 1$:	
      0080E4 80               [11]  235 	iret 
                                    236 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    237 
                                    238 ;------------------------------------
                                    239 ; Triggered by pressing USER UserButton 
                                    240 ; on NUCLEO card.
                                    241 ; This is used to abort a progam lock 
                                    242 ; in infinite loop. 
                                    243 ;------------------------------------
      0080E5                        244 UserButtonHandler:
                                    245 ; wait button release
      0080E5 5F               [ 1]  246 	clrw x
      0080E6 5A               [ 2]  247 1$: decw x 
      0080E7 26 FD            [ 1]  248 	jrne 1$
      0080E9 72 09 50 15 F8   [ 2]  249 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    250 ; if MCU suspended by SLEEP resume program
      0080EE 72 07 00 24 05   [ 2]  251     btjf flags,#FSLEEP,2$
      0080F3 72 17 00 24      [ 1]  252 	bres flags,#FSLEEP 
      0080F7 80               [11]  253 	iret
      0080F8                        254 2$:	
      0080F8                        255 user_interrupted:
      0080F8 72 00 00 24 02   [ 2]  256     btjt flags,#FRUN,4$
      0080FD 20 13            [ 2]  257 	jra UBTN_Handler_exit 
      0080FF                        258 4$:	; program interrupted by user 
      0080FF 72 11 00 24      [ 1]  259 	bres flags,#FRUN 
      008103 AE 81 1A         [ 2]  260 	ldw x,#USER_ABORT
      008106 CD A8 C0         [ 4]  261 	call puts 
      008109 CE 00 05         [ 2]  262 	ldw x,basicptr 
      00810C C6 00 02         [ 1]  263 	ld a,in 
      00810F CD 95 96         [ 4]  264 	call prt_basic_line
      008112                        265 UBTN_Handler_exit:
      008112 AE 17 FF         [ 2]  266     ldw x,#STACK_EMPTY 
      008115 94               [ 1]  267     ldw sp,x
      008116 9A               [ 1]  268 	rim 
      008117 CC 89 84         [ 2]  269 	jp warm_start
                                    270 
      00811A 0A 50 72 6F 67 72 61   271 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    272 
                                    273 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    274 ;    peripherals initialization
                                    275 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    276 
                                    277 ;----------------------------------------
                                    278 ; inialize MCU clock 
                                    279 ; input:
                                    280 ;   A 		source  HSI | 1 HSE 
                                    281 ;   XL      CLK_CKDIVR , clock divisor 
                                    282 ; output:
                                    283 ;   none 
                                    284 ;----------------------------------------
      008135                        285 clock_init:	
      008135 C1 50 C3         [ 1]  286 	cp a,CLK_CMSR 
      008138 27 0C            [ 1]  287 	jreq 2$ ; no switching required 
                                    288 ; select clock source 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      00813A 72 12 50 C5      [ 1]  289 	bset CLK_SWCR,#CLK_SWCR_SWEN
      00813E C7 50 C4         [ 1]  290 	ld CLK_SWR,a
      008141 C1 50 C3         [ 1]  291 1$:	cp a,CLK_CMSR
      008144 26 FB            [ 1]  292 	jrne 1$
      008146                        293 2$: 	
                                    294 ; HSI and cpu clock divisor 
      008146 9F               [ 1]  295 	ld a,xl 
      008147 C7 50 C6         [ 1]  296 	ld CLK_CKDIVR,a  
      00814A 81               [ 4]  297 	ret
                                    298 
                                    299 ;----------------------------------
                                    300 ; TIMER2 used as audio tone output 
                                    301 ; on port D:5.
                                    302 ; channel 1 configured as PWM mode 1 
                                    303 ;-----------------------------------  
                           00F424   304 TIM2_CLK_FREQ=62500
      00814B                        305 timer2_init:
      00814B 72 1A 50 C7      [ 1]  306 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      00814F 35 60 53 05      [ 1]  307  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008153 35 08 53 0C      [ 1]  308 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008157 81               [ 4]  309 	ret 
                                    310 
                                    311 ;---------------------------------
                                    312 ; TIM4 is configured to generate an 
                                    313 ; interrupt every millisecond 
                                    314 ;----------------------------------
      008158                        315 timer4_init:
      008158 72 18 50 C7      [ 1]  316 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00815C 35 07 53 45      [ 1]  317 	mov TIM4_PSCR,#7 ; prescale 128  
      008160 35 7D 53 46      [ 1]  318 	mov TIM4_ARR,#125 ; set for 1msec.
      008164 35 05 53 40      [ 1]  319 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008168 72 10 53 41      [ 1]  320 	bset TIM4_IER,#TIM4_IER_UIE
      00816C 81               [ 4]  321 	ret
                                    322 
                                    323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    324 ;  routines to write to FLASH, EEPROM 
                                    325 ;  and OPTION 
                                    326 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    327 
                                    328 ;----------------------------------
                                    329 ; unlock EEPROM/OPT for writing/erasing
                                    330 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    331 ; input:
                                    332 ;  none
                                    333 ; output:
                                    334 ;  none 
                                    335 ;----------------------------------
      00816D                        336 unlock_eeprom:
      00816D 35 00 50 5B      [ 1]  337 	mov FLASH_CR2,#0 
      008171 35 FF 50 5C      [ 1]  338 	mov FLASH_NCR2,#0xFF 
      008175 35 AE 50 64      [ 1]  339 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008179 35 56 50 64      [ 1]  340     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00817D 72 07 50 5F FB   [ 2]  341 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008182 81               [ 4]  342 	ret
                                    343 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    344 ;----------------------------------
                                    345 ; unlock FLASH for writing/erasing
                                    346 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    347 ; input:
                                    348 ;  none
                                    349 ; output:
                                    350 ;  none
                                    351 ;----------------------------------
      008183                        352 unlock_flash:
      008183 35 00 50 5B      [ 1]  353 	mov FLASH_CR2,#0 
      008187 35 FF 50 5C      [ 1]  354 	mov FLASH_NCR2,#0xFF 
      00818B 35 56 50 62      [ 1]  355 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00818F 35 AE 50 62      [ 1]  356 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008193 72 03 50 5F FB   [ 2]  357 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008198 81               [ 4]  358 	ret
                                    359 
                                    360 ;----------------------------
                                    361 ; erase block code must be 
                                    362 ; executed from RAM
                                    363 ; input:
                                    364 ;-----------------------------
      008199                        365 row_erase:
      008199 35 20 50 5B      [ 1]  366 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00819D 35 DF 50 5C      [ 1]  367 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      0081A1 4F               [ 1]  368 	clr a 
      0081A2 90 5F            [ 1]  369 	clrw y 
      0081A4 91 A7 00 17      [ 1]  370 	ldf ([farptr],y),a
      0081A8 90 5C            [ 2]  371     incw y
      0081AA 91 A7 00 17      [ 1]  372 	ldf ([farptr],y),a
      0081AE 90 5C            [ 2]  373     incw y
      0081B0 91 A7 00 17      [ 1]  374 	ldf ([farptr],y),a
      0081B4 90 5C            [ 2]  375     incw y
      0081B6 91 A7 00 17      [ 1]  376 	ldf ([farptr],y),a
      0081BA 72 05 50 5F FB   [ 2]  377 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081BF 81               [ 4]  378 	ret
      0081C0                        379 row_erase_end:
                                    380 
                                    381 ; copy erase_start in RAM 
      0081C0                        382 move_erase_to_ram:
      0081C0 AE 81 C0         [ 2]  383 	ldw x,#row_erase_end 
      0081C3 1D 81 99         [ 2]  384 	subw x,#row_erase
      0081C6 CF 00 0D         [ 2]  385 	ldw acc16,x 
      0081C9 AE 16 90         [ 2]  386 	ldw x,#tib 
      0081CC 90 AE 81 99      [ 2]  387 	ldw y,#row_erase 
      0081D0 CD 84 40         [ 4]  388 	call move 
      0081D3 81               [ 4]  389 	ret 
                                    390 
                                    391 ;-----------------------------------
                                    392 ; block programming must be 
                                    393 ; executed from RAM 
                                    394 ; initial contidions: 
                                    395 ; 	memory unlocked
                                    396 ;   bit PRG set in 
                                    397 ; input:
                                    398 ;   x        128 bytes row to program 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    399 ;   farptr   row address 
                                    400 ; output:
                                    401 ;   none 
                                    402 ;----------------------------------
                           000001   403 	BCNT=1 
      0081D4                        404 program_row:
      0081D4 4B 80            [ 1]  405 	push #BLOCK_SIZE  
                                    406 ;enable block programming 
      0081D6 72 10 50 5B      [ 1]  407 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0081DA 72 11 50 5C      [ 1]  408 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0081DE 90 5F            [ 1]  409 	clrw y 
      0081E0 F6               [ 1]  410 1$:	ld a,(x)
      0081E1 91 A7 00 17      [ 1]  411 	ldf ([farptr],y),a
      0081E5 5C               [ 2]  412 	incw x 
      0081E6 90 5C            [ 2]  413 	incw y 
      0081E8 0A 01            [ 1]  414 	dec (BCNT,sp)
      0081EA 26 F4            [ 1]  415 	jrne 1$
                                    416 ; wait EOP bit 
      0081EC 72 05 50 5F FB   [ 2]  417 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      000171                        418 	_drop 1 
      0081F1 5B 01            [ 2]    1     addw sp,#1 
      0081F3 81               [ 4]  419 	ret 
      0081F4                        420 program_row_end:
                                    421 
                                    422 ;-------------------------
                                    423 ; move program_row to RAM 
                                    424 ; at txtubound address 
                                    425 ;------------------------
      0081F4                        426 move_prg_to_ram:
      0081F4 AE 81 F4         [ 2]  427 	ldw x,#program_row_end 
      0081F7 1D 81 D4         [ 2]  428 	subw x,#program_row 
      0081FA CF 00 0D         [ 2]  429 	ldw acc16,x 
      0081FD AE 16 90         [ 2]  430 	ldw x,#tib 
      008200 90 AE 81 D4      [ 2]  431 	ldw y,#program_row 
      008204 CD 84 40         [ 4]  432 	call move 
      008207 81               [ 4]  433 	ret 
                                    434 
                                    435 
                                    436 ;-----------------------------
                                    437 ; write a row in FLASH/EEPROM 
                                    438 ; input:
                                    439 ;    farptr   destination address 
                                    440 ;    x        source address 
                                    441 ;-----------------------------
      008208                        442 write_row:
      008208 89               [ 2]  443 	pushw x 
      008209 72 5D 00 17      [ 1]  444 	tnz farptr 
      00820D 26 1C            [ 1]  445 	jrne to_flash 
      00820F AE 80 00         [ 2]  446 	ldw x,#FLASH_BASE 
      008212 C3 00 18         [ 2]  447 	cpw x,farptr+1 
      008215 24 14            [ 1]  448 	jruge to_flash 
      008217                        449 to_eeprom:
      008217 AE 40 00         [ 2]  450 	ldw x,#EEPROM_BASE 
      00821A C3 00 18         [ 2]  451 	cpw x,farptr+1 
      00821D 24 01            [ 1]  452 	jruge 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00821F 81               [ 4]  453 	ret ; bad address 
      008220 AE 47 FF         [ 2]  454 1$: ldw x,#EEPROM_END 
      008223 23 01            [ 2]  455 	jrule 2$ 
      008225 81               [ 4]  456 	ret ; bad address 
      008226 CD 81 6D         [ 4]  457 2$:	call unlock_eeprom
      008229 20 03            [ 2]  458 	jra do_programming
      00822B                        459 to_flash:
      00822B CD 81 83         [ 4]  460 	call unlock_flash 
      00822E                        461 do_programming:
      00822E 85               [ 2]  462 	popw x 
      00822F CD 16 90         [ 4]  463 	call tib
      008232 72 13 50 5F      [ 1]  464 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008236 72 17 50 5F      [ 1]  465 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      00823A 81               [ 4]  466 	ret 
                                    467 
                                    468 
                                    469 ;-----------------------------------
                                    470 ; erase flash or EEPROM block
                                    471 ; a blow is 128 bytes 
                                    472 ; input:
                                    473 ;   farptr  address row begin
                                    474 ; output:
                                    475 ;   none
                                    476 ;--------------------------------------
      00823B                        477 block_erase:
      00823B CE 00 18         [ 2]  478 	ldw x,farptr+1
      00823E A3 A8 80         [ 2]  479 	cpw x,#user_space 
      008241 2A 17            [ 1]  480 	jrpl erase_flash 
                                    481 ; erase eeprom block
      008243 A3 40 00         [ 2]  482 	cpw x,#EEPROM_BASE 
      008246 24 01            [ 1]  483 	jruge 1$
      008248 81               [ 4]  484 	ret ; bad address 
      008249 AE 47 FF         [ 2]  485 1$: ldw x,#EEPROM_END 
      00824C 23 01            [ 2]  486 	jrule 2$ 
      00824E 81               [ 4]  487 	ret ; bad address 
      00824F CD 81 6D         [ 4]  488 2$:	call unlock_eeprom 
      008252 CD 16 90         [ 4]  489 	call tib 
      008255 72 17 50 5F      [ 1]  490 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008259 81               [ 4]  491 	ret 
                                    492 ; erase flash block:
      00825A                        493 erase_flash:
      00825A CD 81 83         [ 4]  494 	call unlock_flash 
      00825D CD 16 90         [ 4]  495 	call tib 
      008260 72 13 50 5F      [ 1]  496     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008264 81               [ 4]  497 	ret 
                                    498 
                                    499 
                                    500 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    501 ; write a byte to FLASH or EEPROM/OPTION  
                                    502 ; input:
                                    503 ;    a  		byte to write
                                    504 ;    farptr  	address
                                    505 ;    x          farptr[x]
                                    506 ; output:
                                    507 ;    none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    508 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    509 	; variables locales
                           000001   510 	BTW = 1   ; byte to write offset on stack
                           000002   511 	OPT = 2   ; OPTION flag offset on stack
                           000002   512 	VSIZE = 2
      008265                        513 write_byte:
      008265 90 89            [ 2]  514 	pushw y
      0001E7                        515 	_vars VSIZE
      008267 52 02            [ 2]    1     sub sp,#VSIZE 
      008269 6B 01            [ 1]  516 	ld (BTW,sp),a ; byte to write 
      00826B 0F 02            [ 1]  517 	clr (OPT,sp)  ; OPTION flag
                                    518 ; put addr[15:0] in Y, for bounds check.
      00826D 90 CE 00 18      [ 2]  519 	ldw y,farptr+1   ; Y=addr15:0
                                    520 ; check addr[23:16], if <> 0 then it is extened flash memory
      008271 72 5D 00 17      [ 1]  521 	tnz farptr 
      008275 26 14            [ 1]  522 	jrne write_flash
      008277 90 A3 A8 80      [ 2]  523     cpw y,#user_space
      00827B 24 0E            [ 1]  524     jruge write_flash
      00827D 90 A3 40 00      [ 2]  525 	cpw y,#EEPROM_BASE  
      008281 25 52            [ 1]  526     jrult write_exit
      008283 90 A3 48 7F      [ 2]  527 	cpw y,#OPTION_END 
      008287 22 4C            [ 1]  528 	jrugt write_exit
      008289 20 16            [ 2]  529 	jra write_eeprom 
                                    530 ; write program memory
      00828B                        531 write_flash:
      00828B CD 81 83         [ 4]  532 	call unlock_flash 
      00828E 9B               [ 1]  533 1$:	sim 
      00828F 7B 01            [ 1]  534 	ld a,(BTW,sp)
      008291 92 A7 00 17      [ 4]  535 	ldf ([farptr],x),a ; farptr[x]=A
      008295 72 05 50 5F FB   [ 2]  536 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00829A 9A               [ 1]  537     rim 
      00829B 72 13 50 5F      [ 1]  538     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00829F 20 34            [ 2]  539     jra write_exit
                                    540 ; write eeprom and option
      0082A1                        541 write_eeprom:
      0082A1 CD 81 6D         [ 4]  542 	call unlock_eeprom
                                    543 	; check for data eeprom or option eeprom
      0082A4 90 A3 48 00      [ 2]  544 	cpw y,#OPTION_BASE
      0082A8 2B 08            [ 1]  545 	jrmi 1$
      0082AA 90 A3 48 80      [ 2]  546 	cpw y,#OPTION_END+1
      0082AE 2A 02            [ 1]  547 	jrpl 1$
      0082B0 03 02            [ 1]  548 	cpl (OPT,sp)
      0082B2                        549 1$: 
      0082B2 0D 02            [ 1]  550     tnz (OPT,sp)
      0082B4 27 08            [ 1]  551     jreq 2$
                                    552 	; pour modifier une option il faut modifier ces 2 bits
      0082B6 72 1E 50 5B      [ 1]  553     bset FLASH_CR2,#FLASH_CR2_OPT
      0082BA 72 1F 50 5C      [ 1]  554     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0082BE                        555 2$: 
      0082BE 7B 01            [ 1]  556     ld a,(BTW,sp)
      0082C0 92 A7 00 17      [ 4]  557     ldf ([farptr],x),a
      0082C4 0D 02            [ 1]  558     tnz (OPT,sp)
      0082C6 27 08            [ 1]  559     jreq 3$
      0082C8 5C               [ 2]  560     incw x
      0082C9 7B 01            [ 1]  561     ld a,(BTW,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0082CB 43               [ 1]  562     cpl a
      0082CC 92 A7 00 17      [ 4]  563     ldf ([farptr],x),a
      0082D0 72 05 50 5F FB   [ 2]  564 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082D5                        565 write_exit:
      000255                        566 	_drop VSIZE 
      0082D5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082D7 90 85            [ 2]  567 	popw y
      0082D9 81               [ 4]  568     ret
                                    569 
                                    570 ;--------------------------------------------
                                    571 ; write a data block to eeprom or flash 
                                    572 ; input:
                                    573 ;   Y        source address   
                                    574 ;   X        array index  destination  farptr[x]
                                    575 ;   BSIZE    block size bytes 
                                    576 ;   farptr   write address , byte* 
                                    577 ; output:
                                    578 ;	X 		after last byte written 
                                    579 ;   Y 		after last byte read 
                                    580 ;  farptr   point after block
                                    581 ;---------------------------------------------
      0082DA                        582 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      00025A                        583 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    584 	; local var 
                           000001   585 	XSAVE=1 
                           000002   586 	VSIZE=2 
      00025A                        587 write_block:
      00025A                        588 	_vars VSIZE
      0082DA 52 02            [ 2]    1     sub sp,#VSIZE 
      0082DC 1F 01            [ 2]  589 	ldw (XSAVE,sp),x 
      0082DE 1E 05            [ 2]  590 	ldw x,(BSIZE,sp) 
      0082E0 27 13            [ 1]  591 	jreq 9$
      0082E2 1E 01            [ 2]  592 1$:	ldw x,(XSAVE,sp)
      0082E4 90 F6            [ 1]  593 	ld a,(y)
      0082E6 CD 82 65         [ 4]  594 	call write_byte 
      0082E9 5C               [ 2]  595 	incw x 
      0082EA 90 5C            [ 2]  596 	incw y 
      0082EC 1F 01            [ 2]  597 	ldw (XSAVE,sp),x
      0082EE 1E 05            [ 2]  598 	ldw x,(BSIZE,sp)
      0082F0 5A               [ 2]  599 	decw x
      0082F1 1F 05            [ 2]  600 	ldw (BSIZE,sp),x 
      0082F3 26 ED            [ 1]  601 	jrne 1$
      0082F5                        602 9$:
      0082F5 1E 01            [ 2]  603 	ldw x,(XSAVE,sp)
      0082F7 CD 9A 9C         [ 4]  604 	call incr_farptr
      00027A                        605 	_drop VSIZE
      0082FA 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082FC 81               [ 4]  606 	ret 
                                    607 
                                    608 
                                    609 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    610 ;;   UART1 subroutines
                                    611 ;;   used for user interface 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    612 ;;   communication channel.
                                    613 ;;   settings: 
                                    614 ;;		115200 8N1 no flow control
                                    615 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    616 
                                    617 ;---------------------------------------------
                                    618 ; initialize UART1, 115200 8N1
                                    619 ; input:
                                    620 ;	none
                                    621 ; output:
                                    622 ;   none
                                    623 ;---------------------------------------------
      0082FD                        624 uart1_init:
      0082FD 72 1A 50 02      [ 1]  625     bset PA_DDR,#UART1_TX_PIN
      008301 72 1A 50 03      [ 1]  626     bset PA_CR1,#UART1_TX_PIN 
      008305 72 1A 50 04      [ 1]  627     bset PA_CR2,#UART1_TX_PIN 
                                    628 ; enable UART1 clock
      008309 72 14 50 C7      [ 1]  629 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      00830D                        630 uart1_set_baud: 
                                    631 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    632 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      00830D A6 E1            [ 1]  633 	ld a,#CLK_SWR_HSI
      00830F C1 50 C3         [ 1]  634 	cp a,CLK_CMSR 
      008312 27 0A            [ 1]  635 	jreq 2$ 
      008314                        636 1$: ; 8 Mhz 	
      008314 35 05 52 33      [ 1]  637 	mov UART1_BRR2,#0x05 ; must be loaded first
      008318 35 04 52 32      [ 1]  638 	mov UART1_BRR1,#0x4
      00831C 20 08            [ 2]  639 	jra 3$
      00831E                        640 2$: ; 16 Mhz 	
      00831E 35 0B 52 33      [ 1]  641 	mov UART1_BRR2,#0x0b ; must be loaded first
      008322 35 08 52 32      [ 1]  642 	mov UART1_BRR1,#0x08
      008326                        643 3$:
      008326 72 5F 52 31      [ 1]  644     clr UART1_DR
      00832A 35 2C 52 35      [ 1]  645 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00832E 72 10 52 35      [ 1]  646 	bset UART1_CR2,#UART_CR2_SBK
      008332 72 0D 52 30 FB   [ 2]  647     btjf UART1_SR,#UART_SR_TC,.
      008337 72 5F 00 2E      [ 1]  648     clr rx_head 
      00833B 72 5F 00 2F      [ 1]  649 	clr rx_tail 
      00833F 81               [ 4]  650 	ret
                                    651 
                                    652 ;---------------------------------
                                    653 ; send character to UART1 
                                    654 ; input:
                                    655 ;   A 
                                    656 ; output:
                                    657 ;   none 
                                    658 ;--------------------------------	
      008340                        659 putc::
      008340 72 0F 52 30 FB   [ 2]  660 	btjf UART1_SR,#UART_SR_TXE,.
      008345 C7 52 31         [ 1]  661 	ld UART1_DR,a 
      008348 81               [ 4]  662 	ret 
                                    663 
                                    664 ;---------------------------------
                                    665 ; wait character from UART1 
                                    666 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    667 ;   none
                                    668 ; output:
                                    669 ;   A 			char  
                                    670 ;--------------------------------	
      008349                        671 getc::
      008349 C6 00 2E         [ 1]  672 	ld a,rx_head 
      00834C C1 00 2F         [ 1]  673 1$:	cp a,rx_tail 
      00834F 27 FB            [ 1]  674 	jreq 1$
      008351 89               [ 2]  675 	pushw x 
      008352 AE 00 26         [ 2]  676 	ldw x,#rx_queue
      008355 9F               [ 1]  677 	ld a,xl 
      008356 CB 00 2E         [ 1]  678 	add a,rx_head 
      008359 97               [ 1]  679 	ld xl,a 
      00835A F6               [ 1]  680 	ld a,(x)
      00835B 85               [ 2]  681 	popw x
      00835C 88               [ 1]  682 	push a
      00835D 72 5C 00 2E      [ 1]  683 	inc rx_head 
      008361 A6 07            [ 1]  684 	ld a,#RX_QUEUE_SIZE-1 
      008363 C4 00 2E         [ 1]  685 	and a,rx_head 
      008366 C7 00 2E         [ 1]  686 	ld rx_head,a 
      008369 84               [ 1]  687 	pop a  
      00836A 81               [ 4]  688 	ret 
                                    689 
                                    690 ;----------------------
                                    691 ; print token id && value
                                    692 ; input:
                                    693 ;   A     token id 
                                    694 ;   X     token value 
                                    695 ;---------------------
                           000001   696 	BSAVE=1
                           000002   697 	AREG=2
                           000003   698 	XREG=3
                           000004   699 	VSIZE=4
      00836B                        700 prt_tok:
      0002EB                        701 	_vars VSIZE 
      00836B 52 04            [ 2]    1     sub sp,#VSIZE 
      00836D 6B 02            [ 1]  702 	ld (AREG,sp),a 
      00836F 1F 03            [ 2]  703 	ldw (XREG,sp),x 
      008371 C6 00 0B         [ 1]  704 	ld a, base
      008374 6B 01            [ 1]  705 	ld (BSAVE,sp),a 
      008376 35 10 00 0B      [ 1]  706 	mov base,#16  
      00837A AE 83 A2         [ 2]  707 	ldw x,#token_msg
      00837D CD A8 C0         [ 4]  708 	call puts 
      008380 5F               [ 1]  709 	clrw x 
      008381 7B 02            [ 1]  710 	ld a,(AREG,sp)
      008383 97               [ 1]  711 	ld xl,a 
      008384 CD 8A 50         [ 4]  712 	call print_int 
      008387 A6 20            [ 1]  713 	ld a,#SPACE
      008389 CD 83 40         [ 4]  714 	call putc 
      00838C 1E 03            [ 2]  715 	ldw x,(XREG,sp)
      00838E CD 8A 50         [ 4]  716 	call print_int 
      008391 A6 0D            [ 1]  717 	ld a,#CR 
      008393 CD 83 40         [ 4]  718 	call putc 
      008396 7B 01            [ 1]  719 	ld a,(BSAVE,sp)
      008398 C7 00 0B         [ 1]  720 	ld base,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00839B 7B 02            [ 1]  721 	ld a,(AREG,sp)
      00839D 1E 03            [ 2]  722 	ldw x,(XREG,sp)
      00031F                        723 	_drop VSIZE 
      00839F 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083A1 81               [ 4]  724 	ret 
      0083A2 74 6F 6B 65 6E 3A 20   725 token_msg: .asciz "token: "
             00
                                    726 
                                    727 
                                    728 ;---------------------
                                    729 ; display n bytes row 
                                    730 ; from memory.
                                    731 ; input:
                                    732 ;   A   bytes to print 
                                    733 ;	X   start address 
                                    734 ; output:
                                    735 ;   X   address after last shown  
                                    736 ;---------------------
                           000001   737 	CNT=1 
                           000002   738 	ADR=2 
                           000003   739 	VSIZE=3 
      0083AA                        740 show_row:
      0083AA 4D               [ 1]  741 	tnz a 
      0083AB 26 01            [ 1]  742 	jrne 1$
      0083AD 81               [ 4]  743 	ret 
      0083AE                        744 1$:	
      0083AE 89               [ 2]  745 	pushw x  
      0083AF 88               [ 1]  746 	push a 
      0083B0 35 04 00 25      [ 1]  747 	mov tab_width,#4 
      0083B4 CD 8A 50         [ 4]  748 	call print_int 
      0083B7 A6 20            [ 1]  749 	ld a,#SPACE  
      0083B9 CD 83 40         [ 4]  750 	call putc
      0083BC                        751 row_loop:
      0083BC 1E 02            [ 2]  752 	ldw x,(ADR,sp)
      0083BE F6               [ 1]  753 	ld a,(x)
      0083BF 5F               [ 1]  754 	clrw x 
      0083C0 97               [ 1]  755 	ld xl,a 
      0083C1 CD 8A 50         [ 4]  756 	call print_int 
      0083C4 1E 02            [ 2]  757 	ldw x,(ADR,sp)
      0083C6 5C               [ 2]  758 	incw x 
      0083C7 1F 02            [ 2]  759 	ldw (ADR,sp),x 
      0083C9 0A 01            [ 1]  760 	dec (CNT,sp)
      0083CB 26 EF            [ 1]  761 	jrne row_loop
      00034D                        762 	_drop VSIZE  		
      0083CD 5B 03            [ 2]    1     addw sp,#VSIZE 
      0083CF 35 04 00 25      [ 1]  763 	mov tab_width,#4
      0083D3 A6 0D            [ 1]  764 	ld a,#CR 
      0083D5 CD 83 40         [ 4]  765 	call putc 
      0083D8 81               [ 4]  766 	ret 
                                    767 
                                    768 ;--------------------------
                                    769 ; print memory content 
                                    770 ; in hexadecimal format
                                    771 ;  input:
                                    772 ;    X    start address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                                    773 ;    Y    count 
                                    774 ;--------------------------
                           000001   775 	BCNT=1
                           000003   776 	BASE=3
                           000004   777 	TABW=4
                           000004   778 	VSIZE=4   
      0083D9                        779 hex_dump:
      000359                        780 	_vars VSIZE
      0083D9 52 04            [ 2]    1     sub sp,#VSIZE 
      0083DB C6 00 0B         [ 1]  781 	ld a,base
      0083DE 6B 03            [ 1]  782 	ld (BASE,sp),a 
      0083E0 35 10 00 0B      [ 1]  783 	mov base,#16
      0083E4 C6 00 25         [ 1]  784 	ld a,tab_width 
      0083E7 6B 04            [ 1]  785 	ld (TABW,sp),a
      0083E9 A6 0D            [ 1]  786 	ld a,#CR 
      0083EB CD 83 40         [ 4]  787 	call putc 
      0083EE 17 01            [ 2]  788 1$: ldw (BCNT,sp),y
      0083F0 A6 10            [ 1]  789 	ld a,#16
      0083F2 90 A3 00 10      [ 2]  790 	cpw y,#16
      0083F6 2A 02            [ 1]  791 	jrpl 2$
      0083F8 90 9F            [ 1]  792 	ld a,yl
      0083FA                        793 2$: 	
      0083FA CD 83 AA         [ 4]  794 	call show_row 
      0083FD 16 01            [ 2]  795 	ldw y,(BCNT,sp) 
      0083FF 72 A2 00 10      [ 2]  796 	subw y,#16 
      008403 90 A3 00 01      [ 2]  797 	cpw y,#1
      008407 2A E5            [ 1]  798 	jrpl 1$
      008409 7B 03            [ 1]  799 	ld a,(BASE,sp)
      00840B C7 00 0B         [ 1]  800 	ld base,a
      00840E 7B 04            [ 1]  801 	ld a,(TABW,sp)
      008410 C7 00 25         [ 1]  802 	ld tab_width,a 
      000393                        803 	_drop VSIZE
      008413 5B 04            [ 2]    1     addw sp,#VSIZE 
      008415 81               [ 4]  804 	ret 
                                    805 
                                    806 ;-------------------------------------
                                    807 ; retrun string length
                                    808 ; input:
                                    809 ;   X         .asciz  pointer 
                                    810 ; output:
                                    811 ;   X         not affected 
                                    812 ;   A         length 
                                    813 ;-------------------------------------
      008416                        814 strlen::
      008416 89               [ 2]  815 	pushw x 
      008417 4F               [ 1]  816 	clr a
      008418 7D               [ 1]  817 1$:	tnz (x) 
      008419 27 04            [ 1]  818 	jreq 9$ 
      00841B 4C               [ 1]  819 	inc a 
      00841C 5C               [ 2]  820 	incw x 
      00841D 20 F9            [ 2]  821 	jra 1$ 
      00841F 85               [ 2]  822 9$:	popw x 
      008420 81               [ 4]  823 	ret 
                                    824 
                                    825 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    826 ; compare 2 strings
                                    827 ; input:
                                    828 ;   X 		char* first string 
                                    829 ;   Y       char* second string 
                                    830 ; output:
                                    831 ;   A 		0|1 
                                    832 ;-------------------------------------
      008421                        833 strcmp:
      008421 F6               [ 1]  834 	ld a,(x)
      008422 27 0B            [ 1]  835 	jreq 5$ 
      008424 90 F1            [ 1]  836 	cp a,(y) 
      008426 26 05            [ 1]  837 	jrne 4$ 
      008428 5C               [ 2]  838 	incw x 
      008429 90 5C            [ 2]  839 	incw y 
      00842B 20 F4            [ 2]  840 	jra strcmp 
      00842D                        841 4$: ; not same  
      00842D 4F               [ 1]  842 	clr a 
      00842E 81               [ 4]  843 	ret 
      00842F                        844 5$: ; same 
      00842F A6 01            [ 1]  845 	ld a,#1 
      008431 81               [ 4]  846 	ret 
                                    847 
                                    848 
                                    849 ;---------------------------------------
                                    850 ;  copy src to dest 
                                    851 ; input:
                                    852 ;   X 		dest 
                                    853 ;   Y 		src 
                                    854 ; output: 
                                    855 ;   X 		dest 
                                    856 ;----------------------------------
      008432                        857 strcpy:
      008432 89               [ 2]  858 	pushw x 
      008433 90 F6            [ 1]  859 1$: ld a,(y)
      008435 27 06            [ 1]  860 	jreq 9$ 
      008437 F7               [ 1]  861 	ld (x),a 
      008438 5C               [ 2]  862 	incw x 
      008439 90 5C            [ 2]  863 	incw y 
      00843B 20 F6            [ 2]  864 	jra 1$ 
      00843D 7F               [ 1]  865 9$:	clr (x)
      00843E 85               [ 2]  866 	popw x 
      00843F 81               [ 4]  867 	ret 
                                    868 
                                    869 ;---------------------------------------
                                    870 ; move memory block 
                                    871 ; input:
                                    872 ;   X 		destination 
                                    873 ;   Y 	    source 
                                    874 ;   acc16	bytes count 
                                    875 ; output:
                                    876 ;   none 
                                    877 ;--------------------------------------
                           000001   878 	INCR=1 ; increament high byte 
                           000002   879 	LB=2 ; increament low byte 
                           000002   880 	VSIZE=2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008440                        881 move::
      0003C0                        882 	_vars VSIZE 
      008440 52 02            [ 2]    1     sub sp,#VSIZE 
      008442 0F 01            [ 1]  883 	clr (INCR,sp)
      008444 0F 02            [ 1]  884 	clr (LB,sp)
      008446 90 89            [ 2]  885 	pushw y 
      008448 13 01            [ 2]  886 	cpw x,(1,sp) ; compare DEST to SRC 
      00844A 90 85            [ 2]  887 	popw y 
      00844C 27 31            [ 1]  888 	jreq move_exit ; x==y 
      00844E 2B 0E            [ 1]  889 	jrmi move_down
      008450                        890 move_up: ; start from top address with incr=-1
      008450 72 BB 00 0D      [ 2]  891 	addw x,acc16
      008454 72 B9 00 0D      [ 2]  892 	addw y,acc16
      008458 03 01            [ 1]  893 	cpl (INCR,sp)
      00845A 03 02            [ 1]  894 	cpl (LB,sp)   ; increment = -1 
      00845C 20 05            [ 2]  895 	jra move_loop  
      00845E                        896 move_down: ; start from bottom address with incr=1 
      00845E 5A               [ 2]  897     decw x 
      00845F 90 5A            [ 2]  898 	decw y
      008461 0C 02            [ 1]  899 	inc (LB,sp) ; incr=1 
      008463                        900 move_loop:	
      008463 C6 00 0D         [ 1]  901     ld a, acc16 
      008466 CA 00 0E         [ 1]  902 	or a, acc8
      008469 27 14            [ 1]  903 	jreq move_exit 
      00846B 72 FB 01         [ 2]  904 	addw x,(INCR,sp)
      00846E 72 F9 01         [ 2]  905 	addw y,(INCR,sp) 
      008471 90 F6            [ 1]  906 	ld a,(y)
      008473 F7               [ 1]  907 	ld (x),a 
      008474 89               [ 2]  908 	pushw x 
      008475 CE 00 0D         [ 2]  909 	ldw x,acc16 
      008478 5A               [ 2]  910 	decw x 
      008479 CF 00 0D         [ 2]  911 	ldw acc16,x 
      00847C 85               [ 2]  912 	popw x 
      00847D 20 E4            [ 2]  913 	jra move_loop
      00847F                        914 move_exit:
      0003FF                        915 	_drop VSIZE
      00847F 5B 02            [ 2]    1     addw sp,#VSIZE 
      008481 81               [ 4]  916 	ret 	
                                    917 
                                    918 ;-------------------------------------
                                    919 ; search text area for a line#
                                    920 ; input:
                                    921 ;	X 			line# 
                                    922 ; output:
                                    923 ;   X 			addr of line | 0 
                                    924 ;   Y           line#|insert address if not found  
                                    925 ;-------------------------------------
                           000001   926 	LL=1 ; line length 
                           000002   927 	LB=2 ; line length low byte 
                           000002   928 	VSIZE=2 
      008482                        929 search_lineno::
      000402                        930 	_vars VSIZE
      008482 52 02            [ 2]    1     sub sp,#VSIZE 
      008484 0F 01            [ 1]  931 	clr (LL,sp)
      008486 90 CE 00 1D      [ 2]  932 	ldw y,txtbgn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      00848A                        933 search_ln_loop:
      00848A 90 C3 00 1F      [ 2]  934 	cpw y,txtend 
      00848E 2A 10            [ 1]  935 	jrpl 8$
      008490 90 F3            [ 1]  936 	cpw x,(y)
      008492 27 0E            [ 1]  937 	jreq 9$
      008494 2B 0A            [ 1]  938 	jrmi 8$ 
      008496 90 E6 02         [ 1]  939 	ld a,(2,y)
      008499 6B 02            [ 1]  940 	ld (LB,sp),a 
      00849B 72 F9 01         [ 2]  941 	addw y,(LL,sp)
      00849E 20 EA            [ 2]  942 	jra search_ln_loop 
      0084A0                        943 8$: 
      0084A0 5F               [ 1]  944 	clrw x 	
      0084A1 51               [ 1]  945 	exgw x,y 
      000422                        946 9$: _drop VSIZE
      0084A2 5B 02            [ 2]    1     addw sp,#VSIZE 
      0084A4 51               [ 1]  947 	exgw x,y   
      0084A5 81               [ 4]  948 	ret 
                                    949 
                                    950 ;-------------------------------------
                                    951 ; delete line at addr
                                    952 ; input:
                                    953 ;   X 		addr of line i.e DEST for move 
                                    954 ;-------------------------------------
                           000001   955 	LLEN=1
                           000003   956 	SRC=3
                           000004   957 	VSIZE=4
      0084A6                        958 del_line: 
      000426                        959 	_vars VSIZE 
      0084A6 52 04            [ 2]    1     sub sp,#VSIZE 
      0084A8 E6 02            [ 1]  960 	ld a,(2,x) ; line length
      0084AA 6B 02            [ 1]  961 	ld (LLEN+1,sp),a 
      0084AC 0F 01            [ 1]  962 	clr (LLEN,sp)
      0084AE 90 93            [ 1]  963 	ldw y,x  
      0084B0 72 F9 01         [ 2]  964 	addw y,(LLEN,sp) ;SRC  
      0084B3 17 03            [ 2]  965 	ldw (SRC,sp),y  ;save source 
      0084B5 90 CE 00 1F      [ 2]  966 	ldw y,txtend 
      0084B9 72 F2 03         [ 2]  967 	subw y,(SRC,sp) ; y=count 
      0084BC 90 CF 00 0D      [ 2]  968 	ldw acc16,y 
      0084C0 16 03            [ 2]  969 	ldw y,(SRC,sp)    ; source
      0084C2 CD 84 40         [ 4]  970 	call move
      0084C5 90 CE 00 1F      [ 2]  971 	ldw y,txtend 
      0084C9 72 F2 01         [ 2]  972 	subw y,(LLEN,sp)
      0084CC 90 CF 00 1F      [ 2]  973 	ldw txtend,y  
      000450                        974 	_drop VSIZE     
      0084D0 5B 04            [ 2]    1     addw sp,#VSIZE 
      0084D2 81               [ 4]  975 	ret 
                                    976 
                                    977 ;---------------------------------------------
                                    978 ; create a gap in text area to 
                                    979 ; move new line in this gap
                                    980 ; input:
                                    981 ;    X 			addr gap start 
                                    982 ;    Y 			gap length 
                                    983 ; output:
                                    984 ;    X 			addr gap start 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    985 ;--------------------------------------------
                           000001   986 	DEST=1
                           000003   987 	SRC=3
                           000005   988 	LEN=5
                           000006   989 	VSIZE=6 
      0084D3                        990 create_gap:
      000453                        991 	_vars VSIZE
      0084D3 52 06            [ 2]    1     sub sp,#VSIZE 
      0084D5 1F 03            [ 2]  992 	ldw (SRC,sp),x 
      0084D7 17 05            [ 2]  993 	ldw (LEN,sp),y 
      0084D9 90 CF 00 0D      [ 2]  994 	ldw acc16,y 
      0084DD 90 93            [ 1]  995 	ldw y,x ; SRC
      0084DF 72 BB 00 0D      [ 2]  996 	addw x,acc16  
      0084E3 1F 01            [ 2]  997 	ldw (DEST,sp),x 
                                    998 ;compute size to move 	
      0084E5 CE 00 1F         [ 2]  999 	ldw x,txtend 
      0084E8 72 F0 03         [ 2] 1000 	subw x,(SRC,sp)
      0084EB CF 00 0D         [ 2] 1001 	ldw acc16,x ; size to move
      0084EE 1E 01            [ 2] 1002 	ldw x,(DEST,sp) 
      0084F0 CD 84 40         [ 4] 1003 	call move
      0084F3 CE 00 1F         [ 2] 1004 	ldw x,txtend
      0084F6 72 FB 05         [ 2] 1005 	addw x,(LEN,sp)
      0084F9 CF 00 1F         [ 2] 1006 	ldw txtend,x
      00047C                       1007 9$:	_drop VSIZE 
      0084FC 5B 06            [ 2]    1     addw sp,#VSIZE 
      0084FE 81               [ 4] 1008 	ret 
                                   1009 
                                   1010 ;--------------------------------------------
                                   1011 ; insert line in pad into text area 
                                   1012 ; first search for already existing 
                                   1013 ; replace existing 
                                   1014 ; if new line empty delete existing one. 
                                   1015 ; input:
                                   1016 ;   ptr16		pointer to tokenized line  
                                   1017 ; output:
                                   1018 ;   none
                                   1019 ;---------------------------------------------
                           000001  1020 	DEST=1  ; text area insertion address 
                           000003  1021 	SRC=3   ; str to insert address 
                           000005  1022 	LINENO=5 ; line number 
                           000007  1023 	LLEN=7 ; line length 
                           000008  1024 	VSIZE=8  
      0084FF                       1025 insert_line:
      00047F                       1026 	_vars VSIZE 
      0084FF 52 08            [ 2]    1     sub sp,#VSIZE 
      008501 CE 00 1F         [ 2] 1027 	ldw x,txtend  
      008504 C3 00 1D         [ 2] 1028 	cpw x,txtbgn 
      008507 26 19            [ 1] 1029 	jrne 0$
                                   1030 ;first text line 
      008509 AE 00 02         [ 2] 1031 	ldw x,#2 
      00850C 72 D6 00 18      [ 4] 1032 	ld a,([ptr16],x)
      008510 A1 03            [ 1] 1033 	cp a,#3
      008512 27 59            [ 1] 1034 	jreq insert_ln_exit
      008514 5F               [ 1] 1035 	clrw x 
      008515 97               [ 1] 1036 	ld xl,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008516 1F 07            [ 2] 1037 	ldw (LLEN,sp),x 
      008518 CE 00 1D         [ 2] 1038 	ldw x,txtbgn
      00851B 1F 01            [ 2] 1039 	ldw (DEST,sp),x 
      00851D CE 00 1F         [ 2] 1040 	ldw x,txtend 
      008520 20 37            [ 2] 1041 	jra 4$
      008522 72 CE 00 18      [ 5] 1042 0$:	ldw x,[ptr16]
                                   1043 ; line number
      008526 1F 05            [ 2] 1044 	ldw (LINENO,sp),x 
      008528 AE 00 02         [ 2] 1045 	ldw x,#2 
      00852B 72 D6 00 18      [ 4] 1046 	ld a,([ptr16],x)
      00852F 97               [ 1] 1047 	ld xl,a
                                   1048 ; line length
      008530 1F 07            [ 2] 1049 	ldw (LLEN,sp),x
                                   1050 ; check if that line number already exit 	
      008532 1E 05            [ 2] 1051 	ldw x,(LINENO,sp)
      008534 CD 84 82         [ 4] 1052 	call search_lineno 
      008537 5D               [ 2] 1053 	tnzw x 
      008538 26 04            [ 1] 1054 	jrne 2$
                                   1055 ; line doesn't exit
                                   1056 ; it will be inserted at this point.  	
      00853A 17 01            [ 2] 1057 	ldw (DEST,sp),y 
      00853C 20 05            [ 2] 1058 	jra 3$
                                   1059 ; line exit delete it.
                                   1060 ; it will be replaced by new one 	
      00853E 1F 01            [ 2] 1061 2$: ldw (DEST,sp),x 
      008540 CD 84 A6         [ 4] 1062 	call del_line
      008543                       1063 3$: 
                                   1064 ; insert new line or leave if LLEN==3
                                   1065 ; LLEN==3 means empty line 
      008543 A6 03            [ 1] 1066 	ld a,#3
      008545 11 08            [ 1] 1067 	cp a,(LLEN+1,sp)
      008547 27 24            [ 1] 1068 	jreq insert_ln_exit ; empty line exit.
                                   1069 ; if insertion point at txtend 
                                   1070 ; move no need to create a gap 
      008549 1E 01            [ 2] 1071 	ldw x,(DEST,sp)
      00854B C3 00 1F         [ 2] 1072 	cpw x,txtend 
      00854E 27 09            [ 1] 1073 	jreq 4$ 
                                   1074 ; must create a gap
                                   1075 ; at insertion point  
      008550 1E 01            [ 2] 1076 	ldw x,(DEST,sp)
      008552 16 07            [ 2] 1077 	ldw y,(LLEN,sp)
      008554 CD 84 D3         [ 4] 1078 	call create_gap
      008557 20 06            [ 2] 1079 	jra 5$
      008559                       1080 4$: 
      008559 72 FB 07         [ 2] 1081 	addw x,(LLEN,sp)
      00855C CF 00 1F         [ 2] 1082 	ldw txtend,x 	 
                                   1083 ; move new line in gap 
      00855F 1E 07            [ 2] 1084 5$:	ldw x,(LLEN,sp)
      008561 CF 00 0D         [ 2] 1085 	ldw acc16,x 
      008564 90 AE 16 E0      [ 2] 1086 	ldw y,#pad ;SRC 
      008568 1E 01            [ 2] 1087 	ldw x,(DEST,sp) ; dest address 
      00856A CD 84 40         [ 4] 1088 	call move 
      00856D                       1089 insert_ln_exit:	
      0004ED                       1090 	_drop VSIZE
      00856D 5B 08            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00856F 81               [ 4] 1091 	ret
                                   1092 
                                   1093 ;-----------------------------------
                                   1094 ; create token list fromm text line 
                                   1095 ; save this list in pad buffer 
                                   1096 ;  compiled line format: 
                                   1097 ;    line_no  2 bytes {0...32767}
                                   1098 ;    count    1 byte  
                                   1099 ;    tokens   variable length 
                                   1100 ;   
                                   1101 ; input:
                                   1102 ;   none
                                   1103 ; modified variables:
                                   1104 ;   basicptr     token list buffer address 
                                   1105 ;   in.w  		 3|count, i.e. index in buffer
                                   1106 ;   count        length of line | 0  
                                   1107 ;-----------------------------------
                           000001  1108 	XSAVE=1
                           000002  1109 	VSIZE=2
      008570                       1110 compile:
      0004F0                       1111 	_vars VSIZE 
      008570 52 02            [ 2]    1     sub sp,#VSIZE 
      008572 72 1A 00 24      [ 1] 1112 	bset flags,#FCOMP 
      008576 A6 00            [ 1] 1113 	ld a,#0
      008578 AE 00 00         [ 2] 1114 	ldw x,#0
      00857B CF 16 E0         [ 2] 1115 	ldw pad,x ; destination buffer 
      00857E C7 16 E2         [ 1] 1116 	ld pad+2,a ; count 
      008581 AE 16 E3         [ 2] 1117 	ldw x,#pad+3
      008584 72 5F 00 02      [ 1] 1118 	clr in 
      008588 CD 8C 74         [ 4] 1119 	call get_token
      00858B A1 84            [ 1] 1120 	cp a,#TK_INTGR
      00858D 26 11            [ 1] 1121 	jrne 2$
      00858F A3 00 01         [ 2] 1122 	cpw x,#1 
      008592 2A 05            [ 1] 1123 	jrpl 1$
      008594 A6 0A            [ 1] 1124 	ld a,#ERR_BAD_VALUE
      008596 CC 88 FF         [ 2] 1125 	jp tb_error
      008599 CF 16 E0         [ 2] 1126 1$:	ldw pad,x 
      00859C 90 AE 16 E3      [ 2] 1127 	ldw y,#pad+3 
      0085A0 90 A3 17 60      [ 2] 1128 2$:	cpw y,#stack_full 
      0085A4 25 05            [ 1] 1129 	jrult 3$
      0085A6 A6 0F            [ 1] 1130 	ld a,#ERR_BUF_FULL 
      0085A8 CC 88 FF         [ 2] 1131 	jp tb_error 
      0085AB                       1132 3$:	
      0085AB 93               [ 1] 1133 	ldw x,y 
      0085AC CD 8C 74         [ 4] 1134 	call get_token 
      0085AF A1 00            [ 1] 1135 	cp a,#TK_NONE 
      0085B1 26 ED            [ 1] 1136 	jrne 2$ 
                                   1137 ; compilation completed  
      0085B3 72 A2 16 E0      [ 2] 1138 	subw y,#pad
      0085B7 90 9F            [ 1] 1139     ld a,yl
      0085B9 AE 16 E0         [ 2] 1140 	ldw x,#pad 
      0085BC CF 00 18         [ 2] 1141 	ldw ptr16,x 
      0085BF E7 02            [ 1] 1142 	ld (2,x),a 
      0085C1 FE               [ 2] 1143 	ldw x,(x)
      0085C2 27 09            [ 1] 1144 	jreq 10$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0085C4 CD 84 FF         [ 4] 1145 	call insert_line
      0085C7 72 5F 00 04      [ 1] 1146 	clr  count 
      0085CB 20 0F            [ 2] 1147 	jra  11$ 
      0085CD                       1148 10$: ; line# is zero 
      0085CD CE 00 18         [ 2] 1149 	ldw x,ptr16  
      0085D0 CF 00 05         [ 2] 1150 	ldw basicptr,x 
      0085D3 E6 02            [ 1] 1151 	ld a,(2,x)
      0085D5 C7 00 04         [ 1] 1152 	ld count,a 
      0085D8 35 03 00 02      [ 1] 1153 	mov in,#3 
      0085DC                       1154 11$:
      00055C                       1155 	_drop VSIZE 
      0085DC 5B 02            [ 2]    1     addw sp,#VSIZE 
      0085DE 72 1B 00 24      [ 1] 1156 	bres flags,#FCOMP 
      0085E2 81               [ 4] 1157 	ret 
                                   1158 
                                   1159 ;------------------------------------
                                   1160 ;  set all variables to zero 
                                   1161 ; input:
                                   1162 ;   none 
                                   1163 ; output:
                                   1164 ;	none
                                   1165 ;------------------------------------
      0085E3                       1166 clear_vars:
      0085E3 AE 00 30         [ 2] 1167 	ldw x,#vars 
      0085E6 90 AE 00 34      [ 2] 1168 	ldw y,#2*26 
      0085EA 7F               [ 1] 1169 1$:	clr (x)
      0085EB 5C               [ 2] 1170 	incw x 
      0085EC 90 5A            [ 2] 1171 	decw y 
      0085EE 26 FA            [ 1] 1172 	jrne 1$
      0085F0 81               [ 4] 1173 	ret 
                                   1174 
                                   1175 ;-------------------------------------
                                   1176 ; check if A is a letter 
                                   1177 ; input:
                                   1178 ;   A 			character to test 
                                   1179 ; output:
                                   1180 ;   C flag      1 true, 0 false 
                                   1181 ;-------------------------------------
      0085F1                       1182 is_alpha:
      0085F1 A1 41            [ 1] 1183 	cp a,#'A 
      0085F3 8C               [ 1] 1184 	ccf 
      0085F4 24 0B            [ 1] 1185 	jrnc 9$ 
      0085F6 A1 5B            [ 1] 1186 	cp a,#'Z+1 
      0085F8 25 07            [ 1] 1187 	jrc 9$ 
      0085FA A1 61            [ 1] 1188 	cp a,#'a 
      0085FC 8C               [ 1] 1189 	ccf 
      0085FD 24 02            [ 1] 1190 	jrnc 9$
      0085FF A1 7B            [ 1] 1191 	cp a,#'z+1
      008601 81               [ 4] 1192 9$: ret 	
                                   1193 
                                   1194 ;------------------------------------
                                   1195 ; check if character in {'0'..'9'}
                                   1196 ; input:
                                   1197 ;    A  character to test
                                   1198 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1199 ;    Carry  0 not digit | 1 digit
                                   1200 ;------------------------------------
      008602                       1201 is_digit:
      008602 A1 30            [ 1] 1202 	cp a,#'0
      008604 25 03            [ 1] 1203 	jrc 1$
      008606 A1 3A            [ 1] 1204     cp a,#'9+1
      008608 8C               [ 1] 1205 	ccf 
      008609 8C               [ 1] 1206 1$:	ccf 
      00860A 81               [ 4] 1207     ret
                                   1208 
                                   1209 ;-------------------------------------
                                   1210 ; return true if character in  A 
                                   1211 ; is letter or digit.
                                   1212 ; input:
                                   1213 ;   A     ASCII character 
                                   1214 ; output:
                                   1215 ;   A     no change 
                                   1216 ;   Carry    0 false| 1 true 
                                   1217 ;--------------------------------------
      00860B                       1218 is_alnum:
      00860B CD 86 02         [ 4] 1219 	call is_digit
      00860E 25 03            [ 1] 1220 	jrc 1$ 
      008610 CD 85 F1         [ 4] 1221 	call is_alpha
      008613 81               [ 4] 1222 1$:	ret 
                                   1223 
                                   1224 
                                   1225 ;-------------------------------------
                                   1226 ;  program initialization entry point 
                                   1227 ;-------------------------------------
                           000001  1228 	MAJOR=1
                           000000  1229 	MINOR=0
      008614 0A 0A 54 69 6E 79 20  1230 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      00865A                       1231 cold_start:
                                   1232 ;set stack 
      00865A AE 17 FF         [ 2] 1233 	ldw x,#STACK_EMPTY
      00865D 94               [ 1] 1234 	ldw sp,x   
                                   1235 ; clear all ram 
      00865E 7F               [ 1] 1236 0$: clr (x)
      00865F 5A               [ 2] 1237 	decw x 
      008660 26 FC            [ 1] 1238 	jrne 0$
                                   1239 ; activate pull up on all inputs 
      008662 A6 FF            [ 1] 1240 	ld a,#255 
      008664 C7 50 03         [ 1] 1241 	ld PA_CR1,a 
      008667 C7 50 08         [ 1] 1242 	ld PB_CR1,a 
      00866A C7 50 0D         [ 1] 1243 	ld PC_CR1,a 
      00866D C7 50 12         [ 1] 1244 	ld PD_CR1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008670 C7 50 17         [ 1] 1245 	ld PE_CR1,a 
      008673 C7 50 1C         [ 1] 1246 	ld PF_CR1,a 
      008676 C7 50 21         [ 1] 1247 	ld PG_CR1,a 
      008679 C7 50 2B         [ 1] 1248 	ld PI_CR1,a
                                   1249 ; set LD2 pin as output and turn it on
      00867C 72 1A 50 0D      [ 1] 1250     bset PC_CR1,#LED2_BIT
      008680 72 1A 50 0E      [ 1] 1251     bset PC_CR2,#LED2_BIT
      008684 72 1A 50 0C      [ 1] 1252     bset PC_DDR,#LED2_BIT
      008688 72 1A 50 0A      [ 1] 1253 	bset PC_ODR,#LED2_BIT 
                                   1254 ; disable schmitt triggers on Arduino CN4 analog inputs
      00868C 55 00 3F 54 07   [ 1] 1255 	mov ADC_TDRL,0x3f
                                   1256 ; disable peripherals clocks
                                   1257 ;	clr CLK_PCKENR1 
                                   1258 ;	clr CLK_PCKENR2
      008691 72 5F 50 F2      [ 1] 1259 	clr AWU_TBR 
      008695 72 14 50 CA      [ 1] 1260 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1261 ; select internal clock no divisor: 16 Mhz 	
      008699 A6 E1            [ 1] 1262 	ld a,#CLK_SWR_HSI 
      00869B 5F               [ 1] 1263 	clrw x  
      00869C CD 81 35         [ 4] 1264     call clock_init 
      00869F CD 81 58         [ 4] 1265 	call timer4_init
      0086A2 CD 81 4B         [ 4] 1266 	call timer2_init
                                   1267 ; UART1 at 115200 BAUD
      0086A5 CD 82 FD         [ 4] 1268 	call uart1_init
                                   1269 ; activate PE_4 (user button interrupt)
      0086A8 72 18 50 18      [ 1] 1270     bset PE_CR2,#USR_BTN_BIT 
                                   1271 ; display system information
      0086AC AE 86 14         [ 2] 1272 	ldw x,#software 
      0086AF CD A8 C0         [ 4] 1273 	call puts 
      0086B2 A6 01            [ 1] 1274 	ld a,#MAJOR 
      0086B4 C7 00 0E         [ 1] 1275 	ld acc8,a 
      0086B7 5F               [ 1] 1276 	clrw x 
      0086B8 CF 00 0C         [ 2] 1277 	ldw acc24,x
      0086BB 72 5F 00 25      [ 1] 1278 	clr tab_width  
      0086BF 35 0A 00 0B      [ 1] 1279 	mov base, #10 
      0086C3 CD 8A 60         [ 4] 1280 	call prti24 
      0086C6 A6 2E            [ 1] 1281 	ld a,#'.
      0086C8 CD 83 40         [ 4] 1282 	call putc 
      0086CB A6 00            [ 1] 1283 	ld a,#MINOR 
      0086CD C7 00 0E         [ 1] 1284 	ld acc8,a 
      0086D0 5F               [ 1] 1285 	clrw x 
      0086D1 CF 00 0C         [ 2] 1286 	ldw acc24,x 
      0086D4 CD 8A 60         [ 4] 1287 	call prti24
      0086D7 A6 0D            [ 1] 1288 	ld a,#CR 
      0086D9 CD 83 40         [ 4] 1289 	call putc
      0086DC CD 9A AA         [ 4] 1290 	call seek_fdrive 
      0086DF 9A               [ 1] 1291 	rim 
      0086E0 72 5C 00 16      [ 1] 1292 	inc seedy+1 
      0086E4 72 5C 00 14      [ 1] 1293 	inc seedx+1 
      0086E8 CD 87 69         [ 4] 1294 	call clear_basic
      0086EB CD 92 C2         [ 4] 1295 	call ubound 
                                   1296 ;	jra 2$	
      0086EE CD 98 F8         [ 4] 1297 	call beep_1khz  
      0086F1 72 1B 50 0A      [ 1] 1298 2$:	bres PC_ODR,#LED2_BIT	
      0086F5 CD 86 FE         [ 4] 1299 	call warm_init
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0086F8 CD 87 2B         [ 4] 1300 	call load_autorun
      0086FB CC 89 87         [ 2] 1301     jp cmd_line  
                                   1302 
      0086FE                       1303 warm_init:
      0086FE 72 5F 00 24      [ 1] 1304 	clr flags 
      008702 72 5F 00 21      [ 1] 1305 	clr loop_depth 
      008706 35 04 00 25      [ 1] 1306 	mov tab_width,#TAB_WIDTH 
      00870A 35 0A 00 0B      [ 1] 1307 	mov base,#10 
      00870E AE 00 00         [ 2] 1308 	ldw x,#0 
      008711 CF 00 05         [ 2] 1309 	ldw basicptr,x 
      008714 CF 00 01         [ 2] 1310 	ldw in.w,x 
      008717 72 5F 00 04      [ 1] 1311 	clr count
      00871B 81               [ 4] 1312 	ret 
                                   1313 
                                   1314 ;--------------------------
                                   1315 ; called by tb_error when
                                   1316 ; flag FAUTORUN is set.
                                   1317 ; There is a bug in autorun 
                                   1318 ; program so cancel it.
                                   1319 ;---------------------------
      00871C                       1320 cancel_autorun:
      00871C AE 40 00         [ 2] 1321 	ldw x,#AUTORUN_NAME 
      00871F CF 00 18         [ 2] 1322 	ldw farptr+1,x 
      008722 4F               [ 1] 1323 	clr a
      008723 5F               [ 1] 1324 	clrw x  
      008724 C7 00 17         [ 1] 1325 	ld farptr,a 
      008727 CD 82 65         [ 4] 1326 	call write_byte 
      00872A 81               [ 4] 1327 	ret 
                                   1328 
                                   1329 
                                   1330 ;--------------------------
                                   1331 ; if autorun file defined 
                                   1332 ; in eeprom address AUTORUN_NAME 
                                   1333 ; load and run it.
                                   1334 ;-------------------------
      00872B                       1335 load_autorun:
      00872B 90 AE 40 00      [ 2] 1336 	ldw y,#AUTORUN_NAME
      00872F 90 F6            [ 1] 1337 	ld a,(y)
      008731 27 20            [ 1] 1338 	jreq 9$
      008733 CD 9B 10         [ 4] 1339 	call search_file
      008736 25 05            [ 1] 1340 	jrc 2$ 
                                   1341 ; if file doesn't exit
      008738 CD 87 1C         [ 4] 1342 	call cancel_autorun
      00873B 20 16            [ 2] 1343 	jra 9$ 
      00873D CD 9C 29         [ 4] 1344 2$:	call load_file
      008740 AE 40 00         [ 2] 1345 	ldw x,#AUTORUN_NAME 
      008743 CD A8 C0         [ 4] 1346 	call puts
      008746 AE 87 54         [ 2] 1347 	ldw x,#autorun_msg 
      008749 CD A8 C0         [ 4] 1348 	call puts 
      00874C 72 1C 00 24      [ 1] 1349 	bset flags,#FAUTORUN 
      008750 CC 98 CA         [ 2] 1350 	jp run_it    
      008753 81               [ 4] 1351 9$: ret 	
                                   1352 
      008754 20 6C 6F 61 64 65 64  1353 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal  6E-Bits]



             6E 6E 69 6E 67 0A 00
                                   1354 ;---------------------------
                                   1355 ; reset BASIC text variables 
                                   1356 ; and clear variables 
                                   1357 ;---------------------------
      0006E9                       1358 clear_basic:
      008763 6E 69 6E 67      [ 1] 1359 	clr count
      008767 0A 00 00 01      [ 1] 1360 	clr in  
      008769 AE 00 63         [ 2] 1361 	ldw x,#free_ram 
      008769 72 5F 00         [ 2] 1362 	ldw txtbgn,x 
      00876C 04 72 5F         [ 2] 1363 	ldw txtend,x 
      00876F 00 02 AE         [ 4] 1364 	call clear_vars 
      008772 00               [ 4] 1365 	ret 
                                   1366 
                                   1367 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1368 ;;   Tiny BASIC error messages     ;;
                                   1369 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006FE                       1370 err_msg:
      008773 64 CF 00 1D CF 00 1F  1371 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             CD 85 E3 81 61
      00877E 07 77 07 8D 07 A7 07  1372 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             B8 07 C9
      00877E 00 00 87 9E 87 AB 87  1373 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             B9 87 D2
                                   1374 
      008788 87 E1 87 F7 88 0D 88  1375 err_mem_full: .asciz "Memory full\n" 
             27 88 38 88 49 88
      008795 55 88 88 88 98 88 AC  1376 err_syntax: .asciz "syntax error\n" 
             88 BF 4D 65 6D 6F 72
      0087A3 79 20 66 75 6C 6C 0A  1377 err_math_ovf: .asciz "math operation overflow\n"
             00 73 79 6E 74 61 78
             20 65 72 72 6F 72 0A
             00 6D 61 74
      0087BC 68 20 6F 70 65 72 61  1378 err_div0: .asciz "division by 0\n" 
             74 69 6F 6E 20 6F 76
             65
      0087CB 72 66 6C 6F 77 0A 00  1379 err_no_line: .asciz "invalid line number.\n"
             64 69 76 69 73 69 6F
             6E 20 62 79 20 30 0A
             00
      0087E1 69 6E 76 61 6C 69 64  1380 err_run_only: .asciz "run time only usage.\n" 
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0087F7 72 75 6E 20 74 69 6D  1381 err_cmd_only: .asciz "command line only usage.\n"
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00 63 6F 6D 6D
      008811 61 6E 64 20 6C 69 6E  1382 err_duplicate: .asciz "duplicate name.\n"
             65 20 6F 6E 6C 79 20
             75 73 61
      008822 67 65 2E 0A 00 64 75  1383 err_not_file: .asciz "File not found.\n"
             70 6C 69 63 61 74 65
             20 6E 61
      008833 6D 65 2E 0A 00 46 69  1384 err_bad_value: .asciz "bad value.\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal  6C-Bits]



             75 65 2E 0A 00
      00883B 65 20 6E 6F 74 20 66  1385 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             6F 75 6E 64 2E 0A 00
             62 61 64 20 76 61 6C
             75 65 2E 0A 00 46 69
             6C 65 20 69 6E 20 65
             78 74 65 6E 64 65 64
             20 6D 65 6D 6F 72 79
             2C 20
      00886E 63 61 6E 27 74 20 62  1386 err_no_data: .asciz "No data found.\n"
             65 20 72 75 6E 20 66
             72 6F
      00887E 6D 20 74 68 65 72 65  1387 err_no_prog: .asciz "No program in RAM!\n"
             2E 0A 00 4E 6F 20 64
             61 74 61 20 66 6F
      008892 75 6E 64 2E 0A 00 4E  1388 err_no_fspace: .asciz "File system full.\n" 
             6F 20 70 72 6F 67 72
             61 6D 20 69 6E
      0088A5 20 52 41 4D 21 0A 00  1389 err_buf_full: .asciz "Buffer full\n"
             46 69 6C 65 20 73
                                   1390 
      0088B2 79 73 74 65 6D 20 66  1391 rt_msg: .asciz "run time error, "
             75 6C 6C 2E 0A 00 42
             75 66 66
      0088C3 65 72 20 66 75 6C 6C  1392 comp_msg: .asciz "compile error, "
             0A 00 72 75 6E 20 74
             69 6D
      0088D3 65 20 65 72 72 6F 72  1393 tk_id: .asciz "last token id: "
             2C 20 00 63 6F 6D 70
             69 6C
                                   1394 
      00087D                       1395 syntax_error:
      0088E3 65 20            [ 1] 1396 	ld a,#ERR_SYNTAX 
                                   1397 
      00087F                       1398 tb_error:
      0088E5 65 72 72 6F 72   [ 2] 1399 	btjt flags,#FCOMP,1$
      0088EA 2C               [ 1] 1400 	push a 
      0088EB 20 00 6C         [ 2] 1401 	ldw x, #rt_msg 
      0088EE 61 73 74         [ 4] 1402 	call puts 
      0088F1 20               [ 1] 1403 	pop a 
      0088F2 74 6F 6B         [ 2] 1404 	ldw x, #err_msg 
      0088F5 65 6E 20 69      [ 1] 1405 	clr acc16 
      0088F9 64               [ 1] 1406 	sll a
      0088FA 3A 20 00 0C      [ 1] 1407 	rlc acc16  
      0088FD C7 00 0D         [ 1] 1408 	ld acc8, a 
      0088FD A6 02 00 0C      [ 2] 1409 	addw x,acc16 
      0088FF FE               [ 2] 1410 	ldw x,(x)
      0088FF 72 0A 00         [ 4] 1411 	call puts
      008902 24 47 88         [ 2] 1412 	ldw x,basicptr
      008905 AE 88 CC         [ 1] 1413 	ld a,in 
      008908 CD A8 C0         [ 4] 1414 	call prt_basic_line
      00890B 84 AE 87         [ 2] 1415 	ldw x,#tk_id 
      00890E 7E 72 5F         [ 4] 1416 	call puts 
      008911 00 0D 48         [ 1] 1417 	ld a,in.saved 
      008914 72               [ 1] 1418 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008915 59               [ 1] 1419 	ld xl,a 
      008916 00 0D C7 00      [ 2] 1420 	addw x,basicptr 
      00891A 0E               [ 1] 1421 	ld a,(x)
      00891B 72               [ 1] 1422 	clrw x 
      00891C BB               [ 1] 1423 	ld xl,a 
      00891D 00 0D FE         [ 4] 1424 	call print_int
      008920 CD A8 C0 CE 00   [ 2] 1425 	btjf flags,#FAUTORUN ,6$
      008925 05 C6 00         [ 4] 1426 	call cancel_autorun  
      008928 02 CD            [ 2] 1427 	jra 6$
      0008CB                       1428 1$:	
      00892A 95               [ 1] 1429 	push a 
      00892B 96 AE 88         [ 2] 1430 	ldw x,#comp_msg
      00892E ED CD A8         [ 4] 1431 	call puts 
      008931 C0               [ 1] 1432 	pop a 
      008932 C6 00 03         [ 2] 1433 	ldw x, #err_msg 
      008935 5F 97 72 BB      [ 1] 1434 	clr acc16 
      008939 00               [ 1] 1435 	sll a
      00893A 05 F6 5F 97      [ 1] 1436 	rlc acc16  
      00893E CD 8A 50         [ 1] 1437 	ld acc8, a 
      008941 72 0D 00 24      [ 2] 1438 	addw x,acc16 
      008945 3A               [ 2] 1439 	ldw x,(x)
      008946 CD 87 1C         [ 4] 1440 	call puts
      008949 20 35 90         [ 2] 1441 	ldw x,#tib
      00894B CD 00 00         [ 4] 1442 	call puts 
      00894B 88 AE            [ 1] 1443 	ld a,#CR 
      00894D 88 DD CD         [ 4] 1444 	call putc
      008950 A8 C0 84         [ 2] 1445 	ldw x,in.w
      008953 AE 87 7E         [ 4] 1446 	call spaces
      008956 72 5F            [ 1] 1447 	ld a,#'^
      008958 00 0D 48         [ 4] 1448 	call putc 
      00895B 72 59 00         [ 2] 1449 6$: ldw x,#STACK_EMPTY 
      00895E 0D               [ 1] 1450     ldw sp,x
      000904                       1451 warm_start:
      00895F C7 00 0E         [ 4] 1452 	call warm_init
                                   1453 ;----------------------------
                                   1454 ;   BASIC interpreter
                                   1455 ;----------------------------
      000907                       1456 cmd_line: ; user interface 
      008962 72 BB            [ 1] 1457 	ld a,#CR 
      008964 00 0D FE         [ 4] 1458 	call putc 
      008967 CD A8            [ 1] 1459 	ld a,#'> 
      008969 C0 AE 16         [ 4] 1460 	call putc
      00896C 90 CD A8         [ 4] 1461 	call readln
      00896F C0 A6 0D CD      [ 1] 1462 	tnz count 
      008973 83 40            [ 1] 1463 	jreq cmd_line
      008975 CE 00 01         [ 4] 1464 	call compile
                                   1465 ; if text begin with a line number
                                   1466 ; the compiler set count to zero    
                                   1467 ; so code is not interpreted
      008978 CD A9 2D A6      [ 1] 1468 	tnz count 
      00897C 5E CD            [ 1] 1469 	jreq cmd_line
                                   1470 
                                   1471 ; if direct command 
                                   1472 ; it's ready to interpret 
                                   1473 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1474 ;; This is the interpreter loop
                                   1475 ;; for each BASIC code line. 
                                   1476 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      000923                       1477 interpreter: 
      00897E 83 40 AE         [ 1] 1478 	ld a,in 
      008981 17 FF 94         [ 1] 1479 	cp a,count 
      008984 2B 1D            [ 1] 1480 	jrmi interp_loop
      00092B                       1481 next_line:
      008984 CD 86 FE 23 D7   [ 2] 1482 	btjf flags, #FRUN, cmd_line
      008987 CE 00 04         [ 2] 1483 	ldw x,basicptr
      008987 A6 0D CD 83      [ 2] 1484 	addw x,in.w 
      00898B 40 A6 3E         [ 2] 1485 	cpw x,txtend 
      00898E CD 83            [ 1] 1486 	jrpl warm_start
      008990 40 CD A9         [ 2] 1487 	ldw basicptr,x ; start of next line  
      008993 C5 72            [ 1] 1488 	ld a,(2,x)
      008995 5D 00 04         [ 1] 1489 	ld count,a 
      008998 27 ED CD 85      [ 1] 1490 	mov in,#3 ; skip first 3 bytes of line 
      000948                       1491 interp_loop: 
      00899C 70 72 5D         [ 4] 1492 	call next_token
      00899F 00 04            [ 1] 1493 	cp a,#TK_NONE 
      0089A1 27 E4            [ 1] 1494 	jreq next_line 
      0089A3 A1 80            [ 1] 1495 	cp a,#TK_CMD
      0089A3 C6 00            [ 1] 1496 	jrne 1$
      0089A5 02               [ 4] 1497 	call (x) 
      0089A6 C1 00            [ 2] 1498 	jra interp_loop 
      000956                       1499 1$:	 
      0089A8 04 2B            [ 1] 1500 	cp a,#TK_VAR
      0089AA 1D 05            [ 1] 1501 	jrne 2$
      0089AB CD 12 75         [ 4] 1502 	call let_var  
      0089AB 72 01            [ 2] 1503 	jra interp_loop 
      00095F                       1504 2$:	
      0089AD 00 24            [ 1] 1505 	cp a,#TK_ARRAY 
      0089AF D7 CE            [ 1] 1506 	jrne 3$
      0089B1 00 05 72         [ 4] 1507 	call let_array 
      0089B4 BB 00            [ 2] 1508 	jra interp_loop
      000968                       1509 3$:	
      0089B6 01 C3            [ 1] 1510 	cp a,#TK_COLON 
      0089B8 00 1F            [ 1] 1511 	jreq interp_loop 
      0089BA 2A C8 CF         [ 2] 1512 	jp syntax_error 
                                   1513 
                                   1514 		
                                   1515 ;--------------------------
                                   1516 ; extract next token from
                                   1517 ; token list 
                                   1518 ; basicptr -> base address 
                                   1519 ; in  -> offset in list array 
                                   1520 ; output:
                                   1521 ;   A 		token attribute
                                   1522 ;   X 		token value if there is one
                                   1523 ;----------------------------------------
      00096F                       1524 next_token:
      0089BD 00               [ 1] 1525 	clrw x 
      0089BE 05 E6 02         [ 1] 1526 	ld a,in 
      0089C1 C7 00 04         [ 1] 1527 	sub a,count ; don't replace sub by cp!  
      0089C4 35 03            [ 1] 1528 	jrmi 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0089C6 00               [ 4] 1529 	ret  ; end of BASIC line 
      000979                       1530 0$: 
      0089C7 02 00 01 00 02   [ 1] 1531 	mov in.saved,in 
      0089C8 90 CE 00 04      [ 2] 1532 	ldw y,basicptr 
      0089C8 CD 89 EF         [ 4] 1533 	ld a,([in.w],y)
      0089CB A1 00 27 DC      [ 1] 1534 	inc in  
      0089CF A1               [ 1] 1535 	tnz a 
      0089D0 80 26            [ 1] 1536 	jrmi 6$
      0089D2 03 FD            [ 1] 1537 	cp a,#TK_ARRAY
      0089D4 20 F2            [ 1] 1538 	jrpl 9$  ; no attribute for these
      0089D6 A1 01            [ 1] 1539 	cp a,#TK_COLON
      0089D6 A1 85            [ 1] 1540 	jreq 9$  
      000994                       1541 1$: ; 
      0089D8 26 05            [ 1] 1542 	cp a,#TK_CHAR
      0089DA CD 92            [ 1] 1543 	jrne 2$
      0089DC F5               [ 1] 1544 	exg a,xl
      0089DD 20 E9 00         [ 4] 1545 	ld a,([in.w],y)
      0089DF 72 5C 00 01      [ 1] 1546 	inc in 
      0089DF A1               [ 1] 1547 	exg a,xl  
      0089E0 06               [ 4] 1548 	ret
      0089E1 26 05            [ 1] 1549 2$:	cp a,#TK_QSTR 
      0089E3 CD 92            [ 1] 1550 	jrne 9$
      0089E5 F2               [ 1] 1551 	ldw x,y 
      0089E6 20 E0 00 00      [ 2] 1552 	addw x,in.w ; pointer to string 
                                   1553 ; move pointer after string 
      0089E8 91 6D 00         [ 4] 1554 3$:	tnz ([in.w],y)
      0089E8 A1 01            [ 1] 1555 	jreq 8$
      0089EA 27 DC CC 88      [ 1] 1556 	inc in 
      0089EE FD F5            [ 2] 1557 	jra 3$
      0089EF                       1558 6$: 
      0089EF 5F C6 00 02      [ 2] 1559 	addw y,in.w 
      0089F3 C0 00            [ 2] 1560 	ldw y,(y)
      0089F5 04 2B            [ 1] 1561 	cp a,#TK_INTGR
      0089F7 01 81            [ 1] 1562 	jrpl 7$
      0089F9 72 A9 27 04      [ 2] 1563 	addw y,#code_addr
      0089F9 55 00            [ 2] 1564 	ldw y,(y) 
      0089FB 02               [ 1] 1565 7$:	exgw x,y 
      0089FC 00 03 90 CE      [ 1] 1566 	inc in
      008A00 00 05 91 D6      [ 1] 1567 8$:	inc in 
      0009CF                       1568 9$: 
      008A04 01               [ 4] 1569 	ret	
                                   1570 
                                   1571 ;-----------------------------------
                                   1572 ; print a 16 bit integer 
                                   1573 ; using variable 'base' as conversion
                                   1574 ; format.
                                   1575 ; input:
                                   1576 ;   X       integer to print 
                                   1577 ;   'base'    conversion base 
                                   1578 ; output:
                                   1579 ;   none 
                                   1580 ;-----------------------------------
      0009D0                       1581 print_int:
      008A05 72 5C 00 02      [ 1] 1582 	clr acc24 
      008A09 4D 2B 2A         [ 2] 1583 	ldw acc16,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008A0C A1 06 2A 3F A1   [ 2] 1584 	btjf acc16,#7,prti24
      008A11 01 27 3B 0B      [ 1] 1585 	cpl acc24 
                                   1586 
                                   1587 ;------------------------------------
                                   1588 ; print integer in acc24 
                                   1589 ; input:
                                   1590 ;	acc24 		integer to print 
                                   1591 ;	'base' 		numerical base for conversion 
                                   1592 ;   'tab_width' field width 
                                   1593 ;  output:
                                   1594 ;    A          string length
                                   1595 ;------------------------------------
      008A14                       1596 prti24:
      008A14 A1 03 26         [ 4] 1597     call itoa  ; conversion entier en  .asciz
      008A17 0A 41 91         [ 4] 1598 	call right_align  
      008A1A D6               [ 1] 1599 	push a 
      008A1B 01 72 5C         [ 4] 1600 	call puts
      008A1E 00               [ 1] 1601 	pop a 
      008A1F 02               [ 4] 1602     ret	
                                   1603 
                                   1604 ;------------------------------------
                                   1605 ; convert integer in acc24 to string
                                   1606 ; input:
                                   1607 ;   'base'	conversion base 
                                   1608 ;	acc24	integer to convert
                                   1609 ; output:
                                   1610 ;   X  		pointer to first char of string
                                   1611 ;   A       string length
                                   1612 ;------------------------------------
                           000001  1613 	SIGN=1  ; integer sign 
                           000002  1614 	LEN=2 
                           000003  1615 	PSTR=3
                           000004  1616 	VSIZE=4 ;locals size
      0009EC                       1617 itoa:
      0009EC                       1618 	_vars VSIZE
      008A20 41 81            [ 2]    1     sub sp,#VSIZE 
      008A22 A1 02            [ 1] 1619 	clr (LEN,sp) ; string length  
      008A24 26 29            [ 1] 1620 	clr (SIGN,sp)    ; sign
      008A26 93 72 BB         [ 1] 1621 	ld a,base 
      008A29 00 01            [ 1] 1622 	cp a,#10
      008A2B 91 6D            [ 1] 1623 	jrne 1$
                                   1624 	; base 10 string display with negative sign if bit 23==1
      008A2D 01 27 1B 72 5C   [ 2] 1625 	btjf acc24,#7,1$
      008A32 00 02            [ 1] 1626 	cpl (SIGN,sp)
      008A34 20 F5 A8         [ 4] 1627 	call neg_acc24
      008A36                       1628 1$:
                                   1629 ; initialize string pointer 
      008A36 72 B9 00         [ 2] 1630 	ldw x,#tib 
      008A39 01 90 FE         [ 2] 1631 	addw x,#TIB_SIZE
      008A3C A1               [ 2] 1632 	decw x 
      008A3D 84               [ 1] 1633 	clr (x)
      000A0B                       1634 itoa_loop:
      008A3E 2A 06 72         [ 1] 1635     ld a,base
      008A41 A9 A7            [ 2] 1636 	ldw (PSTR,sp),x 
      008A43 84 90 FE         [ 4] 1637     call divu24_8 ; acc24/A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A46 51 72            [ 2] 1638 	ldw x,(PSTR,sp)
      008A48 5C 00            [ 1] 1639     add a,#'0  ; remainder of division
      008A4A 02 72            [ 1] 1640     cp a,#'9+1
      008A4C 5C 00            [ 1] 1641     jrmi 2$
      008A4E 02 07            [ 1] 1642     add a,#7 
      008A4F                       1643 2$:	
      008A4F 81               [ 2] 1644 	decw x
      008A50 F7               [ 1] 1645     ld (x),a
      008A50 72 5F            [ 1] 1646 	inc (LEN,sp)
                                   1647 	; if acc24==0 conversion done
      008A52 00 0C CF         [ 1] 1648 	ld a,acc24
      008A55 00 0D 72         [ 1] 1649 	or a,acc16
      008A58 0F 00 0D         [ 1] 1650 	or a,acc8
      008A5B 04 72            [ 1] 1651     jrne itoa_loop
                                   1652 	;conversion done, next add '$' or '-' as required
      008A5D 53 00 0C         [ 1] 1653 	ld a,base 
      008A60 A1 10            [ 1] 1654 	cp a,#16
      008A60 CD 8A            [ 1] 1655 	jreq 8$
      008A62 6C CD            [ 1] 1656 	ld a,(SIGN,sp)
      008A64 93 B2            [ 1] 1657     jreq 10$
      008A66 88 CD            [ 1] 1658     ld a,#'-
      008A68 A8 C0            [ 2] 1659 	jra 9$ 
      008A6A 84 81            [ 1] 1660 8$: ld a,#'$ 
      008A6C 5A               [ 2] 1661 9$: decw x
      008A6C 52               [ 1] 1662     ld (x),a
      008A6D 04 0F            [ 1] 1663 	inc (LEN,sp)
      000A41                       1664 10$:
      008A6F 02 0F            [ 1] 1665 	ld a,(LEN,sp)
      000A43                       1666 	_drop VSIZE
      008A71 01 C6            [ 2]    1     addw sp,#VSIZE 
      008A73 00               [ 4] 1667 	ret
                                   1668 
                                   1669 ;-------------------------------------
                                   1670 ; divide uint24_t by uint8_t
                                   1671 ; used to convert uint24_t to string
                                   1672 ; input:
                                   1673 ;	acc24	dividend
                                   1674 ;   A 		divisor
                                   1675 ; output:
                                   1676 ;   acc24	quotient
                                   1677 ;   A		remainder
                                   1678 ;------------------------------------- 
                                   1679 ; offset  on sp of arguments and locals
                           000001  1680 	U8   = 1   ; divisor on stack
                           000001  1681 	VSIZE =1
      000A46                       1682 divu24_8:
      008A74 0B               [ 2] 1683 	pushw x ; save x
      008A75 A1               [ 1] 1684 	push a 
                                   1685 	; ld dividend UU:MM bytes in X
      008A76 0A 26 0A         [ 1] 1686 	ld a, acc24
      008A79 72               [ 1] 1687 	ld xh,a
      008A7A 0F 00 0C         [ 1] 1688 	ld a,acc24+1
      008A7D 05               [ 1] 1689 	ld xl,a
      008A7E 03 01            [ 1] 1690 	ld a,(U8,SP) ; divisor
      008A80 CD               [ 2] 1691 	div x,a ; UU:MM/U8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A81 8B               [ 1] 1692 	push a  ;save remainder
      008A82 28               [ 1] 1693 	ld a,xh
      008A83 C7 00 0B         [ 1] 1694 	ld acc24,a
      008A83 AE               [ 1] 1695 	ld a,xl
      008A84 16 90 1C         [ 1] 1696 	ld acc24+1,a
      008A87 00               [ 1] 1697 	pop a
      008A88 50               [ 1] 1698 	ld xh,a
      008A89 5A 7F 0D         [ 1] 1699 	ld a,acc24+2
      008A8B 97               [ 1] 1700 	ld xl,a
      008A8B C6 00            [ 1] 1701 	ld a,(U8,sp) ; divisor
      008A8D 0B               [ 2] 1702 	div x,a  ; R:LL/U8
      008A8E 1F 03            [ 1] 1703 	ld (U8,sp),a ; save remainder
      008A90 CD               [ 1] 1704 	ld a,xl
      008A91 8A C6 1E         [ 1] 1705 	ld acc24+2,a
      008A94 03               [ 1] 1706 	pop a
      008A95 AB               [ 2] 1707 	popw x
      008A96 30               [ 4] 1708 	ret
                                   1709 
                                   1710 ;--------------------------------------
                                   1711 ; unsigned multiply uint24_t by uint8_t
                                   1712 ; use to convert numerical string to uint24_t
                                   1713 ; input:
                                   1714 ;	acc24	uint24_t 
                                   1715 ;   A		uint8_t
                                   1716 ; output:
                                   1717 ;   acc24   A*acc24
                                   1718 ;-------------------------------------
                                   1719 ; local variables offset  on sp
                           000003  1720 	U8   = 3   ; A pushed on stack
                           000002  1721 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1722 	OVFH = 1  ; multiplication overflow high byte
                           000003  1723 	VSIZE = 3
      000A6E                       1724 mulu24_8:
      008A97 A1               [ 2] 1725 	pushw x    ; save X
                                   1726 	; local variables
      008A98 3A               [ 1] 1727 	push a     ; U8
      008A99 2B               [ 1] 1728 	clrw x     ; initialize overflow to 0
      008A9A 02               [ 2] 1729 	pushw x    ; multiplication overflow
                                   1730 ; multiply low byte.
      008A9B AB 07 0D         [ 1] 1731 	ld a,acc24+2
      008A9D 97               [ 1] 1732 	ld xl,a
      008A9D 5A F7            [ 1] 1733 	ld a,(U8,sp)
      008A9F 0C               [ 4] 1734 	mul x,a
      008AA0 02               [ 1] 1735 	ld a,xl
      008AA1 C6 00 0C         [ 1] 1736 	ld acc24+2,a
      008AA4 CA               [ 1] 1737 	ld a, xh
      008AA5 00 0D            [ 1] 1738 	ld (OVFL,sp),a
                                   1739 ; multipy middle byte
      008AA7 CA 00 0E         [ 1] 1740 	ld a,acc24+1
      008AAA 26               [ 1] 1741 	ld xl,a
      008AAB DF C6            [ 1] 1742 	ld a, (U8,sp)
      008AAD 00               [ 4] 1743 	mul x,a
                                   1744 ; add overflow to this partial product
      008AAE 0B A1 10         [ 2] 1745 	addw x,(OVFH,sp)
      008AB1 27               [ 1] 1746 	ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008AB2 08 7B 01         [ 1] 1747 	ld acc24+1,a
      008AB5 27               [ 1] 1748 	clr a
      008AB6 0A A6            [ 1] 1749 	adc a,#0
      008AB8 2D 20            [ 1] 1750 	ld (OVFH,sp),a
      008ABA 02               [ 1] 1751 	ld a,xh
      008ABB A6 24            [ 1] 1752 	ld (OVFL,sp),a
                                   1753 ; multiply most signficant byte	
      008ABD 5A F7 0C         [ 1] 1754 	ld a, acc24
      008AC0 02               [ 1] 1755 	ld xl, a
      008AC1 7B 03            [ 1] 1756 	ld a, (U8,sp)
      008AC1 7B               [ 4] 1757 	mul x,a
      008AC2 02 5B 04         [ 2] 1758 	addw x, (OVFH,sp)
      008AC5 81               [ 1] 1759 	ld a, xl
      008AC6 C7 00 0B         [ 1] 1760 	ld acc24,a
      008AC6 89 88            [ 2] 1761     addw sp,#VSIZE
      008AC8 C6               [ 2] 1762 	popw x
      008AC9 00               [ 4] 1763 	ret
                                   1764 
                                   1765 ;------------------------------------
                                   1766 ;  two's complement acc24
                                   1767 ;  input:
                                   1768 ;		acc24 variable
                                   1769 ;  output:
                                   1770 ;		acc24 variable
                                   1771 ;-------------------------------------
      000AA8                       1772 neg_acc24:
      008ACA 0C 95 C6 00      [ 1] 1773 	cpl acc24+2
      008ACE 0D 97 7B 01      [ 1] 1774 	cpl acc24+1
      008AD2 62 88 9E C7      [ 1] 1775 	cpl acc24
      008AD6 00 0C            [ 1] 1776 	ld a,#1
      008AD8 9F C7 00         [ 1] 1777 	add a,acc24+2
      008ADB 0D 84 95         [ 1] 1778 	ld acc24+2,a
      008ADE C6               [ 1] 1779 	clr a
      008ADF 00 0E 97         [ 1] 1780 	adc a,acc24+1
      008AE2 7B 01 62         [ 1] 1781 	ld acc24+1,a 
      008AE5 6B               [ 1] 1782 	clr a 
      008AE6 01 9F C7         [ 1] 1783 	adc a,acc24 
      008AE9 00 0E 84         [ 1] 1784 	ld acc24,a 
      008AEC 85               [ 4] 1785 	ret
                                   1786 
                                   1787 
                                   1788 
                                   1789 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1790 ;; compiler routines        ;;
                                   1791 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1792 ;------------------------------------
                                   1793 ; parse quoted string 
                                   1794 ; input:
                                   1795 ;   Y 	pointer to tib 
                                   1796 ;   X   pointer to output buffer 
                                   1797 ; output:
                                   1798 ;	buffer   parsed string
                                   1799 ;------------------------------------
                           000001  1800 	PREV = 1
                           000002  1801 	CURR =2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                           000002  1802 	VSIZE=2
      000ACB                       1803 parse_quote: 
      000ACB                       1804 	_vars VSIZE 
      008AED 81 02            [ 2]    1     sub sp,#VSIZE 
      008AEE 4F               [ 1] 1805 	clr a
      008AEE 89 88            [ 1] 1806 1$:	ld (PREV,sp),a 
      000AD0                       1807 2$:	
      008AF0 5F 89 C6         [ 4] 1808 	ld a,([in.w],y)
      008AF3 00 0E            [ 1] 1809 	jreq 6$
      008AF5 97 7B 03 42      [ 1] 1810 	inc in 
      008AF9 9F C7            [ 1] 1811 	ld (CURR,sp),a 
      008AFB 00 0E            [ 1] 1812 	ld a,#'\
      008AFD 9E 6B            [ 1] 1813 	cp a, (PREV,sp)
      008AFF 02 C6            [ 1] 1814 	jrne 3$
      008B01 00 0D            [ 1] 1815 	clr (PREV,sp)
      008B03 97 7B            [ 1] 1816 	ld a,(CURR,sp)
      008B05 03 42            [ 4] 1817 	callr convert_escape
      008B07 72               [ 1] 1818 	ld (x),a 
      008B08 FB               [ 2] 1819 	incw x 
      008B09 01 9F            [ 2] 1820 	jra 2$
      000AEB                       1821 3$:
      008B0B C7 00            [ 1] 1822 	ld a,(CURR,sp)
      008B0D 0D 4F            [ 1] 1823 	cp a,#'\'
      008B0F A9 00            [ 1] 1824 	jreq 1$
      008B11 6B 01            [ 1] 1825 	cp a,#'"
      008B13 9E 6B            [ 1] 1826 	jreq 6$ 
      008B15 02               [ 1] 1827 	ld (x),a 
      008B16 C6               [ 2] 1828 	incw x 
      008B17 00 0C            [ 2] 1829 	jra 2$
      000AF9                       1830 6$:
      008B19 97               [ 1] 1831 	clr (x)
      008B1A 7B               [ 2] 1832 	incw x 
      008B1B 03 42            [ 1] 1833 	ldw y,x 
      008B1D 72               [ 1] 1834 	clrw x 
      008B1E FB 01            [ 1] 1835 	ld a,#TK_QSTR  
      000B00                       1836 	_drop VSIZE
      008B20 9F C7            [ 2]    1     addw sp,#VSIZE 
      008B22 00               [ 4] 1837 	ret 
                                   1838 
                                   1839 ;---------------------------------------
                                   1840 ; called by parse_quote
                                   1841 ; subtitute escaped character 
                                   1842 ; by their ASCII value .
                                   1843 ; input:
                                   1844 ;   A  character following '\'
                                   1845 ; output:
                                   1846 ;   A  substitued char or same if not valid.
                                   1847 ;---------------------------------------
      000B03                       1848 convert_escape:
      008B23 0C               [ 2] 1849 	pushw x 
      008B24 5B 03 85         [ 2] 1850 	ldw x,#escaped 
      008B27 81               [ 1] 1851 1$:	cp a,(x)
      008B28 27 06            [ 1] 1852 	jreq 2$
      008B28 72               [ 1] 1853 	tnz (x)
      008B29 53 00            [ 1] 1854 	jreq 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B2B 0E               [ 2] 1855 	incw x 
      008B2C 72 53            [ 2] 1856 	jra 1$
      008B2E 00 0D 72         [ 2] 1857 2$: subw x,#escaped 
      008B31 53               [ 1] 1858 	ld a,xl 
      008B32 00 0C            [ 1] 1859 	add a,#7
      008B34 A6               [ 2] 1860 3$:	popw x 
      008B35 01               [ 4] 1861 	ret 
                                   1862 
      008B36 CB 00 0E C7 00 0E 4F  1863 escaped: .asciz "abtnvfr"
             C9
                                   1864 
                                   1865 ;-------------------------
                                   1866 ; integer parser 
                                   1867 ; input:
                                   1868 ;   X 		point to output buffer  
                                   1869 ;   Y 		point to tib 
                                   1870 ;   A 	    first digit|'$' 
                                   1871 ; output:  
                                   1872 ;   X 		integer 
                                   1873 ;   A 		TK_INTGR
                                   1874 ;   acc24   24 bits integer 
                                   1875 ;-------------------------
                           000001  1876 	BASE=1
                           000002  1877 	TCHAR=2 
                           000003  1878 	XSAVE=3
                           000004  1879 	VSIZE=4 
      000B20                       1880 parse_integer: ; { -- n }
      008B3E 00               [ 2] 1881 	pushw x 	
      008B3F 0D C7            [ 1] 1882 	push #0 ; TCHAR
      008B41 00 0D            [ 1] 1883 	push #10 ; BASE=10
      008B43 4F C9            [ 1] 1884 	cp a,#'$
      008B45 00 0C            [ 1] 1885 	jrne 2$ 
      000B29                       1886     _drop #1
      008B47 C7 00            [ 2]    1     addw sp,##1 
      008B49 0C 81            [ 1] 1887 	push #16  ; BASE=16
      008B4B F7               [ 1] 1888 2$:	ld (x),a 
      008B4B 52               [ 2] 1889 	incw x 
      008B4C 02 4F 6B         [ 4] 1890 	ld a,([in.w],y)
      008B4F 01 5C 00 01      [ 1] 1891 	inc in 
      008B50 CD 0D B3         [ 4] 1892 	call to_upper 
      008B50 91 D6            [ 1] 1893 	ld (TCHAR,sp),a 
      008B52 01 27 24         [ 4] 1894 	call is_digit 
      008B55 72 5C            [ 1] 1895 	jrc 2$
      008B57 00 02            [ 1] 1896 	ld a,#16 
      008B59 6B 02            [ 1] 1897 	cp a,(BASE,sp)
      008B5B A6 5C            [ 1] 1898 	jrne 3$ 
      008B5D 11 01            [ 1] 1899 	ld a,(TCHAR,sp)
      008B5F 26 0A            [ 1] 1900 	cp a,#'A 
      008B61 0F 01            [ 1] 1901 	jrmi 3$ 
      008B63 7B 02            [ 1] 1902 	cp a,#'G 
      008B65 AD 1C            [ 1] 1903 	jrmi 2$ 
      008B67 F7 5C 20 E5      [ 1] 1904 3$: dec in 	
      008B6B 7F               [ 1] 1905     clr (x)
      008B6B 7B 02            [ 2] 1906 	ldw x,(XSAVE,sp)
      008B6D A1 5C 27         [ 4] 1907 	call atoi24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B70 DD A1            [ 1] 1908 	ldw y,x 
      008B72 22 27 04         [ 2] 1909 	ldw x,acc16 
      008B75 F7 5C            [ 1] 1910 	ld a,#TK_INTGR
      008B77 20 D7            [ 2] 1911 	ldw (y),x 
      008B79 72 A9 00 02      [ 2] 1912 	addw y,#2
      000B67                       1913 	_drop VSIZE  
      008B79 7F 5C            [ 2]    1     addw sp,#VSIZE 
      008B7B 90               [ 4] 1914 	ret 	
                                   1915 
                                   1916 ;-------------------------
                                   1917 ; binary integer parser
                                   1918 ; build integer in acc24  
                                   1919 ; input:
                                   1920 ;   X 		point to output buffer  
                                   1921 ;   Y 		point to tib 
                                   1922 ;   A 	    '&' 
                                   1923 ; output:  
                                   1924 ;   buffer  TK_INTGR integer  
                                   1925 ;   X 		int16 
                                   1926 ;   A 		TK_INTGR
                                   1927 ;   acc24    int24 
                                   1928 ;-------------------------
                           000001  1929 	BINARY=1 ; 24 bits integer 
                           000003  1930 	VSIZE=3
      000B6A                       1931 parse_binary: ; { -- n }
      008B7C 93 5F            [ 1] 1932 	push #0
      008B7E A6 02            [ 1] 1933 	push #0
      008B80 5B 02            [ 1] 1934 	push #0
      000B70                       1935 2$:	
      008B82 81 D6 00         [ 4] 1936 	ld a,([in.w],y)
      008B83 72 5C 00 01      [ 1] 1937 	inc in 
      008B83 89 AE            [ 1] 1938 	cp a,#'0 
      008B85 8B 98            [ 1] 1939 	jreq 3$
      008B87 F1 27            [ 1] 1940 	cp a,#'1 
      008B89 06 7D            [ 1] 1941 	jreq 3$ 
      008B8B 27 09            [ 2] 1942 	jra bin_exit 
      008B8D 5C 20            [ 1] 1943 3$: sub a,#'0 
      008B8F F7               [ 1] 1944 	rrc a
      008B90 1D 8B            [ 1] 1945 	rlc (BINARY+2,sp) 
      008B92 98 9F            [ 1] 1946 	rlc (BINARY+1,sp)
      008B94 AB 07            [ 1] 1947 	rlc (BINARY,sp) 
      008B96 85 81            [ 2] 1948 	jra 2$  
      000B8C                       1949 bin_exit:
      008B98 61 62 74 6E      [ 1] 1950 	dec in 
      008B9C 76 66            [ 1] 1951 	ldw y,x
      008B9E 72 00            [ 1] 1952 	ld a,(BINARY,sp)
      008BA0 C7 00 0B         [ 1] 1953 	ld acc24,a 
      008BA0 89 4B            [ 2] 1954 	ldw x,(BINARY+1,sp)
      008BA2 00 4B 0A         [ 2] 1955 	ldw acc16,x
      008BA5 A1 24            [ 2] 1956 	ldw (y),x 
      008BA7 26 04 5B 01      [ 2] 1957 	addw y,#2  
      008BAB 4B 10            [ 1] 1958 	ld a,#TK_INTGR 	
      000BA4                       1959 	_drop VSIZE 
      008BAD F7 5C            [ 2]    1     addw sp,#VSIZE 
      008BAF 91               [ 4] 1960 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1961 
                                   1962 ;---------------------------
                                   1963 ;  token begin with a letter,
                                   1964 ;  is keyword or variable. 	
                                   1965 ; input:
                                   1966 ;   X 		point to pad 
                                   1967 ;   Y 		point to text
                                   1968 ;   A 	    first letter  
                                   1969 ; output:
                                   1970 ;   X		exec_addr|var_addr 
                                   1971 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   1972 ;   pad 	keyword|var_name  
                                   1973 ;--------------------------  
                           000001  1974 	XFIRST=1
                           000002  1975 	VSIZE=2
      000BA7                       1976 parse_keyword: 
      008BB0 D6               [ 2] 1977 	pushw x 
      000BA8                       1978 kw_loop:	
      008BB1 01 72 5C         [ 4] 1979 	call to_upper 
      008BB4 00               [ 1] 1980 	ld (x),a 
      008BB5 02               [ 2] 1981 	incw x 
      008BB6 CD 8E 33         [ 4] 1982 	ld a,([in.w],y)
      008BB9 6B 02 CD 86      [ 1] 1983 	inc in 
      008BBD 02 25 ED         [ 4] 1984 	call is_alpha 
      008BC0 A6 10            [ 1] 1985 	jrc kw_loop
      008BC2 11 01 26 0A      [ 1] 1986 	dec in   
      008BC6 7B               [ 1] 1987 1$: clr (x)
      008BC7 02 A1            [ 2] 1988 	ldw x,(XFIRST,sp) 
      008BC9 41 2B            [ 1] 1989 	ld a,(1,x)
      008BCB 04 A1            [ 1] 1990 	jrne 2$
                                   1991 ; one letter variable name 
      008BCD 47               [ 1] 1992 	ld a,(x) 
      008BCE 2B DD            [ 1] 1993 	sub a,#'A 
      008BD0 72               [ 1] 1994 	sll a 
      008BD1 5A               [ 1] 1995 	push a 
      008BD2 00 02            [ 1] 1996 	push #0
      008BD4 7F 1E 03         [ 2] 1997 	ldw x,#vars 
      008BD7 CD 8E 3F         [ 2] 1998 	addw x,(1,sp) ; X=var address 
      000BD1                       1999 	_drop 2 
      008BDA 90 93            [ 2]    1     addw sp,#2 
      008BDC CE 00            [ 1] 2000 	ld a,#TK_VAR 
      008BDE 0D A6            [ 2] 2001 	jra 4$ 
      000BD7                       2002 2$: ; check for keyword, otherwise syntax error.
      000BD7                       2003 	_ldx_dict kword_dict ; dictionary entry point
      008BE0 84 90 FF         [ 2]    1     ldw x,#kword_dict+2
      008BE3 72 A9            [ 2] 2004 	ldw y,(XFIRST,sp) ; name to search for
      008BE5 00 02 5B         [ 4] 2005 	call search_dict
      008BE8 04               [ 1] 2006 	tnz a
      008BE9 81 03            [ 1] 2007 	jrne 4$ 
      008BEA CC 08 7D         [ 2] 2008 	jp syntax_error
      000BE5                       2009 4$:	
      008BEA 4B 00            [ 2] 2010 	ldw y,(XFIRST,sp)
      008BEC 4B 00            [ 1] 2011 	ld (y),a 
      008BEE 4B 00            [ 2] 2012 	incw y 
      008BF0 90 FF            [ 2] 2013 	ldw (y),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BF0 91 D6 01 72      [ 2] 2014 	addw y,#2  
      000BF1                       2015 	_drop VSIZE 
      008BF4 5C 00            [ 2]    1     addw sp,#VSIZE 
      008BF6 02               [ 4] 2016 	ret  	
                                   2017 
                                   2018 
                                   2019 ;------------------------------------
                                   2020 ; scan text for next token
                                   2021 ; input: 
                                   2022 ;	X 		pointer to buffer where 
                                   2023 ;	        token id and value are copied 
                                   2024 ; use:
                                   2025 ;	Y   pointer to text in tib 
                                   2026 ; output:
                                   2027 ;   A       token attribute 
                                   2028 ;   X 		token value
                                   2029 ;   Y       updated position in output buffer   
                                   2030 ;------------------------------------
                                   2031 	; use to check special character 
                                   2032 	.macro _case c t  
                                   2033 	ld a,#c 
                                   2034 	cp a,(TCHAR,sp) 
                                   2035 	jrne t
                                   2036 	.endm 
                                   2037 
                           000001  2038 	TCHAR=1
                           000002  2039 	ATTRIB=2
                           000002  2040 	VSIZE=2
      000BF4                       2041 get_token: 
      000BF4                       2042 	_vars VSIZE
      008BF7 A1 30            [ 2]    1     sub sp,#VSIZE 
                                   2043 ;	ld a,in 
                                   2044 ;	sub a,count
                                   2045 ;   jrmi 0$
                                   2046 ;	clr a 
                                   2047 ;	ret 
      000BF6                       2048 0$: 
      008BF9 27 06 A1 31      [ 2] 2049 	ldw y,#tib    	
      008BFD 27 02            [ 1] 2050 	ld a,#SPACE
      008BFF 20 0B A0         [ 4] 2051 	call skip
      008C02 30 46 09 03 09   [ 1] 2052 	mov in.saved,in 
      008C07 02 09 01         [ 4] 2053 	ld a,([in.w],y)
      008C0A 20 E4            [ 1] 2054 	jrne 1$
      008C0C 90 93            [ 1] 2055 	ldw y,x 
      008C0C 72 5A 00         [ 2] 2056 	jp token_exit ; end of line 
      008C0F 02 90 93 7B      [ 1] 2057 1$:	inc in 
      008C13 01 C7 00         [ 4] 2058 	call to_upper 
      008C16 0C 1E            [ 1] 2059 	ld (TCHAR,sp),a 
                                   2060 ; check for quoted string
      000C17                       2061 str_tst:  	
      000C17                       2062 	_case '"' nbr_tst
      008C18 02 CF            [ 1]    1 	ld a,#'"' 
      008C1A 00 0D            [ 1]    2 	cp a,(TCHAR,sp) 
      008C1C 90 FF            [ 1]    3 	jrne nbr_tst
      008C1E 72 A9            [ 1] 2063 	ld a,#TK_QSTR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C20 00               [ 1] 2064 	ld (x),a 
      008C21 02               [ 2] 2065 	incw x 
      008C22 A6 84 5B         [ 4] 2066 	call parse_quote
      008C25 03 81 B0         [ 2] 2067 	jp token_exit
      008C27                       2068 nbr_tst:
                                   2069 ; check for hexadecimal number 
      008C27 89 24            [ 1] 2070 	ld a,#'$'
      008C28 11 01            [ 1] 2071 	cp a,(TCHAR,sp) 
      008C28 CD 8E            [ 1] 2072 	jreq 1$
                                   2073 ;check for binary number 
      008C2A 33 F7            [ 1] 2074 	ld a,#'&
      008C2C 5C 91            [ 1] 2075 	cp a,(TCHAR,sp)
      008C2E D6 01            [ 1] 2076 	jrne 0$
      008C30 72 5C            [ 1] 2077 	ld a,#TK_INTGR
      008C32 00               [ 1] 2078 	ld (x),a 
      008C33 02               [ 2] 2079 	incw x 
      008C34 CD 85 F1         [ 4] 2080 	call parse_binary ; expect binary integer 
      008C37 25 EF 72         [ 2] 2081 	jp token_exit 
                                   2082 ; check for decimal number 	
      008C3A 5A 00            [ 1] 2083 0$:	ld a,(TCHAR,sp)
      008C3C 02 7F 1E         [ 4] 2084 	call is_digit
      008C3F 01 E6            [ 1] 2085 	jrnc 3$
      008C41 01 26            [ 1] 2086 1$:	ld a,#TK_INTGR 
      008C43 13               [ 1] 2087 	ld (x),a 
      008C44 F6               [ 2] 2088 	incw x 
      008C45 A0 41            [ 1] 2089 	ld a,(TCHAR,sp)
      008C47 48 88 4B         [ 4] 2090 	call parse_integer 
      008C4A 00 AE 00         [ 2] 2091 	jp token_exit 
      000C50                       2092 3$: 
      000C50                       2093 	_case '(' bkslsh_tst 
      008C4D 30 72            [ 1]    1 	ld a,#'(' 
      008C4F FB 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C51 5B 02            [ 1]    3 	jrne bkslsh_tst
      008C53 A6 85            [ 1] 2094 	ld a,#TK_LPAREN
      008C55 20 0E AC         [ 2] 2095 	jp token_char   	
      008C57                       2096 bkslsh_tst: ; character token 
      000C5B                       2097 	_case '\',rparnt_tst
      008C57 AE A7            [ 1]    1 	ld a,#'\' 
      008C59 7E 16            [ 1]    2 	cp a,(TCHAR,sp) 
      008C5B 01 CD            [ 1]    3 	jrne rparnt_tst
      008C5D 90 6B            [ 1] 2098 	ld a,#TK_CHAR 
      008C5F 4D               [ 1] 2099 	ld (x),a 
      008C60 26               [ 2] 2100 	incw x 
      008C61 03 CC 88         [ 4] 2101 	ld a,([in.w],y)
      008C64 FD               [ 1] 2102 	ld (x),a 
      008C65 5C               [ 2] 2103 	incw x
      008C65 16 01            [ 1] 2104 	ldw y,x 	 
      008C67 90 F7 90 5C      [ 1] 2105 	inc in  
      008C6B 90               [ 1] 2106 	clrw x 
      008C6C FF               [ 1] 2107 	ld xl,a 
      008C6D 72 A9            [ 1] 2108 	ld a,#TK_CHAR 
      008C6F 00 02 5B         [ 2] 2109 	jp token_exit 
      000C77                       2110 rparnt_tst:		
      000C77                       2111 	_case ')' colon_tst 
      008C72 02 81            [ 1]    1 	ld a,#')' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C74 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C74 52 02            [ 1]    3 	jrne colon_tst
      008C76 A6 08            [ 1] 2112 	ld a,#TK_RPAREN 
      008C76 90 AE 16         [ 2] 2113 	jp token_char
      000C82                       2114 colon_tst:
      000C82                       2115 	_case ':' comma_tst 
      008C79 90 A6            [ 1]    1 	ld a,#':' 
      008C7B 20 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008C7D 8E A9            [ 1]    3 	jrne comma_tst
      008C7F 55 00            [ 1] 2116 	ld a,#TK_COLON 
      008C81 02 00 03         [ 2] 2117 	jp token_char  
      000C8D                       2118 comma_tst:
      000C8D                       2119 	_case COMMA sharp_tst 
      008C84 91 D6            [ 1]    1 	ld a,#COMMA 
      008C86 01 26            [ 1]    2 	cp a,(TCHAR,sp) 
      008C88 05 90            [ 1]    3 	jrne sharp_tst
      008C8A 93 CC            [ 1] 2120 	ld a,#TK_COMMA
      008C8C 8E 30 72         [ 2] 2121 	jp token_char
      000C98                       2122 sharp_tst:
      000C98                       2123 	_case SHARP dash_tst 
      008C8F 5C 00            [ 1]    1 	ld a,#SHARP 
      008C91 02 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008C93 8E 33            [ 1]    3 	jrne dash_tst
      008C95 6B 01            [ 1] 2124 	ld a,#TK_SHARP
      008C97 CC 0D AC         [ 2] 2125 	jp token_char  	 	 
      000CA3                       2126 dash_tst: 	
      000CA3                       2127 	_case '-' at_tst 
      008C97 A6 22            [ 1]    1 	ld a,#'-' 
      008C99 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C9B 26 0A            [ 1]    3 	jrne at_tst
      008C9D A6 02            [ 1] 2128 	ld a,#TK_MINUS  
      008C9F F7 5C CD         [ 2] 2129 	jp token_char 
      000CAE                       2130 at_tst:
      000CAE                       2131 	_case '@' qmark_tst 
      008CA2 8B 4B            [ 1]    1 	ld a,#'@' 
      008CA4 CC 8E            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA6 30 05            [ 1]    3 	jrne qmark_tst
      008CA7 A6 06            [ 1] 2132 	ld a,#TK_ARRAY 
      008CA7 A6 24 11         [ 2] 2133 	jp token_char
      000CB9                       2134 qmark_tst:
      000CB9                       2135 	_case '?' tick_tst 
      008CAA 01 27            [ 1]    1 	ld a,#'?' 
      008CAC 17 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008CAE 26 11            [ 1]    3 	jrne tick_tst
      008CB0 01 26            [ 1] 2136 	ld a,#TK_CMD  
      008CB2 0A               [ 1] 2137 	ld (x),a 
      008CB3 A6               [ 2] 2138 	incw x 
      008CB4 84 F7            [ 1] 2139 	ldw y,x 
      008CB6 5C CD 8B         [ 2] 2140 	ldw x,#PRT_IDX 
      008CB9 EA CC            [ 2] 2141 	ldw (y),x 
      008CBB 8E 30 7B 01      [ 2] 2142 	addw y,#2
      008CBF CD 86 02         [ 2] 2143 	jp token_exit
      000CD1                       2144 tick_tst: ; comment 
      000CD1                       2145 	_case TICK plus_tst 
      008CC2 24 0C            [ 1]    1 	ld a,#TICK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CC4 A6 84            [ 1]    2 	cp a,(TCHAR,sp) 
      008CC6 F7 5C            [ 1]    3 	jrne plus_tst
      008CC8 7B 01            [ 1] 2146 	ld a,#TK_CMD
      008CCA CD               [ 1] 2147 	ld (x),a 
      008CCB 8B               [ 2] 2148 	incw x
      008CCC A0 CC 8E 30      [ 2] 2149 	ldw y,#REM_IDX
      008CD0 FF               [ 2] 2150 	ldw (x),y 
      008CD0 A6 28 11         [ 2] 2151 	addw x,#2  
      000CE3                       2152 copy_comment:
      008CD3 01 26 05 A6      [ 2] 2153 	ldw y,#tib 
      008CD7 07 CC 8E 2C      [ 2] 2154 	addw y,in.w
      008CDB 90 89            [ 2] 2155 	pushw y
      008CDB A6 5C 11         [ 4] 2156 	call strcpy
      008CDE 01 26 16         [ 2] 2157     subw y,(1,sp)
      008CE1 A6 03            [ 1] 2158 	ld a,yl 
      008CE3 F7 5C 91         [ 1] 2159 	add a,in
      008CE6 D6 01 F7         [ 1] 2160 	ld in,a 
      008CE9 5C 90            [ 2] 2161 	ldw (1,sp),x
      008CEB 93 72 5C         [ 2] 2162 	addw y,(1,sp)
      008CEE 00 02            [ 2] 2163 	incw y 
      000D02                       2164 	_drop 2 
      008CF0 5F 97            [ 2]    1     addw sp,#2 
      008CF2 A6 03 CC         [ 2] 2165 	ldw x,#REM_IDX 
      008CF5 8E 30            [ 1] 2166 	ld a,#TK_CMD 
      008CF7 CC 0D B0         [ 2] 2167 	jp token_exit 
      000D0C                       2168 plus_tst:
      000D0C                       2169 	_case '+' star_tst 
      008CF7 A6 29            [ 1]    1 	ld a,#'+' 
      008CF9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CFB 26 05            [ 1]    3 	jrne star_tst
      008CFD A6 08            [ 1] 2170 	ld a,#TK_PLUS  
      008CFF CC 8E 2C         [ 2] 2171 	jp token_char 
      008D02                       2172 star_tst:
      000D17                       2173 	_case '*' slash_tst 
      008D02 A6 3A            [ 1]    1 	ld a,#'*' 
      008D04 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D06 26 05            [ 1]    3 	jrne slash_tst
      008D08 A6 01            [ 1] 2174 	ld a,#TK_MULT 
      008D0A CC 8E 2C         [ 2] 2175 	jp token_char 
      008D0D                       2176 slash_tst: 
      000D22                       2177 	_case '/' prcnt_tst 
      008D0D A6 2C            [ 1]    1 	ld a,#'/' 
      008D0F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D11 26 05            [ 1]    3 	jrne prcnt_tst
      008D13 A6 09            [ 1] 2178 	ld a,#TK_DIV 
      008D15 CC 8E 2C         [ 2] 2179 	jp token_char 
      008D18                       2180 prcnt_tst:
      000D2D                       2181 	_case '%' eql_tst 
      008D18 A6 23            [ 1]    1 	ld a,#'%' 
      008D1A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D1C 26 05            [ 1]    3 	jrne eql_tst
      008D1E A6 0A            [ 1] 2182 	ld a,#TK_MOD
      008D20 CC 8E 2C         [ 2] 2183 	jp token_char  
                                   2184 ; 1 or 2 character tokens 	
      008D23                       2185 eql_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      000D38                       2186 	_case '=' gt_tst 		
      008D23 A6 2D            [ 1]    1 	ld a,#'=' 
      008D25 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D27 26 05            [ 1]    3 	jrne gt_tst
      008D29 A6 11            [ 1] 2187 	ld a,#TK_EQUAL
      008D2B CC 8E 2C         [ 2] 2188 	jp token_char 
      008D2E                       2189 gt_tst:
      000D43                       2190 	_case '>' lt_tst 
      008D2E A6 40            [ 1]    1 	ld a,#'>' 
      008D30 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D32 26 05            [ 1]    3 	jrne lt_tst
      008D34 A6 06            [ 1] 2191 	ld a,#TK_GT 
      008D36 CC 8E            [ 1] 2192 	ld (ATTRIB,sp),a 
      008D38 2C D6 00         [ 4] 2193 	ld a,([in.w],y)
      008D39 72 5C 00 01      [ 1] 2194 	inc in 
      008D39 A6 3F            [ 1] 2195 	cp a,#'=
      008D3B 11 01            [ 1] 2196 	jrne 1$
      008D3D 26 12            [ 1] 2197 	ld a,#TK_GE 
      008D3F A6 80            [ 2] 2198 	jra token_char  
      008D41 F7 5C            [ 1] 2199 1$: cp a,#'<
      008D43 90 93            [ 1] 2200 	jrne 2$
      008D45 AE 00            [ 1] 2201 	ld a,#TK_NE 
      008D47 74 90            [ 2] 2202 	jra token_char 
      008D49 FF 72 A9 00      [ 1] 2203 2$: dec in
      008D4D 02 CC            [ 1] 2204 	ld a,(ATTRIB,sp)
      008D4F 8E 30            [ 2] 2205 	jra token_char 	 
      008D51                       2206 lt_tst:
      000D6C                       2207 	_case '<' other
      008D51 A6 27            [ 1]    1 	ld a,#'<' 
      008D53 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D55 26 35            [ 1]    3 	jrne other
      008D57 A6 80            [ 1] 2208 	ld a,#TK_LT 
      008D59 F7 5C            [ 1] 2209 	ld (ATTRIB,sp),a 
      008D5B 90 AE 00         [ 4] 2210 	ld a,([in.w],y)
      008D5E 8E FF 1C 00      [ 1] 2211 	inc in 
      008D62 02 3D            [ 1] 2212 	cp a,#'=
      008D63 26 04            [ 1] 2213 	jrne 1$
      008D63 90 AE            [ 1] 2214 	ld a,#TK_LE 
      008D65 16 90            [ 2] 2215 	jra token_char 
      008D67 72 B9            [ 1] 2216 1$: cp a,#'>
      008D69 00 01            [ 1] 2217 	jrne 2$
      008D6B 90 89            [ 1] 2218 	ld a,#TK_NE 
      008D6D CD 84            [ 2] 2219 	jra token_char 
      008D6F 32 72 F2 01      [ 1] 2220 2$: dec in 
      008D73 90 9F            [ 1] 2221 	ld a,(ATTRIB,sp)
      008D75 CB 00            [ 2] 2222 	jra token_char 	
      000D95                       2223 other: ; not a special character 	 
      008D77 02 C7            [ 1] 2224 	ld a,(TCHAR,sp)
      008D79 00 02 1F         [ 4] 2225 	call is_alpha 
      008D7C 01 72            [ 1] 2226 	jrc 30$ 
      008D7E F9 01 90         [ 2] 2227 	jp syntax_error 
      000D9F                       2228 30$: 
      008D81 5C 5B 02         [ 4] 2229 	call parse_keyword
      008D84 AE 00 8E         [ 2] 2230 	cpw x,#remark 
      008D87 A6 80            [ 1] 2231 	jrne token_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D89 CC 8E            [ 1] 2232 	ldw y,x 
      008D8B 30 0C E3         [ 2] 2233 	jp copy_comment 
      008D8C                       2234 token_char:
      008D8C A6               [ 1] 2235 	ld (x),a 
      008D8D 2B               [ 2] 2236 	incw x
      008D8E 11 01            [ 1] 2237 	ldw y,x 
      000DB0                       2238 token_exit:
      000DB0                       2239 	_drop VSIZE 
      008D90 26 05            [ 2]    1     addw sp,#VSIZE 
      008D92 A6               [ 4] 2240 	ret
                                   2241 
                                   2242 
                                   2243 ;------------------------------------
                                   2244 ; convert alpha to uppercase
                                   2245 ; input:
                                   2246 ;    a  character to convert
                                   2247 ; output:
                                   2248 ;    a  uppercase character
                                   2249 ;------------------------------------
      000DB3                       2250 to_upper::
      008D93 10 CC            [ 1] 2251 	cp a,#'a
      008D95 8E 2C            [ 1] 2252 	jrpl 1$
      008D97 81               [ 4] 2253 0$:	ret
      008D97 A6 2A            [ 1] 2254 1$: cp a,#'z	
      008D99 11 01            [ 1] 2255 	jrugt 0$
      008D9B 26 05            [ 1] 2256 	sub a,#32
      008D9D A6               [ 4] 2257 	ret
                                   2258 	
                                   2259 ;------------------------------------
                                   2260 ; convert pad content in integer
                                   2261 ; input:
                                   2262 ;    x		.asciz to convert
                                   2263 ; output:
                                   2264 ;    acc24      int24_t
                                   2265 ;------------------------------------
                                   2266 	; local variables
                           000001  2267 	SIGN=1 ; 1 byte, 
                           000002  2268 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2269 	TEMP=3 ; 1 byte, temporary storage
                           000003  2270 	VSIZE=3 ; 3 bytes reserved for local storage
      000DBF                       2271 atoi24::
      008D9E 20               [ 2] 2272 	pushw x 
      000DC0                       2273 	_vars VSIZE
      008D9F CC 8E            [ 2]    1     sub sp,#VSIZE 
                                   2274 	; acc24=0 
      008DA1 2C 5F 00 0B      [ 1] 2275 	clr acc24    
      008DA2 72 5F 00 0C      [ 1] 2276 	clr acc16
      008DA2 A6 2F 11 01      [ 1] 2277 	clr acc8 
      008DA6 26 05            [ 1] 2278 	clr (SIGN,sp)
      008DA8 A6 21            [ 1] 2279 	ld a,#10
      008DAA CC 8E            [ 1] 2280 	ld (BASE,sp),a ; default base decimal
      008DAC 2C               [ 1] 2281 	ld a,(x)
      008DAD 27 47            [ 1] 2282 	jreq 9$  ; completed if 0
      008DAD A6 25            [ 1] 2283 	cp a,#'-
      008DAF 11 01            [ 1] 2284 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008DB1 26 05            [ 1] 2285 	cpl (SIGN,sp)
      008DB3 A6 22            [ 2] 2286 	jra 2$
      008DB5 CC 8E            [ 1] 2287 1$: cp a,#'$
      008DB7 2C 06            [ 1] 2288 	jrne 3$
      008DB8 A6 10            [ 1] 2289 	ld a,#16
      008DB8 A6 3D            [ 1] 2290 	ld (BASE,sp),a
      008DBA 11               [ 2] 2291 2$:	incw x
      008DBB 01               [ 1] 2292 	ld a,(x)
      000DE9                       2293 3$:	
      008DBC 26 05            [ 1] 2294 	cp a,#'a
      008DBE A6 32            [ 1] 2295 	jrmi 4$
      008DC0 CC 8E            [ 1] 2296 	sub a,#32
      008DC2 2C 30            [ 1] 2297 4$:	cp a,#'0
      008DC3 2B 2B            [ 1] 2298 	jrmi 9$
      008DC3 A6 3E            [ 1] 2299 	sub a,#'0
      008DC5 11 01            [ 1] 2300 	cp a,#10
      008DC7 26 23            [ 1] 2301 	jrmi 5$
      008DC9 A6 31            [ 1] 2302 	sub a,#7
      008DCB 6B 02            [ 1] 2303 	cp a,(BASE,sp)
      008DCD 91 D6            [ 1] 2304 	jrpl 9$
      008DCF 01 72            [ 1] 2305 5$:	ld (TEMP,sp),a
      008DD1 5C 00            [ 1] 2306 	ld a,(BASE,sp)
      008DD3 02 A1 3D         [ 4] 2307 	call mulu24_8
      008DD6 26 04            [ 1] 2308 	ld a,(TEMP,sp)
      008DD8 A6 33 20         [ 1] 2309 	add a,acc24+2
      008DDB 50 A1 3C         [ 1] 2310 	ld acc24+2,a
      008DDE 26               [ 1] 2311 	clr a
      008DDF 04 A6 35         [ 1] 2312 	adc a,acc24+1
      008DE2 20 48 72         [ 1] 2313 	ld acc24+1,a
      008DE5 5A               [ 1] 2314 	clr a
      008DE6 00 02 7B         [ 1] 2315 	adc a,acc24
      008DE9 02 20 40         [ 1] 2316 	ld acc24,a
      008DEC 20 C9            [ 2] 2317 	jra 2$
      008DEC A6 3C            [ 1] 2318 9$:	tnz (SIGN,sp)
      008DEE 11 01            [ 1] 2319     jreq atoi_exit
      008DF0 26 23 A6         [ 4] 2320     call neg_acc24
      000E25                       2321 atoi_exit: 
      000E25                       2322 	_drop VSIZE
      008DF3 34 6B            [ 2]    1     addw sp,#VSIZE 
      008DF5 02               [ 2] 2323 	popw x ; restore x
      008DF6 91               [ 4] 2324 	ret
                                   2325 
                                   2326 
                                   2327 ;------------------------------------
                                   2328 ; skip character c in text starting from 'in'
                                   2329 ; input:
                                   2330 ;	 y 		point to text buffer
                                   2331 ;    a 		character to skip
                                   2332 ; output:  
                                   2333 ;	'in' ajusted to new position
                                   2334 ;------------------------------------
                           000001  2335 	C = 1 ; local var
      000E29                       2336 skip:
      008DF7 D6               [ 1] 2337 	push a
      008DF8 01 72 5C         [ 4] 2338 1$:	ld a,([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DFB 00 02            [ 1] 2339 	jreq 2$
      008DFD A1 3D            [ 1] 2340 	cp a,(C,sp)
      008DFF 26 04            [ 1] 2341 	jrne 2$
      008E01 A6 36 20 27      [ 1] 2342 	inc in
      008E05 A1 3E            [ 2] 2343 	jra 1$
      000E39                       2344 2$: _drop 1 
      008E07 26 04            [ 2]    1     addw sp,#1 
      008E09 A6               [ 4] 2345 	ret
                                   2346 	
                                   2347 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2348 ;;   TINY BASIC  operators,
                                   2349 ;;   commands and functions 
                                   2350 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2351 
                                   2352 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2353 ;;  Arithmetic operators
                                   2354 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2355 
                                   2356 ;debug support
                           000001  2357 DEBUG_PRT=1
                           000001  2358 .if DEBUG_PRT 
                           000001  2359 	REGA=1
                           000002  2360 	SAVEB=2
                           000003  2361 	REGX=3
                           000005  2362 	REGY=5
                           000007  2363 	ACC24=7
                           000009  2364 	VSIZE=9 
      000E3C                       2365 printxy:
      000E3C                       2366 	_vars VSIZE 
      008E0A 35 20            [ 2]    1     sub sp,#VSIZE 
      008E0C 1F 72            [ 1] 2367 	ld (REGA,sp),a 
      008E0E 5A 00 02         [ 1] 2368 	ld a,base 
      008E11 7B 02            [ 1] 2369 	ld (SAVEB,sp),a
      008E13 20 17            [ 2] 2370 	ldw (REGX,sp),x
      008E15 17 05            [ 2] 2371 	ldw (REGY,sp),y
      008E15 7B 01 CD         [ 2] 2372 	ldw x,acc24 
      008E18 85 F1 25         [ 1] 2373 	ld a,acc8 
      008E1B 03 CC            [ 2] 2374 	ldw (ACC24,sp),x 
      008E1D 88 FD            [ 1] 2375 	ld (ACC24+2,sp),a 
      008E1F 35 10 00 0A      [ 1] 2376 	mov base,#16 
      008E1F CD               [ 1] 2377 	clrw x 
      008E20 8C 27            [ 1] 2378 	ld a,(REGA,sp)
      008E22 A3               [ 1] 2379 	ld xl,a 
      008E23 96 A8 26         [ 4] 2380 	call print_int
      008E26 09 90            [ 1] 2381 	ld a,#SPACE 
      008E28 93 CC 8D         [ 4] 2382 	call putc  
      008E2B 63 03            [ 2] 2383 	ldw x,(REGX,sp)
      008E2C CD 09 D0         [ 4] 2384 	call print_int 
      008E2C F7 5C            [ 1] 2385 	ld a,#SPACE 
      008E2E 90 93 C0         [ 4] 2386 	call putc  
      008E30 1E 05            [ 2] 2387 	ldw x,(REGY,sp)
      008E30 5B 02 81         [ 4] 2388 	call print_int 
      008E33 A6 0D            [ 1] 2389 	ld a,#CR 
      008E33 A1 61 2A         [ 4] 2390 	call putc 
      008E36 01 81            [ 1] 2391 	ld a,(ACC24+2,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E38 A1 7A            [ 2] 2392 	ldw x,(ACC24,sp)
      008E3A 22 FB A0         [ 2] 2393 	ldw acc24,x 
      008E3D 20 81 0D         [ 1] 2394 	ld acc8,a
      008E3F 7B 02            [ 1] 2395 	ld a,(SAVEB,sp)
      008E3F 89 52 03         [ 1] 2396 	ld base,a 
      008E42 72 5F            [ 1] 2397 	ld a,(REGA,sp)
      008E44 00 0C            [ 2] 2398 	ldw x,(REGX,sp)
      008E46 72 5F            [ 2] 2399 	ldw y,(REGY,sp)
      000E8C                       2400 	_drop VSIZE 
      008E48 00 0D            [ 2]    1     addw sp,#VSIZE 
      008E4A 72               [ 4] 2401 	ret 
                                   2402 .endif 
                                   2403 
                                   2404 
                                   2405 ;--------------------------------------
                                   2406 ;  multiply 2 uint16_t return uint32_t
                                   2407 ;  input:
                                   2408 ;     x       uint16_t 
                                   2409 ;     y       uint16_t 
                                   2410 ;  output:
                                   2411 ;     x       product bits 15..0
                                   2412 ;     y       product bits 31..16 
                                   2413 ;---------------------------------------
                           000001  2414 		U1=1  ; uint16_t 
                           000003  2415 		DBL=3 ; uint32_t
                           000006  2416 		VSIZE=6
      000E8F                       2417 umstar:
      000E8F                       2418 	_vars VSIZE 
      008E4B 5F 00            [ 2]    1     sub sp,#VSIZE 
      008E4D 0E 0F            [ 2] 2419 	ldw (U1,sp),x 
                                   2420 ;initialize bits 31..16 of 
                                   2421 ;product to zero 
      008E4F 01 A6            [ 1] 2422 	clr (DBL,sp)
      008E51 0A 6B            [ 1] 2423 	clr (DBL+1,sp)
                                   2424 ; produc U1L*U2L 
      008E53 02 F6            [ 1] 2425 	ld a,yl 
      008E55 27               [ 4] 2426 	mul x,a 
      008E56 47 A1            [ 2] 2427 	ldw (DBL+2,sp),x
                                   2428 ; product U1H*U2L 
      008E58 2D 26            [ 1] 2429 	ld a,(U1,sp) ; xh 
      008E5A 04               [ 1] 2430 	ldw x,y
      008E5B 03               [ 4] 2431 	mul x,a 
      008E5C 01               [ 1] 2432 	clr a 
      008E5D 20 08 A1         [ 2] 2433 	addw x,(DBL+1,sp) 
      008E60 24               [ 1] 2434 	clr a 
      008E61 26 06            [ 1] 2435 	adc a,(DBL,sp) 
      008E63 A6 10            [ 1] 2436 	ld (DBL,sp),a ; bits 23..17 
      008E65 6B 02            [ 2] 2437 	ldw (DBL+1,sp),x ; bits 15..0 
                                   2438 ; product U1L*U2H
      008E67 5C F6            [ 1] 2439 	swapw y 
      008E69 93               [ 1] 2440 	ldw x,y
      008E69 A1 61            [ 1] 2441 	ld a,(U1+1,sp)
      008E6B 2B               [ 4] 2442 	mul x,a
      008E6C 02 A0 20         [ 2] 2443 	addw x,(DBL+1,sp)
      008E6F A1               [ 1] 2444 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E70 30 2B            [ 1] 2445 	adc a,(DBL,sp)
      008E72 2B A0            [ 1] 2446 	ld (DBL,sp),a 
      008E74 30 A1            [ 2] 2447 	ldw (DBL+1,sp),x 
                                   2448 ; product U1H*U2H 	
      008E76 0A 2B            [ 1] 2449 	ld a,(U1,sp)
      008E78 06               [ 1] 2450 	ldw x,y  
      008E79 A0               [ 4] 2451 	mul x,a 
      008E7A 07 11 02         [ 2] 2452 	addw x,(DBL,sp)
      008E7D 2A 1F            [ 1] 2453 	ldw y,x 
      008E7F 6B 03            [ 2] 2454 	ldw x,(DBL+2,sp)
      000EC6                       2455 	_drop VSIZE 
      008E81 7B 02            [ 2]    1     addw sp,#VSIZE 
      008E83 CD               [ 4] 2456 	ret
                                   2457 
                                   2458 
                                   2459 ;-------------------------------------
                                   2460 ; multiply 2 integers
                                   2461 ; input:
                                   2462 ;  	x       n1 
                                   2463 ;   y 		n2 
                                   2464 ; output:
                                   2465 ;	X        N1*N2 bits 15..0
                                   2466 ;   Y        N1*N2 bits 31..16 
                                   2467 ;-------------------------------------
                           000001  2468 	SIGN=1
                           000001  2469 	VSIZE=1
      000EC9                       2470 multiply:
      000EC9                       2471 	_vars VSIZE 
      008E84 8A EE            [ 2]    1     sub sp,#VSIZE 
      008E86 7B 03            [ 1] 2472 	clr (SIGN,sp)
      008E88 CB               [ 1] 2473 	ld a,xh 
      008E89 00 0E            [ 1] 2474 	and a,#0x80
      008E8B C7 00            [ 1] 2475 	jrpl 1$
      008E8D 0E 4F            [ 1] 2476 	cpl (SIGN,sp)
      008E8F C9               [ 2] 2477 	negw x 
      000ED5                       2478 1$:	
      008E90 00 0D            [ 1] 2479 	ld a,yh
      008E92 C7 00            [ 1] 2480 	and a,#0x80  
      008E94 0D 4F            [ 1] 2481 	jrpl 2$ 
      008E96 C9 00            [ 1] 2482 	cpl (SIGN,sp)
      008E98 0C C7            [ 2] 2483 	negw y 
      000EDF                       2484 2$:	
      008E9A 00 0C 20         [ 4] 2485 	call umstar
      008E9D C9 0D            [ 1] 2486 	ld a,(SIGN,sp)
      008E9F 01 27            [ 1] 2487 	jreq 3$
      008EA1 03 CD 8B         [ 4] 2488 	call dneg 
      000EE9                       2489 3$:	
      000EE9                       2490 	_drop VSIZE 
      008EA4 28 01            [ 2]    1     addw sp,#VSIZE 
      008EA5 81               [ 4] 2491 	ret
                                   2492 
                                   2493 ;--------------------------------------
                                   2494 ; divide uint32_t/uint16_t
                                   2495 ; return:  quotient and remainder 
                                   2496 ; quotient expected to be uint16_t 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2497 ; input:
                                   2498 ;   DBLDIVDND    on stack 
                                   2499 ;   X            divisor 
                                   2500 ; output:
                                   2501 ;   X            quotient 
                                   2502 ;   Y            remainder 
                                   2503 ;---------------------------------------
                           000003  2504 	VSIZE=3
      000EEC                       2505 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000EEC                       2506 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   2507 	; local variables 
                           000001  2508 	DIVISOR=1 
                           000003  2509 	CNTR=3 
      000EEC                       2510 udiv32_16:
      000EEC                       2511 	_vars VSIZE 
      008EA5 5B 03            [ 2]    1     sub sp,#VSIZE 
      008EA7 85 81            [ 2] 2512 	ldw (DIVISOR,sp),x	; save divisor 
      008EA9 1E 08            [ 2] 2513 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008EA9 88 91            [ 2] 2514 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008EAB D6 01            [ 2] 2515 	tnzw y
      008EAD 27 0A            [ 1] 2516 	jrne long_division 
      008EAF 11 01            [ 2] 2517 	ldw y,(DIVISOR,sp)
      008EB1 26               [ 2] 2518 	divw x,y
      000EFB                       2519 	_drop VSIZE 
      008EB2 06 72            [ 2]    1     addw sp,#VSIZE 
      008EB4 5C               [ 4] 2520 	ret
      000EFE                       2521 long_division:
      008EB5 00               [ 1] 2522 	exgw x,y ; hi in x, lo in y 
      008EB6 02 20            [ 1] 2523 	ld a,#17 
      008EB8 F1 5B            [ 1] 2524 	ld (CNTR,sp),a
      000F03                       2525 1$:
      008EBA 01 81            [ 2] 2526 	cpw x,(DIVISOR,sp)
      008EBC 2B 03            [ 1] 2527 	jrmi 2$
      008EBC 52 09 6B         [ 2] 2528 	subw x,(DIVISOR,sp)
      008EBF 01               [ 1] 2529 2$:	ccf 
      008EC0 C6 00            [ 2] 2530 	rlcw y 
      008EC2 0B               [ 2] 2531 	rlcw x 
      008EC3 6B 02            [ 1] 2532 	dec (CNTR,sp)
      008EC5 1F 03            [ 1] 2533 	jrne 1$
      008EC7 17               [ 1] 2534 	exgw x,y 
      000F13                       2535 	_drop VSIZE 
      008EC8 05 CE            [ 2]    1     addw sp,#VSIZE 
      008ECA 00               [ 4] 2536 	ret
                                   2537 
                                   2538 ;-----------------------------
                                   2539 ; negate double int.
                                   2540 ; input:
                                   2541 ;   x     bits 15..0
                                   2542 ;   y     bits 31..16
                                   2543 ; output: 
                                   2544 ;   x     bits 15..0
                                   2545 ;   y     bits 31..16
                                   2546 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      000F16                       2547 dneg:
      008ECB 0C               [ 2] 2548 	cplw x 
      008ECC C6 00            [ 2] 2549 	cplw y 
      008ECE 0E 1F 07         [ 2] 2550 	addw x,#1 
      008ED1 6B 09            [ 1] 2551 	jrnc 1$
      008ED3 35 10            [ 2] 2552 	incw y 
      008ED5 00               [ 4] 2553 1$: ret 
                                   2554 
                                   2555 
                                   2556 ;--------------------------------
                                   2557 ; sign extend single to double
                                   2558 ; input:
                                   2559 ;   x    int16_t
                                   2560 ; output:
                                   2561 ;   x    int32_t bits 15..0
                                   2562 ;   y    int32_t bits 31..16
                                   2563 ;--------------------------------
      000F21                       2564 dbl_sign_extend:
      008ED6 0B 5F            [ 1] 2565 	clrw y
      008ED8 7B               [ 1] 2566 	ld a,xh 
      008ED9 01 97            [ 1] 2567 	and a,#0x80 
      008EDB CD 8A            [ 1] 2568 	jreq 1$
      008EDD 50 A6            [ 2] 2569 	cplw y
      008EDF 20               [ 4] 2570 1$: ret 	
                                   2571 
                                   2572 
                                   2573 ;----------------------------------
                                   2574 ;  euclidian divide dbl/n1 
                                   2575 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   2576 ; input:
                                   2577 ;    dbl    int32_t on stack 
                                   2578 ;    x 		n1   int16_t  disivor  
                                   2579 ; output:
                                   2580 ;    X      dbl/x  int16_t 
                                   2581 ;    Y      remainder int16_t 
                                   2582 ;----------------------------------
                           000008  2583 	VSIZE=8
      000F2B                       2584 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000F2B                       2585 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000F2B                       2586 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   2587 	; local variables
                           000001  2588 	DBLHI=1
                           000003  2589 	DBLLO=3 
                           000005  2590 	SDIVSR=5 ; sign divisor
                           000006  2591 	SQUOT=6 ; sign dividend 
                           000007  2592 	DIVISR=7 ; divisor 
      000F2B                       2593 div32_16:
      000F2B                       2594 	_vars VSIZE 
      008EE0 CD 83            [ 2]    1     sub sp,#VSIZE 
      008EE2 40 1E            [ 1] 2595 	clr (SDIVSR,sp)
      008EE4 03 CD            [ 1] 2596 	clr (SQUOT,sp)
                                   2597 ; copy arguments 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008EE6 8A 50            [ 2] 2598 	ldw y,(DIVDNDHI,sp)
      008EE8 A6 20            [ 2] 2599 	ldw (DBLHI,sp),y
      008EEA CD 83            [ 2] 2600 	ldw y,(DIVDNDLO,sp)
      008EEC 40 1E            [ 2] 2601 	ldw (DBLLO,sp),y 
                                   2602 ; check for 0 divisor
      008EEE 05               [ 2] 2603 	tnzw x 
      008EEF CD 8A            [ 1] 2604     jrne 0$
      008EF1 50 A6            [ 1] 2605 	ld a,#ERR_DIV0 
      008EF3 0D CD 83         [ 2] 2606 	jp tb_error 
                                   2607 ; check divisor sign 	
      008EF6 40               [ 1] 2608 0$:	ld a,xh 
      008EF7 7B 09            [ 1] 2609 	and a,#0x80 
      008EF9 1E 07            [ 1] 2610 	jreq 1$
      008EFB CF 00            [ 1] 2611 	cpl (SDIVSR,sp)
      008EFD 0C C7            [ 1] 2612 	cpl (SQUOT,sp)
      008EFF 00               [ 2] 2613 	negw x
      008F00 0E 7B            [ 2] 2614 1$:	ldw (DIVISR,sp),x
                                   2615 ; check dividend sign 	 
      008F02 02 C7            [ 1] 2616  	ld a,(DBLHI,sp) 
      008F04 00 0B            [ 1] 2617 	and a,#0x80 
      008F06 7B 01            [ 1] 2618 	jreq 2$ 
      008F08 1E 03            [ 1] 2619 	cpl (SQUOT,sp)
      008F0A 16 05            [ 2] 2620 	ldw x,(DBLLO,sp)
      008F0C 5B 09            [ 2] 2621 	ldw y,(DBLHI,sp)
      008F0E 81 0F 16         [ 4] 2622 	call dneg 
      008F0F 1F 03            [ 2] 2623 	ldw (DBLLO,sp),x 
      008F0F 52 06            [ 2] 2624 	ldw (DBLHI,sp),y 
      008F11 1F 01            [ 2] 2625 2$:	ldw x,(DIVISR,sp)
      008F13 0F 03 0F         [ 4] 2626 	call udiv32_16
      008F16 04 90            [ 2] 2627 	tnzw y 
      008F18 9F 42            [ 1] 2628 	jreq 3$ 
                                   2629 ; x=quotient 
                                   2630 ; y=remainder 
                                   2631 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008F1A 1F 05            [ 1] 2632 	ld a,(SQUOT,sp)
      008F1C 7B 01            [ 1] 2633 	xor a,(SDIVSR,sp)
      008F1E 93 42            [ 1] 2634 	jreq 3$
      008F20 4F               [ 2] 2635 	incw x 
      008F21 72 FB 04 4F      [ 2] 2636 	ldw acc16,y 
      008F25 19 03            [ 2] 2637 	ldw y,(DIVISR,sp)
      008F27 6B 03 1F 04      [ 2] 2638 	subw y,acc16
                                   2639 ; sign quotient
      008F2B 90 5E            [ 1] 2640 3$:	ld a,(SQUOT,sp)
      008F2D 93 7B            [ 1] 2641 	jreq 4$
      008F2F 02               [ 2] 2642 	negw x 
      000F7F                       2643 4$:	
      000F7F                       2644 	_drop VSIZE 
      008F30 42 72            [ 2]    1     addw sp,#VSIZE 
      008F32 FB               [ 4] 2645 	ret 
                                   2646 
                                   2647 
                                   2648 
                                   2649 ;----------------------------------
                                   2650 ; division x/y 
                                   2651 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2652 ;    X       dividend
                                   2653 ;    Y       divisor 
                                   2654 ; output:
                                   2655 ;    X       quotient
                                   2656 ;    Y       remainder 
                                   2657 ;-----------------------------------
                           000004  2658 	VSIZE=4 
                                   2659 	; local variables 
                           000001  2660 	DBLHI=1
                           000003  2661 	DBLLO=3
      000F82                       2662 divide: 
      000F82                       2663 	_vars VSIZE 
      008F33 04 4F            [ 2]    1     sub sp,#VSIZE 
      008F35 19 03 6B 03      [ 2] 2664 	ldw acc16,y
      008F39 1F 04 7B         [ 4] 2665 	call dbl_sign_extend
      008F3C 01 93            [ 2] 2666 	ldw (DBLLO,sp),x 
      008F3E 42 72            [ 2] 2667 	ldw (DBLHI,sp),y 
      008F40 FB 03 90         [ 2] 2668 	ldw x,acc16 
      008F43 93 1E 05         [ 4] 2669 	call div32_16 
      000F95                       2670 	_drop VSIZE 
      008F46 5B 06            [ 2]    1     addw sp,#VSIZE 
      008F48 81               [ 4] 2671 	ret
                                   2672 
                                   2673 
                                   2674 ;----------------------------------
                                   2675 ;  remainder resulting from euclidian 
                                   2676 ;  division of x/y 
                                   2677 ; input:
                                   2678 ;   x   	dividend int16_t 
                                   2679 ;   y 		divisor int16_t
                                   2680 ; output:
                                   2681 ;   X       n1%n2 
                                   2682 ;----------------------------------
      008F49                       2683 modulo:
      008F49 52 01 0F         [ 4] 2684 	call divide
      008F4C 01               [ 1] 2685 	ldw x,y 
      008F4D 9E               [ 4] 2686 	ret 
                                   2687 
                                   2688 ;----------------------------------
                                   2689 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2690 ; return expr1*expr2/expr3 
                                   2691 ; product result is int32_t and 
                                   2692 ; divisiont is int32_t/int16_t
                                   2693 ;----------------------------------
                           000004  2694 	DBL_SIZE=4 
      000F9D                       2695 muldiv:
      008F4E A4 80 2A         [ 4] 2696 	call func_args 
      008F51 03 03            [ 1] 2697 	cp a,#3 
      008F53 01 50            [ 1] 2698 	jreq 1$
      008F55 CC 08 7D         [ 2] 2699 	jp syntax_error
      000FA7                       2700 1$: 
      008F55 90 9E            [ 2] 2701 	ldw x,(5,sp) ; expr1
      008F57 A4 80            [ 2] 2702 	ldw y,(3,sp) ; expr2
      008F59 2A 04 03         [ 4] 2703 	call multiply 
      008F5C 01 90            [ 2] 2704 	ldw (5,sp),x  ;int32_t 15..0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F5E 50 03            [ 2] 2705 	ldw (3,sp),y  ;int32_t 31..16
      008F5F 85               [ 2] 2706 	popw x        ; expr3 
      008F5F CD 8F 0F         [ 4] 2707 	call div32_16 ; int32_t/expr3 
      000FB6                       2708 	_drop DBL_SIZE
      008F62 7B 01            [ 2]    1     addw sp,#DBL_SIZE 
      008F64 27               [ 4] 2709 	ret 
                                   2710 
                                   2711 
                                   2712 ;----------------------------------
                                   2713 ; search in kword_dict name
                                   2714 ; from its execution address 
                                   2715 ; input:
                                   2716 ;   X       	cmd_index 
                                   2717 ; output:
                                   2718 ;   X 			cstr*  | 0 
                                   2719 ;--------------------------------
                           000001  2720 	CMDX=1 
                           000003  2721 	LINK=3 
                           000004  2722 	VSIZE=4
      000FB9                       2723 cmd_name:
      000FB9                       2724 	_vars VSIZE 
      008F65 03 CD            [ 2]    1     sub sp,#VSIZE 
      008F67 8F 96 00 0C      [ 1] 2725 	clr acc16 
      008F69 1F 01            [ 2] 2726 	ldw (CMDX,sp),x  
      008F69 5B 01 81         [ 2] 2727 	ldw x,#kword_dict	
      008F6C 1F 03            [ 2] 2728 1$:	ldw (LINK,sp),x
      008F6C 52 03            [ 1] 2729 	ld a,(2,x)
      008F6E 1F 01            [ 1] 2730 	and a,#15 
      008F70 1E 08 16         [ 1] 2731 	ld acc8,a 
      008F73 06 90 5D         [ 2] 2732 	addw x,#3
      008F76 26 06 16 01      [ 2] 2733 	addw x,acc16
      008F7A 65               [ 2] 2734 	ldw x,(x) ; command index  
      008F7B 5B 03            [ 2] 2735 	cpw x,(CMDX,sp)
      008F7D 81 0A            [ 1] 2736 	jreq 2$
      008F7E 1E 03            [ 2] 2737 	ldw x,(LINK,sp)
      008F7E 51               [ 2] 2738 	ldw x,(x) 
      008F7F A6 11 6B         [ 2] 2739 	subw x,#2  
      008F82 03 E3            [ 1] 2740 	jrne 1$
      008F83 20 05            [ 2] 2741 	jra 9$
      008F83 13 01            [ 2] 2742 2$: ldw x,(LINK,sp)
      008F85 2B 03 72         [ 2] 2743 	addw x,#2 	
      000FE8                       2744 9$:	_drop VSIZE
      008F88 F0 01            [ 2]    1     addw sp,#VSIZE 
      008F8A 8C               [ 4] 2745 	ret
                                   2746 
                                   2747 
                                   2748 ;---------------------------------
                                   2749 ; dictionary search 
                                   2750 ; input:
                                   2751 ;	X 		dictionary entry point, name field  
                                   2752 ;   y		.asciz name to search 
                                   2753 ; output:
                                   2754 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2755 ;  X		cmd_index ; execution address | 0 
                                   2756 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                           000001  2757 	NLEN=1 ; cmd length 
                           000002  2758 	XSAVE=2
                           000004  2759 	YSAVE=4
                           000005  2760 	VSIZE=5 
      000FEB                       2761 search_dict:
      000FEB                       2762 	_vars VSIZE 
      008F8B 90 59            [ 2]    1     sub sp,#VSIZE 
                                   2763 
      008F8D 59 0A            [ 2] 2764 	ldw (YSAVE,sp),y 
      000FEF                       2765 search_next:
      008F8F 03 26            [ 2] 2766 	ldw (XSAVE,sp),x 
                                   2767 ; get name length in dictionary	
      008F91 F1               [ 1] 2768 	ld a,(x)
      008F92 51 5B            [ 1] 2769 	and a,#0xf 
      008F94 03 81            [ 1] 2770 	ld (NLEN,sp),a  
      008F96 16 04            [ 2] 2771 	ldw y,(YSAVE,sp) ; name pointer 
      008F96 53               [ 2] 2772 	incw x 
      000FF9                       2773 cp_loop:
      008F97 90 53            [ 1] 2774 	ld a,(y)
      008F99 1C 00            [ 1] 2775 	jreq str_match 
      008F9B 01 24            [ 1] 2776 	tnz (NLEN,sp)
      008F9D 02 90            [ 1] 2777 	jreq no_match  
      008F9F 5C               [ 1] 2778 	cp a,(x)
      008FA0 81 07            [ 1] 2779 	jrne no_match 
      008FA1 90 5C            [ 2] 2780 	incw y 
      008FA1 90               [ 2] 2781 	incw x
      008FA2 5F 9E            [ 1] 2782 	dec (NLEN,sp)
      008FA4 A4 80            [ 2] 2783 	jra cp_loop 
      00100B                       2784 no_match:
      008FA6 27 02            [ 2] 2785 	ldw x,(XSAVE,sp) 
      008FA8 90 53 81         [ 2] 2786 	subw x,#2 ; move X to link field
      008FAB 4B 00            [ 1] 2787 	push #TK_NONE 
      008FAB 52               [ 2] 2788 	ldw x,(x) ; next word link 
      008FAC 08               [ 1] 2789 	pop a ; TK_NONE 
      008FAD 0F 05            [ 1] 2790 	jreq search_exit  ; not found  
                                   2791 ;try next 
      008FAF 0F 06            [ 2] 2792 	jra search_next
      001018                       2793 str_match:
      008FB1 16 0B            [ 2] 2794 	ldw x,(XSAVE,sp)
      008FB3 17               [ 1] 2795 	ld a,(X)
      008FB4 01 16            [ 1] 2796 	ld (NLEN,sp),a ; needed to test keyword type  
      008FB6 0D 17            [ 1] 2797 	and a,#0xf 
                                   2798 ; move x to procedure address field 	
      008FB8 03               [ 1] 2799 	inc a 
      008FB9 5D 26 05         [ 1] 2800 	ld acc8,a 
      008FBC A6 04 CC 88      [ 1] 2801 	clr acc16 
      008FC0 FF 9E A4 80      [ 2] 2802 	addw x,acc16 
      008FC4 27               [ 2] 2803 	ldw x,(x) ; routine index  
                                   2804 ;determine keyword type bits 7:6 
      008FC5 05 03            [ 1] 2805 	ld a,(NLEN,sp)
      008FC7 05               [ 1] 2806 	swap a 
      008FC8 03 06            [ 1] 2807 	and a,#0xc
      008FCA 50               [ 1] 2808 	srl a
      008FCB 1F               [ 1] 2809 	srl a 
      008FCC 07 7B            [ 1] 2810 	add a,#128
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      001035                       2811 search_exit: 
      001035                       2812 	_drop VSIZE 	 
      008FCE 01 A4            [ 2]    1     addw sp,#VSIZE 
      008FD0 80               [ 4] 2813 	ret 
                                   2814 
                                   2815 ;---------------------
                                   2816 ; check if next token
                                   2817 ;  is of expected type 
                                   2818 ; input:
                                   2819 ;   A 		 expected token attribute
                                   2820 ;  ouput:
                                   2821 ;   none     if fail call syntax_error 
                                   2822 ;--------------------
      001038                       2823 expect:
      008FD1 27               [ 1] 2824 	push a 
      008FD2 0D 03 06         [ 4] 2825 	call next_token 
      008FD5 1E 03            [ 1] 2826 	cp a,(1,sp)
      008FD7 16 01            [ 1] 2827 	jreq 1$
      008FD9 CD 8F 96         [ 2] 2828 	jp syntax_error
      008FDC 1F               [ 1] 2829 1$: pop a 
      008FDD 03               [ 4] 2830 	ret 
                                   2831 
                                   2832 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2833 ; parse arguments list 
                                   2834 ; between ()
                                   2835 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001045                       2836 func_args:
      008FDE 17 01            [ 1] 2837 	ld a,#TK_LPAREN 
      008FE0 1E 07 CD         [ 4] 2838 	call expect 
                                   2839 ; expected to continue in arg_list 
                                   2840 ; caller must check for TK_RPAREN 
                                   2841 
                                   2842 ;-------------------------------
                                   2843 ; parse embedded BASIC routines 
                                   2844 ; arguments list.
                                   2845 ; arg_list::=  rel[','rel]*
                                   2846 ; all arguments are of integer type
                                   2847 ; and pushed on stack 
                                   2848 ; input:
                                   2849 ;   none
                                   2850 ; output:
                                   2851 ;   stack{n}   arguments pushed on stack
                                   2852 ;   A 	number of arguments pushed on stack  
                                   2853 ;--------------------------------
      00104A                       2854 arg_list:
      008FE3 8F 6C            [ 1] 2855 	push #0  
      008FE5 90 5D 27         [ 4] 2856 1$: call relation
      008FE8 11 7B            [ 1] 2857 	cp a,#TK_NONE 
      008FEA 06 18            [ 1] 2858 	jreq 5$
      008FEC 05 27            [ 1] 2859 	cp a,#TK_INTGR
      008FEE 0B 5C            [ 1] 2860 	jrne 4$
      001057                       2861 3$: 
                                   2862 ; swap return address with argument
      008FF0 90               [ 1] 2863 	pop a ; arg_count
      008FF1 CF 00            [ 2] 2864 	popw y ; return address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008FF3 0D               [ 2] 2865 	pushw x ; new argument 
      008FF4 16 07            [ 2] 2866 	pushw y 
      008FF6 72               [ 1] 2867     inc a
      008FF7 B2               [ 1] 2868 	push a 
      008FF8 00 0D 7B         [ 4] 2869 	call next_token 
      008FFB 06 27            [ 1] 2870 	cp a,#TK_COMMA 
      008FFD 01 50            [ 1] 2871 	jreq 1$ 
      008FFF A1 00            [ 1] 2872 	cp a,#TK_NONE 
      008FFF 5B 08            [ 1] 2873 	jreq 5$ 
      009001 81 08            [ 1] 2874 4$:	cp a,#TK_RPAREN 
      009002 27 05            [ 1] 2875 	jreq 5$
      00106E                       2876 	_unget_token 
      009002 52 04 90 CF 00   [ 1]    1      mov in,in.saved  
      009007 0D               [ 1] 2877 5$:	pop a  
      009008 CD               [ 4] 2878 	ret 
                                   2879 
                                   2880 ;--------------------------------
                                   2881 ;   BASIC commnands 
                                   2882 ;--------------------------------
                                   2883 
                                   2884 ;--------------------------------
                                   2885 ;  arithmetic and relational 
                                   2886 ;  routines
                                   2887 ;  operators precedence
                                   2888 ;  highest to lowest
                                   2889 ;  operators on same row have 
                                   2890 ;  same precedence and are executed
                                   2891 ;  from left to right.
                                   2892 ;	'*','/','%'
                                   2893 ;   '-','+'
                                   2894 ;   '=','>','<','>=','<=','<>','><'
                                   2895 ;   '<>' and '><' are equivalent for not equal.
                                   2896 ;--------------------------------
                                   2897 
                                   2898 ;---------------------
                                   2899 ; return array element
                                   2900 ; address from @(expr)
                                   2901 ; input:
                                   2902 ;   A 		TK_ARRAY
                                   2903 ; output:
                                   2904 ;   A 		TK_INTGR
                                   2905 ;	X 		element address 
                                   2906 ;----------------------
      001075                       2907 get_array_element:
      009009 8F A1 1F         [ 4] 2908 	call func_args 
      00900C 03 17            [ 1] 2909 	cp a,#1
      00900E 01 CE            [ 1] 2910 	jreq 1$
      009010 00 0D CD         [ 2] 2911 	jp syntax_error
      009013 8F               [ 2] 2912 1$: popw x 
                                   2913 	; check for bounds 
      009014 AB 5B 04         [ 2] 2914 	cpw x,array_size 
      009017 81 05            [ 2] 2915 	jrule 3$
                                   2916 ; bounds {1..array_size}	
      009018 A6 0A            [ 1] 2917 2$: ld a,#ERR_BAD_VALUE 
      009018 CD 90 02         [ 2] 2918 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00901B 93               [ 2] 2919 3$: tnzw  x
      00901C 81 F8            [ 1] 2920 	jreq 2$ 
      00901D 58               [ 2] 2921 	sllw x 
      00901D CD               [ 2] 2922 	pushw x 
      00901E 90 C5 A1         [ 2] 2923 	ldw x,#tib
      009021 03 27 03         [ 2] 2924 	subw x,(1,sp)
      001095                       2925 	_drop 2   
      009024 CC 88            [ 2]    1     addw sp,#2 
      009026 FD 84            [ 1] 2926 	ld a,#TK_INTGR
      009027 81               [ 4] 2927 	ret 
                                   2928 
                                   2929 
                                   2930 ;***********************************
                                   2931 ;   expression parse,execute 
                                   2932 ;***********************************
                                   2933 ;-----------------------------------
                                   2934 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2935 ;			 integer | function |
                                   2936 ;			 '('relation')' 
                                   2937 ; output:
                                   2938 ;   A    token attribute 
                                   2939 ;   X 	 integer
                                   2940 ; ---------------------------------
                           000001  2941 	NEG=1
                           000001  2942 	VSIZE=1
      00109A                       2943 factor:
      00109A                       2944 	_vars VSIZE 
      009027 1E 05            [ 2]    1     sub sp,#VSIZE 
      009029 16 03 CD         [ 4] 2945 	call next_token
      00902C 8F 49            [ 1] 2946 	cp a,#CMD_END  
      00902E 1F 05            [ 1] 2947 	jrult 16$
      009030 17 03            [ 1] 2948 1$:	ld (NEG,sp),a 
      009032 85 CD            [ 1] 2949 	and a,#TK_GRP_MASK
      009034 8F AB            [ 1] 2950 	cp a,#TK_GRP_ADD 
      009036 5B 04            [ 1] 2951 	jreq 2$
      009038 81 01            [ 1] 2952 	ld a,(NEG,sp)
      009039 20 03            [ 2] 2953 	jra 4$  
      0010AF                       2954 2$:	
      009039 52 04 72         [ 4] 2955 	call next_token 
      0010B2                       2956 4$:	
      00903C 5F 00            [ 1] 2957 	cp a,#TK_IFUNC 
      00903E 0D 1F            [ 1] 2958 	jrne 5$ 
      009040 01               [ 4] 2959 	call (x) 
      009041 AE A7            [ 2] 2960 	jra 18$ 
      0010B9                       2961 5$:
      009043 7C 1F            [ 1] 2962 	cp a,#TK_INTGR
      009045 03 E6            [ 1] 2963 	jrne 6$
      009047 02 A4            [ 2] 2964 	jra 18$
      0010BF                       2965 6$:
      009049 0F C7            [ 1] 2966 	cp a,#TK_ARRAY
      00904B 00 0E            [ 1] 2967 	jrne 10$
      00904D 1C 00 03         [ 4] 2968 	call get_array_element
      009050 72               [ 2] 2969 	ldw x,(x)
      009051 BB 00            [ 2] 2970 	jra 18$ 
      0010C9                       2971 10$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009053 0D FE            [ 1] 2972 	cp a,#TK_VAR 
      009055 13 01            [ 1] 2973 	jrne 12$
      009057 27               [ 2] 2974 	ldw x,(x)
      009058 0A 1E            [ 2] 2975 	jra 18$
      0010D0                       2976 12$:			
      00905A 03 FE            [ 1] 2977 	cp a,#TK_LPAREN
      00905C 1D 00            [ 1] 2978 	jrne 16$
      00905E 02 26 E3         [ 4] 2979 	call relation
      009061 20               [ 2] 2980 	pushw x 
      009062 05 1E            [ 1] 2981 	ld a,#TK_RPAREN 
      009064 03 1C 00         [ 4] 2982 	call expect
      009067 02               [ 2] 2983 	popw x 
      009068 5B 04            [ 2] 2984 	jra 18$	
      0010E0                       2985 16$:
      00906A 81               [ 1] 2986 	tnz a 
      00906B 27 11            [ 1] 2987 	jreq 20$ 
      0010E3                       2988 	_unget_token
      00906B 52 05 17 04 01   [ 1]    1      mov in,in.saved  
      00906F 4F               [ 1] 2989 	clr a 
      00906F 1F 02            [ 2] 2990 	jra 20$ 
      0010EB                       2991 18$: 
      009071 F6 A4            [ 1] 2992 	ld a,#TK_MINUS 
      009073 0F 6B            [ 1] 2993 	cp a,(NEG,sp)
      009075 01 16            [ 1] 2994 	jrne 19$
      009077 04               [ 2] 2995 	negw x
      0010F2                       2996 19$:
      009078 5C 84            [ 1] 2997 	ld a,#TK_INTGR
      009079                       2998 20$:
      0010F4                       2999 	_drop VSIZE
      009079 90 F6            [ 2]    1     addw sp,#VSIZE 
      00907B 27               [ 4] 3000 	ret
                                   3001 
                                   3002 ;-----------------------------------
                                   3003 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3004 ; output:
                                   3005 ;   A    	token attribute 
                                   3006 ;	X		integer
                                   3007 ;-----------------------------------
                           000001  3008 	N1=1   ; int16_t
                           000003  3009 	MULOP=3
                           000003  3010 	VSIZE=3
      0010F7                       3011 term:
      0010F7                       3012 	_vars VSIZE
      00907C 1B 0D            [ 2]    1     sub sp,#VSIZE 
      00907E 01 27 0A         [ 4] 3013 	call factor
      009081 F1               [ 1] 3014 	tnz a 
      009082 26 07            [ 1] 3015 	jreq term_exit 
      0010FF                       3016 term01:	 ; check for  operator 
      009084 90 5C            [ 2] 3017 	ldw (N1,sp),x  ; save first factor 
      009086 5C 0A 01         [ 4] 3018 	call next_token
      009089 20 EE            [ 1] 3019 	ld (MULOP,sp),a
      00908B A1 02            [ 1] 3020 	cp a,#CMD_END
      00908B 1E 02            [ 1] 3021 	jrult 8$
      00908D 1D 00            [ 1] 3022 	and a,#TK_GRP_MASK
      00908F 02 4B            [ 1] 3023 	cp a,#TK_GRP_MULT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      009091 00 FE            [ 1] 3024 	jreq 1$
      009093 84 27            [ 2] 3025 	jra 8$
      001112                       3026 1$:	; got *|/|%
      009095 1F 20 D7         [ 4] 3027 	call factor
      009098 A1 84            [ 1] 3028 	cp a,#TK_INTGR
      009098 1E 02            [ 1] 3029 	jreq 2$
      00909A F6 6B 01         [ 2] 3030 	jp syntax_error
      00909D A4 0F            [ 1] 3031 2$:	ldw y,x 
      00909F 4C C7            [ 2] 3032 	ldw x,(N1,sp)
      0090A1 00 0E            [ 1] 3033 	ld a,(MULOP,sp) 
      0090A3 72 5F            [ 1] 3034 	cp a,#TK_MULT 
      0090A5 00 0D            [ 1] 3035 	jrne 3$
      0090A7 72 BB 00         [ 4] 3036 	call multiply 
      0090AA 0D FE            [ 2] 3037 	jra term01
      0090AC 7B 01            [ 1] 3038 3$: cp a,#TK_DIV 
      0090AE 4E A4            [ 1] 3039 	jrne 4$ 
      0090B0 0C 44 44         [ 4] 3040 	call divide 
      0090B3 AB 80            [ 2] 3041 	jra term01 
      0090B5 CD 0F 98         [ 4] 3042 4$: call modulo
      0090B5 5B 05            [ 2] 3043 	jra term01 
      0090B7 81 03            [ 1] 3044 8$: ld a,(MULOP,sp)
      0090B8 27 05            [ 1] 3045 	jreq 9$ 
      00113D                       3046 	_unget_token
      0090B8 88 CD 89 EF 11   [ 1]    1      mov in,in.saved  
      0090BD 01 27            [ 2] 3047 9$: ldw x,(N1,sp)
      0090BF 03 CC            [ 1] 3048 	ld a,#TK_INTGR 	
      001146                       3049 term_exit:
      001146                       3050 	_drop VSIZE 
      0090C1 88 FD            [ 2]    1     addw sp,#VSIZE 
      0090C3 84               [ 4] 3051 	ret 
                                   3052 
                                   3053 ;-------------------------------
                                   3054 ;  expr ::= term [['+'|'-'] term]*
                                   3055 ;  result range {-32768..32767}
                                   3056 ;  output:
                                   3057 ;   A    token attribute 
                                   3058 ;   X	 integer   
                                   3059 ;-------------------------------
                           000001  3060 	N1=1 
                           000003  3061 	OP=3 
                           000003  3062 	VSIZE=3 
      001149                       3063 expression:
      001149                       3064 	_vars VSIZE 
      0090C4 81 03            [ 2]    1     sub sp,#VSIZE 
      0090C5 CD 10 F7         [ 4] 3065 	call term
      0090C5 A6               [ 1] 3066 	tnz a 
      0090C6 07 CD            [ 1] 3067 	jreq expr_exit 
      0090C8 90 B8            [ 2] 3068 1$:	ldw (N1,sp),x 
      0090CA CD 09 6F         [ 4] 3069 	call next_token
      0090CA 4B 00            [ 1] 3070 	ld (OP,sp),a 
      0090CC CD 92            [ 1] 3071 	cp a,#CMD_END 
      0090CE 15 A1            [ 1] 3072 	jrult 8$ 
      0090D0 00 27            [ 1] 3073 	and a,#TK_GRP_MASK
      0090D2 20 A1            [ 1] 3074 	cp a,#TK_GRP_ADD 
      0090D4 84 26            [ 1] 3075 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0090D6 13 21            [ 2] 3076 	jra 8$
      0090D7                       3077 2$: 
      0090D7 84 90 85         [ 4] 3078 	call term
      0090DA 89 90            [ 1] 3079 	cp a,#TK_INTGR
      0090DC 89 4C            [ 1] 3080 	jreq 3$
      0090DE 88 CD 89         [ 2] 3081 	jp syntax_error
      0090E1 EF A1 09         [ 2] 3082 3$:	ldw acc16,x 
      0090E4 27 E6            [ 2] 3083 	ldw x,(N1,sp)
      0090E6 A1 00            [ 1] 3084 	ld a,(OP,sp)
      0090E8 27 09            [ 1] 3085 	cp a,#TK_PLUS 
      0090EA A1 08            [ 1] 3086 	jrne 4$
      0090EC 27 05 55 00      [ 2] 3087 	addw x,acc16
      0090F0 03 00            [ 2] 3088 	jra 1$ 
      0090F2 02 84 81 0C      [ 2] 3089 4$:	subw x,acc16
      0090F5 20 CC            [ 2] 3090 	jra 1$
      0090F5 CD 90            [ 1] 3091 8$: ld a,(OP,sp)
      0090F7 C5 A1            [ 1] 3092 	jreq 9$ 
      001189                       3093 	_unget_token	
      0090F9 01 27 03 CC 88   [ 1]    1      mov in,in.saved  
      0090FE FD 85            [ 2] 3094 9$: ldw x,(N1,sp)
      009100 C3 00            [ 1] 3095 	ld a,#TK_INTGR	
      001192                       3096 expr_exit:
      001192                       3097 	_drop VSIZE 
      009102 22 23            [ 2]    1     addw sp,#VSIZE 
      009104 05               [ 4] 3098 	ret 
                                   3099 
                                   3100 ;---------------------------------------------
                                   3101 ; rel ::= expr rel_op expr
                                   3102 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3103 ;  relation return  integer , zero is false 
                                   3104 ;  output:
                                   3105 ;    A 		token attribute  
                                   3106 ;	 X		integer 
                                   3107 ;---------------------------------------------
                           000001  3108 	N1=1
                           000003  3109 	RELOP=3
                           000003  3110 	VSIZE=3 
      001195                       3111 relation: 
      001195                       3112 	_vars VSIZE
      009105 A6 0A            [ 2]    1     sub sp,#VSIZE 
      009107 CC 88 FF         [ 4] 3113 	call expression
      00910A 5D               [ 1] 3114 	tnz a 
      00910B 27 F8            [ 1] 3115 	jreq rel_exit
      00910D 58 89            [ 2] 3116 	ldw (N1,sp),x 
                                   3117 ; expect rel_op or leave 
      00910F AE 16 90         [ 4] 3118 	call next_token 
      009112 72 F0            [ 1] 3119 	ld (RELOP,sp),a 
      009114 01 5B            [ 1] 3120 	and a,#TK_GRP_MASK
      009116 02 A6            [ 1] 3121 	cp a,#TK_GRP_RELOP 
      009118 84 81            [ 1] 3122 	jrne 8$
      00911A                       3123 2$:	; expect another expression
      00911A 52 01 CD         [ 4] 3124 	call expression
      00911D 89 EF            [ 1] 3125 	cp a,#TK_INTGR
      00911F A1 02            [ 1] 3126 	jreq 3$
      009121 25 3D 6B         [ 2] 3127 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009124 01 A4 30         [ 2] 3128 3$:	ldw acc16,x 
      009127 A1 10            [ 2] 3129 	ldw x,(N1,sp) 
      009129 27 04 7B 01      [ 2] 3130 	subw x,acc16
      00912D 20 03            [ 1] 3131 	jrne 4$
      00912F 35 02 00 0D      [ 1] 3132 	mov acc8,#2 ; n1==n2
      00912F CD 89            [ 2] 3133 	jra 6$ 
      0011C5                       3134 4$: 
      009131 EF 06            [ 1] 3135 	jrsgt 5$  
      009132 35 04 00 0D      [ 1] 3136 	mov acc8,#4 ; n1<2 
      009132 A1 81            [ 2] 3137 	jra 6$
      0011CD                       3138 5$:
      009134 26 03 FD 20      [ 1] 3139 	mov acc8,#1 ; n1>n2 
      0011D1                       3140 6$:
      009138 32               [ 1] 3141 	clrw x 
      009139 C6 00 0D         [ 1] 3142 	ld a, acc8  
      009139 A1 84            [ 1] 3143 	and a,(RELOP,sp)
      00913B 26               [ 1] 3144 	tnz a 
      00913C 02 20            [ 1] 3145 	jreq 10$
      00913E 2C               [ 2] 3146 	incw x 
      00913F 20 0B            [ 2] 3147 	jra 10$  	
      00913F A1 06            [ 1] 3148 8$: ld a,(RELOP,sp)
      009141 26 06            [ 1] 3149 	jreq 9$
      0011E1                       3150 	_unget_token
      009143 CD 90 F5 FE 20   [ 1]    1      mov in,in.saved  
      0011E6                       3151 9$: 
      009148 22 01            [ 2] 3152 	ldw x,(N1,sp)
      009149                       3153 10$:
      009149 A1 85            [ 1] 3154 	ld a,#TK_INTGR
      0011EA                       3155 rel_exit:
      0011EA                       3156 	_drop VSIZE
      00914B 26 03            [ 2]    1     addw sp,#VSIZE 
      00914D FE               [ 4] 3157 	ret 
                                   3158 
                                   3159 ;--------------------------------
                                   3160 ; BASIC: SHOW 
                                   3161 ; print stack content in hexadecimal bytes 
                                   3162 ; 16 bytes per row 
                                   3163 ;--------------------------------
      0011ED                       3164 show:
      00914E 20 1B 07         [ 2] 3165 	ldw x,#cstk_prompt
      009150 CD 00 00         [ 4] 3166 	call puts 
      009150 A1               [ 1] 3167 	ldw x,sp 
      009151 07 26 0C         [ 2] 3168 	addw x,#3 ; ignore return address
      009154 CD 92 15 89      [ 2] 3169 	ldw y,#RAM_SIZE  
      009158 A6 08 CD         [ 2] 3170 	ldw acc16,x 
      00915B 90 B8 85 20      [ 2] 3171 	subw y,acc16
      00915F 0B 03 59         [ 4] 3172 	call hex_dump
      009160 4F               [ 1] 3173 	clr a 
      009160 4D               [ 4] 3174 	ret
                                   3175 
      009161 27 11 55 00 03 00 02  3176 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             4F 20 09 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



             6D 3A 0A 00
                                   3177 
                                   3178 
                                   3179 ;--------------------------------------------
                                   3180 ; BASIC: HEX 
                                   3181 ; select hexadecimal base for integer print
                                   3182 ;---------------------------------------------
      00916B                       3183 hex_base:
      00916B A6 11 11 01      [ 1] 3184 	mov base,#16 
      00916F 26               [ 4] 3185 	ret 
                                   3186 
                                   3187 ;--------------------------------------------
                                   3188 ; BASIC: DEC 
                                   3189 ; select decimal base for integer print
                                   3190 ;---------------------------------------------
      001233                       3191 dec_base:
      009170 01 50 00 0A      [ 1] 3192 	mov base,#10
      009172 81               [ 4] 3193 	ret 
                                   3194 
                                   3195 ;------------------------
                                   3196 ; BASIC: SIZE 
                                   3197 ; return free size in text area
                                   3198 ; output:
                                   3199 ;   A 		TK_INTGR
                                   3200 ;   X 	    size integer
                                   3201 ;--------------------------
      001238                       3202 size:
      009172 A6 84 90         [ 2] 3203 	ldw x,#tib 
      009174 72 B0 00 1E      [ 2] 3204 	subw x,txtend 
      009174 5B 01            [ 1] 3205 	ld a,#TK_INTGR
      009176 81               [ 4] 3206 	ret 
                                   3207 
                                   3208 
                                   3209 ;------------------------
                                   3210 ; BASIC: UBOUND  
                                   3211 ; return array variable size 
                                   3212 ; output:
                                   3213 ;   A 		TK_INTGR
                                   3214 ;   X 	    array size 
                                   3215 ;--------------------------
      009177                       3216 ubound:
      009177 52 03 CD         [ 2] 3217 	ldw x,#tib
      00917A 91 1A 4D 27      [ 2] 3218 	subw x,txtend 
      00917E 47 CE 00 04      [ 2] 3219 	ldw y,basicptr 
      00917F 90 C3 00 1E      [ 2] 3220 	cpw y,txtend 
      00917F 1F 01            [ 1] 3221 	jrult 1$
      009181 CD 89 EF         [ 1] 3222 	push count 
      009184 6B 03            [ 1] 3223 	push #0 
      009186 A1 02 25         [ 2] 3224 	subw x,(1,sp)
      00125B                       3225 	_drop 2 
      009189 2F A4            [ 2]    1     addw sp,#2 
      00918B 30               [ 2] 3226 1$:	srlw x 
      00918C A1 20 27         [ 2] 3227 	ldw array_size,x
      00918F 02 20            [ 1] 3228 	ld a,#TK_INTGR
      009191 27               [ 4] 3229 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3230 
                                   3231 ;-----------------------------
                                   3232 ; BASIC: LET var=expr 
                                   3233 ; variable assignement 
                                   3234 ; output:
                                   3235 ;   A 		TK_NONE 
                                   3236 ;-----------------------------
      009192                       3237 let:
      009192 CD 91 1A         [ 4] 3238 	call next_token 
      009195 A1 84            [ 1] 3239 	cp a,#TK_VAR 
      009197 27 03            [ 1] 3240 	jreq let_var
      009199 CC 88            [ 1] 3241 	cp a,#TK_ARRAY 
      00919B FD 90            [ 1] 3242 	jreq  let_array
      00919D 93 1E 01         [ 2] 3243 	jp syntax_error
      001272                       3244 let_array:
      0091A0 7B 03 A1         [ 4] 3245 	call get_array_element
      001275                       3246 let_var:
      0091A3 20               [ 2] 3247 	pushw x  
      0091A4 26 05 CD         [ 4] 3248 	call next_token 
      0091A7 8F 49            [ 1] 3249 	cp a,#TK_EQUAL
      0091A9 20 D4            [ 1] 3250 	jreq 1$
      0091AB A1 21 26         [ 2] 3251 	jp syntax_error
      001280                       3252 1$:	
      0091AE 05 CD 90         [ 4] 3253 	call relation   
      0091B1 02 20            [ 1] 3254 	cp a,#TK_INTGR 
      0091B3 CB CD            [ 1] 3255 	jreq 2$
      0091B5 90 18 20         [ 2] 3256 	jp syntax_error
      00128A                       3257 2$:	
      0091B8 C6 7B            [ 1] 3258 	ldw y,x 
      0091BA 03               [ 2] 3259 	popw x   
      0091BB 27               [ 2] 3260 	ldw (x),y   
      0091BC 05               [ 4] 3261 	ret 
                                   3262 
                                   3263 ;----------------------------
                                   3264 ; BASIC: LIST [[start][,end]]
                                   3265 ; list program lines 
                                   3266 ; form start to end 
                                   3267 ; if empty argument list then 
                                   3268 ; list all.
                                   3269 ;----------------------------
                           000001  3270 	FIRST=1
                           000003  3271 	LAST=3 
                           000005  3272 	LN_PTR=5
                           000006  3273 	VSIZE=6 
      00128F                       3274 list:
      0091BD 55 00 03         [ 2] 3275 	ldw x,txtbgn 
      0091C0 00 02 1E         [ 2] 3276 	cpw x,txtend 
      0091C3 01 A6            [ 1] 3277 	jrmi 1$
      0091C5 84               [ 4] 3278 	ret 
      0091C6                       3279 1$:	
      001298                       3280 	_vars VSIZE
      0091C6 5B 03            [ 2]    1     sub sp,#VSIZE 
      0091C8 81 05            [ 2] 3281 	ldw (LN_PTR,sp),x 
      0091C9 FE               [ 2] 3282 	ldw x,(x) 
      0091C9 52 03            [ 2] 3283 	ldw (FIRST,sp),x ; list from first line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0091CB CD 91 77         [ 2] 3284 	ldw x,#MAX_LINENO ; biggest line number 
      0091CE 4D 27            [ 2] 3285 	ldw (LAST,sp),x 
      0091D0 41 1F 01         [ 4] 3286 	call arg_list
      0091D3 CD               [ 1] 3287 	tnz a
      0091D4 89 EF            [ 1] 3288 	jreq list_loop 
      0091D6 6B 03            [ 1] 3289 	cp a,#2 
      0091D8 A1 02            [ 1] 3290 	jreq 4$
      0091DA 25 29            [ 1] 3291 	cp a,#1 
      0091DC A4 30            [ 1] 3292 	jreq first_line 
      0091DE A1 10 27         [ 2] 3293 	jp syntax_error 
      0091E1 02               [ 2] 3294 4$:	popw x 
      0091E2 20 21            [ 2] 3295 	ldw (LAST+2,sp),x 
      0091E4                       3296 first_line:
      0091E4 CD               [ 2] 3297 	popw x
      0091E5 91 77            [ 2] 3298 	ldw (FIRST,sp),x 
      0012BB                       3299 lines_skip:
      0091E7 A1 84 27         [ 2] 3300 	ldw x,txtbgn
      0091EA 03 CC            [ 2] 3301 2$:	ldw (LN_PTR,sp),x 
      0091EC 88 FD CF         [ 2] 3302 	cpw x,txtend 
      0091EF 00 0D            [ 1] 3303 	jrpl list_exit 
      0091F1 1E               [ 2] 3304 	ldw x,(x) ;line# 
      0091F2 01 7B            [ 2] 3305 	cpw x,(FIRST,sp)
      0091F4 03 A1            [ 1] 3306 	jrpl list_loop 
      0091F6 10 26            [ 2] 3307 	ldw x,(LN_PTR,sp) 
      0091F8 06 72            [ 1] 3308 	ld a,(2,x)
      0091FA BB 00 0D         [ 1] 3309 	ld acc8,a 
      0091FD 20 D2 72 B0      [ 1] 3310 	clr acc16 
      009201 00 0D 20 CC      [ 2] 3311 	addw x,acc16
      009205 7B 03            [ 2] 3312 	jra 2$ 
                                   3313 ; print loop
      0012DB                       3314 list_loop:
      009207 27 05            [ 2] 3315 	ldw x,(LN_PTR,sp)
      009209 55 00            [ 1] 3316 	ld a,(2,x) 
      00920B 03 00 02         [ 4] 3317 	call prt_basic_line
      00920E 1E 01            [ 2] 3318 	ldw x,(LN_PTR,sp)
      009210 A6 84            [ 1] 3319 	ld a,(2,x)
      009212 C7 00 0D         [ 1] 3320 	ld acc8,a 
      009212 5B 03 81 0C      [ 1] 3321 	clr acc16 
      009215 72 BB 00 0C      [ 2] 3322 	addw x,acc16
      009215 52 03 CD         [ 2] 3323 	cpw x,txtend 
      009218 91 C9            [ 1] 3324 	jrpl list_exit
      00921A 4D 27            [ 2] 3325 	ldw (LN_PTR,sp),x
      00921C 4D               [ 2] 3326 	ldw x,(x)
      00921D 1F 01            [ 2] 3327 	cpw x,(LAST,sp)  
      00921F CD 89            [ 1] 3328 	jrslt list_loop
      0012FD                       3329 list_exit:
      009221 EF 6B 03 A4 30   [ 1] 3330 	mov in,count 
      009226 A1 30 26         [ 2] 3331 	ldw x,#pad 
      009229 33 00 04         [ 2] 3332 	ldw basicptr,x 
      00922A                       3333 	_drop VSIZE 
      00922A CD 91            [ 2]    1     addw sp,#VSIZE 
      00922C C9               [ 4] 3334 	ret
                                   3335 
                                   3336 ;-------------------------
                                   3337 ; copy command name to buffer  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3338 ; input:
                                   3339 ;   X 	name address 
                                   3340 ;   Y   destination buffer 
                                   3341 ; output:
                                   3342 ;   Y   point after name  
                                   3343 ;--------------------------
      00130B                       3344 cpy_cmd_name:
      00922D A1               [ 1] 3345 	ld a,(x)
      00922E 84               [ 2] 3346 	incw x
      00922F 27 03            [ 1] 3347 	and a,#15  
      009231 CC               [ 1] 3348 	push a 
      009232 88 FD            [ 1] 3349     tnz (1,sp) 
      009234 CF 00            [ 1] 3350 	jreq 9$
      009236 0D               [ 1] 3351 1$:	ld a,(x)
      009237 1E 01            [ 1] 3352 	ld (y),a  
      009239 72               [ 2] 3353 	incw x
      00923A B0 00            [ 2] 3354 	incw y 
      00923C 0D 26            [ 1] 3355 	dec (1,sp)	 
      00923E 06 35            [ 1] 3356 	jrne 1$
      009240 02               [ 1] 3357 9$: pop a 
      009241 00               [ 4] 3358 	ret	
                                   3359 
                                   3360 ;--------------------------
                                   3361 ; add a space after letter or 
                                   3362 ; digit.
                                   3363 ; input:
                                   3364 ;   Y     pointer to buffer 
                                   3365 ; output:
                                   3366 ;   Y    moved to end 
                                   3367 ;--------------------------
      001320                       3368 add_space:
      009242 0E 20            [ 2] 3369 	decw y 
      009244 0C F6            [ 1] 3370 	ld a,(y)
      009245 90 5C            [ 2] 3371 	incw y
      009245 2C 06 35         [ 4] 3372 	call is_alnum 
      009248 04 00            [ 1] 3373 	jrnc 1$
      00924A 0E 20            [ 1] 3374 	ld a,#SPACE 
      00924C 04 F7            [ 1] 3375 	ld (y),a 
      00924D 90 5C            [ 2] 3376 	incw y 
      00924D 35               [ 4] 3377 1$: ret 
                                   3378 
                                   3379 ;--------------------------
                                   3380 ;  align text in buffer 
                                   3381 ;  to tab_width padding 
                                   3382 ;  left with  SPACE 
                                   3383 ; input:
                                   3384 ;   X      str*
                                   3385 ;   A      str_length 
                                   3386 ; output:
                                   3387 ;   X      ajusted
                                   3388 ;--------------------------
      001332                       3389 right_align:
      00924E 01               [ 1] 3390 	push a 
      00924F 00 0E            [ 1] 3391 0$: ld a,(1,sp)
      009251 C1 00 24         [ 1] 3392 	cp a,tab_width 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009251 5F C6            [ 1] 3393 	jrpl 1$
      009253 00 0E            [ 1] 3394 	ld a,#SPACE 
      009255 14               [ 2] 3395 	decw x
      009256 03               [ 1] 3396 	ld (x),a  
      009257 4D 27            [ 1] 3397 	inc (1,sp)
      009259 0E 5C            [ 2] 3398 	jra 0$ 
      00925B 20               [ 1] 3399 1$: pop a 	
      00925C 0B               [ 4] 3400 	ret 
                                   3401 
                                   3402 ;--------------------------
                                   3403 ; print TK_QSTR
                                   3404 ; converting control character
                                   3405 ; to backslash sequence
                                   3406 ; input:
                                   3407 ;   X        char *
                                   3408 ;   Y        dest. buffer 
                                   3409 ; output:
                                   3410 ;   X        moved forward 
                                   3411 ;   Y        moved forward 
                                   3412 ;-----------------------------
      001344                       3413 cpy_quote:
      00925D 7B 03            [ 1] 3414 	ld a,#'"
      00925F 27 05            [ 1] 3415 	ld (y),a 
      009261 55 00            [ 2] 3416 	incw y 
      009263 03               [ 1] 3417 1$:	ld a,(x)
      009264 00 02            [ 1] 3418 	jreq 9$
      009266 5C               [ 2] 3419 	incw x 
      009266 1E 01            [ 1] 3420 	cp a,#SPACE 
      009268 25 0E            [ 1] 3421 	jrult 3$
      009268 A6 84            [ 1] 3422 	ld (y),a
      00926A 90 5C            [ 2] 3423 	incw y 
      00926A 5B 03            [ 1] 3424 	cp a,#'\ 
      00926C 81 F0            [ 1] 3425 	jrne 1$ 
      00926D                       3426 2$:
      00926D AE 92            [ 1] 3427 	ld (y),a
      00926F 87 CD            [ 2] 3428 	incw y  
      009271 A8 C0            [ 2] 3429 	jra 1$
      009273 96               [ 1] 3430 3$: push a 
      009274 1C 00            [ 1] 3431 	ld a,#'\
      009276 03 90            [ 1] 3432 	ld (y),a 
      009278 AE 18            [ 2] 3433 	incw y  
      00927A 00               [ 1] 3434 	pop a 
      00927B CF 00            [ 1] 3435 	sub a,#7
      00927D 0D 72 B2         [ 1] 3436 	ld acc8,a 
      009280 00 0D CD 83      [ 1] 3437 	clr acc16
      009284 D9               [ 2] 3438 	pushw x
      009285 4F 81 0A         [ 2] 3439 	ldw x,#escaped 
      009288 63 6F 6E 74      [ 2] 3440 	addw x,acc16 
      00928C 65               [ 1] 3441 	ld a,(x)
      00928D 6E               [ 2] 3442 	popw x
      00928E 74 20            [ 2] 3443 	jra 2$
      009290 6F 66            [ 1] 3444 9$: ld a,#'"
      009292 20 73            [ 1] 3445 	ld (y),a 
      009294 74 61            [ 2] 3446 	incw y  
      009296 63               [ 2] 3447 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009297 6B               [ 4] 3448 	ret
                                   3449 
                                   3450 ;--------------------------
                                   3451 ; return variable name 
                                   3452 ; from its address.
                                   3453 ; input:
                                   3454 ;   X    variable address
                                   3455 ; output:
                                   3456 ;   A     variable letter
                                   3457 ;--------------------------
      001385                       3458 var_name:
      009298 20 66 72         [ 2] 3459 		subw x,#vars 
      00929B 6F               [ 1] 3460 		ld a,xl 
      00929C 6D               [ 1] 3461 		srl a 
      00929D 20 74            [ 1] 3462 		add a,#'A 
      00929F 6F               [ 4] 3463 		ret 
                                   3464 
                                   3465 ;-----------------------------
                                   3466 ; return cmd  idx from its 
                                   3467 ; code address 
                                   3468 ; input:
                                   3469 ;   X      code address 
                                   3470 ; output:
                                   3471 ;   X      cmd_idx
                                   3472 ;-----------------------------
      00138D                       3473 get_cmd_idx:
      0092A0 70 20            [ 2] 3474 	pushw y
      0092A2 74 6F 20 62      [ 2] 3475 	ldw y,#code_addr 
      0092A6 6F 74 74 6F      [ 2] 3476 	ldw ptr16,y 
      0092AA 6D 3A            [ 1] 3477 	clrw y 
      0092AC 0A 00 17         [ 5] 3478 1$:	cpw x,([ptr16],y)
      0092AE 27 0C            [ 1] 3479 	jreq 3$ 
      0092AE 35 10            [ 2] 3480 	incw y 
      0092B0 00 0B 81         [ 4] 3481 	ld a,([ptr16],y)
      0092B3 90 5C            [ 2] 3482 	incw y
      0092B3 35 0A 00         [ 4] 3483 	or a,([ptr16],y)	
      0092B6 0B 81            [ 1] 3484 	jrne 1$
      0092B8 93               [ 1] 3485 3$: ldw x,y 
      0092B8 AE 16            [ 2] 3486 	popw y 
      0092BA 90               [ 4] 3487 	ret
                                   3488 
                                   3489 ;-------------------------------------
                                   3490 ; decompile tokens list 
                                   3491 ; to original text line 
                                   3492 ; input:
                                   3493 ;   [basicptr]  pointer at line 
                                   3494 ;   Y           destination buffer
                                   3495 ; output:
                                   3496 ;   A           length 
                                   3497 ;   Y           after string  
                                   3498 ;------------------------------------
                           000001  3499 	BASE_SAV=1
                           000002  3500 	WIDTH_SAV=2
                           000003  3501 	STR=3
                           000004  3502 	VSIZE=4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0013AE                       3503 decompile::
      0013AE                       3504 	_vars VSIZE
      0092BB 72 B0            [ 2]    1     sub sp,#VSIZE 
      0092BD 00 1F A6         [ 1] 3505 	ld a,base
      0092C0 84 81            [ 1] 3506 	ld (BASE_SAV,sp),a  
      0092C2 C6 00 24         [ 1] 3507 	ld a,tab_width 
      0092C2 AE 16            [ 1] 3508 	ld (WIDTH_SAV,sp),a 
      0092C4 90 72            [ 2] 3509 	ldw (STR,sp),y   
      0092C6 B0 00 1F 90      [ 5] 3510 	ldw x,[basicptr] ; line number 
      0092CA CE 00 05 90      [ 1] 3511 	mov base,#10
      0092CE C3 00 1F 25      [ 1] 3512 	mov tab_width,#5
      0092D2 0A 3B 00 04      [ 1] 3513 	clr acc24 
      0092D6 4B 00 72         [ 2] 3514 	ldw acc16,x
      0092D9 F0 01 5B         [ 4] 3515 	call itoa  
      0092DC 02 54 CF         [ 4] 3516 	call right_align 
      0092DF 00               [ 1] 3517 	push a 
      0092E0 22 A6            [ 1] 3518 1$:	ldw y,x ; source
      0092E2 84 81            [ 2] 3519 	ldw x,(STR+1,sp) ; destination
      0092E4 CD 03 B2         [ 4] 3520 	call strcpy 
      0092E4 CD 89            [ 1] 3521 	clrw y 
      0092E6 EF               [ 1] 3522 	pop a 
      0092E7 A1 85            [ 1] 3523 	ld yl,a 
      0092E9 27 0A A1         [ 2] 3524 	addw y,(STR,sp)
      0092EC 06 27            [ 1] 3525 	ld a,#SPACE 
      0092EE 03 CC            [ 1] 3526 	ld (y),a 
      0092F0 88 FD            [ 2] 3527 	incw y 
      0092F2 72 5F 00 24      [ 1] 3528 	clr tab_width
      0092F2 CD 90 F5         [ 2] 3529 	ldw x,#3
      0092F5 CF 00 00         [ 2] 3530 	ldw in.w,x 
      0013F5                       3531 decomp_loop:
      0092F5 89 CD            [ 2] 3532 	pushw y
      0092F7 89 EF A1         [ 4] 3533 	call next_token 
      0092FA 32 27            [ 2] 3534 	popw y 
      0092FC 03               [ 1] 3535 	tnz a  
      0092FD CC 88            [ 1] 3536 	jrne 1$
      0092FF FD 14 DB         [ 2] 3537 	jp 20$
      009300 2A 6F            [ 1] 3538 1$:	jrpl 6$
                                   3539 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      009300 CD 92            [ 1] 3540 	cp a,#TK_VAR 
      009302 15 A1            [ 1] 3541 	jrne 3$
                                   3542 ;; TK_VAR 
      009304 84 27 03         [ 4] 3543 	call add_space  
      009307 CC 88 FD         [ 4] 3544 	call var_name
      00930A 90 F7            [ 1] 3545 	ld (y),a 
      00930A 90 93            [ 2] 3546 	incw y  
      00930C 85 FF            [ 2] 3547 	jra decomp_loop
      001414                       3548 3$:
      00930E 81 84            [ 1] 3549 	cp a,#TK_INTGR
      00930F 26 22            [ 1] 3550 	jrne 4$
                                   3551 ;; TK_INTGR
      00930F CE 00 1D         [ 4] 3552 	call add_space
      009312 C3 00 1F 2B      [ 1] 3553 	clr acc24 
      009316 01 81 0C         [ 2] 3554 	ldw acc16,x 
      009318 90 89            [ 2] 3555 	pushw y 
      009318 52 06 1F         [ 4] 3556 	call itoa  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00931B 05 FE            [ 2] 3557 	ldw y,(1,sp) 
      00931D 1F               [ 1] 3558 	push a 
      00931E 01               [ 1] 3559 	exgw x,y 
      00931F AE 7F FF         [ 4] 3560 	call strcpy 
      009322 1F 03            [ 1] 3561 	clrw y
      009324 CD               [ 1] 3562 	pop a  
      009325 90 CA            [ 1] 3563 	ld yl,a 
      009327 4D 27 31         [ 2] 3564 	addw y,(1,sp)
      001436                       3565 	_drop 2 
      00932A A1 02            [ 2]    1     addw sp,#2 
      00932C 27 07            [ 2] 3566 	jra decomp_loop
                                   3567 ;; dictionary keyword 
      00143A                       3568 4$:	
      00932E A1 01 27         [ 4] 3569 	call get_cmd_idx 
      009331 06 CC 88         [ 2] 3570 	cpw x,#REM_IDX
      009334 FD 85            [ 1] 3571 	jrne 5$
      009336 1F 05 04         [ 2] 3572 	ldw x,basicptr 
                                   3573 ; copy comment to buffer 
      009338 CD 13 20         [ 4] 3574 	call add_space
      009338 85 1F            [ 1] 3575 	ld a,#''
      00933A 01 F7            [ 1] 3576 	ld (y),a 
      00933B 90 5C            [ 2] 3577 	incw y 
      00144E                       3578 41$:
      00933B CE 00 1D 1F      [ 4] 3579 	ld a,([in.w],x)
      00933F 05 C3 00 1F      [ 1] 3580 	inc in  
      009343 2A 38            [ 1] 3581 	ld (y),a 
      009345 FE 13            [ 2] 3582 	incw y 
      009347 01 2A 11         [ 1] 3583 	ld a,in 
      00934A 1E 05 E6         [ 1] 3584 	cp a,count 
      00934D 02 C7            [ 1] 3585 	jrmi 41$
      00934F 00 0E            [ 2] 3586 	jra 20$  
                                   3587 ; insert command name 
      001464                       3588 5$:
      009351 72 5F 00         [ 4] 3589 	call add_space  
      009354 0D 72            [ 2] 3590 	pushw y
      009356 BB 00 0D         [ 4] 3591 	call cmd_name
      009359 20 E3            [ 2] 3592 	popw y 
      00935B CD 13 0B         [ 4] 3593 	call cpy_cmd_name
      00935B 1E 05            [ 2] 3594 	jra decomp_loop 
      001473                       3595 6$:
      00935D E6 02            [ 1] 3596 	cp a,#TK_QSTR 
      00935F CD 95            [ 1] 3597 	jrne 7$
                                   3598 ;; TK_QSTR
      009361 96 1E 05         [ 4] 3599 	call cpy_quote  
      009364 E6 02 C7         [ 2] 3600 	jp decomp_loop
      00147D                       3601 7$:
      009367 00 0E            [ 1] 3602 	cp a,#TK_CHAR 
      009369 72 5F            [ 1] 3603 	jrne 8$
                                   3604 ;; TK_CHAR 
      00936B 00 0D            [ 1] 3605 	ld a,#'\ 
      00936D 72 BB            [ 1] 3606 	ld (y),a 
      00936F 00 0D            [ 2] 3607 	incw y 
      009371 C3               [ 1] 3608 	ld a,xl 
      009372 00 1F            [ 1] 3609 	ld (y),a 
      009374 2A 07            [ 2] 3610 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009376 1F 05 FE         [ 2] 3611 	jp decomp_loop
      009379 13 03            [ 1] 3612 8$: cp a,#TK_COLON 
      00937B 2F DE            [ 1] 3613 	jrne 9$
      00937D A6 3A            [ 1] 3614 	ld a,#':
      001495                       3615 81$:
      00937D 55 00            [ 1] 3616 	ld (y),a 
      00937F 04 00            [ 2] 3617 	incw y 
      001499                       3618 82$:
      009381 02 AE 16         [ 2] 3619 	jp decomp_loop
      00149C                       3620 9$: 
      009384 E0 CF            [ 1] 3621 	cp a,#TK_SHARP
      009386 00 05            [ 1] 3622 	jrugt 10$ 
      009388 5B 06            [ 1] 3623 	sub a,#TK_ARRAY 
      00938A 81               [ 1] 3624 	clrw x 
      00938B 97               [ 1] 3625 	ld xl,a
      00938B F6 5C A4         [ 2] 3626 	addw x,#single_char 
      00938E 0F               [ 1] 3627 	ld a,(x)
      00938F 88 0D            [ 2] 3628 	jra 81$ 
      0014AA                       3629 10$: 
      009391 01 27            [ 1] 3630 	cp a,#TK_MINUS 
      009393 0A F6            [ 1] 3631 	jrugt 11$
      009395 90 F7            [ 1] 3632 	sub a,#TK_PLUS 
      009397 5C               [ 1] 3633 	clrw x 
      009398 90               [ 1] 3634 	ld xl,a 
      009399 5C 0A 01         [ 2] 3635 	addw x,#add_char 
      00939C 26               [ 1] 3636 	ld a,(x)
      00939D F6 84            [ 2] 3637 	jra 81$
      0014B8                       3638 11$:
      00939F 81 22            [ 1] 3639     cp a,#TK_MOD 
      0093A0 22 0A            [ 1] 3640 	jrugt 12$
      0093A0 90 5A            [ 1] 3641 	sub a,#TK_MULT
      0093A2 90               [ 1] 3642 	clrw x 
      0093A3 F6               [ 1] 3643 	ld xl,a 
      0093A4 90 5C CD         [ 2] 3644 	addw x,#mul_char
      0093A7 86               [ 1] 3645 	ld a,(x)
      0093A8 0B 24            [ 2] 3646 	jra 81$
      0014C6                       3647 12$:
      0093AA 06 A6            [ 1] 3648 	sub a,#TK_GT  
      0093AC 20               [ 1] 3649 	sll a 
      0093AD 90               [ 1] 3650 	clrw x 
      0093AE F7               [ 1] 3651 	ld xl,a 
      0093AF 90 5C 81         [ 2] 3652 	addw x,#relop_str 
      0093B2 FE               [ 2] 3653 	ldw x,(x)
      0093B2 88               [ 1] 3654 	ld a,(x)
      0093B3 7B               [ 2] 3655 	incw x 
      0093B4 01 C1            [ 1] 3656 	ld (y),a
      0093B6 00 25            [ 2] 3657 	incw y 
      0093B8 2A               [ 1] 3658 	ld a,(x)
      0093B9 08 A6            [ 1] 3659 	jrne 81$
      0093BB 20 5A F7         [ 2] 3660 	jp decomp_loop 
      0014DB                       3661 20$: 
      0093BE 0C 01            [ 1] 3662 	clr (y)
      0093C0 20 F1            [ 2] 3663 	ldw x,(STR,sp)
      0093C2 84 81            [ 1] 3664 	ld a,(BASE_SAV,sp)
      0093C4 C7 00 0A         [ 1] 3665 	ld base,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0093C4 A6 22            [ 1] 3666 	ld a,(WIDTH_SAV,sp)
      0093C6 90 F7 90         [ 1] 3667 	ld tab_width,a
      0093C9 5C F6 27         [ 2] 3668 	subw y,(STR,sp) 
      0093CC 30 5C            [ 1] 3669 	ld a,yl 
      0014EE                       3670 	_drop VSIZE 
      0093CE A1 20            [ 2]    1     addw sp,#VSIZE 
      0093D0 25               [ 4] 3671 	ret 
                                   3672 
      0093D1 0E 90 F7 90 5C        3673 single_char: .byte '@','(',')',',','#'
      0093D6 A1 5C                 3674 add_char: .byte '+','-'
      0093D8 26 F0 25              3675 mul_char: .byte '*','/','%'
      0093DA 15 07 15 09 15 0B 15  3676 relop_str: .word gt,equal,ge,lt,le,ne 
             0E 15 10 15 13
      0093DA 90 F7                 3677 gt: .asciz ">"
      0093DC 90 5C                 3678 equal: .asciz "="
      0093DE 20 EA 88              3679 ge: .asciz ">="
      0093E1 A6 5C                 3680 lt: .asciz "<"
      0093E3 90 F7 90              3681 le: .asciz "<="
      0093E6 5C 84 A0              3682 ne:  .asciz "<>"
                                   3683 
                                   3684 
                                   3685 ;--------------------------
                                   3686 ; decompile line from token list
                                   3687 ; and print it. 
                                   3688 ; input:
                                   3689 ;   A       stop at this position 
                                   3690 ;   X 		pointer at line
                                   3691 ; output:
                                   3692 ;   none 
                                   3693 ;--------------------------	
      001516                       3694 prt_basic_line:
      0093E9 07 C7 00         [ 1] 3695 	ld count,a 
      0093EC 0E 72            [ 1] 3696 	ld a,(2,x)
      0093EE 5F 00 0D         [ 1] 3697 	cp a,count 
      0093F1 89 AE            [ 1] 3698 	jrpl 1$ 
      0093F3 8B 98 72         [ 1] 3699 	ld count,a 
      0093F6 BB 00 0D         [ 2] 3700 1$:	ldw basicptr,x 
      0093F9 F6 85 20 DD      [ 2] 3701 	ldw y,#tib  
      0093FD A6 22 90         [ 4] 3702 	call decompile 
      009400 F7 90 5C         [ 4] 3703 	call puts 
      009403 5C 81            [ 1] 3704 	ld a,#CR 
      009405 CD 02 C0         [ 4] 3705 	call putc 
      009405 1D               [ 4] 3706 	ret 
                                   3707 
                                   3708 
                                   3709 
                                   3710 ;---------------------------------
                                   3711 ; BASIC: PRINT|? arg_list 
                                   3712 ; print values from argument list
                                   3713 ;----------------------------------
                           000001  3714 	COMMA=1
                           000001  3715 	VSIZE=1
      001536                       3716 print:
      001536                       3717 	_vars VSIZE 
      009406 00 30            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      001538                       3718 reset_comma:
      009408 9F 44            [ 1] 3719 	clr (COMMA,sp)
      00153A                       3720 prt_loop:
      00940A AB 41 81         [ 4] 3721 	call next_token
      00940D A1 02            [ 1] 3722 	cp a,#CMD_END 
      00940D 90 89            [ 1] 3723 	jrult print_exit ; colon or end of line 
      00940F 90 AE            [ 1] 3724 	cp a,#TK_QSTR
      009411 A7 84            [ 1] 3725 	jreq 1$
      009413 90 CF            [ 1] 3726 	cp a,#TK_CHAR 
      009415 00 18            [ 1] 3727 	jreq 2$ 
      009417 90 5F            [ 1] 3728 	cp a,#TK_CFUNC 
      009419 91 D3            [ 1] 3729 	jreq 3$
      00941B 18 27            [ 1] 3730 	cp a,#TK_COMMA 
      00941D 0C 90            [ 1] 3731 	jreq 4$
      00941F 5C 91            [ 1] 3732 	cp a,#TK_SHARP 
      009421 D6 18            [ 1] 3733 	jreq 5$
      009423 90 5C            [ 2] 3734 	jra 7$ 
      001557                       3735 1$:	; print string 
      009425 91 DA 18         [ 4] 3736 	call puts
      009428 26 EF            [ 2] 3737 	jra reset_comma
      00155C                       3738 2$:	; print character 
      00942A 93               [ 1] 3739 	ld a,xl 
      00942B 90 85 81         [ 4] 3740 	call putc 
      00942E 20 D6            [ 2] 3741 	jra reset_comma 
      001562                       3742 3$: ; print character function value  	
      00942E 52               [ 4] 3743 	call (x)
      00942F 04               [ 1] 3744 	ld a,xl 
      009430 C6 00 0B         [ 4] 3745 	call putc
      009433 6B 01            [ 2] 3746 	jra reset_comma 
      001569                       3747 4$: ; set comma state 
      009435 C6 00            [ 1] 3748 	cpl (COMMA,sp)
      009437 25 6B            [ 2] 3749 	jra prt_loop   
      00156D                       3750 5$: ; # character must be followed by an integer   
      009439 02 17 03         [ 4] 3751 	call next_token
      00943C 72 CE            [ 1] 3752 	cp a,#TK_INTGR 
      00943E 00 05            [ 1] 3753 	jreq 6$
      009440 35 0A 00         [ 2] 3754 	jp syntax_error 
      001577                       3755 6$: ; set tab width
      009443 0B               [ 1] 3756 	ld a,xl 
      009444 35 05            [ 1] 3757 	and a,#15 
      009446 00 25 72         [ 1] 3758 	ld tab_width,a 
      009449 5F 00            [ 2] 3759 	jra reset_comma 
      00157F                       3760 7$:	
      00157F                       3761 	_unget_token 
      00944B 0C CF 00 0D CD   [ 1]    1      mov in,in.saved  
      009450 8A 6C CD         [ 4] 3762 	call relation 
      009453 93 B2            [ 1] 3763 	cp a,#TK_INTGR 
      009455 88 90            [ 1] 3764 	jrne print_exit 
      009457 93 1E 04         [ 4] 3765     call print_int 
      00945A CD 84            [ 2] 3766 	jra reset_comma 
      001590                       3767 print_exit:
      00945C 32 90            [ 1] 3768 	tnz (COMMA,sp)
      00945E 5F 84            [ 1] 3769 	jrne 9$
      009460 90 97            [ 1] 3770 	ld a,#CR 
      009462 72 F9 03         [ 4] 3771     call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      001599                       3772 9$:	_drop VSIZE 
      009465 A6 20            [ 2]    1     addw sp,#VSIZE 
      009467 90               [ 4] 3773 	ret 
                                   3774 
                                   3775 ;----------------------
                                   3776 ; 'save_context' and
                                   3777 ; 'rest_context' must be 
                                   3778 ; called at the same 
                                   3779 ; call stack depth 
                                   3780 ; i.e. SP must have the 
                                   3781 ; save value at  
                                   3782 ; entry point of both 
                                   3783 ; routine. 
                                   3784 ;---------------------
                           000004  3785 	CTXT_SIZE=4 ; size of saved data 
                                   3786 ;--------------------
                                   3787 ; save current BASIC
                                   3788 ; interpreter context 
                                   3789 ; on stack 
                                   3790 ;--------------------
      00159C                       3791 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00159C                       3792 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00159C                       3793 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00159C                       3794 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00159C                       3795 save_context:
      009468 F7 90 5C         [ 2] 3796 	ldw x,basicptr 
      00946B 72 5F            [ 2] 3797 	ldw (BPTR,sp),x
      00946D 00 25 AE         [ 1] 3798 	ld a,in 
      009470 00 03            [ 1] 3799 	ld (IN,sp),a
      009472 CF 00 01         [ 1] 3800 	ld a,count 
      009475 6B 06            [ 1] 3801 	ld (CNT,sp),a  
      009475 90               [ 4] 3802 	ret
                                   3803 
                                   3804 ;-----------------------
                                   3805 ; restore previously saved 
                                   3806 ; BASIC interpreter context 
                                   3807 ; from stack 
                                   3808 ;-------------------------
      0015AC                       3809 rest_context:
      009476 89 CD            [ 2] 3810 	ldw x,(BPTR,sp)
      009478 89 EF 90         [ 2] 3811 	ldw basicptr,x 
      00947B 85 4D            [ 1] 3812 	ld a,(IN,sp)
      00947D 26 03 CC         [ 1] 3813 	ld in,a
      009480 95 5B            [ 1] 3814 	ld a,(CNT,sp)
      009482 2A 6F A1         [ 1] 3815 	ld count,a  
      009485 85               [ 4] 3816 	ret
                                   3817 
                                   3818 
                                   3819 
                                   3820 ;------------------------------------------
                                   3821 ; BASIC: INPUT [string]var[,[string]var]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3822 ; input value in variables 
                                   3823 ; [string] optionally can be used as prompt 
                                   3824 ;-----------------------------------------
                           000001  3825 	CX_BPTR=1
                           000003  3826 	CX_IN=3
                           000004  3827 	CX_CNT=4
                           000005  3828 	SKIP=5
                           000006  3829 	VAR_ADDR=6
                           000007  3830 	VSIZE=7
      0015BC                       3831 input_var:
      0015BC                       3832 	_vars VSIZE 
      009486 26 0C            [ 2]    1     sub sp,#VSIZE 
      0015BE                       3833 input_loop:
      009488 CD 93            [ 1] 3834 	clr (SKIP,sp)
      00948A A0 CD 94         [ 4] 3835 	call next_token 
      00948D 05 90            [ 1] 3836 	cp a,#TK_QSTR 
      00948F F7 90            [ 1] 3837 	jrne 1$ 
      009491 5C 20 E1         [ 4] 3838 	call puts 
      009494 03 05            [ 1] 3839 	cpl (SKIP,sp)
      009494 A1 84 26         [ 4] 3840 	call next_token 
      009497 22 CD            [ 1] 3841 1$: cp a,#TK_VAR  
      009499 93 A0            [ 1] 3842 	jreq 2$ 
      00949B 72 5F 00         [ 2] 3843 	jp syntax_error
      00949E 0C CF            [ 2] 3844 2$:	ldw (VAR_ADDR,sp),x 
      0094A0 00 0D            [ 1] 3845 	tnz (SKIP,sp)
      0094A2 90 89            [ 1] 3846 	jrne 21$ 
      0094A4 CD 8A 6C         [ 4] 3847 	call var_name 
      0094A7 16 01 88         [ 4] 3848 	call putc   
      0015E2                       3849 21$:
      0094AA 51 CD            [ 1] 3850 	ld a,#':
      0094AC 84 32 90         [ 4] 3851 	call putc 
      0094AF 5F 84 90         [ 4] 3852 	call save_context 
      0094B2 97 72 F9 01      [ 1] 3853 	clr count  
      0094B6 5B 02 20         [ 4] 3854 	call readln 
      0094B9 BB 16 90         [ 2] 3855 	ldw x,#tib 
      0094BA 3B 00 03         [ 1] 3856 	push count
      0094BA CD 94            [ 1] 3857 	push #0 
      0094BC 0D A3 00         [ 2] 3858 	addw x,(1,sp)
      0094BF 8E               [ 2] 3859 	incw x 
      0015FD                       3860 	_drop 2 
      0094C0 26 22            [ 2]    1     addw sp,#2 
      0094C2 CE 00 05 CD      [ 1] 3861 	clr in 
      0094C6 93 A0 A6         [ 4] 3862 	call get_token
      0094C9 27 90            [ 1] 3863 	cp a,#TK_INTGR
      0094CB F7 90            [ 1] 3864 	jreq 3$ 
      0094CD 5C 15 AC         [ 4] 3865 	call rest_context 
      0094CE CC 08 7D         [ 2] 3866 	jp syntax_error
      0094CE 72 D6            [ 2] 3867 3$: ldw y,(VAR_ADDR,sp) 
      0094D0 00 01            [ 2] 3868 	ldw (y),x 
      0094D2 72 5C 00         [ 4] 3869 	call rest_context
      0094D5 02 90 F7         [ 4] 3870 	call next_token 
      0094D8 90 5C            [ 1] 3871 	cp a,#TK_COMMA 
      0094DA C6 00            [ 1] 3872 	jreq input_loop 
      0094DC 02 C1            [ 1] 3873 	cp a,#TK_COLON 
      0094DE 00 04            [ 2] 3874     jrule input_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0094E0 2B EC 20         [ 2] 3875 	jp syntax_error 
      001625                       3876 input_exit:
      001625                       3877 	_drop VSIZE 
      0094E3 77 07            [ 2]    1     addw sp,#VSIZE 
      0094E4 81               [ 4] 3878 	ret 
                                   3879 
                                   3880 
                                   3881 ;---------------------
                                   3882 ; BASIC: REMARK | ' 
                                   3883 ; skip comment to end of line 
                                   3884 ;---------------------- 
      001628                       3885 remark:
      0094E4 CD 93 A0 90 89   [ 1] 3886 	mov in,count 
      0094E9 CD               [ 4] 3887  	ret 
                                   3888 
                                   3889 
                                   3890 ;---------------------
                                   3891 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3892 ; read in loop 'addr'  
                                   3893 ; apply & 'mask' to value 
                                   3894 ; loop while result==0.  
                                   3895 ; 'xor_mask' is used to 
                                   3896 ; invert the wait logic.
                                   3897 ; i.e. loop while not 0.
                                   3898 ;---------------------
                           000001  3899 	XMASK=1 
                           000002  3900 	MASK=2
                           000003  3901 	ADDR=3
                           000004  3902 	VSIZE=4
      00162E                       3903 wait: 
      00162E                       3904 	_vars VSIZE
      0094EA 90 39            [ 2]    1     sub sp,#VSIZE 
      0094EC 90 85            [ 1] 3905 	clr (XMASK,sp) 
      0094EE CD 93 8B         [ 4] 3906 	call arg_list 
      0094F1 20 82            [ 1] 3907 	cp a,#2
      0094F3 24 03            [ 1] 3908 	jruge 0$
      0094F3 A1 02 26         [ 2] 3909 	jp syntax_error 
      0094F6 06 CD            [ 1] 3910 0$:	cp a,#3
      0094F8 93 C4            [ 1] 3911 	jrult 1$
      0094FA CC               [ 2] 3912 	popw x 
      0094FB 94               [ 1] 3913 	ld a,xl
      0094FC 75 01            [ 1] 3914 	ld (XMASK,sp),a 
      0094FD 85               [ 2] 3915 1$: popw x ; mask 
      0094FD A1               [ 1] 3916 	ld a,xl 
      0094FE 03 26            [ 1] 3917 	ld (MASK,sp),a 
      009500 0E               [ 2] 3918 	popw x ; address 
      009501 A6               [ 1] 3919 2$:	ld a,(x)
      009502 5C 90            [ 1] 3920 	and a,(MASK,sp)
      009504 F7 90            [ 1] 3921 	xor a,(XMASK,sp)
      009506 5C 9F            [ 1] 3922 	jreq 2$ 
      001650                       3923 	_drop VSIZE 
      009508 90 F7            [ 2]    1     addw sp,#VSIZE 
      00950A 90               [ 4] 3924 	ret 
                                   3925 
                                   3926 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3927 ; BASIC: BSET addr,mask
                                   3928 ; set bits at 'addr' corresponding 
                                   3929 ; to those of 'mask' that are at 1.
                                   3930 ; arguments:
                                   3931 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3932 ;   mask        mask|addr
                                   3933 ; output:
                                   3934 ;	none 
                                   3935 ;--------------------------
      001653                       3936 bit_set:
      00950B 5C CC 94         [ 4] 3937 	call arg_list 
      00950E 75 A1            [ 1] 3938 	cp a,#2	 
      009510 01 26            [ 1] 3939 	jreq 1$ 
      009512 09 A6 3A         [ 2] 3940 	jp syntax_error
      009515                       3941 1$: 
      009515 90               [ 2] 3942 	popw x ; mask 
      009516 F7               [ 1] 3943 	ld a,xl 
      009517 90               [ 2] 3944 	popw x ; addr  
      009518 5C               [ 1] 3945 	or a,(x)
      009519 F7               [ 1] 3946 	ld (x),a
      009519 CC               [ 4] 3947 	ret 
                                   3948 
                                   3949 ;---------------------
                                   3950 ; BASIC: BRES addr,mask
                                   3951 ; reset bits at 'addr' corresponding 
                                   3952 ; to those of 'mask' that are at 1.
                                   3953 ; arguments:
                                   3954 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3955 ;   mask	    ~mask&*addr  
                                   3956 ; output:
                                   3957 ;	none 
                                   3958 ;--------------------------
      001663                       3959 bit_reset:
      00951A 94 75 4A         [ 4] 3960 	call arg_list 
      00951C A1 02            [ 1] 3961 	cp a,#2  
      00951C A1 0A            [ 1] 3962 	jreq 1$ 
      00951E 22 0A A0         [ 2] 3963 	jp syntax_error
      00166D                       3964 1$: 
      009521 06               [ 2] 3965 	popw x ; mask 
      009522 5F               [ 1] 3966 	ld a,xl 
      009523 97               [ 1] 3967 	cpl a 
      009524 1C               [ 2] 3968 	popw x ; addr  
      009525 95               [ 1] 3969 	and a,(x)
      009526 71               [ 1] 3970 	ld (x),a 
      009527 F6               [ 4] 3971 	ret 
                                   3972 
                                   3973 ;---------------------
                                   3974 ; BASIC: BTOGL addr,mask
                                   3975 ; toggle bits at 'addr' corresponding 
                                   3976 ; to those of 'mask' that are at 1.
                                   3977 ; arguments:
                                   3978 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3979 ;   mask	    mask^*addr  
                                   3980 ; output:
                                   3981 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   3982 ;--------------------------
      001674                       3983 bit_toggle:
      009528 20 EB 4A         [ 4] 3984 	call arg_list 
      00952A A1 02            [ 1] 3985 	cp a,#2 
      00952A A1 11            [ 1] 3986 	jreq 1$ 
      00952C 22 0A A0         [ 2] 3987 	jp syntax_error
      00952F 10               [ 2] 3988 1$: popw x ; mask 
      009530 5F               [ 1] 3989 	ld a,xl 
      009531 97               [ 2] 3990 	popw x ; addr  
      009532 1C               [ 1] 3991 	xor a,(x)
      009533 95               [ 1] 3992 	ld (x),a 
      009534 76               [ 4] 3993 	ret 
                                   3994 
                                   3995 
                                   3996 ;---------------------
                                   3997 ; BASIC: BTEST(addr,bit)
                                   3998 ; return bit value at 'addr' 
                                   3999 ; bit is in range {0..7}.
                                   4000 ; arguments:
                                   4001 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4002 ;   bit 	    bit position {0..7}  
                                   4003 ; output:
                                   4004 ;	none 
                                   4005 ;--------------------------
      001684                       4006 bit_test:
      009535 F6 20 DD         [ 4] 4007 	call func_args 
      009538 A1 02            [ 1] 4008 	cp a,#2
      009538 A1 22            [ 1] 4009 	jreq 0$
      00953A 22 0A A0         [ 2] 4010 	jp syntax_error
      00168E                       4011 0$:	
      00953D 20               [ 2] 4012 	popw x 
      00953E 5F               [ 1] 4013 	ld a,xl 
      00953F 97 1C            [ 1] 4014 	and a,#7
      009541 95               [ 1] 4015 	push a   
      009542 78 F6            [ 1] 4016 	ld a,#1 
      009544 20 CF            [ 1] 4017 1$: tnz (1,sp)
      009546 27 05            [ 1] 4018 	jreq 2$
      009546 A0               [ 1] 4019 	sll a 
      009547 31 48            [ 1] 4020 	dec (1,sp)
      009549 5F 97            [ 2] 4021 	jra 1$
      00169E                       4022 2$: _drop 1 
      00954B 1C 95            [ 2]    1     addw sp,#1 
      00954D 7B               [ 2] 4023 	popw x 
      00954E FE               [ 1] 4024 	and a,(x)
      00954F F6 5C            [ 1] 4025 	jreq 3$
      009551 90 F7            [ 1] 4026 	ld a,#1 
      009553 90               [ 1] 4027 3$:	clrw x 
      009554 5C               [ 1] 4028 	ld xl,a 
      009555 F6 26            [ 1] 4029 	ld a,#TK_INTGR
      009557 BD               [ 4] 4030 	ret
                                   4031 
                                   4032 
                                   4033 ;--------------------
                                   4034 ; BASIC: POKE addr,byte
                                   4035 ; put a byte at addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4036 ;--------------------
      0016AB                       4037 poke:
      009558 CC 94 75         [ 4] 4038 	call arg_list 
      00955B A1 02            [ 1] 4039 	cp a,#2
      00955B 90 7F            [ 1] 4040 	jreq 1$
      00955D 1E 03 7B         [ 2] 4041 	jp syntax_error
      0016B5                       4042 1$:	
      009560 01               [ 2] 4043 	popw x  
      009561 C7               [ 1] 4044     ld a,xl 
      009562 00               [ 2] 4045 	popw x 
      009563 0B               [ 1] 4046 	ld (x),a 
      009564 7B               [ 4] 4047 	ret 
                                   4048 
                                   4049 ;-----------------------
                                   4050 ; BASIC: PEEK(addr)
                                   4051 ; get the byte at addr 
                                   4052 ; input:
                                   4053 ;	none 
                                   4054 ; output:
                                   4055 ;	X 		value 
                                   4056 ;-----------------------
      0016BA                       4057 peek:
      009565 02 C7 00         [ 4] 4058 	call func_args
      009568 25 72            [ 1] 4059 	cp a,#1 
      00956A F2 03            [ 1] 4060 	jreq 1$
      00956C 90 9F 5B         [ 2] 4061 	jp syntax_error
      00956F 04               [ 2] 4062 1$: popw x 
      009570 81               [ 1] 4063 	ld a,(x)
      009571 40               [ 1] 4064 	clrw x 
      009572 28               [ 1] 4065 	ld xl,a 
      009573 29 2C            [ 1] 4066 	ld a,#TK_INTGR
      009575 23               [ 4] 4067 	ret 
                                   4068 
                                   4069 ;---------------------------
                                   4070 ; BASIC IF expr : instructions
                                   4071 ; evaluate expr and if true 
                                   4072 ; execute instructions on same line. 
                                   4073 ;----------------------------
      0016CB                       4074 if: 
      009576 2B 2D 2A         [ 4] 4075 	call relation 
      009579 2F 25            [ 1] 4076 	cp a,#TK_INTGR
      00957B 95 87            [ 1] 4077 	jreq 1$ 
      00957D 95 89 95         [ 2] 4078 	jp syntax_error
      009580 8B               [ 1] 4079 1$:	clr a 
      009581 95               [ 2] 4080 	tnzw x 
      009582 8E 95            [ 1] 4081 	jrne 9$  
                                   4082 ;skip to next line
      009584 90 95 93 3E 00   [ 1] 4083 	mov in,count
      009589 3D               [ 4] 4084 9$:	ret 
                                   4085 
                                   4086 ;------------------------
                                   4087 ; BASIC: FOR var=expr 
                                   4088 ; set variable to expression 
                                   4089 ; leave variable address 
                                   4090 ; on stack and set
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4091 ; FLOOP bit in 'flags'
                                   4092 ;-----------------
                           000001  4093 	RETL1=1 ; return address  
                           000003  4094 	FSTEP=3  ; variable increment
                           000005  4095 	LIMIT=5 ; loop limit 
                           000007  4096 	CVAR=7   ; control variable 
                           000009  4097 	INW=9   ;  in.w saved
                           00000B  4098 	BPTR=11 ; baseptr saved
                           00000A  4099 	VSIZE=10  
      0016DF                       4100 for: ; { -- var_addr }
      00958A 00               [ 2] 4101 	popw x ; call return address 
      0016E0                       4102 	_vars VSIZE 
      00958B 3E 3D            [ 2]    1     sub sp,#VSIZE 
      00958D 00               [ 2] 4103 	pushw x  ; RETL1 
      00958E 3C 00            [ 1] 4104 	ld a,#TK_VAR 
      009590 3C 3D 00         [ 4] 4105 	call expect
      009593 3C 3E            [ 2] 4106 	ldw (CVAR,sp),x  ; control variable 
      009595 00 12 75         [ 4] 4107 	call let_var 
      009596 72 14 00 23      [ 1] 4108 	bset flags,#FLOOP 
                                   4109 ; open space on stack for loop data 
      009596 C7               [ 1] 4110 	clrw x 
      009597 00 04            [ 2] 4111 	ldw (BPTR,sp),x 
      009599 E6 02            [ 2] 4112 	ldw (INW,sp),x 
      00959B C1 00 04         [ 4] 4113 	call next_token 
      00959E 2A 03            [ 1] 4114 	cp a,#TK_CMD 
      0095A0 C7 00            [ 1] 4115 	jreq 1$
      0095A2 04 CF 00         [ 2] 4116 	jp syntax_error
      001700                       4117 1$:  
      0095A5 05 90 AE         [ 2] 4118 	cpw x,#to 
      0095A8 16 90            [ 1] 4119 	jreq to
      0095AA CD 94 2E         [ 2] 4120 	jp syntax_error 
                                   4121 
                                   4122 ;-----------------------------------
                                   4123 ; BASIC: TO expr 
                                   4124 ; second part of FOR loop initilization
                                   4125 ; leave limit on stack and set 
                                   4126 ; FTO bit in 'flags'
                                   4127 ;-----------------------------------
      001708                       4128 to: ; { var_addr -- var_addr limit step }
      0095AD CD A8 C0 A6 0D   [ 2] 4129 	btjt flags,#FLOOP,1$
      0095B2 CD 83 40         [ 2] 4130 	jp syntax_error
      0095B5 81 11 95         [ 4] 4131 1$: call relation  
      0095B6 A1 84            [ 1] 4132 	cp a,#TK_INTGR 
      0095B6 52 01            [ 1] 4133 	jreq 2$ 
      0095B8 CC 08 7D         [ 2] 4134 	jp syntax_error
      0095B8 0F 01            [ 2] 4135 2$: ldw (LIMIT,sp),x
                                   4136 ;	ldw x,in.w 
      0095BA CD 09 6F         [ 4] 4137 	call next_token
      0095BA CD 89            [ 1] 4138 	cp a,#TK_NONE  
      0095BC EF A1            [ 1] 4139 	jreq 4$ 
      0095BE 02 25            [ 1] 4140 	cp a,#TK_CMD
      0095C0 4F A1            [ 1] 4141 	jrne 3$
      0095C2 02 27 12         [ 2] 4142 	cpw x,#step 
      0095C5 A1 03            [ 1] 4143 	jreq step
      00172C                       4144 3$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      00172C                       4145 	_unget_token   	 
      0095C7 27 13 A1 82 27   [ 1]    1      mov in,in.saved  
      001731                       4146 4$:	
      0095CC 15 A1 09         [ 2] 4147 	ldw x,#1   ; default step  
      0095CF 27 18            [ 2] 4148 	ldw (FSTEP,sp),x 
      0095D1 A1 0A            [ 2] 4149 	jra store_loop_addr 
                                   4150 
                                   4151 
                                   4152 ;----------------------------------
                                   4153 ; BASIC: STEP expr 
                                   4154 ; optional third par of FOR loop
                                   4155 ; initialization. 	
                                   4156 ;------------------------------------
      001738                       4157 step: ; {var limit -- var limit step}
      0095D3 27 18 20 28 03   [ 2] 4158 	btjt flags,#FLOOP,1$
      0095D7 CC 08 7D         [ 2] 4159 	jp syntax_error
      0095D7 CD A8 C0         [ 4] 4160 1$: call relation
      0095DA 20 DC            [ 1] 4161 	cp a,#TK_INTGR
      0095DC 27 03            [ 1] 4162 	jreq 2$
      0095DC 9F CD 83         [ 2] 4163 	jp syntax_error
      0095DF 40 20            [ 2] 4164 2$:	ldw (FSTEP,sp),x ; step
                                   4165 ; leave loop back entry point on cstack 
                                   4166 ; cstack is 1 call deep from interpreter
      00174C                       4167 store_loop_addr:
      0095E1 D6 00 04         [ 2] 4168 	ldw x,basicptr  
      0095E2 1F 0B            [ 2] 4169 	ldw (BPTR,sp),x 
      0095E2 FD 9F CD         [ 2] 4170 	ldw x,in.w 
      0095E5 83 40            [ 2] 4171 	ldw (INW,sp),x   
      0095E7 20 CF 00 23      [ 1] 4172 	bres flags,#FLOOP 
      0095E9 72 5C 00 20      [ 1] 4173 	inc loop_depth  
      0095E9 03               [ 4] 4174 	ret 
                                   4175 
                                   4176 ;--------------------------------
                                   4177 ; BASIC: NEXT var 
                                   4178 ; FOR loop control 
                                   4179 ; increment variable with step 
                                   4180 ; and compare with limit 
                                   4181 ; loop if threshold not crossed.
                                   4182 ; else stack. 
                                   4183 ; and decrement 'loop_depth' 
                                   4184 ;--------------------------------
      00175F                       4185 next: ; {var limit step retl1 -- [var limit step ] }
      0095EA 01 20 CD 20      [ 1] 4186 	tnz loop_depth 
      0095ED 26 03            [ 1] 4187 	jrne 1$ 
      0095ED CD 89 EF         [ 2] 4188 	jp syntax_error 
      001768                       4189 1$: 
      0095F0 A1 84            [ 1] 4190 	ld a,#TK_VAR 
      0095F2 27 03 CC         [ 4] 4191 	call expect
                                   4192 ; check for good variable after NEXT 	 
      0095F5 88 FD            [ 2] 4193 	cpw x,(CVAR,sp)
      0095F7 27 03            [ 1] 4194 	jreq 2$  
      0095F7 9F A4 0F         [ 2] 4195 	jp syntax_error ; not the good one 
      001774                       4196 2$: ; increment variable 
      0095FA C7               [ 2] 4197 	ldw x,(x)  ; get var value 
      0095FB 00 25 20         [ 2] 4198 	addw x,(FSTEP,sp) ; var+step 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0095FE B9 07            [ 2] 4199 	ldw y,(CVAR,sp)
      0095FF 90 FF            [ 2] 4200 	ldw (y),x ; save var new value 
                                   4201 ; check sign of STEP  
      0095FF 55 00            [ 1] 4202 	ld a,#0x80
      009601 03 00            [ 1] 4203 	bcp a,(FSTEP,sp)
      009603 02 CD            [ 1] 4204 	jrpl 4$
                                   4205 ;negative step 
      009605 92 15            [ 2] 4206 	cpw x,(LIMIT,sp)
      009607 A1 84            [ 1] 4207 	jrslt loop_done
      009609 26 05            [ 2] 4208 	jra loop_back 
      001788                       4209 4$: ; positive step
      00960B CD 8A            [ 2] 4210 	cpw x,(LIMIT,sp)
      00960D 50 20            [ 1] 4211 	jrsgt loop_done
      00178C                       4212 loop_back:
      00960F A8 0B            [ 2] 4213 	ldw x,(BPTR,sp)
      009610 CF 00 04         [ 2] 4214 	ldw basicptr,x 
      009610 0D 01 26 05 A6   [ 2] 4215 	btjf flags,#FRUN,1$ 
      009615 0D CD            [ 1] 4216 	ld a,(2,x)
      009617 83 40 5B         [ 1] 4217 	ld count,a
      00961A 01 81            [ 2] 4218 1$:	ldw x,(INW,sp)
      00961C CF 00 00         [ 2] 4219 	ldw in.w,x 
      00961C CE               [ 4] 4220 	ret 
      0017A1                       4221 loop_done:
                                   4222 	; remove loop data from stack  
      00961D 00               [ 2] 4223 	popw x
      0017A2                       4224 	_drop VSIZE 
      00961E 05 1F            [ 2]    1     addw sp,#VSIZE 
      009620 03 C6 00 02      [ 1] 4225 	dec loop_depth 
                                   4226 ;	pushw x 
                                   4227 ;	ret 
      009624 6B               [ 2] 4228 	jp (x)
                                   4229 
                                   4230 ;----------------------------
                                   4231 ; called by goto/gosub
                                   4232 ; to get target line number 
                                   4233 ;---------------------------
      0017A9                       4234 get_target_line:
      009625 05 C6 00         [ 4] 4235 	call relation 
      009628 04 6B            [ 1] 4236 	cp a,#TK_INTGR
      00962A 06 81            [ 1] 4237 	jreq 1$
      00962C CC 08 7D         [ 2] 4238 	jp syntax_error
      00962C 1E 03 CF         [ 4] 4239 1$:	call search_lineno  
      00962F 00               [ 2] 4240 	tnzw x 
      009630 05 7B            [ 1] 4241 	jrne 2$ 
      009632 05 C7            [ 1] 4242 	ld a,#ERR_NO_LINE 
      009634 00 02 7B         [ 2] 4243 	jp tb_error 
      009637 06               [ 4] 4244 2$:	ret 
                                   4245 
                                   4246 ;------------------------
                                   4247 ; BASIC: GOTO line# 
                                   4248 ; jump to line# 
                                   4249 ; here cstack is 2 call deep from interpreter 
                                   4250 ;------------------------
      0017BF                       4251 goto:
      009638 C7 00 04 81 06   [ 2] 4252 	btjt flags,#FRUN,0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      00963C A6 06            [ 1] 4253 	ld a,#ERR_RUN_ONLY
      00963C 52 07 7F         [ 2] 4254 	jp tb_error 
      00963E 81               [ 4] 4255 	ret 
      00963E 0F 05 CD         [ 4] 4256 0$:	call get_target_line
      0017CD                       4257 jp_to_target:
      009641 89 EF A1         [ 2] 4258 	ldw basicptr,x 
      009644 02 26            [ 1] 4259 	ld a,(2,x)
      009646 08 CD A8         [ 1] 4260 	ld count,a 
      009649 C0 03 05 CD      [ 1] 4261 	mov in,#3 
      00964D 89               [ 4] 4262 	ret 
                                   4263 
                                   4264 
                                   4265 ;--------------------
                                   4266 ; BASIC: GOSUB line#
                                   4267 ; basic subroutine call
                                   4268 ; actual line# and basicptr 
                                   4269 ; are saved on cstack
                                   4270 ; here cstack is 2 call deep from interpreter 
                                   4271 ;--------------------
                           000003  4272 	RET_ADDR=3
                           000005  4273 	RET_INW=5
                           000004  4274 	VSIZE=4  
      0017DA                       4275 gosub:
      00964E EF A1 85 27 03   [ 2] 4276 	btjt flags,#FRUN,0$ 
      009653 CC 88            [ 1] 4277 	ld a,#ERR_RUN_ONLY
      009655 FD 1F 06         [ 2] 4278 	jp tb_error 
      009658 0D               [ 4] 4279 	ret 
      009659 05               [ 2] 4280 0$:	popw x 
      0017E6                       4281 	_vars VSIZE  
      00965A 26 06            [ 2]    1     sub sp,#VSIZE 
      00965C CD               [ 2] 4282 	pushw x 
      00965D 94 05 CD         [ 2] 4283 	ldw x,basicptr
      009660 83 40            [ 2] 4284 	ldw (RET_ADDR,sp),x 
      009662 CD 17 A9         [ 4] 4285 	call get_target_line  
      009662 A6               [ 2] 4286 	pushw x 
      009663 3A CD 83         [ 2] 4287 	ldw x,in.w 
      009666 40 CD            [ 2] 4288 	ldw (RET_INW+2,sp),x
      009668 96               [ 2] 4289 	popw x 
      009669 1C 72            [ 2] 4290 	jra jp_to_target
                                   4291 
                                   4292 ;------------------------
                                   4293 ; BASIC: RETURN 
                                   4294 ; exit from a subroutine 
                                   4295 ; 
                                   4296 ;------------------------
      0017FA                       4297 return:
      00966B 5F 00 04 CD A9   [ 2] 4298 	btjt flags,#FRUN,0$ 
      009670 C5 AE            [ 1] 4299 	ld a,#ERR_RUN_ONLY
      009672 16 90 3B         [ 2] 4300 	jp tb_error 
      001804                       4301 0$:	
      009675 00 04            [ 2] 4302 	ldw x,(RET_ADDR,sp) 
      009677 4B 00 72         [ 2] 4303 	ldw basicptr,x
      00967A FB 01            [ 1] 4304 	ld a,(2,x)
      00967C 5C 5B 02         [ 1] 4305 	ld count,a  
      00967F 72 5F            [ 2] 4306 	ldw x,(RET_INW,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009681 00 02 CD         [ 2] 4307 	ldw in.w,x 
      009684 8C               [ 2] 4308 	popw x 
      001814                       4309 	_drop VSIZE 
      009685 74 A1            [ 2]    1     addw sp,#VSIZE 
      009687 84               [ 2] 4310 	pushw x
      009688 27               [ 4] 4311 	ret  
                                   4312 
                                   4313 
                                   4314 ;----------------------------------
                                   4315 ; BASIC: RUN
                                   4316 ; run BASIC program in RAM
                                   4317 ;----------------------------------- 
      001818                       4318 run: 
      009689 06 CD 96 2C CC   [ 2] 4319 	btjf flags,#FRUN,0$  
      00968E 88               [ 1] 4320 	clr a 
      00968F FD               [ 4] 4321 	ret
      00181F                       4322 0$: 
      009690 16 06 90 FF CD   [ 2] 4323 	btjf flags,#FBREAK,1$
      001824                       4324 	_drop 2 
      009695 96 2C            [ 2]    1     addw sp,#2 
      009697 CD 89 EF         [ 4] 4325 	call rest_context
      001829                       4326 	_drop CTXT_SIZE 
      00969A A1 09            [ 2]    1     addw sp,#CTXT_SIZE 
      00969C 27 A0 A1 01      [ 1] 4327 	bres flags,#FBREAK 
      0096A0 23 03 CC 88      [ 1] 4328 	bset flags,#FRUN 
      0096A4 FD 09 23         [ 2] 4329 	jp interpreter 
      0096A5 CE 00 1C         [ 2] 4330 1$:	ldw x,txtbgn
      0096A5 5B 07 81         [ 2] 4331 	cpw x,txtend 
      0096A8 2B 0C            [ 1] 4332 	jrmi run_it 
      0096A8 55 00 04         [ 2] 4333 	ldw x,#err_no_prog
      0096AB 00 02 81         [ 4] 4334 	call puts 
      0096AE 55 00 03 00 01   [ 1] 4335 	mov in,count
      0096AE 52               [ 4] 4336 	ret 
      00184A                       4337 run_it:	 
      0096AF 04 0F 01         [ 4] 4338     call ubound 
      00184D                       4339 	_drop 2 ; drop return address 
      0096B2 CD 90            [ 2]    1     addw sp,#2 
                                   4340 ; clear data pointer 
      0096B4 CA               [ 1] 4341 	clrw x 
      0096B5 A1 02 24         [ 2] 4342 	ldw data_ptr,x 
      0096B8 03 CC 88 FD      [ 1] 4343 	clr data_ofs 
      0096BC A1 03 25 04      [ 1] 4344 	clr data_len 
                                   4345 ; initialize BASIC pointer 
      0096C0 85 9F 6B         [ 2] 4346 	ldw x,txtbgn 
      0096C3 01 85 9F         [ 2] 4347 	ldw basicptr,x 
      0096C6 6B 02            [ 1] 4348 	ld a,(2,x)
      0096C8 85 F6 14         [ 1] 4349 	ld count,a
      0096CB 02 18 01 27      [ 1] 4350 	mov in,#3	
      0096CF F9 5B 04 81      [ 1] 4351 	bset flags,#FRUN 
      0096D3 CC 09 23         [ 2] 4352 	jp interpreter 
                                   4353 
                                   4354 
                                   4355 ;----------------------
                                   4356 ; BASIC: END
                                   4357 ; end running program
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4358 ;---------------------- 
      001871                       4359 cmd_end: 
                                   4360 ; clean stack 
      0096D3 CD 90 CA         [ 2] 4361 	ldw x,#STACK_EMPTY
      0096D6 A1               [ 1] 4362 	ldw sp,x 
      0096D7 02 27 03         [ 2] 4363 	jp warm_start
                                   4364 
                                   4365 ;-----------------
                                   4366 ; 1 Khz beep 
                                   4367 ;-----------------
      001878                       4368 beep_1khz:: 
      0096DA CC 88 FD         [ 2] 4369 	ldw x,#100
      0096DD 90 AE 03 E8      [ 2] 4370 	ldw y,#1000
      0096DD 85 9F            [ 2] 4371 	jra beep
                                   4372 
                                   4373 ;-----------------------
                                   4374 ; BASIC: TONE expr1,expr2
                                   4375 ; used TIMER2 channel 1
                                   4376 ; to produce a tone 
                                   4377 ; arguments:
                                   4378 ;    expr1   frequency 
                                   4379 ;    expr2   duration msec.
                                   4380 ;---------------------------
      001881                       4381 tone:
      0096DF 85 FA F7         [ 4] 4382 	call arg_list 
      0096E2 81 02            [ 1] 4383 	cp a,#2 
      0096E3 27 03            [ 1] 4384 	jreq 1$
      0096E3 CD 90 CA         [ 2] 4385 	jp syntax_error 
      00188B                       4386 1$: 
      0096E6 A1               [ 2] 4387 	popw x ; duration
      0096E7 02 27            [ 2] 4388 	popw y ; frequency 
      00188E                       4389 beep:  
      0096E9 03               [ 2] 4390 	pushw x 
      0096EA CC 88 FD         [ 2] 4391 	ldw x,#TIM2_CLK_FREQ
      0096ED 65               [ 2] 4392 	divw x,y 
                                   4393 ; round to nearest integer 
      0096ED 85 9F 43 85      [ 2] 4394 	cpw y,#TIM2_CLK_FREQ/2
      0096F1 F4 F7            [ 1] 4395 	jrmi 2$
      0096F3 81               [ 2] 4396 	incw x 
      0096F4                       4397 2$:	 
      0096F4 CD               [ 1] 4398 	ld a,xh 
      0096F5 90 CA A1         [ 1] 4399 	ld TIM2_ARRH,a 
      0096F8 02               [ 1] 4400 	ld a,xl 
      0096F9 27 03 CC         [ 1] 4401 	ld TIM2_ARRL,a 
                                   4402 ; 50% duty cycle 
      0096FC 88               [ 1] 4403 	ccf 
      0096FD FD               [ 2] 4404 	rrcw x 
      0096FE 85               [ 1] 4405 	ld a,xh 
      0096FF 9F 85 F8         [ 1] 4406 	ld TIM2_CCR1H,a 
      009702 F7               [ 1] 4407 	ld a,xl
      009703 81 53 10         [ 1] 4408 	ld TIM2_CCR1L,a
      009704 72 10 53 08      [ 1] 4409 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009704 CD 90 C5 A1      [ 1] 4410 	bset TIM2_CR1,#TIM2_CR1_CEN
      009708 02 27 03 CC      [ 1] 4411 	bset TIM2_EGR,#TIM2_EGR_UG
      00970C 88               [ 2] 4412 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00970D FD 1E 3E         [ 4] 4413 	call pause02
      00970E 72 11 53 08      [ 1] 4414 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00970E 85 9F A4 07      [ 1] 4415 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009712 88               [ 4] 4416 	ret 
                                   4417 
                                   4418 ;-------------------------------
                                   4419 ; BASIC: ADCON 0|1 [,divisor]  
                                   4420 ; disable/enanble ADC 
                                   4421 ;-------------------------------
                           000003  4422 	ONOFF=3 
                           000001  4423 	DIVSOR=1
                           000004  4424 	VSIZE=4 
      0018C5                       4425 power_adc:
      009713 A6 01 0D         [ 4] 4426 	call arg_list 
      009716 01 27            [ 1] 4427 	cp a,#2	
      009718 05 48            [ 1] 4428 	jreq 1$
      00971A 0A 01            [ 1] 4429 	cp a,#1 
      00971C 20 F7            [ 1] 4430 	jreq 0$ 
      00971E 5B 01 85         [ 2] 4431 	jp syntax_error 
      009721 F4 27 02         [ 2] 4432 0$: ldw x,#0
      009724 A6               [ 2] 4433 	pushw x  ; divisor 
      009725 01 5F            [ 2] 4434 1$: ldw x,(ONOFF,sp)
      009727 97               [ 2] 4435 	tnzw x 
      009728 A6 84            [ 1] 4436 	jreq 2$ 
      00972A 81 01            [ 2] 4437 	ldw x,(DIVSOR,sp) ; divisor 
      00972B 9F               [ 1] 4438 	ld a,xl
      00972B CD 90            [ 1] 4439 	and a,#7
      00972D CA               [ 1] 4440 	swap a 
      00972E A1 02 27         [ 1] 4441 	ld ADC_CR1,a
      009731 03 CC 88 FD      [ 1] 4442 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009735 72 10 54 01      [ 1] 4443 	bset ADC_CR1,#ADC_CR1_ADON 
      0018ED                       4444 	_usec_dly 7 
      009735 85 9F 85         [ 2]    1     ldw x,#(16*7-2)/4
      009738 F7               [ 2]    2     decw x
      009739 81               [ 1]    3     nop 
      00973A 26 FA            [ 1]    4     jrne .-4
      00973A CD 90            [ 2] 4445 	jra 3$
      00973C C5 A1 01 27      [ 1] 4446 2$: bres ADC_CR1,#ADC_CR1_ADON
      009740 03 CC 88 FD      [ 1] 4447 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0018FE                       4448 3$:	_drop VSIZE 
      009744 85 F6            [ 2]    1     addw sp,#VSIZE 
      009746 5F               [ 4] 4449 	ret
                                   4450 
                                   4451 ;-----------------------------
                                   4452 ; BASIC: ADCREAD (channel)
                                   4453 ; read adc channel {0..5}
                                   4454 ; output:
                                   4455 ;   A 		TK_INTGR 
                                   4456 ;   X 		value 
                                   4457 ;-----------------------------
      001901                       4458 analog_read:
      009747 97 A6 84         [ 4] 4459 	call func_args 
      00974A 81 01            [ 1] 4460 	cp a,#1 
      00974B 27 03            [ 1] 4461 	jreq 1$
      00974B CD 92 15         [ 2] 4462 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00974E A1               [ 2] 4463 1$: popw x 
      00974F 84 27 03         [ 2] 4464 	cpw x,#5 
      009752 CC 88            [ 2] 4465 	jrule 2$
      009754 FD 4F            [ 1] 4466 	ld a,#ERR_BAD_VALUE
      009756 5D 26 05         [ 2] 4467 	jp tb_error 
      009759 55               [ 1] 4468 2$: ld a,xl
      00975A 00 04 00         [ 1] 4469 	ld acc8,a 
      00975D 02 81            [ 1] 4470 	ld a,#5
      00975F C0 00 0D         [ 1] 4471 	sub a,acc8 
      00975F 85 52 0A         [ 1] 4472 	ld ADC_CSR,a
      009762 89 A6 85 CD      [ 1] 4473 	bset ADC_CR2,#ADC_CR2_ALIGN
      009766 90 B8 1F 07      [ 1] 4474 	bset ADC_CR1,#ADC_CR1_ADON
      00976A CD 92 F5 72 14   [ 2] 4475 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00976F 00 24 5F         [ 2] 4476 	ldw x,ADC_DRH
      009772 1F 0B            [ 1] 4477 	ld a,#TK_INTGR
      009774 1F               [ 4] 4478 	ret 
                                   4479 
                                   4480 ;-----------------------
                                   4481 ; BASIC: DREAD(pin)
                                   4482 ; Arduino pins 
                                   4483 ; read state of a digital pin 
                                   4484 ; pin# {0..15}
                                   4485 ; output:
                                   4486 ;    A 		TK_INTGR
                                   4487 ;    X      0|1 
                                   4488 ;-------------------------
                           000001  4489 	PINNO=1
                           000001  4490 	VSIZE=1
      001935                       4491 digital_read:
      001935                       4492 	_vars VSIZE 
      009775 09 CD            [ 2]    1     sub sp,#VSIZE 
      009777 89 EF A1         [ 4] 4493 	call func_args
      00977A 80 27            [ 1] 4494 	cp a,#1
      00977C 03 CC            [ 1] 4495 	jreq 1$
      00977E 88 FD 7D         [ 2] 4496 	jp syntax_error
      009780 85               [ 2] 4497 1$: popw x 
      009780 A3 97 88         [ 2] 4498 	cpw x,#15 
      009783 27 03            [ 2] 4499 	jrule 2$
      009785 CC 88            [ 1] 4500 	ld a,#ERR_BAD_VALUE
      009787 FD 08 7F         [ 2] 4501 	jp tb_error 
      009788 CD 1F 7C         [ 4] 4502 2$:	call select_pin 
      009788 72 04            [ 1] 4503 	ld (PINNO,sp),a
      00978A 00 24            [ 1] 4504 	ld a,(GPIO_IDR,x)
      00978C 03 CC            [ 1] 4505 	tnz (PINNO,sp)
      00978E 88 FD            [ 1] 4506 	jreq 8$
      009790 CD               [ 1] 4507 3$: srl a 
      009791 92 15            [ 1] 4508 	dec (PINNO,sp)
      009793 A1 84            [ 1] 4509 	jrne 3$ 
      009795 27 03            [ 1] 4510 8$: and a,#1 
      009797 CC               [ 1] 4511 	clrw x 
      009798 88               [ 1] 4512 	ld xl,a 
      009799 FD 1F            [ 1] 4513 	ld a,#TK_INTGR
      001962                       4514 	_drop VSIZE
      00979B 05 CD            [ 2]    1     addw sp,#VSIZE 
      00979D 89               [ 4] 4515 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4516 
                                   4517 ;-----------------------
                                   4518 ; BASIC: DWRITE pin,0|1
                                   4519 ; Arduino pins 
                                   4520 ; write to a digital pin 
                                   4521 ; pin# {0..15}
                                   4522 ; output:
                                   4523 ;    A 		TK_INTGR
                                   4524 ;    X      0|1 
                                   4525 ;-------------------------
                           000001  4526 	PINNO=1
                           000002  4527 	PINVAL=2
                           000002  4528 	VSIZE=2
      001965                       4529 digital_write:
      001965                       4530 	_vars VSIZE 
      00979E EF A1            [ 2]    1     sub sp,#VSIZE 
      0097A0 00 27 0E         [ 4] 4531 	call arg_list  
      0097A3 A1 80            [ 1] 4532 	cp a,#2 
      0097A5 26 05            [ 1] 4533 	jreq 1$
      0097A7 A3 97 B8         [ 2] 4534 	jp syntax_error
      0097AA 27               [ 2] 4535 1$: popw x 
      0097AB 0C               [ 1] 4536 	ld a,xl 
      0097AC 6B 02            [ 1] 4537 	ld (PINVAL,sp),a
      0097AC 55               [ 2] 4538 	popw x 
      0097AD 00 03 00         [ 2] 4539 	cpw x,#15 
      0097B0 02 05            [ 2] 4540 	jrule 2$
      0097B1 A6 0A            [ 1] 4541 	ld a,#ERR_BAD_VALUE
      0097B1 AE 00 01         [ 2] 4542 	jp tb_error 
      0097B4 1F 03 20         [ 4] 4543 2$:	call select_pin 
      0097B7 14 01            [ 1] 4544 	ld (PINNO,sp),a 
      0097B8 A6 01            [ 1] 4545 	ld a,#1
      0097B8 72 04            [ 1] 4546 	tnz (PINNO,sp)
      0097BA 00 24            [ 1] 4547 	jreq 4$
      0097BC 03               [ 1] 4548 3$: sll a
      0097BD CC 88            [ 1] 4549 	dec (PINNO,sp)
      0097BF FD CD            [ 1] 4550 	jrne 3$
      0097C1 92 15            [ 1] 4551 4$: tnz (PINVAL,sp)
      0097C3 A1 84            [ 1] 4552 	jrne 5$
      0097C5 27               [ 1] 4553 	cpl a 
      0097C6 03 CC            [ 1] 4554 	and a,(GPIO_ODR,x)
      0097C8 88 FD            [ 2] 4555 	jra 8$
      0097CA 1F 03            [ 1] 4556 5$: or a,(GPIO_ODR,x)
      0097CC E7 00            [ 1] 4557 8$: ld (GPIO_ODR,x),a 
      00199D                       4558 	_drop VSIZE 
      0097CC CE 00            [ 2]    1     addw sp,#VSIZE 
      0097CE 05               [ 4] 4559 	ret
                                   4560 
                                   4561 
                                   4562 ;-----------------------
                                   4563 ; BASIC: STOP
                                   4564 ; stop progam execution  
                                   4565 ; without resetting pointers 
                                   4566 ; the program is resumed
                                   4567 ; with RUN 
                                   4568 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0019A0                       4569 stop:
      0097CF 1F 0B CE 00 01   [ 2] 4570 	btjt flags,#FRUN,2$
      0097D4 1F               [ 1] 4571 	clr a
      0097D5 09               [ 4] 4572 	ret 
      0019A7                       4573 2$:	 
                                   4574 ; create space on cstack to save context 
      0097D6 72 15 00         [ 2] 4575 	ldw x,#break_point 
      0097D9 24 72 5C         [ 4] 4576 	call puts 
      0019AD                       4577 	_drop 2 ;drop return address 
      0097DC 00 21            [ 2]    1     addw sp,#2 
      0019AF                       4578 	_vars CTXT_SIZE ; context size 
      0097DE 81 04            [ 2]    1     sub sp,#CTXT_SIZE 
      0097DF CD 15 9C         [ 4] 4579 	call save_context 
      0097DF 72 5D 00         [ 2] 4580 	ldw x,#tib 
      0097E2 21 26 03         [ 2] 4581 	ldw basicptr,x
      0097E5 CC               [ 1] 4582 	clr (x)
      0097E6 88 FD 00 03      [ 1] 4583 	clr count  
      0097E8 5F               [ 1] 4584 	clrw x 
      0097E8 A6 85 CD         [ 2] 4585 	ldw in.w,x
      0097EB 90 B8 13 07      [ 1] 4586 	bres flags,#FRUN 
      0097EF 27 03 CC 88      [ 1] 4587 	bset flags,#FBREAK
      0097F3 FD 09 23         [ 2] 4588 	jp interpreter 
      0097F4 0A 62 72 65 61 6B 20  4589 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4590 
                                   4591 ;-----------------------
                                   4592 ; BASIC: NEW
                                   4593 ; from command line only 
                                   4594 ; free program memory
                                   4595 ; and clear variables 
                                   4596 ;------------------------
      0019EC                       4597 new: 
      0097F4 FE 72 FB 03 16   [ 2] 4598 	btjf flags,#FRUN,0$ 
      0097F9 07               [ 4] 4599 	ret 
      0019F2                       4600 0$:	
      0097FA 90 FF A6         [ 4] 4601 	call clear_basic 
      0097FD 80               [ 4] 4602 	ret 
                                   4603 	 
                                   4604 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4605 ;  file system routines
                                   4606 ;  MCU flash memory from
                                   4607 ;  0x10000-0x27fff is 
                                   4608 ;  used to store BASIC 
                                   4609 ;  program files. 
                                   4610 ;  use 128 bytes sectors
                                   4611 ;  because this is the MCU 
                                   4612 ;  row size.
                                   4613 ;  file entry aligned to row
                                   4614 ;  	name  variable length
                                   4615 ;  	size  2 bytes  
                                   4616 ; 	data  variable length 
                                   4617 ;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4618 
                                   4619 ;---------------------------
                                   4620 ; fill pad with zeros 
                                   4621 ;--------------------------
      0019F6                       4622 zero_pad:
      0097FE 15 03 2A         [ 2] 4623 	ldw x,#pad 
      009801 06 13            [ 1] 4624 	ld a,#PAD_SIZE 
      009803 05               [ 1] 4625 1$:	clr (x)
      009804 2F               [ 2] 4626 	incw x 
      009805 1B               [ 1] 4627 	dec a 
      009806 20 04            [ 1] 4628 	jrne 1$
      009808 81               [ 4] 4629 	ret 
                                   4630 
                                   4631 ;--------------------------
                                   4632 ; align farptr to BLOCK_SIZE 
                                   4633 ;---------------------------
      001A01                       4634 row_align:
      009808 13 05            [ 1] 4635 	ld a,#0x7f 
      00980A 2C 15 18         [ 1] 4636 	and a,farptr+2 
      00980C 27 13            [ 1] 4637 	jreq 1$ 
      00980C 1E 0B CF         [ 2] 4638 	ldw x,farptr+1 
      00980F 00 05 72         [ 2] 4639 	addw x,#BLOCK_SIZE 
      009812 01 00            [ 1] 4640 	jrnc 0$
      009814 24 05 E6 02      [ 1] 4641 	inc farptr 
      009818 C7               [ 1] 4642 0$: ld a,xl 
      009819 00 04            [ 1] 4643 	and a,#0x80
      00981B 1E               [ 1] 4644 	ld xl,a
      00981C 09 CF 00         [ 2] 4645 	ldw farptr+1,x  	
      00981F 01               [ 4] 4646 1$:	ret
                                   4647 
                                   4648 ;--------------------
                                   4649 ; input:
                                   4650 ;   X     increment 
                                   4651 ; output:
                                   4652 ;   farptr  incremented 
                                   4653 ;---------------------
      001A1C                       4654 incr_farptr:
      009820 81 BB 00 17      [ 2] 4655 	addw x,farptr+1 
      009821 24 04            [ 1] 4656 	jrnc 1$
      009821 85 5B 0A 72      [ 1] 4657 	inc farptr 
      009825 5A 00 21         [ 2] 4658 1$:	ldw farptr+1,x  
      009828 FC               [ 4] 4659 	ret 
                                   4660 
                                   4661 ;------------------------------
                                   4662 ; extended flash memory used as FLASH_DRIVE 
                                   4663 ; seek end of used flash drive   
                                   4664 ; starting at 0x10000 address.
                                   4665 ; 4 consecutives 0 bytes signal free space. 
                                   4666 ; input:
                                   4667 ;	none
                                   4668 ; output:
                                   4669 ;   ffree     free_addr| 0 if memory full.
                                   4670 ;------------------------------
      009829                       4671 seek_fdrive:
                                   4672 ; start scan at 0x10000 address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009829 CD 92            [ 1] 4673 	ld a,#1
      00982B 15 A1 84         [ 1] 4674 	ld farptr,a 
      00982E 27               [ 1] 4675 	clrw x 
      00982F 03 CC 88         [ 2] 4676 	ldw farptr+1,x 
      001A33                       4677 1$:
      009832 FD CD 84         [ 2] 4678 	ldw x,#3  
      009835 82 5D 26 05      [ 5] 4679 2$:	ldf a,([farptr],x) 
      009839 A6 05            [ 1] 4680 	jrne 3$
      00983B CC               [ 2] 4681 	decw x
      00983C 88 FF            [ 1] 4682 	jrpl 2$
      00983E 81 0E            [ 2] 4683 	jra 4$ 
      00983F AE 00 80         [ 2] 4684 3$:	ldw x,#BLOCK_SIZE 
      00983F 72 00 00         [ 4] 4685 	call incr_farptr
      009842 24 06 A6         [ 2] 4686 	ldw x,#0x280  
      009845 06 CC 88         [ 2] 4687 	cpw x,farptr
      009848 FF 81            [ 1] 4688 	jrmi 1$
      001A4F                       4689 4$: ; copy farptr to ffree	 
      00984A CD 98 29         [ 2] 4690 	ldw x,farptr 
      00984D C6 00 18         [ 1] 4691 	ld a,farptr+2 
      00984D CF 00 05         [ 2] 4692 	ldw ffree,x 
      009850 E6 02 C7         [ 1] 4693 	ld ffree+2,a  
      009853 00               [ 4] 4694 	ret 
                                   4695 
                                   4696 ;-----------------------
                                   4697 ; return amount of free 
                                   4698 ; space on flash drive
                                   4699 ; input:
                                   4700 ;   none
                                   4701 ; output:
                                   4702 ;   acc24   free space 
                                   4703 ;-----------------------
      001A5C                       4704 disk_free:
      009854 04 35 03         [ 2] 4705 	ldw x,#0x8000
      009857 00 02 81 1A      [ 2] 4706 	subw x,ffree+1
      00985A A6 02            [ 1] 4707 	ld a,#2
      00985A 72 00 00         [ 1] 4708 	sbc a,ffree 
      00985D 24 06 A6         [ 1] 4709 	ld acc24,a 
      009860 06 CC 88         [ 2] 4710 	ldw acc16,x 
      009863 FF               [ 4] 4711 	ret 
                                   4712 
                                   4713 ;-----------------------
                                   4714 ; compare file name 
                                   4715 ; with name pointed by Y  
                                   4716 ; input:
                                   4717 ;   farptr   file name 
                                   4718 ;   Y        target name 
                                   4719 ; output:
                                   4720 ;   farptr 	 at file_name
                                   4721 ;   X 		 farptr[x] point at size field  
                                   4722 ;   Carry    0|1 no match|match  
                                   4723 ;----------------------
      001A6F                       4724 cmp_name:
      009864 81               [ 1] 4725 	clrw x
      009865 85 52 04 89      [ 5] 4726 1$:	ldf a,([farptr],x)
      009869 CE 00            [ 1] 4727 	cp a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      00986B 05 1F            [ 1] 4728 	jrne 4$
      00986D 03               [ 1] 4729 	tnz a 
      00986E CD 98            [ 1] 4730 	jreq 9$ 
      009870 29               [ 2] 4731     incw x 
      009871 89 CE            [ 2] 4732 	incw y 
      009873 00 01            [ 2] 4733 	jra 1$
      001A80                       4734 4$: ;no match 
      009875 1F               [ 1] 4735 	tnz a 
      009876 07 85            [ 1] 4736 	jreq 5$
      009878 20               [ 2] 4737 	incw x 
      009879 D3 AF 00 16      [ 5] 4738 	ldf a,([farptr],x)
      00987A 20 F6            [ 2] 4739 	jra 4$  
      00987A 72               [ 2] 4740 5$:	incw x ; farptr[x] point at 'size' field 
      00987B 00               [ 1] 4741 	rcf 
      00987C 00               [ 4] 4742 	ret
      001A8D                       4743 9$: ; match  
      00987D 24               [ 2] 4744 	incw x  ; farptr[x] at 'size' field 
      00987E 05               [ 1] 4745 	scf 
      00987F A6               [ 4] 4746 	ret 
                                   4747 
                                   4748 ;-----------------------
                                   4749 ; search file in 
                                   4750 ; flash memory 
                                   4751 ; input:
                                   4752 ;   Y       file name  
                                   4753 ; output:
                                   4754 ;   farptr  addr at name|0
                                   4755 ;   X       offset to size field
                                   4756 ;-----------------------
                           000001  4757 	FSIZE=1
                           000003  4758 	YSAVE=3
                           000004  4759 	VSIZE=4 
      001A90                       4760 search_file: 
      001A90                       4761 	_vars VSIZE
      009880 06 CC            [ 2]    1     sub sp,#VSIZE 
      009882 88 FF            [ 2] 4762 	ldw (YSAVE,sp),y  
      009884 5F               [ 1] 4763 	clrw x 
      009884 1E 03 CF         [ 2] 4764 	ldw farptr+1,x 
      009887 00 05 E6 02      [ 1] 4765 	mov farptr,#1
      001A9C                       4766 1$:	
                                   4767 ; check if farptr is after any file 
                                   4768 ; if  0 then so.
      00988B C7 00 04 1E      [ 5] 4769 	ldf a,[farptr]
      00988F 05 CF            [ 1] 4770 	jreq 6$
      009891 00               [ 1] 4771 2$: clrw x 	
      009892 01 85            [ 2] 4772 	ldw y,(YSAVE,sp) 
      009894 5B 04 89         [ 4] 4773 	call cmp_name
      009897 81 2F            [ 1] 4774 	jrc 9$
      009898 92 AF 00 16      [ 5] 4775 	ldf a,([farptr],x)
      009898 72 01            [ 1] 4776 	ld (FSIZE,sp),a 
      00989A 00               [ 2] 4777 	incw x 
      00989B 24 02 4F 81      [ 5] 4778 	ldf a,([farptr],x)
      00989F 6B 02            [ 1] 4779 	ld (FSIZE+1,sp),a 
      00989F 72               [ 2] 4780 	incw x 
      0098A0 09 00 24         [ 2] 4781 	addw x,(FSIZE,sp) ; skip over file data
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0098A3 12 5B 02         [ 4] 4782 	call incr_farptr
      0098A6 CD 96 2C         [ 4] 4783 	call row_align  
      0098A9 5B 04 72         [ 2] 4784 	ldw x,#0x280
      0098AC 19 00 24         [ 2] 4785 	cpw x,farptr 
      0098AF 72 10            [ 1] 4786 	jrpl 1$
      001AC9                       4787 6$: ; file not found 
      0098B1 00 24 CC 89      [ 1] 4788 	clr farptr
      0098B5 A3 CE 00 1D      [ 1] 4789 	clr farptr+1 
      0098B9 C3 00 1F 2B      [ 1] 4790 	clr farptr+2 
      001AD5                       4791 	_drop VSIZE 
      0098BD 0C AE            [ 2]    1     addw sp,#VSIZE 
      0098BF 88               [ 1] 4792 	rcf
      0098C0 98               [ 4] 4793 	ret
      001AD9                       4794 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001AD9                       4795 	_drop VSIZE 
      0098C1 CD A8            [ 2]    1     addw sp,#VSIZE 
      0098C3 C0               [ 1] 4796 	scf 	
      0098C4 55               [ 4] 4797 	ret
                                   4798 
                                   4799 ;--------------------------------
                                   4800 ; BASIC: SAVE "name" 
                                   4801 ; save text program in 
                                   4802 ; flash memory used as permanent
                                   4803 ; storage from address 0x10000-0x27fff 
                                   4804 ;--------------------------------
                           000001  4805 	BSIZE=1
                           000003  4806 	NAMEPTR=3
                           000005  4807 	XSAVE=5
                           000007  4808 	YSAVE=7
                           000008  4809 	VSIZE=8 
      001ADD                       4810 save:
      0098C5 00 04 00 02 81   [ 2] 4811 	btjf flags,#FRUN,0$ 
      0098CA A6 07            [ 1] 4812 	ld a,#ERR_CMD_ONLY 
      0098CA CD 92 C2         [ 2] 4813 	jp tb_error
      001AE7                       4814 0$:	 
      0098CD 5B 02 5F         [ 2] 4815 	ldw x,txtend 
      0098D0 CF 00 07 72      [ 2] 4816 	subw x,txtbgn
      0098D4 5F 00            [ 1] 4817 	jrne 1$
                                   4818 ; nothing to save 
      0098D6 09 72 5F         [ 2] 4819 	ldw x,#err_no_prog 
      0098D9 00 0A CE         [ 4] 4820 	call puts 
      0098DC 00 1D CF 00 05   [ 1] 4821 	mov in,count 
      0098E1 E6               [ 4] 4822 	ret  	
      001AFC                       4823 1$:	
      001AFC                       4824 	_vars VSIZE 
      0098E2 02 C7            [ 2]    1     sub sp,#VSIZE 
      0098E4 00 04            [ 2] 4825 	ldw (BSIZE,sp),x 
      0098E6 35 03 00         [ 4] 4826 	call next_token	
      0098E9 02 72            [ 1] 4827 	cp a,#TK_QSTR
      0098EB 10 00            [ 1] 4828 	jreq 2$
      0098ED 24 CC 89         [ 2] 4829 	jp syntax_error
      001B0A                       4830 2$: 
      0098F0 A3 03            [ 2] 4831 	ldw (NAMEPTR,sp),x  
      0098F1 CD 01 74         [ 4] 4832 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4833 ; check if enough free space 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098F1 AE 17 FF         [ 4] 4834 	call strlen 
      0098F4 94 CC            [ 1] 4835 	add a,#3
      0098F6 89               [ 1] 4836 	clrw x 
      0098F7 84               [ 1] 4837 	ld xl,a 
      0098F8 72 FB 01         [ 2] 4838 	addw x,(BSIZE,sp)
      0098F8 AE               [ 1] 4839 	clr a 
      0098F9 00 64 90 AE      [ 2] 4840 	addw x,ffree+1 
      0098FD 03 E8 20         [ 1] 4841 	adc a,ffree 
      009900 0D 02            [ 1] 4842 	cp a,#2
      009901 2B 0A            [ 1] 4843 	jrmi 21$
      009901 CD 90 CA         [ 2] 4844 	cpw x,#0x8000
      009904 A1 02            [ 1] 4845 	jrmi 21$
      009906 27 03            [ 1] 4846 	ld a,#ERR_NO_FSPACE  
      009908 CC 88 FD         [ 2] 4847 	jp tb_error
      00990B                       4848 21$: 
                                   4849 ; check for existing file of that name 
      00990B 85 90            [ 2] 4850 	ldw y,(NAMEPTR,sp)	
      00990D 85 1A 90         [ 4] 4851 	call search_file 
      00990E 24 05            [ 1] 4852 	jrnc 3$ 
      00990E 89 AE            [ 1] 4853 	ld a,#ERR_DUPLICATE 
      009910 F4 24 65         [ 2] 4854 	jp tb_error 
      001B3B                       4855 3$:	; initialize farptr 
      009913 90 A3 7A         [ 2] 4856 	ldw x,ffree 
      009916 12 2B 01         [ 1] 4857 	ld a,ffree+2 
      009919 5C 00 16         [ 2] 4858 	ldw farptr,x 
      00991A C7 00 18         [ 1] 4859 	ld farptr+2,a 
                                   4860 ;** write file name to row buffer **	
      00991A 9E C7            [ 2] 4861 	ldw y,(NAMEPTR,sp)  
      00991C 53 0D 9F         [ 2] 4862 	ldw x,#pad 
      00991F C7 53 0E         [ 4] 4863 	call strcpy
      009922 8C 56 9E         [ 4] 4864 	call strlen 
      009925 C7               [ 1] 4865 	clrw x 
      009926 53               [ 1] 4866 	ld xl,a 
      009927 0F               [ 2] 4867 	incw  x
      009928 9F C7 53         [ 2] 4868 	addw x,#pad 
                                   4869 ; ** write file size to row buffer 
      00992B 10 72            [ 2] 4870 	ldw y,(BSIZE,sp)
      00992D 10               [ 2] 4871 	ldw (x),y 
      00992E 53 08 72         [ 2] 4872 	addw x,#2 
                                   4873 ; ** write file data to row buffer 
      009931 10 53 00 72      [ 2] 4874 	ldw y,txtbgn 
      009935 10 53            [ 1] 4875 6$:	ld a,(y)
      009937 04 85            [ 2] 4876 	incw y
      009939 CD               [ 1] 4877 	ld (x),a 
      00993A 9E               [ 2] 4878 	incw x
      00993B BE 72 11 53      [ 2] 4879 	cpw y,txtend 
      00993F 08 72            [ 1] 4880 	jreq 12$
      009941 11 53 00         [ 2] 4881 	cpw x,#stack_full 
      009944 81 EF            [ 1] 4882 	jrmi 6$
      009945                       4883 12$:
      009945 CD 90            [ 2] 4884 	ldw (YSAVE,sp),y 
      001B75                       4885 14$: ; zero buffer end 
      009947 CA A1 02         [ 2] 4886 	cpw x,#stack_full
      00994A 27 0B            [ 1] 4887 	jreq 16$
      00994C A1               [ 1] 4888 	clr (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      00994D 01               [ 2] 4889 	incw x 
      00994E 27 03            [ 2] 4890 	jra 14$
      001B7E                       4891 16$:
      009950 CC 88 FD         [ 2] 4892 	ldw x,#pad 
      009953 AE 00 00         [ 4] 4893 	call write_row 
      009956 89 1E 03         [ 2] 4894 	ldw x,#BLOCK_SIZE 
      009959 5D 27 1A         [ 4] 4895 	call incr_farptr
      00995C 1E 01 9F         [ 2] 4896 	ldw x,#pad 
      00995F A4 07            [ 2] 4897 	ldw y,(YSAVE,sp)
      009961 4E C7 54 01      [ 2] 4898 	cpw y,txtend 
      009965 72 16            [ 1] 4899 	jrmi 6$
                                   4900 ; save farptr in ffree
      009967 50 CA 72         [ 2] 4901 	ldw x,farptr 
      00996A 10 54 01         [ 1] 4902 	ld a,farptr+2 
      00996D AE 00 1B         [ 2] 4903 	ldw ffree,x 
      009970 5A 9D 26         [ 1] 4904 	ld ffree+2,a
                                   4905 ; print file size 	
      009973 FA 20            [ 2] 4906 	ldw x,(BSIZE,sp) 
      009975 08 72 11         [ 4] 4907 	call print_int 
      001BA6                       4908 	_drop VSIZE 
      009978 54 01            [ 2]    1     addw sp,#VSIZE 
      00997A 72               [ 4] 4909 	ret 
                                   4910 
                                   4911 ;----------------------
                                   4912 ; load file in RAM memory
                                   4913 ; input:
                                   4914 ;    farptr point at file size 
                                   4915 ; output:
                                   4916 ;   y point after BASIC program in RAM.
                                   4917 ;------------------------
      001BA9                       4918 load_file:
      00997B 17 50 CA         [ 4] 4919 	call incr_farptr  
      00997E 5B 04 81         [ 4] 4920 	call clear_basic  
      009981 5F               [ 1] 4921 	clrw x
      009981 CD 90 C5 A1      [ 5] 4922 	ldf a,([farptr],x)
      009985 01 27            [ 1] 4923 	ld yh,a 
      009987 03               [ 2] 4924 	incw x  
      009988 CC 88 FD 85      [ 5] 4925 	ldf a,([farptr],x)
      00998C A3               [ 2] 4926 	incw x 
      00998D 00 05            [ 1] 4927 	ld yl,a 
      00998F 23 05 A6 0A      [ 2] 4928 	addw y,txtbgn
      009993 CC 88 FF 9F      [ 2] 4929 	ldw txtend,y
      009997 C7 00 0E A6      [ 2] 4930 	ldw y,txtbgn
      001BCA                       4931 3$:	; load BASIC text 	
      00999B 05 C0 00 0E      [ 5] 4932 	ldf a,([farptr],x)
      00999F C7 54            [ 1] 4933 	ld (y),a 
      0099A1 00               [ 2] 4934 	incw x 
      0099A2 72 16            [ 2] 4935 	incw y 
      0099A4 54 02 72 10      [ 2] 4936 	cpw y,txtend 
      0099A8 54 01            [ 1] 4937 	jrmi 3$
      0099AA 72               [ 4] 4938 	ret 
                                   4939 
                                   4940 ;------------------------
                                   4941 ; BASIC: LOAD "file" 
                                   4942 ; load file to RAM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4943 ; for execution 
                                   4944 ;------------------------
      001BDA                       4945 load:
      0099AB 0F 54 00 FB CE   [ 2] 4946 	btjf flags,#FRUN,0$ 
      0099B0 54 04            [ 1] 4947 	jreq 0$ 
      0099B2 A6 84            [ 1] 4948 	ld a,#ERR_CMD_ONLY 
      0099B4 81 08 7F         [ 2] 4949 	jp tb_error 
      0099B5                       4950 0$:	
      0099B5 52 01 CD         [ 4] 4951 	call next_token 
      0099B8 90 C5            [ 1] 4952 	cp a,#TK_QSTR
      0099BA A1 01            [ 1] 4953 	jreq 1$
      0099BC 27 03 CC         [ 2] 4954 	jp syntax_error 
      0099BF 88 FD            [ 1] 4955 1$:	ldw y,x 
      0099C1 85 A3 00         [ 4] 4956 	call search_file 
      0099C4 0F 23            [ 1] 4957 	jrc 2$ 
      0099C6 05 A6            [ 1] 4958 	ld a,#ERR_NOT_FILE
      0099C8 0A CC 88         [ 2] 4959 	jp tb_error  
      001BFC                       4960 2$:
      0099CB FF CD 9F         [ 4] 4961 	call load_file
                                   4962 ; print loaded size 	 
      0099CE FC 6B 01         [ 2] 4963 	ldw x,txtend 
      0099D1 E6 01 0D 01      [ 2] 4964 	subw x,txtbgn
      0099D5 27 05 44         [ 4] 4965 	call print_int 
      0099D8 0A               [ 4] 4966 	ret 
                                   4967 
                                   4968 ;-----------------------------------
                                   4969 ; BASIC: FORGET ["file_name"] 
                                   4970 ; erase file_name and all others 
                                   4971 ; after it. 
                                   4972 ; without argument erase all files 
                                   4973 ;-----------------------------------
                           000001  4974 	NEW_FREE=1 
                           000003  4975 	VSIZE=3 
      001C0A                       4976 forget:
      001C0A                       4977 	_vars VSIZE 
      0099D9 01 26            [ 2]    1     sub sp,#VSIZE 
      0099DB FB A4 01         [ 4] 4978 	call next_token 
      0099DE 5F 97            [ 1] 4979 	cp a,#TK_NONE 
      0099E0 A6 84            [ 1] 4980 	jreq 3$ 
      0099E2 5B 01            [ 1] 4981 	cp a,#TK_QSTR
      0099E4 81 03            [ 1] 4982 	jreq 1$
      0099E5 CC 08 7D         [ 2] 4983 	jp syntax_error
      0099E5 52 02            [ 1] 4984 1$: ldw y,x 
      0099E7 CD 90 CA A1 02   [ 1] 4985 	mov in,count 
      0099EC 27 03 CC         [ 4] 4986 	call search_file
      0099EF 88 FD            [ 1] 4987 	jrc 2$
      0099F1 85 9F            [ 1] 4988 	ld a,#ERR_NOT_FILE 
      0099F3 6B 02 85         [ 2] 4989 	jp tb_error 
      001C2B                       4990 2$: 
      0099F6 A3 00 0F         [ 2] 4991 	ldw x,farptr
      0099F9 23 05 A6         [ 1] 4992 	ld a,farptr+2
      0099FC 0A CC            [ 2] 4993 	jra 4$ 
      001C33                       4994 3$: ; forget all files 
      0099FE 88 FF CD         [ 2] 4995 	ldw x,#0x100
      009A01 9F               [ 1] 4996 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009A02 FC 6B 01         [ 2] 4997 	ldw farptr,x 
      009A05 A6 01 0D         [ 1] 4998 	ld farptr+2,a 
      001C3D                       4999 4$:	; save new free address 
      009A08 01 27            [ 2] 5000 	ldw (NEW_FREE,sp),x
      009A0A 05 48            [ 1] 5001 	ld (NEW_FREE+2,sp),a 
      009A0C 0A 01 26         [ 4] 5002 	call move_erase_to_ram
      009A0F FB 0D 02         [ 4] 5003 5$: call block_erase 
      009A12 26 05 43         [ 2] 5004 	ldw x,#BLOCK_SIZE 
      009A15 E4 00 20         [ 4] 5005 	call incr_farptr 
      009A18 02 EA 00         [ 4] 5006 	call row_align 
                                   5007 ; check if all blocks erased
      009A1B E7 00 5B         [ 1] 5008 	ld a,farptr+2  
      009A1E 02 81 1B         [ 1] 5009 	sub a,ffree+2
      009A20 C6 00 17         [ 1] 5010 	ld a,farptr+1 
      009A20 72 00 00         [ 1] 5011 	sbc a,ffree+1 
      009A23 24 02 4F         [ 1] 5012 	ld a,farptr 
      009A26 81 00 19         [ 1] 5013 	sbc a,ffree 
      009A27 2B E0            [ 1] 5014 	jrmi 5$ 
      009A27 AE 9A            [ 1] 5015 	ld a,(NEW_FREE+2,sp)
      009A29 4E CD            [ 2] 5016 	ldw x,(NEW_FREE,sp)
      009A2B A8 C0 5B         [ 1] 5017 	ld ffree+2,a 
      009A2E 02 52 04         [ 2] 5018 	ldw ffree,x 
      001C6E                       5019 	_drop VSIZE 
      009A31 CD 96            [ 2]    1     addw sp,#VSIZE 
      009A33 1C               [ 4] 5020 	ret 
                                   5021 
                                   5022 ;----------------------
                                   5023 ; BASIC: DIR 
                                   5024 ; list saved files 
                                   5025 ;----------------------
                           000001  5026 	COUNT=1 ; files counter 
                           000002  5027 	VSIZE=2 
      001C71                       5028 directory:
      001C71                       5029 	_vars VSIZE 
      009A34 AE 16            [ 2]    1     sub sp,#VSIZE 
      009A36 90               [ 1] 5030 	clrw x 
      009A37 CF 00            [ 2] 5031 	ldw (COUNT,sp),x 
      009A39 05 7F 72         [ 2] 5032 	ldw farptr+1,x 
      009A3C 5F 00 04 5F      [ 1] 5033 	mov farptr,#1 
      001C7D                       5034 dir_loop:
      009A40 CF               [ 1] 5035 	clrw x 
      009A41 00 01 72 11      [ 5] 5036 	ldf a,([farptr],x)
      009A45 00 24            [ 1] 5037 	jreq 8$ 
      001C84                       5038 1$: ;name loop 	
      009A47 72 18 00 24      [ 5] 5039 	ldf a,([farptr],x)
      009A4B CC 89            [ 1] 5040 	jreq 2$ 
      009A4D A3 0A 62         [ 4] 5041 	call putc 
      009A50 72               [ 2] 5042 	incw x 
      009A51 65 61            [ 2] 5043 	jra 1$
      009A53 6B               [ 2] 5044 2$: incw x ; skip ending 0. 
      009A54 20 70            [ 1] 5045 	ld a,#SPACE 
      009A56 6F 69 6E         [ 4] 5046 	call putc 
                                   5047 ; get file size 	
      009A59 74 2C 20 52      [ 5] 5048 	ldf a,([farptr],x)
      009A5D 55 4E            [ 1] 5049 	ld yh,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A5F 20               [ 2] 5050 	incw x 
      009A60 74 6F 20 72      [ 5] 5051 	ldf a,([farptr],x)
      009A64 65               [ 2] 5052 	incw x 
      009A65 73 75            [ 1] 5053 	ld yl,a 
      009A67 6D 65            [ 2] 5054 	pushw y 
      009A69 2E 0A 00         [ 2] 5055 	addw x,(1,sp)
                                   5056 ; skip to next file 
      009A6C CD 1A 1C         [ 4] 5057 	call incr_farptr
      009A6C 72 01 00         [ 4] 5058 	call row_align
                                   5059 ; print file size 
      009A6F 24               [ 2] 5060 	popw x ; file size 
      009A70 01 81 D0         [ 4] 5061 	call print_int 
      009A72 A6 0D            [ 1] 5062 	ld a,#CR 
      009A72 CD 87 69         [ 4] 5063 	call putc
      009A75 81 01            [ 2] 5064 	ldw x,(COUNT,sp)
      009A76 5C               [ 2] 5065 	incw x
      009A76 AE 16            [ 2] 5066 	ldw (COUNT,sp),x  
      009A78 E0 A6            [ 2] 5067 	jra dir_loop
      001CBF                       5068 8$: ; print number of files 
      009A7A 80 7F            [ 2] 5069 	ldw x,(COUNT,sp)
      009A7C 5C 4A 26         [ 4] 5070 	call print_int 
      009A7F FB 81 DE         [ 2] 5071 	ldw x,#file_count 
      009A81 CD 00 00         [ 4] 5072 	call puts  
                                   5073 ; print drive free space 	
      009A81 A6 7F C4         [ 4] 5074 	call disk_free
      009A84 00               [ 1] 5075 	clrw x  
      009A85 19 27 13 CE      [ 1] 5076 	mov base,#10 
      009A89 00 18 1C         [ 4] 5077 	call prti24 
      009A8C 00 80 24         [ 2] 5078 	ldw x,#drive_free
      009A8F 04 72 5C         [ 4] 5079 	call puts 
      001CDB                       5080 	_drop VSIZE 
      009A92 00 17            [ 2]    1     addw sp,#VSIZE 
      009A94 9F               [ 4] 5081 	ret
      009A95 A4 80 97 CF 00 18 81  5082 file_count: .asciz " files\n"
             00
      009A9C 20 62 79 74 65 73 20  5083 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5084 
                                   5085 ;---------------------
                                   5086 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5087 ; write 1 or more byte to FLASH or EEPROM
                                   5088 ; starting at address  
                                   5089 ; input:
                                   5090 ;   expr1  	is address 
                                   5091 ;   expr2,...,exprn   are bytes to write
                                   5092 ; output:
                                   5093 ;   none 
                                   5094 ;---------------------
                           000001  5095 	ADDR=1
                           000002  5096 	VSIZ=2 
      001CF3                       5097 write:
      001CF3                       5098 	_vars VSIZE 
      009A9C 72 BB            [ 2]    1     sub sp,#VSIZE 
      009A9E 00 18 24 04      [ 1] 5099 	clr farptr ; expect 16 bits address 
      009AA2 72 5C 00         [ 4] 5100 	call expression
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009AA5 17 CF            [ 1] 5101 	cp a,#TK_INTGR 
      009AA7 00 18            [ 1] 5102 	jreq 0$
      009AA9 81 08 7D         [ 2] 5103 	jp syntax_error
      009AAA 1F 01            [ 2] 5104 0$: ldw (ADDR,sp),x 
      009AAA A6 01 C7         [ 4] 5105 	call next_token 
      009AAD 00 17            [ 1] 5106 	cp a,#TK_COMMA 
      009AAF 5F CF            [ 1] 5107 	jreq 1$ 
      009AB1 00 18            [ 2] 5108 	jra 9$ 
      009AB3 CD 11 49         [ 4] 5109 1$:	call expression
      009AB3 AE 00            [ 1] 5110 	cp a,#TK_INTGR
      009AB5 03 92            [ 1] 5111 	jreq 2$
      009AB7 AF 00 17         [ 2] 5112 	jp syntax_error
      009ABA 26               [ 1] 5113 2$:	ld a,xl 
      009ABB 05 5A            [ 2] 5114 	ldw x,(ADDR,sp) 
      009ABD 2A F7 20         [ 2] 5115 	ldw farptr+1,x 
      009AC0 0E               [ 1] 5116 	clrw x 
      009AC1 AE 00 80         [ 4] 5117 	call write_byte
      009AC4 CD 9A            [ 2] 5118 	ldw x,(ADDR,sp)
      009AC6 9C               [ 2] 5119 	incw x 
      009AC7 AE 02            [ 2] 5120 	jra 0$ 
      001D27                       5121 9$:
      001D27                       5122 	_drop VSIZE
      009AC9 80 C3            [ 2]    1     addw sp,#VSIZE 
      009ACB 00               [ 4] 5123 	ret 
                                   5124 
                                   5125 
                                   5126 ;---------------------
                                   5127 ;BASIC: CHAR(expr)
                                   5128 ; évaluate expression 
                                   5129 ; and take the 7 least 
                                   5130 ; bits as ASCII character
                                   5131 ; return a TK_CHAR 
                                   5132 ;---------------------
      001D2A                       5133 char:
      009ACC 17 2B E4         [ 4] 5134 	call func_args 
      009ACF A1 01            [ 1] 5135 	cp a,#1
      009ACF CE 00            [ 1] 5136 	jreq 1$
      009AD1 17 C6 00         [ 2] 5137 	jp syntax_error
      009AD4 19               [ 2] 5138 1$:	popw x 
      009AD5 CF               [ 1] 5139 	ld a,xl 
      009AD6 00 1A            [ 1] 5140 	and a,#0x7f 
      009AD8 C7               [ 1] 5141 	ld xl,a
      009AD9 00 1C            [ 1] 5142 	ld a,#TK_CHAR
      009ADB 81               [ 4] 5143 	ret
                                   5144 
                                   5145 ;---------------------
                                   5146 ; BASIC: ASC(string|char|TK_CFUNC)
                                   5147 ; extract first character 
                                   5148 ; of string argument 
                                   5149 ; return it as TK_INTGR 
                                   5150 ;---------------------
      009ADC                       5151 ascii:
      009ADC AE 80            [ 1] 5152 	ld a,#TK_LPAREN
      009ADE 00 72 B0         [ 4] 5153 	call expect 
      009AE1 00 1B A6         [ 4] 5154 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009AE4 02 C2            [ 1] 5155 	cp a,#TK_QSTR 
      009AE6 00 1A            [ 1] 5156 	jreq 1$
      009AE8 C7 00            [ 1] 5157 	cp a,#TK_CHAR 
      009AEA 0C CF            [ 1] 5158 	jreq 2$ 
      009AEC 00 0D            [ 1] 5159 	cp a,#TK_CFUNC 
      009AEE 81 03            [ 1] 5160 	jreq 0$
      009AEF CC 08 7D         [ 2] 5161 	jp syntax_error
      009AEF 5F               [ 4] 5162 0$: call (x)
      009AF0 92 AF            [ 2] 5163 	jra 2$
      001D56                       5164 1$: 
      009AF2 00               [ 1] 5165 	ld a,(x) 
      009AF3 17               [ 1] 5166 	clrw x
      009AF4 90               [ 1] 5167 	ld xl,a 
      001D59                       5168 2$: 
      009AF5 F1               [ 2] 5169 	pushw x 
      009AF6 26 08            [ 1] 5170 	ld a,#TK_RPAREN 
      009AF8 4D 27 12         [ 4] 5171 	call expect
      009AFB 5C               [ 2] 5172 	popw x 
      009AFC 90 5C            [ 1] 5173 	ld a,#TK_INTGR 
      009AFE 20               [ 4] 5174 	ret 
                                   5175 
                                   5176 ;---------------------
                                   5177 ;BASIC: KEY
                                   5178 ; wait for a character 
                                   5179 ; received from STDIN 
                                   5180 ; input:
                                   5181 ;	none 
                                   5182 ; output:
                                   5183 ;	X 		ASCII character 
                                   5184 ;---------------------
      001D63                       5185 key:
      009AFF F0 02 C9         [ 4] 5186 	call getc 
      009B00 5F               [ 1] 5187 	clrw x 
      009B00 4D               [ 1] 5188 	ld xl,a 
      009B01 27 07            [ 1] 5189 	ld a,#TK_INTGR
      009B03 5C               [ 4] 5190 	ret
                                   5191 
                                   5192 ;----------------------
                                   5193 ; BASIC: QKEY
                                   5194 ; Return true if there 
                                   5195 ; is a character in 
                                   5196 ; waiting in STDIN 
                                   5197 ; input:
                                   5198 ;  none 
                                   5199 ; output:
                                   5200 ;   X 		0|-1 
                                   5201 ;-----------------------
      001D6B                       5202 qkey:: 
      009B04 92               [ 1] 5203 	clrw x 
      009B05 AF 00 17         [ 1] 5204 	ld a,rx_head
      009B08 20 F6 5C         [ 1] 5205 	cp a,rx_tail 
      009B0B 98 81            [ 1] 5206 	jreq 9$ 
      009B0D 53               [ 2] 5207 	cplw x 
      009B0D 5C 99            [ 1] 5208 9$: ld a,#TK_INTGR
      009B0F 81               [ 4] 5209 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5210 
                                   5211 ;---------------------
                                   5212 ; BASIC: GPIO(expr,reg)
                                   5213 ; return gpio address 
                                   5214 ; expr {0..8}
                                   5215 ; input:
                                   5216 ;   none 
                                   5217 ; output:
                                   5218 ;   X 		gpio register address
                                   5219 ;----------------------------
                           000003  5220 	PORT=3
                           000001  5221 	REG=1 
                           000004  5222 	VSIZE=4 
      009B10                       5223 gpio:
      009B10 52 04 17         [ 4] 5224 	call func_args 
      009B13 03 5F            [ 1] 5225 	cp a,#2
      009B15 CF 00            [ 1] 5226 	jreq 1$
      009B17 18 35 01         [ 2] 5227 	jp syntax_error  
      001D82                       5228 1$:	
      009B1A 00 17            [ 2] 5229 	ldw x,(PORT,sp)
      009B1C 2B 17            [ 1] 5230 	jrmi bad_port
      009B1C 92 BC 00         [ 2] 5231 	cpw x,#9
      009B1F 17 27            [ 1] 5232 	jrpl bad_port
      009B21 27 5F            [ 1] 5233 	ld a,#5
      009B23 16               [ 4] 5234 	mul x,a
      009B24 03 CD 9A         [ 2] 5235 	addw x,#GPIO_BASE 
      009B27 EF 25            [ 2] 5236 	ldw (PORT,sp),x  
      009B29 2F 92            [ 2] 5237 	ldw x,(REG,sp) 
      009B2B AF 00 17         [ 2] 5238 	addw x,(PORT,sp)
      009B2E 6B 01            [ 1] 5239 	ld a,#TK_INTGR
      001D9A                       5240 	_drop VSIZE 
      009B30 5C 92            [ 2]    1     addw sp,#VSIZE 
      009B32 AF               [ 4] 5241 	ret
      001D9D                       5242 bad_port:
      009B33 00 17            [ 1] 5243 	ld a,#ERR_BAD_VALUE
      009B35 6B 02 5C         [ 2] 5244 	jp tb_error
                                   5245 
                                   5246 
                                   5247 ;-------------------------
                                   5248 ; BASIC: UFLASH 
                                   5249 ; return user flash address
                                   5250 ; input:
                                   5251 ;  none 
                                   5252 ; output:
                                   5253 ;	A		TK_INTGR
                                   5254 ;   X 		user address 
                                   5255 ;---------------------------
      001DA2                       5256 uflash:
      009B38 72 FB 01         [ 2] 5257 	ldw x,#user_space 
      009B3B CD 9A            [ 1] 5258 	ld a,#TK_INTGR 
      009B3D 9C               [ 4] 5259 	ret 
                                   5260 
                                   5261 
                                   5262 ;---------------------
                                   5263 ; BASIC: USR(addr[,arg])
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5264 ; execute a function written 
                                   5265 ; in binary code.
                                   5266 ; binary fonction should 
                                   5267 ; return token attribute in A 
                                   5268 ; and value in X. 
                                   5269 ; input:
                                   5270 ;   addr	routine address 
                                   5271 ;   arg 	is an optional argument 
                                   5272 ; output:
                                   5273 ;   A 		token attribute 
                                   5274 ;   X       returned value 
                                   5275 ;---------------------
      001DA8                       5276 usr:
      009B3E CD 9A            [ 2] 5277 	pushw y 	
      009B40 81 AE 02         [ 4] 5278 	call func_args 
      009B43 80 C3            [ 1] 5279 	cp a,#1 
      009B45 00 17            [ 1] 5280 	jreq 2$
      009B47 2A D3            [ 1] 5281 	cp a,#2
      009B49 27 03            [ 1] 5282 	jreq 2$  
      009B49 72 5F 00         [ 2] 5283 	jp syntax_error 
      009B4C 17 72            [ 2] 5284 2$: popw y  ; arg|addr 
      009B4E 5F 00            [ 1] 5285 	cp a,#1
      009B50 18 72            [ 1] 5286 	jreq 3$
      009B52 5F               [ 2] 5287 	popw x ; addr
      009B53 00               [ 1] 5288 	exgw x,y 
      009B54 19 5B            [ 4] 5289 3$: call (y)
      009B56 04 98            [ 2] 5290 	popw y 
      009B58 81               [ 4] 5291 	ret 
                                   5292 
                                   5293 ;------------------------------
                                   5294 ; BASIC: BYE 
                                   5295 ; halt mcu in its lowest power mode 
                                   5296 ; wait for reset or external interrupt
                                   5297 ; do a cold start on wakeup.
                                   5298 ;------------------------------
      009B59                       5299 bye:
      009B59 5B 04 99 81 FB   [ 2] 5300 	btjf UART1_SR,#UART_SR_TC,.
      009B5D 8E               [10] 5301 	halt
      009B5D 72 01 00         [ 2] 5302 	jp cold_start  
                                   5303 
                                   5304 ;----------------------------------
                                   5305 ; BASIC: AUTORUN ["file_name"] 
                                   5306 ; record in eeprom at adrress AUTORUN_NAME
                                   5307 ; the name of file to load and execute
                                   5308 ; at startup. 
                                   5309 ; empty string delete autorun name 
                                   5310 ; no argument display autorun name  
                                   5311 ; input:
                                   5312 ;   file_name   file to execute 
                                   5313 ; output:
                                   5314 ;   none
                                   5315 ;-----------------------------------
      001DCE                       5316 autorun: 
      009B60 24 05 A6 07 CC   [ 2] 5317 	btjf flags,#FRUN,0$ 
      009B65 88 FF            [ 1] 5318 	jreq 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B67 A6 07            [ 1] 5319 	ld a,#ERR_CMD_ONLY 
      009B67 CE 00 1F         [ 2] 5320 	jp tb_error 
      001DDA                       5321 0$:	
      009B6A 72 B0 00         [ 4] 5322 	call next_token
      009B6D 1D               [ 1] 5323 	tnz a 
      009B6E 26 0C            [ 1] 5324 	jrne 1$
      009B70 AE 88 98         [ 2] 5325 	ldw x,#AUTORUN_NAME
      009B73 CD A8 C0         [ 4] 5326 	call puts 
      009B76 55               [ 1] 5327 	clr a 
      009B77 00               [ 4] 5328 	ret 
      001DE8                       5329 1$:
      009B78 04 00            [ 1] 5330 	cp a,#TK_QSTR
      009B7A 02 81            [ 1] 5331 	jreq 2$
      009B7C CC 08 7D         [ 2] 5332 	jp syntax_error 
      001DEF                       5333 2$:	
      009B7C 52               [ 1] 5334 	tnz (x) 
      009B7D 08 1F            [ 1] 5335 	jrne 3$
                                   5336 ; empty string, delete autorun 	
      009B7F 01 CD 89         [ 4] 5337 	call cancel_autorun
      009B82 EF A1 02 27 03   [ 1] 5338 	mov in,count 
      009B87 CC               [ 4] 5339 	ret 
      009B88 88               [ 2] 5340 3$:	pushw x 
      009B89 FD 93            [ 1] 5341 	ldw y,x  
      009B8A CD 1A 90         [ 4] 5342 	call search_file 
      009B8A 1F 03            [ 1] 5343 	jrc 4$ 
      009B8C CD 81            [ 1] 5344 	ld a,#ERR_NOT_FILE
      009B8E F4 CD 84         [ 2] 5345 	jp tb_error  
      001E08                       5346 4$: 
      009B91 16 AB 03 5F 97   [ 1] 5347 	mov in,count 
      009B96 72 FB 01 4F      [ 1] 5348 	clr farptr 
      009B9A 72 BB 00         [ 2] 5349 	ldw x,#AUTORUN_NAME
      009B9D 1B C9 00         [ 2] 5350 	ldw farptr+1,x 
      009BA0 1A A1            [ 2] 5351 	ldw x,(1,sp)  
      009BA2 02 2B 0A         [ 4] 5352 	call strlen  ; return length in A 
      009BA5 A3               [ 1] 5353 	clrw x 
      009BA6 80               [ 1] 5354 	ld xl,a 
      009BA7 00               [ 2] 5355 	incw x 
      009BA8 2B 05            [ 2] 5356 	popw y 
      009BAA A6               [ 2] 5357 	pushw x 
      009BAB 0E               [ 1] 5358 	clrw x 
      009BAC CC 88 FF         [ 4] 5359 	call write_block 
      009BAF                       5360 	_drop 2 
      009BAF 16 03            [ 2]    1     addw sp,#2 
      009BB1 CD               [ 4] 5361 	ret 
                                   5362 
                                   5363 ;----------------------------------
                                   5364 ; BASIC: SLEEP 
                                   5365 ; halt mcu until reset or external
                                   5366 ; interrupt.
                                   5367 ; Resume progam after SLEEP command
                                   5368 ;----------------------------------
      001E29                       5369 sleep:
      009BB2 9B 10 24 05 A6   [ 2] 5370 	btjf UART1_SR,#UART_SR_TC,.
      009BB7 08 CC 88 FF      [ 1] 5371 	bset flags,#FSLEEP
      009BBB 8E               [10] 5372 	halt 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009BBB CE               [ 4] 5373 	ret 
                                   5374 
                                   5375 ;-------------------------------
                                   5376 ; BASIC: PAUSE expr 
                                   5377 ; suspend execution for n msec.
                                   5378 ; input:
                                   5379 ;	none
                                   5380 ; output:
                                   5381 ;	none 
                                   5382 ;------------------------------
      001E34                       5383 pause:
      009BBC 00 1A C6         [ 4] 5384 	call expression
      009BBF 00 1C            [ 1] 5385 	cp a,#TK_INTGR
      009BC1 CF 00            [ 1] 5386 	jreq pause02 
      009BC3 17 C7 00         [ 2] 5387 	jp syntax_error
      001E3E                       5388 pause02: 
      009BC6 19               [ 2] 5389 1$: tnzw x 
      009BC7 16 03            [ 1] 5390 	jreq 2$
      009BC9 AE               [10] 5391 	wfi 
      009BCA 16               [ 2] 5392 	decw x 
      009BCB E0 CD            [ 1] 5393 	jrne 1$
      009BCD 84               [ 1] 5394 2$:	clr a 
      009BCE 32               [ 4] 5395 	ret 
                                   5396 
                                   5397 ;------------------------------
                                   5398 ; BASIC: AWU expr
                                   5399 ; halt mcu for 'expr' milliseconds
                                   5400 ; use Auto wakeup peripheral
                                   5401 ; all oscillators stopped except LSI
                                   5402 ; range: 1ms - 511ms
                                   5403 ; input:
                                   5404 ;  none
                                   5405 ; output:
                                   5406 ;  none:
                                   5407 ;------------------------------
      001E47                       5408 awu:
      009BCF CD 84 16         [ 4] 5409   call expression
      009BD2 5F 97            [ 1] 5410   cp a,#TK_INTGR
      009BD4 5C 1C            [ 1] 5411   jreq awu02
      009BD6 16 E0 16         [ 2] 5412   jp syntax_error
      001E51                       5413 awu02:
      009BD9 01 FF 1C         [ 2] 5414   cpw x,#5120
      009BDC 00 02            [ 1] 5415   jrmi 1$ 
      009BDE 90 CE 00 1D      [ 1] 5416   mov AWU_TBR,#15 
      009BE2 90 F6            [ 1] 5417   ld a,#30
      009BE4 90               [ 2] 5418   div x,a
      009BE5 5C F7            [ 1] 5419   ld a,#16
      009BE7 5C               [ 2] 5420   div x,a 
      009BE8 90 C3            [ 2] 5421   jra 4$
      001E62                       5422 1$: 
      009BEA 00 1F 27         [ 2] 5423   cpw x,#2048
      009BED 05 A3            [ 1] 5424   jrmi 2$ 
      009BEF 17 60 2B EF      [ 1] 5425   mov AWU_TBR,#14
      009BF3 A6 50            [ 1] 5426   ld a,#80
      009BF3 17               [ 2] 5427   div x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009BF4 07 10            [ 2] 5428   jra 4$   
      009BF5                       5429 2$:
      009BF5 A3 17 60 27      [ 1] 5430   mov AWU_TBR,#7
      001E74                       5431 3$:  
                                   5432 ; while X > 64  divide by 2 and increment AWU_TBR 
      009BF9 04 7F 5C         [ 2] 5433   cpw x,#64 
      009BFC 20 F7            [ 2] 5434   jrule 4$ 
      009BFE 72 5C 50 F2      [ 1] 5435   inc AWU_TBR 
      009BFE AE               [ 2] 5436   srlw x 
      009BFF 16 E0            [ 2] 5437   jra 3$ 
      001E80                       5438 4$:
      009C01 CD               [ 1] 5439   ld a, xl
      009C02 82               [ 1] 5440   dec a 
      009C03 08 AE            [ 1] 5441   jreq 5$
      009C05 00               [ 1] 5442   dec a 	
      001E85                       5443 5$: 
      009C06 80 CD            [ 1] 5444   and a,#0x3e 
      009C08 9A 9C AE         [ 1] 5445   ld AWU_APR,a 
      009C0B 16 E0 16 07      [ 1] 5446   bset AWU_CSR,#AWU_CSR_AWUEN
      009C0F 90               [10] 5447   halt 
                                   5448 
      009C10 C3               [ 4] 5449   ret 
                                   5450 
                                   5451 ;------------------------------
                                   5452 ; BASIC: TICKS
                                   5453 ; return msec ticks counter value 
                                   5454 ; input:
                                   5455 ; 	none 
                                   5456 ; output:
                                   5457 ;	X 		TK_INTGR
                                   5458 ;-------------------------------
      001E90                       5459 get_ticks:
      009C11 00 1F 2B         [ 2] 5460 	ldw x,ticks 
      009C14 CD CE            [ 1] 5461 	ld a,#TK_INTGR
      009C16 00               [ 4] 5462 	ret 
                                   5463 
                                   5464 
                                   5465 
                                   5466 ;------------------------------
                                   5467 ; BASIC: ABS(expr)
                                   5468 ; return absolute value of expr.
                                   5469 ; input:
                                   5470 ;   none
                                   5471 ; output:
                                   5472 ;   X     	positive integer
                                   5473 ;-------------------------------
      001E96                       5474 abs:
      009C17 17 C6 00         [ 4] 5475 	call func_args 
      009C1A 19 CF            [ 1] 5476 	cp a,#1 
      009C1C 00 1A            [ 1] 5477 	jreq 0$ 
      009C1E C7 00 1C         [ 2] 5478 	jp syntax_error
      001EA0                       5479 0$:  
      009C21 1E               [ 2] 5480     popw x   
      009C22 01               [ 1] 5481 	ld a,xh 
      009C23 CD 8A            [ 1] 5482 	bcp a,#0x80 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009C25 50 5B            [ 1] 5483 	jreq 2$ 
      009C27 08               [ 2] 5484 	negw x 
      009C28 81 84            [ 1] 5485 2$: ld a,#TK_INTGR 
      009C29 81               [ 4] 5486 	ret 
                                   5487 
                                   5488 ;------------------------------
                                   5489 ; BASIC: AND(expr1,expr2)
                                   5490 ; Apply bit AND relation between
                                   5491 ; the 2 arguments, i.e expr1 & expr2 
                                   5492 ; output:
                                   5493 ; 	A 		TK_INTGR
                                   5494 ;   X 		result 
                                   5495 ;------------------------------
      001EAA                       5496 bit_and:
      009C29 CD 9A 9C         [ 4] 5497 	call func_args 
      009C2C CD 87            [ 1] 5498 	cp a,#2
      009C2E 69 5F            [ 1] 5499 	jreq 1$
      009C30 92 AF 00         [ 2] 5500 	jp syntax_error 
      009C33 17               [ 2] 5501 1$:	popw x 
      009C34 90               [ 1] 5502 	ld a,xh 
      009C35 95 5C            [ 1] 5503 	and a,(1,sp)
      009C37 92               [ 1] 5504 	ld xh,a 
      009C38 AF               [ 1] 5505 	ld a,xl
      009C39 00 17            [ 1] 5506 	and a,(2,sp)
      009C3B 5C               [ 1] 5507 	ld xl,a 
      001EBD                       5508 	_drop 2 
      009C3C 90 97            [ 2]    1     addw sp,#2 
      009C3E 72 B9            [ 1] 5509 	ld a,#TK_INTGR
      009C40 00               [ 4] 5510 	ret
                                   5511 
                                   5512 ;------------------------------
                                   5513 ; BASIC: OR(expr1,expr2)
                                   5514 ; Apply bit OR relation between
                                   5515 ; the 2 arguments, i.e expr1 | expr2 
                                   5516 ; output:
                                   5517 ; 	A 		TK_INTGR
                                   5518 ;   X 		result 
                                   5519 ;------------------------------
      001EC2                       5520 bit_or:
      009C41 1D 90 CF         [ 4] 5521 	call func_args 
      009C44 00 1F            [ 1] 5522 	cp a,#2
      009C46 90 CE            [ 1] 5523 	jreq 1$
      009C48 00 1D 7D         [ 2] 5524 	jp syntax_error 
      009C4A                       5525 1$: 
      009C4A 92               [ 2] 5526 	popw x 
      009C4B AF               [ 1] 5527 	ld a,xh 
      009C4C 00 17            [ 1] 5528 	or a,(1,sp)
      009C4E 90               [ 1] 5529 	ld xh,a 
      009C4F F7               [ 1] 5530 	ld a,xl 
      009C50 5C 90            [ 1] 5531 	or a,(2,sp)
      009C52 5C               [ 1] 5532 	ld xl,a 
      001ED5                       5533 	_drop 2 
      009C53 90 C3            [ 2]    1     addw sp,#2 
      009C55 00 1F            [ 1] 5534 	ld a,#TK_INTGR 
      009C57 2B               [ 4] 5535 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   5536 
                                   5537 ;------------------------------
                                   5538 ; BASIC: XOR(expr1,expr2)
                                   5539 ; Apply bit XOR relation between
                                   5540 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5541 ; output:
                                   5542 ; 	A 		TK_INTGR
                                   5543 ;   X 		result 
                                   5544 ;------------------------------
      001EDA                       5545 bit_xor:
      009C58 F1 81 45         [ 4] 5546 	call func_args 
      009C5A A1 02            [ 1] 5547 	cp a,#2
      009C5A 72 01            [ 1] 5548 	jreq 1$
      009C5C 00 24 07         [ 2] 5549 	jp syntax_error 
      001EE4                       5550 1$: 
      009C5F 27               [ 2] 5551 	popw x 
      009C60 05               [ 1] 5552 	ld a,xh 
      009C61 A6 07            [ 1] 5553 	xor a,(1,sp)
      009C63 CC               [ 1] 5554 	ld xh,a 
      009C64 88               [ 1] 5555 	ld a,xl 
      009C65 FF 02            [ 1] 5556 	xor a,(2,sp)
      009C66 97               [ 1] 5557 	ld xl,a 
      001EED                       5558 	_drop 2 
      009C66 CD 89            [ 2]    1     addw sp,#2 
      009C68 EF A1            [ 1] 5559 	ld a,#TK_INTGR 
      009C6A 02               [ 4] 5560 	ret 
                                   5561 
                                   5562 ;------------------------------
                                   5563 ; BASIC: LSHIFT(expr1,expr2)
                                   5564 ; logical shift left expr1 by 
                                   5565 ; expr2 bits 
                                   5566 ; output:
                                   5567 ; 	A 		TK_INTGR
                                   5568 ;   X 		result 
                                   5569 ;------------------------------
      001EF2                       5570 lshift:
      009C6B 27 03 CC         [ 4] 5571 	call func_args
      009C6E 88 FD            [ 1] 5572 	cp a,#2 
      009C70 90 93            [ 1] 5573 	jreq 1$
      009C72 CD 9B 10         [ 2] 5574 	jp syntax_error
      009C75 25 05            [ 2] 5575 1$: popw y   
      009C77 A6               [ 2] 5576 	popw x 
      009C78 09 CC            [ 2] 5577 	tnzw y 
      009C7A 88 FF            [ 1] 5578 	jreq 4$
      009C7C 58               [ 2] 5579 2$:	sllw x 
      009C7C CD 9C            [ 2] 5580 	decw y 
      009C7E 29 CE            [ 1] 5581 	jrne 2$
      001F08                       5582 4$:  
      009C80 00 1F            [ 1] 5583 	ld a,#TK_INTGR
      009C82 72               [ 4] 5584 	ret
                                   5585 
                                   5586 ;------------------------------
                                   5587 ; BASIC: RSHIFT(expr1,expr2)
                                   5588 ; logical shift right expr1 by 
                                   5589 ; expr2 bits.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   5590 ; output:
                                   5591 ; 	A 		TK_INTGR
                                   5592 ;   X 		result 
                                   5593 ;------------------------------
      001F0B                       5594 rshift:
      009C83 B0 00 1D         [ 4] 5595 	call func_args
      009C86 CD 8A            [ 1] 5596 	cp a,#2 
      009C88 50 81            [ 1] 5597 	jreq 1$
      009C8A CC 08 7D         [ 2] 5598 	jp syntax_error
      009C8A 52 03            [ 2] 5599 1$: popw y  
      009C8C CD               [ 2] 5600 	popw x
      009C8D 89 EF            [ 2] 5601 	tnzw y 
      009C8F A1 00            [ 1] 5602 	jreq 4$
      009C91 27               [ 2] 5603 2$:	srlw x 
      009C92 20 A1            [ 2] 5604 	decw y 
      009C94 02 27            [ 1] 5605 	jrne 2$
      001F21                       5606 4$:  
      009C96 03 CC            [ 1] 5607 	ld a,#TK_INTGR
      009C98 88               [ 4] 5608 	ret
                                   5609 
                                   5610 ;--------------------------
                                   5611 ; BASIC: FCPU integer
                                   5612 ; set CPU frequency 
                                   5613 ;-------------------------- 
                                   5614 
      001F24                       5615 fcpu:
      009C99 FD 90            [ 1] 5616 	ld a,#TK_INTGR
      009C9B 93 55 00         [ 4] 5617 	call expect 
      009C9E 04               [ 1] 5618 	ld a,xl 
      009C9F 00 02            [ 1] 5619 	and a,#7 
      009CA1 CD 9B 10         [ 1] 5620 	ld CLK_CKDIVR,a 
      009CA4 25               [ 4] 5621 	ret 
                                   5622 
                                   5623 ;------------------------------
                                   5624 ; BASIC: PMODE pin#, mode 
                                   5625 ; Arduino pin. 
                                   5626 ; define pin as input or output
                                   5627 ; pin#: {0..15}
                                   5628 ; mode: INPUT|OUTPUT  
                                   5629 ;------------------------------
                           000001  5630 	PINNO=1
                           000001  5631 	VSIZE=1
      001F30                       5632 pin_mode:
      001F30                       5633 	_vars VSIZE 
      009CA5 05 A6            [ 2]    1     sub sp,#VSIZE 
      009CA7 09 CC 88         [ 4] 5634 	call arg_list 
      009CAA FF 02            [ 1] 5635 	cp a,#2 
      009CAB 27 03            [ 1] 5636 	jreq 1$
      009CAB CE 00 17         [ 2] 5637 	jp syntax_error 
      009CAE C6 00            [ 2] 5638 1$: popw y ; mode 
      009CB0 19               [ 2] 5639 	popw x ; Dx pin 
      009CB1 20 0A 7C         [ 4] 5640 	call select_pin 
      009CB3 6B 01            [ 1] 5641 	ld (PINNO,sp),a  
      009CB3 AE 01            [ 1] 5642 	ld a,#1 
      009CB5 00 4F            [ 1] 5643 	tnz (PINNO,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009CB7 CF 00            [ 1] 5644 	jreq 4$
      009CB9 17               [ 1] 5645 2$:	sll a 
      009CBA C7 00            [ 1] 5646 	dec (PINNO,sp)
      009CBC 19 FB            [ 1] 5647 	jrne 2$ 
      009CBD 6B 01            [ 1] 5648 	ld (PINNO,sp),a
      009CBD 1F 01            [ 1] 5649 	ld a,(PINNO,sp)
      009CBF 6B 03            [ 1] 5650 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009CC1 CD 81            [ 1] 5651 	ld (GPIO_CR1,x),a 
      009CC3 C0 CD 82 3B      [ 2] 5652 4$:	cpw y,#OUTP 
      009CC7 AE 00            [ 1] 5653 	jreq 6$
                                   5654 ; input mode
                                   5655 ; disable external interrupt 
      009CC9 80 CD            [ 1] 5656 	ld a,(PINNO,sp)
      009CCB 9A               [ 1] 5657 	cpl a 
      009CCC 9C CD            [ 1] 5658 	and a,(GPIO_CR2,x)
      009CCE 9A 81            [ 1] 5659 	ld (GPIO_CR2,x),a 
                                   5660 ;clear bit in DDR for input mode 
      009CD0 C6 00            [ 1] 5661 	ld a,(PINNO,sp)
      009CD2 19               [ 1] 5662 	cpl a 
      009CD3 C0 00            [ 1] 5663 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009CD5 1C C6            [ 1] 5664 	ld (GPIO_DDR,x),a 
      009CD7 00 18            [ 2] 5665 	jra 9$
      001F6D                       5666 6$: ;output mode  
      009CD9 C2 00            [ 1] 5667 	ld a,(PINNO,sp)
      009CDB 1B C6            [ 1] 5668 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009CDD 00 17            [ 1] 5669 	ld (GPIO_DDR,x),a 
      009CDF C2 00            [ 1] 5670 	ld a,(PINNO,sp)
      009CE1 1A 2B            [ 1] 5671 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009CE3 E0 7B            [ 1] 5672 	ld (GPIO_CR2,x),a 
      001F79                       5673 9$:	
      001F79                       5674 	_drop VSIZE 
      009CE5 03 1E            [ 2]    1     addw sp,#VSIZE 
      009CE7 01               [ 4] 5675 	ret
                                   5676 
                                   5677 ;------------------------
                                   5678 ; select Arduino pin 
                                   5679 ; input:
                                   5680 ;   X 	 {0..15} Arduino Dx 
                                   5681 ; output:
                                   5682 ;   A     stm8s208 pin 
                                   5683 ;   X     base address s208 GPIO port 
                                   5684 ;---------------------------
      001F7C                       5685 select_pin:
      009CE8 C7               [ 2] 5686 	sllw x 
      009CE9 00 1C CF         [ 2] 5687 	addw x,#arduino_to_8s208 
      009CEC 00               [ 2] 5688 	ldw x,(x)
      009CED 1A               [ 1] 5689 	ld a,xl 
      009CEE 5B               [ 1] 5690 	push a 
      009CEF 03               [ 1] 5691 	swapw x 
      009CF0 81 05            [ 1] 5692 	ld a,#5 
      009CF1 42               [ 4] 5693 	mul x,a 
      009CF1 52 02 5F         [ 2] 5694 	addw x,#GPIO_BASE 
      009CF4 1F               [ 1] 5695 	pop a 
      009CF5 01               [ 4] 5696 	ret 
                                   5697 ; translation from Arduino D0..D15 to stm8s208rb 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      001F8C                       5698 arduino_to_8s208:
      009CF6 CF 00                 5699 .byte 3,6 ; D0 
      009CF8 18 35                 5700 .byte 3,5 ; D1 
      009CFA 01 00                 5701 .byte 4,0 ; D2 
      009CFC 17 01                 5702 .byte 2,1 ; D3
      009CFD 06 00                 5703 .byte 6,0 ; D4
      009CFD 5F 92                 5704 .byte 2,2 ; D5
      009CFF AF 00                 5705 .byte 2,3 ; D6
      009D01 17 27                 5706 .byte 3,1 ; D7
      009D03 3B 03                 5707 .byte 3,3 ; D8
      009D04 02 04                 5708 .byte 2,4 ; D9
      009D04 92 AF                 5709 .byte 4,5 ; D10
      009D06 00 17                 5710 .byte 2,6 ; D11
      009D08 27 06                 5711 .byte 2,7 ; D12
      009D0A CD 83                 5712 .byte 2,5 ; D13
      009D0C 40 5C                 5713 .byte 4,2 ; D14
      009D0E 20 F4                 5714 .byte 4,1 ; D15
                                   5715 
                                   5716 
                                   5717 ;------------------------------
                                   5718 ; BASIC: RND(expr)
                                   5719 ; return random number 
                                   5720 ; between 1 and expr inclusive
                                   5721 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5722 ; input:
                                   5723 ; 	none 
                                   5724 ; output:
                                   5725 ;	X 		random positive integer 
                                   5726 ;------------------------------
      001FAC                       5727 random:
      009D10 5C A6 20         [ 4] 5728 	call func_args 
      009D13 CD 83            [ 1] 5729 	cp a,#1
      009D15 40 92            [ 1] 5730 	jreq 1$
      009D17 AF 00 17         [ 2] 5731 	jp syntax_error
      001FB6                       5732 1$:  
      009D1A 90 95            [ 1] 5733 	ld a,#0x80 
      009D1C 5C 92            [ 1] 5734 	bcp a,(1,sp)
      009D1E AF 00            [ 1] 5735 	jreq 2$
      009D20 17 5C            [ 1] 5736 	ld a,#ERR_BAD_VALUE
      009D22 90 97 90         [ 2] 5737 	jp tb_error
      001FC1                       5738 2$: 
                                   5739 ; acc16=(x<<5)^x 
      009D25 89 72 FB         [ 2] 5740 	ldw x,seedx 
      009D28 01               [ 2] 5741 	sllw x 
      009D29 CD               [ 2] 5742 	sllw x 
      009D2A 9A               [ 2] 5743 	sllw x 
      009D2B 9C               [ 2] 5744 	sllw x 
      009D2C CD               [ 2] 5745 	sllw x 
      009D2D 9A               [ 1] 5746 	ld a,xh 
      009D2E 81 85 CD         [ 1] 5747 	xor a,seedx 
      009D31 8A 50 A6         [ 1] 5748 	ld acc16,a 
      009D34 0D               [ 1] 5749 	ld a,xl 
      009D35 CD 83 40         [ 1] 5750 	xor a,seedx+1 
      009D38 1E 01 5C         [ 1] 5751 	ld acc8,a 
                                   5752 ; seedx=seedy 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009D3B 1F 01 20         [ 2] 5753 	ldw x,seedy 
      009D3E BE 00 12         [ 2] 5754 	ldw seedx,x  
                                   5755 ; seedy=seedy^(seedy>>1)
      009D3F 90 54            [ 2] 5756 	srlw y 
      009D3F 1E 01            [ 1] 5757 	ld a,yh 
      009D41 CD 8A 50         [ 1] 5758 	xor a,seedy 
      009D44 AE 9D 5E         [ 1] 5759 	ld seedy,a  
      009D47 CD A8            [ 1] 5760 	ld a,yl 
      009D49 C0 CD 9A         [ 1] 5761 	xor a,seedy+1 
      009D4C DC 5F 35         [ 1] 5762 	ld seedy+1,a 
                                   5763 ; acc16>>3 
      009D4F 0A 00 0B         [ 2] 5764 	ldw x,acc16 
      009D52 CD               [ 2] 5765 	srlw x 
      009D53 8A               [ 2] 5766 	srlw x 
      009D54 60               [ 2] 5767 	srlw x 
                                   5768 ; x=acc16^x 
      009D55 AE               [ 1] 5769 	ld a,xh 
      009D56 9D 66 CD         [ 1] 5770 	xor a,acc16 
      009D59 A8               [ 1] 5771 	ld xh,a 
      009D5A C0               [ 1] 5772 	ld a,xl 
      009D5B 5B 02 81         [ 1] 5773 	xor a,acc8 
      009D5E 20               [ 1] 5774 	ld xl,a 
                                   5775 ; seedy=x^seedy 
      009D5F 66 69 6C         [ 1] 5776 	xor a,seedy+1
      009D62 65               [ 1] 5777 	ld xl,a 
      009D63 73               [ 1] 5778 	ld a,xh 
      009D64 0A 00 20         [ 1] 5779 	xor a,seedy
      009D67 62               [ 1] 5780 	ld xh,a 
      009D68 79 74 65         [ 2] 5781 	ldw seedy,x 
                                   5782 ; return seedy modulo expr + 1 
      009D6B 73 20            [ 2] 5783 	popw y 
      009D6D 66               [ 2] 5784 	divw x,y 
      009D6E 72               [ 1] 5785 	ldw x,y 
      009D6F 65               [ 2] 5786 	incw x 
      002010                       5787 10$:
      009D70 65 0A            [ 1] 5788 	ld a,#TK_INTGR
      009D72 00               [ 4] 5789 	ret 
                                   5790 
                                   5791 ;---------------------------------
                                   5792 ; BASIC: WORDS 
                                   5793 ; affiche la listes des mots du
                                   5794 ; dictionnaire ainsi que le nombre
                                   5795 ; de mots.
                                   5796 ;---------------------------------
                           000001  5797 	WLEN=1 ; word length
                           000002  5798 	LLEN=2 ; character sent to console
                           000003  5799 	WCNT=3 ; count words printed 
                           000003  5800 	VSIZE=3 
      009D73                       5801 words:
      002013                       5802 	_vars VSIZE
      009D73 52 02            [ 2]    1     sub sp,#VSIZE 
      009D75 72 5F            [ 1] 5803 	clr (LLEN,sp)
      009D77 00 17            [ 1] 5804 	clr (WCNT,sp)
      009D79 CD 91 C9 A1      [ 2] 5805 	ldw y,#kword_dict+2
      009D7D 84               [ 1] 5806 0$:	ldw x,y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009D7E 27               [ 1] 5807 	ld a,(x)
      009D7F 03 CC            [ 1] 5808 	and a,#15 
      009D81 88 FD            [ 1] 5809 	ld (WLEN,sp),a 
      009D83 1F 01            [ 1] 5810 	inc (WCNT,sp)
      009D85 CD               [ 2] 5811 1$:	incw x 
      009D86 89               [ 1] 5812 	ld a,(x)
      009D87 EF A1 09         [ 4] 5813 	call putc 
      009D8A 27 02            [ 1] 5814 	inc (LLEN,sp)
      009D8C 20 19            [ 1] 5815 	dec (WLEN,sp)
      009D8E CD 91            [ 1] 5816 	jrne 1$
      009D90 C9 A1            [ 1] 5817 	ld a,#70
      009D92 84 27            [ 1] 5818 	cp a,(LLEN,sp)
      009D94 03 CC            [ 1] 5819 	jrmi 2$   
      009D96 88 FD            [ 1] 5820 	ld a,#SPACE 
      009D98 9F 1E 01         [ 4] 5821 	call putc 
      009D9B CF 00            [ 1] 5822 	inc (LLEN,sp) 
      009D9D 18 5F            [ 2] 5823 	jra 3$
      009D9F CD 82            [ 1] 5824 2$: ld a,#CR 
      009DA1 65 1E 01         [ 4] 5825 	call putc 
      009DA4 5C 20            [ 1] 5826 	clr (LLEN,sp)
      009DA6 DC A2 00 02      [ 2] 5827 3$:	subw y,#2 
      009DA7 90 FE            [ 2] 5828 	ldw y,(y)
      009DA7 5B 02            [ 1] 5829 	jrne 0$ 
      009DA9 81 0D            [ 1] 5830 	ld a,#CR 
      009DAA CD 02 C0         [ 4] 5831 	call putc  
      009DAA CD               [ 1] 5832 	clrw x 
      009DAB 90 C5            [ 1] 5833 	ld a,(WCNT,sp)
      009DAD A1               [ 1] 5834 	ld xl,a 
      009DAE 01 27 03         [ 4] 5835 	call print_int 
      009DB1 CC 88 FD         [ 2] 5836 	ldw x,#words_count_msg
      009DB4 85 9F A4         [ 4] 5837 	call puts 
      002060                       5838 	_drop VSIZE 
      009DB7 7F 97            [ 2]    1     addw sp,#VSIZE 
      009DB9 A6               [ 4] 5839 	ret 
      009DBA 03 81 6F 72 64 73 20  5840 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   5841 
                                   5842 
                                   5843 ;-----------------------------
                                   5844 ; BASIC: TIMER expr 
                                   5845 ; initialize count down timer 
                                   5846 ;-----------------------------
      009DBC                       5847 set_timer:
      009DBC A6 07 CD         [ 4] 5848 	call arg_list
      009DBF 90 B8            [ 1] 5849 	cp a,#1 
      009DC1 CD 89            [ 1] 5850 	jreq 1$
      009DC3 EF A1 02         [ 2] 5851 	jp syntax_error
      002083                       5852 1$: 
      009DC6 27               [ 2] 5853 	popw x 
      009DC7 0E A1 03         [ 2] 5854 	ldw timer,x 
      009DCA 27               [ 4] 5855 	ret 
                                   5856 
                                   5857 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   5858 ; BASIC: TIMEOUT 
                                   5859 ; return state of timer 
                                   5860 ;------------------------------
      002088                       5861 timeout:
      009DCB 0D A1 82         [ 2] 5862 	ldw x,timer 
      00208B                       5863 logical_complement:
      009DCE 27               [ 2] 5864 	cplw x 
      009DCF 03 CC 88         [ 2] 5865 	cpw x,#-1
      009DD2 FD FD            [ 1] 5866 	jreq 2$
      009DD4 20               [ 1] 5867 	clrw x 
      009DD5 03 84            [ 1] 5868 2$:	ld a,#TK_INTGR
      009DD6 81               [ 4] 5869 	ret 
                                   5870 
                                   5871 ;--------------------------------
                                   5872 ; BASIC NOT(expr) 
                                   5873 ; return logical complement of expr
                                   5874 ;--------------------------------
      002095                       5875 func_not:
      009DD6 F6 5F 97         [ 4] 5876 	call func_args  
      009DD9 A1 01            [ 1] 5877 	cp a,#1
      009DD9 89 A6            [ 1] 5878 	jreq 1$
      009DDB 08 CD 90         [ 2] 5879 	jp syntax_error
      009DDE B8               [ 2] 5880 1$:	popw x 
      009DDF 85 A6            [ 2] 5881 	jra logical_complement
                                   5882 
                                   5883 
                                   5884 
                                   5885 ;-----------------------------------
                                   5886 ; BASIC: IWDGEN expr1 
                                   5887 ; enable independant watchdog timer
                                   5888 ; expr1 is delay in multiple of 62.5µsec
                                   5889 ; expr1 -> {1..16383}
                                   5890 ;-----------------------------------
      0020A2                       5891 enable_iwdg:
      009DE1 84 81 4A         [ 4] 5892 	call arg_list
      009DE3 A1 01            [ 1] 5893 	cp a,#1 
      009DE3 CD 83            [ 1] 5894 	jreq 1$
      009DE5 49 5F 97         [ 2] 5895 	jp syntax_error 
      009DE8 A6               [ 2] 5896 1$: popw x 
      009DE9 84 81            [ 1] 5897 	push #0
      009DEB 35 CC 50 E0      [ 1] 5898 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009DEB 5F               [ 1] 5899 	ld a,xh 
      009DEC C6 00            [ 1] 5900 	and a,#0x3f
      009DEE 2E               [ 1] 5901 	ld xh,a  
      009DEF C1 00 2F         [ 2] 5902 2$:	cpw x,#255
      009DF2 27 01            [ 2] 5903 	jrule 3$
      009DF4 53 A6            [ 1] 5904 	inc (1,sp)
      009DF6 84               [ 1] 5905 	rcf 
      009DF7 81               [ 2] 5906 	rrcw x 
      009DF8 20 F5            [ 2] 5907 	jra 2$
      009DF8 CD 90 C5 A1      [ 1] 5908 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009DFC 02               [ 1] 5909 	pop a  
      009DFD 27 03 CC         [ 1] 5910 	ld IWDG_PR,a 
      009E00 88               [ 1] 5911 	ld a,xl
      009E01 FD               [ 1] 5912 	dec a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009E02 35 55 50 E0      [ 1] 5913 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009E02 1E 03 2B         [ 1] 5914 	ld IWDG_RLR,a 
      009E05 17 A3 00 09      [ 1] 5915 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009E09 2A               [ 4] 5916 	ret 
                                   5917 
                                   5918 
                                   5919 ;-----------------------------------
                                   5920 ; BASIC: IWDGREF  
                                   5921 ; refresh independant watchdog count down 
                                   5922 ; timer before it reset MCU. 
                                   5923 ;-----------------------------------
      0020D8                       5924 refresh_iwdg:
      009E0A 12 A6 05 42      [ 1] 5925 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009E0E 1C               [ 4] 5926 	ret 
                                   5927 
                                   5928 
                                   5929 ;-------------------------------------
                                   5930 ; BASIC: LOG(expr)
                                   5931 ; return logarithm base 2 of expr 
                                   5932 ; this is the position of most significant
                                   5933 ; bit set. 
                                   5934 ; input: 
                                   5935 ; output:
                                   5936 ;   X     log2 
                                   5937 ;   A     TK_INTGR 
                                   5938 ;*********************************
      0020DD                       5939 log2:
      009E0F 50 00 1F         [ 4] 5940 	call func_args 
      009E12 03 1E            [ 1] 5941 	cp a,#1 
      009E14 01 72            [ 1] 5942 	jreq 1$
      009E16 FB 03 A6         [ 2] 5943 	jp syntax_error 
      009E19 84               [ 2] 5944 1$: popw x 
      0020E8                       5945 leading_one:
      009E1A 5B               [ 2] 5946 	tnzw x 
      009E1B 04 81            [ 1] 5947 	jreq 4$
      009E1D A6 0F            [ 1] 5948 	ld a,#15 
      009E1D A6               [ 2] 5949 2$: rlcw x 
      009E1E 0A CC            [ 1] 5950     jrc 3$
      009E20 88               [ 1] 5951 	dec a 
      009E21 FF FA            [ 2] 5952 	jra 2$
      009E22 5F               [ 1] 5953 3$: clrw x 
      009E22 AE               [ 1] 5954     ld xl,a
      009E23 A8 80            [ 1] 5955 4$:	ld a,#TK_INTGR
      009E25 A6               [ 4] 5956 	ret 
                                   5957 
                                   5958 ;-----------------------------------
                                   5959 ; BASIC: BIT(expr) 
                                   5960 ; expr ->{0..15}
                                   5961 ; return 2^expr 
                                   5962 ; output:
                                   5963 ;    x    2^expr 
                                   5964 ;-----------------------------------
      0020F8                       5965 bitmask:
      009E26 84 81 45         [ 4] 5966     call func_args 
      009E28 A1 01            [ 1] 5967 	cp a,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009E28 90 89            [ 1] 5968 	jreq 1$
      009E2A CD 90 C5         [ 2] 5969 	jp syntax_error 
      009E2D A1               [ 2] 5970 1$: popw x 
      009E2E 01               [ 1] 5971 	ld a,xl 
      009E2F 27 07            [ 1] 5972 	and a,#15
      009E31 A1               [ 1] 5973 	clrw x 
      009E32 02               [ 2] 5974 	incw x 
      009E33 27               [ 1] 5975 2$: tnz a 
      009E34 03 CC            [ 1] 5976 	jreq 3$
      009E36 88               [ 2] 5977 	slaw x 
      009E37 FD               [ 1] 5978 	dec a 
      009E38 90 85            [ 2] 5979 	jra 2$ 
      009E3A A1 01            [ 1] 5980 3$: ld a,#TK_INTGR
      009E3C 27               [ 4] 5981 	ret 
                                   5982 
                                   5983 ;------------------------------
                                   5984 ; BASIC: INVERT(expr)
                                   5985 ; 1's complement 
                                   5986 ;--------------------------------
      002112                       5987 invert:
      009E3D 02 85 51         [ 4] 5988 	call func_args
      009E40 90 FD            [ 1] 5989 	cp a,#1 
      009E42 90 85            [ 1] 5990 	jreq 1$
      009E44 81 08 7D         [ 2] 5991 	jp syntax_error
      009E45 85               [ 2] 5992 1$: popw x  
      009E45 72               [ 2] 5993 	cplw x 
      009E46 0D 52            [ 1] 5994 	ld a,#TK_INTGR 
      009E48 30               [ 4] 5995 	ret 
                                   5996 
                                   5997 ;------------------------------
                                   5998 ; BASIC: DO 
                                   5999 ; initiate a DO ... UNTIL loop 
                                   6000 ;------------------------------
                           000003  6001 	DOLP_ADR=3 
                           000005  6002 	DOLP_INW=5
                           000004  6003 	VSIZE=4 
      002121                       6004 do_loop:
      009E49 FB               [ 2] 6005 	popw x 
      002122                       6006 	_vars VSIZE 
      009E4A 8E CC            [ 2]    1     sub sp,#VSIZE 
      009E4C 86               [ 2] 6007 	pushw x 
      009E4D 5A CE 00 04      [ 2] 6008 	ldw y,basicptr 
      009E4E 17 03            [ 2] 6009 	ldw (DOLP_ADR,sp),y
      009E4E 72 01 00 24      [ 2] 6010 	ldw y,in.w 
      009E52 07 27            [ 2] 6011 	ldw (DOLP_INW,sp),y
      009E54 05 A6 07 CC      [ 1] 6012 	inc loop_depth 
      009E58 88               [ 4] 6013 	ret 
                                   6014 
                                   6015 ;--------------------------------
                                   6016 ; BASIC: UNTIL expr 
                                   6017 ; loop if exprssion is false 
                                   6018 ; else terminate loop
                                   6019 ;--------------------------------
      002136                       6020 until: 
      009E59 FF 5D 00 20      [ 1] 6021 	tnz loop_depth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009E5A 26 03            [ 1] 6022 	jrne 1$ 
      009E5A CD 89 EF         [ 2] 6023 	jp syntax_error 
      00213F                       6024 1$: 
      009E5D 4D 26 08         [ 4] 6025 	call relation 
      009E60 AE 40            [ 1] 6026 	cp a,#TK_INTGR
      009E62 00 CD            [ 1] 6027 	jreq 2$
      009E64 A8 C0 4F         [ 2] 6028 	jp syntax_error
      002149                       6029 2$: 
      009E67 81               [ 2] 6030 	tnzw x 
      009E68 26 10            [ 1] 6031 	jrne 9$
      009E68 A1 02            [ 2] 6032 	ldw x,(DOLP_ADR,sp)
      009E6A 27 03 CC         [ 2] 6033 	ldw basicptr,x 
      009E6D 88 FD            [ 1] 6034 	ld a,(2,x)
      009E6F C7 00 03         [ 1] 6035 	ld count,a 
      009E6F 7D 26            [ 2] 6036 	ldw x,(DOLP_INW,sp)
      009E71 09 CD 87         [ 2] 6037 	ldw in.w,x 
      009E74 1C               [ 4] 6038 	ret 
      00215C                       6039 9$:	; remove loop data from stack  
      009E75 55               [ 2] 6040 	popw x
      00215D                       6041 	_drop VSIZE
      009E76 00 04            [ 2]    1     addw sp,#VSIZE 
      009E78 00 02 81 89      [ 1] 6042 	dec loop_depth 
      009E7C 90               [ 2] 6043 	jp (x)
                                   6044 
                                   6045 ;--------------------------
                                   6046 ; BASIC: PRTA...PRTI  
                                   6047 ;  return constant value 
                                   6048 ;  PORT  offset in GPIO
                                   6049 ;  array
                                   6050 ;---------------------------
      002164                       6051 const_porta:
      009E7D 93 CD 9B         [ 2] 6052 	ldw x,#0
      009E80 10 25            [ 1] 6053 	ld a,#TK_INTGR 
      009E82 05               [ 4] 6054 	ret 
      00216A                       6055 const_portb:
      009E83 A6 09 CC         [ 2] 6056 	ldw x,#1
      009E86 88 FF            [ 1] 6057 	ld a,#TK_INTGR 
      009E88 81               [ 4] 6058 	ret 
      002170                       6059 const_portc:
      009E88 55 00 04         [ 2] 6060 	ldw x,#2
      009E8B 00 02            [ 1] 6061 	ld a,#TK_INTGR 
      009E8D 72               [ 4] 6062 	ret 
      002176                       6063 const_portd:
      009E8E 5F 00 17         [ 2] 6064 	ldw x,#3
      009E91 AE 40            [ 1] 6065 	ld a,#TK_INTGR 
      009E93 00               [ 4] 6066 	ret 
      00217C                       6067 const_porte:
      009E94 CF 00 18         [ 2] 6068 	ldw x,#4
      009E97 1E 01            [ 1] 6069 	ld a,#TK_INTGR 
      009E99 CD               [ 4] 6070 	ret 
      002182                       6071 const_portf:
      009E9A 84 16 5F         [ 2] 6072 	ldw x,#5
      009E9D 97 5C            [ 1] 6073 	ld a,#TK_INTGR 
      009E9F 90               [ 4] 6074 	ret 
      002188                       6075 const_portg:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009EA0 85 89 5F         [ 2] 6076 	ldw x,#6
      009EA3 CD 82            [ 1] 6077 	ld a,#TK_INTGR 
      009EA5 DA               [ 4] 6078 	ret 
      00218E                       6079 const_porth:
      009EA6 5B 02 81         [ 2] 6080 	ldw x,#7
      009EA9 A6 84            [ 1] 6081 	ld a,#TK_INTGR 
      009EA9 72               [ 4] 6082 	ret 
      002194                       6083 const_porti:
      009EAA 0D 52 30         [ 2] 6084 	ldw x,#8
      009EAD FB 72            [ 1] 6085 	ld a,#TK_INTGR 
      009EAF 16               [ 4] 6086 	ret 
                                   6087 
                                   6088 ;-------------------------------
                                   6089 ; following return constant 
                                   6090 ; related to GPIO register offset 
                                   6091 ;---------------------------------
      00219A                       6092 const_odr:
      009EB0 00 24            [ 1] 6093 	ld a,#TK_INTGR 
      009EB2 8E 81 00         [ 2] 6094 	ldw x,#GPIO_ODR
      009EB4 81               [ 4] 6095 	ret 
      0021A0                       6096 const_idr:
      009EB4 CD 91            [ 1] 6097 	ld a,#TK_INTGR 
      009EB6 C9 A1 84         [ 2] 6098 	ldw x,#GPIO_IDR
      009EB9 27               [ 4] 6099 	ret 
      0021A6                       6100 const_ddr:
      009EBA 03 CC            [ 1] 6101 	ld a,#TK_INTGR 
      009EBC 88 FD 02         [ 2] 6102 	ldw x,#GPIO_DDR
      009EBE 81               [ 4] 6103 	ret 
      0021AC                       6104 const_cr1:
      009EBE 5D 27            [ 1] 6105 	ld a,#TK_INTGR 
      009EC0 04 8F 5A         [ 2] 6106 	ldw x,#GPIO_CR1
      009EC3 26               [ 4] 6107 	ret 
      0021B2                       6108 const_cr2:
      009EC4 F9 4F            [ 1] 6109 	ld a,#TK_INTGR 
      009EC6 81 00 04         [ 2] 6110 	ldw x,#GPIO_CR2
      009EC7 81               [ 4] 6111 	ret 
                                   6112 ;-------------------------
                                   6113 ;  constant for port mode
                                   6114 ;  used by PMODE 
                                   6115 ;  input or output
                                   6116 ;------------------------
      0021B8                       6117 const_output:
      009EC7 CD 91            [ 1] 6118 	ld a,#TK_INTGR 
      009EC9 C9 A1 84         [ 2] 6119 	ldw x,#OUTP
      009ECC 27               [ 4] 6120 	ret 
      0021BE                       6121 const_input:
      009ECD 03 CC            [ 1] 6122 	ld a,#TK_INTGR 
      009ECF 88 FD 00         [ 2] 6123 	ldw x,#INP 
      009ED1 81               [ 4] 6124 	ret 
                                   6125 ;-----------------------
                                   6126 ; memory area constants
                                   6127 ;-----------------------
      0021C4                       6128 const_eeprom_base:
      009ED1 A3 14            [ 1] 6129 	ld a,#TK_INTGR 
      009ED3 00 2B 0C         [ 2] 6130 	ldw x,#EEPROM_BASE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009ED6 35               [ 4] 6131 	ret 
                                   6132 
                                   6133 ;---------------------------
                                   6134 ; BASIC: DATA 
                                   6135 ; when the interpreter find 
                                   6136 ; a DATA line it skip it.
                                   6137 ;---------------------------
      0021CA                       6138 data:
      009ED7 0F 50 F2 A6 1E   [ 1] 6139 	mov in,count 
      009EDC 62               [ 4] 6140 	ret 
                                   6141 
                                   6142 ;---------------------------
                                   6143 ; BASIC: DATLN  *expr*
                                   6144 ; set DATA pointer at line# 
                                   6145 ; specified by *expr* 
                                   6146 ;---------------------------
      0021D0                       6147 data_line:
      009EDD A6 10 62         [ 4] 6148 	call expression
      009EE0 20 1E            [ 1] 6149 	cp a,#TK_INTGR
      009EE2 27 03            [ 1] 6150 	jreq 1$
      009EE2 A3 08 00         [ 2] 6151 	jp syntax_error 
      009EE5 2B 09 35         [ 4] 6152 1$: call search_lineno
      009EE8 0E               [ 2] 6153 	tnzw x 
      009EE9 50 F2            [ 1] 6154 	jrne 3$
      009EEB A6 50            [ 1] 6155 2$:	ld a,#ERR_NO_LINE 
      009EED 62 20 10         [ 2] 6156 	jp tb_error
      009EF0                       6157 3$: ; check if valid data line 
      009EF0 35 07            [ 1] 6158     ldw y,x 
      009EF2 50 F2            [ 2] 6159 	ldw x,(4,x)
      009EF4 A3 21 CA         [ 2] 6160 	cpw x,#data 
      009EF4 A3 00            [ 1] 6161 	jrne 2$ 
      009EF6 40 23 07 72      [ 2] 6162 	ldw data_ptr,y
      009EFA 5C 50 F2         [ 1] 6163 	ld a,(2,y)
      009EFD 54 20 F4         [ 1] 6164 	ld data_len,a 
      009F00 35 06 00 08      [ 1] 6165 	mov data_ofs,#FIRST_DATA_ITEM 
      009F00 9F               [ 4] 6166 	ret
                                   6167 
                                   6168 ;---------------------------------
                                   6169 ; BASIC: RESTORE 
                                   6170 ; set data_ptr to first data line
                                   6171 ; if not DATA found pointer set to
                                   6172 ; zero 
                                   6173 ;---------------------------------
      0021FD                       6174 restore:
      009F01 4A 27 01 4A      [ 1] 6175 	clr data_ptr 
      009F05 72 5F 00 07      [ 1] 6176 	clr data_ptr+1
      009F05 A4 3E C7 50      [ 1] 6177 	clr data_ofs 
      009F09 F1 72 18 50      [ 1] 6178 	clr data_len
      009F0D F0 8E 81         [ 2] 6179 	ldw x,txtbgn
      009F10                       6180 data_search_loop: 	
      009F10 CE 00 0F         [ 2] 6181 	cpw x,txtend
      009F13 A6 84            [ 1] 6182 	jruge 9$
      009F15 81 93            [ 1] 6183 	ldw y,x 
      009F16 EE 04            [ 2] 6184 	ldw x,(4,x)
      009F16 CD 90 C5         [ 2] 6185 	addw x,#code_addr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009F19 A1               [ 2] 6186 	ldw x,(x)
      009F1A 01 27 03         [ 2] 6187 	cpw x,#data 
      009F1D CC 88            [ 1] 6188 	jrne try_next_line 
      009F1F FD CF 00 06      [ 2] 6189 	ldw data_ptr,y 
      009F20 90 E6 02         [ 1] 6190 	ld a,(2,y)
      009F20 85 9E A5         [ 1] 6191 	ld data_len,a 
      009F23 80 27 01 50      [ 1] 6192 	mov data_ofs,#FIRST_DATA_ITEM
      009F27 A6 84 81 09      [ 1] 6193 9$:	tnz data_len 
      009F2A 26 05            [ 1] 6194     jrne 10$
      009F2A CD 90            [ 1] 6195 	ld a,#ERR_NO_DATA 
      009F2C C5 A1 02         [ 2] 6196 	jp tb_error 
      009F2F 27               [ 4] 6197 10$:ret
      00223C                       6198 try_next_line:
      009F30 03               [ 1] 6199 	ldw x,y 
      009F31 CC 88            [ 1] 6200 	ld a,(2,x)
      009F33 FD 85 9E         [ 1] 6201 	ld acc8,a 
      009F36 14 01 95 9F      [ 1] 6202 	clr acc16 
      009F3A 14 02 97 5B      [ 2] 6203 	addw x,acc16 
      009F3E 02 A6            [ 2] 6204 	jra data_search_loop
                                   6205 
                                   6206 
                                   6207 ;---------------------------------
                                   6208 ; BASIC: READ 
                                   6209 ; return next data item | 0 
                                   6210 ;---------------------------------
                           000001  6211 	CTX_BPTR=1 
                           000003  6212 	CTX_IN=3 
                           000004  6213 	CTX_COUNT=4 
                           000005  6214 	XSAVE=5
                           000006  6215 	VSIZE=6
      00224C                       6216 read:
      00224C                       6217 	_vars  VSIZE 
      009F40 84 81            [ 2]    1     sub sp,#VSIZE 
      009F42                       6218 read01:	
      009F42 CD 90 C5         [ 1] 6219 	ld a,data_ofs
      009F45 A1 02 27         [ 1] 6220 	cp a,data_len 
      009F48 03 CC            [ 1] 6221 	jreq 2$ ; end of line  
      009F4A 88 FD 9C         [ 4] 6222 	call save_context
      009F4C CE 00 06         [ 2] 6223 	ldw x,data_ptr 
      009F4C 85 9E 1A         [ 2] 6224 	ldw basicptr,x 
      009F4F 01 95 9F 1A 02   [ 1] 6225 	mov in,data_ofs 
      009F54 97 5B 02 A6 84   [ 1] 6226 	mov count,data_len  
      009F59 81 11 49         [ 4] 6227 	call expression 
      009F5A A1 84            [ 1] 6228 	cp a,#TK_INTGR 
      009F5A CD 90            [ 1] 6229 	jreq 1$ 
      009F5C C5 A1 02         [ 2] 6230 	jp syntax_error 
      002273                       6231 1$:
      009F5F 27 03            [ 2] 6232 	ldw (XSAVE,SP),x
      009F61 CC 88 FD         [ 4] 6233 	call next_token ; skip comma
      009F64 CE 00 04         [ 2] 6234 	ldw x,basicptr 
      009F64 85 9E 18         [ 2] 6235 	ldw data_ptr,x 
      009F67 01 95 9F 18 02   [ 1] 6236 	mov data_ofs,in 
      009F6C 97 5B 02         [ 4] 6237 	call rest_context
      009F6F A6 84            [ 2] 6238 	ldw x,(XSAVE,sp)
      009F71 81 84            [ 1] 6239 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009F72                       6240 	_drop VSIZE 
      009F72 CD 90            [ 2]    1     addw sp,#VSIZE 
      009F74 C5               [ 4] 6241 	ret 
      00228D                       6242 2$: ; end of line reached 
      009F75 A1 02 27 03      [ 2] 6243 	ldw y, data_ptr 
      009F79 CC 88 FD 90      [ 1] 6244 	clr data_ptr
      009F7D 85 85 90 5D      [ 1] 6245 	clr data_ptr+1   
      009F81 27 05 58 90      [ 1] 6246 	clr data_ofs 
      009F85 5A 26 FB 09      [ 1] 6247 	clr data_len 
      009F88 CD 22 3C         [ 4] 6248 	call try_next_line 
      009F88 A6 84            [ 2] 6249 	jra read01
                                   6250 
                                   6251 
                                   6252 ;---------------------------------
                                   6253 ; BASIC: SPIEN clkdiv, 0|1  
                                   6254 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6255 ; if clkdiv==-1 disable SPI
                                   6256 ; 0|1 -> disable|enable  
                                   6257 ;--------------------------------- 
                           000005  6258 SPI_CS_BIT=5
      0022A6                       6259 spi_enable:
      009F8A 81 10 4A         [ 4] 6260 	call arg_list 
      009F8B A1 02            [ 1] 6261 	cp a,#2
      009F8B CD 90            [ 1] 6262 	jreq 1$
      009F8D C5 A1 02         [ 2] 6263 	jp syntax_error 
      0022B0                       6264 1$: 
      009F90 27 03 CC 88      [ 1] 6265 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009F94 FD               [ 2] 6266 	popw x  
      009F95 90               [ 2] 6267 	tnzw x 
      009F96 85 85            [ 1] 6268 	jreq spi_disable 
      009F98 90               [ 2] 6269 	popw x 
      009F99 5D 27            [ 1] 6270 	ld a,#(1<<SPI_CR1_BR)
      009F9B 05               [ 4] 6271 	mul x,a 
      009F9C 54               [ 1] 6272 	ld a,xl 
      009F9D 90 5A 26         [ 1] 6273 	ld SPI_CR1,a 
                                   6274 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009FA0 FB 1A 50 14      [ 1] 6275 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009FA1 72 1A 50 16      [ 1] 6276 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6277 ; configure SPI as master mode 0.	
      009FA1 A6 84 81 00      [ 1] 6278 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6279 ; ~CS line controlled by sofware 	
      009FA4 72 12 52 01      [ 1] 6280 	bset SPI_CR2,#SPI_CR2_SSM 
      009FA4 A6 84 CD 90      [ 1] 6281     bset SPI_CR2,#SPI_CR2_SSI 
                                   6282 ; enable SPI
      009FA8 B8 9F A4 07      [ 1] 6283 	bset SPI_CR1,#SPI_CR1_SPE 	
      009FAC C7               [ 4] 6284 	ret 
      0022D9                       6285 spi_disable:
      0022D9                       6286 	_drop #2; throw first argument.
      009FAD 50 C6            [ 2]    1     addw sp,##2 
                                   6287 ; wait spi idle 
      009FAF 81 82            [ 1] 6288 1$:	ld a,#0x82 
      009FB0 C4 52 03         [ 1] 6289 	and a,SPI_SR
      009FB0 52 01            [ 1] 6290 	cp a,#2 
      009FB2 CD 90            [ 1] 6291 	jrne 1$
      009FB4 CA A1 02 27      [ 1] 6292 	bres SPI_CR1,#SPI_CR1_SPE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009FB8 03 CC 88 FD      [ 1] 6293 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009FBC 90 85 85 CD      [ 1] 6294 	bres PE_DDR,#SPI_CS_BIT 
      009FC0 9F               [ 4] 6295 	ret 
                                   6296 
      0022F1                       6297 spi_clear_error:
      009FC1 FC 6B            [ 1] 6298 	ld a,#0x78 
      009FC3 01 A6 01         [ 1] 6299 	bcp a,SPI_SR 
      009FC6 0D 01            [ 1] 6300 	jreq 1$
      009FC8 27 0D 48 0A      [ 1] 6301 	clr SPI_SR 
      009FCC 01               [ 4] 6302 1$: ret 
                                   6303 
      0022FD                       6304 spi_send_byte:
      009FCD 26               [ 1] 6305 	push a 
      009FCE FB 6B 01         [ 4] 6306 	call spi_clear_error
      009FD1 7B               [ 1] 6307 	pop a 
      009FD2 01 EA 03 E7 03   [ 2] 6308 	btjf SPI_SR,#SPI_SR_TXE,.
      009FD7 90 A3 00         [ 1] 6309 	ld SPI_DR,a
      009FDA 01 27 10 7B 01   [ 2] 6310 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009FDF 43 E4 04         [ 1] 6311 	ld a,SPI_DR 
      009FE2 E7               [ 4] 6312 	ret 
                                   6313 
      002313                       6314 spi_rcv_byte:
      009FE3 04 7B            [ 1] 6315 	ld a,#255
      009FE5 01 43 E4 02 E7   [ 2] 6316 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009FEA 02 20 0C         [ 1] 6317 	ld a,SPI_DR 
      009FED 81               [ 4] 6318 	ret
                                   6319 
                                   6320 ;------------------------------
                                   6321 ; BASIC: SPIWR byte [,byte]
                                   6322 ; write 1 or more byte
                                   6323 ;------------------------------
      00231E                       6324 spi_write:
      009FED 7B 01 EA         [ 4] 6325 	call expression
      009FF0 02 E7            [ 1] 6326 	cp a,#TK_INTGR 
      009FF2 02 7B            [ 1] 6327 	jreq 1$
      009FF4 01 EA 04         [ 2] 6328 	jp syntax_error 
      002328                       6329 1$:	
      009FF7 E7               [ 1] 6330 	ld a,xl 
      009FF8 04 22 FD         [ 4] 6331 	call spi_send_byte 
      009FF9 CD 09 6F         [ 4] 6332 	call next_token 
      009FF9 5B 01            [ 1] 6333 	cp a,#TK_COMMA 
      009FFB 81 02            [ 1] 6334 	jrne 2$ 
      009FFC 20 E9            [ 2] 6335 	jra spi_write 
      009FFC 58               [ 1] 6336 2$:	tnz a 
      009FFD 1C A0            [ 1] 6337 	jreq 3$
      002338                       6338 	_unget_token  
      009FFF 0C FE 9F 88 5E   [ 1]    1      mov in,in.saved  
      00A004 A6               [ 4] 6339 3$:	ret 
                                   6340 
                                   6341 
                                   6342 ;-------------------------------
                                   6343 ; BASIC: SPIRD 	
                                   6344 ; read one byte from SPI 
                                   6345 ;-------------------------------
      00233E                       6346 spi_read:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A005 05 42 1C         [ 4] 6347 	call spi_rcv_byte 
      00A008 50               [ 1] 6348 	clrw x 
      00A009 00               [ 1] 6349 	ld xl,a 
      00A00A 84 81            [ 1] 6350 	ld a,#TK_INTGR 
      00A00C 81               [ 4] 6351 	ret 
                                   6352 
                                   6353 ;------------------------------
                                   6354 ; BASIC: SPISEL 0|1 
                                   6355 ; set state of ~CS line
                                   6356 ; 0|1 deselect|select  
                                   6357 ;------------------------------
      002346                       6358 spi_select:
      00A00C 03 06 03         [ 4] 6359 	call next_token 
      00A00F 05 04            [ 1] 6360 	cp a,#TK_INTGR 
      00A011 00 02            [ 1] 6361 	jreq 1$
      00A013 01 06 00         [ 2] 6362 	jp syntax_error 
      00A016 02               [ 2] 6363 1$: tnzw x  
      00A017 02 02            [ 1] 6364 	jreq cs_high 
      00A019 03 03 01 03      [ 1] 6365 	bres PE_ODR,#SPI_CS_BIT
      00A01D 03               [ 4] 6366 	ret 
      002358                       6367 cs_high: 
      00A01E 02 04 04 05      [ 1] 6368 	bset PE_ODR,#SPI_CS_BIT
      00A022 02               [ 4] 6369 	ret 
                                   6370 
                                   6371 
                                   6372 ;-------------------------------
                                   6373 ; BASIC: PAD 
                                   6374 ; Return pad buffer address.
                                   6375 ;------------------------------
      00235D                       6376 pad_ref:
      00A023 06 02 07         [ 2] 6377 	ldw x,#pad 
      00A026 02 05            [ 1] 6378 	ld a,TK_INTGR
      00A028 04               [ 4] 6379 	ret 
                                   6380 
                                   6381 ;------------------------------
                                   6382 ;      dictionary 
                                   6383 ; format:
                                   6384 ;   link:   2 bytes 
                                   6385 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6386 ;   cmd_name: 16 byte max 
                                   6387 ;   cmd_index: 2 bytes 
                                   6388 ;------------------------------
                                   6389 	.macro _dict_entry len,name,cmd_idx 
                                   6390 	.word LINK 
                                   6391 	LINK=.
                                   6392 name:
                                   6393 	.byte len 	
                                   6394 	.ascii "name"
                                   6395 	.word cmd_idx 
                                   6396 	.endm 
                                   6397 
                           000000  6398 	LINK=0
                                   6399 ; respect alphabetic order for BASIC names from Z-A
                                   6400 ; this sort order is for a cleaner WORDS cmd output. 	
      002363                       6401 kword_end:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      002363                       6402 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00A029 02 04                    1 	.word LINK 
                           002365     2 	LINK=.
      002365                          3 XOR:
      00A02B 01                       4 	.byte 3+F_IFUNC 	
      00A02C 58 4F 52                 5 	.ascii "XOR"
      00A02C CD 90                    6 	.word XOR_IDX 
      00236B                       6403 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A02E C5 A1                    1 	.word LINK 
                           00236D     2 	LINK=.
      00236D                          3 WRITE:
      00A030 01                       4 	.byte 5 	
      00A031 27 03 CC 88 FD           5 	.ascii "WRITE"
      00A036 00 C4                    6 	.word WRITE_IDX 
      002375                       6404 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A036 A6 80                    1 	.word LINK 
                           002377     2 	LINK=.
      002377                          3 WORDS:
      00A038 15                       4 	.byte 5 	
      00A039 01 27 05 A6 0A           5 	.ascii "WORDS"
      00A03E CC 88                    6 	.word WORDS_IDX 
      00237F                       6405 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A040 FF 77                    1 	.word LINK 
                           002381     2 	LINK=.
      00A041                          3 WAIT:
      00A041 CE                       4 	.byte 4 	
      00A042 00 13 58 58              5 	.ascii "WAIT"
      00A046 58 58                    6 	.word WAIT_IDX 
      002388                       6406 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A048 58 9E                    1 	.word LINK 
                           00238A     2 	LINK=.
      00238A                          3 USR:
      00A04A C8                       4 	.byte 3+F_IFUNC 	
      00A04B 00 13 C7                 5 	.ascii "USR"
      00A04E 00 0D                    6 	.word USR_IDX 
      002390                       6407 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A050 9F C8                    1 	.word LINK 
                           002392     2 	LINK=.
      002392                          3 UNTIL:
      00A052 00                       4 	.byte 5 	
      00A053 14 C7 00 0E CE           5 	.ascii "UNTIL"
      00A058 00 15                    6 	.word UNTIL_IDX 
      00239A                       6408 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A05A CF 00                    1 	.word LINK 
                           00239C     2 	LINK=.
      00239C                          3 UFLASH:
      00A05C 13                       4 	.byte 6+F_IFUNC 	
      00A05D 90 54 90 9E C8 00        5 	.ascii "UFLASH"
      00A063 15 C7                    6 	.word UFLASH_IDX 
      0023A5                       6409 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound 
      00A065 00 15                    1 	.word LINK 
                           0023A7     2 	LINK=.
      0023A7                          3 UBOUND:
      00A067 90                       4 	.byte 6+F_IFUNC 	
      00A068 9F C8 00 16 C7 00        5 	.ascii "UBOUND"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A06E 16 CE                    6 	.word UBOUND_IDX 
      0023B0                       6410 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A070 00 0D                    1 	.word LINK 
                           0023B2     2 	LINK=.
      0023B2                          3 TONE:
      00A072 54                       4 	.byte 4 	
      00A073 54 54 9E C8              5 	.ascii "TONE"
      00A077 00 0D                    6 	.word TONE_IDX 
      0023B9                       6411 	_dict_entry,2,TO,TO_IDX;to
      00A079 95 9F                    1 	.word LINK 
                           0023BB     2 	LINK=.
      0023BB                          3 TO:
      00A07B C8                       4 	.byte 2 	
      00A07C 00 0E                    5 	.ascii "TO"
      00A07E 97 C8                    6 	.word TO_IDX 
      0023C0                       6412 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A080 00 16                    1 	.word LINK 
                           0023C2     2 	LINK=.
      0023C2                          3 TIMEOUT:
      00A082 97                       4 	.byte 7+F_IFUNC 	
      00A083 9E C8 00 15 95 CF 00     5 	.ascii "TIMEOUT"
      00A08A 15 90                    6 	.word TMROUT_IDX 
      0023CC                       6413 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A08C 85 65                    1 	.word LINK 
                           0023CE     2 	LINK=.
      0023CE                          3 TIMER:
      00A08E 93                       4 	.byte 5 	
      00A08F 5C 49 4D 45 52           5 	.ascii "TIMER"
      00A090 00 B0                    6 	.word TIMER_IDX 
      0023D6                       6414 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A090 A6 84                    1 	.word LINK 
                           0023D8     2 	LINK=.
      0023D8                          3 TICKS:
      00A092 81                       4 	.byte 5+F_IFUNC 	
      00A093 54 49 43 4B 53           5 	.ascii "TICKS"
      00A093 52 03                    6 	.word TICKS_IDX 
      0023E0                       6415 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A095 0F 02                    1 	.word LINK 
                           0023E2     2 	LINK=.
      0023E2                          3 STOP:
      00A097 0F                       4 	.byte 4 	
      00A098 03 90 AE A7              5 	.ascii "STOP"
      00A09C 7E 93                    6 	.word STOP_IDX 
      0023E9                       6416 	_dict_entry,4,STEP,STEP_IDX;step 
      00A09E F6 A4                    1 	.word LINK 
                           0023EB     2 	LINK=.
      0023EB                          3 STEP:
      00A0A0 0F                       4 	.byte 4 	
      00A0A1 6B 01 0C 03              5 	.ascii "STEP"
      00A0A5 5C F6                    6 	.word STEP_IDX 
      0023F2                       6417 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A0A7 CD 83                    1 	.word LINK 
                           0023F4     2 	LINK=.
      0023F4                          3 SPIWR:
      00A0A9 40                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A0AA 0C 02 0A 01 26           5 	.ascii "SPIWR"
      00A0AF F5 A6                    6 	.word SPIWR_IDX 
      0023FC                       6418 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A0B1 46 11                    1 	.word LINK 
                           0023FE     2 	LINK=.
      0023FE                          3 SPISEL:
      00A0B3 02                       4 	.byte 6 	
      00A0B4 2B 09 A6 20 CD 83        5 	.ascii "SPISEL"
      00A0BA 40 0C                    6 	.word SPISEL_IDX 
      002407                       6419 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A0BC 02 20                    1 	.word LINK 
                           002409     2 	LINK=.
      002409                          3 SPIEN:
      00A0BE 07                       4 	.byte 5 	
      00A0BF A6 0D CD 83 40           5 	.ascii "SPIEN"
      00A0C4 0F 02                    6 	.word SPIEN_IDX 
      002411                       6420 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A0C6 72 A2                    1 	.word LINK 
                           002413     2 	LINK=.
      002413                          3 SPIRD:
      00A0C8 00                       4 	.byte 5+F_IFUNC 	
      00A0C9 02 90 FE 26 CF           5 	.ascii "SPIRD"
      00A0CE A6 0D                    6 	.word SPIRD_IDX 
      00241B                       6421 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A0D0 CD 83                    1 	.word LINK 
                           00241D     2 	LINK=.
      00241D                          3 SLEEP:
      00A0D2 40                       4 	.byte 5 	
      00A0D3 5F 7B 03 97 CD           5 	.ascii "SLEEP"
      00A0D8 8A 50                    6 	.word SLEEP_IDX 
      002425                       6422 	_dict_entry,4+F_IFUNC,SIZE,SIZE_IDX;size
      00A0DA AE A0                    1 	.word LINK 
                           002427     2 	LINK=.
      002427                          3 SIZE:
      00A0DC E3                       4 	.byte 4+F_IFUNC 	
      00A0DD CD A8 C0 5B              5 	.ascii "SIZE"
      00A0E1 03 81                    6 	.word SIZE_IDX 
      00242E                       6423     _dict_entry,4,SHOW,SHOW_IDX;show 
      00A0E3 20 77                    1 	.word LINK 
                           002430     2 	LINK=.
      002430                          3 SHOW:
      00A0E5 6F                       4 	.byte 4 	
      00A0E6 72 64 73 20              5 	.ascii "SHOW"
      00A0EA 69 6E                    6 	.word SHOW_IDX 
      002437                       6424 	_dict_entry,4,SAVE,SAVE_IDX;save
      00A0EC 20 64                    1 	.word LINK 
                           002439     2 	LINK=.
      002439                          3 SAVE:
      00A0EE 69                       4 	.byte 4 	
      00A0EF 63 74 69 6F              5 	.ascii "SAVE"
      00A0F3 6E 61                    6 	.word SAVE_IDX 
      002440                       6425 	_dict_entry 3,RUN,RUN_IDX;run
      00A0F5 72 79                    1 	.word LINK 
                           002442     2 	LINK=.
      002442                          3 RUN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A0F7 0A                       4 	.byte 3 	
      00A0F8 00 55 4E                 5 	.ascii "RUN"
      00A0F9 00 98                    6 	.word RUN_IDX 
      002448                       6426 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A0F9 CD 90                    1 	.word LINK 
                           00244A     2 	LINK=.
      00244A                          3 RSHIFT:
      00A0FB CA                       4 	.byte 6+F_IFUNC 	
      00A0FC A1 01 27 03 CC 88        5 	.ascii "RSHIFT"
      00A102 FD 96                    6 	.word RSHIFT_IDX 
      00A103                       6427 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A103 85 CF                    1 	.word LINK 
                           002455     2 	LINK=.
      002455                          3 RND:
      00A105 00                       4 	.byte 3+F_IFUNC 	
      00A106 11 81 44                 5 	.ascii "RND"
      00A108 00 94                    6 	.word RND_IDX 
      00245B                       6428 	_dict_entry,6,RETURN,RET_IDX;return 
      00A108 CE 00                    1 	.word LINK 
                           00245D     2 	LINK=.
      00245D                          3 RETURN:
      00A10A 11                       4 	.byte 6 	
      00A10B 52 45 54 55 52 4E        5 	.ascii "RETURN"
      00A10B 53 A3                    6 	.word RET_IDX 
      002466                       6429 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A10D FF FF                    1 	.word LINK 
                           002468     2 	LINK=.
      002468                          3 RESTORE:
      00A10F 27                       4 	.byte 7 	
      00A110 01 5F A6 84 81 52 45     5 	.ascii "RESTORE"
      00A115 00 90                    6 	.word REST_IDX 
      002472                       6430 	_dict_entry 6,REMARK,REM_IDX;remark 
      00A115 CD 90                    1 	.word LINK 
                           002474     2 	LINK=.
      002474                          3 REMARK:
      00A117 C5                       4 	.byte 6 	
      00A118 A1 01 27 03 CC 88        5 	.ascii "REMARK"
      00A11E FD 85                    6 	.word REM_IDX 
      00247D                       6431 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A120 20 E9                    1 	.word LINK 
                           00247F     2 	LINK=.
      00A122                          3 REBOOT:
      00A122 CD                       4 	.byte 6 	
      00A123 90 CA A1 01 27 03        5 	.ascii "REBOOT"
      00A129 CC 88                    6 	.word RBT_IDX 
      002488                       6432 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A12B FD 85                    1 	.word LINK 
                           00248A     2 	LINK=.
      00248A                          3 READ:
      00A12D 4B                       4 	.byte 4+F_IFUNC 	
      00A12E 00 35 CC 50              5 	.ascii "READ"
      00A132 E0 9E                    6 	.word READ_IDX 
      002491                       6433 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A134 A4 3F                    1 	.word LINK 
                           002493     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      002493                          3 QKEY:
      00A136 95                       4 	.byte 4+F_IFUNC 	
      00A137 A3 00 FF 23              5 	.ascii "QKEY"
      00A13B 06 0C                    6 	.word QKEY_IDX 
      00249A                       6434 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00A13D 01 98                    1 	.word LINK 
                           00249C     2 	LINK=.
      00249C                          3 PRTI:
      00A13F 56                       4 	.byte 4+F_IFUNC 	
      00A140 20 F5 35 55              5 	.ascii "PRTI"
      00A144 50 E0                    6 	.word PRTI_IDX 
      0024A3                       6435 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00A146 84 C7                    1 	.word LINK 
                           0024A5     2 	LINK=.
      0024A5                          3 PRTH:
      00A148 50                       4 	.byte 4+F_IFUNC 	
      00A149 E1 9F 4A 35              5 	.ascii "PRTH"
      00A14D 55 50                    6 	.word PRTH_IDX 
      0024AC                       6436 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00A14F E0 C7                    1 	.word LINK 
                           0024AE     2 	LINK=.
      0024AE                          3 PRTG:
      00A151 50                       4 	.byte 4+F_IFUNC 	
      00A152 E2 35 AA 50              5 	.ascii "PRTG"
      00A156 E0 81                    6 	.word PRTG_IDX 
      00A158                       6437 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00A158 35 AA                    1 	.word LINK 
                           0024B7     2 	LINK=.
      0024B7                          3 PRTF:
      00A15A 50                       4 	.byte 4+F_IFUNC 	
      00A15B E0 81 54 46              5 	.ascii "PRTF"
      00A15D 00 80                    6 	.word PRTF_IDX 
      0024BE                       6438 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00A15D CD 90                    1 	.word LINK 
                           0024C0     2 	LINK=.
      0024C0                          3 PRTE:
      00A15F C5                       4 	.byte 4+F_IFUNC 	
      00A160 A1 01 27 03              5 	.ascii "PRTE"
      00A164 CC 88                    6 	.word PRTE_IDX 
      0024C7                       6439 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00A166 FD 85                    1 	.word LINK 
                           0024C9     2 	LINK=.
      00A168                          3 PRTD:
      00A168 5D                       4 	.byte 4+F_IFUNC 	
      00A169 27 0A A6 0F              5 	.ascii "PRTD"
      00A16D 59 25                    6 	.word PRTD_IDX 
      0024D0                       6440 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00A16F 03 4A                    1 	.word LINK 
                           0024D2     2 	LINK=.
      0024D2                          3 PRTC:
      00A171 20                       4 	.byte 4+F_IFUNC 	
      00A172 FA 5F 97 A6              5 	.ascii "PRTC"
      00A176 84 81                    6 	.word PRTC_IDX 
      00A178                       6441 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00A178 CD 90                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                           0024DB     2 	LINK=.
      0024DB                          3 PRTB:
      00A17A C5                       4 	.byte 4+F_IFUNC 	
      00A17B A1 01 27 03              5 	.ascii "PRTB"
      00A17F CC 88                    6 	.word PRTB_IDX 
      0024E2                       6442 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00A181 FD 85                    1 	.word LINK 
                           0024E4     2 	LINK=.
      0024E4                          3 PRTA:
      00A183 9F                       4 	.byte 4+F_IFUNC 	
      00A184 A4 0F 5F 5C              5 	.ascii "PRTA"
      00A188 4D 27                    6 	.word PRTA_IDX 
      0024EB                       6443 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A18A 04 58                    1 	.word LINK 
                           0024ED     2 	LINK=.
      0024ED                          3 PRINT:
      00A18C 4A                       4 	.byte 5 	
      00A18D 20 F9 A6 84 81           5 	.ascii "PRINT"
      00A192 00 74                    6 	.word PRT_IDX 
      0024F5                       6444 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A192 CD 90                    1 	.word LINK 
                           0024F7     2 	LINK=.
      0024F7                          3 POUT:
      00A194 C5                       4 	.byte 4+F_IFUNC 	
      00A195 A1 01 27 03              5 	.ascii "POUT"
      00A199 CC 88                    6 	.word POUT_IDX 
      0024FE                       6445 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A19B FD 85                    1 	.word LINK 
                           002500     2 	LINK=.
      002500                          3 POKE:
      00A19D 53                       4 	.byte 4 	
      00A19E A6 84 81 45              5 	.ascii "POKE"
      00A1A1 00 70                    6 	.word POKE_IDX 
      002507                       6446 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A1A1 85 52                    1 	.word LINK 
                           002509     2 	LINK=.
      002509                          3 PINP:
      00A1A3 04                       4 	.byte 4+F_IFUNC 	
      00A1A4 89 90 CE 00              5 	.ascii "PINP"
      00A1A8 05 17                    6 	.word PINP_IDX 
      002510                       6447 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A1AA 03 90                    1 	.word LINK 
                           002512     2 	LINK=.
      002512                          3 PEEK:
      00A1AC CE                       4 	.byte 4+F_IFUNC 	
      00A1AD 00 01 17 05              5 	.ascii "PEEK"
      00A1B1 72 5C                    6 	.word PEEK_IDX 
      002519                       6448 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A1B3 00 21                    1 	.word LINK 
                           00251B     2 	LINK=.
      00251B                          3 PMODE:
      00A1B5 81                       4 	.byte 5 	
      00A1B6 50 4D 4F 44 45           5 	.ascii "PMODE"
      00A1B6 72 5D                    6 	.word PMODE_IDX 
      002523                       6449 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A1B8 00 21                    1 	.word LINK 
                           002525     2 	LINK=.
      002525                          3 PAUSE:
      00A1BA 26                       4 	.byte 5 	
      00A1BB 03 CC 88 FD 45           5 	.ascii "PAUSE"
      00A1BF 00 68                    6 	.word PAUSE_IDX 
      00252D                       6450 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A1BF CD 92                    1 	.word LINK 
                           00252F     2 	LINK=.
      00252F                          3 PAD:
      00A1C1 15                       4 	.byte 3+F_IFUNC 	
      00A1C2 A1 84 27                 5 	.ascii "PAD"
      00A1C5 03 CC                    6 	.word PAD_IDX 
      002535                       6451 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A1C7 88 FD                    1 	.word LINK 
                           002537     2 	LINK=.
      00A1C9                          3 OR:
      00A1C9 5D                       4 	.byte 2+F_IFUNC 	
      00A1CA 26 10                    5 	.ascii "OR"
      00A1CC 1E 03                    6 	.word OR_IDX 
      00253C                       6452 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00A1CE CF 00                    1 	.word LINK 
                           00253E     2 	LINK=.
      00253E                          3 ODR:
      00A1D0 05                       4 	.byte 3+F_IFUNC 	
      00A1D1 E6 02 C7                 5 	.ascii "ODR"
      00A1D4 00 04                    6 	.word ODR_IDX 
      002544                       6453 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A1D6 1E 05                    1 	.word LINK 
                           002546     2 	LINK=.
      002546                          3 NOT:
      00A1D8 CF                       4 	.byte 3+F_IFUNC 	
      00A1D9 00 01 81                 5 	.ascii "NOT"
      00A1DC 00 60                    6 	.word NOT_IDX 
      00254C                       6454 	_dict_entry,3,NEW,NEW_IDX;new
      00A1DC 85 5B                    1 	.word LINK 
                           00254E     2 	LINK=.
      00254E                          3 NEW:
      00A1DE 04                       4 	.byte 3 	
      00A1DF 72 5A 00                 5 	.ascii "NEW"
      00A1E2 21 FC                    6 	.word NEW_IDX 
      00A1E4                       6455 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A1E4 AE 00                    1 	.word LINK 
                           002556     2 	LINK=.
      002556                          3 NEXT:
      00A1E6 00                       4 	.byte 4 	
      00A1E7 A6 84 81 54              5 	.ascii "NEXT"
      00A1EA 00 5C                    6 	.word NEXT_IDX 
      00255D                       6456 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00A1EA AE 00                    1 	.word LINK 
                           00255F     2 	LINK=.
      00255F                          3 MULDIV:
      00A1EC 01                       4 	.byte 6+F_IFUNC 	
      00A1ED A6 84 81 44 49 56        5 	.ascii "MULDIV"
      00A1F0 00 5A                    6 	.word MULDIV_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      002568                       6457 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00A1F0 AE 00                    1 	.word LINK 
                           00256A     2 	LINK=.
      00256A                          3 LSHIFT:
      00A1F2 02                       4 	.byte 6+F_IFUNC 	
      00A1F3 A6 84 81 49 46 54        5 	.ascii "LSHIFT"
      00A1F6 00 58                    6 	.word LSHIFT_IDX 
      002573                       6458 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00A1F6 AE 00                    1 	.word LINK 
                           002575     2 	LINK=.
      002575                          3 LOG:
      00A1F8 03                       4 	.byte 3+F_IFUNC 	
      00A1F9 A6 84 81                 5 	.ascii "LOG"
      00A1FC 00 56                    6 	.word LOG_IDX 
      00257B                       6459 	_dict_entry,4,LOAD,LOAD_IDX;load 
      00A1FC AE 00                    1 	.word LINK 
                           00257D     2 	LINK=.
      00257D                          3 LOAD:
      00A1FE 04                       4 	.byte 4 	
      00A1FF A6 84 81 44              5 	.ascii "LOAD"
      00A202 00 54                    6 	.word LOAD_IDX 
      002584                       6460 	_dict_entry 4,LIST,LIST_IDX;list
      00A202 AE 00                    1 	.word LINK 
                           002586     2 	LINK=.
      002586                          3 LIST:
      00A204 05                       4 	.byte 4 	
      00A205 A6 84 81 54              5 	.ascii "LIST"
      00A208 00 52                    6 	.word LIST_IDX 
      00258D                       6461 	_dict_entry 3,LET,LET_IDX;let 
      00A208 AE 00                    1 	.word LINK 
                           00258F     2 	LINK=.
      00258F                          3 LET:
      00A20A 06                       4 	.byte 3 	
      00A20B A6 84 81                 5 	.ascii "LET"
      00A20E 00 50                    6 	.word LET_IDX 
      002595                       6462 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      00A20E AE 00                    1 	.word LINK 
                           002597     2 	LINK=.
      002597                          3 KEY:
      00A210 07                       4 	.byte 3+F_IFUNC 	
      00A211 A6 84 81                 5 	.ascii "KEY"
      00A214 00 4E                    6 	.word KEY_IDX 
      00259D                       6463 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00A214 AE 00                    1 	.word LINK 
                           00259F     2 	LINK=.
      00259F                          3 IWDGREF:
      00A216 08                       4 	.byte 7 	
      00A217 A6 84 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A21A 00 4C                    6 	.word IWDGREF_IDX 
      0025A9                       6464 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00A21A A6 84                    1 	.word LINK 
                           0025AB     2 	LINK=.
      0025AB                          3 IWDGEN:
      00A21C AE                       4 	.byte 6 	
      00A21D 00 00 81 47 45 4E        5 	.ascii "IWDGEN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A220 00 4A                    6 	.word IWDGEN_IDX 
      0025B4                       6465 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00A220 A6 84                    1 	.word LINK 
                           0025B6     2 	LINK=.
      0025B6                          3 INVERT:
      00A222 AE                       4 	.byte 6+F_IFUNC 	
      00A223 00 01 81 45 52 54        5 	.ascii "INVERT"
      00A226 00 48                    6 	.word INVERT_IDX 
      0025BF                       6466 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00A226 A6 84                    1 	.word LINK 
                           0025C1     2 	LINK=.
      0025C1                          3 INPUT:
      00A228 AE                       4 	.byte 5 	
      00A229 00 02 81 55 54           5 	.ascii "INPUT"
      00A22C 00 46                    6 	.word INPUT_IDX 
      0025C9                       6467 	_dict_entry,2,IF,IF_IDX;if 
      00A22C A6 84                    1 	.word LINK 
                           0025CB     2 	LINK=.
      0025CB                          3 IF:
      00A22E AE                       4 	.byte 2 	
      00A22F 00 03                    5 	.ascii "IF"
      00A231 81 44                    6 	.word IF_IDX 
      00A232                       6468 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00A232 A6 84                    1 	.word LINK 
                           0025D2     2 	LINK=.
      0025D2                          3 IDR:
      00A234 AE                       4 	.byte 3+F_IFUNC 	
      00A235 00 04 81                 5 	.ascii "IDR"
      00A238 00 42                    6 	.word IDR_IDX 
      0025D8                       6469 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00A238 A6 84                    1 	.word LINK 
                           0025DA     2 	LINK=.
      0025DA                          3 HEX:
      00A23A AE                       4 	.byte 3 	
      00A23B 00 01 81                 5 	.ascii "HEX"
      00A23E 00 40                    6 	.word HEX_IDX 
      0025E0                       6470 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00A23E A6 84                    1 	.word LINK 
                           0025E2     2 	LINK=.
      0025E2                          3 GPIO:
      00A240 AE                       4 	.byte 4+F_IFUNC 	
      00A241 00 00 81 4F              5 	.ascii "GPIO"
      00A244 00 3E                    6 	.word GPIO_IDX 
      0025E9                       6471 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00A244 A6 84                    1 	.word LINK 
                           0025EB     2 	LINK=.
      0025EB                          3 GOTO:
      00A246 AE                       4 	.byte 4 	
      00A247 40 00 81 4F              5 	.ascii "GOTO"
      00A24A 00 3C                    6 	.word GOTO_IDX 
      0025F2                       6472 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00A24A 55 00                    1 	.word LINK 
                           0025F4     2 	LINK=.
      0025F4                          3 GOSUB:
      00A24C 04                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A24D 00 02 81 55 42           5 	.ascii "GOSUB"
      00A250 00 3A                    6 	.word GOSUB_IDX 
      0025FC                       6473 	_dict_entry,6,FORGET,FORGET_IDX;forget 
      00A250 CD 91                    1 	.word LINK 
                           0025FE     2 	LINK=.
      0025FE                          3 FORGET:
      00A252 C9                       4 	.byte 6 	
      00A253 A1 84 27 03 CC 88        5 	.ascii "FORGET"
      00A259 FD CD                    6 	.word FORGET_IDX 
      002607                       6474 	_dict_entry,3,FOR,FOR_IDX;for 
      00A25B 84 82                    1 	.word LINK 
                           002609     2 	LINK=.
      002609                          3 FOR:
      00A25D 5D                       4 	.byte 3 	
      00A25E 26 05 A6                 5 	.ascii "FOR"
      00A261 05 CC                    6 	.word FOR_IDX 
      00260F                       6475 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00A263 88 FF                    1 	.word LINK 
                           002611     2 	LINK=.
      00A265                          3 FCPU:
      00A265 90                       4 	.byte 4 	
      00A266 93 EE 04 A3              5 	.ascii "FCPU"
      00A26A A2 4A                    6 	.word FCPU_IDX 
      002618                       6476 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00A26C 26 F2                    1 	.word LINK 
                           00261A     2 	LINK=.
      00261A                          3 EEPROM:
      00A26E 90                       4 	.byte 6+F_IFUNC 	
      00A26F CF 00 07 90 E6 02        5 	.ascii "EEPROM"
      00A275 C7 00                    6 	.word EEPROM_IDX 
      002623                       6477 	_dict_entry,3,END,END_IDX;cmd_end  
      00A277 0A 35                    1 	.word LINK 
                           002625     2 	LINK=.
      002625                          3 END:
      00A279 06                       4 	.byte 3 	
      00A27A 00 09 81                 5 	.ascii "END"
      00A27D 00 30                    6 	.word END_IDX 
      00262B                       6478 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00A27D 72 5F                    1 	.word LINK 
                           00262D     2 	LINK=.
      00262D                          3 DWRITE:
      00A27F 00                       4 	.byte 6+F_CMD 	
      00A280 07 72 5F 00 08 72        5 	.ascii "DWRITE"
      00A286 5F 00                    6 	.word DWRITE_IDX 
      002636                       6479 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00A288 09 72                    1 	.word LINK 
                           002638     2 	LINK=.
      002638                          3 DREAD:
      00A28A 5F                       4 	.byte 5+F_IFUNC 	
      00A28B 00 0A CE 00 1D           5 	.ascii "DREAD"
      00A290 00 2C                    6 	.word DREAD_IDX 
      002640                       6480 	_dict_entry,2,DO,DO_IDX;do_loop
      00A290 C3 00                    1 	.word LINK 
                           002642     2 	LINK=.
      002642                          3 DO:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A292 1F                       4 	.byte 2 	
      00A293 24 1B                    5 	.ascii "DO"
      00A295 90 93                    6 	.word DO_IDX 
      002647                       6481 	_dict_entry,3,DIR,DIR_IDX;directory 
      00A297 EE 04                    1 	.word LINK 
                           002649     2 	LINK=.
      002649                          3 DIR:
      00A299 1C                       4 	.byte 3 	
      00A29A A7 84 FE                 5 	.ascii "DIR"
      00A29D A3 A2                    6 	.word DIR_IDX 
      00264F                       6482 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00A29F 4A 26                    1 	.word LINK 
                           002651     2 	LINK=.
      002651                          3 DEC:
      00A2A1 1A                       4 	.byte 3 	
      00A2A2 90 CF 00                 5 	.ascii "DEC"
      00A2A5 07 90                    6 	.word DEC_IDX 
      002657                       6483 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00A2A7 E6 02                    1 	.word LINK 
                           002659     2 	LINK=.
      002659                          3 DDR:
      00A2A9 C7                       4 	.byte 3+F_IFUNC 	
      00A2AA 00 0A 35                 5 	.ascii "DDR"
      00A2AD 06 00                    6 	.word DDR_IDX 
      00265F                       6484 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      00A2AF 09 72                    1 	.word LINK 
                           002661     2 	LINK=.
      002661                          3 DATALN:
      00A2B1 5D                       4 	.byte 6 	
      00A2B2 00 0A 26 05 A6 0C        5 	.ascii "DATALN"
      00A2B8 CC 88                    6 	.word DATALN_IDX 
      00266A                       6485 	_dict_entry,4,DATA,DATA_IDX;data  
      00A2BA FF 81                    1 	.word LINK 
                           00266C     2 	LINK=.
      00A2BC                          3 DATA:
      00A2BC 93                       4 	.byte 4 	
      00A2BD E6 02 C7 00              5 	.ascii "DATA"
      00A2C1 0E 72                    6 	.word DATA_IDX 
      002673                       6486 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00A2C3 5F 00                    1 	.word LINK 
                           002675     2 	LINK=.
      002675                          3 CRL:
      00A2C5 0D                       4 	.byte 3+F_IFUNC 	
      00A2C6 72 BB 00                 5 	.ascii "CRL"
      00A2C9 0D 20                    6 	.word CRL_IDX 
      00267B                       6487 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00A2CB C4 75                    1 	.word LINK 
                           00267D     2 	LINK=.
      00A2CC                          3 CRH:
      00A2CC 52                       4 	.byte 3+F_IFUNC 	
      00A2CD 06 52 48                 5 	.ascii "CRH"
      00A2CE 00 1C                    6 	.word CRH_IDX 
      002683                       6488 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00A2CE C6 00                    1 	.word LINK 
                           002685     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      002685                          3 CHAR:
      00A2D0 09                       4 	.byte 4+F_CFUNC 	
      00A2D1 C1 00 0A 27              5 	.ascii "CHAR"
      00A2D5 37 CD                    6 	.word CHAR_IDX 
      00268C                       6489 	_dict_entry,3,BYE,BYE_IDX;bye 
      00A2D7 96 1C                    1 	.word LINK 
                           00268E     2 	LINK=.
      00268E                          3 BYE:
      00A2D9 CE                       4 	.byte 3 	
      00A2DA 00 07 CF                 5 	.ascii "BYE"
      00A2DD 00 05                    6 	.word BYE_IDX 
      002694                       6490 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00A2DF 55 00                    1 	.word LINK 
                           002696     2 	LINK=.
      002696                          3 BTOGL:
      00A2E1 09                       4 	.byte 5 	
      00A2E2 00 02 55 00 0A           5 	.ascii "BTOGL"
      00A2E7 00 04                    6 	.word BTOGL_IDX 
      00269E                       6491 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00A2E9 CD 91                    1 	.word LINK 
                           0026A0     2 	LINK=.
      0026A0                          3 BTEST:
      00A2EB C9                       4 	.byte 5+F_IFUNC 	
      00A2EC A1 84 27 03 CC           5 	.ascii "BTEST"
      00A2F1 88 FD                    6 	.word BTEST_IDX 
      00A2F3                       6492 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00A2F3 1F 05                    1 	.word LINK 
                           0026AA     2 	LINK=.
      0026AA                          3 BSET:
      00A2F5 CD                       4 	.byte 4 	
      00A2F6 89 EF CE 00              5 	.ascii "BSET"
      00A2FA 05 CF                    6 	.word BSET_IDX 
      0026B1                       6493 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00A2FC 00 07                    1 	.word LINK 
                           0026B3     2 	LINK=.
      0026B3                          3 BRES:
      00A2FE 55                       4 	.byte 4 	
      00A2FF 00 02 00 09              5 	.ascii "BRES"
      00A303 CD 96                    6 	.word BRES_IDX 
      0026BA                       6494 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00A305 2C 1E                    1 	.word LINK 
                           0026BC     2 	LINK=.
      0026BC                          3 BIT:
      00A307 05                       4 	.byte 3+F_IFUNC 	
      00A308 A6 84 5B                 5 	.ascii "BIT"
      00A30B 06 81                    6 	.word BIT_IDX 
      00A30D                       6495 	_dict_entry,3,AWU,AWU_IDX;awu 
      00A30D 90 CE                    1 	.word LINK 
                           0026C4     2 	LINK=.
      0026C4                          3 AWU:
      00A30F 00                       4 	.byte 3 	
      00A310 07 72 5F                 5 	.ascii "AWU"
      00A313 00 07                    6 	.word AWU_IDX 
      0026CA                       6496 	_dict_entry,7,AUTORUN,AUTORUN_IDX;autorun
      00A315 72 5F                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                           0026CC     2 	LINK=.
      0026CC                          3 AUTORUN:
      00A317 00                       4 	.byte 7 	
      00A318 08 72 5F 00 09 72 5F     5 	.ascii "AUTORUN"
      00A31F 00 0A                    6 	.word AUTORUN_IDX 
      0026D6                       6497 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00A321 CD A2                    1 	.word LINK 
                           0026D8     2 	LINK=.
      0026D8                          3 ASC:
      00A323 BC                       4 	.byte 3+F_IFUNC 	
      00A324 20 A8 43                 5 	.ascii "ASC"
      00A326 00 08                    6 	.word ASC_IDX 
      0026DE                       6498 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00A326 CD 90                    1 	.word LINK 
                           0026E0     2 	LINK=.
      0026E0                          3 AND:
      00A328 CA                       4 	.byte 3+F_IFUNC 	
      00A329 A1 02 27                 5 	.ascii "AND"
      00A32C 03 CC                    6 	.word AND_IDX 
      0026E6                       6499 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00A32E 88 FD                    1 	.word LINK 
                           0026E8     2 	LINK=.
      00A330                          3 ADCREAD:
      00A330 72                       4 	.byte 7+F_IFUNC 	
      00A331 12 50 C7 85 5D 27 21     5 	.ascii "ADCREAD"
      00A338 85 A6                    6 	.word ADCREAD_IDX 
      0026F2                       6500 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00A33A 08 42                    1 	.word LINK 
                           0026F4     2 	LINK=.
      0026F4                          3 ADCON:
      00A33C 9F                       4 	.byte 5 	
      00A33D C7 52 00 72 1A           5 	.ascii "ADCON"
      00A342 50 14                    6 	.word ADCON_IDX 
      0026FC                       6501 kword_dict:
      0026FC                       6502 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00A344 72 1A                    1 	.word LINK 
                           0026FE     2 	LINK=.
      0026FE                          3 ABS:
      00A346 50                       4 	.byte 3+F_IFUNC 	
      00A347 16 72 14                 5 	.ascii "ABS"
      00A34A 52 00                    6 	.word ABS_IDX 
                                   6503 
                                   6504 ;comands and fonctions address table 	
      002704                       6505 code_addr:
      00A34C 72 12 52 01 72 10 52  6506 	.word abs,power_adc,analog_read,bit_and,ascii,autorun,awu,bitmask ; 0..7
             01 72 1C 52 00 81 47
             20 F8
      00A359 16 63 16 53 16 84 16  6507 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             74 1D C5 1D 2A 21 B2
      00A359 5B 02 A6 82 C4 52 03  6508 	.word const_cr1,data,data_line,const_ddr,dec_base,directory,do_loop,digital_read,digital_write ;16..23 
             A1 02 26 F7 72 1D 52
             00 72 13 50
      00A36B C7 72 1B 50 16 81 16  6509 	.word cmd_end,const_eeprom_base,fcpu,for,forget,gosub,goto,gpio ; 24..31 
             DF 1C 0A 17 DA 17 BF
             1D 78
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A371 12 2E 21 A0 16 CB 15  6510 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             BC 21 12 20 A2 20 D8
             1D 63
      00A371 A6 78 C5 52 03 27 04  6511 	.word let,list,load,log2,lshift,muldiv,next,new ; 40..47
             72 5F 52 03 81 17 5F
             19 EC
      00A37D 20 95 21 9A 1E C2 23  6512 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             5D 1E 34 1F 30 16 BA
             21 BE
      00A37D 88 CD A3 71 84 72 03  6513 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             52 03 FB C7 52 04 72
             01 52
      00A38D 03 FB C6 52 04 81 21  6514 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             94 1D 6B 22 4C 05 DA
             16 28
      00A393 21 FD 17 FA 1F AC 1F  6515 	.word restore,return, random,rshift,run,save,show,size ; 72..79
             0B 18 18 1A DD 11 ED
             12 38
      00A393 A6 FF 72 01 52 03 E3  6516 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             C6 52 04 81 38 19 A0
             1E 90
      00A39E 20 79 20 88 17 08 18  6517 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             81 12 42 1D A2 21 36
             1D A8
      00A39E CD 91 C9 A1 84 27 03  6518 	.word wait,words,write,bit_xor ; 96..103 
             CC
      00A3A6 88 FD                 6519 	.word 0 
                                   6520 
      00A3A8                       6521 	.bndry 128 ; align on FLASH block.
                                   6522 ; free space for user application  
      002800                       6523 user_space:
                                   6524 ; USR() function test
      00A3A8 9F               [ 2] 6525 	pushw x 
      00A3A9 CD A3 7D CD      [ 1] 6526 	bset PC_ODR,#5 
      00A3AD 89               [ 2] 6527 	popw x 
      00A3AE EF A1 09         [ 4] 6528 	call pause02 
      00A3B1 26 02 20 E9      [ 1] 6529 	bres PC_ODR,#5 
      00A3B5 4D               [ 4] 6530 	ret
                                   6531 
                                   6532 	.area FLASH_DRIVE (ABS)
      010000                       6533 	.org 0x10000
      010000                       6534 fdrive:
                                   6535 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        0026FE R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   5 ADCON      0026F4 R
    ADCON_ID=  000002     |   5 ADCREAD    0026E8 R   |     ADCREAD_=  000004 
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
  5 AND        0026E0 R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |   5 ASC        0026D8 R   |     ASC_IDX =  000008 
    ATTRIB  =  000002     |   5 AUTORUN    0026CC R   |     AUTORUN_=  00000A 
    AUTORUN_=  004000     |   5 AWU        0026C4 R   |   5 AWUHandl   000001 R
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
    BELL    =  000007     |     BINARY  =  000001     |   5 BIT        0026BC R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000E 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   5 BRES       0026B3 R   |     BRES_IDX=  000010 
    BS      =  000008     |     BSAVE   =  000001     |   5 BSET       0026AA R
    BSET_IDX=  000012     |     BSIZE   =  000001     |   5 BTEST      0026A0 R
    BTEST_ID=  000014     |   5 BTOGL      002696 R   |     BTOGL_ID=  000016 
    BTW     =  000001     |   5 BYE        00268E R   |     BYE_IDX =  000018 
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
    CFG_GCR_=  000000     |   5 CHAR       002685 R   |     CHAR_IDX=  00001A 
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
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
    CNTR    =  000003     |     COMMA   =  000001     |     COUNT   =  000001 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  5 CRH        00267D R   |     CRH_IDX =  00001C     |   5 CRL        002675 R
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
  5 DATA       00266C R   |   5 DATALN     002661 R   |     DATALN_I=  000022 
    DATA_IDX=  000020     |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |     DBL     =  000003 
    DBLDIVDN=  000006     |     DBLHI   =  000001     |     DBLLO   =  000003 
    DBL_SIZE=  000004     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |   5 DDR        002659 R
    DDR_IDX =  000024     |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |     DEBUG_PR=  000001     |   5 DEC        002651 R
    DEC_IDX =  000026     |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        002649 R   |     DIR_IDX =  000028 
    DIVDNDHI=  00000B     |     DIVDNDLO=  00000D     |     DIVISOR =  000001 
    DIVISR  =  000007     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   5 DO         002642 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  00002A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

  5 DREAD      002638 R   |     DREAD_ID=  00002C     |   5 DWRITE     00262D R
    DWRITE_I=  00002E     |   5 EEPROM     00261A R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  000032     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        002625 R   |     END_IDX =  000030 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FAUTORUN=  000006     |     FBREAK  =  000004     |     FCOMP   =  000005 
  5 FCPU       002611 R   |     FCPU_IDX=  000034     |     FF      =  00000C 
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
  5 FOR        002609 R   |   5 FORGET     0025FE R   |     FORGET_I=  000038 
    FOR_IDX =  000036     |     FRUN    =  000000     |     FS      =  00001C 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   5 GOSUB      0025F4 R
    GOSUB_ID=  00003A     |   5 GOTO       0025EB R   |     GOTO_IDX=  00003C 
  5 GPIO       0025E2 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_IDX=  00003E     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   5 HEX        0025DA R   |     HEX_IDX =  000040 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

    I2C_SR1_=  000002     |     I2C_SR1_=  000006     |     I2C_SR1_=  000000 
    I2C_SR1_=  000004     |     I2C_SR1_=  000007     |     I2C_SR2 =  005218 
    I2C_SR2_=  000002     |     I2C_SR2_=  000001     |     I2C_SR2_=  000000 
    I2C_SR2_=  000003     |     I2C_SR2_=  000005     |     I2C_SR3 =  005219 
    I2C_SR3_=  000001     |     I2C_SR3_=  000007     |     I2C_SR3_=  000004 
    I2C_SR3_=  000000     |     I2C_SR3_=  000002     |     I2C_TRIS=  00521D 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_WRIT=  000000     |   5 IDR        0025D2 R   |     IDR_IDX =  000042 
  5 IF         0025CB R   |     IF_IDX  =  000044     |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   5 INPUT      0025C1 R
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
  5 INVERT     0025B6 R   |     INVERT_I=  000048     |     INW     =  000009 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     0025AB R
    IWDGEN_I=  00004A     |   5 IWDGREF    00259F R   |     IWDGREF_=  00004C 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        002597 R   |     KEY_IDX =  00004E     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   5 LET        00258F R
    LET_IDX =  000050     |     LF      =  00000A     |     LIMIT   =  000005 
    LINENO  =  000005     |   5 LINK    =  0026FE R   |   5 LIST       002586 R
    LIST_IDX=  000052     |     LL      =  000001     |     LLEN    =  000002 
    LN_PTR  =  000005     |   5 LOAD       00257D R   |     LOAD_IDX=  000054 
  5 LOG        002575 R   |     LOG_IDX =  000056     |   5 LSHIFT     00256A R
    LSHIFT_I=  000058     |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
  5 MULDIV     00255F R   |     MULDIV_I=  00005A     |     MULOP   =  000003 
    N1      =  000001     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        00254E R   |     NEW_FREE=  000001     |     NEW_IDX =  00005E 
  5 NEXT       002556 R   |     NEXT_IDX=  00005C     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

    NOPTBL  =  00487F     |   5 NOT        002546 R   |     NOT_IDX =  000060 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000000 R   |   5 ODR        00253E R   |     ODR_IDX =  000062 
    ONOFF   =  000003     |     OP      =  000003     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         002537 R   |     OR_IDX  =  000064     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |   5 PAD        00252F R   |     PAD_IDX =  000066 
    PAD_SIZE=  000080     |   5 PAUSE      002525 R   |     PAUSE_ID=  000068 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       002512 R   |     PEEK_IDX=  00006C 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   5 PINP       002509 R
    PINP_IDX=  00006E     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      00251B R
    PMODE_ID=  00006A     |   5 POKE       002500 R   |     POKE_IDX=  000070 
    PORT    =  000003     |   5 POUT       0024F7 R   |     POUT_IDX=  000072 
    PREV    =  000001     |   5 PRINT      0024ED R   |   5 PRTA       0024E4 R
    PRTA_IDX=  000076     |   5 PRTB       0024DB R   |     PRTB_IDX=  000078 
  5 PRTC       0024D2 R   |     PRTC_IDX=  00007A     |   5 PRTD       0024C9 R
    PRTD_IDX=  00007C     |   5 PRTE       0024C0 R   |     PRTE_IDX=  00007E 
  5 PRTF       0024B7 R   |     PRTF_IDX=  000080     |   5 PRTG       0024AE R
    PRTG_IDX=  000082     |   5 PRTH       0024A5 R   |     PRTH_IDX=  000084 
  5 PRTI       00249C R   |     PRTI_IDX=  000086     |     PRT_IDX =  000074 
    PSTR    =  000003     |   5 QKEY       002493 R   |     QKEY_IDX=  000088 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
    RBT_IDX =  00008C     |   5 READ       00248A R   |     READ_IDX=  00008A 
  5 REBOOT     00247F R   |     REG     =  000001     |     REGA    =  000001 
    REGX    =  000003     |     REGY    =  000005     |     RELOP   =  000003 
  5 REMARK     002474 R   |     REM_IDX =  00008E     |   5 RESTORE    002468 R
    REST_IDX=  000090     |     RETL1   =  000001     |   5 RETURN     00245D R
    RET_ADDR=  000003     |     RET_IDX =  000092     |     RET_INW =  000005 
  5 RND        002455 R   |     RND_IDX =  000094     |     ROP     =  004800 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

    RS      =  00001E     |   5 RSHIFT     00244A R   |     RSHIFT_I=  000096 
    RST_SR  =  0050B3     |   5 RUN        002442 R   |     RUN_IDX =  000098 
    RX_QUEUE=  000008     |   5 SAVE       002439 R   |     SAVEB   =  000002 
    SAVE_IDX=  00009A     |     SDIVSR  =  000005     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       002430 R
    SHOW_IDX=  00009C     |     SI      =  00000F     |     SIGN    =  000001 
  5 SIZE       002427 R   |     SIZE_IDX=  00009E     |     SKIP    =  000005 
  5 SLEEP      00241D R   |     SLEEP_ID=  0000A0     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   5 SPIEN      002409 R
    SPIEN_ID=  0000A4     |   5 SPIRD      002413 R   |     SPIRD_ID=  0000A2 
  5 SPISEL     0023FE R   |     SPISEL_I=  0000A6     |   5 SPIWR      0023F4 R
    SPIWR_ID=  0000A8     |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
    STACK_SI=  0000A0     |   5 STEP       0023EB R   |     STEP_IDX=  0000AA 
  5 STOP       0023E2 R   |     STOP_IDX=  0000AC     |     STR     =  000003 
    STX     =  000002     |     SUB     =  00001A     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      0023D8 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   5 TIMEOUT    0023C2 R
  5 TIMER      0023CE R   |     TIMER_ID=  0000B0     |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_ARRAY=  000006     |     TK_CFUNC=  000082 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

    TK_CHAR =  000003     |     TK_CMD  =  000080     |     TK_COLON=  000001 
    TK_COMMA=  000009     |     TK_CONST=  000083     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000081 
    TK_INTGR=  000084     |     TK_LE   =  000036     |     TK_LPARE=  000007 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  000002     |     TK_RPARE=  000008 
    TK_SHARP=  00000A     |     TK_VAR  =  000085     |     TMROUT_I=  0000B2 
  5 TO         0023BB R   |   5 TONE       0023B2 R   |     TONE_IDX=  0000B6 
    TO_IDX  =  0000B4     |   5 Timer4Up   00004F R   |     U1      =  000001 
    U8      =  000003     |     UART1   =  000000     |     UART1_BA=  005230 
    UART1_BR=  005232     |     UART1_BR=  005233     |     UART1_CR=  005234 
    UART1_CR=  005235     |     UART1_CR=  005236     |     UART1_CR=  005237 
    UART1_CR=  005238     |     UART1_DR=  005231     |     UART1_GT=  005239 
    UART1_PO=  000000     |     UART1_PS=  00523A     |     UART1_RX=  000004 
    UART1_SR=  005230     |     UART1_TX=  000005     |     UART3   =  000001 
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
  5 UBOUND     0023A7 R   |     UBOUND_I=  0000B8     |   5 UBTN_Han   000092 R
  5 UFLASH     00239C R   |     UFLASH_I=  0000BA     |   5 UNTIL      002392 R
    UNTIL_ID=  0000BC     |     US      =  00001F     |   5 USER_ABO   00009A R
  5 USR        00238A R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000BE     |   5 Uart1RxH   00000F R
  5 UserButt   000065 R   |     VAR_ADDR=  000006     |     VSIZ    =  000002 
    VSIZE   =  000006     |     VT      =  00000B     |   5 WAIT       002381 R
    WAIT_IDX=  0000C0     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      002377 R   |     WORDS_ID=  0000C2     |   5 WRITE      00236D R
    WRITE_ID=  0000C4     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   5 XOR        002365 R   |     XOR_IDX =  0000C6 
    XREG    =  000003     |     XSAVE   =  000005     |     YSAVE   =  000007 
  5 abs        001E96 R   |   1 acc16      00000C GR  |   1 acc24      00000B GR
  1 acc8       00000D GR  |   5 add_char   0014F6 R   |   5 add_spac   001320 R
  5 analog_r   001901 R   |   5 arduino_   001F8C R   |   5 arg_list   00104A R
  1 array_si   000021 R   |   5 ascii      001D3C R   |   5 at_tst     000CAE R
  5 atoi24     000DBF GR  |   5 atoi_exi   000E25 R   |   5 autorun    001DCE R
  5 autorun_   0006D4 R   |   5 awu        001E47 R   |   5 awu02      001E51 R
  5 bad_port   001D9D R   |   1 base       00000A R   |   1 basicptr   000004 GR
  5 beep       00188E R   |   5 beep_1kh   001878 GR  |   5 bin_exit   000B8C R
  5 bit_and    001EAA R   |   5 bit_or     001EC2 R   |   5 bit_rese   001663 R
  5 bit_set    001653 R   |   5 bit_test   001684 R   |   5 bit_togg   001674 R
  5 bit_xor    001EDA R   |   5 bitmask    0020F8 R   |   5 bkslsh_t   000C5B R
  5 block_er   0001BB R   |   5 break_po   0019CE R   |   5 bye        001DC5 R
  5 cancel_a   00069C R   |   5 char       001D2A R   |   5 clear_ba   0006E9 R
  5 clear_va   000563 R   |   5 clock_in   0000B5 R   |   5 cmd_end    001871 R
  5 cmd_line   000907 R   |   5 cmd_name   000FB9 R   |   5 cmp_name   001A6F R
  5 code_add   002704 R   |   5 cold_sta   0005DA R   |   5 colon_ts   000C82 R
  5 comma_ts   000C8D R   |   5 comp_msg   00085D R   |   5 compile    0004F0 R
  5 const_cr   0021AC R   |   5 const_cr   0021B2 R   |   5 const_dd   0021A6 R
  5 const_ee   0021C4 R   |   5 const_id   0021A0 R   |   5 const_in   0021BE R
  5 const_od   00219A R   |   5 const_ou   0021B8 R   |   5 const_po   002164 R
  5 const_po   00216A R   |   5 const_po   002170 R   |   5 const_po   002176 R
  5 const_po   00217C R   |   5 const_po   002182 R   |   5 const_po   002188 R
  5 const_po   00218E R   |   5 const_po   002194 R   |   5 convert_   000B03 R
  5 copy_com   000CE3 R   |   1 count      000003 GR  |   5 cp_loop    000FF9 R
  5 cpy_cmd_   00130B R   |   5 cpy_quot   001344 R   |   5 create_g   000453 R
  5 cs_high    002358 R   |   5 cstk_pro   001207 R   |   5 dash_tst   000CA3 R
  5 data       0021CA R   |   1 data_len   000009 R   |   5 data_lin   0021D0 R
  1 data_ofs   000008 R   |   1 data_ptr   000006 R   |   5 data_sea   002210 R
  5 dbl_sign   000F21 R   |   5 dec_base   001233 R   |   5 decomp_l   0013F5 R
  5 decompil   0013AE GR  |   5 del_line   000426 R   |   5 digital_   001935 R
  5 digital_   001965 R   |   5 dir_loop   001C7D R   |   5 director   001C71 R
  5 disk_fre   001A5C R   |   5 div32_16   000F2B R   |   5 divide     000F82 R
  5 divu24_8   000A46 R   |   5 dneg       000F16 R   |   5 do_loop    002121 R
  5 do_progr   0001AE R   |   5 drive_fr   001CE6 R   |   5 enable_i   0020A2 R
  5 eql_tst    000D38 R   |   5 equal      001509 R   |   5 erase_fl   0001DA R
  5 err_bad_   0007C9 R   |   5 err_buf_   00083F R   |   5 err_cmd_   00078D R
  5 err_div0   000752 R   |   5 err_dupl   0007A7 R   |   5 err_math   000739 R
  5 err_mem_   00071E R   |   5 err_msg    0006FE R   |   5 err_no_a   0007D5 R
  5 err_no_d   000808 R   |   5 err_no_f   00082C R   |   5 err_no_l   000761 R
  5 err_no_p   000818 R   |   5 err_not_   0007B8 R   |   5 err_run_   000777 R
  5 err_synt   00072B R   |   5 escaped    000B18 R   |   5 expect     001038 R
  5 expr_exi   001192 R   |   5 expressi   001149 R   |   5 factor     00109A R
  1 farptr     000016 R   |   5 fcpu       001F24 R   |   7 fdrive     010000 R
  1 ffree      000019 R   |   5 file_cou   001CDE R   |   5 first_li   0012B8 R
  1 flags      000023 R   |   5 for        0016DF R   |   5 forget     001C0A R
  1 free_ram   000063 R   |   5 func_arg   001045 R   |   5 func_not   002095 R
  5 ge         00150B R   |   5 get_arra   001075 R   |   5 get_cmd_   00138D R
  5 get_targ   0017A9 R   |   5 get_tick   001E90 R   |   5 get_toke   000BF4 R
  5 getc       0002C9 GR  |   5 gosub      0017DA R   |   5 goto       0017BF R
  5 gpio       001D78 R   |   5 gt         001507 R   |   5 gt_tst     000D43 R
  5 hex_base   00122E R   |   5 hex_dump   000359 R   |   5 if         0016CB R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

  5 incr_far   001A1C R   |   5 input_ex   001625 R   |   5 input_lo   0015BE R
  5 input_va   0015BC R   |   5 insert_l   00047F R   |   5 insert_l   0004ED R
  5 interp_l   000948 R   |   5 interpre   000923 R   |   5 invert     002112 R
  5 is_alnum   00058B R   |   5 is_alpha   000571 R   |   5 is_digit   000582 R
  5 itoa       0009EC R   |   5 itoa_loo   000A0B R   |   5 jp_to_ta   0017CD R
  5 key        001D63 R   |   5 kw_loop    000BA8 R   |   5 kword_di   0026FC R
  5 kword_en   002363 R   |   5 le         001510 R   |   5 leading_   0020E8 R
  5 let        001264 R   |   5 let_arra   001272 R   |   5 let_var    001275 R
  5 lines_sk   0012BB R   |   5 list       00128F R   |   5 list_exi   0012FD R
  5 list_loo   0012DB R   |   5 load       001BDA R   |   5 load_aut   0006AB R
  5 load_fil   001BA9 R   |   5 log2       0020DD R   |   5 logical_   00208B R
  5 long_div   000EFE R   |   5 loop_bac   00178C R   |   1 loop_dep   000020 R
  5 loop_don   0017A1 R   |   5 lshift     001EF2 R   |   5 lt         00150E R
  5 lt_tst     000D6C R   |   5 modulo     000F98 R   |   5 move       0003C0 GR
  5 move_dow   0003DE R   |   5 move_era   000140 R   |   5 move_exi   0003FF R
  5 move_loo   0003E3 R   |   5 move_prg   000174 R   |   5 move_up    0003D0 R
  5 mul_char   0014F8 R   |   5 muldiv     000F9D R   |   5 multiply   000EC9 R
  5 mulu24_8   000A6E R   |   5 nbr_tst    000C27 R   |   5 ne         001513 R
  5 neg_acc2   000AA8 R   |   5 new        0019EC R   |   5 next       00175F R
  5 next_lin   00092B R   |   5 next_tok   00096F R   |   5 no_match   00100B R
  5 other      000D95 R   |   3 pad        0016E0 R   |   5 pad_ref    00235D R
  5 parse_bi   000B6A R   |   5 parse_in   000B20 R   |   5 parse_ke   000BA7 R
  5 parse_qu   000ACB R   |   5 pause      001E34 R   |   5 pause02    001E3E R
  5 peek       0016BA R   |   5 pin_mode   001F30 R   |   5 plus_tst   000D0C R
  5 poke       0016AB R   |   5 power_ad   0018C5 R   |   5 prcnt_ts   000D2D R
  5 print      001536 R   |   5 print_ex   001590 R   |   5 print_in   0009D0 R
  5 printxy    000E3C R   |   5 program_   000154 R   |   5 program_   000174 R
  5 prt_basi   001516 R   |   5 prt_loop   00153A R   |   5 prt_tok    0002EB R
  5 prti24     0009E0 R   |   1 ptr16      000017 R   |   1 ptr8       000018 R
  5 putc       0002C0 GR  |     puts       ****** GX  |   5 qkey       001D6B GR
  5 qmark_ts   000CB9 R   |   5 random     001FAC R   |   5 read       00224C R
  5 read01     00224E R   |     readln     ****** GX  |   5 refresh_   0020D8 R
  5 rel_exit   0011EA R   |   5 relation   001195 R   |   5 relop_st   0014FB R
  5 remark     001628 R   |   5 reset_co   001538 R   |   5 rest_con   0015AC R
  5 restore    0021FD R   |   5 return     0017FA R   |   5 right_al   001332 R
  5 row_alig   001A01 R   |   5 row_eras   000119 R   |   5 row_eras   000140 R
  5 row_loop   00033C R   |   5 rparnt_t   000C77 R   |   5 rshift     001F0B R
  5 rt_msg     00084C R   |   5 run        001818 R   |   5 run_it     00184A R
  1 rx_head    00002D R   |   1 rx_queue   000025 R   |   1 rx_tail    00002E R
  5 save       001ADD R   |   5 save_con   00159C R   |   5 search_d   000FEB R
  5 search_e   001035 R   |   5 search_f   001A90 R   |   5 search_l   000402 GR
  5 search_l   00040A R   |   5 search_n   000FEF R   |   1 seedx      000012 R
  1 seedy      000014 R   |   5 seek_fdr   001A2A R   |   5 select_p   001F7C R
  5 set_time   002079 R   |   5 sharp_ts   000C98 R   |   5 show       0011ED R
  5 show_row   00032A R   |   5 single_c   0014F1 R   |   5 size       001238 R
  5 skip       000E29 R   |   5 slash_ts   000D22 R   |   5 sleep      001E29 R
  5 software   000594 R   |     spaces     ****** GX  |   5 spi_clea   0022F1 R
  5 spi_disa   0022D9 R   |   5 spi_enab   0022A6 R   |   5 spi_rcv_   002313 R
  5 spi_read   00233E R   |   5 spi_sele   002346 R   |   5 spi_send   0022FD R
  5 spi_writ   00231E R   |   3 stack_fu   001760 R   |   3 stack_un   001800 R
  5 star_tst   000D17 R   |   5 step       001738 R   |   5 stop       0019A0 R
  5 store_lo   00174C R   |   5 str_matc   001018 R   |   5 str_tst    000C17 R
  5 strcmp     0003A1 R   |   5 strcpy     0003B2 R   |   5 strlen     000396 GR
  5 syntax_e   00087D R   |   1 tab_widt   000024 R   |   5 tb_error   00087F R
  5 term       0010F7 R   |   5 term01     0010FF R   |   5 term_exi   001146 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

  3 tib        001690 GR  |   5 tick_tst   000CD1 R   |   1 ticks      00000E R
  5 timeout    002088 R   |   1 timer      000010 R   |   5 timer2_i   0000CB R
  5 timer4_i   0000D8 R   |   5 tk_id      00086D R   |   5 to         001708 R
  5 to_eepro   000197 R   |   5 to_flash   0001AB R   |   5 to_upper   000DB3 GR
  5 token_ch   000DAC R   |   5 token_ex   000DB0 R   |   5 token_ms   000322 R
  5 tone       001881 R   |   5 try_next   00223C R   |   1 txtbgn     00001C R
  1 txtend     00001E R   |   5 uart1_in   00027D R   |   5 uart1_se   00028D R
  5 ubound     001242 R   |   5 udiv32_1   000EEC R   |   5 uflash     001DA2 R
  5 umstar     000E8F R   |   5 unlock_e   0000ED R   |   5 unlock_f   000103 R
  5 until      002136 R   |   5 user_int   000078 R   |   5 user_spa   002800 R
  5 usr        001DA8 R   |   5 var_name   001385 R   |   1 vars       00002F R
  5 wait       00162E R   |   5 warm_ini   00067E R   |   5 warm_sta   000904 R
  5 words      002013 R   |   5 words_co   002063 R   |   5 write      001CF3 R
  5 write_bl   00025A R   |   5 write_by   0001E5 R   |   5 write_ee   000221 R
  5 write_ex   000255 R   |   5 write_fl   00020B R   |   5 write_ro   000188 R
  5 zero_pad   0019F6 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     63   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   280E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

